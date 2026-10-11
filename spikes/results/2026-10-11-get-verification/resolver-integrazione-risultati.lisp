(:schema-version 1 :kind :get-resolver-integration-verification-results :date "2026-10-11" :status :passed-in-scope
 :freeze "5d6490a4f056a33bdf77d71d329f2aba6e0ea36f" :incoming-main "d155db3f977677fa95280f59c23fbe46a5e116d2"
 :source-files 667 :source-consistency :stable :source-before-after-equal t
 :get-seven-product-and-three-test-files-unchanged :checked
 :checks (:build-test-lint-trace-links "resolver-integration-checks-report.lisp"
          :module-tests 887 :smoke-checks 2 :get-tests 70
          :get-coverage "resolver-integration-coverage-process-report.lisp")
 :coverage (:expressions (926 1055) :branches (103 134) :same-get-file-counts-as-earlier-freezes :checked
            :state-kept-separately :gzip-lossless)
 :earlier-runs :preserved-including-full-check-core
 :ci-policy :full-make-check-on-published-head
 :scope :loading-and-get-suite-integration :limits (:no-functional-resolver-qualification :partial-get-coverage :no-phase-closure))
