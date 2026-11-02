;;; OWNER: serial service actor and exclusive connection workspace; explicit request is a barrier.
(in-package #:arcdocdb.local)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IPC-002 REQ-TXS-002 REQ-TXS-003 REQ-WAL-002 REQ-WAL-006 REQ-AFF-004
(declaim (ftype (function (e:motore local-connection envelope &optional (or null function)) b:index)
                local-dispatch-conditional-group))
(defun local-dispatch-conditional-group (engine connection envelope &optional clock)
  "Pre: complete request, drained earlier writes and reserved response. Post: exact individual results after strong completion.
Every distinct-key/frame/domain/deadline check precedes engine admission. All conflicts skip writer maintenance/flush.
Independent SEALs commit applied records; covering strong flush/FIFO publication precedes response. No transaction.
Only unadmitted READY capacity refusal gives status 2; no split/retry. Encoding/admitted errors propagate uncertainty."
  (let ((out (local-connection-output connection)) (work (local-connection-group-workspace connection))
        (id (envelope-id envelope)))
    (unwind-protect
         (cond
           ((not (local-connection-conditional-groups connection)) (encode-local-response out id 4))
           ((not (eq :ready (e:stato-motore engine))) (encode-local-response out id 3))
           (t (multiple-value-bind (status count)
                  (decode-local-conditional-group (local-connection-input connection) envelope (local-connection-space connection)
                    work (local-connection-group-limit connection))
                (if (plusp status) (encode-local-response out id status)
                    (progn
                      (check-local-read-group-deadline connection clock)
                      (let ((completed
                              (handler-case
                                  (e:scrivi-gruppo-documenti-se-versione engine (local-group-workspace-operations work)
                                    (local-group-workspace-expected work) (local-group-workspace-csns work)
                                    (local-group-workspace-applied work) :count count)
                                (arcdocdb.conditions:resource-exhausted (condition)
                                  (unless (eq :ready (e:stato-motore engine)) (error condition)) nil))))
                        (if completed
                            (encode-local-conditional-response out id (local-group-workspace-csns work)
                              (local-group-workspace-applied work) count)
                            (encode-local-response out id 2))))))))
      (clear-local-group-workspace work))))
