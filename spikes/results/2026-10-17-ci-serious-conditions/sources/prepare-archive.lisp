;;;; Manifest esplicito C4: anche fallimenti e fixture intermedie, senza append.
(require :asdf)
(load "tools/evidence-storage.lisp")
(let ((records '("spikes/out/4001222449-command-88849-0/report.lisp"
                 "spikes/out/4001222488-command-89920-0/report.lisp"
                 "spikes/out/4001222554-command-90399-0/report.lisp"
                 "spikes/out/4001222605-command-91046-0/report.lisp"
                 "spikes/out/4001222639-command-91210-0/report.lisp"
                 "spikes/out/4001222700-command-91827-0/report.lisp"))
      (archive "spikes/out/ci-serious-raw-20261017.tar.gz")
      (manifest "spikes/out/ci-serious-20261017/collection-manifest.lisp")
      (files nil) (processes nil))
  (assert (not (probe-file archive)))
  (assert (not (probe-file manifest)))
  (loop for record in records for index from 0 do
    (let* ((data (arcdocdb.evidence:read-evidence record))
           (prefix (format nil "processes/run-~D/" index)))
      (assert (eq :command-verification (getf data :kind)))
      (assert (member (getf data :status) '(:ok :failed)))
      (assert (eq :stable (getf data :source-consistency)))
      (format t "~A ~S/exit~D/~S~%" record (getf data :status)
              (getf data :exit-code) (getf data :source-consistency))
      (dolist (path (uiop:directory-files (uiop:pathname-directory-pathname (truename record))))
        (push (list :source (namestring path)
                    :path (concatenate 'string prefix (file-namestring path))) files))
      (push (list :label (format nil "run-~D" index)
                  :record-path (concatenate 'string prefix "report.lisp")) processes)))
  (uiop:run-program (list "tar" "-czf" archive "-C" "spikes/out/" "ci-serious-20261017/")
                    :output t :error-output t)
  (push (list :source (namestring (truename archive)) :path "raw.tar.gz") files)
  (dolist (source '("tests/ci-catalog.lisp" "tools/ci.lisp" "tools/ci/self-test.lisp"
                    "tools/ci/conditions-self-test.lisp"))
    (push (list :source (namestring (truename source))
                :path (concatenate 'string "sources/" source)) files))
  (dolist (name '("run-conditions.lisp" "prepare-archive.lisp"))
    (push (list :source (namestring (truename (concatenate 'string "spikes/out/ci-serious-20261017/" name)))
                :path (concatenate 'string "sources/" name)) files))
  (with-open-file (stream manifest :direction :output :if-exists :error)
    (let ((*print-readably* t))
      (write (list :schema-version 1 :kind :command-archive-manifest :date "2026-10-17"
                   :files (nreverse files) :processes (nreverse processes))
             :stream stream :pretty t)
      (terpri stream))))
