(:SCHEMA-VERSION 1 :KIND :WORKER-SERIES-ORCHESTRATION-BUNDLE :VERSION
 "final-seal-and-path-manifest" :SOURCES
 ((:PATH
   #A((95) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/worker-series-seal.lisp")
   :BYTES 2037 :SHA256 "b9f6a5219009ed5018927aae71e242fdea61d45f00a93a5ac6999514b0a0af60" :GIT-BLOB
   "7858b75852bc4903c2ef1a1b8b595320ab671b10" :TEXT "(require :asdf)
(load \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/worker-publication-functions.lisp\")
(defparameter *bridge-canonical* \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-series/\")
(uiop:with-current-directory (\"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/\")
 (worker-copy-process \"4000709821-command-23838-0\" \"documentation-gate\" :directory *bridge-canonical*)
 (worker-copy-process \"4000709762-command-22492-0\" \"publication-supplement-process\" :directory *bridge-canonical*))
(let ((record (arcdocdb.evidence:read-evidence (merge-pathnames \"documentation-gate.lisp\" *bridge-canonical*))))
 (assert (eq :ok (getf record :status)))
 (assert (eq :stable (getf record :source-consistency)))
 (assert (eql 0 (getf record :exit-code)))
 (assert (equal (getf record :source-blobs-before) (getf record :source-blobs-after)))
 (worker-save-data (list :schema-version 1 :kind :worker-series-publication-gate
  :status :passed :base \"96c0f4f4d6d1f1882723da1b631e78f89e613059\"
  :process \"documentation-gate.lisp\" :source-consistency (getf record :source-consistency)
  :exit-code (getf record :exit-code) :stdout (getf record :stdout) :stderr (getf record :stderr)
  :limits '(:documentation-and-evidence-only :full-check-preserved-separately :no-product-change-after-full-check))
  (merge-pathnames \"publication-gate.lisp\" *bridge-canonical*)))
(worker-save-source-bundle (list \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/worker-series-seal.lisp\" \"/tmp/arcdocdb-worker-series-state.json\")
 (merge-pathnames \"publication-seal.lisp\" *bridge-canonical*) :worker-series-orchestration-bundle :version \"final-seal-and-path-manifest\")
(worker-refresh-catalog \"96c0f4f4d6d1f1882723da1b631e78f89e613059\"
 :historical-bases (list \"8101eb856cbe9d7540682babb53afb00fde30f70\" \"2a0011f9d2bef104b22f7ad1eb86d7e5d60d5e11\") :directory *bridge-canonical*)
(format t \"~&Publication gate read and final catalog bytes verified.~%\")
")
  (:PATH #A((38) BASE-CHAR . "/tmp/arcdocdb-worker-series-state.json") :BYTES 7976 :SHA256
   "482ed508f55eabec8a9ff418b6c9c7db18b81246186690749d0a4083947e69f7" :GIT-BLOB
   "56aee53e001291ff9b94e5855818ebd7b2f7a83e" :TEXT "{
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
    \"docs/implementazione/worker-serie-risultati.md\"
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
  \"final_integration_base\": \"96c0f4f4d6d1f1882723da1b631e78f89e613059\",
  \"latest_integration_backup\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-integration-vyubk5lh\",
  \"coverage_audit_final_process\": \"4000708823-command-7776-0\",
  \"publication_append_process\": \"4000709081-command-11946-0\",
  \"final_snapshot\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB\",
  \"full_check_process\": \"4000709286-command-15279-0\",
  \"full_check_spikes\": \"4000709427-check-16929-0\",
  \"spikes_check_canonical\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-series-spikes-check\",
  \"full_check_result\": {
    \"status\": \"ok\",
    \"source_consistency\": \"stable\",
    \"exit_code\": 0,
    \"named_tests\": 732,
    \"smoke_tests\": 2,
    \"source_count\": 632,
    \"spikes\": 10,
    \"spikes_status\": \"complete\",
    \"stderr_warning_count\": 0
  },
  \"final_document_gate\": \"4000709821-command-23838-0\",
  \"supplement_process\": \"4000709762-command-22492-0\"
}
")))
