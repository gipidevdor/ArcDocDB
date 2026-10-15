(:INDEPENDENT-CLOSURE
 (:EXIT-CODE 0 :SIGNAL NIL :LOG
  #A((126) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/results/2026-10-15-recovery-csn/collection/closed-check.log")
  :RESULT
  (:SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-AUDIT :STATUS :OK :ARCHIVE
   "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/results/2026-10-15-recovery-csn-originals/"
   :INDEXED-FILES 41 :ACTUAL-FILES 43 :INDEXED-BYTES 3937588 :PROCESSES
   ((:LABEL "trace-write-initial" :RECORD-PATH
     "processes/trace-write-initial/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/check-trace.lisp" "--write")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "compile-failed-reader" :RECORD-PATH
     "processes/compile-failed-reader/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "/tmp/arcdocdb-recovery-csn-compile.lisp")
     :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "compile-failed-symbol" :RECORD-PATH
     "processes/compile-failed-symbol/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "/tmp/arcdocdb-recovery-csn-compile.lisp")
     :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "lint-initial" :RECORD-PATH "processes/lint-initial/report.lisp"
     :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/lint.lisp" "src")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "trace-initial" :RECORD-PATH "processes/trace-initial/report.lisp"
     :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/check-trace.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "links-initial" :RECORD-PATH "processes/links-initial/report.lisp"
     :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/check-links.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "compile-fixed" :RECORD-PATH "processes/compile-fixed/report.lisp"
     :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "/tmp/arcdocdb-recovery-csn-compile.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "disassembly-fixed" :RECORD-PATH
     "processes/disassembly-fixed/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "/tmp/arcdocdb-recovery-csn-disassemble.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "lint-fixed" :RECORD-PATH "processes/lint-fixed/report.lisp"
     :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/lint.lisp" "src")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "trace-fixed" :RECORD-PATH "processes/trace-fixed/report.lisp"
     :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/check-trace.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "links-fixed" :RECORD-PATH "processes/links-fixed/report.lisp"
     :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/check-links.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "evidence-before-collection" :RECORD-PATH
     "processes/evidence-before-collection/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "tools/check-evidence.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "trace-write-final" :RECORD-PATH
     "processes/trace-write-final/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/check-trace.lisp" "--write")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "compile-final" :RECORD-PATH "processes/compile-final/report.lisp"
     :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "/tmp/arcdocdb-recovery-csn-compile.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "lint-final" :RECORD-PATH "processes/lint-final/report.lisp"
     :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/lint.lisp" "src")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "trace-final" :RECORD-PATH "processes/trace-final/report.lisp"
     :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/check-trace.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "links-final" :RECORD-PATH "processes/links-final/report.lisp"
     :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/check-links.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "disassembly-final" :RECORD-PATH
     "processes/disassembly-final/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "/tmp/arcdocdb-recovery-csn-disassemble.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
   :INDEX-SHA256
   "2a9dd80b4e2a0bc14aefd66ce04d147c47375c7c9a5116d24ee529331aeda0aa"
   :CATALOGUE-SHA256
   "8002479a5cf34138bbb230857c7fff0a2defda85fb7763a000122a0496137c6e"
   :ORIGINS-COMPARED NIL :CLOSED-INVENTORY T :READ-EVAL NIL :EOF-REQUIRED T
   :LIMITS
   (:PLAIN-BYTES 1048576 :GZIP-BYTES 8388608 :PROCESS-EXPANDED-BYTES 134217728
    :ENTRIES 100000 :DIRECTORY-DEPTH 128 :DIRECTORY-ENUMERATION-NOT-PREBOUNDED
    T :PER-FILE-LOCAL-OBSERVATION T :ATOMIC-PUBLICATION NIL
    :RESULT-OR-GATE-INFERENCE NIL :MCDC-CLAIM NIL)))
 :CLEANUP-ERRORS NIL :WORKER-ERRORS (NIL NIL NIL NIL) :WORKER-COPIED-COUNTS
 (13 13 12 3) :COPY-RESULTS
 ((:STATUS :OK :ENTRY
   (:PATH #A((41) BASE-CHAR . "processes/trace-write-initial/report.lisp")
    :SOURCE
    #A((109) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001084619-command-25117-0/report.lisp")
    :BYTES 209631 :SHA256
    "81d9227c670bfcb733d2c035bd1faccb3892cf21badd7ebcade28d7d4974d651"))
  (:STATUS :OK :ENTRY
   (:PATH
    #A((48) BASE-CHAR . "processes/trace-write-initial/conservazione.lisp")
    :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001084619-command-25117-0/conservazione.lisp")
    :BYTES 1139 :SHA256
    "6a0af8120a4d1aef4fcf521fed348dcdf7b6e76777d27acde858d43b38f0e210"))
  (:STATUS :OK :ENTRY
   (:PATH #A((43) BASE-CHAR . "processes/compile-failed-reader/report.lisp")
    :SOURCE
    #A((109) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001084631-command-25443-0/report.lisp")
    :BYTES 216838 :SHA256
    "c689b68775f491521ab77815fdf544ae4f6b7c9da6faa40942ba644e8086fc88"))
  (:STATUS :OK :ENTRY
   (:PATH
    #A((50) BASE-CHAR . "processes/compile-failed-reader/conservazione.lisp")
    :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001084631-command-25443-0/conservazione.lisp")
    :BYTES 1139 :SHA256
    "95a9369e6334711ea7635e0229dcf00aed337bd56dae81e1a27df89f138d05ea"))
  (:STATUS :OK :ENTRY
   (:PATH #A((43) BASE-CHAR . "processes/compile-failed-symbol/report.lisp")
    :SOURCE
    #A((109) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001084663-command-25841-0/report.lisp")
    :BYTES 216897 :SHA256
    "7c88ca24d2e081e9f687adab2995e708bde63fa115875f6477ae0d89d733c61a"))
  (:STATUS :OK :ENTRY
   (:PATH
    #A((50) BASE-CHAR . "processes/compile-failed-symbol/conservazione.lisp")
    :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001084663-command-25841-0/conservazione.lisp")
    :BYTES 1139 :SHA256
    "5b10278c6c6b9b3c8a5b8c67734a955e2fbe0c6069f36cef389f1d2c3c361999"))
  (:STATUS :OK :ENTRY
   (:PATH #A((34) BASE-CHAR . "processes/lint-initial/report.lisp") :SOURCE
    #A((109) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001084670-command-25914-0/report.lisp")
    :BYTES 209543 :SHA256
    "e8a82e505a3b8081ba64769313f3b30481a269f4cf3f0619e91b2d299b738260"))
  (:STATUS :OK :ENTRY
   (:PATH #A((41) BASE-CHAR . "processes/lint-initial/conservazione.lisp")
    :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001084670-command-25914-0/conservazione.lisp")
    :BYTES 1139 :SHA256
    "e6cf3be6259a22b6a485420cddaa56d7c0f2ce48c62cf9c38e1816cfa833f688"))
  (:STATUS :OK :ENTRY
   (:PATH #A((35) BASE-CHAR . "processes/trace-initial/report.lisp") :SOURCE
    #A((109) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001084670-command-25915-0/report.lisp")
    :BYTES 209561 :SHA256
    "a893b92ab4ecc3b22824a51fdf395a026e5f6112b33daf3493df1f684fe29087"))
  (:STATUS :OK :ENTRY
   (:PATH #A((42) BASE-CHAR . "processes/trace-initial/conservazione.lisp")
    :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001084670-command-25915-0/conservazione.lisp")
    :BYTES 1139 :SHA256
    "151b97b43b8c678c543ad84b5ad288cab787dc80b07c344deb688f5da0a9898a"))
  (:STATUS :OK :ENTRY
   (:PATH #A((35) BASE-CHAR . "processes/links-initial/report.lisp") :SOURCE
    #A((109) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001084670-command-25916-0/report.lisp")
    :BYTES 209540 :SHA256
    "79c8768ee5535918c6f0081a4c82763a6b0ac306ea648548c9e3f7dde1fd933d"))
  (:STATUS :OK :ENTRY
   (:PATH #A((42) BASE-CHAR . "processes/links-initial/conservazione.lisp")
    :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001084670-command-25916-0/conservazione.lisp")
    :BYTES 1139 :SHA256
    "1214e4c05e6ff3fca02e1c5fa60304bebd2f30e3815c1cb66f3905c73b061500"))
  (:STATUS :OK :ENTRY
   (:PATH #A((35) BASE-CHAR . "processes/compile-fixed/report.lisp") :SOURCE
    #A((109) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001084698-command-26398-0/report.lisp")
    :BYTES 209517 :SHA256
    "d94878154f7b745f5b80f2ffbf32517fa8723a8e6295d7655ecc9d41949216ba"))
  (:STATUS :OK :ENTRY
   (:PATH #A((42) BASE-CHAR . "processes/compile-fixed/conservazione.lisp")
    :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001084698-command-26398-0/conservazione.lisp")
    :BYTES 1139 :SHA256
    "2bfd7bad444610c571213306fcd87c1f8b613b667b462593dfc1516a7c50d0e3"))
  (:STATUS :OK :ENTRY
   (:PATH #A((39) BASE-CHAR . "processes/disassembly-fixed/report.lisp")
    :SOURCE
    #A((109) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001084728-command-27007-0/report.lisp")
    :BYTES 251907 :SHA256
    "50606d644f1c47f0978f606ecc9de8ee5faf4c3dc2acce68005d853d263b1384"))
  (:STATUS :OK :ENTRY
   (:PATH #A((46) BASE-CHAR . "processes/disassembly-fixed/conservazione.lisp")
    :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001084728-command-27007-0/conservazione.lisp")
    :BYTES 1139 :SHA256
    "c814d7cffff197d03fb98dbaf03e705f2e52f0a813a22b366df58e587c8835cc"))
  (:STATUS :OK :ENTRY
   (:PATH #A((32) BASE-CHAR . "processes/lint-fixed/report.lisp") :SOURCE
    #A((109) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001084728-command-27006-0/report.lisp")
    :BYTES 209543 :SHA256
    "2e0e8fe8c11e4d8395539eb9929a6be727fcab1a4957896f1322f0de473d786c"))
  (:STATUS :OK :ENTRY
   (:PATH #A((39) BASE-CHAR . "processes/lint-fixed/conservazione.lisp")
    :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001084728-command-27006-0/conservazione.lisp")
    :BYTES 1139 :SHA256
    "be96ff44e9e555c7d68777936196b4a9a315b2295ce214b390d97d9554db2af8"))
  (:STATUS :OK :ENTRY
   (:PATH #A((33) BASE-CHAR . "processes/trace-fixed/report.lisp") :SOURCE
    #A((109) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001084728-command-27008-0/report.lisp")
    :BYTES 209561 :SHA256
    "7f55e1796c4151d25638651c8881af38ea7549289df721ee23557c3ab4984610"))
  (:STATUS :OK :ENTRY
   (:PATH #A((40) BASE-CHAR . "processes/trace-fixed/conservazione.lisp")
    :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001084728-command-27008-0/conservazione.lisp")
    :BYTES 1139 :SHA256
    "d4ba4f2670d4240c409de4980752a50879efbdad4d92f550b1e0336622b96e56"))
  (:STATUS :OK :ENTRY
   (:PATH #A((33) BASE-CHAR . "processes/links-fixed/report.lisp") :SOURCE
    #A((109) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001084728-command-27009-0/report.lisp")
    :BYTES 209540 :SHA256
    "c562e1a1cd94f7b192be75c371fd27cbdf24eb9b4d86999eddb5c56eba0a3edf"))
  (:STATUS :OK :ENTRY
   (:PATH #A((40) BASE-CHAR . "processes/links-fixed/conservazione.lisp")
    :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001084728-command-27009-0/conservazione.lisp")
    :BYTES 1139 :SHA256
    "cf55636415fbf6f78644168c19e14b2b2d357c5a644fadbb2d2e8addbd752fec"))
  (:STATUS :OK :ENTRY
   (:PATH
    #A((48) BASE-CHAR . "processes/evidence-before-collection/report.lisp")
    :SOURCE
    #A((109) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001084728-command-27005-0/report.lisp")
    :BYTES 209771 :SHA256
    "231ce6b9d064f078e8db34b3a72803ff01047a030b2ab641a7cf591cf59bb89e"))
  (:STATUS :OK :ENTRY
   (:PATH
    #A((55) BASE-CHAR
       . "processes/evidence-before-collection/conservazione.lisp")
    :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001084728-command-27005-0/conservazione.lisp")
    :BYTES 1139 :SHA256
    "18ebf86d5beb512269e2938cfa52cbf1810ec6f00173944820b78c28085e37b0"))
  (:STATUS :OK :ENTRY
   (:PATH #A((39) BASE-CHAR . "processes/trace-write-final/report.lisp")
    :SOURCE
    #A((109) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001084986-command-31333-0/report.lisp")
    :BYTES 209899 :SHA256
    "b535ed49636f9d23b8e712d1489969387f03753bc5872179536618b565ca198c"))
  (:STATUS :OK :ENTRY
   (:PATH #A((46) BASE-CHAR . "processes/trace-write-final/conservazione.lisp")
    :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001084986-command-31333-0/conservazione.lisp")
    :BYTES 1139 :SHA256
    "0f2dccc38723709fd3fedfe15f1b0c3f7f02056ec03b6b6480c80ef97db035f7"))
  (:STATUS :OK :ENTRY
   (:PATH #A((35) BASE-CHAR . "processes/compile-final/report.lisp") :SOURCE
    #A((109) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001084996-command-31568-0/report.lisp")
    :BYTES 209517 :SHA256
    "0b9e51b8c4381bd241cd7f44d42061bf0cb8372e82d110d203ae8c24a37032c9"))
  (:STATUS :OK :ENTRY
   (:PATH #A((42) BASE-CHAR . "processes/compile-final/conservazione.lisp")
    :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001084996-command-31568-0/conservazione.lisp")
    :BYTES 1139 :SHA256
    "97cb8241212ee672dce923006c23666c81de5ec92ac571b0977fbdb6d83ddf22"))
  (:STATUS :OK :ENTRY
   (:PATH #A((32) BASE-CHAR . "processes/lint-final/report.lisp") :SOURCE
    #A((109) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001085004-command-31720-0/report.lisp")
    :BYTES 209544 :SHA256
    "ee9441f9f80ed894331e2964b26098b7c4b6e17d8cfca8065e1fa73315175d14"))
  (:STATUS :OK :ENTRY
   (:PATH #A((39) BASE-CHAR . "processes/lint-final/conservazione.lisp")
    :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001085004-command-31720-0/conservazione.lisp")
    :BYTES 1139 :SHA256
    "23f444e5630f14ac865d1e168d37e0f0ea9d36ae2a565b674d8c27a0775fd458"))
  (:STATUS :OK :ENTRY
   (:PATH #A((33) BASE-CHAR . "processes/trace-final/report.lisp") :SOURCE
    #A((109) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001085004-command-31721-0/report.lisp")
    :BYTES 209563 :SHA256
    "29700c459c5e14647f78d3dbe08de967ad2068e705abab2b19c67a0451d3ff13"))
  (:STATUS :OK :ENTRY
   (:PATH #A((40) BASE-CHAR . "processes/trace-final/conservazione.lisp")
    :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001085004-command-31721-0/conservazione.lisp")
    :BYTES 1139 :SHA256
    "96e08b3dd5fe400d2d4505c3f0d3023443eed010a5895221d86c453152585a7f"))
  (:STATUS :OK :ENTRY
   (:PATH #A((33) BASE-CHAR . "processes/links-final/report.lisp") :SOURCE
    #A((109) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001085004-command-31723-0/report.lisp")
    :BYTES 209541 :SHA256
    "3a2ed4d7d7d226c6669d5cbe21d847288400ea603c83e5e253a68bf2936ed17e"))
  (:STATUS :OK :ENTRY
   (:PATH #A((40) BASE-CHAR . "processes/links-final/conservazione.lisp")
    :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001085004-command-31723-0/conservazione.lisp")
    :BYTES 1139 :SHA256
    "8e7e9b834b0c9a5f5118a37a8ab2be552452969f648f5b8e7756beb3a609e3bd"))
  (:STATUS :OK :ENTRY
   (:PATH #A((39) BASE-CHAR . "processes/disassembly-final/report.lisp")
    :SOURCE
    #A((109) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001085015-command-31929-0/report.lisp")
    :BYTES 252051 :SHA256
    "04098466be7a095f9d47574279c67d54669378482314e44b70cada71cd7022f4"))
  (:STATUS :OK :ENTRY
   (:PATH #A((46) BASE-CHAR . "processes/disassembly-final/conservazione.lisp")
    :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/out/4001085015-command-31929-0/conservazione.lisp")
    :BYTES 1139 :SHA256
    "23f39297c84db4dcf465cff6374287aa10f03a1fc20588e3bed1ef68e299151c"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/compile.lisp.txt" :SOURCE
    #A((47) BASE-CHAR . "/private/tmp/arcdocdb-recovery-csn-compile.lisp")
    :BYTES 399 :SHA256
    "0239483ad5b47a2d829cb60fdf2d4608ca0f852889f0aafc91f446493b45905a"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/disassemble.lisp.txt" :SOURCE
    #A((51) BASE-CHAR . "/private/tmp/arcdocdb-recovery-csn-disassemble.lisp")
    :BYTES 632 :SHA256
    "3570ce0f87610e1fc9d7ead74b65caa91e811c9c9db22a0ad0487bc16c194335"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/manifest-builder.lisp.txt" :SOURCE
    #A((48) BASE-CHAR . "/private/tmp/arcdocdb-recovery-csn-manifest.lisp")
    :BYTES 1749 :SHA256
    "3c9a67f048b5242cf85cd70ddf847c8335f06aae35e75fad8f7e690d888033fc"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-manifest.lisp" :SOURCE
    #A((53) BASE-CHAR
       . "/private/tmp/arcdocdb-recovery-csn-manifest.data.lisp")
    :BYTES 11074 :SHA256
    "3e227ea91a165846bfa179781d84a4eb99f92523c295635b9ba7abf056ab58da"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-source.lisp" :SOURCE
    #A((94) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/tools/collect-command-archive.lisp")
    :BYTES 31268 :SHA256
    "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")))
 :PROCESSES
 ((:LABEL #A((19) BASE-CHAR . "trace-write-initial") :RECORD-PATH
   #A((41) BASE-CHAR . "processes/trace-write-initial/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/check-trace.lisp")
    #A((7) BASE-CHAR . "--write"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((21) BASE-CHAR . "compile-failed-reader") :RECORD-PATH
   #A((43) BASE-CHAR . "processes/compile-failed-reader/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((39) BASE-CHAR . "/tmp/arcdocdb-recovery-csn-compile.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((21) BASE-CHAR . "compile-failed-symbol") :RECORD-PATH
   #A((43) BASE-CHAR . "processes/compile-failed-symbol/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((39) BASE-CHAR . "/tmp/arcdocdb-recovery-csn-compile.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((12) BASE-CHAR . "lint-initial") :RECORD-PATH
   #A((34) BASE-CHAR . "processes/lint-initial/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((15) BASE-CHAR . "tools/lint.lisp")
    #A((3) BASE-CHAR . "src"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((13) BASE-CHAR . "trace-initial") :RECORD-PATH
   #A((35) BASE-CHAR . "processes/trace-initial/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/check-trace.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((13) BASE-CHAR . "links-initial") :RECORD-PATH
   #A((35) BASE-CHAR . "processes/links-initial/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/check-links.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((13) BASE-CHAR . "compile-fixed") :RECORD-PATH
   #A((35) BASE-CHAR . "processes/compile-fixed/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((39) BASE-CHAR . "/tmp/arcdocdb-recovery-csn-compile.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((17) BASE-CHAR . "disassembly-fixed") :RECORD-PATH
   #A((39) BASE-CHAR . "processes/disassembly-fixed/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((43) BASE-CHAR . "/tmp/arcdocdb-recovery-csn-disassemble.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((10) BASE-CHAR . "lint-fixed") :RECORD-PATH
   #A((32) BASE-CHAR . "processes/lint-fixed/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((15) BASE-CHAR . "tools/lint.lisp")
    #A((3) BASE-CHAR . "src"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((11) BASE-CHAR . "trace-fixed") :RECORD-PATH
   #A((33) BASE-CHAR . "processes/trace-fixed/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/check-trace.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((11) BASE-CHAR . "links-fixed") :RECORD-PATH
   #A((33) BASE-CHAR . "processes/links-fixed/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/check-links.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((26) BASE-CHAR . "evidence-before-collection") :RECORD-PATH
   #A((48) BASE-CHAR . "processes/evidence-before-collection/report.lisp")
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((25) BASE-CHAR . "tools/check-evidence.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((17) BASE-CHAR . "trace-write-final") :RECORD-PATH
   #A((39) BASE-CHAR . "processes/trace-write-final/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/check-trace.lisp")
    #A((7) BASE-CHAR . "--write"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((13) BASE-CHAR . "compile-final") :RECORD-PATH
   #A((35) BASE-CHAR . "processes/compile-final/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((39) BASE-CHAR . "/tmp/arcdocdb-recovery-csn-compile.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((10) BASE-CHAR . "lint-final") :RECORD-PATH
   #A((32) BASE-CHAR . "processes/lint-final/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((15) BASE-CHAR . "tools/lint.lisp")
    #A((3) BASE-CHAR . "src"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((11) BASE-CHAR . "trace-final") :RECORD-PATH
   #A((33) BASE-CHAR . "processes/trace-final/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/check-trace.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((11) BASE-CHAR . "links-final") :RECORD-PATH
   #A((33) BASE-CHAR . "processes/links-final/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/check-links.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((17) BASE-CHAR . "disassembly-final") :RECORD-PATH
   #A((39) BASE-CHAR . "processes/disassembly-final/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((43) BASE-CHAR . "/tmp/arcdocdb-recovery-csn-disassemble.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :PLANNED-FILES 41 :SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-COLLECTION :STATUS
 :OK :PHASE :COMPLETE :DESTINATION
 #A((109) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/results/2026-10-15-recovery-csn-originals/")
 :OBSERVATIONS
 #A((110) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/recovery-csn/ArcDocDB/spikes/results/2026-10-15-recovery-csn/collection/")
 :WORKERS 4 :SHA-PER-COPY 3 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :COMPLETED-COMMAND-RECORDS-ONLY
  :FRESH-DESTINATION-ONLY :NO-AUTO-SIDECARS-OR-TREES
  :LOCAL-PER-FILE-OBSERVATIONS :NO-ATOMICITY-OR-AUTHENTICATION
  :NO-RESULT-OR-GATE-INFERENCE :NO-MCDC-OR-RELEASE-QUALIFICATION))
