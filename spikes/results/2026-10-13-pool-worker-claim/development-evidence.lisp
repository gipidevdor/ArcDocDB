(:SCHEMA-VERSION 1 :KIND :POOL-WORKER-LIFECYCLE-DEVELOPMENT :VERSION "2026-10-13" :PART 1 :PARTS 1
 :SOURCES
 ((:PATH
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-claim-dev/compile-product-attempt-01.log")
   :BYTES 33 :SHA256 "f0e279e11370294710f6cc385d41c4d70da34b5e079f49c2509b60dd00d784c4" :GIT-BLOB
   "9f48de276c23ab94f383de7d6a1b6d9e96048bbb" :TEXT "Strict product compilation PASS.
")
  (:PATH
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-claim-dev/compile-product.lisp")
   :BYTES 414 :SHA256 "64149914d9690ae5377db0e493eb6d65f7e5b11a182e2185daeb7f7050e0d74f" :GIT-BLOB
   "36baeb1eb0f026a8b368e6a47a93a899efc54149" :TEXT "(require :asdf)
(setf asdf:*compile-file-failure-behaviour* :error
      asdf:*compile-file-warnings-behaviour* :error)
(handler-bind ((warning (lambda (c)
                          (unless (typep c 'sb-kernel:redefinition-warning) (error \"COD-01: ~A\" c)))))
 (asdf:load-asd (merge-pathnames \"arcdocdb.asd\" (truename \"./\")))
 (asdf:load-system \"arcdocdb\" :force t))
(format t \"Strict product compilation PASS.~%\")
")
  (:PATH
   #A((103) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-claim-dev/count-tests.lisp")
   :BYTES 521 :SHA256 "5aed48fb993970a02829c51fe118cd893537f157dacea60a53ce110ae0401b69" :GIT-BLOB
   "e0b71d2b773a5a214cf451fd39cda38ed908f29e" :TEXT "(require :asdf)
(load \"tools/evidence-storage.lisp\")
(let* ((data (arcdocdb.evidence:read-evidence (first (uiop:command-line-arguments))))
       (lines (uiop:split-string (getf data :stdout) :separator '(#\\Newline)))
       (ok (remove-if-not (lambda (line) (uiop:string-prefix-p \"ok    \" line)) lines))
       (tests (remove-if-not (lambda (line) (uiop:string-prefix-p \"ok    TEST-\" line)) ok)))
  (format t \"Product named tests: ~D~%Other named checks: ~S~%\" (length tests) (set-difference ok tests :test #'string=)))
")
  (:PATH
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-claim-dev/lint-attempt-01.log")
   :BYTES 57 :SHA256 "2ae67b40cd02ec403acb0cc772e869e4e86866e91afe851467142d30c228b48a" :GIT-BLOB
   "4bcc6211d41aa2cdf05681824e4af2b26dca4127" :TEXT "sbcl --script tools/lint.lisp src
186 file, 0 violazioni
")
  (:PATH
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-claim-dev/trace-attempt-01.log")
   :BYTES 99 :SHA256 "a62376a35971e4c49f41e51d4c5fe64eefcee38d66ce0b549205a7fd16983cbc" :GIT-BLOB
   "a629c9e912226fc08afcfbf9bd0d5ca633677789" :TEXT "sbcl --script tools/check-trace.lisp
118 requisiti, 65 invarianti, 13 scenari FI, 52 ADR: 0 errori
")
  (:PATH
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-claim-integrated-attempt-01.log")
   :BYTES 146 :SHA256 "294258b1280b424526d74842dbe35b8c527c5a8df3460ce4646bea66745d3556" :GIT-BLOB
   "ffcd7d62af4dcdcef3fef2f96fc4324ce51f93bf" :TEXT
   ":OK: make test lint trace; record: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4000913736-command-84415-0/report.lisp
")
  (:PATH
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-claim-measure/claim-coverage-reader.lisp")
   :BYTES 5522 :SHA256 "4e81190202e0044e9eaff8b00953fbf47a494fd0d0a30ef41811b41dfade92dc" :GIT-BLOB
   "d436edae53a661107d9f053360c57d4fc8f43e9d" :TEXT
   ";;;; C4 adapter: library native/HTML reader unchanged; explicit whole claim+package scope.
;;;; The legacy audit remains original; metadata-only claim audit retains identical counts/missing.
;;;; --self-test; runner calls AUDIT-CLAIM-COVERAGE after the independent adapter selftest.
(eval-when (:compile-toplevel :load-toplevel :execute)
  (require :asdf)
  (unless (find-package \"ARCDOCDB.LIFECYCLE.COVERAGE.READER\")
    (let ((*features* (cons :lifecycle-coverage-reader-library *features*)))
      (load \"spikes/out/lifecycle-measure/lifecycle-coverage-reader.lisp\"))))
(defpackage #:arcdocdb.claim.coverage.reader (:use #:cl))
(in-package #:arcdocdb.claim.coverage.reader)
(declaim (optimize (safety 3) (debug 3)))
(defparameter +scope+ '(\"src/scheduler/package.lisp\" \"src/scheduler/pool-claim.lisp\"))

(defun claim-source-identity (path)
  \"All claim-prefixed files enter the inventory; unexpected modules cannot silently disappear.\"
  (arcdocdb.lifecycle.coverage.reader::reader-require (stringp path) \"claim source not a string\")
  (let ((start (if (uiop:string-prefix-p \"src/\" path) 0
                   (let ((position (search \"/src/\" path :from-end t)))
                     (when position (1+ position))))))
    (when start
      (let ((identity (subseq path start)))
        (when (or (string= \"src/scheduler/\" identity)
                  (string= \"src/scheduler/package.lisp\" identity)
                  (uiop:string-prefix-p \"src/scheduler/pool-claim\" identity))
          identity)))))

(defun call-claim-reader (function)
  \"One-thread C4 adapter restores the library selector even on rejection; no native bit edits.\"
  (let ((original (symbol-function 'arcdocdb.lifecycle.coverage.reader::source-identity))
        (arcdocdb.lifecycle.coverage.reader::+scope-files+ +scope+))
    (unwind-protect
         (progn (setf (symbol-function 'arcdocdb.lifecycle.coverage.reader::source-identity)
                      #'claim-source-identity)
                (funcall function))
      (setf (symbol-function 'arcdocdb.lifecycle.coverage.reader::source-identity) original))))

(defun adapter-self-test ()
  \"Library malformed native/HTML/gate tests plus new independent scope/missing/count fixtures.\"
  (arcdocdb.lifecycle.coverage.reader::coverage-reader-self-test)
  (call-claim-reader
   (lambda ()
     (let* ((native (list (list* \"/a/src/scheduler/pool-claim.lisp\" #((0) (1) (:then 2) (:else 2)) #*1010)
                          (list* \"/a/src/scheduler/package.lisp\" #((0)) #*1)
                          (list* \"/a/src/scheduler/lifecycle-worker.lisp\" #((0)) #*1)))
            (rows (arcdocdb.lifecycle.coverage.reader::scope-native-rows native))
            (counts (mapcar #'arcdocdb.lifecycle.coverage.reader::row-counts rows))
            (heading \"<tr class='subheading'><td colspan='7'>/a/src/scheduler/</td></tr>\")
            (html (concatenate 'string heading
                   \"<tr class='odd'><td><a href='p'>package.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='even'><td><a href='c'>pool-claim.lisp</a></td><td>1</td><td>2</td><td>50</td><td>1</td><td>2</td><td>50</td></tr>\")))
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal counts '((\"src/scheduler/package.lisp\" 1 1 0 0)
                        (\"src/scheduler/pool-claim.lisp\" 1 2 1 2))) \"claim native count oracle\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal counts (arcdocdb.lifecycle.coverage.reader::html-count-rows html)) \"claim HTML exact concordance\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal (getf (second rows) :missing)
               '((:native-index 1 :kind :expression :path (1))
                 (:native-index 3 :kind :branch :path (:else 2)))) \"claim missing paths oracle\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal (claim-source-identity \"/a/src/scheduler/pool-claim-unexpected.lisp\")
               \"src/scheduler/pool-claim-unexpected.lisp\") \"unexpected claim silently excluded\")
       (arcdocdb.lifecycle.coverage.reader::expect-rejection
        (lambda () (arcdocdb.lifecycle.coverage.reader::scope-native-rows
                    (list (list* \"/a/src/scheduler/pool-claim.lisp\" #((0)) #*0)
                          (list* \"/b/src/scheduler/pool-claim.lisp\" #((0)) #*1))))))))
  :passed)

(defun audit-claim-coverage (native html library-output claim-output)
  \"Native/HTML gate95 without exclusions; library report and precise claim metadata both exclusive.\"
  (adapter-self-test)
  (let ((report (call-claim-reader
                 (lambda () (arcdocdb.lifecycle.coverage.reader::audit-coverage native html library-output)))))
    (setf (getf report :kind) :pool-claim-coverage-audit
          (getf report :scope) :entire-new-pool-claim-plus-package
          (getf report :claim-total) (getf report :lifecycle-total)
          (getf report :library-report) (namestring library-output)
          (getf report :scope-adapter-self-test) :passed)
    (with-open-file (stream claim-output :direction :output :if-exists :error :external-format :utf-8)
      (let ((*print-readably* t)) (write report :stream stream :pretty t) (terpri stream)))
    report))

(unless (member :claim-coverage-reader-library *features*)
  (unless (equal (uiop:command-line-arguments) '(\"--self-test\"))
    (error \"COD-61: claim coverage adapter use --self-test.\"))
  (adapter-self-test)
  (format t \"~&Claim coverage reader self-test PASS~%\"))
")
  (:PATH
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-claim-measure/coverage-run.lisp")
   :BYTES 2883 :SHA256 "7b2c70035f08e40ad8ea8808700af5a8f60633e586de58871e2533d054858fc2" :GIT-BLOB
   "e1898cebc79e5451477eb8c1596021fd5d801cff" :TEXT "(require :asdf)
(require :sb-cover)
(require :sb-posix)
(pushnew :claim-coverage-reader-library *features*)
;; Keep startup code-component marks across ASDF GC without modifying any observed bit.
(defmethod asdf:perform :after ((operation asdf:load-op) (component asdf:cl-source-file))
  (declare (ignore operation))
  (when (search \"/src/scheduler/\" (namestring (asdf:component-pathname component)))
    (sb-cover:save-coverage)))
(let* ((args (uiop:command-line-arguments)) (root (truename \"./\"))
       (directory (when (= 2 (length args))
                    (uiop:ensure-directory-pathname (merge-pathnames (second args) root)))))
  (unless (and directory (string= \"--report\" (first args)))
    (error \"COD-61 pool claim coverage: use --report fresh-directory/.\"))
  (ensure-directories-exist
   (merge-pathnames \"parent-placeholder\" (uiop:pathname-parent-directory-pathname directory)))
  (sb-posix:mkdir (namestring directory) #o700)
  (handler-bind ((warning (lambda (condition) (error condition)))
                 (style-warning (lambda (condition) (error condition))))
    (multiple-value-bind (fasl warnings failure)
        (compile-file \"spikes/out/pool-claim-measure/claim-coverage-reader.lisp\"
                      :output-file (merge-pathnames \"reader.fasl\" directory))
      (unless (and fasl (not warnings) (not failure)) (error \"COD-01: claim reader compile failure.\"))
      (load fasl)))
  (uiop:symbol-call \"ARCDOCDB.CLAIM.COVERAGE.READER\" \"ADAPTER-SELF-TEST\")
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
                                            (or (search \"/src/scheduler/pool-claim\" path)
                                                (search \"/src/scheduler/package.lisp\" path))))))
    (unless html (error \"COD-60: claim source data missing.\"))
    (uiop:symbol-call \"ARCDOCDB.CLAIM.COVERAGE.READER\" \"AUDIT-CLAIM-COVERAGE\"
                     (merge-pathnames \"coverage-state.lisp\" directory) html
                     (merge-pathnames \"coverage-audit.lisp\" directory)
                     (merge-pathnames \"coverage-claim-audit.lisp\" directory))))
")
  (:PATH
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-claim-measure/reader-run.lisp")
   :BYTES 709 :SHA256 "a066bba7120a5a05dcd8fb0e45bac7d300d500c651394e5983f07cbe941eb254" :GIT-BLOB
   "51b2f8c5c594ba529961d26843d4d4b462915ef8" :TEXT "(require :asdf)
(pushnew :claim-coverage-reader-library *features*)
(declaim (optimize (safety 3) (debug 3)))
(handler-bind ((warning (lambda (condition) (error condition)))
               (style-warning (lambda (condition) (error condition))))
  (multiple-value-bind (fasl warnings failure)
      (compile-file \"spikes/out/pool-claim-measure/claim-coverage-reader.lisp\"
                    :output-file \"spikes/out/pool-claim-measure/claim-coverage-reader.fasl\")
    (unless (and fasl (not warnings) (not failure)) (error \"COD-01: claim reader compile failure.\"))
    (load fasl)))
(uiop:symbol-call \"ARCDOCDB.CLAIM.COVERAGE.READER\" \"ADAPTER-SELF-TEST\")
(format t \"~&Claim coverage reader self-test PASS~%\")
")
  (:PATH
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-claim-measure/reader-selftest-attempt-01.stderr")
   :BYTES 0 :SHA256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" :GIT-BLOB
   "e69de29bb2d1d6434b8b29ae775ad8c2e48c5391" :TEXT "")
  (:PATH
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-claim-measure/reader-selftest-attempt-01.stdout")
   :BYTES 37 :SHA256 "bf53bce7158a1f645ce97a0bf617767a27db29fa8fb8477e2fd98f80c558a4d0" :GIT-BLOB
   "fd879705c57a23fb5325de61747b26aaa7a97dd8" :TEXT "Claim coverage reader self-test PASS
")
  (:PATH
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-claim-measure/tool-run.lisp")
   :BYTES 624 :SHA256 "ff2cfb6c377e7ba6ea287833bd4829c4c571afe8b45c87e7a6c0be0737c3f007" :GIT-BLOB
   "f08b0e71dec2ea019ed7b6114ba1331fc8fb70fe" :TEXT "(require :asdf)
(pushnew :arcdocdb-pool-claim-measure-library *features*)
(declaim (optimize (safety 3) (debug 3)))
(handler-bind ((warning (lambda (condition) (error condition)))
               (style-warning (lambda (condition) (error condition))))
  (multiple-value-bind (fasl warnings failure)
      (compile-file \"tools/measure-pool-claim.lisp\"
                    :output-file \"spikes/out/pool-claim-measure/measure-pool-claim.fasl\")
    (unless (and fasl (not warnings) (not failure))
      (error \"COD-01: tool pool-claim compile failure.\"))
    (load fasl)))
(uiop:symbol-call \"ARCDOCDB.POOL-CLAIM.MEASURE\" \"MAIN\")
")
  (:PATH
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-claim-measure/tool-selftest-attempt-01.stderr")
   :BYTES 0 :SHA256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" :GIT-BLOB
   "e69de29bb2d1d6434b8b29ae775ad8c2e48c5391" :TEXT "")
  (:PATH
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-claim-measure/tool-selftest-attempt-01.stdout")
   :BYTES 69438 :SHA256 "6096aa1e6264bcd401db49e175660b5fbec3f51b1460c60c22b9c94fbc7ed1a3"
   :GIT-BLOB "f8423c54185728923c8dc292c235fb52a2ae5f51" :TEXT
   "(:SCHEMA-VERSION 1 :KIND :POOL-CLAIM-BENCHMARK :STATUS :OK :STAGE :COMPLETE
 :DIAGNOSTIC NIL :PROCESS-ARGV
 (#A((48) BASE-CHAR . \"/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl\")
  #A((11) BASE-CHAR . \"--self-test\"))
 :TOOL-ARGUMENTS (#A((11) BASE-CHAR . \"--self-test\"))
 :SOURCE-FINGERPRINTS-BEFORE
 ((:FILE \"arcdocdb.asd\" :MD5
   #A((32) BASE-CHAR . \"c436b96a4bb19da43b197e0c10fbf45c\"))
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
  (:FILE \"src/csn/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1130012fc5613a5648d22ed8628be0e8\"))
  (:FILE \"src/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1cdb5661fc54beba5bf00e4765f3235\"))
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
   #A((32) BASE-CHAR . \"894f6e238fe4047f2bf607fceae86846\"))
  (:FILE \"src/get-directory/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"74a694385f1aaf03ec87721545494119\"))
  (:FILE \"src/get-directory/sources-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"2b8193aab6801de19e26fa55e7c53f87\"))
  (:FILE \"src/get-directory/sources-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"b846a6348ff7d4b5f7b380b5b3ff8c17\"))
  (:FILE \"src/get-directory/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"17c957d6934a31f4ed64313e756de2d2\"))
  (:FILE \"src/get-resolver/active-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"c65593cf172f53a8e90a853bbe9504c2\"))
  (:FILE \"src/get-resolver/active-directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"6d95f29b331d335175843f47ae44a6ea\"))
  (:FILE \"src/get-resolver/active-preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"f13d422adb6aa9e8489352884137f25a\"))
  (:FILE \"src/get-resolver/active-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"521737861e057d663964b0c030552587\"))
  (:FILE \"src/get-resolver/active-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6aaec49504a96f37c8ff1bc182c977b\"))
  (:FILE \"src/get-resolver/active-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"bd7182e9871fe82530d0c828e473ccde\"))
  (:FILE \"src/get-resolver/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"bbfb2082103e6712419e180ab972245c\"))
  (:FILE \"src/get-resolver/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"6226d131f5562a475048b6444049c4ca\"))
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
   #A((32) BASE-CHAR . \"06ea105db71f021ea60b2c59645273b4\"))
  (:FILE \"src/io/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"11c7103efbe733bbf0a13927f23c3d34\"))
  (:FILE \"src/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"58030bc0c811248a6537e2909d8762d6\"))
  (:FILE \"src/io/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"8ad95e22e31444161b81d2eb23e552ff\"))
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
   #A((32) BASE-CHAR . \"558b1eb8912d7ff8b9a53d904b44bffc\"))
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
   #A((32) BASE-CHAR . \"59e3c59c90d8d0fc5731b87496a785aa\"))
  (:FILE \"src/series/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"056d2c6a67c9d9f2bf9fe2d2c348d53c\"))
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
   #A((32) BASE-CHAR . \"3e565b431b88fb5211023601b5e3ce3b\"))
  (:FILE \"tests/get-directory/series-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"8d7ed4f8d3f9e8394b15c648a3a4507b\"))
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
  (:FILE \"tests/scheduler/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"1388f446bce5085439c2254edd165118\"))
  (:FILE \"tests/scheduler/pool-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"4285b244bfa5067c556a8463b8bd3304\"))
  (:FILE \"tests/scheduler/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"34e51e369859bc1c731d73e43053b6f4\"))
  (:FILE \"tests/series/boundaries.lisp\" :MD5
   #A((32) BASE-CHAR . \"6967c7e6396b6df38c637f2d5d9ebfc0\"))
  (:FILE \"tests/series/controller.lisp\" :MD5
   #A((32) BASE-CHAR . \"179fc8c8f9021b3e10d982be12215a01\"))
  (:FILE \"tests/series/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"ce845c57c825657e95c105d4a8fbfe9a\"))
  (:FILE \"tests/series/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"d581e4d3087fb92a47e80b7c32d877ae\"))
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
  (:FILE \"tools/measure-pool-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"9329f449267f4b536c405d91dbe1a09b\")))
 :SOURCE-FINGERPRINTS-AFTER
 ((:FILE \"arcdocdb.asd\" :MD5
   #A((32) BASE-CHAR . \"c436b96a4bb19da43b197e0c10fbf45c\"))
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
  (:FILE \"src/csn/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1130012fc5613a5648d22ed8628be0e8\"))
  (:FILE \"src/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1cdb5661fc54beba5bf00e4765f3235\"))
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
   #A((32) BASE-CHAR . \"894f6e238fe4047f2bf607fceae86846\"))
  (:FILE \"src/get-directory/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"74a694385f1aaf03ec87721545494119\"))
  (:FILE \"src/get-directory/sources-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"2b8193aab6801de19e26fa55e7c53f87\"))
  (:FILE \"src/get-directory/sources-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"b846a6348ff7d4b5f7b380b5b3ff8c17\"))
  (:FILE \"src/get-directory/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"17c957d6934a31f4ed64313e756de2d2\"))
  (:FILE \"src/get-resolver/active-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"c65593cf172f53a8e90a853bbe9504c2\"))
  (:FILE \"src/get-resolver/active-directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"6d95f29b331d335175843f47ae44a6ea\"))
  (:FILE \"src/get-resolver/active-preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"f13d422adb6aa9e8489352884137f25a\"))
  (:FILE \"src/get-resolver/active-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"521737861e057d663964b0c030552587\"))
  (:FILE \"src/get-resolver/active-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6aaec49504a96f37c8ff1bc182c977b\"))
  (:FILE \"src/get-resolver/active-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"bd7182e9871fe82530d0c828e473ccde\"))
  (:FILE \"src/get-resolver/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"bbfb2082103e6712419e180ab972245c\"))
  (:FILE \"src/get-resolver/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"6226d131f5562a475048b6444049c4ca\"))
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
   #A((32) BASE-CHAR . \"06ea105db71f021ea60b2c59645273b4\"))
  (:FILE \"src/io/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"11c7103efbe733bbf0a13927f23c3d34\"))
  (:FILE \"src/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"58030bc0c811248a6537e2909d8762d6\"))
  (:FILE \"src/io/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"8ad95e22e31444161b81d2eb23e552ff\"))
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
   #A((32) BASE-CHAR . \"558b1eb8912d7ff8b9a53d904b44bffc\"))
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
   #A((32) BASE-CHAR . \"59e3c59c90d8d0fc5731b87496a785aa\"))
  (:FILE \"src/series/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"056d2c6a67c9d9f2bf9fe2d2c348d53c\"))
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
   #A((32) BASE-CHAR . \"3e565b431b88fb5211023601b5e3ce3b\"))
  (:FILE \"tests/get-directory/series-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"8d7ed4f8d3f9e8394b15c648a3a4507b\"))
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
  (:FILE \"tests/scheduler/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"1388f446bce5085439c2254edd165118\"))
  (:FILE \"tests/scheduler/pool-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"4285b244bfa5067c556a8463b8bd3304\"))
  (:FILE \"tests/scheduler/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"34e51e369859bc1c731d73e43053b6f4\"))
  (:FILE \"tests/series/boundaries.lisp\" :MD5
   #A((32) BASE-CHAR . \"6967c7e6396b6df38c637f2d5d9ebfc0\"))
  (:FILE \"tests/series/controller.lisp\" :MD5
   #A((32) BASE-CHAR . \"179fc8c8f9021b3e10d982be12215a01\"))
  (:FILE \"tests/series/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"ce845c57c825657e95c105d4a8fbfe9a\"))
  (:FILE \"tests/series/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"d581e4d3087fb92a47e80b7c32d877ae\"))
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
  (:FILE \"tools/measure-pool-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"9329f449267f4b536c405d91dbe1a09b\")))
 :SOURCE-CONSISTENCY :STABLE :RECORDED-AT 4000913067 :SELF-TEST
 (:STATUS :OK :SHARED-SENSOR
  (:STATUS :OK :BASELINE
   (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096 :WARMUP-ITERATIONS
    128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS 36 :SECONDS 3.6d-5
    :TIME-QUALITY :MEASURED :SINK 8386560 :DIAGNOSTIC NIL :EXPECTED-SINK
    8386560)
   :POSITIVE-CONTROL
   (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 16 :WARMUP-ITERATIONS 0
    :COMPLETED-ITERATIONS 16 :HEAP-BYTES 16777472 :RAW-TICKS 36 :SECONDS 3.6d-5
    :TIME-QUALITY :MEASURED :SINK 16777336 :DIAGNOSTIC NIL :EXPECTED-SINK
    16777336)
   :WRONG-SINK-PROBE
   (:REPLICA 0 :STATUS :EXPECTED-REJECTION :STAGE :MEASURED :ITERATIONS 2
    :WARMUP-ITERATIONS 0 :COMPLETED-ITERATIONS 2 :HEAP-BYTES 0 :RAW-TICKS 2
    :SECONDS 2.0d-6 :TIME-QUALITY :MEASURED :SINK 3 :DIAGNOSTIC
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
    :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 7 :SECONDS 7.0d-6
    :TIME-QUALITY :MEASURED :SINK 142 :DIAGNOSTIC NIL :EXPECTED-SINK 142)
   :INVALID-CLI :REJECTED :OWNER-AND-REGISTRY-ORACLE-POSITIVE-NEGATIVE :PASSED
   :INVALID-NON-HOT :PASSED :EXISTING-DESTINATION-AND-PARTIAL-RAW :PASSED
   :MEASURED-PARTIAL-RAW
   (:REPLICA 0 :STATUS :EXPECTED-REJECTION :STAGE :MEASURED :ITERATIONS 4
    :WARMUP-ITERATIONS 0 :COMPLETED-ITERATIONS 1 :HEAP-BYTES 0 :RAW-TICKS 7
    :SECONDS 7.0d-6 :TIME-QUALITY :MEASURED :SINK 0 :DIAGNOSTIC
    #A((26) BASE-CHAR . \"fixture: misura interrotta\") :EXPECTED-SINK 6))
  :FOUR-VALUE-ORACLE :PASSED :CLAIM-CLI-AND-PARTIAL-RAW :PASSED :EMPTY
  (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
   :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 15 :SECONDS 1.5d-5
   :TIME-QUALITY :MEASURED :SINK 54 :DIAGNOSTIC NIL :EXPECTED-SINK 54)
  :INACTIVE
  (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
   :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 5 :SECONDS 5.0d-6
   :TIME-QUALITY :MEASURED :SINK 86 :DIAGNOSTIC NIL :EXPECTED-SINK 86)
  :SWITCH
  (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
   :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 13 :SECONDS 1.3d-5
   :TIME-QUALITY :MEASURED :SINK 190 :DIAGNOSTIC NIL :EXPECTED-SINK 190))
 :SAMPLES NIL :CURRENT-REPLICA NIL :SBCL #A((5) BASE-CHAR . \"2.6.9\") :MACHINE
 #A((5) BASE-CHAR . \"ARM64\") :OS #A((6) BASE-CHAR . \"Darwin\") :OS-VERSION
 #A((6) BASE-CHAR . \"27.0.0\") :SAFETY 3 :ITERATIONS 4096 :WARMUP 128 :REPLICAS
 5 :TIMER-UNITS-PER-SECOND 1000000 :CAMPAIGNS
 ((:EMPTY :SHARDS 4 :INITIAL-CURSOR 0 :CLAIM-PER-CYCLE 4 :TOKEN 12)
  (:INACTIVE :SHARDS 4 :INITIAL-CURSOR 2 :CLAIM-PER-CYCLE 4 :TOKEN 20)
  (:SWITCH :SHARDS 4 :INITIAL-CURSOR 0 :CLAIM-PER-CYCLE 6 :TOKEN 46
   :ROLES-SERIALIZED T :PRIVATE-REQUEST-FIXTURE T
   :GENERATION-INCREMENTS-PER-CYCLE 2))
 :TOKEN-FORMULA
 \"sample=N*cycle-token+N*(N-1)/2; EMPTY=12; INACTIVE=20; SWITCH=46\" :LIMITS
 (:PREALLOCATED-PRODUCT-AND-INPUTS :STARTUP-AND-GC-EXCLUDED
  :COUNTER-NOT-ABSOLUTE-NONALLOCATION-PROOF :EXTERNAL-LOAD-UNCONTROLLED
  :CLOCK-ZERO-IS-BELOW-RESOLUTION :NO-TIME-THRESHOLD-NO-TUNING-CLAIM
  :EMPTY-IS-LOCAL-OBSERVATION :NO-REAL-QUEUED-CLAIM-MEASURED
  :NO-CONCURRENT-COORDINATOR-OR-PHYSICAL-WORKER-LIFECYCLE-QUALIFICATION))
")
  (:PATH
   #A((103) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-claim-tests/attempt-01.log")
   :BYTES 6622 :SHA256 "0ed066043c2007ae5f8d1bfe30a32bb79fb6feb98d9bda5c66bdd08074f617e6" :GIT-BLOB
   "db211a823a4f3c8820ec738482ffd7390ca3963a" :TEXT
   "Unhandled SIMPLE-ERROR in thread #<SB-THREAD:THREAD tid=259 \"main thread\" RUNNING
                                    {80052B0003}>:
  Invalid pathname #P\"spikes/out/pool-claim-tests/cache/\": Expected an absolute pathname

Backtrace for: #<SB-THREAD:THREAD tid=259 \"main thread\" RUNNING {80052B0003}>
0: (SB-DEBUG::DEBUGGER-DISABLED-HOOK #<SIMPLE-ERROR \"Invalid pathname ~S: ~*~?\" {80077186E3}> #<unused argument> :QUIT T)
1: (SB-DEBUG::RUN-HOOK *INVOKE-DEBUGGER-HOOK* #<SIMPLE-ERROR \"Invalid pathname ~S: ~*~?\" {80077186E3}>)
2: (INVOKE-DEBUGGER #<SIMPLE-ERROR \"Invalid pathname ~S: ~*~?\" {80077186E3}>)
3: (ERROR \"Invalid pathname ~S: ~*~?\" #P\"spikes/out/pool-claim-tests/cache/\" :WANT-ABSOLUTE \"Expected an absolute pathname\" NIL)
4: (UIOP/PATHNAME:ENSURE-PATHNAME #P\"spikes/out/pool-claim-tests/cache/\" :ON-ERROR NIL :DEFAULTS NIL :TYPE NIL :DOT-DOT NIL :NAMESTRING NIL :EMPTY-IS-NIL NIL :WANT-PATHNAME NIL :WANT-LOGICAL NIL :WANT-PHYSICAL NIL :ENSURE-PHYSICAL NIL :WANT-RELATIVE NIL :WANT-ABSOLUTE T :ENSURE-ABSOLUTE NIL :ENSURE-SUBPATH NIL :WANT-NON-WILD NIL :WANT-WILD NIL :WILDEN T :WANT-FILE NIL :WANT-DIRECTORY NIL :ENSURE-DIRECTORY NIL :WANT-EXISTING NIL :ENSURE-DIRECTORIES-EXIST NIL :TRUENAME NIL :RESOLVE-SYMLINKS T :TRUENAMIZE NIL)
5: (UIOP/CONFIGURATION:RESOLVE-LOCATION \"spikes/out/pool-claim-tests/cache/\" :ENSURE-DIRECTORY T :WILDEN T :DIRECTORY NIL)
6: (ASDF/OUTPUT-TRANSLATIONS::PROCESS-OUTPUT-TRANSLATIONS-DIRECTIVE (T \"spikes/out/pool-claim-tests/cache/\") :INHERIT (ASDF/OUTPUT-TRANSLATIONS:ENVIRONMENT-OUTPUT-TRANSLATIONS ASDF/OUTPUT-TRANSLATIONS:USER-OUTPUT-TRANSLATIONS-PATHNAME ASDF/OUTPUT-TRANSLATIONS:USER-OUTPUT-TRANSLATIONS-DIRECTORY-PATHNAME ASDF/OUTPUT-TRANSLATIONS:SYSTEM-OUTPUT-TRANSLATIONS-PATHNAME ASDF/OUTPUT-TRANSLATIONS:SYSTEM-OUTPUT-TRANSLATIONS-DIRECTORY-PATHNAME) :COLLECT #<FUNCTION (FLET ASDF/OUTPUT-TRANSLATIONS::C :IN ASDF/OUTPUT-TRANSLATIONS:COMPUTE-OUTPUT-TRANSLATIONS) {800720390B}>)
7: ((:METHOD ASDF/OUTPUT-TRANSLATIONS:PROCESS-OUTPUT-TRANSLATIONS (CONS)) (:OUTPUT-TRANSLATIONS (T \"spikes/out/pool-claim-tests/cache/\") :IGNORE-INHERITED-CONFIGURATION) :INHERIT (ASDF/OUTPUT-TRANSLATIONS:ENVIRONMENT-OUTPUT-TRANSLATIONS ASDF/OUTPUT-TRANSLATIONS:USER-OUTPUT-TRANSLATIONS-PATHNAME ASDF/OUTPUT-TRANSLATIONS:USER-OUTPUT-TRANSLATIONS-DIRECTORY-PATHNAME ASDF/OUTPUT-TRANSLATIONS:SYSTEM-OUTPUT-TRANSLATIONS-PATHNAME ASDF/OUTPUT-TRANSLATIONS:SYSTEM-OUTPUT-TRANSLATIONS-DIRECTORY-PATHNAME) :COLLECT #<FUNCTION (FLET ASDF/OUTPUT-TRANSLATIONS::C :IN ASDF/OUTPUT-TRANSLATIONS:COMPUTE-OUTPUT-TRANSLATIONS) {800720390B}>) [fast-method]
8: ((:METHOD ASDF/OUTPUT-TRANSLATIONS:PROCESS-OUTPUT-TRANSLATIONS (CONS)) (:OUTPUT-TRANSLATIONS ((#P\"/opt/homebrew/Cellar/sbcl/2.6.9/lib/sbcl/\" #P\"**/*.*\") NIL) :INHERIT-CONFIGURATION :ENABLE-USER-CACHE) :INHERIT ((:OUTPUT-TRANSLATIONS (T \"spikes/out/pool-claim-tests/cache/\") :IGNORE-INHERITED-CONFIGURATION) ASDF/OUTPUT-TRANSLATIONS:ENVIRONMENT-OUTPUT-TRANSLATIONS ASDF/OUTPUT-TRANSLATIONS:USER-OUTPUT-TRANSLATIONS-PATHNAME ASDF/OUTPUT-TRANSLATIONS:USER-OUTPUT-TRANSLATIONS-DIRECTORY-PATHNAME ASDF/OUTPUT-TRANSLATIONS:SYSTEM-OUTPUT-TRANSLATIONS-PATHNAME ASDF/OUTPUT-TRANSLATIONS:SYSTEM-OUTPUT-TRANSLATIONS-DIRECTORY-PATHNAME) :COLLECT #<FUNCTION (FLET ASDF/OUTPUT-TRANSLATIONS::C :IN ASDF/OUTPUT-TRANSLATIONS:COMPUTE-OUTPUT-TRANSLATIONS) {800720390B}>) [fast-method]
9: (ASDF/OUTPUT-TRANSLATIONS:COMPUTE-OUTPUT-TRANSLATIONS (:OUTPUT-TRANSLATIONS (T \"spikes/out/pool-claim-tests/cache/\") :IGNORE-INHERITED-CONFIGURATION))
10: (ASDF/OUTPUT-TRANSLATIONS:INITIALIZE-OUTPUT-TRANSLATIONS (:OUTPUT-TRANSLATIONS (T \"spikes/out/pool-claim-tests/cache/\") :IGNORE-INHERITED-CONFIGURATION))
11: (SB-INT:SIMPLE-EVAL-IN-LEXENV (ASDF/OUTPUT-TRANSLATIONS:INITIALIZE-OUTPUT-TRANSLATIONS (QUOTE (:OUTPUT-TRANSLATIONS (T \"spikes/out/pool-claim-tests/cache/\") :IGNORE-INHERITED-CONFIGURATION))) #<NULL-LEXENV>)
12: (EVAL-TLF (ASDF/OUTPUT-TRANSLATIONS:INITIALIZE-OUTPUT-TRANSLATIONS (QUOTE (:OUTPUT-TRANSLATIONS (T \"spikes/out/pool-claim-tests/cache/\") :IGNORE-INHERITED-CONFIGURATION))) 1 NIL)
13: ((LABELS SB-FASL::EVAL-FORM :IN SB-INT:LOAD-AS-SOURCE) (ASDF/OUTPUT-TRANSLATIONS:INITIALIZE-OUTPUT-TRANSLATIONS (QUOTE (:OUTPUT-TRANSLATIONS (T \"spikes/out/pool-claim-tests/cache/\") :IGNORE-INHERITED-CONFIGURATION))) 1)
14: ((LAMBDA (SB-KERNEL:FORM &KEY :CURRENT-INDEX &ALLOW-OTHER-KEYS) :IN SB-INT:LOAD-AS-SOURCE) (ASDF/OUTPUT-TRANSLATIONS:INITIALIZE-OUTPUT-TRANSLATIONS (QUOTE (:OUTPUT-TRANSLATIONS (T \"spikes/out/pool-claim-tests/cache/\") :IGNORE-INHERITED-CONFIGURATION))) :CURRENT-INDEX 1)
15: (SB-C::%DO-FORMS-FROM-INFO #<FUNCTION (LAMBDA (SB-KERNEL:FORM &KEY :CURRENT-INDEX &ALLOW-OTHER-KEYS) :IN SB-INT:LOAD-AS-SOURCE) {109490F1B}> #<SB-C::SOURCE-INFO {8005260953}> SB-C::INPUT-ERROR-IN-LOAD)
16: (SB-INT:LOAD-AS-SOURCE #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-claim-tests/scoped.lisp\" {8005250993}> :VERBOSE NIL :PRINT NIL :CONTEXT \"loading\")
17: ((LABELS SB-FASL::LOAD-STREAM-1 :IN LOAD) #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-claim-tests/scoped.lisp\" {8005250993}> NIL)
18: (SB-FASL::CALL-WITH-LOAD-BINDINGS #<FUNCTION (LABELS SB-FASL::LOAD-STREAM-1 :IN LOAD) {1094909EB}> #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-claim-tests/scoped.lisp\" {8005250993}> NIL #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-claim-tests/scoped.lisp\" {8005250993}>)
19: ((LABELS SB-FASL::LOAD-STREAM :IN LOAD) #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-claim-tests/scoped.lisp\" {8005250993}> NIL)
20: (LOAD #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-claim-tests/scoped.lisp\" {8005250993}> :VERBOSE NIL :PRINT NIL :IF-DOES-NOT-EXIST :ERROR :EXTERNAL-FORMAT :DEFAULT)
21: ((FLET SB-IMPL::LOAD-SCRIPT :IN SB-IMPL::PROCESS-SCRIPT) #<SB-SYS:FD-STREAM for \"file /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-claim-tests/scoped.lisp\" {8005250993}>)
22: ((FLET SB-UNIX::BODY :IN SB-IMPL::PROCESS-SCRIPT))
23: ((FLET \"WITHOUT-INTERRUPTS-BODY-\" :IN SB-IMPL::PROCESS-SCRIPT))
24: (SB-IMPL::PROCESS-SCRIPT \"spikes/out/pool-claim-tests/scoped.lisp\")
25: (SB-IMPL::TOPLEVEL-INIT)
26: ((FLET SB-UNIX::BODY :IN SB-IMPL::START-LISP))
27: ((FLET \"WITHOUT-INTERRUPTS-BODY-3\" :IN SB-IMPL::START-LISP))
28: (SB-IMPL::%START-LISP)

unhandled condition in --disable-debugger mode, quitting
")
  (:PATH
   #A((103) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-claim-tests/attempt-02.log")
   :BYTES 4064 :SHA256 "06bb56fedc2884beaba136270496bd5999fde83dc526f3206fb1220734cbe95b" :GIT-BLOB
   "0ced642038c487b0596e32cb1d4e9c417bac7483" :TEXT
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
ok    TEST-REQ-CON-002-POOL-PENDING-RETIRE-WAITS-FOR-BRIDGE-BATCH-AND-EXPLICIT-HANDOFF
ok    TEST-REQ-CON-002-POOL-FULL-RECYCLE-KEEPS-CLAIMED-AND-ROUTES-NEW-WRITER-BEFORE-RETIRE
52 test scoped pool superati.
")
  (:PATH
   #A((103) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-claim-tests/attempt-03.log")
   :BYTES 4150 :SHA256 "cb93d0b9b0d5276088bbad11331f7795c100dee412b9b71216d6ed59610b8873" :GIT-BLOB
   "5b495747af0ca429fdff7861621b0e9eac7b5220" :TEXT
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
53 test scoped pool superati.
")
  (:PATH
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-claim-tests/runner-attempt-01.lisp")
   :BYTES 851 :SHA256 "fa82633a3375de0687a9dd300d89078f40a673752bcafdd3b1bea3b0542947eb" :GIT-BLOB
   "96f04fd24ab5daa2acbb3e9c38b5ac98770a3a00" :TEXT "(require :asdf)
(asdf:initialize-output-translations
 '(:output-translations (t \"spikes/out/pool-claim-tests/cache/\") :ignore-inherited-configuration))
(setf asdf:*compile-file-failure-behaviour* :error
      asdf:*compile-file-warnings-behaviour* :error)
(handler-bind ((warning (lambda (condition)
                          (unless (typep condition 'sb-kernel:redefinition-warning)
                            (error \"Avviso non ammesso: ~A\" condition)))))
  (asdf:load-asd (merge-pathnames \"arcdocdb.asd\" (truename \"./\")))
  (asdf:load-system \"arcdocdb/tests\"))
(let ((tests (remove-if-not
              (lambda (name) (search \"POOL-\" (symbol-name name)))
              arcdocdb.scheduler.tests::*tests*)))
  (dolist (name (reverse tests)) (funcall name) (format t \"ok    ~A~%\" name))
  (format t \"~D test scoped pool superati.~%\" (length tests)))
")
  (:PATH
   #A((100) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-claim-tests/scoped.lisp")
   :BYTES 905 :SHA256 "e2b1b6a21c698ce4e112edafc8dcdeaf1e284c348402242ec3f224dbdf8b8ec7" :GIT-BLOB
   "2eb25649a67bb6c714613a36b377329d0f792fbc" :TEXT "(require :asdf)
(asdf:initialize-output-translations
 `(:output-translations
   (t ,(namestring (merge-pathnames \"spikes/out/pool-claim-tests/cache/\" (truename \"./\"))))
   :ignore-inherited-configuration))
(setf asdf:*compile-file-failure-behaviour* :error
      asdf:*compile-file-warnings-behaviour* :error)
(handler-bind ((warning (lambda (condition)
                          (unless (typep condition 'sb-kernel:redefinition-warning)
                            (error \"Avviso non ammesso: ~A\" condition)))))
  (asdf:load-asd (merge-pathnames \"arcdocdb.asd\" (truename \"./\")))
  (asdf:load-system \"arcdocdb/tests\"))
(let ((tests (remove-if-not
              (lambda (name) (search \"POOL-\" (symbol-name name)))
              arcdocdb.scheduler.tests::*tests*)))
  (dolist (name (reverse tests)) (funcall name) (format t \"ok    ~A~%\" name))
  (format t \"~D test scoped pool superati.~%\" (length tests)))
")
  (:PATH
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-claim-tests/source-attempt-01.lisp")
   :BYTES 21062 :SHA256 "eddcc9f85e4490bea0066f2ccd221364f0752beb178e7f279c8f7b9c76c1083f"
   :GIT-BLOB "80ddaf1aa29bd7cbffd1d8e8a913a5c8424e093f" :TEXT
   ";;;; Claim ammesso dal pool soltanto alla barriera C1 IDLE, senza revoca di compiti.
;;;; OWNER: porta, contesto e bridge sul thread creatore; coordinator delle fixture distinto.
;;;; FI quiescenti: immagini, parole corrotte e sostituzioni temporanee sempre ripristinate.
;;;; Le fixture Serie usano il backend pubblico e non dipendono da tests/series.
(in-package #:arcdocdb.scheduler.tests)

(defun pool-claim-check (port writer status cursor action)
  \"Oracolo dei quattro valori pubblici; identita writer e cursore sono attesi dal caller.\"
  (is (equal (list writer status cursor action)
             (multiple-value-list (arcdocdb.scheduler:prendi-writer-pool port)))))

(defun pool-claim-ready (context)
  (arcdocdb.execution::contesto-worker-writer-ready context))

(defun pool-claim-image (port &optional writers)
  \"Immagine FI bounded, solo per dimostrare l'assenza di mutazioni sui rifiuti.\"
  (let* ((context (arcdocdb.scheduler::porta-worker-pool-context port))
         (ready (pool-claim-ready context)))
    (list (lifecycle-words port) (lifecycle-context-state context)
          (map 'list #'arcdocdb.execution.tests::ready-fi-snapshot
               (arcdocdb.execution::lista-writer-pronti-partitions ready))
          (mapcar #'arcdocdb.execution.tests::handoff-fi-snapshot writers))))

(defun pool-claim-refusal (port type reason &optional writers)
  (let ((before (pool-claim-image port writers)))
    (arcdocdb.execution.tests::worker-capture-condition
     (lambda () (arcdocdb.scheduler:prendi-writer-pool port)) type reason)
    (is (equalp before (pool-claim-image port writers)))))

(defun pool-claim-local (&key (active t) (shards 1) (capacity 1) (start 0))
  (let* ((ready (arcdocdb.execution:crea-lista-writer-pronti
                 :shards shards :capacity capacity))
         (context (arcdocdb.execution:crea-contesto-worker-writer ready :start start)))
    (values (arcdocdb.scheduler:crea-porta-worker-pool context :active active) context ready)))

(defun pool-claim-writer (items &optional (ordinal 0))
  (let ((writer (arcdocdb.execution:crea-writer-programmabile
                 :capacity 4 :quantum 1 :routing-index ordinal)))
    (loop for item in items for count from 1
          do (arcdocdb.execution.tests::handoff-check-enqueue
              writer item count (if (= count 1) :schedule :queued)))
    writer))

(defun pool-claim-function-fi (name replacement thunk)
  \"FI quiescente: nessun worker esegue NAME durante la sostituzione della fixture.\"
  (let ((saved (fdefinition name)))
    (unwind-protect (progn (setf (fdefinition name) replacement) (funcall thunk))
      (setf (fdefinition name) saved))))

(defun pool-claim-series (id)
  \"Controller reale su backend C4 in memoria; nessun I/O richiesto dai compiti della prova.\"
  (let* ((backend (arcdocdb.io:make-backend
                   (lambda (path mode) (declare (ignore path mode)) id)
                   (lambda (&rest arguments) (declare (ignore arguments))
                     (error \"Lettura I/O inattesa nella fixture pool.\"))
                   (lambda (fd bytes start count) (declare (ignore fd bytes start)) count)
                   (lambda (fd) (declare (ignore fd)) 0)
                   (lambda (fd) (declare (ignore fd)) 0)
                   (lambda (fd) (declare (ignore fd)) 0)))
         (file (arcdocdb.io:crea-temporaneo \"pool-claim-series.tmp\" :backend backend))
         (log (arcdocdb.wal:crea-log-io file :segment id)))
    (values (arcdocdb.series:crea-controllore-serie
             (arcdocdb.csn:crea-registro-csn :capacity 4) log :capacity 2)
            file)))

(defun pool-claim-bridge-begin (link)
  (multiple-value-bind (token status reason) (arcdocdb.execution.series:inizia-worker-serie link)
    (is (plusp token)) (is (eq :active status)) (is (null reason)) token))

(defun pool-claim-bridge-pop (link token item)
  (let ((target (vector :left :untouched :right)))
    (multiple-value-bind (count status batch)
        (arcdocdb.execution.series:preleva-worker-serie link token target 1 2)
      (is (= 1 count)) (is (eq :messages status)) (is (plusp batch))
      (is (eq :left (svref target 0))) (is (eq item (svref target 1)))
      (is (eq :right (svref target 2))) batch)))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-inactive-claim-keeps-real-ready-obligation-and-cursor
  (multiple-value-bind (port context ready) (pool-claim-local :active nil :shards 3 :start 2)
    (let ((writer (pool-claim-writer '(:kept))))
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 writer)))
      (let ((before (pool-claim-image port (list writer))))
        ;; La sentinella FI distingue assenza di scansione da scansione senza pop.
        (pool-claim-function-fi
         'arcdocdb.execution::%prova-pronta
         (lambda (partition) (declare (ignore partition)) (error \"Scansione di worker inattivo.\"))
         (lambda () (dotimes (attempt 2) (pool-claim-check port nil :inactive 2 :unchanged))))
        (is (equalp before (pool-claim-image port (list writer)))))
      (arcdocdb.execution.tests::worker-check-claim context writer :claimed 1)
      (arcdocdb.execution.tests::worker-complete-one context writer :kept))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-THR-001-pool-real-grow-acknowledges-before-taking-ready-writer
  (let* ((workers (list (lifecycle-fixture-start t) (lifecycle-fixture-start nil)))
         (registry (arcdocdb.scheduler:crea-registro-pool
                    (crea-controllore-pool 1 :dwell 500) (lifecycle-ports workers)))
         (worker (second workers)) (writer nil))
    (unwind-protect
         (progn
           (lifecycle-call worker
                           (lambda (owned)
                             (setf writer (pool-claim-writer '(:activated)))
                             (is (= 1 (arcdocdb.execution:pubblica-writer-pronto
                                       (pool-claim-ready (lifecycle-fixture-context owned)) 0 writer)))
                             (pool-claim-check (lifecycle-fixture-port owned) nil :inactive 0 :unchanged)
                             :ok))
           (lifecycle-check-update registry 0 8 0 0 1 :hold 1 nil)
           (lifecycle-check-update registry 500 8 0 0 2 :grow 1 t)
           (lifecycle-call worker
                           (lambda (owned)
                             (pool-claim-check (lifecycle-fixture-port owned) writer :claimed 0 :activated)
                             (arcdocdb.execution.tests::worker-complete-one
                              (lifecycle-fixture-context owned) writer :activated) :ok))
           (is (equal '(2 2 nil) (lifecycle-registry-state registry))))
      (lifecycle-fixtures-stop workers))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-THR-001-pool-real-shrink-retires-before-removing-ready-writer
  (let* ((workers (list (lifecycle-fixture-start t) (lifecycle-fixture-start t)))
         (controller (crea-controllore-pool 1 :initial 2 :dwell 500))
         (registry (arcdocdb.scheduler:crea-registro-pool controller (lifecycle-ports workers))))
    (unwind-protect
         (progn
           (lifecycle-start-retirement controller registry)
           (lifecycle-call
            (second workers)
            (lambda (owned)
              (let* ((port (lifecycle-fixture-port owned)) (context (lifecycle-fixture-context owned))
                     (ready (pool-claim-ready context)) (writer (pool-claim-writer '(:retained))))
                (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 writer)))
                (let ((queue-before (arcdocdb.execution.tests::ready-fi-snapshot
                                     (arcdocdb.execution.tests::ready-test-partition ready 0)))
                      (context-before (lifecycle-context-state context))
                      (writer-before (arcdocdb.execution.tests::handoff-fi-snapshot writer)))
                  (pool-claim-check port nil :inactive 0 :retired)
                  (is (equalp queue-before (arcdocdb.execution.tests::ready-fi-snapshot
                                            (arcdocdb.execution.tests::ready-test-partition ready 0))))
                  (is (equal context-before (lifecycle-context-state context)))
                  (is (equalp writer-before (arcdocdb.execution.tests::handoff-fi-snapshot writer))))
                (pool-claim-check port nil :inactive 0 :unchanged)
                ;; Cleanup C4: trasferisce esplicitamente l'obbligo rimasto nel ring.
                (arcdocdb.execution.tests::worker-check-claim context writer :claimed 0)
                (arcdocdb.execution.tests::worker-complete-one context writer :retained)) :ok))
           (is (equal '(1 1 nil) (lifecycle-registry-state registry))))
      (lifecycle-fixtures-stop workers))))

;;; REQ: REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-foreign-owner-rejection-precedes-phase-and-word-checks
  (let ((worker (lifecycle-fixture-start nil)))
    (unwind-protect
         (let* ((port (lifecycle-fixture-port worker)) (context (lifecycle-fixture-context worker)))
           ;; FI quiescente dopo il ritorno della barriera: entrambi i livelli invalidi.
           (setf (arcdocdb.scheduler::porta-worker-pool-request port) 4
                 (arcdocdb.execution::contesto-worker-writer-state context) :faulted)
           (pool-claim-refusal port 'invalid-argument :pool-worker-owner))
      (lifecycle-fixtures-stop (list worker)))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-004-pool-every-nonidle-phase-refuses-before-inactive-or-debt-validation
  (multiple-value-bind (port context ready) (pool-claim-local :active nil)
    (declare (ignore ready))
    (let ((writer (pool-claim-writer '(:obligation)))
          (original (make-condition 'invariant-violation :reason :worker-state)))
      ;; FI quiescente: debiti e fault deliberatamente incompatibili con alcune fasi.
      ;; Il gate fuori IDLE deve conservarli, senza validazione, ACK o poisoning C1.
      (setf (arcdocdb.execution::contesto-worker-writer-writer context) writer
            (arcdocdb.execution::contesto-worker-writer-lease context) 7
            (arcdocdb.execution::contesto-worker-writer-pending context) 2
            (arcdocdb.execution::contesto-worker-writer-batch-generation context) 9
            (arcdocdb.execution::contesto-worker-writer-fault context) original)
      (dolist (phase '(:claimed :running :batch :finishing :reschedule :faulted))
        (setf (arcdocdb.execution::contesto-worker-writer-state context) phase)
        (pool-claim-refusal port 'resource-exhausted :worker-state (list writer))
        (is (eq original (arcdocdb.execution:errore-worker-writer context)))))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-004 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-idle-inconsistency-refuses-retirement-ack-and-c1-poisoning
  (multiple-value-bind (port context ready) (pool-claim-local)
    (declare (ignore ready))
    (let ((writer (pool-claim-writer '(:kept))))
      ;; FI: pending retire e un singolo campo IDLE corrotto per scenario.
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
      (dolist (slot '(arcdocdb.execution::cursor arcdocdb.execution::home
                      arcdocdb.execution::writer arcdocdb.execution::lease
                      arcdocdb.execution::pending arcdocdb.execution::fault))
        (let ((saved (slot-value context slot))
              (bad (case slot
                     (arcdocdb.execution::writer writer)
                     (arcdocdb.execution::fault
                      (make-condition 'invariant-violation :reason :worker-state))
                     (otherwise 1))))
          (unwind-protect
               (progn (setf (slot-value context slot) bad)
                      (pool-claim-refusal port 'invariant-violation :worker-state (list writer)))
            (setf (slot-value context slot) saved))))
      (pool-claim-check port nil :inactive 0 :retired)
      (is (null (arcdocdb.execution:errore-worker-writer context))))))

;;; REQ: REQ-CON-001 REQ-CON-004 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-corrupt-word-protocol-preserves-ready-and-local-worker
  (multiple-value-bind (port context ready) (pool-claim-local)
    (let ((writer (pool-claim-writer '(:kept))))
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 writer)))
      (dolist (pair '((2 0) (4 0) (0 2) (1 0) (0 1)))
        ;; FI quiescente: malformazione del canale fuori dal handler C1.
        (setf (arcdocdb.scheduler::porta-worker-pool-request port) (first pair)
              (arcdocdb.scheduler::porta-worker-pool-ack port) (second pair))
        (pool-claim-refusal port 'invariant-violation :pool-port-state (list writer))
        (is (null (arcdocdb.execution:errore-worker-writer context))))
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 1
            (arcdocdb.scheduler::porta-worker-pool-ack port) 1)
      (pool-claim-check port writer :claimed 0 :unchanged)
      (arcdocdb.execution.tests::worker-complete-one context writer :kept))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-004 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-retirement-ack-cas-conflict-cannot-take-a-ready-writer
  (multiple-value-bind (port context ready) (pool-claim-local)
    (let* ((writer (pool-claim-writer '(:kept)))
           (saved (fdefinition 'arcdocdb.scheduler::%pool-ack-command)) (calls 0))
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 writer)))
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
      ;; FI quiescente: invochiamo il vero CAS con OLD errato, senza mutare ACK.
      (pool-claim-function-fi
       'arcdocdb.scheduler::%pool-ack-command
       (lambda (value old word) (incf calls) (funcall saved value (+ old 2) word))
       (lambda () (pool-claim-refusal port 'invariant-violation :pool-port-state (list writer))))
      (is (= 1 calls)) (is (null (arcdocdb.execution:errore-worker-writer context)))
      (pool-claim-check port nil :inactive 0 :retired)
      (arcdocdb.execution.tests::worker-check-claim context writer :claimed 0)
      (arcdocdb.execution.tests::worker-complete-one context writer :kept))))

;;; REQ: REQ-CON-001 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-active-empty-and-busy-preserve-c1-cursor-rotation
  (multiple-value-bind (port context ready) (pool-claim-local :shards 3 :start 1)
    (pool-claim-check port nil :empty 2 :unchanged)
    (let* ((writer (pool-claim-writer '(:busy-kept)))
           (partition (arcdocdb.execution.tests::ready-test-partition ready 2)))
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 writer)))
      (arcdocdb.execution.tests::ready-call-with-guards
       (list partition) (lambda () (pool-claim-check port nil :busy 0 :unchanged)))
      (pool-claim-check port writer :claimed 0 :unchanged)
      (arcdocdb.execution.tests::worker-complete-one context writer :busy-kept)
      (pool-claim-check port nil :empty 1 :unchanged))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-pending-retire-waits-for-bridge-batch-and-explicit-handoff
  (let* ((workers (list (lifecycle-fixture-start t) (lifecycle-fixture-start t)))
         (controller (crea-controllore-pool 1 :initial 2 :dwell 500))
         (registry (arcdocdb.scheduler:crea-registro-pool controller (lifecycle-ports workers)))
         (worker (second workers)) (file nil) (writer nil) (link nil) (token nil) (batch nil))
    (unwind-protect
         (progn
           (lifecycle-call
            worker (lambda (owned)
                     (multiple-value-bind (serie resource) (pool-claim-series 71)
                       (setf file resource writer (pool-claim-writer '(:first :second)))
                       (let ((context (lifecycle-fixture-context owned)))
                         (is (= 1 (arcdocdb.execution:pubblica-writer-pronto
                                   (pool-claim-ready context) 0 writer)))
                         (pool-claim-check (lifecycle-fixture-port owned) writer :claimed 0 :unchanged)
                         (setf link (arcdocdb.execution.series:crea-collegamento-worker-serie
                                     context writer serie)
                               token (pool-claim-bridge-begin link)
                               batch (pool-claim-bridge-pop link token :first)))) :ok))
           (lifecycle-start-retirement controller registry)
           (lifecycle-call
            worker (lambda (owned)
                     (let ((port (lifecycle-fixture-port owned))
                           (context (lifecycle-fixture-context owned)))
                       (pool-claim-refusal port 'resource-exhausted :worker-state (list writer))
                       (is (null (arcdocdb.execution.series:conferma-worker-serie link token batch)))
                       (is (eq :schedule (arcdocdb.execution.series:termina-worker-serie link token)))
                       (pool-claim-refusal port 'resource-exhausted :worker-state (list writer))
                       (multiple-value-bind (obligation home) (arcdocdb.execution:cede-writer-worker context)
                         (is (eq writer obligation)) (is (= 0 home))
                         (is (= 1 (arcdocdb.execution:pubblica-writer-pronto
                                   (pool-claim-ready context) home obligation))))
                       (pool-claim-check port nil :inactive 0 :retired)
                       ;; Un altro claim C4 completa l'obbligo esplicitamente trasferito.
                       (arcdocdb.execution.tests::worker-check-claim context writer :claimed 0)
                       (arcdocdb.execution.tests::worker-complete-one context writer :second)) :ok))
           (is (equal '(1 1 nil) (lifecycle-registry-state registry))))
      (when file (lifecycle-call worker (lambda (owned) (declare (ignore owned))
                                         (arcdocdb.io:chiudi file) :ok)))
      (lifecycle-fixtures-stop workers))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-full-recycle-keeps-claimed-and-routes-new-writer-before-retire
  (multiple-value-bind (port context ready) (pool-claim-local)
    (multiple-value-bind (left left-file) (pool-claim-series 72)
      (multiple-value-bind (right right-file) (pool-claim-series 73)
        (unwind-protect
             (let* ((a (pool-claim-writer '(:a1 :a2) 0)) (b (pool-claim-writer '(:b) 1))
                    (registry (arcdocdb.execution.series:crea-registro-worker-serie
                               (vector a b) (vector left right)))
                    (table (arcdocdb.execution.series:crea-tabella-worker-serie context registry)))
               (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 a)))
               (pool-claim-check port a :claimed 0 :unchanged)
               (let* ((first-link (arcdocdb.execution.series:collega-writer-worker-serie table))
                      (token (pool-claim-bridge-begin first-link)))
                 (is (null (arcdocdb.execution.series:conferma-worker-serie
                            first-link token (pool-claim-bridge-pop first-link token :a1))))
                 (is (eq :schedule (arcdocdb.execution.series:termina-worker-serie first-link token)))
                 (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 b)))
                 ;; FI quiescente: comando arriva durante l'obbligo RESCHEDULE.
                 (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
                 (arcdocdb.execution.tests::worker-check-recycle context b :claimed 1)
                 (pool-claim-refusal port 'resource-exhausted :worker-state (list a b))
                 (let* ((next-link (arcdocdb.execution.series:collega-writer-worker-serie table))
                        (next-token (pool-claim-bridge-begin next-link)))
                   (is (not (eq first-link next-link)))
                   ;; B possiede soltanto la seconda Serie; la prima resta acquisibile.
                   (let ((lease (arcdocdb.series:acquisisci-controllore-serie left)))
                     (is (plusp lease)) (arcdocdb.series:rilascia-controllore-serie left lease))
                   (signals resource-exhausted (arcdocdb.series:acquisisci-controllore-serie right) :serie-busy)
                   (is (null (arcdocdb.execution.series:conferma-worker-serie
                              next-link next-token (pool-claim-bridge-pop next-link next-token :b))))
                   (is (eq :idle (arcdocdb.execution.series:termina-worker-serie next-link next-token))))
                 (pool-claim-check port nil :inactive 0 :retired)
                 (arcdocdb.execution.tests::worker-check-claim context a :claimed 0)
                 (arcdocdb.execution.tests::worker-complete-one context a :a2)))
          (arcdocdb.io:chiudi right-file) (arcdocdb.io:chiudi left-file))))))
")
  (:PATH
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-claim-tests/source-attempt-03.lisp")
   :BYTES 22728 :SHA256 "f968d57b6ff4dfc3cc31f1b1979afa896d95435093406b36320800783629901f"
   :GIT-BLOB "f636ee873deb2cd5347a50c9aec4a6afa16d13c5" :TEXT
   ";;;; Claim ammesso dal pool soltanto alla barriera C1 IDLE, senza revoca di compiti.
;;;; OWNER: porta, contesto e bridge sul thread creatore; coordinator delle fixture distinto.
;;;; FI quiescenti: immagini, parole corrotte e sostituzioni temporanee sempre ripristinate.
;;;; Le fixture Serie usano il backend pubblico e non dipendono da tests/series.
(in-package #:arcdocdb.scheduler.tests)

(defun pool-claim-check (port writer status cursor action)
  \"Oracolo dei quattro valori pubblici; identita writer e cursore sono attesi dal caller.\"
  (is (equal (list writer status cursor action)
             (multiple-value-list (arcdocdb.scheduler:prendi-writer-pool port)))))

(defun pool-claim-ready (context)
  (arcdocdb.execution::contesto-worker-writer-ready context))

(defun pool-claim-image (port &optional writers)
  \"Immagine FI bounded, solo per dimostrare l'assenza di mutazioni sui rifiuti.\"
  (let* ((context (arcdocdb.scheduler::porta-worker-pool-context port))
         (ready (pool-claim-ready context)))
    (list (lifecycle-words port) (lifecycle-context-state context)
          (map 'list #'arcdocdb.execution.tests::ready-fi-snapshot
               (arcdocdb.execution::lista-writer-pronti-partitions ready))
          (mapcar #'arcdocdb.execution.tests::handoff-fi-snapshot writers))))

(defun pool-claim-refusal (port type reason &optional writers)
  (let ((before (pool-claim-image port writers)))
    (arcdocdb.execution.tests::worker-capture-condition
     (lambda () (arcdocdb.scheduler:prendi-writer-pool port)) type reason)
    (is (equalp before (pool-claim-image port writers)))))

(defun pool-claim-local (&key (active t) (shards 1) (capacity 1) (start 0))
  (let* ((ready (arcdocdb.execution:crea-lista-writer-pronti
                 :shards shards :capacity capacity))
         (context (arcdocdb.execution:crea-contesto-worker-writer ready :start start)))
    (values (arcdocdb.scheduler:crea-porta-worker-pool context :active active) context ready)))

(defun pool-claim-writer (items &optional (ordinal 0))
  (let ((writer (arcdocdb.execution:crea-writer-programmabile
                 :capacity 4 :quantum 1 :routing-index ordinal)))
    (loop for item in items for count from 1
          do (arcdocdb.execution.tests::handoff-check-enqueue
              writer item count (if (= count 1) :schedule :queued)))
    writer))

(defun pool-claim-function-fi (name replacement thunk)
  \"FI quiescente: nessun worker esegue NAME durante la sostituzione della fixture.\"
  (let ((saved (fdefinition name)))
    (unwind-protect (progn (setf (fdefinition name) replacement) (funcall thunk))
      (setf (fdefinition name) saved))))

(defun pool-claim-series (id)
  \"Controller reale su backend C4 in memoria; nessun I/O richiesto dai compiti della prova.\"
  (let* ((backend (arcdocdb.io:make-backend
                   (lambda (path mode) (declare (ignore path mode)) id)
                   (lambda (&rest arguments) (declare (ignore arguments))
                     (error \"Lettura I/O inattesa nella fixture pool.\"))
                   (lambda (fd bytes start count) (declare (ignore fd bytes start)) count)
                   (lambda (fd) (declare (ignore fd)) 0)
                   (lambda (fd) (declare (ignore fd)) 0)
                   (lambda (fd) (declare (ignore fd)) 0)))
         (file (arcdocdb.io:crea-temporaneo \"pool-claim-series.tmp\" :backend backend))
         (log (arcdocdb.wal:crea-log-io file :segment id)))
    (values (arcdocdb.series:crea-controllore-serie
             (arcdocdb.csn:crea-registro-csn :capacity 4) log :capacity 2)
            file)))

(defun pool-claim-bridge-begin (link)
  (multiple-value-bind (token status reason) (arcdocdb.execution.series:inizia-worker-serie link)
    (is (plusp token)) (is (eq :active status)) (is (null reason)) token))

(defun pool-claim-bridge-pop (link token item)
  (let ((target (vector :left :untouched :right)))
    (multiple-value-bind (count status batch)
        (arcdocdb.execution.series:preleva-worker-serie link token target 1 2)
      (is (= 1 count)) (is (eq :messages status)) (is (plusp batch))
      (is (eq :left (svref target 0))) (is (eq item (svref target 1)))
      (is (eq :right (svref target 2))) batch)))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-inactive-claim-keeps-real-ready-obligation-and-cursor
  (multiple-value-bind (port context ready) (pool-claim-local :active nil :shards 3 :start 2)
    (let ((writer (pool-claim-writer '(:kept))))
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 writer)))
      (let ((before (pool-claim-image port (list writer))))
        ;; La sentinella FI distingue assenza di scansione da scansione senza pop.
        (pool-claim-function-fi
         'arcdocdb.execution::%prova-pronta
         (lambda (partition) (declare (ignore partition)) (error \"Scansione di worker inattivo.\"))
         (lambda () (dotimes (attempt 2) (pool-claim-check port nil :inactive 2 :unchanged))))
        (is (equalp before (pool-claim-image port (list writer)))))
      (arcdocdb.execution.tests::worker-check-claim context writer :claimed 1)
      (arcdocdb.execution.tests::worker-complete-one context writer :kept))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-THR-001-pool-real-grow-acknowledges-before-taking-ready-writer
  (let* ((workers (list (lifecycle-fixture-start t) (lifecycle-fixture-start nil)))
         (registry (arcdocdb.scheduler:crea-registro-pool
                    (crea-controllore-pool 1 :dwell 500) (lifecycle-ports workers)))
         (worker (second workers)) (writer nil))
    (unwind-protect
         (progn
           (lifecycle-call worker
                           (lambda (owned)
                             (setf writer (pool-claim-writer '(:activated)))
                             (is (= 1 (arcdocdb.execution:pubblica-writer-pronto
                                       (pool-claim-ready (lifecycle-fixture-context owned)) 0 writer)))
                             (pool-claim-check (lifecycle-fixture-port owned) nil :inactive 0 :unchanged)
                             :ok))
           (lifecycle-check-update registry 0 8 0 0 1 :hold 1 nil)
           (lifecycle-check-update registry 500 8 0 0 2 :grow 1 t)
           (lifecycle-call worker
                           (lambda (owned)
                             (pool-claim-check (lifecycle-fixture-port owned) writer :claimed 0 :activated)
                             (arcdocdb.execution.tests::worker-complete-one
                              (lifecycle-fixture-context owned) writer :activated) :ok))
           (is (equal '(2 2 nil) (lifecycle-registry-state registry))))
      (lifecycle-fixtures-stop workers))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-THR-001-pool-real-shrink-retires-before-removing-ready-writer
  (let* ((workers (list (lifecycle-fixture-start t) (lifecycle-fixture-start t)))
         (controller (crea-controllore-pool 1 :initial 2 :dwell 500))
         (registry (arcdocdb.scheduler:crea-registro-pool controller (lifecycle-ports workers))))
    (unwind-protect
         (progn
           (lifecycle-start-retirement controller registry)
           (lifecycle-call
            (second workers)
            (lambda (owned)
              (let* ((port (lifecycle-fixture-port owned)) (context (lifecycle-fixture-context owned))
                     (ready (pool-claim-ready context)) (writer (pool-claim-writer '(:retained))))
                (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 writer)))
                (let ((queue-before (arcdocdb.execution.tests::ready-fi-snapshot
                                     (arcdocdb.execution.tests::ready-test-partition ready 0)))
                      (context-before (lifecycle-context-state context))
                      (writer-before (arcdocdb.execution.tests::handoff-fi-snapshot writer)))
                  (pool-claim-check port nil :inactive 0 :retired)
                  (is (equalp queue-before (arcdocdb.execution.tests::ready-fi-snapshot
                                            (arcdocdb.execution.tests::ready-test-partition ready 0))))
                  (is (equal context-before (lifecycle-context-state context)))
                  (is (equalp writer-before (arcdocdb.execution.tests::handoff-fi-snapshot writer))))
                (pool-claim-check port nil :inactive 0 :unchanged)
                ;; Cleanup C4: trasferisce esplicitamente l'obbligo rimasto nel ring.
                (arcdocdb.execution.tests::worker-check-claim context writer :claimed 0)
                (arcdocdb.execution.tests::worker-complete-one context writer :retained)) :ok))
           (is (equal '(1 1 nil) (lifecycle-registry-state registry))))
      (lifecycle-fixtures-stop workers))))

;;; REQ: REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-foreign-owner-rejection-precedes-phase-and-word-checks
  (let ((worker (lifecycle-fixture-start nil)))
    (unwind-protect
         (let* ((port (lifecycle-fixture-port worker)) (context (lifecycle-fixture-context worker)))
           ;; FI quiescente dopo il ritorno della barriera: entrambi i livelli invalidi.
           (setf (arcdocdb.scheduler::porta-worker-pool-request port) 4
                 (arcdocdb.execution::contesto-worker-writer-state context) :faulted)
           (pool-claim-refusal port 'invalid-argument :pool-worker-owner))
      (lifecycle-fixtures-stop (list worker)))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-004-pool-every-nonidle-phase-refuses-before-inactive-or-debt-validation
  (multiple-value-bind (port context ready) (pool-claim-local :active nil)
    (declare (ignore ready))
    (let ((writer (pool-claim-writer '(:obligation)))
          (original (make-condition 'invariant-violation :reason :worker-state)))
      ;; FI quiescente: debiti e fault deliberatamente incompatibili con alcune fasi.
      ;; Il gate fuori IDLE deve conservarli, senza validazione, ACK o poisoning C1.
      (setf (arcdocdb.execution::contesto-worker-writer-writer context) writer
            (arcdocdb.execution::contesto-worker-writer-lease context) 7
            (arcdocdb.execution::contesto-worker-writer-pending context) 2
            (arcdocdb.execution::contesto-worker-writer-batch-generation context) 9
            (arcdocdb.execution::contesto-worker-writer-fault context) original)
      (dolist (phase '(:claimed :running :batch :finishing :reschedule :faulted))
        (setf (arcdocdb.execution::contesto-worker-writer-state context) phase)
        (pool-claim-refusal port 'resource-exhausted :worker-state (list writer))
        (is (eq original (arcdocdb.execution:errore-worker-writer context)))))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-004 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-idle-inconsistency-refuses-retirement-ack-and-c1-poisoning
  (multiple-value-bind (port context ready) (pool-claim-local)
    (declare (ignore ready))
    (let ((writer (pool-claim-writer '(:kept))))
      ;; FI: un singolo campo IDLE corrotto, anche con porta senza comando pendente.
      (dolist (pair '((1 1) (0 0) (2 1) (3 0)))
        (setf (arcdocdb.scheduler::porta-worker-pool-request port) (first pair)
              (arcdocdb.scheduler::porta-worker-pool-ack port) (second pair))
        (dolist (slot '(arcdocdb.execution::cursor arcdocdb.execution::home
                        arcdocdb.execution::writer arcdocdb.execution::lease
                        arcdocdb.execution::pending arcdocdb.execution::fault))
          (let ((saved (slot-value context slot))
                (bad (case slot
                       (arcdocdb.execution::writer writer)
                       (arcdocdb.execution::fault
                        (make-condition 'invariant-violation :reason :worker-state))
                       (otherwise 1))))
            (unwind-protect
                 (progn (setf (slot-value context slot) bad)
                        (pool-claim-refusal port 'invariant-violation :worker-state (list writer)))
              (setf (slot-value context slot) saved)))))
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2
            (arcdocdb.scheduler::porta-worker-pool-ack port) 1)
      (pool-claim-check port nil :inactive 0 :retired)
      (is (null (arcdocdb.execution:errore-worker-writer context))))))

;;; REQ: REQ-CON-001 REQ-CON-004 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-corrupt-word-protocol-preserves-ready-and-local-worker
  (multiple-value-bind (port context ready) (pool-claim-local)
    (let ((writer (pool-claim-writer '(:kept))))
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 writer)))
      (dolist (pair '((2 0) (4 0) (0 2) (1 0) (0 1)))
        ;; FI quiescente: malformazione del canale fuori dal handler C1.
        (setf (arcdocdb.scheduler::porta-worker-pool-request port) (first pair)
              (arcdocdb.scheduler::porta-worker-pool-ack port) (second pair))
        (pool-claim-refusal port 'invariant-violation :pool-port-state (list writer))
        (is (null (arcdocdb.execution:errore-worker-writer context))))
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 1
            (arcdocdb.scheduler::porta-worker-pool-ack port) 1)
      (pool-claim-check port writer :claimed 0 :unchanged)
      (arcdocdb.execution.tests::worker-complete-one context writer :kept))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-004 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-retirement-ack-cas-conflict-cannot-take-a-ready-writer
  (multiple-value-bind (port context ready) (pool-claim-local)
    (let* ((writer (pool-claim-writer '(:kept)))
           (saved (fdefinition 'arcdocdb.scheduler::%pool-ack-command)) (calls 0))
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 writer)))
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
      ;; FI quiescente: invochiamo il vero CAS con OLD errato, senza mutare ACK.
      (pool-claim-function-fi
       'arcdocdb.scheduler::%pool-ack-command
       (lambda (value old word) (incf calls) (funcall saved value (+ old 2) word))
       (lambda () (pool-claim-refusal port 'invariant-violation :pool-port-state (list writer))))
      (is (= 1 calls)) (is (null (arcdocdb.execution:errore-worker-writer context)))
      (pool-claim-check port nil :inactive 0 :retired)
      (arcdocdb.execution.tests::worker-check-claim context writer :claimed 0)
      (arcdocdb.execution.tests::worker-complete-one context writer :kept))))

;;; REQ: REQ-CON-001 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-active-empty-and-busy-preserve-c1-cursor-rotation
  (multiple-value-bind (port context ready) (pool-claim-local :shards 3 :start 1)
    (pool-claim-check port nil :empty 2 :unchanged)
    (let* ((writer (pool-claim-writer '(:busy-kept)))
           (partition (arcdocdb.execution.tests::ready-test-partition ready 2)))
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 writer)))
      (arcdocdb.execution.tests::ready-call-with-guards
       (list partition) (lambda () (pool-claim-check port nil :busy 0 :unchanged)))
      (pool-claim-check port writer :claimed 0 :unchanged)
      (arcdocdb.execution.tests::worker-complete-one context writer :busy-kept)
      (pool-claim-check port nil :empty 1 :unchanged))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-THR-001-pool-retire-after-active-sample-permits-one-last-complete-task
  (multiple-value-bind (port context ready) (pool-claim-local)
    (let* ((writer (pool-claim-writer '(:last)))
           (saved (fdefinition 'arcdocdb.scheduler:applica-stato-worker-pool)) (calls 0))
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 writer)))
      ;; FI quiescente al confine: pubblicazione dopo la lettura attiva, prima del pop.
      ;; Lo stesso ordinamento puo avvenire dal vero coordinator concorrente.
      (pool-claim-function-fi
       'arcdocdb.scheduler:applica-stato-worker-pool
       (lambda (value)
         (multiple-value-bind (active action) (funcall saved value)
           (incf calls) (is active) (is (eq :unchanged action))
           (setf (arcdocdb.scheduler::porta-worker-pool-request value) 2)
           (values active action)))
       (lambda () (pool-claim-check port writer :claimed 0 :unchanged)))
      (is (= 1 calls)) (is (equal '(2 1 nil) (lifecycle-words port)))
      (pool-claim-refusal port 'resource-exhausted :worker-state (list writer))
      (arcdocdb.execution.tests::worker-complete-one context writer :last)
      (pool-claim-check port nil :inactive 0 :retired)
      (is (equal '(2 2 nil) (lifecycle-words port))))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-pending-retire-waits-for-bridge-batch-and-explicit-handoff
  (let* ((workers (list (lifecycle-fixture-start t) (lifecycle-fixture-start t)))
         (controller (crea-controllore-pool 1 :initial 2 :dwell 500))
         (registry (arcdocdb.scheduler:crea-registro-pool controller (lifecycle-ports workers)))
         (worker (second workers)) (file nil) (writer nil) (link nil) (token nil) (batch nil))
    (unwind-protect
         (progn
           (lifecycle-call
            worker (lambda (owned)
                     (multiple-value-bind (serie resource) (pool-claim-series 71)
                       (setf file resource writer (pool-claim-writer '(:first :second)))
                       (let ((context (lifecycle-fixture-context owned)))
                         (is (= 1 (arcdocdb.execution:pubblica-writer-pronto
                                   (pool-claim-ready context) 0 writer)))
                         (pool-claim-check (lifecycle-fixture-port owned) writer :claimed 0 :unchanged)
                         (setf link (arcdocdb.execution.series:crea-collegamento-worker-serie
                                     context writer serie)
                               token (pool-claim-bridge-begin link)
                               batch (pool-claim-bridge-pop link token :first)))) :ok))
           (lifecycle-start-retirement controller registry)
           (lifecycle-call
            worker (lambda (owned)
                     (let ((port (lifecycle-fixture-port owned))
                           (context (lifecycle-fixture-context owned)))
                       (pool-claim-refusal port 'resource-exhausted :worker-state (list writer))
                       (is (null (arcdocdb.execution.series:conferma-worker-serie link token batch)))
                       (is (eq :schedule (arcdocdb.execution.series:termina-worker-serie link token)))
                       (pool-claim-refusal port 'resource-exhausted :worker-state (list writer))
                       (multiple-value-bind (obligation home) (arcdocdb.execution:cede-writer-worker context)
                         (is (eq writer obligation)) (is (= 0 home))
                         (is (= 1 (arcdocdb.execution:pubblica-writer-pronto
                                   (pool-claim-ready context) home obligation))))
                       (pool-claim-check port nil :inactive 0 :retired)
                       ;; Un altro claim C4 completa l'obbligo esplicitamente trasferito.
                       (arcdocdb.execution.tests::worker-check-claim context writer :claimed 0)
                       (arcdocdb.execution.tests::worker-complete-one context writer :second)) :ok))
           (is (equal '(1 1 nil) (lifecycle-registry-state registry))))
      (when file (lifecycle-call worker (lambda (owned) (declare (ignore owned))
                                         (arcdocdb.io:chiudi file) :ok)))
      (lifecycle-fixtures-stop workers))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-full-recycle-keeps-claimed-and-routes-new-writer-before-retire
  (multiple-value-bind (port context ready) (pool-claim-local)
    (multiple-value-bind (left left-file) (pool-claim-series 72)
      (multiple-value-bind (right right-file) (pool-claim-series 73)
        (unwind-protect
             (let* ((a (pool-claim-writer '(:a1 :a2) 0)) (b (pool-claim-writer '(:b) 1))
                    (registry (arcdocdb.execution.series:crea-registro-worker-serie
                               (vector a b) (vector left right)))
                    (table (arcdocdb.execution.series:crea-tabella-worker-serie context registry)))
               (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 a)))
               (pool-claim-check port a :claimed 0 :unchanged)
               (let* ((first-link (arcdocdb.execution.series:collega-writer-worker-serie table))
                      (token (pool-claim-bridge-begin first-link)))
                 (is (null (arcdocdb.execution.series:conferma-worker-serie
                            first-link token (pool-claim-bridge-pop first-link token :a1))))
                 (is (eq :schedule (arcdocdb.execution.series:termina-worker-serie first-link token)))
                 (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 b)))
                 ;; FI quiescente: comando arriva durante l'obbligo RESCHEDULE.
                 (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
                 (arcdocdb.execution.tests::worker-check-recycle context b :claimed 1)
                 (pool-claim-refusal port 'resource-exhausted :worker-state (list a b))
                 (let* ((next-link (arcdocdb.execution.series:collega-writer-worker-serie table))
                        (next-token (pool-claim-bridge-begin next-link)))
                   (is (not (eq first-link next-link)))
                   ;; B possiede soltanto la seconda Serie; la prima resta acquisibile.
                   (let ((lease (arcdocdb.series:acquisisci-controllore-serie left)))
                     (is (plusp lease)) (arcdocdb.series:rilascia-controllore-serie left lease))
                   (signals resource-exhausted (arcdocdb.series:acquisisci-controllore-serie right) :serie-busy)
                   (is (null (arcdocdb.execution.series:conferma-worker-serie
                              next-link next-token (pool-claim-bridge-pop next-link next-token :b))))
                   (is (eq :idle (arcdocdb.execution.series:termina-worker-serie next-link next-token))))
                 (pool-claim-check port nil :inactive 0 :retired)
                 (arcdocdb.execution.tests::worker-check-claim context a :claimed 0)
                 (arcdocdb.execution.tests::worker-complete-one context a :a2)))
          (arcdocdb.io:chiudi right-file) (arcdocdb.io:chiudi left-file))))))
")
  (:PATH
   #A((104) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/pool-claim-fullcheck-attempt-01.log")
   :BYTES 138 :SHA256 "45380e3e2659c2c408528e9ce25fca5e3bf3fcaabcf8c9d7284bccf547aba04f" :GIT-BLOB
   "ea78fb7d4eb3ee084a64cb12c2458653edfdec02" :TEXT
   ":OK: make check-core; record: /private/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/4000913331-command-73208-0/report.lisp
")
  (:PATH
   #A((116) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/pool-claim-measure/bench-attempt-01/report.lisp")
   :BYTES 73535 :SHA256 "5dc454f4977f1b51a5fbc4db6c70ed8e7dc97c10c10d749d042787136be77aa7"
   :GIT-BLOB "9ffbbe438b3ccfcd67d21ad10905f5a84c299b48" :TEXT
   "(:SCHEMA-VERSION 1 :KIND :POOL-CLAIM-BENCHMARK :STATUS :OK :STAGE :COMPLETE
 :DIAGNOSTIC NIL :PROCESS-ARGV
 (#A((48) BASE-CHAR . \"/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl\")
  #A((7) BASE-CHAR . \"--bench\")
  #A((47) BASE-CHAR . \"spikes/out/pool-claim-measure/bench-attempt-01/\"))
 :TOOL-ARGUMENTS
 (#A((7) BASE-CHAR . \"--bench\")
  #A((47) BASE-CHAR . \"spikes/out/pool-claim-measure/bench-attempt-01/\"))
 :SOURCE-FINGERPRINTS-BEFORE
 ((:FILE \"arcdocdb.asd\" :MD5
   #A((32) BASE-CHAR . \"c436b96a4bb19da43b197e0c10fbf45c\"))
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
  (:FILE \"src/csn/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1130012fc5613a5648d22ed8628be0e8\"))
  (:FILE \"src/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1cdb5661fc54beba5bf00e4765f3235\"))
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
   #A((32) BASE-CHAR . \"894f6e238fe4047f2bf607fceae86846\"))
  (:FILE \"src/get-directory/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"74a694385f1aaf03ec87721545494119\"))
  (:FILE \"src/get-directory/sources-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"2b8193aab6801de19e26fa55e7c53f87\"))
  (:FILE \"src/get-directory/sources-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"b846a6348ff7d4b5f7b380b5b3ff8c17\"))
  (:FILE \"src/get-directory/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"17c957d6934a31f4ed64313e756de2d2\"))
  (:FILE \"src/get-resolver/active-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"c65593cf172f53a8e90a853bbe9504c2\"))
  (:FILE \"src/get-resolver/active-directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"6d95f29b331d335175843f47ae44a6ea\"))
  (:FILE \"src/get-resolver/active-preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"f13d422adb6aa9e8489352884137f25a\"))
  (:FILE \"src/get-resolver/active-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"521737861e057d663964b0c030552587\"))
  (:FILE \"src/get-resolver/active-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6aaec49504a96f37c8ff1bc182c977b\"))
  (:FILE \"src/get-resolver/active-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"bd7182e9871fe82530d0c828e473ccde\"))
  (:FILE \"src/get-resolver/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"bbfb2082103e6712419e180ab972245c\"))
  (:FILE \"src/get-resolver/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"6226d131f5562a475048b6444049c4ca\"))
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
   #A((32) BASE-CHAR . \"06ea105db71f021ea60b2c59645273b4\"))
  (:FILE \"src/io/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"11c7103efbe733bbf0a13927f23c3d34\"))
  (:FILE \"src/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"58030bc0c811248a6537e2909d8762d6\"))
  (:FILE \"src/io/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"8ad95e22e31444161b81d2eb23e552ff\"))
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
   #A((32) BASE-CHAR . \"59e3c59c90d8d0fc5731b87496a785aa\"))
  (:FILE \"src/series/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"056d2c6a67c9d9f2bf9fe2d2c348d53c\"))
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
   #A((32) BASE-CHAR . \"3e565b431b88fb5211023601b5e3ce3b\"))
  (:FILE \"tests/get-directory/series-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"8d7ed4f8d3f9e8394b15c648a3a4507b\"))
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
  (:FILE \"tests/scheduler/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"1388f446bce5085439c2254edd165118\"))
  (:FILE \"tests/scheduler/pool-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"aaba914dea485f812a11767addb94c81\"))
  (:FILE \"tests/scheduler/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"34e51e369859bc1c731d73e43053b6f4\"))
  (:FILE \"tests/series/boundaries.lisp\" :MD5
   #A((32) BASE-CHAR . \"6967c7e6396b6df38c637f2d5d9ebfc0\"))
  (:FILE \"tests/series/controller.lisp\" :MD5
   #A((32) BASE-CHAR . \"179fc8c8f9021b3e10d982be12215a01\"))
  (:FILE \"tests/series/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"ce845c57c825657e95c105d4a8fbfe9a\"))
  (:FILE \"tests/series/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"d581e4d3087fb92a47e80b7c32d877ae\"))
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
  (:FILE \"tools/measure-pool-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"9329f449267f4b536c405d91dbe1a09b\")))
 :SOURCE-FINGERPRINTS-AFTER
 ((:FILE \"arcdocdb.asd\" :MD5
   #A((32) BASE-CHAR . \"c436b96a4bb19da43b197e0c10fbf45c\"))
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
  (:FILE \"src/csn/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"1130012fc5613a5648d22ed8628be0e8\"))
  (:FILE \"src/csn/registry.lisp\" :MD5
   #A((32) BASE-CHAR . \"a1cdb5661fc54beba5bf00e4765f3235\"))
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
   #A((32) BASE-CHAR . \"894f6e238fe4047f2bf607fceae86846\"))
  (:FILE \"src/get-directory/read.lisp\" :MD5
   #A((32) BASE-CHAR . \"74a694385f1aaf03ec87721545494119\"))
  (:FILE \"src/get-directory/sources-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"2b8193aab6801de19e26fa55e7c53f87\"))
  (:FILE \"src/get-directory/sources-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"b846a6348ff7d4b5f7b380b5b3ff8c17\"))
  (:FILE \"src/get-directory/types.lisp\" :MD5
   #A((32) BASE-CHAR . \"17c957d6934a31f4ed64313e756de2d2\"))
  (:FILE \"src/get-resolver/active-build.lisp\" :MD5
   #A((32) BASE-CHAR . \"c65593cf172f53a8e90a853bbe9504c2\"))
  (:FILE \"src/get-resolver/active-directory.lisp\" :MD5
   #A((32) BASE-CHAR . \"6d95f29b331d335175843f47ae44a6ea\"))
  (:FILE \"src/get-resolver/active-preflight.lisp\" :MD5
   #A((32) BASE-CHAR . \"f13d422adb6aa9e8489352884137f25a\"))
  (:FILE \"src/get-resolver/active-read.lisp\" :MD5
   #A((32) BASE-CHAR . \"521737861e057d663964b0c030552587\"))
  (:FILE \"src/get-resolver/active-scan.lisp\" :MD5
   #A((32) BASE-CHAR . \"d6aaec49504a96f37c8ff1bc182c977b\"))
  (:FILE \"src/get-resolver/active-types.lisp\" :MD5
   #A((32) BASE-CHAR . \"bd7182e9871fe82530d0c828e473ccde\"))
  (:FILE \"src/get-resolver/build.lisp\" :MD5
   #A((32) BASE-CHAR . \"bbfb2082103e6712419e180ab972245c\"))
  (:FILE \"src/get-resolver/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"6226d131f5562a475048b6444049c4ca\"))
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
   #A((32) BASE-CHAR . \"06ea105db71f021ea60b2c59645273b4\"))
  (:FILE \"src/io/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"11c7103efbe733bbf0a13927f23c3d34\"))
  (:FILE \"src/io/native.lisp\" :MD5
   #A((32) BASE-CHAR . \"58030bc0c811248a6537e2909d8762d6\"))
  (:FILE \"src/io/package.lisp\" :MD5
   #A((32) BASE-CHAR . \"8ad95e22e31444161b81d2eb23e552ff\"))
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
   #A((32) BASE-CHAR . \"59e3c59c90d8d0fc5731b87496a785aa\"))
  (:FILE \"src/series/publication.lisp\" :MD5
   #A((32) BASE-CHAR . \"056d2c6a67c9d9f2bf9fe2d2c348d53c\"))
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
   #A((32) BASE-CHAR . \"3e565b431b88fb5211023601b5e3ce3b\"))
  (:FILE \"tests/get-directory/series-support.lisp\" :MD5
   #A((32) BASE-CHAR . \"8d7ed4f8d3f9e8394b15c648a3a4507b\"))
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
  (:FILE \"tests/scheduler/lifecycle.lisp\" :MD5
   #A((32) BASE-CHAR . \"1388f446bce5085439c2254edd165118\"))
  (:FILE \"tests/scheduler/pool-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"aaba914dea485f812a11767addb94c81\"))
  (:FILE \"tests/scheduler/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"34e51e369859bc1c731d73e43053b6f4\"))
  (:FILE \"tests/series/boundaries.lisp\" :MD5
   #A((32) BASE-CHAR . \"6967c7e6396b6df38c637f2d5d9ebfc0\"))
  (:FILE \"tests/series/controller.lisp\" :MD5
   #A((32) BASE-CHAR . \"179fc8c8f9021b3e10d982be12215a01\"))
  (:FILE \"tests/series/support.lisp\" :MD5
   #A((32) BASE-CHAR . \"ce845c57c825657e95c105d4a8fbfe9a\"))
  (:FILE \"tests/series/threads.lisp\" :MD5
   #A((32) BASE-CHAR . \"d581e4d3087fb92a47e80b7c32d877ae\"))
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
  (:FILE \"tools/measure-pool-claim.lisp\" :MD5
   #A((32) BASE-CHAR . \"9329f449267f4b536c405d91dbe1a09b\")))
 :SOURCE-CONSISTENCY :STABLE :RECORDED-AT 4000913400 :SELF-TEST
 (:STATUS :OK :SHARED-SENSOR
  (:STATUS :OK :BASELINE
   (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096 :WARMUP-ITERATIONS
    128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS 37 :SECONDS 3.7d-5
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
    :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 4 :SECONDS 4.0d-6
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
  :FOUR-VALUE-ORACLE :PASSED :CLAIM-CLI-AND-PARTIAL-RAW :PASSED :EMPTY
  (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
   :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 11 :SECONDS 1.1d-5
   :TIME-QUALITY :MEASURED :SINK 54 :DIAGNOSTIC NIL :EXPECTED-SINK 54)
  :INACTIVE
  (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
   :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 4 :SECONDS 4.0d-6
   :TIME-QUALITY :MEASURED :SINK 86 :DIAGNOSTIC NIL :EXPECTED-SINK 86)
  :SWITCH
  (:REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4 :WARMUP-ITERATIONS 0
   :COMPLETED-ITERATIONS 4 :HEAP-BYTES 0 :RAW-TICKS 12 :SECONDS 1.2d-5
   :TIME-QUALITY :MEASURED :SINK 190 :DIAGNOSTIC NIL :EXPECTED-SINK 190))
 :SAMPLES
 ((:CAMPAIGN :EMPTY :REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   4394 :SECONDS 0.004394d0 :TIME-QUALITY :MEASURED :SINK 8435712 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8435712)
  (:CAMPAIGN :EMPTY :REPLICA 1 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   4504 :SECONDS 0.004504d0 :TIME-QUALITY :MEASURED :SINK 8435712 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8435712)
  (:CAMPAIGN :EMPTY :REPLICA 2 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   4476 :SECONDS 0.004476d0 :TIME-QUALITY :MEASURED :SINK 8435712 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8435712)
  (:CAMPAIGN :EMPTY :REPLICA 3 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   4403 :SECONDS 0.004403d0 :TIME-QUALITY :MEASURED :SINK 8435712 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8435712)
  (:CAMPAIGN :EMPTY :REPLICA 4 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   4433 :SECONDS 0.004433d0 :TIME-QUALITY :MEASURED :SINK 8435712 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8435712)
  (:CAMPAIGN :INACTIVE :REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   892 :SECONDS 8.92d-4 :TIME-QUALITY :MEASURED :SINK 8468480 :DIAGNOSTIC NIL
   :EXPECTED-SINK 8468480)
  (:CAMPAIGN :INACTIVE :REPLICA 1 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   912 :SECONDS 9.12d-4 :TIME-QUALITY :MEASURED :SINK 8468480 :DIAGNOSTIC NIL
   :EXPECTED-SINK 8468480)
  (:CAMPAIGN :INACTIVE :REPLICA 2 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   899 :SECONDS 8.99d-4 :TIME-QUALITY :MEASURED :SINK 8468480 :DIAGNOSTIC NIL
   :EXPECTED-SINK 8468480)
  (:CAMPAIGN :INACTIVE :REPLICA 3 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   1069 :SECONDS 0.001069d0 :TIME-QUALITY :MEASURED :SINK 8468480 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8468480)
  (:CAMPAIGN :INACTIVE :REPLICA 4 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   901 :SECONDS 9.01d-4 :TIME-QUALITY :MEASURED :SINK 8468480 :DIAGNOSTIC NIL
   :EXPECTED-SINK 8468480)
  (:CAMPAIGN :SWITCH :REPLICA 0 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   5328 :SECONDS 0.005328d0 :TIME-QUALITY :MEASURED :SINK 8574976 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8574976)
  (:CAMPAIGN :SWITCH :REPLICA 1 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   5355 :SECONDS 0.005355d0 :TIME-QUALITY :MEASURED :SINK 8574976 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8574976)
  (:CAMPAIGN :SWITCH :REPLICA 2 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   5317 :SECONDS 0.005317d0 :TIME-QUALITY :MEASURED :SINK 8574976 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8574976)
  (:CAMPAIGN :SWITCH :REPLICA 3 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   5345 :SECONDS 0.005345d0 :TIME-QUALITY :MEASURED :SINK 8574976 :DIAGNOSTIC
   NIL :EXPECTED-SINK 8574976)
  (:CAMPAIGN :SWITCH :REPLICA 4 :STATUS :OK :STAGE :COMPLETE :ITERATIONS 4096
   :WARMUP-ITERATIONS 128 :COMPLETED-ITERATIONS 4096 :HEAP-BYTES 0 :RAW-TICKS
   5300 :SECONDS 0.0053d0 :TIME-QUALITY :MEASURED :SINK 8574976 :DIAGNOSTIC NIL
   :EXPECTED-SINK 8574976))
 :CURRENT-REPLICA NIL :SBCL #A((5) BASE-CHAR . \"2.6.9\") :MACHINE
 #A((5) BASE-CHAR . \"ARM64\") :OS #A((6) BASE-CHAR . \"Darwin\") :OS-VERSION
 #A((6) BASE-CHAR . \"27.0.0\") :SAFETY 3 :ITERATIONS 4096 :WARMUP 128 :REPLICAS
 5 :TIMER-UNITS-PER-SECOND 1000000 :CAMPAIGNS
 ((:EMPTY :SHARDS 4 :INITIAL-CURSOR 0 :CLAIM-PER-CYCLE 4 :TOKEN 12)
  (:INACTIVE :SHARDS 4 :INITIAL-CURSOR 2 :CLAIM-PER-CYCLE 4 :TOKEN 20)
  (:SWITCH :SHARDS 4 :INITIAL-CURSOR 0 :CLAIM-PER-CYCLE 6 :TOKEN 46
   :ROLES-SERIALIZED T :PRIVATE-REQUEST-FIXTURE T
   :GENERATION-INCREMENTS-PER-CYCLE 2))
 :TOKEN-FORMULA
 \"sample=N*cycle-token+N*(N-1)/2; EMPTY=12; INACTIVE=20; SWITCH=46\" :LIMITS
 (:PREALLOCATED-PRODUCT-AND-INPUTS :STARTUP-AND-GC-EXCLUDED
  :COUNTER-NOT-ABSOLUTE-NONALLOCATION-PROOF :EXTERNAL-LOAD-UNCONTROLLED
  :CLOCK-ZERO-IS-BELOW-RESOLUTION :NO-TIME-THRESHOLD-NO-TUNING-CLAIM
  :EMPTY-IS-LOCAL-OBSERVATION :NO-REAL-QUEUED-CLAIM-MEASURED
  :NO-CONCURRENT-COORDINATOR-OR-PHYSICAL-WORKER-LIFECYCLE-QUALIFICATION))
")
  (:PATH
   #A((114) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/pool-claim-measure/claim-coverage-reader.lisp")
   :BYTES 5522 :SHA256 "4e81190202e0044e9eaff8b00953fbf47a494fd0d0a30ef41811b41dfade92dc" :GIT-BLOB
   "d436edae53a661107d9f053360c57d4fc8f43e9d" :TEXT
   ";;;; C4 adapter: library native/HTML reader unchanged; explicit whole claim+package scope.
;;;; The legacy audit remains original; metadata-only claim audit retains identical counts/missing.
;;;; --self-test; runner calls AUDIT-CLAIM-COVERAGE after the independent adapter selftest.
(eval-when (:compile-toplevel :load-toplevel :execute)
  (require :asdf)
  (unless (find-package \"ARCDOCDB.LIFECYCLE.COVERAGE.READER\")
    (let ((*features* (cons :lifecycle-coverage-reader-library *features*)))
      (load \"spikes/out/lifecycle-measure/lifecycle-coverage-reader.lisp\"))))
(defpackage #:arcdocdb.claim.coverage.reader (:use #:cl))
(in-package #:arcdocdb.claim.coverage.reader)
(declaim (optimize (safety 3) (debug 3)))
(defparameter +scope+ '(\"src/scheduler/package.lisp\" \"src/scheduler/pool-claim.lisp\"))

(defun claim-source-identity (path)
  \"All claim-prefixed files enter the inventory; unexpected modules cannot silently disappear.\"
  (arcdocdb.lifecycle.coverage.reader::reader-require (stringp path) \"claim source not a string\")
  (let ((start (if (uiop:string-prefix-p \"src/\" path) 0
                   (let ((position (search \"/src/\" path :from-end t)))
                     (when position (1+ position))))))
    (when start
      (let ((identity (subseq path start)))
        (when (or (string= \"src/scheduler/\" identity)
                  (string= \"src/scheduler/package.lisp\" identity)
                  (uiop:string-prefix-p \"src/scheduler/pool-claim\" identity))
          identity)))))

(defun call-claim-reader (function)
  \"One-thread C4 adapter restores the library selector even on rejection; no native bit edits.\"
  (let ((original (symbol-function 'arcdocdb.lifecycle.coverage.reader::source-identity))
        (arcdocdb.lifecycle.coverage.reader::+scope-files+ +scope+))
    (unwind-protect
         (progn (setf (symbol-function 'arcdocdb.lifecycle.coverage.reader::source-identity)
                      #'claim-source-identity)
                (funcall function))
      (setf (symbol-function 'arcdocdb.lifecycle.coverage.reader::source-identity) original))))

(defun adapter-self-test ()
  \"Library malformed native/HTML/gate tests plus new independent scope/missing/count fixtures.\"
  (arcdocdb.lifecycle.coverage.reader::coverage-reader-self-test)
  (call-claim-reader
   (lambda ()
     (let* ((native (list (list* \"/a/src/scheduler/pool-claim.lisp\" #((0) (1) (:then 2) (:else 2)) #*1010)
                          (list* \"/a/src/scheduler/package.lisp\" #((0)) #*1)
                          (list* \"/a/src/scheduler/lifecycle-worker.lisp\" #((0)) #*1)))
            (rows (arcdocdb.lifecycle.coverage.reader::scope-native-rows native))
            (counts (mapcar #'arcdocdb.lifecycle.coverage.reader::row-counts rows))
            (heading \"<tr class='subheading'><td colspan='7'>/a/src/scheduler/</td></tr>\")
            (html (concatenate 'string heading
                   \"<tr class='odd'><td><a href='p'>package.lisp</a></td><td>1</td><td>1</td><td>100</td><td>0</td><td>0</td><td>0</td></tr>\"
                   \"<tr class='even'><td><a href='c'>pool-claim.lisp</a></td><td>1</td><td>2</td><td>50</td><td>1</td><td>2</td><td>50</td></tr>\")))
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal counts '((\"src/scheduler/package.lisp\" 1 1 0 0)
                        (\"src/scheduler/pool-claim.lisp\" 1 2 1 2))) \"claim native count oracle\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal counts (arcdocdb.lifecycle.coverage.reader::html-count-rows html)) \"claim HTML exact concordance\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal (getf (second rows) :missing)
               '((:native-index 1 :kind :expression :path (1))
                 (:native-index 3 :kind :branch :path (:else 2)))) \"claim missing paths oracle\")
       (arcdocdb.lifecycle.coverage.reader::reader-require
        (equal (claim-source-identity \"/a/src/scheduler/pool-claim-unexpected.lisp\")
               \"src/scheduler/pool-claim-unexpected.lisp\") \"unexpected claim silently excluded\")
       (arcdocdb.lifecycle.coverage.reader::expect-rejection
        (lambda () (arcdocdb.lifecycle.coverage.reader::scope-native-rows
                    (list (list* \"/a/src/scheduler/pool-claim.lisp\" #((0)) #*0)
                          (list* \"/b/src/scheduler/pool-claim.lisp\" #((0)) #*1))))))))
  :passed)

(defun audit-claim-coverage (native html library-output claim-output)
  \"Native/HTML gate95 without exclusions; library report and precise claim metadata both exclusive.\"
  (adapter-self-test)
  (let ((report (call-claim-reader
                 (lambda () (arcdocdb.lifecycle.coverage.reader::audit-coverage native html library-output)))))
    (setf (getf report :kind) :pool-claim-coverage-audit
          (getf report :scope) :entire-new-pool-claim-plus-package
          (getf report :claim-total) (getf report :lifecycle-total)
          (getf report :library-report) (namestring library-output)
          (getf report :scope-adapter-self-test) :passed)
    (with-open-file (stream claim-output :direction :output :if-exists :error :external-format :utf-8)
      (let ((*print-readably* t)) (write report :stream stream :pretty t) (terpri stream)))
    report))

(unless (member :claim-coverage-reader-library *features*)
  (unless (equal (uiop:command-line-arguments) '(\"--self-test\"))
    (error \"COD-61: claim coverage adapter use --self-test.\"))
  (adapter-self-test)
  (format t \"~&Claim coverage reader self-test PASS~%\"))
")
  (:PATH
   #A((145) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/pool-claim-measure/coverage-attempt-01/7986725fc5f021b2270163bcaa7efceb.html")
   :BYTES 11756 :SHA256 "453c1d803efa505f33b0e9ce8d8a779788214000d463300f0d293cc1255102d4"
   :GIT-BLOB "0321060956625bd52ebcf582d47315fa41fbee31" :TEXT "<html><head><style type='text/css'>
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
</style></head><body><h3>Coverage report: /private/tmp/arcdocdb-pool-claim-qualification-1791924432/src/scheduler/pool-claim.lisp <br />
</h3>
<table class='summary'><tr class='head-row'><td width='80px'>Kind</td><td width='80px'>Covered</td><td width='80px'>All</td><td width='80px'>%</td><tr class='odd'><td>expression</td><td>43</td><td>43</td><td>100.0</td></tr>
<tr class='even'><td>branch</td><td>4</td><td>4</td><td>100.0</td></tr>
</table><div class='key'><b>Key</b><br />
<div class='state-0'>Not instrumented</div><div class='state-15'>Conditionalized out</div><div class='state-1'>Executed</div><div class='state-2'>Not executed</div><div>&#160;</div><div class='state-5'>Both branches taken</div><div class='state-6'>One branch taken</div><div class='state-10'>Neither branch taken</div></div><nobr><div><code>
</code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>1</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#59;&#160;Admission&#160;logica&#160;del&#160;singolo&#160;claim&#59;&#160;obblighi&#160;preesistenti&#160;restano&#160;a&#160;execution&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>2</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;OWNER&#58;&#160;solo&#160;proprietario&#160;della&#160;porta&#160;e&#160;del&#160;suo&#160;contesto&#44;&#160;non&#160;rientrante&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>3</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;SHARED&#58;&#160;ACK&#160;del&#160;lifecycle&#160;per&#160;ondata&#59;&#160;ready&#160;modificata&#160;solo&#160;dall&#39;API&#160;C1&#160;delegata&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>4</code></div><code>&#160;<span class='state-1'>&#40;in&#45;package&#160;&#35;&#58;arcdocdb&#46;scheduler&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>5</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;optimize&#160;&#40;safety&#160;3&#41;&#160;&#40;speed&#160;2&#41;&#160;&#40;debug&#160;2&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>6</code></div><code>&#160;<span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>7</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;REQ&#58;&#160;REQ&#45;THR&#45;001&#160;REQ&#45;CON&#45;001&#160;REQ&#45;CON&#45;002&#160;REQ&#45;CON&#45;004&#160;REQ&#45;CON&#45;005&#160;REQ&#45;AFF&#45;008</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>8</code></div><code>&#160;<span class='state-1'>&#40;declaim&#160;&#40;ftype&#160;&#40;function&#160;&#40;porta&#45;worker&#45;pool&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>9</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;values&#160;&#40;or&#160;null&#160;arcdocdb&#46;execution&#58;writer&#45;programmabile&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>10</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;member&#160;&#58;claimed&#160;&#58;empty&#160;&#58;busy&#160;&#58;inactive&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>11</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;arcdocdb&#46;binary&#58;index</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>12</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;member&#160;&#58;unchanged&#160;&#58;activated&#160;&#58;retired&#160;&#58;busy&#160;&#58;faulted&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>13</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#38;optional&#41;&#41;&#160;prendi&#45;writer&#45;pool&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>14</code></div><code>&#160;<span class='state-1'>&#40;defun&#160;prendi&#45;writer&#45;pool&#160;&#40;port&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>15</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#34;Pre&#58;&#160;owner&#160;corrente&#44;&#160;IDLE&#160;senza&#160;epoca&#160;o&#160;risorse&#160;esterne&#59;&#160;nessuna&#160;rientranza&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>16</code></div><code>&#160;<span class='state-1'>Post&#58;&#160;un&#160;claim&#160;C1&#160;se&#160;attivo&#44;&#160;oppure&#160;INACTIVE&#160;senza&#160;mutare&#160;ready&#47;cursore&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>17</code></div><code>&#160;<span class='state-1'>INVALID&#45;ARGUMENT&#160;owner&#44;&#160;RESOURCE&#45;EXHAUSTED&#160;fase&#59;&#160;invarianti&#160;prima&#160;del&#160;gate&#46;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>18</code></div><code>&#160;<span class='state-1'>Comandi&#160;tardivi&#160;restano&#160;pendenti&#160;fino&#160;al&#160;prossimo&#160;IDLE&#59;&#160;nessun&#160;rollback&#160;o&#160;attesa&#46;&#34;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>19</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;unless&#160;</span><span class='state-5'>&#40;eq&#160;</span><span class='state-1'>&#40;porta&#45;worker&#45;pool&#45;owner&#160;port&#41;</span><span class='state-5'>&#160;</span><span class='state-1'>sb&#45;thread&#58;&#42;current&#45;thread&#42;</span><span class='state-5'>&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>20</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;error&#160;&#39;invalid&#45;argument&#160;&#58;reason&#160;&#58;pool&#45;worker&#45;owner&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>21</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;let&#160;&#40;&#40;context&#160;&#40;porta&#45;worker&#45;pool&#45;context&#160;port&#41;&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>22</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;unless&#160;</span><span class='state-5'>&#40;eq&#160;</span><span class='state-1'>&#40;arcdocdb&#46;execution&#58;stato&#45;worker&#45;writer&#160;context&#41;</span><span class='state-5'>&#160;</span><span class='state-1'>&#58;idle</span><span class='state-5'>&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>23</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#40;error&#160;&#39;resource&#45;exhausted&#160;&#58;reason&#160;&#58;worker&#45;state&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>24</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;arcdocdb&#46;execution&#58;&#58;&#37;richiedi&#45;worker&#160;context&#160;&#58;idle&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>25</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#40;multiple&#45;value&#45;bind&#160;&#40;active&#160;action&#41;&#160;&#40;applica&#45;stato&#45;worker&#45;pool&#160;port&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>26</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#40;if&#160;active</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>27</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;multiple&#45;value&#45;bind&#160;&#40;writer&#160;status&#160;next&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>28</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;arcdocdb&#46;execution&#58;prendi&#45;writer&#45;worker&#160;context&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>29</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;values&#160;writer&#160;status&#160;next&#160;action&#41;&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>30</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;values&#160;nil&#160;&#58;inactive</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>31</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#40;arcdocdb&#46;execution&#58;&#58;contesto&#45;worker&#45;writer&#45;cursor&#160;context&#41;&#160;action&#41;&#41;&#41;&#41;&#41;</code></div></body></html>")
  (:PATH
   #A((145) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/pool-claim-measure/coverage-attempt-01/853883a0e41ef3a0e3dd1ceb949d97bb.html")
   :BYTES 5300 :SHA256 "35e91774bd584a1d2e2abe05b7ddd529799362c9f37531713b4ec8187ccc6034" :GIT-BLOB
   "211bd7166830e61364ad74f9dba2145d8fe2bdf1" :TEXT "<html><head><style type='text/css'>
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
</style></head><body><h3>Coverage report: /private/tmp/arcdocdb-pool-claim-qualification-1791924432/src/scheduler/package.lisp <br />
</h3>
<table class='summary'><tr class='head-row'><td width='80px'>Kind</td><td width='80px'>Covered</td><td width='80px'>All</td><td width='80px'>%</td><tr class='odd'><td>expression</td><td>1</td><td>1</td><td>100.0</td></tr>
<tr class='even'><td>branch</td><td>0</td><td>0</td><td>nil  </td></tr>
</table><div class='key'><b>Key</b><br />
<div class='state-0'>Not instrumented</div><div class='state-15'>Conditionalized out</div><div class='state-1'>Executed</div><div class='state-2'>Not executed</div><div>&#160;</div><div class='state-5'>Both branches taken</div><div class='state-6'>One branch taken</div><div class='state-10'>Neither branch taken</div></div><nobr><div><code>
</code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>1</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#59;&#160;Politica&#160;e&#160;attuatore&#160;logico&#160;del&#160;pool&#59;&#160;thread&#160;preesistenti&#44;&#160;nessuna&#160;attesa&#46;</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>2</code></div><code>&#160;<span class='state-0'>&#59;&#59;&#59;&#160;REQ&#58;&#160;REQ&#45;THR&#45;001&#160;REQ&#45;CON&#45;005&#160;REQ&#45;AFF&#45;008&#160;REQ&#45;AFF&#45;013</span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>3</code></div><code>&#160;<span class='state-1'>&#40;defpackage&#160;&#35;&#58;arcdocdb&#46;scheduler</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>4</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;&#58;use&#160;&#35;&#58;cl&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>5</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;&#58;import&#45;from&#160;&#35;&#58;arcdocdb&#46;conditions&#160;&#35;&#58;invalid&#45;argument&#160;&#35;&#58;invariant&#45;violation</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>6</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#35;&#58;resource&#45;exhausted&#41;</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>7</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#40;&#58;export&#160;&#35;&#58;controllore&#45;pool&#160;&#35;&#58;crea&#45;controllore&#45;pool</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>8</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#35;&#58;aggiorna&#45;controllore&#45;pool&#160;&#35;&#58;leggi&#45;controllore&#45;pool</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>9</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#35;&#58;porta&#45;worker&#45;pool&#160;&#35;&#58;crea&#45;porta&#45;worker&#45;pool&#160;&#35;&#58;applica&#45;stato&#45;worker&#45;pool</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>10</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#35;&#58;prendi&#45;writer&#45;pool</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>11</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#35;&#58;registro&#45;pool&#160;&#35;&#58;crea&#45;registro&#45;pool&#160;&#35;&#58;leggi&#45;registro&#45;pool</span><span class='state-0'></span></code></div></nobr>
<nobr><div class='source'><div class='line-number'><code>12</code></div><code>&#160;<span class='state-1'>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#35;&#58;aggiorna&#45;registro&#45;pool&#41;&#41;</code></div></body></html>")
  (:PATH
   #A((124) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/pool-claim-measure/coverage-attempt-01/cover-index.html")
   :BYTES 1924 :SHA256 "58f3d947e961b72c4fdac6a547ebb02cdc9a388e9d8aacea9c6b9b8378860040" :GIT-BLOB
   "193048d28320d0830b7ad5acdbd57a70d54c358b" :TEXT "<style type='text/css'>
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
</style><table class='summary'><tr class='head-row'><td></td><td class='main-head' colspan='3'>Expression</td><td class='main-head' colspan='3'>Branch</td></tr><tr class='head-row'><td width='80px'>Source file</td><td width='80px'>Covered</td><td width='80px'>Total</td><td width='80px'>%</td><td width='80px'>Covered</td><td width='80px'>Total</td><td width='80px'>%</td></tr><tr class='subheading'><td colspan='7'>/private/tmp/arcdocdb-pool-claim-qualification-1791924432/src/scheduler/</td></tr>
<tr class='odd'><td class='text-cell'><a href='853883a0e41ef3a0e3dd1ceb949d97bb.html'>package.lisp</a></td><td>1</td><td>1</td><td>100.0</td><td>0</td><td>0</td><td>-</td></tr><tr class='even'><td class='text-cell'><a href='7986725fc5f021b2270163bcaa7efceb.html'>pool-claim.lisp</a></td><td>43</td><td>43</td><td>100.0</td><td>4</td><td>4</td><td>100.0</td></tr></table>")
  (:PATH
   #A((127) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/pool-claim-measure/coverage-attempt-01/coverage-audit.lisp")
   :BYTES 1012 :SHA256 "3eb2fd94d26749ba5b5e18a664b67a265ae1b40d1ce15cd67b1d71a3aa38f813" :GIT-BLOB
   "8ec4e70bc14d166dde5da9c60c8ab7761db77d7b" :TEXT
   "(:SCHEMA-VERSION 1 :KIND :POOL-LIFECYCLE-COVERAGE-AUDIT :STATUS :OK :SCOPE
 :ENTIRE-NEW-LIFECYCLE-PLUS-PACKAGE :NATIVE-PATH
 #A((127) BASE-CHAR
    . \"/private/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/pool-claim-measure/coverage-attempt-01/coverage-state.lisp\")
 :HTML-PATH
 #A((124) BASE-CHAR
    . \"/private/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/pool-claim-measure/coverage-attempt-01/cover-index.html\")
 :FILES
 ((:FILE #A((26) BASE-CHAR . \"src/scheduler/package.lisp\") :EXPRESSIONS-HIT 1
   :EXPRESSIONS-TOTAL 1 :BRANCHES-HIT 0 :BRANCHES-TOTAL 0 :MISSING NIL)
  (:FILE #A((29) BASE-CHAR . \"src/scheduler/pool-claim.lisp\") :EXPRESSIONS-HIT
   43 :EXPRESSIONS-TOTAL 43 :BRANCHES-HIT 4 :BRANCHES-TOTAL 4 :MISSING NIL))
 :LIFECYCLE-TOTAL (44 44 4 4) :MINIMUM-PERCENT 95 :HTML-COUNTS
 ((\"src/scheduler/package.lisp\" 1 1 0 0)
  (\"src/scheduler/pool-claim.lisp\" 43 43 4 4))
 :HTML-COUNTS-ORIGIN :PARSED-SB-COVER-INDEX :SELF-TEST :PASSED :EXCLUSIONS NIL
 :MCDC-INFERRED NIL)
")
  (:PATH
   #A((133) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/pool-claim-measure/coverage-attempt-01/coverage-claim-audit.lisp")
   :BYTES 1241 :SHA256 "c7b43295618f64db0fea6392f54c947e63b45c9d8df2deec70bb409990f89463" :GIT-BLOB
   "240dbf58747536a049fe4030586a198cc598f87b" :TEXT
   "(:SCOPE-ADAPTER-SELF-TEST :PASSED :LIBRARY-REPORT
 #A((127) BASE-CHAR
    . \"/private/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/pool-claim-measure/coverage-attempt-01/coverage-audit.lisp\")
 :CLAIM-TOTAL (44 44 4 4) :SCHEMA-VERSION 1 :KIND :POOL-CLAIM-COVERAGE-AUDIT
 :STATUS :OK :SCOPE :ENTIRE-NEW-POOL-CLAIM-PLUS-PACKAGE :NATIVE-PATH
 #A((127) BASE-CHAR
    . \"/private/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/pool-claim-measure/coverage-attempt-01/coverage-state.lisp\")
 :HTML-PATH
 #A((124) BASE-CHAR
    . \"/private/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/pool-claim-measure/coverage-attempt-01/cover-index.html\")
 :FILES
 ((:FILE #A((26) BASE-CHAR . \"src/scheduler/package.lisp\") :EXPRESSIONS-HIT 1
   :EXPRESSIONS-TOTAL 1 :BRANCHES-HIT 0 :BRANCHES-TOTAL 0 :MISSING NIL)
  (:FILE #A((29) BASE-CHAR . \"src/scheduler/pool-claim.lisp\") :EXPRESSIONS-HIT
   43 :EXPRESSIONS-TOTAL 43 :BRANCHES-HIT 4 :BRANCHES-TOTAL 4 :MISSING NIL))
 :LIFECYCLE-TOTAL (44 44 4 4) :MINIMUM-PERCENT 95 :HTML-COUNTS
 ((\"src/scheduler/package.lisp\" 1 1 0 0)
  (\"src/scheduler/pool-claim.lisp\" 43 43 4 4))
 :HTML-COUNTS-ORIGIN :PARSED-SB-COVER-INDEX :SELF-TEST :PASSED :EXCLUSIONS NIL
 :MCDC-INFERRED NIL)
")
  (:PATH
   #A((105) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/pool-claim-measure/coverage-run.lisp")
   :BYTES 2883 :SHA256 "7b2c70035f08e40ad8ea8808700af5a8f60633e586de58871e2533d054858fc2" :GIT-BLOB
   "e1898cebc79e5451477eb8c1596021fd5d801cff" :TEXT "(require :asdf)
(require :sb-cover)
(require :sb-posix)
(pushnew :claim-coverage-reader-library *features*)
;; Keep startup code-component marks across ASDF GC without modifying any observed bit.
(defmethod asdf:perform :after ((operation asdf:load-op) (component asdf:cl-source-file))
  (declare (ignore operation))
  (when (search \"/src/scheduler/\" (namestring (asdf:component-pathname component)))
    (sb-cover:save-coverage)))
(let* ((args (uiop:command-line-arguments)) (root (truename \"./\"))
       (directory (when (= 2 (length args))
                    (uiop:ensure-directory-pathname (merge-pathnames (second args) root)))))
  (unless (and directory (string= \"--report\" (first args)))
    (error \"COD-61 pool claim coverage: use --report fresh-directory/.\"))
  (ensure-directories-exist
   (merge-pathnames \"parent-placeholder\" (uiop:pathname-parent-directory-pathname directory)))
  (sb-posix:mkdir (namestring directory) #o700)
  (handler-bind ((warning (lambda (condition) (error condition)))
                 (style-warning (lambda (condition) (error condition))))
    (multiple-value-bind (fasl warnings failure)
        (compile-file \"spikes/out/pool-claim-measure/claim-coverage-reader.lisp\"
                      :output-file (merge-pathnames \"reader.fasl\" directory))
      (unless (and fasl (not warnings) (not failure)) (error \"COD-01: claim reader compile failure.\"))
      (load fasl)))
  (uiop:symbol-call \"ARCDOCDB.CLAIM.COVERAGE.READER\" \"ADAPTER-SELF-TEST\")
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
                                            (or (search \"/src/scheduler/pool-claim\" path)
                                                (search \"/src/scheduler/package.lisp\" path))))))
    (unless html (error \"COD-60: claim source data missing.\"))
    (uiop:symbol-call \"ARCDOCDB.CLAIM.COVERAGE.READER\" \"AUDIT-CLAIM-COVERAGE\"
                     (merge-pathnames \"coverage-state.lisp\" directory) html
                     (merge-pathnames \"coverage-audit.lisp\" directory)
                     (merge-pathnames \"coverage-claim-audit.lisp\" directory))))
")
  (:PATH
   #A((119) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/pool-claim-measure/formal-benchmark-attempt-01.log")
   :BYTES 274 :SHA256 "feb2001654031507973422b6276f1c7bf69b5c1d8c0d66922abe21b0def0b2cf" :GIT-BLOB
   "8e61f342059ab237d2593316178f2d9447bd2037" :TEXT
   ":OK: sbcl --noinform --no-userinit --no-sysinit --script spikes/out/pool-claim-measure/tool-run.lisp --bench spikes/out/pool-claim-measure/bench-attempt-01/; record: /private/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/4000913399-command-74843-0/report.lisp
")
  (:PATH
   #A((118) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/pool-claim-measure/formal-coverage-attempt-01.log")
   :BYTES 282 :SHA256 "2bf41af2cf1f34b9c2fadee3cf885e7a5c71b76eef2b475b571120510a2bd38b" :GIT-BLOB
   "d5fa9794f8ab744f91a797f1a701c04a269384c0" :TEXT
   ":OK: sbcl --noinform --no-userinit --no-sysinit --script spikes/out/pool-claim-measure/coverage-run.lisp --report spikes/out/pool-claim-measure/coverage-attempt-01/; record: /private/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/4000913361-command-73794-0/report.lisp
")
  (:PATH
   #A((125) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/pool-claim-measure/formal-reader-selftest-attempt-01.log")
   :BYTES 220 :SHA256 "6e5ec56ba3f8e246f7bf36f3c6a8d4e26e5f1ba8e4b33725208e020b58ce13a4" :GIT-BLOB
   "09b0c8bfd36915bf6b8683f392f67d77c47f2344" :TEXT
   ":OK: sbcl --noinform --no-userinit --no-sysinit --script spikes/out/pool-claim-measure/reader-run.lisp; record: /private/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/4000913465-command-76699-0/report.lisp
")
  (:PATH
   #A((118) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/pool-claim-measure/formal-selftest-attempt-01.log")
   :BYTES 230 :SHA256 "21b4bf1aac267f31ef203d6fb35e4707111b2d4b4a5f529df3e573f0c76c8b4d" :GIT-BLOB
   "db350662a06217436d0e011be9f88787e3bd2210" :TEXT
   ":OK: sbcl --noinform --no-userinit --no-sysinit --script spikes/out/pool-claim-measure/tool-run.lisp --self-test; record: /private/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/4000913361-command-73795-0/report.lisp
")
  (:PATH
   #A((103) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/pool-claim-measure/reader-run.lisp")
   :BYTES 709 :SHA256 "a066bba7120a5a05dcd8fb0e45bac7d300d500c651394e5983f07cbe941eb254" :GIT-BLOB
   "51b2f8c5c594ba529961d26843d4d4b462915ef8" :TEXT "(require :asdf)
(pushnew :claim-coverage-reader-library *features*)
(declaim (optimize (safety 3) (debug 3)))
(handler-bind ((warning (lambda (condition) (error condition)))
               (style-warning (lambda (condition) (error condition))))
  (multiple-value-bind (fasl warnings failure)
      (compile-file \"spikes/out/pool-claim-measure/claim-coverage-reader.lisp\"
                    :output-file \"spikes/out/pool-claim-measure/claim-coverage-reader.fasl\")
    (unless (and fasl (not warnings) (not failure)) (error \"COD-01: claim reader compile failure.\"))
    (load fasl)))
(uiop:symbol-call \"ARCDOCDB.CLAIM.COVERAGE.READER\" \"ADAPTER-SELF-TEST\")
(format t \"~&Claim coverage reader self-test PASS~%\")
")
  (:PATH
   #A((101) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/pool-claim-measure/tool-run.lisp")
   :BYTES 624 :SHA256 "ff2cfb6c377e7ba6ea287833bd4829c4c571afe8b45c87e7a6c0be0737c3f007" :GIT-BLOB
   "f08b0e71dec2ea019ed7b6114ba1331fc8fb70fe" :TEXT "(require :asdf)
(pushnew :arcdocdb-pool-claim-measure-library *features*)
(declaim (optimize (safety 3) (debug 3)))
(handler-bind ((warning (lambda (condition) (error condition)))
               (style-warning (lambda (condition) (error condition))))
  (multiple-value-bind (fasl warnings failure)
      (compile-file \"tools/measure-pool-claim.lisp\"
                    :output-file \"spikes/out/pool-claim-measure/measure-pool-claim.fasl\")
    (unless (and fasl (not warnings) (not failure))
      (error \"COD-01: tool pool-claim compile failure.\"))
    (load fasl)))
(uiop:symbol-call \"ARCDOCDB.POOL-CLAIM.MEASURE\" \"MAIN\")
")))
