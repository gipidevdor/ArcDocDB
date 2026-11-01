;;; OWNER: serial actor; explicit groups are barriers, not members of the opportunistic collector.
;;; SHARED: no lease/pin or borrowed operation escapes this call; peer sends occur afterward.
(in-package #:arcdocdb.local)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-IPC-002 REQ-WAL-002 REQ-WAL-006 REQ-AFF-004
(declaim (ftype (function (e:motore local-connection envelope &optional (or null function)) b:index) local-dispatch-write-group))
(defun local-dispatch-write-group (engine connection envelope &optional clock)
  "Pre: complete REQUEST, reserved response and actor-owned scratch. Post: authoritative rejection or one strong group result.
Negotiation and all member validation precede cumulative engine admission. No individual fallback on capacity refusal.
Each SEAL remains an independent atomic point; response only after all strong publications. Uncertainty propagates."
  (let ((out (local-connection-output connection)) (work (local-connection-group-workspace connection))
        (id (envelope-id envelope)))
    (unwind-protect
         (cond
           ((not (local-connection-write-groups connection)) (encode-local-response out id 4))
           ((not (eq :ready (e:stato-motore engine))) (encode-local-response out id 3))
           (t (multiple-value-bind (status count)
                  (decode-local-write-group (local-connection-input connection) envelope (local-connection-space connection)
                                           work (local-connection-group-limit connection))
                (if (plusp status) (encode-local-response out id status)
                    (progn
                      (when (and clock (>= (local-now clock) (local-connection-deadline connection)))
                        (error 'protocol-error :reason :local-group-deadline))
                      (let ((completed
                              (handler-case
                                  (e:scrivi-gruppo-documenti engine (local-group-workspace-operations work)
                                                            (local-group-workspace-csns work) :count count)
                                (arcdocdb.conditions:resource-exhausted (condition)
                                  (unless (eq :ready (e:stato-motore engine)) (error condition)) nil))))
                        (if completed
                            (progn
                              (unless (= completed count)
                                (error 'arcdocdb.conditions:invariant-violation :reason :local-group-completion))
                              (encode-local-group-response out id (local-group-workspace-csns work) count))
                            (encode-local-response out id 2))))))))
      (clear-local-group-workspace work))))
