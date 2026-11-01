;;; OWNER: serial service actor, existing value/output buffers and exclusive group workspace.
;;; SHARED: no pin, engine lease, partial response or borrowed key escapes dispatch.
(in-package #:arcdocdb.local)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IPC-002 REQ-LIM-003
(declaim (ftype (function (local-connection (or null function)) null) check-local-read-group-deadline))
(defun check-local-read-group-deadline (connection clock)
  "Pre: actor before/after finite GET work, original frame deadline. Post: not expired or PROTOCOL-ERROR before queueing.
The optional clock is omitted only by standalone dispatcher callers; no renewal or peer wait."
  (when (and clock (>= (local-now clock) (local-connection-deadline connection)))
    (error 'protocol-error :reason :local-read-group-deadline)) nil)

;;; REQ: REQ-IPC-002 REQ-IDX-001 REQ-AFF-008
(declaim (ftype (function ((member :found :absent) b:index) b:index) local-read-member-size))
(defun local-read-member-size (status size)
  "Pre: completed canonical GET. Post: exact encoded result size, with absence/length invariants checked.
No copy or success may be constructed from an inconsistent GET result."
  (unless (if (eq status :found) (<= 1 size +max-document-bytes+) (zerop size))
    (error 'arcdocdb.conditions:invariant-violation :reason :local-read-group-result))
  (if (eq status :found) (+ 2 (%wire-head-size size) size) 3))

;;; REQ: REQ-IPC-002 REQ-IDX-001 REQ-CCH-002 REQ-CCH-004 REQ-LIM-003 REQ-AFF-004
(declaim (ftype (function (e:motore local-connection envelope (integer 1 8) (or null function)) b:index) collect-local-read-group))
(defun collect-local-read-group (engine connection envelope count clock)
  "Pre: complete validated key copies, drained writes, reserved full value/output scratch. Post: whole success or error/null 5.
Canonical GETs finish serially on one current view, releasing every pin before response send. No interleaved writer/peer wait.
Actual aggregate overflow never reaches engine as a short target and never exposes a partial vector; other faults propagate."
  (let* ((out (local-connection-output connection)) (value (local-connection-value connection))
         (end (min (length out) (+ 4 (local-connection-limit connection)))) (id (envelope-id envelope))
         (keys (local-group-workspace-operations (local-connection-group-workspace connection))))
    (multiple-value-bind (cursor initial-end) (%wire-output-begin out 3 id 0 1 (local-connection-limit connection))
      (unless (= initial-end (1+ cursor)) (error 'arcdocdb.conditions:invariant-violation :reason :local-read-group-header))
      (setf cursor (%wire-put-head out cursor end 4 count))
      (dotimes (i count)
        (check-local-read-group-deadline connection clock)
        (multiple-value-bind (status size) (e:leggi-documento engine (svref keys i) value)
          (check-local-read-group-deadline connection clock)
          (when (> (+ cursor (local-read-member-size status size)) end)
            (return-from collect-local-read-group (encode-local-response out id 5)))
          (setf cursor (%wire-put-head out cursor end 4 2)
                (aref out cursor) (if (eq :found status) #xf5 #xf4)) (incf cursor)
          (if (eq :found status)
              (setf cursor (%wire-put-bstr out cursor end value 0 size))
              (progn (setf (aref out cursor) #xf6) (incf cursor)))))
      (check-local-read-group-deadline connection clock)
      (unless (<= 4 cursor end) (error 'arcdocdb.conditions:invariant-violation :reason :local-read-group-end))
      (%wire-frame-end out cursor))))

;;; REQ: REQ-IPC-002 REQ-IDX-001 REQ-LIM-003 REQ-AFF-004
(declaim (ftype (function (e:motore local-connection envelope &optional (or null function)) b:index) local-dispatch-read-group))
(defun local-dispatch-read-group (engine connection envelope &optional clock)
  "Pre: complete REQUEST and reserved actor scratch. Post: whole current read vector or authoritative rejection.
No data CSN/flush, split or retry; validation precedes all GETs, scratch cleared on every exit."
  (let ((out (local-connection-output connection)) (work (local-connection-group-workspace connection)) (id (envelope-id envelope)))
    (unwind-protect
         (cond
           ((not (local-connection-read-groups connection)) (encode-local-response out id 4))
           ((not (eq :ready (e:stato-motore engine))) (encode-local-response out id 3))
           (t (multiple-value-bind (status count) (decode-local-read-group (local-connection-input connection) envelope work)
                (if (plusp status) (encode-local-response out id status)
                    (collect-local-read-group engine connection envelope count clock)))))
      (clear-local-group-workspace work))))
