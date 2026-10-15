(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "integration-before-raw-doc-rename" :RECORD-PATH
   #A((55) BASE-CHAR
      . "processes/integration-before-raw-doc-rename/report.lisp")
   :COMMAND
   (#A((4) BASE-CHAR . "make") #A((4) BASE-CHAR . "test")
    #A((4) BASE-CHAR . "lint") #A((5) BASE-CHAR . "trace")
    #A((5) BASE-CHAR . "links"))
   :STATUS :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "raw-doc-rename" :RECORD-PATH
   #A((36) BASE-CHAR . "processes/raw-doc-rename/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((72) BASE-CHAR
       . "spikes/out/cbor-string-read-20261015/selection/rename-raw-documents.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "links-after-raw-doc-rename" :RECORD-PATH
   #A((48) BASE-CHAR . "processes/links-after-raw-doc-rename/report.lisp")
   :COMMAND (#A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "links")) :STATUS
   :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "compact-coverage" :RECORD-PATH
   #A((38) BASE-CHAR . "processes/compact-coverage/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((27) BASE-CHAR . "tools/compact-evidence.lisp")
    #A((6) BASE-CHAR . "--root")
    #A((37) BASE-CHAR . "spikes/out/cbor-string-read-20261015/")
    #A((6) BASE-CHAR . "--jobs") #A((1) BASE-CHAR . "4"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "selection-plan-initial" :RECORD-PATH
   #A((44) BASE-CHAR . "processes/selection-plan-initial/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((63) BASE-CHAR
       . "spikes/out/cbor-string-read-20261015/selection/create-plan.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "selection-plan-corrected" :RECORD-PATH
   #A((46) BASE-CHAR . "processes/selection-plan-corrected/report.lisp")
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((63) BASE-CHAR
       . "spikes/out/cbor-string-read-20261015/selection/create-plan.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "selection-main" :RECORD-PATH
   #A((36) BASE-CHAR . "processes/selection-main/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((59) BASE-CHAR
       . "spikes/out/cbor-string-read-20261015/selection/prepare.lisp")
    #A((64) BASE-CHAR
       . "spikes/out/cbor-string-read-20261015/selection/main-plan-v2.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "independent-integration" :RECORD-PATH
   #A((45) BASE-CHAR . "processes/independent-integration/report.lisp")
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((73) BASE-CHAR
       . "spikes/out/cbor-string-read-20261015/independent-integration/reading.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "main-collection" :RECORD-PATH
   #A((37) BASE-CHAR . "processes/main-collection/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "tools/collect-command-archive.lisp")
    #A((9) BASE-CHAR . "--collect")
    #A((47) BASE-CHAR . "spikes/out/cbor-string-read-manifests/main.lisp")
    #A((43) BASE-CHAR . "spikes/results/2026-10-15-cbor-string-read/")
    #A((14) BASE-CHAR . "--observations")
    #A((44) BASE-CHAR . "spikes/out/cbor-string-read-collection-main/")
    #A((6) BASE-CHAR . "--jobs") #A((1) BASE-CHAR . "4"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-manifests/final.lisp")
   :BYTES 8713 :SHA256
   "7acf7a4c56817c1710e6b928ba29640bb7f55a5e768d767413ce6ba256a912c9")
  (:PATH "collection-source.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH #A((45) BASE-CHAR . "processes/compact-coverage/conservazione.lisp")
   :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085907-command-57424-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "76f90d3ac0a51f5d4c66fe7625ca6c88648963c7d461c1eb974ec76ce42a8dd4")
  (:PATH #A((38) BASE-CHAR . "processes/compact-coverage/report.lisp") :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085907-command-57424-0/report.lisp")
   :BYTES 213044 :SHA256
   "327422168f9564e6957724c1eb6715599d50903145d5735eea33ba11e9e58a2e")
  (:PATH
   #A((52) BASE-CHAR . "processes/independent-integration/conservazione.lisp")
   :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001086202-command-65022-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "177c0644437922a649651cbe642138e667938d5669fab44761c3e43606c7704a")
  (:PATH #A((45) BASE-CHAR . "processes/independent-integration/report.lisp")
   :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001086202-command-65022-0/report.lisp")
   :BYTES 218730 :SHA256
   "3b6ec87345bc3bea0ba4d6f0857cbdbb3be119d111069aee4ac633736d2f063d")
  (:PATH
   #A((62) BASE-CHAR
      . "processes/integration-before-raw-doc-rename/conservazione.lisp")
   :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085841-command-55587-0/conservazione.lisp")
   :BYTES 1772 :SHA256
   "62be05aa7e6b4fdbf62e23875f31b095ffddf76dcbe81e57abc37ac33594cf14")
  (:PATH
   #A((55) BASE-CHAR
      . "processes/integration-before-raw-doc-rename/report.lisp")
   :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085841-command-55587-0/report.lisp")
   :BYTES 317 :SHA256
   "19d36eaac08b5e9b6ec508a2ef897ded76460ed6a44ace8d4155c9c67a33c26c")
  (:PATH
   #A((58) BASE-CHAR
      . "processes/integration-before-raw-doc-rename/report.lisp.gz")
   :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085841-command-55587-0/report.lisp.gz")
   :BYTES 200796 :SHA256
   "a42545addb881a8a3417227e0e7cce44646bd57305d21e2912b7a8f475d02035")
  (:PATH
   #A((55) BASE-CHAR
      . "processes/links-after-raw-doc-rename/conservazione.lisp")
   :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001086070-command-61411-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "82043a250cac14396eea792a5e28e8cbe54f55187d0e7201881ff70aada0f64c")
  (:PATH
   #A((48) BASE-CHAR . "processes/links-after-raw-doc-rename/report.lisp")
   :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001086070-command-61411-0/report.lisp")
   :BYTES 211713 :SHA256
   "aeeb02065f96b702d5b815f8dfed8f4a6d16ee87cb365f13c5566d49066650f9")
  (:PATH #A((44) BASE-CHAR . "processes/main-collection/conservazione.lisp")
   :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001086126-command-62500-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "fa200954b99c219dcb8c675c702e24a90e5dc61e4fa921801eea39847d0d2f03")
  (:PATH #A((37) BASE-CHAR . "processes/main-collection/report.lisp") :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001086126-command-62500-0/report.lisp")
   :BYTES 446107 :SHA256
   "129fd918b02c804e954ee73b1c4f2fd4a0977f27c2140889fd8369a72c6e0bd6")
  (:PATH #A((43) BASE-CHAR . "processes/raw-doc-rename/conservazione.lisp")
   :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001086038-command-60740-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "528ab65eb20cb8395f13ebc6f4aaaafb668122757c1c90c9f5489388c6ac2add")
  (:PATH #A((36) BASE-CHAR . "processes/raw-doc-rename/report.lisp") :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001086038-command-60740-0/report.lisp")
   :BYTES 214827 :SHA256
   "ee374b67c902eabf8d729940166003fdad3b59b9d38ce0a6876bb433271da6f8")
  (:PATH #A((43) BASE-CHAR . "processes/selection-main/conservazione.lisp")
   :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001086087-command-61648-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "1004062b63f198f3887260921d2f26f539d7e1a42a308dff778be376bee85917")
  (:PATH #A((36) BASE-CHAR . "processes/selection-main/report.lisp") :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001086087-command-61648-0/report.lisp")
   :BYTES 213730 :SHA256
   "b9d32be2fa2de6edf90ea2b1139c904ebcc01a9c25198e8ebe2e41a044dcdc99")
  (:PATH
   #A((53) BASE-CHAR . "processes/selection-plan-corrected/conservazione.lisp")
   :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001086070-command-61410-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "1a6a22a9c2839dbc6c4153ca95e902a95317bdce2d35f531b40fd6b96dee6648")
  (:PATH #A((46) BASE-CHAR . "processes/selection-plan-corrected/report.lisp")
   :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001086070-command-61410-0/report.lisp")
   :BYTES 212191 :SHA256
   "07f1c0b80c8c7b719eef60681b98099f18b8f891d2d920474554344b2e3c5651")
  (:PATH
   #A((51) BASE-CHAR . "processes/selection-plan-initial/conservazione.lisp")
   :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085963-command-59411-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "f927a9901da94f910719c2e08de2588349984aba46cf38d1cc60327a01c4338e")
  (:PATH #A((44) BASE-CHAR . "processes/selection-plan-initial/report.lisp")
   :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085963-command-59411-0/report.lisp")
   :BYTES 212183 :SHA256
   "9a56cb956eedc09ba3575c0429133325fe2f0ff34661de1b427104415f2dc1df")
  (:PATH
   "raw/frozen/spikes/results/2026-10-15-cbor-string-read/archive-index.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/results/2026-10-15-cbor-string-read/archive-index.lisp")
   :BYTES 227717 :SHA256
   "82a8c88cb0b6961677ae5ad430114596f4818196f0f5d5de8ace1d7690442b7c")
  (:PATH "raw/frozen/spikes/results/2026-10-15-cbor-string-read/catalogo.lisp"
   :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/results/2026-10-15-cbor-string-read/catalogo.lisp")
   :BYTES 396 :SHA256
   "15f799b88c33b7d1d188b28bb0b1a3d9b2a7378cd774f821fe55dbeef83d4c50")
  (:PATH "raw/independent-integration/inspect-records.error.txt" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-integration/inspect-records.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/independent-integration/inspect-records.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-integration/inspect-records.lisp")
   :BYTES 1355 :SHA256
   "eb3fc19aa072f6bd57b57ddea20dfa86b1b7aa8fd0f033a26203ddf5f7d5eecb")
  (:PATH "raw/independent-integration/inspect-records.output.txt" :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-integration/inspect-records.output.txt")
   :BYTES 7833 :SHA256
   "63c713ac459f7717ea51c622bdaf8652f5294ba62309c5c96793a279a82f9040")
  (:PATH "raw/independent-integration/reading.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-integration/reading.lisp")
   :BYTES 9878 :SHA256
   "78412e732b12ac611f3a119cc8a1bca52eb1807b4efbfa5d02aca5aa2d1bf4ec")
  (:PATH "raw/independent-integration/reading.md.txt" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-integration/reading.md")
   :BYTES 4409 :SHA256
   "1eae0ea3ec80df41eaea98656c983e2cf0a45da0661af05d191ea0825d9e4a90")
  (:PATH "raw/main-collection-observations/closed-check.log" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-collection-main/closed-check.log")
   :BYTES 3695 :SHA256
   "493800db587859117c3d852fb5449818c78c7b3073489d3d3f017b929c336f1c")
  (:PATH "raw/main-collection-observations/report.lisp" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-collection-main/report.lisp")
   :BYTES 249709 :SHA256
   "72ffe52faad14c9e20384f641a523419f57bc496433901ff5b8e5cc156f3bac9")
  (:PATH "raw/selection/create-plan.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/final-selection/create-plan.lisp")
   :BYTES 2458 :SHA256
   "9d8a1d10ad1d1c806d8c68b6d02eb8442e9a20c937dd35cf071ff82c49c87948")
  (:PATH "raw/selection/plan.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/final-selection/plan.lisp")
   :BYTES 2537 :SHA256
   "e086862703d054231d7f43486cb4166157c6bc6c2382ffb36cfa0094d99d426a"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
