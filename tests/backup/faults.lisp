(in-package #:arcdocdb.backup.tests)

(defun native-fixture-backend (writer flush directory-flush close &optional rename (reader #'io::native-read))
  ;; Real native I/O behind the existing injectable interface; no product function is replaced.
  (io:make-backend #'io::native-open reader writer flush directory-flush close
    :identity #'io::native-identity :entry-identity #'io::native-entry-identity
    :rename #'io::native-replace :rename-exclusive (or rename #'io::native-rename-exclusive)
    :directory-entries #'io::native-directory-entries :open-relative #'io::native-open-relative
    :file-metadata #'io::native-file-metadata :create-relative #'io::native-create-relative
    :directory-lock #'io::native-directory-lock :directory-node #'io::native-directory-node
    :directory-identity #'io::native-directory-identity :directory-entry-identity #'io::native-directory-entry-identity))
(defun all-cleanup (condition)
  (let ((collected nil) (queue (list condition)))
    (loop repeat 32 while queue for current = (pop queue) do
      (when current
        (push current collected)
        (cond ((typep current 'bk:backup-error)
               (setf queue (append (list (bk:backup-primary current)) (bk:backup-cleanup current) queue)))
              ((typep current 'arcdocdb.verify:verification-error)
               (setf queue (append (list (arcdocdb.verify:verification-primary current))
                                   (arcdocdb.verify:verification-cleanup current) queue)))
              ((typep current 'arcdocdb.recovery.manifest:recovery-sources-cleanup-error)
               (push (arcdocdb.recovery.manifest:recovery-sources-cleanup current) queue))
              (t nil))))
    collected))

;;; REQ: REQ-AFF-014 REQ-AFF-001 REQ-AFF-004 REQ-AFF-013
(deftest test-REQ-AFF-014-injected-write-flush-rename-and-parent-flush-failures
  (dolist (mode '(:write :flush :rename :parent-flush :close))
    (et::with-root (root)
      (let* ((source (source-store root 2)) (copy (merge-pathnames "backup/" root))
             (before (vt::store-image source)) (phase nil) (seen nil)
             (cause (make-condition 'arcdocdb.conditions:io-fault :reason :fixture-backup-failure :operation :write))
             (backend (native-fixture-backend
                       (lambda (&rest args)
                         (when (eq mode :write) (setf seen t) (error cause))
                         (apply #'io::native-write args))
                       (lambda (fd)
                         (when (eq mode :flush) (setf seen t) (error cause)) (io::native-flush fd))
                       (lambda (fd)
                         (when (and (eq mode :parent-flush) (eq phase :directory-published))
                           (setf seen t) (error cause))
                         (io::native-directory-flush fd))
                       (lambda (fd)
                         (io::native-close fd)
                         (when (and (eq mode :close) (eq phase :file-flushed) (not seen))
                           (setf seen t) (error cause)) 0)
                       (lambda (&rest args)
                         (when (and (eq mode :rename) (eq phase :before-publication))
                           (setf seen t) (error cause))
                         (apply #'io::native-rename-exclusive args)))))
        (let ((failure (refused (lambda () (backup source copy :backend backend
                               :observer (lambda (event name) (declare (ignore name)) (setf phase event) nil))))))
          (is seen) (is (eq cause (root-cause failure)))
          (is (not (bk:backup-durable failure)))
          (is (eq (if (eq mode :parent-flush) t (if (eq mode :rename) :unknown nil))
                  (bk:backup-published failure))))
        (is (equalp before (vt::store-image source)))
        (if (eq mode :parent-flush)
            (is (eq :ok (getf (verify copy) :status)))
            (progn (is (null (probe-file copy))) (is (probe-file (merge-pathnames "backup.tmp/" root)))))))))

;;; REQ: REQ-AFF-014 REQ-AFF-004 REQ-AFF-013
(deftest test-REQ-AFF-014-primary-and-cleanup-errors-retained-without-retry
  (et::with-root (root)
    (let* ((source (source-store root 2)) (copy (merge-pathnames "backup/" root)) (armed nil) (cleanup-seen nil)
           (primary (make-condition 'arcdocdb.conditions:io-fault :reason :fixture-write :operation :write))
           (cleanup (make-condition 'arcdocdb.conditions:io-fault :reason :fixture-close :operation :close))
           (backend (native-fixture-backend
                     (lambda (&rest args) (declare (ignore args)) (setf armed t) (error primary))
                     #'io::native-flush #'io::native-directory-flush
                     (lambda (fd)
                       (io::native-close fd)
                       (when (and armed (not cleanup-seen)) (setf cleanup-seen t) (error cleanup)) 0))))
      (let ((failure (refused (lambda () (backup source copy :backend backend)))))
        (is (eq primary (root-cause failure)))
        (is (member cleanup (all-cleanup failure) :test #'eq))
        (is cleanup-seen))
      (is (null (probe-file copy)))
      ;; A later native open proves source lock/capabilities were released despite both errors.
      (is (= 5 (getf (vt::inspect-store source) :max-csn))))))

;;; REQ: REQ-AFF-014 REQ-AFF-001 REQ-AFF-004
(deftest test-REQ-AFF-014-target-created-before-publication-is-preserved
  (et::with-root (root)
    (let* ((source (source-store root 2)) (copy (merge-pathnames "backup/" root)))
      (let ((failure (refused (lambda () (backup source copy
                       :observer (lambda (phase name)
                                   (declare (ignore name))
                                   (when (eq phase :before-publication)
                                     (ensure-directories-exist (merge-pathnames "sentinel" copy))
                                     (vt::write-fixture (merge-pathnames "sentinel" copy) #(4 5 6))) nil))))))
        (is (eq :unknown (bk:backup-published failure))))
      (is (equalp #(4 5 6) (et::image (merge-pathnames "sentinel" copy))))
      (is (probe-file (merge-pathnames "backup.tmp/" root))))))

;;; REQ: REQ-AFF-014 REQ-AFF-004 REQ-AFF-013
(deftest test-REQ-AFF-014-injected-read-failure-preserves-source-and-releases-lock
  (et::with-root (root)
    (let* ((source (source-store root 2)) (copy (merge-pathnames "backup/" root)) (phase nil)
           (before (vt::store-image source))
           (cause (make-condition 'arcdocdb.conditions:io-fault :reason :fixture-read :operation :read))
           (backend (native-fixture-backend #'io::native-write #'io::native-flush #'io::native-directory-flush
                      #'io::native-close nil
                      (lambda (&rest args) (when (eq phase :copy-file) (error cause)) (apply #'io::native-read args)))))
      (let ((failure (refused (lambda () (backup source copy :backend backend
                                :observer (lambda (event name) (declare (ignore name)) (setf phase event) nil))))))
        (is (eq cause (root-cause failure))))
      (is (equalp before (vt::store-image source)))
      (is (null (probe-file copy)))
      (is (= 5 (getf (vt::inspect-store source) :max-csn))))))

;;; REQ: REQ-AFF-014 REQ-AFF-004 REQ-AFF-013
(deftest test-REQ-AFF-014-observer-names-private-and-invalid-return-rejected
  (et::with-root (root)
    (let* ((source (source-store root 2)) (copy (merge-pathnames "backup/" root))
           (other (merge-pathnames "other/" root)) (before (vt::store-image source)))
      (backup source copy :observer (lambda (phase name) (declare (ignore phase)) (when name (fill name #\X)) nil))
      (is (eq :identical (getf (compare-backup source copy) :status)))
      (refused (lambda () (backup source other :observer (lambda (phase name) (declare (ignore phase name)) :invalid)))
               :backup-observer-result)
      (is (null (probe-file other))) (is (null (probe-file (merge-pathnames "other.tmp/" root))))
      (is (equalp before (vt::store-image source))))))

;;; REQ: REQ-AFF-014 REQ-AFF-002 REQ-AFF-013
(deftest test-REQ-AFF-014-restore-checks-stored-CRC-against-corruption-after-verification
  (et::with-root (root)
    (let* ((source (source-store root 2)) (copy (merge-pathnames "backup/" root))
           (restored (merge-pathnames "restored/" root))
           (row (find :active (getf (vt::inspect-store source) :segments) :key (lambda (r) (getf r :state)))))
      (vt::append-fixture-byte (vt::segment-path source row))
      (backup source copy)
      (let ((original (vt::store-image source)) (injected nil))
        ;; FI models disk damage after the initial backup gate, without changing the committed prefix.
        ;; A valid canonical prefix alone must not approve bytes differing from the stored backup checksum.
        (refused (lambda () (restore copy restored
                   :observer (lambda (phase name)
                               (declare (ignore name))
                               (when (and (eq phase :backup-verified) (not injected))
                                 (setf injected t)
                                 (let ((file (vt::segment-path copy row)))
                                   (vt::damage-fixture file (1- (length (et::image file)))))) nil)))
                 :backup-file-crc)
        (is injected) (is (null (probe-file restored)))
        (is (equalp original (vt::store-image source)))))))
