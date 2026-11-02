;;; OWNER: caller thread and exclusive TARGET until return; no target reference is retained by the client.
;;; SHARED: immutable key and wire bytes only; the caller does not mutate buffers or reenter during the exchange.
(in-package #:arcdocdb.local)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IPC-002 REQ-IDX-001 REQ-LIM-003 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (local-client t t t) null) esigi-local-get-output))
(defun esigi-local-get-output (client key target start)
  "Pre: READY owner before any exchange. Post: exclusive simple output with a full maximum-document grant.
Invalid type/range/alias ->INVALID-ARGUMENT, short grant ->RESOURCE-EXHAUSTED; no I/O, ID or output mutation."
  (unless (and (typep target 'b:octets) (typep start 'b:index) (<= start (length target))
               (not (eq target key)) (not (eq target (local-client-input client))) (not (eq target (local-client-output client))))
    (error 'arcdocdb.conditions:invalid-argument :reason :local-get-output-input))
  (when (< (- (length target) start) +max-document-bytes+)
    (error 'arcdocdb.conditions:resource-exhausted :reason :local-get-output-budget))
  nil)

;;; REQ: REQ-IPC-002 REQ-IDX-001 REQ-LIM-003 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (t t t &key (:start t))
                         (values (member :found :absent) b:index &optional)) client-get-into))
(defun client-get-into (client key target &key (start 0))
  "Pre: READY owner, stable binary key and exclusive simple octet TARGET; START leaves a full 60,000-byte grant.
TARGET must differ from KEY and the client's input/output. Argument/ID/outgoing-frame refusals precede I/O and ID consumption.
Post: FOUND/byte-count with a verified copy in TARGET at START, or ABSENT/0 with TARGET unchanged; surrounding bytes unchanged.
Uses ordinary GET and the existing rejection/deadline/close rules; no capability or retry. Only a successful return authorizes
the copied prefix: deadline/failure/nonlocal exit after copying may leave unconfirmed bytes. No new document vector is allocated."
  (esigi-local-client client :ready)
  (esigi-local-get-output client key target start)
  (let ((id (local-client-next-id client)))
    (unless (<= id #xffffffffffffffff)
      (error 'arcdocdb.conditions:resource-exhausted :reason :local-client-id-exhausted))
    (let ((size (encode-local-request (local-client-output client) id 2 key nil)))
      (run-local-client-exchange client id size 2 0 nil nil nil target start))))
