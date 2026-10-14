(:schema-version 1 :kind :cbor-interleaving-F2-collection-plan
 :freeze "0c7d08f8383892a6c7c07d9c9b2fbae9afe8f523"
 :collection-protocol :complete-explicit-closed-groups-before-collection
 :full-module-tests 1444 :full-suites 33 :smoke-checks 2
 :registered-directory-tests 72 :core-get-tests 70 :active-tests 42 :resolver-tests 42 :epochs-tests 34 :read-tests 30
 :groups (
  ("publication-tools" "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/cbor-interleaving-publication/" nil)
  ("original-CI-attempt1" "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-runtime/pr-13-run-38634044870/" nil)
  ("CI-helper-R1" "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-audit/" nil)
  ("CI-helper-R2" "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-audit-R2/" nil)
  ("CI-helper-R1-failure" "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4000999676-command-83495-0/" t)
  ("CI-helper-R2-negative-reference" "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4000999945-command-89224-0/" t)
  ("F2-full-outer" "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001000166-command-92120-0/" t)
  ("F2-full-inner" "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001000168-command-92151-0/" t)
  ("F2-full-cache" "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/cbor-interleaving-F2-fasl/" nil)
  ("F2-reader-fixtures" "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001000206-reader-self-test-92549-0/" nil)
  ("F2-snapshot-fixtures" "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001000205-snapshot-self-test-92545-0/" nil)
  ("F2-spike-aggregate" "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001000396-check-98622-0/" nil)
  ("F2-native-semantic-audit" "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4001000591-command-445-0/" t)
  ("F2-semantic-output" "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/f2-audit-runtime/" nil)
  ("SPK-01-whole-cache" "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-01-primary-index/out/" nil)
  ("SPK-02-whole-cache" "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-02-gc/out/" nil)
  ("SPK-03-whole-cache" "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-03-group-commit/out/" nil)
  ("SPK-04-whole-cache" "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-04-writer-pool/out/" nil)
  ("SPK-05-whole-cache" "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-05-segment-read/out/" nil)
  ("SPK-06-whole-cache" "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-06-compaction-load/out/" nil)
  ("SPK-07-whole-cache" "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-07-protocols/out/" nil)
  ("SPK-08-whole-cache" "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-08-generated-code/out/" nil)
  ("SPK-09-whole-cache" "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-09-integrity/out/" nil)
  ("SPK-10-whole-cache" "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/SPK-10-v2-limits/out/" nil)
 )
 :files (
  ("README.md" "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/cbor-interleaving-publication/README.md.txt")
  ("archive-audit-contract.lisp" "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/cbor-interleaving-publication/archive-audit-contract.lisp")
  ("semantic-audit-source.txt" "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/cbor-interleaving-publication/audit-F2.lisp")
  ("archive-audit-source.txt" "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/cbor-interleaving-publication/audit-batch.lisp")
  ("batch-sha-source.txt" "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/cbor-interleaving-publication/batch-sha.lisp")
  ("CI-R1-auditor-source.txt" "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-audit/audit.lisp")
  ("CI-R2-auditor-source.txt" "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-ci-audit-R2/audit.lisp")
  ("git-counter-source.txt" "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/cbor-interleaving-publication/count-tests.lisp")
 )
 :limits (:complete-whole-groups :raw-fasl-data-only :original-CI-attempt1-failure-retained
          :CI-helper-R1-summary-NIL-failure-retained :CI-helper-R2-negative-reference-not-a-product-pass
          :SPK-whole-caches-contain-older-and-F2-files :no-earlier-scope-or-CI-promoted-to-F2 :no-append))
