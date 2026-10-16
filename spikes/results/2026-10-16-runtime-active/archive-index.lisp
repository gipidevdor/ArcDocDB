(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "trace-initial" :RECORD-PATH "processes/trace-initial/report.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "make") #A((11) BASE-CHAR . "trace-write")
    #A((5) BASE-CHAR . "trace") #A((5) BASE-CHAR . "links"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "diagnostic-first" :RECORD-PATH
   "processes/diagnostic-first/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((29) BASE-CHAR . "tools/get-series-capture.lisp")
    #A((2) BASE-CHAR . "--") #A((4) BASE-CHAR . "sbcl")
    #A((10) BASE-CHAR . "--noinform") #A((13) BASE-CHAR . "--no-userinit")
    #A((12) BASE-CHAR . "--no-sysinit") #A((8) BASE-CHAR . "--script")
    #A((45) BASE-CHAR . "spikes/out/runtime-active-input/diagnose.lisp"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "coverage-self-test" :RECORD-PATH
   "processes/coverage-self-test/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((11) BASE-CHAR . "--self-test")
    #A((37) BASE-CHAR . "spikes/out/runtime-active-cover-self/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "diagnostic" :RECORD-PATH "processes/diagnostic/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((29) BASE-CHAR . "tools/get-series-capture.lisp")
    #A((2) BASE-CHAR . "--") #A((4) BASE-CHAR . "sbcl")
    #A((10) BASE-CHAR . "--noinform") #A((13) BASE-CHAR . "--no-userinit")
    #A((12) BASE-CHAR . "--no-sysinit") #A((8) BASE-CHAR . "--script")
    #A((45) BASE-CHAR . "spikes/out/runtime-active-input/diagnose.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "coverage-first" :RECORD-PATH "processes/coverage-first/report.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((8) BASE-CHAR . "--report")
    #A((32) BASE-CHAR . "spikes/out/runtime-active-cover/")
    #A((14) BASE-CHAR . "runtime-active"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "check-first" :RECORD-PATH "processes/check-first/report.lisp"
   :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "coverage" :RECORD-PATH "processes/coverage/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((8) BASE-CHAR . "--report")
    #A((38) BASE-CHAR . "spikes/out/runtime-active-cover-final/")
    #A((14) BASE-CHAR . "runtime-active"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "check" :RECORD-PATH "processes/check/report.lisp" :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-active-input/manifest.lisp")
   :BYTES 11834 :SHA256
   "aceb964ba238d00297ea69195cf92b1bb4339b651de3cd15417bc348963454b8")
  (:PATH "collection-source.lisp" :SOURCE
   #A((95) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH "coverage/first/3abb48d77752929d1c55efe7a5ac792f.html" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-active-cover/3abb48d77752929d1c55efe7a5ac792f.html")
   :BYTES 17554 :SHA256
   "20b490d2316dd6a77f8b5daeac00dacbef11afd0a1463027ac854ace9ea61dbc")
  (:PATH "coverage/first/50d716990ab106a83be0d3dc57599079.html" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-active-cover/50d716990ab106a83be0d3dc57599079.html")
   :BYTES 30465 :SHA256
   "e4cebaa5e716b10672aaed95567c4f789dd3600e834996f1b25d9ce06e468df6")
  (:PATH "coverage/first/b8c63d8cbeb0cb5d6fed3eb843867ad0.html" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-active-cover/b8c63d8cbeb0cb5d6fed3eb843867ad0.html")
   :BYTES 32299 :SHA256
   "6819760f52170844ffabca77a5972a4451b638494f654e37ef17fe3ce2409184")
  (:PATH "coverage/first/cover-index.html" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-active-cover/cover-index.html")
   :BYTES 2355 :SHA256
   "258843e6a619d2150a7038801363bb81ac28d9a00ad160c2ec5a9584e722f0ef")
  (:PATH "coverage/product/3abb48d77752929d1c55efe7a5ac792f.html" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-active-cover-final/3abb48d77752929d1c55efe7a5ac792f.html")
   :BYTES 17554 :SHA256
   "20b490d2316dd6a77f8b5daeac00dacbef11afd0a1463027ac854ace9ea61dbc")
  (:PATH "coverage/product/50d716990ab106a83be0d3dc57599079.html" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-active-cover-final/50d716990ab106a83be0d3dc57599079.html")
   :BYTES 30465 :SHA256
   "e4cebaa5e716b10672aaed95567c4f789dd3600e834996f1b25d9ce06e468df6")
  (:PATH "coverage/product/b8c63d8cbeb0cb5d6fed3eb843867ad0.html" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-active-cover-final/b8c63d8cbeb0cb5d6fed3eb843867ad0.html")
   :BYTES 32299 :SHA256
   "6819760f52170844ffabca77a5972a4451b638494f654e37ef17fe3ce2409184")
  (:PATH "coverage/product/cover-index.html" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-active-cover-final/cover-index.html")
   :BYTES 2355 :SHA256
   "258843e6a619d2150a7038801363bb81ac28d9a00ad160c2ec5a9584e722f0ef")
  (:PATH "coverage/self/c2c35e904a0f63bac08a49d0770ea43d.html" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-active-cover-self/c2c35e904a0f63bac08a49d0770ea43d.html")
   :BYTES 2817 :SHA256
   "70ac2afb667eb13e09721e0244ef0c59dd7d4e390cf1400c639991a5d7b98c49")
  (:PATH "coverage/self/cover-index.html" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-active-cover-self/cover-index.html")
   :BYTES 1777 :SHA256
   "e6a51906da6ed794dc3182280b130756545923af98d010566b4590a5028b4b09")
  (:PATH "coverage/self/coverage-fixture.lisp.txt" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-active-cover-self/coverage-fixture.lisp")
   :BYTES 147 :SHA256
   "3767518fde8bde1e1286dbf663e97eac01f02e038d7f3161df436d9fd3e92559")
  (:PATH "inputs/diagnose.lisp.txt" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-active-input/diagnose.lisp")
   :BYTES 1568 :SHA256
   "ce2c873697dc3bf0e6cd3bbb0a7861cfbc5944d67a031f514b1a3b4db5968400")
  (:PATH "inputs/method.md.txt" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-active-input/method.md.txt")
   :BYTES 7626 :SHA256
   "718ef1d722e972be3195c6b44830b734b3ac20856ca2f89479850740205b97f1")
  (:PATH "inputs/review.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-active-input/review.lisp.txt")
   :BYTES 1275 :SHA256
   "8f9f3fa05b0af2f4a3f77f1ea3a58858aa758a70996d766c2e90693bcdb402f6")
  (:PATH "processes/check-first/conservazione.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161245-command-519-0/conservazione.lisp")
   :BYTES 1713 :SHA256
   "6d7e08c31c831acdd6966947b951c5f674bded454867d4bcebb35f81d5f688cc")
  (:PATH "processes/check-first/report.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161245-command-519-0/report.lisp")
   :BYTES 317 :SHA256
   "210e6faf67a56f960695bb98b1182d44139c0efbae533ca2bd3c8dce2d5adcac")
  (:PATH "processes/check-first/report.lisp.gz" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161245-command-519-0/report.lisp.gz")
   :BYTES 182767 :SHA256
   "dbb86bcd5d7d0c0f8d500e9af5f6f8b43533e8c986e51d956a81b8a2ff156541")
  (:PATH "processes/check/conservazione.lisp" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161322-command-5473-0/conservazione.lisp")
   :BYTES 1717 :SHA256
   "bd721dc9273100c01e5307d2a4553d03d9f68069222c10e2608443972760e538")
  (:PATH "processes/check/report.lisp" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161322-command-5473-0/report.lisp")
   :BYTES 317 :SHA256
   "f64ed03c993cc8b154094df145f1493ec1f1477bbcbc53f4ffd9c284204a9cbd")
  (:PATH "processes/check/report.lisp.gz" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161322-command-5473-0/report.lisp.gz")
   :BYTES 234826 :SHA256
   "cc1c7363fd955f45fb8e992cfe7878a75932ffeb094dcd9fba09425b45f6a568")
  (:PATH "processes/coverage-first/conservazione.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161240-command-222-0/conservazione.lisp")
   :BYTES 1136 :SHA256
   "580f1a79d498df3ea3a0600950c8520492a396f435d7cf0fc98066c711a6b981")
  (:PATH "processes/coverage-first/report.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161240-command-222-0/report.lisp")
   :BYTES 237376 :SHA256
   "f4f32401132df076a27c65236e0ca3168037008e80697dd07fdf2c522277e0e6")
  (:PATH "processes/coverage-self-test/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161174-command-98439-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "955f8ec37f81b0f4d974858577e2e28b9835f64532c84742961488cfadd04600")
  (:PATH "processes/coverage-self-test/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161174-command-98439-0/report.lisp")
   :BYTES 225843 :SHA256
   "2cc7a72e9d6f8cf79acd8ab7b7966bf01146282dfd253e3be2882a62a3832677")
  (:PATH "processes/coverage/conservazione.lisp" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161324-command-5766-0/conservazione.lisp")
   :BYTES 1139 :SHA256
   "f8bc8eb8a3f41bae63311492cf589fceaf0139cb8c278952bb7e1ac0a8c8c56d")
  (:PATH "processes/coverage/report.lisp" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161324-command-5766-0/report.lisp")
   :BYTES 237388 :SHA256
   "3c73b9d098531532a769eb881a3fe3f499c6112342a290dddaf96ea8915f428f")
  (:PATH "processes/diagnostic-first/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161174-command-98440-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "83f76b5517497708bd60cac79334b4a0f43813c9328dbee2f4203a91a26ad0c7")
  (:PATH "processes/diagnostic-first/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161174-command-98440-0/report.lisp")
   :BYTES 258958 :SHA256
   "f755d8e5caf56ce63bb51ae3994baed5a5afc9eae1411a47a24ed597ef5848a1")
  (:PATH "processes/diagnostic/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161232-command-99920-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "6af174a0c15db2b006eb1f73e62adf9087a698a213e85b5a5d15e0e97df32cb0")
  (:PATH "processes/diagnostic/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161232-command-99920-0/report.lisp")
   :BYTES 255732 :SHA256
   "4f8d2493c57f363075159875424742b300cdd937ad0efdd094e50ce505ebcb4c")
  (:PATH "processes/trace-initial/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161153-command-97909-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "739dce89121f67cc6c1b1bdd234e5cebe0b1a82666db47303e70782a88f6cf3c")
  (:PATH "processes/trace-initial/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161153-command-97909-0/report.lisp")
   :BYTES 225913 :SHA256
   "b63c6f5456f23e48033e7c1756443c817fc4692b69e2b3353ad0c247194c120e")
  (:PATH "raw/evidence-parallel-self/report.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-QoQfbM/report.lisp")
   :BYTES 3368 :SHA256
   "23c6ce303cb3d1ffffbfd527a57772c46cc8e306b32b76a3bef9a6cd19172469")
  (:PATH "raw/reader-self/completion-exit/isolated-build.lisp.txt" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161422-reader-self-test-11681-0/completion-exit/isolated-build.lisp")
   :BYTES 197 :SHA256
   "1a45dcf8a6d03f1e8866e49280c6f0edb894320c90624d5620fad1e3d546cea9")
  (:PATH "raw/reader-self/completion-exit/stderr.log" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161422-reader-self-test-11681-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/reader-self/completion-exit/stdout.log" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161422-reader-self-test-11681-0/completion-exit/stdout.log")
   :BYTES 105 :SHA256
   "5e630c1b44d68ce71b27d151e76bf367e3cbd941200adc36cdd30e0fe7390531")
  (:PATH "raw/reader-self/report.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161422-reader-self-test-11681-0/report.lisp")
   :BYTES 1925 :SHA256
   "ed95b2ac1de4a7edc8818ae00e2ba28228ada98e5e29de6c810a3d00032646e5")
  (:PATH "raw/reader-self/signal/isolated-build.lisp.txt" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161422-reader-self-test-11681-0/signal/isolated-build.lisp")
   :BYTES 247 :SHA256
   "ff5cf55dda241d32ea1b4308172c7dc526436cbf1d546e7471148cee95a873d1")
  (:PATH "raw/reader-self/signal/stderr.log" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161422-reader-self-test-11681-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/reader-self/signal/stdout.log" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161422-reader-self-test-11681-0/signal/stdout.log")
   :BYTES 126 :SHA256
   "3697c68fa71f124c8d05d8cc5d649a744586a10989eb2e67c5bdce6bfc760142")
  (:PATH "raw/snapshot-self/completion-exit/isolated-build.lisp.txt" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161422-snapshot-self-test-11674-0/completion-exit/isolated-build.lisp")
   :BYTES 199 :SHA256
   "b8bb4416a818775bae5c77341eeec2c356a2733f633ac2bc8b6ac3ff955d05e0")
  (:PATH "raw/snapshot-self/completion-exit/stderr.log" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161422-snapshot-self-test-11674-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/snapshot-self/completion-exit/stdout.log" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161422-snapshot-self-test-11674-0/completion-exit/stdout.log")
   :BYTES 107 :SHA256
   "4f22544421d9012fe132a36bf15950cd327ca959b8f9c5ef3d386e0c8b62a25c")
  (:PATH "raw/snapshot-self/report.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161422-snapshot-self-test-11674-0/report.lisp")
   :BYTES 1943 :SHA256
   "8489fe5f13339187193ea2df414c969e97a10bdd69dc6ac0ad52ea00aa5a93b4")
  (:PATH "raw/snapshot-self/signal/isolated-build.lisp.txt" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161422-snapshot-self-test-11674-0/signal/isolated-build.lisp")
   :BYTES 249 :SHA256
   "a345276e3dfe377c0bbd359793165915b1527938a65250d367ce5ac079feecc1")
  (:PATH "raw/snapshot-self/signal/stderr.log" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161422-snapshot-self-test-11674-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/snapshot-self/signal/stdout.log" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161422-snapshot-self-test-11674-0/signal/stdout.log")
   :BYTES 128 :SHA256
   "e3502e714a0530acb1f0130c4ced4a016607bcb067e3686f6f29704db8423ea5")
  (:PATH "raw/spikes/SPK-01.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161815-check-21102-0/SPK-01.lisp")
   :BYTES 27228 :SHA256
   "b811739dc11cee4eb9db7093b44fa1dcbbdcabdbfb1881fa7000adb1abaec9ce")
  (:PATH "raw/spikes/SPK-02.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161815-check-21102-0/SPK-02.lisp")
   :BYTES 1607 :SHA256
   "90c904ab848d80fba829ce07ccf910c279b00d436486fb66e734d22370c79703")
  (:PATH "raw/spikes/SPK-03.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161815-check-21102-0/SPK-03.lisp")
   :BYTES 3638 :SHA256
   "593afd19639ad48d62c755c86216a45a63b7974d3cad3c9cc54c81149c9cd25f")
  (:PATH "raw/spikes/SPK-04.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161815-check-21102-0/SPK-04.lisp")
   :BYTES 6752 :SHA256
   "264a65f5f109f35dc7ed552ff86e7e17c74ab2db6b6b6d4da8bb46183837c017")
  (:PATH "raw/spikes/SPK-05.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161815-check-21102-0/SPK-05.lisp")
   :BYTES 10045 :SHA256
   "91aad95ac231562e2b6676bb5068fbe03cf8e7ecfbd72cb81d0f27f2d1b4a20b")
  (:PATH "raw/spikes/SPK-06.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161815-check-21102-0/SPK-06.lisp")
   :BYTES 23979 :SHA256
   "033d85b90d115559de969a07f707fb595278f53f55852f5a73c0a4f18b16d2f5")
  (:PATH "raw/spikes/SPK-07.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161815-check-21102-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "7c567d862e49da74ebed2a3dda2ecb424f400ebb10ddd067585ac8794fd00a72")
  (:PATH "raw/spikes/SPK-07.lisp.gz" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161815-check-21102-0/SPK-07.lisp.gz")
   :BYTES 410634 :SHA256
   "b29b5aa23d3c92f53e9ed73067ed1c89cfbfa881975da5c0820e3cb3bae44bab")
  (:PATH "raw/spikes/SPK-08.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161815-check-21102-0/SPK-08.lisp")
   :BYTES 291712 :SHA256
   "c86cc5a94341463474812ede24934701c70e13aa6b82369ab6385f31b3e2e393")
  (:PATH "raw/spikes/SPK-09.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161815-check-21102-0/SPK-09.lisp")
   :BYTES 2472 :SHA256
   "ccbc972d566ea7924ecd38129687a8ee7174fd8f10fbe793c7c1c08bfcbd85db")
  (:PATH "raw/spikes/SPK-10.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161815-check-21102-0/SPK-10.lisp")
   :BYTES 22977 :SHA256
   "d47f3e0365bb199a4d8f52ad8220036d20e3de7a83fd4d7e46147189fcbea967")
  (:PATH "raw/spikes/conservazione.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161815-check-21102-0/conservazione.lisp")
   :BYTES 2282 :SHA256
   "0fd5fad406cf9285e21dbd48c64d317bf238c6b582208c7cf88d47cb2f2a578e")
  (:PATH "raw/spikes/report.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161815-check-21102-0/report.lisp")
   :BYTES 318 :SHA256
   "aa1387da1193b1bf2b361ff23af3b8a2e6172ac6538523289a6e8f090fc1d0a9")
  (:PATH "raw/spikes/report.lisp.gz" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001161815-check-21102-0/report.lisp.gz")
   :BYTES 467014 :SHA256
   "542f212d081f5bcb2b06f71fa2d8b40c6bc371f8e12f3dc4709346802b0835e2")
  (:PATH "report.md" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-active-input/report.md.txt")
   :BYTES 5881 :SHA256
   "eeedf9578f86b34e8fd40fb0fb072885164bde037361752235e24323cfae2db1")
  (:PATH "summary.lisp" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-active-input/summary.lisp")
   :BYTES 2740 :SHA256
   "ba7c646f12a9544da462a022967325978b4a10e2db237f51ca7c674441beef42"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
