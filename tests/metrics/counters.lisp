;;;; Dedicated counter, coherent-capture and provenance aggregation contracts.
;;; OWNER: each serial test owns its live partitions and explicitly synthetic cold fixtures.
;;; SHARED: immutable configurations/captures only; no clock or performance evidence.
(in-package #:arcdocdb.metrics.tests)

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function () list) counter-test-keys))
(defun counter-test-keys ()
  "Pre: cold assertion. Post: public counter vocabulary, independent of private index/bit assignments."
  '(:richieste :errori :cache-hit :cache-miss :cache-espulsioni :cache-errori-verifica
    :wal-append :wal-byte :wal-flush :wal-record))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (m:istantanea-metriche list &optional list) boolean) check-metric-counts))
(defun check-metric-counts (snapshot expected &optional incomplete)
  "Pre: EXPECTED is a public-key/count alist, omitted keys mean zero; INCOMPLETE lists lost accounting.
Post: all ten values/flags and both accepted histogram populations agree with independent event totals."
  (dolist (key (counter-test-keys))
    (is (equal (list (or (cdr (assoc key expected)) 0) (not (member key incomplete)))
               (multiple-value-list (m:valore-contatore snapshot key)))))
  (is (eq (null incomplete) (m:metriche-complete-p snapshot)))
  (let ((requests (m:istantanea-metriche-latenza-richieste snapshot))
        (flushes (m:istantanea-metriche-latenza-flush snapshot)))
    (check-population requests) (check-population flushes)
    (is (= (m:valore-contatore snapshot :richieste) (m:istantanea-latenze-campioni requests)))
    (is (= (m:valore-contatore snapshot :wal-flush) (m:istantanea-latenze-campioni flushes)))
    (is (<= (m:valore-contatore snapshot :errori) (m:valore-contatore snapshot :richieste)))
    (is (eq (not (null (member :richieste incomplete))) (m:istantanea-latenze-saturata-p requests)))
    (is (eq (not (null (member :wal-flush incomplete))) (m:istantanea-latenze-saturata-p flushes))))
  t)

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (m:istantanea-latenze) list) counter-latency-image))
(defun counter-latency-image (snapshot)
  "Pre: immutable latency image. Post: copied bins and public metadata for source-preservation assertions."
  (let ((config (m:istantanea-latenze-configurazione snapshot)))
    (list (copy-seq (m::istantanea-latenze-contatori snapshot))
          (m:istantanea-latenze-campioni snapshot) (m:istantanea-latenze-saturata-p snapshot)
          (m:istantanea-latenze-massimo-osservato snapshot)
          (m:configurazione-istogramma-bit-precisione config) (m:configurazione-istogramma-massimo config)
          (m:configurazione-istogramma-limite-campioni config) (m:configurazione-istogramma-unita config)
          (m:configurazione-istogramma-tick-al-secondo config) (m:configurazione-istogramma-dominio config))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (m:istantanea-metriche) list) counter-snapshot-image))
(defun counter-snapshot-image (snapshot)
  "Pre: safely published immutable capture. Post: independent value image, with no mutable array aliases."
  (list (m:istantanea-metriche-serie snapshot) (m:istantanea-metriche-worker snapshot)
        (m:istantanea-metriche-inizio snapshot) (m:istantanea-metriche-fine snapshot)
        (m:numero-fonti-metriche snapshot) (m:metriche-complete-p snapshot)
        (mapcar (lambda (key) (multiple-value-list (m:valore-contatore snapshot key))) (counter-test-keys))
        (multiple-value-list (m:stato-coda snapshot :richieste))
        (multiple-value-list (m:stato-coda snapshot :wal))
        (counter-latency-image (m:istantanea-metriche-latenza-richieste snapshot))
        (counter-latency-image (m:istantanea-metriche-latenza-flush snapshot))))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(declaim (ftype (function (m:metriche-serie) list) counter-partition-state))
