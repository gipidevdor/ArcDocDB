(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL #A((7) BASE-CHAR . "compile") :RECORD-PATH
   #A((29) BASE-CHAR . "processes/compile/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((45) BASE-CHAR . "/tmp/arcdocdb-recovery-selection-compile.lisp"))
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
    #A((49) BASE-CHAR . "/tmp/arcdocdb-recovery-selection-disassemble.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((52) BASE-CHAR . "/private/tmp/arcdocdb-recovery-selection-inputs.lisp")
   :BYTES 4051 :SHA256
   "fff634604289dc92a3dd22eba1d5dcfab7894fd6fb1bf5d03c69a83ba5c98892")
  (:PATH "collection-source.lisp" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH #A((36) BASE-CHAR . "processes/compile/conservazione.lisp") :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-selection-20261022/compile/conservazione.lisp")
   :BYTES 1192 :SHA256
   "7df612935ce87701353844bde3eb1cdf5b5eebe90ee993f4726c19d814e906f3")
  (:PATH #A((29) BASE-CHAR . "processes/compile/report.lisp") :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-selection-20261022/compile/report.lisp")
   :BYTES 265417 :SHA256
   "8428fd0101011f60f61ed0829b3ac1e004b49c0db1f82ccff9517938485b96cf")
  (:PATH #A((40) BASE-CHAR . "processes/disassemble/conservazione.lisp")
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-selection-20261022/disassemble/conservazione.lisp")
   :BYTES 1200 :SHA256
   "97fc2788aec81f3c944cb0585986d56fa22cc53dda20f73e14ae41dcc118ae05")
  (:PATH #A((33) BASE-CHAR . "processes/disassemble/report.lisp") :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-selection-20261022/disassemble/report.lisp")
   :BYTES 336915 :SHA256
   "6cda4cbe218be5b0565251af7e34d007dd7937bc8f4293ea4da627c28110716f")
  (:PATH #A((34) BASE-CHAR . "processes/links/conservazione.lisp") :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-selection-20261022/links/conservazione.lisp")
   :BYTES 1188 :SHA256
   "55c330af2cc15c7eb5cfb84c5f04496b39572d461d4de02a55db5c730ff36c83")
  (:PATH #A((27) BASE-CHAR . "processes/links/report.lisp") :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-selection-20261022/links/report.lisp")
   :BYTES 265433 :SHA256
   "b21187a794f0d983ae1ce9c90781f642d1d861ce4333d0d81e39068f78a1372f")
  (:PATH #A((33) BASE-CHAR . "processes/lint/conservazione.lisp") :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-selection-20261022/lint/conservazione.lisp")
   :BYTES 1186 :SHA256
   "bbb5e8bc46ecca1f8686182623a0bf12fc85cba47313525c891282f9923d9353")
  (:PATH #A((26) BASE-CHAR . "processes/lint/report.lisp") :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-selection-20261022/lint/report.lisp")
   :BYTES 265436 :SHA256
   "34b7d04df094b0e979e59ab97bcd068bce50988d0b8c657b3df341af802a04e7")
  (:PATH #A((40) BASE-CHAR . "processes/trace-write/conservazione.lisp")
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-selection-20261022/trace-write/conservazione.lisp")
   :BYTES 1200 :SHA256
   "9c4ea0326e171101c189e4ca1bf0a041d1df353d332e72ec60106a0b9b17194e")
  (:PATH #A((33) BASE-CHAR . "processes/trace-write/report.lisp") :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-selection-20261022/trace-write/report.lisp")
   :BYTES 265525 :SHA256
   "2e4d4bd2cd318825fa91a01f4547c6e11f27f5e07512e10fd91c6e282b93cad7")
  (:PATH #A((34) BASE-CHAR . "processes/trace/conservazione.lisp") :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-selection-20261022/trace/conservazione.lisp")
   :BYTES 1188 :SHA256
   "b17e0dc69e677af6bd6acf5f64554adf8f68dcfdab2c08d1d1181f9c64d2fac1")
  (:PATH #A((27) BASE-CHAR . "processes/trace/report.lisp") :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-semantic-recovery/ArcDocDB/spikes/out/recovery-selection-20261022/trace/report.lisp")
   :BYTES 265454 :SHA256
   "1b3f991a89649299850c6374487818a3ab97f755c9bc8840974ee7f8a3b57c56")
  (:PATH "raw/compile.lisp.txt" :SOURCE
   #A((53) BASE-CHAR . "/private/tmp/arcdocdb-recovery-selection-compile.lisp")
   :BYTES 399 :SHA256
   "0239483ad5b47a2d829cb60fdf2d4608ca0f852889f0aafc91f446493b45905a")
  (:PATH "raw/disassemble.lisp.txt" :SOURCE
   #A((57) BASE-CHAR
      . "/private/tmp/arcdocdb-recovery-selection-disassemble.lisp")
   :BYTES 1064 :SHA256
   "9a3584ca3a51473fe6a3d83e8dd9513b2822c36810798022c488ac10f7082806")
  (:PATH "raw/manifest-builder.lisp.txt" :SOURCE
   #A((54) BASE-CHAR
      . "/private/tmp/arcdocdb-recovery-selection-manifest.lisp")
   :BYTES 1767 :SHA256
   "2674c5878f64207025db18b59309b34804818d6ac401844d26a0f10a90290e92"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
