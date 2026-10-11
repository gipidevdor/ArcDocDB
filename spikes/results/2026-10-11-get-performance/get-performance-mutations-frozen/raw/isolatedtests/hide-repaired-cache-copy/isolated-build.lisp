(DEFPARAMETER *PERFORMANCE-SUITE-FILES*
  '("tests/foundation/support.lisp" "tests/get-performance/support.lisp"
    "tests/get-performance/paths.lisp" "tests/get-performance/guards.lisp"
    "tests/get-performance/threads.lisp"))
(DEFPARAMETER *PERFORMANCE-EXPECTED*
  '("TEST-REQ-AFF-002-PERFORMANCE-FILE-V1-VALUE16"
    "TEST-REQ-AFF-002-PERFORMANCE-FILE-V1-VALUE256"
    "TEST-REQ-AFF-002-PERFORMANCE-FILE-V1-VALUE4096"
    "TEST-REQ-AFF-002-PERFORMANCE-FILE-V2-VALUE16"
    "TEST-REQ-AFF-002-PERFORMANCE-FILE-V2-VALUE256"
    "TEST-REQ-AFF-002-PERFORMANCE-FILE-V2-VALUE4096"
    "TEST-REQ-CCH-002-PERFORMANCE-CACHE-HIT-V1"
    "TEST-REQ-CCH-002-PERFORMANCE-CACHE-HIT-V2"
    "TEST-REQ-IDX-001-PERFORMANCE-ABSENT"
    "TEST-REQ-MVC-005-PERFORMANCE-SNAPSHOT-BOXED-LATE"
    "TEST-REQ-MVC-004-PERFORMANCE-SNAPSHOT-FINAL-AUTHORIZATION"
    "TEST-REQ-AFF-002-PERFORMANCE-OUTPUT-COPY"
    "TEST-REQ-AFF-002-PERFORMANCE-PREFIX-BOUNDARY"
    "TEST-REQ-AFF-002-PERFORMANCE-MAX-U64-VERIFICATION"
    "TEST-REQ-CCH-004-PERFORMANCE-CACHE-CRC-FALLBACK"
    "TEST-REQ-AFF-002-PERFORMANCE-PERSISTENT-CRC-GUARD"
    "TEST-REQ-CMP-007-PERFORMANCE-CLEANUP"
    "TEST-REQ-CCH-004-PERFORMANCE-CACHE-REPAIR-HIT"
    "TEST-REQ-CON-004-PERFORMANCE-SHARED-READERS4"))
