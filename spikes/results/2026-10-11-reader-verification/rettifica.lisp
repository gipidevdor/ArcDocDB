(:schema-version 1 :kind :reader-verification-correction :date "2026-10-11"
 :status :planned :registration :before-repeated-recorded-executions
 :original-method "metodo.lisp" :original-freeze-commit "bf39dc6e178119e3a1870a063ed42cda3b38012c"
 :observed-failure :unmatched-close-parenthesis-in-epochs-thread-fixture
 :product-changes :none :case-names-count-and-mutant-targets :unchanged
 :correction (:file "tests/epochs/threads.lisp" :old-git-blob "b772a3893467eaf1990ed47cc37e208cc573c3db"
              :git-blob "a7e34763661de9edd8bd049c817ba961cc1d3104" :change :remove-one-extra-closing-parenthesis)
 :previous-native-records :preserved-with-original-status
 :previous-baseline :worker-error-compilation-not-detection
 :negative-cli-correction (:invalid-option "--invalid" :expected :cod-61
                          :previous-file-looking-path :accepted-as-directory
                          :previous-failure :baseline-compilation-not-cli-validation)
 :repeated-verifications (:integrated-core :targeted-mutations :epochs-and-read-coverage
                          :coverage-self-test :negative-cli)
 :limits (:no-result-promotion :same-partial-scope-as-original-method))
