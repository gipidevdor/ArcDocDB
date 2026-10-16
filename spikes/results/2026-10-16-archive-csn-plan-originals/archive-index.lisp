(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL #A((11) BASE-CHAR . "trace-write") :RECORD-PATH
   #A((33) BASE-CHAR . "processes/trace-write/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((22) BASE-CHAR . "tools/check-trace.lisp")
    #A((7) BASE-CHAR . "--write"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((15) BASE-CHAR . "compile-product") :RECORD-PATH
   #A((37) BASE-CHAR . "processes/compile-product/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((43) BASE-CHAR . "/tmp/arcdocdb-archive-csn-plan-compile.lisp"))
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
  (:LABEL #A((11) BASE-CHAR . "disassembly") :RECORD-PATH
   #A((33) BASE-CHAR . "processes/disassembly/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((47) BASE-CHAR . "/tmp/arcdocdb-archive-csn-plan-disassemble.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((26) BASE-CHAR . "evidence-before-collection") :RECORD-PATH
   #A((48) BASE-CHAR . "processes/evidence-before-collection/report.lisp")
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((25) BASE-CHAR . "tools/check-evidence.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((57) BASE-CHAR
      . "/private/tmp/arcdocdb-archive-csn-plan-manifest.data.lisp")
   :BYTES 4536 :SHA256
   "df9f8bf170718fbd754c45a7c643e06b6f503119d3964114c0925608c06206cf")
  (:PATH "collection-source.lisp" :SOURCE
   #A((98) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/archive-csn-plan/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH #A((44) BASE-CHAR . "processes/compile-product/conservazione.lisp")
   :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/archive-csn-plan/ArcDocDB/spikes/out/4001154239-command-84259-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "1a51e12d55220d786d986858a8a365b2a36d5c4cb40512ae8ab6ca43576b5aa1")
  (:PATH #A((37) BASE-CHAR . "processes/compile-product/report.lisp") :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/archive-csn-plan/ArcDocDB/spikes/out/4001154239-command-84259-0/report.lisp")
   :BYTES 216523 :SHA256
   "eda43727f2a8b388523813adb31d5d2588d5d39a2e394faa42be6b86c17422ea")
  (:PATH #A((40) BASE-CHAR . "processes/disassembly/conservazione.lisp")
   :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/archive-csn-plan/ArcDocDB/spikes/out/4001154302-command-85069-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "ab9e5ebc929d01738200343bac362dd878d8b03fdaa59e1dd7e399f1415319f5")
  (:PATH #A((33) BASE-CHAR . "processes/disassembly/report.lisp") :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/archive-csn-plan/ArcDocDB/spikes/out/4001154302-command-85069-0/report.lisp")
   :BYTES 261431 :SHA256
   "b2bec2f1ac3a9f3f32921ae87643ae78b49bd9d94a5072526036c09bd1b13087")
  (:PATH
   #A((55) BASE-CHAR
      . "processes/evidence-before-collection/conservazione.lisp")
   :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/archive-csn-plan/ArcDocDB/spikes/out/4001154303-command-85083-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "81d2317092fbc333d808f91d4cc79bfc5b1b5ef54a706c8c0b53d3982344f28e")
  (:PATH
   #A((48) BASE-CHAR . "processes/evidence-before-collection/report.lisp")
   :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/archive-csn-plan/ArcDocDB/spikes/out/4001154303-command-85083-0/report.lisp")
   :BYTES 216773 :SHA256
   "cf148821a64c05064c2564caf6efcff50b84e1fbb3b2b1a081d03b0623cb497a")
  (:PATH #A((34) BASE-CHAR . "processes/links/conservazione.lisp") :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/archive-csn-plan/ArcDocDB/spikes/out/4001154239-command-84262-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "3fb0565b639864f984b5dcd61f4cab245e9cc61ce6070fc29c8c82e8fe3a81a8")
  (:PATH #A((27) BASE-CHAR . "processes/links/report.lisp") :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/archive-csn-plan/ArcDocDB/spikes/out/4001154239-command-84262-0/report.lisp")
   :BYTES 216542 :SHA256
   "3d2ae68efd19670a14a5aee915a407e109810c13ef32566a861f551071d28bd0")
  (:PATH #A((33) BASE-CHAR . "processes/lint/conservazione.lisp") :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/archive-csn-plan/ArcDocDB/spikes/out/4001154239-command-84260-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "d4a044a4624c1468618dc94e2294bd75ba90ef32ddf49ad026a2e7262eae9193")
  (:PATH #A((26) BASE-CHAR . "processes/lint/report.lisp") :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/archive-csn-plan/ArcDocDB/spikes/out/4001154239-command-84260-0/report.lisp")
   :BYTES 216545 :SHA256
   "1221b6b31710632ab0bea5807cea8cd7a9d0bf19e7769ea1695970e5bb898ce9")
  (:PATH #A((40) BASE-CHAR . "processes/trace-write/conservazione.lisp")
   :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/archive-csn-plan/ArcDocDB/spikes/out/4001154214-command-83956-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "b49c1bd6c47a36a3098548cf1ae3f56f10dd7b5a9523b95884982b99779ada9d")
  (:PATH #A((33) BASE-CHAR . "processes/trace-write/report.lisp") :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/archive-csn-plan/ArcDocDB/spikes/out/4001154214-command-83956-0/report.lisp")
   :BYTES 216633 :SHA256
   "2d099652924d936aec242743786b3505e5f25ce6371e7baa5c1556dad51af820")
  (:PATH #A((34) BASE-CHAR . "processes/trace/conservazione.lisp") :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/archive-csn-plan/ArcDocDB/spikes/out/4001154239-command-84261-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "f7c6861f1618126f45507ea0d64ba7e2939f4eb54ed6a488f5b8c295980bb0c3")
  (:PATH #A((27) BASE-CHAR . "processes/trace/report.lisp") :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/archive-csn-plan/ArcDocDB/spikes/out/4001154239-command-84261-0/report.lisp")
   :BYTES 216563 :SHA256
   "d29a973821b82c71a12a2b71c7f5f21a98ffec4feb1c4a63fbfe29d4a1e74c6e")
  (:PATH "raw/compile.lisp.txt" :SOURCE
   #A((51) BASE-CHAR . "/private/tmp/arcdocdb-archive-csn-plan-compile.lisp")
   :BYTES 399 :SHA256
   "0239483ad5b47a2d829cb60fdf2d4608ca0f852889f0aafc91f446493b45905a")
  (:PATH "raw/disassemble.lisp.txt" :SOURCE
   #A((55) BASE-CHAR
      . "/private/tmp/arcdocdb-archive-csn-plan-disassemble.lisp")
   :BYTES 671 :SHA256
   "a6180981cdae573286b58ea5ac8e1edf884c2198ade005ceb1d1a41a4ae369dc")
  (:PATH "raw/manifest-builder.lisp.txt" :SOURCE
   #A((52) BASE-CHAR . "/private/tmp/arcdocdb-archive-csn-plan-manifest.lisp")
   :BYTES 1761 :SHA256
   "3b8ba1ee61a80a1ceecadc61fc2d62ea39c26c8f30d8babf63674315a29599a8"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
