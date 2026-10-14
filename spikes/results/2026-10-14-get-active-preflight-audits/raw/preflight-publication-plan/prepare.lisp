;;;; Costruzione dei soli manifesti: nessuna esecuzione del prodotto.
(require :asdf)
(load "tools/evidence-storage.lisp")
(defparameter *freeze* "8c0866711c50d047f87b9c484ce56d42a87ba19c")
(defparameter *plan* #P"spikes/out/preflight-publication-plan/")
(defparameter *mutation-groups*
  '("preflight-mutations-R1" "preflight-mutation-selftest-R1"
    "4000985330-command-52519-0" "4000985299-command-51849-0"
    "4000985407-command-53868-0" "4000985407-command-53869-0"))
(defparameter *bootstrap-groups*
  '("preflight-bootstrap-mutations-R1" "preflight-bootstrap-selftest-R1"
    "4000985463-command-55161-0" "4000985429-command-54291-0"))
(defparameter *other-groups*
  '("preflight-active-coverage-R1" "preflight-closed-coverage-R1"
    "preflight-console" "preflight-core-fasl-R1" "preflight-local-audit"
    "preflight-coverage-audit" "preflight-mutation-audit" "preflight-ci-audit"
    "preflight-parallel-publication" "preflight-preservation-plan"))
(defparameter *failed-commands*
  '(("4000985407-command-53868-0" . 2) ("4000985407-command-53869-0" . 2)
    ("4000986168-command-74695-0" . 1)))
(defun save-plan (path data)
  (with-open-file (stream (merge-pathnames path *plan*) :direction :output :if-exists :error)
    (with-standard-io-syntax (write data :stream stream :pretty t) (terpri stream))))
(defun selected-p (leaf)
  (or (member leaf (append *mutation-groups* *bootstrap-groups* *other-groups*) :test #'equal)
      (some (lambda (part) (search part leaf))
            '("-command-" "-reader-self-test-" "-snapshot-self-test-" "-check-"))))
(let ((sets (list (cons "core" nil) (cons "mutation" nil) (cons "bootstrap" nil))))
  (let ((spike-groups
          (loop for directory in (sort (directory "spikes/SPK-*/out/") #'string< :key #'namestring)
                for parent = (car (last (butlast (pathname-directory directory))))
                collect (list (subseq parent 0 6) (namestring directory) nil))))
    (unless (= 10 (length spike-groups)) (error "Richieste dieci cache spike distinte."))
    (setf (cdr (assoc "core" sets :test #'equal)) spike-groups))
  (dolist (directory (sort (directory "spikes/out/*/") #'string< :key #'namestring))
    (let ((leaf (car (last (pathname-directory directory)))))
      (when (selected-p leaf)
        (let* ((process-p (not (null (search "-command-" leaf))))
               (set (assoc (cond ((member leaf *mutation-groups* :test #'equal) "mutation")
                                 ((member leaf *bootstrap-groups* :test #'equal) "bootstrap")
                                 (t "core")) sets :test #'equal)))
          (when process-p
            (let* ((record (arcdocdb.evidence:read-evidence (merge-pathnames "report.lisp" directory)))
                   (negative-p (assoc leaf *failed-commands* :test #'equal)))
              (unless (and (eq :command-verification (getf record :kind))
                           (eq (if negative-p :failed :ok) (getf record :status))
                           (eql (if negative-p (cdr negative-p) 0) (getf record :exit-code))
                           (eq :stable (getf record :source-consistency)))
                (error "Produttore non concluso/conforme al contratto: ~A" leaf))))
          (setf (cdr set) (append (cdr set) (list (list leaf (namestring directory) process-p))))))))
  (dolist (set sets)
    (let* ((name (car set)) (groups (cdr set)) (processes nil)
           (manifest-file (format nil "~A-manifest.lisp" name))
           (contract-file (format nil "~A-contract.lisp" name))
           (readme-file (format nil "~A-README.txt" name)))
      (unless groups (error "Gruppo vuoto: ~A" name))
      (dolist (group groups)
        (when (third group)
          (let ((negative-p (assoc (first group) *failed-commands* :test #'equal)))
            (push (list (first group) (if negative-p :failed :ok) (if negative-p (cdr negative-p) 0) :stable) processes))))
      (with-open-file (stream (merge-pathnames readme-file *plan*) :direction :output :if-exists :error)
        (format stream "# Prove preflight ACTIVE: ~A~%~%Freeze locale: `~A`.~%~%Gruppi espliciti completi, inclusi output, configurazioni, patch e FASL.~%Gli indici descrivono le copie; gli audit semantici restano nel gruppo core.~%FASL e report sono dati: non caricarli come codice. Compressione senza perdita.~%~%I due errori CLI nella raccolta mutation sono attesi e distinti dai run positivi.~%Le misure non qualificano C1, MC/DC globale o prestazioni.~%" name *freeze*))
      (save-plan manifest-file
                 (list :schema-version 1 :kind :active-preflight-collection-plan :freeze *freeze*
                       :collection-protocol :complete-explicit-groups-before-collection :groups groups
                       :files (list (list "README.md" (namestring (merge-pathnames readme-file *plan*)))
                                    (list "archive-contract.lisp" (namestring (merge-pathnames contract-file *plan*)))
                                    (list "publication-auditor.txt" "spikes/out/preflight-parallel-publication/audit-R2.lisp"))))
      (save-plan contract-file
                 (list :schema-version 1 :kind :archive-audit-contract :source-commit *freeze*
                       :expected-groups (mapcar #'first groups) :expected-processes (reverse processes)
                       :required-fasl-groups (cond ((equal name "mutation") '("preflight-mutations-R1"))
                                                   ((equal name "bootstrap") '("preflight-bootstrap-mutations-R1"))
                                                   (t '("preflight-core-fasl-R1" "preflight-active-coverage-R1"
                                                        "preflight-closed-coverage-R1"
                                                        "SPK-01" "SPK-02" "SPK-03" "SPK-04" "SPK-05"
                                                        "SPK-06" "SPK-07" "SPK-08" "SPK-09" "SPK-10")))
                       :native-reports nil))
      (format t "~A: ~D gruppi, ~D comandi.~%" name (length groups) (length processes)))))
