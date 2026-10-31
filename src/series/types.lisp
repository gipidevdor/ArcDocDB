;;; OWNER: un writer con lease locale; riferimenti evento usati solo dopo handoff.
;;; SHARED: binding unico sul log all'avvio; radice per CAS, registro CSN per lotto.
(in-package #:arcdocdb.series)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-008 REQ-CON-005
(defconstant +max-serie-commits+ 1024)

;;; REQ: REQ-CON-002 REQ-WAL-006 REQ-MVC-008 REQ-AFF-008
(defstruct (controllore-serie
             (:constructor %make-controllore-serie (registry log slots root planned-root next-offset))
             (:copier nil))
  "Pre: exclusive registry, log, and slots for the Serie. Post: HEALTHY and empty ring.
Roots are immutable references; no context allocated per batch."
  (registry nil :type registro-csn :read-only t)
  (log nil :type log-io :read-only t)
  (slots #() :type simple-vector :read-only t)
  (root nil :type t) (planned-root nil :type t) (next-offset 0 :type index)
  (owner nil :type (or null sb-thread:thread))
  (lease-generation 0 :type index) (event-generation 0 :type index)
  (last-high 0 :type u32) (last-low 0 :type u32)
  (head 0 :type index) (tail 0 :type index) (publish-head 0 :type index)
  (count 0 :type index) (unresolved 0 :type index) (active-io 0 :type index)
  (state :healthy :type (member :healthy :faulted :archive-faulted))
  (effect-active nil :type boolean))

;;; REQ: REQ-CON-002 REQ-WAL-006 REQ-MVC-008 REQ-AFF-008
(defstruct (commit-serie (:constructor %make-commit-serie (controller position)) (:copier nil))
  "Pre: slot built once. Post: capability bound to controller and position.
The message retains the object and captured generation, never reread after reuse."
  (controller nil :type controllore-serie :read-only t)
  (position 0 :type index :read-only t)
  (generation 0 :type index) (lotto nil :type (or null lotto))
  (slot 0 :type index) (high 0 :type u32) (low 0 :type u32)
  (expected-root nil :type t) (root nil :type t)
  (level :group :type (member :async :group :strong))
  (phase :libero :type (member :libero :preparato :pubblicando :pubblicato :risolto :annullato))
  (io-state :idle :type (member :idle :active :retired)))

;;; OWNER: getter senza lease; legge solo il binding e il legame immutabile al log.
;;; REQ: REQ-CON-002 REQ-WAL-006 REQ-AFF-008
(declaim (ftype (function (log-io) (or null controllore-serie)) trova-controllore-serie))
(defun trova-controllore-serie (log)
  "Pre: canonical log object retained by the caller. Post: NIL or the same controller after acquire.
One load only; retrieves the binding even if the factory return is interrupted.
INVARIANT-VIOLATION :SERIE-LOG-BINDING for an unrelated type or inconsistent reverse binding.
The coordinator stops bootstrap/adoption without admission; an unrelated reference is not mutated.
No health, ring, or lease check; no mutation, I/O, or CSN assignment."
  (let ((controller (arcdocdb.wal::log-io-controller log)))
    (sb-thread:barrier (:read))
    (unless (typep controller '(or null controllore-serie))
      (error 'invariant-violation :reason :serie-log-binding))
    (when controller
      (unless (eq (controllore-serie-log controller) log)
        (error 'invariant-violation :reason :serie-log-binding)))
    controller))

;;; OWNER: candidato privato fino al CAS; il binding sul log non viene mai azzerato.
;;; REQ: REQ-AFF-008 REQ-CON-002 REQ-WAL-006
(declaim (ftype (function (controllore-serie) null) %check-ring))
(declaim (ftype (function (controllore-serie keyword) nil) %serie-invariant))
(declaim (ftype (function (controllore-serie) (member :healthy :faulted)) stato-controllore-serie))
(declaim (ftype (function (registro-csn log-io &key (:capacity t) (:root t) (:next-offset t))
                         controllore-serie) crea-controllore-serie))
(defun crea-controllore-serie (registry log &key (capacity 64) (root nil) (next-offset 0))
  "Pre: canonical segment log, immutable root, and known initial offset; admission closed.
Post: exactly one controller bound to the log, preallocated ring; NIL is a valid root.
INVALID-ARGUMENT for budget/offset or :SERIE-LOG-BOUND on a second startup; IO-FAULT for a faulted log.
All preflights precede the CAS: an error before the CAS does not publish the candidate.
After successful CAS, only return; TROVA-CONTROLLORE-SERIE retrieves the binding without reset.
No I/O, CSN assignment, or lease mutation; the binding does not admit traffic.
Physical exclusion and log canonicity remain the caller's responsibility; rotation creates a new log."
  (unless (and (typep capacity 'index) (<= 1 capacity +max-serie-commits+)
               (typep next-offset 'index))
    (error 'invalid-argument :reason :serie-budget))
  (when (trova-controllore-serie log)
    (error 'invalid-argument :reason :serie-log-bound))
  (verifica-log-segmento log)
  (let* ((slots (make-array capacity :element-type t :initial-element nil))
         (controller (%make-controllore-serie registry log slots root root next-offset)))
    (dotimes (i capacity) (setf (svref slots i) (%make-commit-serie controller i)))
    (%check-ring controller)
    (unless (and (eq (controllore-serie-registry controller) registry)
                 (eq (controllore-serie-log controller) log))
      (%serie-invariant controller :serie-log-binding))
    (unless (and (eq (controllore-serie-slots controller) slots)
                 (= (controllore-serie-next-offset controller) next-offset))
      (%serie-invariant controller :serie-log-binding))
    (sb-thread:barrier (:write))
    (unless (null (sb-ext:compare-and-swap (arcdocdb.wal::log-io-controller log) nil controller))
      (error 'invalid-argument :reason :serie-log-bound))
    controller))
