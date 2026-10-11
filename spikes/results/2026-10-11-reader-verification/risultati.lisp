(:schema-version 1 :kind :reader-verification-results :date "2026-10-11" :status :local-passed
 :method "metodo.lisp" :correction "rettifica.lisp" :freeze-commit "9d07fffc5ee51a92ebcf5c6d753ba72a3771535a"
 :product-changes :none :integration-main "2a0011f9d2bef104b22f7ad1eb86d7e5d60d5e11"
 :full-check (:artifact "verifica-completa.lisp" :status :ok :native-exit 0 :source-consistency :stable
              :module-tests 724 :smoke :passed :epochs-tests 34 :reader-tests 30)
 :targeted-mutations (:artifact "mutazioni.lisp" :status :ok :source-consistency :stable
                     :baseline-tests 64 :baseline-phase :complete :baseline-exit 0
                     :nominated-target-detections 8 :native-target-exit 1
                     :signals 0 :timeouts 0 :worker-errors 0)
 :process-fixtures (:campaigns 4 :classification :worker-error
                    :real-sigkill :signal-9-native-exit-137 :real-post-complete-exit 7
                    :runner-report-and-logs :preserved)
 :negative-cli (:artifact "cli-negativo.lisp" :status :failed :native-exit 1
                :expected-refusal :cod-61 :option "--invalid")
 :initial-failures (:status :failed :cause :fixture-unmatched-close-parenthesis
                    :full-check-exit 2 :mutation-and-coverage-parent-exit 1
                    :mutation-baseline-exit 2 :baseline-result :worker-error
                    :file-looking-path :accepted-directory-not-negative-cli
                    :native-statuses-and-source-consistency :preserved)
 :coverage (:scopes ("epochs" "read")
            :epochs (:expressions 651 :total-expressions 838 :branches 85 :total-branches 110)
            :read (:expressions 108 :total-expressions 306 :branches 11 :total-branches 52) :native-command-status :ok :source-consistency :stable
            :state-html-and-fasl :preserved :measure :expressions-and-branches
            :inline-attribution-limit :explicit :mcdc :not-measured)
 :publication (:catalog "catalogo.lisp" :audit "audit-copia.lisp"
               :native-bytes-and-payload-names :unchanged :generated-references :explicit)
 :ci-at-local-publication :pending
 :limits (:partial-decision-witnesses :no-engine-or-phase-qualification :no-c1-qualification
          :no-mcdc :no-internal-inline-window-proof :no-weak-memory-proof
          :no-zero-allocation-or-latency-claim :no-get-durability-or-crash-recovery-integration))
