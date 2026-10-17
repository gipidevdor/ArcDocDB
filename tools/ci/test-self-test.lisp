;;;; Definizioni di fixture C4: nessun autorun, load prodotto, compilazione o processo.
;;; REQ: REQ-VAL-001 REQ-AFF-012
(in-package #:arcdocdb.ci)
(declaim (optimize (safety 3) (debug 3)))

(defun ci-test-self-test (out)
  "API esplicita: fixture registro/provenienza/wire/assenza/LCOV e conteggi plist.
Invocazione riservata al coordinator dopo chiusura writer. Scrive test-self-test.lisp."
  (let* ((name (symbol-name (gensym "ARCDOCDB.CI.CATALOG.FIXTURE.")))
         (package (make-package name :use nil))
         (one (intern "ONE" package)) (two (intern "TWO" package))
         (cases nil) (negative 0))
    (setf (symbol-function one) (lambda () t) (symbol-function two) (lambda () t))
    (labels ((check (id function &optional negative-p)
               (when negative-p (incf negative))
               (handler-case
                   (push (list :id id :status (if (funcall function) :passed :failed)) cases)
                 (error (condition)
                   (push (list :id id :status :failed :condition (princ-to-string condition)) cases))))
             (rejects (function)
               (handler-case (progn (funcall function) nil) (error () t)))
             (lcov (body)
               (ci-coverage-parse-lcov (format nil "SF:src/fixture.lisp~%~Aend_of_record~%" body))))
      (unwind-protect
           (progn
             (check :catalog-47-suites
                    (lambda () (= 47 (length (arcdocdb.ci.tests:suite-specifications)))))
             (check :catalog-suite-ids-unique
                    (lambda () (let ((ids (mapcar (lambda (r) (getf r :id))
                                                   (arcdocdb.ci.tests:suite-specifications))))
                                 (= (length ids) (length (remove-duplicates ids :test #'equal))))))
             (check :catalog-four-fulltext-suites
                    (lambda () (= 4 (count-if (lambda (r) (search "ARCDOCDB.FULLTEXT." (getf r :id)))
                                               (arcdocdb.ci.tests:suite-specifications)))))
             (check :catalog-two-named-smoke-cases
                    (lambda () (= 2 (length (getf (first (arcdocdb.ci.tests:suite-specifications)) :cases)))))
             (check :catalog-four-explicit-vertical-cases
                    (lambda () (= 4 (length arcdocdb.ci.tests::*vertical-cases*))))
             (check :catalog-four-explicit-allocation-exclusions
                    (lambda () (= 4 (length arcdocdb.ci.tests::*coverage-exclusions*))))
             (check :symbol-list-registry
                    (lambda () (let ((rows (arcdocdb.ci.tests::normalize-registry name :symbol-list (list two one))))
                                 (and (= 2 (length rows)) (equal "ONE" (getf (first rows) :name))
                                      (equal (arcdocdb.ci.tests::qualified-id name "TWO")
                                             (getf (second rows) :id))))))
             (check :alist-registry
                    (lambda () (= 2 (length (arcdocdb.ci.tests::normalize-registry
                                             name :alist (list (cons two (symbol-function two))
                                                               (cons one (symbol-function one))))))))
             (check :empty-registry-is-known-zero
                    (lambda () (null (arcdocdb.ci.tests::normalize-registry name :symbol-list nil))))
             (check :reject-list-instead-of-symbol
                    (lambda () (rejects (lambda () (arcdocdb.ci.tests::normalize-registry
                                                    name :symbol-list (list (list one)))))) t)
             (check :reject-alist-list-cdr
                    (lambda () (rejects (lambda () (arcdocdb.ci.tests::normalize-registry
                                                    name :alist (list (list one (symbol-function one))))))) t)
             (check :reject-duplicate-registry-id
                    (lambda () (rejects (lambda () (arcdocdb.ci.tests::normalize-registry
                                                    name :symbol-list (list one one))))) t)
             (check :reject-improper-registry
                    (lambda () (rejects (lambda () (arcdocdb.ci.tests::normalize-registry
                                                    name :symbol-list (cons one two))))) t)
             (check :reject-cyclic-registry
                    (lambda () (let ((cycle (list one)))
                                 (setf (cdr cycle) cycle)
                                 (rejects (lambda () (arcdocdb.ci.tests::normalize-registry
                                                      name :symbol-list cycle))))) t)
             (let ((arcdocdb.ci.tests::*definitions* (make-hash-table :test #'equal)))
               (arcdocdb.ci.tests::register-definition name "ONE" "tests/fixture-a.lisp")
               (check :duplicate-before-pushnew-is-rejected
                      (lambda () (rejects (lambda () (arcdocdb.ci.tests::register-definition
                                                      name "ONE" "tests/fixture-b.lisp")))) t)
               (arcdocdb.ci.tests::begin-source "tests/fixture-a.lisp")
               (arcdocdb.ci.tests::register-definition name "ONE" "tests/fixture-a.lisp")
               (check :reloaded-source-preserves-provenance
                      (lambda () (equal "tests/fixture-a.lisp"
                                        (getf (gethash (arcdocdb.ci.tests::qualified-id name "ONE")
                                                      arcdocdb.ci.tests::*definitions*) :source)))))
             (check :case-observer-once-even-for-nested-call
                    (lambda ()
                      (let ((n 0))
                        (let ((arcdocdb.ci.tests::*case-observer*
                                (lambda (id thunk) (declare (ignore id)) (incf n) (funcall thunk))))
                          (arcdocdb.ci.tests::call-registered-case
                           "fixture/outer" (lambda () (arcdocdb.ci.tests::call-registered-case
                                                       "fixture/inner" (lambda () t)))))
                        (= n 1))))
             (check :plain-writer-only-wire-primitives
                    (lambda ()
                      (let* ((data '(:status :passed :count 0 :unknown nil :flag t :text "fixtùra"))
                             (text (with-output-to-string (s) (arcdocdb.ci.tests::write-data s data))))
                        (and (not (find #\# text))
                             (equal (ci-wire-string data)
                                    (ci-wire-string
                                     (with-standard-io-syntax
                                       (let ((*read-eval* nil)) (read-from-string text)))))))))
             (check :plain-writer-rejects-float
                    (lambda () (rejects (lambda () (with-output-to-string (s)
                                                     (arcdocdb.ci.tests::write-data s (list :value 1.5)))))) t)
             (let* ((zero (append (list :path "src/zero.lisp" :status :measured)
                                  (loop for key in *ci-coverage-counter-keys* append (list key 0))))
                    (unknown (append (list :path "src/unknown.lisp" :status :missing)
                                     (loop for key in *ci-coverage-counter-keys* append (list key nil))))
                    (known (ci-coverage-totals (list zero)))
                    (partial (ci-coverage-totals (list zero unknown))))
               (check :known-zero-denominator-remains-zero
                      (lambda () (and (eq :measured (getf known :status))
                                      (eql 0 (getf known :expressions-total))
                                      (eql 0 (getf known :lines-total)))))
               (check :unknown-denominator-never-zero
                      (lambda () (and (eq :partial (getf partial :status))
                                      (null (getf partial :expressions-total))
                                      (null (getf partial :lines-total))
                                      (= 1 (getf partial :known-files))
                                      (= 2 (getf partial :expected-files)))))
               (check :partial-subtotal-is-labelled
                      (lambda () (eql 0 (getf (getf partial :known-subtotal) :expressions-total))))
               (check :all-unknown-subtotal-absent
                      (lambda () (null (getf (ci-coverage-totals (list unknown)) :known-subtotal)))))
             (let ((row (first (lcov (format nil "DA:1,1~%DA:2,0~%BA:1,1~%BA:1,2~%")))))
               (check :lcov-da-exact-counts
                      (lambda () (and (= 1 (getf row :lines-covered)) (= 2 (getf row :lines-total)))))
               (check :lcov-ba-exact-counts
                      (lambda () (and (= 1 (getf row :lcov-branches-covered))
                                      (= 2 (getf row :lcov-branches-total))))))
             (check :lcov-zero-lines-is-not-full-coverage
                    (lambda () (eql 0 (getf (first (lcov "")) :lines-total))))
             (dolist (fixture (list (format nil "DA:1,1~%DA:1,0~%")
                                   (format nil "DA:1,1~%BA:1,0~%")
                                   (format nil "DA:1,1~%BRDA:1,0,0,1~%")
                                   (format nil "DA:0,1~%")
                                   (format nil "DA:1,2~%")
                                   (format nil "BA:1,2~%")))
               (let ((data fixture))
                 (check (concatenate 'string "reject-lcov:" data)
                        (lambda () (rejects (lambda () (lcov data)))) t)))
             (check :reject-truncated-lcov
                    (lambda () (rejects (lambda () (ci-coverage-parse-lcov
                                                    (format nil "SF:src/a.lisp~%DA:1,1~%"))))) t)
             (check :reject-duplicate-lcov-file
                    (lambda () (rejects (lambda () (ci-coverage-parse-lcov
                                                    (format nil "SF:src/a.lisp~%end_of_record~%SF:src/a.lisp~%end_of_record~%"))))) t))
        (delete-package package)))
    (setf cases (nreverse cases))
    (let* ((failed (count :failed cases :key (lambda (r) (getf r :status))))
           (counts (list :planned (length cases) :started (length cases)
                         :passed (- (length cases) failed) :failed failed :not-run 0
                         :negative-cases negative))
           (report (list :schema-version 1 :kind :ci-test-self-test
                         :status (if (zerop failed) :passed :failed)
                         :counts counts :fixture-data-only t :cases cases)))
      (ci-save (merge-pathnames "test-self-test.lisp" (ci-directory out)) report)
      report)))
