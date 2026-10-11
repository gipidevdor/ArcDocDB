(REQUIRE :ASDF)
(DEFPARAMETER COMMON-LISP-USER::*READER-PRODUCTS*
  '("src/foundation/package.lisp" "src/foundation/conditions.lisp"
    "src/foundation/binary.lisp" "src/foundation/crc32c.lisp"
    "src/foundation/record.lisp" "src/foundation/batch.lisp"
    "src/csn/package.lisp" "src/csn/registry.lisp" "src/mvcc/package.lisp"
    "src/mvcc/types.lisp" "src/mvcc/snapshots-types.lisp"
    "src/mvcc/snapshots-core.lisp" "src/mvcc/snapshots-csn.lisp"
    "src/mvcc/snapshots-register.lisp" "src/mvcc/snapshots-lifecycle.lisp"
    "src/mvcc/snapshots-read.lisp" "src/epochs/package.lisp"
    "src/epochs/types.lisp" "src/epochs/core.lisp" "src/epochs/read.lisp"
    "src/epochs/retire.lisp" "src/epochs/reclaim.lisp" "src/read/package.lisp"
    "src/read/types.lisp" "src/read/core.lisp" "src/read/task.lisp"))
(DEFPARAMETER COMMON-LISP-USER::*READER-SUITE*
  '("tests/foundation/support.lisp" "tests/epochs/support.lisp"
    "tests/epochs/lifecycle.lisp" "tests/epochs/threads.lisp"
    "tests/read/support.lisp" "tests/read/lifecycle.lisp"
    "tests/read/threads.lisp"))
(DEFPARAMETER COMMON-LISP-USER::*READER-EXPECTED*
  '("TEST-REQ-AFF-008-EBR-VALID-CAPACITIES-AND-INITIAL-STATE"
    "TEST-REQ-AFF-008-EBR-WORKER-CAPACITY-REFUSALS"
    "TEST-REQ-AFF-008-EBR-RETIREMENT-CAPACITY-REFUSALS"
    "TEST-REQ-CMP-005-EBR-CANONICAL-CONTEXT-AND-WORKER-RANGE"
    "TEST-REQ-CMP-005-EBR-ENTER-EXIT"
    "TEST-REQ-CMP-005-EBR-NESTED-ENTRY-PRESERVES-PIN"
    "TEST-REQ-CMP-005-EBR-INACTIVE-EXIT-REFUSED"
    "TEST-REQ-CMP-005-EBR-INDEPENDENT-READERS"
    "TEST-REQ-CMP-005-EBR-OWNER-NONLOCAL-CLEANUP"
    "TEST-REQ-CMP-007-EBR-RESERVATION-RESOURCE-AND-CREDITS"
    "TEST-REQ-CMP-007-EBR-NULL-RESOURCE-PRESERVES-STATE"
    "TEST-REQ-CMP-007-EBR-DUPLICATE-RESOURCE-PRESERVES-STATE"
    "TEST-REQ-AFF-008-EBR-FULL-CAPACITY-PRESERVES-STATE"
    "TEST-REQ-CMP-007-EBR-CANCEL-IS-IDEMPOTENT"
    "TEST-REQ-CMP-007-EBR-PUBLISH-ADVANCES-ONCE"
    "TEST-REQ-CMP-007-EBR-PUBLISHED-RETIREMENT-CANNOT-CANCEL"
    "TEST-REQ-CMP-007-EBR-INVALID-TICKET-STATE-OPERATIONS"
    "TEST-REQ-CMP-007-EBR-STRICT-RECLAIM-THRESHOLD"
    "TEST-REQ-CMP-007-EBR-TWO-OLD-READERS-BLOCK-RECLAIM"
    "TEST-REQ-CMP-007-EBR-NEW-READER-DOES-NOT-BLOCK-OLD-RETIREMENT"
    "TEST-REQ-CMP-007-EBR-THRESHOLD-IS-MONOTONE"
    "TEST-REQ-CMP-007-EBR-RESOURCE-UNTIL-COMPLETION"
    "TEST-REQ-CMP-007-EBR-COMPLETION-IS-IDEMPOTENT"
    "TEST-REQ-CMP-007-EBR-STALE-GENERATION-PRESERVES-REUSE"
    "TEST-REQ-CMP-007-EBR-ZERO-AND-WRONG-GENERATION-PRESERVE-STATE"
    "TEST-REQ-AFF-008-EBR-GENERATION-MAXIMUM-WITHOUT-WRAP"
    "TEST-REQ-AFF-008-EBR-EPOCH-CREDIT-BEFORE-PUBLICATION"
    "TEST-REQ-AFF-008-EBR-CANCEL-RESTORES-EPOCH-CREDIT"
    "TEST-REQ-AFF-004-EBR-METADATA-INCOHERENCE-FAULTS"
    "TEST-REQ-AFF-004-EBR-COUNTER-INCOHERENCE-FAULTS"
    "TEST-REQ-AFF-004-EBR-FUTURE-READER-FAULTS"
    "TEST-REQ-AFF-004-EBR-READER-CLEANUP-AFTER-FAULT"
    "TEST-REQ-CMP-007-EBR-CLAIM-IS-EXCLUSIVE"
    "TEST-REQ-CMP-005-EBR-READER-FINISHES-WITH-MAINTENANCE-MUTEX-HELD"
    "TEST-REQ-MVC-005-READ-CURRENT-BUFFER-UNTOUCHED"
    "TEST-REQ-MVC-005-READ-SNAPSHOT-CSN-ZERO-CARRY-BOXED"
    "TEST-REQ-MVC-004-READ-COMPLETION-KEEPS-SNAPSHOT"
    "TEST-REQ-MVC-004-READ-WAITING-REFUSAL-CLEANS-EPOCH"
    "TEST-REQ-MVC-004-READ-ENDED-BEGIN-CLEANS-EPOCH"
    "TEST-REQ-CON-004-READ-CURRENT-GENERATION-BEFORE-PIN"
    "TEST-REQ-CON-004-READ-SNAPSHOT-ZERO-GENERATION-BEFORE-PIN"
    "TEST-REQ-CON-004-READ-FOREIGN-SNAPSHOT-BEFORE-PIN"
    "TEST-REQ-CON-004-READ-ALREADY-ACTIVE-READER-REFUSAL"
    "TEST-REQ-CON-004-READ-NESTED-KEEPS-EXISTING-PIN"
    "TEST-REQ-MVC-005-READ-INACTIVE-BUFFER-REFUSAL"
    "TEST-REQ-MVC-005-READ-RESULT-RANGE-PRESERVES-BUFFER"
    "TEST-REQ-MVC-004-READ-FINAL-SNAPSHOT-CHECK"
    "TEST-REQ-CMP-007-READ-LOGICAL-EXPIRY-KEEPS-LIVE-EPOCH"
    "TEST-REQ-CON-004-READ-CLOCK-REGRESSION-RELEASES-PIN"
    "TEST-REQ-CMP-007-READ-ABANDON-RELEASES-PIN"
    "TEST-REQ-AFF-004-READ-IDLE-RESIDUAL-GENERATION"
    "TEST-REQ-AFF-004-READ-IDLE-RESIDUAL-CSN"
    "TEST-REQ-AFF-004-READ-IDLE-RESIDUAL-START"
    "TEST-REQ-AFF-004-READ-IDLE-RESIDUAL-CONFIRMED"
    "TEST-REQ-AFF-004-READ-IDLE-RESIDUAL-SNAPSHOT"
    "TEST-REQ-AFF-004-READ-ACTIVE-CURRENT-GENERATION"
    "TEST-REQ-AFF-004-READ-ACTIVE-CURRENT-CSN"
    "TEST-REQ-AFF-004-READ-ACTIVE-SNAPSHOT-ZERO-GENERATION"
    "TEST-REQ-AFF-004-READ-ACTIVE-FOREIGN-BINDING"
    "TEST-REQ-AFF-004-READ-MISSING-EPOCH-FAULT"
    "TEST-REQ-AFF-004-READ-FAULTED-CONTEXT-STAYS-FAULTED"
    "TEST-REQ-AFF-004-READ-FINAL-CSN-CHANGED-FAULT"
    "TEST-REQ-CMP-007-READ-EXTERNAL-ERROR-THROW-CLEANUP"
    "TEST-REQ-CON-004-READ-TWO-WORKER-MIGRATION"))
