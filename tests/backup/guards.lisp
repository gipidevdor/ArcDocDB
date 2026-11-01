(in-package #:arcdocdb.backup.tests)

;;; REQ: REQ-AFF-014 REQ-AFF-008 REQ-AFF-011
(deftest test-REQ-AFF-014-held-lock-budgets-identity-and-overlap-before-effects
  (et::with-root (root)
    (let* ((source (source-store root 2)) (copy (merge-pathnames "backup/" root)) (before (vt::store-image source)))
      (signals arcdocdb.conditions:invalid-argument (backup source (merge-pathnames "inside/" source)) :backup-path-overlap)
      (signals arcdocdb.conditions:invalid-argument
        (backup (concatenate 'string (namestring source) "./") (merge-pathnames "inside/" source)) :backup-path-overlap)
      (dolist (option '((:max-file-bytes 0) (:max-segments 0) (:max-records 65537) (:buffer-bytes 0) (:max-total-bytes 0)))
        (signals arcdocdb.conditions:invalid-argument (apply #'backup source copy option) :backup-configuration))
      (refused (lambda () (backup source copy :max-total-bytes 1)) :backup-total-budget)
      (let ((wrong (et::series-id)))
        (setf (aref wrong 0) 0)
        (refused (lambda () (apply #'bk:crea-backup-m1 source copy (et::archive-id) wrong (options)))))
      (is (equalp before (vt::store-image source)))
      (et::with-engine (engine (et::open-engine source))
        (refused (lambda () (backup source copy)))
        (is (eq :ready (e:stato-motore engine))))
      (is (null (probe-file copy)))
      (is (null (probe-file (merge-pathnames "backup.tmp/" root)))))))

;;; REQ: REQ-AFF-014 REQ-AFF-001 REQ-AFF-004
(deftest test-REQ-AFF-014-existing-targets-and-stages-never-overwritten
  (dolist (kind '(:directory :file :symlink :stage))
    (et::with-root (root)
      (let* ((source (source-store root 2)) (copy (merge-pathnames "backup/" root))
             (existing (if (eq kind :stage) (merge-pathnames "backup.tmp/" root) copy))
             (before (vt::store-image source)))
        (case kind
          ((:directory :stage) (ensure-directories-exist (merge-pathnames "sentinel" existing))
                              (vt::write-fixture (merge-pathnames "sentinel" existing) #(9 8 7)))
          (:file (vt::write-fixture (pathname (string-right-trim "/" (namestring copy))) #(9 8 7)))
          (:symlink (sb-posix:symlink (namestring source) (string-right-trim "/" (namestring copy))))
          (otherwise (error "Unknown fixture")))
        (refused (lambda () (backup source copy)) (if (eq kind :stage) :backup-stage-exists :backup-target-exists))
        (is (equalp before (vt::store-image source)))
        (case kind
          ((:directory :stage) (is (equalp #(9 8 7) (et::image (merge-pathnames "sentinel" existing)))))
          (:file (is (equalp #(9 8 7) (et::image (pathname (string-right-trim "/" (namestring copy)))))))
          (:symlink (is (sb-posix:s-islnk (sb-posix:stat-mode (sb-posix:lstat (string-right-trim "/" (namestring copy)))))))
          (otherwise (error "Unknown fixture")))))))

;;; REQ: REQ-AFF-014 REQ-AFF-002 REQ-AFF-010
(deftest test-REQ-AFF-014-corrupt-missing-extra-and-tail-damage-reject-restore-before-stage
  (dolist (damage '(:manifest :missing :extra :committed :tail))
    (et::with-root (root)
      (let* ((source (source-store root 2)) (copy (merge-pathnames "backup/" root))
             (restored (merge-pathnames "restored/" root))
             (row (find :active (getf (vt::inspect-store source) :segments) :key (lambda (r) (getf r :state)))))
        (when (eq damage :tail) (vt::append-fixture-byte (vt::segment-path source row)))
        (backup source copy)
        (case damage
          (:manifest (vt::damage-fixture (merge-pathnames "backup.manifest" copy) 16))
          (:missing (delete-file (merge-pathnames "multiserie.log" copy)))
          (:extra (vt::write-fixture (merge-pathnames "unknown" copy) #(1)))
          (:committed (vt::damage-fixture (vt::segment-path copy row) 104))
          (:tail (let ((path (vt::segment-path copy row))) (vt::damage-fixture path (1- (length (et::image path))))))
          (otherwise (error "Unknown fixture")))
        (let ((before (vt::store-image copy)))
          (refused (lambda () (restore copy restored)))
          (is (equalp before (vt::store-image copy))))
        (is (null (probe-file restored)))
        (is (null (probe-file (merge-pathnames "restored.tmp/" root))))))))

;;; REQ: REQ-AFF-014 REQ-WAL-002 REQ-IDX-013
(deftest test-REQ-AFF-014-grouped-writes-from-paged-engine
  (dolist (version '(1 2))
    (et::with-root (root)
      (let* ((source (merge-pathnames "source/" root)) (copy (merge-pathnames "backup/" root))
             (restored (merge-pathnames "restored/" root)))
        (ensure-directories-exist (merge-pathnames ".fixture" source))
        (et::with-engine (engine (et::group-open source :create t :version version))
          (et::rotation-force-paged engine :paged)
          (et::group-run engine (vector (et::group-put 1 1) (et::group-put 2 2)
                                       (et::group-put 1 3) (et::group-delete 2)) 1))
        (let ((before (vt::store-image source)))
          (backup source copy)
          (is (eq :identical (getf (compare-backup source copy) :status)))
          (restore copy restored)
          (is (equalp before (vt::store-image source))))
        (et::with-engine (engine (et::group-open restored :version version))
          (et::check-get engine 1 (et::value 3)) (et::check-get engine 2 nil) (et::check-frontier engine 4))))))

;;; REQ: REQ-AFF-014 REQ-AFF-008
(deftest test-REQ-AFF-014-invalid-configuration-precedes-every-backend-call
  (let* ((calls 0) (unexpected (lambda (&rest args) (declare (ignore args)) (incf calls) (error "Unexpected I/O")))
         (backend (io:make-backend unexpected unexpected unexpected unexpected unexpected unexpected)))
    (dolist (parameters '((:max-file-bytes 4095) (:max-file-bytes 268435457) (:max-segments 65537)
                          (:max-records 0) (:buffer-bytes 8388609) (:max-total-bytes -1)))
      (signals arcdocdb.conditions:invalid-argument
        (apply #'bk:crea-backup-m1 "/fixture-a/" "/fixture-b/" (et::archive-id) (et::series-id)
               :backend backend parameters) :backup-configuration))
    (is (zerop calls))))
