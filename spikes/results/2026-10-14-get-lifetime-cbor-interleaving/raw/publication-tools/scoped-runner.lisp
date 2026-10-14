;;;; Registered GET-directory suite only; definitions of all tests are compiled, no TEST-OP.
;;;; Private ASDF cache is the explicit env argument in the outer native command record.
(require :asdf)
(defparameter *scoped-runner-source* *load-truename*)
(defun scoped-runner-sha ()
  (subseq (uiop:run-program (list "shasum" "-a" "256" "--" (namestring *scoped-runner-source*))
                           :output :string :error-output :string) 0 64))
(setf asdf:*compile-file-failure-behaviour* :error
      asdf:*compile-file-warnings-behaviour* :error)
(defun scoped-treat-as-error (condition)
  "Same COD-01 rule as tools/build.lisp, including its ASDF redefinition exception."
  (unless (typep condition 'sb-kernel:redefinition-warning)
    (error "~A non ammesso (COD-01): ~A" (type-of condition) condition)))
(let ((source-before (scoped-runner-sha)))
  (format t "GET-DIRECTORY-SCOPED-RUNNER START ~A~%" source-before)
  (handler-bind ((warning #'scoped-treat-as-error) (style-warning #'scoped-treat-as-error))
    (asdf:load-asd (merge-pathnames "arcdocdb.asd" (truename "./")))
    (asdf:load-system "arcdocdb" :force t)
    (asdf:load-system "arcdocdb/tests" :force t)
    (uiop:symbol-call :arcdocdb.get.directory.tests :run))
  (unless (equal source-before (scoped-runner-sha)) (error "Scoped runner source changed."))
  (format t "GET-DIRECTORY-SCOPED-RUNNER DONE ~A~%" source-before))