(require :asdf)
(require :sb-posix)
(defvar *reader-products* nil)
(defvar *reader-suite* nil)
(defvar *reader-expected* nil)
(defvar *current-test* nil)
(defvar *passed-tests* nil)
(defun compile-local (file)
  (let ((output (merge-pathnames (make-pathname :type "fasl" :defaults file) #p"fasl/")))
    (ensure-directories-exist output)
    (multiple-value-bind (fasl warnings failed) (compile-file file :output-file output)
      (when (or warnings failed) (error "Compilazione non valida: ~A" file))
      (load fasl))))
(defun reader-child-main ()
  (let ((phase :compile-product) (failure nil) (code 0) (failure-kind nil))
    (handler-case
        (let ((*standard-output* *error-output*))
          (handler-bind ((warning (lambda (condition) (error condition))))
            (dolist (file *reader-products*) (compile-local file))
            (setf phase :compile-tests)
            (dolist (file *reader-suite*) (compile-local file)))
          (let* ((epochs (find-package "ARCDOCDB.EPOCHS.TESTS"))
                 (readers (find-package "ARCDOCDB.READ.TESTS"))
                 (tests (append (reverse (symbol-value (find-symbol "*EPOCHS-TESTS*" epochs)))
                                (reverse (symbol-value (find-symbol "*READ-TESTS*" readers)))))
                 (selected (second sb-ext:*posix-argv*)))
            (unless (equal *reader-expected* (mapcar (lambda (entry) (symbol-name (car entry))) tests))
              (error "Registri suite diversi dalla lista congelata."))
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
              failure-kind (if (some (lambda (package-name)
                                       (let* ((package (find-package package-name))
                                              (symbol (and package (find-symbol "FIXTURE-TIMEOUT" package))))
                                         (and symbol (find-class symbol nil) (typep condition symbol))))
                                     '("ARCDOCDB.EPOCHS.TESTS" "ARCDOCDB.READ.TESTS"))
                               :fixture-timeout :runtime))
        (format *error-output* "~&~A: ~A~%" (type-of condition) condition)))
    (let ((*print-readably* t))
      (write (list :schema-version 1 :kind :reader-mutation-child :phase phase
                   :status (if failure :failed :ok) :failed-test *current-test*
                   :passed-tests (reverse *passed-tests*) :failure-kind failure-kind
                   :diagnostic (when failure (princ-to-string failure))) :pretty t)
      (terpri) (finish-output))
    (sb-ext:exit :code code)))
(reader-child-main)
