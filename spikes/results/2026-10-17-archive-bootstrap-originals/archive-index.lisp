(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL #A((7) BASE-CHAR . "compile") :RECORD-PATH
   #A((29) BASE-CHAR . "processes/compile/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((44) BASE-CHAR . "/tmp/arcdocdb-archive-bootstrap-compile.lisp"))
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
    #A((48) BASE-CHAR . "/tmp/arcdocdb-archive-bootstrap-disassemble.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((58) BASE-CHAR
      . "/private/tmp/arcdocdb-archive-bootstrap-manifest-data.lisp")
   :BYTES 3925 :SHA256
   "72d78468c436d81a1314537fc6d7204376029a6a42f2516aba5eab24644db6d2")
  (:PATH "collection-source.lisp" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH #A((36) BASE-CHAR . "processes/compile/conservazione.lisp") :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/archive-bootstrap/compile/conservazione.lisp")
   :BYTES 1171 :SHA256
   "c1ba936a5b3e4278628bb3cd156c58ae873de64b5e218fa1f7f8bc3dc4f767cb")
  (:PATH #A((29) BASE-CHAR . "processes/compile/report.lisp") :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/archive-bootstrap/compile/report.lisp")
   :BYTES 258393 :SHA256
   "6cfc8fe2ed2d00e6793f628a254f1fdbeebb2f6c01d529e8e7da4d4b849b09a5")
  (:PATH #A((40) BASE-CHAR . "processes/disassemble/conservazione.lisp")
   :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/archive-bootstrap/disassemble/conservazione.lisp")
   :BYTES 1180 :SHA256
   "1e4ab119c286211dcbe574388d250421229676de9378ba916563cdffc12ebc58")
  (:PATH #A((33) BASE-CHAR . "processes/disassemble/report.lisp") :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/archive-bootstrap/disassemble/report.lisp")
   :BYTES 310618 :SHA256
   "bad837858b6d319c084fcedd6fc8bf483ba4bfff4b6dfd83e39aa052447d009d")
  (:PATH #A((34) BASE-CHAR . "processes/links/conservazione.lisp") :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/archive-bootstrap/links/conservazione.lisp")
   :BYTES 1168 :SHA256
   "6669a054ea1398581dc041f239f3743bc2f34f7cb8e12dd20d2b66fb797542cf")
  (:PATH #A((27) BASE-CHAR . "processes/links/report.lisp") :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/archive-bootstrap/links/report.lisp")
   :BYTES 258484 :SHA256
   "7ab2c2acd6d1662e0908a5473bc392ff7f4dfee430a4d8f3a64d58cffe4ef3db")
  (:PATH #A((33) BASE-CHAR . "processes/lint/conservazione.lisp") :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/archive-bootstrap/lint/conservazione.lisp")
   :BYTES 1166 :SHA256
   "6d471590204ab7d20fd75e754341c6d456cb56dd80f8784530176676902b9899")
  (:PATH #A((26) BASE-CHAR . "processes/lint/report.lisp") :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/archive-bootstrap/lint/report.lisp")
   :BYTES 258487 :SHA256
   "b1c8b9bc4553f146da20d47da514c2d3af21c6c4bdb217673573d99b9570bd05")
  (:PATH #A((40) BASE-CHAR . "processes/trace-write/conservazione.lisp")
   :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/archive-bootstrap/trace-write/conservazione.lisp")
   :BYTES 1180 :SHA256
   "8bcfc8d5c5166c9c9e4fe0aa1031badef98024f89251bdddfbc342d56670187f")
  (:PATH #A((33) BASE-CHAR . "processes/trace-write/report.lisp") :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/archive-bootstrap/trace-write/report.lisp")
   :BYTES 258502 :SHA256
   "8485199acf11be337b4f000ad50dd2f287726ef99e96a26bb9854850394b2fd8")
  (:PATH #A((34) BASE-CHAR . "processes/trace/conservazione.lisp") :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/archive-bootstrap/trace/conservazione.lisp")
   :BYTES 1168 :SHA256
   "d72ad4116f37a790c3e7dba02df4c63994c6d9b8a405fe07ebd67dd9147140d8")
  (:PATH #A((27) BASE-CHAR . "processes/trace/report.lisp") :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/archive-bootstrap/trace/report.lisp")
   :BYTES 258505 :SHA256
   "d7bcb20edb6de93be4585d4fd4dec696a9f98345e739836c332b8e829f6e1924")
  (:PATH "raw/compile.lisp.txt" :SOURCE
   #A((52) BASE-CHAR . "/private/tmp/arcdocdb-archive-bootstrap-compile.lisp")
   :BYTES 399 :SHA256
   "0239483ad5b47a2d829cb60fdf2d4608ca0f852889f0aafc91f446493b45905a")
  (:PATH "raw/disassemble.lisp.txt" :SOURCE
   #A((56) BASE-CHAR
      . "/private/tmp/arcdocdb-archive-bootstrap-disassemble.lisp")
   :BYTES 441 :SHA256
   "c0a947c43122eb9ea6fd0d61442d41020535763ec7126c31b08f89287a6bd8b6")
  (:PATH "raw/manifest-builder.lisp.txt" :SOURCE
   #A((53) BASE-CHAR . "/private/tmp/arcdocdb-archive-bootstrap-manifest.lisp")
   :BYTES 1764 :SHA256
   "b5ca015ea09b941ecf76edfa709f0079f63e65ab49b22c1a1112132a52efe451"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
