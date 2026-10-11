(:FINISHED-AT-UNIVERSAL-TIME 4000712003 :STATUS :OK :STDERR "" :STDOUT
 "(:SCHEMA-VERSION 1 :KIND :EVIDENCE-COMPACTION :STATUS :OK :ROOT
 #A((100) BASE-CHAR
    . \"/Users/gpicchiarelli/.codex/worktrees/get-verification/ArcDocDB/spikes/out/4000711969-check-74323-0/\")
 :JOBS 4 :MINIMUM-AGE-SECONDS 0 :FILES 2 :WALL-SECONDS 1.717373d0
 :CLOCK-UNITS-PER-SECOND 1000000 :ORIGINAL-BYTES 57106058 :STORED-BYTES 878164
 :RESULTS
 ((:PATH
   #A((111) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-verification/ArcDocDB/spikes/out/4000711969-check-74323-0/SPK-07.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28144051 :STORED-BYTES 410955 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"SPK-07.lisp.gz\" :UNCOMPRESSED-BYTES 28144051 :UNCOMPRESSED-SHA256
    \"7c76078bb51a5110f7eeb64cd4b5f248ac97e81896d130e64a0161b47e69fc74\"
    :COMPRESSED-BYTES 410637 :COMPRESSED-SHA256
    \"d7ae3aa57a844695762e95dfee3752e1106fd73d5856a8fadf2bc1d9c78e5d19\"))
  (:PATH
   #A((111) BASE-CHAR
      . \"/Users/gpicchiarelli/.codex/worktrees/get-verification/ArcDocDB/spikes/out/4000711969-check-74323-0/report.lisp\")
   :STATUS :OK :ORIGINAL-BYTES 28962007 :STORED-BYTES 467209 :DESCRIPTOR
   (:SCHEMA-VERSION 1 :KIND :COMPRESSED-EVIDENCE :CODEC :GZIP :PAYLOAD
    \"report.lisp.gz\" :UNCOMPRESSED-BYTES 28962007 :UNCOMPRESSED-SHA256
    \"a304f60bc287dabb2fb89d2d1ee1f6c186f67ad7bc8cfed74033aa25eff9bff3\"
    :COMPRESSED-BYTES 466891 :COMPRESSED-SHA256
    \"b702e15a51522d808873d1483d87dc80cf70d2659fe48353610d668303ca568d\")))
 :LIMITS
 (:LOSSLESS-BYTE-VERIFICATION :NO-GIT-HISTORY-REWRITE
  :REQUIRES-IMMUTABLE-INPUT-FILES :NO-POWER-LOSS-DURABILITY-CLAIM))
"
 :EXIT-CODE 0 :SCHEMA-VERSION 1 :KIND :EVIDENCE-FINALIZATION :COMMAND
 (#A((48) BASE-CHAR . "/opt/homebrew/Cellar/sbcl/2.6.9/libexec/bin/sbcl")
  "--dynamic-space-size" "2048" "--noinform" "--no-userinit" "--no-sysinit"
  "--script"
  #A((91) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-verification/ArcDocDB/tools/compact-evidence.lisp")
  "--root"
  #A((100) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/get-verification/ArcDocDB/spikes/out/4000711969-check-74323-0/")
  "--jobs" "4" "--finished-owner-pid" #A((5) BASE-CHAR . "74323"))
 :STARTED-AT-UNIVERSAL-TIME 4000712000)
