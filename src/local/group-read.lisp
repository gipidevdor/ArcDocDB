;;; OWNER: actor's immutable complete frame and exclusive fixed group workspace.
;;; SHARED: no engine call or capability; full validation precedes argument copies.
(in-package #:arcdocdb.local)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (b:octets b:index b:index cbor:spazio-cbor)
                         (values (integer 0 5) b:index b:u16 b:index b:index b:index b:index &optional)) %wire-group-operation))
(defun %wire-group-operation (buffer start end space)
  "Pre: minimal outer item scanned, immutable input. Post: one PUT/DELETE status and spans, no copy.
Shape errors are PROTOCOL-ERROR for the command boundary; key/document budget ->5, invalid document ->1."
  (multiple-value-bind (major fields cursor) (%wire-head buffer start end)
    (unless (= major 4) (%wire-fail :local-group-operation-shape start))
    (multiple-value-bind (opcode next) (%wire-uint buffer cursor end #xffff)
      (unless (and (member opcode '(1 3)) (= fields (if (= opcode 1) 3 2)))
        (%wire-fail :local-group-operation-shape start))
      (multiple-value-bind (ks kl after-key) (%wire-bstr buffer next end)
        (multiple-value-bind (ds dl finish)
            (if (= opcode 1) (%wire-bstr buffer after-key end) (values 0 0 after-key))
          (let ((status (cond ((zerop kl) 1) ((> kl +max-key-bytes+) 5)
                              ((= opcode 1) (%wire-document-status buffer ds finish space)) (t 0))))
            (values status finish opcode ks kl ds dl)))))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (b:octets envelope cbor:spazio-cbor local-group-workspace (integer 1 8))
                         (values (integer 0 5) (integer 0 8) &optional)) %wire-group-spans))
(defun %wire-group-spans (buffer envelope space work limit)
  "Pre: verified group REQUEST, fixed owner scratch. Post: all bounded member spans, never partial admission.
Zero count/shape ->1; count beyond the configured bound ->5. At most eight members, no copies."
  (let ((end (envelope-payload-end envelope)) (spans (local-group-workspace-spans work)))
    (multiple-value-bind (major count cursor) (%wire-head buffer (envelope-payload-start envelope) end)
      (unless (= major 4) (%wire-fail :local-group-array))
      (when (zerop count) (return-from %wire-group-spans (values 1 0)))
      (when (> count limit) (return-from %wire-group-spans (values 5 0)))
      (dotimes (i count)
        (multiple-value-bind (status next opcode ks kl ds dl) (%wire-group-operation buffer cursor end space)
          (unless (zerop status) (return-from %wire-group-spans (values status 0)))
          (let ((base (* i +group-span-words+)))
            (setf (aref spans (+ base +group-kind+)) opcode (aref spans (+ base +group-key-start+)) ks
                  (aref spans (+ base +group-key-size+)) kl (aref spans (+ base +group-doc-start+)) ds
                  (aref spans (+ base +group-doc-size+)) dl))
          (setf cursor next)))
      (unless (= cursor end) (%wire-fail :local-group-trailing cursor))
      (values 0 count))))

;;; REQ: REQ-IPC-002 REQ-WAL-002 REQ-AFF-008
(declaim (ftype (function (b:octets local-group-workspace (integer 1 8)) null) %wire-copy-group))
(defun %wire-copy-group (buffer work count)
  "Pre: complete validated spans, exclusive workspace. Post: bounded immutable engine descriptors and byte copies.
No CSN, engine admission or I/O; caller cleanup owns every incomplete copy exit."
  (let ((spans (local-group-workspace-spans work)) (operations (local-group-workspace-operations work)))
    (dotimes (i count)
      (let* ((base (* i +group-span-words+)) (put (= 1 (aref spans (+ base +group-kind+))))
             (key (%wire-copy buffer (aref spans (+ base +group-key-start+)) (aref spans (+ base +group-key-size+))))
             (doc (when put (%wire-copy buffer (aref spans (+ base +group-doc-start+)) (aref spans (+ base +group-doc-size+))))))
        (setf (svref operations i) (e:crea-operazione-scrittura (if put :put :delete) key doc))))) nil)

;;; REQ: REQ-IPC-002 REQ-WAL-002 REQ-LIM-003 REQ-AFF-004
(declaim (ftype (function (t t t t (integer 1 8)) (values (integer 0 5) (integer 0 8) &optional)) decode-local-write-group))
(defun decode-local-write-group (buffer envelope space work limit)
  "Pre: original immutable REQUEST and exclusive fixed scratch. Post: fully validated copies or status 1/5 with no references.
All validation precedes copies and engine admission. API errors ->INVALID-ARGUMENT; wrong kind/opcode ->PROTOCOL-ERROR.
Any incomplete copy/nonlocal exit clears the workspace and propagates; no member may be executed in isolation."
  (%wire-envelope-input buffer envelope)
  (unless (and (typep space 'cbor:spazio-cbor) (typep work 'local-group-workspace))
    (error 'arcdocdb.conditions:invalid-argument :reason :local-group-workspace))
  (unless (and (= 2 (envelope-kind envelope)) (= +local-write-group-opcode+ (envelope-code envelope)))
    (%wire-fail :local-group-request))
  (clear-local-group-workspace work)
  (let ((complete nil))
    (unwind-protect
         (handler-case
             (multiple-value-bind (status count) (%wire-group-spans buffer envelope space work limit)
               (if (zerop status)
                   (progn (%wire-copy-group buffer work count) (setf complete t) (values 0 count))
                   (values status 0)))
           (protocol-error () (values 1 0)))
      (unless complete (clear-local-group-workspace work)))))

;;; REQ: REQ-IPC-002 REQ-WAL-006 REQ-AFF-008
(declaim (ftype (function (b:octets envelope local-group-csns (integer 1 8)) (integer 1 8)) decode-local-group-response))
(defun decode-local-group-response (buffer envelope scratch count)
  "Pre: correlated RESPONSE and exclusive internal u64 scratch, never caller output. Post: complete increasing positive CSNs.
Exact count/end required; PROTOCOL-ERROR for malformed success, REQUEST-REJECTED only for validated error/null.
Scratch may be partially filled on failure and is not an authorized result; no operation retry."
  (%wire-envelope-input buffer envelope)
  (unless (= 3 (envelope-kind envelope)) (%wire-fail :local-expected-response))
  (unless (<= count (length scratch))
    (error 'arcdocdb.conditions:invalid-argument :reason :local-group-response-scratch))
  (when (plusp (envelope-code envelope))
    (unless (%wire-null-p buffer (envelope-payload-start envelope) (envelope-payload-end envelope))
      (%wire-fail :local-error-payload))
    (error 'request-rejected :reason :local-request-rejected :status (envelope-code envelope)))
  (let* ((end (envelope-payload-end envelope)) (previous 0)
         (cursor (%wire-expect buffer (envelope-payload-start envelope) end 4 count)))
    (dotimes (i count)
      (multiple-value-bind (csn next) (%wire-uint buffer cursor end #xffffffffffffffff)
        (unless (> csn previous) (%wire-fail :local-group-csn-order cursor))
        (setf (aref scratch i) csn previous csn cursor next)))
    (unless (= cursor end) (%wire-fail :local-group-response-trailing cursor)) count))
