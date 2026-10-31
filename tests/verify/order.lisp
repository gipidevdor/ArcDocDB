(in-package #:arcdocdb.verify.tests)

(defun duplicate-csn-bytes (header id version)
  "Valid individual batches/CRCs with a deliberately repeated ordinary CSN; encoder is fixture construction only."
  (let ((result (make-array 2048 :element-type '(unsigned-byte 8) :initial-element 0)) (offset 64))
    (replace result header :end1 64 :end2 64)
    (dotimes (i 2)
      (let ((batch (arcdocdb.wal:crea-lotto :segment id :version version :capacity 512 :max-records 8)))
        (arcdocdb.wal:aggiungi-record batch 1 (et::key i) (et::value i))
        (arcdocdb.wal:sigilla-lotto batch 1 offset (if (zerop i) 0 offset))
        (let ((used (arcdocdb.wal:lunghezza-lotto batch)))
          (replace result (arcdocdb.wal::lotto-buffer batch) :start1 offset :end1 (+ offset used) :end2 used)
          (incf offset used))))
    (subseq result 0 offset)))

;;; REQ: REQ-AFF-010 REQ-MVC-006 REQ-AFF-002
(deftest test-REQ-AFF-010-valid-crcs-do-not-hide-duplicate-csn
  (dolist (version '(1 2))
    (et::with-root (root)
      (data-store root version)
      (let* ((row (find :active (getf (inspect-store root) :segments) :key (lambda (r) (getf r :state))))
             (path (segment-path root row)) (header (et::image path)))
        (write-fixture path (duplicate-csn-bytes header (getf row :id) version))
        (refusal root :record-order (lambda () (inspect-store root)) :verify-csn-order)))))
