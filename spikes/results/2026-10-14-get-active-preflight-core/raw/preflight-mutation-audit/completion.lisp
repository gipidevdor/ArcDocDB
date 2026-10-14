(:schema-version 1 :kind :mutation-audit-completion :status :ok
 :commit "8c0866711c50d047f87b9c484ce56d42a87ba19c"
 :final-source-sha256 "0748e2231d29bf9fb95d6275b319c48b4a7cf957b609b6f8f6c6e5516d9acad2"
 :final-report "full-audit-R3.lisp"
 :final-native "spikes/out/4000986312-command-79161-0/report.lisp"
 :final-native-status :ok :final-native-exit 0 :final-native-stderr-bytes 0
 :readback "read-results-R3.stdout.lisp" :read-eval nil :eof-checked t
 :source-git-path-blob-count 852 :tracked-git-status :clean
 :full-input-inventory (:files 8079 :bytes 140152233 :two-pass :stable)
 :preflight (:baseline 42 :mutants 4 :whole-registry-per-child 42
             :mutant-selected 1 :mutant-executed 1 :actual-targets-all-exact t
             :failure-kinds (:assertion :assertion :assertion :product-condition)
             :product-condition ("ARCDOCDB.CONDITIONS" "RESOURCE-EXHAUSTED" :active-batch-record-budget)
             :bounded-operations 109 :exact-separate-scopes 6)
 :bootstrap (:default-cli-without-suite-option t :baseline 25 :mutants 4
             :selected-per-child 25 :actual-mutant-executed-in-catalog-order (4 14 25 1)
             :failure-kinds (:assertion :assertion :assertion :product-condition)
             :bounded-operation-records-available nil)
 :compilation (:child-processes 10 :asdf-source-files-per-child 335 :private-fasl-per-child 335
               :source-and-fasl-byte-sha-checked t :captured-child-log-bytes 0
               :warnings-or-style-warnings-observed 0 :note-lines-observed 0
               :warning-fatal-guard :frozen-driver-contract :no-fasl-loaded-by-auditor t)
 :self-tests (:preflight-classifier-cases 38 :bootstrap-classifier-cases 30)
 :cli-negative (:unknown-suite-exit 2 :duplicate-suite-exit 2 :new-campaign-directories nil
                :classification :usage-not-infrastructure)
 :audit-attempts
 ((:name :r1 :source "audit-at-R1.lisp.txt"
   :native "spikes/out/4000986168-command-74695-0/report.lisp" :status :failed
   :cause :auditor-destructive-sort-before-length :campaign-defect nil)
  (:name :r2 :source "audit-at-R2.lisp.txt"
   :native "spikes/out/4000986225-command-76301-0/report.lisp" :status :ok
   :limitation :bootstrap-executed-label-was-selected-count)
  (:name :r3 :source "audit-at-R3.lisp.txt"
   :native "spikes/out/4000986312-command-79161-0/report.lisp" :status :ok
   :selection-and-actual-execution-counts-separated t))
 :syntax-attempts-preserved t :first-syntax-tool-output-only :conversation
 :first-syntax-source-preserved "audit-before-syntax-repair-R1.lisp.txt"
 :unused-python-file (:executed nil :removed-before-audit t)
 :sha-utility :frozen-driver-python-c-string-only
 :campaigns-rerun-by-auditor 0 :tracked-edits-by-auditor 0
 :limits (:four-selected-mutations-each :not-mcdc :no-engine-qualification
          :no-requirement-promotion :non-atomic-two-pass-observation
          :cleanup-observed-in-recorded-contract :bootstrap-older-cooperative-process-contract))
