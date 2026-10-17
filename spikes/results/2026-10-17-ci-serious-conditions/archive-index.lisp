(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL #A((5) BASE-CHAR . "run-0") :RECORD-PATH
   "processes/run-0/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((50) BASE-CHAR . "spikes/out/ci-serious-20261017/run-conditions.lisp")
    #A((40) BASE-CHAR . "spikes/out/ci-serious-20261017/baseline/"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((5) BASE-CHAR . "run-1") :RECORD-PATH
   "processes/run-1/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((50) BASE-CHAR . "spikes/out/ci-serious-20261017/run-conditions.lisp")
    #A((42) BASE-CHAR . "spikes/out/ci-serious-20261017/baseline-2/"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((5) BASE-CHAR . "run-2") :RECORD-PATH
   "processes/run-2/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((50) BASE-CHAR . "spikes/out/ci-serious-20261017/run-conditions.lisp")
    #A((52) BASE-CHAR
       . "spikes/out/ci-serious-20261017/baseline-source-only/"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((5) BASE-CHAR . "run-3") :RECORD-PATH
   "processes/run-3/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((50) BASE-CHAR . "spikes/out/ci-serious-20261017/run-conditions.lisp")
    #A((41) BASE-CHAR . "spikes/out/ci-serious-20261017/corrected/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((5) BASE-CHAR . "run-4") :RECORD-PATH
   "processes/run-4/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((13) BASE-CHAR . "tools/ci.lisp")
    #A((9) BASE-CHAR . "self-test") #A((5) BASE-CHAR . "--out")
    #A((44) BASE-CHAR . "spikes/out/ci-serious-20261017/ci-self-test/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL #A((5) BASE-CHAR . "run-5") :RECORD-PATH
   "processes/run-5/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "trace")) :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/ci-serious-20261017/collection-manifest.lisp")
   :BYTES 4505 :SHA256
   "19d364e52f49b5b2708482ef5a8a4a527c369a7ff99f90bb99ed982fdf13be5f")
  (:PATH "collection-source.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH "processes/run-0/conservazione.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001222449-command-88849-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "1121e4f2049e43d544d7d5704ca3acdd3894e6ec89a8ab127140df87c3d32b78")
  (:PATH "processes/run-0/report.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001222449-command-88849-0/report.lisp")
   :BYTES 300999 :SHA256
   "01aa374a8111d288458ba693e388304d107407ae3b1b307a0a196160c9a3949b")
  (:PATH "processes/run-1/conservazione.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001222488-command-89920-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "01752595d9cb7210ad9f8b0be9a0e21e387f4622d276b5d56aacd730b0f2c11a")
  (:PATH "processes/run-1/report.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001222488-command-89920-0/report.lisp")
   :BYTES 257263 :SHA256
   "3260f3e68e447d861073350e760f0e5a72198970b6554548558b7949e002a299")
  (:PATH "processes/run-2/conservazione.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001222554-command-90399-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "ba9ba45df576944fe14aefa16d6ac6f9a1f0eb6b0bd8ba4e3199eaa94b378963")
  (:PATH "processes/run-2/report.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001222554-command-90399-0/report.lisp")
   :BYTES 257219 :SHA256
   "d589a9610b2cea2d1311f803f1532620823d11306ce2ef5f0e060404b8339d59")
  (:PATH "processes/run-3/conservazione.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001222605-command-91046-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "ff196d2c292b71896a8cbd240bc30658ad7d5a1f614d5ba540c4476bea3587b6")
  (:PATH "processes/run-3/report.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001222605-command-91046-0/report.lisp")
   :BYTES 257036 :SHA256
   "bb7a45964fb73a573481986bc4f629c36f6c667ca4d5605eebf3688b6f9fae6c")
  (:PATH "processes/run-4/conservazione.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001222639-command-91210-0/conservazione.lisp")
   :BYTES 1180 :SHA256
   "7578bdafc102a8b31f8c0da5dacff76631941a1d96dd7ce0935e23736eb822e6")
  (:PATH "processes/run-4/report.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001222639-command-91210-0/report.lisp")
   :BYTES 256942 :SHA256
   "14da7289dbc5cbfe4b1c05bd99dab73b29d0a51abe67c322b4e44fde1020e7c9")
  (:PATH "processes/run-5/conservazione.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001222700-command-91827-0/conservazione.lisp")
   :BYTES 1180 :SHA256
   "fb8affdbdd301ea6e5a6e27d584f00015bf282046089f6abd558bc811a4d8452")
  (:PATH "processes/run-5/report.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001222700-command-91827-0/report.lisp")
   :BYTES 256098 :SHA256
   "d9ebaa2ed471924af7faa4894a02608231088f1e98cc1c009e0ccf84e81389c7")
  (:PATH "raw.tar.gz" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/ci-serious-raw-20261017.tar.gz")
   :BYTES 49460 :SHA256
   "e1c899040a47c7a0d70e78b3633bff92734223a3de7468f6158ffa111094bcb3")
  (:PATH "sources/prepare-archive.lisp" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/ci-serious-20261017/prepare-archive.lisp")
   :BYTES 2714 :SHA256
   "f83499fee047194c923aed7e2cd4a9197fe80507709dceb5486eba4f13e4d1e2")
  (:PATH "sources/run-conditions.lisp" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/ci-serious-20261017/run-conditions.lisp")
   :BYTES 1061 :SHA256
   "70c987fa019a93fc268d65e870525bb50a92d84279f8c66e354b297ac18c3ad5")
  (:PATH "sources/tests/ci-catalog.lisp" :SOURCE
   #A((94) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tests/ci-catalog.lisp")
   :BYTES 23753 :SHA256
   "7d43469147ab75659085e7149791c00cf89a6d48927a658384040f776fe85e34")
  (:PATH "sources/tools/ci.lisp" :SOURCE
   #A((86) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/ci.lisp")
   :BYTES 1258 :SHA256
   "c3b9a7cf9a7f58bacfea4c32e2f0c25a75a9786056a0c9bd86fd7e196cf9197b")
  (:PATH "sources/tools/ci/conditions-self-test.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/ci/conditions-self-test.lisp")
   :BYTES 14412 :SHA256
   "46ea15b0a1c28b1eda0112966bb716a7248666ccc20461248147c2f6a6b2f634")
  (:PATH "sources/tools/ci/self-test.lisp" :SOURCE
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/ci/self-test.lisp")
   :BYTES 10068 :SHA256
   "2b73fbf314540ea2100228ddf8fa008e7ef9452be102b54c64e896c9ba9029cf"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
