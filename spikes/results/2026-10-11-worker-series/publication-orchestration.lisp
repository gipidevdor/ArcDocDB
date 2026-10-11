(:SCHEMA-VERSION 1 :KIND :WORKER-SERIES-ORCHESTRATION-BUNDLE :VERSION
 "append-and-final-publication" :SOURCES
 ((:PATH
   #A((97) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/worker-series-append.lisp")
   :BYTES 1591 :SHA256 "feebd99aceafe8c567c06ee42d9b6681c34ec70a719fbc39f73d14767b8f90fe" :GIT-BLOB
   "8287626d22da40e28a47cd84ace2cc4eacd6a427" :TEXT "(require :asdf)
(load \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/worker-publication-functions.lisp\")
(defparameter *bridge-canonical* \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-series/\")
(uiop:with-current-directory (\"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB/\")
 (worker-copy-process \"4000708823-command-7776-0\" \"coverage-audit-final-process\" :directory *bridge-canonical*))
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB/spikes/out/worker-series-coverage-audit-02.lisp\" (merge-pathnames \"coverage-audit-final.lisp\" *bridge-canonical*))
(worker-save-source-bundle (list \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB/spikes/out/worker-series-coverage-reader-02.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/worker-series-publish.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/worker-series-publication-output.txt\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/worker-publication-functions.lisp\")
 (merge-pathnames \"orchestration-final.lisp\" *bridge-canonical*) :worker-series-orchestration-bundle :version \"final-audit-and-publication\")
(worker-refresh-catalog \"8101eb856cbe9d7540682babb53afb00fde30f70\" :historical-bases (list \"2a0011f9d2bef104b22f7ad1eb86d7e5d60d5e11\") :directory *bridge-canonical*)
(format t \"~&Final audit bytes validated.~%\")
")
  (:PATH
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/worker-series-finish-publication.lisp")
   :BYTES 3564 :SHA256 "853dd020a01b028ea571d4ecc0f00904decdc74828be0cd55cbb489df89e7d58" :GIT-BLOB
   "91bdd91c4a67549e0de1676f2df793c255082c00" :TEXT "(require :asdf)
(load \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/worker-publication-functions.lisp\")
(defparameter *bridge-canonical* \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-series/\")
(uiop:with-current-directory (\"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/\")
 (worker-copy-process \"4000709081-command-11946-0\" \"publication-append-process\" :directory *bridge-canonical*))
(worker-save-source-bundle (list \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/docs/implementazione/worker-serie-decisioni.md\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/docs/implementazione/worker-serie-metodo.md\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/docs/implementazione/worker-serie.md\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/src/series/worker-boundary.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/src/series/worker-package.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/src/series/worker-run.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/src/series/worker-types.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/tests/series/worker-bridge.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/tools/worker-series-bench.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/arcdocdb.asd\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/docs/implementazione/README.md\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/CHANGELOG.md\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/docs/implementazione/worker-serie-revisione.md\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/docs/implementazione/worker-serie-risultati.md\")
 (merge-pathnames \"source-make-check.lisp\" *bridge-canonical*) :worker-series-source-bundle :version \"integrated-full-check-freeze\")
(uiop:with-current-directory (\"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/\")
 (worker-copy-process \"4000709286-command-15279-0\" \"full-check\" :directory *bridge-canonical*))
(dolist (source (sort (directory \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/spikes/out/4000709427-check-16929-0/*.lisp\") #'string< :key #'namestring))
 (worker-copy-evidence source (merge-pathnames (file-namestring source) \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-series-spikes-check/\")))
(worker-refresh-catalog \"96c0f4f4d6d1f1882723da1b631e78f89e613059\" :directory \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-series-spikes-check/\")
(worker-refresh-catalog \"96c0f4f4d6d1f1882723da1b631e78f89e613059\"
 :historical-bases (list \"8101eb856cbe9d7540682babb53afb00fde30f70\" \"2a0011f9d2bef104b22f7ad1eb86d7e5d60d5e11\") :directory *bridge-canonical*)
(format t \"~&Full-check evidence publication verified.~%\")
")))
