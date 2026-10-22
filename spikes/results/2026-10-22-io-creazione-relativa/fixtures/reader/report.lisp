(:SCHEMA-VERSION 1 :KIND :READER-PROCESS-SELF-TEST :STATUS :PASSED
 :WORKER-ERRORS 2 :BASELINE NIL :MUTANTS
 ((:NAME :SIGNAL :RESULT :WORKER-ERROR :EXECUTION
   (:EXIT-CODE 137 :SIGNAL 9 :TIMED-OUT NIL :ARGV
    ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--disable-debugger"
     "--script" "isolated-build.lisp")
    :RUNNER
    #A((142) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237562-reader-self-test-93293-0/signal/isolated-build.lisp")
    :STDOUT-LOG
    #A((133) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237562-reader-self-test-93293-0/signal/stdout.log")
    :STDERR-LOG
    #A((133) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237562-reader-self-test-93293-0/signal/stderr.log")
    :REPORT
    (:SCHEMA-VERSION 1 :KIND :READER-MUTATION-CHILD :STATUS :FAILED :PHASE
     :TESTS :FAILURE-KIND :RUNTIME :FAILED-TEST "fixture")))
  (:NAME :COMPLETION-EXIT :RESULT :WORKER-ERROR :EXECUTION
   (:EXIT-CODE 7 :SIGNAL NIL :TIMED-OUT NIL :ARGV
    ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--disable-debugger"
     "--script" "isolated-build.lisp")
    :RUNNER
    #A((151) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237562-reader-self-test-93293-0/completion-exit/isolated-build.lisp")
    :STDOUT-LOG
    #A((142) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237562-reader-self-test-93293-0/completion-exit/stdout.log")
    :STDERR-LOG
    #A((142) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237562-reader-self-test-93293-0/completion-exit/stderr.log")
    :REPORT
    (:SCHEMA-VERSION 1 :KIND :READER-MUTATION-CHILD :STATUS :OK :PHASE
     :COMPLETE :PASSED-TESTS ("fixture"))))))
