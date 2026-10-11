(:SCHEMA-VERSION 1 :KIND :WORKER-ROUTING-ORCHESTRATION-BUNDLE :VERSION "before-latest-fullcheck"
 :SOURCES
 ((:PATH
   #A((97) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-full-publish.lisp")
   :BYTES 7875 :SHA256 "6b635d2f441a74cbbd8d8de60bb60c36bbfbebd0093bf594ccd64a378e9af659" :GIT-BLOB
   "50cd19c27dd681d27f28340f2603f3777e6a0190" :TEXT "(require :asdf)
(load \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/worker-publication-functions.lisp\")
(defparameter *routing-canonical* \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing/\")
(uiop:with-current-directory (\"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/\") (worker-copy-process \"4000712542-command-86913-0\" \"full-check\" :directory *routing-canonical*))
(uiop:with-current-directory (\"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/\") (worker-copy-process \"4000712842-command-93594-0\" \"fullcheck-selftests-integrity-process\" :directory *routing-canonical*))
(uiop:with-current-directory (\"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/\") (worker-copy-process \"4000712876-command-94086-0\" \"fullcheck-auxiliary-failed-replay\" :directory *routing-canonical*))
(uiop:with-current-directory (\"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/\") (worker-copy-process \"4000712554-command-87125-0\" \"publication-byte-gate\" :directory *routing-canonical*))
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712744-routing-fullcheck-projection-92144/summary.lisp\" (merge-pathnames \"fullcheck-summary.lisp\" *routing-canonical*))
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712744-routing-fullcheck-projection-92144/auxiliary-bundle.lisp\" (merge-pathnames \"fullcheck-selftests.lisp\" *routing-canonical*))
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712744-routing-fullcheck-projection-92144/integrity.lisp\" (merge-pathnames \"fullcheck-selftests-integrity.lisp\" *routing-canonical*))
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712744-routing-fullcheck-projection-92144/conservazione.lisp\" (merge-pathnames \"fullcheck-selftests-conservazione.lisp\" *routing-canonical*))
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712691-check-90489-0/SPK-01.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/SPK-01.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712691-check-90489-0/SPK-02.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/SPK-02.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712691-check-90489-0/SPK-03.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/SPK-03.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712691-check-90489-0/SPK-04.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/SPK-04.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712691-check-90489-0/SPK-05.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/SPK-05.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712691-check-90489-0/SPK-06.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/SPK-06.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712691-check-90489-0/SPK-07.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/SPK-07.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712691-check-90489-0/SPK-08.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/SPK-08.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712691-check-90489-0/SPK-09.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/SPK-09.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712691-check-90489-0/SPK-10.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/SPK-10.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712691-check-90489-0/conservazione.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/conservazione.lisp\")
(worker-copy-evidence \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/4000712691-check-90489-0/report.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/report.lisp\")
(worker-refresh-catalog \"d155db3f977677fa95280f59c23fbe46a5e116d2\" :directory \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/\")
(worker-save-source-bundle (list \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-byte-gate.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/routing-fullcheck-integrity-failed-v1.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/routing-fullcheck-integrity.lisp\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/routing-fullcheck-runner.sh\" \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-final-0cdxq3wa/ArcDocDB/spikes/out/routing-fullcheck-summary.lisp\") (merge-pathnames \"fullcheck-orchestration.lisp\" *routing-canonical*) :worker-routing-orchestration-bundle :version \"full-check-and-auxiliary-probes\")
(worker-save-source-bundle (list \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/README.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/CHANGELOG.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/routing-worker.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/routing-worker-metodo.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/routing-worker-decisioni.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/routing-worker-revisione.md\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/routing-worker-risultati.md\") (merge-pathnames \"documentation-final.lisp\" *routing-canonical*) :worker-routing-documentation-bundle :version \"after-full-check\")
(worker-refresh-catalog \"d155db3f977677fa95280f59c23fbe46a5e116d2\" :historical-bases (list \"92decf4265554cd4959e32a1c881cf00758bb6a1\") :directory *routing-canonical*)
(format t \"~&Full-check routing evidence bytes verified.~%\")
")
  (:PATH
   #A((132) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/routing-latest-check-runner.sh")
   :BYTES 363 :SHA256 "9010698d4a47344f9eac3e708a6306c7486ae1efc91a657940bfe1fbf55e8c97" :GIT-BLOB
   "93207b19dc23bbadb8c9a9f20ac4f93699fdfcf4" :TEXT "#!/bin/sh
exec /opt/homebrew/bin/sbcl --dynamic-space-size 2048 --noinform --no-userinit --no-sysinit --script tools/record-command.lisp -- env 'ASDF_OUTPUT_TRANSLATIONS=(:output-translations (t \"/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-routing-latest-v_3u6kpf/ArcDocDB/spikes/out/latest-fasl/\") :ignore-inherited-configuration)' make check-core
")
  (:PATH #A((32) BASE-CHAR . "/tmp/arcdocdb-routing-state.json") :BYTES 14018 :SHA256
   "91257ddffd09b6d6a192650d7eb37a315bce1606991ac69f23012152522308b1" :GIT-BLOB
   "6551882f04cc0d92a630beb599c9c2d2362ccc46" :TEXT "{
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
    \"gate-status\": \"ok\"
  },
  \"latestbase\": \"6eeb501d2eace49fad8e2ec333ed0c6c1386dd6c\",
  \"latestintegrationpreimages\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/routing-integration-latest-preimages\"
}
")))
