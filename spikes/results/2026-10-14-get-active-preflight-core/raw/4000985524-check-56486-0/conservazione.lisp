(:FINISHED-AT-UNIVERSAL-TIME 4000985556 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((104) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/4000985524-check-56486-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.620614d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106281 :STORED-BYTES 878041
 :RESULTS
 ((:PATH
   #A((115) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/4000985524-check-56486-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144119 :STORED-BYTES 410950 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144119 :UNCOMPRESSED-SHA256
    \"19a4ca0af6bf3632473fbca914fc6e5228458719578622669aaaadd76ca0d7d6\"
    :COMPRESSED-BYTES 410632 :COMPRESSED-SHA256
    \"b8d8c43ce71b035df82fbe4d509de09dcf5aa74374683e54fa048b2abb05bb08\"))
  (:PATH
   #A((115) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/4000985524-check-56486-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28962162 :STORED-BYTES 467091 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28962162 :UNCOMPRESSED-SHA256
    \"a53330eebd9812fa74e72955c940a91e82f846743982942837b8a6d9064e1003\"
    :COMPRESSED-BYTES 466773 :COMPRESSED-SHA256
    \"bfa0196a5832b7158be377f96e1174acb2ea921ea2bb49b5af14131e99bb141d\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((95) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((104) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-active-decisions/ArcDocDB/spikes/out/4000985524-check-56486-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "56486"))
 :STARTED-AT-UNIVERSAL-TIME 4000985554)
