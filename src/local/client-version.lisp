;;; OWNER: synchronous client; versioned results are independent copies, tokens are scalar u64 values.
(in-package #:arcdocdb.local)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-WAL-006 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (t (member 0 1 3) t t t) (values keyword t &optional b:u64)) exchange-local-version))
(defun exchange-local-version (client operation key document expected)
  "Pre: READY owner and stable input. Post: correlated version result; no mutation uncertainty for versioned GET.
Capability/input/frame/ID refusal precedes send. Conditional send failures are OUTCOME-UNKNOWN; no automatic retry."
  (esigi-local-client client :ready)
  (unless (local-client-versions client)
    (error 'arcdocdb.conditions:unsupported-format :reason :local-versions-not-negotiated))
  (let ((id (local-client-next-id client)))
    (unless (<= id #xffffffffffffffff)
      (error 'arcdocdb.conditions:resource-exhausted :reason :local-client-id-exhausted))
    (let ((size (encode-local-version (local-client-output client) id operation key document expected (local-client-limit client))))
      (run-local-client-exchange client id size +local-version-opcode+ 0 nil operation))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-IDX-001
(declaim (ftype (function (t t) (values (member :found :absent) (or null b:octets) b:u64 &optional)) client-get-version))
(defun client-get-version (client key)
  "Pre: READY owner connected with :VERSIONS T, binary key. Post: :FOUND/copied-document/positive-CSN or :ABSENT/NIL/0.
The CSN belongs to the verified current value. No historical snapshot or retry; failed reads close without OUTCOME-UNKNOWN."
  (exchange-local-version client 0 key nil 0))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-IDX-001 REQ-LIM-003 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (t t t &key (:start t))
                         (values (member :found :absent) b:index b:u64 &optional)) client-get-version-into))
(defun client-get-version-into (client key target &key (start 0))
  "Pre: READY owner with :VERSIONS T, stable binary key and exclusive simple octet TARGET with a full 60,000-byte grant.
TARGET differs from KEY and client input/output. State/capability/output/key/frame/ID refusals precede I/O and ID consumption.
Post: FOUND/copied-byte-count/verified-current-CSN or ABSENT/0/0 with TARGET unchanged; surrounding bytes remain unchanged.
Only successful return authorizes copied bytes; a post-copy deadline/failure/nonlocal exit can leave unconfirmed output.
No target retention, document vector, historical snapshot or retry. Failed reads close without OUTCOME-UNKNOWN."
  (esigi-local-client client :ready)
  (unless (local-client-versions client)
    (error 'arcdocdb.conditions:unsupported-format :reason :local-versions-not-negotiated))
  (esigi-local-get-output client key target start)
  (let ((id (local-client-next-id client)))
    (unless (<= id #xffffffffffffffff)
      (error 'arcdocdb.conditions:resource-exhausted :reason :local-client-id-exhausted))
    (let ((size (encode-local-version (local-client-output client) id 0 key nil 0 (local-client-limit client))))
      (run-local-client-exchange client id size +local-version-opcode+ 0 nil 0 nil target start))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-TXS-003 REQ-WAL-006
(declaim (ftype (function (t t t t) (values (member :applied :conflict) b:u64 &optional)) client-put-if))
(defun client-put-if (client key document expected)
  "Pre: READY owner connected with :VERSIONS T, stable binary key/minimal CBOR document, expected u64 (zero means absent).
Post: :APPLIED/new strong CSN or :CONFLICT/current LIVE CSN (zero if absent), without effects on conflict.
Lost/malformed response after send is OUTCOME-UNKNOWN. No silent retry or exactly-once guarantee."
  (exchange-local-version client 1 key document expected))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-TXS-003 REQ-WAL-006
(declaim (ftype (function (t t t) (values (member :applied :conflict) b:u64 &optional)) client-delete-if))
(defun client-delete-if (client key expected)
  "Pre: READY owner connected with :VERSIONS T, stable key and expected u64 (zero means absent).
Post: :APPLIED/new durable tombstone CSN or :CONFLICT/current LIVE CSN or zero, without effects on conflict.
Matching absence still commits a tombstone; incomplete mutating exchange is never retried."
  (exchange-local-version client 3 key nil expected))
