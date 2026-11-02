;;;; C4: retain compiler output for the rejected scoped-allocation hypothesis.
(with-open-file (in (merge-pathnames "probe-raw-inline-failed.lisp.source" *load-truename*))
  (loop for form = (let ((*read-eval* nil)) (read in nil :eof)) do
    (when (eq form :eof) (error "Missing probe entry"))
    (when (and (consp form) (eq (first form) 'let*)) (return)) (eval form)))
(in-package #:scoped-envelope-probe)
(disassemble (scoped-function))
(format t "~&DIAGNOSTIC-COMPLETE~%")
