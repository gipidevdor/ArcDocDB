;;;; Un solo passo di selezione e, sul solo CLAIMED, un tentativo di avvio.
;;; OWNER: dispatcher, contesto e link sul thread creatore, senza reentrancy.
;;; SHARED: ready/pool per tratto e lease della sola Serie; nessun nuovo stato.
(in-package #:arcdocdb.scheduler.dispatch)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (notinline %prepara-tratto-esito))
(declaim (ftype (function (t t (member :claim :current :recycle) (or null index)
                           (member nil :unchanged :activated :retired :busy :faulted))
                         (values (or null arcdocdb.execution.series:collegamento-worker-serie)
                                 index (member :active :closing :empty :busy :inactive :published)
                                 (member nil :serie-busy :serie-lease-generation)
                                 (member :claim :current :recycle) (or null index)
                                 (member nil :unchanged :activated :retired :busy :faulted) &optional))
                %prepara-tratto-esito))
(defun %prepara-tratto-esito (link status origin detail action)
  "Pre: one step completed by non-reentrant owner, original metadata.
Post: CLAIMED started once; other outcomes without token or implicit work.
Link/status T and NOTINLINE retain out-of-ftype operational defense.
INVARIANT-VIOLATION for pair/status; C1 failures propagated without rollback or cleanup."
  (case status
    (:claimed
     (unless (typep link 'arcdocdb.execution.series:collegamento-worker-serie)
       (error 'invariant-violation :reason :pool-dispatcher-state))
     (multiple-value-bind (token state reason)
         (arcdocdb.execution.series:inizia-worker-serie link)
       (values link token state reason origin detail action)))
    ((:empty :busy :inactive :published)
     (unless (null link) (error 'invariant-violation :reason :pool-dispatcher-state))
     (values nil 0 status nil origin detail action))
    (otherwise (error 'invariant-violation :reason :pool-dispatcher-state))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (dispatcher-writer-pool)
                         (values (or null arcdocdb.execution.series:collegamento-worker-serie)
                                 index (member :active :closing :empty :busy :inactive :published)
                                 (member nil :serie-busy :serie-lease-generation)
                                 (member :claim :current :recycle) (or null index)
                                 (member nil :unchanged :activated :retired :busy :faulted) &optional))
                prepara-tratto-pool))
(defun prepara-tratto-pool (dispatcher)
  "Pre: non-reentrant owner, IDLE/CLAIMED/RESCHEDULE, previous bridge closed.
Post: selection and at most one begin, seven values with original token/phase/reason.
Publication ends immediately. No second routing, pop, ACK, end, or retry.
Binding/phases/faults delegated; CLOSING and capabilities after error remain with caller."
  (multiple-value-bind (link status origin detail action) (passo-dispatcher-pool dispatcher)
    (%prepara-tratto-esito link status origin detail action)))
