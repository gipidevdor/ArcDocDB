(:INDEPENDENT-CLOSURE
 (:EXIT-CODE 0 :SIGNAL NIL :LOG
  #A((139) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/results/2026-10-17-serie-semantic/collection/closed-check.log")
  :RESULT
  (:SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-AUDIT :STATUS :OK :ARCHIVE
   "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/results/2026-10-17-serie-semantic-originals/"
   :INDEXED-FILES 32 :ACTUAL-FILES 34 :INDEXED-BYTES 3696449 :PROCESSES
   ((:LABEL "compile-initial" :RECORD-PATH
     "processes/compile-initial/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "/tmp/arcdocdb-serie-semantic-compile.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "compile-refactor" :RECORD-PATH
     "processes/compile-refactor/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "/tmp/arcdocdb-serie-semantic-compile.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "trace-write" :RECORD-PATH "processes/trace-write/report.lisp"
     :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "tools/check-trace.lisp" "--write")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "lint-refactor" :RECORD-PATH "processes/lint-refactor/report.lisp"
     :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "tools/lint.lisp" "src")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "trace-refactor" :RECORD-PATH
     "processes/trace-refactor/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "tools/check-trace.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "links-refactor" :RECORD-PATH
     "processes/links-refactor/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "tools/check-links.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "disassemble-refactor" :RECORD-PATH
     "processes/disassemble-refactor/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script"
      "/tmp/arcdocdb-serie-semantic-disassemble.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "evidence" :RECORD-PATH "processes/evidence/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "tools/check-evidence.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "compile-config" :RECORD-PATH
     "processes/compile-config/report.lisp" :COMMAND
     ("sbcl" "--noinform" "--no-userinit" "--no-sysinit" "--script"
      "/tmp/arcdocdb-serie-semantic-compile.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "lint-config" :RECORD-PATH "processes/lint-config/report.lisp"
     :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "tools/lint.lisp" "src")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "trace-config" :RECORD-PATH "processes/trace-config/report.lisp"
     :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "tools/check-trace.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "links-config" :RECORD-PATH "processes/links-config/report.lisp"
     :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script" "tools/check-links.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "disassemble-config" :RECORD-PATH
     "processes/disassemble-config/report.lisp" :COMMAND
     ("sbcl" "--dynamic-space-size" "2048" "--noinform" "--no-userinit"
      "--no-sysinit" "--script"
      "/tmp/arcdocdb-serie-semantic-disassemble.lisp")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
   :INDEX-SHA256
   "31d60dd407ed69a63db2c368ff8698c957dc042e92600bf576ed50b21d56b807"
   :CATALOGUE-SHA256
   "e849685a7cd69686dc8674618a65b12895fbcf9f50ae7b5f6010465e11d51eec"
   :ORIGINS-COMPARED NIL :CLOSED-INVENTORY T :READ-EVAL NIL :EOF-REQUIRED T
   :LIMITS
   (:PLAIN-BYTES 1048576 :GZIP-BYTES 8388608 :PROCESS-EXPANDED-BYTES 134217728
    :ENTRIES 100000 :DIRECTORY-DEPTH 128 :DIRECTORY-ENUMERATION-NOT-PREBOUNDED
    T :PER-FILE-LOCAL-OBSERVATION T :ATOMIC-PUBLICATION NIL
    :RESULT-OR-GATE-INFERENCE NIL :MCDC-CLAIM NIL)))
 :CLEANUP-ERRORS NIL :WORKER-ERRORS (NIL NIL NIL NIL) :WORKER-COPIED-COUNTS
 (10 11 10 1) :COPY-RESULTS
 ((:STATUS :OK :ENTRY
   (:PATH #A((37) BASE-CHAR . "processes/compile-initial/report.lisp") :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/serie-semantic/compile/report.lisp")
    :BYTES 257342 :SHA256
    "6b0b6a63962d64748be743d4ab5839a2f17bc57382d0a3896e65fffa74c456c1"))
  (:STATUS :OK :ENTRY
   (:PATH #A((44) BASE-CHAR . "processes/compile-initial/conservazione.lisp")
    :SOURCE
    #A((123) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/serie-semantic/compile/conservazione.lisp")
    :BYTES 1166 :SHA256
    "9a101246ca5eac53c45239abdd291fea7d1fd6ed86a142875e88029ed54afeb3"))
  (:STATUS :OK :ENTRY
   (:PATH #A((38) BASE-CHAR . "processes/compile-refactor/report.lisp") :SOURCE
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/serie-semantic/compile-final/report.lisp")
    :BYTES 257342 :SHA256
    "cc6394b2c5fa8241f044fd5abf4385d5c691445bea723cb4adbe58f17019488f"))
  (:STATUS :OK :ENTRY
   (:PATH #A((45) BASE-CHAR . "processes/compile-refactor/conservazione.lisp")
    :SOURCE
    #A((129) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/serie-semantic/compile-final/conservazione.lisp")
    :BYTES 1178 :SHA256
    "3d77baad89a8fd24e0bd0cfa73744babdf520659b35ce68c2dc708758e980d45"))
  (:STATUS :OK :ENTRY
   (:PATH #A((33) BASE-CHAR . "processes/trace-write/report.lisp") :SOURCE
    #A((120) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/serie-semantic/trace-write/report.lisp")
    :BYTES 257454 :SHA256
    "0642a7edaec9929eb9e7e6701ac0df1448ab58769023d8d9909284bcdc518e0d"))
  (:STATUS :OK :ENTRY
   (:PATH #A((40) BASE-CHAR . "processes/trace-write/conservazione.lisp")
    :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/serie-semantic/trace-write/conservazione.lisp")
    :BYTES 1174 :SHA256
    "030938401b923c3c1c1ba5c86877351eb0530b1165cc358cda961bf79f0570e5"))
  (:STATUS :OK :ENTRY
   (:PATH #A((35) BASE-CHAR . "processes/lint-refactor/report.lisp") :SOURCE
    #A((113) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/serie-semantic/lint/report.lisp")
    :BYTES 257439 :SHA256
    "035275519b4fcf21db3ad24f708ffba39e8c095cfed54631c84c3b405f52fd4b"))
  (:STATUS :OK :ENTRY
   (:PATH #A((42) BASE-CHAR . "processes/lint-refactor/conservazione.lisp")
    :SOURCE
    #A((120) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/serie-semantic/lint/conservazione.lisp")
    :BYTES 1160 :SHA256
    "932b0794982df08c5ab74b5ef71fefec468c8538ceaf4cfa48fdad07e1590ea9"))
  (:STATUS :OK :ENTRY
   (:PATH #A((36) BASE-CHAR . "processes/trace-refactor/report.lisp") :SOURCE
    #A((114) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/serie-semantic/trace/report.lisp")
    :BYTES 257457 :SHA256
    "c185c4b6d070235fa95037b096e51e56e0cd4589e5cc30f1bc5a4cd5ea440af0"))
  (:STATUS :OK :ENTRY
   (:PATH #A((43) BASE-CHAR . "processes/trace-refactor/conservazione.lisp")
    :SOURCE
    #A((121) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/serie-semantic/trace/conservazione.lisp")
    :BYTES 1162 :SHA256
    "65d495699be15ddcaa8a003382c89d3f0745755aebaf5ecd2c5892652a603a2c"))
  (:STATUS :OK :ENTRY
   (:PATH #A((36) BASE-CHAR . "processes/links-refactor/report.lisp") :SOURCE
    #A((114) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/serie-semantic/links/report.lisp")
    :BYTES 257436 :SHA256
    "d7db7ec6dd46331fb2fdb65f34812010fa7f2c37fa2b09d1fa242a84afbb4c3e"))
  (:STATUS :OK :ENTRY
   (:PATH #A((43) BASE-CHAR . "processes/links-refactor/conservazione.lisp")
    :SOURCE
    #A((121) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/serie-semantic/links/conservazione.lisp")
    :BYTES 1162 :SHA256
    "41e4c059e0619aa32fc5f561013d7579a51d034010135701c9c4d7427eb7fe29"))
  (:STATUS :OK :ENTRY
   (:PATH #A((42) BASE-CHAR . "processes/disassemble-refactor/report.lisp")
    :SOURCE
    #A((120) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/serie-semantic/disassemble/report.lisp")
    :BYTES 305072 :SHA256
    "36039066b06262fc7f87d906a8f2e51fc2657b04235ef33ad5d7695b4d7a9c05"))
  (:STATUS :OK :ENTRY
   (:PATH
    #A((49) BASE-CHAR . "processes/disassemble-refactor/conservazione.lisp")
    :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/serie-semantic/disassemble/conservazione.lisp")
    :BYTES 1174 :SHA256
    "bba146cf5ef2ae1a9092ae5e4d522efeb8ef1652d34ce2003e2e36aa85b196d5"))
  (:STATUS :OK :ENTRY
   (:PATH #A((30) BASE-CHAR . "processes/evidence/report.lisp") :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/serie-semantic/evidence/report.lisp")
    :BYTES 257727 :SHA256
    "495b445b70a623c6e297f5c0199006e8ed285ee985e18ecc7db3207c49baac26"))
  (:STATUS :OK :ENTRY
   (:PATH #A((37) BASE-CHAR . "processes/evidence/conservazione.lisp") :SOURCE
    #A((124) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/serie-semantic/evidence/conservazione.lisp")
    :BYTES 1168 :SHA256
    "ccf522426bc3cd288eefcf18a09755255e644545e97ba310116ae87062be8d0c"))
  (:STATUS :OK :ENTRY
   (:PATH #A((36) BASE-CHAR . "processes/compile-config/report.lisp") :SOURCE
    #A((123) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/serie-semantic/compile-config/report.lisp")
    :BYTES 257342 :SHA256
    "4c9450aeb5426f7439df314cd1c009064cd4207b3074755c015ad695fa33963d"))
  (:STATUS :OK :ENTRY
   (:PATH #A((43) BASE-CHAR . "processes/compile-config/conservazione.lisp")
    :SOURCE
    #A((130) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/serie-semantic/compile-config/conservazione.lisp")
    :BYTES 1180 :SHA256
    "0770ec720762f68f7c356e09cfd4aad0c8f9986a97f004d83b12b1736b9e272a"))
  (:STATUS :OK :ENTRY
   (:PATH #A((33) BASE-CHAR . "processes/lint-config/report.lisp") :SOURCE
    #A((120) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/serie-semantic/lint-config/report.lisp")
    :BYTES 257439 :SHA256
    "40985581bc65858b2938dc242d4093ab29867cfd7c81ef83e81b86e1dd28afd5"))
  (:STATUS :OK :ENTRY
   (:PATH #A((40) BASE-CHAR . "processes/lint-config/conservazione.lisp")
    :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/serie-semantic/lint-config/conservazione.lisp")
    :BYTES 1174 :SHA256
    "8054b327b0de2869d235a5bfcd3cc72c66fe09d4666de9ad6f772ba2598d6515"))
  (:STATUS :OK :ENTRY
   (:PATH #A((34) BASE-CHAR . "processes/trace-config/report.lisp") :SOURCE
    #A((121) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/serie-semantic/trace-config/report.lisp")
    :BYTES 257456 :SHA256
    "d1ce7277a65648061b3742a9b8e59fe12f41d2d0a2894ffb792e5baf267d1819"))
  (:STATUS :OK :ENTRY
   (:PATH #A((41) BASE-CHAR . "processes/trace-config/conservazione.lisp")
    :SOURCE
    #A((128) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/serie-semantic/trace-config/conservazione.lisp")
    :BYTES 1176 :SHA256
    "44784e5068cbf749e2fb48b7fb318205a1bae0b26a750633ab4e661dbd584cad"))
  (:STATUS :OK :ENTRY
   (:PATH #A((34) BASE-CHAR . "processes/links-config/report.lisp") :SOURCE
    #A((121) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/serie-semantic/links-config/report.lisp")
    :BYTES 257436 :SHA256
    "bf62107c43ea9619e93af9cb2d206c57719889958875c9f22b72cab64bffaf69"))
  (:STATUS :OK :ENTRY
   (:PATH #A((41) BASE-CHAR . "processes/links-config/conservazione.lisp")
    :SOURCE
    #A((128) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/serie-semantic/links-config/conservazione.lisp")
    :BYTES 1176 :SHA256
    "4f7daa67f18dafa8ae0a78f1d0a2a5273e29ba6d8800fe8950e6845c27195e26"))
  (:STATUS :OK :ENTRY
   (:PATH #A((40) BASE-CHAR . "processes/disassemble-config/report.lisp")
    :SOURCE
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/serie-semantic/disassemble-config/report.lisp")
    :BYTES 304988 :SHA256
    "a1ab3725bb6c78cf30ccbf478fc973d418c103197aa8e819278377f810b5d4f1"))
  (:STATUS :OK :ENTRY
   (:PATH
    #A((47) BASE-CHAR . "processes/disassemble-config/conservazione.lisp")
    :SOURCE
    #A((134) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/serie-semantic/disassemble-config/conservazione.lisp")
    :BYTES 1188 :SHA256
    "a3d811a9ed24474a9c3be86cdf584cd0bdf18cd92eea1362920133a7c4660e5d"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/evidence-worker-logs.tar.gz" :SOURCE
    #A((55) BASE-CHAR
       . "/private/tmp/arcdocdb-serie-semantic-worker-logs.tar.gz")
    :BYTES 196685 :SHA256
    "f8a0e06f0dba81a90d99a461085deb8b02f6cd1cc40d17f18e7751c7584f3013"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/compile.lisp.txt" :SOURCE
    #A((49) BASE-CHAR . "/private/tmp/arcdocdb-serie-semantic-compile.lisp")
    :BYTES 399 :SHA256
    "0239483ad5b47a2d829cb60fdf2d4608ca0f852889f0aafc91f446493b45905a"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/disassemble.lisp.txt" :SOURCE
    #A((53) BASE-CHAR
       . "/private/tmp/arcdocdb-serie-semantic-disassemble.lisp")
    :BYTES 620 :SHA256
    "145cc0bb8380121028f869b62718aa5b5762f366705c173b88c0efce87b7d404"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/manifest-builder.lisp.txt" :SOURCE
    #A((50) BASE-CHAR . "/private/tmp/arcdocdb-serie-semantic-manifest.lisp")
    :BYTES 1861 :SHA256
    "fb26b6c66fdb9d43e510f90e625db31e0d44fe9b95f47c0132abe8114a856c5d"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-manifest.lisp" :SOURCE
    #A((55) BASE-CHAR
       . "/private/tmp/arcdocdb-serie-semantic-manifest-data.lisp")
    :BYTES 8448 :SHA256
    "e13e1becf147281aa60204616f08b72b14344df5ecc3454d65bb4b18a3af9ab8"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-source.lisp" :SOURCE
    #A((105) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/tools/collect-command-archive.lisp")
    :BYTES 31268 :SHA256
    "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")))
 :PROCESSES
 ((:LABEL #A((15) BASE-CHAR . "compile-initial") :RECORD-PATH
   #A((37) BASE-CHAR . "processes/compile-initial/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((41) BASE-CHAR . "/tmp/arcdocdb-serie-semantic-compile.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((16) BASE-CHAR . "compile-refactor") :RECORD-PATH
   #A((38) BASE-CHAR . "processes/compile-refactor/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((41) BASE-CHAR . "/tmp/arcdocdb-serie-semantic-compile.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((11) BASE-CHAR . "trace-write") :RECORD-PATH
   #A((33) BASE-CHAR . "processes/trace-write/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/check-trace.lisp")
    #A((7) BASE-CHAR . "--write"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((13) BASE-CHAR . "lint-refactor") :RECORD-PATH
   #A((35) BASE-CHAR . "processes/lint-refactor/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((15) BASE-CHAR . "tools/lint.lisp")
    #A((3) BASE-CHAR . "src"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((14) BASE-CHAR . "trace-refactor") :RECORD-PATH
   #A((36) BASE-CHAR . "processes/trace-refactor/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/check-trace.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((14) BASE-CHAR . "links-refactor") :RECORD-PATH
   #A((36) BASE-CHAR . "processes/links-refactor/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/check-links.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((20) BASE-CHAR . "disassemble-refactor") :RECORD-PATH
   #A((42) BASE-CHAR . "processes/disassemble-refactor/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((45) BASE-CHAR . "/tmp/arcdocdb-serie-semantic-disassemble.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((8) BASE-CHAR . "evidence") :RECORD-PATH
   #A((30) BASE-CHAR . "processes/evidence/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((25) BASE-CHAR . "tools/check-evidence.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((14) BASE-CHAR . "compile-config") :RECORD-PATH
   #A((36) BASE-CHAR . "processes/compile-config/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((41) BASE-CHAR . "/tmp/arcdocdb-serie-semantic-compile.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((11) BASE-CHAR . "lint-config") :RECORD-PATH
   #A((33) BASE-CHAR . "processes/lint-config/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((15) BASE-CHAR . "tools/lint.lisp")
    #A((3) BASE-CHAR . "src"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((12) BASE-CHAR . "trace-config") :RECORD-PATH
   #A((34) BASE-CHAR . "processes/trace-config/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/check-trace.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((12) BASE-CHAR . "links-config") :RECORD-PATH
   #A((34) BASE-CHAR . "processes/links-config/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/check-links.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((18) BASE-CHAR . "disassemble-config") :RECORD-PATH
   #A((40) BASE-CHAR . "processes/disassemble-config/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((45) BASE-CHAR . "/tmp/arcdocdb-serie-semantic-disassemble.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :PLANNED-FILES 32 :SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-COLLECTION :STATUS
 :OK :PHASE :COMPLETE :DESTINATION
 #A((122) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/results/2026-10-17-serie-semantic-originals/")
 :OBSERVATIONS
 #A((123) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/results/2026-10-17-serie-semantic/collection/")
 :WORKERS 4 :SHA-PER-COPY 3 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :COMPLETED-COMMAND-RECORDS-ONLY
  :FRESH-DESTINATION-ONLY :NO-AUTO-SIDECARS-OR-TREES
  :LOCAL-PER-FILE-OBSERVATIONS :NO-ATOMICITY-OR-AUTHENTICATION
  :NO-RESULT-OR-GATE-INFERENCE :NO-MCDC-OR-RELEASE-QUALIFICATION))
