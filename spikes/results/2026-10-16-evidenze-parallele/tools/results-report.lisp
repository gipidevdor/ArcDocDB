(:SCHEMA-VERSION 1 :KIND :PARALLEL-EVIDENCE-QUALIFICATION :STATUS :OK :RECORDS
 ((:RECORD "spikes/out/4001154506-command-88936-0/report.lisp" :COMMAND
   ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
    "--no-sysinit" "--script" "tools/check-evidence.lisp" "--self-test")
   :STATUS :OK :WALL-SECONDS 78.060628d0 :RESULT
   (:SCHEMA-VERSION 1 :KIND :EVIDENCE-PARALLEL-SELF-TEST :STATUS :OK :CHECKS
    559 :CASE-COUNT 38 :ROOT
    "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/evidence-parallel-self-test-XhzTXd/"
    :CASES
    ((:NAME "equivalence-and-cli" :STATUS :OK :CHECKS 35)
     (:NAME "jobs-0" :STATUS :OK :CHECKS 6)
     (:NAME "jobs-5" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-3" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-4" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-5" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-6" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-7" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-8" :STATUS :OK :CHECKS 6)
     (:NAME "invalid-leaf-9" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-10" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-11" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-12" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-13" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-14" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-15" :STATUS :OK :CHECKS 7)
     (:NAME "empty" :STATUS :OK :CHECKS 7)
     (:NAME "schema" :STATUS :OK :CHECKS 7)
     (:NAME "missing-artifact" :STATUS :OK :CHECKS 7)
     (:NAME "missing-file" :STATUS :OK :CHECKS 7)
     (:NAME "artifact-schema" :STATUS :OK :CHECKS 7)
     (:NAME "no-catalog" :STATUS :OK :CHECKS 4)
     (:NAME "first-error-catalog-order" :STATUS :OK :CHECKS 11)
     (:NAME "read-eval" :STATUS :OK :CHECKS 8)
     (:NAME "trailing" :STATUS :OK :CHECKS 8)
     (:NAME "plain-global-size" :STATUS :OK :CHECKS 7)
     (:NAME "gzip-global-size" :STATUS :OK :CHECKS 7)
     (:NAME "compressed-positive" :STATUS :OK :CHECKS 23)
     (:NAME "compressed-hash" :STATUS :OK :CHECKS 8)
     (:NAME "compressed-payload-symlink-escape" :STATUS :OK :CHECKS 8)
     (:NAME "worker-protocol-malformed" :STATUS :OK :CHECKS 26)
     (:NAME "worker-protocol-read-eval" :STATUS :OK :CHECKS 26)
     (:NAME "worker-protocol-descriptor" :STATUS :OK :CHECKS 26)
     (:NAME "worker-protocol-extra-key" :STATUS :OK :CHECKS 26)
     (:NAME "worker-protocol-duplicate-key" :STATUS :OK :CHECKS 26)
     (:NAME "process-bound-two" :STATUS :OK :CHECKS 54)
     (:NAME "process-bound-four" :STATUS :OK :CHECKS 54)
     (:NAME "worker-timeout-cleanup" :STATUS :OK :CHECKS 32))
    :LIMITS
    (:FIXTURE-ONLY :NO-ENGINE-QUALIFICATION
     :HISTORICAL-STATUSES-UNINTERPRETED))
   :SELF-TEST
   (:SCHEMA-VERSION 1 :KIND :EVIDENCE-PARALLEL-SELF-TEST :STATUS :OK :CHECKS
    559 :CASE-COUNT 38 :ROOT
    "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/evidence-parallel-self-test-XhzTXd/"
    :CASES
    ((:NAME "equivalence-and-cli" :STATUS :OK :CHECKS 35)
     (:NAME "jobs-0" :STATUS :OK :CHECKS 6)
     (:NAME "jobs-5" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-3" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-4" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-5" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-6" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-7" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-8" :STATUS :OK :CHECKS 6)
     (:NAME "invalid-leaf-9" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-10" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-11" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-12" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-13" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-14" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-15" :STATUS :OK :CHECKS 7)
     (:NAME "empty" :STATUS :OK :CHECKS 7)
     (:NAME "schema" :STATUS :OK :CHECKS 7)
     (:NAME "missing-artifact" :STATUS :OK :CHECKS 7)
     (:NAME "missing-file" :STATUS :OK :CHECKS 7)
     (:NAME "artifact-schema" :STATUS :OK :CHECKS 7)
     (:NAME "no-catalog" :STATUS :OK :CHECKS 4)
     (:NAME "first-error-catalog-order" :STATUS :OK :CHECKS 11)
     (:NAME "read-eval" :STATUS :OK :CHECKS 8)
     (:NAME "trailing" :STATUS :OK :CHECKS 8)
     (:NAME "plain-global-size" :STATUS :OK :CHECKS 7)
     (:NAME "gzip-global-size" :STATUS :OK :CHECKS 7)
     (:NAME "compressed-positive" :STATUS :OK :CHECKS 23)
     (:NAME "compressed-hash" :STATUS :OK :CHECKS 8)
     (:NAME "compressed-payload-symlink-escape" :STATUS :OK :CHECKS 8)
     (:NAME "worker-protocol-malformed" :STATUS :OK :CHECKS 26)
     (:NAME "worker-protocol-read-eval" :STATUS :OK :CHECKS 26)
     (:NAME "worker-protocol-descriptor" :STATUS :OK :CHECKS 26)
     (:NAME "worker-protocol-extra-key" :STATUS :OK :CHECKS 26)
     (:NAME "worker-protocol-duplicate-key" :STATUS :OK :CHECKS 26)
     (:NAME "process-bound-two" :STATUS :OK :CHECKS 54)
     (:NAME "process-bound-four" :STATUS :OK :CHECKS 54)
     (:NAME "worker-timeout-cleanup" :STATUS :OK :CHECKS 32))
    :LIMITS
    (:FIXTURE-ONLY :NO-ENGINE-QUALIFICATION
     :HISTORICAL-STATUSES-UNINTERPRETED))
   :REASON :COMPLETED :STDERR-EMPTY T)
  (:RECORD "spikes/out/4001154818-command-94920-0/report.lisp" :COMMAND
   ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
    "--no-sysinit" "--script" "tools/check-evidence.lisp" "--self-test")
   :STATUS :OK :WALL-SECONDS 88.302202d0 :RESULT
   (:SCHEMA-VERSION 1 :KIND :EVIDENCE-PARALLEL-SELF-TEST :STATUS :OK :CHECKS
    616 :CASE-COUNT 40 :ROOT
    "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/evidence-parallel-self-test-s2MlGJ/"
    :CASES
    ((:NAME "equivalence-and-cli" :STATUS :OK :CHECKS 35)
     (:NAME "jobs-0" :STATUS :OK :CHECKS 6)
     (:NAME "jobs-5" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-3" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-4" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-5" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-6" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-7" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-8" :STATUS :OK :CHECKS 6)
     (:NAME "invalid-leaf-9" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-10" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-11" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-12" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-13" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-14" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-15" :STATUS :OK :CHECKS 7)
     (:NAME "empty" :STATUS :OK :CHECKS 7)
     (:NAME "schema" :STATUS :OK :CHECKS 7)
     (:NAME "missing-artifact" :STATUS :OK :CHECKS 7)
     (:NAME "missing-file" :STATUS :OK :CHECKS 7)
     (:NAME "artifact-schema" :STATUS :OK :CHECKS 7)
     (:NAME "no-catalog" :STATUS :OK :CHECKS 4)
     (:NAME "first-error-catalog-order" :STATUS :OK :CHECKS 11)
     (:NAME "read-eval" :STATUS :OK :CHECKS 8)
     (:NAME "trailing" :STATUS :OK :CHECKS 8)
     (:NAME "plain-global-size" :STATUS :OK :CHECKS 7)
     (:NAME "gzip-global-size" :STATUS :OK :CHECKS 7)
     (:NAME "compressed-positive" :STATUS :OK :CHECKS 23)
     (:NAME "compressed-hash" :STATUS :OK :CHECKS 8)
     (:NAME "compressed-payload-symlink-escape" :STATUS :OK :CHECKS 8)
     (:NAME "worker-protocol-malformed" :STATUS :OK :CHECKS 26)
     (:NAME "worker-protocol-read-eval" :STATUS :OK :CHECKS 26)
     (:NAME "worker-protocol-descriptor" :STATUS :OK :CHECKS 26)
     (:NAME "worker-protocol-extra-key" :STATUS :OK :CHECKS 26)
     (:NAME "worker-protocol-duplicate-key" :STATUS :OK :CHECKS 26)
     (:NAME "process-bound-two" :STATUS :OK :CHECKS 54)
     (:NAME "process-bound-four" :STATUS :OK :CHECKS 54)
     (:NAME "worker-timeout-cleanup" :STATUS :OK :CHECKS 32)
     (:NAME "session-timeout-grandchild-other-group" :STATUS :OK :CHECKS 28)
     (:NAME "session-dead-leader-grandchild-other-group" :STATUS :OK :CHECKS
      27))
    :LIMITS
    (:FIXTURE-ONLY :NO-ENGINE-QUALIFICATION
     :HISTORICAL-STATUSES-UNINTERPRETED))
   :SELF-TEST
   (:SCHEMA-VERSION 1 :KIND :EVIDENCE-PARALLEL-SELF-TEST :STATUS :OK :CHECKS
    616 :CASE-COUNT 40 :ROOT
    "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/evidence-parallel-self-test-s2MlGJ/"
    :CASES
    ((:NAME "equivalence-and-cli" :STATUS :OK :CHECKS 35)
     (:NAME "jobs-0" :STATUS :OK :CHECKS 6)
     (:NAME "jobs-5" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-3" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-4" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-5" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-6" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-7" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-8" :STATUS :OK :CHECKS 6)
     (:NAME "invalid-leaf-9" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-10" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-11" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-12" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-13" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-14" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-15" :STATUS :OK :CHECKS 7)
     (:NAME "empty" :STATUS :OK :CHECKS 7)
     (:NAME "schema" :STATUS :OK :CHECKS 7)
     (:NAME "missing-artifact" :STATUS :OK :CHECKS 7)
     (:NAME "missing-file" :STATUS :OK :CHECKS 7)
     (:NAME "artifact-schema" :STATUS :OK :CHECKS 7)
     (:NAME "no-catalog" :STATUS :OK :CHECKS 4)
     (:NAME "first-error-catalog-order" :STATUS :OK :CHECKS 11)
     (:NAME "read-eval" :STATUS :OK :CHECKS 8)
     (:NAME "trailing" :STATUS :OK :CHECKS 8)
     (:NAME "plain-global-size" :STATUS :OK :CHECKS 7)
     (:NAME "gzip-global-size" :STATUS :OK :CHECKS 7)
     (:NAME "compressed-positive" :STATUS :OK :CHECKS 23)
     (:NAME "compressed-hash" :STATUS :OK :CHECKS 8)
     (:NAME "compressed-payload-symlink-escape" :STATUS :OK :CHECKS 8)
     (:NAME "worker-protocol-malformed" :STATUS :OK :CHECKS 26)
     (:NAME "worker-protocol-read-eval" :STATUS :OK :CHECKS 26)
     (:NAME "worker-protocol-descriptor" :STATUS :OK :CHECKS 26)
     (:NAME "worker-protocol-extra-key" :STATUS :OK :CHECKS 26)
     (:NAME "worker-protocol-duplicate-key" :STATUS :OK :CHECKS 26)
     (:NAME "process-bound-two" :STATUS :OK :CHECKS 54)
     (:NAME "process-bound-four" :STATUS :OK :CHECKS 54)
     (:NAME "worker-timeout-cleanup" :STATUS :OK :CHECKS 32)
     (:NAME "session-timeout-grandchild-other-group" :STATUS :OK :CHECKS 28)
     (:NAME "session-dead-leader-grandchild-other-group" :STATUS :OK :CHECKS
      27))
    :LIMITS
    (:FIXTURE-ONLY :NO-ENGINE-QUALIFICATION
     :HISTORICAL-STATUSES-UNINTERPRETED))
   :REASON :COMPLETED :STDERR-EMPTY T)
  (:RECORD "spikes/out/4001154921-command-97823-0/report.lisp" :COMMAND
   ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
    "--no-sysinit" "--script"
    "spikes/out/evidence-parallel-20261016/compare.lisp")
   :STATUS :OK :WALL-SECONDS 310.034255d0 :RESULT
   (:SCHEMA-VERSION 1 :KIND :EVIDENCE-PARALLEL-COMPARISON :STATUS :OK
    :HELPER-SHA256
    "8870d347b1911f506a9cf791b8cd350cc0d557afe42f4e608dfcf3182002de3c" :SAMPLES
    ((:JOBS 1 :WALL-SECONDS 197.929023d0 :RESULT
      (:STATUS :OK :CATALOGS 150 :ARTIFACT-REFERENCES 3747 :STORED-FILES 44686
       :STORED-BYTES 1190618013 :WORKER-LOGS NIL :LIMITS
       (:STRUCTURE-PRESENCE-SIZE-AND-COMPRESSED-INTEGRITY
        :NO-RESULT-REINTERPRETATION)))
     (:JOBS 4 :WALL-SECONDS 110.730104d0 :RESULT
      (:STATUS :OK :CATALOGS 150 :ARTIFACT-REFERENCES 3747 :STORED-FILES 44686
       :STORED-BYTES 1190618013 :WORKER-LOGS
       "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/evidence-check-mR0UwR/"
       :LIMITS
       (:STRUCTURE-PRESENCE-SIZE-AND-COMPRESSED-INTEGRITY
        :NO-RESULT-REINTERPRETATION))))
    :SAME-STABLE-RESULT T :LIMITS
    (:ONE-SAMPLE-PER-MODE :SERIAL-BEFORE-PARALLEL
     :CACHE-AND-EXTERNAL-LOAD-UNCONTROLLED :NO-GENERAL-SPEEDUP-CLAIM))
   :SELF-TEST NIL :REASON :COMPLETED :STDERR-EMPTY T)
  (:RECORD "spikes/out/4001155302-command-11195-0/report.lisp" :COMMAND
   ("make" "check-core") :STATUS :FAILED :WALL-SECONDS 181.898516d0 :RESULT NIL
   :SELF-TEST
   (:SCHEMA-VERSION 1 :KIND :EVIDENCE-PARALLEL-SELF-TEST :STATUS :FAILED
    :CHECKS 575 :CASE-COUNT 40 :ROOT
    "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/evidence-parallel-self-test-qfz1vx/"
    :CASES
    ((:NAME "equivalence-and-cli" :STATUS :OK :CHECKS 35)
     (:NAME "jobs-0" :STATUS :OK :CHECKS 6)
     (:NAME "jobs-5" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-3" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-4" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-5" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-6" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-7" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-8" :STATUS :OK :CHECKS 6)
     (:NAME "invalid-leaf-9" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-10" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-11" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-12" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-13" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-14" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-15" :STATUS :OK :CHECKS 7)
     (:NAME "empty" :STATUS :OK :CHECKS 7)
     (:NAME "schema" :STATUS :OK :CHECKS 7)
     (:NAME "missing-artifact" :STATUS :OK :CHECKS 7)
     (:NAME "missing-file" :STATUS :OK :CHECKS 7)
     (:NAME "artifact-schema" :STATUS :OK :CHECKS 7)
     (:NAME "no-catalog" :STATUS :OK :CHECKS 4)
     (:NAME "first-error-catalog-order" :STATUS :OK :CHECKS 11)
     (:NAME "read-eval" :STATUS :OK :CHECKS 8)
     (:NAME "trailing" :STATUS :OK :CHECKS 8)
     (:NAME "plain-global-size" :STATUS :OK :CHECKS 7)
     (:NAME "gzip-global-size" :STATUS :OK :CHECKS 7)
     (:NAME "compressed-positive" :STATUS :OK :CHECKS 23)
     (:NAME "compressed-hash" :STATUS :OK :CHECKS 8)
     (:NAME "compressed-payload-symlink-escape" :STATUS :OK :CHECKS 8)
     (:NAME "worker-protocol-malformed" :STATUS :OK :CHECKS 26)
     (:NAME "worker-protocol-read-eval" :STATUS :OK :CHECKS 26)
     (:NAME "worker-protocol-descriptor" :STATUS :OK :CHECKS 26)
     (:NAME "worker-protocol-extra-key" :STATUS :OK :CHECKS 26)
     (:NAME "worker-protocol-duplicate-key" :STATUS :OK :CHECKS 26)
     (:NAME "process-bound-two" :STATUS :FAILED :CHECKS 13 :CONDITION
      SIMPLE-ERROR :DIAGNOSTIC "Enumera PID: ps fallito.")
     (:NAME "process-bound-four" :STATUS :OK :CHECKS 54)
     (:NAME "worker-timeout-cleanup" :STATUS :OK :CHECKS 32)
     (:NAME "session-timeout-grandchild-other-group" :STATUS :OK :CHECKS 28)
     (:NAME "session-dead-leader-grandchild-other-group" :STATUS :OK :CHECKS
      27))
    :LIMITS
    (:FIXTURE-ONLY :NO-ENGINE-QUALIFICATION
     :HISTORICAL-STATUSES-UNINTERPRETED))
   :REASON :PS-ENUMERATION-FAILURE-OBSERVED :STDERR-EMPTY NIL)
  (:RECORD "spikes/out/4001155836-command-20347-0/report.lisp" :COMMAND
   ("make" "check-core") :STATUS :FAILED :WALL-SECONDS 63.768731d0 :RESULT NIL
   :SELF-TEST NIL :REASON :INTERRUPTED-FOR-CLEANUP-FIX :STDERR-EMPTY NIL)
  (:RECORD "spikes/out/4001156028-command-24549-0/report.lisp" :COMMAND
   ("make" "check-core") :STATUS :FAILED :WALL-SECONDS 44.281991d0 :RESULT NIL
   :SELF-TEST NIL :REASON :INTERRUPTED-FOR-MAIN-INTEGRATION :STDERR-EMPTY NIL)
  (:RECORD "spikes/out/4001156102-command-25998-0/report.lisp" :COMMAND
   ("make" "check-core") :STATUS :FAILED :WALL-SECONDS 225.146196d0 :RESULT NIL
   :SELF-TEST
   (:SCHEMA-VERSION 1 :KIND :EVIDENCE-PARALLEL-SELF-TEST :STATUS :FAILED
    :CHECKS 734 :CASE-COUNT 46 :ROOT
    "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/evidence-parallel-self-test-U4zCh4/"
    :CASES
    ((:NAME "equivalence-and-cli" :STATUS :OK :CHECKS 35)
     (:NAME "jobs-0" :STATUS :OK :CHECKS 6)
     (:NAME "jobs-5" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-3" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-4" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-5" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-6" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-7" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-8" :STATUS :OK :CHECKS 6)
     (:NAME "invalid-leaf-9" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-10" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-11" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-12" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-13" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-14" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-15" :STATUS :OK :CHECKS 7)
     (:NAME "empty" :STATUS :OK :CHECKS 7)
     (:NAME "schema" :STATUS :OK :CHECKS 7)
     (:NAME "missing-artifact" :STATUS :OK :CHECKS 7)
     (:NAME "missing-file" :STATUS :OK :CHECKS 7)
     (:NAME "artifact-schema" :STATUS :OK :CHECKS 7)
     (:NAME "no-catalog" :STATUS :OK :CHECKS 4)
     (:NAME "first-error-catalog-order" :STATUS :OK :CHECKS 11)
     (:NAME "read-eval" :STATUS :OK :CHECKS 8)
     (:NAME "trailing" :STATUS :OK :CHECKS 8)
     (:NAME "plain-global-size" :STATUS :OK :CHECKS 7)
     (:NAME "gzip-global-size" :STATUS :OK :CHECKS 7)
     (:NAME "compressed-positive" :STATUS :OK :CHECKS 23)
     (:NAME "compressed-hash" :STATUS :OK :CHECKS 8)
     (:NAME "compressed-payload-symlink-escape" :STATUS :OK :CHECKS 8)
     (:NAME "worker-protocol-malformed" :STATUS :OK :CHECKS 26)
     (:NAME "worker-protocol-read-eval" :STATUS :OK :CHECKS 26)
     (:NAME "worker-protocol-descriptor" :STATUS :OK :CHECKS 26)
     (:NAME "worker-protocol-extra-key" :STATUS :OK :CHECKS 26)
     (:NAME "worker-protocol-duplicate-key" :STATUS :OK :CHECKS 26)
     (:NAME "process-bound-two" :STATUS :OK :CHECKS 54)
     (:NAME "process-bound-four" :STATUS :OK :CHECKS 54)
     (:NAME "worker-timeout-cleanup" :STATUS :OK :CHECKS 32)
     (:NAME "session-timeout-grandchild-other-group" :STATUS :OK :CHECKS 28)
     (:NAME "session-dead-leader-grandchild-other-group" :STATUS :OK :CHECKS
      27)
     (:NAME "process-scan-retry" :STATUS :OK :CHECKS 25)
     (:NAME "process-scan-failed" :STATUS :OK :CHECKS 25)
     (:NAME "process-scan-nonnumeric" :STATUS :OK :CHECKS 28)
     (:NAME "process-scan-empty" :STATUS :OK :CHECKS 28)
     (:NAME "process-scan-generic-error-propagates" :STATUS :OK :CHECKS 5)
     (:NAME "process-scan-timeout-propagates" :STATUS :FAILED :CHECKS 1
      :CONDITION TIMEOUT :DIAGNOSTIC "Timeout occurred."))
    :LIMITS
    (:FIXTURE-ONLY :NO-ENGINE-QUALIFICATION
     :HISTORICAL-STATUSES-UNINTERPRETED))
   :REASON :TIMEOUT-FIXTURE-CAPTURE-ERROR :STDERR-EMPTY NIL)
  (:RECORD "spikes/out/4001156414-command-35966-0/report.lisp" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "spikes/out/evidence-parallel-20261016/propagation-probe.lisp")
   :STATUS :OK :WALL-SECONDS 1.722767d0 :RESULT
   (:SCHEMA-VERSION 1 :KIND :EVIDENCE-PROPAGATION-PROBE :STATUS :OK :ROOT
    "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/evidence-propagation-probe-AUewed/"
    :CHECKS 10)
   :SELF-TEST NIL :REASON :COMPLETED :STDERR-EMPTY T)
  (:RECORD "spikes/out/4001156462-command-39221-0/report.lisp" :COMMAND
   ("make" "check-core") :STATUS :OK :WALL-SECONDS 535.416009d0 :RESULT NIL
   :SELF-TEST
   (:SCHEMA-VERSION 1 :KIND :EVIDENCE-PARALLEL-SELF-TEST :STATUS :OK :CHECKS
    738 :CASE-COUNT 46 :ROOT
    "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/../spikes/out/evidence-parallel-self-test-9jdqsQ/"
    :CASES
    ((:NAME "equivalence-and-cli" :STATUS :OK :CHECKS 35)
     (:NAME "jobs-0" :STATUS :OK :CHECKS 6)
     (:NAME "jobs-5" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-3" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-4" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-5" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-6" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-7" :STATUS :OK :CHECKS 6)
     (:NAME "cli-reject-8" :STATUS :OK :CHECKS 6)
     (:NAME "invalid-leaf-9" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-10" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-11" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-12" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-13" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-14" :STATUS :OK :CHECKS 7)
     (:NAME "invalid-leaf-15" :STATUS :OK :CHECKS 7)
     (:NAME "empty" :STATUS :OK :CHECKS 7)
     (:NAME "schema" :STATUS :OK :CHECKS 7)
     (:NAME "missing-artifact" :STATUS :OK :CHECKS 7)
     (:NAME "missing-file" :STATUS :OK :CHECKS 7)
     (:NAME "artifact-schema" :STATUS :OK :CHECKS 7)
     (:NAME "no-catalog" :STATUS :OK :CHECKS 4)
     (:NAME "first-error-catalog-order" :STATUS :OK :CHECKS 11)
     (:NAME "read-eval" :STATUS :OK :CHECKS 8)
     (:NAME "trailing" :STATUS :OK :CHECKS 8)
     (:NAME "plain-global-size" :STATUS :OK :CHECKS 7)
     (:NAME "gzip-global-size" :STATUS :OK :CHECKS 7)
     (:NAME "compressed-positive" :STATUS :OK :CHECKS 23)
     (:NAME "compressed-hash" :STATUS :OK :CHECKS 8)
     (:NAME "compressed-payload-symlink-escape" :STATUS :OK :CHECKS 8)
     (:NAME "worker-protocol-malformed" :STATUS :OK :CHECKS 26)
     (:NAME "worker-protocol-read-eval" :STATUS :OK :CHECKS 26)
     (:NAME "worker-protocol-descriptor" :STATUS :OK :CHECKS 26)
     (:NAME "worker-protocol-extra-key" :STATUS :OK :CHECKS 26)
     (:NAME "worker-protocol-duplicate-key" :STATUS :OK :CHECKS 26)
     (:NAME "process-bound-two" :STATUS :OK :CHECKS 54)
     (:NAME "process-bound-four" :STATUS :OK :CHECKS 54)
     (:NAME "worker-timeout-cleanup" :STATUS :OK :CHECKS 32)
     (:NAME "session-timeout-grandchild-other-group" :STATUS :OK :CHECKS 28)
     (:NAME "session-dead-leader-grandchild-other-group" :STATUS :OK :CHECKS
      27)
     (:NAME "process-scan-retry" :STATUS :OK :CHECKS 25)
     (:NAME "process-scan-failed" :STATUS :OK :CHECKS 25)
     (:NAME "process-scan-nonnumeric" :STATUS :OK :CHECKS 28)
     (:NAME "process-scan-empty" :STATUS :OK :CHECKS 28)
     (:NAME "process-scan-generic-error-propagates" :STATUS :OK :CHECKS 5)
     (:NAME "process-scan-timeout-propagates" :STATUS :OK :CHECKS 5))
    :LIMITS
    (:FIXTURE-ONLY :NO-ENGINE-QUALIFICATION
     :HISTORICAL-STATUSES-UNINTERPRETED))
   :REASON :COMPLETED :STDERR-EMPTY NIL)
  (:RECORD "spikes/out/4001157163-command-78205-0/report.lisp" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "spikes/out/evidence-parallel-20261016/cleanup-probe.lisp")
   :STATUS :OK :WALL-SECONDS 1.496445d0 :RESULT
   (:SCHEMA-VERSION 1 :KIND :EVIDENCE-CLEANUP-PROBE :STATUS :OK :ROOT
    "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/evidence-cleanup-probe-bG44ns/"
    :CHECKS 18 :CASES
    ((:ORDER :ERROR-FIRST :STATUS :OK :RESULT
      (:STATUS :OK :OBSERVATIONS
       (:ORDER :ERROR-FIRST :CALLS (:ONE :TWO :THREE) :FUNCTION-RESTORED T
        :CONDITION SIMPLE-ERROR :DIAGNOSTIC
        "Cleanup worker fallito: EXPECTED-CLEANUP-GENERIC-FAULT; Timeout occurred.. Log: /Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/evidence-cleanup-probe-bG44ns/error-first/cleanup-logs/."
        :LOGS
        "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/evidence-cleanup-probe-bG44ns/error-first/cleanup-logs/")))
     (:ORDER :TIMEOUT-FIRST :STATUS :OK :RESULT
      (:STATUS :OK :OBSERVATIONS
       (:ORDER :TIMEOUT-FIRST :CALLS (:ONE :TWO :THREE) :FUNCTION-RESTORED T
        :CONDITION SIMPLE-ERROR :DIAGNOSTIC
        "Cleanup worker fallito: Timeout occurred.; EXPECTED-CLEANUP-GENERIC-FAULT. Log: /Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/evidence-cleanup-probe-bG44ns/timeout-first/cleanup-logs/."
        :LOGS
        "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/evidence-cleanup-probe-bG44ns/timeout-first/cleanup-logs/"))))
    :LIMITS
    (:PERMANENT-TEST-FUNCTION-ONLY :OLD-FORTY-SIX-NOT-RERUN
     :NO-WORKER-PROCESSES-STARTED :NO-SOURCE-INDEX-OR-HEAD-EDITS))
   :SELF-TEST NIL :REASON :COMPLETED :STDERR-EMPTY T)
  (:RECORD "spikes/out/4001157172-command-78590-0/report.lisp" :COMMAND
   ("make" "evidence") :STATUS :OK :WALL-SECONDS 119.826042d0 :RESULT NIL
   :SELF-TEST NIL :REASON :COMPLETED :STDERR-EMPTY T)
  (:RECORD "spikes/out/4001157172-command-78589-0/report.lisp" :COMMAND
   ("make" "test" "lint" "trace" "links") :STATUS :OK :WALL-SECONDS
   127.490498d0 :RESULT NIL :SELF-TEST NIL :REASON :COMPLETED :STDERR-EMPTY
   NIL))
 :REVIEWS
 ((:SCOPE :RESOURCE-CONTRACT :BLOCKING-FINDINGS 0)
  (:SCOPE :WORKER-PROTOCOL-AND-PROCESS-OWNERSHIP :INITIAL-QUALIFIED-SOURCE-BLOB
   "d75c465bff01c0f2ba70bb07de2032ee47c392d7" :FINAL-SOURCE-BLOB
   "e3df9f52590ce2de86ad75b872c859b81bbcc518" :BLOCKING-FINDINGS 0))
 :LIMITS
 (:C4-TOOL-ONLY :NO-C1-OR-MCDC-CLOSURE
  :FAILED-ATTEMPTS-RETAINED-NOT-REINTERPRETED
  :LOCAL-SINGLE-SAMPLE-TIMING-BEFORE-SNAPSHOT-RETRIES :SERIAL-FIRST
  :UNCONTROLLED-LOAD-AND-CACHE))
