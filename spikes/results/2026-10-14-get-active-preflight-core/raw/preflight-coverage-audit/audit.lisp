;;;; Independent preflight coverage audit. No product, report or FASL is LOADed.
;;;; Adapted from historical audit ce7877778ada522c45a3136b6f74997574e41d154004bfb0f8aaf4fd24621163.
;;;; ASDF enumeration from final helper 2e21d354370e68bb215d59933190fec1267386610d99fc256fff423b509c37bc.
;;;; Original source copies in this owned directory are data/provenance only.
(require :asdf)
(require :sb-posix)
(require :sb-cover)
(declaim (optimize (safety 3) (debug 3)))
(defparameter *auditor-source* *load-truename*)
(defparameter *auditor-directory* (uiop:pathname-directory-pathname *load-truename*))

(define-condition ci-audit-error (error)
  ((message :initarg :message :reader audit-message))
  (:report (lambda (condition stream) (write-string (audit-message condition) stream))))

(defun demand (condition control &rest arguments)
  (unless condition
    (error 'ci-audit-error :message (apply #'format nil control arguments))))

(defun read-native (path)
  (uiop:symbol-call :arcdocdb.evidence :read-evidence path))

(defun native-sha256 (path)
  (uiop:symbol-call :arcdocdb.evidence :file-sha256 path))


(defun git-output (workspace &rest arguments)
  (uiop:run-program (append '("git") arguments) :directory workspace
                    :output :string :error-output :string))

(defun line-output (workspace &rest arguments)
  (string-right-trim '(#\Newline #\Return) (apply #'git-output workspace arguments)))

