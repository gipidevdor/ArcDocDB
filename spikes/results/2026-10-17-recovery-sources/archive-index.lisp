(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "initial-compile" :RECORD-PATH
   "processes/initial-compile/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "make") #A((4) BASE-CHAR . "test")
    #A((4) BASE-CHAR . "lint") #A((5) BASE-CHAR . "trace")
    #A((5) BASE-CHAR . "links"))
   :STATUS :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "initial-budgets" :RECORD-PATH
   "processes/initial-budgets/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "make") #A((4) BASE-CHAR . "test")
    #A((4) BASE-CHAR . "lint") #A((5) BASE-CHAR . "trace")
    #A((5) BASE-CHAR . "links"))
   :STATUS :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "mutation-self-initial" :RECORD-PATH
   "processes/mutation-self-initial/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-mutation.lisp")
    #A((11) BASE-CHAR . "--self-test"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "targeted-first" :RECORD-PATH "processes/targeted-first/report.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((38) BASE-CHAR . "spikes/out/sources-audit/targeted.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "targeted-symlink" :RECORD-PATH
   "processes/targeted-symlink/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((38) BASE-CHAR . "spikes/out/sources-audit/targeted.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "targeted-before-nesting-fix" :RECORD-PATH
   "processes/targeted-before-nesting-fix/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((38) BASE-CHAR . "spikes/out/sources-audit/targeted.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "mutation-before-nesting-fix" :RECORD-PATH
   "processes/mutation-before-nesting-fix/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-mutation.lisp")
    #A((5) BASE-CHAR . "--run")
    #A((29) BASE-CHAR . "spikes/out/sources-mutations/")
    #A((17) BASE-CHAR . "inventory-sources") #A((6) BASE-CHAR . "--jobs")
    #A((1) BASE-CHAR . "4"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "coverage-before-nesting-fix" :RECORD-PATH
   "processes/coverage-before-nesting-fix/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((8) BASE-CHAR . "--report")
    #A((28) BASE-CHAR . "spikes/out/sources-coverage/")
    #A((8) BASE-CHAR . "recovery"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "check-interrupted" :RECORD-PATH
   "processes/check-interrupted/report.lisp" :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :FAILED :EXIT-CODE 143 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "targeted-u64-history" :RECORD-PATH
   "processes/targeted-u64-history/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((38) BASE-CHAR . "spikes/out/sources-audit/targeted.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "targeted-final" :RECORD-PATH "processes/targeted-final/report.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((38) BASE-CHAR . "spikes/out/sources-audit/targeted.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "mutation-self-merge-diagnostic" :RECORD-PATH
   "processes/mutation-self-merge-diagnostic/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-mutation.lisp")
    #A((11) BASE-CHAR . "--self-test"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "mutation-self-final" :RECORD-PATH
   "processes/mutation-self-final/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-mutation.lisp")
    #A((11) BASE-CHAR . "--self-test"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "mutation-final" :RECORD-PATH "processes/mutation-final/report.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-mutation.lisp")
    #A((5) BASE-CHAR . "--run")
    #A((35) BASE-CHAR . "spikes/out/sources-mutations-final/")
    #A((17) BASE-CHAR . "inventory-sources") #A((6) BASE-CHAR . "--jobs")
    #A((1) BASE-CHAR . "4"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "coverage-final" :RECORD-PATH "processes/coverage-final/report.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((8) BASE-CHAR . "--report")
    #A((34) BASE-CHAR . "spikes/out/sources-coverage-final/")
    #A((8) BASE-CHAR . "recovery"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "check-final" :RECORD-PATH "processes/check-final/report.lisp"
   :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "targeted-count-final" :RECORD-PATH
   "processes/targeted-count-final/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((38) BASE-CHAR . "spikes/out/sources-audit/targeted.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/manifest.lisp")
   :BYTES 71493 :SHA256
   "433b9ef39c4c936d9d1ef0216b71bcfa918e8223fe8e5fe0f2088b069f11a5f2")
  (:PATH "collection-source.lisp" :SOURCE
   #A((95) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH "processes/check-final/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217731-command-86347-0/conservazione.lisp")
   :BYTES 1721 :SHA256
   "f6666604595daea5cd0098eaea3773a3838cf15722d69061cb8d4b3791b0a626")
  (:PATH "processes/check-final/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217731-command-86347-0/report.lisp")
   :BYTES 317 :SHA256
   "eba7ae6938f7efd9a507c3cf110d81a158750cfb6a32c2960adfc8ac104897e9")
  (:PATH "processes/check-final/report.lisp.gz" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217731-command-86347-0/report.lisp.gz")
   :BYTES 252329 :SHA256
   "779955c0e717f624f8b0eb0f0b54cc02a3e581040d5a34e0ae97dc7afec02785")
  (:PATH "processes/check-interrupted/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217447-command-80269-0/conservazione.lisp")
   :BYTES 1721 :SHA256
   "91aed26a6d7bc4fb433fdc4776d82248d87ff812bc4d35df836280422404e5b0")
  (:PATH "processes/check-interrupted/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217447-command-80269-0/report.lisp")
   :BYTES 317 :SHA256
   "6285da0970b2f03fe330ad1879609169d59f998848b06ae3747e436994d58f99")
  (:PATH "processes/check-interrupted/report.lisp.gz" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217447-command-80269-0/report.lisp.gz")
   :BYTES 242857 :SHA256
   "383b73393b5929488c499f54a29d504325e9d1747a7371923e348b7c792d4a16")
  (:PATH "processes/coverage-before-nesting-fix/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217447-command-80246-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "faf14de0849a0f461363358de5d5e64d4e6101800f8350bc9e592ad88e9dbe56")
  (:PATH "processes/coverage-before-nesting-fix/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217447-command-80246-0/report.lisp")
   :BYTES 257017 :SHA256
   "b731282c990026d0a82d7ad90aa838625efdf65157d2fd3584853096c6d20319")
  (:PATH "processes/coverage-final/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217731-command-86325-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "d67fe383a8428e5cbd66c8f57eea13e611d77a8a1e7ac679bf91ce1e207cc5c9")
  (:PATH "processes/coverage-final/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217731-command-86325-0/report.lisp")
   :BYTES 258694 :SHA256
   "05ea595156b25b238e1891e097d1f80647e318d5a1e642e1d11b1631671a34f2")
  (:PATH "processes/initial-budgets/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217279-command-77284-0/conservazione.lisp")
   :BYTES 1721 :SHA256
   "479c8814c0e25e81b6c95c4e9f60dedddac52670135e37a124fd039448114876")
  (:PATH "processes/initial-budgets/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217279-command-77284-0/report.lisp")
   :BYTES 317 :SHA256
   "2b88262f60b1e7c0de38274c4bdb254a24757c39deeccba43c8a4b624912f6c0")
  (:PATH "processes/initial-budgets/report.lisp.gz" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217279-command-77284-0/report.lisp.gz")
   :BYTES 228193 :SHA256
   "1ca1be09c5626cb19f783da2b23639f8624928ad47982470cd6247d94c2f2555")
  (:PATH "processes/initial-compile/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217236-command-75881-0/conservazione.lisp")
   :BYTES 1721 :SHA256
   "2fc48b12dea35aa6e3c3303d8c1f4ad4ab9904e530f00f5df167ed99db800bb2")
  (:PATH "processes/initial-compile/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217236-command-75881-0/report.lisp")
   :BYTES 317 :SHA256
   "778db3ca2382d839c425fd4da950235cfacea42b96773410d1dd23d182f04cb3")
  (:PATH "processes/initial-compile/report.lisp.gz" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217236-command-75881-0/report.lisp.gz")
   :BYTES 158248 :SHA256
   "16718437431558784b0209b0a23e4d7b6ea02789ecad68c7345039856f82fb47")
  (:PATH "processes/mutation-before-nesting-fix/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217447-command-80244-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "df1a0489f2afac4ec749ea62bcb58588dc19ee71151d9dd973dc6eae9939462c")
  (:PATH "processes/mutation-before-nesting-fix/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217447-command-80244-0/report.lisp")
   :BYTES 248211 :SHA256
   "bedce565f66dfb7aafff0979bf7b28ac5b97ccc603bb57b09f03205404f2b86b")
  (:PATH "processes/mutation-final/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217731-command-86323-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "3f5f38aac1b0a9ab9a355063d451110ce28b2841aedb7d31a2d1bc941fc3a0e1")
  (:PATH "processes/mutation-final/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217731-command-86323-0/report.lisp")
   :BYTES 249848 :SHA256
   "a449b3ecbc71e58c762def58f51880fa8deb42ec81f3944365e25da2ebdf73ac")
  (:PATH "processes/mutation-self-final/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217724-command-86188-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "2bee7b6d77b61dfd51328fde61cc3f65313064ce4369eee01339d48d3d15b456")
  (:PATH "processes/mutation-self-final/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217724-command-86188-0/report.lisp")
   :BYTES 247514 :SHA256
   "62415e885b808e8ffec9cc0dff4c97e6efaf223b59e4cb8b97ee168f40908151")
  (:PATH "processes/mutation-self-initial/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217286-command-77574-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "88976666de70a675ac48e1e4fc3b2a558dd7c5b0f9dfc1910f865123ba74cbb5")
  (:PATH "processes/mutation-self-initial/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217286-command-77574-0/report.lisp")
   :BYTES 245955 :SHA256
   "08f7e6c612a9dd17cf8386939273c49d0161fdd06682a596b3d6849a69f2923e")
  (:PATH "processes/mutation-self-merge-diagnostic/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217712-command-85921-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "57c30f132ee706fda5bed35ec374f64756e4e08d9ca159f3c4278683a0bac2c5")
  (:PATH "processes/mutation-self-merge-diagnostic/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217712-command-85921-0/report.lisp")
   :BYTES 251968 :SHA256
   "0e486382c2b32a2df739e4a8ad5f8c06c53e1a6bdd8ad18a0519404c81d8d3b8")
  (:PATH "processes/targeted-before-nesting-fix/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217433-command-79967-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "7941e86e8bb4ea570a8d9dcc6c1d05525fdf838e9208775e2c440ecbfaf79ca5")
  (:PATH "processes/targeted-before-nesting-fix/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217433-command-79967-0/report.lisp")
   :BYTES 247630 :SHA256
   "6779827ead8b41c8f48b67ab8e06b41b1eecfc94f5cadbbb85b58b012a27d416")
  (:PATH "processes/targeted-count-final/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001218074-command-95965-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "e5168b543879b700bf00ec2aa1dbbe9f471a6541672d666cac8ad1115c4f4af3")
  (:PATH "processes/targeted-count-final/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001218074-command-95965-0/report.lisp")
   :BYTES 249425 :SHA256
   "23cc00cf1fa5521aaf17dc7fbf7d9f6704bf9ab33232cad5989dc269c94e4bb3")
  (:PATH "processes/targeted-final/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217691-command-85566-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "f38a5a34b518e186a66e14404dd0ff079423a0a129b292dd68cbf80c88842a6a")
  (:PATH "processes/targeted-final/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217691-command-85566-0/report.lisp")
   :BYTES 247864 :SHA256
   "e8704ab04392cbff6ea3eab33fc469b85840b287c25f25b09020e80a8b270a3e")
  (:PATH "processes/targeted-first/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217356-command-78886-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "054557bd415a804a1dbf34f7701a3ecb3483b83b73c928c038a91584f0dc5121")
  (:PATH "processes/targeted-first/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217356-command-78886-0/report.lisp")
   :BYTES 247150 :SHA256
   "e21eec266de1658220189e94f18da51162a3df33e6b4c469c6b4b1ea23b0c9be")
  (:PATH "processes/targeted-symlink/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217410-command-79559-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "ccf88632dc75b25116f405fdc4845966335d2073ad1f23414531e169a1dde050")
  (:PATH "processes/targeted-symlink/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217410-command-79559-0/report.lisp")
   :BYTES 256849 :SHA256
   "8c4e72f4acc3bf0a6dc6f9d572e2292809af45332b01b3b055e15e161b8b1001")
  (:PATH "processes/targeted-u64-history/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217621-command-84148-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "c63e843207eaf9d72e50ce806c440e3140065b84343244fdd1fb9d4a90764bc1")
  (:PATH "processes/targeted-u64-history/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001217621-command-84148-0/report.lisp")
   :BYTES 257941 :SHA256
   "35f3456014761d082910fdc25100f09b42051ddcadf403117c139722e53c134b")
  (:PATH "raw/audit/coverage-audit-final.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-audit/coverage-audit-final.lisp")
   :BYTES 3502 :SHA256
   "2c60296f24f684a3774c07cf90b9620c9c69781b50074b56c0f2019e5e7d4d17")
  (:PATH "raw/audit/coverage-audit.lisp.txt" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-audit/coverage-audit.lisp")
   :BYTES 3484 :SHA256
   "4cc7a43db7b5f381d97bb00fc1ce1bd09834a80a2486a9a654931870433eafab")
  (:PATH "raw/audit/coverage-result-final.lisp.txt" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-audit/coverage-result-final.lisp")
   :BYTES 2074 :SHA256
   "7d9fa91ad10e17c6fd6ecd7c2ef460a43da5814ec42b3a2afa740fa4dba0abc6")
  (:PATH "raw/audit/coverage-result.lisp.txt" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-audit/coverage-result.lisp")
   :BYTES 2156 :SHA256
   "30cfab881adc5d6f88b4fbcd4f9197322ea02f28ce1f32e1d66d59b045393c16")
  (:PATH "raw/audit/full-details.txt" :SOURCE
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-audit/full-details.txt")
   :BYTES 14836 :SHA256
   "26782dbdef0214f2e229e0bcaed31438d52e5307ffadd5db78a9dda6bcaa6d86")
  (:PATH "raw/audit/full-stdout.log" :SOURCE
   #A((101) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-audit/full-stdout.log")
   :BYTES 426072 :SHA256
   "e00b76ce9c8bb27adf3ade4c6560553c67ec74efc3e5eefb4a9c42ff5ce3ca86")
  (:PATH "raw/audit/full-summary.txt" :SOURCE
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-audit/full-summary.txt")
   :BYTES 2281 :SHA256
   "cdabadb7f9d59611ec91f43fab198cd11dc3a99ac7002d4878fafd52fdd64f51")
  (:PATH "raw/audit/helper-history.lisp.txt" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-audit/helper-history.lisp")
   :BYTES 532 :SHA256
   "b219748e185297c5de0092f7aa7513be1bda70eb0a9a0a034b2ae89c80d53d27")
  (:PATH "raw/audit/input-receipt.json" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/input-receipt.json")
   :BYTES 111283 :SHA256
   "d3a47564ec7fcce658ad3572d1c13ab9dac4f9120c80d5f21ae756aacbe1b390")
  (:PATH "raw/audit/interruption.lisp.txt" :SOURCE
   #A((103) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-audit/interruption.lisp")
   :BYTES 319 :SHA256
   "08b091337cf24e93879b8cd754e7fc672c19914ce34f90c835fb96f0a89cfe73")
  (:PATH "raw/audit/manifest-builder.py.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/manifest-builder.py")
   :BYTES 5119 :SHA256
   "e6c3df577ddb177123cb4c036dbfc8164884fe96ddbbd91d8e714c538118d58b")
  (:PATH "raw/audit/manual-reader-diagnostic.lisp.txt" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-audit/manual-reader-diagnostic.lisp")
   :BYTES 358 :SHA256
   "2f6823124a7e86bc412e879efb2b25abe6c12493039c65c5b6e72fd90e172243")
  (:PATH "raw/audit/process-summary.lisp.txt" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-audit/process-summary.lisp")
   :BYTES 16501 :SHA256
   "f0437de1a54a7fd2dee96ec5049b8d214d2096e81754d9e52385a322fe6effb7")
  (:PATH "raw/audit/product-identity.json" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-audit/product-identity.json")
   :BYTES 957 :SHA256
   "a29e4c7953653cbbb30a2ff87afc78f997999df34a130938e816393193e0c256")
  (:PATH "raw/audit/read-records.lisp.txt" :SOURCE
   #A((103) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-audit/read-records.lisp")
   :BYTES 2611 :SHA256
   "cc4b7a9b6c0eb7c6fbaac79f002c9e541d0e0ccdbb3425adb4f69d9ac8e8d339")
  (:PATH "raw/audit/targeted-before-count-fix.lisp.txt" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-audit/targeted-before-count-fix.lisp.txt")
   :BYTES 1192 :SHA256
   "eec414894571d931ecef8538e190695d4ba2d520c797961a39bd70c9efe36afa")
  (:PATH "raw/audit/targeted.lisp.txt" :SOURCE
   #A((99) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-audit/targeted.lisp")
   :BYTES 1213 :SHA256
   "050c36ae637090271d6e5f6805b37a54eb669ac5b4662f7d9697892e0e6dfedb")
  (:PATH "raw/sources-coverage-final/27a7f863c1371612a48a85b3485fa16d.html"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage-final/27a7f863c1371612a48a85b3485fa16d.html")
   :BYTES 19760 :SHA256
   "ff900809cebccc89c7bcaab5ed898b0dc4d3add40398bf06956a3b3bebe02924")
  (:PATH "raw/sources-coverage-final/289acc711dc8cbe75654900bbac173ff.html"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage-final/289acc711dc8cbe75654900bbac173ff.html")
   :BYTES 10377 :SHA256
   "cddb58a3d76a9c4cbf56b4c021924b9003e5856170916b054719d391e7eac1a6")
  (:PATH "raw/sources-coverage-final/33bf973423200aea09d36605b6ad41ba.html"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage-final/33bf973423200aea09d36605b6ad41ba.html")
   :BYTES 7040 :SHA256
   "56d4c9716f34d97c9d16c16e351f27c82c111c4b6b0f93246ac57b050f6a586e")
  (:PATH "raw/sources-coverage-final/39a4a933106751f9c95c85c11ebf2948.html"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage-final/39a4a933106751f9c95c85c11ebf2948.html")
   :BYTES 19004 :SHA256
   "dc3160b18c4c6139ee02818f17ae8833da8cadb3329333f3014fe79a042b7f7e")
  (:PATH "raw/sources-coverage-final/453ecce9ed0c1a8b83ba14054b5388f4.html"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage-final/453ecce9ed0c1a8b83ba14054b5388f4.html")
   :BYTES 32050 :SHA256
   "ca4cd56ae4a4a84806e0810cf5e810eca69b621408b1f854e86ac13ab605f4c1")
  (:PATH "raw/sources-coverage-final/4cb32f6a4e79ed7c5602172741d3a4f7.html"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage-final/4cb32f6a4e79ed7c5602172741d3a4f7.html")
   :BYTES 57520 :SHA256
   "d21f9d9b37609c6d5cf94bbbdd29fd7c4ed379fd80d28401ac680dfcc8856f2e")
  (:PATH "raw/sources-coverage-final/5dd36d40288a8d37053e0c0ec4faf50b.html"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage-final/5dd36d40288a8d37053e0c0ec4faf50b.html")
   :BYTES 10615 :SHA256
   "4726adac7c5c046e931c652da5e02599576281fa809aa54ed6b40a0da3829497")
  (:PATH "raw/sources-coverage-final/629541ca7b566d0a18ef753bd1062a8e.html"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage-final/629541ca7b566d0a18ef753bd1062a8e.html")
   :BYTES 17672 :SHA256
   "1b64dd5d61ebd826e782a0d093201bd401adb1def7d2e3de78b0ffe72116e79b")
  (:PATH "raw/sources-coverage-final/6c97a011e2c5a4dec8eaf271aeaf13b0.html"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage-final/6c97a011e2c5a4dec8eaf271aeaf13b0.html")
   :BYTES 19611 :SHA256
   "342b23074be5267c1b8c0f82a93ded70e48b902ec0920f2db7452747e0d1d86f")
  (:PATH "raw/sources-coverage-final/7089fd62da87fbc3e485077d81c6ed2d.html"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage-final/7089fd62da87fbc3e485077d81c6ed2d.html")
   :BYTES 14387 :SHA256
   "3cf2b69a3982428fb21aac9eb5fac574a4cefd9ba1aa5dde2009dadb37420a6f")
  (:PATH "raw/sources-coverage-final/73044a2cf511751a3edea0528f0e3a00.html"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage-final/73044a2cf511751a3edea0528f0e3a00.html")
   :BYTES 45753 :SHA256
   "956e45048bb69b128ec04213091883567feb95bc5ec792ff1dc9219b923fb691")
  (:PATH "raw/sources-coverage-final/7562c61cc4608f158a0e82806e20767c.html"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage-final/7562c61cc4608f158a0e82806e20767c.html")
   :BYTES 56651 :SHA256
   "cc25b73afeac5813819e30dcdfb85dffbdd7740bd4aee8fc9bebfd4046da470d")
  (:PATH "raw/sources-coverage-final/7ffdd16fc0a2e00438392ff57394d0c8.html"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage-final/7ffdd16fc0a2e00438392ff57394d0c8.html")
   :BYTES 72964 :SHA256
   "0f517bafb5d395229982f0ef6b743012816ae16af5d869b4a3772d3b4b3932c4")
  (:PATH "raw/sources-coverage-final/86d53797d3cab9327b3a19d79833eafa.html"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage-final/86d53797d3cab9327b3a19d79833eafa.html")
   :BYTES 12338 :SHA256
   "acf005d7723e467ccb54725f048484789a7a88b7d0ec7e176f0f60ca960b4338")
  (:PATH "raw/sources-coverage-final/955df0ca38b9a24b16a3a1c47d1b09f8.html"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage-final/955df0ca38b9a24b16a3a1c47d1b09f8.html")
   :BYTES 19863 :SHA256
   "2524211f2406ec2b62ec9353a628fa619c87cb43e10b203560c172d9809e56d4")
  (:PATH "raw/sources-coverage-final/980c75095272b3077f6cd57f1f82efe8.html"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage-final/980c75095272b3077f6cd57f1f82efe8.html")
   :BYTES 13668 :SHA256
   "de98100b10f1db120bd89c6e92e47d434abaa004558516cca7ab1c5b4229e0a8")
  (:PATH "raw/sources-coverage-final/9b162382a6e1954fc0ae8b70ac4d10da.html"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage-final/9b162382a6e1954fc0ae8b70ac4d10da.html")
   :BYTES 66964 :SHA256
   "0598f22c463b67af5b972be3e18128cbcd616e7d4d5cd2c07b7eb11ff9c5057d")
  (:PATH "raw/sources-coverage-final/acf97880925b02c1f4ee153ea089f1ed.html"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage-final/acf97880925b02c1f4ee153ea089f1ed.html")
   :BYTES 37568 :SHA256
   "825fbd5cfbdbe443636edc82f6636da37b8a0b04e348e53a013dbe63012650a9")
  (:PATH "raw/sources-coverage-final/b821902cbd573ec8a825c2cfeee21742.html"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage-final/b821902cbd573ec8a825c2cfeee21742.html")
   :BYTES 20370 :SHA256
   "e5f07fd3df6e150a9c69bfc4b66d168b6d43983a451dff4525b79e7d13ddcb4f")
  (:PATH "raw/sources-coverage-final/c312423b02576e0c44868555409eebbb.html"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage-final/c312423b02576e0c44868555409eebbb.html")
   :BYTES 11841 :SHA256
   "3f3a2209e1d7ac9e892036c95c38696f3d865cc15678663c8687133c38af31d0")
  (:PATH "raw/sources-coverage-final/cover-index.html" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage-final/cover-index.html")
   :BYTES 6367 :SHA256
   "7aebd2685611230249bbea07864761bc92442b59d9340421262ce073c80253b3")
  (:PATH "raw/sources-coverage-final/coverage-state.lisp.gz" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/sources-coverage-final-state.lisp.gz")
   :BYTES 584367 :SHA256
   "ae7a05471ae5e9fd9703ce806951ecb19334d30272be806b075c0bad77270638")
  (:PATH "raw/sources-coverage-final/d9dce4ce8564715b729420ce30e4a537.html"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage-final/d9dce4ce8564715b729420ce30e4a537.html")
   :BYTES 38964 :SHA256
   "7c1ab633106819990a9d2bfe9c4fc732cb9015a6b17a76ae05074c9042f10886")
  (:PATH "raw/sources-coverage-final/e5a252f2b78bfc90e9f6bed2f3a82a5a.html"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage-final/e5a252f2b78bfc90e9f6bed2f3a82a5a.html")
   :BYTES 19375 :SHA256
   "f695578e2224daf98ed8eb321d48ee39b9fdfad8c03a12da5a3e57d6cee87d10")
  (:PATH "raw/sources-coverage-final/ebc53c7f343684c5e6d739ca04a44d08.html"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage-final/ebc53c7f343684c5e6d739ca04a44d08.html")
   :BYTES 63768 :SHA256
   "0c1ecfa1ef9b70ea128bd2044fa2af1e29f49735ad046ff529b9611b6866b76f")
  (:PATH "raw/sources-coverage-final/eeca36d650ca02d2cfd327494a1dee5b.html"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage-final/eeca36d650ca02d2cfd327494a1dee5b.html")
   :BYTES 6084 :SHA256
   "057a414fcc9ef4f815d4cd7ae21bf7e2ce430018ea0cd29f4b351756d29a2229")
  (:PATH "raw/sources-coverage-final/f8a63000ada3f970f085ccad83c4deb4.html"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage-final/f8a63000ada3f970f085ccad83c4deb4.html")
   :BYTES 34756 :SHA256
   "9e878f9b87661eec59aac261eab9201c7ce53abe27b2b715276057320604fede")
  (:PATH "raw/sources-coverage/27a7f863c1371612a48a85b3485fa16d.html" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage/27a7f863c1371612a48a85b3485fa16d.html")
   :BYTES 19760 :SHA256
   "ff900809cebccc89c7bcaab5ed898b0dc4d3add40398bf06956a3b3bebe02924")
  (:PATH "raw/sources-coverage/289acc711dc8cbe75654900bbac173ff.html" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage/289acc711dc8cbe75654900bbac173ff.html")
   :BYTES 10377 :SHA256
   "cddb58a3d76a9c4cbf56b4c021924b9003e5856170916b054719d391e7eac1a6")
  (:PATH "raw/sources-coverage/33bf973423200aea09d36605b6ad41ba.html" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage/33bf973423200aea09d36605b6ad41ba.html")
   :BYTES 7040 :SHA256
   "56d4c9716f34d97c9d16c16e351f27c82c111c4b6b0f93246ac57b050f6a586e")
  (:PATH "raw/sources-coverage/39a4a933106751f9c95c85c11ebf2948.html" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage/39a4a933106751f9c95c85c11ebf2948.html")
   :BYTES 19004 :SHA256
   "dc3160b18c4c6139ee02818f17ae8833da8cadb3329333f3014fe79a042b7f7e")
  (:PATH "raw/sources-coverage/453ecce9ed0c1a8b83ba14054b5388f4.html" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage/453ecce9ed0c1a8b83ba14054b5388f4.html")
   :BYTES 32050 :SHA256
   "ca4cd56ae4a4a84806e0810cf5e810eca69b621408b1f854e86ac13ab605f4c1")
  (:PATH "raw/sources-coverage/4cb32f6a4e79ed7c5602172741d3a4f7.html" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage/4cb32f6a4e79ed7c5602172741d3a4f7.html")
   :BYTES 57520 :SHA256
   "d21f9d9b37609c6d5cf94bbbdd29fd7c4ed379fd80d28401ac680dfcc8856f2e")
  (:PATH "raw/sources-coverage/5dd36d40288a8d37053e0c0ec4faf50b.html" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage/5dd36d40288a8d37053e0c0ec4faf50b.html")
   :BYTES 10615 :SHA256
   "4726adac7c5c046e931c652da5e02599576281fa809aa54ed6b40a0da3829497")
  (:PATH "raw/sources-coverage/629541ca7b566d0a18ef753bd1062a8e.html" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage/629541ca7b566d0a18ef753bd1062a8e.html")
   :BYTES 17672 :SHA256
   "1b64dd5d61ebd826e782a0d093201bd401adb1def7d2e3de78b0ffe72116e79b")
  (:PATH "raw/sources-coverage/6c97a011e2c5a4dec8eaf271aeaf13b0.html" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage/6c97a011e2c5a4dec8eaf271aeaf13b0.html")
   :BYTES 19611 :SHA256
   "342b23074be5267c1b8c0f82a93ded70e48b902ec0920f2db7452747e0d1d86f")
  (:PATH "raw/sources-coverage/7089fd62da87fbc3e485077d81c6ed2d.html" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage/7089fd62da87fbc3e485077d81c6ed2d.html")
   :BYTES 14387 :SHA256
   "3cf2b69a3982428fb21aac9eb5fac574a4cefd9ba1aa5dde2009dadb37420a6f")
  (:PATH "raw/sources-coverage/73044a2cf511751a3edea0528f0e3a00.html" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage/73044a2cf511751a3edea0528f0e3a00.html")
   :BYTES 45753 :SHA256
   "956e45048bb69b128ec04213091883567feb95bc5ec792ff1dc9219b923fb691")
  (:PATH "raw/sources-coverage/7562c61cc4608f158a0e82806e20767c.html" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage/7562c61cc4608f158a0e82806e20767c.html")
   :BYTES 56651 :SHA256
   "cc25b73afeac5813819e30dcdfb85dffbdd7740bd4aee8fc9bebfd4046da470d")
  (:PATH "raw/sources-coverage/7ffdd16fc0a2e00438392ff57394d0c8.html" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage/7ffdd16fc0a2e00438392ff57394d0c8.html")
   :BYTES 72964 :SHA256
   "0f517bafb5d395229982f0ef6b743012816ae16af5d869b4a3772d3b4b3932c4")
  (:PATH "raw/sources-coverage/86d53797d3cab9327b3a19d79833eafa.html" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage/86d53797d3cab9327b3a19d79833eafa.html")
   :BYTES 12338 :SHA256
   "acf005d7723e467ccb54725f048484789a7a88b7d0ec7e176f0f60ca960b4338")
  (:PATH "raw/sources-coverage/955df0ca38b9a24b16a3a1c47d1b09f8.html" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage/955df0ca38b9a24b16a3a1c47d1b09f8.html")
   :BYTES 19863 :SHA256
   "2524211f2406ec2b62ec9353a628fa619c87cb43e10b203560c172d9809e56d4")
  (:PATH "raw/sources-coverage/980c75095272b3077f6cd57f1f82efe8.html" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage/980c75095272b3077f6cd57f1f82efe8.html")
   :BYTES 13668 :SHA256
   "de98100b10f1db120bd89c6e92e47d434abaa004558516cca7ab1c5b4229e0a8")
  (:PATH "raw/sources-coverage/9b162382a6e1954fc0ae8b70ac4d10da.html" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage/9b162382a6e1954fc0ae8b70ac4d10da.html")
   :BYTES 66964 :SHA256
   "0598f22c463b67af5b972be3e18128cbcd616e7d4d5cd2c07b7eb11ff9c5057d")
  (:PATH "raw/sources-coverage/acf97880925b02c1f4ee153ea089f1ed.html" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage/acf97880925b02c1f4ee153ea089f1ed.html")
   :BYTES 37568 :SHA256
   "825fbd5cfbdbe443636edc82f6636da37b8a0b04e348e53a013dbe63012650a9")
  (:PATH "raw/sources-coverage/b821902cbd573ec8a825c2cfeee21742.html" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage/b821902cbd573ec8a825c2cfeee21742.html")
   :BYTES 20370 :SHA256
   "e5f07fd3df6e150a9c69bfc4b66d168b6d43983a451dff4525b79e7d13ddcb4f")
  (:PATH "raw/sources-coverage/c312423b02576e0c44868555409eebbb.html" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage/c312423b02576e0c44868555409eebbb.html")
   :BYTES 11841 :SHA256
   "3f3a2209e1d7ac9e892036c95c38696f3d865cc15678663c8687133c38af31d0")
  (:PATH "raw/sources-coverage/cover-index.html" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage/cover-index.html")
   :BYTES 6367 :SHA256
   "9355be04879d4dfa7b30bd70579476dfddeaf6cba043ac19f73cb75c01bf347a")
  (:PATH "raw/sources-coverage/coverage-state.lisp.gz" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/sources-coverage-state.lisp.gz")
   :BYTES 579705 :SHA256
   "275139e07b89a4e0a18014b96a7e77e661240e874ec689d472aaadae1e860bfa")
  (:PATH "raw/sources-coverage/d9dce4ce8564715b729420ce30e4a537.html" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage/d9dce4ce8564715b729420ce30e4a537.html")
   :BYTES 38964 :SHA256
   "7c1ab633106819990a9d2bfe9c4fc732cb9015a6b17a76ae05074c9042f10886")
  (:PATH "raw/sources-coverage/e5a252f2b78bfc90e9f6bed2f3a82a5a.html" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage/e5a252f2b78bfc90e9f6bed2f3a82a5a.html")
   :BYTES 19433 :SHA256
   "b09278f7fe0fbb5cb0a954cb79fc69837a0349ea4056772776fb3ae19dfd8efa")
  (:PATH "raw/sources-coverage/ebc53c7f343684c5e6d739ca04a44d08.html" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage/ebc53c7f343684c5e6d739ca04a44d08.html")
   :BYTES 63768 :SHA256
   "0c1ecfa1ef9b70ea128bd2044fa2af1e29f49735ad046ff529b9611b6866b76f")
  (:PATH "raw/sources-coverage/eeca36d650ca02d2cfd327494a1dee5b.html" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage/eeca36d650ca02d2cfd327494a1dee5b.html")
   :BYTES 6084 :SHA256
   "057a414fcc9ef4f815d4cd7ae21bf7e2ce430018ea0cd29f4b351756d29a2229")
  (:PATH "raw/sources-coverage/f8a63000ada3f970f085ccad83c4deb4.html" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-coverage/f8a63000ada3f970f085ccad83c4deb4.html")
   :BYTES 34756 :SHA256
   "9e878f9b87661eec59aac261eab9201c7ce53abe27b2b715276057320604fede")
  (:PATH "raw/sources-mutations-final/0/arcdocdb.asd.txt" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/0/arcdocdb.asd")
   :BYTES 25266 :SHA256
   "6a778c91c8f5f891f9b7ab148871aa037869153b3f94934f5d65ba5f4f806e22")
  (:PATH
   "raw/sources-mutations-final/0/src/recovery/inventory-sources-build.lisp.txt"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/0/src/recovery/inventory-sources-build.lisp")
   :BYTES 3239 :SHA256
   "3a1f4908da55970bdc6e318e1be864d01a3e15af0f132d8d8fa123c0e5f6257b")
  (:PATH
   "raw/sources-mutations-final/0/src/recovery/inventory-sources-query.lisp.txt"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/0/src/recovery/inventory-sources-query.lisp")
   :BYTES 3421 :SHA256
   "f13f24ce1bab5c2d5e70e00cb77cea8393c1a2d4bd9be81588afc40b79b8d799")
  (:PATH
   "raw/sources-mutations-final/0/src/recovery/inventory-sources-types.lisp.txt"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/0/src/recovery/inventory-sources-types.lisp")
   :BYTES 2010 :SHA256
   "95a5cc6cdc00c927dec547d51f114e3d8f192a6b9585f07fa8898a01de8ff68c")
  (:PATH
   "raw/sources-mutations-final/0/src/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/0/src/recovery/inventory-sources.lisp")
   :BYTES 3620 :SHA256
   "92b4f91a81bc19b7c0b068e82e945f287f6ab1f2bf6be7fe8cb6ab46539cc769")
  (:PATH "raw/sources-mutations-final/0/test.log" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/0/test.log")
   :BYTES 17684 :SHA256
   "eaf2527bcecff44b1ff8b5bf8cf81e974727dfa74f5940a61df6a66c61ccce69")
  (:PATH "raw/sources-mutations-final/0/tools/mutation-isolated-build.lisp.txt"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/0/tools/mutation-isolated-build.lisp")
   :BYTES 2539 :SHA256
   "39e3281f1cbdb03308c2f68a25f1d9598bbd2e496f0c464d03882ee8b9b6c974")
  (:PATH "raw/sources-mutations-final/1/arcdocdb.asd.txt" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/1/arcdocdb.asd")
   :BYTES 25266 :SHA256
   "6a778c91c8f5f891f9b7ab148871aa037869153b3f94934f5d65ba5f4f806e22")
  (:PATH
   "raw/sources-mutations-final/1/src/recovery/inventory-sources-build.lisp.txt"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/1/src/recovery/inventory-sources-build.lisp")
   :BYTES 3233 :SHA256
   "7a19354eea0b65f8f57288171a1144ae370f016539b37770f2f924041ea44dd2")
  (:PATH
   "raw/sources-mutations-final/1/src/recovery/inventory-sources-query.lisp.txt"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/1/src/recovery/inventory-sources-query.lisp")
   :BYTES 3421 :SHA256
   "f13f24ce1bab5c2d5e70e00cb77cea8393c1a2d4bd9be81588afc40b79b8d799")
  (:PATH
   "raw/sources-mutations-final/1/src/recovery/inventory-sources-types.lisp.txt"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/1/src/recovery/inventory-sources-types.lisp")
   :BYTES 2010 :SHA256
   "95a5cc6cdc00c927dec547d51f114e3d8f192a6b9585f07fa8898a01de8ff68c")
  (:PATH
   "raw/sources-mutations-final/1/src/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/1/src/recovery/inventory-sources.lisp")
   :BYTES 3620 :SHA256
   "92b4f91a81bc19b7c0b068e82e945f287f6ab1f2bf6be7fe8cb6ab46539cc769")
  (:PATH "raw/sources-mutations-final/1/test.log" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/1/test.log")
   :BYTES 14918 :SHA256
   "c9518a790d3b4e56a45fd479e89ea6bfe204fe1bf81da1e84aeac5a7ac2789f5")
  (:PATH "raw/sources-mutations-final/1/tools/mutation-isolated-build.lisp.txt"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/1/tools/mutation-isolated-build.lisp")
   :BYTES 2539 :SHA256
   "c1ca7aa0cace83d9e55ce0d20ab5d3f3a4c3b8b0714e8fc41362cec506f20593")
  (:PATH "raw/sources-mutations-final/10/arcdocdb.asd.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/10/arcdocdb.asd")
   :BYTES 25266 :SHA256
   "6a778c91c8f5f891f9b7ab148871aa037869153b3f94934f5d65ba5f4f806e22")
  (:PATH
   "raw/sources-mutations-final/10/src/recovery/inventory-sources-build.lisp.txt"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/10/src/recovery/inventory-sources-build.lisp")
   :BYTES 3241 :SHA256
   "636573df05856a10210242066d6417fb17436b632f08912893a345a54664d90e")
  (:PATH
   "raw/sources-mutations-final/10/src/recovery/inventory-sources-query.lisp.txt"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/10/src/recovery/inventory-sources-query.lisp")
   :BYTES 3421 :SHA256
   "f13f24ce1bab5c2d5e70e00cb77cea8393c1a2d4bd9be81588afc40b79b8d799")
  (:PATH
   "raw/sources-mutations-final/10/src/recovery/inventory-sources-types.lisp.txt"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/10/src/recovery/inventory-sources-types.lisp")
   :BYTES 2010 :SHA256
   "95a5cc6cdc00c927dec547d51f114e3d8f192a6b9585f07fa8898a01de8ff68c")
  (:PATH
   "raw/sources-mutations-final/10/src/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/10/src/recovery/inventory-sources.lisp")
   :BYTES 3637 :SHA256
   "46819cd36d7d69a1cee5aab91ae20658957dd6dd6aabc88ae0cc7889811665ad")
  (:PATH "raw/sources-mutations-final/10/test.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/10/test.log")
   :BYTES 14497 :SHA256
   "232e68af6a8b12904f1b597bdc04c98b557c504f7e19d273167df9132fc84292")
  (:PATH
   "raw/sources-mutations-final/10/tools/mutation-isolated-build.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/10/tools/mutation-isolated-build.lisp")
   :BYTES 2541 :SHA256
   "278a7d4dc0f6d2897c3324ba391a2b3637662bee0b1de668494915d25814c1d8")
  (:PATH "raw/sources-mutations-final/2/arcdocdb.asd.txt" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/2/arcdocdb.asd")
   :BYTES 25266 :SHA256
   "6a778c91c8f5f891f9b7ab148871aa037869153b3f94934f5d65ba5f4f806e22")
  (:PATH
   "raw/sources-mutations-final/2/src/recovery/inventory-sources-build.lisp.txt"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/2/src/recovery/inventory-sources-build.lisp")
   :BYTES 3240 :SHA256
   "491cdc5d2aca848b8d2a69a8eb2952ba74058be778290ce92ba3f6704ccc9ac1")
  (:PATH
   "raw/sources-mutations-final/2/src/recovery/inventory-sources-query.lisp.txt"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/2/src/recovery/inventory-sources-query.lisp")
   :BYTES 3421 :SHA256
   "f13f24ce1bab5c2d5e70e00cb77cea8393c1a2d4bd9be81588afc40b79b8d799")
  (:PATH
   "raw/sources-mutations-final/2/src/recovery/inventory-sources-types.lisp.txt"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/2/src/recovery/inventory-sources-types.lisp")
   :BYTES 2010 :SHA256
   "95a5cc6cdc00c927dec547d51f114e3d8f192a6b9585f07fa8898a01de8ff68c")
  (:PATH
   "raw/sources-mutations-final/2/src/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/2/src/recovery/inventory-sources.lisp")
   :BYTES 3620 :SHA256
   "92b4f91a81bc19b7c0b068e82e945f287f6ab1f2bf6be7fe8cb6ab46539cc769")
  (:PATH "raw/sources-mutations-final/2/test.log" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/2/test.log")
   :BYTES 13410 :SHA256
   "8398297e46c3a1b7dee778a82d335a96297d16709454e46ccd9e939357307965")
  (:PATH "raw/sources-mutations-final/2/tools/mutation-isolated-build.lisp.txt"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/2/tools/mutation-isolated-build.lisp")
   :BYTES 2539 :SHA256
   "375d89f99e0d33b15f485598f74c9e40a2cded1025e92e84d111e77676984fc4")
  (:PATH "raw/sources-mutations-final/3/arcdocdb.asd.txt" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/3/arcdocdb.asd")
   :BYTES 25266 :SHA256
   "6a778c91c8f5f891f9b7ab148871aa037869153b3f94934f5d65ba5f4f806e22")
  (:PATH
   "raw/sources-mutations-final/3/src/recovery/inventory-sources-build.lisp.txt"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/3/src/recovery/inventory-sources-build.lisp")
   :BYTES 3240 :SHA256
   "b44aa732f3498cc4c37dd54af1fe43d987bf2fe1ae586c47cce3dd786fe1dc05")
  (:PATH
   "raw/sources-mutations-final/3/src/recovery/inventory-sources-query.lisp.txt"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/3/src/recovery/inventory-sources-query.lisp")
   :BYTES 3421 :SHA256
   "f13f24ce1bab5c2d5e70e00cb77cea8393c1a2d4bd9be81588afc40b79b8d799")
  (:PATH
   "raw/sources-mutations-final/3/src/recovery/inventory-sources-types.lisp.txt"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/3/src/recovery/inventory-sources-types.lisp")
   :BYTES 2010 :SHA256
   "95a5cc6cdc00c927dec547d51f114e3d8f192a6b9585f07fa8898a01de8ff68c")
  (:PATH
   "raw/sources-mutations-final/3/src/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/3/src/recovery/inventory-sources.lisp")
   :BYTES 3620 :SHA256
   "92b4f91a81bc19b7c0b068e82e945f287f6ab1f2bf6be7fe8cb6ab46539cc769")
  (:PATH "raw/sources-mutations-final/3/test.log" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/3/test.log")
   :BYTES 13410 :SHA256
   "11c7c48773453d9f24e199ef5398a60dea7d73dd7dafc2809abd465f371503f7")
  (:PATH "raw/sources-mutations-final/3/tools/mutation-isolated-build.lisp.txt"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/3/tools/mutation-isolated-build.lisp")
   :BYTES 2539 :SHA256
   "387c488d2b15e507aba559a79431e1b344db8c9f08492bd9fe2bf54f6f69feaa")
  (:PATH "raw/sources-mutations-final/4/arcdocdb.asd.txt" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/4/arcdocdb.asd")
   :BYTES 25266 :SHA256
   "6a778c91c8f5f891f9b7ab148871aa037869153b3f94934f5d65ba5f4f806e22")
  (:PATH
   "raw/sources-mutations-final/4/src/recovery/inventory-sources-build.lisp.txt"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/4/src/recovery/inventory-sources-build.lisp")
   :BYTES 3242 :SHA256
   "f1aeb51e8dee7dd8c678dac855fb670b6d3cdbdb2a068353e109dabe83a9d3a8")
  (:PATH
   "raw/sources-mutations-final/4/src/recovery/inventory-sources-query.lisp.txt"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/4/src/recovery/inventory-sources-query.lisp")
   :BYTES 3421 :SHA256
   "f13f24ce1bab5c2d5e70e00cb77cea8393c1a2d4bd9be81588afc40b79b8d799")
  (:PATH
   "raw/sources-mutations-final/4/src/recovery/inventory-sources-types.lisp.txt"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/4/src/recovery/inventory-sources-types.lisp")
   :BYTES 2010 :SHA256
   "95a5cc6cdc00c927dec547d51f114e3d8f192a6b9585f07fa8898a01de8ff68c")
  (:PATH
   "raw/sources-mutations-final/4/src/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/4/src/recovery/inventory-sources.lisp")
   :BYTES 3620 :SHA256
   "92b4f91a81bc19b7c0b068e82e945f287f6ab1f2bf6be7fe8cb6ab46539cc769")
  (:PATH "raw/sources-mutations-final/4/test.log" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/4/test.log")
   :BYTES 16873 :SHA256
   "e097a0f353bf7d1c1648d7913401d6c17d1303d57d1af5c3cb4f33c161f19305")
  (:PATH "raw/sources-mutations-final/4/tools/mutation-isolated-build.lisp.txt"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/4/tools/mutation-isolated-build.lisp")
   :BYTES 2539 :SHA256
   "5975d3d43b4974dca6235ee38311feca49370d1a8e7a49420e67a368ae3f6e47")
  (:PATH "raw/sources-mutations-final/5/arcdocdb.asd.txt" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/5/arcdocdb.asd")
   :BYTES 25266 :SHA256
   "6a778c91c8f5f891f9b7ab148871aa037869153b3f94934f5d65ba5f4f806e22")
  (:PATH
   "raw/sources-mutations-final/5/src/recovery/inventory-sources-build.lisp.txt"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/5/src/recovery/inventory-sources-build.lisp")
   :BYTES 3231 :SHA256
   "928efefa63a12c750b1e46f07b196ac1325349bfadc272a7d988fc7b16980f37")
  (:PATH
   "raw/sources-mutations-final/5/src/recovery/inventory-sources-query.lisp.txt"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/5/src/recovery/inventory-sources-query.lisp")
   :BYTES 3421 :SHA256
   "f13f24ce1bab5c2d5e70e00cb77cea8393c1a2d4bd9be81588afc40b79b8d799")
  (:PATH
   "raw/sources-mutations-final/5/src/recovery/inventory-sources-types.lisp.txt"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/5/src/recovery/inventory-sources-types.lisp")
   :BYTES 2010 :SHA256
   "95a5cc6cdc00c927dec547d51f114e3d8f192a6b9585f07fa8898a01de8ff68c")
  (:PATH
   "raw/sources-mutations-final/5/src/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/5/src/recovery/inventory-sources.lisp")
   :BYTES 3620 :SHA256
   "92b4f91a81bc19b7c0b068e82e945f287f6ab1f2bf6be7fe8cb6ab46539cc769")
  (:PATH "raw/sources-mutations-final/5/test.log" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/5/test.log")
   :BYTES 14492 :SHA256
   "e69e245f3eda8f49d7de680d347a75118671cc76c97d9b91132262d86d231276")
  (:PATH "raw/sources-mutations-final/5/tools/mutation-isolated-build.lisp.txt"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/5/tools/mutation-isolated-build.lisp")
   :BYTES 2539 :SHA256
   "f89395c40f24d53f022ff800d4821ec3e2eed1710ee64fd75b7622a5dee16fa8")
  (:PATH "raw/sources-mutations-final/6/arcdocdb.asd.txt" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/6/arcdocdb.asd")
   :BYTES 25266 :SHA256
   "6a778c91c8f5f891f9b7ab148871aa037869153b3f94934f5d65ba5f4f806e22")
  (:PATH
   "raw/sources-mutations-final/6/src/recovery/inventory-sources-build.lisp.txt"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/6/src/recovery/inventory-sources-build.lisp")
   :BYTES 3241 :SHA256
   "14d05e7272032baf7ffa2b9d28f1b92c4f0db4700be55e14026b101b2f96f6fd")
  (:PATH
   "raw/sources-mutations-final/6/src/recovery/inventory-sources-query.lisp.txt"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/6/src/recovery/inventory-sources-query.lisp")
   :BYTES 3421 :SHA256
   "f13f24ce1bab5c2d5e70e00cb77cea8393c1a2d4bd9be81588afc40b79b8d799")
  (:PATH
   "raw/sources-mutations-final/6/src/recovery/inventory-sources-types.lisp.txt"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/6/src/recovery/inventory-sources-types.lisp")
   :BYTES 2010 :SHA256
   "95a5cc6cdc00c927dec547d51f114e3d8f192a6b9585f07fa8898a01de8ff68c")
  (:PATH
   "raw/sources-mutations-final/6/src/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/6/src/recovery/inventory-sources.lisp")
   :BYTES 3620 :SHA256
   "92b4f91a81bc19b7c0b068e82e945f287f6ab1f2bf6be7fe8cb6ab46539cc769")
  (:PATH "raw/sources-mutations-final/6/test.log" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/6/test.log")
   :BYTES 14294 :SHA256
   "20e5a60872bee4f3d3ae7cf8650af1b1bdede1a4aaf5d2d114cd2359380c6b34")
  (:PATH "raw/sources-mutations-final/6/tools/mutation-isolated-build.lisp.txt"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/6/tools/mutation-isolated-build.lisp")
   :BYTES 2539 :SHA256
   "f724be6dddb9eedf153c08b587c16d85ca57cadebc4f0e26b762dc85d4cd72d7")
  (:PATH "raw/sources-mutations-final/7/arcdocdb.asd.txt" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/7/arcdocdb.asd")
   :BYTES 25266 :SHA256
   "6a778c91c8f5f891f9b7ab148871aa037869153b3f94934f5d65ba5f4f806e22")
  (:PATH
   "raw/sources-mutations-final/7/src/recovery/inventory-sources-build.lisp.txt"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/7/src/recovery/inventory-sources-build.lisp")
   :BYTES 3241 :SHA256
   "636573df05856a10210242066d6417fb17436b632f08912893a345a54664d90e")
  (:PATH
   "raw/sources-mutations-final/7/src/recovery/inventory-sources-query.lisp.txt"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/7/src/recovery/inventory-sources-query.lisp")
   :BYTES 3434 :SHA256
   "d73fda619e04819a1d9bf55c3acd2c9ac56596f692de61930e130675f7d7c020")
  (:PATH
   "raw/sources-mutations-final/7/src/recovery/inventory-sources-types.lisp.txt"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/7/src/recovery/inventory-sources-types.lisp")
   :BYTES 2010 :SHA256
   "95a5cc6cdc00c927dec547d51f114e3d8f192a6b9585f07fa8898a01de8ff68c")
  (:PATH
   "raw/sources-mutations-final/7/src/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/7/src/recovery/inventory-sources.lisp")
   :BYTES 3620 :SHA256
   "92b4f91a81bc19b7c0b068e82e945f287f6ab1f2bf6be7fe8cb6ab46539cc769")
  (:PATH "raw/sources-mutations-final/7/test.log" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/7/test.log")
   :BYTES 18013 :SHA256
   "5be63491da98a17653cfb15a5d642f499ea360592b8300a81328dd2ed532316c")
  (:PATH "raw/sources-mutations-final/7/tools/mutation-isolated-build.lisp.txt"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/7/tools/mutation-isolated-build.lisp")
   :BYTES 2539 :SHA256
   "2eae25db141aea447ff3c71fbdb706d0c8340cbf7ce299c088b6b214213c9a5f")
  (:PATH "raw/sources-mutations-final/8/arcdocdb.asd.txt" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/8/arcdocdb.asd")
   :BYTES 25266 :SHA256
   "6a778c91c8f5f891f9b7ab148871aa037869153b3f94934f5d65ba5f4f806e22")
  (:PATH
   "raw/sources-mutations-final/8/src/recovery/inventory-sources-build.lisp.txt"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/8/src/recovery/inventory-sources-build.lisp")
   :BYTES 3241 :SHA256
   "636573df05856a10210242066d6417fb17436b632f08912893a345a54664d90e")
  (:PATH
   "raw/sources-mutations-final/8/src/recovery/inventory-sources-query.lisp.txt"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/8/src/recovery/inventory-sources-query.lisp")
   :BYTES 3439 :SHA256
   "075a6246fa4175c3c8ad47067f41deed92e8842f7d544a24d6bd043b9338576d")
  (:PATH
   "raw/sources-mutations-final/8/src/recovery/inventory-sources-types.lisp.txt"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/8/src/recovery/inventory-sources-types.lisp")
   :BYTES 2010 :SHA256
   "95a5cc6cdc00c927dec547d51f114e3d8f192a6b9585f07fa8898a01de8ff68c")
  (:PATH
   "raw/sources-mutations-final/8/src/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/8/src/recovery/inventory-sources.lisp")
   :BYTES 3620 :SHA256
   "92b4f91a81bc19b7c0b068e82e945f287f6ab1f2bf6be7fe8cb6ab46539cc769")
  (:PATH "raw/sources-mutations-final/8/test.log" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/8/test.log")
   :BYTES 17985 :SHA256
   "81338346f8c737ab03b8b45ff8d5526fb2d3c6c3c6fea3437a0bb98b72c2565d")
  (:PATH "raw/sources-mutations-final/8/tools/mutation-isolated-build.lisp.txt"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/8/tools/mutation-isolated-build.lisp")
   :BYTES 2539 :SHA256
   "687f86c095ec404a8a1e5d6f7023a594f307854b023b8a0dacd10d84fba23cce")
  (:PATH "raw/sources-mutations-final/9/arcdocdb.asd.txt" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/9/arcdocdb.asd")
   :BYTES 25266 :SHA256
   "6a778c91c8f5f891f9b7ab148871aa037869153b3f94934f5d65ba5f4f806e22")
  (:PATH
   "raw/sources-mutations-final/9/src/recovery/inventory-sources-build.lisp.txt"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/9/src/recovery/inventory-sources-build.lisp")
   :BYTES 3241 :SHA256
   "636573df05856a10210242066d6417fb17436b632f08912893a345a54664d90e")
  (:PATH
   "raw/sources-mutations-final/9/src/recovery/inventory-sources-query.lisp.txt"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/9/src/recovery/inventory-sources-query.lisp")
   :BYTES 3421 :SHA256
   "f13f24ce1bab5c2d5e70e00cb77cea8393c1a2d4bd9be81588afc40b79b8d799")
  (:PATH
   "raw/sources-mutations-final/9/src/recovery/inventory-sources-types.lisp.txt"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/9/src/recovery/inventory-sources-types.lisp")
   :BYTES 2010 :SHA256
   "95a5cc6cdc00c927dec547d51f114e3d8f192a6b9585f07fa8898a01de8ff68c")
  (:PATH
   "raw/sources-mutations-final/9/src/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/9/src/recovery/inventory-sources.lisp")
   :BYTES 3636 :SHA256
   "68f303cfa8d31a4607124ab6a717784af9a6724602af37db0f75f43aa98098c7")
  (:PATH "raw/sources-mutations-final/9/test.log" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/9/test.log")
   :BYTES 14486 :SHA256
   "3fa78f19a1fe17006791c7b90be690296c8dd0d2a411e599d3e51da2214c8a09")
  (:PATH "raw/sources-mutations-final/9/tools/mutation-isolated-build.lisp.txt"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/9/tools/mutation-isolated-build.lisp")
   :BYTES 2539 :SHA256
   "ba9373823fb644b901c9ec63606f10db2e4d1ac7468c0471e7fbb9d0825c27ad")
  (:PATH "raw/sources-mutations-final/baseline/arcdocdb.asd.txt" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/baseline/arcdocdb.asd")
   :BYTES 25266 :SHA256
   "6a778c91c8f5f891f9b7ab148871aa037869153b3f94934f5d65ba5f4f806e22")
  (:PATH
   "raw/sources-mutations-final/baseline/src/recovery/inventory-sources-build.lisp.txt"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/baseline/src/recovery/inventory-sources-build.lisp")
   :BYTES 3241 :SHA256
   "636573df05856a10210242066d6417fb17436b632f08912893a345a54664d90e")
  (:PATH
   "raw/sources-mutations-final/baseline/src/recovery/inventory-sources-query.lisp.txt"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/baseline/src/recovery/inventory-sources-query.lisp")
   :BYTES 3421 :SHA256
   "f13f24ce1bab5c2d5e70e00cb77cea8393c1a2d4bd9be81588afc40b79b8d799")
  (:PATH
   "raw/sources-mutations-final/baseline/src/recovery/inventory-sources-types.lisp.txt"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/baseline/src/recovery/inventory-sources-types.lisp")
   :BYTES 2010 :SHA256
   "95a5cc6cdc00c927dec547d51f114e3d8f192a6b9585f07fa8898a01de8ff68c")
  (:PATH
   "raw/sources-mutations-final/baseline/src/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/baseline/src/recovery/inventory-sources.lisp")
   :BYTES 3620 :SHA256
   "92b4f91a81bc19b7c0b068e82e945f287f6ab1f2bf6be7fe8cb6ab46539cc769")
  (:PATH "raw/sources-mutations-final/baseline/test.log" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/baseline/test.log")
   :BYTES 2520 :SHA256
   "22b3516cf6a9dedd39448d6590fcd753d71d4c90efa7dde22c552727b6951749")
  (:PATH
   "raw/sources-mutations-final/baseline/tools/mutation-isolated-build.lisp.txt"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/baseline/tools/mutation-isolated-build.lisp")
   :BYTES 2553 :SHA256
   "736fc90e7d7e89f25bcd2c3ad6689833017c2ee9d4c379e0c388946c93d170d5")
  (:PATH "raw/sources-mutations-final/report.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations-final/report.lisp")
   :BYTES 2497 :SHA256
   "4929c5e6aabd2313dfd71d5dd0ebd52e12d855aedacef9c7761ae43bc1653dcc")
  (:PATH "raw/sources-mutations/0/arcdocdb.asd.txt" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/0/arcdocdb.asd")
   :BYTES 24978 :SHA256
   "5a2bb8e1df4c545f56a4c93cf425a5191f98967202c8b42e232dcd81ad4c7ae7")
  (:PATH
   "raw/sources-mutations/0/src/recovery/inventory-sources-build.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/0/src/recovery/inventory-sources-build.lisp")
   :BYTES 3239 :SHA256
   "3a1f4908da55970bdc6e318e1be864d01a3e15af0f132d8d8fa123c0e5f6257b")
  (:PATH
   "raw/sources-mutations/0/src/recovery/inventory-sources-query.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/0/src/recovery/inventory-sources-query.lisp")
   :BYTES 3421 :SHA256
   "f13f24ce1bab5c2d5e70e00cb77cea8393c1a2d4bd9be81588afc40b79b8d799")
  (:PATH
   "raw/sources-mutations/0/src/recovery/inventory-sources-types.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/0/src/recovery/inventory-sources-types.lisp")
   :BYTES 2010 :SHA256
   "95a5cc6cdc00c927dec547d51f114e3d8f192a6b9585f07fa8898a01de8ff68c")
  (:PATH "raw/sources-mutations/0/src/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/0/src/recovery/inventory-sources.lisp")
   :BYTES 3620 :SHA256
   "92b4f91a81bc19b7c0b068e82e945f287f6ab1f2bf6be7fe8cb6ab46539cc769")
  (:PATH "raw/sources-mutations/0/test.log" :SOURCE
   #A((100) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/0/test.log")
   :BYTES 17607 :SHA256
   "54d9d8e8757188da762e1162d4b842f913d333d1a4cc5f89eda42010cfd62494")
  (:PATH "raw/sources-mutations/0/tools/mutation-isolated-build.lisp.txt"
   :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/0/tools/mutation-isolated-build.lisp")
   :BYTES 1986 :SHA256
   "3dd3c20399dc94eea9d4b36e621d6ee5c5addbe41a5936134a3856e4619591e4")
  (:PATH "raw/sources-mutations/1/arcdocdb.asd.txt" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/1/arcdocdb.asd")
   :BYTES 24978 :SHA256
   "5a2bb8e1df4c545f56a4c93cf425a5191f98967202c8b42e232dcd81ad4c7ae7")
  (:PATH
   "raw/sources-mutations/1/src/recovery/inventory-sources-build.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/1/src/recovery/inventory-sources-build.lisp")
   :BYTES 3233 :SHA256
   "7a19354eea0b65f8f57288171a1144ae370f016539b37770f2f924041ea44dd2")
  (:PATH
   "raw/sources-mutations/1/src/recovery/inventory-sources-query.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/1/src/recovery/inventory-sources-query.lisp")
   :BYTES 3421 :SHA256
   "f13f24ce1bab5c2d5e70e00cb77cea8393c1a2d4bd9be81588afc40b79b8d799")
  (:PATH
   "raw/sources-mutations/1/src/recovery/inventory-sources-types.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/1/src/recovery/inventory-sources-types.lisp")
   :BYTES 2010 :SHA256
   "95a5cc6cdc00c927dec547d51f114e3d8f192a6b9585f07fa8898a01de8ff68c")
  (:PATH "raw/sources-mutations/1/src/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/1/src/recovery/inventory-sources.lisp")
   :BYTES 3620 :SHA256
   "92b4f91a81bc19b7c0b068e82e945f287f6ab1f2bf6be7fe8cb6ab46539cc769")
  (:PATH "raw/sources-mutations/1/test.log" :SOURCE
   #A((100) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/1/test.log")
   :BYTES 14841 :SHA256
   "d5e803ca78e4fcc5e5a5ee746bd6ae958927bd7fea4624a2dc10fff5718eba66")
  (:PATH "raw/sources-mutations/1/tools/mutation-isolated-build.lisp.txt"
   :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/1/tools/mutation-isolated-build.lisp")
   :BYTES 1986 :SHA256
   "17aabce3de7c658717946b5a504bb36ba3b17e0d4ec707105aa4d7a1e8f76166")
  (:PATH "raw/sources-mutations/10/arcdocdb.asd.txt" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/10/arcdocdb.asd")
   :BYTES 24978 :SHA256
   "5a2bb8e1df4c545f56a4c93cf425a5191f98967202c8b42e232dcd81ad4c7ae7")
  (:PATH
   "raw/sources-mutations/10/src/recovery/inventory-sources-build.lisp.txt"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/10/src/recovery/inventory-sources-build.lisp")
   :BYTES 3241 :SHA256
   "636573df05856a10210242066d6417fb17436b632f08912893a345a54664d90e")
  (:PATH
   "raw/sources-mutations/10/src/recovery/inventory-sources-query.lisp.txt"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/10/src/recovery/inventory-sources-query.lisp")
   :BYTES 3421 :SHA256
   "f13f24ce1bab5c2d5e70e00cb77cea8393c1a2d4bd9be81588afc40b79b8d799")
  (:PATH
   "raw/sources-mutations/10/src/recovery/inventory-sources-types.lisp.txt"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/10/src/recovery/inventory-sources-types.lisp")
   :BYTES 2010 :SHA256
   "95a5cc6cdc00c927dec547d51f114e3d8f192a6b9585f07fa8898a01de8ff68c")
  (:PATH "raw/sources-mutations/10/src/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/10/src/recovery/inventory-sources.lisp")
   :BYTES 3637 :SHA256
   "46819cd36d7d69a1cee5aab91ae20658957dd6dd6aabc88ae0cc7889811665ad")
  (:PATH "raw/sources-mutations/10/test.log" :SOURCE
   #A((101) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/10/test.log")
   :BYTES 14160 :SHA256
   "cf270e2cf0d89cd10d5f6c6a194170495a96237e91e74e964368f38a51c74d58")
  (:PATH "raw/sources-mutations/10/tools/mutation-isolated-build.lisp.txt"
   :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/10/tools/mutation-isolated-build.lisp")
   :BYTES 1988 :SHA256
   "15aa55d42ac50956f04015843eeea9801a20c3791f364e896c828670aebd4253")
  (:PATH "raw/sources-mutations/2/arcdocdb.asd.txt" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/2/arcdocdb.asd")
   :BYTES 24978 :SHA256
   "5a2bb8e1df4c545f56a4c93cf425a5191f98967202c8b42e232dcd81ad4c7ae7")
  (:PATH
   "raw/sources-mutations/2/src/recovery/inventory-sources-build.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/2/src/recovery/inventory-sources-build.lisp")
   :BYTES 3240 :SHA256
   "491cdc5d2aca848b8d2a69a8eb2952ba74058be778290ce92ba3f6704ccc9ac1")
  (:PATH
   "raw/sources-mutations/2/src/recovery/inventory-sources-query.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/2/src/recovery/inventory-sources-query.lisp")
   :BYTES 3421 :SHA256
   "f13f24ce1bab5c2d5e70e00cb77cea8393c1a2d4bd9be81588afc40b79b8d799")
  (:PATH
   "raw/sources-mutations/2/src/recovery/inventory-sources-types.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/2/src/recovery/inventory-sources-types.lisp")
   :BYTES 2010 :SHA256
   "95a5cc6cdc00c927dec547d51f114e3d8f192a6b9585f07fa8898a01de8ff68c")
  (:PATH "raw/sources-mutations/2/src/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/2/src/recovery/inventory-sources.lisp")
   :BYTES 3620 :SHA256
   "92b4f91a81bc19b7c0b068e82e945f287f6ab1f2bf6be7fe8cb6ab46539cc769")
  (:PATH "raw/sources-mutations/2/test.log" :SOURCE
   #A((100) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/2/test.log")
   :BYTES 13073 :SHA256
   "0d152e191dffc6cd8dc8e56ca8a3637b6f16eca1478df5b17e3969a2d2044f0a")
  (:PATH "raw/sources-mutations/2/tools/mutation-isolated-build.lisp.txt"
   :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/2/tools/mutation-isolated-build.lisp")
   :BYTES 1986 :SHA256
   "45d24b59eb2087e6aac233e935558e07a6a8d17a04b6ae402940e5605bea3493")
  (:PATH "raw/sources-mutations/3/arcdocdb.asd.txt" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/3/arcdocdb.asd")
   :BYTES 24978 :SHA256
   "5a2bb8e1df4c545f56a4c93cf425a5191f98967202c8b42e232dcd81ad4c7ae7")
  (:PATH
   "raw/sources-mutations/3/src/recovery/inventory-sources-build.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/3/src/recovery/inventory-sources-build.lisp")
   :BYTES 3240 :SHA256
   "b44aa732f3498cc4c37dd54af1fe43d987bf2fe1ae586c47cce3dd786fe1dc05")
  (:PATH
   "raw/sources-mutations/3/src/recovery/inventory-sources-query.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/3/src/recovery/inventory-sources-query.lisp")
   :BYTES 3421 :SHA256
   "f13f24ce1bab5c2d5e70e00cb77cea8393c1a2d4bd9be81588afc40b79b8d799")
  (:PATH
   "raw/sources-mutations/3/src/recovery/inventory-sources-types.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/3/src/recovery/inventory-sources-types.lisp")
   :BYTES 2010 :SHA256
   "95a5cc6cdc00c927dec547d51f114e3d8f192a6b9585f07fa8898a01de8ff68c")
  (:PATH "raw/sources-mutations/3/src/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/3/src/recovery/inventory-sources.lisp")
   :BYTES 3620 :SHA256
   "92b4f91a81bc19b7c0b068e82e945f287f6ab1f2bf6be7fe8cb6ab46539cc769")
  (:PATH "raw/sources-mutations/3/test.log" :SOURCE
   #A((100) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/3/test.log")
   :BYTES 13073 :SHA256
   "436e7dd52bd12024f283564acfc4b8c86c1bd26c186b38872eb7e2e3cc18c004")
  (:PATH "raw/sources-mutations/3/tools/mutation-isolated-build.lisp.txt"
   :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/3/tools/mutation-isolated-build.lisp")
   :BYTES 1986 :SHA256
   "5ec5cd6acdb1370d9b00aa567e1d56fda667581be763d29740dd98d8c6f8dcb6")
  (:PATH "raw/sources-mutations/4/arcdocdb.asd.txt" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/4/arcdocdb.asd")
   :BYTES 24978 :SHA256
   "5a2bb8e1df4c545f56a4c93cf425a5191f98967202c8b42e232dcd81ad4c7ae7")
  (:PATH
   "raw/sources-mutations/4/src/recovery/inventory-sources-build.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/4/src/recovery/inventory-sources-build.lisp")
   :BYTES 3242 :SHA256
   "f1aeb51e8dee7dd8c678dac855fb670b6d3cdbdb2a068353e109dabe83a9d3a8")
  (:PATH
   "raw/sources-mutations/4/src/recovery/inventory-sources-query.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/4/src/recovery/inventory-sources-query.lisp")
   :BYTES 3421 :SHA256
   "f13f24ce1bab5c2d5e70e00cb77cea8393c1a2d4bd9be81588afc40b79b8d799")
  (:PATH
   "raw/sources-mutations/4/src/recovery/inventory-sources-types.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/4/src/recovery/inventory-sources-types.lisp")
   :BYTES 2010 :SHA256
   "95a5cc6cdc00c927dec547d51f114e3d8f192a6b9585f07fa8898a01de8ff68c")
  (:PATH "raw/sources-mutations/4/src/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/4/src/recovery/inventory-sources.lisp")
   :BYTES 3620 :SHA256
   "92b4f91a81bc19b7c0b068e82e945f287f6ab1f2bf6be7fe8cb6ab46539cc769")
  (:PATH "raw/sources-mutations/4/test.log" :SOURCE
   #A((100) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/4/test.log")
   :BYTES 16536 :SHA256
   "8fc340f7861e89e908addcc83badc6bf6a22d83c09262fd592b9f4aeda27540d")
  (:PATH "raw/sources-mutations/4/tools/mutation-isolated-build.lisp.txt"
   :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/4/tools/mutation-isolated-build.lisp")
   :BYTES 1986 :SHA256
   "873834cda39e16b20053fefaca6181c70c1697fc7ea935b8b53e2d681d7dc6fa")
  (:PATH "raw/sources-mutations/5/arcdocdb.asd.txt" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/5/arcdocdb.asd")
   :BYTES 24978 :SHA256
   "5a2bb8e1df4c545f56a4c93cf425a5191f98967202c8b42e232dcd81ad4c7ae7")
  (:PATH
   "raw/sources-mutations/5/src/recovery/inventory-sources-build.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/5/src/recovery/inventory-sources-build.lisp")
   :BYTES 3231 :SHA256
   "928efefa63a12c750b1e46f07b196ac1325349bfadc272a7d988fc7b16980f37")
  (:PATH
   "raw/sources-mutations/5/src/recovery/inventory-sources-query.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/5/src/recovery/inventory-sources-query.lisp")
   :BYTES 3421 :SHA256
   "f13f24ce1bab5c2d5e70e00cb77cea8393c1a2d4bd9be81588afc40b79b8d799")
  (:PATH
   "raw/sources-mutations/5/src/recovery/inventory-sources-types.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/5/src/recovery/inventory-sources-types.lisp")
   :BYTES 2010 :SHA256
   "95a5cc6cdc00c927dec547d51f114e3d8f192a6b9585f07fa8898a01de8ff68c")
  (:PATH "raw/sources-mutations/5/src/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/5/src/recovery/inventory-sources.lisp")
   :BYTES 3620 :SHA256
   "92b4f91a81bc19b7c0b068e82e945f287f6ab1f2bf6be7fe8cb6ab46539cc769")
  (:PATH "raw/sources-mutations/5/test.log" :SOURCE
   #A((100) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/5/test.log")
   :BYTES 14155 :SHA256
   "238a84ac435f7f8ceda0e53e9f857c5742c00be49b0ec41e442dc59e805eaff9")
  (:PATH "raw/sources-mutations/5/tools/mutation-isolated-build.lisp.txt"
   :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/5/tools/mutation-isolated-build.lisp")
   :BYTES 1986 :SHA256
   "26a9fe68d5255202442418905f400b18dfc8f3fc7dbcd3e19521227d24bd9282")
  (:PATH "raw/sources-mutations/6/arcdocdb.asd.txt" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/6/arcdocdb.asd")
   :BYTES 24978 :SHA256
   "5a2bb8e1df4c545f56a4c93cf425a5191f98967202c8b42e232dcd81ad4c7ae7")
  (:PATH
   "raw/sources-mutations/6/src/recovery/inventory-sources-build.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/6/src/recovery/inventory-sources-build.lisp")
   :BYTES 3241 :SHA256
   "14d05e7272032baf7ffa2b9d28f1b92c4f0db4700be55e14026b101b2f96f6fd")
  (:PATH
   "raw/sources-mutations/6/src/recovery/inventory-sources-query.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/6/src/recovery/inventory-sources-query.lisp")
   :BYTES 3421 :SHA256
   "f13f24ce1bab5c2d5e70e00cb77cea8393c1a2d4bd9be81588afc40b79b8d799")
  (:PATH
   "raw/sources-mutations/6/src/recovery/inventory-sources-types.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/6/src/recovery/inventory-sources-types.lisp")
   :BYTES 2010 :SHA256
   "95a5cc6cdc00c927dec547d51f114e3d8f192a6b9585f07fa8898a01de8ff68c")
  (:PATH "raw/sources-mutations/6/src/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/6/src/recovery/inventory-sources.lisp")
   :BYTES 3620 :SHA256
   "92b4f91a81bc19b7c0b068e82e945f287f6ab1f2bf6be7fe8cb6ab46539cc769")
  (:PATH "raw/sources-mutations/6/test.log" :SOURCE
   #A((100) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/6/test.log")
   :BYTES 13957 :SHA256
   "b1d0b670e0ed98a5434d186c63c2c1ca295ed01997348aa10f70e921a5920f87")
  (:PATH "raw/sources-mutations/6/tools/mutation-isolated-build.lisp.txt"
   :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/6/tools/mutation-isolated-build.lisp")
   :BYTES 1986 :SHA256
   "c3378a8e8eca96b1848a1bbab49945b167b21e0e8d8495f07037fff84f1044ef")
  (:PATH "raw/sources-mutations/7/arcdocdb.asd.txt" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/7/arcdocdb.asd")
   :BYTES 24978 :SHA256
   "5a2bb8e1df4c545f56a4c93cf425a5191f98967202c8b42e232dcd81ad4c7ae7")
  (:PATH
   "raw/sources-mutations/7/src/recovery/inventory-sources-build.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/7/src/recovery/inventory-sources-build.lisp")
   :BYTES 3241 :SHA256
   "636573df05856a10210242066d6417fb17436b632f08912893a345a54664d90e")
  (:PATH
   "raw/sources-mutations/7/src/recovery/inventory-sources-query.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/7/src/recovery/inventory-sources-query.lisp")
   :BYTES 3434 :SHA256
   "d73fda619e04819a1d9bf55c3acd2c9ac56596f692de61930e130675f7d7c020")
  (:PATH
   "raw/sources-mutations/7/src/recovery/inventory-sources-types.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/7/src/recovery/inventory-sources-types.lisp")
   :BYTES 2010 :SHA256
   "95a5cc6cdc00c927dec547d51f114e3d8f192a6b9585f07fa8898a01de8ff68c")
  (:PATH "raw/sources-mutations/7/src/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/7/src/recovery/inventory-sources.lisp")
   :BYTES 3620 :SHA256
   "92b4f91a81bc19b7c0b068e82e945f287f6ab1f2bf6be7fe8cb6ab46539cc769")
  (:PATH "raw/sources-mutations/7/test.log" :SOURCE
   #A((100) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/7/test.log")
   :BYTES 13957 :SHA256
   "8c832f2d1f87608840cdabd4e457f50b2f3920fb2fbe5615e0032a6bc8169234")
  (:PATH "raw/sources-mutations/7/tools/mutation-isolated-build.lisp.txt"
   :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/7/tools/mutation-isolated-build.lisp")
   :BYTES 1986 :SHA256
   "73bc507cc0bfa52d090a67dc885abe3cae2bd648a63ef807a014d5f29bef9021")
  (:PATH "raw/sources-mutations/8/arcdocdb.asd.txt" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/8/arcdocdb.asd")
   :BYTES 24978 :SHA256
   "5a2bb8e1df4c545f56a4c93cf425a5191f98967202c8b42e232dcd81ad4c7ae7")
  (:PATH
   "raw/sources-mutations/8/src/recovery/inventory-sources-build.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/8/src/recovery/inventory-sources-build.lisp")
   :BYTES 3241 :SHA256
   "636573df05856a10210242066d6417fb17436b632f08912893a345a54664d90e")
  (:PATH
   "raw/sources-mutations/8/src/recovery/inventory-sources-query.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/8/src/recovery/inventory-sources-query.lisp")
   :BYTES 3439 :SHA256
   "075a6246fa4175c3c8ad47067f41deed92e8842f7d544a24d6bd043b9338576d")
  (:PATH
   "raw/sources-mutations/8/src/recovery/inventory-sources-types.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/8/src/recovery/inventory-sources-types.lisp")
   :BYTES 2010 :SHA256
   "95a5cc6cdc00c927dec547d51f114e3d8f192a6b9585f07fa8898a01de8ff68c")
  (:PATH "raw/sources-mutations/8/src/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/8/src/recovery/inventory-sources.lisp")
   :BYTES 3620 :SHA256
   "92b4f91a81bc19b7c0b068e82e945f287f6ab1f2bf6be7fe8cb6ab46539cc769")
  (:PATH "raw/sources-mutations/8/test.log" :SOURCE
   #A((100) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/8/test.log")
   :BYTES 17648 :SHA256
   "8efec72fd3d52d1e84bb5202c0f21b21ac3336db75cb59c372d2f7ac2a446a81")
  (:PATH "raw/sources-mutations/8/tools/mutation-isolated-build.lisp.txt"
   :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/8/tools/mutation-isolated-build.lisp")
   :BYTES 1986 :SHA256
   "bb7146799bd1249f13baeee82b8392f623d3d29daf0b16b254e71bb6fbd732c4")
  (:PATH "raw/sources-mutations/9/arcdocdb.asd.txt" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/9/arcdocdb.asd")
   :BYTES 24978 :SHA256
   "5a2bb8e1df4c545f56a4c93cf425a5191f98967202c8b42e232dcd81ad4c7ae7")
  (:PATH
   "raw/sources-mutations/9/src/recovery/inventory-sources-build.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/9/src/recovery/inventory-sources-build.lisp")
   :BYTES 3241 :SHA256
   "636573df05856a10210242066d6417fb17436b632f08912893a345a54664d90e")
  (:PATH
   "raw/sources-mutations/9/src/recovery/inventory-sources-query.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/9/src/recovery/inventory-sources-query.lisp")
   :BYTES 3421 :SHA256
   "f13f24ce1bab5c2d5e70e00cb77cea8393c1a2d4bd9be81588afc40b79b8d799")
  (:PATH
   "raw/sources-mutations/9/src/recovery/inventory-sources-types.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/9/src/recovery/inventory-sources-types.lisp")
   :BYTES 2010 :SHA256
   "95a5cc6cdc00c927dec547d51f114e3d8f192a6b9585f07fa8898a01de8ff68c")
  (:PATH "raw/sources-mutations/9/src/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/9/src/recovery/inventory-sources.lisp")
   :BYTES 3636 :SHA256
   "68f303cfa8d31a4607124ab6a717784af9a6724602af37db0f75f43aa98098c7")
  (:PATH "raw/sources-mutations/9/test.log" :SOURCE
   #A((100) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/9/test.log")
   :BYTES 14149 :SHA256
   "5462c711e450a43d7fa1a0c729f58777804201ca7da5f7150622d2791d549d25")
  (:PATH "raw/sources-mutations/9/tools/mutation-isolated-build.lisp.txt"
   :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/9/tools/mutation-isolated-build.lisp")
   :BYTES 1986 :SHA256
   "de146011ef07d243b96fb8409cb1d5af9dfd27c367894ce39f618d311265a7e3")
  (:PATH "raw/sources-mutations/baseline/arcdocdb.asd.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/baseline/arcdocdb.asd")
   :BYTES 24978 :SHA256
   "5a2bb8e1df4c545f56a4c93cf425a5191f98967202c8b42e232dcd81ad4c7ae7")
  (:PATH
   "raw/sources-mutations/baseline/src/recovery/inventory-sources-build.lisp.txt"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/baseline/src/recovery/inventory-sources-build.lisp")
   :BYTES 3241 :SHA256
   "636573df05856a10210242066d6417fb17436b632f08912893a345a54664d90e")
  (:PATH
   "raw/sources-mutations/baseline/src/recovery/inventory-sources-query.lisp.txt"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/baseline/src/recovery/inventory-sources-query.lisp")
   :BYTES 3421 :SHA256
   "f13f24ce1bab5c2d5e70e00cb77cea8393c1a2d4bd9be81588afc40b79b8d799")
  (:PATH
   "raw/sources-mutations/baseline/src/recovery/inventory-sources-types.lisp.txt"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/baseline/src/recovery/inventory-sources-types.lisp")
   :BYTES 2010 :SHA256
   "95a5cc6cdc00c927dec547d51f114e3d8f192a6b9585f07fa8898a01de8ff68c")
  (:PATH
   "raw/sources-mutations/baseline/src/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/baseline/src/recovery/inventory-sources.lisp")
   :BYTES 3620 :SHA256
   "92b4f91a81bc19b7c0b068e82e945f287f6ab1f2bf6be7fe8cb6ab46539cc769")
  (:PATH "raw/sources-mutations/baseline/test.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/baseline/test.log")
   :BYTES 2260 :SHA256
   "4f5a7a2f1cf931a5daeacc94502bf7a73b98c64f4fccade464df8d014743335b")
  (:PATH
   "raw/sources-mutations/baseline/tools/mutation-isolated-build.lisp.txt"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/baseline/tools/mutation-isolated-build.lisp")
   :BYTES 2000 :SHA256
   "55c6d34fe660ef02327daa2bb42e6c68a41bcc184d1b3a31724c8bdc2fa343d3")
  (:PATH "raw/sources-mutations/report.lisp" :SOURCE
   #A((101) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-mutations/report.lisp")
   :BYTES 2425 :SHA256
   "da97a57e4a3f84ca3e8448270b1ac79d6592da3b7722f54c6d4163e473442ce7")
  (:PATH "raw/spikes/SPK-01.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001218444-check-7044-0/SPK-01.lisp")
   :BYTES 27228 :SHA256
   "649335abac217852b7a079385cd736eb99678252b4e142cc720bf2fa0e132a9c")
  (:PATH "raw/spikes/SPK-02.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001218444-check-7044-0/SPK-02.lisp")
   :BYTES 1607 :SHA256
   "cfb46736a5af53f2dbb670833881c677536cac9021f5cdd14d850564a6a84205")
  (:PATH "raw/spikes/SPK-03.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001218444-check-7044-0/SPK-03.lisp")
   :BYTES 3638 :SHA256
   "e584c66edba3a12379ff3aacbe1e5d4caee943e26ab3aa70dc5f953471be37e3")
  (:PATH "raw/spikes/SPK-04.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001218444-check-7044-0/SPK-04.lisp")
   :BYTES 6752 :SHA256
   "214858c39a7df3985cb6b21c5070ca98008250f62f613bbd48b5f82cf4042149")
  (:PATH "raw/spikes/SPK-05.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001218444-check-7044-0/SPK-05.lisp")
   :BYTES 10104 :SHA256
   "1a83c4fa99004b7cb0bae3720d385651d9c2e78b097f1b22deee632cb357e870")
  (:PATH "raw/spikes/SPK-06.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001218444-check-7044-0/SPK-06.lisp")
   :BYTES 24088 :SHA256
   "b6a0b05d7471dc6f60be9773c9d7c967dc1786924840254c93c4151a3416ca66")
  (:PATH "raw/spikes/SPK-07.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001218444-check-7044-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "a0c36a356e3a8df1c52076c5658acbc1cfd6f469b80f787bcdb7025c9835dcc8")
  (:PATH "raw/spikes/SPK-07.lisp.gz" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001218444-check-7044-0/SPK-07.lisp.gz")
   :BYTES 410621 :SHA256
   "661db6f4215d1d2f5f663be60a211463ca5a4c7b756bb92a1e3c93fa1af55410")
  (:PATH "raw/spikes/SPK-08.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001218444-check-7044-0/SPK-08.lisp")
   :BYTES 291712 :SHA256
   "7683765b44d954adcfa418ccaf6bcf7bbf601f931c33c8ccfc44ea2809b0bf88")
  (:PATH "raw/spikes/SPK-09.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001218444-check-7044-0/SPK-09.lisp")
   :BYTES 2472 :SHA256
   "6cf18b96c092371bb81c1744dfca0611e0b69af7d67ea88d5d55542a440f7691")
  (:PATH "raw/spikes/SPK-10.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001218444-check-7044-0/SPK-10.lisp")
   :BYTES 22976 :SHA256
   "6e0fcde5930bc2edea7117841329ae18086f862bec86c14d7f0871e552f4fbb6")
  (:PATH "raw/spikes/conservazione.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001218444-check-7044-0/conservazione.lisp")
   :BYTES 2279 :SHA256
   "2dc66827f271d40042114c8ff5a76259c485212a090642956e130a588b2b4aef")
  (:PATH "raw/spikes/report.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001218444-check-7044-0/report.lisp")
   :BYTES 318 :SHA256
   "c2de943f4c49632b0ce596632b531a91f19c1863d1cd90daedb6ad40c73eac88")
  (:PATH "raw/spikes/report.lisp.gz" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001218444-check-7044-0/report.lisp.gz")
   :BYTES 466972 :SHA256
   "a9ac1e99592e9cd3968323b912b59648edc88db35f987e4c2cc1ab79d5bf1849")
  (:PATH "raw/variants/30bb0fe3/CHANGELOG.md.txt" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/30bb0fe3/CHANGELOG.md.txt")
   :BYTES 33354 :SHA256
   "3e53baad34d840c909ba8c41363962e1e0a58c24ea82c0cba57c8e48deb66b4a")
  (:PATH "raw/variants/30bb0fe3/arcdocdb.asd.txt" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/30bb0fe3/arcdocdb.asd.txt")
   :BYTES 24978 :SHA256
   "5a2bb8e1df4c545f56a4c93cf425a5191f98967202c8b42e232dcd81ad4c7ae7")
  (:PATH "raw/variants/30bb0fe3/docs/implementazione/README.md.txt" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/30bb0fe3/docs/implementazione/README.md.txt")
   :BYTES 16715 :SHA256
   "5de55d5ebd9acd53c1b9da131956e659edfcaa0f1e5b9a39a414418191888755")
  (:PATH "raw/variants/30bb0fe3/docs/implementazione/fonti-recovery.md.txt"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/30bb0fe3/docs/implementazione/fonti-recovery.md.txt")
   :BYTES 3729 :SHA256
   "96c93614d77e84256199cd96d80285f80b100e92341645d526a4fea5a6d05037")
  (:PATH "raw/variants/30bb0fe3/docs/roadmap.md.txt" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/30bb0fe3/docs/roadmap.md.txt")
   :BYTES 14408 :SHA256
   "1426a327a063fc7fb5fa682b43378941d817403a4f8e52a176d5d9455ff853b4")
  (:PATH "raw/variants/30bb0fe3/src/recovery/inventory-sources-build.lisp.txt"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/30bb0fe3/src/recovery/inventory-sources-build.lisp.txt")
   :BYTES 3241 :SHA256
   "636573df05856a10210242066d6417fb17436b632f08912893a345a54664d90e")
  (:PATH "raw/variants/30bb0fe3/src/recovery/inventory-sources-query.lisp.txt"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/30bb0fe3/src/recovery/inventory-sources-query.lisp.txt")
   :BYTES 3421 :SHA256
   "f13f24ce1bab5c2d5e70e00cb77cea8393c1a2d4bd9be81588afc40b79b8d799")
  (:PATH "raw/variants/30bb0fe3/src/recovery/inventory-sources-types.lisp.txt"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/30bb0fe3/src/recovery/inventory-sources-types.lisp.txt")
   :BYTES 2010 :SHA256
   "95a5cc6cdc00c927dec547d51f114e3d8f192a6b9585f07fa8898a01de8ff68c")
  (:PATH "raw/variants/30bb0fe3/src/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/30bb0fe3/src/recovery/inventory-sources.lisp.txt")
   :BYTES 3620 :SHA256
   "92b4f91a81bc19b7c0b068e82e945f287f6ab1f2bf6be7fe8cb6ab46539cc769")
  (:PATH "raw/variants/30bb0fe3/src/recovery/manifest-package.lisp.txt" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/30bb0fe3/src/recovery/manifest-package.lisp.txt")
   :BYTES 1774 :SHA256
   "b58d9c6b1298e9dff9aedecb0a50af2e699164e57f5595912df4fbd3d5b0f352")
  (:PATH
   "raw/variants/30bb0fe3/tests/recovery/inventory-sources-native.lisp.txt"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/30bb0fe3/tests/recovery/inventory-sources-native.lisp.txt")
   :BYTES 6244 :SHA256
   "8daf16ec9b0b3349f426c0dff9556396d3d0c9bf8032b2cbb6ebd1bfb04a9b17")
  (:PATH
   "raw/variants/30bb0fe3/tests/recovery/inventory-sources-support.lisp.txt"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/30bb0fe3/tests/recovery/inventory-sources-support.lisp.txt")
   :BYTES 3982 :SHA256
   "99322ba4f6938460558995ecb3d53315c4e2317107f5c197b369c9ef2357a99c")
  (:PATH "raw/variants/30bb0fe3/tests/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/30bb0fe3/tests/recovery/inventory-sources.lisp.txt")
   :BYTES 13986 :SHA256
   "e184975fe9989c4e5fe113ae79ef33532c6cdc13c0a4d5f11ebeeca51043f4ae")
  (:PATH "raw/variants/30bb0fe3/tests/vertical/support.lisp.txt" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/30bb0fe3/tests/vertical/support.lisp.txt")
   :BYTES 15152 :SHA256
   "5993abf1f06475098e0000c38bf46cd7857c78ec133d63c803c3c1fc9b9f18c9")
  (:PATH "raw/variants/30bb0fe3/tools/foundation-mutation.lisp.txt" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/30bb0fe3/tools/foundation-mutation.lisp.txt")
   :BYTES 46173 :SHA256
   "3dd75f99618ec54cfa5ad506b5a915931916b404bd699e9109cfac68f4bfd441")
  (:PATH "raw/variants/55e9441a/tests/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/55e9441a/tests/recovery/inventory-sources.lisp.txt")
   :BYTES 13993 :SHA256
   "2ec63b66d86902abfe6b0467e3942d71e3bbae353564e0e8ae7d36843a6bbc49")
  (:PATH "raw/variants/6a4947e6/tests/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/6a4947e6/tests/recovery/inventory-sources.lisp.txt")
   :BYTES 16403 :SHA256
   "c1670d5bb764def39f69e8edd8da2deb554120e2898e3ad15469acfbaf034889")
  (:PATH "raw/variants/6a4947e6/tools/foundation-mutation.lisp.txt" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/6a4947e6/tools/foundation-mutation.lisp.txt")
   :BYTES 47283 :SHA256
   "4dfa749be2bfe0df9b1045e74b51670ba72cce0fbc740fc8edfad6c76c6d46b6")
  (:PATH "raw/variants/8aaa0621/arcdocdb.asd.txt" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/8aaa0621/arcdocdb.asd.txt")
   :BYTES 25266 :SHA256
   "6a778c91c8f5f891f9b7ab148871aa037869153b3f94934f5d65ba5f4f806e22")
  (:PATH
   "raw/variants/8aaa0621/docs/implementazione/fonti-recovery-metodo.md.txt"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/8aaa0621/docs/implementazione/fonti-recovery-metodo.md.txt")
   :BYTES 4208 :SHA256
   "b36be96c46e4d5bef6568a451cfcaddf33cf43f99609aaaf5505423021ec27a8")
  (:PATH "raw/variants/8aaa0621/docs/implementazione/fonti-recovery.md.txt"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/8aaa0621/docs/implementazione/fonti-recovery.md.txt")
   :BYTES 3729 :SHA256
   "96c93614d77e84256199cd96d80285f80b100e92341645d526a4fea5a6d05037")
  (:PATH "raw/variants/8aaa0621/src/recovery/inventory-sources-build.lisp.txt"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/8aaa0621/src/recovery/inventory-sources-build.lisp.txt")
   :BYTES 3241 :SHA256
   "636573df05856a10210242066d6417fb17436b632f08912893a345a54664d90e")
  (:PATH "raw/variants/8aaa0621/src/recovery/inventory-sources-query.lisp.txt"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/8aaa0621/src/recovery/inventory-sources-query.lisp.txt")
   :BYTES 3421 :SHA256
   "f13f24ce1bab5c2d5e70e00cb77cea8393c1a2d4bd9be81588afc40b79b8d799")
  (:PATH "raw/variants/8aaa0621/src/recovery/inventory-sources-types.lisp.txt"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/8aaa0621/src/recovery/inventory-sources-types.lisp.txt")
   :BYTES 2010 :SHA256
   "95a5cc6cdc00c927dec547d51f114e3d8f192a6b9585f07fa8898a01de8ff68c")
  (:PATH "raw/variants/8aaa0621/src/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/8aaa0621/src/recovery/inventory-sources.lisp.txt")
   :BYTES 3620 :SHA256
   "92b4f91a81bc19b7c0b068e82e945f287f6ab1f2bf6be7fe8cb6ab46539cc769")
  (:PATH "raw/variants/8aaa0621/src/recovery/manifest-package.lisp.txt" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/8aaa0621/src/recovery/manifest-package.lisp.txt")
   :BYTES 1774 :SHA256
   "b58d9c6b1298e9dff9aedecb0a50af2e699164e57f5595912df4fbd3d5b0f352")
  (:PATH "raw/variants/8aaa0621/src/runtime/closed-preflight.lisp.txt" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/8aaa0621/src/runtime/closed-preflight.lisp.txt")
   :BYTES 4721 :SHA256
   "8a8c6208c9835e9fbc997f120f18c044de722eb5940e63bab7f54a88eb22ccdb")
  (:PATH "raw/variants/8aaa0621/src/runtime/closed-transfer.lisp.txt" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/8aaa0621/src/runtime/closed-transfer.lisp.txt")
   :BYTES 2180 :SHA256
   "fd74b3da8c4c92bd139276c6bbe609b8ce7227e05c190a1541e0074cc428cc01")
  (:PATH "raw/variants/8aaa0621/src/runtime/closed.lisp.txt" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/8aaa0621/src/runtime/closed.lisp.txt")
   :BYTES 2419 :SHA256
   "6a4731e6395355bcdf1a6c3146f9c94b4fc9419c6ea8de85990de552c0fc4006")
  (:PATH "raw/variants/8aaa0621/src/runtime/package.lisp.txt" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/8aaa0621/src/runtime/package.lisp.txt")
   :BYTES 1233 :SHA256
   "950ecbf2b5f6ee06acbbabf83cbb38f590975511af6026fc9fde401a9806094c")
  (:PATH "raw/variants/8aaa0621/tests/cache/README.md.txt" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/8aaa0621/tests/cache/README.md.txt")
   :BYTES 4019 :SHA256
   "a820372e0531349029378c34e5091d620ef5ee4a7a774138d00fb17d28497e10")
  (:PATH "raw/variants/8aaa0621/tests/cache/guards.lisp.txt" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/8aaa0621/tests/cache/guards.lisp.txt")
   :BYTES 8639 :SHA256
   "7e57a4173ab2b61aba300319563b80524fe9a3e3c0f51b689b58fc891f81bae7")
  (:PATH "raw/variants/8aaa0621/tests/cache/support.lisp.txt" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/8aaa0621/tests/cache/support.lisp.txt")
   :BYTES 5274 :SHA256
   "73a3641c6fb32a8f5894198a0a7f1292773723f5d97b2f9106a86a2c081ad1af")
  (:PATH "raw/variants/8aaa0621/tests/cache/threads.lisp.txt" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/8aaa0621/tests/cache/threads.lisp.txt")
   :BYTES 15932 :SHA256
   "f3e9911f4d56755238c3fdd267fa23c54361521b97bf96eee8c71c3a2f139a59")
  (:PATH "raw/variants/8aaa0621/tests/get-performance/README.md.txt" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/8aaa0621/tests/get-performance/README.md.txt")
   :BYTES 7665 :SHA256
   "0c5c8c46c649e3ef1e9249db8d3d7a6ba634e3e81e046c79bf122ea8f67fee59")
  (:PATH
   "raw/variants/8aaa0621/tests/recovery/inventory-sources-native.lisp.txt"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/8aaa0621/tests/recovery/inventory-sources-native.lisp.txt")
   :BYTES 7665 :SHA256
   "a93ac37982b18072590fdbcab6e03e5793bfd60e18c0b30de88597a78c09e8ae")
  (:PATH
   "raw/variants/8aaa0621/tests/recovery/inventory-sources-support.lisp.txt"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/8aaa0621/tests/recovery/inventory-sources-support.lisp.txt")
   :BYTES 3982 :SHA256
   "99322ba4f6938460558995ecb3d53315c4e2317107f5c197b369c9ef2357a99c")
  (:PATH "raw/variants/8aaa0621/tests/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/8aaa0621/tests/recovery/inventory-sources.lisp.txt")
   :BYTES 16403 :SHA256
   "c1670d5bb764def39f69e8edd8da2deb554120e2898e3ad15469acfbaf034889")
  (:PATH "raw/variants/8aaa0621/tests/vertical/support.lisp.txt" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/8aaa0621/tests/vertical/support.lisp.txt")
   :BYTES 15152 :SHA256
   "5993abf1f06475098e0000c38bf46cd7857c78ec133d63c803c3c1fc9b9f18c9")
  (:PATH "raw/variants/8aaa0621/tools/foundation-mutation.lisp.txt" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/8aaa0621/tools/foundation-mutation.lisp.txt")
   :BYTES 47283 :SHA256
   "4dfa749be2bfe0df9b1045e74b51670ba72cce0fbc740fc8edfad6c76c6d46b6")
  (:PATH
   "raw/variants/b43626da/tests/recovery/inventory-sources-native.lisp.txt"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/b43626da/tests/recovery/inventory-sources-native.lisp.txt")
   :BYTES 7665 :SHA256
   "a93ac37982b18072590fdbcab6e03e5793bfd60e18c0b30de88597a78c09e8ae")
  (:PATH "raw/variants/b7f3b866/tests/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/b7f3b866/tests/recovery/inventory-sources.lisp.txt")
   :BYTES 16302 :SHA256
   "73fb2051dfdca9e6e8e0f3e6efac72e91c2776c02d834a3ca19938bf736ef84d")
  (:PATH "raw/variants/bd2fd9c2/docs/implementazione/inventario.md.txt" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/bd2fd9c2/docs/implementazione/inventario.md.txt")
   :BYTES 9903 :SHA256
   "9979c585b37f565a3f22c88ff39f339c7d1a27c62b7930b2f61ed362c1ee9005")
  (:PATH
   "raw/variants/bd2fd9c2/docs/implementazione/io-apertura-relativa.md.txt"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/bd2fd9c2/docs/implementazione/io-apertura-relativa.md.txt")
   :BYTES 2911 :SHA256
   "a231686739efe036585ed18ac81b950ba23f51971a6a93fd2a4c7a3aef312807")
  (:PATH
   "raw/variants/bd2fd9c2/tests/recovery/inventory-sources-native.lisp.txt"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/bd2fd9c2/tests/recovery/inventory-sources-native.lisp.txt")
   :BYTES 7653 :SHA256
   "b4e99affe31e3469acfa2676dd4c71e61fcedd680a4743805b45358866c74220")
  (:PATH "raw/variants/bd2fd9c2/tests/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/bd2fd9c2/tests/recovery/inventory-sources.lisp.txt")
   :BYTES 16302 :SHA256
   "edd75f076cdd195aa795e3f5a3234a25e58e7e8a6e2c57fe169df56cd1f7552b")
  (:PATH
   "raw/variants/c7a40bf4/docs/implementazione/fonti-recovery-metodo.md.txt"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/c7a40bf4/docs/implementazione/fonti-recovery-metodo.md.txt")
   :BYTES 4208 :SHA256
   "b36be96c46e4d5bef6568a451cfcaddf33cf43f99609aaaf5505423021ec27a8")
  (:PATH
   "raw/variants/dd19d48e/tests/recovery/inventory-sources-native.lisp.txt"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/dd19d48e/tests/recovery/inventory-sources-native.lisp.txt")
   :BYTES 6243 :SHA256
   "590d0b9fdd081d8f36c3a9b4f1136b942a3600b76dfd687e11b51b38b3e66b1d")
  (:PATH "raw/variants/dd19d48e/tests/recovery/inventory-sources.lisp.txt"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/variants/dd19d48e/tests/recovery/inventory-sources.lisp.txt")
   :BYTES 13987 :SHA256
   "c09f7cc55ac748f2b1f61f279e7fd44299d8e6e09c5aa6cd7e8a7b1c55649693")
  (:PATH "report.md" :SOURCE
   #A((101) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/sources-publication/report.md")
   :BYTES 5026 :SHA256
   "a3f573678c8a53171be4107456c021926a2131b85430264662cb18e8716d4286"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
