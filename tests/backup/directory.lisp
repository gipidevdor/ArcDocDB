(in-package #:arcdocdb.backup.tests)

;;; REQ: REQ-AFF-014 REQ-AFF-001 REQ-AFF-004
(deftest test-REQ-AFF-014-native-directory-publication-refuses-file-empty-directory-and-symlink
  (dolist (kind '(:absent :directory :file :symlink))
    (et::with-root (root)
      (let* ((parent (io:apri-directory root)) (stage nil) (target (merge-pathnames "target/" root)))
        (unwind-protect
             (progn
               (setf stage (io:crea-directory-temporanea parent "target.tmp"))
               (io:esigi-esclusiva-directory stage)
               (case kind
                 (:absent nil)
                 (:directory (ensure-directories-exist (merge-pathnames ".fixture" target)))
                 (:file (vt::write-fixture (pathname (string-right-trim "/" (namestring target))) #(1 2 3)))
                 (:symlink (sb-posix:symlink "target.tmp" (string-right-trim "/" (namestring target))))
                 (otherwise (error "Unknown fixture")))
               (let ((inode (unless (eq kind :absent)
                              (sb-posix:stat-ino (sb-posix:lstat (string-right-trim "/" (namestring target)))))))
                 (if (eq kind :absent)
                     (progn (io:pubblica-directory-temporanea parent stage "target.tmp" "target")
                            (io:durable-flush parent)
                            (is (null (probe-file (merge-pathnames "target.tmp/" root)))))
                     (progn
                       (signals arcdocdb.conditions:io-fault
                         (io:pubblica-directory-temporanea parent stage "target.tmp" "target"))
                       (is (= inode (sb-posix:stat-ino (sb-posix:lstat (string-right-trim "/" (namestring target))))))
                       (is (eq :faulted (io:stato-file parent)))
                       (is (probe-file (merge-pathnames "target.tmp/" root)))))))
          (when stage (io:chiudi stage)) (io:chiudi parent))))))

;;; REQ: REQ-AFF-014 REQ-AFF-004 REQ-AFF-008
(deftest test-REQ-AFF-014-injected-directory-FD-zero-alias-results-and-no-fallback
  (dolist (mode '(:valid :parent-fd :negative-fd :identity-alias :missing :entry-error))
    (let* ((closed nil) (calls 0) (cause (make-condition 'arcdocdb.conditions:io-fault :reason :fixture-entry :operation :read))
           (unused (lambda (&rest args) (declare (ignore args)) (error "Unexpected callback")))
           (backend (io:make-backend (lambda (path kind) (declare (ignore path kind)) 41)
                      unused unused unused unused (lambda (fd) (push fd closed) 0)
                      :rename-exclusive (lambda (&rest args) (declare (ignore args)) 0)
                      :directory-node (unless (eq mode :missing)
                        (lambda (fd leaf create-p) (is (= fd 41)) (is (string= leaf "stage.tmp")) (is create-p)
                          (incf calls) (case mode (:parent-fd 41) (:negative-fd -1) (otherwise 0))))
                      :directory-identity (lambda (fd) (values 1 (if (or (= fd 41) (eq mode :identity-alias)) 41 50)))
                      :directory-entry-identity (lambda (fd leaf) (declare (ignore fd leaf))
                                                  (when (eq mode :entry-error) (error cause)) (values 1 50))))
           (parent (io:apri-directory "/fixture-only/" :backend backend)))
      (unwind-protect
           (case mode
             (:valid (let ((child (io:crea-directory-temporanea parent "stage.tmp")))
                       (is (eq :directory (io:mode-file child))) (io:chiudi child)))
             (:missing (signals arcdocdb.conditions:unsupported-format
                         (io:crea-directory-temporanea parent "stage.tmp") :io-directory-node-unavailable))
             (:identity-alias (signals arcdocdb.conditions:invalid-argument
                                (io:crea-directory-temporanea parent "stage.tmp") :io-directory-alias))
             (:entry-error (handler-case (progn (io:crea-directory-temporanea parent "stage.tmp") (error "Missing failure"))
                             (arcdocdb.conditions:io-fault (observed) (is (eq cause observed)))))
             (otherwise (signals arcdocdb.conditions:invariant-violation
                          (io:crea-directory-temporanea parent "stage.tmp") :io-directory-node-result)))
        (io:chiudi parent))
      (is (= calls (if (eq mode :missing) 0 1)))
      (is (equal (if (member mode '(:valid :identity-alias :entry-error)) '(41 0) '(41)) closed)))))

;;; REQ: REQ-AFF-014 REQ-AFF-010 REQ-AFF-004 REQ-AFF-011
(deftest test-REQ-AFF-014-verified-session-borrows-and-keeps-directory-locked
  (et::with-root (root)
    (let* ((source (source-store root 2)) (directory (io:apri-directory source)) (before (vt::store-image source)))
      (unwind-protect
           (progn
             (is (null (apply #'arcdocdb.verify:call-with-verified-storage-m1 directory
                              (et::archive-id) (et::series-id)
                              (lambda (report borrowed) (is (eq directory borrowed)) (is (= 5 (getf report :max-csn))) nil)
                              (subseq (options) 0 6))))
             (is (eq :open (io:stato-file directory)))
             (refused (lambda () (backup source (merge-pathnames "backup/" root)))))
        (io:chiudi directory))
      (is (equalp before (vt::store-image source)))
      (is (eq :clean (getf (vt::inspect-store source) :status))))))
