;;;; C4: retain the exact already-qualified uninlined source variant before compiler-only refinement.
(with-open-file (in (merge-pathnames "archive.lisp" *load-truename*))
  (loop for form = (let ((*read-eval* nil)) (read in nil :eof)) do
    (when (eq form :eof) (error "Missing archive entry"))
    (when (and (consp form) (eq (first form) 'let)) (return)) (eval form)))
(in-package #:scoped-envelope-archive)
(ensure (not (probe-file (merge-pathnames "variant-uninlined.lisp" *here*))))
(let ((copies nil))
  (dolist (name '("arcdocdb.asd" "docs/implementazione/production-unix-m1.md" "docs/lisp-api.md"
                  "src/local/client.lisp" "src/local/wire.lisp" "tests/local/client-receive.lisp"
                  "tests/local/client-scoped-envelope.lisp" "tests/local/wire-scoped-envelope.lisp"))
    (push (copy-one (truename name) (merge-pathnames (format nil "variants/uninlined/~A.source" name) *here*)) copies))
  (with-open-file (out (merge-pathnames "variant-uninlined.lisp" *here*) :direction :output :if-exists :error)
    (write (list :kind :scoped-envelope-variant :status :passed :variant :uninlined
                 :base "d6c69eec7d531adcd2e2bd7211386c0d4f00dcd8" :copies (reverse copies)) :stream out :pretty t)
    (terpri out))
  (format t "~S~%" (list :kind :scoped-envelope-variant :status :passed :variant :uninlined :copies (length copies))))
