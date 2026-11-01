;;; OWNER: immutable frame and exclusive fixed spans; no engine or peer capability.
(in-package #:arcdocdb.local)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (b:octets t t) b:index) %wire-read-group-input))
(defun %wire-read-group-input (out keys count)
  "Pre: stable external key prefix and private output. Post: complete checked payload size before output mutation.
One to eight nonaliasing keys reuse the existing GET validator; an unselected tail is not inspected."
  (unless (and (typep keys 'simple-vector) (typep count '(integer 1 8)) (<= count (length keys)))
    (error 'arcdocdb.conditions:invalid-argument :reason :local-read-group-keys))
  (let ((size 1))
    (dotimes (i count)
      (let ((key (svref keys i)))
        (%wire-request-input out 2 key nil)
        (incf size (+ (%wire-head-size (length key)) (length key))))) size))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (b:octets b:u64 t t (integer 4096 65536)) b:index) encode-local-read-group))
(defun encode-local-read-group (out id keys count limit)
  "Pre: stable key prefix, exclusive fixed output and negotiated limit. Post: complete opcode-5 REQUEST.
Full type/alias/key/frame preflight precedes output; no ID, I/O, retained loan or implicit split."
  (let ((size (%wire-read-group-input out keys count)))
    (multiple-value-bind (cursor end) (%wire-output-begin out 2 id +local-read-group-opcode+ size limit)
      (setf cursor (%wire-put-head out cursor end 4 count))
      (dotimes (i count)
        (let ((key (svref keys i))) (setf cursor (%wire-put-bstr out cursor end key 0 (length key)))))
      (unless (= cursor end) (error 'arcdocdb.conditions:invariant-violation :reason :local-read-group-output)) end)))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (b:octets envelope local-group-workspace)
                         (values (integer 0 5) (integer 0 8) &optional)) %wire-read-key-spans))
(defun %wire-read-key-spans (buffer envelope work)
  "Pre: verified immutable REQUEST, exclusive workspace. Post: all key spans or status 1/5, without a copy.
Count 1..8 and every key checked before the caller may construct arguments or enter GET."
  (let ((end (envelope-payload-end envelope)) (spans (local-group-workspace-spans work)))
    (multiple-value-bind (major count cursor) (%wire-head buffer (envelope-payload-start envelope) end)
      (unless (= major 4) (%wire-fail :local-read-group-array))
      (when (zerop count) (return-from %wire-read-key-spans (values 1 0)))
      (when (> count +local-read-group-limit+) (return-from %wire-read-key-spans (values 5 0)))
      (dotimes (i count)
        (multiple-value-bind (start size next) (%wire-bstr buffer cursor end)
          (when (zerop size) (return-from %wire-read-key-spans (values 1 0)))
          (when (> size +max-key-bytes+) (return-from %wire-read-key-spans (values 5 0)))
          (setf (aref spans (+ (* i +group-span-words+) +group-key-start+)) start
                (aref spans (+ (* i +group-span-words+) +group-key-size+)) size cursor next)))
      (unless (= cursor end) (%wire-fail :local-read-group-trailing cursor)) (values 0 count))))

;;; REQ: REQ-IPC-002 REQ-IDX-001 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (b:octets envelope local-group-workspace)
                         (values (integer 0 5) (integer 0 8) &optional)) decode-local-read-group))
(defun decode-local-read-group (buffer envelope work)
  "Pre: immutable original opcode-5 REQUEST and exclusive workspace. Post: complete key copies or status 1/5.
All validation precedes copies/GET. Every incomplete exit clears references, preserving the cause/control."
  (%wire-envelope-input buffer envelope)
  (unless (and (= 2 (envelope-kind envelope)) (= +local-read-group-opcode+ (envelope-code envelope)))
    (%wire-fail :local-read-group-request))
  (clear-local-group-workspace work)
  (let ((complete nil) (spans (local-group-workspace-spans work)))
    (unwind-protect
         (handler-case
             (multiple-value-bind (status count) (%wire-read-key-spans buffer envelope work)
               (when (zerop status)
                 (dotimes (i count)
                   (setf (svref (local-group-workspace-operations work) i)
                         (%wire-copy buffer (aref spans (+ (* i +group-span-words+) +group-key-start+))
                                            (aref spans (+ (* i +group-span-words+) +group-key-size+)))))
                 (setf complete t)) (values status count))
           (protocol-error () (values 1 0)))
      (unless complete (clear-local-group-workspace work)))))

;;; REQ: REQ-IPC-002 REQ-IDX-001 REQ-LIM-003
(declaim (ftype (function (b:octets b:index b:index cbor:spazio-cbor) (values b:u64 b:index &optional)) %wire-read-result-span))
(defun %wire-read-result-span (buffer cursor end space)
  "Pre: complete minimal response item. Post: packed start/size or zero for absence, plus next item cursor.
Validates embedded minimal CBOR before any document copy; malformed or over-budget success is PROTOCOL-ERROR."
  (setf cursor (%wire-expect buffer cursor end 4 2))
  (unless (< cursor end) (%wire-fail :local-read-group-boolean cursor))
  (let ((flag (aref buffer cursor)))
    (incf cursor)
    (case flag
      (#xf4 (unless (and (< cursor end) (= #xf6 (aref buffer cursor))) (%wire-fail :local-read-group-absence cursor))
            (values 0 (1+ cursor)))
      (#xf5 (multiple-value-bind (start size next) (%wire-bstr buffer cursor end)
              (unless (zerop (%wire-document-status buffer start next space)) (%wire-fail :local-read-group-document start))
              (values (logior (ash start 32) size) next)))
      (otherwise (%wire-fail :local-read-group-boolean (1- cursor))))))

;;; REQ: REQ-IPC-002 REQ-IDX-001 REQ-AFF-008
(declaim (ftype (function (b:octets envelope cbor:spazio-cbor local-read-spans (integer 1 8)) simple-vector)
                decode-local-read-group-response))
(defun decode-local-read-group-response (buffer envelope space spans count)
  "Pre: correlated complete RESPONSE and exclusive fixed span scratch. Post: new private document/NIL vector.
Exact count/end, all booleans/nulls/documents validated before any document copy; errors expose no partial result.
REQUEST-REJECTED requires a validated error/null; malformed success is PROTOCOL-ERROR."
  (%wire-envelope-input buffer envelope)
  (unless (= 3 (envelope-kind envelope)) (%wire-fail :local-expected-response))
  (unless (<= count (length spans))
    (error 'arcdocdb.conditions:invalid-argument :reason :local-read-result-spans))
  (when (plusp (envelope-code envelope))
    (unless (%wire-null-p buffer (envelope-payload-start envelope) (envelope-payload-end envelope)) (%wire-fail :local-error-payload))
    (error 'request-rejected :reason :local-request-rejected :status (envelope-code envelope)))
  (let* ((end (envelope-payload-end envelope))
         (cursor (%wire-expect buffer (envelope-payload-start envelope) end 4 count)))
    (dotimes (i count)
      (multiple-value-bind (span next) (%wire-read-result-span buffer cursor end space)
        (setf (aref spans i) span cursor next)))
    (unless (= cursor end) (%wire-fail :local-read-result-trailing cursor))
    (let ((results (make-array count :initial-element nil)))
      (dotimes (i count)
        (let ((span (aref spans i)))
          (when (plusp span) (setf (svref results i) (%wire-copy buffer (ldb (byte 32 32) span) (ldb (byte 32 0) span)))))) results)))
