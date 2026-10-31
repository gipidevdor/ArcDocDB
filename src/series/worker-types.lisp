;;;; Due capacità per tratto; nessuna coda, attesa, lookup o callback aggiunta.
;;; OWNER: campi del collegamento locali al thread creatore del contesto worker.
;;; SHARED: soltanto owner/health della Serie; nessuna scrittura globale per messaggio.
(in-package #:arcdocdb.execution.series)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(defstruct (collegamento-worker-serie
             (:constructor %make-collegamento-worker-serie (context writer controller))
             (:copier nil))
  "Pre: unique writer/Serie association established by caller at startup.
Post: preallocated IDLE, monotonic local tokens. No per-slice allocation."
  (context nil :type contesto-worker-writer :read-only t)
  (writer nil :type writer-programmabile :read-only t)
  (controller nil :type controllore-serie :read-only t)
  (generation 0 :type index) (writer-lease 0 :type index) (series-lease 0 :type index)
  (state :idle :type (member :idle :active :closing :faulted))
  (fault nil :type (or null condition)))

;;; REQ: REQ-CON-002 REQ-AFF-008
(declaim (ftype (function (collegamento-worker-serie) null) %check-owner-worker-serie))
(defun %check-owner-worker-serie (link)
  "Pre: local link. Post: context owner verified before fields.
INVALID-ARGUMENT :worker-owner on a foreign thread, without poisoning or mutations."
  (arcdocdb.execution::%check-owner-worker (collegamento-worker-serie-context link)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (collegamento-worker-serie) null) %check-writer-worker-serie))
(defun %check-writer-worker-serie (link)
  "Pre: verified owner, slice started. Post: current writer and captured lease.
INVARIANT-VIOLATION for bypass/staleness, delegated worker verifier; no pop."
  (let ((context (collegamento-worker-serie-context link)))
    (unless (plusp (collegamento-worker-serie-generation link))
      (error 'invariant-violation :reason :worker-serie-generation))
    (unless (eq (writer-worker-writer context) (collegamento-worker-serie-writer link))
      (error 'invariant-violation :reason :worker-serie-binding))
    (unless (plusp (collegamento-worker-serie-writer-lease link))
      (error 'invariant-violation :reason :worker-serie-lease))
    (unless (= (arcdocdb.execution::contesto-worker-writer-lease context)
               (collegamento-worker-serie-writer-lease link))
      (error 'invariant-violation :reason :worker-serie-lease))
    (arcdocdb.execution::%check-worker context))
  nil)

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (collegamento-worker-serie) null) %check-worker-serie))
(defun %check-worker-serie (link)
  "Pre: exclusive owner. Post: consistent shape and capabilities still owned.
Typed invariants; CLOSING with Serie already handed off does not read controller."
  (%check-owner-worker-serie link)
  (unless (null (collegamento-worker-serie-fault link))
    (error 'invariant-violation :reason :worker-serie-state))
  (case (collegamento-worker-serie-state link)
    (:idle
     (unless (zerop (collegamento-worker-serie-writer-lease link))
       (error 'invariant-violation :reason :worker-serie-lease))
     (unless (zerop (collegamento-worker-serie-series-lease link))
       (error 'invariant-violation :reason :worker-serie-lease)))
    (:active
     (%check-writer-worker-serie link)
     (unless (member (stato-worker-writer (collegamento-worker-serie-context link)) '(:running :batch))
       (error 'invariant-violation :reason :worker-serie-state))
     (arcdocdb.series::%check-owner (collegamento-worker-serie-controller link)
                                   (collegamento-worker-serie-series-lease link)))
    (:closing
     (%check-writer-worker-serie link)
     (unless (member (stato-worker-writer (collegamento-worker-serie-context link)) '(:running :finishing))
       (error 'invariant-violation :reason :worker-serie-state)))
    (otherwise (error 'invariant-violation :reason :worker-serie-state)))
  nil)

;;; REQ: REQ-CON-002 REQ-AFF-008
(declaim (ftype (function (collegamento-worker-serie list) null) %require-worker-serie)
         (ftype (function (collegamento-worker-serie t) null) %check-token-worker-serie))
(defun %require-worker-serie (link states)
  "Pre: exclusive owner, bounded literal phase list. Post: admitted phase.
RESOURCE-EXHAUSTED outside phase; capabilities checked only in admitted phase."
  (unless (member (collegamento-worker-serie-state link) states)
    (error 'resource-exhausted :reason :worker-serie-state))
  (%check-worker-serie link)
  nil)

;;; REQ: REQ-CON-002 REQ-AFF-008
(defun %check-token-worker-serie (link token)
  "Pre: owner and phase verified. Post: positive token for link/slice pair.
INVALID-ARGUMENT for type, zero, or stale generation, before any mutation."
  (unless (typep token 'index) (error 'invalid-argument :reason :worker-serie-token))
  (unless (plusp token) (error 'invalid-argument :reason :worker-serie-token))
  (unless (= token (collegamento-worker-serie-generation link))
    (error 'invalid-argument :reason :worker-serie-token))
  nil)

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (contesto-worker-writer writer-programmabile controllore-serie)
                         collegamento-worker-serie) crea-collegamento-worker-serie))
(defun crea-collegamento-worker-serie (context writer controller)
  "Pre: startup on worker thread, unique writer/Serie mapping enforced by caller.
Post: immutable IDLE binding; INVALID-ARGUMENT for owner, no claim or new lease."
  (arcdocdb.execution::%check-owner-worker context)
  (let ((link (%make-collegamento-worker-serie context writer controller)))
    (%check-worker-serie link)
    link))

;;; REQ: REQ-CON-002 REQ-AFF-008
(declaim (ftype (function (collegamento-worker-serie) (member :idle :active :closing :faulted)) stato-worker-serie)
         (ftype (function (collegamento-worker-serie) (or null condition)) errore-worker-serie))
(defun stato-worker-serie (link)
  "Pre: current owner. Post: local phase, even after fault; INVALID-ARGUMENT for owner."
  (%check-owner-worker-serie link)
  (collegamento-worker-serie-state link))

;;; REQ: REQ-CON-002 REQ-AFF-008
(defun errore-worker-serie (link)
  "Pre: current owner. Post: original condition or NIL; INVALID-ARGUMENT for owner.
Neither transfers capabilities nor restores a faulted slice."
  (%check-owner-worker-serie link)
  (collegamento-worker-serie-fault link))
