(:INDEPENDENT-CLOSURE
 (:EXIT-CODE 0 :SIGNAL NIL :LOG
  #A((122) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/archivio-csn-collection-a/closed-check.log")
  :RESULT
  (:SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-AUDIT :STATUS :OK :ARCHIVE
   "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/results/2026-10-16-archivio-csn-verifica/"
   :INDEXED-FILES 63 :ACTUAL-FILES 65 :INDEXED-BYTES 3142972 :PROCESSES
   ((:LABEL "trace" :RECORD-PATH "processes/trace/report.lisp" :COMMAND
     ("make" "trace-write") :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY
     :STABLE)
    (:LABEL "diagnostic-a" :RECORD-PATH "processes/diagnostic-a/report.lisp"
     :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/get-series-capture.lisp" "--" "sbcl" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "spikes/out/archivio-csn-input/diagnose.lisp")
     :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "coverage-self" :RECORD-PATH "processes/coverage-self/report.lisp"
     :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/foundation-coverage.lisp" "--self-test"
      "spikes/out/archivio-csn-coverage-self-a/")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "diagnostic-b" :RECORD-PATH "processes/diagnostic-b/report.lisp"
     :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/get-series-capture.lisp" "--" "sbcl" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "spikes/out/archivio-csn-input/diagnose.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "coverage" :RECORD-PATH "processes/coverage/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/foundation-coverage.lisp" "--report"
      "spikes/out/archivio-csn-coverage-a/" "recovery-archive-csn")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "check" :RECORD-PATH "processes/check/report.lisp" :COMMAND
     ("/Applications/Xcode.app/Contents/Developer/usr/bin/make" "check-core")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "process-status" :RECORD-PATH
     "processes/process-status/report.lisp" :COMMAND
     ("/bin/sh" "-c"
      "show() { ps -p \"$1\" -o pid=,ppid=,etime=,pcpu=,command=; for child in $(pgrep -P \"$1\"); do show \"$child\"; done; }; show 58097")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
   :INDEX-SHA256
   "0ddf4af3eb312f3ecd9347e0acec307dc4ec74241d94e0b220496d3530b6003b"
   :CATALOGUE-SHA256
   "34c77890838d679435fa2ee7e6223a3652dbb6652873b7fbb280c3fa45ad6565"
   :ORIGINS-COMPARED NIL :CLOSED-INVENTORY T :READ-EVAL NIL :EOF-REQUIRED T
   :LIMITS
   (:PLAIN-BYTES 1048576 :GZIP-BYTES 8388608 :PROCESS-EXPANDED-BYTES 134217728
    :ENTRIES 100000 :DIRECTORY-DEPTH 128 :DIRECTORY-ENUMERATION-NOT-PREBOUNDED
    T :PER-FILE-LOCAL-OBSERVATION T :ATOMIC-PUBLICATION NIL
    :RESULT-OR-GATE-INFERENCE NIL :MCDC-CLAIM NIL)))
 :CLEANUP-ERRORS NIL :WORKER-ERRORS (NIL NIL NIL NIL) :WORKER-COPIED-COUNTS
 (21 1 21 20) :COPY-RESULTS
 ((:STATUS :OK :ENTRY
   (:PATH "processes/process-status/report.lisp" :SOURCE
    #A((118) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001157244-command-81474-0/report.lisp")
    :BYTES 220852 :SHA256
    "1c4a085350477599305804d2f132ece4751524c2aeaf22026eb9c8939f5f4709"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/diagnostic-b/report.lisp" :SOURCE
    #A((118) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001156680-command-55374-0/report.lisp")
    :BYTES 227467 :SHA256
    "a5ab435bc52e96aee08fad01d7e344af0d64ed737d1ce2796996d0669682fc49"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/process-status/conservazione.lisp" :SOURCE
    #A((125) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001157244-command-81474-0/conservazione.lisp")
    :BYTES 1168 :SHA256
    "d240145f2c00db08af8323ddc9ede5a73bee9c4995d714501ab2a9c3d76b5b97"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/check/report.lisp.gz" :SOURCE
    #A((121) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001156715-command-58097-0/report.lisp.gz")
    :BYTES 229514 :SHA256
    "809a1191678a26623eecde2dd338b4ca5294f2c77306b1d9098a51525a98e54d"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/check/conservazione.lisp" :SOURCE
    #A((125) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001156715-command-58097-0/conservazione.lisp")
    :BYTES 1755 :SHA256
    "3ff84eee53acd80888f8e866f3da099077f236a721d5398d6e4dc585c197bc9f"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/check/report.lisp" :SOURCE
    #A((118) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001156715-command-58097-0/report.lisp")
    :BYTES 317 :SHA256
    "8f93645c9ba72451fdef015f564840fe494c0fdd3aaf5db7ff7abd351a97a7f7"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/coverage/conservazione.lisp" :SOURCE
    #A((125) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001156715-command-58081-0/conservazione.lisp")
    :BYTES 1168 :SHA256
    "6b75ff9eb4da94d8d91cf7350c66a7a8e0e106cdea21c509c423253db2f6fb47"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/coverage/report.lisp" :SOURCE
    #A((118) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001156715-command-58081-0/report.lisp")
    :BYTES 224861 :SHA256
    "f8ac8f888e4d0df1a8dd041112f1fc22d1008990b0309e69c011f68bcbd4b3d2"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/diagnostic-b/conservazione.lisp" :SOURCE
    #A((125) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001156680-command-55374-0/conservazione.lisp")
    :BYTES 1168 :SHA256
    "06923b99cac625ab4f8be1cf60e1f76df5b017a5bdecaa4600196dd68814d924"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/coverage-self/conservazione.lisp" :SOURCE
    #A((125) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001156601-command-53013-0/conservazione.lisp")
    :BYTES 1168 :SHA256
    "8df7d4a5a777bd1dd75fbb35ffb96cebba1cad68e14cba2f3ff8f3bd2d7ebc55"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/diagnostic-a/conservazione.lisp" :SOURCE
    #A((125) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001156570-command-50860-0/conservazione.lisp")
    :BYTES 1168 :SHA256
    "7743f022008cfc1ff47636bf91714f8e131cb982c060852b193adf011c99ece6"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/coverage-self/report.lisp" :SOURCE
    #A((118) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001156601-command-53013-0/report.lisp")
    :BYTES 220567 :SHA256
    "158909842a41f6d959db3833cb5fd2a71521534a75b7d6a9ae7c044488174b60"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/diagnostic-a/report.lisp" :SOURCE
    #A((118) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001156570-command-50860-0/report.lisp")
    :BYTES 278590 :SHA256
    "6b8f439b1c1b4fd6e992302d54e357ff7eab97443a2914d1784ca9c8de2c0dac"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/trace/conservazione.lisp" :SOURCE
    #A((125) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001156559-command-50389-0/conservazione.lisp")
    :BYTES 1168 :SHA256
    "a6688de19f2023a571d2af3e407b604bd07f9ada1343d744c03b83389c5dcfea"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/trace/report.lisp" :SOURCE
    #A((118) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001156559-command-50389-0/report.lisp")
    :BYTES 220397 :SHA256
    "1592d9843c8179366c9800d2af67c131581bc8348cacdc0fc3d03d8fe7981cff"))
  (:STATUS :OK :ENTRY
   (:PATH "nested/reader/report.lisp" :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001156817-reader-self-test-62863-0/report.lisp")
    :BYTES 1973 :SHA256
    "60347e35ca153455904575324c1e988cf0e705f3e745ced74bc25f803ca58b67"))
  (:STATUS :OK :ENTRY
   (:PATH "nested/reader/signal/stdout.log" :SOURCE
    #A((133) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001156817-reader-self-test-62863-0/signal/stdout.log")
    :BYTES 126 :SHA256
    "3697c68fa71f124c8d05d8cc5d649a744586a10989eb2e67c5bdce6bfc760142"))
  (:STATUS :OK :ENTRY
   (:PATH "nested/reader/signal/isolated-build.lisp.txt" :SOURCE
    #A((142) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001156817-reader-self-test-62863-0/signal/isolated-build.lisp")
    :BYTES 247 :SHA256
    "ff5cf55dda241d32ea1b4308172c7dc526436cbf1d546e7471148cee95a873d1"))
  (:STATUS :OK :ENTRY
   (:PATH "nested/reader/signal/stderr.log" :SOURCE
    #A((133) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001156817-reader-self-test-62863-0/signal/stderr.log")
    :BYTES 0 :SHA256
    "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"))
  (:STATUS :OK :ENTRY
   (:PATH "nested/snapshot/report.lisp" :SOURCE
    #A((129) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001156816-snapshot-self-test-62835-0/report.lisp")
    :BYTES 1991 :SHA256
    "54f261d67dcbbdd1bed337a29d64da4962fd3b279445635866cda5b0b469268b"))
  (:STATUS :OK :ENTRY
   (:PATH "nested/snapshot/signal/stdout.log" :SOURCE
    #A((135) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001156816-snapshot-self-test-62835-0/signal/stdout.log")
    :BYTES 128 :SHA256
    "e3502e714a0530acb1f0130c4ced4a016607bcb067e3686f6f29704db8423ea5"))
  (:STATUS :OK :ENTRY
   (:PATH "nested/snapshot/signal/isolated-build.lisp.txt" :SOURCE
    #A((144) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001156816-snapshot-self-test-62835-0/signal/isolated-build.lisp")
    :BYTES 249 :SHA256
    "a345276e3dfe377c0bbd359793165915b1527938a65250d367ce5ac079feecc1"))
  (:STATUS :OK :ENTRY
   (:PATH "nested/snapshot/signal/stderr.log" :SOURCE
    #A((135) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001156816-snapshot-self-test-62835-0/signal/stderr.log")
    :BYTES 0 :SHA256
    "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"))
  (:STATUS :OK :ENTRY
   (:PATH "coverage/self/cover-index.html" :SOURCE
    #A((125) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/archivio-csn-coverage-self-a/cover-index.html")
    :BYTES 1788 :SHA256
    "7eaba9b5e7ab0b97bc2296cdc21fdcbc151b59ee3eeec29888914e7fda5b2a4d"))
  (:STATUS :OK :ENTRY
   (:PATH "coverage/self/7fd24595864d373567f610bbfa301c57.html" :SOURCE
    #A((146) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/archivio-csn-coverage-self-a/7fd24595864d373567f610bbfa301c57.html")
    :BYTES 2828 :SHA256
    "dc4170a71d8b627f323f0adda9caa9ffe8ba813ebc5f7a8b884fcddcba5c8538"))
  (:STATUS :OK :ENTRY
   (:PATH "coverage/self/coverage-fixture.lisp.txt" :SOURCE
    #A((130) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/archivio-csn-coverage-self-a/coverage-fixture.lisp")
    :BYTES 147 :SHA256
    "3767518fde8bde1e1286dbf663e97eac01f02e038d7f3161df436d9fd3e92559"))
  (:STATUS :OK :ENTRY
   (:PATH "nested/reader/completion-exit/stdout.log" :SOURCE
    #A((142) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001156817-reader-self-test-62863-0/completion-exit/stdout.log")
    :BYTES 105 :SHA256
    "5e630c1b44d68ce71b27d151e76bf367e3cbd941200adc36cdd30e0fe7390531"))
  (:STATUS :OK :ENTRY
   (:PATH "nested/reader/completion-exit/isolated-build.lisp.txt" :SOURCE
    #A((151) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001156817-reader-self-test-62863-0/completion-exit/isolated-build.lisp")
    :BYTES 197 :SHA256
    "1a45dcf8a6d03f1e8866e49280c6f0edb894320c90624d5620fad1e3d546cea9"))
  (:STATUS :OK :ENTRY
   (:PATH "nested/reader/completion-exit/stderr.log" :SOURCE
    #A((142) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001156817-reader-self-test-62863-0/completion-exit/stderr.log")
    :BYTES 0 :SHA256
    "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"))
  (:STATUS :OK :ENTRY
   (:PATH "coverage/product/a1fe823b5ffbaa8dc4062206e964c461.html" :SOURCE
    #A((141) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/archivio-csn-coverage-a/a1fe823b5ffbaa8dc4062206e964c461.html")
    :BYTES 17268 :SHA256
    "8699467e0843a1b8fd8d9ef24bf3a4a568cbe4bfe52c854d2ab4662aa54ec700"))
  (:STATUS :OK :ENTRY
   (:PATH "coverage/product/fd64d6f3762aa2157899037892b29500.html" :SOURCE
    #A((141) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/archivio-csn-coverage-a/fd64d6f3762aa2157899037892b29500.html")
    :BYTES 14424 :SHA256
    "016b22f840aa32eb4a5c1b2179825d8c4b6676e61dfdb48e9ad0731506bc89b4"))
  (:STATUS :OK :ENTRY
   (:PATH "coverage/product/d6c32a1514cebd353b4e644a9f189bae.html" :SOURCE
    #A((141) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/archivio-csn-coverage-a/d6c32a1514cebd353b4e644a9f189bae.html")
    :BYTES 15248 :SHA256
    "136c796257a5237dbe7ead28568c7ed1f2ff7906bf34d9d144ff5d58d047d609"))
  (:STATUS :OK :ENTRY
   (:PATH "coverage/product/d266844bacefff42614dcdc5cc38630e.html" :SOURCE
    #A((141) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/archivio-csn-coverage-a/d266844bacefff42614dcdc5cc38630e.html")
    :BYTES 25908 :SHA256
    "f28de8b2886cd3f724210496b80ae6f6db376dd6b5fe87b5796b18c0a6f82b36"))
  (:STATUS :OK :ENTRY
   (:PATH "coverage/product/c99ee89c24faf02cfa9f601857744568.html" :SOURCE
    #A((141) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/archivio-csn-coverage-a/c99ee89c24faf02cfa9f601857744568.html")
    :BYTES 11453 :SHA256
    "f9fa700e28ad7a6b72a7b07a576d5ca157b4035a361ee8d935607751f5c8466a"))
  (:STATUS :OK :ENTRY
   (:PATH "coverage/product/0b996cdaf01a12dc61e4aca649ba707b.html" :SOURCE
    #A((141) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/archivio-csn-coverage-a/0b996cdaf01a12dc61e4aca649ba707b.html")
    :BYTES 32373 :SHA256
    "917e12ab5b70745f8a004bb5c4d2175baf9f7806fd3c78aacc77adf0e123d86c"))
  (:STATUS :OK :ENTRY
   (:PATH "coverage/product/1ec8bb1ca37d0bf94ee3f8de8915c2a1.html" :SOURCE
    #A((141) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/archivio-csn-coverage-a/1ec8bb1ca37d0bf94ee3f8de8915c2a1.html")
    :BYTES 16905 :SHA256
    "2c2a164a88c274243a18bc35bdb226dfbbab280ec93d0343cff57da2d23a87cd"))
  (:STATUS :OK :ENTRY
   (:PATH "coverage/product/f45fd7078cee8abb26770ecf2d98c3d9.html" :SOURCE
    #A((141) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/archivio-csn-coverage-a/f45fd7078cee8abb26770ecf2d98c3d9.html")
    :BYTES 13323 :SHA256
    "1cfc1b0560125110e675e30b5fde7f7e2f9023a1aad54974c3ee839142ae7228"))
  (:STATUS :OK :ENTRY
   (:PATH "coverage/product/cover-index.html" :SOURCE
    #A((120) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/archivio-csn-coverage-a/cover-index.html")
    :BYTES 3506 :SHA256
    "5b2a5b4eb5bd68bc5b83981c264e82c3adf5a0e2de8be7992d18fb40fb82ec9b"))
  (:STATUS :OK :ENTRY
   (:PATH "coverage/product/14b173b2dee818e0d2f28e98da6d0a4a.html" :SOURCE
    #A((141) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/archivio-csn-coverage-a/14b173b2dee818e0d2f28e98da6d0a4a.html")
    :BYTES 9117 :SHA256
    "db8b6b1928a975401ad8cf91e660a5bf6e732cc0d9f56aa3ca583966155bc566"))
  (:STATUS :OK :ENTRY
   (:PATH "nested/snapshot/completion-exit/stdout.log" :SOURCE
    #A((144) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001156816-snapshot-self-test-62835-0/completion-exit/stdout.log")
    :BYTES 107 :SHA256
    "4f22544421d9012fe132a36bf15950cd327ca959b8f9c5ef3d386e0c8b62a25c"))
  (:STATUS :OK :ENTRY
   (:PATH "nested/snapshot/completion-exit/isolated-build.lisp.txt" :SOURCE
    #A((153) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001156816-snapshot-self-test-62835-0/completion-exit/isolated-build.lisp")
    :BYTES 199 :SHA256
    "b8bb4416a818775bae5c77341eeec2c356a2733f633ac2bc8b6ac3ff955d05e0"))
  (:STATUS :OK :ENTRY
   (:PATH "nested/snapshot/completion-exit/stderr.log" :SOURCE
    #A((144) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001156816-snapshot-self-test-62835-0/completion-exit/stderr.log")
    :BYTES 0 :SHA256
    "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"))
  (:STATUS :OK :ENTRY
   (:PATH "nested/spikes/SPK-04.lisp" :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001157242-check-81390-0/SPK-04.lisp")
    :BYTES 6752 :SHA256
    "a7b8da6a5e1a5efc6711e54b404b602874505b8f40296d4ff656150fb5eb52d0"))
  (:STATUS :OK :ENTRY
   (:PATH "nested/spikes/SPK-08.lisp" :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001157242-check-81390-0/SPK-08.lisp")
    :BYTES 292334 :SHA256
    "70748cce6b4e19c88f704b94bf378f50436910b17fc3ba32fcf1649cd7e8c912"))
  (:STATUS :OK :ENTRY
   (:PATH "nested/spikes/SPK-09.lisp" :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001157242-check-81390-0/SPK-09.lisp")
    :BYTES 2472 :SHA256
    "abe6f8967edf26621694163233313c90d400122b1d1ae2e11863dfcfe5dd68be"))
  (:STATUS :OK :ENTRY
   (:PATH "nested/spikes/SPK-05.lisp" :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001157242-check-81390-0/SPK-05.lisp")
    :BYTES 10114 :SHA256
    "e45c84c862d3d1c536197b154a13f7f40da98f20c218484ae4f13333cd41990b"))
  (:STATUS :OK :ENTRY
   (:PATH "nested/spikes/SPK-02.lisp" :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001157242-check-81390-0/SPK-02.lisp")
    :BYTES 1607 :SHA256
    "7d3fc75f0b2f27eb5f01bc3154c83fb0675ae28b688ccd7c20df8290b1b0cc26"))
  (:STATUS :OK :ENTRY
   (:PATH "nested/spikes/SPK-03.lisp" :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001157242-check-81390-0/SPK-03.lisp")
    :BYTES 3653 :SHA256
    "20e5e1ae25dab82a40ecb5efc4310a3b61d9346578ad0e236d4c9185219587b5"))
  (:STATUS :OK :ENTRY
   (:PATH "nested/spikes/report.lisp" :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001157242-check-81390-0/report.lisp")
    :BYTES 318 :SHA256
    "8013f036a6bad957922e85b1e8fa0c2ec4238304731b7767f9e03935143ca955"))
  (:STATUS :OK :ENTRY
   (:PATH "nested/spikes/report.lisp.gz" :SOURCE
    #A((119) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001157242-check-81390-0/report.lisp.gz")
    :BYTES 467332 :SHA256
    "232a2281bbd860fcb611362aa017c3fdb117b62e808e36bf18e848b60c4c6e86"))
  (:STATUS :OK :ENTRY
   (:PATH "nested/spikes/SPK-01.lisp" :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001157242-check-81390-0/SPK-01.lisp")
    :BYTES 27226 :SHA256
    "e98028d24b876ed0337789471e688f46f474ac8d215b9fc88703895b5c51fcfe"))
  (:STATUS :OK :ENTRY
   (:PATH "nested/spikes/conservazione.lisp" :SOURCE
    #A((123) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001157242-check-81390-0/conservazione.lisp")
    :BYTES 2326 :SHA256
    "c3f4194923a5f0fc1243ae610928a43261505452b2b32ca0a1ad23ea785c8659"))
  (:STATUS :OK :ENTRY
   (:PATH "nested/spikes/SPK-06.lisp" :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001157242-check-81390-0/SPK-06.lisp")
    :BYTES 24156 :SHA256
    "96c34bce761e95f1e41ef57c333f62bff7ada17794fa5aa7ef2413c861109c22"))
  (:STATUS :OK :ENTRY
   (:PATH "nested/spikes/SPK-10.lisp" :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001157242-check-81390-0/SPK-10.lisp")
    :BYTES 22971 :SHA256
    "25db1fc8b5966835f213830d67fc6889e69b10f8227f7834df2e67e2b0e74a0d"))
  (:STATUS :OK :ENTRY
   (:PATH "nested/spikes/SPK-07.lisp.gz" :SOURCE
    #A((119) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001157242-check-81390-0/SPK-07.lisp.gz")
    :BYTES 410637 :SHA256
    "f98adead5491ceeedbe333124ff286fc86c3d9d0e5e9209eb4374ca7f7cbf783"))
  (:STATUS :OK :ENTRY
   (:PATH "nested/spikes/SPK-07.lisp" :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/4001157242-check-81390-0/SPK-07.lisp")
    :BYTES 318 :SHA256
    "67d864584641ae55c9b0a32cdea19e58541ce627a20bd12d4af3b5e76e3ad24a"))
  (:STATUS :OK :ENTRY
   (:PATH "report.md" :SOURCE
    #A((112) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/archivio-csn-input/report.md.txt")
    :BYTES 7069 :SHA256
    "317f3df113abe599a4a4f61a445fb8682d50f219a2e8d947cbae9095c11fa184"))
  (:STATUS :OK :ENTRY
   (:PATH "summary.lisp" :SOURCE
    #A((111) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/archivio-csn-input/summary.lisp")
    :BYTES 2715 :SHA256
    "90c683b6a6bc800db83dabfaade86178605a826f96cde39383c01eaa90369504"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/diagnose.lisp.txt" :SOURCE
    #A((112) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/archivio-csn-input/diagnose.lisp")
    :BYTES 1072 :SHA256
    "99ab4d6392c42edb8c5f192df17f865819bbd4e931f5a9ad1b9b6f28dffc31bc"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/metodo-prima.md.txt" :SOURCE
    #A((118) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/archivio-csn-input/metodo-prima.md.txt")
    :BYTES 4324 :SHA256
    "92805da3c2d30930f7b7f85ec0ec8200c9025eaaa3422d5e4e10e9b5772ba0dd"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/revisione.md.txt" :SOURCE
    #A((115) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/archivio-csn-input/revisione.md.txt")
    :BYTES 11378 :SHA256
    "a1a7c1258f2f13d34bbb5b86d6d81e881a3da83d07d68ea11bd33c349cf47c94"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-manifest.lisp" :SOURCE
    #A((112) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/archivio-csn-input/manifest.lisp")
    :BYTES 11992 :SHA256
    "7676f32bc6ef6be76c6975573a8c1187ae2bd1e87c2f8689c8e42b5848a4f9c7"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-source.lisp" :SOURCE
    #A((103) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/tools/collect-command-archive.lisp")
    :BYTES 31268 :SHA256
    "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")))
 :PROCESSES
 ((:LABEL "trace" :RECORD-PATH "processes/trace/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "make") #A((11) BASE-CHAR . "trace-write")) :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "diagnostic-a" :RECORD-PATH "processes/diagnostic-a/report.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((29) BASE-CHAR . "tools/get-series-capture.lisp")
    #A((2) BASE-CHAR . "--") #A((4) BASE-CHAR . "sbcl")
    #A((10) BASE-CHAR . "--noinform") #A((13) BASE-CHAR . "--no-userinit")
    #A((12) BASE-CHAR . "--no-sysinit") #A((8) BASE-CHAR . "--script")
    #A((43) BASE-CHAR . "spikes/out/archivio-csn-input/diagnose.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "coverage-self" :RECORD-PATH "processes/coverage-self/report.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((11) BASE-CHAR . "--self-test")
    #A((40) BASE-CHAR . "spikes/out/archivio-csn-coverage-self-a/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "diagnostic-b" :RECORD-PATH "processes/diagnostic-b/report.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((29) BASE-CHAR . "tools/get-series-capture.lisp")
    #A((2) BASE-CHAR . "--") #A((4) BASE-CHAR . "sbcl")
    #A((10) BASE-CHAR . "--noinform") #A((13) BASE-CHAR . "--no-userinit")
    #A((12) BASE-CHAR . "--no-sysinit") #A((8) BASE-CHAR . "--script")
    #A((43) BASE-CHAR . "spikes/out/archivio-csn-input/diagnose.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "coverage" :RECORD-PATH "processes/coverage/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((8) BASE-CHAR . "--report")
    #A((35) BASE-CHAR . "spikes/out/archivio-csn-coverage-a/")
    #A((20) BASE-CHAR . "recovery-archive-csn"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "check" :RECORD-PATH "processes/check/report.lisp" :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "process-status" :RECORD-PATH "processes/process-status/report.lisp"
   :COMMAND
   (#A((7) BASE-CHAR . "/bin/sh") #A((2) BASE-CHAR . "-c")
    #A((125) BASE-CHAR
       . "show() { ps -p \"$1\" -o pid=,ppid=,etime=,pcpu=,command=; for child in $(pgrep -P \"$1\"); do show \"$child\"; done; }; show 58097"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :PLANNED-FILES 63 :SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-COLLECTION :STATUS
 :OK :PHASE :COMPLETE :DESTINATION
 #A((117) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/results/2026-10-16-archivio-csn-verifica/")
 :OBSERVATIONS
 #A((106) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/archivio-csn-verifica/ArcDocDB/spikes/out/archivio-csn-collection-a/")
 :WORKERS 4 :SHA-PER-COPY 3 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :COMPLETED-COMMAND-RECORDS-ONLY
  :FRESH-DESTINATION-ONLY :NO-AUTO-SIDECARS-OR-TREES
  :LOCAL-PER-FILE-OBSERVATIONS :NO-ATOMICITY-OR-AUTHENTICATION
  :NO-RESULT-OR-GATE-INFERENCE :NO-MCDC-OR-RELEASE-QUALIFICATION))
