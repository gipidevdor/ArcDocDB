(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "trace-write" :RECORD-PATH "processes/trace-write/report.lisp"
   :COMMAND (#A((4) BASE-CHAR . "make") #A((11) BASE-CHAR . "trace-write"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "diagnostic" :RECORD-PATH "processes/diagnostic/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((29) BASE-CHAR . "tools/get-series-capture.lisp")
    #A((2) BASE-CHAR . "--") #A((4) BASE-CHAR . "sbcl")
    #A((10) BASE-CHAR . "--noinform") #A((13) BASE-CHAR . "--no-userinit")
    #A((12) BASE-CHAR . "--no-sysinit") #A((8) BASE-CHAR . "--script")
    #A((48) BASE-CHAR . "spikes/out/runtime-bootstrap-input/diagnose.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "coverage-self-test" :RECORD-PATH
   "processes/coverage-self-test/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((11) BASE-CHAR . "--self-test")
    #A((33) BASE-CHAR . "spikes/out/runtime-coverage-self/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "coverage" :RECORD-PATH "processes/coverage/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((8) BASE-CHAR . "--report")
    #A((28) BASE-CHAR . "spikes/out/runtime-coverage/")
    #A((7) BASE-CHAR . "runtime"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "check" :RECORD-PATH "processes/check/report.lisp" :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "collection-first" :RECORD-PATH
   "processes/collection-first/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "tools/collect-command-archive.lisp")
    #A((9) BASE-CHAR . "--collect")
    #A((48) BASE-CHAR . "spikes/out/runtime-bootstrap-input/manifest.lisp")
    #A((44) BASE-CHAR . "spikes/results/2026-10-16-runtime-bootstrap/")
    #A((14) BASE-CHAR . "--observations")
    #A((40) BASE-CHAR . "spikes/out/runtime-bootstrap-collection/")
    #A((6) BASE-CHAR . "--jobs") #A((1) BASE-CHAR . "4"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-bootstrap-input/manifest-final.lisp")
   :BYTES 224748 :SHA256
   "37b3bc8ccdca9d69c733bbb1d1c86faeef51d32fcd6280ac12beabf8572c34ef")
  (:PATH "collection-source.lisp" :SOURCE
   #A((95) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH "coverage/product/138b6c4d3b9cd4d6a29b1f0fbf450d03.html" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-coverage/138b6c4d3b9cd4d6a29b1f0fbf450d03.html")
   :BYTES 13992 :SHA256
   "9129bd8229964c815199d1c999b15f70bbc7ccc7feb653c898c376d084ef3e52")
  (:PATH "coverage/product/44fbdb70e4f6db617c6d0a8d48b7990b.html" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-coverage/44fbdb70e4f6db617c6d0a8d48b7990b.html")
   :BYTES 19343 :SHA256
   "fcc217fe630961eea7d150be6e69f4f4074bd7b1e7a97e4a84b066a0a53e9fb9")
  (:PATH "coverage/product/96de5536129adb186fd86595bc322c65.html" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-coverage/96de5536129adb186fd86595bc322c65.html")
   :BYTES 5381 :SHA256
   "e9dac4b8de4b2572cb4a407dfc35e9af90bfc008bce6232e54745100680c3a8c")
  (:PATH "coverage/product/c081badcf0b82a5e79e62ca54ddcacf3.html" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-coverage/c081badcf0b82a5e79e62ca54ddcacf3.html")
   :BYTES 13671 :SHA256
   "ac77f8752ecf3e034a476df2d739b0b367d85b10e3a64929bee1ef363a8dca68")
  (:PATH "coverage/product/cover-index.html" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-coverage/cover-index.html")
   :BYTES 2600 :SHA256
   "a82d8cdbb14d4b7bbdabdda4c438806c1cc9eb1cb4b211caf86c91fede72316e")
  (:PATH "coverage/product/dd38204d7d342e2ac8f5fa6d6bfa657e.html" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-coverage/dd38204d7d342e2ac8f5fa6d6bfa657e.html")
   :BYTES 11632 :SHA256
   "866d3dd15d40b3baf6304875cf490799d8b6195f42946d52977092095c60cfcf")
  (:PATH "coverage/self/6fa79f73f8abb7311ad0ca7f04e484fc.html" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-coverage-self/6fa79f73f8abb7311ad0ca7f04e484fc.html")
   :BYTES 2813 :SHA256
   "9398c1ad83d56bb427b8bb048a5cb63aa0d04c658c3ff8a20c14544bdef3cc29")
  (:PATH "coverage/self/cover-index.html" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-coverage-self/cover-index.html")
   :BYTES 1773 :SHA256
   "fc8db7ad8d943dbc4536b6fbad2a8b405bb8693f8e1dc3ce0926135a31af0c15")
  (:PATH "coverage/self/coverage-fixture.lisp.txt" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-coverage-self/coverage-fixture.lisp")
   :BYTES 147 :SHA256
   "3767518fde8bde1e1286dbf663e97eac01f02e038d7f3161df436d9fd3e92559")
  (:PATH "fixtures/reader/completion-exit/isolated-build.lisp.txt" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001158952-reader-self-test-38665-0/completion-exit/isolated-build.lisp")
   :BYTES 197 :SHA256
   "1a45dcf8a6d03f1e8866e49280c6f0edb894320c90624d5620fad1e3d546cea9")
  (:PATH "fixtures/reader/completion-exit/stderr.log" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001158952-reader-self-test-38665-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "fixtures/reader/completion-exit/stdout.log" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001158952-reader-self-test-38665-0/completion-exit/stdout.log")
   :BYTES 105 :SHA256
   "5e630c1b44d68ce71b27d151e76bf367e3cbd941200adc36cdd30e0fe7390531")
  (:PATH "fixtures/reader/report.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001158952-reader-self-test-38665-0/report.lisp")
   :BYTES 1925 :SHA256
   "fa05365a6ed22ed176460fddeba697cd8843ff148cb04decf4889210997de2c7")
  (:PATH "fixtures/reader/signal/isolated-build.lisp.txt" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001158952-reader-self-test-38665-0/signal/isolated-build.lisp")
   :BYTES 247 :SHA256
   "ff5cf55dda241d32ea1b4308172c7dc526436cbf1d546e7471148cee95a873d1")
  (:PATH "fixtures/reader/signal/stderr.log" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001158952-reader-self-test-38665-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "fixtures/reader/signal/stdout.log" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001158952-reader-self-test-38665-0/signal/stdout.log")
   :BYTES 126 :SHA256
   "3697c68fa71f124c8d05d8cc5d649a744586a10989eb2e67c5bdce6bfc760142")
  (:PATH "fixtures/snapshot/completion-exit/isolated-build.lisp.txt" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001158952-snapshot-self-test-38661-0/completion-exit/isolated-build.lisp")
   :BYTES 199 :SHA256
   "b8bb4416a818775bae5c77341eeec2c356a2733f633ac2bc8b6ac3ff955d05e0")
  (:PATH "fixtures/snapshot/completion-exit/stderr.log" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001158952-snapshot-self-test-38661-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "fixtures/snapshot/completion-exit/stdout.log" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001158952-snapshot-self-test-38661-0/completion-exit/stdout.log")
   :BYTES 107 :SHA256
   "4f22544421d9012fe132a36bf15950cd327ca959b8f9c5ef3d386e0c8b62a25c")
  (:PATH "fixtures/snapshot/report.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001158952-snapshot-self-test-38661-0/report.lisp")
   :BYTES 1943 :SHA256
   "479cc4c6d9869c0701dbff9675c646cc882131b2eefa70f4cab33be4f8694ec4")
  (:PATH "fixtures/snapshot/signal/isolated-build.lisp.txt" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001158952-snapshot-self-test-38661-0/signal/isolated-build.lisp")
   :BYTES 249 :SHA256
   "a345276e3dfe377c0bbd359793165915b1527938a65250d367ce5ac079feecc1")
  (:PATH "fixtures/snapshot/signal/stderr.log" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001158952-snapshot-self-test-38661-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "fixtures/snapshot/signal/stdout.log" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001158952-snapshot-self-test-38661-0/signal/stdout.log")
   :BYTES 128 :SHA256
   "e3502e714a0530acb1f0130c4ced4a016607bcb067e3686f6f29704db8423ea5")
  (:PATH "fixtures/spikes/SPK-01.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001159309-check-44161-0/SPK-01.lisp")
   :BYTES 27228 :SHA256
   "37baa369f5cd1aa227e0d5c6497d04958d38354735a315b7305f94ba14c27155")
  (:PATH "fixtures/spikes/SPK-02.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001159309-check-44161-0/SPK-02.lisp")
   :BYTES 1607 :SHA256
   "be46a4f737570478247608e94bdc7a9b2ef29bbf55a1ee796bb24918ff38fce0")
  (:PATH "fixtures/spikes/SPK-03.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001159309-check-44161-0/SPK-03.lisp")
   :BYTES 3638 :SHA256
   "f5ec5ed876d40e5d31d30e83da6996b9be6e9894e812e804b2cf312fea4c5490")
  (:PATH "fixtures/spikes/SPK-04.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001159309-check-44161-0/SPK-04.lisp")
   :BYTES 6752 :SHA256
   "7206cab545b32bc4aa6b9b1a9825dead5c264b9100584801863cece6bee88b24")
  (:PATH "fixtures/spikes/SPK-05.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001159309-check-44161-0/SPK-05.lisp")
   :BYTES 10172 :SHA256
   "c37e079bfb381b9d8ffaa3a25242fc211e82db2bbd85dc7ff5764c9e766d7a5a")
  (:PATH "fixtures/spikes/SPK-06.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001159309-check-44161-0/SPK-06.lisp")
   :BYTES 24090 :SHA256
   "fa124c53ac2899b7f8b02fbb2f48bef1b654e8a38ad7ce7e3ae0da5ab9948bd8")
  (:PATH "fixtures/spikes/SPK-07.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001159309-check-44161-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "21c23348be06bf35401fa2d652db2bd76b969e7685c37cc7021dbbb8bfd529e0")
  (:PATH "fixtures/spikes/SPK-07.lisp.gz" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001159309-check-44161-0/SPK-07.lisp.gz")
   :BYTES 410633 :SHA256
   "97368833a5e9a8474c374dae66d0cd383badcc1c84b27377ef0d17890cd3097d")
  (:PATH "fixtures/spikes/SPK-08.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001159309-check-44161-0/SPK-08.lisp")
   :BYTES 291711 :SHA256
   "cd070890d4a315bf7f7e148c762a5ec203a38a060c780463220e1a5e39327ed1")
  (:PATH "fixtures/spikes/SPK-09.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001159309-check-44161-0/SPK-09.lisp")
   :BYTES 2472 :SHA256
   "7955ee5d690ef84f5650ea751101d2ef6064919d245d3696ab8bd6d9185b8d01")
  (:PATH "fixtures/spikes/SPK-10.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001159309-check-44161-0/SPK-10.lisp")
   :BYTES 22975 :SHA256
   "75ac5762b556c4864e8856388d8fa1a4f77f38ec0b47bfa708e92381059360e1")
  (:PATH "fixtures/spikes/conservazione.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001159309-check-44161-0/conservazione.lisp")
   :BYTES 2284 :SHA256
   "10e046655cddab2406adbf9d2dee1f6784902ab7d04dd587b63857f5c4b694c6")
  (:PATH "fixtures/spikes/report.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001159309-check-44161-0/report.lisp")
   :BYTES 318 :SHA256
   "d91d6f2869794cb137ac3f0a0e462756b1f0c1ce3aa355d47c6bf6e5958464d0")
  (:PATH "fixtures/spikes/report.lisp.gz" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001159309-check-44161-0/report.lisp.gz")
   :BYTES 466839 :SHA256
   "47761de3a9498df6cd1656d14566371e8574a0dd43f4840eb1da489d529706bb")
  (:PATH "inputs/collection-first.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-bootstrap-collection/report.lisp")
   :BYTES 1038 :SHA256
   "41634b00105eaf1662bb50fc96259424934f66a3b4666d730825c08a80a9688f")
  (:PATH "inputs/diagnose.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-bootstrap-input/diagnose.lisp")
   :BYTES 1455 :SHA256
   "cde2474e0da59c26fb2d4a08a3c97c38a80f5f50b3e1995a5a173831ce18019f")
  (:PATH "inputs/manifest-first.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-bootstrap-input/manifest.lisp")
   :BYTES 337853 :SHA256
   "5d821976f767ac6a3a49fa75234709608842c27cb8b4bc8048206e84f86ddf28")
  (:PATH "inputs/method.md.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-bootstrap-input/method.md.txt")
   :BYTES 6374 :SHA256
   "6aadabc808404feae61e3d617615b980eda73e5a8c72b25ff5236606189da709")
  (:PATH "inputs/review.md.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-bootstrap-input/review.md.txt")
   :BYTES 3046 :SHA256
   "c275c9f6061d8e9baa4515c0c39285aaa1ba46797a50ec94786b5afa47442f6b")
  (:PATH "processes/check/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001158861-command-38214-0/conservazione.lisp")
   :BYTES 1721 :SHA256
   "6f8db01b5cb5fa33b015b7357a40be07d8be8522ddf5ba14a44c2157034ba7f9")
  (:PATH "processes/check/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001158861-command-38214-0/report.lisp")
   :BYTES 317 :SHA256
   "5f03582c533971a9353d6b919bfacad296e21686f897f36d68b96848d5eb1395")
  (:PATH "processes/check/report.lisp.gz" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001158861-command-38214-0/report.lisp.gz")
   :BYTES 233078 :SHA256
   "7eac1c872b9247b739b1fa62bfef33bb3ad219844e69ad15f3f7eb8aca6e7444")
  (:PATH "processes/collection-first/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001159506-command-46106-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "fb8eff07885cd4a7af62758a8f97a5796d352b878fd7ff56d7345d7baca2dbd3")
  (:PATH "processes/collection-first/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001159506-command-46106-0/report.lisp")
   :BYTES 225658 :SHA256
   "c0912a671562d1e3359a3dcbd3f8b9b573f90910656dd9b07522252dd97ca443")
  (:PATH "processes/coverage-self-test/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001158814-command-37642-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "19f0f318289e38827f8be73097de23664c60cfe63148c6a8b17f4da3b8e8b505")
  (:PATH "processes/coverage-self-test/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001158814-command-37642-0/report.lisp")
   :BYTES 225028 :SHA256
   "0514e3d4ad6f2cebd79bf4c49d1eee0abfc90284a115b0be70d6ab048c8f9cb3")
  (:PATH "processes/coverage/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001158861-command-38196-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "2d835e486296b3561ceb03400318f432d28dd557d20f69934f74bbb17af683d2")
  (:PATH "processes/coverage/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001158861-command-38196-0/report.lisp")
   :BYTES 227135 :SHA256
   "1325d0eace5d3b3bf9d5ee66cc6dea3cb93837690da6ce0292c81c1b28c1d371")
  (:PATH "processes/diagnostic/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001158814-command-37643-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "43b1e86e7450bc856cc96fabc329ccf490f31acd2ec4142d55ec9318574884bd")
  (:PATH "processes/diagnostic/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001158814-command-37643-0/report.lisp")
   :BYTES 231199 :SHA256
   "f704d0e623cac21c3fa127c28cad71fd2348a4d8e105da0e998fedbcfeea0c81")
  (:PATH "processes/trace-write/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001158793-command-37400-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "73716904a04aeb322a56512aa81fbfc30adb97b39ca21dda1b2de8358bc662b5")
  (:PATH "processes/trace-write/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/4001158793-command-37400-0/report.lisp")
   :BYTES 224864 :SHA256
   "10d954a3881c212641ae1671894d785c9f89c06003c8a3430f5d3387f3bc53a1")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-01-explicit-closed-parallel-history/case-result.lisp.txt"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-01-explicit-closed-parallel-history/case-result.lisp")
   :BYTES 450 :SHA256
   "fe63d1ae73f87373ff9043390548c2d4dca4333c55bc9e50bf165087b775dd74")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-01-explicit-closed-parallel-history/observations/closed-check.log"
   :SOURCE
   #A((185) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-01-explicit-closed-parallel-history/observations/closed-check.log")
   :BYTES 1536 :SHA256
   "12ca1ff9a295505cabead35d11dd440220f95cdc16e511c4ec201257085d80cd")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-01-explicit-closed-parallel-history/observations/report.lisp.txt"
   :SOURCE
   #A((180) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-01-explicit-closed-parallel-history/observations/report.lisp")
   :BYTES 7014 :SHA256
   "0880356655f3850d7d25ff01d816dfb09cd017b50fdb74d8a44aebe17c897142")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-02-schema-version/case-result.lisp.txt"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-02-schema-version/case-result.lisp")
   :BYTES 419 :SHA256
   "d1d9abee6781aa2aa52f2cce25c68b9e1c9c238c51f53693f281f993d5c357cd")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-02-schema-version/observations/report.lisp.txt"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-02-schema-version/observations/report.lisp")
   :BYTES 905 :SHA256
   "09a741d53b3c3eb13fb8e6eeeee5b857571b064291c526a93e5b78bfc21da71e")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-03-manifest-kind/case-result.lisp.txt"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-03-manifest-kind/case-result.lisp")
   :BYTES 417 :SHA256
   "6844195d481ade6cf7e1cf2478f28491a060e53b0dbec208f08743c8d6c05010")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-03-manifest-kind/observations/report.lisp.txt"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-03-manifest-kind/observations/report.lisp")
   :BYTES 903 :SHA256
   "cca875bf85b3d715cff76f03a3ccc81b2337a25b5b59315eb84c612c3c953be9")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-04-date-format/case-result.lisp.txt"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-04-date-format/case-result.lisp")
   :BYTES 413 :SHA256
   "fdfb4c24794bde6f65d584251b24a3059f5ce5801c30925e3da36b553bd5efbb")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-04-date-format/observations/report.lisp.txt"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-04-date-format/observations/report.lisp")
   :BYTES 899 :SHA256
   "0ea5e7748808fc1bddacac1c272ecdd79a89f27afab4b4f971a2364baab8b37f")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-05-unknown-trees/case-result.lisp.txt"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-05-unknown-trees/case-result.lisp")
   :BYTES 378 :SHA256
   "68259d4094b6be5727c7ba2549586b79d1a3059746b61cfa137b279cc1bb6c74")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-05-unknown-trees/observations/report.lisp.txt"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-05-unknown-trees/observations/report.lisp")
   :BYTES 866 :SHA256
   "97c4b4a4ab75fa440f5d75e7a14f22aef8915c65c99fbe055f18b9379fc7eedb")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-06-duplicate-manifest-key/case-result.lisp.txt"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-06-duplicate-manifest-key/case-result.lisp")
   :BYTES 403 :SHA256
   "6d5aa5581f3812d379fe6981155ccdc6bcf225839e1146fdace968fba70e87fd")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-06-duplicate-manifest-key/observations/report.lisp.txt"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-06-duplicate-manifest-key/observations/report.lisp")
   :BYTES 891 :SHA256
   "014f1d04db5ccadd1dfd852ad13235314734ed6e5019ef7d39edf290584aec28")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-07-relative-target/case-result.lisp.txt"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-07-relative-target/case-result.lisp")
   :BYTES 424 :SHA256
   "b5c54b46155446dbb611a06888afa43c2cb5575e151b7e796b0f49b6bd701d5f")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-07-relative-target/observations/report.lisp.txt"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-07-relative-target/observations/report.lisp")
   :BYTES 907 :SHA256
   "a6842d7caa2d5ecb853080046c0d0f6642dad7a2cbdeb809f6357ff36704a100")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-08-relative-target/case-result.lisp.txt"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-08-relative-target/case-result.lisp")
   :BYTES 424 :SHA256
   "006346ad319db34ad5436b4517831d4a46aa1fdfd967e21ddab102d10908f521")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-08-relative-target/observations/report.lisp.txt"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-08-relative-target/observations/report.lisp")
   :BYTES 907 :SHA256
   "a3c2e98a38903f477dd0bbc74ba962689a1a870f04c185dea6cb3856de08579d")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-09-relative-target/case-result.lisp.txt"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-09-relative-target/case-result.lisp")
   :BYTES 410 :SHA256
   "3a92d15f3ce4bf422cfa580a73a779ab6293c07ef8995d90b910dfc7cb61b232")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-09-relative-target/observations/report.lisp.txt"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-09-relative-target/observations/report.lisp")
   :BYTES 898 :SHA256
   "6d34221185e8704768e760050b5052a4593dad790d33b6c3b3f04677ecdf7e1a")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-10-relative-target/case-result.lisp.txt"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-10-relative-target/case-result.lisp")
   :BYTES 412 :SHA256
   "3c8c49acd9040b17ab47e25b70b97713c4b079c0fde41e4e52124d5387cb0416")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-10-relative-target/observations/report.lisp.txt"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-10-relative-target/observations/report.lisp")
   :BYTES 899 :SHA256
   "ef346b9c98e467767507e35ef3a13d1fc3ac219961d60b33f7f25464e94ba5a1")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-11-relative-target/case-result.lisp.txt"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-11-relative-target/case-result.lisp")
   :BYTES 413 :SHA256
   "23aac0caaa6cd9de7c01d3d25d97e2d88013857f4f4f5b5d02fd16866101caa7")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-11-relative-target/observations/report.lisp.txt"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-11-relative-target/observations/report.lisp")
   :BYTES 900 :SHA256
   "52f4a2a05f52d9598f745c1b70aeef670833608c893077bc7cfa427df368d4e1")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-12-relative-target/case-result.lisp.txt"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-12-relative-target/case-result.lisp")
   :BYTES 393 :SHA256
   "912e7eb4e20bee2d917c74b0bd4c3b73aa7d7639fa3df0d01b232668f12a0ba2")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-12-relative-target/observations/report.lisp.txt"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-12-relative-target/observations/report.lisp")
   :BYTES 880 :SHA256
   "3c5d8f9f72334b5abde2637ab13547f478ec240cfeac734d21c69c86cedf34d0")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-13-reserved-target/case-result.lisp.txt"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-13-reserved-target/case-result.lisp")
   :BYTES 403 :SHA256
   "302124abd2810c8d8f8b9ad630b4a4bd1b7256df0d07700bca031aff5b268be9")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-13-reserved-target/observations/report.lisp.txt"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-13-reserved-target/observations/report.lisp")
   :BYTES 890 :SHA256
   "fe42826e0aaa9bdee502385294073bfdcf0a600114c32b96c4dc6812d4c452c6")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-14-reserved-target/case-result.lisp.txt"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-14-reserved-target/case-result.lisp")
   :BYTES 398 :SHA256
   "87f33ff45a37c82e70c9fd1ebe796df9967fb1955fd783b6b2ccf94deba85d4c")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-14-reserved-target/observations/report.lisp.txt"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-14-reserved-target/observations/report.lisp")
   :BYTES 885 :SHA256
   "b12431a01d9b1c329f305be11ac9d989adf1a80416b61c46827aa01620f67bde")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-15-reserved-target/case-result.lisp.txt"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-15-reserved-target/case-result.lisp")
   :BYTES 409 :SHA256
   "ab3b0afbdb5cd004629b3bc6579f5f797d28e16833f08a379a9ee068d16c43a8")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-15-reserved-target/observations/report.lisp.txt"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-15-reserved-target/observations/report.lisp")
   :BYTES 896 :SHA256
   "f2a8da445873300a0f3a9d12c04753fd1e60ce0b5c6f68c5ab69bf546b165af7")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-16-reserved-target/case-result.lisp.txt"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-16-reserved-target/case-result.lisp")
   :BYTES 407 :SHA256
   "03069c341967997a9dd236059dfebcb94c0f9414dc320b81422725a75c7b0c28")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-16-reserved-target/observations/report.lisp.txt"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-16-reserved-target/observations/report.lisp")
   :BYTES 894 :SHA256
   "f30c82e3d0011860e6ab1019a74b430fc28d19660dd9fb8a8190a88e7e617235")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-17-duplicate-target/case-result.lisp.txt"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-17-duplicate-target/case-result.lisp")
   :BYTES 396 :SHA256
   "96d4d597260f13b6913efbf7fd90cd7e1221b3c0efd101702fcb478e605426d2")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-17-duplicate-target/observations/report.lisp.txt"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-17-duplicate-target/observations/report.lisp")
   :BYTES 883 :SHA256
   "3f1072aa8d861d15b3d205508f1290e7b01ddc3e71d47a3297963bbc3a03351c")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-18-file-directory-collision/case-result.lisp.txt"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-18-file-directory-collision/case-result.lisp")
   :BYTES 421 :SHA256
   "3c62e8480a7d9c101e71783c528e12368818c41ce286aeda800f89464d6fc421")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-18-file-directory-collision/observations/report.lisp.txt"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-18-file-directory-collision/observations/report.lisp")
   :BYTES 908 :SHA256
   "0ddf750728ae6144797a0c27fea60e52c711d65473e807a6d8163f9c0a0fd113")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-19-unknown-file-field/case-result.lisp.txt"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-19-unknown-file-field/case-result.lisp")
   :BYTES 392 :SHA256
   "0560ec9a30233d13572efc605d45d684746eac66a8861933b028b85cd9eb8c70")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-19-unknown-file-field/observations/report.lisp.txt"
   :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-19-unknown-file-field/observations/report.lisp")
   :BYTES 879 :SHA256
   "b63cb1e95a5018fb6e8827a0df5ab23c9c36acf22b23a0145c8b48e157057c57")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-20-unknown-process-field/case-result.lisp.txt"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-20-unknown-process-field/case-result.lisp")
   :BYTES 396 :SHA256
   "628995b6c71da252cee0f22c46736f49e971fbb3ea6f99e2b7e99e24ae07e991")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-20-unknown-process-field/observations/report.lisp.txt"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-20-unknown-process-field/observations/report.lisp")
   :BYTES 883 :SHA256
   "54c0d5233f75236a29481cf51a16ee46784513bd84fc704d251d0c37348f27b3")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-21-invalid-process-label/case-result.lisp.txt"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-21-invalid-process-label/case-result.lisp")
   :BYTES 407 :SHA256
   "2ddd2085a617a13c8fe3e49ce122194f42bf8d893627434c8425484121da62b9")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-21-invalid-process-label/observations/report.lisp.txt"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-21-invalid-process-label/observations/report.lisp")
   :BYTES 894 :SHA256
   "cb7bd5dbce0cf48ce404512fccbec0af9305b3ffc88e1248c79065eaa2a1cfd2")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-22-invalid-process-label/case-result.lisp.txt"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-22-invalid-process-label/case-result.lisp")
   :BYTES 401 :SHA256
   "56969a3241b95b488d435a38ca09c26fbe75ce127b130c25e09fa9d6ccf03d8e")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-22-invalid-process-label/observations/report.lisp.txt"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-22-invalid-process-label/observations/report.lisp")
   :BYTES 888 :SHA256
   "deefd185fe3d5f01a187ca327e667cb1e785a77c5b0972a265a5da4c34ea57f6")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-23-duplicate-process-label/case-result.lisp.txt"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-23-duplicate-process-label/case-result.lisp")
   :BYTES 411 :SHA256
   "7c44778f92808991a96f9734d55c69e47c7e7cf27752f2f65a83f9e79d8ec5cc")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-23-duplicate-process-label/observations/report.lisp.txt"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-23-duplicate-process-label/observations/report.lisp")
   :BYTES 898 :SHA256
   "719db088c82e101ca7f80c8ce58d46f72d007308866cc17d0b659bb02f470f43")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-24-record-not-in-files/case-result.lisp.txt"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-24-record-not-in-files/case-result.lisp")
   :BYTES 423 :SHA256
   "bfb63b02d0e703d27cd9c5e06aedeacbdc9ee615d8ad649fbbe35a954e80f9e4")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-24-record-not-in-files/observations/report.lisp.txt"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-24-record-not-in-files/observations/report.lisp")
   :BYTES 910 :SHA256
   "872440972cb265462fe6a8ec29ad720ce8117adc6d16d764642c35171fd5a481")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-25-duplicate-process-record/case-result.lisp.txt"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-25-duplicate-process-record/case-result.lisp")
   :BYTES 426 :SHA256
   "3ac3c4ed5f8dfe0bc98cc64ba7d2a9f8246230bae0729cdfde1b7a9702d4560f")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-25-duplicate-process-record/observations/report.lisp.txt"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-25-duplicate-process-record/observations/report.lisp")
   :BYTES 913 :SHA256
   "2711230d9590d3a3d0614a4970ac01a0068a5270e59771da5edab17f89f4b655")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-26-wrong-record-kind/case-result.lisp.txt"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-26-wrong-record-kind/case-result.lisp")
   :BYTES 416 :SHA256
   "b0e09ae3e214fd9908aeb8cadba6fe950a5c176ceaa3ba43bf48370de608c9ad")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-26-wrong-record-kind/observations/report.lisp.txt"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-26-wrong-record-kind/observations/report.lisp")
   :BYTES 903 :SHA256
   "4e0209407ff21d016d18974942537344ab65350706a1714f154dad4ceec88c01")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-27-nonterminal-record/case-result.lisp.txt"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-27-nonterminal-record/case-result.lisp")
   :BYTES 427 :SHA256
   "6e04b424c6734d4d446d5a7b9ebfacd476fc06ebc364aacc6d08b640245c7f65")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-27-nonterminal-record/observations/report.lisp.txt"
   :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-27-nonterminal-record/observations/report.lisp")
   :BYTES 912 :SHA256
   "6b1ae72dc20514f90ee99803c6eb597a9db494fa38c7edfe84a1e4b68a5b511e")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-28-nonterminal-record/case-result.lisp.txt"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-28-nonterminal-record/case-result.lisp")
   :BYTES 427 :SHA256
   "3dd9f7868109f863b4a0687d813be0b2070a0765f70357f80fe9ad43ca7da556")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-28-nonterminal-record/observations/report.lisp.txt"
   :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-28-nonterminal-record/observations/report.lisp")
   :BYTES 912 :SHA256
   "ba963aa4caedb5314abf29e4ab244bad016b66491f201bc5edf7671ee8f03dee")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-29-unfinished-record/case-result.lisp.txt"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-29-unfinished-record/case-result.lisp")
   :BYTES 425 :SHA256
   "e103eb7f84208fc03df512a655440dba122394f5637ec990668ded35be666519")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-29-unfinished-record/observations/report.lisp.txt"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-29-unfinished-record/observations/report.lisp")
   :BYTES 910 :SHA256
   "e12a91be916207ee9187e5cd6f91733d963ca212fe0cb1d9d5d3b8ffc1227b0f")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-30-invalid-record-metadata/case-result.lisp.txt"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-30-invalid-record-metadata/case-result.lisp")
   :BYTES 449 :SHA256
   "b70b8b3a275978fec12d714c0ef8c10a47e50e966582395f4ac424d7daa5ab9f")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-30-invalid-record-metadata/observations/report.lisp.txt"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-30-invalid-record-metadata/observations/report.lisp")
   :BYTES 929 :SHA256
   "ebec8adc4fa675ceb5070ce83c003dc5577353b154eb943b6ede0248fccc65b8")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-31-ok-with-failing-exit/case-result.lisp.txt"
   :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-31-ok-with-failing-exit/case-result.lisp")
   :BYTES 405 :SHA256
   "f8fba8fdc5f712e98692e44dc7df2b576b84a0b37aef2d00276a7c763fd23de9")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-31-ok-with-failing-exit/observations/report.lisp.txt"
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-31-ok-with-failing-exit/observations/report.lisp")
   :BYTES 892 :SHA256
   "52e7f264e43906c7ceb7e79667722fa8e25b613c293e2b1be5fd9619e9a33d94")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-32-ok-with-changed-source/case-result.lisp.txt"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-32-ok-with-changed-source/case-result.lisp")
   :BYTES 409 :SHA256
   "24e0eda5b6c616824bb4c96839fd79815f0051d6091ad9f707c9eaa7648b2986")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-32-ok-with-changed-source/observations/report.lisp.txt"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-32-ok-with-changed-source/observations/report.lisp")
   :BYTES 896 :SHA256
   "a74234773c38a578ca8026af259bad5280bd2cb34c2173aad4d9e0c7ba9692a5")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-33-explicit-gzip-payload-required/case-result.lisp.txt"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-33-explicit-gzip-payload-required/case-result.lisp")
   :BYTES 700 :SHA256
   "4033cbbfdc590c9b855a2817970b3aa299d5072bd85078e791c440a33453dfed")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-33-explicit-gzip-payload-required/observations/report.lisp.txt"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-33-explicit-gzip-payload-required/observations/report.lisp")
   :BYTES 1182 :SHA256
   "a25954f524e7748d9c79a4e59b1888b52d552084b7f4fdd6838a7e4f56867cbf")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-34-accessory-descriptor-also-needs-explicit-payload/case-result.lisp.txt"
   :SOURCE
   #A((188) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-34-accessory-descriptor-also-needs-explicit-payload/case-result.lisp")
   :BYTES 754 :SHA256
   "35280bee7e7052ba0cbd0786bd9e82900e1d61cb400d64a271c691b7a225c4a9")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-34-accessory-descriptor-also-needs-explicit-payload/observations/report.lisp.txt"
   :SOURCE
   #A((196) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-34-accessory-descriptor-also-needs-explicit-payload/observations/report.lisp")
   :BYTES 1236 :SHA256
   "e2f0841e9155228eed21cc38df86b0b7e7a952d395864a4406de95c9a40dd9cc")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-35-accessory-compressed-record-retained-with-payload/case-result.lisp.txt"
   :SOURCE
   #A((189) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-35-accessory-compressed-record-retained-with-payload/case-result.lisp")
   :BYTES 376 :SHA256
   "ad88be9e523d572f6fd4ee305357ca37923bc05ae311580d77f9fbfa232959e6")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-35-accessory-compressed-record-retained-with-payload/observations/closed-check.log"
   :SOURCE
   #A((202) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-35-accessory-compressed-record-retained-with-payload/observations/closed-check.log")
   :BYTES 1363 :SHA256
   "43558a9c79458d1f31bfd83e0e7a2fe467c7a0e5eb9fc3b7b7a0102e666fae60")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-35-accessory-compressed-record-retained-with-payload/observations/report.lisp.txt"
   :SOURCE
   #A((197) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-35-accessory-compressed-record-retained-with-payload/observations/report.lisp")
   :BYTES 6832 :SHA256
   "33744053d58656f15e265892f45c8534a39b2deaaf61bd9141b6b736ba377c59")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-36-gzip-target-must-match-descriptor/case-result.lisp.txt"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-36-gzip-target-must-match-descriptor/case-result.lisp")
   :BYTES 709 :SHA256
   "241842e0181f24b61c9dae2496b9fd8a852e2e6e03e8aa53f9acc389b1ed4956")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-36-gzip-target-must-match-descriptor/observations/report.lisp.txt"
   :SOURCE
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-36-gzip-target-must-match-descriptor/observations/report.lisp")
   :BYTES 1191 :SHA256
   "52ac8a4014c4aa36c7ca3253613d888af6997bb7c85bd42af17fbe37b25a475a")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-37-descriptor-hash-mismatch/case-result.lisp.txt"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-37-descriptor-hash-mismatch/case-result.lisp")
   :BYTES 821 :SHA256
   "0adff808d845c17404e35a2291277e434e1bc9bfd9af9ce46c9238bc02135c17")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-37-descriptor-hash-mismatch/observations/report.lisp.txt"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-37-descriptor-hash-mismatch/observations/report.lisp")
   :BYTES 1303 :SHA256
   "27a8c80a6a096899a6bafa98cf2f83f3b95e76c9cde1b34e8e4209efdf91a6b6")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-38-source-leaf-symlink/case-result.lisp.txt"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-38-source-leaf-symlink/case-result.lisp")
   :BYTES 597 :SHA256
   "51ba062176f007eab0476a088e7c7515a43d06e22b7ecc6ed5c922863c68bb7c")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-38-source-leaf-symlink/observations/report.lisp.txt"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-38-source-leaf-symlink/observations/report.lisp")
   :BYTES 1077 :SHA256
   "2c6915f7568cfb79b78913ce243099ec45e8396b9d2bfe488358278e95adc756")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-39-plain-budget-exact-boundary/case-result.lisp.txt"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-39-plain-budget-exact-boundary/case-result.lisp")
   :BYTES 336 :SHA256
   "0a076d39e6d236fd316d4005a2ff80f8dbad68ab68049d7f022c43be5ead8730")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-39-plain-budget-exact-boundary/observations/closed-check.log"
   :SOURCE
   #A((180) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-39-plain-budget-exact-boundary/observations/closed-check.log")
   :BYTES 1533 :SHA256
   "6e0cacb6fd8c0104b1e9b937331a2f57ed3c0b05e017dc69763a677953bc7dca")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-39-plain-budget-exact-boundary/observations/report.lisp.txt"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-39-plain-budget-exact-boundary/observations/report.lisp")
   :BYTES 6962 :SHA256
   "cb68b75df3203173a266e5588631c1fa88247602f76774f919a0da5d2fed55eb")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-40-gzip-budget-exact-boundary/case-result.lisp.txt"
   :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-40-gzip-budget-exact-boundary/case-result.lisp")
   :BYTES 333 :SHA256
   "77a20007e8422a008959afe5765e0876e665d56bb2eb6d86a98026f4f1ea79db")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-40-gzip-budget-exact-boundary/observations/closed-check.log"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-40-gzip-budget-exact-boundary/observations/closed-check.log")
   :BYTES 1532 :SHA256
   "0d0f58e82eba6221bc9903032309bfd254baa8c7e9aee29494024280d5013e1d")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-40-gzip-budget-exact-boundary/observations/report.lisp.txt"
   :SOURCE
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-40-gzip-budget-exact-boundary/observations/report.lisp")
   :BYTES 6949 :SHA256
   "6f83c00ab0ae6d41315b6e8adbedec45f6c10925f26f66bf7dc455897cbe8f98")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-41-plain-budget-over/case-result.lisp.txt"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-41-plain-budget-over/case-result.lisp")
   :BYTES 407 :SHA256
   "ec2f4c90b4b8bef3126fd00fecefaca94716047c31b127fead0f81e7935c4626")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-41-plain-budget-over/observations/report.lisp.txt"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-41-plain-budget-over/observations/report.lisp")
   :BYTES 894 :SHA256
   "9a81e40035dc0cd070129f1d8bae45aab1726e2efd0d0de80e955b66853cd38e")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-42-gzip-budget-over/case-result.lisp.txt"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-42-gzip-budget-over/case-result.lisp")
   :BYTES 404 :SHA256
   "6868ca6b16738455f22bb8a6f55c253b08267aedc334290c2255984aeb05a64b")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-42-gzip-budget-over/observations/report.lisp.txt"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-42-gzip-budget-over/observations/report.lisp")
   :BYTES 891 :SHA256
   "b20a5540c81f635e8b5a08f4507bf92649ea9771ef6a12ca7dcd18770f87fe14")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-43-existing-destination-never-overwritten/case-result.lisp.txt"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-43-existing-destination-never-overwritten/case-result.lisp")
   :BYTES 603 :SHA256
   "957636aea350dddfc3c6754a73bb4ec333bd87a054dc33016498a7201b365cd8")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-43-existing-destination-never-overwritten/observations/report.lisp.txt"
   :SOURCE
   #A((186) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-43-existing-destination-never-overwritten/observations/report.lisp")
   :BYTES 1083 :SHA256
   "9433cdf1cf6ba02543fdb324c613385a3309f515d56b65e61e10418315f5f787")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-44-existing-observations-never-overwritten/case-result.lisp.txt"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-44-existing-observations-never-overwritten/case-result.lisp")
   :BYTES 613 :SHA256
   "b0b65faadb0f628f54620c7966d62a57ff93214679ecaa721379c7cd51d629b3")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-45-destination-observations-overlap/case-result.lisp.txt"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-45-destination-observations-overlap/case-result.lisp")
   :BYTES 456 :SHA256
   "fc0f2d07687d452e5fd400a299bf713cd0ebc9f67366b5518132db20aec37e48")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-46-destination-observations-overlap/case-result.lisp.txt"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-46-destination-observations-overlap/case-result.lisp")
   :BYTES 456 :SHA256
   "fc2d0c9e87c39a2fdc51eb2144e5efac7c1f57304f2fcf9f4aeb17468ef05d3a")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-47-destination-observations-overlap/case-result.lisp.txt"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-47-destination-observations-overlap/case-result.lisp")
   :BYTES 456 :SHA256
   "02d729a764457daa6bf2b461399142d50d06e6bd4f011c27b5cf0aac754c2a80")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-48-corrupt-copy-retains-failure/case-result.lisp.txt"
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-48-corrupt-copy-retains-failure/case-result.lisp")
   :BYTES 567 :SHA256
   "5cbc64a626fefa566ce64d0270e87a3f0757a380750c9851a136bb1e39bd5026")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-48-corrupt-copy-retains-failure/observations/report.lisp.txt"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-48-corrupt-copy-retains-failure/observations/report.lisp")
   :BYTES 5280 :SHA256
   "fc54ffee5f9d233c8f66e92a56a37661b6b14cc3198284304550448f45b1551c")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-49-source-change-retains-failure/case-result.lisp.txt"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-49-source-change-retains-failure/case-result.lisp")
   :BYTES 573 :SHA256
   "63480f4d94ea82e0e2856c5617b2664d9e834ff1f8af65bc3af924fbb15ba2ce")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-49-source-change-retains-failure/observations/report.lisp.txt"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-49-source-change-retains-failure/observations/report.lisp")
   :BYTES 5295 :SHA256
   "7b084f2a81230eafa361b4e06f8411a8c76992e2c68f07f086ae3a8b82fca797")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-50-unindexed-extra-rejected-by-final-checker/case-result.lisp.txt"
   :SOURCE
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-50-unindexed-extra-rejected-by-final-checker/case-result.lisp")
   :BYTES 939 :SHA256
   "4c840f8df9f0f72dfd81f1dae25345f2fe03e73e3cda818031d6af7166cc8771")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-50-unindexed-extra-rejected-by-final-checker/observations/closed-check.log"
   :SOURCE
   #A((194) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-50-unindexed-extra-rejected-by-final-checker/observations/closed-check.log")
   :BYTES 161 :SHA256
   "36c547965bf7e5fb5aac2991d98c4e6f27d0783eb616501721e8f35c9202c18e")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-50-unindexed-extra-rejected-by-final-checker/observations/report.lisp.txt"
   :SOURCE
   #A((189) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-50-unindexed-extra-rejected-by-final-checker/observations/report.lisp")
   :BYTES 5558 :SHA256
   "01d2c0bcd770e41120509f3d4c34f766225ac7f45d010b8a5716658403314ea5")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-51-manifest-read-eval-disabled/case-result.lisp.txt"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-51-manifest-read-eval-disabled/case-result.lisp")
   :BYTES 744 :SHA256
   "a2bd1dfc1de805edaa31bb5eb4e707307e6cabfe30fea02fb3161813462b7e7c")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-51-manifest-read-eval-disabled/observations/report.lisp.txt"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-51-manifest-read-eval-disabled/observations/report.lisp")
   :BYTES 1231 :SHA256
   "039566038b1e9c332ca267a088acbe5ffc9d9e673bfbd1fe4442471d9217f2db")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-52-manifest-eof-required/case-result.lisp.txt"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-52-manifest-eof-required/case-result.lisp")
   :BYTES 387 :SHA256
   "79368a956e7289ac24e00f19e84b9be0e4cc9522a3a99019d2faf6840d7698d1")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-52-manifest-eof-required/observations/report.lisp.txt"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-52-manifest-eof-required/observations/report.lisp")
   :BYTES 870 :SHA256
   "95b473a19a1f68f6dd53f846c2a0a999b17226ffb972a599fd737754eb18a061")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-53-record-read-eval-disabled/case-result.lisp.txt"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-53-record-read-eval-disabled/case-result.lisp")
   :BYTES 733 :SHA256
   "25a9865cb36e13fe035e5b75667eae967ebda16f30fae0c8c097db35f1cc9bcd")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-53-record-read-eval-disabled/observations/report.lisp.txt"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-53-record-read-eval-disabled/observations/report.lisp")
   :BYTES 1220 :SHA256
   "d86a509da9151f0d3519b1598207146a6ce858e12387e9b3f6c50fb8ebfb57f3")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-54-record-eof-required/case-result.lisp.txt"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-54-record-eof-required/case-result.lisp")
   :BYTES 383 :SHA256
   "d2c307ba5bfd12f5839916fa18fc7c67f1eef9e8b830f36e67e8e1f8fc47a298")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-54-record-eof-required/observations/report.lisp.txt"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-54-record-eof-required/observations/report.lisp")
   :BYTES 866 :SHA256
   "06945c2b148040c3683bea22d8d7af5eb0ab13bc3f743b42dbb877e001fdd86c")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-55-cli-arguments/case-result.lisp.txt"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-55-cli-arguments/case-result.lisp")
   :BYTES 256 :SHA256
   "709b3a5dee6d7ed7ca16540b720941a9baae4a795d45f9c1e6f49a1375493441")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-56-cli-arguments/case-result.lisp.txt"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-56-cli-arguments/case-result.lisp")
   :BYTES 256 :SHA256
   "f903607105150a4e9919016c11195b810bff58db969c4006d95044fa2b37dd21")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-57-cli-arguments/case-result.lisp.txt"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-57-cli-arguments/case-result.lisp")
   :BYTES 256 :SHA256
   "cf74ff2a246bd6ed077445ed44889a575ccd1b787355e257a92ddf81d57df12d")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-58-cli-arguments/case-result.lisp.txt"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-58-cli-arguments/case-result.lisp")
   :BYTES 256 :SHA256
   "c07619e3e32e70f0c53fd54ff396e4ada25b948cfcdc9fb449a25aaeeb15b960")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/case-59-cli-arguments/case-result.lisp.txt"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/case-59-cli-arguments/case-result.lisp")
   :BYTES 256 :SHA256
   "95cc965e3f79b2fec491ece6f42abb1f98168e05438e951678d72579c69596a1")
  (:PATH
   "raw/command-archive-collector-self-test-dV9Snx/self-test-report.lisp.txt"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/command-archive-collector-self-test-dV9Snx/self-test-report.lisp")
   :BYTES 27828 :SHA256
   "e04fde3b9929708cdc7f2ca8037b80f4c77d7b35f0287f5071b01007b75683e7")
  (:PATH "raw/evidence-check-yBEaQa/0/scan-10.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/0/scan-10.lisp")
   :BYTES 370 :SHA256
   "18f93adda744266880386f16c5e4d3472c8dd9d46e69edcdd3d9d5b7926e5c53")
  (:PATH "raw/evidence-check-yBEaQa/0/scan-10.stderr.log" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/0/scan-10.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/0/scan-10.stdout.log" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/0/scan-10.stdout.log")
   :BYTES 4308 :SHA256
   "24e469734d6bf4ead25d79753566bd3b7dc975676088db37a223c2329adaf812")
  (:PATH "raw/evidence-check-yBEaQa/0/stderr.log" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/0/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/0/stdout.lisp.txt" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/0/stdout.lisp")
   :BYTES 212 :SHA256
   "8a025a8523d2ef6458f38108a6cc8aba067d677fc35c3f0181afa178c86a74e7")
  (:PATH "raw/evidence-check-yBEaQa/1/scan-1.lisp.txt" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/1/scan-1.lisp")
   :BYTES 368 :SHA256
   "10b244e0cc4df1da4e925889e28032487909b8020656f4bccec7f1bb47c1099f")
  (:PATH "raw/evidence-check-yBEaQa/1/scan-1.stderr.log" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/1/scan-1.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/1/scan-1.stdout.log" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/1/scan-1.stdout.log")
   :BYTES 4296 :SHA256
   "ec7d7bcf4c6b3d63a09a00f1abace956262a31447ac1310bc0d03152b0765e5d")
  (:PATH "raw/evidence-check-yBEaQa/1/stderr.log" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/1/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/1/stdout.lisp.txt" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/1/stdout.lisp")
   :BYTES 206 :SHA256
   "33e7a06c98bdf4354159a071752d5a441a16864df27f87c8928eb40b8e655383")
  (:PATH "raw/evidence-check-yBEaQa/10/scan-14.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/10/scan-14.lisp")
   :BYTES 372 :SHA256
   "9e13b1fc3cf1fcd8b729008b6d24f27077ea9b27330c61204e700e4b3727ef46")
  (:PATH "raw/evidence-check-yBEaQa/10/scan-14.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/10/scan-14.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/10/scan-14.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/10/scan-14.stdout.log")
   :BYTES 4296 :SHA256
   "918458975a291c92974c19a8596d1426837d3c60695c072d86aad2d911908117")
  (:PATH "raw/evidence-check-yBEaQa/10/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/10/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/10/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/10/stdout.lisp")
   :BYTES 212 :SHA256
   "428a9f420e24194503e36c6667b3d4bcf2b3db4c91e916f4d87c046fdb548532")
  (:PATH "raw/evidence-check-yBEaQa/100/scan-100.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/100/scan-100.lisp")
   :BYTES 376 :SHA256
   "e34c6664edc06673a3aea267fe366bb56055d90d48deba839ed89c6b3ed06700")
  (:PATH "raw/evidence-check-yBEaQa/100/scan-100.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/100/scan-100.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/100/scan-100.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/100/scan-100.stdout.log")
   :BYTES 4278 :SHA256
   "19e7cc2438d08b451ff7275e42e94941dac790f7c6208df1519d752a4d8e4b47")
  (:PATH "raw/evidence-check-yBEaQa/100/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/100/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/100/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/100/stdout.lisp")
   :BYTES 217 :SHA256
   "b8d0e7d27e3c2419df36f00c3f3838d8afb1516fcf4c7fa8cf30c581811e74b9")
  (:PATH "raw/evidence-check-yBEaQa/101/scan-111.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/101/scan-111.lisp")
   :BYTES 376 :SHA256
   "89b327d093afb724aaf6b9ff00a54c6a95a6485f0d9c9cd1ff2ec1cdd8ffa662")
  (:PATH "raw/evidence-check-yBEaQa/101/scan-111.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/101/scan-111.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/101/scan-111.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/101/scan-111.stdout.log")
   :BYTES 4284 :SHA256
   "48d33499c7e37027feb1ff86442a33f284bf13cdf6f8228d0f4cea34ad7ebbae")
  (:PATH "raw/evidence-check-yBEaQa/101/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/101/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/101/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/101/stdout.lisp")
   :BYTES 220 :SHA256
   "07f837e1a5decc0747c7792756c3335b5277614b71364be5d4769eff172d6376")
  (:PATH "raw/evidence-check-yBEaQa/102/scan-108.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/102/scan-108.lisp")
   :BYTES 376 :SHA256
   "13bd022f6c9fe88b91629ef58b2ed27c39b28b334fa22620fae759f3c1787f26")
  (:PATH "raw/evidence-check-yBEaQa/102/scan-108.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/102/scan-108.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/102/scan-108.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/102/scan-108.stdout.log")
   :BYTES 4278 :SHA256
   "379c63033016a8c6c4b1046f53ad1335b9e6ae1b835e64991dc9300ba130f0fa")
  (:PATH "raw/evidence-check-yBEaQa/102/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/102/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/102/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/102/stdout.lisp")
   :BYTES 217 :SHA256
   "f0a850b2a4fe51e30f3cd28b6850abbdbd36910d1c95ab43a8917bc294d43e62")
  (:PATH "raw/evidence-check-yBEaQa/103/scan-101.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/103/scan-101.lisp")
   :BYTES 376 :SHA256
   "403a48f64ba996d97bdc5eb1b2d54d89bbb2721eb533d4a88c986d844d2c0f5f")
  (:PATH "raw/evidence-check-yBEaQa/103/scan-101.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/103/scan-101.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/103/scan-101.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/103/scan-101.stdout.log")
   :BYTES 4290 :SHA256
   "8cce6bb5a9030ba94bb6208161232b0b96b7adfe7e809a012c2ce36e0c713850")
  (:PATH "raw/evidence-check-yBEaQa/103/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/103/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/103/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/103/stdout.lisp")
   :BYTES 227 :SHA256
   "57e9a90cdb6df782273d7aa450eb8632b6b02496f8d57ce90478df22af4f7dcd")
  (:PATH "raw/evidence-check-yBEaQa/104/scan-102.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/104/scan-102.lisp")
   :BYTES 376 :SHA256
   "5c137f74d0928100365225a1caa3c6cba5054d4855ea2ebc94faca943c47cb2a")
  (:PATH "raw/evidence-check-yBEaQa/104/scan-102.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/104/scan-102.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/104/scan-102.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/104/scan-102.stdout.log")
   :BYTES 4290 :SHA256
   "f6efa74dc442cfc15c82b2a6c88831db241717f7da027ee9be5c4d15757bbd9a")
  (:PATH "raw/evidence-check-yBEaQa/104/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/104/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/104/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/104/stdout.lisp")
   :BYTES 230 :SHA256
   "4b68228bb3015231194f92efcc880a613e73dd01f9e94b9212605b1adada0acc")
  (:PATH "raw/evidence-check-yBEaQa/105/scan-103.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/105/scan-103.lisp")
   :BYTES 376 :SHA256
   "e3f70b6a350162d5aebe84c35b814dc275241fd202521363c269ad939915224b")
  (:PATH "raw/evidence-check-yBEaQa/105/scan-103.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/105/scan-103.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/105/scan-103.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/105/scan-103.stdout.log")
   :BYTES 4278 :SHA256
   "8fc6736d7002b0fcb501e4ad3bda423c8f4ead4105f18020f4c936dbdb7e1332")
  (:PATH "raw/evidence-check-yBEaQa/105/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/105/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/105/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/105/stdout.lisp")
   :BYTES 225 :SHA256
   "e4ad967485e6d683849d6d21fd3b31a3b17e75cff38b86e8b3f290ed7162830d")
  (:PATH "raw/evidence-check-yBEaQa/106/scan-104.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/106/scan-104.lisp")
   :BYTES 376 :SHA256
   "2463b7b62886f7f21452b2c65eecb2c793b79f0f1f6e3e7cb66a3b75be74100a")
  (:PATH "raw/evidence-check-yBEaQa/106/scan-104.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/106/scan-104.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/106/scan-104.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/106/scan-104.stdout.log")
   :BYTES 4284 :SHA256
   "505c37cd5204ac51c1318014ee483ae35a05b66e84fd197ebc38f69d5f7991ff")
  (:PATH "raw/evidence-check-yBEaQa/106/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/106/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/106/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/106/stdout.lisp")
   :BYTES 229 :SHA256
   "b6f17e4ddb7edd20b450aa8d4e8219b0d5fdac7d581611a1fa0d38b62c090f16")
  (:PATH "raw/evidence-check-yBEaQa/107/scan-105.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/107/scan-105.lisp")
   :BYTES 376 :SHA256
   "11883ba4602dc9b4026b0084491c6a4c308139b835d661c24f8ac4a086cdec26")
  (:PATH "raw/evidence-check-yBEaQa/107/scan-105.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/107/scan-105.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/107/scan-105.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/107/scan-105.stdout.log")
   :BYTES 4284 :SHA256
   "ed1d648db65605945ad69731029f6101644f76d9402b156da1c48755172c9e8e")
  (:PATH "raw/evidence-check-yBEaQa/107/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/107/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/107/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/107/stdout.lisp")
   :BYTES 219 :SHA256
   "187439ec319f0a9f68d4575b2f374282ad835ff3b93d87d97356061a213eadb3")
  (:PATH "raw/evidence-check-yBEaQa/108/scan-106.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/108/scan-106.lisp")
   :BYTES 376 :SHA256
   "95a829dae9d27eb4264ab9d44ca58d4da5d52c234e2c76894e325b39afdb7649")
  (:PATH "raw/evidence-check-yBEaQa/108/scan-106.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/108/scan-106.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/108/scan-106.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/108/scan-106.stdout.log")
   :BYTES 4284 :SHA256
   "c8b4bf6522d4495fd295febbda1ac65988174d40f76c08c0c8fa423f6b849273")
  (:PATH "raw/evidence-check-yBEaQa/108/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/108/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/108/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/108/stdout.lisp")
   :BYTES 230 :SHA256
   "d7cb326f014ef1eb10faab4cfbc7c7eb17fbf0274b4bd7dc5d91796f0b24fb94")
  (:PATH "raw/evidence-check-yBEaQa/109/scan-107.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/109/scan-107.lisp")
   :BYTES 376 :SHA256
   "835a1df7a1156e9791d66c61531a9f13f0a3b9f7364ebb42e298c5665265995d")
  (:PATH "raw/evidence-check-yBEaQa/109/scan-107.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/109/scan-107.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/109/scan-107.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/109/scan-107.stdout.log")
   :BYTES 4284 :SHA256
   "f805bc36290aef4a77b744326aee069337d0ffbbd217931082a4a74cc2717474")
  (:PATH "raw/evidence-check-yBEaQa/109/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/109/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/109/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/109/stdout.lisp")
   :BYTES 212 :SHA256
   "2a109a61eeb4fc6c999db6dc0b39d5534310017ef00ce7f7d9d0de8a505cae4c")
  (:PATH "raw/evidence-check-yBEaQa/11/scan-9.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/11/scan-9.lisp")
   :BYTES 370 :SHA256
   "9e25db2d520811e9e1914c14250c19a966f48b8995c151b428109b007210bbb2")
  (:PATH "raw/evidence-check-yBEaQa/11/scan-9.stderr.log" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/11/scan-9.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/11/scan-9.stdout.log" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/11/scan-9.stdout.log")
   :BYTES 4296 :SHA256
   "ae186de885391ad310238f32a120ef6dd1275ddcf39fed98a62763a9c2fc80ef")
  (:PATH "raw/evidence-check-yBEaQa/11/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/11/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/11/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/11/stdout.lisp")
   :BYTES 218 :SHA256
   "51d1703322442d69288eac6dc5c57c4cb5104be67a3fde71dcb272de707c0cb0")
  (:PATH "raw/evidence-check-yBEaQa/110/scan-122.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/110/scan-122.lisp")
   :BYTES 376 :SHA256
   "b74ab975992d8fcb311a2fbf0191e9387b8d55b430fdb587a9dc046fb9d5b578")
  (:PATH "raw/evidence-check-yBEaQa/110/scan-122.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/110/scan-122.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/110/scan-122.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/110/scan-122.stdout.log")
   :BYTES 4302 :SHA256
   "3fd47daa8f044757f1de2ea4e4a1fcbc064926e1d5fe3d4772f4a6534a2cdb06")
  (:PATH "raw/evidence-check-yBEaQa/110/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/110/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/110/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/110/stdout.lisp")
   :BYTES 213 :SHA256
   "a00066a64be856dadb9aafdd6065aaca965210b0559e0f7c9e30333996fe51cb")
  (:PATH "raw/evidence-check-yBEaQa/111/scan-109.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/111/scan-109.lisp")
   :BYTES 376 :SHA256
   "75bd4be03e7479d235d3271a45d9c2d899e2e8a164cb22f0b695d81cc64c3c14")
  (:PATH "raw/evidence-check-yBEaQa/111/scan-109.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/111/scan-109.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/111/scan-109.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/111/scan-109.stdout.log")
   :BYTES 4284 :SHA256
   "60f615fa7818febd9df43cb9b454a5f8f67c4c4c6da88e23c375ed15141f2224")
  (:PATH "raw/evidence-check-yBEaQa/111/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/111/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/111/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/111/stdout.lisp")
   :BYTES 218 :SHA256
   "69e6fe514078214c84e5cc7eee4ce76eff812a2ad5b5524fb17a081cc4853a91")
  (:PATH "raw/evidence-check-yBEaQa/112/scan-110.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/112/scan-110.lisp")
   :BYTES 376 :SHA256
   "4005a6c82f2ccd8a25ff3a1d3b209ae06f390b2188a2a746939291376753e9d9")
  (:PATH "raw/evidence-check-yBEaQa/112/scan-110.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/112/scan-110.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/112/scan-110.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/112/scan-110.stdout.log")
   :BYTES 4290 :SHA256
   "376db3d78ef7953c720f7dc18805055be9a923593c85658f4d9bf7a07f6a31bd")
  (:PATH "raw/evidence-check-yBEaQa/112/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/112/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/112/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/112/stdout.lisp")
   :BYTES 220 :SHA256
   "595df0f380151ea2a9ac417aec16f11de73dc313b4022eec565d9d9a31c27932")
  (:PATH "raw/evidence-check-yBEaQa/113/scan-112.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/113/scan-112.lisp")
   :BYTES 376 :SHA256
   "3e696cd1ba5b97386e3af8c20a4582787cfca45cfe86ec607a4dfa2a6a62dfad")
  (:PATH "raw/evidence-check-yBEaQa/113/scan-112.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/113/scan-112.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/113/scan-112.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/113/scan-112.stdout.log")
   :BYTES 4290 :SHA256
   "d38810904bb4fe73442be43adb3f91a7335f882ab889c92ce5b796aed7a22190")
  (:PATH "raw/evidence-check-yBEaQa/113/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/113/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/113/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/113/stdout.lisp")
   :BYTES 219 :SHA256
   "4f4339bee666992b772c1e58fe8492ec5e6bfe360f9b1641a0303c682ecaf037")
  (:PATH "raw/evidence-check-yBEaQa/114/scan-114.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/114/scan-114.lisp")
   :BYTES 376 :SHA256
   "5a20ab3e63f28d54e1e7f6c1dbb60f2a3b64cf0e7e3f72b61a7cebd557bc110d")
  (:PATH "raw/evidence-check-yBEaQa/114/scan-114.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/114/scan-114.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/114/scan-114.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/114/scan-114.stdout.log")
   :BYTES 4296 :SHA256
   "a3a31e0520f33378c48a878b6d98e11104362cc24f1355a88518b8ff17b40880")
  (:PATH "raw/evidence-check-yBEaQa/114/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/114/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/114/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/114/stdout.lisp")
   :BYTES 220 :SHA256
   "fbad4f56c5c9ed5af540a5b99ea02fab02bb1b69bd4d519a91611f13cc9e40fa")
  (:PATH "raw/evidence-check-yBEaQa/115/scan-113.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/115/scan-113.lisp")
   :BYTES 376 :SHA256
   "73d6de95bd03dd7534d80eb533ca480afa50da5794efb8e7266091783ff421a3")
  (:PATH "raw/evidence-check-yBEaQa/115/scan-113.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/115/scan-113.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/115/scan-113.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/115/scan-113.stdout.log")
   :BYTES 4296 :SHA256
   "1327aa180b383b855beca11e8c783a42490b37b8d89663c8dd67be5dd9e42bf5")
  (:PATH "raw/evidence-check-yBEaQa/115/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/115/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/115/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/115/stdout.lisp")
   :BYTES 228 :SHA256
   "4b219622ffd357f0c40666b55fe9ff2c771d6a51f6a5b16e543173145071374a")
  (:PATH "raw/evidence-check-yBEaQa/116/scan-116.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/116/scan-116.lisp")
   :BYTES 376 :SHA256
   "f6f8376d331e5208fae26108f0669c59e566b05391f7c60db1ddb0e3028d76d0")
  (:PATH "raw/evidence-check-yBEaQa/116/scan-116.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/116/scan-116.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/116/scan-116.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/116/scan-116.stdout.log")
   :BYTES 4296 :SHA256
   "9c924986773344dc6c46bb07fc4a2ab902ccd2950d16ae0fcd5b5601f608ae6e")
  (:PATH "raw/evidence-check-yBEaQa/116/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/116/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/116/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/116/stdout.lisp")
   :BYTES 216 :SHA256
   "a79104e312638a95d92faaae44688e0b38962b122901b4520619158674a45e42")
  (:PATH "raw/evidence-check-yBEaQa/117/scan-115.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/117/scan-115.lisp")
   :BYTES 376 :SHA256
   "e49aebf16a18922a30dd366bcdb8f2edb6588ffe8228c4e2c36afd5fb5d5802e")
  (:PATH "raw/evidence-check-yBEaQa/117/scan-115.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/117/scan-115.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/117/scan-115.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/117/scan-115.stdout.log")
   :BYTES 4290 :SHA256
   "168953f9bf8dd5119ec3b72ccd3e60a6102de002aa4610ebd6bef33cdc8a6434")
  (:PATH "raw/evidence-check-yBEaQa/117/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/117/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/117/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/117/stdout.lisp")
   :BYTES 217 :SHA256
   "f31c7d437e13fd8360ff30dcc435622d07636bd2d3e2ceffd1a27005e5ede709")
  (:PATH "raw/evidence-check-yBEaQa/118/scan-117.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/118/scan-117.lisp")
   :BYTES 376 :SHA256
   "68ca5fe06c97eb706e7accba042231d5489a3c4aad76c3d44ead1c34111bd4ec")
  (:PATH "raw/evidence-check-yBEaQa/118/scan-117.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/118/scan-117.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/118/scan-117.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/118/scan-117.stdout.log")
   :BYTES 4290 :SHA256
   "13274a7c796b77acfb5c46051a97da61a71c77921c00ef5494a8391fb75564c9")
  (:PATH "raw/evidence-check-yBEaQa/118/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/118/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/118/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/118/stdout.lisp")
   :BYTES 220 :SHA256
   "5f6322bdb71f4f5404457092564512525673d43652b3518d4f0a334b4614526e")
  (:PATH "raw/evidence-check-yBEaQa/119/scan-118.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/119/scan-118.lisp")
   :BYTES 376 :SHA256
   "45a9ec2277b299b3d1907a920b0d76af1aa7959ee8d9e9db6dc97637d4f3b1ff")
  (:PATH "raw/evidence-check-yBEaQa/119/scan-118.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/119/scan-118.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/119/scan-118.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/119/scan-118.stdout.log")
   :BYTES 4296 :SHA256
   "750626445e21ae6ef53729fa3ca35313e337493e3dcf3293712f52bea18acc12")
  (:PATH "raw/evidence-check-yBEaQa/119/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/119/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/119/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/119/stdout.lisp")
   :BYTES 214 :SHA256
   "a920b0cc03b383aae1b739a89d1caaf2ea22287db538a222445324e64549db02")
  (:PATH "raw/evidence-check-yBEaQa/12/scan-11.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/12/scan-11.lisp")
   :BYTES 372 :SHA256
   "ea818129464a6d8313db1079fd9fbcce284f8c829c9c93a1ff699a115958ef9c")
  (:PATH "raw/evidence-check-yBEaQa/12/scan-11.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/12/scan-11.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/12/scan-11.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/12/scan-11.stdout.log")
   :BYTES 4296 :SHA256
   "b075bfceae73d21b6c7dc29c34a366290674a7e7aa9ed5756f76ba28b3f13425")
  (:PATH "raw/evidence-check-yBEaQa/12/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/12/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/12/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/12/stdout.lisp")
   :BYTES 223 :SHA256
   "0fab5df1b7306aee90addb4e0523a652ef9dd48163cb4425ed4426b285ed4f32")
  (:PATH "raw/evidence-check-yBEaQa/120/scan-119.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/120/scan-119.lisp")
   :BYTES 376 :SHA256
   "1be451a67004e8f0cb7363ca07241bc16c3f7460b49125a3b32903c627c075f4")
  (:PATH "raw/evidence-check-yBEaQa/120/scan-119.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/120/scan-119.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/120/scan-119.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/120/scan-119.stdout.log")
   :BYTES 4296 :SHA256
   "19281790d5f1ed602ad3738a8db302a1a7e9730f0014b61b303be1e233d10879")
  (:PATH "raw/evidence-check-yBEaQa/120/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/120/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/120/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/120/stdout.lisp")
   :BYTES 222 :SHA256
   "ea04b1396b0078341392e8a4ecc0a0694228f8b283b1dcde6bcaebbfb250c81e")
  (:PATH "raw/evidence-check-yBEaQa/121/scan-120.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/121/scan-120.lisp")
   :BYTES 376 :SHA256
   "bade89481415c9f74c2a7d3febb5e6615e59d01d8748ff196debe27eb2db43e3")
  (:PATH "raw/evidence-check-yBEaQa/121/scan-120.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/121/scan-120.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/121/scan-120.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/121/scan-120.stdout.log")
   :BYTES 4290 :SHA256
   "14d194a21b6cd1461cdcb70a54881f2d9cacc3f1570bca4e1e7cc264ceeeeee2")
  (:PATH "raw/evidence-check-yBEaQa/121/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/121/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/121/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/121/stdout.lisp")
   :BYTES 228 :SHA256
   "946c3997b7417071451e9eb6db75d371e7c9a17955181868bc842763a86d2fcf")
  (:PATH "raw/evidence-check-yBEaQa/122/scan-121.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/122/scan-121.lisp")
   :BYTES 376 :SHA256
   "da1ab167f00270dcd9bb78633b56aa08b3ba793a840a6d554667b73a798fdefd")
  (:PATH "raw/evidence-check-yBEaQa/122/scan-121.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/122/scan-121.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/122/scan-121.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/122/scan-121.stdout.log")
   :BYTES 4296 :SHA256
   "b4e3d860734f931e9750729b5e3f9b39bb82e49b2a0e9ac8132e81c04acc7c33")
  (:PATH "raw/evidence-check-yBEaQa/122/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/122/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/122/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/122/stdout.lisp")
   :BYTES 216 :SHA256
   "ed0e859eb14bf479b9947d248e87db4a24e762e10577f0dafe66339362287116")
  (:PATH "raw/evidence-check-yBEaQa/123/scan-123.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/123/scan-123.lisp")
   :BYTES 376 :SHA256
   "0a5908d2c332280e4e73f8f37526efd5f765f1eb5568b628f48688b0acbe9c04")
  (:PATH "raw/evidence-check-yBEaQa/123/scan-123.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/123/scan-123.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/123/scan-123.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/123/scan-123.stdout.log")
   :BYTES 4296 :SHA256
   "2face6e2b3f8d981134638e6153617fa93ac04679ea395e010b7ece0d991a951")
  (:PATH "raw/evidence-check-yBEaQa/123/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/123/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/123/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/123/stdout.lisp")
   :BYTES 216 :SHA256
   "7da8b09c295488e1bd495ce338647b5a69f987bd3c10bd0b526708dc23209512")
  (:PATH "raw/evidence-check-yBEaQa/124/scan-124.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/124/scan-124.lisp")
   :BYTES 376 :SHA256
   "03ef4bd1bedd1235e82684bc69d0b55d5e6c1193d947b0bd4b3ac3b62d377af7")
  (:PATH "raw/evidence-check-yBEaQa/124/scan-124.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/124/scan-124.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/124/scan-124.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/124/scan-124.stdout.log")
   :BYTES 4296 :SHA256
   "586500954cbad2a405d86773c52ab3fbc5ee5f17450b8b7000dd3981753b02a0")
  (:PATH "raw/evidence-check-yBEaQa/124/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/124/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/124/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/124/stdout.lisp")
   :BYTES 231 :SHA256
   "293b28a6c13a451b6a74bac6abf40b919a6254faa369a891129df21c5027901b")
  (:PATH "raw/evidence-check-yBEaQa/125/scan-125.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/125/scan-125.lisp")
   :BYTES 376 :SHA256
   "485fd3f0f992ac895e9dcedad3898aa5325e07beb19f89ca6899197e7f0ed64f")
  (:PATH "raw/evidence-check-yBEaQa/125/scan-125.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/125/scan-125.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/125/scan-125.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/125/scan-125.stdout.log")
   :BYTES 4296 :SHA256
   "a8afaee59b94568f1e15eb132cf974b377d36411926c7419fa9d754b7016d45b")
  (:PATH "raw/evidence-check-yBEaQa/125/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/125/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/125/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/125/stdout.lisp")
   :BYTES 225 :SHA256
   "de981af29bd0ba9af2fb0ae54882fac38adc02aff300fd91732586889e822a6f")
  (:PATH "raw/evidence-check-yBEaQa/126/scan-130.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/126/scan-130.lisp")
   :BYTES 376 :SHA256
   "ddab08f9ba44a8d89e361c6441b396332006a29ab8881bcb182ca8728ab5b95e")
  (:PATH "raw/evidence-check-yBEaQa/126/scan-130.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/126/scan-130.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/126/scan-130.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/126/scan-130.stdout.log")
   :BYTES 4302 :SHA256
   "846adee281978d080b62aa7afc8ca3c6b7a06a6f8417d98e169adea12cf0a5e5")
  (:PATH "raw/evidence-check-yBEaQa/126/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/126/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/126/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/126/stdout.lisp")
   :BYTES 223 :SHA256
   "6f07bf8f29c6da0a83e8671ea5d271e65a309bb14edfab2b12403f18a43d90e7")
  (:PATH "raw/evidence-check-yBEaQa/127/scan-131.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/127/scan-131.lisp")
   :BYTES 376 :SHA256
   "99e5ad070029e8a4b9184ba9afc46baa9a763b712a8ebab40ef14009246aa1d3")
  (:PATH "raw/evidence-check-yBEaQa/127/scan-131.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/127/scan-131.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/127/scan-131.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/127/scan-131.stdout.log")
   :BYTES 4302 :SHA256
   "37c410f61419831f6e218945a103f3860adfb48cc048de1bca7ca2caae0f77be")
  (:PATH "raw/evidence-check-yBEaQa/127/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/127/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/127/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/127/stdout.lisp")
   :BYTES 219 :SHA256
   "15831f9f894743d39b5b6efd63cb050facf6182ff2e1cbf7f802dda5fcac7c05")
  (:PATH "raw/evidence-check-yBEaQa/128/scan-126.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/128/scan-126.lisp")
   :BYTES 376 :SHA256
   "c13435cec3137e1fc16906b8f9e0995c707a3ae982822882dbe9edec33a17dc4")
  (:PATH "raw/evidence-check-yBEaQa/128/scan-126.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/128/scan-126.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/128/scan-126.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/128/scan-126.stdout.log")
   :BYTES 4308 :SHA256
   "11fd0bd87c14a2c2e790df57204fa7e4fe331b8af4c9d30a61449ef46117d9c7")
  (:PATH "raw/evidence-check-yBEaQa/128/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/128/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/128/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/128/stdout.lisp")
   :BYTES 230 :SHA256
   "29bce96b32026a00b7217d280df68f65aec652dc0f3e0592ecb39204ff516a2f")
  (:PATH "raw/evidence-check-yBEaQa/129/scan-127.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/129/scan-127.lisp")
   :BYTES 376 :SHA256
   "2cf076742eea18f0bb218b1bca03424e7c5bf4dffbd26a462c4047c0f62ba09e")
  (:PATH "raw/evidence-check-yBEaQa/129/scan-127.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/129/scan-127.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/129/scan-127.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/129/scan-127.stdout.log")
   :BYTES 4296 :SHA256
   "31bab7f2f09d1982b2c514dca7494aa08e02dc2420c7e7a025a9c9b31f95f5f0")
  (:PATH "raw/evidence-check-yBEaQa/129/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/129/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/129/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/129/stdout.lisp")
   :BYTES 218 :SHA256
   "bae5108edf3ee5aaa8571335870b4dfdc362edff5397d61a09ce846bc3d5c617")
  (:PATH "raw/evidence-check-yBEaQa/13/scan-12.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/13/scan-12.lisp")
   :BYTES 372 :SHA256
   "2ca2fb447e13fc40ce5b44d2d6cd84e1d33c26c1315c032920abf1c815a40cca")
  (:PATH "raw/evidence-check-yBEaQa/13/scan-12.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/13/scan-12.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/13/scan-12.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/13/scan-12.stdout.log")
   :BYTES 4296 :SHA256
   "ba711f1f50c331e52341883723fa90e2944df8c050e640a7fd01901a4257f935")
  (:PATH "raw/evidence-check-yBEaQa/13/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/13/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/13/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/13/stdout.lisp")
   :BYTES 217 :SHA256
   "d45dd9641471c405e133d4792c0acfc4bd666f651991c236b1aaadbf754cda60")
  (:PATH "raw/evidence-check-yBEaQa/130/scan-128.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/130/scan-128.lisp")
   :BYTES 376 :SHA256
   "ff3c4e55844026eef8de572e3598464d41672858b7fb615d0ff29b3e04d92538")
  (:PATH "raw/evidence-check-yBEaQa/130/scan-128.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/130/scan-128.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/130/scan-128.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/130/scan-128.stdout.log")
   :BYTES 4308 :SHA256
   "664a963d7ca90d1d2d9046ba9bf7e18ab1bfa7351a77211149d67a9d370f9322")
  (:PATH "raw/evidence-check-yBEaQa/130/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/130/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/130/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/130/stdout.lisp")
   :BYTES 216 :SHA256
   "7f33d5e627557218232b6893c67363d0d41bdd6be328f2da6703d9e5720d53f9")
  (:PATH "raw/evidence-check-yBEaQa/131/scan-129.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/131/scan-129.lisp")
   :BYTES 376 :SHA256
   "a34700a2764b88bbab0a9dd1e183ffe437cef6aebd47e61869af0206d9ebe03a")
  (:PATH "raw/evidence-check-yBEaQa/131/scan-129.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/131/scan-129.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/131/scan-129.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/131/scan-129.stdout.log")
   :BYTES 4302 :SHA256
   "bfa95aa3cf41269bc7cbbf427005c64327ead348c10d5bcfd8b83a7d6b9e8e61")
  (:PATH "raw/evidence-check-yBEaQa/131/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/131/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/131/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/131/stdout.lisp")
   :BYTES 223 :SHA256
   "727232f1beb1c95c888cdabecf1d10c9dfdf68309913133d61cd46813fccb714")
  (:PATH "raw/evidence-check-yBEaQa/132/scan-132.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/132/scan-132.lisp")
   :BYTES 376 :SHA256
   "53f55d89a62b3649ac2ff143204cf1a10de6892f300472bca18730cdeecd7c18")
  (:PATH "raw/evidence-check-yBEaQa/132/scan-132.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/132/scan-132.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/132/scan-132.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/132/scan-132.stdout.log")
   :BYTES 4296 :SHA256
   "2c919ac823d0805143b363248ea9992c0b1f0b53891eab5b564b52523837f689")
  (:PATH "raw/evidence-check-yBEaQa/132/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/132/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/132/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/132/stdout.lisp")
   :BYTES 214 :SHA256
   "e89ef9374ad15a7639b6d1a3f88278fe7e53050eb1731b39beb206a82931c22f")
  (:PATH "raw/evidence-check-yBEaQa/133/scan-134.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/133/scan-134.lisp")
   :BYTES 376 :SHA256
   "044785c91b58d10c8fd8aa12662604b37fdb9f137d792b551c00f645051a9ab2")
  (:PATH "raw/evidence-check-yBEaQa/133/scan-134.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/133/scan-134.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/133/scan-134.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/133/scan-134.stdout.log")
   :BYTES 4290 :SHA256
   "a6fab53055f9da92d7b7060e3afcd580917acbe0a7ce5e860dae12ac85b7e88a")
  (:PATH "raw/evidence-check-yBEaQa/133/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/133/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/133/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/133/stdout.lisp")
   :BYTES 221 :SHA256
   "1276207b37f0e0ebecda6840968c65809aac02a7752837f172f26bb351ff27d2")
  (:PATH "raw/evidence-check-yBEaQa/134/scan-133.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/134/scan-133.lisp")
   :BYTES 376 :SHA256
   "49c595ee74bd1d4ebdea6f99b4736f704af40237d97c4140bdce4a4f26713154")
  (:PATH "raw/evidence-check-yBEaQa/134/scan-133.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/134/scan-133.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/134/scan-133.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/134/scan-133.stdout.log")
   :BYTES 4290 :SHA256
   "2be920367946cbbf05a5c8ba8a56c71be8d2dd1ce379b7cecf0a47b45d6ec5ed")
  (:PATH "raw/evidence-check-yBEaQa/134/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/134/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/134/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/134/stdout.lisp")
   :BYTES 211 :SHA256
   "d32cacb29dff2243658ad57e057c4bb38b73d7fffff49553ad542d54bec44e00")
  (:PATH "raw/evidence-check-yBEaQa/135/scan-135.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/135/scan-135.lisp")
   :BYTES 376 :SHA256
   "b0cf4971bbd1dfccab4eb98f10ba951beaacdec8584a9e58b54cf969ce398646")
  (:PATH "raw/evidence-check-yBEaQa/135/scan-135.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/135/scan-135.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/135/scan-135.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/135/scan-135.stdout.log")
   :BYTES 4296 :SHA256
   "f1cca59eb69b0cc4a0e63d48c10ca89227b3f3b8a619b02e8b8f13c2099a7e42")
  (:PATH "raw/evidence-check-yBEaQa/135/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/135/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/135/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/135/stdout.lisp")
   :BYTES 225 :SHA256
   "8437dd558bf9b9c017fd824278a0e277387a86b28eafe45a94cf8b6e8245581b")
  (:PATH "raw/evidence-check-yBEaQa/136/scan-136.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/136/scan-136.lisp")
   :BYTES 376 :SHA256
   "79e58a728223597fec9ddf29becd8b3746d77e4c0e7281fa8365597f1ee4720e")
  (:PATH "raw/evidence-check-yBEaQa/136/scan-136.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/136/scan-136.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/136/scan-136.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/136/scan-136.stdout.log")
   :BYTES 4290 :SHA256
   "48324151039e89131abb35ad7c9e593b90ae28bb314d532c321fcbbc561c0215")
  (:PATH "raw/evidence-check-yBEaQa/136/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/136/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/136/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/136/stdout.lisp")
   :BYTES 213 :SHA256
   "e7a2ac246a3778554df705db5f9cb6b2d12014e9ad6437bff57e982d42eb9653")
  (:PATH "raw/evidence-check-yBEaQa/137/scan-138.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/137/scan-138.lisp")
   :BYTES 376 :SHA256
   "32003b9980e76e0a4e029b077fa54957dd2fbb67d47664dea5e46b84bf733728")
  (:PATH "raw/evidence-check-yBEaQa/137/scan-138.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/137/scan-138.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/137/scan-138.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/137/scan-138.stdout.log")
   :BYTES 4290 :SHA256
   "4b75ef64eca93a62e137e5747b13587e720310d4fdbefc6180e95055f454d0f6")
  (:PATH "raw/evidence-check-yBEaQa/137/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/137/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/137/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/137/stdout.lisp")
   :BYTES 217 :SHA256
   "f61b31bc0e814ef4a0981ea5786e1a257ab258fe90a86666dc5c7cd629f37494")
  (:PATH "raw/evidence-check-yBEaQa/138/scan-137.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/138/scan-137.lisp")
   :BYTES 376 :SHA256
   "093f353c7aca44e1e8c9f30c696a1675ead46c9deec32481be3b090159c0223e")
  (:PATH "raw/evidence-check-yBEaQa/138/scan-137.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/138/scan-137.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/138/scan-137.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/138/scan-137.stdout.log")
   :BYTES 4296 :SHA256
   "e7c06829aa94e9db751be90f430d7752f099184a77c6c9eaaa33faf55256184d")
  (:PATH "raw/evidence-check-yBEaQa/138/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/138/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/138/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/138/stdout.lisp")
   :BYTES 220 :SHA256
   "62d04afe268ec1057ce8f20327ec9614bde016d3f5aa20a4642756de615234b3")
  (:PATH "raw/evidence-check-yBEaQa/139/scan-139.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/139/scan-139.lisp")
   :BYTES 376 :SHA256
   "581f0c8edfda49e0c1058b8712aa3e639a676fad7feb5abf87360e6817f35d1f")
  (:PATH "raw/evidence-check-yBEaQa/139/scan-139.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/139/scan-139.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/139/scan-139.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/139/scan-139.stdout.log")
   :BYTES 4302 :SHA256
   "4899536433b42263290d05198ea3dca1304fb8987614eaa5ac4e09fa16ac4845")
  (:PATH "raw/evidence-check-yBEaQa/139/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/139/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/139/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/139/stdout.lisp")
   :BYTES 222 :SHA256
   "9427a592737c533ff9df8a5917e45600739a087d14784d0359af4fbaf9bf136b")
  (:PATH "raw/evidence-check-yBEaQa/14/scan-13.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/14/scan-13.lisp")
   :BYTES 372 :SHA256
   "cf6d266fe80631a1d17341150a4a27647864f081236bfe4c99686d7b6861b31d")
  (:PATH "raw/evidence-check-yBEaQa/14/scan-13.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/14/scan-13.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/14/scan-13.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/14/scan-13.stdout.log")
   :BYTES 4296 :SHA256
   "ea1ff04399090350fde17d6ec6ce3afb4740bfa8a623a051859530802ba9e962")
  (:PATH "raw/evidence-check-yBEaQa/14/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/14/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/14/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/14/stdout.lisp")
   :BYTES 212 :SHA256
   "ff2678fd93dbc2f953fed5ae64b1b124f87f3ae0ef291edbfeb9c83f082cce4e")
  (:PATH "raw/evidence-check-yBEaQa/140/scan-140.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/140/scan-140.lisp")
   :BYTES 376 :SHA256
   "256ea086acb06eb11a5f3a0cc83be6653a28e67432fef73ca8dd371d787ca3fa")
  (:PATH "raw/evidence-check-yBEaQa/140/scan-140.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/140/scan-140.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/140/scan-140.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/140/scan-140.stdout.log")
   :BYTES 4302 :SHA256
   "8f5ef0afae307b55476e4db09ccaf925e3273b0f23387d087e24b559f1f6ded2")
  (:PATH "raw/evidence-check-yBEaQa/140/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/140/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/140/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/140/stdout.lisp")
   :BYTES 212 :SHA256
   "789fdfe41d0fe09a96dfc47e8d77faaa2859011302fc5b24a8953c48df994688")
  (:PATH "raw/evidence-check-yBEaQa/141/scan-141.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/141/scan-141.lisp")
   :BYTES 376 :SHA256
   "60f9221c89eb351183c3634f48716f520c6b47de836a3ea6b06de7b19806865b")
  (:PATH "raw/evidence-check-yBEaQa/141/scan-141.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/141/scan-141.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/141/scan-141.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/141/scan-141.stdout.log")
   :BYTES 4296 :SHA256
   "9c35376c4b3c4e84c8d33e7e57e82fbeae4b32cfa46138e01b5942e36d4f6d14")
  (:PATH "raw/evidence-check-yBEaQa/141/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/141/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/141/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/141/stdout.lisp")
   :BYTES 232 :SHA256
   "ac1f1e0944d24cd83e4b764d1f4163c525a17230f4547fced48e7a8782c311fc")
  (:PATH "raw/evidence-check-yBEaQa/142/scan-142.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/142/scan-142.lisp")
   :BYTES 376 :SHA256
   "73a00a8875ea151ed1dd9ec5664863e0411030585f4d581e1bdd9d491282fe3b")
  (:PATH "raw/evidence-check-yBEaQa/142/scan-142.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/142/scan-142.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/142/scan-142.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/142/scan-142.stdout.log")
   :BYTES 4296 :SHA256
   "4b215e3b74f70699457f5f3ffe872666fac7b5486f239a15edb480b864e814f3")
  (:PATH "raw/evidence-check-yBEaQa/142/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/142/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/142/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/142/stdout.lisp")
   :BYTES 228 :SHA256
   "b78889a2b23e7535fea4d4875d742a572495bbab271e73b6c4d014656cf39567")
  (:PATH "raw/evidence-check-yBEaQa/143/scan-143.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/143/scan-143.lisp")
   :BYTES 376 :SHA256
   "934f4d35e0a2cde68e103faf17e2649c2f9f131c7d75cab460e1b34f98c51584")
  (:PATH "raw/evidence-check-yBEaQa/143/scan-143.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/143/scan-143.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/143/scan-143.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/143/scan-143.stdout.log")
   :BYTES 4296 :SHA256
   "4cf6bae14b7b01ae86f9237d1b512ed5a1122f1b0788ed2b7e605f2d8d6e6b87")
  (:PATH "raw/evidence-check-yBEaQa/143/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/143/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/143/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/143/stdout.lisp")
   :BYTES 219 :SHA256
   "43d8c91d88dd7b5a962b5dd6efb4a74e1f6078e2fdb00ab1451153d6428ae374")
  (:PATH "raw/evidence-check-yBEaQa/144/scan-144.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/144/scan-144.lisp")
   :BYTES 376 :SHA256
   "d54ae883cc6eaac1be8f056e8c2118eb2fbeafc2e5c69108b316c17bf0ba94f9")
  (:PATH "raw/evidence-check-yBEaQa/144/scan-144.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/144/scan-144.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/144/scan-144.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/144/scan-144.stdout.log")
   :BYTES 4296 :SHA256
   "c33cf9819e7d39575102090166b2d06f64fcb05746d9106698534f6a1acc5f17")
  (:PATH "raw/evidence-check-yBEaQa/144/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/144/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/144/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/144/stdout.lisp")
   :BYTES 226 :SHA256
   "4dec574e206cf1b2e7b0b8ae8722ec0927f785dddc83634e97baded405fcd452")
  (:PATH "raw/evidence-check-yBEaQa/145/scan-145.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/145/scan-145.lisp")
   :BYTES 376 :SHA256
   "08bf9c122e25b129c8e204b8e2635ffa1e29383613e75658b229962140d81db9")
  (:PATH "raw/evidence-check-yBEaQa/145/scan-145.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/145/scan-145.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/145/scan-145.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/145/scan-145.stdout.log")
   :BYTES 4296 :SHA256
   "2a23de4ee8b108fb14d97f15d5ab802ab38432ac836ef04b7abd41ce29aa4014")
  (:PATH "raw/evidence-check-yBEaQa/145/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/145/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/145/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/145/stdout.lisp")
   :BYTES 215 :SHA256
   "489ca1154b4a331472c51a1c22b8b6633ada8818f2e318ad51af42f55d45eb4b")
  (:PATH "raw/evidence-check-yBEaQa/146/scan-148.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/146/scan-148.lisp")
   :BYTES 376 :SHA256
   "ad662c35838375b015168088df2da7c3f090e1e214ca07ed1bfc8e680f21f292")
  (:PATH "raw/evidence-check-yBEaQa/146/scan-148.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/146/scan-148.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/146/scan-148.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/146/scan-148.stdout.log")
   :BYTES 4290 :SHA256
   "5d3f724c8d4772eb8b4788ad737a0a8de5ee113348cc1b5b218fe13a76e04783")
  (:PATH "raw/evidence-check-yBEaQa/146/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/146/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/146/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/146/stdout.lisp")
   :BYTES 215 :SHA256
   "3e362832472b7a739116c2fe72ead7fb83cbc4e26a2bff8cc4855f529921b478")
  (:PATH "raw/evidence-check-yBEaQa/147/scan-146.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/147/scan-146.lisp")
   :BYTES 376 :SHA256
   "56d582bc681c4bf63bbb8ba28d44175473fa83d48f65db9771ef379e1d31369e")
  (:PATH "raw/evidence-check-yBEaQa/147/scan-146.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/147/scan-146.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/147/scan-146.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/147/scan-146.stdout.log")
   :BYTES 4302 :SHA256
   "060c304f605a6eafdde31e3d6ec01270d5e8631a741b4335948746afc9e37147")
  (:PATH "raw/evidence-check-yBEaQa/147/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/147/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/147/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/147/stdout.lisp")
   :BYTES 228 :SHA256
   "19eac239c49ddb59d4dea58f70704673dc088d31bead9e08fed4665946af9ebe")
  (:PATH "raw/evidence-check-yBEaQa/148/scan-147.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/148/scan-147.lisp")
   :BYTES 376 :SHA256
   "323d6a3c02df0feba80c15ec399620c65a1f66cf82e07c10e672ecb6e38bb879")
  (:PATH "raw/evidence-check-yBEaQa/148/scan-147.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/148/scan-147.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/148/scan-147.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/148/scan-147.stdout.log")
   :BYTES 4290 :SHA256
   "672ab906a9593fa14407b1160eb569dc919c3e1aa0921082079ae1b92662ca7e")
  (:PATH "raw/evidence-check-yBEaQa/148/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/148/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/148/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/148/stdout.lisp")
   :BYTES 224 :SHA256
   "7ff1e1ee48aa03c45f1e0d4703451324790813062f892682af5d8ec18a3748f3")
  (:PATH "raw/evidence-check-yBEaQa/149/scan-149.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/149/scan-149.lisp")
   :BYTES 376 :SHA256
   "0f2fbdc82ef353a246ffb8cde12057659b69dcbd2d3eb5cd4bc185bfe739424a")
  (:PATH "raw/evidence-check-yBEaQa/149/scan-149.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/149/scan-149.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/149/scan-149.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/149/scan-149.stdout.log")
   :BYTES 4296 :SHA256
   "9b2683782c20ac8e5d9e2dcf41bc4ab5203486c73b8be2a75307af4622c8f78b")
  (:PATH "raw/evidence-check-yBEaQa/149/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/149/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/149/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/149/stdout.lisp")
   :BYTES 215 :SHA256
   "64e1ef79bf5469f30c1289c8a2df22f2aba30643347f675895ede173417ba59e")
  (:PATH "raw/evidence-check-yBEaQa/15/scan-15.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/15/scan-15.lisp")
   :BYTES 372 :SHA256
   "11d54a7282572d20b581ffca5a459f0e2ed4dac12ed84bec81db88a669131c3a")
  (:PATH "raw/evidence-check-yBEaQa/15/scan-15.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/15/scan-15.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/15/scan-15.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/15/scan-15.stdout.log")
   :BYTES 4296 :SHA256
   "ab71ede833e9cd57f35f4cc3eaea1640f21e2e64cc9c9b340176139b55ec72e3")
  (:PATH "raw/evidence-check-yBEaQa/15/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/15/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/15/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/15/stdout.lisp")
   :BYTES 234 :SHA256
   "34ce887d3315370c1dcdbf7bdebb77707724f62e4cb547c90308a1e4fbab4d20")
  (:PATH "raw/evidence-check-yBEaQa/150/scan-150.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/150/scan-150.lisp")
   :BYTES 376 :SHA256
   "57d269d70c25b5c619c6f814146bde4df8a5fe658d4bc4cf8226f360d6ceb0a6")
  (:PATH "raw/evidence-check-yBEaQa/150/scan-150.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/150/scan-150.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/150/scan-150.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/150/scan-150.stdout.log")
   :BYTES 4296 :SHA256
   "24a845559ca16cbd8ac8d73271d04cd7fe18c77624f152af21985d9bc5b38db9")
  (:PATH "raw/evidence-check-yBEaQa/150/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/150/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/150/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/150/stdout.lisp")
   :BYTES 229 :SHA256
   "ad8776a4a06caf907b18fc2b9b4958fd4b12cc120579c1b06c35b3495eea6faa")
  (:PATH "raw/evidence-check-yBEaQa/151/scan-151.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/151/scan-151.lisp")
   :BYTES 376 :SHA256
   "faf6ab98b45c1c70b0c685406f1cc2dcfa90a76faf86e7a3c464060111341aee")
  (:PATH "raw/evidence-check-yBEaQa/151/scan-151.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/151/scan-151.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/151/scan-151.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/151/scan-151.stdout.log")
   :BYTES 4296 :SHA256
   "70b3324782a471aeaaf32f3e81b6b0f20294243d6aa505e0499124f7c53458b8")
  (:PATH "raw/evidence-check-yBEaQa/151/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/151/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/151/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/151/stdout.lisp")
   :BYTES 219 :SHA256
   "d4ecf6de3e7507cf694ac783240dca5a8ecd86756c9b0fa4fcd6a143acd72e9e")
  (:PATH "raw/evidence-check-yBEaQa/152/scan-152.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/152/scan-152.lisp")
   :BYTES 376 :SHA256
   "4cfb7f21ec8ce1b3dd49070b602dc3744c9ee96a75c200fe4e4869aca0d5bd09")
  (:PATH "raw/evidence-check-yBEaQa/152/scan-152.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/152/scan-152.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/152/scan-152.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/152/scan-152.stdout.log")
   :BYTES 4296 :SHA256
   "fa5733727910801e190c38b02c56c79c4eeb5a26c6104134310672fc9f755ffc")
  (:PATH "raw/evidence-check-yBEaQa/152/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/152/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/152/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/152/stdout.lisp")
   :BYTES 226 :SHA256
   "e1bfc388c46834b133a08c6724cc2be360331b70d1e4a4fd387c12b017656218")
  (:PATH "raw/evidence-check-yBEaQa/153/scan-153.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/153/scan-153.lisp")
   :BYTES 376 :SHA256
   "003750f4d590da6088523c48c903168881e009576216b2f0af696c82d2a504e5")
  (:PATH "raw/evidence-check-yBEaQa/153/scan-153.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/153/scan-153.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/153/scan-153.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/153/scan-153.stdout.log")
   :BYTES 4296 :SHA256
   "559e5a350cb0a55dbf4ff3e422c3f26fa35454f880bd2c5429bbac1717d292c7")
  (:PATH "raw/evidence-check-yBEaQa/153/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/153/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/153/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/153/stdout.lisp")
   :BYTES 216 :SHA256
   "ef3b9e0d99a5142dd0b5ff3c7be7d3f393d603564e61ae40bb060c3a9ef6c81a")
  (:PATH "raw/evidence-check-yBEaQa/154/scan-154.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/154/scan-154.lisp")
   :BYTES 376 :SHA256
   "94446019577c67a5bcfe19253a810e83c6dde4b12c312bbb9c9bf43db026bae0")
  (:PATH "raw/evidence-check-yBEaQa/154/scan-154.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/154/scan-154.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/154/scan-154.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/154/scan-154.stdout.log")
   :BYTES 4290 :SHA256
   "5854687db2d2bee2b251819001a74c9dc4175971fdc61ffeb828926226286d22")
  (:PATH "raw/evidence-check-yBEaQa/154/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/154/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/154/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/154/stdout.lisp")
   :BYTES 230 :SHA256
   "1852c55abaca810361237dbfcea486ce0b2b213d1fb4c9776f844debcc4ed3b3")
  (:PATH "raw/evidence-check-yBEaQa/155/scan-155.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/155/scan-155.lisp")
   :BYTES 376 :SHA256
   "416fcd3218619cbade92d5207c20c47400b247bdda3840305537b0cd387371b5")
  (:PATH "raw/evidence-check-yBEaQa/155/scan-155.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/155/scan-155.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/155/scan-155.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/155/scan-155.stdout.log")
   :BYTES 4296 :SHA256
   "19e1a611fa520e9eaab23d8428097221e370011e38f04f15c072812b2687e88a")
  (:PATH "raw/evidence-check-yBEaQa/155/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/155/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/155/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/155/stdout.lisp")
   :BYTES 221 :SHA256
   "80ed2043003b19533fb2e5c973d7589ab9bdec81237c602ecf3826adf23b5bb3")
  (:PATH "raw/evidence-check-yBEaQa/156/scan-156.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/156/scan-156.lisp")
   :BYTES 376 :SHA256
   "30f357f8e46a74ed858e4c03ef60cfba3ad9215de0b7648c7a5e173074267563")
  (:PATH "raw/evidence-check-yBEaQa/156/scan-156.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/156/scan-156.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/156/scan-156.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/156/scan-156.stdout.log")
   :BYTES 4296 :SHA256
   "a09cd4dfb53504643b2a6b7ec13e13b85d210fbb9df766a44de98c46347664cc")
  (:PATH "raw/evidence-check-yBEaQa/156/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/156/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/156/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/156/stdout.lisp")
   :BYTES 224 :SHA256
   "97a7b668df98767478568f56c016b45d8d4d9860d4f0e831dc4df821efe104c2")
  (:PATH "raw/evidence-check-yBEaQa/157/scan-157.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/157/scan-157.lisp")
   :BYTES 376 :SHA256
   "9418d9c9b25577cc910bd55cbe70d8c49b5bc184515292ec6f17d0e96557b377")
  (:PATH "raw/evidence-check-yBEaQa/157/scan-157.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/157/scan-157.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/157/scan-157.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/157/scan-157.stdout.log")
   :BYTES 4296 :SHA256
   "c509f2af1e46bf48ffea56c898c730104eb16eedb638ba01c6f95c284f561901")
  (:PATH "raw/evidence-check-yBEaQa/157/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/157/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/157/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/157/stdout.lisp")
   :BYTES 215 :SHA256
   "25d9cef6944ad21ff0dc29f3453b7627dc87a93d020e9b38c67239091b667595")
  (:PATH "raw/evidence-check-yBEaQa/158/scan-158.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/158/scan-158.lisp")
   :BYTES 376 :SHA256
   "cd0017e14bd4fbdaa2e4c23e0dc73f6fd191d940492e02dfd38be975d50f1ed8")
  (:PATH "raw/evidence-check-yBEaQa/158/scan-158.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/158/scan-158.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/158/scan-158.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/158/scan-158.stdout.log")
   :BYTES 4296 :SHA256
   "6b03546a759d8ab0d69b313de1081c32b5b2a7d6e5f0c5eb7c7de5e58bb59cf1")
  (:PATH "raw/evidence-check-yBEaQa/158/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/158/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/158/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/158/stdout.lisp")
   :BYTES 218 :SHA256
   "170922933d905c4d830dab936b5b81226eec5de3e6dd4cc176603668c5988adc")
  (:PATH "raw/evidence-check-yBEaQa/159/scan-159.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/159/scan-159.lisp")
   :BYTES 376 :SHA256
   "8150381c01a035fdbd8391ccd3322cab99b371679f4e43bea4a11196a02c572e")
  (:PATH "raw/evidence-check-yBEaQa/159/scan-159.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/159/scan-159.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/159/scan-159.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/159/scan-159.stdout.log")
   :BYTES 4296 :SHA256
   "d3fe7b9b3191cae6b3dc273d5ad142034fcda5e2ce9be2e3c67f2b7cc6bc4294")
  (:PATH "raw/evidence-check-yBEaQa/159/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/159/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/159/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/159/stdout.lisp")
   :BYTES 231 :SHA256
   "c11feb4a04942b35a7ce49223032973447735d216aff2737773678a1552dfdeb")
  (:PATH "raw/evidence-check-yBEaQa/16/scan-17.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/16/scan-17.lisp")
   :BYTES 372 :SHA256
   "cea72c94157ed632107992cf73c60ec7325838d94933d787fee2df3f16acdaa7")
  (:PATH "raw/evidence-check-yBEaQa/16/scan-17.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/16/scan-17.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/16/scan-17.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/16/scan-17.stdout.log")
   :BYTES 4296 :SHA256
   "2f17ba39845839fceb3b9bef0fe92abdc598775394f0c70e567902513b0d5901")
  (:PATH "raw/evidence-check-yBEaQa/16/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/16/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/16/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/16/stdout.lisp")
   :BYTES 241 :SHA256
   "2aeba4f3d251d3bfe189f1ad6139bded24e996877236350053fe8126bf46f7bf")
  (:PATH "raw/evidence-check-yBEaQa/160/scan-160.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/160/scan-160.lisp")
   :BYTES 376 :SHA256
   "ad154a48804b075a53ee44f1ddc49dc1273f0ddc586b46da2d3165569512ef41")
  (:PATH "raw/evidence-check-yBEaQa/160/scan-160.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/160/scan-160.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/160/scan-160.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/160/scan-160.stdout.log")
   :BYTES 4290 :SHA256
   "2e2e3924e36108fa2c16c4b7c77de1b0eb32adffff8e950fd655d56cf8b9f741")
  (:PATH "raw/evidence-check-yBEaQa/160/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/160/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/160/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/160/stdout.lisp")
   :BYTES 244 :SHA256
   "d8ed9fcb48073012d9bc94e0fdc209057390502b2440972d222ceda80569dbba")
  (:PATH "raw/evidence-check-yBEaQa/161/scan-161.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/161/scan-161.lisp")
   :BYTES 376 :SHA256
   "4c80ddd0959a81ffbc25dc6fc0bce2f75b1e134aadbbac19af544324ed554e26")
  (:PATH "raw/evidence-check-yBEaQa/161/scan-161.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/161/scan-161.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/161/scan-161.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/161/scan-161.stdout.log")
   :BYTES 4290 :SHA256
   "b79377a1f2fb16860b372b5d48d205f8f96452c971cbb992b88f6605466ddc4d")
  (:PATH "raw/evidence-check-yBEaQa/161/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/161/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/161/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/161/stdout.lisp")
   :BYTES 233 :SHA256
   "46252ce4299c053cc2daa80933c1bc5d8ce890733ab7d9b8c9cdfd282298fd71")
  (:PATH "raw/evidence-check-yBEaQa/162/scan-162.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/162/scan-162.lisp")
   :BYTES 376 :SHA256
   "cbb77e94aabf1c02f2354399206ba275fcb8bea219164192fa9274a7b5455471")
  (:PATH "raw/evidence-check-yBEaQa/162/scan-162.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/162/scan-162.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/162/scan-162.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/162/scan-162.stdout.log")
   :BYTES 4290 :SHA256
   "bfa79a1ff8fad934d59ee708d3eb657a2a682ef3d11c7ca2287ab41c293c8fa1")
  (:PATH "raw/evidence-check-yBEaQa/162/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/162/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/162/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/162/stdout.lisp")
   :BYTES 220 :SHA256
   "93fdb70c1b147a7aa2b5c1b7f3db01eaacce05dac4790efc5cfa8d22aa05296d")
  (:PATH "raw/evidence-check-yBEaQa/163/scan-163.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/163/scan-163.lisp")
   :BYTES 376 :SHA256
   "6303c9fabe86d8aabc20b05af9aadd9663535943806ffa82cb2ed5f091caaaec")
  (:PATH "raw/evidence-check-yBEaQa/163/scan-163.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/163/scan-163.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/163/scan-163.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/163/scan-163.stdout.log")
   :BYTES 4284 :SHA256
   "6e5840c9a283f614248ecfb423f14e8e016b94106c1f30eb5ccfad002186d3c6")
  (:PATH "raw/evidence-check-yBEaQa/163/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/163/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/163/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/163/stdout.lisp")
   :BYTES 228 :SHA256
   "2e75ee3563a3f4ea774d4806298906416d9d6711f6c5010b7ce8fffc723e99ae")
  (:PATH "raw/evidence-check-yBEaQa/164/scan-164.lisp.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/164/scan-164.lisp")
   :BYTES 376 :SHA256
   "f394088e888c330d1249d375a7d9c239d6bdf675cfd87c3d47fc6f0d47ddf97f")
  (:PATH "raw/evidence-check-yBEaQa/164/scan-164.stderr.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/164/scan-164.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/164/scan-164.stdout.log" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/164/scan-164.stdout.log")
   :BYTES 4284 :SHA256
   "7fdfffb590476dbe08bbb80ca1ddcefdbb8fca9f81eda808269284ac72190f81")
  (:PATH "raw/evidence-check-yBEaQa/164/stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/164/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/164/stdout.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/164/stdout.lisp")
   :BYTES 221 :SHA256
   "adf35093813660be2ec41346eac8be603ea4e1cd1d1137183f2448582889cec8")
  (:PATH "raw/evidence-check-yBEaQa/17/scan-20.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/17/scan-20.lisp")
   :BYTES 372 :SHA256
   "bef773285220ac292fde649117c5e1b8457c6a4acaf7ea1fdf9f4e8dbc5f1dee")
  (:PATH "raw/evidence-check-yBEaQa/17/scan-20.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/17/scan-20.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/17/scan-20.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/17/scan-20.stdout.log")
   :BYTES 4296 :SHA256
   "1bc3664b16e06da9d2fca58b2023bf1cc95bf1d1c7f38d6b6c3f87af5ced088a")
  (:PATH "raw/evidence-check-yBEaQa/17/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/17/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/17/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/17/stdout.lisp")
   :BYTES 222 :SHA256
   "bfb57ae6c66b36c04316df75af9654e4dfc197844a5c099be9a65d4fc637f666")
  (:PATH "raw/evidence-check-yBEaQa/18/scan-23.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/18/scan-23.lisp")
   :BYTES 372 :SHA256
   "612d6eb6ef5094bef732bce6258702a0ee40286082a13f5e802664d550984e1d")
  (:PATH "raw/evidence-check-yBEaQa/18/scan-23.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/18/scan-23.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/18/scan-23.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/18/scan-23.stdout.log")
   :BYTES 4302 :SHA256
   "244db896bb737555fe7f5c9ff29a4361e43a47cef0b4c738366c2da796db68b7")
  (:PATH "raw/evidence-check-yBEaQa/18/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/18/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/18/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/18/stdout.lisp")
   :BYTES 215 :SHA256
   "6df844d3d72a8a88316b771cc169bd8bea18cdccda426496090ac4f58f20c86d")
  (:PATH "raw/evidence-check-yBEaQa/19/scan-18.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/19/scan-18.lisp")
   :BYTES 372 :SHA256
   "848c19c9d86970ce75546718a779947a8c228096631d402e46dbdf3b5d783023")
  (:PATH "raw/evidence-check-yBEaQa/19/scan-18.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/19/scan-18.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/19/scan-18.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/19/scan-18.stdout.log")
   :BYTES 4320 :SHA256
   "a528cece315978cabd6049f8bf4b59ba0b8a651e57ccdbc659c4a5ce32ec62d2")
  (:PATH "raw/evidence-check-yBEaQa/19/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/19/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/19/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/19/stdout.lisp")
   :BYTES 211 :SHA256
   "24a0d1afe0e54dcba6b6990813a1cecd62ca88b124b464600ec5e089b6f4b3c5")
  (:PATH "raw/evidence-check-yBEaQa/2/scan-2.lisp.txt" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/2/scan-2.lisp")
   :BYTES 368 :SHA256
   "2c325a302a2276b7a8dd821474d0839839776b272e8d0c136089dabff80b0942")
  (:PATH "raw/evidence-check-yBEaQa/2/scan-2.stderr.log" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/2/scan-2.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/2/scan-2.stdout.log" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/2/scan-2.stdout.log")
   :BYTES 4302 :SHA256
   "a49ef9d7fa368b096232dd10b3613b278da71bf8ad99598b7d720b5ebcee0aae")
  (:PATH "raw/evidence-check-yBEaQa/2/stderr.log" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/2/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/2/stdout.lisp.txt" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/2/stdout.lisp")
   :BYTES 211 :SHA256
   "3529e6861a33a71ca81fde27620ff89a2ff989415b9f0b7b82e289eb1362816d")
  (:PATH "raw/evidence-check-yBEaQa/20/scan-27.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/20/scan-27.lisp")
   :BYTES 372 :SHA256
   "2a9a9572b03fd80e38d07a8cc26258e95c6caa10a187ebb4dceda0479a6e990d")
  (:PATH "raw/evidence-check-yBEaQa/20/scan-27.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/20/scan-27.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/20/scan-27.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/20/scan-27.stdout.log")
   :BYTES 4284 :SHA256
   "36cb606ce7dbb29f549df06a67e36bd18d513c2ce3265b25e5cf04d7c9fd9622")
  (:PATH "raw/evidence-check-yBEaQa/20/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/20/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/20/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/20/stdout.lisp")
   :BYTES 214 :SHA256
   "43246163207b7383bc01a766856a7572184caed5c9bb0cc32e0e16d8676db98c")
  (:PATH "raw/evidence-check-yBEaQa/21/scan-19.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/21/scan-19.lisp")
   :BYTES 372 :SHA256
   "ee46281a3bd9c4c9ae9ba7e01ae95b4d5faa0b9a6f9b6e6d6ad46e711639336a")
  (:PATH "raw/evidence-check-yBEaQa/21/scan-19.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/21/scan-19.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/21/scan-19.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/21/scan-19.stdout.log")
   :BYTES 4296 :SHA256
   "4dc9be3ad5a6d17fda8de66c949f56683801ca288f4bbc04adfba31cd5e466fd")
  (:PATH "raw/evidence-check-yBEaQa/21/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/21/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/21/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/21/stdout.lisp")
   :BYTES 211 :SHA256
   "5c79afdceb144f335fdd5c40f11eab27ed76d52c85dd9efaf51adc2d8b148435")
  (:PATH "raw/evidence-check-yBEaQa/22/scan-26.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/22/scan-26.lisp")
   :BYTES 372 :SHA256
   "75586b83ff0d725c5f423cb6e039de01a108096d469f1a6d90370cb97f1a03cd")
  (:PATH "raw/evidence-check-yBEaQa/22/scan-26.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/22/scan-26.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/22/scan-26.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/22/scan-26.stdout.log")
   :BYTES 4296 :SHA256
   "2da15f6bf524ed3ec4c46657ad988768335cad94e763cd2736670b267e8f298b")
  (:PATH "raw/evidence-check-yBEaQa/22/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/22/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/22/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/22/stdout.lisp")
   :BYTES 204 :SHA256
   "bf10505fa1d25d9cf001a77899457139d743cc7f7c587cd8d6588714c41a0ce0")
  (:PATH "raw/evidence-check-yBEaQa/23/scan-21.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/23/scan-21.lisp")
   :BYTES 372 :SHA256
   "05da88e12b7d263d9f9cb7fb675803a56ce3b83dd501f14920f984c34869ffca")
  (:PATH "raw/evidence-check-yBEaQa/23/scan-21.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/23/scan-21.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/23/scan-21.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/23/scan-21.stdout.log")
   :BYTES 4302 :SHA256
   "18efe8ed07209e2ad15264185810dfac00a6654e16ee7ef3250847040371cd9d")
  (:PATH "raw/evidence-check-yBEaQa/23/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/23/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/23/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/23/stdout.lisp")
   :BYTES 219 :SHA256
   "656709bc708e68c7665cac6c25f7eb291b4602b32324d6a3f3be21136b80b197")
  (:PATH "raw/evidence-check-yBEaQa/24/scan-22.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/24/scan-22.lisp")
   :BYTES 372 :SHA256
   "180d7a2198077f147e06232d7219921953d9f13928e6326a166ce791249124be")
  (:PATH "raw/evidence-check-yBEaQa/24/scan-22.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/24/scan-22.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/24/scan-22.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/24/scan-22.stdout.log")
   :BYTES 4296 :SHA256
   "60c723666a4e44992c6b008e8b6c780ed718a6022a120d2a226a7cd86874d55f")
  (:PATH "raw/evidence-check-yBEaQa/24/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/24/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/24/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/24/stdout.lisp")
   :BYTES 210 :SHA256
   "8c94fbe9bbd1dbb12020dabb94ca8ce8dcddad68aa4b76a0d7562aae42dfc016")
  (:PATH "raw/evidence-check-yBEaQa/25/scan-24.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/25/scan-24.lisp")
   :BYTES 372 :SHA256
   "d86a576e3fc78a630f206dc7764438a856c2b24abaece4a21e75a729e61adba7")
  (:PATH "raw/evidence-check-yBEaQa/25/scan-24.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/25/scan-24.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/25/scan-24.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/25/scan-24.stdout.log")
   :BYTES 4296 :SHA256
   "a1dfd19b231a9ee533f35da78454d688026000bc934a63b69c0106f8dc24a468")
  (:PATH "raw/evidence-check-yBEaQa/25/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/25/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/25/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/25/stdout.lisp")
   :BYTES 204 :SHA256
   "57fa84f1d997c6e3fe04a43f07cfe8b070177359b2376e8ec03ae703f5a352ae")
  (:PATH "raw/evidence-check-yBEaQa/26/scan-34.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/26/scan-34.lisp")
   :BYTES 372 :SHA256
   "2049180f83d0e31bb0a04caf4f796043b23f5da94b191122eabc342ac535c79d")
  (:PATH "raw/evidence-check-yBEaQa/26/scan-34.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/26/scan-34.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/26/scan-34.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/26/scan-34.stdout.log")
   :BYTES 4290 :SHA256
   "31d61b54a6037b937044df27c77bab8f34c0e216ec3136471ba19d57f272c193")
  (:PATH "raw/evidence-check-yBEaQa/26/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/26/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/26/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/26/stdout.lisp")
   :BYTES 214 :SHA256
   "e60d23c00ec9c0ab7a95b62200421e88861dc11fd654ab2d3dcf18e05fe10014")
  (:PATH "raw/evidence-check-yBEaQa/27/scan-25.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/27/scan-25.lisp")
   :BYTES 372 :SHA256
   "14cd1b3e8dc4ae196eecaaf630aada7ae1f310180e54342593b4899c81aac99a")
  (:PATH "raw/evidence-check-yBEaQa/27/scan-25.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/27/scan-25.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/27/scan-25.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/27/scan-25.stdout.log")
   :BYTES 4296 :SHA256
   "5cffbb80f657b6020f8b32708e2f52d112e72c90be6b9dd9ae7a60762e32104b")
  (:PATH "raw/evidence-check-yBEaQa/27/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/27/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/27/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/27/stdout.lisp")
   :BYTES 212 :SHA256
   "986807ab505bcd7bc3d766c7eeadb11e2f2eddd5d2c336f8f611e24f3bbbd1a3")
  (:PATH "raw/evidence-check-yBEaQa/28/scan-28.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/28/scan-28.lisp")
   :BYTES 372 :SHA256
   "d53eabfcc1194811e5fe903c14c35a32cd487004017dc8f9be12b7d3aaa6308f")
  (:PATH "raw/evidence-check-yBEaQa/28/scan-28.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/28/scan-28.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/28/scan-28.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/28/scan-28.stdout.log")
   :BYTES 4284 :SHA256
   "2d377eaeaf22559077c4bff1537287f2b50923958ee117c6b7d0c92bc339f628")
  (:PATH "raw/evidence-check-yBEaQa/28/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/28/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/28/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/28/stdout.lisp")
   :BYTES 222 :SHA256
   "440fe13b4bb18690fa813928bb2c978364befdc33fd464bd382247fc7c7b4fb1")
  (:PATH "raw/evidence-check-yBEaQa/29/scan-29.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/29/scan-29.lisp")
   :BYTES 372 :SHA256
   "31a79888aa2a05fb06f6d827942b9bfafd8aab64be4651dceab0ab5561b379b8")
  (:PATH "raw/evidence-check-yBEaQa/29/scan-29.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/29/scan-29.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/29/scan-29.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/29/scan-29.stdout.log")
   :BYTES 4290 :SHA256
   "ec8c2dcbe6d8778a3c3eb6c74717c7d34ab9dc80bfeb2ffecb0477eaf5ac0a3a")
  (:PATH "raw/evidence-check-yBEaQa/29/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/29/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/29/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/29/stdout.lisp")
   :BYTES 210 :SHA256
   "ab673d5c775c2e12be0230cade341e2fd8bd5dd82f0ca387b20c2806c130b0a9")
  (:PATH "raw/evidence-check-yBEaQa/3/scan-3.lisp.txt" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/3/scan-3.lisp")
   :BYTES 368 :SHA256
   "0e73b0578509c7ef9171a0e083161228300aa41c206302a73d18689120251d72")
  (:PATH "raw/evidence-check-yBEaQa/3/scan-3.stderr.log" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/3/scan-3.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/3/scan-3.stdout.log" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/3/scan-3.stdout.log")
   :BYTES 4302 :SHA256
   "2548d6ba3fdc3d36619359d5c033115503e0db533d1161be07bb74a6d52dac09")
  (:PATH "raw/evidence-check-yBEaQa/3/stderr.log" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/3/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/3/stdout.lisp.txt" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/3/stdout.lisp")
   :BYTES 203 :SHA256
   "9e257f3b8e656a9b41916073479eaa95395e94afb16541393860765d97a7c6c1")
  (:PATH "raw/evidence-check-yBEaQa/30/scan-31.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/30/scan-31.lisp")
   :BYTES 372 :SHA256
   "ae17de2a310ba761b8f8ba22c5e35dc55d1a37fc7b0c0228d8145e2894c8416b")
  (:PATH "raw/evidence-check-yBEaQa/30/scan-31.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/30/scan-31.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/30/scan-31.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/30/scan-31.stdout.log")
   :BYTES 4290 :SHA256
   "02e306fb689e892a157be6a00ee0e47a52ab2ed5ccaa3fb0617d72460e0ad68b")
  (:PATH "raw/evidence-check-yBEaQa/30/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/30/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/30/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/30/stdout.lisp")
   :BYTES 221 :SHA256
   "2107f86c68fb9662be5dae601a2d125c80513208bb7bd7a320761e88970fdbe8")
  (:PATH "raw/evidence-check-yBEaQa/31/scan-32.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/31/scan-32.lisp")
   :BYTES 372 :SHA256
   "940ac62ec1e8ea12e2332d6a4d635df2964e758fb800ec0829f06b26557c99b4")
  (:PATH "raw/evidence-check-yBEaQa/31/scan-32.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/31/scan-32.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/31/scan-32.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/31/scan-32.stdout.log")
   :BYTES 4290 :SHA256
   "ea1b579fcec8355a10bf0cdc1e5d845d4a8adcf19f3e65fb33daba5cd1222951")
  (:PATH "raw/evidence-check-yBEaQa/31/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/31/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/31/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/31/stdout.lisp")
   :BYTES 209 :SHA256
   "87f7e82a35308d7606176cc84ea7a22107579ee4dfe41f81e674cdebbff54d6b")
  (:PATH "raw/evidence-check-yBEaQa/32/scan-30.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/32/scan-30.lisp")
   :BYTES 372 :SHA256
   "d04a55de164bfacc6a81f82b3f1115a6f431533fe46eee0154c093fa8145b939")
  (:PATH "raw/evidence-check-yBEaQa/32/scan-30.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/32/scan-30.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/32/scan-30.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/32/scan-30.stdout.log")
   :BYTES 4284 :SHA256
   "c7bc4439c0d7b223a91a16bc5c8dd1ad2ada82c7fbc9416dc8b3e217f221b55a")
  (:PATH "raw/evidence-check-yBEaQa/32/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/32/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/32/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/32/stdout.lisp")
   :BYTES 215 :SHA256
   "772b34cdb7d8e2e9adb575cf3e4e315fee362646d3360ca7fc17a73f7bb55c94")
  (:PATH "raw/evidence-check-yBEaQa/33/scan-35.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/33/scan-35.lisp")
   :BYTES 372 :SHA256
   "34e24e3a71fccaf32cae318c87245ffe7c9cd9a8820d83960d7129bf13748b30")
  (:PATH "raw/evidence-check-yBEaQa/33/scan-35.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/33/scan-35.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/33/scan-35.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/33/scan-35.stdout.log")
   :BYTES 4278 :SHA256
   "093fee76948e14eed67cb8d67945895d3c40a2363093526ebb92d0e65a68a7bd")
  (:PATH "raw/evidence-check-yBEaQa/33/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/33/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/33/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/33/stdout.lisp")
   :BYTES 206 :SHA256
   "d2a6b85faace52d5afcce431762a711ffad212f89a0b36d87091d3cbccaf8914")
  (:PATH "raw/evidence-check-yBEaQa/34/scan-33.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/34/scan-33.lisp")
   :BYTES 372 :SHA256
   "62b46bb2a4450ede2de5197658e064f402a25ac76076b154a575d002f7ded570")
  (:PATH "raw/evidence-check-yBEaQa/34/scan-33.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/34/scan-33.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/34/scan-33.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/34/scan-33.stdout.log")
   :BYTES 4284 :SHA256
   "c520661b60e54fd83b57e61910b4865c29e1d4a11091bffb9e98b18a8cd90b00")
  (:PATH "raw/evidence-check-yBEaQa/34/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/34/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/34/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/34/stdout.lisp")
   :BYTES 210 :SHA256
   "cb372c4eece934826bc05736555dd8eab869dcad29449b044ba70b4a85b54fea")
  (:PATH "raw/evidence-check-yBEaQa/35/scan-39.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/35/scan-39.lisp")
   :BYTES 372 :SHA256
   "4abcfde46fab9a01915035fb6155a9a8c9ac362643c2a24797fb37aa4da4c546")
  (:PATH "raw/evidence-check-yBEaQa/35/scan-39.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/35/scan-39.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/35/scan-39.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/35/scan-39.stdout.log")
   :BYTES 4284 :SHA256
   "25e687b252f903bc069e38af5e86d021ce7d9fa8153ead18fd369769263259b1")
  (:PATH "raw/evidence-check-yBEaQa/35/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/35/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/35/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/35/stdout.lisp")
   :BYTES 218 :SHA256
   "1a9a2143f271247d97f53b6aa0a78dfbf68f6ce6ce9c7b22ddf42f92e7ecb40e")
  (:PATH "raw/evidence-check-yBEaQa/36/scan-36.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/36/scan-36.lisp")
   :BYTES 372 :SHA256
   "7041ab33f04ffdf7e99a6b0e1b5588b4b022c299d4feae5367940be508290f52")
  (:PATH "raw/evidence-check-yBEaQa/36/scan-36.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/36/scan-36.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/36/scan-36.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/36/scan-36.stdout.log")
   :BYTES 4284 :SHA256
   "83539d27d9fc97430b7dbe4fcc4e63cbfc70ffb29854bb248deab3c3aaddf130")
  (:PATH "raw/evidence-check-yBEaQa/36/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/36/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/36/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/36/stdout.lisp")
   :BYTES 213 :SHA256
   "f386eef0c233f30d8dd920f84ab6d1f63337d923aff5f33b5ecf0b04f85e8c0e")
  (:PATH "raw/evidence-check-yBEaQa/37/scan-40.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/37/scan-40.lisp")
   :BYTES 372 :SHA256
   "be39e1319eb2f6e8e8aa9bcd82bd40915af116ec29214fe1ac1df4a591bf8852")
  (:PATH "raw/evidence-check-yBEaQa/37/scan-40.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/37/scan-40.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/37/scan-40.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/37/scan-40.stdout.log")
   :BYTES 4284 :SHA256
   "969e7b320a6a780e5d8f8c53c378aab1804cd71748c11cdc5cb7f88914a78dbe")
  (:PATH "raw/evidence-check-yBEaQa/37/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/37/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/37/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/37/stdout.lisp")
   :BYTES 222 :SHA256
   "8bfa6fc6bde7b34c5b5987506321effae180ba32731d2ca21ebf8fed53e876f2")
  (:PATH "raw/evidence-check-yBEaQa/38/scan-37.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/38/scan-37.lisp")
   :BYTES 372 :SHA256
   "1e391c7baab731426bb4f02842bbcf993e74cce76c557b26671575dea14e2c53")
  (:PATH "raw/evidence-check-yBEaQa/38/scan-37.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/38/scan-37.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/38/scan-37.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/38/scan-37.stdout.log")
   :BYTES 4290 :SHA256
   "1a79604db0370f2f2de0ef778541cb0224d164edc94b16f061b40f5c3bbd03c3")
  (:PATH "raw/evidence-check-yBEaQa/38/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/38/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/38/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/38/stdout.lisp")
   :BYTES 209 :SHA256
   "f100fa99d6c61a6adeb2de86007ef6e1f55d638d95a43abe725e8546f46146ff")
  (:PATH "raw/evidence-check-yBEaQa/39/scan-38.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/39/scan-38.lisp")
   :BYTES 372 :SHA256
   "133b08488f724518cea1859bd21a9c094654ded059bfbc2d8838806096f0cd61")
  (:PATH "raw/evidence-check-yBEaQa/39/scan-38.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/39/scan-38.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/39/scan-38.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/39/scan-38.stdout.log")
   :BYTES 4284 :SHA256
   "2b9211dd0c4205b935ab2862fb863dd6e1ff9fbf15ad00770ea93468b327ab38")
  (:PATH "raw/evidence-check-yBEaQa/39/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/39/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/39/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/39/stdout.lisp")
   :BYTES 205 :SHA256
   "ace8119a96f5470d1f70b865ede28208dda046f8347ed6c95ddab1190557ec72")
  (:PATH "raw/evidence-check-yBEaQa/4/scan-8.lisp.txt" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/4/scan-8.lisp")
   :BYTES 368 :SHA256
   "86e57a221d8a56ad0d28e2823a31340e3b85ee86f7a4113a705f381c5c9580b5")
  (:PATH "raw/evidence-check-yBEaQa/4/scan-8.stderr.log" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/4/scan-8.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/4/scan-8.stdout.log" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/4/scan-8.stdout.log")
   :BYTES 4296 :SHA256
   "94959ef5cd8af23bc979896400490086f902eea000c31c0182ba21eeda2b7f62")
  (:PATH "raw/evidence-check-yBEaQa/4/stderr.log" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/4/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/4/stdout.lisp.txt" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/4/stdout.lisp")
   :BYTES 208 :SHA256
   "639ec7a55a506bb0bb3e217fddebd171ad53b2676986447e4f1e00552b61c9e4")
  (:PATH "raw/evidence-check-yBEaQa/40/scan-47.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/40/scan-47.lisp")
   :BYTES 372 :SHA256
   "7d95d8e63f575b71b7ca5879461448ca3a534408eec9aafc514b97946aba428b")
  (:PATH "raw/evidence-check-yBEaQa/40/scan-47.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/40/scan-47.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/40/scan-47.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/40/scan-47.stdout.log")
   :BYTES 4290 :SHA256
   "75ebc2f6699a7afdb8c2fa3cc2acad2af9ccc3a457bf60875144e615ff12bd88")
  (:PATH "raw/evidence-check-yBEaQa/40/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/40/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/40/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/40/stdout.lisp")
   :BYTES 209 :SHA256
   "1bc78658d6870aa97b735075d91c98d2736c0906c1aac71809f2bb127509f1cb")
  (:PATH "raw/evidence-check-yBEaQa/41/scan-42.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/41/scan-42.lisp")
   :BYTES 372 :SHA256
   "366d5e192616508d07797c7c49aa06400605903a296c3f03ac8ef56b642dd5cb")
  (:PATH "raw/evidence-check-yBEaQa/41/scan-42.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/41/scan-42.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/41/scan-42.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/41/scan-42.stdout.log")
   :BYTES 4290 :SHA256
   "6746864795b3c9ad2d7cca6ba53d4aaff0f9d26c3141a0139a19b25229b1cb0f")
  (:PATH "raw/evidence-check-yBEaQa/41/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/41/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/41/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/41/stdout.lisp")
   :BYTES 220 :SHA256
   "7c34b393d434c3f95c6205c97c953ea9f1becc4093fa3e856df15f6db0fa8d80")
  (:PATH "raw/evidence-check-yBEaQa/42/scan-43.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/42/scan-43.lisp")
   :BYTES 372 :SHA256
   "4751fefcb7a8c1a01aea3734aabb651db92aaa9c4d6d6948a96728978539999f")
  (:PATH "raw/evidence-check-yBEaQa/42/scan-43.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/42/scan-43.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/42/scan-43.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/42/scan-43.stdout.log")
   :BYTES 4290 :SHA256
   "a3480e71a5aa348967370534d20e1dcbde76b7a8202b4fc1b4b5b148f4c02db9")
  (:PATH "raw/evidence-check-yBEaQa/42/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/42/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/42/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/42/stdout.lisp")
   :BYTES 215 :SHA256
   "540e37c9220e9780de5cb66a93b85858b741b400b4376d47710de9e94e52f3cc")
  (:PATH "raw/evidence-check-yBEaQa/43/scan-41.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/43/scan-41.lisp")
   :BYTES 372 :SHA256
   "28f604ba62f04c5302853c4d60bf6058020bd7fe6a3c88447c01e730bfcd7bea")
  (:PATH "raw/evidence-check-yBEaQa/43/scan-41.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/43/scan-41.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/43/scan-41.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/43/scan-41.stdout.log")
   :BYTES 4284 :SHA256
   "e0f25dd840849d2da0e0a58324b3de879e58f3f7425c760f296eb52a8d02e421")
  (:PATH "raw/evidence-check-yBEaQa/43/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/43/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/43/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/43/stdout.lisp")
   :BYTES 213 :SHA256
   "f2a05c642921164b7d5387be1e72fba4c6516c5b03585e6968a4f87e9e5fe66f")
  (:PATH "raw/evidence-check-yBEaQa/44/scan-44.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/44/scan-44.lisp")
   :BYTES 372 :SHA256
   "5486352316617ec62093dac9f1f2d845ef9003fc5a81dcda3a9fdcbe102fc5fc")
  (:PATH "raw/evidence-check-yBEaQa/44/scan-44.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/44/scan-44.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/44/scan-44.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/44/scan-44.stdout.log")
   :BYTES 4290 :SHA256
   "80f8ba179d3b578e58d7f84a92fe2a6855d236a85069f7b2b21100e58d78b6d5")
  (:PATH "raw/evidence-check-yBEaQa/44/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/44/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/44/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/44/stdout.lisp")
   :BYTES 224 :SHA256
   "c31d63d54dc1528305734e66839c22e9648a0247a7664d6b270b29b96c43a08d")
  (:PATH "raw/evidence-check-yBEaQa/45/scan-45.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/45/scan-45.lisp")
   :BYTES 372 :SHA256
   "2347dfd8d09196a3e941f209eb4e25c41742f51fd8a1ef9a73bf3716ea634a00")
  (:PATH "raw/evidence-check-yBEaQa/45/scan-45.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/45/scan-45.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/45/scan-45.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/45/scan-45.stdout.log")
   :BYTES 4284 :SHA256
   "db85493f0e4acf995a55b2c2d6cd401e7df152c5ccf4519f7a63ebd09c4da1fa")
  (:PATH "raw/evidence-check-yBEaQa/45/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/45/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/45/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/45/stdout.lisp")
   :BYTES 224 :SHA256
   "8438832a771764930ccda6ae834bd3a3ebc390f2fee0f79d4ff740d94f29f637")
  (:PATH "raw/evidence-check-yBEaQa/46/scan-46.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/46/scan-46.lisp")
   :BYTES 372 :SHA256
   "b5a1d2e184188978ab6f564d9995b6ed4f31a75231d49a2390cbafc8d04bd37a")
  (:PATH "raw/evidence-check-yBEaQa/46/scan-46.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/46/scan-46.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/46/scan-46.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/46/scan-46.stdout.log")
   :BYTES 4284 :SHA256
   "6e65ae503b54700911e00d705b9c060977c31a0e92ca141cbd8abf88c1944b7c")
  (:PATH "raw/evidence-check-yBEaQa/46/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/46/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/46/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/46/stdout.lisp")
   :BYTES 213 :SHA256
   "9ad6d9b3c896d0639f0f910ecd72c8a00a43de2e5400a1cffe058427d364f279")
  (:PATH "raw/evidence-check-yBEaQa/47/scan-48.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/47/scan-48.lisp")
   :BYTES 372 :SHA256
   "b65319b596ceb88ce6010aaa59826f9c61242e2917f1506dc247f05a76fe958a")
  (:PATH "raw/evidence-check-yBEaQa/47/scan-48.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/47/scan-48.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/47/scan-48.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/47/scan-48.stdout.log")
   :BYTES 4278 :SHA256
   "b95bfd59dfa8cf587addf7d04fdfe34e88316d04f8d53013f739ba6527273ae6")
  (:PATH "raw/evidence-check-yBEaQa/47/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/47/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/47/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/47/stdout.lisp")
   :BYTES 215 :SHA256
   "5acffaf2143a8e288e81281a37b0a349c4730cf931f50e8eeb94428b8c10e023")
  (:PATH "raw/evidence-check-yBEaQa/48/scan-49.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/48/scan-49.lisp")
   :BYTES 372 :SHA256
   "dc2b186d970d49f0d5f09ca8c7e70bc7704432cd7f77621c29834959f7dd4768")
  (:PATH "raw/evidence-check-yBEaQa/48/scan-49.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/48/scan-49.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/48/scan-49.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/48/scan-49.stdout.log")
   :BYTES 4278 :SHA256
   "cf2cdd87b7eadb0131cf50c0f4a25c601939901180ffde7073cc579bcb2cc570")
  (:PATH "raw/evidence-check-yBEaQa/48/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/48/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/48/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/48/stdout.lisp")
   :BYTES 231 :SHA256
   "73ede4f06a8ebbea3ccca29e45c1bc934af4ad47c8908b26e9a21bba592ccabb")
  (:PATH "raw/evidence-check-yBEaQa/49/scan-50.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/49/scan-50.lisp")
   :BYTES 372 :SHA256
   "e56b93a1781f01055f5e7059e24ecc30294632b92edd0a9c431aba7ea3edbc46")
  (:PATH "raw/evidence-check-yBEaQa/49/scan-50.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/49/scan-50.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/49/scan-50.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/49/scan-50.stdout.log")
   :BYTES 4278 :SHA256
   "5fc6bf7ac308e89edfa4f957ce148c1dfba2f3a8e88da5a6d834c9a7b27e7ca8")
  (:PATH "raw/evidence-check-yBEaQa/49/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/49/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/49/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/49/stdout.lisp")
   :BYTES 225 :SHA256
   "6d4e1c2bd254eed60ab05d83e6faf6922cf7863a66e70739ec8cd1cab8d2fa54")
  (:PATH "raw/evidence-check-yBEaQa/5/scan-4.lisp.txt" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/5/scan-4.lisp")
   :BYTES 368 :SHA256
   "79f807ccd24eb3249ba021c588568049fda3125a613210f77f687707c61a7123")
  (:PATH "raw/evidence-check-yBEaQa/5/scan-4.stderr.log" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/5/scan-4.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/5/scan-4.stdout.log" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/5/scan-4.stdout.log")
   :BYTES 4302 :SHA256
   "53d87ee72f8f75fcb69ae689d43ad27595701f3797dcb2b9e0ef643e6faaf018")
  (:PATH "raw/evidence-check-yBEaQa/5/stderr.log" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/5/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/5/stdout.lisp.txt" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/5/stdout.lisp")
   :BYTES 209 :SHA256
   "7d1c2aa3b278f0a78613177ba8de6ba2a80c537845a25cacbecc5ff2031ae6dc")
  (:PATH "raw/evidence-check-yBEaQa/50/scan-51.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/50/scan-51.lisp")
   :BYTES 372 :SHA256
   "7b793cf1b4794099e9f803a6c273f258d4f0dab99d183ca8598cd6e27aedfcae")
  (:PATH "raw/evidence-check-yBEaQa/50/scan-51.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/50/scan-51.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/50/scan-51.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/50/scan-51.stdout.log")
   :BYTES 4284 :SHA256
   "78b50cf71776699c12214f67ae075b2bac56d80c6553d1c4c439a27bfbe7c7c8")
  (:PATH "raw/evidence-check-yBEaQa/50/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/50/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/50/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/50/stdout.lisp")
   :BYTES 219 :SHA256
   "320c93a60c595654c33fc837e35531ad38c0273b70510c4c14c0758d9f4efcb3")
  (:PATH "raw/evidence-check-yBEaQa/51/scan-54.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/51/scan-54.lisp")
   :BYTES 372 :SHA256
   "630f2faa622ab74a5950871ea819d8e7ad5ab4fc40eb34137b74d093e2ea6885")
  (:PATH "raw/evidence-check-yBEaQa/51/scan-54.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/51/scan-54.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/51/scan-54.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/51/scan-54.stdout.log")
   :BYTES 4278 :SHA256
   "c02846d4831d195b32e1d11afdf4fc23b9fb3e974e188272484fd652beca33a9")
  (:PATH "raw/evidence-check-yBEaQa/51/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/51/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/51/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/51/stdout.lisp")
   :BYTES 220 :SHA256
   "6a50f12d54b6e0363e5773b67eec9a03912a6e9b61d3340d172b19a8b4b4f5b5")
  (:PATH "raw/evidence-check-yBEaQa/52/scan-61.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/52/scan-61.lisp")
   :BYTES 372 :SHA256
   "5a7e6b9ca563041dededf5e61cd98566d063034b7deef83a46f1bed89d7f2106")
  (:PATH "raw/evidence-check-yBEaQa/52/scan-61.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/52/scan-61.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/52/scan-61.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/52/scan-61.stdout.log")
   :BYTES 4278 :SHA256
   "4cd02a521a359bee7d4f1a6ec4b793100e2e47bd11665560a4c3ae86036b23bf")
  (:PATH "raw/evidence-check-yBEaQa/52/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/52/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/52/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/52/stdout.lisp")
   :BYTES 215 :SHA256
   "d8e098e7c9301351e5831a0a5b8b33e4a23c2fd7b29d0946a7039d8239a09304")
  (:PATH "raw/evidence-check-yBEaQa/53/scan-52.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/53/scan-52.lisp")
   :BYTES 372 :SHA256
   "8dfa25e6deabfacb50ab6c074b8c85bf71b16965233801f47afe3fe86a52c1d9")
  (:PATH "raw/evidence-check-yBEaQa/53/scan-52.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/53/scan-52.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/53/scan-52.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/53/scan-52.stdout.log")
   :BYTES 4284 :SHA256
   "3e91b1b826a18d03179294c8b412ce95f48905b8a45788101966be6619682edb")
  (:PATH "raw/evidence-check-yBEaQa/53/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/53/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/53/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/53/stdout.lisp")
   :BYTES 223 :SHA256
   "bc793961b130930ace74f954c06129438ffef7062dcb5033bb27a34f70610104")
  (:PATH "raw/evidence-check-yBEaQa/54/scan-53.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/54/scan-53.lisp")
   :BYTES 372 :SHA256
   "81ffed23fb516df1b8fafc425d2e1449e3803dd5292e66127e4be446ca857be8")
  (:PATH "raw/evidence-check-yBEaQa/54/scan-53.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/54/scan-53.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/54/scan-53.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/54/scan-53.stdout.log")
   :BYTES 4278 :SHA256
   "551c6fb59bcf8fdf1758f23ce6905c6c819f61daaa31507b1e12fe54f42684e6")
  (:PATH "raw/evidence-check-yBEaQa/54/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/54/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/54/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/54/stdout.lisp")
   :BYTES 217 :SHA256
   "ed86c0c2937fe1e0671f00db8cc938d371627479c67fc07a841db9c5e21dcfdb")
  (:PATH "raw/evidence-check-yBEaQa/55/scan-55.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/55/scan-55.lisp")
   :BYTES 372 :SHA256
   "ef864e9bfa65f3b2e6d6545be70ec504801bbc0e1ff4e20bd50d55e17b7684ae")
  (:PATH "raw/evidence-check-yBEaQa/55/scan-55.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/55/scan-55.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/55/scan-55.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/55/scan-55.stdout.log")
   :BYTES 4278 :SHA256
   "1561ea6b756f93d57f215c67b241b41c9aa7bcd4096fd8aeff978aa89fc1e18e")
  (:PATH "raw/evidence-check-yBEaQa/55/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/55/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/55/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/55/stdout.lisp")
   :BYTES 223 :SHA256
   "a7f3483804ea2f81fbb24b215954edeac64b02b2d461dcc6030b4a2850b397e3")
  (:PATH "raw/evidence-check-yBEaQa/56/scan-57.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/56/scan-57.lisp")
   :BYTES 372 :SHA256
   "09f9e43835c9e88015bfe894685cd60882d207fda1c902aafce01256beb598c5")
  (:PATH "raw/evidence-check-yBEaQa/56/scan-57.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/56/scan-57.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/56/scan-57.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/56/scan-57.stdout.log")
   :BYTES 4272 :SHA256
   "f454da2e979e6947e70557b02b95dbe6ab50bdcf775407230fe3a9226ddd7906")
  (:PATH "raw/evidence-check-yBEaQa/56/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/56/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/56/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/56/stdout.lisp")
   :BYTES 217 :SHA256
   "e7203438b4ce12d92fc0e5d316f23569cef8061cf928e60b675d25eb7da5be2b")
  (:PATH "raw/evidence-check-yBEaQa/57/scan-56.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/57/scan-56.lisp")
   :BYTES 372 :SHA256
   "9771876fb1a93258cccb1e6eb42be3adb940deedb93bb918bae3f3dadb034cf4")
  (:PATH "raw/evidence-check-yBEaQa/57/scan-56.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/57/scan-56.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/57/scan-56.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/57/scan-56.stdout.log")
   :BYTES 4272 :SHA256
   "b2de7a0d2a34586397127286f662ddffb198e16c6158df4e3f3cbe1a8a23a6fb")
  (:PATH "raw/evidence-check-yBEaQa/57/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/57/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/57/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/57/stdout.lisp")
   :BYTES 223 :SHA256
   "03fe279874d2715a99eafb9468eea061d5cc575446e4d317e6eb7045bf21d168")
  (:PATH "raw/evidence-check-yBEaQa/58/scan-58.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/58/scan-58.lisp")
   :BYTES 372 :SHA256
   "90acb6620d987d32c331b9e656e32f0788c14a2ab7f66f2c70efe606194588b0")
  (:PATH "raw/evidence-check-yBEaQa/58/scan-58.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/58/scan-58.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/58/scan-58.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/58/scan-58.stdout.log")
   :BYTES 4278 :SHA256
   "ffd67649e134199dc6852e2eff17ee7152c8ac76249b59fdc8e12a929939b714")
  (:PATH "raw/evidence-check-yBEaQa/58/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/58/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/58/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/58/stdout.lisp")
   :BYTES 236 :SHA256
   "3c08d195cdf9b633a868bbceac1c375f41ec16e596185e68b9a9ab203eefceef")
  (:PATH "raw/evidence-check-yBEaQa/59/scan-59.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/59/scan-59.lisp")
   :BYTES 372 :SHA256
   "757ac0504a38512e80e3812113728c1ef256a0ab5093933324ee165e06a2f72e")
  (:PATH "raw/evidence-check-yBEaQa/59/scan-59.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/59/scan-59.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/59/scan-59.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/59/scan-59.stdout.log")
   :BYTES 4278 :SHA256
   "1c8ab833ee096f2e0c72a726d17d03bcfa9fe2ce135e785f8c63e23e8d8c3a85")
  (:PATH "raw/evidence-check-yBEaQa/59/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/59/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/59/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/59/stdout.lisp")
   :BYTES 217 :SHA256
   "1b1a49ab3006bfde00d2d5e381c1f28d0b3a6eb9f01f3b94a3bf70821d4716a9")
  (:PATH "raw/evidence-check-yBEaQa/6/scan-5.lisp.txt" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/6/scan-5.lisp")
   :BYTES 368 :SHA256
   "9037caa02b05648e2d1e1769fd76f51027530c448bacd8aa76260349b513d4c9")
  (:PATH "raw/evidence-check-yBEaQa/6/scan-5.stderr.log" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/6/scan-5.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/6/scan-5.stdout.log" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/6/scan-5.stdout.log")
   :BYTES 4302 :SHA256
   "19fef17efcb913486a300be835034a4bf877842a1ac2b8936ab8a326f7d808a6")
  (:PATH "raw/evidence-check-yBEaQa/6/stderr.log" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/6/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/6/stdout.lisp.txt" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/6/stdout.lisp")
   :BYTES 208 :SHA256
   "d034f4ad2bd80481a11b3108c6ab0fdd8daa4fa9d4ce93017084d5706b232ba3")
  (:PATH "raw/evidence-check-yBEaQa/60/scan-60.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/60/scan-60.lisp")
   :BYTES 372 :SHA256
   "05a7eb2a61a1ddbc587a92d9466b3abb6a10aadfb56577eafaaf3c71ff6992e3")
  (:PATH "raw/evidence-check-yBEaQa/60/scan-60.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/60/scan-60.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/60/scan-60.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/60/scan-60.stdout.log")
   :BYTES 4278 :SHA256
   "41ae5643c5f578990efc6b8d2209d516b2e711ad23580d92fddfa62f351fc573")
  (:PATH "raw/evidence-check-yBEaQa/60/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/60/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/60/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/60/stdout.lisp")
   :BYTES 211 :SHA256
   "650d5843ddc81f6ee64ee0c52790a5c7ba96ee22596504867b1914eb2cad4213")
  (:PATH "raw/evidence-check-yBEaQa/61/scan-96.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/61/scan-96.lisp")
   :BYTES 372 :SHA256
   "b22352af103ec1df4889a29f3e37468a4e8ff946ee545c132f6e6d2d87c1b8c7")
  (:PATH "raw/evidence-check-yBEaQa/61/scan-96.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/61/scan-96.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/61/scan-96.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/61/scan-96.stdout.log")
   :BYTES 4284 :SHA256
   "d92971a2cde9fe35e01123bccc21c7a1809e18d1ce9cbb11d85a4336eab9a035")
  (:PATH "raw/evidence-check-yBEaQa/61/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/61/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/61/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/61/stdout.lisp")
   :BYTES 215 :SHA256
   "4ad764beacdaae8c596f583a9c9d135d4e25c2657de332f0ef3845257b3c1e65")
  (:PATH "raw/evidence-check-yBEaQa/62/scan-66.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/62/scan-66.lisp")
   :BYTES 372 :SHA256
   "9893c0be28b0f25c458a36878939f53eaa00eb64622020df160cec60e6296f6c")
  (:PATH "raw/evidence-check-yBEaQa/62/scan-66.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/62/scan-66.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/62/scan-66.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/62/scan-66.stdout.log")
   :BYTES 4284 :SHA256
   "4024e0e7a92f84c62eebe8cb9779927a9592e1d2dc5e8f58a5381c04fc1c83d3")
  (:PATH "raw/evidence-check-yBEaQa/62/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/62/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/62/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/62/stdout.lisp")
   :BYTES 216 :SHA256
   "ac68666d6dbc192d4041c19deacd29f81eb2db36f2aedce452c65bca7cb5f675")
  (:PATH "raw/evidence-check-yBEaQa/63/scan-62.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/63/scan-62.lisp")
   :BYTES 372 :SHA256
   "d796b016194bf06eed620663d2d380d69facf143f5f28c11900229d8a9e0b551")
  (:PATH "raw/evidence-check-yBEaQa/63/scan-62.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/63/scan-62.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/63/scan-62.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/63/scan-62.stdout.log")
   :BYTES 4284 :SHA256
   "0f77e45cbfbab9fc7ecb62f3b8b032f74c0185d7e0be81371a4fe007a54120b9")
  (:PATH "raw/evidence-check-yBEaQa/63/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/63/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/63/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/63/stdout.lisp")
   :BYTES 211 :SHA256
   "8077df8fa32c1a574a3a3e787c9f5adaf5fc0fbf2156b566cee9fe2d921267ca")
  (:PATH "raw/evidence-check-yBEaQa/64/scan-63.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/64/scan-63.lisp")
   :BYTES 372 :SHA256
   "56c863d093da76e86d74ae1dff95e52361de02ff673a960912a5f5cdf857ef4a")
  (:PATH "raw/evidence-check-yBEaQa/64/scan-63.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/64/scan-63.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/64/scan-63.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/64/scan-63.stdout.log")
   :BYTES 4272 :SHA256
   "3ad04b99ab927dd9b64f834858ddee3d764855ee206667122e389d2adf23fa25")
  (:PATH "raw/evidence-check-yBEaQa/64/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/64/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/64/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/64/stdout.lisp")
   :BYTES 213 :SHA256
   "e8f12f9edcca7de4744cfbe33694e7e8936cd22dcac0bc9e356dfe9ffb9ff63c")
  (:PATH "raw/evidence-check-yBEaQa/65/scan-64.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/65/scan-64.lisp")
   :BYTES 372 :SHA256
   "e241c68df24aeeb7e352f45557b6291c0ef1b7f365a433293bfeca681ff8e3a8")
  (:PATH "raw/evidence-check-yBEaQa/65/scan-64.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/65/scan-64.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/65/scan-64.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/65/scan-64.stdout.log")
   :BYTES 4272 :SHA256
   "5db22b3c97d67209def0c9f4b912777a157ffa6f685fc596b62d0f744258b6a0")
  (:PATH "raw/evidence-check-yBEaQa/65/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/65/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/65/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/65/stdout.lisp")
   :BYTES 217 :SHA256
   "9f2ba4dcb38da4407999867ac70857060cfc3f34d05d3902694a95d579133ca3")
  (:PATH "raw/evidence-check-yBEaQa/66/scan-73.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/66/scan-73.lisp")
   :BYTES 372 :SHA256
   "c43d0a52e06a408567781ba621e24a7de41b923a5b9ee92cda93ade82ef82d30")
  (:PATH "raw/evidence-check-yBEaQa/66/scan-73.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/66/scan-73.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/66/scan-73.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/66/scan-73.stdout.log")
   :BYTES 4284 :SHA256
   "b9d9d38617dd11727f1806b2e0122ed479e45872fad7f55f801557dc7321f776")
  (:PATH "raw/evidence-check-yBEaQa/66/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/66/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/66/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/66/stdout.lisp")
   :BYTES 209 :SHA256
   "ee74446962e8a6f3dab94136a111eb1c985625e7863e3b45899c5789f82a1cd0")
  (:PATH "raw/evidence-check-yBEaQa/67/scan-65.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/67/scan-65.lisp")
   :BYTES 372 :SHA256
   "c955fe03ab3a1d6f949c10ea26c4afa71381767c80151e653420866ce53eb2fa")
  (:PATH "raw/evidence-check-yBEaQa/67/scan-65.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/67/scan-65.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/67/scan-65.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/67/scan-65.stdout.log")
   :BYTES 4272 :SHA256
   "9e0f6000e116ce577f4a5979d314592a63c33144abf0609a7244e85f2ca2668c")
  (:PATH "raw/evidence-check-yBEaQa/67/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/67/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/67/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/67/stdout.lisp")
   :BYTES 220 :SHA256
   "d6a82a591ced79783010211f26029eb8bbbcc1424b3651de28931cf466e77900")
  (:PATH "raw/evidence-check-yBEaQa/68/scan-68.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/68/scan-68.lisp")
   :BYTES 372 :SHA256
   "5b1d6d3159e7abfa0b3ca61d087b84bdc63150538bed4abe04941c156b189ce7")
  (:PATH "raw/evidence-check-yBEaQa/68/scan-68.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/68/scan-68.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/68/scan-68.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/68/scan-68.stdout.log")
   :BYTES 4272 :SHA256
   "46c199c20c06ade215bbee1fa5382d2053424de0ddc0e151c8345b731b650bc1")
  (:PATH "raw/evidence-check-yBEaQa/68/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/68/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/68/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/68/stdout.lisp")
   :BYTES 228 :SHA256
   "39c95d6c6aa563345896d9a374d0819c4c5aa45674114e2aa5598846342ab116")
  (:PATH "raw/evidence-check-yBEaQa/69/scan-67.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/69/scan-67.lisp")
   :BYTES 372 :SHA256
   "1beafff42a518312cdebbf0d7dd1ab33340d98d64572626ee853ecf8c4455083")
  (:PATH "raw/evidence-check-yBEaQa/69/scan-67.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/69/scan-67.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/69/scan-67.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/69/scan-67.stdout.log")
   :BYTES 4278 :SHA256
   "330a1a1bc8a47aef97924a15b5ef69de2ebde0c3e03cd8a3de6b84718b3a061e")
  (:PATH "raw/evidence-check-yBEaQa/69/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/69/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/69/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/69/stdout.lisp")
   :BYTES 215 :SHA256
   "f8fdc03e0e9bc013c37e3a29fdf8d1edb864880051a028e1b9908ab6ff677ba2")
  (:PATH "raw/evidence-check-yBEaQa/7/scan-16.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/7/scan-16.lisp")
   :BYTES 370 :SHA256
   "c3b9526a5381c1620b018c67024edc0f7cb24538acee84c8c9065c7c59dc7ce0")
  (:PATH "raw/evidence-check-yBEaQa/7/scan-16.stderr.log" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/7/scan-16.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/7/scan-16.stdout.log" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/7/scan-16.stdout.log")
   :BYTES 4296 :SHA256
   "0a186136e1a13c868a1c2c3015f5e1d457d40f3cb95cc35e3816c21d1aecc6ef")
  (:PATH "raw/evidence-check-yBEaQa/7/stderr.log" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/7/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/7/stdout.lisp.txt" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/7/stdout.lisp")
   :BYTES 205 :SHA256
   "b4986b8b2affa23bcddcced3ee2c04ace6e03f8f204b6d55c78b69acbff6bc68")
  (:PATH "raw/evidence-check-yBEaQa/70/scan-69.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/70/scan-69.lisp")
   :BYTES 372 :SHA256
   "71cbb20ddee2a0a3b4d532f8620ebad413414e7d631f62bd45ddca7ee64f239d")
  (:PATH "raw/evidence-check-yBEaQa/70/scan-69.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/70/scan-69.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/70/scan-69.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/70/scan-69.stdout.log")
   :BYTES 4272 :SHA256
   "1a3b4dd630f53fcea4202d903e85768e03b9c98e82933086f45427937ee2f8b1")
  (:PATH "raw/evidence-check-yBEaQa/70/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/70/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/70/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/70/stdout.lisp")
   :BYTES 234 :SHA256
   "76f630ec470ff5f465e1a67cde545b90bb45e9e0bb2e4fda4e9856bd8d34dda3")
  (:PATH "raw/evidence-check-yBEaQa/71/scan-70.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/71/scan-70.lisp")
   :BYTES 372 :SHA256
   "6ab4029dda8cb6cd2ffaae11df6caac99bdf97d47696c54ef316c17781d985e1")
  (:PATH "raw/evidence-check-yBEaQa/71/scan-70.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/71/scan-70.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/71/scan-70.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/71/scan-70.stdout.log")
   :BYTES 4278 :SHA256
   "ce923ea68d09ed1e11b68fd875dd8ba982bf2a11deda09b556312cc5e7b78b7f")
  (:PATH "raw/evidence-check-yBEaQa/71/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/71/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/71/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/71/stdout.lisp")
   :BYTES 227 :SHA256
   "3951f730e730e901a4342fb12c3e2a0227778c396cc9752ab652d7a61006284f")
  (:PATH "raw/evidence-check-yBEaQa/72/scan-71.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/72/scan-71.lisp")
   :BYTES 372 :SHA256
   "b962d8dc1f5735e491416d60a56c949703b90e6181da8c99f0229a1a2aceb5ab")
  (:PATH "raw/evidence-check-yBEaQa/72/scan-71.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/72/scan-71.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/72/scan-71.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/72/scan-71.stdout.log")
   :BYTES 4272 :SHA256
   "5129d2e44778dac485388a07cc143e7be0a6a45fc83c656ba0ca3b7fbbad5d9f")
  (:PATH "raw/evidence-check-yBEaQa/72/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/72/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/72/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/72/stdout.lisp")
   :BYTES 214 :SHA256
   "e137b97afb3a7097e14ee3330ead3b278d16d03556108e09d7d671a8ab50230b")
  (:PATH "raw/evidence-check-yBEaQa/73/scan-76.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/73/scan-76.lisp")
   :BYTES 372 :SHA256
   "bb688f68c4fa68b524b8e4974914ed48bd3df1024d69b2e9094c8ade4775bbbd")
  (:PATH "raw/evidence-check-yBEaQa/73/scan-76.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/73/scan-76.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/73/scan-76.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/73/scan-76.stdout.log")
   :BYTES 4272 :SHA256
   "ed4a3caf379dd35b9399a93a7e4e69cb1e457f55b41c591812d2fa13655f6c34")
  (:PATH "raw/evidence-check-yBEaQa/73/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/73/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/73/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/73/stdout.lisp")
   :BYTES 221 :SHA256
   "6fbdc9c5be9bf948d412f4b01da203c85aa761ddba1caaa87c3eabf3f0c28a3b")
  (:PATH "raw/evidence-check-yBEaQa/74/scan-72.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/74/scan-72.lisp")
   :BYTES 372 :SHA256
   "26dbbf3425edc72e489d01b800341fdbdd97895cc2adbed1a78068ab70723da9")
  (:PATH "raw/evidence-check-yBEaQa/74/scan-72.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/74/scan-72.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/74/scan-72.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/74/scan-72.stdout.log")
   :BYTES 4284 :SHA256
   "90d0008d1df700ecbb0e3588ff2abfa3847872305884283a8a183f3868a0f47d")
  (:PATH "raw/evidence-check-yBEaQa/74/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/74/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/74/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/74/stdout.lisp")
   :BYTES 212 :SHA256
   "8af51130fcf5547b0fdd0556643cfc73074d2ae9fb7139c0943daf6a1102a3c5")
  (:PATH "raw/evidence-check-yBEaQa/75/scan-74.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/75/scan-74.lisp")
   :BYTES 372 :SHA256
   "c8979d1180337de1127a31aebabf97985737d3c193d806c474d81a97b2782234")
  (:PATH "raw/evidence-check-yBEaQa/75/scan-74.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/75/scan-74.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/75/scan-74.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/75/scan-74.stdout.log")
   :BYTES 4284 :SHA256
   "f3e80e3a4ca8c28198ab0f544b446444f361fd4677b2566c8c47580c510e4f30")
  (:PATH "raw/evidence-check-yBEaQa/75/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/75/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/75/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/75/stdout.lisp")
   :BYTES 222 :SHA256
   "401dac01251a7d0c70819cad47039a8d1fde434b1adaf7002123fc07e399f4e8")
  (:PATH "raw/evidence-check-yBEaQa/76/scan-75.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/76/scan-75.lisp")
   :BYTES 372 :SHA256
   "58360872ab1687558ede453c6fb7a9a35008838310e3ec5270efa8b0dd3a3982")
  (:PATH "raw/evidence-check-yBEaQa/76/scan-75.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/76/scan-75.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/76/scan-75.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/76/scan-75.stdout.log")
   :BYTES 4278 :SHA256
   "62f6edd07e91f1c4e0d4a16c6d3575a25695cae9979ccf10455fa4c09c078370")
  (:PATH "raw/evidence-check-yBEaQa/76/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/76/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/76/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/76/stdout.lisp")
   :BYTES 216 :SHA256
   "7d1ca3f151bbcf093ec037c7cb0ba13a6def77ae646975614487e2ced3d9352c")
  (:PATH "raw/evidence-check-yBEaQa/77/scan-77.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/77/scan-77.lisp")
   :BYTES 372 :SHA256
   "ca7af31c684fc71c90d8aefd717f6f80aeae1b0ef5249ee0b56428c3591b858e")
  (:PATH "raw/evidence-check-yBEaQa/77/scan-77.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/77/scan-77.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/77/scan-77.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/77/scan-77.stdout.log")
   :BYTES 4278 :SHA256
   "939da03495883a758d691fb1da9ff9eb78c0f2e25bc245c46660f47b187940ee")
  (:PATH "raw/evidence-check-yBEaQa/77/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/77/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/77/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/77/stdout.lisp")
   :BYTES 222 :SHA256
   "46d59b5baad8092e6aa9b4ef18ebc13f42edbac69df53c7a9adbe9eae717411c")
  (:PATH "raw/evidence-check-yBEaQa/78/scan-78.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/78/scan-78.lisp")
   :BYTES 372 :SHA256
   "a1f2ef9b26ebce2bee551757122029a9a5d97eb4f37488bbcb31ab7b36f10b8e")
  (:PATH "raw/evidence-check-yBEaQa/78/scan-78.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/78/scan-78.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/78/scan-78.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/78/scan-78.stdout.log")
   :BYTES 4278 :SHA256
   "9ed9688426dcb8bf14c6a21f22b3dfda37297642d862426930527966333e0aa2")
  (:PATH "raw/evidence-check-yBEaQa/78/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/78/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/78/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/78/stdout.lisp")
   :BYTES 216 :SHA256
   "4da3fdfbb0cbf0f9541d17daf01d96c7da98c1f734f9dc6d809f99098d748d3d")
  (:PATH "raw/evidence-check-yBEaQa/79/scan-79.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/79/scan-79.lisp")
   :BYTES 372 :SHA256
   "3b4969541c1bb738c2d03756d0528ecf9cbf67453c28307861b1a34df5081f84")
  (:PATH "raw/evidence-check-yBEaQa/79/scan-79.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/79/scan-79.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/79/scan-79.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/79/scan-79.stdout.log")
   :BYTES 4278 :SHA256
   "9bdfdb33ec4e33e8a019d07689c82af700589d382d00b060e046e3cc540b3731")
  (:PATH "raw/evidence-check-yBEaQa/79/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/79/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/79/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/79/stdout.lisp")
   :BYTES 219 :SHA256
   "7fadbd8f65ec3f1c9565d539c41c986e895ddc9f0f879c91741d0119433b0743")
  (:PATH "raw/evidence-check-yBEaQa/8/scan-6.lisp.txt" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/8/scan-6.lisp")
   :BYTES 368 :SHA256
   "8a79d7c0e5b913e3216a51562d74ddb649ec78e0df4b325ab762d3a8ce73751c")
  (:PATH "raw/evidence-check-yBEaQa/8/scan-6.stderr.log" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/8/scan-6.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/8/scan-6.stdout.log" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/8/scan-6.stdout.log")
   :BYTES 4296 :SHA256
   "5b7054129645c64b0174541918e75917dbf7fa6006fd328e33f5c94d76af88a9")
  (:PATH "raw/evidence-check-yBEaQa/8/stderr.log" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/8/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/8/stdout.lisp.txt" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/8/stdout.lisp")
   :BYTES 200 :SHA256
   "9954d462c951f70c485b97f5fca36f7ec0aaec8f3ad2d67064ea218cdc746203")
  (:PATH "raw/evidence-check-yBEaQa/80/scan-80.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/80/scan-80.lisp")
   :BYTES 372 :SHA256
   "88402b6b4d167e662a2bba9090f3ff5facf96047bc0b0581196847d075458ace")
  (:PATH "raw/evidence-check-yBEaQa/80/scan-80.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/80/scan-80.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/80/scan-80.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/80/scan-80.stdout.log")
   :BYTES 4278 :SHA256
   "0e8f7ed275ee0196554432422f8ecc146f0147217e3360d50a7c601d81d53cdf")
  (:PATH "raw/evidence-check-yBEaQa/80/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/80/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/80/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/80/stdout.lisp")
   :BYTES 220 :SHA256
   "36eeabba82236b71ff1481629d692d29679c44bc0e94ed5558fd27a6b409904a")
  (:PATH "raw/evidence-check-yBEaQa/81/scan-81.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/81/scan-81.lisp")
   :BYTES 372 :SHA256
   "a17db7314edf3995bad21614b2398f50f67409192659adf8a76086c14800f6a9")
  (:PATH "raw/evidence-check-yBEaQa/81/scan-81.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/81/scan-81.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/81/scan-81.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/81/scan-81.stdout.log")
   :BYTES 4272 :SHA256
   "354b2e5af53d55ec1fed1fafe79535fb917419f221865436b27c308ffed5984f")
  (:PATH "raw/evidence-check-yBEaQa/81/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/81/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/81/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/81/stdout.lisp")
   :BYTES 214 :SHA256
   "4c4aaacd6e0971e34eeb7ac23217780654bdd831aa77ee4ada50b086fae2420b")
  (:PATH "raw/evidence-check-yBEaQa/82/scan-82.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/82/scan-82.lisp")
   :BYTES 372 :SHA256
   "8d090181569a479439fa66fed61bc3d16483432881afb0e7e7e671b9abc39306")
  (:PATH "raw/evidence-check-yBEaQa/82/scan-82.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/82/scan-82.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/82/scan-82.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/82/scan-82.stdout.log")
   :BYTES 4278 :SHA256
   "db27c74037f34256f95418746d95d8b13a9ccc51f624b2bd926470eeaa5e6ac6")
  (:PATH "raw/evidence-check-yBEaQa/82/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/82/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/82/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/82/stdout.lisp")
   :BYTES 217 :SHA256
   "2893e8f9af72b790d9a9eb58a60b1dec512d55ee38fb7dbe262652fad75160d1")
  (:PATH "raw/evidence-check-yBEaQa/83/scan-83.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/83/scan-83.lisp")
   :BYTES 372 :SHA256
   "f6244d296b865c550e584e85d0b5e90bcbd22e1643ed086d1a99096fde8348bc")
  (:PATH "raw/evidence-check-yBEaQa/83/scan-83.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/83/scan-83.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/83/scan-83.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/83/scan-83.stdout.log")
   :BYTES 4284 :SHA256
   "230dc34e05d2ba73c069b6d2831c3ab147c085bbd2dbfcbe8fd93d93091e0b2d")
  (:PATH "raw/evidence-check-yBEaQa/83/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/83/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/83/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/83/stdout.lisp")
   :BYTES 223 :SHA256
   "5fc96a0317147f5db31ca9aa3736f4441452689002a48c3ee156bb665ad11c2d")
  (:PATH "raw/evidence-check-yBEaQa/84/scan-84.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/84/scan-84.lisp")
   :BYTES 372 :SHA256
   "d149f791767af63552fc4e07fe839ba2053637383820a38f1de4efa836bb5d45")
  (:PATH "raw/evidence-check-yBEaQa/84/scan-84.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/84/scan-84.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/84/scan-84.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/84/scan-84.stdout.log")
   :BYTES 4278 :SHA256
   "e81e60f9436d26646429f5b44ca793a5638f93f23dca09383b8ad05ca54db424")
  (:PATH "raw/evidence-check-yBEaQa/84/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/84/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/84/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/84/stdout.lisp")
   :BYTES 216 :SHA256
   "b8b868c5be960e312b3b0dc9c3a2328b89c9312ed162b70e8def1013995d959f")
  (:PATH "raw/evidence-check-yBEaQa/85/scan-85.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/85/scan-85.lisp")
   :BYTES 372 :SHA256
   "512d1802cf6a976c24179d41610545a975c8b228f2f7d005a4106b116d70a869")
  (:PATH "raw/evidence-check-yBEaQa/85/scan-85.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/85/scan-85.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/85/scan-85.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/85/scan-85.stdout.log")
   :BYTES 4278 :SHA256
   "384a250a6be6d2fb72c100f86cce76a3008a8408560f635c829bc161c8a69386")
  (:PATH "raw/evidence-check-yBEaQa/85/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/85/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/85/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/85/stdout.lisp")
   :BYTES 229 :SHA256
   "b35b10c59459a25a82d39e37c6c3dbb5df76346bb60c475749c3279c157a34d9")
  (:PATH "raw/evidence-check-yBEaQa/86/scan-86.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/86/scan-86.lisp")
   :BYTES 372 :SHA256
   "94044947bf619004685e1e545dc7e677ce85b372c3032098e9d84320ece9aa67")
  (:PATH "raw/evidence-check-yBEaQa/86/scan-86.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/86/scan-86.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/86/scan-86.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/86/scan-86.stdout.log")
   :BYTES 4278 :SHA256
   "feee17cf580fbc5a40046bef7f5aaa443ee18a52c20fc309bc959ca3f6ae79b1")
  (:PATH "raw/evidence-check-yBEaQa/86/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/86/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/86/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/86/stdout.lisp")
   :BYTES 222 :SHA256
   "6e4ed4671474e6d68794f50a29f3276ef2e344941937ab2e117ae9b8cd03b3d8")
  (:PATH "raw/evidence-check-yBEaQa/87/scan-88.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/87/scan-88.lisp")
   :BYTES 372 :SHA256
   "782a5b6cb7297c0d6ea3b29680214b6108ceb82b0dc3eb02b8bb5f015a4f90f4")
  (:PATH "raw/evidence-check-yBEaQa/87/scan-88.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/87/scan-88.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/87/scan-88.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/87/scan-88.stdout.log")
   :BYTES 4272 :SHA256
   "ee0ef770b4fe8163003cbd2e0bdcb7a2bafab0b23ca32bc939e54b6dd0aa540e")
  (:PATH "raw/evidence-check-yBEaQa/87/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/87/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/87/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/87/stdout.lisp")
   :BYTES 217 :SHA256
   "5f9b8578ab8b7d9152212d2c4a54017eb0679ac555add4397872485a0637fc36")
  (:PATH "raw/evidence-check-yBEaQa/88/scan-87.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/88/scan-87.lisp")
   :BYTES 372 :SHA256
   "2e7bf45c1eaa27776b85337d310159556c8b0f82e62512665555ba7abe65ff35")
  (:PATH "raw/evidence-check-yBEaQa/88/scan-87.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/88/scan-87.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/88/scan-87.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/88/scan-87.stdout.log")
   :BYTES 4278 :SHA256
   "6b5f47846d5b1217996d61ec9042c8fc4fc3265838d51a4e7f1937e27f23d5d5")
  (:PATH "raw/evidence-check-yBEaQa/88/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/88/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/88/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/88/stdout.lisp")
   :BYTES 210 :SHA256
   "5aa3cecd5f18e447eeeadeb0ccf7bc71c4acf41564f139d9578fd65e71f6f709")
  (:PATH "raw/evidence-check-yBEaQa/89/scan-165.lisp.txt" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/89/scan-165.lisp")
   :BYTES 374 :SHA256
   "402d271d4bfd76c44ecd0924dd4a8d0465b2011a656b8319786beda5e2d10e0e")
  (:PATH "raw/evidence-check-yBEaQa/89/scan-165.stderr.log" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/89/scan-165.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/89/scan-165.stdout.log" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/89/scan-165.stdout.log")
   :BYTES 4260 :SHA256
   "faf860edd437a77cff1305297c8d6a3afd57e894a84de6856527054c59b9be06")
  (:PATH "raw/evidence-check-yBEaQa/89/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/89/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/89/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/89/stdout.lisp")
   :BYTES 217 :SHA256
   "3a5f96f13b590a5a74b7ec56df0595758afad6a1594cdda717159f5ea8bcf632")
  (:PATH "raw/evidence-check-yBEaQa/9/scan-7.lisp.txt" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/9/scan-7.lisp")
   :BYTES 368 :SHA256
   "d3a982947db70eb848d093d47cb1523d5e67894278b47c2ed48db10cd9ff3fa3")
  (:PATH "raw/evidence-check-yBEaQa/9/scan-7.stderr.log" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/9/scan-7.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/9/scan-7.stdout.log" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/9/scan-7.stdout.log")
   :BYTES 4302 :SHA256
   "975afc52d946db2367f14eaeee36af97f5c7516119297e7e140651bcecf7ad7d")
  (:PATH "raw/evidence-check-yBEaQa/9/stderr.log" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/9/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/9/stdout.lisp.txt" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/9/stdout.lisp")
   :BYTES 213 :SHA256
   "e34dc0029f7a9f0e2a0061c6e734552610129e15651524724f6f3ee533921d8d")
  (:PATH "raw/evidence-check-yBEaQa/90/scan-89.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/90/scan-89.lisp")
   :BYTES 372 :SHA256
   "8c14ade18e6c64debca7217108889217c2516c7aeaf68f9147832b2ceb2cef50")
  (:PATH "raw/evidence-check-yBEaQa/90/scan-89.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/90/scan-89.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/90/scan-89.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/90/scan-89.stdout.log")
   :BYTES 4284 :SHA256
   "492c1cb2cbd0786feafa69c24381b1d7434c3c612fff0ca7e904d76b463f081f")
  (:PATH "raw/evidence-check-yBEaQa/90/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/90/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/90/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/90/stdout.lisp")
   :BYTES 224 :SHA256
   "41a3ebdffa8c2f78e992c01f202a3d81a423f40071968e7d6ca9be67e3609215")
  (:PATH "raw/evidence-check-yBEaQa/91/scan-90.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/91/scan-90.lisp")
   :BYTES 372 :SHA256
   "48f092afbb87341bcf4ae4d88695740c202aab533b712e106e91c6c856e5ca49")
  (:PATH "raw/evidence-check-yBEaQa/91/scan-90.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/91/scan-90.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/91/scan-90.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/91/scan-90.stdout.log")
   :BYTES 4278 :SHA256
   "4abc6e37462e1718d892b95774ad2a74258879520093a68a9d2261afbfff15ce")
  (:PATH "raw/evidence-check-yBEaQa/91/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/91/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/91/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/91/stdout.lisp")
   :BYTES 220 :SHA256
   "6b69dc93d33e81d65125b37817fa7669cfbc2b96105b4c689d455cb01bd424e6")
  (:PATH "raw/evidence-check-yBEaQa/92/scan-91.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/92/scan-91.lisp")
   :BYTES 372 :SHA256
   "3b5129ec84fb3203d0b073d3f6df152a7342bdb67ca2ef5e3e375ba5be41190b")
  (:PATH "raw/evidence-check-yBEaQa/92/scan-91.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/92/scan-91.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/92/scan-91.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/92/scan-91.stdout.log")
   :BYTES 4296 :SHA256
   "b9f4f3684a81585431ac9d07f57773558b38b0e19b2ce1bf1b6c1989fa5cd4dc")
  (:PATH "raw/evidence-check-yBEaQa/92/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/92/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/92/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/92/stdout.lisp")
   :BYTES 223 :SHA256
   "5ab41d90287c95cfcb936e3c9f73ee8c7cd360daf4acd312a94b056879187f16")
  (:PATH "raw/evidence-check-yBEaQa/93/scan-95.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/93/scan-95.lisp")
   :BYTES 372 :SHA256
   "cafc3408b0dcd0165b95a63179683c1bbfe784f7613c37f745a908ebda12c80f")
  (:PATH "raw/evidence-check-yBEaQa/93/scan-95.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/93/scan-95.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/93/scan-95.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/93/scan-95.stdout.log")
   :BYTES 4290 :SHA256
   "73adacc991e8c6b1fdaae7c2dcf4d7c92fd934f5af219c2b997154b13c03430e")
  (:PATH "raw/evidence-check-yBEaQa/93/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/93/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/93/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/93/stdout.lisp")
   :BYTES 216 :SHA256
   "fe1dc069f47108b7ae2e53bed83d07b3128e30fe3ef2153f0e3b1ad76cbfccbe")
  (:PATH "raw/evidence-check-yBEaQa/94/scan-92.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/94/scan-92.lisp")
   :BYTES 372 :SHA256
   "01b72ab77ad3c536aad5cc5f1ecc5ce956b7d7d60931a871b25fbebc345a58bc")
  (:PATH "raw/evidence-check-yBEaQa/94/scan-92.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/94/scan-92.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/94/scan-92.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/94/scan-92.stdout.log")
   :BYTES 4290 :SHA256
   "172359a3c2a26690cdb9dc6c715d7a8902d295f149079df3863a79ede7539ed3")
  (:PATH "raw/evidence-check-yBEaQa/94/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/94/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/94/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/94/stdout.lisp")
   :BYTES 218 :SHA256
   "c1ad865f09022c4eef339f5ff5fde29cdbacb5113e2d0343443963d7d15cc80f")
  (:PATH "raw/evidence-check-yBEaQa/95/scan-93.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/95/scan-93.lisp")
   :BYTES 372 :SHA256
   "dc8b30202b8e9e3625e31780c18a45f3d23b8bb37052aacb8c5a0b44ac9a77cd")
  (:PATH "raw/evidence-check-yBEaQa/95/scan-93.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/95/scan-93.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/95/scan-93.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/95/scan-93.stdout.log")
   :BYTES 4284 :SHA256
   "2367a78b39be2b88edd0a1ed84afbcff64778c47170ac82d81d0e0d7cd7b1361")
  (:PATH "raw/evidence-check-yBEaQa/95/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/95/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/95/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/95/stdout.lisp")
   :BYTES 221 :SHA256
   "f20da68d5ae34833bce8a45de46ede930d202591e9434f8451b7b48fc0cebc86")
  (:PATH "raw/evidence-check-yBEaQa/96/scan-94.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/96/scan-94.lisp")
   :BYTES 372 :SHA256
   "682e4dd1340fb5015cdd9f2ce50cd04902442f7b13fd07b6f86dd53d3400f010")
  (:PATH "raw/evidence-check-yBEaQa/96/scan-94.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/96/scan-94.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/96/scan-94.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/96/scan-94.stdout.log")
   :BYTES 4290 :SHA256
   "f4bd1719529caf8bb684f8717a589cf3b6ee711c5a861bc020340244a5a38479")
  (:PATH "raw/evidence-check-yBEaQa/96/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/96/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/96/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/96/stdout.lisp")
   :BYTES 222 :SHA256
   "58b882cf94c505324900a67488ea962c2ba653ac9e366670e98a22eb5ce98d8d")
  (:PATH "raw/evidence-check-yBEaQa/97/scan-98.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/97/scan-98.lisp")
   :BYTES 372 :SHA256
   "e9df6445113646a245b956e10751219ab265f8041012f5a8eb6bf972fe97ab9c")
  (:PATH "raw/evidence-check-yBEaQa/97/scan-98.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/97/scan-98.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/97/scan-98.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/97/scan-98.stdout.log")
   :BYTES 4284 :SHA256
   "594e1b0328cc884be1519030c382ac06822e5b41d22a24bea3a69ec42465e3ed")
  (:PATH "raw/evidence-check-yBEaQa/97/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/97/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/97/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/97/stdout.lisp")
   :BYTES 216 :SHA256
   "f6c86af3d8730c530cdfce0d4b57670e8d2509ad87d681a7524f9f3b35ced200")
  (:PATH "raw/evidence-check-yBEaQa/98/scan-97.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/98/scan-97.lisp")
   :BYTES 372 :SHA256
   "1a6c675c9296bc6cff9b1d838426fd5d2946c1af5cec98baf799312a8663e193")
  (:PATH "raw/evidence-check-yBEaQa/98/scan-97.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/98/scan-97.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/98/scan-97.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/98/scan-97.stdout.log")
   :BYTES 4290 :SHA256
   "23b2d9f21daad3329519de16b07f2ecdeed2f3b7d3947ef47e1daa713e53d51b")
  (:PATH "raw/evidence-check-yBEaQa/98/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/98/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/98/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/98/stdout.lisp")
   :BYTES 214 :SHA256
   "71df97225e06b58f0f0fc38827c71b0ad426be40d6b4292531bd0b59135f2f23")
  (:PATH "raw/evidence-check-yBEaQa/99/scan-99.lisp.txt" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/99/scan-99.lisp")
   :BYTES 372 :SHA256
   "fec9c61fda5886743668a2b79c60bed68414a6b81261f713216ed7bc28b3e736")
  (:PATH "raw/evidence-check-yBEaQa/99/scan-99.stderr.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/99/scan-99.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/99/scan-99.stdout.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/99/scan-99.stdout.log")
   :BYTES 4278 :SHA256
   "86db39468fc181f959442a4845c4670f69a746cf7a270f7f4565b7957e3fd968")
  (:PATH "raw/evidence-check-yBEaQa/99/stderr.log" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/99/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/evidence-check-yBEaQa/99/stdout.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-check-yBEaQa/99/stdout.lisp")
   :BYTES 214 :SHA256
   "1adfdd88194fb80e4575597a5c5779163ed18aae6d529b4bca18af3b0c053887")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-01-equivalence-and-cli/case-result.lisp.txt"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-01-equivalence-and-cli/case-result.lisp")
   :BYTES 53 :SHA256
   "52d7d1b1fc5daf00792b231c55cc84a4473d34852d5a71811b937332dbe908aa")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-01-equivalence-and-cli/cli-jobs1.process.lisp.txt"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-01-equivalence-and-cli/cli-jobs1.process.lisp")
   :BYTES 938 :SHA256
   "780874f545cd3dd46a3df548091670c77fe3e4144de7c52e4b5909304b1cdc64")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-01-equivalence-and-cli/cli-jobs4.process.lisp.txt"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-01-equivalence-and-cli/cli-jobs4.process.lisp")
   :BYTES 938 :SHA256
   "7b11ea3620e6277f8970d297bcec3046f13502d2abb5945f9a4136973a2c9abb")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-02-jobs-0/case-result.lisp.txt"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-02-jobs-0/case-result.lisp")
   :BYTES 59 :SHA256
   "bdf7a1931b8ad32f9bd0bf987cf6477ef40b8604ccfc8e42927d0a94968c3bf9")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-03-jobs-5/case-result.lisp.txt"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-03-jobs-5/case-result.lisp")
   :BYTES 59 :SHA256
   "657601091437d2be6bf4ca5992805583d36f2a1a4e2ca12378d5d550536fd25c")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-04-cli-reject-3/case-result.lisp.txt"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-04-cli-reject-3/case-result.lisp")
   :BYTES 66 :SHA256
   "e7f87532b01cdb6f83591081aee4f5ed400a650f89be05eb495c32c79a44a2a5")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-04-cli-reject-3/cli-invalid.process.lisp.txt"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-04-cli-reject-3/cli-invalid.process.lisp")
   :BYTES 901 :SHA256
   "14cb390bb07feefd44b818dcd9fde1265ec64e33f6d473d8cb7f3ea1be06f26d")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-05-cli-reject-4/case-result.lisp.txt"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-05-cli-reject-4/case-result.lisp")
   :BYTES 66 :SHA256
   "547f992a3bd4372803f38c3ac52b8f81eda0f87ab5558224d3b854c3d670b0c6")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-05-cli-reject-4/cli-invalid.process.lisp.txt"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-05-cli-reject-4/cli-invalid.process.lisp")
   :BYTES 901 :SHA256
   "cd699129facdc0cb02aab6f056fcd106b0efd24f191aa78393a19ffb85998097")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-06-cli-reject-5/case-result.lisp.txt"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-06-cli-reject-5/case-result.lisp")
   :BYTES 66 :SHA256
   "2831863ce578bd5601acc9d98790c71f8a3884a8fd54cb071b4690ba642114b7")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-06-cli-reject-5/cli-invalid.process.lisp.txt"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-06-cli-reject-5/cli-invalid.process.lisp")
   :BYTES 911 :SHA256
   "d931488caff6851bbd74251c7b1b42bed4b35b41d1889d17836022edc44de5a2")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-07-cli-reject-6/case-result.lisp.txt"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-07-cli-reject-6/case-result.lisp")
   :BYTES 66 :SHA256
   "8cd2c4faf3648bae9cc6cc430a4c75112b46aed78f79b3348eaa94e51bc92c0b")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-07-cli-reject-6/cli-invalid.process.lisp.txt"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-07-cli-reject-6/cli-invalid.process.lisp")
   :BYTES 912 :SHA256
   "df5409138ebd8d6331bd0b7b9d78674f3bb555f3be9fb18a1aced81631c05ba0")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-08-cli-reject-7/case-result.lisp.txt"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-08-cli-reject-7/case-result.lisp")
   :BYTES 66 :SHA256
   "ece67f4e686bdb8aaa29067983f2cbdb282ea28d846284a936b73dd2ce3818d2")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-08-cli-reject-7/cli-invalid.process.lisp.txt"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-08-cli-reject-7/cli-invalid.process.lisp")
   :BYTES 897 :SHA256
   "d4cf8372c8814110cdba726432ae25b5388b7c7c5ee20630ee20ebcd6660da69")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-09-cli-reject-8/case-result.lisp.txt"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-09-cli-reject-8/case-result.lisp")
   :BYTES 66 :SHA256
   "27c8fbb023545ea843847c847126666df79cf3e76a734b1531d206b375b077b7")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-09-cli-reject-8/cli-invalid.process.lisp.txt"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-09-cli-reject-8/cli-invalid.process.lisp")
   :BYTES 907 :SHA256
   "1fe05e88b79978b6b8c3a4e1c42fc79b4af3b82133073723298e54fd66ae0265")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-10-invalid-leaf-9/case-result.lisp.txt"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-10-invalid-leaf-9/case-result.lisp")
   :BYTES 68 :SHA256
   "980339cff16566940b6d1e635ae30176b1324e4972b88cdecb2d96ca95689792")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-10-invalid-leaf-9/rejection-jobs1.lisp.txt"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-10-invalid-leaf-9/rejection-jobs1.lisp")
   :BYTES 97 :SHA256
   "7ea79ddde543aa674cb40f3af14cc185c9d5a3ad802ba305800974eba5a7fcef")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-10-invalid-leaf-9/rejection-jobs4.lisp.txt"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-10-invalid-leaf-9/rejection-jobs4.lisp")
   :BYTES 288 :SHA256
   "45d4377d7b68e2e30930b1030f910eaa575df0a9406432b075ea9e5690a1606c")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-11-invalid-leaf-10/case-result.lisp.txt"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-11-invalid-leaf-10/case-result.lisp")
   :BYTES 69 :SHA256
   "a00786a9676301d7ba85757f7d140c64f7a2ac15752961b872a1bc606a1e9151")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-11-invalid-leaf-10/rejection-jobs1.lisp.txt"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-11-invalid-leaf-10/rejection-jobs1.lisp")
   :BYTES 98 :SHA256
   "61aafc5b2be77b98ed4deb0fa7d35a58ae07c8bb71f7e47177e74058ede1c7e7")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-11-invalid-leaf-10/rejection-jobs4.lisp.txt"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-11-invalid-leaf-10/rejection-jobs4.lisp")
   :BYTES 290 :SHA256
   "b3fa31e5720b7682d9c42cd2c37fa8c28935a4152a56dd07177cd91ab12a25f2")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-12-invalid-leaf-11/case-result.lisp.txt"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-12-invalid-leaf-11/case-result.lisp")
   :BYTES 69 :SHA256
   "0f63bb2302b6649dae9209366ae78340a3514a3e99b82990b78ece1ef1b3dfe0")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-12-invalid-leaf-11/rejection-jobs1.lisp.txt"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-12-invalid-leaf-11/rejection-jobs1.lisp")
   :BYTES 99 :SHA256
   "347fb74f59ac7e18f6d4439b823e4740aa484911c124ef417919b538f6d9374a")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-12-invalid-leaf-11/rejection-jobs4.lisp.txt"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-12-invalid-leaf-11/rejection-jobs4.lisp")
   :BYTES 291 :SHA256
   "40b1f4e32dc6a22e7664a37849e6258ec89288641729e4675949f3985666b074")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-13-invalid-leaf-12/case-result.lisp.txt"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-13-invalid-leaf-12/case-result.lisp")
   :BYTES 69 :SHA256
   "45291a134a54826647d18c5b55bc2e424418e3d14eefec8b18c8fdeacfb23e6b")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-13-invalid-leaf-12/rejection-jobs1.lisp.txt"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-13-invalid-leaf-12/rejection-jobs1.lisp")
   :BYTES 111 :SHA256
   "8e947ba8e4fe4cbaf048eaca47559500a116e07e40a45dfcc86c5c6f4928adeb")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-13-invalid-leaf-12/rejection-jobs4.lisp.txt"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-13-invalid-leaf-12/rejection-jobs4.lisp")
   :BYTES 303 :SHA256
   "0fb01557f79c46def425a259f9dbc6e9ba598ac4cf2c740d4eac750a23973991")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-14-invalid-leaf-13/case-result.lisp.txt"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-14-invalid-leaf-13/case-result.lisp")
   :BYTES 69 :SHA256
   "b10ec2a08ef772e1097f72467c475b987f78fb0e5f9a298aee0df85f7f7e8e8f")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-14-invalid-leaf-13/rejection-jobs1.lisp.txt"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-14-invalid-leaf-13/rejection-jobs1.lisp")
   :BYTES 110 :SHA256
   "309249ceac30dd9a7015f8e630971ebc1a2e51e97c52e40abdb9a3f2459a0b2e")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-14-invalid-leaf-13/rejection-jobs4.lisp.txt"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-14-invalid-leaf-13/rejection-jobs4.lisp")
   :BYTES 302 :SHA256
   "bdab9db2861fc189b6b5c7d4fae1f8d5b63a18cbce530ae6bfd9373e609ecb13")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-15-invalid-leaf-14/case-result.lisp.txt"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-15-invalid-leaf-14/case-result.lisp")
   :BYTES 69 :SHA256
   "98e101a54330d5800c1dd7cdc1500fe787daa89c8be1dde896be68f047b7c689")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-15-invalid-leaf-14/rejection-jobs1.lisp.txt"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-15-invalid-leaf-14/rejection-jobs1.lisp")
   :BYTES 111 :SHA256
   "64b62a74c23394555a8db663c1348b671539d9721f6dc264f302fcf1e164d4ed")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-15-invalid-leaf-14/rejection-jobs4.lisp.txt"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-15-invalid-leaf-14/rejection-jobs4.lisp")
   :BYTES 303 :SHA256
   "1fe979b066930b3e2fdc47167e62bbb2b7cd28ce9e4f74fa9670f1021143a5c3")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-16-invalid-leaf-15/case-result.lisp.txt"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-16-invalid-leaf-15/case-result.lisp")
   :BYTES 69 :SHA256
   "01eb35ae6dcb8e052633126e2263f360874d2a16af234e63ba2e6c3b32878e8d")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-16-invalid-leaf-15/rejection-jobs1.lisp.txt"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-16-invalid-leaf-15/rejection-jobs1.lisp")
   :BYTES 98 :SHA256
   "6b32fd47c86859dd3114eb97909b482aeb9dc61f59abe1da09da3c900061482c")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-16-invalid-leaf-15/rejection-jobs4.lisp.txt"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-16-invalid-leaf-15/rejection-jobs4.lisp")
   :BYTES 290 :SHA256
   "6a86beafb6368ee04bf6a0e7bf2d92047f913492fda984d295c7a34fef337485")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-17-empty/case-result.lisp.txt"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-17-empty/case-result.lisp")
   :BYTES 58 :SHA256
   "61d1a12799d6fc8a4f4d37e782ca0cedab90445b0538242efc1a8e636570ac89")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-17-empty/rejection-jobs1.lisp.txt"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-17-empty/rejection-jobs1.lisp")
   :BYTES 256 :SHA256
   "c4ca81e81977c95c8a9ebc91e984f28f31e81e21b178c9be9fb40ed3ba95ced8")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-17-empty/rejection-jobs4.lisp.txt"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-17-empty/rejection-jobs4.lisp")
   :BYTES 433 :SHA256
   "cba88ad4ef0337c685bcc42317d3ffc0937e5f885f39a5ba763facb576a26374")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-18-schema/case-result.lisp.txt"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-18-schema/case-result.lisp")
   :BYTES 59 :SHA256
   "7dfe51f94ac9f554909a0f17af80b28ecbbcc557d853ea45f56f100490266cbd")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-18-schema/rejection-jobs1.lisp.txt"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-18-schema/rejection-jobs1.lisp")
   :BYTES 257 :SHA256
   "1bac70d3dd1d45663f052f134629fc3753d2361fd4bf6d4bc793d9b85e26847d")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-18-schema/rejection-jobs4.lisp.txt"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-18-schema/rejection-jobs4.lisp")
   :BYTES 435 :SHA256
   "9d29f7b567d79ca692474efeac8b3fcb7e024e52640520d1677cbaa3bf4bdd46")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-19-missing-artifact/case-result.lisp.txt"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-19-missing-artifact/case-result.lisp")
   :BYTES 70 :SHA256
   "b34f8416a4c8ece49d8fc5c062143a4c0011906e1a226d3ea425b08dbf43d532")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-19-missing-artifact/rejection-jobs1.lisp.txt"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-19-missing-artifact/rejection-jobs1.lisp")
   :BYTES 267 :SHA256
   "6405da66822579dbde11cb516423ba7a517d7956bfc7db0ce15a972c908ab0f6")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-19-missing-artifact/rejection-jobs4.lisp.txt"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-19-missing-artifact/rejection-jobs4.lisp")
   :BYTES 455 :SHA256
   "531528a9f9bc9b4547df49204fac84cc97e622c797c316fc84e2365600f1890e")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-20-missing-file/case-result.lisp.txt"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-20-missing-file/case-result.lisp")
   :BYTES 66 :SHA256
   "612c71c6fabaf2bac56287b6250db7a8610ce5bfb74079ec132d8daeff1851b3")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-20-missing-file/rejection-jobs1.lisp.txt"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-20-missing-file/rejection-jobs1.lisp")
   :BYTES 499 :SHA256
   "4805ba80accf784bf9c7258c9d64cc0f4ffc3e8d744d47dd8ac05bcda1ae77c1")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-20-missing-file/rejection-jobs4.lisp.txt"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-20-missing-file/rejection-jobs4.lisp")
   :BYTES 665 :SHA256
   "2568164e9372895ae1839a4e8e1c8554b65b952e0929e1d2a4b7c95142b1e2a2")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-21-artifact-schema/case-result.lisp.txt"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-21-artifact-schema/case-result.lisp")
   :BYTES 48 :SHA256
   "5b5b2e72493e8acc214de7f053106bac694352c86c070712cadddb79ca70dd37")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-21-artifact-schema/rejection-jobs1.lisp.txt"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-21-artifact-schema/rejection-jobs1.lisp")
   :BYTES 266 :SHA256
   "8f19b046ea77ef579d97c2409bc2b1b07c5c29eb28147b6886ccbb000dfde1b8")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-21-artifact-schema/rejection-jobs4.lisp.txt"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-21-artifact-schema/rejection-jobs4.lisp")
   :BYTES 453 :SHA256
   "799faada70b653cad0082bac8026d9c1facfc4778f1afbd03a2641a61e013690")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-22-no-catalog/case-result.lisp.txt"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-22-no-catalog/case-result.lisp")
   :BYTES 43 :SHA256
   "c412a393b3d7c7fd2925609402497af46f9b373855ce51b533b53ed6ba5e8b8d")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-22-no-catalog/rejection-jobs1.lisp.txt"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-22-no-catalog/rejection-jobs1.lisp")
   :BYTES 113 :SHA256
   "a2a08e28d318f7835a2314c052d94fd266e0b7a28be13a1bfd591bf7b62794ff")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-22-no-catalog/rejection-jobs4.lisp.txt"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-22-no-catalog/rejection-jobs4.lisp")
   :BYTES 113 :SHA256
   "3875bb8b7d93b71b9ca0118a4adc213ae45a248a43468d4eddb8ea39e7d52997")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-23-first-error-catalog-order/case-result.lisp.txt"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-23-first-error-catalog-order/case-result.lisp")
   :BYTES 59 :SHA256
   "3b9304daa2b05d9cc573440c6e078c9dfa4dee58bb93881e2374ac680703e1f5")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-23-first-error-catalog-order/rejection-jobs1.lisp.txt"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-23-first-error-catalog-order/rejection-jobs1.lisp")
   :BYTES 539 :SHA256
   "90473d00f4360286d530ac0b5d7056e9daefca9a048359d3624c645239ff330a")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-23-first-error-catalog-order/rejection-jobs4.lisp.txt"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-23-first-error-catalog-order/rejection-jobs4.lisp")
   :BYTES 718 :SHA256
   "1e5dbff91f4c234755770f6211fe8a7581e4dd7b3c8230abd541a0805c1ba0f2")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-24-read-eval/case-result.lisp.txt"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-24-read-eval/case-result.lisp")
   :BYTES 62 :SHA256
   "220d684b2f5c6be55f6e0f93755347c455a36d66493726cf92ca99450904de5b")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-24-read-eval/rejection-jobs1.lisp.txt"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-24-read-eval/rejection-jobs1.lisp")
   :BYTES 381 :SHA256
   "83526f92b033f079160796ddd1bab9bff029ae94d8d012ce7f9366307ac0cfac")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-24-read-eval/rejection-jobs4.lisp.txt"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-24-read-eval/rejection-jobs4.lisp")
   :BYTES 544 :SHA256
   "dd0adb0257959b4e9c71f8f446fd0a6cbc24d2ffe0e2fa4cf2237f8c3f1e04af")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-25-trailing/case-result.lisp.txt"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-25-trailing/case-result.lisp")
   :BYTES 61 :SHA256
   "57c9b49cdfb3eb89a962e4941e2ae46e8a74c7e39668361c0d0248ac1548f1b3")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-25-trailing/rejection-jobs1.lisp.txt"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-25-trailing/rejection-jobs1.lisp")
   :BYTES 291 :SHA256
   "07133fb63b113b3ee031f6ea314cfc3b3e8a917647e9072764f300a07e17ab26")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-25-trailing/rejection-jobs4.lisp.txt"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-25-trailing/rejection-jobs4.lisp")
   :BYTES 453 :SHA256
   "c4861ab402ce96f6fb1e7b688ec03a66bfe58e6db11a6ddd8a260320dff8857f")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-26-plain-global-size/case-result.lisp.txt"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-26-plain-global-size/case-result.lisp")
   :BYTES 50 :SHA256
   "b0e1cac8c56ca966134d36b787ed31ca3bcd321989e98f8f369a24ec67ad1765")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-26-plain-global-size/rejection-jobs1.lisp.txt"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-26-plain-global-size/rejection-jobs1.lisp")
   :BYTES 300 :SHA256
   "6ec49e6ff362c382116e202680020088d1e740ad3830ff5cb1515db37c62cd72")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-26-plain-global-size/rejection-jobs4.lisp.txt"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-26-plain-global-size/rejection-jobs4.lisp")
   :BYTES 300 :SHA256
   "cf2fb15d53f99caac72208001ad9bf053ecf0d68efea3e37aa1c9cec9ade39f8")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-27-gzip-global-size/case-result.lisp.txt"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-27-gzip-global-size/case-result.lisp")
   :BYTES 49 :SHA256
   "f511bc984ea10055d2feb668925d23a59ab2434d6121559a5427c00e8b7c6eed")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-27-gzip-global-size/rejection-jobs1.lisp.txt"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-27-gzip-global-size/rejection-jobs1.lisp")
   :BYTES 298 :SHA256
   "17015f8e81a1d80dd36584ff5dd8466a8fd1afd58bff74c4631d7afd022e7417")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-27-gzip-global-size/rejection-jobs4.lisp.txt"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-27-gzip-global-size/rejection-jobs4.lisp")
   :BYTES 298 :SHA256
   "8b7221f3373b382e63482881fb9db9b6383e5ab14797c74089ce78f0c1dd627a")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-28-compressed-positive/case-result.lisp.txt"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-28-compressed-positive/case-result.lisp")
   :BYTES 53 :SHA256
   "58340db460e00f73f1baf631889a5dceb4261abd12377709d5c2ab94a7f23edb")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-28-compressed-positive/prepare-gzip.process.lisp.txt"
   :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-28-compressed-positive/prepare-gzip.process.lisp")
   :BYTES 478 :SHA256
   "3c8e242c2b75891fb5d5190e2326f7247c206b97eb89593ad37411bd9734a8f9")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-29-compressed-hash/case-result.lisp.txt"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-29-compressed-hash/case-result.lisp")
   :BYTES 48 :SHA256
   "a3ab5b98e5f97681df857f3ab576bc745be341c638e92f5d3bc98a54756577c3")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-29-compressed-hash/prepare-gzip.process.lisp.txt"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-29-compressed-hash/prepare-gzip.process.lisp")
   :BYTES 470 :SHA256
   "dc7aa6f1f1887ac34d78063e586ce0032efe9374988ba363ab302b24ca8386e7")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-29-compressed-hash/rejection-jobs1.lisp.txt"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-29-compressed-hash/rejection-jobs1.lisp")
   :BYTES 329 :SHA256
   "3f5f3e89f1009408805b13e91a0fc6c3a4f6415806292874b1e7f95ac6fc4650")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-29-compressed-hash/rejection-jobs4.lisp.txt"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-29-compressed-hash/rejection-jobs4.lisp")
   :BYTES 495 :SHA256
   "4604d85821e91cadf34711041a701d0267aaaad8eda9d5c35eef0c3248e6fb05")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-30-compressed-payload-symlink-escape/case-result.lisp.txt"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-30-compressed-payload-symlink-escape/case-result.lisp")
   :BYTES 66 :SHA256
   "a3e076e9d66d14fc2494ac3971410df92fa2105925be8a7c602399c7883197a1")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-30-compressed-payload-symlink-escape/prepare-gzip.process.lisp.txt"
   :SOURCE
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-30-compressed-payload-symlink-escape/prepare-gzip.process.lisp")
   :BYTES 488 :SHA256
   "1e8e508062564261d141bacefe7893f4775c7b806a434814bbbd053663b57302")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-30-compressed-payload-symlink-escape/rejection-jobs1.lisp.txt"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-30-compressed-payload-symlink-escape/rejection-jobs1.lisp")
   :BYTES 698 :SHA256
   "957670ec73c19d99fc4217285a3f96cd3ee1b238f5d059cdb724cf47642cf092")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-30-compressed-payload-symlink-escape/rejection-jobs4.lisp.txt"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-30-compressed-payload-symlink-escape/rejection-jobs4.lisp")
   :BYTES 882 :SHA256
   "dc65095f3b96dcd57e554e3fca6f48ed411c10697827df7e94b24a57c8c619b8")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-31-worker-protocol-malformed/case-result.lisp.txt"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-31-worker-protocol-malformed/case-result.lisp")
   :BYTES 59 :SHA256
   "a1c7a82994ac34e0de81d07ae079710da4b110b23752577b396063fe29d2cd21")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-31-worker-protocol-malformed/protocol-rejection.lisp.txt"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-31-worker-protocol-malformed/protocol-rejection.lisp")
   :BYTES 707 :SHA256
   "c805b841ff52e178fee1e2d655d92e5af0a4760bdedcecb3a21c262104c9d4ca")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-32-worker-protocol-read-eval/case-result.lisp.txt"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-32-worker-protocol-read-eval/case-result.lisp")
   :BYTES 59 :SHA256
   "ba44dffad1086c742d4d85f447119cd2eac93ffdb89b87c92f6a730d43ee3f17")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-32-worker-protocol-read-eval/protocol-rejection.lisp.txt"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-32-worker-protocol-read-eval/protocol-rejection.lisp")
   :BYTES 576 :SHA256
   "c3afbf9784342ba130799fb8a30df5f9a5a3f3441f18b76c94a9a945867dcffd")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-33-worker-protocol-descriptor/case-result.lisp.txt"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-33-worker-protocol-descriptor/case-result.lisp")
   :BYTES 60 :SHA256
   "1d5a137d08b50ed4a3b668537ca4bc420b23f18e507cbbd7e2ebf94e6585de40")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-33-worker-protocol-descriptor/protocol-rejection.lisp.txt"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-33-worker-protocol-descriptor/protocol-rejection.lisp")
   :BYTES 685 :SHA256
   "d139ab3281cc3e25e53281ea0f44a948d7519a6333e13b8dac431aba49b2f1b4")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-34-worker-protocol-extra-key/case-result.lisp.txt"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-34-worker-protocol-extra-key/case-result.lisp")
   :BYTES 59 :SHA256
   "8a943d478e781dc160faf1af37b2992b54a09accc3eab800606de7175e502149")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-34-worker-protocol-extra-key/protocol-rejection.lisp.txt"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-34-worker-protocol-extra-key/protocol-rejection.lisp")
   :BYTES 576 :SHA256
   "7b50869249da5b619fd87d08c8fb56af1429e0b43ed42b258d5753858483da2c")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-35-worker-protocol-duplicate-key/case-result.lisp.txt"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-35-worker-protocol-duplicate-key/case-result.lisp")
   :BYTES 63 :SHA256
   "4b1ba7c2cd9015d477dd68eb109bfe547c51cc8bf9c515ef92953b1b3cbc4fad")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-35-worker-protocol-duplicate-key/protocol-rejection.lisp.txt"
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-35-worker-protocol-duplicate-key/protocol-rejection.lisp")
   :BYTES 584 :SHA256
   "db9741d68899555b0a9f194bcaba8672bd81c34247dd4f781641f4b114a010b2")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-36-process-bound-two/case-result.lisp.txt"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-36-process-bound-two/case-result.lisp")
   :BYTES 51 :SHA256
   "65636bcd79fa9816dc49a2aeb488a3b5915441205dd4c1d7cc180573dfbc35a1")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-36-process-bound-two/process-observations.lisp.txt"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-36-process-bound-two/process-observations.lisp")
   :BYTES 119 :SHA256
   "f9799e9bf3b58fc699c2782e91c8114bee7b43c7956b02ede62af16ab6aa94e8")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-37-process-bound-four/case-result.lisp.txt"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-37-process-bound-four/case-result.lisp")
   :BYTES 52 :SHA256
   "d01c0a3b0a582dbd959495c16e5b7600be66e178212f24dda5b73cfc121b8dc0")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-37-process-bound-four/process-observations.lisp.txt"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-37-process-bound-four/process-observations.lisp")
   :BYTES 167 :SHA256
   "060b701a1bc259b458a62dc3660fc563676a980c3ecba0424de6fd0e84f5a650")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-38-worker-timeout-cleanup/case-result.lisp.txt"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-38-worker-timeout-cleanup/case-result.lisp")
   :BYTES 56 :SHA256
   "335220ff8daad3215fb3a96694de2cb0b7f99cf806070e796eb0ac1aece800bb")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-39-session-timeout-grandchild-other-group/case-result.lisp.txt"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-39-session-timeout-grandchild-other-group/case-result.lisp")
   :BYTES 72 :SHA256
   "5b4c299ebadd48ec191ab2ec5a71875e0b430a3c55ec9868da7f63b471cd5935")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-39-session-timeout-grandchild-other-group/session-observations.lisp.txt"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-39-session-timeout-grandchild-other-group/session-observations.lisp")
   :BYTES 416 :SHA256
   "3d1b03e28fba14d741513a92d4825d5571413ebd3b665e0067115d09c08bbd64")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-40-session-dead-leader-grandchild-other-group/case-result.lisp.txt"
   :SOURCE
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-40-session-dead-leader-grandchild-other-group/case-result.lisp")
   :BYTES 76 :SHA256
   "2186648f48be8f090c0703baaaae87261c380096b85bd4c9583a2d8fa58e3bf4")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-40-session-dead-leader-grandchild-other-group/session-observations.lisp.txt"
   :SOURCE
   #A((183) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-40-session-dead-leader-grandchild-other-group/session-observations.lisp")
   :BYTES 414 :SHA256
   "84e960f299f0c0185e023104899ec7080eea767d123877cd50178b32e970977f")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-41-process-scan-retry/case-result.lisp.txt"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-41-process-scan-retry/case-result.lisp")
   :BYTES 52 :SHA256
   "1d15bd07b3017a995f7f7361e20ff7ccc5b278ad8345b287636e607165725ae0")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-42-process-scan-failed/case-result.lisp.txt"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-42-process-scan-failed/case-result.lisp")
   :BYTES 53 :SHA256
   "d66159672d934d95da28405fe1063c7a15efcfcde8f11e58ec96daad05297212")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-42-process-scan-failed/scan-rejected.process.lisp.txt"
   :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-42-process-scan-failed/scan-rejected.process.lisp")
   :BYTES 793 :SHA256
   "c86a1e9a097fbcca1b939f8415199264d557b373516d197bec11e4df4b9b363d")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-42-process-scan-failed/scan-rejected.stdout.lisp.txt"
   :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-42-process-scan-failed/scan-rejected.stdout.lisp")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-43-process-scan-nonnumeric/case-result.lisp.txt"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-43-process-scan-nonnumeric/case-result.lisp")
   :BYTES 57 :SHA256
   "1dc5ffd35c282b41919a104fe4266853353aaeefcbd92a8202488c7add819052")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-43-process-scan-nonnumeric/scan-rejected.process.lisp.txt"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-43-process-scan-nonnumeric/scan-rejected.process.lisp")
   :BYTES 805 :SHA256
   "0812f68c28ec1604f6bba039821557ea77df5b8abdd16e0f257f67d41b741dae")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-43-process-scan-nonnumeric/scan-rejected.stdout.lisp.txt"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-43-process-scan-nonnumeric/scan-rejected.stdout.lisp")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-44-process-scan-empty/case-result.lisp.txt"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-44-process-scan-empty/case-result.lisp")
   :BYTES 52 :SHA256
   "1f29b7f44bb94c83325257d26779d4b67a629ef7077a9958e0cb4e052cc37fcf")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-44-process-scan-empty/scan-rejected.process.lisp.txt"
   :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-44-process-scan-empty/scan-rejected.process.lisp")
   :BYTES 790 :SHA256
   "dde267afd0191b9b81a9f3b2dcc8e1a20cfaeb3dd75fb468250ff31390bd6f64")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-44-process-scan-empty/scan-rejected.stdout.lisp.txt"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-44-process-scan-empty/scan-rejected.stdout.lisp")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-45-process-scan-generic-error-propagates/case-result.lisp.txt"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-45-process-scan-generic-error-propagates/case-result.lisp")
   :BYTES 70 :SHA256
   "1f9380401124e3096a9f5f75a47018b7a5960700e9c84e6ae7ff501328208609")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-45-process-scan-generic-error-propagates/propagation-observations.lisp.txt"
   :SOURCE
   #A((182) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-45-process-scan-generic-error-propagates/propagation-observations.lisp")
   :BYTES 120 :SHA256
   "2feac1c664b9d92d4dca9f6d99e0533a06e7e2f2c0e17c505ae5e614960e8ea7")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-46-process-scan-timeout-propagates/case-result.lisp.txt"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-46-process-scan-timeout-propagates/case-result.lisp")
   :BYTES 64 :SHA256
   "3970c80b6c8f0e9144b1e06279b050c0fe0ce6e3caf59ade2406e1864bbe1a6f")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-46-process-scan-timeout-propagates/propagation-observations.lisp.txt"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-46-process-scan-timeout-propagates/propagation-observations.lisp")
   :BYTES 122 :SHA256
   "71eca1d9ded4be95add000f7a51f5071f55cc5896591e89de561b19027e04b9e")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-47-cleanup-workers-error-then-timeout/case-result.lisp.txt"
   :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-47-cleanup-workers-error-then-timeout/case-result.lisp")
   :BYTES 67 :SHA256
   "a241bf1542e538e0db1c931e0953d1d544a6b7c28b0fbe3022398778fd509876")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-47-cleanup-workers-error-then-timeout/cleanup-observations.lisp.txt"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-47-cleanup-workers-error-then-timeout/cleanup-observations.lisp")
   :BYTES 598 :SHA256
   "553b982638a172f1cccb784680082053d7307ec80fba4912533033114c304076")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-48-cleanup-workers-timeout-then-error/case-result.lisp.txt"
   :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-48-cleanup-workers-timeout-then-error/case-result.lisp")
   :BYTES 67 :SHA256
   "3a3054bd1606e3c9e7149a61eab0f0cf4a8390b2179e0653141e94d18be9a01c")
  (:PATH
   "raw/evidence-parallel-self-test-iWjZr5/case-48-cleanup-workers-timeout-then-error/cleanup-observations.lisp.txt"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/case-48-cleanup-workers-timeout-then-error/cleanup-observations.lisp")
   :BYTES 600 :SHA256
   "b376a5531ab55ddbb4b596ad5027bdde5c6b9de66ebddbb6e0849a0e9699d4bd")
  (:PATH "raw/evidence-parallel-self-test-iWjZr5/report.lisp.txt" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/evidence-parallel-self-test-iWjZr5/report.lisp")
   :BYTES 3368 :SHA256
   "147acc5621df0dc8205a8d5082b285f53063cac60218493cff6932b3083e1355")
  (:PATH "report.md" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-bootstrap-input/report.md.txt")
   :BYTES 5508 :SHA256
   "3b17ac4a9e9bf872a7cbf1a3659bc685bb4de2c08c443726a924a29259adc7b0")
  (:PATH "summary.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/bootstrap-csn/ArcDocDB/spikes/out/runtime-bootstrap-input/summary.lisp")
   :BYTES 2603 :SHA256
   "7d0c345e43ceb94622226bda1aeb3ed9443c0b600308f8545dc1c1e9d76bf98a"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
