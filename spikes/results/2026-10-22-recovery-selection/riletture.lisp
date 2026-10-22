(:schema-version 1 :kind :author-review
 :source-commit "b75e1cb094a33bb6ab49a996bb69e802e7ba5b78"
 :readings
 ((:pass 1 :scope :selection-and-authority
   :observations (:adr0042-maximum-csn :same-segment-later-absolute-offset
                  :tombstone-kept-until-complete-key :no-segment-id-order
                  :prepared-csn-explicit :txid-not-csn :nil-distinct-from-zero
                  :full-u64-csn-and-id :exact-key-comparison :explicit-format-and-full-crc
                  :same-series-group-precondition :canonical-committed-prefix-precondition
                  :no-body-equality-inference-from-crc :ambiguity-blocks-output)
   :dedicated-functional-qualification nil)
  (:pass 2 :scope :workspace-and-faults
   :observations (:payload-before-arrays :two-seven-u64-tuples :one-private-key-buffer
                  :no-array-per-candidate-or-reset :buffer-not-retained
                  :candidate-validation-before-winner-change :physical-offset-not-buffer-index
                  :incomplete-reset-or-adoption-faults-selector :codec-invariant-preserves-cause
                  :faulted-never-reopened :same-csn-does-not-clear-ambiguity
                  :greater-csn-dominates-ambiguous-group :no-io-or-index-publication
                  :no-cross-series-lock-or-shared-write)
   :dedicated-functional-qualification nil))
 :open (:svr-d01-through-d10 :permutation-properties :functional-qualification :fault-injection
        :mcdc :coverage :independent-review :allocation-gc-and-performance-measurements
        :key-grouping :complete-replay :index-materialization :general-cod24-boundary :admission)
 :limits (:two-author-readings-not-independent-review :static-checks-not-functional-tests
          :not-complete-c1-qualification :no-release-gate-inference))
