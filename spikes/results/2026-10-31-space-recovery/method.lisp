(:schema-version 1 :kind :space-recovery-method :date "2026-10-31"
 :scope (:primary-checkout :local-disposable-spike-output :explicit-approved-report-list)
 :local-output
 (:minimum-age-seconds 7200 :terminal-record-required t :live-owner-pids-excluded t
  :custom-lisp-drivers-preserved t :active-docs-output-preserved t
  :archive :tar-zstd :compression-workers 4
  :before-unlink (:exact-archive-members :tar-stream-roundtrip :independent-extraction
                  :all-file-sha256 :original-size-inode-mtime-sha256-recheck :owner-pid-recheck)
  :raw-data-recovery :explicit-local-extraction)
 :published-reports
 (:reader :existing-compressed-evidence :compactor :existing-compact-many :workers 4
  :selection :independent-static-review :original-name-retained t
  :ci-payloads-preserved t :sealed-inventories-preserved t
  :verification (:every-original-byte-stream :all-nonselected-published-file-sha256
                 :existing-evidence-checker :existing-reader-controls))
 :preserved (:engine-source :tests :ci-tools :other-worktrees :git-history
             :published-metrics :benchmark-parameters :source-identities :failed-results)
 :provenance (:source-id-changes-when-retention-representation-changes
              :concurrent-editorial-work-may-change-global-source-snapshot
              :not-an-engine-test-or-benchmark :no-new-performance-claim)
 :limitations (:local-output-archive-not-pushed :no-power-loss-durability-qualification
               :empty-directory-metadata-not-retained-in-local-output-archive))
