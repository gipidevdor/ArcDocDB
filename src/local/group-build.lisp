;;; OWNER: caller's stable operations and private output/scratch; no operation references retained.
(in-package #:arcdocdb.local)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (b:octets t t cbor:spazio-cbor) b:index) %wire-group-input))
(defun %wire-group-input (out operations count space)
  "Pre: external operation prefix, exclusive output/CBOR scratch. Post: checked payload size with no output changes.
One to eight stable engine descriptors; each single-operation validator is reused without per-member scratch creation.
INVALID-ARGUMENT/RESOURCE-EXHAUSTED before encoding for type, shape, key/document, alias or capacity."
  (unless (and (typep operations 'simple-vector) (typep count '(integer 1 8)) (<= count (length operations)))
    (error 'arcdocdb.conditions:invalid-argument :reason :local-group-operations))
  (let ((size 1))
    (dotimes (i count)
      (let ((op (svref operations i)))
        (unless (typep op 'e:operazione-scrittura)
          (error 'arcdocdb.conditions:invalid-argument :reason :local-group-operation))
        (let* ((put (= 1 (e::operazione-scrittura-kind op))) (key (e::operazione-scrittura-key op))
               (doc (e::operazione-scrittura-value op)))
          (%wire-request-input out (if put 1 3) key doc space)
          (incf size (+ 2 (%wire-head-size (length key)) (length key)
                       (if put (+ (%wire-head-size (length doc)) (length doc)) 0))))))
    size))

;;; REQ: REQ-IPC-002 REQ-WAL-002 REQ-LIM-003
(declaim (ftype (function (b:octets b:u64 t t cbor:spazio-cbor (integer 4096 65536)) b:index) encode-local-write-group))
(defun encode-local-write-group (out id operations count space limit)
  "Pre: stable operation prefix, exclusive fixed output and scratch, negotiated frame limit. Post: one explicit group REQUEST.
Full input/frame preflight before writing; no CSN, send, retained inputs or implicit split. Propagates typed rejections."
  (let ((size (%wire-group-input out operations count space)))
    (multiple-value-bind (cursor end) (%wire-output-begin out 2 id +local-write-group-opcode+ size limit)
      (setf cursor (%wire-put-head out cursor end 4 count))
      (dotimes (i count)
        (let* ((op (the e:operazione-scrittura (svref operations i))) (put (= 1 (e::operazione-scrittura-kind op)))
               (key (e::operazione-scrittura-key op)) (doc (e::operazione-scrittura-value op)))
          (setf cursor (%wire-put-head out cursor end 4 (if put 3 2))
                cursor (%wire-put-head out cursor end 0 (if put 1 3))
                cursor (%wire-put-bstr out cursor end key 0 (length key)))
          (when put (setf cursor (%wire-put-bstr out cursor end doc 0 (length doc))))))
      (unless (= cursor end) (error 'arcdocdb.conditions:invariant-violation :reason :local-group-output)) end)))

;;; REQ: REQ-IPC-002 REQ-WAL-006 REQ-AFF-008
(declaim (ftype (function (b:octets b:u64 local-group-csns (integer 1 8)) b:index) encode-local-group-response))
(defun encode-local-group-response (out id csns count)
  "Pre: engine completed strong publication, fixed exclusive output. Post: exact increasing CSN array in one RESPONSE.
Full result preflight precedes output; inconsistent results fault before queueing, never retry a committed group."
  (unless (<= count (length csns))
    (error 'arcdocdb.conditions:invariant-violation :reason :local-group-result-capacity))
  (let ((size 1) (previous 0))
    (dotimes (i count)
      (let ((csn (aref csns i)))
        (unless (> csn previous) (error 'arcdocdb.conditions:invariant-violation :reason :local-group-result-order))
        (incf size (%wire-head-size csn)) (setf previous csn)))
    (multiple-value-bind (cursor end) (%wire-output-begin out 3 id 0 size +server-max-frame+)
      (setf cursor (%wire-put-head out cursor end 4 count))
      (dotimes (i count) (setf cursor (%wire-put-head out cursor end 0 (aref csns i))))
      (unless (= cursor end) (error 'arcdocdb.conditions:invariant-violation :reason :local-group-response-output)) end)))
