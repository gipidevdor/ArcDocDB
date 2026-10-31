;;; OWNER: writer con lease; token catturati all'adozione, mai ricostruiti.
;;; SHARED: metadati locali, registro CSN solo alla risoluzione.
(in-package #:arcdocdb.series)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CON-002 REQ-AFF-004
(declaim (ftype (function (controllore-serie t t) commit-serie) %check-event))
(defun %check-event (controller event generation)
  "Pre: capability/number captured in the message. Post: exact controller object and epoch.
INVALID-ARGUMENT for a stale/foreign event; invariants for corrupted index/slot."
  (unless (typep event 'commit-serie) (error 'invalid-argument :reason :serie-event))
  (unless (and (eq (commit-serie-controller event) controller)
               (typep generation 'index) (plusp generation)
               (= generation (commit-serie-generation event)))
    (error 'invalid-argument :reason :serie-event))
  (unless (< (commit-serie-position event) (length (controllore-serie-slots controller)))
    (%serie-invariant controller :serie-event-slot))
  (unless (eq event (svref (controllore-serie-slots controller) (commit-serie-position event)))
    (%serie-invariant controller :serie-event-slot))
  event)

;;; REQ: REQ-CON-002 REQ-AFF-004
(declaim (ftype (function (controllore-serie t t) commit-serie) %live-event))
(defun %live-event (controller event generation)
  "Pre: captured event. Post: current identity and batch still retained.
INVALID-ARGUMENT for a free slot; INVARIANT-VIOLATION for a lost reference."
  (%check-event controller event generation)
  (when (eq (commit-serie-phase event) :libero)
    (error 'invalid-argument :reason :serie-event-state))
  (unless (commit-serie-lotto event) (%serie-invariant controller :serie-event-lotto))
  event)

;;; REQ: REQ-MVC-008 REQ-CON-002
(declaim (ftype (function (u32 u32 u32 u32) boolean) %csn-after-p))
(defun %csn-after-p (high low previous-high previous-low)
  "Pre: two u32 pairs. Post: exact lexicographic order, no u64 boxing.
Does not modify state or query the registry."
  (or (> high previous-high) (and (= high previous-high) (> low previous-low))))

;;; REQ: REQ-WAL-005 REQ-MVC-008 REQ-AFF-008
(declaim (ftype (function (controllore-serie lotto t t) null) %check-admission))
(defun %check-admission (controller lotto expected-root level)
  "Pre: healthy owner/ring. Post: budgets, root/byte order, and batch shape validated.
Typed rejections before adoption; the caller retains batch and CSN."
  (when (= (controllore-serie-count controller) (length (controllore-serie-slots controller)))
    (error 'resource-exhausted :reason :serie-full))
  (when (= (controllore-serie-event-generation controller) most-positive-fixnum)
    (error 'resource-exhausted :reason :serie-event-generation))
  (unless (member level '(:async :group :strong))
    (error 'invalid-argument :reason :serie-level))
  (unless (eq expected-root (controllore-serie-planned-root controller))
    (error 'invalid-argument :reason :serie-root-order))
  (unless (eq (stato-lotto lotto) :sealed) (error 'invalid-argument :reason :serie-lotto-state))
  (unless (= (inizio-lotto lotto) (controllore-serie-next-offset controller))
    (error 'invalid-argument :reason :serie-offset))
  (unless (<= (lunghezza-lotto lotto) (- most-positive-fixnum (inizio-lotto lotto)))
    (error 'invalid-argument :reason :serie-offset))
  nil)

;;; REQ: REQ-WAL-005 REQ-MVC-008 REQ-AFF-008
(declaim (ftype (function (controllore-serie commit-serie u32 u32) null) %check-new-slot))
(defun %check-new-slot (controller event high low)
  "Pre: tail slot and verified CSN words. Post: free slot and increasing CSN order.
Invariant for an occupied slot; INVALID-ARGUMENT for the caller's duplicate/CSN order."
  (unless (eq (commit-serie-phase event) :libero) (%serie-invariant controller :serie-tail))
  (when (commit-serie-lotto event) (%serie-invariant controller :serie-tail))
  ;; Il controller conserva le parole dell'ultimo CSN ammesso, indipendentemente dal riuso.
  (unless (%csn-after-p high low (controllore-serie-last-high controller)
                       (controllore-serie-last-low controller))
    (error 'invalid-argument :reason :serie-csn-order))
  nil)

;;; REQ: REQ-WAL-005 REQ-WAL-006 REQ-MVC-008 REQ-CON-002
(declaim (ftype (function (controllore-serie lotto) (values index u32 u32 &optional)) %capture-token))
(defun %capture-token (controller lotto)
  "Pre: sealed batch supplied to the controller. Post: exact token without mutation.
Ordinary rejections propagate; a WAL invariant makes the Archivio FAULTED before adoption."
  (handler-case
      (multiple-value-bind (slot high low) (leggi-csn-lotto lotto)
        (verifica-token-lotto lotto (controllore-serie-registry controller)
                              (controllore-serie-log controller) slot high low)
        (values slot high low))
    (invariant-violation (condition) (%mark-fault controller :archive) (error condition))))

;;; REQ: REQ-WAL-005 REQ-WAL-006 REQ-AFF-001 REQ-AFF-008
(declaim (ftype (function (controllore-serie lotto (member :riuso :ritiro)) null) %check-lotto-release))
(defun %check-lotto-release (controller lotto kind)
  "Pre: current event and requested retirement/reuse. Post: WAL preflight passed without mutation.
Ordinary rejections propagate; an invariant in the validator makes the Archivio FAULTED."
  (handler-case
      (case kind
        (:riuso (verifica-riuso-lotto lotto))
        (:ritiro (verifica-ritiro-lotto lotto))
        (otherwise (%serie-invariant controller :serie-release-kind)))
    (invariant-violation (condition) (%mark-fault controller :archive) (error condition))))

;;; REQ: REQ-WAL-005 REQ-WAL-006 REQ-MVC-008 REQ-CON-002
(declaim (ftype (function (controllore-serie t lotto t t t)
                         (values commit-serie index &optional)) registra-commit-serie))
(defun registra-commit-serie (controller lease lotto expected-root root level)
  "Pre: sealed batch, immutable root ready, BEFORE any I/O dispatch.
Post: preallocated event with captured token and generation, planned order advanced.
Full/rejections leave the batch with the caller; an exit during adoption requires Archivio fail-stop."
  (%check-owner controller lease) (%require-healthy controller)
  (%check-admission controller lotto expected-root level)
  (multiple-value-bind (slot high low) (%capture-token controller lotto)
    (let ((event (the commit-serie (svref (controllore-serie-slots controller)
                                        (controllore-serie-tail controller)))) (complete nil))
      (%check-new-slot controller event high low)
      (%begin-effect controller)
      (unwind-protect
           (progn
             (incf (controllore-serie-event-generation controller))
             (setf (commit-serie-generation event) (controllore-serie-event-generation controller)
                   (commit-serie-lotto event) lotto (commit-serie-slot event) slot
                   (commit-serie-high event) high (commit-serie-low event) low
                   (commit-serie-expected-root event) expected-root (commit-serie-root event) root
                   (commit-serie-level event) level (commit-serie-phase event) :preparato
                   (commit-serie-io-state event) :idle (controllore-serie-planned-root controller) root
                   (controllore-serie-next-offset controller) (+ (inizio-lotto lotto) (lunghezza-lotto lotto))
                   (controllore-serie-last-high controller) high (controllore-serie-last-low controller) low
                   (controllore-serie-tail controller) (%next-position controller (controllore-serie-tail controller)))
             (incf (controllore-serie-count controller)) (incf (controllore-serie-unresolved controller))
             (%check-ring controller)
             (unless (eq (commit-serie-lotto event) lotto) (%serie-invariant controller :serie-event-lotto))
             (setf complete t)
             (values event (commit-serie-generation event)))
        (%end-effect controller complete)))))

;;; REQ: REQ-MVC-008 REQ-WAL-006 REQ-AFF-004
(declaim (ftype (function (controllore-serie commit-serie) null) %check-captured-token))
(defun %check-captured-token (controller event)
  "Pre: valid live event. Post: captured token still exact in the batch.
A lost/changed token is an internal defect: Archivio FAULTED, original condition propagated."
  (handler-case
      (verifica-token-lotto (the lotto (commit-serie-lotto event))
                            (controllore-serie-registry controller) (controllore-serie-log controller)
                            (commit-serie-slot event) (commit-serie-high event) (commit-serie-low event))
    (invalid-argument (condition) (%mark-fault controller :archive) (error condition))
    (invariant-violation (condition) (%mark-fault controller :archive) (error condition))))

;;; REQ: REQ-CON-002 REQ-MVC-008
(declaim (ftype (function (controllore-serie commit-serie) null) %check-publish-head))
(defun %check-publish-head (controller event)
  "Pre: live event. Post: work is the Serie's first unresolved CSN.
INVALID-ARGUMENT for order or phase; INVARIANT-VIOLATION for a lost counter."
  (unless (eq event (svref (controllore-serie-slots controller) (controllore-serie-publish-head controller)))
    (error 'invalid-argument :reason :serie-publish-order))
  (unless (member (commit-serie-phase event) '(:preparato :pubblicato))
    (error 'invalid-argument :reason :serie-event-state))
  (unless (plusp (controllore-serie-unresolved controller)) (%serie-invariant controller :serie-count))
  nil)
