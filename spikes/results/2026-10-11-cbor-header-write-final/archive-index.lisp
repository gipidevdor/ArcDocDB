(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "collection" :RECORD-PATH "processes/collection/report.lisp" :STATUS
   :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((36) BASE-CHAR . "spikes/out/header-write/collect.lisp")
    #A((9) BASE-CHAR . "--collect")
    #A((48) BASE-CHAR . "spikes/out/header-write-collection-manifest.lisp")
    #A((44) BASE-CHAR . "spikes/results/2026-10-11-cbor-header-write/")))
  (:LABEL "original-archive-audit" :RECORD-PATH
   "processes/original-archive-audit/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((32) BASE-CHAR . "tools/check-command-archive.lisp")
    #A((9) BASE-CHAR . "--archive")
    #A((44) BASE-CHAR . "spikes/results/2026-10-11-cbor-header-write/"))))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write-final-manifest.lisp")
   :BYTES 995 :SHA256
   "25339ed906bb1506b7ddce96704f390663cfc493ef16006af7afff6268489fe1")
  (:PATH "collection-source.lisp" :SOURCE
   #A((101) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/collect.lisp")
   :BYTES 9677 :SHA256
   "f59f7a52934c7fe6103b5047aade87214f17494e857fe35c568968c681790d81")
  (:PATH "processes/collection/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703905-command-55149-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "44602f3a0323688daa844b141e32bcfa6ae35484d4c479e63a4af88faa123c7b")
  (:PATH "processes/collection/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703905-command-55149-0/report.lisp")
   :BYTES 115402 :SHA256
   "438cda1795fff8a30e7a6d652ef4b7b9e949ba0ded5af8ca2c1554f02d276f1e")
  (:PATH "processes/original-archive-audit/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704146-command-58659-0/conservazione.lisp")
   :BYTES 1155 :SHA256
   "faffffad21f9f8413c04363a9981f93a1c4b05f8a5d8041c8de81eac793c04de")
  (:PATH "processes/original-archive-audit/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704146-command-58659-0/report.lisp")
   :BYTES 119653 :SHA256
   "0b55a6575af61fd59bc765816565e57f89b2dbbbd7cbec72b5145a4d0d258141")
  (:PATH "raw/publication/archive-audit.stderr.log" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write-archive-audit.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/publication/archive-audit.stdout.log" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write-archive-audit.stdout.log")
   :BYTES 269 :SHA256
   "c64500302557205d6ff37274f315afbcd9983b63f7a5868ca9812f0d53e23171")
  (:PATH "raw/publication/cbor-scrittura-risultati.md.txt" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/docs/implementazione/cbor-scrittura-risultati.md")
   :BYTES 6048 :SHA256
   "bcafebb6a7f02c29042f3035ac3921cb106b1e999e1e4035e2c4e1077f953668")
  (:PATH "raw/publication/collection.stderr.log" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write-collection.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/publication/collection.stdout.log" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write-collection.stdout.log")
   :BYTES 322 :SHA256
   "e1698023b0a0aaff4656173385426249faa6fb6c72a1bf2eab9503a192c63b61")
  (:PATH "raw/publication/manifest.stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write-manifest.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/publication/manifest.stdout.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write-manifest.stdout.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"))
 :LIMITS
 (:SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :FASL-EXCLUDED-FROM-PUBLISHED-MUTATION-TREES
  :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
