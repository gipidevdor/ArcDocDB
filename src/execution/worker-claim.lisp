;;;; Contesto preallocato di un worker: nessuna migrazione o reentrancy.
;;; OWNER: campi locali al thread creatore; obbligo e lease mai abbandonati su busy.
;;; SHARED: soltanto lista pronta per tratto (ADR-0045 §8); nessuna scrittura globale.
(in-package #:arcdocdb.execution)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (contesto-worker-writer t index) null) %assegna-worker))
(defun %assegna-worker (context writer home)
  "Pre: IDLE/RESCHEDULE verified, successful transfer from the ring. Post: CLAIMED.
INVARIANT-VIOLATION for inconsistent writer/phase; no rollback after an internal fault."
  (%check-worker context)
  (unless (typep writer 'writer-programmabile)
    (error 'invariant-violation :reason :worker-state))
  (case (contesto-worker-writer-state context)
    ((:idle :reschedule) nil)
    (otherwise (error 'invariant-violation :reason :worker-state)))
  (setf (contesto-worker-writer-writer context) writer
        (contesto-worker-writer-home context) home
        (contesto-worker-writer-state context) :claimed)
  (%check-worker context)
  nil)

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (contesto-worker-writer) (values (or null writer-programmabile) (member :claimed :empty :busy) index &optional)) prendi-writer-worker))
(defun prendi-writer-worker (context)
  "Pre: IDLE and current owner. Post: CLAIMED with obligation/home, or IDLE with
rotated cursor for EMPTY/BUSY. Typed verifiers, incorrect phase RESOURCE-EXHAUSTED;
EMPTY remains local, never proof of quiescence for parking or shutdown."
  (%passo-worker (context (:worker-state) ())
  (%richiedi-worker context :idle)
  (let ((ready (contesto-worker-writer-ready context)))
    (multiple-value-bind (writer status next)
        (preleva-writer-pronto ready (contesto-worker-writer-cursor context))
      (setf (contesto-worker-writer-cursor context) next)
      (case status
        (:writer
         (%assegna-worker context writer
           (mod (+ next (1- (length (lista-writer-pronti-partitions ready))))
                (length (lista-writer-pronti-partitions ready))))
         (values writer :claimed next))
        ((:empty :busy) (%check-worker context) (values nil status next))
        (otherwise (error 'invariant-violation :reason :worker-state)))))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (contesto-worker-writer) index) inizia-tratto-worker))
(defun inizia-tratto-worker (context)
  "Pre: CLAIMED without a lease. Post: RUNNING with the current thread's lease.
Busy preserves CLAIMED; not-ready/generation remain permanent task faults;
typed handoff conditions and verifiers, no retry or lost reference."
  (%passo-worker (context (:worker-state :writer-queue-busy) ())
  (%richiedi-worker context :claimed)
  (let ((lease (inizia-tratto-writer (contesto-worker-writer-writer context))))
    (setf (contesto-worker-writer-lease context) lease
          (contesto-worker-writer-state context) :running)
    (%check-worker context)
    lease)))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (contesto-worker-writer) (values (or null writer-programmabile) (member :claimed :published) index &optional)) ricircola-worker))
(defun ricircola-worker (context)
  "Pre: RESCHEDULE, unique obligation, current owner. Post: full transfers a new
head to the CLAIMED context; room publishes and releases to IDLE. Busy retains the obligation.
Typed ready conditions/verifiers; no retry or deduplication, full count unchanged."
  (%passo-worker (context (:worker-state :ready-queue-busy) ())
  (%richiedi-worker context :reschedule)
  (multiple-value-bind (writer status count)
      (ricircola-writer-pronto (contesto-worker-writer-ready context)
                              (contesto-worker-writer-home context)
                              (contesto-worker-writer-writer context))
    (case status
      (:writer (%assegna-worker context writer (contesto-worker-writer-home context))
               (values writer :claimed count))
      (:published
       (unless (null writer) (error 'invariant-violation :reason :worker-state))
       (setf (contesto-worker-writer-writer context) nil
             (contesto-worker-writer-state context) :idle)
       (%check-worker context)
       (values nil :published count))
      (otherwise (error 'invariant-violation :reason :worker-state))))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (contesto-worker-writer t t) null) adotta-writer-worker))
(defun adotta-writer-worker (context writer home)
  "Pre: IDLE, unique obligation outside the ring entrusted to the caller, stable home.
Post: CLAIMED on the context, obligation transferred from the caller; INVALID-ARGUMENT
for writer/home before writes, typed phase/owner/verifiers. No deduplication."
  (%passo-worker (context (:worker-state) (:worker-writer :ready-target))
  (%richiedi-worker context :idle)
  (unless (typep writer 'writer-programmabile)
    (error 'invalid-argument :reason :worker-writer))
  (%partizione-verificata (contesto-worker-writer-ready context) home)
  (%assegna-worker context writer (the index home))
  nil))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (contesto-worker-writer)
                         (values writer-programmabile index &optional)) cede-writer-worker))
(defun cede-writer-worker (context)
  "Pre: CLAIMED/RESCHEDULE without a lease or batch. Post: IDLE, obligation with the caller
along with home, generation retained; never yield an active lease. Typed phase/owner
and verifiers; no implicit publication, the caller does not abandon the reference."
  (%passo-worker (context (:worker-state) ())
  (%check-worker context)
  (case (contesto-worker-writer-state context)
    ((:claimed :reschedule) nil)
    (otherwise (error 'resource-exhausted :reason :worker-state)))
  (let ((writer (contesto-worker-writer-writer context))
        (home (contesto-worker-writer-home context)))
    (unless (typep writer 'writer-programmabile)
      (error 'invariant-violation :reason :worker-state))
    (setf (contesto-worker-writer-writer context) nil
          (contesto-worker-writer-state context) :idle)
    (%check-worker context)
    (values writer home))))
