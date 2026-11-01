;;; OWNER: synchronous caller owns keys/output and client scratch; legacy documents are independent copies.
(in-package #:arcdocdb.local)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IPC-002 REQ-IDX-001 REQ-LIM-003 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (t t &key (:count t)) simple-vector) client-get-group))
(defun client-get-group (client keys &key (count (if (typep keys 'simple-vector) (length keys) 0)))
  "Pre: READY owner connected with :READ-GROUPS T and stable simple-vector prefix of 1..8 binary keys.
Post: new simple vector of copied document octets or NIL for absence, in order, preserving duplicates.
All results and the absolute deadline are checked before exposure; no partial result on any incomplete exit.
Input/frame/ID refusals precede send, known rejection retains READY; other errors/nonlocal exits close without retry.
One current serial view; no historical MVCC, split, downgrade or mutation uncertainty classification."
  (esigi-local-client client :ready)
  (unless (local-client-read-groups client)
    (error 'arcdocdb.conditions:unsupported-format :reason :local-read-groups-not-negotiated))
  (let ((id (local-client-next-id client)))
    (unless (<= id #xffffffffffffffff)
      (error 'arcdocdb.conditions:resource-exhausted :reason :local-client-id-exhausted))
    (unwind-protect
         (let ((size (encode-local-read-group (local-client-output client) id keys count (local-client-limit client))))
           (run-local-client-exchange client id size +local-read-group-opcode+ count))
      (fill (local-client-read-spans client) 0))))

;;; REQ: REQ-IPC-002 REQ-IDX-001 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (local-client envelope (integer 1 8) (or null b:octets) b:index (or null local-read-spans) b:u64)
                         (values t &optional t)) finish-local-client-read-group))
(defun finish-local-client-read-group (client envelope count target start lengths until)
  "Pre: correlated complete response and preflighted optional caller output. Post: legacy vector or COUNT/byte-count.
Shared decoding and fresh post-copy deadline precede success. Only successful return authorizes caller output;
late errors can leave unconfirmed bytes. No target reference is retained and no protocol choice is changed."
  (multiple-value-prog1
      (if target
          (decode-local-read-group-into (local-client-input client) envelope (local-client-space client)
                                       (local-client-read-spans client) count target start lengths)
          (decode-local-read-group-response (local-client-input client) envelope (local-client-space client)
                                           (local-client-read-spans client) count))
    (when (>= (local-now (local-client-clock client)) until)
      (error 'protocol-error :reason :local-client-deadline))))

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (t t t (integer 1 8)) null) check-local-read-group-arena))
(defun check-local-read-group-arena (target lengths start count)
  "Pre: external output arguments and validated group count. Post: simple exclusive output shapes and full M1 grant.
Invalid shapes/ranges ->INVALID-ARGUMENT; insufficient grant ->RESOURCE-EXHAUSTED before output, ID or I/O."
  (unless (and (typep target 'b:octets) (typep lengths 'local-read-spans) (typep start 'b:index)
               (<= start (length target)) (<= count (length lengths)))
    (error 'arcdocdb.conditions:invalid-argument :reason :local-read-group-output-input))
  (when (< (- (length target) start) +server-max-frame+)
    (error 'arcdocdb.conditions:resource-exhausted :reason :local-read-group-output-budget))
  nil)

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-008
(declaim (ftype (function (local-client simple-vector (integer 1 8) b:octets local-read-spans) null)
                check-local-read-group-output-aliases))
(defun check-local-read-group-output-aliases (client keys count target lengths)
  "Pre: validated output types and selected key count. Post: caller outputs distinct from client scratch and selected keys.
No displaced arrays are admitted; EQ covers possible storage aliases. INVALID-ARGUMENT before mutation or I/O."
  (when (or (eq target (local-client-input client)) (eq target (local-client-output client))
            (eq lengths (local-client-read-spans client)) (eq lengths (local-client-group-csns client)))
    (error 'arcdocdb.conditions:invalid-argument :reason :local-read-group-output-alias))
  (dotimes (i count)
    (when (eq target (svref keys i))
      (error 'arcdocdb.conditions:invalid-argument :reason :local-read-group-output-key-alias)))
  nil)

;;; REQ: REQ-IPC-002 REQ-IDX-001 REQ-LIM-003 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (t t t t &key (:count t) (:start t)) (values (integer 1 8) b:index &optional)) client-get-group-into))
(defun client-get-group-into (client keys target lengths &key (count (if (typep keys 'simple-vector) (length keys) 0)) (start 0))
  "Pre: READY owner with READ-GROUPS, selected 1..8 stable binary keys; exclusive simple UB8 TARGET and UB64 LENGTHS.
START reserves 65,536 bytes; LENGTHS reserves COUNT entries. Outputs differ from selected keys and private client arrays.
Post: COUNT/total-byte-count, present documents packed at START in key order; LENGTHS prefix is byte counts, zero for absence.
Unselected output bytes/entries stay unchanged. Full response validation precedes copying; no document/result vector is allocated.
Only successful return authorizes outputs: late deadline/error/nonlocal exit can leave unconfirmed bytes/lengths.
Preflight refusals precede ID/I/O; rejections preserve outputs and READY, other incomplete reads close without retry.
One current serial view, including duplicate keys. Fixed private spans are cleared after every encoded exchange."
  (esigi-local-client client :ready)
  (unless (local-client-read-groups client)
    (error 'arcdocdb.conditions:unsupported-format :reason :local-read-groups-not-negotiated))
  (unless (and (typep keys 'simple-vector) (typep count '(integer 1 8)) (<= count (length keys)))
    (error 'arcdocdb.conditions:invalid-argument :reason :local-read-group-keys))
  (check-local-read-group-arena target lengths start count)
  (check-local-read-group-output-aliases client keys count target lengths)
  (let ((id (local-client-next-id client)))
    (unless (<= id #xffffffffffffffff)
      (error 'arcdocdb.conditions:resource-exhausted :reason :local-client-id-exhausted))
    (unwind-protect
         (let ((size (encode-local-read-group (local-client-output client) id keys count (local-client-limit client))))
           (run-local-client-exchange client id size +local-read-group-opcode+ count lengths nil nil target start))
      (fill (local-client-read-spans client) 0))))