(defun expected-source-tree (workspace commit)
  "Require every native source path and blob to equal the explicit Git tree."
  (let ((entries nil))
    (dolist (entry (uiop:split-string
                   (git-output workspace "ls-tree" "-r" "-z" "--full-tree" commit)
                   :separator '(#\Null)))
      (when (plusp (length entry))
        (let* ((tab (position #\Tab entry))
               (metadata (and tab (uiop:split-string (subseq entry 0 tab) :separator '(#\Space))))
               (path (and tab (subseq entry (1+ tab)))))
          (demand (and (= 3 (length metadata)) (string= "blob" (second metadata))
                       (member (first metadata) '("100644" "100755") :test #'equal) path)
                  "Unsupported Git tree entry ~S." entry)
          (unless (uiop:string-prefix-p "spikes/results/" path)
            (push (list :path path :git-blob (third metadata)) entries)))))
    (demand entries "Explicit expected source tree is empty.")
    (sort entries #'string< :key (lambda (entry) (getf entry :path)))))


(defun walk-files (directory)
  "Inventory all regular files, including hidden files; reject symlinks/special files."
  (let ((files nil) (count 0))
    (labels ((walk (base depth)
               (demand (<= depth 128) "Artifact directory depth exceeds limit.")
               (dolist (path (directory (make-pathname :name :wild :type :wild :defaults base)
                                        :resolve-symlinks nil))
                 (demand (<= (incf count) 100000) "Artifact inventory exceeds entry limit.")
                 (let ((mode (sb-posix:stat-mode (sb-posix:lstat (string-right-trim "/" (namestring path))))))
                   (cond ((sb-posix:s-isdir mode) (walk (uiop:ensure-directory-pathname path) (1+ depth)))
                         ((sb-posix:s-isreg mode) (push path files))
                         (t (demand nil "Artifact contains a symlink or special file: ~A." path)))))))
      (walk directory 0))
    (sort files #'string< :key #'namestring)))

(defun byte-inventory (directory)
  "Capture raw downloaded bytes without decoding, executing, or modifying them."
  (loop for path in (walk-files directory)
        collect (list :path (enough-namestring path directory)
                      :bytes (uiop:symbol-call :arcdocdb.evidence :file-bytes path)
                      :sha256 (native-sha256 path))))

(defun source-token (line prefix)
  "Extract only the current frozen source's simple token spelling; no Lisp reader."
  (demand (uiop:string-prefix-p prefix line) "Source prefix mismatch: ~S." line)
  (let* ((start (length prefix))
         (end (position-if (lambda (character) (find character " ()")) line :start start))
         (token (subseq line start (or end (length line)))))
    (demand (plusp (length token)) "Missing source token: ~S." line)
    (string-upcase token)))

(defun frozen-test-names (options files)
  (loop for file in files append
        (loop for line in (uiop:split-string
                          (git-output (getf options :workspace) "show"
                                      (format nil "~A:~A" (getf options :commit) file))
                          :separator '(#\Newline))
              when (uiop:string-prefix-p "(deftest " line)
                collect (format nil "ok    ~A" (source-token line "(deftest ")))))


(defparameter *active-source-files*
  '("src/get-resolver/package.lisp" "src/get-resolver/types.lisp"
    "src/get-resolver/rows.lisp" "src/get-resolver/read.lisp"
    "src/get-resolver/active-types.lisp" "src/get-resolver/active-directory.lisp"
    "src/get-resolver/active-scan.lisp" "src/get-resolver/active-build.lisp"
    "src/get-resolver/active-preflight.lisp" "src/get-resolver/active-read.lisp"))
(defparameter *closed-source-files*
  '("src/get-resolver/package.lisp" "src/get-resolver/types.lisp"
    "src/get-resolver/scan.lisp" "src/get-resolver/sort.lisp"
    "src/get-resolver/rows.lisp" "src/get-resolver/build.lisp"
    "src/get-resolver/read.lisp"))

(defun audit-wrapper (path options expected-tree &optional (status :ok))
  (let* ((record (read-native path)) (environment (getf record :environment))
         (before (getf record :source-blobs-before)) (after (getf record :source-blobs-after))
         (sorted (sort (copy-list before) #'string< :key (lambda (entry) (getf entry :path)))))
    (demand (and (eql 1 (getf record :schema-version)) (eq :command-verification (getf record :kind))
                 (eq status (getf record :status)) (eq :stable (getf record :source-consistency))
                 (equal before after) (equal sorted expected-tree)
                 (equal (getf options :commit) (getf environment :commit))
                 (stringp (getf environment :working-tree))
                 (zerop (length (getf environment :working-tree)))
                 (equal (namestring (getf options :workspace)) (getf environment :cwd))
                 (typep (getf record :started-at-universal-time) '(integer 1))
                 (typep (getf record :finished-at-universal-time) '(integer 1))
                 (<= (getf record :started-at-universal-time) (getf record :finished-at-universal-time))
                 (stringp (getf record :stdout)) (stringp (getf record :stderr))
                 (if (eq status :ok) (eql 0 (getf record :exit-code))
                     (and (integerp (getf record :exit-code)) (plusp (getf record :exit-code)))))
            "Wrapper native identity, finality, status or full source tree differs: ~A." path)
    record))


(defun read-one-form-bytes (path)
  "Raw SB-COVER is data, with read-eval disabled and exactly one form/EOF."
  (uiop:symbol-call
   :arcdocdb.evidence :call-with-evidence-bytes path
   (lambda (plain)
     (with-open-file (stream plain :external-format :utf-8)
       (with-standard-io-syntax
         (let* ((*read-eval* nil) (*package* (find-package :sb-cover))
                (eof (gensym "EOF")) (form (read stream nil eof)))
           (demand (and (not (eq eof form)) (eq eof (read stream nil eof)))
                   "Expected one raw data form and EOF: ~A." path)
           form))))))

(defun raw-counts (entry)
  "Independently count raw paths and complete two-direction decisions."
  (let* ((tail (cdr entry))
         (marks (if (and (consp tail) (typep (car tail) 'simple-vector)
                         (typep (cdr tail) 'bit-vector))
                    (progn
                      (demand (= (length (car tail)) (length (cdr tail))) "Raw vectors differ.")
                      (loop for path across (car tail) for bit across (cdr tail)
                            collect (cons path (= bit 1))))
                    tail))
         (seen (make-hash-table :test #'equal)) (branches (make-hash-table :test #'equal))
         (et 0) (ec 0) (bt 0) (bc 0))
    (demand (and (listp marks) (list-length marks) (<= (length marks) 100000)) "Invalid raw marks.")
    (dolist (mark marks)
      (demand (and (consp mark) (member (cdr mark) '(nil t))) "Invalid raw mark.")
      (let* ((path (car mark)) (direction (car path))
             (branch (member direction '(:then :else))) (indices (if branch (cdr path) path)))
        (demand (and (listp path) (list-length path) (<= (length path) 1024)
                     (every (lambda (n) (typep n '(integer 0))) indices)
                     (not (gethash path seen))) "Invalid/duplicate raw source path ~S." path)
        (setf (gethash path seen) t)
        (if branch
            (setf (getf (gethash indices branches) direction) (if (cdr mark) :covered :uncovered))
            (progn (incf et) (when (cdr mark) (incf ec))))))
    (maphash (lambda (indices pair)
               (demand (and (getf pair :then) (getf pair :else)) "Missing branch direction ~S." indices)
               (incf bt 2)
               (dolist (direction '(:then :else)) (when (eq :covered (getf pair direction)) (incf bc))))
             branches)
    (list :expressions-covered ec :expressions-total et :branches-covered bc :branches-total bt)))

(defun evidence-text (path)
  (uiop:symbol-call :arcdocdb.evidence :call-with-evidence-bytes path
                   (lambda (plain) (uiop:read-file-string plain :external-format :utf-8))))

(defun html-cell-counts (row)
  (loop with start = 0 for tag = (search "<td>" row :start2 start) while tag
        for end = (search "</td>" row :start2 (+ tag 4))
        do (demand end "HTML td not closed.") (setf start (+ end 5))
        collect (string-trim '(#\Space) (subseq row (+ tag 4) end))))

(defun audit-coverage (command-path directory scope options tree)
  (let* ((record (audit-wrapper command-path options tree))
         (expected (if (eq scope :active) *active-source-files* *closed-source-files*))
         (expected-names (getf options (if (eq scope :active) :active-names :closed-names)))
         (names (remove-if-not (lambda (line) (uiop:string-prefix-p "ok    " line))
                               (uiop:split-string (getf record :stdout) :separator '(#\Newline))))
         (summary (read-native (merge-pathnames "coverage-summary.lisp" directory)))
         (raw-path (merge-pathnames "coverage-state.lisp" directory))
         (state (read-one-form-bytes raw-path))
         (files (getf summary :files)) (index-path (merge-pathnames "cover-index.html" directory))
         (html (evidence-text index-path))
         (keys '(:expressions-covered :expressions-total :branches-covered :branches-total))
         (totals (list :expressions-covered 0 :expressions-total 0 :branches-covered 0 :branches-total 0))
         (results nil))
    (demand (and (eql 1 (getf summary :schema-version)) (eq :get-resolver-coverage (getf summary :kind))
                 (eq :ok (getf summary :status)) (eq scope (getf summary :scope))
                 (getf summary :coverage-reset-before-suite)
                 (equal expected (mapcar (lambda (file) (getf file :path)) files))
                 (equal names expected-names)
                 (= (1+ (length expected)) (length (directory (merge-pathnames "*.html" directory))))
                 (equal (namestring raw-path) (getf summary :raw-state))
                 (equal (namestring index-path) (getf summary :html-index))
                 (member :not-mcdc (getf summary :limits))
                 (member :no-c1-or-release-qualification (getf summary :limits)))
            "Coverage schema/scope/files/identities/HTML cardinality/limits differ for ~S." scope)
    (demand (and (listp state) (list-length state) (<= (length state) 10000)) "Raw coverage state invalid.")
    (dolist (file files)
      (let* ((relative (getf file :path))
             (source (namestring (merge-pathnames relative (getf options :workspace))))
             (entries (remove-if-not (lambda (entry) (and (consp entry) (equal source (car entry)))) state))
             (counts (and (= 1 (length entries)) (raw-counts (first entries))))
             (leaf (file-namestring relative)) (anchor (format nil "'>~A</a>" leaf))
             (anchor-pos (search anchor html))
             (row-start (and anchor-pos (search "<tr " html :end2 anchor-pos :from-end t)))
             (row-end (and anchor-pos (search "</tr>" html :start2 anchor-pos)))
             (row (and row-start row-end (subseq html row-start row-end)))
             (href-start (and row (search "href='" row)))
             (href-end (and href-start (position #\' row :start (+ href-start 6))))
             (href (and href-end (subseq row (+ href-start 6) href-end)))
             (cells (and row (html-cell-counts row))))
        (demand (and counts (equal source (getf file :source-path))
                     (every (lambda (key) (= (getf file key) (getf counts key))) keys)
                     href (not (find #\/ href)) (uiop:string-suffix-p href ".html")
                     (probe-file (merge-pathnames href directory)) (= 6 (length cells))
                     (= (getf counts :expressions-covered) (parse-integer (first cells)))
                     (= (getf counts :expressions-total) (parse-integer (second cells)))
                     (= (getf counts :branches-covered) (parse-integer (fourth cells)))
                     (= (getf counts :branches-total) (parse-integer (fifth cells)))
                     (if (zerop (getf counts :branches-total)) (equal "-" (sixth cells)) t))
                "Coverage raw/summary/HTML row mismatch: ~A." relative)
        (let ((source-html (evidence-text (merge-pathnames href directory))))
          (demand (and (search source source-html)
                       (search (format nil "<td>expression</td><td>~D</td><td>~D</td>"
                                       (getf counts :expressions-covered) (getf counts :expressions-total)) source-html)
                       (search (format nil "<td>branch</td><td>~D</td><td>~D</td>"
                                       (getf counts :branches-covered) (getf counts :branches-total)) source-html))
                  "Source HTML counts/path differ for ~A." relative))
        (dolist (key keys) (incf (getf totals key) (getf counts key)))
        (push (append (list :path relative :html-leaf href) counts) results)))
    (demand (equal totals (getf summary :totals)) "Coverage totals differ: ~S." scope)
    (list :scope scope :native-report (namestring command-path) :raw-data-and-eof t
          :named-tests (length names) :names-and-order-match t :source-files (length files)
          :html-files (1+ (length files)) :raw-summary-html-counts-match t
          :totals totals :files (reverse results) :status :ok)))


(defun frozen-asdf-source-files (options tree)
  "Read frozen ASD as data, never evaluate/load it; derive registered source files."
  (let* ((text (git-output (getf options :workspace) "show"
                           (format nil "~A:arcdocdb.asd" (getf options :commit))))
         (systems nil) (files nil))
    (demand (<= (length text) 1048576) "Frozen ASD source exceeds budget.")
    (with-standard-io-syntax
      (let ((*read-eval* nil) (*package* (find-package :asdf-user)) (eof (gensym "EOF")))
        (with-input-from-string (stream text)
          (loop for form = (read stream nil eof) until (eq eof form)
                do (when (and (consp form) (symbolp (first form))
                              (equal "DEFSYSTEM" (symbol-name (first form)))
                              (member (second form) '("arcdocdb" "arcdocdb/tests") :test #'equal))
                     (push form systems))))))
    (demand (and (= 2 (length systems))
                 (= 2 (length (remove-duplicates systems :key #'second :test #'equal))))
            "Require exactly the frozen product and test ASDF systems.")
    (labels ((leaf-p (name)
               (and (stringp name) (plusp (length name))
                    (not (find-if (lambda (c) (find c "/\\:*?[] .")) name))))
             (walk (components base)
               (demand (and components (listp components)) "Missing frozen ASDF components.")
               (loop for component in components append
                 (progn
                   (demand (and (consp component) (leaf-p (second component))
                                (null (getf (cddr component) :pathname)))
                           "Unsupported frozen ASDF component ~S." component)
                   (ecase (first component)
                     (:file (list (concatenate 'string base (second component) ".lisp")))
                     (:module (walk (getf (cddr component) :components)
                                    (concatenate 'string base (second component) "/"))))))))
      (dolist (system systems)
        (let ((base (getf (cddr system) :pathname)))
          (demand (equal base (if (equal "arcdocdb" (second system)) "src/" "tests/"))
                  "Unsupported frozen ASDF system pathname.")
          (setf files (append files (walk (getf (cddr system) :components) base))))))
    (demand (and files (= (length files) (length (remove-duplicates files :test #'equal)))
                 (every (lambda (path)
                          (find path tree :test #'equal :key (lambda (entry) (getf entry :path)))) files))
            "Frozen ASDF files duplicate or differ from the complete Git source tree.")
    (sort files #'string<)))



(defun frozen-forms (options path &optional (package :cl-user))
  "Read frozen source as data, with standard reader, READ-EVAL NIL and EOF."
  (let ((text (git-output (getf options :workspace) "show"
                          (format nil "~A:~A" (getf options :commit) path)))
        (forms nil))
    (demand (<= (length text) 1048576) "Frozen source exceeds reader budget: ~A." path)
    (with-standard-io-syntax
      (let ((*read-eval* nil) (*package* (find-package package)) (eof (gensym "EOF")))
        (with-input-from-string (stream text)
          (loop for form = (read stream nil eof) until (eq form eof) do (push form forms)))))
    (reverse forms)))

(defun frozen-test-order (options module expected)
  "Derive test file order from the frozen serial ASDF module, never LOAD ASD."
  (let* ((systems (remove-if-not
                   (lambda (form) (and (consp form) (symbolp (first form))
                                       (equal "DEFSYSTEM" (symbol-name (first form)))
                                       (equal "arcdocdb/tests" (second form))))
                   (frozen-forms options "arcdocdb.asd" :asdf-user)))
         (system (first systems))
         (modules (remove-if-not
                   (lambda (component) (and (eq :module (first component))
                                            (equal module (second component))))
                   (getf (cddr system) :components)))
         (component (first modules))
         (children (getf (cddr component) :components)))
    (demand (and (= 1 (length systems)) (= 1 (length modules))
                 (eq t (getf (cddr system) :serial)) (eq t (getf (cddr component) :serial))
                 (every (lambda (child) (and (eq :file (first child)) (= 2 (length child)))) children)
                 (equal expected (mapcar #'second children)))
            "Frozen ASDF test module/order differs: ~A." module)
    (mapcar (lambda (name) (format nil "tests/~A/~A.lisp" module name)) (rest expected))))

(defun current-source-tree (workspace)
  "Mirror the native recorder's exact NUL Git selection and hash every current source."
  (let* ((paths (remove-if
                 (lambda (path) (or (zerop (length path))
                                    (uiop:string-prefix-p "spikes/results/" path)))
                 (uiop:split-string
                  (git-output workspace "ls-files" "-z" "--cached" "--others" "--exclude-standard")
                  :separator '(#\Null)))))
    (demand (and (<= 1 (length paths) 4096)
                 (= (length paths) (length (remove-duplicates paths :test #'equal)))
                 (<= (reduce #'+ paths :key #'length) 200000))
            "Current source selection is empty, duplicate or over budget.")
    (dolist (path paths)
      (let ((absolute (merge-pathnames path workspace)))
        (demand (sb-posix:s-isreg (sb-posix:stat-mode (sb-posix:lstat (namestring absolute))))
                "Source is absent, symbolic or special: ~A." path)))
    (let ((hashes (uiop:split-string
                   (apply #'line-output workspace "hash-object" "--" paths)
                   :separator '(#\Newline))))
      (demand (= (length hashes) (length paths)) "Current source hashes are incomplete.")
      (sort (loop for path in paths for hash in hashes collect (list :path path :git-blob hash))
            #'string< :key (lambda (entry) (getf entry :path))))))

(defun producer-mapping (options)
  "Attest the exact frozen mapping form and its call before both force loads."
  (let* ((forms (frozen-forms options "tools/get-resolver-coverage.lisp"))
         (mapping (remove-if-not (lambda (form) (and (consp form) (eq 'defun (first form))
                                                    (eq 'isolate-output (second form)))) forms))
         (coverage (remove-if-not (lambda (form) (and (consp form) (eq 'defun (first form))
                                                     (eq 'coverage (second form)))) forms))
         (body (cdddr (first mapping)))
         (expected
           '((let ((destination (merge-pathnames "fasl/" directory)))
               (asdf:initialize-output-translations
                `(:output-translations
                  (,(merge-pathnames "**/*.*" root) ,(merge-pathnames "**/*.*" destination))
                  :ignore-inherited-configuration))
               (dolist (relative (append (scope-files scope) (list (suite-support scope))))
                 (let* ((source (merge-pathnames relative root))
                        (fasl (make-pathname :type "fasl" :defaults source))
                        (actual (asdf:apply-output-translations fasl)))
                   (unless (uiop:subpathp actual destination)
                     (reject :cache-not-isolated "Cache non privata per ~A: ~A." source actual))))
               t)))
         (handler (find 'handler-bind (cdddr (first coverage)) :key
                        (lambda (form) (and (consp form) (first form))))))
    (when (stringp (first body)) (setf body (rest body)))
    (demand (and (= 1 (length mapping)) (= 1 (length coverage))
                 (equal '(root directory scope) (third (first mapping)))
                 ;; SBCL represents commas in backquote as structures; compare their
                 ;; canonical readable form rather than object identity via EQUAL.
                 (equal (with-standard-io-syntax (write-to-string body :readably t :pretty nil))
                        (with-standard-io-syntax (write-to-string expected :readably t :pretty nil)))
                 (equal '(isolate-output root directory scope) (fourth handler))
                 (equal '(asdf:load-system "arcdocdb" :force t) (fifth handler))
                 (equal '(asdf:load-system "arcdocdb/tests" :force t) (sixth handler))
                 (equal '(sb-cover:reset-coverage) (seventh handler)))
            "Frozen coverage producer mapping/call order differs from the canonical form.")
    (list :producer "tools/get-resolver-coverage.lisp" :canonical-form-match t
          :mapping :recursive-workspace-to-report-private-fasl
          :inherited-translations :ignored :both-systems-force-loaded t)))

(defun audit-private-fasl (directory registered)
  "Hash FASL bytes only; exact path set must equal frozen registered ASDF sources."
  (let* ((base (truename (merge-pathnames "fasl/" directory)))
         (inventory (byte-inventory base))
         (expected (sort (mapcar (lambda (source)
                                  (demand (uiop:string-suffix-p source ".lisp") "Non-Lisp ASDF source.")
                                  (concatenate 'string (subseq source 0 (- (length source) 5)) ".fasl"))
                                registered) #'string<)))
    (demand (and (uiop:subpathp base directory)
                 (equal expected (mapcar (lambda (entry) (getf entry :path)) inventory))
                 (every (lambda (entry) (plusp (getf entry :bytes))) inventory))
            "Private FASL inventory is incomplete, extra, empty or outside the report root: ~A." base)
    (list :directory (namestring base) :registered-source-count (length registered)
          :exact-asdf-mapping t :fasl-count (length inventory) :files inventory
          :read-mode :byte-hash-only :loaded-or-executed nil)))

(defun canonical-argument (argument workspace &optional directory-p)
  (truename (merge-pathnames (if directory-p (uiop:ensure-directory-pathname argument) argument)
                             workspace)))

(defun audit-coverage-command (record directory scope workspace)
  "Require the native argv to select this producer, this output and only this suite."
  (let* ((argv (getf record :command)) (position (position "--script" argv :test #'equal))
         (tail (and position (nthcdr (1+ position) argv)))
         (arguments (rest tail)) (report nil) (suite nil) (seen nil))
    (demand (and (listp argv) (list-length argv) (<= 4 (length argv) 12)
                 (string-equal "sbcl" (pathname-name (first argv)))
                 position
                 (equal (subseq argv 1 position)
                        '("--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"))
                 (equal (canonical-argument (first tail) workspace)
                        (merge-pathnames "tools/get-resolver-coverage.lisp" workspace))
                 (member (length arguments) '(2 4)))
            "Coverage command producer/shape differs: ~S." argv)
    (loop for (key value) on arguments by #'cddr do
      (demand (and value (member key '("--report" "--suite") :test #'equal)
                   (not (member key seen :test #'equal))) "Coverage arguments differ: ~S." arguments)
      (push key seen)
      (if (equal key "--report") (setf report value) (setf suite value)))
    (demand (and report (equal directory (canonical-argument report workspace t))
                 (if (eq scope :active) (equal suite "active")
                     (or (null suite) (equal suite "closed"))))
            "Coverage command suite or output directory differs: ~S." argv)
    t))

(defun complete-coverage-audit (command-path directory scope options tree registered)
  (let* ((record (audit-wrapper command-path options tree))
         (summary (read-native (merge-pathnames "coverage-summary.lisp" directory)))
         (result (audit-coverage command-path directory scope options tree))
         (lines (uiop:split-string (getf record :stdout) :separator '(#\Newline)))
         (suite-line (if (eq scope :active) "42 test GET ACTIVE superati." "42 test resolver GET superati."))
         (html-leaves (cons "cover-index.html"
                            (mapcar (lambda (file) (getf file :html-leaf)) (getf result :files))))
         (actual-html (mapcar #'file-namestring (directory (merge-pathnames "*.html" directory)))))
    (audit-coverage-command record directory scope (getf options :workspace))
    (demand (and (equal (getf summary :suite)
                        (if (eq scope :active) "arcdocdb.get.active.tests:run" "arcdocdb.get.resolver.tests:run"))
                 (= 1 (count suite-line lines :test #'equal))
                 (= (length html-leaves) (length (remove-duplicates html-leaves :test #'equal)))
                 (equal (sort (copy-list html-leaves) #'string<) (sort actual-html #'string<)))
            "Coverage suite summary or exact linked HTML inventory differs: ~S." scope)
    (append result (list :command-exact-scope-and-output t :exact-html-set t
                         :fasl (audit-private-fasl directory registered)))))

(defun option-key (name)
  (cdr (assoc name '(("--workspace" . :workspace) ("--commit" . :commit)
                    ("--active-command" . :active-command) ("--active-dir" . :active-dir)
                    ("--closed-command" . :closed-command) ("--closed-dir" . :closed-dir)
                    ("--output" . :output)) :test #'equal)))

(defun parse-options (arguments)
  (demand (= 14 (length arguments)) "Require seven explicit option/value pairs.")
  (let ((options nil))
    (loop for (name value) on arguments by #'cddr for key = (option-key name) do
      (demand (and key value (not (getf options key))) "Unknown/duplicate/missing argument ~S." name)
      (setf (getf options key) value))
    (demand (= 14 (length options)) "Incomplete options.")
    (let ((workspace (truename (uiop:ensure-directory-pathname (getf options :workspace)))))
      (setf (getf options :workspace) workspace)
      (dolist (key '(:active-dir :closed-dir))
        (setf (getf options key) (canonical-argument (getf options key) workspace t)))
      (dolist (key '(:active-command :closed-command))
        (setf (getf options key) (canonical-argument (getf options key) workspace)))
      (let* ((output (merge-pathnames (getf options :output) workspace))
             (parent (truename (uiop:pathname-directory-pathname output))))
        (demand (and (equal parent (truename *auditor-directory*))
                     (pathname-name output) (not (wild-pathname-p output)) (not (probe-file output)))
                "Output must be a fresh file in the owned auditor directory.")
        (setf (getf options :output) (merge-pathnames (file-namestring output) parent))))
    options))

(defun save-audit (path data)
  (with-open-file (stream path :direction :output :if-exists :error :if-does-not-exist :create
                               :external-format :utf-8)
    (with-standard-io-syntax
      (let ((*print-pretty* t)) (write data :stream stream) (terpri stream)))))

(defun stable-source-p (workspace commit tree)
  (and (equal commit (line-output workspace "rev-parse" "HEAD"))
       (zerop (length (line-output workspace "status" "--porcelain")))
       (equal tree (current-source-tree workspace))))

(defun run-audit (options)
  (let* ((workspace (getf options :workspace)) (commit (getf options :commit))
         (tree (expected-source-tree workspace commit))
         (reader (merge-pathnames "tools/evidence-storage.lisp" workspace))
         (reader-blob (getf (find "tools/evidence-storage.lisp" tree :test #'equal
                                  :key (lambda (entry) (getf entry :path))) :git-blob)))
    (demand (and (= 40 (length commit))
                 (equal commit (line-output workspace "rev-parse" commit))
                 (equal reader-blob (line-output workspace "hash-object" "--" (namestring reader)))
                 (stable-source-p workspace commit tree))
            "Reader, current HEAD/clean state or exact source path/blob inventory differs from frozen Git.")
    ;; The only LOAD in this auditor is authenticated trusted reader program code.
    (load reader :verbose nil :print nil)
    (let* ((reader-sha (native-sha256 reader)) (auditor-sha (native-sha256 *auditor-source*))
           (provenance (loop for name in '("coverage-audit-original.lisp.txt" "fasl-audit-original.lisp.txt")
                             for path = (merge-pathnames name *auditor-directory*)
                             collect (list :path name :sha256 (native-sha256 path))))
           (active-files (frozen-test-order options "get-active"
                                           '("support" "construction" "preflight" "directory" "read")))
           (closed-files (frozen-test-order options "get-resolver" '("support" "sort" "construction" "read")))
           (active-names (frozen-test-names options active-files))
           (closed-names (frozen-test-names options closed-files))
           (registered (frozen-asdf-source-files options tree))
           (mapping (producer-mapping options))
           (roots (list (getf options :active-dir) (getf options :closed-dir)
                        (uiop:pathname-directory-pathname (getf options :active-command))
                        (uiop:pathname-directory-pathname (getf options :closed-command)))))
      (demand (and (= 42 (length active-names)) (= 42 (length closed-names))
                   (= 42 (length (remove-duplicates active-names :test #'equal)))
                   (= 42 (length (remove-duplicates closed-names :test #'equal)))
                   (= 4 (length (remove-duplicates roots :test #'equal))))
              "Frozen test counts/names or input directory identity differs.")
      (dolist (root roots)
        (demand (and (uiop:subpathp root workspace)
                     (not (uiop:subpathp *auditor-directory* root))
                     (not (uiop:subpathp (getf options :output) root)))
                "Auditor/output is inside an input group or input is outside workspace: ~A." root))
      (setf (getf options :active-names) active-names (getf options :closed-names) closed-names)
      (let* ((before (mapcar (lambda (root) (list :directory (namestring root) :files (byte-inventory root))) roots))
             (results (list (complete-coverage-audit (getf options :active-command) (getf options :active-dir)
                                                     :active options tree registered)
                            (complete-coverage-audit (getf options :closed-command) (getf options :closed-dir)
                                                     :closed options tree registered)))
             (after (mapcar (lambda (root) (list :directory (namestring root) :files (byte-inventory root))) roots)))
        (demand (and (equal before after) (stable-source-p workspace commit tree)
                     (equal reader-sha (native-sha256 reader))
                     (equal auditor-sha (native-sha256 *auditor-source*))
                     (every (lambda (entry)
                              (equal (getf entry :sha256)
                                     (native-sha256 (merge-pathnames (getf entry :path) *auditor-directory*))))
                            provenance))
                "Input inventories, reader, auditor, provenance or frozen source changed during audit.")
        (list :schema-version 1 :kind :get-active-preflight-coverage-independent-audit :status :ok
              :expected-commit commit :source-count (length tree) :complete-source-path-blobs tree
              :source-path-blob-and-clean-head-before-after t
              :reader-path (namestring reader) :reader-sha256 reader-sha
              :auditor-path (namestring *auditor-source*) :auditor-sha256 auditor-sha
              :provenance-originals provenance :mapping mapping
              :active-test-files active-files :active-test-names active-names
              :closed-test-files closed-files :closed-test-names closed-names
              :registered-asdf-source-files registered :results results
              :two-pass-byte-inventories-match t :inventories before
              :limits '(:data-only-reader-no-raw-load :fasl-byte-hash-only
                        :mapping-provenance-from-frozen-producer-not-a-reexecution
                        :diagnostic-expression-and-branch-counts :not-mcdc
                        :no-c1-or-release-qualification))))))

(let ((options nil))
  (handler-case
      (progn
        (setf options (parse-options (uiop:command-line-arguments)))
        (let ((report (run-audit options)))
          (save-audit (getf options :output) report)
          (format t "STATUS OK: ACTIVE 42/10 files; CLOSED 42/7 files; exact source/ASDF/FASL and raw-summary-HTML; two-pass immutable.~%")))
    (error (condition)
      (when (and options (not (probe-file (getf options :output))))
        (save-audit (getf options :output)
                    (list :schema-version 1 :kind :get-active-preflight-coverage-independent-audit
                          :status :failed :diagnostic (princ-to-string condition))))
      (format *error-output* "AUDIT FAILED: ~A~%" condition)
      (uiop:quit 1))))
