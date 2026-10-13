;;;; Snapshot C4: nessun sorgente viene caricato come codice.
(require :asdf)
(load "tools/evidence-storage.lisp")
(declaim (optimize (safety 3) (debug 3)))
(let* ((root (truename "./"))
       (base (truename "spikes/out/cbor-array-write-20261013/"))
       (frozen (merge-pathnames "frozen/" base)) (index nil)
       (paths '("arcdocdb.asd" "src/codec/cbor-package.lisp"
                "src/codec/cbor-array-input.lisp" "src/codec/cbor-array-write.lisp"
                "src/codec/cbor-string-write.lisp" "src/codec/cbor-write.lisp"
                "src/codec/cbor-space.lisp" "src/codec/cbor-scan-input.lisp"
                "src/codec/cbor-scan.lisp" "src/codec/cbor-scan-minimal.lisp"
                "tests/codec/cbor-array-write-support.lisp"
                "tests/codec/cbor-array-write.lisp" "tests/codec/cbor-array-write-threads.lisp"
                "tools/foundation-coverage.lisp"
                "docs/implementazione/cbor-array-metodo.md" "docs/implementazione/cbor-array.md"
                "docs/implementazione/cbor-array-revisione.md"
                "docs/implementazione/cbor-array-lettura.md"
                "docs/implementazione/cbor-array-decisioni.md"
                "docs/tracciabilita/requisiti.lisp" "docs/tracciabilita/matrice.md")))
  (dolist (path paths)
    (let* ((source (merge-pathnames path root))
           (target (merge-pathnames (concatenate 'string path
                      (if (equal (pathname-type path) "md") ".txt" "")) frozen))
           (before (list (arcdocdb.evidence:file-bytes source)
                         (arcdocdb.evidence:file-sha256 source))))
      (when (probe-file target) (error "Snapshot presente: ~A" target))
      (ensure-directories-exist target)
      (uiop:copy-file source target)
      (unless (and (equal before (list (arcdocdb.evidence:file-bytes target)
                                       (arcdocdb.evidence:file-sha256 target)))
                   (equal before (list (arcdocdb.evidence:file-bytes source)
                                       (arcdocdb.evidence:file-sha256 source))))
        (error "Snapshot alterato: ~A" source))
      (push (list :path path :snapshot (enough-namestring target base)
                  :bytes (first before) :sha256 (second before)) index)))
  (with-open-file (stream (merge-pathnames "snapshot-index.lisp" frozen)
                         :direction :output :if-exists :error)
    (let ((*print-readably* t))
      (write (list :schema-version 1 :kind :frozen-source-snapshot
                   :commit (string-trim '(#\Newline #\Return)
                             (uiop:run-program '("git" "rev-parse" "HEAD") :output :string))
                   :files (nreverse index)) :stream stream :pretty t)
      (terpri stream)))
  (format t "Snapshot: ~D sorgenti con tre confronti per copia.~%" (length paths)))
