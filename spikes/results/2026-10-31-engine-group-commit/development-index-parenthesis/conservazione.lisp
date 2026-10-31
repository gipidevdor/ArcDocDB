(:FINISHED-AT-UNIVERSAL-TIME 4002472408 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((112) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002472398-command-95271-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 0.905804d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 1175927 :STORED-BYTES 172322
 :RESULTS
 ((:PATH
   #A((123) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002472398-command-95271-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 1175927 :STORED-BYTES 172322 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 1175927 :UNCOMPRESSED-SHA256
    \"4529bbdf96d1521ce177825b07425c842e7f3ddc28795c87ea581cc16d00fc66\"
    :COMPRESSED-BYTES 172005 :COMPRESSED-SHA256
    \"0259b3a4ab54f50036548a96a3c503bd018e63fd359dfb8a626ee5c378cb99cf\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((101) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((112) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/m1-service-index-discovery/ArcDocDB/spikes/out/4002472398-command-95271-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "95271"))
 :STARTED-AT-UNIVERSAL-TIME 4002472407)
