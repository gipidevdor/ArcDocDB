;;;; Only the owner writes. Saturation rejects observations without wrapping a counter.
;;; OWNER: the constructing thread, never a global accumulator or another Serie's writer.
(in-package #:arcdocdb.metrics)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; OWNER: the current SBCL thread's dynamic binding, restored by native stack unwinding.
;;; SHARED: the root value is NIL and never assigned; observations write only thread-local bindings (INV-P6).
;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(defvar *accesso-istogrammi* nil "Thread-local active owner identity; the global root is never assigned.")
(declaim (type (or null sb-thread:thread) *accesso-istogrammi*))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(declaim (inline %verifica-istogramma-owner))
(declaim (ftype (function (t) istogramma-latenze) %verifica-istogramma-owner))
(defun %verifica-istogramma-owner (histogram)
  "Pre: public histogram operation. Post: typed histogram owned by the current thread.
INVALID-ARGUMENT rejects type/owner violations before reading mutable counters or writing."
  (unless (and (istogramma-latenze-p histogram)
               (eq (istogramma-latenze-owner histogram) sb-thread:*current-thread*))
    (error 'invalid-argument :reason :metrics-histogram-owner))
  histogram)

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008 REQ-AFF-003
(defmacro %con-mutazione-istogramma ((histogram &key reset sola-lettura) &body body)
  "Pre: static body and histogram already validated for this owner; RESET permits recovery.
Post: preserves body values, unwinds the thread-local scope, and commits valid mutation state last.
RESET/SOLA-LETTURA are literal booleans. Reentry rejects before cleanup; histogram is evaluated once."
  (unless (and (member reset '(nil t)) (member sola-lettura '(nil t)))
    (error 'invalid-argument :reason :metrics-histogram-scope))
  (let ((hist (gensym "HISTOGRAM")))
    `(let ((,hist ,histogram))
       (when (eq *accesso-istogrammi* sb-thread:*current-thread*)
         (error 'invalid-argument :reason :metrics-histogram-reentry))
       (let ((*accesso-istogrammi* sb-thread:*current-thread*))
         (when (and (istogramma-latenze-guasto-p ,hist) (not ,reset))
           (error 'invariant-violation :reason :metrics-histogram-interrupted))
         ,(if sola-lettura `(progn ,@body)
              `(progn
                 (setf (istogramma-latenze-guasto-p ,hist) t)
                 (multiple-value-prog1 (progn ,@body)
                   (setf (istogramma-latenze-guasto-p ,hist) nil))))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(declaim (ftype (function (istogramma-latenze latenza) (member :recorded :above-range :saturated)) %registra-latenza))
(defun %registra-latenza (hist value)
  "Pre: validated duration and entered owner operation. Post: one observation or sticky saturation.
Private typed arithmetic is bounded by total population; no ordinary condition or allocation."
  (let ((config (istogramma-latenze-configurazione hist)))
    (if (= (istogramma-latenze-campioni hist) (configurazione-istogramma-limite-campioni config))
        (progn (setf (istogramma-latenze-saturato-p hist) t) :saturated)
        (let* ((above (> value (configurazione-istogramma-massimo config)))
               (index (if above (1- (configurazione-istogramma-celle config))
                          (%indice-latenza value (configurazione-istogramma-bit-precisione config))))
               (counts (istogramma-latenze-contatori hist)))
          (incf (aref counts index))
          (incf (istogramma-latenze-campioni hist))
          (when (> value (istogramma-latenze-massimo-osservato hist))
            (setf (istogramma-latenze-massimo-osservato hist) value))
          (if above :above-range :recorded)))))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(declaim (ftype (function (t t) (member :recorded :above-range :saturated)) registra-latenza))
(defun registra-latenza (histogram value)
  "Pre: owner passes a duration in the configured unit. Post: one accepted observation or sticky saturation.
Returns :RECORDED/:ABOVE-RANGE on acceptance, :SATURATED on rejection. No wrap or hot allocation.
INVALID-ARGUMENT rejects invalid duration/owner before mutation; time is supplied, never sampled here."
  (let ((hist (%verifica-istogramma-owner histogram)))
    (unless (typep value 'latenza) (error 'invalid-argument :reason :metrics-latency-value))
    (%con-mutazione-istogramma (hist) (%registra-latenza hist value))))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(declaim (ftype (function (t) istogramma-latenze) azzera-istogramma))
(defun azzera-istogramma (histogram)
  "Pre: owner begins a new measurement window. Post: fixed counters, maximum and saturation reset.
INVALID-ARGUMENT rejects type/owner before mutation; old immutable snapshots remain valid."
  (let ((hist (%verifica-istogramma-owner histogram)))
    (%con-mutazione-istogramma (hist :reset t)
      (fill (istogramma-latenze-contatori hist) 0)
      (setf (istogramma-latenze-campioni hist) 0 (istogramma-latenze-saturato-p hist) nil
            (istogramma-latenze-massimo-osservato hist) 0)
      hist)))
