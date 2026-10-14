(:SCHEMA-VERSION 1 :KIND :POOL-WORKER-LIFECYCLE-DEVELOPMENT :VERSION "2026-10-13" :PART 1 :PARTS 1
 :SOURCES
 ((:PATH
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-dev/compile-product-attempt-01.log")
   :BYTES 34 :SHA256 "eb822060ac360d7c70b61a584f855027df9eeb9db5711211cf65f6e89248b6f5" :GIT-BLOB
   "271966228e930825d0e6944d0151bd6a9ae217b4" :TEXT "Product compilation: strict PASS.
")
  (:PATH
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-dev/compile-product.lisp")
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
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-dev/count-full-final.log")
   :BYTES 303 :SHA256 "6bc59c57ad2de853901cc89b9a4fdadeaf52e485bf83db95cc985598a2312723" :GIT-BLOB
   "0ebcf24ea55e92959d84ee06c02459ca1eb080e8" :TEXT "markers=1283 product-named=1277 other=6
ok    package ARCDOCDB presente
ok    ARCDOCDB:*VERSION* è una stringa
ok    bad.lisp: COD-02 COD-03 COD-12 COD-20 COD-22 COD-34 COD-43 COD-50
ok    good.lisp: nessuna violazione
ok    keyword-barrier.lisp: nessuna violazione
ok    qualified-reader.lisp: COD-34
")
  (:PATH
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-dev/count-full-prefix-diagnostic.lisp")
   :BYTES 592 :SHA256 "8bcc9d2d92d748cd6a6e802a11722ecdfba95d0745502d6b3b078144932da5a0" :GIT-BLOB
   "e6cf782d23025b0fb51115e5227cd0cf2d96394b" :TEXT "(require :asdf)
(load \"tools/evidence-storage.lisp\")
(let* ((report (arcdocdb.evidence:read-evidence (first (uiop:command-line-arguments))))
       (lines (uiop:split-string (getf report :stdout) :separator '(#\\Newline)))
       (marks (remove-if-not (lambda (s) (uiop:string-prefix-p \"ok    \" s)) lines))
       (product (count-if (lambda (s) (uiop:string-prefix-p \"ok    TEST-REQ-\" s)) marks)))
  (format t \"~&markers=~D product-named=~D other=~D~%\" (length marks) product (- (length marks) product))
  (dolist (s marks) (unless (uiop:string-prefix-p \"ok    TEST-REQ-\" s) (write-line s))))
")
  (:PATH
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-dev/count-full.lisp")
   :BYTES 584 :SHA256 "993c211e953819a767544e9a7a3ad4ab039862e1f58427b9fa65ca64b633ea5f" :GIT-BLOB
   "39f7a298957df812969796d011fa9d6ded0dd640" :TEXT "(require :asdf)
(load \"tools/evidence-storage.lisp\")
(let* ((report (arcdocdb.evidence:read-evidence (first (uiop:command-line-arguments))))
       (lines (uiop:split-string (getf report :stdout) :separator '(#\\Newline)))
       (marks (remove-if-not (lambda (s) (uiop:string-prefix-p \"ok    \" s)) lines))
       (product (count-if (lambda (s) (uiop:string-prefix-p \"ok    TEST-\" s)) marks)))
  (format t \"~&markers=~D product-named=~D other=~D~%\" (length marks) product (- (length marks) product))
  (dolist (s marks) (unless (uiop:string-prefix-p \"ok    TEST-\" s) (write-line s))))
")
  (:PATH
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-dev/git-ref-quarantine.json")
   :BYTES 857 :SHA256 "000a027f5b0900d4ada7686ca3434494947e1759f5f4b85e5bbc989c7d67d1ce" :GIT-BLOB
   "762faa6af8d0f1a760b1ac16332c24cb21723170" :TEXT "[
  {
    \"original\": \"refs/heads/codex/cbor-array-write 2\",
    \"backup\": \"/Users/gpicchiarelli/Documents/ArcDocDB/.git/codex-ref-quarantine/2026-10-14-1791994758/refs/heads/codex/cbor-array-write 2\",
    \"sha256\": \"0aefed6e84d455c4199fb5a3e61cf88a40b147bb6f00d4019c4f21ff3afac358\",
    \"bytes\": 41
  },
  {
    \"original\": \"refs/heads/main 2\",
    \"backup\": \"/Users/gpicchiarelli/Documents/ArcDocDB/.git/codex-ref-quarantine/2026-10-14-1791994758/refs/heads/main 2\",
    \"sha256\": \"bdbfe90996060f79284ba96739558909ad977a5760b5c5f8a57db43c63545285\",
    \"bytes\": 41
  },
  {
    \"original\": \"refs/remotes/origin/main 2\",
    \"backup\": \"/Users/gpicchiarelli/Documents/ArcDocDB/.git/codex-ref-quarantine/2026-10-14-1791994758/refs/remotes/origin/main 2\",
    \"sha256\": \"bdbfe90996060f79284ba96739558909ad977a5760b5c5f8a57db43c63545285\",
    \"bytes\": 41
  }
]")
  (:PATH
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-dev/lint-attempt-01.log")
   :BYTES 57 :SHA256 "9ecd44802d62037aa7a49e5034b4091f9d5a51fc806e87d1163c84d743fc807d" :GIT-BLOB
   "e283a1864769e8afbc189564d86adb5e4fc3cd52" :TEXT "sbcl --script tools/lint.lisp src
206 file, 0 violazioni
")
  (:PATH
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-dev/lint-attempt-02.log")
   :BYTES 57 :SHA256 "9ecd44802d62037aa7a49e5034b4091f9d5a51fc806e87d1163c84d743fc807d" :GIT-BLOB
   "e283a1864769e8afbc189564d86adb5e4fc3cd52" :TEXT "sbcl --script tools/lint.lisp src
206 file, 0 violazioni
")
  (:PATH
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-dev/publication-selftest-attempt-01.log")
   :BYTES 77 :SHA256 "16eafaf416be09883a10d59f67d8075cc0e3596ae32a47c66a03f97fa9e99235" :GIT-BLOB
   "e4686b9b27ba8ac834b6c05e18378b241ef74b58" :TEXT
   "Recycle publication adapter: valid component and six negative fixtures PASS.
")
  (:PATH
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-dev/publication-selftest.lisp")
   :BYTES 1472 :SHA256 "edbbb3e77977034ea8006cb2fb431a866fbe976f24ab3f769947bf2e5723f39c" :GIT-BLOB
   "3535dbc3c942d8c8f88acd4787eb6f8a2963cc22" :TEXT "(require :asdf)
(let ((*features* (cons :pool-worker-recycle-publication-library *features*)))
  (load \"spikes/out/pool-recycle-publication.lisp\"))
(let* ((paths '(\"src/dispatch/package.lisp\" \"src/dispatch/types.lisp\"
                \"src/dispatch/build.lisp\" \"src/dispatch/claim.lisp\"
                \"src/dispatch/recycle.lisp\"))
       (input #p\"spikes/out/pool-recycle-publication.lisp\")
       (config (list :base \"a5715a1aa0b2571d650d1b794e9bb7b7324e951e\"
                     :snapshot (namestring (truename \"./\")) :paths paths))
       (component (pool-worker-recycle-component-manifest config input)))
  (unless (= 5 (length (getf component :qualified-source-inventory)))
    (error \"C4: inventory count mismatch.\"))
  (pool-worker-recycle-validate-component component)
  (dolist (path paths)
    (let ((negative (copy-list config)))
      (setf (getf negative :paths) (remove path paths :test #'string=))
      (unless (handler-case (progn (pool-worker-recycle-component-manifest negative input) nil)
                (error () t))
        (error \"C4: missing runtime source accepted: ~A.\" path))))
  (let ((bad (copy-tree component)))
    (setf (getf (first (getf bad :qualified-source-inventory)) :sha256) \"invalid\")
    (unless (handler-case (progn (pool-worker-recycle-validate-component bad) nil) (error () t))
      (error \"C4: altered fingerprint accepted.\"))))
(format t \"~&Recycle publication adapter: valid component and six negative fixtures PASS.~%\")
")
  (:PATH
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-dev/trace-attempt-01.log")
   :BYTES 99 :SHA256 "32ab8c77c0d21f6fa9276cce19757f969657b45b143f7dd5dd2d956fbe2a78e9" :GIT-BLOB
   "f83e9754b702583734413366b8ee80c30f1ce181" :TEXT "sbcl --script tools/check-trace.lisp
119 requisiti, 65 invarianti, 13 scenari FI, 52 ADR: 0 errori
")
  (:PATH
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-dev/trace-attempt-02.log")
   :BYTES 99 :SHA256 "32ab8c77c0d21f6fa9276cce19757f969657b45b143f7dd5dd2d956fbe2a78e9" :GIT-BLOB
   "f83e9754b702583734413366b8ee80c30f1ce181" :TEXT "sbcl --script tools/check-trace.lisp
119 requisiti, 65 invarianti, 13 scenari FI, 52 ADR: 0 errori
")
  (:PATH
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-integrated-attempt-01.log")
   :BYTES 146 :SHA256 "7eb7dcb59a4747554b054c948c6acceda32ee4d6568607005c38e2ae955e90ca" :GIT-BLOB
   "035d663f333d43bca6a10af374528cc7cc5be556" :TEXT
   ":OK: make test lint trace; record: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4000984849-command-45285-0/report.lisp
")
  (:PATH
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-measure/coverage-run.lisp")
   :BYTES 2803 :SHA256 "a4f865663ba05ea7cce58d96b867ebe0195a697200f39334b768f014dd7fa5da" :GIT-BLOB
   "f5d0329857a01ff254e082465de7bf1bee5d1958" :TEXT "(require :asdf)
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
        (compile-file \"spikes/out/pool-recycle-measure/dispatch-coverage-reader.lisp\"
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
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-measure/dispatch-coverage-reader.lisp")
   :BYTES 8562 :SHA256 "a6ef7626f2d35824a9c307555090b003cdbd692f709e46c408d722a8087a2739" :GIT-BLOB
   "06dd5e9f34c18b89a7932a8c66e0b236b8fbab7f" :TEXT
   ";;;; C4 adapter: library native/TD/count parser unchanged; whole five-file dispatch scope.
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
                        \"src/dispatch/build.lisp\" \"src/dispatch/claim.lisp\" \"src/dispatch/recycle.lisp\"))

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
                          (list* \"/a/src/dispatch/recycle.lisp\" #((0)) #*1)
                          (list* \"/a/src/scheduler/pool-claim.lisp\" #((0)) #*1)))
            (rows (arcdocdb.lifecycle.coverage.reader::scope-native-rows native))
            (counts (mapcar #'arcdocdb.lifecycle.coverage.reader::row-counts rows))
            (heading \"<tr class='subheading'><td colspan='7'>/a/src/dispatch/</td></tr>\")
            (html (concatenate 'string heading
                   \"<tr class='odd'><td><a href='b'>build.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='even'><td><a href='c'>claim.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='odd'><td><a href='p'>package.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='odd'><td><a href='r'>recycle.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='even'><td><a href='t'>types.lisp</a></td><td>1</td><td>2</td><td>50</td><td>1</td><td>2</td><td>50</td></tr>\")))
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal counts '((\"src/dispatch/build.lisp\" 1 1 0 0) (\"src/dispatch/claim.lisp\" 1 1 0 0)
                        (\"src/dispatch/package.lisp\" 1 1 0 0) (\"src/dispatch/recycle.lisp\" 1 1 0 0)
                        (\"src/dispatch/types.lisp\" 1 2 1 2)))
        \"dispatch independent native count oracle\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal '(5 6 1 2) (arcdocdb.lifecycle.coverage.reader::count-total counts)) \"dispatch denominator oracle\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal counts (arcdocdb.lifecycle.coverage.reader::html-count-rows html)) \"dispatch exact HTML concordance\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal (getf (fifth rows) :missing)
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
  \"All five dispatch files, gate95 without exclusions; preserve native/HTML and both audits.\"
  (adapter-self-test)
  (let ((report (call-dispatch-reader
                 (lambda () (arcdocdb.lifecycle.coverage.reader::audit-coverage native html library-output)))))
    (setf (getf report :kind) :pool-recycle-coverage-audit
          (getf report :scope) :entire-five-file-dispatch-package
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
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-measure/driver-fragment.lisp")
   :BYTES 4510 :SHA256 "539f0a5be924c70ccab3220e8b00fc8734aeebc5b48248db7d625ec66f1f3381" :GIT-BLOB
   "7e147701e3a1a854505b8b59f953d6022a0be075" :TEXT
   "(defun run-driver (args &key (product-loader #'load-product) (tester #'self-test) (runner #'campaign))
  \"Driver recycle compatto; riusa I/O esclusivo e sensore qualificati, preserva raw del fallimento.\"
  (let ((report (make-report)) (directory nil))
    (handler-case
        (progn
          (unless (or (equal args '(\"--self-test\"))
                      (and (= 2 (length args)) (string= \"--bench\" (first args))))
            (error \"COD-61: uso --self-test oppure --bench directory-nuova/.\"))
          (when (= 2 (length args)) (setf directory (acquire-directory (second args))))
          (setf (getf report :stage) :load-product)
          (when directory (write-report report directory))
          (funcall product-loader)
          (setf (getf report :stage) :self-test (getf report :self-test) (funcall tester))
          (when directory
            (setf (getf report :stage) :campaign)
            (funcall runner report (lambda () (write-report report directory))))
          (setf (getf report :status) :ok (getf report :stage) :complete))
      (error (condition)
        (setf (getf report :status) :failed (getf report :diagnostic) (princ-to-string condition))
        (let ((last (car (last (getf report :samples)))))
          (when (and last (eq :running (getf last :status)))
            (setf (getf last :status) :failed (getf last :diagnostic) (princ-to-string condition))))))
    (let ((after (fingerprints)))
      (setf (getf report :source-fingerprints-after) after (getf report :source-consistency)
            (if (equal (getf report :source-fingerprints-before) after) :stable :changed))
      (when (and (eq :ok (getf report :status)) (eq :changed (getf report :source-consistency)))
        (setf (getf report :status) :source-changed (getf report :diagnostic) \"COD-61: sorgenti cambiati.\")))
    (when directory (write-report report directory))
    report))

(defun self-test-reporter ()
  \"Il driver dispatch rifiuta CLI/destinazione e conserva replica conclusa più raw parziale.\"
  (let ((called nil) (root (arcdocdb.pool-lifecycle.measure::fresh-self-test-directory)))
    (unwind-protect
         (progn
           (dolist (args '(nil (\"--bench\") (\"--bad\") (\"--bench\" \"directory\" \"extra\")))
             (unless (and (eq :failed (getf (run-driver args :product-loader (lambda () (setf called t))) :status))
                          (null called))
               (error \"COD-60: CLI invalida eseguita.\")))
           (let* ((existing (acquire-directory (merge-pathnames \"existing/\" root)))
                  (failed (merge-pathnames \"failed/\" root)))
             (write-report '(:sentinel :unchanged) existing)
             (unless (and (eq :failed (getf (run-driver (list \"--bench\" (namestring existing))
                                                      :product-loader (constantly nil)
                                                      :tester (constantly :passed)) :status))
                          (equal (arcdocdb.pool-lifecycle.measure::read-self-test-report existing)
                                 '(:sentinel :unchanged)))
               (error \"COD-60: destinazione precedente non conservata.\"))
             (run-driver (list \"--bench\" (namestring failed))
                         :product-loader (constantly nil) :tester (constantly :passed)
                         :runner (lambda (report checkpoint)
                                   (setf (getf report :current-replica) 1 (getf report :samples)
                                         (list (list :status :ok :raw-ticks 3 :heap-bytes 0)
                                               (list :status :running :raw-ticks 7 :heap-bytes 11
                                                     :diagnostic nil)))
                                   (funcall checkpoint) (error \"fixture: replica interrotta\")))
             (let* ((saved (arcdocdb.pool-lifecycle.measure::read-self-test-report failed))
                    (samples (getf saved :samples)))
               (unless (and (eq :failed (getf saved :status)) (= 1 (getf saved :current-replica))
                            (= 2 (length samples)) (eq :ok (getf (first samples) :status))
                            (eq :failed (getf (second samples) :status))
                            (= 7 (getf (second samples) :raw-ticks))
                            (= 11 (getf (second samples) :heap-bytes)))
                 (error \"COD-60: replica o raw parziale persi.\")))))
      (uiop:delete-directory-tree root :validate t)))
  :passed)


")
  (:PATH
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-measure/reader-run.lisp")
   :BYTES 731 :SHA256 "ae7dc11358a459d702fa92762d3c59181a388abe6eb7840643eeb868bf588858" :GIT-BLOB
   "d574a7e2da650b36371a1ba667e8156e8afd1f30" :TEXT "(require :asdf)
(pushnew :dispatch-coverage-reader-library *features*)
(declaim (optimize (safety 3) (debug 3)))
(handler-bind ((warning (lambda (condition) (error condition)))
               (style-warning (lambda (condition) (error condition))))
  (multiple-value-bind (fasl warnings failure)
      (compile-file \"spikes/out/pool-recycle-measure/dispatch-coverage-reader.lisp\"
                    :output-file \"spikes/out/pool-recycle-measure/dispatch-coverage-reader.fasl\")
    (unless (and fasl (not warnings) (not failure)) (error \"COD-01: dispatch reader compile failure.\"))
    (load fasl)))
(uiop:symbol-call \"ARCDOCDB.DISPATCH.COVERAGE.READER\" \"ADAPTER-SELF-TEST\")
(format t \"~&Dispatch coverage reader self-test PASS~%\")
")
  (:PATH
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-measure/reader-selftest-dev-01.stderr")
   :BYTES 0 :SHA256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" :GIT-BLOB
   "e69de29bb2d1d6434b8b29ae775ad8c2e48c5391" :TEXT "")
  (:PATH
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-measure/reader-selftest-dev-01.stdout")
   :BYTES 40 :SHA256 "db5aa48c4888096c9ee4671504ea0d717f4cbba7b005007a92e13233bd4c9da9" :GIT-BLOB
   "f2658eef8970964e8d8994d3b24609f768845762" :TEXT "Dispatch coverage reader self-test PASS
")
  (:PATH
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-measure/tool-run-dev-01-and-02.lisp")
   :BYTES 637 :SHA256 "4135e389ed847836d0496e5c4e7ce801bf1ff36013fd531d4b4daa9eb4cee986" :GIT-BLOB
   "7d7259c282e88db76e1dc098062ec9e299031c80" :TEXT "(require :asdf)
(pushnew :arcdocdb-pool-recycle-measure-library *features*)
(declaim (optimize (safety 3) (debug 3)))
(handler-bind ((warning (lambda (condition) (error condition)))
               (style-warning (lambda (condition) (error condition))))
  (multiple-value-bind (fasl warnings failure)
      (compile-file \"tools/measure-pool-recycle.lisp\"
                    :output-file \"spikes/out/pool-recycle-measure/measure-pool-recycle.fasl\")
    (unless (and fasl (not warnings) (not failure))
      (error \"COD-01: tool pool-dispatch compile failure.\"))
    (load fasl)))
(uiop:symbol-call \"ARCDOCDB.POOL-RECYCLE.MEASURE\" \"MAIN\")
")
  (:PATH
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-measure/tool-run.lisp")
   :BYTES 636 :SHA256 "69db490da4df9b19a9b820a6e3844c1f763da7f87d28e7cbfc74b5fdbb922769" :GIT-BLOB
   "a0171bfc074ec042598995434fb7b9c114eb64ce" :TEXT "(require :asdf)
(pushnew :arcdocdb-pool-recycle-measure-library *features*)
(declaim (optimize (safety 3) (debug 3)))
(handler-bind ((warning (lambda (condition) (error condition)))
               (style-warning (lambda (condition) (error condition))))
  (multiple-value-bind (fasl warnings failure)
      (compile-file \"tools/measure-pool-recycle.lisp\"
                    :output-file \"spikes/out/pool-recycle-measure/measure-pool-recycle.fasl\")
    (unless (and fasl (not warnings) (not failure))
      (error \"COD-01: tool pool-recycle compile failure.\"))
    (load fasl)))
(uiop:symbol-call \"ARCDOCDB.POOL-RECYCLE.MEASURE\" \"MAIN\")
")
  (:PATH
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-measure/tool-selftest-dev-01.stderr")
   :BYTES 547 :SHA256 "8c9fe1b58466e390b9cf5bf66b325587b521012410437798c88c5db2a08a0aa8" :GIT-BLOB
   "10db5b67ddf4003164a81baed27bb08a8fe7c68a" :TEXT "; 
; caught ERROR:
;   READ error during COMPILE-FILE:
;   
;     unmatched close parenthesis
;   
;       Line: 338, Column: 86, File-Position: 20893
;   
;       Stream: #<SB-INT:FORM-TRACKING-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/pool-recycle.lisp\" {800C3F0393}>
; 
; compilation unit aborted
;   caught 2 fatal ERROR conditions
;   caught 1 ERROR condition
tools/measure-pool-recycle.lisp: COMPILE-FILE-ERROR while
compiling #<CL-SOURCE-FILE \"arcdocdb/tests\" \"scheduler\" \"pool-recycle\">
")
  (:PATH
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-measure/tool-selftest-dev-01.stdout")
   :BYTES 73475 :SHA256 "81206580601d4d04316376491fc6000f599fa8284a630b2431ca1f2f2c414787"
   :GIT-BLOB "04bf1d64294b3627200b79c2105fd3b389196d38" :TEXT
   "(:SCHEMA-VERSION 1 :KIND :POOL-RECYCLE-BENCHMARK :STATUS :FAILED :STAGE
 :LOAD-PRODUCT :DIAGNOSTIC
 #A((96) BASE-CHAR . \"COMPILE-FILE-ERROR while
compiling #<CL-SOURCE-FILE \\\"arcdocdb/tests\\\" \\\"scheduler\\\" \\\"pool-recycle\\\">\")
 :PROCESS-ARGV
 (#A((48) BASE-CHAR . \"/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl\")
  #A((11) BASE-CHAR . \"--self-test\"))
 :TOOL-ARGUMENTS (#A((11) BASE-CHAR . \"--self-test\"))
 :SOURCE-FINGERPRINTS-BEFORE
 ((:FILE \"arcdocdb.asd\" :MD5
   #A((32) BASE-CHAR . \"eef14ae2d95854c867d15d35f3435c18\"))
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
  (:FILE \"src/codec/cbor-array-input.lisp\" :MD5
   #A((32) BASE-CHAR . \"560fa1b10432d16edb830014e95ea4dc\"))
  (:FILE \"src/codec/cbor-array-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"0429206ab6069f053c66da4c56439cfb\"))
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
   #A((32) BASE-CHAR . \"4656fe55c934e9eaca3db8c72d76f1cd\"))
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
   #A((32) BASE-CHAR . \"36674625e81b78e3b97ab7068dfff88a\"))
  (:FILE \"src/control/preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"2dfc2b76c1d3c382db8b50071bdaeadf\"))
  (:FILE \"src/control/prepare.lisp\" :MD5
   #A((32) BASE-CHAR . \"c2667a324b14b2547bee2c8016e6d6c1\"))
  (:FILE \"src/control/publication-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"0e2492b2c97e8d3f7692668f5e09b44f\"))
  (:FILE \"src/control/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"93ce63e1bd43f2e64dc3f233035f0a94\"))
  (:FILE \"src/control/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"468fcf430eede17a38b922dfd373a746\"))
  (:FILE \"src/control/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f525c21d06bf7abb9ee7c4eab9ac380e\"))
  (:FILE \"src/csn/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1130012fc5613a5648d22ed8628be0e8\"))
  (:FILE \"src/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1cdb5661fc54beba5bf00e4765f3235\"))
  (:FILE \"src/dispatch/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"ba4cd961094f37a157d49b8d7024b677\"))
  (:FILE \"src/dispatch/claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"b10caeff4f726c0ebd01e2c6d1baacba\"))
  (:FILE \"src/dispatch/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1528cc1a6fc7b5a2e0900c29dc090f92\"))
  (:FILE \"src/dispatch/recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"8213217d99f5cfb76ddfca12613be77f\"))
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
   #A((32) BASE-CHAR . \"fc1cbc7b30e0d74c359e9ee1bbd201ec\"))
  (:FILE \"src/io/namespace.lisp\" :MD5
   #A((32) BASE-CHAR . \"8898b56d45e22212f1db37f208230f34\"))
  (:FILE \"src/io/native-namespace.lisp\" :MD5
   #A((32) BASE-CHAR . \"4c0c79a243bd691d3a602afd89b77980\"))
  (:FILE \"src/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"58030bc0c811248a6537e2909d8762d6\"))
  (:FILE \"src/io/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d5458684a1b169bacc46bc87fdaffed4\"))
  (:FILE \"src/io/rename.lisp\" :MD5
   #A((32) BASE-CHAR . \"40a1415771121f68afaa5165a0c23465\"))
  (:FILE \"src/io/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"2f8bd851d09ab994d8d01b231697d1a1\"))
  (:FILE \"src/io/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"ec3e94e0eb6b3c0c6ce2bb091af42e2e\"))
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
  (:FILE \"tests/codec/cbor-array-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6b76f5728245279ac2549814c033bc91\"))
  (:FILE \"tests/codec/cbor-array-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"9de35b86b0a0ca59064d840e49fe57b1\"))
  (:FILE \"tests/codec/cbor-array-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"b9d14be96752dcf8318c82878549672c\"))
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
  (:FILE \"tests/get-active/construction.lisp\" :MD5
   #A((32) BASE-CHAR . \"447bcc0feb60a5a668474060df098cd7\"))
  (:FILE \"tests/get-active/directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"0de1b79cfcdf9dd19a4336c745726576\"))
  (:FILE \"tests/get-active/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"da12d6e2b34116951e37764beab59c2a\"))
  (:FILE \"tests/get-active/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"9cbecf43fcd898db4f74826bf2c29fa3\"))
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
  (:FILE \"tests/io/rename-native.lisp\" :MD5
   #A((32) BASE-CHAR . \"d79c13ea447cd8694b14bc6391d7e3ee\"))
  (:FILE \"tests/io/rename.lisp\" :MD5
   #A((32) BASE-CHAR . \"87acf2a7abb532d41aef472600184643\"))
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
  (:FILE \"tests/scheduler/pool-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"bf81a4ad203461b3e94255e3a1eed0dc\"))
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
  (:FILE \"tools/measure-pool-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"a581f19c76238f68191cc3354d877593\")))
 :SOURCE-FINGERPRINTS-AFTER
 ((:FILE \"arcdocdb.asd\" :MD5
   #A((32) BASE-CHAR . \"eef14ae2d95854c867d15d35f3435c18\"))
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
  (:FILE \"src/codec/cbor-array-input.lisp\" :MD5
   #A((32) BASE-CHAR . \"560fa1b10432d16edb830014e95ea4dc\"))
  (:FILE \"src/codec/cbor-array-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"0429206ab6069f053c66da4c56439cfb\"))
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
   #A((32) BASE-CHAR . \"4656fe55c934e9eaca3db8c72d76f1cd\"))
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
   #A((32) BASE-CHAR . \"36674625e81b78e3b97ab7068dfff88a\"))
  (:FILE \"src/control/preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"2dfc2b76c1d3c382db8b50071bdaeadf\"))
  (:FILE \"src/control/prepare.lisp\" :MD5
   #A((32) BASE-CHAR . \"c2667a324b14b2547bee2c8016e6d6c1\"))
  (:FILE \"src/control/publication-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"0e2492b2c97e8d3f7692668f5e09b44f\"))
  (:FILE \"src/control/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"93ce63e1bd43f2e64dc3f233035f0a94\"))
  (:FILE \"src/control/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"468fcf430eede17a38b922dfd373a746\"))
  (:FILE \"src/control/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f525c21d06bf7abb9ee7c4eab9ac380e\"))
  (:FILE \"src/csn/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1130012fc5613a5648d22ed8628be0e8\"))
  (:FILE \"src/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1cdb5661fc54beba5bf00e4765f3235\"))
  (:FILE \"src/dispatch/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"ba4cd961094f37a157d49b8d7024b677\"))
  (:FILE \"src/dispatch/claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"b10caeff4f726c0ebd01e2c6d1baacba\"))
  (:FILE \"src/dispatch/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1528cc1a6fc7b5a2e0900c29dc090f92\"))
  (:FILE \"src/dispatch/recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"8213217d99f5cfb76ddfca12613be77f\"))
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
   #A((32) BASE-CHAR . \"fc1cbc7b30e0d74c359e9ee1bbd201ec\"))
  (:FILE \"src/io/namespace.lisp\" :MD5
   #A((32) BASE-CHAR . \"8898b56d45e22212f1db37f208230f34\"))
  (:FILE \"src/io/native-namespace.lisp\" :MD5
   #A((32) BASE-CHAR . \"4c0c79a243bd691d3a602afd89b77980\"))
  (:FILE \"src/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"58030bc0c811248a6537e2909d8762d6\"))
  (:FILE \"src/io/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d5458684a1b169bacc46bc87fdaffed4\"))
  (:FILE \"src/io/rename.lisp\" :MD5
   #A((32) BASE-CHAR . \"40a1415771121f68afaa5165a0c23465\"))
  (:FILE \"src/io/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"2f8bd851d09ab994d8d01b231697d1a1\"))
  (:FILE \"src/io/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"ec3e94e0eb6b3c0c6ce2bb091af42e2e\"))
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
  (:FILE \"tests/codec/cbor-array-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6b76f5728245279ac2549814c033bc91\"))
  (:FILE \"tests/codec/cbor-array-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"9de35b86b0a0ca59064d840e49fe57b1\"))
  (:FILE \"tests/codec/cbor-array-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"b9d14be96752dcf8318c82878549672c\"))
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
  (:FILE \"tests/get-active/construction.lisp\" :MD5
   #A((32) BASE-CHAR . \"447bcc0feb60a5a668474060df098cd7\"))
  (:FILE \"tests/get-active/directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"0de1b79cfcdf9dd19a4336c745726576\"))
  (:FILE \"tests/get-active/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"da12d6e2b34116951e37764beab59c2a\"))
  (:FILE \"tests/get-active/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"9cbecf43fcd898db4f74826bf2c29fa3\"))
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
  (:FILE \"tests/io/rename-native.lisp\" :MD5
   #A((32) BASE-CHAR . \"d79c13ea447cd8694b14bc6391d7e3ee\"))
  (:FILE \"tests/io/rename.lisp\" :MD5
   #A((32) BASE-CHAR . \"87acf2a7abb532d41aef472600184643\"))
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
  (:FILE \"tests/scheduler/pool-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"bf81a4ad203461b3e94255e3a1eed0dc\"))
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
  (:FILE \"tools/measure-pool-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"a581f19c76238f68191cc3354d877593\")))
 :SOURCE-CONSISTENCY :STABLE :RECORDED-AT 4000983879 :SELF-TEST NIL :SAMPLES
 NIL :CURRENT-REPLICA NIL :SBCL #A((5) BASE-CHAR . \"2.6.9\") :MACHINE
 #A((5) BASE-CHAR . \"ARM64\") :OS #A((6) BASE-CHAR . \"Darwin\") :OS-VERSION
 #A((6) BASE-CHAR . \"27.0.0\") :SAFETY 3 :ITERATIONS 4096 :WARMUP 128 :REPLICAS
 5 :TIMER-UNITS-PER-SECOND 1000000 :CAMPAIGNS
 ((:ROOM :SHARDS 1 :RING-CAPACITY 1 :WRITERS 1 :WRITER-CAPACITY 8192
   :PAYLOADS-PER-WRITER 4226 :QUANTUM 1 :RECYCLE-PER-CYCLE 1 :CLAIM-PER-CYCLE 1
   :BEGIN-POP-ACK-END-PER-CYCLE 1 :TOKEN 31)
  (:FULL :SHARDS 1 :RING-CAPACITY 1 :WRITERS 2 :WRITER-CAPACITY 8192
   :PAYLOADS-PER-WRITER 4226 :QUANTUM 1 :RECYCLE-PER-CYCLE 1 :CLAIM-PER-CYCLE 0
   :BEGIN-POP-ACK-END-PER-CYCLE 1 :ALTERNATING-WRITER-IDENTITY T :TOKEN 43))
 :TOKEN-FORMULA \"sample=N*cycle-token+N*(N-1)/2; ROOM=31; FULL=43\" :LIMITS
 (:FRESH-FIXTURE-PER-REPLICA :PREALLOCATED-PRODUCT-AND-INPUTS
  :STARTUP-CLAIM-FIRST-TRATTO-DRAIN-AND-GC-EXCLUDED
  :PUBLIC-BOUNDED-DRAIN-AFTER-CLOCK :C1-PROTOCOL-AND-SCALAR-ORACLES-IN-CLOCK
  :NOT-ISOLATED-WRAPPER-THROUGHPUT :COUNTER-NOT-ABSOLUTE-NONALLOCATION-PROOF
  :EXTERNAL-LOAD-UNCONTROLLED :CLOCK-ZERO-IS-BELOW-RESOLUTION
  :NO-TIME-THRESHOLD-NO-TUNING-CLAIM :NO-IO-IN-CYCLE
  :NO-BRIDGE-BEGIN-OR-LIVE-SERIES-LEASE-IN-CLOCK :NO-CONCURRENT-COORDINATOR
  :NO-PHYSICAL-WORKER-LIFECYCLE-QUALIFICATION))
")
  (:PATH
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-measure/tool-selftest-dev-02.stderr")
   :BYTES 8635 :SHA256 "d492de74bb6b022642618348c93e73d28f95f3909a1f51d6c8453e88d3120bf5" :GIT-BLOB
   "9125ccc953fb258cb2f87e8dd0395e5e6988d4d2" :TEXT
   "Unhandled SIMPLE-WARNING in thread #<SB-THREAD:THREAD tid=259 \"main thread\" RUNNING
                                      {80086C0603}>:
  undefined variable: ARCDOCDB.POOL-RECYCLE.MEASURE::FILES

Backtrace for: #<SB-THREAD:THREAD tid=259 \"main thread\" RUNNING {80086C0603}>
0: (SB-DEBUG::DEBUGGER-DISABLED-HOOK #<SIMPLE-WARNING #<SB-FORMAT::FMT-CONTROL \"undefined ~(~A~): ~/SB-EXT:PRINT-SYMBOL-WITH-PREFIX/\"> {800823DDB3}> #<unused argument> :QUIT T)
1: (SB-DEBUG::RUN-HOOK SB-EXT:*INVOKE-DEBUGGER-HOOK* #<SIMPLE-WARNING #<SB-FORMAT::FMT-CONTROL \"undefined ~(~A~): ~/SB-EXT:PRINT-SYMBOL-WITH-PREFIX/\"> {800823DDB3}>)
2: (INVOKE-DEBUGGER #<SIMPLE-WARNING #<SB-FORMAT::FMT-CONTROL \"undefined ~(~A~): ~/SB-EXT:PRINT-SYMBOL-WITH-PREFIX/\"> {800823DDB3}>)
3: (ERROR #<SIMPLE-WARNING #<SB-FORMAT::FMT-CONTROL \"undefined ~(~A~): ~/SB-EXT:PRINT-SYMBOL-WITH-PREFIX/\"> {800823DDB3}>)
4: ((LAMBDA (CONDITION) :IN \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-measure/tool-run.lisp\") #<SIMPLE-WARNING #<SB-FORMAT::FMT-CONTROL \"undefined ~(~A~): ~/SB-EXT:PRINT-SYMBOL-WITH-PREFIX/\"> {800823DDB3}>)
5: (SB-KERNEL::%SIGNAL #<SIMPLE-WARNING #<SB-FORMAT::FMT-CONTROL \"undefined ~(~A~): ~/SB-EXT:PRINT-SYMBOL-WITH-PREFIX/\"> {800823DDB3}>)
6: (SB-C::COMPILER-WARNING-HANDLER #<SIMPLE-WARNING #<SB-FORMAT::FMT-CONTROL \"undefined ~(~A~): ~/SB-EXT:PRINT-SYMBOL-WITH-PREFIX/\"> {800823DDB3}>)
7: (SB-KERNEL::%SIGNAL #<SIMPLE-WARNING #<SB-FORMAT::FMT-CONTROL \"undefined ~(~A~): ~/SB-EXT:PRINT-SYMBOL-WITH-PREFIX/\"> {800823DDB3}>)
8: ((FLET SB-KERNEL::%WARN :IN \"SYS:SRC;CODE;WARM-ERROR.LISP\") #<SB-FORMAT::FMT-CONTROL \"undefined ~(~A~): ~/SB-EXT:PRINT-SYMBOL-WITH-PREFIX/\"> #<SB-KERNEL::CONDITION-CLASSOID WARNING> SIMPLE-WARNING :VARIABLE FILES)
9: (SB-C:COMPILER-WARN #<SB-FORMAT::FMT-CONTROL \"undefined ~(~A~): ~/SB-EXT:PRINT-SYMBOL-WITH-PREFIX/\"> :VARIABLE FILES)
10: (SB-C::SUMMARIZE-COMPILATION-UNIT NIL)
11: ((FLET \"CLEANUP-FUN-\" :IN SB-C::%WITH-COMPILATION-UNIT)) [cleanup]
12: ((FLET SB-C::WITH-IT :IN SB-C::%WITH-COMPILATION-UNIT))
13: (SB-C::SUB-COMPILE-FILE #<SB-C::SOURCE-INFO {80086906B3}> NIL)
14: (COMPILE-FILE \"tools/measure-pool-recycle.lisp\" :OUTPUT-FILE \"spikes/out/pool-recycle-measure/measure-pool-recycle.fasl\" :VERBOSE NIL :PRINT NIL :EXTERNAL-FORMAT :DEFAULT :PROGRESS NIL :TRACE-FILE NIL :BLOCK-COMPILE NIL :ENTRY-POINTS NIL :EMIT-CFASL NIL)
15: (\"top level form\") [toplevel]
16: ((FLET \"G\" :IN SB-C::%COMPILE-IN-LEXENV))
17: (SB-C::%COMPILE-IN-LEXENV (LET ((SB-KERNEL:*HANDLER-CLUSTERS* (CONS (LIST # #) . #1=(SB-KERNEL:*HANDLER-CLUSTERS*)))) (DECLARE (DYNAMIC-EXTENT . #1#)) (PROGN (MULTIPLE-VALUE-BIND (COMMON-LISP-USER::FASL COMMON-LISP-USER::WARNINGS COMMON-LISP-USER::FAILURE) (COMPILE-FILE \"tools/measure-pool-recycle.lisp\" :OUTPUT-FILE \"spikes/out/pool-recycle-measure/measure-pool-recycle.fasl\") (UNLESS (AND COMMON-LISP-USER::FASL # #) (ERROR \"COD-01: tool pool-dispatch compile failure.\")) (LOAD COMMON-LISP-USER::FASL)))) #<NULL-LEXENV> NIL #<SB-C::SOURCE-INFO {8008690423}> 3 NIL T T)
18: (SB-C:EVAL-WITH-COMPILE-IN-LEXENV (LET ((SB-KERNEL:*HANDLER-CLUSTERS* (CONS (LIST # #) . #1=(SB-KERNEL:*HANDLER-CLUSTERS*)))) (DECLARE (DYNAMIC-EXTENT . #1#)) (PROGN (MULTIPLE-VALUE-BIND (COMMON-LISP-USER::FASL COMMON-LISP-USER::WARNINGS COMMON-LISP-USER::FAILURE) (COMPILE-FILE \"tools/measure-pool-recycle.lisp\" :OUTPUT-FILE \"spikes/out/pool-recycle-measure/measure-pool-recycle.fasl\") (UNLESS (AND COMMON-LISP-USER::FASL # #) (ERROR \"COD-01: tool pool-dispatch compile failure.\")) (LOAD COMMON-LISP-USER::FASL)))) #<NULL-LEXENV> #<SB-C::SOURCE-INFO {8008690423}> 3 NIL)
19: (SB-IMPL::%SIMPLE-EVAL (LET ((SB-KERNEL:*HANDLER-CLUSTERS* (CONS (LIST # #) . #1=(SB-KERNEL:*HANDLER-CLUSTERS*)))) (DECLARE (DYNAMIC-EXTENT . #1#)) (PROGN (MULTIPLE-VALUE-BIND (COMMON-LISP-USER::FASL COMMON-LISP-USER::WARNINGS COMMON-LISP-USER::FAILURE) (COMPILE-FILE \"tools/measure-pool-recycle.lisp\" :OUTPUT-FILE \"spikes/out/pool-recycle-measure/measure-pool-recycle.fasl\") (UNLESS (AND COMMON-LISP-USER::FASL # #) (ERROR \"COD-01: tool pool-dispatch compile failure.\")) (LOAD COMMON-LISP-USER::FASL)))) #<NULL-LEXENV>)
20: (SB-INT:SIMPLE-EVAL-IN-LEXENV (HANDLER-BIND ((WARNING (LAMBDA (CONDITION) (ERROR CONDITION))) (STYLE-WARNING (LAMBDA (CONDITION) (ERROR CONDITION)))) (MULTIPLE-VALUE-BIND (COMMON-LISP-USER::FASL COMMON-LISP-USER::WARNINGS COMMON-LISP-USER::FAILURE) (COMPILE-FILE \"tools/measure-pool-recycle.lisp\" :OUTPUT-FILE \"spikes/out/pool-recycle-measure/measure-pool-recycle.fasl\") (UNLESS (AND COMMON-LISP-USER::FASL (NOT COMMON-LISP-USER::WARNINGS) (NOT COMMON-LISP-USER::FAILURE)) (ERROR \"COD-01: tool pool-dispatch compile failure.\")) (LOAD COMMON-LISP-USER::FASL))) #<NULL-LEXENV>)
21: (SB-EXT:EVAL-TLF (HANDLER-BIND ((WARNING (LAMBDA (CONDITION) (ERROR CONDITION))) (STYLE-WARNING (LAMBDA (CONDITION) (ERROR CONDITION)))) (MULTIPLE-VALUE-BIND (COMMON-LISP-USER::FASL COMMON-LISP-USER::WARNINGS COMMON-LISP-USER::FAILURE) (COMPILE-FILE \"tools/measure-pool-recycle.lisp\" :OUTPUT-FILE \"spikes/out/pool-recycle-measure/measure-pool-recycle.fasl\") (UNLESS (AND COMMON-LISP-USER::FASL (NOT COMMON-LISP-USER::WARNINGS) (NOT COMMON-LISP-USER::FAILURE)) (ERROR \"COD-01: tool pool-dispatch compile failure.\")) (LOAD COMMON-LISP-USER::FASL))) 3 NIL)
22: ((LABELS SB-FASL::EVAL-FORM :IN SB-INT:LOAD-AS-SOURCE) (HANDLER-BIND ((WARNING (LAMBDA (CONDITION) (ERROR CONDITION))) (STYLE-WARNING (LAMBDA (CONDITION) (ERROR CONDITION)))) (MULTIPLE-VALUE-BIND (COMMON-LISP-USER::FASL COMMON-LISP-USER::WARNINGS COMMON-LISP-USER::FAILURE) (COMPILE-FILE \"tools/measure-pool-recycle.lisp\" :OUTPUT-FILE \"spikes/out/pool-recycle-measure/measure-pool-recycle.fasl\") (UNLESS (AND COMMON-LISP-USER::FASL (NOT COMMON-LISP-USER::WARNINGS) (NOT COMMON-LISP-USER::FAILURE)) (ERROR \"COD-01: tool pool-dispatch compile failure.\")) (LOAD COMMON-LISP-USER::FASL))) 3)
23: ((LAMBDA (SB-KERNEL:FORM &KEY :CURRENT-INDEX &ALLOW-OTHER-KEYS) :IN SB-INT:LOAD-AS-SOURCE) (HANDLER-BIND ((WARNING (LAMBDA (CONDITION) (ERROR CONDITION))) (STYLE-WARNING (LAMBDA (CONDITION) (ERROR CONDITION)))) (MULTIPLE-VALUE-BIND (COMMON-LISP-USER::FASL COMMON-LISP-USER::WARNINGS COMMON-LISP-USER::FAILURE) (COMPILE-FILE \"tools/measure-pool-recycle.lisp\" :OUTPUT-FILE \"spikes/out/pool-recycle-measure/measure-pool-recycle.fasl\") (UNLESS (AND COMMON-LISP-USER::FASL (NOT COMMON-LISP-USER::WARNINGS) (NOT COMMON-LISP-USER::FAILURE)) (ERROR \"COD-01: tool pool-dispatch compile failure.\")) (LOAD COMMON-LISP-USER::FASL))) :CURRENT-INDEX 3)
24: (SB-C::%DO-FORMS-FROM-INFO #<FUNCTION (LAMBDA (SB-KERNEL:FORM &KEY :CURRENT-INDEX &ALLOW-OTHER-KEYS) :IN SB-INT:LOAD-AS-SOURCE) {1057B0F1B}> #<SB-C::SOURCE-INFO {8008690423}> SB-C::INPUT-ERROR-IN-LOAD)
25: (SB-INT:LOAD-AS-SOURCE #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-measure/tool-run.lisp\" {8008690043}> :VERBOSE NIL :PRINT NIL :CONTEXT \"loading\")
26: ((LABELS SB-FASL::LOAD-STREAM-1 :IN LOAD) #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-measure/tool-run.lisp\" {8008690043}> NIL)
27: (SB-FASL::CALL-WITH-LOAD-BINDINGS #<FUNCTION (LABELS SB-FASL::LOAD-STREAM-1 :IN LOAD) {1057B09EB}> #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-measure/tool-run.lisp\" {8008690043}> NIL #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-measure/tool-run.lisp\" {8008690043}>)
28: ((LABELS SB-FASL::LOAD-STREAM :IN LOAD) #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-measure/tool-run.lisp\" {8008690043}> NIL)
29: (LOAD #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-measure/tool-run.lisp\" {8008690043}> :VERBOSE NIL :PRINT NIL :IF-DOES-NOT-EXIST :ERROR :EXTERNAL-FORMAT :DEFAULT)
30: ((FLET SB-IMPL::LOAD-SCRIPT :IN SB-IMPL::PROCESS-SCRIPT) #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-measure/tool-run.lisp\" {8008690043}>)
31: ((FLET SB-UNIX::BODY :IN SB-IMPL::PROCESS-SCRIPT))
32: ((FLET \"WITHOUT-INTERRUPTS-BODY-\" :IN SB-IMPL::PROCESS-SCRIPT))
33: (SB-IMPL::PROCESS-SCRIPT \"spikes/out/pool-recycle-measure/tool-run.lisp\")
34: (SB-IMPL::TOPLEVEL-INIT)
35: ((FLET SB-UNIX::BODY :IN SB-IMPL::START-LISP))
36: ((FLET \"WITHOUT-INTERRUPTS-BODY-3\" :IN SB-IMPL::START-LISP))
37: (SB-IMPL::%START-LISP)

unhandled condition in --disable-debugger mode, quitting
")
  (:PATH
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-measure/tool-selftest-dev-02.stdout")
   :BYTES 0 :SHA256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" :GIT-BLOB
   "e69de29bb2d1d6434b8b29ae775ad8c2e48c5391" :TEXT "")
  (:PATH
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-measure/tool-selftest-dev-03.stderr")
   :BYTES 0 :SHA256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" :GIT-BLOB
   "e69de29bb2d1d6434b8b29ae775ad8c2e48c5391" :TEXT "")
  (:PATH
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-measure/tool-selftest-dev-03.stdout")
   :BYTES 75975 :SHA256 "8d15450f703d63f65df1e5779293574f374940b28def4f5377ddd0f846cf9c02"
   :GIT-BLOB "81873b504e0a383402a3ea3cd1415663d96991a4" :TEXT
   "(:SCHEMA-VERSION 1 :KIND :POOL-RECYCLE-BENCHMARK :STATUS :OK :STAGE :COMPLETE
 :DIAGNOSTIC NIL :PROCESS-ARGV
 (#A((48) BASE-CHAR . \"/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl\")
  #A((11) BASE-CHAR . \"--self-test\"))
 :TOOL-ARGUMENTS (#A((11) BASE-CHAR . \"--self-test\"))
 :SOURCE-FINGERPRINTS-BEFORE
 ((:FILE \"arcdocdb.asd\" :MD5
   #A((32) BASE-CHAR . \"eef14ae2d95854c867d15d35f3435c18\"))
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
  (:FILE \"src/codec/cbor-array-input.lisp\" :MD5
   #A((32) BASE-CHAR . \"560fa1b10432d16edb830014e95ea4dc\"))
  (:FILE \"src/codec/cbor-array-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"0429206ab6069f053c66da4c56439cfb\"))
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
   #A((32) BASE-CHAR . \"4656fe55c934e9eaca3db8c72d76f1cd\"))
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
   #A((32) BASE-CHAR . \"36674625e81b78e3b97ab7068dfff88a\"))
  (:FILE \"src/control/preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"2dfc2b76c1d3c382db8b50071bdaeadf\"))
  (:FILE \"src/control/prepare.lisp\" :MD5
   #A((32) BASE-CHAR . \"c2667a324b14b2547bee2c8016e6d6c1\"))
  (:FILE \"src/control/publication-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"0e2492b2c97e8d3f7692668f5e09b44f\"))
  (:FILE \"src/control/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"93ce63e1bd43f2e64dc3f233035f0a94\"))
  (:FILE \"src/control/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"468fcf430eede17a38b922dfd373a746\"))
  (:FILE \"src/control/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f525c21d06bf7abb9ee7c4eab9ac380e\"))
  (:FILE \"src/csn/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1130012fc5613a5648d22ed8628be0e8\"))
  (:FILE \"src/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1cdb5661fc54beba5bf00e4765f3235\"))
  (:FILE \"src/dispatch/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"ba4cd961094f37a157d49b8d7024b677\"))
  (:FILE \"src/dispatch/claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"b10caeff4f726c0ebd01e2c6d1baacba\"))
  (:FILE \"src/dispatch/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1528cc1a6fc7b5a2e0900c29dc090f92\"))
  (:FILE \"src/dispatch/recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"c3e120f7a7faba59ffb52e8dc0de96d6\"))
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
   #A((32) BASE-CHAR . \"fc1cbc7b30e0d74c359e9ee1bbd201ec\"))
  (:FILE \"src/io/namespace.lisp\" :MD5
   #A((32) BASE-CHAR . \"8898b56d45e22212f1db37f208230f34\"))
  (:FILE \"src/io/native-namespace.lisp\" :MD5
   #A((32) BASE-CHAR . \"4c0c79a243bd691d3a602afd89b77980\"))
  (:FILE \"src/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"58030bc0c811248a6537e2909d8762d6\"))
  (:FILE \"src/io/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d5458684a1b169bacc46bc87fdaffed4\"))
  (:FILE \"src/io/rename.lisp\" :MD5
   #A((32) BASE-CHAR . \"40a1415771121f68afaa5165a0c23465\"))
  (:FILE \"src/io/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"2f8bd851d09ab994d8d01b231697d1a1\"))
  (:FILE \"src/io/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"ec3e94e0eb6b3c0c6ce2bb091af42e2e\"))
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
  (:FILE \"tests/codec/cbor-array-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6b76f5728245279ac2549814c033bc91\"))
  (:FILE \"tests/codec/cbor-array-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"9de35b86b0a0ca59064d840e49fe57b1\"))
  (:FILE \"tests/codec/cbor-array-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"b9d14be96752dcf8318c82878549672c\"))
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
  (:FILE \"tests/get-active/construction.lisp\" :MD5
   #A((32) BASE-CHAR . \"447bcc0feb60a5a668474060df098cd7\"))
  (:FILE \"tests/get-active/directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"0de1b79cfcdf9dd19a4336c745726576\"))
  (:FILE \"tests/get-active/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"da12d6e2b34116951e37764beab59c2a\"))
  (:FILE \"tests/get-active/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"9cbecf43fcd898db4f74826bf2c29fa3\"))
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
  (:FILE \"tests/io/rename-native.lisp\" :MD5
   #A((32) BASE-CHAR . \"d79c13ea447cd8694b14bc6391d7e3ee\"))
  (:FILE \"tests/io/rename.lisp\" :MD5
   #A((32) BASE-CHAR . \"87acf2a7abb532d41aef472600184643\"))
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
  (:FILE \"tests/scheduler/pool-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"8c1264656e39ff936f904948f6b36802\"))
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
  (:FILE \"tools/measure-pool-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"2e6331ee278fb15d92f0350ed59eafd0\")))
 :SOURCE-FINGERPRINTS-AFTER
 ((:FILE \"arcdocdb.asd\" :MD5
   #A((32) BASE-CHAR . \"eef14ae2d95854c867d15d35f3435c18\"))
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
  (:FILE \"src/codec/cbor-array-input.lisp\" :MD5
   #A((32) BASE-CHAR . \"560fa1b10432d16edb830014e95ea4dc\"))
  (:FILE \"src/codec/cbor-array-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"0429206ab6069f053c66da4c56439cfb\"))
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
   #A((32) BASE-CHAR . \"4656fe55c934e9eaca3db8c72d76f1cd\"))
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
   #A((32) BASE-CHAR . \"36674625e81b78e3b97ab7068dfff88a\"))
  (:FILE \"src/control/preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"2dfc2b76c1d3c382db8b50071bdaeadf\"))
  (:FILE \"src/control/prepare.lisp\" :MD5
   #A((32) BASE-CHAR . \"c2667a324b14b2547bee2c8016e6d6c1\"))
  (:FILE \"src/control/publication-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"0e2492b2c97e8d3f7692668f5e09b44f\"))
  (:FILE \"src/control/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"93ce63e1bd43f2e64dc3f233035f0a94\"))
  (:FILE \"src/control/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"468fcf430eede17a38b922dfd373a746\"))
  (:FILE \"src/control/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f525c21d06bf7abb9ee7c4eab9ac380e\"))
  (:FILE \"src/csn/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1130012fc5613a5648d22ed8628be0e8\"))
  (:FILE \"src/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1cdb5661fc54beba5bf00e4765f3235\"))
  (:FILE \"src/dispatch/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"ba4cd961094f37a157d49b8d7024b677\"))
  (:FILE \"src/dispatch/claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"b10caeff4f726c0ebd01e2c6d1baacba\"))
  (:FILE \"src/dispatch/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1528cc1a6fc7b5a2e0900c29dc090f92\"))
  (:FILE \"src/dispatch/recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"c3e120f7a7faba59ffb52e8dc0de96d6\"))
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
   #A((32) BASE-CHAR . \"fc1cbc7b30e0d74c359e9ee1bbd201ec\"))
  (:FILE \"src/io/namespace.lisp\" :MD5
   #A((32) BASE-CHAR . \"8898b56d45e22212f1db37f208230f34\"))
  (:FILE \"src/io/native-namespace.lisp\" :MD5
   #A((32) BASE-CHAR . \"4c0c79a243bd691d3a602afd89b77980\"))
  (:FILE \"src/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"58030bc0c811248a6537e2909d8762d6\"))
  (:FILE \"src/io/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d5458684a1b169bacc46bc87fdaffed4\"))
  (:FILE \"src/io/rename.lisp\" :MD5
   #A((32) BASE-CHAR . \"40a1415771121f68afaa5165a0c23465\"))
  (:FILE \"src/io/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"2f8bd851d09ab994d8d01b231697d1a1\"))
  (:FILE \"src/io/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"ec3e94e0eb6b3c0c6ce2bb091af42e2e\"))
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
  (:FILE \"tests/codec/cbor-array-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6b76f5728245279ac2549814c033bc91\"))
  (:FILE \"tests/codec/cbor-array-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"9de35b86b0a0ca59064d840e49fe57b1\"))
  (:FILE \"tests/codec/cbor-array-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"b9d14be96752dcf8318c82878549672c\"))
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
  (:FILE \"tests/get-active/construction.lisp\" :MD5
   #A((32) BASE-CHAR . \"447bcc0feb60a5a668474060df098cd7\"))
  (:FILE \"tests/get-active/directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"0de1b79cfcdf9dd19a4336c745726576\"))
  (:FILE \"tests/get-active/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"da12d6e2b34116951e37764beab59c2a\"))
  (:FILE \"tests/get-active/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"9cbecf43fcd898db4f74826bf2c29fa3\"))
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
  (:FILE \"tests/io/rename-native.lisp\" :MD5
   #A((32) BASE-CHAR . \"d79c13ea447cd8694b14bc6391d7e3ee\"))
  (:FILE \"tests/io/rename.lisp\" :MD5
   #A((32) BASE-CHAR . \"87acf2a7abb532d41aef472600184643\"))
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
  (:FILE \"tests/scheduler/pool-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"8c1264656e39ff936f904948f6b36802\"))
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
  (:FILE \"tools/measure-pool-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"2e6331ee278fb15d92f0350ed59eafd0\")))
 :SOURCE-CONSISTENCY :STABLE :RECORDED-AT 4000984177 :SELF-TEST
 (:STATUS :OK :SHARED-SENSOR
  (:STATUS :OK :BASELINE
   (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096 :WARMUP-ITERATIONS
    128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS 36 :SECONDS 3.6d-5
    :TIME-QUALITY :MEASURED :SINK 8386560 :DIAGNOSTIC NIL :EXPECTED-SINK
    8386560)
   :POSITIVE-CONTROL
   (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 16 :WARMUP-ITERATIONS 0
    :COMPLETED-ITERATIONS 16 :HEAP-BYTES 16777472 :RAW-TICKS 53 :SECONDS 5.3d-5
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
    :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 4 :SECONDS 4.0d-6
    :TIME-QUALITY :MEASURED :SINK 318 :DIAGNOSTIC NIL :EXPECTED-SINK 318)
   :COMPOSED-REGISTRY-PROBE
   (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
    :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 9 :SECONDS 9.0d-6
    :TIME-QUALITY :MEASURED :SINK 142 :DIAGNOSTIC NIL :EXPECTED-SINK 142)
   :INVALID-CLI :REJECTED :OWNER-AND-REGISTRY-ORACLE-POSITIVE-NEGATIVE :PASSED
   :INVALID-NON-HOT :PASSED :EXISTING-DESTINATION-AND-PARTIAL-RAW :PASSED
   :MEASURED-PARTIAL-RAW
   (:REPLICA 0 :STATUS :EXPECTED-REJECTION :STAGE :MEASURED :ITERATIONS 4
    :WARMUP-ITERATIONS 0 :COMPLETED-ITERATIONS 1 :HEAP-BYTES 0 :RAW-TICKS 7
    :SECONDS 7.0d-6 :TIME-QUALITY :MEASURED :SINK 0 :DIAGNOSTIC
    #A((26) BASE-CHAR . \"fixture: misura interrotta\") :EXPECTED-SINK 6))
  :RECYCLE-ORACLES :PASSED :RECYCLE-CLI-AND-PARTIAL-RAW :PASSED :ROOM
  (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
   :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 25 :SECONDS 2.5d-5
   :TIME-QUALITY :MEASURED :SINK 130 :DIAGNOSTIC NIL :EXPECTED-SINK 130)
  :FULL
  (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
   :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 21 :SECONDS 2.1d-5
   :TIME-QUALITY :MEASURED :SINK 178 :DIAGNOSTIC NIL :EXPECTED-SINK 178))
 :SAMPLES NIL :CURRENT-REPLICA NIL :SBCL #A((5) BASE-CHAR . \"2.6.9\") :MACHINE
 #A((5) BASE-CHAR . \"ARM64\") :OS #A((6) BASE-CHAR . \"Darwin\") :OS-VERSION
 #A((6) BASE-CHAR . \"27.0.0\") :SAFETY 3 :ITERATIONS 4096 :WARMUP 128 :REPLICAS
 5 :TIMER-UNITS-PER-SECOND 1000000 :CAMPAIGNS
 ((:ROOM :SHARDS 1 :RING-CAPACITY 1 :WRITERS 1 :WRITER-CAPACITY 8192
   :PAYLOADS-PER-WRITER 4226 :QUANTUM 1 :RECYCLE-PER-CYCLE 1 :CLAIM-PER-CYCLE 1
   :BEGIN-POP-ACK-END-PER-CYCLE 1 :TOKEN 31)
  (:FULL :SHARDS 1 :RING-CAPACITY 1 :WRITERS 2 :WRITER-CAPACITY 8192
   :PAYLOADS-PER-WRITER 4226 :QUANTUM 1 :RECYCLE-PER-CYCLE 1 :CLAIM-PER-CYCLE 0
   :BEGIN-POP-ACK-END-PER-CYCLE 1 :ALTERNATING-WRITER-IDENTITY T :TOKEN 43))
 :TOKEN-FORMULA \"sample=N*cycle-token+N*(N-1)/2; ROOM=31; FULL=43\" :LIMITS
 (:FRESH-FIXTURE-PER-REPLICA :PREALLOCATED-PRODUCT-AND-INPUTS
  :STARTUP-CLAIM-FIRST-TRATTO-DRAIN-AND-GC-EXCLUDED
  :PUBLIC-BOUNDED-DRAIN-AFTER-CLOCK :C1-PROTOCOL-AND-SCALAR-ORACLES-IN-CLOCK
  :NOT-ISOLATED-WRAPPER-THROUGHPUT :COUNTER-NOT-ABSOLUTE-NONALLOCATION-PROOF
  :EXTERNAL-LOAD-UNCONTROLLED :CLOCK-ZERO-IS-BELOW-RESOLUTION
  :NO-TIME-THRESHOLD-NO-TUNING-CLAIM :NO-IO-IN-CYCLE
  :NO-BRIDGE-BEGIN-OR-LIVE-SERIES-LEASE-IN-CLOCK :NO-CONCURRENT-COORDINATOR
  :NO-PHYSICAL-WORKER-LIFECYCLE-QUALIFICATION))
")
  (:PATH
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-measure/tool-source-dev-01.lisp")
   :BYTES 20115 :SHA256 "9dca1cc269c65286b624120da4a8d2ef325d994d06053caaee30b9a753aa9686"
   :GIT-BLOB "d918fb50674a7ca62f99af4c715e107189a37a1f" :TEXT
   ";;;; C4: ROOM e FULL reali con ricircolo, claim se room, begin/pop/ack/end.
;;;; Cinque fixture indipendenti: 4096 cicli +128 warmup, 4226 payload/writer, quantum1.
;;;; Factory, claim iniziale, GC e drain finale fuori clock; nessun reset privato.
;;;; Il clock include il protocollo C1 che ristabilisce RESCHEDULE e gli oracoli scalari.
;;;; --self-test | --bench directory-nuova/. Feature: :arcdocdb-pool-recycle-measure-library.
;;; REQ: REQ-CON-005 REQ-AFF-008 REQ-THR-001 REQ-BEN-001 REQ-BEN-002
;;; OWNER: dispatcher, contesto, link, target e sensore allo stesso thread C4.
;;; SHARED: ready autentico privato alla fixture; nessun coordinatore concorrente nel clock.
(eval-when (:compile-toplevel :load-toplevel :execute)
  (require :asdf)
  (unless (find-package \"ARCDOCDB.POOL-LIFECYCLE.MEASURE\")
    (let ((*features* (cons :arcdocdb-pool-lifecycle-measure-library *features*)))
      (load \"tools/measure-pool-lifecycle.lisp\"))))
(defpackage #:arcdocdb.pool-recycle.measure
  (:use #:cl)
  (:import-from #:arcdocdb.pool-lifecycle.measure
                #:lookup-function #:sample #:sample-record #:acquire-directory #:write-report
                #:load-product #:+iterations+ #:+warmup+ #:+replicas+))
(in-package #:arcdocdb.pool-recycle.measure)
(declaim (optimize (safety 3) (speed 2) (debug 2)))
(defconstant +payload-count+ 4226)

(defun fingerprints ()
  \"Stabilita: biblioteca, questo sensore e tutti i sorgenti/test prodotto.\"
  (append (arcdocdb.pool-lifecycle.measure::fingerprints)
          (list (list :file \"tools/measure-pool-recycle.lisp\"
                      :md5 (format nil \"~(~{~2,'0X~}~)\"
                                   (coerce (sb-md5:md5sum-file \"tools/measure-pool-recycle.lisp\") 'list))))))
(defun api (name &optional (package \"ARCDOCDB.SCHEDULER.DISPATCH\"))
  \"Risolve API pubbliche prima del clock, senza ricerca nomi nel tratto misurato.\"
  (multiple-value-bind (symbol visibility) (find-symbol name package)
    (unless (and symbol (eq :external visibility) (fboundp symbol))
      (error \"COD-60: API pubblica ~A/~A assente.\" package name))
    (symbol-function symbol)))
(defun make-series ()
  \"Backend pubblico C4 locale, nessun I/O nel protocollo C1 della campagna.\"
  (let* ((backend (funcall (api \"MAKE-BACKEND\" \"ARCDOCDB.IO\")
                           (lambda (path mode) (declare (ignore path mode)) 812)
                           (lambda (&rest arguments) (declare (ignore arguments))
                             (error \"COD-60: lettura I/O inattesa nella fixture recycle.\"))
                           (lambda (fd bytes start count) (declare (ignore fd bytes start)) count)
                           (lambda (fd) (declare (ignore fd)) 0)
                           (lambda (fd) (declare (ignore fd)) 0)
                           (lambda (fd) (declare (ignore fd)) 0)))
         (file (funcall (api \"CREA-TEMPORANEO\" \"ARCDOCDB.IO\") \"pool-recycle-C4.tmp\" :backend backend))
         (log (funcall (api \"CREA-LOG-IO\" \"ARCDOCDB.WAL\") file :segment 812)))
    (values (funcall (api \"CREA-CONTROLLORE-SERIE\" \"ARCDOCDB.SERIES\")
                     (funcall (api \"CREA-REGISTRO-CSN\" \"ARCDOCDB.CSN\") :capacity 4) log :capacity 2)
            file)))
(defun preload-writer (index payload)
  \"4226 payload simbolici immutabili; accettazione e obbligo iniziale verificati fuori clock.\"
  (let ((writer (funcall (api \"CREA-WRITER-PROGRAMMABILE\" \"ARCDOCDB.EXECUTION\")
                          :capacity 8192 :quantum 1 :routing-index index))
        (enqueue (api \"ACCODA-LAVORO-WRITER\" \"ARCDOCDB.EXECUTION\")))
    (dotimes (i +payload-count+)
      (multiple-value-bind (count action) (funcall enqueue writer payload)
        (unless (and (= (1+ i) count) (eq (if (zerop i) :schedule :queued) action))
          (error \"COD-60: preload perde count o obbligo iniziale.\"))))
    writer))
(defun make-fixture (full)
  \"Un ring autentico capacity1, uno/due writer, dispatcher e tabella preallocati.\"
  (multiple-value-bind (controller file) (make-series)
    (let* ((ready (funcall (api \"CREA-LISTA-WRITER-PRONTI\" \"ARCDOCDB.EXECUTION\") :shards 1 :capacity 1))
           (context (funcall (api \"CREA-CONTESTO-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\") ready))
           (port (funcall (api \"CREA-PORTA-WORKER-POOL\" \"ARCDOCDB.SCHEDULER\") context))
           (a (preload-writer 0 :recycle-a)) (b (when full (preload-writer 1 :recycle-b)))
           (writers (if full (vector a b) (vector a)))
           (controllers (if full (vector controller controller) (vector controller)))
           (registry (funcall (api \"CREA-REGISTRO-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\")
                              writers controllers))
           (table (funcall (api \"CREA-TABELLA-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\") context registry))
           (links (funcall (lookup-function \"TABELLA-WORKER-SERIE-LINKS\" \"ARCDOCDB.EXECUTION.SERIES\") table))
           (dispatcher (funcall (api \"CREA-DISPATCHER-WRITER-POOL\") port table)))
      (unless (= 1 (funcall (api \"PUBBLICA-WRITER-PRONTO\" \"ARCDOCDB.EXECUTION\") ready 0 a))
        (error \"COD-60: pubblicazione A iniziale difforme.\"))
      (multiple-value-bind (link action cursor lifecycle)
          (funcall (api \"PRENDI-COLLEGAMENTO-POOL\") dispatcher)
        (unless (and (eq (svref links 0) link) (eq :claimed action)
                     (zerop cursor) (eq :unchanged lifecycle))
          (error \"COD-60: claim iniziale difforme.\")))
      (when full
        (unless (= 1 (funcall (api \"PUBBLICA-WRITER-PRONTO\" \"ARCDOCDB.EXECUTION\") ready 0 b))
          (error \"COD-60: pubblicazione B iniziale difforme.\")))
      (values dispatcher context writers links file))))
(defun consume-one (context target payload begin pop ack end)
  \"Una lease, un payload con token, un ack e un end; nessuna collezione di risultati.\"
  (unless (plusp (funcall begin context)) (error \"COD-60: lease non positiva.\"))
  (multiple-value-bind (count status token) (funcall pop context target 0 1)
    (unless (and (= 1 count) (eq :messages status) (plusp token) (eq payload (svref target 0)))
      (error \"COD-60: payload/count/token di pop difforme.\"))
    (funcall ack context token))
  (funcall end context))
(defun verify-recycle (recycle dispatcher expected status count)
  \"Oracolo indipendente su tutti e tre i risultati, compresa identita del link.\"
  (multiple-value-bind (link action actual-count) (funcall recycle dispatcher)
    (unless (and (eq expected link) (eq status action) (eql count actual-count))
      (error \"COD-60: recycle ~S/~S/~S invece di ~S/~S/~S.\"
             link action actual-count expected status count))))
(defun drain-fixture (dispatcher context writers file)
  \"Fuori clock: drena ogni obbligo soltanto con API pubbliche, limite2*4226+4.\"
  (let ((claim (api \"PRENDI-COLLEGAMENTO-POOL\")) (recycle (api \"RICIRCOLA-COLLEGAMENTO-POOL\"))
        (state (api \"STATO-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\"))
        (writer (api \"WRITER-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\"))
        (begin (api \"INIZIA-TRATTO-WORKER\" \"ARCDOCDB.EXECUTION\"))
        (pop (api \"PRELEVA-LAVORI-WORKER\" \"ARCDOCDB.EXECUTION\"))
        (ack (api \"CONFERMA-LAVORI-WORKER\" \"ARCDOCDB.EXECUTION\"))
        (end (api \"TERMINA-TRATTO-WORKER\" \"ARCDOCDB.EXECUTION\")) (target (vector nil)))
    (unwind-protect
         (loop repeat (+ (* 2 +payload-count+) 4)
               do (case (funcall state context)
                    (:reschedule (funcall recycle dispatcher))
                    (:idle (multiple-value-bind (link status) (funcall claim dispatcher)
                             (declare (ignore link))
                             (when (eq status :empty) (return-from drain-fixture :drained))
                             (unless (eq status :claimed) (error \"COD-60: drain claim difforme.\"))))
                    (:claimed nil)
                    (otherwise (error \"COD-60: drain con fase inattesa.\")))
                  (when (eq :claimed (funcall state context))
                    (consume-one context target
                                 (if (eq (svref writers 0) (funcall writer context)) :recycle-a :recycle-b)
                                 begin pop ack end))
               finally (error \"COD-60: drain fuori budget esplicito.\"))
      (funcall (api \"CHIUDI\" \"ARCDOCDB.IO\") file))))
(defun create-cycle (full)
  \"ROOM: recycle+claim+tratto; FULL: recycle+tratto, alternando A/B; un ciclo ritorna RESCHEDULE.\"
  (multiple-value-bind (dispatcher context writers links file) (make-fixture full)
    (let ((recycle (api \"RICIRCOLA-COLLEGAMENTO-POOL\")) (claim (api \"PRENDI-COLLEGAMENTO-POOL\"))
          (begin (api \"INIZIA-TRATTO-WORKER\" \"ARCDOCDB.EXECUTION\"))
          (pop (api \"PRELEVA-LAVORI-WORKER\" \"ARCDOCDB.EXECUTION\"))
          (ack (api \"CONFERMA-LAVORI-WORKER\" \"ARCDOCDB.EXECUTION\"))
          (end (api \"TERMINA-TRATTO-WORKER\" \"ARCDOCDB.EXECUTION\"))
          (state (api \"STATO-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\"))
          (writer (api \"WRITER-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\"))
          (link-state (api \"STATO-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\"))
          (cursor (lookup-function \"CONTESTO-WORKER-WRITER-CURSOR\" \"ARCDOCDB.EXECUTION\"))
          (target (vector nil)) (index 0))
      (unless (eq :schedule (consume-one context target :recycle-a begin pop ack end))
        (error \"COD-60: tratto iniziale non produce RESCHEDULE.\"))
      (values
       (lambda ()
         (declare (type fixnum index))
         (when full (setf index (- 1 index)))
         (verify-recycle recycle dispatcher (when full (svref links index))
                         (if full :claimed :published) 1)
         (unless full
           (multiple-value-bind (link status next action) (funcall claim dispatcher)
             (unless (and (eq (svref links 0) link) (eq :claimed status)
                          (zerop next) (eq :unchanged action))
               (error \"COD-60: claim ROOM difforme.\"))))
         (unless (and (eq :claimed (funcall state context))
                      (eq (svref writers index) (funcall writer context))
                      (eq :idle (funcall link-state (svref links index)))
                      (zerop (funcall cursor context)))
           (error \"COD-60: obbligo/link/cursore dopo ricircolo difforme.\"))
         (unless (and (eq :schedule (consume-one context target (if (zerop index) :recycle-a :recycle-b)
                                               begin pop ack end))
                      (eq :reschedule (funcall state context))
                      (eq (svref writers index) (funcall writer context))
                      (zerop (funcall cursor context)))
           (error \"COD-60: fine ciclo non conserva RESCHEDULE/cursore/writer.\"))
         (if full 43 31))
       (if full 43 31) (lambda () (drain-fixture dispatcher context writers file))))))
(defun create-room-cycle () (create-cycle nil))
(defun create-full-cycle () (create-cycle t))
(defun campaign-group (name maker report checkpoint)
  \"Nuova fixture per ciascuna replica: budget payload indipendente e cleanup sempre fuori clock.\"
  (dotimes (replica +replicas+)
    (multiple-value-bind (function token cleanup) (funcall maker)
      (unwind-protect
           (let ((progress (sample-record replica +iterations+ +warmup+ token)))
             (setf (getf progress :campaign) name (getf report :current-replica) replica
                   (getf report :samples) (append (getf report :samples) (list progress)))
             (funcall checkpoint)
             (sample function +iterations+ token progress)
             (funcall checkpoint)
             (unless (zerop (getf progress :heap-bytes))
               (setf (getf progress :status) :failed (getf progress :diagnostic) \"COD-30: heap osservato positivo.\")
               (error \"COD-30: heap positivo nella campagna ~S replica ~D.\" name replica)))
        (funcall cleanup))))
  report)
(defun campaign (report checkpoint)
  \"Due costi composti preregistrati; nessuna attribuzione al solo wrapper C3.\"
  (campaign-group :room #'create-room-cycle report checkpoint)
  (campaign-group :full #'create-full-cycle report checkpoint)
  (setf (getf report :current-replica) nil) report)
(defun make-report ()
  \"Raw, costi inclusi e limiti: protocollo C1 reale, nessuna misura di park/wake o coordinatore vivo.\"
  (list :schema-version 1 :kind :pool-recycle-benchmark :status :running :stage :pending
        :diagnostic nil :process-argv sb-ext:*posix-argv* :tool-arguments (uiop:command-line-arguments)
        :source-fingerprints-before (fingerprints) :source-fingerprints-after nil
        :source-consistency :pending :recorded-at (get-universal-time) :self-test nil
        :samples nil :current-replica nil :sbcl (lisp-implementation-version)
        :machine (machine-type) :os (software-type) :os-version (software-version) :safety 3
        :iterations +iterations+ :warmup +warmup+ :replicas +replicas+
        :timer-units-per-second internal-time-units-per-second
        :campaigns '((:room :shards 1 :ring-capacity 1 :writers 1 :writer-capacity 8192
                     :payloads-per-writer 4226 :quantum 1 :recycle-per-cycle 1 :claim-per-cycle 1
                     :begin-pop-ack-end-per-cycle 1 :token 31)
                    (:full :shards 1 :ring-capacity 1 :writers 2 :writer-capacity 8192
                     :payloads-per-writer 4226 :quantum 1 :recycle-per-cycle 1 :claim-per-cycle 0
                     :begin-pop-ack-end-per-cycle 1 :alternating-writer-identity t :token 43))
        :token-formula \"sample=N*cycle-token+N*(N-1)/2; ROOM=31; FULL=43\"
        :limits '(:fresh-fixture-per-replica :preallocated-product-and-inputs
                  :startup-claim-first-tratto-drain-and-gc-excluded :public-bounded-drain-after-clock
                  :c1-protocol-and-scalar-oracles-in-clock :not-isolated-wrapper-throughput
                  :counter-not-absolute-nonallocation-proof :external-load-uncontrolled
                  :clock-zero-is-below-resolution :no-time-threshold-no-tuning-claim
                  :no-io-in-cycle :no-bridge-begin-or-live-series-lease-in-clock
                  :no-concurrent-coordinator :no-physical-worker-lifecycle-qualification)))
(defun run-driver (args &key (product-loader #'load-product) (tester #'self-test) (runner #'campaign))
  \"Driver recycle compatto; riusa I/O esclusivo e sensore qualificati, preserva raw del fallimento.\"
  (let ((report (make-report)) (directory nil))
    (handler-case
        (progn
          (unless (or (equal args '(\"--self-test\"))
                      (and (= 2 (length args)) (string= \"--bench\" (first args))))
            (error \"COD-61: uso --self-test oppure --bench directory-nuova/.\"))
          (when (= 2 (length args)) (setf directory (acquire-directory (second args))))
          (setf (getf report :stage) :load-product)
          (when directory (write-report report directory))
          (funcall product-loader)
          (setf (getf report :stage) :self-test (getf report :self-test) (funcall tester))
          (when directory
            (setf (getf report :stage) :campaign)
            (funcall runner report (lambda () (write-report report directory))))
          (setf (getf report :status) :ok (getf report :stage) :complete))
      (error (condition)
        (setf (getf report :status) :failed (getf report :diagnostic) (princ-to-string condition))
        (let ((last (car (last (getf report :samples)))))
          (when (and last (eq :running (getf last :status)))
            (setf (getf last :status) :failed (getf last :diagnostic) (princ-to-string condition))))))
    (let ((after (fingerprints)))
      (setf (getf report :source-fingerprints-after) after (getf report :source-consistency)
            (if (equal (getf report :source-fingerprints-before) after) :stable :changed))
      (when (and (eq :ok (getf report :status)) (eq :changed (getf report :source-consistency)))
        (setf (getf report :status) :source-changed (getf report :diagnostic) \"COD-61: sorgenti cambiati.\")))
    (when directory (write-report report directory))
    report))

(defun self-test-reporter ()
  \"Il driver dispatch rifiuta CLI/destinazione e conserva replica conclusa più raw parziale.\"
  (let ((called nil) (root (arcdocdb.pool-lifecycle.measure::fresh-self-test-directory)))
    (unwind-protect
         (progn
           (dolist (args '(nil (\"--bench\") (\"--bad\") (\"--bench\" \"directory\" \"extra\")))
             (unless (and (eq :failed (getf (run-driver args :product-loader (lambda () (setf called t))) :status))
                          (null called))
               (error \"COD-60: CLI invalida eseguita.\")))
           (let* ((existing (acquire-directory (merge-pathnames \"existing/\" root)))
                  (failed (merge-pathnames \"failed/\" root)))
             (write-report '(:sentinel :unchanged) existing)
             (unless (and (eq :failed (getf (run-driver (list \"--bench\" (namestring existing))
                                                      :product-loader (constantly nil)
                                                      :tester (constantly :passed)) :status))
                          (equal (arcdocdb.pool-lifecycle.measure::read-self-test-report existing)
                                 '(:sentinel :unchanged)))
               (error \"COD-60: destinazione precedente non conservata.\"))
             (run-driver (list \"--bench\" (namestring failed))
                         :product-loader (constantly nil) :tester (constantly :passed)
                         :runner (lambda (report checkpoint)
                                   (setf (getf report :current-replica) 1 (getf report :samples)
                                         (list (list :status :ok :raw-ticks 3 :heap-bytes 0)
                                               (list :status :running :raw-ticks 7 :heap-bytes 11
                                                     :diagnostic nil)))
                                   (funcall checkpoint) (error \"fixture: replica interrotta\")))
             (let* ((saved (arcdocdb.pool-lifecycle.measure::read-self-test-report failed))
                    (samples (getf saved :samples)))
               (unless (and (eq :failed (getf saved :status)) (= 1 (getf saved :current-replica))
                            (= 2 (length samples)) (eq :ok (getf (first samples) :status))
                            (eq :failed (getf (second samples) :status))
                            (= 7 (getf (second samples) :raw-ticks))
                            (= 11 (getf (second samples) :heap-bytes)))
                 (error \"COD-60: replica o raw parziale persi.\")))))
      (uiop:delete-directory-tree root :validate t)))
  :passed)


(defun self-test-oracle ()
  \"Ciascuno dei tre risultati ricircolo difforme deve essere respinto.\"
  (dolist (row '((:unexpected :published 1) (nil :claimed 1) (nil :published 2)))
    (unless (handler-case
                (progn (verify-recycle (lambda (dispatcher) (declare (ignore dispatcher)) (values-list row))
                                       nil nil :published 1) nil)
              (error () t))
      (error \"COD-60: risultato recycle difforme non respinto: ~S.\" row)))
  :passed)
(defun self-test ()
  \"Sensore comune heap/sink/clock/partial, tre risultati e due protocolli reali con drain.\"
  (list :status :ok :shared-sensor (arcdocdb.pool-lifecycle.measure::self-test)
        :recycle-oracles (self-test-oracle) :recycle-cli-and-partial-raw (self-test-reporter)
        :room (arcdocdb.pool-lifecycle.measure::self-test-composed #'create-room-cycle)
        :full (arcdocdb.pool-lifecycle.measure::self-test-composed #'create-full-cycle)))
(defun main ()
  \"Rapporto leggibile; errore nonzero anche per fonte cambiata o heap osservato positivo.\"
  (let ((report (run-driver (uiop:command-line-arguments))))
    (let ((*print-readably* t)) (write report :pretty t) (terpri))
    (unless (eq :ok (getf report :status))
      (format *error-output* \"~&tools/measure-pool-recycle.lisp: ~A~%\" (getf report :diagnostic))
      (uiop:quit 1))))
(unless (member :arcdocdb-pool-recycle-measure-library *features*) (main))
")
  (:PATH
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-measure/tool-source-dev-02.lisp")
   :BYTES 20279 :SHA256 "ea5610de8db07f7f89968e7b3c4b74f16783b2a05525b52c1ecc99ce0b08362c"
   :GIT-BLOB "275cedb01d1c41e422a3b01a685996b1ec493cca" :TEXT
   ";;;; C4: ROOM e FULL reali con ricircolo, claim se room, begin/pop/ack/end.
;;;; Cinque fixture indipendenti: 4096 cicli +128 warmup, 4226 payload/writer, quantum1.
;;;; Factory, claim iniziale, GC e drain finale fuori clock; nessun reset privato.
;;;; Il clock include il protocollo C1 che ristabilisce RESCHEDULE e gli oracoli scalari.
;;;; --self-test | --bench directory-nuova/. Feature: :arcdocdb-pool-recycle-measure-library.
;;; REQ: REQ-CON-005 REQ-AFF-008 REQ-THR-001 REQ-BEN-001 REQ-BEN-002
;;; OWNER: dispatcher, contesto, link, target e sensore allo stesso thread C4.
;;; SHARED: ready autentico privato alla fixture; nessun coordinatore concorrente nel clock.
(eval-when (:compile-toplevel :load-toplevel :execute)
  (require :asdf)
  (unless (find-package \"ARCDOCDB.POOL-LIFECYCLE.MEASURE\")
    (let ((*features* (cons :arcdocdb-pool-lifecycle-measure-library *features*)))
      (load \"tools/measure-pool-lifecycle.lisp\"))))
(defpackage #:arcdocdb.pool-recycle.measure
  (:use #:cl)
  (:import-from #:arcdocdb.pool-lifecycle.measure
                #:lookup-function #:sample #:sample-record #:acquire-directory #:write-report
                #:load-product #:+iterations+ #:+warmup+ #:+replicas+))
(in-package #:arcdocdb.pool-recycle.measure)
(declaim (optimize (safety 3) (speed 2) (debug 2)))
(defconstant +payload-count+ 4226)

(defun fingerprints ()
  \"Stabilita: biblioteca, questo sensore e tutti i sorgenti/test prodotto.\"
  (append (arcdocdb.pool-lifecycle.measure::fingerprints)
          (list (list :file \"tools/measure-pool-recycle.lisp\"
                      :md5 (format nil \"~(~{~2,'0X~}~)\"
                                   (coerce (sb-md5:md5sum-file \"tools/measure-pool-recycle.lisp\") 'list))))))
(defun api (name &optional (package \"ARCDOCDB.SCHEDULER.DISPATCH\"))
  \"Risolve API pubbliche prima del clock, senza ricerca nomi nel tratto misurato.\"
  (multiple-value-bind (symbol visibility) (find-symbol name package)
    (unless (and symbol (eq :external visibility) (fboundp symbol))
      (error \"COD-60: API pubblica ~A/~A assente.\" package name))
    (symbol-function symbol)))
(defun make-series ()
  \"Backend pubblico C4 locale, nessun I/O nel protocollo C1 della campagna.\"
  (let* ((backend (funcall (api \"MAKE-BACKEND\" \"ARCDOCDB.IO\")
                           (lambda (path mode) (declare (ignore path mode)) 812)
                           (lambda (&rest arguments) (declare (ignore arguments))
                             (error \"COD-60: lettura I/O inattesa nella fixture recycle.\"))
                           (lambda (fd bytes start count) (declare (ignore fd bytes start)) count)
                           (lambda (fd) (declare (ignore fd)) 0)
                           (lambda (fd) (declare (ignore fd)) 0)
                           (lambda (fd) (declare (ignore fd)) 0)))
         (file (funcall (api \"CREA-TEMPORANEO\" \"ARCDOCDB.IO\") \"pool-recycle-C4.tmp\" :backend backend))
         (log (funcall (api \"CREA-LOG-IO\" \"ARCDOCDB.WAL\") file :segment 812)))
    (values (funcall (api \"CREA-CONTROLLORE-SERIE\" \"ARCDOCDB.SERIES\")
                     (funcall (api \"CREA-REGISTRO-CSN\" \"ARCDOCDB.CSN\") :capacity 4) log :capacity 2)
            file)))
(defun preload-writer (index payload)
  \"4226 payload simbolici immutabili; accettazione e obbligo iniziale verificati fuori clock.\"
  (let ((writer (funcall (api \"CREA-WRITER-PROGRAMMABILE\" \"ARCDOCDB.EXECUTION\")
                          :capacity 8192 :quantum 1 :routing-index index))
        (enqueue (api \"ACCODA-LAVORO-WRITER\" \"ARCDOCDB.EXECUTION\")))
    (dotimes (i +payload-count+)
      (multiple-value-bind (count action) (funcall enqueue writer payload)
        (unless (and (= (1+ i) count) (eq (if (zerop i) :schedule :queued) action))
          (error \"COD-60: preload perde count o obbligo iniziale.\"))))
    writer))
(defun make-fixture (full)
  \"Un ring autentico capacity1, uno/due writer, dispatcher e tabella preallocati.\"
  (multiple-value-bind (controller file) (make-series)
    (let* ((ready (funcall (api \"CREA-LISTA-WRITER-PRONTI\" \"ARCDOCDB.EXECUTION\") :shards 1 :capacity 1))
           (context (funcall (api \"CREA-CONTESTO-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\") ready))
           (other (when full (multiple-value-list (make-series))))
           (port (funcall (api \"CREA-PORTA-WORKER-POOL\" \"ARCDOCDB.SCHEDULER\") context))
           (a (preload-writer 0 :recycle-a)) (b (when full (preload-writer 1 :recycle-b)))
           (writers (if full (vector a b) (vector a)))
           (controllers (if full (vector controller (first other)) (vector controller)))
           (registry (funcall (api \"CREA-REGISTRO-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\")
                              writers controllers))
           (table (funcall (api \"CREA-TABELLA-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\") context registry))
           (links (funcall (lookup-function \"TABELLA-WORKER-SERIE-LINKS\" \"ARCDOCDB.EXECUTION.SERIES\") table))
           (dispatcher (funcall (api \"CREA-DISPATCHER-WRITER-POOL\") port table)))
      (unless (= 1 (funcall (api \"PUBBLICA-WRITER-PRONTO\" \"ARCDOCDB.EXECUTION\") ready 0 a))
        (error \"COD-60: pubblicazione A iniziale difforme.\"))
      (multiple-value-bind (link action cursor lifecycle)
          (funcall (api \"PRENDI-COLLEGAMENTO-POOL\") dispatcher)
        (unless (and (eq (svref links 0) link) (eq :claimed action)
                     (zerop cursor) (eq :unchanged lifecycle))
          (error \"COD-60: claim iniziale difforme.\")))
      (when full
        (unless (= 1 (funcall (api \"PUBBLICA-WRITER-PRONTO\" \"ARCDOCDB.EXECUTION\") ready 0 b))
          (error \"COD-60: pubblicazione B iniziale difforme.\")))
      (values dispatcher context writers links
              (if full (vector file (second other)) (vector file))))))
(defun consume-one (context target payload begin pop ack end)
  \"Una lease, un payload con token, un ack e un end; nessuna collezione di risultati.\"
  (unless (plusp (funcall begin context)) (error \"COD-60: lease non positiva.\"))
  (multiple-value-bind (count status token) (funcall pop context target 0 1)
    (unless (and (= 1 count) (eq :messages status) (plusp token) (eq payload (svref target 0)))
      (error \"COD-60: payload/count/token di pop difforme.\"))
    (funcall ack context token))
  (funcall end context))
(defun verify-recycle (recycle dispatcher expected status count)
  \"Oracolo indipendente su tutti e tre i risultati, compresa identita del link.\"
  (multiple-value-bind (link action actual-count) (funcall recycle dispatcher)
    (unless (and (eq expected link) (eq status action) (eql count actual-count))
      (error \"COD-60: recycle ~S/~S/~S invece di ~S/~S/~S.\"
             link action actual-count expected status count))))
(defun drain-fixture (dispatcher context writers file)
  \"Fuori clock: drena ogni obbligo soltanto con API pubbliche, limite2*4226+4.\"
  (let ((claim (api \"PRENDI-COLLEGAMENTO-POOL\")) (recycle (api \"RICIRCOLA-COLLEGAMENTO-POOL\"))
        (state (api \"STATO-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\"))
        (writer (api \"WRITER-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\"))
        (begin (api \"INIZIA-TRATTO-WORKER\" \"ARCDOCDB.EXECUTION\"))
        (pop (api \"PRELEVA-LAVORI-WORKER\" \"ARCDOCDB.EXECUTION\"))
        (ack (api \"CONFERMA-LAVORI-WORKER\" \"ARCDOCDB.EXECUTION\"))
        (end (api \"TERMINA-TRATTO-WORKER\" \"ARCDOCDB.EXECUTION\")) (target (vector nil)))
    (unwind-protect
         (loop repeat (+ (* 2 +payload-count+) 4)
               do (case (funcall state context)
                    (:reschedule (funcall recycle dispatcher))
                    (:idle (multiple-value-bind (link status) (funcall claim dispatcher)
                             (declare (ignore link))
                             (when (eq status :empty) (return-from drain-fixture :drained))
                             (unless (eq status :claimed) (error \"COD-60: drain claim difforme.\"))))
                    (:claimed nil)
                    (otherwise (error \"COD-60: drain con fase inattesa.\")))
                  (when (eq :claimed (funcall state context))
                    (consume-one context target
                                 (if (eq (svref writers 0) (funcall writer context)) :recycle-a :recycle-b)
                                 begin pop ack end))
               finally (error \"COD-60: drain fuori budget esplicito.\"))
      (loop for file across files do (funcall (api \"CHIUDI\" \"ARCDOCDB.IO\") file)))))
(defun create-cycle (full)
  \"ROOM: recycle+claim+tratto; FULL: recycle+tratto, alternando A/B; un ciclo ritorna RESCHEDULE.\"
  (multiple-value-bind (dispatcher context writers links file) (make-fixture full)
    (let ((recycle (api \"RICIRCOLA-COLLEGAMENTO-POOL\")) (claim (api \"PRENDI-COLLEGAMENTO-POOL\"))
          (begin (api \"INIZIA-TRATTO-WORKER\" \"ARCDOCDB.EXECUTION\"))
          (pop (api \"PRELEVA-LAVORI-WORKER\" \"ARCDOCDB.EXECUTION\"))
          (ack (api \"CONFERMA-LAVORI-WORKER\" \"ARCDOCDB.EXECUTION\"))
          (end (api \"TERMINA-TRATTO-WORKER\" \"ARCDOCDB.EXECUTION\"))
          (state (api \"STATO-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\"))
          (writer (api \"WRITER-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\"))
          (link-state (api \"STATO-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\"))
          (cursor (lookup-function \"CONTESTO-WORKER-WRITER-CURSOR\" \"ARCDOCDB.EXECUTION\"))
          (target (vector nil)) (index 0))
      (unless (eq :schedule (consume-one context target :recycle-a begin pop ack end))
        (error \"COD-60: tratto iniziale non produce RESCHEDULE.\"))
      (values
       (lambda ()
         (declare (type fixnum index))
         (when full (setf index (- 1 index)))
         (verify-recycle recycle dispatcher (when full (svref links index))
                         (if full :claimed :published) 1)
         (unless full
           (multiple-value-bind (link status next action) (funcall claim dispatcher)
             (unless (and (eq (svref links 0) link) (eq :claimed status)
                          (zerop next) (eq :unchanged action))
               (error \"COD-60: claim ROOM difforme.\"))))
         (unless (and (eq :claimed (funcall state context))
                      (eq (svref writers index) (funcall writer context))
                      (eq :idle (funcall link-state (svref links index)))
                      (zerop (funcall cursor context)))
           (error \"COD-60: obbligo/link/cursore dopo ricircolo difforme.\"))
         (unless (and (eq :schedule (consume-one context target (if (zerop index) :recycle-a :recycle-b)
                                               begin pop ack end))
                      (eq :reschedule (funcall state context))
                      (eq (svref writers index) (funcall writer context))
                      (zerop (funcall cursor context)))
           (error \"COD-60: fine ciclo non conserva RESCHEDULE/cursore/writer.\"))
         (if full 43 31))
       (if full 43 31) (lambda () (drain-fixture dispatcher context writers file))))))
(defun create-room-cycle () (create-cycle nil))
(defun create-full-cycle () (create-cycle t))
(defun campaign-group (name maker report checkpoint)
  \"Nuova fixture per ciascuna replica: budget payload indipendente e cleanup sempre fuori clock.\"
  (dotimes (replica +replicas+)
    (multiple-value-bind (function token cleanup) (funcall maker)
      (unwind-protect
           (let ((progress (sample-record replica +iterations+ +warmup+ token)))
             (setf (getf progress :campaign) name (getf report :current-replica) replica
                   (getf report :samples) (append (getf report :samples) (list progress)))
             (funcall checkpoint)
             (sample function +iterations+ token progress)
             (funcall checkpoint)
             (unless (zerop (getf progress :heap-bytes))
               (setf (getf progress :status) :failed (getf progress :diagnostic) \"COD-30: heap osservato positivo.\")
               (error \"COD-30: heap positivo nella campagna ~S replica ~D.\" name replica)))
        (funcall cleanup))))
  report)
(defun campaign (report checkpoint)
  \"Due costi composti preregistrati; nessuna attribuzione al solo wrapper C3.\"
  (campaign-group :room #'create-room-cycle report checkpoint)
  (campaign-group :full #'create-full-cycle report checkpoint)
  (setf (getf report :current-replica) nil) report)
(defun make-report ()
  \"Raw, costi inclusi e limiti: protocollo C1 reale, nessuna misura di park/wake o coordinatore vivo.\"
  (list :schema-version 1 :kind :pool-recycle-benchmark :status :running :stage :pending
        :diagnostic nil :process-argv sb-ext:*posix-argv* :tool-arguments (uiop:command-line-arguments)
        :source-fingerprints-before (fingerprints) :source-fingerprints-after nil
        :source-consistency :pending :recorded-at (get-universal-time) :self-test nil
        :samples nil :current-replica nil :sbcl (lisp-implementation-version)
        :machine (machine-type) :os (software-type) :os-version (software-version) :safety 3
        :iterations +iterations+ :warmup +warmup+ :replicas +replicas+
        :timer-units-per-second internal-time-units-per-second
        :campaigns '((:room :shards 1 :ring-capacity 1 :writers 1 :writer-capacity 8192
                     :payloads-per-writer 4226 :quantum 1 :recycle-per-cycle 1 :claim-per-cycle 1
                     :begin-pop-ack-end-per-cycle 1 :token 31)
                    (:full :shards 1 :ring-capacity 1 :writers 2 :writer-capacity 8192
                     :payloads-per-writer 4226 :quantum 1 :recycle-per-cycle 1 :claim-per-cycle 0
                     :begin-pop-ack-end-per-cycle 1 :alternating-writer-identity t :token 43))
        :token-formula \"sample=N*cycle-token+N*(N-1)/2; ROOM=31; FULL=43\"
        :limits '(:fresh-fixture-per-replica :preallocated-product-and-inputs
                  :startup-claim-first-tratto-drain-and-gc-excluded :public-bounded-drain-after-clock
                  :c1-protocol-and-scalar-oracles-in-clock :not-isolated-wrapper-throughput
                  :counter-not-absolute-nonallocation-proof :external-load-uncontrolled
                  :clock-zero-is-below-resolution :no-time-threshold-no-tuning-claim
                  :no-io-in-cycle :no-bridge-begin-or-live-series-lease-in-clock
                  :no-concurrent-coordinator :no-physical-worker-lifecycle-qualification)))
(defun run-driver (args &key (product-loader #'load-product) (tester #'self-test) (runner #'campaign))
  \"Driver recycle compatto; riusa I/O esclusivo e sensore qualificati, preserva raw del fallimento.\"
  (let ((report (make-report)) (directory nil))
    (handler-case
        (progn
          (unless (or (equal args '(\"--self-test\"))
                      (and (= 2 (length args)) (string= \"--bench\" (first args))))
            (error \"COD-61: uso --self-test oppure --bench directory-nuova/.\"))
          (when (= 2 (length args)) (setf directory (acquire-directory (second args))))
          (setf (getf report :stage) :load-product)
          (when directory (write-report report directory))
          (funcall product-loader)
          (setf (getf report :stage) :self-test (getf report :self-test) (funcall tester))
          (when directory
            (setf (getf report :stage) :campaign)
            (funcall runner report (lambda () (write-report report directory))))
          (setf (getf report :status) :ok (getf report :stage) :complete))
      (error (condition)
        (setf (getf report :status) :failed (getf report :diagnostic) (princ-to-string condition))
        (let ((last (car (last (getf report :samples)))))
          (when (and last (eq :running (getf last :status)))
            (setf (getf last :status) :failed (getf last :diagnostic) (princ-to-string condition))))))
    (let ((after (fingerprints)))
      (setf (getf report :source-fingerprints-after) after (getf report :source-consistency)
            (if (equal (getf report :source-fingerprints-before) after) :stable :changed))
      (when (and (eq :ok (getf report :status)) (eq :changed (getf report :source-consistency)))
        (setf (getf report :status) :source-changed (getf report :diagnostic) \"COD-61: sorgenti cambiati.\")))
    (when directory (write-report report directory))
    report))

(defun self-test-reporter ()
  \"Il driver dispatch rifiuta CLI/destinazione e conserva replica conclusa più raw parziale.\"
  (let ((called nil) (root (arcdocdb.pool-lifecycle.measure::fresh-self-test-directory)))
    (unwind-protect
         (progn
           (dolist (args '(nil (\"--bench\") (\"--bad\") (\"--bench\" \"directory\" \"extra\")))
             (unless (and (eq :failed (getf (run-driver args :product-loader (lambda () (setf called t))) :status))
                          (null called))
               (error \"COD-60: CLI invalida eseguita.\")))
           (let* ((existing (acquire-directory (merge-pathnames \"existing/\" root)))
                  (failed (merge-pathnames \"failed/\" root)))
             (write-report '(:sentinel :unchanged) existing)
             (unless (and (eq :failed (getf (run-driver (list \"--bench\" (namestring existing))
                                                      :product-loader (constantly nil)
                                                      :tester (constantly :passed)) :status))
                          (equal (arcdocdb.pool-lifecycle.measure::read-self-test-report existing)
                                 '(:sentinel :unchanged)))
               (error \"COD-60: destinazione precedente non conservata.\"))
             (run-driver (list \"--bench\" (namestring failed))
                         :product-loader (constantly nil) :tester (constantly :passed)
                         :runner (lambda (report checkpoint)
                                   (setf (getf report :current-replica) 1 (getf report :samples)
                                         (list (list :status :ok :raw-ticks 3 :heap-bytes 0)
                                               (list :status :running :raw-ticks 7 :heap-bytes 11
                                                     :diagnostic nil)))
                                   (funcall checkpoint) (error \"fixture: replica interrotta\")))
             (let* ((saved (arcdocdb.pool-lifecycle.measure::read-self-test-report failed))
                    (samples (getf saved :samples)))
               (unless (and (eq :failed (getf saved :status)) (= 1 (getf saved :current-replica))
                            (= 2 (length samples)) (eq :ok (getf (first samples) :status))
                            (eq :failed (getf (second samples) :status))
                            (= 7 (getf (second samples) :raw-ticks))
                            (= 11 (getf (second samples) :heap-bytes)))
                 (error \"COD-60: replica o raw parziale persi.\")))))
      (uiop:delete-directory-tree root :validate t)))
  :passed)


(defun self-test-oracle ()
  \"Ciascuno dei tre risultati ricircolo difforme deve essere respinto.\"
  (dolist (row '((:unexpected :published 1) (nil :claimed 1) (nil :published 2)))
    (unless (handler-case
                (progn (verify-recycle (lambda (dispatcher) (declare (ignore dispatcher)) (values-list row))
                                       nil nil :published 1) nil)
              (error () t))
      (error \"COD-60: risultato recycle difforme non respinto: ~S.\" row)))
  :passed)
(defun self-test ()
  \"Sensore comune heap/sink/clock/partial, tre risultati e due protocolli reali con drain.\"
  (list :status :ok :shared-sensor (arcdocdb.pool-lifecycle.measure::self-test)
        :recycle-oracles (self-test-oracle) :recycle-cli-and-partial-raw (self-test-reporter)
        :room (arcdocdb.pool-lifecycle.measure::self-test-composed #'create-room-cycle)
        :full (arcdocdb.pool-lifecycle.measure::self-test-composed #'create-full-cycle)))
(defun main ()
  \"Rapporto leggibile; errore nonzero anche per fonte cambiata o heap osservato positivo.\"
  (let ((report (run-driver (uiop:command-line-arguments))))
    (let ((*print-readably* t)) (write report :pretty t) (terpri))
    (unless (eq :ok (getf report :status))
      (format *error-output* \"~&tools/measure-pool-recycle.lisp: ~A~%\" (getf report :diagnostic))
      (uiop:quit 1))))
(unless (member :arcdocdb-pool-recycle-measure-library *features*) (main))
")
  (:PATH
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-measure/tool-source-dev-03.lisp")
   :BYTES 20280 :SHA256 "f9f33a86334719cf22a0c6d9f27ccae426895c247c67044ddf52b70200b05c7a"
   :GIT-BLOB "cb20f6d271889a9801106daf230ee934aaa7bf81" :TEXT
   ";;;; C4: ROOM e FULL reali con ricircolo, claim se room, begin/pop/ack/end.
;;;; Cinque fixture indipendenti: 4096 cicli +128 warmup, 4226 payload/writer, quantum1.
;;;; Factory, claim iniziale, GC e drain finale fuori clock; nessun reset privato.
;;;; Il clock include il protocollo C1 che ristabilisce RESCHEDULE e gli oracoli scalari.
;;;; --self-test | --bench directory-nuova/. Feature: :arcdocdb-pool-recycle-measure-library.
;;; REQ: REQ-CON-005 REQ-AFF-008 REQ-THR-001 REQ-BEN-001 REQ-BEN-002
;;; OWNER: dispatcher, contesto, link, target e sensore allo stesso thread C4.
;;; SHARED: ready autentico privato alla fixture; nessun coordinatore concorrente nel clock.
(eval-when (:compile-toplevel :load-toplevel :execute)
  (require :asdf)
  (unless (find-package \"ARCDOCDB.POOL-LIFECYCLE.MEASURE\")
    (let ((*features* (cons :arcdocdb-pool-lifecycle-measure-library *features*)))
      (load \"tools/measure-pool-lifecycle.lisp\"))))
(defpackage #:arcdocdb.pool-recycle.measure
  (:use #:cl)
  (:import-from #:arcdocdb.pool-lifecycle.measure
                #:lookup-function #:sample #:sample-record #:acquire-directory #:write-report
                #:load-product #:+iterations+ #:+warmup+ #:+replicas+))
(in-package #:arcdocdb.pool-recycle.measure)
(declaim (optimize (safety 3) (speed 2) (debug 2)))
(defconstant +payload-count+ 4226)

(defun fingerprints ()
  \"Stabilita: biblioteca, questo sensore e tutti i sorgenti/test prodotto.\"
  (append (arcdocdb.pool-lifecycle.measure::fingerprints)
          (list (list :file \"tools/measure-pool-recycle.lisp\"
                      :md5 (format nil \"~(~{~2,'0X~}~)\"
                                   (coerce (sb-md5:md5sum-file \"tools/measure-pool-recycle.lisp\") 'list))))))
(defun api (name &optional (package \"ARCDOCDB.SCHEDULER.DISPATCH\"))
  \"Risolve API pubbliche prima del clock, senza ricerca nomi nel tratto misurato.\"
  (multiple-value-bind (symbol visibility) (find-symbol name package)
    (unless (and symbol (eq :external visibility) (fboundp symbol))
      (error \"COD-60: API pubblica ~A/~A assente.\" package name))
    (symbol-function symbol)))
(defun make-series ()
  \"Backend pubblico C4 locale, nessun I/O nel protocollo C1 della campagna.\"
  (let* ((backend (funcall (api \"MAKE-BACKEND\" \"ARCDOCDB.IO\")
                           (lambda (path mode) (declare (ignore path mode)) 812)
                           (lambda (&rest arguments) (declare (ignore arguments))
                             (error \"COD-60: lettura I/O inattesa nella fixture recycle.\"))
                           (lambda (fd bytes start count) (declare (ignore fd bytes start)) count)
                           (lambda (fd) (declare (ignore fd)) 0)
                           (lambda (fd) (declare (ignore fd)) 0)
                           (lambda (fd) (declare (ignore fd)) 0)))
         (file (funcall (api \"CREA-TEMPORANEO\" \"ARCDOCDB.IO\") \"pool-recycle-C4.tmp\" :backend backend))
         (log (funcall (api \"CREA-LOG-IO\" \"ARCDOCDB.WAL\") file :segment 812)))
    (values (funcall (api \"CREA-CONTROLLORE-SERIE\" \"ARCDOCDB.SERIES\")
                     (funcall (api \"CREA-REGISTRO-CSN\" \"ARCDOCDB.CSN\") :capacity 4) log :capacity 2)
            file)))
(defun preload-writer (index payload)
  \"4226 payload simbolici immutabili; accettazione e obbligo iniziale verificati fuori clock.\"
  (let ((writer (funcall (api \"CREA-WRITER-PROGRAMMABILE\" \"ARCDOCDB.EXECUTION\")
                          :capacity 8192 :quantum 1 :routing-index index))
        (enqueue (api \"ACCODA-LAVORO-WRITER\" \"ARCDOCDB.EXECUTION\")))
    (dotimes (i +payload-count+)
      (multiple-value-bind (count action) (funcall enqueue writer payload)
        (unless (and (= (1+ i) count) (eq (if (zerop i) :schedule :queued) action))
          (error \"COD-60: preload perde count o obbligo iniziale.\"))))
    writer))
(defun make-fixture (full)
  \"Un ring autentico capacity1, uno/due writer, dispatcher e tabella preallocati.\"
  (multiple-value-bind (controller file) (make-series)
    (let* ((ready (funcall (api \"CREA-LISTA-WRITER-PRONTI\" \"ARCDOCDB.EXECUTION\") :shards 1 :capacity 1))
           (context (funcall (api \"CREA-CONTESTO-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\") ready))
           (other (when full (multiple-value-list (make-series))))
           (port (funcall (api \"CREA-PORTA-WORKER-POOL\" \"ARCDOCDB.SCHEDULER\") context))
           (a (preload-writer 0 :recycle-a)) (b (when full (preload-writer 1 :recycle-b)))
           (writers (if full (vector a b) (vector a)))
           (controllers (if full (vector controller (first other)) (vector controller)))
           (registry (funcall (api \"CREA-REGISTRO-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\")
                              writers controllers))
           (table (funcall (api \"CREA-TABELLA-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\") context registry))
           (links (funcall (lookup-function \"TABELLA-WORKER-SERIE-LINKS\" \"ARCDOCDB.EXECUTION.SERIES\") table))
           (dispatcher (funcall (api \"CREA-DISPATCHER-WRITER-POOL\") port table)))
      (unless (= 1 (funcall (api \"PUBBLICA-WRITER-PRONTO\" \"ARCDOCDB.EXECUTION\") ready 0 a))
        (error \"COD-60: pubblicazione A iniziale difforme.\"))
      (multiple-value-bind (link action cursor lifecycle)
          (funcall (api \"PRENDI-COLLEGAMENTO-POOL\") dispatcher)
        (unless (and (eq (svref links 0) link) (eq :claimed action)
                     (zerop cursor) (eq :unchanged lifecycle))
          (error \"COD-60: claim iniziale difforme.\")))
      (when full
        (unless (= 1 (funcall (api \"PUBBLICA-WRITER-PRONTO\" \"ARCDOCDB.EXECUTION\") ready 0 b))
          (error \"COD-60: pubblicazione B iniziale difforme.\")))
      (values dispatcher context writers links
              (if full (vector file (second other)) (vector file))))))
(defun consume-one (context target payload begin pop ack end)
  \"Una lease, un payload con token, un ack e un end; nessuna collezione di risultati.\"
  (unless (plusp (funcall begin context)) (error \"COD-60: lease non positiva.\"))
  (multiple-value-bind (count status token) (funcall pop context target 0 1)
    (unless (and (= 1 count) (eq :messages status) (plusp token) (eq payload (svref target 0)))
      (error \"COD-60: payload/count/token di pop difforme.\"))
    (funcall ack context token))
  (funcall end context))
(defun verify-recycle (recycle dispatcher expected status count)
  \"Oracolo indipendente su tutti e tre i risultati, compresa identita del link.\"
  (multiple-value-bind (link action actual-count) (funcall recycle dispatcher)
    (unless (and (eq expected link) (eq status action) (eql count actual-count))
      (error \"COD-60: recycle ~S/~S/~S invece di ~S/~S/~S.\"
             link action actual-count expected status count))))
(defun drain-fixture (dispatcher context writers files)
  \"Fuori clock: drena ogni obbligo soltanto con API pubbliche, limite2*4226+4.\"
  (let ((claim (api \"PRENDI-COLLEGAMENTO-POOL\")) (recycle (api \"RICIRCOLA-COLLEGAMENTO-POOL\"))
        (state (api \"STATO-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\"))
        (writer (api \"WRITER-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\"))
        (begin (api \"INIZIA-TRATTO-WORKER\" \"ARCDOCDB.EXECUTION\"))
        (pop (api \"PRELEVA-LAVORI-WORKER\" \"ARCDOCDB.EXECUTION\"))
        (ack (api \"CONFERMA-LAVORI-WORKER\" \"ARCDOCDB.EXECUTION\"))
        (end (api \"TERMINA-TRATTO-WORKER\" \"ARCDOCDB.EXECUTION\")) (target (vector nil)))
    (unwind-protect
         (loop repeat (+ (* 2 +payload-count+) 4)
               do (case (funcall state context)
                    (:reschedule (funcall recycle dispatcher))
                    (:idle (multiple-value-bind (link status) (funcall claim dispatcher)
                             (declare (ignore link))
                             (when (eq status :empty) (return-from drain-fixture :drained))
                             (unless (eq status :claimed) (error \"COD-60: drain claim difforme.\"))))
                    (:claimed nil)
                    (otherwise (error \"COD-60: drain con fase inattesa.\")))
                  (when (eq :claimed (funcall state context))
                    (consume-one context target
                                 (if (eq (svref writers 0) (funcall writer context)) :recycle-a :recycle-b)
                                 begin pop ack end))
               finally (error \"COD-60: drain fuori budget esplicito.\"))
      (loop for file across files do (funcall (api \"CHIUDI\" \"ARCDOCDB.IO\") file)))))
(defun create-cycle (full)
  \"ROOM: recycle+claim+tratto; FULL: recycle+tratto, alternando A/B; un ciclo ritorna RESCHEDULE.\"
  (multiple-value-bind (dispatcher context writers links file) (make-fixture full)
    (let ((recycle (api \"RICIRCOLA-COLLEGAMENTO-POOL\")) (claim (api \"PRENDI-COLLEGAMENTO-POOL\"))
          (begin (api \"INIZIA-TRATTO-WORKER\" \"ARCDOCDB.EXECUTION\"))
          (pop (api \"PRELEVA-LAVORI-WORKER\" \"ARCDOCDB.EXECUTION\"))
          (ack (api \"CONFERMA-LAVORI-WORKER\" \"ARCDOCDB.EXECUTION\"))
          (end (api \"TERMINA-TRATTO-WORKER\" \"ARCDOCDB.EXECUTION\"))
          (state (api \"STATO-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\"))
          (writer (api \"WRITER-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\"))
          (link-state (api \"STATO-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\"))
          (cursor (lookup-function \"CONTESTO-WORKER-WRITER-CURSOR\" \"ARCDOCDB.EXECUTION\"))
          (target (vector nil)) (index 0))
      (unless (eq :schedule (consume-one context target :recycle-a begin pop ack end))
        (error \"COD-60: tratto iniziale non produce RESCHEDULE.\"))
      (values
       (lambda ()
         (declare (type fixnum index))
         (when full (setf index (- 1 index)))
         (verify-recycle recycle dispatcher (when full (svref links index))
                         (if full :claimed :published) 1)
         (unless full
           (multiple-value-bind (link status next action) (funcall claim dispatcher)
             (unless (and (eq (svref links 0) link) (eq :claimed status)
                          (zerop next) (eq :unchanged action))
               (error \"COD-60: claim ROOM difforme.\"))))
         (unless (and (eq :claimed (funcall state context))
                      (eq (svref writers index) (funcall writer context))
                      (eq :idle (funcall link-state (svref links index)))
                      (zerop (funcall cursor context)))
           (error \"COD-60: obbligo/link/cursore dopo ricircolo difforme.\"))
         (unless (and (eq :schedule (consume-one context target (if (zerop index) :recycle-a :recycle-b)
                                               begin pop ack end))
                      (eq :reschedule (funcall state context))
                      (eq (svref writers index) (funcall writer context))
                      (zerop (funcall cursor context)))
           (error \"COD-60: fine ciclo non conserva RESCHEDULE/cursore/writer.\"))
         (if full 43 31))
       (if full 43 31) (lambda () (drain-fixture dispatcher context writers file))))))
(defun create-room-cycle () (create-cycle nil))
(defun create-full-cycle () (create-cycle t))
(defun campaign-group (name maker report checkpoint)
  \"Nuova fixture per ciascuna replica: budget payload indipendente e cleanup sempre fuori clock.\"
  (dotimes (replica +replicas+)
    (multiple-value-bind (function token cleanup) (funcall maker)
      (unwind-protect
           (let ((progress (sample-record replica +iterations+ +warmup+ token)))
             (setf (getf progress :campaign) name (getf report :current-replica) replica
                   (getf report :samples) (append (getf report :samples) (list progress)))
             (funcall checkpoint)
             (sample function +iterations+ token progress)
             (funcall checkpoint)
             (unless (zerop (getf progress :heap-bytes))
               (setf (getf progress :status) :failed (getf progress :diagnostic) \"COD-30: heap osservato positivo.\")
               (error \"COD-30: heap positivo nella campagna ~S replica ~D.\" name replica)))
        (funcall cleanup))))
  report)
(defun campaign (report checkpoint)
  \"Due costi composti preregistrati; nessuna attribuzione al solo wrapper C3.\"
  (campaign-group :room #'create-room-cycle report checkpoint)
  (campaign-group :full #'create-full-cycle report checkpoint)
  (setf (getf report :current-replica) nil) report)
(defun make-report ()
  \"Raw, costi inclusi e limiti: protocollo C1 reale, nessuna misura di park/wake o coordinatore vivo.\"
  (list :schema-version 1 :kind :pool-recycle-benchmark :status :running :stage :pending
        :diagnostic nil :process-argv sb-ext:*posix-argv* :tool-arguments (uiop:command-line-arguments)
        :source-fingerprints-before (fingerprints) :source-fingerprints-after nil
        :source-consistency :pending :recorded-at (get-universal-time) :self-test nil
        :samples nil :current-replica nil :sbcl (lisp-implementation-version)
        :machine (machine-type) :os (software-type) :os-version (software-version) :safety 3
        :iterations +iterations+ :warmup +warmup+ :replicas +replicas+
        :timer-units-per-second internal-time-units-per-second
        :campaigns '((:room :shards 1 :ring-capacity 1 :writers 1 :writer-capacity 8192
                     :payloads-per-writer 4226 :quantum 1 :recycle-per-cycle 1 :claim-per-cycle 1
                     :begin-pop-ack-end-per-cycle 1 :token 31)
                    (:full :shards 1 :ring-capacity 1 :writers 2 :writer-capacity 8192
                     :payloads-per-writer 4226 :quantum 1 :recycle-per-cycle 1 :claim-per-cycle 0
                     :begin-pop-ack-end-per-cycle 1 :alternating-writer-identity t :token 43))
        :token-formula \"sample=N*cycle-token+N*(N-1)/2; ROOM=31; FULL=43\"
        :limits '(:fresh-fixture-per-replica :preallocated-product-and-inputs
                  :startup-claim-first-tratto-drain-and-gc-excluded :public-bounded-drain-after-clock
                  :c1-protocol-and-scalar-oracles-in-clock :not-isolated-wrapper-throughput
                  :counter-not-absolute-nonallocation-proof :external-load-uncontrolled
                  :clock-zero-is-below-resolution :no-time-threshold-no-tuning-claim
                  :no-io-in-cycle :no-bridge-begin-or-live-series-lease-in-clock
                  :no-concurrent-coordinator :no-physical-worker-lifecycle-qualification)))
(defun run-driver (args &key (product-loader #'load-product) (tester #'self-test) (runner #'campaign))
  \"Driver recycle compatto; riusa I/O esclusivo e sensore qualificati, preserva raw del fallimento.\"
  (let ((report (make-report)) (directory nil))
    (handler-case
        (progn
          (unless (or (equal args '(\"--self-test\"))
                      (and (= 2 (length args)) (string= \"--bench\" (first args))))
            (error \"COD-61: uso --self-test oppure --bench directory-nuova/.\"))
          (when (= 2 (length args)) (setf directory (acquire-directory (second args))))
          (setf (getf report :stage) :load-product)
          (when directory (write-report report directory))
          (funcall product-loader)
          (setf (getf report :stage) :self-test (getf report :self-test) (funcall tester))
          (when directory
            (setf (getf report :stage) :campaign)
            (funcall runner report (lambda () (write-report report directory))))
          (setf (getf report :status) :ok (getf report :stage) :complete))
      (error (condition)
        (setf (getf report :status) :failed (getf report :diagnostic) (princ-to-string condition))
        (let ((last (car (last (getf report :samples)))))
          (when (and last (eq :running (getf last :status)))
            (setf (getf last :status) :failed (getf last :diagnostic) (princ-to-string condition))))))
    (let ((after (fingerprints)))
      (setf (getf report :source-fingerprints-after) after (getf report :source-consistency)
            (if (equal (getf report :source-fingerprints-before) after) :stable :changed))
      (when (and (eq :ok (getf report :status)) (eq :changed (getf report :source-consistency)))
        (setf (getf report :status) :source-changed (getf report :diagnostic) \"COD-61: sorgenti cambiati.\")))
    (when directory (write-report report directory))
    report))

(defun self-test-reporter ()
  \"Il driver dispatch rifiuta CLI/destinazione e conserva replica conclusa più raw parziale.\"
  (let ((called nil) (root (arcdocdb.pool-lifecycle.measure::fresh-self-test-directory)))
    (unwind-protect
         (progn
           (dolist (args '(nil (\"--bench\") (\"--bad\") (\"--bench\" \"directory\" \"extra\")))
             (unless (and (eq :failed (getf (run-driver args :product-loader (lambda () (setf called t))) :status))
                          (null called))
               (error \"COD-60: CLI invalida eseguita.\")))
           (let* ((existing (acquire-directory (merge-pathnames \"existing/\" root)))
                  (failed (merge-pathnames \"failed/\" root)))
             (write-report '(:sentinel :unchanged) existing)
             (unless (and (eq :failed (getf (run-driver (list \"--bench\" (namestring existing))
                                                      :product-loader (constantly nil)
                                                      :tester (constantly :passed)) :status))
                          (equal (arcdocdb.pool-lifecycle.measure::read-self-test-report existing)
                                 '(:sentinel :unchanged)))
               (error \"COD-60: destinazione precedente non conservata.\"))
             (run-driver (list \"--bench\" (namestring failed))
                         :product-loader (constantly nil) :tester (constantly :passed)
                         :runner (lambda (report checkpoint)
                                   (setf (getf report :current-replica) 1 (getf report :samples)
                                         (list (list :status :ok :raw-ticks 3 :heap-bytes 0)
                                               (list :status :running :raw-ticks 7 :heap-bytes 11
                                                     :diagnostic nil)))
                                   (funcall checkpoint) (error \"fixture: replica interrotta\")))
             (let* ((saved (arcdocdb.pool-lifecycle.measure::read-self-test-report failed))
                    (samples (getf saved :samples)))
               (unless (and (eq :failed (getf saved :status)) (= 1 (getf saved :current-replica))
                            (= 2 (length samples)) (eq :ok (getf (first samples) :status))
                            (eq :failed (getf (second samples) :status))
                            (= 7 (getf (second samples) :raw-ticks))
                            (= 11 (getf (second samples) :heap-bytes)))
                 (error \"COD-60: replica o raw parziale persi.\")))))
      (uiop:delete-directory-tree root :validate t)))
  :passed)


(defun self-test-oracle ()
  \"Ciascuno dei tre risultati ricircolo difforme deve essere respinto.\"
  (dolist (row '((:unexpected :published 1) (nil :claimed 1) (nil :published 2)))
    (unless (handler-case
                (progn (verify-recycle (lambda (dispatcher) (declare (ignore dispatcher)) (values-list row))
                                       nil nil :published 1) nil)
              (error () t))
      (error \"COD-60: risultato recycle difforme non respinto: ~S.\" row)))
  :passed)
(defun self-test ()
  \"Sensore comune heap/sink/clock/partial, tre risultati e due protocolli reali con drain.\"
  (list :status :ok :shared-sensor (arcdocdb.pool-lifecycle.measure::self-test)
        :recycle-oracles (self-test-oracle) :recycle-cli-and-partial-raw (self-test-reporter)
        :room (arcdocdb.pool-lifecycle.measure::self-test-composed #'create-room-cycle)
        :full (arcdocdb.pool-lifecycle.measure::self-test-composed #'create-full-cycle)))
(defun main ()
  \"Rapporto leggibile; errore nonzero anche per fonte cambiata o heap osservato positivo.\"
  (let ((report (run-driver (uiop:command-line-arguments))))
    (let ((*print-readably* t)) (write report :pretty t) (terpri))
    (unless (eq :ok (getf report :status))
      (format *error-output* \"~&tools/measure-pool-recycle.lisp: ~A~%\" (getf report :diagnostic))
      (uiop:quit 1))))
(unless (member :arcdocdb-pool-recycle-measure-library *features*) (main))
")
  (:PATH
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/attempt-01.log")
   :BYTES 7666 :SHA256 "043b60443b26969b6f0e0f50a2ca2b11bf7f6636ccab98e5f940e357f5f7155a" :GIT-BLOB
   "126fb40d1d782d6ff49e08b54f943b2a4c3b8ee3" :TEXT "; 
; caught ERROR:
;   READ error during COMPILE-FILE:
;   
;     unmatched close parenthesis
;   
;       Line: 338, Column: 86, File-Position: 20893
;   
;       Stream: #<SB-INT:FORM-TRACKING-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/pool-recycle.lisp\" {8008B44173}>
Unhandled UIOP/LISP-BUILD:COMPILE-FILE-ERROR in thread #<SB-THREAD:THREAD tid=259 \"main thread\" RUNNING
                                                          {80052B03C3}>:
  COMPILE-FILE-ERROR while
  compiling #<CL-SOURCE-FILE \"arcdocdb/tests\" \"scheduler\" \"pool-recycle\">

Backtrace for: #<SB-THREAD:THREAD tid=259 \"main thread\" RUNNING {80052B03C3}>
0: (SB-DEBUG::DEBUGGER-DISABLED-HOOK #<UIOP/LISP-BUILD:COMPILE-FILE-ERROR {800C36EB63}> #<unused argument> :QUIT T)
1: (SB-DEBUG::RUN-HOOK *INVOKE-DEBUGGER-HOOK* #<UIOP/LISP-BUILD:COMPILE-FILE-ERROR {800C36EB63}>)
2: (INVOKE-DEBUGGER #<UIOP/LISP-BUILD:COMPILE-FILE-ERROR {800C36EB63}>)
3: (ERROR UIOP/LISP-BUILD:COMPILE-FILE-ERROR :CONTEXT-FORMAT \"~/asdf-action::format-action/\" :CONTEXT-ARGUMENTS ((#<ASDF/LISP-ACTION:COMPILE-OP > . #<ASDF/LISP-ACTION:CL-SOURCE-FILE \"arcdocdb/tests\" \"scheduler\" \"pool-recycle\">)))
4: (UIOP/LISP-BUILD:CHECK-LISP-COMPILE-RESULTS NIL T T \"~/asdf-action::format-action/\" ((#<ASDF/LISP-ACTION:COMPILE-OP > . #<ASDF/LISP-ACTION:CL-SOURCE-FILE \"arcdocdb/tests\" \"scheduler\" \"pool-recycle\">)))
5: ((SB-PCL::EMF ASDF/ACTION:PERFORM) #<unused argument> #<unused argument> #<ASDF/LISP-ACTION:COMPILE-OP > #<ASDF/LISP-ACTION:CL-SOURCE-FILE \"arcdocdb/tests\" \"scheduler\" \"pool-recycle\">)
6: ((LAMBDA NIL :IN ASDF/ACTION:CALL-WHILE-VISITING-ACTION))
7: ((:METHOD ASDF/ACTION:PERFORM-WITH-RESTARTS :AROUND (T T)) #<ASDF/LISP-ACTION:COMPILE-OP > #<ASDF/LISP-ACTION:CL-SOURCE-FILE \"arcdocdb/tests\" \"scheduler\" \"pool-recycle\">) [fast-method]
8: ((:METHOD ASDF/PLAN:PERFORM-PLAN (T)) #<ASDF/PLAN:SEQUENTIAL-PLAN {80052809E3}>) [fast-method]
9: ((FLET SB-C::WITH-IT :IN SB-C::%WITH-COMPILATION-UNIT))
10: ((:METHOD ASDF/PLAN:PERFORM-PLAN :AROUND (T)) #<ASDF/PLAN:SEQUENTIAL-PLAN {80052809E3}>) [fast-method]
11: ((:METHOD ASDF/OPERATE:OPERATE (ASDF/OPERATION:OPERATION ASDF/COMPONENT:COMPONENT)) #<ASDF/LISP-ACTION:LOAD-OP > #<ASDF/SYSTEM:SYSTEM \"arcdocdb/tests\"> :PLAN-CLASS NIL :PLAN-OPTIONS NIL) [fast-method]
12: ((SB-PCL::EMF ASDF/OPERATE:OPERATE) #<unused argument> #<unused argument> #<ASDF/LISP-ACTION:LOAD-OP > #<ASDF/SYSTEM:SYSTEM \"arcdocdb/tests\">)
13: ((LAMBDA NIL :IN ASDF/OPERATE:OPERATE))
14: ((:METHOD ASDF/OPERATE:OPERATE :AROUND (T T)) #<ASDF/LISP-ACTION:LOAD-OP > #<ASDF/SYSTEM:SYSTEM \"arcdocdb/tests\">) [fast-method]
15: ((SB-PCL::EMF ASDF/OPERATE:OPERATE) #<unused argument> #<unused argument> ASDF/LISP-ACTION:LOAD-OP \"arcdocdb/tests\")
16: ((LAMBDA NIL :IN ASDF/OPERATE:OPERATE))
17: ((:METHOD ASDF/OPERATE:OPERATE :AROUND (T T)) ASDF/LISP-ACTION:LOAD-OP \"arcdocdb/tests\") [fast-method]
18: (ASDF/SESSION:CALL-WITH-ASDF-SESSION #<FUNCTION (LAMBDA NIL :IN ASDF/OPERATE:OPERATE) {800528084B}> :OVERRIDE T :KEY NIL :OVERRIDE-CACHE T :OVERRIDE-FORCING NIL)
19: ((LAMBDA NIL :IN ASDF/OPERATE:OPERATE))
20: (ASDF/SESSION:CALL-WITH-ASDF-SESSION #<FUNCTION (LAMBDA NIL :IN ASDF/OPERATE:OPERATE) {800528073B}> :OVERRIDE NIL :KEY NIL :OVERRIDE-CACHE NIL :OVERRIDE-FORCING NIL)
21: ((:METHOD ASDF/OPERATE:OPERATE :AROUND (T T)) ASDF/LISP-ACTION:LOAD-OP \"arcdocdb/tests\") [fast-method]
22: (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb/tests\")
23: (\"top level form\") [toplevel]
24: ((FLET \"G\" :IN SB-C::%COMPILE-IN-LEXENV))
25: (SB-C::%COMPILE-IN-LEXENV (LET ((SB-KERNEL:*HANDLER-CLUSTERS* (CONS (LIST #) . #1=(SB-KERNEL:*HANDLER-CLUSTERS*)))) (DECLARE (DYNAMIC-EXTENT . #1#)) (PROGN (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb/tests\"))) #<NULL-LEXENV> NIL #<SB-C::SOURCE-INFO {8005280423}> 3 NIL T T)
26: (SB-C:EVAL-WITH-COMPILE-IN-LEXENV (LET ((SB-KERNEL:*HANDLER-CLUSTERS* (CONS (LIST #) . #1=(SB-KERNEL:*HANDLER-CLUSTERS*)))) (DECLARE (DYNAMIC-EXTENT . #1#)) (PROGN (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb/tests\"))) #<NULL-LEXENV> #<SB-C::SOURCE-INFO {8005280423}> 3 NIL)
27: (SB-IMPL::%SIMPLE-EVAL (LET ((SB-KERNEL:*HANDLER-CLUSTERS* (CONS (LIST #) . #1=(SB-KERNEL:*HANDLER-CLUSTERS*)))) (DECLARE (DYNAMIC-EXTENT . #1#)) (PROGN (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb/tests\"))) #<NULL-LEXENV>)
28: (SB-INT:SIMPLE-EVAL-IN-LEXENV (HANDLER-BIND ((WARNING (LAMBDA (CONDITION) (UNLESS # #)))) (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb/tests\")) #<NULL-LEXENV>)
29: (EVAL-TLF (HANDLER-BIND ((WARNING (LAMBDA (CONDITION) (UNLESS # #)))) (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb/tests\")) 3 NIL)
30: ((LABELS SB-FASL::EVAL-FORM :IN SB-INT:LOAD-AS-SOURCE) (HANDLER-BIND ((WARNING (LAMBDA (CONDITION) (UNLESS # #)))) (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb/tests\")) 3)
31: ((LAMBDA (SB-KERNEL:FORM &KEY :CURRENT-INDEX &ALLOW-OTHER-KEYS) :IN SB-INT:LOAD-AS-SOURCE) (HANDLER-BIND ((WARNING (LAMBDA (CONDITION) (UNLESS # #)))) (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb/tests\")) :CURRENT-INDEX 3)
32: (SB-C::%DO-FORMS-FROM-INFO #<FUNCTION (LAMBDA (SB-KERNEL:FORM &KEY :CURRENT-INDEX &ALLOW-OTHER-KEYS) :IN SB-INT:LOAD-AS-SOURCE) {1074E0F1B}> #<SB-C::SOURCE-INFO {8005280423}> SB-C::INPUT-ERROR-IN-LOAD)
33: (SB-INT:LOAD-AS-SOURCE #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/scoped.lisp\" {8005280043}> :VERBOSE NIL :PRINT NIL :CONTEXT \"loading\")
34: ((LABELS SB-FASL::LOAD-STREAM-1 :IN LOAD) #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/scoped.lisp\" {8005280043}> NIL)
35: (SB-FASL::CALL-WITH-LOAD-BINDINGS #<FUNCTION (LABELS SB-FASL::LOAD-STREAM-1 :IN LOAD) {1074E09EB}> #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/scoped.lisp\" {8005280043}> NIL #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/scoped.lisp\" {8005280043}>)
36: ((LABELS SB-FASL::LOAD-STREAM :IN LOAD) #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/scoped.lisp\" {8005280043}> NIL)
37: (LOAD #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/scoped.lisp\" {8005280043}> :VERBOSE NIL :PRINT NIL :IF-DOES-NOT-EXIST :ERROR :EXTERNAL-FORMAT :DEFAULT)
38: ((FLET SB-IMPL::LOAD-SCRIPT :IN SB-IMPL::PROCESS-SCRIPT) #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/scoped.lisp\" {8005280043}>)
39: ((FLET SB-UNIX::BODY :IN SB-IMPL::PROCESS-SCRIPT))
40: ((FLET \"WITHOUT-INTERRUPTS-BODY-\" :IN SB-IMPL::PROCESS-SCRIPT))
41: (SB-IMPL::PROCESS-SCRIPT \"spikes/out/pool-recycle-tests/scoped.lisp\")
42: (SB-IMPL::TOPLEVEL-INIT)
43: ((FLET SB-UNIX::BODY :IN SB-IMPL::START-LISP))
44: ((FLET \"WITHOUT-INTERRUPTS-BODY-3\" :IN SB-IMPL::START-LISP))
45: (SB-IMPL::%START-LISP)

unhandled condition in --disable-debugger mode, quitting
; 
; compilation unit aborted
;   caught 2 fatal ERROR conditions
;   caught 1 ERROR condition
")
  (:PATH
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/attempt-02.log")
   :BYTES 19930 :SHA256 "61b1dd46956f86bb4dfe7d279234ae05a4576093955e197fbe760d4035034f23"
   :GIT-BLOB "379a04fe00667b31638e4ea16215e35b9124d7a5" :TEXT
   "Unhandled SIMPLE-ERROR in thread #<SB-THREAD:THREAD tid=259 \"main thread\" RUNNING
                                    {80086B0503}>:
  Avviso non ammesso: Constant
                        :INVALID conflicts with its asserted type
                        ARCDOCDB.SCHEDULER.DISPATCH:DISPATCHER-WRITER-POOL.
See also:
  The SBCL Manual, Node \"Handling of Types\"

Backtrace for: #<SB-THREAD:THREAD tid=259 \"main thread\" RUNNING {80086B0503}>
0: (SB-DEBUG::DEBUGGER-DISABLED-HOOK #<SIMPLE-ERROR \"Avviso non ammesso: ~A\" {800614F053}> #<unused argument> :QUIT T)
1: (SB-DEBUG::RUN-HOOK SB-EXT:*INVOKE-DEBUGGER-HOOK* #<SIMPLE-ERROR \"Avviso non ammesso: ~A\" {800614F053}>)
2: (INVOKE-DEBUGGER #<SIMPLE-ERROR \"Avviso non ammesso: ~A\" {800614F053}>)
3: (ERROR \"Avviso non ammesso: ~A\" #<SB-INT:TYPE-WARNING #<SB-FORMAT::FMT-CONTROL \"~@<Constant ~2I~_~S ~Iconflicts with its asserted type ~2I~_~/SB-IMPL:PRINT-TYPE-SPECIFIER/.~@:>\"> {800614F013}>)
4: ((LAMBDA (CONDITION) :IN \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/scoped.lisp\") #<SB-INT:TYPE-WARNING #<SB-FORMAT::FMT-CONTROL \"~@<Constant ~2I~_~S ~Iconflicts with its asserted type ~2I~_~/SB-IMPL:PRINT-TYPE-SPECIFIER/.~@:>\"> {800614F013}>)
5: (SB-KERNEL::%SIGNAL #<SB-INT:TYPE-WARNING #<SB-FORMAT::FMT-CONTROL \"~@<Constant ~2I~_~S ~Iconflicts with its asserted type ~2I~_~/SB-IMPL:PRINT-TYPE-SPECIFIER/.~@:>\"> {800614F013}>)
6: (SB-C::COMPILER-WARNING-HANDLER #<SB-INT:TYPE-WARNING #<SB-FORMAT::FMT-CONTROL \"~@<Constant ~2I~_~S ~Iconflicts with its asserted type ~2I~_~/SB-IMPL:PRINT-TYPE-SPECIFIER/.~@:>\"> {800614F013}>)
7: (SB-KERNEL::%SIGNAL #<SB-INT:TYPE-WARNING #<SB-FORMAT::FMT-CONTROL \"~@<Constant ~2I~_~S ~Iconflicts with its asserted type ~2I~_~/SB-IMPL:PRINT-TYPE-SPECIFIER/.~@:>\"> {800614F013}>)
8: ((FLET SB-KERNEL::%WARN :IN \"SYS:SRC;CODE;WARM-ERROR.LISP\") SB-INT:TYPE-WARNING #<SB-KERNEL::CONDITION-CLASSOID WARNING> SIMPLE-WARNING :FORMAT-CONTROL #<SB-FORMAT::FMT-CONTROL \"~@<Constant ~2I~_~S ~Iconflicts with its asserted type ~2I~_~/SB-IMPL:PRINT-TYPE-SPECIFIER/.~@:>\"> :FORMAT-ARGUMENTS (:INVALID ARCDOCDB.SCHEDULER.DISPATCH:DISPATCHER-WRITER-POOL))
9: (SB-C::%COMPILE-TIME-TYPE-ERROR-WARN #<SB-C::COMBINATION :FUN SB-C::%COMPILE-TIME-TYPE-ERROR :ARGS (#<SB-C::COMBINATION :FUN LIST :ARGS (#<SB-C::REF  :LEAF # {800608DA83}>) {80061022D3}> #<SB-C::REF  :LEAF #<SB-KERNEL:CONSTANT :VALUE ARCDOCDB.SCHEDULER.DISPATCH:DISPATCHER-WRITER-POOL {8006103D53}> {8006103DB3}> #<SB-C::REF  :LEAF (VALUES (MEMBER :INVALID) &OPTIONAL) {8006103F43}> #<SB-C::REF  :LEAF (:INVALID) {80061040D3}> #<SB-C::REF  :LEAF \"(ARCDOCDB.SCHEDULER.DISPATCH:RICIRCOLA-COLLEGAMENTO-POOL :INVALID)\" {8006104243}> #<SB-C::REF  :LEAF #<SB-KERNEL:CONSTANT :VALUE NIL {8008CA6563}> {8006104353}>) {8006103AC3}> ARCDOCDB.SCHEDULER.DISPATCH:DISPATCHER-WRITER-POOL (VALUES (MEMBER :INVALID) &OPTIONAL) (:INVALID) :CAST-CONTEXT NIL :CONDITION SB-INT:TYPE-WARNING)
10: (SB-C::%COMPILE-TIME-TYPE-ERROR-IR2-CONVERT-OPTIMIZER #<SB-C::COMBINATION :FUN SB-C::%COMPILE-TIME-TYPE-ERROR :ARGS (#<SB-C::COMBINATION :FUN LIST :ARGS (#<SB-C::REF  :LEAF # {800608DA83}>) {80061022D3}> #<SB-C::REF  :LEAF #<SB-KERNEL:CONSTANT :VALUE ARCDOCDB.SCHEDULER.DISPATCH:DISPATCHER-WRITER-POOL {8006103D53}> {8006103DB3}> #<SB-C::REF  :LEAF (VALUES (MEMBER :INVALID) &OPTIONAL) {8006103F43}> #<SB-C::REF  :LEAF (:INVALID) {80061040D3}> #<SB-C::REF  :LEAF \"(ARCDOCDB.SCHEDULER.DISPATCH:RICIRCOLA-COLLEGAMENTO-POOL :INVALID)\" {8006104243}> #<SB-C::REF  :LEAF #<SB-KERNEL:CONSTANT :VALUE NIL {8008CA6563}> {8006104353}>) {8006103AC3}> #<SB-C::IR2-BLOCK :PUSHED (#<SB-C::LVAR 1 {800612F633}>) :START-VOP #<SB-C::VOP :INFO SB-C:CURRENT-BINDING-POINTER :ARGS NIL :RESULTS #<SB-C:TN-REF :TN #<SB-C:TN t1 :COMPONENT> :WRITE-P T :VOP SB-C:CURRENT-BINDING-POINTER>> :LAST-VOP #<SB-C::VOP :INFO LIST :ARGS #<SB-C:TN-REF :TN #<SB-C:TN ':INVALID!2[Const16] :CONSTANT> :WRITE-P NIL :VOP LIST> :RESULTS #<SB-C:TN-REF :TN #<SB-C:TN t3 :NORMAL> :WRITE-P T :VOP LIST> :CODEGEN-INFO (NIL 1)> {8006135053}>)
11: (SB-C::IR2-CONVERT-BLOCK #<SB-C::CBLOCK 1 :START c2 {80060828B3}>)
12: (SB-C:IR2-CONVERT #<SB-C:COMPONENT :NAME (DEFTEST TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS) {8006101093}>)
13: (SB-C::%COMPILE-COMPONENT #<SB-C:COMPONENT :NAME (DEFTEST TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS) {8006101093}>)
14: (SB-C::COMPILE-COMPONENT #<SB-C:COMPONENT :NAME (DEFTEST TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS) {8006101093}>)
15: (SB-C::COMPILE-TOPLEVEL (#<SB-C::CLAMBDA :%SOURCE-NAME SB-C::.ANONYMOUS. :%DEBUG-NAME \"top level form\" :KIND (TOPLEVEL) :TYPE #<SB-KERNEL:BUILT-IN-CLASSOID FUNCTION (read-only)> :WHERE-FROM :DEFINED :VARS NIL {8006081733}>) NIL)
16: (SB-C::CONVERT-AND-MAYBE-COMPILE (SB-IMPL::%DEFUN (QUOTE TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS) (SB-INT:NAMED-LAMBDA TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE #) (LET # # #))))) (#1=(SB-IMPL::%DEFUN (QUOTE TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS) (SB-INT:NAMED-LAMBDA TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS . #2=(#)))) (PROGN (EVAL-WHEN (:COMPILE-TOPLEVEL) (SB-C:%COMPILER-DEFUN (QUOTE TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS) T NIL NIL)) #1#) #3=(DEFUN TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS NIL . #2#) (PROGN #3# (PUSHNEW (QUOTE TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS) *TESTS*)) SB-C::ORIGINAL-SOURCE-START 0 15))
17: (SB-C::PROCESS-TOPLEVEL-FORM (SB-IMPL::%DEFUN (QUOTE TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS) (SB-INT:NAMED-LAMBDA TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE #) (LET # # #))))) ((PROGN (EVAL-WHEN (:COMPILE-TOPLEVEL) (SB-C:%COMPILER-DEFUN (QUOTE TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS) T NIL NIL)) (SB-IMPL::%DEFUN (QUOTE TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS) (SB-INT:NAMED-LAMBDA TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS NIL (DECLARE #) (BLOCK TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS . #1=#)))) #2=(DEFUN TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS NIL . #1#) (PROGN #2# (PUSHNEW (QUOTE TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS) *TESTS*)) SB-C::ORIGINAL-SOURCE-START 0 15) NIL)
18: (SB-C::PROCESS-TOPLEVEL-PROGN ((EVAL-WHEN (:COMPILE-TOPLEVEL) (SB-C:%COMPILER-DEFUN (QUOTE TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS) T NIL NIL)) (SB-IMPL::%DEFUN (QUOTE TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS) (SB-INT:NAMED-LAMBDA TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS (WITH-POOL-DISPATCH # # #))))) ((PROGN (EVAL-WHEN (:COMPILE-TOPLEVEL) (SB-C:%COMPILER-DEFUN (QUOTE TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS) T NIL NIL)) (SB-IMPL::%DEFUN (QUOTE TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS) (SB-INT:NAMED-LAMBDA TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS NIL (DECLARE #) (BLOCK TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS . #1=#)))) #2=(DEFUN TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS NIL . #1#) (PROGN #2# (PUSHNEW (QUOTE TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS) *TESTS*)) SB-C::ORIGINAL-SOURCE-START 0 15) NIL)
19: (SB-C::PROCESS-TOPLEVEL-FORM (PROGN (EVAL-WHEN (:COMPILE-TOPLEVEL) (SB-C:%COMPILER-DEFUN (QUOTE TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS) T NIL NIL)) (SB-IMPL::%DEFUN (QUOTE TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS) (SB-INT:NAMED-LAMBDA TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS NIL (DECLARE (SB-C::TOP-LEVEL-FORM)) (BLOCK TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS (WITH-POOL-DISPATCH # # #))))) (#1=(DEFUN TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS NIL (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORABLE DISPATCHER CONTEXT READY CONTROLLERS)) (LET (#) (SIGNALS TYPE-ERROR #) (IS #)))) (PROGN #1# (PUSHNEW (QUOTE TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS) *TESTS*)) SB-C::ORIGINAL-SOURCE-START 0 15) NIL)
20: (SB-C::PROCESS-TOPLEVEL-FORM (DEFUN TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS NIL (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORABLE DISPATCHER CONTEXT READY CONTROLLERS)) (LET ((BEFORE #)) (SIGNALS TYPE-ERROR (ARCDOCDB.SCHEDULER.DISPATCH:RICIRCOLA-COLLEGAMENTO-POOL :INVALID)) (IS (EQUALP BEFORE #))))) ((PROGN (DEFUN TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS NIL (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE #) (LET # # #))) (PUSHNEW (QUOTE TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS) *TESTS*)) SB-C::ORIGINAL-SOURCE-START 0 15) NIL)
21: (SB-C::PROCESS-TOPLEVEL-PROGN ((DEFUN TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS NIL (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORABLE DISPATCHER CONTEXT READY CONTROLLERS)) (LET (#) (SIGNALS TYPE-ERROR #) (IS #)))) (PUSHNEW (QUOTE TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS) *TESTS*)) ((PROGN (DEFUN TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS NIL (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE #) (LET # # #))) (PUSHNEW (QUOTE TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS) *TESTS*)) SB-C::ORIGINAL-SOURCE-START 0 15) NIL)
22: (SB-C::PROCESS-TOPLEVEL-FORM (PROGN (DEFUN TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS NIL (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORABLE DISPATCHER CONTEXT READY CONTROLLERS)) (LET (#) (SIGNALS TYPE-ERROR #) (IS #)))) (PUSHNEW (QUOTE TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS) *TESTS*)) (SB-C::ORIGINAL-SOURCE-START 0 15) NIL)
23: (SB-C::PROCESS-TOPLEVEL-FORM (DEFTEST TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORABLE DISPATCHER CONTEXT READY CONTROLLERS)) (LET ((BEFORE #)) (SIGNALS TYPE-ERROR (ARCDOCDB.SCHEDULER.DISPATCH:RICIRCOLA-COLLEGAMENTO-POOL :INVALID)) (IS (EQUALP BEFORE #))))) (SB-C::ORIGINAL-SOURCE-START 0 15) NIL)
24: ((LAMBDA (SB-KERNEL:FORM &KEY :CURRENT-INDEX &ALLOW-OTHER-KEYS) :IN SB-C::SUB-COMPILE-FILE) (DEFTEST TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS (WITH-POOL-DISPATCH (DISPATCHER PORT CONTEXT READY TABLE WRITERS CONTROLLERS) (DECLARE (IGNORABLE DISPATCHER CONTEXT READY CONTROLLERS)) (LET ((BEFORE #)) (SIGNALS TYPE-ERROR (ARCDOCDB.SCHEDULER.DISPATCH:RICIRCOLA-COLLEGAMENTO-POOL :INVALID)) (IS (EQUALP BEFORE #))))) :CURRENT-INDEX 15)
25: (SB-C::%DO-FORMS-FROM-INFO #<FUNCTION (LAMBDA (SB-KERNEL:FORM &KEY :CURRENT-INDEX &ALLOW-OTHER-KEYS) :IN SB-C::SUB-COMPILE-FILE) {800347C83B}> #<SB-C::SOURCE-INFO {8008BB06C3}> SB-C::INPUT-ERROR-IN-COMPILE-FILE)
26: ((LAMBDA NIL :IN SB-C::SUB-COMPILE-FILE))
27: ((FLET SB-C::WITH-IT :IN SB-C::%WITH-COMPILATION-UNIT))
28: (SB-C::SUB-COMPILE-FILE #<SB-C::SOURCE-INFO {8008BB06C3}> NIL)
29: (COMPILE-FILE #P\"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/pool-recycle.lisp\" :OUTPUT-FILE #P#<(SIMPLE-ARRAY CHARACTER (202)) /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/pool-recycle-tmpGHU3ALSV.fa... {80061F4A4F}> :VERBOSE NIL :PRINT NIL :EXTERNAL-FORMAT :UTF-8 :PROGRESS NIL :TRACE-FILE NIL :BLOCK-COMPILE NIL :ENTRY-POINTS NIL :EMIT-CFASL NIL)
30: (UIOP/UTILITY:CALL-WITH-MUFFLED-CONDITIONS #<FUNCTION (LAMBDA NIL :IN UIOP/LISP-BUILD:COMPILE-FILE*) {8008BB068B}> NIL)
31: (UIOP/PATHNAME:CALL-WITH-ENOUGH-PATHNAME #P\"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/pool-recycle.lisp\" NIL #<FUNCTION (LAMBDA (UIOP/LISP-BUILD::INPUT-FILE) :IN UIOP/LISP-BUILD:COMPILE-FILE*) {8008BB064B}>)
32: (UIOP/LISP-BUILD:COMPILE-FILE* #P\"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/pool-recycle.lisp\" :OUTPUT-FILE #P\"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/cache/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/pool-recycle.fasl\" :EXTERNAL-FORMAT :UTF-8 :WARNINGS-FILE NIL)
33: (ASDF/LISP-ACTION:PERFORM-LISP-COMPILATION #<ASDF/LISP-ACTION:COMPILE-OP > #<ASDF/LISP-ACTION:CL-SOURCE-FILE \"arcdocdb/tests\" \"scheduler\" \"pool-recycle\">)
34: ((SB-PCL::EMF ASDF/ACTION:PERFORM) #<unused argument> #<unused argument> #<ASDF/LISP-ACTION:COMPILE-OP > #<ASDF/LISP-ACTION:CL-SOURCE-FILE \"arcdocdb/tests\" \"scheduler\" \"pool-recycle\">)
35: ((LAMBDA NIL :IN ASDF/ACTION:CALL-WHILE-VISITING-ACTION))
36: ((:METHOD ASDF/ACTION:PERFORM-WITH-RESTARTS :AROUND (T T)) #<ASDF/LISP-ACTION:COMPILE-OP > #<ASDF/LISP-ACTION:CL-SOURCE-FILE \"arcdocdb/tests\" \"scheduler\" \"pool-recycle\">) [fast-method]
37: ((:METHOD ASDF/PLAN:PERFORM-PLAN (T)) #<ASDF/PLAN:SEQUENTIAL-PLAN {8008BB02F3}>) [fast-method]
38: ((FLET SB-C::WITH-IT :IN SB-C::%WITH-COMPILATION-UNIT))
39: ((:METHOD ASDF/PLAN:PERFORM-PLAN :AROUND (T)) #<ASDF/PLAN:SEQUENTIAL-PLAN {8008BB02F3}>) [fast-method]
40: ((:METHOD ASDF/OPERATE:OPERATE (ASDF/OPERATION:OPERATION ASDF/COMPONENT:COMPONENT)) #<ASDF/LISP-ACTION:LOAD-OP > #<ASDF/SYSTEM:SYSTEM \"arcdocdb/tests\"> :PLAN-CLASS NIL :PLAN-OPTIONS NIL) [fast-method]
41: ((SB-PCL::EMF ASDF/OPERATE:OPERATE) #<unused argument> #<unused argument> #<ASDF/LISP-ACTION:LOAD-OP > #<ASDF/SYSTEM:SYSTEM \"arcdocdb/tests\">)
42: ((LAMBDA NIL :IN ASDF/OPERATE:OPERATE))
43: ((:METHOD ASDF/OPERATE:OPERATE :AROUND (T T)) #<ASDF/LISP-ACTION:LOAD-OP > #<ASDF/SYSTEM:SYSTEM \"arcdocdb/tests\">) [fast-method]
44: ((SB-PCL::EMF ASDF/OPERATE:OPERATE) #<unused argument> #<unused argument> ASDF/LISP-ACTION:LOAD-OP \"arcdocdb/tests\")
45: ((LAMBDA NIL :IN ASDF/OPERATE:OPERATE))
46: ((:METHOD ASDF/OPERATE:OPERATE :AROUND (T T)) ASDF/LISP-ACTION:LOAD-OP \"arcdocdb/tests\") [fast-method]
47: (ASDF/SESSION:CALL-WITH-ASDF-SESSION #<FUNCTION (LAMBDA NIL :IN ASDF/OPERATE:OPERATE) {8008BB017B}> :OVERRIDE T :KEY NIL :OVERRIDE-CACHE T :OVERRIDE-FORCING NIL)
48: ((LAMBDA NIL :IN ASDF/OPERATE:OPERATE))
49: (ASDF/SESSION:CALL-WITH-ASDF-SESSION #<FUNCTION (LAMBDA NIL :IN ASDF/OPERATE:OPERATE) {8008BB00DB}> :OVERRIDE NIL :KEY NIL :OVERRIDE-CACHE NIL :OVERRIDE-FORCING NIL)
50: ((:METHOD ASDF/OPERATE:OPERATE :AROUND (T T)) ASDF/LISP-ACTION:LOAD-OP \"arcdocdb/tests\") [fast-method]
51: (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb/tests\")
52: (\"top level form\") [toplevel]
53: ((FLET \"G\" :IN SB-C::%COMPILE-IN-LEXENV))
54: (SB-C::%COMPILE-IN-LEXENV (LET ((SB-KERNEL:*HANDLER-CLUSTERS* (CONS (LIST #) . #1=(SB-KERNEL:*HANDLER-CLUSTERS*)))) (DECLARE (DYNAMIC-EXTENT . #1#)) (PROGN (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb/tests\"))) #<NULL-LEXENV> NIL #<SB-C::SOURCE-INFO {8008690423}> 3 NIL T T)
55: (SB-C:EVAL-WITH-COMPILE-IN-LEXENV (LET ((SB-KERNEL:*HANDLER-CLUSTERS* (CONS (LIST #) . #1=(SB-KERNEL:*HANDLER-CLUSTERS*)))) (DECLARE (DYNAMIC-EXTENT . #1#)) (PROGN (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb/tests\"))) #<NULL-LEXENV> #<SB-C::SOURCE-INFO {8008690423}> 3 NIL)
56: (SB-IMPL::%SIMPLE-EVAL (LET ((SB-KERNEL:*HANDLER-CLUSTERS* (CONS (LIST #) . #1=(SB-KERNEL:*HANDLER-CLUSTERS*)))) (DECLARE (DYNAMIC-EXTENT . #1#)) (PROGN (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb/tests\"))) #<NULL-LEXENV>)
57: (SB-INT:SIMPLE-EVAL-IN-LEXENV (HANDLER-BIND ((WARNING (LAMBDA (CONDITION) (UNLESS # #)))) (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb/tests\")) #<NULL-LEXENV>)
58: (SB-EXT:EVAL-TLF (HANDLER-BIND ((WARNING (LAMBDA (CONDITION) (UNLESS # #)))) (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb/tests\")) 3 NIL)
59: ((LABELS SB-FASL::EVAL-FORM :IN SB-INT:LOAD-AS-SOURCE) (HANDLER-BIND ((WARNING (LAMBDA (CONDITION) (UNLESS # #)))) (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb/tests\")) 3)
60: ((LAMBDA (SB-KERNEL:FORM &KEY :CURRENT-INDEX &ALLOW-OTHER-KEYS) :IN SB-INT:LOAD-AS-SOURCE) (HANDLER-BIND ((WARNING (LAMBDA (CONDITION) (UNLESS # #)))) (ASDF/FIND-SYSTEM:LOAD-ASD (MERGE-PATHNAMES \"arcdocdb.asd\" (TRUENAME \"./\"))) (ASDF/OPERATE:LOAD-SYSTEM \"arcdocdb/tests\")) :CURRENT-INDEX 3)
61: (SB-C::%DO-FORMS-FROM-INFO #<FUNCTION (LAMBDA (SB-KERNEL:FORM &KEY :CURRENT-INDEX &ALLOW-OTHER-KEYS) :IN SB-INT:LOAD-AS-SOURCE) {105530F1B}> #<SB-C::SOURCE-INFO {8008690423}> SB-C::INPUT-ERROR-IN-LOAD)
62: (SB-INT:LOAD-AS-SOURCE #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/scoped.lisp\" {8008690043}> :VERBOSE NIL :PRINT NIL :CONTEXT \"loading\")
63: ((LABELS SB-FASL::LOAD-STREAM-1 :IN LOAD) #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/scoped.lisp\" {8008690043}> NIL)
64: (SB-FASL::CALL-WITH-LOAD-BINDINGS #<FUNCTION (LABELS SB-FASL::LOAD-STREAM-1 :IN LOAD) {1055309EB}> #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/scoped.lisp\" {8008690043}> NIL #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/scoped.lisp\" {8008690043}>)
65: ((LABELS SB-FASL::LOAD-STREAM :IN LOAD) #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/scoped.lisp\" {8008690043}> NIL)
66: (LOAD #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/scoped.lisp\" {8008690043}> :VERBOSE NIL :PRINT NIL :IF-DOES-NOT-EXIST :ERROR :EXTERNAL-FORMAT :DEFAULT)
67: ((FLET SB-IMPL::LOAD-SCRIPT :IN SB-IMPL::PROCESS-SCRIPT) #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/scoped.lisp\" {8008690043}>)
68: ((FLET SB-UNIX::BODY :IN SB-IMPL::PROCESS-SCRIPT))
69: ((FLET \"WITHOUT-INTERRUPTS-BODY-\" :IN SB-IMPL::PROCESS-SCRIPT))
70: (SB-IMPL::PROCESS-SCRIPT \"spikes/out/pool-recycle-tests/scoped.lisp\")
71: (SB-IMPL::TOPLEVEL-INIT)
72: ((FLET SB-UNIX::BODY :IN SB-IMPL::START-LISP))
73: ((FLET \"WITHOUT-INTERRUPTS-BODY-3\" :IN SB-IMPL::START-LISP))
74: (SB-IMPL::%START-LISP)

unhandled condition in --disable-debugger mode, quitting
; 
; compilation unit aborted
;   caught 2 fatal ERROR conditions
")
  (:PATH
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/attempt-03.log")
   :BYTES 957 :SHA256 "6c2497cd9d147614f3c0b2f7159aa804779bb364c57a26bcb0bd5399dae18bc0" :GIT-BLOB
   "228fc8409b4bb4e38a96d0f3b0df946b2674cdce" :TEXT
   "ok    TEST-REQ-CON-002-POOL-RECYCLE-ROOM-PUBLISHES-ONCE-WITHOUT-SECOND-CLAIM-OR-ROUTING
ok    TEST-REQ-CON-002-POOL-RECYCLE-FULL-ROUTES-NEW-WRITER-WITHOUT-BEGIN-OR-CURSOR-CHANGE
ok    TEST-REQ-CON-004-POOL-RECYCLE-READY-BUSY-PRESERVES-COMPLETE-OBLIGATION-AND-RING
ok    TEST-REQ-CON-005-POOL-RECYCLE-SIX-DISALLOWED-PHASES-PRESERVE-DEBTS-AND-FIRST-FAULT
ok    TEST-REQ-CON-002-POOL-RECYCLE-EXISTING-OBLIGATION-IGNORES-INACTIVE-AND-CORRUPT-WORDS
ok    TEST-REQ-CON-002-POOL-RECYCLE-ROOM-DOES-NOT-ACKNOWLEDGE-PENDING-RETIRE
ok    TEST-REQ-AFF-008-POOL-RECYCLE-BINDING-REFUSES-BEFORE-TRANSFER
ok    TEST-REQ-CON-005-POOL-RECYCLE-FOREIGN-OWNER-PRECEDES-BINDING-AND-POOL-DATA
ok    TEST-REQ-AFF-008-POOL-RECYCLE-ROUTING-FAULT-KEEPS-COMPLETED-FULL-TRANSFER
ok    TEST-REQ-AFF-008-POOL-RECYCLE-CONTRADICTORY-OUTPUT-REFUSES-BEFORE-ROUTING-WITHOUT-C3-FAULT
ok    TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS
11 test scoped ricircolo superati.
")
  (:PATH
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/attempt-04.log")
   :BYTES 1037 :SHA256 "a009c47028175dec33b92ce12e263b28d2096ddf2f633cabd4a1289e7797e2b8" :GIT-BLOB
   "117f8d087481ff6c9f52b99783e6ce4756eaa61e" :TEXT
   "ok    TEST-REQ-CON-002-POOL-RECYCLE-ROOM-PUBLISHES-ONCE-WITHOUT-SECOND-CLAIM-OR-ROUTING
ok    TEST-REQ-CON-002-POOL-RECYCLE-FULL-ROUTES-NEW-WRITER-WITHOUT-BEGIN-OR-CURSOR-CHANGE
ok    TEST-REQ-CON-004-POOL-RECYCLE-READY-BUSY-PRESERVES-COMPLETE-OBLIGATION-AND-RING
ok    TEST-REQ-CON-005-POOL-RECYCLE-SIX-DISALLOWED-PHASES-PRESERVE-DEBTS-AND-FIRST-FAULT
ok    TEST-REQ-CON-002-POOL-RECYCLE-EXISTING-OBLIGATION-IGNORES-INACTIVE-AND-CORRUPT-WORDS
ok    TEST-REQ-CON-002-POOL-RECYCLE-ROOM-DOES-NOT-ACKNOWLEDGE-PENDING-RETIRE
ok    TEST-REQ-AFF-008-POOL-RECYCLE-BINDING-REFUSES-BEFORE-TRANSFER
ok    TEST-REQ-CON-005-POOL-RECYCLE-FOREIGN-OWNER-PRECEDES-BINDING-AND-POOL-DATA
ok    TEST-REQ-AFF-008-POOL-RECYCLE-ROUTING-FAULT-KEEPS-COMPLETED-FULL-TRANSFER
ok    TEST-REQ-AFF-008-POOL-RECYCLE-CONTRADICTORY-OUTPUT-REFUSES-BEFORE-ROUTING-WITHOUT-C3-FAULT
ok    TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS
ok    TEST-REQ-CON-004-POOL-RECYCLE-READY-INVARIANT-PRESERVES-ORIGINAL-C1-FAULT
12 test scoped ricircolo superati.
")
  (:PATH
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/attempt-05.log")
   :BYTES 1123 :SHA256 "d2004f550a9d6e09448c1e7cee4d33a0979d26c8845ce5458994a48777658309" :GIT-BLOB
   "dce2d75b9c5441f85f26a546b3754749ade93043" :TEXT
   "ok    TEST-REQ-CON-002-POOL-RECYCLE-ROOM-PUBLISHES-ONCE-WITHOUT-SECOND-CLAIM-OR-ROUTING
ok    TEST-REQ-CON-002-POOL-RECYCLE-FULL-ROUTES-NEW-WRITER-WITHOUT-BEGIN-OR-CURSOR-CHANGE
ok    TEST-REQ-CON-004-POOL-RECYCLE-READY-BUSY-PRESERVES-COMPLETE-OBLIGATION-AND-RING
ok    TEST-REQ-CON-005-POOL-RECYCLE-SIX-DISALLOWED-PHASES-PRESERVE-DEBTS-AND-FIRST-FAULT
ok    TEST-REQ-CON-002-POOL-RECYCLE-EXISTING-OBLIGATION-IGNORES-INACTIVE-AND-CORRUPT-WORDS
ok    TEST-REQ-CON-002-POOL-RECYCLE-ROOM-DOES-NOT-ACKNOWLEDGE-PENDING-RETIRE
ok    TEST-REQ-AFF-008-POOL-RECYCLE-BINDING-REFUSES-BEFORE-TRANSFER
ok    TEST-REQ-CON-005-POOL-RECYCLE-FOREIGN-OWNER-PRECEDES-BINDING-AND-POOL-DATA
ok    TEST-REQ-AFF-008-POOL-RECYCLE-ROUTING-FAULT-KEEPS-COMPLETED-FULL-TRANSFER
ok    TEST-REQ-AFF-008-POOL-RECYCLE-CONTRADICTORY-OUTPUT-REFUSES-BEFORE-ROUTING-WITHOUT-C3-FAULT
ok    TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS
ok    TEST-REQ-CON-004-POOL-RECYCLE-READY-INVARIANT-PRESERVES-ORIGINAL-C1-FAULT
ok    TEST-REQ-CON-004-POOL-RECYCLE-UNKNOWN-STATUS-REFUSES-AT-RUNTIME-WITHOUT-EFFECTS
13 test scoped ricircolo superati.
")
  (:PATH
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/scheduler-attempt-01.log")
   :BYTES 6412 :SHA256 "330c3c1335bea4722fb2cf6272eb670510439a6df9622be58a898148b6a653e6" :GIT-BLOB
   "5f6bd8b74055783db5970ec941bcebba50d72052" :TEXT
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
ok    TEST-REQ-CON-002-POOL-RECYCLE-ROOM-PUBLISHES-ONCE-WITHOUT-SECOND-CLAIM-OR-ROUTING
ok    TEST-REQ-CON-002-POOL-RECYCLE-FULL-ROUTES-NEW-WRITER-WITHOUT-BEGIN-OR-CURSOR-CHANGE
ok    TEST-REQ-CON-004-POOL-RECYCLE-READY-BUSY-PRESERVES-COMPLETE-OBLIGATION-AND-RING
ok    TEST-REQ-CON-005-POOL-RECYCLE-SIX-DISALLOWED-PHASES-PRESERVE-DEBTS-AND-FIRST-FAULT
ok    TEST-REQ-CON-002-POOL-RECYCLE-EXISTING-OBLIGATION-IGNORES-INACTIVE-AND-CORRUPT-WORDS
ok    TEST-REQ-CON-002-POOL-RECYCLE-ROOM-DOES-NOT-ACKNOWLEDGE-PENDING-RETIRE
ok    TEST-REQ-AFF-008-POOL-RECYCLE-BINDING-REFUSES-BEFORE-TRANSFER
ok    TEST-REQ-CON-005-POOL-RECYCLE-FOREIGN-OWNER-PRECEDES-BINDING-AND-POOL-DATA
ok    TEST-REQ-AFF-008-POOL-RECYCLE-ROUTING-FAULT-KEEPS-COMPLETED-FULL-TRANSFER
ok    TEST-REQ-AFF-008-POOL-RECYCLE-CONTRADICTORY-OUTPUT-REFUSES-BEFORE-ROUTING-WITHOUT-C3-FAULT
ok    TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS
ok    TEST-REQ-CON-004-POOL-RECYCLE-READY-INVARIANT-PRESERVES-ORIGINAL-C1-FAULT
79 test del controllore pool superati.
")
  (:PATH
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/scheduler-attempt-02.log")
   :BYTES 6498 :SHA256 "af28ec748278965feae1412ba49217bbd867d66d8e4d89184cf4243c93503f1a" :GIT-BLOB
   "0a8bbfefd04fd440a7b1b7ce85afd836dd4d8c48" :TEXT
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
ok    TEST-REQ-CON-002-POOL-RECYCLE-ROOM-PUBLISHES-ONCE-WITHOUT-SECOND-CLAIM-OR-ROUTING
ok    TEST-REQ-CON-002-POOL-RECYCLE-FULL-ROUTES-NEW-WRITER-WITHOUT-BEGIN-OR-CURSOR-CHANGE
ok    TEST-REQ-CON-004-POOL-RECYCLE-READY-BUSY-PRESERVES-COMPLETE-OBLIGATION-AND-RING
ok    TEST-REQ-CON-005-POOL-RECYCLE-SIX-DISALLOWED-PHASES-PRESERVE-DEBTS-AND-FIRST-FAULT
ok    TEST-REQ-CON-002-POOL-RECYCLE-EXISTING-OBLIGATION-IGNORES-INACTIVE-AND-CORRUPT-WORDS
ok    TEST-REQ-CON-002-POOL-RECYCLE-ROOM-DOES-NOT-ACKNOWLEDGE-PENDING-RETIRE
ok    TEST-REQ-AFF-008-POOL-RECYCLE-BINDING-REFUSES-BEFORE-TRANSFER
ok    TEST-REQ-CON-005-POOL-RECYCLE-FOREIGN-OWNER-PRECEDES-BINDING-AND-POOL-DATA
ok    TEST-REQ-AFF-008-POOL-RECYCLE-ROUTING-FAULT-KEEPS-COMPLETED-FULL-TRANSFER
ok    TEST-REQ-AFF-008-POOL-RECYCLE-CONTRADICTORY-OUTPUT-REFUSES-BEFORE-ROUTING-WITHOUT-C3-FAULT
ok    TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS
ok    TEST-REQ-CON-004-POOL-RECYCLE-READY-INVARIANT-PRESERVES-ORIGINAL-C1-FAULT
ok    TEST-REQ-CON-004-POOL-RECYCLE-UNKNOWN-STATUS-REFUSES-AT-RUNTIME-WITHOUT-EFFECTS
80 test del controllore pool superati.
")
  (:PATH
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/scheduler.lisp")
   :BYTES 652 :SHA256 "5377d65d152658547a8c9f31d93bb56a4bb3afad44f17209a03fca7412a049c8" :GIT-BLOB
   "626711b57d6f7af3da875430f803602feed4146c" :TEXT "(require :asdf)
(asdf:initialize-output-translations
 `(:output-translations
   (t ,(namestring (merge-pathnames \"spikes/out/pool-recycle-tests/cache/\" (truename \"./\"))))
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
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/scoped.lisp")
   :BYTES 920 :SHA256 "72b49ad8ee268ab2f76d6c21da6b36331bcf62044580bb479679123cb08abcfb" :GIT-BLOB
   "86b9f1714ec50c0e44d7be4ec8be96461a6ddd3a" :TEXT "(require :asdf)
(asdf:initialize-output-translations
 `(:output-translations
   (t ,(namestring (merge-pathnames \"spikes/out/pool-recycle-tests/cache/\" (truename \"./\"))))
   :ignore-inherited-configuration))
(setf asdf:*compile-file-failure-behaviour* :error
      asdf:*compile-file-warnings-behaviour* :error)
(handler-bind ((warning (lambda (condition)
                          (unless (typep condition 'sb-kernel:redefinition-warning)
                            (error \"Avviso non ammesso: ~A\" condition)))))
  (asdf:load-asd (merge-pathnames \"arcdocdb.asd\" (truename \"./\")))
  (asdf:load-system \"arcdocdb/tests\"))
(let ((tests (remove-if-not
              (lambda (name) (search \"POOL-RECYCLE-\" (symbol-name name)))
              arcdocdb.scheduler.tests::*tests*)))
  (dolist (name (reverse tests)) (funcall name) (format t \"ok    ~A~%\" name))
  (format t \"~D test scoped ricircolo superati.~%\" (length tests)))
")
  (:PATH
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/source-attempt-01.lisp")
   :BYTES 21388 :SHA256 "4f8acedbdd76010fb35a96810abb2d1c75c05c1a9a669f8f47570f29a61e9608"
   :GIT-BLOB "d76927ec8e058a0640d9ac9c021ab68467900928" :TEXT
   ";;;; Ricircolo pool: un trasferimento ready e routing del solo obbligo CLAIMED.
;;;; OWNER: fixture, porta, dispatcher e bridge sul thread creatore.
;;;; FI quiescenti dichiarate: immagini, binding/parole corrotti e sentinelle ripristinate.
(in-package #:arcdocdb.scheduler.tests)

(defun pool-recycle-check (dispatcher link status count)
  \"Oracolo dei tre valori; count atteso dal caller, mai derivato dal cursore.\"
  (is (equal (list link status count)
             (multiple-value-list
              (arcdocdb.scheduler.dispatch:ricircola-collegamento-pool dispatcher)))))

(defun pool-recycle-reschedule (dispatcher context ready writers home)
  \"A viene acquisito e termina realmente un primo quantum con obbligo RESCHEDULE.\"
  (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready home (svref writers 0))))
  (arcdocdb.execution.tests::worker-check-claim
   context (svref writers 0) :claimed
   (mod (1+ home) (length (arcdocdb.execution::lista-writer-pronti-partitions ready))))
  (pool-dispatch-finish
   (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a1 :schedule)
  (is (eq :reschedule (arcdocdb.execution:stato-worker-writer context))))

(defun pool-recycle-without-gate (thunk)
  \"FI di chiamata: nessun nuovo claim o ACK lifecycle durante un obbligo esistente.\"
  (pool-claim-function-fi
   'arcdocdb.scheduler:prendi-writer-pool
   (lambda (port) (declare (ignore port)) (error \"Nuovo gate durante ricircolo.\"))
   (lambda ()
     (pool-claim-function-fi
      'arcdocdb.scheduler:applica-stato-worker-pool
      (lambda (port) (declare (ignore port)) (error \"ACK pool durante ricircolo.\"))
      thunk))))

(defun pool-recycle-refusal (dispatcher port table writers type reason)
  (pool-dispatch-refusal
   port table writers
   (lambda () (arcdocdb.scheduler.dispatch:ricircola-collegamento-pool dispatcher))
   type reason))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-recycle-room-publishes-once-without-second-claim-or-routing
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :shards 3 :capacity 2 :start 1)
    (pool-recycle-reschedule dispatcher context ready writers 2)
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 (svref writers 1))))
    (let ((series-before (map 'list #'pool-dispatch-series-image controllers))
          (cursor (arcdocdb.execution::contesto-worker-writer-cursor context))
          (home (arcdocdb.execution::contesto-worker-writer-home context))
          (calls 0) (original (fdefinition 'arcdocdb.execution:ricircola-worker)))
      (is (zerop cursor)) (is (= 2 home))
      (pool-recycle-without-gate
       (lambda ()
         (pool-claim-function-fi
          'arcdocdb.execution:ricircola-worker
          (lambda (worker) (incf calls) (funcall original worker))
          (lambda ()
            (pool-claim-function-fi
             'arcdocdb.execution.series:collega-writer-worker-serie
             (lambda (routing) (declare (ignore routing))
               (error \"Routing apres publication sans nouvel obligation.\"))
             (lambda () (pool-recycle-check dispatcher nil :published 2)))))))
      (is (= 1 calls))
      (is (eq :idle (arcdocdb.execution:stato-worker-writer context)))
      (is (null (arcdocdb.execution:writer-worker-writer context)))
      (is (= cursor (arcdocdb.execution::contesto-worker-writer-cursor context)))
      (is (= home (arcdocdb.execution::contesto-worker-writer-home context)))
      (is (equalp series-before (map 'list #'pool-dispatch-series-image controllers)))
      (is (equal '(1 1 nil) (lifecycle-words port))))
    ;; L'oracolo FIFO B poi A e indipendente dagli indici privati del ring.
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 1) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :b1 :idle)
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)
    (is (every (lambda (link) (eq :idle (arcdocdb.execution.series:stato-worker-serie link)))
               (arcdocdb.execution.series::tabella-worker-serie-links table)))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-recycle-full-routes-new-writer-without-begin-or-cursor-change
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :shards 3 :start 1)
    (pool-recycle-reschedule dispatcher context ready writers 2)
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 (svref writers 1))))
    (let* ((links (arcdocdb.execution.series::tabella-worker-serie-links table))
           (right (svref links 1))
           (series-before (map 'list #'pool-dispatch-series-image controllers))
           (left-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0)))
           (right-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 1)))
           (other-before (loop for i below 2 collect
                              (arcdocdb.execution.tests::ready-fi-snapshot
                               (arcdocdb.execution.tests::ready-test-partition ready i))))
           (original (fdefinition 'arcdocdb.execution:ricircola-worker)) (calls 0))
      (pool-recycle-without-gate
       (lambda ()
         (pool-claim-function-fi
          'arcdocdb.execution:ricircola-worker
          (lambda (worker) (incf calls) (funcall original worker))
          (lambda () (pool-recycle-check dispatcher right :claimed 1)))))
      (is (= 1 calls))
      (is (eq (svref writers 1) (arcdocdb.execution:writer-worker-writer context)))
      (is (eq :claimed (arcdocdb.execution:stato-worker-writer context)))
      (is (eq :idle (arcdocdb.execution.series:stato-worker-serie right)))
      (is (= 0 (arcdocdb.execution::contesto-worker-writer-cursor context)))
      (is (= 2 (arcdocdb.execution::contesto-worker-writer-home context)))
      (is (zerop (arcdocdb.execution::contesto-worker-writer-lease context)))
      (is (zerop (arcdocdb.execution::contesto-worker-writer-pending context)))
      (is (equalp series-before (map 'list #'pool-dispatch-series-image controllers)))
      (is (equalp left-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0))))
      (is (equalp right-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 1))))
      (is (equalp other-before (loop for i below 2 collect
                                    (arcdocdb.execution.tests::ready-fi-snapshot
                                     (arcdocdb.execution.tests::ready-test-partition ready i)))))
      (is (equal '(1 1 nil) (lifecycle-words port)))
      (pool-dispatch-finish right :b1 :idle))
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-004-pool-recycle-ready-busy-preserves-complete-obligation-and-ring
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable controllers))
    (pool-recycle-reschedule dispatcher context ready writers 0)
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 1))))
    ;; Vera guardia CAS detenuta dalla fixture; nessun BUSY sintetico.
    (arcdocdb.execution.tests::ready-call-with-guards
     (list (arcdocdb.execution.tests::ready-test-partition ready 0))
     (lambda ()
       (pool-recycle-without-gate
        (lambda () (pool-recycle-refusal dispatcher port table writers
                                          'resource-exhausted :ready-queue-busy)))))
    (pool-recycle-check dispatcher
                        (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 1)
                        :claimed 1)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :b1 :idle)
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-recycle-six-disallowed-phases-preserve-debts-and-first-fault
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable controllers))
    (flet ((refuse () (pool-recycle-refusal dispatcher port table writers
                                             'resource-exhausted :worker-state)))
      (refuse)
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
      (pool-dispatch-check dispatcher
                           (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0)
                           :claimed 0 :unchanged)
      (refuse)
      (let* ((link (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher))
             (token (pool-claim-bridge-begin link)))
        (refuse)
        (let ((batch (pool-claim-bridge-pop link token :a1)))
          (refuse)
          (is (null (arcdocdb.execution.series:conferma-worker-serie link token batch))))
        (lifecycle-queue-busy
         (arcdocdb.execution::writer-programmabile-queue (svref writers 0))
         (lambda ()
           (signals resource-exhausted
             (arcdocdb.execution.series:termina-worker-serie link token) :writer-queue-busy)
           (is (eq :finishing (arcdocdb.execution:stato-worker-writer context)))
           (refuse)))
        (is (eq :schedule (arcdocdb.execution.series:termina-worker-serie link token))))
      (pool-recycle-check dispatcher nil :published 1)
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-dispatch-finish
       (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)
      ;; FI diagnostica quiescente: FAULTED conserva esattamente la prima causa.
      (let ((original (make-condition 'invariant-violation :reason :worker-state)))
        (setf (arcdocdb.execution::contesto-worker-writer-state context) :faulted
              (arcdocdb.execution::contesto-worker-writer-fault context) original)
        (refuse)
        (is (eq original (arcdocdb.execution:errore-worker-writer context)))))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-recycle-existing-obligation-ignores-inactive-and-corrupt-words
  (dolist (scenario '(:inactive :corrupt :retire))
    (with-pool-dispatch (dispatcher port context ready table writers controllers
                                   :active (not (eq scenario :inactive)))
      (declare (ignorable controllers))
      (pool-recycle-reschedule dispatcher context ready writers 0)
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 1))))
      ;; FI coordinator quiescente; il ricircolo non deve leggere queste parole.
      (case scenario
        (:corrupt (setf (arcdocdb.scheduler::porta-worker-pool-request port) 4
                        (arcdocdb.scheduler::porta-worker-pool-ack port) 0))
        (:retire (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)))
      (let ((words (lifecycle-words port)))
        (pool-recycle-without-gate
         (lambda ()
           (pool-recycle-check
            dispatcher (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 1)
            :claimed 1)))
        (is (equal words (lifecycle-words port)))
        (pool-dispatch-finish
         (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :b1 :idle)
        (is (equal words (lifecycle-words port))))
      (when (eq scenario :retire)
        (pool-dispatch-check dispatcher nil :inactive 0 :retired)
        (is (equal '(2 2 nil) (lifecycle-words port))))
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-dispatch-finish
       (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-recycle-room-does-not-acknowledge-pending-retire
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable table controllers))
    (pool-recycle-reschedule dispatcher context ready writers 0)
    (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
    (pool-recycle-without-gate (lambda () (pool-recycle-check dispatcher nil :published 1)))
    (is (equal '(2 1 nil) (lifecycle-words port)))
    (is (eq :idle (arcdocdb.execution:stato-worker-writer context)))
    (pool-dispatch-check dispatcher nil :inactive 0 :retired)
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-recycle-binding-refuses-before-transfer
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable controllers))
    (pool-recycle-reschedule dispatcher context ready writers 0)
    (let* ((other (arcdocdb.execution:crea-contesto-worker-writer ready))
           (bad-table (arcdocdb.execution.series::%make-tabella-worker-serie
                       other (arcdocdb.execution.series::tabella-worker-serie-registry table)
                       (arcdocdb.execution.series::tabella-worker-serie-links table)))
           (bad (arcdocdb.scheduler.dispatch::%make-dispatcher-writer-pool port bad-table)))
      (pool-claim-function-fi
       'arcdocdb.execution:ricircola-worker
       (lambda (worker) (declare (ignore worker)) (error \"Trasferimento dopo binding errato.\"))
       (lambda () (pool-recycle-refusal bad port table writers
                                         'invalid-argument :pool-dispatcher-binding)))
      (is (eq :idle (arcdocdb.execution:stato-worker-writer other))))
    (pool-recycle-check dispatcher nil :published 1)
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-recycle-foreign-owner-precedes-binding-and-pool-data
  (let ((worker (lifecycle-fixture-start t)) (dispatcher nil) (table nil) (writers nil)
        (left-file nil) (right-file nil))
    (unwind-protect
         (progn
           (lifecycle-call
            worker
            (lambda (owned)
              (multiple-value-bind (left resource) (pool-claim-series 85)
                (setf left-file resource)
                (multiple-value-bind (right resource) (pool-claim-series 86)
                  (setf right-file resource writers (vector (pool-claim-writer '(:a1 :a2) 0)
                                                           (pool-claim-writer '(:b1) 1))
                        table (arcdocdb.execution.series:crea-tabella-worker-serie
                               (lifecycle-fixture-context owned)
                               (arcdocdb.execution.series:crea-registro-worker-serie
                                writers (vector left right)))
                        dispatcher (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool
                                    (lifecycle-fixture-port owned) table))))
              (pool-recycle-reschedule dispatcher (lifecycle-fixture-context owned)
                                       (pool-claim-ready (lifecycle-fixture-context owned)) writers 0)
              :ok))
           (let* ((port (lifecycle-fixture-port worker))
                  (ready (pool-claim-ready (lifecycle-fixture-context worker)))
                  (other (arcdocdb.execution:crea-contesto-worker-writer ready))
                  (bad-table (arcdocdb.execution.series::%make-tabella-worker-serie
                              other (arcdocdb.execution.series::tabella-worker-serie-registry table)
                              (arcdocdb.execution.series::tabella-worker-serie-links table)))
                  (bad (arcdocdb.scheduler.dispatch::%make-dispatcher-writer-pool port bad-table)))
             (setf (arcdocdb.scheduler::porta-worker-pool-request port) 4)
             (pool-recycle-refusal bad port table writers 'invalid-argument :pool-worker-owner)
             (setf (arcdocdb.scheduler::porta-worker-pool-request port) 1))
           (lifecycle-call
            worker
            (lambda (owned)
              (let ((context (lifecycle-fixture-context owned)))
                (pool-recycle-check dispatcher nil :published 1)
                (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
                (pool-dispatch-finish
                 (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)) :ok)))
      (when left-file
        (lifecycle-call worker (lambda (owned) (declare (ignore owned))
                                 (when right-file (arcdocdb.io:chiudi right-file))
                                 (arcdocdb.io:chiudi left-file) :ok)))
      (lifecycle-fixtures-stop (list worker)))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-recycle-routing-fault-keeps-completed-full-transfer
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :shards 3 :start 1)
    (pool-recycle-reschedule dispatcher context ready writers 2)
    (let* ((unknown (pool-claim-writer '(:unknown) 2))
           (series-before (map 'list #'pool-dispatch-series-image controllers))
           (left-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0)))
           (unknown-before (arcdocdb.execution.tests::handoff-fi-snapshot unknown)))
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 unknown)))
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
      (let ((condition
              (arcdocdb.execution.tests::worker-capture-condition
               (lambda () (arcdocdb.scheduler.dispatch:ricircola-collegamento-pool dispatcher))
               'invariant-violation :worker-serie-routing)))
        (is (eq :faulted (arcdocdb.execution:stato-worker-writer context)))
        (is (eq unknown (arcdocdb.execution:writer-worker-writer context)))
        (is (eq condition (arcdocdb.execution:errore-worker-writer context)))
        (is (= 0 (arcdocdb.execution::contesto-worker-writer-cursor context)))
        (is (= 2 (arcdocdb.execution::contesto-worker-writer-home context)))
        (is (zerop (arcdocdb.execution::contesto-worker-writer-lease context)))
        (is (zerop (arcdocdb.execution::contesto-worker-writer-pending context)))
        (is (equal '(2 1 nil) (lifecycle-words port)))
        (is (equalp series-before (map 'list #'pool-dispatch-series-image controllers)))
        (is (equalp left-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0))))
        (is (equalp unknown-before (arcdocdb.execution.tests::handoff-fi-snapshot unknown)))
        (pool-recycle-refusal dispatcher port table writers 'resource-exhausted :worker-state)
        (is (eq condition (arcdocdb.execution:errore-worker-writer context))))
      ;; Dopo il fault il vecchio A e gia nel ring: nessun rollback dello scambio.
      (multiple-value-bind (writer status next) (arcdocdb.execution:preleva-writer-pronto ready 2)
        (is (eq writer (svref writers 0))) (is (eq status :writer)) (is (zerop next))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-recycle-contradictory-output-refuses-before-routing-without-c3-fault
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable context ready controllers))
    ;; FI quiescente di contratto: combinazioni ammesse dai tipi ma incoerenti.
    (dolist (status '(:claimed :published))
      (pool-claim-function-fi
       'arcdocdb.execution:ricircola-worker
       (lambda (worker) (declare (ignore worker))
         (values (and (eq status :published) (svref writers 0)) status 1))
       (lambda ()
         (pool-claim-function-fi
          'arcdocdb.execution.series:collega-writer-worker-serie
          (lambda (routing) (declare (ignore routing)) (error \"Routing di output contraddittorio.\"))
          (lambda ()
            (pool-recycle-refusal dispatcher port table writers
                                  'invariant-violation :pool-dispatcher-state)))))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-recycle-invalid-dispatcher-type-has-no-effects
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable dispatcher context ready controllers))
    (let ((before (pool-dispatch-image port table writers)))
      (signals type-error (arcdocdb.scheduler.dispatch:ricircola-collegamento-pool :invalid))
      (is (equalp before (pool-dispatch-image port table writers))))))
")
  (:PATH
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/source-attempt-02.lisp")
   :BYTES 21385 :SHA256 "46accbf427354853be10175191004db53443d11644294f887cd4850ddff18bf5"
   :GIT-BLOB "2460767709d17722cba9094923a7e39ccedca2ad" :TEXT
   ";;;; Ricircolo pool: un trasferimento ready e routing del solo obbligo CLAIMED.
;;;; OWNER: fixture, porta, dispatcher e bridge sul thread creatore.
;;;; FI quiescenti dichiarate: immagini, binding/parole corrotti e sentinelle ripristinate.
(in-package #:arcdocdb.scheduler.tests)

(defun pool-recycle-check (dispatcher link status count)
  \"Oracolo dei tre valori; count atteso dal caller, mai derivato dal cursore.\"
  (is (equal (list link status count)
             (multiple-value-list
              (arcdocdb.scheduler.dispatch:ricircola-collegamento-pool dispatcher)))))

(defun pool-recycle-reschedule (dispatcher context ready writers home)
  \"A viene acquisito e termina realmente un primo quantum con obbligo RESCHEDULE.\"
  (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready home (svref writers 0))))
  (arcdocdb.execution.tests::worker-check-claim
   context (svref writers 0) :claimed
   (mod (1+ home) (length (arcdocdb.execution::lista-writer-pronti-partitions ready))))
  (pool-dispatch-finish
   (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a1 :schedule)
  (is (eq :reschedule (arcdocdb.execution:stato-worker-writer context))))

(defun pool-recycle-without-gate (thunk)
  \"FI di chiamata: nessun nuovo claim o ACK lifecycle durante un obbligo esistente.\"
  (pool-claim-function-fi
   'arcdocdb.scheduler:prendi-writer-pool
   (lambda (port) (declare (ignore port)) (error \"Nuovo gate durante ricircolo.\"))
   (lambda ()
     (pool-claim-function-fi
      'arcdocdb.scheduler:applica-stato-worker-pool
      (lambda (port) (declare (ignore port)) (error \"ACK pool durante ricircolo.\"))
      thunk))))

(defun pool-recycle-refusal (dispatcher port table writers type reason)
  (pool-dispatch-refusal
   port table writers
   (lambda () (arcdocdb.scheduler.dispatch:ricircola-collegamento-pool dispatcher))
   type reason))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-recycle-room-publishes-once-without-second-claim-or-routing
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :shards 3 :capacity 2 :start 1)
    (pool-recycle-reschedule dispatcher context ready writers 2)
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 (svref writers 1))))
    (let ((series-before (map 'list #'pool-dispatch-series-image controllers))
          (cursor (arcdocdb.execution::contesto-worker-writer-cursor context))
          (home (arcdocdb.execution::contesto-worker-writer-home context))
          (calls 0) (original (fdefinition 'arcdocdb.execution:ricircola-worker)))
      (is (zerop cursor)) (is (= 2 home))
      (pool-recycle-without-gate
       (lambda ()
         (pool-claim-function-fi
          'arcdocdb.execution:ricircola-worker
          (lambda (worker) (incf calls) (funcall original worker))
          (lambda ()
            (pool-claim-function-fi
             'arcdocdb.execution.series:collega-writer-worker-serie
             (lambda (routing) (declare (ignore routing))
               (error \"Routing dopo pubblicazione senza nuovo obbligo.\"))
             (lambda () (pool-recycle-check dispatcher nil :published 2)))))))
      (is (= 1 calls))
      (is (eq :idle (arcdocdb.execution:stato-worker-writer context)))
      (is (null (arcdocdb.execution:writer-worker-writer context)))
      (is (= cursor (arcdocdb.execution::contesto-worker-writer-cursor context)))
      (is (= home (arcdocdb.execution::contesto-worker-writer-home context)))
      (is (equalp series-before (map 'list #'pool-dispatch-series-image controllers)))
      (is (equal '(1 1 nil) (lifecycle-words port))))
    ;; L'oracolo FIFO B poi A e indipendente dagli indici privati del ring.
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 1) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :b1 :idle)
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)
    (is (every (lambda (link) (eq :idle (arcdocdb.execution.series:stato-worker-serie link)))
               (arcdocdb.execution.series::tabella-worker-serie-links table)))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-recycle-full-routes-new-writer-without-begin-or-cursor-change
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :shards 3 :start 1)
    (pool-recycle-reschedule dispatcher context ready writers 2)
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 (svref writers 1))))
    (let* ((links (arcdocdb.execution.series::tabella-worker-serie-links table))
           (right (svref links 1))
           (series-before (map 'list #'pool-dispatch-series-image controllers))
           (left-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0)))
           (right-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 1)))
           (other-before (loop for i below 2 collect
                              (arcdocdb.execution.tests::ready-fi-snapshot
                               (arcdocdb.execution.tests::ready-test-partition ready i))))
           (original (fdefinition 'arcdocdb.execution:ricircola-worker)) (calls 0))
      (pool-recycle-without-gate
       (lambda ()
         (pool-claim-function-fi
          'arcdocdb.execution:ricircola-worker
          (lambda (worker) (incf calls) (funcall original worker))
          (lambda () (pool-recycle-check dispatcher right :claimed 1)))))
      (is (= 1 calls))
      (is (eq (svref writers 1) (arcdocdb.execution:writer-worker-writer context)))
      (is (eq :claimed (arcdocdb.execution:stato-worker-writer context)))
      (is (eq :idle (arcdocdb.execution.series:stato-worker-serie right)))
      (is (= 0 (arcdocdb.execution::contesto-worker-writer-cursor context)))
      (is (= 2 (arcdocdb.execution::contesto-worker-writer-home context)))
      (is (zerop (arcdocdb.execution::contesto-worker-writer-lease context)))
      (is (zerop (arcdocdb.execution::contesto-worker-writer-pending context)))
      (is (equalp series-before (map 'list #'pool-dispatch-series-image controllers)))
      (is (equalp left-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0))))
      (is (equalp right-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 1))))
      (is (equalp other-before (loop for i below 2 collect
                                    (arcdocdb.execution.tests::ready-fi-snapshot
                                     (arcdocdb.execution.tests::ready-test-partition ready i)))))
      (is (equal '(1 1 nil) (lifecycle-words port)))
      (pool-dispatch-finish right :b1 :idle))
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-004-pool-recycle-ready-busy-preserves-complete-obligation-and-ring
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable controllers))
    (pool-recycle-reschedule dispatcher context ready writers 0)
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 1))))
    ;; Vera guardia CAS detenuta dalla fixture; nessun BUSY sintetico.
    (arcdocdb.execution.tests::ready-call-with-guards
     (list (arcdocdb.execution.tests::ready-test-partition ready 0))
     (lambda ()
       (pool-recycle-without-gate
        (lambda () (pool-recycle-refusal dispatcher port table writers
                                          'resource-exhausted :ready-queue-busy)))))
    (pool-recycle-check dispatcher
                        (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 1)
                        :claimed 1)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :b1 :idle)
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-recycle-six-disallowed-phases-preserve-debts-and-first-fault
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable controllers))
    (flet ((refuse () (pool-recycle-refusal dispatcher port table writers
                                             'resource-exhausted :worker-state)))
      (refuse)
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
      (pool-dispatch-check dispatcher
                           (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0)
                           :claimed 0 :unchanged)
      (refuse)
      (let* ((link (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher))
             (token (pool-claim-bridge-begin link)))
        (refuse)
        (let ((batch (pool-claim-bridge-pop link token :a1)))
          (refuse)
          (is (null (arcdocdb.execution.series:conferma-worker-serie link token batch))))
        (lifecycle-queue-busy
         (arcdocdb.execution::writer-programmabile-queue (svref writers 0))
         (lambda ()
           (signals resource-exhausted
             (arcdocdb.execution.series:termina-worker-serie link token) :writer-queue-busy)
           (is (eq :finishing (arcdocdb.execution:stato-worker-writer context)))
           (refuse)))
        (is (eq :schedule (arcdocdb.execution.series:termina-worker-serie link token))))
      (pool-recycle-check dispatcher nil :published 1)
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-dispatch-finish
       (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)
      ;; FI diagnostica quiescente: FAULTED conserva esattamente la prima causa.
      (let ((original (make-condition 'invariant-violation :reason :worker-state)))
        (setf (arcdocdb.execution::contesto-worker-writer-state context) :faulted
              (arcdocdb.execution::contesto-worker-writer-fault context) original)
        (refuse)
        (is (eq original (arcdocdb.execution:errore-worker-writer context)))))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-recycle-existing-obligation-ignores-inactive-and-corrupt-words
  (dolist (scenario '(:inactive :corrupt :retire))
    (with-pool-dispatch (dispatcher port context ready table writers controllers
                                   :active (not (eq scenario :inactive)))
      (declare (ignorable controllers))
      (pool-recycle-reschedule dispatcher context ready writers 0)
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 1))))
      ;; FI coordinator quiescente; il ricircolo non deve leggere queste parole.
      (case scenario
        (:corrupt (setf (arcdocdb.scheduler::porta-worker-pool-request port) 4
                        (arcdocdb.scheduler::porta-worker-pool-ack port) 0))
        (:retire (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)))
      (let ((words (lifecycle-words port)))
        (pool-recycle-without-gate
         (lambda ()
           (pool-recycle-check
            dispatcher (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 1)
            :claimed 1)))
        (is (equal words (lifecycle-words port)))
        (pool-dispatch-finish
         (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :b1 :idle)
        (is (equal words (lifecycle-words port))))
      (when (eq scenario :retire)
        (pool-dispatch-check dispatcher nil :inactive 0 :retired)
        (is (equal '(2 2 nil) (lifecycle-words port))))
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-dispatch-finish
       (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-recycle-room-does-not-acknowledge-pending-retire
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable table controllers))
    (pool-recycle-reschedule dispatcher context ready writers 0)
    (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
    (pool-recycle-without-gate (lambda () (pool-recycle-check dispatcher nil :published 1)))
    (is (equal '(2 1 nil) (lifecycle-words port)))
    (is (eq :idle (arcdocdb.execution:stato-worker-writer context)))
    (pool-dispatch-check dispatcher nil :inactive 0 :retired)
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-recycle-binding-refuses-before-transfer
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable controllers))
    (pool-recycle-reschedule dispatcher context ready writers 0)
    (let* ((other (arcdocdb.execution:crea-contesto-worker-writer ready))
           (bad-table (arcdocdb.execution.series::%make-tabella-worker-serie
                       other (arcdocdb.execution.series::tabella-worker-serie-registry table)
                       (arcdocdb.execution.series::tabella-worker-serie-links table)))
           (bad (arcdocdb.scheduler.dispatch::%make-dispatcher-writer-pool port bad-table)))
      (pool-claim-function-fi
       'arcdocdb.execution:ricircola-worker
       (lambda (worker) (declare (ignore worker)) (error \"Trasferimento dopo binding errato.\"))
       (lambda () (pool-recycle-refusal bad port table writers
                                         'invalid-argument :pool-dispatcher-binding)))
      (is (eq :idle (arcdocdb.execution:stato-worker-writer other))))
    (pool-recycle-check dispatcher nil :published 1)
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-recycle-foreign-owner-precedes-binding-and-pool-data
  (let ((worker (lifecycle-fixture-start t)) (dispatcher nil) (table nil) (writers nil)
        (left-file nil) (right-file nil))
    (unwind-protect
         (progn
           (lifecycle-call
            worker
            (lambda (owned)
              (multiple-value-bind (left resource) (pool-claim-series 85)
                (setf left-file resource)
                (multiple-value-bind (right resource) (pool-claim-series 86)
                  (setf right-file resource writers (vector (pool-claim-writer '(:a1 :a2) 0)
                                                           (pool-claim-writer '(:b1) 1))
                        table (arcdocdb.execution.series:crea-tabella-worker-serie
                               (lifecycle-fixture-context owned)
                               (arcdocdb.execution.series:crea-registro-worker-serie
                                writers (vector left right)))
                        dispatcher (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool
                                    (lifecycle-fixture-port owned) table))))
              (pool-recycle-reschedule dispatcher (lifecycle-fixture-context owned)
                                       (pool-claim-ready (lifecycle-fixture-context owned)) writers 0)
              :ok))
           (let* ((port (lifecycle-fixture-port worker))
                  (ready (pool-claim-ready (lifecycle-fixture-context worker)))
                  (other (arcdocdb.execution:crea-contesto-worker-writer ready))
                  (bad-table (arcdocdb.execution.series::%make-tabella-worker-serie
                              other (arcdocdb.execution.series::tabella-worker-serie-registry table)
                              (arcdocdb.execution.series::tabella-worker-serie-links table)))
                  (bad (arcdocdb.scheduler.dispatch::%make-dispatcher-writer-pool port bad-table)))
             (setf (arcdocdb.scheduler::porta-worker-pool-request port) 4)
             (pool-recycle-refusal bad port table writers 'invalid-argument :pool-worker-owner)
             (setf (arcdocdb.scheduler::porta-worker-pool-request port) 1))
           (lifecycle-call
            worker
            (lambda (owned)
              (let ((context (lifecycle-fixture-context owned)))
                (pool-recycle-check dispatcher nil :published 1)
                (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
                (pool-dispatch-finish
                 (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)) :ok)))
      (when left-file
        (lifecycle-call worker (lambda (owned) (declare (ignore owned))
                                 (when right-file (arcdocdb.io:chiudi right-file))
                                 (arcdocdb.io:chiudi left-file) :ok)))
      (lifecycle-fixtures-stop (list worker)))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-recycle-routing-fault-keeps-completed-full-transfer
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :shards 3 :start 1)
    (pool-recycle-reschedule dispatcher context ready writers 2)
    (let* ((unknown (pool-claim-writer '(:unknown) 2))
           (series-before (map 'list #'pool-dispatch-series-image controllers))
           (left-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0)))
           (unknown-before (arcdocdb.execution.tests::handoff-fi-snapshot unknown)))
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 unknown)))
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
      (let ((condition
              (arcdocdb.execution.tests::worker-capture-condition
               (lambda () (arcdocdb.scheduler.dispatch:ricircola-collegamento-pool dispatcher))
               'invariant-violation :worker-serie-routing)))
        (is (eq :faulted (arcdocdb.execution:stato-worker-writer context)))
        (is (eq unknown (arcdocdb.execution:writer-worker-writer context)))
        (is (eq condition (arcdocdb.execution:errore-worker-writer context)))
        (is (= 0 (arcdocdb.execution::contesto-worker-writer-cursor context)))
        (is (= 2 (arcdocdb.execution::contesto-worker-writer-home context)))
        (is (zerop (arcdocdb.execution::contesto-worker-writer-lease context)))
        (is (zerop (arcdocdb.execution::contesto-worker-writer-pending context)))
        (is (equal '(2 1 nil) (lifecycle-words port)))
        (is (equalp series-before (map 'list #'pool-dispatch-series-image controllers)))
        (is (equalp left-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0))))
        (is (equalp unknown-before (arcdocdb.execution.tests::handoff-fi-snapshot unknown)))
        (pool-recycle-refusal dispatcher port table writers 'resource-exhausted :worker-state)
        (is (eq condition (arcdocdb.execution:errore-worker-writer context))))
      ;; Dopo il fault il vecchio A e gia nel ring: nessun rollback dello scambio.
      (multiple-value-bind (writer status next) (arcdocdb.execution:preleva-writer-pronto ready 2)
        (is (eq writer (svref writers 0))) (is (eq status :writer)) (is (zerop next))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-recycle-contradictory-output-refuses-before-routing-without-c3-fault
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable context ready controllers))
    ;; FI quiescente di contratto: combinazioni ammesse dai tipi ma incoerenti.
    (dolist (status '(:claimed :published))
      (pool-claim-function-fi
       'arcdocdb.execution:ricircola-worker
       (lambda (worker) (declare (ignore worker))
         (values (and (eq status :published) (svref writers 0)) status 1))
       (lambda ()
         (pool-claim-function-fi
          'arcdocdb.execution.series:collega-writer-worker-serie
          (lambda (routing) (declare (ignore routing)) (error \"Routing di output contraddittorio.\"))
          (lambda ()
            (pool-recycle-refusal dispatcher port table writers
                                  'invariant-violation :pool-dispatcher-state))))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-recycle-invalid-dispatcher-type-has-no-effects
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable dispatcher context ready controllers))
    (let ((before (pool-dispatch-image port table writers)))
      (signals type-error (arcdocdb.scheduler.dispatch:ricircola-collegamento-pool :invalid))
      (is (equalp before (pool-dispatch-image port table writers))))))
")
  (:PATH
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/source-attempt-03.lisp")
   :BYTES 21416 :SHA256 "2ddb753bb9bfd2c60a969652ba25a9fea810de2f3cad0a6e0ffbf586b1d06c30"
   :GIT-BLOB "0ead277a65be1455b8c54773fa310dd028167ce0" :TEXT
   ";;;; Ricircolo pool: un trasferimento ready e routing del solo obbligo CLAIMED.
;;;; OWNER: fixture, porta, dispatcher e bridge sul thread creatore.
;;;; FI quiescenti dichiarate: immagini, binding/parole corrotti e sentinelle ripristinate.
(in-package #:arcdocdb.scheduler.tests)

(defun pool-recycle-check (dispatcher link status count)
  \"Oracolo dei tre valori; count atteso dal caller, mai derivato dal cursore.\"
  (is (equal (list link status count)
             (multiple-value-list
              (arcdocdb.scheduler.dispatch:ricircola-collegamento-pool dispatcher)))))

(defun pool-recycle-reschedule (dispatcher context ready writers home)
  \"A viene acquisito e termina realmente un primo quantum con obbligo RESCHEDULE.\"
  (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready home (svref writers 0))))
  (arcdocdb.execution.tests::worker-check-claim
   context (svref writers 0) :claimed
   (mod (1+ home) (length (arcdocdb.execution::lista-writer-pronti-partitions ready))))
  (pool-dispatch-finish
   (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a1 :schedule)
  (is (eq :reschedule (arcdocdb.execution:stato-worker-writer context))))

(defun pool-recycle-without-gate (thunk)
  \"FI di chiamata: nessun nuovo claim o ACK lifecycle durante un obbligo esistente.\"
  (pool-claim-function-fi
   'arcdocdb.scheduler:prendi-writer-pool
   (lambda (port) (declare (ignore port)) (error \"Nuovo gate durante ricircolo.\"))
   (lambda ()
     (pool-claim-function-fi
      'arcdocdb.scheduler:applica-stato-worker-pool
      (lambda (port) (declare (ignore port)) (error \"ACK pool durante ricircolo.\"))
      thunk))))

(defun pool-recycle-refusal (dispatcher port table writers type reason)
  (pool-dispatch-refusal
   port table writers
   (lambda () (arcdocdb.scheduler.dispatch:ricircola-collegamento-pool dispatcher))
   type reason))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-recycle-room-publishes-once-without-second-claim-or-routing
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :shards 3 :capacity 2 :start 1)
    (pool-recycle-reschedule dispatcher context ready writers 2)
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 (svref writers 1))))
    (let ((series-before (map 'list #'pool-dispatch-series-image controllers))
          (cursor (arcdocdb.execution::contesto-worker-writer-cursor context))
          (home (arcdocdb.execution::contesto-worker-writer-home context))
          (calls 0) (original (fdefinition 'arcdocdb.execution:ricircola-worker)))
      (is (zerop cursor)) (is (= 2 home))
      (pool-recycle-without-gate
       (lambda ()
         (pool-claim-function-fi
          'arcdocdb.execution:ricircola-worker
          (lambda (worker) (incf calls) (funcall original worker))
          (lambda ()
            (pool-claim-function-fi
             'arcdocdb.execution.series:collega-writer-worker-serie
             (lambda (routing) (declare (ignore routing))
               (error \"Routing dopo pubblicazione senza nuovo obbligo.\"))
             (lambda () (pool-recycle-check dispatcher nil :published 2)))))))
      (is (= 1 calls))
      (is (eq :idle (arcdocdb.execution:stato-worker-writer context)))
      (is (null (arcdocdb.execution:writer-worker-writer context)))
      (is (= cursor (arcdocdb.execution::contesto-worker-writer-cursor context)))
      (is (= home (arcdocdb.execution::contesto-worker-writer-home context)))
      (is (equalp series-before (map 'list #'pool-dispatch-series-image controllers)))
      (is (equal '(1 1 nil) (lifecycle-words port))))
    ;; L'oracolo FIFO B poi A e indipendente dagli indici privati del ring.
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 1) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :b1 :idle)
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)
    (is (every (lambda (link) (eq :idle (arcdocdb.execution.series:stato-worker-serie link)))
               (arcdocdb.execution.series::tabella-worker-serie-links table)))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-recycle-full-routes-new-writer-without-begin-or-cursor-change
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :shards 3 :start 1)
    (pool-recycle-reschedule dispatcher context ready writers 2)
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 (svref writers 1))))
    (let* ((links (arcdocdb.execution.series::tabella-worker-serie-links table))
           (right (svref links 1))
           (series-before (map 'list #'pool-dispatch-series-image controllers))
           (left-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0)))
           (right-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 1)))
           (other-before (loop for i below 2 collect
                              (arcdocdb.execution.tests::ready-fi-snapshot
                               (arcdocdb.execution.tests::ready-test-partition ready i))))
           (original (fdefinition 'arcdocdb.execution:ricircola-worker)) (calls 0))
      (pool-recycle-without-gate
       (lambda ()
         (pool-claim-function-fi
          'arcdocdb.execution:ricircola-worker
          (lambda (worker) (incf calls) (funcall original worker))
          (lambda () (pool-recycle-check dispatcher right :claimed 1)))))
      (is (= 1 calls))
      (is (eq (svref writers 1) (arcdocdb.execution:writer-worker-writer context)))
      (is (eq :claimed (arcdocdb.execution:stato-worker-writer context)))
      (is (eq :idle (arcdocdb.execution.series:stato-worker-serie right)))
      (is (= 0 (arcdocdb.execution::contesto-worker-writer-cursor context)))
      (is (= 2 (arcdocdb.execution::contesto-worker-writer-home context)))
      (is (zerop (arcdocdb.execution::contesto-worker-writer-lease context)))
      (is (zerop (arcdocdb.execution::contesto-worker-writer-pending context)))
      (is (equalp series-before (map 'list #'pool-dispatch-series-image controllers)))
      (is (equalp left-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0))))
      (is (equalp right-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 1))))
      (is (equalp other-before (loop for i below 2 collect
                                    (arcdocdb.execution.tests::ready-fi-snapshot
                                     (arcdocdb.execution.tests::ready-test-partition ready i)))))
      (is (equal '(1 1 nil) (lifecycle-words port)))
      (pool-dispatch-finish right :b1 :idle))
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-004-pool-recycle-ready-busy-preserves-complete-obligation-and-ring
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable controllers))
    (pool-recycle-reschedule dispatcher context ready writers 0)
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 1))))
    ;; Vera guardia CAS detenuta dalla fixture; nessun BUSY sintetico.
    (arcdocdb.execution.tests::ready-call-with-guards
     (list (arcdocdb.execution.tests::ready-test-partition ready 0))
     (lambda ()
       (pool-recycle-without-gate
        (lambda () (pool-recycle-refusal dispatcher port table writers
                                          'resource-exhausted :ready-queue-busy)))))
    (pool-recycle-check dispatcher
                        (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 1)
                        :claimed 1)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :b1 :idle)
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-recycle-six-disallowed-phases-preserve-debts-and-first-fault
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable controllers))
    (flet ((refuse () (pool-recycle-refusal dispatcher port table writers
                                             'resource-exhausted :worker-state)))
      (refuse)
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
      (pool-dispatch-check dispatcher
                           (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0)
                           :claimed 0 :unchanged)
      (refuse)
      (let* ((link (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher))
             (token (pool-claim-bridge-begin link)))
        (refuse)
        (let ((batch (pool-claim-bridge-pop link token :a1)))
          (refuse)
          (is (null (arcdocdb.execution.series:conferma-worker-serie link token batch))))
        (lifecycle-queue-busy
         (arcdocdb.execution::writer-programmabile-queue (svref writers 0))
         (lambda ()
           (signals resource-exhausted
             (arcdocdb.execution.series:termina-worker-serie link token) :writer-queue-busy)
           (is (eq :finishing (arcdocdb.execution:stato-worker-writer context)))
           (refuse)))
        (is (eq :schedule (arcdocdb.execution.series:termina-worker-serie link token))))
      (pool-recycle-check dispatcher nil :published 1)
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-dispatch-finish
       (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)
      ;; FI diagnostica quiescente: FAULTED conserva esattamente la prima causa.
      (let ((original (make-condition 'invariant-violation :reason :worker-state)))
        (setf (arcdocdb.execution::contesto-worker-writer-state context) :faulted
              (arcdocdb.execution::contesto-worker-writer-fault context) original)
        (refuse)
        (is (eq original (arcdocdb.execution:errore-worker-writer context)))))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-recycle-existing-obligation-ignores-inactive-and-corrupt-words
  (dolist (scenario '(:inactive :corrupt :retire))
    (with-pool-dispatch (dispatcher port context ready table writers controllers
                                   :active (not (eq scenario :inactive)))
      (declare (ignorable controllers))
      (pool-recycle-reschedule dispatcher context ready writers 0)
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 1))))
      ;; FI coordinator quiescente; il ricircolo non deve leggere queste parole.
      (case scenario
        (:corrupt (setf (arcdocdb.scheduler::porta-worker-pool-request port) 4
                        (arcdocdb.scheduler::porta-worker-pool-ack port) 0))
        (:retire (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)))
      (let ((words (lifecycle-words port)))
        (pool-recycle-without-gate
         (lambda ()
           (pool-recycle-check
            dispatcher (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 1)
            :claimed 1)))
        (is (equal words (lifecycle-words port)))
        (pool-dispatch-finish
         (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :b1 :idle)
        (is (equal words (lifecycle-words port))))
      (when (eq scenario :retire)
        (pool-dispatch-check dispatcher nil :inactive 0 :retired)
        (is (equal '(2 2 nil) (lifecycle-words port))))
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-dispatch-finish
       (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-recycle-room-does-not-acknowledge-pending-retire
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable table controllers))
    (pool-recycle-reschedule dispatcher context ready writers 0)
    (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
    (pool-recycle-without-gate (lambda () (pool-recycle-check dispatcher nil :published 1)))
    (is (equal '(2 1 nil) (lifecycle-words port)))
    (is (eq :idle (arcdocdb.execution:stato-worker-writer context)))
    (pool-dispatch-check dispatcher nil :inactive 0 :retired)
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-recycle-binding-refuses-before-transfer
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable controllers))
    (pool-recycle-reschedule dispatcher context ready writers 0)
    (let* ((other (arcdocdb.execution:crea-contesto-worker-writer ready))
           (bad-table (arcdocdb.execution.series::%make-tabella-worker-serie
                       other (arcdocdb.execution.series::tabella-worker-serie-registry table)
                       (arcdocdb.execution.series::tabella-worker-serie-links table)))
           (bad (arcdocdb.scheduler.dispatch::%make-dispatcher-writer-pool port bad-table)))
      (pool-claim-function-fi
       'arcdocdb.execution:ricircola-worker
       (lambda (worker) (declare (ignore worker)) (error \"Trasferimento dopo binding errato.\"))
       (lambda () (pool-recycle-refusal bad port table writers
                                         'invalid-argument :pool-dispatcher-binding)))
      (is (eq :idle (arcdocdb.execution:stato-worker-writer other))))
    (pool-recycle-check dispatcher nil :published 1)
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-recycle-foreign-owner-precedes-binding-and-pool-data
  (let ((worker (lifecycle-fixture-start t)) (dispatcher nil) (table nil) (writers nil)
        (left-file nil) (right-file nil))
    (unwind-protect
         (progn
           (lifecycle-call
            worker
            (lambda (owned)
              (multiple-value-bind (left resource) (pool-claim-series 85)
                (setf left-file resource)
                (multiple-value-bind (right resource) (pool-claim-series 86)
                  (setf right-file resource writers (vector (pool-claim-writer '(:a1 :a2) 0)
                                                           (pool-claim-writer '(:b1) 1))
                        table (arcdocdb.execution.series:crea-tabella-worker-serie
                               (lifecycle-fixture-context owned)
                               (arcdocdb.execution.series:crea-registro-worker-serie
                                writers (vector left right)))
                        dispatcher (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool
                                    (lifecycle-fixture-port owned) table))))
              (pool-recycle-reschedule dispatcher (lifecycle-fixture-context owned)
                                       (pool-claim-ready (lifecycle-fixture-context owned)) writers 0)
              :ok))
           (let* ((port (lifecycle-fixture-port worker))
                  (ready (pool-claim-ready (lifecycle-fixture-context worker)))
                  (other (arcdocdb.execution:crea-contesto-worker-writer ready))
                  (bad-table (arcdocdb.execution.series::%make-tabella-worker-serie
                              other (arcdocdb.execution.series::tabella-worker-serie-registry table)
                              (arcdocdb.execution.series::tabella-worker-serie-links table)))
                  (bad (arcdocdb.scheduler.dispatch::%make-dispatcher-writer-pool port bad-table)))
             (setf (arcdocdb.scheduler::porta-worker-pool-request port) 4)
             (pool-recycle-refusal bad port table writers 'invalid-argument :pool-worker-owner)
             (setf (arcdocdb.scheduler::porta-worker-pool-request port) 1))
           (lifecycle-call
            worker
            (lambda (owned)
              (let ((context (lifecycle-fixture-context owned)))
                (pool-recycle-check dispatcher nil :published 1)
                (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
                (pool-dispatch-finish
                 (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)) :ok)))
      (when left-file
        (lifecycle-call worker (lambda (owned) (declare (ignore owned))
                                 (when right-file (arcdocdb.io:chiudi right-file))
                                 (arcdocdb.io:chiudi left-file) :ok)))
      (lifecycle-fixtures-stop (list worker)))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-recycle-routing-fault-keeps-completed-full-transfer
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :shards 3 :start 1)
    (pool-recycle-reschedule dispatcher context ready writers 2)
    (let* ((unknown (pool-claim-writer '(:unknown) 2))
           (series-before (map 'list #'pool-dispatch-series-image controllers))
           (left-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0)))
           (unknown-before (arcdocdb.execution.tests::handoff-fi-snapshot unknown)))
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 unknown)))
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
      (let ((condition
              (arcdocdb.execution.tests::worker-capture-condition
               (lambda () (arcdocdb.scheduler.dispatch:ricircola-collegamento-pool dispatcher))
               'invariant-violation :worker-serie-routing)))
        (is (eq :faulted (arcdocdb.execution:stato-worker-writer context)))
        (is (eq unknown (arcdocdb.execution:writer-worker-writer context)))
        (is (eq condition (arcdocdb.execution:errore-worker-writer context)))
        (is (= 0 (arcdocdb.execution::contesto-worker-writer-cursor context)))
        (is (= 2 (arcdocdb.execution::contesto-worker-writer-home context)))
        (is (zerop (arcdocdb.execution::contesto-worker-writer-lease context)))
        (is (zerop (arcdocdb.execution::contesto-worker-writer-pending context)))
        (is (equal '(2 1 nil) (lifecycle-words port)))
        (is (equalp series-before (map 'list #'pool-dispatch-series-image controllers)))
        (is (equalp left-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0))))
        (is (equalp unknown-before (arcdocdb.execution.tests::handoff-fi-snapshot unknown)))
        (pool-recycle-refusal dispatcher port table writers 'resource-exhausted :worker-state)
        (is (eq condition (arcdocdb.execution:errore-worker-writer context))))
      ;; Dopo il fault il vecchio A e gia nel ring: nessun rollback dello scambio.
      (multiple-value-bind (writer status next) (arcdocdb.execution:preleva-writer-pronto ready 2)
        (is (eq writer (svref writers 0))) (is (eq status :writer)) (is (zerop next))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-recycle-contradictory-output-refuses-before-routing-without-c3-fault
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable context ready controllers))
    ;; FI quiescente di contratto: combinazioni ammesse dai tipi ma incoerenti.
    (dolist (status '(:claimed :published))
      (pool-claim-function-fi
       'arcdocdb.execution:ricircola-worker
       (lambda (worker) (declare (ignore worker))
         (values (and (eq status :published) (svref writers 0)) status 1))
       (lambda ()
         (pool-claim-function-fi
          'arcdocdb.execution.series:collega-writer-worker-serie
          (lambda (routing) (declare (ignore routing)) (error \"Routing di output contraddittorio.\"))
          (lambda ()
            (pool-recycle-refusal dispatcher port table writers
                                  'invariant-violation :pool-dispatcher-state))))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-recycle-invalid-dispatcher-type-has-no-effects
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable dispatcher context ready controllers))
    (let ((before (pool-dispatch-image port table writers)))
      (signals type-error
        (funcall (fdefinition 'arcdocdb.scheduler.dispatch:ricircola-collegamento-pool) :invalid))
      (is (equalp before (pool-dispatch-image port table writers))))))
")
  (:PATH
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/source-attempt-04.lisp")
   :BYTES 23835 :SHA256 "390fd0c3f0b880846db4116df3b1095960671f9a0e6666b83f801df565a761ef"
   :GIT-BLOB "fab3a2b6748ee3aed81bbd0a8c30b5d728d58b04" :TEXT
   ";;;; Ricircolo pool: un trasferimento ready e routing del solo obbligo CLAIMED.
;;;; OWNER: fixture, porta, dispatcher e bridge sul thread creatore.
;;;; FI quiescenti dichiarate: immagini, binding/parole corrotti e sentinelle ripristinate.
(in-package #:arcdocdb.scheduler.tests)

(defun pool-recycle-check (dispatcher link status count)
  \"Oracolo dei tre valori; count atteso dal caller, mai derivato dal cursore.\"
  (is (equal (list link status count)
             (multiple-value-list
              (arcdocdb.scheduler.dispatch:ricircola-collegamento-pool dispatcher)))))

(defun pool-recycle-reschedule (dispatcher context ready writers home)
  \"A viene acquisito e termina realmente un primo quantum con obbligo RESCHEDULE.\"
  (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready home (svref writers 0))))
  (arcdocdb.execution.tests::worker-check-claim
   context (svref writers 0) :claimed
   (mod (1+ home) (length (arcdocdb.execution::lista-writer-pronti-partitions ready))))
  (pool-dispatch-finish
   (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a1 :schedule)
  (is (eq :reschedule (arcdocdb.execution:stato-worker-writer context))))

(defun pool-recycle-without-gate (thunk)
  \"FI di chiamata: nessun nuovo claim o ACK lifecycle durante un obbligo esistente.\"
  (pool-claim-function-fi
   'arcdocdb.scheduler:prendi-writer-pool
   (lambda (port) (declare (ignore port)) (error \"Nuovo gate durante ricircolo.\"))
   (lambda ()
     (pool-claim-function-fi
      'arcdocdb.scheduler:applica-stato-worker-pool
      (lambda (port) (declare (ignore port)) (error \"ACK pool durante ricircolo.\"))
      thunk))))

(defun pool-recycle-refusal (dispatcher port table writers type reason)
  (pool-dispatch-refusal
   port table writers
   (lambda () (arcdocdb.scheduler.dispatch:ricircola-collegamento-pool dispatcher))
   type reason))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-recycle-room-publishes-once-without-second-claim-or-routing
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :shards 3 :capacity 2 :start 1)
    (pool-recycle-reschedule dispatcher context ready writers 2)
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 (svref writers 1))))
    (let ((series-before (map 'list #'pool-dispatch-series-image controllers))
          (cursor (arcdocdb.execution::contesto-worker-writer-cursor context))
          (home (arcdocdb.execution::contesto-worker-writer-home context))
          (calls 0) (original (fdefinition 'arcdocdb.execution:ricircola-worker)))
      (is (zerop cursor)) (is (= 2 home))
      (pool-recycle-without-gate
       (lambda ()
         (pool-claim-function-fi
          'arcdocdb.execution:ricircola-worker
          (lambda (worker) (incf calls) (funcall original worker))
          (lambda ()
            (pool-claim-function-fi
             'arcdocdb.execution.series:collega-writer-worker-serie
             (lambda (routing) (declare (ignore routing))
               (error \"Routing dopo pubblicazione senza nuovo obbligo.\"))
             (lambda () (pool-recycle-check dispatcher nil :published 2)))))))
      (is (= 1 calls))
      (is (eq :idle (arcdocdb.execution:stato-worker-writer context)))
      (is (null (arcdocdb.execution:writer-worker-writer context)))
      (is (= cursor (arcdocdb.execution::contesto-worker-writer-cursor context)))
      (is (= home (arcdocdb.execution::contesto-worker-writer-home context)))
      (is (equalp series-before (map 'list #'pool-dispatch-series-image controllers)))
      (is (equal '(1 1 nil) (lifecycle-words port))))
    ;; L'oracolo FIFO B poi A e indipendente dagli indici privati del ring.
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 1) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :b1 :idle)
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)
    (is (every (lambda (link) (eq :idle (arcdocdb.execution.series:stato-worker-serie link)))
               (arcdocdb.execution.series::tabella-worker-serie-links table)))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-recycle-full-routes-new-writer-without-begin-or-cursor-change
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :shards 3 :start 1)
    (pool-recycle-reschedule dispatcher context ready writers 2)
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 (svref writers 1))))
    (let* ((links (arcdocdb.execution.series::tabella-worker-serie-links table))
           (right (svref links 1))
           (series-before (map 'list #'pool-dispatch-series-image controllers))
           (left-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0)))
           (right-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 1)))
           (other-before (loop for i below 2 collect
                              (arcdocdb.execution.tests::ready-fi-snapshot
                               (arcdocdb.execution.tests::ready-test-partition ready i))))
           (original (fdefinition 'arcdocdb.execution:ricircola-worker)) (calls 0))
      (pool-recycle-without-gate
       (lambda ()
         (pool-claim-function-fi
          'arcdocdb.execution:ricircola-worker
          (lambda (worker) (incf calls) (funcall original worker))
          (lambda () (pool-recycle-check dispatcher right :claimed 1)))))
      (is (= 1 calls))
      (is (eq (svref writers 1) (arcdocdb.execution:writer-worker-writer context)))
      (is (eq :claimed (arcdocdb.execution:stato-worker-writer context)))
      (is (eq :idle (arcdocdb.execution.series:stato-worker-serie right)))
      (is (= 0 (arcdocdb.execution::contesto-worker-writer-cursor context)))
      (is (= 2 (arcdocdb.execution::contesto-worker-writer-home context)))
      (is (zerop (arcdocdb.execution::contesto-worker-writer-lease context)))
      (is (zerop (arcdocdb.execution::contesto-worker-writer-pending context)))
      (is (equalp series-before (map 'list #'pool-dispatch-series-image controllers)))
      (is (equalp left-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0))))
      (is (equalp right-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 1))))
      (is (equalp other-before (loop for i below 2 collect
                                    (arcdocdb.execution.tests::ready-fi-snapshot
                                     (arcdocdb.execution.tests::ready-test-partition ready i)))))
      (is (equal '(1 1 nil) (lifecycle-words port)))
      (pool-dispatch-finish right :b1 :idle))
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-004-pool-recycle-ready-busy-preserves-complete-obligation-and-ring
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable controllers))
    (pool-recycle-reschedule dispatcher context ready writers 0)
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 1))))
    ;; Vera guardia CAS detenuta dalla fixture; nessun BUSY sintetico.
    (arcdocdb.execution.tests::ready-call-with-guards
     (list (arcdocdb.execution.tests::ready-test-partition ready 0))
     (lambda ()
       (pool-recycle-without-gate
        (lambda () (pool-recycle-refusal dispatcher port table writers
                                          'resource-exhausted :ready-queue-busy)))))
    (pool-recycle-check dispatcher
                        (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 1)
                        :claimed 1)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :b1 :idle)
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-recycle-six-disallowed-phases-preserve-debts-and-first-fault
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable controllers))
    (flet ((refuse () (pool-recycle-refusal dispatcher port table writers
                                             'resource-exhausted :worker-state)))
      (refuse)
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
      (pool-dispatch-check dispatcher
                           (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0)
                           :claimed 0 :unchanged)
      (refuse)
      (let* ((link (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher))
             (token (pool-claim-bridge-begin link)))
        (refuse)
        (let ((batch (pool-claim-bridge-pop link token :a1)))
          (refuse)
          (is (null (arcdocdb.execution.series:conferma-worker-serie link token batch))))
        (lifecycle-queue-busy
         (arcdocdb.execution::writer-programmabile-queue (svref writers 0))
         (lambda ()
           (signals resource-exhausted
             (arcdocdb.execution.series:termina-worker-serie link token) :writer-queue-busy)
           (is (eq :finishing (arcdocdb.execution:stato-worker-writer context)))
           (refuse)))
        (is (eq :schedule (arcdocdb.execution.series:termina-worker-serie link token))))
      (pool-recycle-check dispatcher nil :published 1)
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-dispatch-finish
       (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)
      ;; FI diagnostica quiescente: FAULTED conserva esattamente la prima causa.
      (let ((original (make-condition 'invariant-violation :reason :worker-state)))
        (setf (arcdocdb.execution::contesto-worker-writer-state context) :faulted
              (arcdocdb.execution::contesto-worker-writer-fault context) original)
        (refuse)
        (is (eq original (arcdocdb.execution:errore-worker-writer context)))))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-recycle-existing-obligation-ignores-inactive-and-corrupt-words
  (dolist (scenario '(:inactive :corrupt :retire))
    (with-pool-dispatch (dispatcher port context ready table writers controllers
                                   :active (not (eq scenario :inactive)))
      (declare (ignorable controllers))
      (pool-recycle-reschedule dispatcher context ready writers 0)
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 1))))
      ;; FI coordinator quiescente; il ricircolo non deve leggere queste parole.
      (case scenario
        (:corrupt (setf (arcdocdb.scheduler::porta-worker-pool-request port) 4
                        (arcdocdb.scheduler::porta-worker-pool-ack port) 0))
        (:retire (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)))
      (let ((words (lifecycle-words port)))
        (pool-recycle-without-gate
         (lambda ()
           (pool-recycle-check
            dispatcher (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 1)
            :claimed 1)))
        (is (equal words (lifecycle-words port)))
        (pool-dispatch-finish
         (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :b1 :idle)
        (is (equal words (lifecycle-words port))))
      (when (eq scenario :retire)
        (pool-dispatch-check dispatcher nil :inactive 0 :retired)
        (is (equal '(2 2 nil) (lifecycle-words port))))
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-dispatch-finish
       (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-recycle-room-does-not-acknowledge-pending-retire
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable table controllers))
    (pool-recycle-reschedule dispatcher context ready writers 0)
    (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
    (pool-recycle-without-gate (lambda () (pool-recycle-check dispatcher nil :published 1)))
    (is (equal '(2 1 nil) (lifecycle-words port)))
    (is (eq :idle (arcdocdb.execution:stato-worker-writer context)))
    (pool-dispatch-check dispatcher nil :inactive 0 :retired)
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-recycle-binding-refuses-before-transfer
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable controllers))
    (pool-recycle-reschedule dispatcher context ready writers 0)
    (let* ((other (arcdocdb.execution:crea-contesto-worker-writer ready))
           (bad-table (arcdocdb.execution.series::%make-tabella-worker-serie
                       other (arcdocdb.execution.series::tabella-worker-serie-registry table)
                       (arcdocdb.execution.series::tabella-worker-serie-links table)))
           (bad (arcdocdb.scheduler.dispatch::%make-dispatcher-writer-pool port bad-table)))
      (pool-claim-function-fi
       'arcdocdb.execution:ricircola-worker
       (lambda (worker) (declare (ignore worker)) (error \"Trasferimento dopo binding errato.\"))
       (lambda () (pool-recycle-refusal bad port table writers
                                         'invalid-argument :pool-dispatcher-binding)))
      (is (eq :idle (arcdocdb.execution:stato-worker-writer other))))
    (pool-recycle-check dispatcher nil :published 1)
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-recycle-foreign-owner-precedes-binding-and-pool-data
  (let ((worker (lifecycle-fixture-start t)) (dispatcher nil) (table nil) (writers nil)
        (left-file nil) (right-file nil))
    (unwind-protect
         (progn
           (lifecycle-call
            worker
            (lambda (owned)
              (multiple-value-bind (left resource) (pool-claim-series 85)
                (setf left-file resource)
                (multiple-value-bind (right resource) (pool-claim-series 86)
                  (setf right-file resource writers (vector (pool-claim-writer '(:a1 :a2) 0)
                                                           (pool-claim-writer '(:b1) 1))
                        table (arcdocdb.execution.series:crea-tabella-worker-serie
                               (lifecycle-fixture-context owned)
                               (arcdocdb.execution.series:crea-registro-worker-serie
                                writers (vector left right)))
                        dispatcher (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool
                                    (lifecycle-fixture-port owned) table))))
              (pool-recycle-reschedule dispatcher (lifecycle-fixture-context owned)
                                       (pool-claim-ready (lifecycle-fixture-context owned)) writers 0)
              :ok))
           (let* ((port (lifecycle-fixture-port worker))
                  (ready (pool-claim-ready (lifecycle-fixture-context worker)))
                  (other (arcdocdb.execution:crea-contesto-worker-writer ready))
                  (bad-table (arcdocdb.execution.series::%make-tabella-worker-serie
                              other (arcdocdb.execution.series::tabella-worker-serie-registry table)
                              (arcdocdb.execution.series::tabella-worker-serie-links table)))
                  (bad (arcdocdb.scheduler.dispatch::%make-dispatcher-writer-pool port bad-table)))
             (setf (arcdocdb.scheduler::porta-worker-pool-request port) 4)
             (pool-recycle-refusal bad port table writers 'invalid-argument :pool-worker-owner)
             (setf (arcdocdb.scheduler::porta-worker-pool-request port) 1))
           (lifecycle-call
            worker
            (lambda (owned)
              (let ((context (lifecycle-fixture-context owned)))
                (pool-recycle-check dispatcher nil :published 1)
                (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
                (pool-dispatch-finish
                 (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)) :ok)))
      (when left-file
        (lifecycle-call worker (lambda (owned) (declare (ignore owned))
                                 (when right-file (arcdocdb.io:chiudi right-file))
                                 (arcdocdb.io:chiudi left-file) :ok)))
      (lifecycle-fixtures-stop (list worker)))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-recycle-routing-fault-keeps-completed-full-transfer
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :shards 3 :start 1)
    (pool-recycle-reschedule dispatcher context ready writers 2)
    (let* ((unknown (pool-claim-writer '(:unknown) 2))
           (series-before (map 'list #'pool-dispatch-series-image controllers))
           (left-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0)))
           (unknown-before (arcdocdb.execution.tests::handoff-fi-snapshot unknown)))
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 unknown)))
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
      (let ((condition
              (arcdocdb.execution.tests::worker-capture-condition
               (lambda () (arcdocdb.scheduler.dispatch:ricircola-collegamento-pool dispatcher))
               'invariant-violation :worker-serie-routing)))
        (is (eq :faulted (arcdocdb.execution:stato-worker-writer context)))
        (is (eq unknown (arcdocdb.execution:writer-worker-writer context)))
        (is (eq condition (arcdocdb.execution:errore-worker-writer context)))
        (is (= 0 (arcdocdb.execution::contesto-worker-writer-cursor context)))
        (is (= 2 (arcdocdb.execution::contesto-worker-writer-home context)))
        (is (zerop (arcdocdb.execution::contesto-worker-writer-lease context)))
        (is (zerop (arcdocdb.execution::contesto-worker-writer-pending context)))
        (is (equal '(2 1 nil) (lifecycle-words port)))
        (is (equalp series-before (map 'list #'pool-dispatch-series-image controllers)))
        (is (equalp left-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0))))
        (is (equalp unknown-before (arcdocdb.execution.tests::handoff-fi-snapshot unknown)))
        (pool-recycle-refusal dispatcher port table writers 'resource-exhausted :worker-state)
        (is (eq condition (arcdocdb.execution:errore-worker-writer context))))
      ;; Dopo il fault il vecchio A e gia nel ring: nessun rollback dello scambio.
      (multiple-value-bind (writer status next) (arcdocdb.execution:preleva-writer-pronto ready 2)
        (is (eq writer (svref writers 0))) (is (eq status :writer)) (is (zerop next))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-recycle-contradictory-output-refuses-before-routing-without-c3-fault
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable context ready controllers))
    ;; FI quiescente di contratto: combinazioni ammesse dai tipi ma incoerenti.
    (dolist (status '(:claimed :published))
      (pool-claim-function-fi
       'arcdocdb.execution:ricircola-worker
       (lambda (worker) (declare (ignore worker))
         (values (and (eq status :published) (svref writers 0)) status 1))
       (lambda ()
         (pool-claim-function-fi
          'arcdocdb.execution.series:collega-writer-worker-serie
          (lambda (routing) (declare (ignore routing)) (error \"Routing di output contraddittorio.\"))
          (lambda ()
            (pool-recycle-refusal dispatcher port table writers
                                  'invariant-violation :pool-dispatcher-state))))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-recycle-invalid-dispatcher-type-has-no-effects
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable dispatcher context ready controllers))
    (let ((before (pool-dispatch-image port table writers)))
      (signals type-error
        (funcall (fdefinition 'arcdocdb.scheduler.dispatch:ricircola-collegamento-pool) :invalid))
      (is (equalp before (pool-dispatch-image port table writers))))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-004-pool-recycle-ready-invariant-preserves-original-c1-fault
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (pool-recycle-reschedule dispatcher context ready writers 0)
    (let ((partition (arcdocdb.execution.tests::ready-test-partition ready 0)))
      ;; FI quiescente: indice fuori capienza ma dentro il tipo INDEX dello slot.
      ;; Il verificatore C1 sotto guard reale deve produrre la causa originale.
      (setf (arcdocdb.execution::partizione-pronta-head partition) 1)
      (let ((ring-before (arcdocdb.execution.tests::ready-fi-snapshot partition))
            (writer-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0)))
            (series-before (map 'list #'pool-dispatch-series-image controllers))
            (links-before (map 'list #'pool-dispatch-link-image
                               (arcdocdb.execution.series::tabella-worker-serie-links table))))
        (let ((condition
                (arcdocdb.execution.tests::worker-capture-condition
                 (lambda () (arcdocdb.scheduler.dispatch:ricircola-collegamento-pool dispatcher))
                 'invariant-violation :ready-queue-invariant)))
          (is (eq :faulted (arcdocdb.execution:stato-worker-writer context)))
          (is (eq condition (arcdocdb.execution:errore-worker-writer context)))
          (is (eq (svref writers 0) (arcdocdb.execution:writer-worker-writer context)))
          (is (zerop (arcdocdb.execution::contesto-worker-writer-lease context)))
          (is (zerop (arcdocdb.execution::contesto-worker-writer-pending context)))
          (is (equal '(1 1 nil) (lifecycle-words port)))
          (is (equalp ring-before (arcdocdb.execution.tests::ready-fi-snapshot partition)))
          (is (equalp writer-before
                      (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0))))
          (is (equalp series-before (map 'list #'pool-dispatch-series-image controllers)))
          (is (equalp links-before (map 'list #'pool-dispatch-link-image
                                       (arcdocdb.execution.series::tabella-worker-serie-links table))))
          (pool-recycle-refusal dispatcher port table writers 'resource-exhausted :worker-state)
          (is (eq condition (arcdocdb.execution:errore-worker-writer context))))))))
")
  (:PATH
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/source-attempt-05.lisp")
   :BYTES 25923 :SHA256 "079a58b0c8850df0be62c71229e25d052fb716f36f1996e9e8ab2c4c2a38fa86"
   :GIT-BLOB "3c779589cd7df6ae1146c2ca50b70320093bbf4a" :TEXT
   ";;;; Ricircolo pool: un trasferimento ready e routing del solo obbligo CLAIMED.
;;;; OWNER: fixture, porta, dispatcher e bridge sul thread creatore.
;;;; FI quiescenti dichiarate: immagini, binding/parole corrotti e sentinelle ripristinate.
(in-package #:arcdocdb.scheduler.tests)

(defun pool-recycle-check (dispatcher link status count)
  \"Oracolo dei tre valori; count atteso dal caller, mai derivato dal cursore.\"
  (is (equal (list link status count)
             (multiple-value-list
              (arcdocdb.scheduler.dispatch:ricircola-collegamento-pool dispatcher)))))

(defun pool-recycle-reschedule (dispatcher context ready writers home)
  \"A viene acquisito e termina realmente un primo quantum con obbligo RESCHEDULE.\"
  (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready home (svref writers 0))))
  (arcdocdb.execution.tests::worker-check-claim
   context (svref writers 0) :claimed
   (mod (1+ home) (length (arcdocdb.execution::lista-writer-pronti-partitions ready))))
  (pool-dispatch-finish
   (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a1 :schedule)
  (is (eq :reschedule (arcdocdb.execution:stato-worker-writer context))))

(defun pool-recycle-without-gate (thunk)
  \"FI di chiamata: nessun nuovo claim o ACK lifecycle durante un obbligo esistente.\"
  (pool-claim-function-fi
   'arcdocdb.scheduler:prendi-writer-pool
   (lambda (port) (declare (ignore port)) (error \"Nuovo gate durante ricircolo.\"))
   (lambda ()
     (pool-claim-function-fi
      'arcdocdb.scheduler:applica-stato-worker-pool
      (lambda (port) (declare (ignore port)) (error \"ACK pool durante ricircolo.\"))
      thunk))))

(defun pool-recycle-refusal (dispatcher port table writers type reason)
  (pool-dispatch-refusal
   port table writers
   (lambda () (arcdocdb.scheduler.dispatch:ricircola-collegamento-pool dispatcher))
   type reason))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-recycle-room-publishes-once-without-second-claim-or-routing
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :shards 3 :capacity 2 :start 1)
    (pool-recycle-reschedule dispatcher context ready writers 2)
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 (svref writers 1))))
    (let ((series-before (map 'list #'pool-dispatch-series-image controllers))
          (cursor (arcdocdb.execution::contesto-worker-writer-cursor context))
          (home (arcdocdb.execution::contesto-worker-writer-home context))
          (calls 0) (original (fdefinition 'arcdocdb.execution:ricircola-worker)))
      (is (zerop cursor)) (is (= 2 home))
      (pool-recycle-without-gate
       (lambda ()
         (pool-claim-function-fi
          'arcdocdb.execution:ricircola-worker
          (lambda (worker) (incf calls) (funcall original worker))
          (lambda ()
            (pool-claim-function-fi
             'arcdocdb.execution.series:collega-writer-worker-serie
             (lambda (routing) (declare (ignore routing))
               (error \"Routing dopo pubblicazione senza nuovo obbligo.\"))
             (lambda () (pool-recycle-check dispatcher nil :published 2)))))))
      (is (= 1 calls))
      (is (eq :idle (arcdocdb.execution:stato-worker-writer context)))
      (is (null (arcdocdb.execution:writer-worker-writer context)))
      (is (= cursor (arcdocdb.execution::contesto-worker-writer-cursor context)))
      (is (= home (arcdocdb.execution::contesto-worker-writer-home context)))
      (is (equalp series-before (map 'list #'pool-dispatch-series-image controllers)))
      (is (equal '(1 1 nil) (lifecycle-words port))))
    ;; L'oracolo FIFO B poi A e indipendente dagli indici privati del ring.
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 1) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :b1 :idle)
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)
    (is (every (lambda (link) (eq :idle (arcdocdb.execution.series:stato-worker-serie link)))
               (arcdocdb.execution.series::tabella-worker-serie-links table)))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-recycle-full-routes-new-writer-without-begin-or-cursor-change
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :shards 3 :start 1)
    (pool-recycle-reschedule dispatcher context ready writers 2)
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 (svref writers 1))))
    (let* ((links (arcdocdb.execution.series::tabella-worker-serie-links table))
           (right (svref links 1))
           (series-before (map 'list #'pool-dispatch-series-image controllers))
           (left-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0)))
           (right-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 1)))
           (other-before (loop for i below 2 collect
                              (arcdocdb.execution.tests::ready-fi-snapshot
                               (arcdocdb.execution.tests::ready-test-partition ready i))))
           (original (fdefinition 'arcdocdb.execution:ricircola-worker)) (calls 0))
      (pool-recycle-without-gate
       (lambda ()
         (pool-claim-function-fi
          'arcdocdb.execution:ricircola-worker
          (lambda (worker) (incf calls) (funcall original worker))
          (lambda () (pool-recycle-check dispatcher right :claimed 1)))))
      (is (= 1 calls))
      (is (eq (svref writers 1) (arcdocdb.execution:writer-worker-writer context)))
      (is (eq :claimed (arcdocdb.execution:stato-worker-writer context)))
      (is (eq :idle (arcdocdb.execution.series:stato-worker-serie right)))
      (is (= 0 (arcdocdb.execution::contesto-worker-writer-cursor context)))
      (is (= 2 (arcdocdb.execution::contesto-worker-writer-home context)))
      (is (zerop (arcdocdb.execution::contesto-worker-writer-lease context)))
      (is (zerop (arcdocdb.execution::contesto-worker-writer-pending context)))
      (is (equalp series-before (map 'list #'pool-dispatch-series-image controllers)))
      (is (equalp left-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0))))
      (is (equalp right-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 1))))
      (is (equalp other-before (loop for i below 2 collect
                                    (arcdocdb.execution.tests::ready-fi-snapshot
                                     (arcdocdb.execution.tests::ready-test-partition ready i)))))
      (is (equal '(1 1 nil) (lifecycle-words port)))
      (pool-dispatch-finish right :b1 :idle))
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-004-pool-recycle-ready-busy-preserves-complete-obligation-and-ring
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable controllers))
    (pool-recycle-reschedule dispatcher context ready writers 0)
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 1))))
    ;; Vera guardia CAS detenuta dalla fixture; nessun BUSY sintetico.
    (arcdocdb.execution.tests::ready-call-with-guards
     (list (arcdocdb.execution.tests::ready-test-partition ready 0))
     (lambda ()
       (pool-recycle-without-gate
        (lambda () (pool-recycle-refusal dispatcher port table writers
                                          'resource-exhausted :ready-queue-busy)))))
    (pool-recycle-check dispatcher
                        (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 1)
                        :claimed 1)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :b1 :idle)
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-recycle-six-disallowed-phases-preserve-debts-and-first-fault
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable controllers))
    (flet ((refuse () (pool-recycle-refusal dispatcher port table writers
                                             'resource-exhausted :worker-state)))
      (refuse)
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
      (pool-dispatch-check dispatcher
                           (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0)
                           :claimed 0 :unchanged)
      (refuse)
      (let* ((link (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher))
             (token (pool-claim-bridge-begin link)))
        (refuse)
        (let ((batch (pool-claim-bridge-pop link token :a1)))
          (refuse)
          (is (null (arcdocdb.execution.series:conferma-worker-serie link token batch))))
        (lifecycle-queue-busy
         (arcdocdb.execution::writer-programmabile-queue (svref writers 0))
         (lambda ()
           (signals resource-exhausted
             (arcdocdb.execution.series:termina-worker-serie link token) :writer-queue-busy)
           (is (eq :finishing (arcdocdb.execution:stato-worker-writer context)))
           (refuse)))
        (is (eq :schedule (arcdocdb.execution.series:termina-worker-serie link token))))
      (pool-recycle-check dispatcher nil :published 1)
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-dispatch-finish
       (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)
      ;; FI diagnostica quiescente: FAULTED conserva esattamente la prima causa.
      (let ((original (make-condition 'invariant-violation :reason :worker-state)))
        (setf (arcdocdb.execution::contesto-worker-writer-state context) :faulted
              (arcdocdb.execution::contesto-worker-writer-fault context) original)
        (refuse)
        (is (eq original (arcdocdb.execution:errore-worker-writer context)))))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-recycle-existing-obligation-ignores-inactive-and-corrupt-words
  (dolist (scenario '(:inactive :corrupt :retire))
    (with-pool-dispatch (dispatcher port context ready table writers controllers
                                   :active (not (eq scenario :inactive)))
      (declare (ignorable controllers))
      (pool-recycle-reschedule dispatcher context ready writers 0)
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 1))))
      ;; FI coordinator quiescente; il ricircolo non deve leggere queste parole.
      (case scenario
        (:corrupt (setf (arcdocdb.scheduler::porta-worker-pool-request port) 4
                        (arcdocdb.scheduler::porta-worker-pool-ack port) 0))
        (:retire (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)))
      (let ((words (lifecycle-words port)))
        (pool-recycle-without-gate
         (lambda ()
           (pool-recycle-check
            dispatcher (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 1)
            :claimed 1)))
        (is (equal words (lifecycle-words port)))
        (pool-dispatch-finish
         (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :b1 :idle)
        (is (equal words (lifecycle-words port))))
      (when (eq scenario :retire)
        (pool-dispatch-check dispatcher nil :inactive 0 :retired)
        (is (equal '(2 2 nil) (lifecycle-words port))))
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-dispatch-finish
       (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-recycle-room-does-not-acknowledge-pending-retire
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable table controllers))
    (pool-recycle-reschedule dispatcher context ready writers 0)
    (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
    (pool-recycle-without-gate (lambda () (pool-recycle-check dispatcher nil :published 1)))
    (is (equal '(2 1 nil) (lifecycle-words port)))
    (is (eq :idle (arcdocdb.execution:stato-worker-writer context)))
    (pool-dispatch-check dispatcher nil :inactive 0 :retired)
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-recycle-binding-refuses-before-transfer
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable controllers))
    (pool-recycle-reschedule dispatcher context ready writers 0)
    (let* ((other (arcdocdb.execution:crea-contesto-worker-writer ready))
           (bad-table (arcdocdb.execution.series::%make-tabella-worker-serie
                       other (arcdocdb.execution.series::tabella-worker-serie-registry table)
                       (arcdocdb.execution.series::tabella-worker-serie-links table)))
           (bad (arcdocdb.scheduler.dispatch::%make-dispatcher-writer-pool port bad-table)))
      (pool-claim-function-fi
       'arcdocdb.execution:ricircola-worker
       (lambda (worker) (declare (ignore worker)) (error \"Trasferimento dopo binding errato.\"))
       (lambda () (pool-recycle-refusal bad port table writers
                                         'invalid-argument :pool-dispatcher-binding)))
      (is (eq :idle (arcdocdb.execution:stato-worker-writer other))))
    (pool-recycle-check dispatcher nil :published 1)
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-recycle-foreign-owner-precedes-binding-and-pool-data
  (let ((worker (lifecycle-fixture-start t)) (dispatcher nil) (table nil) (writers nil)
        (left-file nil) (right-file nil))
    (unwind-protect
         (progn
           (lifecycle-call
            worker
            (lambda (owned)
              (multiple-value-bind (left resource) (pool-claim-series 85)
                (setf left-file resource)
                (multiple-value-bind (right resource) (pool-claim-series 86)
                  (setf right-file resource writers (vector (pool-claim-writer '(:a1 :a2) 0)
                                                           (pool-claim-writer '(:b1) 1))
                        table (arcdocdb.execution.series:crea-tabella-worker-serie
                               (lifecycle-fixture-context owned)
                               (arcdocdb.execution.series:crea-registro-worker-serie
                                writers (vector left right)))
                        dispatcher (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool
                                    (lifecycle-fixture-port owned) table))))
              (pool-recycle-reschedule dispatcher (lifecycle-fixture-context owned)
                                       (pool-claim-ready (lifecycle-fixture-context owned)) writers 0)
              :ok))
           (let* ((port (lifecycle-fixture-port worker))
                  (ready (pool-claim-ready (lifecycle-fixture-context worker)))
                  (other (arcdocdb.execution:crea-contesto-worker-writer ready))
                  (bad-table (arcdocdb.execution.series::%make-tabella-worker-serie
                              other (arcdocdb.execution.series::tabella-worker-serie-registry table)
                              (arcdocdb.execution.series::tabella-worker-serie-links table)))
                  (bad (arcdocdb.scheduler.dispatch::%make-dispatcher-writer-pool port bad-table)))
             (setf (arcdocdb.scheduler::porta-worker-pool-request port) 4)
             (pool-recycle-refusal bad port table writers 'invalid-argument :pool-worker-owner)
             (setf (arcdocdb.scheduler::porta-worker-pool-request port) 1))
           (lifecycle-call
            worker
            (lambda (owned)
              (let ((context (lifecycle-fixture-context owned)))
                (pool-recycle-check dispatcher nil :published 1)
                (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
                (pool-dispatch-finish
                 (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)) :ok)))
      (when left-file
        (lifecycle-call worker (lambda (owned) (declare (ignore owned))
                                 (when right-file (arcdocdb.io:chiudi right-file))
                                 (arcdocdb.io:chiudi left-file) :ok)))
      (lifecycle-fixtures-stop (list worker)))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-recycle-routing-fault-keeps-completed-full-transfer
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :shards 3 :start 1)
    (pool-recycle-reschedule dispatcher context ready writers 2)
    (let* ((unknown (pool-claim-writer '(:unknown) 2))
           (series-before (map 'list #'pool-dispatch-series-image controllers))
           (left-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0)))
           (unknown-before (arcdocdb.execution.tests::handoff-fi-snapshot unknown)))
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 unknown)))
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
      (let ((condition
              (arcdocdb.execution.tests::worker-capture-condition
               (lambda () (arcdocdb.scheduler.dispatch:ricircola-collegamento-pool dispatcher))
               'invariant-violation :worker-serie-routing)))
        (is (eq :faulted (arcdocdb.execution:stato-worker-writer context)))
        (is (eq unknown (arcdocdb.execution:writer-worker-writer context)))
        (is (eq condition (arcdocdb.execution:errore-worker-writer context)))
        (is (= 0 (arcdocdb.execution::contesto-worker-writer-cursor context)))
        (is (= 2 (arcdocdb.execution::contesto-worker-writer-home context)))
        (is (zerop (arcdocdb.execution::contesto-worker-writer-lease context)))
        (is (zerop (arcdocdb.execution::contesto-worker-writer-pending context)))
        (is (equal '(2 1 nil) (lifecycle-words port)))
        (is (equalp series-before (map 'list #'pool-dispatch-series-image controllers)))
        (is (equalp left-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0))))
        (is (equalp unknown-before (arcdocdb.execution.tests::handoff-fi-snapshot unknown)))
        (pool-recycle-refusal dispatcher port table writers 'resource-exhausted :worker-state)
        (is (eq condition (arcdocdb.execution:errore-worker-writer context))))
      ;; Dopo il fault il vecchio A e gia nel ring: nessun rollback dello scambio.
      (multiple-value-bind (writer status next) (arcdocdb.execution:preleva-writer-pronto ready 2)
        (is (eq writer (svref writers 0))) (is (eq status :writer)) (is (zerop next))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-recycle-contradictory-output-refuses-before-routing-without-c3-fault
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable context ready controllers))
    ;; FI quiescente di contratto: combinazioni ammesse dai tipi ma incoerenti.
    (dolist (status '(:claimed :published))
      (pool-claim-function-fi
       'arcdocdb.execution:ricircola-worker
       (lambda (worker) (declare (ignore worker))
         (values (and (eq status :published) (svref writers 0)) status 1))
       (lambda ()
         (pool-claim-function-fi
          'arcdocdb.execution.series:collega-writer-worker-serie
          (lambda (routing) (declare (ignore routing)) (error \"Routing di output contraddittorio.\"))
          (lambda ()
            (pool-recycle-refusal dispatcher port table writers
                                  'invariant-violation :pool-dispatcher-state))))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-recycle-invalid-dispatcher-type-has-no-effects
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable dispatcher context ready controllers))
    (let ((before (pool-dispatch-image port table writers)))
      (signals type-error
        (funcall (fdefinition 'arcdocdb.scheduler.dispatch:ricircola-collegamento-pool) :invalid))
      (is (equalp before (pool-dispatch-image port table writers))))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-004-pool-recycle-ready-invariant-preserves-original-c1-fault
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (pool-recycle-reschedule dispatcher context ready writers 0)
    (let ((partition (arcdocdb.execution.tests::ready-test-partition ready 0)))
      ;; FI quiescente: indice fuori capienza ma dentro il tipo INDEX dello slot.
      ;; Il verificatore C1 sotto guard reale deve produrre la causa originale.
      (setf (arcdocdb.execution::partizione-pronta-head partition) 1)
      (let ((ring-before (arcdocdb.execution.tests::ready-fi-snapshot partition))
            (writer-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0)))
            (series-before (map 'list #'pool-dispatch-series-image controllers))
            (links-before (map 'list #'pool-dispatch-link-image
                               (arcdocdb.execution.series::tabella-worker-serie-links table))))
        (let ((condition
                (arcdocdb.execution.tests::worker-capture-condition
                 (lambda () (arcdocdb.scheduler.dispatch:ricircola-collegamento-pool dispatcher))
                 'invariant-violation :ready-queue-invariant)))
          (is (eq :faulted (arcdocdb.execution:stato-worker-writer context)))
          (is (eq condition (arcdocdb.execution:errore-worker-writer context)))
          (is (eq (svref writers 0) (arcdocdb.execution:writer-worker-writer context)))
          (is (zerop (arcdocdb.execution::contesto-worker-writer-lease context)))
          (is (zerop (arcdocdb.execution::contesto-worker-writer-pending context)))
          (is (equal '(1 1 nil) (lifecycle-words port)))
          (is (equalp ring-before (arcdocdb.execution.tests::ready-fi-snapshot partition)))
          (is (equalp writer-before
                      (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0))))
          (is (equalp series-before (map 'list #'pool-dispatch-series-image controllers)))
          (is (equalp links-before (map 'list #'pool-dispatch-link-image
                                       (arcdocdb.execution.series::tabella-worker-serie-links table))))
          (pool-recycle-refusal dispatcher port table writers 'resource-exhausted :worker-state)
          (is (eq condition (arcdocdb.execution:errore-worker-writer context))))))))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-004-pool-recycle-unknown-status-refuses-at-runtime-without-effects
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable controllers))
    (pool-recycle-reschedule dispatcher context ready writers 0)
    ;; FI quiescente oltre la ftype C1: l'helper NOTINLINE accetta T e mantiene
    ;; il controllo runtime che il compilatore eliminava dal precedente CASE.
    ;; Nessun falso rifiuto di tipo viene scambiato per invariant di prodotto.
    (labels ((reject-status (status)
               (let ((calls 0))
                 (pool-claim-function-fi
                  'arcdocdb.execution:ricircola-worker
                  (lambda (worker) (declare (ignore worker))
                    (incf calls) (values nil status 1))
                  (lambda ()
                    (pool-claim-function-fi
                     'arcdocdb.execution.series:collega-writer-worker-serie
                     (lambda (routing) (declare (ignore routing))
                       (error \"Routing dopo status sconosciuto.\"))
                     (lambda ()
                       (pool-recycle-without-gate
                        (lambda ()
                          (pool-recycle-refusal dispatcher port table writers
                                                'invariant-violation :pool-dispatcher-state)))))))
                 (is (= 1 calls)))))
      (dolist (status (list :unknown nil 0 \"invalid\" '(invalid) #()))
        (reject-status status))
      ;; FI diagnostica indipendente: nemmeno una causa gia presente e sostituita
      ;; da questo errore C3. Il delegato FI non esegue il confine C1 FAULTED.
      (let ((original (make-condition 'invariant-violation :reason :worker-state)))
        (setf (arcdocdb.execution::contesto-worker-writer-state context) :faulted
              (arcdocdb.execution::contesto-worker-writer-fault context) original)
        (reject-status :unknown)
        (is (eq original (arcdocdb.execution:errore-worker-writer context)))))))
")
  (:PATH
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/unknown-status-probe-attempt-01.lisp")
   :BYTES 760 :SHA256 "467cdc1a64f3f25cb9d978ae0a30594724cbe969de3e269d5e4a8d961fa4c7c9" :GIT-BLOB
   "5800110c2dcb22ed9054291774c8719141b37959" :TEXT
   "(load \"spikes/out/pool-recycle-tests/scoped.lisp\")
(in-package #:arcdocdb.scheduler.tests)
(with-pool-dispatch (dispatcher port context ready table writers controllers)
  (declare (ignorable port context ready table writers controllers))
  (pool-claim-function-fi
   'arcdocdb.execution:ricircola-worker
   (lambda (worker) (declare (ignore worker)) (values nil :unknown 1))
   (lambda ()
     (handler-case (arcdocdb.scheduler.dispatch:ricircola-collegamento-pool dispatcher)
       (error (condition)
         (format t \"Unknown status actual condition: ~S, reason ~S~%\"
                 (type-of condition)
                 (and (typep condition 'arcdocdb.conditions:arcdocdb-error)
                      (arcdocdb.conditions:error-reason condition))))))))
")
  (:PATH
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/unknown-status-probe-attempt-01.log")
   :BYTES 957 :SHA256 "6c2497cd9d147614f3c0b2f7159aa804779bb364c57a26bcb0bd5399dae18bc0" :GIT-BLOB
   "228fc8409b4bb4e38a96d0f3b0df946b2674cdce" :TEXT
   "ok    TEST-REQ-CON-002-POOL-RECYCLE-ROOM-PUBLISHES-ONCE-WITHOUT-SECOND-CLAIM-OR-ROUTING
ok    TEST-REQ-CON-002-POOL-RECYCLE-FULL-ROUTES-NEW-WRITER-WITHOUT-BEGIN-OR-CURSOR-CHANGE
ok    TEST-REQ-CON-004-POOL-RECYCLE-READY-BUSY-PRESERVES-COMPLETE-OBLIGATION-AND-RING
ok    TEST-REQ-CON-005-POOL-RECYCLE-SIX-DISALLOWED-PHASES-PRESERVE-DEBTS-AND-FIRST-FAULT
ok    TEST-REQ-CON-002-POOL-RECYCLE-EXISTING-OBLIGATION-IGNORES-INACTIVE-AND-CORRUPT-WORDS
ok    TEST-REQ-CON-002-POOL-RECYCLE-ROOM-DOES-NOT-ACKNOWLEDGE-PENDING-RETIRE
ok    TEST-REQ-AFF-008-POOL-RECYCLE-BINDING-REFUSES-BEFORE-TRANSFER
ok    TEST-REQ-CON-005-POOL-RECYCLE-FOREIGN-OWNER-PRECEDES-BINDING-AND-POOL-DATA
ok    TEST-REQ-AFF-008-POOL-RECYCLE-ROUTING-FAULT-KEEPS-COMPLETED-FULL-TRANSFER
ok    TEST-REQ-AFF-008-POOL-RECYCLE-CONTRADICTORY-OUTPUT-REFUSES-BEFORE-ROUTING-WITHOUT-C3-FAULT
ok    TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS
11 test scoped ricircolo superati.
")
  (:PATH
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/unknown-status-probe-attempt-02.log")
   :BYTES 1004 :SHA256 "c1c268e860f2bc8e80ce58d1eaa44a5dc7c13dbc2823aa2b6f107dd388f2dd5a" :GIT-BLOB
   "c80f075f5fb26d61a599a287cc43d9efc4561003" :TEXT
   "ok    TEST-REQ-CON-002-POOL-RECYCLE-ROOM-PUBLISHES-ONCE-WITHOUT-SECOND-CLAIM-OR-ROUTING
ok    TEST-REQ-CON-002-POOL-RECYCLE-FULL-ROUTES-NEW-WRITER-WITHOUT-BEGIN-OR-CURSOR-CHANGE
ok    TEST-REQ-CON-004-POOL-RECYCLE-READY-BUSY-PRESERVES-COMPLETE-OBLIGATION-AND-RING
ok    TEST-REQ-CON-005-POOL-RECYCLE-SIX-DISALLOWED-PHASES-PRESERVE-DEBTS-AND-FIRST-FAULT
ok    TEST-REQ-CON-002-POOL-RECYCLE-EXISTING-OBLIGATION-IGNORES-INACTIVE-AND-CORRUPT-WORDS
ok    TEST-REQ-CON-002-POOL-RECYCLE-ROOM-DOES-NOT-ACKNOWLEDGE-PENDING-RETIRE
ok    TEST-REQ-AFF-008-POOL-RECYCLE-BINDING-REFUSES-BEFORE-TRANSFER
ok    TEST-REQ-CON-005-POOL-RECYCLE-FOREIGN-OWNER-PRECEDES-BINDING-AND-POOL-DATA
ok    TEST-REQ-AFF-008-POOL-RECYCLE-ROUTING-FAULT-KEEPS-COMPLETED-FULL-TRANSFER
ok    TEST-REQ-AFF-008-POOL-RECYCLE-CONTRADICTORY-OUTPUT-REFUSES-BEFORE-ROUTING-WITHOUT-C3-FAULT
ok    TEST-REQ-AFF-008-POOL-RECYCLE-INVALID-DISPATCHER-TYPE-HAS-NO-EFFECTS
11 test scoped ricircolo superati.
Unknown status actual values: (NIL :UNKNOWN 1)
")
  (:PATH
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-recycle-tests/unknown-status-probe.lisp")
   :BYTES 830 :SHA256 "f842de0db47887f816641d8fb969642a6102cc096e8d8b537a0d11e61fd9b18a" :GIT-BLOB
   "ee0ff2922dc26eaf232d6394477387b14f2bb930" :TEXT
   "(load \"spikes/out/pool-recycle-tests/scoped.lisp\")
(in-package #:arcdocdb.scheduler.tests)
(with-pool-dispatch (dispatcher port context ready table writers controllers)
  (declare (ignorable port context ready table writers controllers))
  (pool-claim-function-fi
   'arcdocdb.execution:ricircola-worker
   (lambda (worker) (declare (ignore worker)) (values nil :unknown 1))
   (lambda ()
     (handler-case (format t \"Unknown status actual values: ~S~%\" (multiple-value-list (arcdocdb.scheduler.dispatch:ricircola-collegamento-pool dispatcher)))
       (error (condition)
         (format t \"Unknown status actual condition: ~S, reason ~S~%\"
                 (type-of condition)
                 (and (typep condition 'arcdocdb.conditions:arcdocdb-error)
                      (arcdocdb.conditions:error-reason condition))))))))
")
  (:PATH
   #A((108) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/pool-recycle-fullcheck-attempt-01.log")
   :BYTES 140 :SHA256 "46d60e83ac34ea0b20f65e8ac307b32d45204f0e7df0eb2deefb0fcf3966e7bd" :GIT-BLOB
   "72ce20c7dc85c05b3b310f01665befa569694c0c" :TEXT
   ":OK: make check-core; record: /private/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/4000984350-command-38940-0/report.lisp
")
  (:PATH
   #A((120) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/pool-recycle-measure/bench-attempt-01/report.lisp")
   :BYTES 78742 :SHA256 "3d5c04788eba55e7c14f63293d6415d2212a4cd2655a9e689ffeb1274bf1abdb"
   :GIT-BLOB "a2c91369dda4fd75bdae9ba422c65f0f3c6bd5a2" :TEXT
   "(:SCHEMA-VERSION 1 :KIND :POOL-RECYCLE-BENCHMARK :STATUS :OK :STAGE :COMPLETE
 :DIAGNOSTIC NIL :PROCESS-ARGV
 (#A((48) BASE-CHAR . \"/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl\")
  #A((7) BASE-CHAR . \"--bench\")
  #A((49) BASE-CHAR . \"spikes/out/pool-recycle-measure/bench-attempt-01/\"))
 :TOOL-ARGUMENTS
 (#A((7) BASE-CHAR . \"--bench\")
  #A((49) BASE-CHAR . \"spikes/out/pool-recycle-measure/bench-attempt-01/\"))
 :SOURCE-FINGERPRINTS-BEFORE
 ((:FILE \"arcdocdb.asd\" :MD5
   #A((32) BASE-CHAR . \"eef14ae2d95854c867d15d35f3435c18\"))
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
  (:FILE \"src/codec/cbor-array-input.lisp\" :MD5
   #A((32) BASE-CHAR . \"560fa1b10432d16edb830014e95ea4dc\"))
  (:FILE \"src/codec/cbor-array-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"0429206ab6069f053c66da4c56439cfb\"))
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
   #A((32) BASE-CHAR . \"4656fe55c934e9eaca3db8c72d76f1cd\"))
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
   #A((32) BASE-CHAR . \"36674625e81b78e3b97ab7068dfff88a\"))
  (:FILE \"src/control/preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"2dfc2b76c1d3c382db8b50071bdaeadf\"))
  (:FILE \"src/control/prepare.lisp\" :MD5
   #A((32) BASE-CHAR . \"c2667a324b14b2547bee2c8016e6d6c1\"))
  (:FILE \"src/control/publication-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"0e2492b2c97e8d3f7692668f5e09b44f\"))
  (:FILE \"src/control/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"93ce63e1bd43f2e64dc3f233035f0a94\"))
  (:FILE \"src/control/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"468fcf430eede17a38b922dfd373a746\"))
  (:FILE \"src/control/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f525c21d06bf7abb9ee7c4eab9ac380e\"))
  (:FILE \"src/csn/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1130012fc5613a5648d22ed8628be0e8\"))
  (:FILE \"src/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1cdb5661fc54beba5bf00e4765f3235\"))
  (:FILE \"src/dispatch/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"ba4cd961094f37a157d49b8d7024b677\"))
  (:FILE \"src/dispatch/claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"b10caeff4f726c0ebd01e2c6d1baacba\"))
  (:FILE \"src/dispatch/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1528cc1a6fc7b5a2e0900c29dc090f92\"))
  (:FILE \"src/dispatch/recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"c3e120f7a7faba59ffb52e8dc0de96d6\"))
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
   #A((32) BASE-CHAR . \"fc1cbc7b30e0d74c359e9ee1bbd201ec\"))
  (:FILE \"src/io/namespace.lisp\" :MD5
   #A((32) BASE-CHAR . \"8898b56d45e22212f1db37f208230f34\"))
  (:FILE \"src/io/native-namespace.lisp\" :MD5
   #A((32) BASE-CHAR . \"4c0c79a243bd691d3a602afd89b77980\"))
  (:FILE \"src/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"58030bc0c811248a6537e2909d8762d6\"))
  (:FILE \"src/io/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d5458684a1b169bacc46bc87fdaffed4\"))
  (:FILE \"src/io/rename.lisp\" :MD5
   #A((32) BASE-CHAR . \"40a1415771121f68afaa5165a0c23465\"))
  (:FILE \"src/io/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"2f8bd851d09ab994d8d01b231697d1a1\"))
  (:FILE \"src/io/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"ec3e94e0eb6b3c0c6ce2bb091af42e2e\"))
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
  (:FILE \"tests/codec/cbor-array-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6b76f5728245279ac2549814c033bc91\"))
  (:FILE \"tests/codec/cbor-array-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"9de35b86b0a0ca59064d840e49fe57b1\"))
  (:FILE \"tests/codec/cbor-array-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"b9d14be96752dcf8318c82878549672c\"))
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
  (:FILE \"tests/get-active/construction.lisp\" :MD5
   #A((32) BASE-CHAR . \"447bcc0feb60a5a668474060df098cd7\"))
  (:FILE \"tests/get-active/directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"0de1b79cfcdf9dd19a4336c745726576\"))
  (:FILE \"tests/get-active/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"da12d6e2b34116951e37764beab59c2a\"))
  (:FILE \"tests/get-active/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"9cbecf43fcd898db4f74826bf2c29fa3\"))
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
  (:FILE \"tests/io/rename-native.lisp\" :MD5
   #A((32) BASE-CHAR . \"d79c13ea447cd8694b14bc6391d7e3ee\"))
  (:FILE \"tests/io/rename.lisp\" :MD5
   #A((32) BASE-CHAR . \"87acf2a7abb532d41aef472600184643\"))
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
  (:FILE \"tests/scheduler/pool-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"8c1264656e39ff936f904948f6b36802\"))
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
  (:FILE \"tools/measure-pool-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"2e6331ee278fb15d92f0350ed59eafd0\")))
 :SOURCE-FINGERPRINTS-AFTER
 ((:FILE \"arcdocdb.asd\" :MD5
   #A((32) BASE-CHAR . \"eef14ae2d95854c867d15d35f3435c18\"))
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
  (:FILE \"src/codec/cbor-array-input.lisp\" :MD5
   #A((32) BASE-CHAR . \"560fa1b10432d16edb830014e95ea4dc\"))
  (:FILE \"src/codec/cbor-array-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"0429206ab6069f053c66da4c56439cfb\"))
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
   #A((32) BASE-CHAR . \"4656fe55c934e9eaca3db8c72d76f1cd\"))
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
   #A((32) BASE-CHAR . \"36674625e81b78e3b97ab7068dfff88a\"))
  (:FILE \"src/control/preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"2dfc2b76c1d3c382db8b50071bdaeadf\"))
  (:FILE \"src/control/prepare.lisp\" :MD5
   #A((32) BASE-CHAR . \"c2667a324b14b2547bee2c8016e6d6c1\"))
  (:FILE \"src/control/publication-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"0e2492b2c97e8d3f7692668f5e09b44f\"))
  (:FILE \"src/control/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"93ce63e1bd43f2e64dc3f233035f0a94\"))
  (:FILE \"src/control/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"468fcf430eede17a38b922dfd373a746\"))
  (:FILE \"src/control/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"f525c21d06bf7abb9ee7c4eab9ac380e\"))
  (:FILE \"src/csn/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1130012fc5613a5648d22ed8628be0e8\"))
  (:FILE \"src/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1cdb5661fc54beba5bf00e4765f3235\"))
  (:FILE \"src/dispatch/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"ba4cd961094f37a157d49b8d7024b677\"))
  (:FILE \"src/dispatch/claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"b10caeff4f726c0ebd01e2c6d1baacba\"))
  (:FILE \"src/dispatch/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1528cc1a6fc7b5a2e0900c29dc090f92\"))
  (:FILE \"src/dispatch/recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"c3e120f7a7faba59ffb52e8dc0de96d6\"))
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
   #A((32) BASE-CHAR . \"fc1cbc7b30e0d74c359e9ee1bbd201ec\"))
  (:FILE \"src/io/namespace.lisp\" :MD5
   #A((32) BASE-CHAR . \"8898b56d45e22212f1db37f208230f34\"))
  (:FILE \"src/io/native-namespace.lisp\" :MD5
   #A((32) BASE-CHAR . \"4c0c79a243bd691d3a602afd89b77980\"))
  (:FILE \"src/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"58030bc0c811248a6537e2909d8762d6\"))
  (:FILE \"src/io/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"d5458684a1b169bacc46bc87fdaffed4\"))
  (:FILE \"src/io/rename.lisp\" :MD5
   #A((32) BASE-CHAR . \"40a1415771121f68afaa5165a0c23465\"))
  (:FILE \"src/io/transfer.lisp\" :MD5
   #A((32) BASE-CHAR . \"2f8bd851d09ab994d8d01b231697d1a1\"))
  (:FILE \"src/io/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"ec3e94e0eb6b3c0c6ce2bb091af42e2e\"))
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
  (:FILE \"tests/codec/cbor-array-write-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"6b76f5728245279ac2549814c033bc91\"))
  (:FILE \"tests/codec/cbor-array-write-threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"9de35b86b0a0ca59064d840e49fe57b1\"))
  (:FILE \"tests/codec/cbor-array-write.lisp\" :MD5
   #A((32) BASE-CHAR . \"b9d14be96752dcf8318c82878549672c\"))
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
  (:FILE \"tests/get-active/construction.lisp\" :MD5
   #A((32) BASE-CHAR . \"447bcc0feb60a5a668474060df098cd7\"))
  (:FILE \"tests/get-active/directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"0de1b79cfcdf9dd19a4336c745726576\"))
  (:FILE \"tests/get-active/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"da12d6e2b34116951e37764beab59c2a\"))
  (:FILE \"tests/get-active/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"9cbecf43fcd898db4f74826bf2c29fa3\"))
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
  (:FILE \"tests/io/rename-native.lisp\" :MD5
   #A((32) BASE-CHAR . \"d79c13ea447cd8694b14bc6391d7e3ee\"))
  (:FILE \"tests/io/rename.lisp\" :MD5
   #A((32) BASE-CHAR . \"87acf2a7abb532d41aef472600184643\"))
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
  (:FILE \"tests/scheduler/pool-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"8c1264656e39ff936f904948f6b36802\"))
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
  (:FILE \"tools/measure-pool-recycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"2e6331ee278fb15d92f0350ed59eafd0\")))
 :SOURCE-CONSISTENCY :STABLE :RECORDED-AT 4000984411 :SELF-TEST
 (:STATUS :OK :SHARED-SENSOR
  (:STATUS :OK :BASELINE
   (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096 :WARMUP-ITERATIONS
    128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS 35 :SECONDS 3.5d-5
    :TIME-QUALITY :MEASURED :SINK 8386560 :DIAGNOSTIC NIL :EXPECTED-SINK
    8386560)
   :POSITIVE-CONTROL
   (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 16 :WARMUP-ITERATIONS 0
    :COMPLETED-ITERATIONS 16 :HEAP-BYTES 16777472 :RAW-TICKS 34 :SECONDS 3.4d-5
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
    :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 5 :SECONDS 5.0d-6
    :TIME-QUALITY :MEASURED :SINK 318 :DIAGNOSTIC NIL :EXPECTED-SINK 318)
   :COMPOSED-REGISTRY-PROBE
   (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
    :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 7 :SECONDS 7.0d-6
    :TIME-QUALITY :MEASURED :SINK 142 :DIAGNOSTIC NIL :EXPECTED-SINK 142)
   :INVALID-CLI :REJECTED :OWNER-AND-REGISTRY-ORACLE-POSITIVE-NEGATIVE :PASSED
   :INVALID-NON-HOT :PASSED :EXISTING-DESTINATION-AND-PARTIAL-RAW :PASSED
   :MEASURED-PARTIAL-RAW
   (:REPLICA 0 :STATUS :EXPECTED-REJECTION :STAGE :MEASURED :ITERATIONS 4
    :WARMUP-ITERATIONS 0 :COMPLETED-ITERATIONS 1 :HEAP-BYTES 0 :RAW-TICKS 7
    :SECONDS 7.0d-6 :TIME-QUALITY :MEASURED :SINK 0 :DIAGNOSTIC
    #A((26) BASE-CHAR . \"fixture: misura interrotta\") :EXPECTED-SINK 6))
  :RECYCLE-ORACLES :PASSED :RECYCLE-CLI-AND-PARTIAL-RAW :PASSED :ROOM
  (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
   :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 20 :SECONDS 2.0d-5
   :TIME-QUALITY :MEASURED :SINK 130 :DIAGNOSTIC NIL :EXPECTED-SINK 130)
  :FULL
  (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
   :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 17 :SECONDS 1.7d-5
   :TIME-QUALITY :MEASURED :SINK 178 :DIAGNOSTIC NIL :EXPECTED-SINK 178))
 :SAMPLES
 ((:CAMPAIGN :ROOM :REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   4146 :SECONDS 0.004146d0 :TIME-QUALITY :MEASURED :SINK 8513536 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8513536)
  (:CAMPAIGN :ROOM :REPLICA 1 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   4123 :SECONDS 0.004123d0 :TIME-QUALITY :MEASURED :SINK 8513536 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8513536)
  (:CAMPAIGN :ROOM :REPLICA 2 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   4141 :SECONDS 0.004141d0 :TIME-QUALITY :MEASURED :SINK 8513536 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8513536)
  (:CAMPAIGN :ROOM :REPLICA 3 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   4108 :SECONDS 0.004108d0 :TIME-QUALITY :MEASURED :SINK 8513536 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8513536)
  (:CAMPAIGN :ROOM :REPLICA 4 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   4051 :SECONDS 0.004051d0 :TIME-QUALITY :MEASURED :SINK 8513536 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8513536)
  (:CAMPAIGN :FULL :REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   3393 :SECONDS 0.003393d0 :TIME-QUALITY :MEASURED :SINK 8562688 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8562688)
  (:CAMPAIGN :FULL :REPLICA 1 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   3392 :SECONDS 0.003392d0 :TIME-QUALITY :MEASURED :SINK 8562688 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8562688)
  (:CAMPAIGN :FULL :REPLICA 2 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   3384 :SECONDS 0.003384d0 :TIME-QUALITY :MEASURED :SINK 8562688 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8562688)
  (:CAMPAIGN :FULL :REPLICA 3 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   3370 :SECONDS 0.00337d0 :TIME-QUALITY :MEASURED :SINK 8562688 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8562688)
  (:CAMPAIGN :FULL :REPLICA 4 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   3330 :SECONDS 0.00333d0 :TIME-QUALITY :MEASURED :SINK 8562688 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8562688))
 :CURRENT-REPLICA NIL :SBCL #A((5) BASE-CHAR . \"2.6.9\") :MACHINE
 #A((5) BASE-CHAR . \"ARM64\") :OS #A((6) BASE-CHAR . \"Darwin\") :OS-VERSION
 #A((6) BASE-CHAR . \"27.0.0\") :SAFETY 3 :ITERATIONS 4096 :WARMUP 128 :REPLICAS
 5 :TIMER-UNITS-PER-SECOND 1000000 :CAMPAIGNS
 ((:ROOM :SHARDS 1 :RING-CAPACITY 1 :WRITERS 1 :WRITER-CAPACITY 8192
   :PAYLOADS-PER-WRITER 4226 :QUANTUM 1 :RECYCLE-PER-CYCLE 1 :CLAIM-PER-CYCLE 1
   :BEGIN-POP-ACK-END-PER-CYCLE 1 :TOKEN 31)
  (:FULL :SHARDS 1 :RING-CAPACITY 1 :WRITERS 2 :WRITER-CAPACITY 8192
   :PAYLOADS-PER-WRITER 4226 :QUANTUM 1 :RECYCLE-PER-CYCLE 1 :CLAIM-PER-CYCLE 0
   :BEGIN-POP-ACK-END-PER-CYCLE 1 :ALTERNATING-WRITER-IDENTITY T :TOKEN 43))
 :TOKEN-FORMULA \"sample=N*cycle-token+N*(N-1)/2; ROOM=31; FULL=43\" :LIMITS
 (:FRESH-FIXTURE-PER-REPLICA :PREALLOCATED-PRODUCT-AND-INPUTS
  :STARTUP-CLAIM-FIRST-TRATTO-DRAIN-AND-GC-EXCLUDED
  :PUBLIC-BOUNDED-DRAIN-AFTER-CLOCK :C1-PROTOCOL-AND-SCALAR-ORACLES-IN-CLOCK
  :NOT-ISOLATED-WRAPPER-THROUGHPUT :COUNTER-NOT-ABSOLUTE-NONALLOCATION-PROOF
  :EXTERNAL-LOAD-UNCONTROLLED :CLOCK-ZERO-IS-BELOW-RESOLUTION
  :NO-TIME-THRESHOLD-NO-TUNING-CLAIM :NO-IO-IN-CYCLE
  :NO-BRIDGE-BEGIN-OR-LIVE-SERIES-LEASE-IN-CLOCK :NO-CONCURRENT-COORDINATOR
  :NO-PHYSICAL-WORKER-LIFECYCLE-QUALIFICATION))
")
  (:PATH
   #A((149) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/pool-recycle-measure/coverage-attempt-01/9981fae0f2b1c8f5b55e295de2a88846.html")
   :BYTES 4419 :SHA256 "46b6e34194b5bf1efc6af3197441903c175e2535d7f0d74b4c596ce602e38bcb" :GIT-BLOB
   "20d437779f7d06a46adb4469253f016e27d0b2b2" :TEXT "<html><head><style type='text/css'>
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
</style></head><body><h3>Coverage report: /private/tmp/arcdocdb-pool-recycle-qualification-1791995415/src/dispatch/package.lisp <br />
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
<nobr><div class='source'><div class='line-number'><code>9</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#35;&#58;prendi&#45;collegamento&#45;pool&#160;&#35;&#58;collega&#45;obbligo&#45;pool&#160;&#35;&#58;ricircola&#45;collegamento&#45;pool&#41;&#41;</code></div></body></html>")
  (:PATH
   #A((149) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/pool-recycle-measure/coverage-attempt-01/b8b532b6ead690d0aa6b0987441560bc.html")
   :BYTES 7283 :SHA256 "ef6c539fd8ec77ba9b888ba7a07da5f04d5b9e384a37410b388cbe8338de7bf2" :GIT-BLOB
   "20a85a3f053ae25295683a98120006aa39a4a0bd" :TEXT "<html><head><style type='text/css'>
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
</style></head><body><h3>Coverage report: /private/tmp/arcdocdb-pool-recycle-qualification-1791995415/src/dispatch/build.lisp <br />
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
   #A((149) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/pool-recycle-measure/coverage-attempt-01/bbcb2e35c677aab9fad27534ce86a09d.html")
   :BYTES 14674 :SHA256 "c6e9338ab1da766e46bed5391e5169630879da70b6a563c076bbdc3952575b6b"
   :GIT-BLOB "e26c5d5929a4996ab9096a315aad2a477409b648" :TEXT "<html><head><style type='text/css'>
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
</style></head><body><h3>Coverage report: /private/tmp/arcdocdb-pool-recycle-qualification-1791995415/src/dispatch/recycle.lisp <br />
</h3>
<table class='summary'><tr class='head-row'><td width='80px'>Kind</td><td width='80px'>Covered</td><td width='80px'>All</td><td width='80px'>%</td><tr class='odd'><td>expression</td><td>45</td><td>49</td><td> 91.8</td></tr>
<tr class='even'><td>branch</td><td>0</td><td>0</td><td>nil  </td></tr>
</table><div class='key'><b>Key</b><br />
<div class='state-0'>Not instrumented</div><div class='state-15'>Conditionalized out</div><div class='state-1'>Executed</div><div class='state-2'>Not executed</div><div>&#160;</div><div class='state-5'>Both branches taken</div><div class='state-6'>One branch taken</div><div class='state-10'>Neither branch taken</div></div><nobr><div><code>
</code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>1</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#59;&#160;Risolve&#160;un&#160;obbligo&#160;RESCHEDULE&#160;prima&#160;di&#160;consultare&#160;nuovamente&#160;il&#160;pool&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>2</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;OWNER&#58;&#160;dispatcher&#44;&#160;contesto&#160;e&#160;link&#160;del&#160;thread&#160;creatore&#44;&#160;senza&#160;reentrancy&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>3</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;SHARED&#58;&#160;una&#160;partizione&#160;ready&#160;home&#160;per&#160;tratto&#160;&#40;ADR&#45;0045&#160;&#167;8&#41;&#44;&#160;poi&#160;routing&#160;immutabile&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>4</code></div><code>&#160;<span class='state-1'>&#40;in&#45;package&#160;&#35;&#58;arcdocdb&#46;scheduler&#46;dispatch&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>5</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;optimize&#160;&#40;safety&#160;3&#41;&#160;&#40;speed&#160;2&#41;&#160;&#40;debug&#160;2&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>6</code></div><code>&#160;<span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>7</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;REQ&#58;&#160;REQ&#45;CON&#45;004&#160;REQ&#45;AFF&#45;008</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>8</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;notinline&#160;&#37;check&#45;recycle&#45;status&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>9</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;ftype&#160;&#40;function&#160;&#40;t&#41;&#160;&#40;member&#160;&#58;claimed&#160;&#58;published&#41;&#41;&#160;&#37;check&#45;recycle&#45;status&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>10</code></div><code>&#160;<span class='state-1'>&#40;defun&#160;&#37;check&#45;recycle&#45;status&#160;&#40;status&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>11</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#34;Pre&#58;&#160;ritorno&#160;del&#160;delegato&#44;&#160;verificato&#160;come&#160;T&#160;senza&#160;propagare&#160;assunzioni&#160;ftype&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>12</code></div><code>&#160;<span class='state-1'>Post&#58;&#160;status&#160;noto&#59;&#160;INVARIANT&#45;VIOLATION&#160;inatteso&#160;senza&#160;mutare&#160;contesto&#160;o&#160;ready&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>13</code></div><code>&#160;<span class='state-1'>NOTINLINE&#160;mantiene&#160;il&#160;controllo&#160;al&#160;confine&#160;anche&#160;con&#160;FI&#160;fuori&#160;tipo&#160;del&#160;delegato&#46;&#34;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>14</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;case&#160;status</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>15</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;&#40;&#58;claimed&#160;&#58;published&#41;&#160;status&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>16</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;otherwise&#160;&#40;error&#160;&#39;invariant&#45;violation&#160;&#58;reason&#160;&#58;pool&#45;dispatcher&#45;state&#41;&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>17</code></div><code>&#160;<span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>18</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;REQ&#58;&#160;REQ&#45;THR&#45;001&#160;REQ&#45;CON&#45;001&#160;REQ&#45;CON&#45;002&#160;REQ&#45;CON&#45;004&#160;REQ&#45;CON&#45;005&#160;REQ&#45;AFF&#45;008</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>19</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;ftype&#160;&#40;function&#160;&#40;dispatcher&#45;writer&#45;pool&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>20</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;values&#160;&#40;or&#160;null&#160;arcdocdb&#46;execution&#46;series&#58;collegamento&#45;worker&#45;serie&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>21</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;member&#160;&#58;claimed&#160;&#58;published&#41;&#160;index&#160;&#38;optional&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>22</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;ricircola&#45;collegamento&#45;pool&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>23</code></div><code>&#160;<span class='state-1'>&#40;defun&#160;ricircola&#45;collegamento&#45;pool&#160;&#40;dispatcher&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>24</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#34;Pre&#58;&#160;owner&#160;corrente&#44;&#160;RESCHEDULE&#160;con&#160;obbligo&#160;unico&#160;e&#160;bridge&#160;precedente&#160;chiuso&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>25</code></div><code>&#160;<span class='state-1'>Post&#58;&#160;una&#160;sola&#160;operazione&#160;ready&#58;&#160;NIL&#47;PUBLISHED&#47;count&#160;e&#160;IDLE&#44;&#160;oppure&#160;link&#160;IDLE&#160;del</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>26</code></div><code>&#160;<span class='state-1'>nuovo&#160;CLAIMED&#47;count&#46;&#160;Count&#160;della&#160;partizione&#44;&#160;non&#160;cursore&#59;&#160;nessun&#160;begin&#160;implicito&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>27</code></div><code>&#160;<span class='state-1'>Non&#160;legge&#160;il&#160;pool&#160;né&#160;conferma&#160;ritiro&#59;&#160;busy&#160;conserva&#160;obbligo&#160;e&#160;retry&#160;esplicito&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>28</code></div><code>&#160;<span class='state-1'>Binding&#160;prima&#160;del&#160;trasferimento&#59;&#160;errori&#160;C1&#160;conservano&#160;i&#160;propri&#160;confini&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>29</code></div><code>&#160;<span class='state-1'>Routing&#160;fallito&#160;dopo&#160;full&#160;conserva&#160;lo&#160;scambio&#44;&#160;senza&#160;rollback&#160;o&#160;nuovo&#160;fault&#160;C3&#46;&#34;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>30</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;let&#160;&#40;&#40;port&#160;&#40;dispatcher&#45;writer&#45;pool&#45;port&#160;dispatcher&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>31</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;table&#160;&#40;dispatcher&#45;writer&#45;pool&#45;table&#160;dispatcher&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>32</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;&#37;check&#45;dispatcher&#45;binding&#160;port&#160;table&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>33</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;multiple&#45;value&#45;bind&#160;&#40;writer&#160;outcome&#160;count&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>34</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;arcdocdb&#46;execution&#58;ricircola&#45;worker</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>35</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;arcdocdb&#46;scheduler&#58;&#58;porta&#45;worker&#45;pool&#45;context&#160;port&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>36</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#40;let&#160;&#40;&#40;status&#160;&#40;&#37;check&#45;recycle&#45;status&#160;outcome&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>37</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;case&#160;status</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>38</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;&#58;claimed</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>39</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;unless&#160;writer&#160;&#40;error&#160;&#39;invariant&#45;violation&#160;&#58;reason&#160;&#58;pool&#45;dispatcher&#45;state&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>40</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;values&#160;&#40;arcdocdb&#46;execution&#46;series&#58;collega&#45;writer&#45;worker&#45;serie&#160;table&#41;&#160;status&#160;count&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>41</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;&#58;published</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>42</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;when&#160;writer&#160;&#40;error&#160;&#39;invariant&#45;violation&#160;&#58;reason&#160;&#58;pool&#45;dispatcher&#45;state&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>43</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;values&#160;nil&#160;status&#160;count&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>44</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;otherwise&#160;</span><span class='state-2'>&#40;error&#160;&#39;invariant&#45;violation&#160;&#58;reason&#160;&#58;pool&#45;dispatcher&#45;state&#41;</span><span class='state-1'>&#41;&#41;&#41;&#41;&#41;&#41;</code></div></body></html>")
  (:PATH
   #A((128) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/pool-recycle-measure/coverage-attempt-01/cover-index.html")
   :BYTES 2455 :SHA256 "2bb33ff9571289e11ab8cb1d92f6fcb69f64ebe29a47d37c64584b76d7991805" :GIT-BLOB
   "b9922310db4c95492627d9f01a35154f07f408db" :TEXT "<style type='text/css'>
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
</style><table class='summary'><tr class='head-row'><td></td><td class='main-head' colspan='3'>Expression</td><td class='main-head' colspan='3'>Branch</td></tr><tr class='head-row'><td width='80px'>Source file</td><td width='80px'>Covered</td><td width='80px'>Total</td><td width='80px'>%</td><td width='80px'>Covered</td><td width='80px'>Total</td><td width='80px'>%</td></tr><tr class='subheading'><td colspan='7'>/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/src/dispatch/</td></tr>
<tr class='odd'><td class='text-cell'><a href='b8b532b6ead690d0aa6b0987441560bc.html'>build.lisp</a></td><td>24</td><td>24</td><td>100.0</td><td>2</td><td>2</td><td>100.0</td></tr><tr class='even'><td class='text-cell'><a href='da4a08883529145835d8e64569ddef9f.html'>claim.lisp</a></td><td>45</td><td>49</td><td> 91.8</td><td>0</td><td>0</td><td>-</td></tr><tr class='odd'><td class='text-cell'><a href='9981fae0f2b1c8f5b55e295de2a88846.html'>package.lisp</a></td><td>1</td><td>1</td><td>100.0</td><td>0</td><td>0</td><td>-</td></tr><tr class='even'><td class='text-cell'><a href='bbcb2e35c677aab9fad27534ce86a09d.html'>recycle.lisp</a></td><td>45</td><td>49</td><td> 91.8</td><td>0</td><td>0</td><td>-</td></tr><tr class='odd'><td class='text-cell'><a href='dd287c973e78cdb1d134aa31289c5c99.html'>types.lisp</a></td><td>40</td><td>40</td><td>100.0</td><td>8</td><td>8</td><td>100.0</td></tr></table>")
  (:PATH
   #A((131) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/pool-recycle-measure/coverage-attempt-01/coverage-audit.lisp")
   :BYTES 2079 :SHA256 "9f029fa4ec1bbed3d91349c0f4e0b6ccd2a0614db6a083cbd2ced2f1083f6efa" :GIT-BLOB
   "bb9073750228a6ad73afe06aa9cfc68363ae6c5d" :TEXT
   "(:SCHEMA-VERSION 1 :KIND :POOL-LIFECYCLE-COVERAGE-AUDIT :STATUS :OK :SCOPE
 :ENTIRE-NEW-LIFECYCLE-PLUS-PACKAGE :NATIVE-PATH
 #A((131) BASE-CHAR
    . \"/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/pool-recycle-measure/coverage-attempt-01/coverage-state.lisp\")
 :HTML-PATH
 #A((128) BASE-CHAR
    . \"/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/pool-recycle-measure/coverage-attempt-01/cover-index.html\")
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
  (:FILE #A((25) BASE-CHAR . \"src/dispatch/recycle.lisp\") :EXPRESSIONS-HIT 45
   :EXPRESSIONS-TOTAL 49 :BRANCHES-HIT 0 :BRANCHES-TOTAL 0 :MISSING
   ((:NATIVE-INDEX 39 :KIND :EXPRESSION :PATH (1 4 2 3 3 4 6))
    (:NATIVE-INDEX 40 :KIND :EXPRESSION :PATH (1 1 4 2 3 3 4 6))
    (:NATIVE-INDEX 41 :KIND :EXPRESSION :PATH (2 1 4 2 3 3 4 6))
    (:NATIVE-INDEX 42 :KIND :EXPRESSION :PATH (3 1 4 2 3 3 4 6))))
  (:FILE #A((23) BASE-CHAR . \"src/dispatch/types.lisp\") :EXPRESSIONS-HIT 40
   :EXPRESSIONS-TOTAL 40 :BRANCHES-HIT 8 :BRANCHES-TOTAL 8 :MISSING NIL))
 :LIFECYCLE-TOTAL (155 163 10 10) :MINIMUM-PERCENT 95 :HTML-COUNTS
 ((\"src/dispatch/build.lisp\" 24 24 2 2) (\"src/dispatch/claim.lisp\" 45 49 0 0)
  (\"src/dispatch/package.lisp\" 1 1 0 0) (\"src/dispatch/recycle.lisp\" 45 49 0 0)
  (\"src/dispatch/types.lisp\" 40 40 8 8))
 :HTML-COUNTS-ORIGIN :PARSED-SB-COVER-INDEX :SELF-TEST :PASSED :EXCLUSIONS NIL
 :MCDC-INFERRED NIL)
")
  (:PATH
   #A((140) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/pool-recycle-measure/coverage-attempt-01/coverage-dispatch-audit.lisp")
   :BYTES 2395 :SHA256 "6b794d97e4a5e6069e1568ccc13fb2cecddd554ae57c26eb9fa89740c5019aa1" :GIT-BLOB
   "1988db74c3e9cf538b949a70cfb11f0f6a546f32" :TEXT
   "(:SCOPE-ADAPTER-SELF-TEST :PASSED :NAMESPACE-ADAPTER
 :DISPATCH-HEADING-WITH-UNCHANGED-TD-AND-NATIVE-PARSER :LIBRARY-REPORT
 #A((131) BASE-CHAR
    . \"/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/pool-recycle-measure/coverage-attempt-01/coverage-audit.lisp\")
 :DISPATCH-TOTAL (155 163 10 10) :SCHEMA-VERSION 1 :KIND
 :POOL-RECYCLE-COVERAGE-AUDIT :STATUS :OK :SCOPE
 :ENTIRE-FIVE-FILE-DISPATCH-PACKAGE :NATIVE-PATH
 #A((131) BASE-CHAR
    . \"/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/pool-recycle-measure/coverage-attempt-01/coverage-state.lisp\")
 :HTML-PATH
 #A((128) BASE-CHAR
    . \"/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/pool-recycle-measure/coverage-attempt-01/cover-index.html\")
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
  (:FILE #A((25) BASE-CHAR . \"src/dispatch/recycle.lisp\") :EXPRESSIONS-HIT 45
   :EXPRESSIONS-TOTAL 49 :BRANCHES-HIT 0 :BRANCHES-TOTAL 0 :MISSING
   ((:NATIVE-INDEX 39 :KIND :EXPRESSION :PATH (1 4 2 3 3 4 6))
    (:NATIVE-INDEX 40 :KIND :EXPRESSION :PATH (1 1 4 2 3 3 4 6))
    (:NATIVE-INDEX 41 :KIND :EXPRESSION :PATH (2 1 4 2 3 3 4 6))
    (:NATIVE-INDEX 42 :KIND :EXPRESSION :PATH (3 1 4 2 3 3 4 6))))
  (:FILE #A((23) BASE-CHAR . \"src/dispatch/types.lisp\") :EXPRESSIONS-HIT 40
   :EXPRESSIONS-TOTAL 40 :BRANCHES-HIT 8 :BRANCHES-TOTAL 8 :MISSING NIL))
 :LIFECYCLE-TOTAL (155 163 10 10) :MINIMUM-PERCENT 95 :HTML-COUNTS
 ((\"src/dispatch/build.lisp\" 24 24 2 2) (\"src/dispatch/claim.lisp\" 45 49 0 0)
  (\"src/dispatch/package.lisp\" 1 1 0 0) (\"src/dispatch/recycle.lisp\" 45 49 0 0)
  (\"src/dispatch/types.lisp\" 40 40 8 8))
 :HTML-COUNTS-ORIGIN :PARSED-SB-COVER-INDEX :SELF-TEST :PASSED :EXCLUSIONS NIL
 :MCDC-INFERRED NIL)
")
  (:PATH
   #A((149) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/pool-recycle-measure/coverage-attempt-01/da4a08883529145835d8e64569ddef9f.html")
   :BYTES 14998 :SHA256 "ed9691068606a1f684f0422989203e09edcc5da98d854f288d4d6fceb5cb87a6"
   :GIT-BLOB "767ba7b4ff5c406dcb64c6be7c8d27a20078b28b" :TEXT "<html><head><style type='text/css'>
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
</style></head><body><h3>Coverage report: /private/tmp/arcdocdb-pool-recycle-qualification-1791995415/src/dispatch/claim.lisp <br />
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
   #A((149) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/pool-recycle-measure/coverage-attempt-01/dd287c973e78cdb1d134aa31289c5c99.html")
   :BYTES 10927 :SHA256 "2e47531b23884302705c6e14d0f0e5e33817c720ae4fd59418606be61ee9fbce"
   :GIT-BLOB "eb9df444ac7f877eeddb36d4dc6c2df367b3fa6e" :TEXT "<html><head><style type='text/css'>
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
</style></head><body><h3>Coverage report: /private/tmp/arcdocdb-pool-recycle-qualification-1791995415/src/dispatch/types.lisp <br />
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
   #A((109) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/pool-recycle-measure/coverage-run.lisp")
   :BYTES 2803 :SHA256 "a4f865663ba05ea7cce58d96b867ebe0195a697200f39334b768f014dd7fa5da" :GIT-BLOB
   "f5d0329857a01ff254e082465de7bf1bee5d1958" :TEXT "(require :asdf)
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
        (compile-file \"spikes/out/pool-recycle-measure/dispatch-coverage-reader.lisp\"
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
   #A((121) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/pool-recycle-measure/dispatch-coverage-reader.lisp")
   :BYTES 8562 :SHA256 "a6ef7626f2d35824a9c307555090b003cdbd692f709e46c408d722a8087a2739" :GIT-BLOB
   "06dd5e9f34c18b89a7932a8c66e0b236b8fbab7f" :TEXT
   ";;;; C4 adapter: library native/TD/count parser unchanged; whole five-file dispatch scope.
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
                        \"src/dispatch/build.lisp\" \"src/dispatch/claim.lisp\" \"src/dispatch/recycle.lisp\"))

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
                          (list* \"/a/src/dispatch/recycle.lisp\" #((0)) #*1)
                          (list* \"/a/src/scheduler/pool-claim.lisp\" #((0)) #*1)))
            (rows (arcdocdb.lifecycle.coverage.reader::scope-native-rows native))
            (counts (mapcar #'arcdocdb.lifecycle.coverage.reader::row-counts rows))
            (heading \"<tr class='subheading'><td colspan='7'>/a/src/dispatch/</td></tr>\")
            (html (concatenate 'string heading
                   \"<tr class='odd'><td><a href='b'>build.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='even'><td><a href='c'>claim.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='odd'><td><a href='p'>package.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='odd'><td><a href='r'>recycle.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='even'><td><a href='t'>types.lisp</a></td><td>1</td><td>2</td><td>50</td><td>1</td><td>2</td><td>50</td></tr>\")))
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal counts '((\"src/dispatch/build.lisp\" 1 1 0 0) (\"src/dispatch/claim.lisp\" 1 1 0 0)
                        (\"src/dispatch/package.lisp\" 1 1 0 0) (\"src/dispatch/recycle.lisp\" 1 1 0 0)
                        (\"src/dispatch/types.lisp\" 1 2 1 2)))
        \"dispatch independent native count oracle\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal '(5 6 1 2) (arcdocdb.lifecycle.coverage.reader::count-total counts)) \"dispatch denominator oracle\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal counts (arcdocdb.lifecycle.coverage.reader::html-count-rows html)) \"dispatch exact HTML concordance\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal (getf (fifth rows) :missing)
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
  \"All five dispatch files, gate95 without exclusions; preserve native/HTML and both audits.\"
  (adapter-self-test)
  (let ((report (call-dispatch-reader
                 (lambda () (arcdocdb.lifecycle.coverage.reader::audit-coverage native html library-output)))))
    (setf (getf report :kind) :pool-recycle-coverage-audit
          (getf report :scope) :entire-five-file-dispatch-package
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
   #A((107) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/pool-recycle-measure/reader-run.lisp")
   :BYTES 731 :SHA256 "ae7dc11358a459d702fa92762d3c59181a388abe6eb7840643eeb868bf588858" :GIT-BLOB
   "d574a7e2da650b36371a1ba667e8156e8afd1f30" :TEXT "(require :asdf)
(pushnew :dispatch-coverage-reader-library *features*)
(declaim (optimize (safety 3) (debug 3)))
(handler-bind ((warning (lambda (condition) (error condition)))
               (style-warning (lambda (condition) (error condition))))
  (multiple-value-bind (fasl warnings failure)
      (compile-file \"spikes/out/pool-recycle-measure/dispatch-coverage-reader.lisp\"
                    :output-file \"spikes/out/pool-recycle-measure/dispatch-coverage-reader.fasl\")
    (unless (and fasl (not warnings) (not failure)) (error \"COD-01: dispatch reader compile failure.\"))
    (load fasl)))
(uiop:symbol-call \"ARCDOCDB.DISPATCH.COVERAGE.READER\" \"ADAPTER-SELF-TEST\")
(format t \"~&Dispatch coverage reader self-test PASS~%\")
")
  (:PATH
   #A((105) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/pool-recycle-measure/tool-run.lisp")
   :BYTES 636 :SHA256 "69db490da4df9b19a9b820a6e3844c1f763da7f87d28e7cbfc74b5fdbb922769" :GIT-BLOB
   "a0171bfc074ec042598995434fb7b9c114eb64ce" :TEXT "(require :asdf)
(pushnew :arcdocdb-pool-recycle-measure-library *features*)
(declaim (optimize (safety 3) (debug 3)))
(handler-bind ((warning (lambda (condition) (error condition)))
               (style-warning (lambda (condition) (error condition))))
  (multiple-value-bind (fasl warnings failure)
      (compile-file \"tools/measure-pool-recycle.lisp\"
                    :output-file \"spikes/out/pool-recycle-measure/measure-pool-recycle.fasl\")
    (unless (and fasl (not warnings) (not failure))
      (error \"COD-01: tool pool-recycle compile failure.\"))
    (load fasl)))
(uiop:symbol-call \"ARCDOCDB.POOL-RECYCLE.MEASURE\" \"MAIN\")
")
  (:PATH
   #A((119) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/pool-recycle-publication-selftest-attempt-01.log")
   :BYTES 230 :SHA256 "fa7a5b56c6e5f5682e66c21eb3853523cdaccbfb6a62e1f47e44c27c27e72666" :GIT-BLOB
   "27f5147b75e5fdde9506b33591b68d40553f52b2" :TEXT
   ":OK: sbcl --noinform --no-userinit --no-sysinit --script spikes/out/pool-recycle-dev/publication-selftest.lisp; record: /private/tmp/arcdocdb-pool-recycle-qualification-1791995415/spikes/out/4000984350-command-38941-0/report.lisp
")))
