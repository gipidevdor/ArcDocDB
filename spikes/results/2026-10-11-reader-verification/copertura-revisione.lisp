(:schema-version 1 :kind :reader-coverage-review :date "2026-10-11" :status :approved-partial
 :reviewer "/root/reader_tests_review" :read-mode :data-only :native-parent-artifacts
 ("copertura-epoche-comando.lisp" "copertura-lettura-comando.lisp")
 :native-parents (:status :ok :exit 0 :source-consistency :stable :before-after-equal t
                  :epochs-tests 34 :read-tests 30 :src-test-blobs-matched 16)
 :html (:detail-files 10 :all-annotated-lines-match-product t :index-counts-match-details t)
 :epochs (:expressions 651 :total-expressions 838 :branches 85 :total-branches 110
          :uncovered-expressions 187 :uncovered-branches 25
          :read-lisp (:expressions 0 :total-expressions 88 :branches 0 :total-branches 10))
 :read (:expressions 108 :total-expressions 306 :branches 11 :total-branches 52
        :uncovered-expressions 198 :uncovered-branches 41)
 :sb-cover-states (:entries-each 206 :vectors-coherent t :counts-match-html t
                   :epochs-sha256 "a9108f344f533fed8e4bc59a044bd8a6b4911385ace3426c95e066c33d063996"
                   :read-sha256 "504c04a30f58037fa02826e8012a05dd1e4d0877421849a90553fb9e33327e9b")
 :limits (:inline-counter-attribution :zero-counters-not-proof-api-unexecuted
          :no-mcdc :no-internal-interleaving-proof :no-load-or-state-restore))
