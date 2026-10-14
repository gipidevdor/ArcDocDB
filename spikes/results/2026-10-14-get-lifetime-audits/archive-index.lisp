(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "collection-command" :RECORD-PATH
   "raw/collection-command/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((52) BASE-CHAR . "spikes/out/lifetime-publication/collector-batch.lisp")
    #A((52) BASE-CHAR . "spikes/out/lifetime-publication-inputs/manifest.lisp")
    #A((39) BASE-CHAR . "spikes/results/2026-10-14-get-lifetime/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "copy-audit-command" :RECORD-PATH
   "raw/copy-audit-command/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((48) BASE-CHAR . "spikes/out/lifetime-publication/audit-batch.lisp")
    #A((52) BASE-CHAR . "spikes/out/lifetime-publication-inputs/manifest.lisp")
    #A((39) BASE-CHAR . "spikes/results/2026-10-14-get-lifetime/")
    #A((66) BASE-CHAR
       . "spikes/out/lifetime-publication-inputs/archive-audit-contract.lisp")
    #A((57) BASE-CHAR
       . "spikes/out/lifetime-archive-audit/core-copy-audit-R1.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "aux-collection-R1" :RECORD-PATH "raw/aux-collection-R1/report.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((52) BASE-CHAR . "spikes/out/lifetime-publication/collector-batch.lisp")
    #A((47) BASE-CHAR . "spikes/out/lifetime-audits-inputs/manifest.lisp")
    #A((46) BASE-CHAR . "spikes/results/2026-10-14-get-lifetime-audits/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "aux-audit-placement-R1" :RECORD-PATH
   "raw/aux-audit-placement-R1/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((48) BASE-CHAR . "spikes/out/lifetime-publication/audit-batch.lisp")
    #A((47) BASE-CHAR . "spikes/out/lifetime-audits-inputs/manifest.lisp")
    #A((46) BASE-CHAR . "spikes/results/2026-10-14-get-lifetime-audits/")
    #A((47) BASE-CHAR . "spikes/out/lifetime-audits-inputs/contract.lisp")
    #A((53) BASE-CHAR
       . "spikes/out/lifetime-audit-closure/audits-copy-R1.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "link-placement-R1" :RECORD-PATH "raw/link-placement-R1/report.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "trace")
    #A((5) BASE-CHAR . "links") #A((8) BASE-CHAR . "evidence"))
   :STATUS :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "README.md" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-audits-R2-inputs/README.md.txt")
   :BYTES 1120 :SHA256
   "d0effc47142ba967f1f03f6e2efe5a7dade6fa9da99dd551128d7c8f12c1135f")
  (:PATH "archive-audit-contract.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-audits-R2-inputs/contract.lisp")
   :BYTES 587 :SHA256
   "d06a6c2c95b0dd40442e06f6d6e3334a1363d65f0f7374062f74cadbeaa358d7")
  (:PATH "archive-audit-source.txt" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-publication/audit-batch.lisp")
   :BYTES 26411 :SHA256
   "d17564b38f51cd54e7ae86241c82c0eaa81a41bc9a29ecc70a6f937d59d59173")
  (:PATH "batch-sha-source.txt" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-publication/batch-sha.lisp")
   :BYTES 5787 :SHA256
   "130f428551e1aa17a946c2614db5dc14adf9ae35309ec2b21c3be5b2d59be1da")
  (:PATH "collection-manifest.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-audits-R2-inputs/manifest.lisp")
   :BYTES 1590 :SHA256
   "5ce33fa59f24f664b79b5b532824228fb7c81b0b817753b277fc3b30d9a28a12")
  (:PATH "collection-source.txt" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-publication/collector-batch.lisp")
   :BYTES 24309 :SHA256
   "e6b2cdecbe1bf1602109161b07c7ce51c6716323238dea10e8f9cb7a96a4facf")
  (:PATH "layout-preservation.lisp" :SOURCE
   #A((94) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/evidence-backups/ArcDocDB-get-lifetime-layout-R1/preservation.lisp")
   :BYTES 4007 :SHA256
   "11c10fcf82d262f02c0e80fbc8fba3c0f5470c868a8b5fbb9b571c5b16122013")
  (:PATH "raw/aux-audit-placement-R1/conservazione.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4000998167-command-9346-0/conservazione.lisp")
   :BYTES 1159 :SHA256
   "718465da5b8f5878dcd9ace2a15e084c7c750f278ce87281feebbd16484f773b")
  (:PATH "raw/aux-audit-placement-R1/report.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4000998167-command-9346-0/report.lisp")
   :BYTES 190494 :SHA256
   "dc113e5b8ea22408d694af5b8b2a6728e3c270d5e7ea64dfef04258fbe0160d1")
  (:PATH "raw/aux-collection-R1/conservazione.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4000998082-command-8256-0/conservazione.lisp")
   :BYTES 1159 :SHA256
   "c93ec0bd51317bb7855795685c0bb9c2bdc9449909557717ae0e781b7b03be17")
  (:PATH "raw/aux-collection-R1/report.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4000998082-command-8256-0/report.lisp")
   :BYTES 184375 :SHA256
   "16f06a1e10fb8971c5ec8742f95665357aa22c73715d1b30a808a2e22930d3df")
  (:PATH "raw/collection-command/conservazione.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4000997891-command-3786-0/conservazione.lisp")
   :BYTES 1159 :SHA256
   "256bebad6f4f1dd69bedc0c1fdbffd9f94f618dbfd812c3772ddbd1858ac9ef5")
  (:PATH "raw/collection-command/report.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4000997891-command-3786-0/report.lisp")
   :BYTES 184332 :SHA256
   "61fddde7fb4e8b4d70090b619a14f2a848ab11ff2d9be624ffd2d74c411c074e")
  (:PATH "raw/copy-audit-command/conservazione.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4000997953-command-5546-0/conservazione.lisp")
   :BYTES 1159 :SHA256
   "be200917dfee74938a56deb1c48b8b341ddfec121ed798506b3b77820f100b2b")
  (:PATH "raw/copy-audit-command/report.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4000997953-command-5546-0/report.lisp")
   :BYTES 184585 :SHA256
   "90cfb277788d32fcc659ab763b8e96e7015792ef867faee2e13ac9e3da26df19")
  (:PATH "raw/copy-audit-output/core-copy-audit-R1.lisp" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/lifetime-archive-audit/core-copy-audit-R1.lisp")
   :BYTES 837221 :SHA256
   "d67b6e63a8c3359279ea4e4b86522afa771520f1bf0405cc7bca23da98a25926")
  (:PATH "raw/link-placement-R1/conservazione.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4000998167-command-9345-0/conservazione.lisp")
   :BYTES 1159 :SHA256
   "222ad6535a071879ec20a721e813e7433499cd2b7bb5e830dd797a976872b65f")
  (:PATH "raw/link-placement-R1/report.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-source-lifetime/ArcDocDB/spikes/out/4000998167-command-9345-0/report.lisp")
   :BYTES 184515 :SHA256
   "d29cde9e68ab669b23d9b5a51c540da7f97edededc2acd7e5aaa9e5c2e358cf3"))
 :LIMITS
 (:COMPLETE-EXPLICIT-GROUPS :RAW-FASL-PRESERVED-AS-DATA :SOURCE-AND-COPY-SHA256
  :LOSSLESS-GZIP-FOR-LARGE-RAW :NO-RESULT-PROMOTION))
