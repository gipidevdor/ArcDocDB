(:DIAGNOSTIC
 #A((53) BASE-CHAR . "Self-test processo snapshot: esito OS non conservato.")
 :SCHEMA-VERSION 1 :KIND :SNAPSHOT-PROCESS-SELF-TEST :STATUS :FAILED
 :WORKER-ERRORS 1 :BASELINE NIL :MUTANTS
 ((:NAME :SIGNAL :RESULT :WORKER-ERROR :EXECUTION
   (:EXIT-CODE 1 :SIGNAL NIL :TIMED-OUT NIL :ARGV
    ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--disable-debugger"
     "--script" "isolated-build.lisp")
    :RUNNER
    #A((149) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002436532-snapshot-self-test-18699-0/signal/isolated-build.lisp")
    :STDOUT-LOG
    #A((140) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002436532-snapshot-self-test-18699-0/signal/stdout.log")
    :STDERR-LOG
    #A((140) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002436532-snapshot-self-test-18699-0/signal/stderr.log")
    :REPORT NIL))))
