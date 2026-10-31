;;;; Contesto preallocato di un worker: nessuna migrazione o reentrancy.
;;; OWNER: campi locali al thread creatore; obbligo e lease mai abbandonati su busy.
;;; SHARED: soltanto lista pronta per tratto (ADR-0045 §8); nessuna scrittura globale.
(in-package #:arcdocdb.execution)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(defstruct (contesto-worker-writer
             (:constructor %make-contesto-worker-writer (ready owner cursor)) (:copier nil))
  "Pre: valid list and single non-reentrant owner. Post: IDLE without obligations.
No thread created; local batch generation is monotonic and never reset."
  (ready (error 'invariant-violation :reason :worker-state) :type lista-writer-pronti :read-only t)
  (owner (error 'invariant-violation :reason :worker-state) :type sb-thread:thread :read-only t)
  (cursor 0 :type index) (home 0 :type index)
  (writer nil :type (or null writer-programmabile))
  (lease 0 :type index) (pending 0 :type index) (batch-generation 0 :type index)
  (fault nil :type (or null condition))
  (state :idle :type (member :idle :claimed :running :batch :finishing :reschedule :faulted)))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (contesto-worker-writer) null) %check-owner-worker))
(defun %check-owner-worker (context)
  "Pre: local context. Post: current thread is the owner; INVALID-ARGUMENT otherwise."
  (unless (eq (contesto-worker-writer-owner context) sb-thread:*current-thread*)
    (error 'invalid-argument :reason :worker-owner))
  nil)

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (contesto-worker-writer) null) %check-libero-worker))
(defun %check-libero-worker (context)
  "Pre: verified owner, IDLE. Post: empty reference, lease, and debt; typed invariants."
  (unless (null (contesto-worker-writer-writer context))
    (error 'invariant-violation :reason :worker-state))
  (unless (zerop (contesto-worker-writer-lease context))
    (error 'invariant-violation :reason :worker-state))
  (unless (zerop (contesto-worker-writer-pending context))
    (error 'invariant-violation :reason :worker-state))
  nil)

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (contesto-worker-writer) null) %check-obbligo-worker))
(defun %check-obbligo-worker (context)
  "Pre: verified owner, CLAIMED/RESCHEDULE. Post: writer without lease/debt; typed invariants."
  (unless (typep (contesto-worker-writer-writer context) 'writer-programmabile)
    (error 'invariant-violation :reason :worker-state))
  (unless (zerop (contesto-worker-writer-lease context))
    (error 'invariant-violation :reason :worker-state))
  (unless (zerop (contesto-worker-writer-pending context))
    (error 'invariant-violation :reason :worker-state))
  nil)

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (contesto-worker-writer) null) %check-lease-worker))
(defun %check-lease-worker (context)
  "Pre: verified owner. Post: current writer and lease; typed invariant or invalid-lease errors."
  (let ((writer (contesto-worker-writer-writer context)))
    (unless (typep writer 'writer-programmabile)
      (error 'invariant-violation :reason :worker-state))
    (%check-lease (writer-programmabile-queue writer) (contesto-worker-writer-lease context)))
  nil)

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (contesto-worker-writer) null) %check-attivo-worker))
(defun %check-attivo-worker (context)
  "Pre: verified owner, RUNNING/FINISHING. Post: current lease without batch; typed invariants."
  (%check-lease-worker context)
  (unless (zerop (contesto-worker-writer-pending context))
    (error 'invariant-violation :reason :worker-state))
  nil)

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (contesto-worker-writer) null) %check-batch-worker))
(defun %check-batch-worker (context)
  "Pre: verified owner, BATCH. Post: current lease and positive batch; typed invariants."
  (%check-lease-worker context)
  (unless (plusp (contesto-worker-writer-pending context))
    (error 'invariant-violation :reason :worker-state))
  (unless (<= (contesto-worker-writer-pending context)
              (coda-writer-extracted
               (writer-programmabile-queue (contesto-worker-writer-writer context))))
    (error 'invariant-violation :reason :worker-state))
  (unless (plusp (contesto-worker-writer-batch-generation context))
    (error 'invariant-violation :reason :worker-state))
  nil)

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (contesto-worker-writer) null) %check-worker))
(defun %check-worker (context)
  "Pre: exclusive non-reentrant access. Post: consistent owner, indices, and state.
INVALID-ARGUMENT for owner; private indices are invariants, lease checked by delegated verifiers."
  (%check-owner-worker context)
  (unless (null (contesto-worker-writer-fault context))
    (error 'invariant-violation :reason :worker-state))
  (let ((size (length (lista-writer-pronti-partitions (contesto-worker-writer-ready context)))))
    (unless (< (contesto-worker-writer-cursor context) size)
      (error 'invariant-violation :reason :worker-state))
    (unless (< (contesto-worker-writer-home context) size)
      (error 'invariant-violation :reason :worker-state)))
  (%partizione-verificata (contesto-worker-writer-ready context) (contesto-worker-writer-cursor context))
  (%partizione-verificata (contesto-worker-writer-ready context) (contesto-worker-writer-home context))
  (case (contesto-worker-writer-state context)
    (:idle (%check-libero-worker context))
    ((:claimed :reschedule) (%check-obbligo-worker context))
    ((:running :finishing) (%check-attivo-worker context))
    (:batch (%check-batch-worker context))
    (otherwise (error 'invariant-violation :reason :worker-state)))
  nil)

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (contesto-worker-writer symbol) null) %richiedi-worker))
(defun %richiedi-worker (context state)
  "Pre: exclusive owner and required phase. Post: verified shape and phase.
RESOURCE-EXHAUSTED :WORKER-STATE for an out-of-phase operation; typed verifiers."
  (%check-worker context)
  (unless (eq (contesto-worker-writer-state context) state)
    (error 'resource-exhausted :reason :worker-state))
  nil)

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (lista-writer-pronti &key (:start t)) contesto-worker-writer) crea-contesto-worker-writer))
(defun crea-contesto-worker-writer (ready &key (start 0))
  "Pre: valid list; creation on owner thread before the hot path.
Post: preallocated IDLE with cursor START; INVALID-ARGUMENT for index, list invariants."
  (%partizione-verificata ready start)
  (let ((context (%make-contesto-worker-writer ready sb-thread:*current-thread* (the index start))))
    (%check-worker context)
    context))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (contesto-worker-writer) (member :idle :claimed :running :batch :finishing :reschedule :faulted)) stato-worker-writer))
(defun stato-worker-writer (context)
  "Pre: current owner. Post: local phase, readable even for fault diagnosis.
INVALID-ARGUMENT for owner; no mutation or verification of writer under guard."
  (%check-owner-worker context)
  (contesto-worker-writer-state context))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (contesto-worker-writer) (or null writer-programmabile)) writer-worker-writer))
(defun writer-worker-writer (context)
  "Pre: current owner. Post: opaque local reference for diagnosis/integration.
INVALID-ARGUMENT for owner; neither transfers obligations nor permits duplicating them."
  (%check-owner-worker context)
  (contesto-worker-writer-writer context))


;;; REQ: REQ-CON-004 REQ-AFF-008
(declaim (ftype (function (contesto-worker-writer) (or null condition)) errore-worker-writer))
(defun errore-worker-writer (context)
  "Pre: current owner. Post: original local fault condition or NIL.
INVALID-ARGUMENT for owner; neither resets fault nor transfers leases/obligations."
  (%check-owner-worker context)
  (contesto-worker-writer-fault context))
