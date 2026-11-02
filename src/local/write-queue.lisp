;;; OWNER: finite same-turn collector, existing serial actor and reserved response buffers.
(in-package #:arcdocdb.local)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IPC-002 REQ-AFF-004 REQ-AFF-008
(declaim (ftype (function (local-write-queue) null) clear-local-write-queue))
(defun clear-local-write-queue (queue)
  "Pre: actor after execution or incomplete exit. Post: no connection/operation references or version results retained."
  (fill (local-write-queue-connections queue) nil) (fill (local-write-queue-operations queue) nil)
  (fill (local-write-queue-csns queue) 0) (fill (local-write-queue-expected queue) 0)
  (fill (local-write-queue-conditions queue) 0) (fill (local-write-queue-applied queue) 0)
  (setf (local-write-queue-count queue) 0) nil)

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-004
(declaim (ftype (function (local-write-queue function) null) expire-local-write-queue))
(defun expire-local-write-queue (queue clock)
  "Pre: decoded requests before admission. Post: expired connections closed, surviving inputs/conditions compacted in order.
No wait, renewed deadline or data CSN; output scratch is cleared, references beyond the selected prefix released."
  (let ((kept 0) (connections (local-write-queue-connections queue)) (operations (local-write-queue-operations queue))
        (conditions (local-write-queue-conditions queue)) (expected (local-write-queue-expected queue)))
    (dotimes (i (local-write-queue-count queue))
      (let ((connection (svref connections i)))
        (if (>= (local-now clock) (local-connection-deadline connection)) (close-local-connection connection)
            (progn (setf (svref connections kept) connection (svref operations kept) (svref operations i)
                         (aref conditions kept) (aref conditions i) (aref expected kept) (aref expected i)) (incf kept)))))
    (fill connections nil :start kept) (fill operations nil :start kept)
    (fill conditions 0 :start kept) (fill expected 0 :start kept)
    (fill (local-write-queue-csns queue) 0) (fill (local-write-queue-applied queue) 0)
    (setf (local-write-queue-count queue) kept)) nil)

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-LIM-003
(declaim (ftype (function (local-write-queue b:octets) boolean) queued-local-key-p))
(defun queued-local-key-p (queue key)
  "Pre: stable decoded key. Post: exact binary equality with a preceding queued operation, at most eight comparisons."
  (dotimes (i (local-write-queue-count queue) nil)
    (when (equalp key (e::operazione-scrittura-key (svref (local-write-queue-operations queue) i)))
      (return t))))

;;; REQ: REQ-IPC-002 REQ-IDX-001 REQ-WAL-002 REQ-LIM-003
(declaim (inline independent-local-read-key-p))
(declaim (ftype (function (e:motore local-connection local-write-queue (integer 0 5) (or null b:octets)
                                  (member 60032 60040)) boolean) independent-local-read-key-p))
(defun independent-local-read-key-p (engine connection queue status key minimum)
  "Pre: decoded read, serial owner and stable queued keys. Post: valid full-credit read is independent of this nonempty prefix.
At most eight exact binary comparisons; no admission, allocation or I/O. Errors: none under these preconditions."
  (and (zerop status) (>= (local-connection-limit connection) minimum) (eq :ready (e:stato-motore engine))
       (plusp (local-write-queue-count queue)) (not (null key)) (not (queued-local-key-p queue key))))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-IDX-001 REQ-WAL-002 REQ-LIM-003
(declaim (ftype (function (e:motore local-connection local-write-queue (member 0 1 5) (or null b:octets)
                                  (member 0 1 3)) boolean) independent-local-version-get-p))
(defun independent-local-version-get-p (engine connection queue code key operation)
  "Pre: decoded version request and exclusive actor. Post: only negotiated opcode 6 GET may precede disjoint writes (ADR-0089).
The canonical read copies value and verified CSN into private output; the turn must finish strongly before sending.
No mutation/conflict prediction or global CSN substitution. Errors: none under these preconditions."
  (and (zerop operation) (local-connection-versions connection)
       (= 6 (envelope-code (local-connection-pending connection)))
       (independent-local-read-key-p engine connection queue code key 60040)))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-WAL-002 REQ-LIM-003
(declaim (ftype (function (e:motore local-connection local-write-queue function (member :put :delete) b:octets
                                  (or null b:octets) boolean b:u64) null) enqueue-local-write))
(defun enqueue-local-write (engine connection queue clock kind key document conditional expected)
  "Pre: fully decoded request. Post: queued independent condition or ordinary write, or closed if expired after draining.
Full queue and a conditional key depending on any earlier operation drain first. No batching timer or peer wait."
  (when (or (= (local-write-queue-count queue) (local-write-queue-limit queue))
            (and conditional (queued-local-key-p queue key)))
    (flush-local-write-queue engine queue clock))
  (if (>= (local-now clock) (local-connection-deadline connection)) (close-local-connection connection)
      (let ((i (local-write-queue-count queue)))
        (unless (< i 8) (error 'arcdocdb.conditions:invariant-violation :reason :local-write-queue-full))
        (setf (svref (local-write-queue-connections queue) i) connection
              (svref (local-write-queue-operations queue) i) (e:crea-operazione-scrittura kind key document)
              (aref (local-write-queue-conditions queue) i) (if conditional 1 0)
              (aref (local-write-queue-expected queue) i) expected)
        (incf (local-write-queue-count queue)))) nil)

;;; REQ: REQ-IPC-002 REQ-LIM-003 REQ-AFF-004
(declaim (ftype (function (local-connection b:index function) null) queue-local-response))
(defun queue-local-response (connection size clock)
  "Pre: complete private response and original request deadline. Post: queued only if still valid at a fresh clock sample.
Encoding/commit cannot renew an expired request; close without ACK and preserve any completed strong write."
  (let ((now (local-now clock)))
    (if (>= now (local-connection-deadline connection)) (close-local-connection connection)
        (queue-local-output connection size :response now))) nil)

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-WAL-006 REQ-AFF-004
(declaim (ftype (function (e:motore local-write-queue (integer 0 7) boolean function) null) finish-local-queued-write))
(defun finish-local-queued-write (engine queue i grouped clock)
  "Pre: grouped completion or unadmitted fallback; private output reserved. Post: exact individual result or expired connection closed.
Only fallback enters the engine again. Encoder failures after group commit never become resource rejections/retries."
  (let* ((connection (svref (local-write-queue-connections queue) i)) (op (svref (local-write-queue-operations queue) i))
         (envelope (local-connection-pending connection)) (id (envelope-id envelope))
         (conditional (= 1 (aref (local-write-queue-conditions queue) i)))
         (operation (if (= 1 (e::operazione-scrittura-kind op)) 1 3)))
    (when (>= (local-now clock) (local-connection-deadline connection))
      (close-local-connection connection) (return-from finish-local-queued-write nil))
    (let ((size
             (if grouped
                 (if conditional
                     (encode-local-version-response (local-connection-output connection) id operation
                       (= 1 (aref (local-write-queue-applied queue) i)) (aref (local-write-queue-csns queue) i) (local-connection-value connection) 0)
                     (encode-local-response (local-connection-output connection) id 0 :csn (aref (local-write-queue-csns queue) i)))
                 (if conditional
                     (local-dispatch-version-command engine connection id 0 (e::operazione-scrittura-key op) (e::operazione-scrittura-value op)
                       operation (aref (local-write-queue-expected queue) i) clock)
                     (local-dispatch-command engine connection id operation 0 (e::operazione-scrittura-key op) (e::operazione-scrittura-value op))))))
      (queue-local-response connection size clock))) nil)

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-IDX-001 REQ-LIM-003 REQ-AFF-004
(declaim (ftype (function (e:motore local-connection local-write-queue function) null) dispatch-local-version-pending))
(defun dispatch-local-version-pending (engine connection queue clock)
  "Pre: pending opcode 6, admitted ID. Post: conditional write queued or checked response copied without sending.
One decode only for negotiated READY input; only independent full-credit versioned GET may preserve the write prefix."
  (let ((envelope (local-connection-pending connection)))
    (when (>= (local-now clock) (local-connection-deadline connection))
      (close-local-connection connection) (return-from dispatch-local-version-pending nil))
    (if (and (local-connection-versions connection) (eq :ready (e:stato-motore engine)))
        (multiple-value-bind (code key document operation expected)
            (decode-local-version (local-connection-input connection) envelope (local-connection-space connection))
          (if (and (zerop code) (member operation '(1 3)))
              (enqueue-local-write engine connection queue clock (if (= 1 operation) :put :delete) key document t expected)
              (progn
                (unless (independent-local-version-get-p engine connection queue code key operation)
                  (flush-local-write-queue engine queue clock))
                (check-local-read-group-deadline connection clock)
                (queue-local-response connection
                  (local-dispatch-version-command engine connection (envelope-id envelope) code key document operation expected clock)
                  clock))))
        (progn
          (flush-local-write-queue engine queue clock) (check-local-read-group-deadline connection clock)
          (queue-local-response connection (local-dispatch engine connection envelope clock) clock)))) nil)