(defun counter-partition-state (metrics)
  "Pre: quiescent private test fixture, possibly faulty. Post: copy of all mutable fields without public capture.
Private reads check no-change guarantees; the oracle never depends on counter or completeness bit positions."
  (list (m::metriche-serie-serie metrics) (m::metriche-serie-worker metrics)
        (m::metriche-serie-inizio metrics) (copy-seq (m::metriche-serie-contatori metrics))
        (copy-seq (m::metriche-serie-code metrics)) (m::metriche-serie-code-note metrics)
        (m::metriche-serie-incompleti metrics)
        (histogram-state (m::metriche-serie-latenza-richieste metrics))
        (histogram-state (m::metriche-serie-latenza-flush metrics))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-counter-empty-identities-and-construction-validation
  "Pre: fresh partitions at identity/tick endpoints and malformed constructor inputs.
Post: zero complete accounting, independent unknown queues and exact immutable source identities."
  (dolist (identity (list 0 (1- (expt 2 128))))
    (let* ((worker (1- (expt 2 60))) (metrics (m:crea-metriche-serie identity worker worker))
           (snapshot (m:istantanea-metriche metrics worker)))
      (check-metric-counts snapshot nil)
      (is (= identity (m:istantanea-metriche-serie snapshot)))
      (is (= worker (m:istantanea-metriche-worker snapshot)))
      (is (= worker (m:istantanea-metriche-inizio snapshot) (m:istantanea-metriche-fine snapshot)))
      (is (= 1 (m:numero-fonti-metriche snapshot)))
      (dolist (kind '(:richieste :wal))
        (is (equal '(nil nil :unobserved) (multiple-value-list (m:stato-coda snapshot kind)))))))
  (dolist (bad (list -1 (expt 2 128) 1/2 1.0 nil :serie #()))
    (signals invalid-argument (m:crea-metriche-serie bad 0 0)))
  (dolist (bad (list -1 (expt 2 60) 1/2 1.0 nil :worker #()))
    (signals invalid-argument (m:crea-metriche-serie 0 bad 0))
    (signals invalid-argument (m:crea-metriche-serie 0 0 bad)))
  (dolist (bad '(nil 0 :config #()))
    (signals invalid-argument (m:crea-metriche-serie 0 0 0 bad))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-counter-events-conserve-request-and-flush-populations
  "Pre: explicit completed events, including errors, zero increments and above-range durations.
Post: independent scalar totals and sorted latency observations describe the same accepted events."
  (let ((metrics (m:crea-metriche-serie 17 3 10
                   (m:crea-configurazione-istogramma :bit-precisione 4 :massimo 32))))
    (is (eq :recorded (m:registra-richiesta metrics 0)))
    (is (eq :recorded (m:registra-richiesta metrics 7 :errore)))
    (is (eq :above-range (m:registra-richiesta metrics 33 :ok)))
    (is (eq :above-range (m:registra-richiesta metrics 99 :errore)))
    (dolist (outcome '(:hit :miss :hit :espulsione :errore-verifica))
      (is (eq :recorded (m:registra-cache metrics outcome))))
    (dolist (bytes '(0 7 13)) (is (eq :recorded (m:registra-append-wal metrics bytes))))
    (is (eq :recorded (m:registra-flush-wal metrics 1 0)))
    (is (eq :above-range (m:registra-flush-wal metrics 40 9)))
    (let ((snapshot (m:istantanea-metriche metrics 20)))
      (check-metric-counts snapshot '((:richieste . 4) (:errori . 2) (:cache-hit . 2) (:cache-miss . 1)
                                     (:cache-espulsioni . 1) (:cache-errori-verifica . 1)
                                     (:wal-append . 3) (:wal-byte . 20) (:wal-flush . 2) (:wal-record . 9)))
      (dolist (fraction '((1 4) (1 2) (3 4) (1 1)))
        (check-reference-percentile (m:istantanea-metriche-latenza-richieste snapshot) #(0 7 33 99)
                                    (first fraction) (second fraction) t))
      (check-reference-percentile (m:istantanea-metriche-latenza-flush snapshot) #(1 40) 1 1 t))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-counter-cache-incompleteness-is-independent
  "Pre: each cache outcome independently reaches its cap. Post: only that public counter becomes incomplete."
  (loop for outcome in '(:hit :miss :espulsione :errore-verifica)
        for key in '(:cache-hit :cache-miss :cache-espulsioni :cache-errori-verifica)
        do (let ((metrics (m:crea-metriche-serie 0 0 0 (m:crea-configurazione-istogramma :limite-campioni 1))))
             (is (eq :recorded (m:registra-cache metrics outcome)))
             (check-metric-counts (m:istantanea-metriche metrics 1) (list (cons key 1)))
             (dotimes (attempt 2) (is (eq :saturated (m:registra-cache metrics outcome))))
             (check-metric-counts (m:istantanea-metriche metrics 1) (list (cons key 1)) (list key))
             (is (eq :recorded (m:registra-richiesta metrics 7)))
             (is (eq :recorded (m:registra-flush-wal metrics 9 0)))
             (check-metric-counts (m:istantanea-metriche metrics 1)
                                  (list (cons key 1) '(:richieste . 1) '(:wal-flush . 1)) (list key)))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-counter-request-rejection-is-atomic-and-outcome-specific
  "Pre: accepted request capacity exhausted. Post: rejected OK/error events preserve latency/counts and mark affected keys."
  (let ((metrics (m:crea-metriche-serie 0 0 0 (m:crea-configurazione-istogramma :limite-campioni 2 :massimo 32))))
    (m:registra-richiesta metrics 7 :errore) (m:registra-richiesta metrics 9 :ok)
    (let ((full (m:istantanea-metriche metrics 1)))
      (check-metric-counts full '((:richieste . 2) (:errori . 1)))
      (is (eq :saturated (m:registra-richiesta metrics 999 :ok)))
      (check-metric-counts (m:istantanea-metriche metrics 1)
                           '((:richieste . 2) (:errori . 1)) '(:richieste))
      (is (eq :saturated (m:registra-richiesta metrics 1000 :errore)))
      (let ((lost (m:istantanea-metriche metrics 1)))
        (check-metric-counts lost '((:richieste . 2) (:errori . 1)) '(:richieste :errori))
        (check-reference-percentile (m:istantanea-metriche-latenza-richieste lost) #(7 9) 1 1 nil))
      (check-metric-counts full '((:richieste . 2) (:errori . 1))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-counter-wal-append-count-and-bytes-reject-together
  "Pre: either append count or byte sum is independently at capacity. Post: neither half of a rejected append advances."
  (dolist (increments '((0 0 0) (3) (2)))
    (let ((metrics (m:crea-metriche-serie 0 0 0 (m:crea-configurazione-istogramma :limite-campioni 3))))
      (dolist (bytes increments) (is (eq :recorded (m:registra-append-wal metrics bytes))))
      (let* ((expected (list (cons :wal-append (length increments)) (cons :wal-byte (reduce #'+ increments))))
             (full (m:istantanea-metriche metrics 1)) (saved (counter-snapshot-image full))
             (rejected (cond ((= 3 (length increments)) 0) ((= 3 (first increments)) 1) (t 2))))
        (check-metric-counts full expected)
        (dotimes (attempt 2) (is (eq :saturated (m:registra-append-wal metrics rejected))))
        (dolist (smaller '(0 1)) (is (eq :saturated (m:registra-append-wal metrics smaller))))
        (check-metric-counts (m:istantanea-metriche metrics 1) expected '(:wal-append :wal-byte))
        (is (equalp saved (counter-snapshot-image full)))
        (is (eq :recorded (m:registra-cache metrics :hit)))
        (check-metric-counts (m:istantanea-metriche metrics 1)
                             (cons '(:cache-hit . 1) expected) '(:wal-append :wal-byte))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-counter-wal-flush-group-and-latency-reject-together
  "Pre: flush count or group sum independently prevents acceptance. Post: group/count/distribution remain one population."
  (dolist (groups '((0 0 0) (3) (2)))
    (let ((metrics (m:crea-metriche-serie 0 0 0
                     (m:crea-configurazione-istogramma :limite-campioni 3 :massimo 32))))
      (dolist (records groups) (is (eq :recorded (m:registra-flush-wal metrics 7 records))))
      (let* ((expected (list (cons :wal-flush (length groups)) (cons :wal-record (reduce #'+ groups))))
             (full (m:istantanea-metriche metrics 1))
             (rejected (cond ((= 3 (length groups)) 0) ((= 3 (first groups)) 1) (t 2))))
        (check-metric-counts full expected)
        (dotimes (attempt 2) (is (eq :saturated (m:registra-flush-wal metrics 999 rejected))))
        (dolist (smaller '(0 1)) (is (eq :saturated (m:registra-flush-wal metrics 0 smaller))))
        (let ((lost (m:istantanea-metriche metrics 1)))
          (check-metric-counts lost expected '(:wal-flush :wal-record))
          (check-reference-percentile (m:istantanea-metriche-latenza-flush lost)
                                      (make-array (length groups) :initial-element 7) 1 1 nil))
        (check-metric-counts full expected)
        (is (eq :recorded (m:registra-richiesta metrics 9)))
        (check-metric-counts (m:istantanea-metriche metrics 1)
                             (cons '(:richieste . 1) expected) '(:wal-flush :wal-record))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-counter-invalid-arguments-precede-every-state-change-even-at-cap
  "Pre: empty, full-but-complete and incomplete partitions. Post: invalid values never set loss/fault flags or alter data."
  (let ((metrics (m:crea-metriche-serie 0 0 10 (m:crea-configurazione-istogramma :limite-campioni 2))))
    (m:registra-coda metrics :richieste 7) (m:registra-coda metrics :wal 9)
    (dotimes (phase 3)
      (let ((before (counter-partition-state metrics)))
        (dolist (bad (list -1 (expt 2 60) (expt 2 100) 1/2 0.0 1d0 nil t #\a :value "7" #()))
          (signals invalid-argument (m:registra-richiesta metrics bad :ok))
          (is (equalp before (counter-partition-state metrics)))
          (signals invalid-argument (m:registra-append-wal metrics bad))
          (is (equalp before (counter-partition-state metrics)))
          (signals invalid-argument (m:registra-flush-wal metrics bad 0))
          (is (equalp before (counter-partition-state metrics)))
          (signals invalid-argument (m:registra-flush-wal metrics 0 bad))
          (is (equalp before (counter-partition-state metrics)))
          (dolist (kind '(:richieste :wal))
            (signals invalid-argument (m:registra-coda metrics kind bad))
            (is (equalp before (counter-partition-state metrics))))
          (signals invalid-argument (m:istantanea-metriche metrics bad))
          (is (equalp before (counter-partition-state metrics)))
          (signals invalid-argument (m:azzera-metriche-serie metrics bad))
          (is (equalp before (counter-partition-state metrics))))
        (dolist (bad '(nil t 0 "ok" :unknown :hit))
          (signals invalid-argument (m:registra-richiesta metrics 0 bad))
          (is (equalp before (counter-partition-state metrics))))
        (dolist (bad '(nil t 0 "hit" :unknown :ok))
          (signals invalid-argument (m:registra-cache metrics bad))
          (is (equalp before (counter-partition-state metrics))))
        (dolist (bad '(nil t 0 "wal" :unknown :request))
          (signals invalid-argument (m:registra-coda metrics bad 0))
          (is (equalp before (counter-partition-state metrics)))))
      (case phase
        (0 (dotimes (index 2)
             (m:registra-richiesta metrics 0 :errore)
             (dolist (outcome '(:hit :miss :espulsione :errore-verifica)) (m:registra-cache metrics outcome))
             (m:registra-append-wal metrics 1) (m:registra-flush-wal metrics 0 1)))
        (1 (m:registra-richiesta metrics 0 :errore)
           (dolist (outcome '(:hit :miss :espulsione :errore-verifica)) (m:registra-cache metrics outcome))
           (m:registra-append-wal metrics 1) (m:registra-flush-wal metrics 0 1))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-002-counter-rates-are-exact-and-zero-windows-explicit
  "Pre: injected seven-tick clock and a three-tick window. Post: rational rates/status/completeness, without wall time."
  (let ((metrics (m:crea-metriche-serie 0 0 10
                   (m:crea-configurazione-istogramma :unita :tick :tick-al-secondo 7 :limite-campioni 3))))
    (m:registra-richiesta metrics 1) (m:registra-richiesta metrics 2 :errore)
    (m:registra-append-wal metrics 3)
    (let ((snapshot (m:istantanea-metriche metrics 13)))
      (dolist (pair '((:richieste . 14/3) (:errori . 7/3) (:wal-append . 7/3) (:wal-byte . 7) (:cache-hit . 0)))
        (is (equal (list (cdr pair) :ok t) (multiple-value-list (m:tasso-contatore snapshot (car pair)))))))
    (m:registra-append-wal metrics 1)
    (let ((snapshot (m:istantanea-metriche metrics 13)))
      (is (equal '(7 :incomplete nil) (multiple-value-list (m:tasso-contatore snapshot :wal-byte))))
      (is (equal '(7/3 :incomplete nil) (multiple-value-list (m:tasso-contatore snapshot :wal-append))))
      (is (equal '(14/3 :ok t) (multiple-value-list (m:tasso-contatore snapshot :richieste)))))
    (let ((zero (m:istantanea-metriche metrics 10)))
      (is (equal '(nil :zero-window t) (multiple-value-list (m:tasso-contatore zero :richieste))))
      (is (equal '(nil :zero-window nil) (multiple-value-list (m:tasso-contatore zero :wal-byte)))))
    (let ((empty (m:istantanea-metriche (m:crea-metriche-serie 1 0 0) 0)))
      (dolist (key (counter-test-keys))
        (is (equal '(nil :zero-window t) (multiple-value-list (m:tasso-contatore empty key))))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-002-counter-clock-regression-and-reader-arguments
  "Pre: injected start ten, then a reset to twelve. Post: regressing cuts and non-increasing resets reject before mutation."
  (let ((metrics (m:crea-metriche-serie 0 0 10)))
    (m:registra-richiesta metrics 7)
    (let ((before (counter-partition-state metrics)) (snapshot (m:istantanea-metriche metrics 20)))
      (signals invalid-argument (m:istantanea-metriche metrics 9))
      (is (equalp before (counter-partition-state metrics)))
      (signals invalid-argument (m:azzera-metriche-serie metrics 9))
      (is (equalp before (counter-partition-state metrics)))
      (signals invalid-argument (m:azzera-metriche-serie metrics 10))
      (is (equalp before (counter-partition-state metrics)))
      (dolist (bad '(nil 0 "richieste" :unknown :wal-bytes))
        (signals invalid-argument (m:valore-contatore snapshot bad))
        (signals invalid-argument (m:tasso-contatore snapshot bad)))
      (dolist (bad '(nil 0 :unknown :requests)) (signals invalid-argument (m:stato-coda snapshot bad)))
      (dolist (bad (list nil 0 #() metrics (m:istantanea-istogramma (m:crea-istogramma))))
        (signals invalid-argument (m:valore-contatore bad :richieste))
        (signals invalid-argument (m:tasso-contatore bad :richieste))
        (signals invalid-argument (m:stato-coda bad :wal))
        (signals invalid-argument (m:metriche-complete-p bad))
        (signals invalid-argument (m:numero-fonti-metriche bad))))
    (m:azzera-metriche-serie metrics 12)
    (let ((before (counter-partition-state metrics)))
      (signals invalid-argument (m:istantanea-metriche metrics 11))
      (signals invalid-argument (m:azzera-metriche-serie metrics 11))
      (signals invalid-argument (m:azzera-metriche-serie metrics 12))
      (is (equalp before (counter-partition-state metrics))))
    (check-metric-counts (m:istantanea-metriche metrics 12) nil)))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-counter-queue-unknowns-and-reset-current-versus-peak
  "Pre: two independently unobserved queues, sampled peaks then lower currents.
Post: known zero differs from unknown; reset retains current and begins peaks there, clearing all loss flags."
  (let ((metrics (m:crea-metriche-serie 0 0 0 (m:crea-configurazione-istogramma :limite-campioni 1))))
    (m:registra-coda metrics :richieste 0)
    (let ((one-known (m:istantanea-metriche metrics 1)))
      (is (equal '(0 0 :exact) (multiple-value-list (m:stato-coda one-known :richieste))))
      (is (equal '(nil nil :unobserved) (multiple-value-list (m:stato-coda one-known :wal)))))
    (m:azzera-metriche-serie metrics 1)
    (is (equal '(nil nil :unobserved)
               (multiple-value-list (m:stato-coda (m:istantanea-metriche metrics 1) :wal))))
    (dolist (sample '((:richieste 11) (:richieste 3) (:wal 17) (:wal 2)))
      (is (eq metrics (m:registra-coda metrics (first sample) (second sample)))))
    (m:registra-richiesta metrics 7 :errore) (m:registra-richiesta metrics 99 :errore)
    (m:registra-cache metrics :hit) (m:registra-cache metrics :hit)
    (m:registra-append-wal metrics 1) (m:registra-append-wal metrics 1)
    (m:registra-flush-wal metrics 9 1) (m:registra-flush-wal metrics 99 1)
    (let* ((retained (m:istantanea-metriche metrics 2)) (saved (counter-snapshot-image retained)))
      (is (equal '(3 11 :exact) (multiple-value-list (m:stato-coda retained :richieste))))
      (is (equal '(2 17 :exact) (multiple-value-list (m:stato-coda retained :wal))))
      (m:azzera-metriche-serie metrics 2)
      (let ((empty (m:istantanea-metriche metrics 2)))
        (check-metric-counts empty nil)
        (is (equal '(3 3 :exact) (multiple-value-list (m:stato-coda empty :richieste))))
        (is (equal '(2 2 :exact) (multiple-value-list (m:stato-coda empty :wal))))
        (dolist (latency (list (m:istantanea-metriche-latenza-richieste empty)
                              (m:istantanea-metriche-latenza-flush empty)))
          (is (equal '(nil nil :empty t) (multiple-value-list (m:percentile-latenza latency 500))))))
      (is (equalp saved (counter-snapshot-image retained))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-counter-first-oversized-wal-event-closes-family-until-reset
  "Pre: first byte/group increment exceeds the configured cap. Post: empty incomplete prefix stays closed, reset reopens."
  (let ((metrics (m:crea-metriche-serie 0 0 0
                   (m:crea-configurazione-istogramma :limite-campioni 3 :massimo 32))))
    (is (eq :saturated (m:registra-append-wal metrics 4)))
    (is (eq :saturated (m:registra-flush-wal metrics 99 4)))
    (dolist (smaller '(0 1 3))
      (is (eq :saturated (m:registra-append-wal metrics smaller)))
      (is (eq :saturated (m:registra-flush-wal metrics 0 smaller))))
    (let* ((empty (m:istantanea-metriche metrics 1)) (saved (counter-snapshot-image empty)))
      (check-metric-counts empty nil '(:wal-append :wal-byte :wal-flush :wal-record))
      (is (equal '(nil nil :empty nil)
                 (multiple-value-list (m:percentile-latenza (m:istantanea-metriche-latenza-flush empty) 500))))
      (is (eq :recorded (m:registra-richiesta metrics 7)))
      (is (eq :recorded (m:registra-cache metrics :hit)))
      (check-metric-counts (m:istantanea-metriche metrics 1) '((:richieste . 1) (:cache-hit . 1))
                           '(:wal-append :wal-byte :wal-flush :wal-record))
      (m:azzera-metriche-serie metrics 1)
      (check-metric-counts (m:istantanea-metriche metrics 1) nil)
      (is (eq :recorded (m:registra-append-wal metrics 0)))
      (is (eq :recorded (m:registra-flush-wal metrics 7 0)))
      (check-metric-counts (m:istantanea-metriche metrics 2) '((:wal-append . 1) (:wal-flush . 1)))
      (is (equalp saved (counter-snapshot-image empty))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-002-counter-aggregate-sums-events-and-distributions-with-different-caps
  "Pre: compatible geometry with caps four and nine, unequal populations and explicit event ledgers.
Post: exact counter sums and merged nearest ranks; source percentiles are never averaged."
  (let* ((left (m:crea-metriche-serie 17 1 10
                  (m:crea-configurazione-istogramma :bit-precisione 4 :massimo 32 :limite-campioni 4)))
         (right (m:crea-metriche-serie 17 2 10
                   (m:crea-configurazione-istogramma :bit-precisione 4 :massimo 32 :limite-campioni 9))))
    (dotimes (index 4) (m:registra-richiesta left 1 (if (zerop index) :errore :ok)))
    (m:registra-richiesta right 31 :errore)
    (m:registra-cache left :hit) (m:registra-cache right :hit) (m:registra-cache right :miss)
    (m:registra-cache left :espulsione) (m:registra-cache right :errore-verifica)
    (m:registra-append-wal left 3) (m:registra-append-wal right 7)
    (m:registra-flush-wal left 7 2) (m:registra-flush-wal right 33 4)
    (m:registra-flush-wal right 9 1)
    (let* ((a (m:istantanea-metriche left 20)) (b (m:istantanea-metriche right 20))
           (saved-a (counter-snapshot-image a)) (saved-b (counter-snapshot-image b))
           (sum (m:aggrega-metriche (vector a b))))
      (check-metric-counts sum '((:richieste . 5) (:errori . 2) (:cache-hit . 2) (:cache-miss . 1)
                                (:cache-espulsioni . 1) (:cache-errori-verifica . 1)
                                (:wal-append . 2) (:wal-byte . 10) (:wal-flush . 3) (:wal-record . 7)))
      (is (= 17 (m:istantanea-metriche-serie sum))) (is (null (m:istantanea-metriche-worker sum)))
      (is (= 2 (m:numero-fonti-metriche sum)))
      (is (= 10 (m:istantanea-metriche-inizio sum))) (is (= 20 (m:istantanea-metriche-fine sum)))
      (dolist (fraction '((1 5) (1 2) (4 5) (1 1)))
        (check-reference-percentile (m:istantanea-metriche-latenza-richieste sum) #(1 1 1 1 31)
                                    (first fraction) (second fraction) t))
      (check-reference-percentile (m:istantanea-metriche-latenza-flush sum) #(7 9 33) 1 1 t)
      (is (equal '(1 1 :ok t)
                 (multiple-value-list (m:percentile-latenza (m:istantanea-metriche-latenza-richieste sum) 500))))
      (is (equalp (counter-snapshot-image sum)
                  (counter-snapshot-image (m:aggrega-metriche (vector b a)))))
      (m:azzera-metriche-serie left 20) (m:azzera-metriche-serie right 20)
      (is (equalp saved-a (counter-snapshot-image a))) (is (equalp saved-b (counter-snapshot-image b))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-002-counter-aggregate-propagates-only-affected-incompleteness
  "Pre: disjoint sources lose a cache event, an OK request and a first oversized flush respectively.
Post: flags propagate independently, including an empty incomplete flush distribution and exact unaffected rates."
  (let* ((config (m:crea-configurazione-istogramma :limite-campioni 1 :unita :tick :tick-al-secondo 7))
         (a (m:crea-metriche-serie 0 0 0 config)) (b (m:crea-metriche-serie 0 1 0 config))
         (c (m:crea-metriche-serie 0 2 0 config)))
    (m:registra-cache a :miss) (m:registra-cache a :miss)
    (m:registra-richiesta b 7) (m:registra-richiesta b 99)
    (m:registra-flush-wal c 7 2)
    (let* ((sources (vector (m:istantanea-metriche a 3) (m:istantanea-metriche b 3) (m:istantanea-metriche c 3)))
           (saved (map 'list #'counter-snapshot-image sources)) (sum (m:aggrega-metriche sources)))
      (check-metric-counts sum '((:richieste . 1) (:cache-miss . 1))
                           '(:richieste :cache-miss :wal-flush :wal-record))
      (is (equal '(7/3 :incomplete nil) (multiple-value-list (m:tasso-contatore sum :richieste))))
      (is (equal '(0 :ok t) (multiple-value-list (m:tasso-contatore sum :errori))))
      (is (equal '(0 :incomplete nil) (multiple-value-list (m:tasso-contatore sum :wal-record))))
      (is (equal '(nil nil :empty nil)
                 (multiple-value-list (m:percentile-latenza (m:istantanea-metriche-latenza-flush sum) 500))))
      (is (equalp saved (map 'list #'counter-snapshot-image sources))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-002-counter-aggregate-queues-sum-peaks-as-upper-bounds
  "Pre: distinct source peaks and lower currents, plus a singleton aggregation of their aggregate.
Post: summed peaks explicitly remain upper bounds at every hierarchy level; singleton origin stays exact."
  (let ((a (m:crea-metriche-serie 0 0 0)) (b (m:crea-metriche-serie 0 1 0)))
    (dolist (sample '((:richieste 100) (:richieste 1) (:wal 7) (:wal 0)))
      (m:registra-coda a (first sample) (second sample)))
    (dolist (sample '((:richieste 80) (:richieste 2) (:wal 11) (:wal 3)))
      (m:registra-coda b (first sample) (second sample)))
    (let* ((left (m:istantanea-metriche a 1)) (right (m:istantanea-metriche b 1))
           (one (m:aggrega-metriche (vector left))) (sum (m:aggrega-metriche (vector left right)))
           (nested (m:aggrega-metriche (vector sum))))
      (is (equal '(1 100 :exact) (multiple-value-list (m:stato-coda one :richieste))))
      (is (equal '(0 7 :exact) (multiple-value-list (m:stato-coda one :wal))))
      (dolist (snapshot (list sum nested))
        (is (equal '(3 180 :upper-bound) (multiple-value-list (m:stato-coda snapshot :richieste))))
        (is (equal '(3 18 :upper-bound) (multiple-value-list (m:stato-coda snapshot :wal))))
        (is (= 2 (m:numero-fonti-metriche snapshot)))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-002-counter-aggregate-unobserved-queues-skip-hidden-partial-overflow
  "Pre: two known maximum depths would overflow, but another source lacks that queue observation.
Post: unknown propagates without computing misleading partial sums, also through a prior aggregate."
  (dolist (kind '(:richieste :wal))
    (let ((a (m:crea-metriche-serie 0 0 0)) (b (m:crea-metriche-serie 0 1 0))
          (unknown (m:crea-metriche-serie 0 2 0)) (other (m:crea-metriche-serie 0 3 0))
          (opposite (if (eq kind :richieste) :wal :richieste)) (cap (1- (expt 2 60))))
      (m:registra-coda a kind cap) (m:registra-coda b kind cap) (m:registra-coda other kind 1)
      (dolist (metrics (list a b unknown other)) (m:registra-coda metrics opposite 0))
      (let* ((sources (vector (m:istantanea-metriche a 1) (m:istantanea-metriche b 1)
                              (m:istantanea-metriche unknown 1)))
             (saved (map 'list #'counter-snapshot-image sources))
             (sum (m:aggrega-metriche sources))
             (nested (m:aggrega-metriche (vector sum (m:istantanea-metriche other 1)))))
        (dolist (ordered (list (vector (svref sources 2) (svref sources 0) (svref sources 1))
                               (vector (svref sources 0) (svref sources 2) (svref sources 1))))
          (is (equalp (counter-snapshot-image sum) (counter-snapshot-image (m:aggrega-metriche ordered)))))
        (dolist (snapshot (list sum nested))
          (check-metric-counts snapshot nil)
          (is (equal '(nil nil :unobserved) (multiple-value-list (m:stato-coda snapshot kind))))
          (is (equal '(0 0 :upper-bound) (multiple-value-list (m:stato-coda snapshot opposite)))))
        (is (equalp saved (map 'list #'counter-snapshot-image sources)))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-002-counter-aggregate-identity-and-hierarchical-overlap
  "Pre: separately captured equal source identities and disjoint/overlapping aggregate trees.
Post: provenance uses the full original tuple, rejects overlap with raw members and is retained across hierarchy."
  (let* ((config (m:crea-configurazione-istogramma :massimo 32))
         (a (m:crea-metriche-serie 17 0 0 config)) (b (m:crea-metriche-serie 17 1 0 config))
         (c (m:crea-metriche-serie 18 0 0 config)) (duplicate (m:crea-metriche-serie 17 0 0 config)))
    (m:registra-richiesta a 1) (m:registra-richiesta b 7) (m:registra-richiesta c 9)
    (let* ((sa (m:istantanea-metriche a 1)) (sa-again (m:istantanea-metriche a 1))
           (sa-later-cut (m:istantanea-metriche a 2))
           (sb (m:istantanea-metriche b 1)) (sc (m:istantanea-metriche c 1))
           (sd (m:istantanea-metriche duplicate 1)) (same-serie (m:aggrega-metriche (vector sa sb)))
           (cross-serie (m:aggrega-metriche (vector sa sc)))
           (flat (m:aggrega-metriche (vector sa sb sc)))
           (nested (m:aggrega-metriche (vector same-serie sc)))
           (saved (mapcar #'counter-snapshot-image (list sa sb sc same-serie cross-serie))))
      (is (= 17 (m:istantanea-metriche-serie same-serie)))
      (is (null (m:istantanea-metriche-worker same-serie)))
      (is (null (m:istantanea-metriche-serie cross-serie)))
      (is (null (m:istantanea-metriche-worker cross-serie)))
      (is (= 2 (m:numero-fonti-metriche cross-serie)))
      (is (= 3 (m:numero-fonti-metriche nested)))
      (is (equalp (counter-snapshot-image flat) (counter-snapshot-image nested)))
      (let ((one (m:aggrega-metriche (vector sa))))
        (is (= 17 (m:istantanea-metriche-serie one))) (is (= 0 (m:istantanea-metriche-worker one)))
        (is (= 1 (m:numero-fonti-metriche one))))
      (dolist (sources (list (vector sa sa) (vector sa sa-again) (vector sa sa-later-cut) (vector sa sd)
                             (vector same-serie sa) (vector sb same-serie)
                             (vector same-serie cross-serie) (vector nested sc) (vector nested same-serie)))
        (signals invalid-argument (m:aggrega-metriche sources)))
      (is (equalp saved (mapcar #'counter-snapshot-image (list sa sb sc same-serie cross-serie)))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-002-counter-aggregate-rejects-window-and-configuration-mismatches
  "Pre: independently varied compatibility dimensions, including equal bin counts and equal unit scales.
Post: mismatched endpoints/precision/maximum/unit/scale/domain reject without source changes."
  (let* ((config (m:crea-configurazione-istogramma :massimo 32))
         (base (m:istantanea-metriche (m:crea-metriche-serie 0 0 10 config) 20)))
    (dolist (window '((11 20) (10 21)))
      (let* ((other (m:istantanea-metriche (m:crea-metriche-serie 0 1 (first window) config) (second window)))
             (saved (mapcar #'counter-snapshot-image (list base other))))
        (signals invalid-argument (m:aggrega-metriche (vector base other)))
        (is (equalp saved (mapcar #'counter-snapshot-image (list base other)))))))
  (dolist (arguments '(((:bit-precisione 4 :massimo 16) (:bit-precisione 5 :massimo 16))
                        ((:bit-precisione 4 :massimo 32) (:bit-precisione 4 :massimo 33))
                        ((:unita :tick :tick-al-secondo 1000000) (:unita :microsecondi))
                        ((:unita :tick :tick-al-secondo 7) (:unita :tick :tick-al-secondo 8))
                        ((:dominio :test-clock-a) (:dominio :test-clock-b))))
    (let* ((left-config (apply #'m:crea-configurazione-istogramma (first arguments)))
           (right-config (apply #'m:crea-configurazione-istogramma (second arguments)))
           (a (m:istantanea-metriche (m:crea-metriche-serie 0 0 0 left-config) 1))
           (b (m:istantanea-metriche (m:crea-metriche-serie 0 1 0 right-config) 1))
           (saved (mapcar #'counter-snapshot-image (list a b))))
      (is (= (m:configurazione-istogramma-celle left-config) (m:configurazione-istogramma-celle right-config)))
      (signals invalid-argument (m:aggrega-metriche (vector a b)))
      (signals invalid-argument (m:aggrega-metriche (vector b a)))
      (is (equalp saved (mapcar #'counter-snapshot-image (list a b)))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-002-counter-aggregate-input-validation-and-original-source-budget
  "Pre: invalid containers/elements plus exactly 4096 disjoint original sources in two aggregate branches.
Post: vector and provenance budgets are enforced even when the immediate vector has only two entries."
  (let* ((config (m:crea-configurazione-istogramma :bit-precisione 4 :massimo 0))
         (snapshot (m:istantanea-metriche (m:crea-metriche-serie 0 0 0 config) 1)))
    (dolist (bad (list nil 0 #() (list snapshot) (vector snapshot nil)
                       (vector (m:crea-metriche-serie 0 1 0 config))
                       (vector (m:istantanea-istogramma (m:crea-istogramma config)))
                       (make-array 1 :adjustable t :initial-element snapshot)
                       (make-array 4097 :initial-element snapshot)))
      (signals invalid-argument (m:aggrega-metriche bad)))
    (let ((sources (make-array 4096)))
      (dotimes (index 4096)
        (setf (svref sources index) (m:istantanea-metriche (m:crea-metriche-serie 0 index 0 config) 1)))
      (let* ((left (m:aggrega-metriche (subseq sources 0 2048)))
             (right (m:aggrega-metriche (subseq sources 2048)))
             (all (m:aggrega-metriche (vector left right)))
             (extra (m:istantanea-metriche (m:crea-metriche-serie 0 4096 0 config) 1))
             (saved (mapcar #'counter-snapshot-image (list left right all extra))))
        (is (= 4096 (m:numero-fonti-metriche all)))
        (check-metric-counts all nil)
        (signals arcdocdb.conditions:resource-exhausted (m:aggrega-metriche (vector all extra)))
        (signals arcdocdb.conditions:resource-exhausted (m:aggrega-metriche (vector extra all)))
        (is (equalp saved (mapcar #'counter-snapshot-image (list left right all extra))))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (m:metriche-serie (integer 1)) m:metriche-serie) seed-synthetic-metric-counters))
(defun seed-synthetic-metric-counters (metrics population)
  "Pre: fresh owner fixture with domain :TEST-SYNTHETIC-POPULATION and a valid positive count.
Post: every scalar is POPULATION, matching all-error requests, unit-byte appends and unit-record flushes.
Both histograms contain exactly POPULATION sevens. This cold synthetic ledger preserves every invariant;
it is arithmetic correctness evidence, never measured work, timing, allocation or throughput."
  (let* ((requests (m::metriche-serie-latenza-richieste metrics))
         (flushes (m::metriche-serie-latenza-flush metrics))
         (config (m::istogramma-latenze-configurazione requests)))
    (is (eq :test-synthetic-population (m:configurazione-istogramma-dominio config)))
    (is (eq sb-thread:*current-thread* (m::istogramma-latenze-owner requests)))
    (is (not m::*accesso-istogrammi*))
    (check-metric-counts (m:istantanea-metriche metrics (m::metriche-serie-inizio metrics)) nil)
    (is (<= population (m:configurazione-istogramma-limite-campioni config)))
    (seed-synthetic-population requests (list (list 7 population)))
    (seed-synthetic-population flushes (list (list 7 population)))
    ;; Uniform values avoid depending on the product's private counter-index assignments.
    (fill (m::metriche-serie-contatori metrics) population)
    (check-metric-counts (m:istantanea-metriche metrics (m::metriche-serie-inizio metrics))
                         (mapcar (lambda (key) (cons key population)) (counter-test-keys))))
  metrics)

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (m:metriche-serie (integer 1)) m:metriche-serie) seed-synthetic-single-counter-ledger))
(defun seed-synthetic-single-counter-ledger (metrics population)
  "Pre: cold owner fixture in :TEST-SYNTHETIC-POPULATION with exactly one accepted cache event or zero-byte append.
Post: scales that valid one-event ledger to POPULATION; both histograms remain legitimately empty.
No private index assignment is assumed and no flags are forged; synthetic counts are never measured throughput."
  (let* ((root (m::metriche-serie-latenza-richieste metrics))
         (counts (m::metriche-serie-contatori metrics)) (config (m::istogramma-latenze-configurazione root))
         (before (m:istantanea-metriche metrics (m::metriche-serie-inizio metrics))))
    (is (eq :test-synthetic-population (m:configurazione-istogramma-dominio config)))
    (is (eq sb-thread:*current-thread* (m::istogramma-latenze-owner root)))
    (is (not m::*accesso-istogrammi*))
    (is (m:metriche-complete-p before))
    (is (zerop (m:valore-contatore before :richieste)))
    (is (zerop (m:valore-contatore before :wal-flush)))
    (is (= 1 (reduce #'+ counts)))
    (is (<= population (m:configurazione-istogramma-limite-campioni config)))
    (dotimes (index (length counts))
      (is (<= 0 (aref counts index) 1))
      (setf (aref counts index) (* population (aref counts index)))))
  metrics)

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-002-counter-synthetic-cold-overflow-of-each-independent-scalar-family
  "Pre: synthetic cap-sized cache/append counts and a disjoint unit source, with empty request/flush populations.
Post: each scalar-only overflow independently rejects the whole aggregation; no histogram overflow can mask it."
  (dolist (event '((:hit :cache-hit) (:miss :cache-miss) (:espulsione :cache-espulsioni)
                    (:errore-verifica :cache-errori-verifica) (:append :wal-append)))
    (let* ((cap (1- (expt 2 60)))
           (config (m:crea-configurazione-istogramma :bit-precisione 4 :massimo 32 :dominio :test-synthetic-population))
           (large (m:crea-metriche-serie 0 0 0 config)) (one (m:crea-metriche-serie 0 1 0 config)))
      (dolist (metrics (list large one))
        (if (eq :append (first event)) (m:registra-append-wal metrics 0) (m:registra-cache metrics (first event))))
      (seed-synthetic-single-counter-ledger large cap)
      (let* ((a (m:istantanea-metriche large 1)) (b (m:istantanea-metriche one 1))
             (saved (mapcar #'counter-snapshot-image (list a b))))
        (check-metric-counts a (list (cons (second event) cap)))
        (check-metric-counts b (list (cons (second event) 1)))
        (signals arcdocdb.conditions:resource-exhausted (m:aggrega-metriche (vector a b)))
        (signals arcdocdb.conditions:resource-exhausted (m:aggrega-metriche (vector b a)))
        (is (equalp saved (mapcar #'counter-snapshot-image (list a b))))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-002-counter-synthetic-cold-sums-and-rates-at-full-integer-boundary
  "Pre: invariant-preserving synthetic event ledgers at cap-1, one and two, with scale cap.
Post: exact cap sum and bignum rational rate succeed; cap+1 aggregation fails atomically without a retained prefix."
  (let* ((cap (1- (expt 2 60)))
         (config (m:crea-configurazione-istogramma :bit-precisione 4 :massimo 32 :unita :tick
                                                  :tick-al-secondo cap :dominio :test-synthetic-population))
         (large (seed-synthetic-metric-counters (m:crea-metriche-serie 0 0 0 config) (1- cap)))
         (one (seed-synthetic-metric-counters (m:crea-metriche-serie 0 1 0 config) 1))
         (two (seed-synthetic-metric-counters (m:crea-metriche-serie 0 2 0 config) 2))
         (a (m:istantanea-metriche large 3)) (b (m:istantanea-metriche one 3))
         (c (m:istantanea-metriche two 3)) (saved (mapcar #'counter-snapshot-image (list a b c)))
         (sum (m:aggrega-metriche (vector a b))))
    (check-metric-counts sum (mapcar (lambda (key) (cons key cap)) (counter-test-keys)))
    (dolist (key (counter-test-keys))
      (is (equal (list (/ (* cap cap) 3) :ok t) (multiple-value-list (m:tasso-contatore sum key)))))
    (dolist (latency (list (m:istantanea-metriche-latenza-richieste sum) (m:istantanea-metriche-latenza-flush sum)))
      (is (equal '(7 7 :ok t) (multiple-value-list (m:percentile-latenza latency 999)))))
    (dolist (sources (list (vector a c) (vector c a) (vector sum c)))
      (signals arcdocdb.conditions:resource-exhausted (m:aggrega-metriche sources)))
    (is (equalp saved (mapcar #'counter-snapshot-image (list a b c))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-002-counter-cold-scalar-byte-and-group-overflow-with-small-histograms
  "Pre: two real bounded events with byte/group sums cap and one, but only two histogram samples.
Post: scalar overflow alone rejects the entire aggregation, independently of histogram population limits."
  (dolist (family '(:append :flush))
    (let ((a (m:crea-metriche-serie 0 0 0)) (b (m:crea-metriche-serie 0 1 0)) (cap (1- (expt 2 60))))
      (ecase family
        (:append (m:registra-append-wal a cap) (m:registra-append-wal b 1))
        (:flush (m:registra-flush-wal a 7 cap) (m:registra-flush-wal b 9 1)))
      (let* ((left (m:istantanea-metriche a 1)) (right (m:istantanea-metriche b 1))
             (saved (mapcar #'counter-snapshot-image (list left right))))
        (signals arcdocdb.conditions:resource-exhausted (m:aggrega-metriche (vector left right)))
        (signals arcdocdb.conditions:resource-exhausted (m:aggrega-metriche (vector right left)))
        (is (equalp saved (mapcar #'counter-snapshot-image (list left right))))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-002-counter-cold-queue-current-and-peak-overflow
  "Pre: known queues sum exactly to cap, then exceed it; a lowered current also isolates peak-only overflow.
Post: both queue kinds enforce the arithmetic bound and all source images remain immutable."
  (dolist (kind '(:richieste :wal))
    (dolist (peak-only '(nil t))
      (let* ((a (m:crea-metriche-serie 0 0 0)) (b (m:crea-metriche-serie 0 1 0))
             (c (m:crea-metriche-serie 0 2 0)) (cap (1- (expt 2 60))))
        (m:registra-coda a kind (1- cap)) (m:registra-coda b kind 1) (m:registra-coda c kind 1)
        (when peak-only (dolist (metrics (list a b c)) (m:registra-coda metrics kind 0)))
        (let* ((sa (m:istantanea-metriche a 1)) (sb (m:istantanea-metriche b 1))
               (sc (m:istantanea-metriche c 1)) (saved (mapcar #'counter-snapshot-image (list sa sb sc)))
               (sum (m:aggrega-metriche (vector sa sb))))
          (is (equal (list (if peak-only 0 cap) cap :upper-bound) (multiple-value-list (m:stato-coda sum kind))))
          (signals arcdocdb.conditions:resource-exhausted (m:aggrega-metriche (vector sa sb sc)))
          (signals arcdocdb.conditions:resource-exhausted (m:aggrega-metriche (vector sum sc)))
          (is (equalp saved (mapcar #'counter-snapshot-image (list sa sb sc)))))))))
