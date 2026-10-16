(require :asdf)
(let ((*features* (cons :arcdocdb-evidence-check-library *features*)))
  (load "tools/check-evidence.lisp"))
(multiple-value-bind (stdout stderr exit)
    (uiop:run-program '("make" "trace" "links") :output :string :error-output :string :ignore-error-status t)
  (write-string stdout) (write-string stderr *error-output*)
  (unless (eql 0 exit) (error "Tracciabilità/link: exit ~S." exit)))
(let ((root (truename "spikes/results/2026-10-16-evidenze-parallele/")))
  (multiple-value-bind (files bytes) (arcdocdb.evidence.check::verifica-dimensioni root)
    (let ((references (arcdocdb.evidence.check::verifica-catalogo (merge-pathnames "catalogo.lisp" root))))
      (write (list :schema-version 1 :kind :published-evidence-delta-check :status :ok
                   :root (namestring root) :stored-files files :stored-bytes bytes
                   :catalogs 1 :artifact-references references
                   :script-sha256 (arcdocdb.evidence:file-sha256 *load-truename*)
                   :limits '(:new-archive-only :unchanged-catalogs-checked-in-prior-global-run)))
      (terpri))))
