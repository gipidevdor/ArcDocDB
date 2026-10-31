;;;; Un passo di governo: prima gli obblighi, nuova admission solo da IDLE.
;;; OWNER: dispatcher e contesto locali al thread creatore, senza reentrancy.
;;; SHARED: soli ingressi pool/ready/routing esistenti per tratto (ADR-0045 §8).
(in-package #:arcdocdb.scheduler.dispatch)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (notinline %passo-dispatcher-fase))
(declaim (ftype (function (dispatcher-writer-pool t)
                         (values (or null arcdocdb.execution.series:collegamento-worker-serie)
                                 (member :claimed :empty :busy :inactive :published)
                                 (member :claim :current :recycle) (or null index)
                                 (member nil :unchanged :activated :retired :busy :faulted) &optional))
                %passo-dispatcher-fase))
(defun %passo-dispatcher-fase (dispatcher phase)
  "Pre: verified binding, observed phase accepted as T without C1 assumptions.
Post: one operational entry, five values without confusing cursor/count.
Known disallowed phases yield RESOURCE-EXHAUSTED; unexpected phase yields INVARIANT-VIOLATION.
NOTINLINE retains out-of-ftype defense; no check after acquisition."
  (case phase
    (:idle
     (multiple-value-bind (link status cursor action) (prendi-collegamento-pool dispatcher)
       (values link status :claim cursor action)))
    (:claimed
     (values (collega-obbligo-pool dispatcher) :claimed :current nil nil))
    (:reschedule
     (multiple-value-bind (link status count) (ricircola-collegamento-pool dispatcher)
       (values link status :recycle count nil)))
    ((:running :batch :finishing :faulted)
     (error 'resource-exhausted :reason :worker-state))
    (otherwise (error 'invariant-violation :reason :pool-dispatcher-state))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (dispatcher-writer-pool)
                         (values (or null arcdocdb.execution.series:collegamento-worker-serie)
                                 (member :claimed :empty :busy :inactive :published)
                                 (member :claim :current :recycle) (or null index)
                                 (member nil :unchanged :activated :retired :busy :faulted) &optional))
                passo-dispatcher-pool))
(defun passo-dispatcher-pool (dispatcher)
  "Pre: current owner, consistent IDLE/CLAIMED/RESCHEDULE phase, bridge already closed.
Post: mutually exclusive claim/current/recycle, at most one ready transfer; no begin.
Binding before phase read; rejections/faults delegated without rollback or cleanup.
Publication ends step; no implicit new acquisition or ACK after recycle."
  (let ((port (dispatcher-writer-pool-port dispatcher))
        (table (dispatcher-writer-pool-table dispatcher)))
    (%check-dispatcher-binding port table)
    (%passo-dispatcher-fase
     dispatcher (arcdocdb.execution:stato-worker-writer
                 (arcdocdb.scheduler::porta-worker-pool-context port)))))
