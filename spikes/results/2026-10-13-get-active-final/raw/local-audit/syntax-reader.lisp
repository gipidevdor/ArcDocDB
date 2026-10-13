(require :asdf)
(require :sb-posix)
(with-standard-io-syntax
  (let ((*read-eval* nil) (*package* (find-package :cl-user))
        (eof (gensym "EOF")) (count 0))
    (with-open-file (stream "spikes/out/active-final-local-audit/audit.lisp")
      (loop for form = (read stream nil eof) until (eq eof form) do (incf count)))
    (write (list :schema-version 1 :kind :own-final-auditor-source-syntax
                 :status :ok :forms count :read-eval-disabled t
                 :helper-not-evaluated t :no-product-or-evidence-read t) :pretty t)
    (terpri)))
