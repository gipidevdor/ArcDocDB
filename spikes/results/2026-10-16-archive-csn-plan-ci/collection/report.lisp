(:INDEPENDENT-CLOSURE
 (:EXIT-CODE 0 :SIGNAL NIL :LOG
  #A((137) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/archive-csn-plan/ArcDocDB/spikes/results/2026-10-16-archive-csn-plan-ci/collection/closed-check.log")
  :RESULT
  (:SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-AUDIT :STATUS :OK :ARCHIVE
   "/Users/gpicchiarelli/.codex/worktrees/archive-csn-plan/ArcDocDB/spikes/results/2026-10-16-archive-csn-plan-ci-originals/"
   :INDEXED-FILES 17 :ACTUAL-FILES 19 :INDEXED-BYTES 710471 :PROCESSES
   ((:LABEL "linux-ci-failed" :RECORD-PATH
     "processes/linux-ci-failed/report.lisp" :COMMAND ("make" "check-core")
     :STATUS :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "trace-after-fixture-fix" :RECORD-PATH
     "processes/trace-after-fixture-fix/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/check-trace.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "links-after-fixture-fix" :RECORD-PATH
     "processes/links-after-fixture-fix/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/check-links.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
   :INDEX-SHA256
   "988518305013f5011aa59eeab21ad1cfdd95647bd91cc61e6090ddf9b8ccd5e9"
   :CATALOGUE-SHA256
   "e3a12b9b87994874187a04f1128e4ba16125b8d93c70467e2aac76f71541963a"
   :ORIGINS-COMPARED NIL :CLOSED-INVENTORY T :READ-EVAL NIL :EOF-REQUIRED T
   :LIMITS
   (:PLAIN-BYTES 1048576 :GZIP-BYTES 8388608 :PROCESS-EXPANDED-BYTES 134217728
    :ENTRIES 100000 :DIRECTORY-DEPTH 128 :DIRECTORY-ENUMERATION-NOT-PREBOUNDED
    T :PER-FILE-LOCAL-OBSERVATION T :ATOMIC-PUBLICATION NIL
    :RESULT-OR-GATE-INFERENCE NIL :MCDC-CLAIM NIL)))
 :CLEANUP-ERRORS NIL :WORKER-ERRORS (NIL NIL NIL NIL) :WORKER-COPIED-COUNTS
 (5 1 5 6) :COPY-RESULTS
 ((:STATUS :OK :ENTRY
   (:PATH "raw/finding.lisp" :SOURCE
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archive-csn-plan/ArcDocDB/spikes/results/2026-10-16-archive-csn-plan-ci/finding.lisp")
    :BYTES 945 :SHA256
    "cea3851a71c2a427e05d1bd1b97712af5bec52769fa157bc0d6bfef8013e7070"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/ci-manifest-builder.lisp.txt" :SOURCE
    #A((55) BASE-CHAR
       . "/private/tmp/arcdocdb-archive-csn-plan-ci-manifest.lisp")
    :BYTES 998 :SHA256
    "29cd18f87b1d652e69ec0ff714ffa7d069105bfb7a24c9bc7b607221356abd3b"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/run-metadata.json" :SOURCE
    #A((67) BASE-CHAR
       . "/private/tmp/arcdocdb-archive-csn-plan-ci-38927332158-metadata.json")
    :BYTES 12672 :SHA256
    "09d4edbe7440893c4c811b778f3ad5b0691fbd58d9f308ffd71c763c879c0616"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/linux-ansi-stripped.log" :SOURCE
    #A((69) BASE-CHAR
       . "/private/tmp/arcdocdb-archive-csn-plan-ci-38927332158-linux-clean.log")
    :BYTES 22173 :SHA256
    "8dade4fe121637470a7d66e341e98dd281663b009e0b61a175cf645b04dcc3ec"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/linux-original.log" :SOURCE
    #A((63) BASE-CHAR
       . "/private/tmp/arcdocdb-archive-csn-plan-ci-38927332158-linux.log")
    :BYTES 22338 :SHA256
    "614fe9c7b6af46082fe4c2cb0d4d873454ed7e3d923c66127d9767c69f7213f7"))
  (:STATUS :OK :ENTRY
   (:PATH #A((37) BASE-CHAR . "processes/linux-ci-failed/report.lisp") :SOURCE
    #A((97) BASE-CHAR
       . "/private/tmp/arcdocdb-archive-csn-plan-ci-38927332158-linux/4001154719-command-2440-0/report.lisp")
    :BYTES 317 :SHA256
    "a11841a064d1eaa29acd4d0cef41ad0ecef830440c14e3b5fb769b1ae3f89c1c"))
  (:STATUS :OK :ENTRY
   (:PATH #A((40) BASE-CHAR . "processes/linux-ci-failed/report.lisp.gz")
    :SOURCE
    #A((100) BASE-CHAR
       . "/private/tmp/arcdocdb-archive-csn-plan-ci-38927332158-linux/4001154719-command-2440-0/report.lisp.gz")
    :BYTES 176699 :SHA256
    "ad1a0021a70e58060b14a390f763d6658e3f8c457cb3457e9031f5455ca2165c"))
  (:STATUS :OK :ENTRY
   (:PATH #A((44) BASE-CHAR . "processes/linux-ci-failed/conservazione.lisp")
    :SOURCE
    #A((104) BASE-CHAR
       . "/private/tmp/arcdocdb-archive-csn-plan-ci-38927332158-linux/4001154719-command-2440-0/conservazione.lisp")
    :BYTES 1614 :SHA256
    "3ce8b9460bc244b8b91541385ba47d01a14769bb5065d516a16bdc2e0000a4fd"))
  (:STATUS :OK :ENTRY
   (:PATH #A((45) BASE-CHAR . "processes/trace-after-fixture-fix/report.lisp")
    :SOURCE
    #A((112) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archive-csn-plan/ArcDocDB/spikes/out/4001155027-command-1484-0/report.lisp")
    :BYTES 216563 :SHA256
    "d7ac7249065e5c144ed78662193071e91a265612aa57fcc127b9b71ceb9d7283"))
  (:STATUS :OK :ENTRY
   (:PATH
    #A((52) BASE-CHAR . "processes/trace-after-fixture-fix/conservazione.lisp")
    :SOURCE
    #A((119) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archive-csn-plan/ArcDocDB/spikes/out/4001155027-command-1484-0/conservazione.lisp")
    :BYTES 1150 :SHA256
    "b89a7912c3266038f3dcfdb159886543d99523977177f9c133cbd07fcd8760e2"))
  (:STATUS :OK :ENTRY
   (:PATH #A((45) BASE-CHAR . "processes/links-after-fixture-fix/report.lisp")
    :SOURCE
    #A((112) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archive-csn-plan/ArcDocDB/spikes/out/4001155027-command-1483-0/report.lisp")
    :BYTES 216542 :SHA256
    "a2979b340553ee1ea2c3c8be7f5fe5d8289bc926b0165702d3679ced4bd4a947"))
  (:STATUS :OK :ENTRY
   (:PATH
    #A((52) BASE-CHAR . "processes/links-after-fixture-fix/conservazione.lisp")
    :SOURCE
    #A((119) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archive-csn-plan/ArcDocDB/spikes/out/4001155027-command-1483-0/conservazione.lisp")
    :BYTES 1150 :SHA256
    "969b0f53b215e1f59d20b3231726ddc3241be1bde9a260aa4aab649f429b52f0"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/compile.lisp.txt" :SOURCE
    #A((51) BASE-CHAR . "/private/tmp/arcdocdb-archive-csn-plan-compile.lisp")
    :BYTES 399 :SHA256
    "0239483ad5b47a2d829cb60fdf2d4608ca0f852889f0aafc91f446493b45905a"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/disassemble.lisp.txt" :SOURCE
    #A((55) BASE-CHAR
       . "/private/tmp/arcdocdb-archive-csn-plan-disassemble.lisp")
    :BYTES 671 :SHA256
    "a6180981cdae573286b58ea5ac8e1edf884c2198ade005ceb1d1a41a4ae369dc"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/manifest-builder.lisp.txt" :SOURCE
    #A((52) BASE-CHAR . "/private/tmp/arcdocdb-archive-csn-plan-manifest.lisp")
    :BYTES 1761 :SHA256
    "3b8ba1ee61a80a1ceecadc61fc2d62ea39c26c8f30d8babf63674315a29599a8"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-manifest.lisp" :SOURCE
    #A((60) BASE-CHAR
       . "/private/tmp/arcdocdb-archive-csn-plan-ci-manifest.data.lisp")
    :BYTES 3211 :SHA256
    "f440492587754b2b2d5e97b5a81bc45f2f15a93a4487f611c22d97cd828849ea"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-source.lisp" :SOURCE
    #A((98) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archive-csn-plan/ArcDocDB/tools/collect-command-archive.lisp")
    :BYTES 31268 :SHA256
    "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")))
 :PROCESSES
 ((:LABEL #A((15) BASE-CHAR . "linux-ci-failed") :RECORD-PATH
   #A((37) BASE-CHAR . "processes/linux-ci-failed/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "make") #A((10) BASE-CHAR . "check-core")) :STATUS
   :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((23) BASE-CHAR . "trace-after-fixture-fix") :RECORD-PATH
   #A((45) BASE-CHAR . "processes/trace-after-fixture-fix/report.lisp")
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/check-trace.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((23) BASE-CHAR . "links-after-fixture-fix") :RECORD-PATH
   #A((45) BASE-CHAR . "processes/links-after-fixture-fix/report.lisp")
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/check-links.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :PLANNED-FILES 17 :SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-COLLECTION :STATUS
 :OK :PHASE :COMPLETE :DESTINATION
 #A((120) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/archive-csn-plan/ArcDocDB/spikes/results/2026-10-16-archive-csn-plan-ci-originals/")
 :OBSERVATIONS
 #A((121) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/archive-csn-plan/ArcDocDB/spikes/results/2026-10-16-archive-csn-plan-ci/collection/")
 :WORKERS 4 :SHA-PER-COPY 3 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :COMPLETED-COMMAND-RECORDS-ONLY
  :FRESH-DESTINATION-ONLY :NO-AUTO-SIDECARS-OR-TREES
  :LOCAL-PER-FILE-OBSERVATIONS :NO-ATOMICITY-OR-AUTHENTICATION
  :NO-RESULT-OR-GATE-INFERENCE :NO-MCDC-OR-RELEASE-QUALIFICATION))
