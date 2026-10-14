(require :asdf)
(require :sb-posix)
(require :sb-md5)
;;; Only namespaces needed by the Lisp reader. No product or test source is loaded.
(defpackage #:arcdocdb.cbor (:use #:cl)
  (:export #:crea-spazio-cbor #:scrivi-tag-cbor-minimo))
(defpackage #:arcdocdb.evidence (:use #:cl)
  (:export #:file-bytes #:file-sha256 #:read-evidence))
(let ((*read-eval* nil) (*readtable* (copy-readtable nil)) (*read-base* 10)
      (*read-suppress* nil) (eof (gensym "EOF")) (entries nil))
  (dolist (name '("fixtures-and-mutations.lisp" "bench.lisp" "audit.lisp"
                  "mutation.lisp" "catalogue-materialized.lisp" "nominal-whitelist.lisp"))
    (let ((path (concatenate 'string "spikes/out/cbor-tag-write-20261014/drivers/" name))
          (count 0))
      (with-open-file (input path :external-format :utf-8)
        (loop for form = (read input nil eof) until (eq form eof) do (incf count)))
      (push (list :name name :forms count
                  :git-blob (string-trim '(#\Newline #\Return)
                      (uiop:run-program (list "git" "hash-object" path) :output :string))) entries)))
  (let ((*print-readably* t))
    (write (list :schema-version 1 :kind :cbor-tag-driver-read-only-freeze
                 :status :ok :read-eval nil :standard-readtable t :eof-distinct t
                 :forms-executed 0 :product-and-corpus-loaded nil
                 :self-tests-executed nil :entries (nreverse entries)) :pretty t)
    (terpri)))
