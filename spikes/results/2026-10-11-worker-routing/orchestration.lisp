(:SCHEMA-VERSION 1 :KIND :WORKER-ROUTING-ORCHESTRATION-BUNDLE :SOURCES
 ((:PATH
   #A((119) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-v1-qinoyy62/ArcDocDB/spikes/out/routing-coverage.lisp")
   :BYTES 530 :SHA256 "4f09c507ef5418e5585fdd8df805938732d90dedfcb4f7fa9ed4de616957926e" :GIT-BLOB
   "e8515925ad965491801dbe9e4975349d79214ef2" :TEXT "(require :asdf)
(require :sb-cover)
(setf sb-ext:*posix-argv* '(\"sbcl\" \"--report\" \"spikes/out/routing-coverage-01/\" \"series\"))
(load \"tools/foundation-coverage.lisp\")
(uiop:symbol-call '#:arcdocdb.execution.tests '#:run)
(sb-cover:save-coverage-in-file \"spikes/out/routing-coverage-01/coverage-state-union.lisp\")
(sb-cover:report \"spikes/out/routing-coverage-01/\" :if-matches
 (lambda (path) (or (search \"/src/series/\" path) (search \"/src/execution/\" path))))
(format t \"~&Routing coverage union: entire Series and Execution.~%\")
")
  (:PATH
   #A((120) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-v1-qinoyy62/ArcDocDB/spikes/out/routing-strict-c4.lisp")
   :BYTES 853 :SHA256 "bd7d22c91f125c416ce0547d3d7747d3148592511a008ec31e009bc7f70ac45f" :GIT-BLOB
   "024ace2047710474881dbbb005f95e0cc64c89c5" :TEXT "(require :asdf)
(asdf:initialize-output-translations `(:output-translations (,(merge-pathnames \"**/*.*\" (truename \"./\")) ,(merge-pathnames \"spikes/out/routing-c4-fasl/**/*.*\" (truename \"./\"))) :ignore-inherited-configuration))
(pushnew :arcdocdb-worker-routing-bench-library *features*)
(handler-bind ((warning (lambda (condition) (error condition))))
 (multiple-value-bind (fasl warnings failure)
     (compile-file \"tools/worker-routing-bench.lisp\" :output-file \"spikes/out/worker-routing-bench.fasl\")
   (assert fasl) (assert (null warnings)) (assert (null failure))
   (load fasl)))
(uiop:symbol-call '#:arcdocdb.worker-routing.bench '#:load-product)
(let ((result (uiop:symbol-call '#:arcdocdb.worker-routing.bench '#:self-test)))
 (assert (eq :ok (getf result :status)))
 (format t \"~&Strict whole COMPILE-FILE/FASL self-test PASS: ~S~%\" result))
")
  (:PATH
   #A((119) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-v1-qinoyy62/ArcDocDB/spikes/out/routing-targeted.lisp")
   :BYTES 856 :SHA256 "4435476f837152617a4d8cd992b3e0dc34b0996e51f20578edd92a52b8921dae" :GIT-BLOB
   "787586bc8960815d1e966ab3ce116de67f3d658d" :TEXT "(require :asdf)
(setf asdf:*compile-file-failure-behaviour* :error asdf:*compile-file-warnings-behaviour* :error)
(asdf:initialize-output-translations `(:output-translations (,(merge-pathnames \"**/*.*\" (truename \"./\")) ,(merge-pathnames \"spikes/out/routing-target-fasl/**/*.*\" (truename \"./\"))) :ignore-inherited-configuration))
(handler-bind ((warning (lambda (condition) (unless (typep condition 'sb-kernel:redefinition-warning) (error condition)))))
 (asdf:load-asd (merge-pathnames \"arcdocdb.asd\" (truename \"./\")))
 (asdf:load-system \"arcdocdb/tests\" :force t))
(let ((tests (remove-if-not (lambda (name) (search \"ROUTING\" (symbol-name name))) arcdocdb.series.tests::*tests*)))
 (assert (= 15 (length tests)))
 (dolist (test (reverse tests)) (funcall test) (format t \"ok    ~A~%\" test))
 (format t \"~&Routing target: ~D tests PASS.~%\" (length tests)))
")
  (:PATH
   #A((125) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-v2-skkktsa6/ArcDocDB/spikes/out/routing-coverage-audit.lisp")
   :BYTES 1013 :SHA256 "d5c310b32653ae6a58e38d2995682d1abcef4ae6001b2d3f3b112135e3e12e86" :GIT-BLOB
   "d99daf13acf9cd0be75631fc2980690d64619110" :TEXT "(require :asdf)
(pushnew :routing-coverage-reader-library *features*)
(handler-bind ((warning (lambda (condition) (error condition))))
 (multiple-value-bind (fasl warnings failure)
     (compile-file \"spikes/out/routing-coverage-reader.lisp\" :output-file \"spikes/out/routing-coverage-reader.fasl\")
   (assert fasl) (assert (null warnings)) (assert (null failure)) (load fasl)))
(assert (eq :passed (uiop:symbol-call '#:arcdocdb.routing.coverage.reader '#:coverage-reader-self-test)))
(let ((report (uiop:symbol-call '#:arcdocdb.routing.coverage.reader '#:audit-coverage
               \"spikes/out/routing-coverage-01/coverage-state-union.lisp\"
               \"spikes/out/routing-coverage-01/cover-index.html\"
               \"spikes/out/routing-coverage-audit-data.lisp\")))
 (format t \"~&Strict reader compile/FASL + native/HTML audit PASS.~%\")
 (write (loop for key in '(:status :union-total :series-total :execution-total :routing-total :handoff-counts) append (list key (getf report key))) :pretty t) (terpri))
")
  (:PATH
   #A((126) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-v2-skkktsa6/ArcDocDB/spikes/out/routing-coverage-reader.lisp")
   :BYTES 14311 :SHA256 "26ba2bdbb1ad58bf0252e160096b24e845003c59ca8bfda10d7453d6a69d142a"
   :GIT-BLOB "a02b50c1503aef330d3b42987afb48397335ca83" :TEXT
   ";;;; C4: native/HTML concordance for whole Series and Execution, no exclusions.
;;;; Preserves every missing native index/path; no inference of MC/DC.
;;;; --self-test | --audit native-state.lisp cover-index.html new-report.lisp
;;;; Library feature: :routing-coverage-reader-library. All inputs are trusted recorder data.
(eval-when (:compile-toplevel :load-toplevel :execute) (require :asdf))
(defpackage #:arcdocdb.routing.coverage.reader (:use #:cl))
(in-package #:arcdocdb.routing.coverage.reader)
(declaim (optimize (safety 3) (debug 3)))

(defparameter +scope-files+
  '(\"src/execution/handoff.lisp\" \"src/execution/package.lisp\" \"src/execution/queue.lisp\"
    \"src/execution/ready-recycle.lisp\" \"src/execution/ready-types.lisp\" \"src/execution/ready.lisp\"
    \"src/execution/worker-boundary.lisp\" \"src/execution/worker-claim.lisp\"
    \"src/execution/worker-run.lisp\" \"src/execution/worker-types.lisp\" \"src/execution/writer.lisp\"
    \"src/series/events.lisp\" \"src/series/io-events.lisp\" \"src/series/ownership.lisp\"
    \"src/series/package.lisp\" \"src/series/publication.lisp\" \"src/series/query.lisp\"
    \"src/series/retirement.lisp\" \"src/series/routing-build.lisp\" \"src/series/routing-select.lisp\"
    \"src/series/routing-types.lisp\" \"src/series/types.lisp\" \"src/series/worker-boundary.lisp\"
    \"src/series/worker-package.lisp\" \"src/series/worker-run.lisp\" \"src/series/worker-types.lisp\"))

(defun reader-require (predicate detail)
  \"A malformed sensor input is a COD-60 failure, never a discarded native row.\"
  (unless predicate (error \"COD-60 routing-coverage-reader.lisp: ~A.\" detail)))

(defun source-identity (path)
  \"Keeps module namespaces; NIL means outside the two explicit whole-module scopes.\"
  (reader-require (stringp path) \"source path is not a string\")
  (let ((start (if (uiop:string-prefix-p \"src/\" path) 0
                   (let ((position (search \"/src/\" path :from-end t)))
                     (when position (1+ position))))))
    (when start
      (let ((identity (subseq path start)))
        (when (or (uiop:string-prefix-p \"src/series/\" identity)
                  (uiop:string-prefix-p \"src/execution/\" identity))
          identity)))))

(defun native-row (entry)
  \"Counts every native datum and preserves unhit expression/branch identities, with positions.\"
  (reader-require (and (consp entry) (consp (cdr entry))) \"native entry shape\")
  (reader-require (and (vectorp (cadr entry)) (vectorp (cddr entry))) \"native arrays missing\")
  (reader-require (= (length (cadr entry)) (length (cddr entry))) \"native path/bit length mismatch\")
  (let ((eh 0) (et 0) (bh 0) (bt 0) (missing nil))
    (loop for path across (cadr entry) for bit across (cddr entry) for index from 0
          do (reader-require (listp path) \"native path is not a list\")
             (reader-require (member bit '(0 1)) \"native coverage value is not a bit\")
             (if (member (car path) '(:then :else))
                 (progn (incf bt) (incf bh bit))
                 (progn (incf et) (incf eh bit)))
             (when (= bit 0)
               (push (list :native-index index
                           :kind (if (member (car path) '(:then :else)) :branch :expression)
                           :path path) missing)))
    (list :file (or (source-identity (car entry)) (car entry))
          :expressions-hit eh :expressions-total et :branches-hit bh :branches-total bt
          :missing (nreverse missing))))

(defun row-counts (row)
  \"A row retains its full source identity plus hit/total counts, without rounding.\"
  (list (getf row :file) (getf row :expressions-hit) (getf row :expressions-total)
        (getf row :branches-hit) (getf row :branches-total)))

(defun read-native (path)
  \"One trusted native datum only; reader evaluation is always disabled.\"
  (let ((*read-eval* nil) (eof (gensym \"EOF\")))
    (with-open-file (stream path :external-format :utf-8)
      (let ((value (read stream nil eof)))
        (reader-require (and (not (eq value eof)) (listp value)) \"native top-level list missing\")
        (reader-require (eq eof (read stream nil eof)) \"trailing native datum\")
        value))))

(defun scope-native-rows (raw)
  \"Every file in either scope is included; duplicate canonical identities are rejected.\"
  (let ((rows nil) (seen (make-hash-table :test 'equal)))
    (dolist (entry raw)
      (reader-require (and (consp entry) (stringp (car entry))) \"native source identity missing\")
      (let ((identity (source-identity (car entry))))
        (when identity
          (reader-require (not (gethash identity seen)) \"duplicate native source identity\")
          (setf (gethash identity seen) t)
          (push (native-row entry) rows))))
    (sort rows #'string< :key (lambda (row) (getf row :file)))))

(defun html-cells (row)
  \"Strict extraction of bounded TD cells from one trusted SB-COVER TR fragment.\"
  (let ((cursor 0) (cells nil))
    (loop for start = (search \"<td\" row :start2 cursor) while start
          do (let ((body (position #\\> row :start start))
                   (close (search \"</td>\" row :start2 start)))
               (reader-require (and body close (< body close)) \"HTML TD delimiters missing\")
               (push (subseq row (1+ body) close) cells)
               (setf cursor (+ close 5))))
    (nreverse cells)))

(defun html-source-name (cell)
  \"Requires exactly one source link; returns its undecorated basename.\"
  (let* ((start (search \"<a \" cell))
         (body (when start (position #\\> cell :start start)))
         (close (when body (search \"</a>\" cell :start2 body))))
    (reader-require (and start body close (< body close)) \"HTML source link missing\")
    (reader-require (not (search \"<a \" cell :start2 (+ close 4))) \"duplicate HTML source link\")
    (let ((name (subseq cell (1+ body) close)))
      (reader-require (and (plusp (length name)) (not (find #\\/ name))
                           (not (find #\\< name)) (not (find #\\> name))) \"HTML source basename invalid\")
      name)))

(defun html-count (cell)
  \"Only a nonnegative decimal integer is a coverage count; percentages are not read.\"
  (let ((clean (string-trim '(#\\Space #\\Tab #\\Return #\\Newline) cell)))
    (reader-require (and (plusp (length clean)) (every (lambda (c) (digit-char-p c 10)) clean))
                    \"HTML count is not a decimal integer\")
    (parse-integer clean :radix 10)))

(defun html-data-counts (row directory)
  \"SB-COVER summary schema: source, expression covered/total/percent, branch covered/total/percent.\"
  (let ((cells (html-cells row)))
    (reader-require (= 7 (length cells)) \"HTML summary row does not have seven cells\")
    (let ((result (list (concatenate 'string directory (html-source-name (first cells)))
                        (html-count (second cells)) (html-count (third cells))
                        (html-count (fifth cells)) (html-count (sixth cells)))))
      (reader-require (and (<= (second result) (third result)) (<= (fourth result) (fifth result)))
                      \"HTML covered count exceeds denominator\")
      result)))

(defun html-count-rows (html)
  \"Reads actual HTML counts by module heading; equal basenames in two scopes stay distinct.\"
  (let ((cursor 0) (directory nil) (rows nil) (seen (make-hash-table :test 'equal)))
    (loop for start = (search \"<tr\" html :start2 cursor) while start
          do (let ((close (search \"</tr>\" html :start2 start)))
               (reader-require close \"HTML TR delimiter missing\")
               (let ((row (subseq html start (+ close 5))))
                 (cond
                   ((search \"class='subheading'\" row)
                    (let* ((cells (html-cells row))
                           (identity (and (= 1 (length cells)) (source-identity (first cells)))))
                      (setf directory (when (member identity '(\"src/series/\" \"src/execution/\")
                                                    :test #'equal) identity))))
                   ((and directory (or (search \"class='odd'\" row) (search \"class='even'\" row)))
                    (let* ((counts (html-data-counts row directory)) (identity (first counts)))
                      (reader-require (not (gethash identity seen)) \"duplicate HTML source identity\")
                      (setf (gethash identity seen) t)
                      (push counts rows)))
                   (t nil)))
               (setf cursor (+ close 5))))
    (sort rows #'string< :key #'first)))

(defun count-total (counts)
  \"Sums all four exact integer columns; no approved exclusion or estimated denominator.\"
  (loop for column from 1 to 4 collect (loop for row in counts sum (nth column row))))

(defun select-counts (counts prefix)
  \"Selects a named entire module/subset after the full inventory has been validated.\"
  (remove-if-not (lambda (row) (uiop:string-prefix-p prefix (first row))) counts))

(defun audit-coverage (native-path html-path output-path)
  \"Cross-checks actual independent native and HTML summaries; writes an exclusive audit result.\"
  (let* ((raw (read-native native-path)) (rows (scope-native-rows raw))
         (counts (mapcar #'row-counts rows))
         (html-counts (html-count-rows (uiop:read-file-string html-path :external-format :utf-8)))
         (files (mapcar #'first counts)) (expected (sort (copy-list +scope-files+) #'string<)))
    (reader-require (equal files expected) \"native full-scope file inventory differs\")
    (reader-require (equal counts html-counts) \"native/HTML file identity or counts differ\")
    (let* ((series (select-counts counts \"src/series/\"))
           (execution (select-counts counts \"src/execution/\"))
           (routing (select-counts counts \"src/series/routing-\"))
           (handoff (assoc \"src/execution/handoff.lisp\" counts :test #'equal))
           (report (list :schema-version 1 :kind :routing-coverage-audit :status :ok
                         :native-path (namestring (pathname native-path))
                         :html-path (namestring (pathname html-path))
                         :files rows :union-total (count-total counts)
                         :series-total (count-total series) :execution-total (count-total execution)
                         :routing-total (count-total routing) :handoff-counts handoff
                         :html-counts html-counts :html-counts-origin :parsed-sb-cover-index
                         :self-test :passed :exclusions nil :mcdc-inferred nil)))
      (with-open-file (stream output-path :direction :output :if-exists :error :external-format :utf-8)
        (let ((*print-readably* t)) (write report :stream stream :pretty t) (terpri stream)))
      (format t \"~&Coverage audit PASS: ~D files; union ~S; routing ~S; handoff ~S~%\"
              (length files) (getf report :union-total) (getf report :routing-total) handoff)
      report)))

(defun expect-rejection (thunk)
  \"A negative fixture must signal; silent acceptance is a sensor defect.\"
  (reader-require (handler-case (progn (funcall thunk) nil) (error () t)) \"negative fixture accepted\"))

(defun native-self-test ()
  \"Independent hit/denominator/missing-path oracle plus malformed length/bit fixtures.\"
  (let ((row (native-row (list* \"/fixture/src/series/types.lisp\"
                               #((0) (1) (:then 2) (:else 2)) #*1010))))
    (reader-require (equal (row-counts row) '(\"src/series/types.lisp\" 1 2 1 2)) \"native count oracle\")
    (reader-require (equal (getf row :missing)
                           '((:native-index 1 :kind :expression :path (1))
                             (:native-index 3 :kind :branch :path (:else 2)))) \"native missing-path oracle\"))
  (dolist (entry (list (list* \"bad-length\" #((0)) #*00)
                      (list* \"bad-bit\" #((0) (1)) #(0 2))
                      (list* \"bad-path\" #(1) #*0)))
    (expect-rejection (lambda () (native-row entry))))
  (expect-rejection
   (lambda () (scope-native-rows (list (list* \"/a/src/series/types.lisp\" #((0)) #*0)
                                      (list* \"/b/src/series/types.lisp\" #((1)) #*1)))))
  :passed)

(defun html-self-test ()
  \"Two namespaces with the same basename and exact counts, then deliberate malformed HTML.\"
  (let* ((execution \"<tr class='subheading'><td colspan='7'>/fixture/src/execution/</td></tr>\")
         (series \"<tr class='subheading'><td colspan='7'>/fixture/src/series/</td></tr>\")
         (row \"<tr class='odd'><td class='text-cell'><a href='fixture.html'>package.lisp</a></td><td>1</td><td>2</td><td>50.0</td><td>3</td><td>4</td><td>75.0</td></tr>\")
         (expected '((\"src/execution/package.lisp\" 1 2 3 4) (\"src/series/package.lisp\" 1 2 3 4))))
    (reader-require (equal (html-count-rows (concatenate 'string execution row series row)) expected)
                    \"HTML count/namespace oracle\")
    (expect-rejection (lambda () (html-count-rows (concatenate 'string execution row row))))
    (expect-rejection (lambda () (html-count-rows \"<tr class='subheading'>\")))
    (expect-rejection (lambda () (html-data-counts \"<td>missing</td>\" \"src/series/\")))
    (expect-rejection (lambda () (html-count \"-1\")))
    (expect-rejection (lambda () (html-count \"1.5\")))
    (expect-rejection (lambda () (html-source-name \"<a href='f'>nested/file.lisp</a>\"))))
  :passed)

(defun coverage-reader-self-test ()
  \"All fixtures must detect malformed input before any campaign report is written.\"
  (native-self-test) (html-self-test)
  (reader-require (equal (count-total '((\"one\" 1 2 3 4) (\"two\" 5 6 7 8))) '(6 8 10 12))
                  \"aggregate count oracle\")
  :passed)

(defun coverage-reader-main ()
  \"CLI C4: explicit diagnostics and nonzero exit for every failed verification.\"
  (handler-case
      (let ((args (uiop:command-line-arguments)))
        (coverage-reader-self-test)
        (cond ((equal args '(\"--self-test\")) (format t \"~&Coverage reader self-test PASS~%\"))
              ((and (= 4 (length args)) (string= \"--audit\" (first args)))
               (audit-coverage (second args) (third args) (fourth args)))
              (t (error \"COD-61 routing-coverage-reader.lisp: use --self-test or --audit native html new-report.\"))))
    (error (condition)
      (format *error-output* \"~&routing-coverage-reader.lisp: ~A~%\" condition)
      (uiop:quit 1))))

(unless (member :routing-coverage-reader-library *features*) (coverage-reader-main))
")
  (:PATH
   #A((119) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-v2-skkktsa6/ArcDocDB/spikes/out/routing-coverage.lisp")
   :BYTES 530 :SHA256 "4f09c507ef5418e5585fdd8df805938732d90dedfcb4f7fa9ed4de616957926e" :GIT-BLOB
   "e8515925ad965491801dbe9e4975349d79214ef2" :TEXT "(require :asdf)
(require :sb-cover)
(setf sb-ext:*posix-argv* '(\"sbcl\" \"--report\" \"spikes/out/routing-coverage-01/\" \"series\"))
(load \"tools/foundation-coverage.lisp\")
(uiop:symbol-call '#:arcdocdb.execution.tests '#:run)
(sb-cover:save-coverage-in-file \"spikes/out/routing-coverage-01/coverage-state-union.lisp\")
(sb-cover:report \"spikes/out/routing-coverage-01/\" :if-matches
 (lambda (path) (or (search \"/src/series/\" path) (search \"/src/execution/\" path))))
(format t \"~&Routing coverage union: entire Series and Execution.~%\")
")
  (:PATH
   #A((120) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-v2-skkktsa6/ArcDocDB/spikes/out/routing-strict-c4.lisp")
   :BYTES 853 :SHA256 "bd7d22c91f125c416ce0547d3d7747d3148592511a008ec31e009bc7f70ac45f" :GIT-BLOB
   "024ace2047710474881dbbb005f95e0cc64c89c5" :TEXT "(require :asdf)
(asdf:initialize-output-translations `(:output-translations (,(merge-pathnames \"**/*.*\" (truename \"./\")) ,(merge-pathnames \"spikes/out/routing-c4-fasl/**/*.*\" (truename \"./\"))) :ignore-inherited-configuration))
(pushnew :arcdocdb-worker-routing-bench-library *features*)
(handler-bind ((warning (lambda (condition) (error condition))))
 (multiple-value-bind (fasl warnings failure)
     (compile-file \"tools/worker-routing-bench.lisp\" :output-file \"spikes/out/worker-routing-bench.fasl\")
   (assert fasl) (assert (null warnings)) (assert (null failure))
   (load fasl)))
(uiop:symbol-call '#:arcdocdb.worker-routing.bench '#:load-product)
(let ((result (uiop:symbol-call '#:arcdocdb.worker-routing.bench '#:self-test)))
 (assert (eq :ok (getf result :status)))
 (format t \"~&Strict whole COMPILE-FILE/FASL self-test PASS: ~S~%\" result))
")
  (:PATH
   #A((119) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-v2-skkktsa6/ArcDocDB/spikes/out/routing-targeted.lisp")
   :BYTES 856 :SHA256 "0dc6dda91b8e21815b13341f0ebfecd000392df42f9f901033c408764b2e07ef" :GIT-BLOB
   "fab39e64e33add2437f8f57e06208eb7670b2693" :TEXT "(require :asdf)
(setf asdf:*compile-file-failure-behaviour* :error asdf:*compile-file-warnings-behaviour* :error)
(asdf:initialize-output-translations `(:output-translations (,(merge-pathnames \"**/*.*\" (truename \"./\")) ,(merge-pathnames \"spikes/out/routing-target-fasl/**/*.*\" (truename \"./\"))) :ignore-inherited-configuration))
(handler-bind ((warning (lambda (condition) (unless (typep condition 'sb-kernel:redefinition-warning) (error condition)))))
 (asdf:load-asd (merge-pathnames \"arcdocdb.asd\" (truename \"./\")))
 (asdf:load-system \"arcdocdb/tests\" :force t))
(let ((tests (remove-if-not (lambda (name) (search \"ROUTING\" (symbol-name name))) arcdocdb.series.tests::*tests*)))
 (assert (= 18 (length tests)))
 (dolist (test (reverse tests)) (funcall test) (format t \"ok    ~A~%\" test))
 (format t \"~&Routing target: ~D tests PASS.~%\" (length tests)))
")))
