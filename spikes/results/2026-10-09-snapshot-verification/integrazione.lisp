(:schema-version 1 :kind :snapshot-upstream-integration :date "2026-10-11"
 :upstream-commit "f16e978ad026e9307fde67425c35b2a8dbd1e731"
 :tested-source-commit "ac52376cb7f069722efbb46bfb06a8cb9ee86026"
 :previous-results (:artifact "risultati.lisp" :tests 501 :unchanged t)
 :core (:artifact "core-integrazione.lisp" :status :ok :exit-code 0
        :source-consistency :stable :tests 620 :smoke :passed
        :snapshot-tests 43 :index-slot-tests 64 :index-primary-tests 55
        :compilation-warnings :none :integrated-checks :passed)
 :spikes (:native-directory "raw/spikes-integrazione/" :checks 10 :original-bytes-and-payload-names t)
 :coverage-driver-selftest (:artifact "copertura-integrazione-selftest.lisp"
                            :status :ok :exit-code 0 :source-consistency :stable)
 :merge (:asdf-suites (:mvcc :index-slots :index-primary)
         :coverage-scopes (:mvcc :index)
         :independent-static-reviewer "/root/snapshot_final_review"
         :asdf-git-blob "f1b5809184ecb88a821ac7b197a68ec2d1243dc7"
         :coverage-git-blob "ddf279afd0879e455ad3c864889cec0c9aadf8ff"
         :snapshot-csn-and-tests-byte-equal-to "aa4f46207923927924ea24504524f7932a02ae65")
 :ci (:status :pending-at-local-publication :required-revision :exact-pushed-head)
 :limits (:previous-native-results-preserved :no-broader-qualification))
