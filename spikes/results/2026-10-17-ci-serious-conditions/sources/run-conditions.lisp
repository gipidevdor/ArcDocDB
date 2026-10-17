;;;; Driver C4 mirato: soli strumenti CI, nessun caricamento del prodotto.
(require :asdf)
(require :sb-posix)
(defpackage #:arcdocdb.ci (:use #:cl))
(in-package #:arcdocdb.ci)
(defparameter *ci-root* (truename "./"))
(defparameter *ci-entry* (merge-pathnames "tools/ci.lisp" *ci-root*))
(defparameter *ci-sbcl* (namestring sb-ext:*runtime-pathname*))
(handler-bind ((warning (lambda (condition) (error condition))))
  (with-compilation-unit ()
    (load "tools/evidence-storage.lisp")
    (load "tests/ci-catalog.lisp")
    (dolist (module '("data" "identity" "support" "tests" "coverage" "measure"
                      "archive" "producer" "github" "publish" "self-test"
                      "data-self-test" "test-self-test" "measure-self-test"
                      "workflow-self-test" "conditions-self-test"))
      (load (format nil "tools/ci/~A.lisp" module)))))
(let ((report (ci-conditions-self-test (first (uiop:command-line-arguments)))))
  (write-line (ci-wire-string report))
  (unless (eq :passed (getf report :status)) (sb-ext:exit :code 1)))
