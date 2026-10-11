(:SCHEMA-VERSION 1 :KIND :WORKER-SERIES-SELFTEST-BUNDLE :VERSION
 "reader-and-snapshot-intentional-errors" :SOURCES
 ((:PATH
   #A((185) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-reader-self-test-34452-0/completion-exit/isolated-build.lisp")
   :BYTES 197 :SHA256 "1a45dcf8a6d03f1e8866e49280c6f0edb894320c90624d5620fad1e3d546cea9" :GIT-BLOB
   "72b3cc890be69c720e4f98592d6e237bb50a1e29" :TEXT "(REQUIRE :SB-POSIX)
(WRITE
 '(:SCHEMA-VERSION 1 :KIND :READER-MUTATION-CHILD :STATUS :OK :PHASE :COMPLETE
   :PASSED-TESTS (\"fixture\"))
 :READABLY T)
(TERPRI)
(FINISH-OUTPUT)
(SB-EXT:EXIT :CODE 7)
")
  (:PATH
   #A((176) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-reader-self-test-34452-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" :GIT-BLOB
   "e69de29bb2d1d6434b8b29ae775ad8c2e48c5391" :TEXT "")
  (:PATH
   #A((176) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-reader-self-test-34452-0/completion-exit/stdout.log")
   :BYTES 105 :SHA256 "5e630c1b44d68ce71b27d151e76bf367e3cbd941200adc36cdd30e0fe7390531" :GIT-BLOB
   "04618f62c3cb225b630d9b552ab061481426bbc0" :TEXT
   "(:SCHEMA-VERSION 1 :KIND :READER-MUTATION-CHILD :STATUS :OK :PHASE :COMPLETE
 :PASSED-TESTS (\"fixture\"))
")
  (:PATH
   #A((161) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-reader-self-test-34452-0/report.lisp")
   :BYTES 2225 :SHA256 "d0550e0096435fb6ac84e48c40bb25b101093839ea1ecaefedbb88c3111b8433" :GIT-BLOB
   "7474eba347e8f4427cae7748a65c8536e93bf0af" :TEXT
   "(:SCHEMA-VERSION 1 :KIND :READER-PROCESS-SELF-TEST :STATUS :PASSED
 :WORKER-ERRORS 2 :BASELINE NIL :MUTANTS
 ((:NAME :SIGNAL :RESULT :WORKER-ERROR :EXECUTION
   (:EXIT-CODE 137 :SIGNAL 9 :TIMED-OUT NIL :ARGV
    (\"sbcl\" \"--noinform\" \"--no-userinit\" \"--no-sysinit\" \"--disable-debugger\"
     \"--script\" \"isolated-build.lisp\")
    :RUNNER
    #A((184) BASE-CHAR
       . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-reader-self-test-34452-0/signal/isolated-build.lisp\")
    :STDOUT-LOG
    #A((175) BASE-CHAR
       . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-reader-self-test-34452-0/signal/stdout.log\")
    :STDERR-LOG
    #A((175) BASE-CHAR
       . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-reader-self-test-34452-0/signal/stderr.log\")
    :REPORT
    (:SCHEMA-VERSION 1 :KIND :READER-MUTATION-CHILD :STATUS :FAILED :PHASE
     :TESTS :FAILURE-KIND :RUNTIME :FAILED-TEST \"fixture\")))
  (:NAME :COMPLETION-EXIT :RESULT :WORKER-ERROR :EXECUTION
   (:EXIT-CODE 7 :SIGNAL NIL :TIMED-OUT NIL :ARGV
    (\"sbcl\" \"--noinform\" \"--no-userinit\" \"--no-sysinit\" \"--disable-debugger\"
     \"--script\" \"isolated-build.lisp\")
    :RUNNER
    #A((193) BASE-CHAR
       . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-reader-self-test-34452-0/completion-exit/isolated-build.lisp\")
    :STDOUT-LOG
    #A((184) BASE-CHAR
       . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-reader-self-test-34452-0/completion-exit/stdout.log\")
    :STDERR-LOG
    #A((184) BASE-CHAR
       . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-reader-self-test-34452-0/completion-exit/stderr.log\")
    :REPORT
    (:SCHEMA-VERSION 1 :KIND :READER-MUTATION-CHILD :STATUS :OK :PHASE
     :COMPLETE :PASSED-TESTS (\"fixture\"))))))
")
  (:PATH
   #A((176) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-reader-self-test-34452-0/signal/isolated-build.lisp")
   :BYTES 247 :SHA256 "ff5cf55dda241d32ea1b4308172c7dc526436cbf1d546e7471148cee95a873d1" :GIT-BLOB
   "0ec6dc7b415294e152a15c5f2bb1d141b3593981" :TEXT "(REQUIRE :SB-POSIX)
(WRITE
 '(:SCHEMA-VERSION 1 :KIND :READER-MUTATION-CHILD :STATUS :FAILED :PHASE :TESTS
   :FAILURE-KIND :RUNTIME :FAILED-TEST \"fixture\")
 :READABLY T)
(TERPRI)
(FINISH-OUTPUT)
(SB-POSIX:KILL (SB-POSIX:GETPID) SB-POSIX:SIGKILL)
")
  (:PATH
   #A((167) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-reader-self-test-34452-0/signal/stderr.log")
   :BYTES 0 :SHA256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" :GIT-BLOB
   "e69de29bb2d1d6434b8b29ae775ad8c2e48c5391" :TEXT "")
  (:PATH
   #A((167) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-reader-self-test-34452-0/signal/stdout.log")
   :BYTES 126 :SHA256 "3697c68fa71f124c8d05d8cc5d649a744586a10989eb2e67c5bdce6bfc760142" :GIT-BLOB
   "79dfb4ff7f35ea5571afe1d2b6d399d777043329" :TEXT
   "(:SCHEMA-VERSION 1 :KIND :READER-MUTATION-CHILD :STATUS :FAILED :PHASE :TESTS
 :FAILURE-KIND :RUNTIME :FAILED-TEST \"fixture\")
")
  (:PATH
   #A((187) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-snapshot-self-test-34443-0/completion-exit/isolated-build.lisp")
   :BYTES 199 :SHA256 "b8bb4416a818775bae5c77341eeec2c356a2733f633ac2bc8b6ac3ff955d05e0" :GIT-BLOB
   "9e5994f53cd28cbe4a4cd6f5b1b32858bc06ed75" :TEXT "(REQUIRE :SB-POSIX)
(WRITE
 '(:SCHEMA-VERSION 1 :KIND :SNAPSHOT-MUTATION-CHILD :STATUS :OK :PHASE
   :COMPLETE :PASSED-TESTS (\"fixture\"))
 :READABLY T)
(TERPRI)
(FINISH-OUTPUT)
(SB-EXT:EXIT :CODE 7)
")
  (:PATH
   #A((178) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-snapshot-self-test-34443-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" :GIT-BLOB
   "e69de29bb2d1d6434b8b29ae775ad8c2e48c5391" :TEXT "")
  (:PATH
   #A((178) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-snapshot-self-test-34443-0/completion-exit/stdout.log")
   :BYTES 107 :SHA256 "4f22544421d9012fe132a36bf15950cd327ca959b8f9c5ef3d386e0c8b62a25c" :GIT-BLOB
   "957772db5029a5b016fb82fdf8735fb36cd15719" :TEXT
   "(:SCHEMA-VERSION 1 :KIND :SNAPSHOT-MUTATION-CHILD :STATUS :OK :PHASE :COMPLETE
 :PASSED-TESTS (\"fixture\"))
")
  (:PATH
   #A((163) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-snapshot-self-test-34443-0/report.lisp")
   :BYTES 2243 :SHA256 "7629b6c8253c8deb81c2813bee784f222748e8c585231329428f154181d39bca" :GIT-BLOB
   "c22ad09ebf9d982070f13ee88413f789d3a38424" :TEXT
   "(:SCHEMA-VERSION 1 :KIND :SNAPSHOT-PROCESS-SELF-TEST :STATUS :PASSED
 :WORKER-ERRORS 2 :BASELINE NIL :MUTANTS
 ((:NAME :SIGNAL :RESULT :WORKER-ERROR :EXECUTION
   (:EXIT-CODE 137 :SIGNAL 9 :TIMED-OUT NIL :ARGV
    (\"sbcl\" \"--noinform\" \"--no-userinit\" \"--no-sysinit\" \"--disable-debugger\"
     \"--script\" \"isolated-build.lisp\")
    :RUNNER
    #A((186) BASE-CHAR
       . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-snapshot-self-test-34443-0/signal/isolated-build.lisp\")
    :STDOUT-LOG
    #A((177) BASE-CHAR
       . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-snapshot-self-test-34443-0/signal/stdout.log\")
    :STDERR-LOG
    #A((177) BASE-CHAR
       . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-snapshot-self-test-34443-0/signal/stderr.log\")
    :REPORT
    (:SCHEMA-VERSION 1 :KIND :SNAPSHOT-MUTATION-CHILD :STATUS :FAILED :PHASE
     :TESTS :FAILURE-KIND :RUNTIME :FAILED-TEST \"fixture\")))
  (:NAME :COMPLETION-EXIT :RESULT :WORKER-ERROR :EXECUTION
   (:EXIT-CODE 7 :SIGNAL NIL :TIMED-OUT NIL :ARGV
    (\"sbcl\" \"--noinform\" \"--no-userinit\" \"--no-sysinit\" \"--disable-debugger\"
     \"--script\" \"isolated-build.lisp\")
    :RUNNER
    #A((195) BASE-CHAR
       . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-snapshot-self-test-34443-0/completion-exit/isolated-build.lisp\")
    :STDOUT-LOG
    #A((186) BASE-CHAR
       . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-snapshot-self-test-34443-0/completion-exit/stdout.log\")
    :STDERR-LOG
    #A((186) BASE-CHAR
       . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-snapshot-self-test-34443-0/completion-exit/stderr.log\")
    :REPORT
    (:SCHEMA-VERSION 1 :KIND :SNAPSHOT-MUTATION-CHILD :STATUS :OK :PHASE
     :COMPLETE :PASSED-TESTS (\"fixture\"))))))
")
  (:PATH
   #A((178) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-snapshot-self-test-34443-0/signal/isolated-build.lisp")
   :BYTES 249 :SHA256 "a345276e3dfe377c0bbd359793165915b1527938a65250d367ce5ac079feecc1" :GIT-BLOB
   "76f2aad7c9484f9bb0d51338b5d22d8ad3b8a579" :TEXT "(REQUIRE :SB-POSIX)
(WRITE
 '(:SCHEMA-VERSION 1 :KIND :SNAPSHOT-MUTATION-CHILD :STATUS :FAILED :PHASE
   :TESTS :FAILURE-KIND :RUNTIME :FAILED-TEST \"fixture\")
 :READABLY T)
(TERPRI)
(FINISH-OUTPUT)
(SB-POSIX:KILL (SB-POSIX:GETPID) SB-POSIX:SIGKILL)
")
  (:PATH
   #A((169) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-snapshot-self-test-34443-0/signal/stderr.log")
   :BYTES 0 :SHA256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" :GIT-BLOB
   "e69de29bb2d1d6434b8b29ae775ad8c2e48c5391" :TEXT "")
  (:PATH
   #A((169) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-reader-final-7yre4h28/ArcDocDB/spikes/out/4000710268-snapshot-self-test-34443-0/signal/stdout.log")
   :BYTES 128 :SHA256 "e3502e714a0530acb1f0130c4ced4a016607bcb067e3686f6f29704db8423ea5" :GIT-BLOB
   "36a989feae9ea9229cd01e7db6aefd42183a2aaa" :TEXT
   "(:SCHEMA-VERSION 1 :KIND :SNAPSHOT-MUTATION-CHILD :STATUS :FAILED :PHASE :TESTS
 :FAILURE-KIND :RUNTIME :FAILED-TEST \"fixture\")
")))
