(:SCHEMA-VERSION 1 :KIND :POOL-WORKER-LIFECYCLE-DEVELOPMENT :VERSION "2026-10-13" :PART 1 :PARTS 1
 :SOURCES
 ((:PATH
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-dev/compile-product-attempt-01.log")
   :BYTES 34 :SHA256 "eb822060ac360d7c70b61a584f855027df9eeb9db5711211cf65f6e89248b6f5" :GIT-BLOB
   "271966228e930825d0e6944d0151bd6a9ae217b4" :TEXT "Product compilation: strict PASS.
")
  (:PATH
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-dev/compile-product.lisp")
   :BYTES 379 :SHA256 "b1150d9e9cc147b15dbd1ecb28adee4c2986a6dae41de4778d47504901963e3d" :GIT-BLOB
   "3b720e06e49be956c30b0e0009f426bafcabfe66" :TEXT "(require :asdf)
(setf asdf:*compile-file-failure-behaviour* :error asdf:*compile-file-warnings-behaviour* :error)
(handler-bind ((warning (lambda (c) (unless (typep c 'sb-kernel:redefinition-warning) (error \"~A\" c)))))
  (asdf:load-asd (merge-pathnames \"arcdocdb.asd\" (truename \"./\")))
  (asdf:load-system \"arcdocdb\" :force t))
(format t \"~&Product compilation: strict PASS.~%\")
")
  (:PATH
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-dev/lint-attempt-01.log")
   :BYTES 57 :SHA256 "eb28954e60c060ee743dcd45bf9a688eda89308e3ff127fe27409fb4d745ca72" :GIT-BLOB
   "d43f9853c1e8caff28f9c3f5c832e72614332c48" :TEXT "sbcl --script tools/lint.lisp src
198 file, 0 violazioni
")
  (:PATH
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-dev/publication-selftest-attempt-01.log")
   :BYTES 79 :SHA256 "66ff73a1fcafeec694079af2f934ac8a9b75cc77cd2bcdf4e64b8e28e8d103d8" :GIT-BLOB
   "3e69aa3e2d89329d50dd7f929b8fb0bc6562be76" :TEXT
   "Dispatch publication adapter: valid component and five negative fixtures PASS.
")
  (:PATH
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-dev/publication-selftest.lisp")
   :BYTES 1437 :SHA256 "15957e1c40f7ba6d2270d38c7cc7bf78c7540d3523aefb469b39237bd9c37c06" :GIT-BLOB
   "8fba22708f2c4442aacdd4157aabd0d03679b2cb" :TEXT "(require :asdf)
(let ((*features* (cons :pool-worker-dispatch-publication-library *features*)))
  (load \"spikes/out/pool-dispatch-publication.lisp\"))
(let* ((paths '(\"src/dispatch/package.lisp\" \"src/dispatch/types.lisp\"
                \"src/dispatch/build.lisp\" \"src/dispatch/claim.lisp\"))
       (input #p\"spikes/out/pool-dispatch-publication.lisp\")
       (config (list :base \"14fd7738c216e3a0bd3ce9612576b9b57d648f74\"
                     :snapshot (namestring (truename \"./\")) :paths paths))
       (component (pool-worker-dispatch-component-manifest config input)))
  (unless (= 4 (length (getf component :qualified-source-inventory)))
    (error \"C4: inventory count mismatch.\"))
  (pool-worker-dispatch-validate-component component)
  (dolist (path paths)
    (let ((negative (copy-list config)))
      (setf (getf negative :paths) (remove path paths :test #'string=))
      (unless (handler-case (progn (pool-worker-dispatch-component-manifest negative input) nil)
                (error () t))
        (error \"C4: missing runtime source accepted: ~A.\" path))))
  (let ((bad (copy-tree component)))
    (setf (getf (first (getf bad :qualified-source-inventory)) :sha256) \"invalid\")
    (unless (handler-case (progn (pool-worker-dispatch-validate-component bad) nil) (error () t))
      (error \"C4: altered fingerprint accepted.\"))))
(format t \"~&Dispatch publication adapter: valid component and five negative fixtures PASS.~%\")
")
  (:PATH
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-dev/trace-attempt-01.log")
   :BYTES 99 :SHA256 "a62376a35971e4c49f41e51d4c5fe64eefcee38d66ce0b549205a7fd16983cbc" :GIT-BLOB
   "a629c9e912226fc08afcfbf9bd0d5ca633677789" :TEXT "sbcl --script tools/check-trace.lisp
118 requisiti, 65 invarianti, 13 scenari FI, 52 ADR: 0 errori
")
  (:PATH
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-integrated-attempt-01.log")
   :BYTES 146 :SHA256 "29952b1fabb7df740da6c96570aa6f13baf62423b86650cb75cfec243858550b" :GIT-BLOB
   "c3f4b3f9d434fd8b77bde3ae5293039d80ac7f1e" :TEXT
   ":OK: make test lint trace; record: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4000917560-command-66775-0/report.lisp
")
  (:PATH
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-measure/coverage-run.lisp")
   :BYTES 2804 :SHA256 "0fe33cd90ab88b486679dafac8c2bde0d135f26ccd57dbe7939bf9526ab65eb8" :GIT-BLOB
   "160c5c8373b24466e77a46aaae8ea6822d27ad91" :TEXT "(require :asdf)
(require :sb-cover)
(require :sb-posix)
(pushnew :dispatch-coverage-reader-library *features*)
;; Keep startup code-component marks across ASDF GC without modifying any observed bit.
(defmethod asdf:perform :after ((operation asdf:load-op) (component asdf:cl-source-file))
  (declare (ignore operation))
  (when (search \"/src/dispatch/\" (namestring (asdf:component-pathname component)))
    (sb-cover:save-coverage)))
(let* ((args (uiop:command-line-arguments)) (root (truename \"./\"))
       (directory (when (= 2 (length args))
                    (uiop:ensure-directory-pathname (merge-pathnames (second args) root)))))
  (unless (and directory (string= \"--report\" (first args)))
    (error \"COD-61 pool dispatch coverage: use --report fresh-directory/.\"))
  (ensure-directories-exist
   (merge-pathnames \"parent-placeholder\" (uiop:pathname-parent-directory-pathname directory)))
  (sb-posix:mkdir (namestring directory) #o700)
  (handler-bind ((warning (lambda (condition) (error condition)))
                 (style-warning (lambda (condition) (error condition))))
    (multiple-value-bind (fasl warnings failure)
        (compile-file \"spikes/out/pool-dispatch-measure/dispatch-coverage-reader.lisp\"
                      :output-file (merge-pathnames \"reader.fasl\" directory))
      (unless (and fasl (not warnings) (not failure)) (error \"COD-01: dispatch reader compile failure.\"))
      (load fasl)))
  (uiop:symbol-call \"ARCDOCDB.DISPATCH.COVERAGE.READER\" \"ADAPTER-SELF-TEST\")
  (asdf:initialize-output-translations
   `(:output-translations
     (,(merge-pathnames \"**/*.*\" root) ,(merge-pathnames \"fasl/**/*.*\" directory))
     :ignore-inherited-configuration))
  (proclaim '(optimize (sb-cover:store-coverage-data 3)))
  (setf asdf:*compile-file-failure-behaviour* :error asdf:*compile-file-warnings-behaviour* :error)
  (handler-bind ((warning (lambda (condition)
                           (unless (typep condition 'sb-kernel:redefinition-warning) (error condition)))))
    (asdf:load-asd (merge-pathnames \"arcdocdb.asd\" root))
    (asdf:load-system \"arcdocdb/tests\" :force t))
  (uiop:symbol-call \"ARCDOCDB.SCHEDULER.TESTS\" \"RUN\")
  (sb-cover:save-coverage-in-file (merge-pathnames \"coverage-state.lisp\" directory))
  (let ((html (sb-cover:report directory
                              :if-matches (lambda (path)
                                            (search \"/src/dispatch/\" path)))))
    (unless html (error \"COD-60: dispatch source data missing.\"))
    (uiop:symbol-call \"ARCDOCDB.DISPATCH.COVERAGE.READER\" \"AUDIT-DISPATCH-COVERAGE\"
                     (merge-pathnames \"coverage-state.lisp\" directory) html
                     (merge-pathnames \"coverage-audit.lisp\" directory)
                     (merge-pathnames \"coverage-dispatch-audit.lisp\" directory))))
")
  (:PATH
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-measure/dispatch-coverage-reader.lisp")
   :BYTES 8250 :SHA256 "6fd835634c9f7e5e4b76d45693bf0a79efe27d243ee0c3223dd41653a7b8cb14" :GIT-BLOB
   "9f67068cb72664b311c24adfa4a74320a8d2faad" :TEXT
   ";;;; C4 adapter: library native/TD/count parser unchanged; whole four-file dispatch scope.
;;;; The legacy audit remains original; metadata-only dispatch audit retains identical counts/missing.
;;;; --self-test; runner calls AUDIT-DISPATCH-COVERAGE after the independent adapter selftest.
(eval-when (:compile-toplevel :load-toplevel :execute)
  (require :asdf)
  (unless (find-package \"ARCDOCDB.LIFECYCLE.COVERAGE.READER\")
    (let ((*features* (cons :lifecycle-coverage-reader-library *features*)))
      (load \"spikes/out/lifecycle-measure/lifecycle-coverage-reader.lisp\"))))
(defpackage #:arcdocdb.dispatch.coverage.reader (:use #:cl))
(in-package #:arcdocdb.dispatch.coverage.reader)
(declaim (optimize (safety 3) (debug 3)))
(defparameter +scope+ '(\"src/dispatch/package.lisp\" \"src/dispatch/types.lisp\"
                        \"src/dispatch/build.lisp\" \"src/dispatch/claim.lisp\"))

(defun dispatch-source-identity (path)
  \"All dispatch-directory files enter the inventory; unexpected modules cannot silently disappear.\"
  (arcdocdb.lifecycle.coverage.reader::reader-require (stringp path) \"dispatch source not a string\")
  (let ((start (if (uiop:string-prefix-p \"src/\" path) 0
                   (let ((position (search \"/src/\" path :from-end t)))
                     (when position (1+ position))))))
    (when start
      (let ((identity (subseq path start)))
        (when (uiop:string-prefix-p \"src/dispatch/\" identity)
          identity)))))

(defun call-dispatch-reader (function)
  \"One-thread C4 adapter restores the library selector even on rejection; no native bit edits.\"
  (let ((original (symbol-function 'arcdocdb.lifecycle.coverage.reader::source-identity))
        (original-html (symbol-function 'arcdocdb.lifecycle.coverage.reader::html-count-rows))
        (arcdocdb.lifecycle.coverage.reader::+scope-files+ +scope+))
    (unwind-protect
         (progn (setf (symbol-function 'arcdocdb.lifecycle.coverage.reader::source-identity)
                      #'dispatch-source-identity
                      (symbol-function 'arcdocdb.lifecycle.coverage.reader::html-count-rows)
                      #'dispatch-html-count-rows)
                (funcall function))
      (setf (symbol-function 'arcdocdb.lifecycle.coverage.reader::source-identity) original
            (symbol-function 'arcdocdb.lifecycle.coverage.reader::html-count-rows) original-html))))


(defun dispatch-html-count-rows (html)
  \"Namespace-only adapter: unchanged native/TD/count parser, original dispatch heading/identities.\"
  (let ((cursor 0) (directory nil) (rows nil) (seen (make-hash-table :test 'equal)))
    (loop for start = (search \"<tr\" html :start2 cursor) while start
          do (let ((close (search \"</tr>\" html :start2 start)))
               (arcdocdb.lifecycle.coverage.reader::reader-require close \"HTML TR delimiter missing\")
               (let ((row (subseq html start (+ close 5))))
                 (cond
                   ((search \"class='subheading'\" row)
                    (let* ((cells (arcdocdb.lifecycle.coverage.reader::html-cells row))
                           (identity (and (= 1 (length cells)) (dispatch-source-identity (first cells)))))
                      (setf directory (when (equal identity \"src/dispatch/\") identity))))
                   ((and directory (or (search \"class='odd'\" row) (search \"class='even'\" row)))
                    (let* ((counts (arcdocdb.lifecycle.coverage.reader::html-data-counts row directory))
                           (identity (first counts)))
                      (arcdocdb.lifecycle.coverage.reader::reader-require
                       (not (gethash identity seen)) \"duplicate HTML source identity\")
                      (setf (gethash identity seen) t)
                      (push counts rows)))
                   (t nil)))
               (setf cursor (+ close 5))))
    (sort rows #'string< :key #'first)))

(defun adapter-self-test ()
  \"Original library malformed input/gate tests plus independent dispatch inventory/path fixtures.\"
  (arcdocdb.lifecycle.coverage.reader::coverage-reader-self-test)
  (call-dispatch-reader
   (lambda ()
     (let* ((native (list (list* \"/a/src/dispatch/package.lisp\" #((0)) #*1)
                          (list* \"/a/src/dispatch/types.lisp\" #((0) (1) (:then 2) (:else 2)) #*1010)
                          (list* \"/a/src/dispatch/build.lisp\" #((0)) #*1)
                          (list* \"/a/src/dispatch/claim.lisp\" #((0)) #*1)
                          (list* \"/a/src/scheduler/pool-claim.lisp\" #((0)) #*1)))
            (rows (arcdocdb.lifecycle.coverage.reader::scope-native-rows native))
            (counts (mapcar #'arcdocdb.lifecycle.coverage.reader::row-counts rows))
            (heading \"<tr class='subheading'><td colspan='7'>/a/src/dispatch/</td></tr>\")
            (html (concatenate 'string heading
                   \"<tr class='odd'><td><a href='b'>build.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='even'><td><a href='c'>claim.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='odd'><td><a href='p'>package.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='even'><td><a href='t'>types.lisp</a></td><td>1</td><td>2</td><td>50</td><td>1</td><td>2</td><td>50</td></tr>\")))
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal counts '((\"src/dispatch/build.lisp\" 1 1 0 0) (\"src/dispatch/claim.lisp\" 1 1 0 0)
                        (\"src/dispatch/package.lisp\" 1 1 0 0) (\"src/dispatch/types.lisp\" 1 2 1 2)))
        \"dispatch independent native count oracle\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal '(4 5 1 2) (arcdocdb.lifecycle.coverage.reader::count-total counts)) \"dispatch denominator oracle\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal counts (arcdocdb.lifecycle.coverage.reader::html-count-rows html)) \"dispatch exact HTML concordance\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal (getf (fourth rows) :missing)
               '((:native-index 1 :kind :expression :path (1))
                 (:native-index 3 :kind :branch :path (:else 2)))) \"dispatch missing paths oracle\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal (dispatch-source-identity \"/a/src/dispatch/unexpected.lisp\") \"src/dispatch/unexpected.lisp\")
        \"unexpected module silently excluded\")
       (arcdocdb.lifecycle.coverage.reader::expect-rejection
        (lambda () (arcdocdb.lifecycle.coverage.reader::scope-native-rows
                    (list (list* \"/a/src/dispatch/types.lisp\" #((0)) #*0)
                          (list* \"/b/src/dispatch/types.lisp\" #((0)) #*1)))))
       (arcdocdb.lifecycle.coverage.reader::expect-rejection
        (lambda () (arcdocdb.lifecycle.coverage.reader::html-count-rows (concatenate 'string html html)))))))
  :passed)

(defun audit-dispatch-coverage (native html library-output dispatch-output)
  \"All four dispatch files, gate95 without exclusions; preserve native/HTML and both audits.\"
  (adapter-self-test)
  (let ((report (call-dispatch-reader
                 (lambda () (arcdocdb.lifecycle.coverage.reader::audit-coverage native html library-output)))))
    (setf (getf report :kind) :pool-dispatch-coverage-audit
          (getf report :scope) :entire-new-dispatch-package
          (getf report :dispatch-total) (getf report :lifecycle-total)
          (getf report :library-report) (namestring library-output)
          (getf report :namespace-adapter) :dispatch-heading-with-unchanged-td-and-native-parser
          (getf report :scope-adapter-self-test) :passed)
    (with-open-file (stream dispatch-output :direction :output :if-exists :error :external-format :utf-8)
      (let ((*print-readably* t)) (write report :stream stream :pretty t) (terpri stream)))
    report))

(unless (member :dispatch-coverage-reader-library *features*)
  (unless (equal (uiop:command-line-arguments) '(\"--self-test\"))
    (error \"COD-61: dispatch coverage adapter use --self-test.\"))
  (adapter-self-test)
  (format t \"~&Dispatch coverage reader self-test PASS~%\"))
")
  (:PATH
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-measure/reader-run.lisp")
   :BYTES 733 :SHA256 "dfcf2a89ba0c760c81ab8b764f39c3820b552ad1ac2bc54e3dffad9db2ff7404" :GIT-BLOB
   "91b0f586f2011a3eff17b94d483bb74e5e80bfa5" :TEXT "(require :asdf)
(pushnew :dispatch-coverage-reader-library *features*)
(declaim (optimize (safety 3) (debug 3)))
(handler-bind ((warning (lambda (condition) (error condition)))
               (style-warning (lambda (condition) (error condition))))
  (multiple-value-bind (fasl warnings failure)
      (compile-file \"spikes/out/pool-dispatch-measure/dispatch-coverage-reader.lisp\"
                    :output-file \"spikes/out/pool-dispatch-measure/dispatch-coverage-reader.fasl\")
    (unless (and fasl (not warnings) (not failure)) (error \"COD-01: dispatch reader compile failure.\"))
    (load fasl)))
(uiop:symbol-call \"ARCDOCDB.DISPATCH.COVERAGE.READER\" \"ADAPTER-SELF-TEST\")
(format t \"~&Dispatch coverage reader self-test PASS~%\")
")
  (:PATH
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-measure/reader-selftest-dev-01.stderr")
   :BYTES 0 :SHA256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" :GIT-BLOB
   "e69de29bb2d1d6434b8b29ae775ad8c2e48c5391" :TEXT "")
  (:PATH
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-measure/reader-selftest-dev-01.stdout")
   :BYTES 40 :SHA256 "db5aa48c4888096c9ee4671504ea0d717f4cbba7b005007a92e13233bd4c9da9" :GIT-BLOB
   "f2658eef8970964e8d8994d3b24609f768845762" :TEXT "Dispatch coverage reader self-test PASS
")
  (:PATH
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-measure/tool-run.lisp")
   :BYTES 642 :SHA256 "758eb0c6a4b443ecdf3c4fc410886480f181394cba81b3b5f2607c73098a6099" :GIT-BLOB
   "c7147031150952f8ea72009f1f208d83852cd20b" :TEXT "(require :asdf)
(pushnew :arcdocdb-pool-dispatch-measure-library *features*)
(declaim (optimize (safety 3) (debug 3)))
(handler-bind ((warning (lambda (condition) (error condition)))
               (style-warning (lambda (condition) (error condition))))
  (multiple-value-bind (fasl warnings failure)
      (compile-file \"tools/measure-pool-dispatch.lisp\"
                    :output-file \"spikes/out/pool-dispatch-measure/measure-pool-dispatch.fasl\")
    (unless (and fasl (not warnings) (not failure))
      (error \"COD-01: tool pool-dispatch compile failure.\"))
    (load fasl)))
(uiop:symbol-call \"ARCDOCDB.POOL-DISPATCH.MEASURE\" \"MAIN\")
")
  (:PATH
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-measure/tool-selftest-dev-01.stderr")
   :BYTES 201 :SHA256 "208b545c664990fa8c4991d91f8166ca7f5a377eb401f23acf2dd73d08eda600" :GIT-BLOB
   "8ece25fd0dd8ee4717e82e1a2c64ad0cebc75332" :TEXT "; 
; compilation unit aborted
;   caught 2 fatal ERROR conditions
tools/measure-pool-dispatch.lisp: COD-01 tools/measure-pool-lifecycle.lisp: IGNORE declaration for a variable from outer scope: READY.
")
  (:PATH
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-measure/tool-selftest-dev-01.stdout")
   :BYTES 69515 :SHA256 "627232ab301c0cca72d07e8cc99b1340ecdee27d4faac683c665c59690934cbc"
   :GIT-BLOB "4fe0ab5b8b047ba8e5674aedefa796a562675fc7" :TEXT
   "(:SCHEMA-VERSION 1 :KIND :POOL-DISPATCH-BENCHMARK :STATUS :FAILED :STAGE
 :LOAD-PRODUCT :DIAGNOSTIC
 #A((100) BASE-CHAR
    . \"COD-01 tools/measure-pool-lifecycle.lisp: IGNORE declaration for a variable from outer scope: READY.\")
 :PROCESS-ARGV
 (#A((48) BASE-CHAR . \"/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl\")
  #A((11) BASE-CHAR . \"--self-test\"))
 :TOOL-ARGUMENTS (#A((11) BASE-CHAR . \"--self-test\"))
 :SOURCE-FINGERPRINTS-BEFORE
 ((:FILE \"arcdocdb.asd\" :MD5
   #A((32) BASE-CHAR . \"d942157b93d69b3852e784a9a838fcb9\"))
  (:FILE \"tools/measure-pool-lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"72a85a626ffb60185baf7602d28517e9\"))
  (:FILE \"src/active/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"bf244695c3c14a1a0148517b48052f5d\"))
  (:FILE \"src/active/preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"0ce41661b5cd26fe2edb944cca142f98\"))
  (:FILE \"src/active/prepare.lisp\" :MD5
   #A((32) BASE-CHAR . \"e3238a39b721a3a5ac1055bc1a30feba\"))
  (:FILE \"src/active/source.lisp\" :MD5
   #A((32) BASE-CHAR . \"50c6d9f4e4eb68c8018acb6a3fe70c8e\"))
  (:FILE \"src/active/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe47862290f99d6217361f4302e2faf2\"))
  (:FILE \"src/cache/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"5d70197c8b64ad6f20c8be47a60c73ca\"))
  (:FILE \"src/cache/clock.lisp\" :MD5
   #A((32) BASE-CHAR . \"3546cf7f5c5ed138068548c20064f499\"))
  (:FILE \"src/cache/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"72f3a33ce27ddf94c49c495580520004\"))
  (:FILE \"src/cache/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1f6a8e7aa4faed88e984b39871d1e53\"))
  (:FILE \"src/cache/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"82f937b7b08bd1696ad9c88da2e1c60c\"))
  (:FILE \"src/cache/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a25648d870eaa4f0b6e1e3b2cf76e28e\"))
  (:FILE \"src/cache/write.lisp\" :MD5
   #A((32) BASE-CHAR . \"fc09021f74fb50aac57589614dae04d7\"))
  (:FILE \"src/codec/cbor-float-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"bc7a7b176e8cdd361b7c4306a1a4de4b\"))
  (:FILE \"src/codec/cbor-float-narrow.lisp\" :MD5
   #A((32) BASE-CHAR . \"c15cc9d91355860357ed434e58d1f4cb\"))
  (:FILE \"src/codec/cbor-float-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"f3b22be81a36e1713c34e890c82c6700\"))
  (:FILE \"src/codec/cbor-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"6e8c6a49314c2f460aa6f8a1759200b6\"))
  (:FILE \"src/codec/cbor-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"ecd8fe950344059c629927b38fb6e4aa\"))
  (:FILE \"src/codec/cbor-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"2dee1a475a1c6edb13b60430fbc0668e\"))
  (:FILE \"src/codec/cbor-scan-input.lisp\" :MD5
   #A((32) BASE-CHAR . \"f6488e987889432b375254021825dbe5\"))
  (:FILE \"src/codec/cbor-scan-items.lisp\" :MD5
   #A((32) BASE-CHAR . \"706c0baa4158bf272c4b0df17c1439d2\"))
  (:FILE \"src/codec/cbor-scan-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"987e8ed576a21eb644ac1ef2e06edbda\"))
  (:FILE \"src/codec/cbor-scan-stack.lisp\" :MD5
   #A((32) BASE-CHAR . \"cf1999ddb10f879aeefbeea853742d57\"))
  (:FILE \"src/codec/cbor-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"0c33aedcdb352e78a3c694cf796e6692\"))
  (:FILE \"src/codec/cbor-simple-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"200373402e6e082dd8c7afde305302bb\"))
  (:FILE \"src/codec/cbor-space.lisp\" :MD5
   #A((32) BASE-CHAR . \"c33cdcc45f45218aa3e8bf26ce0ee575\"))
  (:FILE \"src/codec/cbor-string-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"b13e92b5f24a42fe283c17b649722b6a\"))
  (:FILE \"src/codec/cbor-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"69e77bcd15b5413a815a65c5081229db\"))
  (:FILE \"src/codec/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d885bd2a9860eb60aec1a775e5031d5e\"))
  (:FILE \"src/codec/utf8.lisp\" :MD5
   #A((32) BASE-CHAR . \"0f67dd5c51bf6a63bc292ab4e2a280c2\"))
  (:FILE \"src/control/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"8f3dc4a9657b6bb760e31c46c1e7b986\"))
  (:FILE \"src/control/dependency.lisp\" :MD5
   #A((32) BASE-CHAR . \"22ae34181e8ab96d8c8ecab050a1a19e\"))
  (:FILE \"src/control/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"3cedb51e60b92524cd8208e4bfb2c3ba\"))
  (:FILE \"src/control/preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"2dfc2b76c1d3c382db8b50071bdaeadf\"))
  (:FILE \"src/control/prepare.lisp\" :MD5
   #A((32) BASE-CHAR . \"9df8dc8a19d2a4bc700adfed763c27fa\"))
  (:FILE \"src/control/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"468fcf430eede17a38b922dfd373a746\"))
  (:FILE \"src/control/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d15317bafcdb12ea579b2f482dff57c\"))
  (:FILE \"src/csn/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1130012fc5613a5648d22ed8628be0e8\"))
  (:FILE \"src/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1cdb5661fc54beba5bf00e4765f3235\"))
  (:FILE \"src/dispatch/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"ba4cd961094f37a157d49b8d7024b677\"))
  (:FILE \"src/dispatch/claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"b10caeff4f726c0ebd01e2c6d1baacba\"))
  (:FILE \"src/dispatch/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"46e12ac1f6ab8591bac6467f724538a2\"))
  (:FILE \"src/dispatch/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"36db6694bc70963149b8068ae7ab96ec\"))
  (:FILE \"src/epochs/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"765d14c88cd288093a77a57930cd6999\"))
  (:FILE \"src/epochs/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"875201dfab0a84efd40fe9828cc293c8\"))
  (:FILE \"src/epochs/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"975b5f74e0c5a38ce978f4d9c7fcc6b8\"))
  (:FILE \"src/epochs/reclaim.lisp\" :MD5
   #A((32) BASE-CHAR . \"036dd02adf87d33c3ae2f40735c733fa\"))
  (:FILE \"src/epochs/retire.lisp\" :MD5
   #A((32) BASE-CHAR . \"653b974f310c09f6e2224a84acc43bbf\"))
  (:FILE \"src/epochs/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"82253491f995f5bc153fb5ebf30d564c\"))
  (:FILE \"src/execution/handoff.lisp\" :MD5
   #A((32) BASE-CHAR . \"6b85eebe69366e78ed5fc5cc20735f00\"))
  (:FILE \"src/execution/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb5710d6c111cadb7121a50998a747fa\"))
  (:FILE \"src/execution/queue.lisp\" :MD5
   #A((32) BASE-CHAR . \"8202843bddb817da4279ac959ae3f3c4\"))
  (:FILE \"src/execution/ready-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"38d26f8c749dd946dfc4b9c57103a892\"))
  (:FILE \"src/execution/ready-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a64d98c9ff429d6103d6e10ee1fd7980\"))
  (:FILE \"src/execution/ready.lisp\" :MD5
   #A((32) BASE-CHAR . \"2c1892002f0599bb8273093031017520\"))
  (:FILE \"src/execution/worker-boundary.lisp\" :MD5
   #A((32) BASE-CHAR . \"c24065d6c8d80d1be53994a0041743df\"))
  (:FILE \"src/execution/worker-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"babd0a78b4185af24ae1fef870c0fabb\"))
  (:FILE \"src/execution/worker-run.lisp\" :MD5
   #A((32) BASE-CHAR . \"aa34ca6bc07535e35fea723878d99f66\"))
  (:FILE \"src/execution/worker-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"0679ee07c46f69db330706303c70d8d2\"))
  (:FILE \"src/execution/writer.lisp\" :MD5
   #A((32) BASE-CHAR . \"73019644090e2971f2b54dc36e4491f5\"))
  (:FILE \"src/foundation/batch.lisp\" :MD5
   #A((32) BASE-CHAR . \"ca642ea47e4bff76f78f5b6d7287d6bd\"))
  (:FILE \"src/foundation/binary.lisp\" :MD5
   #A((32) BASE-CHAR . \"a06115175f450776762761dce25acdb8\"))
  (:FILE \"src/foundation/conditions.lisp\" :MD5
   #A((32) BASE-CHAR . \"942b596396c19815290a57830af2121b\"))
  (:FILE \"src/foundation/crc32c.lisp\" :MD5
   #A((32) BASE-CHAR . \"4db58e2f48bf77d751f1b83bb9f84b5c\"))
  (:FILE \"src/foundation/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"5ee593a112958d94163dab17c5aa4ba2\"))
  (:FILE \"src/foundation/record.lisp\" :MD5
   #A((32) BASE-CHAR . \"c3ed0f09fa3fa6fe20c98e2ed6e69abe\"))
  (:FILE \"src/get-directory/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"cde24b2bf5c5637d5501b95bed47df31\"))
  (:FILE \"src/get-directory/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a05062f6ab6d5ebdfdde37e336dfce6\"))
  (:FILE \"src/get-directory/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"74a694385f1aaf03ec87721545494119\"))
  (:FILE \"src/get-directory/sources-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"2b8193aab6801de19e26fa55e7c53f87\"))
  (:FILE \"src/get-directory/sources-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"7bac02a80ddc22c622f8465642385ae8\"))
  (:FILE \"src/get-directory/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"17c957d6934a31f4ed64313e756de2d2\"))
  (:FILE \"src/get-resolver/active-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"c65593cf172f53a8e90a853bbe9504c2\"))
  (:FILE \"src/get-resolver/active-directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"6d95f29b331d335175843f47ae44a6ea\"))
  (:FILE \"src/get-resolver/active-init.lisp\" :MD5
   #A((32) BASE-CHAR . \"7ca975d2534f43c8018d36ecd7c2b042\"))
  (:FILE \"src/get-resolver/active-preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"f13d422adb6aa9e8489352884137f25a\"))
  (:FILE \"src/get-resolver/active-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"521737861e057d663964b0c030552587\"))
  (:FILE \"src/get-resolver/active-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6aaec49504a96f37c8ff1bc182c977b\"))
  (:FILE \"src/get-resolver/active-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"60bb258cf4cc7f50c5c1206af1bb5800\"))
  (:FILE \"src/get-resolver/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"bbfb2082103e6712419e180ab972245c\"))
  (:FILE \"src/get-resolver/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"263525e8274a8f46ce58a4a0ad6841a2\"))
  (:FILE \"src/get-resolver/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"1339edff0223dbf122f11ff0adbba61c\"))
  (:FILE \"src/get-resolver/rows.lisp\" :MD5
   #A((32) BASE-CHAR . \"ca9002b81efd0aed9761cd1f78514762\"))
  (:FILE \"src/get-resolver/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"536e9dc4ed51072b8a6d1528d3ec18bf\"))
  (:FILE \"src/get-resolver/sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d869293ba47444c4721713d955c6254\"))
  (:FILE \"src/get-resolver/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"9df13bcc6908e9fa601d173a671e1ccf\"))
  (:FILE \"src/get/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"c5cc36884b238221cc13ca0c087ec7c2\"))
  (:FILE \"src/get/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"e70bfeddd694336bbd088e65f8761834\"))
  (:FILE \"src/get/lookup.lisp\" :MD5
   #A((32) BASE-CHAR . \"82258ec87aca513a508bc5dee8410dd6\"))
  (:FILE \"src/get/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"c72633d15c3488699072eb610ebde7c8\"))
  (:FILE \"src/get/segment.lisp\" :MD5
   #A((32) BASE-CHAR . \"811869eb6a197d3c4e26af4322e52652\"))
  (:FILE \"src/get/target.lisp\" :MD5
   #A((32) BASE-CHAR . \"1b70dac05d6d2418909eb5105b808e81\"))
  (:FILE \"src/get/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"c394e5684de5e2d938991c7cb348b93c\"))
  (:FILE \"src/hash/arithmetic.lisp\" :MD5
   #A((32) BASE-CHAR . \"b5c51802e607e3dd22de68204baf64e9\"))
  (:FILE \"src/hash/blocks.lisp\" :MD5
   #A((32) BASE-CHAR . \"bef497b9a267c7306d4100000491c814\"))
  (:FILE \"src/hash/hash64.lisp\" :MD5
   #A((32) BASE-CHAR . \"886b7c08b9929283e8968831cbe5c039\"))
  (:FILE \"src/hash/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d9060e41bc5252067d35e59ac70ee06\"))
  (:FILE \"src/index/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"65076c355c099b5dc73d185948d3bec4\"))
  (:FILE \"src/index/hash-digests.lisp\" :MD5
   #A((32) BASE-CHAR . \"43d2209225707352daec6186ef95a805\"))
  (:FILE \"src/index/hash-seed.lisp\" :MD5
   #A((32) BASE-CHAR . \"45ce41749bc6fa638539815d3f802b96\"))
  (:FILE \"src/index/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"598a9b65e73151c924b2cdcaf6d96705\"))
  (:FILE \"src/index/primary-arena.lisp\" :MD5
   #A((32) BASE-CHAR . \"a319691e3e28b7ea7b927de490cf69ba\"))
  (:FILE \"src/index/primary-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"ff2cfbb865290d7a1510fdf6877c7229\"))
  (:FILE \"src/index/primary-core.lisp\" :MD5
   #A((32) BASE-CHAR . \"fa52433eae199ceeb874bf2bc47afca7\"))
  (:FILE \"src/index/primary-directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"1dd67c527257e43f17e006644ecdbd00\"))
  (:FILE \"src/index/primary-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d65cfce399b04f905bf969929962e59a\"))
  (:FILE \"src/index/primary-probe.lisp\" :MD5
   #A((32) BASE-CHAR . \"699ce3f1615296fc27fcde3e0d63a4bc\"))
  (:FILE \"src/index/primary-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"3f317a0d3c5ee86a73651aad36135cc3\"))
  (:FILE \"src/index/primary-relocate.lisp\" :MD5
   #A((32) BASE-CHAR . \"5155959766645d3172ae5e73c58cc071\"))
  (:FILE \"src/index/primary-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a59eab6425a60fa2656f86bf87d5c9ac\"))
  (:FILE \"src/index/primary-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"e8e31e599356e592af29c0cc4604872b\"))
  (:FILE \"src/index/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"5b22b90cfe8534086f6aff96d156713e\"))
  (:FILE \"src/index/rebuild-budget.lisp\" :MD5
   #A((32) BASE-CHAR . \"0417dd41cb3ec1d62dfd913c19f810ad\"))
  (:FILE \"src/index/rebuild-copy.lisp\" :MD5
   #A((32) BASE-CHAR . \"8befbbd00ed5c31c1487a11887eba495\"))
  (:FILE \"src/index/rebuild-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"1188e7a64a7a5d9482c1233cb9acb452\"))
  (:FILE \"src/index/rebuild.lisp\" :MD5
   #A((32) BASE-CHAR . \"a450cac8071513365267e7024cbe94b0\"))
  (:FILE \"src/index/relocate.lisp\" :MD5
   #A((32) BASE-CHAR . \"475dd7d5809a836f01544b447cc8df27\"))
  (:FILE \"src/index/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"5157fd03ee806ee998ad8f0002d56268\"))
  (:FILE \"src/index/validation.lisp\" :MD5
   #A((32) BASE-CHAR . \"3384cadf737c7d80c004222022a281f6\"))
  (:FILE \"src/index/write.lisp\" :MD5
   #A((32) BASE-CHAR . \"f0c8c579cd7db466d243ed3ea9f8e8aa\"))
  (:FILE \"src/io/flush.lisp\" :MD5
   #A((32) BASE-CHAR . \"716866194d6b9f076e102e84187229c0\"))
  (:FILE \"src/io/identity-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"d354a095fb378c1b6f27397ffb902227\"))
  (:FILE \"src/io/identity.lisp\" :MD5
   #A((32) BASE-CHAR . \"4e03b14a0c5015dc6ec897221c9f0eb5\"))
  (:FILE \"src/io/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"11c7103efbe733bbf0a13927f23c3d34\"))
  (:FILE \"src/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"58030bc0c811248a6537e2909d8762d6\"))
  (:FILE \"src/io/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"7aafde7081a3804862c3acf446e6e385\"))
  (:FILE \"src/io/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"2f8bd851d09ab994d8d01b231697d1a1\"))
  (:FILE \"src/io/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"e7b6ee5fd2d57281dbd32bf9b07d0fa6\"))
  (:FILE \"src/mvcc/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"f188d1dbd5d0adb49f53acf09157aef9\"))
  (:FILE \"src/mvcc/snapshots-core.lisp\" :MD5
   #A((32) BASE-CHAR . \"8bb066aab61a18eff175b9edb11e42a2\"))
  (:FILE \"src/mvcc/snapshots-csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"0e9365e674d1584b111f915ce1f58634\"))
  (:FILE \"src/mvcc/snapshots-lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"ff98aea5cb9a7ae2671f6a887a003725\"))
  (:FILE \"src/mvcc/snapshots-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"ae3ad96269b5e711a9dbb455f3c0ce48\"))
  (:FILE \"src/mvcc/snapshots-register.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d5a795bcefd605c75da91c725ae83a2\"))
  (:FILE \"src/mvcc/snapshots-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"475517bd7ba04a1c37a82efeb8ff73d9\"))
  (:FILE \"src/mvcc/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a9bc70eab6720b5c6f8503178e2c966b\"))
  (:FILE \"src/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"becf5c78049c85f2c05cd1ef54454032\"))
  (:FILE \"src/read/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"4040905f4a64ba704a480d82e87ec748\"))
  (:FILE \"src/read/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"7d74d9decc5a0bc9f9331d89bd503e21\"))
  (:FILE \"src/read/task.lisp\" :MD5
   #A((32) BASE-CHAR . \"9e0baf22c53329d393e047c669679645\"))
  (:FILE \"src/read/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"9c37ff8237fcc9fe9ae4f44316e854e3\"))
  (:FILE \"src/recovery/decisions-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"1a51ef4a488bb9fde2ff7d47bae01379\"))
  (:FILE \"src/recovery/decisions-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"cbdc30f93109c474e1fc25066c9b9b13\"))
  (:FILE \"src/recovery/decisions-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"f782d1137b8ce342b91c9999cfb7accc\"))
  (:FILE \"src/recovery/decisions-radix.lisp\" :MD5
   #A((32) BASE-CHAR . \"852149de4c289b8e067602780378d87a\"))
  (:FILE \"src/recovery/decisions-sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"b33e57a643f2fca810846f6226366253\"))
  (:FILE \"src/recovery/decisions-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f4433fd19ebc7239dbc2628c39f3ecdb\"))
  (:FILE \"src/recovery/inventory-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"9bd6820c4feba3e552aab1a4edd87861\"))
  (:FILE \"src/recovery/inventory-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"fcea263de1938767772e5b11411ecd5e\"))
  (:FILE \"src/recovery/inventory-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"78c136d5838dcfe3019d9069643a8d8f\"))
  (:FILE \"src/recovery/manifest-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"bf65b1731eab6e0572461ef5cc60fc40\"))
  (:FILE \"src/recovery/manifest-decode.lisp\" :MD5
   #A((32) BASE-CHAR . \"67975249aaabd751757cdfb9222cc3c4\"))
  (:FILE \"src/recovery/manifest-fold.lisp\" :MD5
   #A((32) BASE-CHAR . \"e0d2498db1011e857b7b0daa1934f187\"))
  (:FILE \"src/recovery/manifest-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"37ace42844c11b52446ee1fc500b8e0b\"))
  (:FILE \"src/recovery/manifest-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"ebd7a54adea2213294a887e6d4db0927\"))
  (:FILE \"src/recovery/manifest-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"7b1d4054415faca7e5fca59ad83b4d4a\"))
  (:FILE \"src/recovery/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1c1c8ad0cd15b1703a2fe19cbf3f13c2\"))
  (:FILE \"src/recovery/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"fcacd15460db25ea9cc4036065f9f096\"))
  (:FILE \"src/scheduler/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"36c5ae2dd08fbe546f4392b7b12102ec\"))
  (:FILE \"src/scheduler/lifecycle-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"1c4a4fd316ef034c298db47dfca1daca\"))
  (:FILE \"src/scheduler/lifecycle-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"19c8be44863be30c07bb72fe3fac2a99\"))
  (:FILE \"src/scheduler/lifecycle-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"fa2f88c50dfec24af40af091f9221590\"))
  (:FILE \"src/scheduler/lifecycle-update.lisp\" :MD5
   #A((32) BASE-CHAR . \"40a78461f91616a935a39f29b87680c8\"))
  (:FILE \"src/scheduler/lifecycle-worker.lisp\" :MD5
   #A((32) BASE-CHAR . \"9d7cdf45c1b594fef5af735ec0955c05\"))
  (:FILE \"src/scheduler/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"0578c541b6ddfaf8827240e967ff76ea\"))
  (:FILE \"src/scheduler/policy.lisp\" :MD5
   #A((32) BASE-CHAR . \"1721005a7545b36df601d75252638eba\"))
  (:FILE \"src/scheduler/pool-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"c4995b29d40caa2ee29aa0c167885287\"))
  (:FILE \"src/scheduler/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"170dfc36aef6a3d78f980fbcc37f0176\"))
  (:FILE \"src/scheduler/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"981f9f6db268cd9a46d4239c677c5d5b\"))
  (:FILE \"src/scheduler/update.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a43e6b400b701c69286357ef85469fc\"))
  (:FILE \"src/series/events.lisp\" :MD5
   #A((32) BASE-CHAR . \"32b2156739a6f2ca996abb91df0a2603\"))
  (:FILE \"src/series/io-events.lisp\" :MD5
   #A((32) BASE-CHAR . \"b6026a8b7bb64b45c37a65effda70d8e\"))
  (:FILE \"src/series/ownership.lisp\" :MD5
   #A((32) BASE-CHAR . \"de1aca16a35d34d16aba12ff541c0d2b\"))
  (:FILE \"src/series/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"09653c7479e1498d1545f3f1f0ffd755\"))
  (:FILE \"src/series/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6977aba53c811ec3a373226f9f53795\"))
  (:FILE \"src/series/query.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb0d91405325b508e6b2ab24d178de7a\"))
  (:FILE \"src/series/retirement.lisp\" :MD5
   #A((32) BASE-CHAR . \"b8e04971b8ad75a1bd0c722997badfd2\"))
  (:FILE \"src/series/routing-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6924deff152b941bd49f0bb200b4197\"))
  (:FILE \"src/series/routing-select.lisp\" :MD5
   #A((32) BASE-CHAR . \"e0f987d8767744050ec4d1b3ecb699ed\"))
  (:FILE \"src/series/routing-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"ce649df47dd38888d5103c98345f7e41\"))
  (:FILE \"src/series/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab19ec8d15af91511e817858c41cebc8\"))
  (:FILE \"src/series/worker-boundary.lisp\" :MD5
   #A((32) BASE-CHAR . \"2340e0c9074f7b1bf80c74f774986bc5\"))
  (:FILE \"src/series/worker-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"a93ce2e84e8aee647b5083ad1d2b899b\"))
  (:FILE \"src/series/worker-run.lisp\" :MD5
   #A((32) BASE-CHAR . \"f0fee18adf357bad98e8a3c3e8c70c0c\"))
  (:FILE \"src/series/worker-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"2b23d468be0165fa009c5ebd5d1bbe23\"))
  (:FILE \"src/storage/compaction-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"1cda77a357ab2147035993b72d135a37\"))
  (:FILE \"src/storage/control-payload.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb64f806b8d69eb42d865b4abfff0b27\"))
  (:FILE \"src/storage/formats.lisp\" :MD5
   #A((32) BASE-CHAR . \"061147be459d8d3b08c661bd3f91d152\"))
  (:FILE \"src/storage/log-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"b53d27dcc9f4badf18b50519c50bc614\"))
  (:FILE \"src/storage/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"f86bd104f20616a76b42c02227f72844\"))
  (:FILE \"src/storage/payload-record.lisp\" :MD5
   #A((32) BASE-CHAR . \"8c03f9c01dcb30f2d3970a5694968ecf\"))
  (:FILE \"src/storage/payload-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"c4ece3c4fa8d9492d2a80df7c0a4f5a0\"))
  (:FILE \"src/storage/segment-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6812fa59bf8fd1252fbf85a9bfa3896\"))
  (:FILE \"src/wal/builder.lisp\" :MD5
   #A((32) BASE-CHAR . \"a229f76f7036f3573a6e528dcd390a19\"))
  (:FILE \"src/wal/csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"42b990e3b254e6fb488c0ab91b6a6502\"))
  (:FILE \"src/wal/executor.lisp\" :MD5
   #A((32) BASE-CHAR . \"c0340924c9130e14d0e8efedeec078f1\"))
  (:FILE \"src/wal/group.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a0e7c99ab70b4720cbb091156560f5e\"))
  (:FILE \"src/wal/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"96c41b1d417135a24fc65659ea3abe11\"))
  (:FILE \"src/wal/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f799f27a8ac1a4c736c04796c1e543f9\"))
  (:FILE \"tests/codec/cbor-float-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"425bfed06e37f409d59d0f5f029af196\"))
  (:FILE \"tests/codec/cbor-float-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"a8f6600ec087c10e5ec0a43d43edade4\"))
  (:FILE \"tests/codec/cbor-float-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"e62412cb0e838b241383a5c9103dd2c2\"))
  (:FILE \"tests/codec/cbor-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"208ee0d03652de67ad453bdd34d10b62\"))
  (:FILE \"tests/codec/cbor-minimal-edges.lisp\" :MD5
   #A((32) BASE-CHAR . \"392d402b44d04a9ce1c95fef4c4e8bf9\"))
  (:FILE \"tests/codec/cbor-minimal-scan-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"16954ef22a2169e6f9f6de0e9ab187ab\"))
  (:FILE \"tests/codec/cbor-minimal-scan-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"0dfa785451fcfe573019531e00600cc6\"))
  (:FILE \"tests/codec/cbor-minimal-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"34587c10ac32129ac531e0a4f03df9a6\"))
  (:FILE \"tests/codec/cbor-minimal-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"4d7ec43e187859da277b8fb5f66f8e73\"))
  (:FILE \"tests/codec/cbor-minimal-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"9a6a26ae45747211bb795bc323b13770\"))
  (:FILE \"tests/codec/cbor-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"2311a15f8d4af90bf341e91e0e64342b\"))
  (:FILE \"tests/codec/cbor-simple-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"948bfe5924482cccb6624f91be6770e6\"))
  (:FILE \"tests/codec/cbor-simple-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"c4793e5b0e0192c0fe222351d6f1b599\"))
  (:FILE \"tests/codec/cbor-simple-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"808ed81b703fd2cf0ac11d148c3ffc08\"))
  (:FILE \"tests/codec/cbor-string-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6acef83c6cda7e326fd10b4a1d6d6fa6\"))
  (:FILE \"tests/codec/cbor-string-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"8abc0529f331d1fabdec79507cf296ef\"))
  (:FILE \"tests/codec/cbor-string-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"70d9d0d454dd1f296ef6989d3b928842\"))
  (:FILE \"tests/codec/cbor-structure-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"220d386d29b1fa192e06ceebe4ec245c\"))
  (:FILE \"tests/codec/cbor-structure-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"f38848c55b050dae335b0a37657c1f5c\"))
  (:FILE \"tests/codec/cbor-structure.lisp\" :MD5
   #A((32) BASE-CHAR . \"06e6f060aea55a18d06047e5ebabd18e\"))
  (:FILE \"tests/codec/cbor-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e5da97609a2ba58bb35fea24b7518d2b\"))
  (:FILE \"tests/codec/cbor-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"4d7d61509b2ce749fb2331ceeaeeca76\"))
  (:FILE \"tests/codec/cbor-write-roundtrip.lisp\" :MD5
   #A((32) BASE-CHAR . \"646944ef624c06fd86d6a1306041349d\"))
  (:FILE \"tests/codec/cbor-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"13382bdf23e5501e0ca349faf7b05062\"))
  (:FILE \"tests/codec/cbor-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"4926899e278afdd9577e5ef8262ba835\"))
  (:FILE \"tests/codec/cbor-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"dffa6e75d8c3d7f991f6c4460eb8b9bc\"))
  (:FILE \"tests/codec/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"32534fd42dd8124b50b45deefe143eaf\"))
  (:FILE \"tests/codec/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"a71504598cda8e99cd50e229ddd5275b\"))
  (:FILE \"tests/codec/utf8.lisp\" :MD5
   #A((32) BASE-CHAR . \"767ead15603be8dce90f340dbb200d8f\"))
  (:FILE \"tests/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"1d9133c5fd33cb60ff160f468db330f4\"))
  (:FILE \"tests/csn/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e5c151cda2e10e4f9cae46a4326699eb\"))
  (:FILE \"tests/csn/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"087108576603e6cd5b9af14b50475746\"))
  (:FILE \"tests/epochs/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe92ddd79dcaab3d3f7bdf387bf2295e\"))
  (:FILE \"tests/epochs/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"592a2fe2e22214c52d4672d26620980b\"))
  (:FILE \"tests/epochs/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"67cec074bf70074f7f2c6965ef494ba8\"))
  (:FILE \"tests/execution/handoff.lisp\" :MD5
   #A((32) BASE-CHAR . \"f87fdc0f7bd194329c6349026a2f35bb\"))
  (:FILE \"tests/execution/queue.lisp\" :MD5
   #A((32) BASE-CHAR . \"940ebb450bc871f8c2dd7dc9977bb158\"))
  (:FILE \"tests/execution/ready-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"4ccdc0512b3c81837726076d7c795930\"))
  (:FILE \"tests/execution/ready.lisp\" :MD5
   #A((32) BASE-CHAR . \"f6756125a9150b6312dad3e2705b74d3\"))
  (:FILE \"tests/execution/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"bacb1a135c0d73cded57ba21986c8496\"))
  (:FILE \"tests/execution/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"32b6a6578f526b7d4bcc3a1665a8c6e6\"))
  (:FILE \"tests/execution/worker.lisp\" :MD5
   #A((32) BASE-CHAR . \"bbaa592327d730fdae78cb881350efe0\"))
  (:FILE \"tests/foundation/batch.lisp\" :MD5
   #A((32) BASE-CHAR . \"29fc6a9711ea9265840e8cde4971f74e\"))
  (:FILE \"tests/foundation/binary.lisp\" :MD5
   #A((32) BASE-CHAR . \"07c4c9ac2177f22e5b7fb25f9867a133\"))
  (:FILE \"tests/foundation/record.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a84ca3aa74ab158c6b7d66886cf8b23\"))
  (:FILE \"tests/foundation/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"758adad069aec2f9dbe0635797314ff6\"))
  (:FILE \"tests/get-directory/construction.lisp\" :MD5
   #A((32) BASE-CHAR . \"1137938073e71d6d8d62c751fbad05d5\"))
  (:FILE \"tests/get-directory/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"d1ab36d05cc1266e4533d27c693f12f4\"))
  (:FILE \"tests/get-directory/series-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"486604b450bfe8de32feaed1a96dc0cc\"))
  (:FILE \"tests/get-directory/series-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"092192d05b3f85c6c283113c57c02f01\"))
  (:FILE \"tests/get-directory/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"3f868ebe4307ad4238b314c37eceed9a\"))
  (:FILE \"tests/get-directory/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"63dd01c852de1399c2c82274d481d257\"))
  (:FILE \"tests/get-performance/guards.lisp\" :MD5
   #A((32) BASE-CHAR . \"324c70304e678cbe022ff33c73f793e2\"))
  (:FILE \"tests/get-performance/paths.lisp\" :MD5
   #A((32) BASE-CHAR . \"eb48216a4b5baa9cf498968ee032b205\"))
  (:FILE \"tests/get-performance/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"1f5f9fa3ffcc3220f10b7a5f294ee6d9\"))
  (:FILE \"tests/get-performance/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"916e5740db5d52fdf6088694f34d11db\"))
  (:FILE \"tests/get-resolver/construction.lisp\" :MD5
   #A((32) BASE-CHAR . \"a64a6a5a34c8ec5f8c4ca4324cc348d2\"))
  (:FILE \"tests/get-resolver/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"e93c7dbf1bf2d7e99651b110a4e01661\"))
  (:FILE \"tests/get-resolver/sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"ffe3551bb49dd60d7d34213c9c93cf06\"))
  (:FILE \"tests/get-resolver/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"0738e161d276394a160a86ed139610f2\"))
  (:FILE \"tests/get/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"3a4bbc3fd3ede5a837f0c0f913637291\"))
  (:FILE \"tests/get/segment.lisp\" :MD5
   #A((32) BASE-CHAR . \"2f25d1904aa4960ce0d6351580a2bcc7\"))
  (:FILE \"tests/get/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"660783988d4f99d0e171bb59c79e3467\"))
  (:FILE \"tests/hash/guards.lisp\" :MD5
   #A((32) BASE-CHAR . \"a59d531a156fc49c39c9265075bd9600\"))
  (:FILE \"tests/hash/hash64.lisp\" :MD5
   #A((32) BASE-CHAR . \"443fdc895f2fa3620d2b1b4af5c32dc4\"))
  (:FILE \"tests/hash/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"40b223712554582c2910971a6b045149\"))
  (:FILE \"tests/hash/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"73ed0785ca1330d69ad336abc019a413\"))
  (:FILE \"tests/index/hash-digests.lisp\" :MD5
   #A((32) BASE-CHAR . \"91c1eda35e14276e795259bceac489be\"))
  (:FILE \"tests/index/primary-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"44e2635d88de3f6ccf69c684c3eff77b\"))
  (:FILE \"tests/index/primary-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"4d339c2f2680e66ac79ecd8d02c09382\"))
  (:FILE \"tests/index/primary.lisp\" :MD5
   #A((32) BASE-CHAR . \"6ed661242a86117dd2d696e374740a2f\"))
  (:FILE \"tests/index/rebuild.lisp\" :MD5
   #A((32) BASE-CHAR . \"262556582cc0c387d6c59b757d9956b1\"))
  (:FILE \"tests/index/slot-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6ed9249e2eaef3524260804ef7e02567\"))
  (:FILE \"tests/index/slot-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"e9b53e6eac6fc836e8243d41adbafea0\"))
  (:FILE \"tests/index/slots.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe094b4513ceabe8571031ac20935e48\"))
  (:FILE \"tests/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"1e6fd9ab36eb4e307207d371ed947757\"))
  (:FILE \"tests/io/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"a26526e87fe46794b8bbab1fdd46d68c\"))
  (:FILE \"tests/io/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab2fb36682dd8b8bc757e586ceb3be62\"))
  (:FILE \"tests/lint-fixtures/bad.lisp\" :MD5
   #A((32) BASE-CHAR . \"30f1396c941dd9b8a41ca15698b5a347\"))
  (:FILE \"tests/lint-fixtures/good.lisp\" :MD5
   #A((32) BASE-CHAR . \"f85250c3a057c851db6745b9eba27da1\"))
  (:FILE \"tests/lint-fixtures/keyword-barrier.lisp\" :MD5
   #A((32) BASE-CHAR . \"9f63fdfdf866f17d5491390b710ebb5e\"))
  (:FILE \"tests/lint-fixtures/qualified-reader.lisp\" :MD5
   #A((32) BASE-CHAR . \"7fc689336bb2041dfef4c22090bb7de4\"))
  (:FILE \"tests/mvcc/capture.lisp\" :MD5
   #A((32) BASE-CHAR . \"1f0309fa9258eb62a45167de5d2279d5\"))
  (:FILE \"tests/mvcc/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"341627288b50485858efedc207fc95b5\"))
  (:FILE \"tests/mvcc/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e7d26bd67650663c88ceda526023ae83\"))
  (:FILE \"tests/read/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"73dab63d8414998d72f6c14e0d62e3ac\"))
  (:FILE \"tests/read/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"0d5db03bd804747de7c309c82e40dd43\"))
  (:FILE \"tests/read/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"0cf2cad12c77c82b827da01782bc996d\"))
  (:FILE \"tests/recovery/corruption.lisp\" :MD5
   #A((32) BASE-CHAR . \"a369b8176d4e877ab546d17e983b94ed\"))
  (:FILE \"tests/recovery/decisions-audit.lisp\" :MD5
   #A((32) BASE-CHAR . \"33b98cf215d1ddb469d02cc6c0032bfe\"))
  (:FILE \"tests/recovery/decisions-radix.lisp\" :MD5
   #A((32) BASE-CHAR . \"58eec0feac01e643c76ad19ef5c07df5\"))
  (:FILE \"tests/recovery/decisions-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"80348d0ce2adbc8a4d37db49df291b1d\"))
  (:FILE \"tests/recovery/decisions.lisp\" :MD5
   #A((32) BASE-CHAR . \"5add0e087181bad8ce330af23fc26686\"))
  (:FILE \"tests/recovery/inventory-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"522afcdc6115fdd4d8fec0d06aab7354\"))
  (:FILE \"tests/recovery/inventory.lisp\" :MD5
   #A((32) BASE-CHAR . \"9c78925dd89e94d86a9f577e0225eeb3\"))
  (:FILE \"tests/recovery/manifest-audit.lisp\" :MD5
   #A((32) BASE-CHAR . \"3ca73a199708e2571da3a27e6dc00c76\"))
  (:FILE \"tests/recovery/manifest-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"3286e0dfb66496aafe8b6fbbdd92ab43\"))
  (:FILE \"tests/recovery/manifest.lisp\" :MD5
   #A((32) BASE-CHAR . \"b6bdcc4d20f7db14c0dc00d5258cbf8c\"))
  (:FILE \"tests/recovery/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"aa7af12d270673b62542d32ec60b361a\"))
  (:FILE \"tests/recovery/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"769bac1994a5e3d74bd56b510970bf9b\"))
  (:FILE \"tests/scheduler/controller.lisp\" :MD5
   #A((32) BASE-CHAR . \"bc20dcd712332fde961fb38e879392b5\"))
  (:FILE \"tests/scheduler/dispatch.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab3ffa543f0bfe8d98e1a0fc068ccb7e\"))
  (:FILE \"tests/scheduler/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"1388f446bce5085439c2254edd165118\"))
  (:FILE \"tests/scheduler/pool-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"aaba914dea485f812a11767addb94c81\"))
  (:FILE \"tests/scheduler/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"34e51e369859bc1c731d73e43053b6f4\"))
  (:FILE \"tests/series/boundaries.lisp\" :MD5
   #A((32) BASE-CHAR . \"6967c7e6396b6df38c637f2d5d9ebfc0\"))
  (:FILE \"tests/series/controller.lisp\" :MD5
   #A((32) BASE-CHAR . \"a83818568a27c52d36365597d7113c09\"))
  (:FILE \"tests/series/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6aa566720d1476d13a0f7288be9e1346\"))
  (:FILE \"tests/series/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"67718445a8948da3c7875f6cc6b3e167\"))
  (:FILE \"tests/series/worker-bridge.lisp\" :MD5
   #A((32) BASE-CHAR . \"c714c8db7998acf60256b318488574d8\"))
  (:FILE \"tests/series/worker-routing.lisp\" :MD5
   #A((32) BASE-CHAR . \"f839733b6f5a4d9286a5cdd7ae9bcb55\"))
  (:FILE \"tests/smoke.lisp\" :MD5
   #A((32) BASE-CHAR . \"afb2e2bc7ff7249ebb2e1ccf0f87aaf3\"))
  (:FILE \"tests/storage/compaction-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb4acb5a73eb973f53ef337113880d32\"))
  (:FILE \"tests/storage/control-payload.lisp\" :MD5
   #A((32) BASE-CHAR . \"25f3c822273c898d2263ceb3db538cab\"))
  (:FILE \"tests/storage/log-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"eecb2fe94e710a918254e5ad453a0daa\"))
  (:FILE \"tests/storage/segment-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab2c52fb6b79702d50dcef6d12ca8906\"))
  (:FILE \"tests/storage/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"82a4dbb4767c17f9851143a637af3b83\"))
  (:FILE \"tests/wal/builder.lisp\" :MD5
   #A((32) BASE-CHAR . \"0d01e4e18c0a559873fce584a0ac91cd\"))
  (:FILE \"tests/wal/csn-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"ecb2cbf4f7ace32cdaff329476070d60\"))
  (:FILE \"tests/wal/csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"3e2dbc3319b611db090e27493a10fc2c\"))
  (:FILE \"tests/wal/fault.lisp\" :MD5
   #A((32) BASE-CHAR . \"00367366b82918614d84f517f4bb395e\"))
  (:FILE \"tests/wal/group.lisp\" :MD5
   #A((32) BASE-CHAR . \"0ee2462103a749b58488561aeacaac07\"))
  (:FILE \"tests/wal/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"0643b96c5ee339f9826b19150d065ddf\"))
  (:FILE \"tests/wal/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"15952f6b761acea4519abf701bb2346c\"))
  (:FILE \"tools/measure-pool-dispatch.lisp\" :MD5
   #A((32) BASE-CHAR . \"daea2e29c87593dcc7db9949b67ff4f6\")))
 :SOURCE-FINGERPRINTS-AFTER
 ((:FILE \"arcdocdb.asd\" :MD5
   #A((32) BASE-CHAR . \"d942157b93d69b3852e784a9a838fcb9\"))
  (:FILE \"tools/measure-pool-lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"72a85a626ffb60185baf7602d28517e9\"))
  (:FILE \"src/active/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"bf244695c3c14a1a0148517b48052f5d\"))
  (:FILE \"src/active/preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"0ce41661b5cd26fe2edb944cca142f98\"))
  (:FILE \"src/active/prepare.lisp\" :MD5
   #A((32) BASE-CHAR . \"e3238a39b721a3a5ac1055bc1a30feba\"))
  (:FILE \"src/active/source.lisp\" :MD5
   #A((32) BASE-CHAR . \"50c6d9f4e4eb68c8018acb6a3fe70c8e\"))
  (:FILE \"src/active/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe47862290f99d6217361f4302e2faf2\"))
  (:FILE \"src/cache/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"5d70197c8b64ad6f20c8be47a60c73ca\"))
  (:FILE \"src/cache/clock.lisp\" :MD5
   #A((32) BASE-CHAR . \"3546cf7f5c5ed138068548c20064f499\"))
  (:FILE \"src/cache/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"72f3a33ce27ddf94c49c495580520004\"))
  (:FILE \"src/cache/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1f6a8e7aa4faed88e984b39871d1e53\"))
  (:FILE \"src/cache/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"82f937b7b08bd1696ad9c88da2e1c60c\"))
  (:FILE \"src/cache/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a25648d870eaa4f0b6e1e3b2cf76e28e\"))
  (:FILE \"src/cache/write.lisp\" :MD5
   #A((32) BASE-CHAR . \"fc09021f74fb50aac57589614dae04d7\"))
  (:FILE \"src/codec/cbor-float-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"bc7a7b176e8cdd361b7c4306a1a4de4b\"))
  (:FILE \"src/codec/cbor-float-narrow.lisp\" :MD5
   #A((32) BASE-CHAR . \"c15cc9d91355860357ed434e58d1f4cb\"))
  (:FILE \"src/codec/cbor-float-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"f3b22be81a36e1713c34e890c82c6700\"))
  (:FILE \"src/codec/cbor-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"6e8c6a49314c2f460aa6f8a1759200b6\"))
  (:FILE \"src/codec/cbor-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"ecd8fe950344059c629927b38fb6e4aa\"))
  (:FILE \"src/codec/cbor-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"2dee1a475a1c6edb13b60430fbc0668e\"))
  (:FILE \"src/codec/cbor-scan-input.lisp\" :MD5
   #A((32) BASE-CHAR . \"f6488e987889432b375254021825dbe5\"))
  (:FILE \"src/codec/cbor-scan-items.lisp\" :MD5
   #A((32) BASE-CHAR . \"706c0baa4158bf272c4b0df17c1439d2\"))
  (:FILE \"src/codec/cbor-scan-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"987e8ed576a21eb644ac1ef2e06edbda\"))
  (:FILE \"src/codec/cbor-scan-stack.lisp\" :MD5
   #A((32) BASE-CHAR . \"cf1999ddb10f879aeefbeea853742d57\"))
  (:FILE \"src/codec/cbor-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"0c33aedcdb352e78a3c694cf796e6692\"))
  (:FILE \"src/codec/cbor-simple-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"200373402e6e082dd8c7afde305302bb\"))
  (:FILE \"src/codec/cbor-space.lisp\" :MD5
   #A((32) BASE-CHAR . \"c33cdcc45f45218aa3e8bf26ce0ee575\"))
  (:FILE \"src/codec/cbor-string-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"b13e92b5f24a42fe283c17b649722b6a\"))
  (:FILE \"src/codec/cbor-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"69e77bcd15b5413a815a65c5081229db\"))
  (:FILE \"src/codec/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d885bd2a9860eb60aec1a775e5031d5e\"))
  (:FILE \"src/codec/utf8.lisp\" :MD5
   #A((32) BASE-CHAR . \"0f67dd5c51bf6a63bc292ab4e2a280c2\"))
  (:FILE \"src/control/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"8f3dc4a9657b6bb760e31c46c1e7b986\"))
  (:FILE \"src/control/dependency.lisp\" :MD5
   #A((32) BASE-CHAR . \"22ae34181e8ab96d8c8ecab050a1a19e\"))
  (:FILE \"src/control/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"3cedb51e60b92524cd8208e4bfb2c3ba\"))
  (:FILE \"src/control/preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"2dfc2b76c1d3c382db8b50071bdaeadf\"))
  (:FILE \"src/control/prepare.lisp\" :MD5
   #A((32) BASE-CHAR . \"9df8dc8a19d2a4bc700adfed763c27fa\"))
  (:FILE \"src/control/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"468fcf430eede17a38b922dfd373a746\"))
  (:FILE \"src/control/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d15317bafcdb12ea579b2f482dff57c\"))
  (:FILE \"src/csn/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1130012fc5613a5648d22ed8628be0e8\"))
  (:FILE \"src/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1cdb5661fc54beba5bf00e4765f3235\"))
  (:FILE \"src/dispatch/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"ba4cd961094f37a157d49b8d7024b677\"))
  (:FILE \"src/dispatch/claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"b10caeff4f726c0ebd01e2c6d1baacba\"))
  (:FILE \"src/dispatch/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"46e12ac1f6ab8591bac6467f724538a2\"))
  (:FILE \"src/dispatch/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"36db6694bc70963149b8068ae7ab96ec\"))
  (:FILE \"src/epochs/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"765d14c88cd288093a77a57930cd6999\"))
  (:FILE \"src/epochs/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"875201dfab0a84efd40fe9828cc293c8\"))
  (:FILE \"src/epochs/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"975b5f74e0c5a38ce978f4d9c7fcc6b8\"))
  (:FILE \"src/epochs/reclaim.lisp\" :MD5
   #A((32) BASE-CHAR . \"036dd02adf87d33c3ae2f40735c733fa\"))
  (:FILE \"src/epochs/retire.lisp\" :MD5
   #A((32) BASE-CHAR . \"653b974f310c09f6e2224a84acc43bbf\"))
  (:FILE \"src/epochs/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"82253491f995f5bc153fb5ebf30d564c\"))
  (:FILE \"src/execution/handoff.lisp\" :MD5
   #A((32) BASE-CHAR . \"6b85eebe69366e78ed5fc5cc20735f00\"))
  (:FILE \"src/execution/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb5710d6c111cadb7121a50998a747fa\"))
  (:FILE \"src/execution/queue.lisp\" :MD5
   #A((32) BASE-CHAR . \"8202843bddb817da4279ac959ae3f3c4\"))
  (:FILE \"src/execution/ready-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"38d26f8c749dd946dfc4b9c57103a892\"))
  (:FILE \"src/execution/ready-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a64d98c9ff429d6103d6e10ee1fd7980\"))
  (:FILE \"src/execution/ready.lisp\" :MD5
   #A((32) BASE-CHAR . \"2c1892002f0599bb8273093031017520\"))
  (:FILE \"src/execution/worker-boundary.lisp\" :MD5
   #A((32) BASE-CHAR . \"c24065d6c8d80d1be53994a0041743df\"))
  (:FILE \"src/execution/worker-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"babd0a78b4185af24ae1fef870c0fabb\"))
  (:FILE \"src/execution/worker-run.lisp\" :MD5
   #A((32) BASE-CHAR . \"aa34ca6bc07535e35fea723878d99f66\"))
  (:FILE \"src/execution/worker-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"0679ee07c46f69db330706303c70d8d2\"))
  (:FILE \"src/execution/writer.lisp\" :MD5
   #A((32) BASE-CHAR . \"73019644090e2971f2b54dc36e4491f5\"))
  (:FILE \"src/foundation/batch.lisp\" :MD5
   #A((32) BASE-CHAR . \"ca642ea47e4bff76f78f5b6d7287d6bd\"))
  (:FILE \"src/foundation/binary.lisp\" :MD5
   #A((32) BASE-CHAR . \"a06115175f450776762761dce25acdb8\"))
  (:FILE \"src/foundation/conditions.lisp\" :MD5
   #A((32) BASE-CHAR . \"942b596396c19815290a57830af2121b\"))
  (:FILE \"src/foundation/crc32c.lisp\" :MD5
   #A((32) BASE-CHAR . \"4db58e2f48bf77d751f1b83bb9f84b5c\"))
  (:FILE \"src/foundation/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"5ee593a112958d94163dab17c5aa4ba2\"))
  (:FILE \"src/foundation/record.lisp\" :MD5
   #A((32) BASE-CHAR . \"c3ed0f09fa3fa6fe20c98e2ed6e69abe\"))
  (:FILE \"src/get-directory/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"cde24b2bf5c5637d5501b95bed47df31\"))
  (:FILE \"src/get-directory/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a05062f6ab6d5ebdfdde37e336dfce6\"))
  (:FILE \"src/get-directory/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"74a694385f1aaf03ec87721545494119\"))
  (:FILE \"src/get-directory/sources-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"2b8193aab6801de19e26fa55e7c53f87\"))
  (:FILE \"src/get-directory/sources-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"7bac02a80ddc22c622f8465642385ae8\"))
  (:FILE \"src/get-directory/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"17c957d6934a31f4ed64313e756de2d2\"))
  (:FILE \"src/get-resolver/active-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"c65593cf172f53a8e90a853bbe9504c2\"))
  (:FILE \"src/get-resolver/active-directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"6d95f29b331d335175843f47ae44a6ea\"))
  (:FILE \"src/get-resolver/active-init.lisp\" :MD5
   #A((32) BASE-CHAR . \"7ca975d2534f43c8018d36ecd7c2b042\"))
  (:FILE \"src/get-resolver/active-preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"f13d422adb6aa9e8489352884137f25a\"))
  (:FILE \"src/get-resolver/active-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"521737861e057d663964b0c030552587\"))
  (:FILE \"src/get-resolver/active-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6aaec49504a96f37c8ff1bc182c977b\"))
  (:FILE \"src/get-resolver/active-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"60bb258cf4cc7f50c5c1206af1bb5800\"))
  (:FILE \"src/get-resolver/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"bbfb2082103e6712419e180ab972245c\"))
  (:FILE \"src/get-resolver/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"263525e8274a8f46ce58a4a0ad6841a2\"))
  (:FILE \"src/get-resolver/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"1339edff0223dbf122f11ff0adbba61c\"))
  (:FILE \"src/get-resolver/rows.lisp\" :MD5
   #A((32) BASE-CHAR . \"ca9002b81efd0aed9761cd1f78514762\"))
  (:FILE \"src/get-resolver/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"536e9dc4ed51072b8a6d1528d3ec18bf\"))
  (:FILE \"src/get-resolver/sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d869293ba47444c4721713d955c6254\"))
  (:FILE \"src/get-resolver/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"9df13bcc6908e9fa601d173a671e1ccf\"))
  (:FILE \"src/get/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"c5cc36884b238221cc13ca0c087ec7c2\"))
  (:FILE \"src/get/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"e70bfeddd694336bbd088e65f8761834\"))
  (:FILE \"src/get/lookup.lisp\" :MD5
   #A((32) BASE-CHAR . \"82258ec87aca513a508bc5dee8410dd6\"))
  (:FILE \"src/get/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"c72633d15c3488699072eb610ebde7c8\"))
  (:FILE \"src/get/segment.lisp\" :MD5
   #A((32) BASE-CHAR . \"811869eb6a197d3c4e26af4322e52652\"))
  (:FILE \"src/get/target.lisp\" :MD5
   #A((32) BASE-CHAR . \"1b70dac05d6d2418909eb5105b808e81\"))
  (:FILE \"src/get/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"c394e5684de5e2d938991c7cb348b93c\"))
  (:FILE \"src/hash/arithmetic.lisp\" :MD5
   #A((32) BASE-CHAR . \"b5c51802e607e3dd22de68204baf64e9\"))
  (:FILE \"src/hash/blocks.lisp\" :MD5
   #A((32) BASE-CHAR . \"bef497b9a267c7306d4100000491c814\"))
  (:FILE \"src/hash/hash64.lisp\" :MD5
   #A((32) BASE-CHAR . \"886b7c08b9929283e8968831cbe5c039\"))
  (:FILE \"src/hash/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d9060e41bc5252067d35e59ac70ee06\"))
  (:FILE \"src/index/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"65076c355c099b5dc73d185948d3bec4\"))
  (:FILE \"src/index/hash-digests.lisp\" :MD5
   #A((32) BASE-CHAR . \"43d2209225707352daec6186ef95a805\"))
  (:FILE \"src/index/hash-seed.lisp\" :MD5
   #A((32) BASE-CHAR . \"45ce41749bc6fa638539815d3f802b96\"))
  (:FILE \"src/index/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"598a9b65e73151c924b2cdcaf6d96705\"))
  (:FILE \"src/index/primary-arena.lisp\" :MD5
   #A((32) BASE-CHAR . \"a319691e3e28b7ea7b927de490cf69ba\"))
  (:FILE \"src/index/primary-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"ff2cfbb865290d7a1510fdf6877c7229\"))
  (:FILE \"src/index/primary-core.lisp\" :MD5
   #A((32) BASE-CHAR . \"fa52433eae199ceeb874bf2bc47afca7\"))
  (:FILE \"src/index/primary-directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"1dd67c527257e43f17e006644ecdbd00\"))
  (:FILE \"src/index/primary-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d65cfce399b04f905bf969929962e59a\"))
  (:FILE \"src/index/primary-probe.lisp\" :MD5
   #A((32) BASE-CHAR . \"699ce3f1615296fc27fcde3e0d63a4bc\"))
  (:FILE \"src/index/primary-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"3f317a0d3c5ee86a73651aad36135cc3\"))
  (:FILE \"src/index/primary-relocate.lisp\" :MD5
   #A((32) BASE-CHAR . \"5155959766645d3172ae5e73c58cc071\"))
  (:FILE \"src/index/primary-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a59eab6425a60fa2656f86bf87d5c9ac\"))
  (:FILE \"src/index/primary-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"e8e31e599356e592af29c0cc4604872b\"))
  (:FILE \"src/index/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"5b22b90cfe8534086f6aff96d156713e\"))
  (:FILE \"src/index/rebuild-budget.lisp\" :MD5
   #A((32) BASE-CHAR . \"0417dd41cb3ec1d62dfd913c19f810ad\"))
  (:FILE \"src/index/rebuild-copy.lisp\" :MD5
   #A((32) BASE-CHAR . \"8befbbd00ed5c31c1487a11887eba495\"))
  (:FILE \"src/index/rebuild-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"1188e7a64a7a5d9482c1233cb9acb452\"))
  (:FILE \"src/index/rebuild.lisp\" :MD5
   #A((32) BASE-CHAR . \"a450cac8071513365267e7024cbe94b0\"))
  (:FILE \"src/index/relocate.lisp\" :MD5
   #A((32) BASE-CHAR . \"475dd7d5809a836f01544b447cc8df27\"))
  (:FILE \"src/index/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"5157fd03ee806ee998ad8f0002d56268\"))
  (:FILE \"src/index/validation.lisp\" :MD5
   #A((32) BASE-CHAR . \"3384cadf737c7d80c004222022a281f6\"))
  (:FILE \"src/index/write.lisp\" :MD5
   #A((32) BASE-CHAR . \"f0c8c579cd7db466d243ed3ea9f8e8aa\"))
  (:FILE \"src/io/flush.lisp\" :MD5
   #A((32) BASE-CHAR . \"716866194d6b9f076e102e84187229c0\"))
  (:FILE \"src/io/identity-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"d354a095fb378c1b6f27397ffb902227\"))
  (:FILE \"src/io/identity.lisp\" :MD5
   #A((32) BASE-CHAR . \"4e03b14a0c5015dc6ec897221c9f0eb5\"))
  (:FILE \"src/io/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"11c7103efbe733bbf0a13927f23c3d34\"))
  (:FILE \"src/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"58030bc0c811248a6537e2909d8762d6\"))
  (:FILE \"src/io/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"7aafde7081a3804862c3acf446e6e385\"))
  (:FILE \"src/io/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"2f8bd851d09ab994d8d01b231697d1a1\"))
  (:FILE \"src/io/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"e7b6ee5fd2d57281dbd32bf9b07d0fa6\"))
  (:FILE \"src/mvcc/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"f188d1dbd5d0adb49f53acf09157aef9\"))
  (:FILE \"src/mvcc/snapshots-core.lisp\" :MD5
   #A((32) BASE-CHAR . \"8bb066aab61a18eff175b9edb11e42a2\"))
  (:FILE \"src/mvcc/snapshots-csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"0e9365e674d1584b111f915ce1f58634\"))
  (:FILE \"src/mvcc/snapshots-lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"ff98aea5cb9a7ae2671f6a887a003725\"))
  (:FILE \"src/mvcc/snapshots-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"ae3ad96269b5e711a9dbb455f3c0ce48\"))
  (:FILE \"src/mvcc/snapshots-register.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d5a795bcefd605c75da91c725ae83a2\"))
  (:FILE \"src/mvcc/snapshots-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"475517bd7ba04a1c37a82efeb8ff73d9\"))
  (:FILE \"src/mvcc/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a9bc70eab6720b5c6f8503178e2c966b\"))
  (:FILE \"src/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"becf5c78049c85f2c05cd1ef54454032\"))
  (:FILE \"src/read/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"4040905f4a64ba704a480d82e87ec748\"))
  (:FILE \"src/read/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"7d74d9decc5a0bc9f9331d89bd503e21\"))
  (:FILE \"src/read/task.lisp\" :MD5
   #A((32) BASE-CHAR . \"9e0baf22c53329d393e047c669679645\"))
  (:FILE \"src/read/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"9c37ff8237fcc9fe9ae4f44316e854e3\"))
  (:FILE \"src/recovery/decisions-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"1a51ef4a488bb9fde2ff7d47bae01379\"))
  (:FILE \"src/recovery/decisions-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"cbdc30f93109c474e1fc25066c9b9b13\"))
  (:FILE \"src/recovery/decisions-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"f782d1137b8ce342b91c9999cfb7accc\"))
  (:FILE \"src/recovery/decisions-radix.lisp\" :MD5
   #A((32) BASE-CHAR . \"852149de4c289b8e067602780378d87a\"))
  (:FILE \"src/recovery/decisions-sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"b33e57a643f2fca810846f6226366253\"))
  (:FILE \"src/recovery/decisions-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f4433fd19ebc7239dbc2628c39f3ecdb\"))
  (:FILE \"src/recovery/inventory-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"9bd6820c4feba3e552aab1a4edd87861\"))
  (:FILE \"src/recovery/inventory-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"fcea263de1938767772e5b11411ecd5e\"))
  (:FILE \"src/recovery/inventory-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"78c136d5838dcfe3019d9069643a8d8f\"))
  (:FILE \"src/recovery/manifest-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"bf65b1731eab6e0572461ef5cc60fc40\"))
  (:FILE \"src/recovery/manifest-decode.lisp\" :MD5
   #A((32) BASE-CHAR . \"67975249aaabd751757cdfb9222cc3c4\"))
  (:FILE \"src/recovery/manifest-fold.lisp\" :MD5
   #A((32) BASE-CHAR . \"e0d2498db1011e857b7b0daa1934f187\"))
  (:FILE \"src/recovery/manifest-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"37ace42844c11b52446ee1fc500b8e0b\"))
  (:FILE \"src/recovery/manifest-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"ebd7a54adea2213294a887e6d4db0927\"))
  (:FILE \"src/recovery/manifest-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"7b1d4054415faca7e5fca59ad83b4d4a\"))
  (:FILE \"src/recovery/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1c1c8ad0cd15b1703a2fe19cbf3f13c2\"))
  (:FILE \"src/recovery/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"fcacd15460db25ea9cc4036065f9f096\"))
  (:FILE \"src/scheduler/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"36c5ae2dd08fbe546f4392b7b12102ec\"))
  (:FILE \"src/scheduler/lifecycle-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"1c4a4fd316ef034c298db47dfca1daca\"))
  (:FILE \"src/scheduler/lifecycle-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"19c8be44863be30c07bb72fe3fac2a99\"))
  (:FILE \"src/scheduler/lifecycle-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"fa2f88c50dfec24af40af091f9221590\"))
  (:FILE \"src/scheduler/lifecycle-update.lisp\" :MD5
   #A((32) BASE-CHAR . \"40a78461f91616a935a39f29b87680c8\"))
  (:FILE \"src/scheduler/lifecycle-worker.lisp\" :MD5
   #A((32) BASE-CHAR . \"9d7cdf45c1b594fef5af735ec0955c05\"))
  (:FILE \"src/scheduler/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"0578c541b6ddfaf8827240e967ff76ea\"))
  (:FILE \"src/scheduler/policy.lisp\" :MD5
   #A((32) BASE-CHAR . \"1721005a7545b36df601d75252638eba\"))
  (:FILE \"src/scheduler/pool-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"c4995b29d40caa2ee29aa0c167885287\"))
  (:FILE \"src/scheduler/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"170dfc36aef6a3d78f980fbcc37f0176\"))
  (:FILE \"src/scheduler/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"981f9f6db268cd9a46d4239c677c5d5b\"))
  (:FILE \"src/scheduler/update.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a43e6b400b701c69286357ef85469fc\"))
  (:FILE \"src/series/events.lisp\" :MD5
   #A((32) BASE-CHAR . \"32b2156739a6f2ca996abb91df0a2603\"))
  (:FILE \"src/series/io-events.lisp\" :MD5
   #A((32) BASE-CHAR . \"b6026a8b7bb64b45c37a65effda70d8e\"))
  (:FILE \"src/series/ownership.lisp\" :MD5
   #A((32) BASE-CHAR . \"de1aca16a35d34d16aba12ff541c0d2b\"))
  (:FILE \"src/series/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"09653c7479e1498d1545f3f1f0ffd755\"))
  (:FILE \"src/series/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6977aba53c811ec3a373226f9f53795\"))
  (:FILE \"src/series/query.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb0d91405325b508e6b2ab24d178de7a\"))
  (:FILE \"src/series/retirement.lisp\" :MD5
   #A((32) BASE-CHAR . \"b8e04971b8ad75a1bd0c722997badfd2\"))
  (:FILE \"src/series/routing-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6924deff152b941bd49f0bb200b4197\"))
  (:FILE \"src/series/routing-select.lisp\" :MD5
   #A((32) BASE-CHAR . \"e0f987d8767744050ec4d1b3ecb699ed\"))
  (:FILE \"src/series/routing-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"ce649df47dd38888d5103c98345f7e41\"))
  (:FILE \"src/series/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab19ec8d15af91511e817858c41cebc8\"))
  (:FILE \"src/series/worker-boundary.lisp\" :MD5
   #A((32) BASE-CHAR . \"2340e0c9074f7b1bf80c74f774986bc5\"))
  (:FILE \"src/series/worker-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"a93ce2e84e8aee647b5083ad1d2b899b\"))
  (:FILE \"src/series/worker-run.lisp\" :MD5
   #A((32) BASE-CHAR . \"f0fee18adf357bad98e8a3c3e8c70c0c\"))
  (:FILE \"src/series/worker-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"2b23d468be0165fa009c5ebd5d1bbe23\"))
  (:FILE \"src/storage/compaction-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"1cda77a357ab2147035993b72d135a37\"))
  (:FILE \"src/storage/control-payload.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb64f806b8d69eb42d865b4abfff0b27\"))
  (:FILE \"src/storage/formats.lisp\" :MD5
   #A((32) BASE-CHAR . \"061147be459d8d3b08c661bd3f91d152\"))
  (:FILE \"src/storage/log-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"b53d27dcc9f4badf18b50519c50bc614\"))
  (:FILE \"src/storage/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"f86bd104f20616a76b42c02227f72844\"))
  (:FILE \"src/storage/payload-record.lisp\" :MD5
   #A((32) BASE-CHAR . \"8c03f9c01dcb30f2d3970a5694968ecf\"))
  (:FILE \"src/storage/payload-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"c4ece3c4fa8d9492d2a80df7c0a4f5a0\"))
  (:FILE \"src/storage/segment-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6812fa59bf8fd1252fbf85a9bfa3896\"))
  (:FILE \"src/wal/builder.lisp\" :MD5
   #A((32) BASE-CHAR . \"a229f76f7036f3573a6e528dcd390a19\"))
  (:FILE \"src/wal/csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"42b990e3b254e6fb488c0ab91b6a6502\"))
  (:FILE \"src/wal/executor.lisp\" :MD5
   #A((32) BASE-CHAR . \"c0340924c9130e14d0e8efedeec078f1\"))
  (:FILE \"src/wal/group.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a0e7c99ab70b4720cbb091156560f5e\"))
  (:FILE \"src/wal/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"96c41b1d417135a24fc65659ea3abe11\"))
  (:FILE \"src/wal/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f799f27a8ac1a4c736c04796c1e543f9\"))
  (:FILE \"tests/codec/cbor-float-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"425bfed06e37f409d59d0f5f029af196\"))
  (:FILE \"tests/codec/cbor-float-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"a8f6600ec087c10e5ec0a43d43edade4\"))
  (:FILE \"tests/codec/cbor-float-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"e62412cb0e838b241383a5c9103dd2c2\"))
  (:FILE \"tests/codec/cbor-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"208ee0d03652de67ad453bdd34d10b62\"))
  (:FILE \"tests/codec/cbor-minimal-edges.lisp\" :MD5
   #A((32) BASE-CHAR . \"392d402b44d04a9ce1c95fef4c4e8bf9\"))
  (:FILE \"tests/codec/cbor-minimal-scan-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"16954ef22a2169e6f9f6de0e9ab187ab\"))
  (:FILE \"tests/codec/cbor-minimal-scan-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"0dfa785451fcfe573019531e00600cc6\"))
  (:FILE \"tests/codec/cbor-minimal-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"34587c10ac32129ac531e0a4f03df9a6\"))
  (:FILE \"tests/codec/cbor-minimal-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"4d7ec43e187859da277b8fb5f66f8e73\"))
  (:FILE \"tests/codec/cbor-minimal-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"9a6a26ae45747211bb795bc323b13770\"))
  (:FILE \"tests/codec/cbor-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"2311a15f8d4af90bf341e91e0e64342b\"))
  (:FILE \"tests/codec/cbor-simple-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"948bfe5924482cccb6624f91be6770e6\"))
  (:FILE \"tests/codec/cbor-simple-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"c4793e5b0e0192c0fe222351d6f1b599\"))
  (:FILE \"tests/codec/cbor-simple-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"808ed81b703fd2cf0ac11d148c3ffc08\"))
  (:FILE \"tests/codec/cbor-string-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6acef83c6cda7e326fd10b4a1d6d6fa6\"))
  (:FILE \"tests/codec/cbor-string-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"8abc0529f331d1fabdec79507cf296ef\"))
  (:FILE \"tests/codec/cbor-string-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"70d9d0d454dd1f296ef6989d3b928842\"))
  (:FILE \"tests/codec/cbor-structure-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"220d386d29b1fa192e06ceebe4ec245c\"))
  (:FILE \"tests/codec/cbor-structure-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"f38848c55b050dae335b0a37657c1f5c\"))
  (:FILE \"tests/codec/cbor-structure.lisp\" :MD5
   #A((32) BASE-CHAR . \"06e6f060aea55a18d06047e5ebabd18e\"))
  (:FILE \"tests/codec/cbor-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e5da97609a2ba58bb35fea24b7518d2b\"))
  (:FILE \"tests/codec/cbor-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"4d7d61509b2ce749fb2331ceeaeeca76\"))
  (:FILE \"tests/codec/cbor-write-roundtrip.lisp\" :MD5
   #A((32) BASE-CHAR . \"646944ef624c06fd86d6a1306041349d\"))
  (:FILE \"tests/codec/cbor-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"13382bdf23e5501e0ca349faf7b05062\"))
  (:FILE \"tests/codec/cbor-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"4926899e278afdd9577e5ef8262ba835\"))
  (:FILE \"tests/codec/cbor-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"dffa6e75d8c3d7f991f6c4460eb8b9bc\"))
  (:FILE \"tests/codec/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"32534fd42dd8124b50b45deefe143eaf\"))
  (:FILE \"tests/codec/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"a71504598cda8e99cd50e229ddd5275b\"))
  (:FILE \"tests/codec/utf8.lisp\" :MD5
   #A((32) BASE-CHAR . \"767ead15603be8dce90f340dbb200d8f\"))
  (:FILE \"tests/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"1d9133c5fd33cb60ff160f468db330f4\"))
  (:FILE \"tests/csn/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e5c151cda2e10e4f9cae46a4326699eb\"))
  (:FILE \"tests/csn/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"087108576603e6cd5b9af14b50475746\"))
  (:FILE \"tests/epochs/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe92ddd79dcaab3d3f7bdf387bf2295e\"))
  (:FILE \"tests/epochs/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"592a2fe2e22214c52d4672d26620980b\"))
  (:FILE \"tests/epochs/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"67cec074bf70074f7f2c6965ef494ba8\"))
  (:FILE \"tests/execution/handoff.lisp\" :MD5
   #A((32) BASE-CHAR . \"f87fdc0f7bd194329c6349026a2f35bb\"))
  (:FILE \"tests/execution/queue.lisp\" :MD5
   #A((32) BASE-CHAR . \"940ebb450bc871f8c2dd7dc9977bb158\"))
  (:FILE \"tests/execution/ready-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"4ccdc0512b3c81837726076d7c795930\"))
  (:FILE \"tests/execution/ready.lisp\" :MD5
   #A((32) BASE-CHAR . \"f6756125a9150b6312dad3e2705b74d3\"))
  (:FILE \"tests/execution/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"bacb1a135c0d73cded57ba21986c8496\"))
  (:FILE \"tests/execution/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"32b6a6578f526b7d4bcc3a1665a8c6e6\"))
  (:FILE \"tests/execution/worker.lisp\" :MD5
   #A((32) BASE-CHAR . \"bbaa592327d730fdae78cb881350efe0\"))
  (:FILE \"tests/foundation/batch.lisp\" :MD5
   #A((32) BASE-CHAR . \"29fc6a9711ea9265840e8cde4971f74e\"))
  (:FILE \"tests/foundation/binary.lisp\" :MD5
   #A((32) BASE-CHAR . \"07c4c9ac2177f22e5b7fb25f9867a133\"))
  (:FILE \"tests/foundation/record.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a84ca3aa74ab158c6b7d66886cf8b23\"))
  (:FILE \"tests/foundation/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"758adad069aec2f9dbe0635797314ff6\"))
  (:FILE \"tests/get-directory/construction.lisp\" :MD5
   #A((32) BASE-CHAR . \"1137938073e71d6d8d62c751fbad05d5\"))
  (:FILE \"tests/get-directory/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"d1ab36d05cc1266e4533d27c693f12f4\"))
  (:FILE \"tests/get-directory/series-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"486604b450bfe8de32feaed1a96dc0cc\"))
  (:FILE \"tests/get-directory/series-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"092192d05b3f85c6c283113c57c02f01\"))
  (:FILE \"tests/get-directory/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"3f868ebe4307ad4238b314c37eceed9a\"))
  (:FILE \"tests/get-directory/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"63dd01c852de1399c2c82274d481d257\"))
  (:FILE \"tests/get-performance/guards.lisp\" :MD5
   #A((32) BASE-CHAR . \"324c70304e678cbe022ff33c73f793e2\"))
  (:FILE \"tests/get-performance/paths.lisp\" :MD5
   #A((32) BASE-CHAR . \"eb48216a4b5baa9cf498968ee032b205\"))
  (:FILE \"tests/get-performance/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"1f5f9fa3ffcc3220f10b7a5f294ee6d9\"))
  (:FILE \"tests/get-performance/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"916e5740db5d52fdf6088694f34d11db\"))
  (:FILE \"tests/get-resolver/construction.lisp\" :MD5
   #A((32) BASE-CHAR . \"a64a6a5a34c8ec5f8c4ca4324cc348d2\"))
  (:FILE \"tests/get-resolver/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"e93c7dbf1bf2d7e99651b110a4e01661\"))
  (:FILE \"tests/get-resolver/sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"ffe3551bb49dd60d7d34213c9c93cf06\"))
  (:FILE \"tests/get-resolver/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"0738e161d276394a160a86ed139610f2\"))
  (:FILE \"tests/get/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"3a4bbc3fd3ede5a837f0c0f913637291\"))
  (:FILE \"tests/get/segment.lisp\" :MD5
   #A((32) BASE-CHAR . \"2f25d1904aa4960ce0d6351580a2bcc7\"))
  (:FILE \"tests/get/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"660783988d4f99d0e171bb59c79e3467\"))
  (:FILE \"tests/hash/guards.lisp\" :MD5
   #A((32) BASE-CHAR . \"a59d531a156fc49c39c9265075bd9600\"))
  (:FILE \"tests/hash/hash64.lisp\" :MD5
   #A((32) BASE-CHAR . \"443fdc895f2fa3620d2b1b4af5c32dc4\"))
  (:FILE \"tests/hash/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"40b223712554582c2910971a6b045149\"))
  (:FILE \"tests/hash/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"73ed0785ca1330d69ad336abc019a413\"))
  (:FILE \"tests/index/hash-digests.lisp\" :MD5
   #A((32) BASE-CHAR . \"91c1eda35e14276e795259bceac489be\"))
  (:FILE \"tests/index/primary-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"44e2635d88de3f6ccf69c684c3eff77b\"))
  (:FILE \"tests/index/primary-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"4d339c2f2680e66ac79ecd8d02c09382\"))
  (:FILE \"tests/index/primary.lisp\" :MD5
   #A((32) BASE-CHAR . \"6ed661242a86117dd2d696e374740a2f\"))
  (:FILE \"tests/index/rebuild.lisp\" :MD5
   #A((32) BASE-CHAR . \"262556582cc0c387d6c59b757d9956b1\"))
  (:FILE \"tests/index/slot-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6ed9249e2eaef3524260804ef7e02567\"))
  (:FILE \"tests/index/slot-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"e9b53e6eac6fc836e8243d41adbafea0\"))
  (:FILE \"tests/index/slots.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe094b4513ceabe8571031ac20935e48\"))
  (:FILE \"tests/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"1e6fd9ab36eb4e307207d371ed947757\"))
  (:FILE \"tests/io/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"a26526e87fe46794b8bbab1fdd46d68c\"))
  (:FILE \"tests/io/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab2fb36682dd8b8bc757e586ceb3be62\"))
  (:FILE \"tests/lint-fixtures/bad.lisp\" :MD5
   #A((32) BASE-CHAR . \"30f1396c941dd9b8a41ca15698b5a347\"))
  (:FILE \"tests/lint-fixtures/good.lisp\" :MD5
   #A((32) BASE-CHAR . \"f85250c3a057c851db6745b9eba27da1\"))
  (:FILE \"tests/lint-fixtures/keyword-barrier.lisp\" :MD5
   #A((32) BASE-CHAR . \"9f63fdfdf866f17d5491390b710ebb5e\"))
  (:FILE \"tests/lint-fixtures/qualified-reader.lisp\" :MD5
   #A((32) BASE-CHAR . \"7fc689336bb2041dfef4c22090bb7de4\"))
  (:FILE \"tests/mvcc/capture.lisp\" :MD5
   #A((32) BASE-CHAR . \"1f0309fa9258eb62a45167de5d2279d5\"))
  (:FILE \"tests/mvcc/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"341627288b50485858efedc207fc95b5\"))
  (:FILE \"tests/mvcc/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e7d26bd67650663c88ceda526023ae83\"))
  (:FILE \"tests/read/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"73dab63d8414998d72f6c14e0d62e3ac\"))
  (:FILE \"tests/read/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"0d5db03bd804747de7c309c82e40dd43\"))
  (:FILE \"tests/read/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"0cf2cad12c77c82b827da01782bc996d\"))
  (:FILE \"tests/recovery/corruption.lisp\" :MD5
   #A((32) BASE-CHAR . \"a369b8176d4e877ab546d17e983b94ed\"))
  (:FILE \"tests/recovery/decisions-audit.lisp\" :MD5
   #A((32) BASE-CHAR . \"33b98cf215d1ddb469d02cc6c0032bfe\"))
  (:FILE \"tests/recovery/decisions-radix.lisp\" :MD5
   #A((32) BASE-CHAR . \"58eec0feac01e643c76ad19ef5c07df5\"))
  (:FILE \"tests/recovery/decisions-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"80348d0ce2adbc8a4d37db49df291b1d\"))
  (:FILE \"tests/recovery/decisions.lisp\" :MD5
   #A((32) BASE-CHAR . \"5add0e087181bad8ce330af23fc26686\"))
  (:FILE \"tests/recovery/inventory-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"522afcdc6115fdd4d8fec0d06aab7354\"))
  (:FILE \"tests/recovery/inventory.lisp\" :MD5
   #A((32) BASE-CHAR . \"9c78925dd89e94d86a9f577e0225eeb3\"))
  (:FILE \"tests/recovery/manifest-audit.lisp\" :MD5
   #A((32) BASE-CHAR . \"3ca73a199708e2571da3a27e6dc00c76\"))
  (:FILE \"tests/recovery/manifest-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"3286e0dfb66496aafe8b6fbbdd92ab43\"))
  (:FILE \"tests/recovery/manifest.lisp\" :MD5
   #A((32) BASE-CHAR . \"b6bdcc4d20f7db14c0dc00d5258cbf8c\"))
  (:FILE \"tests/recovery/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"aa7af12d270673b62542d32ec60b361a\"))
  (:FILE \"tests/recovery/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"769bac1994a5e3d74bd56b510970bf9b\"))
  (:FILE \"tests/scheduler/controller.lisp\" :MD5
   #A((32) BASE-CHAR . \"bc20dcd712332fde961fb38e879392b5\"))
  (:FILE \"tests/scheduler/dispatch.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab3ffa543f0bfe8d98e1a0fc068ccb7e\"))
  (:FILE \"tests/scheduler/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"1388f446bce5085439c2254edd165118\"))
  (:FILE \"tests/scheduler/pool-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"aaba914dea485f812a11767addb94c81\"))
  (:FILE \"tests/scheduler/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"34e51e369859bc1c731d73e43053b6f4\"))
  (:FILE \"tests/series/boundaries.lisp\" :MD5
   #A((32) BASE-CHAR . \"6967c7e6396b6df38c637f2d5d9ebfc0\"))
  (:FILE \"tests/series/controller.lisp\" :MD5
   #A((32) BASE-CHAR . \"a83818568a27c52d36365597d7113c09\"))
  (:FILE \"tests/series/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6aa566720d1476d13a0f7288be9e1346\"))
  (:FILE \"tests/series/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"67718445a8948da3c7875f6cc6b3e167\"))
  (:FILE \"tests/series/worker-bridge.lisp\" :MD5
   #A((32) BASE-CHAR . \"c714c8db7998acf60256b318488574d8\"))
  (:FILE \"tests/series/worker-routing.lisp\" :MD5
   #A((32) BASE-CHAR . \"f839733b6f5a4d9286a5cdd7ae9bcb55\"))
  (:FILE \"tests/smoke.lisp\" :MD5
   #A((32) BASE-CHAR . \"afb2e2bc7ff7249ebb2e1ccf0f87aaf3\"))
  (:FILE \"tests/storage/compaction-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb4acb5a73eb973f53ef337113880d32\"))
  (:FILE \"tests/storage/control-payload.lisp\" :MD5
   #A((32) BASE-CHAR . \"25f3c822273c898d2263ceb3db538cab\"))
  (:FILE \"tests/storage/log-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"eecb2fe94e710a918254e5ad453a0daa\"))
  (:FILE \"tests/storage/segment-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab2c52fb6b79702d50dcef6d12ca8906\"))
  (:FILE \"tests/storage/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"82a4dbb4767c17f9851143a637af3b83\"))
  (:FILE \"tests/wal/builder.lisp\" :MD5
   #A((32) BASE-CHAR . \"0d01e4e18c0a559873fce584a0ac91cd\"))
  (:FILE \"tests/wal/csn-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"ecb2cbf4f7ace32cdaff329476070d60\"))
  (:FILE \"tests/wal/csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"3e2dbc3319b611db090e27493a10fc2c\"))
  (:FILE \"tests/wal/fault.lisp\" :MD5
   #A((32) BASE-CHAR . \"00367366b82918614d84f517f4bb395e\"))
  (:FILE \"tests/wal/group.lisp\" :MD5
   #A((32) BASE-CHAR . \"0ee2462103a749b58488561aeacaac07\"))
  (:FILE \"tests/wal/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"0643b96c5ee339f9826b19150d065ddf\"))
  (:FILE \"tests/wal/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"15952f6b761acea4519abf701bb2346c\"))
  (:FILE \"tools/measure-pool-dispatch.lisp\" :MD5
   #A((32) BASE-CHAR . \"daea2e29c87593dcc7db9949b67ff4f6\")))
 :SOURCE-CONSISTENCY :STABLE :RECORDED-AT 4000917101 :SELF-TEST NIL :SAMPLES
 NIL :CURRENT-REPLICA NIL :SBCL #A((5) BASE-CHAR . \"2.6.9\") :MACHINE
 #A((5) BASE-CHAR . \"ARM64\") :OS #A((6) BASE-CHAR . \"Darwin\") :OS-VERSION
 #A((6) BASE-CHAR . \"27.0.0\") :SAFETY 3 :ITERATIONS 4096 :WARMUP 128 :REPLICAS
 5 :TIMER-UNITS-PER-SECOND 1000000 :CAMPAIGNS
 ((:EMPTY :SHARDS 4 :INITIAL-CURSOR 0 :CALLS-PER-CYCLE 4 :TOKEN 12)
  (:INACTIVE :SHARDS 4 :INITIAL-CURSOR 2 :CALLS-PER-CYCLE 4 :TOKEN 20)
  (:ROUTE-CURRENT :SHARDS 4 :INITIAL-CURSOR 0 :CALLS-PER-CYCLE 4 :TOKEN 28
   :INITIAL-CLAIM-OUTSIDE-CLOCK T :WORKER-PHASE :CLAIMED :LINK-PHASE :IDLE
   :SCALAR-STATE-ORACLE-IN-CYCLE T))
 :TOKEN-FORMULA
 \"sample=N*cycle-token+N*(N-1)/2; EMPTY=12; INACTIVE=20; ROUTE-CURRENT=28\"
 :LIMITS
 (:PREALLOCATED-PRODUCT-AND-INPUTS :STARTUP-CLAIM-DRAIN-AND-GC-EXCLUDED
  :COUNTER-NOT-ABSOLUTE-NONALLOCATION-PROOF :EXTERNAL-LOAD-UNCONTROLLED
  :CLOCK-ZERO-IS-BELOW-RESOLUTION :NO-TIME-THRESHOLD-NO-TUNING-CLAIM
  :EMPTY-IS-LOCAL-OBSERVATION :NO-REAL-QUEUED-CLAIM-MEASURED
  :CURRENT-IS-REPEATED-CLAIMED-LOOKUP-WITH-SCALAR-ORACLES
  :NO-BEGIN-OR-LIVE-LEASE-IN-CLOCK :NO-CONCURRENT-COORDINATOR
  :NO-PHYSICAL-WORKER-LIFECYCLE-QUALIFICATION))
")
  (:PATH
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-measure/tool-selftest-dev-02.stderr")
   :BYTES 0 :SHA256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" :GIT-BLOB
   "e69de29bb2d1d6434b8b29ae775ad8c2e48c5391" :TEXT "")
  (:PATH
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-measure/tool-selftest-dev-02.stdout")
   :BYTES 72255 :SHA256 "e7ab0173a3cd45443877b85ddc3dbc2ba067a2211ff0e1ef6881ee496b34eb0b"
   :GIT-BLOB "dd6f388bccedc225b1794ab39b436f9de1282904" :TEXT
   "(:SCHEMA-VERSION 1 :KIND :POOL-DISPATCH-BENCHMARK :STATUS :OK :STAGE :COMPLETE
 :DIAGNOSTIC NIL :PROCESS-ARGV
 (#A((48) BASE-CHAR . \"/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl\")
  #A((11) BASE-CHAR . \"--self-test\"))
 :TOOL-ARGUMENTS (#A((11) BASE-CHAR . \"--self-test\"))
 :SOURCE-FINGERPRINTS-BEFORE
 ((:FILE \"arcdocdb.asd\" :MD5
   #A((32) BASE-CHAR . \"d942157b93d69b3852e784a9a838fcb9\"))
  (:FILE \"tools/measure-pool-lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"72a85a626ffb60185baf7602d28517e9\"))
  (:FILE \"src/active/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"bf244695c3c14a1a0148517b48052f5d\"))
  (:FILE \"src/active/preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"0ce41661b5cd26fe2edb944cca142f98\"))
  (:FILE \"src/active/prepare.lisp\" :MD5
   #A((32) BASE-CHAR . \"e3238a39b721a3a5ac1055bc1a30feba\"))
  (:FILE \"src/active/source.lisp\" :MD5
   #A((32) BASE-CHAR . \"50c6d9f4e4eb68c8018acb6a3fe70c8e\"))
  (:FILE \"src/active/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe47862290f99d6217361f4302e2faf2\"))
  (:FILE \"src/cache/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"5d70197c8b64ad6f20c8be47a60c73ca\"))
  (:FILE \"src/cache/clock.lisp\" :MD5
   #A((32) BASE-CHAR . \"3546cf7f5c5ed138068548c20064f499\"))
  (:FILE \"src/cache/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"72f3a33ce27ddf94c49c495580520004\"))
  (:FILE \"src/cache/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1f6a8e7aa4faed88e984b39871d1e53\"))
  (:FILE \"src/cache/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"82f937b7b08bd1696ad9c88da2e1c60c\"))
  (:FILE \"src/cache/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a25648d870eaa4f0b6e1e3b2cf76e28e\"))
  (:FILE \"src/cache/write.lisp\" :MD5
   #A((32) BASE-CHAR . \"fc09021f74fb50aac57589614dae04d7\"))
  (:FILE \"src/codec/cbor-float-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"bc7a7b176e8cdd361b7c4306a1a4de4b\"))
  (:FILE \"src/codec/cbor-float-narrow.lisp\" :MD5
   #A((32) BASE-CHAR . \"c15cc9d91355860357ed434e58d1f4cb\"))
  (:FILE \"src/codec/cbor-float-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"f3b22be81a36e1713c34e890c82c6700\"))
  (:FILE \"src/codec/cbor-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"6e8c6a49314c2f460aa6f8a1759200b6\"))
  (:FILE \"src/codec/cbor-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"ecd8fe950344059c629927b38fb6e4aa\"))
  (:FILE \"src/codec/cbor-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"2dee1a475a1c6edb13b60430fbc0668e\"))
  (:FILE \"src/codec/cbor-scan-input.lisp\" :MD5
   #A((32) BASE-CHAR . \"f6488e987889432b375254021825dbe5\"))
  (:FILE \"src/codec/cbor-scan-items.lisp\" :MD5
   #A((32) BASE-CHAR . \"706c0baa4158bf272c4b0df17c1439d2\"))
  (:FILE \"src/codec/cbor-scan-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"987e8ed576a21eb644ac1ef2e06edbda\"))
  (:FILE \"src/codec/cbor-scan-stack.lisp\" :MD5
   #A((32) BASE-CHAR . \"cf1999ddb10f879aeefbeea853742d57\"))
  (:FILE \"src/codec/cbor-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"0c33aedcdb352e78a3c694cf796e6692\"))
  (:FILE \"src/codec/cbor-simple-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"200373402e6e082dd8c7afde305302bb\"))
  (:FILE \"src/codec/cbor-space.lisp\" :MD5
   #A((32) BASE-CHAR . \"c33cdcc45f45218aa3e8bf26ce0ee575\"))
  (:FILE \"src/codec/cbor-string-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"b13e92b5f24a42fe283c17b649722b6a\"))
  (:FILE \"src/codec/cbor-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"69e77bcd15b5413a815a65c5081229db\"))
  (:FILE \"src/codec/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d885bd2a9860eb60aec1a775e5031d5e\"))
  (:FILE \"src/codec/utf8.lisp\" :MD5
   #A((32) BASE-CHAR . \"0f67dd5c51bf6a63bc292ab4e2a280c2\"))
  (:FILE \"src/control/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"8f3dc4a9657b6bb760e31c46c1e7b986\"))
  (:FILE \"src/control/dependency.lisp\" :MD5
   #A((32) BASE-CHAR . \"22ae34181e8ab96d8c8ecab050a1a19e\"))
  (:FILE \"src/control/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"3cedb51e60b92524cd8208e4bfb2c3ba\"))
  (:FILE \"src/control/preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"2dfc2b76c1d3c382db8b50071bdaeadf\"))
  (:FILE \"src/control/prepare.lisp\" :MD5
   #A((32) BASE-CHAR . \"9df8dc8a19d2a4bc700adfed763c27fa\"))
  (:FILE \"src/control/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"468fcf430eede17a38b922dfd373a746\"))
  (:FILE \"src/control/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d15317bafcdb12ea579b2f482dff57c\"))
  (:FILE \"src/csn/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1130012fc5613a5648d22ed8628be0e8\"))
  (:FILE \"src/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1cdb5661fc54beba5bf00e4765f3235\"))
  (:FILE \"src/dispatch/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"ba4cd961094f37a157d49b8d7024b677\"))
  (:FILE \"src/dispatch/claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"b10caeff4f726c0ebd01e2c6d1baacba\"))
  (:FILE \"src/dispatch/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"46e12ac1f6ab8591bac6467f724538a2\"))
  (:FILE \"src/dispatch/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"36db6694bc70963149b8068ae7ab96ec\"))
  (:FILE \"src/epochs/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"765d14c88cd288093a77a57930cd6999\"))
  (:FILE \"src/epochs/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"875201dfab0a84efd40fe9828cc293c8\"))
  (:FILE \"src/epochs/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"975b5f74e0c5a38ce978f4d9c7fcc6b8\"))
  (:FILE \"src/epochs/reclaim.lisp\" :MD5
   #A((32) BASE-CHAR . \"036dd02adf87d33c3ae2f40735c733fa\"))
  (:FILE \"src/epochs/retire.lisp\" :MD5
   #A((32) BASE-CHAR . \"653b974f310c09f6e2224a84acc43bbf\"))
  (:FILE \"src/epochs/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"82253491f995f5bc153fb5ebf30d564c\"))
  (:FILE \"src/execution/handoff.lisp\" :MD5
   #A((32) BASE-CHAR . \"6b85eebe69366e78ed5fc5cc20735f00\"))
  (:FILE \"src/execution/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb5710d6c111cadb7121a50998a747fa\"))
  (:FILE \"src/execution/queue.lisp\" :MD5
   #A((32) BASE-CHAR . \"8202843bddb817da4279ac959ae3f3c4\"))
  (:FILE \"src/execution/ready-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"38d26f8c749dd946dfc4b9c57103a892\"))
  (:FILE \"src/execution/ready-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a64d98c9ff429d6103d6e10ee1fd7980\"))
  (:FILE \"src/execution/ready.lisp\" :MD5
   #A((32) BASE-CHAR . \"2c1892002f0599bb8273093031017520\"))
  (:FILE \"src/execution/worker-boundary.lisp\" :MD5
   #A((32) BASE-CHAR . \"c24065d6c8d80d1be53994a0041743df\"))
  (:FILE \"src/execution/worker-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"babd0a78b4185af24ae1fef870c0fabb\"))
  (:FILE \"src/execution/worker-run.lisp\" :MD5
   #A((32) BASE-CHAR . \"aa34ca6bc07535e35fea723878d99f66\"))
  (:FILE \"src/execution/worker-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"0679ee07c46f69db330706303c70d8d2\"))
  (:FILE \"src/execution/writer.lisp\" :MD5
   #A((32) BASE-CHAR . \"73019644090e2971f2b54dc36e4491f5\"))
  (:FILE \"src/foundation/batch.lisp\" :MD5
   #A((32) BASE-CHAR . \"ca642ea47e4bff76f78f5b6d7287d6bd\"))
  (:FILE \"src/foundation/binary.lisp\" :MD5
   #A((32) BASE-CHAR . \"a06115175f450776762761dce25acdb8\"))
  (:FILE \"src/foundation/conditions.lisp\" :MD5
   #A((32) BASE-CHAR . \"942b596396c19815290a57830af2121b\"))
  (:FILE \"src/foundation/crc32c.lisp\" :MD5
   #A((32) BASE-CHAR . \"4db58e2f48bf77d751f1b83bb9f84b5c\"))
  (:FILE \"src/foundation/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"5ee593a112958d94163dab17c5aa4ba2\"))
  (:FILE \"src/foundation/record.lisp\" :MD5
   #A((32) BASE-CHAR . \"c3ed0f09fa3fa6fe20c98e2ed6e69abe\"))
  (:FILE \"src/get-directory/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"cde24b2bf5c5637d5501b95bed47df31\"))
  (:FILE \"src/get-directory/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a05062f6ab6d5ebdfdde37e336dfce6\"))
  (:FILE \"src/get-directory/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"74a694385f1aaf03ec87721545494119\"))
  (:FILE \"src/get-directory/sources-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"2b8193aab6801de19e26fa55e7c53f87\"))
  (:FILE \"src/get-directory/sources-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"7bac02a80ddc22c622f8465642385ae8\"))
  (:FILE \"src/get-directory/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"17c957d6934a31f4ed64313e756de2d2\"))
  (:FILE \"src/get-resolver/active-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"c65593cf172f53a8e90a853bbe9504c2\"))
  (:FILE \"src/get-resolver/active-directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"6d95f29b331d335175843f47ae44a6ea\"))
  (:FILE \"src/get-resolver/active-init.lisp\" :MD5
   #A((32) BASE-CHAR . \"7ca975d2534f43c8018d36ecd7c2b042\"))
  (:FILE \"src/get-resolver/active-preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"f13d422adb6aa9e8489352884137f25a\"))
  (:FILE \"src/get-resolver/active-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"521737861e057d663964b0c030552587\"))
  (:FILE \"src/get-resolver/active-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6aaec49504a96f37c8ff1bc182c977b\"))
  (:FILE \"src/get-resolver/active-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"60bb258cf4cc7f50c5c1206af1bb5800\"))
  (:FILE \"src/get-resolver/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"bbfb2082103e6712419e180ab972245c\"))
  (:FILE \"src/get-resolver/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"263525e8274a8f46ce58a4a0ad6841a2\"))
  (:FILE \"src/get-resolver/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"1339edff0223dbf122f11ff0adbba61c\"))
  (:FILE \"src/get-resolver/rows.lisp\" :MD5
   #A((32) BASE-CHAR . \"ca9002b81efd0aed9761cd1f78514762\"))
  (:FILE \"src/get-resolver/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"536e9dc4ed51072b8a6d1528d3ec18bf\"))
  (:FILE \"src/get-resolver/sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d869293ba47444c4721713d955c6254\"))
  (:FILE \"src/get-resolver/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"9df13bcc6908e9fa601d173a671e1ccf\"))
  (:FILE \"src/get/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"c5cc36884b238221cc13ca0c087ec7c2\"))
  (:FILE \"src/get/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"e70bfeddd694336bbd088e65f8761834\"))
  (:FILE \"src/get/lookup.lisp\" :MD5
   #A((32) BASE-CHAR . \"82258ec87aca513a508bc5dee8410dd6\"))
  (:FILE \"src/get/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"c72633d15c3488699072eb610ebde7c8\"))
  (:FILE \"src/get/segment.lisp\" :MD5
   #A((32) BASE-CHAR . \"811869eb6a197d3c4e26af4322e52652\"))
  (:FILE \"src/get/target.lisp\" :MD5
   #A((32) BASE-CHAR . \"1b70dac05d6d2418909eb5105b808e81\"))
  (:FILE \"src/get/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"c394e5684de5e2d938991c7cb348b93c\"))
  (:FILE \"src/hash/arithmetic.lisp\" :MD5
   #A((32) BASE-CHAR . \"b5c51802e607e3dd22de68204baf64e9\"))
  (:FILE \"src/hash/blocks.lisp\" :MD5
   #A((32) BASE-CHAR . \"bef497b9a267c7306d4100000491c814\"))
  (:FILE \"src/hash/hash64.lisp\" :MD5
   #A((32) BASE-CHAR . \"886b7c08b9929283e8968831cbe5c039\"))
  (:FILE \"src/hash/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d9060e41bc5252067d35e59ac70ee06\"))
  (:FILE \"src/index/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"65076c355c099b5dc73d185948d3bec4\"))
  (:FILE \"src/index/hash-digests.lisp\" :MD5
   #A((32) BASE-CHAR . \"43d2209225707352daec6186ef95a805\"))
  (:FILE \"src/index/hash-seed.lisp\" :MD5
   #A((32) BASE-CHAR . \"45ce41749bc6fa638539815d3f802b96\"))
  (:FILE \"src/index/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"598a9b65e73151c924b2cdcaf6d96705\"))
  (:FILE \"src/index/primary-arena.lisp\" :MD5
   #A((32) BASE-CHAR . \"a319691e3e28b7ea7b927de490cf69ba\"))
  (:FILE \"src/index/primary-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"ff2cfbb865290d7a1510fdf6877c7229\"))
  (:FILE \"src/index/primary-core.lisp\" :MD5
   #A((32) BASE-CHAR . \"fa52433eae199ceeb874bf2bc47afca7\"))
  (:FILE \"src/index/primary-directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"1dd67c527257e43f17e006644ecdbd00\"))
  (:FILE \"src/index/primary-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d65cfce399b04f905bf969929962e59a\"))
  (:FILE \"src/index/primary-probe.lisp\" :MD5
   #A((32) BASE-CHAR . \"699ce3f1615296fc27fcde3e0d63a4bc\"))
  (:FILE \"src/index/primary-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"3f317a0d3c5ee86a73651aad36135cc3\"))
  (:FILE \"src/index/primary-relocate.lisp\" :MD5
   #A((32) BASE-CHAR . \"5155959766645d3172ae5e73c58cc071\"))
  (:FILE \"src/index/primary-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a59eab6425a60fa2656f86bf87d5c9ac\"))
  (:FILE \"src/index/primary-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"e8e31e599356e592af29c0cc4604872b\"))
  (:FILE \"src/index/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"5b22b90cfe8534086f6aff96d156713e\"))
  (:FILE \"src/index/rebuild-budget.lisp\" :MD5
   #A((32) BASE-CHAR . \"0417dd41cb3ec1d62dfd913c19f810ad\"))
  (:FILE \"src/index/rebuild-copy.lisp\" :MD5
   #A((32) BASE-CHAR . \"8befbbd00ed5c31c1487a11887eba495\"))
  (:FILE \"src/index/rebuild-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"1188e7a64a7a5d9482c1233cb9acb452\"))
  (:FILE \"src/index/rebuild.lisp\" :MD5
   #A((32) BASE-CHAR . \"a450cac8071513365267e7024cbe94b0\"))
  (:FILE \"src/index/relocate.lisp\" :MD5
   #A((32) BASE-CHAR . \"475dd7d5809a836f01544b447cc8df27\"))
  (:FILE \"src/index/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"5157fd03ee806ee998ad8f0002d56268\"))
  (:FILE \"src/index/validation.lisp\" :MD5
   #A((32) BASE-CHAR . \"3384cadf737c7d80c004222022a281f6\"))
  (:FILE \"src/index/write.lisp\" :MD5
   #A((32) BASE-CHAR . \"f0c8c579cd7db466d243ed3ea9f8e8aa\"))
  (:FILE \"src/io/flush.lisp\" :MD5
   #A((32) BASE-CHAR . \"716866194d6b9f076e102e84187229c0\"))
  (:FILE \"src/io/identity-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"d354a095fb378c1b6f27397ffb902227\"))
  (:FILE \"src/io/identity.lisp\" :MD5
   #A((32) BASE-CHAR . \"4e03b14a0c5015dc6ec897221c9f0eb5\"))
  (:FILE \"src/io/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"11c7103efbe733bbf0a13927f23c3d34\"))
  (:FILE \"src/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"58030bc0c811248a6537e2909d8762d6\"))
  (:FILE \"src/io/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"7aafde7081a3804862c3acf446e6e385\"))
  (:FILE \"src/io/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"2f8bd851d09ab994d8d01b231697d1a1\"))
  (:FILE \"src/io/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"e7b6ee5fd2d57281dbd32bf9b07d0fa6\"))
  (:FILE \"src/mvcc/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"f188d1dbd5d0adb49f53acf09157aef9\"))
  (:FILE \"src/mvcc/snapshots-core.lisp\" :MD5
   #A((32) BASE-CHAR . \"8bb066aab61a18eff175b9edb11e42a2\"))
  (:FILE \"src/mvcc/snapshots-csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"0e9365e674d1584b111f915ce1f58634\"))
  (:FILE \"src/mvcc/snapshots-lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"ff98aea5cb9a7ae2671f6a887a003725\"))
  (:FILE \"src/mvcc/snapshots-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"ae3ad96269b5e711a9dbb455f3c0ce48\"))
  (:FILE \"src/mvcc/snapshots-register.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d5a795bcefd605c75da91c725ae83a2\"))
  (:FILE \"src/mvcc/snapshots-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"475517bd7ba04a1c37a82efeb8ff73d9\"))
  (:FILE \"src/mvcc/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a9bc70eab6720b5c6f8503178e2c966b\"))
  (:FILE \"src/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"becf5c78049c85f2c05cd1ef54454032\"))
  (:FILE \"src/read/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"4040905f4a64ba704a480d82e87ec748\"))
  (:FILE \"src/read/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"7d74d9decc5a0bc9f9331d89bd503e21\"))
  (:FILE \"src/read/task.lisp\" :MD5
   #A((32) BASE-CHAR . \"9e0baf22c53329d393e047c669679645\"))
  (:FILE \"src/read/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"9c37ff8237fcc9fe9ae4f44316e854e3\"))
  (:FILE \"src/recovery/decisions-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"1a51ef4a488bb9fde2ff7d47bae01379\"))
  (:FILE \"src/recovery/decisions-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"cbdc30f93109c474e1fc25066c9b9b13\"))
  (:FILE \"src/recovery/decisions-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"f782d1137b8ce342b91c9999cfb7accc\"))
  (:FILE \"src/recovery/decisions-radix.lisp\" :MD5
   #A((32) BASE-CHAR . \"852149de4c289b8e067602780378d87a\"))
  (:FILE \"src/recovery/decisions-sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"b33e57a643f2fca810846f6226366253\"))
  (:FILE \"src/recovery/decisions-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f4433fd19ebc7239dbc2628c39f3ecdb\"))
  (:FILE \"src/recovery/inventory-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"9bd6820c4feba3e552aab1a4edd87861\"))
  (:FILE \"src/recovery/inventory-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"fcea263de1938767772e5b11411ecd5e\"))
  (:FILE \"src/recovery/inventory-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"78c136d5838dcfe3019d9069643a8d8f\"))
  (:FILE \"src/recovery/manifest-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"bf65b1731eab6e0572461ef5cc60fc40\"))
  (:FILE \"src/recovery/manifest-decode.lisp\" :MD5
   #A((32) BASE-CHAR . \"67975249aaabd751757cdfb9222cc3c4\"))
  (:FILE \"src/recovery/manifest-fold.lisp\" :MD5
   #A((32) BASE-CHAR . \"e0d2498db1011e857b7b0daa1934f187\"))
  (:FILE \"src/recovery/manifest-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"37ace42844c11b52446ee1fc500b8e0b\"))
  (:FILE \"src/recovery/manifest-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"ebd7a54adea2213294a887e6d4db0927\"))
  (:FILE \"src/recovery/manifest-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"7b1d4054415faca7e5fca59ad83b4d4a\"))
  (:FILE \"src/recovery/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1c1c8ad0cd15b1703a2fe19cbf3f13c2\"))
  (:FILE \"src/recovery/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"fcacd15460db25ea9cc4036065f9f096\"))
  (:FILE \"src/scheduler/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"36c5ae2dd08fbe546f4392b7b12102ec\"))
  (:FILE \"src/scheduler/lifecycle-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"1c4a4fd316ef034c298db47dfca1daca\"))
  (:FILE \"src/scheduler/lifecycle-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"19c8be44863be30c07bb72fe3fac2a99\"))
  (:FILE \"src/scheduler/lifecycle-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"fa2f88c50dfec24af40af091f9221590\"))
  (:FILE \"src/scheduler/lifecycle-update.lisp\" :MD5
   #A((32) BASE-CHAR . \"40a78461f91616a935a39f29b87680c8\"))
  (:FILE \"src/scheduler/lifecycle-worker.lisp\" :MD5
   #A((32) BASE-CHAR . \"9d7cdf45c1b594fef5af735ec0955c05\"))
  (:FILE \"src/scheduler/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"0578c541b6ddfaf8827240e967ff76ea\"))
  (:FILE \"src/scheduler/policy.lisp\" :MD5
   #A((32) BASE-CHAR . \"1721005a7545b36df601d75252638eba\"))
  (:FILE \"src/scheduler/pool-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"c4995b29d40caa2ee29aa0c167885287\"))
  (:FILE \"src/scheduler/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"170dfc36aef6a3d78f980fbcc37f0176\"))
  (:FILE \"src/scheduler/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"981f9f6db268cd9a46d4239c677c5d5b\"))
  (:FILE \"src/scheduler/update.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a43e6b400b701c69286357ef85469fc\"))
  (:FILE \"src/series/events.lisp\" :MD5
   #A((32) BASE-CHAR . \"32b2156739a6f2ca996abb91df0a2603\"))
  (:FILE \"src/series/io-events.lisp\" :MD5
   #A((32) BASE-CHAR . \"b6026a8b7bb64b45c37a65effda70d8e\"))
  (:FILE \"src/series/ownership.lisp\" :MD5
   #A((32) BASE-CHAR . \"de1aca16a35d34d16aba12ff541c0d2b\"))
  (:FILE \"src/series/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"09653c7479e1498d1545f3f1f0ffd755\"))
  (:FILE \"src/series/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6977aba53c811ec3a373226f9f53795\"))
  (:FILE \"src/series/query.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb0d91405325b508e6b2ab24d178de7a\"))
  (:FILE \"src/series/retirement.lisp\" :MD5
   #A((32) BASE-CHAR . \"b8e04971b8ad75a1bd0c722997badfd2\"))
  (:FILE \"src/series/routing-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6924deff152b941bd49f0bb200b4197\"))
  (:FILE \"src/series/routing-select.lisp\" :MD5
   #A((32) BASE-CHAR . \"e0f987d8767744050ec4d1b3ecb699ed\"))
  (:FILE \"src/series/routing-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"ce649df47dd38888d5103c98345f7e41\"))
  (:FILE \"src/series/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab19ec8d15af91511e817858c41cebc8\"))
  (:FILE \"src/series/worker-boundary.lisp\" :MD5
   #A((32) BASE-CHAR . \"2340e0c9074f7b1bf80c74f774986bc5\"))
  (:FILE \"src/series/worker-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"a93ce2e84e8aee647b5083ad1d2b899b\"))
  (:FILE \"src/series/worker-run.lisp\" :MD5
   #A((32) BASE-CHAR . \"f0fee18adf357bad98e8a3c3e8c70c0c\"))
  (:FILE \"src/series/worker-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"2b23d468be0165fa009c5ebd5d1bbe23\"))
  (:FILE \"src/storage/compaction-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"1cda77a357ab2147035993b72d135a37\"))
  (:FILE \"src/storage/control-payload.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb64f806b8d69eb42d865b4abfff0b27\"))
  (:FILE \"src/storage/formats.lisp\" :MD5
   #A((32) BASE-CHAR . \"061147be459d8d3b08c661bd3f91d152\"))
  (:FILE \"src/storage/log-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"b53d27dcc9f4badf18b50519c50bc614\"))
  (:FILE \"src/storage/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"f86bd104f20616a76b42c02227f72844\"))
  (:FILE \"src/storage/payload-record.lisp\" :MD5
   #A((32) BASE-CHAR . \"8c03f9c01dcb30f2d3970a5694968ecf\"))
  (:FILE \"src/storage/payload-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"c4ece3c4fa8d9492d2a80df7c0a4f5a0\"))
  (:FILE \"src/storage/segment-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6812fa59bf8fd1252fbf85a9bfa3896\"))
  (:FILE \"src/wal/builder.lisp\" :MD5
   #A((32) BASE-CHAR . \"a229f76f7036f3573a6e528dcd390a19\"))
  (:FILE \"src/wal/csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"42b990e3b254e6fb488c0ab91b6a6502\"))
  (:FILE \"src/wal/executor.lisp\" :MD5
   #A((32) BASE-CHAR . \"c0340924c9130e14d0e8efedeec078f1\"))
  (:FILE \"src/wal/group.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a0e7c99ab70b4720cbb091156560f5e\"))
  (:FILE \"src/wal/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"96c41b1d417135a24fc65659ea3abe11\"))
  (:FILE \"src/wal/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f799f27a8ac1a4c736c04796c1e543f9\"))
  (:FILE \"tests/codec/cbor-float-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"425bfed06e37f409d59d0f5f029af196\"))
  (:FILE \"tests/codec/cbor-float-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"a8f6600ec087c10e5ec0a43d43edade4\"))
  (:FILE \"tests/codec/cbor-float-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"e62412cb0e838b241383a5c9103dd2c2\"))
  (:FILE \"tests/codec/cbor-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"208ee0d03652de67ad453bdd34d10b62\"))
  (:FILE \"tests/codec/cbor-minimal-edges.lisp\" :MD5
   #A((32) BASE-CHAR . \"392d402b44d04a9ce1c95fef4c4e8bf9\"))
  (:FILE \"tests/codec/cbor-minimal-scan-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"16954ef22a2169e6f9f6de0e9ab187ab\"))
  (:FILE \"tests/codec/cbor-minimal-scan-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"0dfa785451fcfe573019531e00600cc6\"))
  (:FILE \"tests/codec/cbor-minimal-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"34587c10ac32129ac531e0a4f03df9a6\"))
  (:FILE \"tests/codec/cbor-minimal-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"4d7ec43e187859da277b8fb5f66f8e73\"))
  (:FILE \"tests/codec/cbor-minimal-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"9a6a26ae45747211bb795bc323b13770\"))
  (:FILE \"tests/codec/cbor-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"2311a15f8d4af90bf341e91e0e64342b\"))
  (:FILE \"tests/codec/cbor-simple-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"948bfe5924482cccb6624f91be6770e6\"))
  (:FILE \"tests/codec/cbor-simple-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"c4793e5b0e0192c0fe222351d6f1b599\"))
  (:FILE \"tests/codec/cbor-simple-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"808ed81b703fd2cf0ac11d148c3ffc08\"))
  (:FILE \"tests/codec/cbor-string-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6acef83c6cda7e326fd10b4a1d6d6fa6\"))
  (:FILE \"tests/codec/cbor-string-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"8abc0529f331d1fabdec79507cf296ef\"))
  (:FILE \"tests/codec/cbor-string-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"70d9d0d454dd1f296ef6989d3b928842\"))
  (:FILE \"tests/codec/cbor-structure-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"220d386d29b1fa192e06ceebe4ec245c\"))
  (:FILE \"tests/codec/cbor-structure-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"f38848c55b050dae335b0a37657c1f5c\"))
  (:FILE \"tests/codec/cbor-structure.lisp\" :MD5
   #A((32) BASE-CHAR . \"06e6f060aea55a18d06047e5ebabd18e\"))
  (:FILE \"tests/codec/cbor-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e5da97609a2ba58bb35fea24b7518d2b\"))
  (:FILE \"tests/codec/cbor-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"4d7d61509b2ce749fb2331ceeaeeca76\"))
  (:FILE \"tests/codec/cbor-write-roundtrip.lisp\" :MD5
   #A((32) BASE-CHAR . \"646944ef624c06fd86d6a1306041349d\"))
  (:FILE \"tests/codec/cbor-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"13382bdf23e5501e0ca349faf7b05062\"))
  (:FILE \"tests/codec/cbor-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"4926899e278afdd9577e5ef8262ba835\"))
  (:FILE \"tests/codec/cbor-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"dffa6e75d8c3d7f991f6c4460eb8b9bc\"))
  (:FILE \"tests/codec/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"32534fd42dd8124b50b45deefe143eaf\"))
  (:FILE \"tests/codec/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"a71504598cda8e99cd50e229ddd5275b\"))
  (:FILE \"tests/codec/utf8.lisp\" :MD5
   #A((32) BASE-CHAR . \"767ead15603be8dce90f340dbb200d8f\"))
  (:FILE \"tests/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"1d9133c5fd33cb60ff160f468db330f4\"))
  (:FILE \"tests/csn/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e5c151cda2e10e4f9cae46a4326699eb\"))
  (:FILE \"tests/csn/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"087108576603e6cd5b9af14b50475746\"))
  (:FILE \"tests/epochs/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe92ddd79dcaab3d3f7bdf387bf2295e\"))
  (:FILE \"tests/epochs/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"592a2fe2e22214c52d4672d26620980b\"))
  (:FILE \"tests/epochs/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"67cec074bf70074f7f2c6965ef494ba8\"))
  (:FILE \"tests/execution/handoff.lisp\" :MD5
   #A((32) BASE-CHAR . \"f87fdc0f7bd194329c6349026a2f35bb\"))
  (:FILE \"tests/execution/queue.lisp\" :MD5
   #A((32) BASE-CHAR . \"940ebb450bc871f8c2dd7dc9977bb158\"))
  (:FILE \"tests/execution/ready-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"4ccdc0512b3c81837726076d7c795930\"))
  (:FILE \"tests/execution/ready.lisp\" :MD5
   #A((32) BASE-CHAR . \"f6756125a9150b6312dad3e2705b74d3\"))
  (:FILE \"tests/execution/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"bacb1a135c0d73cded57ba21986c8496\"))
  (:FILE \"tests/execution/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"32b6a6578f526b7d4bcc3a1665a8c6e6\"))
  (:FILE \"tests/execution/worker.lisp\" :MD5
   #A((32) BASE-CHAR . \"bbaa592327d730fdae78cb881350efe0\"))
  (:FILE \"tests/foundation/batch.lisp\" :MD5
   #A((32) BASE-CHAR . \"29fc6a9711ea9265840e8cde4971f74e\"))
  (:FILE \"tests/foundation/binary.lisp\" :MD5
   #A((32) BASE-CHAR . \"07c4c9ac2177f22e5b7fb25f9867a133\"))
  (:FILE \"tests/foundation/record.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a84ca3aa74ab158c6b7d66886cf8b23\"))
  (:FILE \"tests/foundation/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"758adad069aec2f9dbe0635797314ff6\"))
  (:FILE \"tests/get-directory/construction.lisp\" :MD5
   #A((32) BASE-CHAR . \"1137938073e71d6d8d62c751fbad05d5\"))
  (:FILE \"tests/get-directory/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"d1ab36d05cc1266e4533d27c693f12f4\"))
  (:FILE \"tests/get-directory/series-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"486604b450bfe8de32feaed1a96dc0cc\"))
  (:FILE \"tests/get-directory/series-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"092192d05b3f85c6c283113c57c02f01\"))
  (:FILE \"tests/get-directory/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"3f868ebe4307ad4238b314c37eceed9a\"))
  (:FILE \"tests/get-directory/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"63dd01c852de1399c2c82274d481d257\"))
  (:FILE \"tests/get-performance/guards.lisp\" :MD5
   #A((32) BASE-CHAR . \"324c70304e678cbe022ff33c73f793e2\"))
  (:FILE \"tests/get-performance/paths.lisp\" :MD5
   #A((32) BASE-CHAR . \"eb48216a4b5baa9cf498968ee032b205\"))
  (:FILE \"tests/get-performance/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"1f5f9fa3ffcc3220f10b7a5f294ee6d9\"))
  (:FILE \"tests/get-performance/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"916e5740db5d52fdf6088694f34d11db\"))
  (:FILE \"tests/get-resolver/construction.lisp\" :MD5
   #A((32) BASE-CHAR . \"a64a6a5a34c8ec5f8c4ca4324cc348d2\"))
  (:FILE \"tests/get-resolver/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"e93c7dbf1bf2d7e99651b110a4e01661\"))
  (:FILE \"tests/get-resolver/sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"ffe3551bb49dd60d7d34213c9c93cf06\"))
  (:FILE \"tests/get-resolver/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"0738e161d276394a160a86ed139610f2\"))
  (:FILE \"tests/get/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"3a4bbc3fd3ede5a837f0c0f913637291\"))
  (:FILE \"tests/get/segment.lisp\" :MD5
   #A((32) BASE-CHAR . \"2f25d1904aa4960ce0d6351580a2bcc7\"))
  (:FILE \"tests/get/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"660783988d4f99d0e171bb59c79e3467\"))
  (:FILE \"tests/hash/guards.lisp\" :MD5
   #A((32) BASE-CHAR . \"a59d531a156fc49c39c9265075bd9600\"))
  (:FILE \"tests/hash/hash64.lisp\" :MD5
   #A((32) BASE-CHAR . \"443fdc895f2fa3620d2b1b4af5c32dc4\"))
  (:FILE \"tests/hash/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"40b223712554582c2910971a6b045149\"))
  (:FILE \"tests/hash/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"73ed0785ca1330d69ad336abc019a413\"))
  (:FILE \"tests/index/hash-digests.lisp\" :MD5
   #A((32) BASE-CHAR . \"91c1eda35e14276e795259bceac489be\"))
  (:FILE \"tests/index/primary-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"44e2635d88de3f6ccf69c684c3eff77b\"))
  (:FILE \"tests/index/primary-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"4d339c2f2680e66ac79ecd8d02c09382\"))
  (:FILE \"tests/index/primary.lisp\" :MD5
   #A((32) BASE-CHAR . \"6ed661242a86117dd2d696e374740a2f\"))
  (:FILE \"tests/index/rebuild.lisp\" :MD5
   #A((32) BASE-CHAR . \"262556582cc0c387d6c59b757d9956b1\"))
  (:FILE \"tests/index/slot-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6ed9249e2eaef3524260804ef7e02567\"))
  (:FILE \"tests/index/slot-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"e9b53e6eac6fc836e8243d41adbafea0\"))
  (:FILE \"tests/index/slots.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe094b4513ceabe8571031ac20935e48\"))
  (:FILE \"tests/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"1e6fd9ab36eb4e307207d371ed947757\"))
  (:FILE \"tests/io/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"a26526e87fe46794b8bbab1fdd46d68c\"))
  (:FILE \"tests/io/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab2fb36682dd8b8bc757e586ceb3be62\"))
  (:FILE \"tests/lint-fixtures/bad.lisp\" :MD5
   #A((32) BASE-CHAR . \"30f1396c941dd9b8a41ca15698b5a347\"))
  (:FILE \"tests/lint-fixtures/good.lisp\" :MD5
   #A((32) BASE-CHAR . \"f85250c3a057c851db6745b9eba27da1\"))
  (:FILE \"tests/lint-fixtures/keyword-barrier.lisp\" :MD5
   #A((32) BASE-CHAR . \"9f63fdfdf866f17d5491390b710ebb5e\"))
  (:FILE \"tests/lint-fixtures/qualified-reader.lisp\" :MD5
   #A((32) BASE-CHAR . \"7fc689336bb2041dfef4c22090bb7de4\"))
  (:FILE \"tests/mvcc/capture.lisp\" :MD5
   #A((32) BASE-CHAR . \"1f0309fa9258eb62a45167de5d2279d5\"))
  (:FILE \"tests/mvcc/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"341627288b50485858efedc207fc95b5\"))
  (:FILE \"tests/mvcc/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e7d26bd67650663c88ceda526023ae83\"))
  (:FILE \"tests/read/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"73dab63d8414998d72f6c14e0d62e3ac\"))
  (:FILE \"tests/read/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"0d5db03bd804747de7c309c82e40dd43\"))
  (:FILE \"tests/read/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"0cf2cad12c77c82b827da01782bc996d\"))
  (:FILE \"tests/recovery/corruption.lisp\" :MD5
   #A((32) BASE-CHAR . \"a369b8176d4e877ab546d17e983b94ed\"))
  (:FILE \"tests/recovery/decisions-audit.lisp\" :MD5
   #A((32) BASE-CHAR . \"33b98cf215d1ddb469d02cc6c0032bfe\"))
  (:FILE \"tests/recovery/decisions-radix.lisp\" :MD5
   #A((32) BASE-CHAR . \"58eec0feac01e643c76ad19ef5c07df5\"))
  (:FILE \"tests/recovery/decisions-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"80348d0ce2adbc8a4d37db49df291b1d\"))
  (:FILE \"tests/recovery/decisions.lisp\" :MD5
   #A((32) BASE-CHAR . \"5add0e087181bad8ce330af23fc26686\"))
  (:FILE \"tests/recovery/inventory-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"522afcdc6115fdd4d8fec0d06aab7354\"))
  (:FILE \"tests/recovery/inventory.lisp\" :MD5
   #A((32) BASE-CHAR . \"9c78925dd89e94d86a9f577e0225eeb3\"))
  (:FILE \"tests/recovery/manifest-audit.lisp\" :MD5
   #A((32) BASE-CHAR . \"3ca73a199708e2571da3a27e6dc00c76\"))
  (:FILE \"tests/recovery/manifest-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"3286e0dfb66496aafe8b6fbbdd92ab43\"))
  (:FILE \"tests/recovery/manifest.lisp\" :MD5
   #A((32) BASE-CHAR . \"b6bdcc4d20f7db14c0dc00d5258cbf8c\"))
  (:FILE \"tests/recovery/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"aa7af12d270673b62542d32ec60b361a\"))
  (:FILE \"tests/recovery/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"769bac1994a5e3d74bd56b510970bf9b\"))
  (:FILE \"tests/scheduler/controller.lisp\" :MD5
   #A((32) BASE-CHAR . \"bc20dcd712332fde961fb38e879392b5\"))
  (:FILE \"tests/scheduler/dispatch.lisp\" :MD5
   #A((32) BASE-CHAR . \"04de15f50e704d29aefb1b42a3d0af7c\"))
  (:FILE \"tests/scheduler/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"1388f446bce5085439c2254edd165118\"))
  (:FILE \"tests/scheduler/pool-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"aaba914dea485f812a11767addb94c81\"))
  (:FILE \"tests/scheduler/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"34e51e369859bc1c731d73e43053b6f4\"))
  (:FILE \"tests/series/boundaries.lisp\" :MD5
   #A((32) BASE-CHAR . \"6967c7e6396b6df38c637f2d5d9ebfc0\"))
  (:FILE \"tests/series/controller.lisp\" :MD5
   #A((32) BASE-CHAR . \"a83818568a27c52d36365597d7113c09\"))
  (:FILE \"tests/series/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6aa566720d1476d13a0f7288be9e1346\"))
  (:FILE \"tests/series/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"67718445a8948da3c7875f6cc6b3e167\"))
  (:FILE \"tests/series/worker-bridge.lisp\" :MD5
   #A((32) BASE-CHAR . \"c714c8db7998acf60256b318488574d8\"))
  (:FILE \"tests/series/worker-routing.lisp\" :MD5
   #A((32) BASE-CHAR . \"f839733b6f5a4d9286a5cdd7ae9bcb55\"))
  (:FILE \"tests/smoke.lisp\" :MD5
   #A((32) BASE-CHAR . \"afb2e2bc7ff7249ebb2e1ccf0f87aaf3\"))
  (:FILE \"tests/storage/compaction-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb4acb5a73eb973f53ef337113880d32\"))
  (:FILE \"tests/storage/control-payload.lisp\" :MD5
   #A((32) BASE-CHAR . \"25f3c822273c898d2263ceb3db538cab\"))
  (:FILE \"tests/storage/log-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"eecb2fe94e710a918254e5ad453a0daa\"))
  (:FILE \"tests/storage/segment-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab2c52fb6b79702d50dcef6d12ca8906\"))
  (:FILE \"tests/storage/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"82a4dbb4767c17f9851143a637af3b83\"))
  (:FILE \"tests/wal/builder.lisp\" :MD5
   #A((32) BASE-CHAR . \"0d01e4e18c0a559873fce584a0ac91cd\"))
  (:FILE \"tests/wal/csn-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"ecb2cbf4f7ace32cdaff329476070d60\"))
  (:FILE \"tests/wal/csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"3e2dbc3319b611db090e27493a10fc2c\"))
  (:FILE \"tests/wal/fault.lisp\" :MD5
   #A((32) BASE-CHAR . \"00367366b82918614d84f517f4bb395e\"))
  (:FILE \"tests/wal/group.lisp\" :MD5
   #A((32) BASE-CHAR . \"0ee2462103a749b58488561aeacaac07\"))
  (:FILE \"tests/wal/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"0643b96c5ee339f9826b19150d065ddf\"))
  (:FILE \"tests/wal/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"15952f6b761acea4519abf701bb2346c\"))
  (:FILE \"tools/measure-pool-dispatch.lisp\" :MD5
   #A((32) BASE-CHAR . \"daea2e29c87593dcc7db9949b67ff4f6\")))
 :SOURCE-FINGERPRINTS-AFTER
 ((:FILE \"arcdocdb.asd\" :MD5
   #A((32) BASE-CHAR . \"d942157b93d69b3852e784a9a838fcb9\"))
  (:FILE \"tools/measure-pool-lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"72a85a626ffb60185baf7602d28517e9\"))
  (:FILE \"src/active/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"bf244695c3c14a1a0148517b48052f5d\"))
  (:FILE \"src/active/preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"0ce41661b5cd26fe2edb944cca142f98\"))
  (:FILE \"src/active/prepare.lisp\" :MD5
   #A((32) BASE-CHAR . \"e3238a39b721a3a5ac1055bc1a30feba\"))
  (:FILE \"src/active/source.lisp\" :MD5
   #A((32) BASE-CHAR . \"50c6d9f4e4eb68c8018acb6a3fe70c8e\"))
  (:FILE \"src/active/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe47862290f99d6217361f4302e2faf2\"))
  (:FILE \"src/cache/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"5d70197c8b64ad6f20c8be47a60c73ca\"))
  (:FILE \"src/cache/clock.lisp\" :MD5
   #A((32) BASE-CHAR . \"3546cf7f5c5ed138068548c20064f499\"))
  (:FILE \"src/cache/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"72f3a33ce27ddf94c49c495580520004\"))
  (:FILE \"src/cache/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1f6a8e7aa4faed88e984b39871d1e53\"))
  (:FILE \"src/cache/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"82f937b7b08bd1696ad9c88da2e1c60c\"))
  (:FILE \"src/cache/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a25648d870eaa4f0b6e1e3b2cf76e28e\"))
  (:FILE \"src/cache/write.lisp\" :MD5
   #A((32) BASE-CHAR . \"fc09021f74fb50aac57589614dae04d7\"))
  (:FILE \"src/codec/cbor-float-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"bc7a7b176e8cdd361b7c4306a1a4de4b\"))
  (:FILE \"src/codec/cbor-float-narrow.lisp\" :MD5
   #A((32) BASE-CHAR . \"c15cc9d91355860357ed434e58d1f4cb\"))
  (:FILE \"src/codec/cbor-float-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"f3b22be81a36e1713c34e890c82c6700\"))
  (:FILE \"src/codec/cbor-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"6e8c6a49314c2f460aa6f8a1759200b6\"))
  (:FILE \"src/codec/cbor-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"ecd8fe950344059c629927b38fb6e4aa\"))
  (:FILE \"src/codec/cbor-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"2dee1a475a1c6edb13b60430fbc0668e\"))
  (:FILE \"src/codec/cbor-scan-input.lisp\" :MD5
   #A((32) BASE-CHAR . \"f6488e987889432b375254021825dbe5\"))
  (:FILE \"src/codec/cbor-scan-items.lisp\" :MD5
   #A((32) BASE-CHAR . \"706c0baa4158bf272c4b0df17c1439d2\"))
  (:FILE \"src/codec/cbor-scan-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"987e8ed576a21eb644ac1ef2e06edbda\"))
  (:FILE \"src/codec/cbor-scan-stack.lisp\" :MD5
   #A((32) BASE-CHAR . \"cf1999ddb10f879aeefbeea853742d57\"))
  (:FILE \"src/codec/cbor-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"0c33aedcdb352e78a3c694cf796e6692\"))
  (:FILE \"src/codec/cbor-simple-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"200373402e6e082dd8c7afde305302bb\"))
  (:FILE \"src/codec/cbor-space.lisp\" :MD5
   #A((32) BASE-CHAR . \"c33cdcc45f45218aa3e8bf26ce0ee575\"))
  (:FILE \"src/codec/cbor-string-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"b13e92b5f24a42fe283c17b649722b6a\"))
  (:FILE \"src/codec/cbor-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"69e77bcd15b5413a815a65c5081229db\"))
  (:FILE \"src/codec/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d885bd2a9860eb60aec1a775e5031d5e\"))
  (:FILE \"src/codec/utf8.lisp\" :MD5
   #A((32) BASE-CHAR . \"0f67dd5c51bf6a63bc292ab4e2a280c2\"))
  (:FILE \"src/control/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"8f3dc4a9657b6bb760e31c46c1e7b986\"))
  (:FILE \"src/control/dependency.lisp\" :MD5
   #A((32) BASE-CHAR . \"22ae34181e8ab96d8c8ecab050a1a19e\"))
  (:FILE \"src/control/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"3cedb51e60b92524cd8208e4bfb2c3ba\"))
  (:FILE \"src/control/preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"2dfc2b76c1d3c382db8b50071bdaeadf\"))
  (:FILE \"src/control/prepare.lisp\" :MD5
   #A((32) BASE-CHAR . \"9df8dc8a19d2a4bc700adfed763c27fa\"))
  (:FILE \"src/control/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"468fcf430eede17a38b922dfd373a746\"))
  (:FILE \"src/control/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d15317bafcdb12ea579b2f482dff57c\"))
  (:FILE \"src/csn/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1130012fc5613a5648d22ed8628be0e8\"))
  (:FILE \"src/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1cdb5661fc54beba5bf00e4765f3235\"))
  (:FILE \"src/dispatch/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"ba4cd961094f37a157d49b8d7024b677\"))
  (:FILE \"src/dispatch/claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"b10caeff4f726c0ebd01e2c6d1baacba\"))
  (:FILE \"src/dispatch/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"46e12ac1f6ab8591bac6467f724538a2\"))
  (:FILE \"src/dispatch/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"36db6694bc70963149b8068ae7ab96ec\"))
  (:FILE \"src/epochs/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"765d14c88cd288093a77a57930cd6999\"))
  (:FILE \"src/epochs/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"875201dfab0a84efd40fe9828cc293c8\"))
  (:FILE \"src/epochs/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"975b5f74e0c5a38ce978f4d9c7fcc6b8\"))
  (:FILE \"src/epochs/reclaim.lisp\" :MD5
   #A((32) BASE-CHAR . \"036dd02adf87d33c3ae2f40735c733fa\"))
  (:FILE \"src/epochs/retire.lisp\" :MD5
   #A((32) BASE-CHAR . \"653b974f310c09f6e2224a84acc43bbf\"))
  (:FILE \"src/epochs/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"82253491f995f5bc153fb5ebf30d564c\"))
  (:FILE \"src/execution/handoff.lisp\" :MD5
   #A((32) BASE-CHAR . \"6b85eebe69366e78ed5fc5cc20735f00\"))
  (:FILE \"src/execution/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb5710d6c111cadb7121a50998a747fa\"))
  (:FILE \"src/execution/queue.lisp\" :MD5
   #A((32) BASE-CHAR . \"8202843bddb817da4279ac959ae3f3c4\"))
  (:FILE \"src/execution/ready-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"38d26f8c749dd946dfc4b9c57103a892\"))
  (:FILE \"src/execution/ready-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a64d98c9ff429d6103d6e10ee1fd7980\"))
  (:FILE \"src/execution/ready.lisp\" :MD5
   #A((32) BASE-CHAR . \"2c1892002f0599bb8273093031017520\"))
  (:FILE \"src/execution/worker-boundary.lisp\" :MD5
   #A((32) BASE-CHAR . \"c24065d6c8d80d1be53994a0041743df\"))
  (:FILE \"src/execution/worker-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"babd0a78b4185af24ae1fef870c0fabb\"))
  (:FILE \"src/execution/worker-run.lisp\" :MD5
   #A((32) BASE-CHAR . \"aa34ca6bc07535e35fea723878d99f66\"))
  (:FILE \"src/execution/worker-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"0679ee07c46f69db330706303c70d8d2\"))
  (:FILE \"src/execution/writer.lisp\" :MD5
   #A((32) BASE-CHAR . \"73019644090e2971f2b54dc36e4491f5\"))
  (:FILE \"src/foundation/batch.lisp\" :MD5
   #A((32) BASE-CHAR . \"ca642ea47e4bff76f78f5b6d7287d6bd\"))
  (:FILE \"src/foundation/binary.lisp\" :MD5
   #A((32) BASE-CHAR . \"a06115175f450776762761dce25acdb8\"))
  (:FILE \"src/foundation/conditions.lisp\" :MD5
   #A((32) BASE-CHAR . \"942b596396c19815290a57830af2121b\"))
  (:FILE \"src/foundation/crc32c.lisp\" :MD5
   #A((32) BASE-CHAR . \"4db58e2f48bf77d751f1b83bb9f84b5c\"))
  (:FILE \"src/foundation/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"5ee593a112958d94163dab17c5aa4ba2\"))
  (:FILE \"src/foundation/record.lisp\" :MD5
   #A((32) BASE-CHAR . \"c3ed0f09fa3fa6fe20c98e2ed6e69abe\"))
  (:FILE \"src/get-directory/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"cde24b2bf5c5637d5501b95bed47df31\"))
  (:FILE \"src/get-directory/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a05062f6ab6d5ebdfdde37e336dfce6\"))
  (:FILE \"src/get-directory/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"74a694385f1aaf03ec87721545494119\"))
  (:FILE \"src/get-directory/sources-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"2b8193aab6801de19e26fa55e7c53f87\"))
  (:FILE \"src/get-directory/sources-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"7bac02a80ddc22c622f8465642385ae8\"))
  (:FILE \"src/get-directory/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"17c957d6934a31f4ed64313e756de2d2\"))
  (:FILE \"src/get-resolver/active-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"c65593cf172f53a8e90a853bbe9504c2\"))
  (:FILE \"src/get-resolver/active-directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"6d95f29b331d335175843f47ae44a6ea\"))
  (:FILE \"src/get-resolver/active-init.lisp\" :MD5
   #A((32) BASE-CHAR . \"7ca975d2534f43c8018d36ecd7c2b042\"))
  (:FILE \"src/get-resolver/active-preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"f13d422adb6aa9e8489352884137f25a\"))
  (:FILE \"src/get-resolver/active-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"521737861e057d663964b0c030552587\"))
  (:FILE \"src/get-resolver/active-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6aaec49504a96f37c8ff1bc182c977b\"))
  (:FILE \"src/get-resolver/active-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"60bb258cf4cc7f50c5c1206af1bb5800\"))
  (:FILE \"src/get-resolver/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"bbfb2082103e6712419e180ab972245c\"))
  (:FILE \"src/get-resolver/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"263525e8274a8f46ce58a4a0ad6841a2\"))
  (:FILE \"src/get-resolver/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"1339edff0223dbf122f11ff0adbba61c\"))
  (:FILE \"src/get-resolver/rows.lisp\" :MD5
   #A((32) BASE-CHAR . \"ca9002b81efd0aed9761cd1f78514762\"))
  (:FILE \"src/get-resolver/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"536e9dc4ed51072b8a6d1528d3ec18bf\"))
  (:FILE \"src/get-resolver/sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d869293ba47444c4721713d955c6254\"))
  (:FILE \"src/get-resolver/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"9df13bcc6908e9fa601d173a671e1ccf\"))
  (:FILE \"src/get/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"c5cc36884b238221cc13ca0c087ec7c2\"))
  (:FILE \"src/get/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"e70bfeddd694336bbd088e65f8761834\"))
  (:FILE \"src/get/lookup.lisp\" :MD5
   #A((32) BASE-CHAR . \"82258ec87aca513a508bc5dee8410dd6\"))
  (:FILE \"src/get/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"c72633d15c3488699072eb610ebde7c8\"))
  (:FILE \"src/get/segment.lisp\" :MD5
   #A((32) BASE-CHAR . \"811869eb6a197d3c4e26af4322e52652\"))
  (:FILE \"src/get/target.lisp\" :MD5
   #A((32) BASE-CHAR . \"1b70dac05d6d2418909eb5105b808e81\"))
  (:FILE \"src/get/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"c394e5684de5e2d938991c7cb348b93c\"))
  (:FILE \"src/hash/arithmetic.lisp\" :MD5
   #A((32) BASE-CHAR . \"b5c51802e607e3dd22de68204baf64e9\"))
  (:FILE \"src/hash/blocks.lisp\" :MD5
   #A((32) BASE-CHAR . \"bef497b9a267c7306d4100000491c814\"))
  (:FILE \"src/hash/hash64.lisp\" :MD5
   #A((32) BASE-CHAR . \"886b7c08b9929283e8968831cbe5c039\"))
  (:FILE \"src/hash/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d9060e41bc5252067d35e59ac70ee06\"))
  (:FILE \"src/index/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"65076c355c099b5dc73d185948d3bec4\"))
  (:FILE \"src/index/hash-digests.lisp\" :MD5
   #A((32) BASE-CHAR . \"43d2209225707352daec6186ef95a805\"))
  (:FILE \"src/index/hash-seed.lisp\" :MD5
   #A((32) BASE-CHAR . \"45ce41749bc6fa638539815d3f802b96\"))
  (:FILE \"src/index/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"598a9b65e73151c924b2cdcaf6d96705\"))
  (:FILE \"src/index/primary-arena.lisp\" :MD5
   #A((32) BASE-CHAR . \"a319691e3e28b7ea7b927de490cf69ba\"))
  (:FILE \"src/index/primary-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"ff2cfbb865290d7a1510fdf6877c7229\"))
  (:FILE \"src/index/primary-core.lisp\" :MD5
   #A((32) BASE-CHAR . \"fa52433eae199ceeb874bf2bc47afca7\"))
  (:FILE \"src/index/primary-directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"1dd67c527257e43f17e006644ecdbd00\"))
  (:FILE \"src/index/primary-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d65cfce399b04f905bf969929962e59a\"))
  (:FILE \"src/index/primary-probe.lisp\" :MD5
   #A((32) BASE-CHAR . \"699ce3f1615296fc27fcde3e0d63a4bc\"))
  (:FILE \"src/index/primary-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"3f317a0d3c5ee86a73651aad36135cc3\"))
  (:FILE \"src/index/primary-relocate.lisp\" :MD5
   #A((32) BASE-CHAR . \"5155959766645d3172ae5e73c58cc071\"))
  (:FILE \"src/index/primary-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a59eab6425a60fa2656f86bf87d5c9ac\"))
  (:FILE \"src/index/primary-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"e8e31e599356e592af29c0cc4604872b\"))
  (:FILE \"src/index/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"5b22b90cfe8534086f6aff96d156713e\"))
  (:FILE \"src/index/rebuild-budget.lisp\" :MD5
   #A((32) BASE-CHAR . \"0417dd41cb3ec1d62dfd913c19f810ad\"))
  (:FILE \"src/index/rebuild-copy.lisp\" :MD5
   #A((32) BASE-CHAR . \"8befbbd00ed5c31c1487a11887eba495\"))
  (:FILE \"src/index/rebuild-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"1188e7a64a7a5d9482c1233cb9acb452\"))
  (:FILE \"src/index/rebuild.lisp\" :MD5
   #A((32) BASE-CHAR . \"a450cac8071513365267e7024cbe94b0\"))
  (:FILE \"src/index/relocate.lisp\" :MD5
   #A((32) BASE-CHAR . \"475dd7d5809a836f01544b447cc8df27\"))
  (:FILE \"src/index/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"5157fd03ee806ee998ad8f0002d56268\"))
  (:FILE \"src/index/validation.lisp\" :MD5
   #A((32) BASE-CHAR . \"3384cadf737c7d80c004222022a281f6\"))
  (:FILE \"src/index/write.lisp\" :MD5
   #A((32) BASE-CHAR . \"f0c8c579cd7db466d243ed3ea9f8e8aa\"))
  (:FILE \"src/io/flush.lisp\" :MD5
   #A((32) BASE-CHAR . \"716866194d6b9f076e102e84187229c0\"))
  (:FILE \"src/io/identity-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"d354a095fb378c1b6f27397ffb902227\"))
  (:FILE \"src/io/identity.lisp\" :MD5
   #A((32) BASE-CHAR . \"4e03b14a0c5015dc6ec897221c9f0eb5\"))
  (:FILE \"src/io/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"11c7103efbe733bbf0a13927f23c3d34\"))
  (:FILE \"src/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"58030bc0c811248a6537e2909d8762d6\"))
  (:FILE \"src/io/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"7aafde7081a3804862c3acf446e6e385\"))
  (:FILE \"src/io/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"2f8bd851d09ab994d8d01b231697d1a1\"))
  (:FILE \"src/io/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"e7b6ee5fd2d57281dbd32bf9b07d0fa6\"))
  (:FILE \"src/mvcc/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"f188d1dbd5d0adb49f53acf09157aef9\"))
  (:FILE \"src/mvcc/snapshots-core.lisp\" :MD5
   #A((32) BASE-CHAR . \"8bb066aab61a18eff175b9edb11e42a2\"))
  (:FILE \"src/mvcc/snapshots-csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"0e9365e674d1584b111f915ce1f58634\"))
  (:FILE \"src/mvcc/snapshots-lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"ff98aea5cb9a7ae2671f6a887a003725\"))
  (:FILE \"src/mvcc/snapshots-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"ae3ad96269b5e711a9dbb455f3c0ce48\"))
  (:FILE \"src/mvcc/snapshots-register.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d5a795bcefd605c75da91c725ae83a2\"))
  (:FILE \"src/mvcc/snapshots-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"475517bd7ba04a1c37a82efeb8ff73d9\"))
  (:FILE \"src/mvcc/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a9bc70eab6720b5c6f8503178e2c966b\"))
  (:FILE \"src/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"becf5c78049c85f2c05cd1ef54454032\"))
  (:FILE \"src/read/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"4040905f4a64ba704a480d82e87ec748\"))
  (:FILE \"src/read/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"7d74d9decc5a0bc9f9331d89bd503e21\"))
  (:FILE \"src/read/task.lisp\" :MD5
   #A((32) BASE-CHAR . \"9e0baf22c53329d393e047c669679645\"))
  (:FILE \"src/read/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"9c37ff8237fcc9fe9ae4f44316e854e3\"))
  (:FILE \"src/recovery/decisions-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"1a51ef4a488bb9fde2ff7d47bae01379\"))
  (:FILE \"src/recovery/decisions-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"cbdc30f93109c474e1fc25066c9b9b13\"))
  (:FILE \"src/recovery/decisions-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"f782d1137b8ce342b91c9999cfb7accc\"))
  (:FILE \"src/recovery/decisions-radix.lisp\" :MD5
   #A((32) BASE-CHAR . \"852149de4c289b8e067602780378d87a\"))
  (:FILE \"src/recovery/decisions-sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"b33e57a643f2fca810846f6226366253\"))
  (:FILE \"src/recovery/decisions-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f4433fd19ebc7239dbc2628c39f3ecdb\"))
  (:FILE \"src/recovery/inventory-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"9bd6820c4feba3e552aab1a4edd87861\"))
  (:FILE \"src/recovery/inventory-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"fcea263de1938767772e5b11411ecd5e\"))
  (:FILE \"src/recovery/inventory-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"78c136d5838dcfe3019d9069643a8d8f\"))
  (:FILE \"src/recovery/manifest-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"bf65b1731eab6e0572461ef5cc60fc40\"))
  (:FILE \"src/recovery/manifest-decode.lisp\" :MD5
   #A((32) BASE-CHAR . \"67975249aaabd751757cdfb9222cc3c4\"))
  (:FILE \"src/recovery/manifest-fold.lisp\" :MD5
   #A((32) BASE-CHAR . \"e0d2498db1011e857b7b0daa1934f187\"))
  (:FILE \"src/recovery/manifest-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"37ace42844c11b52446ee1fc500b8e0b\"))
  (:FILE \"src/recovery/manifest-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"ebd7a54adea2213294a887e6d4db0927\"))
  (:FILE \"src/recovery/manifest-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"7b1d4054415faca7e5fca59ad83b4d4a\"))
  (:FILE \"src/recovery/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1c1c8ad0cd15b1703a2fe19cbf3f13c2\"))
  (:FILE \"src/recovery/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"fcacd15460db25ea9cc4036065f9f096\"))
  (:FILE \"src/scheduler/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"36c5ae2dd08fbe546f4392b7b12102ec\"))
  (:FILE \"src/scheduler/lifecycle-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"1c4a4fd316ef034c298db47dfca1daca\"))
  (:FILE \"src/scheduler/lifecycle-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"19c8be44863be30c07bb72fe3fac2a99\"))
  (:FILE \"src/scheduler/lifecycle-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"fa2f88c50dfec24af40af091f9221590\"))
  (:FILE \"src/scheduler/lifecycle-update.lisp\" :MD5
   #A((32) BASE-CHAR . \"40a78461f91616a935a39f29b87680c8\"))
  (:FILE \"src/scheduler/lifecycle-worker.lisp\" :MD5
   #A((32) BASE-CHAR . \"9d7cdf45c1b594fef5af735ec0955c05\"))
  (:FILE \"src/scheduler/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"0578c541b6ddfaf8827240e967ff76ea\"))
  (:FILE \"src/scheduler/policy.lisp\" :MD5
   #A((32) BASE-CHAR . \"1721005a7545b36df601d75252638eba\"))
  (:FILE \"src/scheduler/pool-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"c4995b29d40caa2ee29aa0c167885287\"))
  (:FILE \"src/scheduler/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"170dfc36aef6a3d78f980fbcc37f0176\"))
  (:FILE \"src/scheduler/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"981f9f6db268cd9a46d4239c677c5d5b\"))
  (:FILE \"src/scheduler/update.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a43e6b400b701c69286357ef85469fc\"))
  (:FILE \"src/series/events.lisp\" :MD5
   #A((32) BASE-CHAR . \"32b2156739a6f2ca996abb91df0a2603\"))
  (:FILE \"src/series/io-events.lisp\" :MD5
   #A((32) BASE-CHAR . \"b6026a8b7bb64b45c37a65effda70d8e\"))
  (:FILE \"src/series/ownership.lisp\" :MD5
   #A((32) BASE-CHAR . \"de1aca16a35d34d16aba12ff541c0d2b\"))
  (:FILE \"src/series/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"09653c7479e1498d1545f3f1f0ffd755\"))
  (:FILE \"src/series/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6977aba53c811ec3a373226f9f53795\"))
  (:FILE \"src/series/query.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb0d91405325b508e6b2ab24d178de7a\"))
  (:FILE \"src/series/retirement.lisp\" :MD5
   #A((32) BASE-CHAR . \"b8e04971b8ad75a1bd0c722997badfd2\"))
  (:FILE \"src/series/routing-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6924deff152b941bd49f0bb200b4197\"))
  (:FILE \"src/series/routing-select.lisp\" :MD5
   #A((32) BASE-CHAR . \"e0f987d8767744050ec4d1b3ecb699ed\"))
  (:FILE \"src/series/routing-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"ce649df47dd38888d5103c98345f7e41\"))
  (:FILE \"src/series/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab19ec8d15af91511e817858c41cebc8\"))
  (:FILE \"src/series/worker-boundary.lisp\" :MD5
   #A((32) BASE-CHAR . \"2340e0c9074f7b1bf80c74f774986bc5\"))
  (:FILE \"src/series/worker-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"a93ce2e84e8aee647b5083ad1d2b899b\"))
  (:FILE \"src/series/worker-run.lisp\" :MD5
   #A((32) BASE-CHAR . \"f0fee18adf357bad98e8a3c3e8c70c0c\"))
  (:FILE \"src/series/worker-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"2b23d468be0165fa009c5ebd5d1bbe23\"))
  (:FILE \"src/storage/compaction-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"1cda77a357ab2147035993b72d135a37\"))
  (:FILE \"src/storage/control-payload.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb64f806b8d69eb42d865b4abfff0b27\"))
  (:FILE \"src/storage/formats.lisp\" :MD5
   #A((32) BASE-CHAR . \"061147be459d8d3b08c661bd3f91d152\"))
  (:FILE \"src/storage/log-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"b53d27dcc9f4badf18b50519c50bc614\"))
  (:FILE \"src/storage/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"f86bd104f20616a76b42c02227f72844\"))
  (:FILE \"src/storage/payload-record.lisp\" :MD5
   #A((32) BASE-CHAR . \"8c03f9c01dcb30f2d3970a5694968ecf\"))
  (:FILE \"src/storage/payload-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"c4ece3c4fa8d9492d2a80df7c0a4f5a0\"))
  (:FILE \"src/storage/segment-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6812fa59bf8fd1252fbf85a9bfa3896\"))
  (:FILE \"src/wal/builder.lisp\" :MD5
   #A((32) BASE-CHAR . \"a229f76f7036f3573a6e528dcd390a19\"))
  (:FILE \"src/wal/csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"42b990e3b254e6fb488c0ab91b6a6502\"))
  (:FILE \"src/wal/executor.lisp\" :MD5
   #A((32) BASE-CHAR . \"c0340924c9130e14d0e8efedeec078f1\"))
  (:FILE \"src/wal/group.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a0e7c99ab70b4720cbb091156560f5e\"))
  (:FILE \"src/wal/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"96c41b1d417135a24fc65659ea3abe11\"))
  (:FILE \"src/wal/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f799f27a8ac1a4c736c04796c1e543f9\"))
  (:FILE \"tests/codec/cbor-float-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"425bfed06e37f409d59d0f5f029af196\"))
  (:FILE \"tests/codec/cbor-float-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"a8f6600ec087c10e5ec0a43d43edade4\"))
  (:FILE \"tests/codec/cbor-float-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"e62412cb0e838b241383a5c9103dd2c2\"))
  (:FILE \"tests/codec/cbor-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"208ee0d03652de67ad453bdd34d10b62\"))
  (:FILE \"tests/codec/cbor-minimal-edges.lisp\" :MD5
   #A((32) BASE-CHAR . \"392d402b44d04a9ce1c95fef4c4e8bf9\"))
  (:FILE \"tests/codec/cbor-minimal-scan-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"16954ef22a2169e6f9f6de0e9ab187ab\"))
  (:FILE \"tests/codec/cbor-minimal-scan-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"0dfa785451fcfe573019531e00600cc6\"))
  (:FILE \"tests/codec/cbor-minimal-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"34587c10ac32129ac531e0a4f03df9a6\"))
  (:FILE \"tests/codec/cbor-minimal-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"4d7ec43e187859da277b8fb5f66f8e73\"))
  (:FILE \"tests/codec/cbor-minimal-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"9a6a26ae45747211bb795bc323b13770\"))
  (:FILE \"tests/codec/cbor-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"2311a15f8d4af90bf341e91e0e64342b\"))
  (:FILE \"tests/codec/cbor-simple-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"948bfe5924482cccb6624f91be6770e6\"))
  (:FILE \"tests/codec/cbor-simple-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"c4793e5b0e0192c0fe222351d6f1b599\"))
  (:FILE \"tests/codec/cbor-simple-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"808ed81b703fd2cf0ac11d148c3ffc08\"))
  (:FILE \"tests/codec/cbor-string-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6acef83c6cda7e326fd10b4a1d6d6fa6\"))
  (:FILE \"tests/codec/cbor-string-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"8abc0529f331d1fabdec79507cf296ef\"))
  (:FILE \"tests/codec/cbor-string-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"70d9d0d454dd1f296ef6989d3b928842\"))
  (:FILE \"tests/codec/cbor-structure-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"220d386d29b1fa192e06ceebe4ec245c\"))
  (:FILE \"tests/codec/cbor-structure-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"f38848c55b050dae335b0a37657c1f5c\"))
  (:FILE \"tests/codec/cbor-structure.lisp\" :MD5
   #A((32) BASE-CHAR . \"06e6f060aea55a18d06047e5ebabd18e\"))
  (:FILE \"tests/codec/cbor-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e5da97609a2ba58bb35fea24b7518d2b\"))
  (:FILE \"tests/codec/cbor-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"4d7d61509b2ce749fb2331ceeaeeca76\"))
  (:FILE \"tests/codec/cbor-write-roundtrip.lisp\" :MD5
   #A((32) BASE-CHAR . \"646944ef624c06fd86d6a1306041349d\"))
  (:FILE \"tests/codec/cbor-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"13382bdf23e5501e0ca349faf7b05062\"))
  (:FILE \"tests/codec/cbor-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"4926899e278afdd9577e5ef8262ba835\"))
  (:FILE \"tests/codec/cbor-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"dffa6e75d8c3d7f991f6c4460eb8b9bc\"))
  (:FILE \"tests/codec/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"32534fd42dd8124b50b45deefe143eaf\"))
  (:FILE \"tests/codec/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"a71504598cda8e99cd50e229ddd5275b\"))
  (:FILE \"tests/codec/utf8.lisp\" :MD5
   #A((32) BASE-CHAR . \"767ead15603be8dce90f340dbb200d8f\"))
  (:FILE \"tests/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"1d9133c5fd33cb60ff160f468db330f4\"))
  (:FILE \"tests/csn/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e5c151cda2e10e4f9cae46a4326699eb\"))
  (:FILE \"tests/csn/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"087108576603e6cd5b9af14b50475746\"))
  (:FILE \"tests/epochs/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe92ddd79dcaab3d3f7bdf387bf2295e\"))
  (:FILE \"tests/epochs/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"592a2fe2e22214c52d4672d26620980b\"))
  (:FILE \"tests/epochs/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"67cec074bf70074f7f2c6965ef494ba8\"))
  (:FILE \"tests/execution/handoff.lisp\" :MD5
   #A((32) BASE-CHAR . \"f87fdc0f7bd194329c6349026a2f35bb\"))
  (:FILE \"tests/execution/queue.lisp\" :MD5
   #A((32) BASE-CHAR . \"940ebb450bc871f8c2dd7dc9977bb158\"))
  (:FILE \"tests/execution/ready-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"4ccdc0512b3c81837726076d7c795930\"))
  (:FILE \"tests/execution/ready.lisp\" :MD5
   #A((32) BASE-CHAR . \"f6756125a9150b6312dad3e2705b74d3\"))
  (:FILE \"tests/execution/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"bacb1a135c0d73cded57ba21986c8496\"))
  (:FILE \"tests/execution/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"32b6a6578f526b7d4bcc3a1665a8c6e6\"))
  (:FILE \"tests/execution/worker.lisp\" :MD5
   #A((32) BASE-CHAR . \"bbaa592327d730fdae78cb881350efe0\"))
  (:FILE \"tests/foundation/batch.lisp\" :MD5
   #A((32) BASE-CHAR . \"29fc6a9711ea9265840e8cde4971f74e\"))
  (:FILE \"tests/foundation/binary.lisp\" :MD5
   #A((32) BASE-CHAR . \"07c4c9ac2177f22e5b7fb25f9867a133\"))
  (:FILE \"tests/foundation/record.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a84ca3aa74ab158c6b7d66886cf8b23\"))
  (:FILE \"tests/foundation/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"758adad069aec2f9dbe0635797314ff6\"))
  (:FILE \"tests/get-directory/construction.lisp\" :MD5
   #A((32) BASE-CHAR . \"1137938073e71d6d8d62c751fbad05d5\"))
  (:FILE \"tests/get-directory/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"d1ab36d05cc1266e4533d27c693f12f4\"))
  (:FILE \"tests/get-directory/series-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"486604b450bfe8de32feaed1a96dc0cc\"))
  (:FILE \"tests/get-directory/series-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"092192d05b3f85c6c283113c57c02f01\"))
  (:FILE \"tests/get-directory/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"3f868ebe4307ad4238b314c37eceed9a\"))
  (:FILE \"tests/get-directory/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"63dd01c852de1399c2c82274d481d257\"))
  (:FILE \"tests/get-performance/guards.lisp\" :MD5
   #A((32) BASE-CHAR . \"324c70304e678cbe022ff33c73f793e2\"))
  (:FILE \"tests/get-performance/paths.lisp\" :MD5
   #A((32) BASE-CHAR . \"eb48216a4b5baa9cf498968ee032b205\"))
  (:FILE \"tests/get-performance/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"1f5f9fa3ffcc3220f10b7a5f294ee6d9\"))
  (:FILE \"tests/get-performance/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"916e5740db5d52fdf6088694f34d11db\"))
  (:FILE \"tests/get-resolver/construction.lisp\" :MD5
   #A((32) BASE-CHAR . \"a64a6a5a34c8ec5f8c4ca4324cc348d2\"))
  (:FILE \"tests/get-resolver/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"e93c7dbf1bf2d7e99651b110a4e01661\"))
  (:FILE \"tests/get-resolver/sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"ffe3551bb49dd60d7d34213c9c93cf06\"))
  (:FILE \"tests/get-resolver/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"0738e161d276394a160a86ed139610f2\"))
  (:FILE \"tests/get/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"3a4bbc3fd3ede5a837f0c0f913637291\"))
  (:FILE \"tests/get/segment.lisp\" :MD5
   #A((32) BASE-CHAR . \"2f25d1904aa4960ce0d6351580a2bcc7\"))
  (:FILE \"tests/get/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"660783988d4f99d0e171bb59c79e3467\"))
  (:FILE \"tests/hash/guards.lisp\" :MD5
   #A((32) BASE-CHAR . \"a59d531a156fc49c39c9265075bd9600\"))
  (:FILE \"tests/hash/hash64.lisp\" :MD5
   #A((32) BASE-CHAR . \"443fdc895f2fa3620d2b1b4af5c32dc4\"))
  (:FILE \"tests/hash/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"40b223712554582c2910971a6b045149\"))
  (:FILE \"tests/hash/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"73ed0785ca1330d69ad336abc019a413\"))
  (:FILE \"tests/index/hash-digests.lisp\" :MD5
   #A((32) BASE-CHAR . \"91c1eda35e14276e795259bceac489be\"))
  (:FILE \"tests/index/primary-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"44e2635d88de3f6ccf69c684c3eff77b\"))
  (:FILE \"tests/index/primary-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"4d339c2f2680e66ac79ecd8d02c09382\"))
  (:FILE \"tests/index/primary.lisp\" :MD5
   #A((32) BASE-CHAR . \"6ed661242a86117dd2d696e374740a2f\"))
  (:FILE \"tests/index/rebuild.lisp\" :MD5
   #A((32) BASE-CHAR . \"262556582cc0c387d6c59b757d9956b1\"))
  (:FILE \"tests/index/slot-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6ed9249e2eaef3524260804ef7e02567\"))
  (:FILE \"tests/index/slot-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"e9b53e6eac6fc836e8243d41adbafea0\"))
  (:FILE \"tests/index/slots.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe094b4513ceabe8571031ac20935e48\"))
  (:FILE \"tests/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"1e6fd9ab36eb4e307207d371ed947757\"))
  (:FILE \"tests/io/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"a26526e87fe46794b8bbab1fdd46d68c\"))
  (:FILE \"tests/io/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab2fb36682dd8b8bc757e586ceb3be62\"))
  (:FILE \"tests/lint-fixtures/bad.lisp\" :MD5
   #A((32) BASE-CHAR . \"30f1396c941dd9b8a41ca15698b5a347\"))
  (:FILE \"tests/lint-fixtures/good.lisp\" :MD5
   #A((32) BASE-CHAR . \"f85250c3a057c851db6745b9eba27da1\"))
  (:FILE \"tests/lint-fixtures/keyword-barrier.lisp\" :MD5
   #A((32) BASE-CHAR . \"9f63fdfdf866f17d5491390b710ebb5e\"))
  (:FILE \"tests/lint-fixtures/qualified-reader.lisp\" :MD5
   #A((32) BASE-CHAR . \"7fc689336bb2041dfef4c22090bb7de4\"))
  (:FILE \"tests/mvcc/capture.lisp\" :MD5
   #A((32) BASE-CHAR . \"1f0309fa9258eb62a45167de5d2279d5\"))
  (:FILE \"tests/mvcc/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"341627288b50485858efedc207fc95b5\"))
  (:FILE \"tests/mvcc/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e7d26bd67650663c88ceda526023ae83\"))
  (:FILE \"tests/read/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"73dab63d8414998d72f6c14e0d62e3ac\"))
  (:FILE \"tests/read/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"0d5db03bd804747de7c309c82e40dd43\"))
  (:FILE \"tests/read/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"0cf2cad12c77c82b827da01782bc996d\"))
  (:FILE \"tests/recovery/corruption.lisp\" :MD5
   #A((32) BASE-CHAR . \"a369b8176d4e877ab546d17e983b94ed\"))
  (:FILE \"tests/recovery/decisions-audit.lisp\" :MD5
   #A((32) BASE-CHAR . \"33b98cf215d1ddb469d02cc6c0032bfe\"))
  (:FILE \"tests/recovery/decisions-radix.lisp\" :MD5
   #A((32) BASE-CHAR . \"58eec0feac01e643c76ad19ef5c07df5\"))
  (:FILE \"tests/recovery/decisions-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"80348d0ce2adbc8a4d37db49df291b1d\"))
  (:FILE \"tests/recovery/decisions.lisp\" :MD5
   #A((32) BASE-CHAR . \"5add0e087181bad8ce330af23fc26686\"))
  (:FILE \"tests/recovery/inventory-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"522afcdc6115fdd4d8fec0d06aab7354\"))
  (:FILE \"tests/recovery/inventory.lisp\" :MD5
   #A((32) BASE-CHAR . \"9c78925dd89e94d86a9f577e0225eeb3\"))
  (:FILE \"tests/recovery/manifest-audit.lisp\" :MD5
   #A((32) BASE-CHAR . \"3ca73a199708e2571da3a27e6dc00c76\"))
  (:FILE \"tests/recovery/manifest-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"3286e0dfb66496aafe8b6fbbdd92ab43\"))
  (:FILE \"tests/recovery/manifest.lisp\" :MD5
   #A((32) BASE-CHAR . \"b6bdcc4d20f7db14c0dc00d5258cbf8c\"))
  (:FILE \"tests/recovery/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"aa7af12d270673b62542d32ec60b361a\"))
  (:FILE \"tests/recovery/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"769bac1994a5e3d74bd56b510970bf9b\"))
  (:FILE \"tests/scheduler/controller.lisp\" :MD5
   #A((32) BASE-CHAR . \"bc20dcd712332fde961fb38e879392b5\"))
  (:FILE \"tests/scheduler/dispatch.lisp\" :MD5
   #A((32) BASE-CHAR . \"04de15f50e704d29aefb1b42a3d0af7c\"))
  (:FILE \"tests/scheduler/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"1388f446bce5085439c2254edd165118\"))
  (:FILE \"tests/scheduler/pool-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"aaba914dea485f812a11767addb94c81\"))
  (:FILE \"tests/scheduler/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"34e51e369859bc1c731d73e43053b6f4\"))
  (:FILE \"tests/series/boundaries.lisp\" :MD5
   #A((32) BASE-CHAR . \"6967c7e6396b6df38c637f2d5d9ebfc0\"))
  (:FILE \"tests/series/controller.lisp\" :MD5
   #A((32) BASE-CHAR . \"a83818568a27c52d36365597d7113c09\"))
  (:FILE \"tests/series/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6aa566720d1476d13a0f7288be9e1346\"))
  (:FILE \"tests/series/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"67718445a8948da3c7875f6cc6b3e167\"))
  (:FILE \"tests/series/worker-bridge.lisp\" :MD5
   #A((32) BASE-CHAR . \"c714c8db7998acf60256b318488574d8\"))
  (:FILE \"tests/series/worker-routing.lisp\" :MD5
   #A((32) BASE-CHAR . \"f839733b6f5a4d9286a5cdd7ae9bcb55\"))
  (:FILE \"tests/smoke.lisp\" :MD5
   #A((32) BASE-CHAR . \"afb2e2bc7ff7249ebb2e1ccf0f87aaf3\"))
  (:FILE \"tests/storage/compaction-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb4acb5a73eb973f53ef337113880d32\"))
  (:FILE \"tests/storage/control-payload.lisp\" :MD5
   #A((32) BASE-CHAR . \"25f3c822273c898d2263ceb3db538cab\"))
  (:FILE \"tests/storage/log-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"eecb2fe94e710a918254e5ad453a0daa\"))
  (:FILE \"tests/storage/segment-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab2c52fb6b79702d50dcef6d12ca8906\"))
  (:FILE \"tests/storage/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"82a4dbb4767c17f9851143a637af3b83\"))
  (:FILE \"tests/wal/builder.lisp\" :MD5
   #A((32) BASE-CHAR . \"0d01e4e18c0a559873fce584a0ac91cd\"))
  (:FILE \"tests/wal/csn-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"ecb2cbf4f7ace32cdaff329476070d60\"))
  (:FILE \"tests/wal/csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"3e2dbc3319b611db090e27493a10fc2c\"))
  (:FILE \"tests/wal/fault.lisp\" :MD5
   #A((32) BASE-CHAR . \"00367366b82918614d84f517f4bb395e\"))
  (:FILE \"tests/wal/group.lisp\" :MD5
   #A((32) BASE-CHAR . \"0ee2462103a749b58488561aeacaac07\"))
  (:FILE \"tests/wal/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"0643b96c5ee339f9826b19150d065ddf\"))
  (:FILE \"tests/wal/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"15952f6b761acea4519abf701bb2346c\"))
  (:FILE \"tools/measure-pool-dispatch.lisp\" :MD5
   #A((32) BASE-CHAR . \"daea2e29c87593dcc7db9949b67ff4f6\")))
 :SOURCE-CONSISTENCY :STABLE :RECORDED-AT 4000917250 :SELF-TEST
 (:STATUS :OK :SHARED-SENSOR
  (:STATUS :OK :BASELINE
   (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096 :WARMUP-ITERATIONS
    128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS 36 :SECONDS 3.6d-5
    :TIME-QUALITY :MEASURED :SINK 8386560 :DIAGNOSTIC NIL :EXPECTED-SINK
    8386560)
   :POSITIVE-CONTROL
   (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 16 :WARMUP-ITERATIONS 0
    :COMPLETED-ITERATIONS 16 :HEAP-BYTES 16777472 :RAW-TICKS 42 :SECONDS 4.2d-5
    :TIME-QUALITY :MEASURED :SINK 16777336 :DIAGNOSTIC NIL :EXPECTED-SINK
    16777336)
   :WRONG-SINK-PROBE
   (:REPLICA 0 :STATUS :EXPECTED-REJECTION :STAGE :MEASURED :ITERATIONS 2
    :WARMUP-ITERATIONS 0 :COMPLETED-ITERATIONS 2 :HEAP-BYTES 0 :RAW-TICKS 1
    :SECONDS 1.0d-6 :TIME-QUALITY :MEASURED :SINK 3 :DIAGNOSTIC
    #A((50) BASE-CHAR . \"COD-60: heap/clock negativo o sink 3 diverso da 1.\")
    :EXPECTED-SINK 1)
   :ZERO-CLOCK-PROBE
   (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 2 :WARMUP-ITERATIONS 0
    :COMPLETED-ITERATIONS 2 :HEAP-BYTES 0 :RAW-TICKS 0 :SECONDS NIL
    :TIME-QUALITY :BELOW-RESOLUTION :SINK 1 :DIAGNOSTIC NIL :EXPECTED-SINK 1)
   :COMPOSED-API-PROBE
   (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
    :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 8 :SECONDS 8.0d-6
    :TIME-QUALITY :MEASURED :SINK 318 :DIAGNOSTIC NIL :EXPECTED-SINK 318)
   :COMPOSED-REGISTRY-PROBE
   (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
    :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 14 :SECONDS 1.4d-5
    :TIME-QUALITY :MEASURED :SINK 142 :DIAGNOSTIC NIL :EXPECTED-SINK 142)
   :INVALID-CLI :REJECTED :OWNER-AND-REGISTRY-ORACLE-POSITIVE-NEGATIVE :PASSED
   :INVALID-NON-HOT :PASSED :EXISTING-DESTINATION-AND-PARTIAL-RAW :PASSED
   :MEASURED-PARTIAL-RAW
   (:REPLICA 0 :STATUS :EXPECTED-REJECTION :STAGE :MEASURED :ITERATIONS 4
    :WARMUP-ITERATIONS 0 :COMPLETED-ITERATIONS 1 :HEAP-BYTES 0 :RAW-TICKS 7
    :SECONDS 7.0d-6 :TIME-QUALITY :MEASURED :SINK 0 :DIAGNOSTIC
    #A((26) BASE-CHAR . \"fixture: misura interrotta\") :EXPECTED-SINK 6))
  :DISPATCH-ORACLES :PASSED :DISPATCH-CLI-AND-PARTIAL-RAW :PASSED :EMPTY
  (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
   :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 11 :SECONDS 1.1d-5
   :TIME-QUALITY :MEASURED :SINK 54 :DIAGNOSTIC NIL :EXPECTED-SINK 54)
  :INACTIVE
  (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
   :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 13 :SECONDS 1.3d-5
   :TIME-QUALITY :MEASURED :SINK 86 :DIAGNOSTIC NIL :EXPECTED-SINK 86)
  :ROUTE-CURRENT
  (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
   :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 13 :SECONDS 1.3d-5
   :TIME-QUALITY :MEASURED :SINK 118 :DIAGNOSTIC NIL :EXPECTED-SINK 118))
 :SAMPLES NIL :CURRENT-REPLICA NIL :SBCL #A((5) BASE-CHAR . \"2.6.9\") :MACHINE
 #A((5) BASE-CHAR . \"ARM64\") :OS #A((6) BASE-CHAR . \"Darwin\") :OS-VERSION
 #A((6) BASE-CHAR . \"27.0.0\") :SAFETY 3 :ITERATIONS 4096 :WARMUP 128 :REPLICAS
 5 :TIMER-UNITS-PER-SECOND 1000000 :CAMPAIGNS
 ((:EMPTY :SHARDS 4 :INITIAL-CURSOR 0 :CALLS-PER-CYCLE 4 :TOKEN 12)
  (:INACTIVE :SHARDS 4 :INITIAL-CURSOR 2 :CALLS-PER-CYCLE 4 :TOKEN 20)
  (:ROUTE-CURRENT :SHARDS 4 :INITIAL-CURSOR 0 :CALLS-PER-CYCLE 4 :TOKEN 28
   :INITIAL-CLAIM-OUTSIDE-CLOCK T :WORKER-PHASE :CLAIMED :LINK-PHASE :IDLE
   :SCALAR-STATE-ORACLE-IN-CYCLE T))
 :TOKEN-FORMULA
 \"sample=N*cycle-token+N*(N-1)/2; EMPTY=12; INACTIVE=20; ROUTE-CURRENT=28\"
 :LIMITS
 (:PREALLOCATED-PRODUCT-AND-INPUTS :STARTUP-CLAIM-DRAIN-AND-GC-EXCLUDED
  :COUNTER-NOT-ABSOLUTE-NONALLOCATION-PROOF :EXTERNAL-LOAD-UNCONTROLLED
  :CLOCK-ZERO-IS-BELOW-RESOLUTION :NO-TIME-THRESHOLD-NO-TUNING-CLAIM
  :EMPTY-IS-LOCAL-OBSERVATION :NO-REAL-QUEUED-CLAIM-MEASURED
  :CURRENT-IS-REPEATED-CLAIMED-LOOKUP-WITH-SCALAR-ORACLES
  :NO-BEGIN-OR-LIVE-LEASE-IN-CLOCK :NO-CONCURRENT-COORDINATOR
  :NO-PHYSICAL-WORKER-LIFECYCLE-QUALIFICATION))
")
  (:PATH
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/attempt-01.log")
   :BYTES 98739 :SHA256 "3f0b0a52d8ea22ef3a97ee965060773182791efd982feb5947f3ac719bf8c494"
   :GIT-BLOB "498e058ba6909459f980991455cfcaf864a71041" :TEXT
   "Unhandled SIMPLE-ERROR in thread #<SB-THREAD:THREAD tid=259 \"main thread\" RUNNING
                                    {8005260453}>:
  Avviso non ammesso: IGNORE declaration for a variable from outer scope: READY

Backtrace for: #<SB-THREAD:THREAD tid=259 \"main thread\" RUNNING {8005260453}>
0: (SB-DEBUG::DEBUGGER-DISABLED-HOOK #<SIMPLE-ERROR \"Avviso non ammesso: ~A\" {80080EF0F3}> #<unused argument> :QUIT T)
1: (SB-DEBUG::RUN-HOOK SB-EXT:*INVOKE-DEBUGGER-HOOK* #<SIMPLE-ERROR \"Avviso non ammesso: ~A\" {80080EF0F3}>)
2: (INVOKE-DEBUGGER #<SIMPLE-ERROR \"Avviso non ammesso: ~A\" {80080EF0F3}>)
3: (ERROR \"Avviso non ammesso: ~A\" #<SB-INT:SIMPLE-STYLE-WARNING \"~A declaration for ~A: ~A\" {80080EF0B3}>)
4: ((LAMBDA (CONDITION) :IN \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/scoped.lisp\") #<SB-INT:SIMPLE-STYLE-WARNING \"~A declaration for ~A: ~A\" {80080EF0B3}>)
5: (SB-KERNEL::%SIGNAL #<SB-INT:SIMPLE-STYLE-WARNING \"~A declaration for ~A: ~A\" {80080EF0B3}>)
6: (SB-C::COMPILER-STYLE-WARNING-HANDLER #<SB-INT:SIMPLE-STYLE-WARNING \"~A declaration for ~A: ~A\" {80080EF0B3}>)
7: (SB-KERNEL::%SIGNAL #<SB-INT:SIMPLE-STYLE-WARNING \"~A declaration for ~A: ~A\" {80080EF0B3}>)
8: ((FLET SB-KERNEL::%WARN :IN \"SYS:SRC;CODE;WARM-ERROR.LISP\") \"~A declaration for ~A: ~A\" #<SB-KERNEL::CONDITION-CLASSOID STYLE-WARNING> SB-INT:SIMPLE-STYLE-WARNING IGNORE \"a variable from outer scope\" READY)
9: (SB-C:COMPILER-STYLE-WARN \"~A declaration for ~A: ~A\" IGNORE \"a variable from outer scope\" READY)
10: (SB-C::PROCESS-1-DECL (IGNORE DISPATCHER READY CONTROLLERS) #S(SB-KERNEL:LEXENV :FUNS #1=((#2=#:CLEANUP-FUN-4 . #3=#<SB-C::CLAMBDA :%SOURCE-NAME #2# :%DEBUG-NAME (FLET \"CLEANUP-FUN-4\" :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :KIND (CLEANUP) :TYPE #4=#<SB-KERNEL:BUILT-IN-CLASSOID FUNCTION (read-only)> :WHERE-FROM :DEFINED :VARS NIL {80080EBC53}>)) :VARS #5=((#6=#:IGNORE . #<SB-C::LAMBDA-VAR :%SOURCE-NAME #6# :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80080EB0E3}> {80080EB013}>) (#7=#:RIGHT-FILE3 . #<SB-C::LAMBDA-VAR :%SOURCE-NAME #7# :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EAFC3}> {80080EAEF3}>) (#8=#:RIGHT1 . #<SB-C::LAMBDA-VAR :%SOURCE-NAME #8# :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EAEA3}> {80080EADD3}>) (#6# . #<SB-C::LAMBDA-VAR :%SOURCE-NAME #6# :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80080EA253}> {80080EA183}>) (#9=#:LEFT-FILE2 . #<SB-C::LAMBDA-VAR :%SOURCE-NAME #9# :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EA133}> {80080EA063}>) (#10=#:LEFT0 . #<SB-C::LAMBDA-VAR :%SOURCE-NAME #10# :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EA013}> {80080E9F43}>) (#6# . #<SB-C::LAMBDA-VAR :%SOURCE-NAME #6# :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80080E93C3}> {80080E92F3}>) (READY . #<SB-C::LAMBDA-VAR :%SOURCE-NAME READY :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E92A3}> {80080E91D3}>) (CONTEXT . #<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTEXT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E9183}> {80080E90B3}>) (PORT . #<SB-C::LAMBDA-VAR :%SOURCE-NAME PORT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E9063}> {80080E8F93}>)) :BLOCKS #11=((#:EXIT-TAG-6 #12=#<SB-C::ENTRY {80080ED533}> #<SB-C::CTRAN 1 {80080ED3F3}> NIL) . #13=((#:DROP-THRU-TAG-5 #14=#<SB-C::ENTRY {80080ED2E3}> #<SB-C::CTRAN 2 {80080EB543}> #<SB-C::LVAR 3 {80080EB583}>) . #15=((TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION # #<SB-C::CTRAN 4 {80080E8463}> #<SB-C::LVAR 5 {80080E84A3}>)))) :TAGS NIL :TYPE-RESTRICTIONS NIL :LAMBDA #16=#<SB-C::CLAMBDA :%SOURCE-NAME SB-C::.ANONYMOUS. :%DEBUG-NAME (LAMBDA (&OPTIONAL #8# #7# &REST #6#) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :KIND (NIL) :TYPE #4# :WHERE-FROM :DEFINED :VARS (#8# #7# #6#) {80080EB403}> :CLEANUP #<SB-C::CLEANUP :KIND :UNWIND-PROTECT :MESS-UP #<SB-C::COMBINATION :FUN SB-C::%UNWIND-PROTECT :ARGS (#<SB-C::REF  :LEAF # {80080EE583}> #<SB-C::REF  :LEAF #3# {80080EE693}>) {80080ED843}> {80080EE703}> :HANDLED-CONDITIONS NIL :DISABLED-PACKAGE-LOCKS NIL :%POLICY #17=#<SB-C:POLICY ((SB-EXT:INHIBIT-WARNINGS 1) (SPEED 1) (SPACE 1) (SAFETY 1) (DEBUG 1) (COMPILATION-SPEED 1))> :USER-DATA NIL :PARENT #S(SB-KERNEL:LEXENV :FUNS #1# :VARS #5# :BLOCKS #11# :TAGS NIL :TYPE-RESTRICTIONS NIL :LAMBDA #16# :CLEANUP #<SB-C::CLEANUP :KIND :BLOCK :MESS-UP #12# {80080ED593}> :HANDLED-CONDITIONS NIL :DISABLED-PACKAGE-LOCKS NIL :%POLICY #17# :USER-DATA NIL :PARENT #S(SB-KERNEL:LEXENV :FUNS #1# :VARS #5# :BLOCKS #13# :TAGS NIL :TYPE-RESTRICTIONS NIL :LAMBDA #16# :CLEANUP #<SB-C::CLEANUP :KIND :BLOCK :MESS-UP #14# {80080ED343}> :HANDLED-CONDITIONS NIL :DISABLED-PACKAGE-LOCKS NIL :%POLICY #17# :USER-DATA NIL :PARENT #S(SB-KERNEL:LEXENV :FUNS #1# :VARS #5# :BLOCKS #15# :TAGS NIL :TYPE-RESTRICTIONS NIL :LAMBDA #16# :CLEANUP #<SB-C::CLEANUP :KIND :DYNAMIC-EXTENT :MESS-UP # {80080ED1B3}> :HANDLED-CONDITIONS NIL :DISABLED-PACKAGE-LOCKS NIL :%POLICY #17# :USER-DATA NIL :PARENT #S(SB-KERNEL:LEXENV :FUNS #1# :VARS #5# :BLOCKS #15# :TAGS NIL :TYPE-RESTRICTIONS NIL :LAMBDA #16# :CLEANUP NIL :HANDLED-CONDITIONS NIL :DISABLED-PACKAGE-LOCKS NIL :%POLICY #17# :USER-DATA NIL :PARENT # ...) ...) ...) ...) ...) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME WRITERS {80080EEB93}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTROLLERS {80080EECA3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME TABLE {80080EEDB3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME DISPATCHER :FLAGS (IGNORE) {80080EEEC3}>) NIL (NIL) :COMPILE)
11: ((FLET SB-C::PROCESS-IT :IN SB-C::PROCESS-DECLS) (IGNORE DISPATCHER READY CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)))
12: (SB-C::CALL-WITH-CURRENT-SOURCE-FORM #<FUNCTION (LAMBDA NIL :IN SB-C::PROCESS-DECLS) {80080EF02B}> (IGNORE DISPATCHER READY CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)))
13: (SB-C::PROCESS-DECLS ((DECLARE (IGNORE DISPATCHER READY CONTROLLERS))) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME WRITERS {80080EEB93}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTROLLERS {80080EECA3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME TABLE {80080EEDB3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME DISPATCHER :FLAGS (IGNORE) {80080EEEC3}>) NIL :LEXENV NIL :BINDING-FORM-P T :CONTEXT :COMPILE :ALLOW-LAMBDA-LIST NIL)
14: (SB-C::IR1-CONVERT-LET* #<SB-C::CTRAN 6 {80080ED683}> #<SB-C::CTRAN 7 {80080EE9F3}> #<SB-C::LVAR 8 {80080EEA33}> (LET* ((WRITERS (VECTOR (POOL-CLAIM-WRITER # 0) (POOL-CLAIM-WRITER # 1))) (CONTROLLERS (VECTOR #:LEFT0 #:RIGHT1)) (TABLE (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS))) (DISPATCHER (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE))) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT (SVREF WRITERS 0) 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER (SVREF WRITERS 0))) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)))
15: (SB-C::IR1-CONVERT #<SB-C::CTRAN 6 {80080ED683}> #<SB-C::CTRAN 7 {80080EE9F3}> #<SB-C::LVAR 8 {80080EEA33}> (LET* ((WRITERS (VECTOR (POOL-CLAIM-WRITER # 0) (POOL-CLAIM-WRITER # 1))) (CONTROLLERS (VECTOR #:LEFT0 #:RIGHT1)) (TABLE (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS))) (DISPATCHER (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE))) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT (SVREF WRITERS 0) 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER (SVREF WRITERS 0))) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)))
16: (SB-C::IR1-CONVERT-RETURN-FROM #<SB-C::CTRAN 6 {80080ED683}> #<SB-C::CTRAN 1 {80080ED3F3}> #<unused argument> (RETURN-FROM #:DROP-THRU-TAG-5 (LET* ((WRITERS (VECTOR # #)) (CONTROLLERS (VECTOR #:LEFT0 #:RIGHT1)) (TABLE (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT #)) (DISPATCHER (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE))) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT # 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER #)) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE))))
17: (SB-C::IR1-CONVERT #<SB-C::CTRAN 6 {80080ED683}> #<SB-C::CTRAN 1 {80080ED3F3}> NIL (RETURN-FROM #:DROP-THRU-TAG-5 (LET* ((WRITERS (VECTOR # #)) (CONTROLLERS (VECTOR #:LEFT0 #:RIGHT1)) (TABLE (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT #)) (DISPATCHER (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE))) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT # 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER #)) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE))))
18: (SB-C::IR1-CONVERT-PROGN-BODY #<SB-C::CTRAN 6 {80080ED683}> #<SB-C::CTRAN 1 {80080ED3F3}> NIL ((RETURN-FROM #:DROP-THRU-TAG-5 (LET* ((WRITERS #) (CONTROLLERS #) (TABLE #) (DISPATCHER #)) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)))))
19: (SB-C::IR1-CONVERT-%WITHIN-CLEANUP #<SB-C::CTRAN 9 {80080ED4F3}> #<SB-C::CTRAN 1 {80080ED3F3}> NIL (SB-C::%WITHIN-CLEANUP :UNWIND-PROTECT (SB-C::%UNWIND-PROTECT (SB-C::%ESCAPE-FUN #:EXIT-TAG-6) (SB-C::%CLEANUP-FUN #:CLEANUP-FUN-4)) (RETURN-FROM #:DROP-THRU-TAG-5 (LET* ((WRITERS #) (CONTROLLERS #) (TABLE #) (DISPATCHER #)) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)))))
20: (SB-C::IR1-CONVERT #<SB-C::CTRAN 9 {80080ED4F3}> #<SB-C::CTRAN 1 {80080ED3F3}> NIL (SB-C::%WITHIN-CLEANUP :UNWIND-PROTECT (SB-C::%UNWIND-PROTECT (SB-C::%ESCAPE-FUN #:EXIT-TAG-6) (SB-C::%CLEANUP-FUN #:CLEANUP-FUN-4)) (RETURN-FROM #:DROP-THRU-TAG-5 (LET* ((WRITERS #) (CONTROLLERS #) (TABLE #) (DISPATCHER #)) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)))))
21: (SB-C::IR1-CONVERT-PROGN-BODY #<SB-C::CTRAN 9 {80080ED4F3}> #<SB-C::CTRAN 1 {80080ED3F3}> NIL ((SB-C::%WITHIN-CLEANUP :UNWIND-PROTECT (SB-C::%UNWIND-PROTECT (SB-C::%ESCAPE-FUN #:EXIT-TAG-6) (SB-C::%CLEANUP-FUN #:CLEANUP-FUN-4)) (RETURN-FROM #:DROP-THRU-TAG-5 (LET* (# # # #) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE))))))
22: (SB-C::IR1-CONVERT-BLOCK #<SB-C::CTRAN 10 {80080ED2A3}> #<SB-C::CTRAN 1 {80080ED3F3}> NIL (BLOCK #1=#:EXIT-TAG-6 (SB-C::%WITHIN-CLEANUP :UNWIND-PROTECT (SB-C::%UNWIND-PROTECT (SB-C::%ESCAPE-FUN #1#) (SB-C::%CLEANUP-FUN #:CLEANUP-FUN-4)) (RETURN-FROM #:DROP-THRU-TAG-5 (LET* (# # # #) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE))))))
23: (SB-C::IR1-CONVERT #<SB-C::CTRAN 10 {80080ED2A3}> #<SB-C::CTRAN 1 {80080ED3F3}> NIL (BLOCK #1=#:EXIT-TAG-6 (SB-C::%WITHIN-CLEANUP :UNWIND-PROTECT (SB-C::%UNWIND-PROTECT (SB-C::%ESCAPE-FUN #1#) (SB-C::%CLEANUP-FUN #:CLEANUP-FUN-4)) (RETURN-FROM #:DROP-THRU-TAG-5 (LET* (# # # #) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE))))))
24: (SB-C::IR1-CONVERT-PROGN-BODY #<SB-C::CTRAN 10 {80080ED2A3}> #<SB-C::CTRAN 2 {80080EB543}> #<SB-C::LVAR 3 {80080EB583}> ((BLOCK #1=#:EXIT-TAG-6 (SB-C::%WITHIN-CLEANUP :UNWIND-PROTECT (SB-C::%UNWIND-PROTECT (SB-C::%ESCAPE-FUN #1#) (SB-C::%CLEANUP-FUN #2=#:CLEANUP-FUN-4)) (RETURN-FROM #:DROP-THRU-TAG-5 (LET* # # # # # # #)))) (LOCALLY (DECLARE (OPTIMIZE (SB-C::INSERT-DEBUG-CATCH 0))) (#2#) (SB-C:%CONTINUE-UNWIND))))
25: (SB-C::IR1-CONVERT-BLOCK #<SB-C::CTRAN 11 {80080ED1E3}> #<SB-C::CTRAN 2 {80080EB543}> #<SB-C::LVAR 3 {80080EB583}> (BLOCK #1=#:DROP-THRU-TAG-5 (BLOCK #2=#:EXIT-TAG-6 (SB-C::%WITHIN-CLEANUP :UNWIND-PROTECT (SB-C::%UNWIND-PROTECT (SB-C::%ESCAPE-FUN #2#) (SB-C::%CLEANUP-FUN #3=#:CLEANUP-FUN-4)) (RETURN-FROM #1# (LET* # # # # # # #)))) (LOCALLY (DECLARE (OPTIMIZE (SB-C::INSERT-DEBUG-CATCH 0))) (#3#) (SB-C:%CONTINUE-UNWIND))))
26: (SB-C::IR1-CONVERT #<SB-C::CTRAN 11 {80080ED1E3}> #<SB-C::CTRAN 2 {80080EB543}> #<SB-C::LVAR 3 {80080EB583}> (BLOCK #1=#:DROP-THRU-TAG-5 (BLOCK #2=#:EXIT-TAG-6 (SB-C::%WITHIN-CLEANUP :UNWIND-PROTECT (SB-C::%UNWIND-PROTECT (SB-C::%ESCAPE-FUN #2#) (SB-C::%CLEANUP-FUN #3=#:CLEANUP-FUN-4)) (RETURN-FROM #1# (LET* # # # # # # #)))) (LOCALLY (DECLARE (OPTIMIZE (SB-C::INSERT-DEBUG-CATCH 0))) (#3#) (SB-C:%CONTINUE-UNWIND))))
27: (SB-C::IR1-CONVERT-PROGN-BODY #<SB-C::CTRAN 11 {80080ED1E3}> #<SB-C::CTRAN 2 {80080EB543}> #<SB-C::LVAR 3 {80080EB583}> ((BLOCK #1=#:DROP-THRU-TAG-5 (BLOCK #:EXIT-TAG-6 (SB-C::%WITHIN-CLEANUP :UNWIND-PROTECT (SB-C::%UNWIND-PROTECT # #) (RETURN-FROM #1# #))) (LOCALLY (DECLARE (OPTIMIZE #)) (#:CLEANUP-FUN-4) (SB-C:%CONTINUE-UNWIND)))))
28: (SB-C::IR1-CONVERT-FBINDINGS #<SB-C::CTRAN 12 {80080EB7F3}> #<SB-C::CTRAN 2 {80080EB543}> #<SB-C::LVAR 3 {80080EB583}> (#<SB-C::CLAMBDA :%SOURCE-NAME #:CLEANUP-FUN-4 :%DEBUG-NAME (FLET \"CLEANUP-FUN-4\" :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :KIND (CLEANUP) :TYPE #<SB-KERNEL:BUILT-IN-CLASSOID FUNCTION (read-only)> :WHERE-FROM :DEFINED :VARS NIL {80080EBC53}>) ((BLOCK #1=#:DROP-THRU-TAG-5 (BLOCK #:EXIT-TAG-6 (SB-C::%WITHIN-CLEANUP :UNWIND-PROTECT (SB-C::%UNWIND-PROTECT # #) (RETURN-FROM #1# #))) (LOCALLY (DECLARE (OPTIMIZE #)) (#:CLEANUP-FUN-4) (SB-C:%CONTINUE-UNWIND)))))
29: (SB-C::IR1-CONVERT-FLET #<SB-C::CTRAN 12 {80080EB7F3}> #<SB-C::CTRAN 2 {80080EB543}> #<SB-C::LVAR 3 {80080EB583}> (FLET ((#1=#:CLEANUP-FUN-4 NIL (ARCDOCDB.IO:CHIUDI #:RIGHT-FILE3) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2) (VALUES))) (DECLARE (DYNAMIC-EXTENT (FUNCTION #1#))) (BLOCK #2=#:DROP-THRU-TAG-5 (BLOCK #:EXIT-TAG-6 (SB-C::%WITHIN-CLEANUP :UNWIND-PROTECT (SB-C::%UNWIND-PROTECT # #) (RETURN-FROM #2# #))) (LOCALLY (DECLARE (OPTIMIZE #)) (#1#) (SB-C:%CONTINUE-UNWIND)))))
30: (SB-C::IR1-CONVERT #<SB-C::CTRAN 12 {80080EB7F3}> #<SB-C::CTRAN 2 {80080EB543}> #<SB-C::LVAR 3 {80080EB583}> (FLET ((#1=#:CLEANUP-FUN-4 NIL (ARCDOCDB.IO:CHIUDI #:RIGHT-FILE3) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2) (VALUES))) (DECLARE (DYNAMIC-EXTENT (FUNCTION #1#))) (BLOCK #2=#:DROP-THRU-TAG-5 (BLOCK #:EXIT-TAG-6 (SB-C::%WITHIN-CLEANUP :UNWIND-PROTECT (SB-C::%UNWIND-PROTECT # #) (RETURN-FROM #2# #))) (LOCALLY (DECLARE (OPTIMIZE #)) (#1#) (SB-C:%CONTINUE-UNWIND)))))
31: (SB-C::IR1-CONVERT-UNWIND-PROTECT #<SB-C::CTRAN 12 {80080EB7F3}> #<SB-C::CTRAN 2 {80080EB543}> #<SB-C::LVAR 3 {80080EB583}> (UNWIND-PROTECT (LET* ((WRITERS (VECTOR # #)) (CONTROLLERS (VECTOR #:LEFT0 #:RIGHT1)) (TABLE (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT #)) (DISPATCHER (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE))) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT # 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER #)) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #:RIGHT-FILE3) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2)))
32: (SB-C::IR1-CONVERT #<SB-C::CTRAN 12 {80080EB7F3}> #<SB-C::CTRAN 2 {80080EB543}> #<SB-C::LVAR 3 {80080EB583}> (UNWIND-PROTECT (LET* ((WRITERS (VECTOR # #)) (CONTROLLERS (VECTOR #:LEFT0 #:RIGHT1)) (TABLE (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT #)) (DISPATCHER (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE))) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT # 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER #)) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #:RIGHT-FILE3) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2)))
33: (SB-C::IR1-CONVERT-PROGN-BODY #<SB-C::CTRAN 12 {80080EB7F3}> #<SB-C::CTRAN 2 {80080EB543}> #<SB-C::LVAR 3 {80080EB583}> ((UNWIND-PROTECT (LET* ((WRITERS #) (CONTROLLERS #) (TABLE #) (DISPATCHER #)) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #:RIGHT-FILE3) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2))))
34: (SB-C::IR1-CONVERT-AUX-BINDINGS #<SB-C::CTRAN 12 {80080EB7F3}> #<SB-C::CTRAN 2 {80080EB543}> #<SB-C::LVAR 3 {80080EB583}> ((UNWIND-PROTECT (LET* ((WRITERS #) (CONTROLLERS #) (TABLE #) (DISPATCHER #)) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #:RIGHT-FILE3) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2))) NIL NIL NIL :VALUE-SOURCE-FORMS NIL)
35: (SB-C::IR1-CONVERT-SPECIAL-BINDINGS #<SB-C::CTRAN 12 {80080EB7F3}> #<SB-C::CTRAN 2 {80080EB543}> #<SB-C::LVAR 3 {80080EB583}> ((UNWIND-PROTECT (LET* ((WRITERS #) (CONTROLLERS #) (TABLE #) (DISPATCHER #)) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #:RIGHT-FILE3) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2))) NIL NIL NIL NIL :VALUE-SOURCE-FORMS NIL)
36: (SB-C::IR1-CONVERT-LAMBDA-BODY ((UNWIND-PROTECT (LET* ((WRITERS #) (CONTROLLERS #) (TABLE #) (DISPATCHER #)) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #:RIGHT-FILE3) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2))) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:RIGHT1 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EAEA3}> {80080EADD3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:RIGHT-FILE3 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EAFC3}> {80080EAEF3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:IGNORE :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80080EB0E3}> {80080EB013}>) :AUX-VARS NIL :AUX-VALS NIL :SOURCE-NAME SB-C::.ANONYMOUS. :DEBUG-NAME (LAMBDA (&OPTIONAL #:RIGHT1 #:RIGHT-FILE3 &REST #:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :NOTE-LEXICAL-BINDINGS T :POST-BINDING-LEXENV NIL :LOCAL-POLICY NIL :VALUE-SOURCE-FORMS NIL)
37: (SB-C::IR1-CONVERT-HAIRY-ARGS #<SB-C::OPTIONAL-DISPATCH :%SOURCE-NAME SB-C::.ANONYMOUS. :%DEBUG-NAME (LAMBDA (&OPTIONAL #1=#:RIGHT1 #2=#:RIGHT-FILE3 &REST #3=#:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :TYPE #<SB-KERNEL:BUILT-IN-CLASSOID FUNCTION (read-only)> :WHERE-FROM :DEFINED :ARGLIST (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #1# :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EAEA3}> {80080EADD3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #2# :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EAFC3}> {80080EAEF3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #3# :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80080EB0E3}> {80080EB013}>) :ALLOWP NIL :KEYP NIL :MIN-ARGS 0 :MAX-ARGS 0 :MAIN-ENTRY NIL {80080EB253}> (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:RIGHT-FILE3 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EAFC3}> {80080EAEF3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:RIGHT1 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EAEA3}> {80080EADD3}>) (#:RIGHT-FILE3 #:RIGHT1) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:RIGHT-FILE3 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EAFC3}> {80080EAEF3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:RIGHT1 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EAEA3}> {80080EADD3}>) (#:RIGHT-FILE3 #:RIGHT1) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:IGNORE :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80080EB0E3}> {80080EB013}>) NIL ((UNWIND-PROTECT (LET* ((WRITERS #) (CONTROLLERS #) (TABLE #) (DISPATCHER #)) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #:RIGHT-FILE3) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2))) NIL NIL SB-C::.ANONYMOUS. (LAMBDA (&OPTIONAL #:RIGHT1 #:RIGHT-FILE3 &REST #:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) NIL NIL)
38: (SB-C::IR1-CONVERT-HAIRY-ARGS #<SB-C::OPTIONAL-DISPATCH :%SOURCE-NAME SB-C::.ANONYMOUS. :%DEBUG-NAME (LAMBDA (&OPTIONAL #1=#:RIGHT1 #2=#:RIGHT-FILE3 &REST #3=#:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :TYPE #<SB-KERNEL:BUILT-IN-CLASSOID FUNCTION (read-only)> :WHERE-FROM :DEFINED :ARGLIST (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #1# :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EAEA3}> {80080EADD3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #2# :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EAFC3}> {80080EAEF3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #3# :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80080EB0E3}> {80080EB013}>) :ALLOWP NIL :KEYP NIL :MIN-ARGS 0 :MAX-ARGS 0 :MAIN-ENTRY NIL {80080EB253}> (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:RIGHT1 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EAEA3}> {80080EADD3}>) (#:RIGHT1) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:RIGHT1 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EAEA3}> {80080EADD3}>) (#:RIGHT1) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:RIGHT-FILE3 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EAFC3}> {80080EAEF3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:IGNORE :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80080EB0E3}> {80080EB013}>) NIL ((UNWIND-PROTECT (LET* ((WRITERS #) (CONTROLLERS #) (TABLE #) (DISPATCHER #)) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #:RIGHT-FILE3) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2))) NIL NIL SB-C::.ANONYMOUS. (LAMBDA (&OPTIONAL #:RIGHT1 #:RIGHT-FILE3 &REST #:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) NIL NIL)
39: (SB-C::IR1-CONVERT-HAIRY-ARGS #<SB-C::OPTIONAL-DISPATCH :%SOURCE-NAME SB-C::.ANONYMOUS. :%DEBUG-NAME (LAMBDA (&OPTIONAL #1=#:RIGHT1 #2=#:RIGHT-FILE3 &REST #3=#:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :TYPE #<SB-KERNEL:BUILT-IN-CLASSOID FUNCTION (read-only)> :WHERE-FROM :DEFINED :ARGLIST (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #1# :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EAEA3}> {80080EADD3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #2# :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EAFC3}> {80080EAEF3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #3# :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80080EB0E3}> {80080EB013}>) :ALLOWP NIL :KEYP NIL :MIN-ARGS 0 :MAX-ARGS 0 :MAIN-ENTRY NIL {80080EB253}> NIL NIL NIL NIL (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:RIGHT1 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EAEA3}> {80080EADD3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:RIGHT-FILE3 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EAFC3}> {80080EAEF3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:IGNORE :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80080EB0E3}> {80080EB013}>) NIL ((UNWIND-PROTECT (LET* ((WRITERS #) (CONTROLLERS #) (TABLE #) (DISPATCHER #)) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #:RIGHT-FILE3) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2))) NIL NIL SB-C::.ANONYMOUS. (LAMBDA (&OPTIONAL #:RIGHT1 #:RIGHT-FILE3 &REST #:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) NIL NIL)
40: (SB-C::IR1-CONVERT-LAMBDA (LAMBDA (&OPTIONAL #:RIGHT1 #1=#:RIGHT-FILE3 &REST . #2=(#:IGNORE)) (DECLARE (IGNORE . #2#)) (UNWIND-PROTECT (LET* ((WRITERS #) (CONTROLLERS #) (TABLE #) (DISPATCHER #)) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #1#) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2))) :SOURCE-NAME SB-C::.ANONYMOUS. :DEBUG-NAME (LAMBDA (&OPTIONAL #:RIGHT1 #:RIGHT-FILE3 &REST #:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :MAYBE-ADD-DEBUG-CATCH T :FTYPE NIL)
41: (SB-C::FIND-OR-CONVERT-FUN-LEAF (LAMBDA (&OPTIONAL #:RIGHT1 #1=#:RIGHT-FILE3 &REST . #2=(#:IGNORE)) (DECLARE (IGNORE . #2#)) (UNWIND-PROTECT (LET* ((WRITERS #) (CONTROLLERS #) (TABLE #) (DISPATCHER #)) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #1#) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2))) #<SB-C::CTRAN 13 {80080EA963}>)
42: (SB-C::IR1-CONVERT-FUNCTION #<SB-C::CTRAN 13 {80080EA963}> #<SB-C::CTRAN 14 {80080EAB03}> #<SB-C::LVAR 15 {80080EAB43}> (FUNCTION (LAMBDA (&OPTIONAL #:RIGHT1 #1=#:RIGHT-FILE3 &REST . #2=(#:IGNORE)) (DECLARE (IGNORE . #2#)) (UNWIND-PROTECT (LET* (# # # #) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #1#) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2)))))
43: (SB-C::IR1-CONVERT #<SB-C::CTRAN 13 {80080EA963}> #<SB-C::CTRAN 14 {80080EAB03}> #<SB-C::LVAR 15 {80080EAB43}> (FUNCTION (LAMBDA (&OPTIONAL #:RIGHT1 #1=#:RIGHT-FILE3 &REST . #2=(#:IGNORE)) (DECLARE (IGNORE . #2#)) (UNWIND-PROTECT (LET* (# # # #) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #1#) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2)))))
44: (SB-C::IR1-CONVERT-MULTIPLE-VALUE-CALL #<SB-C::CTRAN 13 {80080EA963}> #<SB-C::CTRAN 16 {80080EA6B3}> #<SB-C::LVAR 17 {80080EA6F3}> (MULTIPLE-VALUE-CALL (FUNCTION (LAMBDA (&OPTIONAL #:RIGHT1 #1=#:RIGHT-FILE3 &REST . #2=(#:IGNORE)) (DECLARE (IGNORE . #2#)) (UNWIND-PROTECT (LET* # # # # # # #) (ARCDOCDB.IO:CHIUDI #1#) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2)))) (POOL-CLAIM-SERIES 82)))
45: (SB-C::IR1-CONVERT #<SB-C::CTRAN 13 {80080EA963}> #<SB-C::CTRAN 16 {80080EA6B3}> #<SB-C::LVAR 17 {80080EA6F3}> (MULTIPLE-VALUE-CALL (FUNCTION (LAMBDA (&OPTIONAL #:RIGHT1 #1=#:RIGHT-FILE3 &REST . #2=(#:IGNORE)) (DECLARE (IGNORE . #2#)) (UNWIND-PROTECT (LET* # # # # # # #) (ARCDOCDB.IO:CHIUDI #1#) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2)))) (POOL-CLAIM-SERIES 82)))
46: (SB-C::IR1-CONVERT-COMMON-FUNCTOID #<SB-C::CTRAN 13 {80080EA963}> #<SB-C::CTRAN 16 {80080EA6B3}> #<SB-C::LVAR 17 {80080EA6F3}> (MULTIPLE-VALUE-BIND (#:RIGHT1 #1=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* ((WRITERS #) (CONTROLLERS #) (TABLE #) (DISPATCHER #)) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #1#) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2))) MULTIPLE-VALUE-BIND)
47: (SB-C::IR1-CONVERT #<SB-C::CTRAN 13 {80080EA963}> #<SB-C::CTRAN 16 {80080EA6B3}> #<SB-C::LVAR 17 {80080EA6F3}> (MULTIPLE-VALUE-BIND (#:RIGHT1 #1=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* ((WRITERS #) (CONTROLLERS #) (TABLE #) (DISPATCHER #)) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #1#) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2))))
48: (SB-C::IR1-CONVERT-PROGN-BODY #<SB-C::CTRAN 13 {80080EA963}> #<SB-C::CTRAN 16 {80080EA6B3}> #<SB-C::LVAR 17 {80080EA6F3}> ((MULTIPLE-VALUE-BIND (#:RIGHT1 #1=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* (# # # #) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #1#) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2)))))
49: (SB-C::IR1-CONVERT-AUX-BINDINGS #<SB-C::CTRAN 13 {80080EA963}> #<SB-C::CTRAN 16 {80080EA6B3}> #<SB-C::LVAR 17 {80080EA6F3}> ((MULTIPLE-VALUE-BIND (#:RIGHT1 #1=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* (# # # #) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #1#) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2)))) NIL NIL NIL :VALUE-SOURCE-FORMS NIL)
50: (SB-C::IR1-CONVERT-SPECIAL-BINDINGS #<SB-C::CTRAN 13 {80080EA963}> #<SB-C::CTRAN 16 {80080EA6B3}> #<SB-C::LVAR 17 {80080EA6F3}> ((MULTIPLE-VALUE-BIND (#:RIGHT1 #1=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* (# # # #) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #1#) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2)))) NIL NIL NIL NIL :VALUE-SOURCE-FORMS NIL)
51: (SB-C::IR1-CONVERT-LAMBDA-BODY ((MULTIPLE-VALUE-BIND (#:RIGHT1 #1=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* (# # # #) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #1#) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2)))) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:LEFT0 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EA013}> {80080E9F43}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:LEFT-FILE2 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EA133}> {80080EA063}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:IGNORE :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80080EA253}> {80080EA183}>) :AUX-VARS NIL :AUX-VALS NIL :SOURCE-NAME SB-C::.ANONYMOUS. :DEBUG-NAME (LAMBDA (&OPTIONAL #:LEFT0 #:LEFT-FILE2 &REST #:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :NOTE-LEXICAL-BINDINGS T :POST-BINDING-LEXENV NIL :LOCAL-POLICY NIL :VALUE-SOURCE-FORMS NIL)
52: (SB-C::IR1-CONVERT-HAIRY-ARGS #<SB-C::OPTIONAL-DISPATCH :%SOURCE-NAME SB-C::.ANONYMOUS. :%DEBUG-NAME (LAMBDA (&OPTIONAL #1=#:LEFT0 #2=#:LEFT-FILE2 &REST #3=#:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :TYPE #<SB-KERNEL:BUILT-IN-CLASSOID FUNCTION (read-only)> :WHERE-FROM :DEFINED :ARGLIST (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #1# :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EA013}> {80080E9F43}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #2# :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EA133}> {80080EA063}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #3# :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80080EA253}> {80080EA183}>) :ALLOWP NIL :KEYP NIL :MIN-ARGS 0 :MAX-ARGS 0 :MAIN-ENTRY NIL {80080EA3C3}> (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:LEFT-FILE2 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EA133}> {80080EA063}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:LEFT0 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EA013}> {80080E9F43}>) (#:LEFT-FILE2 #:LEFT0) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:LEFT-FILE2 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EA133}> {80080EA063}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:LEFT0 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EA013}> {80080E9F43}>) (#:LEFT-FILE2 #:LEFT0) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:IGNORE :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80080EA253}> {80080EA183}>) NIL ((MULTIPLE-VALUE-BIND (#:RIGHT1 #1=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* (# # # #) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #1#) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2)))) NIL NIL SB-C::.ANONYMOUS. (LAMBDA (&OPTIONAL #:LEFT0 #:LEFT-FILE2 &REST #:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) NIL NIL)
53: (SB-C::IR1-CONVERT-HAIRY-ARGS #<SB-C::OPTIONAL-DISPATCH :%SOURCE-NAME SB-C::.ANONYMOUS. :%DEBUG-NAME (LAMBDA (&OPTIONAL #1=#:LEFT0 #2=#:LEFT-FILE2 &REST #3=#:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :TYPE #<SB-KERNEL:BUILT-IN-CLASSOID FUNCTION (read-only)> :WHERE-FROM :DEFINED :ARGLIST (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #1# :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EA013}> {80080E9F43}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #2# :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EA133}> {80080EA063}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #3# :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80080EA253}> {80080EA183}>) :ALLOWP NIL :KEYP NIL :MIN-ARGS 0 :MAX-ARGS 0 :MAIN-ENTRY NIL {80080EA3C3}> (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:LEFT0 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EA013}> {80080E9F43}>) (#:LEFT0) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:LEFT0 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EA013}> {80080E9F43}>) (#:LEFT0) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:LEFT-FILE2 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EA133}> {80080EA063}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:IGNORE :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80080EA253}> {80080EA183}>) NIL ((MULTIPLE-VALUE-BIND (#:RIGHT1 #1=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* (# # # #) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #1#) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2)))) NIL NIL SB-C::.ANONYMOUS. (LAMBDA (&OPTIONAL #:LEFT0 #:LEFT-FILE2 &REST #:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) NIL NIL)
54: (SB-C::IR1-CONVERT-HAIRY-ARGS #<SB-C::OPTIONAL-DISPATCH :%SOURCE-NAME SB-C::.ANONYMOUS. :%DEBUG-NAME (LAMBDA (&OPTIONAL #1=#:LEFT0 #2=#:LEFT-FILE2 &REST #3=#:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :TYPE #<SB-KERNEL:BUILT-IN-CLASSOID FUNCTION (read-only)> :WHERE-FROM :DEFINED :ARGLIST (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #1# :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EA013}> {80080E9F43}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #2# :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EA133}> {80080EA063}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #3# :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80080EA253}> {80080EA183}>) :ALLOWP NIL :KEYP NIL :MIN-ARGS 0 :MAX-ARGS 0 :MAIN-ENTRY NIL {80080EA3C3}> NIL NIL NIL NIL (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:LEFT0 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EA013}> {80080E9F43}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:LEFT-FILE2 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080EA133}> {80080EA063}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:IGNORE :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80080EA253}> {80080EA183}>) NIL ((MULTIPLE-VALUE-BIND (#:RIGHT1 #1=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* (# # # #) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #1#) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2)))) NIL NIL SB-C::.ANONYMOUS. (LAMBDA (&OPTIONAL #:LEFT0 #:LEFT-FILE2 &REST #:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) NIL NIL)
55: (SB-C::IR1-CONVERT-LAMBDA (LAMBDA (&OPTIONAL #:LEFT0 #1=#:LEFT-FILE2 &REST . #2=(#:IGNORE)) (DECLARE (IGNORE . #2#)) (MULTIPLE-VALUE-BIND (#:RIGHT1 #3=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* (# # # #) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #3#) (ARCDOCDB.IO:CHIUDI #1#)))) :SOURCE-NAME SB-C::.ANONYMOUS. :DEBUG-NAME (LAMBDA (&OPTIONAL #:LEFT0 #:LEFT-FILE2 &REST #:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :MAYBE-ADD-DEBUG-CATCH T :FTYPE NIL)
56: (SB-C::FIND-OR-CONVERT-FUN-LEAF (LAMBDA (&OPTIONAL #:LEFT0 #1=#:LEFT-FILE2 &REST . #2=(#:IGNORE)) (DECLARE (IGNORE . #2#)) (MULTIPLE-VALUE-BIND (#:RIGHT1 #3=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* (# # # #) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #3#) (ARCDOCDB.IO:CHIUDI #1#)))) #<SB-C::CTRAN 18 {80080E9AD3}>)
57: (SB-C::IR1-CONVERT-FUNCTION #<SB-C::CTRAN 18 {80080E9AD3}> #<SB-C::CTRAN 19 {80080E9C73}> #<SB-C::LVAR 20 {80080E9CB3}> (FUNCTION (LAMBDA (&OPTIONAL #:LEFT0 #1=#:LEFT-FILE2 &REST . #2=(#:IGNORE)) (DECLARE (IGNORE . #2#)) (MULTIPLE-VALUE-BIND (#:RIGHT1 #3=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* # # # # # # #) (ARCDOCDB.IO:CHIUDI #3#) (ARCDOCDB.IO:CHIUDI #1#))))))
58: (SB-C::IR1-CONVERT #<SB-C::CTRAN 18 {80080E9AD3}> #<SB-C::CTRAN 19 {80080E9C73}> #<SB-C::LVAR 20 {80080E9CB3}> (FUNCTION (LAMBDA (&OPTIONAL #:LEFT0 #1=#:LEFT-FILE2 &REST . #2=(#:IGNORE)) (DECLARE (IGNORE . #2#)) (MULTIPLE-VALUE-BIND (#:RIGHT1 #3=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* # # # # # # #) (ARCDOCDB.IO:CHIUDI #3#) (ARCDOCDB.IO:CHIUDI #1#))))))
59: (SB-C::IR1-CONVERT-MULTIPLE-VALUE-CALL #<SB-C::CTRAN 18 {80080E9AD3}> #<SB-C::CTRAN 21 {80080E9823}> #<SB-C::LVAR 22 {80080E9863}> (MULTIPLE-VALUE-CALL (FUNCTION (LAMBDA (&OPTIONAL #:LEFT0 #:LEFT-FILE2 &REST . #1=(#:IGNORE)) (DECLARE (IGNORE . #1#)) (MULTIPLE-VALUE-BIND (#:RIGHT1 #:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT # # #)))) (POOL-CLAIM-SERIES 81)))
60: (SB-C::IR1-CONVERT #<SB-C::CTRAN 18 {80080E9AD3}> #<SB-C::CTRAN 21 {80080E9823}> #<SB-C::LVAR 22 {80080E9863}> (MULTIPLE-VALUE-CALL (FUNCTION (LAMBDA (&OPTIONAL #:LEFT0 #:LEFT-FILE2 &REST . #1=(#:IGNORE)) (DECLARE (IGNORE . #1#)) (MULTIPLE-VALUE-BIND (#:RIGHT1 #:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT # # #)))) (POOL-CLAIM-SERIES 81)))
61: (SB-C::IR1-CONVERT-COMMON-FUNCTOID #<SB-C::CTRAN 18 {80080E9AD3}> #<SB-C::CTRAN 21 {80080E9823}> #<SB-C::LVAR 22 {80080E9863}> (MULTIPLE-VALUE-BIND (#:LEFT0 #1=#:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND (#:RIGHT1 #2=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* (# # # #) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #2#) (ARCDOCDB.IO:CHIUDI #1#)))) MULTIPLE-VALUE-BIND)
62: (SB-C::IR1-CONVERT #<SB-C::CTRAN 18 {80080E9AD3}> #<SB-C::CTRAN 21 {80080E9823}> #<SB-C::LVAR 22 {80080E9863}> (MULTIPLE-VALUE-BIND (#:LEFT0 #1=#:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND (#:RIGHT1 #2=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* (# # # #) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #2#) (ARCDOCDB.IO:CHIUDI #1#)))))
63: (SB-C::IR1-CONVERT-PROGN-BODY #<SB-C::CTRAN 18 {80080E9AD3}> #<SB-C::CTRAN 21 {80080E9823}> #<SB-C::LVAR 22 {80080E9863}> ((MULTIPLE-VALUE-BIND (#:LEFT0 #1=#:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND (#:RIGHT1 #2=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* # # # # # # #) (ARCDOCDB.IO:CHIUDI #2#) (ARCDOCDB.IO:CHIUDI #1#))))))
64: (SB-C::IR1-CONVERT-AUX-BINDINGS #<SB-C::CTRAN 18 {80080E9AD3}> #<SB-C::CTRAN 21 {80080E9823}> #<SB-C::LVAR 22 {80080E9863}> ((MULTIPLE-VALUE-BIND (#:LEFT0 #1=#:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND (#:RIGHT1 #2=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* # # # # # # #) (ARCDOCDB.IO:CHIUDI #2#) (ARCDOCDB.IO:CHIUDI #1#))))) NIL NIL NIL :VALUE-SOURCE-FORMS NIL)
65: (SB-C::IR1-CONVERT-SPECIAL-BINDINGS #<SB-C::CTRAN 18 {80080E9AD3}> #<SB-C::CTRAN 21 {80080E9823}> #<SB-C::LVAR 22 {80080E9863}> ((MULTIPLE-VALUE-BIND (#:LEFT0 #1=#:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND (#:RIGHT1 #2=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* # # # # # # #) (ARCDOCDB.IO:CHIUDI #2#) (ARCDOCDB.IO:CHIUDI #1#))))) NIL NIL NIL NIL :VALUE-SOURCE-FORMS NIL)
66: (SB-C::IR1-CONVERT-LAMBDA-BODY ((MULTIPLE-VALUE-BIND (#:LEFT0 #1=#:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND (#:RIGHT1 #2=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* # # # # # # #) (ARCDOCDB.IO:CHIUDI #2#) (ARCDOCDB.IO:CHIUDI #1#))))) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME PORT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E9063}> {80080E8F93}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTEXT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E9183}> {80080E90B3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME READY :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E92A3}> {80080E91D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:IGNORE :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80080E93C3}> {80080E92F3}>) :AUX-VARS NIL :AUX-VALS NIL :SOURCE-NAME SB-C::.ANONYMOUS. :DEBUG-NAME (LAMBDA (&OPTIONAL PORT CONTEXT READY &REST #:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :NOTE-LEXICAL-BINDINGS T :POST-BINDING-LEXENV NIL :LOCAL-POLICY NIL :VALUE-SOURCE-FORMS NIL)
67: (SB-C::IR1-CONVERT-HAIRY-ARGS #<SB-C::OPTIONAL-DISPATCH :%SOURCE-NAME SB-C::.ANONYMOUS. :%DEBUG-NAME (LAMBDA (&OPTIONAL PORT CONTEXT READY &REST #1=#:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :TYPE #<SB-KERNEL:BUILT-IN-CLASSOID FUNCTION (read-only)> :WHERE-FROM :DEFINED :ARGLIST (#<SB-C::LAMBDA-VAR :%SOURCE-NAME PORT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E9063}> {80080E8F93}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTEXT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E9183}> {80080E90B3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME READY :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E92A3}> {80080E91D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #1# :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80080E93C3}> {80080E92F3}>) :ALLOWP NIL :KEYP NIL :MIN-ARGS 0 :MAX-ARGS 0 :MAIN-ENTRY NIL {80080E9533}> (#<SB-C::LAMBDA-VAR :%SOURCE-NAME READY :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E92A3}> {80080E91D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTEXT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E9183}> {80080E90B3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME PORT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E9063}> {80080E8F93}>) (READY CONTEXT PORT) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME READY :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E92A3}> {80080E91D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTEXT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E9183}> {80080E90B3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME PORT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E9063}> {80080E8F93}>) (READY CONTEXT PORT) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:IGNORE :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80080E93C3}> {80080E92F3}>) NIL ((MULTIPLE-VALUE-BIND (#:LEFT0 #1=#:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND (#:RIGHT1 #2=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* # # # # # # #) (ARCDOCDB.IO:CHIUDI #2#) (ARCDOCDB.IO:CHIUDI #1#))))) NIL NIL SB-C::.ANONYMOUS. (LAMBDA (&OPTIONAL PORT CONTEXT READY &REST #:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) NIL NIL)
68: (SB-C::IR1-CONVERT-HAIRY-ARGS #<SB-C::OPTIONAL-DISPATCH :%SOURCE-NAME SB-C::.ANONYMOUS. :%DEBUG-NAME (LAMBDA (&OPTIONAL PORT CONTEXT READY &REST #1=#:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :TYPE #<SB-KERNEL:BUILT-IN-CLASSOID FUNCTION (read-only)> :WHERE-FROM :DEFINED :ARGLIST (#<SB-C::LAMBDA-VAR :%SOURCE-NAME PORT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E9063}> {80080E8F93}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTEXT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E9183}> {80080E90B3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME READY :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E92A3}> {80080E91D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #1# :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80080E93C3}> {80080E92F3}>) :ALLOWP NIL :KEYP NIL :MIN-ARGS 0 :MAX-ARGS 0 :MAIN-ENTRY NIL {80080E9533}> (#<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTEXT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E9183}> {80080E90B3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME PORT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E9063}> {80080E8F93}>) (CONTEXT PORT) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTEXT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E9183}> {80080E90B3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME PORT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E9063}> {80080E8F93}>) (CONTEXT PORT) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME READY :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E92A3}> {80080E91D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:IGNORE :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80080E93C3}> {80080E92F3}>) NIL ((MULTIPLE-VALUE-BIND (#:LEFT0 #1=#:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND (#:RIGHT1 #2=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* # # # # # # #) (ARCDOCDB.IO:CHIUDI #2#) (ARCDOCDB.IO:CHIUDI #1#))))) NIL NIL SB-C::.ANONYMOUS. (LAMBDA (&OPTIONAL PORT CONTEXT READY &REST #:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) NIL NIL)
69: (SB-C::IR1-CONVERT-HAIRY-ARGS #<SB-C::OPTIONAL-DISPATCH :%SOURCE-NAME SB-C::.ANONYMOUS. :%DEBUG-NAME (LAMBDA (&OPTIONAL PORT CONTEXT READY &REST #1=#:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :TYPE #<SB-KERNEL:BUILT-IN-CLASSOID FUNCTION (read-only)> :WHERE-FROM :DEFINED :ARGLIST (#<SB-C::LAMBDA-VAR :%SOURCE-NAME PORT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E9063}> {80080E8F93}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTEXT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E9183}> {80080E90B3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME READY :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E92A3}> {80080E91D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #1# :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80080E93C3}> {80080E92F3}>) :ALLOWP NIL :KEYP NIL :MIN-ARGS 0 :MAX-ARGS 0 :MAIN-ENTRY NIL {80080E9533}> (#<SB-C::LAMBDA-VAR :%SOURCE-NAME PORT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E9063}> {80080E8F93}>) (PORT) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME PORT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E9063}> {80080E8F93}>) (PORT) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTEXT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E9183}> {80080E90B3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME READY :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E92A3}> {80080E91D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:IGNORE :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80080E93C3}> {80080E92F3}>) NIL ((MULTIPLE-VALUE-BIND (#:LEFT0 #1=#:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND (#:RIGHT1 #2=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* # # # # # # #) (ARCDOCDB.IO:CHIUDI #2#) (ARCDOCDB.IO:CHIUDI #1#))))) NIL NIL SB-C::.ANONYMOUS. (LAMBDA (&OPTIONAL PORT CONTEXT READY &REST #:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) NIL NIL)
70: (SB-C::IR1-CONVERT-HAIRY-ARGS #<SB-C::OPTIONAL-DISPATCH :%SOURCE-NAME SB-C::.ANONYMOUS. :%DEBUG-NAME (LAMBDA (&OPTIONAL PORT CONTEXT READY &REST #1=#:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :TYPE #<SB-KERNEL:BUILT-IN-CLASSOID FUNCTION (read-only)> :WHERE-FROM :DEFINED :ARGLIST (#<SB-C::LAMBDA-VAR :%SOURCE-NAME PORT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E9063}> {80080E8F93}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTEXT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E9183}> {80080E90B3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME READY :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E92A3}> {80080E91D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #1# :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80080E93C3}> {80080E92F3}>) :ALLOWP NIL :KEYP NIL :MIN-ARGS 0 :MAX-ARGS 0 :MAIN-ENTRY NIL {80080E9533}> NIL NIL NIL NIL (#<SB-C::LAMBDA-VAR :%SOURCE-NAME PORT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E9063}> {80080E8F93}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTEXT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E9183}> {80080E90B3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME READY :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80080E92A3}> {80080E91D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:IGNORE :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80080E93C3}> {80080E92F3}>) NIL ((MULTIPLE-VALUE-BIND (#:LEFT0 #1=#:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND (#:RIGHT1 #2=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* # # # # # # #) (ARCDOCDB.IO:CHIUDI #2#) (ARCDOCDB.IO:CHIUDI #1#))))) NIL NIL SB-C::.ANONYMOUS. (LAMBDA (&OPTIONAL PORT CONTEXT READY &REST #:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) NIL NIL)
71: (SB-C::IR1-CONVERT-LAMBDA (LAMBDA (&OPTIONAL PORT CONTEXT READY &REST . #1=(#:IGNORE)) (DECLARE (IGNORE . #1#)) (MULTIPLE-VALUE-BIND (#:LEFT0 #2=#:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND (#:RIGHT1 #3=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* # # # # # # #) (ARCDOCDB.IO:CHIUDI #3#) (ARCDOCDB.IO:CHIUDI #2#))))) :SOURCE-NAME SB-C::.ANONYMOUS. :DEBUG-NAME (LAMBDA (&OPTIONAL PORT CONTEXT READY &REST #:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :MAYBE-ADD-DEBUG-CATCH T :FTYPE NIL)
72: (SB-C::FIND-OR-CONVERT-FUN-LEAF (LAMBDA (&OPTIONAL PORT CONTEXT READY &REST . #1=(#:IGNORE)) (DECLARE (IGNORE . #1#)) (MULTIPLE-VALUE-BIND (#:LEFT0 #2=#:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND (#:RIGHT1 #3=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* # # # # # # #) (ARCDOCDB.IO:CHIUDI #3#) (ARCDOCDB.IO:CHIUDI #2#))))) #<SB-C::CTRAN 23 {80080E8893}>)
73: (SB-C::IR1-CONVERT-FUNCTION #<SB-C::CTRAN 23 {80080E8893}> #<SB-C::CTRAN 24 {80080E8CC3}> #<SB-C::LVAR 25 {80080E8D03}> (FUNCTION (LAMBDA (&OPTIONAL PORT CONTEXT READY &REST . #1=(#:IGNORE)) (DECLARE (IGNORE . #1#)) (MULTIPLE-VALUE-BIND (#:LEFT0 #:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND (#:RIGHT1 #:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT # # #))))))
74: (SB-C::IR1-CONVERT #<SB-C::CTRAN 23 {80080E8893}> #<SB-C::CTRAN 24 {80080E8CC3}> #<SB-C::LVAR 25 {80080E8D03}> (FUNCTION (LAMBDA (&OPTIONAL PORT CONTEXT READY &REST . #1=(#:IGNORE)) (DECLARE (IGNORE . #1#)) (MULTIPLE-VALUE-BIND (#:LEFT0 #:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND (#:RIGHT1 #:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT # # #))))))
75: (SB-C::IR1-CONVERT-MULTIPLE-VALUE-CALL #<SB-C::CTRAN 23 {80080E8893}> #<SB-C::CTRAN 4 {80080E8463}> #<SB-C::LVAR 5 {80080E84A3}> (MULTIPLE-VALUE-CALL (FUNCTION (LAMBDA (&OPTIONAL PORT CONTEXT READY &REST . #1=(#:IGNORE)) (DECLARE (IGNORE . #1#)) (MULTIPLE-VALUE-BIND (#:LEFT0 #:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND # # #)))) (POOL-CLAIM-LOCAL :ACTIVE T :SHARDS 1 :CAPACITY 1 :START 0)))
76: (SB-C::IR1-CONVERT #<SB-C::CTRAN 23 {80080E8893}> #<SB-C::CTRAN 4 {80080E8463}> #<SB-C::LVAR 5 {80080E84A3}> (MULTIPLE-VALUE-CALL (FUNCTION (LAMBDA (&OPTIONAL PORT CONTEXT READY &REST . #1=(#:IGNORE)) (DECLARE (IGNORE . #1#)) (MULTIPLE-VALUE-BIND (#:LEFT0 #:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND # # #)))) (POOL-CLAIM-LOCAL :ACTIVE T :SHARDS 1 :CAPACITY 1 :START 0)))
77: (SB-C::IR1-CONVERT-COMMON-FUNCTOID #<SB-C::CTRAN 23 {80080E8893}> #<SB-C::CTRAN 4 {80080E8463}> #<SB-C::LVAR 5 {80080E84A3}> (MULTIPLE-VALUE-BIND (PORT CONTEXT READY) (POOL-CLAIM-LOCAL :ACTIVE T :SHARDS 1 :CAPACITY 1 :START 0) (MULTIPLE-VALUE-BIND (#:LEFT0 #1=#:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND (#:RIGHT1 #2=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* # # # # # # #) (ARCDOCDB.IO:CHIUDI #2#) (ARCDOCDB.IO:CHIUDI #1#))))) MULTIPLE-VALUE-BIND)
78: (SB-C::IR1-CONVERT #<SB-C::CTRAN 23 {80080E8893}> #<SB-C::CTRAN 4 {80080E8463}> #<SB-C::LVAR 5 {80080E84A3}> (MULTIPLE-VALUE-BIND (PORT CONTEXT READY) (POOL-CLAIM-LOCAL :ACTIVE T :SHARDS 1 :CAPACITY 1 :START 0) (MULTIPLE-VALUE-BIND (#:LEFT0 #1=#:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND (#:RIGHT1 #2=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* # # # # # # #) (ARCDOCDB.IO:CHIUDI #2#) (ARCDOCDB.IO:CHIUDI #1#))))))
79: (SB-C::IR1-CONVERT-COMMON-FUNCTOID #<SB-C::CTRAN 23 {80080E8893}> #<SB-C::CTRAN 4 {80080E8463}> #<SB-C::LVAR 5 {80080E84A3}> (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT (SVREF WRITERS 0) 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER (SVREF WRITERS 0))) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) WITH-POOL-DISPATCH)
80: (SB-C::IR1-CONVERT #<SB-C::CTRAN 23 {80080E8893}> #<SB-C::CTRAN 4 {80080E8463}> #<SB-C::LVAR 5 {80080E84A3}> (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT (SVREF WRITERS 0) 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER (SVREF WRITERS 0))) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)))
81: (SB-C::IR1-CONVERT-PROGN-BODY #<SB-C::CTRAN 23 {80080E8893}> #<SB-C::CTRAN 4 {80080E8463}> #<SB-C::LVAR 5 {80080E84A3}> ((WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT # 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER #)) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE))))
82: (SB-C::IR1-CONVERT-BLOCK #<SB-C::CTRAN 26 {80080E8713}> #<SB-C::CTRAN 4 {80080E8463}> #<SB-C::LVAR 5 {80080E84A3}> (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT # 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER #)) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE))))
83: (SB-C::IR1-CONVERT #<SB-C::CTRAN 26 {80080E8713}> #<SB-C::CTRAN 4 {80080E8463}> #<SB-C::LVAR 5 {80080E84A3}> (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT # 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER #)) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE))))
84: (SB-C::IR1-CONVERT-PROGN-BODY #<SB-C::CTRAN 26 {80080E8713}> #<SB-C::CTRAN 4 {80080E8463}> #<SB-C::LVAR 5 {80080E84A3}> ((BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)))))
85: (SB-C::IR1-CONVERT-AUX-BINDINGS #<SB-C::CTRAN 26 {80080E8713}> #<SB-C::CTRAN 4 {80080E8463}> #<SB-C::LVAR 5 {80080E84A3}> ((BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)))) NIL NIL NIL :VALUE-SOURCE-FORMS NIL)
86: (SB-C::IR1-CONVERT-SPECIAL-BINDINGS #<SB-C::CTRAN 26 {80080E8713}> #<SB-C::CTRAN 4 {80080E8463}> #<SB-C::LVAR 5 {80080E84A3}> ((BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)))) NIL NIL NIL NIL :VALUE-SOURCE-FORMS NIL)
87: (SB-C::IR1-CONVERT-LAMBDA-BODY ((BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)))) NIL :AUX-VARS NIL :AUX-VALS NIL :SOURCE-NAME TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION :DEBUG-NAME NIL :NOTE-LEXICAL-BINDINGS T :POST-BINDING-LEXENV NIL :LOCAL-POLICY NIL :VALUE-SOURCE-FORMS NIL)
88: (SB-C::IR1-CONVERT-LAMBDA (LAMBDA NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)))) :SOURCE-NAME TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION :DEBUG-NAME NIL :MAYBE-ADD-DEBUG-CATCH T :FTYPE NIL)
89: (SB-C::IR1-CONVERT-LAMBDA-FOR-DEFUN (LAMBDA NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)))) #<SB-C::DEFINED-FUN :%SOURCE-NAME TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION :INLINEP NIL :SAME-BLOCK-P T {80080E70C3}> T)
90: (SB-C::IR1-CONVERT-LAMBDALIKE (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)))) :SOURCE-NAME SB-C::.ANONYMOUS. :DEBUG-NAME TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION :FTYPE NIL)
91: (SB-C::FIND-OR-CONVERT-FUN-LEAF (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)))) #<SB-C::CTRAN 27 {80080E7E23}>)
92: (SB-C::IR1-CONVERT-FUNCTION #<SB-C::CTRAN 27 {80080E7E23}> #<SB-C::CTRAN 28 {80080E7FB3}> #<SB-C::LVAR 29 {80080E7FF3}> (FUNCTION (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE))))))
93: (SB-C::IR1-CONVERT #<SB-C::CTRAN 27 {80080E7E23}> #<SB-C::CTRAN 28 {80080E7FB3}> #<SB-C::LVAR 29 {80080E7FF3}> (FUNCTION (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE))))))
94: (SB-C::IR1-CONVERT-COMMON-FUNCTOID #<SB-C::CTRAN 27 {80080E7E23}> #<SB-C::CTRAN 28 {80080E7FB3}> #<SB-C::LVAR 29 {80080E7FF3}> (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)))) SB-INT:NAMED-LAMBDA)
95: (SB-C::IR1-CONVERT #<SB-C::CTRAN 27 {80080E7E23}> #<SB-C::CTRAN 28 {80080E7FB3}> #<SB-C::LVAR 29 {80080E7FF3}> (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)))))
96: (SB-C::IR1-CONVERT-COMBINATION-ARGS #<SB-C::LVAR 30 {80080E7C93}> #<SB-C::CTRAN 31 {80080E7C53}> #<SB-C::CTRAN 32 {80080E7B43}> NIL ((QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE))))) :PASS-NARGS T :ARG-SOURCE-FORMS NIL)
97: (SB-C::IR1-CONVERT-COMBINATION #<SB-C::CTRAN 33 {80080E79C3}> #<SB-C::CTRAN 32 {80080E7B43}> NIL (SB-IMPL::%DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE))))) #<SB-C::GLOBAL-VAR :%SOURCE-NAME SB-IMPL::%DEFUN :TYPE #<SB-KERNEL:BUILT-IN-CLASSOID FUNCTION (read-only)> :DEFINED-TYPE #<SB-KERNEL:FUN-TYPE (FUNCTION (T FUNCTION &OPTIONAL T T) (VALUES (OR CONS SYMBOL) &OPTIONAL))> :WHERE-FROM :DEFINED :KIND :GLOBAL-FUNCTION {80080E7BE3}>)
98: (SB-C::IR1-CONVERT-COMBINATION-CHECKING-TYPE #<SB-C::CTRAN 33 {80080E79C3}> #<SB-C::CTRAN 32 {80080E7B43}> NIL (SB-IMPL::%DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE))))) #<SB-C::GLOBAL-VAR :%SOURCE-NAME SB-IMPL::%DEFUN :TYPE #<SB-KERNEL:BUILT-IN-CLASSOID FUNCTION (read-only)> :DEFINED-TYPE #<SB-KERNEL:FUN-TYPE (FUNCTION (T FUNCTION &OPTIONAL T T) (VALUES (OR CONS SYMBOL) &OPTIONAL))> :WHERE-FROM :DEFINED :KIND :GLOBAL-FUNCTION {80080E7BE3}>)
99: (SB-C::IR1-CONVERT #<SB-C::CTRAN 33 {80080E79C3}> #<SB-C::CTRAN 32 {80080E7B43}> NIL (SB-IMPL::%DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE))))))
100: (SB-C::IR1-CONVERT-PROGN-BODY #<SB-C::CTRAN 33 {80080E79C3}> #<SB-C::CTRAN 34 {80080E7713}> #<SB-C::LVAR 35 {80080E7753}> ((SB-IMPL::%DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH # # # # # # #)))) NIL))
101: (SB-C::IR1-CONVERT-AUX-BINDINGS #<SB-C::CTRAN 33 {80080E79C3}> #<SB-C::CTRAN 34 {80080E7713}> #<SB-C::LVAR 35 {80080E7753}> ((SB-IMPL::%DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH # # # # # # #)))) NIL) NIL NIL NIL :VALUE-SOURCE-FORMS NIL)
102: (SB-C::IR1-CONVERT-SPECIAL-BINDINGS #<SB-C::CTRAN 33 {80080E79C3}> #<SB-C::CTRAN 34 {80080E7713}> #<SB-C::LVAR 35 {80080E7753}> ((SB-IMPL::%DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH # # # # # # #)))) NIL) NIL NIL NIL NIL :VALUE-SOURCE-FORMS NIL)
103: (SB-C::IR1-CONVERT-LAMBDA-BODY ((SB-IMPL::%DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH # # # # # # #)))) NIL) NIL :AUX-VARS NIL :AUX-VALS NIL :SOURCE-NAME SB-C::.ANONYMOUS. :DEBUG-NAME \"top level form\" :NOTE-LEXICAL-BINDINGS T :POST-BINDING-LEXENV NIL :LOCAL-POLICY NIL :VALUE-SOURCE-FORMS NIL)
104: (SB-C::IR1-TOPLEVEL (SB-IMPL::%DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE))))) (#1=(SB-IMPL::%DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION . #2=(#)))) (PROGN (EVAL-WHEN (:COMPILE-TOPLEVEL) (SB-C:%COMPILER-DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) T NIL NIL)) #1#) #3=(DEFUN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL . #2#) (PROGN #3# (PUSHNEW (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) *TESTS*)) SB-C::ORIGINAL-SOURCE-START 0 9) NIL T)
105: (SB-C::CONVERT-AND-MAYBE-COMPILE (SB-IMPL::%DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE))))) (#1=(SB-IMPL::%DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION . #2=(#)))) (PROGN (EVAL-WHEN (:COMPILE-TOPLEVEL) (SB-C:%COMPILER-DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) T NIL NIL)) #1#) #3=(DEFUN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL . #2#) (PROGN #3# (PUSHNEW (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) *TESTS*)) SB-C::ORIGINAL-SOURCE-START 0 9))
106: (SB-C::PROCESS-TOPLEVEL-FORM (SB-IMPL::%DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE))))) ((PROGN (EVAL-WHEN (:COMPILE-TOPLEVEL) (SB-C:%COMPILER-DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) T NIL NIL)) (SB-IMPL::%DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE #) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION . #1=#)))) #2=(DEFUN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL . #1#) (PROGN #2# (PUSHNEW (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) *TESTS*)) SB-C::ORIGINAL-SOURCE-START 0 9) NIL)
107: (SB-C::PROCESS-TOPLEVEL-PROGN ((EVAL-WHEN (:COMPILE-TOPLEVEL) (SB-C:%COMPILER-DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) T NIL NIL)) (SB-IMPL::%DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH # # # # # # #))))) ((PROGN (EVAL-WHEN (:COMPILE-TOPLEVEL) (SB-C:%COMPILER-DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) T NIL NIL)) (SB-IMPL::%DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE #) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION . #1=#)))) #2=(DEFUN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL . #1#) (PROGN #2# (PUSHNEW (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) *TESTS*)) SB-C::ORIGINAL-SOURCE-START 0 9) NIL)
108: (SB-C::PROCESS-TOPLEVEL-FORM (PROGN (EVAL-WHEN (:COMPILE-TOPLEVEL) (SB-C:%COMPILER-DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) T NIL NIL)) (SB-IMPL::%DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH # # # # # # #))))) (#1=(DEFUN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE))) (PROGN #1# (PUSHNEW (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) *TESTS*)) SB-C::ORIGINAL-SOURCE-START 0 9) NIL)
109: (SB-C::PROCESS-TOPLEVEL-FORM (DEFUN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT # 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER #)) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE))) ((PROGN (DEFUN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE))) (PUSHNEW (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) *TESTS*)) SB-C::ORIGINAL-SOURCE-START 0 9) NIL)
110: (SB-C::PROCESS-TOPLEVEL-PROGN ((DEFUN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE))) (PUSHNEW (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) *TESTS*)) ((PROGN (DEFUN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE))) (PUSHNEW (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) *TESTS*)) SB-C::ORIGINAL-SOURCE-START 0 9) NIL)
111: (SB-C::PROCESS-TOPLEVEL-FORM (PROGN (DEFUN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE))) (PUSHNEW (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) *TESTS*)) (SB-C::ORIGINAL-SOURCE-START 0 9) NIL)
112: (SB-C::PROCESS-TOPLEVEL-FORM (DEFTEST TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT # 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER #)) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE))) (SB-C::ORIGINAL-SOURCE-START 0 9) NIL)
113: ((LAMBDA (SB-KERNEL:FORM &KEY :CURRENT-INDEX &ALLOW-OTHER-KEYS) :IN SB-C::SUB-COMPILE-FILE) (DEFTEST TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT # 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER #)) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE))) :CURRENT-INDEX 9)
114: (SB-C::%DO-FORMS-FROM-INFO #<FUNCTION (LAMBDA (SB-KERNEL:FORM &KEY :CURRENT-INDEX &ALLOW-OTHER-KEYS) :IN SB-C::SUB-COMPILE-FILE) {800347C83B}> #<SB-C::SOURCE-INFO {8007B36EC3}> SB-C::INPUT-ERROR-IN-COMPILE-FILE)
115: ((LAMBDA NIL :IN SB-C::SUB-COMPILE-FILE))
116: ((FLET SB-C::WITH-IT :IN SB-C::%WITH-COMPILATION-UNIT))
117: (SB-C::SUB-COMPILE-FILE #<SB-C::SOURCE-INFO {8007B36EC3}> NIL)
118: (COMPILE-FILE #P\"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/dispatch.lisp\" :OUTPUT-FILE #P\"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/dispatch-tmpKLR0OPN5.fasl\" :VERBOSE NIL :PRINT NIL :EXTERNAL-FORMAT :UTF-8 :PROGRESS NIL :TRACE-FILE NIL :BLOCK-COMPILE NIL :ENTRY-POINTS NIL :EMIT-CFASL NIL)
119: (UIOP/UTILITY:CALL-WITH-MUFFLED-CONDITIONS #<FUNCTION (LAMBDA NIL :IN UIOP/LISP-BUILD:COMPILE-FILE*) {8007B6D85B}> NIL)
120: (UIOP/PATHNAME:CALL-WITH-ENOUGH-PATHNAME #P\"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/dispatch.lisp\" NIL #<FUNCTION (LAMBDA (UIOP/LISP-BUILD::INPUT-FILE) :IN UIOP/LISP-BUILD:COMPILE-FILE*) {8007B6D4BB}>)
121: (UIOP/LISP-BUILD:COMPILE-FILE* #P\"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/dispatch.lisp\" :OUTPUT-FILE #P\"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/dispatch.fasl\" :EXTERNAL-FORMAT :UTF-8 :WARNINGS-FILE NIL)
122: (ASDF/LISP-ACTION:PERFORM-LISP-COMPILATION #<ASDF/LISP-ACTION:COMPILE-OP > #<ASDF/LISP-ACTION:CL-SOURCE-FILE \"arcdocdb/tests\" \"scheduler\" \"dispatch\">)
123: ((SB-PCL::EMF ASDF/ACTION:PERFORM) #<unused argument> #<unused argument> #<ASDF/LISP-ACTION:COMPILE-OP > #<ASDF/LISP-ACTION:CL-SOURCE-FILE \"arcdocdb/tests\" \"scheduler\" \"dispatch\">)
124: ((LAMBDA NIL :IN ASDF/ACTION:CALL-WHILE-VISITING-ACTION))
125: ((:METHOD ASDF/ACTION:PERFORM-WITH-RESTARTS :AROUND (T T)) #<ASDF/LISP-ACTION:COMPILE-OP > #<ASDF/LISP-ACTION:CL-SOURCE-FILE \"arcdocdb/tests\" \"scheduler\" \"dispatch\">) [fast-method]
126: ((:METHOD ASDF/PLAN:PERFORM-PLAN (T)) #<ASDF/PLAN:SEQUENTIAL-PLAN {80038709E3}>) [fast-method]
127: ((FLET SB-C::WITH-IT :IN SB-C::%WITH-COMPILATION-UNIT))
128: ((:METHOD ASDF/PLAN:PERFORM-PLAN :AROUND (T)) #<ASDF/PLAN:SEQUENTIAL-PLAN {80038709E3}>) [fast-method]
129: ((:METHOD ASDF/OPERATE:OPERATE (ASDF/OPERATION:OPERATION ASDF/COMPONENT:COMPONENT)) #<ASDF/LISP-ACTION:LOAD-OP > #<ASDF/SYSTEM:SYSTEM \"arcdocdb/tests\"> :PLAN-CLASS NIL :PLAN-OPTIONS NIL) [fast-method]
130: ((SB-PCL::EMF ASDF/OPERATE:OPERATE) #<unused argument> #<unused argument> #<ASDF/LISP-ACTION:LOAD-OP > #<ASDF/SYSTEM:SYSTEM \"arcdocdb/tests\">)
131: ((LAMBDA NIL :IN ASDF/OPERATE:OPERATE))
132: ((:METHOD ASDF/OPERATE:OPERATE :AROUND (T T)) #<ASDF/LISP-ACTION:LOAD-OP > #<ASDF/SYSTEM:SYSTEM \"arcdocdb/tests\">) [fast-method]
133: ((SB-PCL::EMF ASDF/OPERATE:OPERATE) #<unused argument> #<unused argument> ASDF/LISP-ACTION:LOAD-OP \"arcdocdb/tests\")
134: ((LAMBDA NIL :IN ASDF/OPERATE:OPERATE))
135: ((:METHOD ASDF/OPERATE:OPERATE :AROUND (T T)) ASDF/LISP-ACTION:LOAD-OP \"arcdocdb/tests\") [fast-method]
136: (ASDF/SESSION:CALL-WITH-ASDF-SESSION #<FUNCTION (LAMBDA NIL :IN ASDF/OPERATE:OPERATE) {800387084B}> :OVERRIDE T :KEY NIL :OVERRIDE-CACHE T :OVERRIDE-FORCING NIL)
137: ((LAMBDA NIL :IN ASDF/OPERATE:OPERATE))
138: (ASDF/SESSION:CALL-WITH-ASDF-SESSION #<FUNCTION (LAMBDA NIL :IN ASDF/OPERATE:OPERATE) {800387073B}> :OVERRIDE NIL :KEY NIL :OVERRIDE-CACHE NIL :OVERRIDE-FORCING NIL)
139: ((:METHOD ASDF/OPERATE:OPERATE :AROUND (T T)) ASDF/LISP-ACTION:LOAD-OP \"arcdocdb/tests\") [fast-method]
140: (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb/tests\")
141: (\"top level form\") [toplevel]
142: ((FLET \"G\" :IN SB-C::%COMPILE-IN-LEXENV))
143: (SB-C::%COMPILE-IN-LEXENV (LET ((SB-KERNEL:*HANDLER-CLUSTERS* (CONS (LIST #) . #1=(SB-KERNEL:*HANDLER-CLUSTERS*)))) (DECLARE (DYNAMIC-EXTENT . #1#)) (PROGN (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb/tests\"))) #<NULL-LEXENV> NIL #<SB-C::SOURCE-INFO {8003870423}> 3 NIL T T)
144: (SB-C:EVAL-WITH-COMPILE-IN-LEXENV (LET ((SB-KERNEL:*HANDLER-CLUSTERS* (CONS (LIST #) . #1=(SB-KERNEL:*HANDLER-CLUSTERS*)))) (DECLARE (DYNAMIC-EXTENT . #1#)) (PROGN (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb/tests\"))) #<NULL-LEXENV> #<SB-C::SOURCE-INFO {8003870423}> 3 NIL)
145: (SB-IMPL::%SIMPLE-EVAL (LET ((SB-KERNEL:*HANDLER-CLUSTERS* (CONS (LIST #) . #1=(SB-KERNEL:*HANDLER-CLUSTERS*)))) (DECLARE (DYNAMIC-EXTENT . #1#)) (PROGN (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb/tests\"))) #<NULL-LEXENV>)
146: (SB-INT:SIMPLE-EVAL-IN-LEXENV (HANDLER-BIND ((WARNING (LAMBDA (CONDITION) (UNLESS # #)))) (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb/tests\")) #<NULL-LEXENV>)
147: (SB-EXT:EVAL-TLF (HANDLER-BIND ((WARNING (LAMBDA (CONDITION) (UNLESS # #)))) (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb/tests\")) 3 NIL)
148: ((LABELS SB-FASL::EVAL-FORM :IN SB-INT:LOAD-AS-SOURCE) (HANDLER-BIND ((WARNING (LAMBDA (CONDITION) (UNLESS # #)))) (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb/tests\")) 3)
149: ((LAMBDA (SB-KERNEL:FORM &KEY :CURRENT-INDEX &ALLOW-OTHER-KEYS) :IN SB-INT:LOAD-AS-SOURCE) (HANDLER-BIND ((WARNING (LAMBDA (CONDITION) (UNLESS # #)))) (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb/tests\")) :CURRENT-INDEX 3)
150: (SB-C::%DO-FORMS-FROM-INFO #<FUNCTION (LAMBDA (SB-KERNEL:FORM &KEY :CURRENT-INDEX &ALLOW-OTHER-KEYS) :IN SB-INT:LOAD-AS-SOURCE) {109420F1B}> #<SB-C::SOURCE-INFO {8003870423}> SB-C::INPUT-ERROR-IN-LOAD)
151: (SB-INT:LOAD-AS-SOURCE #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/scoped.lisp\" {8003870043}> :VERBOSE NIL :PRINT NIL :CONTEXT \"loading\")
152: ((LABELS SB-FASL::LOAD-STREAM-1 :IN LOAD) #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/scoped.lisp\" {8003870043}> NIL)
153: (SB-FASL::CALL-WITH-LOAD-BINDINGS #<FUNCTION (LABELS SB-FASL::LOAD-STREAM-1 :IN LOAD) {1094209EB}> #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/scoped.lisp\" {8003870043}> NIL #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/scoped.lisp\" {8003870043}>)
154: ((LABELS SB-FASL::LOAD-STREAM :IN LOAD) #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/scoped.lisp\" {8003870043}> NIL)
155: (LOAD #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/scoped.lisp\" {8003870043}> :VERBOSE NIL :PRINT NIL :IF-DOES-NOT-EXIST :ERROR :EXTERNAL-FORMAT :DEFAULT)
156: ((FLET SB-IMPL::LOAD-SCRIPT :IN SB-IMPL::PROCESS-SCRIPT) #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/scoped.lisp\" {8003870043}>)
157: ((FLET SB-UNIX::BODY :IN SB-IMPL::PROCESS-SCRIPT))
158: ((FLET \"WITHOUT-INTERRUPTS-BODY-\" :IN SB-IMPL::PROCESS-SCRIPT))
159: (SB-IMPL::PROCESS-SCRIPT \"spikes/out/pool-dispatch-tests/scoped.lisp\")
160: (SB-IMPL::TOPLEVEL-INIT)
161: ((FLET SB-UNIX::BODY :IN SB-IMPL::START-LISP))
162: ((FLET \"WITHOUT-INTERRUPTS-BODY-3\" :IN SB-IMPL::START-LISP))
163: (SB-IMPL::%START-LISP)

unhandled condition in --disable-debugger mode, quitting
; 
; compilation unit aborted
;   caught 2 fatal ERROR conditions
")
  (:PATH
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/attempt-02.log")
   :BYTES 126197 :SHA256 "c752642fa7249cf3898ae4bc5afd3fcaa8afa6b10b8889221b29d7eaff680634"
   :GIT-BLOB "0e1c1d4377c41e5d4a95bdadf7aa28937116654f" :TEXT
   "Unhandled SIMPLE-ERROR in thread #<SB-THREAD:THREAD tid=259 \"main thread\" RUNNING
                                    {80086B0503}>:
  Avviso non ammesso: reading an ignored variable: CONTROLLERS

Backtrace for: #<SB-THREAD:THREAD tid=259 \"main thread\" RUNNING {80086B0503}>
0: (SB-DEBUG::DEBUGGER-DISABLED-HOOK #<SIMPLE-ERROR \"Avviso non ammesso: ~A\" {800543D523}> #<unused argument> :QUIT T)
1: (SB-DEBUG::RUN-HOOK SB-EXT:*INVOKE-DEBUGGER-HOOK* #<SIMPLE-ERROR \"Avviso non ammesso: ~A\" {800543D523}>)
2: (INVOKE-DEBUGGER #<SIMPLE-ERROR \"Avviso non ammesso: ~A\" {800543D523}>)
3: (ERROR \"Avviso non ammesso: ~A\" #<SB-INT:SIMPLE-STYLE-WARNING \"reading an ignored variable: ~S\" {800543D4E3}>)
4: ((LAMBDA (CONDITION) :IN \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/scoped.lisp\") #<SB-INT:SIMPLE-STYLE-WARNING \"reading an ignored variable: ~S\" {800543D4E3}>)
5: (SB-KERNEL::%SIGNAL #<SB-INT:SIMPLE-STYLE-WARNING \"reading an ignored variable: ~S\" {800543D4E3}>)
6: (SB-C::COMPILER-STYLE-WARNING-HANDLER #<SB-INT:SIMPLE-STYLE-WARNING \"reading an ignored variable: ~S\" {800543D4E3}>)
7: (SB-KERNEL::%SIGNAL #<SB-INT:SIMPLE-STYLE-WARNING \"reading an ignored variable: ~S\" {800543D4E3}>)
8: ((FLET SB-KERNEL::%WARN :IN \"SYS:SRC;CODE;WARM-ERROR.LISP\") \"reading an ignored variable: ~S\" #<SB-KERNEL::CONDITION-CLASSOID STYLE-WARNING> SB-INT:SIMPLE-STYLE-WARNING CONTROLLERS)
9: (SB-C:COMPILER-STYLE-WARN \"reading an ignored variable: ~S\" CONTROLLERS)
10: (SB-C::IR1-CONVERT #<SB-C::CTRAN 1 {800543D303}> #<SB-C::CTRAN 2 {800543D443}> #<SB-C::LVAR 3 {800543D483}> CONTROLLERS)
11: (SB-C::IR1-CONVERT-COMBINATION-ARGS #<SB-C::LVAR 4 {800543D173}> #<SB-C::CTRAN 5 {800543D133}> #<SB-C::CTRAN 6 {800543D023}> #<SB-C::LVAR 7 {800543D063}> (WRITERS CONTROLLERS) :PASS-NARGS T :ARG-SOURCE-FORMS NIL)
12: (SB-C::IR1-CONVERT-COMBINATION #<SB-C::CTRAN 8 {800543CEF3}> #<SB-C::CTRAN 6 {800543D023}> #<SB-C::LVAR 7 {800543D063}> (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS) #<SB-C::GLOBAL-VAR :%SOURCE-NAME ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE :TYPE #1=#<SB-KERNEL:FUN-TYPE (FUNCTION (T T) (VALUES ARCDOCDB.EXECUTION.SERIES:REGISTRO-WORKER-SERIE &REST T))> :DEFINED-TYPE #1# :WHERE-FROM :DECLARED :KIND :GLOBAL-FUNCTION {800543D0C3}>)
13: (SB-C::IR1-CONVERT-COMBINATION-CHECKING-TYPE #<SB-C::CTRAN 8 {800543CEF3}> #<SB-C::CTRAN 6 {800543D023}> #<SB-C::LVAR 7 {800543D063}> (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS) #<SB-C::GLOBAL-VAR :%SOURCE-NAME ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE :TYPE #1=#<SB-KERNEL:FUN-TYPE (FUNCTION (T T) (VALUES ARCDOCDB.EXECUTION.SERIES:REGISTRO-WORKER-SERIE &REST T))> :DEFINED-TYPE #1# :WHERE-FROM :DECLARED :KIND :GLOBAL-FUNCTION {800543D0C3}>)
14: (SB-C::IR1-CONVERT #<SB-C::CTRAN 8 {800543CEF3}> #<SB-C::CTRAN 6 {800543D023}> #<SB-C::LVAR 7 {800543D063}> (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS))
15: (SB-C::IR1-CONVERT-COMBINATION-ARGS #<SB-C::LVAR 9 {800543CD63}> #<SB-C::CTRAN 10 {800543CD23}> #<SB-C::CTRAN 11 {800543CC13}> #<SB-C::LVAR 12 {800543CC53}> (CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS)) :PASS-NARGS T :ARG-SOURCE-FORMS NIL)
16: (SB-C::IR1-CONVERT-COMBINATION #<SB-C::CTRAN 13 {800542E583}> #<SB-C::CTRAN 11 {800543CC13}> #<SB-C::LVAR 12 {800543CC53}> (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS)) #<SB-C::GLOBAL-VAR :%SOURCE-NAME ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE :TYPE #1=#<SB-KERNEL:FUN-TYPE (FUNCTION (ARCDOCDB.EXECUTION:CONTESTO-WORKER-WRITER ARCDOCDB.EXECUTION.SERIES:REGISTRO-WORKER-SERIE) (VALUES ARCDOCDB.EXECUTION.SERIES:TABELLA-WORKER-SERIE &REST T))> :DEFINED-TYPE #1# :WHERE-FROM :DECLARED :KIND :GLOBAL-FUNCTION {800543CCB3}>)
17: (SB-C::IR1-CONVERT-COMBINATION-CHECKING-TYPE #<SB-C::CTRAN 13 {800542E583}> #<SB-C::CTRAN 11 {800543CC13}> #<SB-C::LVAR 12 {800543CC53}> (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS)) #<SB-C::GLOBAL-VAR :%SOURCE-NAME ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE :TYPE #1=#<SB-KERNEL:FUN-TYPE (FUNCTION (ARCDOCDB.EXECUTION:CONTESTO-WORKER-WRITER ARCDOCDB.EXECUTION.SERIES:REGISTRO-WORKER-SERIE) (VALUES ARCDOCDB.EXECUTION.SERIES:TABELLA-WORKER-SERIE &REST T))> :DEFINED-TYPE #1# :WHERE-FROM :DECLARED :KIND :GLOBAL-FUNCTION {800543CCB3}>)
18: (SB-C::IR1-CONVERT #<SB-C::CTRAN 13 {800542E583}> #<SB-C::CTRAN 11 {800543CC13}> #<SB-C::LVAR 12 {800543CC53}> (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS)))
19: (SB-C::IR1-CONVERT-COMBINATION-ARGS #<SB-C::LVAR 14 {800542E5C3}> #<SB-C::CTRAN 13 {800542E583}> #<SB-C::CTRAN 15 {800542E1D3}> #<SB-C::LVAR 16 {800542E213}> ((ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS))) :PASS-NARGS T :ARG-SOURCE-FORMS ((TABLE (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS)))))
20: (SB-C::IR1-CONVERT-AUX-BINDINGS #<SB-C::CTRAN 17 {800542E483}> #<SB-C::CTRAN 15 {800542E1D3}> #<SB-C::LVAR 16 {800542E213}> ((IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT (SVREF WRITERS 0) 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER (SVREF WRITERS 0))) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME TABLE {800542C3E3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME DISPATCHER :FLAGS (IGNORE) {800542C4F3}>) ((ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS)) (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) NIL :VALUE-SOURCE-FORMS ((TABLE (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS))) (DISPATCHER (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE))))
21: (SB-C::IR1-CONVERT-SPECIAL-BINDINGS #<SB-C::CTRAN 17 {800542E483}> #<SB-C::CTRAN 15 {800542E1D3}> #<SB-C::LVAR 16 {800542E213}> ((IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT (SVREF WRITERS 0) 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER (SVREF WRITERS 0))) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME TABLE {800542C3E3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME DISPATCHER :FLAGS (IGNORE) {800542C4F3}>) ((ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS)) (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) NIL NIL :VALUE-SOURCE-FORMS ((TABLE (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS))) (DISPATCHER (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE))))
22: (SB-C::IR1-CONVERT-LAMBDA-BODY ((IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT (SVREF WRITERS 0) 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER (SVREF WRITERS 0))) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTROLLERS :FLAGS (IGNORE) {800542C2D3}>) :AUX-VARS (#<SB-C::LAMBDA-VAR :%SOURCE-NAME TABLE {800542C3E3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME DISPATCHER :FLAGS (IGNORE) {800542C4F3}>) :AUX-VALS ((ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS)) (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) :SOURCE-NAME SB-C::.ANONYMOUS. :DEBUG-NAME (SB-C::&AUX-BINDINGS (CONTROLLERS TABLE DISPATCHER)) :NOTE-LEXICAL-BINDINGS T :POST-BINDING-LEXENV NIL :LOCAL-POLICY NIL :VALUE-SOURCE-FORMS ((TABLE (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS))) (DISPATCHER (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE))))
23: (SB-C::IR1-CONVERT-AUX-BINDINGS #<SB-C::CTRAN 18 {800542DE63}> #<SB-C::CTRAN 19 {800542DBB3}> #<SB-C::LVAR 20 {800542DBF3}> ((IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT (SVREF WRITERS 0) 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER (SVREF WRITERS 0))) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTROLLERS :FLAGS (IGNORE) {800542C2D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME TABLE {800542C3E3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME DISPATCHER :FLAGS (IGNORE) {800542C4F3}>) ((VECTOR #:LEFT0 #:RIGHT1) (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS)) (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) NIL :VALUE-SOURCE-FORMS ((CONTROLLERS (VECTOR #:LEFT0 #:RIGHT1)) (TABLE (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS))) (DISPATCHER (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE))))
24: (SB-C::IR1-CONVERT-SPECIAL-BINDINGS #<SB-C::CTRAN 18 {800542DE63}> #<SB-C::CTRAN 19 {800542DBB3}> #<SB-C::LVAR 20 {800542DBF3}> ((IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT (SVREF WRITERS 0) 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER (SVREF WRITERS 0))) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTROLLERS :FLAGS (IGNORE) {800542C2D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME TABLE {800542C3E3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME DISPATCHER :FLAGS (IGNORE) {800542C4F3}>) ((VECTOR #:LEFT0 #:RIGHT1) (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS)) (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) NIL NIL :VALUE-SOURCE-FORMS ((CONTROLLERS (VECTOR #:LEFT0 #:RIGHT1)) (TABLE (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS))) (DISPATCHER (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE))))
25: (SB-C::IR1-CONVERT-LAMBDA-BODY ((IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT (SVREF WRITERS 0) 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER (SVREF WRITERS 0))) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME WRITERS {800542C1C3}>) :AUX-VARS (#<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTROLLERS :FLAGS (IGNORE) {800542C2D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME TABLE {800542C3E3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME DISPATCHER :FLAGS (IGNORE) {800542C4F3}>) :AUX-VALS ((VECTOR #:LEFT0 #:RIGHT1) (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS)) (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) :SOURCE-NAME SB-C::.ANONYMOUS. :DEBUG-NAME (SB-C::&AUX-BINDINGS (WRITERS CONTROLLERS TABLE DISPATCHER)) :NOTE-LEXICAL-BINDINGS T :POST-BINDING-LEXENV NIL :LOCAL-POLICY NIL :VALUE-SOURCE-FORMS ((CONTROLLERS (VECTOR #:LEFT0 #:RIGHT1)) (TABLE (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS))) (DISPATCHER (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE))))
26: (SB-C::IR1-CONVERT-AUX-BINDINGS #<SB-C::CTRAN 21 {800542D843}> #<SB-C::CTRAN 22 {800542D593}> #<SB-C::LVAR 23 {800542D5D3}> ((IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT (SVREF WRITERS 0) 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER (SVREF WRITERS 0))) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME WRITERS {800542C1C3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTROLLERS :FLAGS (IGNORE) {800542C2D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME TABLE {800542C3E3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME DISPATCHER :FLAGS (IGNORE) {800542C4F3}>) ((VECTOR (POOL-CLAIM-WRITER (QUOTE (:A1 :A2)) 0) (POOL-CLAIM-WRITER (QUOTE (:B1)) 1)) (VECTOR #:LEFT0 #:RIGHT1) (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS)) (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) NIL :VALUE-SOURCE-FORMS ((WRITERS (VECTOR (POOL-CLAIM-WRITER (QUOTE #) 0) (POOL-CLAIM-WRITER (QUOTE #) 1))) (CONTROLLERS (VECTOR #:LEFT0 #:RIGHT1)) (TABLE (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS))) (DISPATCHER (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE))))
27: (SB-C::IR1-CONVERT-SPECIAL-BINDINGS #<SB-C::CTRAN 21 {800542D843}> #<SB-C::CTRAN 22 {800542D593}> #<SB-C::LVAR 23 {800542D5D3}> ((IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT (SVREF WRITERS 0) 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER (SVREF WRITERS 0))) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME WRITERS {800542C1C3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTROLLERS :FLAGS (IGNORE) {800542C2D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME TABLE {800542C3E3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME DISPATCHER :FLAGS (IGNORE) {800542C4F3}>) ((VECTOR (POOL-CLAIM-WRITER (QUOTE (:A1 :A2)) 0) (POOL-CLAIM-WRITER (QUOTE (:B1)) 1)) (VECTOR #:LEFT0 #:RIGHT1) (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS)) (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) NIL NIL :VALUE-SOURCE-FORMS ((WRITERS (VECTOR (POOL-CLAIM-WRITER (QUOTE #) 0) (POOL-CLAIM-WRITER (QUOTE #) 1))) (CONTROLLERS (VECTOR #:LEFT0 #:RIGHT1)) (TABLE (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS))) (DISPATCHER (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE))))
28: (SB-C::IR1-CONVERT-LAMBDA-BODY ((IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT (SVREF WRITERS 0) 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER (SVREF WRITERS 0))) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME READY :FLAGS (IGNORE) {800542C0B3}>) :AUX-VARS (#<SB-C::LAMBDA-VAR :%SOURCE-NAME WRITERS {800542C1C3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTROLLERS :FLAGS (IGNORE) {800542C2D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME TABLE {800542C3E3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME DISPATCHER :FLAGS (IGNORE) {800542C4F3}>) :AUX-VALS ((VECTOR (POOL-CLAIM-WRITER (QUOTE (:A1 :A2)) 0) (POOL-CLAIM-WRITER (QUOTE (:B1)) 1)) (VECTOR #:LEFT0 #:RIGHT1) (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS)) (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) :SOURCE-NAME SB-C::.ANONYMOUS. :DEBUG-NAME (SB-C::&AUX-BINDINGS (READY WRITERS CONTROLLERS TABLE DISPATCHER)) :NOTE-LEXICAL-BINDINGS T :POST-BINDING-LEXENV NIL :LOCAL-POLICY NIL :VALUE-SOURCE-FORMS ((WRITERS (VECTOR (POOL-CLAIM-WRITER (QUOTE #) 0) (POOL-CLAIM-WRITER (QUOTE #) 1))) (CONTROLLERS (VECTOR #:LEFT0 #:RIGHT1)) (TABLE (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS))) (DISPATCHER (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE))))
29: (SB-C::IR1-CONVERT-AUX-BINDINGS #<SB-C::CTRAN 24 {800542D223}> #<SB-C::CTRAN 25 {800542CF73}> #<SB-C::LVAR 26 {800542CFB3}> ((IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT (SVREF WRITERS 0) 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER (SVREF WRITERS 0))) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME READY :FLAGS (IGNORE) {800542C0B3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME WRITERS {800542C1C3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTROLLERS :FLAGS (IGNORE) {800542C2D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME TABLE {800542C3E3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME DISPATCHER :FLAGS (IGNORE) {800542C4F3}>) (READY (VECTOR (POOL-CLAIM-WRITER (QUOTE (:A1 :A2)) 0) (POOL-CLAIM-WRITER (QUOTE (:B1)) 1)) (VECTOR #:LEFT0 #:RIGHT1) (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS)) (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) NIL :VALUE-SOURCE-FORMS ((READY READY) (WRITERS (VECTOR (POOL-CLAIM-WRITER (QUOTE #) 0) (POOL-CLAIM-WRITER (QUOTE #) 1))) (CONTROLLERS (VECTOR #:LEFT0 #:RIGHT1)) (TABLE (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS))) (DISPATCHER (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE))))
30: (SB-C::IR1-CONVERT-SPECIAL-BINDINGS #<SB-C::CTRAN 24 {800542D223}> #<SB-C::CTRAN 25 {800542CF73}> #<SB-C::LVAR 26 {800542CFB3}> ((IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT (SVREF WRITERS 0) 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER (SVREF WRITERS 0))) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME READY :FLAGS (IGNORE) {800542C0B3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME WRITERS {800542C1C3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTROLLERS :FLAGS (IGNORE) {800542C2D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME TABLE {800542C3E3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME DISPATCHER :FLAGS (IGNORE) {800542C4F3}>) (READY (VECTOR (POOL-CLAIM-WRITER (QUOTE (:A1 :A2)) 0) (POOL-CLAIM-WRITER (QUOTE (:B1)) 1)) (VECTOR #:LEFT0 #:RIGHT1) (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS)) (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) NIL NIL :VALUE-SOURCE-FORMS ((READY READY) (WRITERS (VECTOR (POOL-CLAIM-WRITER (QUOTE #) 0) (POOL-CLAIM-WRITER (QUOTE #) 1))) (CONTROLLERS (VECTOR #:LEFT0 #:RIGHT1)) (TABLE (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS))) (DISPATCHER (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE))))
31: (SB-C::IR1-CONVERT-LAMBDA-BODY ((IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT (SVREF WRITERS 0) 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER (SVREF WRITERS 0))) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTEXT {800542BFA3}>) :AUX-VARS (#<SB-C::LAMBDA-VAR :%SOURCE-NAME READY :FLAGS (IGNORE) {800542C0B3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME WRITERS {800542C1C3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTROLLERS :FLAGS (IGNORE) {800542C2D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME TABLE {800542C3E3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME DISPATCHER :FLAGS (IGNORE) {800542C4F3}>) :AUX-VALS (READY (VECTOR (POOL-CLAIM-WRITER (QUOTE (:A1 :A2)) 0) (POOL-CLAIM-WRITER (QUOTE (:B1)) 1)) (VECTOR #:LEFT0 #:RIGHT1) (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS)) (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) :SOURCE-NAME SB-C::.ANONYMOUS. :DEBUG-NAME (SB-C::&AUX-BINDINGS (CONTEXT READY WRITERS CONTROLLERS TABLE DISPATCHER)) :NOTE-LEXICAL-BINDINGS T :POST-BINDING-LEXENV NIL :LOCAL-POLICY NIL :VALUE-SOURCE-FORMS ((READY READY) (WRITERS (VECTOR (POOL-CLAIM-WRITER (QUOTE #) 0) (POOL-CLAIM-WRITER (QUOTE #) 1))) (CONTROLLERS (VECTOR #:LEFT0 #:RIGHT1)) (TABLE (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS))) (DISPATCHER (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE))))
32: (SB-C::IR1-CONVERT-AUX-BINDINGS #<SB-C::CTRAN 27 {800542CC03}> #<SB-C::CTRAN 28 {800542C953}> #<SB-C::LVAR 29 {800542C993}> ((IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT (SVREF WRITERS 0) 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER (SVREF WRITERS 0))) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTEXT {800542BFA3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME READY :FLAGS (IGNORE) {800542C0B3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME WRITERS {800542C1C3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTROLLERS :FLAGS (IGNORE) {800542C2D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME TABLE {800542C3E3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME DISPATCHER :FLAGS (IGNORE) {800542C4F3}>) (CONTEXT READY (VECTOR (POOL-CLAIM-WRITER (QUOTE (:A1 :A2)) 0) (POOL-CLAIM-WRITER (QUOTE (:B1)) 1)) (VECTOR #:LEFT0 #:RIGHT1) (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS)) (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) NIL :VALUE-SOURCE-FORMS ((CONTEXT CONTEXT) (READY READY) (WRITERS (VECTOR (POOL-CLAIM-WRITER (QUOTE #) 0) (POOL-CLAIM-WRITER (QUOTE #) 1))) (CONTROLLERS (VECTOR #:LEFT0 #:RIGHT1)) (TABLE (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS))) (DISPATCHER (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE))))
33: (SB-C::IR1-CONVERT-SPECIAL-BINDINGS #<SB-C::CTRAN 27 {800542CC03}> #<SB-C::CTRAN 28 {800542C953}> #<SB-C::LVAR 29 {800542C993}> ((IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT (SVREF WRITERS 0) 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER (SVREF WRITERS 0))) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTEXT {800542BFA3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME READY :FLAGS (IGNORE) {800542C0B3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME WRITERS {800542C1C3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTROLLERS :FLAGS (IGNORE) {800542C2D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME TABLE {800542C3E3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME DISPATCHER :FLAGS (IGNORE) {800542C4F3}>) (CONTEXT READY (VECTOR (POOL-CLAIM-WRITER (QUOTE (:A1 :A2)) 0) (POOL-CLAIM-WRITER (QUOTE (:B1)) 1)) (VECTOR #:LEFT0 #:RIGHT1) (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS)) (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) NIL NIL :VALUE-SOURCE-FORMS ((CONTEXT CONTEXT) (READY READY) (WRITERS (VECTOR (POOL-CLAIM-WRITER (QUOTE #) 0) (POOL-CLAIM-WRITER (QUOTE #) 1))) (CONTROLLERS (VECTOR #:LEFT0 #:RIGHT1)) (TABLE (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS))) (DISPATCHER (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE))))
34: (SB-C::IR1-CONVERT-LAMBDA-BODY ((IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT (SVREF WRITERS 0) 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER (SVREF WRITERS 0))) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME PORT {800542BE93}>) :AUX-VARS (#<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTEXT {800542BFA3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME READY :FLAGS (IGNORE) {800542C0B3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME WRITERS {800542C1C3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTROLLERS :FLAGS (IGNORE) {800542C2D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME TABLE {800542C3E3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME DISPATCHER :FLAGS (IGNORE) {800542C4F3}>) :AUX-VALS (CONTEXT READY (VECTOR (POOL-CLAIM-WRITER (QUOTE (:A1 :A2)) 0) (POOL-CLAIM-WRITER (QUOTE (:B1)) 1)) (VECTOR #:LEFT0 #:RIGHT1) (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS)) (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) :SOURCE-NAME SB-C::.ANONYMOUS. :DEBUG-NAME (SB-C::&AUX-BINDINGS (PORT CONTEXT READY WRITERS CONTROLLERS TABLE DISPATCHER)) :NOTE-LEXICAL-BINDINGS T :POST-BINDING-LEXENV NIL :LOCAL-POLICY NIL :VALUE-SOURCE-FORMS ((CONTEXT CONTEXT) (READY READY) (WRITERS (VECTOR (POOL-CLAIM-WRITER (QUOTE #) 0) (POOL-CLAIM-WRITER (QUOTE #) 1))) (CONTROLLERS (VECTOR #:LEFT0 #:RIGHT1)) (TABLE (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS))) (DISPATCHER (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE))))
35: (SB-C::IR1-CONVERT-AUX-BINDINGS #<SB-C::CTRAN 30 {800542A983}> #<SB-C::CTRAN 31 {800542BCF3}> #<SB-C::LVAR 32 {800542BD33}> ((IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT (SVREF WRITERS 0) 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER (SVREF WRITERS 0))) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME PORT {800542BE93}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTEXT {800542BFA3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME READY :FLAGS (IGNORE) {800542C0B3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME WRITERS {800542C1C3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTROLLERS :FLAGS (IGNORE) {800542C2D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME TABLE {800542C3E3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME DISPATCHER :FLAGS (IGNORE) {800542C4F3}>) (PORT CONTEXT READY (VECTOR (POOL-CLAIM-WRITER (QUOTE (:A1 :A2)) 0) (POOL-CLAIM-WRITER (QUOTE (:B1)) 1)) (VECTOR #:LEFT0 #:RIGHT1) (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS)) (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) NIL :VALUE-SOURCE-FORMS ((PORT PORT) (CONTEXT CONTEXT) (READY READY) (WRITERS (VECTOR (POOL-CLAIM-WRITER (QUOTE #) 0) (POOL-CLAIM-WRITER (QUOTE #) 1))) (CONTROLLERS (VECTOR #:LEFT0 #:RIGHT1)) (TABLE (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS))) (DISPATCHER (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE))))
36: (SB-C::IR1-CONVERT-LET* #<SB-C::CTRAN 30 {800542A983}> #<SB-C::CTRAN 31 {800542BCF3}> #<SB-C::LVAR 32 {800542BD33}> (LET* ((PORT PORT) (CONTEXT CONTEXT) (READY READY) (WRITERS (VECTOR (POOL-CLAIM-WRITER # 0) (POOL-CLAIM-WRITER # 1))) (CONTROLLERS (VECTOR #:LEFT0 #:RIGHT1)) (TABLE (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS))) (DISPATCHER (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE))) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT (SVREF WRITERS 0) 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER (SVREF WRITERS 0))) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)))
37: (SB-C::IR1-CONVERT #<SB-C::CTRAN 30 {800542A983}> #<SB-C::CTRAN 31 {800542BCF3}> #<SB-C::LVAR 32 {800542BD33}> (LET* ((PORT PORT) (CONTEXT CONTEXT) (READY READY) (WRITERS (VECTOR (POOL-CLAIM-WRITER # 0) (POOL-CLAIM-WRITER # 1))) (CONTROLLERS (VECTOR #:LEFT0 #:RIGHT1)) (TABLE (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT (ARCDOCDB.EXECUTION.SERIES:CREA-REGISTRO-WORKER-SERIE WRITERS CONTROLLERS))) (DISPATCHER (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE))) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT (SVREF WRITERS 0) 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER (SVREF WRITERS 0))) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)))
38: (SB-C::IR1-CONVERT-RETURN-FROM #<SB-C::CTRAN 30 {800542A983}> #<SB-C::CTRAN 33 {800542A6F3}> #<unused argument> (RETURN-FROM #:DROP-THRU-TAG-5 (LET* ((PORT PORT) (CONTEXT CONTEXT) (READY READY) (WRITERS (VECTOR # #)) (CONTROLLERS (VECTOR #:LEFT0 #:RIGHT1)) (TABLE (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT #)) (DISPATCHER (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE))) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT # 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER #)) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE))))
39: (SB-C::IR1-CONVERT #<SB-C::CTRAN 30 {800542A983}> #<SB-C::CTRAN 33 {800542A6F3}> NIL (RETURN-FROM #:DROP-THRU-TAG-5 (LET* ((PORT PORT) (CONTEXT CONTEXT) (READY READY) (WRITERS (VECTOR # #)) (CONTROLLERS (VECTOR #:LEFT0 #:RIGHT1)) (TABLE (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT #)) (DISPATCHER (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE))) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT # 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER #)) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE))))
40: (SB-C::IR1-CONVERT-PROGN-BODY #<SB-C::CTRAN 30 {800542A983}> #<SB-C::CTRAN 33 {800542A6F3}> NIL ((RETURN-FROM #:DROP-THRU-TAG-5 (LET* ((PORT PORT) (CONTEXT CONTEXT) (READY READY) (WRITERS #) (CONTROLLERS #) (TABLE #) (DISPATCHER #)) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)))))
41: (SB-C::IR1-CONVERT-%WITHIN-CLEANUP #<SB-C::CTRAN 34 {800542A7F3}> #<SB-C::CTRAN 33 {800542A6F3}> NIL (SB-C::%WITHIN-CLEANUP :UNWIND-PROTECT (SB-C::%UNWIND-PROTECT (SB-C::%ESCAPE-FUN #:EXIT-TAG-6) (SB-C::%CLEANUP-FUN #:CLEANUP-FUN-4)) (RETURN-FROM #:DROP-THRU-TAG-5 (LET* ((PORT PORT) (CONTEXT CONTEXT) (READY READY) (WRITERS #) (CONTROLLERS #) (TABLE #) (DISPATCHER #)) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)))))
42: (SB-C::IR1-CONVERT #<SB-C::CTRAN 34 {800542A7F3}> #<SB-C::CTRAN 33 {800542A6F3}> NIL (SB-C::%WITHIN-CLEANUP :UNWIND-PROTECT (SB-C::%UNWIND-PROTECT (SB-C::%ESCAPE-FUN #:EXIT-TAG-6) (SB-C::%CLEANUP-FUN #:CLEANUP-FUN-4)) (RETURN-FROM #:DROP-THRU-TAG-5 (LET* ((PORT PORT) (CONTEXT CONTEXT) (READY READY) (WRITERS #) (CONTROLLERS #) (TABLE #) (DISPATCHER #)) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)))))
43: (SB-C::IR1-CONVERT-PROGN-BODY #<SB-C::CTRAN 34 {800542A7F3}> #<SB-C::CTRAN 33 {800542A6F3}> NIL ((SB-C::%WITHIN-CLEANUP :UNWIND-PROTECT (SB-C::%UNWIND-PROTECT (SB-C::%ESCAPE-FUN #:EXIT-TAG-6) (SB-C::%CLEANUP-FUN #:CLEANUP-FUN-4)) (RETURN-FROM #:DROP-THRU-TAG-5 (LET* (# # # # # # #) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE))))))
44: (SB-C::IR1-CONVERT-BLOCK #<SB-C::CTRAN 35 {800542A5A3}> #<SB-C::CTRAN 33 {800542A6F3}> NIL (BLOCK #1=#:EXIT-TAG-6 (SB-C::%WITHIN-CLEANUP :UNWIND-PROTECT (SB-C::%UNWIND-PROTECT (SB-C::%ESCAPE-FUN #1#) (SB-C::%CLEANUP-FUN #:CLEANUP-FUN-4)) (RETURN-FROM #:DROP-THRU-TAG-5 (LET* (# # # # # # #) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE))))))
45: (SB-C::IR1-CONVERT #<SB-C::CTRAN 35 {800542A5A3}> #<SB-C::CTRAN 33 {800542A6F3}> NIL (BLOCK #1=#:EXIT-TAG-6 (SB-C::%WITHIN-CLEANUP :UNWIND-PROTECT (SB-C::%UNWIND-PROTECT (SB-C::%ESCAPE-FUN #1#) (SB-C::%CLEANUP-FUN #:CLEANUP-FUN-4)) (RETURN-FROM #:DROP-THRU-TAG-5 (LET* (# # # # # # #) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE))))))
46: (SB-C::IR1-CONVERT-PROGN-BODY #<SB-C::CTRAN 35 {800542A5A3}> #<SB-C::CTRAN 36 {8005428843}> #<SB-C::LVAR 37 {8005428883}> ((BLOCK #1=#:EXIT-TAG-6 (SB-C::%WITHIN-CLEANUP :UNWIND-PROTECT (SB-C::%UNWIND-PROTECT (SB-C::%ESCAPE-FUN #1#) (SB-C::%CLEANUP-FUN #2=#:CLEANUP-FUN-4)) (RETURN-FROM #:DROP-THRU-TAG-5 (LET* # # # # # # #)))) (LOCALLY (DECLARE (OPTIMIZE (SB-C::INSERT-DEBUG-CATCH 0))) (#2#) (SB-C:%CONTINUE-UNWIND))))
47: (SB-C::IR1-CONVERT-BLOCK #<SB-C::CTRAN 38 {800542A4E3}> #<SB-C::CTRAN 36 {8005428843}> #<SB-C::LVAR 37 {8005428883}> (BLOCK #1=#:DROP-THRU-TAG-5 (BLOCK #2=#:EXIT-TAG-6 (SB-C::%WITHIN-CLEANUP :UNWIND-PROTECT (SB-C::%UNWIND-PROTECT (SB-C::%ESCAPE-FUN #2#) (SB-C::%CLEANUP-FUN #3=#:CLEANUP-FUN-4)) (RETURN-FROM #1# (LET* # # # # # # #)))) (LOCALLY (DECLARE (OPTIMIZE (SB-C::INSERT-DEBUG-CATCH 0))) (#3#) (SB-C:%CONTINUE-UNWIND))))
48: (SB-C::IR1-CONVERT #<SB-C::CTRAN 38 {800542A4E3}> #<SB-C::CTRAN 36 {8005428843}> #<SB-C::LVAR 37 {8005428883}> (BLOCK #1=#:DROP-THRU-TAG-5 (BLOCK #2=#:EXIT-TAG-6 (SB-C::%WITHIN-CLEANUP :UNWIND-PROTECT (SB-C::%UNWIND-PROTECT (SB-C::%ESCAPE-FUN #2#) (SB-C::%CLEANUP-FUN #3=#:CLEANUP-FUN-4)) (RETURN-FROM #1# (LET* # # # # # # #)))) (LOCALLY (DECLARE (OPTIMIZE (SB-C::INSERT-DEBUG-CATCH 0))) (#3#) (SB-C:%CONTINUE-UNWIND))))
49: (SB-C::IR1-CONVERT-PROGN-BODY #<SB-C::CTRAN 38 {800542A4E3}> #<SB-C::CTRAN 36 {8005428843}> #<SB-C::LVAR 37 {8005428883}> ((BLOCK #1=#:DROP-THRU-TAG-5 (BLOCK #:EXIT-TAG-6 (SB-C::%WITHIN-CLEANUP :UNWIND-PROTECT (SB-C::%UNWIND-PROTECT # #) (RETURN-FROM #1# #))) (LOCALLY (DECLARE (OPTIMIZE #)) (#:CLEANUP-FUN-4) (SB-C:%CONTINUE-UNWIND)))))
50: (SB-C::IR1-CONVERT-FBINDINGS #<SB-C::CTRAN 39 {8005428AF3}> #<SB-C::CTRAN 36 {8005428843}> #<SB-C::LVAR 37 {8005428883}> (#<SB-C::CLAMBDA :%SOURCE-NAME #:CLEANUP-FUN-4 :%DEBUG-NAME (FLET \"CLEANUP-FUN-4\" :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :KIND (CLEANUP) :TYPE #<SB-KERNEL:BUILT-IN-CLASSOID FUNCTION (read-only)> :WHERE-FROM :DEFINED :VARS NIL {8005428F53}>) ((BLOCK #1=#:DROP-THRU-TAG-5 (BLOCK #:EXIT-TAG-6 (SB-C::%WITHIN-CLEANUP :UNWIND-PROTECT (SB-C::%UNWIND-PROTECT # #) (RETURN-FROM #1# #))) (LOCALLY (DECLARE (OPTIMIZE #)) (#:CLEANUP-FUN-4) (SB-C:%CONTINUE-UNWIND)))))
51: (SB-C::IR1-CONVERT-FLET #<SB-C::CTRAN 39 {8005428AF3}> #<SB-C::CTRAN 36 {8005428843}> #<SB-C::LVAR 37 {8005428883}> (FLET ((#1=#:CLEANUP-FUN-4 NIL (ARCDOCDB.IO:CHIUDI #:RIGHT-FILE3) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2) (VALUES))) (DECLARE (DYNAMIC-EXTENT (FUNCTION #1#))) (BLOCK #2=#:DROP-THRU-TAG-5 (BLOCK #:EXIT-TAG-6 (SB-C::%WITHIN-CLEANUP :UNWIND-PROTECT (SB-C::%UNWIND-PROTECT # #) (RETURN-FROM #2# #))) (LOCALLY (DECLARE (OPTIMIZE #)) (#1#) (SB-C:%CONTINUE-UNWIND)))))
52: (SB-C::IR1-CONVERT #<SB-C::CTRAN 39 {8005428AF3}> #<SB-C::CTRAN 36 {8005428843}> #<SB-C::LVAR 37 {8005428883}> (FLET ((#1=#:CLEANUP-FUN-4 NIL (ARCDOCDB.IO:CHIUDI #:RIGHT-FILE3) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2) (VALUES))) (DECLARE (DYNAMIC-EXTENT (FUNCTION #1#))) (BLOCK #2=#:DROP-THRU-TAG-5 (BLOCK #:EXIT-TAG-6 (SB-C::%WITHIN-CLEANUP :UNWIND-PROTECT (SB-C::%UNWIND-PROTECT # #) (RETURN-FROM #2# #))) (LOCALLY (DECLARE (OPTIMIZE #)) (#1#) (SB-C:%CONTINUE-UNWIND)))))
53: (SB-C::IR1-CONVERT-UNWIND-PROTECT #<SB-C::CTRAN 39 {8005428AF3}> #<SB-C::CTRAN 36 {8005428843}> #<SB-C::LVAR 37 {8005428883}> (UNWIND-PROTECT (LET* ((PORT PORT) (CONTEXT CONTEXT) (READY READY) (WRITERS (VECTOR # #)) (CONTROLLERS (VECTOR #:LEFT0 #:RIGHT1)) (TABLE (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT #)) (DISPATCHER (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE))) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT # 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER #)) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #:RIGHT-FILE3) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2)))
54: (SB-C::IR1-CONVERT #<SB-C::CTRAN 39 {8005428AF3}> #<SB-C::CTRAN 36 {8005428843}> #<SB-C::LVAR 37 {8005428883}> (UNWIND-PROTECT (LET* ((PORT PORT) (CONTEXT CONTEXT) (READY READY) (WRITERS (VECTOR # #)) (CONTROLLERS (VECTOR #:LEFT0 #:RIGHT1)) (TABLE (ARCDOCDB.EXECUTION.SERIES:CREA-TABELLA-WORKER-SERIE CONTEXT #)) (DISPATCHER (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE))) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT # 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER #)) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #:RIGHT-FILE3) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2)))
55: (SB-C::IR1-CONVERT-PROGN-BODY #<SB-C::CTRAN 39 {8005428AF3}> #<SB-C::CTRAN 36 {8005428843}> #<SB-C::LVAR 37 {8005428883}> ((UNWIND-PROTECT (LET* ((PORT PORT) (CONTEXT CONTEXT) (READY READY) (WRITERS #) (CONTROLLERS #) (TABLE #) (DISPATCHER #)) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #:RIGHT-FILE3) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2))))
56: (SB-C::IR1-CONVERT-AUX-BINDINGS #<SB-C::CTRAN 39 {8005428AF3}> #<SB-C::CTRAN 36 {8005428843}> #<SB-C::LVAR 37 {8005428883}> ((UNWIND-PROTECT (LET* ((PORT PORT) (CONTEXT CONTEXT) (READY READY) (WRITERS #) (CONTROLLERS #) (TABLE #) (DISPATCHER #)) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #:RIGHT-FILE3) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2))) NIL NIL NIL :VALUE-SOURCE-FORMS NIL)
57: (SB-C::IR1-CONVERT-SPECIAL-BINDINGS #<SB-C::CTRAN 39 {8005428AF3}> #<SB-C::CTRAN 36 {8005428843}> #<SB-C::LVAR 37 {8005428883}> ((UNWIND-PROTECT (LET* ((PORT PORT) (CONTEXT CONTEXT) (READY READY) (WRITERS #) (CONTROLLERS #) (TABLE #) (DISPATCHER #)) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #:RIGHT-FILE3) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2))) NIL NIL NIL NIL :VALUE-SOURCE-FORMS NIL)
58: (SB-C::IR1-CONVERT-LAMBDA-BODY ((UNWIND-PROTECT (LET* ((PORT PORT) (CONTEXT CONTEXT) (READY READY) (WRITERS #) (CONTROLLERS #) (TABLE #) (DISPATCHER #)) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #:RIGHT-FILE3) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2))) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:RIGHT1 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80054281A3}> {80054280D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:RIGHT-FILE3 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80054282C3}> {80054281F3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:IGNORE :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80054283E3}> {8005428313}>) :AUX-VARS NIL :AUX-VALS NIL :SOURCE-NAME SB-C::.ANONYMOUS. :DEBUG-NAME (LAMBDA (&OPTIONAL #:RIGHT1 #:RIGHT-FILE3 &REST #:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :NOTE-LEXICAL-BINDINGS T :POST-BINDING-LEXENV NIL :LOCAL-POLICY NIL :VALUE-SOURCE-FORMS NIL)
59: (SB-C::IR1-CONVERT-HAIRY-ARGS #<SB-C::OPTIONAL-DISPATCH :%SOURCE-NAME SB-C::.ANONYMOUS. :%DEBUG-NAME (LAMBDA (&OPTIONAL #1=#:RIGHT1 #2=#:RIGHT-FILE3 &REST #3=#:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :TYPE #<SB-KERNEL:BUILT-IN-CLASSOID FUNCTION (read-only)> :WHERE-FROM :DEFINED :ARGLIST (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #1# :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80054281A3}> {80054280D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #2# :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80054282C3}> {80054281F3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #3# :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80054283E3}> {8005428313}>) :ALLOWP NIL :KEYP NIL :MIN-ARGS 0 :MAX-ARGS 0 :MAIN-ENTRY NIL {8005428553}> (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:RIGHT-FILE3 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80054282C3}> {80054281F3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:RIGHT1 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80054281A3}> {80054280D3}>) (#:RIGHT-FILE3 #:RIGHT1) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:RIGHT-FILE3 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80054282C3}> {80054281F3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:RIGHT1 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80054281A3}> {80054280D3}>) (#:RIGHT-FILE3 #:RIGHT1) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:IGNORE :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80054283E3}> {8005428313}>) NIL ((UNWIND-PROTECT (LET* ((PORT PORT) (CONTEXT CONTEXT) (READY READY) (WRITERS #) (CONTROLLERS #) (TABLE #) (DISPATCHER #)) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #:RIGHT-FILE3) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2))) NIL NIL SB-C::.ANONYMOUS. (LAMBDA (&OPTIONAL #:RIGHT1 #:RIGHT-FILE3 &REST #:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) NIL NIL)
60: (SB-C::IR1-CONVERT-HAIRY-ARGS #<SB-C::OPTIONAL-DISPATCH :%SOURCE-NAME SB-C::.ANONYMOUS. :%DEBUG-NAME (LAMBDA (&OPTIONAL #1=#:RIGHT1 #2=#:RIGHT-FILE3 &REST #3=#:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :TYPE #<SB-KERNEL:BUILT-IN-CLASSOID FUNCTION (read-only)> :WHERE-FROM :DEFINED :ARGLIST (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #1# :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80054281A3}> {80054280D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #2# :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80054282C3}> {80054281F3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #3# :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80054283E3}> {8005428313}>) :ALLOWP NIL :KEYP NIL :MIN-ARGS 0 :MAX-ARGS 0 :MAIN-ENTRY NIL {8005428553}> (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:RIGHT1 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80054281A3}> {80054280D3}>) (#:RIGHT1) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:RIGHT1 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80054281A3}> {80054280D3}>) (#:RIGHT1) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:RIGHT-FILE3 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80054282C3}> {80054281F3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:IGNORE :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80054283E3}> {8005428313}>) NIL ((UNWIND-PROTECT (LET* ((PORT PORT) (CONTEXT CONTEXT) (READY READY) (WRITERS #) (CONTROLLERS #) (TABLE #) (DISPATCHER #)) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #:RIGHT-FILE3) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2))) NIL NIL SB-C::.ANONYMOUS. (LAMBDA (&OPTIONAL #:RIGHT1 #:RIGHT-FILE3 &REST #:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) NIL NIL)
61: (SB-C::IR1-CONVERT-HAIRY-ARGS #<SB-C::OPTIONAL-DISPATCH :%SOURCE-NAME SB-C::.ANONYMOUS. :%DEBUG-NAME (LAMBDA (&OPTIONAL #1=#:RIGHT1 #2=#:RIGHT-FILE3 &REST #3=#:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :TYPE #<SB-KERNEL:BUILT-IN-CLASSOID FUNCTION (read-only)> :WHERE-FROM :DEFINED :ARGLIST (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #1# :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80054281A3}> {80054280D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #2# :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80054282C3}> {80054281F3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #3# :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80054283E3}> {8005428313}>) :ALLOWP NIL :KEYP NIL :MIN-ARGS 0 :MAX-ARGS 0 :MAIN-ENTRY NIL {8005428553}> NIL NIL NIL NIL (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:RIGHT1 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80054281A3}> {80054280D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:RIGHT-FILE3 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80054282C3}> {80054281F3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:IGNORE :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80054283E3}> {8005428313}>) NIL ((UNWIND-PROTECT (LET* ((PORT PORT) (CONTEXT CONTEXT) (READY READY) (WRITERS #) (CONTROLLERS #) (TABLE #) (DISPATCHER #)) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #:RIGHT-FILE3) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2))) NIL NIL SB-C::.ANONYMOUS. (LAMBDA (&OPTIONAL #:RIGHT1 #:RIGHT-FILE3 &REST #:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) NIL NIL)
62: (SB-C::IR1-CONVERT-LAMBDA (LAMBDA (&OPTIONAL #:RIGHT1 #1=#:RIGHT-FILE3 &REST . #2=(#:IGNORE)) (DECLARE (IGNORE . #2#)) (UNWIND-PROTECT (LET* ((PORT PORT) (CONTEXT CONTEXT) (READY READY) (WRITERS #) (CONTROLLERS #) (TABLE #) (DISPATCHER #)) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #1#) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2))) :SOURCE-NAME SB-C::.ANONYMOUS. :DEBUG-NAME (LAMBDA (&OPTIONAL #:RIGHT1 #:RIGHT-FILE3 &REST #:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :MAYBE-ADD-DEBUG-CATCH T :FTYPE NIL)
63: (SB-C::FIND-OR-CONVERT-FUN-LEAF (LAMBDA (&OPTIONAL #:RIGHT1 #1=#:RIGHT-FILE3 &REST . #2=(#:IGNORE)) (DECLARE (IGNORE . #2#)) (UNWIND-PROTECT (LET* ((PORT PORT) (CONTEXT CONTEXT) (READY READY) (WRITERS #) (CONTROLLERS #) (TABLE #) (DISPATCHER #)) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #1#) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2))) #<SB-C::CTRAN 40 {8005427C63}>)
64: (SB-C::IR1-CONVERT-FUNCTION #<SB-C::CTRAN 40 {8005427C63}> #<SB-C::CTRAN 41 {8005427E03}> #<SB-C::LVAR 42 {8005427E43}> (FUNCTION (LAMBDA (&OPTIONAL #:RIGHT1 #1=#:RIGHT-FILE3 &REST . #2=(#:IGNORE)) (DECLARE (IGNORE . #2#)) (UNWIND-PROTECT (LET* (# # # # # # #) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #1#) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2)))))
65: (SB-C::IR1-CONVERT #<SB-C::CTRAN 40 {8005427C63}> #<SB-C::CTRAN 41 {8005427E03}> #<SB-C::LVAR 42 {8005427E43}> (FUNCTION (LAMBDA (&OPTIONAL #:RIGHT1 #1=#:RIGHT-FILE3 &REST . #2=(#:IGNORE)) (DECLARE (IGNORE . #2#)) (UNWIND-PROTECT (LET* (# # # # # # #) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #1#) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2)))))
66: (SB-C::IR1-CONVERT-MULTIPLE-VALUE-CALL #<SB-C::CTRAN 40 {8005427C63}> #<SB-C::CTRAN 43 {80054279B3}> #<SB-C::LVAR 44 {80054279F3}> (MULTIPLE-VALUE-CALL (FUNCTION (LAMBDA (&OPTIONAL #:RIGHT1 #1=#:RIGHT-FILE3 &REST . #2=(#:IGNORE)) (DECLARE (IGNORE . #2#)) (UNWIND-PROTECT (LET* # # # # # # #) (ARCDOCDB.IO:CHIUDI #1#) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2)))) (POOL-CLAIM-SERIES 82)))
67: (SB-C::IR1-CONVERT #<SB-C::CTRAN 40 {8005427C63}> #<SB-C::CTRAN 43 {80054279B3}> #<SB-C::LVAR 44 {80054279F3}> (MULTIPLE-VALUE-CALL (FUNCTION (LAMBDA (&OPTIONAL #:RIGHT1 #1=#:RIGHT-FILE3 &REST . #2=(#:IGNORE)) (DECLARE (IGNORE . #2#)) (UNWIND-PROTECT (LET* # # # # # # #) (ARCDOCDB.IO:CHIUDI #1#) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2)))) (POOL-CLAIM-SERIES 82)))
68: (SB-C::IR1-CONVERT-COMMON-FUNCTOID #<SB-C::CTRAN 40 {8005427C63}> #<SB-C::CTRAN 43 {80054279B3}> #<SB-C::LVAR 44 {80054279F3}> (MULTIPLE-VALUE-BIND (#:RIGHT1 #1=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* ((PORT PORT) (CONTEXT CONTEXT) (READY READY) (WRITERS #) (CONTROLLERS #) (TABLE #) (DISPATCHER #)) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #1#) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2))) MULTIPLE-VALUE-BIND)
69: (SB-C::IR1-CONVERT #<SB-C::CTRAN 40 {8005427C63}> #<SB-C::CTRAN 43 {80054279B3}> #<SB-C::LVAR 44 {80054279F3}> (MULTIPLE-VALUE-BIND (#:RIGHT1 #1=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* ((PORT PORT) (CONTEXT CONTEXT) (READY READY) (WRITERS #) (CONTROLLERS #) (TABLE #) (DISPATCHER #)) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #1#) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2))))
70: (SB-C::IR1-CONVERT-PROGN-BODY #<SB-C::CTRAN 40 {8005427C63}> #<SB-C::CTRAN 43 {80054279B3}> #<SB-C::LVAR 44 {80054279F3}> ((MULTIPLE-VALUE-BIND (#:RIGHT1 #1=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* (# # # # # # #) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #1#) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2)))))
71: (SB-C::IR1-CONVERT-AUX-BINDINGS #<SB-C::CTRAN 40 {8005427C63}> #<SB-C::CTRAN 43 {80054279B3}> #<SB-C::LVAR 44 {80054279F3}> ((MULTIPLE-VALUE-BIND (#:RIGHT1 #1=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* (# # # # # # #) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #1#) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2)))) NIL NIL NIL :VALUE-SOURCE-FORMS NIL)
72: (SB-C::IR1-CONVERT-SPECIAL-BINDINGS #<SB-C::CTRAN 40 {8005427C63}> #<SB-C::CTRAN 43 {80054279B3}> #<SB-C::LVAR 44 {80054279F3}> ((MULTIPLE-VALUE-BIND (#:RIGHT1 #1=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* (# # # # # # #) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #1#) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2)))) NIL NIL NIL NIL :VALUE-SOURCE-FORMS NIL)
73: (SB-C::IR1-CONVERT-LAMBDA-BODY ((MULTIPLE-VALUE-BIND (#:RIGHT1 #1=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* (# # # # # # #) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #1#) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2)))) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:LEFT0 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005427313}> {8005427243}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:LEFT-FILE2 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005427433}> {8005427363}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:IGNORE :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {8005427553}> {8005427483}>) :AUX-VARS NIL :AUX-VALS NIL :SOURCE-NAME SB-C::.ANONYMOUS. :DEBUG-NAME (LAMBDA (&OPTIONAL #:LEFT0 #:LEFT-FILE2 &REST #:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :NOTE-LEXICAL-BINDINGS T :POST-BINDING-LEXENV NIL :LOCAL-POLICY NIL :VALUE-SOURCE-FORMS NIL)
74: (SB-C::IR1-CONVERT-HAIRY-ARGS #<SB-C::OPTIONAL-DISPATCH :%SOURCE-NAME SB-C::.ANONYMOUS. :%DEBUG-NAME (LAMBDA (&OPTIONAL #1=#:LEFT0 #2=#:LEFT-FILE2 &REST #3=#:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :TYPE #<SB-KERNEL:BUILT-IN-CLASSOID FUNCTION (read-only)> :WHERE-FROM :DEFINED :ARGLIST (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #1# :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005427313}> {8005427243}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #2# :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005427433}> {8005427363}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #3# :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {8005427553}> {8005427483}>) :ALLOWP NIL :KEYP NIL :MIN-ARGS 0 :MAX-ARGS 0 :MAIN-ENTRY NIL {80054276C3}> (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:LEFT-FILE2 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005427433}> {8005427363}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:LEFT0 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005427313}> {8005427243}>) (#:LEFT-FILE2 #:LEFT0) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:LEFT-FILE2 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005427433}> {8005427363}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:LEFT0 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005427313}> {8005427243}>) (#:LEFT-FILE2 #:LEFT0) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:IGNORE :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {8005427553}> {8005427483}>) NIL ((MULTIPLE-VALUE-BIND (#:RIGHT1 #1=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* (# # # # # # #) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #1#) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2)))) NIL NIL SB-C::.ANONYMOUS. (LAMBDA (&OPTIONAL #:LEFT0 #:LEFT-FILE2 &REST #:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) NIL NIL)
75: (SB-C::IR1-CONVERT-HAIRY-ARGS #<SB-C::OPTIONAL-DISPATCH :%SOURCE-NAME SB-C::.ANONYMOUS. :%DEBUG-NAME (LAMBDA (&OPTIONAL #1=#:LEFT0 #2=#:LEFT-FILE2 &REST #3=#:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :TYPE #<SB-KERNEL:BUILT-IN-CLASSOID FUNCTION (read-only)> :WHERE-FROM :DEFINED :ARGLIST (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #1# :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005427313}> {8005427243}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #2# :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005427433}> {8005427363}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #3# :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {8005427553}> {8005427483}>) :ALLOWP NIL :KEYP NIL :MIN-ARGS 0 :MAX-ARGS 0 :MAIN-ENTRY NIL {80054276C3}> (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:LEFT0 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005427313}> {8005427243}>) (#:LEFT0) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:LEFT0 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005427313}> {8005427243}>) (#:LEFT0) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:LEFT-FILE2 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005427433}> {8005427363}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:IGNORE :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {8005427553}> {8005427483}>) NIL ((MULTIPLE-VALUE-BIND (#:RIGHT1 #1=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* (# # # # # # #) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #1#) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2)))) NIL NIL SB-C::.ANONYMOUS. (LAMBDA (&OPTIONAL #:LEFT0 #:LEFT-FILE2 &REST #:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) NIL NIL)
76: (SB-C::IR1-CONVERT-HAIRY-ARGS #<SB-C::OPTIONAL-DISPATCH :%SOURCE-NAME SB-C::.ANONYMOUS. :%DEBUG-NAME (LAMBDA (&OPTIONAL #1=#:LEFT0 #2=#:LEFT-FILE2 &REST #3=#:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :TYPE #<SB-KERNEL:BUILT-IN-CLASSOID FUNCTION (read-only)> :WHERE-FROM :DEFINED :ARGLIST (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #1# :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005427313}> {8005427243}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #2# :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005427433}> {8005427363}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #3# :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {8005427553}> {8005427483}>) :ALLOWP NIL :KEYP NIL :MIN-ARGS 0 :MAX-ARGS 0 :MAIN-ENTRY NIL {80054276C3}> NIL NIL NIL NIL (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:LEFT0 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005427313}> {8005427243}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:LEFT-FILE2 :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005427433}> {8005427363}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:IGNORE :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {8005427553}> {8005427483}>) NIL ((MULTIPLE-VALUE-BIND (#:RIGHT1 #1=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* (# # # # # # #) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #1#) (ARCDOCDB.IO:CHIUDI #:LEFT-FILE2)))) NIL NIL SB-C::.ANONYMOUS. (LAMBDA (&OPTIONAL #:LEFT0 #:LEFT-FILE2 &REST #:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) NIL NIL)
77: (SB-C::IR1-CONVERT-LAMBDA (LAMBDA (&OPTIONAL #:LEFT0 #1=#:LEFT-FILE2 &REST . #2=(#:IGNORE)) (DECLARE (IGNORE . #2#)) (MULTIPLE-VALUE-BIND (#:RIGHT1 #3=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* (# # # # # # #) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #3#) (ARCDOCDB.IO:CHIUDI #1#)))) :SOURCE-NAME SB-C::.ANONYMOUS. :DEBUG-NAME (LAMBDA (&OPTIONAL #:LEFT0 #:LEFT-FILE2 &REST #:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :MAYBE-ADD-DEBUG-CATCH T :FTYPE NIL)
78: (SB-C::FIND-OR-CONVERT-FUN-LEAF (LAMBDA (&OPTIONAL #:LEFT0 #1=#:LEFT-FILE2 &REST . #2=(#:IGNORE)) (DECLARE (IGNORE . #2#)) (MULTIPLE-VALUE-BIND (#:RIGHT1 #3=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* (# # # # # # #) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #3#) (ARCDOCDB.IO:CHIUDI #1#)))) #<SB-C::CTRAN 45 {8005426DD3}>)
79: (SB-C::IR1-CONVERT-FUNCTION #<SB-C::CTRAN 45 {8005426DD3}> #<SB-C::CTRAN 46 {8005426F73}> #<SB-C::LVAR 47 {8005426FB3}> (FUNCTION (LAMBDA (&OPTIONAL #:LEFT0 #1=#:LEFT-FILE2 &REST . #2=(#:IGNORE)) (DECLARE (IGNORE . #2#)) (MULTIPLE-VALUE-BIND (#:RIGHT1 #3=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* # # # # # # #) (ARCDOCDB.IO:CHIUDI #3#) (ARCDOCDB.IO:CHIUDI #1#))))))
80: (SB-C::IR1-CONVERT #<SB-C::CTRAN 45 {8005426DD3}> #<SB-C::CTRAN 46 {8005426F73}> #<SB-C::LVAR 47 {8005426FB3}> (FUNCTION (LAMBDA (&OPTIONAL #:LEFT0 #1=#:LEFT-FILE2 &REST . #2=(#:IGNORE)) (DECLARE (IGNORE . #2#)) (MULTIPLE-VALUE-BIND (#:RIGHT1 #3=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* # # # # # # #) (ARCDOCDB.IO:CHIUDI #3#) (ARCDOCDB.IO:CHIUDI #1#))))))
81: (SB-C::IR1-CONVERT-MULTIPLE-VALUE-CALL #<SB-C::CTRAN 45 {8005426DD3}> #<SB-C::CTRAN 48 {8005426B23}> #<SB-C::LVAR 49 {8005426B63}> (MULTIPLE-VALUE-CALL (FUNCTION (LAMBDA (&OPTIONAL #:LEFT0 #:LEFT-FILE2 &REST . #1=(#:IGNORE)) (DECLARE (IGNORE . #1#)) (MULTIPLE-VALUE-BIND (#:RIGHT1 #:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT # # #)))) (POOL-CLAIM-SERIES 81)))
82: (SB-C::IR1-CONVERT #<SB-C::CTRAN 45 {8005426DD3}> #<SB-C::CTRAN 48 {8005426B23}> #<SB-C::LVAR 49 {8005426B63}> (MULTIPLE-VALUE-CALL (FUNCTION (LAMBDA (&OPTIONAL #:LEFT0 #:LEFT-FILE2 &REST . #1=(#:IGNORE)) (DECLARE (IGNORE . #1#)) (MULTIPLE-VALUE-BIND (#:RIGHT1 #:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT # # #)))) (POOL-CLAIM-SERIES 81)))
83: (SB-C::IR1-CONVERT-COMMON-FUNCTOID #<SB-C::CTRAN 45 {8005426DD3}> #<SB-C::CTRAN 48 {8005426B23}> #<SB-C::LVAR 49 {8005426B63}> (MULTIPLE-VALUE-BIND (#:LEFT0 #1=#:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND (#:RIGHT1 #2=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* (# # # # # # #) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #2#) (ARCDOCDB.IO:CHIUDI #1#)))) MULTIPLE-VALUE-BIND)
84: (SB-C::IR1-CONVERT #<SB-C::CTRAN 45 {8005426DD3}> #<SB-C::CTRAN 48 {8005426B23}> #<SB-C::LVAR 49 {8005426B63}> (MULTIPLE-VALUE-BIND (#:LEFT0 #1=#:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND (#:RIGHT1 #2=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* (# # # # # # #) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE)) (ARCDOCDB.IO:CHIUDI #2#) (ARCDOCDB.IO:CHIUDI #1#)))))
85: (SB-C::IR1-CONVERT-PROGN-BODY #<SB-C::CTRAN 45 {8005426DD3}> #<SB-C::CTRAN 48 {8005426B23}> #<SB-C::LVAR 49 {8005426B63}> ((MULTIPLE-VALUE-BIND (#:LEFT0 #1=#:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND (#:RIGHT1 #2=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* # # # # # # #) (ARCDOCDB.IO:CHIUDI #2#) (ARCDOCDB.IO:CHIUDI #1#))))))
86: (SB-C::IR1-CONVERT-AUX-BINDINGS #<SB-C::CTRAN 45 {8005426DD3}> #<SB-C::CTRAN 48 {8005426B23}> #<SB-C::LVAR 49 {8005426B63}> ((MULTIPLE-VALUE-BIND (#:LEFT0 #1=#:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND (#:RIGHT1 #2=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* # # # # # # #) (ARCDOCDB.IO:CHIUDI #2#) (ARCDOCDB.IO:CHIUDI #1#))))) NIL NIL NIL :VALUE-SOURCE-FORMS NIL)
87: (SB-C::IR1-CONVERT-SPECIAL-BINDINGS #<SB-C::CTRAN 45 {8005426DD3}> #<SB-C::CTRAN 48 {8005426B23}> #<SB-C::LVAR 49 {8005426B63}> ((MULTIPLE-VALUE-BIND (#:LEFT0 #1=#:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND (#:RIGHT1 #2=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* # # # # # # #) (ARCDOCDB.IO:CHIUDI #2#) (ARCDOCDB.IO:CHIUDI #1#))))) NIL NIL NIL NIL :VALUE-SOURCE-FORMS NIL)
88: (SB-C::IR1-CONVERT-LAMBDA-BODY ((MULTIPLE-VALUE-BIND (#:LEFT0 #1=#:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND (#:RIGHT1 #2=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* # # # # # # #) (ARCDOCDB.IO:CHIUDI #2#) (ARCDOCDB.IO:CHIUDI #1#))))) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME PORT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005426363}> {8005426293}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTEXT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005426483}> {80054263B3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME READY :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80054265A3}> {80054264D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:IGNORE :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80054266C3}> {80054265F3}>) :AUX-VARS NIL :AUX-VALS NIL :SOURCE-NAME SB-C::.ANONYMOUS. :DEBUG-NAME (LAMBDA (&OPTIONAL PORT CONTEXT READY &REST #:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :NOTE-LEXICAL-BINDINGS T :POST-BINDING-LEXENV NIL :LOCAL-POLICY NIL :VALUE-SOURCE-FORMS NIL)
89: (SB-C::IR1-CONVERT-HAIRY-ARGS #<SB-C::OPTIONAL-DISPATCH :%SOURCE-NAME SB-C::.ANONYMOUS. :%DEBUG-NAME (LAMBDA (&OPTIONAL PORT CONTEXT READY &REST #1=#:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :TYPE #<SB-KERNEL:BUILT-IN-CLASSOID FUNCTION (read-only)> :WHERE-FROM :DEFINED :ARGLIST (#<SB-C::LAMBDA-VAR :%SOURCE-NAME PORT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005426363}> {8005426293}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTEXT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005426483}> {80054263B3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME READY :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80054265A3}> {80054264D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #1# :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80054266C3}> {80054265F3}>) :ALLOWP NIL :KEYP NIL :MIN-ARGS 0 :MAX-ARGS 0 :MAIN-ENTRY NIL {8005426833}> (#<SB-C::LAMBDA-VAR :%SOURCE-NAME READY :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80054265A3}> {80054264D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTEXT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005426483}> {80054263B3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME PORT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005426363}> {8005426293}>) (READY CONTEXT PORT) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME READY :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80054265A3}> {80054264D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTEXT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005426483}> {80054263B3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME PORT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005426363}> {8005426293}>) (READY CONTEXT PORT) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME #:IGNORE :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80054266C3}> {80054265F3}>) NIL ((MULTIPLE-VALUE-BIND (#:LEFT0 #1=#:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND (#:RIGHT1 #2=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* # # # # # # #) (ARCDOCDB.IO:CHIUDI #2#) (ARCDOCDB.IO:CHIUDI #1#))))) NIL NIL SB-C::.ANONYMOUS. (LAMBDA (&OPTIONAL PORT CONTEXT READY &REST #:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) NIL NIL)
90: (SB-C::IR1-CONVERT-HAIRY-ARGS #<SB-C::OPTIONAL-DISPATCH :%SOURCE-NAME SB-C::.ANONYMOUS. :%DEBUG-NAME (LAMBDA (&OPTIONAL PORT CONTEXT READY &REST #1=#:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :TYPE #<SB-KERNEL:BUILT-IN-CLASSOID FUNCTION (read-only)> :WHERE-FROM :DEFINED :ARGLIST (#<SB-C::LAMBDA-VAR :%SOURCE-NAME PORT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005426363}> {8005426293}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTEXT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005426483}> {80054263B3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME READY :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80054265A3}> {80054264D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #1# :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80054266C3}> {80054265F3}>) :ALLOWP NIL :KEYP NIL :MIN-ARGS 0 :MAX-ARGS 0 :MAIN-ENTRY NIL {8005426833}> (#<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTEXT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005426483}> {80054263B3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME PORT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005426363}> {8005426293}>) (CONTEXT PORT) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTEXT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005426483}> {80054263B3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME PORT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005426363}> {8005426293}>) (CONTEXT PORT) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME READY :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80054265A3}> {80054264D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:IGNORE :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80054266C3}> {80054265F3}>) NIL ((MULTIPLE-VALUE-BIND (#:LEFT0 #1=#:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND (#:RIGHT1 #2=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* # # # # # # #) (ARCDOCDB.IO:CHIUDI #2#) (ARCDOCDB.IO:CHIUDI #1#))))) NIL NIL SB-C::.ANONYMOUS. (LAMBDA (&OPTIONAL PORT CONTEXT READY &REST #:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) NIL NIL)
91: (SB-C::IR1-CONVERT-HAIRY-ARGS #<SB-C::OPTIONAL-DISPATCH :%SOURCE-NAME SB-C::.ANONYMOUS. :%DEBUG-NAME (LAMBDA (&OPTIONAL PORT CONTEXT READY &REST #1=#:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :TYPE #<SB-KERNEL:BUILT-IN-CLASSOID FUNCTION (read-only)> :WHERE-FROM :DEFINED :ARGLIST (#<SB-C::LAMBDA-VAR :%SOURCE-NAME PORT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005426363}> {8005426293}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTEXT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005426483}> {80054263B3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME READY :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80054265A3}> {80054264D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #1# :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80054266C3}> {80054265F3}>) :ALLOWP NIL :KEYP NIL :MIN-ARGS 0 :MAX-ARGS 0 :MAIN-ENTRY NIL {8005426833}> (#<SB-C::LAMBDA-VAR :%SOURCE-NAME PORT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005426363}> {8005426293}>) (PORT) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME PORT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005426363}> {8005426293}>) (PORT) (#<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTEXT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005426483}> {80054263B3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME READY :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80054265A3}> {80054264D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:IGNORE :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80054266C3}> {80054265F3}>) NIL ((MULTIPLE-VALUE-BIND (#:LEFT0 #1=#:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND (#:RIGHT1 #2=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* # # # # # # #) (ARCDOCDB.IO:CHIUDI #2#) (ARCDOCDB.IO:CHIUDI #1#))))) NIL NIL SB-C::.ANONYMOUS. (LAMBDA (&OPTIONAL PORT CONTEXT READY &REST #:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) NIL NIL)
92: (SB-C::IR1-CONVERT-HAIRY-ARGS #<SB-C::OPTIONAL-DISPATCH :%SOURCE-NAME SB-C::.ANONYMOUS. :%DEBUG-NAME (LAMBDA (&OPTIONAL PORT CONTEXT READY &REST #1=#:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :TYPE #<SB-KERNEL:BUILT-IN-CLASSOID FUNCTION (read-only)> :WHERE-FROM :DEFINED :ARGLIST (#<SB-C::LAMBDA-VAR :%SOURCE-NAME PORT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005426363}> {8005426293}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTEXT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005426483}> {80054263B3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME READY :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80054265A3}> {80054264D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #1# :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80054266C3}> {80054265F3}>) :ALLOWP NIL :KEYP NIL :MIN-ARGS 0 :MAX-ARGS 0 :MAIN-ENTRY NIL {8005426833}> NIL NIL NIL NIL (#<SB-C::LAMBDA-VAR :%SOURCE-NAME PORT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005426363}> {8005426293}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME CONTEXT :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {8005426483}> {80054263B3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME READY :ARG-INFO #<SB-C::ARG-INFO  :KIND :OPTIONAL {80054265A3}> {80054264D3}> #<SB-C::LAMBDA-VAR :%SOURCE-NAME #:IGNORE :FLAGS (IGNORE) :ARG-INFO #<SB-C::ARG-INFO  :KIND :REST {80054266C3}> {80054265F3}>) NIL ((MULTIPLE-VALUE-BIND (#:LEFT0 #1=#:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND (#:RIGHT1 #2=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* # # # # # # #) (ARCDOCDB.IO:CHIUDI #2#) (ARCDOCDB.IO:CHIUDI #1#))))) NIL NIL SB-C::.ANONYMOUS. (LAMBDA (&OPTIONAL PORT CONTEXT READY &REST #:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) NIL NIL)
93: (SB-C::IR1-CONVERT-LAMBDA (LAMBDA (&OPTIONAL PORT CONTEXT READY &REST . #1=(#:IGNORE)) (DECLARE (IGNORE . #1#)) (MULTIPLE-VALUE-BIND (#:LEFT0 #2=#:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND (#:RIGHT1 #3=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* # # # # # # #) (ARCDOCDB.IO:CHIUDI #3#) (ARCDOCDB.IO:CHIUDI #2#))))) :SOURCE-NAME SB-C::.ANONYMOUS. :DEBUG-NAME (LAMBDA (&OPTIONAL PORT CONTEXT READY &REST #:IGNORE) :IN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) :MAYBE-ADD-DEBUG-CATCH T :FTYPE NIL)
94: (SB-C::FIND-OR-CONVERT-FUN-LEAF (LAMBDA (&OPTIONAL PORT CONTEXT READY &REST . #1=(#:IGNORE)) (DECLARE (IGNORE . #1#)) (MULTIPLE-VALUE-BIND (#:LEFT0 #2=#:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND (#:RIGHT1 #3=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* # # # # # # #) (ARCDOCDB.IO:CHIUDI #3#) (ARCDOCDB.IO:CHIUDI #2#))))) #<SB-C::CTRAN 50 {8005425B93}>)
95: (SB-C::IR1-CONVERT-FUNCTION #<SB-C::CTRAN 50 {8005425B93}> #<SB-C::CTRAN 51 {8005425FC3}> #<SB-C::LVAR 52 {8005426003}> (FUNCTION (LAMBDA (&OPTIONAL PORT CONTEXT READY &REST . #1=(#:IGNORE)) (DECLARE (IGNORE . #1#)) (MULTIPLE-VALUE-BIND (#:LEFT0 #:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND (#:RIGHT1 #:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT # # #))))))
96: (SB-C::IR1-CONVERT #<SB-C::CTRAN 50 {8005425B93}> #<SB-C::CTRAN 51 {8005425FC3}> #<SB-C::LVAR 52 {8005426003}> (FUNCTION (LAMBDA (&OPTIONAL PORT CONTEXT READY &REST . #1=(#:IGNORE)) (DECLARE (IGNORE . #1#)) (MULTIPLE-VALUE-BIND (#:LEFT0 #:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND (#:RIGHT1 #:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT # # #))))))
97: (SB-C::IR1-CONVERT-MULTIPLE-VALUE-CALL #<SB-C::CTRAN 50 {8005425B93}> #<SB-C::CTRAN 53 {8005425763}> #<SB-C::LVAR 54 {80054257A3}> (MULTIPLE-VALUE-CALL (FUNCTION (LAMBDA (&OPTIONAL PORT CONTEXT READY &REST . #1=(#:IGNORE)) (DECLARE (IGNORE . #1#)) (MULTIPLE-VALUE-BIND (#:LEFT0 #:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND # # #)))) (POOL-CLAIM-LOCAL :ACTIVE T :SHARDS 1 :CAPACITY 1 :START 0)))
98: (SB-C::IR1-CONVERT #<SB-C::CTRAN 50 {8005425B93}> #<SB-C::CTRAN 53 {8005425763}> #<SB-C::LVAR 54 {80054257A3}> (MULTIPLE-VALUE-CALL (FUNCTION (LAMBDA (&OPTIONAL PORT CONTEXT READY &REST . #1=(#:IGNORE)) (DECLARE (IGNORE . #1#)) (MULTIPLE-VALUE-BIND (#:LEFT0 #:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND # # #)))) (POOL-CLAIM-LOCAL :ACTIVE T :SHARDS 1 :CAPACITY 1 :START 0)))
99: (SB-C::IR1-CONVERT-COMMON-FUNCTOID #<SB-C::CTRAN 50 {8005425B93}> #<SB-C::CTRAN 53 {8005425763}> #<SB-C::LVAR 54 {80054257A3}> (MULTIPLE-VALUE-BIND (PORT CONTEXT READY) (POOL-CLAIM-LOCAL :ACTIVE T :SHARDS 1 :CAPACITY 1 :START 0) (MULTIPLE-VALUE-BIND (#:LEFT0 #1=#:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND (#:RIGHT1 #2=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* # # # # # # #) (ARCDOCDB.IO:CHIUDI #2#) (ARCDOCDB.IO:CHIUDI #1#))))) MULTIPLE-VALUE-BIND)
100: (SB-C::IR1-CONVERT #<SB-C::CTRAN 50 {8005425B93}> #<SB-C::CTRAN 53 {8005425763}> #<SB-C::LVAR 54 {80054257A3}> (MULTIPLE-VALUE-BIND (PORT CONTEXT READY) (POOL-CLAIM-LOCAL :ACTIVE T :SHARDS 1 :CAPACITY 1 :START 0) (MULTIPLE-VALUE-BIND (#:LEFT0 #1=#:LEFT-FILE2) (POOL-CLAIM-SERIES 81) (MULTIPLE-VALUE-BIND (#:RIGHT1 #2=#:RIGHT-FILE3) (POOL-CLAIM-SERIES 82) (UNWIND-PROTECT (LET* # # # # # # #) (ARCDOCDB.IO:CHIUDI #2#) (ARCDOCDB.IO:CHIUDI #1#))))))
101: (SB-C::IR1-CONVERT-COMMON-FUNCTOID #<SB-C::CTRAN 50 {8005425B93}> #<SB-C::CTRAN 53 {8005425763}> #<SB-C::LVAR 54 {80054257A3}> (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT (SVREF WRITERS 0) 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER (SVREF WRITERS 0))) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)) WITH-POOL-DISPATCH)
102: (SB-C::IR1-CONVERT #<SB-C::CTRAN 50 {8005425B93}> #<SB-C::CTRAN 53 {8005425763}> #<SB-C::LVAR 54 {80054257A3}> (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT (SVREF WRITERS 0) 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER (SVREF WRITERS 0))) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)))
103: (SB-C::IR1-CONVERT-PROGN-BODY #<SB-C::CTRAN 50 {8005425B93}> #<SB-C::CTRAN 53 {8005425763}> #<SB-C::LVAR 54 {80054257A3}> ((WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT # 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER #)) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE))))
104: (SB-C::IR1-CONVERT-BLOCK #<SB-C::CTRAN 55 {8005425A13}> #<SB-C::CTRAN 53 {8005425763}> #<SB-C::LVAR 54 {80054257A3}> (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT # 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER #)) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE))))
105: (SB-C::IR1-CONVERT #<SB-C::CTRAN 55 {8005425A13}> #<SB-C::CTRAN 53 {8005425763}> #<SB-C::LVAR 54 {80054257A3}> (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT # 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER #)) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE))))
106: (SB-C::IR1-CONVERT-PROGN-BODY #<SB-C::CTRAN 55 {8005425A13}> #<SB-C::CTRAN 53 {8005425763}> #<SB-C::LVAR 54 {80054257A3}> ((BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)))))
107: (SB-C::IR1-CONVERT-AUX-BINDINGS #<SB-C::CTRAN 55 {8005425A13}> #<SB-C::CTRAN 53 {8005425763}> #<SB-C::LVAR 54 {80054257A3}> ((BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)))) NIL NIL NIL :VALUE-SOURCE-FORMS NIL)
108: (SB-C::IR1-CONVERT-SPECIAL-BINDINGS #<SB-C::CTRAN 55 {8005425A13}> #<SB-C::CTRAN 53 {8005425763}> #<SB-C::LVAR 54 {80054257A3}> ((BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)))) NIL NIL NIL NIL :VALUE-SOURCE-FORMS NIL)
109: (SB-C::IR1-CONVERT-LAMBDA-BODY ((BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)))) NIL :AUX-VARS NIL :AUX-VALS NIL :SOURCE-NAME TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION :DEBUG-NAME NIL :NOTE-LEXICAL-BINDINGS T :POST-BINDING-LEXENV NIL :LOCAL-POLICY NIL :VALUE-SOURCE-FORMS NIL)
110: (SB-C::IR1-CONVERT-LAMBDA (LAMBDA NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)))) :SOURCE-NAME TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION :DEBUG-NAME NIL :MAYBE-ADD-DEBUG-CATCH T :FTYPE NIL)
111: (SB-C::IR1-CONVERT-LAMBDA-FOR-DEFUN (LAMBDA NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)))) #<SB-C::DEFINED-FUN :%SOURCE-NAME TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION :INLINEP NIL :SAME-BLOCK-P T {80054243C3}> T)
112: (SB-C::IR1-CONVERT-LAMBDALIKE (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)))) :SOURCE-NAME SB-C::.ANONYMOUS. :DEBUG-NAME TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION :FTYPE NIL)
113: (SB-C::FIND-OR-CONVERT-FUN-LEAF (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)))) #<SB-C::CTRAN 56 {8005425123}>)
114: (SB-C::IR1-CONVERT-FUNCTION #<SB-C::CTRAN 56 {8005425123}> #<SB-C::CTRAN 57 {80054252B3}> #<SB-C::LVAR 58 {80054252F3}> (FUNCTION (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE))))))
115: (SB-C::IR1-CONVERT #<SB-C::CTRAN 56 {8005425123}> #<SB-C::CTRAN 57 {80054252B3}> #<SB-C::LVAR 58 {80054252F3}> (FUNCTION (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE))))))
116: (SB-C::IR1-CONVERT-COMMON-FUNCTOID #<SB-C::CTRAN 56 {8005425123}> #<SB-C::CTRAN 57 {80054252B3}> #<SB-C::LVAR 58 {80054252F3}> (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)))) SB-INT:NAMED-LAMBDA)
117: (SB-C::IR1-CONVERT #<SB-C::CTRAN 56 {8005425123}> #<SB-C::CTRAN 57 {80054252B3}> #<SB-C::LVAR 58 {80054252F3}> (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE)))))
118: (SB-C::IR1-CONVERT-COMBINATION-ARGS #<SB-C::LVAR 59 {8005424F93}> #<SB-C::CTRAN 60 {8005424F53}> #<SB-C::CTRAN 61 {8005424E43}> NIL ((QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE))))) :PASS-NARGS T :ARG-SOURCE-FORMS NIL)
119: (SB-C::IR1-CONVERT-COMBINATION #<SB-C::CTRAN 62 {8005424CC3}> #<SB-C::CTRAN 61 {8005424E43}> NIL (SB-IMPL::%DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE))))) #<SB-C::GLOBAL-VAR :%SOURCE-NAME SB-IMPL::%DEFUN :TYPE #<SB-KERNEL:BUILT-IN-CLASSOID FUNCTION (read-only)> :DEFINED-TYPE #<SB-KERNEL:FUN-TYPE (FUNCTION (T FUNCTION &OPTIONAL T T) (VALUES (OR CONS SYMBOL) &OPTIONAL))> :WHERE-FROM :DEFINED :KIND :GLOBAL-FUNCTION {8005424EE3}>)
120: (SB-C::IR1-CONVERT-COMBINATION-CHECKING-TYPE #<SB-C::CTRAN 62 {8005424CC3}> #<SB-C::CTRAN 61 {8005424E43}> NIL (SB-IMPL::%DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE))))) #<SB-C::GLOBAL-VAR :%SOURCE-NAME SB-IMPL::%DEFUN :TYPE #<SB-KERNEL:BUILT-IN-CLASSOID FUNCTION (read-only)> :DEFINED-TYPE #<SB-KERNEL:FUN-TYPE (FUNCTION (T FUNCTION &OPTIONAL T T) (VALUES (OR CONS SYMBOL) &OPTIONAL))> :WHERE-FROM :DEFINED :KIND :GLOBAL-FUNCTION {8005424EE3}>)
121: (SB-C::IR1-CONVERT #<SB-C::CTRAN 62 {8005424CC3}> #<SB-C::CTRAN 61 {8005424E43}> NIL (SB-IMPL::%DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE))))))
122: (SB-C::IR1-CONVERT-PROGN-BODY #<SB-C::CTRAN 62 {8005424CC3}> #<SB-C::CTRAN 63 {8005424A13}> #<SB-C::LVAR 64 {8005424A53}> ((SB-IMPL::%DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH # # # # # # #)))) NIL))
123: (SB-C::IR1-CONVERT-AUX-BINDINGS #<SB-C::CTRAN 62 {8005424CC3}> #<SB-C::CTRAN 63 {8005424A13}> #<SB-C::LVAR 64 {8005424A53}> ((SB-IMPL::%DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH # # # # # # #)))) NIL) NIL NIL NIL :VALUE-SOURCE-FORMS NIL)
124: (SB-C::IR1-CONVERT-SPECIAL-BINDINGS #<SB-C::CTRAN 62 {8005424CC3}> #<SB-C::CTRAN 63 {8005424A13}> #<SB-C::LVAR 64 {8005424A53}> ((SB-IMPL::%DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH # # # # # # #)))) NIL) NIL NIL NIL NIL :VALUE-SOURCE-FORMS NIL)
125: (SB-C::IR1-CONVERT-LAMBDA-BODY ((SB-IMPL::%DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH # # # # # # #)))) NIL) NIL :AUX-VARS NIL :AUX-VALS NIL :SOURCE-NAME SB-C::.ANONYMOUS. :DEBUG-NAME \"top level form\" :NOTE-LEXICAL-BINDINGS T :POST-BINDING-LEXENV NIL :LOCAL-POLICY NIL :VALUE-SOURCE-FORMS NIL)
126: (SB-C::IR1-TOPLEVEL (SB-IMPL::%DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE))))) (#1=(SB-IMPL::%DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION . #2=(#)))) (PROGN (EVAL-WHEN (:COMPILE-TOPLEVEL) (SB-C:%COMPILER-DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) T NIL NIL)) #1#) #3=(DEFUN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL . #2#) (PROGN #3# (PUSHNEW (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) *TESTS*)) SB-C::ORIGINAL-SOURCE-START 0 9) NIL T)
127: (SB-C::CONVERT-AND-MAYBE-COMPILE (SB-IMPL::%DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE))))) (#1=(SB-IMPL::%DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION . #2=(#)))) (PROGN (EVAL-WHEN (:COMPILE-TOPLEVEL) (SB-C:%COMPILER-DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) T NIL NIL)) #1#) #3=(DEFUN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL . #2#) (PROGN #3# (PUSHNEW (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) *TESTS*)) SB-C::ORIGINAL-SOURCE-START 0 9))
128: (SB-C::PROCESS-TOPLEVEL-FORM (SB-IMPL::%DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE))))) ((PROGN (EVAL-WHEN (:COMPILE-TOPLEVEL) (SB-C:%COMPILER-DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) T NIL NIL)) (SB-IMPL::%DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE #) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION . #1=#)))) #2=(DEFUN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL . #1#) (PROGN #2# (PUSHNEW (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) *TESTS*)) SB-C::ORIGINAL-SOURCE-START 0 9) NIL)
129: (SB-C::PROCESS-TOPLEVEL-PROGN ((EVAL-WHEN (:COMPILE-TOPLEVEL) (SB-C:%COMPILER-DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) T NIL NIL)) (SB-IMPL::%DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH # # # # # # #))))) ((PROGN (EVAL-WHEN (:COMPILE-TOPLEVEL) (SB-C:%COMPILER-DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) T NIL NIL)) (SB-IMPL::%DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE #) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION . #1=#)))) #2=(DEFUN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL . #1#) (PROGN #2# (PUSHNEW (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) *TESTS*)) SB-C::ORIGINAL-SOURCE-START 0 9) NIL)
130: (SB-C::PROCESS-TOPLEVEL-FORM (PROGN (EVAL-WHEN (:COMPILE-TOPLEVEL) (SB-C:%COMPILER-DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) T NIL NIL)) (SB-IMPL::%DEFUN (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) (SB-INT:NAMED-LAMBDA TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH # # # # # # #))))) (#1=(DEFUN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE))) (PROGN #1# (PUSHNEW (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) *TESTS*)) SB-C::ORIGINAL-SOURCE-START 0 9) NIL)
131: (SB-C::PROCESS-TOPLEVEL-FORM (DEFUN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT # 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER #)) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE))) ((PROGN (DEFUN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE))) (PUSHNEW (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) *TESTS*)) SB-C::ORIGINAL-SOURCE-START 0 9) NIL)
132: (SB-C::PROCESS-TOPLEVEL-PROGN ((DEFUN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE))) (PUSHNEW (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) *TESTS*)) ((PROGN (DEFUN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE #) (IS #) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE) (MULTIPLE-VALUE-BIND # # # #) (SETF # 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS # # :WORKER-STATE))) (PUSHNEW (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) *TESTS*)) SB-C::ORIGINAL-SOURCE-START 0 9) NIL)
133: (SB-C::PROCESS-TOPLEVEL-FORM (PROGN (DEFUN TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION NIL (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL #)) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS #) (IS #)) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL #) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE))) (PUSHNEW (QUOTE TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION) *TESTS*)) (SB-C::ORIGINAL-SOURCE-START 0 9) NIL)
134: (SB-C::PROCESS-TOPLEVEL-FORM (DEFTEST TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT # 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER #)) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE))) (SB-C::ORIGINAL-SOURCE-START 0 9) NIL)
135: ((LAMBDA (SB-KERNEL:FORM &KEY :CURRENT-INDEX &ALLOW-OTHER-KEYS) :IN SB-C::SUB-COMPILE-FILE) (DEFTEST TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORE DISPATCHER READY CONTROLLERS)) (IS (NULL (ARCDOCDB.EXECUTION:ADOTTA-WRITER-WORKER CONTEXT # 0))) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE RESOURCE-EXHAUSTED) :WORKER-STATE) (MULTIPLE-VALUE-BIND (WRITER HOME) (ARCDOCDB.EXECUTION:CEDE-WRITER-WORKER CONTEXT) (IS (EQ WRITER #)) (IS (= 0 HOME))) (SETF (ARCDOCDB.EXECUTION::CONTESTO-WORKER-WRITER-PENDING CONTEXT) 1) (POOL-DISPATCH-REFUSAL PORT TABLE WRITERS (LAMBDA NIL (ARCDOCDB.SCHEDULER.DISPATCH:CREA-DISPATCHER-WRITER-POOL PORT TABLE)) (QUOTE INVARIANT-VIOLATION) :WORKER-STATE))) :CURRENT-INDEX 9)
136: (SB-C::%DO-FORMS-FROM-INFO #<FUNCTION (LAMBDA (SB-KERNEL:FORM &KEY :CURRENT-INDEX &ALLOW-OTHER-KEYS) :IN SB-C::SUB-COMPILE-FILE) {800347C83B}> #<SB-C::SOURCE-INFO {8008BA06C3}> SB-C::INPUT-ERROR-IN-COMPILE-FILE)
137: ((LAMBDA NIL :IN SB-C::SUB-COMPILE-FILE))
138: ((FLET SB-C::WITH-IT :IN SB-C::%WITH-COMPILATION-UNIT))
139: (SB-C::SUB-COMPILE-FILE #<SB-C::SOURCE-INFO {8008BA06C3}> NIL)
140: (COMPILE-FILE #P\"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/dispatch.lisp\" :OUTPUT-FILE #P\"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/dispatch-tmpGHU3ALSV.fasl\" :VERBOSE NIL :PRINT NIL :EXTERNAL-FORMAT :UTF-8 :PROGRESS NIL :TRACE-FILE NIL :BLOCK-COMPILE NIL :ENTRY-POINTS NIL :EMIT-CFASL NIL)
141: (UIOP/UTILITY:CALL-WITH-MUFFLED-CONDITIONS #<FUNCTION (LAMBDA NIL :IN UIOP/LISP-BUILD:COMPILE-FILE*) {8008BA068B}> NIL)
142: (UIOP/PATHNAME:CALL-WITH-ENOUGH-PATHNAME #P\"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/dispatch.lisp\" NIL #<FUNCTION (LAMBDA (UIOP/LISP-BUILD::INPUT-FILE) :IN UIOP/LISP-BUILD:COMPILE-FILE*) {8008BA064B}>)
143: (UIOP/LISP-BUILD:COMPILE-FILE* #P\"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/dispatch.lisp\" :OUTPUT-FILE #P\"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/dispatch.fasl\" :EXTERNAL-FORMAT :UTF-8 :WARNINGS-FILE NIL)
144: (ASDF/LISP-ACTION:PERFORM-LISP-COMPILATION #<ASDF/LISP-ACTION:COMPILE-OP > #<ASDF/LISP-ACTION:CL-SOURCE-FILE \"arcdocdb/tests\" \"scheduler\" \"dispatch\">)
145: ((SB-PCL::EMF ASDF/ACTION:PERFORM) #<unused argument> #<unused argument> #<ASDF/LISP-ACTION:COMPILE-OP > #<ASDF/LISP-ACTION:CL-SOURCE-FILE \"arcdocdb/tests\" \"scheduler\" \"dispatch\">)
146: ((LAMBDA NIL :IN ASDF/ACTION:CALL-WHILE-VISITING-ACTION))
147: ((:METHOD ASDF/ACTION:PERFORM-WITH-RESTARTS :AROUND (T T)) #<ASDF/LISP-ACTION:COMPILE-OP > #<ASDF/LISP-ACTION:CL-SOURCE-FILE \"arcdocdb/tests\" \"scheduler\" \"dispatch\">) [fast-method]
148: ((:METHOD ASDF/PLAN:PERFORM-PLAN (T)) #<ASDF/PLAN:SEQUENTIAL-PLAN {8008BA02F3}>) [fast-method]
149: ((FLET SB-C::WITH-IT :IN SB-C::%WITH-COMPILATION-UNIT))
150: ((:METHOD ASDF/PLAN:PERFORM-PLAN :AROUND (T)) #<ASDF/PLAN:SEQUENTIAL-PLAN {8008BA02F3}>) [fast-method]
151: ((:METHOD ASDF/OPERATE:OPERATE (ASDF/OPERATION:OPERATION ASDF/COMPONENT:COMPONENT)) #<ASDF/LISP-ACTION:LOAD-OP > #<ASDF/SYSTEM:SYSTEM \"arcdocdb/tests\"> :PLAN-CLASS NIL :PLAN-OPTIONS NIL) [fast-method]
152: ((SB-PCL::EMF ASDF/OPERATE:OPERATE) #<unused argument> #<unused argument> #<ASDF/LISP-ACTION:LOAD-OP > #<ASDF/SYSTEM:SYSTEM \"arcdocdb/tests\">)
153: ((LAMBDA NIL :IN ASDF/OPERATE:OPERATE))
154: ((:METHOD ASDF/OPERATE:OPERATE :AROUND (T T)) #<ASDF/LISP-ACTION:LOAD-OP > #<ASDF/SYSTEM:SYSTEM \"arcdocdb/tests\">) [fast-method]
155: ((SB-PCL::EMF ASDF/OPERATE:OPERATE) #<unused argument> #<unused argument> ASDF/LISP-ACTION:LOAD-OP \"arcdocdb/tests\")
156: ((LAMBDA NIL :IN ASDF/OPERATE:OPERATE))
157: ((:METHOD ASDF/OPERATE:OPERATE :AROUND (T T)) ASDF/LISP-ACTION:LOAD-OP \"arcdocdb/tests\") [fast-method]
158: (ASDF/SESSION:CALL-WITH-ASDF-SESSION #<FUNCTION (LAMBDA NIL :IN ASDF/OPERATE:OPERATE) {8008BA017B}> :OVERRIDE T :KEY NIL :OVERRIDE-CACHE T :OVERRIDE-FORCING NIL)
159: ((LAMBDA NIL :IN ASDF/OPERATE:OPERATE))
160: (ASDF/SESSION:CALL-WITH-ASDF-SESSION #<FUNCTION (LAMBDA NIL :IN ASDF/OPERATE:OPERATE) {8008BA00DB}> :OVERRIDE NIL :KEY NIL :OVERRIDE-CACHE NIL :OVERRIDE-FORCING NIL)
161: ((:METHOD ASDF/OPERATE:OPERATE :AROUND (T T)) ASDF/LISP-ACTION:LOAD-OP \"arcdocdb/tests\") [fast-method]
162: (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb/tests\")
163: (\"top level form\") [toplevel]
164: ((FLET \"G\" :IN SB-C::%COMPILE-IN-LEXENV))
165: (SB-C::%COMPILE-IN-LEXENV (LET ((SB-KERNEL:*HANDLER-CLUSTERS* (CONS (LIST #) . #1=(SB-KERNEL:*HANDLER-CLUSTERS*)))) (DECLARE (DYNAMIC-EXTENT . #1#)) (PROGN (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb/tests\"))) #<NULL-LEXENV> NIL #<SB-C::SOURCE-INFO {8008690423}> 3 NIL T T)
166: (SB-C:EVAL-WITH-COMPILE-IN-LEXENV (LET ((SB-KERNEL:*HANDLER-CLUSTERS* (CONS (LIST #) . #1=(SB-KERNEL:*HANDLER-CLUSTERS*)))) (DECLARE (DYNAMIC-EXTENT . #1#)) (PROGN (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb/tests\"))) #<NULL-LEXENV> #<SB-C::SOURCE-INFO {8008690423}> 3 NIL)
167: (SB-IMPL::%SIMPLE-EVAL (LET ((SB-KERNEL:*HANDLER-CLUSTERS* (CONS (LIST #) . #1=(SB-KERNEL:*HANDLER-CLUSTERS*)))) (DECLARE (DYNAMIC-EXTENT . #1#)) (PROGN (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb/tests\"))) #<NULL-LEXENV>)
168: (SB-INT:SIMPLE-EVAL-IN-LEXENV (HANDLER-BIND ((WARNING (LAMBDA (CONDITION) (UNLESS # #)))) (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb/tests\")) #<NULL-LEXENV>)
169: (SB-EXT:EVAL-TLF (HANDLER-BIND ((WARNING (LAMBDA (CONDITION) (UNLESS # #)))) (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb/tests\")) 3 NIL)
170: ((LABELS SB-FASL::EVAL-FORM :IN SB-INT:LOAD-AS-SOURCE) (HANDLER-BIND ((WARNING (LAMBDA (CONDITION) (UNLESS # #)))) (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb/tests\")) 3)
171: ((LAMBDA (SB-KERNEL:FORM &KEY :CURRENT-INDEX &ALLOW-OTHER-KEYS) :IN SB-INT:LOAD-AS-SOURCE) (HANDLER-BIND ((WARNING (LAMBDA (CONDITION) (UNLESS # #)))) (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb/tests\")) :CURRENT-INDEX 3)
172: (SB-C::%DO-FORMS-FROM-INFO #<FUNCTION (LAMBDA (SB-KERNEL:FORM &KEY :CURRENT-INDEX &ALLOW-OTHER-KEYS) :IN SB-INT:LOAD-AS-SOURCE) {107690F1B}> #<SB-C::SOURCE-INFO {8008690423}> SB-C::INPUT-ERROR-IN-LOAD)
173: (SB-INT:LOAD-AS-SOURCE #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/scoped.lisp\" {8008690043}> :VERBOSE NIL :PRINT NIL :CONTEXT \"loading\")
174: ((LABELS SB-FASL::LOAD-STREAM-1 :IN LOAD) #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/scoped.lisp\" {8008690043}> NIL)
175: (SB-FASL::CALL-WITH-LOAD-BINDINGS #<FUNCTION (LABELS SB-FASL::LOAD-STREAM-1 :IN LOAD) {1076909EB}> #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/scoped.lisp\" {8008690043}> NIL #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/scoped.lisp\" {8008690043}>)
176: ((LABELS SB-FASL::LOAD-STREAM :IN LOAD) #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/scoped.lisp\" {8008690043}> NIL)
177: (LOAD #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/scoped.lisp\" {8008690043}> :VERBOSE NIL :PRINT NIL :IF-DOES-NOT-EXIST :ERROR :EXTERNAL-FORMAT :DEFAULT)
178: ((FLET SB-IMPL::LOAD-SCRIPT :IN SB-IMPL::PROCESS-SCRIPT) #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/scoped.lisp\" {8008690043}>)
179: ((FLET SB-UNIX::BODY :IN SB-IMPL::PROCESS-SCRIPT))
180: ((FLET \"WITHOUT-INTERRUPTS-BODY-\" :IN SB-IMPL::PROCESS-SCRIPT))
181: (SB-IMPL::PROCESS-SCRIPT \"spikes/out/pool-dispatch-tests/scoped.lisp\")
182: (SB-IMPL::TOPLEVEL-INIT)
183: ((FLET SB-UNIX::BODY :IN SB-IMPL::START-LISP))
184: ((FLET \"WITHOUT-INTERRUPTS-BODY-3\" :IN SB-IMPL::START-LISP))
185: (SB-IMPL::%START-LISP)

unhandled condition in --disable-debugger mode, quitting
; 
; compilation unit aborted
;   caught 2 fatal ERROR conditions
")
  (:PATH
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/attempt-03.log")
   :BYTES 9758 :SHA256 "63afa871746d0f94dd95095b7ca4f089c36cfe5176d420d2185e3f2c11dbc06d" :GIT-BLOB
   "15abd41d1c1faf7102b0fb1519a06af52ceb4137" :TEXT
   "ok    TEST-REQ-AFF-008-POOL-DISPATCH-FACTORY-TYPE-AND-CONTEXT-BINDING-REFUSE-WITHOUT-EFFECTS
ok    TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION
ok    TEST-REQ-CON-005-POOL-DISPATCH-FOREIGN-OWNER-PRECEDES-TABLE-PHASE-AND-POOL-CHECKS
ok    TEST-REQ-CON-005-POOL-DISPATCH-INACTIVE-EMPTY-BUSY-NEVER-ENTER-ROUTING
ok    TEST-REQ-CON-002-POOL-DISPATCH-ROUTES-TWO-REAL-WRITERS-WITHOUT-IMPLICIT-BEGIN
ok    TEST-REQ-CON-002-POOL-DISPATCH-EXISTING-CLAIMED-ROUTES-WITHOUT-READING-CORRUPT-POOL-WORDS
ok    TEST-REQ-CON-002-POOL-DISPATCH-PENDING-RETIRE-DRAINS-EXISTING-CLAIMED-BEFORE-ACK
ok    TEST-REQ-CON-002-POOL-DISPATCH-FULL-RECYCLE-ROUTES-NEW-CLAIMED-WHILE-RETIRE-PENDING
Unhandled SIMPLE-ERROR in thread #<SB-THREAD:THREAD tid=259 \"main thread\" RUNNING
                                    {80061A03C3}>:
  Asserzione fallita: (TYPEP CONDITION TYPE)

Backtrace for: #<SB-THREAD:THREAD tid=259 \"main thread\" RUNNING {80061A03C3}>
0: (SB-DEBUG::DEBUGGER-DISABLED-HOOK #<SIMPLE-ERROR \"Asserzione fallita: ~S\" {800A777EB3}> #<unused argument> :QUIT T)
1: (SB-DEBUG::RUN-HOOK *INVOKE-DEBUGGER-HOOK* #<SIMPLE-ERROR \"Asserzione fallita: ~S\" {800A777EB3}>)
2: (INVOKE-DEBUGGER #<SIMPLE-ERROR \"Asserzione fallita: ~S\" {800A777EB3}>)
3: (ERROR \"Asserzione fallita: ~S\" (TYPEP CONDITION TYPE))
4: (ARCDOCDB.EXECUTION.TESTS::WORKER-CAPTURE-CONDITION #<FUNCTION (LAMBDA NIL :IN ARCDOCDB.SCHEDULER.TESTS::TEST-REQ-CON-004-POOL-DISPATCH-ALL-DISALLOWED-PHASES-PRESERVE-FIRST-FAULT-AND-DEBTS) {800A777DEB}> ARCDOCDB.CONDITIONS:RESOURCE-EXHAUSTED :WORKER-STATE)
5: (ARCDOCDB.SCHEDULER.TESTS::POOL-DISPATCH-REFUSAL #S(ARCDOCDB.SCHEDULER:PORTA-WORKER-POOL :OWNER #1=#<SB-THREAD:THREAD tid=259 \"main thread\" RUNNING {80061A03C3}> :COORDINATOR #1# :CONTEXT #S(ARCDOCDB.EXECUTION:CONTESTO-WORKER-WRITER :READY #S(ARCDOCDB.EXECUTION:LISTA-WRITER-PRONTI :PARTITIONS #(#S(ARCDOCDB.EXECUTION::PARTIZIONE-PRONTA :SLOTS # :CAPACITY 1 :HEAD 0 :TAIL 0 :COUNT 0 :GUARD NIL))) :OWNER #1# :CURSOR 0 :HOME 0 :WRITER #S(ARCDOCDB.EXECUTION:WRITER-PROGRAMMABILE :QUEUE #S(ARCDOCDB.EXECUTION:CODA-WRITER :SLOTS #(:A1 :A2 NIL NIL) :CAPACITY 4 :QUANTUM 1 :HEAD 0 :TAIL 2 :COUNT 2 :GUARD NIL :OWNER NIL :GENERATION 0 :EXTRACTED 0) :STATE :READY :ROUTING-INDEX 0) :LEASE 7 :PENDING 2 :BATCH-GENERATION 9 :FAULT #<ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION {800A777E83}> :STATE :FAULTED) :REQUEST 0 :ACK 0 :BOUND NIL) #S(ARCDOCDB.EXECUTION.SERIES:TABELLA-WORKER-SERIE :CONTEXT #1=#S(ARCDOCDB.EXECUTION:CONTESTO-WORKER-WRITER :READY #S(ARCDOCDB.EXECUTION:LISTA-WRITER-PRONTI :PARTITIONS #(#S(ARCDOCDB.EXECUTION::PARTIZIONE-PRONTA :SLOTS # :CAPACITY 1 :HEAD 0 :TAIL 0 :COUNT 0 :GUARD NIL))) :OWNER #<SB-THREAD:THREAD tid=259 \"main thread\" RUNNING {80061A03C3}> :CURSOR 0 :HOME 0 :WRITER #2=#S(ARCDOCDB.EXECUTION:WRITER-PROGRAMMABILE :QUEUE #S(ARCDOCDB.EXECUTION:CODA-WRITER :SLOTS #(:A1 :A2 NIL NIL) :CAPACITY 4 :QUANTUM 1 :HEAD 0 :TAIL 2 :COUNT 2 :GUARD NIL :OWNER NIL :GENERATION 0 :EXTRACTED 0) :STATE :READY :ROUTING-INDEX 0) :LEASE 7 :PENDING 2 :BATCH-GENERATION 9 :FAULT #<ARCDOCDB.CONDITIONS:INVARIANT-VIOLATION {800A777E83}> :STATE :FAULTED) :REGISTRY #S(ARCDOCDB.EXECUTION.SERIES:REGISTRO-WORKER-SERIE :WRITERS #(#2# #3=#S(ARCDOCDB.EXECUTION:WRITER-PROGRAMMABILE :QUEUE #S(ARCDOCDB.EXECUTION:CODA-WRITER :SLOTS # :CAPACITY 4 :QUANTUM 1 :HEAD 0 :TAIL 1 :COUNT 1 :GUARD NIL :OWNER NIL :GENERATION 0 :EXTRACTED 0) :STATE :READY :ROUTING-INDEX 1)) :CONTROLLERS #(#4=#S(ARCDOCDB.SERIES:CONTROLLORE-SERIE :REGISTRY #S(ARCDOCDB.CSN:REGISTRO-CSN :CAPACITY 4 :HIGHS # :LOWS # :MUTEX #<SB-THREAD:MUTEX #5=\"ArcDocDB CSN\" free owner=0> :USED 0 :CURSOR 0 :LAST-HIGH 0 :LAST-LOW 0 :HORIZON-HIGH 0 :HORIZON-LOW 0) :LOG #S(ARCDOCDB.WAL:LOG-IO :FILE # :KIND :SEGMENT :FILE-ID 81 :VERSION 2 :STATE :OPEN :ACTIVE NIL) :SLOTS #(# #) :ROOT NIL :PLANNED-ROOT NIL :NEXT-OFFSET 0 :OWNER NIL :LEASE-GENERATION 0 :EVENT-GENERATION 0 :LAST-HIGH 0 :LAST-LOW 0 :HEAD 0 ...) #6=#S(ARCDOCDB.SERIES:CONTROLLORE-SERIE :REGISTRY #S(ARCDOCDB.CSN:REGISTRO-CSN :CAPACITY 4 :HIGHS # :LOWS # :MUTEX #<SB-THREAD:MUTEX #5# free owner=0> :USED 0 :CURSOR 0 :LAST-HIGH 0 :LAST-LOW 0 :HORIZON-HIGH 0 :HORIZON-LOW 0) :LOG #S(ARCDOCDB.WAL:LOG-IO :FILE # :KIND :SEGMENT :FILE-ID 82 :VERSION 2 :STATE :OPEN :ACTIVE NIL) :SLOTS #(# #) :ROOT NIL :PLANNED-ROOT NIL :NEXT-OFFSET 0 :OWNER NIL :LEASE-GENERATION 0 :EVENT-GENERATION 0 :LAST-HIGH 0 :LAST-LOW 0 :HEAD 0 ...))) :LINKS #(#S(ARCDOCDB.EXECUTION.SERIES:COLLEGAMENTO-WORKER-SERIE :CONTEXT #1# :WRITER #2# :CONTROLLER #4# :GENERATION 0 :WRITER-LEASE 0 :SERIES-LEASE 0 :STATE :IDLE :FAULT NIL) #S(ARCDOCDB.EXECUTION.SERIES:COLLEGAMENTO-WORKER-SERIE :CONTEXT #1# :WRITER #3# :CONTROLLER #6# :GENERATION 0 :WRITER-LEASE 0 :SERIES-LEASE 0 :STATE :IDLE :FAULT NIL))) #(#S(ARCDOCDB.EXECUTION:WRITER-PROGRAMMABILE :QUEUE #S(ARCDOCDB.EXECUTION:CODA-WRITER :SLOTS #(:A1 :A2 NIL NIL) :CAPACITY 4 :QUANTUM 1 :HEAD 0 :TAIL 2 :COUNT 2 :GUARD NIL :OWNER NIL :GENERATION 0 :EXTRACTED 0) :STATE :READY :ROUTING-INDEX 0) #S(ARCDOCDB.EXECUTION:WRITER-PROGRAMMABILE :QUEUE #S(ARCDOCDB.EXECUTION:CODA-WRITER :SLOTS #(:B1 NIL NIL NIL) :CAPACITY 4 :QUANTUM 1 :HEAD 0 :TAIL 1 :COUNT 1 :GUARD NIL :OWNER NIL :GENERATION 0 :EXTRACTED 0) :STATE :READY :ROUTING-INDEX 1)) #<FUNCTION (LAMBDA NIL :IN ARCDOCDB.SCHEDULER.TESTS::TEST-REQ-CON-004-POOL-DISPATCH-ALL-DISALLOWED-PHASES-PRESERVE-FIRST-FAULT-AND-DEBTS) {800A777DEB}> ARCDOCDB.CONDITIONS:RESOURCE-EXHAUSTED :WORKER-STATE)
6: (ARCDOCDB.SCHEDULER.TESTS::TEST-REQ-CON-004-POOL-DISPATCH-ALL-DISALLOWED-PHASES-PRESERVE-FIRST-FAULT-AND-DEBTS)
7: (\"top level form\") [toplevel]
8: ((FLET \"G\" :IN SB-C::%COMPILE-IN-LEXENV))
9: (SB-C::%COMPILE-IN-LEXENV (LET ((TESTS (REMOVE-IF-NOT (LAMBDA # #) ARCDOCDB.SCHEDULER.TESTS::*TESTS*))) (DOLIST (NAME (REVERSE TESTS)) (FUNCALL NAME) (FORMAT T \"ok    ~A~%\" NAME)) (FORMAT T \"~D test scoped dispatcher superati.~%\" (LENGTH TESTS))) #<NULL-LEXENV> NIL #<SB-C::SOURCE-INFO {80052C0423}> 4 NIL T T)
10: (SB-C:EVAL-WITH-COMPILE-IN-LEXENV (LET ((TESTS (REMOVE-IF-NOT (LAMBDA # #) ARCDOCDB.SCHEDULER.TESTS::*TESTS*))) (DOLIST (NAME (REVERSE TESTS)) (FUNCALL NAME) (FORMAT T \"ok    ~A~%\" NAME)) (FORMAT T \"~D test scoped dispatcher superati.~%\" (LENGTH TESTS))) #<NULL-LEXENV> #<SB-C::SOURCE-INFO {80052C0423}> 4 NIL)
11: (SB-IMPL::%SIMPLE-EVAL (LET ((TESTS (REMOVE-IF-NOT (LAMBDA # #) ARCDOCDB.SCHEDULER.TESTS::*TESTS*))) (DOLIST (NAME (REVERSE TESTS)) (FUNCALL NAME) (FORMAT T \"ok    ~A~%\" NAME)) (FORMAT T \"~D test scoped dispatcher superati.~%\" (LENGTH TESTS))) #<NULL-LEXENV>)
12: (SB-INT:SIMPLE-EVAL-IN-LEXENV (LET ((TESTS (REMOVE-IF-NOT (LAMBDA # #) ARCDOCDB.SCHEDULER.TESTS::*TESTS*))) (DOLIST (NAME (REVERSE TESTS)) (FUNCALL NAME) (FORMAT T \"ok    ~A~%\" NAME)) (FORMAT T \"~D test scoped dispatcher superati.~%\" (LENGTH TESTS))) #<NULL-LEXENV>)
13: (EVAL-TLF (LET ((TESTS (REMOVE-IF-NOT (LAMBDA # #) ARCDOCDB.SCHEDULER.TESTS::*TESTS*))) (DOLIST (NAME (REVERSE TESTS)) (FUNCALL NAME) (FORMAT T \"ok    ~A~%\" NAME)) (FORMAT T \"~D test scoped dispatcher superati.~%\" (LENGTH TESTS))) 4 NIL)
14: ((LABELS SB-FASL::EVAL-FORM :IN SB-INT:LOAD-AS-SOURCE) (LET ((TESTS (REMOVE-IF-NOT (LAMBDA # #) ARCDOCDB.SCHEDULER.TESTS::*TESTS*))) (DOLIST (NAME (REVERSE TESTS)) (FUNCALL NAME) (FORMAT T \"ok    ~A~%\" NAME)) (FORMAT T \"~D test scoped dispatcher superati.~%\" (LENGTH TESTS))) 4)
15: ((LAMBDA (SB-KERNEL:FORM &KEY :CURRENT-INDEX &ALLOW-OTHER-KEYS) :IN SB-INT:LOAD-AS-SOURCE) (LET ((TESTS (REMOVE-IF-NOT (LAMBDA # #) ARCDOCDB.SCHEDULER.TESTS::*TESTS*))) (DOLIST (NAME (REVERSE TESTS)) (FUNCALL NAME) (FORMAT T \"ok    ~A~%\" NAME)) (FORMAT T \"~D test scoped dispatcher superati.~%\" (LENGTH TESTS))) :CURRENT-INDEX 4)
16: (SB-C::%DO-FORMS-FROM-INFO #<FUNCTION (LAMBDA (SB-KERNEL:FORM &KEY :CURRENT-INDEX &ALLOW-OTHER-KEYS) :IN SB-INT:LOAD-AS-SOURCE) {107440F1B}> #<SB-C::SOURCE-INFO {80052C0423}> SB-C::INPUT-ERROR-IN-LOAD)
17: (SB-INT:LOAD-AS-SOURCE #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/scoped.lisp\" {80052C0043}> :VERBOSE NIL :PRINT NIL :CONTEXT \"loading\")
18: ((LABELS SB-FASL::LOAD-STREAM-1 :IN LOAD) #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/scoped.lisp\" {80052C0043}> NIL)
19: (SB-FASL::CALL-WITH-LOAD-BINDINGS #<FUNCTION (LABELS SB-FASL::LOAD-STREAM-1 :IN LOAD) {1074409EB}> #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/scoped.lisp\" {80052C0043}> NIL #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/scoped.lisp\" {80052C0043}>)
20: ((LABELS SB-FASL::LOAD-STREAM :IN LOAD) #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/scoped.lisp\" {80052C0043}> NIL)
21: (LOAD #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/scoped.lisp\" {80052C0043}> :VERBOSE NIL :PRINT NIL :IF-DOES-NOT-EXIST :ERROR :EXTERNAL-FORMAT :DEFAULT)
22: ((FLET SB-IMPL::LOAD-SCRIPT :IN SB-IMPL::PROCESS-SCRIPT) #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/scoped.lisp\" {80052C0043}>)
23: ((FLET SB-UNIX::BODY :IN SB-IMPL::PROCESS-SCRIPT))
24: ((FLET \"WITHOUT-INTERRUPTS-BODY-\" :IN SB-IMPL::PROCESS-SCRIPT))
25: (SB-IMPL::PROCESS-SCRIPT \"spikes/out/pool-dispatch-tests/scoped.lisp\")
26: (SB-IMPL::TOPLEVEL-INIT)
27: ((FLET SB-UNIX::BODY :IN SB-IMPL::START-LISP))
28: ((FLET \"WITHOUT-INTERRUPTS-BODY-3\" :IN SB-IMPL::START-LISP))
29: (SB-IMPL::%START-LISP)

unhandled condition in --disable-debugger mode, quitting
")
  (:PATH
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/attempt-04.log")
   :BYTES 1199 :SHA256 "9a7471b2383703874055d4b2128ed99efe2a4fce3ac8a61c4360fcd719168da9" :GIT-BLOB
   "ffc4899c0e0000008af59f5d92f5515b7345d58f" :TEXT
   "ok    TEST-REQ-AFF-008-POOL-DISPATCH-FACTORY-TYPE-AND-CONTEXT-BINDING-REFUSE-WITHOUT-EFFECTS
ok    TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION
ok    TEST-REQ-CON-005-POOL-DISPATCH-FOREIGN-OWNER-PRECEDES-TABLE-PHASE-AND-POOL-CHECKS
ok    TEST-REQ-CON-005-POOL-DISPATCH-INACTIVE-EMPTY-BUSY-NEVER-ENTER-ROUTING
ok    TEST-REQ-CON-002-POOL-DISPATCH-ROUTES-TWO-REAL-WRITERS-WITHOUT-IMPLICIT-BEGIN
ok    TEST-REQ-CON-002-POOL-DISPATCH-EXISTING-CLAIMED-ROUTES-WITHOUT-READING-CORRUPT-POOL-WORDS
ok    TEST-REQ-CON-002-POOL-DISPATCH-PENDING-RETIRE-DRAINS-EXISTING-CLAIMED-BEFORE-ACK
ok    TEST-REQ-CON-002-POOL-DISPATCH-FULL-RECYCLE-ROUTES-NEW-CLAIMED-WHILE-RETIRE-PENDING
ok    TEST-REQ-CON-004-POOL-DISPATCH-ALL-DISALLOWED-PHASES-PRESERVE-FIRST-FAULT-AND-DEBTS
ok    TEST-REQ-AFF-008-POOL-DISPATCH-ROUTING-FAULT-RETAINS-ACTIVATION-ACK-AND-ACQUIRED-OBLIGATION
ok    TEST-REQ-AFF-008-POOL-DISPATCH-CORRUPT-TABLE-BINDING-REFUSES-BEFORE-CLAIM-OR-ROUTING
ok    TEST-REQ-AFF-008-POOL-DISPATCH-CORRUPT-LINK-FAULTS-AFTER-CLAIM-WITHOUT-BEGIN-OR-ROLLBACK
ok    TEST-REQ-AFF-008-POOL-DISPATCH-CONTRADICTORY-GATE-OUTPUT-REFUSES-BEFORE-ROUTING
13 test scoped dispatcher superati.
")
  (:PATH
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/attempt-05.log")
   :BYTES 1287 :SHA256 "59a111ea44b0ee73839766b0579b57f5534bf770517721fa38b5da9740116c58" :GIT-BLOB
   "5b0536dbbad72face15bdd0c262d5c6155a57ae0" :TEXT
   "ok    TEST-REQ-AFF-008-POOL-DISPATCH-FACTORY-TYPE-AND-CONTEXT-BINDING-REFUSE-WITHOUT-EFFECTS
ok    TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION
ok    TEST-REQ-CON-005-POOL-DISPATCH-FOREIGN-OWNER-PRECEDES-TABLE-PHASE-AND-POOL-CHECKS
ok    TEST-REQ-CON-005-POOL-DISPATCH-INACTIVE-EMPTY-BUSY-NEVER-ENTER-ROUTING
ok    TEST-REQ-CON-002-POOL-DISPATCH-ROUTES-TWO-REAL-WRITERS-WITHOUT-IMPLICIT-BEGIN
ok    TEST-REQ-CON-002-POOL-DISPATCH-EXISTING-CLAIMED-ROUTES-WITHOUT-READING-CORRUPT-POOL-WORDS
ok    TEST-REQ-CON-002-POOL-DISPATCH-PENDING-RETIRE-DRAINS-EXISTING-CLAIMED-BEFORE-ACK
ok    TEST-REQ-CON-002-POOL-DISPATCH-FULL-RECYCLE-ROUTES-NEW-CLAIMED-WHILE-RETIRE-PENDING
ok    TEST-REQ-CON-004-POOL-DISPATCH-ALL-DISALLOWED-PHASES-PRESERVE-FIRST-FAULT-AND-DEBTS
ok    TEST-REQ-AFF-008-POOL-DISPATCH-ROUTING-FAULT-RETAINS-ACTIVATION-ACK-AND-ACQUIRED-OBLIGATION
ok    TEST-REQ-AFF-008-POOL-DISPATCH-CORRUPT-TABLE-BINDING-REFUSES-BEFORE-CLAIM-OR-ROUTING
ok    TEST-REQ-AFF-008-POOL-DISPATCH-CORRUPT-LINK-FAULTS-AFTER-CLAIM-WITHOUT-BEGIN-OR-ROLLBACK
ok    TEST-REQ-AFF-008-POOL-DISPATCH-CONTRADICTORY-GATE-OUTPUT-REFUSES-BEFORE-ROUTING
ok    TEST-REQ-CON-002-POOL-DISPATCH-WRITER-BUSY-BEGIN-KEEPS-CLAIMED-FOR-EXPLICIT-RETRY
14 test scoped dispatcher superati.
")
  (:PATH
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/scheduler-attempt-01.log")
   :BYTES 5322 :SHA256 "cc2097fd53227b96fb62621cf47020c4bf4e4369ba87baa2bc508b5aae5ee480" :GIT-BLOB
   "fe1eb8c0258f11faabf90acce0659f3fb9caff7c" :TEXT
   "ok    TEST-REQ-THR-001-POOL-CONSTRUCTION-DEFAULTS-AND-VALID-BOUNDS
ok    TEST-REQ-AFF-008-POOL-PRIVATE-CONSTRUCTION-DEFAULTS-AND-EXPLICIT-STATE
ok    TEST-REQ-AFF-008-POOL-GENERATED-EQUALITY-COMPARES-EACH-BOUNDED-SIGNAL
ok    TEST-REQ-AFF-008-POOL-DECLARED-INTEGER-DOMAINS-AND-DIRECTION-MEMBERS
ok    TEST-REQ-AFF-008-POOL-INVALID-CONFIGURATION-HAS-TYPED-REASONS
ok    TEST-REQ-THR-001-POOL-FIRST-SAMPLE-SEEDS-EXACT-FIXED-POINT-SIGNALS
ok    TEST-REQ-AFF-013-POOL-EWMA-INDEPENDENT-ORACLE-AND-NEGATIVE-ROUNDING
ok    TEST-REQ-AFF-008-POOL-INVALID-SAMPLES-PRESERVE-ENTIRE-PUBLIC-STATE
ok    TEST-REQ-AFF-008-POOL-SAMPLE-UPPER-BOUNDS-AND-CLOCK-EXHAUSTION
ok    TEST-REQ-THR-001-POOL-ADDITIVE-GROWTH-NEEDS-COMPLETE-DWELL
ok    TEST-REQ-THR-001-POOL-MULTIPLICATIVE-DECREASE-FLOORS-AND-CLAMPS
ok    TEST-REQ-THR-001-POOL-HYSTERESIS-THRESHOLDS-ARE-INCLUSIVE-AS-SPECIFIED
ok    TEST-REQ-THR-001-POOL-CONFIGURABLE-QUEUE-THRESHOLD-AND-CUSTOM-PERIOD
ok    TEST-REQ-THR-001-POOL-BOUNDS-DO-NOT-EMIT-ZERO-CHANGE-COMMANDS
ok    TEST-REQ-THR-001-POOL-HOLD-REGION-BREAKS-CONTINUOUS-DWELL
ok    TEST-REQ-THR-001-POOL-DIRECTION-CHANGE-RESTARTS-DWELL
ok    TEST-REQ-THR-001-POOL-LONG-GAP-RESETS-EWMA-AND-DWELL
ok    TEST-REQ-THR-001-POOL-GAP-EXACTLY-TWO-PERIODS-KEEPS-EXISTING-DWELL
ok    TEST-REQ-THR-001-POOL-PENDING-TARGET-IS-RETAINED-AND-SENSORS-ADVANCE
ok    TEST-REQ-THR-001-POOL-FIRST-PENDING-SAMPLE-AND-COMPLETED-COMMAND-DWELL
ok    TEST-REQ-CON-005-POOL-CROSS-THREAD-ACCESS-REJECTED-WITHOUT-OWNER-MUTATION
ok    TEST-REQ-AFF-008-POOL-PRIVATE-BOUND-AND-CLOCK-FAULTS-ARE-DETECTED
ok    TEST-REQ-CON-005-POOL-INDEPENDENT-CONTROLLERS-HAVE-DETERMINISTIC-PARALLEL-TRACES
ok    TEST-REQ-CON-005-POOL-PORT-OWNER-AND-REGISTRY-COORDINATOR-ARE-DISTINCT
ok    TEST-REQ-THR-001-POOL-ACTIVATION-RETIREMENT-AWAIT-REAL-WORKER-ACKS
ok    TEST-REQ-AFF-008-POOL-REGISTRY-COPIES-CALLER-VECTOR-AND-BINDS-ONCE
ok    TEST-REQ-AFF-008-POOL-REGISTRY-INVALID-SHAPE-DOES-NOT-BIND-ANY-PORT
ok    TEST-REQ-CON-001-POOL-RETIREMENT-PRESERVES-CLAIM-LEASE-BATCH-AND-FINISHING
ok    TEST-REQ-CON-002-POOL-RESCHEDULE-OBLIGATION-BLOCKS-RETIREMENT-UNTIL-TRANSFER
ok    TEST-REQ-CON-004-POOL-FAULTED-WORKER-RETAINS-COMMAND-REFERENCE-AND-DIAGNOSTIC
ok    TEST-REQ-AFF-008-POOL-PORT-STARTUP-VALIDATES-FLAGS-COORDINATOR-AND-IDLE-DEBTS
ok    TEST-REQ-AFF-008-POOL-STARTUP-REJECTS-COORDINATOR-AND-REUSED-WORKER-OWNER
ok    TEST-REQ-AFF-008-POOL-STARTUP-REJECTS-NONZERO-OR-PENDING-GENERATION-BEFORE-BINDING
ok    TEST-REQ-AFF-008-POOL-INVALID-SAMPLES-DO-NOT-MUTATE-CONTROLLER-OR-PORTS
ok    TEST-REQ-AFF-008-POOL-GENERATION-EXHAUSTION-PRECEDES-EVERY-CONTROLLER-AND-PORT-WRITE
ok    TEST-REQ-AFF-008-POOL-WORD-PROTOCOL-FAULTS-REFUSE-READER-COORDINATOR-AND-WORKER
ok    TEST-REQ-AFF-008-POOL-IDLE-DEBT-REFUSES-ACK-WITHOUT-POISONING-OR-RESET
ok    TEST-REQ-AFF-008-POOL-PRIVATE-REGISTRY-TARGET-CAPACITY-PREFIX-AND-COUNT-INVARIANTS
ok    TEST-REQ-AFF-008-POOL-CAS-CONFLICT-CANNOT-REPORT-REQUEST-OR-ACK-SUCCESS
ok    TEST-REQ-AFF-008-POOL-GENERATED-PORT-EQUALITY-COMPARES-REQUEST-ACK-AND-BINDING
ok    TEST-REQ-CON-005-POOL-TWO-RETIREMENT-ACKS-CAN-ARRIVE-WITH-A-PREFIX-HOLE
ok    TEST-REQ-CON-005-POOL-INACTIVE-CLAIM-KEEPS-REAL-READY-OBLIGATION-AND-CURSOR
ok    TEST-REQ-THR-001-POOL-REAL-GROW-ACKNOWLEDGES-BEFORE-TAKING-READY-WRITER
ok    TEST-REQ-THR-001-POOL-REAL-SHRINK-RETIRES-BEFORE-REMOVING-READY-WRITER
ok    TEST-REQ-CON-005-POOL-FOREIGN-OWNER-REJECTION-PRECEDES-PHASE-AND-WORD-CHECKS
ok    TEST-REQ-CON-004-POOL-EVERY-NONIDLE-PHASE-REFUSES-BEFORE-INACTIVE-OR-DEBT-VALIDATION
ok    TEST-REQ-AFF-008-POOL-IDLE-INCONSISTENCY-REFUSES-RETIREMENT-ACK-AND-C1-POISONING
ok    TEST-REQ-AFF-008-POOL-CORRUPT-WORD-PROTOCOL-PRESERVES-READY-AND-LOCAL-WORKER
ok    TEST-REQ-AFF-008-POOL-RETIREMENT-ACK-CAS-CONFLICT-CANNOT-TAKE-A-READY-WRITER
ok    TEST-REQ-CON-005-POOL-ACTIVE-EMPTY-AND-BUSY-PRESERVE-C1-CURSOR-ROTATION
ok    TEST-REQ-THR-001-POOL-RETIRE-AFTER-ACTIVE-SAMPLE-PERMITS-ONE-LAST-COMPLETE-TASK
ok    TEST-REQ-CON-002-POOL-PENDING-RETIRE-WAITS-FOR-BRIDGE-BATCH-AND-EXPLICIT-HANDOFF
ok    TEST-REQ-CON-002-POOL-FULL-RECYCLE-KEEPS-CLAIMED-AND-ROUTES-NEW-WRITER-BEFORE-RETIRE
ok    TEST-REQ-AFF-008-POOL-DISPATCH-FACTORY-TYPE-AND-CONTEXT-BINDING-REFUSE-WITHOUT-EFFECTS
ok    TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION
ok    TEST-REQ-CON-005-POOL-DISPATCH-FOREIGN-OWNER-PRECEDES-TABLE-PHASE-AND-POOL-CHECKS
ok    TEST-REQ-CON-005-POOL-DISPATCH-INACTIVE-EMPTY-BUSY-NEVER-ENTER-ROUTING
ok    TEST-REQ-CON-002-POOL-DISPATCH-ROUTES-TWO-REAL-WRITERS-WITHOUT-IMPLICIT-BEGIN
ok    TEST-REQ-CON-002-POOL-DISPATCH-EXISTING-CLAIMED-ROUTES-WITHOUT-READING-CORRUPT-POOL-WORDS
ok    TEST-REQ-CON-002-POOL-DISPATCH-PENDING-RETIRE-DRAINS-EXISTING-CLAIMED-BEFORE-ACK
ok    TEST-REQ-CON-002-POOL-DISPATCH-FULL-RECYCLE-ROUTES-NEW-CLAIMED-WHILE-RETIRE-PENDING
ok    TEST-REQ-CON-004-POOL-DISPATCH-ALL-DISALLOWED-PHASES-PRESERVE-FIRST-FAULT-AND-DEBTS
ok    TEST-REQ-AFF-008-POOL-DISPATCH-ROUTING-FAULT-RETAINS-ACTIVATION-ACK-AND-ACQUIRED-OBLIGATION
ok    TEST-REQ-AFF-008-POOL-DISPATCH-CORRUPT-TABLE-BINDING-REFUSES-BEFORE-CLAIM-OR-ROUTING
ok    TEST-REQ-AFF-008-POOL-DISPATCH-CORRUPT-LINK-FAULTS-AFTER-CLAIM-WITHOUT-BEGIN-OR-ROLLBACK
ok    TEST-REQ-AFF-008-POOL-DISPATCH-CONTRADICTORY-GATE-OUTPUT-REFUSES-BEFORE-ROUTING
66 test del controllore pool superati.
")
  (:PATH
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/scheduler-attempt-02.log")
   :BYTES 5410 :SHA256 "b39e7a23fb34611778c003b24a2ab6f4e32b8e8b43a8f1645d9ea524c8e0a1e3" :GIT-BLOB
   "db0c7f4146de6ff27d4b904cdcdf4e2ebea32fa8" :TEXT
   "ok    TEST-REQ-THR-001-POOL-CONSTRUCTION-DEFAULTS-AND-VALID-BOUNDS
ok    TEST-REQ-AFF-008-POOL-PRIVATE-CONSTRUCTION-DEFAULTS-AND-EXPLICIT-STATE
ok    TEST-REQ-AFF-008-POOL-GENERATED-EQUALITY-COMPARES-EACH-BOUNDED-SIGNAL
ok    TEST-REQ-AFF-008-POOL-DECLARED-INTEGER-DOMAINS-AND-DIRECTION-MEMBERS
ok    TEST-REQ-AFF-008-POOL-INVALID-CONFIGURATION-HAS-TYPED-REASONS
ok    TEST-REQ-THR-001-POOL-FIRST-SAMPLE-SEEDS-EXACT-FIXED-POINT-SIGNALS
ok    TEST-REQ-AFF-013-POOL-EWMA-INDEPENDENT-ORACLE-AND-NEGATIVE-ROUNDING
ok    TEST-REQ-AFF-008-POOL-INVALID-SAMPLES-PRESERVE-ENTIRE-PUBLIC-STATE
ok    TEST-REQ-AFF-008-POOL-SAMPLE-UPPER-BOUNDS-AND-CLOCK-EXHAUSTION
ok    TEST-REQ-THR-001-POOL-ADDITIVE-GROWTH-NEEDS-COMPLETE-DWELL
ok    TEST-REQ-THR-001-POOL-MULTIPLICATIVE-DECREASE-FLOORS-AND-CLAMPS
ok    TEST-REQ-THR-001-POOL-HYSTERESIS-THRESHOLDS-ARE-INCLUSIVE-AS-SPECIFIED
ok    TEST-REQ-THR-001-POOL-CONFIGURABLE-QUEUE-THRESHOLD-AND-CUSTOM-PERIOD
ok    TEST-REQ-THR-001-POOL-BOUNDS-DO-NOT-EMIT-ZERO-CHANGE-COMMANDS
ok    TEST-REQ-THR-001-POOL-HOLD-REGION-BREAKS-CONTINUOUS-DWELL
ok    TEST-REQ-THR-001-POOL-DIRECTION-CHANGE-RESTARTS-DWELL
ok    TEST-REQ-THR-001-POOL-LONG-GAP-RESETS-EWMA-AND-DWELL
ok    TEST-REQ-THR-001-POOL-GAP-EXACTLY-TWO-PERIODS-KEEPS-EXISTING-DWELL
ok    TEST-REQ-THR-001-POOL-PENDING-TARGET-IS-RETAINED-AND-SENSORS-ADVANCE
ok    TEST-REQ-THR-001-POOL-FIRST-PENDING-SAMPLE-AND-COMPLETED-COMMAND-DWELL
ok    TEST-REQ-CON-005-POOL-CROSS-THREAD-ACCESS-REJECTED-WITHOUT-OWNER-MUTATION
ok    TEST-REQ-AFF-008-POOL-PRIVATE-BOUND-AND-CLOCK-FAULTS-ARE-DETECTED
ok    TEST-REQ-CON-005-POOL-INDEPENDENT-CONTROLLERS-HAVE-DETERMINISTIC-PARALLEL-TRACES
ok    TEST-REQ-CON-005-POOL-PORT-OWNER-AND-REGISTRY-COORDINATOR-ARE-DISTINCT
ok    TEST-REQ-THR-001-POOL-ACTIVATION-RETIREMENT-AWAIT-REAL-WORKER-ACKS
ok    TEST-REQ-AFF-008-POOL-REGISTRY-COPIES-CALLER-VECTOR-AND-BINDS-ONCE
ok    TEST-REQ-AFF-008-POOL-REGISTRY-INVALID-SHAPE-DOES-NOT-BIND-ANY-PORT
ok    TEST-REQ-CON-001-POOL-RETIREMENT-PRESERVES-CLAIM-LEASE-BATCH-AND-FINISHING
ok    TEST-REQ-CON-002-POOL-RESCHEDULE-OBLIGATION-BLOCKS-RETIREMENT-UNTIL-TRANSFER
ok    TEST-REQ-CON-004-POOL-FAULTED-WORKER-RETAINS-COMMAND-REFERENCE-AND-DIAGNOSTIC
ok    TEST-REQ-AFF-008-POOL-PORT-STARTUP-VALIDATES-FLAGS-COORDINATOR-AND-IDLE-DEBTS
ok    TEST-REQ-AFF-008-POOL-STARTUP-REJECTS-COORDINATOR-AND-REUSED-WORKER-OWNER
ok    TEST-REQ-AFF-008-POOL-STARTUP-REJECTS-NONZERO-OR-PENDING-GENERATION-BEFORE-BINDING
ok    TEST-REQ-AFF-008-POOL-INVALID-SAMPLES-DO-NOT-MUTATE-CONTROLLER-OR-PORTS
ok    TEST-REQ-AFF-008-POOL-GENERATION-EXHAUSTION-PRECEDES-EVERY-CONTROLLER-AND-PORT-WRITE
ok    TEST-REQ-AFF-008-POOL-WORD-PROTOCOL-FAULTS-REFUSE-READER-COORDINATOR-AND-WORKER
ok    TEST-REQ-AFF-008-POOL-IDLE-DEBT-REFUSES-ACK-WITHOUT-POISONING-OR-RESET
ok    TEST-REQ-AFF-008-POOL-PRIVATE-REGISTRY-TARGET-CAPACITY-PREFIX-AND-COUNT-INVARIANTS
ok    TEST-REQ-AFF-008-POOL-CAS-CONFLICT-CANNOT-REPORT-REQUEST-OR-ACK-SUCCESS
ok    TEST-REQ-AFF-008-POOL-GENERATED-PORT-EQUALITY-COMPARES-REQUEST-ACK-AND-BINDING
ok    TEST-REQ-CON-005-POOL-TWO-RETIREMENT-ACKS-CAN-ARRIVE-WITH-A-PREFIX-HOLE
ok    TEST-REQ-CON-005-POOL-INACTIVE-CLAIM-KEEPS-REAL-READY-OBLIGATION-AND-CURSOR
ok    TEST-REQ-THR-001-POOL-REAL-GROW-ACKNOWLEDGES-BEFORE-TAKING-READY-WRITER
ok    TEST-REQ-THR-001-POOL-REAL-SHRINK-RETIRES-BEFORE-REMOVING-READY-WRITER
ok    TEST-REQ-CON-005-POOL-FOREIGN-OWNER-REJECTION-PRECEDES-PHASE-AND-WORD-CHECKS
ok    TEST-REQ-CON-004-POOL-EVERY-NONIDLE-PHASE-REFUSES-BEFORE-INACTIVE-OR-DEBT-VALIDATION
ok    TEST-REQ-AFF-008-POOL-IDLE-INCONSISTENCY-REFUSES-RETIREMENT-ACK-AND-C1-POISONING
ok    TEST-REQ-AFF-008-POOL-CORRUPT-WORD-PROTOCOL-PRESERVES-READY-AND-LOCAL-WORKER
ok    TEST-REQ-AFF-008-POOL-RETIREMENT-ACK-CAS-CONFLICT-CANNOT-TAKE-A-READY-WRITER
ok    TEST-REQ-CON-005-POOL-ACTIVE-EMPTY-AND-BUSY-PRESERVE-C1-CURSOR-ROTATION
ok    TEST-REQ-THR-001-POOL-RETIRE-AFTER-ACTIVE-SAMPLE-PERMITS-ONE-LAST-COMPLETE-TASK
ok    TEST-REQ-CON-002-POOL-PENDING-RETIRE-WAITS-FOR-BRIDGE-BATCH-AND-EXPLICIT-HANDOFF
ok    TEST-REQ-CON-002-POOL-FULL-RECYCLE-KEEPS-CLAIMED-AND-ROUTES-NEW-WRITER-BEFORE-RETIRE
ok    TEST-REQ-AFF-008-POOL-DISPATCH-FACTORY-TYPE-AND-CONTEXT-BINDING-REFUSE-WITHOUT-EFFECTS
ok    TEST-REQ-CON-005-POOL-DISPATCH-FACTORY-REQUIRES-COMPLETE-IDLE-BEFORE-CONSTRUCTION
ok    TEST-REQ-CON-005-POOL-DISPATCH-FOREIGN-OWNER-PRECEDES-TABLE-PHASE-AND-POOL-CHECKS
ok    TEST-REQ-CON-005-POOL-DISPATCH-INACTIVE-EMPTY-BUSY-NEVER-ENTER-ROUTING
ok    TEST-REQ-CON-002-POOL-DISPATCH-ROUTES-TWO-REAL-WRITERS-WITHOUT-IMPLICIT-BEGIN
ok    TEST-REQ-CON-002-POOL-DISPATCH-EXISTING-CLAIMED-ROUTES-WITHOUT-READING-CORRUPT-POOL-WORDS
ok    TEST-REQ-CON-002-POOL-DISPATCH-PENDING-RETIRE-DRAINS-EXISTING-CLAIMED-BEFORE-ACK
ok    TEST-REQ-CON-002-POOL-DISPATCH-FULL-RECYCLE-ROUTES-NEW-CLAIMED-WHILE-RETIRE-PENDING
ok    TEST-REQ-CON-004-POOL-DISPATCH-ALL-DISALLOWED-PHASES-PRESERVE-FIRST-FAULT-AND-DEBTS
ok    TEST-REQ-AFF-008-POOL-DISPATCH-ROUTING-FAULT-RETAINS-ACTIVATION-ACK-AND-ACQUIRED-OBLIGATION
ok    TEST-REQ-AFF-008-POOL-DISPATCH-CORRUPT-TABLE-BINDING-REFUSES-BEFORE-CLAIM-OR-ROUTING
ok    TEST-REQ-AFF-008-POOL-DISPATCH-CORRUPT-LINK-FAULTS-AFTER-CLAIM-WITHOUT-BEGIN-OR-ROLLBACK
ok    TEST-REQ-AFF-008-POOL-DISPATCH-CONTRADICTORY-GATE-OUTPUT-REFUSES-BEFORE-ROUTING
ok    TEST-REQ-CON-002-POOL-DISPATCH-WRITER-BUSY-BEGIN-KEEPS-CLAIMED-FOR-EXPLICIT-RETRY
67 test del controllore pool superati.
")
  (:PATH
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/scheduler.lisp")
   :BYTES 653 :SHA256 "b8ca11695d56e3ee40743bc4b7b43eb3daa2a6e79642e44883c11b60529ba39a" :GIT-BLOB
   "75046937da88ea7428336c5a5a72f114dd62d646" :TEXT "(require :asdf)
(asdf:initialize-output-translations
 `(:output-translations
   (t ,(namestring (merge-pathnames \"spikes/out/pool-dispatch-tests/cache/\" (truename \"./\"))))
   :ignore-inherited-configuration))
(setf asdf:*compile-file-failure-behaviour* :error
      asdf:*compile-file-warnings-behaviour* :error)
(handler-bind ((warning (lambda (condition)
                          (unless (typep condition 'sb-kernel:redefinition-warning)
                            (error \"Avviso non ammesso: ~A\" condition)))))
  (asdf:load-asd (merge-pathnames \"arcdocdb.asd\" (truename \"./\")))
  (asdf:load-system \"arcdocdb/tests\"))
(arcdocdb.scheduler.tests:run)
")
  (:PATH
   #A((103) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/scoped.lisp")
   :BYTES 923 :SHA256 "6c591bf64de683e6178f8f797ed1ae8043d6bd8a8f3051b2f12c0a82cf244f73" :GIT-BLOB
   "7dd3934a4ace814afd8855033e0794c638456f91" :TEXT "(require :asdf)
(asdf:initialize-output-translations
 `(:output-translations
   (t ,(namestring (merge-pathnames \"spikes/out/pool-dispatch-tests/cache/\" (truename \"./\"))))
   :ignore-inherited-configuration))
(setf asdf:*compile-file-failure-behaviour* :error
      asdf:*compile-file-warnings-behaviour* :error)
(handler-bind ((warning (lambda (condition)
                          (unless (typep condition 'sb-kernel:redefinition-warning)
                            (error \"Avviso non ammesso: ~A\" condition)))))
  (asdf:load-asd (merge-pathnames \"arcdocdb.asd\" (truename \"./\")))
  (asdf:load-system \"arcdocdb/tests\"))
(let ((tests (remove-if-not
              (lambda (name) (search \"POOL-DISPATCH-\" (symbol-name name)))
              arcdocdb.scheduler.tests::*tests*)))
  (dolist (name (reverse tests)) (funcall name) (format t \"ok    ~A~%\" name))
  (format t \"~D test scoped dispatcher superati.~%\" (length tests)))
")
  (:PATH
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/source-attempt-01.lisp")
   :BYTES 27778 :SHA256 "a3690dd610a8c57fa0d718a0fe2d7025b040cafe50854170d7054e4c714b4429"
   :GIT-BLOB "eab67da96da0ff0f2cf2a05ec999ba59e3748baa" :TEXT
   ";;;; Dispatch pool -> routing preallocato; begin, batch e handoff restano espliciti.
;;;; OWNER: porta, contesto, tabella e link sul thread creatore della fixture.
;;;; SHARED: solo ready/registro immutabile e parole pool nei passaggi reali.
;;;; FI quiescenti: immagini bounded, sentinelle ripristinate e binding corrotti dichiarati.
(in-package #:arcdocdb.scheduler.tests)

(defmacro with-pool-dispatch ((dispatcher port context ready table writers controllers
                              &key (active t) (shards 1) (capacity 1) (start 0)
                                (left-items ''(:a1 :a2)) (right-items ''(:b1)))
                             &body body)
  \"Fixture C4 locale, con due routing ordinal distinti e risorse sempre chiuse.\"
  (let ((left (gensym \"LEFT\")) (right (gensym \"RIGHT\"))
        (left-file (gensym \"LEFT-FILE\")) (right-file (gensym \"RIGHT-FILE\")))
    `(multiple-value-bind (,port ,context ,ready)
         (pool-claim-local :active ,active :shards ,shards :capacity ,capacity :start ,start)
       (multiple-value-bind (,left ,left-file) (pool-claim-series 81)
         (multiple-value-bind (,right ,right-file) (pool-claim-series 82)
           (unwind-protect
                (let* ((,writers (vector (pool-claim-writer ,left-items 0)
                                        (pool-claim-writer ,right-items 1)))
                       (,controllers (vector ,left ,right))
                       (,table (arcdocdb.execution.series:crea-tabella-worker-serie
                                ,context (arcdocdb.execution.series:crea-registro-worker-serie
                                          ,writers ,controllers)))
                       (,dispatcher (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool
                                     ,port ,table)))
                  ,@body)
             (arcdocdb.io:chiudi ,right-file) (arcdocdb.io:chiudi ,left-file)))))))

(defun pool-dispatch-series-image (controller)
  \"FI: tutti i campi mutabili del controller e dei due slot preallocati della fixture.\"
  (list
   (mapcar (lambda (slot) (slot-value controller slot))
           '(arcdocdb.series::root arcdocdb.series::planned-root arcdocdb.series::next-offset
             arcdocdb.series::owner arcdocdb.series::lease-generation
             arcdocdb.series::event-generation arcdocdb.series::last-high
             arcdocdb.series::last-low arcdocdb.series::head arcdocdb.series::tail
             arcdocdb.series::publish-head arcdocdb.series::count arcdocdb.series::unresolved
             arcdocdb.series::active-io arcdocdb.series::state arcdocdb.series::effect-active))
   (map 'list
        (lambda (commit)
          (mapcar (lambda (slot) (slot-value commit slot))
                  '(arcdocdb.series::generation arcdocdb.series::lotto arcdocdb.series::slot
                    arcdocdb.series::high arcdocdb.series::low arcdocdb.series::expected-root
                    arcdocdb.series::root arcdocdb.series::level arcdocdb.series::phase
                    arcdocdb.series::io-state)))
        (arcdocdb.series::controllore-serie-slots controller))))

(defun pool-dispatch-link-image (link)
  (if (typep link 'arcdocdb.execution.series:collegamento-worker-serie)
      (mapcar (lambda (slot) (slot-value link slot))
              '(arcdocdb.execution.series::context arcdocdb.execution.series::writer
                arcdocdb.execution.series::controller arcdocdb.execution.series::generation
                arcdocdb.execution.series::writer-lease arcdocdb.execution.series::series-lease
                arcdocdb.execution.series::state arcdocdb.execution.series::fault))
      link))

(defun pool-dispatch-image (port table writers)
  \"Preimage bounded: entrambe le associazioni, ready, debiti, link e controller.\"
  (list (pool-claim-image port (coerce writers 'list))
        (lifecycle-context-state (arcdocdb.execution.series::tabella-worker-serie-context table))
        (map 'list #'pool-dispatch-link-image
             (arcdocdb.execution.series::tabella-worker-serie-links table))
        (map 'list #'pool-dispatch-series-image
             (arcdocdb.execution.series::registro-worker-serie-controllers
              (arcdocdb.execution.series::tabella-worker-serie-registry table)))))

(defun pool-dispatch-refusal (port table writers thunk type reason)
  (let ((before (pool-dispatch-image port table writers)))
    (arcdocdb.execution.tests::worker-capture-condition thunk type reason)
    (is (equalp before (pool-dispatch-image port table writers)))))

(defun pool-dispatch-check (dispatcher link status cursor action)
  (is (equal (list link status cursor action)
             (multiple-value-list
              (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher)))))

(defun pool-dispatch-finish (link item action)
  \"Tratto reale: begin esplicito, un batch pubblicato/ACK e terminazione esplicita.\"
  (let ((token (pool-claim-bridge-begin link)))
    (is (null (arcdocdb.execution.series:conferma-worker-serie
               link token (pool-claim-bridge-pop link token item))))
    (is (eq action (arcdocdb.execution.series:termina-worker-serie link token)))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-dispatch-factory-type-and-context-binding-refuse-without-effects
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignore dispatcher))
    (dolist (invalid (list nil :invalid #() '(port)))
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool invalid table))
       'invalid-argument :pool-dispatcher-configuration)
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool port invalid))
       'invalid-argument :pool-dispatcher-configuration))
    (let* ((other (arcdocdb.execution:crea-contesto-worker-writer ready))
           (registry (arcdocdb.execution.series:crea-registro-worker-serie writers controllers))
           (other-table (arcdocdb.execution.series:crea-tabella-worker-serie other registry))
           (before (lifecycle-context-state other)))
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool port other-table))
       'invalid-argument :pool-dispatcher-binding)
      (is (equal before (lifecycle-context-state other))))
    (is (eq :idle (arcdocdb.execution:stato-worker-writer context)))))

;;; REQ: REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-dispatch-factory-requires-complete-idle-before-construction
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignore dispatcher ready controllers))
    (is (null (arcdocdb.execution:adotta-writer-worker context (svref writers 0) 0)))
    (pool-dispatch-refusal
     port table writers
     (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool port table))
     'resource-exhausted :worker-state)
    (multiple-value-bind (writer home) (arcdocdb.execution:cede-writer-worker context)
      (is (eq writer (svref writers 0))) (is (= 0 home)))
    ;; FI IDLE incoerente: getter di fase valido, debito non vuoto da rifiutare.
    (setf (arcdocdb.execution::contesto-worker-writer-pending context) 1)
    (pool-dispatch-refusal
     port table writers
     (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool port table))
     'invariant-violation :worker-state)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-dispatch-foreign-owner-precedes-table-phase-and-pool-checks
  (let ((worker (lifecycle-fixture-start t)) (dispatcher nil) (table nil) (writers nil)
        (left-file nil) (right-file nil))
    (unwind-protect
         (progn
           (lifecycle-call
            worker
            (lambda (owned)
              (multiple-value-bind (left resource) (pool-claim-series 83)
                (setf left-file resource)
                (multiple-value-bind (right resource) (pool-claim-series 84)
                  (setf right-file resource writers (vector (pool-claim-writer '(:kept) 0)
                                                           (pool-claim-writer '(:other) 1)))
                  (setf table (arcdocdb.execution.series:crea-tabella-worker-serie
                               (lifecycle-fixture-context owned)
                               (arcdocdb.execution.series:crea-registro-worker-serie
                                writers (vector left right)))
                        dispatcher (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool
                                    (lifecycle-fixture-port owned) table)))) :ok))
           (let ((port (lifecycle-fixture-port worker))
                 (context (lifecycle-fixture-context worker)))
             ;; FI quiescente: l'owner deve precedere tipo table e ogni dato corrotto.
             (setf (arcdocdb.scheduler::porta-worker-pool-request port) 4
                   (arcdocdb.execution::contesto-worker-writer-state context) :faulted)
             (pool-dispatch-refusal
              port table writers
              (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool port :invalid))
              'invalid-argument :pool-worker-owner)
             (dolist (api '(arcdocdb.scheduler.dispatch:prendi-collegamento-pool
                            arcdocdb.scheduler.dispatch:collega-obbligo-pool))
               (pool-dispatch-refusal port table writers (lambda () (funcall api dispatcher))
                                      'invalid-argument :pool-worker-owner))))
      (when left-file
        (lifecycle-call worker (lambda (owned) (declare (ignore owned))
                                 (when right-file (arcdocdb.io:chiudi right-file))
                                 (arcdocdb.io:chiudi left-file) :ok)))
      (lifecycle-fixtures-stop (list worker)))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-dispatch-inactive-empty-busy-never-enter-routing
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :active nil :shards 3 :start 1 :left-items '(:a1))
    (declare (ignore controllers))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 (svref writers 0))))
    (let ((before (pool-dispatch-image port table writers)))
      (pool-claim-function-fi
       'arcdocdb.execution.series:collega-writer-worker-serie
       (lambda (value) (declare (ignore value)) (error \"Routing di worker inattivo.\"))
       (lambda () (pool-dispatch-check dispatcher nil :inactive 1 :unchanged)))
      (is (equalp before (pool-dispatch-image port table writers))))
    ;; Cleanup esplicito dell'obbligo: il gate inattivo lo ha lasciato nel ring.
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (arcdocdb.execution.tests::worker-complete-one context (svref writers 0) :a1))
  (with-pool-dispatch (dispatcher port context ready table writers controllers :shards 3 :start 1)
    (declare (ignore table controllers))
    (pool-claim-function-fi
     'arcdocdb.execution.series:collega-writer-worker-serie
     (lambda (value) (declare (ignore value)) (error \"Routing senza writer acquisito.\"))
     (lambda ()
       (pool-dispatch-check dispatcher nil :empty 2 :unchanged)
       (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 (svref writers 1))))
       (arcdocdb.execution.tests::ready-call-with-guards
        (list (arcdocdb.execution.tests::ready-test-partition ready 2))
        (lambda () (pool-dispatch-check dispatcher nil :busy 0 :unchanged)))))
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 1) :claimed 0)
    (arcdocdb.execution.tests::worker-complete-one context (svref writers 1) :b1)
    (is (equal '(1 1 nil) (lifecycle-words port)))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-dispatch-routes-two-real-writers-without-implicit-begin
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :capacity 2 :left-items '(:a1))
    (declare (ignore port))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 1))))
    (is (= 2 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    (let ((links (arcdocdb.execution.series::tabella-worker-serie-links table)))
      (loop for ordinal in '(1 0) for item in '(:b1 :a1)
            do (let ((link (svref links ordinal))
                     (series-before (map 'list #'pool-dispatch-series-image controllers)))
                 (pool-dispatch-check dispatcher link :claimed 0 :unchanged)
                 (is (eq :claimed (arcdocdb.execution:stato-worker-writer context)))
                 (is (eq (svref writers ordinal) (arcdocdb.execution:writer-worker-writer context)))
                 (is (eq :idle (arcdocdb.execution.series:stato-worker-serie link)))
                 (is (equalp series-before (map 'list #'pool-dispatch-series-image controllers)))
                 ;; Un controller e ancora acquisibile: routing non possiede lease.
                 (let* ((controller (svref controllers ordinal))
                        (lease (arcdocdb.series:acquisisci-controllore-serie controller)))
                   (is (plusp lease)) (arcdocdb.series:rilascia-controllore-serie controller lease))
                 (pool-dispatch-finish link item :idle)))
      (pool-dispatch-check dispatcher nil :empty 0 :unchanged))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-dispatch-existing-claimed-routes-without-reading-corrupt-pool-words
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (declare (ignore controllers))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    (let ((link (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0)))
      (pool-dispatch-check dispatcher link :claimed 0 :unchanged)
      ;; FI in modo quiescente: collegare un obbligo non legge il canale lifecycle.
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 4
            (arcdocdb.scheduler::porta-worker-pool-ack port) 0)
      (let ((before (pool-dispatch-image port table writers)))
        (pool-claim-function-fi
         'arcdocdb.scheduler:prendi-writer-pool
         (lambda (value) (declare (ignore value)) (error \"Gate su un obbligo CLAIMED.\"))
         (lambda ()
           (dotimes (attempt 2)
             (is (eq link (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher))))))
        (is (equalp before (pool-dispatch-image port table writers))))
      (pool-dispatch-finish link :a1 :idle)
      (is (eq :idle (arcdocdb.execution:stato-worker-writer context))))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-dispatch-pending-retire-drains-existing-claimed-before-ack
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (declare (ignore controllers))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    ;; FI: pubblicazione del coordinator prima della ripresa dell'obbligo CLAIMED.
    (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
    (let ((link (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0)))
      (is (eq link (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher)))
      (is (equal '(2 1 nil) (lifecycle-words port)))
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
       'resource-exhausted :worker-state)
      (pool-dispatch-finish link :a1 :idle)
      (is (equal '(2 1 nil) (lifecycle-words port)))
      (pool-dispatch-check dispatcher nil :inactive 0 :retired)
      (is (equal '(2 2 nil) (lifecycle-words port))))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-dispatch-full-recycle-routes-new-claimed-while-retire-pending
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    (let* ((links (arcdocdb.execution.series::tabella-worker-serie-links table))
           (left-link (svref links 0)) (right-link (svref links 1)))
      (pool-dispatch-check dispatcher left-link :claimed 0 :unchanged)
      (pool-dispatch-finish left-link :a1 :schedule)
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 1))))
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
      (arcdocdb.execution.tests::worker-check-recycle context (svref writers 1) :claimed 1)
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
       'resource-exhausted :worker-state)
      (is (eq right-link (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher)))
      (is (not (eq left-link right-link)))
      (is (equal '(2 1 nil) (lifecycle-words port)))
      (let ((token (pool-claim-bridge-begin right-link))
            (lease (arcdocdb.series:acquisisci-controllore-serie (svref controllers 0))))
        (is (plusp lease))
        (arcdocdb.series:rilascia-controllore-serie (svref controllers 0) lease)
        (signals resource-exhausted
          (arcdocdb.series:acquisisci-controllore-serie (svref controllers 1)) :serie-busy)
        (is (null (arcdocdb.execution.series:conferma-worker-serie
                   right-link token (pool-claim-bridge-pop right-link token :b1))))
        (is (eq :idle (arcdocdb.execution.series:termina-worker-serie right-link token))))
      (pool-dispatch-check dispatcher nil :inactive 0 :retired)
      ;; A e ancora nel ring; viene completato con acquisizione C4 esplicita.
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-dispatch-finish
       (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle))))

;;; REQ: REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-004-pool-dispatch-all-disallowed-phases-preserve-first-fault-and-debts
  (with-pool-dispatch (dispatcher port context ready table writers controllers :active nil)
    (declare (ignore ready controllers))
    (let ((original (make-condition 'invariant-violation :reason :worker-state)))
      ;; FI quiescente: i rifiuti di fase precedono ogni verifica dei debiti vivi.
      (setf (arcdocdb.execution::contesto-worker-writer-writer context) (svref writers 0)
            (arcdocdb.execution::contesto-worker-writer-lease context) 7
            (arcdocdb.execution::contesto-worker-writer-pending context) 2
            (arcdocdb.execution::contesto-worker-writer-batch-generation context) 9
            (arcdocdb.execution::contesto-worker-writer-fault context) original)
      (dolist (phase '(:claimed :running :batch :finishing :reschedule :faulted))
        (setf (arcdocdb.execution::contesto-worker-writer-state context) phase)
        (pool-dispatch-refusal
         port table writers
         (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
         'resource-exhausted :worker-state))
      (dolist (phase '(:idle :running :batch :finishing :reschedule :faulted))
        (setf (arcdocdb.execution::contesto-worker-writer-state context) phase)
        (pool-dispatch-refusal
         port table writers
         (lambda () (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher))
         'resource-exhausted :worker-state))
      (is (eq original (arcdocdb.execution:errore-worker-writer context)))
      (dolist (api '(arcdocdb.scheduler.dispatch:prendi-collegamento-pool
                     arcdocdb.scheduler.dispatch:collega-obbligo-pool))
        (let ((before (pool-dispatch-image port table writers)))
          (signals type-error (funcall api :invalid))
          (is (equalp before (pool-dispatch-image port table writers))))))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-dispatch-routing-fault-retains-activation-ack-and-acquired-obligation
  (dolist (scenario '(:legacy :different-identity :out-of-range))
    (with-pool-dispatch (dispatcher port context ready table writers controllers
                                   :active nil :shards 2 :start 1)
      (declare (ignore table))
      (let* ((claimed (ecase scenario
                        (:legacy (arcdocdb.execution.tests::worker-test-writer '(:legacy)))
                        (:different-identity (pool-claim-writer '(:other) 0))
                        (:out-of-range (pool-claim-writer '(:range) 2))))
             (controller-before (map 'list #'pool-dispatch-series-image controllers))
             (writer-before (arcdocdb.execution.tests::handoff-fi-snapshot claimed)))
        (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 1 claimed)))
        ;; FI coordinator quiescente: vera transizione inattivo -> attivo con ACK.
        (setf (arcdocdb.scheduler::porta-worker-pool-request port) 3)
        (let ((condition
                (arcdocdb.execution.tests::worker-capture-condition
                 (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
                 'invariant-violation :worker-serie-routing)))
          (is (equal '(3 3 nil) (lifecycle-words port)))
          (is (eq :faulted (arcdocdb.execution:stato-worker-writer context)))
          (is (eq claimed (arcdocdb.execution:writer-worker-writer context)))
          (is (= 1 (arcdocdb.execution::contesto-worker-writer-home context)))
          (is (= 0 (arcdocdb.execution::contesto-worker-writer-cursor context)))
          (is (zerop (arcdocdb.execution::contesto-worker-writer-lease context)))
          (is (zerop (arcdocdb.execution::contesto-worker-writer-pending context)))
          (is (eq condition (arcdocdb.execution:errore-worker-writer context)))
          (is (equalp controller-before (map 'list #'pool-dispatch-series-image controllers)))
          (is (equalp writer-before (arcdocdb.execution.tests::handoff-fi-snapshot claimed)))
          (let ((before (lifecycle-context-state context)))
            (dolist (api '(arcdocdb.scheduler.dispatch:prendi-collegamento-pool
                           arcdocdb.scheduler.dispatch:collega-obbligo-pool))
              (arcdocdb.execution.tests::worker-capture-condition
               (lambda () (funcall api dispatcher)) 'resource-exhausted :worker-state)
              (is (equal before (lifecycle-context-state context)))
              (is (eq condition (arcdocdb.execution:errore-worker-writer context))))))
        (is (every (lambda (writer) (not (eq claimed writer))) writers))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-dispatch-corrupt-table-binding-refuses-before-claim-or-routing
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignore controllers))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    ;; FI bypass prive: dispatcher lega deliberatamente la tabella a contesto diverso.
    ;; Lo slot e immutabile nel prodotto; una nuova struct FI sostituisce il binding.
    (let* ((other (arcdocdb.execution:crea-contesto-worker-writer ready))
           (bad-table (arcdocdb.execution.series::%make-tabella-worker-serie
                       other (arcdocdb.execution.series::tabella-worker-serie-registry table)
                       (arcdocdb.execution.series::tabella-worker-serie-links table)))
           (bad (arcdocdb.scheduler.dispatch::%make-dispatcher-writer-pool port bad-table)))
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool bad))
       'invalid-argument :pool-dispatcher-binding)
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:collega-obbligo-pool bad))
       'invalid-argument :pool-dispatcher-binding)
      (is (eq :idle (arcdocdb.execution:stato-worker-writer other)))
      (pool-dispatch-finish
       (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a1 :schedule)
      (arcdocdb.execution.tests::worker-check-recycle context nil :published 1)
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-dispatch-finish
       (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-dispatch-corrupt-link-faults-after-claim-without-begin-or-rollback
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (let* ((links (arcdocdb.execution.series::tabella-worker-serie-links table))
           (controller-before (map 'list #'pool-dispatch-series-image controllers))
           (writer-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0))))
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
      ;; FI quiescente dopo factory: nessuno dei link viene ricostruito nel path caldo.
      (setf (svref links 0) nil)
      (let ((condition
              (arcdocdb.execution.tests::worker-capture-condition
               (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
               'invariant-violation :worker-serie-routing)))
        (is (eq :faulted (arcdocdb.execution:stato-worker-writer context)))
        (is (eq (svref writers 0) (arcdocdb.execution:writer-worker-writer context)))
        (is (eq condition (arcdocdb.execution:errore-worker-writer context)))
        (is (equal '(1 1 nil) (lifecycle-words port)))
        (is (equalp controller-before (map 'list #'pool-dispatch-series-image controllers)))
        (is (equalp writer-before
                    (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0))))
        ;; Il pop acquisito e conservato: la partizione non ripubblica il writer.
        (let ((ready-partition (arcdocdb.execution.tests::ready-test-partition ready 0)))
          (is (zerop (arcdocdb.execution::partizione-pronta-count ready-partition))))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-dispatch-contradictory-gate-output-refuses-before-routing
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignore context ready controllers))
    ;; FI di contratto, non una race reale: il gate restituisce combinazioni errate
    ;; dei quattro valori che rispettano ancora la sua firma di tipi.
    (dolist (scenario '(:claimed :empty :busy :inactive))
      (pool-claim-function-fi
       'arcdocdb.scheduler:prendi-writer-pool
       (lambda (value)
         (declare (ignore value))
         (values (unless (eq scenario :claimed) (svref writers 0)) scenario 0 :unchanged))
       (lambda ()
         (pool-claim-function-fi
          'arcdocdb.execution.series:collega-writer-worker-serie
          (lambda (value) (declare (ignore value)) (error \"Routing di risultato incoerente.\"))
          (lambda ()
            (pool-dispatch-refusal
             port table writers
             (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
             'invariant-violation :pool-dispatcher-state))))))))
")
  (:PATH
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/source-attempt-02.lisp")
   :BYTES 27851 :SHA256 "42d190b8c414fb101a001fdf3a3f4302e70ae7d9f2f41390e933eb098b8402a2"
   :GIT-BLOB "0782e4de3435b760aa795d4e13b275fe9550fb23" :TEXT
   ";;;; Dispatch pool -> routing preallocato; begin, batch e handoff restano espliciti.
;;;; OWNER: porta, contesto, tabella e link sul thread creatore della fixture.
;;;; SHARED: solo ready/registro immutabile e parole pool nei passaggi reali.
;;;; FI quiescenti: immagini bounded, sentinelle ripristinate e binding corrotti dichiarati.
(in-package #:arcdocdb.scheduler.tests)

(defmacro with-pool-dispatch ((dispatcher port context ready table writers controllers
                              &key (active t) (shards 1) (capacity 1) (start 0)
                                (left-items ''(:a1 :a2)) (right-items ''(:b1)))
                             &body body)
  \"Fixture C4 locale, con due routing ordinal distinti e risorse sempre chiuse.\"
  (let ((left (gensym \"LEFT\")) (right (gensym \"RIGHT\"))
        (left-file (gensym \"LEFT-FILE\")) (right-file (gensym \"RIGHT-FILE\")))
    `(multiple-value-bind (,port ,context ,ready)
         (pool-claim-local :active ,active :shards ,shards :capacity ,capacity :start ,start)
       (multiple-value-bind (,left ,left-file) (pool-claim-series 81)
         (multiple-value-bind (,right ,right-file) (pool-claim-series 82)
           (unwind-protect
                (let* ((,port ,port) (,context ,context) (,ready ,ready)
                       (,writers (vector (pool-claim-writer ,left-items 0)
                                        (pool-claim-writer ,right-items 1)))
                       (,controllers (vector ,left ,right))
                       (,table (arcdocdb.execution.series:crea-tabella-worker-serie
                                ,context (arcdocdb.execution.series:crea-registro-worker-serie
                                          ,writers ,controllers)))
                       (,dispatcher (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool
                                     ,port ,table)))
                  ,@body)
             (arcdocdb.io:chiudi ,right-file) (arcdocdb.io:chiudi ,left-file)))))))

(defun pool-dispatch-series-image (controller)
  \"FI: tutti i campi mutabili del controller e dei due slot preallocati della fixture.\"
  (list
   (mapcar (lambda (slot) (slot-value controller slot))
           '(arcdocdb.series::root arcdocdb.series::planned-root arcdocdb.series::next-offset
             arcdocdb.series::owner arcdocdb.series::lease-generation
             arcdocdb.series::event-generation arcdocdb.series::last-high
             arcdocdb.series::last-low arcdocdb.series::head arcdocdb.series::tail
             arcdocdb.series::publish-head arcdocdb.series::count arcdocdb.series::unresolved
             arcdocdb.series::active-io arcdocdb.series::state arcdocdb.series::effect-active))
   (map 'list
        (lambda (commit)
          (mapcar (lambda (slot) (slot-value commit slot))
                  '(arcdocdb.series::generation arcdocdb.series::lotto arcdocdb.series::slot
                    arcdocdb.series::high arcdocdb.series::low arcdocdb.series::expected-root
                    arcdocdb.series::root arcdocdb.series::level arcdocdb.series::phase
                    arcdocdb.series::io-state)))
        (arcdocdb.series::controllore-serie-slots controller))))

(defun pool-dispatch-link-image (link)
  (if (typep link 'arcdocdb.execution.series:collegamento-worker-serie)
      (mapcar (lambda (slot) (slot-value link slot))
              '(arcdocdb.execution.series::context arcdocdb.execution.series::writer
                arcdocdb.execution.series::controller arcdocdb.execution.series::generation
                arcdocdb.execution.series::writer-lease arcdocdb.execution.series::series-lease
                arcdocdb.execution.series::state arcdocdb.execution.series::fault))
      link))

(defun pool-dispatch-image (port table writers)
  \"Preimage bounded: entrambe le associazioni, ready, debiti, link e controller.\"
  (list (pool-claim-image port (coerce writers 'list))
        (lifecycle-context-state (arcdocdb.execution.series::tabella-worker-serie-context table))
        (map 'list #'pool-dispatch-link-image
             (arcdocdb.execution.series::tabella-worker-serie-links table))
        (map 'list #'pool-dispatch-series-image
             (arcdocdb.execution.series::registro-worker-serie-controllers
              (arcdocdb.execution.series::tabella-worker-serie-registry table)))))

(defun pool-dispatch-refusal (port table writers thunk type reason)
  (let ((before (pool-dispatch-image port table writers)))
    (arcdocdb.execution.tests::worker-capture-condition thunk type reason)
    (is (equalp before (pool-dispatch-image port table writers)))))

(defun pool-dispatch-check (dispatcher link status cursor action)
  (is (equal (list link status cursor action)
             (multiple-value-list
              (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher)))))

(defun pool-dispatch-finish (link item action)
  \"Tratto reale: begin esplicito, un batch pubblicato/ACK e terminazione esplicita.\"
  (let ((token (pool-claim-bridge-begin link)))
    (is (null (arcdocdb.execution.series:conferma-worker-serie
               link token (pool-claim-bridge-pop link token item))))
    (is (eq action (arcdocdb.execution.series:termina-worker-serie link token)))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-dispatch-factory-type-and-context-binding-refuse-without-effects
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignore dispatcher))
    (dolist (invalid (list nil :invalid #() '(port)))
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool invalid table))
       'invalid-argument :pool-dispatcher-configuration)
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool port invalid))
       'invalid-argument :pool-dispatcher-configuration))
    (let* ((other (arcdocdb.execution:crea-contesto-worker-writer ready))
           (registry (arcdocdb.execution.series:crea-registro-worker-serie writers controllers))
           (other-table (arcdocdb.execution.series:crea-tabella-worker-serie other registry))
           (before (lifecycle-context-state other)))
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool port other-table))
       'invalid-argument :pool-dispatcher-binding)
      (is (equal before (lifecycle-context-state other))))
    (is (eq :idle (arcdocdb.execution:stato-worker-writer context)))))

;;; REQ: REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-dispatch-factory-requires-complete-idle-before-construction
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignore dispatcher ready controllers))
    (is (null (arcdocdb.execution:adotta-writer-worker context (svref writers 0) 0)))
    (pool-dispatch-refusal
     port table writers
     (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool port table))
     'resource-exhausted :worker-state)
    (multiple-value-bind (writer home) (arcdocdb.execution:cede-writer-worker context)
      (is (eq writer (svref writers 0))) (is (= 0 home)))
    ;; FI IDLE incoerente: getter di fase valido, debito non vuoto da rifiutare.
    (setf (arcdocdb.execution::contesto-worker-writer-pending context) 1)
    (pool-dispatch-refusal
     port table writers
     (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool port table))
     'invariant-violation :worker-state)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-dispatch-foreign-owner-precedes-table-phase-and-pool-checks
  (let ((worker (lifecycle-fixture-start t)) (dispatcher nil) (table nil) (writers nil)
        (left-file nil) (right-file nil))
    (unwind-protect
         (progn
           (lifecycle-call
            worker
            (lambda (owned)
              (multiple-value-bind (left resource) (pool-claim-series 83)
                (setf left-file resource)
                (multiple-value-bind (right resource) (pool-claim-series 84)
                  (setf right-file resource writers (vector (pool-claim-writer '(:kept) 0)
                                                           (pool-claim-writer '(:other) 1)))
                  (setf table (arcdocdb.execution.series:crea-tabella-worker-serie
                               (lifecycle-fixture-context owned)
                               (arcdocdb.execution.series:crea-registro-worker-serie
                                writers (vector left right)))
                        dispatcher (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool
                                    (lifecycle-fixture-port owned) table)))) :ok))
           (let ((port (lifecycle-fixture-port worker))
                 (context (lifecycle-fixture-context worker)))
             ;; FI quiescente: l'owner deve precedere tipo table e ogni dato corrotto.
             (setf (arcdocdb.scheduler::porta-worker-pool-request port) 4
                   (arcdocdb.execution::contesto-worker-writer-state context) :faulted)
             (pool-dispatch-refusal
              port table writers
              (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool port :invalid))
              'invalid-argument :pool-worker-owner)
             (dolist (api '(arcdocdb.scheduler.dispatch:prendi-collegamento-pool
                            arcdocdb.scheduler.dispatch:collega-obbligo-pool))
               (pool-dispatch-refusal port table writers (lambda () (funcall api dispatcher))
                                      'invalid-argument :pool-worker-owner))))
      (when left-file
        (lifecycle-call worker (lambda (owned) (declare (ignore owned))
                                 (when right-file (arcdocdb.io:chiudi right-file))
                                 (arcdocdb.io:chiudi left-file) :ok)))
      (lifecycle-fixtures-stop (list worker)))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-dispatch-inactive-empty-busy-never-enter-routing
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :active nil :shards 3 :start 1 :left-items '(:a1))
    (declare (ignore controllers))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 (svref writers 0))))
    (let ((before (pool-dispatch-image port table writers)))
      (pool-claim-function-fi
       'arcdocdb.execution.series:collega-writer-worker-serie
       (lambda (value) (declare (ignore value)) (error \"Routing di worker inattivo.\"))
       (lambda () (pool-dispatch-check dispatcher nil :inactive 1 :unchanged)))
      (is (equalp before (pool-dispatch-image port table writers))))
    ;; Cleanup esplicito dell'obbligo: il gate inattivo lo ha lasciato nel ring.
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (arcdocdb.execution.tests::worker-complete-one context (svref writers 0) :a1))
  (with-pool-dispatch (dispatcher port context ready table writers controllers :shards 3 :start 1)
    (declare (ignore table controllers))
    (pool-claim-function-fi
     'arcdocdb.execution.series:collega-writer-worker-serie
     (lambda (value) (declare (ignore value)) (error \"Routing senza writer acquisito.\"))
     (lambda ()
       (pool-dispatch-check dispatcher nil :empty 2 :unchanged)
       (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 (svref writers 1))))
       (arcdocdb.execution.tests::ready-call-with-guards
        (list (arcdocdb.execution.tests::ready-test-partition ready 2))
        (lambda () (pool-dispatch-check dispatcher nil :busy 0 :unchanged)))))
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 1) :claimed 0)
    (arcdocdb.execution.tests::worker-complete-one context (svref writers 1) :b1)
    (is (equal '(1 1 nil) (lifecycle-words port)))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-dispatch-routes-two-real-writers-without-implicit-begin
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :capacity 2 :left-items '(:a1))
    (declare (ignore port))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 1))))
    (is (= 2 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    (let ((links (arcdocdb.execution.series::tabella-worker-serie-links table)))
      (loop for ordinal in '(1 0) for item in '(:b1 :a1)
            do (let ((link (svref links ordinal))
                     (series-before (map 'list #'pool-dispatch-series-image controllers)))
                 (pool-dispatch-check dispatcher link :claimed 0 :unchanged)
                 (is (eq :claimed (arcdocdb.execution:stato-worker-writer context)))
                 (is (eq (svref writers ordinal) (arcdocdb.execution:writer-worker-writer context)))
                 (is (eq :idle (arcdocdb.execution.series:stato-worker-serie link)))
                 (is (equalp series-before (map 'list #'pool-dispatch-series-image controllers)))
                 ;; Un controller e ancora acquisibile: routing non possiede lease.
                 (let* ((controller (svref controllers ordinal))
                        (lease (arcdocdb.series:acquisisci-controllore-serie controller)))
                   (is (plusp lease)) (arcdocdb.series:rilascia-controllore-serie controller lease))
                 (pool-dispatch-finish link item :idle)))
      (pool-dispatch-check dispatcher nil :empty 0 :unchanged))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-dispatch-existing-claimed-routes-without-reading-corrupt-pool-words
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (declare (ignore controllers))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    (let ((link (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0)))
      (pool-dispatch-check dispatcher link :claimed 0 :unchanged)
      ;; FI in modo quiescente: collegare un obbligo non legge il canale lifecycle.
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 4
            (arcdocdb.scheduler::porta-worker-pool-ack port) 0)
      (let ((before (pool-dispatch-image port table writers)))
        (pool-claim-function-fi
         'arcdocdb.scheduler:prendi-writer-pool
         (lambda (value) (declare (ignore value)) (error \"Gate su un obbligo CLAIMED.\"))
         (lambda ()
           (dotimes (attempt 2)
             (is (eq link (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher))))))
        (is (equalp before (pool-dispatch-image port table writers))))
      (pool-dispatch-finish link :a1 :idle)
      (is (eq :idle (arcdocdb.execution:stato-worker-writer context))))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-dispatch-pending-retire-drains-existing-claimed-before-ack
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (declare (ignore controllers))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    ;; FI: pubblicazione del coordinator prima della ripresa dell'obbligo CLAIMED.
    (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
    (let ((link (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0)))
      (is (eq link (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher)))
      (is (equal '(2 1 nil) (lifecycle-words port)))
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
       'resource-exhausted :worker-state)
      (pool-dispatch-finish link :a1 :idle)
      (is (equal '(2 1 nil) (lifecycle-words port)))
      (pool-dispatch-check dispatcher nil :inactive 0 :retired)
      (is (equal '(2 2 nil) (lifecycle-words port))))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-dispatch-full-recycle-routes-new-claimed-while-retire-pending
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    (let* ((links (arcdocdb.execution.series::tabella-worker-serie-links table))
           (left-link (svref links 0)) (right-link (svref links 1)))
      (pool-dispatch-check dispatcher left-link :claimed 0 :unchanged)
      (pool-dispatch-finish left-link :a1 :schedule)
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 1))))
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
      (arcdocdb.execution.tests::worker-check-recycle context (svref writers 1) :claimed 1)
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
       'resource-exhausted :worker-state)
      (is (eq right-link (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher)))
      (is (not (eq left-link right-link)))
      (is (equal '(2 1 nil) (lifecycle-words port)))
      (let ((token (pool-claim-bridge-begin right-link))
            (lease (arcdocdb.series:acquisisci-controllore-serie (svref controllers 0))))
        (is (plusp lease))
        (arcdocdb.series:rilascia-controllore-serie (svref controllers 0) lease)
        (signals resource-exhausted
          (arcdocdb.series:acquisisci-controllore-serie (svref controllers 1)) :serie-busy)
        (is (null (arcdocdb.execution.series:conferma-worker-serie
                   right-link token (pool-claim-bridge-pop right-link token :b1))))
        (is (eq :idle (arcdocdb.execution.series:termina-worker-serie right-link token))))
      (pool-dispatch-check dispatcher nil :inactive 0 :retired)
      ;; A e ancora nel ring; viene completato con acquisizione C4 esplicita.
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-dispatch-finish
       (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle))))

;;; REQ: REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-004-pool-dispatch-all-disallowed-phases-preserve-first-fault-and-debts
  (with-pool-dispatch (dispatcher port context ready table writers controllers :active nil)
    (declare (ignore ready controllers))
    (let ((original (make-condition 'invariant-violation :reason :worker-state)))
      ;; FI quiescente: i rifiuti di fase precedono ogni verifica dei debiti vivi.
      (setf (arcdocdb.execution::contesto-worker-writer-writer context) (svref writers 0)
            (arcdocdb.execution::contesto-worker-writer-lease context) 7
            (arcdocdb.execution::contesto-worker-writer-pending context) 2
            (arcdocdb.execution::contesto-worker-writer-batch-generation context) 9
            (arcdocdb.execution::contesto-worker-writer-fault context) original)
      (dolist (phase '(:claimed :running :batch :finishing :reschedule :faulted))
        (setf (arcdocdb.execution::contesto-worker-writer-state context) phase)
        (pool-dispatch-refusal
         port table writers
         (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
         'resource-exhausted :worker-state))
      (dolist (phase '(:idle :running :batch :finishing :reschedule :faulted))
        (setf (arcdocdb.execution::contesto-worker-writer-state context) phase)
        (pool-dispatch-refusal
         port table writers
         (lambda () (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher))
         'resource-exhausted :worker-state))
      (is (eq original (arcdocdb.execution:errore-worker-writer context)))
      (dolist (api '(arcdocdb.scheduler.dispatch:prendi-collegamento-pool
                     arcdocdb.scheduler.dispatch:collega-obbligo-pool))
        (let ((before (pool-dispatch-image port table writers)))
          (signals type-error (funcall api :invalid))
          (is (equalp before (pool-dispatch-image port table writers))))))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-dispatch-routing-fault-retains-activation-ack-and-acquired-obligation
  (dolist (scenario '(:legacy :different-identity :out-of-range))
    (with-pool-dispatch (dispatcher port context ready table writers controllers
                                   :active nil :shards 2 :start 1)
      (declare (ignore table))
      (let* ((claimed (ecase scenario
                        (:legacy (arcdocdb.execution.tests::worker-test-writer '(:legacy)))
                        (:different-identity (pool-claim-writer '(:other) 0))
                        (:out-of-range (pool-claim-writer '(:range) 2))))
             (controller-before (map 'list #'pool-dispatch-series-image controllers))
             (writer-before (arcdocdb.execution.tests::handoff-fi-snapshot claimed)))
        (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 1 claimed)))
        ;; FI coordinator quiescente: vera transizione inattivo -> attivo con ACK.
        (setf (arcdocdb.scheduler::porta-worker-pool-request port) 3)
        (let ((condition
                (arcdocdb.execution.tests::worker-capture-condition
                 (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
                 'invariant-violation :worker-serie-routing)))
          (is (equal '(3 3 nil) (lifecycle-words port)))
          (is (eq :faulted (arcdocdb.execution:stato-worker-writer context)))
          (is (eq claimed (arcdocdb.execution:writer-worker-writer context)))
          (is (= 1 (arcdocdb.execution::contesto-worker-writer-home context)))
          (is (= 0 (arcdocdb.execution::contesto-worker-writer-cursor context)))
          (is (zerop (arcdocdb.execution::contesto-worker-writer-lease context)))
          (is (zerop (arcdocdb.execution::contesto-worker-writer-pending context)))
          (is (eq condition (arcdocdb.execution:errore-worker-writer context)))
          (is (equalp controller-before (map 'list #'pool-dispatch-series-image controllers)))
          (is (equalp writer-before (arcdocdb.execution.tests::handoff-fi-snapshot claimed)))
          (let ((before (lifecycle-context-state context)))
            (dolist (api '(arcdocdb.scheduler.dispatch:prendi-collegamento-pool
                           arcdocdb.scheduler.dispatch:collega-obbligo-pool))
              (arcdocdb.execution.tests::worker-capture-condition
               (lambda () (funcall api dispatcher)) 'resource-exhausted :worker-state)
              (is (equal before (lifecycle-context-state context)))
              (is (eq condition (arcdocdb.execution:errore-worker-writer context))))))
        (is (every (lambda (writer) (not (eq claimed writer))) writers))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-dispatch-corrupt-table-binding-refuses-before-claim-or-routing
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignore controllers))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    ;; FI bypass prive: dispatcher lega deliberatamente la tabella a contesto diverso.
    ;; Lo slot e immutabile nel prodotto; una nuova struct FI sostituisce il binding.
    (let* ((other (arcdocdb.execution:crea-contesto-worker-writer ready))
           (bad-table (arcdocdb.execution.series::%make-tabella-worker-serie
                       other (arcdocdb.execution.series::tabella-worker-serie-registry table)
                       (arcdocdb.execution.series::tabella-worker-serie-links table)))
           (bad (arcdocdb.scheduler.dispatch::%make-dispatcher-writer-pool port bad-table)))
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool bad))
       'invalid-argument :pool-dispatcher-binding)
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:collega-obbligo-pool bad))
       'invalid-argument :pool-dispatcher-binding)
      (is (eq :idle (arcdocdb.execution:stato-worker-writer other)))
      (pool-dispatch-finish
       (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a1 :schedule)
      (arcdocdb.execution.tests::worker-check-recycle context nil :published 1)
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-dispatch-finish
       (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-dispatch-corrupt-link-faults-after-claim-without-begin-or-rollback
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (let* ((links (arcdocdb.execution.series::tabella-worker-serie-links table))
           (controller-before (map 'list #'pool-dispatch-series-image controllers))
           (writer-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0))))
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
      ;; FI quiescente dopo factory: nessuno dei link viene ricostruito nel path caldo.
      (setf (svref links 0) nil)
      (let ((condition
              (arcdocdb.execution.tests::worker-capture-condition
               (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
               'invariant-violation :worker-serie-routing)))
        (is (eq :faulted (arcdocdb.execution:stato-worker-writer context)))
        (is (eq (svref writers 0) (arcdocdb.execution:writer-worker-writer context)))
        (is (eq condition (arcdocdb.execution:errore-worker-writer context)))
        (is (equal '(1 1 nil) (lifecycle-words port)))
        (is (equalp controller-before (map 'list #'pool-dispatch-series-image controllers)))
        (is (equalp writer-before
                    (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0))))
        ;; Il pop acquisito e conservato: la partizione non ripubblica il writer.
        (let ((ready-partition (arcdocdb.execution.tests::ready-test-partition ready 0)))
          (is (zerop (arcdocdb.execution::partizione-pronta-count ready-partition))))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-dispatch-contradictory-gate-output-refuses-before-routing
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignore context ready controllers))
    ;; FI di contratto, non una race reale: il gate restituisce combinazioni errate
    ;; dei quattro valori che rispettano ancora la sua firma di tipi.
    (dolist (scenario '(:claimed :empty :busy :inactive))
      (pool-claim-function-fi
       'arcdocdb.scheduler:prendi-writer-pool
       (lambda (value)
         (declare (ignore value))
         (values (unless (eq scenario :claimed) (svref writers 0)) scenario 0 :unchanged))
       (lambda ()
         (pool-claim-function-fi
          'arcdocdb.execution.series:collega-writer-worker-serie
          (lambda (value) (declare (ignore value)) (error \"Routing di risultato incoerente.\"))
          (lambda ()
            (pool-dispatch-refusal
             port table writers
             (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
             'invariant-violation :pool-dispatcher-state))))))))
")
  (:PATH
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/source-attempt-03.lisp")
   :BYTES 27884 :SHA256 "d26a855af0c9107a76975f727b3d2c74ea30f356e05d3aa3f22f3f3ed87a4b79"
   :GIT-BLOB "dcdf1efdfa3a33f484032c82aef52ba54b867f84" :TEXT
   ";;;; Dispatch pool -> routing preallocato; begin, batch e handoff restano espliciti.
;;;; OWNER: porta, contesto, tabella e link sul thread creatore della fixture.
;;;; SHARED: solo ready/registro immutabile e parole pool nei passaggi reali.
;;;; FI quiescenti: immagini bounded, sentinelle ripristinate e binding corrotti dichiarati.
(in-package #:arcdocdb.scheduler.tests)

(defmacro with-pool-dispatch ((dispatcher port context ready table writers controllers
                              &key (active t) (shards 1) (capacity 1) (start 0)
                                (left-items ''(:a1 :a2)) (right-items ''(:b1)))
                             &body body)
  \"Fixture C4 locale, con due routing ordinal distinti e risorse sempre chiuse.\"
  (let ((left (gensym \"LEFT\")) (right (gensym \"RIGHT\"))
        (left-file (gensym \"LEFT-FILE\")) (right-file (gensym \"RIGHT-FILE\")))
    `(multiple-value-bind (,port ,context ,ready)
         (pool-claim-local :active ,active :shards ,shards :capacity ,capacity :start ,start)
       (multiple-value-bind (,left ,left-file) (pool-claim-series 81)
         (multiple-value-bind (,right ,right-file) (pool-claim-series 82)
           (unwind-protect
                (let* ((,port ,port) (,context ,context) (,ready ,ready)
                       (,writers (vector (pool-claim-writer ,left-items 0)
                                        (pool-claim-writer ,right-items 1)))
                       (,controllers (vector ,left ,right))
                       (,table (arcdocdb.execution.series:crea-tabella-worker-serie
                                ,context (arcdocdb.execution.series:crea-registro-worker-serie
                                          ,writers ,controllers)))
                       (,dispatcher (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool
                                     ,port ,table)))
                  ,@body)
             (arcdocdb.io:chiudi ,right-file) (arcdocdb.io:chiudi ,left-file)))))))

(defun pool-dispatch-series-image (controller)
  \"FI: tutti i campi mutabili del controller e dei due slot preallocati della fixture.\"
  (list
   (mapcar (lambda (slot) (slot-value controller slot))
           '(arcdocdb.series::root arcdocdb.series::planned-root arcdocdb.series::next-offset
             arcdocdb.series::owner arcdocdb.series::lease-generation
             arcdocdb.series::event-generation arcdocdb.series::last-high
             arcdocdb.series::last-low arcdocdb.series::head arcdocdb.series::tail
             arcdocdb.series::publish-head arcdocdb.series::count arcdocdb.series::unresolved
             arcdocdb.series::active-io arcdocdb.series::state arcdocdb.series::effect-active))
   (map 'list
        (lambda (commit)
          (mapcar (lambda (slot) (slot-value commit slot))
                  '(arcdocdb.series::generation arcdocdb.series::lotto arcdocdb.series::slot
                    arcdocdb.series::high arcdocdb.series::low arcdocdb.series::expected-root
                    arcdocdb.series::root arcdocdb.series::level arcdocdb.series::phase
                    arcdocdb.series::io-state)))
        (arcdocdb.series::controllore-serie-slots controller))))

(defun pool-dispatch-link-image (link)
  (if (typep link 'arcdocdb.execution.series:collegamento-worker-serie)
      (mapcar (lambda (slot) (slot-value link slot))
              '(arcdocdb.execution.series::context arcdocdb.execution.series::writer
                arcdocdb.execution.series::controller arcdocdb.execution.series::generation
                arcdocdb.execution.series::writer-lease arcdocdb.execution.series::series-lease
                arcdocdb.execution.series::state arcdocdb.execution.series::fault))
      link))

(defun pool-dispatch-image (port table writers)
  \"Preimage bounded: entrambe le associazioni, ready, debiti, link e controller.\"
  (list (pool-claim-image port (coerce writers 'list))
        (lifecycle-context-state (arcdocdb.execution.series::tabella-worker-serie-context table))
        (map 'list #'pool-dispatch-link-image
             (arcdocdb.execution.series::tabella-worker-serie-links table))
        (map 'list #'pool-dispatch-series-image
             (arcdocdb.execution.series::registro-worker-serie-controllers
              (arcdocdb.execution.series::tabella-worker-serie-registry table)))))

(defun pool-dispatch-refusal (port table writers thunk type reason)
  (let ((before (pool-dispatch-image port table writers)))
    (arcdocdb.execution.tests::worker-capture-condition thunk type reason)
    (is (equalp before (pool-dispatch-image port table writers)))))

(defun pool-dispatch-check (dispatcher link status cursor action)
  (is (equal (list link status cursor action)
             (multiple-value-list
              (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher)))))

(defun pool-dispatch-finish (link item action)
  \"Tratto reale: begin esplicito, un batch pubblicato/ACK e terminazione esplicita.\"
  (let ((token (pool-claim-bridge-begin link)))
    (is (null (arcdocdb.execution.series:conferma-worker-serie
               link token (pool-claim-bridge-pop link token item))))
    (is (eq action (arcdocdb.execution.series:termina-worker-serie link token)))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-dispatch-factory-type-and-context-binding-refuse-without-effects
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable dispatcher))
    (dolist (invalid (list nil :invalid #() '(port)))
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool invalid table))
       'invalid-argument :pool-dispatcher-configuration)
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool port invalid))
       'invalid-argument :pool-dispatcher-configuration))
    (let* ((other (arcdocdb.execution:crea-contesto-worker-writer ready))
           (registry (arcdocdb.execution.series:crea-registro-worker-serie writers controllers))
           (other-table (arcdocdb.execution.series:crea-tabella-worker-serie other registry))
           (before (lifecycle-context-state other)))
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool port other-table))
       'invalid-argument :pool-dispatcher-binding)
      (is (equal before (lifecycle-context-state other))))
    (is (eq :idle (arcdocdb.execution:stato-worker-writer context)))))

;;; REQ: REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-dispatch-factory-requires-complete-idle-before-construction
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable dispatcher ready controllers))
    (is (null (arcdocdb.execution:adotta-writer-worker context (svref writers 0) 0)))
    (pool-dispatch-refusal
     port table writers
     (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool port table))
     'resource-exhausted :worker-state)
    (multiple-value-bind (writer home) (arcdocdb.execution:cede-writer-worker context)
      (is (eq writer (svref writers 0))) (is (= 0 home)))
    ;; FI IDLE incoerente: getter di fase valido, debito non vuoto da rifiutare.
    (setf (arcdocdb.execution::contesto-worker-writer-pending context) 1)
    (pool-dispatch-refusal
     port table writers
     (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool port table))
     'invariant-violation :worker-state)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-dispatch-foreign-owner-precedes-table-phase-and-pool-checks
  (let ((worker (lifecycle-fixture-start t)) (dispatcher nil) (table nil) (writers nil)
        (left-file nil) (right-file nil))
    (unwind-protect
         (progn
           (lifecycle-call
            worker
            (lambda (owned)
              (multiple-value-bind (left resource) (pool-claim-series 83)
                (setf left-file resource)
                (multiple-value-bind (right resource) (pool-claim-series 84)
                  (setf right-file resource writers (vector (pool-claim-writer '(:kept) 0)
                                                           (pool-claim-writer '(:other) 1)))
                  (setf table (arcdocdb.execution.series:crea-tabella-worker-serie
                               (lifecycle-fixture-context owned)
                               (arcdocdb.execution.series:crea-registro-worker-serie
                                writers (vector left right)))
                        dispatcher (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool
                                    (lifecycle-fixture-port owned) table)))) :ok))
           (let ((port (lifecycle-fixture-port worker))
                 (context (lifecycle-fixture-context worker)))
             ;; FI quiescente: l'owner deve precedere tipo table e ogni dato corrotto.
             (setf (arcdocdb.scheduler::porta-worker-pool-request port) 4
                   (arcdocdb.execution::contesto-worker-writer-state context) :faulted)
             (pool-dispatch-refusal
              port table writers
              (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool port :invalid))
              'invalid-argument :pool-worker-owner)
             (dolist (api '(arcdocdb.scheduler.dispatch:prendi-collegamento-pool
                            arcdocdb.scheduler.dispatch:collega-obbligo-pool))
               (pool-dispatch-refusal port table writers (lambda () (funcall api dispatcher))
                                      'invalid-argument :pool-worker-owner))))
      (when left-file
        (lifecycle-call worker (lambda (owned) (declare (ignore owned))
                                 (when right-file (arcdocdb.io:chiudi right-file))
                                 (arcdocdb.io:chiudi left-file) :ok)))
      (lifecycle-fixtures-stop (list worker)))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-dispatch-inactive-empty-busy-never-enter-routing
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :active nil :shards 3 :start 1 :left-items '(:a1))
    (declare (ignorable controllers))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 (svref writers 0))))
    (let ((before (pool-dispatch-image port table writers)))
      (pool-claim-function-fi
       'arcdocdb.execution.series:collega-writer-worker-serie
       (lambda (value) (declare (ignore value)) (error \"Routing di worker inattivo.\"))
       (lambda () (pool-dispatch-check dispatcher nil :inactive 1 :unchanged)))
      (is (equalp before (pool-dispatch-image port table writers))))
    ;; Cleanup esplicito dell'obbligo: il gate inattivo lo ha lasciato nel ring.
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (arcdocdb.execution.tests::worker-complete-one context (svref writers 0) :a1))
  (with-pool-dispatch (dispatcher port context ready table writers controllers :shards 3 :start 1)
    (declare (ignorable table controllers))
    (pool-claim-function-fi
     'arcdocdb.execution.series:collega-writer-worker-serie
     (lambda (value) (declare (ignore value)) (error \"Routing senza writer acquisito.\"))
     (lambda ()
       (pool-dispatch-check dispatcher nil :empty 2 :unchanged)
       (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 (svref writers 1))))
       (arcdocdb.execution.tests::ready-call-with-guards
        (list (arcdocdb.execution.tests::ready-test-partition ready 2))
        (lambda () (pool-dispatch-check dispatcher nil :busy 0 :unchanged)))))
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 1) :claimed 0)
    (arcdocdb.execution.tests::worker-complete-one context (svref writers 1) :b1)
    (is (equal '(1 1 nil) (lifecycle-words port)))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-dispatch-routes-two-real-writers-without-implicit-begin
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :capacity 2 :left-items '(:a1))
    (declare (ignorable port))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 1))))
    (is (= 2 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    (let ((links (arcdocdb.execution.series::tabella-worker-serie-links table)))
      (loop for ordinal in '(1 0) for item in '(:b1 :a1)
            do (let ((link (svref links ordinal))
                     (series-before (map 'list #'pool-dispatch-series-image controllers)))
                 (pool-dispatch-check dispatcher link :claimed 0 :unchanged)
                 (is (eq :claimed (arcdocdb.execution:stato-worker-writer context)))
                 (is (eq (svref writers ordinal) (arcdocdb.execution:writer-worker-writer context)))
                 (is (eq :idle (arcdocdb.execution.series:stato-worker-serie link)))
                 (is (equalp series-before (map 'list #'pool-dispatch-series-image controllers)))
                 ;; Un controller e ancora acquisibile: routing non possiede lease.
                 (let* ((controller (svref controllers ordinal))
                        (lease (arcdocdb.series:acquisisci-controllore-serie controller)))
                   (is (plusp lease)) (arcdocdb.series:rilascia-controllore-serie controller lease))
                 (pool-dispatch-finish link item :idle)))
      (pool-dispatch-check dispatcher nil :empty 0 :unchanged))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-dispatch-existing-claimed-routes-without-reading-corrupt-pool-words
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (declare (ignorable controllers))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    (let ((link (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0)))
      (pool-dispatch-check dispatcher link :claimed 0 :unchanged)
      ;; FI in modo quiescente: collegare un obbligo non legge il canale lifecycle.
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 4
            (arcdocdb.scheduler::porta-worker-pool-ack port) 0)
      (let ((before (pool-dispatch-image port table writers)))
        (pool-claim-function-fi
         'arcdocdb.scheduler:prendi-writer-pool
         (lambda (value) (declare (ignore value)) (error \"Gate su un obbligo CLAIMED.\"))
         (lambda ()
           (dotimes (attempt 2)
             (is (eq link (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher))))))
        (is (equalp before (pool-dispatch-image port table writers))))
      (pool-dispatch-finish link :a1 :idle)
      (is (eq :idle (arcdocdb.execution:stato-worker-writer context))))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-dispatch-pending-retire-drains-existing-claimed-before-ack
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (declare (ignorable controllers))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    ;; FI: pubblicazione del coordinator prima della ripresa dell'obbligo CLAIMED.
    (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
    (let ((link (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0)))
      (is (eq link (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher)))
      (is (equal '(2 1 nil) (lifecycle-words port)))
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
       'resource-exhausted :worker-state)
      (pool-dispatch-finish link :a1 :idle)
      (is (equal '(2 1 nil) (lifecycle-words port)))
      (pool-dispatch-check dispatcher nil :inactive 0 :retired)
      (is (equal '(2 2 nil) (lifecycle-words port))))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-dispatch-full-recycle-routes-new-claimed-while-retire-pending
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    (let* ((links (arcdocdb.execution.series::tabella-worker-serie-links table))
           (left-link (svref links 0)) (right-link (svref links 1)))
      (pool-dispatch-check dispatcher left-link :claimed 0 :unchanged)
      (pool-dispatch-finish left-link :a1 :schedule)
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 1))))
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
      (arcdocdb.execution.tests::worker-check-recycle context (svref writers 1) :claimed 1)
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
       'resource-exhausted :worker-state)
      (is (eq right-link (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher)))
      (is (not (eq left-link right-link)))
      (is (equal '(2 1 nil) (lifecycle-words port)))
      (let ((token (pool-claim-bridge-begin right-link))
            (lease (arcdocdb.series:acquisisci-controllore-serie (svref controllers 0))))
        (is (plusp lease))
        (arcdocdb.series:rilascia-controllore-serie (svref controllers 0) lease)
        (signals resource-exhausted
          (arcdocdb.series:acquisisci-controllore-serie (svref controllers 1)) :serie-busy)
        (is (null (arcdocdb.execution.series:conferma-worker-serie
                   right-link token (pool-claim-bridge-pop right-link token :b1))))
        (is (eq :idle (arcdocdb.execution.series:termina-worker-serie right-link token))))
      (pool-dispatch-check dispatcher nil :inactive 0 :retired)
      ;; A e ancora nel ring; viene completato con acquisizione C4 esplicita.
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-dispatch-finish
       (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle))))

;;; REQ: REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-004-pool-dispatch-all-disallowed-phases-preserve-first-fault-and-debts
  (with-pool-dispatch (dispatcher port context ready table writers controllers :active nil)
    (declare (ignorable ready controllers))
    (let ((original (make-condition 'invariant-violation :reason :worker-state)))
      ;; FI quiescente: i rifiuti di fase precedono ogni verifica dei debiti vivi.
      (setf (arcdocdb.execution::contesto-worker-writer-writer context) (svref writers 0)
            (arcdocdb.execution::contesto-worker-writer-lease context) 7
            (arcdocdb.execution::contesto-worker-writer-pending context) 2
            (arcdocdb.execution::contesto-worker-writer-batch-generation context) 9
            (arcdocdb.execution::contesto-worker-writer-fault context) original)
      (dolist (phase '(:claimed :running :batch :finishing :reschedule :faulted))
        (setf (arcdocdb.execution::contesto-worker-writer-state context) phase)
        (pool-dispatch-refusal
         port table writers
         (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
         'resource-exhausted :worker-state))
      (dolist (phase '(:idle :running :batch :finishing :reschedule :faulted))
        (setf (arcdocdb.execution::contesto-worker-writer-state context) phase)
        (pool-dispatch-refusal
         port table writers
         (lambda () (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher))
         'resource-exhausted :worker-state))
      (is (eq original (arcdocdb.execution:errore-worker-writer context)))
      (dolist (api '(arcdocdb.scheduler.dispatch:prendi-collegamento-pool
                     arcdocdb.scheduler.dispatch:collega-obbligo-pool))
        (let ((before (pool-dispatch-image port table writers)))
          (signals type-error (funcall api :invalid))
          (is (equalp before (pool-dispatch-image port table writers))))))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-dispatch-routing-fault-retains-activation-ack-and-acquired-obligation
  (dolist (scenario '(:legacy :different-identity :out-of-range))
    (with-pool-dispatch (dispatcher port context ready table writers controllers
                                   :active nil :shards 2 :start 1)
      (declare (ignorable table))
      (let* ((claimed (ecase scenario
                        (:legacy (arcdocdb.execution.tests::worker-test-writer '(:legacy)))
                        (:different-identity (pool-claim-writer '(:other) 0))
                        (:out-of-range (pool-claim-writer '(:range) 2))))
             (controller-before (map 'list #'pool-dispatch-series-image controllers))
             (writer-before (arcdocdb.execution.tests::handoff-fi-snapshot claimed)))
        (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 1 claimed)))
        ;; FI coordinator quiescente: vera transizione inattivo -> attivo con ACK.
        (setf (arcdocdb.scheduler::porta-worker-pool-request port) 3)
        (let ((condition
                (arcdocdb.execution.tests::worker-capture-condition
                 (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
                 'invariant-violation :worker-serie-routing)))
          (is (equal '(3 3 nil) (lifecycle-words port)))
          (is (eq :faulted (arcdocdb.execution:stato-worker-writer context)))
          (is (eq claimed (arcdocdb.execution:writer-worker-writer context)))
          (is (= 1 (arcdocdb.execution::contesto-worker-writer-home context)))
          (is (= 0 (arcdocdb.execution::contesto-worker-writer-cursor context)))
          (is (zerop (arcdocdb.execution::contesto-worker-writer-lease context)))
          (is (zerop (arcdocdb.execution::contesto-worker-writer-pending context)))
          (is (eq condition (arcdocdb.execution:errore-worker-writer context)))
          (is (equalp controller-before (map 'list #'pool-dispatch-series-image controllers)))
          (is (equalp writer-before (arcdocdb.execution.tests::handoff-fi-snapshot claimed)))
          (let ((before (lifecycle-context-state context)))
            (dolist (api '(arcdocdb.scheduler.dispatch:prendi-collegamento-pool
                           arcdocdb.scheduler.dispatch:collega-obbligo-pool))
              (arcdocdb.execution.tests::worker-capture-condition
               (lambda () (funcall api dispatcher)) 'resource-exhausted :worker-state)
              (is (equal before (lifecycle-context-state context)))
              (is (eq condition (arcdocdb.execution:errore-worker-writer context))))))
        (is (every (lambda (writer) (not (eq claimed writer))) writers))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-dispatch-corrupt-table-binding-refuses-before-claim-or-routing
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable controllers))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    ;; FI bypass prive: dispatcher lega deliberatamente la tabella a contesto diverso.
    ;; Lo slot e immutabile nel prodotto; una nuova struct FI sostituisce il binding.
    (let* ((other (arcdocdb.execution:crea-contesto-worker-writer ready))
           (bad-table (arcdocdb.execution.series::%make-tabella-worker-serie
                       other (arcdocdb.execution.series::tabella-worker-serie-registry table)
                       (arcdocdb.execution.series::tabella-worker-serie-links table)))
           (bad (arcdocdb.scheduler.dispatch::%make-dispatcher-writer-pool port bad-table)))
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool bad))
       'invalid-argument :pool-dispatcher-binding)
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:collega-obbligo-pool bad))
       'invalid-argument :pool-dispatcher-binding)
      (is (eq :idle (arcdocdb.execution:stato-worker-writer other)))
      (pool-dispatch-finish
       (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a1 :schedule)
      (arcdocdb.execution.tests::worker-check-recycle context nil :published 1)
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-dispatch-finish
       (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-dispatch-corrupt-link-faults-after-claim-without-begin-or-rollback
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (let* ((links (arcdocdb.execution.series::tabella-worker-serie-links table))
           (controller-before (map 'list #'pool-dispatch-series-image controllers))
           (writer-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0))))
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
      ;; FI quiescente dopo factory: nessuno dei link viene ricostruito nel path caldo.
      (setf (svref links 0) nil)
      (let ((condition
              (arcdocdb.execution.tests::worker-capture-condition
               (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
               'invariant-violation :worker-serie-routing)))
        (is (eq :faulted (arcdocdb.execution:stato-worker-writer context)))
        (is (eq (svref writers 0) (arcdocdb.execution:writer-worker-writer context)))
        (is (eq condition (arcdocdb.execution:errore-worker-writer context)))
        (is (equal '(1 1 nil) (lifecycle-words port)))
        (is (equalp controller-before (map 'list #'pool-dispatch-series-image controllers)))
        (is (equalp writer-before
                    (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0))))
        ;; Il pop acquisito e conservato: la partizione non ripubblica il writer.
        (let ((ready-partition (arcdocdb.execution.tests::ready-test-partition ready 0)))
          (is (zerop (arcdocdb.execution::partizione-pronta-count ready-partition))))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-dispatch-contradictory-gate-output-refuses-before-routing
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable context ready controllers))
    ;; FI di contratto, non una race reale: il gate restituisce combinazioni errate
    ;; dei quattro valori che rispettano ancora la sua firma di tipi.
    (dolist (scenario '(:claimed :empty :busy :inactive))
      (pool-claim-function-fi
       'arcdocdb.scheduler:prendi-writer-pool
       (lambda (value)
         (declare (ignore value))
         (values (unless (eq scenario :claimed) (svref writers 0)) scenario 0 :unchanged))
       (lambda ()
         (pool-claim-function-fi
          'arcdocdb.execution.series:collega-writer-worker-serie
          (lambda (value) (declare (ignore value)) (error \"Routing di risultato incoerente.\"))
          (lambda ()
            (pool-dispatch-refusal
             port table writers
             (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
             'invariant-violation :pool-dispatcher-state))))))))
")
  (:PATH
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/source-attempt-04.lisp")
   :BYTES 29586 :SHA256 "5466f34e76a7b8f30bee82e5907670277da9944aacb0d106cca167083af0e021"
   :GIT-BLOB "6c5d382b825827d3dc0f38eaa901b11206a2161a" :TEXT
   ";;;; Dispatch pool -> routing preallocato; begin, batch e handoff restano espliciti.
;;;; OWNER: porta, contesto, tabella e link sul thread creatore della fixture.
;;;; SHARED: solo ready/registro immutabile e parole pool nei passaggi reali.
;;;; FI quiescenti: immagini bounded, sentinelle ripristinate e binding corrotti dichiarati.
(in-package #:arcdocdb.scheduler.tests)

(defmacro with-pool-dispatch ((dispatcher port context ready table writers controllers
                              &key (active t) (shards 1) (capacity 1) (start 0)
                                (left-items ''(:a1 :a2)) (right-items ''(:b1)))
                             &body body)
  \"Fixture C4 locale, con due routing ordinal distinti e risorse sempre chiuse.\"
  (let ((left (gensym \"LEFT\")) (right (gensym \"RIGHT\"))
        (left-file (gensym \"LEFT-FILE\")) (right-file (gensym \"RIGHT-FILE\")))
    `(multiple-value-bind (,port ,context ,ready)
         (pool-claim-local :active ,active :shards ,shards :capacity ,capacity :start ,start)
       (multiple-value-bind (,left ,left-file) (pool-claim-series 81)
         (multiple-value-bind (,right ,right-file) (pool-claim-series 82)
           (unwind-protect
                (let* ((,port ,port) (,context ,context) (,ready ,ready)
                       (,writers (vector (pool-claim-writer ,left-items 0)
                                        (pool-claim-writer ,right-items 1)))
                       (,controllers (vector ,left ,right))
                       (,table (arcdocdb.execution.series:crea-tabella-worker-serie
                                ,context (arcdocdb.execution.series:crea-registro-worker-serie
                                          ,writers ,controllers)))
                       (,dispatcher (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool
                                     ,port ,table)))
                  ,@body)
             (arcdocdb.io:chiudi ,right-file) (arcdocdb.io:chiudi ,left-file)))))))

(defun pool-dispatch-series-image (controller)
  \"FI: tutti i campi mutabili del controller e dei due slot preallocati della fixture.\"
  (list
   (mapcar (lambda (slot) (slot-value controller slot))
           '(arcdocdb.series::root arcdocdb.series::planned-root arcdocdb.series::next-offset
             arcdocdb.series::owner arcdocdb.series::lease-generation
             arcdocdb.series::event-generation arcdocdb.series::last-high
             arcdocdb.series::last-low arcdocdb.series::head arcdocdb.series::tail
             arcdocdb.series::publish-head arcdocdb.series::count arcdocdb.series::unresolved
             arcdocdb.series::active-io arcdocdb.series::state arcdocdb.series::effect-active))
   (map 'list
        (lambda (commit)
          (mapcar (lambda (slot) (slot-value commit slot))
                  '(arcdocdb.series::generation arcdocdb.series::lotto arcdocdb.series::slot
                    arcdocdb.series::high arcdocdb.series::low arcdocdb.series::expected-root
                    arcdocdb.series::root arcdocdb.series::level arcdocdb.series::phase
                    arcdocdb.series::io-state)))
        (arcdocdb.series::controllore-serie-slots controller))))

(defun pool-dispatch-link-image (link)
  (if (typep link 'arcdocdb.execution.series:collegamento-worker-serie)
      (mapcar (lambda (slot) (slot-value link slot))
              '(arcdocdb.execution.series::context arcdocdb.execution.series::writer
                arcdocdb.execution.series::controller arcdocdb.execution.series::generation
                arcdocdb.execution.series::writer-lease arcdocdb.execution.series::series-lease
                arcdocdb.execution.series::state arcdocdb.execution.series::fault))
      link))

(defun pool-dispatch-image (port table writers)
  \"Preimage bounded: entrambe le associazioni, ready, debiti, link e controller.\"
  (list (pool-claim-image port (coerce writers 'list))
        (lifecycle-context-state (arcdocdb.execution.series::tabella-worker-serie-context table))
        (map 'list #'pool-dispatch-link-image
             (arcdocdb.execution.series::tabella-worker-serie-links table))
        (map 'list #'pool-dispatch-series-image
             (arcdocdb.execution.series::registro-worker-serie-controllers
              (arcdocdb.execution.series::tabella-worker-serie-registry table)))))

(defun pool-dispatch-refusal (port table writers thunk type reason)
  (let ((before (pool-dispatch-image port table writers)))
    (arcdocdb.execution.tests::worker-capture-condition thunk type reason)
    (is (equalp before (pool-dispatch-image port table writers)))))

(defun pool-dispatch-check (dispatcher link status cursor action)
  (is (equal (list link status cursor action)
             (multiple-value-list
              (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher)))))

(defun pool-dispatch-finish (link item action)
  \"Tratto reale: begin esplicito, un batch pubblicato/ACK e terminazione esplicita.\"
  (let ((token (pool-claim-bridge-begin link)))
    (is (null (arcdocdb.execution.series:conferma-worker-serie
               link token (pool-claim-bridge-pop link token item))))
    (is (eq action (arcdocdb.execution.series:termina-worker-serie link token)))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-dispatch-factory-type-and-context-binding-refuse-without-effects
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable dispatcher))
    (dolist (invalid (list nil :invalid #() '(port)))
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool invalid table))
       'invalid-argument :pool-dispatcher-configuration)
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool port invalid))
       'invalid-argument :pool-dispatcher-configuration))
    (let* ((other (arcdocdb.execution:crea-contesto-worker-writer ready))
           (registry (arcdocdb.execution.series:crea-registro-worker-serie writers controllers))
           (other-table (arcdocdb.execution.series:crea-tabella-worker-serie other registry))
           (before (lifecycle-context-state other)))
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool port other-table))
       'invalid-argument :pool-dispatcher-binding)
      (is (equal before (lifecycle-context-state other))))
    (is (eq :idle (arcdocdb.execution:stato-worker-writer context)))))

;;; REQ: REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-dispatch-factory-requires-complete-idle-before-construction
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable dispatcher ready controllers))
    (is (null (arcdocdb.execution:adotta-writer-worker context (svref writers 0) 0)))
    (pool-dispatch-refusal
     port table writers
     (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool port table))
     'resource-exhausted :worker-state)
    (multiple-value-bind (writer home) (arcdocdb.execution:cede-writer-worker context)
      (is (eq writer (svref writers 0))) (is (= 0 home)))
    ;; FI IDLE incoerente: getter di fase valido, debito non vuoto da rifiutare.
    (setf (arcdocdb.execution::contesto-worker-writer-pending context) 1)
    (pool-dispatch-refusal
     port table writers
     (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool port table))
     'invariant-violation :worker-state)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-dispatch-foreign-owner-precedes-table-phase-and-pool-checks
  (let ((worker (lifecycle-fixture-start t)) (dispatcher nil) (table nil) (writers nil)
        (left-file nil) (right-file nil))
    (unwind-protect
         (progn
           (lifecycle-call
            worker
            (lambda (owned)
              (multiple-value-bind (left resource) (pool-claim-series 83)
                (setf left-file resource)
                (multiple-value-bind (right resource) (pool-claim-series 84)
                  (setf right-file resource writers (vector (pool-claim-writer '(:kept) 0)
                                                           (pool-claim-writer '(:other) 1)))
                  (setf table (arcdocdb.execution.series:crea-tabella-worker-serie
                               (lifecycle-fixture-context owned)
                               (arcdocdb.execution.series:crea-registro-worker-serie
                                writers (vector left right)))
                        dispatcher (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool
                                    (lifecycle-fixture-port owned) table)))) :ok))
           (let ((port (lifecycle-fixture-port worker))
                 (context (lifecycle-fixture-context worker)))
             ;; FI quiescente: l'owner deve precedere tipo table e ogni dato corrotto.
             (setf (arcdocdb.scheduler::porta-worker-pool-request port) 4
                   (arcdocdb.execution::contesto-worker-writer-state context) :faulted)
             (pool-dispatch-refusal
              port table writers
              (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool port :invalid))
              'invalid-argument :pool-worker-owner)
             (dolist (api '(arcdocdb.scheduler.dispatch:prendi-collegamento-pool
                            arcdocdb.scheduler.dispatch:collega-obbligo-pool))
               (pool-dispatch-refusal port table writers (lambda () (funcall api dispatcher))
                                      'invalid-argument :pool-worker-owner))))
      (when left-file
        (lifecycle-call worker (lambda (owned) (declare (ignore owned))
                                 (when right-file (arcdocdb.io:chiudi right-file))
                                 (arcdocdb.io:chiudi left-file) :ok)))
      (lifecycle-fixtures-stop (list worker)))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-dispatch-inactive-empty-busy-never-enter-routing
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :active nil :shards 3 :start 1 :left-items '(:a1))
    (declare (ignorable controllers))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 (svref writers 0))))
    (let ((before (pool-dispatch-image port table writers)))
      (pool-claim-function-fi
       'arcdocdb.execution.series:collega-writer-worker-serie
       (lambda (value) (declare (ignore value)) (error \"Routing di worker inattivo.\"))
       (lambda () (pool-dispatch-check dispatcher nil :inactive 1 :unchanged)))
      (is (equalp before (pool-dispatch-image port table writers))))
    ;; Cleanup esplicito dell'obbligo: il gate inattivo lo ha lasciato nel ring.
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (arcdocdb.execution.tests::worker-complete-one context (svref writers 0) :a1))
  (with-pool-dispatch (dispatcher port context ready table writers controllers :shards 3 :start 1)
    (declare (ignorable table controllers))
    (pool-claim-function-fi
     'arcdocdb.execution.series:collega-writer-worker-serie
     (lambda (value) (declare (ignore value)) (error \"Routing senza writer acquisito.\"))
     (lambda ()
       (pool-dispatch-check dispatcher nil :empty 2 :unchanged)
       (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 (svref writers 1))))
       (arcdocdb.execution.tests::ready-call-with-guards
        (list (arcdocdb.execution.tests::ready-test-partition ready 2))
        (lambda () (pool-dispatch-check dispatcher nil :busy 0 :unchanged)))))
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 1) :claimed 0)
    (arcdocdb.execution.tests::worker-complete-one context (svref writers 1) :b1)
    (is (equal '(1 1 nil) (lifecycle-words port)))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-dispatch-routes-two-real-writers-without-implicit-begin
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :capacity 2 :left-items '(:a1))
    (declare (ignorable port))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 1))))
    (is (= 2 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    (let ((links (arcdocdb.execution.series::tabella-worker-serie-links table)))
      (loop for ordinal in '(1 0) for item in '(:b1 :a1)
            do (let ((link (svref links ordinal))
                     (series-before (map 'list #'pool-dispatch-series-image controllers)))
                 (pool-dispatch-check dispatcher link :claimed 0 :unchanged)
                 (is (eq :claimed (arcdocdb.execution:stato-worker-writer context)))
                 (is (eq (svref writers ordinal) (arcdocdb.execution:writer-worker-writer context)))
                 (is (eq :idle (arcdocdb.execution.series:stato-worker-serie link)))
                 (is (equalp series-before (map 'list #'pool-dispatch-series-image controllers)))
                 ;; Un controller e ancora acquisibile: routing non possiede lease.
                 (let* ((controller (svref controllers ordinal))
                        (lease (arcdocdb.series:acquisisci-controllore-serie controller)))
                   (is (plusp lease)) (arcdocdb.series:rilascia-controllore-serie controller lease))
                 (pool-dispatch-finish link item :idle)))
      (pool-dispatch-check dispatcher nil :empty 0 :unchanged))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-dispatch-existing-claimed-routes-without-reading-corrupt-pool-words
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (declare (ignorable controllers))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    (let ((link (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0)))
      (pool-dispatch-check dispatcher link :claimed 0 :unchanged)
      ;; FI in modo quiescente: collegare un obbligo non legge il canale lifecycle.
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 4
            (arcdocdb.scheduler::porta-worker-pool-ack port) 0)
      (let ((before (pool-dispatch-image port table writers)))
        (pool-claim-function-fi
         'arcdocdb.scheduler:prendi-writer-pool
         (lambda (value) (declare (ignore value)) (error \"Gate su un obbligo CLAIMED.\"))
         (lambda ()
           (dotimes (attempt 2)
             (is (eq link (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher))))))
        (is (equalp before (pool-dispatch-image port table writers))))
      (pool-dispatch-finish link :a1 :idle)
      (is (eq :idle (arcdocdb.execution:stato-worker-writer context))))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-dispatch-pending-retire-drains-existing-claimed-before-ack
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (declare (ignorable controllers))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    ;; FI: pubblicazione del coordinator prima della ripresa dell'obbligo CLAIMED.
    (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
    (let ((link (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0)))
      (is (eq link (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher)))
      (is (equal '(2 1 nil) (lifecycle-words port)))
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
       'resource-exhausted :worker-state)
      (pool-dispatch-finish link :a1 :idle)
      (is (equal '(2 1 nil) (lifecycle-words port)))
      (pool-dispatch-check dispatcher nil :inactive 0 :retired)
      (is (equal '(2 2 nil) (lifecycle-words port))))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-dispatch-full-recycle-routes-new-claimed-while-retire-pending
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    (let* ((links (arcdocdb.execution.series::tabella-worker-serie-links table))
           (left-link (svref links 0)) (right-link (svref links 1)))
      (pool-dispatch-check dispatcher left-link :claimed 0 :unchanged)
      (pool-dispatch-finish left-link :a1 :schedule)
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 1))))
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
      (arcdocdb.execution.tests::worker-check-recycle context (svref writers 1) :claimed 1)
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
       'resource-exhausted :worker-state)
      (is (eq right-link (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher)))
      (is (not (eq left-link right-link)))
      (is (equal '(2 1 nil) (lifecycle-words port)))
      (let ((token (pool-claim-bridge-begin right-link))
            (lease (arcdocdb.series:acquisisci-controllore-serie (svref controllers 0))))
        (is (plusp lease))
        (arcdocdb.series:rilascia-controllore-serie (svref controllers 0) lease)
        (signals resource-exhausted
          (arcdocdb.series:acquisisci-controllore-serie (svref controllers 1)) :serie-busy)
        (is (null (arcdocdb.execution.series:conferma-worker-serie
                   right-link token (pool-claim-bridge-pop right-link token :b1))))
        (is (eq :idle (arcdocdb.execution.series:termina-worker-serie right-link token))))
      (pool-dispatch-check dispatcher nil :inactive 0 :retired)
      ;; A e ancora nel ring; viene completato con acquisizione C4 esplicita.
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-dispatch-finish
       (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle))))

;;; REQ: REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-004-pool-dispatch-all-disallowed-phases-preserve-first-fault-and-debts
  (with-pool-dispatch (dispatcher port context ready table writers controllers :active nil)
    (declare (ignorable ready controllers))
    (let ((original (make-condition 'invariant-violation :reason :worker-state)))
      ;; FI quiescente: il nuovo claim rifiuta prima dei debiti di ogni fase non IDLE.
      (setf (arcdocdb.execution::contesto-worker-writer-writer context) (svref writers 0)
            (arcdocdb.execution::contesto-worker-writer-lease context) 7
            (arcdocdb.execution::contesto-worker-writer-pending context) 2
            (arcdocdb.execution::contesto-worker-writer-batch-generation context) 9
            (arcdocdb.execution::contesto-worker-writer-fault context) original)
      (dolist (phase '(:claimed :running :batch :finishing :reschedule :faulted))
        (setf (arcdocdb.execution::contesto-worker-writer-state context) phase)
        (pool-dispatch-refusal
         port table writers
         (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
         'resource-exhausted :worker-state))
      (is (eq original (arcdocdb.execution:errore-worker-writer context)))
      ;; Il routing delegato verifica i debiti C1 prima della fase: le immagini
      ;; successive sono coerenti e prodotte da begin/batch/end reali della fixture.
      (setf (arcdocdb.execution::contesto-worker-writer-state context) :idle
            (arcdocdb.execution::contesto-worker-writer-writer context) nil
            (arcdocdb.execution::contesto-worker-writer-lease context) 0
            (arcdocdb.execution::contesto-worker-writer-pending context) 0
            (arcdocdb.execution::contesto-worker-writer-fault context) nil)
      (flet ((refuse-obligation ()
               (pool-dispatch-refusal
                port table writers
                (lambda () (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher))
                'resource-exhausted :worker-state)))
        (refuse-obligation)
        (is (null (arcdocdb.execution:adotta-writer-worker context (svref writers 0) 0)))
        (let* ((link (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher))
               (token (pool-claim-bridge-begin link)))
          (refuse-obligation)
          (let ((batch (pool-claim-bridge-pop link token :a1)))
            (refuse-obligation)
            (is (null (arcdocdb.execution.series:conferma-worker-serie link token batch))))
          (lifecycle-queue-busy
           (arcdocdb.execution::writer-programmabile-queue (svref writers 0))
           (lambda ()
             (signals resource-exhausted
               (arcdocdb.execution.series:termina-worker-serie link token) :writer-queue-busy)
             (is (eq :finishing (arcdocdb.execution:stato-worker-writer context)))
             (refuse-obligation)))
          (is (eq :schedule (arcdocdb.execution.series:termina-worker-serie link token)))
          (refuse-obligation))
        (setf (arcdocdb.execution::contesto-worker-writer-state context) :faulted
              (arcdocdb.execution::contesto-worker-writer-fault context) original)
        (refuse-obligation))
      (is (eq original (arcdocdb.execution:errore-worker-writer context)))
      (dolist (api '(arcdocdb.scheduler.dispatch:prendi-collegamento-pool
                     arcdocdb.scheduler.dispatch:collega-obbligo-pool))
        (let ((before (pool-dispatch-image port table writers)))
          (signals type-error (funcall api :invalid))
          (is (equalp before (pool-dispatch-image port table writers))))))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-dispatch-routing-fault-retains-activation-ack-and-acquired-obligation
  (dolist (scenario '(:legacy :different-identity :out-of-range))
    (with-pool-dispatch (dispatcher port context ready table writers controllers
                                   :active nil :shards 2 :start 1)
      (declare (ignorable table))
      (let* ((claimed (ecase scenario
                        (:legacy (arcdocdb.execution.tests::worker-test-writer '(:legacy)))
                        (:different-identity (pool-claim-writer '(:other) 0))
                        (:out-of-range (pool-claim-writer '(:range) 2))))
             (controller-before (map 'list #'pool-dispatch-series-image controllers))
             (writer-before (arcdocdb.execution.tests::handoff-fi-snapshot claimed)))
        (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 1 claimed)))
        ;; FI coordinator quiescente: vera transizione inattivo -> attivo con ACK.
        (setf (arcdocdb.scheduler::porta-worker-pool-request port) 3)
        (let ((condition
                (arcdocdb.execution.tests::worker-capture-condition
                 (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
                 'invariant-violation :worker-serie-routing)))
          (is (equal '(3 3 nil) (lifecycle-words port)))
          (is (eq :faulted (arcdocdb.execution:stato-worker-writer context)))
          (is (eq claimed (arcdocdb.execution:writer-worker-writer context)))
          (is (= 1 (arcdocdb.execution::contesto-worker-writer-home context)))
          (is (= 0 (arcdocdb.execution::contesto-worker-writer-cursor context)))
          (is (zerop (arcdocdb.execution::contesto-worker-writer-lease context)))
          (is (zerop (arcdocdb.execution::contesto-worker-writer-pending context)))
          (is (eq condition (arcdocdb.execution:errore-worker-writer context)))
          (is (equalp controller-before (map 'list #'pool-dispatch-series-image controllers)))
          (is (equalp writer-before (arcdocdb.execution.tests::handoff-fi-snapshot claimed)))
          (let ((before (lifecycle-context-state context)))
            (dolist (api '(arcdocdb.scheduler.dispatch:prendi-collegamento-pool
                           arcdocdb.scheduler.dispatch:collega-obbligo-pool))
              (arcdocdb.execution.tests::worker-capture-condition
               (lambda () (funcall api dispatcher)) 'resource-exhausted :worker-state)
              (is (equal before (lifecycle-context-state context)))
              (is (eq condition (arcdocdb.execution:errore-worker-writer context))))))
        (is (every (lambda (writer) (not (eq claimed writer))) writers))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-dispatch-corrupt-table-binding-refuses-before-claim-or-routing
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable controllers))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    ;; FI bypass prive: dispatcher lega deliberatamente la tabella a contesto diverso.
    ;; Lo slot e immutabile nel prodotto; una nuova struct FI sostituisce il binding.
    (let* ((other (arcdocdb.execution:crea-contesto-worker-writer ready))
           (bad-table (arcdocdb.execution.series::%make-tabella-worker-serie
                       other (arcdocdb.execution.series::tabella-worker-serie-registry table)
                       (arcdocdb.execution.series::tabella-worker-serie-links table)))
           (bad (arcdocdb.scheduler.dispatch::%make-dispatcher-writer-pool port bad-table)))
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool bad))
       'invalid-argument :pool-dispatcher-binding)
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:collega-obbligo-pool bad))
       'invalid-argument :pool-dispatcher-binding)
      (is (eq :idle (arcdocdb.execution:stato-worker-writer other)))
      (pool-dispatch-finish
       (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a1 :schedule)
      (arcdocdb.execution.tests::worker-check-recycle context nil :published 1)
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-dispatch-finish
       (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-dispatch-corrupt-link-faults-after-claim-without-begin-or-rollback
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (let* ((links (arcdocdb.execution.series::tabella-worker-serie-links table))
           (controller-before (map 'list #'pool-dispatch-series-image controllers))
           (writer-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0))))
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
      ;; FI quiescente dopo factory: nessuno dei link viene ricostruito nel path caldo.
      (setf (svref links 0) nil)
      (let ((condition
              (arcdocdb.execution.tests::worker-capture-condition
               (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
               'invariant-violation :worker-serie-routing)))
        (is (eq :faulted (arcdocdb.execution:stato-worker-writer context)))
        (is (eq (svref writers 0) (arcdocdb.execution:writer-worker-writer context)))
        (is (eq condition (arcdocdb.execution:errore-worker-writer context)))
        (is (equal '(1 1 nil) (lifecycle-words port)))
        (is (equalp controller-before (map 'list #'pool-dispatch-series-image controllers)))
        (is (equalp writer-before
                    (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0))))
        ;; Il pop acquisito e conservato: la partizione non ripubblica il writer.
        (let ((ready-partition (arcdocdb.execution.tests::ready-test-partition ready 0)))
          (is (zerop (arcdocdb.execution::partizione-pronta-count ready-partition))))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-dispatch-contradictory-gate-output-refuses-before-routing
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable context ready controllers))
    ;; FI di contratto, non una race reale: il gate restituisce combinazioni errate
    ;; dei quattro valori che rispettano ancora la sua firma di tipi.
    (dolist (scenario '(:claimed :empty :busy :inactive))
      (pool-claim-function-fi
       'arcdocdb.scheduler:prendi-writer-pool
       (lambda (value)
         (declare (ignore value))
         (values (unless (eq scenario :claimed) (svref writers 0)) scenario 0 :unchanged))
       (lambda ()
         (pool-claim-function-fi
          'arcdocdb.execution.series:collega-writer-worker-serie
          (lambda (value) (declare (ignore value)) (error \"Routing di risultato incoerente.\"))
          (lambda ()
            (pool-dispatch-refusal
             port table writers
             (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
             'invariant-violation :pool-dispatcher-state))))))))
")
  (:PATH
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-dispatch-tests/source-attempt-05.lisp")
   :BYTES 31966 :SHA256 "600eb0b5fdf9a52d020e2f4c638f0f3dba43d9d9711be73eaffff208578821eb"
   :GIT-BLOB "6a493f0022ac8c9b6117c2a62df49fa596194c7b" :TEXT
   ";;;; Dispatch pool -> routing preallocato; begin, batch e handoff restano espliciti.
;;;; OWNER: porta, contesto, tabella e link sul thread creatore della fixture.
;;;; SHARED: solo ready/registro immutabile e parole pool nei passaggi reali.
;;;; FI quiescenti: immagini bounded, sentinelle ripristinate e binding corrotti dichiarati.
(in-package #:arcdocdb.scheduler.tests)

(defmacro with-pool-dispatch ((dispatcher port context ready table writers controllers
                              &key (active t) (shards 1) (capacity 1) (start 0)
                                (left-items ''(:a1 :a2)) (right-items ''(:b1)))
                             &body body)
  \"Fixture C4 locale, con due routing ordinal distinti e risorse sempre chiuse.\"
  (let ((left (gensym \"LEFT\")) (right (gensym \"RIGHT\"))
        (left-file (gensym \"LEFT-FILE\")) (right-file (gensym \"RIGHT-FILE\")))
    `(multiple-value-bind (,port ,context ,ready)
         (pool-claim-local :active ,active :shards ,shards :capacity ,capacity :start ,start)
       (multiple-value-bind (,left ,left-file) (pool-claim-series 81)
         (multiple-value-bind (,right ,right-file) (pool-claim-series 82)
           (unwind-protect
                (let* ((,port ,port) (,context ,context) (,ready ,ready)
                       (,writers (vector (pool-claim-writer ,left-items 0)
                                        (pool-claim-writer ,right-items 1)))
                       (,controllers (vector ,left ,right))
                       (,table (arcdocdb.execution.series:crea-tabella-worker-serie
                                ,context (arcdocdb.execution.series:crea-registro-worker-serie
                                          ,writers ,controllers)))
                       (,dispatcher (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool
                                     ,port ,table)))
                  ,@body)
             (arcdocdb.io:chiudi ,right-file) (arcdocdb.io:chiudi ,left-file)))))))

(defun pool-dispatch-series-image (controller)
  \"FI: tutti i campi mutabili del controller e dei due slot preallocati della fixture.\"
  (list
   (mapcar (lambda (slot) (slot-value controller slot))
           '(arcdocdb.series::root arcdocdb.series::planned-root arcdocdb.series::next-offset
             arcdocdb.series::owner arcdocdb.series::lease-generation
             arcdocdb.series::event-generation arcdocdb.series::last-high
             arcdocdb.series::last-low arcdocdb.series::head arcdocdb.series::tail
             arcdocdb.series::publish-head arcdocdb.series::count arcdocdb.series::unresolved
             arcdocdb.series::active-io arcdocdb.series::state arcdocdb.series::effect-active))
   (map 'list
        (lambda (commit)
          (mapcar (lambda (slot) (slot-value commit slot))
                  '(arcdocdb.series::generation arcdocdb.series::lotto arcdocdb.series::slot
                    arcdocdb.series::high arcdocdb.series::low arcdocdb.series::expected-root
                    arcdocdb.series::root arcdocdb.series::level arcdocdb.series::phase
                    arcdocdb.series::io-state)))
        (arcdocdb.series::controllore-serie-slots controller))))

(defun pool-dispatch-link-image (link)
  (if (typep link 'arcdocdb.execution.series:collegamento-worker-serie)
      (mapcar (lambda (slot) (slot-value link slot))
              '(arcdocdb.execution.series::context arcdocdb.execution.series::writer
                arcdocdb.execution.series::controller arcdocdb.execution.series::generation
                arcdocdb.execution.series::writer-lease arcdocdb.execution.series::series-lease
                arcdocdb.execution.series::state arcdocdb.execution.series::fault))
      link))

(defun pool-dispatch-image (port table writers)
  \"Preimage bounded: entrambe le associazioni, ready, debiti, link e controller.\"
  (list (pool-claim-image port (coerce writers 'list))
        (lifecycle-context-state (arcdocdb.execution.series::tabella-worker-serie-context table))
        (map 'list #'pool-dispatch-link-image
             (arcdocdb.execution.series::tabella-worker-serie-links table))
        (map 'list #'pool-dispatch-series-image
             (arcdocdb.execution.series::registro-worker-serie-controllers
              (arcdocdb.execution.series::tabella-worker-serie-registry table)))))

(defun pool-dispatch-refusal (port table writers thunk type reason)
  (let ((before (pool-dispatch-image port table writers)))
    (arcdocdb.execution.tests::worker-capture-condition thunk type reason)
    (is (equalp before (pool-dispatch-image port table writers)))))

(defun pool-dispatch-check (dispatcher link status cursor action)
  (is (equal (list link status cursor action)
             (multiple-value-list
              (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher)))))

(defun pool-dispatch-finish (link item action)
  \"Tratto reale: begin esplicito, un batch pubblicato/ACK e terminazione esplicita.\"
  (let ((token (pool-claim-bridge-begin link)))
    (is (null (arcdocdb.execution.series:conferma-worker-serie
               link token (pool-claim-bridge-pop link token item))))
    (is (eq action (arcdocdb.execution.series:termina-worker-serie link token)))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-dispatch-factory-type-and-context-binding-refuse-without-effects
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable dispatcher))
    (dolist (invalid (list nil :invalid #() '(port)))
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool invalid table))
       'invalid-argument :pool-dispatcher-configuration)
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool port invalid))
       'invalid-argument :pool-dispatcher-configuration))
    (let* ((other (arcdocdb.execution:crea-contesto-worker-writer ready))
           (registry (arcdocdb.execution.series:crea-registro-worker-serie writers controllers))
           (other-table (arcdocdb.execution.series:crea-tabella-worker-serie other registry))
           (before (lifecycle-context-state other)))
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool port other-table))
       'invalid-argument :pool-dispatcher-binding)
      (is (equal before (lifecycle-context-state other))))
    (is (eq :idle (arcdocdb.execution:stato-worker-writer context)))))

;;; REQ: REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-dispatch-factory-requires-complete-idle-before-construction
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable dispatcher ready controllers))
    (is (null (arcdocdb.execution:adotta-writer-worker context (svref writers 0) 0)))
    (pool-dispatch-refusal
     port table writers
     (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool port table))
     'resource-exhausted :worker-state)
    (multiple-value-bind (writer home) (arcdocdb.execution:cede-writer-worker context)
      (is (eq writer (svref writers 0))) (is (= 0 home)))
    ;; FI IDLE incoerente: getter di fase valido, debito non vuoto da rifiutare.
    (setf (arcdocdb.execution::contesto-worker-writer-pending context) 1)
    (pool-dispatch-refusal
     port table writers
     (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool port table))
     'invariant-violation :worker-state)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-dispatch-foreign-owner-precedes-table-phase-and-pool-checks
  (let ((worker (lifecycle-fixture-start t)) (dispatcher nil) (table nil) (writers nil)
        (left-file nil) (right-file nil))
    (unwind-protect
         (progn
           (lifecycle-call
            worker
            (lambda (owned)
              (multiple-value-bind (left resource) (pool-claim-series 83)
                (setf left-file resource)
                (multiple-value-bind (right resource) (pool-claim-series 84)
                  (setf right-file resource writers (vector (pool-claim-writer '(:kept) 0)
                                                           (pool-claim-writer '(:other) 1)))
                  (setf table (arcdocdb.execution.series:crea-tabella-worker-serie
                               (lifecycle-fixture-context owned)
                               (arcdocdb.execution.series:crea-registro-worker-serie
                                writers (vector left right)))
                        dispatcher (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool
                                    (lifecycle-fixture-port owned) table)))) :ok))
           (let ((port (lifecycle-fixture-port worker))
                 (context (lifecycle-fixture-context worker)))
             ;; FI quiescente: l'owner deve precedere tipo table e ogni dato corrotto.
             (setf (arcdocdb.scheduler::porta-worker-pool-request port) 4
                   (arcdocdb.execution::contesto-worker-writer-state context) :faulted)
             (pool-dispatch-refusal
              port table writers
              (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool port :invalid))
              'invalid-argument :pool-worker-owner)
             (dolist (api '(arcdocdb.scheduler.dispatch:prendi-collegamento-pool
                            arcdocdb.scheduler.dispatch:collega-obbligo-pool))
               (pool-dispatch-refusal port table writers (lambda () (funcall api dispatcher))
                                      'invalid-argument :pool-worker-owner))))
      (when left-file
        (lifecycle-call worker (lambda (owned) (declare (ignore owned))
                                 (when right-file (arcdocdb.io:chiudi right-file))
                                 (arcdocdb.io:chiudi left-file) :ok)))
      (lifecycle-fixtures-stop (list worker)))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-dispatch-inactive-empty-busy-never-enter-routing
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :active nil :shards 3 :start 1 :left-items '(:a1))
    (declare (ignorable controllers))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 (svref writers 0))))
    (let ((before (pool-dispatch-image port table writers)))
      (pool-claim-function-fi
       'arcdocdb.execution.series:collega-writer-worker-serie
       (lambda (value) (declare (ignore value)) (error \"Routing di worker inattivo.\"))
       (lambda () (pool-dispatch-check dispatcher nil :inactive 1 :unchanged)))
      (is (equalp before (pool-dispatch-image port table writers))))
    ;; Cleanup esplicito dell'obbligo: il gate inattivo lo ha lasciato nel ring.
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (arcdocdb.execution.tests::worker-complete-one context (svref writers 0) :a1))
  (with-pool-dispatch (dispatcher port context ready table writers controllers :shards 3 :start 1)
    (declare (ignorable table controllers))
    (pool-claim-function-fi
     'arcdocdb.execution.series:collega-writer-worker-serie
     (lambda (value) (declare (ignore value)) (error \"Routing senza writer acquisito.\"))
     (lambda ()
       (pool-dispatch-check dispatcher nil :empty 2 :unchanged)
       (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 (svref writers 1))))
       (arcdocdb.execution.tests::ready-call-with-guards
        (list (arcdocdb.execution.tests::ready-test-partition ready 2))
        (lambda () (pool-dispatch-check dispatcher nil :busy 0 :unchanged)))))
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 1) :claimed 0)
    (arcdocdb.execution.tests::worker-complete-one context (svref writers 1) :b1)
    (is (equal '(1 1 nil) (lifecycle-words port)))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-dispatch-routes-two-real-writers-without-implicit-begin
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :capacity 2 :left-items '(:a1))
    (declare (ignorable port))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 1))))
    (is (= 2 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    (let ((links (arcdocdb.execution.series::tabella-worker-serie-links table)))
      (loop for ordinal in '(1 0) for item in '(:b1 :a1)
            do (let ((link (svref links ordinal))
                     (series-before (map 'list #'pool-dispatch-series-image controllers)))
                 (pool-dispatch-check dispatcher link :claimed 0 :unchanged)
                 (is (eq :claimed (arcdocdb.execution:stato-worker-writer context)))
                 (is (eq (svref writers ordinal) (arcdocdb.execution:writer-worker-writer context)))
                 (is (eq :idle (arcdocdb.execution.series:stato-worker-serie link)))
                 (is (equalp series-before (map 'list #'pool-dispatch-series-image controllers)))
                 ;; Un controller e ancora acquisibile: routing non possiede lease.
                 (let* ((controller (svref controllers ordinal))
                        (lease (arcdocdb.series:acquisisci-controllore-serie controller)))
                   (is (plusp lease)) (arcdocdb.series:rilascia-controllore-serie controller lease))
                 (pool-dispatch-finish link item :idle)))
      (pool-dispatch-check dispatcher nil :empty 0 :unchanged))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-dispatch-existing-claimed-routes-without-reading-corrupt-pool-words
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (declare (ignorable controllers))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    (let ((link (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0)))
      (pool-dispatch-check dispatcher link :claimed 0 :unchanged)
      ;; FI in modo quiescente: collegare un obbligo non legge il canale lifecycle.
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 4
            (arcdocdb.scheduler::porta-worker-pool-ack port) 0)
      (let ((before (pool-dispatch-image port table writers)))
        (pool-claim-function-fi
         'arcdocdb.scheduler:prendi-writer-pool
         (lambda (value) (declare (ignore value)) (error \"Gate su un obbligo CLAIMED.\"))
         (lambda ()
           (dotimes (attempt 2)
             (is (eq link (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher))))))
        (is (equalp before (pool-dispatch-image port table writers))))
      (pool-dispatch-finish link :a1 :idle)
      (is (eq :idle (arcdocdb.execution:stato-worker-writer context))))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-dispatch-pending-retire-drains-existing-claimed-before-ack
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (declare (ignorable controllers))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    ;; FI: pubblicazione del coordinator prima della ripresa dell'obbligo CLAIMED.
    (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
    (let ((link (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0)))
      (is (eq link (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher)))
      (is (equal '(2 1 nil) (lifecycle-words port)))
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
       'resource-exhausted :worker-state)
      (pool-dispatch-finish link :a1 :idle)
      (is (equal '(2 1 nil) (lifecycle-words port)))
      (pool-dispatch-check dispatcher nil :inactive 0 :retired)
      (is (equal '(2 2 nil) (lifecycle-words port))))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-dispatch-full-recycle-routes-new-claimed-while-retire-pending
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    (let* ((links (arcdocdb.execution.series::tabella-worker-serie-links table))
           (left-link (svref links 0)) (right-link (svref links 1)))
      (pool-dispatch-check dispatcher left-link :claimed 0 :unchanged)
      (pool-dispatch-finish left-link :a1 :schedule)
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 1))))
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
      (arcdocdb.execution.tests::worker-check-recycle context (svref writers 1) :claimed 1)
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
       'resource-exhausted :worker-state)
      (is (eq right-link (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher)))
      (is (not (eq left-link right-link)))
      (is (equal '(2 1 nil) (lifecycle-words port)))
      (let ((token (pool-claim-bridge-begin right-link))
            (lease (arcdocdb.series:acquisisci-controllore-serie (svref controllers 0))))
        (is (plusp lease))
        (arcdocdb.series:rilascia-controllore-serie (svref controllers 0) lease)
        (signals resource-exhausted
          (arcdocdb.series:acquisisci-controllore-serie (svref controllers 1)) :serie-busy)
        (is (null (arcdocdb.execution.series:conferma-worker-serie
                   right-link token (pool-claim-bridge-pop right-link token :b1))))
        (is (eq :idle (arcdocdb.execution.series:termina-worker-serie right-link token))))
      (pool-dispatch-check dispatcher nil :inactive 0 :retired)
      ;; A e ancora nel ring; viene completato con acquisizione C4 esplicita.
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-dispatch-finish
       (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle))))

;;; REQ: REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-004-pool-dispatch-all-disallowed-phases-preserve-first-fault-and-debts
  (with-pool-dispatch (dispatcher port context ready table writers controllers :active nil)
    (declare (ignorable ready controllers))
    (let ((original (make-condition 'invariant-violation :reason :worker-state)))
      ;; FI quiescente: il nuovo claim rifiuta prima dei debiti di ogni fase non IDLE.
      (setf (arcdocdb.execution::contesto-worker-writer-writer context) (svref writers 0)
            (arcdocdb.execution::contesto-worker-writer-lease context) 7
            (arcdocdb.execution::contesto-worker-writer-pending context) 2
            (arcdocdb.execution::contesto-worker-writer-batch-generation context) 9
            (arcdocdb.execution::contesto-worker-writer-fault context) original)
      (dolist (phase '(:claimed :running :batch :finishing :reschedule :faulted))
        (setf (arcdocdb.execution::contesto-worker-writer-state context) phase)
        (pool-dispatch-refusal
         port table writers
         (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
         'resource-exhausted :worker-state))
      (is (eq original (arcdocdb.execution:errore-worker-writer context)))
      ;; Il routing delegato verifica i debiti C1 prima della fase: le immagini
      ;; successive sono coerenti e prodotte da begin/batch/end reali della fixture.
      (setf (arcdocdb.execution::contesto-worker-writer-state context) :idle
            (arcdocdb.execution::contesto-worker-writer-writer context) nil
            (arcdocdb.execution::contesto-worker-writer-lease context) 0
            (arcdocdb.execution::contesto-worker-writer-pending context) 0
            (arcdocdb.execution::contesto-worker-writer-fault context) nil)
      (flet ((refuse-obligation ()
               (pool-dispatch-refusal
                port table writers
                (lambda () (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher))
                'resource-exhausted :worker-state)))
        (refuse-obligation)
        (is (null (arcdocdb.execution:adotta-writer-worker context (svref writers 0) 0)))
        (let* ((link (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher))
               (token (pool-claim-bridge-begin link)))
          (refuse-obligation)
          (let ((batch (pool-claim-bridge-pop link token :a1)))
            (refuse-obligation)
            (is (null (arcdocdb.execution.series:conferma-worker-serie link token batch))))
          (lifecycle-queue-busy
           (arcdocdb.execution::writer-programmabile-queue (svref writers 0))
           (lambda ()
             (signals resource-exhausted
               (arcdocdb.execution.series:termina-worker-serie link token) :writer-queue-busy)
             (is (eq :finishing (arcdocdb.execution:stato-worker-writer context)))
             (refuse-obligation)))
          (is (eq :schedule (arcdocdb.execution.series:termina-worker-serie link token)))
          (refuse-obligation))
        (setf (arcdocdb.execution::contesto-worker-writer-state context) :faulted
              (arcdocdb.execution::contesto-worker-writer-fault context) original)
        (refuse-obligation))
      (is (eq original (arcdocdb.execution:errore-worker-writer context)))
      (dolist (api '(arcdocdb.scheduler.dispatch:prendi-collegamento-pool
                     arcdocdb.scheduler.dispatch:collega-obbligo-pool))
        (let ((before (pool-dispatch-image port table writers)))
          (signals type-error (funcall api :invalid))
          (is (equalp before (pool-dispatch-image port table writers))))))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-dispatch-routing-fault-retains-activation-ack-and-acquired-obligation
  (dolist (scenario '(:legacy :different-identity :out-of-range))
    (with-pool-dispatch (dispatcher port context ready table writers controllers
                                   :active nil :shards 2 :start 1)
      (declare (ignorable table))
      (let* ((claimed (ecase scenario
                        (:legacy (arcdocdb.execution.tests::worker-test-writer '(:legacy)))
                        (:different-identity (pool-claim-writer '(:other) 0))
                        (:out-of-range (pool-claim-writer '(:range) 2))))
             (controller-before (map 'list #'pool-dispatch-series-image controllers))
             (writer-before (arcdocdb.execution.tests::handoff-fi-snapshot claimed)))
        (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 1 claimed)))
        ;; FI coordinator quiescente: vera transizione inattivo -> attivo con ACK.
        (setf (arcdocdb.scheduler::porta-worker-pool-request port) 3)
        (let ((condition
                (arcdocdb.execution.tests::worker-capture-condition
                 (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
                 'invariant-violation :worker-serie-routing)))
          (is (equal '(3 3 nil) (lifecycle-words port)))
          (is (eq :faulted (arcdocdb.execution:stato-worker-writer context)))
          (is (eq claimed (arcdocdb.execution:writer-worker-writer context)))
          (is (= 1 (arcdocdb.execution::contesto-worker-writer-home context)))
          (is (= 0 (arcdocdb.execution::contesto-worker-writer-cursor context)))
          (is (zerop (arcdocdb.execution::contesto-worker-writer-lease context)))
          (is (zerop (arcdocdb.execution::contesto-worker-writer-pending context)))
          (is (eq condition (arcdocdb.execution:errore-worker-writer context)))
          (is (equalp controller-before (map 'list #'pool-dispatch-series-image controllers)))
          (is (equalp writer-before (arcdocdb.execution.tests::handoff-fi-snapshot claimed)))
          (let ((before (lifecycle-context-state context)))
            (dolist (api '(arcdocdb.scheduler.dispatch:prendi-collegamento-pool
                           arcdocdb.scheduler.dispatch:collega-obbligo-pool))
              (arcdocdb.execution.tests::worker-capture-condition
               (lambda () (funcall api dispatcher)) 'resource-exhausted :worker-state)
              (is (equal before (lifecycle-context-state context)))
              (is (eq condition (arcdocdb.execution:errore-worker-writer context))))))
        (is (every (lambda (writer) (not (eq claimed writer))) writers))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-dispatch-corrupt-table-binding-refuses-before-claim-or-routing
  (with-pool-dispatch (dispatcher port context ready table writers controllers :active nil)
    (declare (ignorable controllers))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    ;; FI coordinator: l'attivazione reale resterebbe applicabile a un gate valido.
    ;; Il binding incoerente deve rifiutare prima di confermare questo comando.
    (setf (arcdocdb.scheduler::porta-worker-pool-request port) 3)
    ;; FI bypass prive: dispatcher lega deliberatamente la tabella a contesto diverso.
    ;; Lo slot e immutabile nel prodotto; una nuova struct FI sostituisce il binding.
    (let* ((other (arcdocdb.execution:crea-contesto-worker-writer ready))
           (bad-table (arcdocdb.execution.series::%make-tabella-worker-serie
                       other (arcdocdb.execution.series::tabella-worker-serie-registry table)
                       (arcdocdb.execution.series::tabella-worker-serie-links table)))
           (bad (arcdocdb.scheduler.dispatch::%make-dispatcher-writer-pool port bad-table)))
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool bad))
       'invalid-argument :pool-dispatcher-binding)
      (is (equal '(3 0 nil) (lifecycle-words port)))
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:collega-obbligo-pool bad))
       'invalid-argument :pool-dispatcher-binding)
      (is (equal '(3 0 nil) (lifecycle-words port)))
      (is (eq :idle (arcdocdb.execution:stato-worker-writer other)))
      (pool-dispatch-finish
       (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a1 :schedule)
      (arcdocdb.execution.tests::worker-check-recycle context nil :published 1)
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-dispatch-finish
       (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-dispatch-corrupt-link-faults-after-claim-without-begin-or-rollback
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (let* ((links (arcdocdb.execution.series::tabella-worker-serie-links table))
           (controller-before (map 'list #'pool-dispatch-series-image controllers))
           (writer-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0))))
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
      ;; FI quiescente dopo factory: nessuno dei link viene ricostruito nel path caldo.
      (setf (svref links 0) nil)
      (let ((condition
              (arcdocdb.execution.tests::worker-capture-condition
               (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
               'invariant-violation :worker-serie-routing)))
        (is (eq :faulted (arcdocdb.execution:stato-worker-writer context)))
        (is (eq (svref writers 0) (arcdocdb.execution:writer-worker-writer context)))
        (is (eq condition (arcdocdb.execution:errore-worker-writer context)))
        (is (equal '(1 1 nil) (lifecycle-words port)))
        (is (equalp controller-before (map 'list #'pool-dispatch-series-image controllers)))
        (is (equalp writer-before
                    (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0))))
        ;; Il pop acquisito e conservato: la partizione non ripubblica il writer.
        (let ((ready-partition (arcdocdb.execution.tests::ready-test-partition ready 0)))
          (is (zerop (arcdocdb.execution::partizione-pronta-count ready-partition))))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-dispatch-contradictory-gate-output-refuses-before-routing
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable context ready controllers))
    ;; FI di contratto, non una race reale: il gate restituisce combinazioni errate
    ;; dei quattro valori che rispettano ancora la sua firma di tipi.
    (dolist (scenario '(:claimed :empty :busy :inactive))
      (pool-claim-function-fi
       'arcdocdb.scheduler:prendi-writer-pool
       (lambda (value)
         (declare (ignore value))
         (values (unless (eq scenario :claimed) (svref writers 0)) scenario 0 :unchanged))
       (lambda ()
         (pool-claim-function-fi
          'arcdocdb.execution.series:collega-writer-worker-serie
          (lambda (value) (declare (ignore value)) (error \"Routing di risultato incoerente.\"))
          (lambda ()
            (pool-dispatch-refusal
             port table writers
             (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
             'invariant-violation :pool-dispatcher-state))))))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-dispatch-writer-busy-begin-keeps-claimed-for-explicit-retry
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (declare (ignorable controllers))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    (let ((link (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0)))
      (pool-dispatch-check dispatcher link :claimed 0 :unchanged)
      ;; FI quiescente di contesa: prende la vera guard con CAS e la rilascia sempre.
      ;; Il ritiro pendente non revoca l'obbligo già CLAIMED quando begin è busy.
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
      (lifecycle-queue-busy
       (arcdocdb.execution::writer-programmabile-queue (svref writers 0))
       (lambda ()
         (pool-dispatch-refusal
          port table writers
          (lambda () (arcdocdb.execution.series:inizia-worker-serie link))
          'resource-exhausted :writer-queue-busy)))
      (is (eq :claimed (arcdocdb.execution:stato-worker-writer context)))
      (is (eq :idle (arcdocdb.execution.series:stato-worker-serie link)))
      (is (equal '(2 1 nil) (lifecycle-words port)))
      (let ((before (pool-dispatch-image port table writers)))
        (pool-claim-function-fi
         'arcdocdb.scheduler:prendi-writer-pool
         (lambda (value) (declare (ignore value)) (error \"Nuova presa dopo begin busy.\"))
         (lambda ()
           (dotimes (attempt 2)
             (is (eq link (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher))))))
        (is (equalp before (pool-dispatch-image port table writers))))
      ;; Il caller ripete begin soltanto dopo il ritorno al proprio confine C4.
      (pool-dispatch-finish link :a1 :idle)
      (is (equal '(2 1 nil) (lifecycle-words port)))
      (pool-dispatch-check dispatcher nil :inactive 0 :retired)
      (is (equal '(2 2 nil) (lifecycle-words port))))))
")
  (:PATH
   #A((110) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/spikes/out/pool-dispatch-fullcheck-attempt-01.log")
   :BYTES 141 :SHA256 "c1aaed849affbfdb5b91c067c3c8793d186dc8f317ca8d961d61edcf1450f38f" :GIT-BLOB
   "f909a406367f91c2b725821fbc397bfb91ed86f4" :TEXT
   ":OK: make check-core; record: /private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/spikes/out/4000917476-command-65223-0/report.lisp
")
  (:PATH
   #A((122) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/spikes/out/pool-dispatch-measure/bench-attempt-01/report.lisp")
   :BYTES 76408 :SHA256 "b4ef880fd285011a384b14feb47ac24ef649a90b77a453c4e0b0ddb8743bbbdc"
   :GIT-BLOB "ec400da389866a5b59d8a76026a43291d6971e48" :TEXT
   "(:SCHEMA-VERSION 1 :KIND :POOL-DISPATCH-BENCHMARK :STATUS :OK :STAGE :COMPLETE
 :DIAGNOSTIC NIL :PROCESS-ARGV
 (#A((48) BASE-CHAR . \"/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl\")
  #A((7) BASE-CHAR . \"--bench\")
  #A((50) BASE-CHAR . \"spikes/out/pool-dispatch-measure/bench-attempt-01/\"))
 :TOOL-ARGUMENTS
 (#A((7) BASE-CHAR . \"--bench\")
  #A((50) BASE-CHAR . \"spikes/out/pool-dispatch-measure/bench-attempt-01/\"))
 :SOURCE-FINGERPRINTS-BEFORE
 ((:FILE \"arcdocdb.asd\" :MD5
   #A((32) BASE-CHAR . \"d942157b93d69b3852e784a9a838fcb9\"))
  (:FILE \"tools/measure-pool-lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"72a85a626ffb60185baf7602d28517e9\"))
  (:FILE \"src/active/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"bf244695c3c14a1a0148517b48052f5d\"))
  (:FILE \"src/active/preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"0ce41661b5cd26fe2edb944cca142f98\"))
  (:FILE \"src/active/prepare.lisp\" :MD5
   #A((32) BASE-CHAR . \"e3238a39b721a3a5ac1055bc1a30feba\"))
  (:FILE \"src/active/source.lisp\" :MD5
   #A((32) BASE-CHAR . \"50c6d9f4e4eb68c8018acb6a3fe70c8e\"))
  (:FILE \"src/active/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe47862290f99d6217361f4302e2faf2\"))
  (:FILE \"src/cache/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"5d70197c8b64ad6f20c8be47a60c73ca\"))
  (:FILE \"src/cache/clock.lisp\" :MD5
   #A((32) BASE-CHAR . \"3546cf7f5c5ed138068548c20064f499\"))
  (:FILE \"src/cache/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"72f3a33ce27ddf94c49c495580520004\"))
  (:FILE \"src/cache/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1f6a8e7aa4faed88e984b39871d1e53\"))
  (:FILE \"src/cache/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"82f937b7b08bd1696ad9c88da2e1c60c\"))
  (:FILE \"src/cache/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a25648d870eaa4f0b6e1e3b2cf76e28e\"))
  (:FILE \"src/cache/write.lisp\" :MD5
   #A((32) BASE-CHAR . \"fc09021f74fb50aac57589614dae04d7\"))
  (:FILE \"src/codec/cbor-float-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"bc7a7b176e8cdd361b7c4306a1a4de4b\"))
  (:FILE \"src/codec/cbor-float-narrow.lisp\" :MD5
   #A((32) BASE-CHAR . \"c15cc9d91355860357ed434e58d1f4cb\"))
  (:FILE \"src/codec/cbor-float-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"f3b22be81a36e1713c34e890c82c6700\"))
  (:FILE \"src/codec/cbor-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"6e8c6a49314c2f460aa6f8a1759200b6\"))
  (:FILE \"src/codec/cbor-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"ecd8fe950344059c629927b38fb6e4aa\"))
  (:FILE \"src/codec/cbor-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"2dee1a475a1c6edb13b60430fbc0668e\"))
  (:FILE \"src/codec/cbor-scan-input.lisp\" :MD5
   #A((32) BASE-CHAR . \"f6488e987889432b375254021825dbe5\"))
  (:FILE \"src/codec/cbor-scan-items.lisp\" :MD5
   #A((32) BASE-CHAR . \"706c0baa4158bf272c4b0df17c1439d2\"))
  (:FILE \"src/codec/cbor-scan-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"987e8ed576a21eb644ac1ef2e06edbda\"))
  (:FILE \"src/codec/cbor-scan-stack.lisp\" :MD5
   #A((32) BASE-CHAR . \"cf1999ddb10f879aeefbeea853742d57\"))
  (:FILE \"src/codec/cbor-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"0c33aedcdb352e78a3c694cf796e6692\"))
  (:FILE \"src/codec/cbor-simple-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"200373402e6e082dd8c7afde305302bb\"))
  (:FILE \"src/codec/cbor-space.lisp\" :MD5
   #A((32) BASE-CHAR . \"c33cdcc45f45218aa3e8bf26ce0ee575\"))
  (:FILE \"src/codec/cbor-string-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"b13e92b5f24a42fe283c17b649722b6a\"))
  (:FILE \"src/codec/cbor-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"69e77bcd15b5413a815a65c5081229db\"))
  (:FILE \"src/codec/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d885bd2a9860eb60aec1a775e5031d5e\"))
  (:FILE \"src/codec/utf8.lisp\" :MD5
   #A((32) BASE-CHAR . \"0f67dd5c51bf6a63bc292ab4e2a280c2\"))
  (:FILE \"src/control/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"8f3dc4a9657b6bb760e31c46c1e7b986\"))
  (:FILE \"src/control/dependency.lisp\" :MD5
   #A((32) BASE-CHAR . \"22ae34181e8ab96d8c8ecab050a1a19e\"))
  (:FILE \"src/control/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"3cedb51e60b92524cd8208e4bfb2c3ba\"))
  (:FILE \"src/control/preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"2dfc2b76c1d3c382db8b50071bdaeadf\"))
  (:FILE \"src/control/prepare.lisp\" :MD5
   #A((32) BASE-CHAR . \"9df8dc8a19d2a4bc700adfed763c27fa\"))
  (:FILE \"src/control/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"468fcf430eede17a38b922dfd373a746\"))
  (:FILE \"src/control/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d15317bafcdb12ea579b2f482dff57c\"))
  (:FILE \"src/csn/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1130012fc5613a5648d22ed8628be0e8\"))
  (:FILE \"src/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1cdb5661fc54beba5bf00e4765f3235\"))
  (:FILE \"src/dispatch/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"ba4cd961094f37a157d49b8d7024b677\"))
  (:FILE \"src/dispatch/claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"b10caeff4f726c0ebd01e2c6d1baacba\"))
  (:FILE \"src/dispatch/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"46e12ac1f6ab8591bac6467f724538a2\"))
  (:FILE \"src/dispatch/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"36db6694bc70963149b8068ae7ab96ec\"))
  (:FILE \"src/epochs/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"765d14c88cd288093a77a57930cd6999\"))
  (:FILE \"src/epochs/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"875201dfab0a84efd40fe9828cc293c8\"))
  (:FILE \"src/epochs/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"975b5f74e0c5a38ce978f4d9c7fcc6b8\"))
  (:FILE \"src/epochs/reclaim.lisp\" :MD5
   #A((32) BASE-CHAR . \"036dd02adf87d33c3ae2f40735c733fa\"))
  (:FILE \"src/epochs/retire.lisp\" :MD5
   #A((32) BASE-CHAR . \"653b974f310c09f6e2224a84acc43bbf\"))
  (:FILE \"src/epochs/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"82253491f995f5bc153fb5ebf30d564c\"))
  (:FILE \"src/execution/handoff.lisp\" :MD5
   #A((32) BASE-CHAR . \"6b85eebe69366e78ed5fc5cc20735f00\"))
  (:FILE \"src/execution/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb5710d6c111cadb7121a50998a747fa\"))
  (:FILE \"src/execution/queue.lisp\" :MD5
   #A((32) BASE-CHAR . \"8202843bddb817da4279ac959ae3f3c4\"))
  (:FILE \"src/execution/ready-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"38d26f8c749dd946dfc4b9c57103a892\"))
  (:FILE \"src/execution/ready-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a64d98c9ff429d6103d6e10ee1fd7980\"))
  (:FILE \"src/execution/ready.lisp\" :MD5
   #A((32) BASE-CHAR . \"2c1892002f0599bb8273093031017520\"))
  (:FILE \"src/execution/worker-boundary.lisp\" :MD5
   #A((32) BASE-CHAR . \"c24065d6c8d80d1be53994a0041743df\"))
  (:FILE \"src/execution/worker-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"babd0a78b4185af24ae1fef870c0fabb\"))
  (:FILE \"src/execution/worker-run.lisp\" :MD5
   #A((32) BASE-CHAR . \"aa34ca6bc07535e35fea723878d99f66\"))
  (:FILE \"src/execution/worker-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"0679ee07c46f69db330706303c70d8d2\"))
  (:FILE \"src/execution/writer.lisp\" :MD5
   #A((32) BASE-CHAR . \"73019644090e2971f2b54dc36e4491f5\"))
  (:FILE \"src/foundation/batch.lisp\" :MD5
   #A((32) BASE-CHAR . \"ca642ea47e4bff76f78f5b6d7287d6bd\"))
  (:FILE \"src/foundation/binary.lisp\" :MD5
   #A((32) BASE-CHAR . \"a06115175f450776762761dce25acdb8\"))
  (:FILE \"src/foundation/conditions.lisp\" :MD5
   #A((32) BASE-CHAR . \"942b596396c19815290a57830af2121b\"))
  (:FILE \"src/foundation/crc32c.lisp\" :MD5
   #A((32) BASE-CHAR . \"4db58e2f48bf77d751f1b83bb9f84b5c\"))
  (:FILE \"src/foundation/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"5ee593a112958d94163dab17c5aa4ba2\"))
  (:FILE \"src/foundation/record.lisp\" :MD5
   #A((32) BASE-CHAR . \"c3ed0f09fa3fa6fe20c98e2ed6e69abe\"))
  (:FILE \"src/get-directory/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"cde24b2bf5c5637d5501b95bed47df31\"))
  (:FILE \"src/get-directory/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a05062f6ab6d5ebdfdde37e336dfce6\"))
  (:FILE \"src/get-directory/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"74a694385f1aaf03ec87721545494119\"))
  (:FILE \"src/get-directory/sources-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"2b8193aab6801de19e26fa55e7c53f87\"))
  (:FILE \"src/get-directory/sources-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"7bac02a80ddc22c622f8465642385ae8\"))
  (:FILE \"src/get-directory/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"17c957d6934a31f4ed64313e756de2d2\"))
  (:FILE \"src/get-resolver/active-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"c65593cf172f53a8e90a853bbe9504c2\"))
  (:FILE \"src/get-resolver/active-directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"6d95f29b331d335175843f47ae44a6ea\"))
  (:FILE \"src/get-resolver/active-init.lisp\" :MD5
   #A((32) BASE-CHAR . \"7ca975d2534f43c8018d36ecd7c2b042\"))
  (:FILE \"src/get-resolver/active-preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"f13d422adb6aa9e8489352884137f25a\"))
  (:FILE \"src/get-resolver/active-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"521737861e057d663964b0c030552587\"))
  (:FILE \"src/get-resolver/active-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6aaec49504a96f37c8ff1bc182c977b\"))
  (:FILE \"src/get-resolver/active-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"60bb258cf4cc7f50c5c1206af1bb5800\"))
  (:FILE \"src/get-resolver/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"bbfb2082103e6712419e180ab972245c\"))
  (:FILE \"src/get-resolver/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"263525e8274a8f46ce58a4a0ad6841a2\"))
  (:FILE \"src/get-resolver/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"1339edff0223dbf122f11ff0adbba61c\"))
  (:FILE \"src/get-resolver/rows.lisp\" :MD5
   #A((32) BASE-CHAR . \"ca9002b81efd0aed9761cd1f78514762\"))
  (:FILE \"src/get-resolver/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"536e9dc4ed51072b8a6d1528d3ec18bf\"))
  (:FILE \"src/get-resolver/sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d869293ba47444c4721713d955c6254\"))
  (:FILE \"src/get-resolver/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"9df13bcc6908e9fa601d173a671e1ccf\"))
  (:FILE \"src/get/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"c5cc36884b238221cc13ca0c087ec7c2\"))
  (:FILE \"src/get/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"e70bfeddd694336bbd088e65f8761834\"))
  (:FILE \"src/get/lookup.lisp\" :MD5
   #A((32) BASE-CHAR . \"82258ec87aca513a508bc5dee8410dd6\"))
  (:FILE \"src/get/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"c72633d15c3488699072eb610ebde7c8\"))
  (:FILE \"src/get/segment.lisp\" :MD5
   #A((32) BASE-CHAR . \"811869eb6a197d3c4e26af4322e52652\"))
  (:FILE \"src/get/target.lisp\" :MD5
   #A((32) BASE-CHAR . \"1b70dac05d6d2418909eb5105b808e81\"))
  (:FILE \"src/get/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"c394e5684de5e2d938991c7cb348b93c\"))
  (:FILE \"src/hash/arithmetic.lisp\" :MD5
   #A((32) BASE-CHAR . \"b5c51802e607e3dd22de68204baf64e9\"))
  (:FILE \"src/hash/blocks.lisp\" :MD5
   #A((32) BASE-CHAR . \"bef497b9a267c7306d4100000491c814\"))
  (:FILE \"src/hash/hash64.lisp\" :MD5
   #A((32) BASE-CHAR . \"886b7c08b9929283e8968831cbe5c039\"))
  (:FILE \"src/hash/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d9060e41bc5252067d35e59ac70ee06\"))
  (:FILE \"src/index/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"65076c355c099b5dc73d185948d3bec4\"))
  (:FILE \"src/index/hash-digests.lisp\" :MD5
   #A((32) BASE-CHAR . \"43d2209225707352daec6186ef95a805\"))
  (:FILE \"src/index/hash-seed.lisp\" :MD5
   #A((32) BASE-CHAR . \"45ce41749bc6fa638539815d3f802b96\"))
  (:FILE \"src/index/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"598a9b65e73151c924b2cdcaf6d96705\"))
  (:FILE \"src/index/primary-arena.lisp\" :MD5
   #A((32) BASE-CHAR . \"a319691e3e28b7ea7b927de490cf69ba\"))
  (:FILE \"src/index/primary-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"ff2cfbb865290d7a1510fdf6877c7229\"))
  (:FILE \"src/index/primary-core.lisp\" :MD5
   #A((32) BASE-CHAR . \"fa52433eae199ceeb874bf2bc47afca7\"))
  (:FILE \"src/index/primary-directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"1dd67c527257e43f17e006644ecdbd00\"))
  (:FILE \"src/index/primary-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d65cfce399b04f905bf969929962e59a\"))
  (:FILE \"src/index/primary-probe.lisp\" :MD5
   #A((32) BASE-CHAR . \"699ce3f1615296fc27fcde3e0d63a4bc\"))
  (:FILE \"src/index/primary-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"3f317a0d3c5ee86a73651aad36135cc3\"))
  (:FILE \"src/index/primary-relocate.lisp\" :MD5
   #A((32) BASE-CHAR . \"5155959766645d3172ae5e73c58cc071\"))
  (:FILE \"src/index/primary-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a59eab6425a60fa2656f86bf87d5c9ac\"))
  (:FILE \"src/index/primary-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"e8e31e599356e592af29c0cc4604872b\"))
  (:FILE \"src/index/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"5b22b90cfe8534086f6aff96d156713e\"))
  (:FILE \"src/index/rebuild-budget.lisp\" :MD5
   #A((32) BASE-CHAR . \"0417dd41cb3ec1d62dfd913c19f810ad\"))
  (:FILE \"src/index/rebuild-copy.lisp\" :MD5
   #A((32) BASE-CHAR . \"8befbbd00ed5c31c1487a11887eba495\"))
  (:FILE \"src/index/rebuild-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"1188e7a64a7a5d9482c1233cb9acb452\"))
  (:FILE \"src/index/rebuild.lisp\" :MD5
   #A((32) BASE-CHAR . \"a450cac8071513365267e7024cbe94b0\"))
  (:FILE \"src/index/relocate.lisp\" :MD5
   #A((32) BASE-CHAR . \"475dd7d5809a836f01544b447cc8df27\"))
  (:FILE \"src/index/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"5157fd03ee806ee998ad8f0002d56268\"))
  (:FILE \"src/index/validation.lisp\" :MD5
   #A((32) BASE-CHAR . \"3384cadf737c7d80c004222022a281f6\"))
  (:FILE \"src/index/write.lisp\" :MD5
   #A((32) BASE-CHAR . \"f0c8c579cd7db466d243ed3ea9f8e8aa\"))
  (:FILE \"src/io/flush.lisp\" :MD5
   #A((32) BASE-CHAR . \"716866194d6b9f076e102e84187229c0\"))
  (:FILE \"src/io/identity-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"d354a095fb378c1b6f27397ffb902227\"))
  (:FILE \"src/io/identity.lisp\" :MD5
   #A((32) BASE-CHAR . \"4e03b14a0c5015dc6ec897221c9f0eb5\"))
  (:FILE \"src/io/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"11c7103efbe733bbf0a13927f23c3d34\"))
  (:FILE \"src/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"58030bc0c811248a6537e2909d8762d6\"))
  (:FILE \"src/io/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"7aafde7081a3804862c3acf446e6e385\"))
  (:FILE \"src/io/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"2f8bd851d09ab994d8d01b231697d1a1\"))
  (:FILE \"src/io/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"e7b6ee5fd2d57281dbd32bf9b07d0fa6\"))
  (:FILE \"src/mvcc/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"f188d1dbd5d0adb49f53acf09157aef9\"))
  (:FILE \"src/mvcc/snapshots-core.lisp\" :MD5
   #A((32) BASE-CHAR . \"8bb066aab61a18eff175b9edb11e42a2\"))
  (:FILE \"src/mvcc/snapshots-csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"0e9365e674d1584b111f915ce1f58634\"))
  (:FILE \"src/mvcc/snapshots-lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"ff98aea5cb9a7ae2671f6a887a003725\"))
  (:FILE \"src/mvcc/snapshots-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"ae3ad96269b5e711a9dbb455f3c0ce48\"))
  (:FILE \"src/mvcc/snapshots-register.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d5a795bcefd605c75da91c725ae83a2\"))
  (:FILE \"src/mvcc/snapshots-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"475517bd7ba04a1c37a82efeb8ff73d9\"))
  (:FILE \"src/mvcc/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a9bc70eab6720b5c6f8503178e2c966b\"))
  (:FILE \"src/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"becf5c78049c85f2c05cd1ef54454032\"))
  (:FILE \"src/read/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"4040905f4a64ba704a480d82e87ec748\"))
  (:FILE \"src/read/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"7d74d9decc5a0bc9f9331d89bd503e21\"))
  (:FILE \"src/read/task.lisp\" :MD5
   #A((32) BASE-CHAR . \"9e0baf22c53329d393e047c669679645\"))
  (:FILE \"src/read/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"9c37ff8237fcc9fe9ae4f44316e854e3\"))
  (:FILE \"src/recovery/decisions-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"1a51ef4a488bb9fde2ff7d47bae01379\"))
  (:FILE \"src/recovery/decisions-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"cbdc30f93109c474e1fc25066c9b9b13\"))
  (:FILE \"src/recovery/decisions-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"f782d1137b8ce342b91c9999cfb7accc\"))
  (:FILE \"src/recovery/decisions-radix.lisp\" :MD5
   #A((32) BASE-CHAR . \"852149de4c289b8e067602780378d87a\"))
  (:FILE \"src/recovery/decisions-sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"b33e57a643f2fca810846f6226366253\"))
  (:FILE \"src/recovery/decisions-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f4433fd19ebc7239dbc2628c39f3ecdb\"))
  (:FILE \"src/recovery/inventory-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"9bd6820c4feba3e552aab1a4edd87861\"))
  (:FILE \"src/recovery/inventory-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"fcea263de1938767772e5b11411ecd5e\"))
  (:FILE \"src/recovery/inventory-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"78c136d5838dcfe3019d9069643a8d8f\"))
  (:FILE \"src/recovery/manifest-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"bf65b1731eab6e0572461ef5cc60fc40\"))
  (:FILE \"src/recovery/manifest-decode.lisp\" :MD5
   #A((32) BASE-CHAR . \"67975249aaabd751757cdfb9222cc3c4\"))
  (:FILE \"src/recovery/manifest-fold.lisp\" :MD5
   #A((32) BASE-CHAR . \"e0d2498db1011e857b7b0daa1934f187\"))
  (:FILE \"src/recovery/manifest-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"37ace42844c11b52446ee1fc500b8e0b\"))
  (:FILE \"src/recovery/manifest-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"ebd7a54adea2213294a887e6d4db0927\"))
  (:FILE \"src/recovery/manifest-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"7b1d4054415faca7e5fca59ad83b4d4a\"))
  (:FILE \"src/recovery/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1c1c8ad0cd15b1703a2fe19cbf3f13c2\"))
  (:FILE \"src/recovery/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"fcacd15460db25ea9cc4036065f9f096\"))
  (:FILE \"src/scheduler/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"36c5ae2dd08fbe546f4392b7b12102ec\"))
  (:FILE \"src/scheduler/lifecycle-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"1c4a4fd316ef034c298db47dfca1daca\"))
  (:FILE \"src/scheduler/lifecycle-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"19c8be44863be30c07bb72fe3fac2a99\"))
  (:FILE \"src/scheduler/lifecycle-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"fa2f88c50dfec24af40af091f9221590\"))
  (:FILE \"src/scheduler/lifecycle-update.lisp\" :MD5
   #A((32) BASE-CHAR . \"40a78461f91616a935a39f29b87680c8\"))
  (:FILE \"src/scheduler/lifecycle-worker.lisp\" :MD5
   #A((32) BASE-CHAR . \"9d7cdf45c1b594fef5af735ec0955c05\"))
  (:FILE \"src/scheduler/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"0578c541b6ddfaf8827240e967ff76ea\"))
  (:FILE \"src/scheduler/policy.lisp\" :MD5
   #A((32) BASE-CHAR . \"1721005a7545b36df601d75252638eba\"))
  (:FILE \"src/scheduler/pool-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"c4995b29d40caa2ee29aa0c167885287\"))
  (:FILE \"src/scheduler/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"170dfc36aef6a3d78f980fbcc37f0176\"))
  (:FILE \"src/scheduler/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"981f9f6db268cd9a46d4239c677c5d5b\"))
  (:FILE \"src/scheduler/update.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a43e6b400b701c69286357ef85469fc\"))
  (:FILE \"src/series/events.lisp\" :MD5
   #A((32) BASE-CHAR . \"32b2156739a6f2ca996abb91df0a2603\"))
  (:FILE \"src/series/io-events.lisp\" :MD5
   #A((32) BASE-CHAR . \"b6026a8b7bb64b45c37a65effda70d8e\"))
  (:FILE \"src/series/ownership.lisp\" :MD5
   #A((32) BASE-CHAR . \"de1aca16a35d34d16aba12ff541c0d2b\"))
  (:FILE \"src/series/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"09653c7479e1498d1545f3f1f0ffd755\"))
  (:FILE \"src/series/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6977aba53c811ec3a373226f9f53795\"))
  (:FILE \"src/series/query.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb0d91405325b508e6b2ab24d178de7a\"))
  (:FILE \"src/series/retirement.lisp\" :MD5
   #A((32) BASE-CHAR . \"b8e04971b8ad75a1bd0c722997badfd2\"))
  (:FILE \"src/series/routing-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6924deff152b941bd49f0bb200b4197\"))
  (:FILE \"src/series/routing-select.lisp\" :MD5
   #A((32) BASE-CHAR . \"e0f987d8767744050ec4d1b3ecb699ed\"))
  (:FILE \"src/series/routing-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"ce649df47dd38888d5103c98345f7e41\"))
  (:FILE \"src/series/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab19ec8d15af91511e817858c41cebc8\"))
  (:FILE \"src/series/worker-boundary.lisp\" :MD5
   #A((32) BASE-CHAR . \"2340e0c9074f7b1bf80c74f774986bc5\"))
  (:FILE \"src/series/worker-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"a93ce2e84e8aee647b5083ad1d2b899b\"))
  (:FILE \"src/series/worker-run.lisp\" :MD5
   #A((32) BASE-CHAR . \"f0fee18adf357bad98e8a3c3e8c70c0c\"))
  (:FILE \"src/series/worker-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"2b23d468be0165fa009c5ebd5d1bbe23\"))
  (:FILE \"src/storage/compaction-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"1cda77a357ab2147035993b72d135a37\"))
  (:FILE \"src/storage/control-payload.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb64f806b8d69eb42d865b4abfff0b27\"))
  (:FILE \"src/storage/formats.lisp\" :MD5
   #A((32) BASE-CHAR . \"061147be459d8d3b08c661bd3f91d152\"))
  (:FILE \"src/storage/log-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"b53d27dcc9f4badf18b50519c50bc614\"))
  (:FILE \"src/storage/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"f86bd104f20616a76b42c02227f72844\"))
  (:FILE \"src/storage/payload-record.lisp\" :MD5
   #A((32) BASE-CHAR . \"8c03f9c01dcb30f2d3970a5694968ecf\"))
  (:FILE \"src/storage/payload-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"c4ece3c4fa8d9492d2a80df7c0a4f5a0\"))
  (:FILE \"src/storage/segment-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6812fa59bf8fd1252fbf85a9bfa3896\"))
  (:FILE \"src/wal/builder.lisp\" :MD5
   #A((32) BASE-CHAR . \"a229f76f7036f3573a6e528dcd390a19\"))
  (:FILE \"src/wal/csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"42b990e3b254e6fb488c0ab91b6a6502\"))
  (:FILE \"src/wal/executor.lisp\" :MD5
   #A((32) BASE-CHAR . \"c0340924c9130e14d0e8efedeec078f1\"))
  (:FILE \"src/wal/group.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a0e7c99ab70b4720cbb091156560f5e\"))
  (:FILE \"src/wal/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"96c41b1d417135a24fc65659ea3abe11\"))
  (:FILE \"src/wal/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f799f27a8ac1a4c736c04796c1e543f9\"))
  (:FILE \"tests/codec/cbor-float-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"425bfed06e37f409d59d0f5f029af196\"))
  (:FILE \"tests/codec/cbor-float-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"a8f6600ec087c10e5ec0a43d43edade4\"))
  (:FILE \"tests/codec/cbor-float-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"e62412cb0e838b241383a5c9103dd2c2\"))
  (:FILE \"tests/codec/cbor-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"208ee0d03652de67ad453bdd34d10b62\"))
  (:FILE \"tests/codec/cbor-minimal-edges.lisp\" :MD5
   #A((32) BASE-CHAR . \"392d402b44d04a9ce1c95fef4c4e8bf9\"))
  (:FILE \"tests/codec/cbor-minimal-scan-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"16954ef22a2169e6f9f6de0e9ab187ab\"))
  (:FILE \"tests/codec/cbor-minimal-scan-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"0dfa785451fcfe573019531e00600cc6\"))
  (:FILE \"tests/codec/cbor-minimal-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"34587c10ac32129ac531e0a4f03df9a6\"))
  (:FILE \"tests/codec/cbor-minimal-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"4d7ec43e187859da277b8fb5f66f8e73\"))
  (:FILE \"tests/codec/cbor-minimal-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"9a6a26ae45747211bb795bc323b13770\"))
  (:FILE \"tests/codec/cbor-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"2311a15f8d4af90bf341e91e0e64342b\"))
  (:FILE \"tests/codec/cbor-simple-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"948bfe5924482cccb6624f91be6770e6\"))
  (:FILE \"tests/codec/cbor-simple-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"c4793e5b0e0192c0fe222351d6f1b599\"))
  (:FILE \"tests/codec/cbor-simple-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"808ed81b703fd2cf0ac11d148c3ffc08\"))
  (:FILE \"tests/codec/cbor-string-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6acef83c6cda7e326fd10b4a1d6d6fa6\"))
  (:FILE \"tests/codec/cbor-string-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"8abc0529f331d1fabdec79507cf296ef\"))
  (:FILE \"tests/codec/cbor-string-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"70d9d0d454dd1f296ef6989d3b928842\"))
  (:FILE \"tests/codec/cbor-structure-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"220d386d29b1fa192e06ceebe4ec245c\"))
  (:FILE \"tests/codec/cbor-structure-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"f38848c55b050dae335b0a37657c1f5c\"))
  (:FILE \"tests/codec/cbor-structure.lisp\" :MD5
   #A((32) BASE-CHAR . \"06e6f060aea55a18d06047e5ebabd18e\"))
  (:FILE \"tests/codec/cbor-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e5da97609a2ba58bb35fea24b7518d2b\"))
  (:FILE \"tests/codec/cbor-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"4d7d61509b2ce749fb2331ceeaeeca76\"))
  (:FILE \"tests/codec/cbor-write-roundtrip.lisp\" :MD5
   #A((32) BASE-CHAR . \"646944ef624c06fd86d6a1306041349d\"))
  (:FILE \"tests/codec/cbor-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"13382bdf23e5501e0ca349faf7b05062\"))
  (:FILE \"tests/codec/cbor-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"4926899e278afdd9577e5ef8262ba835\"))
  (:FILE \"tests/codec/cbor-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"dffa6e75d8c3d7f991f6c4460eb8b9bc\"))
  (:FILE \"tests/codec/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"32534fd42dd8124b50b45deefe143eaf\"))
  (:FILE \"tests/codec/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"a71504598cda8e99cd50e229ddd5275b\"))
  (:FILE \"tests/codec/utf8.lisp\" :MD5
   #A((32) BASE-CHAR . \"767ead15603be8dce90f340dbb200d8f\"))
  (:FILE \"tests/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"1d9133c5fd33cb60ff160f468db330f4\"))
  (:FILE \"tests/csn/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e5c151cda2e10e4f9cae46a4326699eb\"))
  (:FILE \"tests/csn/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"087108576603e6cd5b9af14b50475746\"))
  (:FILE \"tests/epochs/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe92ddd79dcaab3d3f7bdf387bf2295e\"))
  (:FILE \"tests/epochs/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"592a2fe2e22214c52d4672d26620980b\"))
  (:FILE \"tests/epochs/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"67cec074bf70074f7f2c6965ef494ba8\"))
  (:FILE \"tests/execution/handoff.lisp\" :MD5
   #A((32) BASE-CHAR . \"f87fdc0f7bd194329c6349026a2f35bb\"))
  (:FILE \"tests/execution/queue.lisp\" :MD5
   #A((32) BASE-CHAR . \"940ebb450bc871f8c2dd7dc9977bb158\"))
  (:FILE \"tests/execution/ready-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"4ccdc0512b3c81837726076d7c795930\"))
  (:FILE \"tests/execution/ready.lisp\" :MD5
   #A((32) BASE-CHAR . \"f6756125a9150b6312dad3e2705b74d3\"))
  (:FILE \"tests/execution/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"bacb1a135c0d73cded57ba21986c8496\"))
  (:FILE \"tests/execution/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"32b6a6578f526b7d4bcc3a1665a8c6e6\"))
  (:FILE \"tests/execution/worker.lisp\" :MD5
   #A((32) BASE-CHAR . \"bbaa592327d730fdae78cb881350efe0\"))
  (:FILE \"tests/foundation/batch.lisp\" :MD5
   #A((32) BASE-CHAR . \"29fc6a9711ea9265840e8cde4971f74e\"))
  (:FILE \"tests/foundation/binary.lisp\" :MD5
   #A((32) BASE-CHAR . \"07c4c9ac2177f22e5b7fb25f9867a133\"))
  (:FILE \"tests/foundation/record.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a84ca3aa74ab158c6b7d66886cf8b23\"))
  (:FILE \"tests/foundation/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"758adad069aec2f9dbe0635797314ff6\"))
  (:FILE \"tests/get-directory/construction.lisp\" :MD5
   #A((32) BASE-CHAR . \"1137938073e71d6d8d62c751fbad05d5\"))
  (:FILE \"tests/get-directory/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"d1ab36d05cc1266e4533d27c693f12f4\"))
  (:FILE \"tests/get-directory/series-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"486604b450bfe8de32feaed1a96dc0cc\"))
  (:FILE \"tests/get-directory/series-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"092192d05b3f85c6c283113c57c02f01\"))
  (:FILE \"tests/get-directory/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"3f868ebe4307ad4238b314c37eceed9a\"))
  (:FILE \"tests/get-directory/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"63dd01c852de1399c2c82274d481d257\"))
  (:FILE \"tests/get-performance/guards.lisp\" :MD5
   #A((32) BASE-CHAR . \"324c70304e678cbe022ff33c73f793e2\"))
  (:FILE \"tests/get-performance/paths.lisp\" :MD5
   #A((32) BASE-CHAR . \"eb48216a4b5baa9cf498968ee032b205\"))
  (:FILE \"tests/get-performance/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"1f5f9fa3ffcc3220f10b7a5f294ee6d9\"))
  (:FILE \"tests/get-performance/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"916e5740db5d52fdf6088694f34d11db\"))
  (:FILE \"tests/get-resolver/construction.lisp\" :MD5
   #A((32) BASE-CHAR . \"a64a6a5a34c8ec5f8c4ca4324cc348d2\"))
  (:FILE \"tests/get-resolver/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"e93c7dbf1bf2d7e99651b110a4e01661\"))
  (:FILE \"tests/get-resolver/sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"ffe3551bb49dd60d7d34213c9c93cf06\"))
  (:FILE \"tests/get-resolver/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"0738e161d276394a160a86ed139610f2\"))
  (:FILE \"tests/get/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"3a4bbc3fd3ede5a837f0c0f913637291\"))
  (:FILE \"tests/get/segment.lisp\" :MD5
   #A((32) BASE-CHAR . \"2f25d1904aa4960ce0d6351580a2bcc7\"))
  (:FILE \"tests/get/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"660783988d4f99d0e171bb59c79e3467\"))
  (:FILE \"tests/hash/guards.lisp\" :MD5
   #A((32) BASE-CHAR . \"a59d531a156fc49c39c9265075bd9600\"))
  (:FILE \"tests/hash/hash64.lisp\" :MD5
   #A((32) BASE-CHAR . \"443fdc895f2fa3620d2b1b4af5c32dc4\"))
  (:FILE \"tests/hash/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"40b223712554582c2910971a6b045149\"))
  (:FILE \"tests/hash/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"73ed0785ca1330d69ad336abc019a413\"))
  (:FILE \"tests/index/hash-digests.lisp\" :MD5
   #A((32) BASE-CHAR . \"91c1eda35e14276e795259bceac489be\"))
  (:FILE \"tests/index/primary-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"44e2635d88de3f6ccf69c684c3eff77b\"))
  (:FILE \"tests/index/primary-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"4d339c2f2680e66ac79ecd8d02c09382\"))
  (:FILE \"tests/index/primary.lisp\" :MD5
   #A((32) BASE-CHAR . \"6ed661242a86117dd2d696e374740a2f\"))
  (:FILE \"tests/index/rebuild.lisp\" :MD5
   #A((32) BASE-CHAR . \"262556582cc0c387d6c59b757d9956b1\"))
  (:FILE \"tests/index/slot-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6ed9249e2eaef3524260804ef7e02567\"))
  (:FILE \"tests/index/slot-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"e9b53e6eac6fc836e8243d41adbafea0\"))
  (:FILE \"tests/index/slots.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe094b4513ceabe8571031ac20935e48\"))
  (:FILE \"tests/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"1e6fd9ab36eb4e307207d371ed947757\"))
  (:FILE \"tests/io/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"a26526e87fe46794b8bbab1fdd46d68c\"))
  (:FILE \"tests/io/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab2fb36682dd8b8bc757e586ceb3be62\"))
  (:FILE \"tests/lint-fixtures/bad.lisp\" :MD5
   #A((32) BASE-CHAR . \"30f1396c941dd9b8a41ca15698b5a347\"))
  (:FILE \"tests/lint-fixtures/good.lisp\" :MD5
   #A((32) BASE-CHAR . \"f85250c3a057c851db6745b9eba27da1\"))
  (:FILE \"tests/lint-fixtures/keyword-barrier.lisp\" :MD5
   #A((32) BASE-CHAR . \"9f63fdfdf866f17d5491390b710ebb5e\"))
  (:FILE \"tests/lint-fixtures/qualified-reader.lisp\" :MD5
   #A((32) BASE-CHAR . \"7fc689336bb2041dfef4c22090bb7de4\"))
  (:FILE \"tests/mvcc/capture.lisp\" :MD5
   #A((32) BASE-CHAR . \"1f0309fa9258eb62a45167de5d2279d5\"))
  (:FILE \"tests/mvcc/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"341627288b50485858efedc207fc95b5\"))
  (:FILE \"tests/mvcc/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e7d26bd67650663c88ceda526023ae83\"))
  (:FILE \"tests/read/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"73dab63d8414998d72f6c14e0d62e3ac\"))
  (:FILE \"tests/read/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"0d5db03bd804747de7c309c82e40dd43\"))
  (:FILE \"tests/read/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"0cf2cad12c77c82b827da01782bc996d\"))
  (:FILE \"tests/recovery/corruption.lisp\" :MD5
   #A((32) BASE-CHAR . \"a369b8176d4e877ab546d17e983b94ed\"))
  (:FILE \"tests/recovery/decisions-audit.lisp\" :MD5
   #A((32) BASE-CHAR . \"33b98cf215d1ddb469d02cc6c0032bfe\"))
  (:FILE \"tests/recovery/decisions-radix.lisp\" :MD5
   #A((32) BASE-CHAR . \"58eec0feac01e643c76ad19ef5c07df5\"))
  (:FILE \"tests/recovery/decisions-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"80348d0ce2adbc8a4d37db49df291b1d\"))
  (:FILE \"tests/recovery/decisions.lisp\" :MD5
   #A((32) BASE-CHAR . \"5add0e087181bad8ce330af23fc26686\"))
  (:FILE \"tests/recovery/inventory-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"522afcdc6115fdd4d8fec0d06aab7354\"))
  (:FILE \"tests/recovery/inventory.lisp\" :MD5
   #A((32) BASE-CHAR . \"9c78925dd89e94d86a9f577e0225eeb3\"))
  (:FILE \"tests/recovery/manifest-audit.lisp\" :MD5
   #A((32) BASE-CHAR . \"3ca73a199708e2571da3a27e6dc00c76\"))
  (:FILE \"tests/recovery/manifest-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"3286e0dfb66496aafe8b6fbbdd92ab43\"))
  (:FILE \"tests/recovery/manifest.lisp\" :MD5
   #A((32) BASE-CHAR . \"b6bdcc4d20f7db14c0dc00d5258cbf8c\"))
  (:FILE \"tests/recovery/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"aa7af12d270673b62542d32ec60b361a\"))
  (:FILE \"tests/recovery/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"769bac1994a5e3d74bd56b510970bf9b\"))
  (:FILE \"tests/scheduler/controller.lisp\" :MD5
   #A((32) BASE-CHAR . \"bc20dcd712332fde961fb38e879392b5\"))
  (:FILE \"tests/scheduler/dispatch.lisp\" :MD5
   #A((32) BASE-CHAR . \"0235bb18cc7a6169e47d3aebf2438bdd\"))
  (:FILE \"tests/scheduler/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"1388f446bce5085439c2254edd165118\"))
  (:FILE \"tests/scheduler/pool-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"aaba914dea485f812a11767addb94c81\"))
  (:FILE \"tests/scheduler/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"34e51e369859bc1c731d73e43053b6f4\"))
  (:FILE \"tests/series/boundaries.lisp\" :MD5
   #A((32) BASE-CHAR . \"6967c7e6396b6df38c637f2d5d9ebfc0\"))
  (:FILE \"tests/series/controller.lisp\" :MD5
   #A((32) BASE-CHAR . \"a83818568a27c52d36365597d7113c09\"))
  (:FILE \"tests/series/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6aa566720d1476d13a0f7288be9e1346\"))
  (:FILE \"tests/series/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"67718445a8948da3c7875f6cc6b3e167\"))
  (:FILE \"tests/series/worker-bridge.lisp\" :MD5
   #A((32) BASE-CHAR . \"c714c8db7998acf60256b318488574d8\"))
  (:FILE \"tests/series/worker-routing.lisp\" :MD5
   #A((32) BASE-CHAR . \"f839733b6f5a4d9286a5cdd7ae9bcb55\"))
  (:FILE \"tests/smoke.lisp\" :MD5
   #A((32) BASE-CHAR . \"afb2e2bc7ff7249ebb2e1ccf0f87aaf3\"))
  (:FILE \"tests/storage/compaction-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb4acb5a73eb973f53ef337113880d32\"))
  (:FILE \"tests/storage/control-payload.lisp\" :MD5
   #A((32) BASE-CHAR . \"25f3c822273c898d2263ceb3db538cab\"))
  (:FILE \"tests/storage/log-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"eecb2fe94e710a918254e5ad453a0daa\"))
  (:FILE \"tests/storage/segment-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab2c52fb6b79702d50dcef6d12ca8906\"))
  (:FILE \"tests/storage/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"82a4dbb4767c17f9851143a637af3b83\"))
  (:FILE \"tests/wal/builder.lisp\" :MD5
   #A((32) BASE-CHAR . \"0d01e4e18c0a559873fce584a0ac91cd\"))
  (:FILE \"tests/wal/csn-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"ecb2cbf4f7ace32cdaff329476070d60\"))
  (:FILE \"tests/wal/csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"3e2dbc3319b611db090e27493a10fc2c\"))
  (:FILE \"tests/wal/fault.lisp\" :MD5
   #A((32) BASE-CHAR . \"00367366b82918614d84f517f4bb395e\"))
  (:FILE \"tests/wal/group.lisp\" :MD5
   #A((32) BASE-CHAR . \"0ee2462103a749b58488561aeacaac07\"))
  (:FILE \"tests/wal/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"0643b96c5ee339f9826b19150d065ddf\"))
  (:FILE \"tests/wal/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"15952f6b761acea4519abf701bb2346c\"))
  (:FILE \"tools/measure-pool-dispatch.lisp\" :MD5
   #A((32) BASE-CHAR . \"daea2e29c87593dcc7db9949b67ff4f6\")))
 :SOURCE-FINGERPRINTS-AFTER
 ((:FILE \"arcdocdb.asd\" :MD5
   #A((32) BASE-CHAR . \"d942157b93d69b3852e784a9a838fcb9\"))
  (:FILE \"tools/measure-pool-lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"72a85a626ffb60185baf7602d28517e9\"))
  (:FILE \"src/active/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"bf244695c3c14a1a0148517b48052f5d\"))
  (:FILE \"src/active/preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"0ce41661b5cd26fe2edb944cca142f98\"))
  (:FILE \"src/active/prepare.lisp\" :MD5
   #A((32) BASE-CHAR . \"e3238a39b721a3a5ac1055bc1a30feba\"))
  (:FILE \"src/active/source.lisp\" :MD5
   #A((32) BASE-CHAR . \"50c6d9f4e4eb68c8018acb6a3fe70c8e\"))
  (:FILE \"src/active/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe47862290f99d6217361f4302e2faf2\"))
  (:FILE \"src/cache/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"5d70197c8b64ad6f20c8be47a60c73ca\"))
  (:FILE \"src/cache/clock.lisp\" :MD5
   #A((32) BASE-CHAR . \"3546cf7f5c5ed138068548c20064f499\"))
  (:FILE \"src/cache/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"72f3a33ce27ddf94c49c495580520004\"))
  (:FILE \"src/cache/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1f6a8e7aa4faed88e984b39871d1e53\"))
  (:FILE \"src/cache/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"82f937b7b08bd1696ad9c88da2e1c60c\"))
  (:FILE \"src/cache/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a25648d870eaa4f0b6e1e3b2cf76e28e\"))
  (:FILE \"src/cache/write.lisp\" :MD5
   #A((32) BASE-CHAR . \"fc09021f74fb50aac57589614dae04d7\"))
  (:FILE \"src/codec/cbor-float-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"bc7a7b176e8cdd361b7c4306a1a4de4b\"))
  (:FILE \"src/codec/cbor-float-narrow.lisp\" :MD5
   #A((32) BASE-CHAR . \"c15cc9d91355860357ed434e58d1f4cb\"))
  (:FILE \"src/codec/cbor-float-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"f3b22be81a36e1713c34e890c82c6700\"))
  (:FILE \"src/codec/cbor-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"6e8c6a49314c2f460aa6f8a1759200b6\"))
  (:FILE \"src/codec/cbor-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"ecd8fe950344059c629927b38fb6e4aa\"))
  (:FILE \"src/codec/cbor-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"2dee1a475a1c6edb13b60430fbc0668e\"))
  (:FILE \"src/codec/cbor-scan-input.lisp\" :MD5
   #A((32) BASE-CHAR . \"f6488e987889432b375254021825dbe5\"))
  (:FILE \"src/codec/cbor-scan-items.lisp\" :MD5
   #A((32) BASE-CHAR . \"706c0baa4158bf272c4b0df17c1439d2\"))
  (:FILE \"src/codec/cbor-scan-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"987e8ed576a21eb644ac1ef2e06edbda\"))
  (:FILE \"src/codec/cbor-scan-stack.lisp\" :MD5
   #A((32) BASE-CHAR . \"cf1999ddb10f879aeefbeea853742d57\"))
  (:FILE \"src/codec/cbor-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"0c33aedcdb352e78a3c694cf796e6692\"))
  (:FILE \"src/codec/cbor-simple-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"200373402e6e082dd8c7afde305302bb\"))
  (:FILE \"src/codec/cbor-space.lisp\" :MD5
   #A((32) BASE-CHAR . \"c33cdcc45f45218aa3e8bf26ce0ee575\"))
  (:FILE \"src/codec/cbor-string-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"b13e92b5f24a42fe283c17b649722b6a\"))
  (:FILE \"src/codec/cbor-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"69e77bcd15b5413a815a65c5081229db\"))
  (:FILE \"src/codec/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d885bd2a9860eb60aec1a775e5031d5e\"))
  (:FILE \"src/codec/utf8.lisp\" :MD5
   #A((32) BASE-CHAR . \"0f67dd5c51bf6a63bc292ab4e2a280c2\"))
  (:FILE \"src/control/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"8f3dc4a9657b6bb760e31c46c1e7b986\"))
  (:FILE \"src/control/dependency.lisp\" :MD5
   #A((32) BASE-CHAR . \"22ae34181e8ab96d8c8ecab050a1a19e\"))
  (:FILE \"src/control/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"3cedb51e60b92524cd8208e4bfb2c3ba\"))
  (:FILE \"src/control/preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"2dfc2b76c1d3c382db8b50071bdaeadf\"))
  (:FILE \"src/control/prepare.lisp\" :MD5
   #A((32) BASE-CHAR . \"9df8dc8a19d2a4bc700adfed763c27fa\"))
  (:FILE \"src/control/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"468fcf430eede17a38b922dfd373a746\"))
  (:FILE \"src/control/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d15317bafcdb12ea579b2f482dff57c\"))
  (:FILE \"src/csn/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1130012fc5613a5648d22ed8628be0e8\"))
  (:FILE \"src/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1cdb5661fc54beba5bf00e4765f3235\"))
  (:FILE \"src/dispatch/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"ba4cd961094f37a157d49b8d7024b677\"))
  (:FILE \"src/dispatch/claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"b10caeff4f726c0ebd01e2c6d1baacba\"))
  (:FILE \"src/dispatch/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"46e12ac1f6ab8591bac6467f724538a2\"))
  (:FILE \"src/dispatch/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"36db6694bc70963149b8068ae7ab96ec\"))
  (:FILE \"src/epochs/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"765d14c88cd288093a77a57930cd6999\"))
  (:FILE \"src/epochs/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"875201dfab0a84efd40fe9828cc293c8\"))
  (:FILE \"src/epochs/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"975b5f74e0c5a38ce978f4d9c7fcc6b8\"))
  (:FILE \"src/epochs/reclaim.lisp\" :MD5
   #A((32) BASE-CHAR . \"036dd02adf87d33c3ae2f40735c733fa\"))
  (:FILE \"src/epochs/retire.lisp\" :MD5
   #A((32) BASE-CHAR . \"653b974f310c09f6e2224a84acc43bbf\"))
  (:FILE \"src/epochs/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"82253491f995f5bc153fb5ebf30d564c\"))
  (:FILE \"src/execution/handoff.lisp\" :MD5
   #A((32) BASE-CHAR . \"6b85eebe69366e78ed5fc5cc20735f00\"))
  (:FILE \"src/execution/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb5710d6c111cadb7121a50998a747fa\"))
  (:FILE \"src/execution/queue.lisp\" :MD5
   #A((32) BASE-CHAR . \"8202843bddb817da4279ac959ae3f3c4\"))
  (:FILE \"src/execution/ready-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"38d26f8c749dd946dfc4b9c57103a892\"))
  (:FILE \"src/execution/ready-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a64d98c9ff429d6103d6e10ee1fd7980\"))
  (:FILE \"src/execution/ready.lisp\" :MD5
   #A((32) BASE-CHAR . \"2c1892002f0599bb8273093031017520\"))
  (:FILE \"src/execution/worker-boundary.lisp\" :MD5
   #A((32) BASE-CHAR . \"c24065d6c8d80d1be53994a0041743df\"))
  (:FILE \"src/execution/worker-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"babd0a78b4185af24ae1fef870c0fabb\"))
  (:FILE \"src/execution/worker-run.lisp\" :MD5
   #A((32) BASE-CHAR . \"aa34ca6bc07535e35fea723878d99f66\"))
  (:FILE \"src/execution/worker-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"0679ee07c46f69db330706303c70d8d2\"))
  (:FILE \"src/execution/writer.lisp\" :MD5
   #A((32) BASE-CHAR . \"73019644090e2971f2b54dc36e4491f5\"))
  (:FILE \"src/foundation/batch.lisp\" :MD5
   #A((32) BASE-CHAR . \"ca642ea47e4bff76f78f5b6d7287d6bd\"))
  (:FILE \"src/foundation/binary.lisp\" :MD5
   #A((32) BASE-CHAR . \"a06115175f450776762761dce25acdb8\"))
  (:FILE \"src/foundation/conditions.lisp\" :MD5
   #A((32) BASE-CHAR . \"942b596396c19815290a57830af2121b\"))
  (:FILE \"src/foundation/crc32c.lisp\" :MD5
   #A((32) BASE-CHAR . \"4db58e2f48bf77d751f1b83bb9f84b5c\"))
  (:FILE \"src/foundation/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"5ee593a112958d94163dab17c5aa4ba2\"))
  (:FILE \"src/foundation/record.lisp\" :MD5
   #A((32) BASE-CHAR . \"c3ed0f09fa3fa6fe20c98e2ed6e69abe\"))
  (:FILE \"src/get-directory/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"cde24b2bf5c5637d5501b95bed47df31\"))
  (:FILE \"src/get-directory/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a05062f6ab6d5ebdfdde37e336dfce6\"))
  (:FILE \"src/get-directory/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"74a694385f1aaf03ec87721545494119\"))
  (:FILE \"src/get-directory/sources-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"2b8193aab6801de19e26fa55e7c53f87\"))
  (:FILE \"src/get-directory/sources-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"7bac02a80ddc22c622f8465642385ae8\"))
  (:FILE \"src/get-directory/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"17c957d6934a31f4ed64313e756de2d2\"))
  (:FILE \"src/get-resolver/active-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"c65593cf172f53a8e90a853bbe9504c2\"))
  (:FILE \"src/get-resolver/active-directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"6d95f29b331d335175843f47ae44a6ea\"))
  (:FILE \"src/get-resolver/active-init.lisp\" :MD5
   #A((32) BASE-CHAR . \"7ca975d2534f43c8018d36ecd7c2b042\"))
  (:FILE \"src/get-resolver/active-preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"f13d422adb6aa9e8489352884137f25a\"))
  (:FILE \"src/get-resolver/active-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"521737861e057d663964b0c030552587\"))
  (:FILE \"src/get-resolver/active-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6aaec49504a96f37c8ff1bc182c977b\"))
  (:FILE \"src/get-resolver/active-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"60bb258cf4cc7f50c5c1206af1bb5800\"))
  (:FILE \"src/get-resolver/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"bbfb2082103e6712419e180ab972245c\"))
  (:FILE \"src/get-resolver/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"263525e8274a8f46ce58a4a0ad6841a2\"))
  (:FILE \"src/get-resolver/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"1339edff0223dbf122f11ff0adbba61c\"))
  (:FILE \"src/get-resolver/rows.lisp\" :MD5
   #A((32) BASE-CHAR . \"ca9002b81efd0aed9761cd1f78514762\"))
  (:FILE \"src/get-resolver/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"536e9dc4ed51072b8a6d1528d3ec18bf\"))
  (:FILE \"src/get-resolver/sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d869293ba47444c4721713d955c6254\"))
  (:FILE \"src/get-resolver/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"9df13bcc6908e9fa601d173a671e1ccf\"))
  (:FILE \"src/get/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"c5cc36884b238221cc13ca0c087ec7c2\"))
  (:FILE \"src/get/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"e70bfeddd694336bbd088e65f8761834\"))
  (:FILE \"src/get/lookup.lisp\" :MD5
   #A((32) BASE-CHAR . \"82258ec87aca513a508bc5dee8410dd6\"))
  (:FILE \"src/get/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"c72633d15c3488699072eb610ebde7c8\"))
  (:FILE \"src/get/segment.lisp\" :MD5
   #A((32) BASE-CHAR . \"811869eb6a197d3c4e26af4322e52652\"))
  (:FILE \"src/get/target.lisp\" :MD5
   #A((32) BASE-CHAR . \"1b70dac05d6d2418909eb5105b808e81\"))
  (:FILE \"src/get/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"c394e5684de5e2d938991c7cb348b93c\"))
  (:FILE \"src/hash/arithmetic.lisp\" :MD5
   #A((32) BASE-CHAR . \"b5c51802e607e3dd22de68204baf64e9\"))
  (:FILE \"src/hash/blocks.lisp\" :MD5
   #A((32) BASE-CHAR . \"bef497b9a267c7306d4100000491c814\"))
  (:FILE \"src/hash/hash64.lisp\" :MD5
   #A((32) BASE-CHAR . \"886b7c08b9929283e8968831cbe5c039\"))
  (:FILE \"src/hash/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d9060e41bc5252067d35e59ac70ee06\"))
  (:FILE \"src/index/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"65076c355c099b5dc73d185948d3bec4\"))
  (:FILE \"src/index/hash-digests.lisp\" :MD5
   #A((32) BASE-CHAR . \"43d2209225707352daec6186ef95a805\"))
  (:FILE \"src/index/hash-seed.lisp\" :MD5
   #A((32) BASE-CHAR . \"45ce41749bc6fa638539815d3f802b96\"))
  (:FILE \"src/index/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"598a9b65e73151c924b2cdcaf6d96705\"))
  (:FILE \"src/index/primary-arena.lisp\" :MD5
   #A((32) BASE-CHAR . \"a319691e3e28b7ea7b927de490cf69ba\"))
  (:FILE \"src/index/primary-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"ff2cfbb865290d7a1510fdf6877c7229\"))
  (:FILE \"src/index/primary-core.lisp\" :MD5
   #A((32) BASE-CHAR . \"fa52433eae199ceeb874bf2bc47afca7\"))
  (:FILE \"src/index/primary-directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"1dd67c527257e43f17e006644ecdbd00\"))
  (:FILE \"src/index/primary-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d65cfce399b04f905bf969929962e59a\"))
  (:FILE \"src/index/primary-probe.lisp\" :MD5
   #A((32) BASE-CHAR . \"699ce3f1615296fc27fcde3e0d63a4bc\"))
  (:FILE \"src/index/primary-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"3f317a0d3c5ee86a73651aad36135cc3\"))
  (:FILE \"src/index/primary-relocate.lisp\" :MD5
   #A((32) BASE-CHAR . \"5155959766645d3172ae5e73c58cc071\"))
  (:FILE \"src/index/primary-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a59eab6425a60fa2656f86bf87d5c9ac\"))
  (:FILE \"src/index/primary-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"e8e31e599356e592af29c0cc4604872b\"))
  (:FILE \"src/index/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"5b22b90cfe8534086f6aff96d156713e\"))
  (:FILE \"src/index/rebuild-budget.lisp\" :MD5
   #A((32) BASE-CHAR . \"0417dd41cb3ec1d62dfd913c19f810ad\"))
  (:FILE \"src/index/rebuild-copy.lisp\" :MD5
   #A((32) BASE-CHAR . \"8befbbd00ed5c31c1487a11887eba495\"))
  (:FILE \"src/index/rebuild-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"1188e7a64a7a5d9482c1233cb9acb452\"))
  (:FILE \"src/index/rebuild.lisp\" :MD5
   #A((32) BASE-CHAR . \"a450cac8071513365267e7024cbe94b0\"))
  (:FILE \"src/index/relocate.lisp\" :MD5
   #A((32) BASE-CHAR . \"475dd7d5809a836f01544b447cc8df27\"))
  (:FILE \"src/index/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"5157fd03ee806ee998ad8f0002d56268\"))
  (:FILE \"src/index/validation.lisp\" :MD5
   #A((32) BASE-CHAR . \"3384cadf737c7d80c004222022a281f6\"))
  (:FILE \"src/index/write.lisp\" :MD5
   #A((32) BASE-CHAR . \"f0c8c579cd7db466d243ed3ea9f8e8aa\"))
  (:FILE \"src/io/flush.lisp\" :MD5
   #A((32) BASE-CHAR . \"716866194d6b9f076e102e84187229c0\"))
  (:FILE \"src/io/identity-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"d354a095fb378c1b6f27397ffb902227\"))
  (:FILE \"src/io/identity.lisp\" :MD5
   #A((32) BASE-CHAR . \"4e03b14a0c5015dc6ec897221c9f0eb5\"))
  (:FILE \"src/io/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"11c7103efbe733bbf0a13927f23c3d34\"))
  (:FILE \"src/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"58030bc0c811248a6537e2909d8762d6\"))
  (:FILE \"src/io/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"7aafde7081a3804862c3acf446e6e385\"))
  (:FILE \"src/io/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"2f8bd851d09ab994d8d01b231697d1a1\"))
  (:FILE \"src/io/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"e7b6ee5fd2d57281dbd32bf9b07d0fa6\"))
  (:FILE \"src/mvcc/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"f188d1dbd5d0adb49f53acf09157aef9\"))
  (:FILE \"src/mvcc/snapshots-core.lisp\" :MD5
   #A((32) BASE-CHAR . \"8bb066aab61a18eff175b9edb11e42a2\"))
  (:FILE \"src/mvcc/snapshots-csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"0e9365e674d1584b111f915ce1f58634\"))
  (:FILE \"src/mvcc/snapshots-lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"ff98aea5cb9a7ae2671f6a887a003725\"))
  (:FILE \"src/mvcc/snapshots-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"ae3ad96269b5e711a9dbb455f3c0ce48\"))
  (:FILE \"src/mvcc/snapshots-register.lisp\" :MD5
   #A((32) BASE-CHAR . \"2d5a795bcefd605c75da91c725ae83a2\"))
  (:FILE \"src/mvcc/snapshots-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"475517bd7ba04a1c37a82efeb8ff73d9\"))
  (:FILE \"src/mvcc/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"a9bc70eab6720b5c6f8503178e2c966b\"))
  (:FILE \"src/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"becf5c78049c85f2c05cd1ef54454032\"))
  (:FILE \"src/read/core.lisp\" :MD5
   #A((32) BASE-CHAR . \"4040905f4a64ba704a480d82e87ec748\"))
  (:FILE \"src/read/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"7d74d9decc5a0bc9f9331d89bd503e21\"))
  (:FILE \"src/read/task.lisp\" :MD5
   #A((32) BASE-CHAR . \"9e0baf22c53329d393e047c669679645\"))
  (:FILE \"src/read/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"9c37ff8237fcc9fe9ae4f44316e854e3\"))
  (:FILE \"src/recovery/decisions-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"1a51ef4a488bb9fde2ff7d47bae01379\"))
  (:FILE \"src/recovery/decisions-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"cbdc30f93109c474e1fc25066c9b9b13\"))
  (:FILE \"src/recovery/decisions-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"f782d1137b8ce342b91c9999cfb7accc\"))
  (:FILE \"src/recovery/decisions-radix.lisp\" :MD5
   #A((32) BASE-CHAR . \"852149de4c289b8e067602780378d87a\"))
  (:FILE \"src/recovery/decisions-sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"b33e57a643f2fca810846f6226366253\"))
  (:FILE \"src/recovery/decisions-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f4433fd19ebc7239dbc2628c39f3ecdb\"))
  (:FILE \"src/recovery/inventory-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"9bd6820c4feba3e552aab1a4edd87861\"))
  (:FILE \"src/recovery/inventory-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"fcea263de1938767772e5b11411ecd5e\"))
  (:FILE \"src/recovery/inventory-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"78c136d5838dcfe3019d9069643a8d8f\"))
  (:FILE \"src/recovery/manifest-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"bf65b1731eab6e0572461ef5cc60fc40\"))
  (:FILE \"src/recovery/manifest-decode.lisp\" :MD5
   #A((32) BASE-CHAR . \"67975249aaabd751757cdfb9222cc3c4\"))
  (:FILE \"src/recovery/manifest-fold.lisp\" :MD5
   #A((32) BASE-CHAR . \"e0d2498db1011e857b7b0daa1934f187\"))
  (:FILE \"src/recovery/manifest-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"37ace42844c11b52446ee1fc500b8e0b\"))
  (:FILE \"src/recovery/manifest-query.lisp\" :MD5
   #A((32) BASE-CHAR . \"ebd7a54adea2213294a887e6d4db0927\"))
  (:FILE \"src/recovery/manifest-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"7b1d4054415faca7e5fca59ad83b4d4a\"))
  (:FILE \"src/recovery/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1c1c8ad0cd15b1703a2fe19cbf3f13c2\"))
  (:FILE \"src/recovery/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"fcacd15460db25ea9cc4036065f9f096\"))
  (:FILE \"src/scheduler/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"36c5ae2dd08fbe546f4392b7b12102ec\"))
  (:FILE \"src/scheduler/lifecycle-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"1c4a4fd316ef034c298db47dfca1daca\"))
  (:FILE \"src/scheduler/lifecycle-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"19c8be44863be30c07bb72fe3fac2a99\"))
  (:FILE \"src/scheduler/lifecycle-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"fa2f88c50dfec24af40af091f9221590\"))
  (:FILE \"src/scheduler/lifecycle-update.lisp\" :MD5
   #A((32) BASE-CHAR . \"40a78461f91616a935a39f29b87680c8\"))
  (:FILE \"src/scheduler/lifecycle-worker.lisp\" :MD5
   #A((32) BASE-CHAR . \"9d7cdf45c1b594fef5af735ec0955c05\"))
  (:FILE \"src/scheduler/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"0578c541b6ddfaf8827240e967ff76ea\"))
  (:FILE \"src/scheduler/policy.lisp\" :MD5
   #A((32) BASE-CHAR . \"1721005a7545b36df601d75252638eba\"))
  (:FILE \"src/scheduler/pool-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"c4995b29d40caa2ee29aa0c167885287\"))
  (:FILE \"src/scheduler/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"170dfc36aef6a3d78f980fbcc37f0176\"))
  (:FILE \"src/scheduler/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"981f9f6db268cd9a46d4239c677c5d5b\"))
  (:FILE \"src/scheduler/update.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a43e6b400b701c69286357ef85469fc\"))
  (:FILE \"src/series/events.lisp\" :MD5
   #A((32) BASE-CHAR . \"32b2156739a6f2ca996abb91df0a2603\"))
  (:FILE \"src/series/io-events.lisp\" :MD5
   #A((32) BASE-CHAR . \"b6026a8b7bb64b45c37a65effda70d8e\"))
  (:FILE \"src/series/ownership.lisp\" :MD5
   #A((32) BASE-CHAR . \"de1aca16a35d34d16aba12ff541c0d2b\"))
  (:FILE \"src/series/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"09653c7479e1498d1545f3f1f0ffd755\"))
  (:FILE \"src/series/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6977aba53c811ec3a373226f9f53795\"))
  (:FILE \"src/series/query.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb0d91405325b508e6b2ab24d178de7a\"))
  (:FILE \"src/series/retirement.lisp\" :MD5
   #A((32) BASE-CHAR . \"b8e04971b8ad75a1bd0c722997badfd2\"))
  (:FILE \"src/series/routing-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6924deff152b941bd49f0bb200b4197\"))
  (:FILE \"src/series/routing-select.lisp\" :MD5
   #A((32) BASE-CHAR . \"e0f987d8767744050ec4d1b3ecb699ed\"))
  (:FILE \"src/series/routing-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"ce649df47dd38888d5103c98345f7e41\"))
  (:FILE \"src/series/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab19ec8d15af91511e817858c41cebc8\"))
  (:FILE \"src/series/worker-boundary.lisp\" :MD5
   #A((32) BASE-CHAR . \"2340e0c9074f7b1bf80c74f774986bc5\"))
  (:FILE \"src/series/worker-package.lisp\" :MD5
   #A((32) BASE-CHAR . \"a93ce2e84e8aee647b5083ad1d2b899b\"))
  (:FILE \"src/series/worker-run.lisp\" :MD5
   #A((32) BASE-CHAR . \"f0fee18adf357bad98e8a3c3e8c70c0c\"))
  (:FILE \"src/series/worker-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"2b23d468be0165fa009c5ebd5d1bbe23\"))
  (:FILE \"src/storage/compaction-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"1cda77a357ab2147035993b72d135a37\"))
  (:FILE \"src/storage/control-payload.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb64f806b8d69eb42d865b4abfff0b27\"))
  (:FILE \"src/storage/formats.lisp\" :MD5
   #A((32) BASE-CHAR . \"061147be459d8d3b08c661bd3f91d152\"))
  (:FILE \"src/storage/log-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"b53d27dcc9f4badf18b50519c50bc614\"))
  (:FILE \"src/storage/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"f86bd104f20616a76b42c02227f72844\"))
  (:FILE \"src/storage/payload-record.lisp\" :MD5
   #A((32) BASE-CHAR . \"8c03f9c01dcb30f2d3970a5694968ecf\"))
  (:FILE \"src/storage/payload-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"c4ece3c4fa8d9492d2a80df7c0a4f5a0\"))
  (:FILE \"src/storage/segment-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6812fa59bf8fd1252fbf85a9bfa3896\"))
  (:FILE \"src/wal/builder.lisp\" :MD5
   #A((32) BASE-CHAR . \"a229f76f7036f3573a6e528dcd390a19\"))
  (:FILE \"src/wal/csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"42b990e3b254e6fb488c0ab91b6a6502\"))
  (:FILE \"src/wal/executor.lisp\" :MD5
   #A((32) BASE-CHAR . \"c0340924c9130e14d0e8efedeec078f1\"))
  (:FILE \"src/wal/group.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a0e7c99ab70b4720cbb091156560f5e\"))
  (:FILE \"src/wal/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"96c41b1d417135a24fc65659ea3abe11\"))
  (:FILE \"src/wal/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f799f27a8ac1a4c736c04796c1e543f9\"))
  (:FILE \"tests/codec/cbor-float-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"425bfed06e37f409d59d0f5f029af196\"))
  (:FILE \"tests/codec/cbor-float-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"a8f6600ec087c10e5ec0a43d43edade4\"))
  (:FILE \"tests/codec/cbor-float-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"e62412cb0e838b241383a5c9103dd2c2\"))
  (:FILE \"tests/codec/cbor-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"208ee0d03652de67ad453bdd34d10b62\"))
  (:FILE \"tests/codec/cbor-minimal-edges.lisp\" :MD5
   #A((32) BASE-CHAR . \"392d402b44d04a9ce1c95fef4c4e8bf9\"))
  (:FILE \"tests/codec/cbor-minimal-scan-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"16954ef22a2169e6f9f6de0e9ab187ab\"))
  (:FILE \"tests/codec/cbor-minimal-scan-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"0dfa785451fcfe573019531e00600cc6\"))
  (:FILE \"tests/codec/cbor-minimal-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"34587c10ac32129ac531e0a4f03df9a6\"))
  (:FILE \"tests/codec/cbor-minimal-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"4d7ec43e187859da277b8fb5f66f8e73\"))
  (:FILE \"tests/codec/cbor-minimal-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"9a6a26ae45747211bb795bc323b13770\"))
  (:FILE \"tests/codec/cbor-minimal.lisp\" :MD5
   #A((32) BASE-CHAR . \"2311a15f8d4af90bf341e91e0e64342b\"))
  (:FILE \"tests/codec/cbor-simple-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"948bfe5924482cccb6624f91be6770e6\"))
  (:FILE \"tests/codec/cbor-simple-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"c4793e5b0e0192c0fe222351d6f1b599\"))
  (:FILE \"tests/codec/cbor-simple-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"808ed81b703fd2cf0ac11d148c3ffc08\"))
  (:FILE \"tests/codec/cbor-string-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6acef83c6cda7e326fd10b4a1d6d6fa6\"))
  (:FILE \"tests/codec/cbor-string-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"8abc0529f331d1fabdec79507cf296ef\"))
  (:FILE \"tests/codec/cbor-string-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"70d9d0d454dd1f296ef6989d3b928842\"))
  (:FILE \"tests/codec/cbor-structure-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"220d386d29b1fa192e06ceebe4ec245c\"))
  (:FILE \"tests/codec/cbor-structure-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"f38848c55b050dae335b0a37657c1f5c\"))
  (:FILE \"tests/codec/cbor-structure.lisp\" :MD5
   #A((32) BASE-CHAR . \"06e6f060aea55a18d06047e5ebabd18e\"))
  (:FILE \"tests/codec/cbor-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e5da97609a2ba58bb35fea24b7518d2b\"))
  (:FILE \"tests/codec/cbor-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"4d7d61509b2ce749fb2331ceeaeeca76\"))
  (:FILE \"tests/codec/cbor-write-roundtrip.lisp\" :MD5
   #A((32) BASE-CHAR . \"646944ef624c06fd86d6a1306041349d\"))
  (:FILE \"tests/codec/cbor-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"13382bdf23e5501e0ca349faf7b05062\"))
  (:FILE \"tests/codec/cbor-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"4926899e278afdd9577e5ef8262ba835\"))
  (:FILE \"tests/codec/cbor-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"dffa6e75d8c3d7f991f6c4460eb8b9bc\"))
  (:FILE \"tests/codec/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"32534fd42dd8124b50b45deefe143eaf\"))
  (:FILE \"tests/codec/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"a71504598cda8e99cd50e229ddd5275b\"))
  (:FILE \"tests/codec/utf8.lisp\" :MD5
   #A((32) BASE-CHAR . \"767ead15603be8dce90f340dbb200d8f\"))
  (:FILE \"tests/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"1d9133c5fd33cb60ff160f468db330f4\"))
  (:FILE \"tests/csn/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e5c151cda2e10e4f9cae46a4326699eb\"))
  (:FILE \"tests/csn/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"087108576603e6cd5b9af14b50475746\"))
  (:FILE \"tests/epochs/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe92ddd79dcaab3d3f7bdf387bf2295e\"))
  (:FILE \"tests/epochs/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"592a2fe2e22214c52d4672d26620980b\"))
  (:FILE \"tests/epochs/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"67cec074bf70074f7f2c6965ef494ba8\"))
  (:FILE \"tests/execution/handoff.lisp\" :MD5
   #A((32) BASE-CHAR . \"f87fdc0f7bd194329c6349026a2f35bb\"))
  (:FILE \"tests/execution/queue.lisp\" :MD5
   #A((32) BASE-CHAR . \"940ebb450bc871f8c2dd7dc9977bb158\"))
  (:FILE \"tests/execution/ready-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"4ccdc0512b3c81837726076d7c795930\"))
  (:FILE \"tests/execution/ready.lisp\" :MD5
   #A((32) BASE-CHAR . \"f6756125a9150b6312dad3e2705b74d3\"))
  (:FILE \"tests/execution/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"bacb1a135c0d73cded57ba21986c8496\"))
  (:FILE \"tests/execution/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"32b6a6578f526b7d4bcc3a1665a8c6e6\"))
  (:FILE \"tests/execution/worker.lisp\" :MD5
   #A((32) BASE-CHAR . \"bbaa592327d730fdae78cb881350efe0\"))
  (:FILE \"tests/foundation/batch.lisp\" :MD5
   #A((32) BASE-CHAR . \"29fc6a9711ea9265840e8cde4971f74e\"))
  (:FILE \"tests/foundation/binary.lisp\" :MD5
   #A((32) BASE-CHAR . \"07c4c9ac2177f22e5b7fb25f9867a133\"))
  (:FILE \"tests/foundation/record.lisp\" :MD5
   #A((32) BASE-CHAR . \"7a84ca3aa74ab158c6b7d66886cf8b23\"))
  (:FILE \"tests/foundation/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"758adad069aec2f9dbe0635797314ff6\"))
  (:FILE \"tests/get-directory/construction.lisp\" :MD5
   #A((32) BASE-CHAR . \"1137938073e71d6d8d62c751fbad05d5\"))
  (:FILE \"tests/get-directory/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"d1ab36d05cc1266e4533d27c693f12f4\"))
  (:FILE \"tests/get-directory/series-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"486604b450bfe8de32feaed1a96dc0cc\"))
  (:FILE \"tests/get-directory/series-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"092192d05b3f85c6c283113c57c02f01\"))
  (:FILE \"tests/get-directory/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"3f868ebe4307ad4238b314c37eceed9a\"))
  (:FILE \"tests/get-directory/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"63dd01c852de1399c2c82274d481d257\"))
  (:FILE \"tests/get-performance/guards.lisp\" :MD5
   #A((32) BASE-CHAR . \"324c70304e678cbe022ff33c73f793e2\"))
  (:FILE \"tests/get-performance/paths.lisp\" :MD5
   #A((32) BASE-CHAR . \"eb48216a4b5baa9cf498968ee032b205\"))
  (:FILE \"tests/get-performance/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"1f5f9fa3ffcc3220f10b7a5f294ee6d9\"))
  (:FILE \"tests/get-performance/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"916e5740db5d52fdf6088694f34d11db\"))
  (:FILE \"tests/get-resolver/construction.lisp\" :MD5
   #A((32) BASE-CHAR . \"a64a6a5a34c8ec5f8c4ca4324cc348d2\"))
  (:FILE \"tests/get-resolver/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"e93c7dbf1bf2d7e99651b110a4e01661\"))
  (:FILE \"tests/get-resolver/sort.lisp\" :MD5
   #A((32) BASE-CHAR . \"ffe3551bb49dd60d7d34213c9c93cf06\"))
  (:FILE \"tests/get-resolver/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"0738e161d276394a160a86ed139610f2\"))
  (:FILE \"tests/get/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"3a4bbc3fd3ede5a837f0c0f913637291\"))
  (:FILE \"tests/get/segment.lisp\" :MD5
   #A((32) BASE-CHAR . \"2f25d1904aa4960ce0d6351580a2bcc7\"))
  (:FILE \"tests/get/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"660783988d4f99d0e171bb59c79e3467\"))
  (:FILE \"tests/hash/guards.lisp\" :MD5
   #A((32) BASE-CHAR . \"a59d531a156fc49c39c9265075bd9600\"))
  (:FILE \"tests/hash/hash64.lisp\" :MD5
   #A((32) BASE-CHAR . \"443fdc895f2fa3620d2b1b4af5c32dc4\"))
  (:FILE \"tests/hash/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"40b223712554582c2910971a6b045149\"))
  (:FILE \"tests/hash/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"73ed0785ca1330d69ad336abc019a413\"))
  (:FILE \"tests/index/hash-digests.lisp\" :MD5
   #A((32) BASE-CHAR . \"91c1eda35e14276e795259bceac489be\"))
  (:FILE \"tests/index/primary-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"44e2635d88de3f6ccf69c684c3eff77b\"))
  (:FILE \"tests/index/primary-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"4d339c2f2680e66ac79ecd8d02c09382\"))
  (:FILE \"tests/index/primary.lisp\" :MD5
   #A((32) BASE-CHAR . \"6ed661242a86117dd2d696e374740a2f\"))
  (:FILE \"tests/index/rebuild.lisp\" :MD5
   #A((32) BASE-CHAR . \"262556582cc0c387d6c59b757d9956b1\"))
  (:FILE \"tests/index/slot-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6ed9249e2eaef3524260804ef7e02567\"))
  (:FILE \"tests/index/slot-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"e9b53e6eac6fc836e8243d41adbafea0\"))
  (:FILE \"tests/index/slots.lisp\" :MD5
   #A((32) BASE-CHAR . \"fe094b4513ceabe8571031ac20935e48\"))
  (:FILE \"tests/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"1e6fd9ab36eb4e307207d371ed947757\"))
  (:FILE \"tests/io/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"a26526e87fe46794b8bbab1fdd46d68c\"))
  (:FILE \"tests/io/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab2fb36682dd8b8bc757e586ceb3be62\"))
  (:FILE \"tests/lint-fixtures/bad.lisp\" :MD5
   #A((32) BASE-CHAR . \"30f1396c941dd9b8a41ca15698b5a347\"))
  (:FILE \"tests/lint-fixtures/good.lisp\" :MD5
   #A((32) BASE-CHAR . \"f85250c3a057c851db6745b9eba27da1\"))
  (:FILE \"tests/lint-fixtures/keyword-barrier.lisp\" :MD5
   #A((32) BASE-CHAR . \"9f63fdfdf866f17d5491390b710ebb5e\"))
  (:FILE \"tests/lint-fixtures/qualified-reader.lisp\" :MD5
   #A((32) BASE-CHAR . \"7fc689336bb2041dfef4c22090bb7de4\"))
  (:FILE \"tests/mvcc/capture.lisp\" :MD5
   #A((32) BASE-CHAR . \"1f0309fa9258eb62a45167de5d2279d5\"))
  (:FILE \"tests/mvcc/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"341627288b50485858efedc207fc95b5\"))
  (:FILE \"tests/mvcc/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"e7d26bd67650663c88ceda526023ae83\"))
  (:FILE \"tests/read/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"73dab63d8414998d72f6c14e0d62e3ac\"))
  (:FILE \"tests/read/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"0d5db03bd804747de7c309c82e40dd43\"))
  (:FILE \"tests/read/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"0cf2cad12c77c82b827da01782bc996d\"))
  (:FILE \"tests/recovery/corruption.lisp\" :MD5
   #A((32) BASE-CHAR . \"a369b8176d4e877ab546d17e983b94ed\"))
  (:FILE \"tests/recovery/decisions-audit.lisp\" :MD5
   #A((32) BASE-CHAR . \"33b98cf215d1ddb469d02cc6c0032bfe\"))
  (:FILE \"tests/recovery/decisions-radix.lisp\" :MD5
   #A((32) BASE-CHAR . \"58eec0feac01e643c76ad19ef5c07df5\"))
  (:FILE \"tests/recovery/decisions-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"80348d0ce2adbc8a4d37db49df291b1d\"))
  (:FILE \"tests/recovery/decisions.lisp\" :MD5
   #A((32) BASE-CHAR . \"5add0e087181bad8ce330af23fc26686\"))
  (:FILE \"tests/recovery/inventory-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"522afcdc6115fdd4d8fec0d06aab7354\"))
  (:FILE \"tests/recovery/inventory.lisp\" :MD5
   #A((32) BASE-CHAR . \"9c78925dd89e94d86a9f577e0225eeb3\"))
  (:FILE \"tests/recovery/manifest-audit.lisp\" :MD5
   #A((32) BASE-CHAR . \"3ca73a199708e2571da3a27e6dc00c76\"))
  (:FILE \"tests/recovery/manifest-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"3286e0dfb66496aafe8b6fbbdd92ab43\"))
  (:FILE \"tests/recovery/manifest.lisp\" :MD5
   #A((32) BASE-CHAR . \"b6bdcc4d20f7db14c0dc00d5258cbf8c\"))
  (:FILE \"tests/recovery/scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"aa7af12d270673b62542d32ec60b361a\"))
  (:FILE \"tests/recovery/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"769bac1994a5e3d74bd56b510970bf9b\"))
  (:FILE \"tests/scheduler/controller.lisp\" :MD5
   #A((32) BASE-CHAR . \"bc20dcd712332fde961fb38e879392b5\"))
  (:FILE \"tests/scheduler/dispatch.lisp\" :MD5
   #A((32) BASE-CHAR . \"0235bb18cc7a6169e47d3aebf2438bdd\"))
  (:FILE \"tests/scheduler/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"1388f446bce5085439c2254edd165118\"))
  (:FILE \"tests/scheduler/pool-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"aaba914dea485f812a11767addb94c81\"))
  (:FILE \"tests/scheduler/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"34e51e369859bc1c731d73e43053b6f4\"))
  (:FILE \"tests/series/boundaries.lisp\" :MD5
   #A((32) BASE-CHAR . \"6967c7e6396b6df38c637f2d5d9ebfc0\"))
  (:FILE \"tests/series/controller.lisp\" :MD5
   #A((32) BASE-CHAR . \"a83818568a27c52d36365597d7113c09\"))
  (:FILE \"tests/series/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6aa566720d1476d13a0f7288be9e1346\"))
  (:FILE \"tests/series/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"67718445a8948da3c7875f6cc6b3e167\"))
  (:FILE \"tests/series/worker-bridge.lisp\" :MD5
   #A((32) BASE-CHAR . \"c714c8db7998acf60256b318488574d8\"))
  (:FILE \"tests/series/worker-routing.lisp\" :MD5
   #A((32) BASE-CHAR . \"f839733b6f5a4d9286a5cdd7ae9bcb55\"))
  (:FILE \"tests/smoke.lisp\" :MD5
   #A((32) BASE-CHAR . \"afb2e2bc7ff7249ebb2e1ccf0f87aaf3\"))
  (:FILE \"tests/storage/compaction-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"cb4acb5a73eb973f53ef337113880d32\"))
  (:FILE \"tests/storage/control-payload.lisp\" :MD5
   #A((32) BASE-CHAR . \"25f3c822273c898d2263ceb3db538cab\"))
  (:FILE \"tests/storage/log-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"eecb2fe94e710a918254e5ad453a0daa\"))
  (:FILE \"tests/storage/segment-header.lisp\" :MD5
   #A((32) BASE-CHAR . \"ab2c52fb6b79702d50dcef6d12ca8906\"))
  (:FILE \"tests/storage/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"82a4dbb4767c17f9851143a637af3b83\"))
  (:FILE \"tests/wal/builder.lisp\" :MD5
   #A((32) BASE-CHAR . \"0d01e4e18c0a559873fce584a0ac91cd\"))
  (:FILE \"tests/wal/csn-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"ecb2cbf4f7ace32cdaff329476070d60\"))
  (:FILE \"tests/wal/csn.lisp\" :MD5
   #A((32) BASE-CHAR . \"3e2dbc3319b611db090e27493a10fc2c\"))
  (:FILE \"tests/wal/fault.lisp\" :MD5
   #A((32) BASE-CHAR . \"00367366b82918614d84f517f4bb395e\"))
  (:FILE \"tests/wal/group.lisp\" :MD5
   #A((32) BASE-CHAR . \"0ee2462103a749b58488561aeacaac07\"))
  (:FILE \"tests/wal/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"0643b96c5ee339f9826b19150d065ddf\"))
  (:FILE \"tests/wal/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"15952f6b761acea4519abf701bb2346c\"))
  (:FILE \"tools/measure-pool-dispatch.lisp\" :MD5
   #A((32) BASE-CHAR . \"daea2e29c87593dcc7db9949b67ff4f6\")))
 :SOURCE-CONSISTENCY :STABLE :RECORDED-AT 4000917579 :SELF-TEST
 (:STATUS :OK :SHARED-SENSOR
  (:STATUS :OK :BASELINE
   (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096 :WARMUP-ITERATIONS
    128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS 41 :SECONDS 4.1d-5
    :TIME-QUALITY :MEASURED :SINK 8386560 :DIAGNOSTIC NIL :EXPECTED-SINK
    8386560)
   :POSITIVE-CONTROL
   (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 16 :WARMUP-ITERATIONS 0
    :COMPLETED-ITERATIONS 16 :HEAP-BYTES 16777472 :RAW-TICKS 26 :SECONDS 2.6d-5
    :TIME-QUALITY :MEASURED :SINK 16777336 :DIAGNOSTIC NIL :EXPECTED-SINK
    16777336)
   :WRONG-SINK-PROBE
   (:REPLICA 0 :STATUS :EXPECTED-REJECTION :STAGE :MEASURED :ITERATIONS 2
    :WARMUP-ITERATIONS 0 :COMPLETED-ITERATIONS 2 :HEAP-BYTES 0 :RAW-TICKS 1
    :SECONDS 1.0d-6 :TIME-QUALITY :MEASURED :SINK 3 :DIAGNOSTIC
    #A((50) BASE-CHAR . \"COD-60: heap/clock negativo o sink 3 diverso da 1.\")
    :EXPECTED-SINK 1)
   :ZERO-CLOCK-PROBE
   (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 2 :WARMUP-ITERATIONS 0
    :COMPLETED-ITERATIONS 2 :HEAP-BYTES 0 :RAW-TICKS 0 :SECONDS NIL
    :TIME-QUALITY :BELOW-RESOLUTION :SINK 1 :DIAGNOSTIC NIL :EXPECTED-SINK 1)
   :COMPOSED-API-PROBE
   (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
    :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 3 :SECONDS 3.0d-6
    :TIME-QUALITY :MEASURED :SINK 318 :DIAGNOSTIC NIL :EXPECTED-SINK 318)
   :COMPOSED-REGISTRY-PROBE
   (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
    :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 6 :SECONDS 6.0d-6
    :TIME-QUALITY :MEASURED :SINK 142 :DIAGNOSTIC NIL :EXPECTED-SINK 142)
   :INVALID-CLI :REJECTED :OWNER-AND-REGISTRY-ORACLE-POSITIVE-NEGATIVE :PASSED
   :INVALID-NON-HOT :PASSED :EXISTING-DESTINATION-AND-PARTIAL-RAW :PASSED
   :MEASURED-PARTIAL-RAW
   (:REPLICA 0 :STATUS :EXPECTED-REJECTION :STAGE :MEASURED :ITERATIONS 4
    :WARMUP-ITERATIONS 0 :COMPLETED-ITERATIONS 1 :HEAP-BYTES 0 :RAW-TICKS 7
    :SECONDS 7.0d-6 :TIME-QUALITY :MEASURED :SINK 0 :DIAGNOSTIC
    #A((26) BASE-CHAR . \"fixture: misura interrotta\") :EXPECTED-SINK 6))
  :DISPATCH-ORACLES :PASSED :DISPATCH-CLI-AND-PARTIAL-RAW :PASSED :EMPTY
  (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
   :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 36 :SECONDS 3.6d-5
   :TIME-QUALITY :MEASURED :SINK 54 :DIAGNOSTIC NIL :EXPECTED-SINK 54)
  :INACTIVE
  (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
   :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 11 :SECONDS 1.1d-5
   :TIME-QUALITY :MEASURED :SINK 86 :DIAGNOSTIC NIL :EXPECTED-SINK 86)
  :ROUTE-CURRENT
  (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
   :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 11 :SECONDS 1.1d-5
   :TIME-QUALITY :MEASURED :SINK 118 :DIAGNOSTIC NIL :EXPECTED-SINK 118))
 :SAMPLES
 ((:CAMPAIGN :EMPTY :REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   5110 :SECONDS 0.00511d0 :TIME-QUALITY :MEASURED :SINK 8435712 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8435712)
  (:CAMPAIGN :EMPTY :REPLICA 1 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   5896 :SECONDS 0.005896d0 :TIME-QUALITY :MEASURED :SINK 8435712 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8435712)
  (:CAMPAIGN :EMPTY :REPLICA 2 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   6652 :SECONDS 0.006652d0 :TIME-QUALITY :MEASURED :SINK 8435712 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8435712)
  (:CAMPAIGN :EMPTY :REPLICA 3 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   5518 :SECONDS 0.005518d0 :TIME-QUALITY :MEASURED :SINK 8435712 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8435712)
  (:CAMPAIGN :EMPTY :REPLICA 4 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   7346 :SECONDS 0.007346d0 :TIME-QUALITY :MEASURED :SINK 8435712 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8435712)
  (:CAMPAIGN :INACTIVE :REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   1505 :SECONDS 0.001505d0 :TIME-QUALITY :MEASURED :SINK 8468480 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8468480)
  (:CAMPAIGN :INACTIVE :REPLICA 1 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   1057 :SECONDS 0.001057d0 :TIME-QUALITY :MEASURED :SINK 8468480 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8468480)
  (:CAMPAIGN :INACTIVE :REPLICA 2 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   1226 :SECONDS 0.001226d0 :TIME-QUALITY :MEASURED :SINK 8468480 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8468480)
  (:CAMPAIGN :INACTIVE :REPLICA 3 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   1676 :SECONDS 0.001676d0 :TIME-QUALITY :MEASURED :SINK 8468480 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8468480)
  (:CAMPAIGN :INACTIVE :REPLICA 4 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   1377 :SECONDS 0.001377d0 :TIME-QUALITY :MEASURED :SINK 8468480 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8468480)
  (:CAMPAIGN :ROUTE-CURRENT :REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS
   4096 :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0
   :RAW-TICKS 2021 :SECONDS 0.002021d0 :TIME-QUALITY :MEASURED :SINK 8501248
   :DIAGNOSTIC NIL :EXPECTED-SINK 8501248)
  (:CAMPAIGN :ROUTE-CURRENT :REPLICA 1 :STATUS :OK :STAGE :COMPLETE :ITERATIONS
   4096 :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0
   :RAW-TICKS 2307 :SECONDS 0.002307d0 :TIME-QUALITY :MEASURED :SINK 8501248
   :DIAGNOSTIC NIL :EXPECTED-SINK 8501248)
  (:CAMPAIGN :ROUTE-CURRENT :REPLICA 2 :STATUS :OK :STAGE :COMPLETE :ITERATIONS
   4096 :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0
   :RAW-TICKS 2290 :SECONDS 0.00229d0 :TIME-QUALITY :MEASURED :SINK 8501248
   :DIAGNOSTIC NIL :EXPECTED-SINK 8501248)
  (:CAMPAIGN :ROUTE-CURRENT :REPLICA 3 :STATUS :OK :STAGE :COMPLETE :ITERATIONS
   4096 :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0
   :RAW-TICKS 2167 :SECONDS 0.002167d0 :TIME-QUALITY :MEASURED :SINK 8501248
   :DIAGNOSTIC NIL :EXPECTED-SINK 8501248)
  (:CAMPAIGN :ROUTE-CURRENT :REPLICA 4 :STATUS :OK :STAGE :COMPLETE :ITERATIONS
   4096 :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0
   :RAW-TICKS 2175 :SECONDS 0.002175d0 :TIME-QUALITY :MEASURED :SINK 8501248
   :DIAGNOSTIC NIL :EXPECTED-SINK 8501248))
 :CURRENT-REPLICA NIL :SBCL #A((5) BASE-CHAR . \"2.6.9\") :MACHINE
 #A((5) BASE-CHAR . \"ARM64\") :OS #A((6) BASE-CHAR . \"Darwin\") :OS-VERSION
 #A((6) BASE-CHAR . \"27.0.0\") :SAFETY 3 :ITERATIONS 4096 :WARMUP 128 :REPLICAS
 5 :TIMER-UNITS-PER-SECOND 1000000 :CAMPAIGNS
 ((:EMPTY :SHARDS 4 :INITIAL-CURSOR 0 :CALLS-PER-CYCLE 4 :TOKEN 12)
  (:INACTIVE :SHARDS 4 :INITIAL-CURSOR 2 :CALLS-PER-CYCLE 4 :TOKEN 20)
  (:ROUTE-CURRENT :SHARDS 4 :INITIAL-CURSOR 0 :CALLS-PER-CYCLE 4 :TOKEN 28
   :INITIAL-CLAIM-OUTSIDE-CLOCK T :WORKER-PHASE :CLAIMED :LINK-PHASE :IDLE
   :SCALAR-STATE-ORACLE-IN-CYCLE T))
 :TOKEN-FORMULA
 \"sample=N*cycle-token+N*(N-1)/2; EMPTY=12; INACTIVE=20; ROUTE-CURRENT=28\"
 :LIMITS
 (:PREALLOCATED-PRODUCT-AND-INPUTS :STARTUP-CLAIM-DRAIN-AND-GC-EXCLUDED
  :COUNTER-NOT-ABSOLUTE-NONALLOCATION-PROOF :EXTERNAL-LOAD-UNCONTROLLED
  :CLOCK-ZERO-IS-BELOW-RESOLUTION :NO-TIME-THRESHOLD-NO-TUNING-CLAIM
  :EMPTY-IS-LOCAL-OBSERVATION :NO-REAL-QUEUED-CLAIM-MEASURED
  :CURRENT-IS-REPEATED-CLAIMED-LOOKUP-WITH-SCALAR-ORACLES
  :NO-BEGIN-OR-LIVE-LEASE-IN-CLOCK :NO-CONCURRENT-COORDINATOR
  :NO-PHYSICAL-WORKER-LIFECYCLE-QUALIFICATION))
")
  (:PATH
   #A((121) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/spikes/out/pool-dispatch-measure/bench-formal-attempt-01.log")
   :BYTES 435 :SHA256 "8ab66808fc9d3aaded4e664ff1aa958ab4a81b7bc9c0c01ef8740b70f8e8d97c" :GIT-BLOB
   "a7506312c0c8591971a6a81dc58be84d82ee8e05" :TEXT
   ":OK: env ASDF_OUTPUT_TRANSLATIONS=(:output-translations (t \"/private/tmp/arcdocdb-pool-dispatch-qualified-bench-cache-01/\") :ignore-inherited-configuration) sbcl --noinform --no-userinit --no-sysinit --script spikes/out/pool-dispatch-measure/tool-run.lisp --bench spikes/out/pool-dispatch-measure/bench-attempt-01/; record: /private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/spikes/out/4000917578-command-67114-0/report.lisp
")
  (:PATH
   #A((151) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/spikes/out/pool-dispatch-measure/coverage-attempt-01/57b998249bc045d0381d644e064a7c13.html")
   :BYTES 4369 :SHA256 "8bbe103bd6ea6b479e8084d5ddefb94f83021c259b05cff28000371e503c1341" :GIT-BLOB
   "a554ce81ad22cb8dc21ccfa737011136d7a461fc" :TEXT "<html><head><style type='text/css'>
*.state-0 { background-color: #eeeeee }
*.state-1 { background-color: #aaffaa }
*.state-5 { background-color: #44dd44 }
*.state-2 { background-color: #ffaaaa }
*.state-10 { background-color: #ee6666 }
*.state-15 { color: #aaaaaa; background-color: #eeeeee }
*.state-9,*.state-6 { background-color: #ffffaa }
div.key { margin: 20px; width: 200px }
div.source { width: 88ex; background-color: #eeeeee; padding-left: 5px;
             /* border-style: solid none none none; border-width: 1px;
             border-color: #dddddd */ }

*.line-number { color: #666666; float: left; width: 6ex; text-align: right; margin-right: 1ex; }

table.summary tr.head-row { background-color: #aaaaff }
table.summary tr td.text-cell { text-align: left }
table.summary tr td.main-head { text-align: center }
table.summary tr td { text-align: right }
table.summary tr.even { background-color: #eeeeff }
table.summary tr.subheading { background-color: #aaaaff}
table.summary tr.subheading td { text-align: left; font-weight: bold; padding-left: 5ex; }
</style></head><body><h3>Coverage report: /private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/src/dispatch/package.lisp <br />
</h3>
<table class='summary'><tr class='head-row'><td width='80px'>Kind</td><td width='80px'>Covered</td><td width='80px'>All</td><td width='80px'>%</td><tr class='odd'><td>expression</td><td>1</td><td>1</td><td>100.0</td></tr>
<tr class='even'><td>branch</td><td>0</td><td>0</td><td>nil  </td></tr>
</table><div class='key'><b>Key</b><br />
<div class='state-0'>Not instrumented</div><div class='state-15'>Conditionalized out</div><div class='state-1'>Executed</div><div class='state-2'>Not executed</div><div>&#160;</div><div class='state-5'>Both branches taken</div><div class='state-6'>One branch taken</div><div class='state-10'>Neither branch taken</div></div><nobr><div><code>
</code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>1</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#59;&#160;Dispatcher&#160;logico&#44;&#160;caricato&#160;dopo&#160;il&#160;routing&#160;e&#160;il&#160;governo&#160;del&#160;pool&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>2</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;REQ&#58;&#160;REQ&#45;THR&#45;001&#160;REQ&#45;CON&#45;001&#160;REQ&#45;CON&#45;002&#160;REQ&#45;CON&#45;005&#160;REQ&#45;AFF&#45;008</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>3</code></div><code>&#160;<span class='state-1'>&#40;defpackage&#160;&#35;&#58;arcdocdb&#46;scheduler&#46;dispatch</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>4</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;&#58;use&#160;&#35;&#58;cl&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>5</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;&#58;import&#45;from&#160;&#35;&#58;arcdocdb&#46;binary&#160;&#35;&#58;index&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>6</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;&#58;import&#45;from&#160;&#35;&#58;arcdocdb&#46;conditions&#160;&#35;&#58;invalid&#45;argument&#160;&#35;&#58;resource&#45;exhausted</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>7</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#35;&#58;invariant&#45;violation&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>8</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;&#58;export&#160;&#35;&#58;dispatcher&#45;writer&#45;pool&#160;&#35;&#58;crea&#45;dispatcher&#45;writer&#45;pool</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>9</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#35;&#58;prendi&#45;collegamento&#45;pool&#160;&#35;&#58;collega&#45;obbligo&#45;pool&#41;&#41;</code></div></body></html>")
  (:PATH
   #A((151) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/spikes/out/pool-dispatch-measure/coverage-attempt-01/7c4d4a9dc738afc99988a0cc6ab4b11e.html")
   :BYTES 7284 :SHA256 "2ced170849bce1bf6fe2520894c8f6c00b850b839f956185d48313400a030fc0" :GIT-BLOB
   "804a0a720606e896cba3920bf2f277ea773c35d2" :TEXT "<html><head><style type='text/css'>
*.state-0 { background-color: #eeeeee }
*.state-1 { background-color: #aaffaa }
*.state-5 { background-color: #44dd44 }
*.state-2 { background-color: #ffaaaa }
*.state-10 { background-color: #ee6666 }
*.state-15 { color: #aaaaaa; background-color: #eeeeee }
*.state-9,*.state-6 { background-color: #ffffaa }
div.key { margin: 20px; width: 200px }
div.source { width: 88ex; background-color: #eeeeee; padding-left: 5px;
             /* border-style: solid none none none; border-width: 1px;
             border-color: #dddddd */ }

*.line-number { color: #666666; float: left; width: 6ex; text-align: right; margin-right: 1ex; }

table.summary tr.head-row { background-color: #aaaaff }
table.summary tr td.text-cell { text-align: left }
table.summary tr td.main-head { text-align: center }
table.summary tr td { text-align: right }
table.summary tr.even { background-color: #eeeeff }
table.summary tr.subheading { background-color: #aaaaff}
table.summary tr.subheading td { text-align: left; font-weight: bold; padding-left: 5ex; }
</style></head><body><h3>Coverage report: /private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/src/dispatch/build.lisp <br />
</h3>
<table class='summary'><tr class='head-row'><td width='80px'>Kind</td><td width='80px'>Covered</td><td width='80px'>All</td><td width='80px'>%</td><tr class='odd'><td>expression</td><td>24</td><td>24</td><td>100.0</td></tr>
<tr class='even'><td>branch</td><td>2</td><td>2</td><td>100.0</td></tr>
</table><div class='key'><b>Key</b><br />
<div class='state-0'>Not instrumented</div><div class='state-15'>Conditionalized out</div><div class='state-1'>Executed</div><div class='state-2'>Not executed</div><div>&#160;</div><div class='state-5'>Both branches taken</div><div class='state-6'>One branch taken</div><div class='state-10'>Neither branch taken</div></div><nobr><div><code>
</code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>1</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#59;&#160;Costruzione&#160;separata&#160;dal&#160;percorso&#160;caldo&#44;&#160;prima&#160;di&#160;qualsiasi&#160;obbligo&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>2</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;OWNER&#58;&#160;factory&#160;sul&#160;thread&#160;che&#160;possiede&#160;porta&#160;e&#160;contesto&#44;&#160;senza&#160;reentrancy&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>3</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;SHARED&#58;&#160;solo&#160;riferimenti&#160;immutabili&#44;&#160;nessuna&#160;pubblicazione&#160;o&#160;lettura&#160;di&#160;comandi&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>4</code></div><code>&#160;<span class='state-1'>&#40;in&#45;package&#160;&#35;&#58;arcdocdb&#46;scheduler&#46;dispatch&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>5</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;optimize&#160;&#40;safety&#160;3&#41;&#160;&#40;speed&#160;2&#41;&#160;&#40;debug&#160;2&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>6</code></div><code>&#160;<span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>7</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;REQ&#58;&#160;REQ&#45;THR&#45;001&#160;REQ&#45;CON&#45;002&#160;REQ&#45;CON&#45;004&#160;REQ&#45;CON&#45;005&#160;REQ&#45;AFF&#45;008</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>8</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;ftype&#160;&#40;function&#160;&#40;t&#160;t&#41;&#160;dispatcher&#45;writer&#45;pool&#41;&#160;crea&#45;dispatcher&#45;writer&#45;pool&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>9</code></div><code>&#160;<span class='state-1'>&#40;defun&#160;crea&#45;dispatcher&#45;writer&#45;pool&#160;&#40;port&#160;table&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>10</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#34;Pre&#58;&#160;porta&#160;e&#160;tabella&#160;preallocate&#44;&#160;stesso&#160;contesto&#160;libero&#44;&#160;owner&#160;corrente&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>11</code></div><code>&#160;<span class='state-1'>Post&#58;&#160;dispatcher&#160;immutabile&#160;senza&#160;acquisire&#160;lavoro&#160;o&#160;applicare&#160;comandi&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>12</code></div><code>&#160;<span class='state-1'>INVALID&#45;ARGUMENT&#160;tipo&#47;owner&#47;binding&#59;&#160;RESOURCE&#45;EXHAUSTED&#160;fase&#160;non&#45;IDLE&#59;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>13</code></div><code>&#160;<span class='state-1'>barriera&#160;C1&#160;read&#45;only&#160;sull&#39;IDLE&#160;completo&#44;&#160;nessun&#160;nuovo&#160;fault&#160;marking&#160;C3&#46;&#34;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>14</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;&#37;check&#45;dispatcher&#45;binding&#160;port&#160;table&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>15</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;let&#160;&#40;&#40;context&#160;&#40;arcdocdb&#46;scheduler&#58;&#58;porta&#45;worker&#45;pool&#45;context&#160;port&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>16</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;unless&#160;</span><span class='state-5'>&#40;eq&#160;</span><span class='state-1'>&#40;arcdocdb&#46;execution&#58;stato&#45;worker&#45;writer&#160;context&#41;</span><span class='state-5'>&#160;</span><span class='state-1'>&#58;idle</span><span class='state-5'>&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>17</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#40;error&#160;&#39;resource&#45;exhausted&#160;&#58;reason&#160;&#58;worker&#45;state&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>18</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;arcdocdb&#46;execution&#58;&#58;&#37;richiedi&#45;worker&#160;context&#160;&#58;idle&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>19</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;&#37;make&#45;dispatcher&#45;writer&#45;pool&#160;port&#160;table&#41;&#41;</code></div></body></html>")
  (:PATH
   #A((151) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/spikes/out/pool-dispatch-measure/coverage-attempt-01/a84aab770cdb7e5f3cca83224695cd91.html")
   :BYTES 14999 :SHA256 "3fc0217840508b150fec6125555426e97d27f6c56f2ae4fc6d3f9fb4f8060d98"
   :GIT-BLOB "4c50deacc7428f9683ef9581bddc369a7a22c9a9" :TEXT "<html><head><style type='text/css'>
*.state-0 { background-color: #eeeeee }
*.state-1 { background-color: #aaffaa }
*.state-5 { background-color: #44dd44 }
*.state-2 { background-color: #ffaaaa }
*.state-10 { background-color: #ee6666 }
*.state-15 { color: #aaaaaa; background-color: #eeeeee }
*.state-9,*.state-6 { background-color: #ffffaa }
div.key { margin: 20px; width: 200px }
div.source { width: 88ex; background-color: #eeeeee; padding-left: 5px;
             /* border-style: solid none none none; border-width: 1px;
             border-color: #dddddd */ }

*.line-number { color: #666666; float: left; width: 6ex; text-align: right; margin-right: 1ex; }

table.summary tr.head-row { background-color: #aaaaff }
table.summary tr td.text-cell { text-align: left }
table.summary tr td.main-head { text-align: center }
table.summary tr td { text-align: right }
table.summary tr.even { background-color: #eeeeff }
table.summary tr.subheading { background-color: #aaaaff}
table.summary tr.subheading td { text-align: left; font-weight: bold; padding-left: 5ex; }
</style></head><body><h3>Coverage report: /private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/src/dispatch/claim.lisp <br />
</h3>
<table class='summary'><tr class='head-row'><td width='80px'>Kind</td><td width='80px'>Covered</td><td width='80px'>All</td><td width='80px'>%</td><tr class='odd'><td>expression</td><td>45</td><td>49</td><td> 91.8</td></tr>
<tr class='even'><td>branch</td><td>0</td><td>0</td><td>nil  </td></tr>
</table><div class='key'><b>Key</b><br />
<div class='state-0'>Not instrumented</div><div class='state-15'>Conditionalized out</div><div class='state-1'>Executed</div><div class='state-2'>Not executed</div><div>&#160;</div><div class='state-5'>Both branches taken</div><div class='state-6'>One branch taken</div><div class='state-10'>Neither branch taken</div></div><nobr><div><code>
</code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>1</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#59;&#160;Nuova&#160;presa&#160;governata&#59;&#160;gli&#160;obblighi&#160;esistenti&#160;hanno&#160;un&#160;ingresso&#160;indipendente&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>2</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;OWNER&#58;&#160;dispatcher&#44;&#160;contesto&#160;e&#160;collegamenti&#160;locali&#160;al&#160;medesimo&#160;worker&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>3</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;SHARED&#58;&#160;solo&#160;API&#160;pool&#47;ready&#47;routing&#160;esistenti&#160;per&#160;tratto&#160;&#40;ADR&#45;0045&#160;&#167;8&#41;&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>4</code></div><code>&#160;<span class='state-1'>&#40;in&#45;package&#160;&#35;&#58;arcdocdb&#46;scheduler&#46;dispatch&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>5</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;optimize&#160;&#40;safety&#160;3&#41;&#160;&#40;speed&#160;2&#41;&#160;&#40;debug&#160;2&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>6</code></div><code>&#160;<span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>7</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;REQ&#58;&#160;REQ&#45;THR&#45;001&#160;REQ&#45;CON&#45;001&#160;REQ&#45;CON&#45;002&#160;REQ&#45;CON&#45;004&#160;REQ&#45;CON&#45;005&#160;REQ&#45;AFF&#45;008</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>8</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;ftype&#160;&#40;function&#160;&#40;dispatcher&#45;writer&#45;pool&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>9</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;values&#160;&#40;or&#160;null&#160;arcdocdb&#46;execution&#46;series&#58;collegamento&#45;worker&#45;serie&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>10</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;member&#160;&#58;claimed&#160;&#58;empty&#160;&#58;busy&#160;&#58;inactive&#41;&#160;index</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>11</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;member&#160;&#58;unchanged&#160;&#58;activated&#160;&#58;retired&#160;&#58;busy&#160;&#58;faulted&#41;&#160;&#38;optional&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>12</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;prendi&#45;collegamento&#45;pool&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>13</code></div><code>&#160;<span class='state-1'>&#40;defun&#160;prendi&#45;collegamento&#45;pool&#160;&#40;dispatcher&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>14</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#34;Pre&#58;&#160;owner&#160;corrente&#44;&#160;worker&#160;IDLE&#160;libero&#46;&#160;Post&#58;&#160;link&#160;preallocato&#160;solo&#160;dopo&#160;CLAIMED&#44;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>15</code></div><code>&#160;<span class='state-1'>oppure&#160;NIL&#47;esito&#47;cursore&#47;azione&#160;originali&#160;del&#160;gate&#46;&#160;Nessun&#160;begin&#44;&#160;lease&#160;o&#160;pop&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>16</code></div><code>&#160;<span class='state-1'>Binding&#160;rifiutato&#160;prima&#160;del&#160;gate&#59;&#160;errori&#160;delegati&#160;mantengono&#160;confini&#160;e&#160;obblighi&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>17</code></div><code>&#160;<span class='state-1'>Un&#160;fault&#160;di&#160;routing&#160;conserva&#160;il&#160;claim&#160;e&#160;l&#39;ACK&#160;già&#160;riuscito&#44;&#160;senza&#160;rollback&#46;&#34;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>18</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;let&#160;&#40;&#40;port&#160;&#40;dispatcher&#45;writer&#45;pool&#45;port&#160;dispatcher&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>19</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;table&#160;&#40;dispatcher&#45;writer&#45;pool&#45;table&#160;dispatcher&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>20</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;&#37;check&#45;dispatcher&#45;binding&#160;port&#160;table&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>21</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;multiple&#45;value&#45;bind&#160;&#40;writer&#160;status&#160;cursor&#160;action&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>22</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;arcdocdb&#46;scheduler&#58;prendi&#45;writer&#45;pool&#160;port&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>23</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#40;case&#160;status</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>24</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;&#58;claimed</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>25</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;unless&#160;writer&#160;&#40;error&#160;&#39;invariant&#45;violation&#160;&#58;reason&#160;&#58;pool&#45;dispatcher&#45;state&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>26</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;values&#160;&#40;arcdocdb&#46;execution&#46;series&#58;collega&#45;writer&#45;worker&#45;serie&#160;table&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>27</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;status&#160;cursor&#160;action&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>28</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;&#40;&#58;empty&#160;&#58;busy&#160;&#58;inactive&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>29</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;when&#160;writer&#160;&#40;error&#160;&#39;invariant&#45;violation&#160;&#58;reason&#160;&#58;pool&#45;dispatcher&#45;state&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>30</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;values&#160;nil&#160;status&#160;cursor&#160;action&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>31</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;otherwise&#160;</span><span class='state-2'>&#40;error&#160;&#39;invariant&#45;violation&#160;&#58;reason&#160;&#58;pool&#45;dispatcher&#45;state&#41;</span><span class='state-1'>&#41;&#41;&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>32</code></div><code>&#160;<span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>33</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;REQ&#58;&#160;REQ&#45;THR&#45;001&#160;REQ&#45;CON&#45;001&#160;REQ&#45;CON&#45;002&#160;REQ&#45;CON&#45;004&#160;REQ&#45;CON&#45;005&#160;REQ&#45;AFF&#45;008</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>34</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;ftype&#160;&#40;function&#160;&#40;dispatcher&#45;writer&#45;pool&#41;&#160;arcdocdb&#46;execution&#46;series&#58;collegamento&#45;worker&#45;serie&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>35</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;collega&#45;obbligo&#45;pool&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>36</code></div><code>&#160;<span class='state-1'>&#40;defun&#160;collega&#45;obbligo&#45;pool&#160;&#40;dispatcher&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>37</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#34;Pre&#58;&#160;owner&#160;corrente&#44;&#160;CLAIMED&#160;già&#160;assunto&#160;da&#160;busy&#160;begin&#44;&#160;ricircolo&#160;o&#160;adozione&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>38</code></div><code>&#160;<span class='state-1'>Post&#58;&#160;link&#160;corrente&#160;preallocato&#44;&#160;selezione&#160;ripetibile&#160;senza&#160;nuove&#160;capacità&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>39</code></div><code>&#160;<span class='state-1'>Non&#160;legge&#160;comandi&#47;active&#160;e&#160;non&#160;conferma&#160;ritiro&#58;&#160;il&#160;caller&#160;completa&#160;l&#39;obbligo&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>40</code></div><code>&#160;<span class='state-1'>Binding&#47;owner&#160;e&#160;routing&#160;delegati&#59;&#160;fase&#47;fault&#160;preservati&#160;dai&#160;confini&#160;C1&#160;esistenti&#46;&#34;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>41</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;let&#160;&#40;&#40;port&#160;&#40;dispatcher&#45;writer&#45;pool&#45;port&#160;dispatcher&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>42</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;table&#160;&#40;dispatcher&#45;writer&#45;pool&#45;table&#160;dispatcher&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>43</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;&#37;check&#45;dispatcher&#45;binding&#160;port&#160;table&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>44</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;arcdocdb&#46;execution&#46;series&#58;collega&#45;writer&#45;worker&#45;serie&#160;table&#41;&#41;&#41;</code></div></body></html>")
  (:PATH
   #A((130) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/spikes/out/pool-dispatch-measure/coverage-attempt-01/cover-index.html")
   :BYTES 2278 :SHA256 "513d8d6adcfa88c4fe8225ce9dc5e343b1ca30030c1a495efe85d3ede34ba058" :GIT-BLOB
   "45e6e278a2fa67bdc830b9b1323aebd64c203a5f" :TEXT "<style type='text/css'>
*.state-0 { background-color: #eeeeee }
*.state-1 { background-color: #aaffaa }
*.state-5 { background-color: #44dd44 }
*.state-2 { background-color: #ffaaaa }
*.state-10 { background-color: #ee6666 }
*.state-15 { color: #aaaaaa; background-color: #eeeeee }
*.state-9,*.state-6 { background-color: #ffffaa }
div.key { margin: 20px; width: 200px }
div.source { width: 88ex; background-color: #eeeeee; padding-left: 5px;
             /* border-style: solid none none none; border-width: 1px;
             border-color: #dddddd */ }

*.line-number { color: #666666; float: left; width: 6ex; text-align: right; margin-right: 1ex; }

table.summary tr.head-row { background-color: #aaaaff }
table.summary tr td.text-cell { text-align: left }
table.summary tr td.main-head { text-align: center }
table.summary tr td { text-align: right }
table.summary tr.even { background-color: #eeeeff }
table.summary tr.subheading { background-color: #aaaaff}
table.summary tr.subheading td { text-align: left; font-weight: bold; padding-left: 5ex; }
</style><table class='summary'><tr class='head-row'><td></td><td class='main-head' colspan='3'>Expression</td><td class='main-head' colspan='3'>Branch</td></tr><tr class='head-row'><td width='80px'>Source file</td><td width='80px'>Covered</td><td width='80px'>Total</td><td width='80px'>%</td><td width='80px'>Covered</td><td width='80px'>Total</td><td width='80px'>%</td></tr><tr class='subheading'><td colspan='7'>/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/src/dispatch/</td></tr>
<tr class='odd'><td class='text-cell'><a href='7c4d4a9dc738afc99988a0cc6ab4b11e.html'>build.lisp</a></td><td>24</td><td>24</td><td>100.0</td><td>2</td><td>2</td><td>100.0</td></tr><tr class='even'><td class='text-cell'><a href='a84aab770cdb7e5f3cca83224695cd91.html'>claim.lisp</a></td><td>45</td><td>49</td><td> 91.8</td><td>0</td><td>0</td><td>-</td></tr><tr class='odd'><td class='text-cell'><a href='57b998249bc045d0381d644e064a7c13.html'>package.lisp</a></td><td>1</td><td>1</td><td>100.0</td><td>0</td><td>0</td><td>-</td></tr><tr class='even'><td class='text-cell'><a href='dcb336dae682b6b6671cda3619f01f07.html'>types.lisp</a></td><td>40</td><td>40</td><td>100.0</td><td>8</td><td>8</td><td>100.0</td></tr></table>")
  (:PATH
   #A((133) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/spikes/out/pool-dispatch-measure/coverage-attempt-01/coverage-audit.lisp")
   :BYTES 1635 :SHA256 "b7bc311e3fbf588e0d90959c00d6126f4e4ac2223f52dc568095a7f7bc4dcc3c" :GIT-BLOB
   "2d7fda35ca917f769110bca4025bd122062d6777" :TEXT
   "(:SCHEMA-VERSION 1 :KIND :POOL-LIFECYCLE-COVERAGE-AUDIT :STATUS :OK :SCOPE
 :ENTIRE-NEW-LIFECYCLE-PLUS-PACKAGE :NATIVE-PATH
 #A((133) BASE-CHAR
    . \"/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/spikes/out/pool-dispatch-measure/coverage-attempt-01/coverage-state.lisp\")
 :HTML-PATH
 #A((130) BASE-CHAR
    . \"/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/spikes/out/pool-dispatch-measure/coverage-attempt-01/cover-index.html\")
 :FILES
 ((:FILE #A((23) BASE-CHAR . \"src/dispatch/build.lisp\") :EXPRESSIONS-HIT 24
   :EXPRESSIONS-TOTAL 24 :BRANCHES-HIT 2 :BRANCHES-TOTAL 2 :MISSING NIL)
  (:FILE #A((23) BASE-CHAR . \"src/dispatch/claim.lisp\") :EXPRESSIONS-HIT 45
   :EXPRESSIONS-TOTAL 49 :BRANCHES-HIT 0 :BRANCHES-TOTAL 0 :MISSING
   ((:NATIVE-INDEX 31 :KIND :EXPRESSION :PATH (1 4 3 3 4 3))
    (:NATIVE-INDEX 32 :KIND :EXPRESSION :PATH (1 1 4 3 3 4 3))
    (:NATIVE-INDEX 33 :KIND :EXPRESSION :PATH (2 1 4 3 3 4 3))
    (:NATIVE-INDEX 34 :KIND :EXPRESSION :PATH (3 1 4 3 3 4 3))))
  (:FILE #A((25) BASE-CHAR . \"src/dispatch/package.lisp\") :EXPRESSIONS-HIT 1
   :EXPRESSIONS-TOTAL 1 :BRANCHES-HIT 0 :BRANCHES-TOTAL 0 :MISSING NIL)
  (:FILE #A((23) BASE-CHAR . \"src/dispatch/types.lisp\") :EXPRESSIONS-HIT 40
   :EXPRESSIONS-TOTAL 40 :BRANCHES-HIT 8 :BRANCHES-TOTAL 8 :MISSING NIL))
 :LIFECYCLE-TOTAL (110 114 10 10) :MINIMUM-PERCENT 95 :HTML-COUNTS
 ((\"src/dispatch/build.lisp\" 24 24 2 2) (\"src/dispatch/claim.lisp\" 45 49 0 0)
  (\"src/dispatch/package.lisp\" 1 1 0 0) (\"src/dispatch/types.lisp\" 40 40 8 8))
 :HTML-COUNTS-ORIGIN :PARSED-SB-COVER-INDEX :SELF-TEST :PASSED :EXCLUSIONS NIL
 :MCDC-INFERRED NIL)
")
  (:PATH
   #A((142) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/spikes/out/pool-dispatch-measure/coverage-attempt-01/coverage-dispatch-audit.lisp")
   :BYTES 1948 :SHA256 "b478adb14fd4d413d819831616f19c99ea94f573018a6739deb8b9c051b66a62" :GIT-BLOB
   "51fb85372f5d18a3b1b28e6e5911b5ec5967ada1" :TEXT
   "(:SCOPE-ADAPTER-SELF-TEST :PASSED :NAMESPACE-ADAPTER
 :DISPATCH-HEADING-WITH-UNCHANGED-TD-AND-NATIVE-PARSER :LIBRARY-REPORT
 #A((133) BASE-CHAR
    . \"/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/spikes/out/pool-dispatch-measure/coverage-attempt-01/coverage-audit.lisp\")
 :DISPATCH-TOTAL (110 114 10 10) :SCHEMA-VERSION 1 :KIND
 :POOL-DISPATCH-COVERAGE-AUDIT :STATUS :OK :SCOPE :ENTIRE-NEW-DISPATCH-PACKAGE
 :NATIVE-PATH
 #A((133) BASE-CHAR
    . \"/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/spikes/out/pool-dispatch-measure/coverage-attempt-01/coverage-state.lisp\")
 :HTML-PATH
 #A((130) BASE-CHAR
    . \"/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/spikes/out/pool-dispatch-measure/coverage-attempt-01/cover-index.html\")
 :FILES
 ((:FILE #A((23) BASE-CHAR . \"src/dispatch/build.lisp\") :EXPRESSIONS-HIT 24
   :EXPRESSIONS-TOTAL 24 :BRANCHES-HIT 2 :BRANCHES-TOTAL 2 :MISSING NIL)
  (:FILE #A((23) BASE-CHAR . \"src/dispatch/claim.lisp\") :EXPRESSIONS-HIT 45
   :EXPRESSIONS-TOTAL 49 :BRANCHES-HIT 0 :BRANCHES-TOTAL 0 :MISSING
   ((:NATIVE-INDEX 31 :KIND :EXPRESSION :PATH (1 4 3 3 4 3))
    (:NATIVE-INDEX 32 :KIND :EXPRESSION :PATH (1 1 4 3 3 4 3))
    (:NATIVE-INDEX 33 :KIND :EXPRESSION :PATH (2 1 4 3 3 4 3))
    (:NATIVE-INDEX 34 :KIND :EXPRESSION :PATH (3 1 4 3 3 4 3))))
  (:FILE #A((25) BASE-CHAR . \"src/dispatch/package.lisp\") :EXPRESSIONS-HIT 1
   :EXPRESSIONS-TOTAL 1 :BRANCHES-HIT 0 :BRANCHES-TOTAL 0 :MISSING NIL)
  (:FILE #A((23) BASE-CHAR . \"src/dispatch/types.lisp\") :EXPRESSIONS-HIT 40
   :EXPRESSIONS-TOTAL 40 :BRANCHES-HIT 8 :BRANCHES-TOTAL 8 :MISSING NIL))
 :LIFECYCLE-TOTAL (110 114 10 10) :MINIMUM-PERCENT 95 :HTML-COUNTS
 ((\"src/dispatch/build.lisp\" 24 24 2 2) (\"src/dispatch/claim.lisp\" 45 49 0 0)
  (\"src/dispatch/package.lisp\" 1 1 0 0) (\"src/dispatch/types.lisp\" 40 40 8 8))
 :HTML-COUNTS-ORIGIN :PARSED-SB-COVER-INDEX :SELF-TEST :PASSED :EXCLUSIONS NIL
 :MCDC-INFERRED NIL)
")
  (:PATH
   #A((151) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/spikes/out/pool-dispatch-measure/coverage-attempt-01/dcb336dae682b6b6671cda3619f01f07.html")
   :BYTES 10928 :SHA256 "eeee794bffc61932b7278de0fce3a6961abc6e5295d58762bcb014f6ea696845"
   :GIT-BLOB "f91bae207c593de28f2c03f1fb255f2c48382c03" :TEXT "<html><head><style type='text/css'>
*.state-0 { background-color: #eeeeee }
*.state-1 { background-color: #aaffaa }
*.state-5 { background-color: #44dd44 }
*.state-2 { background-color: #ffaaaa }
*.state-10 { background-color: #ee6666 }
*.state-15 { color: #aaaaaa; background-color: #eeeeee }
*.state-9,*.state-6 { background-color: #ffffaa }
div.key { margin: 20px; width: 200px }
div.source { width: 88ex; background-color: #eeeeee; padding-left: 5px;
             /* border-style: solid none none none; border-width: 1px;
             border-color: #dddddd */ }

*.line-number { color: #666666; float: left; width: 6ex; text-align: right; margin-right: 1ex; }

table.summary tr.head-row { background-color: #aaaaff }
table.summary tr td.text-cell { text-align: left }
table.summary tr td.main-head { text-align: center }
table.summary tr td { text-align: right }
table.summary tr.even { background-color: #eeeeff }
table.summary tr.subheading { background-color: #aaaaff}
table.summary tr.subheading td { text-align: left; font-weight: bold; padding-left: 5ex; }
</style></head><body><h3>Coverage report: /private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/src/dispatch/types.lisp <br />
</h3>
<table class='summary'><tr class='head-row'><td width='80px'>Kind</td><td width='80px'>Covered</td><td width='80px'>All</td><td width='80px'>%</td><tr class='odd'><td>expression</td><td>40</td><td>40</td><td>100.0</td></tr>
<tr class='even'><td>branch</td><td>8</td><td>8</td><td>100.0</td></tr>
</table><div class='key'><b>Key</b><br />
<div class='state-0'>Not instrumented</div><div class='state-15'>Conditionalized out</div><div class='state-1'>Executed</div><div class='state-2'>Not executed</div><div>&#160;</div><div class='state-5'>Both branches taken</div><div class='state-6'>One branch taken</div><div class='state-10'>Neither branch taken</div></div><nobr><div><code>
</code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>1</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#59;&#160;Binding&#160;immutabile&#160;tra&#160;porta&#160;del&#160;pool&#160;e&#160;routing&#160;locale&#160;dello&#160;stesso&#160;worker&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>2</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;OWNER&#58;&#160;dispatcher&#160;e&#160;tabella&#160;del&#160;thread&#160;creatore&#59;&#160;nessuna&#160;migrazione&#160;o&#160;reentrancy&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>3</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;SHARED&#58;&#160;nessuna&#160;nuova&#160;struttura&#160;condivisa&#160;o&#160;scrittura&#160;globale&#160;per&#160;operazione&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>4</code></div><code>&#160;<span class='state-1'>&#40;in&#45;package&#160;&#35;&#58;arcdocdb&#46;scheduler&#46;dispatch&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>5</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;optimize&#160;&#40;safety&#160;3&#41;&#160;&#40;speed&#160;2&#41;&#160;&#40;debug&#160;2&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>6</code></div><code>&#160;<span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>7</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;REQ&#58;&#160;REQ&#45;THR&#45;001&#160;REQ&#45;CON&#45;002&#160;REQ&#45;CON&#45;005&#160;REQ&#45;AFF&#45;008</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>8</code></div><code>&#160;<span class='state-1'>&#40;defstruct&#160;&#40;dispatcher&#45;writer&#45;pool</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>9</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;&#58;constructor&#160;&#37;make&#45;dispatcher&#45;writer&#45;pool&#160;&#40;port&#160;table&#41;&#41;&#160;&#40;&#58;copier&#160;nil&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>10</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#34;Pre&#58;&#160;porta&#160;e&#160;tabella&#160;sul&#160;medesimo&#160;contesto&#160;IDLE&#44;&#160;owner&#160;corrente&#160;verificato&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>11</code></div><code>&#160;<span class='state-1'>Post&#58;&#160;binding&#160;preallocato&#160;immutabile&#59;&#160;nessun&#160;claim&#44;&#160;lease&#160;o&#160;comando&#160;applicato&#46;&#34;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>12</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;port&#160;nil&#160;&#58;type&#160;arcdocdb&#46;scheduler&#58;porta&#45;worker&#45;pool&#160;&#58;read&#45;only&#160;t&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>13</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;table&#160;nil&#160;&#58;type&#160;arcdocdb&#46;execution&#46;series&#58;tabella&#45;worker&#45;serie&#160;&#58;read&#45;only&#160;t&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>14</code></div><code>&#160;<span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>15</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;REQ&#58;&#160;REQ&#45;THR&#45;001&#160;REQ&#45;CON&#45;002&#160;REQ&#45;CON&#45;005&#160;REQ&#45;AFF&#45;008</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>16</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;ftype&#160;&#40;function&#160;&#40;t&#160;t&#41;&#160;null&#41;&#160;&#37;check&#45;dispatcher&#45;binding&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>17</code></div><code>&#160;<span class='state-1'>&#40;defun&#160;&#37;check&#45;dispatcher&#45;binding&#160;&#40;port&#160;table&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>18</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#34;Pre&#58;&#160;factory&#160;o&#160;dispatcher&#160;privato&#46;&#160;Post&#58;&#160;owner&#160;e&#160;identità&#160;del&#160;contesto&#160;validi&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>19</code></div><code>&#160;<span class='state-1'>INVALID&#45;ARGUMENT&#160;configuration&#47;owner&#47;binding&#160;prima&#160;di&#160;ACK&#44;&#160;claim&#160;o&#160;routing&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>20</code></div><code>&#160;<span class='state-1'>Nessuna&#160;lettura&#160;di&#160;fase&#44;&#160;parole&#160;pool&#44;&#160;ready&#44;&#160;lease&#160;o&#160;controller&#160;vivo&#46;&#34;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>21</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;unless&#160;</span><span class='state-5'>&#40;typep&#160;</span><span class='state-1'>port</span><span class='state-5'>&#160;</span><span class='state-1'>&#39;arcdocdb&#46;scheduler&#58;porta&#45;worker&#45;pool</span><span class='state-5'>&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>22</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;error&#160;&#39;invalid&#45;argument&#160;&#58;reason&#160;&#58;pool&#45;dispatcher&#45;configuration&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>23</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;unless&#160;</span><span class='state-5'>&#40;eq&#160;</span><span class='state-1'>&#40;arcdocdb&#46;scheduler&#58;&#58;porta&#45;worker&#45;pool&#45;owner&#160;port&#41;</span><span class='state-5'>&#160;</span><span class='state-1'>sb&#45;thread&#58;&#42;current&#45;thread&#42;</span><span class='state-5'>&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>24</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;error&#160;&#39;invalid&#45;argument&#160;&#58;reason&#160;&#58;pool&#45;worker&#45;owner&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>25</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;unless&#160;</span><span class='state-5'>&#40;typep&#160;</span><span class='state-1'>table</span><span class='state-5'>&#160;</span><span class='state-1'>&#39;arcdocdb&#46;execution&#46;series&#58;tabella&#45;worker&#45;serie</span><span class='state-5'>&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>26</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;error&#160;&#39;invalid&#45;argument&#160;&#58;reason&#160;&#58;pool&#45;dispatcher&#45;configuration&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>27</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;unless&#160;</span><span class='state-5'>&#40;eq&#160;</span><span class='state-1'>&#40;arcdocdb&#46;scheduler&#58;&#58;porta&#45;worker&#45;pool&#45;context&#160;port&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>28</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</span><span class='state-5'>&#160;&#160;&#160;&#160;</span><span class='state-1'>&#40;arcdocdb&#46;execution&#46;series&#58;&#58;tabella&#45;worker&#45;serie&#45;context&#160;table&#41;</span><span class='state-5'>&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>29</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;error&#160;&#39;invalid&#45;argument&#160;&#58;reason&#160;&#58;pool&#45;dispatcher&#45;binding&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>30</code></div><code>&#160;<span class='state-1'>&#160;&#160;nil&#41;</code></div></body></html>")
  (:PATH
   #A((124) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/spikes/out/pool-dispatch-measure/coverage-formal-attempt-01.log")
   :BYTES 291 :SHA256 "fc8c6c8ce6c222788ab2bdacabfac8403e0cf6bca8549b782c720fe4097c3dfd" :GIT-BLOB
   "6a4dad241eb948667048c535ab55720f94ade29d" :TEXT
   ":OK: sbcl --noinform --no-userinit --no-sysinit --script spikes/out/pool-dispatch-measure/coverage-run.lisp --report spikes/out/pool-dispatch-measure/coverage-attempt-01/; record: /private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/spikes/out/4000917538-command-66469-0/report.lisp
")
  (:PATH
   #A((111) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/spikes/out/pool-dispatch-measure/coverage-run.lisp")
   :BYTES 2804 :SHA256 "0fe33cd90ab88b486679dafac8c2bde0d135f26ccd57dbe7939bf9526ab65eb8" :GIT-BLOB
   "160c5c8373b24466e77a46aaae8ea6822d27ad91" :TEXT "(require :asdf)
(require :sb-cover)
(require :sb-posix)
(pushnew :dispatch-coverage-reader-library *features*)
;; Keep startup code-component marks across ASDF GC without modifying any observed bit.
(defmethod asdf:perform :after ((operation asdf:load-op) (component asdf:cl-source-file))
  (declare (ignore operation))
  (when (search \"/src/dispatch/\" (namestring (asdf:component-pathname component)))
    (sb-cover:save-coverage)))
(let* ((args (uiop:command-line-arguments)) (root (truename \"./\"))
       (directory (when (= 2 (length args))
                    (uiop:ensure-directory-pathname (merge-pathnames (second args) root)))))
  (unless (and directory (string= \"--report\" (first args)))
    (error \"COD-61 pool dispatch coverage: use --report fresh-directory/.\"))
  (ensure-directories-exist
   (merge-pathnames \"parent-placeholder\" (uiop:pathname-parent-directory-pathname directory)))
  (sb-posix:mkdir (namestring directory) #o700)
  (handler-bind ((warning (lambda (condition) (error condition)))
                 (style-warning (lambda (condition) (error condition))))
    (multiple-value-bind (fasl warnings failure)
        (compile-file \"spikes/out/pool-dispatch-measure/dispatch-coverage-reader.lisp\"
                      :output-file (merge-pathnames \"reader.fasl\" directory))
      (unless (and fasl (not warnings) (not failure)) (error \"COD-01: dispatch reader compile failure.\"))
      (load fasl)))
  (uiop:symbol-call \"ARCDOCDB.DISPATCH.COVERAGE.READER\" \"ADAPTER-SELF-TEST\")
  (asdf:initialize-output-translations
   `(:output-translations
     (,(merge-pathnames \"**/*.*\" root) ,(merge-pathnames \"fasl/**/*.*\" directory))
     :ignore-inherited-configuration))
  (proclaim '(optimize (sb-cover:store-coverage-data 3)))
  (setf asdf:*compile-file-failure-behaviour* :error asdf:*compile-file-warnings-behaviour* :error)
  (handler-bind ((warning (lambda (condition)
                           (unless (typep condition 'sb-kernel:redefinition-warning) (error condition)))))
    (asdf:load-asd (merge-pathnames \"arcdocdb.asd\" root))
    (asdf:load-system \"arcdocdb/tests\" :force t))
  (uiop:symbol-call \"ARCDOCDB.SCHEDULER.TESTS\" \"RUN\")
  (sb-cover:save-coverage-in-file (merge-pathnames \"coverage-state.lisp\" directory))
  (let ((html (sb-cover:report directory
                              :if-matches (lambda (path)
                                            (search \"/src/dispatch/\" path)))))
    (unless html (error \"COD-60: dispatch source data missing.\"))
    (uiop:symbol-call \"ARCDOCDB.DISPATCH.COVERAGE.READER\" \"AUDIT-DISPATCH-COVERAGE\"
                     (merge-pathnames \"coverage-state.lisp\" directory) html
                     (merge-pathnames \"coverage-audit.lisp\" directory)
                     (merge-pathnames \"coverage-dispatch-audit.lisp\" directory))))
")
  (:PATH
   #A((123) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/spikes/out/pool-dispatch-measure/dispatch-coverage-reader.lisp")
   :BYTES 8250 :SHA256 "6fd835634c9f7e5e4b76d45693bf0a79efe27d243ee0c3223dd41653a7b8cb14" :GIT-BLOB
   "9f67068cb72664b311c24adfa4a74320a8d2faad" :TEXT
   ";;;; C4 adapter: library native/TD/count parser unchanged; whole four-file dispatch scope.
;;;; The legacy audit remains original; metadata-only dispatch audit retains identical counts/missing.
;;;; --self-test; runner calls AUDIT-DISPATCH-COVERAGE after the independent adapter selftest.
(eval-when (:compile-toplevel :load-toplevel :execute)
  (require :asdf)
  (unless (find-package \"ARCDOCDB.LIFECYCLE.COVERAGE.READER\")
    (let ((*features* (cons :lifecycle-coverage-reader-library *features*)))
      (load \"spikes/out/lifecycle-measure/lifecycle-coverage-reader.lisp\"))))
(defpackage #:arcdocdb.dispatch.coverage.reader (:use #:cl))
(in-package #:arcdocdb.dispatch.coverage.reader)
(declaim (optimize (safety 3) (debug 3)))
(defparameter +scope+ '(\"src/dispatch/package.lisp\" \"src/dispatch/types.lisp\"
                        \"src/dispatch/build.lisp\" \"src/dispatch/claim.lisp\"))

(defun dispatch-source-identity (path)
  \"All dispatch-directory files enter the inventory; unexpected modules cannot silently disappear.\"
  (arcdocdb.lifecycle.coverage.reader::reader-require (stringp path) \"dispatch source not a string\")
  (let ((start (if (uiop:string-prefix-p \"src/\" path) 0
                   (let ((position (search \"/src/\" path :from-end t)))
                     (when position (1+ position))))))
    (when start
      (let ((identity (subseq path start)))
        (when (uiop:string-prefix-p \"src/dispatch/\" identity)
          identity)))))

(defun call-dispatch-reader (function)
  \"One-thread C4 adapter restores the library selector even on rejection; no native bit edits.\"
  (let ((original (symbol-function 'arcdocdb.lifecycle.coverage.reader::source-identity))
        (original-html (symbol-function 'arcdocdb.lifecycle.coverage.reader::html-count-rows))
        (arcdocdb.lifecycle.coverage.reader::+scope-files+ +scope+))
    (unwind-protect
         (progn (setf (symbol-function 'arcdocdb.lifecycle.coverage.reader::source-identity)
                      #'dispatch-source-identity
                      (symbol-function 'arcdocdb.lifecycle.coverage.reader::html-count-rows)
                      #'dispatch-html-count-rows)
                (funcall function))
      (setf (symbol-function 'arcdocdb.lifecycle.coverage.reader::source-identity) original
            (symbol-function 'arcdocdb.lifecycle.coverage.reader::html-count-rows) original-html))))


(defun dispatch-html-count-rows (html)
  \"Namespace-only adapter: unchanged native/TD/count parser, original dispatch heading/identities.\"
  (let ((cursor 0) (directory nil) (rows nil) (seen (make-hash-table :test 'equal)))
    (loop for start = (search \"<tr\" html :start2 cursor) while start
          do (let ((close (search \"</tr>\" html :start2 start)))
               (arcdocdb.lifecycle.coverage.reader::reader-require close \"HTML TR delimiter missing\")
               (let ((row (subseq html start (+ close 5))))
                 (cond
                   ((search \"class='subheading'\" row)
                    (let* ((cells (arcdocdb.lifecycle.coverage.reader::html-cells row))
                           (identity (and (= 1 (length cells)) (dispatch-source-identity (first cells)))))
                      (setf directory (when (equal identity \"src/dispatch/\") identity))))
                   ((and directory (or (search \"class='odd'\" row) (search \"class='even'\" row)))
                    (let* ((counts (arcdocdb.lifecycle.coverage.reader::html-data-counts row directory))
                           (identity (first counts)))
                      (arcdocdb.lifecycle.coverage.reader::reader-require
                       (not (gethash identity seen)) \"duplicate HTML source identity\")
                      (setf (gethash identity seen) t)
                      (push counts rows)))
                   (t nil)))
               (setf cursor (+ close 5))))
    (sort rows #'string< :key #'first)))

(defun adapter-self-test ()
  \"Original library malformed input/gate tests plus independent dispatch inventory/path fixtures.\"
  (arcdocdb.lifecycle.coverage.reader::coverage-reader-self-test)
  (call-dispatch-reader
   (lambda ()
     (let* ((native (list (list* \"/a/src/dispatch/package.lisp\" #((0)) #*1)
                          (list* \"/a/src/dispatch/types.lisp\" #((0) (1) (:then 2) (:else 2)) #*1010)
                          (list* \"/a/src/dispatch/build.lisp\" #((0)) #*1)
                          (list* \"/a/src/dispatch/claim.lisp\" #((0)) #*1)
                          (list* \"/a/src/scheduler/pool-claim.lisp\" #((0)) #*1)))
            (rows (arcdocdb.lifecycle.coverage.reader::scope-native-rows native))
            (counts (mapcar #'arcdocdb.lifecycle.coverage.reader::row-counts rows))
            (heading \"<tr class='subheading'><td colspan='7'>/a/src/dispatch/</td></tr>\")
            (html (concatenate 'string heading
                   \"<tr class='odd'><td><a href='b'>build.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='even'><td><a href='c'>claim.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='odd'><td><a href='p'>package.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='even'><td><a href='t'>types.lisp</a></td><td>1</td><td>2</td><td>50</td><td>1</td><td>2</td><td>50</td></tr>\")))
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal counts '((\"src/dispatch/build.lisp\" 1 1 0 0) (\"src/dispatch/claim.lisp\" 1 1 0 0)
                        (\"src/dispatch/package.lisp\" 1 1 0 0) (\"src/dispatch/types.lisp\" 1 2 1 2)))
        \"dispatch independent native count oracle\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal '(4 5 1 2) (arcdocdb.lifecycle.coverage.reader::count-total counts)) \"dispatch denominator oracle\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal counts (arcdocdb.lifecycle.coverage.reader::html-count-rows html)) \"dispatch exact HTML concordance\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal (getf (fourth rows) :missing)
               '((:native-index 1 :kind :expression :path (1))
                 (:native-index 3 :kind :branch :path (:else 2)))) \"dispatch missing paths oracle\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal (dispatch-source-identity \"/a/src/dispatch/unexpected.lisp\") \"src/dispatch/unexpected.lisp\")
        \"unexpected module silently excluded\")
       (arcdocdb.lifecycle.coverage.reader::expect-rejection
        (lambda () (arcdocdb.lifecycle.coverage.reader::scope-native-rows
                    (list (list* \"/a/src/dispatch/types.lisp\" #((0)) #*0)
                          (list* \"/b/src/dispatch/types.lisp\" #((0)) #*1)))))
       (arcdocdb.lifecycle.coverage.reader::expect-rejection
        (lambda () (arcdocdb.lifecycle.coverage.reader::html-count-rows (concatenate 'string html html)))))))
  :passed)

(defun audit-dispatch-coverage (native html library-output dispatch-output)
  \"All four dispatch files, gate95 without exclusions; preserve native/HTML and both audits.\"
  (adapter-self-test)
  (let ((report (call-dispatch-reader
                 (lambda () (arcdocdb.lifecycle.coverage.reader::audit-coverage native html library-output)))))
    (setf (getf report :kind) :pool-dispatch-coverage-audit
          (getf report :scope) :entire-new-dispatch-package
          (getf report :dispatch-total) (getf report :lifecycle-total)
          (getf report :library-report) (namestring library-output)
          (getf report :namespace-adapter) :dispatch-heading-with-unchanged-td-and-native-parser
          (getf report :scope-adapter-self-test) :passed)
    (with-open-file (stream dispatch-output :direction :output :if-exists :error :external-format :utf-8)
      (let ((*print-readably* t)) (write report :stream stream :pretty t) (terpri stream)))
    report))

(unless (member :dispatch-coverage-reader-library *features*)
  (unless (equal (uiop:command-line-arguments) '(\"--self-test\"))
    (error \"COD-61: dispatch coverage adapter use --self-test.\"))
  (adapter-self-test)
  (format t \"~&Dispatch coverage reader self-test PASS~%\"))
")
  (:PATH
   #A((122) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/spikes/out/pool-dispatch-measure/reader-formal-attempt-01.log")
   :BYTES 226 :SHA256 "ac7a38b59902d1b8ad15c464d8c0f0855c72401112613d426f5424bbf2cf631f" :GIT-BLOB
   "bbeacebdce6ef6a67348649cbaefa5a6715c7638" :TEXT
   ":OK: sbcl --noinform --no-userinit --no-sysinit --script spikes/out/pool-dispatch-measure/reader-run.lisp; record: /private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/spikes/out/4000917499-command-65649-0/report.lisp
")
  (:PATH
   #A((109) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/spikes/out/pool-dispatch-measure/reader-run.lisp")
   :BYTES 733 :SHA256 "dfcf2a89ba0c760c81ab8b764f39c3820b552ad1ac2bc54e3dffad9db2ff7404" :GIT-BLOB
   "91b0f586f2011a3eff17b94d483bb74e5e80bfa5" :TEXT "(require :asdf)
(pushnew :dispatch-coverage-reader-library *features*)
(declaim (optimize (safety 3) (debug 3)))
(handler-bind ((warning (lambda (condition) (error condition)))
               (style-warning (lambda (condition) (error condition))))
  (multiple-value-bind (fasl warnings failure)
      (compile-file \"spikes/out/pool-dispatch-measure/dispatch-coverage-reader.lisp\"
                    :output-file \"spikes/out/pool-dispatch-measure/dispatch-coverage-reader.fasl\")
    (unless (and fasl (not warnings) (not failure)) (error \"COD-01: dispatch reader compile failure.\"))
    (load fasl)))
(uiop:symbol-call \"ARCDOCDB.DISPATCH.COVERAGE.READER\" \"ADAPTER-SELF-TEST\")
(format t \"~&Dispatch coverage reader self-test PASS~%\")
")
  (:PATH
   #A((124) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/spikes/out/pool-dispatch-measure/selftest-formal-attempt-01.log")
   :BYTES 391 :SHA256 "537fbdd4f5abe24df83fdc6dca92f2c6db0e3753d7e4cd683f9dee05f3c871fc" :GIT-BLOB
   "f44a2d73d369b340a9c516089befcfa22086ebf4" :TEXT
   ":OK: env ASDF_OUTPUT_TRANSLATIONS=(:output-translations (t \"/private/tmp/arcdocdb-pool-dispatch-qualified-selftest-cache-01/\") :ignore-inherited-configuration) sbcl --noinform --no-userinit --no-sysinit --script spikes/out/pool-dispatch-measure/tool-run.lisp --self-test; record: /private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/spikes/out/4000917499-command-65650-0/report.lisp
")
  (:PATH
   #A((107) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/spikes/out/pool-dispatch-measure/tool-run.lisp")
   :BYTES 642 :SHA256 "758eb0c6a4b443ecdf3c4fc410886480f181394cba81b3b5f2607c73098a6099" :GIT-BLOB
   "c7147031150952f8ea72009f1f208d83852cd20b" :TEXT "(require :asdf)
(pushnew :arcdocdb-pool-dispatch-measure-library *features*)
(declaim (optimize (safety 3) (debug 3)))
(handler-bind ((warning (lambda (condition) (error condition)))
               (style-warning (lambda (condition) (error condition))))
  (multiple-value-bind (fasl warnings failure)
      (compile-file \"tools/measure-pool-dispatch.lisp\"
                    :output-file \"spikes/out/pool-dispatch-measure/measure-pool-dispatch.fasl\")
    (unless (and fasl (not warnings) (not failure))
      (error \"COD-01: tool pool-dispatch compile failure.\"))
    (load fasl)))
(uiop:symbol-call \"ARCDOCDB.POOL-DISPATCH.MEASURE\" \"MAIN\")
")
  (:PATH
   #A((121) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/spikes/out/pool-dispatch-publication-selftest-attempt-01.log")
   :BYTES 232 :SHA256 "8a53c928255bd0f9d7c8825258dfe62e392e948ed86cb4411d8ffcef526a4218" :GIT-BLOB
   "e9eda41405e692714a6a20118efab14233c65d55" :TEXT
   ":OK: sbcl --noinform --no-userinit --no-sysinit --script spikes/out/pool-dispatch-dev/publication-selftest.lisp; record: /private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/spikes/out/4000917478-command-65255-0/report.lisp
")))
