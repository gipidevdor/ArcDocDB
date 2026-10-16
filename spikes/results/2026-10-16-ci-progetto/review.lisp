(:schema-version 1 :kind :static-review-summary :date "2026-10-16"
 :author :coordinator :verbatim-agent-transcript nil
 :reviewers ((:name "Arendt" :agent "01a145de-e0b5-77b0-8beb-0eecf27446ad"
              :scope (:metrics :denominators :coverage :evidence-boundaries))
             (:name "Planck" :agent "01a145de-e052-7731-9ccf-8cbf94e8eac0"
              :scope (:publication :reconciliation :version-identity :budgets)))
 :findings ((:id 1 :topic :unknown-versus-zero-denominator :resolution :explicit-incomplete)
            (:id 2 :topic :missing-terminal-test-event :resolution :external-observation-not-invented-result)
            (:id 3 :topic :hash-versus-numeric-validity :resolution :separate-claims)
            (:id 4 :topic :recovered-payloads-after-missing :resolution :new-immutable-collection)
            (:id 5 :topic :publication-parent-in-packet-identity :resolution :external-receipt)
            (:id 6 :topic :run-attempt-and-retention-margin :resolution :attempt-cursor-and-retention-margin)
            (:id 7 :topic :aggregate-expansion-limit :resolution :bounded-total-expansion))
 :writes-by-reviewers nil :runtime-executions-by-reviewers nil
 :correction-review :coordinator :implementation-qualified nil)
