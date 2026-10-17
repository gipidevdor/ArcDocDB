(:INDEPENDENT-CLOSURE
 (:EXIT-CODE 0 :SIGNAL NIL :LOG
  #A((152) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/results/2026-10-17-recovery-name-stabilization/collection/closed-check.log")
  :RESULT
  (:SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-AUDIT :STATUS :OK :ARCHIVE
   "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/results/2026-10-17-recovery-name-stabilization-originals/"
   :INDEXED-FILES 19 :ACTUAL-FILES 21 :INDEXED-BYTES 1943537 :PROCESSES
   ((:LABEL "compile" :RECORD-PATH "processes/compile/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "/tmp/arcdocdb-name-stabilization-compile.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "compile-final" :RECORD-PATH "processes/compile-final/report.lisp"
     :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "/tmp/arcdocdb-name-stabilization-compile.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "trace-write" :RECORD-PATH "processes/trace-write/report.lisp"
     :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/check-trace.lisp" "--write")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "lint" :RECORD-PATH "processes/lint/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/lint.lisp" "src")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "trace" :RECORD-PATH "processes/trace/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/check-trace.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "links" :RECORD-PATH "processes/links/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/check-links.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "disassemble" :RECORD-PATH "processes/disassemble/report.lisp"
     :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "/tmp/arcdocdb-name-stabilization-disassemble.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
   :INDEX-SHA256
   "edf0fbdc062a4bbeab3c6924de105ce3724e659c9089825aa9e31db0e4832889"
   :CATALOGUE-SHA256
   "699435f7e64661325d52cf154818075f891ba61fffe6f519c7c5701c535349d6"
   :ORIGINS-COMPARED NIL :CLOSED-INVENTORY T :READ-EVAL NIL :EOF-REQUIRED T
   :LIMITS
   (:PLAIN-BYTES 1048576 :GZIP-BYTES 8388608 :PROCESS-EXPANDED-BYTES 134217728
    :ENTRIES 100000 :DIRECTORY-DEPTH 128 :DIRECTORY-ENUMERATION-NOT-PREBOUNDED
    T :PER-FILE-LOCAL-OBSERVATION T :ATOMIC-PUBLICATION NIL
    :RESULT-OR-GATE-INFERENCE NIL :MCDC-CLAIM NIL)))
 :CLEANUP-ERRORS NIL :WORKER-ERRORS (NIL NIL NIL NIL) :WORKER-COPIED-COUNTS
 (6 6 1 6) :COPY-RESULTS
 ((:STATUS :OK :ENTRY
   (:PATH #A((29) BASE-CHAR . "processes/compile/report.lisp") :SOURCE
    #A((129) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-name-stabilization/compile/report.lisp")
    :BYTES 263952 :SHA256
    "aa98fc7e4b5f8bbe009c648fa4286246d2b1db1313716c58458ea87cd72a8b92"))
  (:STATUS :OK :ENTRY
   (:PATH #A((36) BASE-CHAR . "processes/compile/conservazione.lisp") :SOURCE
    #A((136) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-name-stabilization/compile/conservazione.lisp")
    :BYTES 1192 :SHA256
    "46e3fdca6f1a536d9bf5a7e576ad6026b0a3cf449b325dd9471298e58e2687bd"))
  (:STATUS :OK :ENTRY
   (:PATH #A((35) BASE-CHAR . "processes/compile-final/report.lisp") :SOURCE
    #A((135) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-name-stabilization/compile-final/report.lisp")
    :BYTES 263952 :SHA256
    "822016201b8ac8b760e4d956fd9900a8a3e9986d3593d2b5ed8766d5abc24055"))
  (:STATUS :OK :ENTRY
   (:PATH #A((42) BASE-CHAR . "processes/compile-final/conservazione.lisp")
    :SOURCE
    #A((142) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-name-stabilization/compile-final/conservazione.lisp")
    :BYTES 1204 :SHA256
    "2c22d1bbc82e153ea2169a148d81ce80fa9ce6a7a477511d6fc3e4427c5487e3"))
  (:STATUS :OK :ENTRY
   (:PATH #A((33) BASE-CHAR . "processes/trace-write/report.lisp") :SOURCE
    #A((133) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-name-stabilization/trace-write/report.lisp")
    :BYTES 264060 :SHA256
    "e759ed7df4218b69bcf4c65663843d207cdc0c6ff34b93096a56700ff1d4b370"))
  (:STATUS :OK :ENTRY
   (:PATH #A((40) BASE-CHAR . "processes/trace-write/conservazione.lisp")
    :SOURCE
    #A((140) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-name-stabilization/trace-write/conservazione.lisp")
    :BYTES 1200 :SHA256
    "942ecf9dabb849a3351808669d83025a263855509e219d64895b96cf532b823d"))
  (:STATUS :OK :ENTRY
   (:PATH #A((26) BASE-CHAR . "processes/lint/report.lisp") :SOURCE
    #A((126) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-name-stabilization/lint/report.lisp")
    :BYTES 263972 :SHA256
    "fba8d59563a292121605294e630873852af53bbca5c9e854fd1392d2f7670a8f"))
  (:STATUS :OK :ENTRY
   (:PATH #A((33) BASE-CHAR . "processes/lint/conservazione.lisp") :SOURCE
    #A((133) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-name-stabilization/lint/conservazione.lisp")
    :BYTES 1186 :SHA256
    "75cde8a3c722d060380ada16a15b379d4defe48dd54cfa7080b59de214402951"))
  (:STATUS :OK :ENTRY
   (:PATH #A((27) BASE-CHAR . "processes/trace/report.lisp") :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-name-stabilization/trace/report.lisp")
    :BYTES 263990 :SHA256
    "a074ff280b55d2fa6a3bfbfc4f1e8c30acebf9ab2ed56513682337124992445c"))
  (:STATUS :OK :ENTRY
   (:PATH #A((34) BASE-CHAR . "processes/trace/conservazione.lisp") :SOURCE
    #A((134) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-name-stabilization/trace/conservazione.lisp")
    :BYTES 1188 :SHA256
    "15c6eacc9ee576cde906aeb3d74a7ae6957307c2603ff26440ec695340cd5bd2"))
  (:STATUS :OK :ENTRY
   (:PATH #A((27) BASE-CHAR . "processes/links/report.lisp") :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-name-stabilization/links/report.lisp")
    :BYTES 263969 :SHA256
    "ea8959ae02237351202616be2208dc6eb725baf684ad975d556d6c116262e2df"))
  (:STATUS :OK :ENTRY
   (:PATH #A((34) BASE-CHAR . "processes/links/conservazione.lisp") :SOURCE
    #A((134) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-name-stabilization/links/conservazione.lisp")
    :BYTES 1188 :SHA256
    "66d5cbc226572f70ea9fd794ebec51194e9f1612e1532bb43449044e349418f4"))
  (:STATUS :OK :ENTRY
   (:PATH #A((33) BASE-CHAR . "processes/disassemble/report.lisp") :SOURCE
    #A((133) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-name-stabilization/disassemble/report.lisp")
    :BYTES 312563 :SHA256
    "f991327a4ce721e1cd98215d63efd99e862505fc9749dac5d1b39e41cb4f5df7"))
  (:STATUS :OK :ENTRY
   (:PATH #A((40) BASE-CHAR . "processes/disassemble/conservazione.lisp")
    :SOURCE
    #A((140) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-name-stabilization/disassemble/conservazione.lisp")
    :BYTES 1200 :SHA256
    "f05a35ae8c31c33c85c46c4a993f8b8e455b0259221d2cd31e731efec9787f9c"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/compile.lisp.txt" :SOURCE
    #A((53) BASE-CHAR
       . "/private/tmp/arcdocdb-name-stabilization-compile.lisp")
    :BYTES 399 :SHA256
    "0239483ad5b47a2d829cb60fdf2d4608ca0f852889f0aafc91f446493b45905a"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/disassemble.lisp.txt" :SOURCE
    #A((57) BASE-CHAR
       . "/private/tmp/arcdocdb-name-stabilization-disassemble.lisp")
    :BYTES 601 :SHA256
    "630a343fcb3d471503a8fa95e94e2d26f3daae95cf38b23841c6e7c72ff8fd0e"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/manifest-builder.lisp.txt" :SOURCE
    #A((54) BASE-CHAR
       . "/private/tmp/arcdocdb-name-stabilization-manifest.lisp")
    :BYTES 1767 :SHA256
    "255cfc8e9c5b406db41c2439dc90fd1d6ba29bcd56b086de0a5eb96c056220c4"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-manifest.lisp" :SOURCE
    #A((52) BASE-CHAR . "/private/tmp/arcdocdb-name-stabilization-inputs.lisp")
    :BYTES 4686 :SHA256
    "420c02b32b841490eb35b47eeccb4131938e701cc33ce86b953de32e93f39bba"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-source.lisp" :SOURCE
    #A((105) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/tools/collect-command-archive.lisp")
    :BYTES 31268 :SHA256
    "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")))
 :PROCESSES
 ((:LABEL #A((7) BASE-CHAR . "compile") :RECORD-PATH
   #A((29) BASE-CHAR . "processes/compile/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((45) BASE-CHAR . "/tmp/arcdocdb-name-stabilization-compile.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((13) BASE-CHAR . "compile-final") :RECORD-PATH
   #A((35) BASE-CHAR . "processes/compile-final/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((45) BASE-CHAR . "/tmp/arcdocdb-name-stabilization-compile.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((11) BASE-CHAR . "trace-write") :RECORD-PATH
   #A((33) BASE-CHAR . "processes/trace-write/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/check-trace.lisp")
    #A((7) BASE-CHAR . "--write"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((4) BASE-CHAR . "lint") :RECORD-PATH
   #A((26) BASE-CHAR . "processes/lint/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((15) BASE-CHAR . "tools/lint.lisp")
    #A((3) BASE-CHAR . "src"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((5) BASE-CHAR . "trace") :RECORD-PATH
   #A((27) BASE-CHAR . "processes/trace/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/check-trace.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((5) BASE-CHAR . "links") :RECORD-PATH
   #A((27) BASE-CHAR . "processes/links/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/check-links.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((11) BASE-CHAR . "disassemble") :RECORD-PATH
   #A((33) BASE-CHAR . "processes/disassemble/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((49) BASE-CHAR . "/tmp/arcdocdb-name-stabilization-disassemble.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :PLANNED-FILES 19 :SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-COLLECTION :STATUS
 :OK :PHASE :COMPLETE :DESTINATION
 #A((135) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/results/2026-10-17-recovery-name-stabilization-originals/")
 :OBSERVATIONS
 #A((136) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/results/2026-10-17-recovery-name-stabilization/collection/")
 :WORKERS 4 :SHA-PER-COPY 3 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :COMPLETED-COMMAND-RECORDS-ONLY
  :FRESH-DESTINATION-ONLY :NO-AUTO-SIDECARS-OR-TREES
  :LOCAL-PER-FILE-OBSERVATIONS :NO-ATOMICITY-OR-AUTHENTICATION
  :NO-RESULT-OR-GATE-INFERENCE :NO-MCDC-OR-RELEASE-QUALIFICATION))
