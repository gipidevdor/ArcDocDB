;;;; Admission logica del singolo claim; obblighi preesistenti restano a execution.
;;; OWNER: solo proprietario della porta e del suo contesto, non rientrante.
;;; SHARED: ACK del lifecycle per ondata; ready modificata solo dall'API C1 delegata.
(in-package #:arcdocdb.scheduler)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (porta-worker-pool)
                         (values (or null arcdocdb.execution:writer-programmabile)
                                 (member :claimed :empty :busy :inactive)
                                 arcdocdb.binary:index
                                 (member :unchanged :activated :retired :busy :faulted)
                                 &optional)) prendi-writer-pool))
(defun prendi-writer-pool (port)
  "Pre: current owner, IDLE without epoch or external resources; no reentry.
Post: one C1 claim if active, or INACTIVE without ready/cursor mutation.
INVALID-ARGUMENT for owner, RESOURCE-EXHAUSTED for phase; invariants before the gate.
Late commands remain pending until the next IDLE; no rollback or waiting."
  (unless (eq (porta-worker-pool-owner port) sb-thread:*current-thread*)
    (error 'invalid-argument :reason :pool-worker-owner))
  (let ((context (porta-worker-pool-context port)))
    (unless (eq (arcdocdb.execution:stato-worker-writer context) :idle)
      (error 'resource-exhausted :reason :worker-state))
    (arcdocdb.execution::%richiedi-worker context :idle)
    (multiple-value-bind (active action) (applica-stato-worker-pool port)
      (if active
          (multiple-value-bind (writer status next)
              (arcdocdb.execution:prendi-writer-worker context)
            (values writer status next action))
          (values nil :inactive
                  (arcdocdb.execution::contesto-worker-writer-cursor context) action)))))
