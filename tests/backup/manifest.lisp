(in-package #:arcdocdb.backup.tests)

(defun reference-crc (buffer start end)
  ;; Independent bitwise Castagnoli oracle, not the product kernel or encoder.
  (let ((crc #xffffffff))
    (loop for i from start below end do
      (setf crc (logxor crc (aref buffer i)))
      (dotimes (bit 8) (setf crc (logxor (ash crc -1) (if (oddp crc) #x82f63b78 0)))))
    (logxor crc #xffffffff)))
(defun fixture-le (buffer offset count value)
  (dotimes (i count) (setf (aref buffer (+ offset i)) (ldb (byte 8 (* i 8)) value))))
(defun fixture-crcs (buffer)
  (fixture-le buffer 80 4 (reference-crc buffer 96 (length buffer)))
  (fixture-le buffer 84 4 (reference-crc buffer 0 84)) buffer)
(defun manifest-fixture ()
  (let ((buffer (et::bytes 288)))
    (loop for c across "ARCBKP01" for i from 0 do (setf (aref buffer i) (char-code c)))
    (fixture-le buffer 8 4 1) (fixture-le buffer 12 4 96)
    (fill buffer 73 :start 16 :end 32) (fill buffer 41 :start 32 :end 48)
    (fixture-le buffer 64 4 3) (setf (aref buffer 68) 2) (fixture-le buffer 72 8 192)
    (loop for name in '("0000000000000001.seg" "control.log" "multiserie.log") for offset from 96 by 64 do
      (setf (aref buffer offset) (length name))
      (fixture-le buffer (+ offset 8) 8 64) (fixture-le buffer (+ offset 16) 4 #x12345678)
      (fixture-le buffer (+ offset 24) 8 64)
      (loop for c across name for i from (+ offset 32) do (setf (aref buffer i) (char-code c))))
    (fixture-crcs buffer)))

;;; REQ: REQ-AFF-014 REQ-AFF-002
(deftest test-REQ-AFF-014-manifest-independent-wire-fixture-and-detachment
  (let* ((wire (manifest-fixture)) (job (test-job)) (manifest (bk::decode-manifest job wire)))
    (is (= 2 (bk::manifest-version manifest))) (is (= 0 (bk::manifest-records manifest) (bk::manifest-maximum manifest)))
    (is (not (bk::manifest-present manifest))) (is (= 3 (length (bk::manifest-entries manifest))))
    (is (= #x12345678 (bk::entry-crc (svref (bk::manifest-entries manifest) 0))))
    (is (equalp wire (bk::encode-manifest manifest)))
    (setf (aref (bk::manifest-archive manifest) 0) 1)
    (is (= 73 (aref wire 16) (aref (bk::job-archive job) 0)))))

;;; REQ: REQ-AFF-014 REQ-AFF-002 REQ-AFF-008
(deftest test-REQ-AFF-014-manifest-rejects-invalid-envelopes-rows-and-valid-crc-damage
  (dolist (length '(0 8 63 95 96 287))
    (signals arcdocdb.conditions:arcdocdb-error
      (bk::decode-manifest (test-job) (subseq (manifest-fixture) 0 length))))
  (let ((extra (et::bytes 289)))
    (replace extra (manifest-fixture))
    (signals arcdocdb.conditions:corruption-detected (bk::decode-manifest (test-job) extra)))
  (dolist (offset '(0 8 12 16 32 64 68 69 70 72 88 96 97 116 128 159))
    (let ((buffer (manifest-fixture)))
      (setf (aref buffer offset) (logxor 7 (aref buffer offset)))
      (fixture-crcs buffer)
      (signals arcdocdb.conditions:arcdocdb-error (bk::decode-manifest (test-job) buffer))))
  (let ((buffer (manifest-fixture)))
    (setf (aref buffer 140) (logxor 1 (aref buffer 140)))
    (signals arcdocdb.conditions:corruption-detected (bk::decode-manifest (test-job) buffer)))
  (dolist (change '((104 8 8193) (120 8 65) (48 8 513) (56 8 1)))
    (let ((buffer (manifest-fixture)))
      (apply #'fixture-le buffer change) (fixture-crcs buffer)
      (signals arcdocdb.conditions:arcdocdb-error (bk::decode-manifest (test-job) buffer))))
  (signals arcdocdb.conditions:resource-exhausted
    (bk::decode-manifest (test-job :total 1) (manifest-fixture)) :backup-total-budget))

;;; REQ: REQ-AFF-014 REQ-AFF-002
(deftest test-REQ-AFF-014-manifest-segment-alias-order-and-missing-log
  (dolist (names '(("0000000000000001.seg" "0000000000000001.seg.tmp" "control.log" "multiserie.log")
                   ("control.log" "0000000000000001.seg" "multiserie.log")
                   ("0000000000000001.seg" "0000000000000002.seg" "control.log")))
    (let* ((rows (map 'simple-vector (lambda (name) (bk::make-entry (map 'simple-base-string #'identity name) 64 64)) names))
           (manifest (bk::make-manifest (et::archive-id) (et::series-id) 2 0 0 nil rows)))
      (signals arcdocdb.conditions:corruption-detected
        (bk::decode-manifest (test-job) (fixture-crcs (bk::encode-manifest manifest)))))))
