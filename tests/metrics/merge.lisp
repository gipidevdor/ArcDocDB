;;;; Independent raw-sample and population oracles for cold histogram aggregation.
;;; OWNER: each registered test owns its input vector, histograms and synthetic fixtures.
;;; SHARED: immutable snapshots only; no worker, clock, benchmark or source identity registry.
(in-package #:arcdocdb.metrics.tests)
(declaim (optimize (safety 3) (speed 2) (debug 3)))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (m:configurazione-istogramma vector &optional boolean) m:istantanea-latenze)
                merge-fixture))
(defun merge-fixture (config samples &optional saturated)
  "Pre: valid samples fit CONFIG's cap; SATURATED requires exactly that many samples.
Post: ordinary owner-captured snapshot; an optional rejected sample marks actual source loss."
  (let ((histogram (m:crea-istogramma config)))
    (loop for value across samples
          do (is (eq (if (> value (m:configurazione-istogramma-massimo config)) :above-range :recorded)
                     (m:registra-latenza histogram value))))
    (when saturated
      (is (eq :saturated (m:registra-latenza histogram m:+massima-latenza+))))
    (m:istantanea-istogramma histogram)))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (m:configurazione-istogramma vector) simple-vector) merge-reference-counts))
(defun merge-reference-counts (config samples)
  "Pre: raw retained samples. Post: independently counted bins, using only the cold dyadic oracle."
  (let* ((precision (m:configurazione-istogramma-bit-precisione config))
         (maximum (m:configurazione-istogramma-massimo config))
         (cells (+ 2 (reference-bucket maximum precision)))
         (counts (make-array cells :initial-element 0)))
    (loop for value across samples
          do (incf (aref counts (if (> value maximum) (1- cells) (reference-bucket value precision)))))
    counts))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (m:istantanea-latenze simple-vector) boolean) check-merge-populations))
(defun check-merge-populations (result sources)
  "Pre: merged result and its sources. Post: each cell, total, accepted maximum and saturation OR agree.
Cold sums are independent and may use arbitrary-precision arithmetic; no source quantile is averaged."
  (let* ((actual (m::istantanea-latenze-contatori result))
         (expected (make-array (length actual) :initial-element 0))
         (total 0) (maximum 0) (saturated nil))
    (loop for source across sources
          do (incf total (m:istantanea-latenze-campioni source))
             (setf maximum (max maximum (m:istantanea-latenze-massimo-osservato source))
                   saturated (or saturated (m:istantanea-latenze-saturata-p source)))
             (dotimes (index (length expected))
               (incf (aref expected index) (aref (m::istantanea-latenze-contatori source) index))))
    (check-population result)
    (is (equalp expected actual))
    (is (= total (m:istantanea-latenze-campioni result)))
    (is (= maximum (m:istantanea-latenze-massimo-osservato result)))
    (is (eq saturated (m:istantanea-latenze-saturata-p result))))
  t)

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (m:configurazione-istogramma m:configurazione-istogramma (integer 1)) boolean)
                check-merge-configuration))
