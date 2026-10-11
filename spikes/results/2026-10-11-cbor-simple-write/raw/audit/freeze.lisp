(require :asdf)
(let ((files '("arcdocdb.asd" "src/codec/cbor-package.lisp" "src/codec/cbor-simple-write.lisp"
               "tests/codec/cbor-simple-write-support.lisp" "tests/codec/cbor-simple-write.lisp"
               "tests/codec/cbor-simple-write-threads.lisp" "tests/codec/cbor-string-write-support.lisp"
               "tests/codec/cbor-string-write-threads.lisp" "tools/foundation-coverage.lisp"
               "tools/cbor-simple-write-bench.lisp" "tools/cbor-simple-write-mutation.lisp"
               "tools/cbor-simple-write-audit.lisp" "docs/implementazione/cbor-semplici-metodo.md"
               "docs/implementazione/cbor-semplici-decisioni.md" "docs/implementazione/cbor-semplici-revisione.md"
               "docs/implementazione/cbor-semplici-lettura.md" "docs/implementazione/cbor-semplici.md"
               "docs/tracciabilita/requisiti.lisp" "docs/tracciabilita/matrice.md"))
      (root "spikes/out/cbor-simple-write-20261011/frozen/") (index nil))
  (dolist (file files)
    (let* ((target (concatenate 'string root file (if (equal "md" (pathname-type file)) ".txt" "")))
           (before (string-trim '(#\Newline) (uiop:run-program (list "git" "hash-object" file) :output :string))))
      (ensure-directories-exist target)
      (when (probe-file target) (error "Snapshot esistente ~A" target))
      (uiop:copy-file file target)
      (let ((after (string-trim '(#\Newline) (uiop:run-program (list "git" "hash-object" target) :output :string))))
        (unless (equal before after) (error "Snapshot diverso ~A" file))
        (push (list :source file :copy target :git-blob before) index))))
  (with-open-file (s (concatenate 'string root "snapshot-index.lisp") :direction :output :if-exists :error)
    (let ((*print-readably* t)) (write (list :schema-version 1 :kind :frozen-sources
      :commit (string-trim '(#\Newline) (uiop:run-program '("git" "rev-parse" "HEAD") :output :string))
      :files (nreverse index)) :stream s :pretty t) (terpri s)))
  (format t "Snapshot ~D file: blob copie verificati.~%" (length files)))
