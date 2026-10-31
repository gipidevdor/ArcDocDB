;;;; Consegna locale del writer: la guard del ring protegge anche lo scheduling.
;;; OWNER: ogni wrapper e la sua coda privata appartengono a una sola Serie.
;;; SHARED: stato/count sotto la stessa guard; owner/generation con protocollo lease.
;;; Nessuno stato fra Serie: :schedule trasferisce un obbligo al chiamante.
(in-package #:arcdocdb.execution)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(defconstant +max-writer-routing-index+ 65535)

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(defstruct (writer-programmabile (:constructor %make-writer-programmabile (queue routing-index))
                                (:copier nil))
  "Pre: private queue, never exposed or used through the low-level APIs. Post: writer IDLE.
The APIs transfer :SCHEDULE obligations; they do not create threads or send notifications.
A read-only routing-index is not a lease and does not identify an Archivio on its own."
  (queue (error 'invariant-violation :reason :writer-scheduling)
         :type coda-writer :read-only t)
  (state :idle :type (member :idle :ready :running))
  (routing-index nil :type (or null (integer 0 65535)) :read-only t))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (writer-programmabile) (or null (integer 0 65535))) indice-routing-writer))
(defun indice-routing-writer (writer)
  "Pre: valid writer. Post: immutable ordinal set at startup, or legacy NIL.
No acquisition or mutation; the index does not prove membership in a registry."
  (writer-programmabile-routing-index writer))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (coda-writer) null) %check-writer-inattivo))
(defun %check-writer-inattivo (queue)
  "Pre: guard owned, state IDLE or READY. Post: no lease and zero quota.
INVARIANT-VIOLATION for a guard, owner, or quota incompatible with the transition."
  (unless (eq (coda-writer-guard queue) sb-thread:*current-thread*)
    (error 'invariant-violation :reason :writer-guard))
  (unless (null (coda-writer-owner queue))
    (error 'invariant-violation :reason :writer-scheduling))
  (unless (zerop (coda-writer-extracted queue))
    (error 'invariant-violation :reason :writer-scheduling))
  nil)

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (writer-programmabile) null) %check-programmabile))
(defun %check-programmabile (writer)
  "Pre: private queue guard owned. Post: ring and state/owner consistent.
INVARIANT-VIOLATION for an incorrect guard or a state that does not represent the work."
  (let* ((queue (writer-programmabile-queue writer))
         (count (coda-writer-count queue)) (owner (coda-writer-owner queue)))
    (unless (eq (coda-writer-guard queue) sb-thread:*current-thread*)
      (error 'invariant-violation :reason :writer-guard))
    (%check-queue queue)
    (case (writer-programmabile-state writer)
      (:idle
       (unless (zerop count) (error 'invariant-violation :reason :writer-scheduling))
       (%check-writer-inattivo queue))
      (:ready
       (unless (plusp count) (error 'invariant-violation :reason :writer-scheduling))
       (%check-writer-inattivo queue))
      (:running
       (unless owner (error 'invariant-violation :reason :writer-scheduling)))
      (otherwise (error 'invariant-violation :reason :writer-scheduling))))
  nil)

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (&key (:capacity t) (:quantum t) (:routing-index t)) writer-programmabile)
                crea-writer-programmabile))
(defun crea-writer-programmabile (&key (capacity 1024) (quantum 64) routing-index)
  "Pre: capacity/quantum within CREA-CODA-WRITER limits. Post: IDLE wrapper
with an exclusive preallocated ring; routing-index NIL or ordinal 0..65535.
INVALID-ARGUMENT for invalid configuration, before allocating the queue."
  (unless (or (null routing-index)
              (typep routing-index `(integer 0 ,+max-writer-routing-index+)))
    (error 'invalid-argument :reason :writer-configuration))
  (let* ((queue (crea-coda-writer :capacity capacity :quantum quantum))
         (writer (%make-writer-programmabile queue routing-index)) (thread (%acquisisci-guard queue)))
    (unwind-protect (progn (%check-programmabile writer) writer)
      (%rilascia-guard queue thread))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (writer-programmabile t)
                         (values index (member :schedule :queued) &optional))
                accoda-lavoro-writer))
(defun accoda-lavoro-writer (writer message)
  "Pre: caller owns the payload. Post: FIFO acceptance; :SCHEDULE only
on IDLE→READY, :QUEUED if already READY/RUNNING. The caller retains and fulfills the
:SCHEDULE obligation exactly once; retrying notification does not repeat acceptance.
RESOURCE-EXHAUSTED full/busy before acceptance; invariants require fail-stop."
  (let* ((queue (writer-programmabile-queue writer)) (thread (%acquisisci-guard queue)))
    (unwind-protect
         (progn
           (%check-programmabile writer)
           (let* ((schedule (eq (writer-programmabile-state writer) :idle))
                  (count (%accoda-sotto-guard queue message)))
             (when schedule (setf (writer-programmabile-state writer) :ready))
             (%check-programmabile writer)
             (values count (if schedule :schedule :queued))))
      (%rilascia-guard queue thread))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (writer-programmabile) index) inizia-tratto-writer))
(defun inizia-tratto-writer (writer)
  "Pre: caller has assigned a ready task. Post: READY→RUNNING with a lease
for the current thread; no message dequeued. RESOURCE-EXHAUSTED preserves the
state: busy requires retrying the task; not-ready rejects an ineligible/duplicate
assignment; generation is permanent exhaustion, without wrap."
  (let* ((queue (writer-programmabile-queue writer)) (thread (%acquisisci-guard queue)))
    (unwind-protect
         (progn
           (%check-programmabile writer)
           (unless (eq (writer-programmabile-state writer) :ready)
             (error 'resource-exhausted :reason :writer-not-ready))
           (let ((lease (acquisisci-writer queue)))
             (setf (writer-programmabile-state writer) :running)
             (%check-programmabile writer)
             lease))
      (%rilascia-guard queue thread))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (writer-programmabile t t t t)
                         (values index (member :messages :empty :yield) &optional))
                preleva-lavori-writer))
(defun preleva-lavori-writer (writer lease target start end)
  "Pre: current execution-slice lease and private target. Post: bounded FIFO dequeue
and cumulative quota as in PRELEVA-MESSAGGI; the same conditions on rejection.
The lease prevents a concurrent end of the execution slice; the internal queue remains private."
  (preleva-messaggi (writer-programmabile-queue writer) lease target start end))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (writer-programmabile t) (member :schedule :idle))
                termina-tratto-writer))
(defun termina-tratto-writer (writer lease)
  "Pre: dequeued messages processed, current lease. Post: quota/token released
and READY/:SCHEDULE if work remains, IDLE/:IDLE if empty, under the ring guard.
The caller retains the :SCHEDULE obligation. Busy preserves the lease and state: retry
only termination, without processing payloads again. INVALID-ARGUMENT for the lease;
invariants require fail-stop. No notification or waiting; no durable change."
  (let ((queue (writer-programmabile-queue writer)))
    (%check-lease queue lease)
    (let ((thread (%acquisisci-guard queue)))
      (unwind-protect
           (progn
             (%check-programmabile writer)
             (let ((pending (plusp (coda-writer-count queue))))
               (rilascia-writer queue lease)
               (setf (writer-programmabile-state writer) (if pending :ready :idle))
               (%check-programmabile writer)
               (if pending :schedule :idle)))
        (%rilascia-guard queue thread)))))
