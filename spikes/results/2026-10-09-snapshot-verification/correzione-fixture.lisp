(:schema-version 1 :kind :snapshot-fixture-correction :date "2026-10-11"
 :registration :before-corrected-recorded-runs :status :planned
 :original-preregistration "metodo.lisp" :original-method-unchanged t
 :observed-attempt (:command-record "4000702612-command-37397-0/report.lisp"
                    :status :failed :exit-code 2 :source-consistency :stable
                    :diagnostic :cod-01-unused-registry-in-lifecycle-test)
 :correction (:file "tests/mvcc/lifecycle.lisp"
              :before-git-blob "4e9a15f206e6374cc359b88adfc48f3983b4dd09"
              :after-git-blob "2cc481df77ba8d2353985d5a4fb94644fd0861e2"
              :change :assert-public-context-registry-identity
              :test-count-and-product-sources :unchanged)
 :planned-reruns (:make-check-core :mutation-baseline-and-ten-mutants :partial-mvcc-coverage)
 :preservation (:original-failed-build :required :original-successful-runs :required
                :failed-is-not-promoted-to-success)
 :limits (:fixture-warning-correction :no-product-fix :no-engine-qualification))
