(:schema-version 1 :kind :reader-integration-method :date "2026-10-11" :status :planned
 :registration :before-new-integrated-recorded-executions
 :prior-published-head "00ce55851e35cf01d62d5f1f1361460ba9e7c7d7"
 :prior-ci-run 38135803760 :prior-ci-status :success
 :integration-main "8101eb856cbe9d7540682babb53afb00fde30f70"
 :merged-source-commit "3ab184b8d77ab2e87d4bb2b3f7fa25844a354886"
 :integration-sources
 ((:file "arcdocdb.asd" :git-blob "950fad3368b2a742c510ec7572440ebcd337efbb")
  (:file "tools/foundation-coverage.lisp" :git-blob "6f6ddb7ada95c1031eb4d75a32806a79e4c97de9"))
 :reader-product-files 26 :reader-test-files 6 :reader-mutation-tool :unchanged
 :new-upstream (:hash-tests 28 :index-hash-tests 18)
 :expected-not-observed (:module-tests 770 :reader-tests 64)
 :review (:reviewer "/root/reader_upstream_review" :status :approved-static
          :asdf-suites-preserved (:snapshot :epochs :read :worker :cbor-write :hash :index)
          :coverage-scopes-preserved (:hash :key-hash :epochs :read :mvcc :index :cbor-write :cbor-minimal-scan))
 :planned-checks (:full-check-core :coverage-driver-self-test :ci-exact-updated-head
                  :merge-after-green-ci :main-ci-and-clean-local-update)
 :recording (:tool "tools/record-command.lisp" :source-document-index-freeze :required
             :source-consistency :stable-required :native-output-and-exit :preserved)
 :previous-functional-mutation-and-coverage-records :original-unchanged-scope
 :publication (:append-only-native-groups :leaf-catalog :original-bytes-and-statuses-preserved)
 :limits (:integration-only :no-mcdc :no-weak-memory-proof :no-engine-or-phase-qualification))
