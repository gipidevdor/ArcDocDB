(:schema-version 1 :kind :get-cache-integration-verification-results :date "2026-10-11" :status :passed-in-local-scope
 :freeze "b2a847e0a5039c60f786c6b06bc3741088d56bea" :incoming-main "6eeb501d2eace49fad8e2ec333ed0c6c1386dd6c"
 :source-files 677 :source-consistency :stable :source-before-after-equal t
 :get-seven-product-and-three-test-files-unchanged :checked
 :changed-product-dependency "src/cache/read.lisp"
 :checks (:get-coverage "cache-integration-coverage-process-report.lisp" :get-tests 70
          :coverage-self-test "cache-integration-selftest-process-report.lisp")
 :coverage (:expressions (926 1055) :branches (103 134) :same-get-file-counts-as-earlier-freezes :checked
            :state-kept-separately :gzip-lossless :scope-seven-get-files-only t)
 :upstream-suite (:get-performance-tests 19 :distinct-from-get-functional-70 t)
 :ci-policy (:full-make-check-on-published-head :expected-module-tests 906 :expected-smoke-checks 2)
 :earlier-runs :preserved :scope :changed-cache-dependency-and-suite-integration
 :limits (:partial-get-coverage :no-new-performance-claim :no-phase-closure))
