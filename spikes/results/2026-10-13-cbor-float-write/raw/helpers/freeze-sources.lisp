(require :asdf)
(let* ((root (truename "spikes/out/cbor-float-write-20261013/"))
       (frozen (merge-pathnames "frozen/" root)) (index nil))
  (dolist (path '("arcdocdb.asd" "src/codec/cbor-package.lisp"
                  "src/codec/cbor-float-narrow.lisp" "src/codec/cbor-float-write.lisp"
                  "src/codec/cbor-float-minimal.lisp" "src/codec/cbor-write.lisp"
                  "tests/codec/cbor-float-write-support.lisp" "tests/codec/cbor-float-write.lisp"
                  "tests/codec/cbor-float-write-threads.lisp"
                  "tools/foundation-coverage.lisp" "tools/cbor-float-write-bench.lisp"
                  "tools/cbor-float-write-mutation.lisp" "tools/cbor-float-write-audit.lisp"
                  "docs/implementazione/cbor-float-scrittura-metodo.md"
                  "docs/implementazione/cbor-float-scrittura.md"
                  "docs/implementazione/cbor-float-scrittura-revisione.md"
                  "docs/implementazione/cbor-float-scrittura-lettura.md"
                  "docs/implementazione/cbor-float-scrittura-decisioni.md"
                  "docs/tracciabilita/requisiti.lisp" "docs/tracciabilita/matrice.md"))
    (let* ((target (merge-pathnames (concatenate 'string path
                         (if (equal (pathname-type path) "md") ".txt" "")) frozen))
           (before (string-trim '(#\Newline #\Return)
                               (uiop:run-program (list "git" "hash-object" path) :output :string))))
      (when (probe-file target) (error "Snapshot presente ~A" target))
      (ensure-directories-exist target)
      (uiop:copy-file path target)
      (unless (string= before (string-trim '(#\Newline #\Return)
                     (uiop:run-program (list "git" "hash-object" (namestring target)) :output :string)))
        (error "Snapshot diverso ~A" path))
      (push (list :path path :snapshot (enough-namestring target root) :git-blob before) index)))
  (with-open-file (stream (merge-pathnames "snapshot-index.lisp" frozen)
                         :direction :output :if-exists :error)
    (let ((*print-readably* t))
      (write (list :schema-version 1 :kind :frozen-source-snapshot
                   :commit "364ac3b8c6dc3877e978ce551dc6e2fbab8ea1f0"
                   :files (nreverse index)) :stream stream :pretty t)
      (terpri stream)))
  (format t "Snapshot congelato: venti file, copie Git blob identiche.~%"))
