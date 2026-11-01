;;;; Configuration is bounded before allocating histogram counters.
(in-package #:arcdocdb.metrics)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(declaim (ftype (function (&key (:bit-precisione t) (:massimo t) (:limite-campioni t) (:unita t)
                              (:tick-al-secondo t) (:dominio t))
                         configurazione-istogramma) crea-configurazione-istogramma))
(defun crea-configurazione-istogramma
    (&key (bit-precisione 7) (massimo 60000000000) (limite-campioni +massimi-campioni+)
          (unita :nanosecondi) tick-al-secondo (dominio :monotono))
  "Pre: startup configuration. Post: immutable geometry with a reserved above-range cell.
INVALID-ARGUMENT rejects precision 4..10, range, sample limit or unit violations before allocation."
  (unless (and (typep bit-precisione 'precisione) (typep massimo 'latenza)
               (typep limite-campioni '(integer 1 #.+massimi-campioni+))
               (member unita '(:nanosecondi :microsecondi :tick)) (keywordp dominio))
    (error 'invalid-argument :reason :metrics-histogram-config))
  (let ((scale (or tick-al-secondo (case unita (:nanosecondi 1000000000) (:microsecondi 1000000)
                                    (:tick nil) (otherwise (error 'invariant-violation :reason :metrics-unit-invariant)))))
        (cells (+ 2 (%indice-latenza massimo bit-precisione))))
    (unless (and (typep scale '(integer 1 #.+massima-latenza+))
                 (case unita (:nanosecondi (= scale 1000000000)) (:microsecondi (= scale 1000000))
                   (:tick t) (otherwise (error 'invariant-violation :reason :metrics-unit-invariant))))
      (error 'invalid-argument :reason :metrics-histogram-scale))
    (%make-configurazione-istogramma bit-precisione massimo limite-campioni unita scale dominio cells (* 8 cells))))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(declaim (ftype (function (&optional t) istogramma-latenze) crea-istogramma))
(defun crea-istogramma (&optional (config (crea-configurazione-istogramma)))
  "Pre: startup, immutable configuration. Post: independent zeroed counters owned by this thread.
INVALID-ARGUMENT rejects a foreign configuration before allocation; no array is exposed."
  (unless (configurazione-istogramma-p config)
    (error 'invalid-argument :reason :metrics-histogram-config))
  (%make-istogramma-latenze config
    (make-array (configurazione-istogramma-celle config) :element-type '(unsigned-byte 64) :initial-element 0)
    sb-thread:*current-thread*))
