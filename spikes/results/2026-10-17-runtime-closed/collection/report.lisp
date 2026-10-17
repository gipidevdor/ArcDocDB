(:INDEPENDENT-CLOSURE
 (:EXIT-CODE 0 :SIGNAL NIL :LOG
  #A((141) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/runtime-recovered-sources/ArcDocDB/spikes/results/2026-10-17-runtime-closed/collection/closed-check.log")
  :RESULT
  (:SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-AUDIT :STATUS :OK :ARCHIVE
   "/Users/gpicchiarelli/.codex/worktrees/runtime-recovered-sources/ArcDocDB/spikes/results/2026-10-17-runtime-closed-originals/"
   :INDEXED-FILES 19 :ACTUAL-FILES 21 :INDEXED-BYTES 1792409 :PROCESSES
   ((:LABEL "trace-write" :RECORD-PATH "processes/trace-write/report.lisp"
     :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/check-trace.lisp" "--write")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "compile" :RECORD-PATH "processes/compile/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "/tmp/arcdocdb-runtime-closed-compile.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "lint" :RECORD-PATH "processes/lint/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "tools/lint.lisp" "src")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "trace" :RECORD-PATH "processes/trace/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "tools/check-trace.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "links" :RECORD-PATH "processes/links/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "tools/check-links.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "disassemble" :RECORD-PATH "processes/disassemble/report.lisp"
     :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script"
      "/tmp/arcdocdb-runtime-closed-disassemble.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "evidence" :RECORD-PATH "processes/evidence/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "tools/check-evidence.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
   :INDEX-SHA256
   "87c5b28ae745383a39efd787af24eb1fd3b7ca809e45722262adf017a6e22870"
   :CATALOGUE-SHA256
   "90138c35b1470fcc53d3363ba1e9c277c6264ef6912d1c84a63ebcaf804ef7ea"
   :ORIGINS-COMPARED NIL :CLOSED-INVENTORY T :READ-EVAL NIL :EOF-REQUIRED T
   :LIMITS
   (:PLAIN-BYTES 1048576 :GZIP-BYTES 8388608 :PROCESS-EXPANDED-BYTES 134217728
    :ENTRIES 100000 :DIRECTORY-DEPTH 128 :DIRECTORY-ENUMERATION-NOT-PREBOUNDED
    T :PER-FILE-LOCAL-OBSERVATION T :ATOMIC-PUBLICATION NIL
    :RESULT-OR-GATE-INFERENCE NIL :MCDC-CLAIM NIL)))
 :CLEANUP-ERRORS NIL :WORKER-ERRORS (NIL NIL NIL NIL) :WORKER-COPIED-COUNTS
 (6 6 6 1) :COPY-RESULTS
 ((:STATUS :OK :ENTRY
   (:PATH #A((33) BASE-CHAR . "processes/trace-write/report.lisp") :SOURCE
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/runtime-recovered-sources/ArcDocDB/spikes/out/4001217125-command-73589-0/report.lisp")
    :BYTES 244534 :SHA256
    "de4f7c7f1dcb55a21c97bce5c7e7985af598dc699cd573a5385c02759feeaab5"))
  (:STATUS :OK :ENTRY
   (:PATH #A((40) BASE-CHAR . "processes/trace-write/conservazione.lisp")
    :SOURCE
    #A((129) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/runtime-recovered-sources/ArcDocDB/spikes/out/4001217125-command-73589-0/conservazione.lisp")
    :BYTES 1181 :SHA256
    "6704d0ef772bc7d2200f9b21483f56c8c8ebc5e1764786ee46656eebd9961a83"))
  (:STATUS :OK :ENTRY
   (:PATH #A((29) BASE-CHAR . "processes/compile/report.lisp") :SOURCE
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/runtime-recovered-sources/ArcDocDB/spikes/out/4001217124-command-73576-0/report.lisp")
    :BYTES 244422 :SHA256
    "18891500e4930da60d9500148f39c134ca41583df656ddd6aa2156781a702d25"))
  (:STATUS :OK :ENTRY
   (:PATH #A((36) BASE-CHAR . "processes/compile/conservazione.lisp") :SOURCE
    #A((129) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/runtime-recovered-sources/ArcDocDB/spikes/out/4001217124-command-73576-0/conservazione.lisp")
    :BYTES 1181 :SHA256
    "d5d51fc9f5e63f4340b41bbd754257e2ff94c93959f19943fbabd30ffaa27249"))
  (:STATUS :OK :ENTRY
   (:PATH #A((26) BASE-CHAR . "processes/lint/report.lisp") :SOURCE
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/runtime-recovered-sources/ArcDocDB/spikes/out/4001217149-command-73867-0/report.lisp")
    :BYTES 244519 :SHA256
    "c7ce6595652810f6663783f27cae708b94668ac400b3223cd77398e06df55ece"))
  (:STATUS :OK :ENTRY
   (:PATH #A((33) BASE-CHAR . "processes/lint/conservazione.lisp") :SOURCE
    #A((129) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/runtime-recovered-sources/ArcDocDB/spikes/out/4001217149-command-73867-0/conservazione.lisp")
    :BYTES 1181 :SHA256
    "7080a335df32a0d5493cf87b1abca56a089293d46521816b9396d868c9d8b7f4"))
  (:STATUS :OK :ENTRY
   (:PATH #A((27) BASE-CHAR . "processes/trace/report.lisp") :SOURCE
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/runtime-recovered-sources/ArcDocDB/spikes/out/4001217149-command-73869-0/report.lisp")
    :BYTES 244537 :SHA256
    "7e460627ff22e54ddd10a3bd69d23e458d3d68e454a6aa878c60e9aa6311f527"))
  (:STATUS :OK :ENTRY
   (:PATH #A((34) BASE-CHAR . "processes/trace/conservazione.lisp") :SOURCE
    #A((129) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/runtime-recovered-sources/ArcDocDB/spikes/out/4001217149-command-73869-0/conservazione.lisp")
    :BYTES 1180 :SHA256
    "d3743f2c49f48f2d43fb4849a10cf1916e76fbbca0f8239db7667c885cd7f25f"))
  (:STATUS :OK :ENTRY
   (:PATH #A((27) BASE-CHAR . "processes/links/report.lisp") :SOURCE
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/runtime-recovered-sources/ArcDocDB/spikes/out/4001217149-command-73868-0/report.lisp")
    :BYTES 244516 :SHA256
    "1f7b0cb843f37a5ce7e03dea7694df475b543f2dcb9f67fb64efea33fd475b5c"))
  (:STATUS :OK :ENTRY
   (:PATH #A((34) BASE-CHAR . "processes/links/conservazione.lisp") :SOURCE
    #A((129) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/runtime-recovered-sources/ArcDocDB/spikes/out/4001217149-command-73868-0/conservazione.lisp")
    :BYTES 1181 :SHA256
    "dd4e668f19da90bc1b14c601b9aedcc891535d62423185f344588e999a999199"))
  (:STATUS :OK :ENTRY
   (:PATH #A((33) BASE-CHAR . "processes/disassemble/report.lisp") :SOURCE
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/runtime-recovered-sources/ArcDocDB/spikes/out/4001217149-command-73870-0/report.lisp")
    :BYTES 278367 :SHA256
    "d1c19f41d596c1641c4817929e1c818cc5dda347a4052273c4268ed5af30e962"))
  (:STATUS :OK :ENTRY
   (:PATH #A((40) BASE-CHAR . "processes/disassemble/conservazione.lisp")
    :SOURCE
    #A((129) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/runtime-recovered-sources/ArcDocDB/spikes/out/4001217149-command-73870-0/conservazione.lisp")
    :BYTES 1181 :SHA256
    "646829c827e8f10a4e1db513a586c31f7987a3877792920b493582d91c23f872"))
  (:STATUS :OK :ENTRY
   (:PATH #A((30) BASE-CHAR . "processes/evidence/report.lisp") :SOURCE
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/runtime-recovered-sources/ArcDocDB/spikes/out/4001217149-command-73871-0/report.lisp")
    :BYTES 244809 :SHA256
    "e5ea78fb05938172d2d0d8be82897c43e23d957eb60ff71ca02de5b522cd9506"))
  (:STATUS :OK :ENTRY
   (:PATH #A((37) BASE-CHAR . "processes/evidence/conservazione.lisp") :SOURCE
    #A((129) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/runtime-recovered-sources/ArcDocDB/spikes/out/4001217149-command-73871-0/conservazione.lisp")
    :BYTES 1181 :SHA256
    "7318c953d70ed31fcb158f5d87cedb2e55bf4e7d20f8d761396949b16e6a70e4"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/compile.lisp.txt" :SOURCE
    #A((49) BASE-CHAR . "/private/tmp/arcdocdb-runtime-closed-compile.lisp")
    :BYTES 399 :SHA256
    "0239483ad5b47a2d829cb60fdf2d4608ca0f852889f0aafc91f446493b45905a"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/disassemble.lisp.txt" :SOURCE
    #A((53) BASE-CHAR
       . "/private/tmp/arcdocdb-runtime-closed-disassemble.lisp")
    :BYTES 482 :SHA256
    "4fcdcb89498965b6d448ba73a857e791586ba77edaed088ad3c1877d66e60a63"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/manifest-builder.lisp.txt" :SOURCE
    #A((50) BASE-CHAR . "/private/tmp/arcdocdb-runtime-closed-manifest.lisp")
    :BYTES 1755 :SHA256
    "c5d0142de14225329de6e3ad3cd396a1472b9b13523a91c54a66baf9fd28a93f"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-manifest.lisp" :SOURCE
    #A((55) BASE-CHAR
       . "/private/tmp/arcdocdb-runtime-closed-manifest-data.lisp")
    :BYTES 4535 :SHA256
    "69f106d8535d527540154773856ee90c90029bf93abedc04f1d7f84ce1603d4d"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-source.lisp" :SOURCE
    #A((107) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/runtime-recovered-sources/ArcDocDB/tools/collect-command-archive.lisp")
    :BYTES 31268 :SHA256
    "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")))
 :PROCESSES
 ((:LABEL #A((11) BASE-CHAR . "trace-write") :RECORD-PATH
   #A((33) BASE-CHAR . "processes/trace-write/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/check-trace.lisp")
    #A((7) BASE-CHAR . "--write"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((7) BASE-CHAR . "compile") :RECORD-PATH
   #A((29) BASE-CHAR . "processes/compile/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((41) BASE-CHAR . "/tmp/arcdocdb-runtime-closed-compile.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((4) BASE-CHAR . "lint") :RECORD-PATH
   #A((26) BASE-CHAR . "processes/lint/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((15) BASE-CHAR . "tools/lint.lisp")
    #A((3) BASE-CHAR . "src"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((5) BASE-CHAR . "trace") :RECORD-PATH
   #A((27) BASE-CHAR . "processes/trace/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/check-trace.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((5) BASE-CHAR . "links") :RECORD-PATH
   #A((27) BASE-CHAR . "processes/links/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/check-links.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((11) BASE-CHAR . "disassemble") :RECORD-PATH
   #A((33) BASE-CHAR . "processes/disassemble/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((45) BASE-CHAR . "/tmp/arcdocdb-runtime-closed-disassemble.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((8) BASE-CHAR . "evidence") :RECORD-PATH
   #A((30) BASE-CHAR . "processes/evidence/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((25) BASE-CHAR . "tools/check-evidence.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :PLANNED-FILES 19 :SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-COLLECTION :STATUS
 :OK :PHASE :COMPLETE :DESTINATION
 #A((124) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/runtime-recovered-sources/ArcDocDB/spikes/results/2026-10-17-runtime-closed-originals/")
 :OBSERVATIONS
 #A((125) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/runtime-recovered-sources/ArcDocDB/spikes/results/2026-10-17-runtime-closed/collection/")
 :WORKERS 4 :SHA-PER-COPY 3 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :COMPLETED-COMMAND-RECORDS-ONLY
  :FRESH-DESTINATION-ONLY :NO-AUTO-SIDECARS-OR-TREES
  :LOCAL-PER-FILE-OBSERVATIONS :NO-ATOMICITY-OR-AUTHENTICATION
  :NO-RESULT-OR-GATE-INFERENCE :NO-MCDC-OR-RELEASE-QUALIFICATION))
