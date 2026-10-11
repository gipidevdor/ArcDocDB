(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "campaign-collection" :RECORD-PATH
   "processes/campaign-collection/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((36) BASE-CHAR . "spikes/out/header-write/collect.lisp")
    #A((9) BASE-CHAR . "--collect")
    #A((51) BASE-CHAR . "spikes/out/cbor-simple-write-20261011/manifest.lisp")
    #A((44) BASE-CHAR . "spikes/results/2026-10-11-cbor-simple-write/")))
  (:LABEL "campaign-closed-audit" :RECORD-PATH
   "processes/campaign-closed-audit/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((32) BASE-CHAR . "tools/check-command-archive.lisp")
    #A((9) BASE-CHAR . "--archive")
    #A((44) BASE-CHAR . "spikes/results/2026-10-11-cbor-simple-write/")))
  (:LABEL "integrated-full-check" :RECORD-PATH
   "processes/integrated-full-check/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core")))
  (:LABEL "integrated-coverage-self-test" :RECORD-PATH
   "processes/integrated-coverage-self-test/report.lisp" :STATUS :OK :EXIT-CODE
   0 :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((11) BASE-CHAR . "--self-test")
    #A((68) BASE-CHAR
       . "spikes/out/cbor-simple-write-20261011/integrated-coverage-self-test/")))
  (:LABEL #A((16) BASE-CHAR . "final-collection") :RECORD-PATH
   "processes/final-collection/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((36) BASE-CHAR . "spikes/out/header-write/collect.lisp")
    #A((9) BASE-CHAR . "--collect")
    #A((57) BASE-CHAR
       . "spikes/out/cbor-simple-write-20261011/final-manifest.lisp")
    #A((50) BASE-CHAR . "spikes/results/2026-10-11-cbor-simple-write-final/")))
  (:LABEL #A((18) BASE-CHAR . "final-closed-audit") :RECORD-PATH
   "processes/final-closed-audit/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((32) BASE-CHAR . "tools/check-command-archive.lisp")
    #A((9) BASE-CHAR . "--archive")
    #A((50) BASE-CHAR
       . "spikes/results/2026-10-11-cbor-simple-write-final/"))))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/final-manifest.lisp")
   :BYTES 4432 :SHA256
   "da265ae93d10d42b4858bc7b792238c35a93bd7a55ea6d0635484fc3a02489a3")
  (:PATH "collection-source.lisp" :SOURCE
   #A((101) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/header-write/collect.lisp")
   :BYTES 9677 :SHA256
   "f59f7a52934c7fe6103b5047aade87214f17494e857fe35c568968c681790d81")
  (:PATH "processes/campaign-closed-audit/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715612-command-66193-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "1cce9aa9401a791b38fe6f48475098027c3999f5fed592345e9995a5623a01d6")
  (:PATH "processes/campaign-closed-audit/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715612-command-66193-0/report.lisp")
   :BYTES 152847 :SHA256
   "e79c00ea22dca48fafbbf6ddd879b5f32b579949079f4ad899b2e7696d689cdd")
  (:PATH "processes/campaign-collection/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715069-command-92847-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "4a3ef0f9540d5a970743f5c06cd43426d7c9d5181d1418855a018235cc5151ed")
  (:PATH "processes/campaign-collection/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715069-command-92847-0/report.lisp")
   :BYTES 143948 :SHA256
   "f905e8239a994b58564c7830ce229d70b285d87a0258ff385ed6e2792cfd4732")
  (:PATH "processes/integrated-coverage-self-test/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715612-command-66194-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "a018fa6a8119a18fb845722b0cc351615484bfb1d6b164fd7ca97ffe63f559f4")
  (:PATH "processes/integrated-coverage-self-test/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715612-command-66194-0/report.lisp")
   :BYTES 147100 :SHA256
   "c19bab059bacf501b8948c5d6bf305aa73afb0312360d86ba8ed80c5a792a8b1")
  (:PATH "processes/integrated-full-check/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715612-command-66216-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "c3247ab11873ce12c590e4d2cb58b280ec6dd1d6bddb851a7f87fa55612e0c62")
  (:PATH "processes/integrated-full-check/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715612-command-66216-0/report.lisp")
   :BYTES 762460 :SHA256
   "d706e3d111a619570616d9bf13d099e348394f95fc2f5d1200e41a4e96a30d8c")
  (:PATH "raw/coverage-self-test-html/0339decd1e6b7006487f291345ed403f.html"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/integrated-coverage-self-test/0339decd1e6b7006487f291345ed403f.html")
   :BYTES 2852 :SHA256
   "a73204e86f474e7f81b57a225de30e4c99ae7340e42aedcbea36191001cb2f59")
  (:PATH "raw/coverage-self-test-html/cover-index.html" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/integrated-coverage-self-test/cover-index.html")
   :BYTES 1812 :SHA256
   "05f1c75de20ef057c70ce5885cba6e4cda4170f3813cfe3078dcb827fa1c4120")
  (:PATH "raw/coverage-self-test/coverage-fixture.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/integrated-coverage-self-test/coverage-fixture.lisp")
   :BYTES 147 :SHA256
   "3767518fde8bde1e1286dbf663e97eac01f02e038d7f3161df436d9fd3e92559")
  (:PATH "raw/helpers/final-manifest-builder.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/final-manifest-builder.lisp")
   :BYTES 3424 :SHA256
   "86e0eddcaf45e6514b22f55a9c36dda68043a09541a8e05d599ee058b3fe4950")
  (:PATH "raw/integrated-sources/arcdocdb.asd" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/integrated-sources/arcdocdb.asd")
   :BYTES 12547 :SHA256
   "178f2b3d448a2ddcd5063f10eea38aa252afcbf481ed55bd25b60ca86510124f")
  (:PATH
   "raw/integrated-sources/docs/implementazione/cbor-semplici-dati.md.txt"
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/integrated-sources/docs/implementazione/cbor-semplici-dati.md.txt")
   :BYTES 25867 :SHA256
   "1de9270223c29a1b6a839ee789aaf9cbbd0ba750511cba8e016c5dc2ff5872bc")
  (:PATH
   "raw/integrated-sources/docs/implementazione/cbor-semplici-verificatori.md.txt"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/integrated-sources/docs/implementazione/cbor-semplici-verificatori.md.txt")
   :BYTES 10791 :SHA256
   "cd2f98faa0a5637109db82f072704e7bb429cd89971f129586b307413b51ab91")
  (:PATH "raw/integrated-sources/src/codec/cbor-package.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/integrated-sources/src/codec/cbor-package.lisp")
   :BYTES 620 :SHA256
   "53fa9acbed8f5602b204252ff394c01fd01effdbe41baf021a713e2636cbd668")
  (:PATH "raw/integrated-sources/src/codec/cbor-simple-write.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/integrated-sources/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e")
  (:PATH "raw/integrated-sources/tests/codec/cbor-simple-write-support.lisp"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/integrated-sources/tests/codec/cbor-simple-write-support.lisp")
   :BYTES 4955 :SHA256
   "53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e")
  (:PATH "raw/integrated-sources/tests/codec/cbor-simple-write-threads.lisp"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/integrated-sources/tests/codec/cbor-simple-write-threads.lisp")
   :BYTES 3561 :SHA256
   "77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2")
  (:PATH "raw/integrated-sources/tests/codec/cbor-simple-write.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/integrated-sources/tests/codec/cbor-simple-write.lisp")
   :BYTES 10712 :SHA256
   "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a")
  (:PATH "raw/integrated-sources/tests/codec/cbor-string-write-support.lisp"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/integrated-sources/tests/codec/cbor-string-write-support.lisp")
   :BYTES 6868 :SHA256
   "2cbdb601f442a56456bc637c94e759cc965f44b178268dce3c636c385d34fc39")
  (:PATH "raw/integrated-sources/tests/codec/cbor-string-write-threads.lisp"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/integrated-sources/tests/codec/cbor-string-write-threads.lisp")
   :BYTES 3512 :SHA256
   "8e07b881a55e2554a429f1c8b2c69f67862ac015217d90d019167d636564d27d")
  (:PATH "raw/integrated-sources/tools/foundation-coverage.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/integrated-sources/tools/foundation-coverage.lisp")
   :BYTES 15107 :SHA256
   "fc466fd092673cf82c83de6e410e80c2e8787bc116b7ebc742471613b36087f9")
  (:PATH "raw/reader-self-test/completion-exit/isolated-build.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715639-reader-self-test-68231-0/completion-exit/isolated-build.lisp")
   :BYTES 197 :SHA256
   "1a45dcf8a6d03f1e8866e49280c6f0edb894320c90624d5620fad1e3d546cea9")
  (:PATH "raw/reader-self-test/completion-exit/stderr.log" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715639-reader-self-test-68231-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/reader-self-test/completion-exit/stdout.log" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715639-reader-self-test-68231-0/completion-exit/stdout.log")
   :BYTES 105 :SHA256
   "5e630c1b44d68ce71b27d151e76bf367e3cbd941200adc36cdd30e0fe7390531")
  (:PATH "raw/reader-self-test/report.lisp" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715639-reader-self-test-68231-0/report.lisp")
   :BYTES 1949 :SHA256
   "e6875c1f0aa2853a677020b9c39df184e77043df6a55a3f0964914bf796e0f85")
  (:PATH "raw/reader-self-test/signal/isolated-build.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715639-reader-self-test-68231-0/signal/isolated-build.lisp")
   :BYTES 247 :SHA256
   "ff5cf55dda241d32ea1b4308172c7dc526436cbf1d546e7471148cee95a873d1")
  (:PATH "raw/reader-self-test/signal/stderr.log" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715639-reader-self-test-68231-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/reader-self-test/signal/stdout.log" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715639-reader-self-test-68231-0/signal/stdout.log")
   :BYTES 126 :SHA256
   "3697c68fa71f124c8d05d8cc5d649a744586a10989eb2e67c5bdce6bfc760142")
  (:PATH "raw/readings/data-review-draft.md.txt" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/cbor-simple-write-20261011/data-review-draft.md.txt")
   :BYTES 25617 :SHA256
   "8624c02e1ed0862403ab6011979f87871264489aa161a033348df827d9a716fc")
  (:PATH "raw/snapshot-self-test/completion-exit/isolated-build.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715638-snapshot-self-test-68191-0/completion-exit/isolated-build.lisp")
   :BYTES 199 :SHA256
   "b8bb4416a818775bae5c77341eeec2c356a2733f633ac2bc8b6ac3ff955d05e0")
  (:PATH "raw/snapshot-self-test/completion-exit/stderr.log" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715638-snapshot-self-test-68191-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/snapshot-self-test/completion-exit/stdout.log" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715638-snapshot-self-test-68191-0/completion-exit/stdout.log")
   :BYTES 107 :SHA256
   "4f22544421d9012fe132a36bf15950cd327ca959b8f9c5ef3d386e0c8b62a25c")
  (:PATH "raw/snapshot-self-test/report.lisp" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715638-snapshot-self-test-68191-0/report.lisp")
   :BYTES 1967 :SHA256
   "36533b108a34de455d47773e99d39fce42f882aabffc9005e1ee261695c060b9")
  (:PATH "raw/snapshot-self-test/signal/isolated-build.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715638-snapshot-self-test-68191-0/signal/isolated-build.lisp")
   :BYTES 249 :SHA256
   "a345276e3dfe377c0bbd359793165915b1527938a65250d367ce5ac079feecc1")
  (:PATH "raw/snapshot-self-test/signal/stderr.log" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715638-snapshot-self-test-68191-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/snapshot-self-test/signal/stdout.log" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715638-snapshot-self-test-68191-0/signal/stdout.log")
   :BYTES 128 :SHA256
   "e3502e714a0530acb1f0130c4ced4a016607bcb067e3686f6f29704db8423ea5")
  (:PATH "raw/spikes/SPK-01.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715792-check-78683-0/SPK-01.lisp")
   :BYTES 27228 :SHA256
   "6ecd484881e6edc6f6585e7469c0bbd2c16f33da37c0fa2fd9b54367abad8808")
  (:PATH "raw/spikes/SPK-02.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715792-check-78683-0/SPK-02.lisp")
   :BYTES 1607 :SHA256
   "7f8ad3f3aa9d360c14a77b476c08092b4f50e51e85dd828c75aa7c8eda7244d1")
  (:PATH "raw/spikes/SPK-03.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715792-check-78683-0/SPK-03.lisp")
   :BYTES 3646 :SHA256
   "06266c28ab77b1d3fd170be6bdea85bb8012e2465623e925b076a147a6602736")
  (:PATH "raw/spikes/SPK-04.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715792-check-78683-0/SPK-04.lisp")
   :BYTES 6752 :SHA256
   "be3918c936b8f4f966d85acd54bf8d51618aa37113583cf17d133034f8d76b85")
  (:PATH "raw/spikes/SPK-05.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715792-check-78683-0/SPK-05.lisp")
   :BYTES 10171 :SHA256
   "06f565fbe86af3dd1758b8203b37cba0fb5f171b702d6afcd4ed0cfe31636ced")
  (:PATH "raw/spikes/SPK-06.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715792-check-78683-0/SPK-06.lisp")
   :BYTES 24124 :SHA256
   "f9df0539048b1f243ac889715dd94c17955fc902713fa46411eb4c3438d4ed99")
  (:PATH "raw/spikes/SPK-07.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715792-check-78683-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "b8654c2d6ca85908f381f719096acc21f8410d97a2e34ee3a306aae3f6e20c7d")
  (:PATH "raw/spikes/SPK-07.lisp.gz" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715792-check-78683-0/SPK-07.lisp.gz")
   :BYTES 410628 :SHA256
   "975aab8e47798b2c294e814d40159528f0d0e623734c7f4ee62c5f4e194898df")
  (:PATH "raw/spikes/SPK-08.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715792-check-78683-0/SPK-08.lisp")
   :BYTES 292333 :SHA256
   "96aaddf69757e2a4b1b9acbbf4547e61bbfc3f454e98f21cc6ab52beba89a050")
  (:PATH "raw/spikes/SPK-09.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715792-check-78683-0/SPK-09.lisp")
   :BYTES 2472 :SHA256
   "8d2ab482ea0f6b6896bb3dfbfae156000e3b63067fef6a9b67f3bd546ff4ead6")
  (:PATH "raw/spikes/SPK-10.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715792-check-78683-0/SPK-10.lisp")
   :BYTES 22977 :SHA256
   "84507e848eb5cbf747c7ba26cede7bf521a23190f26623f6c2ffffc6e7b8dd1a")
  (:PATH "raw/spikes/conservazione.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715792-check-78683-0/conservazione.lisp")
   :BYTES 2306 :SHA256
   "a387b7dd4bdb0c8176d8705f90b53ac13c40af6bf726741b20ab7cca7e9766d0")
  (:PATH "raw/spikes/report.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715792-check-78683-0/report.lisp")
   :BYTES 318 :SHA256
   "cee680f537ac933315a582e31d322156f567a1ab0aacba77643f8b70047fbf2e")
  (:PATH "raw/spikes/report.lisp.gz" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715792-check-78683-0/report.lisp.gz")
   :BYTES 467191 :SHA256
   "75e2a85a55a8d6156f857ec0dd87f84a834d16098a25fc992ebdd568ccc6f216")
  (:PATH "processes/final-collection/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715903-command-81003-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "801d0ce47d2b1d4da983fa93967fa26c562250a4618580880da81240c5758969")
  (:PATH "processes/final-collection/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715903-command-81003-0/report.lisp")
   :BYTES 147173 :SHA256
   "255bb22f445b04ccd31ab2a272c0e0899f673b1c764cd136a049ac8579caa789")
  (:PATH "processes/final-closed-audit/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715994-command-83069-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "903e1981e3b27aff4a78cdf3441681dfe124a169bd6532fe4a9f3c2875581a01")
  (:PATH "processes/final-closed-audit/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-simple-write/ArcDocDB/spikes/out/4000715994-command-83069-0/report.lisp")
   :BYTES 149678 :SHA256
   "52e4e7e3420425fcd7aa0b1ef55126465c3dc11dda0a293cc62a632244df60f8"))
 :LIMITS
 (:SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :FASL-EXCLUDED-FROM-PUBLISHED-MUTATION-TREES
  :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
