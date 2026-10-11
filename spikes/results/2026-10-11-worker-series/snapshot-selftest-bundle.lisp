(:SCHEMA-VERSION 1 :KIND :WORKER-SERIES-SELFTEST-BUNDLE :VERSION
 "intentional-signal-and-completion-exit" :SOURCES
 ((:PATH
   #A((180) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/spikes/out/4000709303-snapshot-self-test-15493-0/completion-exit/isolated-build.lisp")
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
   #A((171) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/spikes/out/4000709303-snapshot-self-test-15493-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" :GIT-BLOB
   "e69de29bb2d1d6434b8b29ae775ad8c2e48c5391" :TEXT "")
  (:PATH
   #A((171) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/spikes/out/4000709303-snapshot-self-test-15493-0/completion-exit/stdout.log")
   :BYTES 107 :SHA256 "4f22544421d9012fe132a36bf15950cd327ca959b8f9c5ef3d386e0c8b62a25c" :GIT-BLOB
   "957772db5029a5b016fb82fdf8735fb36cd15719" :TEXT
   "(:SCHEMA-VERSION 1 :KIND :SNAPSHOT-MUTATION-CHILD :STATUS :OK :PHASE :COMPLETE
 :PASSED-TESTS (\"fixture\"))
")
  (:PATH
   #A((156) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/spikes/out/4000709303-snapshot-self-test-15493-0/report.lisp")
   :BYTES 2201 :SHA256 "b5aafc45bf4e5dd20c945618862951c379c806789d14d105633d3e5e3c7ef8f1" :GIT-BLOB
   "a32a6616869acc0939bfbc6ff986a12df3150b2c" :TEXT
   "(:SCHEMA-VERSION 1 :KIND :SNAPSHOT-PROCESS-SELF-TEST :STATUS :PASSED
 :WORKER-ERRORS 2 :BASELINE NIL :MUTANTS
 ((:NAME :SIGNAL :RESULT :WORKER-ERROR :EXECUTION
   (:EXIT-CODE 137 :SIGNAL 9 :TIMED-OUT NIL :ARGV
    (\"sbcl\" \"--noinform\" \"--no-userinit\" \"--no-sysinit\" \"--disable-debugger\"
     \"--script\" \"isolated-build.lisp\")
    :RUNNER
    #A((179) BASE-CHAR
       . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/spikes/out/4000709303-snapshot-self-test-15493-0/signal/isolated-build.lisp\")
    :STDOUT-LOG
    #A((170) BASE-CHAR
       . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/spikes/out/4000709303-snapshot-self-test-15493-0/signal/stdout.log\")
    :STDERR-LOG
    #A((170) BASE-CHAR
       . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/spikes/out/4000709303-snapshot-self-test-15493-0/signal/stderr.log\")
    :REPORT
    (:SCHEMA-VERSION 1 :KIND :SNAPSHOT-MUTATION-CHILD :STATUS :FAILED :PHASE
     :TESTS :FAILURE-KIND :RUNTIME :FAILED-TEST \"fixture\")))
  (:NAME :COMPLETION-EXIT :RESULT :WORKER-ERROR :EXECUTION
   (:EXIT-CODE 7 :SIGNAL NIL :TIMED-OUT NIL :ARGV
    (\"sbcl\" \"--noinform\" \"--no-userinit\" \"--no-sysinit\" \"--disable-debugger\"
     \"--script\" \"isolated-build.lisp\")
    :RUNNER
    #A((188) BASE-CHAR
       . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/spikes/out/4000709303-snapshot-self-test-15493-0/completion-exit/isolated-build.lisp\")
    :STDOUT-LOG
    #A((179) BASE-CHAR
       . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/spikes/out/4000709303-snapshot-self-test-15493-0/completion-exit/stdout.log\")
    :STDERR-LOG
    #A((179) BASE-CHAR
       . \"/private/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/spikes/out/4000709303-snapshot-self-test-15493-0/completion-exit/stderr.log\")
    :REPORT
    (:SCHEMA-VERSION 1 :KIND :SNAPSHOT-MUTATION-CHILD :STATUS :OK :PHASE
     :COMPLETE :PASSED-TESTS (\"fixture\"))))))
")
  (:PATH
   #A((171) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/spikes/out/4000709303-snapshot-self-test-15493-0/signal/isolated-build.lisp")
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
   #A((162) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/spikes/out/4000709303-snapshot-self-test-15493-0/signal/stderr.log")
   :BYTES 0 :SHA256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" :GIT-BLOB
   "e69de29bb2d1d6434b8b29ae775ad8c2e48c5391" :TEXT "")
  (:PATH
   #A((162) BASE-CHAR
      . "/var/folders/07/57bk4fl91n9_9gk_j124c_q80000gn/T/arcdocdb-worker-series-final-4mdlyzoo/ArcDocDB/spikes/out/4000709303-snapshot-self-test-15493-0/signal/stdout.log")
   :BYTES 128 :SHA256 "e3502e714a0530acb1f0130c4ced4a016607bcb067e3686f6f29704db8423ea5" :GIT-BLOB
   "36a989feae9ea9229cd01e7db6aefd42183a2aaa" :TEXT
   "(:SCHEMA-VERSION 1 :KIND :SNAPSHOT-MUTATION-CHILD :STATUS :FAILED :PHASE :TESTS
 :FAILURE-KIND :RUNTIME :FAILED-TEST \"fixture\")
")))