(DEFPARAMETER *TARGET-FILE* '"src/cache/read.lisp")
(DEFPARAMETER *TARGET-MD5*
  '#A((32) BASE-CHAR . "bb439a27ec15015da690faae75fcc760"))
(require :asdf)
(require :sb-md5)
(in-package #:cl-user)
(defvar *current-test* nil)
(defvar *passed-tests* nil)
(defun child-md5 (path)
  (format nil "~(~{~2,'0X~}~)" (coerce (sb-md5:md5sum-file path) 'list)))
(defun compile-local (file)
  (let ((output (merge-pathnames (make-pathname :type "fasl" :defaults file) #p"fasl/")))
    (ensure-directories-exist output)
    (multiple-value-bind (fasl warnings failed) (compile-file file :output-file output)
      (when (or warnings failed (null fasl)) (error "Compilazione suite non valida: ~A" file))
      (load fasl))))
(defun condition-in-package-p (condition package-name name)
  (let* ((package (find-package package-name)) (symbol (and package (find-symbol name package))))
    (and symbol (find-class symbol nil) (typep condition symbol))))
(defun semantic-kind (condition)
  (cond
    ((or (typep condition 'sb-ext:timeout)
         (condition-in-package-p condition "ARCDOCDB.GET.PERFORMANCE.TESTS" "PERFORMANCE-FIXTURE-TIMEOUT"))
     :fixture-timeout)
    ((or (condition-in-package-p condition "ARCDOCDB.CONDITIONS" "IO-FAULT")
         (condition-in-package-p condition "SB-POSIX" "SYSCALL-ERROR")) :infrastructure)
    ((condition-in-package-p condition "ARCDOCDB.CONDITIONS" "ARCDOCDB-ERROR") :product-condition)
    ((and (typep condition 'simple-error)
          (let ((control (simple-condition-format-control condition)))
            (and (stringp control) (uiop:string-prefix-p "Asserzione fallita:" control)))) :assertion)
    (t :infrastructure)))
(defun get-performance-child-main ()
  (let ((phase :setup) (failure nil) (code 0) (failure-kind nil)
        (product-compiled nil) (suite-compiled nil) (target nil))
    (handler-case
        (let* ((*standard-output* *error-output*) (root (truename "./"))
               (destination (merge-pathnames "fasl/" root))
               (source (merge-pathnames *target-file* root)))
          (asdf:initialize-source-registry `(:source-registry (:directory ,root) :ignore-inherited-configuration))
          (asdf:initialize-output-translations
           `(:output-translations
             (,(merge-pathnames "**/*.*" root) ,(merge-pathnames "**/*.*" destination))
             :ignore-inherited-configuration))
          (unless (uiop:subpathp (asdf:apply-output-translations (make-pathname :type "fasl" :defaults source))
                                destination)
            (error "Cache ASDF non isolata."))
          (unless (string= *target-md5* (child-md5 source)) (error "Bersaglio child diverso dalla copia attestata."))
          (handler-bind ((warning (lambda (condition)
                                   (unless (typep condition 'sb-kernel:redefinition-warning)
                                     (error condition)))))
            (setf phase :compile-product)
            (asdf:load-asd (merge-pathnames "arcdocdb.asd" root))
            (asdf:load-system "arcdocdb" :force t)
            (setf product-compiled t phase :attest-product)
            (let ((fasl (asdf:apply-output-translations (make-pathname :type "fasl" :defaults source))))
              (unless (and (probe-file fasl) (uiop:subpathp fasl destination)
                           (string= *target-md5* (child-md5 source)))
                (error "FASL privato del bersaglio non attestabile."))
              (setf target (list :file *target-file* :source-md5 (child-md5 source)
                                 :fasl (namestring fasl) :fasl-md5 (child-md5 fasl))))
            (setf phase :compile-suite)
            (dolist (file *performance-suite-files*) (compile-local file))
            (setf suite-compiled t phase :validate-suite))
          (let* ((package (or (find-package "ARCDOCDB.GET.PERFORMANCE.TESTS")
                              (error "Package performance assente.")))
                 (registry (find-symbol "*GET-PERFORMANCE-TESTS*" package))
                 (selected (second sb-ext:*posix-argv*)))
            (unless (and registry (boundp registry)
                         (equal *performance-expected*
                                (mapcar #'symbol-name (reverse (symbol-value registry)))))
              (error "Registro performance diverso dai DEFTEST congelati."))
            (dolist (name *performance-expected*)
              (let ((symbol (find-symbol name package)))
                (unless (and symbol (fboundp symbol)) (error "Test performance assente: ~A" name))))
            (when (and selected (not (member selected *performance-expected* :test #'string=)))
              (error "Test selezionato non preregistrato."))
            (setf phase :tests)
            (dolist (name *performance-expected*)
              (when (or (null selected) (string= name selected))
                (setf *current-test* name)
                (funcall (find-symbol name package))
                (push name *passed-tests*)))
            (setf *current-test* nil phase :complete)))
      (error (condition)
        (setf failure condition failure-kind (if (eq phase :tests) (semantic-kind condition) :infrastructure)
              code (if (and (eq phase :tests) (member failure-kind '(:assertion :product-condition))) 1 2))
        (format *error-output* "~&~A: ~A~%" (type-of condition) condition)))
    (let ((*print-readably* t))
      (write (list :schema-version 1 :kind :get-performance-mutation-child :phase phase
                   :status (if failure :failed :ok) :product-compiled product-compiled
                   :suite-compiled suite-compiled :compiled-target target
                   :failed-test *current-test* :passed-tests (reverse *passed-tests*)
                   :failure-kind failure-kind :condition-type (when failure (princ-to-string (type-of failure)))
                   :diagnostic (when failure (princ-to-string failure))) :pretty t)
      (terpri) (finish-output))
    (sb-ext:exit :code code)))
(get-performance-child-main)
