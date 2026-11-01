(in-package #:arcdocdb.backup.tests)

(defun large-open (root &optional create)
  (e:apri-motore root (et::archive-id) (et::series-id) :create create :version 2 :index-policy :legacy
    :clock (lambda () 10) :max-file-bytes 65536 :max-record-bytes 16384 :max-records 16
    :max-segments 16 :index-capacity 32 :key-arena-bytes 4096))

;;; REQ: REQ-AFF-014 REQ-AFF-002 REQ-AFF-008
(deftest test-REQ-AFF-014-streaming-chunk-invariance-independent-file-CRC-and-large-record
  (et::with-root (root)
    (let* ((source (merge-pathnames "source/" root)) (copy (merge-pathnames "backup/" root))
           (restored (merge-pathnames "restored/" root)) (value (et::bytes 9000)))
      (dotimes (i (length value)) (setf (aref value i) (mod i 251)))
      (ensure-directories-exist (merge-pathnames ".fixture" source))
      (et::with-engine (engine (large-open source t))
        (is (= 1 (e:scrivi-documento engine (et::key 1) value))))
      (let ((before (vt::store-image source)))
        (backup source copy :max-file-bytes 65536 :buffer-bytes 4096)
        (verify copy :max-file-bytes 65536 :buffer-bytes 16384)
        (let* ((wire (et::image (merge-pathnames "backup.manifest" copy)))
               (manifest (bk::decode-manifest (test-job :bytes 65536) wire)))
          (is (some (lambda (row) (> (bk::entry-size row) 8192)) (bk::manifest-entries manifest)))
          (loop for row across (bk::manifest-entries manifest) do
            (let ((bytes (et::image (merge-pathnames (bk::entry-name row) copy))))
              (is (= (bk::entry-crc row) (reference-crc bytes 0 (length bytes)))))))
        (restore copy restored :max-file-bytes 65536 :buffer-bytes 8192)
        (is (equalp before (vt::store-image source))))
      (et::with-engine (engine (large-open restored))
        (let ((output (et::bytes 9000)))
          (multiple-value-bind (status length) (e:leggi-documento engine (et::key 1) output)
            (is (eq :found status)) (is (= 9000 length)) (is (equalp value output))))
        (is (= 2 (e:scrivi-documento engine (et::key 2) (et::value 2))))))))

(defun compare-fixture-images (root a b size)
  (let* ((left-path (merge-pathnames "left.bin" root)) (right-path (merge-pathnames "right.bin" root))
         (job (test-job :bytes 16384)) (left nil) (right nil))
    (vt::write-fixture left-path a) (vt::write-fixture right-path b)
    (unwind-protect
         (progn
           (setf left (io:apri-lettura left-path :max-transfer 4096)
                 right (io:apri-lettura right-path :max-transfer 4096))
           (fill (bk::job-left job) 19) (fill (bk::job-right job) 23)
           (bk::equal-file-bytes-p job left right size))
      (when right (io:chiudi right)) (when left (io:chiudi left)))))

;;; REQ: REQ-AFF-014 REQ-AFF-002 REQ-AFF-008
(deftest test-REQ-AFF-014-exact-comparison-word-chunk-edges-and-stale-suffix
  (et::with-root (root)
    (dolist (size '(0 1 31 32 33 4095 4096 4097 8192 8229))
      (let ((a (et::bytes size)))
        (dotimes (i size) (setf (aref a i) (mod i 251)))
        (is (compare-fixture-images root a (copy-seq a) size))
        (dolist (position (remove-duplicates (list 0 31 32 4095 4096 (max 0 (1- size)))))
          (when (< position size)
            (let ((b (copy-seq a)))
              (setf (aref b position) (logxor 1 (aref b position)))
              (is (not (compare-fixture-images root a b size))))))))))

;;; REQ: REQ-AFF-014 REQ-AFF-002 REQ-AFF-004
(deftest test-REQ-AFF-014-exact-comparison-short-left-or-right-rejected
  (et::with-root (root)
    (let ((full (et::bytes 8229)) (short (et::bytes 8228)))
      (signals arcdocdb.conditions:io-fault (compare-fixture-images root short full 8229))
      (signals arcdocdb.conditions:io-fault (compare-fixture-images root full short 8229)))))
