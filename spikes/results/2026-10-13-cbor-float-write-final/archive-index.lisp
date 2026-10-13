(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "original-collection" :RECORD-PATH
   "processes/original-collection/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((69) BASE-CHAR
       . "spikes/out/cbor-float-write-20261013/parallel-collection/collect.lisp")
    #A((9) BASE-CHAR . "--collect")
    #A((50) BASE-CHAR . "spikes/out/cbor-float-write-20261013/manifest.lisp")
    #A((43) BASE-CHAR . "spikes/results/2026-10-13-cbor-float-write/")
    #A((6) BASE-CHAR . "--jobs") #A((1) BASE-CHAR . "4")))
  (:LABEL "integrated-check-core" :RECORD-PATH
   "processes/integrated-check-core/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core")))
  (:LABEL "integrated-check-wrapper" :RECORD-PATH
   "processes/integrated-check-wrapper/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "check")))
  (:LABEL "pool-integrated-check" :RECORD-PATH
   "processes/pool-integrated-check/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core")))
  (:LABEL #A((16) BASE-CHAR . "final-collection") :RECORD-PATH
   "processes/final-collection/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((69) BASE-CHAR
       . "spikes/out/cbor-float-write-20261013/parallel-collection/collect.lisp")
    #A((9) BASE-CHAR . "--collect")
    #A((56) BASE-CHAR
       . "spikes/out/cbor-float-write-20261013/final-manifest.lisp")
    #A((49) BASE-CHAR . "spikes/results/2026-10-13-cbor-float-write-final/")
    #A((6) BASE-CHAR . "--jobs") #A((1) BASE-CHAR . "4")))
  (:LABEL #A((11) BASE-CHAR . "final-links") :RECORD-PATH
   "processes/final-links/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "links"))))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/final-manifest.lisp")
   :BYTES 3598 :SHA256
   "97727e5c130ac81a207afbf2b06455a30baee29bcdc727b6c8c27e49581b7c1e")
  (:PATH "collection-source.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/collect.lisp")
   :BYTES 22602 :SHA256
   "53d8c739a95a79aba4ddc363abd6e0bc1f8d3f64b1572150b730f69eedc15296")
  (:PATH "processes/integrated-check-core/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908032-command-75888-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "1e40ebeaf288ceb54fd05c86c4449e2dc8ae732f010e586446db0c2283474b59")
  (:PATH "processes/integrated-check-core/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908032-command-75888-0/report.lisp")
   :BYTES 901371 :SHA256
   "6271069bec82074e336401ddafbdd34651fd27c1a3a5c5ac1b3b44877373c736")
  (:PATH "processes/integrated-check-wrapper/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908030-command-75831-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "5554259885a76f3cc1bdac076bbe0efd7b751e7555a8dac2152045484ebf5056")
  (:PATH "processes/integrated-check-wrapper/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908030-command-75831-0/report.lisp")
   :BYTES 155773 :SHA256
   "9533811a271be21e9079b119e84ffbdd70821189b3ff57ba79d1c961bd3ce0f0")
  (:PATH "processes/original-collection/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906916-command-50498-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "a4783511375c870181e6fdd4cc7365e416e508c5e42ad8be6f63852bbd428e07")
  (:PATH "processes/original-collection/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000906916-command-50498-0/report.lisp")
   :BYTES 153926 :SHA256
   "e5fa8121976786da6436ba75ff960252c8c0dbe10f432bcbe64a796b80044340")
  (:PATH "processes/pool-integrated-check/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908322-command-83574-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "fc67f18a4593182ee9964bc454d50b23ab517d2b68dad89d55b50470175679e5")
  (:PATH "processes/pool-integrated-check/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908322-command-83574-0/report.lisp")
   :BYTES 913567 :SHA256
   "1eabacae7361646c6ed0de5662f083a2994f3493fa76f5b134e63977ea6e0ef5")
  (:PATH
   "raw/4000908348-snapshot-self-test-84033-0/completion-exit/isolated-build.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908348-snapshot-self-test-84033-0/completion-exit/isolated-build.lisp")
   :BYTES 199 :SHA256
   "b8bb4416a818775bae5c77341eeec2c356a2733f633ac2bc8b6ac3ff955d05e0")
  (:PATH "raw/4000908348-snapshot-self-test-84033-0/completion-exit/stderr.log"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908348-snapshot-self-test-84033-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/4000908348-snapshot-self-test-84033-0/completion-exit/stdout.log"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908348-snapshot-self-test-84033-0/completion-exit/stdout.log")
   :BYTES 107 :SHA256
   "4f22544421d9012fe132a36bf15950cd327ca959b8f9c5ef3d386e0c8b62a25c")
  (:PATH "raw/4000908348-snapshot-self-test-84033-0/report.lisp" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908348-snapshot-self-test-84033-0/report.lisp")
   :BYTES 1961 :SHA256
   "01eec2165481e767486382d8c6fb80ac39cc2bad25386ae06223cd602e0f9455")
  (:PATH "raw/4000908348-snapshot-self-test-84033-0/signal/isolated-build.lisp"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908348-snapshot-self-test-84033-0/signal/isolated-build.lisp")
   :BYTES 249 :SHA256
   "a345276e3dfe377c0bbd359793165915b1527938a65250d367ce5ac079feecc1")
  (:PATH "raw/4000908348-snapshot-self-test-84033-0/signal/stderr.log" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908348-snapshot-self-test-84033-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/4000908348-snapshot-self-test-84033-0/signal/stdout.log" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908348-snapshot-self-test-84033-0/signal/stdout.log")
   :BYTES 128 :SHA256
   "e3502e714a0530acb1f0130c4ced4a016607bcb067e3686f6f29704db8423ea5")
  (:PATH
   "raw/4000908349-reader-self-test-84045-0/completion-exit/isolated-build.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908349-reader-self-test-84045-0/completion-exit/isolated-build.lisp")
   :BYTES 197 :SHA256
   "1a45dcf8a6d03f1e8866e49280c6f0edb894320c90624d5620fad1e3d546cea9")
  (:PATH "raw/4000908349-reader-self-test-84045-0/completion-exit/stderr.log"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908349-reader-self-test-84045-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/4000908349-reader-self-test-84045-0/completion-exit/stdout.log"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908349-reader-self-test-84045-0/completion-exit/stdout.log")
   :BYTES 105 :SHA256
   "5e630c1b44d68ce71b27d151e76bf367e3cbd941200adc36cdd30e0fe7390531")
  (:PATH "raw/4000908349-reader-self-test-84045-0/report.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908349-reader-self-test-84045-0/report.lisp")
   :BYTES 1943 :SHA256
   "d07c00a9ef6b2d61d481ad7e7913a6353d3a357fde65a393e0dd501ac20495b7")
  (:PATH "raw/4000908349-reader-self-test-84045-0/signal/isolated-build.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908349-reader-self-test-84045-0/signal/isolated-build.lisp")
   :BYTES 247 :SHA256
   "ff5cf55dda241d32ea1b4308172c7dc526436cbf1d546e7471148cee95a873d1")
  (:PATH "raw/4000908349-reader-self-test-84045-0/signal/stderr.log" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908349-reader-self-test-84045-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/4000908349-reader-self-test-84045-0/signal/stdout.log" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908349-reader-self-test-84045-0/signal/stdout.log")
   :BYTES 126 :SHA256
   "3697c68fa71f124c8d05d8cc5d649a744586a10989eb2e67c5bdce6bfc760142")
  (:PATH "raw/append-source.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/append-source.lisp")
   :BYTES 9677 :SHA256
   "f59f7a52934c7fe6103b5047aade87214f17494e857fe35c568968c681790d81")
  (:PATH "raw/build-final-manifest.lisp" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/build-final-manifest.lisp")
   :BYTES 4278 :SHA256
   "776bb6065c74e38537fe5435ccb7bb9f38ce65a45cec7978e28b1045d07de8ac")
  (:PATH "raw/collection-review-final.md.txt" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/collection-review-final.md")
   :BYTES 4079 :SHA256
   "0f689338f86323e42801b1f3682dfce49a228eff64072138364b71eeb2b2bc5b")
  (:PATH "raw/final-documents/cbor-float-scrittura-copertura.md.txt" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/final-frozen/cbor-float-scrittura-copertura.md.txt")
   :BYTES 10190 :SHA256
   "58378fc4d47ba5e2f2834b416459e6e690b0a03f679cc517e0b41e268ce020e3")
  (:PATH "raw/final-documents/cbor-float-scrittura-dati.md.txt" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/final-frozen/cbor-float-scrittura-dati.md.txt")
   :BYTES 15246 :SHA256
   "9aacb010b678cb9553ad762313bfcb8ed89d8f0460a9563984d97e239348b528")
  (:PATH "raw/final-documents/cbor-float-scrittura-risultati.md.txt" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/final-frozen/cbor-float-scrittura-risultati.md.txt")
   :BYTES 9558 :SHA256
   "87ecbf5583f31149246dc663d22763bba359f5f4b144703e54da8ce28c341f4d")
  (:PATH "raw/final-documents/cbor-float-scrittura.md.txt" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/final-frozen/cbor-float-scrittura.md.txt")
   :BYTES 2052 :SHA256
   "0b0075eaf7f90999331c3c0fe010a7121227148186a4d622332c835a26026d03")
  (:PATH "raw/integrated-spikes/SPK-01.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908497-check-85874-0/SPK-01.lisp")
   :BYTES 27227 :SHA256
   "6bcd8a1574c7e8057f6be6d8a39fa3150ba74566e30d27f2c4cdd75b080f2335")
  (:PATH "raw/integrated-spikes/SPK-02.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908497-check-85874-0/SPK-02.lisp")
   :BYTES 1606 :SHA256
   "b8df893dfd28a5612aa6e989149ebf9e5d04e5510dcbd7f51b7d13b7ca11e6d4")
  (:PATH "raw/integrated-spikes/SPK-03.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908497-check-85874-0/SPK-03.lisp")
   :BYTES 3643 :SHA256
   "7e93948eda4878b75b319d37af9d27667cb7107d2972d7330ebd57e283380b76")
  (:PATH "raw/integrated-spikes/SPK-04.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908497-check-85874-0/SPK-04.lisp")
   :BYTES 6752 :SHA256
   "5afd319665ad1307d6e37d7f4246bc110e5e3d82898f48c82544f409c41fd56d")
  (:PATH "raw/integrated-spikes/SPK-05.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908497-check-85874-0/SPK-05.lisp")
   :BYTES 10105 :SHA256
   "e125f6610d2de36f27de8aa556729c43a98e8baa0b304eb5de8785b7c2e6627e")
  (:PATH "raw/integrated-spikes/SPK-06.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908497-check-85874-0/SPK-06.lisp")
   :BYTES 23954 :SHA256
   "13381ae51a3d52ba24d06d84b5c19ea6167a923d79b8dfb124c19d6aa3332647")
  (:PATH "raw/integrated-spikes/SPK-07.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908497-check-85874-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "4cf6ab7e6d642f78b8ebdb2a2bf3d443896c4b6f991e0a6b341152b5ddd7b258")
  (:PATH "raw/integrated-spikes/SPK-07.lisp.gz" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908497-check-85874-0/SPK-07.lisp.gz")
   :BYTES 410643 :SHA256
   "59862d4a303ac230dc2c242568bedac503a275eb4db7db892b582d42b01149c1")
  (:PATH "raw/integrated-spikes/SPK-08.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908497-check-85874-0/SPK-08.lisp")
   :BYTES 291712 :SHA256
   "7e265dd6360b8b2295bc115a17d2694e8710c1e5a83b95e1d431bbb973efe519")
  (:PATH "raw/integrated-spikes/SPK-09.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908497-check-85874-0/SPK-09.lisp")
   :BYTES 2472 :SHA256
   "eabb4e7c9aad513f7d13ff55fa8583bf6dd015d31497ea42ede07ece81f6d1f7")
  (:PATH "raw/integrated-spikes/SPK-10.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908497-check-85874-0/SPK-10.lisp")
   :BYTES 22977 :SHA256
   "975d13c2fc92c50615d2446e87b85c211c48ec78c75f48c9c03d7e6ea9f3af92")
  (:PATH "raw/integrated-spikes/conservazione.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908497-check-85874-0/conservazione.lisp")
   :BYTES 2301 :SHA256
   "808bbd3cb5b8c1e9aaed5c74c3153f94fc2ebb18be013eb58b74e68dda87609e")
  (:PATH "raw/integrated-spikes/report.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908497-check-85874-0/report.lisp")
   :BYTES 318 :SHA256
   "f44ab22c0c73f9ec709a8f22b5651e57a2bc2a0355666296d7558c5bc1c5ca07")
  (:PATH "raw/integrated-spikes/report.lisp.gz" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908497-check-85874-0/report.lisp.gz")
   :BYTES 467147 :SHA256
   "5ca23e18502d230b1b20d2b63bf881923ebbbcdd3b7bf6dbcd0bb497e4e85a4a")
  (:PATH "raw/integration-review-final.md.txt" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/integration-review-final.md")
   :BYTES 6457 :SHA256
   "8f39a68486b35f6dc8ea081bb9bf58a14e19665e8203d4bf3b8fc8313c5f81a9")
  (:PATH "raw/original-closed-check.log" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/closed-check-4000907333-50528-0.log")
   :BYTES 5319 :SHA256
   "91fadede6e66f094b13cf179310b2d964895c73e0f8b3075bf773d8aaf23880c")
  (:PATH "raw/original-collection-observation.lisp" :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/parallel-collection/collection-observation-4000906918-50528-0.lisp")
   :BYTES 1015738 :SHA256
   "277c281eb175a6e8cfbc7011c77a0e706fbed7e75b44641c29794e74c566c036")
  (:PATH "raw/pool-integration-review-final.md.txt" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/pool-integration-review-final.md")
   :BYTES 2932 :SHA256
   "6dc35dd3e9cfc527ed08af9231d0535078ac94387eea5ecb9deb2c458ed3510c")
  (:PATH "raw/root-count-reading-note.md.txt" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-float-write-20261013/root-count-reading-note.md")
   :BYTES 1159 :SHA256
   "cdb30998103dc02d02ab55e8d13b905448f137366a87c90e66c3b010713fa602")
  (:PATH "processes/final-collection/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908930-command-89654-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "14b32c835a84869f3724b4e214a1d97b6c15eb6ef12d9ce9d4e646d606c2f55d")
  (:PATH "processes/final-collection/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000908930-command-89654-0/report.lisp")
   :BYTES 159302 :SHA256
   "ee91a1b438fe46e0824c24ff751b40da068d77ea0e38c50a632247e58a8e4eb4")
  (:PATH "processes/final-links/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000909003-command-90229-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "db1f6c5c18935c0a00a762f83183addff1bc6199d12bda998b624613c4def8b7")
  (:PATH "processes/final-links/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000909003-command-90229-0/report.lisp")
   :BYTES 158745 :SHA256
   "74bc15196a143a6e2657aded84bd4927d3982d8e948af07add2835795d461301"))
 :LIMITS
 (:SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :FASL-EXCLUDED-FROM-PUBLISHED-MUTATION-TREES
  :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
