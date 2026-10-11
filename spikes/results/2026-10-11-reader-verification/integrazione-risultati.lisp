(:schema-version 1 :kind :reader-integration-results :date "2026-10-11" :status :local-passed
 :method "integrazione-metodo.lisp" :freeze-commit "fec47fa63a9dac0bb4e8844c1245bc8e17b373fb"
 :integration-main "8101eb856cbe9d7540682babb53afb00fde30f70"
 :full-check (:artifact "integrazione-core.lisp" :status :ok :native-exit 0
              :source-consistency :stable :source-blobs 621
              :module-tests 770 :smoke-checks 2 :epochs-tests 34 :reader-tests 30)
 :coverage-driver-self-test (:artifact "integrazione-copertura-comando.lisp"
                             :status :ok :native-exit 0 :source-consistency :stable)
 :process-fixtures ((:artifact "integrazione-reader-fixture.lisp" :status :passed :worker-errors 2)
                    (:artifact "integrazione-snapshot-fixture.lisp" :status :passed :worker-errors 2))
 :fixture-observations (:sigkill :signal-9-exit-137 :post-complete-exit 7
                       :classification :worker-error :native-records-and-logs :preserved)
 :experiments (:artifact "integrazione-esperimenti-report.lisp" :status :complete
               :runs 10 :native-exit-codes :all-zero :source-consistency :all-stable
               :native-statuses (:spk-07 :pass :other-nine :ok))
 :independent-audit (:reviewer "/root/reader_tool_review" :status :passed
                     :native-data :read-with-eval-disabled :no-record-load)
 :previous-reader-method-coverage-and-mutations :unchanged-original-scope
 :prior-published-ci (:head "00ce55851e35cf01d62d5f1f1361460ba9e7c7d7"
                      :run 38135803760 :status :success)
 :new-ci-at-local-publication :pending
 :limits (:integration-only :no-get-functional-qualification :no-mcdc
          :no-weak-memory-proof :no-engine-or-phase-qualification))