(defun check-merge-configuration (actual source cap)
  "Pre: merge configuration, reference source and requested cap. Post: every configuration field agrees."
  (dolist (reader (list #'m:configurazione-istogramma-bit-precisione #'m:configurazione-istogramma-massimo
                        #'m:configurazione-istogramma-unita #'m:configurazione-istogramma-tick-al-secondo
                        #'m:configurazione-istogramma-dominio #'m:configurazione-istogramma-celle
                        #'m:configurazione-istogramma-byte-contatori))
    (is (eql (funcall reader actual) (funcall reader source))))
  (is (= cap (m:configurazione-istogramma-limite-campioni actual)))
  t)

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-merge-retains-units-scale-and-domain
  "Pre: each supported unit and an explicit nondefault domain. Post: merge preserves all metadata without conversion."
  (dolist (unit '(:nanosecondi :microsecondi :tick))
    (let* ((scale (case unit (:nanosecondi 1000000000) (:microsecondi 1000000) (:tick 7)
                   (otherwise (error 'invariant-violation :reason :metrics-test-unit))))
           (config (m:crea-configurazione-istogramma :bit-precisione 5 :massimo 259 :limite-campioni 2
                                                    :unita unit :tick-al-secondo scale :dominio :merge-test-clock))
           (sources (vector (merge-fixture config #(258)) (merge-fixture config #(260))))
           (result (m:unisci-istantanee-latenze sources :limite-campioni 3)))
      (check-merge-populations result sources)
      (check-merge-configuration (m:istantanea-latenze-configurazione result) config 3)
      (check-reference-percentile result #(258 260) 1 1 t))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-merge-raw-samples-and-independent-populations
  "Pre: p4..10, clipped ranges, uneven sources and overflow. Post: raw combined samples determine every bin/rank."
  (loop for precision from 4 to 10
        do (dolist (maximum '(0 256 259 60000000000))
             (let* ((config (m:crea-configurazione-istogramma :bit-precisione precision :massimo maximum))
                    (first #(0 0 1 7 31)) (second (make-array 19 :initial-element 5))
                    (third (vector maximum (1+ maximum) (+ maximum 17) 0))
                    (raw (concatenate 'vector first second third))
                    (sources (vector (merge-fixture config first) (merge-fixture config #())
                                     (merge-fixture config second) (merge-fixture config third)))
                    (result (m:unisci-istantanee-latenze sources :limite-campioni (length raw)))
                    (sorted (sort (copy-seq raw) #'<)))
               (check-merge-populations result sources)
               (check-merge-configuration (m:istantanea-latenze-configurazione result) config (length raw))
               (is (equalp (merge-reference-counts config raw) (m::istantanea-latenze-contatori result)))
               (is (not (m:istantanea-latenze-saturata-p result)))
               (dolist (fraction '((1 1) (1 28) (500 1000) (950 1000) (990 1000) (999 1000) (2 3)))
                 (check-reference-percentile result sorted (first fraction) (second fraction) t))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-merge-weighted-population-percentiles
  "Pre: one high sample and ninety-nine zeros. Post: aggregate ranks follow the population's actual weights."
  (let* ((config (m:crea-configurazione-istogramma :bit-precisione 4 :massimo 127))
         (sources (vector (merge-fixture config #(100))
                          (merge-fixture config (make-array 99 :initial-element 0))))
         (result (m:unisci-istantanee-latenze sources)))
    (check-merge-populations result sources)
    (dolist (numerator '(500 950 990))
      (is (equal '(0 0 :ok t) (multiple-value-list (m:percentile-latenza result numerator)))))
    (check-reference-percentile result (concatenate 'vector (make-array 99 :initial-element 0) #(100))
                                999 1000 t)))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-merge-singleton-and-empty-sources
  "Pre: one or several empty snapshots, then empty sources mixed with a populated singleton.
Post: empty windows are permitted, while even singleton results have fresh storage and the requested cap."
  (let* ((config (m:crea-configurazione-istogramma :massimo 0 :limite-campioni 7))
         (empty (merge-fixture config #())) (sample (merge-fixture config #(0 1))))
    (dolist (sources (list (vector empty) (vector empty empty empty)))
      (let ((result (m:unisci-istantanee-latenze sources :limite-campioni 1)))
        (check-merge-populations result sources)
        (check-merge-configuration (m:istantanea-latenze-configurazione result) config 1)
        (is (not (eq empty result)))
        (is (not (eq (m::istantanea-latenze-contatori empty) (m::istantanea-latenze-contatori result))))
        (is (zerop (m:istantanea-latenze-massimo-osservato result)))
        (is (equal '(nil nil :empty t) (multiple-value-list (m:percentile-latenza result 500))))))
    (dolist (sources (list (vector sample) (vector empty sample empty)))
      (let ((result (m:unisci-istantanee-latenze sources :limite-campioni 2)))
        (check-merge-populations result sources)
        (is (not (eq sample result)))
        (is (not (eq (m::istantanea-latenze-contatori sample) (m::istantanea-latenze-contatori result))))
        (check-reference-percentile result #(0 1) 1 1 t)))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-merge-4096-entries-and-multiset-duplicates
  "Pre: maximum input length containing the same snapshot repeatedly. Post: every occurrence contributes once."
  (let* ((config (m:crea-configurazione-istogramma :massimo 0 :limite-campioni 1))
         (snapshot (merge-fixture config #(0)))
         (sources (make-array 4096 :initial-element snapshot))
         (result (m:unisci-istantanee-latenze sources :limite-campioni 4096)))
    (check-merge-populations result sources)
    (is (= 4096 (m:istantanea-latenze-campioni result)))
    (is (= 4096 (aref (m::istantanea-latenze-contatori result) 0)))
    (is (not (m:istantanea-latenze-saturata-p result)))
    (is (= 1 (m:istantanea-latenze-campioni snapshot)))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-merge-mixed-caps-saturation-and-above-range
  "Pre: different source caps, actual loss, an empty source and a retained above-range sample.
Post: source loss is sticky in any position, the rejected maximum is excluded, and the requested cap is independent."
  (let* ((base (m:crea-configurazione-istogramma :bit-precisione 4 :massimo 256 :limite-campioni 2))
         (one (m:crea-configurazione-istogramma :bit-precisione 4 :massimo 256 :limite-campioni 1))
         (large (m:crea-configurazione-istogramma :bit-precisione 4 :massimo 256 :limite-campioni 100))
         (saturated (merge-fixture base #(0 257) t))
         (full (merge-fixture one #(7))) (empty (merge-fixture large #())))
    (dolist (sources (list (vector saturated full empty) (vector full saturated empty)
                           (vector empty full saturated)))
      (dolist (cap '(3 17))
        (let ((result (m:unisci-istantanee-latenze sources :limite-campioni cap)))
          (check-merge-populations result sources)
          (check-merge-configuration (m:istantanea-latenze-configurazione result) base cap)
          (is (= 257 (m:istantanea-latenze-massimo-osservato result)))
          (is (m:istantanea-latenze-saturata-p result))
          (dolist (fraction '((1 3) (500 1000) (950 1000) (990 1000) (999 1000)))
            (check-reference-percentile result #(0 7 257) (first fraction) (second fraction) nil)))))
    ;; Reaching the result cap without source loss must not manufacture saturation.
    (let* ((sources (vector (merge-fixture base #(0 257)) full empty))
           (result (m:unisci-istantanee-latenze sources :limite-campioni 3)))
      (check-merge-populations result sources)
      (is (not (m:istantanea-latenze-saturata-p result)))
      (check-reference-percentile result #(0 7 257) 1 1 t))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-merge-order-and-nested-aggregates
  "Pre: compatible independent sources with different caps. Post: grouping and permutation preserve all populations."
  (let* ((config (m:crea-configurazione-istogramma :bit-precisione 4 :massimo 258 :limite-campioni 3))
         (a (merge-fixture config #(0 258 259) t)) (b (merge-fixture config #(7)))
         (c (merge-fixture config #(257 300)))
         (sources (vector a b c)) (flat (m:unisci-istantanee-latenze sources))
         (partial (m:unisci-istantanee-latenze (vector a b) :limite-campioni 4)))
    (dolist (group (list (vector c b a) (vector partial c)))
      (let ((result (m:unisci-istantanee-latenze group :limite-campioni 6)))
        (check-merge-populations result group)
        (is (equalp (m::istantanea-latenze-contatori flat) (m::istantanea-latenze-contatori result)))
        (is (= 300 (m:istantanea-latenze-massimo-osservato result)))
        (is (m:istantanea-latenze-saturata-p result))
        (check-reference-percentile result #(0 7 257 258 259 300) 990 1000 nil)))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-merge-rejects-each-configuration-mismatch
  "Pre: one differing field at a time, including unit with equal tick scale. Post: typed configuration rejection.
The whole compatibility pass precedes capacity checks, including when the late incompatible source is empty."
  (let* ((arguments '(:bit-precisione 4 :massimo 258 :unita :tick :tick-al-secondo 1000000000
                     :dominio :merge-test-clock))
         (base (apply #'m:crea-configurazione-istogramma arguments))
         (first (merge-fixture base #(1))))
    (dolist (change '((:bit-precisione 5) (:massimo 259) (:unita :nanosecondi)
                      (:tick-al-secondo 7) (:dominio :another-merge-clock)))
      (let ((modified (copy-list arguments)))
        (setf (getf modified (first change)) (second change))
        (let* ((config (apply #'m:crea-configurazione-istogramma modified))
               (foreign (merge-fixture config #())))
          (when (eq (first change) :massimo)
            (is (= (m:configurazione-istogramma-celle base) (m:configurazione-istogramma-celle config))))
          (signals invalid-argument (m:unisci-istantanee-latenze (vector first foreign)) :metrics-merge-config)
          (signals invalid-argument (m:unisci-istantanee-latenze (vector foreign first)) :metrics-merge-config)
          (signals invalid-argument
                   (m:unisci-istantanee-latenze (vector first first foreign) :limite-campioni 1)
                   :metrics-merge-config)))))
  ;; Low exact cells have identical array lengths even with different precision.
  (let* ((left (m:crea-configurazione-istogramma :bit-precisione 4 :massimo 15))
         (right (m:crea-configurazione-istogramma :bit-precisione 5 :massimo 15)))
    (is (= (m:configurazione-istogramma-celle left) (m:configurazione-istogramma-celle right)))
    (signals invalid-argument
             (m:unisci-istantanee-latenze (vector (merge-fixture left #()) (merge-fixture right #())))
             :metrics-merge-config)))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-merge-invalid-vector-shapes-and-lengths
  "Pre: foreign, adjustable, displaced, specialized, empty and oversized vectors. Post: invalid-argument with reason."
  (let* ((snapshot (merge-fixture (m:crea-configurazione-istogramma :massimo 0) #()))
         (storage (vector snapshot snapshot)))
    (dolist (object (list nil t 7 snapshot (list snapshot) "x" #*1 #()
                          (make-array 1 :element-type '(unsigned-byte 64) :initial-element 0)
                          (make-array '(1 1) :initial-element snapshot)
                          (make-array 1 :adjustable t :initial-element snapshot)
                          (make-array 1 :fill-pointer 1 :initial-element snapshot)
                          (make-array 1 :displaced-to storage :displaced-index-offset 1)
                          (make-array 4097 :initial-element snapshot)))
      (signals invalid-argument (m:unisci-istantanee-latenze object) :metrics-merge-argument))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-merge-invalid-elements-and-sample-limits
  "Pre: malformed entries at first or later indices, and invalid requested caps. Post: rejection before output."
  (let* ((config (m:crea-configurazione-istogramma :massimo 0))
         (snapshot (merge-fixture config #())))
    (dolist (object (list nil t 7 #() config (m:crea-istogramma config)))
      (signals invalid-argument (m:unisci-istantanee-latenze (vector object)) :metrics-merge-snapshot)
      (signals invalid-argument (m:unisci-istantanee-latenze (vector snapshot object)) :metrics-merge-snapshot))
    (dolist (cap (list nil t -1 0 1.0 1d0 1/2 3/2 :cap "1" (expt 2 60) (expt 2 100)))
      (signals invalid-argument (m:unisci-istantanee-latenze (vector snapshot) :limite-campioni cap)
               :metrics-merge-argument))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-merge-excess-rejected-without-truncation-or-source-changes
  "Pre: small compatible complete populations. Post: totals above the requested cap fail without truncating sources."
  (let* ((config (m:crea-configurazione-istogramma :massimo 7 :limite-campioni 10))
         (first (merge-fixture config #(0 7 8))) (second (merge-fixture config #(1 2)))
         (sources (vector first second))
         (before (map 'vector (lambda (source) (copy-seq (m::istantanea-latenze-contatori source))) sources)))
    (dolist (cap '(1 2 3 4))
      (signals arcdocdb.conditions:resource-exhausted
               (m:unisci-istantanee-latenze sources :limite-campioni cap) :metrics-merge-sample-limit)
      (dotimes (index (length sources))
        (is (equalp (aref before index) (m::istantanea-latenze-contatori (aref sources index))))))
    (let ((result (m:unisci-istantanee-latenze sources :limite-campioni 5)))
      (check-merge-populations result sources)
      (is (not (m:istantanea-latenze-saturata-p result)))
      (check-reference-percentile result #(0 1 2 7 8) 1 1 t))))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(deftest REQ-OBS-001-merge-result-and-source-storage-independence
  "Pre: singleton and repeated merges of captured owner state. Post: every result owns counters across later resets."
  (let* ((config (m:crea-configurazione-istogramma :massimo 256))
         (histogram (m:crea-istogramma config)))
    (m:registra-latenza histogram 7)
    (m:registra-latenza histogram 257)
    (let* ((source (m:istantanea-istogramma histogram))
           (sources (vector source source))
           (singleton (m:unisci-istantanee-latenze (vector source)))
           (first (m:unisci-istantanee-latenze sources))
           (second (m:unisci-istantanee-latenze sources))
           (arrays (vector (m::istogramma-latenze-contatori histogram) (m::istantanea-latenze-contatori source)
                           (m::istantanea-latenze-contatori singleton) (m::istantanea-latenze-contatori first)
                           (m::istantanea-latenze-contatori second))))
      (dotimes (left (length arrays))
        (dotimes (right left) (is (not (eq (aref arrays left) (aref arrays right))))))
      (m:azzera-istogramma histogram)
      (m:registra-latenza histogram m:+massima-latenza+)
      (setf (aref sources 0) (m:istantanea-istogramma histogram))
      (is (= 2 (m:istantanea-latenze-campioni source)))
      (check-reference-percentile singleton #(7 257) 1 1 t)
      (dolist (result (list first second))
        (check-population result)
        (is (= 4 (m:istantanea-latenze-campioni result)))
        (check-reference-percentile result #(7 7 257 257) 1 1 t)))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(declaim (ftype (function (list &key (:cap (integer 1 #.m:+massimi-campioni+))) m:istantanea-latenze)
                merge-synthetic-fixture))
(defun merge-synthetic-fixture (entries &key (cap m:+massimi-campioni+))
  "Pre: valid explicit (value count) population. Post: legitimate owner-captured fixture near 2^60, never timing data."
  (let ((histogram (m:crea-istogramma
                    (m:crea-configurazione-istogramma :bit-precisione 4 :massimo 256 :limite-campioni cap
                                                     :dominio :test-synthetic-population))))
    (seed-synthetic-population histogram entries)
    (m:istantanea-istogramma histogram)))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-merge-near-2-to-60-same-cell-and-overflow
  "Pre: consistent cap-1 plus one synthetic populations, in a regular or overflow bin.
Post: exact full-cap sums succeed without saturation, counter wrap or rejected-maximum contamination."
  (let ((cap (1- (expt 2 60))))
    (dolist (value (list 7 m:+massima-latenza+))
      (let* ((a (merge-synthetic-fixture (list (list value (1- cap))) :cap (1- cap)))
             (b (merge-synthetic-fixture (list (list value 1)) :cap 1))
             (sources (vector a b)) (result (m:unisci-istantanee-latenze sources))
             (counts (m::istantanea-latenze-contatori result))
             (index (if (> value 256) (1- (length counts)) value)))
        (check-merge-populations result sources)
        (check-merge-configuration (m:istantanea-latenze-configurazione result)
                                   (m:istantanea-latenze-configurazione a) cap)
        (is (= cap (aref counts index)))
        (is (= cap (m:istantanea-latenze-campioni result)))
        (is (= value (m:istantanea-latenze-massimo-osservato result)))
        (is (not (m:istantanea-latenze-saturata-p result)))
        (is (equal (if (> value 256) (list 257 value :above-range t) '(7 7 :ok t))
                   (multiple-value-list (m:percentile-latenza result 999))))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-merge-near-2-to-60-mixed-populations-and-ranks
  "Pre: independently specified bins across two legitimate synthetic sources. Post: exact cumulative ranks at full cap."
  (let* ((cap (1- (expt 2 60))) (zeros (floor cap 2)) (sevens (- cap zeros 1))
         (a (merge-synthetic-fixture (list (list 0 zeros) (list 7 3))))
         (b (merge-synthetic-fixture (list (list 7 (- sevens 3)) (list m:+massima-latenza+ 1))))
         (sources (vector a b)) (result (m:unisci-istantanee-latenze sources :limite-campioni cap))
         (counts (m::istantanea-latenze-contatori result)))
    (check-merge-populations result sources)
    (is (= zeros (aref counts 0))) (is (= sevens (aref counts 7)))
    (is (= 1 (aref counts (1- (length counts)))))
    (dolist (fraction '((1 1000000) (1 2) (2 3) (950 1000) (990 1000) (999 1000) (1 1)))
      (let* ((rank (reference-rank cap (first fraction) (second fraction)))
             (expected (cond ((<= rank zeros) '(0 0 :ok t))
                             ((< rank cap) '(7 7 :ok t))
                             (t (list 257 m:+massima-latenza+ :above-range t)))))
        (is (equal expected (multiple-value-list
                             (m:percentile-latenza result (first fraction) (second fraction)))))))))

;;; REQ: REQ-OBS-001 REQ-OBS-002
(deftest REQ-OBS-001-merge-near-2-to-60-total-overflow-rejection
  "Pre: legitimate synthetic sources whose total exceeds the global or requested cap by one.
Post: typed resource-exhausted before addition; neither same-cell nor disjoint-cell populations are truncated."
  (let* ((cap (1- (expt 2 60)))
         (almost (merge-synthetic-fixture (list (list 7 (1- cap)))))
         (one (merge-synthetic-fixture '((7 1))))
         (two (merge-synthetic-fixture '((0 2))))
         (full (merge-synthetic-fixture (list (list m:+massima-latenza+ cap)))))
    (dolist (sources (list (vector almost one one) (vector almost two) (vector full one)
                           (vector full full)))
      (signals arcdocdb.conditions:resource-exhausted
               (m:unisci-istantanee-latenze sources) :metrics-merge-sample-limit)
      (loop for source across sources do (check-population source)))
    (signals arcdocdb.conditions:resource-exhausted
             (m:unisci-istantanee-latenze (vector almost one) :limite-campioni (1- cap))
             :metrics-merge-sample-limit)
    (check-merge-populations (m:unisci-istantanee-latenze (vector almost one)) (vector almost one))))

;;; REQ: REQ-OBS-001 REQ-OBS-002 REQ-AFF-008
(deftest REQ-OBS-001-merge-inconsistent-private-populations-rejected
  "Pre: deliberately faulted private snapshots, separate from legitimate overflow fixtures.
Post: size mismatch, under/overcount, unsigned-64 excess and source-cap violations signal invariant-violation."
  (let* ((config (m:crea-configurazione-istogramma :massimo 7 :limite-campioni 1))
         (cells (m:configurazione-istogramma-celle config))
         (empty (make-array cells :element-type '(unsigned-byte 64) :initial-element 0))
         (extra (copy-seq empty)) (huge (copy-seq empty)))
    (setf (aref extra 0) 2 (aref huge 0) #xffffffffffffffff)
    (dolist (fault (list (m::%make-istantanea-latenze config (subseq empty 1) 0 nil 0)
                         (m::%make-istantanea-latenze config empty 1 nil 0)
                         (m::%make-istantanea-latenze config extra 1 nil 0)
                         (m::%make-istantanea-latenze config huge 1 nil 0)
                         (m::%make-istantanea-latenze config extra 2 nil 0)))
      (signals invariant-violation (m:unisci-istantanee-latenze (vector fault))
               :metrics-histogram-population))))
