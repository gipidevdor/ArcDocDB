(:schema-version 1 :kind :get-functional-verification-results :date "2026-10-11" :status :passed
 :scope :first-functional-suite :get-product-changes nil
 :first (:freeze "f1bd3cd98cba9cadc545764437566414cf9613b4" :source-files 633 :source-consistency :stable
         :core "prima-core-report.lisp" :module-tests 840 :smoke-checks 2 :get-tests 70
         :get-coverage "prima-coverage-process-report.lisp" :coverage-selftest "prima-coverage-selftest-process-report.lisp")
 :integrated (:freeze "222b9fdbadf89253ca99d114662a51fba481839b" :main "0d0ec4bf4d0d5aae6d6692bbe109af2166b44731"
              :source-files 659 :source-consistency :stable :get-product-and-tests-identical-to-first :checked
              :core "integrata-core-report.lisp" :module-tests 887 :smoke-checks 2 :get-tests 70
              :get-coverage "integrata-coverage-process-report.lisp" :coverage-selftest "integrata-coverage-selftest-process-report.lisp")
 :coverage (:tool :sb-cover :scope :get :first-and-integrated-file-counts-equal t
            :expressions-covered 926 :expressions-total 1055 :branches-covered 103 :branches-total 134
            :rows ((:file "build.lisp" :expressions (124 147) :branches (14 20))
                   (:file "lifecycle.lisp" :expressions (181 195) :branches (18 20))
                   (:file "lookup.lisp" :expressions (127 140) :branches (25 26))
                   (:file "package.lisp" :expressions (0 1) :branches (0 0))
                   (:file "segment.lisp" :expressions (293 312) :branches (19 24))
                   (:file "target.lisp" :expressions (190 205) :branches (27 30))
                   (:file "types.lisp" :expressions (11 55) :branches (0 14)))
            :html-state-agreement :checked-as-data :state-storage :gzip-lossless
            :first-state (:bytes 1627470 :sha256 "a6a350b52c34a148f63444c11c91bed16688e966a953ebe7c5448296e49e25ac")
            :integrated-state (:bytes 1725561 :sha256 "0eaaa5f07bea425fc556d6397eba6cc6387b2e9ec95e8d6d3b23e33ab3b97c84")
            :denominator-policy :include-package-and-types-without-reattribution)
 :runner-selftests (:reader :passed :snapshot :passed :expected-worker-errors-per-fixture 2
                    :signal 9 :signal-exit 137 :completion-exit 7 :original-statuses-preserved t)
 :publication (:all-native-runs-retained :original-native-bytes-and-statuses :leaf-catalog :full-raw-groups
               :records-read-only-as-data :read-eval-disabled)
 :ci-policy :verify-exact-published-head-after-push
 :limits (:serial-functional-witnesses :partial-coverage :inline-admission-nil-unwitnessed
          :index-retry-and-retry-finish-unwitnessed :some-internal-guards-unwitnessed
          :cache-busy-bypass-unavailable-unwitnessed :no-concurrent-get-stress :no-mcdc-or-full-c1
          :no-zero-heap-or-performance-proof :no-historical-resolver-or-server-or-phase-closure))
