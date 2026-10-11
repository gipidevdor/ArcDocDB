(REQUIRE :ASDF)
(DEFPARAMETER COMMON-LISP-USER::*SNAPSHOT-PRODUCTS*
  '("src/foundation/package.lisp" "src/foundation/conditions.lisp"
    "src/foundation/binary.lisp" "src/foundation/crc32c.lisp"
    "src/foundation/record.lisp" "src/foundation/batch.lisp"
    "src/csn/package.lisp" "src/csn/registry.lisp" "src/mvcc/package.lisp"
    "src/mvcc/types.lisp" "src/mvcc/snapshots-types.lisp"
    "src/mvcc/snapshots-core.lisp" "src/mvcc/snapshots-csn.lisp"
    "src/mvcc/snapshots-register.lisp" "src/mvcc/snapshots-lifecycle.lisp"
    "src/mvcc/snapshots-read.lisp"))
(DEFPARAMETER COMMON-LISP-USER::*SNAPSHOT-SUITE*
  '("tests/foundation/support.lisp" "tests/mvcc/support.lisp"
    "tests/mvcc/lifecycle.lisp" "tests/mvcc/capture.lisp"))
(DEFPARAMETER COMMON-LISP-USER::*SNAPSHOT-EXPECTED*
  '("TEST-REQ-AFF-008-SNAPSHOT-CONFIGURATION-BOUNDARIES"
    "TEST-REQ-AFF-008-SNAPSHOT-CONFIGURATION-TYPED-RANGE-REFUSALS"
    "TEST-REQ-MVC-005-SNAPSHOT-EMPTY-ARCHIVE-CSN-ZERO"
    "TEST-REQ-MVC-005-SNAPSHOT-CANONICAL-OUT-OF-ORDER-ACTIVATION"
    "TEST-REQ-MVC-005-SNAPSHOT-CARRY-U32-AND-BOXED-CSN"
    "TEST-REQ-MVC-007-SNAPSHOT-MAXIMUM-CSN-IS-NOT-ABSENCE"
    "TEST-REQ-MVC-007-SNAPSHOT-SAME-CSN-DISTINCT-GENERATIONS"
    "TEST-REQ-MVC-003-SNAPSHOT-MULTIPIN-RETENTION-BOUNDARIES"
    "TEST-REQ-MVC-007-SNAPSHOT-CONSERVATIVE-THRESHOLD-UNTIL-RECALCULATION"
    "TEST-REQ-AFF-008-SNAPSHOT-CAPACITY-REFUSES-BEFORE-MUTATION"
    "TEST-REQ-MVC-007-SNAPSHOT-PINNED-CONTEXT-REFUSES-BEFORE-MUTATION"
    "TEST-REQ-AFF-008-SNAPSHOT-DEADLINE-OVERFLOW-AND-EXACT-U64-BOUNDARY"
    "TEST-REQ-AFF-008-SNAPSHOT-PRIVATE-FI-GENERATION-EXHAUSTION"
    "TEST-REQ-MVC-004-SNAPSHOT-ACTIVE-READER-DEADLINE-BEFORE-EXACT-AFTER"
    "TEST-REQ-MVC-004-SNAPSHOT-ACTIVE-ACTIVATION-EXPIRY-REMOVES-PIN"
    "TEST-REQ-MVC-004-SNAPSHOT-WAIT-DEADLINE-BEFORE-EXACT-AFTER"
    "TEST-REQ-MVC-004-SNAPSHOT-LIFETIME-INCLUDES-INITIAL-WAIT"
    "TEST-REQ-AFF-008-SNAPSHOT-TIMER-BUDGET-REFUSALS-AND-EMPTY-SWEEP"
    "TEST-REQ-AFF-008-SNAPSHOT-TIMER-CIRCULAR-FAIRNESS-AND-MIXED-DEADLINES"
    "TEST-REQ-MVC-004-SNAPSHOT-TIMER-DISTINGUISHES-WAIT-AND-AGE"
    "TEST-REQ-MVC-007-SNAPSHOT-TERMINATION-IDEMPOTENT-ACTIVE-AND-WAITING"
    "TEST-REQ-MVC-007-SNAPSHOT-STALE-GENERATION-AFTER-CONTEXT-REUSE"
    "TEST-REQ-MVC-007-SNAPSHOT-STALE-CONTEXT-AFTER-SLOT-REUSE"
    "TEST-REQ-MVC-005-SNAPSHOT-PRIVATE-BUFFER-RANGE-AND-UNBOUND-IDENTITY"
    "TEST-REQ-AFF-004-SNAPSHOT-TERMINAL-INVALIDATION-PRESERVES-PINS"
    "TEST-REQ-AFF-004-SNAPSHOT-PRIVATE-FI-READER-CSN-STATE-AND-RANGE"
    "TEST-REQ-AFF-004-SNAPSHOT-PRIVATE-FI-COUNTER-GUARDS"
    "TEST-REQ-AFF-004-SNAPSHOT-PRIVATE-FI-RECALCULATION-INVARIANTS"
    "TEST-REQ-MVC-007-SNAPSHOT-ANNOUNCEMENT-BEFORE-CAPTURE"
    "TEST-REQ-MVC-007-SNAPSHOT-HORIZON-REGRESSION"
    "TEST-REQ-MVC-007-SNAPSHOT-CAPTURED-CSN-BELOW-HORIZON"
    "TEST-REQ-MVC-007-SNAPSHOT-BUSY-ROLLBACK-WITHOUT-PIN"
    "TEST-REQ-MVC-007-SNAPSHOT-BUSY-ROLLBACK-WITH-PIN"
    "TEST-REQ-MVC-007-SNAPSHOT-OTHER-RESOURCE-FAIL-STOP"
    "TEST-REQ-MVC-007-SNAPSHOT-CANONICAL-CONDITION-IDENTITY"
    "TEST-REQ-MVC-007-SNAPSHOT-THROW-AFTER-ANNOUNCEMENT"
    "TEST-REQ-MVC-007-SNAPSHOT-FAULT-BEFORE-PUBLISH"
    "TEST-REQ-MVC-007-SNAPSHOT-FAULT-DURING-PUBLISH"
    "TEST-REQ-MVC-007-SNAPSHOT-FAULT-AFTER-PUBLISH"
    "TEST-REQ-MVC-007-SNAPSHOT-READY-EQUALITY-AND-PUBLISHED-IDENTITY"
    "TEST-REQ-CON-004-SNAPSHOT-HELD-MUTEX-READER-AND-OTHER-ARCHIVE"
    "TEST-REQ-CON-004-SNAPSHOT-RECURSIVE-GUARD-AND-NIL-BODY"
    "TEST-REQ-CON-004-SNAPSHOT-READER-WITH-CSN-MUTEX-HELD"))
