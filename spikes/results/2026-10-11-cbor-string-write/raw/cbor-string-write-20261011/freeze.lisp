(require :asdf)
(load "tools/evidence-storage.lisp")
(let* ((root (truename "./"))
       (out (merge-pathnames "spikes/out/cbor-string-write-20261011/frozen/" root))
       (paths (append '("arcdocdb.asd" "src/codec/cbor-package.lisp"
                        "src/codec/cbor-string-write.lisp" "src/codec/cbor-write.lisp"
                        "src/codec/utf8.lisp" "src/codec/cbor-scan-input.lisp"
                        "tools/cbor-string-write-bench.lisp"
                        "tools/cbor-string-write-mutation.lisp"
                        "tools/cbor-string-write-audit.lisp" "tools/foundation-coverage.lisp"
                        "tests/codec/cbor-string-write-support.lisp"
                        "tests/codec/cbor-string-write.lisp"
                        "tests/codec/cbor-string-write-threads.lisp"
                        "docs/tracciabilita/requisiti.lisp" "docs/tracciabilita/matrice.md")
                      (mapcar #'enough-namestring (directory "docs/implementazione/cbor-stringhe*.md"))))
       (manifest nil))
  (dolist (path paths)
    (let* ((source (merge-pathnames path root))
           (target (merge-pathnames (if (string= "md" (pathname-type source))
                                       (concatenate 'string path ".txt") path) out))
           (hash (arcdocdb.evidence:file-sha256 source))
           (blob (string-trim '(#\Newline) (uiop:run-program (list "git" "hash-object" path) :output :string))))
      (when (probe-file target) (error "Snapshot gia presente: ~A" target))
      (ensure-directories-exist target) (uiop:copy-file source target)
      (unless (equal hash (arcdocdb.evidence:file-sha256 target)) (error "Copia diversa: ~A" path))
      (push (list :path path :git-blob blob :sha256 hash :copy (enough-namestring target out)) manifest)))
  (with-open-file (stream "spikes/out/cbor-string-write-20261011/freeze-manifest.lisp"
                          :direction :output :if-exists :error)
    (let ((*print-readably* t))
      (write (list :schema-version 1 :kind :prereg-campaign-source-freeze
                   :before-first-product-compilation t :files (nreverse manifest))
             :stream stream :pretty t) (terpri stream)))
  (format t "~D sorgenti e documenti congelati e verificati.~%" (length paths)))
