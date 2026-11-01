;;;; Cold owner capture, exact rates, and reset; never expose mutable payload arrays.
(in-package #:arcdocdb.metrics)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(declaim (ftype (function (t t) istantanea-metriche) istantanea-metriche))
(defun istantanea-metriche (metrics fine)
  "Pre: owner injects window end >= start in the configured clock unit/domain.
Post: independent coherent counter/histogram image; INVALID-ARGUMENT precedes copy, allocation failure is read-only."
  (let ((m (%verifica-metriche-owner metrics)))
    (unless (typep fine 'latenza) (error 'invalid-argument :reason :metrics-window-end))
    (%con-mutazione-istogramma ((metriche-serie-latenza-richieste m) :sola-lettura t)
      (unless (>= fine (metriche-serie-inizio m)) (error 'invalid-argument :reason :metrics-window-end))
      (%make-istantanea-metriche (metriche-serie-serie m) (metriche-serie-worker m)
        (metriche-serie-inizio m) fine (vector (metriche-serie-fonte m))
        (copy-seq (metriche-serie-contatori m)) (copy-seq (metriche-serie-code m))
        (metriche-serie-code-note m) (metriche-serie-incompleti m)
        (%copia-istogramma (metriche-serie-latenza-richieste m))
        (%copia-istogramma (metriche-serie-latenza-flush m))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(declaim (ftype (function (t t) metriche-serie) azzera-metriche-serie))
(defun azzera-metriche-serie (metrics inizio)
  "Pre: owner supplies a strictly newer start. Post: empty accounting and valid scope; normal reset preserves queues.
Fault recovery forgets possibly partial queue state. INVALID-ARGUMENT precedes mutation; interrupted reset stays faulty."
  (let ((m (%verifica-metriche-owner metrics)) (faulted nil))
    (unless (typep inizio 'latenza) (error 'invalid-argument :reason :metrics-window-start))
    (%con-mutazione-istogramma ((metriche-serie-latenza-richieste m) :reset t
       :prima ((unless (> inizio (metriche-serie-inizio m)) (error 'invalid-argument :reason :metrics-window-start))
               (setf faulted (istogramma-latenze-guasto-p (metriche-serie-latenza-richieste m)))))
      (%azzera-istogramma (metriche-serie-latenza-richieste m))
      (%azzera-istogramma (metriche-serie-latenza-flush m))
      (fill (metriche-serie-contatori m) 0)
      (if faulted
          (progn (fill (metriche-serie-code m) 0) (setf (metriche-serie-code-note m) 0))
          (dotimes (index +numero-code-metriche+)
            (setf (aref (metriche-serie-code m) (1+ (* 2 index))) (aref (metriche-serie-code m) (* 2 index)))))
      (setf (metriche-serie-inizio m) inizio (metriche-serie-incompleti m) 0)
      m)))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (t) istantanea-metriche) %verifica-istantanea-metriche))
(defun %verifica-istantanea-metriche (snapshot)
  "Pre: public metric reader input. Post: typed immutable snapshot with nonnegative interval.
INVALID-ARGUMENT rejects other values; INVARIANT-VIOLATION detects inconsistent internal window metadata."
  (unless (istantanea-metriche-p snapshot) (error 'invalid-argument :reason :metrics-snapshot))
  (when (< (istantanea-metriche-fine snapshot) (istantanea-metriche-inizio snapshot))
    (error 'invariant-violation :reason :metrics-window-invariant))
  snapshot)

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (t t) (values campioni boolean)) valore-contatore))
(defun valore-contatore (snapshot key)
  "Pre: immutable snapshot and finite key. Post: retained count and whether its submitted events were complete.
INVALID-ARGUMENT rejects bad snapshot/key; completeness does not assert instrumentation coverage."
  (let ((s (%verifica-istantanea-metriche snapshot)) (index (%indice-contatore key)))
    (values (aref (istantanea-metriche-contatori s) index) (not (logbitp index (istantanea-metriche-incompleti s))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (t) boolean) metriche-complete-p))
(defun metriche-complete-p (snapshot)
  "Pre: immutable metric snapshot. Post: completeness of submitted counter/latency events only.
INVALID-ARGUMENT rejects wrong type; unknown queue observations remain a separate availability status."
  (let ((s (%verifica-istantanea-metriche snapshot)))
    (and (zerop (istantanea-metriche-incompleti s))
         (not (istantanea-latenze-saturata-p (istantanea-metriche-latenza-richieste s)))
         (not (istantanea-latenze-saturata-p (istantanea-metriche-latenza-flush s))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (t) (integer 1 #.+massime-fonti-metriche+)) numero-fonti-metriche))
(defun numero-fonti-metriche (snapshot)
  "Pre: public immutable image. Post: bounded original partition count; INVALID-ARGUMENT rejects wrong type."
  (length (istantanea-metriche-origini (%verifica-istantanea-metriche snapshot))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (t t) (values (or null rational) (member :ok :incomplete :zero-window) boolean)) tasso-contatore))
(defun tasso-contatore (snapshot key)
  "Pre: immutable snapshot, finite counter key and truthful injected window. Post: exact per-second rate/status/completeness.
Zero interval returns no rate. INVALID-ARGUMENT rejects bad inputs; cold arithmetic may allocate."
  (let* ((s (%verifica-istantanea-metriche snapshot))
         (elapsed (- (istantanea-metriche-fine s) (istantanea-metriche-inizio s)))
         (config (istantanea-latenze-configurazione (istantanea-metriche-latenza-richieste s))))
    (multiple-value-bind (count complete) (valore-contatore s key)
      (if (zerop elapsed) (values nil :zero-window complete)
          (values (/ (* count (configurazione-istogramma-tick-al-secondo config)) elapsed)
                  (if complete :ok :incomplete) complete)))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (t t) (values (or null campioni) (or null campioni)
                                      (member :exact :upper-bound :unobserved))) stato-coda))
(defun stato-coda (snapshot kind)
  "Pre: immutable image and queue kind. Post: current, sampled peak/bound and explicit availability.
INVALID-ARGUMENT rejects bad inputs. Sum of source maxima is an upper bound, never an observed global peak."
  (let* ((s (%verifica-istantanea-metriche snapshot)) (index (%indice-coda kind)) (offset (* 2 index)))
    (if (logbitp index (istantanea-metriche-code-note s))
        (values (aref (istantanea-metriche-code s) offset) (aref (istantanea-metriche-code s) (1+ offset))
                (if (= 1 (numero-fonti-metriche s)) :exact :upper-bound))
        (values nil nil :unobserved))))
