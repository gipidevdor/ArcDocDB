(:FINISHED-AT-UNIVERSAL-TIME 4000985219 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((114) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-publication-staging/4000985216-46693/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 1 :WALL-SECONDS 2.25935d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 2542476 :STORED-BYTES 361641
 :RESULTS
 ((:PATH
   #A((138) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-publication-staging/4000985216-46693/development-large-1.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 2542476 :STORED-BYTES 361641 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"development-large-1.lisp.gz\" :UNCOMPRESSED-BYTES 2542476
    :UNCOMPRESSED-SHA256
    \"01ecf789c04a6e74753a573d7a30fcf2e7076eb8a6fae4f95b5b2aea5f61b25d\"
    :COMPRESSED-BYTES 361311 :COMPRESSED-SHA256
    \"caa506f2c997fce2c9971401e05e4a23b1e11a4d38a2f12b2455ead35b82c193\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((88) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((53) BASE-CHAR . "spikes/out/pool-publication-staging/4000985216-46693/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "46693"))
 :STARTED-AT-UNIVERSAL-TIME 4000985216)
