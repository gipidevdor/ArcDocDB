(require :asdf)
(load "tools/evidence-storage.lisp")
(let ((files '("arcdocdb.asd" "tests/vertical/support.lisp" "tests/vertical/scenarios.lisp"
               "tests/vertical/resume.lisp" "tests/vertical/processes.lisp" "tests/vertical/method.md"
               "tools/vertical-crash.lisp"))
      (attempts '(("01" "4001082013-command-5684-0" :failed)
                  ("02" "4001082074-command-5881-0" :failed)
                  ("03" "4001082179-command-6143-0" :ok)))
      (count 0) (support-hashes nil))
  (dolist (attempt attempts)
    (destructuring-bind (number directory status) attempt
      (let ((record (arcdocdb.evidence:read-evidence
                     (format nil "spikes/out/~A/report.lisp" directory))))
        (assert (eq :stable (getf record :source-consistency)))
        (assert (eq status (getf record :status)))
        (dolist (file files)
          (let* ((entry (find file (getf record :source-blobs-after)
                              :test #'string= :key (lambda (item) (getf item :path))))
                 (copy (format nil "spikes/out/vertical-resume-development-~A-sources/~A.txt" number file))
                 (actual (string-trim '(#\Newline #\Return)
                           (uiop:run-program (list "git" "hash-object" copy) :output :string))))
            (assert entry)
            (assert (string= actual (getf entry :git-blob)))
            (when (string= file "tests/vertical/support.lisp") (push actual support-hashes))
            (incf count))))))
  ;; Controllo negativo: le tre varianti del supporto non sono intercambiabili.
  (assert (= 3 (length (remove-duplicates support-hashes :test #'string=))))
  (format t "~D sorgenti identici ai blob dei tre record; tre varianti distinte rilevate.~%" count))
