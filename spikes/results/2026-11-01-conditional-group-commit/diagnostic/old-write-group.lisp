;;; OWNER: the serial service actor; only complete decoded requests from this turn, no batching timer.
(in-package #:arcdocdb.local)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IPC-002 REQ-AFF-004
(declaim (ftype (function (local-write-queue) null) clear-local-write-queue))
(defun clear-local-write-queue (queue)
  "Pre: actor after execution or fault. Post: no connection/borrowed argument references retained in the collector."
  (fill (local-write-queue-connections queue) nil) (fill (local-write-queue-operations queue) nil)
  (setf (local-write-queue-count queue) 0) nil)

;;; REQ: REQ-IPC-002 REQ-LIM-003
(declaim (ftype (function (local-write-queue function) null) expire-local-write-queue))
(defun expire-local-write-queue (queue clock)
  "Pre: same-turn decoded requests, not admitted. Post: expired connections closed, surviving order preserved.
Fresh absolute-deadline checks precede engine admission; no waiting, renewed frame deadline or data CSN."
  (let ((kept 0) (connections (local-write-queue-connections queue)) (operations (local-write-queue-operations queue)))
    (dotimes (i (local-write-queue-count queue))
      (let ((connection (svref connections i)))
        (if (>= (local-now clock) (local-connection-deadline connection))
            (close-local-connection connection)
            (progn (setf (svref connections kept) connection (svref operations kept) (svref operations i)) (incf kept)))))
    (setf (local-write-queue-count queue) kept))
  nil)

;;; REQ: REQ-IPC-002 REQ-WAL-006 REQ-AFF-004
(declaim (ftype (function (e:motore local-write-queue function) null) flush-local-write-queue))
(defun flush-local-write-queue (engine queue clock)
  "Pre: only decoded writes, reserved responses, stable arguments. Post: strong responses or propagated uncertainty.
One isolated request uses the existing path immediately. Only an unadmitted group capacity refusal can split
into individual admissions; no admitted write, encoding failure or unknown outcome is retried."
  (unwind-protect
       (progn
         (expire-local-write-queue queue clock)
         (let* ((count (local-write-queue-count queue)) (operations (local-write-queue-operations queue))
                (connections (local-write-queue-connections queue)) (csns (local-write-queue-csns queue))
                (grouped
                  (when (> count 1)
                    (handler-case (progn (e:scrivi-gruppo-documenti engine operations csns :count count) t)
                      (arcdocdb.conditions:resource-exhausted (condition)
                        (unless (eq :ready (e:stato-motore engine)) (error condition)) nil)))))
           (dotimes (i count)
             (let* ((connection (svref connections i)) (op (svref operations i))
                    (envelope (local-connection-pending connection))
                    (size (if grouped
                              (encode-local-response (local-connection-output connection) (envelope-id envelope) 0 :csn (aref csns i))
                              (local-dispatch-command engine connection (envelope-id envelope) (envelope-code envelope)
                                0 (e::operazione-scrittura-key op) (e::operazione-scrittura-value op)))))
               (queue-local-output connection size :response (local-now clock))))))
    (clear-local-write-queue queue))
  nil)

;;; REQ: REQ-IPC-002 REQ-WAL-002 REQ-LIM-003
(declaim (ftype (function (e:motore local-connection local-write-queue function) null) dispatch-local-pending))
(defun dispatch-local-pending (engine connection queue clock)
  "Pre: full frame and admitted request ID in actor slot order. Post: queued write or immediate checked command.
Reads/PING/rejections/explicit groups drain prior writes as barriers; one decoder invocation per request."
  (let ((envelope (local-connection-pending connection)))
    (unless envelope (error 'arcdocdb.conditions:invariant-violation :reason :local-pending-envelope))
    (when (and (member (envelope-code envelope) '(4 5 6))
               (< (local-now clock) (local-connection-deadline connection)))
      (flush-local-write-queue engine queue clock)
      (if (>= (local-now clock) (local-connection-deadline connection))
          (close-local-connection connection)
          (queue-local-output connection (local-dispatch engine connection envelope clock) :response (local-now clock)))
      (return-from dispatch-local-pending nil))
    (if (>= (local-now clock) (local-connection-deadline connection))
        (close-local-connection connection)
        (multiple-value-bind (status key document)
            (decode-local-command (local-connection-input connection) envelope (local-connection-space connection))
          (if (and (zerop status) (member (envelope-code envelope) '(1 3)) (eq :ready (e:stato-motore engine)))
              (progn
                (when (= (local-write-queue-count queue) (local-write-queue-limit queue))
                  (flush-local-write-queue engine queue clock))
                (let ((i (local-write-queue-count queue)))
                  (unless (< i 8) (error 'arcdocdb.conditions:invariant-violation :reason :local-write-queue-full))
                  (setf (svref (local-write-queue-connections queue) i) connection
                        (svref (local-write-queue-operations queue) i)
                        (e:crea-operazione-scrittura (if (= 1 (envelope-code envelope)) :put :delete) key document))
                  (incf (local-write-queue-count queue))))
              (progn
                (flush-local-write-queue engine queue clock)
                (if (>= (local-now clock) (local-connection-deadline connection))
                    (close-local-connection connection)
                    (queue-local-output connection
                      (local-dispatch-command engine connection (envelope-id envelope) (envelope-code envelope) status key document)
                      :response (local-now clock))))))))
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
