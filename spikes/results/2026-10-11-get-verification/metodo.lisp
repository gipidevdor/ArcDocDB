(:schema-version 1 :kind :get-functional-verification-method :date "2026-10-11" :status :planned
 :registration :before-test-executions
 :base-commit "65972a4e6e84bd4c31d1d654c9a9a29bf6c44eb0"
 :product-scope ("src/get/package.lisp" "src/get/types.lisp" "src/get/build.lisp"
                 "src/get/lifecycle.lisp" "src/get/lookup.lisp" "src/get/target.lisp" "src/get/segment.lisp")
 :planned-change :first-functional-get-suite-and-ordinary-test-integration
 :product-change-policy :only-for-a-reproduced-reviewed-defect
 :decision-witnesses
 ((:id "GET-D01" :scope (:configuration-boundaries :payload-budget :identity-copy))
  (:id "GET-D02" :scope (:archive-owner :nested-call :private-alias :faulted-context :cleanup))
  (:id "GET-D03" :scope (:current-absence :snapshot-history :csn-boundaries :final-expiry))
  (:id "GET-D04" :scope (:real-file-header :segment-owner-id :committed-prefix :format :flags))
  (:id "GET-D05" :scope (:no-record-io-for-small-buffer :no-io-cache-probe :prepared-proof-required))
  (:id "GET-D06" :scope (:mandatory-proof :range :overlap :unexpected-proof))
  (:id "GET-D07" :scope (:outcome-crc-type-csn :put-txid :persistent-corruption))
  (:id "GET-D08" :scope (:cache-disabled :miss-insert-hit :corrupt-copy-fallback :prepared-hit-proof))
  (:id "GET-D09" :scope (:private-value-copy :output-range-alias :final-snapshot-check :error-unwind)))
 :oracles (:known-key-and-value-bytes :explicit-csn-and-time
           :public-return-values-and-state :epoch-active-observation
           :condition-type-and-reason :real-readonly-files
           :private-state-changes-only-for-labelled-fault-injection)
 :execution (:record-tool "tools/record-command.lisp" :freeze-before-recorded-runs t
             :source-document-index-stability :required :native-failures :preserve
             :planned-checks (:full-check-core :targeted-get-suite :partial-sb-cover
                              :publication-trace-links-evidence :exact-published-head-ci))
 :review (:independent-reviewer "/root/reader_upstream_review" :two-readings :required)
 :publication (:native-records-as-data :read-eval-disabled :original-bytes-and-statuses
               :leaf-catalog :bounded-files :full-raw-groups)
 :limits (:first-functional-suite :partial-decision-witnesses :no-mcdc-qualification
          :no-full-c1-qualification :no-historical-resolver :no-server-endpoint
          :no-weak-memory-proof :no-zero-allocation-or-performance-claim
          :no-crash-recovery-or-phase-closure))
