;;; OWNER: immutable complete frame and actor's fixed group workspace; no engine calls or partial copies.
(in-package #:arcdocdb.local)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (b:octets b:index b:index cbor:spazio-cbor)
                         (values (member 0 1 5) b:index b:u16 b:index b:index b:index b:index b:u64 &optional))
                %wire-conditional-member))
(defun %wire-conditional-member (buffer start end space)
  "Pre: minimal complete outer item, stable input. Post: validated conditional PUT/DELETE spans and expected u64, no copy.
Shape failures signal PROTOCOL-ERROR; invalid document/key returns 1, exceeded key/document budget 5."
  (multiple-value-bind (major fields cursor) (%wire-head buffer start end)
    (unless (= 4 major) (%wire-fail :local-conditional-member start))
    (multiple-value-bind (opcode next) (%wire-uint buffer cursor end 3)
      (unless (and (member opcode '(1 3)) (= fields (if (= 1 opcode) 4 3)))
        (%wire-fail :local-conditional-member start))
      (multiple-value-bind (ks kl after-key) (%wire-bstr buffer next end)
        (multiple-value-bind (expected after-version) (%wire-uint buffer after-key end #xffffffffffffffff)
          (multiple-value-bind (ds dl finish)
              (if (= 1 opcode) (%wire-bstr buffer after-version end) (values 0 0 after-version))
            (values (cond ((zerop kl) 1) ((> kl +max-key-bytes+) 5)
                          ((= 1 opcode) (%wire-document-status buffer ds finish space)) (t 0))
                    finish opcode ks kl ds dl expected)))))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (b:octets envelope cbor:spazio-cbor local-group-workspace (integer 1 8))
                         (values (member 0 1 5) (integer 0 8) &optional)) %wire-conditional-spans))
(defun %wire-conditional-spans (buffer envelope space work limit)
  "Pre: opcode 7 REQUEST and empty exclusive scratch. Post: whole distinct-key prefix validated before copies or admission.
At most eight members and 28 bounded key comparisons. Invalid shape/duplicate ->1, count over limit ->5."
  (let ((end (envelope-payload-end envelope)) (spans (local-group-workspace-spans work)))
    (multiple-value-bind (major count cursor) (%wire-head buffer (envelope-payload-start envelope) end)
      (unless (= 4 major) (%wire-fail :local-conditional-array))
      (when (zerop count) (return-from %wire-conditional-spans (values 1 0)))
      (when (> count limit) (return-from %wire-conditional-spans (values 5 0)))
      (dotimes (i count)
        (multiple-value-bind (status next opcode ks kl ds dl expected) (%wire-conditional-member buffer cursor end space)
          (unless (zerop status) (return-from %wire-conditional-spans (values status 0)))
          (dotimes (j i)
            (let* ((base (* j +group-span-words+)) (old (aref spans (+ base +group-key-start+))))
              (when (and (= kl (aref spans (+ base +group-key-size+)))
                         (not (mismatch buffer buffer :start1 ks :end1 (+ ks kl) :start2 old :end2 (+ old kl))))
                (return-from %wire-conditional-spans (values 1 0)))))
          (let ((base (* i +group-span-words+)))
            (setf (aref spans (+ base +group-kind+)) opcode (aref spans (+ base +group-key-start+)) ks
                  (aref spans (+ base +group-key-size+)) kl (aref spans (+ base +group-doc-start+)) ds
                  (aref spans (+ base +group-doc-size+)) dl
                  (aref (local-group-workspace-expected work) i) expected
                  (aref (local-group-workspace-conditions work) i) 1))
          (setf cursor next)))
      (unless (= cursor end) (%wire-fail :local-conditional-trailing cursor)) (values 0 count))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (b:octets envelope cbor:spazio-cbor local-group-workspace (integer 1 8))
                         (values (member 0 1 5) (integer 0 8) &optional)) decode-local-conditional-group))
(defun decode-local-conditional-group (buffer envelope space work limit)
  "Pre: complete original REQUEST and fixed workspace. Post: all validated descriptors or status 1/5 with scratch cleared.
Every input/duplicate check precedes copies; incomplete/nonlocal copy exits clear references and propagate."
  (%wire-envelope-input buffer envelope)
  (unless (and (= 2 (envelope-kind envelope)) (= +local-conditional-group-opcode+ (envelope-code envelope)))
    (%wire-fail :local-conditional-request))
  (clear-local-group-workspace work)
  (let ((complete nil))
    (unwind-protect
         (handler-case
             (multiple-value-bind (status count) (%wire-conditional-spans buffer envelope space work limit)
               (if (zerop status)
                   (progn (%wire-copy-group buffer work count) (setf complete t) (values 0 count))
                   (values status 0)))
           (protocol-error () (values 1 0)))
      (unless complete (clear-local-group-workspace work)))))
