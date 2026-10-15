(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "development-01" :RECORD-PATH "processes/development-01/report.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((25) BASE-CHAR . "tools/vertical-crash.lisp")
    #A((11) BASE-CHAR . "--self-test"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "development-02" :RECORD-PATH "processes/development-02/report.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((25) BASE-CHAR . "tools/vertical-crash.lisp")
    #A((11) BASE-CHAR . "--self-test"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "development-03" :RECORD-PATH "processes/development-03/report.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((25) BASE-CHAR . "tools/vertical-crash.lisp")
    #A((11) BASE-CHAR . "--self-test"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "README.md" :SOURCE
   #A((99) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/vertical-resume-results.txt")
   :BYTES 3181 :SHA256
   "c62704bcc5275c72bd46f24ad5fd059a5f219dca2286c5ab674453387c754e33")
  (:PATH "collection-manifest.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/vertical-resume-publication-manifest.lisp")
   :BYTES 7291 :SHA256
   "3fb115f5e3532fc4fd4693896fb4c0ec4d88c0db2b82149484faca8913cd233f")
  (:PATH "collection-source.lisp" :SOURCE
   #A((95) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH "processes/development-01/conservazione.lisp" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001082013-command-5684-0/conservazione.lisp")
   :BYTES 1139 :SHA256
   "5fac82768b625e239c813df6b4e3c6329ac96d884ce202c911cc29beab8d5d65")
  (:PATH "processes/development-01/report.lisp" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001082013-command-5684-0/report.lisp")
   :BYTES 209960 :SHA256
   "39129b69597bcb8e9647654fda1aadc45490a56d249e8c3758f8eaa5a1aefe9e")
  (:PATH "processes/development-02/conservazione.lisp" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001082074-command-5881-0/conservazione.lisp")
   :BYTES 1139 :SHA256
   "dadbf7a15818211118062b3dcd17e752394aa175dff368f73510b234fb3cf37c")
  (:PATH "processes/development-02/report.lisp" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001082074-command-5881-0/report.lisp")
   :BYTES 215591 :SHA256
   "07d404ff9c0e35ea7e33c055575565d11ed45f3e4eb5e5d6600ea3318fce8be8")
  (:PATH "processes/development-03/conservazione.lisp" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001082179-command-6143-0/conservazione.lisp")
   :BYTES 1139 :SHA256
   "e61698df81a0a2fc9dc034bb77dc312026be6888343e3d6a5afc198df511d39e")
  (:PATH "processes/development-03/report.lisp" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001082179-command-6143-0/report.lisp")
   :BYTES 217032 :SHA256
   "b804b9531e0809140520ae4f629f945b88e8c150deb4ff62d56697f61eda81df")
  (:PATH "raw/audit/vertical-resume-source-audit.lisp" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/vertical-resume-source-audit.lisp")
   :BYTES 1761 :SHA256
   "dfc6061b95c66e8e965b64afc17139ffc20432146b9456af5d8209e07220c613")
  (:PATH "raw/audit/vertical-resume-source-audit.log" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/vertical-resume-source-audit.log")
   :BYTES 77 :SHA256
   "54745574afd640e747156109001bcab58af3907e98f4fab89726a0b95d7f2089")
  (:PATH "raw/development-01/arcdocdb.asd.txt" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/vertical-resume-development-01-sources/arcdocdb.asd.txt")
   :BYTES 19538 :SHA256
   "d3db1402b65ac0a1ebfd8d5c8719bca8437870dc98f6678fe87f66e413982e8a")
  (:PATH "raw/development-01/tests/vertical/method.md.txt" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/vertical-resume-development-01-sources/tests/vertical/method.md.txt")
   :BYTES 4143 :SHA256
   "e5ef0660257a6c3c5fe713f9990f86a41b3a3c59caed01c9c537d767fb547609")
  (:PATH "raw/development-01/tests/vertical/processes.lisp.txt" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/vertical-resume-development-01-sources/tests/vertical/processes.lisp.txt")
   :BYTES 5186 :SHA256
   "61816140cfe14e4ab78ed94cda56bda4088edf17e2e08268aa1ff70296a3985b")
  (:PATH "raw/development-01/tests/vertical/resume.lisp.txt" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/vertical-resume-development-01-sources/tests/vertical/resume.lisp.txt")
   :BYTES 6585 :SHA256
   "09124405ca2eb9dcdbf3056cf7f149b781a236ac414d7fb7c5425f67f9389671")
  (:PATH "raw/development-01/tests/vertical/scenarios.lisp.txt" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/vertical-resume-development-01-sources/tests/vertical/scenarios.lisp.txt")
   :BYTES 5902 :SHA256
   "fc9dcdcbbe59d133c709f02ab02f8b8a1e9c8775790ad057d84cc215aae3d69d")
  (:PATH "raw/development-01/tests/vertical/support.lisp.txt" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/vertical-resume-development-01-sources/tests/vertical/support.lisp.txt")
   :BYTES 13465 :SHA256
   "9eb84be7e415a145b05233a0768bf06eb9c582261b007406dfcf4e0bcf0cb9a1")
  (:PATH "raw/development-01/tools/vertical-crash.lisp.txt" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/vertical-resume-development-01-sources/tools/vertical-crash.lisp.txt")
   :BYTES 1023 :SHA256
   "352ac27b876e3bcf042f26029b686d40c0dffab86747ab25e784c447cc0194fd")
  (:PATH "raw/development-02/arcdocdb.asd.txt" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/vertical-resume-development-02-sources/arcdocdb.asd.txt")
   :BYTES 19538 :SHA256
   "d3db1402b65ac0a1ebfd8d5c8719bca8437870dc98f6678fe87f66e413982e8a")
  (:PATH "raw/development-02/tests/vertical/method.md.txt" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/vertical-resume-development-02-sources/tests/vertical/method.md.txt")
   :BYTES 4143 :SHA256
   "e5ef0660257a6c3c5fe713f9990f86a41b3a3c59caed01c9c537d767fb547609")
  (:PATH "raw/development-02/tests/vertical/processes.lisp.txt" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/vertical-resume-development-02-sources/tests/vertical/processes.lisp.txt")
   :BYTES 5186 :SHA256
   "61816140cfe14e4ab78ed94cda56bda4088edf17e2e08268aa1ff70296a3985b")
  (:PATH "raw/development-02/tests/vertical/resume.lisp.txt" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/vertical-resume-development-02-sources/tests/vertical/resume.lisp.txt")
   :BYTES 6585 :SHA256
   "09124405ca2eb9dcdbf3056cf7f149b781a236ac414d7fb7c5425f67f9389671")
  (:PATH "raw/development-02/tests/vertical/scenarios.lisp.txt" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/vertical-resume-development-02-sources/tests/vertical/scenarios.lisp.txt")
   :BYTES 5902 :SHA256
   "fc9dcdcbbe59d133c709f02ab02f8b8a1e9c8775790ad057d84cc215aae3d69d")
  (:PATH "raw/development-02/tests/vertical/support.lisp.txt" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/vertical-resume-development-02-sources/tests/vertical/support.lisp.txt")
   :BYTES 13469 :SHA256
   "8f59f1d3788278a2ad1584fe25e9afb24b7f09ff4774142781b85b703306b5eb")
  (:PATH "raw/development-02/tools/vertical-crash.lisp.txt" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/vertical-resume-development-02-sources/tools/vertical-crash.lisp.txt")
   :BYTES 1023 :SHA256
   "352ac27b876e3bcf042f26029b686d40c0dffab86747ab25e784c447cc0194fd")
  (:PATH "raw/development-03/arcdocdb.asd.txt" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/vertical-resume-development-03-sources/arcdocdb.asd.txt")
   :BYTES 19538 :SHA256
   "d3db1402b65ac0a1ebfd8d5c8719bca8437870dc98f6678fe87f66e413982e8a")
  (:PATH "raw/development-03/tests/vertical/method.md.txt" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/vertical-resume-development-03-sources/tests/vertical/method.md.txt")
   :BYTES 4143 :SHA256
   "e5ef0660257a6c3c5fe713f9990f86a41b3a3c59caed01c9c537d767fb547609")
  (:PATH "raw/development-03/tests/vertical/processes.lisp.txt" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/vertical-resume-development-03-sources/tests/vertical/processes.lisp.txt")
   :BYTES 5186 :SHA256
   "61816140cfe14e4ab78ed94cda56bda4088edf17e2e08268aa1ff70296a3985b")
  (:PATH "raw/development-03/tests/vertical/resume.lisp.txt" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/vertical-resume-development-03-sources/tests/vertical/resume.lisp.txt")
   :BYTES 6585 :SHA256
   "09124405ca2eb9dcdbf3056cf7f149b781a236ac414d7fb7c5425f67f9389671")
  (:PATH "raw/development-03/tests/vertical/scenarios.lisp.txt" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/vertical-resume-development-03-sources/tests/vertical/scenarios.lisp.txt")
   :BYTES 5902 :SHA256
   "fc9dcdcbbe59d133c709f02ab02f8b8a1e9c8775790ad057d84cc215aae3d69d")
  (:PATH "raw/development-03/tests/vertical/support.lisp.txt" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/vertical-resume-development-03-sources/tests/vertical/support.lisp.txt")
   :BYTES 13593 :SHA256
   "04a5c05cea9cfa0aada8cdc474e4d38435a6f87449e80a455955b47d96e1f13a")
  (:PATH "raw/development-03/tools/vertical-crash.lisp.txt" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/vertical-resume-development-03-sources/tools/vertical-crash.lisp.txt")
   :BYTES 1023 :SHA256
   "352ac27b876e3bcf042f26029b686d40c0dffab86747ab25e784c447cc0194fd")
  (:PATH "raw/final-documents/CHANGELOG.md.txt" :SOURCE
   #A((73) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/CHANGELOG.md")
   :BYTES 26561 :SHA256
   "5b89956cde767e9a4fc3dcb7435e397253b20ae305fb6ed50db029336897b4a0")
  (:PATH "raw/final-documents/README.md.txt" :SOURCE
   #A((70) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/README.md")
   :BYTES 10341 :SHA256
   "50eb9d1c201b947bf087587b48559e06579d6fdd585af95ec1c1c6b796d1185f")
  (:PATH "raw/final-documents/docs/implementazione/README.md.txt" :SOURCE
   #A((91) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/README.md")
   :BYTES 12975 :SHA256
   "0304c1bf46f02267f8ed2d7c6dbed48ec84944dba25dd16d0f809dedb9654105")
  (:PATH "raw/final-documents/docs/implementazione/prova-verticale.md.txt"
   :SOURCE
   #A((100) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/prova-verticale.md")
   :BYTES 4923 :SHA256
   "81f6adc8132b50ba5fc8da4c9b28265eb70fd27ab8f3393874ff497d15709983")
  (:PATH "raw/final-documents/docs/roadmap.md.txt" :SOURCE
   #A((76) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/roadmap.md")
   :BYTES 10817 :SHA256
   "42e668db5468a68661f0027b1a25d1b8eb3671cd12c1c8f1049a34bee57a689d")
  (:PATH "raw/final-documents/docs/valutazione/README.md.txt" :SOURCE
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/valutazione/README.md")
   :BYTES 14368 :SHA256
   "9afc4b002a62723eb466a7c9e7f11ba4b94691f865a4848bb58f4d0ac1aa851f")
  (:PATH "raw/final-documents/spikes/results/README.md.txt" :SOURCE
   #A((85) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/README.md")
   :BYTES 2674 :SHA256
   "22c7dbc4a379c1d11dc84e56ddae507ecb296cd2c0021e5de9bd575e0bceb7ce"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
