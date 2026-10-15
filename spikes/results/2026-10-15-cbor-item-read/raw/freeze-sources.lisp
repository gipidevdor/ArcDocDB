;;;; Snapshot C4; copie verificate, nessun sorgente caricato come codice.
(require :asdf)
(load "tools/evidence-storage.lisp")
(declaim (optimize (safety 3) (debug 3)))
(let* ((root (truename "./"))
       (base (truename "spikes/out/cbor-item-read-20261015/"))
       (frozen (merge-pathnames "frozen/" base)) (index nil)
       (paths '("arcdocdb.asd" "src/codec/cbor-package.lisp"
                "src/codec/cbor-item-read.lisp" "src/codec/cbor-header.lisp"
                "src/codec/cbor-minimal.lisp" "src/codec/cbor-float-minimal.lisp"
                "src/codec/utf8.lisp" "src/codec/cbor-space.lisp"
                "src/codec/cbor-scan-input.lisp" "src/codec/cbor-scan-stack.lisp"
                "src/codec/cbor-scan-items.lisp" "src/codec/cbor-scan.lisp"
                "src/codec/cbor-scan-minimal.lisp"
                "tests/codec/cbor-item-read-support.lisp"
                "tests/codec/cbor-item-read.lisp" "tests/codec/cbor-item-read-threads.lisp"
                "tools/foundation-coverage.lisp"
                "docs/implementazione/cbor-item-metodo.md" "docs/implementazione/cbor-item.md"
                "docs/implementazione/cbor-item-revisione.md"
                "docs/implementazione/cbor-item-lettura.md"
                "docs/implementazione/cbor-item-decisioni.md"
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
                   :commit (string-trim (list (code-char 10) (code-char 13))
                             (uiop:run-program '("git" "rev-parse" "HEAD") :output :string))
                   :files (nreverse index)) :stream stream :pretty t)
      (terpri stream)))
  (format t "Snapshot: ~D sorgenti con tre confronti per copia.~%" (length paths)))

