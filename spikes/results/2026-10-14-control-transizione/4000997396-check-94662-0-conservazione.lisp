(:FINISHED-AT-UNIVERSAL-TIME 4000997427 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((103) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/control-transizione/ArcDocDB/spikes/out/4000997396-check-94662-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.625917d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106776 :STORED-BYTES 878410
 :RESULTS
 ((:PATH
   #A((114) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/control-transizione/ArcDocDB/spikes/out/4000997396-check-94662-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144049 :STORED-BYTES 410958 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144049 :UNCOMPRESSED-SHA256
    \"896b4c068de9d156ab5b1d437dd0c7f12b3fa227a9e135c52f3adf1dbfe3fbe9\"
    :COMPRESSED-BYTES 410640 :COMPRESSED-SHA256
    \"e401db94e604450330f153032c236c330cc5ab36875cb1554712181084b996cf\"))
  (:PATH
   #A((114) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/control-transizione/ArcDocDB/spikes/out/4000997396-check-94662-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28962727 :STORED-BYTES 467452 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28962727 :UNCOMPRESSED-SHA256
    \"558f70b206cc0e087461a953c6f202b077945f69c6caaed214a78adaca396702\"
    :COMPRESSED-BYTES 467134 :COMPRESSED-SHA256
    \"ce89230c181c4a7579391f7e8c3484e77c495359a7ff7d80f58d7089ccc1997a\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((94) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/control-transizione/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((103) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/control-transizione/ArcDocDB/spikes/out/4000997396-check-94662-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "94662"))
 :STARTED-AT-UNIVERSAL-TIME 4000997425)
