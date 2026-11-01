;;; OWNER: the serial service actor; only complete decoded requests from this turn, no batching timer.
(in-package #:arcdocdb.local)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IPC-002 REQ-WAL-006 REQ-AFF-004
(declaim (ftype (function (e:motore local-write-queue function) null) flush-local-write-queue))
(defun flush-local-write-queue (engine queue clock)
  "Pre: decoded same-turn writes, independent conditional keys and reserved responses. Post: complete individual results.
Applicable writes share strong flush; conflicts consume no CSN. Only unadmitted capacity refusal may fall back
to original operations with conditions rechecked. Admitted/encoder failures are never retried."
  (unwind-protect
       (progn
         (expire-local-write-queue queue clock)
         (let* ((count (local-write-queue-count queue)) (operations (local-write-queue-operations queue))
                (csns (local-write-queue-csns queue))
                (grouped
                  (when (> count 1)
                    (handler-case
                        (progn
                          (if (find 1 (local-write-queue-conditions queue) :end count)
                              (e::scrivi-gruppo-con-condizioni engine operations (local-write-queue-conditions queue)
                                (local-write-queue-expected queue) csns (local-write-queue-applied queue) count)
                              (e:scrivi-gruppo-documenti engine operations csns :count count)) t)
                      (arcdocdb.conditions:resource-exhausted (condition)
                        (unless (eq :ready (e:stato-motore engine)) (error condition)) nil)))))
           (dotimes (i count) (finish-local-queued-write engine queue i grouped clock))))
    (clear-local-write-queue queue))
  nil)

;;; REQ: REQ-IPC-002 REQ-IDX-001 REQ-WAL-002 REQ-LIM-003
(declaim (ftype (function (e:motore local-connection local-write-queue (integer 0 5) (or null b:octets)) boolean)
                independent-local-get-p))
(defun independent-local-get-p (engine connection queue status key)
  "Pre: decoded ordinary command, exclusive actor and stable queued keys. Post: GET may precede this disjoint write prefix.
Only a valid READY GET with full response credit and a nonempty independent queue qualifies; at most eight exact comparisons.
The canonical read copies into private output. Dispatch must drain all writes before any socket send (ADR-0088)."
  (and (zerop status) (= 2 (envelope-code (local-connection-pending connection)))
       (>= (local-connection-limit connection) 60032) (eq :ready (e:stato-motore engine))
       (plusp (local-write-queue-count queue)) (not (null key)) (not (queued-local-key-p queue key))))

;;; REQ: REQ-IPC-002 REQ-WAL-002 REQ-LIM-003
(declaim (ftype (function (e:motore local-connection local-write-queue function) null) dispatch-local-pending))
(defun dispatch-local-pending (engine connection queue clock)
  "Pre: full frame and admitted request ID in actor slot order. Post: queued write or immediate checked command.
Only independent ordinary GETs may precede queued writes; other reads/PING/rejections/explicit groups drain them.
Same-key reads and conditional dependencies remain barriers. No response is sent inside dispatch."
  (let ((envelope (local-connection-pending connection)))
    (unless envelope (error 'arcdocdb.conditions:invariant-violation :reason :local-pending-envelope))
    (when (= 6 (envelope-code envelope))
      (dispatch-local-version-pending engine connection queue clock)
      (return-from dispatch-local-pending nil))
    (when (and (member (envelope-code envelope) '(4 5 7))
               (< (local-now clock) (local-connection-deadline connection)))
      (flush-local-write-queue engine queue clock)
      (if (>= (local-now clock) (local-connection-deadline connection))
          (close-local-connection connection)
          (queue-local-response connection (local-dispatch engine connection envelope clock) clock))
      (return-from dispatch-local-pending nil))
    (if (>= (local-now clock) (local-connection-deadline connection))
        (close-local-connection connection)
        (multiple-value-bind (status key document)
            (decode-local-command (local-connection-input connection) envelope (local-connection-space connection))
          (if (and (zerop status) (member (envelope-code envelope) '(1 3)) (eq :ready (e:stato-motore engine)))
              (enqueue-local-write engine connection queue clock (if (= 1 (envelope-code envelope)) :put :delete) key document nil 0)
              (progn
                (unless (independent-local-get-p engine connection queue status key)
                  (flush-local-write-queue engine queue clock))
                (if (>= (local-now clock) (local-connection-deadline connection))
                    (close-local-connection connection)
                    (queue-local-response connection
                      (local-dispatch-command engine connection (envelope-id envelope) (envelope-code envelope) status key document)
                      clock)))))))
  nil)

;;; REQ: REQ-IPC-002 REQ-WAL-002 REQ-AFF-004
(defun dispatch-local-ready (engine connections clock queue)
  "Pre: one nonblocking step per connection completed, all response buffers reserved before listen.
Post: complete same-turn requests admitted in slot order; no queue survives the turn or a failure.
Eight slots bound work; a slow/incomplete peer contributes no write and imposes no batching wait."
  (unwind-protect
       (progn
         (loop for connection across connections do
           (when (eq :pending (local-connection-state connection))
             (handler-case (dispatch-local-pending engine connection queue clock)
               (protocol-error (condition)
                 (unless (eq :ready (e:stato-motore engine)) (error condition)) (close-local-connection connection))
               (arcdocdb.conditions:io-fault (condition)
                 (unless (eq :ready (e:stato-motore engine)) (error condition)) (close-local-connection connection)))))
         (flush-local-write-queue engine queue clock))
    (clear-local-write-queue queue))
  nil)
