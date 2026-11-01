(:schema-version 1 :kind :C4-runtime-followup-static-review :date "2026-11-01"
 :commit "0946338" :author-readings 2 :scope ("tools/snapshot-mutation.lisp" "tools/reader-mutation.lisp")
 :original-failure (:record "audit-269-v1" :command-exit 2 :child-exit 1 :child-signal nil
                    :diagnostic :runtime-core-mismatch-before-fixture-code)
 :change :current-absolute-runtime-path-instead-of-PATH-search
 :reason :preserve-parent-toolchain-and-matching-inherited-home
 :unchanged (:deadline :signal-and-exit-classification :source-copy :mutation-targets :product-code
             :product-tests :ASDF-system :counter-benchmark-driver)
 :planned-checks (:actual-SIGKILL-and-exit7-children-on-269-and-2610 :primary-PATH-still-selects-2610)
 :limits (:static-review-not-execution :no-new-product-campaign-inferred))
