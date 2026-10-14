(:SCHEMA-VERSION 1 :KIND :READER-PROCESS-SELF-TEST :STATUS :PASSED
 :WORKER-ERRORS 2 :BASELINE NIL :MUTANTS
 ((:NAME :SIGNAL :RESULT :WORKER-ERROR :EXECUTION
   (:EXIT-CODE 137 :SIGNAL 9 :TIMED-OUT NIL :ARGV
    ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--disable-debugger"
     "--script" "isolated-build.lisp")
    :RUNNER
    #A((108) BASE-CHAR
       . "/home/runner/work/ArcDocDB/ArcDocDB/spikes/out/4000999269-reader-self-test-2703-0/signal/isolated-build.lisp")
    :STDOUT-LOG
    #A((99) BASE-CHAR
       . "/home/runner/work/ArcDocDB/ArcDocDB/spikes/out/4000999269-reader-self-test-2703-0/signal/stdout.log")
    :STDERR-LOG
    #A((99) BASE-CHAR
       . "/home/runner/work/ArcDocDB/ArcDocDB/spikes/out/4000999269-reader-self-test-2703-0/signal/stderr.log")
    :REPORT
    (:SCHEMA-VERSION 1 :KIND :READER-MUTATION-CHILD :STATUS :FAILED :PHASE
     :TESTS :FAILURE-KIND :RUNTIME :FAILED-TEST "fixture")))
  (:NAME :COMPLETION-EXIT :RESULT :WORKER-ERROR :EXECUTION
   (:EXIT-CODE 7 :SIGNAL NIL :TIMED-OUT NIL :ARGV
    ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--disable-debugger"
     "--script" "isolated-build.lisp")
    :RUNNER
    #A((117) BASE-CHAR
       . "/home/runner/work/ArcDocDB/ArcDocDB/spikes/out/4000999269-reader-self-test-2703-0/completion-exit/isolated-build.lisp")
    :STDOUT-LOG
    #A((108) BASE-CHAR
       . "/home/runner/work/ArcDocDB/ArcDocDB/spikes/out/4000999269-reader-self-test-2703-0/completion-exit/stdout.log")
    :STDERR-LOG
    #A((108) BASE-CHAR
       . "/home/runner/work/ArcDocDB/ArcDocDB/spikes/out/4000999269-reader-self-test-2703-0/completion-exit/stderr.log")
    :REPORT
    (:SCHEMA-VERSION 1 :KIND :READER-MUTATION-CHILD :STATUS :OK :PHASE
     :COMPLETE :PASSED-TESTS ("fixture"))))))
