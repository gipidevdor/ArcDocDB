(:SCHEMA-VERSION 1 :KIND :WORKER-SERIES-ORCHESTRATION-BUNDLE :VERSION
 "reader-integration-publication-and-final-seal" :SOURCES
 ((:PATH
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/worker-series-reader-publication.lisp")
   :BYTES 7786 :SHA256 "18d36ccb1e26a1584cda133bc69bea64a1642d5d92f13da72461a9b1c8c5f81e" :GIT-BLOB
   "0e50612353c9bfb2a72c1886b6ecde9064049773" :TEXT "(require :asdf)
(load \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/worker-publication-functions.lisp\")
(defparameter *bridge-canonical* \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-series/\")
(uiop:with-current-directory (\"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/\")
 (worker-copy-process \"4000710249-command-34111-0\" \"full-check-reader-integration\" :directory *bridge-canonical*))
(dolist (source (sort (directory \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710392-check-37003-0/*.lisp\") #'string< :key #'namestring))
 (worker-copy-evidence source (merge-pathnames (file-namestring source) \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-series-reader-spikes-check/\")))
(worker-refresh-catalog \"65972a4e6e84bd4c31d1d654c9a9a29bf6c44eb0\" :directory \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-series-reader-spikes-check/\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/worker-series-fullcheck-auxiliary-reading.lisp\" (merge-pathnames \"reader-integration-reading.lisp\" *bridge-canonical*))
(worker-save-source-bundle (list \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-reader-self-test-34452-0/completion-exit/isolated-build.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-reader-self-test-34452-0/completion-exit/stderr.log\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-reader-self-test-34452-0/completion-exit/stdout.log\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-reader-self-test-34452-0/report.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-reader-self-test-34452-0/signal/isolated-build.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-reader-self-test-34452-0/signal/stderr.log\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-reader-self-test-34452-0/signal/stdout.log\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-snapshot-self-test-34443-0/completion-exit/isolated-build.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-snapshot-self-test-34443-0/completion-exit/stderr.log\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-snapshot-self-test-34443-0/completion-exit/stdout.log\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-snapshot-self-test-34443-0/report.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-snapshot-self-test-34443-0/signal/isolated-build.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-snapshot-self-test-34443-0/signal/stderr.log\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-snapshot-self-test-34443-0/signal/stdout.log\") (merge-pathnames \"reader-integration-selftests.lisp\" *bridge-canonical*)
 :worker-series-selftest-bundle :version \"reader-and-snapshot-intentional-errors\")
(worker-save-source-bundle (list \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/docs/implementazione/worker-serie-decisioni.md\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/docs/implementazione/worker-serie-metodo.md\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/docs/implementazione/worker-serie.md\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/series/worker-boundary.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/series/worker-package.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/series/worker-run.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/src/series/worker-types.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tests/series/worker-bridge.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/tools/worker-series-bench.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/arcdocdb.asd\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/docs/implementazione/README.md\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/CHANGELOG.md\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/docs/implementazione/worker-serie-revisione.md\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/docs/implementazione/worker-serie-risultati.md\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/docs/implementazione/worker-serie-integrazione.md\") (merge-pathnames \"source-reader-integration.lisp\" *bridge-canonical*)
 :worker-series-source-bundle :version \"reader-integration-full-check-freeze\")
(worker-save-source-bundle (list \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/worker-serie-decisioni.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/worker-serie-metodo.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/worker-serie.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/README.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/CHANGELOG.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/worker-serie-revisione.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/worker-serie-risultati.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/worker-serie-integrazione.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-series-reader-spikes-check/README.md\") (merge-pathnames \"documentation-reader-integration.lisp\" *bridge-canonical*)
 :worker-series-documentation-bundle :version \"after-reader-integration-full-check\")
(worker-refresh-catalog \"65972a4e6e84bd4c31d1d654c9a9a29bf6c44eb0\"
 :historical-bases (list \"96c0f4f4d6d1f1882723da1b631e78f89e613059\" \"8101eb856cbe9d7540682babb53afb00fde30f70\" \"2a0011f9d2bef104b22f7ad1eb86d7e5d60d5e11\") :directory *bridge-canonical*)
(format t \"~&Reader integration evidence bytes verified.~%\")
")
  (:PATH
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/worker-series-reader-seal.lisp")
   :BYTES 2318 :SHA256 "24512e1c1c33f0071fcdd00e1f575d5186ea6c16f8ccc3dab0272ab7d07234ba" :GIT-BLOB
   "840e9d59f840be67136b67264b131ff5e8d7eae6" :TEXT "(require :asdf)
(load \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/worker-publication-functions.lisp\")
(defparameter *bridge-canonical* \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-series/\")
(uiop:with-current-directory (\"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/\")
 (worker-copy-process \"4000710731-command-46133-0\" \"documentation-reader-integration-gate\" :directory *bridge-canonical*)
 (worker-copy-process \"4000710594-command-41782-0\" \"publication-reader-integration\" :directory *bridge-canonical*))
(let ((record (arcdocdb.evidence:read-evidence (merge-pathnames \"documentation-reader-integration-gate.lisp\" *bridge-canonical*))))
 (assert (eq :ok (getf record :status))) (assert (eq :stable (getf record :source-consistency)))
 (assert (eql 0 (getf record :exit-code)))
 (assert (equal (getf record :source-blobs-before) (getf record :source-blobs-after)))
 (worker-save-data (list :schema-version 1 :kind :worker-series-publication-gate :status :passed
  :base \"65972a4e6e84bd4c31d1d654c9a9a29bf6c44eb0\" :process \"documentation-reader-integration-gate.lisp\"
  :source-consistency (getf record :source-consistency) :exit-code (getf record :exit-code)
  :stdout (getf record :stdout) :stderr (getf record :stderr)
  :limits '(:documentation-and-evidence-only :full-check-preserved-separately :no-product-change-after-full-check))
  (merge-pathnames \"publication-reader-integration-gate.lisp\" *bridge-canonical*)))
(worker-save-source-bundle (list \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/worker-series-reader-publication.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/worker-series-reader-seal.lisp\" \"/tmp/arcdocdb-worker-series-state.json\")
 (merge-pathnames \"publication-reader-integration-seal.lisp\" *bridge-canonical*)
 :worker-series-orchestration-bundle :version \"reader-integration-publication-and-final-seal\")
(worker-refresh-catalog \"65972a4e6e84bd4c31d1d654c9a9a29bf6c44eb0\"
 :historical-bases (list \"96c0f4f4d6d1f1882723da1b631e78f89e613059\" \"8101eb856cbe9d7540682babb53afb00fde30f70\" \"2a0011f9d2bef104b22f7ad1eb86d7e5d60d5e11\") :directory *bridge-canonical*)
(format t \"~&Reader publication gate read and final catalog bytes verified.~%\")
")
  (:PATH #A((38) BASE-CHAR . "/tmp/arcdocdb-worker-series-state.json") :BYTES 8765 :SHA256
   "fa6ded5ace7f5ae1f1432e347a0cf429884954b058e8aafee8d46d8f25741715" :GIT-BLOB
   "a723aee02f2251d6e144249e5d4bac2f428265c7" :TEXT "{
  \"base\": \"2a0011f9d2bef104b22f7ad1eb86d7e5d60d5e11\",
  \"worktree\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB\",
  \"snapshot\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB\",
  \"owned\": [
    \"docs/implementazione/worker-serie-decisioni.md\",
    \"docs/implementazione/worker-serie-metodo.md\",
    \"docs/implementazione/worker-serie.md\",
    \"src/series/worker-boundary.lisp\",
    \"src/series/worker-package.lisp\",
    \"src/series/worker-run.lisp\",
    \"src/series/worker-types.lisp\",
    \"tests/series/worker-bridge.lisp\",
    \"tools/worker-series-bench.lisp\",
    \"arcdocdb.asd\",
    \"docs/implementazione/README.md\",
    \"CHANGELOG.md\",
    \"docs/implementazione/worker-serie-revisione.md\",
    \"docs/implementazione/worker-serie-risultati.md\",
    \"docs/implementazione/worker-serie-integrazione.md\"
  ],
  \"attempts\": [
    {
      \"snapshot\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-m1eqa0hk/ArcDocDB\",
      \"targeted\": \"4000707711-command-33137-0\",
      \"status\": \"failed\",
      \"reason\": \"unused WRITER in test fixture\"
    },
    {
      \"snapshot\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v2-jck4hkpm/ArcDocDB\",
      \"targeted\": \"4000707803-command-34920-0\",
      \"status\": \"ok\",
      \"scope\": \"23 preliminary tests before R3/R4 and latest hash integration\"
    }
  ],
  \"integration_base\": \"8101eb856cbe9d7540682babb53afb00fde30f70\",
  \"integration_backup\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-rebase-k5nxqclv\",
  \"qualification_base\": \"8101eb856cbe9d7540682babb53afb00fde30f70\",
  \"targeted_final\": \"4000708313-command-79577-0\",
  \"coverage_process\": \"4000708333-command-80909-0\",
  \"coverage\": {
    \"all\": [
      1501,
      1799,
      191,
      250
    ],
    \"bridge\": [
      343,
      416,
      49,
      64
    ]
  },
  \"measurements\": {
    \"status\": \"ok\",
    \"snapshot\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB\",
    \"strict_compile_and_fasl_selftest\": \"4000708361-command-83427-0\",
    \"benchmark_process\": \"4000708391-command-85710-0\",
    \"source_consistency\": \"stable\",
    \"exit_code\": 0,
    \"fasl\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB/spikes/out/worker-series-bench.fasl\",
    \"fasl_sha256\": \"d22c6afc647678d3f807130f66c3664eb78fcecd0694254062aad009731dd019\",
    \"benchmark_report\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB/spikes/out/worker-series-bench-01/report.lisp\",
    \"benchmark_report_bytes\": 49744,
    \"benchmark_report_sha256\": \"418eed082f688416298fe28f593ed7282da79e23aaf4dc445b33831072a3eead\",
    \"replicas\": 5,
    \"iterations\": 4096,
    \"warmup\": 128,
    \"expected_sink\": 8800256,
    \"samples_heap_bytes\": [
      0,
      0,
      0,
      0,
      0
    ],
    \"samples_raw_ticks\": [
      5603,
      5558,
      5536,
      5487,
      5489
    ],
    \"timer_units_per_second\": 1000000,
    \"positive_control\": {
      \"iterations\": 16,
      \"allocation_per_iteration\": 1048576,
      \"heap_bytes\": 16777472,
      \"sink\": 16777336,
      \"expected_sink\": 16777336
    },
    \"wrong_sink\": {
      \"status\": \"expected-rejection\",
      \"sink\": 3,
      \"expected_sink\": 1
    },
    \"baseline_heap_bytes\": 0,
    \"zero_clock\": \"below-resolution\",
    \"failures_preserved\": [
      {
        \"snapshot\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-m1eqa0hk/ArcDocDB\",
        \"process\": \"4000707756-command-33862-0\",
        \"reason\": \"runtime ASDF macro redefinition handled after restoring existing build policy\"
      },
      {
        \"snapshot\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB\",
        \"process\": \"4000708336-command-81274-0\",
        \"reason\": \"malformed argv handler-bind corrected before compiling any file\"
      }
    ],
    \"limits\": [
      \"local serial success path\",
      \"mock I/O startup only\",
      \"counter observation is not universal nonallocation proof\",
      \"no throughput, p99, fairness or scaling claim\"
    ]
  },
  \"coverage_audit_process\": \"4000708506-command-97108-0\",
  \"canonical\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-series\",
  \"publication_program\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/worker-series-publish.lisp\",
  \"retained_records\": [
    {
      \"root\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB\",
      \"id\": \"4000707404-command-27430-0\",
      \"stem\": \"tool-probe-01\"
    },
    {
      \"root\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB\",
      \"id\": \"4000707421-command-27947-0\",
      \"stem\": \"tool-probe-02\"
    },
    {
      \"root\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB\",
      \"id\": \"4000707509-command-29682-0\",
      \"stem\": \"tool-probe-03\"
    },
    {
      \"root\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB\",
      \"id\": \"4000707539-command-30277-0\",
      \"stem\": \"tool-probe-04\"
    },
    {
      \"root\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-m1eqa0hk/ArcDocDB\",
      \"id\": \"4000707711-command-33137-0\",
      \"stem\": \"target-01\"
    },
    {
      \"root\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-m1eqa0hk/ArcDocDB\",
      \"id\": \"4000707756-command-33862-0\",
      \"stem\": \"selftest-01\"
    },
    {
      \"root\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v2-jck4hkpm/ArcDocDB\",
      \"id\": \"4000707803-command-34920-0\",
      \"stem\": \"target-02\"
    },
    {
      \"root\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB\",
      \"id\": \"4000708313-command-79577-0\",
      \"stem\": \"target-final\"
    },
    {
      \"root\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB\",
      \"id\": \"4000708333-command-80909-0\",
      \"stem\": \"coverage-process\"
    },
    {
      \"root\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB\",
      \"id\": \"4000708336-command-81274-0\",
      \"stem\": \"c4-argv-probe\"
    },
    {
      \"root\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB\",
      \"id\": \"4000708361-command-83427-0\",
      \"stem\": \"c4-final\"
    },
    {
      \"root\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB\",
      \"id\": \"4000708391-command-85710-0\",
      \"stem\": \"benchmark-process\"
    },
    {
      \"root\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-v3-e9o8ojto/ArcDocDB\",
      \"id\": \"4000708506-command-97108-0\",
      \"stem\": \"coverage-audit-process\"
    }
  ],
  \"final_integration_base\": \"65972a4e6e84bd4c31d1d654c9a9a29bf6c44eb0\",
  \"latest_integration_backup\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-integration-vyubk5lh\",
  \"coverage_audit_final_process\": \"4000708823-command-7776-0\",
  \"publication_append_process\": \"4000709081-command-11946-0\",
  \"final_snapshot\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB\",
  \"full_check_process\": \"4000710249-command-34111-0\",
  \"full_check_spikes\": \"4000710392-check-37003-0\",
  \"spikes_check_canonical\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-series-spikes-check\",
  \"full_check_result\": {
    \"status\": \"ok\",
    \"source_consistency\": \"stable\",
    \"exit_code\": 0,
    \"named_tests\": 796,
    \"smoke_tests\": 2,
    \"source_count\": 641,
    \"spikes\": 10,
    \"spikes_status\": \"complete\",
    \"stderr_warning_count\": 0
  },
  \"final_document_gate\": \"4000709821-command-23838-0\",
  \"supplement_process\": \"4000709762-command-22492-0\",
  \"prior_final_integration_base\": \"96c0f4f4d6d1f1882723da1b631e78f89e613059\",
  \"reader_integration_backup\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-integration-wxpe39i3\",
  \"prior_full_check_process\": \"4000709286-command-15279-0\",
  \"prior_full_check_spikes\": \"4000709427-check-16929-0\",
  \"prior_final_snapshot\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB\",
  \"reader_spikes_canonical\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-series-reader-spikes-check\",
  \"reader_document_gate\": \"4000710731-command-46133-0\",
  \"reader_publication_process\": \"4000710594-command-41782-0\"
}
")))
