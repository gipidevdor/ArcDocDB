;;; OWNER: synchronous client and its fixed spans; returned documents are independent private copies.
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
