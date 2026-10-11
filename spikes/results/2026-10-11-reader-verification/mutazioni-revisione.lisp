(:schema-version 1 :kind :reader-native-mutation-review :date "2026-10-11" :status :approved-local
 :reviewer "/root/reader_tool_review" :read-mode :data-only
 :final (:baseline-tests 64 :ordered-names-match-method t :phase :complete :exit 0
         :targeted-detections 8 :target-native-exit 1 :phase :tests :failure-kind :runtime
         :signals 0 :timeouts 0 :worker-errors 0 :md5-source-fingerprints 34
         :before-after-and-current-source-match t :parent-source-blobs 602 :parent-source-consistency :stable)
 :process-fixtures (:reports 4 :status :passed :worker-errors-each 2
                    :signal 9 :observed-exit 137 :post-complete-exit 7 :child-logs-match-report t)
 :negative-cli (:status :failed :native-exit 1 :diagnostic :cod-61 :baseline nil :mutants nil)
 :initial (:directories ("reader-mutazioni" "reader-forbidden-file.lisp")
           :baseline-phase :compile-tests :baseline-result :worker-error :baseline-exit 2
           :parent-status :failed :parent-exit 1 :source-consistency :stable :mutants nil)
 :correction-provenance ("rettifica.lisp" "revisione-rettifica.lisp")
 :limits (:local-native-audit-only :no-c1-mcdc-or-engine-qualification :selected-targets-only))
