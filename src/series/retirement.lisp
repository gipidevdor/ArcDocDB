;;; OWNER: writer ritira riferimenti dopo il messaggio di fine I/O e ritiro del gruppo.
;;; SHARED: solo risoluzione CSN per lotto; scansione bounded esclusivamente sul guasto.
(in-package #:arcdocdb.series)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-WAL-006 REQ-CON-002 REQ-AFF-008
(declaim (ftype (function (controllore-serie t t t) null) riusa-commit-serie))
(defun riusa-commit-serie (controller lease event generation)
  "Pre: retirement FIFO, resolved CSN, I/O COMPLETION received, group already reused/retired.
Post: open batch, slot/references freed, epoch retained. Rejections before mutation;
no root/index/snapshot reclamation or faulted-buffer reuse."
  (%check-owner controller lease) (%live-event controller event generation)
  (%require-healthy controller)
  (unless (eq event (svref (controllore-serie-slots controller) (controllore-serie-head controller)))
    (error 'invalid-argument :reason :serie-retire-order))
  (unless (eq (commit-serie-phase event) :risolto)
    (error 'invalid-argument :reason :serie-event-state))
  (unless (eq (commit-serie-io-state event) :retired)
    (error 'invalid-argument :reason :serie-io-in-flight))
  (unless (plusp (controllore-serie-count controller)) (%serie-invariant controller :serie-count))
  (%check-lotto-release controller (the lotto (commit-serie-lotto event)) :riuso)
  (let ((complete nil))
    (%begin-effect controller)
    (unwind-protect
         (progn
           (riusa-lotto (the lotto (commit-serie-lotto event)))
           (setf (commit-serie-phase event) :libero (commit-serie-lotto event) nil
                 (commit-serie-expected-root event) nil (commit-serie-root event) nil
                 (commit-serie-slot event) 0 (commit-serie-high event) 0 (commit-serie-low event) 0
                 (commit-serie-io-state event) :idle)
           (decf (controllore-serie-count controller))
           (setf (controllore-serie-head controller) (%next-position controller (controllore-serie-head controller)))
           (%check-ring controller)
           (unless (eq (commit-serie-phase event) :libero) (%serie-invariant controller :serie-event-state))
           (setf complete t) nil)
      (%end-effect controller complete))))

;;; REQ: REQ-AFF-001 REQ-AFF-004
(declaim (ftype (function (controllore-serie t &optional t) null) fault-controllore-serie))
(defun fault-controllore-serie (controller lease &optional (scope :serie))
  "Pre: owner reports a known fault or uncertain state. Post: terminal FAULTED.
Scope not reduced; INVALID-ARGUMENT for scope/lease. Does not modify files/token.
Scope :archive obligates the coordinator to stop the ENTIRE Archivio."
  (%check-owner controller lease)
  (unless (member scope '(:serie :archive)) (error 'invalid-argument :reason :serie-fault-scope))
  (%mark-fault controller scope)
  (unless (eq (stato-controllore-serie controller) :faulted) (%serie-invariant controller :serie-health))
  nil)

;;; REQ: REQ-AFF-001 REQ-WAL-006 REQ-MVC-008
(declaim (ftype (function (controllore-serie t t t)
                         (values (member :annullato :pendente) u32 u32 &optional)) annulla-commit-serie))
(defun annulla-commit-serie (controller lease event generation)
  "Pre: FAULTED Serie, ALL I/O quiescent, current/FIFO unresolved event.
Post: terminal log and canceled token, or pending on busy; no buffer reopened.
Archivio scope rejects automatic cleanup of uncertain outcomes; deletes no data."
  (%check-owner controller lease) (%live-event controller event generation)
  (unless (eq (ambito-fault-serie controller) :serie)
    (error 'invalid-argument :reason :serie-fault-scope))
  (%check-publish-head controller event) (%require-quiescent controller)
  (%check-captured-token controller event)
  (let ((complete nil))
    (%begin-effect controller)
    (unwind-protect
         (handler-case
             (progn
               (marca-log-faulted (controllore-serie-log controller))
               (multiple-value-bind (high low)
                   (annulla-csn-lotto (the lotto (commit-serie-lotto event))
                    (controllore-serie-registry controller) (commit-serie-slot event)
                    (commit-serie-high event) (commit-serie-low event))
                 (setf (commit-serie-phase event) :annullato)
                 (%advance-publication controller event)
                 (setf complete t) (values :annullato high low)))
           (resource-exhausted (condition)
             (unless (eq (error-reason condition) :csn-busy) (error condition))
             (setf complete t) (values :pendente 0 0)))
      (%end-effect controller complete))))
