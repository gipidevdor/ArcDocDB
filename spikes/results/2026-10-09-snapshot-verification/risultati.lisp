(:schema-version 1 :kind :snapshot-verification-results :date "2026-10-11"
 :status :observed-local-success :tested-source-commit "aa4f46207923927924ea24504524f7932a02ae65"
 :preregistration (:artifact "metodo.lisp" :git-blob "d6e9d2d6b89bdffbf09a6c2b5e8518269e6b0a95"
                   :unchanged t :fixture-followup "correzione-fixture.lisp")
 :product-sources :unchanged-from-integrated-main
 :core (:artifact "core-finale.lisp" :status :ok :exit-code 0 :source-consistency :stable
        :tests 501 :snapshot-tests 43 :lifecycle-tests 28 :capture-tests 15 :smoke :passed
        :compilation-warnings :none :integrated-checks :passed :phase-zero-checks 10)
 :initial-core (:artifact "core-iniziale.lisp" :status :failed :exit-code 2
                :source-consistency :stable :reason :unused-registry-fixture-warning
                :original-status :preserved)
 :mutation (:artifact "mutazioni-finale.lisp" :command "mutazioni-finale-comando.lisp"
            :baseline-tests 43 :baseline-phase :complete :baseline-exit-code 0
            :targeted-mutants 10 :detected-runtime 10 :worker-errors 0
            :signals :none :timeouts :none :source-consistency :stable
            :independent-data-reviewer "/root/snapshot_final_tool")
 :negative-cli (:artifact "cli-negativa.lisp" :original-status :failed :exit-code 1
                :expected-diagnostic "tools/snapshot-mutation.lisp COD-61"
                :interpretation :expected-negative-fixture)
 :process-fixtures (:original-status :passed :entries 2 :expected-worker-errors 2
                    :signal-case (:signal 9 :exit-code 137 :result :worker-error)
                    :completion-case (:signal nil :exit-code 7 :result :worker-error)
                    :raw-logs-runners-and-saved-reports :preserved)
 :coverage (:artifact "copertura-finale-comando.lisp" :status :ok :exit-code 0
            :source-consistency :stable :expressions (:covered 784 :total 1084 :missing 300)
            :branches (:covered 88 :total 132 :missing 44)
            :reader-counters (:expressions-covered 31 :expressions-total 209
                              :branches-covered 0 :branches-total 28)
            :html-source-reconstruction :eight-files-byte-equal
            :independent-data-reviewer "/root/snapshot_final_review"
            :inline-limit :reader-counters-do-not-prove-unexecuted-api-paths)
 :reviews (:static "revisione.lisp"
           :corrected-lifecycle (:reviewer "/root/snapshot_final_review" :status :approved-static
                                 :git-blob "2cc481df77ba8d2353985d5a4fb94644fd0861e2"))
 :publication (:byte-audit "audit-copia.lisp" :raw-source-log-runner-and-fasl :preserved
               :coverage-state :lossless-gzip-never-evaluated)
 :ci (:status :pending-at-local-publication :required-revision :exact-pushed-head)
 :limits (:bounded-component-verification :partial-sb-cover-not-mcdc
          :no-c1-or-engine-or-phase-qualification :no-weak-memory-proof
          :no-allocation-or-latency-measurements :no-ebr-primary-index-get-integration
          :original-failed-and-auxiliary-results-not-promoted))
