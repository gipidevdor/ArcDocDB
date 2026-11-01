;;; OWNER: handle privato del thread chiamante, una richiesta completa per chiamata.
;;; SHARED: soltanto byte wire con il server; nessuna dipendenza da test o bootstrap remoto.
(in-package #:arcdocdb.local)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IPC-002 REQ-AFF-008
(defun esigi-local-client (client state)
  "Pre: external handle. Post: exact type, owner, and state; reentry and closed handles rejected."
  (unless (and (typep client 'local-client) (eq (local-client-owner client) sb-thread:*current-thread*)
               (eq (local-client-state client) state))
    (error 'arcdocdb.conditions:invalid-argument :reason :local-client-state))
  nil)

;;; REQ: REQ-IPC-002 REQ-AFF-004
(defun close-local (client)
  "Pre: handle of the owner thread. Post: ownership consumed once, even if close fails."
  (unless (and (typep client 'local-client) (eq (local-client-owner client) sb-thread:*current-thread*))
    (error 'arcdocdb.conditions:invalid-argument :reason :local-client-owner))
  (let ((socket (local-client-socket client)))
    (setf (local-client-socket client) nil (local-client-state client) :closed)
    (when socket (close-local-socket socket)))
  nil)

;;; REQ: REQ-IPC-002 REQ-AFF-004
(defun fail-local-client (client primary mutation)
  "Pre: primary error, possibly a started mutating request. Post: close without retry and cause intact."
  (let ((cause primary))
    (handler-case (close-local client)
      (error (cleanup)
        (setf cause (make-condition 'local-cleanup-error :reason :local-client-cleanup
                                   :primary primary :failures (list cleanup)))))
    (if mutation (error 'outcome-unknown :reason :local-outcome-unknown :cause cause) (error cause))))

;;; REQ: REQ-IPC-002 REQ-LIM-003
(defun transfer-local-client (client buffer start end direction until)
  "Pre: exclusive buffer and absolute deadline. Post: exact span or error without partial acknowledgment."
  (loop while (< start end) do
    (when (>= (local-now (local-client-clock client)) until)
      (error 'protocol-error :reason :local-client-deadline))
    (multiple-value-bind (status count)
        (local-transfer-step (local-client-socket client) buffer start end direction (local-client-io-backend client))
      (case status
        (:progress (incf start count))
        (:wait (wait-local-client client direction until))
        (:eof (error 'protocol-error :reason :local-client-eof)))))
  end)

;;; REQ: REQ-IPC-002 REQ-LIM-003
(defun receive-local-client (client limit until)
  "Pre: waiting for one frame only. Post: exact envelope; residual coalesced data remain in the kernel."
  (let ((buffer (local-client-input client)))
    (transfer-local-client client buffer 0 4 :input until)
    (let ((end (+ 4 (local-prefix-size buffer limit))))
      (transfer-local-client client buffer 4 end :input until)
      (decode-local-envelope buffer 4 end :space (local-client-space client)))))

;;; REQ: REQ-IPC-001 REQ-IPC-002
(declaim (ftype (function (t &key (:max-frame t) (:clock t) (:io-backend t) (:write-groups t) (:read-groups t) (:versions t) (:conditional-groups t)) local-client) connect-local))
(defun connect-local (path &key (max-frame 65536) (clock #'get-internal-real-time) io-backend
                              (write-groups nil) (read-groups nil) (versions nil) (conditional-groups nil))
  "Pre: explicit Unix path and trusted monotonic clock. Post: owned client after verified WELCOME.
No data operation during handshake; exact optional capabilities and deadline precede READY. Every incomplete exit closes ownership."
  (unless (and (typep max-frame '(integer 4096 17825792)) (functionp clock)
               (typep write-groups 'boolean) (typep read-groups 'boolean) (typep versions 'boolean) (typep conditional-groups 'boolean))
    (error 'arcdocdb.conditions:invalid-argument :reason :local-client-configuration))
  (%native-check-backend io-backend)
  (let* ((client (make-local-client :clock clock :limit (min 65536 max-frame) :io-backend io-backend
                                    :write-groups write-groups :read-groups read-groups :versions versions
                                    :conditional-groups conditional-groups :waiter (make-local-waiter 1 io-backend)))
         (until (local-until (local-now clock) 5)) (complete nil))
    (unwind-protect
     (handler-case
        (progn
          (setf (local-client-socket client) (connect-local-socket path until :clock clock))
          (let ((size (encode-local-hello (local-client-output client) max-frame :write-groups write-groups :read-groups read-groups
                                        :versions versions :conditional-groups conditional-groups)))
            (transfer-local-client client (local-client-output client) 0 size :output until))
          (let ((envelope (receive-local-client client 4096 until)))
            (multiple-value-bind (frame inflight)
                (decode-local-welcome (local-client-input client) envelope :write-groups write-groups :read-groups read-groups
                                      :versions versions :conditional-groups conditional-groups)
              (unless (and (<= 4096 frame (min 65536 max-frame)) (= inflight 1))
                (error 'protocol-error :reason :local-client-negotiation))
              (setf (local-client-limit client) frame)))
          (when (>= (local-now clock) until) (error 'protocol-error :reason :local-client-deadline))
          (setf (local-client-state client) :ready complete t)
          client)
      (error (condition) (fail-local-client client condition nil)))
      (when (and (not complete) (not (eq :closed (local-client-state client))))
        (handler-case (close-local client)
          (error (cleanup) (push cleanup (local-client-cleanup-failures client))))))))

;;; REQ: REQ-IPC-002 REQ-WAL-006 REQ-AFF-004
(declaim (ftype (function (local-client b:u64 b:u16 (integer 0 8) (or null local-group-csns) b:u64
                         &optional (member nil 0 1 3) (or null b:octets))
                         (values t &optional t t)) finish-local-client-response))
(defun finish-local-client-response (client id opcode count results until &optional version-operation applied)
  "Pre: one owned exchange awaiting its response. Post: fully correlated result, group output copied after complete validation.
Malformed/rejected responses never expose partial group results; propagates protocol/authoritative rejection."
  (let ((envelope (receive-local-client client (local-client-limit client) until)))
    (when (>= (local-now (local-client-clock client)) until)
      (error 'protocol-error :reason :local-client-deadline))
    (unless (and (= 3 (envelope-kind envelope)) (= id (envelope-id envelope)))
      (error 'protocol-error :reason :local-client-response-id))
    (cond
      ((and (= opcode +local-conditional-group-opcode+) (plusp count))
       (let ((completed (decode-local-conditional-response (local-client-input client) envelope
                          (local-client-group-csns client) (local-client-group-applied client) count)))
         (when (>= (local-now (local-client-clock client)) until)
           (error 'protocol-error :reason :local-client-deadline))
         (replace results (local-client-group-csns client) :end1 count :end2 count)
         (replace applied (local-client-group-applied client) :end1 count :end2 count) completed))
      ((and (= opcode +local-version-opcode+) version-operation)
       (multiple-value-prog1
           (decode-local-version-response (local-client-input client) envelope (local-client-space client) version-operation)
         (when (>= (local-now (local-client-clock client)) until)
           (error 'protocol-error :reason :local-client-deadline))))
      ((and (= opcode +local-write-group-opcode+) (plusp count))
        (progn
          (decode-local-group-response (local-client-input client) envelope (local-client-group-csns client) count)
          (when (>= (local-now (local-client-clock client)) until)
            (error 'protocol-error :reason :local-client-deadline))
          (replace results (local-client-group-csns client) :end1 count :end2 count) count))
      ((and (= opcode +local-read-group-opcode+) (plusp count))
       (let ((documents (decode-local-read-group-response (local-client-input client) envelope
                          (local-client-space client) (local-client-read-spans client) count)))
         (when (>= (local-now (local-client-clock client)) until)
           (error 'protocol-error :reason :local-client-deadline)) documents))
      (t (multiple-value-prog1
            (decode-local-response (local-client-input client) envelope (local-client-space client) opcode)
          (when (>= (local-now (local-client-clock client)) until)
            (error 'protocol-error :reason :local-client-deadline)))))))

;;; REQ: REQ-IPC-002 REQ-WAL-006 REQ-AFF-004
(declaim (ftype (function (local-client b:u64 b:index b:u16 &optional (integer 0 8) (or null local-group-csns)
                         (member nil 0 1 3) (or null b:octets))
                         (values t &optional t t)) run-local-client-exchange))
(defun run-local-client-exchange (client id size opcode &optional (count 0) results version-operation applied)
  "Pre: READY owner and encoded/preflighted frame. Post: correlated terminal result or rejection, one ID consumed.
First mutating send attempt makes errors OUTCOME-UNKNOWN; incomplete nonlocal exits close ownership without retry.
Secondary cleanup errors are retained, never replace an existing nonlocal transfer. No pin/lease spans I/O."
  (esigi-local-client client :ready)
  (unless (= id (local-client-next-id client))
    (error 'arcdocdb.conditions:invariant-violation :reason :local-client-exchange-id))
  (let ((until (local-until (local-now (local-client-clock client)) 30)) (complete nil))
    (unless (<= size (+ 4 (local-client-limit client)))
      (error 'arcdocdb.conditions:resource-exhausted :reason :local-client-frame-budget))
    (setf (local-client-state client) :busy (local-client-next-id client) (1+ id))
    (unwind-protect
         (handler-case
             (progn
               (transfer-local-client client (local-client-output client) 0 size :output until)
               (multiple-value-prog1 (finish-local-client-response client id opcode count results until version-operation applied)
                 (setf (local-client-state client) :ready complete t)))
           (request-rejected (condition) (setf (local-client-state client) :ready complete t) (error condition))
           (error (condition) (fail-local-client client condition
                               (or (not (null (member opcode '(1 3 4 7))))
                                   (and (= opcode +local-version-opcode+) (not (null (member version-operation '(1 3)))))))))
      (when (and (not complete) (not (eq :closed (local-client-state client))))
        (handler-case (close-local client)
          (error (cleanup) (push cleanup (local-client-cleanup-failures client))))))))

;;; REQ: REQ-IPC-002 REQ-WAL-006 REQ-AFF-004
(declaim (ftype (function (t b:u16 t t) (values t &optional t)) exchange-local-client))
(defun exchange-local-client (client opcode key document)
  "Pre: READY owner and stable arguments. Post: one correlated legacy result; no retry after mutation uncertainty.
Encoding/ID/frame refusals precede send and ID consumption; shared exchange owns every incomplete I/O exit."
  (esigi-local-client client :ready)
  (let ((id (local-client-next-id client)))
    (unless (<= id #xffffffffffffffff)
      (error 'arcdocdb.conditions:resource-exhausted :reason :local-client-id-exhausted))
    (let ((size (encode-local-request (local-client-output client) id opcode key document)))
      (run-local-client-exchange client id size opcode))))

;;; REQ: REQ-IPC-002 REQ-WAL-006
(defun client-put (client key document)
  "Pre: READY owner, stable key/CBOR octets. Post: strong CSN or explicit rejection/unknown outcome."
  (exchange-local-client client 1 key document))

;;; REQ: REQ-IPC-002 REQ-IDX-001
(defun client-get (client key)
  "Pre: READY owner, binary key. Post: values :FOUND copied document or :ABSENT NIL."
  (exchange-local-client client 2 key nil))

;;; REQ: REQ-IPC-002 REQ-WAL-006
(defun client-delete (client key)
  "Pre: READY owner, binary key. Post: strong tombstone CSN, without retry."
  (exchange-local-client client 3 key nil))

;;; REQ: REQ-IPC-002
(defun client-ping (client)
  "Pre: READY owner after WELCOME. Post: NIL after a correlated PING response from the operational engine."
  (exchange-local-client client 0 nil nil))
