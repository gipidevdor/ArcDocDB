;;;; Query scalari sul piano completo: non eseguono le azioni suggerite.
;;; OWNER: piano immutabile del chiamante, entry private non esportate.
;;; SHARED: letture concorrenti senza cache, lock o scritture condivise fra Serie.
(in-package #:arcdocdb.recovery.manifest)
(declaim (optimize (safety 3) (debug 2)))

;;; REQ: REQ-REC-001 REQ-REC-002 REQ-AFF-008
(declaim (ftype (function (reconciliation-plan)
                         (values (member :ready :degraded :faulted) &optional)) stato-riconciliazione))
(defun stato-riconciliazione (plan)
  "Pre: completed plan. Post: availability of required names, not engine state.
TYPE-ERROR for invalid types with safety3; no modification or traffic authorization."
  (%plan-health plan))

;;; REQ: REQ-REC-001 REQ-REC-002 REQ-AFF-008
(declaim (ftype (function (reconciliation-plan) (values index &optional))
                numero-azioni-riconciliazione))
(defun numero-azioni-riconciliazione (plan)
  "Pre: completed plan. Post: distinct ID count, including anomalies and missing entries.
TYPE-ERROR for invalid types with safety3; no private container returned."
  (length (%plan-entries plan)))

;;; REQ: REQ-REC-001 REQ-REC-002 REQ-AFF-008 REQ-AFF-018
(declaim (ftype (function (reconciliation-plan integer)
                         (values u64 (member :temporary :final :absent :both)
                                 (member :use :rename :delete :anomaly :missing :conflict)
                                 (member :active :closed :removed :unknown) &optional))
                azione-riconciliazione))
(defun azione-riconciliazione (plan position)
  "Pre: completed plan and integer index. Post: scalar ID, form, action, manifest state.
INVALID-ARGUMENT for index outside range; TYPE-ERROR for invalid types, no alias exposed."
  (unless (<= 0 position (1- (numero-azioni-riconciliazione plan)))
    (error 'invalid-argument :reason :reconciliation-index))
  (let ((entry (the reconciliation-entry (aref (%plan-entries plan) position))))
    (values (%re-id entry) (%re-form entry) (%re-action entry) (%re-state entry))))
