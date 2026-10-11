(:SCHEMA-VERSION 1 :KIND :WORKER-ROUTING-ORCHESTRATION-BUNDLE :VERSION
 "GET-suite-record-conservation" :SOURCES
 ((:PATH
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-get-tests-summary.lisp")
   :BYTES 2098 :SHA256 "128c2c15fc0271aee9843e45841c8edbcfb1f9f9ea4a80176613023ca0078545" :GIT-BLOB
   "cce9e3979e41582b54f61744f5d8a3132866f529" :TEXT "(require :asdf)
(load \"spikes/out/worker-publication-functions.lisp\")
(let* ((path \"spikes/out/4000715110-command-98694-0/report.lisp\")
       (record (arcdocdb.evidence:read-evidence path))
       (lines (uiop:split-string (or (getf record :stdout) \"\") :separator '(#\\Newline)))
       (stderr-lines (uiop:split-string (or (getf record :stderr) \"\") :separator '(#\\Newline)))
       (named (count-if (lambda (line) (uiop:string-prefix-p \"ok    TEST-\" line)) lines))
       (smoke (count-if (lambda (line) (or (search \"ok    package ARCDOCDB\" line) (search \"ok    ARCDOCDB:*VERSION*\" line))) lines))
       (warnings (remove-if-not (lambda (line) (or (search \"WARNING\" line) (search \"unhandled\" line))) stderr-lines))
       (data (list :schema-version 1 :kind :worker-routing-get-tests-build-projection
                   :record path :status (getf record :status) :exit-code (getf record :exit-code)
                   :source-consistency (getf record :source-consistency)
                   :source-count (length (getf record :source-blobs-before))
                   :wall-seconds (getf record :wall-seconds) :command (getf record :command)
                   :named-tests named :smoke smoke :warning-lines warnings
                   :asd (worker-byte-record \"arcdocdb.asd\")
                   :limits '(:existing-suite-only :no-new-ACTIVE-api-qualification
                             :no-new-F0-coverage-or-performance-campaign))))
  (unless (and (eq (getf record :status) :ok) (eq (getf record :source-consistency) :stable)
               (eql (getf record :exit-code) 0) (> named 854) (= smoke 2) (null warnings))
    (error \"Combined GET-suite build is not OK/STABLE/new-tests+2/no-warning.\"))
  (worker-save-data data \"spikes/out/routing-get-tests-summary-data.lisp\")
  (format t \"~&Combined GET-suite build ~S/~S/exit~D, ~D sources, ~D named tests + ~D smoke, warnings ~S, ~,3F seconds.~%\"
          (getf record :status) (getf record :source-consistency) (getf record :exit-code)
          (length (getf record :source-blobs-before)) named smoke warnings (getf record :wall-seconds)))
")
  (:PATH
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-get-tests-publish.lisp")
   :BYTES 3118 :SHA256 "f742d36b279a8270482e27ef50e379af812fba3ee463ae33883c6a1331236006" :GIT-BLOB
   "74e06188f33a72598041c7b8857e668353bc645d" :TEXT "(require :asdf)
(load \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/worker-publication-functions.lisp\")
(defparameter *routing-canonical* \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing/\")
(worker-copy-process \"4000715110-command-98694-0\" \"get-suite-build\" :directory *routing-canonical*)
(worker-copy-evidence \"spikes/out/routing-get-tests-summary-data.lisp\" (merge-pathnames \"get-suite-build-summary.lisp\" *routing-canonical*))
(worker-save-source-bundle (list \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-get-tests-integration-preimages/0-base.txt\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-get-tests-integration-preimages/0-local.txt\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-get-tests-integration-preimages/0-merged.txt\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-get-tests-integration-preimages/0-upstream.txt\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-get-tests-integration-preimages/1-base.txt\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-get-tests-integration-preimages/1-local.txt\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-get-tests-integration-preimages/1-merged.txt\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-get-tests-integration-preimages/1-upstream.txt\") (merge-pathnames \"integration-get-suite-preimages.lisp\" *routing-canonical*) :worker-routing-integration-bundle :version \"GET-suite-added-without-product-changes\")
(worker-save-source-bundle (list \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/arcdocdb.asd\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/README.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/routing-worker-risultati.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/routing-worker-revisione.md\") (merge-pathnames \"publication-get-suite-source-and-docs.lisp\" *routing-canonical*) :worker-routing-source-bundle :version \"final-ASDF-tested-and-docs-updated\")
(worker-save-source-bundle (list \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-get-tests-summary.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-get-tests-publish.lisp\" \"/tmp/arcdocdb-routing-state.json\") (merge-pathnames \"publication-get-suite-orchestration.lisp\" *routing-canonical*) :worker-routing-orchestration-bundle :version \"GET-suite-record-conservation\")
(worker-refresh-catalog \"644e53f176d0dce2c5ac5870659e7d89c0c9df3e\" :historical-bases (list \"92decf4265554cd4959e32a1c881cf00758bb6a1\" \"d155db3f977677fa95280f59c23fbe46a5e116d2\" \"6eeb501d2eace49fad8e2ec333ed0c6c1386dd6c\" \"be9d2dd6816f8c999fcab383702c7a133c061902\") :directory *routing-canonical*)
(format t \"~&Final GET suite originals and source bytes conserved.~%\")
")
  (:PATH #A((32) BASE-CHAR . "/tmp/arcdocdb-routing-state.json") :BYTES 15969 :SHA256
   "a5b89999cd140bd73f25c98a3c37322b46a0fd16d7c629127af0809ad0930709" :GIT-BLOB
   "f63fbbbb4fe98ba10829d3324978eb0df6d9c184" :TEXT "{
  \"worktree\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB\",
  \"base\": \"92decf4265554cd4959e32a1c881cf00758bb6a1\",
  \"owned\": [
    \"src/execution/package.lisp\",
    \"src/execution/handoff.lisp\",
    \"src/series/worker-package.lisp\",
    \"src/series/routing-types.lisp\",
    \"src/series/routing-build.lisp\",
    \"src/series/routing-select.lisp\",
    \"arcdocdb.asd\",
    \"tests/series/worker-routing.lisp\",
    \"tools/worker-routing-bench.lisp\",
    \"docs/implementazione/README.md\",
    \"CHANGELOG.md\",
    \"docs/implementazione/routing-worker.md\",
    \"docs/implementazione/routing-worker-metodo.md\",
    \"docs/implementazione/routing-worker-decisioni.md\",
    \"docs/implementazione/routing-worker-revisione.md\",
    \"docs/implementazione/routing-worker-risultati.md\"
  ],
  \"campaigns\": [
    {
      \"snapshot\": \"v1\",
      \"kind\": \"target\",
      \"record\": \"4000711896-command-71058-0\",
      \"status\": \"failed-fixture-stack\"
    },
    {
      \"snapshot\": \"v1\",
      \"kind\": \"strict-c4\",
      \"record\": \"4000711978-command-74703-0\",
      \"status\": \"ok\"
    },
    {
      \"snapshot\": \"v2\",
      \"kind\": \"target\",
      \"record\": \"4000712082-command-76603-0\",
      \"status\": \"ok\"
    },
    {
      \"snapshot\": \"v2\",
      \"kind\": \"coverage\",
      \"record\": \"4000712082-command-76602-0\",
      \"status\": \"ok\"
    },
    {
      \"snapshot\": \"v2\",
      \"kind\": \"benchmark\",
      \"record\": \"4000712105-command-77187-0\",
      \"status\": \"ok\"
    },
    {
      \"snapshot\": \"v2\",
      \"kind\": \"coverage-audit\",
      \"record\": \"4000712247-command-79840-0\",
      \"status\": \"ok\"
    },
    {
      \"snapshot\": \"worktree\",
      \"kind\": \"publication-initial\",
      \"record\": \"4000712318-command-81618-0\",
      \"status\": \"source-changed-documentation\"
    },
    {
      \"snapshot\": \"worktree\",
      \"kind\": \"byte-gate\",
      \"record\": \"4000712554-command-87125-0\",
      \"status\": \"ok\"
    }
  ],
  \"snapshots\": [
    {
      \"version\": \"v1\",
      \"path\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-v1-qinoyy62/ArcDocDB\",
      \"hashes\": {
        \"src/execution/package.lisp\": \"833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30\",
        \"src/execution/handoff.lisp\": \"3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a\",
        \"src/series/worker-package.lisp\": \"dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7\",
        \"src/series/routing-types.lisp\": \"31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1\",
        \"src/series/routing-build.lisp\": \"70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d\",
        \"src/series/routing-select.lisp\": \"796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a\",
        \"arcdocdb.asd\": \"a4852ba400f91c52af42df0143b921fbcb1895479d4e250f16d57ad8d65f7fb9\",
        \"tests/series/worker-routing.lisp\": \"f2b9b0cf5cc0400732864c12fb0483431a7d2ea1f1dfdafe5b1f3dbb4d4fe151\",
        \"tools/worker-routing-bench.lisp\": \"9a9055374bcf3d845e3878a1c3250feb1c98aebd243692b076cc0f262ad7f7ec\",
        \"docs/implementazione/README.md\": \"992c370f55c979a7a5e5179cd993052640de7863230b37f9754c33b938661571\",
        \"CHANGELOG.md\": \"e0fdb669469b9578adbe3700de2d229e27f3fb8e1ba9c8790320f046520bccc0\",
        \"docs/implementazione/routing-worker.md\": \"7c1e8a5ef5fdddab0f5175a964d205d69a96823e239c733b59165c1d3e99d03e\",
        \"docs/implementazione/routing-worker-metodo.md\": \"ef5a5c090db1723dad999943456f6d18d71e0a3c85d9bff3505f213765bb9e01\",
        \"docs/implementazione/routing-worker-revisione.md\": \"c740088bf5b9781c0840505b83fd10e4fcde825ec2d985576809dad1840f095d\"
      },
      \"paths\": [
        \"src/execution/package.lisp\",
        \"src/execution/handoff.lisp\",
        \"src/series/worker-package.lisp\",
        \"src/series/routing-types.lisp\",
        \"src/series/routing-build.lisp\",
        \"src/series/routing-select.lisp\",
        \"arcdocdb.asd\",
        \"tests/series/worker-routing.lisp\",
        \"tools/worker-routing-bench.lisp\",
        \"docs/implementazione/README.md\",
        \"CHANGELOG.md\",
        \"docs/implementazione/routing-worker.md\",
        \"docs/implementazione/routing-worker-metodo.md\",
        \"docs/implementazione/routing-worker-revisione.md\"
      ]
    },
    {
      \"version\": \"v2\",
      \"path\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-v2-skkktsa6/ArcDocDB\",
      \"hashes\": {
        \"src/execution/package.lisp\": \"833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30\",
        \"src/execution/handoff.lisp\": \"3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a\",
        \"src/series/worker-package.lisp\": \"dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7\",
        \"src/series/routing-types.lisp\": \"31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1\",
        \"src/series/routing-build.lisp\": \"70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d\",
        \"src/series/routing-select.lisp\": \"796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a\",
        \"arcdocdb.asd\": \"a4852ba400f91c52af42df0143b921fbcb1895479d4e250f16d57ad8d65f7fb9\",
        \"tests/series/worker-routing.lisp\": \"f495d33f73e3249d1055ea61d65034033367de85edec3db2cac3a63ff449e3f9\",
        \"tools/worker-routing-bench.lisp\": \"9a9055374bcf3d845e3878a1c3250feb1c98aebd243692b076cc0f262ad7f7ec\",
        \"docs/implementazione/README.md\": \"992c370f55c979a7a5e5179cd993052640de7863230b37f9754c33b938661571\",
        \"CHANGELOG.md\": \"e0fdb669469b9578adbe3700de2d229e27f3fb8e1ba9c8790320f046520bccc0\",
        \"docs/implementazione/routing-worker.md\": \"7c1e8a5ef5fdddab0f5175a964d205d69a96823e239c733b59165c1d3e99d03e\",
        \"docs/implementazione/routing-worker-metodo.md\": \"9d4fe6ac9ef16ec4496bd14fb0e01f5a31d9639056b4dd94edb895d1d899e25f\",
        \"docs/implementazione/routing-worker-decisioni.md\": \"ef9e0d614d0b40596a879272b5fee407ce867e465d9fbe53301752560323700e\",
        \"docs/implementazione/routing-worker-revisione.md\": \"3dd4debcc4191b7384d2669b8a7e96500761b77b5d90bf68c20e42f867e70b34\"
      },
      \"paths\": [
        \"src/execution/package.lisp\",
        \"src/execution/handoff.lisp\",
        \"src/series/worker-package.lisp\",
        \"src/series/routing-types.lisp\",
        \"src/series/routing-build.lisp\",
        \"src/series/routing-select.lisp\",
        \"arcdocdb.asd\",
        \"tests/series/worker-routing.lisp\",
        \"tools/worker-routing-bench.lisp\",
        \"docs/implementazione/README.md\",
        \"CHANGELOG.md\",
        \"docs/implementazione/routing-worker.md\",
        \"docs/implementazione/routing-worker-metodo.md\",
        \"docs/implementazione/routing-worker-decisioni.md\",
        \"docs/implementazione/routing-worker-revisione.md\"
      ]
    },
    {
      \"version\": \"final\",
      \"path\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB\",
      \"hashes\": {
        \"src/execution/package.lisp\": \"833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30\",
        \"src/execution/handoff.lisp\": \"3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a\",
        \"src/series/worker-package.lisp\": \"dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7\",
        \"src/series/routing-types.lisp\": \"31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1\",
        \"src/series/routing-build.lisp\": \"70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d\",
        \"src/series/routing-select.lisp\": \"796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a\",
        \"arcdocdb.asd\": \"30eca55034b83b652bb98fa501efee833e1b90e59cec068e54de59ae72f9e23e\",
        \"tests/series/worker-routing.lisp\": \"f495d33f73e3249d1055ea61d65034033367de85edec3db2cac3a63ff449e3f9\",
        \"tools/worker-routing-bench.lisp\": \"9a9055374bcf3d845e3878a1c3250feb1c98aebd243692b076cc0f262ad7f7ec\",
        \"docs/implementazione/README.md\": \"c48a17916d1bae0d2045dccbda23f24b9a6fbe44bdbe05c5e5fe3e526efec574\",
        \"CHANGELOG.md\": \"e9bdfa636364a576b513005d4cf1fa58465161e50775decc8eafb194a0025523\",
        \"docs/implementazione/routing-worker.md\": \"9ac1584adaa0099ca71e39699f6cfea94d8e4637a8e7bd6a674e29faffa2586b\",
        \"docs/implementazione/routing-worker-metodo.md\": \"9d4fe6ac9ef16ec4496bd14fb0e01f5a31d9639056b4dd94edb895d1d899e25f\",
        \"docs/implementazione/routing-worker-decisioni.md\": \"949a9e8013207ab5d81290fb7cf703b5ccb45d831636fccadb36a1d4d9b0dad2\",
        \"docs/implementazione/routing-worker-revisione.md\": \"2f7b1ed1c8ce6948c3f0c055847be601eb7570a4dfdfda20989ca652b398f1d4\",
        \"docs/implementazione/routing-worker-risultati.md\": \"06debfa9e74343b66640adeb3e3829f39ce094d362748fe9ad716769888c2d02\"
      },
      \"paths\": [
        \"src/execution/package.lisp\",
        \"src/execution/handoff.lisp\",
        \"src/series/worker-package.lisp\",
        \"src/series/routing-types.lisp\",
        \"src/series/routing-build.lisp\",
        \"src/series/routing-select.lisp\",
        \"arcdocdb.asd\",
        \"tests/series/worker-routing.lisp\",
        \"tools/worker-routing-bench.lisp\",
        \"docs/implementazione/README.md\",
        \"CHANGELOG.md\",
        \"docs/implementazione/routing-worker.md\",
        \"docs/implementazione/routing-worker-metodo.md\",
        \"docs/implementazione/routing-worker-decisioni.md\",
        \"docs/implementazione/routing-worker-revisione.md\",
        \"docs/implementazione/routing-worker-risultati.md\"
      ]
    },
    {
      \"version\": \"latest\",
      \"path\": \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB\",
      \"hashes\": {
        \"src/execution/package.lisp\": \"833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30\",
        \"src/execution/handoff.lisp\": \"3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a\",
        \"src/series/worker-package.lisp\": \"dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7\",
        \"src/series/routing-types.lisp\": \"31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1\",
        \"src/series/routing-build.lisp\": \"70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d\",
        \"src/series/routing-select.lisp\": \"796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a\",
        \"arcdocdb.asd\": \"3b3ce29d4b370c82d2a4f6e05d3650f9217cbe9e4d9e63c10b94c9cb7c2d4ea8\",
        \"tests/series/worker-routing.lisp\": \"f495d33f73e3249d1055ea61d65034033367de85edec3db2cac3a63ff449e3f9\",
        \"tools/worker-routing-bench.lisp\": \"9a9055374bcf3d845e3878a1c3250feb1c98aebd243692b076cc0f262ad7f7ec\",
        \"docs/implementazione/README.md\": \"d85cbea154f0ffc15069de954ce4f08c0620833bed11dad189bb0013d28e4928\",
        \"CHANGELOG.md\": \"5ba1abe1a33d17fca86a3541edeb398eb1f99b1618b3ab83023efa036f49d9f0\",
        \"docs/implementazione/routing-worker.md\": \"9ac1584adaa0099ca71e39699f6cfea94d8e4637a8e7bd6a674e29faffa2586b\",
        \"docs/implementazione/routing-worker-metodo.md\": \"9d4fe6ac9ef16ec4496bd14fb0e01f5a31d9639056b4dd94edb895d1d899e25f\",
        \"docs/implementazione/routing-worker-decisioni.md\": \"f2f909eef13f7ee89509b4079b50ca43588b61c0ace945226601afd638a509d6\",
        \"docs/implementazione/routing-worker-revisione.md\": \"397ea2adeb96801788ed01e5e8bfce874a065fc898ff7e0a3e094a9371040fda\",
        \"docs/implementazione/routing-worker-risultati.md\": \"3b6fb82a6eebe22a1517b325177c225137afed434e6172a1d7137f23d60b558b\"
      },
      \"paths\": [
        \"src/execution/package.lisp\",
        \"src/execution/handoff.lisp\",
        \"src/series/worker-package.lisp\",
        \"src/series/routing-types.lisp\",
        \"src/series/routing-build.lisp\",
        \"src/series/routing-select.lisp\",
        \"arcdocdb.asd\",
        \"tests/series/worker-routing.lisp\",
        \"tools/worker-routing-bench.lisp\",
        \"docs/implementazione/README.md\",
        \"CHANGELOG.md\",
        \"docs/implementazione/routing-worker.md\",
        \"docs/implementazione/routing-worker-metodo.md\",
        \"docs/implementazione/routing-worker-decisioni.md\",
        \"docs/implementazione/routing-worker-revisione.md\",
        \"docs/implementazione/routing-worker-risultati.md\"
      ]
    }
  ],
  \"integrationbase\": \"d155db3f977677fa95280f59c23fbe46a5e116d2\",
  \"integrationpreimages\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-integration-preimages\",
  \"canonical\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing\",
  \"qualification\": {
    \"target-tests\": 18,
    \"coverage-files\": 26,
    \"union-total\": [
      3250,
      3766,
      436,
      526
    ],
    \"routing-total\": [
      267,
      291,
      40,
      42
    ],
    \"handoff-total\": [
      189,
      206,
      18,
      20
    ],
    \"heap\": [
      0,
      0,
      0,
      0,
      0
    ],
    \"raw-ticks\": [
      6792,
      6802,
      6814,
      6820,
      6815
    ],
    \"sink\": 8972288,
    \"positive-heap\": 16777472
  },
  \"fullcheck\": {
    \"record\": \"4000712542-command-86913-0\",
    \"status\": \"ok\",
    \"source-consistency\": \"stable\",
    \"source-files\": 673,
    \"tests\": 835,
    \"smoke\": 2,
    \"suites\": 21,
    \"spikes-master\": \"4000712691-check-90489-0\",
    \"spikes\": 10,
    \"wall-seconds\": 182.076021,
    \"projection\": \"spikes/out/4000712744-routing-fullcheck-projection-92144\"
  },
  \"spikescanonical\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check\",
  \"auxiliary\": {
    \"integrity-record\": \"4000712842-command-93594-0\",
    \"failed-replay-record\": \"4000712876-command-94086-0\",
    \"original-failed-raw\": \"not-recorded\"
  },
  \"publication\": {
    \"record\": \"4000713251-command-579-0\",
    \"status\": \"ok\",
    \"gate-record\": \"4000713454-command-5744-0\",
    \"gate-status\": \"ok\",
    \"latest-integration-record\": \"4000713674-command-12282-0\",
    \"latest-fullcheck-record\": \"4000713991-command-28617-0\",
    \"final-documentation-gate\": \"4000714129-command-33773-0\",
    \"final-documentation-status\": \"ok-stable\",
    \"seal-record\": \"4000714288-command-40431-0\"
  },
  \"latestbase\": \"6eeb501d2eace49fad8e2ec333ed0c6c1386dd6c\",
  \"latestintegrationpreimages\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-integration-latest-preimages\",
  \"latestfullcheck\": {
    \"record\": \"4000713646-command-11645-0\",
    \"status\": \"ok\",
    \"source-consistency\": \"stable\",
    \"source-files\": 683,
    \"tests\": 854,
    \"smoke\": 2,
    \"suites\": 22,
    \"spikes-master\": \"4000713800-check-18712-0\",
    \"spikes\": 10,
    \"wall-seconds\": 185.668746,
    \"projection\": \"spikes/out/4000713838-routing-latest-projection-20354\",
    \"spikescanonical\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/latest\",
    \"integrity-record\": \"4000713862-command-21871-0\"
  },
  \"qualified-commit\": \"1a5f55e85fc86398ce08d427e48b5526b0880b80\",
  \"merged-upstream\": \"be9d2dd6816f8c999fcab383702c7a133c061902\",
  \"active-integration-preimages\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-active-integration-preimages\",
  \"merged-build\": {
    \"record\": \"4000714586-command-55084-0\",
    \"status\": \"ok\",
    \"source-consistency\": \"stable\",
    \"source-files\": 690,
    \"tests\": 854,
    \"smoke\": 2,
    \"warnings\": 0,
    \"summary\": \"spikes/out/routing-merged-summary-data.lisp\"
  },
  \"active-merged-commit\": \"d8f8dd35aea6159aa25ec54302385a664e2e9357\",
  \"get-tests-upstream\": \"644e53f176d0dce2c5ac5870659e7d89c0c9df3e\",
  \"get-tests-preimages\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-get-tests-integration-preimages\",
  \"get-tests-build\": {
    \"record\": \"4000715110-command-98694-0\",
    \"status\": \"ok\",
    \"source-consistency\": \"stable\",
    \"source-files\": 694,
    \"tests\": 924,
    \"smoke\": 2,
    \"warnings\": 0,
    \"summary\": \"spikes/out/routing-get-tests-summary-data.lisp\"
  }
}
")))
