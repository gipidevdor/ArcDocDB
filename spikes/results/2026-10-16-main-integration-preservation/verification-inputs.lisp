(:SCHEMA-VERSION 1 :KIND :INTEGRATION-VERIFICATION-INPUT-AUDIT :STATUS :OK
 :MAIN-AT-AUDIT "435866f66099bd0d05623701d3bcf79b8481dc0d" :SCRIPT-BLOB
 "d2372bfe0175ee6de10f2a88009403daca62b825" :CURRENT-INPUT-COUNT 745 :CHECKS
 ((:RECORD
   "spikes/results/2026-10-16-fulltext-document-final-check/report.lisp"
   :STATUS :OK :SOURCE-CONSISTENCY :STABLE :ORIGINAL-COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :ORIGINAL-COMMIT "fd4ffcb221dd800ae9297f66f7b11023cf2d49f1" :MATCHING-INPUTS
   745 :ALL-CURRENT-INPUTS-COVERED T)
  (:RECORD "spikes/results/2026-10-16-fulltext-document-ci-linux/report.lisp"
   :STATUS :OK :SOURCE-CONSISTENCY :STABLE :ORIGINAL-COMMAND
   (#A((4) BASE-CHAR . "make") #A((10) BASE-CHAR . "check-core"))
   :ORIGINAL-COMMIT "d5ba9a64858959f815f86dc6e266e6e1a3114011" :MATCHING-INPUTS
   745 :ALL-CURRENT-INPUTS-COVERED T)
  (:RECORD "spikes/results/2026-10-16-fulltext-document-ci-macos/report.lisp"
   :STATUS :OK :SOURCE-CONSISTENCY :STABLE :ORIGINAL-COMMAND
   (#A((60) BASE-CHAR
       . "/Applications/Xcode_26.6.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :ORIGINAL-COMMIT "d5ba9a64858959f815f86dc6e266e6e1a3114011" :MATCHING-INPUTS
   745 :ALL-CURRENT-INPUTS-COVERED T))
 :SCOPE
 ("src/" "tests/" "tools/" "data/" ".github/" "spikes/SPK-" "Makefile"
  "arcdocdb.asd")
 :LIMITS
 (:EXACT-GIT-BLOB-COMPARISON :DOCUMENTATION-CHECKED-SEPARATELY
  :NO-NEW-RUNTIME-EXECUTION :NO-ENGINE-QUALIFICATION-PROMOTION))
