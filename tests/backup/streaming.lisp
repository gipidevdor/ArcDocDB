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
