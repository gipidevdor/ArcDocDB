(:SCHEMA-VERSION 1 :KIND :GET-SERIES-DEVELOPMENT-HISTORY :STATUS :RECORDED
 :ACCEPTED-FREEZE "92fa92b0f44b6675617881fb406039e852b7ab50" :CHECK-PRODUCER
 "4000908027-command-75738-0" :BENCHMARK-PRODUCER "4000908273-command-82664-0"
 :NAMED-TESTS 1038 :NEW-SERIES-GET-TESTS 27 :MUTANTS-DETECTED 4
 :BASELINE-PASSED T :COMMANDS
 ((:PRODUCER "4000906318-command-38706-0" :STATUS :OK :EXIT-CODE 0 :FREEZE
   "51c4c1ff60cf1380440e4bbe4cfd14c2a3ed98cf" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/get-series-capture.lisp" "--self-test")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000906318-command-38707-0" :STATUS :FAILED :EXIT-CODE 1 :FREEZE
   "51c4c1ff60cf1380440e4bbe4cfd14c2a3ed98cf" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/get-series-capture.lisp" "--" "sbcl" "--noinform" "--no-userinit"
    "--no-sysinit" "--script"
    "spikes/results/2026-10-13-get-fonti-serie/collect.lisp" "--self-test")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000906318-command-38708-0" :STATUS :OK :EXIT-CODE 0 :FREEZE
   "51c4c1ff60cf1380440e4bbe4cfd14c2a3ed98cf" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/get-series-capture.lisp" "--raw-root"
    "spikes/out/get-series-mutations-self-a/" "--" "sbcl" "--noinform"
    "--no-userinit" "--no-sysinit" "--script" "tools/get-series-mutation.lisp"
    "--self-test" "spikes/out/get-series-mutations-self-a/")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000906318-command-38737-0" :STATUS :FAILED :EXIT-CODE 2 :FREEZE
   "51c4c1ff60cf1380440e4bbe4cfd14c2a3ed98cf" :COMMAND
   ("/Applications/Xcode.app/Contents/Developer/usr/bin/make" "check-core")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000906454-command-40346-0" :STATUS :OK :EXIT-CODE 0 :FREEZE
   "3844d59610ca0139b3432a9f25dd9a85abd8efd7" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/get-series-capture.lisp" "--" "sbcl" "--noinform" "--no-userinit"
    "--no-sysinit" "--script"
    "spikes/results/2026-10-13-get-fonti-serie/collect.lisp" "--self-test")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000906454-command-40347-0" :STATUS :FAILED :EXIT-CODE 1 :FREEZE
   "3844d59610ca0139b3432a9f25dd9a85abd8efd7" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/get-series-capture.lisp" "--raw-root"
    "spikes/out/get-series-coverage-b/" "--" "sbcl" "--noinform"
    "--no-userinit" "--no-sysinit" "--script" "tools/foundation-coverage.lisp"
    "--report" "spikes/out/get-series-coverage-b/" "get-series")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000906454-command-40348-0" :STATUS :FAILED :EXIT-CODE 1 :FREEZE
   "3844d59610ca0139b3432a9f25dd9a85abd8efd7" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/get-series-capture.lisp" "--raw-root"
    "spikes/out/get-series-mutations-b/" "--" "sbcl" "--noinform"
    "--no-userinit" "--no-sysinit" "--script" "tools/get-series-mutation.lisp"
    "--check" "spikes/out/get-series-mutations-b/")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000906454-command-40378-0" :STATUS :FAILED :EXIT-CODE 2 :FREEZE
   "3844d59610ca0139b3432a9f25dd9a85abd8efd7" :COMMAND
   ("/Applications/Xcode.app/Contents/Developer/usr/bin/make" "check-core")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000906542-command-41782-0" :STATUS :FAILED :EXIT-CODE 1 :FREEZE
   "5175dc7cd7f03c0fbbcc24bce7049ea5d0874ba1" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/get-series-capture.lisp" "--raw-root"
    "spikes/out/get-series-coverage-c/" "--" "sbcl" "--noinform"
    "--no-userinit" "--no-sysinit" "--script" "tools/foundation-coverage.lisp"
    "--report" "spikes/out/get-series-coverage-c/" "get-series")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000906542-command-41783-0" :STATUS :FAILED :EXIT-CODE 1 :FREEZE
   "5175dc7cd7f03c0fbbcc24bce7049ea5d0874ba1" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/get-series-capture.lisp" "--raw-root"
    "spikes/out/get-series-mutations-c/" "--" "sbcl" "--noinform"
    "--no-userinit" "--no-sysinit" "--script" "tools/get-series-mutation.lisp"
    "--check" "spikes/out/get-series-mutations-c/")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000906542-command-41806-0" :STATUS :FAILED :EXIT-CODE 2 :FREEZE
   "5175dc7cd7f03c0fbbcc24bce7049ea5d0874ba1" :COMMAND
   ("/Applications/Xcode.app/Contents/Developer/usr/bin/make" "check-core")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000906649-command-44253-0" :STATUS :OK :EXIT-CODE 0 :FREEZE
   "0c8808bb4714b48dc72d306eee38026cb95f353c" :COMMAND
   ("/Applications/Xcode.app/Contents/Developer/usr/bin/make" "check-core")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000906953-command-51750-0" :STATUS :OK :EXIT-CODE 0 :FREEZE
   "e6e04973526fc7b1c1ea9b72dec2b5c73f323a21" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/get-series-capture.lisp" "--raw-root"
    "spikes/out/get-series-coverage-e/" "--" "sbcl" "--noinform"
    "--no-userinit" "--no-sysinit" "--script" "tools/foundation-coverage.lisp"
    "--report" "spikes/out/get-series-coverage-e/" "get-series")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000906953-command-51752-0" :STATUS :OK :EXIT-CODE 0 :FREEZE
   "e6e04973526fc7b1c1ea9b72dec2b5c73f323a21" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/get-series-capture.lisp" "--raw-root"
    "spikes/out/get-series-mutations-e/" "--" "sbcl" "--noinform"
    "--no-userinit" "--no-sysinit" "--script" "tools/get-series-mutation.lisp"
    "--check" "spikes/out/get-series-mutations-e/")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000906953-command-51753-0" :STATUS :FAILED :EXIT-CODE 2 :FREEZE
   "e6e04973526fc7b1c1ea9b72dec2b5c73f323a21" :COMMAND
   ("git" "diff" "--check" "4344d9e" "HEAD") :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000906953-command-51756-0" :STATUS :OK :EXIT-CODE 0 :FREEZE
   "e6e04973526fc7b1c1ea9b72dec2b5c73f323a21" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/get-series-capture.lisp" "--raw-root"
    "spikes/out/get-series-coverage-self-e/" "--" "sbcl" "--noinform"
    "--no-userinit" "--no-sysinit" "--script" "tools/foundation-coverage.lisp"
    "--self-test" "spikes/out/get-series-coverage-self-e/")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000906953-command-51790-0" :STATUS :OK :EXIT-CODE 0 :FREEZE
   "e6e04973526fc7b1c1ea9b72dec2b5c73f323a21" :COMMAND
   ("/Applications/Xcode.app/Contents/Developer/usr/bin/make" "check-core")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000907015-command-53974-0" :STATUS :FAILED :EXIT-CODE 2 :FREEZE
   "e6e04973526fc7b1c1ea9b72dec2b5c73f323a21" :COMMAND
   ("git" "diff" "--check" "4344d9e" "HEAD" "--" "src" "tests" "tools" "docs"
    "CHANGELOG.md" "arcdocdb.asd")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000907017-command-54023-0" :STATUS :OK :EXIT-CODE 0 :FREEZE
   "e6e04973526fc7b1c1ea9b72dec2b5c73f323a21" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/get-series-capture.lisp" "--raw-root"
    "spikes/out/get-series-self-test-e/" "--" "sbcl" "--noinform"
    "--no-userinit" "--no-sysinit" "--script" "tools/get-series-bench.lisp"
    "--self-test" "spikes/out/get-series-self-test-e/")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000907132-command-58169-0" :STATUS :FAILED :EXIT-CODE 1 :FREEZE
   "e6e04973526fc7b1c1ea9b72dec2b5c73f323a21" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/get-series-capture.lisp" "--raw-root"
    "spikes/out/get-series-bench-negative-e/" "--" "sbcl" "--noinform"
    "--no-userinit" "--no-sysinit" "--script" "tools/get-series-bench.lisp"
    "--negative-record-case" "spikes/out/get-series-bench-negative-e/")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000907133-command-58212-0" :STATUS :OK :EXIT-CODE 0 :FREEZE
   "e6e04973526fc7b1c1ea9b72dec2b5c73f323a21" :COMMAND
   ("git" "diff" "--check" "3106a49" "HEAD" "--" "src" "tests" "tools" "docs"
    "CHANGELOG.md" "arcdocdb.asd")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000907170-command-59276-0" :STATUS :OK :EXIT-CODE 0 :FREEZE
   "e6e04973526fc7b1c1ea9b72dec2b5c73f323a21" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/get-series-capture.lisp" "--raw-root"
    "spikes/out/get-series-bench-e/" "--" "sbcl" "--noinform" "--no-userinit"
    "--no-sysinit" "--script" "tools/get-series-bench.lisp" "--bench"
    "spikes/out/get-series-bench-e/")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000907171-command-59334-0" :STATUS :OK :EXIT-CODE 0 :FREEZE
   "e6e04973526fc7b1c1ea9b72dec2b5c73f323a21" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/get-series-capture.lisp" "--" "sbcl" "--noinform" "--no-userinit"
    "--no-sysinit" "--script"
    "spikes/results/2026-10-13-get-fonti-serie/collect.lisp" "--self-test")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000907598-command-69239-0" :STATUS :OK :EXIT-CODE 0 :FREEZE
   "ffe191a61db8d43c389730f6f2f45fef766b1b88" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/get-series-capture.lisp" "--raw-root"
    "spikes/out/get-series-coverage-f/" "--" "sbcl" "--noinform"
    "--no-userinit" "--no-sysinit" "--script" "tools/foundation-coverage.lisp"
    "--report" "spikes/out/get-series-coverage-f/" "get-series")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000907598-command-69240-0" :STATUS :OK :EXIT-CODE 0 :FREEZE
   "ffe191a61db8d43c389730f6f2f45fef766b1b88" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/get-series-capture.lisp" "--raw-root"
    "spikes/out/get-series-mutations-f/" "--" "sbcl" "--noinform"
    "--no-userinit" "--no-sysinit" "--script" "tools/get-series-mutation.lisp"
    "--check" "spikes/out/get-series-mutations-f/")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000907598-command-69241-0" :STATUS :OK :EXIT-CODE 0 :FREEZE
   "ffe191a61db8d43c389730f6f2f45fef766b1b88" :COMMAND
   ("git" "diff" "--check" "3106a49" "--" "src" "tests" "tools" "arcdocdb.asd"
    "docs" "CHANGELOG.md")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000907598-command-69270-0" :STATUS :OK :EXIT-CODE 0 :FREEZE
   "ffe191a61db8d43c389730f6f2f45fef766b1b88" :COMMAND
   ("/Applications/Xcode.app/Contents/Developer/usr/bin/make" "check-core")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000907690-command-70216-0" :STATUS :OK :EXIT-CODE 0 :FREEZE
   "ffe191a61db8d43c389730f6f2f45fef766b1b88" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/get-series-capture.lisp" "--raw-root"
    "spikes/out/get-series-self-test-f/" "--" "sbcl" "--noinform"
    "--no-userinit" "--no-sysinit" "--script" "tools/get-series-bench.lisp"
    "--self-test" "spikes/out/get-series-self-test-f/")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000907690-command-70217-0" :STATUS :OK :EXIT-CODE 0 :FREEZE
   "ffe191a61db8d43c389730f6f2f45fef766b1b88" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/get-series-capture.lisp" "--" "sbcl" "--noinform" "--no-userinit"
    "--no-sysinit" "--script" "tools/get-series-capture.lisp" "--self-test")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000907819-command-72353-0" :STATUS :OK :EXIT-CODE 0 :FREEZE
   "ffe191a61db8d43c389730f6f2f45fef766b1b88" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/get-series-capture.lisp" "--raw-root"
    "spikes/out/get-series-bench-f/" "--" "sbcl" "--noinform" "--no-userinit"
    "--no-sysinit" "--script" "tools/get-series-bench.lisp" "--bench"
    "spikes/out/get-series-bench-f/")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000907853-command-72933-0" :STATUS :FAILED :EXIT-CODE 1 :FREEZE
   "ffe191a61db8d43c389730f6f2f45fef766b1b88" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/get-series-capture.lisp" "--" "sbcl" "--noinform" "--no-userinit"
    "--no-sysinit" "--script"
    "spikes/results/2026-10-13-get-fonti-serie/derive-results.lisp"
    "spikes/out/get-series-self-test-f/report.lisp"
    "spikes/results/2026-10-13-get-fonti-serie/rejected-summary.lisp")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000907853-command-72934-0" :STATUS :FAILED :EXIT-CODE 1 :FREEZE
   "ffe191a61db8d43c389730f6f2f45fef766b1b88" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/get-series-capture.lisp" "--" "sbcl" "--noinform" "--no-userinit"
    "--no-sysinit" "--script"
    "spikes/results/2026-10-13-get-fonti-serie/derive-results.lisp"
    "spikes/out/get-series-bench-f/report.lisp"
    "spikes/results/2026-10-13-get-fonti-serie/benchmark-summary.lisp")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000907853-command-72935-0" :STATUS :FAILED :EXIT-CODE 1 :FREEZE
   "ffe191a61db8d43c389730f6f2f45fef766b1b88" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/get-series-capture.lisp" "--raw-root"
    "spikes/out/get-series-bench-negative-f/" "--" "sbcl" "--noinform"
    "--no-userinit" "--no-sysinit" "--script" "tools/get-series-bench.lisp"
    "--negative-record-case" "spikes/out/get-series-bench-negative-f/")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000908027-command-75685-0" :STATUS :OK :EXIT-CODE 0 :FREEZE
   "92fa92b0f44b6675617881fb406039e852b7ab50" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/get-series-capture.lisp" "--raw-root"
    "spikes/out/get-series-coverage-g/" "--" "sbcl" "--noinform"
    "--no-userinit" "--no-sysinit" "--script" "tools/foundation-coverage.lisp"
    "--report" "spikes/out/get-series-coverage-g/" "get-series")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000908027-command-75686-0" :STATUS :OK :EXIT-CODE 0 :FREEZE
   "92fa92b0f44b6675617881fb406039e852b7ab50" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/get-series-capture.lisp" "--raw-root"
    "spikes/out/get-series-mutations-g/" "--" "sbcl" "--noinform"
    "--no-userinit" "--no-sysinit" "--script" "tools/get-series-mutation.lisp"
    "--check" "spikes/out/get-series-mutations-g/")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000908027-command-75687-0" :STATUS :OK :EXIT-CODE 0 :FREEZE
   "92fa92b0f44b6675617881fb406039e852b7ab50" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/get-series-capture.lisp" "--" "sbcl" "--noinform" "--no-userinit"
    "--no-sysinit" "--script"
    "spikes/results/2026-10-13-get-fonti-serie/collect.lisp" "--self-test")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000908027-command-75690-0" :STATUS :OK :EXIT-CODE 0 :FREEZE
   "92fa92b0f44b6675617881fb406039e852b7ab50" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/get-series-capture.lisp" "--" "sbcl" "--noinform" "--no-userinit"
    "--no-sysinit" "--script" "tools/get-series-capture.lisp" "--self-test")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000908027-command-75692-0" :STATUS :FAILED :EXIT-CODE 1 :FREEZE
   "92fa92b0f44b6675617881fb406039e852b7ab50" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/get-series-capture.lisp" "--" "sbcl" "--noinform" "--no-userinit"
    "--no-sysinit" "--script"
    "spikes/results/2026-10-13-get-fonti-serie/derive-results.lisp"
    "spikes/out/get-series-self-test-f/report.lisp"
    "spikes/results/2026-10-13-get-fonti-serie/rejected-summary.lisp")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000908027-command-75738-0" :STATUS :OK :EXIT-CODE 0 :FREEZE
   "92fa92b0f44b6675617881fb406039e852b7ab50" :COMMAND
   ("/Applications/Xcode.app/Contents/Developer/usr/bin/make" "check-core")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000908102-command-77700-0" :STATUS :OK :EXIT-CODE 0 :FREEZE
   "92fa92b0f44b6675617881fb406039e852b7ab50" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/get-series-capture.lisp" "--" "sbcl" "--noinform" "--no-userinit"
    "--no-sysinit" "--script"
    "spikes/results/2026-10-13-get-fonti-serie/derive-results.lisp"
    "spikes/out/get-series-bench-f/report.lisp"
    "spikes/results/2026-10-13-get-fonti-serie/benchmark-summary-f.lisp")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000908102-command-77701-0" :STATUS :OK :EXIT-CODE 0 :FREEZE
   "92fa92b0f44b6675617881fb406039e852b7ab50" :COMMAND
   ("git" "diff" "--check" "baaa68c" "--" "src" "tests" "tools" "arcdocdb.asd"
    "docs" "CHANGELOG.md")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000908261-command-82469-0" :STATUS :OK :EXIT-CODE 0 :FREEZE
   "92fa92b0f44b6675617881fb406039e852b7ab50" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/get-series-capture.lisp" "--raw-root"
    "spikes/out/get-series-self-test-g/" "--" "sbcl" "--noinform"
    "--no-userinit" "--no-sysinit" "--script" "tools/get-series-bench.lisp"
    "--self-test" "spikes/out/get-series-self-test-g/")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000908273-command-82664-0" :STATUS :OK :EXIT-CODE 0 :FREEZE
   "92fa92b0f44b6675617881fb406039e852b7ab50" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/get-series-capture.lisp" "--raw-root"
    "spikes/out/get-series-bench-g/" "--" "sbcl" "--noinform" "--no-userinit"
    "--no-sysinit" "--script" "tools/get-series-bench.lisp" "--bench"
    "spikes/out/get-series-bench-g/")
   :SOURCE-CONSISTENCY :STABLE)
  (:PRODUCER "4000908299-command-83122-0" :STATUS :OK :EXIT-CODE 0 :FREEZE
   "92fa92b0f44b6675617881fb406039e852b7ab50" :COMMAND
   ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
    "tools/get-series-capture.lisp" "--" "sbcl" "--noinform" "--no-userinit"
    "--no-sysinit" "--script"
    "spikes/results/2026-10-13-get-fonti-serie/derive-results.lisp"
    "spikes/out/get-series-bench-g/report.lisp"
    "spikes/results/2026-10-13-get-fonti-serie/benchmark-summary.lisp")
   :SOURCE-CONSISTENCY :STABLE))
 :REVIEW
 (:C1-TWO-READS-ONE-INDEPENDENT-REVIEWER-AND-DELTA-COMPLETED
  :C4-INDEPENDENT-FINAL-REREAD-INCOMPLETE
  :C4-INTEGRATOR-FIXES-AND-RECORDED-CHECKS)
 :CLOSED-AGENTS ("Hilbert" "Raman" "Erdos" "Socrates") :STATIC-FIXES
 (:CACHE-ARITY-BEFORE-FIRST-RUN :BOUNDED-DUPLICATE-SEARCH-GEOMETRY
  :PRESERVE-OWNER-BEFORE-CONTROLLER-HEALTH :RAW-PRODUCER-CAPTURE
  :PROOF-HELPER-BEFORE-AFTER-DIGESTS :NO-OBSOLETE-MUTATION-DIRECTORY-KEY)
 :EARLIER-ATTEMPTS
 ((:FREEZE "51c4c1f" :OBSERVED :FIXTURE-OUTPUT-SENTINEL :FIX "3844d59")
  (:FREEZE "51c4c1f" :OBSERVED :COLLECTOR-CAPTURE-MARKER :FIX "3844d59")
  (:FREEZE "3844d59" :OBSERVED :FIXTURE-LOTTO-OWNED :FIX "5175dc7")
  (:FREEZE "5175dc7" :OBSERVED :FIXTURE-PRIMARY-CSN-NOT-INCREASING :FIX
   "0c8808b")
  (:FREEZE "e6e0497" :OBSERVED :NATIVE-FILE-IDENTITY-INTEGRATION :TESTS-ADDED
   "ffe191a")
  (:FREEZE "ffe191a" :OBSERVED :CAPTURE-CONFUSED-CREATED-OUTPUT-WITH-HELPER
   :FIX :INVOKED-SBCL-SCRIPT-OR-LOAD-ONLY)
  (:FREEZE "ffe191a" :OBSERVED :DERIVED-BASE-CHAR-ARRAY-NOT-CANONICAL :FIX
   :CANONICAL-ESCAPED-STRING-WRITING)
  (:BASE "baaa68c" :OBSERVED :INTEGRATED-42-INDEPENDENT-OUTCOME-TESTS :FREEZE
   "92fa92b" :PRODUCT-READ-BLOBS-UNCHANGED))
 :NEGATIVE-CHECKS
 (:BENCHMARK-MISSING-COMPLETED-EXPECTED-EXIT-1
  :DERIVE-REJECTS-SELF-TEST-INSTEAD-OF-FULL-CAMPAIGN)
 :PATCH-CHECK
 (:OWN-INCREMENT-FROM-BAAA68C-PASSED
  :FULL-BASE-4344D9E-REJECTED-IMPORTED-EOF-BLANK-LINE
  :RAW-COMPILER-WHITESPACE-RETAINED-VERBATIM)
 :COVERAGE
 (:FILES 3 :EXPRESSIONS-COVERED 339 :EXPRESSIONS-TOTAL 363 :BRANCHES-COVERED 41
  :BRANCHES-TOTAL 42 :REMAINING-BRANCH
  :SEARCH-BOUND-IMPOSSIBLE-WITH-VALID-GEOMETRY-AND-FIXED-BUDGET
  :NOT-CONDITION-COVERAGE-OR-MCDC)
 :LIMITS
 (:ATTEMPTS-RETAINED-NOT-PROMOTED :STATIC-DISTINCT-FROM-DYNAMIC-EVIDENCE
  :CLOSED-CONTROLLER-BENCHMARK-ONLY :NO-FULL-DB-C1-QUALIFICATION
  :ACTIVE-EMPTY-BOOTSTRAP-ROTATION-RELOCATION-RECLAIM-NEXT-INCREMENT
  :POINT-IN-TIME-COMMAND-INVENTORY-EXCLUDES-OWN-RUNNING-RECORD))
