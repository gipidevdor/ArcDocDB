(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL #A((16) BASE-CHAR . "main-preparation") :RECORD-PATH
   #A((38) BASE-CHAR . "processes/main-preparation/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((151) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/collection/prepare-manifest.lisp")
    #A((10) BASE-CHAR . "--manifest")
    #A((148) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/collection/main-manifest.lisp")
    #A((8) BASE-CHAR . "--record") #A((12) BASE-CHAR . "initial-self")
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001077810-command-50855-0/report.lisp")
    #A((8) BASE-CHAR . "--record") #A((12) BASE-CHAR . "initial-full")
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001077811-command-50873-0/report.lisp")
    #A((8) BASE-CHAR . "--record") #A((10) BASE-CHAR . "fixed-self")
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078088-command-58422-0/report.lisp")
    #A((8) BASE-CHAR . "--record") #A((10) BASE-CHAR . "fixed-full")
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078089-command-58445-0/report.lisp")
    #A((8) BASE-CHAR . "--record") #A((14) BASE-CHAR . "reader-initial")
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078592-command-72804-0/report.lisp")
    #A((8) BASE-CHAR . "--record") #A((12) BASE-CHAR . "reader-fixed")
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078716-command-74447-0/report.lisp")
    #A((11) BASE-CHAR . "--case-root") #A((16) BASE-CHAR . "initial-explicit")
    #A((137) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-initial/")
    #A((11) BASE-CHAR . "--case-root") #A((14) BASE-CHAR . "fixed-explicit")
    #A((135) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/self-test-fixed/")
    #A((11) BASE-CHAR . "--case-root") #A((15) BASE-CHAR . "initial-default")
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7ftAjf/")
    #A((11) BASE-CHAR . "--case-root") #A((13) BASE-CHAR . "fixed-default")
    #A((127) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-self-test-7KiW2A/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((15) BASE-CHAR . "main-collection") :RECORD-PATH
   #A((37) BASE-CHAR . "processes/main-collection/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "tools/collect-command-archive.lisp")
    #A((9) BASE-CHAR . "--collect")
    #A((75) BASE-CHAR
       . "spikes/out/command-archive-collector-20261015/collection/main-manifest.lisp")
    #A((52) BASE-CHAR . "spikes/results/2026-10-15-command-archive-collector/")
    #A((14) BASE-CHAR . "--observations")
    #A((75) BASE-CHAR
       . "spikes/out/command-archive-collector-20261015/collection/main-observations/")
    #A((6) BASE-CHAR . "--jobs") #A((1) BASE-CHAR . "4"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/collection/final-manifest.lisp")
   :BYTES 13557 :SHA256
   "f12cd17bc0f93cea53713c87c111ebb04c9936a079d131f1359e302f5366dc5b")
  (:PATH "collection-source.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH #A((44) BASE-CHAR . "processes/main-collection/conservazione.lisp")
   :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078984-command-78811-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "a9aec463fd38d659a49ea8018b13796a61d43567e44fdf9b0cfdbb9888918326")
  (:PATH #A((37) BASE-CHAR . "processes/main-collection/report.lisp") :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078984-command-78811-0/report.lisp")
   :BYTES 396304 :SHA256
   "52237c29d0f38b92200f79b90b46e59081c91933fabe78a3b602550fa8748998")
  (:PATH #A((45) BASE-CHAR . "processes/main-preparation/conservazione.lisp")
   :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078947-command-78246-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "ddbe6eb1b0b6bbafa36d80d1a52a6e70e22b531f2f835908cc15e8ab05d56274")
  (:PATH #A((38) BASE-CHAR . "processes/main-preparation/report.lisp") :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001078947-command-78246-0/report.lisp")
   :BYTES 206759 :SHA256
   "d1f9ffbad97fbb813c38393c8f813b48fd60236c462b88c1e7f45b8313d4c59f")
  (:PATH "raw/collection/prepare-manifest.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/collection/prepare-manifest.lisp")
   :BYTES 11957 :SHA256
   "189e1cbd52cd135dc896b9feb8961ff53b999e67cd0f0f252800f0a65135a7e2")
  (:PATH
   "raw/precompile/collect-command-archive-tests-before-accessory-paren-fix-657a4fec.lisp"
   :SOURCE
   #A((200) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/collect-command-archive-tests-before-accessory-paren-fix-657a4fec.lisp")
   :BYTES 34449 :SHA256
   "5e0a444c51f96cd10d99cacf7de8926f25ecfa6270bc85313bcb143f6f0f04ae")
  (:PATH "raw/precompile/collector-before-pathname-fix.lisp" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/collector-before-pathname-fix.lisp")
   :BYTES 30821 :SHA256
   "749297a5967e60fc0c2c74c8567ebca32b18cb4b7e60d69a5c8449489c0e72da")
  (:PATH "raw/precompile/collector-before-second-read.lisp" :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/collector-before-second-read.lisp")
   :BYTES 30821 :SHA256
   "749297a5967e60fc0c2c74c8567ebca32b18cb4b7e60d69a5c8449489c0e72da")
  (:PATH "raw/precompile/collector-syntax-preparation.md.txt" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/collector-syntax-preparation.md")
   :BYTES 1249 :SHA256
   "0e3428068e3ca3740940325f5da1a46ea9dd257a5d66bfe757154809cd7b6f1d")
  (:PATH
   "raw/precompile/prepare-manifest-before-artifact-close-fix-0c1fd70a.lisp"
   :SOURCE
   #A((186) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/prepare-manifest-before-artifact-close-fix-0c1fd70a.lisp")
   :BYTES 11944 :SHA256
   "743732dc68926e08dcda2156a4e72188bf316f9f2b40d05ad486397f4ab5880b")
  (:PATH "raw/precompile/prepare-manifest-before-count-fix.lisp" :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/prepare-manifest-before-count-fix.lisp")
   :BYTES 11945 :SHA256
   "42fd67a47e00a42d05efd1b85d5e42532c40c7dbe5ba8072841410b3ca02ba7d")
  (:PATH "raw/precompile/prepare-manifest-before-syntax-fix-9d6fc0ee.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/prepare-manifest-before-syntax-fix-9d6fc0ee.lisp")
   :BYTES 11815 :SHA256
   "ad806eadb49b03fdcc4ff1776a64b9a4543c6147c25bb711c031361a5191ae28")
  (:PATH "raw/precompile/prepare-manifest-syntax-note.md.txt" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/prepare-manifest-syntax-note.md")
   :BYTES 1072 :SHA256
   "e64641e217e3e685a346ca1c1016fb3e6fc256458116cbd2f4abc3cf63dd66da")
  (:PATH "raw/precompile/read-tests-syntax-v2.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/read-tests-syntax-v2.lisp")
   :BYTES 1717 :SHA256
   "f1edd8075463e5b320230ac8c3b1f8916ed7c2bb88774d1853745fb148dd9f88")
  (:PATH "raw/precompile/read-tests-syntax-v2.status.txt" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/read-tests-syntax-v2.status.txt")
   :BYTES 2 :SHA256
   "9a271f2a916b0b6ee6cecb2426f0b3206ef074578be55d9bc94f6f3fe3ab86aa")
  (:PATH "raw/precompile/read-tests-syntax-v2.stderr.txt" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/read-tests-syntax-v2.stderr.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/precompile/read-tests-syntax-v2.stdout.txt" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/read-tests-syntax-v2.stdout.txt")
   :BYTES 146 :SHA256
   "8d3f8ad7b101f0e64d58971bb2c1028f6b1f01a7f44a1bd1875d84f20f0a71b6")
  (:PATH "raw/precompile/read-tests-syntax.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/read-tests-syntax.lisp")
   :BYTES 1713 :SHA256
   "322bbe409f93c275d43c534b3df54fab50db0ed5b515fa09952f86844bb5c289")
  (:PATH "raw/precompile/read-tests-syntax.stderr.txt" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/read-tests-syntax.stderr.txt")
   :BYTES 3657 :SHA256
   "1d2764aae924e28e90120ea3a9f5834a344f1d9733963daa52c7a9ff4a65a13b")
  (:PATH "raw/precompile/read-tests-syntax.stdout.txt" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/read-tests-syntax.stdout.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/precompile/syntax-read-collector.error.txt" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/syntax-read-collector.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/precompile/syntax-read-collector.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/syntax-read-collector.lisp")
   :BYTES 571 :SHA256
   "ff02525ade95b3394409ea4ec174dbd7927831416913c0d655cbbe788af38d1d")
  (:PATH "raw/precompile/syntax-read-collector.output.txt" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/syntax-read-collector.output.txt")
   :BYTES 51 :SHA256
   "c436a37441e2700553978752eb7fb0aa7013cf6feda9953de50da3900c838053")
  (:PATH "raw/precompile/tests-preparation-note.md.txt" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/precompile/tests-preparation-note.md")
   :BYTES 1881 :SHA256
   "63421a93f962939ff10b1cded4caeccdf488e0e80468701723e910e19de5c227")
  (:PATH "raw/review/extract-reader-status.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/extract-reader-status.lisp")
   :BYTES 921 :SHA256
   "b65751dd9212862cc9d023f05b64cc2e224fd4506da7f97e46bcd2d37aa46c25")
  (:PATH "raw/review/fix-reading.md.txt" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/fix-reading.md.txt")
   :BYTES 1103 :SHA256
   "142814edbad9d7ace29fce3f1a1ef582f07e1159f8a53711ccad8368513d125f")
  (:PATH "raw/review/prepared-final-syntax.error.log" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/prepared-final-syntax.error.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/prepared-final-syntax.output.lisp" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/prepared-final-syntax.output.lisp")
   :BYTES 76 :SHA256
   "634d2cd7c88c40322631e970fdd69b1d528273c01ecae0b7152824abb0dbaf4b")
  (:PATH "raw/review/prepared-syntax.error.log" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/prepared-syntax.error.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/prepared-syntax.output.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/prepared-syntax.output.lisp")
   :BYTES 76 :SHA256
   "1b187dcddced0219374f7282808f33552826010feec9b4b774a7d9e65fac58e9")
  (:PATH "raw/review/read-prepared-syntax.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/read-prepared-syntax.lisp")
   :BYTES 522 :SHA256
   "837e27ed119c17f0fa02edba0a5a4c21d94078ab38bc32e56b3296814d102057")
  (:PATH "raw/review/runtime-reading-launch.error.txt" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/runtime-reading-launch.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/runtime-reading-launch.output.txt" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/runtime-reading-launch.output.txt")
   :BYTES 1401 :SHA256
   "18ff74b4059be3705fc2dcd976c00a13fd7b2d3283670a7168758a3b7b401228")
  (:PATH "raw/review/runtime-reading-v1.error.log" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/runtime-reading-v1.error.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/runtime-reading-v1.output.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/runtime-reading-v1.output.lisp")
   :BYTES 142 :SHA256
   "d379098ad317431e1fe322cd4dde917496b74f1d1cfbb5a72cf7b9f27c1f0b94")
  (:PATH "raw/review/runtime-reading-v1.status.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/runtime-reading-v1.status.lisp")
   :BYTES 214 :SHA256
   "ff74ed88e93298f08f188bdc7b1cbebbb50a529c811d44329236666bfff012f0")
  (:PATH "raw/review/runtime-reading-v2-launch.error.txt" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/runtime-reading-v2-launch.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/runtime-reading-v2-launch.output.txt" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/runtime-reading-v2-launch.output.txt")
   :BYTES 1400 :SHA256
   "22a7cfce8b39bdc6618abbf72ba01fab580f3b9035d5a29b588726b2b9b828a1")
  (:PATH "raw/review/runtime-reading-v2.error.log" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/runtime-reading-v2.error.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/runtime-reading-v2.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/runtime-reading-v2.lisp")
   :BYTES 24949 :SHA256
   "7c59b30bbfe0c9452737a8358d7d7147f322440738adc19a5f58a9d5d83d8243")
  (:PATH "raw/review/runtime-reading-v2.output.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/runtime-reading-v2.output.lisp")
   :BYTES 88530 :SHA256
   "4029165e55fa1fbeea2940a2ac892cf784fdf05e1ac6407f341e889b761523a9")
  (:PATH "raw/review/runtime-reading-v2.status.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/runtime-reading-v2.status.lisp")
   :BYTES 177 :SHA256
   "a360a6228881232de37be9bc0ef74d0785a1f8437d3a9da0c3163e2c367a3561")
  (:PATH "raw/review/runtime-reading.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/runtime-reading.lisp")
   :BYTES 24153 :SHA256
   "0a947d0b8c7e9b104bae77723b67d316cfedfdfd6c2711a6d7aafbd40516b02c")
  (:PATH "raw/review/runtime-reading.md.txt" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/runtime-reading.md.txt")
   :BYTES 5148 :SHA256
   "7e8b0dc2c335aff8e6f5b29655628f6e9259f5e23034c8f4032561cd257ab7ef")
  (:PATH "raw/review/static-reading.md.txt" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/static-reading.md.txt")
   :BYTES 3896 :SHA256
   "7fcd48bc44327787ba6e547a9eb9ab059f38618ea339db68a5784be24862c9d2")
  (:PATH "raw/review/status-extraction-corrected.error.txt" :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/status-extraction-corrected.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/status-extraction-corrected.output.txt" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/status-extraction-corrected.output.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/status-extraction-error-note.txt" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/status-extraction-error-note.txt")
   :BYTES 688 :SHA256
   "12a17762b3b1c448069b3b5f99e34a731404750b76e31055e424217bde512eb2")
  (:PATH "raw/review/status-extraction-original-form.lisp.txt" :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/status-extraction-original-form.lisp.txt")
   :BYTES 634 :SHA256
   "24848c438596f4527fb996d919295ec02253f8c6d74b2fec04a7d5d388560921")
  (:PATH "raw/review/v2-syntax.error.log" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/v2-syntax.error.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/v2-syntax.output.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/command-archive-collector-20261015/review/v2-syntax.output.lisp")
   :BYTES 76 :SHA256
   "634d2cd7c88c40322631e970fdd69b1d528273c01ecae0b7152824abb0dbaf4b"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
