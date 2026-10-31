;;;; Risolve solo il writer CLAIMED: begin e doppia lease restano passi espliciti.
;;; OWNER: contesto e link locali; l'obbligo resta al worker anche dopo un fault.
;;; SHARED: registro immutabile letto per tratto; nessuna guard o scrittura globale.
(in-package #:arcdocdb.execution.series)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (tabella-worker-serie writer-programmabile) index) %routing-ordinal))
(defun %routing-ordinal (table writer)
  "Pre: owner and CLAIMED verified. Post: bounded ordinal and EQ writer in the slot.
INVARIANT-VIOLATION for unknown/stale/alias; no begin, pop, or live Serie access."
  (let* ((registry (tabella-worker-serie-registry table)) (size (%routing-size registry))
         (ordinal (arcdocdb.execution:indice-routing-writer writer)))
    (unless (= (length (tabella-worker-serie-links table)) size)
      (error 'invariant-violation :reason :worker-serie-routing))
    (unless (typep ordinal 'index)
      (error 'invariant-violation :reason :worker-serie-routing))
    (unless (< ordinal size)
      (error 'invariant-violation :reason :worker-serie-routing))
    (unless (eq writer (svref (registro-worker-serie-writers registry) ordinal))
      (error 'invariant-violation :reason :worker-serie-routing))
    ordinal))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (tabella-worker-serie writer-programmabile index) collegamento-worker-serie)
                %routing-link))
(defun %routing-link (table writer ordinal)
  "Pre: ordinal and writer validated, exclusive owner. Post: pair's IDLE link.
INVARIANT-VIOLATION for corrupt private link/binding/phase; controller never read or mutated."
  (let ((link (svref (tabella-worker-serie-links table) ordinal)))
    (unless (typep link 'collegamento-worker-serie)
      (error 'invariant-violation :reason :worker-serie-routing))
    (unless (eq (collegamento-worker-serie-context link) (tabella-worker-serie-context table))
      (error 'invariant-violation :reason :worker-serie-routing))
    (unless (eq (collegamento-worker-serie-writer link) writer)
      (error 'invariant-violation :reason :worker-serie-routing))
    (unless (eq (collegamento-worker-serie-controller link)
                (svref (registro-worker-serie-controllers (tabella-worker-serie-registry table)) ordinal))
      (error 'invariant-violation :reason :worker-serie-routing))
    (unless (eq (collegamento-worker-serie-state link) :idle)
      (error 'invariant-violation :reason :worker-serie-routing))
    (%check-worker-serie link)
    link))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (tabella-worker-serie) collegamento-worker-serie) collega-writer-worker-serie))
(defun collega-writer-worker-serie (table)
  "Pre: exclusive owner, worker CLAIMED from the ring, full recirculation or adoption.
Post: corresponding preallocated link in O(1); repeatable lookup without effects.
Typed errors for incorrect phase/owner without mutation; inconsistent routing makes the worker
FAULTED, retaining the obligation and original condition, without touching the Serie."
  (let ((context (tabella-worker-serie-context table)))
    (arcdocdb.execution::%passo-worker (context (:worker-state) ())
      (arcdocdb.execution::%richiedi-worker context :claimed)
      (arcdocdb.execution::%passo-worker (context () ())
        (let ((writer (writer-worker-writer context)))
          (%routing-link table writer (%routing-ordinal table writer)))))))
