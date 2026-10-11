(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "preliminary" :RECORD-PATH "processes/preliminary/report.lisp"
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "make") #A((4) BASE-CHAR . "test")
    #A((4) BASE-CHAR . "lint") #A((5) BASE-CHAR . "trace")))
  (:LABEL "coverage-self" :RECORD-PATH "processes/coverage-self/report.lisp"
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((11) BASE-CHAR . "--self-test")
    #A((45) BASE-CHAR . "spikes/out/cbor-write-coverage-self-20261011/")))
  (:LABEL "mutator-self" :RECORD-PATH "processes/mutator-self/report.lisp"
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/cbor-write-mutation.lisp")
    #A((11) BASE-CHAR . "--self-test")))
  (:LABEL "benchmark" :RECORD-PATH "processes/benchmark/report.lisp" :STATUS
   :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((27) BASE-CHAR . "tools/cbor-write-bench.lisp")
    #A((7) BASE-CHAR . "--bench")))
  (:LABEL "coverage" :RECORD-PATH "processes/coverage/report.lisp" :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((8) BASE-CHAR . "--report")
    #A((40) BASE-CHAR . "spikes/out/cbor-write-coverage-20261011/")
    #A((10) BASE-CHAR . "cbor-write")))
  (:LABEL "mutations" :RECORD-PATH "processes/mutations/report.lisp" :STATUS
   :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/cbor-write-mutation.lisp")
    #A((5) BASE-CHAR . "--run")
    #A((41) BASE-CHAR . "spikes/out/cbor-write-mutations-20261011/")))
  (:LABEL "coverage-compaction" :RECORD-PATH
   "processes/coverage-compaction/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((27) BASE-CHAR . "tools/compact-evidence.lisp")
    #A((6) BASE-CHAR . "--root")
    #A((40) BASE-CHAR . "spikes/out/cbor-write-coverage-20261011/")
    #A((6) BASE-CHAR . "--jobs") #A((1) BASE-CHAR . "4")))
  (:LABEL "full-check" :RECORD-PATH "processes/full-check/report.lisp" :STATUS
   :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core")))
  (:LABEL "data-audit" :RECORD-PATH "processes/data-audit/report.lisp" :STATUS
   :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((18) BASE-CHAR . "--disable-debugger") #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "spikes/out/header-write-audit.lisp")
    #A((7) BASE-CHAR . "--audit")
    #A((51) BASE-CHAR . "spikes/out/header-write/audit-final-20261011-1.lisp")
    #A((49) BASE-CHAR . "spikes/out/4000703189-command-45999-0/report.lisp")
    #A((49) BASE-CHAR . "spikes/out/4000703222-command-46351-0/report.lisp")
    #A((40) BASE-CHAR . "spikes/out/cbor-write-coverage-20261011/")
    #A((49) BASE-CHAR . "spikes/out/4000703222-command-46352-0/report.lisp")
    #A((41) BASE-CHAR . "spikes/out/cbor-write-mutations-20261011/")))
  (:LABEL "data-audit-retry" :RECORD-PATH
   "processes/data-audit-retry/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((18) BASE-CHAR . "--disable-debugger") #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "spikes/out/header-write-audit.lisp")
    #A((7) BASE-CHAR . "--audit")
    #A((51) BASE-CHAR . "spikes/out/header-write/audit-final-20261011-2.lisp")
    #A((49) BASE-CHAR . "spikes/out/4000703189-command-45999-0/report.lisp")
    #A((49) BASE-CHAR . "spikes/out/4000703222-command-46351-0/report.lisp")
    #A((40) BASE-CHAR . "spikes/out/cbor-write-coverage-20261011/")
    #A((49) BASE-CHAR . "spikes/out/4000703222-command-46352-0/report.lisp")
    #A((41) BASE-CHAR . "spikes/out/cbor-write-mutations-20261011/"))))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write-collection-manifest.lisp")
   :BYTES 11013 :SHA256
   "86d5eaec52d0f3c4037f749425cbc2ee4b8eb3f8dc0c803384fc813bb2566dea")
  (:PATH "collection-source.lisp" :SOURCE
   #A((101) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/collect.lisp")
   :BYTES 9677 :SHA256
   "f59f7a52934c7fe6103b5047aade87214f17494e857fe35c568968c681790d81")
  (:PATH "processes/benchmark/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703189-command-45999-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "edf3dd2730fa64bc67f52958992bc9fae6f56d137a524fc97b7cc55a5f9a9b70")
  (:PATH "processes/benchmark/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703189-command-45999-0/report.lisp")
   :BYTES 149812 :SHA256
   "83f48c55072dfee6c46e8ce7e816310afc31479b11f5d58a70dd89aa288bef4a")
  (:PATH "processes/coverage-compaction/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703302-command-47820-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "da6273d775751d20f38a96d064a05fb6caeb187283e1611d9a4f283b8426986a")
  (:PATH "processes/coverage-compaction/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703302-command-47820-0/report.lisp")
   :BYTES 116386 :SHA256
   "892f46a583786bc17e543a963cd8b732c03e388c50f8258069546bba2c3d35d9")
  (:PATH "processes/coverage-self/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703155-command-45577-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "1f2edd67ea431ed8f2cedfd27f26ffe4a38954d004ca89716b81ffd1cfd919c3")
  (:PATH "processes/coverage-self/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703155-command-45577-0/report.lisp")
   :BYTES 115318 :SHA256
   "ed8db85b7494e49497fee5bc0e596fbabf5275f6cf10b162ff7cdd2d64a7ea1f")
  (:PATH "processes/coverage/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703222-command-46351-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "a5ba27bd0465a3116ef0c4112255b1c33e64566ce896542e74b52eee01a08057")
  (:PATH "processes/coverage/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703222-command-46351-0/report.lisp")
   :BYTES 117014 :SHA256
   "2cc420a249f9eeb733f381874e7077fd510db37fd83f6497d27e40736c66c300")
  (:PATH "processes/data-audit-retry/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703852-command-54505-0/conservazione.lisp")
   :BYTES 1155 :SHA256
   "0815647f3f2815c5cfc9183face731e50d799daafafe70c0ab999fa56b7641a7")
  (:PATH "processes/data-audit-retry/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703852-command-54505-0/report.lisp")
   :BYTES 115753 :SHA256
   "07113745b0a9769c85f7805dec85154bdb421cca84154daba6f9200f5bf8f4e0")
  (:PATH "processes/data-audit/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703699-command-52379-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "cffda6118ae74c214178239e346d2a58c536690f0d8675d415546cc3acb44b9e")
  (:PATH "processes/data-audit/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703699-command-52379-0/report.lisp")
   :BYTES 115758 :SHA256
   "92d5bb5b1d4794d7ed7884728d2220c96459fbdfc2ede922ac1c64033f45461e")
  (:PATH "processes/full-check/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703222-command-46375-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "7248399e4a48a9196da9fedfe6c4f27fa637ac87288cc2441ed84f793121e7cc")
  (:PATH "processes/full-check/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703222-command-46375-0/report.lisp")
   :BYTES 310884 :SHA256
   "2b757904dffe3fc3613834f6d92785546b460846db30b95bdfeb80ccec759608")
  (:PATH "processes/mutations/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703222-command-46352-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "0953cb2cf50f6fc77fe58c31a6afe6fe2badb9fa5fa242ade165002e4c9a6997")
  (:PATH "processes/mutations/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703222-command-46352-0/report.lisp")
   :BYTES 159588 :SHA256
   "e678f064d640fcb0738859e82c605c380a6e0c0e6920c549b02fa5e1f9b36cb4")
  (:PATH "processes/mutator-self/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703155-command-45578-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "d0ff3b44a4a694c914cd179852bd5098056278c177f07fba8b8bf2a38fe39d20")
  (:PATH "processes/mutator-self/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703155-command-45578-0/report.lisp")
   :BYTES 156824 :SHA256
   "a97d8fdfece229551ca679695bcf1ad444f88e240f347958b87adc0ec180a862")
  (:PATH "processes/preliminary/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703134-command-45454-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "ba1d2847549749c34ef2a4d1a543c0324f6287082e20a34670cbff19e277bbbc")
  (:PATH "processes/preliminary/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703134-command-45454-0/report.lisp")
   :BYTES 292961 :SHA256
   "a6c6962e504acce0c8cad067587437eceaa06e4d74646109f9946d6ce77025ac")
  (:PATH
   "raw/4000703156-cbor-write-worker-self-test-45616/baseline-copy/report.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703156-cbor-write-worker-self-test-45616/baseline-copy/report.lisp")
   :BYTES 502 :SHA256
   "e04f20829e11d4b798c9c5e8955febcb7447755eac1a8744a7ac8d3288d8b113")
  (:PATH
   "raw/4000703156-cbor-write-worker-self-test-45616/baseline-copy/test.log"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703156-cbor-write-worker-self-test-45616/baseline-copy/test.log")
   :BYTES 72 :SHA256
   "de0dbcd7f7ead42441ea8049fc98c4131badb83e7d506ec1dcbf65c5f390cf6f")
  (:PATH
   "raw/4000703156-cbor-write-worker-self-test-45616/baseline-transport/report.lisp"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703156-cbor-write-worker-self-test-45616/baseline-transport/report.lisp")
   :BYTES 517 :SHA256
   "21471d40d74f74707e296ff507d9adb5dea8022531b2a8f961982cbd90c62859")
  (:PATH
   "raw/4000703156-cbor-write-worker-self-test-45616/baseline-transport/test.log"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703156-cbor-write-worker-self-test-45616/baseline-transport/test.log")
   :BYTES 77 :SHA256
   "8db5a0350972541411a1e5939c72ccd8c01f29d66442dfef3cf75a6bc434356c")
  (:PATH
   "raw/4000703156-cbor-write-worker-self-test-45616/completion-exit/test.log"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703156-cbor-write-worker-self-test-45616/completion-exit/test.log")
   :BYTES 96 :SHA256
   "c0320463f598c4c5f11202e542c7617c216e7be84103be16768a503c83b17a95")
  (:PATH
   "raw/4000703156-cbor-write-worker-self-test-45616/completion-exit/tools/cbor-write-isolated-build.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703156-cbor-write-worker-self-test-45616/completion-exit/tools/cbor-write-isolated-build.lisp")
   :BYTES 184 :SHA256
   "1e3c5ad6ead59dcacdfb02c47ce2474eb44727271c8fcd8436fefe2dde8d0b61")
  (:PATH "raw/4000703156-cbor-write-worker-self-test-45616/report.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703156-cbor-write-worker-self-test-45616/report.lisp")
   :BYTES 1694 :SHA256
   "f9300d8ee4bf25552e335606a6b794424b0a17b6c81e0e88fca3e3ce82b9c1db")
  (:PATH "raw/4000703156-cbor-write-worker-self-test-45616/signal/test.log"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703156-cbor-write-worker-self-test-45616/signal/test.log")
   :BYTES 40 :SHA256
   "52ed427bbed0c5c928fa7e029bb609e785bb3a11329b9a8110255dbeb7c5f384")
  (:PATH
   "raw/4000703156-cbor-write-worker-self-test-45616/signal/tools/cbor-write-isolated-build.lisp"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703156-cbor-write-worker-self-test-45616/signal/tools/cbor-write-isolated-build.lisp")
   :BYTES 142 :SHA256
   "1ee0da58fd6e1dca7befab8f13b2c7c520b79e8d12dedc4e6a3f9bb926d5628b")
  (:PATH
   "raw/4000703223-cbor-write-worker-self-test-46417/baseline-copy/report.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703223-cbor-write-worker-self-test-46417/baseline-copy/report.lisp")
   :BYTES 502 :SHA256
   "88cd719ec2db786967b51fae2df0bcf90fe3b2407bc1a1489d16f1580beb2618")
  (:PATH
   "raw/4000703223-cbor-write-worker-self-test-46417/baseline-copy/test.log"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703223-cbor-write-worker-self-test-46417/baseline-copy/test.log")
   :BYTES 72 :SHA256
   "de0dbcd7f7ead42441ea8049fc98c4131badb83e7d506ec1dcbf65c5f390cf6f")
  (:PATH
   "raw/4000703223-cbor-write-worker-self-test-46417/baseline-transport/report.lisp"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703223-cbor-write-worker-self-test-46417/baseline-transport/report.lisp")
   :BYTES 517 :SHA256
   "f3b503a94ab1c57e9e4fc6bf1c951aa611160d1e050a2415531ac9f46ab9aa9e")
  (:PATH
   "raw/4000703223-cbor-write-worker-self-test-46417/baseline-transport/test.log"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703223-cbor-write-worker-self-test-46417/baseline-transport/test.log")
   :BYTES 77 :SHA256
   "8db5a0350972541411a1e5939c72ccd8c01f29d66442dfef3cf75a6bc434356c")
  (:PATH
   "raw/4000703223-cbor-write-worker-self-test-46417/completion-exit/test.log"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703223-cbor-write-worker-self-test-46417/completion-exit/test.log")
   :BYTES 96 :SHA256
   "c0320463f598c4c5f11202e542c7617c216e7be84103be16768a503c83b17a95")
  (:PATH
   "raw/4000703223-cbor-write-worker-self-test-46417/completion-exit/tools/cbor-write-isolated-build.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703223-cbor-write-worker-self-test-46417/completion-exit/tools/cbor-write-isolated-build.lisp")
   :BYTES 184 :SHA256
   "1e3c5ad6ead59dcacdfb02c47ce2474eb44727271c8fcd8436fefe2dde8d0b61")
  (:PATH "raw/4000703223-cbor-write-worker-self-test-46417/report.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703223-cbor-write-worker-self-test-46417/report.lisp")
   :BYTES 1694 :SHA256
   "34b4ed39641c4587cc6004c4dd18d782c5985018c34c60364ab86b42b5352eb5")
  (:PATH "raw/4000703223-cbor-write-worker-self-test-46417/signal/test.log"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703223-cbor-write-worker-self-test-46417/signal/test.log")
   :BYTES 40 :SHA256
   "52ed427bbed0c5c928fa7e029bb609e785bb3a11329b9a8110255dbeb7c5f384")
  (:PATH
   "raw/4000703223-cbor-write-worker-self-test-46417/signal/tools/cbor-write-isolated-build.lisp"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703223-cbor-write-worker-self-test-46417/signal/tools/cbor-write-isolated-build.lisp")
   :BYTES 142 :SHA256
   "1ee0da58fd6e1dca7befab8f13b2c7c520b79e8d12dedc4e6a3f9bb926d5628b")
  (:PATH "raw/4000703323-check-48171-0/SPK-01.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703323-check-48171-0/SPK-01.lisp")
   :BYTES 27228 :SHA256
   "23ceaa4d4ba0f96535c8aa232ce805092367792a35a3d2d58b70e6869405034c")
  (:PATH "raw/4000703323-check-48171-0/SPK-02.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703323-check-48171-0/SPK-02.lisp")
   :BYTES 1607 :SHA256
   "9593717cfc97b40dc8a67868457b32b7bd8e2de9b2744dac58b335a0eb2e7fa2")
  (:PATH "raw/4000703323-check-48171-0/SPK-03.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703323-check-48171-0/SPK-03.lisp")
   :BYTES 3646 :SHA256
   "a46bc5dd6687deab8ce50e6deb7cb2cdcb9b44e49eb3821b66a77d30df4664b5")
  (:PATH "raw/4000703323-check-48171-0/SPK-04.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703323-check-48171-0/SPK-04.lisp")
   :BYTES 6752 :SHA256
   "25600272284ae707b9f596155b1e3c50015f55c86ddd9612ee5ef95ce185b94d")
  (:PATH "raw/4000703323-check-48171-0/SPK-05.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703323-check-48171-0/SPK-05.lisp")
   :BYTES 10172 :SHA256
   "1df9bc6ce6e59c1f263abd0875730c75a6f972586b74bdd940cfdeb5d95694bd")
  (:PATH "raw/4000703323-check-48171-0/SPK-06.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703323-check-48171-0/SPK-06.lisp")
   :BYTES 24147 :SHA256
   "3476c6374d3c92255c80151aac98d31b1b88a004161d145c6a0899a57592e6b4")
  (:PATH "raw/4000703323-check-48171-0/SPK-07.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703323-check-48171-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "040f7c85423b3a5a23a66d123b8e8803bbcc2a1645ad572ab0ea3aadd8dde115")
  (:PATH "raw/4000703323-check-48171-0/SPK-07.lisp.gz" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703323-check-48171-0/SPK-07.lisp.gz")
   :BYTES 410627 :SHA256
   "aa243a009efae688cfcff55dee2f1f255dfe7f1cb20a472fcf81fc354890862c")
  (:PATH "raw/4000703323-check-48171-0/SPK-08.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703323-check-48171-0/SPK-08.lisp")
   :BYTES 292334 :SHA256
   "686e35159db1e9ec5fe54c1c75d91c6b13d625b1c1ffecd082eed378528f01cd")
  (:PATH "raw/4000703323-check-48171-0/SPK-09.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703323-check-48171-0/SPK-09.lisp")
   :BYTES 2472 :SHA256
   "e5618176b08aec36ec45c1a8416d0d98f86dc1d7513137d45b91a14bca99c055")
  (:PATH "raw/4000703323-check-48171-0/SPK-10.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703323-check-48171-0/SPK-10.lisp")
   :BYTES 22975 :SHA256
   "d95293c4297bed38b6602e44f211354c1d07a5cb06102babc1acdfc00493b9cb")
  (:PATH "raw/4000703323-check-48171-0/conservazione.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703323-check-48171-0/conservazione.lisp")
   :BYTES 2306 :SHA256
   "0454936ad35b3738b8ed312efc43ea37e0975d6e37a7d4f8b03a163a55ff9cc3")
  (:PATH "raw/4000703323-check-48171-0/report.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703323-check-48171-0/report.lisp")
   :BYTES 318 :SHA256
   "fbbc51ce88ec1d80e7db190a9e5e405970c0d8dd855a4681dc2a51dbbe339e12")
  (:PATH "raw/4000703323-check-48171-0/report.lisp.gz" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703323-check-48171-0/report.lisp.gz")
   :BYTES 467322 :SHA256
   "e195dccd9006fe6aa7754cd8c302f7ed2a823db63f77438f8b59b586e4df7eab")
  (:PATH "raw/coverage-self/cover-index.html" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-coverage-self-20261011/cover-index.html")
   :BYTES 1789 :SHA256
   "d0bb70180d260acfb335967a7f580bccfae0c23100bf86db6c9b8989d7c8f3fb")
  (:PATH "raw/coverage-self/coverage-fixture.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-coverage-self-20261011/coverage-fixture.fasl")
   :BYTES 1601 :SHA256
   "c6952d58b30f6cd025cd2a2167104daa6124632116b846844b2b0ae00d674606")
  (:PATH "raw/coverage-self/coverage-fixture.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-coverage-self-20261011/coverage-fixture.lisp")
   :BYTES 147 :SHA256
   "3767518fde8bde1e1286dbf663e97eac01f02e038d7f3161df436d9fd3e92559")
  (:PATH "raw/coverage-self/ee000f18a2442d1478a3c707012e7bfd.html" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-coverage-self-20261011/ee000f18a2442d1478a3c707012e7bfd.html")
   :BYTES 2829 :SHA256
   "6124f0a4cdfc96d7783268290e200fcedce0e09f305a58b0e056d0a7ec042362")
  (:PATH "raw/coverage/cover-index.html" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-coverage-20261011/cover-index.html")
   :BYTES 1754 :SHA256
   "7d742e9939d9d7b40a23c42c79f535f4f0221a23f03925227fef6e8c3edb0027")
  (:PATH "raw/coverage/coverage-state.lisp" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-coverage-20261011/coverage-state.lisp")
   :BYTES 325 :SHA256
   "b4de0dea5fb08cc80a4994d670797a11ac50bbd3ea0ba188719a549a278130cf")
  (:PATH "raw/coverage/coverage-state.lisp.gz" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-coverage-20261011/coverage-state.lisp.gz")
   :BYTES 158741 :SHA256
   "8ecc52b1f2feccbd315b76e3f3113df3bdc118cb2eba321d9ba70dce426b4190")
  (:PATH "raw/coverage/e5db7850e81a5085099ab99ae6c5f733.html" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-coverage-20261011/e5db7850e81a5085099ab99ae6c5f733.html")
   :BYTES 33427 :SHA256
   "279e8e5274e5044e2fec2551d3e3b65c1271d7a81c6e096a7c8fe601e35a6848")
  (:PATH "raw/frozen/arcdocdb.asd" :SOURCE
   #A((77) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/arcdocdb.asd")
   :BYTES 8637 :SHA256
   "f28a66e9e6132fe9d7dd37fde61028be03d8f092224bd710c2805b568814f319")
  (:PATH "raw/frozen/docs/implementazione/cbor-scrittura-decisioni.md.txt"
   :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/docs/implementazione/cbor-scrittura-decisioni.md")
   :BYTES 1916 :SHA256
   "587b4f9ee26f122764fd2b9305a00fa00396addd1491ecab54273e85f85fd047")
  (:PATH "raw/frozen/docs/implementazione/cbor-scrittura-lettura.md.txt"
   :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/docs/implementazione/cbor-scrittura-lettura.md")
   :BYTES 6718 :SHA256
   "b3e6406f31f46923f347b3f2ef1de7788a38104a087d8d6b06c01da1fbef2d76")
  (:PATH "raw/frozen/docs/implementazione/cbor-scrittura-metodo.md.txt" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/docs/implementazione/cbor-scrittura-metodo.md")
   :BYTES 3980 :SHA256
   "75dcce672155d385da4226a465d8de20b774ca92d61b8fc2141bafce21999b7c")
  (:PATH "raw/frozen/docs/implementazione/cbor-scrittura-revisione.md.txt"
   :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/docs/implementazione/cbor-scrittura-revisione.md")
   :BYTES 2395 :SHA256
   "4894f694dfd8bed086c288275e3aea4e118fd6bf1015d02ea4ccca5663fb3e07")
  (:PATH "raw/frozen/docs/implementazione/cbor-scrittura-risultati.md.txt"
   :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/docs/implementazione/cbor-scrittura-risultati.md")
   :BYTES 5613 :SHA256
   "8f980ab47429c229ac36b79ea3c86b7892ced3352380c873c797c85c2524c2a3")
  (:PATH "raw/frozen/docs/implementazione/cbor-scrittura.md.txt" :SOURCE
   #A((103) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/docs/implementazione/cbor-scrittura.md")
   :BYTES 2232 :SHA256
   "11877f9561125c251d35011f164ae5241e9b85faacc65568ec4219a63a19f5c4")
  (:PATH "raw/frozen/docs/tracciabilita/matrice.md.txt" :SOURCE
   #A((94) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/docs/tracciabilita/matrice.md")
   :BYTES 47576 :SHA256
   "0347fa97d6073d117f05ca51f9c5110dca62b1427c41ed75db8366157dd1ed96")
  (:PATH "raw/frozen/docs/tracciabilita/requisiti.lisp" :SOURCE
   #A((98) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/docs/tracciabilita/requisiti.lisp")
   :BYTES 38546 :SHA256
   "23f3bfd0c8f4b96d8afa8595ce91485fc4c439ebbcc1ef112a32179439de30ff")
  (:PATH "raw/frozen/src/codec/cbor-package.lisp" :SOURCE
   #A((92) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/src/codec/cbor-package.lisp")
   :BYTES 550 :SHA256
   "11c474d9de6cb42c86884c41c09e8dfde025a0216c97a80dbc7a13c271d3b93d")
  (:PATH "raw/frozen/src/codec/cbor-write.lisp" :SOURCE
   #A((90) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/frozen/tests/codec/cbor-write-roundtrip.lisp" :SOURCE
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/tests/codec/cbor-write-roundtrip.lisp")
   :BYTES 901 :SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
  (:PATH "raw/frozen/tests/codec/cbor-write-support.lisp" :SOURCE
   #A((100) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/tests/codec/cbor-write-support.lisp")
   :BYTES 4768 :SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
  (:PATH "raw/frozen/tests/codec/cbor-write-threads.lisp" :SOURCE
   #A((100) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/tests/codec/cbor-write-threads.lisp")
   :BYTES 3813 :SHA256
   "7ab3075c75d53ea5285bd68912513010ec767bcb9f99af725a7727239c472dcb")
  (:PATH "raw/frozen/tests/codec/cbor-write.lisp" :SOURCE
   #A((92) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/tests/codec/cbor-write.lisp")
   :BYTES 9822 :SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
  (:PATH "raw/frozen/tools/cbor-write-bench.lisp" :SOURCE
   #A((92) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/tools/cbor-write-bench.lisp")
   :BYTES 10754 :SHA256
   "00544fe6006a64d080d6d7ae33850de8133c1d6042ef3c2584405de61402b64a")
  (:PATH "raw/frozen/tools/cbor-write-mutation.lisp" :SOURCE
   #A((95) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/tools/cbor-write-mutation.lisp")
   :BYTES 30834 :SHA256
   "45915cacf1fc05783ac29d4a5d695d0dbb685a23e2923a91ff5963c6a398a488")
  (:PATH "raw/frozen/tools/foundation-coverage.lisp" :SOURCE
   #A((95) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/tools/foundation-coverage.lisp")
   :BYTES 9820 :SHA256
   "de199395e552009386fd5c090f9fd113bb47dbf6e59f504e33e519d5472c9aa1")
  (:PATH "raw/header-write-audit.lisp" :SOURCE
   #A((99) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write-audit.lisp")
   :BYTES 33932 :SHA256
   "16affcd1a83ed08f80513120f7cc0a185414cf10a1fab0755bda12d8641bcad5")
  (:PATH "raw/helpers-and-transcripts/audit-bench-20261011-1.lisp" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-bench-20261011-1.lisp")
   :BYTES 2265 :SHA256
   "839430f2db6eae21d517857d95bb41b28acc86c0793b79f709a281faabb9b3d0")
  (:PATH "raw/helpers-and-transcripts/audit-bench-20261011-1.log" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-bench-20261011-1.log")
   :BYTES 75 :SHA256
   "a10f48e2cd6ba17e9acf7bec99869b9865480b042858cc96cb5b51b06919dcd4")
  (:PATH "raw/helpers-and-transcripts/audit-final-20261011-1.lisp" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-final-20261011-1.lisp")
   :BYTES 4533 :SHA256
   "1ef2a2c6a0cac4f750ca836463b8a758b577648ef5d59feb51268d8d6d53d011")
  (:PATH "raw/helpers-and-transcripts/audit-final-20261011-2.lisp" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-final-20261011-2.lisp")
   :BYTES 36238 :SHA256
   "9026acaf6006c7f8251cb911b58f60be21d8face6b8849f8165e41613fb02196")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-1.log" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-1.log")
   :BYTES 82 :SHA256
   "266f2ea48331ecd29f191813d5f7288e5d6641ca86fd93fbdd28138338c0ab70")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-1/bench-arity.lisp"
   :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-1/bench-arity.lisp")
   :BYTES 10321 :SHA256
   "ba7922fa48d9a78427bde531c5b9169da9e1477d5660afc3e5ff2843141dce99")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-1/bench-full-bytes.lisp"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-1/bench-full-bytes.lisp")
   :BYTES 10303 :SHA256
   "dc56d1fc3e09a2cd2605413062eb8d10c5b905d8da74515a48f0e5aade8a7109")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-1/bench-good.lisp"
   :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-1/bench-good.lisp")
   :BYTES 75 :SHA256
   "52e42789276d7dd8345c8e8d8d4d6ec8e1ce4d25e5e5ca43967fbe0e87bf1299")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-1/bench-heap.lisp"
   :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-1/bench-heap.lisp")
   :BYTES 10318 :SHA256
   "40ff4c315dd5451c08ea532ecb86b8c33f93ee4bd52997fe54a8b8cf35b2527b")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-1/bench-positive-control.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-1/bench-positive-control.lisp")
   :BYTES 10323 :SHA256
   "0ae84a65c190dea4988fc98c57b3d191d48cbc1ce7ff88f498c67e08ccfaec1f")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-1/bench-sink.lisp"
   :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-1/bench-sink.lisp")
   :BYTES 10318 :SHA256
   "b85b624ce73825472f101040d847bd5b339ee1fb35dda2d7318fcdfab74be0c4")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-1/bench-stability.lisp"
   :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-1/bench-stability.lisp")
   :BYTES 10324 :SHA256
   "6419dd31b2dd0168f54757dd80dff7f9ae6971434893095ad6c9b88e055c6bd5")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-1/coverage-good.lisp"
   :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-1/coverage-good.lisp")
   :BYTES 78 :SHA256
   "e6d890f8ef672aef35032a545aca9322d673dcf62c42dfb9db07ad4740531d74")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-1/coverage-invalid-bit.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-1/coverage-invalid-bit.lisp")
   :BYTES 86 :SHA256
   "f8f0d4842e751c6181a066ba2803cf48df6bda1ebe042dd237d1bb32554b5905")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-1/mutants-baseline.lisp"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-1/mutants-baseline.lisp")
   :BYTES 2645 :SHA256
   "a02c74ad1c3737cffd8baf32082ee7b63c1e695130d60b6ca678772444808ea6")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-1/mutants-catalog.lisp"
   :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-1/mutants-catalog.lisp")
   :BYTES 2639 :SHA256
   "5198ac1568198c2fbf0ac8bd4d5d80dba3b91da7377278d900c348b5fe135b94")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-1/mutants-good.lisp"
   :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-1/mutants-good.lisp")
   :BYTES 77 :SHA256
   "ff42fc9ba44c6dc1af16a6a667f9f9c5b92d046e013d7217e5d473ec958ebb0d")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-1/mutants-invalid.lisp"
   :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-1/mutants-invalid.lisp")
   :BYTES 2643 :SHA256
   "9aa7eb8ae75c840677a0bc68f6112db2a0dd29ea3897779554317729a8af2eb3")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-1/mutants-signal.lisp"
   :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-1/mutants-signal.lisp")
   :BYTES 2641 :SHA256
   "3f2ec1d075e2391bf8af4965d1b827875f8b2c5a50d43c6411bf335777aaf664")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-1/mutants-survived.lisp"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-1/mutants-survived.lisp")
   :BYTES 2645 :SHA256
   "a6e6dfd38835f967caf95841af3071b00fb1d4bc7084609b6e61aa838d1c21fa")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-1/reader-13.lisp"
   :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-1/reader-13.lisp")
   :BYTES 105 :SHA256
   "007422a277311394ba63ac47de80fae7d693e9eaaab15d1882b77ee49e2a2e8b")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-1/reader-14.lisp"
   :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-1/reader-14.lisp")
   :BYTES 107 :SHA256
   "170cb9065e26479dc921cf491408e9a024919411ca5dd86b4ae9dedf267f027a")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-1/reader-15.lisp"
   :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-1/reader-15.lisp")
   :BYTES 119 :SHA256
   "13bbacdd3b997999ed9265bbe2582bac9fb0a2a03153d99cbc6953cba016cdbc")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-1/reader-16.lisp"
   :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-1/reader-16.lisp")
   :BYTES 104 :SHA256
   "c0655831032be2ab206a244ead50e04b3c137facc90bb4aa0309a9c3cd3f3a96")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-1/report.lisp"
   :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-1/report.lisp")
   :BYTES 885 :SHA256
   "0c365231144fe8d87d97419c9a3a33cce8b1aa4a411bbaa10ce45336310ea171")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-1/substitution-duplicate.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-1/substitution-duplicate.lisp")
   :BYTES 88 :SHA256
   "981f02be835f32ffed988ffc98b31b5fcafe36867fba774bf6dc93e071c326ea")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-1/substitution-good.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-1/substitution-good.lisp")
   :BYTES 83 :SHA256
   "d2d4b315a4555e23e7d1234fd2c13829b26113ac7bd30c7e35dfb8fc10921d20")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-1/unknown-preamble.lisp"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-1/unknown-preamble.lisp")
   :BYTES 81 :SHA256
   "3c5cc14c419d6865d7268701289bb4d756904644bc40ae3b0d273620bb3a1040")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-2.log" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-2.log")
   :BYTES 755 :SHA256
   "4a616bfcc0252d82eb7cc7a867c25118dff3286de69c7e1b7116915746a4265b")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-2/bench-arity.lisp"
   :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-2/bench-arity.lisp")
   :BYTES 10321 :SHA256
   "ba7922fa48d9a78427bde531c5b9169da9e1477d5660afc3e5ff2843141dce99")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-2/bench-full-bytes.lisp"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-2/bench-full-bytes.lisp")
   :BYTES 10303 :SHA256
   "dc56d1fc3e09a2cd2605413062eb8d10c5b905d8da74515a48f0e5aade8a7109")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-2/bench-good.lisp"
   :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-2/bench-good.lisp")
   :BYTES 75 :SHA256
   "52e42789276d7dd8345c8e8d8d4d6ec8e1ce4d25e5e5ca43967fbe0e87bf1299")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-2/bench-heap.lisp"
   :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-2/bench-heap.lisp")
   :BYTES 10318 :SHA256
   "40ff4c315dd5451c08ea532ecb86b8c33f93ee4bd52997fe54a8b8cf35b2527b")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-2/bench-positive-control.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-2/bench-positive-control.lisp")
   :BYTES 10323 :SHA256
   "0ae84a65c190dea4988fc98c57b3d191d48cbc1ce7ff88f498c67e08ccfaec1f")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-2/bench-sink.lisp"
   :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-2/bench-sink.lisp")
   :BYTES 10318 :SHA256
   "b85b624ce73825472f101040d847bd5b339ee1fb35dda2d7318fcdfab74be0c4")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-2/bench-stability.lisp"
   :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-2/bench-stability.lisp")
   :BYTES 10324 :SHA256
   "6419dd31b2dd0168f54757dd80dff7f9ae6971434893095ad6c9b88e055c6bd5")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-2/coverage-good.lisp"
   :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-2/coverage-good.lisp")
   :BYTES 78 :SHA256
   "e6d890f8ef672aef35032a545aca9322d673dcf62c42dfb9db07ad4740531d74")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-2/coverage-invalid-bit.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-2/coverage-invalid-bit.lisp")
   :BYTES 86 :SHA256
   "f8f0d4842e751c6181a066ba2803cf48df6bda1ebe042dd237d1bb32554b5905")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-2/mutants-baseline.lisp"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-2/mutants-baseline.lisp")
   :BYTES 2645 :SHA256
   "a02c74ad1c3737cffd8baf32082ee7b63c1e695130d60b6ca678772444808ea6")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-2/mutants-catalog.lisp"
   :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-2/mutants-catalog.lisp")
   :BYTES 2639 :SHA256
   "5198ac1568198c2fbf0ac8bd4d5d80dba3b91da7377278d900c348b5fe135b94")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-2/mutants-good.lisp"
   :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-2/mutants-good.lisp")
   :BYTES 77 :SHA256
   "ff42fc9ba44c6dc1af16a6a667f9f9c5b92d046e013d7217e5d473ec958ebb0d")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-2/mutants-invalid.lisp"
   :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-2/mutants-invalid.lisp")
   :BYTES 2643 :SHA256
   "9aa7eb8ae75c840677a0bc68f6112db2a0dd29ea3897779554317729a8af2eb3")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-2/mutants-signal.lisp"
   :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-2/mutants-signal.lisp")
   :BYTES 2641 :SHA256
   "3f2ec1d075e2391bf8af4965d1b827875f8b2c5a50d43c6411bf335777aaf664")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-2/mutants-survived.lisp"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-2/mutants-survived.lisp")
   :BYTES 2645 :SHA256
   "a6e6dfd38835f967caf95841af3071b00fb1d4bc7084609b6e61aa838d1c21fa")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-2/reader-13.lisp"
   :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-2/reader-13.lisp")
   :BYTES 105 :SHA256
   "007422a277311394ba63ac47de80fae7d693e9eaaab15d1882b77ee49e2a2e8b")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-2/reader-14.lisp"
   :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-2/reader-14.lisp")
   :BYTES 107 :SHA256
   "170cb9065e26479dc921cf491408e9a024919411ca5dd86b4ae9dedf267f027a")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-2/reader-15.lisp"
   :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-2/reader-15.lisp")
   :BYTES 119 :SHA256
   "13bbacdd3b997999ed9265bbe2582bac9fb0a2a03153d99cbc6953cba016cdbc")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-2/reader-16.lisp"
   :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-2/reader-16.lisp")
   :BYTES 104 :SHA256
   "c0655831032be2ab206a244ead50e04b3c137facc90bb4aa0309a9c3cd3f3a96")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-2/report.lisp"
   :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-2/report.lisp")
   :BYTES 885 :SHA256
   "0c365231144fe8d87d97419c9a3a33cce8b1aa4a411bbaa10ce45336310ea171")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-2/substitution-duplicate.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-2/substitution-duplicate.lisp")
   :BYTES 88 :SHA256
   "981f02be835f32ffed988ffc98b31b5fcafe36867fba774bf6dc93e071c326ea")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-2/substitution-good.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-2/substitution-good.lisp")
   :BYTES 83 :SHA256
   "d2d4b315a4555e23e7d1234fd2c13829b26113ac7bd30c7e35dfb8fc10921d20")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-2/unknown-preamble.lisp"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-2/unknown-preamble.lisp")
   :BYTES 81 :SHA256
   "3c5cc14c419d6865d7268701289bb4d756904644bc40ae3b0d273620bb3a1040")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-3.log" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-3.log")
   :BYTES 755 :SHA256
   "11b222fa93f6d664c04abce25d74c56c37e430f2b4d59edf718af47303228bec")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-3/bench-arity.lisp"
   :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-3/bench-arity.lisp")
   :BYTES 10321 :SHA256
   "ba7922fa48d9a78427bde531c5b9169da9e1477d5660afc3e5ff2843141dce99")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-3/bench-full-bytes.lisp"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-3/bench-full-bytes.lisp")
   :BYTES 10303 :SHA256
   "dc56d1fc3e09a2cd2605413062eb8d10c5b905d8da74515a48f0e5aade8a7109")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-3/bench-good.lisp"
   :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-3/bench-good.lisp")
   :BYTES 75 :SHA256
   "52e42789276d7dd8345c8e8d8d4d6ec8e1ce4d25e5e5ca43967fbe0e87bf1299")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-3/bench-heap.lisp"
   :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-3/bench-heap.lisp")
   :BYTES 10318 :SHA256
   "40ff4c315dd5451c08ea532ecb86b8c33f93ee4bd52997fe54a8b8cf35b2527b")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-3/bench-positive-control.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-3/bench-positive-control.lisp")
   :BYTES 10323 :SHA256
   "0ae84a65c190dea4988fc98c57b3d191d48cbc1ce7ff88f498c67e08ccfaec1f")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-3/bench-sink.lisp"
   :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-3/bench-sink.lisp")
   :BYTES 10318 :SHA256
   "b85b624ce73825472f101040d847bd5b339ee1fb35dda2d7318fcdfab74be0c4")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-3/bench-stability.lisp"
   :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-3/bench-stability.lisp")
   :BYTES 10324 :SHA256
   "6419dd31b2dd0168f54757dd80dff7f9ae6971434893095ad6c9b88e055c6bd5")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-3/coverage-good.lisp"
   :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-3/coverage-good.lisp")
   :BYTES 78 :SHA256
   "e6d890f8ef672aef35032a545aca9322d673dcf62c42dfb9db07ad4740531d74")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-3/coverage-invalid-bit.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-3/coverage-invalid-bit.lisp")
   :BYTES 86 :SHA256
   "f8f0d4842e751c6181a066ba2803cf48df6bda1ebe042dd237d1bb32554b5905")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-3/mutants-baseline.lisp"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-3/mutants-baseline.lisp")
   :BYTES 2645 :SHA256
   "a02c74ad1c3737cffd8baf32082ee7b63c1e695130d60b6ca678772444808ea6")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-3/mutants-catalog.lisp"
   :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-3/mutants-catalog.lisp")
   :BYTES 2639 :SHA256
   "5198ac1568198c2fbf0ac8bd4d5d80dba3b91da7377278d900c348b5fe135b94")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-3/mutants-good.lisp"
   :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-3/mutants-good.lisp")
   :BYTES 77 :SHA256
   "ff42fc9ba44c6dc1af16a6a667f9f9c5b92d046e013d7217e5d473ec958ebb0d")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-3/mutants-invalid.lisp"
   :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-3/mutants-invalid.lisp")
   :BYTES 2643 :SHA256
   "9aa7eb8ae75c840677a0bc68f6112db2a0dd29ea3897779554317729a8af2eb3")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-3/mutants-signal.lisp"
   :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-3/mutants-signal.lisp")
   :BYTES 2641 :SHA256
   "3f2ec1d075e2391bf8af4965d1b827875f8b2c5a50d43c6411bf335777aaf664")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-3/mutants-survived.lisp"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-3/mutants-survived.lisp")
   :BYTES 2645 :SHA256
   "a6e6dfd38835f967caf95841af3071b00fb1d4bc7084609b6e61aa838d1c21fa")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-3/process-after.lisp"
   :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-3/process-after.lisp")
   :BYTES 396 :SHA256
   "fac0cee95f517c0c05739aaa008abda188263f2f8d8c0740d1f747d5180a5caf")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-3/process-blob.lisp"
   :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-3/process-blob.lisp")
   :BYTES 447 :SHA256
   "311480c0783a5b708db69171bdbbb33e7881d0fbc612664bed2cb43d41ca00b0")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-3/process-changed.lisp"
   :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-3/process-changed.lisp")
   :BYTES 492 :SHA256
   "5c55d6eb02822a587bab85d505f717b6adcb15c5cd092020d0b64d592e2e01df")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-3/process-exit.lisp"
   :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-3/process-exit.lisp")
   :BYTES 488 :SHA256
   "ffed90030cda2b77da46e9e33e5d3869045296a939f27a0378bf20da2266ab71")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-3/process-good.lisp"
   :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-3/process-good.lisp")
   :BYTES 77 :SHA256
   "152e3c960a5574b593858f64f430d2693a01d134a86c5acb6af2df86f5f5208d")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-3/process-status.lisp"
   :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-3/process-status.lisp")
   :BYTES 494 :SHA256
   "fb2d6664730be6c3712da8475f024ff6eb68e84f42cae45a48bc6c8a46681e73")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-3/reader-19.lisp"
   :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-3/reader-19.lisp")
   :BYTES 105 :SHA256
   "31569c7753ec7856494957cf4288de8fc69cb6db84cb1f7d63b15743a2d7d837")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-3/reader-20.lisp"
   :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-3/reader-20.lisp")
   :BYTES 107 :SHA256
   "eef54883af30b126d8ac3caf63e35aa03d955b67702e1efd9e4512922ec90fc3")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-3/reader-21.lisp"
   :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-3/reader-21.lisp")
   :BYTES 107 :SHA256
   "45dbd46c7010df3b0b1b98365fd638fd9ff18647b4829c8924adf6856b87eb56")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-3/reader-22.lisp"
   :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-3/reader-22.lisp")
   :BYTES 104 :SHA256
   "9b39bc2a2c1a92eb6e47fa56ec8dabf00c8dc27cbf7de64160905854bdfa76be")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-3/report.lisp"
   :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-3/report.lisp")
   :BYTES 1090 :SHA256
   "b803770b4613cf5240b4bc7b7761a2070817429ae55e990c301964050db6a7f3")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-3/substitution-duplicate.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-3/substitution-duplicate.lisp")
   :BYTES 88 :SHA256
   "981f02be835f32ffed988ffc98b31b5fcafe36867fba774bf6dc93e071c326ea")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-3/substitution-good.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-3/substitution-good.lisp")
   :BYTES 83 :SHA256
   "d2d4b315a4555e23e7d1234fd2c13829b26113ac7bd30c7e35dfb8fc10921d20")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-3/unknown-preamble.lisp"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-3/unknown-preamble.lisp")
   :BYTES 81 :SHA256
   "3c5cc14c419d6865d7268701289bb4d756904644bc40ae3b0d273620bb3a1040")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-4.log" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-4.log")
   :BYTES 82 :SHA256
   "25d81cbeec3fc81c8532b066a595b40ee7f31c9473a4fe108ac51135bcdd05e9")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-4/bench-arity.lisp"
   :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-4/bench-arity.lisp")
   :BYTES 10321 :SHA256
   "ba7922fa48d9a78427bde531c5b9169da9e1477d5660afc3e5ff2843141dce99")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-4/bench-full-bytes.lisp"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-4/bench-full-bytes.lisp")
   :BYTES 10303 :SHA256
   "dc56d1fc3e09a2cd2605413062eb8d10c5b905d8da74515a48f0e5aade8a7109")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-4/bench-good.lisp"
   :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-4/bench-good.lisp")
   :BYTES 75 :SHA256
   "52e42789276d7dd8345c8e8d8d4d6ec8e1ce4d25e5e5ca43967fbe0e87bf1299")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-4/bench-heap.lisp"
   :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-4/bench-heap.lisp")
   :BYTES 10318 :SHA256
   "40ff4c315dd5451c08ea532ecb86b8c33f93ee4bd52997fe54a8b8cf35b2527b")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-4/bench-positive-control.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-4/bench-positive-control.lisp")
   :BYTES 10323 :SHA256
   "0ae84a65c190dea4988fc98c57b3d191d48cbc1ce7ff88f498c67e08ccfaec1f")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-4/bench-sink.lisp"
   :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-4/bench-sink.lisp")
   :BYTES 10318 :SHA256
   "b85b624ce73825472f101040d847bd5b339ee1fb35dda2d7318fcdfab74be0c4")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-4/bench-stability.lisp"
   :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-4/bench-stability.lisp")
   :BYTES 10324 :SHA256
   "6419dd31b2dd0168f54757dd80dff7f9ae6971434893095ad6c9b88e055c6bd5")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-4/coverage-gap-map.lisp"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-4/coverage-gap-map.lisp")
   :BYTES 81 :SHA256
   "b1679ff9a0db2fcd3c069347d98e760dbfba651f59e605de06fbe21fe64377c8")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-4/coverage-good.lisp"
   :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-4/coverage-good.lisp")
   :BYTES 78 :SHA256
   "e6d890f8ef672aef35032a545aca9322d673dcf62c42dfb9db07ad4740531d74")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-4/coverage-invalid-bit.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-4/coverage-invalid-bit.lisp")
   :BYTES 86 :SHA256
   "f8f0d4842e751c6181a066ba2803cf48df6bda1ebe042dd237d1bb32554b5905")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-4/mutants-baseline.lisp"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-4/mutants-baseline.lisp")
   :BYTES 2645 :SHA256
   "a02c74ad1c3737cffd8baf32082ee7b63c1e695130d60b6ca678772444808ea6")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-4/mutants-catalog.lisp"
   :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-4/mutants-catalog.lisp")
   :BYTES 2639 :SHA256
   "5198ac1568198c2fbf0ac8bd4d5d80dba3b91da7377278d900c348b5fe135b94")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-4/mutants-good.lisp"
   :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-4/mutants-good.lisp")
   :BYTES 77 :SHA256
   "ff42fc9ba44c6dc1af16a6a667f9f9c5b92d046e013d7217e5d473ec958ebb0d")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-4/mutants-invalid.lisp"
   :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-4/mutants-invalid.lisp")
   :BYTES 2643 :SHA256
   "9aa7eb8ae75c840677a0bc68f6112db2a0dd29ea3897779554317729a8af2eb3")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-4/mutants-signal.lisp"
   :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-4/mutants-signal.lisp")
   :BYTES 2641 :SHA256
   "3f2ec1d075e2391bf8af4965d1b827875f8b2c5a50d43c6411bf335777aaf664")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-4/mutants-survived.lisp"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-4/mutants-survived.lisp")
   :BYTES 2645 :SHA256
   "a6e6dfd38835f967caf95841af3071b00fb1d4bc7084609b6e61aa838d1c21fa")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-4/process-after.lisp"
   :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-4/process-after.lisp")
   :BYTES 396 :SHA256
   "fac0cee95f517c0c05739aaa008abda188263f2f8d8c0740d1f747d5180a5caf")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-4/process-blob.lisp"
   :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-4/process-blob.lisp")
   :BYTES 447 :SHA256
   "311480c0783a5b708db69171bdbbb33e7881d0fbc612664bed2cb43d41ca00b0")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-4/process-changed.lisp"
   :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-4/process-changed.lisp")
   :BYTES 492 :SHA256
   "5c55d6eb02822a587bab85d505f717b6adcb15c5cd092020d0b64d592e2e01df")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-4/process-exit.lisp"
   :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-4/process-exit.lisp")
   :BYTES 488 :SHA256
   "ffed90030cda2b77da46e9e33e5d3869045296a939f27a0378bf20da2266ab71")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-4/process-good.lisp"
   :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-4/process-good.lisp")
   :BYTES 77 :SHA256
   "152e3c960a5574b593858f64f430d2693a01d134a86c5acb6af2df86f5f5208d")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-4/process-status.lisp"
   :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-4/process-status.lisp")
   :BYTES 494 :SHA256
   "fb2d6664730be6c3712da8475f024ff6eb68e84f42cae45a48bc6c8a46681e73")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-4/reader-19.lisp"
   :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-4/reader-19.lisp")
   :BYTES 105 :SHA256
   "31569c7753ec7856494957cf4288de8fc69cb6db84cb1f7d63b15743a2d7d837")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-4/reader-20.lisp"
   :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-4/reader-20.lisp")
   :BYTES 107 :SHA256
   "eef54883af30b126d8ac3caf63e35aa03d955b67702e1efd9e4512922ec90fc3")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-4/reader-21.lisp"
   :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-4/reader-21.lisp")
   :BYTES 107 :SHA256
   "45dbd46c7010df3b0b1b98365fd638fd9ff18647b4829c8924adf6856b87eb56")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-4/reader-22.lisp"
   :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-4/reader-22.lisp")
   :BYTES 104 :SHA256
   "9b39bc2a2c1a92eb6e47fa56ec8dabf00c8dc27cbf7de64160905854bdfa76be")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-4/report.lisp"
   :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-4/report.lisp")
   :BYTES 1558 :SHA256
   "c975f5dfc709fec72d369fb8389bf95d533754c236c34bd705146618716716b9")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-4/substitution-duplicate.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-4/substitution-duplicate.lisp")
   :BYTES 88 :SHA256
   "981f02be835f32ffed988ffc98b31b5fcafe36867fba774bf6dc93e071c326ea")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-4/substitution-good.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-4/substitution-good.lisp")
   :BYTES 83 :SHA256
   "d2d4b315a4555e23e7d1234fd2c13829b26113ac7bd30c7e35dfb8fc10921d20")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-4/unknown-preamble.lisp"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-4/unknown-preamble.lisp")
   :BYTES 81 :SHA256
   "3c5cc14c419d6865d7268701289bb4d756904644bc40ae3b0d273620bb3a1040")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-5.log" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-5.log")
   :BYTES 82 :SHA256
   "f42f69109391183ce7956452b54164b13c945de47f81f469d600d87e0faebe09")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-5/bench-arity.lisp"
   :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-5/bench-arity.lisp")
   :BYTES 10321 :SHA256
   "ba7922fa48d9a78427bde531c5b9169da9e1477d5660afc3e5ff2843141dce99")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-5/bench-full-bytes.lisp"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-5/bench-full-bytes.lisp")
   :BYTES 10303 :SHA256
   "dc56d1fc3e09a2cd2605413062eb8d10c5b905d8da74515a48f0e5aade8a7109")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-5/bench-good.lisp"
   :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-5/bench-good.lisp")
   :BYTES 75 :SHA256
   "52e42789276d7dd8345c8e8d8d4d6ec8e1ce4d25e5e5ca43967fbe0e87bf1299")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-5/bench-heap.lisp"
   :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-5/bench-heap.lisp")
   :BYTES 10318 :SHA256
   "40ff4c315dd5451c08ea532ecb86b8c33f93ee4bd52997fe54a8b8cf35b2527b")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-5/bench-positive-control.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-5/bench-positive-control.lisp")
   :BYTES 10323 :SHA256
   "0ae84a65c190dea4988fc98c57b3d191d48cbc1ce7ff88f498c67e08ccfaec1f")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-5/bench-sink.lisp"
   :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-5/bench-sink.lisp")
   :BYTES 10318 :SHA256
   "b85b624ce73825472f101040d847bd5b339ee1fb35dda2d7318fcdfab74be0c4")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-5/bench-stability.lisp"
   :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-5/bench-stability.lisp")
   :BYTES 10324 :SHA256
   "6419dd31b2dd0168f54757dd80dff7f9ae6971434893095ad6c9b88e055c6bd5")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-5/coverage-gap-map.lisp"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-5/coverage-gap-map.lisp")
   :BYTES 81 :SHA256
   "b1679ff9a0db2fcd3c069347d98e760dbfba651f59e605de06fbe21fe64377c8")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-5/coverage-good.lisp"
   :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-5/coverage-good.lisp")
   :BYTES 78 :SHA256
   "e6d890f8ef672aef35032a545aca9322d673dcf62c42dfb9db07ad4740531d74")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-5/coverage-html-implicit-row-end.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-5/coverage-html-implicit-row-end.lisp")
   :BYTES 96 :SHA256
   "22372146cbb89af05321a480fb0f37818d7d82a6fb45a0a6b4a42adf2a74fd78")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-5/coverage-invalid-bit.lisp"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-5/coverage-invalid-bit.lisp")
   :BYTES 86 :SHA256
   "f8f0d4842e751c6181a066ba2803cf48df6bda1ebe042dd237d1bb32554b5905")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-5/mutants-baseline.lisp"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-5/mutants-baseline.lisp")
   :BYTES 2645 :SHA256
   "a02c74ad1c3737cffd8baf32082ee7b63c1e695130d60b6ca678772444808ea6")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-5/mutants-catalog.lisp"
   :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-5/mutants-catalog.lisp")
   :BYTES 2639 :SHA256
   "5198ac1568198c2fbf0ac8bd4d5d80dba3b91da7377278d900c348b5fe135b94")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-5/mutants-good.lisp"
   :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-5/mutants-good.lisp")
   :BYTES 77 :SHA256
   "ff42fc9ba44c6dc1af16a6a667f9f9c5b92d046e013d7217e5d473ec958ebb0d")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-5/mutants-invalid.lisp"
   :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-5/mutants-invalid.lisp")
   :BYTES 2643 :SHA256
   "9aa7eb8ae75c840677a0bc68f6112db2a0dd29ea3897779554317729a8af2eb3")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-5/mutants-signal.lisp"
   :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-5/mutants-signal.lisp")
   :BYTES 2641 :SHA256
   "3f2ec1d075e2391bf8af4965d1b827875f8b2c5a50d43c6411bf335777aaf664")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-5/mutants-survived.lisp"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-5/mutants-survived.lisp")
   :BYTES 2645 :SHA256
   "a6e6dfd38835f967caf95841af3071b00fb1d4bc7084609b6e61aa838d1c21fa")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-5/process-after.lisp"
   :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-5/process-after.lisp")
   :BYTES 396 :SHA256
   "fac0cee95f517c0c05739aaa008abda188263f2f8d8c0740d1f747d5180a5caf")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-5/process-blob.lisp"
   :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-5/process-blob.lisp")
   :BYTES 447 :SHA256
   "311480c0783a5b708db69171bdbbb33e7881d0fbc612664bed2cb43d41ca00b0")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-5/process-changed.lisp"
   :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-5/process-changed.lisp")
   :BYTES 492 :SHA256
   "5c55d6eb02822a587bab85d505f717b6adcb15c5cd092020d0b64d592e2e01df")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-5/process-exit.lisp"
   :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-5/process-exit.lisp")
   :BYTES 488 :SHA256
   "ffed90030cda2b77da46e9e33e5d3869045296a939f27a0378bf20da2266ab71")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-5/process-good.lisp"
   :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-5/process-good.lisp")
   :BYTES 77 :SHA256
   "152e3c960a5574b593858f64f430d2693a01d134a86c5acb6af2df86f5f5208d")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-5/process-status.lisp"
   :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-5/process-status.lisp")
   :BYTES 494 :SHA256
   "fb2d6664730be6c3712da8475f024ff6eb68e84f42cae45a48bc6c8a46681e73")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-5/reader-19.lisp"
   :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-5/reader-19.lisp")
   :BYTES 105 :SHA256
   "31569c7753ec7856494957cf4288de8fc69cb6db84cb1f7d63b15743a2d7d837")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-5/reader-20.lisp"
   :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-5/reader-20.lisp")
   :BYTES 107 :SHA256
   "eef54883af30b126d8ac3caf63e35aa03d955b67702e1efd9e4512922ec90fc3")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-5/reader-21.lisp"
   :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-5/reader-21.lisp")
   :BYTES 107 :SHA256
   "45dbd46c7010df3b0b1b98365fd638fd9ff18647b4829c8924adf6856b87eb56")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-5/reader-22.lisp"
   :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-5/reader-22.lisp")
   :BYTES 104 :SHA256
   "9b39bc2a2c1a92eb6e47fa56ec8dabf00c8dc27cbf7de64160905854bdfa76be")
  (:PATH "raw/helpers-and-transcripts/audit-self-20261011-5/report.lisp"
   :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-5/report.lisp")
   :BYTES 1591 :SHA256
   "5f4f761113a2566a9c064bc0ca085ad5ecd74550fb908b2eb2c5454fea50ce18")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-5/substitution-duplicate.lisp"
   :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-5/substitution-duplicate.lisp")
   :BYTES 88 :SHA256
   "981f02be835f32ffed988ffc98b31b5fcafe36867fba774bf6dc93e071c326ea")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-5/substitution-good.lisp"
   :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-5/substitution-good.lisp")
   :BYTES 83 :SHA256
   "d2d4b315a4555e23e7d1234fd2c13829b26113ac7bd30c7e35dfb8fc10921d20")
  (:PATH
   "raw/helpers-and-transcripts/audit-self-20261011-5/unknown-preamble.lisp"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-self-20261011-5/unknown-preamble.lisp")
   :BYTES 81 :SHA256
   "3c5cc14c419d6865d7268701289bb4d756904644bc40ae3b0d273620bb3a1040")
  (:PATH "raw/helpers-and-transcripts/audit-source-before-gap-map.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-source-before-gap-map.lisp")
   :BYTES 27691 :SHA256
   "9723e2c34ebd162eedeb972711224978d3c30f6775f348de1365bf0389a52d42")
  (:PATH
   "raw/helpers-and-transcripts/audit-source-before-process-selftests.lisp"
   :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-source-before-process-selftests.lisp")
   :BYTES 31576 :SHA256
   "37d6b8264a63f49f0f65c040a90c4799d77775ca7660d041abd2f2712ed715a2")
  (:PATH
   "raw/helpers-and-transcripts/audit-source-final-before-html-row-fix.lisp"
   :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-source-final-before-html-row-fix.lisp")
   :BYTES 32988 :SHA256
   "7bd4e364088051b5f894ee5681b724d1c0ba3984d8416b66ba4713bdc404f53c")
  (:PATH "raw/helpers-and-transcripts/audit-source-warning-gap-map.lisp"
   :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/audit-source-warning-gap-map.lisp")
   :BYTES 32571 :SHA256
   "68c77106cbdb4bbbc5a46d1d69a3b4114c7d3894d4f8baff9270bc592769c7ac")
  (:PATH "raw/helpers-and-transcripts/benchmark.stderr.log" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/benchmark.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/helpers-and-transcripts/benchmark.stdout.log" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/benchmark.stdout.log")
   :BYTES 217 :SHA256
   "0aaeda3f2cbb772a4755d77778346c35f838a2cf904d084797aa49228621022d")
  (:PATH "raw/helpers-and-transcripts/build-manifest.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/build-manifest.lisp")
   :BYTES 3372 :SHA256
   "b845169c76d725cddfb7e356938a09d14eaeecf6807c05c2e6d24f08d154f3a9")
  (:PATH "raw/helpers-and-transcripts/collect.lisp" :SOURCE
   #A((101) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/collect.lisp")
   :BYTES 9677 :SHA256
   "f59f7a52934c7fe6103b5047aade87214f17494e857fe35c568968c681790d81")
  (:PATH "raw/helpers-and-transcripts/coverage-compaction.stderr.log" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/coverage-compaction.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/helpers-and-transcripts/coverage-compaction.stdout.log" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/coverage-compaction.stdout.log")
   :BYTES 266 :SHA256
   "9e4d0d22dbc8ade5acab9b906928d0449f676e03d6710afbbec322c5c6654348")
  (:PATH "raw/helpers-and-transcripts/coverage-self.stderr.log" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/coverage-self.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/helpers-and-transcripts/coverage-self.stdout.log" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/coverage-self.stdout.log")
   :BYTES 270 :SHA256
   "e3656bd7e434013eaf6b24902d2a799a73a011bd7b120ab3c44e276dd9686980")
  (:PATH "raw/helpers-and-transcripts/coverage.stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/coverage.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/helpers-and-transcripts/coverage.stdout.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/coverage.stdout.log")
   :BYTES 273 :SHA256
   "8af0e1dc3f79f78ca40dc75a17e5044d433ad4c9f261adfdafe27d221ed2cd88")
  (:PATH "raw/helpers-and-transcripts/data-audit-retry.stderr.log" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/data-audit-retry.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/helpers-and-transcripts/data-audit-retry.stdout.log" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/data-audit-retry.stdout.log")
   :BYTES 528 :SHA256
   "d817e6c6b0fda8a58230e023732baa60f673b66775ad842e854bd8ffd7ecbab9")
  (:PATH "raw/helpers-and-transcripts/data-audit.stderr.log" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/data-audit.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/helpers-and-transcripts/data-audit.stdout.log" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/data-audit.stdout.log")
   :BYTES 532 :SHA256
   "9f882ac2082afb90bb4ccaf9bdbb89963168b2ee3c45f4908ea9ad477913585d")
  (:PATH "raw/helpers-and-transcripts/full-check.stderr.log" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/full-check.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/helpers-and-transcripts/full-check.stdout.log" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/full-check.stdout.log")
   :BYTES 344 :SHA256
   "3d855f5c9b4dcd659e1f7822e0edcc7eef3753abe129e7cab4e343566aa6acb1")
  (:PATH "raw/helpers-and-transcripts/mutations.stderr.log" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/mutations.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/helpers-and-transcripts/mutations.stdout.log" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/mutations.stdout.log")
   :BYTES 260 :SHA256
   "c41b1fe9aeaf70d8b6c804dfe1f00969af5893f4994752e2b3274d58dd21a92c")
  (:PATH "raw/helpers-and-transcripts/mutator-self.stderr.log" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/mutator-self.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/helpers-and-transcripts/mutator-self.stdout.log" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/mutator-self.stdout.log")
   :BYTES 224 :SHA256
   "7b958eeea7f825a4407471530bc06110136e7baa9d277e8f173992d19b42ea0a")
  (:PATH "raw/helpers-and-transcripts/preliminary.stderr.log" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/preliminary.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/helpers-and-transcripts/preliminary.stdout.log" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/preliminary.stdout.log")
   :BYTES 150 :SHA256
   "72f8773cd4a810feacb4873dfc90c340b8541f6da5564cfc612ceb7e4873e632")
  (:PATH "raw/helpers-and-transcripts/read-records.lisp" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/read-records.lisp")
   :BYTES 607 :SHA256
   "24533477d69667a62ed8281222f87316919cc165b444638633909db6b8f87728")
  (:PATH "raw/helpers-and-transcripts/setup-note.lisp" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/setup-note.lisp")
   :BYTES 512 :SHA256
   "e81dac4a20f6055ef3ec6a9b4b735ffcea069d99c8befb2b412e105db754dc17")
  (:PATH "raw/helpers-and-transcripts/setup-trace.stderr.log" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/setup-trace.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/helpers-and-transcripts/setup-trace.stdout.log" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/setup-trace.stdout.log")
   :BYTES 100 :SHA256
   "c4631d274513e1b854e2549ad9960a8ed49abcbc015601a51245ee1aa8bb45b4")
  (:PATH "raw/mutations/0/src/codec/cbor-write.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-mutations-20261011/0/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "80a7365fd62eda5fd4108cfad7fb8d6d8fd3f5f28cd7cf4bc1418b35735932b2")
  (:PATH "raw/mutations/0/test.log" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-mutations-20261011/0/test.log")
   :BYTES 19712 :SHA256
   "b98ee5d8fe69738b190f036be93835932f682f59f14e7a9bfe898c92d5b842b7")
  (:PATH "raw/mutations/0/tools/cbor-write-isolated-build.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-mutations-20261011/0/tools/cbor-write-isolated-build.lisp")
   :BYTES 464 :SHA256
   "230ad9dce23571b5fda2d17fbceb41c98e7f7c94f3c4066b429c0bbb4d3786b4")
  (:PATH "raw/mutations/1/src/codec/cbor-write.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-mutations-20261011/1/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "a2be68763536632dd09a48cda953dcb1f80e4a2ce00d11c2b41981624f0d1c98")
  (:PATH "raw/mutations/1/test.log" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-mutations-20261011/1/test.log")
   :BYTES 19717 :SHA256
   "e59ac0350b6e3636cb1252309952bffd5639974d876bdde186a461fc86034f6c")
  (:PATH "raw/mutations/1/tools/cbor-write-isolated-build.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-mutations-20261011/1/tools/cbor-write-isolated-build.lisp")
   :BYTES 464 :SHA256
   "2e092e372e91d83317fd0fc8f5c240f90a7319925a09d88a467f481600924289")
  (:PATH "raw/mutations/2/src/codec/cbor-write.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-mutations-20261011/2/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "dce67c69e08f7ade24d64dd0638306f5225a2b6c5929ca89ac5eab312b31ec3e")
  (:PATH "raw/mutations/2/test.log" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-mutations-20261011/2/test.log")
   :BYTES 19722 :SHA256
   "568d81adcb1714da0edcf06ffe86015ee2d4d0a9b1a5e926cb300677ae2b537f")
  (:PATH "raw/mutations/2/tools/cbor-write-isolated-build.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-mutations-20261011/2/tools/cbor-write-isolated-build.lisp")
   :BYTES 464 :SHA256
   "221b30416a08b317a86367adece5994f87be6a41c71f3bae0f07cd8162417b85")
  (:PATH "raw/mutations/3/src/codec/cbor-write.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-mutations-20261011/3/src/codec/cbor-write.lisp")
   :BYTES 5108 :SHA256
   "13989eec29fe35ccdd409f577898eaab49bec1e5e0548e6d96a63a585b2d8ebf")
  (:PATH "raw/mutations/3/test.log" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-mutations-20261011/3/test.log")
   :BYTES 19716 :SHA256
   "608777d4df52c832ee9af6697aaa688518f83c86afc94d12a134f42cc0150c49")
  (:PATH "raw/mutations/3/tools/cbor-write-isolated-build.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-mutations-20261011/3/tools/cbor-write-isolated-build.lisp")
   :BYTES 464 :SHA256
   "0b8352b9b4baa35ed909ed4de2d72551dd5c9b125264f142f8aae8b82fb53ba2")
  (:PATH "raw/mutations/4/src/codec/cbor-write.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-mutations-20261011/4/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "71f2850f7dbc41c982934c1d97be03bf2a5dd4c07ea0b2c108dc57fb9a85ab1c")
  (:PATH "raw/mutations/4/test.log" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-mutations-20261011/4/test.log")
   :BYTES 19717 :SHA256
   "77c7a1f2b8cde4dc619009714ab665d2b1b5be6fc3cb0a8828d5fa4ecb88e0a6")
  (:PATH "raw/mutations/4/tools/cbor-write-isolated-build.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-mutations-20261011/4/tools/cbor-write-isolated-build.lisp")
   :BYTES 464 :SHA256
   "1e3227cab04c17b8303243b995ee3122a364b9183398fb0658612dee0107f487")
  (:PATH "raw/mutations/5/src/codec/cbor-write.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-mutations-20261011/5/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "995c2e120979ec9fae05b9b717ed7b03c21673da7627ee68ba1d3c972c2012b6")
  (:PATH "raw/mutations/5/test.log" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-mutations-20261011/5/test.log")
   :BYTES 19713 :SHA256
   "a8de65c6a10bced83dda4e71b6c469fc158fb45df9456295463c8b8398fa2155")
  (:PATH "raw/mutations/5/tools/cbor-write-isolated-build.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-mutations-20261011/5/tools/cbor-write-isolated-build.lisp")
   :BYTES 464 :SHA256
   "52119ad666f0b2c939e47306ac38fcb43ffdc1ad6277c5f159c03d84c17fc5bd")
  (:PATH "raw/mutations/6/src/codec/cbor-write.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-mutations-20261011/6/src/codec/cbor-write.lisp")
   :BYTES 5129 :SHA256
   "13b5113c72e6ab0b1e2b5770cf08ca9c21008383519cca5a6398a6388a99808d")
  (:PATH "raw/mutations/6/test.log" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-mutations-20261011/6/test.log")
   :BYTES 20062 :SHA256
   "48dc3c2cd236091f02453c67a63cadb2d417cfc699055c3cb463bf30d0c090ef")
  (:PATH "raw/mutations/6/tools/cbor-write-isolated-build.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-mutations-20261011/6/tools/cbor-write-isolated-build.lisp")
   :BYTES 464 :SHA256
   "54e80460888980212775e1b77be63324fac7b6981c3d80f042f1d6a7a5c50e06")
  (:PATH "raw/mutations/7/src/codec/cbor-write.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-mutations-20261011/7/src/codec/cbor-write.lisp")
   :BYTES 5125 :SHA256
   "ce398e2a69fb5b4c4dde87bc922d6345a76859a5517b4668685a619303b10dbd")
  (:PATH "raw/mutations/7/test.log" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-mutations-20261011/7/test.log")
   :BYTES 19709 :SHA256
   "90da1540b21ff1763e524c2423c469c1b28d67330c98eb4e5f88b89b827b12db")
  (:PATH "raw/mutations/7/tools/cbor-write-isolated-build.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-mutations-20261011/7/tools/cbor-write-isolated-build.lisp")
   :BYTES 464 :SHA256
   "50095f3d655bb1ca491dbbccdcc91b29d254886efc43b35a43489cbebc63ffbc")
  (:PATH "raw/mutations/baseline/src/codec/cbor-write.lisp" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-mutations-20261011/baseline/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/mutations/baseline/test.log" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-mutations-20261011/baseline/test.log")
   :BYTES 33951 :SHA256
   "8cd8da87c3cb23ef3977a045550c4dd653fd71aadc8404faf4b05363bbfa259f")
  (:PATH "raw/mutations/baseline/tools/cbor-write-isolated-build.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-mutations-20261011/baseline/tools/cbor-write-isolated-build.lisp")
   :BYTES 478 :SHA256
   "5d8b9f39bef008151d3a24398c5b67b3a47ba58d6e0b593c220c011457af7b49")
  (:PATH "raw/mutations/report.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-mutations-20261011/report.lisp")
   :BYTES 42586 :SHA256
   "bf53c53d6ebdd02a0abd8e7d0b2799dad027f4ec8b28a2ccce4da6b108fab6df"))
 :LIMITS
 (:SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :FASL-EXCLUDED-FROM-PUBLISHED-MUTATION-TREES
  :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
