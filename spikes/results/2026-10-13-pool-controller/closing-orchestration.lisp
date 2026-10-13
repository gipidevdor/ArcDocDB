(:SCHEMA-VERSION 1 :KIND :POOL-CONTROLLER-CLOSING-ORCHESTRATION :VERSION
 "6aca98520142d578539f8303bb0e36a377c1f8cf" :SOURCES
 ((:PATH #A((33) BASE-CHAR . "spikes/out/pool-seal-closing.lisp") :BYTES 1239 :SHA256
   "1930cd6336015cc3fdc3cd04e0ada309a4dbfce22c152f0723429f7cebdedfda" :GIT-BLOB
   "5c80cba55d68c708b5fdd550f79a3738d0d01adf" :TEXT
   "(pushnew :pool-controller-publication-library *features*)
(load \"spikes/out/pool-controller/publish.lisp\")
(let ((ids (uiop:command-line-arguments)))
 (unless (= 2 (length ids)) (error \"Two final process IDs required.\"))
 (loop for id in ids for name in '(\"integration-preservation\" \"final-documents\")
  do (let* ((record (list :name name :id id))
            (plan (pool-publication-record-plan record (truename \"./\") *pool-publication-directory*))
            (data (arcdocdb.evidence:read-evidence (merge-pathnames \"report.lisp\" (getf plan :source)))))
       (unless (and (eq :ok (getf data :status)) (eq :stable (getf data :source-consistency))
                    (eql 0 (getf data :exit-code)))
        (error \"Final process not OK/STABLE/exit 0: ~A\" id))
       (pool-publication-copy-record plan))))
(worker-save-source-bundle '(\"spikes/out/pool-seal-closing.lisp\")
 (merge-pathnames \"closing-orchestration.lisp\" *pool-publication-directory*)
 :pool-controller-closing-orchestration :version \"6aca98520142d578539f8303bb0e36a377c1f8cf\")
(pool-publication-refresh-manifest \"6aca98520142d578539f8303bb0e36a377c1f8cf\" :stem \"manifesto-sigillo\")
(format t \"Final original records, whole-file manifest and derived catalog verified.~%\")
")))
