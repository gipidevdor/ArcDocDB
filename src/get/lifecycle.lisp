;;; OWNER: worker esegue la richiesta in UNWIND-PROTECT; risultato privato fino alla conferma.
;;; SHARED: contesto read proprio, nessuna coda, attesa o scrittura comune fra Serie.
(in-package #:arcdocdb.get)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-AFF-004 REQ-CMP-007
(declaim (ftype (function (contesto-get keyword) nil) guasto-get))
(defun guasto-get (context reason)
  "Pre: internal task inconsistency. Post: terminal FAULTED before the condition.
Cleanup releases EBR; the worker boundary must isolate Serie/Archivio according to the cause."
  (setf (contesto-get-state context) :faulted)
  (error 'invariant-violation :reason reason))

;;; REQ: REQ-CON-004 REQ-AFF-004 REQ-CMP-007
(declaim (ftype (function (contesto-get get-state) null) esigi-stato-get))
(defun esigi-stato-get (context state)
  "Pre: exclusive worker. Post: required state and consistent EBR; no physical access here.
INVALID-ARGUMENT for order/reuse; internal inconsistency makes it FAULTED before signaling."
  (unless (eq (contesto-get-state context) state)
    (error 'invalid-argument :reason :get-worker-state))
  (unless (eq (stato-contesto-lettura (contesto-get-reader context))
              (if (eq state :idle) :idle :active))
    (guasto-get context :get-read-state))
  nil)

;;; REQ: REQ-CON-004 REQ-CMP-007 REQ-AFF-004
(declaim (ftype (function (contesto-get) null) abbandona-get))
(defun abbandona-get (context)
  "Pre: same worker, final access complete; external cleanup installed before AVVIA-GET.
Post: pin and physical references discarded, logical scratch zero; no result authorized.
IDLE is idempotent; FAULTED permanent. Cleanup interruption leaves FAULTED."
  (let ((faulted (or (eq (contesto-get-state context) :faulted)
                     (eq (stato-contesto-lettura (contesto-get-reader context)) :faulted))))
    (setf (contesto-get-state context) :faulted)
    (abbandona-lettura (contesto-get-reader context))
    (setf (contesto-get-view context) nil (contesto-get-key context) nil
          (contesto-get-snapshot-p context) nil
          (contesto-get-value-start context) 0 (contesto-get-value-end context) 0)
    (fill (contesto-get-content context) 0)
    (fill (contesto-get-limit context) 0)
    (unless faulted (setf (contesto-get-state context) :idle)))
  nil)

;;; REQ: REQ-CCH-002 REQ-MVC-004 REQ-AFF-002 REQ-AFF-008
(declaim (ftype (function (contesto-get octets index) index) copia-valore-get))
(defun copia-valore-get (context destination start)
  "Pre: VERIFIED, exclusive destination distinct from task buffers and key.
Post: provisional value copy, COPIED state, output end; no data may yet be delivered.
Complete with fresh time after copying; discard output on error/nonlocal exit."
  (esigi-stato-get context :verified)
  (let ((completed nil))
    (unwind-protect
         (let* ((bytes (contesto-get-bytes context)) (vs (contesto-get-value-start context))
                (ve (contesto-get-value-end context)))
           (when (or (eq destination bytes) (eq destination (contesto-get-proof context))
                     (eq destination (contesto-get-key context)))
             (error 'invalid-argument :reason :get-output-alias))
           (unless (< vs ve) (guasto-get context :get-value-range))
           (unless (<= ve (length bytes)) (guasto-get context :get-value-overflow))
           (let ((size (- ve vs)))
             (check-range destination start (length destination))
             (when (> size (- (length destination) start))
               (error 'invalid-argument :reason :get-output-range))
             (let ((end (the index (+ start size))))
               (check-range destination start end)
               (replace destination bytes :start1 start :end1 end :start2 vs :end2 ve)
               (setf (contesto-get-state context) :copied completed t)
               end)))
      (unless completed (abbandona-get context)))))

;;; REQ: REQ-MVC-001 REQ-MVC-004 REQ-MVC-005 REQ-CMP-007 REQ-AFF-002
(declaim (ftype (function (contesto-get u64)
                         (values (member :found :absent :history-required :retry) index &optional))
                concludi-get))
(defun concludi-get (context now)
  "Pre: admitted COPIED, ABSENT, HISTORY-REQUIRED, or RETRY; fresh NOW after every copy/access.
Post: final snapshot check and EBR release before return; FOUND authorizes the private copy.
ABSENT only for current GET. Every condition/nonlocal exit invalidates the result and releases the pin."
  (let* ((state (contesto-get-state context))
         (result (case state
                   (:copied :found) (:absent :absent) (:history-required :history-required)
                   (:retry :retry)
                   (otherwise (error 'invalid-argument :reason :get-result-not-ready))))
         (size (if (eq state :copied)
                   (- (contesto-get-value-end context) (contesto-get-value-start context)) 0)))
    (unwind-protect
         (progn
           (esigi-stato-get context state)
           (when (and (eq state :absent) (contesto-get-snapshot-p context))
             (guasto-get context :get-snapshot-absence))
           (setf (contesto-get-state context) :finishing)
           (concludi-lettura (contesto-get-reader context) now)
           (values result size))
      (abbandona-get context))))
