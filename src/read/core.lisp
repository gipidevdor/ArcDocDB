;;; OWNER: worker esclusivo; il confine del compito gestisce gli errori e isola FAULTED.
;;; SHARED: cleanup del solo annuncio EBR proprio, anche se il dominio è FAULTED.
(in-package #:arcdocdb.read)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-004 REQ-CMP-007
(declaim (ftype (function (contesto-lettura keyword) nil) guasto-contesto-lettura))
(defun guasto-contesto-lettura (context reason)
  "Pre: inconsistent local invariant. Post: context FAULTED before the typed error.
Does not release a reader still in use; the task boundary must perform cleanup."
  (setf (contesto-lettura-state context) :faulted)
  (error 'invariant-violation :reason reason))

;;; REQ: REQ-CON-004 REQ-CMP-007 REQ-AFF-004
(declaim (inline esigi-lettura-inattiva esigi-lettura-attiva))
(declaim (ftype (function (contesto-lettura) null) esigi-lettura-inattiva))
(defun esigi-lettura-inattiva (context)
  "Pre: owning worker. Post: inactive state and buffers, EBR announcement free.
INVALID-ARGUMENT for reuse/nesting; inactive state with residual data leads to FAULTED."
  (unless (eq (contesto-lettura-state context) :idle)
    (error 'invalid-argument :reason :read-context-not-idle))
  (when (epoca-attiva-p (contesto-lettura-reader context))
    (error 'invalid-argument :reason :read-worker-busy))
  (unless (and (null (contesto-lettura-snapshot context))
               (zerop (aref (contesto-lettura-words context) +word-generation+))
               (zerop (aref (contesto-lettura-words context) +word-snapshot-csn+))
               (zerop (aref (contesto-lettura-words context) +word-start-time+))
               (zerop (aref (contesto-lettura-words context) +word-confirmed-csn+)))
    (guasto-contesto-lettura context :read-idle-data))
  nil)

;;; REQ: REQ-CON-004 REQ-CMP-007 REQ-MVC-005 REQ-AFF-004
(declaim (ftype (function (contesto-lettura) null) esigi-lettura-attiva))
(defun esigi-lettura-attiva (context)
  "Pre: owning worker. Post: active state, announced epoch, and consistent mode.
INVALID-ARGUMENT for nonactive state; internal inconsistency leads to FAULTED."
  (unless (eq (contesto-lettura-state context) :active)
    (error 'invalid-argument :reason :read-context-not-active))
  (unless (epoca-attiva-p (contesto-lettura-reader context))
    (guasto-contesto-lettura context :read-epoch-missing))
  (let ((snapshot (contesto-lettura-snapshot context)) (words (contesto-lettura-words context)))
    (if snapshot
        (unless (and (plusp (aref words +word-generation+))
                     (snapshot-del-registro-p snapshot (contesto-lettura-snapshots context)))
          (guasto-contesto-lettura context :read-snapshot-binding))
        (unless (and (zerop (aref words +word-generation+))
                     (zerop (aref words +word-snapshot-csn+)))
          (guasto-contesto-lettura context :read-current-binding))))
  nil)

;;; REQ: REQ-CON-004 REQ-CMP-007 REQ-AFF-004
(declaim (ftype (function (contesto-lettura) null) libera-contesto-lettura))
(defun libera-contesto-lettura (context)
  "Pre: section owned only by this context; final access complete.
Post: epoch free and buffer zeroed; preexisting FAULTED does not become reusable.
Cleanup interruption leaves FAULTED. Does not hide errors or perform I/O."
  (let ((faulted (eq (contesto-lettura-state context) :faulted)))
    (setf (contesto-lettura-state context) :faulted)
    (when (epoca-attiva-p (contesto-lettura-reader context))
      (esci-epoca (contesto-lettura-reader context)))
    (setf (contesto-lettura-snapshot context) nil)
    (dotimes (i 4) (setf (aref (contesto-lettura-words context) i) 0))
    (when (epoca-attiva-p (contesto-lettura-reader context))
      (guasto-contesto-lettura context :read-epoch-not-released))
    (unless faulted (setf (contesto-lettura-state context) :idle)))
  nil)
