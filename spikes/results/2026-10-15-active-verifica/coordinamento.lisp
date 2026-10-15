(:schema-version 1 :kind :agent-availability :client-date "2026-10-15"
 :status :parallel-workers-unavailable
 :agents
 ((:id "01a13e1d-50e3-7503-806b-0e10eda39740" :name "Archimedes" :scope :read-tests)
  (:id "01a13e1d-514d-7302-8f71-a8a1caf3f5b2" :name "Galileo" :scope :semantic-tests)
  (:id "01a13e1d-51e0-7a41-ab37-d24ec8ac1b0c" :name "Carver" :scope :native-publication-tests)
  (:id "01a13e1e-a714-74c1-9a72-b25bd89aa46e" :name "Lovelace" :scope :independent-review)
  (:id "01a13e1f-b6c9-7d50-b2de-9a81ad7f07df" :name "Turing" :scope :benchmark))
 :reported-failure :usage-limit
 :continuation :coordinator-read-and-repair-before-central-execution
 :independent-review-delivered nil
 :external-workload :not-controlled
 :other-sbcl-jobs-observed-during-repository-check t
 :limits (:availability-event-not-product-proof :partial-edits-reviewed-locally
          :no-independent-approval-inferred))
