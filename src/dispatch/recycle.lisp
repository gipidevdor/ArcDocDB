;;;; Risolve un obbligo RESCHEDULE prima di consultare nuovamente il pool.
;;; OWNER: dispatcher, contesto e link del thread creatore, senza reentrancy.
;;; SHARED: una partizione ready home per tratto (ADR-0045 §8), poi routing immutabile.
(in-package #:arcdocdb.scheduler.dispatch)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CON-004 REQ-AFF-008
(declaim (notinline %check-recycle-status))
(declaim (ftype (function (t) (member :claimed :published)) %check-recycle-status))
(defun %check-recycle-status (status)
  "Pre: delegate return, checked as T without propagating ftype assumptions.
Post: known status; unexpected status yields INVARIANT-VIOLATION without mutating context or ready.
NOTINLINE retains boundary check even with out-of-type delegate FI."
  (case status
    ((:claimed :published) status)
    (otherwise (error 'invariant-violation :reason :pool-dispatcher-state))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (dispatcher-writer-pool)
                         (values (or null arcdocdb.execution.series:collegamento-worker-serie)
                                 (member :claimed :published) index &optional))
                ricircola-collegamento-pool))
(defun ricircola-collegamento-pool (dispatcher)
  "Pre: current owner, RESCHEDULE with unique obligation and previous bridge closed.
Post: one ready operation: NIL/PUBLISHED/count and IDLE, or IDLE link of
new CLAIMED/count. Partition count, not cursor; no implicit begin.
Does not read pool or acknowledge retirement; busy retains obligation and explicit retry.
Binding before transfer; C1 errors retain their boundaries.
Routing failure after full retains exchange, without rollback or new C3 fault."
  (let ((port (dispatcher-writer-pool-port dispatcher))
        (table (dispatcher-writer-pool-table dispatcher)))
    (%check-dispatcher-binding port table)
    (multiple-value-bind (writer outcome count)
        (arcdocdb.execution:ricircola-worker
         (arcdocdb.scheduler::porta-worker-pool-context port))
      (let ((status (%check-recycle-status outcome)))
        (case status
          (:claimed
           (unless writer (error 'invariant-violation :reason :pool-dispatcher-state))
           (values (arcdocdb.execution.series:collega-writer-worker-serie table) status count))
          (:published
           (when writer (error 'invariant-violation :reason :pool-dispatcher-state))
           (values nil status count))
          (otherwise (error 'invariant-violation :reason :pool-dispatcher-state)))))))
