(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "publication-audit-R1-command" :RECORD-PATH
   "raw/publication-audit-R1-command/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((46) BASE-CHAR . "spikes/out/active-publication-audit/audit.lisp")
    #A((43) BASE-CHAR . "spikes/out/active-publication/manifest.lisp")
    #A((37) BASE-CHAR . "spikes/results/2026-10-13-get-active/")
    #A((49) BASE-CHAR . "spikes/out/active-publication-audit/contract.lisp")
    #A((57) BASE-CHAR
       . "spikes/out/active-publication-audit/archive-audit-R1.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "publication-audit-R2-command" :RECORD-PATH
   "raw/publication-audit-R2-command/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((49) BASE-CHAR . "spikes/out/active-publication-audit/audit-R2.lisp")
    #A((43) BASE-CHAR . "spikes/out/active-publication/manifest.lisp")
    #A((37) BASE-CHAR . "spikes/results/2026-10-13-get-active/")
    #A((49) BASE-CHAR . "spikes/out/active-publication-audit/contract.lisp")
    #A((57) BASE-CHAR
       . "spikes/out/active-publication-audit/archive-audit-R2.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((30) BASE-CHAR . "publication-collection-command") :RECORD-PATH
   "raw/publication-collection-command/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((42) BASE-CHAR . "spikes/out/active-publication/collect.lisp")
    #A((50) BASE-CHAR . "spikes/out/active-publication/audits-manifest.lisp")
    #A((44) BASE-CHAR . "spikes/results/2026-10-13-get-active-audits/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((26) BASE-CHAR . "publication-static-command") :RECORD-PATH
   "raw/publication-static-command/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "make") #A((8) BASE-CHAR . "evidence")
    #A((5) BASE-CHAR . "links"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "README.md" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-publication/audits-README-template.txt")
   :BYTES 1129 :SHA256
   "742801592e7501838a603407c0a125355b26f7c1cb910311c7e5673461139d56")
  (:PATH "collection-manifest.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-publication/audits-manifest.lisp")
   :BYTES 541 :SHA256
   "c6482578ea36ce4711101416755c796dc6a2187cafd1a54792770b940664717e")
  (:PATH "collection-source.txt" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-publication/collect.lisp")
   :BYTES 9914 :SHA256
   "ac7ba91fb6580801459ab7da54968b791b045b2d71b76506bb3e9b21f565ab9b")
  (:PATH "raw/independent-publication-audits/archive-audit-R1.lisp" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-publication-audit/archive-audit-R1.lisp")
   :BYTES 164429 :SHA256
   "11572bd0d5e83844893512081da29679ce6dbb37884e18f8a1053bb51a7afb7a")
  (:PATH "raw/independent-publication-audits/archive-audit-R2.lisp" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-publication-audit/archive-audit-R2.lisp")
   :BYTES 164429 :SHA256
   "1e76ed09777761a629ea6d62b9f7a2def81b7e22b77157971b092374a0573730")
  (:PATH "raw/independent-publication-audits/archive-command-R1.stderr" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-publication-audit/archive-command-R1.stderr")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/independent-publication-audits/archive-command-R1.stdout" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-publication-audit/archive-command-R1.stdout")
   :BYTES 386 :SHA256
   "858f7852824fdfeee9b51c1c62af421372da13ddfbe213cd9d9c519194e169ca")
  (:PATH "raw/independent-publication-audits/archive-command-R2.stderr" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-publication-audit/archive-command-R2.stderr")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/independent-publication-audits/archive-command-R2.stdout" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-publication-audit/archive-command-R2.stdout")
   :BYTES 389 :SHA256
   "6ca1c49efd4d84a69db68c66497d9ae7f5a95ee2bae72cb828976609fc206c6b")
  (:PATH "raw/independent-publication-audits/audit-R2.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-publication-audit/audit-R2.lisp")
   :BYTES 20120 :SHA256
   "620bd72b5f9d58dca6d8ec0863b1c99d8ab72dacd1aaf17662b5004c296ff6b3")
  (:PATH "raw/independent-publication-audits/audit.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-publication-audit/audit.lisp")
   :BYTES 20061 :SHA256
   "dee576bed743f096a52b16539febf57b5899808ca2c29bb587393196f44c1ce4")
  (:PATH "raw/independent-publication-audits/contract.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-publication-audit/contract.lisp")
   :BYTES 1950 :SHA256
   "c444256c7fafedbb0bce96bb341ac223cef960ecedc223bb4154919374fbb091")
  (:PATH "raw/publication-audit-R1-command/conservazione.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000912123-command-40577-0/conservazione.lisp")
   :BYTES 1174 :SHA256
   "da20a3973742f9fca18127ede4d0e5a243d38e84c9b3f787ed3f98618f6b9307")
  (:PATH "raw/publication-audit-R1-command/report.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000912123-command-40577-0/report.lisp")
   :BYTES 160676 :SHA256
   "5a8f1016fe02c6af9b315cc591116004a05d1acd9b54158e9a9645cb81c77221")
  (:PATH "raw/publication-audit-R2-command/conservazione.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000912695-command-53900-0/conservazione.lisp")
   :BYTES 1174 :SHA256
   "2702ede47c89b554ef47c889a31542a50e4cad130704c3c71dc5f5f442778ad5")
  (:PATH "raw/publication-audit-R2-command/report.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000912695-command-53900-0/report.lisp")
   :BYTES 160050 :SHA256
   "1112eb95d9d258e1bcc9108f430f6546335303ac431bcfb6f17f3fd0dad73bea")
  (:PATH "raw/publication-collection-command/conservazione.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000913142-command-69475-0/conservazione.lisp")
   :BYTES 1174 :SHA256
   "1e0909e2e2dfdc62e4b6f05cf6733c96d0be931fd93c7b51caa45a3fdbbc9fb1")
  (:PATH "raw/publication-collection-command/report.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000913142-command-69475-0/report.lisp")
   :BYTES 160045 :SHA256
   "194bf9c47933d60281cf77b1ddebba0d81f37b4ddab0b2a0415f2fefd4d7ed12")
  (:PATH "raw/publication-static-command/conservazione.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000913314-command-72863-0/conservazione.lisp")
   :BYTES 1174 :SHA256
   "35e8f398286f3cfc3b94726ece3f83dcf44f76d60ea6e7af8fe1e17ddaec364b")
  (:PATH "raw/publication-static-command/report.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000913314-command-72863-0/report.lisp")
   :BYTES 160073 :SHA256
   "d82c727f46c11294705862c2a2779526477b4c18f8e3c2114a0d7f8121903947"))
 :LIMITS
 (:COMPLETE-EXPLICIT-GROUPS :RAW-FASL-PRESERVED-AS-DATA :SOURCE-AND-COPY-SHA256
  :LOSSLESS-GZIP-FOR-LARGE-RAW :NO-RESULT-PROMOTION))
