;;;; Probe mirata dei soli due casi permanenti CHIUDI-WORKERS.
;;;; Nessuna esecuzione del vecchio self-test o di processi worker.
(in-package #:cl-user)
(require :asdf)
(require :sb-posix)
(defparameter *cleanup-probe-directory* (uiop:pathname-directory-pathname *load-truename*))
(defparameter *cleanup-probe-checker* (merge-pathnames "../../../tools/check-evidence.lisp" *cleanup-probe-directory*))
(let ((*features* (cons :arcdocdb-evidence-check-library *features*)))
  (load *cleanup-probe-checker* :verbose nil :print nil))
(load (merge-pathnames "check-evidence-parallel-tests.lisp" (uiop:pathname-directory-pathname *cleanup-probe-checker*))
      :verbose nil :print nil)

(let* ((parent (uiop:pathname-parent-directory-pathname *cleanup-probe-directory*))
       (root (uiop:ensure-directory-pathname
               (sb-posix:mkdtemp (namestring (merge-pathnames "evidence-cleanup-probe-XXXXXX" parent)))))
       (arcdocdb.evidence.check::*ept-checks* 0)
       (cases (loop for order in '(:error-first :timeout-first)
                    for directory = (uiop:symbol-call :arcdocdb.evidence.check :ept-directory
                                      (merge-pathnames (format nil "~(~A~)/" order) root))
                    collect (handler-case
                                (list :order order :status :ok
                                      :result (uiop:symbol-call :arcdocdb.evidence.check :ept-cleanup-workers directory order))
                              (serious-condition (condition)
                                (list :order order :status :failed :condition (type-of condition)
                                      :diagnostic (princ-to-string condition))))))
       (ok (every (lambda (row) (eq :ok (getf row :status))) cases))
       (report (list :schema-version 1 :kind :evidence-cleanup-probe :status (if ok :ok :failed)
                     :root (namestring root) :checks arcdocdb.evidence.check::*ept-checks* :cases cases
                     :limits '(:permanent-test-function-only :old-forty-six-not-rerun
                               :no-worker-processes-started :no-source-index-or-head-edits))))
  (uiop:symbol-call :arcdocdb.evidence.check :ept-write-data (merge-pathnames "report.lisp" root) report)
  (write report :pretty t) (terpri) (finish-output)
  (unless ok (error "Cleanup probe fallita; fixture conservate in ~A" root)))
