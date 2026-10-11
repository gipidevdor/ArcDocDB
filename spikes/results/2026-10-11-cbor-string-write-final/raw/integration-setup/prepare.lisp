;;;; Copie e manifest finale: nessuna esecuzione o reinterpretazione del prodotto.
(require :asdf)
(load "tools/evidence-storage.lisp")
(let* ((root (truename "./"))
       (setup (merge-pathnames "spikes/out/cbor-string-write-final-20261011/" root))
       (processes
         '(("originalCollection" "spikes/out/4000709687-command-20928-0/report.lisp")
           ("originalClosedAudit" "spikes/out/4000710389-command-36958-0/report.lisp")
           ("integratedCheck" "spikes/out/4000710709-command-45721-0/report.lisp")
           ("integratedCoverageSelf" "spikes/out/4000710709-command-45705-0/report.lisp")))
       (frozen nil))
  (labels ((save-new (path data)
             (with-open-file (stream path :direction :output :if-exists :error
                                          :external-format :utf-8)
               (let ((*print-readably* t)) (write data :stream stream :pretty t) (terpri stream)))))
    (dolist (entry processes)
      (let ((record (arcdocdb.evidence:read-evidence (merge-pathnames (second entry) root))))
        (unless (and (eq :command-verification (getf record :kind))
                     (eq :ok (getf record :status)) (eql 0 (getf record :exit-code))
                     (eq :stable (getf record :source-consistency)))
          (error "Record finale non riuscito o instabile: ~S." entry))))
    (dolist (name '("arcdocdb.asd" "tools/foundation-coverage.lisp"
                    "docs/implementazione/cbor-stringhe-risultati.md"
                    "docs/implementazione/cbor-stringhe-dati.md"))
      (let* ((source (merge-pathnames name root))
             (target (merge-pathnames (format nil "frozen/~A.txt" name) setup))
             (sha (arcdocdb.evidence:file-sha256 source)))
        (when (probe-file target) (error "Copia gia esistente: ~A." target))
        (ensure-directories-exist target)
        (uiop:copy-file source target)
        (unless (and (equal sha (arcdocdb.evidence:file-sha256 source))
                     (equal sha (arcdocdb.evidence:file-sha256 target)))
          (error "Copia finale diversa: ~A." source))
        (push (list :source name :copy (enough-namestring target setup) :sha256 sha
                    :git-blob (string-trim '(#\Newline #\Return)
                              (uiop:run-program (list "git" "hash-object" "--" name)
                                                :output :string))) frozen)))
    (save-new (merge-pathnames "frozen-manifest.lisp" setup)
              (list :schema-version 1 :kind :integration-file-copies
                    :integration-commit "ceac2dedfcfd6af05f2331282645bebf4b5be442"
                    :limits '(:byte-copies :docs-updated-after-integrated-check
                              :no-result-or-qualification-inference)
                    :files (nreverse frozen)))
    (let ((manifest
            (list :schema-version 1
                  :processes (mapcar (lambda (entry)
                                       (list (first entry) (namestring (merge-pathnames (second entry) root))))
                                     processes)
                  :trees (list (list "integration-setup" (namestring setup) :all)
                               (list "integrated-spikes"
                                     (namestring (merge-pathnames "spikes/out/4000710848-check-49601-0/" root)) :all)
                               (list "integrated-coverage-self"
                                     (namestring (merge-pathnames "spikes/out/cbor-string-write-integrated-coverage-self-20261011/" root)) :all))
                  :files nil)))
      (save-new (merge-pathnames "collection-manifest.lisp" setup) manifest)
      (format t "Manifest finale: ~D processi, ~D alberi, ~D copie congelate.~%"
              (length processes) (length (getf manifest :trees)) (length (getf (with-open-file
                  (stream (merge-pathnames "frozen-manifest.lisp" setup))
                (let ((*read-eval* nil)) (read stream))) :files))))))
