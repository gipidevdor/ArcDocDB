(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "r2" :RECORD-PATH "processes/r2/report.lisp" :COMMAND
   (#A((3) BASE-CHAR . "env")
    #A((273) BASE-CHAR
       . "ASDF_OUTPUT_TRANSLATIONS=(:output-translations (#P\"/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/**/*.*\" #P\"/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-R2-fasl/**/*.*\") :ignore-inherited-configuration)")
    #A((4) BASE-CHAR . "make") #A((4) BASE-CHAR . "test")
    #A((4) BASE-CHAR . "lint") #A((5) BASE-CHAR . "trace")
    #A((5) BASE-CHAR . "links"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "post-publication-p1" :RECORD-PATH
   "processes/post-publication-p1/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "trace")
    #A((5) BASE-CHAR . "links") #A((8) BASE-CHAR . "evidence"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "pr1-linux" :RECORD-PATH "processes/pr1-linux/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "make") #A((10) BASE-CHAR . "check-core")) :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "pr1-documentation" :RECORD-PATH
   "processes/pr1-documentation/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "trace")
    #A((5) BASE-CHAR . "links"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "pr1-macos" :RECORD-PATH "processes/pr1-macos/report.lisp" :COMMAND
   (#A((60) BASE-CHAR
       . "/Applications/Xcode_26.6.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "README.md" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-S2-publication-inputs/README.md.txt")
   :BYTES 2512 :SHA256
   "5a10c56ec8af6c0c3b5d0207e83f80912118342ee9d9911cf3e08578f71c38c0")
  (:PATH "ci/pr1-linux-docs-verification.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-pr-ci/linux-docs-verification.lisp")
   :BYTES 5216 :SHA256
   "e33200fb6911ac6245f5cd1b16d6bf788d8427ed32ed3cd6028df64cebd65fcb")
  (:PATH "ci/pr1-mac-verification.lisp" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-pr-ci/mac-verification.lisp")
   :BYTES 4880 :SHA256
   "81b8c30f9129242b5b46c6bb736c4ada6034663531784640ace2741b884e9da6")
  (:PATH "ci/pr1-run-completed.json" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-pr-ci/run-completed.json")
   :BYTES 13172 :SHA256
   "372d533e418e5693ecf6ed7213a2b8aa128fd94bf0ce7c2a0250cbea9f6314f6")
  (:PATH "collection-manifest.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-S2-publication-inputs/manifest.lisp")
   :BYTES 5110 :SHA256
   "8dbb808c7cd37bd0a9c731ca404fa6ddc36ab4e763731e2eb97a4360511656c4")
  (:PATH "collection-source.lisp" :SOURCE
   #A((100) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH "inputs/frozen-S2/arcdocdb.asd.txt" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-S2-publication-inputs/arcdocdb.asd.txt")
   :BYTES 21055 :SHA256
   "e6a4bac8abfd3ba3ae32939fecaea6f923daaf03756433882524a488b8153de5")
  (:PATH "inputs/frozen-S2/docs/implementazione/prova-verticale.md.txt" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-S2-publication-inputs/docs/implementazione/prova-verticale.md.txt")
   :BYTES 6620 :SHA256
   "897305e8909a5487bf0de7f00a65d4ab212280c2040ebdc51fd9e68b357811f2")
  (:PATH "inputs/frozen-S2/tests/vertical/method.md.txt" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-S2-publication-inputs/tests/vertical/method.md.txt")
   :BYTES 7393 :SHA256
   "cdfb2866b652dbe3238498b0ad348de891e88c69cfb31541be0b6a2fd876cad7")
  (:PATH "inputs/frozen-S2/tests/vertical/scenarios.lisp.txt" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-S2-publication-inputs/tests/vertical/scenarios.lisp.txt")
   :BYTES 5923 :SHA256
   "59e7d98ea2dce103d22ed87377654fc3c22cda92f0f8063db5fbadf022e0fffe")
  (:PATH "inputs/frozen-S2/tests/vertical/support.lisp.txt" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-S2-publication-inputs/tests/vertical/support.lisp.txt")
   :BYTES 13949 :SHA256
   "a4f5a20b890a9e06763bbcf0f0ddec1febd2b1a20e0da054e38d46c750c033b4")
  (:PATH "inputs/provenance.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-S2-publication-inputs/provenance.lisp")
   :BYTES 2577 :SHA256
   "dece995eeaa13a7d322d0361a17ed24b19e178a6c4b22fd20a5108b29d3582b6")
  (:PATH "processes/post-publication-p1/conservazione.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001156096-command-25731-0/conservazione.lisp")
   :BYTES 1159 :SHA256
   "e91acbd2cb96021a7b1da81ac181f35389190d21800aef6a1b3e4a3fb0ed0c6f")
  (:PATH "processes/post-publication-p1/report.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001156096-command-25731-0/report.lisp")
   :BYTES 218588 :SHA256
   "267d24e8201b8e48f1c5db9b8b3ae82527678b0975f5ac578415e92442bd3536")
  (:PATH "processes/pr1-documentation/conservazione.lisp" :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-pr-ci/prove-documentazione/4001156127-command-2415-0/conservazione.lisp")
   :BYTES 1061 :SHA256
   "e9bb502a33617809b4c06ddd58006fc6a93dc08abb7e2c28913357823ddf39f8")
  (:PATH "processes/pr1-documentation/report.lisp" :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-pr-ci/prove-documentazione/4001156127-command-2415-0/report.lisp")
   :BYTES 220004 :SHA256
   "3fd6ad33de0b5b51f81cad99dd06d14b26cf57380d9fcdb25dad23cf0cb48b90")
  (:PATH "processes/pr1-linux/conservazione.lisp" :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-pr-ci/prove-ubuntu-latest/4001156127-command-2346-0/conservazione.lisp")
   :BYTES 1614 :SHA256
   "d9ab41c5901719578c2a2672f28133538e617601066b1b9a108b241444b98326")
  (:PATH "processes/pr1-linux/report.lisp" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-pr-ci/prove-ubuntu-latest/4001156127-command-2346-0/report.lisp")
   :BYTES 317 :SHA256
   "42cc1f1d4a5e65dd4f809f70c2aaaa21e72910f90b8cefcc856c4ac97cd3aaed")
  (:PATH "processes/pr1-linux/report.lisp.gz" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-pr-ci/prove-ubuntu-latest/4001156127-command-2346-0/report.lisp.gz")
   :BYTES 217652 :SHA256
   "880e7c51b64a834143fdcdb684c8544726fbda6aa3fe7f5096c71c5b79d2ad1a")
  (:PATH "processes/pr1-macos/conservazione.lisp" :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-pr-ci/prove-macos-latest/4001156164-command-2439-0/conservazione.lisp")
   :BYTES 1620 :SHA256
   "f3bc46df74ab9a482effca0151fe0cdd319088baa3028582f1f1034f1a852a2c")
  (:PATH "processes/pr1-macos/report.lisp" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-pr-ci/prove-macos-latest/4001156164-command-2439-0/report.lisp")
   :BYTES 317 :SHA256
   "febf1db0999c786fa3d19ee3cc67046cb9e0dee4dbe5f78e41d9994c6e83d2be")
  (:PATH "processes/pr1-macos/report.lisp.gz" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-pr-ci/prove-macos-latest/4001156164-command-2439-0/report.lisp.gz")
   :BYTES 222246 :SHA256
   "1b6f5f2c135faeeeaea8884c26952b1750fa000c9a1bf5cc83bc48dea359a8d9")
  (:PATH "processes/r2/conservazione.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001156949-command-71223-0/conservazione.lisp")
   :BYTES 1743 :SHA256
   "bb1451e821a090b7ed3c1a3f2c36a25aa7cf45cc5bfcb8dd52284672358bee26")
  (:PATH "processes/r2/report.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001156949-command-71223-0/report.lisp")
   :BYTES 317 :SHA256
   "efee91ac1526196a731eb4f82775df81efc9bb596c86f5919302a7782ce1448f")
  (:PATH "processes/r2/report.lisp.gz" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001156949-command-71223-0/report.lisp.gz")
   :BYTES 214032 :SHA256
   "0138c11b4340ae2b790d98a8fe00bf41094edde1b3bcacaac6ba153231c1f9c7"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
