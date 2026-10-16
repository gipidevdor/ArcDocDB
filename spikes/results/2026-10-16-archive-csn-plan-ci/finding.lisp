(:schema-version 1 :kind :ci-finding :qualification nil :independent nil
 :run-id 38927332158 :job-id 117062112077
 :source-commit "71f814aaac0404233c68e88c1ada09f8ca1ed01e"
 :fix-commit "2bb4cbe428b522c9d6453d1547716d334cb3748c"
 :source "tests/codec/cbor-string-read-threads.lisp"
 :observed (:wave 0 :starts (27472605 27472605) :firsts (27472605 27472605)
            :finishes (27472605 27472605) :sinks (84649984 85010432) :overlap 0
            :tick-units-per-second 1000000)
 :failed-assertion (> finish start)
 :correction (:finish-not-before-start :overlap-nonnegative
              :no-new-test :no-local-test-execution :no-artificial-wait)
 :retained-checks (:rendezvous-after-first-checked-read :exact-results :exact-sinks
                   :fixed-call-count :readonly-source :bounded-wait-join-cleanup)
 :limits (:manual-reading-of-original-ci :not-a-decoder-or-csn-performance-result
          :no-csn-functional-qualification))
