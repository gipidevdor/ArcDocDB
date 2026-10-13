(:SCHEMA-VERSION 1 :KIND :SNAPSHOT-PROCESS-SELF-TEST :STATUS :PASSED
 :WORKER-ERRORS 2 :BASELINE NIL :MUTANTS
 ((:NAME :SIGNAL :RESULT :WORKER-ERROR :EXECUTION
   (:EXIT-CODE 137 :SIGNAL 9 :TIMED-OUT NIL :ARGV
    ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--disable-debugger"
     "--script" "isolated-build.lisp")
    :RUNNER
    #A((146) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910623-snapshot-self-test-11981-0/signal/isolated-build.lisp")
    :STDOUT-LOG
    #A((137) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910623-snapshot-self-test-11981-0/signal/stdout.log")
    :STDERR-LOG
    #A((137) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910623-snapshot-self-test-11981-0/signal/stderr.log")
    :REPORT
    (:SCHEMA-VERSION 1 :KIND :SNAPSHOT-MUTATION-CHILD :STATUS :FAILED :PHASE
     :TESTS :FAILURE-KIND :RUNTIME :FAILED-TEST "fixture")))
  (:NAME :COMPLETION-EXIT :RESULT :WORKER-ERROR :EXECUTION
   (:EXIT-CODE 7 :SIGNAL NIL :TIMED-OUT NIL :ARGV
    ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--disable-debugger"
     "--script" "isolated-build.lisp")
    :RUNNER
    #A((155) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910623-snapshot-self-test-11981-0/completion-exit/isolated-build.lisp")
    :STDOUT-LOG
    #A((146) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910623-snapshot-self-test-11981-0/completion-exit/stdout.log")
    :STDERR-LOG
    #A((146) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910623-snapshot-self-test-11981-0/completion-exit/stderr.log")
    :REPORT
    (:SCHEMA-VERSION 1 :KIND :SNAPSHOT-MUTATION-CHILD :STATUS :OK :PHASE
     :COMPLETE :PASSED-TESTS ("fixture"))))))
