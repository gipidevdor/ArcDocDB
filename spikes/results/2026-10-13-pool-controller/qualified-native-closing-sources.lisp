(:SCHEMA-VERSION 1 :KIND :POOL-CONTROLLER-QUALIFIED-NATIVE-CLOSING-SOURCES :VERSION
 "45eb1537ee5dfbbaf9850c704aa359bfcf3b4588" :SOURCES
 ((:PATH #A((35) BASE-CHAR . "spikes/out/pool-native-closing.lisp") :BYTES 1295 :SHA256
   "9f5ffe93df325ed73ad8bfa22507c453162ad9365a5a2609d0d49993f759dc28" :GIT-BLOB
   "53b141399b518d290d6005c1f44c086997d9aec3" :TEXT
   "(pushnew :pool-controller-publication-library *features*)
(load \"spikes/out/pool-controller/publish.lisp\")
(let ((ids (uiop:command-line-arguments)))
 (unless (= 2 (length ids)) (error \"Two addendum process IDs required.\"))
 (loop for id in ids for name in '(\"qualified-native-publication\" \"qualified-native-documents\")
  do (let* ((plan (pool-publication-record-plan (list :name name :id id)
                                               (truename \"./\") *pool-publication-directory*))
            (data (arcdocdb.evidence:read-evidence (merge-pathnames \"report.lisp\" (getf plan :source)))))
       (unless (and (eq :ok (getf data :status)) (eq :stable (getf data :source-consistency))
                    (eql 0 (getf data :exit-code)))
        (error \"Addendum process not OK/STABLE/exit 0: ~A\" id))
       (pool-publication-copy-record plan))))
(worker-save-source-bundle '(\"spikes/out/pool-native-closing.lisp\")
 (merge-pathnames \"qualified-native-closing-sources.lisp\" *pool-publication-directory*)
 :pool-controller-qualified-native-closing-sources :version \"45eb1537ee5dfbbaf9850c704aa359bfcf3b4588\")
(pool-publication-refresh-manifest \"45eb1537ee5dfbbaf9850c704aa359bfcf3b4588\" :stem \"manifesto-coverage-nativo\")
(format t \"Qualified native addendum and whole-file hashes verified.~%\")
")))
