;;;; C4: independent current-value models and exact byte/CSN assertions through product APIs.
(in-package #:arcdocdb.engine.tests)

(defun compact-open (root &key create (version 2) observer (mode :resident) (records 16) (segments 16))
  (rotation-open root :create create :version version :observer observer :mode mode :records records :segments segments))
(defun compact-seed (engine)
  (dotimes (n 24) (is (= (1+ n) (e:scrivi-documento engine (key (mod n 3)) (value n)))))
  (is (= 25 (e:cancella-documento engine (key 1)))))
(defun compact-check (engine)
  (check-get engine 0 (value 21)) (check-get engine 1 nil) (check-get engine 2 (value 23)) (check-frontier engine 25))
(defun compact-control (engine)
  (e::leggi-control-motore engine))
(defun compact-data-files (root)
  (remove-if-not (lambda (path) (search ".seg" (file-namestring path))) (uiop:directory-files root)))

;;; REQ: REQ-CMP-001 REQ-CMP-007 REQ-CMP-009 REQ-IDX-013 REQ-MVC-006
(deftest test-REQ-CMP-001-production-values-space-and-reopen-all-index-modes-v1-v2
  (dolist (version '(1 2))
    (dolist (mode '(:legacy :resident :paged))
      (with-root (root)
        (with-engine (engine (compact-open root :create t :version version :mode mode))
          (rotation-force-paged engine mode) (compact-seed engine)
          (let ((registry (e::motore-registry engine)) (scope (e::motore-scope engine))
                (before (compact-data-files root)) (token (copy-seq (e::motore-source-token engine))))
            (let ((result (e:compatta-motore engine :force t)))
              (is (eq :compacted (getf result :status))) (is (= 3 (getf result :records)))
              (is (> (getf result :reclaimed-bytes) 2000)))
            (is (eq registry (e::motore-registry engine))) (is (eq scope (e::motore-scope engine)))
            (is (not (equalp token (e::motore-source-token engine))))
            (is (every (lambda (file) (null (probe-file file))) before))
            (is (= 2 (length (compact-data-files root))))
            (is (eq (e:modo-indice-motore engine) (if (eq mode :paged) :paged :resident)))
            (is (= 3 (length (e::motore-fds engine)))) (is (= 1 (length (e::motore-recovery-sets engine))))
            (is (null (e::motore-busy engine))) (compact-check engine)))
        (with-engine (engine (compact-open root :version version :mode mode))
          (compact-check engine)
          (is (zerop (arcdocdb.recovery.manifest:numero-segmenti-rimossi
                      (arcdocdb.control:manifest-control-recuperato (compact-control engine)))))
          (is (= 26 (e:scrivi-documento engine (key 1) (value 26)))))))))

;;; REQ: REQ-CMP-001 REQ-CMP-007 REQ-LIM-003
(deftest test-REQ-CMP-001-production-automatic-compaction-keeps-writing-with-bounded-files
  (dolist (version '(1 2))
    (with-root (root)
      (let ((expected (make-array 4 :initial-element nil)))
        (with-engine (engine (compact-open root :create t :version version :records 4 :segments 8))
          (dotimes (n 200)
            (let ((id (mod n 4)))
              (if (= (mod n 7) 6)
                  (progn (is (= (1+ n) (e:cancella-documento engine (key id)))) (setf (aref expected id) nil))
                  (progn (is (= (1+ n) (e:scrivi-documento engine (key id) (value (mod n 100)))))
                         (setf (aref expected id) (value (mod n 100)))))
              (dotimes (i 4) (check-get engine i (aref expected i)))
              (check-frontier engine (1+ n))
              (is (<= (length (compact-data-files root)) 8))))
          (is (> (getf (e:statistiche-compattazione-motore engine) :compactions) 3)))
        (with-engine (engine (compact-open root :version version :records 4 :segments 8))
          (dotimes (i 4) (check-get engine i (aref expected i))) (check-frontier engine 200))))))

;;; REQ: REQ-CMP-001 REQ-CMP-009 REQ-MVC-006
(deftest test-REQ-CMP-001-production-empty-and-all-deleted-preserve-CSN-without-resurrection
  (dolist (version '(1 2))
    (with-root (root)
      (with-engine (engine (compact-open root :create t :version version))
        (is (eq :compacted (getf (e:compatta-motore engine :force t) :status)))
        (check-frontier engine 0)
        (dotimes (n 6) (is (= (1+ n) (e:scrivi-documento engine (key n) (value n)))))
        (dotimes (n 6) (is (= (+ n 7) (e:cancella-documento engine (key n)))))
        (let ((result (e:compatta-motore engine :force t)))
          (is (= 1 (getf result :records))) (is (zerop (getf (e:statistiche-compattazione-motore engine) :live-records))))
        (dotimes (n 6) (check-get engine n nil)) (check-frontier engine 12))
      (with-engine (engine (compact-open root :version version))
        (dotimes (n 6) (check-get engine n nil)) (check-frontier engine 12)
        (is (= 13 (e:scrivi-documento engine (key 1) (value 13))))))))

;;; REQ: REQ-CMP-001 REQ-LIM-003 REQ-AFF-004
(deftest test-REQ-CMP-001-production-no-gain-skips-with-no-canonical-or-FD-changes
  (with-root (root)
    (with-engine (engine (compact-open root :create t :records 64))
      (dotimes (n 16) (e:scrivi-documento engine (key n) (bytes 350 n)))
      (let ((originals (images root)) (fds (length (e::motore-fds engine))) (sets (length (e::motore-recovery-sets engine))))
        (dotimes (n 5)
          (is (eq :skipped (getf (e:compatta-motore engine) :status)))
          (is (= fds (length (e::motore-fds engine)))) (is (= sets (length (e::motore-recovery-sets engine))))
          (is (null (e::motore-busy engine))) (check-frontier engine 16) (check-images root originals)))
      (signals arcdocdb.conditions:invalid-argument (e:compatta-motore engine :force :yes) :engine-compaction-force))))

;;; REQ: REQ-CMP-001 REQ-AFF-002 REQ-CMP-009
(deftest test-REQ-CMP-001-production-corrupt-output-refused-before-CONTROL
  (with-root (root)
    (let ((armed nil) (changed nil))
      (with-engine (engine (compact-open root :create t
                            :observer (lambda (engine phase) (declare (ignore engine))
                                        (when (and armed (eq phase :compaction-produced))
                                          (let ((file (find-if (lambda (p) (search ".seg.tmp" (file-namestring p)))
                                                               (uiop:directory-files root))))
                                            (is file)
                                            (with-open-file (stream file :direction :io :if-exists :overwrite :element-type '(unsigned-byte 8))
                                              (file-position stream 80) (let ((byte (read-byte stream)))
                                                (file-position stream 80) (write-byte (logxor byte 1) stream)))
                                            (setf changed t))) nil)))
        (compact-seed engine) (setf armed t)
        (let ((originals (images root)))
          (signals arcdocdb.conditions:corruption-detected (e:compatta-motore engine :force t))
          (is changed) (is (eq :faulted (e:stato-motore engine)))
          (is (null (e::motore-busy engine))) (check-images root originals)))
      (with-engine (engine (compact-open root)) (compact-check engine)))))

;;; REQ: REQ-CMP-001 REQ-CMP-007 REQ-AFF-004 REQ-MVC-006
(deftest test-REQ-CMP-001-production-declared-errors-recover-every-maintenance-phase
  (dolist (version '(1 2))
    (dolist (phase '(:compaction-planned :compaction-produced :compaction-verified :compaction-before-publish
                     :compaction-published :compaction-canonical-ready :compaction-relocated :compaction-reclaiming
                     :compaction-unlinked :compaction-reclaimed :compaction-before-prune :compaction-pruned))
      (with-root (root)
        (let ((armed nil) (fired nil) (cause (make-condition 'arcdocdb.conditions:io-fault :reason :compaction-fi :operation :test)))
          (with-engine (engine (compact-open root :create t :version version
                                :observer (lambda (engine step) (declare (ignore engine))
                                            (when (and armed (eq phase step)) (setf fired t) (error cause)) nil)))
            (compact-seed engine) (setf armed t)
            (handler-case (progn (e:compatta-motore engine :force t) (error "Missing FI"))
              (arcdocdb.conditions:io-fault (condition) (is (eq condition cause))))
            (is fired) (is (eq :faulted (e:stato-motore engine))) (is (null (e::motore-busy engine))))
          (with-engine (engine (compact-open root :version version))
            (compact-check engine) (is (= 26 (e:scrivi-documento engine (key 1) (value 26))))))))))

;;; REQ: REQ-CMP-001 REQ-CMP-007 REQ-AFF-004
(deftest test-REQ-CMP-001-production-nonlocal-exit-after-reclaim-keeps-ACKed-data
  (with-root (root)
    (let ((armed nil))
      (with-engine (engine (compact-open root :create t
                            :observer (lambda (engine step) (declare (ignore engine))
                                        (when (and armed (eq step :compaction-before-prune)) (throw :compact-exit :aborted)) nil)))
        (compact-seed engine) (setf armed t)
        (is (eq :aborted (catch :compact-exit (e:compatta-motore engine :force t))))
        (is (eq :faulted (e:stato-motore engine))) (is (null (e::motore-busy engine))))
      (with-engine (engine (compact-open root)) (compact-check engine)))))

;;; REQ: REQ-IDX-004 REQ-IDX-013 REQ-CMP-001
(deftest test-REQ-CMP-001-production-paged-relocation-stale-and-normal-CSN-guards
  (dolist (key-size '(16 128))
    (with-root (root)
      (with-engine (engine (compact-open root :create t))
        (let* ((name "autoindex-0000000000000070.tmp")
               (tree (arcdocdb.index.disk:create-disk-index (e::motore-directory engine) name 112 (archive-id) (series-id)
                       1 2 :page-size 4096 :frames 1 :memory-budget 2097152 :max-bytes 16777216))
               (key (bytes key-size 21)) (missing (bytes key-size 22))
               (expected (make-array 5 :element-type '(unsigned-byte 64)))
               (actual (make-array 5 :element-type '(unsigned-byte 64)))
               (old (logior (ash 1 32) 64)) (new (logior (ash 2 32) 128)))
          (unwind-protect
               (progn
                 (arcdocdb.index.disk:apply-disk-index tree 1 key 0 key-size 1 old 512)
                 (is (eq :live (arcdocdb.index.disk:lookup-disk-index tree key 0 key-size expected)))
                 (is (arcdocdb.index.disk:relocate-disk-index tree key 0 key-size expected new))
                 (is (eq :live (arcdocdb.index.disk:lookup-disk-index tree key 0 key-size actual)))
                 (is (= 1 (aref actual 0))) (is (= new (aref actual 1)))
                 (is (= 1 (arcdocdb.index.disk:disk-index-count tree)))
                 (let ((frontier (arcdocdb.index.disk:disk-index-frontier tree)))
                   (is (null (arcdocdb.index.disk:relocate-disk-index tree key 0 key-size expected old)))
                   (is (null (arcdocdb.index.disk:relocate-disk-index tree missing 0 key-size actual old)))
                   (is (arcdocdb.index.disk:relocate-disk-index tree key 0 key-size actual new))
                   (is (= frontier (arcdocdb.index.disk:disk-index-frontier tree))))
                 (arcdocdb.index.disk:verify-disk-index tree)
                 (signals arcdocdb.conditions:invariant-violation
                   (arcdocdb.index.disk:apply-disk-index tree 1 key 0 key-size 1 new 512) :disk-index-csn-order))
            (arcdocdb.index.disk:close-disk-index tree)))))))

;;; REQ: REQ-CMP-007 REQ-AFF-004
(deftest test-REQ-CMP-001-production-unlink-errors-before-and-after-kernel-effect
  (dolist (after '(nil t))
    (with-root (root)
      (let ((original (symbol-function 'arcdocdb.io:rimuovi-segmento))
            (cause (make-condition 'arcdocdb.conditions:io-fault :reason :unlink-fi :operation :test)))
        (with-engine (engine (compact-open root :create t))
          (compact-seed engine)
          (unwind-protect
               (progn
                 (setf (symbol-function 'arcdocdb.io:rimuovi-segmento)
                       (lambda (proof) (when after (funcall original proof)) (error cause)))
                 (handler-case (progn (e:compatta-motore engine :force t) (error "Missing unlink fault"))
                   (arcdocdb.conditions:io-fault (condition) (is (eq condition cause)))))
            (setf (symbol-function 'arcdocdb.io:rimuovi-segmento) original))
          (is (eq :faulted (e:stato-motore engine))) (is (null (e::motore-busy engine))))
        (with-engine (engine (compact-open root)) (compact-check engine))))))

;;; REQ: REQ-CMP-007 REQ-MVC-007 REQ-AFF-008
(deftest test-REQ-CMP-001-production-borrowed-reader-refuses-before-effects
  (with-root (root)
    (with-engine (engine (compact-open root :create t))
      (compact-seed engine)
      (let ((reader (arcdocdb.epochs:contesto-epoca (arcdocdb.runtime:epoche-runtime-archivio (e::motore-runtime engine)) 0))
            (originals (images root)))
        (is (arcdocdb.epochs:entra-epoca reader))
        (unwind-protect
             (progn
               (signals arcdocdb.conditions:resource-exhausted (e:compatta-motore engine :force t) :engine-compaction-borrowers)
               (is (eq :ready (e:stato-motore engine))) (is (null (e::motore-busy engine))) (check-images root originals))
          (arcdocdb.epochs:esci-epoca reader))
        (compact-check engine)))))

;;; REQ: REQ-CMP-007 REQ-MVC-007 REQ-AFF-008
(deftest test-REQ-CMP-001-production-held-snapshot-refuses-before-effects
  (with-root (root)
    (with-engine (engine (compact-open root :create t))
      (compact-seed engine)
      (let* ((context (arcdocdb.mvcc:crea-contesto-snapshot
                       (arcdocdb.runtime:snapshot-runtime-archivio (e::motore-runtime engine))))
             (generation (arcdocdb.mvcc:registra-snapshot context 10)) (originals (images root)))
        (unwind-protect
             (progn
               (signals arcdocdb.conditions:resource-exhausted (e:compatta-motore engine :force t) :engine-compaction-borrowers)
               (is (eq :ready (e:stato-motore engine))) (is (null (e::motore-busy engine))) (check-images root originals))
          (arcdocdb.mvcc:termina-snapshot context generation))
        (compact-check engine)))))

(defun compaction-child-main (arguments)
  (destructuring-bind (operation path format stage) arguments
    (let* ((split (search "--" stage)) (mode (intern (string-upcase (subseq stage 0 split)) :keyword))
           (phase (intern (string-upcase (subseq stage (+ split 2))) :keyword))
           (root (uiop:ensure-directory-pathname path)) (version (parse-integer format)) (armed nil))
      (with-engine (engine (compact-open root :create (string= operation "compact-crash") :version version :mode mode
                            :observer (lambda (engine step) (declare (ignore engine))
                                        (when (and armed (eq step phase)) (crash phase)) nil)))
        (rotation-force-paged engine mode)
        (cond ((string= operation "compact-crash")
               (compact-seed engine) (setf armed t)
               (e:compatta-motore engine :force t) (error "Missing compaction crash: ~A" stage))
              ((string= operation "compact-verify")
               (compact-check engine)
               (is (zerop (arcdocdb.recovery.manifest:numero-segmenti-rimossi
                            (arcdocdb.control:manifest-control-recuperato (compact-control engine)))))
               (is (= 26 (e:scrivi-documento engine (key 1) (value 26))))
               (check-get engine 1 (value 26)) (crash :post-compaction-ACK))
              ((string= operation "compact-final")
               (check-get engine 0 (value 21)) (check-get engine 1 (value 26)) (check-get engine 2 (value 23))
               (check-frontier engine 26))
              (t (error "Unknown compaction child mode"))))
      (format t "~&COMPACTION-VERIFIED v~D ~A ~A~%" version operation stage))))

;;; REQ: REQ-CMP-001 REQ-CMP-007 REQ-REC-001 REQ-MVC-006 REQ-AFF-018
(deftest test-REQ-CMP-001-production-real-SIGKILL-and-second-write-crash-v1-v2
  (dolist (version '(1 2))
    (dolist (mode '(:resident :paged))
      (dolist (phase '(:compaction-planned :compaction-produced :compaction-verified :compaction-before-publish
                       :compaction-published :compaction-canonical-ready :compaction-relocated
                       :compaction-unlinked :compaction-reclaimed :compaction-before-prune :compaction-pruned))
        (with-root (root)
          (let ((stage (string-downcase (format nil "~A--~A" mode phase))))
            (child root version "compact-crash" stage :signaled sb-posix:sigkill)
            (child root version "compact-verify" stage :signaled sb-posix:sigkill)
            (child root version "compact-final" stage :exited 0)))))))
