;;;; Legge soltanto il sorgente preparato; non ne valuta alcuna forma.
(require :asdf)
(defpackage #:arcdocdb.evidence (:export #:file-bytes #:file-sha256 #:read-evidence))
(let ((*read-eval* nil) (*readtable* (copy-readtable nil))
      (eof (gensym "EOF")) (count 0))
  (with-open-file (stream (first (uiop:command-line-arguments)))
    (loop for form = (read stream nil eof) until (eq eof form) do (incf count)))
  (write (list :status :ok :forms count :eof t :read-eval nil :executed-prepared-reader nil))
  (terpri))
