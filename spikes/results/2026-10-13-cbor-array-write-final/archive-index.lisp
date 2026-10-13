(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "final-check3" :RECORD-PATH "processes/final-check3/report.lisp"
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core")))
  (:LABEL "preparation1" :RECORD-PATH "processes/preparation1/report.lisp"
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((67) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/build-manifest.lisp")
    #A((7) BASE-CHAR . "--write")
    #A((61) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/manifest.lisp")
    #A((6) BASE-CHAR . "--file")
    #A((30) BASE-CHAR . "review/mutation-reading.md.txt")
    #A((63) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/review/mutation-reading.md")
    #A((6) BASE-CHAR . "--file")
    #A((28) BASE-CHAR . "review/mutation-reading.lisp")
    #A((65) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/review/mutation-reading.lisp")
    #A((6) BASE-CHAR . "--file")
    #A((36) BASE-CHAR . "review/mutation-reading-output-2.txt")
    #A((73) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/review/mutation-reading-output-2.txt")
    #A((6) BASE-CHAR . "--file")
    #A((40) BASE-CHAR . "review/mutation-reading-preliminary.lisp")
    #A((77) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/review/mutation-reading-preliminary.lisp")
    #A((6) BASE-CHAR . "--file")
    #A((36) BASE-CHAR . "review/mutation-reading-output-1.txt")
    #A((73) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/review/mutation-reading-output-1.txt")
    #A((6) BASE-CHAR . "--file")
    #A((80) BASE-CHAR
       . "collection-self-test-observations/collection-observation-4000914063-91118-0.lisp")
    #A((94) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/collection-observation-4000914063-91118-0.lisp")
    #A((6) BASE-CHAR . "--file")
    #A((80) BASE-CHAR
       . "collection-self-test-observations/collection-observation-4000914069-91118-0.lisp")
    #A((94) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/collection-observation-4000914069-91118-0.lisp")
    #A((6) BASE-CHAR . "--file")
    #A((80) BASE-CHAR
       . "collection-self-test-observations/collection-observation-4000914071-91118-0.lisp")
    #A((94) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/collection-observation-4000914071-91118-0.lisp")
    #A((6) BASE-CHAR . "--file")
    #A((80) BASE-CHAR
       . "collection-self-test-observations/collection-observation-4000914071-91118-1.lisp")
    #A((94) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/collection-observation-4000914071-91118-1.lisp")
    #A((6) BASE-CHAR . "--file")
    #A((69) BASE-CHAR
       . "collection-self-test-observations/closed-check-4000914066-91118-0.log")
    #A((83) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/closed-check-4000914066-91118-0.log")))
  (:LABEL "interrupted-collection1" :RECORD-PATH
   "processes/interrupted-collection1/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((60) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/collect.lisp")
    #A((9) BASE-CHAR . "--collect")
    #A((61) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/manifest.lisp")
    #A((43) BASE-CHAR . "spikes/results/2026-10-13-cbor-array-write/")
    #A((6) BASE-CHAR . "--jobs") #A((1) BASE-CHAR . "4")))
  (:LABEL "preparation2" :RECORD-PATH "processes/preparation2/report.lisp"
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((67) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/build-manifest.lisp")
    #A((7) BASE-CHAR . "--write")
    #A((63) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/manifest-2.lisp")
    #A((9) BASE-CHAR . "--process") #A((20) BASE-CHAR . "coverage-compression")
    #A((49) BASE-CHAR . "spikes/out/4000915378-command-26277-0/report.lisp")
    #A((6) BASE-CHAR . "--file")
    #A((30) BASE-CHAR . "review/mutation-reading.md.txt")
    #A((63) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/review/mutation-reading.md")
    #A((6) BASE-CHAR . "--file")
    #A((28) BASE-CHAR . "review/mutation-reading.lisp")
    #A((65) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/review/mutation-reading.lisp")
    #A((6) BASE-CHAR . "--file")
    #A((36) BASE-CHAR . "review/mutation-reading-output-2.txt")
    #A((73) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/review/mutation-reading-output-2.txt")
    #A((6) BASE-CHAR . "--file")
    #A((40) BASE-CHAR . "review/mutation-reading-preliminary.lisp")
    #A((77) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/review/mutation-reading-preliminary.lisp")
    #A((6) BASE-CHAR . "--file")
    #A((36) BASE-CHAR . "review/mutation-reading-output-1.txt")
    #A((73) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/review/mutation-reading-output-1.txt")
    #A((6) BASE-CHAR . "--file")
    #A((80) BASE-CHAR
       . "collection-self-test-observations/collection-observation-4000914063-91118-0.lisp")
    #A((94) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/collection-observation-4000914063-91118-0.lisp")
    #A((6) BASE-CHAR . "--file")
    #A((80) BASE-CHAR
       . "collection-self-test-observations/collection-observation-4000914069-91118-0.lisp")
    #A((94) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/collection-observation-4000914069-91118-0.lisp")
    #A((6) BASE-CHAR . "--file")
    #A((80) BASE-CHAR
       . "collection-self-test-observations/collection-observation-4000914071-91118-0.lisp")
    #A((94) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/collection-observation-4000914071-91118-0.lisp")
    #A((6) BASE-CHAR . "--file")
    #A((80) BASE-CHAR
       . "collection-self-test-observations/collection-observation-4000914071-91118-1.lisp")
    #A((94) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/collection-observation-4000914071-91118-1.lisp")
    #A((6) BASE-CHAR . "--file")
    #A((69) BASE-CHAR
       . "collection-self-test-observations/closed-check-4000914066-91118-0.log")
    #A((83) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/closed-check-4000914066-91118-0.log")
    #A((6) BASE-CHAR . "--file")
    #A((42) BASE-CHAR . "collection/interrupted-attempt-note.md.txt")
    #A((79) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/interrupted-attempt-note.md.txt")
    #A((6) BASE-CHAR . "--file")
    #A((34) BASE-CHAR . "collection/manifest-attempt-1.lisp")
    #A((61) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/manifest.lisp")))
  (:LABEL #A((10) BASE-CHAR . "preflight2") :RECORD-PATH
   "processes/preflight2/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((70) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/preflight-archive.lisp")
    #A((10) BASE-CHAR . "--manifest")
    #A((63) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/manifest-2.lisp")
    #A((13) BASE-CHAR . "--destination")
    #A((43) BASE-CHAR . "spikes/results/2026-10-13-cbor-array-write/")
    #A((8) BASE-CHAR . "--report")
    #A((64) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/preflight-2.lisp")))
  (:LABEL #A((15) BASE-CHAR . "main-collection") :RECORD-PATH
   "processes/main-collection/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((60) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/collect.lisp")
    #A((9) BASE-CHAR . "--collect")
    #A((63) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/manifest-2.lisp")
    #A((43) BASE-CHAR . "spikes/results/2026-10-13-cbor-array-write/")
    #A((6) BASE-CHAR . "--jobs") #A((1) BASE-CHAR . "4")))
  (:LABEL #A((12) BASE-CHAR . "check4-outer") :RECORD-PATH
   "processes/check4-outer/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "check")))
  (:LABEL #A((12) BASE-CHAR . "check4-inner") :RECORD-PATH
   "processes/check4-inner/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core")))
  (:LABEL #A((20) BASE-CHAR . "coverage-integration") :RECORD-PATH
   "processes/coverage-integration/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((11) BASE-CHAR . "--self-test")
    #A((68) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/coverage-integration-self-test/")))
  (:LABEL #A((16) BASE-CHAR . "observation-copy") :RECORD-PATH
   "processes/observation-copy/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((69) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/copy-observation.lisp")))
  (:LABEL #A((23) BASE-CHAR . "observation-compression") :RECORD-PATH
   "processes/observation-compression/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((27) BASE-CHAR . "tools/compact-evidence.lisp")
    #A((6) BASE-CHAR . "--root")
    #A((65) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/observation-copy/")
    #A((6) BASE-CHAR . "--jobs") #A((1) BASE-CHAR . "4")
    #A((21) BASE-CHAR . "--minimum-age-seconds") #A((1) BASE-CHAR . "0")))
  (:LABEL #A((22) BASE-CHAR . "supplement-preparation") :RECORD-PATH
   "processes/supplement-preparation/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((69) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/build-supplement.lisp")
    #A((7) BASE-CHAR . "--write")
    #A((72) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/supplement-manifest.lisp")
    #A((9) BASE-CHAR . "--process") #A((10) BASE-CHAR . "preflight2")
    #A((49) BASE-CHAR . "spikes/out/4000915803-command-37048-0/report.lisp")
    #A((9) BASE-CHAR . "--process") #A((15) BASE-CHAR . "main-collection")
    #A((49) BASE-CHAR . "spikes/out/4000915862-command-37341-0/report.lisp")
    #A((9) BASE-CHAR . "--process") #A((12) BASE-CHAR . "check4-outer")
    #A((49) BASE-CHAR . "spikes/out/4000916724-command-55352-0/report.lisp")
    #A((9) BASE-CHAR . "--process") #A((12) BASE-CHAR . "check4-inner")
    #A((49) BASE-CHAR . "spikes/out/4000916725-command-55396-0/report.lisp")
    #A((9) BASE-CHAR . "--process") #A((20) BASE-CHAR . "coverage-integration")
    #A((49) BASE-CHAR . "spikes/out/4000917001-command-59092-0/report.lisp")
    #A((9) BASE-CHAR . "--process") #A((16) BASE-CHAR . "observation-copy")
    #A((49) BASE-CHAR . "spikes/out/4000917064-command-59586-0/report.lisp")
    #A((9) BASE-CHAR . "--process")
    #A((23) BASE-CHAR . "observation-compression")
    #A((49) BASE-CHAR . "spikes/out/4000917071-command-59673-0/report.lisp")
    #A((6) BASE-CHAR . "--tree") #A((10) BASE-CHAR . "rawspikes4")
    #A((36) BASE-CHAR . "spikes/out/4000916943-check-58072-0/")
    #A((12) BASE-CHAR . "lisp-and-log") #A((6) BASE-CHAR . "--tree")
    #A((19) BASE-CHAR . "snapshot-self-test4")
    #A((49) BASE-CHAR . "spikes/out/4000916757-snapshot-self-test-55634-0/")
    #A((3) BASE-CHAR . "all") #A((6) BASE-CHAR . "--tree")
    #A((17) BASE-CHAR . "reader-self-test4")
    #A((47) BASE-CHAR . "spikes/out/4000916758-reader-self-test-55640-0/")
    #A((3) BASE-CHAR . "all") #A((6) BASE-CHAR . "--tree")
    #A((20) BASE-CHAR . "coverage-integration")
    #A((68) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/coverage-integration-self-test/")
    #A((3) BASE-CHAR . "all") #A((6) BASE-CHAR . "--file")
    #A((27) BASE-CHAR . "helpers/build-manifest.lisp")
    #A((67) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/build-manifest.lisp")
    #A((6) BASE-CHAR . "--file")
    #A((30) BASE-CHAR . "helpers/preflight-archive.lisp")
    #A((70) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/preflight-archive.lisp")
    #A((6) BASE-CHAR . "--file")
    #A((29) BASE-CHAR . "helpers/copy-observation.lisp")
    #A((69) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/copy-observation.lisp")
    #A((6) BASE-CHAR . "--file")
    #A((28) BASE-CHAR . "helpers/read-collection.lisp")
    #A((68) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/read-collection.lisp")
    #A((6) BASE-CHAR . "--file")
    #A((27) BASE-CHAR . "collection/preflight-2.lisp")
    #A((64) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/preflight-2.lisp")
    #A((6) BASE-CHAR . "--file")
    #A((32) BASE-CHAR . "collection/main-observation.lisp")
    #A((92) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/observation-copy/collection-observation.lisp")
    #A((6) BASE-CHAR . "--file")
    #A((41) BASE-CHAR . "collection/collection-observation.lisp.gz")
    #A((95) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/observation-copy/collection-observation.lisp.gz")
    #A((6) BASE-CHAR . "--file")
    #A((32) BASE-CHAR . "collection/main-closed-check.log")
    #A((83) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/closed-check-4000916242-37359-0.log")
    #A((6) BASE-CHAR . "--file") #A((22) BASE-CHAR . "docs/cbor-array.md.txt")
    #A((34) BASE-CHAR . "docs/implementazione/cbor-array.md")
    #A((6) BASE-CHAR . "--file")
    #A((32) BASE-CHAR . "docs/cbor-array-risultati.md.txt")
    #A((44) BASE-CHAR . "docs/implementazione/cbor-array-risultati.md")
    #A((6) BASE-CHAR . "--file")
    #A((28) BASE-CHAR . "review/collection-reading.md")
    #A((65) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/review/collection-reading.md")
    #A((6) BASE-CHAR . "--file")
    #A((30) BASE-CHAR . "review/collection-reading.lisp")
    #A((67) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/review/collection-reading.lisp")
    #A((6) BASE-CHAR . "--file")
    #A((36) BASE-CHAR . "review/collection-reading.output.txt")
    #A((73) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/review/collection-reading.output.txt")
    #A((6) BASE-CHAR . "--file")
    #A((38) BASE-CHAR . "review/collection-reading.output-2.txt")
    #A((75) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/review/collection-reading.output-2.txt")
    #A((6) BASE-CHAR . "--file")
    #A((38) BASE-CHAR . "review/collection-reading.output-3.txt")
    #A((75) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/review/collection-reading.output-3.txt")
    #A((6) BASE-CHAR . "--file")
    #A((42) BASE-CHAR . "review/collection-reading.preliminary.lisp")
    #A((79) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/review/collection-reading.preliminary.lisp")
    #A((6) BASE-CHAR . "--file")
    #A((44) BASE-CHAR . "review/collection-reading.preliminary-2.lisp")
    #A((81) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/review/collection-reading.preliminary-2.lisp")))
  (:LABEL #A((20) BASE-CHAR . "supplement-preflight") :RECORD-PATH
   "processes/supplement-preflight/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((70) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/preflight-archive.lisp")
    #A((10) BASE-CHAR . "--manifest")
    #A((72) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/supplement-manifest.lisp")
    #A((13) BASE-CHAR . "--destination")
    #A((49) BASE-CHAR . "spikes/results/2026-10-13-cbor-array-write-final/")
    #A((8) BASE-CHAR . "--report")
    #A((73) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/supplement-preflight.lisp")))
  (:LABEL #A((21) BASE-CHAR . "supplement-collection") :RECORD-PATH
   "processes/supplement-collection/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((60) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/collect.lisp")
    #A((9) BASE-CHAR . "--collect")
    #A((72) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/supplement-manifest.lisp")
    #A((49) BASE-CHAR . "spikes/results/2026-10-13-cbor-array-write-final/")
    #A((6) BASE-CHAR . "--jobs") #A((1) BASE-CHAR . "4")))
  (:LABEL #A((23) BASE-CHAR . "supplement-data-reading") :RECORD-PATH
   "processes/supplement-data-reading/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((68) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/read-collection.lisp")
    #A((94) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/collection-observation-4000917317-62924-0.lisp")
    #A((83) BASE-CHAR
       . "spikes/out/cbor-array-write-20261013/collection/closed-check-4000917340-62924-0.log"))))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/collection/supplement-manifest.lisp")
   :BYTES 40821 :SHA256
   "4487d236d39c4ea0b95343f751c4eaa1a39a39b9b36d892f61c604670bff7e48")
  (:PATH "collection-source.lisp" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/collection/collect.lisp")
   :BYTES 22602 :SHA256
   "53d8c739a95a79aba4ddc363abd6e0bc1f8d3f64b1572150b730f69eedc15296")
  (:PATH "processes/check4-inner/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916725-command-55396-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "11ba0764f075d846bb23736f16d187a20febbf4e2821303f13248088060ad39d")
  (:PATH "processes/check4-inner/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916725-command-55396-0/report.lisp")
   :BYTES 979122 :SHA256
   "fae9781bcbf089f116dd620d9011d707dc6c15941fcc20ce4698259615c503d7")
  (:PATH "processes/check4-outer/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916724-command-55352-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "537d2b88dbdf6225dbfd6a7aed1ac3b030a960d6c3d500e0bed635b5ec7a5b96")
  (:PATH "processes/check4-outer/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916724-command-55352-0/report.lisp")
   :BYTES 170590 :SHA256
   "e8ee4c11e43921d99fd0f8c6dcf8000eb4bc5bf1450adaaba6c23e3a6015b141")
  (:PATH "processes/coverage-integration/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000917001-command-59092-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "2c248bf83eb3039f7fce03b74b40aa5519d32d0c69682a0bfb4ac63694c70119")
  (:PATH "processes/coverage-integration/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000917001-command-59092-0/report.lisp")
   :BYTES 170600 :SHA256
   "4caa7b46361a5e88011bba1f0b6416c89d4430cdc56581a75fe3953b1f709b34")
  (:PATH "processes/final-check3/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000914822-command-10423-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "cd32494cd5ad4c275f2f118de2109c0421dedcb0ae613cc66df4b3a83de39e48")
  (:PATH "processes/final-check3/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000914822-command-10423-0/report.lisp")
   :BYTES 963835 :SHA256
   "a32ae8baddf7b025e346d268ff892d4f9852ffbb14c3c604f8cc218d842d68da")
  (:PATH "processes/interrupted-collection1/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000915242-command-20835-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "dfa8ac8e07dc2c808c79eba7b02dd48970cb56643fb179da342d40feac170bad")
  (:PATH "processes/interrupted-collection1/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000915242-command-20835-0/report.lisp")
   :BYTES 169868 :SHA256
   "f2cc484813f6a709e6c75a10ed15ac0c8bf39805f483102c6ab3f593627f3799")
  (:PATH "processes/main-collection/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000915862-command-37341-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "ff82bcace76f4e6659eff316113043a24a87b3acf1353009cf31023bd8ef2e63")
  (:PATH "processes/main-collection/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000915862-command-37341-0/report.lisp")
   :BYTES 170090 :SHA256
   "23276e3c6a4bdbefbf0f05425196bc764d8f7565a65a5576c8714e6e025d10d1")
  (:PATH "processes/observation-compression/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000917071-command-59673-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "36a4cf19db872adb529998723401833c8e4ec628a9d711fbc1c0d327129b412c")
  (:PATH "processes/observation-compression/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000917071-command-59673-0/report.lisp")
   :BYTES 171808 :SHA256
   "c00c8384ed0d3f352b63e1cc2df091f480718e749f6878aed215f110f638d8ab")
  (:PATH "processes/observation-copy/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000917064-command-59586-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "749487678688610ffa1cd8c8830d47cf833e47aad2caa1d98087fc7494900b1a")
  (:PATH "processes/observation-copy/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000917064-command-59586-0/report.lisp")
   :BYTES 170799 :SHA256
   "f377269aace236725b9093eb44304251480b209a963deae844c69fc69d2965cd")
  (:PATH "processes/preflight2/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000915803-command-37048-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "7f12593f4bedc9ad19da21231e180d97379e3f770ef03dd57c542b4bca20343f")
  (:PATH "processes/preflight2/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000915803-command-37048-0/report.lisp")
   :BYTES 171222 :SHA256
   "72161ef450795425c81f8e406f031ee3aeaafe8a833d666a23359ffb43c93c3c")
  (:PATH "processes/preparation1/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000915223-command-20470-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "c5f3d2e375022089d89123d0f1a227745397259e106fcac792c9d8936632d510")
  (:PATH "processes/preparation1/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000915223-command-20470-0/report.lisp")
   :BYTES 172756 :SHA256
   "5317b5b11364c68b0623c10c7bae81df39aec0f7d9f827e9e90f82e8c8cf1aec")
  (:PATH "processes/preparation2/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000915593-command-32424-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "7eea621c0960258f2d82b23edca85ea4fec06a91de105e62461d6185423a5bc1")
  (:PATH "processes/preparation2/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000915593-command-32424-0/report.lisp")
   :BYTES 173304 :SHA256
   "130dd43a31ffe5aec9ca50ef1594e295fdcb105b8fea068031cfd016afae8b25")
  (:PATH "raw/collection/collection-observation.lisp.gz" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/collection/observation-copy/collection-observation.lisp.gz")
   :BYTES 171129 :SHA256
   "4a74a9a7e6127b5ee0a41bb481dea5b177eab597fa34e2c7165098a70af720cf")
  (:PATH "raw/collection/main-closed-check.log" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/collection/closed-check-4000916242-37359-0.log")
   :BYTES 5088 :SHA256
   "06bfe9a541d40ae721b0d960f1dc8f379cca1f21fd49551bd8e84948252a8eec")
  (:PATH "raw/collection/main-observation.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/collection/observation-copy/collection-observation.lisp")
   :BYTES 334 :SHA256
   "1108fc761150f55aeb371f912d159e95f0307d4458304833ed0d244863726581")
  (:PATH "raw/collection/preflight-2.lisp" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/collection/preflight-2.lisp")
   :BYTES 1224 :SHA256
   "dafdbf11c91123111855ac9ecdf5ae560ddd82a3a5d3a88f2b7f6a522da496d5")
  (:PATH "raw/coverage-integration/988fa7bf2bf81097f999eec121c1a186.html"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/coverage-integration-self-test/988fa7bf2bf81097f999eec121c1a186.html")
   :BYTES 2851 :SHA256
   "ef889902fa0586fd108132fbef658e751c819c56b09e0c80b25fa63473972082")
  (:PATH "raw/coverage-integration/cover-index.html" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/coverage-integration-self-test/cover-index.html")
   :BYTES 1811 :SHA256
   "1b7e9a7bdef9684a0375c158d17fea8b24883a6d55e80a52d8cb7e26e34e3dab")
  (:PATH "raw/coverage-integration/coverage-fixture.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/coverage-integration-self-test/coverage-fixture.lisp")
   :BYTES 147 :SHA256
   "3767518fde8bde1e1286dbf663e97eac01f02e038d7f3161df436d9fd3e92559")
  (:PATH "raw/docs/cbor-array-risultati.md.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/docs/implementazione/cbor-array-risultati.md")
   :BYTES 11227 :SHA256
   "a2734adc66ec39987d1daba3956c57cb53786c475242c0a0ffa655d02ddf87eb")
  (:PATH "raw/docs/cbor-array.md.txt" :SOURCE
   #A((98) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/docs/implementazione/cbor-array.md")
   :BYTES 3147 :SHA256
   "b193f1de080d427f60a7bec554c44e8482ba912f4e568dacdbd786a2d76e6d98")
  (:PATH "raw/helpers/append.lisp" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/collection/append.lisp")
   :BYTES 9677 :SHA256
   "f59f7a52934c7fe6103b5047aade87214f17494e857fe35c568968c681790d81")
  (:PATH "raw/helpers/build-manifest.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/collection/build-manifest.lisp")
   :BYTES 15514 :SHA256
   "d48c5c28f048ef933aed2d62148f6e077e8340316679c8bbf884d03d06d51e29")
  (:PATH "raw/helpers/build-supplement.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/collection/build-supplement.lisp")
   :BYTES 14623 :SHA256
   "206dd4160c67addc7abd9e63e962ccd95b908c4e6b5d2ae184f1ee512dec2dbe")
  (:PATH "raw/helpers/copy-observation.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/collection/copy-observation.lisp")
   :BYTES 897 :SHA256
   "20b2f6f75732001ec7b390fb3434ba0c879b44795ba1a03acaf75e70eb9fb650")
  (:PATH "raw/helpers/preflight-archive.lisp" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/collection/preflight-archive.lisp")
   :BYTES 16434 :SHA256
   "d9201175eef9d80ebe8acdcdb1580ba4e3477c0fe41643334a115a39c3a4beef")
  (:PATH "raw/helpers/read-collection.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/collection/read-collection.lisp")
   :BYTES 1824 :SHA256
   "7739a12c824027a86bb47e135fbe2c4b17278068c83d517e4e2cc75abb342083")
  (:PATH "raw/rawspikes3/SPK-01.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000915025-check-15198-0/SPK-01.lisp")
   :BYTES 27228 :SHA256
   "5034abd606821624f0f31abda25267a8c558c1e2b3179f2b7109d749c9900a0f")
  (:PATH "raw/rawspikes3/SPK-02.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000915025-check-15198-0/SPK-02.lisp")
   :BYTES 1607 :SHA256
   "68481db59fde33e056ea121d5ec55e664f0f7ae0c247cac2f7604fb49f6850e7")
  (:PATH "raw/rawspikes3/SPK-03.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000915025-check-15198-0/SPK-03.lisp")
   :BYTES 3643 :SHA256
   "32765abefed911d4125b33158544f2328cbe0d9f83e0c980d24741ef29cc44b5")
  (:PATH "raw/rawspikes3/SPK-04.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000915025-check-15198-0/SPK-04.lisp")
   :BYTES 6752 :SHA256
   "edec35eaebf1b4058d262a9a918634c70a58f9c1681606ea855361a3a004efe7")
  (:PATH "raw/rawspikes3/SPK-05.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000915025-check-15198-0/SPK-05.lisp")
   :BYTES 10133 :SHA256
   "96fab3b035dc8bd02127a4f3d5258f0f2c31069755a43e5bd75b58fb27d1a288")
  (:PATH "raw/rawspikes3/SPK-06.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000915025-check-15198-0/SPK-06.lisp")
   :BYTES 24090 :SHA256
   "5cadc109bc3f5fc832da46b3e36cf152f5d2f2095c29ba64bbe54b3774dabd4e")
  (:PATH "raw/rawspikes3/SPK-07.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000915025-check-15198-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "9451abad762010eadb49161f51a81a79eee1b6390d47bfbd70bfc6ceea450fac")
  (:PATH "raw/rawspikes3/SPK-07.lisp.gz" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000915025-check-15198-0/SPK-07.lisp.gz")
   :BYTES 410640 :SHA256
   "33968f6d28d42406751a749405ab06ca3bd2c1f95a37599832486805d78ea7b0")
  (:PATH "raw/rawspikes3/SPK-08.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000915025-check-15198-0/SPK-08.lisp")
   :BYTES 291712 :SHA256
   "2873754c1293882379aeb441dade3307ca6df0296f15bca1ad31a0d0fce91a16")
  (:PATH "raw/rawspikes3/SPK-09.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000915025-check-15198-0/SPK-09.lisp")
   :BYTES 2472 :SHA256
   "b12c2a52da5b5e7b5182eb73db0561c649b39b42c14e5fdeaf7ce53fc33c7cc8")
  (:PATH "raw/rawspikes3/SPK-10.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000915025-check-15198-0/SPK-10.lisp")
   :BYTES 22975 :SHA256
   "a68f6ef91a7450aa68c0bfd084811b900907d6fc6d96e732120289d0e370766d")
  (:PATH "raw/rawspikes3/conservazione.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000915025-check-15198-0/conservazione.lisp")
   :BYTES 2299 :SHA256
   "5d6d1795e6e5f73e08ab6fbcbeb723b970896bb88ccb2a73cc072d5f13f1c0be")
  (:PATH "raw/rawspikes3/report.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000915025-check-15198-0/report.lisp")
   :BYTES 318 :SHA256
   "47f253588a13ec71fdab2bba693a1926fcf2a8cfd917ae675af841902be955c0")
  (:PATH "raw/rawspikes3/report.lisp.gz" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000915025-check-15198-0/report.lisp.gz")
   :BYTES 466804 :SHA256
   "0cc5e67b8429b401a6743f823d2683a0cb95cb70ff3be8624411d133cae40950")
  (:PATH "raw/rawspikes4/SPK-01.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916943-check-58072-0/SPK-01.lisp")
   :BYTES 27228 :SHA256
   "f12559b831ba21ea423c4234376f66570ee94d303abfdae8ce3a1e8b31e4f8e5")
  (:PATH "raw/rawspikes4/SPK-02.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916943-check-58072-0/SPK-02.lisp")
   :BYTES 1607 :SHA256
   "ab09ac5b359a258672c456553f046be1ccfa67a7366a1a49daad234e01fd3108")
  (:PATH "raw/rawspikes4/SPK-03.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916943-check-58072-0/SPK-03.lisp")
   :BYTES 3644 :SHA256
   "88ae5441960681ba4873087a783d3d92a0e7c1e2f56d372a0556d350cfdd8c04")
  (:PATH "raw/rawspikes4/SPK-04.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916943-check-58072-0/SPK-04.lisp")
   :BYTES 6750 :SHA256
   "48d3d4da2f43d20a779a07a08f279cbb007cb669af4725969a0bc04afa0a569b")
  (:PATH "raw/rawspikes4/SPK-05.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916943-check-58072-0/SPK-05.lisp")
   :BYTES 10126 :SHA256
   "768200bda6e3612ee08edb968abfb2915eeae90c2070ae9fa8a4fe61c252dc0a")
  (:PATH "raw/rawspikes4/SPK-06.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916943-check-58072-0/SPK-06.lisp")
   :BYTES 24062 :SHA256
   "93e33f056f7c8cd926e655fafeb20a1006a6453159612d8ae66780e4d3030145")
  (:PATH "raw/rawspikes4/SPK-07.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916943-check-58072-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "e68f7b83a5f365f2f4727052b97506807bdf35d2d87215ff5dc31d3675a0ae35")
  (:PATH "raw/rawspikes4/SPK-07.lisp.gz" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916943-check-58072-0/SPK-07.lisp.gz")
   :BYTES 410638 :SHA256
   "6b5e046baaca93db29cb5c58f1f65b9ea162555816b5713427beb5a76cb12d4f")
  (:PATH "raw/rawspikes4/SPK-08.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916943-check-58072-0/SPK-08.lisp")
   :BYTES 291712 :SHA256
   "6a55efcc18c48ab24343784663b4e8a3791b53de952f6cae205d8d3b87ddc9dc")
  (:PATH "raw/rawspikes4/SPK-09.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916943-check-58072-0/SPK-09.lisp")
   :BYTES 2472 :SHA256
   "8b4ff634f86ef1a0fdb6c357dcc2973d546678eb8f397951bb42778f8dfd8f05")
  (:PATH "raw/rawspikes4/SPK-10.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916943-check-58072-0/SPK-10.lisp")
   :BYTES 22977 :SHA256
   "9242387c141578021db5942f7442753f987958a3a3016366f86fa35558c91066")
  (:PATH "raw/rawspikes4/conservazione.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916943-check-58072-0/conservazione.lisp")
   :BYTES 2301 :SHA256
   "c94a3b94db1fe5dc0c18763190a1541709b6cbc2bcd0d3939c2e281a9759ebb8")
  (:PATH "raw/rawspikes4/report.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916943-check-58072-0/report.lisp")
   :BYTES 318 :SHA256
   "6844b5672f6d3951ed929a8fdb6ad134efcc47809463d6bd5bcd81e6d502d0ab")
  (:PATH "raw/rawspikes4/report.lisp.gz" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916943-check-58072-0/report.lisp.gz")
   :BYTES 466697 :SHA256
   "ca10ccf7ace60f945de71f76ce336845f8c3cc1198b0134532c06711cf770cc5")
  (:PATH "raw/reader-self-test3/completion-exit/isolated-build.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000914852-reader-self-test-10981-0/completion-exit/isolated-build.lisp")
   :BYTES 197 :SHA256
   "1a45dcf8a6d03f1e8866e49280c6f0edb894320c90624d5620fad1e3d546cea9")
  (:PATH "raw/reader-self-test3/completion-exit/stderr.log" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000914852-reader-self-test-10981-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/reader-self-test3/completion-exit/stdout.log" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000914852-reader-self-test-10981-0/completion-exit/stdout.log")
   :BYTES 105 :SHA256
   "5e630c1b44d68ce71b27d151e76bf367e3cbd941200adc36cdd30e0fe7390531")
  (:PATH "raw/reader-self-test3/report.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000914852-reader-self-test-10981-0/report.lisp")
   :BYTES 1943 :SHA256
   "324b31ff1335cd843f91fb1f40bedc97963ca8063ddb53ca3900fdee56ee755b")
  (:PATH "raw/reader-self-test3/signal/isolated-build.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000914852-reader-self-test-10981-0/signal/isolated-build.lisp")
   :BYTES 247 :SHA256
   "ff5cf55dda241d32ea1b4308172c7dc526436cbf1d546e7471148cee95a873d1")
  (:PATH "raw/reader-self-test3/signal/stderr.log" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000914852-reader-self-test-10981-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/reader-self-test3/signal/stdout.log" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000914852-reader-self-test-10981-0/signal/stdout.log")
   :BYTES 126 :SHA256
   "3697c68fa71f124c8d05d8cc5d649a744586a10989eb2e67c5bdce6bfc760142")
  (:PATH "raw/reader-self-test4/completion-exit/isolated-build.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916758-reader-self-test-55640-0/completion-exit/isolated-build.lisp")
   :BYTES 197 :SHA256
   "1a45dcf8a6d03f1e8866e49280c6f0edb894320c90624d5620fad1e3d546cea9")
  (:PATH "raw/reader-self-test4/completion-exit/stderr.log" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916758-reader-self-test-55640-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/reader-self-test4/completion-exit/stdout.log" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916758-reader-self-test-55640-0/completion-exit/stdout.log")
   :BYTES 105 :SHA256
   "5e630c1b44d68ce71b27d151e76bf367e3cbd941200adc36cdd30e0fe7390531")
  (:PATH "raw/reader-self-test4/report.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916758-reader-self-test-55640-0/report.lisp")
   :BYTES 1943 :SHA256
   "1972c0c81264210c329a2d316ba6a4b2aadcf1f34e5a7efad3d4d21a9a733547")
  (:PATH "raw/reader-self-test4/signal/isolated-build.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916758-reader-self-test-55640-0/signal/isolated-build.lisp")
   :BYTES 247 :SHA256
   "ff5cf55dda241d32ea1b4308172c7dc526436cbf1d546e7471148cee95a873d1")
  (:PATH "raw/reader-self-test4/signal/stderr.log" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916758-reader-self-test-55640-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/reader-self-test4/signal/stdout.log" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916758-reader-self-test-55640-0/signal/stdout.log")
   :BYTES 126 :SHA256
   "3697c68fa71f124c8d05d8cc5d649a744586a10989eb2e67c5bdce6bfc760142")
  (:PATH "raw/review/collection-reading.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/collection-reading.lisp")
   :BYTES 15332 :SHA256
   "9f9870880a0036b9d649069c9d98ef18ef0edd1d266f57e54a55c67233b55d5a")
  (:PATH "raw/review/collection-reading.md.txt" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/collection-reading.md")
   :BYTES 5731 :SHA256
   "2106afb9a9b2441ce7a442a1b939c1303652cded94f649cd2d03484cf9b31969")
  (:PATH "raw/review/collection-reading.output-2.txt" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/collection-reading.output-2.txt")
   :BYTES 3465 :SHA256
   "de12dbb01e4d96cc7aef22965c390a269b4d744e4a8e71f7c73c7a7b94bd97f9")
  (:PATH "raw/review/collection-reading.output-3.txt" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/collection-reading.output-3.txt")
   :BYTES 4229 :SHA256
   "3dd1a74926dbc9d1392e44e1d9d74ecc477bf8548c2db780505c09212a686d78")
  (:PATH "raw/review/collection-reading.output.txt" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/collection-reading.output.txt")
   :BYTES 3465 :SHA256
   "188a7befc76adcfce0103c934819d5e9918cba81e63a3246c4db685e76e72241")
  (:PATH "raw/review/collection-reading.preliminary-2.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/collection-reading.preliminary-2.lisp")
   :BYTES 15331 :SHA256
   "174a1c980a38c09f62e09262026f3d1d4453ca37755096780f8522b28915229c")
  (:PATH "raw/review/collection-reading.preliminary.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/collection-reading.preliminary.lisp")
   :BYTES 15330 :SHA256
   "a81fcef4bd0e3d4d6c29c48d185dd2a7bf7bd3a2500b915b2ff4bdba25937f3b")
  (:PATH "raw/review/coverage-reading-output.txt" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/coverage-reading-output.txt")
   :BYTES 18470 :SHA256
   "83b4b4bf63e9d52c20b7c76958ccd97066982d3d0eac4349b65c7ace8c22422f")
  (:PATH "raw/review/coverage-reading.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/coverage-reading.lisp")
   :BYTES 6135 :SHA256
   "a8ef65305429cefb854f99b1a11e26a7eacc1aa0251341b6deda61bdb6a78efa")
  (:PATH "raw/review/coverage-reading.md.txt" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/coverage-reading.md")
   :BYTES 9197 :SHA256
   "e5e89b871babf8282b196ae5051ce3010b5448e58eb988c34d7b970edf37289c")
  (:PATH "raw/review/initial-runtime-reading.lisp" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/initial-runtime-reading.lisp")
   :BYTES 19115 :SHA256
   "70e196c7771e0d36e242537d447d5d02e1dc6a0cf52ca1918dda230d03358cf7")
  (:PATH "raw/review/initial-runtime-reading.md.txt" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/initial-runtime-reading.md")
   :BYTES 8795 :SHA256
   "cc926f2b62c67214f00a8aa588d2e0edbe12161b094c620b52261c9fa6f63a8a")
  (:PATH "raw/review/integrated-runtime-reading-1.md.txt" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading-1.md")
   :BYTES 6134 :SHA256
   "d1e8196efab4c3ad5ac27bc8a80f2fc2d09f84ffd63b8155720dbd9d16f6632e")
  (:PATH "raw/review/integrated-runtime-reading-1.stderr.txt" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading-1.stderr.txt")
   :BYTES 12718 :SHA256
   "299ee2264872b080f4ffa1d10b71f9efd5adb3666f34aafd132e57948ff67548")
  (:PATH "raw/review/integrated-runtime-reading-1.stdout.txt" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading-1.stdout.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/integrated-runtime-reading-1b.stderr.txt" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading-1b.stderr.txt")
   :BYTES 12886 :SHA256
   "8de876b7f6b4f5793e59b05e614295d816a9dafe021f46316b05691c928909db")
  (:PATH "raw/review/integrated-runtime-reading-1b.stdout.txt" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading-1b.stdout.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/integrated-runtime-reading-1c.stderr.txt" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading-1c.stderr.txt")
   :BYTES 12709 :SHA256
   "97c51be245f922fb5e2ca0927cc87cff0efbfb2fcc19e12f0745767aa73b83cf")
  (:PATH "raw/review/integrated-runtime-reading-1c.stdout.txt" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading-1c.stdout.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/integrated-runtime-reading-1d.stderr.txt" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading-1d.stderr.txt")
   :BYTES 12778 :SHA256
   "7e5fbf302f0373f2edb384f37b74cc4941caa7db057171798137a4c7d982d933")
  (:PATH "raw/review/integrated-runtime-reading-1d.stdout.txt" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading-1d.stdout.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/integrated-runtime-reading-1e.stderr.txt" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading-1e.stderr.txt")
   :BYTES 12886 :SHA256
   "b4dd186bbf3f773c39bf0bdb834995b419bea21c73988fc9d7aa01fe6b447c8f")
  (:PATH "raw/review/integrated-runtime-reading-1e.stdout.txt" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading-1e.stdout.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/integrated-runtime-reading-1f.stderr.txt" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading-1f.stderr.txt")
   :BYTES 8044 :SHA256
   "bc913b30d155cc9fc5e8155cb1933908cd3f7b7b7ae630429fa772b2d0ec9f59")
  (:PATH "raw/review/integrated-runtime-reading-1f.stdout.txt" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading-1f.stdout.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/integrated-runtime-reading-1g.stderr.txt" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading-1g.stderr.txt")
   :BYTES 8347 :SHA256
   "8021ff05f5797e2e9b786c22dbf7fc180232316f20c530e74c55aabfad532887")
  (:PATH "raw/review/integrated-runtime-reading-1g.stdout.txt" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading-1g.stdout.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/integrated-runtime-reading-1h.stderr.txt" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading-1h.stderr.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/integrated-runtime-reading-1h.stdout.txt" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading-1h.stdout.txt")
   :BYTES 6000 :SHA256
   "61ea006943c7473bf3cd10cdcdb9b262c813feffc887abe9bec3d5b27b8c2055")
  (:PATH "raw/review/integrated-runtime-reading-2.md.txt" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading-2.md")
   :BYTES 4570 :SHA256
   "e8985651b645a80abcc3fe8aad98a21a7bb950aa446a0ce995bb3b6a7f2f68a5")
  (:PATH "raw/review/integrated-runtime-reading-2.stderr.txt" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading-2.stderr.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/integrated-runtime-reading-2.stdout.txt" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading-2.stdout.txt")
   :BYTES 1976 :SHA256
   "7ccff7480e919d239302d9093a599161672cc0ba4e4533ef0aa1c339de062aa0")
  (:PATH "raw/review/integrated-runtime-reading-3.md.txt" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading-3.md")
   :BYTES 5290 :SHA256
   "6903e148133f315d4600ffbad1fa97f0837ec5b8e010802d5a2ab73541cfd04f")
  (:PATH "raw/review/integrated-runtime-reading-3.stderr.txt" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading-3.stderr.txt")
   :BYTES 7790 :SHA256
   "5ca0370e514d404bbac10e3998323c34724ddaf5f429037c6cdb6c3f9b7e7583")
  (:PATH "raw/review/integrated-runtime-reading-3.stdout.txt" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading-3.stdout.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/integrated-runtime-reading-3b.stderr.txt" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading-3b.stderr.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/integrated-runtime-reading-3b.stdout.txt" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading-3b.stdout.txt")
   :BYTES 6031 :SHA256
   "8aa9a17230327b3924d65abb631c6f13f9cd006ba369c1d4d79efe4fc3fdacd0")
  (:PATH "raw/review/integrated-runtime-reading-4-coverage.lisp" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading-4-coverage.lisp")
   :BYTES 3761 :SHA256
   "8880bbfdba1fa66f7c5a1e710d6f09fb7e4d6d50bee38fd5d7f8399157584f97")
  (:PATH "raw/review/integrated-runtime-reading-4-coverage.stderr.txt" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading-4-coverage.stderr.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/integrated-runtime-reading-4-coverage.stdout.txt" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading-4-coverage.stdout.txt")
   :BYTES 1076 :SHA256
   "97583766c358434f5e9561b423c3b1a6b1d8b81e5fdd82301b31b4b93f061475")
  (:PATH "raw/review/integrated-runtime-reading-4.md.txt" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading-4.md")
   :BYTES 6679 :SHA256
   "954b97b1c26f060f4b41b09f1e984143e1a2b776e22aad88b8ea2ac24feffb69")
  (:PATH "raw/review/integrated-runtime-reading-4.stderr.txt" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading-4.stderr.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/review/integrated-runtime-reading-4.stdout.txt" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading-4.stdout.txt")
   :BYTES 6031 :SHA256
   "63d552c804604f9ae300dc48d0367b93c59947db4e590898f9de1d3b007a3017")
  (:PATH "raw/review/integrated-runtime-reading-failure.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading-failure.lisp")
   :BYTES 12343 :SHA256
   "63a46b619dafa0f54f412d9f8f6942734794097d4e783aa00e262d9070355fee")
  (:PATH "raw/review/integrated-runtime-reading.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading.lisp")
   :BYTES 17200 :SHA256
   "290bb355e112e15aa83d36fb5abdb58281b4f6e5c601c63e4da036fa5b354a59")
  (:PATH "raw/review/integrated-runtime-reading.preparatory-1.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading.preparatory-1.lisp")
   :BYTES 16172 :SHA256
   "313a21a29ded68be0aebce8888e119846d854a95bbf2ae8f783914ded0cc5188")
  (:PATH "raw/review/integrated-runtime-reading.preparatory-1b.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading.preparatory-1b.lisp")
   :BYTES 16252 :SHA256
   "a6db1dbc136ce734986be99ccc15a65f2fb2a8367bd085b411b84c2d37f76b8a")
  (:PATH "raw/review/integrated-runtime-reading.preparatory-1c.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading.preparatory-1c.lisp")
   :BYTES 16470 :SHA256
   "b7007febe3bdde3dfda4967665b3410b7fa4873212b7910a671b0f379a07a0c5")
  (:PATH "raw/review/integrated-runtime-reading.preparatory-1d.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading.preparatory-1d.lisp")
   :BYTES 16471 :SHA256
   "a698562149c9c6f0a6ad1be561056600185906143239536bde0586cdc04da0ff")
  (:PATH "raw/review/integrated-runtime-reading.preparatory-1e.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading.preparatory-1e.lisp")
   :BYTES 16444 :SHA256
   "4d6f9834b748239dc3c741d4a49435adcf350e9d3b52652fdd6df429957131fb")
  (:PATH "raw/review/integrated-runtime-reading.preparatory-1f.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading.preparatory-1f.lisp")
   :BYTES 16557 :SHA256
   "512d55834d8d9fda564d1fc8bc1a9a4fab4c3edea3558c839660d790186e64f1")
  (:PATH "raw/review/integrated-runtime-reading.preparatory-1g.lisp" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading.preparatory-1g.lisp")
   :BYTES 16783 :SHA256
   "252d740a55697c52ab06a3e26fef7ab2e73dfee90db31f6f2b004144f273fd29")
  (:PATH "raw/review/integrated-runtime-reading.preparatory-1h-3.lisp" :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integrated-runtime-reading.preparatory-1h-3.lisp")
   :BYTES 16908 :SHA256
   "84a6e2e5101e15beb1bf27fa0f9797892529edb6fc8a2bc659a531c21ca3a30f")
  (:PATH "raw/review/integration-reading-4.md.txt" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integration-reading-4.md")
   :BYTES 7001 :SHA256
   "ce580e7be4c7a71c09b849068d6415b8135bd68906923e7fcb1cd70445fd2588")
  (:PATH "raw/review/integration-reading.md.txt" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/integration-reading.md")
   :BYTES 5289 :SHA256
   "1b5870942d598b9ab3ae2512d93826dc8f87c8f6bcc984e453c2fa453a684a6a")
  (:PATH "raw/review/mutation-reading-output-1.txt" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/mutation-reading-output-1.txt")
   :BYTES 22709 :SHA256
   "02af653e4dfdf5f44c91d6f204991954327b547b3e4c11e321b3ad5b6e7faade")
  (:PATH "raw/review/mutation-reading-output-2.txt" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/mutation-reading-output-2.txt")
   :BYTES 5529 :SHA256
   "628488b7a547aecd3440f810b88295e74f63a49bad1d067db95cb5375687da9f")
  (:PATH "raw/review/mutation-reading-preliminary.lisp" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/mutation-reading-preliminary.lisp")
   :BYTES 14687 :SHA256
   "0dda05d9fb965049e47e19476c4c0af4c5aa27c272d8274ce19adbc7122a0266")
  (:PATH "raw/review/mutation-reading.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/mutation-reading.lisp")
   :BYTES 15926 :SHA256
   "274667e0a7ebe517e087e7a82d37037a3c4a6fae9178c4b159002aec84dd251e")
  (:PATH "raw/review/mutation-reading.md.txt" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/mutation-reading.md")
   :BYTES 6081 :SHA256
   "a82e00cc972db37d85e157e04eb67e63acb0f958c62019a0baa276cba17ebffb")
  (:PATH "raw/review/mutator-final-reading.md.txt" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/mutator-final-reading.md")
   :BYTES 7025 :SHA256
   "35eb667518f7c26ac062ab7179d70abc433cec5645809f8306937d2417ca0f55")
  (:PATH "raw/review/root-record-summary.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/cbor-array-write-20261013/review/root-record-summary.lisp")
   :BYTES 1515 :SHA256
   "fe8ee795acf8ba6a46ca627dabf7043af6ec35bb246a3724a24883ffd86be23b")
  (:PATH "raw/snapshot-self-test3/completion-exit/isolated-build.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000914851-snapshot-self-test-10971-0/completion-exit/isolated-build.lisp")
   :BYTES 199 :SHA256
   "b8bb4416a818775bae5c77341eeec2c356a2733f633ac2bc8b6ac3ff955d05e0")
  (:PATH "raw/snapshot-self-test3/completion-exit/stderr.log" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000914851-snapshot-self-test-10971-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/snapshot-self-test3/completion-exit/stdout.log" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000914851-snapshot-self-test-10971-0/completion-exit/stdout.log")
   :BYTES 107 :SHA256
   "4f22544421d9012fe132a36bf15950cd327ca959b8f9c5ef3d386e0c8b62a25c")
  (:PATH "raw/snapshot-self-test3/report.lisp" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000914851-snapshot-self-test-10971-0/report.lisp")
   :BYTES 1961 :SHA256
   "3a2e73f2c248033c99a20774c153251e69a7bb3c7b7356c1285eaf0beee695f9")
  (:PATH "raw/snapshot-self-test3/signal/isolated-build.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000914851-snapshot-self-test-10971-0/signal/isolated-build.lisp")
   :BYTES 249 :SHA256
   "a345276e3dfe377c0bbd359793165915b1527938a65250d367ce5ac079feecc1")
  (:PATH "raw/snapshot-self-test3/signal/stderr.log" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000914851-snapshot-self-test-10971-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/snapshot-self-test3/signal/stdout.log" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000914851-snapshot-self-test-10971-0/signal/stdout.log")
   :BYTES 128 :SHA256
   "e3502e714a0530acb1f0130c4ced4a016607bcb067e3686f6f29704db8423ea5")
  (:PATH "raw/snapshot-self-test4/completion-exit/isolated-build.lisp" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916757-snapshot-self-test-55634-0/completion-exit/isolated-build.lisp")
   :BYTES 199 :SHA256
   "b8bb4416a818775bae5c77341eeec2c356a2733f633ac2bc8b6ac3ff955d05e0")
  (:PATH "raw/snapshot-self-test4/completion-exit/stderr.log" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916757-snapshot-self-test-55634-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/snapshot-self-test4/completion-exit/stdout.log" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916757-snapshot-self-test-55634-0/completion-exit/stdout.log")
   :BYTES 107 :SHA256
   "4f22544421d9012fe132a36bf15950cd327ca959b8f9c5ef3d386e0c8b62a25c")
  (:PATH "raw/snapshot-self-test4/report.lisp" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916757-snapshot-self-test-55634-0/report.lisp")
   :BYTES 1961 :SHA256
   "5f1e55a7a19afd3c8b0c49d290bee9260003b1ae6f613d542c46b96e69fe4669")
  (:PATH "raw/snapshot-self-test4/signal/isolated-build.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916757-snapshot-self-test-55634-0/signal/isolated-build.lisp")
   :BYTES 249 :SHA256
   "a345276e3dfe377c0bbd359793165915b1527938a65250d367ce5ac079feecc1")
  (:PATH "raw/snapshot-self-test4/signal/stderr.log" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916757-snapshot-self-test-55634-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/snapshot-self-test4/signal/stdout.log" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000916757-snapshot-self-test-55634-0/signal/stdout.log")
   :BYTES 128 :SHA256
   "e3502e714a0530acb1f0130c4ced4a016607bcb067e3686f6f29704db8423ea5")
  (:PATH "processes/supplement-preparation/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000917285-command-62231-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "bfd8090cb5deaaf5a4b4f0353cf4fe456f083add08bf4f9df0aec6353bedcf80")
  (:PATH "processes/supplement-preparation/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000917285-command-62231-0/report.lisp")
   :BYTES 176213 :SHA256
   "014447b121f2998953c880399b4f72421d834e9adc1a42ea7994e0d9905dbda4")
  (:PATH "processes/supplement-preflight/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000917301-command-62700-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "4299f591a6cae190e73678e48190d41b2142dc0cd7ff42f8ca5e41e456634351")
  (:PATH "processes/supplement-preflight/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000917301-command-62700-0/report.lisp")
   :BYTES 172312 :SHA256
   "81f18273321d3b51ce53cc128c44c717812158e8d9635ad000033a3974ed8b85")
  (:PATH "processes/supplement-collection/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000917316-command-62904-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "916d1d702a7fcd045486165058fe9be874aa1e4faddd58b8af00d513a539432a")
  (:PATH "processes/supplement-collection/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000917316-command-62904-0/report.lisp")
   :BYTES 171161 :SHA256
   "0004e58f58f776a3f63938dd6475ca1fcc13f6665eb01aada8d1d8d7762e415a")
  (:PATH "processes/supplement-data-reading/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000917379-command-63901-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "caf7cf76e4e611fdf74819762c5ce29ffd89a33c769537372672d23a8b5c1a18")
  (:PATH "processes/supplement-data-reading/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-float-write/ArcDocDB/spikes/out/4000917379-command-63901-0/report.lisp")
   :BYTES 237115 :SHA256
   "73e3863d470b5e8c660a247d802207af99900055638dfb5d82d7be626c186e2b"))
 :LIMITS
 (:SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :FASL-EXCLUDED-FROM-PUBLISHED-MUTATION-TREES
  :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
