;;; OWNER: attore del motore; cleanup solo dopo I/O sincrono e borrower GET terminati.
;;; SHARED: invalidazione locale; nessun registro o lock nuovo tra Serie.
(in-package #:arcdocdb.engine)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CON-002 REQ-AFF-008
(declaim (ftype (function (motore) null) esigi-owner-motore))
(defun esigi-owner-motore (engine)
  "Pre: valid handle. Post: exact owning actor; INVALID-ARGUMENT before any mutation."
  (unless (eq (motore-owner engine) sb-thread:*current-thread*)
    (error 'invalid-argument :reason :engine-owner))
  nil)

;;; REQ: REQ-REC-001 REQ-CON-002 REQ-AFF-001 REQ-AFF-008
(declaim (ftype (function (motore) null) esigi-motore-pronto))
(defun esigi-motore-pronto (engine)
  "Pre: serial request, no reentry. Post: owner and READY admission, healthy controller.
INVALID-ARGUMENT before admission, IO-FAULT for faulted health; no I/O or CSN."
  (esigi-owner-motore engine)
  (unless (eq (motore-state engine) :ready) (error 'invalid-argument :reason :engine-not-ready))
  (when (motore-busy engine) (error 'invalid-argument :reason :engine-request-in-progress))
  (unless (eq (s:stato-controllore-serie (motore-controller engine)) :healthy)
    (error 'io-fault :reason :engine-faulted :operation :engine))
  nil)

;;; REQ: REQ-REC-001 REQ-AFF-008
(declaim (ftype (function (motore keyword) null) osserva-motore))
(defun osserva-motore (engine phase)
  "Pre: owning actor and trusted/injectable observer, no reentrant request allowed.
Post: phase notified without document data; callback exit/error propagates to the calling boundary."
  (when (motore-observer engine)
    (unless (null (funcall (motore-observer engine) engine phase))
      (error 'invalid-argument :reason :engine-observer-result)))
  nil)

;;; REQ: REQ-AFF-001 REQ-CON-002
(declaim (ftype (function (motore t) null) guasta-motore))
(defun guasta-motore (engine cause)
  "Pre: owner at the startup/request boundary, synchronous I/O. Post: terminal admission and cause retained.
No retry, rollback, invented CSN, or cleanup that hides the original condition."
  (setf (motore-state engine) :faulted)
  (when (typep cause 'condition) (setf (motore-failure engine) cause))
  (when (and (motore-controller engine) (motore-lease engine))
    (s:fault-controllore-serie (motore-controller engine) (motore-lease engine)))
  nil)

;;; REQ: REQ-AFF-004 REQ-REC-001
(declaim (ftype (function (motore function) null) tenta-cleanup-motore))
(defun tenta-cleanup-motore (engine operation)
  "Pre: cleanup operation owned at the boundary, no active borrower. Post: attempted exactly once.
Errors retained in the handle for aggregation after all attempts, never ignored."
  (handler-case (funcall operation)
    (error (condition) (push condition (motore-cleanup-failures engine))))
  nil)

;;; REQ: REQ-IDX-010 REQ-IDX-012 REQ-AFF-004 REQ-CON-002
(declaim (ftype (function (motore) null) ritira-indice-paginato-motore))
(defun ritira-indice-paginato-motore (engine)
  "Pre: serial owner, no GET in flight; request BUSY or cleanup after admission closes.
Post: view and automatic renewal retired before the single close, no intended allocation.
IO-FAULT from close propagates without retry; slots remain empty even on failure."
  (esigi-owner-motore engine)
  (let ((file (motore-paged-file engine)))
    (setf (motore-auto-renewal engine) nil (motore-auto-renewals-used engine) 0
          (motore-delta engine) nil (motore-paged engine) nil (motore-paged-option engine) nil (motore-paged-file engine) nil)
    (when file (io:chiudi file)))
  nil)

;;; REQ: REQ-AFF-004 REQ-REC-001 REQ-AFF-008
(declaim (ftype (function (motore) null) libera-risorse-motore))
(defun libera-risorse-motore (engine)
  "Pre: actor, no task/GET in flight. Post: all sets/FDs attempted, parent released last releases the lock.
Ownership consumed even on error; faults recorded, no second close or retry."
  (tenta-cleanup-motore engine (lambda () (ritira-indice-paginato-motore engine)))
  (when (motore-automatic-index engine)
    (let ((tree (automatic-index-controller-disk (motore-automatic-index engine))))
      (when tree
        (setf (automatic-index-controller-disk (motore-automatic-index engine)) nil)
        (tenta-cleanup-motore engine (lambda () (retire-automatic-disk engine tree)))))
    (setf (motore-index engine) nil (motore-automatic-index engine) nil))
  (when (motore-lease engine)
    (tenta-cleanup-motore engine (lambda () (s:rilascia-controllore-serie
                                           (motore-controller engine) (motore-lease engine))))
    (setf (motore-lease engine) nil))
  (dolist (set (motore-recovery-sets engine))
    (tenta-cleanup-motore engine (lambda () (mf:chiudi-fonti-recovery set))))
  (setf (motore-recovery-sets engine) nil)
  (dolist (file (motore-fds engine))
    (tenta-cleanup-motore engine (lambda () (io:chiudi file))))
  (setf (motore-fds engine) nil)
  ;; Retire the final view/context too: neither keeps the cache arenas alive after close.
  (setf (motore-record-cache engine) nil (motore-view engine) nil (motore-get-context engine) nil
        (motore-sources engine) nil (motore-source engine) nil (motore-controller engine) nil (motore-active engine) nil
        (motore-group engine) nil (motore-batch engine) nil (motore-append engine) nil (motore-write-workspace engine) nil)
  nil)

;;; REQ: REQ-REC-001 REQ-AFF-004 REQ-CON-002
(declaim (ftype (function (motore) null) chiudi-motore))
(defun chiudi-motore (engine)
  "Pre: serial owner, no request in flight. Post: admission CLOSED and all capabilities attempted.
Repeated close is a no-op. Aggregate with primary condition and full cleanup list after all attempts."
  (esigi-owner-motore engine)
  (unless (member (motore-state engine) '(:ready :faulted :closed))
    (error 'invalid-argument :reason :engine-not-ready))
  (when (motore-busy engine) (error 'invalid-argument :reason :engine-request-in-progress))
  (unless (eq (motore-state engine) :closed)
    (setf (motore-state engine) :closed)
    (libera-risorse-motore engine)
    (when (motore-cleanup-failures engine)
      (error 'errore-cleanup-motore :reason :engine-close-cleanup :primary (motore-failure engine)
             :errors (reverse (motore-cleanup-failures engine)))))
  nil)

;;; REQ: REQ-REC-001 REQ-CON-002
(declaim (ftype (function (motore) keyword) stato-motore))
(defun stato-motore (engine)
  "Pre: valid handle. Post: scalar state, not an admission reservation or transfer."
  (motore-state engine))

;;; REQ: REQ-MVC-005 REQ-MVC-006
(declaim (ftype (function (motore) (values u32 u32 u32 u32 &optional)) frontiere-motore))
(defun frontiere-motore (engine)
  "Pre: owner with READY engine. Post: canonical last CSN and H without increment, high/low words.
Rejects closed admission; no inference from offsets, IDs, or CONTROL."
  (esigi-motore-pronto engine)
  (arcdocdb.csn:leggi-frontiere-csn (motore-registry engine)))
