(require :asdf)
(load "tools/evidence-storage.lisp")
(let* ((wrapper "spikes/out/4001073778-command-87117-0/report.lisp")
       (record (arcdocdb.evidence:read-evidence wrapper))
       (paths '("spikes/out/cbor-item-read-20261015/review/integrated-runtime-reading-v2.lisp"
                "spikes/out/cbor-item-read-20261015/review/integrated-runtime-reading-v2.output.txt"
                "spikes/out/cbor-item-read-20261015/review/integrated-runtime-reading-v2.error.txt"
                "spikes/out/cbor-item-read-20261015/review/integrated-runtime-reading.lisp"
                "spikes/out/cbor-item-read-20261015/review/integrated-runtime-reading.output.txt"
                "spikes/out/cbor-item-read-20261015/review/integrated-runtime-reading.error.txt"))
       (observations
         (loop for path in paths collect
               (list :path path :bytes (arcdocdb.evidence:file-bytes path)
                     :sha256 (arcdocdb.evidence:file-sha256 path)
                     :git-blob (string-trim '(#\Newline #\Return)
                                           (uiop:run-program (list "git" "hash-object" path) :output :string)))))
       (references
         (with-input-from-string (in (getf record :stdout))
           (loop for line = (read-line in nil) while line
                 when (some (lambda (marker) (search marker line))
                            '("Snapshot: fixture processi conservate in " "Reader: fixture processi conservate in "
                              "10 spike completati; risultati: ")) collect line))))
  (write (list :schema-version 1 :kind :cbor-item-integrated-runtime-inventory :status :ok
               :observations observations :direct-references references :product-loaded nil) :pretty t)
  (terpri))
