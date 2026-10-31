;;;; Costruzione separata dal percorso caldo, prima di qualsiasi obbligo.
;;; OWNER: factory sul thread che possiede porta e contesto, senza reentrancy.
;;; SHARED: solo riferimenti immutabili, nessuna pubblicazione o lettura di comandi.
(in-package #:arcdocdb.scheduler.dispatch)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (t t) dispatcher-writer-pool) crea-dispatcher-writer-pool))
(defun crea-dispatcher-writer-pool (port table)
  "Pre: preallocated port and table, same free context, current owner.
Post: immutable dispatcher without acquiring work or applying commands.
INVALID-ARGUMENT for type/owner/binding; RESOURCE-EXHAUSTED for non-IDLE phase;
read-only C1 barrier on complete IDLE, no new C3 fault marking."
  (%check-dispatcher-binding port table)
  (let ((context (arcdocdb.scheduler::porta-worker-pool-context port)))
    (unless (eq (arcdocdb.execution:stato-worker-writer context) :idle)
      (error 'resource-exhausted :reason :worker-state))
    (arcdocdb.execution::%richiedi-worker context :idle))
  (%make-dispatcher-writer-pool port table))
