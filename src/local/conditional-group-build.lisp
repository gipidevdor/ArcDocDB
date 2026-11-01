;;; OWNER: caller's stable distinct-key descriptors, expected tokens and exclusive wire output.
(in-package #:arcdocdb.local)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (b:octets t t t cbor:spazio-cbor) b:index) %wire-conditional-input))
(defun %wire-conditional-input (out operations expected count space)
  "Pre: external operation prefix and exclusive output. Post: full input/duplicate-key validation and exact payload size.
No output mutation; INVALID-ARGUMENT/RESOURCE-EXHAUSTED precedes encode/send. Expected tokens remain borrowed."
  (let ((size (%wire-group-input out operations count space)))
    (unless (and (typep expected 'local-group-csns) (<= count (length expected)))
      (error 'arcdocdb.conditions:invalid-argument :reason :local-conditional-expected))
    (dotimes (i count)
      (let ((key (e::operazione-scrittura-key (svref operations i))))
        (dotimes (j i)
          (when (equalp key (e::operazione-scrittura-key (svref operations j)))
            (error 'arcdocdb.conditions:invalid-argument :reason :local-conditional-duplicate-key))))
      (incf size (%wire-head-size (aref expected i)))) size))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-WAL-002 REQ-LIM-003
(declaim (ftype (function (b:octets b:u64 t t t cbor:spazio-cbor (integer 4096 65536)) b:index)
                encode-local-conditional-group))
(defun encode-local-conditional-group (out id operations expected count space limit)
  "Pre: stable independent prefix, expected u64 array and exclusive output/scratch. Post: exact opcode 7 REQUEST.
All input/frame checks precede any output mutation; no split, CSN allocation, I/O or retained references."
  (let ((size (%wire-conditional-input out operations expected count space)))
    (multiple-value-bind (cursor end) (%wire-output-begin out 2 id +local-conditional-group-opcode+ size limit)
      (setf cursor (%wire-put-head out cursor end 4 count))
      (dotimes (i count)
        (let* ((op (the e:operazione-scrittura (svref operations i))) (put (= 1 (e::operazione-scrittura-kind op)))
               (key (e::operazione-scrittura-key op)) (doc (e::operazione-scrittura-value op)))
          (setf cursor (%wire-put-head out cursor end 4 (if put 4 3))
                cursor (%wire-put-head out cursor end 0 (if put 1 3))
                cursor (%wire-put-bstr out cursor end key 0 (length key))
                cursor (%wire-put-head out cursor end 0 (aref expected i)))
          (when put (setf cursor (%wire-put-bstr out cursor end doc 0 (length doc))))))
      (unless (= cursor end) (error 'arcdocdb.conditions:invariant-violation :reason :local-conditional-output)) end)))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-WAL-006 REQ-AFF-008
(declaim (ftype (function (b:octets b:u64 local-group-csns b:octets (integer 1 8)) b:index)
                encode-local-conditional-response))
(defun encode-local-conditional-response (out id tokens applied count)
  "Pre: completed engine results after covering strong flush and FIFO publication. Post: exact ordered result vector.
Validate every flag and increasing positive applied CSN before encoding; violations are invariants, never retry/rejection."
  (unless (and (<= count (length tokens)) (<= count (length applied)))
    (error 'arcdocdb.conditions:invariant-violation :reason :local-conditional-result-capacity))
  (let ((size 1) (previous 0))
    (dotimes (i count)
      (let ((token (aref tokens i)) (flag (aref applied i)))
        (unless (and (member flag '(0 1)) (or (zerop flag) (> token previous)))
          (error 'arcdocdb.conditions:invariant-violation :reason :local-conditional-result-order))
        (when (= 1 flag) (setf previous token)) (incf size (+ 2 (%wire-head-size token)))))
    (multiple-value-bind (cursor end) (%wire-output-begin out 3 id 0 size +server-max-frame+)
      (setf cursor (%wire-put-head out cursor end 4 count))
      (dotimes (i count)
        (setf cursor (%wire-put-head out cursor end 4 2) (aref out cursor) (if (= 1 (aref applied i)) #xf5 #xf4))
        (incf cursor) (setf cursor (%wire-put-head out cursor end 0 (aref tokens i))))
      (unless (= cursor end) (error 'arcdocdb.conditions:invariant-violation :reason :local-conditional-response-end)) end)))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-WAL-006 REQ-AFF-008
(declaim (ftype (function (b:octets envelope local-group-csns b:octets (integer 1 8)) (integer 0 8))
                decode-local-conditional-response))
(defun decode-local-conditional-response (buffer envelope tokens applied count)
  "Pre: correlated complete RESPONSE and exclusive private result scratch. Post: complete per-member results and applied count.
Exact booleans/u64/count/end and increasing positive applied tokens required. Error/null alone is REQUEST-REJECTED.
Partially filled private scratch after PROTOCOL-ERROR is not authorized output; caller clears it on every exit."
  (%wire-envelope-input buffer envelope)
  (unless (and (= 3 (envelope-kind envelope)) (<= count (length tokens)) (<= count (length applied)))
    (%wire-fail :local-conditional-response))
  (when (plusp (envelope-code envelope))
    (unless (%wire-null-p buffer (envelope-payload-start envelope) (envelope-payload-end envelope))
      (%wire-fail :local-error-payload))
    (error 'request-rejected :reason :local-request-rejected :status (envelope-code envelope)))
  (let* ((end (envelope-payload-end envelope)) (previous 0) (completed 0)
         (cursor (%wire-expect buffer (envelope-payload-start envelope) end 4 count)))
    (dotimes (i count)
      (setf cursor (%wire-expect buffer cursor end 4 2))
      (unless (and (< cursor end) (member (aref buffer cursor) '(#xf4 #xf5))) (%wire-fail :local-conditional-boolean))
      (let ((success (= #xf5 (aref buffer cursor))))
        (multiple-value-bind (token next) (%wire-uint buffer (1+ cursor) end #xffffffffffffffff)
          (when success
            (unless (> token previous) (%wire-fail :local-conditional-csn-order))
            (setf previous token) (incf completed))
          (setf (aref tokens i) token (aref applied i) (if success 1 0) cursor next))))
    (unless (= cursor end) (%wire-fail :local-conditional-response-trailing)) completed))
