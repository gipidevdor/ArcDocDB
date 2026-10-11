(require :asdf)
(load "tools/evidence-storage.lisp")
(dolist (path (uiop:command-line-arguments))
  (let* ((wrapper (arcdocdb.evidence:read-evidence path))
         (*read-eval* nil) (*package* (find-package :cl-user))
         (data (with-input-from-string (s (getf wrapper :stdout)) (read s))))
    (format t "~A: ~S/~S/stable~S/wall~S~%" path (getf wrapper :status) (getf wrapper :exit-code)
            (getf wrapper :source-consistency) (getf wrapper :wall-seconds))
    (let ((*print-length* 20) (*print-level* 5))
      (format t "~S~%" (loop for (key val) on data by #'cddr unless (member key
        '(:source-blobs-before :source-blobs-after :source-fingerprints-before :source-fingerprints-after
          :observations :source-fingerprints :targets :mutants :coverage-gap-map :cells)) append (list key val))))))
