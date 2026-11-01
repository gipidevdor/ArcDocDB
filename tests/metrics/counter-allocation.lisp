;;;; Ordinary uninstrumented allocation observations; construction/capture stays outside spans.
;;; OWNER: serial fixture owner, no worker or shared request counter.
(in-package #:arcdocdb.metrics.tests)
(declaim (optimize (safety 3) (speed 3) (debug 1)))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (m:metriche-serie keyword fixnum) null) counter-hot-burst))
(defun counter-hot-burst (metrics scenario count)
  "Pre: warmed owner partition and supported bounded scenario. Post: public operations only, no cold capture.
Reset reuses arrays with increasing injected starts; timing/assertions/formatting belong outside this span."
  (dotimes (index count)
    (case scenario
      (:request (m:registra-richiesta metrics 127))
      (:error (m:registra-richiesta metrics 257 :errore))
      (:cache (m:registra-cache metrics :hit))
      (:append (m:registra-append-wal metrics 16))
      (:flush (m:registra-flush-wal metrics 257 4))
      (:queue (m:registra-coda metrics :richieste (logand index 7)))
      (:saturated (m:registra-richiesta metrics 127))
      (:reset (m:azzera-metriche-serie metrics (1+ (m::metriche-serie-inizio metrics))))
      (otherwise (error 'invariant-violation :reason :metrics-test-scenario))))
  nil)

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-COUNTER-HOT-ALLOCATION
  "Pre: ordinary uninstrumented serial suite. Post: eight warmed spans assert zero measured bytes consed.
Positive results are printed outside the windows before assertions so a failed observation remains in the record."
  (let* ((config (m:crea-configurazione-istogramma :massimo 256 :limite-campioni 100000000))
         (normal (m:crea-metriche-serie 1 0 0 config))
         (saturated (m:crea-metriche-serie 2 0 0 (m:crea-configurazione-istogramma :limite-campioni 1)))
         (scenarios #(:request :error :cache :append :flush :queue :saturated :reset))
         (observations (make-array 8 :element-type '(unsigned-byte 64) :initial-element 0)))
    (m:registra-richiesta saturated 0)
    (loop for scenario across scenarios do
      (counter-hot-burst (if (eq scenario :saturated) saturated normal) scenario 8192))
    (m:azzera-metriche-serie normal (1+ (m::metriche-serie-inizio normal)))
    (sb-ext:get-bytes-consed) (sb-ext:get-bytes-consed)
    (dotimes (index (length scenarios))
      (let* ((scenario (svref scenarios index))
             (metrics (if (eq scenario :saturated) saturated normal))
             (count (if (eq scenario :reset) 10000 100000))
             (before (sb-ext:get-bytes-consed)))
        (counter-hot-burst metrics scenario count)
        (setf (aref observations index) (- (sb-ext:get-bytes-consed) before))))
    (format t "~S~%" (list :kind :metrics-counter-hot-allocation :scenarios scenarios
                           :iterations 100000 :reset-iterations 10000 :bytes-consed observations
                           :counter-scope :whole-process :gc :enabled :construction-and-capture :excluded))
    (loop for bytes across observations do (is (zerop bytes)))
    ;; Reset was the last measured operation; inspect its empty coherent result now.
    (let ((image (m:istantanea-metriche normal (m::metriche-serie-inizio normal))))
      (is (m:metriche-complete-p image))
      (is (zerop (m:valore-contatore image :richieste)))
      (is (zerop (m:istantanea-latenze-campioni (m:istantanea-metriche-latenza-flush image)))))
    (multiple-value-bind (count complete) (m:valore-contatore (m:istantanea-metriche saturated 1) :richieste)
      (is (= 1 count)) (is (not complete))))
  t)
