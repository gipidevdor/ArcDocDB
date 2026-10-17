(:schema-version 1 :kind :author-review :source-commit "873e4ca9608984c04722b46e5e831ca0f8897794"
 :readings
 ((:pass 1 :scope :authority-and-identity
   :observations (:exact-source-capability :active-id-and-attested-eof :closed-id-and-authoritative-prefix
                  :open-control :full-u64-closed-id :enoent-operation-and-errno
                  :single-name-and-device-inode :reject-both-names-including-hardlinks
                  :no-follow :no-backend-fallback :exclusive-namespace-precondition)
   :dedicated-functional-qualification nil)
  (:pass 2 :scope :durability-and-lifetime
   :observations (:edit-remains-decision :rename-completion :parent-fsync-in-both-branches
                  :postcondition-before-fsync :unwind-directory-fault :preserve-primary-cause
                  :no-close-retry-truncation :source-form-remains-acquisition-observation
                  :io-only-interrupt-guard :bounded-name-copies :cold-path-only :no-cross-series-lock)
   :dedicated-functional-qualification nil))
 :open (:snr-d01-through-d09 :fault-injection :mcdc :coverage :independent-review
        :allocation-and-performance-measurement :general-cod24-boundary :complete-reconciliation
        :indexes-and-admission)
 :limits (:two-author-readings-not-independent-review :static-checks-not-functional-tests
          :not-complete-c1-qualification :no-release-gate-inference))
