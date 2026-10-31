;;;; C4: bounded disk core, collision oracle, corruption boundaries and removal proofs.
(in-package #:arcdocdb.engine.tests)
(defun call-automatic-disk (thunk &key (size 4096) (frames 1))
  (with-root (root)
    (let ((directory (arcdocdb.io:apri-directory root)) (tree nil))
      (unwind-protect
           (progn (arcdocdb.io:esigi-esclusiva-directory directory)
             (setf tree (arcdocdb.index.disk:create-disk-index directory "autoindex-0000000000000001.tmp" 1
                          (archive-id) (series-id) 17 29 :page-size size :frames frames))
             (funcall thunk tree directory root))
        (when tree (arcdocdb.index.disk:close-disk-index tree)) (arcdocdb.io:chiudi directory)))))

(deftest test-REQ-IDX-013-disk-independent-randomized-model-and-cache-tail
  (call-automatic-disk
    (lambda (tree directory root)
      (declare (ignore directory root))
      (let ((expected (make-hash-table :test 'equalp)) (output (make-array 5 :element-type '(unsigned-byte 64))))
        (dotimes (step 1800)
          (let* ((id (mod (* step 47) 127)) (key (automatic-key id (if (oddp id) 16 25)))
                 (csn (1+ step)) (location (logior (ash 7 32) (* csn 64))) (kind (if (zerop (mod step 5)) 2 1)))
            (arcdocdb.index.disk:apply-disk-index tree kind key 0 (length key) csn location 120)
            (if (= kind 1) (setf (gethash key expected) (list csn location)) (remhash key expected))
            (when (zerop (mod step 11))
              (arcdocdb.index.disk:verify-disk-index tree)
              (dotimes (query 127)
                (let* ((key (automatic-key query (if (oddp query) 16 25))) (value (gethash key expected)))
                  (fill output 77)
                  (is (eq (if value :live :absent) (arcdocdb.index.disk:lookup-disk-index tree key 0 (length key) output)))
                  (if value (progn (is (= (first value) (aref output 0))) (is (= (second value) (aref output 1))))
                      (is (every (lambda (word) (= word 77)) output))))))))
        (is (= (hash-table-count expected) (arcdocdb.index.disk:disk-index-count tree)))))))

(deftest test-REQ-IDX-013-disk-full-digest-collision-u64-boundaries-and-copy
  (let ((original (symbol-function 'arcdocdb.hash64:xxh64)))
    (unwind-protect
         (progn
           (setf (symbol-function 'arcdocdb.hash64:xxh64)
                 (lambda (key start end high low) (declare (ignore key start end high low)) (values #xffffffff #xffffffff)))
           (call-automatic-disk
             (lambda (tree directory root)
               (declare (ignore root))
               (let ((keys (loop for id below 40 collect (automatic-key id 4096)))
                     (output (make-array 5 :element-type '(unsigned-byte 64))) (copy nil))
                 (loop for key in (reverse keys) for csn from 1 do
                   (arcdocdb.index.disk:apply-disk-index tree 1 key 0 4096 csn #xffffffffffffffff 4200))
                 (loop for key in keys for csn from 100 do
                   (arcdocdb.index.disk:apply-disk-index tree 1 key 0 4096 (+ #x8000000000000000 csn) #xffffffffffffffff 4200))
                 (arcdocdb.index.disk:verify-disk-index tree)
                 (unwind-protect
                      (progn
                        (setf copy (arcdocdb.index.disk:create-disk-index directory "autoindex-0000000000000002.tmp" 2
                                     (archive-id) (series-id) 17 29 :frames 1))
                        (arcdocdb.index.disk:copy-disk-index tree copy)
                        (dolist (key keys)
                          (is (eq :live (arcdocdb.index.disk:lookup-disk-index copy key 0 4096 output)))
                          (is (= #xffffffffffffffff (aref output 1))))
                        (loop for key in keys for csn from #xc000000000000000 do
                          (arcdocdb.index.disk:apply-disk-index tree 2 key 0 4096 csn #xffffffffffffffff 4200))
                        (arcdocdb.index.disk:verify-disk-index tree) (is (zerop (arcdocdb.index.disk:disk-index-root tree))))
                   (when copy (arcdocdb.index.disk:close-disk-index copy)))))))
      (setf (symbol-function 'arcdocdb.hash64:xxh64) original))))

(deftest test-REQ-IDX-013-disk-field-reference-and-fixed-work-bounds
  (call-automatic-disk
    (lambda (tree directory root)
      (declare (ignore directory root))
      (let ((key (automatic-key 1 128)) (header (bytes 128)))
        (arcdocdb.index.disk:apply-disk-index tree 1 key 0 128 1 #x100000080 200)
        (setf (arcdocdb.index.disk::disk-index-busy tree) t)
        (unwind-protect
             (progn
               (arcdocdb.index.disk::read-disk-node tree (arcdocdb.index.disk:disk-index-root tree) header 0)
               (dolist (field '((4 0 4) (4 129 4) (32 0 8) (44 0 4) (64 0 4) (64 65536 4)
                                (68 1 4) (68 4294967295 4) (72 0 8) (80 0 8) (120 1 4)))
                 (let ((copy (copy-seq header)))
                   (if (= (third field) 4) (arcdocdb.binary:scrivi-u32 copy (first field) (second field))
                       (arcdocdb.binary:scrivi-u64 copy (first field) (second field)))
                   (signals arcdocdb.conditions:corruption-detected (arcdocdb.index.disk::validate-disk-node-fields copy 0))))
               (dolist (field '(16 24 56))
                 (dolist (bad '(1 129 18446744073709551615))
                   (let ((copy (copy-seq header)))
                     (arcdocdb.binary:scrivi-u64 copy field bad)
                     (signals arcdocdb.conditions:corruption-detected
                       (arcdocdb.index.disk::validate-disk-node-links copy 0 (arcdocdb.index.disk:disk-index-root tree))))))
               (signals arcdocdb.conditions:resource-exhausted (arcdocdb.index.disk::disk-path-slot 128) :disk-index-path-budget)
               (setf (arcdocdb.index.disk::disk-index-used tree) (arcdocdb.index.disk:disk-index-batch-limit))
               (signals arcdocdb.conditions:resource-exhausted (arcdocdb.index.disk::allocate-disk-batch tree 8) :disk-index-batch-budget))
          (setf (arcdocdb.index.disk::disk-index-busy tree) nil (arcdocdb.index.disk::disk-index-used tree) 0))))))

(deftest test-REQ-IDX-013-disk-partial-append-faults-before-root-publication
  (call-automatic-disk
    (lambda (tree directory root)
      (declare (ignore directory root))
      (let ((original (symbol-function 'arcdocdb.io:append-esatto)) (cause (make-condition 'arcdocdb.conditions:io-fault
                         :reason :injected-partial :operation :write :transferred 3)) (seen nil))
        (unwind-protect
             (progn
               (setf (symbol-function 'arcdocdb.io:append-esatto) (lambda (&rest args) (declare (ignore args)) (error cause)))
               (handler-case (arcdocdb.index.disk:apply-disk-index tree 1 (automatic-key 1) 0 128 1 #x100000080 200)
                 (arcdocdb.conditions:io-fault (condition) (setf seen condition)))
               (is (eq seen cause)) (is (eq :faulted (arcdocdb.index.disk:disk-index-state tree)))
               (is (= 0 (arcdocdb.index.disk:disk-index-root tree))) (is (= 128 (arcdocdb.index.disk:disk-index-frontier tree))))
          (setf (symbol-function 'arcdocdb.io:append-esatto) original))))))

(deftest test-REQ-IDX-013-removal-rejects-canonical-foreign-replaced-symlink-and-used-proof
  (call-automatic-disk
    (lambda (tree directory root)
      (let ((input (arcdocdb.index.disk::disk-index-input tree)) (name (arcdocdb.index.disk:disk-index-name tree)))
        (dolist (bad '("0000000000000001.seg" "0000000000000001.seg.tmp" "CONTROL" "autoindex-000000000000000G.tmp"))
          (signals arcdocdb.conditions:invalid-argument (arcdocdb.io:prova-derivato-rimovibile directory input bad) :io-derived-removal-domain))
        (with-root (other)
          (let ((foreign (arcdocdb.io:apri-directory other)))
            (unwind-protect
                 (signals arcdocdb.conditions:io-fault (arcdocdb.io:prova-derivato-rimovibile foreign input name))
              (arcdocdb.io:chiudi foreign))))
        (let* ((proof (arcdocdb.io:prova-derivato-rimovibile directory input name))
               (path (merge-pathnames name root)) (moved (merge-pathnames "retired.tmp" root)))
          (sb-posix:rename (namestring path) (namestring moved))
          (with-open-file (out path :direction :output) (write-string "decoy" out))
          (signals arcdocdb.conditions:invalid-argument (arcdocdb.io:rimuovi-derivato proof) :io-open-relative-identity)
          (sb-posix:unlink (namestring path)) (sb-posix:symlink "retired.tmp" (namestring path))
          (signals arcdocdb.conditions:io-fault (arcdocdb.io:rimuovi-derivato proof))
          (sb-posix:unlink (namestring path)) (sb-posix:rename (namestring moved) (namestring path))
          (arcdocdb.io:rimuovi-derivato proof) (is (not (probe-file path)))
          (signals arcdocdb.conditions:invalid-argument (arcdocdb.io:rimuovi-derivato proof) :io-derived-proof-used))))))

(deftest test-REQ-IDX-013-removal-missing-callback-and-close-error-aggregation
  (let* ((backend (arcdocdb.io:make-backend #'identity #'identity #'identity #'identity #'identity #'identity
                    :directory-lock (lambda (fd) (declare (ignore fd)) 0)))
         (directory (arcdocdb.io::%make-file :directory backend 4096 4096)) (input (arcdocdb.io::%make-file :input backend 4096 4096)))
    (setf (arcdocdb.io::file-fd directory) 7 (arcdocdb.io::file-fd input) 8)
    (signals arcdocdb.conditions:unsupported-format
      (arcdocdb.io:prova-derivato-rimovibile directory input "autoindex-0000000000000001.tmp") :io-unlink-relative-unavailable))
  (let* ((attempted 0) (primary (make-condition 'arcdocdb.conditions:io-fault :reason :primary :operation :write))
         (backend (arcdocdb.io:make-backend #'identity #'identity #'identity #'identity #'identity
                    (lambda (fd) (declare (ignore fd)) (incf attempted)
                      (error 'arcdocdb.conditions:io-fault :reason :secondary :operation :close))))
         (input (arcdocdb.io::%make-file :input backend 4096 4096)) (append (arcdocdb.io::%make-file :append backend 4096 4096)))
    (setf (arcdocdb.io::file-fd input) 7 (arcdocdb.io::file-fd append) 8)
    (handler-case (progn (arcdocdb.index.disk::close-disk-files input append primary) (error "Expected aggregate."))
      (arcdocdb.index.disk::disk-cleanup-error (condition)
        (is (eq primary (arcdocdb.index.disk::disk-cleanup-primary condition))) (is (= 2 (length (arcdocdb.index.disk::disk-cleanup-errors condition))))))
    (is (= attempted 2))))

(deftest test-REQ-IDX-013-closed-capability-rejected-even-with-warm-cache
  (call-automatic-disk
    (lambda (tree directory root)
      (declare (ignore directory root))
      (let ((key (automatic-key 1)) (output (make-array 5 :element-type '(unsigned-byte 64))))
        (arcdocdb.index.disk:apply-disk-index tree 1 key 0 128 1 #x100000080 200)
        (is (eq :live (arcdocdb.index.disk:lookup-disk-index tree key 0 128 output)))
        (arcdocdb.io:chiudi (arcdocdb.index.disk::disk-index-input tree))
        (signals arcdocdb.conditions:io-fault (arcdocdb.index.disk:lookup-disk-index tree key 0 128 output))))))

(deftest test-REQ-IDX-013-disk-rejects-nonincreasing-PUT-and-DELETE-CSN
  (dolist (kind '(1 2))
    (call-automatic-disk
      (lambda (tree directory root)
        (declare (ignore directory root))
        (let ((key (automatic-key 1)))
          (arcdocdb.index.disk:apply-disk-index tree 1 key 0 128 9 #x100000080 200)
          (let ((frontier (arcdocdb.index.disk:disk-index-frontier tree)) (root (arcdocdb.index.disk:disk-index-root tree)))
            (signals arcdocdb.conditions:invariant-violation
              (arcdocdb.index.disk:apply-disk-index tree kind key 0 128 9 #x100000080 200) :disk-index-csn-order)
            (is (eq :faulted (arcdocdb.index.disk:disk-index-state tree)))
            (is (= frontier (arcdocdb.index.disk:disk-index-frontier tree))) (is (= root (arcdocdb.index.disk:disk-index-root tree)))))))))

(deftest test-REQ-IDX-013-removal-callback-errors-consume-proof-without-retry
  (dolist (result '(nil 1 -1 -2 :typed-error :syscall-error))
    (let* ((attempts 0)
           (backend (arcdocdb.io:make-backend #'identity #'identity #'identity #'identity #'identity (lambda (fd) (declare (ignore fd)) 0)
                      :directory-lock (lambda (fd) (declare (ignore fd)) 0)
                      :file-metadata (lambda (fd) (declare (ignore fd)) (values 7 11 128))
                      :entry-identity (lambda (fd name) (declare (ignore fd name)) (values 7 11))
                      :unlink-relative (lambda (fd name) (declare (ignore fd name)) (incf attempts)
                        (case result
                          (:typed-error (error 'arcdocdb.conditions:io-fault :reason :injected-unlink :operation :unlink-relative))
                          (:syscall-error (error 'sb-posix:syscall-error :errno sb-posix:eintr :name 'unlinkat))
                          (otherwise result)))))
           (directory (arcdocdb.io::%make-file :directory backend 4096 4096)) (input (arcdocdb.io::%make-file :input backend 4096 4096)))
      (setf (arcdocdb.io::file-fd directory) 7 (arcdocdb.io::file-fd input) 8)
      (let ((proof (arcdocdb.io:prova-derivato-rimovibile directory input "autoindex-0000000000000001.tmp")))
        (signals arcdocdb.conditions:io-fault (arcdocdb.io:rimuovi-derivato proof))
        (signals arcdocdb.conditions:invalid-argument (arcdocdb.io:rimuovi-derivato proof) :io-derived-proof-used)
        (is (= attempts 1))))))
