(require :asdf)
(load "tools/evidence-storage.lisp")
(defun literal-forms (path)
  (let ((*read-eval* nil) (*readtable* (copy-readtable nil)) (*package* (find-package :cl-user)) (eof (gensym "EOF")))
    (with-open-file (in path :external-format :utf-8)
      (loop for form = (read in nil eof) until (eq form eof) collect form))))
(defun git-blob (path)
  (string-trim '(#\Newline #\Return) (uiop:run-program (list "git" "hash-object" path) :output :string)))
(defun quoted-binding (name bindings)
  (let* ((binding (find name bindings :key (lambda (row) (symbol-name (first row))) :test #'string=))
         (form (second binding)))
    (assert (eq 'quote (first form))) (second form)))
(defun selected-files (directory mode)
  (let ((result nil))
    (labels ((walk (directory)
               (dolist (file (uiop:directory-files directory))
                 (when (and (not (string-equal "fasl" (or (pathname-type file) "")))
                            (or (eq mode :all) (member (pathname-type file) '("lisp" "log" "gz") :test #'string=)))
                   (push file result)))
               (dolist (sub (uiop:subdirectories directory))
                 (unless (find "fasl" (pathname-directory sub) :test #'equal) (walk sub)))))
      (walk directory)) result))
(let* ((base "spikes/out/cbor-item-read-20261015/")
       (helper (concatenate 'string base "collection/prepare-archive.lisp"))
       (helper-blob (git-blob helper)) (forms (literal-forms helper))
       (bindings (second (second forms)))
       (processes (quoted-binding "PROCESSES" bindings))
       (trees (quoted-binding "TREES" bindings))
       (observations nil) (files nil) (tree-counts nil)
       (sidecars '("closed-check-4001073788-87417-0.log"
                   "collection-observation-4001073784-87417-0.lisp"
                   "collection-observation-4001073794-87417-0.lisp"
                   "collection-observation-4001073799-87417-0.lisp"
                   "collection-observation-4001073799-87417-1.lisp"))
       (mutation-count 0) (self-stdout nil))
  (assert (equal helper-blob "2f2a6d84c2fe795b0f3435e85a52a43b49441ad0"))
  (assert (= 2 (length forms))) (assert (= 13 (length processes))) (assert (= 5 (length trees)))
  (assert (= 13 (length (remove-duplicates processes :test #'string= :key #'first))))
  (dolist (entry processes)
    (destructuring-bind (label marker) entry
      (let* ((marker-path (concatenate 'string base "collection/record-" marker ".txt"))
             (path (string-trim (list (code-char 10) (code-char 13)) (uiop:read-file-string marker-path)))
             (record (arcdocdb.evidence:read-evidence path :max-expanded-bytes 67108864))
             (before (getf record :source-blobs-before)) (after (getf record :source-blobs-after)))
        (assert (not (search "latest" path :test #'char-equal)))
        (assert (and (eql 1 (getf record :schema-version)) (eq :command-verification (getf record :kind))
                     (eq :ok (getf record :status)) (eql 0 (getf record :exit-code))
                     (eq :stable (getf record :source-consistency)) (equalp before after)
                     (= 931 (length before)) (integerp (getf record :finished-at-universal-time))))
        (push (list :label label :marker marker-path :report path :status (getf record :status)
                    :exit (getf record :exit-code) :source-count (length before)
                    :head (getf (getf record :environment) :commit)) observations)
        (setf files (append (selected-files (uiop:pathname-directory-pathname path) :all) files))
        (push (pathname marker-path) files)
        (when (string= marker "collector-self") (setf self-stdout (getf record :stdout))))))
  (dolist (entry (append (mapcar (lambda (entry) (list (first entry) (concatenate 'string base (second entry)) :all)) trees)
                        '(("integrated-spikes" "spikes/out/4001074204-check-12420-0/" :lisp-and-log)
                          ("snapshot-self-test" "spikes/out/4001073853-snapshot-self-test-90652-0/" :all)
                          ("reader-self-test" "spikes/out/4001073853-reader-self-test-90682-0/" :all))))
    (destructuring-bind (label path mode) entry
      (assert (probe-file path))
      (let ((selected (selected-files path mode)))
        (push (list :label label :path path :mode mode :selected-files (length selected)) tree-counts)
        (setf files (append selected files)))))
  (dolist (name sidecars)
    (assert (search name self-stdout))
    (let ((path (concatenate 'string base "collection/" name))) (assert (probe-file path)) (push (pathname path) files)))
  (dolist (copy '("baseline" "0" "1" "2" "3" "4" "5" "6" "7"))
    (dolist (relative '("test.log" "arcdocdb.asd" "tools/build.lisp" "tools/cbor-item-read-isolated-build.lisp"
                        "src/codec/cbor-item-read.lisp" "tests/codec/cbor-item-read-support.lisp"
                        "tests/codec/cbor-item-read.lisp" "tests/codec/cbor-item-read-threads.lisp"))
      (let ((path (concatenate 'string base "mutations/" copy "/" relative)))
        (assert (probe-file path)) (push (pathname path) files) (incf mutation-count))))
  (push (pathname (concatenate 'string base "mutations/report.lisp")) files)
  (assert (= 72 mutation-count))
  (dolist (relative '("review/" "precompile/"))
    (setf files (append (uiop:directory-files (concatenate 'string base relative)) files)))
  (dolist (relative '("freeze-sources.lisp" "freeze-sources-before-character-fix.lisp" "collection/collect.lisp"
                      "collection/append.lisp" "collection/collect-before-date-fix.lisp"
                      "collection/preflight-before-date-fix.lisp" "collection/preflight-archive.lisp"
                      "collection/read-collection.lisp" "collection/build-manifest.lisp"
                      "collection/prepare-archive.lisp" "collection/preserve-originals.lisp"))
    (push (pathname (concatenate 'string base relative)) files))
  (let ((largest-plain nil) (largest-gzip nil) (violations nil) (unique (remove-duplicates files :test #'equal)))
    (dolist (path unique)
      (let* ((size (arcdocdb.evidence:file-bytes path)) (gzip (string-equal "gz" (or (pathname-type path) "")))
             (current (if gzip largest-gzip largest-plain)))
        (when (> size (if gzip 8388608 1048576)) (push (list path size) violations))
        (when (or (null current) (> size (second current)))
          (if gzip (setf largest-gzip (list (namestring path) size))
              (setf largest-plain (list (namestring path) size))))))
    (assert (null violations))
    (assert (equal helper-blob (git-blob helper)))
    (write (list :schema-version 1 :kind :cbor-item-archive-selection-reading :status :ok
                 :helper-blob helper-blob :helper-forms 2 :helper-executed nil :builder-executed nil
                 :existing-processes (nreverse observations) :future-cli-process-count 1 :planned-process-count 14
                 :trees (nreverse tree-counts) :external-self-collector-sidecars 5
                 :selected-mutation-files-with-report (1+ mutation-count) :full-mirrors-selected nil
                 :observed-unique-current-source-files (length unique) :largest-plain largest-plain
                 :largest-gzip largest-gzip :current-file-budget-violations violations
                 :future-inputs-not-yet-measured '("final integration report and its directory" "final-integration-reading.md"
                                                 "archive-selection-reading.md" "results-draft.md.txt")
                 :limits '(:static-and-data-only :no-manifest-or-collection-execution
                           :current-file-budget-not-final-index-preflight :all-writers-freeze-required)) :pretty t)
    (terpri)))
