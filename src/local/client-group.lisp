;;; OWNER: synchronous client and its internal u64 scratch; borrowed operation prefix until return only.
(in-package #:arcdocdb.local)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IPC-002 REQ-WAL-002 REQ-WAL-006 REQ-LIM-003 REQ-AFF-004
(declaim (ftype (function (t t t &key (:count t)) b:index) client-write-group))
(defun client-write-group (client operations results &key (count (if (typep operations 'simple-vector) (length operations) 0)))
  "Pre: READY owner connected with :WRITE-GROUPS T; stable 1..8 engine operation descriptors and exclusive u64 result prefix.
Post: COUNT increasing strong CSNs after a correlated complete response. Each operation has its own SEAL; no transaction promise.
Input/frame/ID refusals precede send; authoritative rejection preserves output. Malformed response is OUTCOME-UNKNOWN.
Output is copied only after full validation and is not authorized on incomplete exit; no split, downgrade or automatic retry."
  (esigi-local-client client :ready)
  (unless (local-client-write-groups client)
    (error 'arcdocdb.conditions:unsupported-format :reason :local-write-groups-not-negotiated))
  (unless (and (typep count '(integer 1 8)) (typep results 'local-group-csns) (<= count (length results))
               (not (eq results (local-client-group-csns client))))
    (error 'arcdocdb.conditions:invalid-argument :reason :local-group-result-output))
  (let ((id (local-client-next-id client)))
    (unless (<= id #xffffffffffffffff)
      (error 'arcdocdb.conditions:resource-exhausted :reason :local-client-id-exhausted))
    (unwind-protect
         (let ((size (encode-local-write-group (local-client-output client) id operations count
                                               (local-client-space client) (local-client-limit client))))
           (run-local-client-exchange client id size +local-write-group-opcode+ count results))
      (fill (local-client-group-csns client) 0))))
