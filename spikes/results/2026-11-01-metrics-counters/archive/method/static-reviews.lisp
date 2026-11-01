(:schema-version 1 :kind :metrics-counter-static-reviews :date "2026-11-01"
 :status :completed-before-execution :agents-closed t
 :main-author-readings 2
 :main-scope (:owner-local-event-admission :bounded-integer-arithmetic
              :private-child-histograms :snapshot-storage-independence :window-identity
              :guarded-read-only-preconditions :fault-marker-last :queue-recovery
              :source-provenance :hierarchical-overlap :cold-exact-rates)
 :delegated-authors
 ((:agent "01a19724-a21b-7422-968c-89c3677072cd" :scope :histogram-merge
   :readings 2 :declared-tests 16 :executions 0)
  (:agent "01a19728-fe28-79d0-a294-223320cc3402" :scope :counter-tests
   :readings 2 :declared-tests 32 :executions 0)
  (:agent "01a19729-6739-76b2-924c-16d2d913f7cf" :scope :counter-C4-driver-and-method
   :readings 2 :scenarios 8 :executions 0))
 :independent-review
 (:agent "01a19724-a2c3-7442-bd94-3e9a10969e3d" :executions 0
  :finding :mutable-window-preconditions-before-owner-scope
  :resolution :guarded-pure-prelude-before-mutation-marker
  :followup :resolved-by-static-inspection
  :original-records-preserved t)
 :static-decisions
 (:capture-identity-reader-namespaces-disjoint :defer-default-allocation-until-validation
  :strictly-increasing-reset-start :sticky-event-family-rejection
  :normal-reset-preserves-queue-samples :fault-reset-forgets-queue-samples
  :unknown-queue-sums-not-fabricated :summed-peaks-are-upper-bounds
  :counter-completeness-does-not-certify-producer-coverage)
 :limits (:static-review-not-execution-evidence :allocation-and-cost-pending
          :no-global-atomic-cut-promise :no-runtime-instrumentation-or-REQ-OBS-closure))
