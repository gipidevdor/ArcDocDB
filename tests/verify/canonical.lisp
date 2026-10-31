(in-package #:arcdocdb.verify.tests)

;;; REQ: REQ-AFF-010 REQ-AFF-004
(deftest test-REQ-AFF-010-report-lists-private-between-calls
  (et::with-root (root)
    (data-store root 2)
    (let ((first (inspect-store root)) (second (inspect-store root)))
      (dolist (key '(:coverage :limits))
        (is (equal (getf first key) (getf second key)))
        ;; Compare identity without mutating a possibly literal constant in the failing implementation.
        (loop for left on (getf first key) for right on (getf second key) do
          (is (not (eq left right))))))))

;;; REQ: REQ-AFF-010 REQ-MVC-006 REQ-CMP-001
(deftest test-REQ-AFF-010-terminal-tombstone-preserves-maximum
  (et::with-root (root)
    (et::with-engine (engine (et::open-engine root :create t))
      (is (= 1 (e:scrivi-documento engine (et::key 1) (et::value 1))))
      (is (= 2 (e:scrivi-documento engine (et::key 1) (et::value 2))))
      (is (= 3 (e:cancella-documento engine (et::key 1))))
      (e:compatta-motore engine :force t))
    (let ((before (store-image root)) (report (inspect-store root)))
      (is (eq :clean (getf report :status))) (is (= 3 (getf report :max-csn)))
      (is (= 1 (getf report :records))) (check-unchanged root before))))

;;; REQ: REQ-AFF-010 REQ-REC-004 REQ-AFF-011
(deftest test-REQ-AFF-010-clean-repeat-v1-v2-no-startup-effects
  (dolist (version '(1 2))
    (et::with-root (root)
      (data-store root version)
      (let* ((before (store-image root)) (first (inspect-store root)) (second (inspect-store root)))
        (is (eq :clean (getf first :status))) (is (equalp first second))
        (is (= version (getf first :version))) (is (= 3 (getf first :records) (getf first :max-csn)))
        (is (= 2 (length (getf first :segments)))) (check-unchanged root before))
      (et::with-engine (engine (et::open-engine root :version version))
        (is (= 4 (e:scrivi-documento engine (et::key 4) (et::value 4))))))))

;;; REQ: REQ-AFF-010 REQ-AFF-008 REQ-AFF-017
(deftest test-REQ-AFF-010-exact-segment-budget-without-recovery-headroom
  (et::with-root (root)
    (data-store root 2)
    (let ((before (store-image root)))
      (is (eq :clean (getf (v:verifica-storage-m1 root (et::archive-id) (et::series-id)
                            :max-file-bytes 8192 :max-segments 2 :max-records 32) :status)))
      (check-unchanged root before))))

;;; REQ: REQ-AFF-010 REQ-STO-003 REQ-CMP-001
(deftest test-REQ-AFF-010-rotation-and-compaction-v1-v2
  (dolist (version '(1 2))
    (et::with-root (root)
      (data-store root version 40)
      (let ((before (store-image root)) (report (inspect-store root)))
        (is (eq :clean (getf report :status))) (is (= 40 (getf report :records) (getf report :max-csn)))
        (is (> (length (getf report :segments)) 2)) (check-unchanged root before))
      (et::with-engine (engine (et::open-engine root :version version))
        (e:compatta-motore engine :force t))
      (let ((before (store-image root)) (report (inspect-store root)))
        (is (eq :clean (getf report :status))) (is (= 40 (getf report :max-csn)))
        (is (= 3 (getf report :records))) (check-unchanged root before)))))

;;; REQ: REQ-AFF-010 REQ-AFF-009 REQ-AFF-017
(deftest test-REQ-AFF-010-incomplete-tails-reported-not-truncated
  (dolist (target '(:active :closed :control :decisions))
    (et::with-root (root)
      (data-store root 2)
      (when (eq target :closed) (et::with-engine (engine (et::open-engine root)) (et::check-frontier engine 3)))
      (let* ((report (inspect-store root))
             (path (case target
                     (:control (merge-pathnames "control.log" root))
                     (:decisions (merge-pathnames "multiserie.log" root))
                     (otherwise (segment-path root
                                  (find-if (lambda (row) (and (eq target (getf row :state))
                                                            (> (getf row :valid-prefix) 64)))
                                           (getf report :segments)))))))
        (append-fixture-byte path)
        (let ((before (store-image root)) (observed (inspect-store root)))
          (is (eq :attention (getf observed :status))) (is (= 1 (getf observed :noncanonical-bytes)))
          (is (= 3 (getf observed :max-csn))) (check-unchanged root before))))))

;;; REQ: REQ-AFF-010 REQ-AFF-018
(deftest test-REQ-AFF-010-unpublished-and-unverified-files-never-clean
  (dolist (name '("00000000000000f0.seg.tmp" "index-derivative.idx" "control.log.tmp"))
    (et::with-root (root)
      (data-store root 2)
      (write-fixture (merge-pathnames name root) #(0 1 2 255))
      (let ((before (store-image root)) (report (inspect-store root)))
        (is (eq :attention (getf report :status))) (is (= 3 (getf report :max-csn)))
        (is (or (getf report :unverified-files) (getf report :inventory-actions)))
        (check-unchanged root before)))))
