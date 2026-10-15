(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "bench-diff-fuzz" :RECORD-PATH
   #A((37) BASE-CHAR . "processes/bench-diff-fuzz/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((34) BASE-CHAR . "tools/cbor-string-read-driver.lisp")
    #A((5) BASE-CHAR . "--all"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "full-check" :RECORD-PATH
   #A((32) BASE-CHAR . "processes/full-check/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "make") #A((10) BASE-CHAR . "check-core")) :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "coverage" :RECORD-PATH
   #A((30) BASE-CHAR . "processes/coverage/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "4096") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((8) BASE-CHAR . "--report")
    #A((46) BASE-CHAR . "spikes/out/cbor-string-read-20261015/coverage/")
    #A((16) BASE-CHAR . "cbor-string-read"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "coverage-selftest" :RECORD-PATH
   #A((39) BASE-CHAR . "processes/coverage-selftest/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((11) BASE-CHAR . "--self-test")
    #A((55) BASE-CHAR
       . "spikes/out/cbor-string-read-20261015/coverage-selftest/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "mutation-selftest" :RECORD-PATH
   #A((39) BASE-CHAR . "processes/mutation-selftest/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((8) BASE-CHAR . "--script")
    #A((61) BASE-CHAR
       . "spikes/out/cbor-string-read-20261015/mutation-driver/run.lisp")
    #A((11) BASE-CHAR . "--self-test"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "mutations" :RECORD-PATH
   #A((31) BASE-CHAR . "processes/mutations/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((8) BASE-CHAR . "--script")
    #A((61) BASE-CHAR
       . "spikes/out/cbor-string-read-20261015/mutation-driver/run.lisp")
    #A((5) BASE-CHAR . "--run")
    #A((50) BASE-CHAR . "spikes/out/cbor-string-read-20261015/mutations-R1/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "selection-fixtures" :RECORD-PATH
   #A((40) BASE-CHAR . "processes/selection-fixtures/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((61) BASE-CHAR
       . "spikes/out/cbor-string-read-20261015/selection-tests/run.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "independent-runtime" :RECORD-PATH
   #A((41) BASE-CHAR . "processes/independent-runtime/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((84) BASE-CHAR
       . "spikes/out/cbor-string-read-20261015/independent-reading/run-final-data-readers.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "independent-mutations" :RECORD-PATH
   #A((43) BASE-CHAR . "processes/independent-mutations/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((71) BASE-CHAR
       . "spikes/out/cbor-string-read-20261015/independent-mutations/reading.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "independent-fullcheck" :RECORD-PATH
   #A((43) BASE-CHAR . "processes/independent-fullcheck/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((79) BASE-CHAR
       . "spikes/out/cbor-string-read-20261015/independent-reading/fullcheck-reading.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-manifests/main.lisp")
   :BYTES 168781 :SHA256
   "b48da32116c5aec8b25a3d60b93221e0bdf9b918d2e705f51efa431604b06561")
  (:PATH "collection-source.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH #A((44) BASE-CHAR . "processes/bench-diff-fuzz/conservazione.lisp")
   :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085071-command-33054-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "ddde7fe87f544cb1b09fb1c7e2133931c02d615bfeb016a674c5b8163cd98ad5")
  (:PATH #A((37) BASE-CHAR . "processes/bench-diff-fuzz/report.lisp") :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085071-command-33054-0/report.lisp")
   :BYTES 296391 :SHA256
   "e50cf294831a3c4f465f3868dc5fa92dd7ecc517da273e50cd708a949304f0fc")
  (:PATH #A((46) BASE-CHAR . "processes/coverage-selftest/conservazione.lisp")
   :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085107-command-33696-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "7dafd08136c412fcf96b96c2bd4feee541e9391e383776393a060d6fd17b81ae")
  (:PATH #A((39) BASE-CHAR . "processes/coverage-selftest/report.lisp") :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085107-command-33696-0/report.lisp")
   :BYTES 211172 :SHA256
   "f1bfb486e47a2d79abfdd0a0f44e6f75819b2b0a1942f180c4901cc5d7b95dae")
  (:PATH #A((37) BASE-CHAR . "processes/coverage/conservazione.lisp") :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085107-command-33695-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "20d1880bc40355e7a25a4e5004669a7c6554564c3b518dc344e8f0346c5e9471")
  (:PATH #A((30) BASE-CHAR . "processes/coverage/report.lisp") :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085107-command-33695-0/report.lisp")
   :BYTES 213480 :SHA256
   "efe91f7d48abfe59c2e0d998979b33b95506acc8bd37dfff92420cb2edbd9d67")
  (:PATH #A((39) BASE-CHAR . "processes/full-check/conservazione.lisp") :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085107-command-33694-0/conservazione.lisp")
   :BYTES 1772 :SHA256
   "8a8fe2677bd8b1e7667f2177bd70d5361cf418ecfe94ed72df7613c73d9d490a")
  (:PATH #A((32) BASE-CHAR . "processes/full-check/report.lisp") :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085107-command-33694-0/report.lisp")
   :BYTES 317 :SHA256
   "1ba285aea59628263a378ee2caadfbd23395617a9491527726bc463fdc000395")
  (:PATH #A((35) BASE-CHAR . "processes/full-check/report.lisp.gz") :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085107-command-33694-0/report.lisp.gz")
   :BYTES 206841 :SHA256
   "2b967acb602c23d4cb861a79b6a099a2b8db03863c43c715f0169678e951e522")
  (:PATH
   #A((50) BASE-CHAR . "processes/independent-fullcheck/conservazione.lisp")
   :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085792-command-54189-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "fd974442e9a0a744141939380451517426a411c62f32c9d7a21b47d535dfde7d")
  (:PATH #A((43) BASE-CHAR . "processes/independent-fullcheck/report.lisp")
   :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085792-command-54189-0/report.lisp")
   :BYTES 213425 :SHA256
   "ba39467b1bee368322628d1eb5d88a3ec5a9171ff0b317019e51637cd628dec3")
  (:PATH
   #A((50) BASE-CHAR . "processes/independent-mutations/conservazione.lisp")
   :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085732-command-52866-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "c8fac5dfd0586855f1a8833f929e0ed75bd38b9751bfcbe12da57698d546a04f")
  (:PATH #A((43) BASE-CHAR . "processes/independent-mutations/report.lisp")
   :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085732-command-52866-0/report.lisp")
   :BYTES 353068 :SHA256
   "7699a1c17e7c341edfdd9a882c14663dac89c6efe00bb9e4f640482513670e46")
  (:PATH
   #A((48) BASE-CHAR . "processes/independent-runtime/conservazione.lisp")
   :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085677-command-51505-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "79f4e65b5816fd99a01553e8e91e83bc80d59c7a5634cd3fb7299a8a2afc9be0")
  (:PATH #A((41) BASE-CHAR . "processes/independent-runtime/report.lisp")
   :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085677-command-51505-0/report.lisp")
   :BYTES 226325 :SHA256
   "19e8a5b39ea3100ea1b87f6f9c8250e71320398c946430b2274b1e4c93771430")
  (:PATH #A((46) BASE-CHAR . "processes/mutation-selftest/conservazione.lisp")
   :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085216-command-37227-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "d57cc5f6f4735655a3d09120c566b9a90ebad9a98c22e75cb4e502121bac42bc")
  (:PATH #A((39) BASE-CHAR . "processes/mutation-selftest/report.lisp") :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085216-command-37227-0/report.lisp")
   :BYTES 211153 :SHA256
   "9deb670342ec29cda1da32877f84aa309cea453e71b7f17808e3a97aadc62f00")
  (:PATH #A((38) BASE-CHAR . "processes/mutations/conservazione.lisp") :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085241-command-38293-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "b64308f7ad5d53fc28fd6a21a7e3e84af871572b54d8193749d65a8d78d5256c")
  (:PATH #A((31) BASE-CHAR . "processes/mutations/report.lisp") :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085241-command-38293-0/report.lisp")
   :BYTES 447247 :SHA256
   "f9d46043afd1fd602ee67a9dacfeec94ba55bed209f3b49b522f8539976961d0")
  (:PATH #A((47) BASE-CHAR . "processes/selection-fixtures/conservazione.lisp")
   :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085383-command-44412-0/conservazione.lisp")
   :BYTES 1181 :SHA256
   "038125c9436dc5969e937e1c847bba61ded2608483404932b8e9a76e9a777eb8")
  (:PATH #A((40) BASE-CHAR . "processes/selection-fixtures/report.lisp")
   :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/4001085383-command-44412-0/report.lisp")
   :BYTES 218242 :SHA256
   "3ec7a75ce30fbb5d8d53570df9d4fa5f8464cad6fef307b6e17b8c22c23803ec")
  (:PATH "raw/coverage-selftest/4a06209255c684f04b3e0a248afd2d6e.html" :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/coverage-selftest/4a06209255c684f04b3e0a248afd2d6e.html")
   :BYTES 2847 :SHA256
   "f15530e6a34f11b2002e75aa4a86b0da73c5270968817ffbf2405c613cb6635a")
  (:PATH "raw/coverage-selftest/cover-index.html" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/coverage-selftest/cover-index.html")
   :BYTES 1807 :SHA256
   "d55d1bd745ce49eacfccc8347e0cd86ac514d4560bbe1cfdf93a791d8cbeee20")
  (:PATH "raw/coverage-selftest/coverage-fixture.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/coverage-selftest/coverage-fixture.lisp")
   :BYTES 147 :SHA256
   "3767518fde8bde1e1286dbf663e97eac01f02e038d7f3161df436d9fd3e92559")
  (:PATH "raw/coverage/cover-index.html" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/coverage/cover-index.html")
   :BYTES 1768 :SHA256
   "38ca1d5590d78c0cf3a76005a45c564fec347abd7cb1a60fe45fe036574b3682")
  (:PATH "raw/coverage/coverage-state.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/coverage/coverage-state.lisp")
   :BYTES 325 :SHA256
   "eaa857e60af20cc7a3e77458bee5a24feffe5b78bd1a40b3c41eb5030fcd40ea")
  (:PATH "raw/coverage/coverage-state.lisp.gz" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/coverage/coverage-state.lisp.gz")
   :BYTES 479930 :SHA256
   "57af1b21e8ccfefdb664a66b700113c02695cfef1e8dcd35b1e1921de304edcf")
  (:PATH "raw/coverage/f23b78e5d15c717c2a8dbd67d393e70d.html" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/coverage/f23b78e5d15c717c2a8dbd67d393e70d.html")
   :BYTES 22340 :SHA256
   "d693561b19d656d3983f3e6a110ea8e6eabfa484c04010eeddc3a43789bc1426")
  (:PATH "raw/driver-preparation/commands.txt" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/driver-preparation/commands.txt")
   :BYTES 1073 :SHA256
   "c52e91649993eaf1048b44233f44d6fa5d8c04e9584771fe73d394fc180e2ce3")
  (:PATH "raw/driver-preparation/driver-before-main-close-fix.lisp" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/driver-preparation/driver-before-main-close-fix.lisp")
   :BYTES 22063 :SHA256
   "a19affbd424b46081fa1f46a101ee2ac9b1ccf9653ad40f5dc322e46de51ce11")
  (:PATH "raw/driver-preparation/self-test.stderr.log" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/driver-preparation/self-test.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/driver-preparation/self-test.stdout.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/driver-preparation/self-test.stdout.lisp")
   :BYTES 52384 :SHA256
   "614e1cff628ff8edde35017022d90c98e5fae7a507d07727e5d2c3c4a372d788")
  (:PATH "raw/driver-preparation/syntax.stderr.txt" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/driver-preparation/syntax.stderr.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/driver-preparation/syntax.stdout.txt" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/driver-preparation/syntax.stdout.txt")
   :BYTES 15 :SHA256
   "ad014307ebd4ea195b354c86b1e4f519de88d0079de98ec9dc6ae37db6beb63c")
  (:PATH "raw/frozen-qualification/arcdocdb.asd" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/arcdocdb.asd")
   :BYTES 19794 :SHA256
   "074ac32bfcd888dbe7b0d956815d2b69fc50cd8b4256bc41459c8f87b5b40505")
  (:PATH
   "raw/frozen-qualification/docs/implementazione/cbor-stringa-lettura-decisioni.md.txt"
   :SOURCE
   #A((189) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/docs/implementazione/cbor-stringa-lettura-decisioni.md.txt")
   :BYTES 2858 :SHA256
   "677be00e21eacb886b0c239fe6f812c02cfb889ba7684379d8dc317178251a00")
  (:PATH
   "raw/frozen-qualification/docs/implementazione/cbor-stringa-lettura-metodo.md.txt"
   :SOURCE
   #A((186) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/docs/implementazione/cbor-stringa-lettura-metodo.md.txt")
   :BYTES 3756 :SHA256
   "cc694b31a16a8dca4c2c8b3e520378a6e47112bfd2ad5c542aa176bd78d3bb55")
  (:PATH
   "raw/frozen-qualification/docs/implementazione/cbor-stringa-lettura-prima-revisione.md.txt"
   :SOURCE
   #A((195) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/docs/implementazione/cbor-stringa-lettura-prima-revisione.md.txt")
   :BYTES 12236 :SHA256
   "5dc7e7fd176562d950845c326ecfa0709b93a4b686b174453a896c2461cc5661")
  (:PATH
   "raw/frozen-qualification/docs/implementazione/cbor-stringa-lettura-seconda-revisione.md.txt"
   :SOURCE
   #A((197) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/docs/implementazione/cbor-stringa-lettura-seconda-revisione.md.txt")
   :BYTES 11943 :SHA256
   "4c529eb1cce0cc8ba6ee37d464b716efe5c3766afbc2d91048cd6a1350bd5a0b")
  (:PATH
   "raw/frozen-qualification/docs/implementazione/cbor-stringa-lettura.md.txt"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/docs/implementazione/cbor-stringa-lettura.md.txt")
   :BYTES 1348 :SHA256
   "28a1de42b0bce490a355fe04de4672d5b9d24caacd34d0c8db9c092bfb3aff8e")
  (:PATH "raw/frozen-qualification/docs/tracciabilita/matrice.md.txt" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/docs/tracciabilita/matrice.md.txt")
   :BYTES 55650 :SHA256
   "d9607856e4d5a03bee71d1667c552ffd1eb3d84bf6ff25497f9e90737087787a")
  (:PATH "raw/frozen-qualification/docs/tracciabilita/requisiti.lisp" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/docs/tracciabilita/requisiti.lisp")
   :BYTES 44293 :SHA256
   "234ea2bfbf0255c5416ed98e346f219e3ba47fd8a020f570b99ab2061aa6e409")
  (:PATH "raw/frozen-qualification/src/codec/cbor-array-input.lisp" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/src/codec/cbor-array-input.lisp")
   :BYTES 7521 :SHA256
   "e36efda9d66f532b8221f898a078b7f77dc2a41cdc953ece0b2e08b4ed2417f4")
  (:PATH "raw/frozen-qualification/src/codec/cbor-array-write.lisp" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/src/codec/cbor-array-write.lisp")
   :BYTES 6557 :SHA256
   "2f71d857991f32aacf6c7a0ecbe5e06bcba9289b20f46e496b3e3737ce6c242b")
  (:PATH "raw/frozen-qualification/src/codec/cbor-float-minimal.lisp" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH "raw/frozen-qualification/src/codec/cbor-float-narrow.lisp" :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/src/codec/cbor-float-narrow.lisp")
   :BYTES 4546 :SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb")
  (:PATH "raw/frozen-qualification/src/codec/cbor-float-write.lisp" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/src/codec/cbor-float-write.lisp")
   :BYTES 5083 :SHA256
   "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442")
  (:PATH "raw/frozen-qualification/src/codec/cbor-header.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH "raw/frozen-qualification/src/codec/cbor-item-read.lisp" :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/src/codec/cbor-item-read.lisp")
   :BYTES 2712 :SHA256
   "9a270d6ffa0fa8145ee0d7584c7add7e94a2ed87dccbf893298baf6169b582df")
  (:PATH "raw/frozen-qualification/src/codec/cbor-map-input.lisp" :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/src/codec/cbor-map-input.lisp")
   :BYTES 7945 :SHA256
   "49c61ec854e208e1c72ba66fbd121ef2e7657338ac04f6a74ca2c0b764855292")
  (:PATH "raw/frozen-qualification/src/codec/cbor-map-write.lisp" :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/src/codec/cbor-map-write.lisp")
   :BYTES 6725 :SHA256
   "f22a59c19474dfbd7f29b965dfd90aad8da98554bde78ffebaaacebacd35843f")
  (:PATH "raw/frozen-qualification/src/codec/cbor-minimal.lisp" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH "raw/frozen-qualification/src/codec/cbor-package.lisp" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/src/codec/cbor-package.lisp")
   :BYTES 801 :SHA256
   "5ab29969d2fca3013a2c60da80080a50e1ec9d6df158de9f774dd2f11edf4f6e")
  (:PATH "raw/frozen-qualification/src/codec/cbor-scan-input.lisp" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH "raw/frozen-qualification/src/codec/cbor-scan-items.lisp" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH "raw/frozen-qualification/src/codec/cbor-scan-minimal.lisp" :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH "raw/frozen-qualification/src/codec/cbor-scan-stack.lisp" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/frozen-qualification/src/codec/cbor-scan.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/frozen-qualification/src/codec/cbor-simple-write.lisp" :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e")
  (:PATH "raw/frozen-qualification/src/codec/cbor-space.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH "raw/frozen-qualification/src/codec/cbor-string-read.lisp" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/src/codec/cbor-string-read.lisp")
   :BYTES 3739 :SHA256
   "8cf5bda7cb0cb0b68460fd6aaa54a7d7e8c5c78c82015f4d851699792b4a5a35")
  (:PATH "raw/frozen-qualification/src/codec/cbor-string-write.lisp" :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:PATH "raw/frozen-qualification/src/codec/cbor-tag-input.lisp" :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/src/codec/cbor-tag-input.lisp")
   :BYTES 4929 :SHA256
   "7fdbe580b2f7c7cc0cdc852b21a6c0301660582bbe2ff3c1a1960b742f1f3398")
  (:PATH "raw/frozen-qualification/src/codec/cbor-tag-write.lisp" :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/src/codec/cbor-tag-write.lisp")
   :BYTES 4414 :SHA256
   "6e38148cefefd67fd3208ff788428730ddaf4050c251fa7f32d338cfd22114de")
  (:PATH "raw/frozen-qualification/src/codec/cbor-write.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/frozen-qualification/src/codec/package.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/frozen-qualification/src/codec/utf8.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/frozen-qualification/src/foundation/batch.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH "raw/frozen-qualification/src/foundation/binary.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH "raw/frozen-qualification/src/foundation/conditions.lisp" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH "raw/frozen-qualification/src/foundation/crc32c.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH "raw/frozen-qualification/src/foundation/package.lisp" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH "raw/frozen-qualification/src/foundation/record.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/frozen-qualification/src/package.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-array-write-support.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-array-write-support.lisp")
   :BYTES 8285 :SHA256
   "62e6856789748d577a05ea480cfafe5d8f3212bbc6d87a9ce6d5529a4d2ad3d5")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-array-write-threads.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-array-write-threads.lisp")
   :BYTES 4931 :SHA256
   "5c62d5595054ca8d0a1bea3267c87b6d9b3b3bd6a61fbe44b8cc0a4f0ea5929c")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-array-write.lisp" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-array-write.lisp")
   :BYTES 19742 :SHA256
   "9ed6a20ab5ae2db33ef419986c8ee963898894ce239059eae7866d503fe48098")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-float-write-support.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-float-write-support.lisp")
   :BYTES 10316 :SHA256
   "4452593c913216a8f0b87ccdc6cd8c8dddec3aa4b757b383d2d99af32b54de0f")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-float-write-threads.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-float-write-threads.lisp")
   :BYTES 4533 :SHA256
   "62b562376d29c0eb89f1d31ace62c923654e79b10b27d7fad963f84284153231")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-float-write.lisp" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-float-write.lisp")
   :BYTES 20003 :SHA256
   "2d163a64bff4b9d9b9de576c4a4df05f4d8853f1c3d039e790cbb827be98c8b6")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-header.lisp" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-header.lisp")
   :BYTES 10773 :SHA256
   "6ac998e6ef3f426e1caaf3332088ca3bbc7915369cd80262c8f675a4a960d815")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-item-read-support.lisp"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-item-read-support.lisp")
   :BYTES 6909 :SHA256
   "05831dcb6068baf2988940f675fc0dbdc7bc5ea642119a60e0c504ad00b5bdbc")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-item-read-threads.lisp"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-item-read-threads.lisp")
   :BYTES 3871 :SHA256
   "5769d43e378179cdb7f0ddadca08b49908ef1ed8e35afdeb7064df098b5ba414")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-item-read.lisp" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-item-read.lisp")
   :BYTES 14112 :SHA256
   "56c80aee76b46cb23c5f4eff9c28912bf54104972cc5d5b9cf1b8f5c76b3a7ad")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-map-write-support.lisp"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-map-write-support.lisp")
   :BYTES 8727 :SHA256
   "8993f49efd38f1096f20bacebc58e93b780b23d38ea75b4ae358d93cbd36247e")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-map-write-threads.lisp"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-map-write-threads.lisp")
   :BYTES 4916 :SHA256
   "013ff9fa7e164bece6a7339fe18081e1f850610d41c1ca516471e6379b75416a")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-map-write.lisp" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-map-write.lisp")
   :BYTES 20935 :SHA256
   "e2cbe3b9fd09cf302f127f746c5b73859695c51691c3259227916a298cb2269b")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-minimal-edges.lisp" :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-minimal-edges.lisp")
   :BYTES 1613 :SHA256
   "67a249100bc6bb68319a0ba4b7fd7cb32ef2a883f27bd49a381178f2be582d70")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-minimal-scan-support.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-minimal-scan-support.lisp")
   :BYTES 8363 :SHA256
   "cc0e49ba0aa0434413a80f484ba4660d5df8ac183560ab7ecb88cf3c80831421")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-minimal-scan-threads.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-minimal-scan-threads.lisp")
   :BYTES 5451 :SHA256
   "86fd41fa13cf3242072de63dd0aa755e8651e888b43953a7a65ee185e38d94bf")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-minimal-scan.lisp" :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-minimal-scan.lisp")
   :BYTES 19217 :SHA256
   "c5f4ad4f625e9f875c4b696482d1e59540375abe335bedb7c42031e0212aa2c8")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-minimal-support.lisp"
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-minimal-support.lisp")
   :BYTES 8620 :SHA256
   "96e4fedbf7d351fe6bdb57624182dc8ddf8fc547296ac98202801f80a44e785a")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-minimal-threads.lisp"
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-minimal-threads.lisp")
   :BYTES 4711 :SHA256
   "b188669827d31d68160f8a17dcc33862ed9051f9fc50e869924534a25775adfe")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-minimal.lisp" :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-minimal.lisp")
   :BYTES 12604 :SHA256
   "d129cd217f345a707d06090aecc899555fba007044005b4da7a90e0a56236ef3")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-simple-write-support.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-simple-write-support.lisp")
   :BYTES 5251 :SHA256
   "29f769ce2dbd596d54631c9d572bb2387ed4f1aee986cc46203ce9ef489a40bb")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-simple-write-threads.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-simple-write-threads.lisp")
   :BYTES 4398 :SHA256
   "94a0832a79e52464c5e61172cb538b68646345e465d626f92a80bf6210282032")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-simple-write.lisp" :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-simple-write.lisp")
   :BYTES 10712 :SHA256
   "958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-string-read-support.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-string-read-support.lisp")
   :BYTES 5184 :SHA256
   "461556a3a18f30a44a0eec63c574ca3e68bf27a57863318a7b9b1a1468a29a96")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-string-read-threads.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-string-read-threads.lisp")
   :BYTES 3617 :SHA256
   "ba71397bb3fdc50da2ec4f4f0153ce0018a085981bf02357f1d3cb57467ad75b")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-string-read.lisp" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-string-read.lisp")
   :BYTES 12677 :SHA256
   "b89e7b3f1b07556c4c5240ae077f84479abcc5e6f567b4988b9c49a26fbc5084")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-string-write-support.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-string-write-support.lisp")
   :BYTES 7162 :SHA256
   "3b149d2f6c1a6dac94a2fccf202e780dabf9ae51b481e5be1b8c0681445785cf")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-string-write-threads.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-string-write-threads.lisp")
   :BYTES 4403 :SHA256
   "5981fc5c6b8b41dd59b38ccb121e7882bc1586b5132ef39617f15566d8067214")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-string-write.lisp" :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-string-write.lisp")
   :BYTES 15883 :SHA256
   "ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-structure-support.lisp"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-structure-threads.lisp"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-structure-threads.lisp")
   :BYTES 5149 :SHA256
   "fd71ff578d827f980eef25144f26510e88d8069aa11b64dab7826698d6d58afd")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-structure.lisp" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-structure.lisp")
   :BYTES 22968 :SHA256
   "795d7c2edac33b6cde7c8c472e2e1933a0187e2baaa68be64c26f16a13bf5110")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-support.lisp" :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-tag-write-support.lisp"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-tag-write-support.lisp")
   :BYTES 7943 :SHA256
   "db0fdd9fd3c1e1db77f736a3f1cd162e71cab39de83a74abc51d72ff5b18b101")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-tag-write-threads.lisp"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-tag-write-threads.lisp")
   :BYTES 4796 :SHA256
   "ade0f4577f6ad22fcdffa5c4ff75c2eaaa32611709e3e72b2d1a30921406a198")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-tag-write.lisp" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-tag-write.lisp")
   :BYTES 19161 :SHA256
   "69b4f3bf2960ae262a8bbe99444df7d6cad4dc73e253788274e473d7458b8b98")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-threads.lisp" :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-threads.lisp")
   :BYTES 4652 :SHA256
   "8b1a3871c25047145b825fa59c89b399bdfff72faf7d074b81c751618ff83856")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-write-roundtrip.lisp"
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-write-roundtrip.lisp")
   :BYTES 901 :SHA256
   "ced3413cc0313c6275c1e13eca40e72727cfca511d917dcb121941bbc2cef344")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-write-support.lisp" :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-write-support.lisp")
   :BYTES 4768 :SHA256
   "e5290bd835e4b111b4d0fc0d307ca397e5220b96af4281f6153d468213421cc6")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-write-threads.lisp" :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-write-threads.lisp")
   :BYTES 4914 :SHA256
   "3ae6b308395a201603920d29c10226c47468480121252d8f4e899a46913d2497")
  (:PATH "raw/frozen-qualification/tests/codec/cbor-write.lisp" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/cbor-write.lisp")
   :BYTES 9822 :SHA256
   "0a8ac6cb0a8b1db23c306349a658601745fb39a80b28293f55672071a12610e3")
  (:PATH "raw/frozen-qualification/tests/codec/support.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/support.lisp")
   :BYTES 5807 :SHA256
   "32f653ba22788d8a08ad5bb38d1c418916432594d58ec04fbc9bb81206736b96")
  (:PATH "raw/frozen-qualification/tests/codec/threads.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/threads.lisp")
   :BYTES 3974 :SHA256
   "773f7b81aed2b5ea19bdd5ca0429c304872ee7db319b9a97b82239af33c36dba")
  (:PATH "raw/frozen-qualification/tests/codec/utf8.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/codec/utf8.lisp")
   :BYTES 12892 :SHA256
   "7692bbbe1831824c177985152fd48178a9d7daa85e4add0817361e51d4dc6100")
  (:PATH "raw/frozen-qualification/tests/foundation/support.lisp" :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH "raw/frozen-qualification/tools/build.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tools/build.lisp")
   :BYTES 1245 :SHA256
   "be55166510051b57c6d6d2f8b0e4143375cec5bfab30aab5a58e5e14445a5832")
  (:PATH "raw/frozen-qualification/tools/cbor-string-read-driver.lisp" :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tools/cbor-string-read-driver.lisp")
   :BYTES 22062 :SHA256
   "3ab22f03b76e4990f0a17760542c19d00339bae63607b1266e26464378e62143")
  (:PATH "raw/frozen-qualification/tools/foundation-coverage.lisp" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tools/foundation-coverage.lisp")
   :BYTES 27748 :SHA256
   "0631b5c8b3985d5215b66cc240cfd87b8a272fa81a691946a72f681b6ae47208")
  (:PATH "raw/frozen-qualification/tools/record-command.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/frozen-qualification/tools/record-command.lisp")
   :BYTES 6501 :SHA256
   "fae7e2a630e10ae6a1073d072065f9ae0ccef132f6221cb8b91c75124537cb16")
  (:PATH
   "raw/frozen/spikes/out/cbor-string-read-20261015/prepare-coverage.lisp"
   :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/prepare-coverage.lisp")
   :BYTES 538 :SHA256
   "695b6cbdffdd976f3ca06bdf6e890f287c823619cba6d3049b8944c1a8f8fd6b")
  (:PATH
   "raw/frozen/spikes/out/cbor-string-read-20261015/selection-tests/01-positive/manifest.lisp"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/01-positive/manifest.lisp")
   :BYTES 810 :SHA256
   "73cb07d230d130bffb1768b6f5fd97bfed19bad682316a4fd7298271b83912ae")
  (:PATH
   "raw/frozen/spikes/out/cbor-string-read-20261015/selection-tests/01-positive/plan.lisp"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/01-positive/plan.lisp")
   :BYTES 427 :SHA256
   "8f848e135a77dcb48fc02825aa7e416b5723f2f2cebdf08cefdfc433a25d0906")
  (:PATH
   "raw/frozen/spikes/out/cbor-string-read-20261015/selection-tests/01-positive/result.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/01-positive/result.lisp")
   :BYTES 2088 :SHA256
   "433fc23c95e696a09ccd83a27590434224088251e20b3f56e977d1c0470d8eee")
  (:PATH
   "raw/frozen/spikes/out/cbor-string-read-20261015/selection-tests/01-positive/stderr.log"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/01-positive/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/frozen/spikes/out/cbor-string-read-20261015/selection-tests/01-positive/stdout.lisp"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/01-positive/stdout.lisp")
   :BYTES 138 :SHA256
   "3add63ce53cc734f92501c9b2e22eeaf77e0a20299e43a3f4e15912200a94bc0")
  (:PATH
   "raw/frozen/spikes/out/cbor-string-read-20261015/selection-tests/02-collision/plan.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/02-collision/plan.lisp")
   :BYTES 430 :SHA256
   "837da066ed746e29c24007996cf0c0ac9da60de0967798f2d69dac35a2bd360f")
  (:PATH
   "raw/frozen/spikes/out/cbor-string-read-20261015/selection-tests/02-collision/result.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/02-collision/result.lisp")
   :BYTES 1804 :SHA256
   "a8679a69eb55b572e52a1a6da359fea187c9b2966be28692b242e7a4aa556597")
  (:PATH
   "raw/frozen/spikes/out/cbor-string-read-20261015/selection-tests/02-collision/stderr.log"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/02-collision/stderr.log")
   :BYTES 6074 :SHA256
   "cb0f7f2242699775cb1293c8b43db0c76b2515b8b82aec5feba7e15a5a25c8e7")
  (:PATH
   "raw/frozen/spikes/out/cbor-string-read-20261015/selection-tests/02-collision/stdout.lisp"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/02-collision/stdout.lisp")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/frozen/spikes/out/cbor-string-read-20261015/selection-tests/03-symlink/plan.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/03-symlink/plan.lisp")
   :BYTES 424 :SHA256
   "d22c77e042c51f24b16fb9e7fadb21a1c51b74607d3dfda4f0cb30748a6b1c30")
  (:PATH
   "raw/frozen/spikes/out/cbor-string-read-20261015/selection-tests/03-symlink/result.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/03-symlink/result.lisp")
   :BYTES 1511 :SHA256
   "32a2b661ce767bc24682879498cd756148ee741433b6ee5354068aa35856eaf4")
  (:PATH
   "raw/frozen/spikes/out/cbor-string-read-20261015/selection-tests/03-symlink/stderr.log"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/03-symlink/stderr.log")
   :BYTES 6496 :SHA256
   "97069524b9d006d3f7b58667a21ecb275b9c593015cf3e515083ed51b75282a6")
  (:PATH
   "raw/frozen/spikes/out/cbor-string-read-20261015/selection-tests/03-symlink/stdout.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/03-symlink/stdout.lisp")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/frozen/spikes/out/cbor-string-read-20261015/selection-tests/04-depth33/plan.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/04-depth33/plan.lisp")
   :BYTES 424 :SHA256
   "eb5189c5f1883503f10579c87610d08d12a7dd1fd22201af0d6d71a08eda4032")
  (:PATH
   "raw/frozen/spikes/out/cbor-string-read-20261015/selection-tests/04-depth33/result.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/04-depth33/result.lisp")
   :BYTES 1216 :SHA256
   "5eaf667b9e51092b0256956e3034b68c7e475803cc13a42ddfb08101e8e503e4")
  (:PATH
   "raw/frozen/spikes/out/cbor-string-read-20261015/selection-tests/04-depth33/stderr.log"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/04-depth33/stderr.log")
   :BYTES 20057 :SHA256
   "b93f6135e3f6811353fd6c8ab3c89b66c0a71017dbc0c18ba88cff420924ffbc")
  (:PATH
   "raw/frozen/spikes/out/cbor-string-read-20261015/selection-tests/04-depth33/stdout.lisp"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/04-depth33/stdout.lisp")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/frozen/spikes/out/cbor-string-read-20261015/selection-tests/launch.stderr.log"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/launch.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/frozen/spikes/out/cbor-string-read-20261015/selection-tests/launch.stdout.txt"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/launch.stdout.txt")
   :BYTES 251 :SHA256
   "08e5d897c792c5dc10d3d5329e305508d70a3479ae8d7113eb3425d42c6d26f0")
  (:PATH
   "raw/frozen/spikes/out/cbor-string-read-20261015/selection-tests/preparation-syntax.error.log"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/preparation-syntax.error.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "raw/frozen/spikes/out/cbor-string-read-20261015/selection-tests/preparation-syntax.output.lisp"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/preparation-syntax.output.lisp")
   :BYTES 69 :SHA256
   "afccba37a2c9242a63522486cc62623906557cc37d5782cbdd88cb54fcb68392")
  (:PATH
   "raw/frozen/spikes/out/cbor-string-read-20261015/selection-tests/report.lisp"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/report.lisp")
   :BYTES 6489 :SHA256
   "8a9afcaae7eaaab05c912eacde5e08048a97f3d1d841438919002902b7a07a21")
  (:PATH
   "raw/frozen/spikes/out/cbor-string-read-20261015/selection-tests/run.lisp"
   :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/run.lisp")
   :BYTES 9664 :SHA256
   "0009123b6f8c35d7252382b113c3c3d6c01bc3815fe1a267a60055b5031fd966")
  (:PATH "raw/independent-mutations/extract-result.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-mutations/extract-result.lisp")
   :BYTES 1406 :SHA256
   "faf8b0b9a7229f8e5f993c0d605c1d02d03d1664332a0adc31113d254f6f9ac7")
  (:PATH "raw/independent-mutations/extraction.error.log" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-mutations/extraction.error.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/independent-mutations/extraction.output.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-mutations/extraction.output.lisp")
   :BYTES 3333 :SHA256
   "ffd5bc826b1ee4b522a8f170401135e97e37e07c047149aed1f868a1394fa3a4")
  (:PATH "raw/independent-mutations/launch.stderr.log" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-mutations/launch.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/independent-mutations/launch.stdout.txt" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-mutations/launch.stdout.txt")
   :BYTES 261 :SHA256
   "7289b34530e43026714809e9093367769c60b170009758272b5de5f74dc105a6")
  (:PATH "raw/independent-mutations/preparation-syntax.error.log" :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-mutations/preparation-syntax.error.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/independent-mutations/preparation-syntax.output.lisp" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-mutations/preparation-syntax.output.lisp")
   :BYTES 67 :SHA256
   "7239219185efb78f6553b5a6764e176d19d1d51027d1096e7c09fb776e6f85ff")
  (:PATH "raw/independent-mutations/query-before-reader-error.txt" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-mutations/query-before-reader-error.txt")
   :BYTES 538 :SHA256
   "e38078e52a7ad96a9d8f8bf05748c298a660a4720f26d0886b4956b77fa96a37")
  (:PATH "raw/independent-mutations/query-before-reader.lisp.txt" :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-mutations/query-before-reader.lisp.txt")
   :BYTES 738 :SHA256
   "59fa26d73efd95e14ac7f097bcfc9abb0d31851463ed55d955a74baa91db48b2")
  (:PATH "raw/independent-mutations/reading.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-mutations/reading.lisp")
   :BYTES 15803 :SHA256
   "e0498b92104261ee2e4c51f4ee7e4ebd9ca65a09e99ef4c1edea6fb803df0369")
  (:PATH "raw/independent-mutations/reading.md.txt" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-mutations/reading.md.txt")
   :BYTES 4990 :SHA256
   "d9167f59e2b3a8b3ef2e02ae8a4970602098bf20950e18af89f1fcbe992228d3")
  (:PATH "raw/independent-mutations/status.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-mutations/status.lisp")
   :BYTES 177 :SHA256
   "b047ae4f7a14b8258623589534685b2c9d0cd304b383679860db90661fa4faf2")
  (:PATH "raw/independent-mutations/stderr.log" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-mutations/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/independent-mutations/stdout.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-mutations/stdout.lisp")
   :BYTES 140275 :SHA256
   "44339f3454f0378fbbd50b8ebcc85865c3b6771b119eb83b4a5118856e31fde0")
  (:PATH "raw/independent-reading/bench-reading-v2.error.txt" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/bench-reading-v2.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/independent-reading/bench-reading-v2.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/bench-reading-v2.lisp")
   :BYTES 14539 :SHA256
   "915cf7db359bd2d99a933bf49e3b62aef9848c31776547fcf4bbf4707c0be673")
  (:PATH "raw/independent-reading/bench-reading-v2.output.txt" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/bench-reading-v2.output.txt")
   :BYTES 1907 :SHA256
   "c485e8abcb4d8629a472073f77ee2202c58c936cc1f441aaa6f002b830f71d58")
  (:PATH "raw/independent-reading/bench-reading.error.txt" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/bench-reading.error.txt")
   :BYTES 183 :SHA256
   "b57ed1781ffc7367068f23f3c56614574420f22b0711c8f2558ee11637980442")
  (:PATH "raw/independent-reading/bench-reading.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/bench-reading.lisp")
   :BYTES 14372 :SHA256
   "66d7e750a927e39696c17b89cc40263fa4ab61d3c3605c189edd260e7f3caea8")
  (:PATH "raw/independent-reading/bench-reading.output.txt" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/bench-reading.output.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/independent-reading/coverage-details-v2.error.txt" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/coverage-details-v2.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/independent-reading/coverage-details-v2.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/coverage-details-v2.lisp")
   :BYTES 7947 :SHA256
   "6afde4a85aea9cad56240e28c389c8172f92ef633a84388d58b4a77877fda5a5")
  (:PATH "raw/independent-reading/coverage-details-v2.output.txt" :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/coverage-details-v2.output.txt")
   :BYTES 1443 :SHA256
   "53f98a3344c4ebde6ce6623ce0ad022fc0e4149c8912351cec94a3d8a6020ff0")
  (:PATH "raw/independent-reading/coverage-details.error.txt" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/coverage-details.error.txt")
   :BYTES 1101 :SHA256
   "28b49787545ab90c37e1c361132eef4131dbb89c0f3a1b366e845e0e29624f9c")
  (:PATH "raw/independent-reading/coverage-details.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/coverage-details.lisp")
   :BYTES 7938 :SHA256
   "f017d9696b9acf7ab322f813a9fed94b93de38651268bfedecb26e53f087cc63")
  (:PATH "raw/independent-reading/coverage-details.output.txt" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/coverage-details.output.txt")
   :BYTES 1440 :SHA256
   "536c066b6bcd6c8d5b2cf21d95cdd3e1254a55864d924993696037042f4072f2")
  (:PATH "raw/independent-reading/coverage-reading-v2.error.txt" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/coverage-reading-v2.error.txt")
   :BYTES 29274 :SHA256
   "a75873927cf8c683bd63cb93a5dc2a9dc38dd7d74cb78938d331c5f7e5eb4576")
  (:PATH "raw/independent-reading/coverage-reading-v2.output.txt" :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/coverage-reading-v2.output.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/independent-reading/coverage-reading-v3.error.txt" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/coverage-reading-v3.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/independent-reading/coverage-reading-v3.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/coverage-reading-v3.lisp")
   :BYTES 14269 :SHA256
   "cfab052015ae78cd4262497d7aca191c55fe363bec5b0d66bfe371cdabe8de07")
  (:PATH "raw/independent-reading/coverage-reading-v3.output.txt" :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/coverage-reading-v3.output.txt")
   :BYTES 10706 :SHA256
   "57f6e162a70d27a0996a9750fa757e74cd5c0474085aa2a6a33ad5b194507a72")
  (:PATH "raw/independent-reading/coverage-reading.error.txt" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/coverage-reading.error.txt")
   :BYTES 2029 :SHA256
   "2998fa81b928edbd8008257eb7052dc680a13a29219a5fcc19f34766b04204f7")
  (:PATH "raw/independent-reading/coverage-reading.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/coverage-reading.lisp")
   :BYTES 14236 :SHA256
   "6db3649ea8d176863bd2fb8408bc9b77d8c8bb966217ad75c797b3af12e133f8")
  (:PATH "raw/independent-reading/coverage-reading.output.txt" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/coverage-reading.output.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/independent-reading/fullcheck-reading.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/fullcheck-reading.lisp")
   :BYTES 6938 :SHA256
   "86ca7931cf1c86cccbbb504ae6a419ba866819e79cf9d9e58813adef45fe5ef4")
  (:PATH "raw/independent-reading/inspect-fullcheck-markers.error.txt" :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/inspect-fullcheck-markers.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/independent-reading/inspect-fullcheck-markers.lisp" :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/inspect-fullcheck-markers.lisp")
   :BYTES 570 :SHA256
   "5776a97fe871b585363ed3eaecb8a6f7fd5491759ce0323276dc227d6d029732")
  (:PATH "raw/independent-reading/inspect-fullcheck-markers.output.txt" :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/inspect-fullcheck-markers.output.txt")
   :BYTES 3924 :SHA256
   "3c0cf0681c7cb93070adc0ef6f6dd0133ecc592c82483c397e28f9137886ac54")
  (:PATH "raw/independent-reading/inspect-fullcheck.error.txt" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/inspect-fullcheck.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/independent-reading/inspect-fullcheck.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/inspect-fullcheck.lisp")
   :BYTES 1265 :SHA256
   "4e4fd85c4a5b8afa59567651b6a9d3c59a3340eba4af5adb1a1e69003294dc6e")
  (:PATH "raw/independent-reading/inspect-fullcheck.output.txt" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/inspect-fullcheck.output.txt")
   :BYTES 3598 :SHA256
   "001b48b86ffed41e8e94b3395c38b1767c10d2d45bacbaff260c9176682605a7")
  (:PATH "raw/independent-reading/prepare-coverage-reading-v2.error.txt"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/prepare-coverage-reading-v2.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/independent-reading/prepare-coverage-reading-v2.lisp" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/prepare-coverage-reading-v2.lisp")
   :BYTES 3683 :SHA256
   "794f7dbb5cbf3cb58d58aea6c0ddb3e91b1f4132aa2f9675245e12d2ad81f888")
  (:PATH "raw/independent-reading/prepare-coverage-reading-v2.output.txt"
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/prepare-coverage-reading-v2.output.txt")
   :BYTES 143 :SHA256
   "8690ba62df01dad7157b9e7473a314cda85faf5a5f20d8b4573ba6e75d48fa24")
  (:PATH "raw/independent-reading/prepare-coverage-reading.error.txt" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/prepare-coverage-reading.error.txt")
   :BYTES 31122 :SHA256
   "f2344f809c57a3b5fd20db2df1f8a82d7baed0a41053fdb4e9f221ceee844d27")
  (:PATH "raw/independent-reading/prepare-coverage-reading.lisp" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/prepare-coverage-reading.lisp")
   :BYTES 3732 :SHA256
   "4c7a9b1a0c9e9ea6cfa09cc7fde57dc5537e77d630eab1ea50ce5517907c4385")
  (:PATH "raw/independent-reading/prepare-coverage-reading.output.txt" :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/prepare-coverage-reading.output.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/independent-reading/run-final-data-readers.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/run-final-data-readers.lisp")
   :BYTES 1030 :SHA256
   "e9e5cc5571564c6a47611925bc3827cee2f5e3207d04b0a83188d74a2d1dc801")
  (:PATH "raw/independent-reading/runtime-reading.md.txt" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/independent-reading/runtime-reading.md")
   :BYTES 10316 :SHA256
   "f313159e9286ac5bf98efb954c949c543d6b5a7081f68c7865eccd7ea0615568")
  (:PATH "raw/mutation-driver/catalog.lisp" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutation-driver/catalog.lisp")
   :BYTES 6833 :SHA256
   "be1c765c4bc76b9655afa04320313d92dc7c804abc91f9177698468b29069c27")
  (:PATH "raw/mutation-driver/child.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutation-driver/child.lisp")
   :BYTES 4232 :SHA256
   "4d4d4c8aadc2eb177a129c93c369506afae9e29666eed68e8998974947a92973")
  (:PATH "raw/mutation-driver/run.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutation-driver/run.lisp")
   :BYTES 18699 :SHA256
   "f114ba0676996050dfc66d5505b21b2c1ee07ada4a0f99d7bcf5b0112cd90a9a")
  (:PATH "raw/mutations-R1/baseline/child.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/child.lisp")
   :BYTES 4232 :SHA256
   "4d4d4c8aadc2eb177a129c93c369506afae9e29666eed68e8998974947a92973")
  (:PATH "raw/mutations-R1/baseline/plan.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/plan.lisp")
   :BYTES 5877 :SHA256
   "3b9c154353cdb96bfaa76b778557ea3d4036ab3fc0a8078b309df043a8ed2ab0")
  (:PATH "raw/mutations-R1/baseline/src/codec/cbor-array-input.lisp" :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-array-input.lisp")
   :BYTES 7521 :SHA256
   "e36efda9d66f532b8221f898a078b7f77dc2a41cdc953ece0b2e08b4ed2417f4")
  (:PATH "raw/mutations-R1/baseline/src/codec/cbor-array-write.lisp" :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-array-write.lisp")
   :BYTES 6557 :SHA256
   "2f71d857991f32aacf6c7a0ecbe5e06bcba9289b20f46e496b3e3737ce6c242b")
  (:PATH "raw/mutations-R1/baseline/src/codec/cbor-float-minimal.lisp" :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH "raw/mutations-R1/baseline/src/codec/cbor-float-narrow.lisp" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-float-narrow.lisp")
   :BYTES 4546 :SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb")
  (:PATH "raw/mutations-R1/baseline/src/codec/cbor-float-write.lisp" :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-float-write.lisp")
   :BYTES 5083 :SHA256
   "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442")
  (:PATH "raw/mutations-R1/baseline/src/codec/cbor-header.lisp" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH "raw/mutations-R1/baseline/src/codec/cbor-item-read.lisp" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-item-read.lisp")
   :BYTES 2712 :SHA256
   "9a270d6ffa0fa8145ee0d7584c7add7e94a2ed87dccbf893298baf6169b582df")
  (:PATH "raw/mutations-R1/baseline/src/codec/cbor-map-input.lisp" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-map-input.lisp")
   :BYTES 7945 :SHA256
   "49c61ec854e208e1c72ba66fbd121ef2e7657338ac04f6a74ca2c0b764855292")
  (:PATH "raw/mutations-R1/baseline/src/codec/cbor-map-write.lisp" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-map-write.lisp")
   :BYTES 6725 :SHA256
   "f22a59c19474dfbd7f29b965dfd90aad8da98554bde78ffebaaacebacd35843f")
  (:PATH "raw/mutations-R1/baseline/src/codec/cbor-minimal.lisp" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH "raw/mutations-R1/baseline/src/codec/cbor-package.lisp" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-package.lisp")
   :BYTES 801 :SHA256
   "5ab29969d2fca3013a2c60da80080a50e1ec9d6df158de9f774dd2f11edf4f6e")
  (:PATH "raw/mutations-R1/baseline/src/codec/cbor-scan-input.lisp" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH "raw/mutations-R1/baseline/src/codec/cbor-scan-items.lisp" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH "raw/mutations-R1/baseline/src/codec/cbor-scan-minimal.lisp" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH "raw/mutations-R1/baseline/src/codec/cbor-scan-stack.lisp" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/mutations-R1/baseline/src/codec/cbor-scan.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/mutations-R1/baseline/src/codec/cbor-simple-write.lisp" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e")
  (:PATH "raw/mutations-R1/baseline/src/codec/cbor-space.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH "raw/mutations-R1/baseline/src/codec/cbor-string-read.lisp" :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-string-read.lisp")
   :BYTES 3739 :SHA256
   "8cf5bda7cb0cb0b68460fd6aaa54a7d7e8c5c78c82015f4d851699792b4a5a35")
  (:PATH "raw/mutations-R1/baseline/src/codec/cbor-string-write.lisp" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:PATH "raw/mutations-R1/baseline/src/codec/cbor-tag-input.lisp" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-tag-input.lisp")
   :BYTES 4929 :SHA256
   "7fdbe580b2f7c7cc0cdc852b21a6c0301660582bbe2ff3c1a1960b742f1f3398")
  (:PATH "raw/mutations-R1/baseline/src/codec/cbor-tag-write.lisp" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-tag-write.lisp")
   :BYTES 4414 :SHA256
   "6e38148cefefd67fd3208ff788428730ddaf4050c251fa7f32d338cfd22114de")
  (:PATH "raw/mutations-R1/baseline/src/codec/cbor-write.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/mutations-R1/baseline/src/codec/package.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/mutations-R1/baseline/src/codec/utf8.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/mutations-R1/baseline/src/foundation/batch.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH "raw/mutations-R1/baseline/src/foundation/binary.lisp" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH "raw/mutations-R1/baseline/src/foundation/conditions.lisp" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH "raw/mutations-R1/baseline/src/foundation/crc32c.lisp" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH "raw/mutations-R1/baseline/src/foundation/package.lisp" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH "raw/mutations-R1/baseline/src/foundation/record.lisp" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/mutations-R1/baseline/src/package.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/mutations-R1/baseline/stderr.log" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/stderr.log")
   :BYTES 777 :SHA256
   "16997cc687a104d88acb52df504c9241dd89fc56dc3133c4b00036450006719f")
  (:PATH "raw/mutations-R1/baseline/stdout.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/stdout.lisp")
   :BYTES 2726 :SHA256
   "a2bbe3bf3557db85e284769962c3bc23db1397246538ef15c552c299c15a6485")
  (:PATH "raw/mutations-R1/baseline/tests/codec/cbor-string-read-support.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/tests/codec/cbor-string-read-support.lisp")
   :BYTES 5184 :SHA256
   "461556a3a18f30a44a0eec63c574ca3e68bf27a57863318a7b9b1a1468a29a96")
  (:PATH "raw/mutations-R1/baseline/tests/codec/cbor-string-read-threads.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/tests/codec/cbor-string-read-threads.lisp")
   :BYTES 3617 :SHA256
   "ba71397bb3fdc50da2ec4f4f0153ce0018a085981bf02357f1d3cb57467ad75b")
  (:PATH "raw/mutations-R1/baseline/tests/codec/cbor-string-read.lisp" :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/tests/codec/cbor-string-read.lisp")
   :BYTES 12677 :SHA256
   "b89e7b3f1b07556c4c5240ae077f84479abcc5e6f567b4988b9c49a26fbc5084")
  (:PATH "raw/mutations-R1/baseline/tests/codec/cbor-structure-support.lisp"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH "raw/mutations-R1/baseline/tests/codec/cbor-support.lisp" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH "raw/mutations-R1/baseline/tests/foundation/support.lisp" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/baseline/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH "raw/mutations-R1/catalog.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/catalog.lisp")
   :BYTES 6833 :SHA256
   "be1c765c4bc76b9655afa04320313d92dc7c804abc91f9177698468b29069c27")
  (:PATH "raw/mutations-R1/child.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/child.lisp")
   :BYTES 4232 :SHA256
   "4d4d4c8aadc2eb177a129c93c369506afae9e29666eed68e8998974947a92973")
  (:PATH "raw/mutations-R1/extra-fourth-nil/child.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/child.lisp")
   :BYTES 4232 :SHA256
   "4d4d4c8aadc2eb177a129c93c369506afae9e29666eed68e8998974947a92973")
  (:PATH "raw/mutations-R1/extra-fourth-nil/plan.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/plan.lisp")
   :BYTES 5877 :SHA256
   "5afb91a4847a47fa5b5d39f109752533b3ddf05f46a1826e91b52e3461e8fbcc")
  (:PATH "raw/mutations-R1/extra-fourth-nil/src/codec/cbor-array-input.lisp"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-array-input.lisp")
   :BYTES 7521 :SHA256
   "e36efda9d66f532b8221f898a078b7f77dc2a41cdc953ece0b2e08b4ed2417f4")
  (:PATH "raw/mutations-R1/extra-fourth-nil/src/codec/cbor-array-write.lisp"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-array-write.lisp")
   :BYTES 6557 :SHA256
   "2f71d857991f32aacf6c7a0ecbe5e06bcba9289b20f46e496b3e3737ce6c242b")
  (:PATH "raw/mutations-R1/extra-fourth-nil/src/codec/cbor-float-minimal.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH "raw/mutations-R1/extra-fourth-nil/src/codec/cbor-float-narrow.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-float-narrow.lisp")
   :BYTES 4546 :SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb")
  (:PATH "raw/mutations-R1/extra-fourth-nil/src/codec/cbor-float-write.lisp"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-float-write.lisp")
   :BYTES 5083 :SHA256
   "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442")
  (:PATH "raw/mutations-R1/extra-fourth-nil/src/codec/cbor-header.lisp" :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH "raw/mutations-R1/extra-fourth-nil/src/codec/cbor-item-read.lisp"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-item-read.lisp")
   :BYTES 2712 :SHA256
   "9a270d6ffa0fa8145ee0d7584c7add7e94a2ed87dccbf893298baf6169b582df")
  (:PATH "raw/mutations-R1/extra-fourth-nil/src/codec/cbor-map-input.lisp"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-map-input.lisp")
   :BYTES 7945 :SHA256
   "49c61ec854e208e1c72ba66fbd121ef2e7657338ac04f6a74ca2c0b764855292")
  (:PATH "raw/mutations-R1/extra-fourth-nil/src/codec/cbor-map-write.lisp"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-map-write.lisp")
   :BYTES 6725 :SHA256
   "f22a59c19474dfbd7f29b965dfd90aad8da98554bde78ffebaaacebacd35843f")
  (:PATH "raw/mutations-R1/extra-fourth-nil/src/codec/cbor-minimal.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH "raw/mutations-R1/extra-fourth-nil/src/codec/cbor-package.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-package.lisp")
   :BYTES 801 :SHA256
   "5ab29969d2fca3013a2c60da80080a50e1ec9d6df158de9f774dd2f11edf4f6e")
  (:PATH "raw/mutations-R1/extra-fourth-nil/src/codec/cbor-scan-input.lisp"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH "raw/mutations-R1/extra-fourth-nil/src/codec/cbor-scan-items.lisp"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH "raw/mutations-R1/extra-fourth-nil/src/codec/cbor-scan-minimal.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH "raw/mutations-R1/extra-fourth-nil/src/codec/cbor-scan-stack.lisp"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/mutations-R1/extra-fourth-nil/src/codec/cbor-scan.lisp" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/mutations-R1/extra-fourth-nil/src/codec/cbor-simple-write.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e")
  (:PATH "raw/mutations-R1/extra-fourth-nil/src/codec/cbor-space.lisp" :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH "raw/mutations-R1/extra-fourth-nil/src/codec/cbor-string-read.lisp"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-string-read.lisp")
   :BYTES 3748 :SHA256
   "36b70a69e220f01958d50924cdc5182ae5185a1cc1b13fb5cbf61ad169a8fb69")
  (:PATH "raw/mutations-R1/extra-fourth-nil/src/codec/cbor-string-write.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:PATH "raw/mutations-R1/extra-fourth-nil/src/codec/cbor-tag-input.lisp"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-tag-input.lisp")
   :BYTES 4929 :SHA256
   "7fdbe580b2f7c7cc0cdc852b21a6c0301660582bbe2ff3c1a1960b742f1f3398")
  (:PATH "raw/mutations-R1/extra-fourth-nil/src/codec/cbor-tag-write.lisp"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-tag-write.lisp")
   :BYTES 4414 :SHA256
   "6e38148cefefd67fd3208ff788428730ddaf4050c251fa7f32d338cfd22114de")
  (:PATH "raw/mutations-R1/extra-fourth-nil/src/codec/cbor-write.lisp" :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/mutations-R1/extra-fourth-nil/src/codec/package.lisp" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/mutations-R1/extra-fourth-nil/src/codec/utf8.lisp" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/mutations-R1/extra-fourth-nil/src/foundation/batch.lisp" :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH "raw/mutations-R1/extra-fourth-nil/src/foundation/binary.lisp" :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH "raw/mutations-R1/extra-fourth-nil/src/foundation/conditions.lisp"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH "raw/mutations-R1/extra-fourth-nil/src/foundation/crc32c.lisp" :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH "raw/mutations-R1/extra-fourth-nil/src/foundation/package.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH "raw/mutations-R1/extra-fourth-nil/src/foundation/record.lisp" :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/mutations-R1/extra-fourth-nil/src/package.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/mutations-R1/extra-fourth-nil/stderr.log" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/mutations-R1/extra-fourth-nil/stdout.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/stdout.lisp")
   :BYTES 1736 :SHA256
   "3e9f078680ae0b4fc99aec28de26b386b1abeb8baa5159afd1d8d04bd48bb7f2")
  (:PATH
   "raw/mutations-R1/extra-fourth-nil/tests/codec/cbor-string-read-support.lisp"
   :SOURCE
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/tests/codec/cbor-string-read-support.lisp")
   :BYTES 5184 :SHA256
   "461556a3a18f30a44a0eec63c574ca3e68bf27a57863318a7b9b1a1468a29a96")
  (:PATH
   "raw/mutations-R1/extra-fourth-nil/tests/codec/cbor-string-read-threads.lisp"
   :SOURCE
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/tests/codec/cbor-string-read-threads.lisp")
   :BYTES 3617 :SHA256
   "ba71397bb3fdc50da2ec4f4f0153ce0018a085981bf02357f1d3cb57467ad75b")
  (:PATH "raw/mutations-R1/extra-fourth-nil/tests/codec/cbor-string-read.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/tests/codec/cbor-string-read.lisp")
   :BYTES 12677 :SHA256
   "b89e7b3f1b07556c4c5240ae077f84479abcc5e6f567b4988b9c49a26fbc5084")
  (:PATH
   "raw/mutations-R1/extra-fourth-nil/tests/codec/cbor-structure-support.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH "raw/mutations-R1/extra-fourth-nil/tests/codec/cbor-support.lisp"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH "raw/mutations-R1/extra-fourth-nil/tests/foundation/support.lisp"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/extra-fourth-nil/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH "raw/mutations-R1/ignore-high-length-word/child.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/child.lisp")
   :BYTES 4232 :SHA256
   "4d4d4c8aadc2eb177a129c93c369506afae9e29666eed68e8998974947a92973")
  (:PATH "raw/mutations-R1/ignore-high-length-word/plan.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/plan.lisp")
   :BYTES 5877 :SHA256
   "06cc7a39f9c2c376696e39a73537e98787beb617ee9173a5a54aa689ff274076")
  (:PATH
   "raw/mutations-R1/ignore-high-length-word/src/codec/cbor-array-input.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-array-input.lisp")
   :BYTES 7521 :SHA256
   "e36efda9d66f532b8221f898a078b7f77dc2a41cdc953ece0b2e08b4ed2417f4")
  (:PATH
   "raw/mutations-R1/ignore-high-length-word/src/codec/cbor-array-write.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-array-write.lisp")
   :BYTES 6557 :SHA256
   "2f71d857991f32aacf6c7a0ecbe5e06bcba9289b20f46e496b3e3737ce6c242b")
  (:PATH
   "raw/mutations-R1/ignore-high-length-word/src/codec/cbor-float-minimal.lisp"
   :SOURCE
   #A((180) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH
   "raw/mutations-R1/ignore-high-length-word/src/codec/cbor-float-narrow.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-float-narrow.lisp")
   :BYTES 4546 :SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb")
  (:PATH
   "raw/mutations-R1/ignore-high-length-word/src/codec/cbor-float-write.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-float-write.lisp")
   :BYTES 5083 :SHA256
   "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442")
  (:PATH "raw/mutations-R1/ignore-high-length-word/src/codec/cbor-header.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH
   "raw/mutations-R1/ignore-high-length-word/src/codec/cbor-item-read.lisp"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-item-read.lisp")
   :BYTES 2712 :SHA256
   "9a270d6ffa0fa8145ee0d7584c7add7e94a2ed87dccbf893298baf6169b582df")
  (:PATH
   "raw/mutations-R1/ignore-high-length-word/src/codec/cbor-map-input.lisp"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-map-input.lisp")
   :BYTES 7945 :SHA256
   "49c61ec854e208e1c72ba66fbd121ef2e7657338ac04f6a74ca2c0b764855292")
  (:PATH
   "raw/mutations-R1/ignore-high-length-word/src/codec/cbor-map-write.lisp"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-map-write.lisp")
   :BYTES 6725 :SHA256
   "f22a59c19474dfbd7f29b965dfd90aad8da98554bde78ffebaaacebacd35843f")
  (:PATH "raw/mutations-R1/ignore-high-length-word/src/codec/cbor-minimal.lisp"
   :SOURCE
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH "raw/mutations-R1/ignore-high-length-word/src/codec/cbor-package.lisp"
   :SOURCE
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-package.lisp")
   :BYTES 801 :SHA256
   "5ab29969d2fca3013a2c60da80080a50e1ec9d6df158de9f774dd2f11edf4f6e")
  (:PATH
   "raw/mutations-R1/ignore-high-length-word/src/codec/cbor-scan-input.lisp"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH
   "raw/mutations-R1/ignore-high-length-word/src/codec/cbor-scan-items.lisp"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH
   "raw/mutations-R1/ignore-high-length-word/src/codec/cbor-scan-minimal.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH
   "raw/mutations-R1/ignore-high-length-word/src/codec/cbor-scan-stack.lisp"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/mutations-R1/ignore-high-length-word/src/codec/cbor-scan.lisp"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH
   "raw/mutations-R1/ignore-high-length-word/src/codec/cbor-simple-write.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e")
  (:PATH "raw/mutations-R1/ignore-high-length-word/src/codec/cbor-space.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH
   "raw/mutations-R1/ignore-high-length-word/src/codec/cbor-string-read.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-string-read.lisp")
   :BYTES 3747 :SHA256
   "11bc24d8992dbc5d5e84ea239fe5abb3d8d7fcd43b8690ba053e7bcb57e56fa6")
  (:PATH
   "raw/mutations-R1/ignore-high-length-word/src/codec/cbor-string-write.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:PATH
   "raw/mutations-R1/ignore-high-length-word/src/codec/cbor-tag-input.lisp"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-tag-input.lisp")
   :BYTES 4929 :SHA256
   "7fdbe580b2f7c7cc0cdc852b21a6c0301660582bbe2ff3c1a1960b742f1f3398")
  (:PATH
   "raw/mutations-R1/ignore-high-length-word/src/codec/cbor-tag-write.lisp"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-tag-write.lisp")
   :BYTES 4414 :SHA256
   "6e38148cefefd67fd3208ff788428730ddaf4050c251fa7f32d338cfd22114de")
  (:PATH "raw/mutations-R1/ignore-high-length-word/src/codec/cbor-write.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/mutations-R1/ignore-high-length-word/src/codec/package.lisp"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/mutations-R1/ignore-high-length-word/src/codec/utf8.lisp" :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/mutations-R1/ignore-high-length-word/src/foundation/batch.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH "raw/mutations-R1/ignore-high-length-word/src/foundation/binary.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH
   "raw/mutations-R1/ignore-high-length-word/src/foundation/conditions.lisp"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH "raw/mutations-R1/ignore-high-length-word/src/foundation/crc32c.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH "raw/mutations-R1/ignore-high-length-word/src/foundation/package.lisp"
   :SOURCE
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH "raw/mutations-R1/ignore-high-length-word/src/foundation/record.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/mutations-R1/ignore-high-length-word/src/package.lisp" :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/mutations-R1/ignore-high-length-word/stderr.log" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/mutations-R1/ignore-high-length-word/stdout.lisp" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/stdout.lisp")
   :BYTES 2427 :SHA256
   "11de799f0cf1bfd3d3562e13f91621a0ebdb5968102135a4efb88dfca2502528")
  (:PATH
   "raw/mutations-R1/ignore-high-length-word/tests/codec/cbor-string-read-support.lisp"
   :SOURCE
   #A((188) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/tests/codec/cbor-string-read-support.lisp")
   :BYTES 5184 :SHA256
   "461556a3a18f30a44a0eec63c574ca3e68bf27a57863318a7b9b1a1468a29a96")
  (:PATH
   "raw/mutations-R1/ignore-high-length-word/tests/codec/cbor-string-read-threads.lisp"
   :SOURCE
   #A((188) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/tests/codec/cbor-string-read-threads.lisp")
   :BYTES 3617 :SHA256
   "ba71397bb3fdc50da2ec4f4f0153ce0018a085981bf02357f1d3cb57467ad75b")
  (:PATH
   "raw/mutations-R1/ignore-high-length-word/tests/codec/cbor-string-read.lisp"
   :SOURCE
   #A((180) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/tests/codec/cbor-string-read.lisp")
   :BYTES 12677 :SHA256
   "b89e7b3f1b07556c4c5240ae077f84479abcc5e6f567b4988b9c49a26fbc5084")
  (:PATH
   "raw/mutations-R1/ignore-high-length-word/tests/codec/cbor-structure-support.lisp"
   :SOURCE
   #A((186) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH
   "raw/mutations-R1/ignore-high-length-word/tests/codec/cbor-support.lisp"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH
   "raw/mutations-R1/ignore-high-length-word/tests/foundation/support.lisp"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-high-length-word/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH "raw/mutations-R1/ignore-requested-budget/child.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/child.lisp")
   :BYTES 4232 :SHA256
   "4d4d4c8aadc2eb177a129c93c369506afae9e29666eed68e8998974947a92973")
  (:PATH "raw/mutations-R1/ignore-requested-budget/plan.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/plan.lisp")
   :BYTES 5877 :SHA256
   "999e9b4e6174fe51d63fc5948d23a8c6f8ee781b8d1068331803a81d37719333")
  (:PATH
   "raw/mutations-R1/ignore-requested-budget/src/codec/cbor-array-input.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-array-input.lisp")
   :BYTES 7521 :SHA256
   "e36efda9d66f532b8221f898a078b7f77dc2a41cdc953ece0b2e08b4ed2417f4")
  (:PATH
   "raw/mutations-R1/ignore-requested-budget/src/codec/cbor-array-write.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-array-write.lisp")
   :BYTES 6557 :SHA256
   "2f71d857991f32aacf6c7a0ecbe5e06bcba9289b20f46e496b3e3737ce6c242b")
  (:PATH
   "raw/mutations-R1/ignore-requested-budget/src/codec/cbor-float-minimal.lisp"
   :SOURCE
   #A((180) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH
   "raw/mutations-R1/ignore-requested-budget/src/codec/cbor-float-narrow.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-float-narrow.lisp")
   :BYTES 4546 :SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb")
  (:PATH
   "raw/mutations-R1/ignore-requested-budget/src/codec/cbor-float-write.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-float-write.lisp")
   :BYTES 5083 :SHA256
   "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442")
  (:PATH "raw/mutations-R1/ignore-requested-budget/src/codec/cbor-header.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH
   "raw/mutations-R1/ignore-requested-budget/src/codec/cbor-item-read.lisp"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-item-read.lisp")
   :BYTES 2712 :SHA256
   "9a270d6ffa0fa8145ee0d7584c7add7e94a2ed87dccbf893298baf6169b582df")
  (:PATH
   "raw/mutations-R1/ignore-requested-budget/src/codec/cbor-map-input.lisp"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-map-input.lisp")
   :BYTES 7945 :SHA256
   "49c61ec854e208e1c72ba66fbd121ef2e7657338ac04f6a74ca2c0b764855292")
  (:PATH
   "raw/mutations-R1/ignore-requested-budget/src/codec/cbor-map-write.lisp"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-map-write.lisp")
   :BYTES 6725 :SHA256
   "f22a59c19474dfbd7f29b965dfd90aad8da98554bde78ffebaaacebacd35843f")
  (:PATH "raw/mutations-R1/ignore-requested-budget/src/codec/cbor-minimal.lisp"
   :SOURCE
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH "raw/mutations-R1/ignore-requested-budget/src/codec/cbor-package.lisp"
   :SOURCE
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-package.lisp")
   :BYTES 801 :SHA256
   "5ab29969d2fca3013a2c60da80080a50e1ec9d6df158de9f774dd2f11edf4f6e")
  (:PATH
   "raw/mutations-R1/ignore-requested-budget/src/codec/cbor-scan-input.lisp"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH
   "raw/mutations-R1/ignore-requested-budget/src/codec/cbor-scan-items.lisp"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH
   "raw/mutations-R1/ignore-requested-budget/src/codec/cbor-scan-minimal.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH
   "raw/mutations-R1/ignore-requested-budget/src/codec/cbor-scan-stack.lisp"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/mutations-R1/ignore-requested-budget/src/codec/cbor-scan.lisp"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH
   "raw/mutations-R1/ignore-requested-budget/src/codec/cbor-simple-write.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e")
  (:PATH "raw/mutations-R1/ignore-requested-budget/src/codec/cbor-space.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH
   "raw/mutations-R1/ignore-requested-budget/src/codec/cbor-string-read.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-string-read.lisp")
   :BYTES 3751 :SHA256
   "6b5ba9eaf64d9c0ab27f122ead7d7d0d85f4fc962294a9febafe1389ad6874fc")
  (:PATH
   "raw/mutations-R1/ignore-requested-budget/src/codec/cbor-string-write.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:PATH
   "raw/mutations-R1/ignore-requested-budget/src/codec/cbor-tag-input.lisp"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-tag-input.lisp")
   :BYTES 4929 :SHA256
   "7fdbe580b2f7c7cc0cdc852b21a6c0301660582bbe2ff3c1a1960b742f1f3398")
  (:PATH
   "raw/mutations-R1/ignore-requested-budget/src/codec/cbor-tag-write.lisp"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-tag-write.lisp")
   :BYTES 4414 :SHA256
   "6e38148cefefd67fd3208ff788428730ddaf4050c251fa7f32d338cfd22114de")
  (:PATH "raw/mutations-R1/ignore-requested-budget/src/codec/cbor-write.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/mutations-R1/ignore-requested-budget/src/codec/package.lisp"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/mutations-R1/ignore-requested-budget/src/codec/utf8.lisp" :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/mutations-R1/ignore-requested-budget/src/foundation/batch.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH "raw/mutations-R1/ignore-requested-budget/src/foundation/binary.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH
   "raw/mutations-R1/ignore-requested-budget/src/foundation/conditions.lisp"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH "raw/mutations-R1/ignore-requested-budget/src/foundation/crc32c.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH "raw/mutations-R1/ignore-requested-budget/src/foundation/package.lisp"
   :SOURCE
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH "raw/mutations-R1/ignore-requested-budget/src/foundation/record.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/mutations-R1/ignore-requested-budget/src/package.lisp" :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/mutations-R1/ignore-requested-budget/stderr.log" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/mutations-R1/ignore-requested-budget/stdout.lisp" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/stdout.lisp")
   :BYTES 2089 :SHA256
   "8b9d510991fbe565663afb08bb9065ce025cbb34aacd0d7aed222819e67b658b")
  (:PATH
   "raw/mutations-R1/ignore-requested-budget/tests/codec/cbor-string-read-support.lisp"
   :SOURCE
   #A((188) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/tests/codec/cbor-string-read-support.lisp")
   :BYTES 5184 :SHA256
   "461556a3a18f30a44a0eec63c574ca3e68bf27a57863318a7b9b1a1468a29a96")
  (:PATH
   "raw/mutations-R1/ignore-requested-budget/tests/codec/cbor-string-read-threads.lisp"
   :SOURCE
   #A((188) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/tests/codec/cbor-string-read-threads.lisp")
   :BYTES 3617 :SHA256
   "ba71397bb3fdc50da2ec4f4f0153ce0018a085981bf02357f1d3cb57467ad75b")
  (:PATH
   "raw/mutations-R1/ignore-requested-budget/tests/codec/cbor-string-read.lisp"
   :SOURCE
   #A((180) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/tests/codec/cbor-string-read.lisp")
   :BYTES 12677 :SHA256
   "b89e7b3f1b07556c4c5240ae077f84479abcc5e6f567b4988b9c49a26fbc5084")
  (:PATH
   "raw/mutations-R1/ignore-requested-budget/tests/codec/cbor-structure-support.lisp"
   :SOURCE
   #A((186) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH
   "raw/mutations-R1/ignore-requested-budget/tests/codec/cbor-support.lisp"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH
   "raw/mutations-R1/ignore-requested-budget/tests/foundation/support.lisp"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/ignore-requested-budget/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH "raw/mutations-R1/major-permissive/child.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/child.lisp")
   :BYTES 4232 :SHA256
   "4d4d4c8aadc2eb177a129c93c369506afae9e29666eed68e8998974947a92973")
  (:PATH "raw/mutations-R1/major-permissive/plan.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/plan.lisp")
   :BYTES 5877 :SHA256
   "5255d5e6b0fdb480d1d774d168b06d7d601d993130475d5dbcc6c4574384335f")
  (:PATH "raw/mutations-R1/major-permissive/src/codec/cbor-array-input.lisp"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-array-input.lisp")
   :BYTES 7521 :SHA256
   "e36efda9d66f532b8221f898a078b7f77dc2a41cdc953ece0b2e08b4ed2417f4")
  (:PATH "raw/mutations-R1/major-permissive/src/codec/cbor-array-write.lisp"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-array-write.lisp")
   :BYTES 6557 :SHA256
   "2f71d857991f32aacf6c7a0ecbe5e06bcba9289b20f46e496b3e3737ce6c242b")
  (:PATH "raw/mutations-R1/major-permissive/src/codec/cbor-float-minimal.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH "raw/mutations-R1/major-permissive/src/codec/cbor-float-narrow.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-float-narrow.lisp")
   :BYTES 4546 :SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb")
  (:PATH "raw/mutations-R1/major-permissive/src/codec/cbor-float-write.lisp"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-float-write.lisp")
   :BYTES 5083 :SHA256
   "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442")
  (:PATH "raw/mutations-R1/major-permissive/src/codec/cbor-header.lisp" :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH "raw/mutations-R1/major-permissive/src/codec/cbor-item-read.lisp"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-item-read.lisp")
   :BYTES 2712 :SHA256
   "9a270d6ffa0fa8145ee0d7584c7add7e94a2ed87dccbf893298baf6169b582df")
  (:PATH "raw/mutations-R1/major-permissive/src/codec/cbor-map-input.lisp"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-map-input.lisp")
   :BYTES 7945 :SHA256
   "49c61ec854e208e1c72ba66fbd121ef2e7657338ac04f6a74ca2c0b764855292")
  (:PATH "raw/mutations-R1/major-permissive/src/codec/cbor-map-write.lisp"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-map-write.lisp")
   :BYTES 6725 :SHA256
   "f22a59c19474dfbd7f29b965dfd90aad8da98554bde78ffebaaacebacd35843f")
  (:PATH "raw/mutations-R1/major-permissive/src/codec/cbor-minimal.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH "raw/mutations-R1/major-permissive/src/codec/cbor-package.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-package.lisp")
   :BYTES 801 :SHA256
   "5ab29969d2fca3013a2c60da80080a50e1ec9d6df158de9f774dd2f11edf4f6e")
  (:PATH "raw/mutations-R1/major-permissive/src/codec/cbor-scan-input.lisp"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH "raw/mutations-R1/major-permissive/src/codec/cbor-scan-items.lisp"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH "raw/mutations-R1/major-permissive/src/codec/cbor-scan-minimal.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH "raw/mutations-R1/major-permissive/src/codec/cbor-scan-stack.lisp"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/mutations-R1/major-permissive/src/codec/cbor-scan.lisp" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/mutations-R1/major-permissive/src/codec/cbor-simple-write.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e")
  (:PATH "raw/mutations-R1/major-permissive/src/codec/cbor-space.lisp" :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH "raw/mutations-R1/major-permissive/src/codec/cbor-string-read.lisp"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-string-read.lisp")
   :BYTES 3685 :SHA256
   "a0e2686f18c1d592279494631f5e03b42b35eb44150b1ca61890deb77cdc87f2")
  (:PATH "raw/mutations-R1/major-permissive/src/codec/cbor-string-write.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:PATH "raw/mutations-R1/major-permissive/src/codec/cbor-tag-input.lisp"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-tag-input.lisp")
   :BYTES 4929 :SHA256
   "7fdbe580b2f7c7cc0cdc852b21a6c0301660582bbe2ff3c1a1960b742f1f3398")
  (:PATH "raw/mutations-R1/major-permissive/src/codec/cbor-tag-write.lisp"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-tag-write.lisp")
   :BYTES 4414 :SHA256
   "6e38148cefefd67fd3208ff788428730ddaf4050c251fa7f32d338cfd22114de")
  (:PATH "raw/mutations-R1/major-permissive/src/codec/cbor-write.lisp" :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/mutations-R1/major-permissive/src/codec/package.lisp" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/mutations-R1/major-permissive/src/codec/utf8.lisp" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/mutations-R1/major-permissive/src/foundation/batch.lisp" :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH "raw/mutations-R1/major-permissive/src/foundation/binary.lisp" :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH "raw/mutations-R1/major-permissive/src/foundation/conditions.lisp"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH "raw/mutations-R1/major-permissive/src/foundation/crc32c.lisp" :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH "raw/mutations-R1/major-permissive/src/foundation/package.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH "raw/mutations-R1/major-permissive/src/foundation/record.lisp" :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/mutations-R1/major-permissive/src/package.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/mutations-R1/major-permissive/stderr.log" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/mutations-R1/major-permissive/stdout.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/stdout.lisp")
   :BYTES 2219 :SHA256
   "fd7136bda48bd4e0213486c0402648db2a2b93d3895f7ca228cd535cb5b855be")
  (:PATH
   "raw/mutations-R1/major-permissive/tests/codec/cbor-string-read-support.lisp"
   :SOURCE
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/tests/codec/cbor-string-read-support.lisp")
   :BYTES 5184 :SHA256
   "461556a3a18f30a44a0eec63c574ca3e68bf27a57863318a7b9b1a1468a29a96")
  (:PATH
   "raw/mutations-R1/major-permissive/tests/codec/cbor-string-read-threads.lisp"
   :SOURCE
   #A((181) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/tests/codec/cbor-string-read-threads.lisp")
   :BYTES 3617 :SHA256
   "ba71397bb3fdc50da2ec4f4f0153ce0018a085981bf02357f1d3cb57467ad75b")
  (:PATH "raw/mutations-R1/major-permissive/tests/codec/cbor-string-read.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/tests/codec/cbor-string-read.lisp")
   :BYTES 12677 :SHA256
   "b89e7b3f1b07556c4c5240ae077f84479abcc5e6f567b4988b9c49a26fbc5084")
  (:PATH
   "raw/mutations-R1/major-permissive/tests/codec/cbor-structure-support.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH "raw/mutations-R1/major-permissive/tests/codec/cbor-support.lisp"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH "raw/mutations-R1/major-permissive/tests/foundation/support.lisp"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/major-permissive/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH "raw/mutations-R1/next-is-end/child.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/child.lisp")
   :BYTES 4232 :SHA256
   "4d4d4c8aadc2eb177a129c93c369506afae9e29666eed68e8998974947a92973")
  (:PATH "raw/mutations-R1/next-is-end/plan.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/plan.lisp")
   :BYTES 5877 :SHA256
   "1a667f9bf3375da09696659307ea95132978509a5a85fef6df92ff7189d32c06")
  (:PATH "raw/mutations-R1/next-is-end/src/codec/cbor-array-input.lisp" :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-array-input.lisp")
   :BYTES 7521 :SHA256
   "e36efda9d66f532b8221f898a078b7f77dc2a41cdc953ece0b2e08b4ed2417f4")
  (:PATH "raw/mutations-R1/next-is-end/src/codec/cbor-array-write.lisp" :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-array-write.lisp")
   :BYTES 6557 :SHA256
   "2f71d857991f32aacf6c7a0ecbe5e06bcba9289b20f46e496b3e3737ce6c242b")
  (:PATH "raw/mutations-R1/next-is-end/src/codec/cbor-float-minimal.lisp"
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH "raw/mutations-R1/next-is-end/src/codec/cbor-float-narrow.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-float-narrow.lisp")
   :BYTES 4546 :SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb")
  (:PATH "raw/mutations-R1/next-is-end/src/codec/cbor-float-write.lisp" :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-float-write.lisp")
   :BYTES 5083 :SHA256
   "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442")
  (:PATH "raw/mutations-R1/next-is-end/src/codec/cbor-header.lisp" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH "raw/mutations-R1/next-is-end/src/codec/cbor-item-read.lisp" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-item-read.lisp")
   :BYTES 2712 :SHA256
   "9a270d6ffa0fa8145ee0d7584c7add7e94a2ed87dccbf893298baf6169b582df")
  (:PATH "raw/mutations-R1/next-is-end/src/codec/cbor-map-input.lisp" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-map-input.lisp")
   :BYTES 7945 :SHA256
   "49c61ec854e208e1c72ba66fbd121ef2e7657338ac04f6a74ca2c0b764855292")
  (:PATH "raw/mutations-R1/next-is-end/src/codec/cbor-map-write.lisp" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-map-write.lisp")
   :BYTES 6725 :SHA256
   "f22a59c19474dfbd7f29b965dfd90aad8da98554bde78ffebaaacebacd35843f")
  (:PATH "raw/mutations-R1/next-is-end/src/codec/cbor-minimal.lisp" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH "raw/mutations-R1/next-is-end/src/codec/cbor-package.lisp" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-package.lisp")
   :BYTES 801 :SHA256
   "5ab29969d2fca3013a2c60da80080a50e1ec9d6df158de9f774dd2f11edf4f6e")
  (:PATH "raw/mutations-R1/next-is-end/src/codec/cbor-scan-input.lisp" :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH "raw/mutations-R1/next-is-end/src/codec/cbor-scan-items.lisp" :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH "raw/mutations-R1/next-is-end/src/codec/cbor-scan-minimal.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH "raw/mutations-R1/next-is-end/src/codec/cbor-scan-stack.lisp" :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/mutations-R1/next-is-end/src/codec/cbor-scan.lisp" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/mutations-R1/next-is-end/src/codec/cbor-simple-write.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e")
  (:PATH "raw/mutations-R1/next-is-end/src/codec/cbor-space.lisp" :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH "raw/mutations-R1/next-is-end/src/codec/cbor-string-read.lisp" :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-string-read.lisp")
   :BYTES 3740 :SHA256
   "8d8eedad9e229c5743ef12af0a21bdeb492a1e3acea3343862518be7e958fd39")
  (:PATH "raw/mutations-R1/next-is-end/src/codec/cbor-string-write.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:PATH "raw/mutations-R1/next-is-end/src/codec/cbor-tag-input.lisp" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-tag-input.lisp")
   :BYTES 4929 :SHA256
   "7fdbe580b2f7c7cc0cdc852b21a6c0301660582bbe2ff3c1a1960b742f1f3398")
  (:PATH "raw/mutations-R1/next-is-end/src/codec/cbor-tag-write.lisp" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-tag-write.lisp")
   :BYTES 4414 :SHA256
   "6e38148cefefd67fd3208ff788428730ddaf4050c251fa7f32d338cfd22114de")
  (:PATH "raw/mutations-R1/next-is-end/src/codec/cbor-write.lisp" :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/mutations-R1/next-is-end/src/codec/package.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/mutations-R1/next-is-end/src/codec/utf8.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/mutations-R1/next-is-end/src/foundation/batch.lisp" :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH "raw/mutations-R1/next-is-end/src/foundation/binary.lisp" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH "raw/mutations-R1/next-is-end/src/foundation/conditions.lisp" :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH "raw/mutations-R1/next-is-end/src/foundation/crc32c.lisp" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH "raw/mutations-R1/next-is-end/src/foundation/package.lisp" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH "raw/mutations-R1/next-is-end/src/foundation/record.lisp" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/mutations-R1/next-is-end/src/package.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/mutations-R1/next-is-end/stderr.log" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/mutations-R1/next-is-end/stdout.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/stdout.lisp")
   :BYTES 1947 :SHA256
   "a90802d9248ed0f0d620919a8cc01b2c43e8d44b96df73cc76b92917c3559c9f")
  (:PATH
   "raw/mutations-R1/next-is-end/tests/codec/cbor-string-read-support.lisp"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/tests/codec/cbor-string-read-support.lisp")
   :BYTES 5184 :SHA256
   "461556a3a18f30a44a0eec63c574ca3e68bf27a57863318a7b9b1a1468a29a96")
  (:PATH
   "raw/mutations-R1/next-is-end/tests/codec/cbor-string-read-threads.lisp"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/tests/codec/cbor-string-read-threads.lisp")
   :BYTES 3617 :SHA256
   "ba71397bb3fdc50da2ec4f4f0153ce0018a085981bf02357f1d3cb57467ad75b")
  (:PATH "raw/mutations-R1/next-is-end/tests/codec/cbor-string-read.lisp"
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/tests/codec/cbor-string-read.lisp")
   :BYTES 12677 :SHA256
   "b89e7b3f1b07556c4c5240ae077f84479abcc5e6f567b4988b9c49a26fbc5084")
  (:PATH "raw/mutations-R1/next-is-end/tests/codec/cbor-structure-support.lisp"
   :SOURCE
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH "raw/mutations-R1/next-is-end/tests/codec/cbor-support.lisp" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH "raw/mutations-R1/next-is-end/tests/foundation/support.lisp" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/next-is-end/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH "raw/mutations-R1/report.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/report.lisp")
   :BYTES 228908 :SHA256
   "835a2ac5648998b37a366ab231e0264ae70302986f602a7f68c5d95ba61f3121")
  (:PATH "raw/mutations-R1/run.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/run.lisp")
   :BYTES 18699 :SHA256
   "f114ba0676996050dfc66d5505b21b2c1ee07ada4a0f99d7bcf5b0112cd90a9a")
  (:PATH "raw/mutations-R1/skip-header-minimality/child.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/child.lisp")
   :BYTES 4232 :SHA256
   "4d4d4c8aadc2eb177a129c93c369506afae9e29666eed68e8998974947a92973")
  (:PATH "raw/mutations-R1/skip-header-minimality/plan.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/plan.lisp")
   :BYTES 5877 :SHA256
   "f8d5943f5a9b060b18765ab721b7f038bead5a388d859eadd8bbfefac7ece9cb")
  (:PATH
   "raw/mutations-R1/skip-header-minimality/src/codec/cbor-array-input.lisp"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-array-input.lisp")
   :BYTES 7521 :SHA256
   "e36efda9d66f532b8221f898a078b7f77dc2a41cdc953ece0b2e08b4ed2417f4")
  (:PATH
   "raw/mutations-R1/skip-header-minimality/src/codec/cbor-array-write.lisp"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-array-write.lisp")
   :BYTES 6557 :SHA256
   "2f71d857991f32aacf6c7a0ecbe5e06bcba9289b20f46e496b3e3737ce6c242b")
  (:PATH
   "raw/mutations-R1/skip-header-minimality/src/codec/cbor-float-minimal.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH
   "raw/mutations-R1/skip-header-minimality/src/codec/cbor-float-narrow.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-float-narrow.lisp")
   :BYTES 4546 :SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb")
  (:PATH
   "raw/mutations-R1/skip-header-minimality/src/codec/cbor-float-write.lisp"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-float-write.lisp")
   :BYTES 5083 :SHA256
   "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442")
  (:PATH "raw/mutations-R1/skip-header-minimality/src/codec/cbor-header.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH
   "raw/mutations-R1/skip-header-minimality/src/codec/cbor-item-read.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-item-read.lisp")
   :BYTES 2712 :SHA256
   "9a270d6ffa0fa8145ee0d7584c7add7e94a2ed87dccbf893298baf6169b582df")
  (:PATH
   "raw/mutations-R1/skip-header-minimality/src/codec/cbor-map-input.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-map-input.lisp")
   :BYTES 7945 :SHA256
   "49c61ec854e208e1c72ba66fbd121ef2e7657338ac04f6a74ca2c0b764855292")
  (:PATH
   "raw/mutations-R1/skip-header-minimality/src/codec/cbor-map-write.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-map-write.lisp")
   :BYTES 6725 :SHA256
   "f22a59c19474dfbd7f29b965dfd90aad8da98554bde78ffebaaacebacd35843f")
  (:PATH "raw/mutations-R1/skip-header-minimality/src/codec/cbor-minimal.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH "raw/mutations-R1/skip-header-minimality/src/codec/cbor-package.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-package.lisp")
   :BYTES 801 :SHA256
   "5ab29969d2fca3013a2c60da80080a50e1ec9d6df158de9f774dd2f11edf4f6e")
  (:PATH
   "raw/mutations-R1/skip-header-minimality/src/codec/cbor-scan-input.lisp"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH
   "raw/mutations-R1/skip-header-minimality/src/codec/cbor-scan-items.lisp"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH
   "raw/mutations-R1/skip-header-minimality/src/codec/cbor-scan-minimal.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH
   "raw/mutations-R1/skip-header-minimality/src/codec/cbor-scan-stack.lisp"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/mutations-R1/skip-header-minimality/src/codec/cbor-scan.lisp"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH
   "raw/mutations-R1/skip-header-minimality/src/codec/cbor-simple-write.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e")
  (:PATH "raw/mutations-R1/skip-header-minimality/src/codec/cbor-space.lisp"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH
   "raw/mutations-R1/skip-header-minimality/src/codec/cbor-string-read.lisp"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-string-read.lisp")
   :BYTES 3732 :SHA256
   "3c418a20849c963c64b9fe3eb68fbf1125d9a1a64e09d2d307ea9972dc6587e6")
  (:PATH
   "raw/mutations-R1/skip-header-minimality/src/codec/cbor-string-write.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:PATH
   "raw/mutations-R1/skip-header-minimality/src/codec/cbor-tag-input.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-tag-input.lisp")
   :BYTES 4929 :SHA256
   "7fdbe580b2f7c7cc0cdc852b21a6c0301660582bbe2ff3c1a1960b742f1f3398")
  (:PATH
   "raw/mutations-R1/skip-header-minimality/src/codec/cbor-tag-write.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-tag-write.lisp")
   :BYTES 4414 :SHA256
   "6e38148cefefd67fd3208ff788428730ddaf4050c251fa7f32d338cfd22114de")
  (:PATH "raw/mutations-R1/skip-header-minimality/src/codec/cbor-write.lisp"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/mutations-R1/skip-header-minimality/src/codec/package.lisp"
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/mutations-R1/skip-header-minimality/src/codec/utf8.lisp" :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/mutations-R1/skip-header-minimality/src/foundation/batch.lisp"
   :SOURCE
   #A((171) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH "raw/mutations-R1/skip-header-minimality/src/foundation/binary.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH
   "raw/mutations-R1/skip-header-minimality/src/foundation/conditions.lisp"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH "raw/mutations-R1/skip-header-minimality/src/foundation/crc32c.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH "raw/mutations-R1/skip-header-minimality/src/foundation/package.lisp"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH "raw/mutations-R1/skip-header-minimality/src/foundation/record.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/mutations-R1/skip-header-minimality/src/package.lisp" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/mutations-R1/skip-header-minimality/stderr.log" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/mutations-R1/skip-header-minimality/stdout.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/stdout.lisp")
   :BYTES 1943 :SHA256
   "0d2c963b238f4ff104894e5836ff0ce59a9680c948fed6ad945240dfe4ed2f90")
  (:PATH
   "raw/mutations-R1/skip-header-minimality/tests/codec/cbor-string-read-support.lisp"
   :SOURCE
   #A((187) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/tests/codec/cbor-string-read-support.lisp")
   :BYTES 5184 :SHA256
   "461556a3a18f30a44a0eec63c574ca3e68bf27a57863318a7b9b1a1468a29a96")
  (:PATH
   "raw/mutations-R1/skip-header-minimality/tests/codec/cbor-string-read-threads.lisp"
   :SOURCE
   #A((187) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/tests/codec/cbor-string-read-threads.lisp")
   :BYTES 3617 :SHA256
   "ba71397bb3fdc50da2ec4f4f0153ce0018a085981bf02357f1d3cb57467ad75b")
  (:PATH
   "raw/mutations-R1/skip-header-minimality/tests/codec/cbor-string-read.lisp"
   :SOURCE
   #A((179) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/tests/codec/cbor-string-read.lisp")
   :BYTES 12677 :SHA256
   "b89e7b3f1b07556c4c5240ae077f84479abcc5e6f567b4988b9c49a26fbc5084")
  (:PATH
   "raw/mutations-R1/skip-header-minimality/tests/codec/cbor-structure-support.lisp"
   :SOURCE
   #A((185) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH
   "raw/mutations-R1/skip-header-minimality/tests/codec/cbor-support.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH
   "raw/mutations-R1/skip-header-minimality/tests/foundation/support.lisp"
   :SOURCE
   #A((175) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-header-minimality/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH "raw/mutations-R1/skip-utf8/child.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/child.lisp")
   :BYTES 4232 :SHA256
   "4d4d4c8aadc2eb177a129c93c369506afae9e29666eed68e8998974947a92973")
  (:PATH "raw/mutations-R1/skip-utf8/plan.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/plan.lisp")
   :BYTES 5877 :SHA256
   "526691a6bac47088627ab676cd19c614542938aa22ccbd6b9f2ddedc82993d24")
  (:PATH "raw/mutations-R1/skip-utf8/src/codec/cbor-array-input.lisp" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-array-input.lisp")
   :BYTES 7521 :SHA256
   "e36efda9d66f532b8221f898a078b7f77dc2a41cdc953ece0b2e08b4ed2417f4")
  (:PATH "raw/mutations-R1/skip-utf8/src/codec/cbor-array-write.lisp" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-array-write.lisp")
   :BYTES 6557 :SHA256
   "2f71d857991f32aacf6c7a0ecbe5e06bcba9289b20f46e496b3e3737ce6c242b")
  (:PATH "raw/mutations-R1/skip-utf8/src/codec/cbor-float-minimal.lisp" :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH "raw/mutations-R1/skip-utf8/src/codec/cbor-float-narrow.lisp" :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-float-narrow.lisp")
   :BYTES 4546 :SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb")
  (:PATH "raw/mutations-R1/skip-utf8/src/codec/cbor-float-write.lisp" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-float-write.lisp")
   :BYTES 5083 :SHA256
   "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442")
  (:PATH "raw/mutations-R1/skip-utf8/src/codec/cbor-header.lisp" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH "raw/mutations-R1/skip-utf8/src/codec/cbor-item-read.lisp" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-item-read.lisp")
   :BYTES 2712 :SHA256
   "9a270d6ffa0fa8145ee0d7584c7add7e94a2ed87dccbf893298baf6169b582df")
  (:PATH "raw/mutations-R1/skip-utf8/src/codec/cbor-map-input.lisp" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-map-input.lisp")
   :BYTES 7945 :SHA256
   "49c61ec854e208e1c72ba66fbd121ef2e7657338ac04f6a74ca2c0b764855292")
  (:PATH "raw/mutations-R1/skip-utf8/src/codec/cbor-map-write.lisp" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-map-write.lisp")
   :BYTES 6725 :SHA256
   "f22a59c19474dfbd7f29b965dfd90aad8da98554bde78ffebaaacebacd35843f")
  (:PATH "raw/mutations-R1/skip-utf8/src/codec/cbor-minimal.lisp" :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH "raw/mutations-R1/skip-utf8/src/codec/cbor-package.lisp" :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-package.lisp")
   :BYTES 801 :SHA256
   "5ab29969d2fca3013a2c60da80080a50e1ec9d6df158de9f774dd2f11edf4f6e")
  (:PATH "raw/mutations-R1/skip-utf8/src/codec/cbor-scan-input.lisp" :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH "raw/mutations-R1/skip-utf8/src/codec/cbor-scan-items.lisp" :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH "raw/mutations-R1/skip-utf8/src/codec/cbor-scan-minimal.lisp" :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH "raw/mutations-R1/skip-utf8/src/codec/cbor-scan-stack.lisp" :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/mutations-R1/skip-utf8/src/codec/cbor-scan.lisp" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/mutations-R1/skip-utf8/src/codec/cbor-simple-write.lisp" :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e")
  (:PATH "raw/mutations-R1/skip-utf8/src/codec/cbor-space.lisp" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH "raw/mutations-R1/skip-utf8/src/codec/cbor-string-read.lisp" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-string-read.lisp")
   :BYTES 3514 :SHA256
   "7c6bc78845b39e1d89b871cef0afc8713321fee082c2a2a97627498966561043")
  (:PATH "raw/mutations-R1/skip-utf8/src/codec/cbor-string-write.lisp" :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:PATH "raw/mutations-R1/skip-utf8/src/codec/cbor-tag-input.lisp" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-tag-input.lisp")
   :BYTES 4929 :SHA256
   "7fdbe580b2f7c7cc0cdc852b21a6c0301660582bbe2ff3c1a1960b742f1f3398")
  (:PATH "raw/mutations-R1/skip-utf8/src/codec/cbor-tag-write.lisp" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-tag-write.lisp")
   :BYTES 4414 :SHA256
   "6e38148cefefd67fd3208ff788428730ddaf4050c251fa7f32d338cfd22114de")
  (:PATH "raw/mutations-R1/skip-utf8/src/codec/cbor-write.lisp" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/mutations-R1/skip-utf8/src/codec/package.lisp" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/mutations-R1/skip-utf8/src/codec/utf8.lisp" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/mutations-R1/skip-utf8/src/foundation/batch.lisp" :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH "raw/mutations-R1/skip-utf8/src/foundation/binary.lisp" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH "raw/mutations-R1/skip-utf8/src/foundation/conditions.lisp" :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH "raw/mutations-R1/skip-utf8/src/foundation/crc32c.lisp" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH "raw/mutations-R1/skip-utf8/src/foundation/package.lisp" :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH "raw/mutations-R1/skip-utf8/src/foundation/record.lisp" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/mutations-R1/skip-utf8/src/package.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/mutations-R1/skip-utf8/stderr.log" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/mutations-R1/skip-utf8/stdout.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/stdout.lisp")
   :BYTES 2579 :SHA256
   "443b6b2f477bdd315949d3325e9954780f53e0b80c9a79f6b4476ef198b50adc")
  (:PATH "raw/mutations-R1/skip-utf8/tests/codec/cbor-string-read-support.lisp"
   :SOURCE
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/tests/codec/cbor-string-read-support.lisp")
   :BYTES 5184 :SHA256
   "461556a3a18f30a44a0eec63c574ca3e68bf27a57863318a7b9b1a1468a29a96")
  (:PATH "raw/mutations-R1/skip-utf8/tests/codec/cbor-string-read-threads.lisp"
   :SOURCE
   #A((174) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/tests/codec/cbor-string-read-threads.lisp")
   :BYTES 3617 :SHA256
   "ba71397bb3fdc50da2ec4f4f0153ce0018a085981bf02357f1d3cb57467ad75b")
  (:PATH "raw/mutations-R1/skip-utf8/tests/codec/cbor-string-read.lisp" :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/tests/codec/cbor-string-read.lisp")
   :BYTES 12677 :SHA256
   "b89e7b3f1b07556c4c5240ae077f84479abcc5e6f567b4988b9c49a26fbc5084")
  (:PATH "raw/mutations-R1/skip-utf8/tests/codec/cbor-structure-support.lisp"
   :SOURCE
   #A((172) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH "raw/mutations-R1/skip-utf8/tests/codec/cbor-support.lisp" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH "raw/mutations-R1/skip-utf8/tests/foundation/support.lisp" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/skip-utf8/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH "raw/mutations-R1/start-is-zero/child.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/child.lisp")
   :BYTES 4232 :SHA256
   "4d4d4c8aadc2eb177a129c93c369506afae9e29666eed68e8998974947a92973")
  (:PATH "raw/mutations-R1/start-is-zero/plan.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/plan.lisp")
   :BYTES 5877 :SHA256
   "ebbd2c3d54d4ceb7b3dc4b043aea50dab998ba724fcb8f8d4178bce83e5f0d5e")
  (:PATH "raw/mutations-R1/start-is-zero/src/codec/cbor-array-input.lisp"
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-array-input.lisp")
   :BYTES 7521 :SHA256
   "e36efda9d66f532b8221f898a078b7f77dc2a41cdc953ece0b2e08b4ed2417f4")
  (:PATH "raw/mutations-R1/start-is-zero/src/codec/cbor-array-write.lisp"
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-array-write.lisp")
   :BYTES 6557 :SHA256
   "2f71d857991f32aacf6c7a0ecbe5e06bcba9289b20f46e496b3e3737ce6c242b")
  (:PATH "raw/mutations-R1/start-is-zero/src/codec/cbor-float-minimal.lisp"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-float-minimal.lisp")
   :BYTES 3911 :SHA256
   "d8711c16b431ab46653d02103bec2bf644780fea3d5766bb1f2724cf350790db")
  (:PATH "raw/mutations-R1/start-is-zero/src/codec/cbor-float-narrow.lisp"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-float-narrow.lisp")
   :BYTES 4546 :SHA256
   "479754d83cd9f11e53f7c1a4c81986a9be4327e3b1040dde0314ee29c2f87cbb")
  (:PATH "raw/mutations-R1/start-is-zero/src/codec/cbor-float-write.lisp"
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-float-write.lisp")
   :BYTES 5083 :SHA256
   "28ff27ac1f077477f92d5932ae3c76ab319356c3b4b070aee1cd168cbdce1442")
  (:PATH "raw/mutations-R1/start-is-zero/src/codec/cbor-header.lisp" :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-header.lisp")
   :BYTES 5769 :SHA256
   "a67318d1811033309b4e329aa0912a48a859d7927e74c7fde8d3b7f23d269beb")
  (:PATH "raw/mutations-R1/start-is-zero/src/codec/cbor-item-read.lisp" :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-item-read.lisp")
   :BYTES 2712 :SHA256
   "9a270d6ffa0fa8145ee0d7584c7add7e94a2ed87dccbf893298baf6169b582df")
  (:PATH "raw/mutations-R1/start-is-zero/src/codec/cbor-map-input.lisp" :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-map-input.lisp")
   :BYTES 7945 :SHA256
   "49c61ec854e208e1c72ba66fbd121ef2e7657338ac04f6a74ca2c0b764855292")
  (:PATH "raw/mutations-R1/start-is-zero/src/codec/cbor-map-write.lisp" :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-map-write.lisp")
   :BYTES 6725 :SHA256
   "f22a59c19474dfbd7f29b965dfd90aad8da98554bde78ffebaaacebacd35843f")
  (:PATH "raw/mutations-R1/start-is-zero/src/codec/cbor-minimal.lisp" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-minimal.lisp")
   :BYTES 3592 :SHA256
   "33e54196ecade6bfa476f0781f4c0c8799530a94ee4c7251095d3d788319c449")
  (:PATH "raw/mutations-R1/start-is-zero/src/codec/cbor-package.lisp" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-package.lisp")
   :BYTES 801 :SHA256
   "5ab29969d2fca3013a2c60da80080a50e1ec9d6df158de9f774dd2f11edf4f6e")
  (:PATH "raw/mutations-R1/start-is-zero/src/codec/cbor-scan-input.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-scan-input.lisp")
   :BYTES 2121 :SHA256
   "abd04a9edb5302d2afba92c919a0d730fe4080fc684ed22a2d8f003492623ed4")
  (:PATH "raw/mutations-R1/start-is-zero/src/codec/cbor-scan-items.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-scan-items.lisp")
   :BYTES 7209 :SHA256
   "7cfd60997c1508559992454259b28556c880e3b373d35e66075e4411d13fbd39")
  (:PATH "raw/mutations-R1/start-is-zero/src/codec/cbor-scan-minimal.lisp"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-scan-minimal.lisp")
   :BYTES 1665 :SHA256
   "e6a39d5e39d79c93e19f03bb4e5cd0f07bc6682b768e191095c2359bb910bd79")
  (:PATH "raw/mutations-R1/start-is-zero/src/codec/cbor-scan-stack.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-scan-stack.lisp")
   :BYTES 5645 :SHA256
   "32ac1fc9375616bbeef2e17c2e4caea04d8d209536c37b9cf9a6cd0ccbfacbbb")
  (:PATH "raw/mutations-R1/start-is-zero/src/codec/cbor-scan.lisp" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-scan.lisp")
   :BYTES 5981 :SHA256
   "37a552faab3463e0bb0d967d04381102d8bf8135986ffd4f643213e235a58b6a")
  (:PATH "raw/mutations-R1/start-is-zero/src/codec/cbor-simple-write.lisp"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-simple-write.lisp")
   :BYTES 2887 :SHA256
   "e1be24d76daccca61a701d1a8f1ebda46122290734afb8089d9fc9744fdb025e")
  (:PATH "raw/mutations-R1/start-is-zero/src/codec/cbor-space.lisp" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-space.lisp")
   :BYTES 3381 :SHA256
   "fcddc3685ac95e2ea0f754c10fdff10cd733cdf08b44b8e202af68b2d6819590")
  (:PATH "raw/mutations-R1/start-is-zero/src/codec/cbor-string-read.lisp"
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-string-read.lisp")
   :BYTES 3723 :SHA256
   "c87febe4ff210dc2c4bc2b8da456d6730240051f248d225c6b99d0c050a5837e")
  (:PATH "raw/mutations-R1/start-is-zero/src/codec/cbor-string-write.lisp"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-string-write.lisp")
   :BYTES 7730 :SHA256
   "9e7df5e0f7f39c8bd70cc8d0b6a844c241274357eb5204c2ebede89379848727")
  (:PATH "raw/mutations-R1/start-is-zero/src/codec/cbor-tag-input.lisp" :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-tag-input.lisp")
   :BYTES 4929 :SHA256
   "7fdbe580b2f7c7cc0cdc852b21a6c0301660582bbe2ff3c1a1960b742f1f3398")
  (:PATH "raw/mutations-R1/start-is-zero/src/codec/cbor-tag-write.lisp" :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-tag-write.lisp")
   :BYTES 4414 :SHA256
   "6e38148cefefd67fd3208ff788428730ddaf4050c251fa7f32d338cfd22114de")
  (:PATH "raw/mutations-R1/start-is-zero/src/codec/cbor-write.lisp" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/cbor-write.lisp")
   :BYTES 5120 :SHA256
   "360ed721249fd90f6f7b77a651f8110fe8dc3c227c6c078f1e25b8a0930b2183")
  (:PATH "raw/mutations-R1/start-is-zero/src/codec/package.lisp" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/package.lisp")
   :BYTES 393 :SHA256
   "7971492e08a41885a4553ea906dce058076047317d894e6d90eaa0eee00bb768")
  (:PATH "raw/mutations-R1/start-is-zero/src/codec/utf8.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/codec/utf8.lisp")
   :BYTES 6197 :SHA256
   "d0b0f4d43fed5bb0a602d40f33e2fa5eeeb66e6f0ca4f1cb6ff6af641af11b4e")
  (:PATH "raw/mutations-R1/start-is-zero/src/foundation/batch.lisp" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/foundation/batch.lisp")
   :BYTES 5228 :SHA256
   "318cdb151268a96cad596b21e2ba7bb8073193a94b98ea8a372e7a4677766af3")
  (:PATH "raw/mutations-R1/start-is-zero/src/foundation/binary.lisp" :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/foundation/binary.lisp")
   :BYTES 3295 :SHA256
   "880aebbf3b7d762d5ce3c5f629c9d0297328650b94dc41deeeacbaa55a2154ea")
  (:PATH "raw/mutations-R1/start-is-zero/src/foundation/conditions.lisp"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/foundation/conditions.lisp")
   :BYTES 2239 :SHA256
   "e2055b49356f84d56f00b9695391b8cfdca6dda09df1fb7d888d90e8bcbc24fb")
  (:PATH "raw/mutations-R1/start-is-zero/src/foundation/crc32c.lisp" :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/foundation/crc32c.lisp")
   :BYTES 3332 :SHA256
   "fa170d3c52f14d8261a81247df84b92dd131774f04f3912ff14d5645e65d8a1b")
  (:PATH "raw/mutations-R1/start-is-zero/src/foundation/package.lisp" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/foundation/package.lisp")
   :BYTES 1523 :SHA256
   "52d7c1b91c1b44a06f687b2f904883df43ea643bbdd9cdc107d39efb4de62936")
  (:PATH "raw/mutations-R1/start-is-zero/src/foundation/record.lisp" :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/foundation/record.lisp")
   :BYTES 18196 :SHA256
   "35b3c90fda458e9b680be54f3287e436994b1dea53e6b3750b1f0bfb5edc9def")
  (:PATH "raw/mutations-R1/start-is-zero/src/package.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/src/package.lisp")
   :BYTES 425 :SHA256
   "40c02ae97dc8efe074428022ca22b0d29c855f4acc2ea36c8ce19c85797ea0c8")
  (:PATH "raw/mutations-R1/start-is-zero/stderr.log" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/mutations-R1/start-is-zero/stdout.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/stdout.lisp")
   :BYTES 1703 :SHA256
   "55555aa5fa23e94a571e5d90970428bf20da713c466f9aefe29bf6964c54378f")
  (:PATH
   "raw/mutations-R1/start-is-zero/tests/codec/cbor-string-read-support.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/tests/codec/cbor-string-read-support.lisp")
   :BYTES 5184 :SHA256
   "461556a3a18f30a44a0eec63c574ca3e68bf27a57863318a7b9b1a1468a29a96")
  (:PATH
   "raw/mutations-R1/start-is-zero/tests/codec/cbor-string-read-threads.lisp"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/tests/codec/cbor-string-read-threads.lisp")
   :BYTES 3617 :SHA256
   "ba71397bb3fdc50da2ec4f4f0153ce0018a085981bf02357f1d3cb57467ad75b")
  (:PATH "raw/mutations-R1/start-is-zero/tests/codec/cbor-string-read.lisp"
   :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/tests/codec/cbor-string-read.lisp")
   :BYTES 12677 :SHA256
   "b89e7b3f1b07556c4c5240ae077f84479abcc5e6f567b4988b9c49a26fbc5084")
  (:PATH
   "raw/mutations-R1/start-is-zero/tests/codec/cbor-structure-support.lisp"
   :SOURCE
   #A((176) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/tests/codec/cbor-structure-support.lisp")
   :BYTES 11757 :SHA256
   "1e592931aaa7a67f748dde85ef0cc2e0eaf2bb32b3444ff25b89f24b4e764edb")
  (:PATH "raw/mutations-R1/start-is-zero/tests/codec/cbor-support.lisp" :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/tests/codec/cbor-support.lisp")
   :BYTES 6072 :SHA256
   "41e013305941cb627928ad3440a923413a250c47558514a74c9e233f24d6126a")
  (:PATH "raw/mutations-R1/start-is-zero/tests/foundation/support.lisp" :SOURCE
   #A((166) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/mutations-R1/start-is-zero/tests/foundation/support.lisp")
   :BYTES 2464 :SHA256
   "2a9dc4ca5195872f0612e2a656dbe1b02bff2b162460279f40d6c004e9cb959b")
  (:PATH "raw/review/blind-plan.md.txt" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/review/blind-plan.md")
   :BYTES 5918 :SHA256
   "16608b6c33e912ae60d5aafd7a8df6e74628e49585081ed3e30f89ce521fa64f")
  (:PATH "raw/review/read-blind-corpus.error.txt" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/review/read-blind-corpus.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/read-blind-corpus.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/review/read-blind-corpus.lisp")
   :BYTES 2579 :SHA256
   "f6d6aa5639ff7ddcdf6a5af181ebc4a18400cb12d8554f88e515a2e1644fa1f2")
  (:PATH "raw/review/read-blind-corpus.output.txt" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/review/read-blind-corpus.output.txt")
   :BYTES 925 :SHA256
   "1be655d89b069b65441aef2b2233b055805a27cf9a22b6e4f503a85499bdb730")
  (:PATH "raw/review/read-decisions.error.txt" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/review/read-decisions.error.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/read-decisions.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/review/read-decisions.lisp")
   :BYTES 1549 :SHA256
   "61ccf1a8876364f8127b1030f1f095c7d3e46bc1cd15507bc0dcbca75296079e")
  (:PATH "raw/review/read-decisions.output.txt" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/review/read-decisions.output.txt")
   :BYTES 182 :SHA256
   "55660a4286847fe086cd3cdf09b800da3bdf09ddfc251df048da4021f84f61b7")
  (:PATH "raw/review/read-integration-failure.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/review/read-integration-failure.lisp")
   :BYTES 501 :SHA256
   "9c80869f81a5dcf5150e051ff746a65082a12db039a32db3db6cc6472aa89501")
  (:PATH "raw/selection-positive-inputs/.hidden.bin" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/01-positive/source/.hidden.bin")
   :BYTES 4 :SHA256
   "6d6f7836f1e146dc0204afb5133dae52fdc05603d8ac2dc793b481b0e0829fd1")
  (:PATH "raw/selection-positive-inputs/note.md.txt" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/01-positive/source/note.md")
   :BYTES 20 :SHA256
   "cb8863843e557f85ef55258e96cf2eb0bf3e7c2dad89280d9de58ed5486cd68c")
  (:PATH "raw/selection-positive-inputs/plain.txt" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection-tests/01-positive/source/plain.txt")
   :BYTES 15 :SHA256
   "3ed8a690a01dc12fa9284843fb380433d9c81afd51f43c72e8726d86742fb3b1")
  (:PATH "raw/selection/create-plan-before-backup-label.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection/create-plan-before-backup-label.lisp")
   :BYTES 2935 :SHA256
   "4fa1a90247149dfef33adcfca70a139191b0a2f95565d3a46de18ef9a418376b")
  (:PATH "raw/selection/create-plan.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection/create-plan.lisp")
   :BYTES 2943 :SHA256
   "186472a6c0d1b802ea46cb7a802400f5b2e8bfd1f585b79f34f132add9b5b579")
  (:PATH "raw/selection/main-plan-v2.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection/main-plan-v2.lisp")
   :BYTES 5886 :SHA256
   "86ffd133869bd6958f6b82a179652f7ee7a618b90c2ac045d250fa0b2430b34d")
  (:PATH "raw/selection/main-plan.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection/main-plan.lisp")
   :BYTES 5886 :SHA256
   "86ffd133869bd6958f6b82a179652f7ee7a618b90c2ac045d250fa0b2430b34d")
  (:PATH "raw/selection/preparation-notes.txt" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection/preparation-notes.txt")
   :BYTES 956 :SHA256
   "10671c56be9a34502a5eae11e6e042dae47909ea208883a012dc92ab893672f0")
  (:PATH "raw/selection/prepare-before-static-review.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection/prepare-before-static-review.lisp")
   :BYTES 3725 :SHA256
   "67daece69217bfb9a0c5e9b62dfa09164929f3915491b653e03e06c690199965")
  (:PATH "raw/selection/prepare.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection/prepare.lisp")
   :BYTES 4008 :SHA256
   "7fb7ed10772d7676ac200712295fd2c25b1b2a8a0f9d1d3f48de8c5d20c5ec69")
  (:PATH "raw/selection/rename-raw-documents.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/command-archive-collector/ArcDocDB/spikes/out/cbor-string-read-20261015/selection/rename-raw-documents.lisp")
   :BYTES 692 :SHA256
   "ab2f6361f2ce20ee221d2e8a77f3f5c61d743a67487f3ec287d2a509d70de673"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
