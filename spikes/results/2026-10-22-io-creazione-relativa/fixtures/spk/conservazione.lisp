(:FINISHED-AT-UNIVERSAL-TIME 4001238008 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((104) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237957-check-4586-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 2.230455d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57140839 :STORED-BYTES 882485
 :RESULTS
 ((:PATH
   #A((115) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237957-check-4586-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144118 :STORED-BYTES 410951 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144118 :UNCOMPRESSED-SHA256
    \"bb330dac7acb404dd8d9d8464d6936a173a5cb5647cf4a643c6408ccb62c3899\"
    :COMPRESSED-BYTES 410633 :COMPRESSED-SHA256
    \"1a767861265d527c5301e9cf81a8e78e48e1326912a6b9d172ae070b4d381396\"))
  (:PATH
   #A((115) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237957-check-4586-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28996721 :STORED-BYTES 471534 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28996721 :UNCOMPRESSED-SHA256
    \"a4daf40ea015533bcc2a68b068dd38d022f7887ab11f2c39e8c30009ea71f838\"
    :COMPRESSED-BYTES 471216 :COMPRESSED-SHA256
    \"c3926eaf6c809c4edbf505d8e21e995c5e7ed39e5a1c232aa2b8063f0ec5fbd5\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((96) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((104) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237957-check-4586-0/")
  "--jobs" "4" "--finished-owner-pid" #A((4) BASE-CHAR . "4586"))
 :STARTED-AT-UNIVERSAL-TIME 4001238005)
