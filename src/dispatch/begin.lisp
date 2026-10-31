;;;; Avvio esplicito di un obbligo gia acquisito, senza consultare il pool.
;;; OWNER: dispatcher, contesto e link locali al medesimo thread, non rientrante.
;;; SHARED: routing immutabile e lease della sola Serie per tratto (ADR-0045 §8).
(in-package #:arcdocdb.scheduler.dispatch)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (dispatcher-writer-pool)
                         (values arcdocdb.execution.series:collegamento-worker-serie index
                                 (member :active :closing)
                                 (member nil :serie-busy :serie-lease-generation) &optional))
                inizia-obbligo-pool))
(defun inizia-obbligo-pool (dispatcher)
  "Pre: current owner, CLAIMED worker and associated IDLE link, no reentry.
Post: current link and original token/phase/reason from one bridge begin.
Binding before routing; writer busy preserves CLAIMED/IDLE link without token;
busy/exhausted Serie returns CLOSING/token requiring explicit closure.
No gate, ACK, claim, recycle, pop, retry, or cleanup; C1 errors propagated
with capabilities and cause retained by original boundaries, without C3 fault marking."
  (let ((port (dispatcher-writer-pool-port dispatcher))
        (table (dispatcher-writer-pool-table dispatcher)))
    (%check-dispatcher-binding port table)
    (let ((link (arcdocdb.execution.series:collega-writer-worker-serie table)))
      (multiple-value-bind (token state reason)
          (arcdocdb.execution.series:inizia-worker-serie link)
        (values link token state reason)))))