(require :asdf)
(require :sb-posix)
(defvar *snapshot-products* nil)
(defvar *snapshot-suite* nil)
(defvar *snapshot-expected* nil)
(defvar *current-test* nil)
(defvar *passed-tests* nil)
(defun compile-local (file)
  (let ((output (merge-pathnames (make-pathname :type "fasl" :defaults file) #p"fasl/")))
    (ensure-directories-exist output)
    (multiple-value-bind (fasl warnings failed) (compile-file file :output-file output)
      (when (or warnings failed) (error "Compilazione non valida: ~A" file))
      (load fasl))))
(defun snapshot-child-main ()
  (let ((phase :compile-product) (failure nil) (code 0) (failure-kind nil))
    (handler-case
        (let ((*standard-output* *error-output*))
          (handler-bind ((warning (lambda (condition) (error condition))))
            (dolist (file *snapshot-products*) (compile-local file))
            (setf phase :compile-tests)
            (dolist (file *snapshot-suite*) (compile-local file)))
          (let* ((package (find-package "ARCDOCDB.MVCC.TESTS"))
                 (tests (reverse (symbol-value (find-symbol "*MVCC-TESTS*" package))))
                 (selected (second sb-ext:*posix-argv*)))
            (unless (equal *snapshot-expected* (mapcar (lambda (entry) (symbol-name (car entry))) tests))
              (error "Registre suite diverse dalla lista congelata."))
            (when (and selected (not (find selected tests :test #'string= :key (lambda (entry) (symbol-name (car entry))))))
              (error "Test nominato sconosciuto."))
            (setf phase :tests)
            (dolist (entry tests)
              (let ((name (symbol-name (car entry))))
                (when (or (null selected) (string= name selected))
                  (setf *current-test* name)
                  (funcall (cdr entry))
                  (push name *passed-tests*))))
            (setf *current-test* nil phase :complete)))
      (error (condition)
        (setf failure condition code (if (eq phase :tests) 1 2)
              failure-kind (if (and (find-package "ARCDOCDB.MVCC.TESTS")
                                    (find-class (find-symbol "CAPTURE-FIXTURE-TIMEOUT" "ARCDOCDB.MVCC.TESTS") nil)
                                    (typep condition (find-symbol "CAPTURE-FIXTURE-TIMEOUT" "ARCDOCDB.MVCC.TESTS")))
                               :fixture-timeout :runtime))
        (format *error-output* "~&~A: ~A~%" (type-of condition) condition)))
    (let ((*print-readably* t))
      (write (list :schema-version 1 :kind :snapshot-mutation-child :phase phase
                   :status (if failure :failed :ok) :failed-test *current-test*
                   :passed-tests (reverse *passed-tests*) :failure-kind failure-kind
                   :diagnostic (when failure (princ-to-string failure))) :pretty t)
      (terpri) (finish-output))
    (sb-ext:exit :code code)))
(snapshot-child-main)
