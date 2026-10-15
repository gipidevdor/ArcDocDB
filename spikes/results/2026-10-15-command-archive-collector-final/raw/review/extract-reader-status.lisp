;;;; Estrae soltanto metadata del lettore originale gia concluso.
(require :asdf)
(load "tools/evidence-storage.lisp")
(with-open-file (stream "spikes/out/command-archive-collector-20261015/review/runtime-reading-v1.status.lisp"
                        :direction :output :if-exists :error)
  (let ((record (arcdocdb.evidence:read-evidence "spikes/out/4001078592-command-72804-0/report.lisp")))
    (write (list :record "spikes/out/4001078592-command-72804-0/report.lisp"
                 :status (getf record :status) :exit-code (getf record :exit-code)
                 :source-consistency (getf record :source-consistency)
                 :wall-seconds (getf record :wall-seconds)
                 :source-count (length (getf record :source-blobs-before))
                 :stderr-bytes (length (getf record :stderr))
                 :reader-bug :nominal-name-prefix) :stream stream :pretty t)
    (terpri stream)))
