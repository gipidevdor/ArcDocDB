;;;; C4 syntax diagnostic only, not semantic validation or a product test pass.
(require :asdf)
(asdf:load-asd (merge-pathnames "arcdocdb.asd" (truename "./")))
(asdf:load-system "arcdocdb")
(dolist (name '("ARCDOCDB.FOUNDATION.TESTS" "ARCDOCDB.ENGINE.TESTS" "ARCDOCDB.VERIFY.TESTS"))
  (unless (find-package name) (make-package name :use '("CL"))))
(dolist (name '("IS" "SIGNALS"))
  (export (intern name "ARCDOCDB.FOUNDATION.TESTS") "ARCDOCDB.FOUNDATION.TESTS"))
(let ((*read-eval* nil))
  ;; Only the trusted local DEFPACKAGE declaration is evaluated to establish reader aliases.
  (with-open-file (in "tests/backup/support.lisp") (eval (read in))))
(let ((*read-eval* nil) (*package* (find-package "ARCDOCDB.BACKUP.TESTS")) (failed nil))
  (handler-case (progn (read-from-string "(") (error "Malformed-reader fixture accepted."))
    (end-of-file () nil))
  (read-from-string "(list 1)")
  (dolist (name '("support" "manifest" "roundtrip" "guards" "directory" "faults" "streaming" "cli" "processes"))
    (let ((path (format nil "tests/backup/~A.lisp" name)))
      (handler-case
          (with-open-file (in path)
            (loop with eof = (gensym) repeat 10000 for form = (read in nil eof)
                  until (eq form eof) count form into forms
                  finally (format t "~A: ~D forms read.~%" path forms)))
        (error (condition) (setf failed t) (format *error-output* "~A: ~A~%" path condition)))))
  (when failed (sb-ext:exit :code 1)))
