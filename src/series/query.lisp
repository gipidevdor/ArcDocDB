;;; OWNER: radici immutabili del caller; query di metadati solo con handoff/lease.
;;; SHARED: lettura root con barriera acquire, nessuna scrittura sul percorso GET.
(in-package #:arcdocdb.series)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-001 REQ-CON-002
(declaim (ftype (function (controllore-serie) (member :healthy :faulted)) stato-controllore-serie)
         (ftype (function (controllore-serie) (member :none :serie :archive)) ambito-fault-serie))
(defun stato-controllore-serie (controller)
  "Pre: controller capability. Post: health observed atomically with a barrier.
Does not coordinate other controllers or prove quiescence."
  (let ((state (controllore-serie-state controller)))
    (sb-thread:barrier (:read))
    (if (eq state :healthy) :healthy :faulted)))

;;; REQ: REQ-AFF-001 REQ-CON-002
(defun ambito-fault-serie (controller)
  "Pre: controller capability. Post: scope from the SAME atomic word as health.
INVARIANT-VIOLATION for an inconsistent enum; no resolution or waiting."
  (let ((state (controllore-serie-state controller)))
    (sb-thread:barrier (:read))
    (case state
      (:healthy :none) (:faulted :serie) (:archive-faulted :archive)
      (otherwise (%serie-invariant controller :serie-health)))))

;;; REQ: REQ-WAL-006 REQ-CON-002 REQ-AFF-001
(declaim (ftype (function (controllore-serie) t) leggi-radice-serie))
(defun leggi-radice-serie (controller)
  "Pre: reader retains the immutable root reference. Post: published view
with acquire barrier, no allocation or shared CSN query.
IO-FAULT for observed faulty health/log; promises neither snapshots nor reclamation."
  (unless (eq (stato-controllore-serie controller) :healthy)
    (error 'io-fault :reason :serie-faulted :operation :series))
  (unless (eq (stato-log (controllore-serie-log controller)) :open)
    (error 'io-fault :reason :log-faulted :operation :series))
  (let ((root (controllore-serie-root controller)))
    (sb-thread:barrier (:read))
    root))

;;; REQ: REQ-CON-002 REQ-MVC-008
(declaim (ftype (function (controllore-serie t t) keyword) stato-commit-serie)
         (ftype (function (controllore-serie t t) (values index u32 u32 &optional)) leggi-csn-commit-serie)
         (ftype (function (controllore-serie t) (values index index index &optional)) conta-commit-serie))
(defun stato-commit-serie (controller event generation)
  "Pre: writer/event after handoff. Post: current local phase, no unrestricted concurrent read.
INVALID-ARGUMENT for identity/generation; observes neither H nor durability."
  (%check-event controller event generation)
  (case (commit-serie-phase event)
    ((:libero :preparato :pubblicato :risolto :annullato) (commit-serie-phase event))
    (otherwise (%serie-invariant controller :serie-event-uncertain))))

;;; REQ: REQ-MVC-008 REQ-CON-002
(defun leggi-csn-commit-serie (controller event generation)
  "Pre: writer/event after handoff. Post: captured token, retained after resolution.
INVALID-ARGUMENT for free/stale; never reconstruction from a reused batch or u64 boxing."
  (%live-event controller event generation)
  (values (commit-serie-slot event) (commit-serie-high event) (commit-serie-low event)))

;;; REQ: REQ-CON-002 REQ-AFF-008
(defun conta-commit-serie (controller lease)
  "Pre: current lease. Post: consistent counts of slots, unresolved entries, and I/O consumers.
INVALID-ARGUMENT for lease; invariants cause FAULTED."
  (%check-owner controller lease)
  (values (controllore-serie-count controller) (controllore-serie-unresolved controller)
          (controllore-serie-active-io controller)))
