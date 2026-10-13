(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "core-wrapper" :RECORD-PATH "raw/core-wrapper/report.lisp" :COMMAND
   (#A((3) BASE-CHAR . "env")
    #A((274) BASE-CHAR
       . "ASDF_OUTPUT_TRANSLATIONS=(:output-translations (#P\"/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/**/*.*\" #P\"/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/**/*.*\") :ignore-inherited-configuration)")
    #A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "check"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "core-native" :RECORD-PATH "raw/core-native/report.lisp" :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "coverage-active-command" :RECORD-PATH
   "raw/coverage-active-command/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((32) BASE-CHAR . "tools/get-resolver-coverage.lisp")
    #A((8) BASE-CHAR . "--report")
    #A((34) BASE-CHAR . "spikes/out/get-active-coverage-R2/")
    #A((7) BASE-CHAR . "--suite") #A((6) BASE-CHAR . "active"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "coverage-closed-command" :RECORD-PATH
   "raw/coverage-closed-command/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((32) BASE-CHAR . "tools/get-resolver-coverage.lisp")
    #A((8) BASE-CHAR . "--report")
    #A((41) BASE-CHAR . "spikes/out/get-resolver-active-compat-R2/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "usage-duplicate-suite" :RECORD-PATH
   "raw/usage-duplicate-suite/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((32) BASE-CHAR . "tools/get-resolver-coverage.lisp")
    #A((7) BASE-CHAR . "--suite") #A((6) BASE-CHAR . "active")
    #A((7) BASE-CHAR . "--suite") #A((6) BASE-CHAR . "active"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "README.md" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-publication/README-template.txt")
   :BYTES 1562 :SHA256
   "032cc83291c29f536667de8791f608e8929bed74d1939d37d7e6154dc1b2e69e")
  (:PATH "collection-manifest.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-publication/final-manifest.lisp")
   :BYTES 1958 :SHA256
   "2eff5b63bf8d476f75f974a04dc8940c768a1a5f8ce407bf9afed7d5aad2cd86")
  (:PATH "collection-source.txt" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-publication/collect.lisp")
   :BYTES 16793 :SHA256
   "64724e5e99686930aeac8b39664274f6e665b4acb56ea87a7d4e62f1fa0ee79d")
  (:PATH "final-manifest.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-publication/final-manifest.lisp")
   :BYTES 1958 :SHA256
   "2eff5b63bf8d476f75f974a04dc8940c768a1a5f8ce407bf9afed7d5aad2cd86")
  (:PATH "publication-audit-contract.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-publication-audit/contract.lisp")
   :BYTES 1531 :SHA256
   "dfbea6978e0c4228b0277e37116d6cdf58529892946d423004ff0b35f367e25f")
  (:PATH "publication-audit-source.txt" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-publication-audit/audit.lisp")
   :BYTES 20060 :SHA256
   "b4c7af36c501647ecdca81b0a9ac314ed76d8c8bd6f8f5d50a5d1c6c411a46d9")
  (:PATH "raw/SPK-01/check-lettura-buffer.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-01-primary-index/out/check-lettura-buffer.fasl")
   :BYTES 112355 :SHA256
   "fff6858b4aac87181f50c035c07fe13facd1a81a0154b35b1b4490cef9afbcb3")
  (:PATH "raw/SPK-01/core.fasl" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-01-primary-index/out/core.fasl")
   :BYTES 158716 :SHA256
   "515fe12c7c4556fb5ce201f5d3b52f6c4d81f5b076cbf2b4320a93f9f7d4824d")
  (:PATH "raw/SPK-01/lettura-buffer.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-01-primary-index/out/lettura-buffer.fasl")
   :BYTES 8171 :SHA256
   "13d50d71c9d5cc3d2b105ccb62dc44000c3b620aff796a97a05f59f027dd7dda")
  (:PATH "raw/SPK-02/core.fasl" :SOURCE
   #A((100) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-02-gc/out/core.fasl")
   :BYTES 110738 :SHA256
   "1e88e71c7fc50220bd4ec49df163dd338889282f544b2111c10c8f1c0c88431e")
  (:PATH "raw/SPK-03/core.fasl" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-03-group-commit/out/core.fasl")
   :BYTES 102608 :SHA256
   "766e2c59841dd751e1485eaf260193191bc1058ea0f63222afadc956964363ad")
  (:PATH "raw/SPK-04/50265/core.fasl" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-04-writer-pool/out/50265/core.fasl")
   :BYTES 7320 :SHA256
   "918a3ccb60bcc7bb2465dfbc6b28b636b1363f026a111934af27fc2ab193f4bb")
  (:PATH "raw/SPK-04/50265/parcheggi.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-04-writer-pool/out/50265/parcheggi.fasl")
   :BYTES 86738 :SHA256
   "907b54949d049ed081f257e0c4b9913e0d71f6f1b2fe539f80375dd80fe87352")
  (:PATH "raw/SPK-04/50265/pool.fasl" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-04-writer-pool/out/50265/pool.fasl")
   :BYTES 96538 :SHA256
   "1d311ad34f05c5b930d85f8050a0f4576dc9391b7a56d643628662147e6fefe4")
  (:PATH "raw/SPK-05/50281/core.fasl" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-05-segment-read/out/50281/core.fasl")
   :BYTES 67989 :SHA256
   "a24c56de34631f738398a47e2bdcbe9198ac6b4e1c990250849a4ee3d2ecaebd")
  (:PATH "raw/SPK-05/50281/io.fasl" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-05-segment-read/out/50281/io.fasl")
   :BYTES 62191 :SHA256
   "0fcdb140092d1ba4afcd51f140b9e2d68f6a06e59f59bbefee89fc7d39ff60f6")
  (:PATH "raw/SPK-05/50281/record.fasl" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-05-segment-read/out/50281/record.fasl")
   :BYTES 24818 :SHA256
   "1fb1abd8da751133c25b24a920d0e72365a0efa49763b2f7eaeb5ff286c9fc40")
  (:PATH "raw/SPK-06/50302/controllore.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-06-compaction-load/out/50302/controllore.fasl")
   :BYTES 66803 :SHA256
   "79839333d7557d6c38dcd18c043e0ad85615f52add37bc9dffbf99b2fd19166c")
  (:PATH "raw/SPK-06/50302/core.fasl" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-06-compaction-load/out/50302/core.fasl")
   :BYTES 3295 :SHA256
   "a001c1c18965e5965224705c41357205e468ababbb8acbbf340729bde43912c0")
  (:PATH "raw/SPK-06/50302/interferenza.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-06-compaction-load/out/50302/interferenza.fasl")
   :BYTES 102510 :SHA256
   "21aed47ec421a91205d2a362a0866fa63f668974ca41d20c70702428ed14da93")
  (:PATH "raw/SPK-06/50302/spk05-io.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-06-compaction-load/out/50302/spk05-io.fasl")
   :BYTES 62349 :SHA256
   "dd72d1fc516938eab45b65171e3c29fed4b6975ed89ec75d4960e496d0d422ec")
  (:PATH "raw/SPK-06/50302/spk05-record.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-06-compaction-load/out/50302/spk05-record.fasl")
   :BYTES 24871 :SHA256
   "f25416b6e6b36ae4998d5163d1f11bf4bdb9abe150ad06d9f7d001c53e34d766")
  (:PATH "raw/SPK-07/suite-4000912469-50336/byte-crash.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000912469-50336/byte-crash.fasl")
   :BYTES 114106 :SHA256
   "78072c705d3b15c422601076418e0391d518b278f515ac2f4c5dc44f7d9b3ade")
  (:PATH "raw/SPK-07/suite-4000912469-50336/compaction.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000912469-50336/compaction.fasl")
   :BYTES 86780 :SHA256
   "8319f7a5ce9a7e71a889a70fbe15ab08a1fb4d0180c70f99d29444bb8cc53a8c")
  (:PATH "raw/SPK-07/suite-4000912469-50336/core.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000912469-50336/core.fasl")
   :BYTES 64577 :SHA256
   "d2a998e6ea24b5ff51e1066e9348c06626380d305ac76eea09fc34c52923eb8a")
  (:PATH "raw/SPK-07/suite-4000912469-50336/foundation-batch.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000912469-50336/foundation-batch.fasl")
   :BYTES 9729 :SHA256
   "b4439c642bdf2e078030f725c1243ac04ba3c5dee6a299e5667bd17040f3597f")
  (:PATH "raw/SPK-07/suite-4000912469-50336/foundation-binary.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000912469-50336/foundation-binary.fasl")
   :BYTES 9135 :SHA256
   "c6f6f6f86f83ec233d2e3f5846a32f37c8e45b0d9b1862a94ec3abce0f241940")
  (:PATH "raw/SPK-07/suite-4000912469-50336/foundation-conditions.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000912469-50336/foundation-conditions.fasl")
   :BYTES 6431 :SHA256
   "3619beb80ebc0bb7f1cbeb4128a85f67afc4bac8552d8c8b5a75af6e88d4928f")
  (:PATH "raw/SPK-07/suite-4000912469-50336/foundation-crc32c.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000912469-50336/foundation-crc32c.fasl")
   :BYTES 4311 :SHA256
   "65093a89098415f3777b5584fee7eb0d134cbc6400a47fae5de999f13f44d716")
  (:PATH "raw/SPK-07/suite-4000912469-50336/foundation-package.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000912469-50336/foundation-package.fasl")
   :BYTES 2142 :SHA256
   "3cefd7f38af0a586da968b065814f9b7700f81c02172a48549f424cc6634ec29")
  (:PATH "raw/SPK-07/suite-4000912469-50336/foundation-record.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000912469-50336/foundation-record.fasl")
   :BYTES 36515 :SHA256
   "8a8b211c325a55b448fb989f152a4882bb6ed44ee1d0fe76e13765531228768f")
  (:PATH "raw/SPK-07/suite-4000912469-50336/memoria.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000912469-50336/memoria.fasl")
   :BYTES 17417 :SHA256
   "94f2ad205b039039123b4ead07886cb7f38418aa388bdc357865b15a8f68fde0")
  (:PATH "raw/SPK-07/suite-4000912469-50336/pubblicazione.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000912469-50336/pubblicazione.fasl")
   :BYTES 86635 :SHA256
   "f2b0e5ad703e7d632a97fe81d4a2dd1a9f1926324b800a4348f4eb57b077b516")
  (:PATH "raw/SPK-07/suite-4000912469-50336/root-package.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000912469-50336/root-package.fasl")
   :BYTES 1466 :SHA256
   "540e347e19ee8ea49c9a1ce66b9fe498e3091a0ba7198cd791e500581e366e32")
  (:PATH "raw/SPK-07/suite-4000912469-50336/scadenza.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000912469-50336/scadenza.fasl")
   :BYTES 85846 :SHA256
   "81a33fbc65431a1e9f0a946663b9f41f52505566b757d6b4916c1f97f88e2a8a")
  (:PATH "raw/SPK-07/suite-4000912469-50336/seqlock-readers.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000912469-50336/seqlock-readers.fasl")
   :BYTES 79347 :SHA256
   "6b51494eadd2d6973ba469e556c420a9ed3661792f35566c3d7f1e2bf668f318")
  (:PATH "raw/SPK-07/suite-4000912469-50336/suite.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000912469-50336/suite.fasl")
   :BYTES 3874 :SHA256
   "f9026e11753d4bedb22d9f363f07efae8fbdf8bd053c0ee9f21b92ecfb9f927c")
  (:PATH "raw/SPK-08/process-4000912480-50390/bitmap.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-08-generated-code/out/process-4000912480-50390/bitmap.fasl")
   :BYTES 23570 :SHA256
   "2187259f5aaba37a771db0227f60612be675d3ca1f8e631d94c8bfec13e0e649")
  (:PATH "raw/SPK-08/process-4000912480-50390/core-bitmap.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-08-generated-code/out/process-4000912480-50390/core-bitmap.fasl")
   :BYTES 13290 :SHA256
   "0dac942d9e10e9162abb98378df2282ea1429b8864c77e23021b05825d8f692b")
  (:PATH "raw/SPK-08/process-4000912480-50390/impronte.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-08-generated-code/out/process-4000912480-50390/impronte.fasl")
   :BYTES 68385 :SHA256
   "ea513182e16315790a188cd84b1aced7f02198a207baff08e42448bd842c7b8f")
  (:PATH "raw/SPK-08/process-4000912480-50390/simd.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-08-generated-code/out/process-4000912480-50390/simd.fasl")
   :BYTES 20614 :SHA256
   "f3df3a5b96796bac4d326a1bfb2ac4c0f12de1ec9d1aafe74b3af1021046258d")
  (:PATH "raw/SPK-09/core.fasl" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-09-integrity/out/core.fasl")
   :BYTES 115021 :SHA256
   "6d32ee1398fdc3af6b18bb402d374402f441e9df2fcaf3f1be260319b575111e")
  (:PATH "raw/SPK-10/cbor.fasl" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-10-v2-limits/out/cbor.fasl")
   :BYTES 83953 :SHA256
   "a5e427504ac4564c566cc514853bf51c9c7220892f7854e09493b051e7e022ab")
  (:PATH "raw/SPK-10/codec.fasl" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-10-v2-limits/out/codec.fasl")
   :BYTES 81672 :SHA256
   "bbcd766e49eb2d0f8bb4fb3021a0a876f32c321b6cd5b91345d20697933592bc")
  (:PATH "raw/SPK-10/core.fasl" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-10-v2-limits/out/core.fasl")
   :BYTES 15830 :SHA256
   "4b15514e9e17a2c52751ef658a0ce58991478b59743b81a6cc69b0322269c9f7")
  (:PATH "raw/SPK-10/crc.fasl" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-10-v2-limits/out/crc.fasl")
   :BYTES 115061 :SHA256
   "4f1ee387ac06fbfea916efd5d97d2cf88caed0d99f5ffa907582dea8ddd9b5fb")
  (:PATH "raw/SPK-10/indice.fasl" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-10-v2-limits/out/indice.fasl")
   :BYTES 154891 :SHA256
   "1091e3e3d967cd6c6b0047f6a9934550fd36bcf7b8aad0596ebdc6a11453e021")
  (:PATH "raw/SPK-10/migrazione.fasl" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/SPK-10-v2-limits/out/migrazione.fasl")
   :BYTES 81705 :SHA256
   "7db69f53034976fceb295aa6e99a777165e53e763beb2fe9e55e4d4a3038fdac")
  (:PATH "raw/active-integration-audit/audit-at-R1.lisp.txt" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-integration-audit/audit-at-R1.lisp.txt")
   :BYTES 37560 :SHA256
   "ce7877778ada522c45a3136b6f74997574e41d154004bfb0f8aaf4fd24621163")
  (:PATH "raw/active-integration-audit/audit.lisp" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-integration-audit/audit.lisp")
   :BYTES 37560 :SHA256
   "ce7877778ada522c45a3136b6f74997574e41d154004bfb0f8aaf4fd24621163")
  (:PATH "raw/active-integration-audit/fixture-audit-at-R1.lisp.txt" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-integration-audit/fixture-audit-at-R1.lisp.txt")
   :BYTES 9295 :SHA256
   "c4ff67bf90b22f9aaef113dac4339afc7aa5d61ac25da5f07adc40fea648cdc5")
  (:PATH "raw/active-integration-audit/fixture-audit.lisp" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-integration-audit/fixture-audit.lisp")
   :BYTES 9295 :SHA256
   "c4ff67bf90b22f9aaef113dac4339afc7aa5d61ac25da5f07adc40fea648cdc5")
  (:PATH "raw/active-integration-audit/fixtures-audit-R1.lisp" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-integration-audit/fixtures-audit-R1.lisp")
   :BYTES 6902 :SHA256
   "d6b48822737ced4e5aaf02f67147fa06b081eb000ddca8df053e82b954b5496c")
  (:PATH "raw/active-integration-audit/fixtures-audit-R1.stderr" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-integration-audit/fixtures-audit-R1.stderr")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/active-integration-audit/full-audit-R1.lisp" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-integration-audit/full-audit-R1.lisp")
   :BYTES 100192 :SHA256
   "e563fa897f60ea3ddcae47dc2b5251b21ea74d2b69683b1c66cc3e6da65aed72")
  (:PATH "raw/active-integration-audit/full-audit-R1.stderr" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-integration-audit/full-audit-R1.stderr")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/core-compiler-fasl/src/cache/build.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/cache/build.fasl")
   :BYTES 8847 :SHA256
   "dd804c53481343511ca54bece557fbaf2b696607433feb13dacb416eafb17d41")
  (:PATH "raw/core-compiler-fasl/src/cache/clock.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/cache/clock.fasl")
   :BYTES 4888 :SHA256
   "f99c4b075c88864fafa28ef3a1dd31441c0fe10f42f3ab4064c6c83d3881f50b")
  (:PATH "raw/core-compiler-fasl/src/cache/core.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/cache/core.fasl")
   :BYTES 7263 :SHA256
   "453e260b10a6bff304a1b3fbf745e823f83946f35e474306e8a43743d18425bb")
  (:PATH "raw/core-compiler-fasl/src/cache/package.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/cache/package.fasl")
   :BYTES 1170 :SHA256
   "a8cb039559f137baf5027b6f9cb2fb882d08c8cfcf0bcce99c3cec790a0677c5")
  (:PATH "raw/core-compiler-fasl/src/cache/read.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/cache/read.fasl")
   :BYTES 11961 :SHA256
   "7d59653886d24165b755508718595d7f8372139045786172495e79ccf4acbaec")
  (:PATH "raw/core-compiler-fasl/src/cache/types.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/cache/types.fasl")
   :BYTES 17988 :SHA256
   "fb5f34738cc2a2cc6daa37d09c9d94603bc7c532bcc361f002349a1051cb58d3")
  (:PATH "raw/core-compiler-fasl/src/cache/write.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/cache/write.fasl")
   :BYTES 9827 :SHA256
   "523b67fd1daed1589ce26a787c31326694614eb2e0907e33163f139409d1728a")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-float-minimal.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/codec/cbor-float-minimal.fasl")
   :BYTES 4230 :SHA256
   "3978b60d6dbc814fccbd7839a16ff889bfb38d46a16d97df16f9021ed86d4389")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-float-narrow.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/codec/cbor-float-narrow.fasl")
   :BYTES 5048 :SHA256
   "1d64aaac23652cbf4e2cf788dae6736432b4b005ff877ed63da691523641c41e")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-float-write.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/codec/cbor-float-write.fasl")
   :BYTES 6798 :SHA256
   "b76d51d572acb907865a7cce47f919bfce1ca28699bb21d2ad6270b12c888bac")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-header.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/codec/cbor-header.fasl")
   :BYTES 7380 :SHA256
   "1b64d7f5fcc9fe0b0c73d9c3e5e33d6847a8f515eb6d07780c8c22468bc2208e")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-minimal.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/codec/cbor-minimal.fasl")
   :BYTES 5468 :SHA256
   "49c779f5cec82e0286211c37ee0932f21eb124d503bed8fcc02aa79b20de63cd")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-package.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/codec/cbor-package.fasl")
   :BYTES 1171 :SHA256
   "c0318632c231b0291d49d90ca445f85b4fe556795cafbedf3e8cd5a313e0b82e")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-scan-input.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/codec/cbor-scan-input.fasl")
   :BYTES 3453 :SHA256
   "e71a55aa6a08c97883b2fb921415dfb8c43ff3205ce3057d16cee4e4f8e0408b")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-scan-items.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/codec/cbor-scan-items.fasl")
   :BYTES 10659 :SHA256
   "c0abef1ce74617fd6d6aeeb58fc44ed0b8bbcf919282f317c0ed72e8d90b1fcc")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-scan-minimal.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/codec/cbor-scan-minimal.fasl")
   :BYTES 2929 :SHA256
   "eedf9ea63fa382b06c541825484d34fa653d905a77ee540c69ad96a3db5dfc70")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-scan-stack.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/codec/cbor-scan-stack.fasl")
   :BYTES 8018 :SHA256
   "5e39f2f1dd930d7d046be02d9fa0e51bd5f4179b0202053362e82487cda29e4f")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-scan.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/codec/cbor-scan.fasl")
   :BYTES 8479 :SHA256
   "fdfe66c4d126a6a034038878686f16d084134c683d97b1baec7b768d5de16a3b")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-simple-write.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/codec/cbor-simple-write.fasl")
   :BYTES 3944 :SHA256
   "2cceeda75bfa15051c2ce51007c0e91390082d209abf270d2ea78dc3af4e6361")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-space.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/codec/cbor-space.fasl")
   :BYTES 11633 :SHA256
   "67ba712e25ddac0b62d7ea5a16b8428df0c2f6e32b3142cca2b73c683ea82375")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-string-write.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/codec/cbor-string-write.fasl")
   :BYTES 9758 :SHA256
   "24633b93037f0e0610dc23a931a4d5b35d4a65cf2581a7824285faf82debcb45")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-write.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/codec/cbor-write.fasl")
   :BYTES 6923 :SHA256
   "e7b78d0d8e54e9f8fff318ce2aaac7ada15a1d97e9b31e6e27f242bea6a4db65")
  (:PATH "raw/core-compiler-fasl/src/codec/package.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/codec/package.fasl")
   :BYTES 939 :SHA256
   "ed583bd7377730922972128dc6d344713d8543ef58589ef6ee9a9a844b2a61e7")
  (:PATH "raw/core-compiler-fasl/src/codec/utf8.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/codec/utf8.fasl")
   :BYTES 8336 :SHA256
   "dd7d04dfb89f368dcfa35008b86201c367ceddf4d85eb8dccbabcfeeea234286")
  (:PATH "raw/core-compiler-fasl/src/csn/package.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/csn/package.fasl")
   :BYTES 972 :SHA256
   "d1a5961164fee60de7f026e079c1939e2c62f0b9e53fbaf9e29040907d948166")
  (:PATH "raw/core-compiler-fasl/src/csn/registry.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/csn/registry.fasl")
   :BYTES 29099 :SHA256
   "e8c60196b84ec30884d0947bb07cfd7dcd72d81ed6e1cf22f427f25deaad34b6")
  (:PATH "raw/core-compiler-fasl/src/epochs/core.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/epochs/core.fasl")
   :BYTES 9454 :SHA256
   "9376d3d1aa522946884ed2f47489f2c4334fbd9f612399041970c4ac2d669424")
  (:PATH "raw/core-compiler-fasl/src/epochs/package.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/epochs/package.fasl")
   :BYTES 1197 :SHA256
   "8c9951054f2bd053b0836e6836d096e7bd0a8bfedcfcee5c9aaec1ce3be651f5")
  (:PATH "raw/core-compiler-fasl/src/epochs/read.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/epochs/read.fasl")
   :BYTES 5293 :SHA256
   "0d1ce580880bfb9e311c231c7fd099a180a770fd17b1efcbd147ded45037938b")
  (:PATH "raw/core-compiler-fasl/src/epochs/reclaim.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/epochs/reclaim.fasl")
   :BYTES 10803 :SHA256
   "ea365154eca23dceb44885e62a6e0ce3e136a79f03fa0d301c9ef3852e6518ad")
  (:PATH "raw/core-compiler-fasl/src/epochs/retire.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/epochs/retire.fasl")
   :BYTES 9412 :SHA256
   "18d9a422fa086465095fbbd957de7b0332fc516bec40fd8329d8878b31a6c0a8")
  (:PATH "raw/core-compiler-fasl/src/epochs/types.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/epochs/types.fasl")
   :BYTES 24018 :SHA256
   "41336d2512c61e26415c46f457359e4f94cbeacf941061318596d22f75d9061f")
  (:PATH "raw/core-compiler-fasl/src/execution/handoff.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/execution/handoff.fasl")
   :BYTES 15927 :SHA256
   "f3c9270a831730238a2c9f1d1b080015c9947234df882b4cef4d12fdd5e53308")
  (:PATH "raw/core-compiler-fasl/src/execution/package.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/execution/package.fasl")
   :BYTES 1608 :SHA256
   "1ef08c22d0010c35405204db151dfaae34dffc5e1a61e6351c82f566ce2326ee")
  (:PATH "raw/core-compiler-fasl/src/execution/queue.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/execution/queue.fasl")
   :BYTES 17782 :SHA256
   "d48990e941a70ef4d585afebdb38e7655258de541b4176f7dac0b0626baa1a96")
  (:PATH "raw/core-compiler-fasl/src/execution/ready-recycle.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/execution/ready-recycle.fasl")
   :BYTES 5167 :SHA256
   "1fb928294b9dca96153b2fded170f393694742366e48e8ccbf7cf33aa9cc9cd1")
  (:PATH "raw/core-compiler-fasl/src/execution/ready-types.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/execution/ready-types.fasl")
   :BYTES 14959 :SHA256
   "94b6f49106257aae56edd569458dbf7f14153d209daa7f18652ae951e5f989b2")
  (:PATH "raw/core-compiler-fasl/src/execution/ready.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/execution/ready.fasl")
   :BYTES 9705 :SHA256
   "b9978832eaeb7e3506194d6431260aa6b652318a81453b5c75e1014104893dee")
  (:PATH "raw/core-compiler-fasl/src/execution/worker-boundary.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/execution/worker-boundary.fasl")
   :BYTES 6423 :SHA256
   "fe595a76df69a6a6bf8d95c5b8359a22198b1a5a93509af8049038664f8287d7")
  (:PATH "raw/core-compiler-fasl/src/execution/worker-claim.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/execution/worker-claim.fasl")
   :BYTES 12433 :SHA256
   "c6545c36c27245be7084521ee07e643b8957b85823911483213a0b7d07db38d8")
  (:PATH "raw/core-compiler-fasl/src/execution/worker-run.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/execution/worker-run.fasl")
   :BYTES 9027 :SHA256
   "4a1bbe27d0945d407098120d7224d31bcff1971164580f7f5653ebee4de688dc")
  (:PATH "raw/core-compiler-fasl/src/execution/worker-types.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/execution/worker-types.fasl")
   :BYTES 22083 :SHA256
   "2299f83a5cf2aacc41b5622ded694248dd85fdbe41ab5451081ebed749983182")
  (:PATH "raw/core-compiler-fasl/src/execution/writer.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/execution/writer.fasl")
   :BYTES 8970 :SHA256
   "d03891b7fec8a3d21c644e061a94ccacec2ec9650c67a892b06799ffa2d159d5")
  (:PATH "raw/core-compiler-fasl/src/foundation/batch.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/foundation/batch.fasl")
   :BYTES 9669 :SHA256
   "49a30e3797e6c526f992fb99dab75e0f234c94dc8e0b28fe34e9971b98375cc9")
  (:PATH "raw/core-compiler-fasl/src/foundation/binary.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/foundation/binary.fasl")
   :BYTES 9075 :SHA256
   "de29030a4cfdb2dbced3a20de49f2f005512dd819af9a5a8d7c2a0ca82175b8c")
  (:PATH "raw/core-compiler-fasl/src/foundation/conditions.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/foundation/conditions.fasl")
   :BYTES 6269 :SHA256
   "6669fdc31e487250fa29820032f5f33e90e2e5cb96638ff04f1f74cac112ab6b")
  (:PATH "raw/core-compiler-fasl/src/foundation/crc32c.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/foundation/crc32c.fasl")
   :BYTES 4251 :SHA256
   "75af0d0511ffe087d7aafd20d8701512891c994476ead6e8e7da6edc1b09788a")
  (:PATH "raw/core-compiler-fasl/src/foundation/package.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/foundation/package.fasl")
   :BYTES 2082 :SHA256
   "b89446735433024a0f5c3a407295eb0b415646141c03871aa8fc87175d75888b")
  (:PATH "raw/core-compiler-fasl/src/foundation/record.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/foundation/record.fasl")
   :BYTES 36358 :SHA256
   "2b6c8644e8d1dad82d323c7984fc23f29dd2aa1ab010230e967247b6d0e33257")
  (:PATH "raw/core-compiler-fasl/src/get-directory/build.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/get-directory/build.fasl")
   :BYTES 6184 :SHA256
   "4d2dae05295440df761e8cfb40a7dea5e366298460a5a3915cd0d0f9480055c3")
  (:PATH "raw/core-compiler-fasl/src/get-directory/package.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/get-directory/package.fasl")
   :BYTES 2105 :SHA256
   "841be9b03989e7dd76aa87d3bc36e8198290466c2f5f73a43295796faeea76d0")
  (:PATH "raw/core-compiler-fasl/src/get-directory/read.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/get-directory/read.fasl")
   :BYTES 7280 :SHA256
   "6a2a85f0ddac347f916231364c092d4debb707ef4b9698053f9aef8195e2b4e8")
  (:PATH "raw/core-compiler-fasl/src/get-directory/sources-read.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/get-directory/sources-read.fasl")
   :BYTES 8231 :SHA256
   "483347c80281dd34b227d00562c032bc0af25370efc586851a292c8de976aafd")
  (:PATH "raw/core-compiler-fasl/src/get-directory/sources-types.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/get-directory/sources-types.fasl")
   :BYTES 10584 :SHA256
   "9b0cd078fa72d53238543d95a1c730f4b64196bc2c75474b0e97728321d698bb")
  (:PATH "raw/core-compiler-fasl/src/get-directory/types.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/get-directory/types.fasl")
   :BYTES 7017 :SHA256
   "c898a8b87a90a3c92365ec04533eb3ea5ff04fbbacd4c7f896008c83a1f1902e")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/active-build.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/get-resolver/active-build.fasl")
   :BYTES 13953 :SHA256
   "6d1e162561aab3e059d08c96e30edfd739b332d0848fbdc3a0d989b40e5bc13e")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/active-directory.fasl"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/get-resolver/active-directory.fasl")
   :BYTES 6965 :SHA256
   "556966434f777fa0b9c7e48e5a98d088c0eb964d51bbbab8cde137333fc0f907")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/active-preflight.fasl"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/get-resolver/active-preflight.fasl")
   :BYTES 9005 :SHA256
   "d516b2d641484113c5b65154318d6697cd4dffd91f2f3c296da0811b6786c2fe")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/active-read.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/get-resolver/active-read.fasl")
   :BYTES 6875 :SHA256
   "1b9a70e76838adb43964d90a8f390132abf92b34f24fc4b8345466efea1a8bf0")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/active-scan.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/get-resolver/active-scan.fasl")
   :BYTES 8219 :SHA256
   "2d9e41aec221199e719b5c6885e3cf5325bf7dbcf5914b8404ac1c99304bc158")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/active-types.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/get-resolver/active-types.fasl")
   :BYTES 17192 :SHA256
   "40fc00a56ec1d22017a915018e99f6965c503032dd9f3205cc40756f5482d304")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/build.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/get-resolver/build.fasl")
   :BYTES 10748 :SHA256
   "15b88ab4b26aba0cd7bede80f835da7279e47c11a21ccc99fe5baa0058b37664")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/package.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/get-resolver/package.fasl")
   :BYTES 2606 :SHA256
   "64d6e9ed50ca92ac8c4683881dae5c6087fb86f1092bb405aabd0c704a469e0b")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/read.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/get-resolver/read.fasl")
   :BYTES 10511 :SHA256
   "00e8f8e02c17548f8ea03b153137ad73ccb6b4c1a105d2805afdf004578be6dd")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/rows.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/get-resolver/rows.fasl")
   :BYTES 5858 :SHA256
   "7874b15974c4e45a25c8423c62637ea4679bfb33fbc7263df24a9c2d16e395fc")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/scan.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/get-resolver/scan.fasl")
   :BYTES 10736 :SHA256
   "e3d76ed71af23dc75a40e30e447a567a5a53755b3cfd79fde31615ed668c4aff")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/sort.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/get-resolver/sort.fasl")
   :BYTES 9383 :SHA256
   "35107269b2d1e4157f4b520a8544c78d3bf32d1095210c79c4d4892d4a6d48f9")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/types.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/get-resolver/types.fasl")
   :BYTES 7430 :SHA256
   "8741b45197c1af099faa27d471727d9ed409bec5fae3b86dc728793bf8df337d")
  (:PATH "raw/core-compiler-fasl/src/get/build.fasl" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/get/build.fasl")
   :BYTES 6738 :SHA256
   "5b0220c00bfcddbda12ff71e5ddaf0adb502f9dc44ae1989e83bfe36cfe48739")
  (:PATH "raw/core-compiler-fasl/src/get/lifecycle.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/get/lifecycle.fasl")
   :BYTES 8679 :SHA256
   "00849706a5c97ebd1b5b765ed6992f69c371ada8a5fb80828900dbf9241f672a")
  (:PATH "raw/core-compiler-fasl/src/get/lookup.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/get/lookup.fasl")
   :BYTES 11199 :SHA256
   "ba9a026b3177d678d22b0ed2371937c7856ec196110777b2237bbb424375f7cf")
  (:PATH "raw/core-compiler-fasl/src/get/package.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/get/package.fasl")
   :BYTES 2162 :SHA256
   "97ee9273c170b837f7c77126fdbdee7b618d3f3cde5abe7d667e4af7d78ba81a")
  (:PATH "raw/core-compiler-fasl/src/get/segment.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/get/segment.fasl")
   :BYTES 10559 :SHA256
   "14ddf4cf47949eec4b755ded90f4d9711d7d1eedcfb6f4bc8c624580aaae8a34")
  (:PATH "raw/core-compiler-fasl/src/get/target.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/get/target.fasl")
   :BYTES 7804 :SHA256
   "a044dba01f3b170a9356dcb453cae6f204a64ecaecc35b47b5c0ada51eb57aff")
  (:PATH "raw/core-compiler-fasl/src/get/types.fasl" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/get/types.fasl")
   :BYTES 30912 :SHA256
   "9c9c390b3dc3acdc9a7aaf7dd34a3f0c828c8bfb08509c6166f2daeed5b80f87")
  (:PATH "raw/core-compiler-fasl/src/hash/arithmetic.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/hash/arithmetic.fasl")
   :BYTES 7680 :SHA256
   "502452776e2f86b6834245fc151154a564627647859267358c7cebd7347848c9")
  (:PATH "raw/core-compiler-fasl/src/hash/blocks.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/hash/blocks.fasl")
   :BYTES 8291 :SHA256
   "92d5607c011ffcb428344250412bfea03cd85a2556431552de0acaa3518b5a17")
  (:PATH "raw/core-compiler-fasl/src/hash/hash64.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/hash/hash64.fasl")
   :BYTES 6640 :SHA256
   "8b469d273a8e2919cb581e73ac1faea288c9607e0c00866002db6f08cc7a370b")
  (:PATH "raw/core-compiler-fasl/src/hash/package.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/hash/package.fasl")
   :BYTES 947 :SHA256
   "9f170cf9c364a3aae1601bb667229cf1348a04f2be3823565d24412055b4f677")
  (:PATH "raw/core-compiler-fasl/src/index/core.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/index/core.fasl")
   :BYTES 6183 :SHA256
   "3d1ee1cb267c0a9cd456428764a0089d7b7c5bbba2f316ea0d68fa3b1793dcdb")
  (:PATH "raw/core-compiler-fasl/src/index/hash-digests.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/index/hash-digests.fasl")
   :BYTES 6100 :SHA256
   "f5be3d9fb06d841553a6b4a44d7d2f66d10d65ede42c911b8be4cc6211146071")
  (:PATH "raw/core-compiler-fasl/src/index/hash-seed.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/index/hash-seed.fasl")
   :BYTES 5132 :SHA256
   "cfd8d216641f5fde7e32ba8a163506c7f8c6f8171b7d926eb765f18e9b24e624")
  (:PATH "raw/core-compiler-fasl/src/index/package.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/index/package.fasl")
   :BYTES 1142 :SHA256
   "f1adb1ec7bc9bb761aba999b4b3ed979f090e91aad6b6ccff357fa69c8ee7960")
  (:PATH "raw/core-compiler-fasl/src/index/primary-arena.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/index/primary-arena.fasl")
   :BYTES 6822 :SHA256
   "207bb02131abdd004484026899fc3d7406a28c3f987479b898dbd5408bc1f64b")
  (:PATH "raw/core-compiler-fasl/src/index/primary-build.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/index/primary-build.fasl")
   :BYTES 10595 :SHA256
   "b622f0d6a42b9ec30f902446204e7a7e7a110f219a96c96528382aed9bdf9442")
  (:PATH "raw/core-compiler-fasl/src/index/primary-core.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/index/primary-core.fasl")
   :BYTES 8748 :SHA256
   "f9c4756cb1b0c9c87df6fdeb1822120fe67441e4a599c6881ad7b1f38622b1f3")
  (:PATH "raw/core-compiler-fasl/src/index/primary-directory.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/index/primary-directory.fasl")
   :BYTES 14232 :SHA256
   "f47659f75842bde0e09ec63ef712b7b08dccf475f471d34db2ee3e13fdd91e31")
  (:PATH "raw/core-compiler-fasl/src/index/primary-package.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/index/primary-package.fasl")
   :BYTES 1717 :SHA256
   "9520594a12c1d67c890f36ab0750744079a415499566fc9d103ce1526b2df600")
  (:PATH "raw/core-compiler-fasl/src/index/primary-probe.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/index/primary-probe.fasl")
   :BYTES 13338 :SHA256
   "3d59439e1b3511a532bff5c536cd9d6bd389ba90257e14388176c8c2bf0b3a91")
  (:PATH "raw/core-compiler-fasl/src/index/primary-read.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/index/primary-read.fasl")
   :BYTES 7541 :SHA256
   "c334952186e242fe9c0f3567c0b9cc7ff9ec388e01df9372939ed3d078a81902")
  (:PATH "raw/core-compiler-fasl/src/index/primary-relocate.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/index/primary-relocate.fasl")
   :BYTES 9169 :SHA256
   "62a317f1e2013c8d5a1cd942f4408002bb1e00ff818247dfb89e75158fb316c9")
  (:PATH "raw/core-compiler-fasl/src/index/primary-types.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/index/primary-types.fasl")
   :BYTES 36216 :SHA256
   "eda7f89a7cd617abe8576cdef6787bd6a9a76260491a88d32c632fafbee1b156")
  (:PATH "raw/core-compiler-fasl/src/index/primary-write.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/index/primary-write.fasl")
   :BYTES 15731 :SHA256
   "c59151c1f76e2664f2cb19bf7a1c5999915bbd00be6ead7869047043b0b7c748")
  (:PATH "raw/core-compiler-fasl/src/index/read.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/index/read.fasl")
   :BYTES 7196 :SHA256
   "65478392a0af620cb981cd7be8a995dd8e020919ba62bf2c945e352890bbb811")
  (:PATH "raw/core-compiler-fasl/src/index/rebuild-budget.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/index/rebuild-budget.fasl")
   :BYTES 6562 :SHA256
   "3b74be3abda3db1a689ba1c6908c4cedf4fc970a1bd823e26c43cafeed93c639")
  (:PATH "raw/core-compiler-fasl/src/index/rebuild-copy.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/index/rebuild-copy.fasl")
   :BYTES 8105 :SHA256
   "0a9163abbe5abc061ac2c3034460c81c7820380cf6b416cd8f131c1f9bdf3c65")
  (:PATH "raw/core-compiler-fasl/src/index/rebuild-scan.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/index/rebuild-scan.fasl")
   :BYTES 12575 :SHA256
   "82302109d3b659295738872cdfa97ae7a6d7704d447d06726ccd95fe26208aa1")
  (:PATH "raw/core-compiler-fasl/src/index/rebuild.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/index/rebuild.fasl")
   :BYTES 4515 :SHA256
   "2674d0fca5c4fa7e269ce916ec6cde283622bc6d72cfd5c3da85f08c40a66128")
  (:PATH "raw/core-compiler-fasl/src/index/relocate.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/index/relocate.fasl")
   :BYTES 6683 :SHA256
   "a4bee166688dc2b6bf39c6dc8ab32db74576514a8d59cb2ea550076e1b2a9d83")
  (:PATH "raw/core-compiler-fasl/src/index/types.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/index/types.fasl")
   :BYTES 9937 :SHA256
   "7a12435d860bf935accd784e7bb706fb00fa185f52076a3672ac39ab175e3718")
  (:PATH "raw/core-compiler-fasl/src/index/validation.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/index/validation.fasl")
   :BYTES 9606 :SHA256
   "263a22958e5198307986793103bf7d2dfe972d467643266f44647e1b1f313965")
  (:PATH "raw/core-compiler-fasl/src/index/write.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/index/write.fasl")
   :BYTES 12516 :SHA256
   "566dac6d9857a79f1dbb7f66eedd3e18abef57c43253fb3c7b44389cf40e2a5e")
  (:PATH "raw/core-compiler-fasl/src/io/flush.fasl" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/io/flush.fasl")
   :BYTES 3555 :SHA256
   "ca584e455abbc1d58bdf008e99bdad6eef018af658a1bbb2cb4491caa8028210")
  (:PATH "raw/core-compiler-fasl/src/io/identity-types.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/io/identity-types.fasl")
   :BYTES 4468 :SHA256
   "22fd16a0fbcbedbb24f47d2d62966acbe83dea8e56de61ae9213eaf6f30255f3")
  (:PATH "raw/core-compiler-fasl/src/io/identity.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/io/identity.fasl")
   :BYTES 6192 :SHA256
   "5f8d510d1c8e5c4a5d90affa2c6622b326770a396e42b04d75c8e27e07586684")
  (:PATH "raw/core-compiler-fasl/src/io/lifecycle.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/io/lifecycle.fasl")
   :BYTES 10851 :SHA256
   "50648f2be076af0f9b355312fcc66fcc0d905afeca3a206b8ff17bf219522959")
  (:PATH "raw/core-compiler-fasl/src/io/native.fasl" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/io/native.fasl")
   :BYTES 22502 :SHA256
   "a9c5b1a9316db4aa18dfada5b501516c9ab192bff29aaebdf81d5a106195c45f")
  (:PATH "raw/core-compiler-fasl/src/io/package.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/io/package.fasl")
   :BYTES 1233 :SHA256
   "150fcb6d6e1242ba815d4d30a4f91837aa10acf990dbdb0c84f388ecd571cfb8")
  (:PATH "raw/core-compiler-fasl/src/io/transfer.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/io/transfer.fasl")
   :BYTES 13060 :SHA256
   "b0ed96c79a19ded32f8dc09e7198ef101c22f4fab4e3934200972c091fbb0287")
  (:PATH "raw/core-compiler-fasl/src/io/types.fasl" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/io/types.fasl")
   :BYTES 21763 :SHA256
   "a1a4c15ff846555736775188e0e1a04a742997b12e3a5490a1817a216f56026d")
  (:PATH "raw/core-compiler-fasl/src/mvcc/package.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/mvcc/package.fasl")
   :BYTES 1310 :SHA256
   "4a422be1b97bc0c382caa63f8f710beb0ed0c80a89cb6ccd3611b3b0f96adfaa")
  (:PATH "raw/core-compiler-fasl/src/mvcc/snapshots-core.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/mvcc/snapshots-core.fasl")
   :BYTES 11943 :SHA256
   "9fe7449f77e80598fd9d665b12b82a3d5a49f5e1325a8407677a0e907e76bd12")
  (:PATH "raw/core-compiler-fasl/src/mvcc/snapshots-csn.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/mvcc/snapshots-csn.fasl")
   :BYTES 6269 :SHA256
   "a76db67eb85e0d62257857c7dab769a611d200baa4135ae6b69cea13557177c4")
  (:PATH "raw/core-compiler-fasl/src/mvcc/snapshots-lifecycle.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/mvcc/snapshots-lifecycle.fasl")
   :BYTES 10480 :SHA256
   "c8d3b8494b5c5b2a6d0bbc4492e75dd24fbd5991044cd11008278492ff20bb8b")
  (:PATH "raw/core-compiler-fasl/src/mvcc/snapshots-read.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/mvcc/snapshots-read.fasl")
   :BYTES 13704 :SHA256
   "3804399643015eb076601b2da2b6de74f47a7afacca113617b8df69d10d5c2e5")
  (:PATH "raw/core-compiler-fasl/src/mvcc/snapshots-register.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/mvcc/snapshots-register.fasl")
   :BYTES 10014 :SHA256
   "4c6e4d7612fac1c6d39238c43522627304a21ed062abd5de4b4286aba37384e2")
  (:PATH "raw/core-compiler-fasl/src/mvcc/snapshots-types.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/mvcc/snapshots-types.fasl")
   :BYTES 21780 :SHA256
   "979942702fe1dbbb2fe1a6cae72b3e0d341e077800f17cb4f8d617d2cd77c60c")
  (:PATH "raw/core-compiler-fasl/src/mvcc/types.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/mvcc/types.fasl")
   :BYTES 1394 :SHA256
   "a5f4aec020a08df9c87a84ca816f0b292e1c1fd134d572d650de70b7b8120164")
  (:PATH "raw/core-compiler-fasl/src/package.fasl" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/package.fasl")
   :BYTES 1406 :SHA256
   "8fee4b8b167b57e5a83e336d165a76c5b63f3b14227b235115b9e16d3531fc98")
  (:PATH "raw/core-compiler-fasl/src/read/core.fasl" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/read/core.fasl")
   :BYTES 6240 :SHA256
   "e773b4019d70e231e34da9847690ae0b88276d1cf16ac398271d715ba60e0fca")
  (:PATH "raw/core-compiler-fasl/src/read/package.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/read/package.fasl")
   :BYTES 1202 :SHA256
   "7683dd1400b8fe6b46978283e8a24f02ec7600d00a81e629248ad8ef71d069fe")
  (:PATH "raw/core-compiler-fasl/src/read/task.fasl" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/read/task.fasl")
   :BYTES 14106 :SHA256
   "677eaf8873b47b680ca8af0cbf9b48ce0abe972ff352a0e44b7e850d19712a6f")
  (:PATH "raw/core-compiler-fasl/src/read/types.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/read/types.fasl")
   :BYTES 9778 :SHA256
   "d6d8e6f4b2b2ee292092b74bc97f65906746861e4daf206f1599454d231d7c79")
  (:PATH "raw/core-compiler-fasl/src/recovery/decisions-build.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/recovery/decisions-build.fasl")
   :BYTES 17729 :SHA256
   "8ddbaf34fe8dd92c0dbd5def5760a910b39fbedb9d7596f238b60a33b2442cba")
  (:PATH "raw/core-compiler-fasl/src/recovery/decisions-package.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/recovery/decisions-package.fasl")
   :BYTES 1301 :SHA256
   "efe950b4f127798f5dfdf8a3db21d1b131271bd5c56058f23e756a421f3d942c")
  (:PATH "raw/core-compiler-fasl/src/recovery/decisions-query.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/recovery/decisions-query.fasl")
   :BYTES 7482 :SHA256
   "4fc5429defb36b62ff6aba26e8e90904c314e070cafbe34a1a67d4eda838cb64")
  (:PATH "raw/core-compiler-fasl/src/recovery/decisions-radix.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/recovery/decisions-radix.fasl")
   :BYTES 14790 :SHA256
   "430f3e3aebed3b9ccf8435d66ed78bca82d47649f72fbb771330c0c0d1d71591")
  (:PATH "raw/core-compiler-fasl/src/recovery/decisions-sort.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/recovery/decisions-sort.fasl")
   :BYTES 14183 :SHA256
   "539fbd9a25ce74be19ee30bc881c6bfdd5fe023d7b9779839fa21ae33d001faa")
  (:PATH "raw/core-compiler-fasl/src/recovery/decisions-types.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/recovery/decisions-types.fasl")
   :BYTES 11080 :SHA256
   "a289a3a3ee5614cbd59869d080d57efcdfe5469bc52cf0789cb0255d90993108")
  (:PATH "raw/core-compiler-fasl/src/recovery/inventory-build.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/recovery/inventory-build.fasl")
   :BYTES 14472 :SHA256
   "175fb01e3aaae623e0598ef5e744ccbe0474fbc019cb348d3aa62b337c80fdf7")
  (:PATH "raw/core-compiler-fasl/src/recovery/inventory-query.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/recovery/inventory-query.fasl")
   :BYTES 3819 :SHA256
   "c42e5e3b373fe1ea19020d79f53ab7007c1c51a3af52846d30625a26f2c22381")
  (:PATH "raw/core-compiler-fasl/src/recovery/inventory-types.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/recovery/inventory-types.fasl")
   :BYTES 14867 :SHA256
   "6f776bab85b31ba853dfed211ec7aecc29f6287fe0d0733d4a4a2fbdfd6d43e7")
  (:PATH "raw/core-compiler-fasl/src/recovery/manifest-build.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/recovery/manifest-build.fasl")
   :BYTES 15466 :SHA256
   "98fdf478f7d6e5b8ef93229d0bbf3a17040a602245fadf6aaf8fdd4b31295418")
  (:PATH "raw/core-compiler-fasl/src/recovery/manifest-decode.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/recovery/manifest-decode.fasl")
   :BYTES 10754 :SHA256
   "bf740ac9468a4fec2da4238a700c8823babdc09bfda7bc9efbd2b8188115b731")
  (:PATH "raw/core-compiler-fasl/src/recovery/manifest-fold.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/recovery/manifest-fold.fasl")
   :BYTES 14551 :SHA256
   "4eaf91b4d112051cfa987803a3823b22af2080530e37a61a8cd36899cc69cd28")
  (:PATH "raw/core-compiler-fasl/src/recovery/manifest-package.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/recovery/manifest-package.fasl")
   :BYTES 1738 :SHA256
   "e7f65303466c7442213623f39f78d93d4111a2a7cc2cf13ec673b3dde6764f16")
  (:PATH "raw/core-compiler-fasl/src/recovery/manifest-query.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/recovery/manifest-query.fasl")
   :BYTES 6811 :SHA256
   "a66fe7620ab5a192d52b434fbe40bf9cf6344cb6feefb16f88f4f0cb93f29e50")
  (:PATH "raw/core-compiler-fasl/src/recovery/manifest-types.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/recovery/manifest-types.fasl")
   :BYTES 30420 :SHA256
   "4fbd3b6f38fc5c7409f421c9eedbb3686969770d617122d6963d2fb79d5c8eea")
  (:PATH "raw/core-compiler-fasl/src/recovery/package.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/recovery/package.fasl")
   :BYTES 1344 :SHA256
   "23426a6513918e4513b464397d517b96f1676c9448ac08f96571292c8ccebb35")
  (:PATH "raw/core-compiler-fasl/src/recovery/scan.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/recovery/scan.fasl")
   :BYTES 25453 :SHA256
   "0e2a620f88c8eb51d41e08e3afc32aba39fb2210bdd36fb14dca183821e0fab6")
  (:PATH "raw/core-compiler-fasl/src/scheduler/build.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/scheduler/build.fasl")
   :BYTES 4105 :SHA256
   "49b7e58a7a66e852718283bc2d3c88fef162469813fa0fa5d95b51c4aab4e65a")
  (:PATH "raw/core-compiler-fasl/src/scheduler/package.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/scheduler/package.fasl")
   :BYTES 947 :SHA256
   "b599c8bcea7915abb0f5c27ff7cc8b3f941719c3d7c190db1386a1f15da9d733")
  (:PATH "raw/core-compiler-fasl/src/scheduler/policy.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/scheduler/policy.fasl")
   :BYTES 4418 :SHA256
   "d75c5ccbae5104417afae85d6327992d189f1572cd9e4328ae08cf6f4fb848c7")
  (:PATH "raw/core-compiler-fasl/src/scheduler/read.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/scheduler/read.fasl")
   :BYTES 3335 :SHA256
   "5e743f9c90cdaa501bdcac80851f74e92de0e60e17e6af71920da313d1edc4c0")
  (:PATH "raw/core-compiler-fasl/src/scheduler/types.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/scheduler/types.fasl")
   :BYTES 16610 :SHA256
   "13cec7ceb5fddceef6866ec1ea311d8842a760170c25c2196a5a2b74bf212893")
  (:PATH "raw/core-compiler-fasl/src/scheduler/update.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/scheduler/update.fasl")
   :BYTES 4736 :SHA256
   "0411fcb2d1e3d8eeeaf2280cd96b0263595c1caedf2a555c7aaf0f9291c3d81b")
  (:PATH "raw/core-compiler-fasl/src/series/events.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/series/events.fasl")
   :BYTES 17564 :SHA256
   "591583b2c8c8785528ba21da8219be1ac51e76966bc3c19dbb6d56d818baa53e")
  (:PATH "raw/core-compiler-fasl/src/series/io-events.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/series/io-events.fasl")
   :BYTES 8394 :SHA256
   "7a52c2179b68bf5a4bd4140b45cacf428a1b04f4dc1ce06b3f0ead1a17b809f2")
  (:PATH "raw/core-compiler-fasl/src/series/ownership.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/series/ownership.fasl")
   :BYTES 13664 :SHA256
   "ce0ef2a10a60a6b3e50426024319d67e967fc20ac64a14e2ee5ebe36bbc25417")
  (:PATH "raw/core-compiler-fasl/src/series/package.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/series/package.fasl")
   :BYTES 1724 :SHA256
   "3fca2ca6ad5d4e1ec4a457c8ceb25f68da80a4a1b9da243dd6caf0c99420745e")
  (:PATH "raw/core-compiler-fasl/src/series/publication.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/series/publication.fasl")
   :BYTES 11511 :SHA256
   "c32d062966a2ef04b2cfb9259e79e870c29b478e363f20baf2c014143993aed0")
  (:PATH "raw/core-compiler-fasl/src/series/query.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/series/query.fasl")
   :BYTES 6500 :SHA256
   "f095c172c54c7fe1a57e24b65a01eef23a2e59d161b2386eda06c10f73f8c2bb")
  (:PATH "raw/core-compiler-fasl/src/series/retirement.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/series/retirement.fasl")
   :BYTES 8216 :SHA256
   "1f73eccfb8f3497e5354632b64210957b7a5b0733432f218155d7f0a03094369")
  (:PATH "raw/core-compiler-fasl/src/series/routing-build.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/series/routing-build.fasl")
   :BYTES 6419 :SHA256
   "1d9ba259de367055bd2be6e568e321e9c789db94af03f7f5ac76a0a156ebaace")
  (:PATH "raw/core-compiler-fasl/src/series/routing-select.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/series/routing-select.fasl")
   :BYTES 6877 :SHA256
   "e4c6979a130a4e3ee76dbaad6c9ee11f1ff924fa4636d6272635440e01f1a165")
  (:PATH "raw/core-compiler-fasl/src/series/routing-types.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/series/routing-types.fasl")
   :BYTES 9276 :SHA256
   "3fbb7716508f474961048be7328f503d8098db11ced743056da4799abad0243e")
  (:PATH "raw/core-compiler-fasl/src/series/types.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/series/types.fasl")
   :BYTES 34015 :SHA256
   "0ed898347b39f44f1bad366e199378152909afa32f085cade870abe1cc6a2b86")
  (:PATH "raw/core-compiler-fasl/src/series/worker-boundary.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/series/worker-boundary.fasl")
   :BYTES 7852 :SHA256
   "5dacd2be078b48384643a8767e9eccbca32cce41747f72d5bbd62428bdbbb0a6")
  (:PATH "raw/core-compiler-fasl/src/series/worker-package.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/series/worker-package.fasl")
   :BYTES 1593 :SHA256
   "f2bcc54a4190c35d38d90abe0a52f039bc4d049de76c749bb58706660273405d")
  (:PATH "raw/core-compiler-fasl/src/series/worker-run.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/series/worker-run.fasl")
   :BYTES 15264 :SHA256
   "0a50afa5188d6f58862d4e351cf3fbd6912df3b94868bf215b1d1902fa3699b6")
  (:PATH "raw/core-compiler-fasl/src/series/worker-types.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/series/worker-types.fasl")
   :BYTES 17270 :SHA256
   "72dc8128d05aa7ab1d8c0b3de567473f9d426c9eac94e7a2df6b6d4c5be9ec19")
  (:PATH "raw/core-compiler-fasl/src/storage/compaction-scan.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/storage/compaction-scan.fasl")
   :BYTES 8290 :SHA256
   "d13f78d41c13e7feb3bd97f782556419e7c633003c32c3000a16dbecb124be88")
  (:PATH "raw/core-compiler-fasl/src/storage/control-payload.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/storage/control-payload.fasl")
   :BYTES 12136 :SHA256
   "257d4153be93b3e5be98a216904f63e3b57970341e29fd5899383fbc321f3365")
  (:PATH "raw/core-compiler-fasl/src/storage/formats.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/storage/formats.fasl")
   :BYTES 8588 :SHA256
   "cc51e06941f8b0a926927479543fc7f9233cf209af5d714606576bf7bfc4c91e")
  (:PATH "raw/core-compiler-fasl/src/storage/log-header.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/storage/log-header.fasl")
   :BYTES 7976 :SHA256
   "2c97a50c70ea92dadad777d063034a215892dff1d1a2f9e81b63b138eab7d9dc")
  (:PATH "raw/core-compiler-fasl/src/storage/package.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/storage/package.fasl")
   :BYTES 1502 :SHA256
   "d8c3dc9719b3ec92e419358460e0b8b2d62e5f3bfe539d4c8094dcf70ccc3b8f")
  (:PATH "raw/core-compiler-fasl/src/storage/payload-record.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/storage/payload-record.fasl")
   :BYTES 6753 :SHA256
   "2c8134f47825edbef6d215c6a36aac89a8601682a9b9df2ecbf406636c1fd80c")
  (:PATH "raw/core-compiler-fasl/src/storage/payload-write.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/storage/payload-write.fasl")
   :BYTES 9553 :SHA256
   "9e353bcd7ec89382746713e0fb082200e400cd5fd3ab1b6c023941a8dc5fb04c")
  (:PATH "raw/core-compiler-fasl/src/storage/segment-header.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/storage/segment-header.fasl")
   :BYTES 10316 :SHA256
   "2cce5caf324a9ef45812952bf5d8793af5181a8c133119b2d72253f87a1add3a")
  (:PATH "raw/core-compiler-fasl/src/wal/builder.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/wal/builder.fasl")
   :BYTES 14599 :SHA256
   "118eb5faee0807d9d6a4ce850497e11e947e970ba969b8b680ce0baa58239c14")
  (:PATH "raw/core-compiler-fasl/src/wal/csn.fasl" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/wal/csn.fasl")
   :BYTES 16439 :SHA256
   "8c55f748ed0f4e49df45345f3502e14ab4f64df58741ca19dce68ebcc6bd949c")
  (:PATH "raw/core-compiler-fasl/src/wal/executor.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/wal/executor.fasl")
   :BYTES 13806 :SHA256
   "c97fb57f2a929334b15fe1d32e600896063169f005b7c5fe67d2903bd25f257c")
  (:PATH "raw/core-compiler-fasl/src/wal/group.fasl" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/wal/group.fasl")
   :BYTES 11034 :SHA256
   "e6586650ee47d7415f0369825b6859542a478354303bb03a9a9a84b6baa29b0a")
  (:PATH "raw/core-compiler-fasl/src/wal/package.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/wal/package.fasl")
   :BYTES 2127 :SHA256
   "03bfe326c29b8e6b4a2d8c74c2d9d6b162883c335c2c6344b72a57e6bd1876de")
  (:PATH "raw/core-compiler-fasl/src/wal/types.fasl" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/src/wal/types.fasl")
   :BYTES 38893 :SHA256
   "9e82c8964aeec5f3e282483deb33b774cff93d9a47e51fd03af2feabbffc7a74")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-float-write-support.fasl"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/codec/cbor-float-write-support.fasl")
   :BYTES 30021 :SHA256
   "5184c38d6175a8a966a9065983662bb19b5ed57af4505f20edd5c6045a86c60f")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-float-write-threads.fasl"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/codec/cbor-float-write-threads.fasl")
   :BYTES 8185 :SHA256
   "ea772f242cb48c13e0d3a593a94e833696ab8302968a92a931102e13a3150bef")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-float-write.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/codec/cbor-float-write.fasl")
   :BYTES 40121 :SHA256
   "3a6a432fa32efaee32efa48526d4dd3914d3f2b6b69e4186414f552ac6582ecd")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-header.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/codec/cbor-header.fasl")
   :BYTES 22713 :SHA256
   "35e8587e02329132ade56e7ffa2ec6b3e209c465e3af2171733b51ca720d67d6")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-minimal-edges.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/codec/cbor-minimal-edges.fasl")
   :BYTES 3141 :SHA256
   "3a23e3b8f50d22891c4a6cbf0c4f0bf5e5d9b9ba458542b46b64805d4ad62698")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-minimal-scan-support.fasl"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/codec/cbor-minimal-scan-support.fasl")
   :BYTES 30232 :SHA256
   "b9e72a86b86f7461d595d343867e30786c8d9dd7d420b9d38ef47b0a0e1c8283")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-minimal-scan-threads.fasl"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/codec/cbor-minimal-scan-threads.fasl")
   :BYTES 9324 :SHA256
   "973e89c37bee458e8a7b0b4af065342db7ce6c543f5deceeef62f3c889576074")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-minimal-scan.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/codec/cbor-minimal-scan.fasl")
   :BYTES 33525 :SHA256
   "9a5d31b1a524c93f1af3ed5066b3ffba9c7e09897503c4debf5b5137f266d500")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-minimal-support.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/codec/cbor-minimal-support.fasl")
   :BYTES 23897 :SHA256
   "a2ae7c91a4141aa03234268227ee5d61b178b893a0bbb26d80495f8c7121b697")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-minimal-threads.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/codec/cbor-minimal-threads.fasl")
   :BYTES 7776 :SHA256
   "b6de8451bf6e7be38cfa7c86af6886ee769d544110c22fea97d0d1721b672e61")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-minimal.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/codec/cbor-minimal.fasl")
   :BYTES 24421 :SHA256
   "959e4d777002913f11ff9948cbe63bc0a170c3d9d4dd1d1194937271908273aa")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-simple-write-support.fasl"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/codec/cbor-simple-write-support.fasl")
   :BYTES 16269 :SHA256
   "f092c2f621bf30ec4cecb936885a30905fb565fd1b67a70dd8efcdace13d645d")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-simple-write-threads.fasl"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/codec/cbor-simple-write-threads.fasl")
   :BYTES 8138 :SHA256
   "8ac82c5acd29a71b6ead0affb8f53d4d8cfab5b64178fc1e2c37519a6d9e0dcb")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-simple-write.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/codec/cbor-simple-write.fasl")
   :BYTES 23625 :SHA256
   "23280f12adbd9f9bab10860201f5b16f72b23475e2fcfd59af7966006c88fc3d")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-string-write-support.fasl"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/codec/cbor-string-write-support.fasl")
   :BYTES 19214 :SHA256
   "86bbbed9cadb9085ca6b2b796202519cb825211849d1a0414f9b26c806a9263c")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-string-write-threads.fasl"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/codec/cbor-string-write-threads.fasl")
   :BYTES 8088 :SHA256
   "de989d152bf3090954ac789fde92e85d15a1c2d324bef0b005d99ec8cecf27c9")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-string-write.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/codec/cbor-string-write.fasl")
   :BYTES 28846 :SHA256
   "f88497e3c99fe86073bb34e11b8b73417da41e95bba8bf50896eda15c7dff3e2")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-structure-support.fasl"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/codec/cbor-structure-support.fasl")
   :BYTES 34948 :SHA256
   "e54940b6c19e644a6e3e8932fcaa4df21fad2e98ce0f1b4b08105bf2aa85a6d2")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-structure-threads.fasl"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/codec/cbor-structure-threads.fasl")
   :BYTES 9653 :SHA256
   "4a38e2b64c6cf3de11877d08336cdb179e8d7b31244fe153ce2b71982f4f47d9")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-structure.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/codec/cbor-structure.fasl")
   :BYTES 41683 :SHA256
   "4acc25fe6978b9273d8bc430c44df54cfe5c85e2c6e2e0e817200f3beb157712")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-support.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/codec/cbor-support.fasl")
   :BYTES 18139 :SHA256
   "7021a1fc0fbfa3a3165b02675d19c93afc00b5e331511c649c51ecf8ae825fe7")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-threads.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/codec/cbor-threads.fasl")
   :BYTES 8101 :SHA256
   "50753374ba562a280902425809f4e399a63cec856e87d5057df3413508b34114")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-write-roundtrip.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/codec/cbor-write-roundtrip.fasl")
   :BYTES 2560 :SHA256
   "5b519b1585e8b12b806d4688da35d8c9f04c8cc6d779a3025780fc333942035c")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-write-support.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/codec/cbor-write-support.fasl")
   :BYTES 14016 :SHA256
   "3a1dbc92b6087df3027762a8ba015f2ed28d8db909cab24242083673b58abdf8")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-write-threads.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/codec/cbor-write-threads.fasl")
   :BYTES 8187 :SHA256
   "6d64ac63f44adb66df4c8e899f2b4b30d369feca99d1551859d06327666fa41b")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-write.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/codec/cbor-write.fasl")
   :BYTES 19798 :SHA256
   "2019fa856984e79e0ec2b8fa05946df8e32450fdc6f47054f7a62d9aba3ea871")
  (:PATH "raw/core-compiler-fasl/tests/codec/support.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/codec/support.fasl")
   :BYTES 17733 :SHA256
   "f32e4935f25b0f0db544e87cfb1caaee1ed07f58a1cd774705953e17ff8f355f")
  (:PATH "raw/core-compiler-fasl/tests/codec/threads.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/codec/threads.fasl")
   :BYTES 6734 :SHA256
   "bd00eff7b9c1dcce2f7d17cc7f4dec39baba0fb963d6f364728fb09f641c7fdf")
  (:PATH "raw/core-compiler-fasl/tests/codec/utf8.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/codec/utf8.fasl")
   :BYTES 25376 :SHA256
   "64b003a85710074260f33b1c2cee754e57fbe477934217cae5b7b745564f375c")
  (:PATH "raw/core-compiler-fasl/tests/csn/registry.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/csn/registry.fasl")
   :BYTES 50835 :SHA256
   "8d7a5f277f49fd0d0870eef56a40150855f819e08291985f335a392c5a536466")
  (:PATH "raw/core-compiler-fasl/tests/csn/support.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/csn/support.fasl")
   :BYTES 39996 :SHA256
   "bbe802a5d787974225455d9ce06b9c46b24d2a3458e63e850e620cdc6ea5ea2b")
  (:PATH "raw/core-compiler-fasl/tests/csn/threads.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/csn/threads.fasl")
   :BYTES 22676 :SHA256
   "db6befe91d9615a1f4cebb0818adec2b371f4829ca59a2b20615dd1f2934dfd4")
  (:PATH "raw/core-compiler-fasl/tests/epochs/lifecycle.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/epochs/lifecycle.fasl")
   :BYTES 73989 :SHA256
   "db9de586d33b742748430c20b77c13a437c225a6fc8d9d3849782a2b4b478cfa")
  (:PATH "raw/core-compiler-fasl/tests/epochs/support.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/epochs/support.fasl")
   :BYTES 35867 :SHA256
   "536dff1b77d9d1b3a385114645da6c8735d11df11f51dee5c452dd8f374909c6")
  (:PATH "raw/core-compiler-fasl/tests/epochs/threads.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/epochs/threads.fasl")
   :BYTES 10424 :SHA256
   "3491b193a4ca7cda7f5cdb14a60a1645bb6d659c587c0e95395c5c50867609cd")
  (:PATH "raw/core-compiler-fasl/tests/execution/handoff.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/execution/handoff.fasl")
   :BYTES 90788 :SHA256
   "c899671ee09338c7b7a39710c1f82b21d347dee02c60a7b72d5b74887d383478")
  (:PATH "raw/core-compiler-fasl/tests/execution/queue.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/execution/queue.fasl")
   :BYTES 40339 :SHA256
   "ef7a44a8383b091877322604cbc033898a596e543b3ab3b8f482da8f0fc5f223")
  (:PATH "raw/core-compiler-fasl/tests/execution/ready-recycle.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/execution/ready-recycle.fasl")
   :BYTES 67056 :SHA256
   "59d64391bcb4dbccff3415c0b9eb0dabff7882e600a64383ee7f461421693300")
  (:PATH "raw/core-compiler-fasl/tests/execution/ready.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/execution/ready.fasl")
   :BYTES 82272 :SHA256
   "1b1a648e4b8923330dbc13f960671875f77d5eaf74f940df63f42a06c225e78b")
  (:PATH "raw/core-compiler-fasl/tests/execution/support.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/execution/support.fasl")
   :BYTES 16060 :SHA256
   "404688beb83ddacf9af25ed94a44043ebbfc7b78aeaf80f076b9da92f6ccbc17")
  (:PATH "raw/core-compiler-fasl/tests/execution/threads.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/execution/threads.fasl")
   :BYTES 29756 :SHA256
   "b18cebc96e30fdc7c7e3b1c2cf3362805a6d76d3ecc23e686aeaa7f09852dcd9")
  (:PATH "raw/core-compiler-fasl/tests/execution/worker.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/execution/worker.fasl")
   :BYTES 158272 :SHA256
   "82fb2b6e91c3e2272614c0b4964486cd2a51db3b3ca2da40231303fa7dad6887")
  (:PATH "raw/core-compiler-fasl/tests/foundation/batch.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/foundation/batch.fasl")
   :BYTES 18995 :SHA256
   "b735dfa732763e433b1a16e9e8d4b42926b51b55dac217df9165a0da473ea12e")
  (:PATH "raw/core-compiler-fasl/tests/foundation/binary.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/foundation/binary.fasl")
   :BYTES 15563 :SHA256
   "ae7a7e7ef003faf171e9f5393bb257a72339f1fe7215c5ec40729dd32601072a")
  (:PATH "raw/core-compiler-fasl/tests/foundation/record.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/foundation/record.fasl")
   :BYTES 59118 :SHA256
   "1d4e0a3395ee302bca4f0e39bb7e91949fc76ad3433be35ae7dba002840c6722")
  (:PATH "raw/core-compiler-fasl/tests/foundation/support.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/foundation/support.fasl")
   :BYTES 10277 :SHA256
   "fe89cdf320559d035e612c404c5deb2804ba3f0c1318382e88504086dac441c0")
  (:PATH "raw/core-compiler-fasl/tests/get-active/construction.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/get-active/construction.fasl")
   :BYTES 80699 :SHA256
   "69a6ddd804a6dd0ccd9cc1f01835f3971bcccaa81b6ad0993381fe62acc3fc7a")
  (:PATH "raw/core-compiler-fasl/tests/get-active/directory.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/get-active/directory.fasl")
   :BYTES 29461 :SHA256
   "9d8300e20bcf7a85fec9f0579ee34280427c632215cf7d76bff1b52e137fe6f4")
  (:PATH "raw/core-compiler-fasl/tests/get-active/read.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/get-active/read.fasl")
   :BYTES 110767 :SHA256
   "70bac632a4f5b3322d523a06a0f3fdce895c1d9241f5fcbacb0971989bea7a4d")
  (:PATH "raw/core-compiler-fasl/tests/get-active/support.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/get-active/support.fasl")
   :BYTES 179836 :SHA256
   "690942acc950b2fb152f1f26aecbc15346be3444da72c6b61a1730aed8a68997")
  (:PATH "raw/core-compiler-fasl/tests/get-directory/construction.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/get-directory/construction.fasl")
   :BYTES 40543 :SHA256
   "824527aaff68a2639bbce5cbd71e366ab234a4e4f2b8883f866f83f9610f302d")
  (:PATH "raw/core-compiler-fasl/tests/get-directory/read.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/get-directory/read.fasl")
   :BYTES 65621 :SHA256
   "c261c00b3e3172dc8b36ab7ba669155743770b9cef813920bc7c6e93b9e56b4f")
  (:PATH "raw/core-compiler-fasl/tests/get-directory/series-read.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/get-directory/series-read.fasl")
   :BYTES 165828 :SHA256
   "e4a19cd3b9e734bd865ec9b7207c66f5b9b76baf16ac325e2b487bc60cb1ab75")
  (:PATH "raw/core-compiler-fasl/tests/get-directory/series-support.fasl"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/get-directory/series-support.fasl")
   :BYTES 95464 :SHA256
   "2af0eb7c28e969364459453227e39a988918685b26414073053776e88a592278")
  (:PATH "raw/core-compiler-fasl/tests/get-directory/support.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/get-directory/support.fasl")
   :BYTES 130096 :SHA256
   "8275a3c104135f3ce352cda99825a21dbc1f8fad7f1142599cb831a896055e24")
  (:PATH "raw/core-compiler-fasl/tests/get-directory/threads.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/get-directory/threads.fasl")
   :BYTES 15444 :SHA256
   "067789937a3b39a0fb5d0f58c0774aa8970d188bf56189d7bcaa05682dd17236")
  (:PATH "raw/core-compiler-fasl/tests/get-performance/guards.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/get-performance/guards.fasl")
   :BYTES 19321 :SHA256
   "3016740330ae87bd2d319db9a107304ca3569e76c8c3964b914e440d3cca8d50")
  (:PATH "raw/core-compiler-fasl/tests/get-performance/paths.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/get-performance/paths.fasl")
   :BYTES 15872 :SHA256
   "21deead85b64ee1d0cd763a6a212427a9cf52bc82a19d9df14f3f3e386843fdc")
  (:PATH "raw/core-compiler-fasl/tests/get-performance/support.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/get-performance/support.fasl")
   :BYTES 114326 :SHA256
   "3cb287cd1c0c07c85e0bd32abef1d5914d95493fac90fb4c55a10e5aa3e1a4e7")
  (:PATH "raw/core-compiler-fasl/tests/get-performance/threads.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/get-performance/threads.fasl")
   :BYTES 10486 :SHA256
   "9930a14087410e9693f2592362eacda3acaa886bd1e6ce6d51b6ec988b3052d8")
  (:PATH "raw/core-compiler-fasl/tests/get-resolver/construction.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/get-resolver/construction.fasl")
   :BYTES 56485 :SHA256
   "63b1008a4fd633432240cb4b013c0e13d5aee13da76d727f5546fd58f9d96f5d")
  (:PATH "raw/core-compiler-fasl/tests/get-resolver/read.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/get-resolver/read.fasl")
   :BYTES 122918 :SHA256
   "e8b6c0fda294d7e2895841c165152bff551a194155e81067fdd4e5dec9a60eff")
  (:PATH "raw/core-compiler-fasl/tests/get-resolver/sort.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/get-resolver/sort.fasl")
   :BYTES 31279 :SHA256
   "c96311f599dbb4b84a1ac1eff69c196f071171a6bb0949b67aed8bb2788e6fd6")
  (:PATH "raw/core-compiler-fasl/tests/get-resolver/support.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/get-resolver/support.fasl")
   :BYTES 130396 :SHA256
   "8e74e19c3c94a832d5277e6401257571af188ac2eac7ba0851e9e993d1ed3a24")
  (:PATH "raw/core-compiler-fasl/tests/get/lifecycle.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/get/lifecycle.fasl")
   :BYTES 86071 :SHA256
   "9c8f8efb1c00d8e73a00e6e7a845bd436c1866695237aa398b03af3e8c827df9")
  (:PATH "raw/core-compiler-fasl/tests/get/segment.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/get/segment.fasl")
   :BYTES 64572 :SHA256
   "3ed08c17ffed722744de0e1a9f38cfc87827078a58a62884e620c9fa493d9310")
  (:PATH "raw/core-compiler-fasl/tests/get/support.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/get/support.fasl")
   :BYTES 56071 :SHA256
   "4cadcb69caf8136e62d1334ca159a58e2fbfd4953a0bd54e901bccbf6d609227")
  (:PATH "raw/core-compiler-fasl/tests/hash/guards.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/hash/guards.fasl")
   :BYTES 4811 :SHA256
   "a96c135d16eaf6e812663a23c175677566a91f4a3160614e30d05d9db51777ad")
  (:PATH "raw/core-compiler-fasl/tests/hash/hash64.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/hash/hash64.fasl")
   :BYTES 37238 :SHA256
   "2ca8cf421339804a27dbc136c28d2bced1898234c3bd6d1363f45e94a354035d")
  (:PATH "raw/core-compiler-fasl/tests/hash/support.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/hash/support.fasl")
   :BYTES 46849 :SHA256
   "53ad69fbe9dc97ccc97f25efebc0681c39244cf5eb61a3b2dda9fef2b3f3b37c")
  (:PATH "raw/core-compiler-fasl/tests/hash/threads.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/hash/threads.fasl")
   :BYTES 14674 :SHA256
   "3a848e15ad608fd8b2dbee21477a412001a0fc3b64bd521c4c319391be983197")
  (:PATH "raw/core-compiler-fasl/tests/index/hash-digests.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/index/hash-digests.fasl")
   :BYTES 149733 :SHA256
   "65712ee176a47951a760c0e8c0a84e94c4daac68a60de262165525e49859079b")
  (:PATH "raw/core-compiler-fasl/tests/index/primary-support.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/index/primary-support.fasl")
   :BYTES 55215 :SHA256
   "9d4250a415d0a0447fc8c3fbe966db3ece6a9fd7b8a0abcad6cd4ee7b7aaa177")
  (:PATH "raw/core-compiler-fasl/tests/index/primary-threads.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/index/primary-threads.fasl")
   :BYTES 54603 :SHA256
   "72bdf1f5b2fa2cc746d7af8d46cd7c41e290d6020248b4af1ef48805fc3bd117")
  (:PATH "raw/core-compiler-fasl/tests/index/primary.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/index/primary.fasl")
   :BYTES 143083 :SHA256
   "f97d74c6468c6c721176bce720c86d85879fa3bd82305b64a666819a0b248076")
  (:PATH "raw/core-compiler-fasl/tests/index/rebuild.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/index/rebuild.fasl")
   :BYTES 135881 :SHA256
   "e396bcbb12dfe5c4a3b7918f35ca786b4a41a5701c746c798cb0577321f671bf")
  (:PATH "raw/core-compiler-fasl/tests/index/slot-support.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/index/slot-support.fasl")
   :BYTES 48229 :SHA256
   "24a78f20873155ecc76edda9b6e7102984f269426b206012d265ba93b31dc12f")
  (:PATH "raw/core-compiler-fasl/tests/index/slot-threads.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/index/slot-threads.fasl")
   :BYTES 52729 :SHA256
   "8ab657456f2b9967646b85afcf4cac9d394ecf29b7c0e714cf599f0f8e0a03ff")
  (:PATH "raw/core-compiler-fasl/tests/index/slots.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/index/slots.fasl")
   :BYTES 148206 :SHA256
   "dbd06164a609e25df8244f8f9ffca8e3cbe66181fc940ec32a1c5868e63888dd")
  (:PATH "raw/core-compiler-fasl/tests/io/native.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/io/native.fasl")
   :BYTES 34322 :SHA256
   "20abbb61dc35d25368d04a4983738f6a5aaecd34b6823b94439c6fbc1f1a42a7")
  (:PATH "raw/core-compiler-fasl/tests/io/support.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/io/support.fasl")
   :BYTES 16070 :SHA256
   "4a9a1127e0e521f07c92cd0ef799401759eba1c37e181219ff1cb63ceb67dd5b")
  (:PATH "raw/core-compiler-fasl/tests/io/transfer.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/io/transfer.fasl")
   :BYTES 53175 :SHA256
   "847e885aad20ceb49fc9603b4aa930dd4b2b269512c20250d2c1807d191a6b8d")
  (:PATH "raw/core-compiler-fasl/tests/mvcc/capture.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/mvcc/capture.fasl")
   :BYTES 48563 :SHA256
   "810f671c9d01cb278e52025296f502005d5d8e13059b513a60580dbcdbd2b005")
  (:PATH "raw/core-compiler-fasl/tests/mvcc/lifecycle.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/mvcc/lifecycle.fasl")
   :BYTES 89145 :SHA256
   "d43e7dc123e935bcaba6110552c5ee243ddf12f033594d2a247bf3cae176010e")
  (:PATH "raw/core-compiler-fasl/tests/mvcc/support.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/mvcc/support.fasl")
   :BYTES 38346 :SHA256
   "7748174a40d944424497dc6820c7a6e398e5def6f80ca9c1d57af00856507887")
  (:PATH "raw/core-compiler-fasl/tests/read/lifecycle.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/read/lifecycle.fasl")
   :BYTES 122290 :SHA256
   "0c8ff36bb71698c62a7238e9886515289673e9b94b0540c00a79a5aaed3599c9")
  (:PATH "raw/core-compiler-fasl/tests/read/support.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/read/support.fasl")
   :BYTES 20924 :SHA256
   "d367e283344c890eee8b73b4f1dc161b8b3c0d171aab55c165785766fc0c6640")
  (:PATH "raw/core-compiler-fasl/tests/read/threads.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/read/threads.fasl")
   :BYTES 16886 :SHA256
   "a5ab6c66e6c0ddde4be967c871d9ed9ffcaeeb0bf91b00f7272d44eceac1998c")
  (:PATH "raw/core-compiler-fasl/tests/recovery/corruption.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/recovery/corruption.fasl")
   :BYTES 13094 :SHA256
   "9771f0011f211048393b7b773f9b5293e797bfb679c3ce34a8091f6d0761a9f7")
  (:PATH "raw/core-compiler-fasl/tests/recovery/decisions-audit.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/recovery/decisions-audit.fasl")
   :BYTES 34010 :SHA256
   "eb2933ddf8dcbc078d1d5c4e2ae8f70f5167873e89d13e9e7c9bda74d4636f56")
  (:PATH "raw/core-compiler-fasl/tests/recovery/decisions-radix.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/recovery/decisions-radix.fasl")
   :BYTES 69380 :SHA256
   "f02a09903e1481ff875e1e80de078fab354e8b92fddc9648b314ab693b5149e5")
  (:PATH "raw/core-compiler-fasl/tests/recovery/decisions-support.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/recovery/decisions-support.fasl")
   :BYTES 16620 :SHA256
   "6d88509de98c1f85f965f1df62dd8b54967c84af246140833c5ce3d8d890a919")
  (:PATH "raw/core-compiler-fasl/tests/recovery/decisions.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/recovery/decisions.fasl")
   :BYTES 57595 :SHA256
   "7361a2b5424a6c7d8f33aa9f22cf7148b8d2deaab9846e2626ff932b3eaa9af1")
  (:PATH "raw/core-compiler-fasl/tests/recovery/inventory-support.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/recovery/inventory-support.fasl")
   :BYTES 20591 :SHA256
   "ee44de0f624996dacdfd7c379ef33876b1d3d7563964c76e514ddd6cdcd4e820")
  (:PATH "raw/core-compiler-fasl/tests/recovery/inventory.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/recovery/inventory.fasl")
   :BYTES 37709 :SHA256
   "8687cd2a17b3d8f6bc79fe9b5503fddfc1be0c74820b39596974f857f6493cd0")
  (:PATH "raw/core-compiler-fasl/tests/recovery/manifest-audit.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/recovery/manifest-audit.fasl")
   :BYTES 47967 :SHA256
   "16cd2a35b9b4b21a1a7b817670d8f3b6af1701ecb44fad7c3736e7c03ba69e29")
  (:PATH "raw/core-compiler-fasl/tests/recovery/manifest-support.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/recovery/manifest-support.fasl")
   :BYTES 24105 :SHA256
   "c5ac90cc87a1049d5cd63a1d48b44a1dfee3397e2d1bf598c79f1be530be681e")
  (:PATH "raw/core-compiler-fasl/tests/recovery/manifest.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/recovery/manifest.fasl")
   :BYTES 33932 :SHA256
   "ad49c933886a7c701f75e6221a2aaa64b7b040f047e971e5dee9c8676710eeed")
  (:PATH "raw/core-compiler-fasl/tests/recovery/scan.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/recovery/scan.fasl")
   :BYTES 52948 :SHA256
   "8bb5199caa6b98730870da2a2adb3391ea24f778f3b6705fdb2071bd6d336fb0")
  (:PATH "raw/core-compiler-fasl/tests/recovery/support.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/recovery/support.fasl")
   :BYTES 17908 :SHA256
   "4a2bc7ee2836a63a5f09c557270519142bef148ec89e75ede5f7b6e953424446")
  (:PATH "raw/core-compiler-fasl/tests/scheduler/controller.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/scheduler/controller.fasl")
   :BYTES 48539 :SHA256
   "5148e7b5350a37aeef2758856cc4c1fa0bdcef9d88f5ea4c629f3b1245c59018")
  (:PATH "raw/core-compiler-fasl/tests/scheduler/support.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/scheduler/support.fasl")
   :BYTES 10714 :SHA256
   "1c14b868bd5e2cd9ee8cc9f467131b50746247517bfad05ad213a98be7a5eaaf")
  (:PATH "raw/core-compiler-fasl/tests/series/boundaries.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/series/boundaries.fasl")
   :BYTES 10725 :SHA256
   "5a8d65511fb52e6db52f7aca2dbab6364a5a5888e03b3e5983f13068934f2627")
  (:PATH "raw/core-compiler-fasl/tests/series/controller.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/series/controller.fasl")
   :BYTES 112890 :SHA256
   "c8b555f4fc1eea7892c01b0549ed349f7e339ddd925338f564a38a28cf2ecab0")
  (:PATH "raw/core-compiler-fasl/tests/series/support.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/series/support.fasl")
   :BYTES 94482 :SHA256
   "0155bd76c6dad0409642db34cdc84b46dd6c256f594c7c072fd495c0eb5dffb2")
  (:PATH "raw/core-compiler-fasl/tests/series/threads.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/series/threads.fasl")
   :BYTES 36250 :SHA256
   "f0ac8effd13ff54661fa67c4f9411ea7a6d66381d242154942111c118d5c6d7e")
  (:PATH "raw/core-compiler-fasl/tests/series/worker-bridge.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/series/worker-bridge.fasl")
   :BYTES 111069 :SHA256
   "b56547f90d451970ac3ab714996c6f27bd40202f42bcf55fa2d573f8b684b02b")
  (:PATH "raw/core-compiler-fasl/tests/series/worker-routing.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/series/worker-routing.fasl")
   :BYTES 64485 :SHA256
   "6b8b0c9fb5e48815887687d4ce8b14c2bdd68f8897e8f634914fc7089ead92e8")
  (:PATH "raw/core-compiler-fasl/tests/smoke.fasl" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/smoke.fasl")
   :BYTES 3290 :SHA256
   "0377a7f38c201fa145e76f7fa2d15bfa0fdedac292aef4076a7090801bcb93cf")
  (:PATH "raw/core-compiler-fasl/tests/storage/compaction-scan.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/storage/compaction-scan.fasl")
   :BYTES 35504 :SHA256
   "87e8230bef4c45328654aef6de2e468807be5413067055abba57edd395f71153")
  (:PATH "raw/core-compiler-fasl/tests/storage/control-payload.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/storage/control-payload.fasl")
   :BYTES 59357 :SHA256
   "2e72bb9307b6919f3435c25e648360058c7614ec859c34f3371572023316cd8c")
  (:PATH "raw/core-compiler-fasl/tests/storage/log-header.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/storage/log-header.fasl")
   :BYTES 36643 :SHA256
   "f6d0770c492432432f693c282382d6e7bb91cdf7dc88f5b0024666c06f4a06a1")
  (:PATH "raw/core-compiler-fasl/tests/storage/segment-header.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/storage/segment-header.fasl")
   :BYTES 18222 :SHA256
   "9378cbf3edb36086aede4fe80bddc4fa2bdb9c37152c82d5ff2035dd8c6dae6f")
  (:PATH "raw/core-compiler-fasl/tests/storage/support.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/storage/support.fasl")
   :BYTES 13724 :SHA256
   "17cf2dec9ae2ce13e715e10e9efdb2e0110ab32f94b3b314e718ab55a096249e")
  (:PATH "raw/core-compiler-fasl/tests/wal/builder.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/wal/builder.fasl")
   :BYTES 17400 :SHA256
   "956129dcd053365e01fcba089e7db0581c051471a41626bbe5115232dd24455b")
  (:PATH "raw/core-compiler-fasl/tests/wal/csn-threads.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/wal/csn-threads.fasl")
   :BYTES 27292 :SHA256
   "a85c3a143b593aaf5d0f66eb038b68aa08bd67808e336a8f26dbf705ef6454bb")
  (:PATH "raw/core-compiler-fasl/tests/wal/csn.fasl" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/wal/csn.fasl")
   :BYTES 167872 :SHA256
   "fe9fae7620d985c8b0e5f1e6880cdec885222ced3f3a600c4eed0555e50fbccf")
  (:PATH "raw/core-compiler-fasl/tests/wal/fault.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/wal/fault.fasl")
   :BYTES 28702 :SHA256
   "e3f5ecfd5390078675370d253796ba071076667fd4632b2cde988df2d63b2e07")
  (:PATH "raw/core-compiler-fasl/tests/wal/group.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/wal/group.fasl")
   :BYTES 25476 :SHA256
   "e2c15e73b0f9552f53afd41f2f368ce347a125840539059524c0b7b565658ace")
  (:PATH "raw/core-compiler-fasl/tests/wal/native.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/wal/native.fasl")
   :BYTES 9843 :SHA256
   "a565a20e56f729d96a994525ddfc75fafe4e9d4b7bd86dcdac22f48964ed1c14")
  (:PATH "raw/core-compiler-fasl/tests/wal/support.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/active-core-fasl-R3/tests/wal/support.fasl")
   :BYTES 8022 :SHA256
   "122df42954ecbd09951dde2e01322c1cf1600d90c78726513c94a9b00178bb7f")
  (:PATH "raw/core-native/conservazione.lisp" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912243-command-44484-0/conservazione.lisp")
   :BYTES 1171 :SHA256
   "5ec90aeb2395954ee8dfb61f817431a11be11240d1b263f3b4cab6791c983681")
  (:PATH "raw/core-native/report.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912243-command-44484-0/report.lisp")
   :BYTES 1023063 :SHA256
   "e962dd4a4f0f9cac82fc571c60f3b8d1b2d77b6b7b6b1ae4d9acc7f24a2bc23d")
  (:PATH "raw/core-wrapper/conservazione.lisp" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912239-command-44376-0/conservazione.lisp")
   :BYTES 1171 :SHA256
   "2bd2760cba7b262d0132f4dfa46424bfd79e992863d32b10eb74f124d8d7bb1f")
  (:PATH "raw/core-wrapper/report.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912239-command-44376-0/report.lisp")
   :BYTES 162373 :SHA256
   "e7c96e451f319967f3db4a57a4008472ad64e1c67f527135bff8cadeb55f6c0c")
  (:PATH "raw/coverage-active-command/conservazione.lisp" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912239-command-44377-0/conservazione.lisp")
   :BYTES 1171 :SHA256
   "8af576cdd8c4d8007457504882b82650980dea2a408487b73182d2b9979d9acd")
  (:PATH "raw/coverage-active-command/report.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912239-command-44377-0/report.lisp")
   :BYTES 164291 :SHA256
   "38b52fca6cdcdc322f3e52b056a7d0d3dfd98ff7ec31c51be02f4a3ae4ae6e1f")
  (:PATH "raw/coverage-active/08886c877103e5151906eabea77c9575.html" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/08886c877103e5151906eabea77c9575.html")
   :BYTES 26354 :SHA256
   "bcdf87e44cfffdcf8b6ab5023ae2a22a17c13ba6fd966555537d0dac8135e7e3")
  (:PATH "raw/coverage-active/0aa23f4025e0337fb7f5307fbb899117.html" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/0aa23f4025e0337fb7f5307fbb899117.html")
   :BYTES 11587 :SHA256
   "c18633c936ad7a4f5608a7e8a8e1a018119e62accd5c38cfa18eba28607ae2d9")
  (:PATH "raw/coverage-active/1cc19ee5bd0deee79dff45662cb486b7.html" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/1cc19ee5bd0deee79dff45662cb486b7.html")
   :BYTES 28295 :SHA256
   "162a9e75aef863f76d09be40680451ad25cd8af433faedc461c1946fc6be058b")
  (:PATH "raw/coverage-active/40c7d168ba0ea1fc309ca3ce6b34fd1a.html" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/40c7d168ba0ea1fc309ca3ce6b34fd1a.html")
   :BYTES 24691 :SHA256
   "ee830a2df57f47683f96dd31ee3198cee91ade6bb9d2c67162ccc39c14fa0898")
  (:PATH "raw/coverage-active/48d7e5d744f15d29cd4580202122a6d4.html" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/48d7e5d744f15d29cd4580202122a6d4.html")
   :BYTES 14394 :SHA256
   "974cb0bd930a140f0862e544ab3ed80f66e206f5ea22d89d4e959c72ceaf274f")
  (:PATH "raw/coverage-active/a42adadf7f237f746ecf6c2e2b70ee79.html" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/a42adadf7f237f746ecf6c2e2b70ee79.html")
   :BYTES 42332 :SHA256
   "577966b8f1c8dffae7ba182dae7f2f8c404239653a68c59f90e7aefafdb95fd7")
  (:PATH "raw/coverage-active/a9c69f89eb6ec1a2a3170082af03eb19.html" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/a9c69f89eb6ec1a2a3170082af03eb19.html")
   :BYTES 40405 :SHA256
   "eaf86ade583afe8753f2c9a30e382fad999c3e9b3cd095538bfc8a1244667c00")
  (:PATH "raw/coverage-active/b506946b94531ae2f92eeecb9edbae32.html" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/b506946b94531ae2f92eeecb9edbae32.html")
   :BYTES 32291 :SHA256
   "d6e37c0cc0d22a3513c34e3720e516e75f148839976251c19ec37fad547aaa41")
  (:PATH "raw/coverage-active/bf50a4ed091fbebfb7c4b410eb177e09.html" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/bf50a4ed091fbebfb7c4b410eb177e09.html")
   :BYTES 19690 :SHA256
   "7c08985ce2636210d805613d7c413a19a6c859ee7b18f0d2b05dcd62bba4e373")
  (:PATH "raw/coverage-active/cover-index.html" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/cover-index.html")
   :BYTES 3442 :SHA256
   "e09d0373d1dac9538db4163941ccaaa44be199cbd7c58c7abd67fa6bd1104ef1")
  (:PATH "raw/coverage-active/coverage-state.lisp.gz" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/coverage-state.lisp")
   :BYTES 317321 :SHA256
   "564249c826adb9843c76d96d8ecdc1dbc8a1bc8eb3d1ef46f07047a72496703d" :CODEC
   :GZIP :UNCOMPRESSED-BYTES 2229801 :UNCOMPRESSED-SHA256
   "10a840d8f1cae57ab3321f30d00b1628a13b6035063a36684ad954dc060b5e1f")
  (:PATH "raw/coverage-active/coverage-summary.lisp" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/coverage-summary.lisp")
   :BYTES 3662 :SHA256
   "32e4d41b00ddebc52d9d9f9bb52cc6546a5d2c61734195bf2c1c82501ce5d9b2")
  (:PATH "raw/coverage-active/f401cff467fa42820114331f1415a7d8.html" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/f401cff467fa42820114331f1415a7d8.html")
   :BYTES 17848 :SHA256
   "5e3675b6ca99ef51f535f023b96bf9c4779ed5ddaf02fb38c8114ab0e59883be")
  (:PATH "raw/coverage-active/fasl/src/cache/build.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/cache/build.fasl")
   :BYTES 14451 :SHA256
   "a6765908aee9c524dc7e3bacb3c6113bb552069214b62348b201085c50a937b2")
  (:PATH "raw/coverage-active/fasl/src/cache/clock.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/cache/clock.fasl")
   :BYTES 7950 :SHA256
   "eaa53542d4eefbe22b1a0ec0ebb272bd255b674837a90656cf83091e32fd0f06")
  (:PATH "raw/coverage-active/fasl/src/cache/core.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/cache/core.fasl")
   :BYTES 10953 :SHA256
   "acb3a3484600b46d28d15139a1a98d864d2280f369f4a59f7547670a97a6fc1f")
  (:PATH "raw/coverage-active/fasl/src/cache/package.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/cache/package.fasl")
   :BYTES 1226 :SHA256
   "5203bacb5495652c46e4f3784a781e9becf4425ba0b82b4965d389d10b8a1301")
  (:PATH "raw/coverage-active/fasl/src/cache/read.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/cache/read.fasl")
   :BYTES 18378 :SHA256
   "a9b10bcf83fc02246ed87a1e44d64b55043d67965ad74dd0252755e3e4892bcc")
  (:PATH "raw/coverage-active/fasl/src/cache/types.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/cache/types.fasl")
   :BYTES 20970 :SHA256
   "91451b2c5e88acbc7fe5409e124607fa0f379e8670691523cd004ff529dda49c")
  (:PATH "raw/coverage-active/fasl/src/cache/write.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/cache/write.fasl")
   :BYTES 14806 :SHA256
   "2d03e1dd2d734f5399f4d8134abcabb2f08fa0f235640641db634aecb986b86f")
  (:PATH "raw/coverage-active/fasl/src/codec/cbor-float-minimal.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/codec/cbor-float-minimal.fasl")
   :BYTES 8601 :SHA256
   "7883c6d2aa9a31290c86199db1285af26f10eb7948ee468ab0c2c80c6e4c3825")
  (:PATH "raw/coverage-active/fasl/src/codec/cbor-float-narrow.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/codec/cbor-float-narrow.fasl")
   :BYTES 10235 :SHA256
   "8f86fb800f657a91553ceadac6dfb1165cc19f7dc1c45e82388010bb26748281")
  (:PATH "raw/coverage-active/fasl/src/codec/cbor-float-write.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/codec/cbor-float-write.fasl")
   :BYTES 12244 :SHA256
   "197e9e66e9a7d754df8b75fbcbba714c517859a463a3771a84d9d8e840d52ae3")
  (:PATH "raw/coverage-active/fasl/src/codec/cbor-header.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/codec/cbor-header.fasl")
   :BYTES 13884 :SHA256
   "561764bb5179559b680856897a2c4f792ce85973d5d7dcc2e17e7426b8dabf71")
  (:PATH "raw/coverage-active/fasl/src/codec/cbor-minimal.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/codec/cbor-minimal.fasl")
   :BYTES 10152 :SHA256
   "4cfd414c0bc45b9c2736aaf5a8bf243b86316601841fa7f9ec6b7c22b29a6109")
  (:PATH "raw/coverage-active/fasl/src/codec/cbor-package.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/codec/cbor-package.fasl")
   :BYTES 1227 :SHA256
   "dab41111475cecd21a0b6a3bdce966c487f34aa2bbab94c4d06e58aafbd8724b")
  (:PATH "raw/coverage-active/fasl/src/codec/cbor-scan-input.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/codec/cbor-scan-input.fasl")
   :BYTES 5856 :SHA256
   "41e216667ccf30fb226a9517667f67941636ecb0b6e2c313288030670406d7b6")
  (:PATH "raw/coverage-active/fasl/src/codec/cbor-scan-items.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/codec/cbor-scan-items.fasl")
   :BYTES 19504 :SHA256
   "9e1ab167f83ec7b3c6307ca6e217b56ad6bf5fbc676fbcf10a538879162875f4")
  (:PATH "raw/coverage-active/fasl/src/codec/cbor-scan-minimal.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/codec/cbor-scan-minimal.fasl")
   :BYTES 3206 :SHA256
   "a0879ab6858c2a495fdc2f7443963009ca4c4d62ae61fd1701584e0d5c70373c")
  (:PATH "raw/coverage-active/fasl/src/codec/cbor-scan-stack.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/codec/cbor-scan-stack.fasl")
   :BYTES 14667 :SHA256
   "81219896092178e8c787c569fb1bebae7a4ef92c5a7fc36aac2084f3c50240a1")
  (:PATH "raw/coverage-active/fasl/src/codec/cbor-scan.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/codec/cbor-scan.fasl")
   :BYTES 13422 :SHA256
   "a63125bf21dd5bb7e3831b74d3fa94f629070f4edb7231a6749cc5b3c2e45270")
  (:PATH "raw/coverage-active/fasl/src/codec/cbor-simple-write.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/codec/cbor-simple-write.fasl")
   :BYTES 6707 :SHA256
   "55cbff7c8009b444e3cc1edace0e6e0380304de17b0e1051745f30862487597f")
  (:PATH "raw/coverage-active/fasl/src/codec/cbor-space.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/codec/cbor-space.fasl")
   :BYTES 14699 :SHA256
   "e9753314506c349685d186333946371154619980e0be2a831885bd04edd52a3d")
  (:PATH "raw/coverage-active/fasl/src/codec/cbor-string-write.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/codec/cbor-string-write.fasl")
   :BYTES 17298 :SHA256
   "dc43a0198c82efb1b88f3e22f48ea16c4fe858c1ee40f512ecec383457b08f6f")
  (:PATH "raw/coverage-active/fasl/src/codec/cbor-write.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/codec/cbor-write.fasl")
   :BYTES 13498 :SHA256
   "b567b7b23a8bae8216685434cfa8fb8c1e2a84833ba3bea44952c8c459eee18c")
  (:PATH "raw/coverage-active/fasl/src/codec/package.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/codec/package.fasl")
   :BYTES 995 :SHA256
   "2cc6fb5dd8d5860956bb862b17fab08b7baa37e97213fafed3d2cd2ad9cf470e")
  (:PATH "raw/coverage-active/fasl/src/codec/utf8.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/codec/utf8.fasl")
   :BYTES 16204 :SHA256
   "77ce477db41bb9667aa2a548b66e5e42a995ebcc8b1f18c2f261c1c04e1eab89")
  (:PATH "raw/coverage-active/fasl/src/csn/package.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/csn/package.fasl")
   :BYTES 1028 :SHA256
   "6c6b581f9f8f5a1343712eefd53ebcfa7728c92da4dc2aa5adda57e24d273729")
  (:PATH "raw/coverage-active/fasl/src/csn/registry.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/csn/registry.fasl")
   :BYTES 41579 :SHA256
   "a8cd577365e6fad80f17728729752c462aa239f7cb4d432aba036c3fed2e90c7")
  (:PATH "raw/coverage-active/fasl/src/epochs/core.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/epochs/core.fasl")
   :BYTES 15737 :SHA256
   "c0273831df86fe695e3764aac507da3070b581e9d4a717f046bf75433018e86e")
  (:PATH "raw/coverage-active/fasl/src/epochs/package.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/epochs/package.fasl")
   :BYTES 1253 :SHA256
   "9eb30b8d67786251ff70694a16207855602667b166a13bf3a369aa880fa286bc")
  (:PATH "raw/coverage-active/fasl/src/epochs/read.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/epochs/read.fasl")
   :BYTES 7407 :SHA256
   "06456e52f23aa042c4a43ad8b88d2ca1477cfa123bc95009004ad2cf2d3b1e47")
  (:PATH "raw/coverage-active/fasl/src/epochs/reclaim.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/epochs/reclaim.fasl")
   :BYTES 16043 :SHA256
   "3a6a4e6ddc63f1f3109a1fed337847bb79e3839aa3c3674bdc6af6ce722f4948")
  (:PATH "raw/coverage-active/fasl/src/epochs/retire.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/epochs/retire.fasl")
   :BYTES 14472 :SHA256
   "a69cf679ebca35a7abf96f56f13b2d1bf76c7b774c835a9de0e39088fa49730a")
  (:PATH "raw/coverage-active/fasl/src/epochs/types.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/epochs/types.fasl")
   :BYTES 29337 :SHA256
   "b9ca75d2ab84e19b535d44bc45ca7db4c2e6d9f4ae1de88b59a546def8082cfd")
  (:PATH "raw/coverage-active/fasl/src/execution/handoff.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/execution/handoff.fasl")
   :BYTES 21399 :SHA256
   "4a631af618dfcdb6576e378a2d6c15dca99c2e1084432d5191032c0001d8357e")
  (:PATH "raw/coverage-active/fasl/src/execution/package.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/execution/package.fasl")
   :BYTES 1664 :SHA256
   "b5c0f74b203be5ef79d3df249811edc497d4b413a0ce21c5e382df3f84fa0aaf")
  (:PATH "raw/coverage-active/fasl/src/execution/queue.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/execution/queue.fasl")
   :BYTES 23889 :SHA256
   "895a1f8a15f87056460a46aa20b72d107c5cc6805faec2510018dd8ce8cd405c")
  (:PATH "raw/coverage-active/fasl/src/execution/ready-recycle.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/execution/ready-recycle.fasl")
   :BYTES 7013 :SHA256
   "0c3f319dc64dfd0f73cc32923c59d45bb9d3f1e9ecf4e8a7fae970f23cf85f3d")
  (:PATH "raw/coverage-active/fasl/src/execution/ready-types.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/execution/ready-types.fasl")
   :BYTES 20709 :SHA256
   "2e85980b3d4584109b2f7e432ffcb8afe30c1545a96eac3cef3f5268965df79a")
  (:PATH "raw/coverage-active/fasl/src/execution/ready.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/execution/ready.fasl")
   :BYTES 14443 :SHA256
   "7a2c262577aee387b1c2af1e01a7ba90714e6bcf3d1d2035fbb8330b5689479d")
  (:PATH "raw/coverage-active/fasl/src/execution/worker-boundary.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/execution/worker-boundary.fasl")
   :BYTES 7925 :SHA256
   "6de88a8087e5bbd310910babfc0548c4641281d013d29689c545bd2abd437918")
  (:PATH "raw/coverage-active/fasl/src/execution/worker-claim.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/execution/worker-claim.fasl")
   :BYTES 17054 :SHA256
   "b63ce120961ed8ffec00ce04344c76b8b345d20f9a7dc48d4426a39cdd0f3cda")
  (:PATH "raw/coverage-active/fasl/src/execution/worker-run.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/execution/worker-run.fasl")
   :BYTES 13132 :SHA256
   "9f2e3ee2cf70a36e7ec2880950f17b08ea10ef6e282db1cc802e0e338bae4b1f")
  (:PATH "raw/coverage-active/fasl/src/execution/worker-types.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/execution/worker-types.fasl")
   :BYTES 29017 :SHA256
   "6392822e69186068f9b491725377b273ef02201d4b0be1775f8702548d762462")
  (:PATH "raw/coverage-active/fasl/src/execution/writer.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/execution/writer.fasl")
   :BYTES 14983 :SHA256
   "e67b5342099c8ec525e10323f0ec326d711c2964f98b53f36af94b0cdb58b8d4")
  (:PATH "raw/coverage-active/fasl/src/foundation/batch.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/foundation/batch.fasl")
   :BYTES 15593 :SHA256
   "faa997580ac7aba00de6bc43ac148689a63cedce84d52c7e727851d988ccaafc")
  (:PATH "raw/coverage-active/fasl/src/foundation/binary.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/foundation/binary.fasl")
   :BYTES 12239 :SHA256
   "31707191f1ec97dadeba22f78451da6d004ec502947345d356b77c19559df835")
  (:PATH "raw/coverage-active/fasl/src/foundation/conditions.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/foundation/conditions.fasl")
   :BYTES 6842 :SHA256
   "dfa239dcda38f31ac5f67668a9a304d42e6defde653da70c74ade3f8cd2e52e7")
  (:PATH "raw/coverage-active/fasl/src/foundation/crc32c.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/foundation/crc32c.fasl")
   :BYTES 7400 :SHA256
   "7e171faffa9876befadcca0bfa9acbd4bca9db9bb79f66e2637b7d17696f1c24")
  (:PATH "raw/coverage-active/fasl/src/foundation/package.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/foundation/package.fasl")
   :BYTES 2190 :SHA256
   "c8de29b35717b96c6ab9210c8cd4b5cd586326a7b852afffac53554674a24943")
  (:PATH "raw/coverage-active/fasl/src/foundation/record.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/foundation/record.fasl")
   :BYTES 54568 :SHA256
   "258866449f3729d1074a05f8a2590375ccc40b3e33f453bde86e8d4c23921227")
  (:PATH "raw/coverage-active/fasl/src/get-directory/build.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/get-directory/build.fasl")
   :BYTES 9749 :SHA256
   "fe169f2a17ecfbd7cf80a19720eed035e6baa68e0c30f5ff437dc9ccef875337")
  (:PATH "raw/coverage-active/fasl/src/get-directory/package.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/get-directory/package.fasl")
   :BYTES 2161 :SHA256
   "28b145372ee091b22cec4a1048ed09bb01ca1393484053ebca5cb1b09fc1908d")
  (:PATH "raw/coverage-active/fasl/src/get-directory/read.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/get-directory/read.fasl")
   :BYTES 9939 :SHA256
   "3f941d0beef62f50dd5e66198332a1faf17faabc4f127b14b48972861eaf2502")
  (:PATH "raw/coverage-active/fasl/src/get-directory/sources-read.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/get-directory/sources-read.fasl")
   :BYTES 11594 :SHA256
   "5844278f6eed3d9543df2c5a39ae7bc17010c22e7b3ea877646987b1d2b5e33b")
  (:PATH "raw/coverage-active/fasl/src/get-directory/sources-types.fasl"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/get-directory/sources-types.fasl")
   :BYTES 13709 :SHA256
   "d18b54bc558f97bca4407b558c4aeb79c9ad1bf98e8b139a5b69e7891e0be123")
  (:PATH "raw/coverage-active/fasl/src/get-directory/types.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/get-directory/types.fasl")
   :BYTES 7845 :SHA256
   "930894daf2a7a848ac8f1700ae02fc9e411cbd16a075becbbd52032c1c0ee824")
  (:PATH "raw/coverage-active/fasl/src/get-resolver/active-build.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/get-resolver/active-build.fasl")
   :BYTES 21178 :SHA256
   "72d0e268a6939aa293f611e79e7f3e5774c58b0590bb070582a4ab88c0ca5200")
  (:PATH "raw/coverage-active/fasl/src/get-resolver/active-directory.fasl"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/get-resolver/active-directory.fasl")
   :BYTES 11089 :SHA256
   "91097fdc9101ac89b97a22c055347d227eb05f9fe2c09b7f45ff6a897572abed")
  (:PATH "raw/coverage-active/fasl/src/get-resolver/active-preflight.fasl"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/get-resolver/active-preflight.fasl")
   :BYTES 13749 :SHA256
   "d93805ed9a726c70855dc3fd00ebe7e8e526a3c5017b96ffd5a9fd28c6d1d8b4")
  (:PATH "raw/coverage-active/fasl/src/get-resolver/active-read.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/get-resolver/active-read.fasl")
   :BYTES 9333 :SHA256
   "54afb01b964ecea9ddb5fde9ddf842bdecb370fa3c9cf339ebc94d827ad0b711")
  (:PATH "raw/coverage-active/fasl/src/get-resolver/active-scan.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/get-resolver/active-scan.fasl")
   :BYTES 14248 :SHA256
   "cbd2162eb4f594da774a46552805d4448cd1162b91f5d29234598ac07d5a1f73")
  (:PATH "raw/coverage-active/fasl/src/get-resolver/active-types.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/get-resolver/active-types.fasl")
   :BYTES 19491 :SHA256
   "2599f8d36cfa514a4e02a1096ac64d4865923c037f75b779932bd06fac313584")
  (:PATH "raw/coverage-active/fasl/src/get-resolver/build.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/get-resolver/build.fasl")
   :BYTES 17041 :SHA256
   "9c6cdece2987be5df9dec25fc10c58336c3624264218f2ce4573028bce811a60")
  (:PATH "raw/coverage-active/fasl/src/get-resolver/package.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/get-resolver/package.fasl")
   :BYTES 2665 :SHA256
   "f5a6a891e52886d16f563ee333ec987dd5d30f85d7137995657a74dcab43a864")
  (:PATH "raw/coverage-active/fasl/src/get-resolver/read.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/get-resolver/read.fasl")
   :BYTES 16778 :SHA256
   "dbe095ea5af14b96df5e74b244fa92cd226259925c1d3fb1941e9127707348e2")
  (:PATH "raw/coverage-active/fasl/src/get-resolver/rows.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/get-resolver/rows.fasl")
   :BYTES 9419 :SHA256
   "831fa4aeac704f4a9d2937d87473c8b5171b334017640e32448f40216fc1964e")
  (:PATH "raw/coverage-active/fasl/src/get-resolver/scan.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/get-resolver/scan.fasl")
   :BYTES 18229 :SHA256
   "e29d07debfd03b36fa18263c9079f13e1f8f949d8748a4a2eabfb754f4038346")
  (:PATH "raw/coverage-active/fasl/src/get-resolver/sort.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/get-resolver/sort.fasl")
   :BYTES 18735 :SHA256
   "6359bb5179db5666c243f80bc2ba3202c9bd438e6382e4768d0ce0170772f7b4")
  (:PATH "raw/coverage-active/fasl/src/get-resolver/types.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/get-resolver/types.fasl")
   :BYTES 8444 :SHA256
   "ee30bf60c6f797d812ce83ce73618fbb6120d2c531cb2250338d65e035ce1897")
  (:PATH "raw/coverage-active/fasl/src/get/build.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/get/build.fasl")
   :BYTES 10163 :SHA256
   "1edce2a06993d9624b9a9f46c8d52e1ad37cb6372866bf13a7e94bdf26c873fd")
  (:PATH "raw/coverage-active/fasl/src/get/lifecycle.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/get/lifecycle.fasl")
   :BYTES 13460 :SHA256
   "bfe8a57bf3a5472a9d6a6ba3cf51e9c5a8d65cecc25f5b1ef12964f89a104bf9")
  (:PATH "raw/coverage-active/fasl/src/get/lookup.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/get/lookup.fasl")
   :BYTES 16880 :SHA256
   "16816cff95a37f9da52c76b00d9c2d783c780147b5060302226caceaa5dd64fd")
  (:PATH "raw/coverage-active/fasl/src/get/package.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/get/package.fasl")
   :BYTES 2218 :SHA256
   "c7e2b58e6ad230bfaacd03e5e357a316a6bb0fa15ff289c18d9cb32740d2236b")
  (:PATH "raw/coverage-active/fasl/src/get/segment.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/get/segment.fasl")
   :BYTES 18536 :SHA256
   "eaae452a6e133fa392a0099986e841a46b625b47186ed652382ab01755598c06")
  (:PATH "raw/coverage-active/fasl/src/get/target.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/get/target.fasl")
   :BYTES 13161 :SHA256
   "3e3b8b107ff8b63b7023856c0860c16adb0309ac7cd0adb5e2eeec2ea9f36da1")
  (:PATH "raw/coverage-active/fasl/src/get/types.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/get/types.fasl")
   :BYTES 34983 :SHA256
   "5365883132b8c181bdb82536bf5d3849c01c7242fdaa39bad40fa054c59575d3")
  (:PATH "raw/coverage-active/fasl/src/hash/arithmetic.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/hash/arithmetic.fasl")
   :BYTES 9929 :SHA256
   "367bb2f80b9cd3e603892d18bc851f07ca446acfbbb7db5c94d451b4f98710bb")
  (:PATH "raw/coverage-active/fasl/src/hash/blocks.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/hash/blocks.fasl")
   :BYTES 13041 :SHA256
   "d86a45c09d585d8c78b1200814e5a603ad586465da63dcb1afa5f6296334e65a")
  (:PATH "raw/coverage-active/fasl/src/hash/hash64.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/hash/hash64.fasl")
   :BYTES 9051 :SHA256
   "cc8f6807a159348fc906f26e96ed71c261f4d3e2938e0c8b1947f40763653c8a")
  (:PATH "raw/coverage-active/fasl/src/hash/package.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/hash/package.fasl")
   :BYTES 1003 :SHA256
   "6fdf177ea2eb76a1903755471c1830c60ef43fbb5f20b1219676bdb5208cdb78")
  (:PATH "raw/coverage-active/fasl/src/index/core.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/index/core.fasl")
   :BYTES 8098 :SHA256
   "90bc0a40718b8fef2a2406e3d18ed14175dd4203ca8eed24f0dbc22c885e95d1")
  (:PATH "raw/coverage-active/fasl/src/index/hash-digests.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/index/hash-digests.fasl")
   :BYTES 9768 :SHA256
   "f46412b49571ae24da9f97f12fbb34f0ba1f325edb38dd6e8c741fc9bb9c24c4")
  (:PATH "raw/coverage-active/fasl/src/index/hash-seed.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/index/hash-seed.fasl")
   :BYTES 6513 :SHA256
   "e1c2f88a02d9013485a70a38946f3b67fda21a087b02099e14ef8daed443b6d7")
  (:PATH "raw/coverage-active/fasl/src/index/package.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/index/package.fasl")
   :BYTES 1198 :SHA256
   "8277092aa6da6f94d02c9778c47c59db66a515f62aee059c34ede47a4f7d8f51")
  (:PATH "raw/coverage-active/fasl/src/index/primary-arena.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/index/primary-arena.fasl")
   :BYTES 10765 :SHA256
   "2b3639fd262081f584eba5650d896318e50fce422d597ce93e6282b693905a3a")
  (:PATH "raw/coverage-active/fasl/src/index/primary-build.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/index/primary-build.fasl")
   :BYTES 16295 :SHA256
   "260788e444ca3520dbfafc48d2fba32d7a4d2913f73bf94fa92e629bbce4d9ca")
  (:PATH "raw/coverage-active/fasl/src/index/primary-core.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/index/primary-core.fasl")
   :BYTES 11771 :SHA256
   "dcad200967aff59af836f228045df32732e46c0b7cec0017ed7bccfecf0e6ce7")
  (:PATH "raw/coverage-active/fasl/src/index/primary-directory.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/index/primary-directory.fasl")
   :BYTES 22876 :SHA256
   "b4d7345dfb7a7840aa9a5432bab3deea6e725a7c2fcc74b16155e7fae1222b95")
  (:PATH "raw/coverage-active/fasl/src/index/primary-package.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/index/primary-package.fasl")
   :BYTES 1773 :SHA256
   "a3c12e9317b05499ba0e61e4819c82172bef46529c413012d3cb70c57d971d3f")
  (:PATH "raw/coverage-active/fasl/src/index/primary-probe.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/index/primary-probe.fasl")
   :BYTES 22100 :SHA256
   "7d847b8567112eaf04624378726287a1788eead9f6a7f9ca0d3c75bf6713c105")
  (:PATH "raw/coverage-active/fasl/src/index/primary-read.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/index/primary-read.fasl")
   :BYTES 11408 :SHA256
   "87be4ec99bef73631c26d72c86d684683a8a43276817a3cd13fd59a6d9f6d092")
  (:PATH "raw/coverage-active/fasl/src/index/primary-relocate.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/index/primary-relocate.fasl")
   :BYTES 15953 :SHA256
   "09f127a651e16b3c06cda552077bead6924685aebd9a7155af08257157e3fd0b")
  (:PATH "raw/coverage-active/fasl/src/index/primary-types.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/index/primary-types.fasl")
   :BYTES 41276 :SHA256
   "188a0844559e25617f218647e15d1e767a15ea7e5b755f5b850ac6d33a179b89")
  (:PATH "raw/coverage-active/fasl/src/index/primary-write.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/index/primary-write.fasl")
   :BYTES 23967 :SHA256
   "232aa46271c10fafc3c6ad17cc60d903d50eae6fda4eff765f142c097b0d6cf9")
  (:PATH "raw/coverage-active/fasl/src/index/read.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/index/read.fasl")
   :BYTES 11145 :SHA256
   "ad96f749cc4e061da36ccce9e9d977ea803cef0ec3ca205592359e92f9de6527")
  (:PATH "raw/coverage-active/fasl/src/index/rebuild-budget.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/index/rebuild-budget.fasl")
   :BYTES 10024 :SHA256
   "bb071aac4c8885b042d3137093d75b30483143e56d92fbb58a49b335b044c28b")
  (:PATH "raw/coverage-active/fasl/src/index/rebuild-copy.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/index/rebuild-copy.fasl")
   :BYTES 12320 :SHA256
   "2d9a37a259cf6cc8717db4d2d322a1643b2aba07ae99880fc50ca27e6dfb7461")
  (:PATH "raw/coverage-active/fasl/src/index/rebuild-scan.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/index/rebuild-scan.fasl")
   :BYTES 18807 :SHA256
   "d1d819be536d26e61ad7ad38ea8e69d30aae8f675f6413fee79a053fbced54af")
  (:PATH "raw/coverage-active/fasl/src/index/rebuild.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/index/rebuild.fasl")
   :BYTES 6298 :SHA256
   "0bd4bcd8e67d1a386b76e48bbf6050d2c9fb4b5860a5ece7be027a8ffa69b2f5")
  (:PATH "raw/coverage-active/fasl/src/index/relocate.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/index/relocate.fasl")
   :BYTES 11587 :SHA256
   "621b655ee451431456b51644e23399d9393ab72df6f22208e7ffb4a0e0bd681e")
  (:PATH "raw/coverage-active/fasl/src/index/types.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/index/types.fasl")
   :BYTES 12012 :SHA256
   "041cc79dd3b486c732baacca5959f4cc9e6006f52836ade78f34e315d0b42090")
  (:PATH "raw/coverage-active/fasl/src/index/validation.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/index/validation.fasl")
   :BYTES 13508 :SHA256
   "a83370aeb172fe0b1d50f8d4305498c8e2b6b7f1f5d18ed3bb8d359e806b6db9")
  (:PATH "raw/coverage-active/fasl/src/index/write.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/index/write.fasl")
   :BYTES 20653 :SHA256
   "613dea87c4843c90561ae968ce88bed4f2bd7c03156937beb0827f3e88cc9304")
  (:PATH "raw/coverage-active/fasl/src/io/flush.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/io/flush.fasl")
   :BYTES 4968 :SHA256
   "590203505a6811c5882c4f8cd0b93083786ad052449e4987c46acb12033c0a8b")
  (:PATH "raw/coverage-active/fasl/src/io/identity-types.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/io/identity-types.fasl")
   :BYTES 4889 :SHA256
   "12ad0a46e7d93d8ae49b8db462bf3ba5d0b3becc3a321ac53faaacec4041ee8e")
  (:PATH "raw/coverage-active/fasl/src/io/identity.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/io/identity.fasl")
   :BYTES 8955 :SHA256
   "14091c42084691f832ff903699bf3b177d49fcd49f2330133c14a3338e3ddbb5")
  (:PATH "raw/coverage-active/fasl/src/io/lifecycle.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/io/lifecycle.fasl")
   :BYTES 15000 :SHA256
   "9ebd58d0d51d20234ff8a209332ae61d6c3b6b915a14b540acbe0fd73fc25062")
  (:PATH "raw/coverage-active/fasl/src/io/native.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/io/native.fasl")
   :BYTES 26778 :SHA256
   "78364b7103e51f6dc74814e7001a601cde5546adf66cf35ff18bb39196d013f9")
  (:PATH "raw/coverage-active/fasl/src/io/package.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/io/package.fasl")
   :BYTES 1289 :SHA256
   "70d45878f9eb572ca850c064848079cfc693b5bcbab35183b90fcd98e47c62d5")
  (:PATH "raw/coverage-active/fasl/src/io/transfer.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/io/transfer.fasl")
   :BYTES 18895 :SHA256
   "e3e6bf5687587300d61b8e70c1e3b77ec6348a819d64be606bc9ab6c6bc0e395")
  (:PATH "raw/coverage-active/fasl/src/io/types.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/io/types.fasl")
   :BYTES 25427 :SHA256
   "90b9d523b59ff928016ea07ab344397b1cf639df85636c889c63abef604e57a2")
  (:PATH "raw/coverage-active/fasl/src/mvcc/package.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/mvcc/package.fasl")
   :BYTES 1366 :SHA256
   "df832b6c1a57690c22834ed169867d562e3c81b26638bedf0518935e33262f22")
  (:PATH "raw/coverage-active/fasl/src/mvcc/snapshots-core.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/mvcc/snapshots-core.fasl")
   :BYTES 18566 :SHA256
   "ff845d52348bb6f7fdfe864660a86f15b237c699ca5c28a2f3e62f01054cbc68")
  (:PATH "raw/coverage-active/fasl/src/mvcc/snapshots-csn.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/mvcc/snapshots-csn.fasl")
   :BYTES 8062 :SHA256
   "1d559d3bedd5ebe0bbb7393ef1706803a3ffa59db67595fc0bdc8e00cb9c6f0a")
  (:PATH "raw/coverage-active/fasl/src/mvcc/snapshots-lifecycle.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/mvcc/snapshots-lifecycle.fasl")
   :BYTES 16945 :SHA256
   "a553db065064c545439b52d8303e85e9c3d32e0a880f8cd559f24834f8bf7b64")
  (:PATH "raw/coverage-active/fasl/src/mvcc/snapshots-read.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/mvcc/snapshots-read.fasl")
   :BYTES 19646 :SHA256
   "cca8c72de4f5203dfc6e818fb21e0f176e8adb25c058fcaa57e1c6f6346f1ac8")
  (:PATH "raw/coverage-active/fasl/src/mvcc/snapshots-register.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/mvcc/snapshots-register.fasl")
   :BYTES 15818 :SHA256
   "7148fd168c58b6b7832b28250629f214cadc9f09fd104dab6239e43bd23ea738")
  (:PATH "raw/coverage-active/fasl/src/mvcc/snapshots-types.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/mvcc/snapshots-types.fasl")
   :BYTES 25800 :SHA256
   "b2ce32b0d04c44d7e617f3498fc2f0b9200ca27b24c32c2c4729c62a83cdf219")
  (:PATH "raw/coverage-active/fasl/src/mvcc/types.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/mvcc/types.fasl")
   :BYTES 1554 :SHA256
   "6adf714918b316e061a64815068e5d1e9724eba3feed668560ff8218338ced93")
  (:PATH "raw/coverage-active/fasl/src/package.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/package.fasl")
   :BYTES 1504 :SHA256
   "4ef37278007a91cdd54593d7acdc6fa5e934bba51b9501949050d23c127ba00f")
  (:PATH "raw/coverage-active/fasl/src/read/core.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/read/core.fasl")
   :BYTES 10004 :SHA256
   "a2569b0d5dfdff9140a7b666fdaa6af7e0701a9c3955407ce007188893fbfa4c")
  (:PATH "raw/coverage-active/fasl/src/read/package.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/read/package.fasl")
   :BYTES 1258 :SHA256
   "02845cd7240bde850a61882a146826d32e432ac7b32043d405711b16d2de167b")
  (:PATH "raw/coverage-active/fasl/src/read/task.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/read/task.fasl")
   :BYTES 20681 :SHA256
   "af134eb1e57eb2412425756dcebc961e592e7291b82ff2b2f51e27e63ad43b16")
  (:PATH "raw/coverage-active/fasl/src/read/types.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/read/types.fasl")
   :BYTES 11219 :SHA256
   "32d07699281e0cf199a54d4f292abede9219ac6c5935c8edfb398451a20d3c3e")
  (:PATH "raw/coverage-active/fasl/src/recovery/decisions-build.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/recovery/decisions-build.fasl")
   :BYTES 29766 :SHA256
   "e49642f259a7a1843477b29d5f25f91a598fa9f2bd66043515432c9bfcd645f6")
  (:PATH "raw/coverage-active/fasl/src/recovery/decisions-package.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/recovery/decisions-package.fasl")
   :BYTES 1357 :SHA256
   "e3982bbf95261630120fa283eac143e9666172249e968b8ddd61530af486b267")
  (:PATH "raw/coverage-active/fasl/src/recovery/decisions-query.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/recovery/decisions-query.fasl")
   :BYTES 11758 :SHA256
   "9629c287c15319d00bccddff354ef03ddb3e3753f6d306e283062bdfd3348530")
  (:PATH "raw/coverage-active/fasl/src/recovery/decisions-radix.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/recovery/decisions-radix.fasl")
   :BYTES 25771 :SHA256
   "060e70973b6023029d3a23adc946c4932e6af88a6886354d216c66febd1aca46")
  (:PATH "raw/coverage-active/fasl/src/recovery/decisions-sort.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/recovery/decisions-sort.fasl")
   :BYTES 24535 :SHA256
   "991fe45e0b1f069fd97cc5981d24dad0dd79207d5318e92b2c22389daa4f7039")
  (:PATH "raw/coverage-active/fasl/src/recovery/decisions-types.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/recovery/decisions-types.fasl")
   :BYTES 12711 :SHA256
   "d533b1e96b6265f4d71a25399f97fbbfac720536a58d2af106bb85a2ce24916b")
  (:PATH "raw/coverage-active/fasl/src/recovery/inventory-build.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/recovery/inventory-build.fasl")
   :BYTES 24704 :SHA256
   "753335771367ad7dcf7289ce697c26bfc0ce5ee580b55c15dae90390af101b36")
  (:PATH "raw/coverage-active/fasl/src/recovery/inventory-query.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/recovery/inventory-query.fasl")
   :BYTES 4612 :SHA256
   "c16c7a8ee3454a45df5049dcf1b91d19329d7cdf0126d685e19a4035741fbf70")
  (:PATH "raw/coverage-active/fasl/src/recovery/inventory-types.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/recovery/inventory-types.fasl")
   :BYTES 16469 :SHA256
   "37e4ea0ccf72772d3f9fc1b67cc7bde1ebac742541bbeb4c9532a3870fe85b46")
  (:PATH "raw/coverage-active/fasl/src/recovery/manifest-build.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/recovery/manifest-build.fasl")
   :BYTES 25784 :SHA256
   "055ed1c049529155a4ea64737ace51a3e8bdd4159977b9fb082a9f02b6f9d4d5")
  (:PATH "raw/coverage-active/fasl/src/recovery/manifest-decode.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/recovery/manifest-decode.fasl")
   :BYTES 17422 :SHA256
   "c0c1d3c442e4d277a9a06487536039042e3038f8899c89b72f7a983eb7e4df40")
  (:PATH "raw/coverage-active/fasl/src/recovery/manifest-fold.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/recovery/manifest-fold.fasl")
   :BYTES 22645 :SHA256
   "11ecb1c607f8ef762853bb2c1f2aba34b038d10dd3ec6774883f48bacc84eeaf")
  (:PATH "raw/coverage-active/fasl/src/recovery/manifest-package.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/recovery/manifest-package.fasl")
   :BYTES 1794 :SHA256
   "87fdc4353d48370aaa37536ce1384c6b9c825ad944be33a9029f06c8ddb8d1c9")
  (:PATH "raw/coverage-active/fasl/src/recovery/manifest-query.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/recovery/manifest-query.fasl")
   :BYTES 8588 :SHA256
   "9b619a100712068d21c3011ee5890ebe44f6d1fe3a80a0c8c92d301356291041")
  (:PATH "raw/coverage-active/fasl/src/recovery/manifest-types.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/recovery/manifest-types.fasl")
   :BYTES 34317 :SHA256
   "fc915fc13971cb5b999d9fa830bb3a13fc060bf0f2eb71919ac8972034650530")
  (:PATH "raw/coverage-active/fasl/src/recovery/package.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/recovery/package.fasl")
   :BYTES 1400 :SHA256
   "635a04e355513b30ca6e867e018035ef6ea36c938b67fe18a19bc9636eabe7a2")
  (:PATH "raw/coverage-active/fasl/src/recovery/scan.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/recovery/scan.fasl")
   :BYTES 37046 :SHA256
   "60dcbf1714f9f254ed56c620509490c3f3d44e0b8eac9f894bf2c2c5597b5507")
  (:PATH "raw/coverage-active/fasl/src/scheduler/build.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/scheduler/build.fasl")
   :BYTES 5656 :SHA256
   "ddfcbb8377a410cc20577f97824b5dc762d53ddf0b26a3c6443f5035e5cbb118")
  (:PATH "raw/coverage-active/fasl/src/scheduler/package.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/scheduler/package.fasl")
   :BYTES 1003 :SHA256
   "641b7867dbe74cc95887bbf818c44babd430fa9688bcc8b13348c343a95b96f6")
  (:PATH "raw/coverage-active/fasl/src/scheduler/policy.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/scheduler/policy.fasl")
   :BYTES 6989 :SHA256
   "737b7200ce334615aebd3d6b0c2c1aad757fbe617d2fedeaebb1591ee1ee8d3c")
  (:PATH "raw/coverage-active/fasl/src/scheduler/read.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/scheduler/read.fasl")
   :BYTES 4559 :SHA256
   "f8c0a1a02792e91b608694e151b2340c56d4c4450a8c312ddb0c8fd36c85e038")
  (:PATH "raw/coverage-active/fasl/src/scheduler/types.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/scheduler/types.fasl")
   :BYTES 18693 :SHA256
   "5502991242c560ee1c69fa46a0dbb74a45d80eb0504eaaca81e1f597f4310269")
  (:PATH "raw/coverage-active/fasl/src/scheduler/update.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/scheduler/update.fasl")
   :BYTES 7169 :SHA256
   "1e132bbf1a4dffe1457bb6614426853d2f8fa1e1f5bfb8094e29fef31a1afac1")
  (:PATH "raw/coverage-active/fasl/src/series/events.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/series/events.fasl")
   :BYTES 26105 :SHA256
   "b57b83cf28029db54ab219f76685cd09ae4cea299ebb5fb44f5c14b8472ac043")
  (:PATH "raw/coverage-active/fasl/src/series/io-events.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/series/io-events.fasl")
   :BYTES 13855 :SHA256
   "978760644c9155422554b71ee195af873342a0447f5f2b0fc9003c2ac30ccd72")
  (:PATH "raw/coverage-active/fasl/src/series/ownership.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/series/ownership.fasl")
   :BYTES 21426 :SHA256
   "3ae8ea18e6caa85e389d38e62390b0e8a9d8a2cb4fcede83824d984b9fdfc8fe")
  (:PATH "raw/coverage-active/fasl/src/series/package.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/series/package.fasl")
   :BYTES 1780 :SHA256
   "ac2033186e87bb5dff39c01c9af4b34321c3163cd5709097fceede9bf410da23")
  (:PATH "raw/coverage-active/fasl/src/series/publication.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/series/publication.fasl")
   :BYTES 16562 :SHA256
   "4313bbd4938c4671edc5347d5799d39b515ae0d3fe50c54006bf3a9a5f731dca")
  (:PATH "raw/coverage-active/fasl/src/series/query.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/series/query.fasl")
   :BYTES 8525 :SHA256
   "dd6f5fe1d528a37a0350237417438e52bf5e7a9c5ab46dfc110cdedd23cfd0c1")
  (:PATH "raw/coverage-active/fasl/src/series/retirement.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/series/retirement.fasl")
   :BYTES 12378 :SHA256
   "3d3485e02fb3b8805c43a38065e0fd2a534a7fb554be6be57ea6d9f0e9a03292")
  (:PATH "raw/coverage-active/fasl/src/series/routing-build.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/series/routing-build.fasl")
   :BYTES 9632 :SHA256
   "5d27f126a540ba312a267c6b831d7215dc37e4c4cde32fc702da54029f0d70a8")
  (:PATH "raw/coverage-active/fasl/src/series/routing-select.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/series/routing-select.fasl")
   :BYTES 9545 :SHA256
   "fabeecd4e74ce5181c9f90207bcb7994c60ae005a51a5ddd154701ddb932b8bc")
  (:PATH "raw/coverage-active/fasl/src/series/routing-types.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/series/routing-types.fasl")
   :BYTES 10816 :SHA256
   "1bc6235380d47ca9185812f4f1fdc466b708dbdf52457f13626c9e8048f6d034")
  (:PATH "raw/coverage-active/fasl/src/series/types.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/series/types.fasl")
   :BYTES 39232 :SHA256
   "a1daa11e2010772243fecc31cf44170ce0eca209c6042a9ad943657709bfb692")
  (:PATH "raw/coverage-active/fasl/src/series/worker-boundary.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/series/worker-boundary.fasl")
   :BYTES 10479 :SHA256
   "475016790045a9dcbe76c134723aec5358cb19f662196dec7dc6830ec427c980")
  (:PATH "raw/coverage-active/fasl/src/series/worker-package.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/series/worker-package.fasl")
   :BYTES 1649 :SHA256
   "054ab12894e97a3705962ad05ba375c98b737c094448f938bd8fafe9f60004ed")
  (:PATH "raw/coverage-active/fasl/src/series/worker-run.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/series/worker-run.fasl")
   :BYTES 19685 :SHA256
   "6cc4099b37765b6bcce5a5169cf5468178aabd03fdd0ad957b7a83204a506686")
  (:PATH "raw/coverage-active/fasl/src/series/worker-types.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/series/worker-types.fasl")
   :BYTES 22522 :SHA256
   "343098ba28276de60a13bb645f73b8276354e8c3f29db1bfe55e864406a22e03")
  (:PATH "raw/coverage-active/fasl/src/storage/compaction-scan.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/storage/compaction-scan.fasl")
   :BYTES 13808 :SHA256
   "ec88501ad781b6352dcd11d658981819d86270d25ba80c27af399ebc1acd41fc")
  (:PATH "raw/coverage-active/fasl/src/storage/control-payload.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/storage/control-payload.fasl")
   :BYTES 18197 :SHA256
   "ba6f955c7132c7a3badd992885d51629469c595c2fa33958c58101d083699d66")
  (:PATH "raw/coverage-active/fasl/src/storage/formats.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/storage/formats.fasl")
   :BYTES 10994 :SHA256
   "215aed95c6118022ab88f93476c03de34da8ca651820c4210fe0c9552ba993dd")
  (:PATH "raw/coverage-active/fasl/src/storage/log-header.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/storage/log-header.fasl")
   :BYTES 12798 :SHA256
   "3431172b158b687d54c3cbca886dcf9ec9f5e23e1df86ae47888e5197b2d80ec")
  (:PATH "raw/coverage-active/fasl/src/storage/package.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/storage/package.fasl")
   :BYTES 1558 :SHA256
   "352369fd7e3f3153bb02d8232d3b0c2ffd42d6ae7515e9dddfd5d7f558cf0dc8")
  (:PATH "raw/coverage-active/fasl/src/storage/payload-record.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/storage/payload-record.fasl")
   :BYTES 8772 :SHA256
   "ecb8e875f6f38df492b3f2192c01eff678daf50881586043511e4889da6c0459")
  (:PATH "raw/coverage-active/fasl/src/storage/payload-write.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/storage/payload-write.fasl")
   :BYTES 14877 :SHA256
   "4bda3603d31846e5acb65d7bd281bcf88d0941656d2e590ec685ad75389aa15d")
  (:PATH "raw/coverage-active/fasl/src/storage/segment-header.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/storage/segment-header.fasl")
   :BYTES 16852 :SHA256
   "4d3b1a2b87c991871447bc0f7de29d364ea02f2924619709d2c13329e2ffcdd7")
  (:PATH "raw/coverage-active/fasl/src/wal/builder.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/wal/builder.fasl")
   :BYTES 22927 :SHA256
   "f1fc5e4a2561e39fd3e0af63d57e48689d4fc5bd3f74d9cf1ad684e11f6e03f1")
  (:PATH "raw/coverage-active/fasl/src/wal/csn.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/wal/csn.fasl")
   :BYTES 23999 :SHA256
   "2c8b9f72ff33d1c7cee6ce198fc2d1d009ae9d79dd6108bf0420c98fa65bdec1")
  (:PATH "raw/coverage-active/fasl/src/wal/executor.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/wal/executor.fasl")
   :BYTES 19763 :SHA256
   "c4cf00f241fd80e845a895f3335b0580500078d0e62a4cb008cce7a84d118fcf")
  (:PATH "raw/coverage-active/fasl/src/wal/group.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/wal/group.fasl")
   :BYTES 17864 :SHA256
   "2bf61ddd7e998eeb127014bc15c46dd525248cac54902bb54b4f040c669b45ce")
  (:PATH "raw/coverage-active/fasl/src/wal/package.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/wal/package.fasl")
   :BYTES 2183 :SHA256
   "44f77a9c1a496ca016e9dfa7a1b477d3b43d2f89c4eac5f38c9b87d99ae40a00")
  (:PATH "raw/coverage-active/fasl/src/wal/types.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/src/wal/types.fasl")
   :BYTES 46366 :SHA256
   "0cca0f635b1494a3b65ebc01f42bbae7f6bf2b2b1dd796fdab8f04d962d6cf94")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-float-write-support.fasl"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/codec/cbor-float-write-support.fasl")
   :BYTES 64976 :SHA256
   "480d43b8b826ac030630631472357c6a60d2ef6a6070ca05a6eeb32b899d9152")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-float-write-threads.fasl"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/codec/cbor-float-write-threads.fasl")
   :BYTES 17914 :SHA256
   "1b3df49b236c18c742914e2db44bc30bd55162837ce8b5cdb83e0685df35d030")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-float-write.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/codec/cbor-float-write.fasl")
   :BYTES 93345 :SHA256
   "37e5f242a7e07b678012dcb992da7621a6140e965b823d5110a7559767f1b838")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-header.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/codec/cbor-header.fasl")
   :BYTES 50936 :SHA256
   "c00bebac864be7cfdf19c7372f853e83efd7d878148760bd7a69dd84bd6593b9")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-minimal-edges.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/codec/cbor-minimal-edges.fasl")
   :BYTES 6376 :SHA256
   "7ef3b4cfa4919ee1c037c09ac01cc10a82076cd9fdd8335593a9f327ddf9f699")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-minimal-scan-support.fasl"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/codec/cbor-minimal-scan-support.fasl")
   :BYTES 55142 :SHA256
   "af6254006ff457110f973d2edec38823a3d87a5655a641e3dee8f30276658c0a")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-minimal-scan-threads.fasl"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/codec/cbor-minimal-scan-threads.fasl")
   :BYTES 21280 :SHA256
   "182d5218b3628fa09b797861917867b78b4aed451aff4e8f43de856bd199aaf7")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-minimal-scan.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/codec/cbor-minimal-scan.fasl")
   :BYTES 76658 :SHA256
   "72c099ef5ec16c81b2499dfb00ec3dff4413db3211dc88adff5ca1fc73e23cc1")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-minimal-support.fasl"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/codec/cbor-minimal-support.fasl")
   :BYTES 54134 :SHA256
   "2952b6a4407e4c71ec8e4df65e858c219ef1d127aa8edab36c79a267aa7566e8")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-minimal-threads.fasl"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/codec/cbor-minimal-threads.fasl")
   :BYTES 18093 :SHA256
   "78ff37dc270a06b591e4dbdfa2a86e24624a73caf37bcde80c2e9ef8f7f1e04b")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-minimal.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/codec/cbor-minimal.fasl")
   :BYTES 55768 :SHA256
   "e45848b497b2ee8df1f01408293535f0d25312977c9fda60596b533228159719")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-simple-write-support.fasl"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/codec/cbor-simple-write-support.fasl")
   :BYTES 31081 :SHA256
   "c8423a4f316a8d2317abbd820583ccd49678699b6e439277bf505a63c06ffa74")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-simple-write-threads.fasl"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/codec/cbor-simple-write-threads.fasl")
   :BYTES 17994 :SHA256
   "800c1ea5b65dcac4c88c87b0f3a9a16f664c8ce22aa884ce0bc12c6ca4da6af7")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-simple-write.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/codec/cbor-simple-write.fasl")
   :BYTES 52716 :SHA256
   "0c1bd5124de082539e70a107c714c498ec0c1ce9fa58f76cf27d5091b764c46d")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-string-write-support.fasl"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/codec/cbor-string-write-support.fasl")
   :BYTES 37650 :SHA256
   "e45ea7ce65098d950e1107495c5159d295883064b48b3026a0f5908871fc1028")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-string-write-threads.fasl"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/codec/cbor-string-write-threads.fasl")
   :BYTES 17605 :SHA256
   "4a19b14b64c36036fe64ab1f011d9e97cfaff425a79a2b8f92e62ddc0b7d464b")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-string-write.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/codec/cbor-string-write.fasl")
   :BYTES 67518 :SHA256
   "6e096ad162c576a3a0d7740e57fe57d9a6dbc3cdcac3c01e0bdfaba042555e3a")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-structure-support.fasl"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/codec/cbor-structure-support.fasl")
   :BYTES 71326 :SHA256
   "76c02c364be1c73759a467de3dbd66beceba5a1e7d8250e9f9f44ed70d77570e")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-structure-threads.fasl"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/codec/cbor-structure-threads.fasl")
   :BYTES 21613 :SHA256
   "a33111f38b8e89a0d9bebe91ec6f27a60b50c1bab9db8392e892c610a5620641")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-structure.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/codec/cbor-structure.fasl")
   :BYTES 93259 :SHA256
   "439f749f82e3d229823044cec9ba3eef6baac9b4fc3cbb74a81fc57300c56605")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-support.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/codec/cbor-support.fasl")
   :BYTES 39008 :SHA256
   "84bfd0eea3e10808b524c4894c11dcd9e80e0c007c2bef7d6cde8255eae6317b")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-threads.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/codec/cbor-threads.fasl")
   :BYTES 17901 :SHA256
   "9567d573963a3610f3ac2bc024351b94a0f8c26ea1d482a29e604bba35e719bf")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-write-roundtrip.fasl"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/codec/cbor-write-roundtrip.fasl")
   :BYTES 5213 :SHA256
   "4b1012e518b11760cc96894a5c046104a8e61297f92772512254c48379c195bd")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-write-support.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/codec/cbor-write-support.fasl")
   :BYTES 27511 :SHA256
   "3a1f2cf5e7d7a78cf4cf5c31c5a70b41198cad1b598002d2046d995792cb6124")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-write-threads.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/codec/cbor-write-threads.fasl")
   :BYTES 17873 :SHA256
   "07c602be59078fe3a078ee06462d501a9edfdbd45361c275c5a5d1cde41db695")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-write.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/codec/cbor-write.fasl")
   :BYTES 43604 :SHA256
   "1380614f6e43940731967d6dd7c56cf90ee284fd605b1921beacc5e556f738cc")
  (:PATH "raw/coverage-active/fasl/tests/codec/support.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/codec/support.fasl")
   :BYTES 35215 :SHA256
   "312bf210968d78406eec16a8b8496baedf67d54829845167cb8dbe58d56b472c")
  (:PATH "raw/coverage-active/fasl/tests/codec/threads.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/codec/threads.fasl")
   :BYTES 15055 :SHA256
   "db418564af810b21f57aeab72132e725982a4ed6e36caff8388ca6035b705e0f")
  (:PATH "raw/coverage-active/fasl/tests/codec/utf8.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/codec/utf8.fasl")
   :BYTES 59043 :SHA256
   "b74c5320b4784cea673f57d79a8af5aae77d29ccacd580529594a83ee8f90fe4")
  (:PATH "raw/coverage-active/fasl/tests/csn/registry.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/csn/registry.fasl")
   :BYTES 109829 :SHA256
   "c0121af5cef410329c93bc5e03d05b2093b58f3968bebf5ffb72de24265d43bd")
  (:PATH "raw/coverage-active/fasl/tests/csn/support.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/csn/support.fasl")
   :BYTES 78028 :SHA256
   "9cad104cbd2a6179d9284429baf138b64b28d77737f3e3293294e30e1e87f85e")
  (:PATH "raw/coverage-active/fasl/tests/csn/threads.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/csn/threads.fasl")
   :BYTES 49397 :SHA256
   "e5172d7b635ecc69fb6aaca2ddde316031efcb17580c0e652871209383a8c56a")
  (:PATH "raw/coverage-active/fasl/tests/epochs/lifecycle.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/epochs/lifecycle.fasl")
   :BYTES 188392 :SHA256
   "eac3a5a2a957de96c9ee51507a48a47862a5bfd0c63c410bcbfababb61ae09fe")
  (:PATH "raw/coverage-active/fasl/tests/epochs/support.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/epochs/support.fasl")
   :BYTES 43365 :SHA256
   "76a73af2d42019b49d8ab591fa82afe2303d558f4a7f0f99b9a33877e563b33a")
  (:PATH "raw/coverage-active/fasl/tests/epochs/threads.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/epochs/threads.fasl")
   :BYTES 23188 :SHA256
   "97f25eda983822ca2b572fcc399fb4963017c7e9699e4c3ee03d30b7d3c42980")
  (:PATH "raw/coverage-active/fasl/tests/execution/handoff.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/execution/handoff.fasl")
   :BYTES 196932 :SHA256
   "ea2be4edfc85865f6f493ff63e35176ea3e9759417d64407596300946e0a04f3")
  (:PATH "raw/coverage-active/fasl/tests/execution/queue.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/execution/queue.fasl")
   :BYTES 85790 :SHA256
   "6586d90f9bc32f79fb558f857d014bfff5d8c8b0d02bb9f07d9647f7baf53b9c")
  (:PATH "raw/coverage-active/fasl/tests/execution/ready-recycle.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/execution/ready-recycle.fasl")
   :BYTES 156694 :SHA256
   "84cd8a2172c77d54fcb2a977b4814b55f2b595024fa3c664af0ac34b366866c9")
  (:PATH "raw/coverage-active/fasl/tests/execution/ready.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/execution/ready.fasl")
   :BYTES 191334 :SHA256
   "d471113d53144b453e19a4ea73fda184225d0f5b73b62ae8ea3bd37d6c566821")
  (:PATH "raw/coverage-active/fasl/tests/execution/support.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/execution/support.fasl")
   :BYTES 29611 :SHA256
   "7a74ac6f74a2ae4fb418c6c81b559b55252449f7d5d44a2e5d4668b5970e8455")
  (:PATH "raw/coverage-active/fasl/tests/execution/threads.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/execution/threads.fasl")
   :BYTES 65488 :SHA256
   "a426f0da058d37d7e0a842aa917374c30d343c3de77f407bf032b2777d1f10f7")
  (:PATH "raw/coverage-active/fasl/tests/execution/worker.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/execution/worker.fasl")
   :BYTES 354772 :SHA256
   "0fcff4041442023a6cd28efc54f5e59262a1cee7079e623a34d9d8da8069b6b9")
  (:PATH "raw/coverage-active/fasl/tests/foundation/batch.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/foundation/batch.fasl")
   :BYTES 43974 :SHA256
   "8af4b523a5eab3861f506f3ab269730f24e44b33a8ec4f316d76ed7e51a5a13a")
  (:PATH "raw/coverage-active/fasl/tests/foundation/binary.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/foundation/binary.fasl")
   :BYTES 32088 :SHA256
   "09de86ae6a0e36433f5f6e3342b3f0d788383c0b159ce36a88ca45e0908a75bf")
  (:PATH "raw/coverage-active/fasl/tests/foundation/record.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/foundation/record.fasl")
   :BYTES 129721 :SHA256
   "15209273f6b3af523c7e55df25f7fd226c228d9d519ba9e1ede72eabcf1b1514")
  (:PATH "raw/coverage-active/fasl/tests/foundation/support.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/foundation/support.fasl")
   :BYTES 17114 :SHA256
   "e8c3ed9872a622afb2d83904e9134dff68ceae276cd8f6fe162a3dabc2984da3")
  (:PATH "raw/coverage-active/fasl/tests/get-active/construction.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/get-active/construction.fasl")
   :BYTES 107507 :SHA256
   "5bc73ff3bbc6a865b6a4e409b09405725a7f42c5b7db19d249d3a405925232a2")
  (:PATH "raw/coverage-active/fasl/tests/get-active/directory.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/get-active/directory.fasl")
   :BYTES 39446 :SHA256
   "0b44c1772bcc58c451b3db6390613ef9be33e1a1f5d2c95ad32082f01596db48")
  (:PATH "raw/coverage-active/fasl/tests/get-active/read.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/get-active/read.fasl")
   :BYTES 144898 :SHA256
   "6782381fbd3e12da0fec21070b22e53fef2b351e538a7edc7f972130bb3e161b")
  (:PATH "raw/coverage-active/fasl/tests/get-active/support.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/get-active/support.fasl")
   :BYTES 224440 :SHA256
   "4347b7f384a71936dd13729b4e5349fce80200d04fab85b020cc322051e254f2")
  (:PATH "raw/coverage-active/fasl/tests/get-directory/construction.fasl"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/get-directory/construction.fasl")
   :BYTES 82972 :SHA256
   "f730a88fff4cafaff2501708dd11b8515537192cd9254f1787acf877671a2518")
  (:PATH "raw/coverage-active/fasl/tests/get-directory/read.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/get-directory/read.fasl")
   :BYTES 159077 :SHA256
   "3741ac8180d4ee7db37f68336cd3b40d89dd361ecb4bd794259304761a68b90e")
  (:PATH "raw/coverage-active/fasl/tests/get-directory/series-read.fasl"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/get-directory/series-read.fasl")
   :BYTES 218216 :SHA256
   "7cbcb9e08a3b6c8be4201112256593d81bfbad4927918a1cf8236daef2b6ad3c")
  (:PATH "raw/coverage-active/fasl/tests/get-directory/series-support.fasl"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/get-directory/series-support.fasl")
   :BYTES 117799 :SHA256
   "c238874ce4c8756efba1c8fb374a93287c94d1f3e6674c0a1f8c850fe3395fd8")
  (:PATH "raw/coverage-active/fasl/tests/get-directory/support.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/get-directory/support.fasl")
   :BYTES 163537 :SHA256
   "409c0f4cb14e623b9d511c8fa16337bab0cdc86e7eceeb83c59ae7b317647c55")
  (:PATH "raw/coverage-active/fasl/tests/get-directory/threads.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/get-directory/threads.fasl")
   :BYTES 31619 :SHA256
   "f6315f6728c752bbfd484b8a2343c15aac2427e85373135bde1b5380a7c10ecf")
  (:PATH "raw/coverage-active/fasl/tests/get-performance/guards.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/get-performance/guards.fasl")
   :BYTES 41790 :SHA256
   "dc76d44be8a9aa5c157f7c95d4d2b12fbc46c4bae6ae4df063189e62c03abbc1")
  (:PATH "raw/coverage-active/fasl/tests/get-performance/paths.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/get-performance/paths.fasl")
   :BYTES 32736 :SHA256
   "93ebb260b6d9de1cf3e3f45e57228ea7d820ffad8c0ca8f0fd90e89edb2c0977")
  (:PATH "raw/coverage-active/fasl/tests/get-performance/support.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/get-performance/support.fasl")
   :BYTES 142379 :SHA256
   "5eb06eea901c85d04b946a96f0045e09a30f3eaee2b3d84f11cdfce57fa6d9c9")
  (:PATH "raw/coverage-active/fasl/tests/get-performance/threads.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/get-performance/threads.fasl")
   :BYTES 21167 :SHA256
   "ec82ed1f5591ff16e0a2624ec25638ceaa4d3d1768ed003b771096f5a88d3739")
  (:PATH "raw/coverage-active/fasl/tests/get-resolver/construction.fasl"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/get-resolver/construction.fasl")
   :BYTES 75576 :SHA256
   "0a363db0ed5d5445284f98be5977443d12852a06fdbe444db5efa51a2f6f2233")
  (:PATH "raw/coverage-active/fasl/tests/get-resolver/read.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/get-resolver/read.fasl")
   :BYTES 157205 :SHA256
   "8abe54d4037e9f78725e0e46e545562e958b326c44bf843a08257edc9af8d0b5")
  (:PATH "raw/coverage-active/fasl/tests/get-resolver/sort.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/get-resolver/sort.fasl")
   :BYTES 39431 :SHA256
   "7441088d898c7071c1ec0cf413bced1625f49e16787a24b337e680e0cd3bf401")
  (:PATH "raw/coverage-active/fasl/tests/get-resolver/support.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/get-resolver/support.fasl")
   :BYTES 163592 :SHA256
   "f0a42a4ce43060e8f43c9e699d42c5735639aad1f9904ea367af3fd0cb891d1a")
  (:PATH "raw/coverage-active/fasl/tests/get/lifecycle.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/get/lifecycle.fasl")
   :BYTES 181794 :SHA256
   "f96fd7e132d8f2b48756a8b7032b6a1c3aaadcc6c27cd1cd52ead8d09b994b4d")
  (:PATH "raw/coverage-active/fasl/tests/get/segment.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/get/segment.fasl")
   :BYTES 131220 :SHA256
   "3a9a6181d5e51472b5c01ed85f68e6b7fd93656d99a015b33439aee750855a16")
  (:PATH "raw/coverage-active/fasl/tests/get/support.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/get/support.fasl")
   :BYTES 106880 :SHA256
   "ffc06f2a42a217121d8193c7d97a1aabe5a100b370b233660437838036613565")
  (:PATH "raw/coverage-active/fasl/tests/hash/guards.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/hash/guards.fasl")
   :BYTES 8309 :SHA256
   "e62d7dcc5720cb8197dab4c1e7781166f560be2a60c5d9c1ef1093935accaf02")
  (:PATH "raw/coverage-active/fasl/tests/hash/hash64.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/hash/hash64.fasl")
   :BYTES 82836 :SHA256
   "64d57875d3f0195b0b37191673bff8a924093c3385777709dbff09ab0fef9131")
  (:PATH "raw/coverage-active/fasl/tests/hash/support.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/hash/support.fasl")
   :BYTES 60593 :SHA256
   "b003ed42731f6e5f0c7d9fdd50c25ad9b2b3925ef8173eecbb763da2295984b7")
  (:PATH "raw/coverage-active/fasl/tests/hash/threads.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/hash/threads.fasl")
   :BYTES 32523 :SHA256
   "b2321f80d633d9032be93510c5affa2a06a7f76627b393740169f789a4025712")
  (:PATH "raw/coverage-active/fasl/tests/index/hash-digests.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/index/hash-digests.fasl")
   :BYTES 202726 :SHA256
   "8ad631eb7a56e5dc245887bb2ee8ab9ad3cbfd0d4be9a3be44d097a83785df2d")
  (:PATH "raw/coverage-active/fasl/tests/index/primary-support.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/index/primary-support.fasl")
   :BYTES 66477 :SHA256
   "209337f75d24218e6e252d63863d15a6c01d89955b1a996e930dec0824074d39")
  (:PATH "raw/coverage-active/fasl/tests/index/primary-threads.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/index/primary-threads.fasl")
   :BYTES 72503 :SHA256
   "e866b28fc96fb13e91e7e13fd6a1ead0ad532977cad84f527aeae77b2a802146")
  (:PATH "raw/coverage-active/fasl/tests/index/primary.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/index/primary.fasl")
   :BYTES 193992 :SHA256
   "92294f13f2cca30a1473910d5c8053475ed264b79cbd68f5d2bcf42e20e5dbd6")
  (:PATH "raw/coverage-active/fasl/tests/index/rebuild.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/index/rebuild.fasl")
   :BYTES 183033 :SHA256
   "f4f864e5fb1c504bcd7733866f3c606e56f01e6b29c5d73e6a8881105faf0a8d")
  (:PATH "raw/coverage-active/fasl/tests/index/slot-support.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/index/slot-support.fasl")
   :BYTES 62581 :SHA256
   "353cb5e6a4c2f76dfd2bfacd6335b908641acbc85315811d82e57e1f9fc9107c")
  (:PATH "raw/coverage-active/fasl/tests/index/slot-threads.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/index/slot-threads.fasl")
   :BYTES 69701 :SHA256
   "7706e17fff0f9812ea99b5f7b1bcb43fef80460a2778067aecbae456b30d1f2a")
  (:PATH "raw/coverage-active/fasl/tests/index/slots.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/index/slots.fasl")
   :BYTES 194628 :SHA256
   "ed9de171ecbf7b09f5ff19ba4bba0845007fa27f40c4c8dc26d7e9c9d0aebd17")
  (:PATH "raw/coverage-active/fasl/tests/io/native.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/io/native.fasl")
   :BYTES 65699 :SHA256
   "a0587a0393e5ab97dbbf7ae31dd88c16b7541c6bdb62d363545477a1c995ff99")
  (:PATH "raw/coverage-active/fasl/tests/io/support.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/io/support.fasl")
   :BYTES 23464 :SHA256
   "0192ffc7d970c7398921a043c70134989e1f818f987f4ed077ca98adb3cc128b")
  (:PATH "raw/coverage-active/fasl/tests/io/transfer.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/io/transfer.fasl")
   :BYTES 114055 :SHA256
   "21bfd570a1a57b295a28d5f69718bddcac3d4073a7c9eccc7c3c4ca5c1c6a2d3")
  (:PATH "raw/coverage-active/fasl/tests/mvcc/capture.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/mvcc/capture.fasl")
   :BYTES 112444 :SHA256
   "4d068e9d3c7a600805c62d982a30f95e9659a726c26176857f7e1f53c3b0212b")
  (:PATH "raw/coverage-active/fasl/tests/mvcc/lifecycle.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/mvcc/lifecycle.fasl")
   :BYTES 222608 :SHA256
   "ec632f8821e9c2b2e748f7dae11637994060f515e3a3363018276526241aaad2")
  (:PATH "raw/coverage-active/fasl/tests/mvcc/support.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/mvcc/support.fasl")
   :BYTES 46352 :SHA256
   "8e43c83682e08508d2ec81749d75b8038d9c33cecbbf63d5c233aef1e7ef90e4")
  (:PATH "raw/coverage-active/fasl/tests/read/lifecycle.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/read/lifecycle.fasl")
   :BYTES 286954 :SHA256
   "4d1942b407dd3b0cbeb064ded860d7c078fbc690c1a70ac75aa44c06e9d41970")
  (:PATH "raw/coverage-active/fasl/tests/read/support.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/read/support.fasl")
   :BYTES 41727 :SHA256
   "4e604cccc5affaa92fff7183469659a63f4ccb905db9b564c8922f578dc7d47e")
  (:PATH "raw/coverage-active/fasl/tests/read/threads.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/read/threads.fasl")
   :BYTES 39199 :SHA256
   "579ac3679c7796dab7d0592b17ed0cc77f94e0d71ccb745e56e78f499168ae95")
  (:PATH "raw/coverage-active/fasl/tests/recovery/corruption.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/recovery/corruption.fasl")
   :BYTES 35294 :SHA256
   "12c9cbfe48a48a6b93160e8399f9fe055f9934d6dd5b924c08cd695033c7003b")
  (:PATH "raw/coverage-active/fasl/tests/recovery/decisions-audit.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/recovery/decisions-audit.fasl")
   :BYTES 75398 :SHA256
   "c7f4e92750c1363826aa5b928421395c22d8cce69d69a1e4a5b5f24f45dc02ef")
  (:PATH "raw/coverage-active/fasl/tests/recovery/decisions-radix.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/recovery/decisions-radix.fasl")
   :BYTES 146469 :SHA256
   "15291bb842493d8b5b9c602d069c17fc049fc36cf43712595932b798b00f8f60")
  (:PATH "raw/coverage-active/fasl/tests/recovery/decisions-support.fasl"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/recovery/decisions-support.fasl")
   :BYTES 35952 :SHA256
   "ccc7de7d3600f9af90d480e748074cba003350e5cdbe925d0b337feea92feea6")
  (:PATH "raw/coverage-active/fasl/tests/recovery/decisions.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/recovery/decisions.fasl")
   :BYTES 117731 :SHA256
   "90a397825e72def467ba479907fad9d6df1c3088dc12f3e50867e5f58bafca5f")
  (:PATH "raw/coverage-active/fasl/tests/recovery/inventory-support.fasl"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/recovery/inventory-support.fasl")
   :BYTES 42480 :SHA256
   "34445417f18d580762d031713820e6c845b4c0385b04dfd920486ccf2b5f793d")
  (:PATH "raw/coverage-active/fasl/tests/recovery/inventory.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/recovery/inventory.fasl")
   :BYTES 78880 :SHA256
   "c5c031277561e45848c3bff083d06f666759043c997879cd4f74fa5dbbfc46be")
  (:PATH "raw/coverage-active/fasl/tests/recovery/manifest-audit.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/recovery/manifest-audit.fasl")
   :BYTES 96389 :SHA256
   "ce8c88a5e7246956f2c9d5c28d38f076aea11d77d60d7f2f6519cf09db65db6f")
  (:PATH "raw/coverage-active/fasl/tests/recovery/manifest-support.fasl"
   :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/recovery/manifest-support.fasl")
   :BYTES 54500 :SHA256
   "d437235419b425446bd569a7ac79cbe5ec18635b8f8d97d56b458fa1ab50f45b")
  (:PATH "raw/coverage-active/fasl/tests/recovery/manifest.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/recovery/manifest.fasl")
   :BYTES 71116 :SHA256
   "a1f93443931162088323943e80bc17f02e57962f6be54614be207038ba959c65")
  (:PATH "raw/coverage-active/fasl/tests/recovery/scan.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/recovery/scan.fasl")
   :BYTES 108282 :SHA256
   "835c7dda0b05cef1e887ad1b60574233e401c2b8a896b80f6b2d3436f37e5e99")
  (:PATH "raw/coverage-active/fasl/tests/recovery/support.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/recovery/support.fasl")
   :BYTES 34715 :SHA256
   "b5318dce3eb2dabd3d4626788b26347f0a502a8ab354884eeedb5a96ad7d5d53")
  (:PATH "raw/coverage-active/fasl/tests/scheduler/controller.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/scheduler/controller.fasl")
   :BYTES 108267 :SHA256
   "e57b0b0f44775ffcdeffcb0c9b05265f239973900250b4fceed99dd8ab083cf7")
  (:PATH "raw/coverage-active/fasl/tests/scheduler/support.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/scheduler/support.fasl")
   :BYTES 19473 :SHA256
   "d16535e3967b9ed954aaa09e705185d0a890e036b09e5e85c896b45568be9636")
  (:PATH "raw/coverage-active/fasl/tests/series/boundaries.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/series/boundaries.fasl")
   :BYTES 26472 :SHA256
   "09e6b686ec6d9b7a439fdad9403239a2e3035c0cac2c694d40b5ea74c220352a")
  (:PATH "raw/coverage-active/fasl/tests/series/controller.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/series/controller.fasl")
   :BYTES 304530 :SHA256
   "769321f1d65f10c5ab276731067d01c4c72d9f66a3a1091449ba6909c0cedfc2")
  (:PATH "raw/coverage-active/fasl/tests/series/support.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/series/support.fasl")
   :BYTES 119667 :SHA256
   "e527d507b18037847a2a6b24e242cbed434b2304683bde819ff0d10052454ff6")
  (:PATH "raw/coverage-active/fasl/tests/series/threads.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/series/threads.fasl")
   :BYTES 89539 :SHA256
   "cebe124faaca0d21e48a4716038dfebdfd77432daee0332f207b3749353458c9")
  (:PATH "raw/coverage-active/fasl/tests/series/worker-bridge.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/series/worker-bridge.fasl")
   :BYTES 280761 :SHA256
   "f616edfc8e20b3eadbc0613c6e96ebf1163b85ee39d7d7ac03fdb6957197b372")
  (:PATH "raw/coverage-active/fasl/tests/series/worker-routing.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/series/worker-routing.fasl")
   :BYTES 156729 :SHA256
   "7def52a6314c104a6a0653ae5d8adf30067ba802a9c00b110cd9ec23962bee62")
  (:PATH "raw/coverage-active/fasl/tests/smoke.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/smoke.fasl")
   :BYTES 4859 :SHA256
   "680b9b0e9440d0435bfacef7ee2a7847b9d3612476e84beae7fef85152d206a0")
  (:PATH "raw/coverage-active/fasl/tests/storage/compaction-scan.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/storage/compaction-scan.fasl")
   :BYTES 80088 :SHA256
   "c93af0d4f6790550b4a54e2a2335d505d2c07b29068c787fabad8a41b4d4f74a")
  (:PATH "raw/coverage-active/fasl/tests/storage/control-payload.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/storage/control-payload.fasl")
   :BYTES 123127 :SHA256
   "6a6016458f4a60d327c583beca19b56dd46a283a72cd3589d41f82d8f7698ef8")
  (:PATH "raw/coverage-active/fasl/tests/storage/log-header.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/storage/log-header.fasl")
   :BYTES 79472 :SHA256
   "552d5c9ec2618dc291d3ab8b559f036de51979cdf7ef20abb02cdf5ad85976e1")
  (:PATH "raw/coverage-active/fasl/tests/storage/segment-header.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/storage/segment-header.fasl")
   :BYTES 38955 :SHA256
   "cc452c2800d7d3eeb7c441d4c0e166d277c0e6f38cb42aeb24cc9d2b9e34d84e")
  (:PATH "raw/coverage-active/fasl/tests/storage/support.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/storage/support.fasl")
   :BYTES 28177 :SHA256
   "134cc62f2bcc4e8014ccf0bc99a4feed65f2defa55a0e72c3df9b6b7d4756553")
  (:PATH "raw/coverage-active/fasl/tests/wal/builder.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/wal/builder.fasl")
   :BYTES 39776 :SHA256
   "ffaf34def1368c5221db7a22840a56ebbb26e98d4a3230ba6f8a6e11b2f35db5")
  (:PATH "raw/coverage-active/fasl/tests/wal/csn-threads.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/wal/csn-threads.fasl")
   :BYTES 65563 :SHA256
   "68000b23a2c9f599fd6a5e082ad0df0e833def7382c06397603272b3c866b30d")
  (:PATH "raw/coverage-active/fasl/tests/wal/csn.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/wal/csn.fasl")
   :BYTES 220505 :SHA256
   "2043320adfb954e58263b7421a77430934e80122de3be353348430fdee7828d3")
  (:PATH "raw/coverage-active/fasl/tests/wal/fault.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/wal/fault.fasl")
   :BYTES 65701 :SHA256
   "3bb859d23db1d742841e25f663d53c64dc4810648b62dc578b569ede8e49a795")
  (:PATH "raw/coverage-active/fasl/tests/wal/group.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/wal/group.fasl")
   :BYTES 57955 :SHA256
   "4518c4513bf16c163d8a0f4561a26c4d5f4003533ed51394378bd3d617a65072")
  (:PATH "raw/coverage-active/fasl/tests/wal/native.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/wal/native.fasl")
   :BYTES 21736 :SHA256
   "c1cb1df3e36d26453a34a1ba595ac9738590704cc1dce956bd470e54ffc829c9")
  (:PATH "raw/coverage-active/fasl/tests/wal/support.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-active-coverage-R2/fasl/tests/wal/support.fasl")
   :BYTES 14758 :SHA256
   "65b965a5c529e5addd805733d8312f659416955a6e9748576fa765ccb3249ad7")
  (:PATH "raw/coverage-closed-command/conservazione.lisp" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912239-command-44379-0/conservazione.lisp")
   :BYTES 1171 :SHA256
   "4e82dd9823824581aaeb2b722a46be472ba2a81098453e1da885643c577709fe")
  (:PATH "raw/coverage-closed-command/report.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912239-command-44379-0/report.lisp")
   :BYTES 165212 :SHA256
   "029f83fb39f0a99027c53e95c6e5fed9f0149a2fdf60e3665d4917242c29a660")
  (:PATH "raw/coverage-closed/0aa23f4025e0337fb7f5307fbb899117.html" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/0aa23f4025e0337fb7f5307fbb899117.html")
   :BYTES 11587 :SHA256
   "575bd51b84a4fce0492b4e4934352e2e6861230ddbcc033fd8301b480482ee93")
  (:PATH "raw/coverage-closed/48d7e5d744f15d29cd4580202122a6d4.html" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/48d7e5d744f15d29cd4580202122a6d4.html")
   :BYTES 14394 :SHA256
   "974cb0bd930a140f0862e544ab3ed80f66e206f5ea22d89d4e959c72ceaf274f")
  (:PATH "raw/coverage-closed/584e92c20a2d5b9fc810f3cbb2156b6b.html" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/584e92c20a2d5b9fc810f3cbb2156b6b.html")
   :BYTES 42629 :SHA256
   "90fff08406f845e44ef1bf6730d4fca1e2d01be64aa7cc2e6b677e59e8325429")
  (:PATH "raw/coverage-closed/69611eeb9b2ff6be0d314b3c052dd320.html" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/69611eeb9b2ff6be0d314b3c052dd320.html")
   :BYTES 39374 :SHA256
   "5ebd958c7d63f1ee6251d3d720e01036b2332037f4ec48f53f3d5d756444ae31")
  (:PATH "raw/coverage-closed/a9c69f89eb6ec1a2a3170082af03eb19.html" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/a9c69f89eb6ec1a2a3170082af03eb19.html")
   :BYTES 40520 :SHA256
   "51a6c82e8e2ccb8a2bdf34bf507f74289f56c574f70e64dbe873230c403a03e5")
  (:PATH "raw/coverage-closed/bc8eabc9ffea3e23b5508cda795a9a73.html" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/bc8eabc9ffea3e23b5508cda795a9a73.html")
   :BYTES 36762 :SHA256
   "fb6a1e28386efc504f0dcf489ccc6b26566d1164365ec4660a1688195433a282")
  (:PATH "raw/coverage-closed/bf50a4ed091fbebfb7c4b410eb177e09.html" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/bf50a4ed091fbebfb7c4b410eb177e09.html")
   :BYTES 19905 :SHA256
   "98940e9cbfbeb489932d0dc5cbd974e4dfaf684e622883a9f5ffd7dc2f11d760")
  (:PATH "raw/coverage-closed/cover-index.html" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/cover-index.html")
   :BYTES 2847 :SHA256
   "a3596193e28bd579753a8b19541fd484ad190463f570799af695fc28f8ef1b5a")
  (:PATH "raw/coverage-closed/coverage-state.lisp.gz" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/coverage-state.lisp")
   :BYTES 316986 :SHA256
   "33ea382ea2963b24840d710aa36f638ad0cae3119b013b78ba5d8f31fc41e8e9" :CODEC
   :GZIP :UNCOMPRESSED-BYTES 2229801 :UNCOMPRESSED-SHA256
   "222979e38969a5380dd748861ddb1bd6d961c709e4447df8d3911b1faea6599e")
  (:PATH "raw/coverage-closed/coverage-summary.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/coverage-summary.lisp")
   :BYTES 2750 :SHA256
   "54568cf848849bcc815df45287c734e0a69e7004672142cce18680626fb41a29")
  (:PATH "raw/coverage-closed/fasl/src/cache/build.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/cache/build.fasl")
   :BYTES 14451 :SHA256
   "a6765908aee9c524dc7e3bacb3c6113bb552069214b62348b201085c50a937b2")
  (:PATH "raw/coverage-closed/fasl/src/cache/clock.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/cache/clock.fasl")
   :BYTES 7950 :SHA256
   "eaa53542d4eefbe22b1a0ec0ebb272bd255b674837a90656cf83091e32fd0f06")
  (:PATH "raw/coverage-closed/fasl/src/cache/core.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/cache/core.fasl")
   :BYTES 10953 :SHA256
   "acb3a3484600b46d28d15139a1a98d864d2280f369f4a59f7547670a97a6fc1f")
  (:PATH "raw/coverage-closed/fasl/src/cache/package.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/cache/package.fasl")
   :BYTES 1226 :SHA256
   "5203bacb5495652c46e4f3784a781e9becf4425ba0b82b4965d389d10b8a1301")
  (:PATH "raw/coverage-closed/fasl/src/cache/read.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/cache/read.fasl")
   :BYTES 18378 :SHA256
   "a9b10bcf83fc02246ed87a1e44d64b55043d67965ad74dd0252755e3e4892bcc")
  (:PATH "raw/coverage-closed/fasl/src/cache/types.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/cache/types.fasl")
   :BYTES 20970 :SHA256
   "91451b2c5e88acbc7fe5409e124607fa0f379e8670691523cd004ff529dda49c")
  (:PATH "raw/coverage-closed/fasl/src/cache/write.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/cache/write.fasl")
   :BYTES 14806 :SHA256
   "2d03e1dd2d734f5399f4d8134abcabb2f08fa0f235640641db634aecb986b86f")
  (:PATH "raw/coverage-closed/fasl/src/codec/cbor-float-minimal.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/codec/cbor-float-minimal.fasl")
   :BYTES 8601 :SHA256
   "7883c6d2aa9a31290c86199db1285af26f10eb7948ee468ab0c2c80c6e4c3825")
  (:PATH "raw/coverage-closed/fasl/src/codec/cbor-float-narrow.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/codec/cbor-float-narrow.fasl")
   :BYTES 10235 :SHA256
   "8f86fb800f657a91553ceadac6dfb1165cc19f7dc1c45e82388010bb26748281")
  (:PATH "raw/coverage-closed/fasl/src/codec/cbor-float-write.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/codec/cbor-float-write.fasl")
   :BYTES 12244 :SHA256
   "197e9e66e9a7d754df8b75fbcbba714c517859a463a3771a84d9d8e840d52ae3")
  (:PATH "raw/coverage-closed/fasl/src/codec/cbor-header.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/codec/cbor-header.fasl")
   :BYTES 13884 :SHA256
   "561764bb5179559b680856897a2c4f792ce85973d5d7dcc2e17e7426b8dabf71")
  (:PATH "raw/coverage-closed/fasl/src/codec/cbor-minimal.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/codec/cbor-minimal.fasl")
   :BYTES 10152 :SHA256
   "4cfd414c0bc45b9c2736aaf5a8bf243b86316601841fa7f9ec6b7c22b29a6109")
  (:PATH "raw/coverage-closed/fasl/src/codec/cbor-package.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/codec/cbor-package.fasl")
   :BYTES 1227 :SHA256
   "dab41111475cecd21a0b6a3bdce966c487f34aa2bbab94c4d06e58aafbd8724b")
  (:PATH "raw/coverage-closed/fasl/src/codec/cbor-scan-input.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/codec/cbor-scan-input.fasl")
   :BYTES 5856 :SHA256
   "41e216667ccf30fb226a9517667f67941636ecb0b6e2c313288030670406d7b6")
  (:PATH "raw/coverage-closed/fasl/src/codec/cbor-scan-items.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/codec/cbor-scan-items.fasl")
   :BYTES 19504 :SHA256
   "9e1ab167f83ec7b3c6307ca6e217b56ad6bf5fbc676fbcf10a538879162875f4")
  (:PATH "raw/coverage-closed/fasl/src/codec/cbor-scan-minimal.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/codec/cbor-scan-minimal.fasl")
   :BYTES 3206 :SHA256
   "a0879ab6858c2a495fdc2f7443963009ca4c4d62ae61fd1701584e0d5c70373c")
  (:PATH "raw/coverage-closed/fasl/src/codec/cbor-scan-stack.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/codec/cbor-scan-stack.fasl")
   :BYTES 14667 :SHA256
   "81219896092178e8c787c569fb1bebae7a4ef92c5a7fc36aac2084f3c50240a1")
  (:PATH "raw/coverage-closed/fasl/src/codec/cbor-scan.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/codec/cbor-scan.fasl")
   :BYTES 13422 :SHA256
   "a63125bf21dd5bb7e3831b74d3fa94f629070f4edb7231a6749cc5b3c2e45270")
  (:PATH "raw/coverage-closed/fasl/src/codec/cbor-simple-write.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/codec/cbor-simple-write.fasl")
   :BYTES 6707 :SHA256
   "55cbff7c8009b444e3cc1edace0e6e0380304de17b0e1051745f30862487597f")
  (:PATH "raw/coverage-closed/fasl/src/codec/cbor-space.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/codec/cbor-space.fasl")
   :BYTES 14699 :SHA256
   "e9753314506c349685d186333946371154619980e0be2a831885bd04edd52a3d")
  (:PATH "raw/coverage-closed/fasl/src/codec/cbor-string-write.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/codec/cbor-string-write.fasl")
   :BYTES 17298 :SHA256
   "dc43a0198c82efb1b88f3e22f48ea16c4fe858c1ee40f512ecec383457b08f6f")
  (:PATH "raw/coverage-closed/fasl/src/codec/cbor-write.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/codec/cbor-write.fasl")
   :BYTES 13498 :SHA256
   "b567b7b23a8bae8216685434cfa8fb8c1e2a84833ba3bea44952c8c459eee18c")
  (:PATH "raw/coverage-closed/fasl/src/codec/package.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/codec/package.fasl")
   :BYTES 995 :SHA256
   "2cc6fb5dd8d5860956bb862b17fab08b7baa37e97213fafed3d2cd2ad9cf470e")
  (:PATH "raw/coverage-closed/fasl/src/codec/utf8.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/codec/utf8.fasl")
   :BYTES 16204 :SHA256
   "77ce477db41bb9667aa2a548b66e5e42a995ebcc8b1f18c2f261c1c04e1eab89")
  (:PATH "raw/coverage-closed/fasl/src/csn/package.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/csn/package.fasl")
   :BYTES 1028 :SHA256
   "6c6b581f9f8f5a1343712eefd53ebcfa7728c92da4dc2aa5adda57e24d273729")
  (:PATH "raw/coverage-closed/fasl/src/csn/registry.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/csn/registry.fasl")
   :BYTES 41579 :SHA256
   "a8cd577365e6fad80f17728729752c462aa239f7cb4d432aba036c3fed2e90c7")
  (:PATH "raw/coverage-closed/fasl/src/epochs/core.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/epochs/core.fasl")
   :BYTES 15737 :SHA256
   "c0273831df86fe695e3764aac507da3070b581e9d4a717f046bf75433018e86e")
  (:PATH "raw/coverage-closed/fasl/src/epochs/package.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/epochs/package.fasl")
   :BYTES 1253 :SHA256
   "9eb30b8d67786251ff70694a16207855602667b166a13bf3a369aa880fa286bc")
  (:PATH "raw/coverage-closed/fasl/src/epochs/read.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/epochs/read.fasl")
   :BYTES 7407 :SHA256
   "06456e52f23aa042c4a43ad8b88d2ca1477cfa123bc95009004ad2cf2d3b1e47")
  (:PATH "raw/coverage-closed/fasl/src/epochs/reclaim.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/epochs/reclaim.fasl")
   :BYTES 16043 :SHA256
   "3a6a4e6ddc63f1f3109a1fed337847bb79e3839aa3c3674bdc6af6ce722f4948")
  (:PATH "raw/coverage-closed/fasl/src/epochs/retire.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/epochs/retire.fasl")
   :BYTES 14472 :SHA256
   "a69cf679ebca35a7abf96f56f13b2d1bf76c7b774c835a9de0e39088fa49730a")
  (:PATH "raw/coverage-closed/fasl/src/epochs/types.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/epochs/types.fasl")
   :BYTES 29337 :SHA256
   "b9ca75d2ab84e19b535d44bc45ca7db4c2e6d9f4ae1de88b59a546def8082cfd")
  (:PATH "raw/coverage-closed/fasl/src/execution/handoff.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/execution/handoff.fasl")
   :BYTES 21399 :SHA256
   "4a631af618dfcdb6576e378a2d6c15dca99c2e1084432d5191032c0001d8357e")
  (:PATH "raw/coverage-closed/fasl/src/execution/package.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/execution/package.fasl")
   :BYTES 1664 :SHA256
   "b5c0f74b203be5ef79d3df249811edc497d4b413a0ce21c5e382df3f84fa0aaf")
  (:PATH "raw/coverage-closed/fasl/src/execution/queue.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/execution/queue.fasl")
   :BYTES 23889 :SHA256
   "895a1f8a15f87056460a46aa20b72d107c5cc6805faec2510018dd8ce8cd405c")
  (:PATH "raw/coverage-closed/fasl/src/execution/ready-recycle.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/execution/ready-recycle.fasl")
   :BYTES 7013 :SHA256
   "0c3f319dc64dfd0f73cc32923c59d45bb9d3f1e9ecf4e8a7fae970f23cf85f3d")
  (:PATH "raw/coverage-closed/fasl/src/execution/ready-types.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/execution/ready-types.fasl")
   :BYTES 20709 :SHA256
   "2e85980b3d4584109b2f7e432ffcb8afe30c1545a96eac3cef3f5268965df79a")
  (:PATH "raw/coverage-closed/fasl/src/execution/ready.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/execution/ready.fasl")
   :BYTES 14443 :SHA256
   "7a2c262577aee387b1c2af1e01a7ba90714e6bcf3d1d2035fbb8330b5689479d")
  (:PATH "raw/coverage-closed/fasl/src/execution/worker-boundary.fasl" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/execution/worker-boundary.fasl")
   :BYTES 7925 :SHA256
   "6de88a8087e5bbd310910babfc0548c4641281d013d29689c545bd2abd437918")
  (:PATH "raw/coverage-closed/fasl/src/execution/worker-claim.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/execution/worker-claim.fasl")
   :BYTES 17054 :SHA256
   "b63ce120961ed8ffec00ce04344c76b8b345d20f9a7dc48d4426a39cdd0f3cda")
  (:PATH "raw/coverage-closed/fasl/src/execution/worker-run.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/execution/worker-run.fasl")
   :BYTES 13132 :SHA256
   "9f2e3ee2cf70a36e7ec2880950f17b08ea10ef6e282db1cc802e0e338bae4b1f")
  (:PATH "raw/coverage-closed/fasl/src/execution/worker-types.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/execution/worker-types.fasl")
   :BYTES 29017 :SHA256
   "6392822e69186068f9b491725377b273ef02201d4b0be1775f8702548d762462")
  (:PATH "raw/coverage-closed/fasl/src/execution/writer.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/execution/writer.fasl")
   :BYTES 14983 :SHA256
   "e67b5342099c8ec525e10323f0ec326d711c2964f98b53f36af94b0cdb58b8d4")
  (:PATH "raw/coverage-closed/fasl/src/foundation/batch.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/foundation/batch.fasl")
   :BYTES 15593 :SHA256
   "faa997580ac7aba00de6bc43ac148689a63cedce84d52c7e727851d988ccaafc")
  (:PATH "raw/coverage-closed/fasl/src/foundation/binary.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/foundation/binary.fasl")
   :BYTES 12239 :SHA256
   "31707191f1ec97dadeba22f78451da6d004ec502947345d356b77c19559df835")
  (:PATH "raw/coverage-closed/fasl/src/foundation/conditions.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/foundation/conditions.fasl")
   :BYTES 6842 :SHA256
   "dfa239dcda38f31ac5f67668a9a304d42e6defde653da70c74ade3f8cd2e52e7")
  (:PATH "raw/coverage-closed/fasl/src/foundation/crc32c.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/foundation/crc32c.fasl")
   :BYTES 7400 :SHA256
   "7e171faffa9876befadcca0bfa9acbd4bca9db9bb79f66e2637b7d17696f1c24")
  (:PATH "raw/coverage-closed/fasl/src/foundation/package.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/foundation/package.fasl")
   :BYTES 2190 :SHA256
   "c8de29b35717b96c6ab9210c8cd4b5cd586326a7b852afffac53554674a24943")
  (:PATH "raw/coverage-closed/fasl/src/foundation/record.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/foundation/record.fasl")
   :BYTES 54568 :SHA256
   "258866449f3729d1074a05f8a2590375ccc40b3e33f453bde86e8d4c23921227")
  (:PATH "raw/coverage-closed/fasl/src/get-directory/build.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/get-directory/build.fasl")
   :BYTES 9749 :SHA256
   "fe169f2a17ecfbd7cf80a19720eed035e6baa68e0c30f5ff437dc9ccef875337")
  (:PATH "raw/coverage-closed/fasl/src/get-directory/package.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/get-directory/package.fasl")
   :BYTES 2161 :SHA256
   "28b145372ee091b22cec4a1048ed09bb01ca1393484053ebca5cb1b09fc1908d")
  (:PATH "raw/coverage-closed/fasl/src/get-directory/read.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/get-directory/read.fasl")
   :BYTES 9939 :SHA256
   "3f941d0beef62f50dd5e66198332a1faf17faabc4f127b14b48972861eaf2502")
  (:PATH "raw/coverage-closed/fasl/src/get-directory/sources-read.fasl" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/get-directory/sources-read.fasl")
   :BYTES 11594 :SHA256
   "5844278f6eed3d9543df2c5a39ae7bc17010c22e7b3ea877646987b1d2b5e33b")
  (:PATH "raw/coverage-closed/fasl/src/get-directory/sources-types.fasl"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/get-directory/sources-types.fasl")
   :BYTES 13709 :SHA256
   "d18b54bc558f97bca4407b558c4aeb79c9ad1bf98e8b139a5b69e7891e0be123")
  (:PATH "raw/coverage-closed/fasl/src/get-directory/types.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/get-directory/types.fasl")
   :BYTES 7845 :SHA256
   "930894daf2a7a848ac8f1700ae02fc9e411cbd16a075becbbd52032c1c0ee824")
  (:PATH "raw/coverage-closed/fasl/src/get-resolver/active-build.fasl" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/get-resolver/active-build.fasl")
   :BYTES 21178 :SHA256
   "72d0e268a6939aa293f611e79e7f3e5774c58b0590bb070582a4ab88c0ca5200")
  (:PATH "raw/coverage-closed/fasl/src/get-resolver/active-directory.fasl"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/get-resolver/active-directory.fasl")
   :BYTES 11089 :SHA256
   "91097fdc9101ac89b97a22c055347d227eb05f9fe2c09b7f45ff6a897572abed")
  (:PATH "raw/coverage-closed/fasl/src/get-resolver/active-preflight.fasl"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/get-resolver/active-preflight.fasl")
   :BYTES 13749 :SHA256
   "d93805ed9a726c70855dc3fd00ebe7e8e526a3c5017b96ffd5a9fd28c6d1d8b4")
  (:PATH "raw/coverage-closed/fasl/src/get-resolver/active-read.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/get-resolver/active-read.fasl")
   :BYTES 9333 :SHA256
   "54afb01b964ecea9ddb5fde9ddf842bdecb370fa3c9cf339ebc94d827ad0b711")
  (:PATH "raw/coverage-closed/fasl/src/get-resolver/active-scan.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/get-resolver/active-scan.fasl")
   :BYTES 14248 :SHA256
   "cbd2162eb4f594da774a46552805d4448cd1162b91f5d29234598ac07d5a1f73")
  (:PATH "raw/coverage-closed/fasl/src/get-resolver/active-types.fasl" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/get-resolver/active-types.fasl")
   :BYTES 19491 :SHA256
   "2599f8d36cfa514a4e02a1096ac64d4865923c037f75b779932bd06fac313584")
  (:PATH "raw/coverage-closed/fasl/src/get-resolver/build.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/get-resolver/build.fasl")
   :BYTES 17041 :SHA256
   "9c6cdece2987be5df9dec25fc10c58336c3624264218f2ce4573028bce811a60")
  (:PATH "raw/coverage-closed/fasl/src/get-resolver/package.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/get-resolver/package.fasl")
   :BYTES 2665 :SHA256
   "f5a6a891e52886d16f563ee333ec987dd5d30f85d7137995657a74dcab43a864")
  (:PATH "raw/coverage-closed/fasl/src/get-resolver/read.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/get-resolver/read.fasl")
   :BYTES 16778 :SHA256
   "dbe095ea5af14b96df5e74b244fa92cd226259925c1d3fb1941e9127707348e2")
  (:PATH "raw/coverage-closed/fasl/src/get-resolver/rows.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/get-resolver/rows.fasl")
   :BYTES 9419 :SHA256
   "831fa4aeac704f4a9d2937d87473c8b5171b334017640e32448f40216fc1964e")
  (:PATH "raw/coverage-closed/fasl/src/get-resolver/scan.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/get-resolver/scan.fasl")
   :BYTES 18229 :SHA256
   "e29d07debfd03b36fa18263c9079f13e1f8f949d8748a4a2eabfb754f4038346")
  (:PATH "raw/coverage-closed/fasl/src/get-resolver/sort.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/get-resolver/sort.fasl")
   :BYTES 18735 :SHA256
   "6359bb5179db5666c243f80bc2ba3202c9bd438e6382e4768d0ce0170772f7b4")
  (:PATH "raw/coverage-closed/fasl/src/get-resolver/types.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/get-resolver/types.fasl")
   :BYTES 8444 :SHA256
   "ee30bf60c6f797d812ce83ce73618fbb6120d2c531cb2250338d65e035ce1897")
  (:PATH "raw/coverage-closed/fasl/src/get/build.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/get/build.fasl")
   :BYTES 10163 :SHA256
   "1edce2a06993d9624b9a9f46c8d52e1ad37cb6372866bf13a7e94bdf26c873fd")
  (:PATH "raw/coverage-closed/fasl/src/get/lifecycle.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/get/lifecycle.fasl")
   :BYTES 13460 :SHA256
   "bfe8a57bf3a5472a9d6a6ba3cf51e9c5a8d65cecc25f5b1ef12964f89a104bf9")
  (:PATH "raw/coverage-closed/fasl/src/get/lookup.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/get/lookup.fasl")
   :BYTES 16880 :SHA256
   "16816cff95a37f9da52c76b00d9c2d783c780147b5060302226caceaa5dd64fd")
  (:PATH "raw/coverage-closed/fasl/src/get/package.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/get/package.fasl")
   :BYTES 2218 :SHA256
   "c7e2b58e6ad230bfaacd03e5e357a316a6bb0fa15ff289c18d9cb32740d2236b")
  (:PATH "raw/coverage-closed/fasl/src/get/segment.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/get/segment.fasl")
   :BYTES 18536 :SHA256
   "eaae452a6e133fa392a0099986e841a46b625b47186ed652382ab01755598c06")
  (:PATH "raw/coverage-closed/fasl/src/get/target.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/get/target.fasl")
   :BYTES 13161 :SHA256
   "3e3b8b107ff8b63b7023856c0860c16adb0309ac7cd0adb5e2eeec2ea9f36da1")
  (:PATH "raw/coverage-closed/fasl/src/get/types.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/get/types.fasl")
   :BYTES 34983 :SHA256
   "5365883132b8c181bdb82536bf5d3849c01c7242fdaa39bad40fa054c59575d3")
  (:PATH "raw/coverage-closed/fasl/src/hash/arithmetic.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/hash/arithmetic.fasl")
   :BYTES 9929 :SHA256
   "367bb2f80b9cd3e603892d18bc851f07ca446acfbbb7db5c94d451b4f98710bb")
  (:PATH "raw/coverage-closed/fasl/src/hash/blocks.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/hash/blocks.fasl")
   :BYTES 13041 :SHA256
   "d86a45c09d585d8c78b1200814e5a603ad586465da63dcb1afa5f6296334e65a")
  (:PATH "raw/coverage-closed/fasl/src/hash/hash64.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/hash/hash64.fasl")
   :BYTES 9051 :SHA256
   "cc8f6807a159348fc906f26e96ed71c261f4d3e2938e0c8b1947f40763653c8a")
  (:PATH "raw/coverage-closed/fasl/src/hash/package.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/hash/package.fasl")
   :BYTES 1003 :SHA256
   "6fdf177ea2eb76a1903755471c1830c60ef43fbb5f20b1219676bdb5208cdb78")
  (:PATH "raw/coverage-closed/fasl/src/index/core.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/index/core.fasl")
   :BYTES 8098 :SHA256
   "90bc0a40718b8fef2a2406e3d18ed14175dd4203ca8eed24f0dbc22c885e95d1")
  (:PATH "raw/coverage-closed/fasl/src/index/hash-digests.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/index/hash-digests.fasl")
   :BYTES 9768 :SHA256
   "f46412b49571ae24da9f97f12fbb34f0ba1f325edb38dd6e8c741fc9bb9c24c4")
  (:PATH "raw/coverage-closed/fasl/src/index/hash-seed.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/index/hash-seed.fasl")
   :BYTES 6513 :SHA256
   "e1c2f88a02d9013485a70a38946f3b67fda21a087b02099e14ef8daed443b6d7")
  (:PATH "raw/coverage-closed/fasl/src/index/package.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/index/package.fasl")
   :BYTES 1198 :SHA256
   "8277092aa6da6f94d02c9778c47c59db66a515f62aee059c34ede47a4f7d8f51")
  (:PATH "raw/coverage-closed/fasl/src/index/primary-arena.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/index/primary-arena.fasl")
   :BYTES 10765 :SHA256
   "2b3639fd262081f584eba5650d896318e50fce422d597ce93e6282b693905a3a")
  (:PATH "raw/coverage-closed/fasl/src/index/primary-build.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/index/primary-build.fasl")
   :BYTES 16295 :SHA256
   "260788e444ca3520dbfafc48d2fba32d7a4d2913f73bf94fa92e629bbce4d9ca")
  (:PATH "raw/coverage-closed/fasl/src/index/primary-core.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/index/primary-core.fasl")
   :BYTES 11771 :SHA256
   "dcad200967aff59af836f228045df32732e46c0b7cec0017ed7bccfecf0e6ce7")
  (:PATH "raw/coverage-closed/fasl/src/index/primary-directory.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/index/primary-directory.fasl")
   :BYTES 22876 :SHA256
   "b4d7345dfb7a7840aa9a5432bab3deea6e725a7c2fcc74b16155e7fae1222b95")
  (:PATH "raw/coverage-closed/fasl/src/index/primary-package.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/index/primary-package.fasl")
   :BYTES 1773 :SHA256
   "a3c12e9317b05499ba0e61e4819c82172bef46529c413012d3cb70c57d971d3f")
  (:PATH "raw/coverage-closed/fasl/src/index/primary-probe.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/index/primary-probe.fasl")
   :BYTES 22100 :SHA256
   "7d847b8567112eaf04624378726287a1788eead9f6a7f9ca0d3c75bf6713c105")
  (:PATH "raw/coverage-closed/fasl/src/index/primary-read.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/index/primary-read.fasl")
   :BYTES 11408 :SHA256
   "87be4ec99bef73631c26d72c86d684683a8a43276817a3cd13fd59a6d9f6d092")
  (:PATH "raw/coverage-closed/fasl/src/index/primary-relocate.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/index/primary-relocate.fasl")
   :BYTES 15953 :SHA256
   "09f127a651e16b3c06cda552077bead6924685aebd9a7155af08257157e3fd0b")
  (:PATH "raw/coverage-closed/fasl/src/index/primary-types.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/index/primary-types.fasl")
   :BYTES 41276 :SHA256
   "188a0844559e25617f218647e15d1e767a15ea7e5b755f5b850ac6d33a179b89")
  (:PATH "raw/coverage-closed/fasl/src/index/primary-write.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/index/primary-write.fasl")
   :BYTES 23967 :SHA256
   "232aa46271c10fafc3c6ad17cc60d903d50eae6fda4eff765f142c097b0d6cf9")
  (:PATH "raw/coverage-closed/fasl/src/index/read.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/index/read.fasl")
   :BYTES 11145 :SHA256
   "ad96f749cc4e061da36ccce9e9d977ea803cef0ec3ca205592359e92f9de6527")
  (:PATH "raw/coverage-closed/fasl/src/index/rebuild-budget.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/index/rebuild-budget.fasl")
   :BYTES 10024 :SHA256
   "bb071aac4c8885b042d3137093d75b30483143e56d92fbb58a49b335b044c28b")
  (:PATH "raw/coverage-closed/fasl/src/index/rebuild-copy.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/index/rebuild-copy.fasl")
   :BYTES 12320 :SHA256
   "2d9a37a259cf6cc8717db4d2d322a1643b2aba07ae99880fc50ca27e6dfb7461")
  (:PATH "raw/coverage-closed/fasl/src/index/rebuild-scan.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/index/rebuild-scan.fasl")
   :BYTES 18807 :SHA256
   "d1d819be536d26e61ad7ad38ea8e69d30aae8f675f6413fee79a053fbced54af")
  (:PATH "raw/coverage-closed/fasl/src/index/rebuild.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/index/rebuild.fasl")
   :BYTES 6298 :SHA256
   "0bd4bcd8e67d1a386b76e48bbf6050d2c9fb4b5860a5ece7be027a8ffa69b2f5")
  (:PATH "raw/coverage-closed/fasl/src/index/relocate.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/index/relocate.fasl")
   :BYTES 11587 :SHA256
   "621b655ee451431456b51644e23399d9393ab72df6f22208e7ffb4a0e0bd681e")
  (:PATH "raw/coverage-closed/fasl/src/index/types.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/index/types.fasl")
   :BYTES 12012 :SHA256
   "041cc79dd3b486c732baacca5959f4cc9e6006f52836ade78f34e315d0b42090")
  (:PATH "raw/coverage-closed/fasl/src/index/validation.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/index/validation.fasl")
   :BYTES 13508 :SHA256
   "a83370aeb172fe0b1d50f8d4305498c8e2b6b7f1f5d18ed3bb8d359e806b6db9")
  (:PATH "raw/coverage-closed/fasl/src/index/write.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/index/write.fasl")
   :BYTES 20653 :SHA256
   "613dea87c4843c90561ae968ce88bed4f2bd7c03156937beb0827f3e88cc9304")
  (:PATH "raw/coverage-closed/fasl/src/io/flush.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/io/flush.fasl")
   :BYTES 4968 :SHA256
   "590203505a6811c5882c4f8cd0b93083786ad052449e4987c46acb12033c0a8b")
  (:PATH "raw/coverage-closed/fasl/src/io/identity-types.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/io/identity-types.fasl")
   :BYTES 4889 :SHA256
   "12ad0a46e7d93d8ae49b8db462bf3ba5d0b3becc3a321ac53faaacec4041ee8e")
  (:PATH "raw/coverage-closed/fasl/src/io/identity.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/io/identity.fasl")
   :BYTES 8955 :SHA256
   "14091c42084691f832ff903699bf3b177d49fcd49f2330133c14a3338e3ddbb5")
  (:PATH "raw/coverage-closed/fasl/src/io/lifecycle.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/io/lifecycle.fasl")
   :BYTES 15000 :SHA256
   "9ebd58d0d51d20234ff8a209332ae61d6c3b6b915a14b540acbe0fd73fc25062")
  (:PATH "raw/coverage-closed/fasl/src/io/native.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/io/native.fasl")
   :BYTES 26778 :SHA256
   "78364b7103e51f6dc74814e7001a601cde5546adf66cf35ff18bb39196d013f9")
  (:PATH "raw/coverage-closed/fasl/src/io/package.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/io/package.fasl")
   :BYTES 1289 :SHA256
   "70d45878f9eb572ca850c064848079cfc693b5bcbab35183b90fcd98e47c62d5")
  (:PATH "raw/coverage-closed/fasl/src/io/transfer.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/io/transfer.fasl")
   :BYTES 18895 :SHA256
   "e3e6bf5687587300d61b8e70c1e3b77ec6348a819d64be606bc9ab6c6bc0e395")
  (:PATH "raw/coverage-closed/fasl/src/io/types.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/io/types.fasl")
   :BYTES 25427 :SHA256
   "90b9d523b59ff928016ea07ab344397b1cf639df85636c889c63abef604e57a2")
  (:PATH "raw/coverage-closed/fasl/src/mvcc/package.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/mvcc/package.fasl")
   :BYTES 1366 :SHA256
   "df832b6c1a57690c22834ed169867d562e3c81b26638bedf0518935e33262f22")
  (:PATH "raw/coverage-closed/fasl/src/mvcc/snapshots-core.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/mvcc/snapshots-core.fasl")
   :BYTES 18566 :SHA256
   "ff845d52348bb6f7fdfe864660a86f15b237c699ca5c28a2f3e62f01054cbc68")
  (:PATH "raw/coverage-closed/fasl/src/mvcc/snapshots-csn.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/mvcc/snapshots-csn.fasl")
   :BYTES 8062 :SHA256
   "1d559d3bedd5ebe0bbb7393ef1706803a3ffa59db67595fc0bdc8e00cb9c6f0a")
  (:PATH "raw/coverage-closed/fasl/src/mvcc/snapshots-lifecycle.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/mvcc/snapshots-lifecycle.fasl")
   :BYTES 16945 :SHA256
   "a553db065064c545439b52d8303e85e9c3d32e0a880f8cd559f24834f8bf7b64")
  (:PATH "raw/coverage-closed/fasl/src/mvcc/snapshots-read.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/mvcc/snapshots-read.fasl")
   :BYTES 19646 :SHA256
   "cca8c72de4f5203dfc6e818fb21e0f176e8adb25c058fcaa57e1c6f6346f1ac8")
  (:PATH "raw/coverage-closed/fasl/src/mvcc/snapshots-register.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/mvcc/snapshots-register.fasl")
   :BYTES 15818 :SHA256
   "7148fd168c58b6b7832b28250629f214cadc9f09fd104dab6239e43bd23ea738")
  (:PATH "raw/coverage-closed/fasl/src/mvcc/snapshots-types.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/mvcc/snapshots-types.fasl")
   :BYTES 25800 :SHA256
   "b2ce32b0d04c44d7e617f3498fc2f0b9200ca27b24c32c2c4729c62a83cdf219")
  (:PATH "raw/coverage-closed/fasl/src/mvcc/types.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/mvcc/types.fasl")
   :BYTES 1554 :SHA256
   "6adf714918b316e061a64815068e5d1e9724eba3feed668560ff8218338ced93")
  (:PATH "raw/coverage-closed/fasl/src/package.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/package.fasl")
   :BYTES 1504 :SHA256
   "4ef37278007a91cdd54593d7acdc6fa5e934bba51b9501949050d23c127ba00f")
  (:PATH "raw/coverage-closed/fasl/src/read/core.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/read/core.fasl")
   :BYTES 10004 :SHA256
   "a2569b0d5dfdff9140a7b666fdaa6af7e0701a9c3955407ce007188893fbfa4c")
  (:PATH "raw/coverage-closed/fasl/src/read/package.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/read/package.fasl")
   :BYTES 1258 :SHA256
   "02845cd7240bde850a61882a146826d32e432ac7b32043d405711b16d2de167b")
  (:PATH "raw/coverage-closed/fasl/src/read/task.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/read/task.fasl")
   :BYTES 20681 :SHA256
   "af134eb1e57eb2412425756dcebc961e592e7291b82ff2b2f51e27e63ad43b16")
  (:PATH "raw/coverage-closed/fasl/src/read/types.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/read/types.fasl")
   :BYTES 11219 :SHA256
   "32d07699281e0cf199a54d4f292abede9219ac6c5935c8edfb398451a20d3c3e")
  (:PATH "raw/coverage-closed/fasl/src/recovery/decisions-build.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/recovery/decisions-build.fasl")
   :BYTES 29766 :SHA256
   "e49642f259a7a1843477b29d5f25f91a598fa9f2bd66043515432c9bfcd645f6")
  (:PATH "raw/coverage-closed/fasl/src/recovery/decisions-package.fasl" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/recovery/decisions-package.fasl")
   :BYTES 1357 :SHA256
   "e3982bbf95261630120fa283eac143e9666172249e968b8ddd61530af486b267")
  (:PATH "raw/coverage-closed/fasl/src/recovery/decisions-query.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/recovery/decisions-query.fasl")
   :BYTES 11758 :SHA256
   "9629c287c15319d00bccddff354ef03ddb3e3753f6d306e283062bdfd3348530")
  (:PATH "raw/coverage-closed/fasl/src/recovery/decisions-radix.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/recovery/decisions-radix.fasl")
   :BYTES 25771 :SHA256
   "060e70973b6023029d3a23adc946c4932e6af88a6886354d216c66febd1aca46")
  (:PATH "raw/coverage-closed/fasl/src/recovery/decisions-sort.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/recovery/decisions-sort.fasl")
   :BYTES 24535 :SHA256
   "991fe45e0b1f069fd97cc5981d24dad0dd79207d5318e92b2c22389daa4f7039")
  (:PATH "raw/coverage-closed/fasl/src/recovery/decisions-types.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/recovery/decisions-types.fasl")
   :BYTES 12711 :SHA256
   "d533b1e96b6265f4d71a25399f97fbbfac720536a58d2af106bb85a2ce24916b")
  (:PATH "raw/coverage-closed/fasl/src/recovery/inventory-build.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/recovery/inventory-build.fasl")
   :BYTES 24704 :SHA256
   "753335771367ad7dcf7289ce697c26bfc0ce5ee580b55c15dae90390af101b36")
  (:PATH "raw/coverage-closed/fasl/src/recovery/inventory-query.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/recovery/inventory-query.fasl")
   :BYTES 4612 :SHA256
   "c16c7a8ee3454a45df5049dcf1b91d19329d7cdf0126d685e19a4035741fbf70")
  (:PATH "raw/coverage-closed/fasl/src/recovery/inventory-types.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/recovery/inventory-types.fasl")
   :BYTES 16469 :SHA256
   "37e4ea0ccf72772d3f9fc1b67cc7bde1ebac742541bbeb4c9532a3870fe85b46")
  (:PATH "raw/coverage-closed/fasl/src/recovery/manifest-build.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/recovery/manifest-build.fasl")
   :BYTES 25784 :SHA256
   "055ed1c049529155a4ea64737ace51a3e8bdd4159977b9fb082a9f02b6f9d4d5")
  (:PATH "raw/coverage-closed/fasl/src/recovery/manifest-decode.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/recovery/manifest-decode.fasl")
   :BYTES 17422 :SHA256
   "c0c1d3c442e4d277a9a06487536039042e3038f8899c89b72f7a983eb7e4df40")
  (:PATH "raw/coverage-closed/fasl/src/recovery/manifest-fold.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/recovery/manifest-fold.fasl")
   :BYTES 22645 :SHA256
   "11ecb1c607f8ef762853bb2c1f2aba34b038d10dd3ec6774883f48bacc84eeaf")
  (:PATH "raw/coverage-closed/fasl/src/recovery/manifest-package.fasl" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/recovery/manifest-package.fasl")
   :BYTES 1794 :SHA256
   "87fdc4353d48370aaa37536ce1384c6b9c825ad944be33a9029f06c8ddb8d1c9")
  (:PATH "raw/coverage-closed/fasl/src/recovery/manifest-query.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/recovery/manifest-query.fasl")
   :BYTES 8588 :SHA256
   "9b619a100712068d21c3011ee5890ebe44f6d1fe3a80a0c8c92d301356291041")
  (:PATH "raw/coverage-closed/fasl/src/recovery/manifest-types.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/recovery/manifest-types.fasl")
   :BYTES 34317 :SHA256
   "fc915fc13971cb5b999d9fa830bb3a13fc060bf0f2eb71919ac8972034650530")
  (:PATH "raw/coverage-closed/fasl/src/recovery/package.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/recovery/package.fasl")
   :BYTES 1400 :SHA256
   "635a04e355513b30ca6e867e018035ef6ea36c938b67fe18a19bc9636eabe7a2")
  (:PATH "raw/coverage-closed/fasl/src/recovery/scan.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/recovery/scan.fasl")
   :BYTES 37046 :SHA256
   "60dcbf1714f9f254ed56c620509490c3f3d44e0b8eac9f894bf2c2c5597b5507")
  (:PATH "raw/coverage-closed/fasl/src/scheduler/build.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/scheduler/build.fasl")
   :BYTES 5656 :SHA256
   "ddfcbb8377a410cc20577f97824b5dc762d53ddf0b26a3c6443f5035e5cbb118")
  (:PATH "raw/coverage-closed/fasl/src/scheduler/package.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/scheduler/package.fasl")
   :BYTES 1003 :SHA256
   "641b7867dbe74cc95887bbf818c44babd430fa9688bcc8b13348c343a95b96f6")
  (:PATH "raw/coverage-closed/fasl/src/scheduler/policy.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/scheduler/policy.fasl")
   :BYTES 6989 :SHA256
   "737b7200ce334615aebd3d6b0c2c1aad757fbe617d2fedeaebb1591ee1ee8d3c")
  (:PATH "raw/coverage-closed/fasl/src/scheduler/read.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/scheduler/read.fasl")
   :BYTES 4559 :SHA256
   "f8c0a1a02792e91b608694e151b2340c56d4c4450a8c312ddb0c8fd36c85e038")
  (:PATH "raw/coverage-closed/fasl/src/scheduler/types.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/scheduler/types.fasl")
   :BYTES 18693 :SHA256
   "5502991242c560ee1c69fa46a0dbb74a45d80eb0504eaaca81e1f597f4310269")
  (:PATH "raw/coverage-closed/fasl/src/scheduler/update.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/scheduler/update.fasl")
   :BYTES 7169 :SHA256
   "1e132bbf1a4dffe1457bb6614426853d2f8fa1e1f5bfb8094e29fef31a1afac1")
  (:PATH "raw/coverage-closed/fasl/src/series/events.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/series/events.fasl")
   :BYTES 26105 :SHA256
   "b57b83cf28029db54ab219f76685cd09ae4cea299ebb5fb44f5c14b8472ac043")
  (:PATH "raw/coverage-closed/fasl/src/series/io-events.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/series/io-events.fasl")
   :BYTES 13855 :SHA256
   "978760644c9155422554b71ee195af873342a0447f5f2b0fc9003c2ac30ccd72")
  (:PATH "raw/coverage-closed/fasl/src/series/ownership.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/series/ownership.fasl")
   :BYTES 21426 :SHA256
   "3ae8ea18e6caa85e389d38e62390b0e8a9d8a2cb4fcede83824d984b9fdfc8fe")
  (:PATH "raw/coverage-closed/fasl/src/series/package.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/series/package.fasl")
   :BYTES 1780 :SHA256
   "ac2033186e87bb5dff39c01c9af4b34321c3163cd5709097fceede9bf410da23")
  (:PATH "raw/coverage-closed/fasl/src/series/publication.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/series/publication.fasl")
   :BYTES 16562 :SHA256
   "4313bbd4938c4671edc5347d5799d39b515ae0d3fe50c54006bf3a9a5f731dca")
  (:PATH "raw/coverage-closed/fasl/src/series/query.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/series/query.fasl")
   :BYTES 8525 :SHA256
   "dd6f5fe1d528a37a0350237417438e52bf5e7a9c5ab46dfc110cdedd23cfd0c1")
  (:PATH "raw/coverage-closed/fasl/src/series/retirement.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/series/retirement.fasl")
   :BYTES 12378 :SHA256
   "3d3485e02fb3b8805c43a38065e0fd2a534a7fb554be6be57ea6d9f0e9a03292")
  (:PATH "raw/coverage-closed/fasl/src/series/routing-build.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/series/routing-build.fasl")
   :BYTES 9632 :SHA256
   "5d27f126a540ba312a267c6b831d7215dc37e4c4cde32fc702da54029f0d70a8")
  (:PATH "raw/coverage-closed/fasl/src/series/routing-select.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/series/routing-select.fasl")
   :BYTES 9545 :SHA256
   "fabeecd4e74ce5181c9f90207bcb7994c60ae005a51a5ddd154701ddb932b8bc")
  (:PATH "raw/coverage-closed/fasl/src/series/routing-types.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/series/routing-types.fasl")
   :BYTES 10816 :SHA256
   "1bc6235380d47ca9185812f4f1fdc466b708dbdf52457f13626c9e8048f6d034")
  (:PATH "raw/coverage-closed/fasl/src/series/types.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/series/types.fasl")
   :BYTES 39232 :SHA256
   "a1daa11e2010772243fecc31cf44170ce0eca209c6042a9ad943657709bfb692")
  (:PATH "raw/coverage-closed/fasl/src/series/worker-boundary.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/series/worker-boundary.fasl")
   :BYTES 10479 :SHA256
   "475016790045a9dcbe76c134723aec5358cb19f662196dec7dc6830ec427c980")
  (:PATH "raw/coverage-closed/fasl/src/series/worker-package.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/series/worker-package.fasl")
   :BYTES 1649 :SHA256
   "054ab12894e97a3705962ad05ba375c98b737c094448f938bd8fafe9f60004ed")
  (:PATH "raw/coverage-closed/fasl/src/series/worker-run.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/series/worker-run.fasl")
   :BYTES 19685 :SHA256
   "6cc4099b37765b6bcce5a5169cf5468178aabd03fdd0ad957b7a83204a506686")
  (:PATH "raw/coverage-closed/fasl/src/series/worker-types.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/series/worker-types.fasl")
   :BYTES 22522 :SHA256
   "343098ba28276de60a13bb645f73b8276354e8c3f29db1bfe55e864406a22e03")
  (:PATH "raw/coverage-closed/fasl/src/storage/compaction-scan.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/storage/compaction-scan.fasl")
   :BYTES 13808 :SHA256
   "ec88501ad781b6352dcd11d658981819d86270d25ba80c27af399ebc1acd41fc")
  (:PATH "raw/coverage-closed/fasl/src/storage/control-payload.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/storage/control-payload.fasl")
   :BYTES 18197 :SHA256
   "ba6f955c7132c7a3badd992885d51629469c595c2fa33958c58101d083699d66")
  (:PATH "raw/coverage-closed/fasl/src/storage/formats.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/storage/formats.fasl")
   :BYTES 10994 :SHA256
   "215aed95c6118022ab88f93476c03de34da8ca651820c4210fe0c9552ba993dd")
  (:PATH "raw/coverage-closed/fasl/src/storage/log-header.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/storage/log-header.fasl")
   :BYTES 12798 :SHA256
   "3431172b158b687d54c3cbca886dcf9ec9f5e23e1df86ae47888e5197b2d80ec")
  (:PATH "raw/coverage-closed/fasl/src/storage/package.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/storage/package.fasl")
   :BYTES 1558 :SHA256
   "352369fd7e3f3153bb02d8232d3b0c2ffd42d6ae7515e9dddfd5d7f558cf0dc8")
  (:PATH "raw/coverage-closed/fasl/src/storage/payload-record.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/storage/payload-record.fasl")
   :BYTES 8772 :SHA256
   "ecb8e875f6f38df492b3f2192c01eff678daf50881586043511e4889da6c0459")
  (:PATH "raw/coverage-closed/fasl/src/storage/payload-write.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/storage/payload-write.fasl")
   :BYTES 14877 :SHA256
   "4bda3603d31846e5acb65d7bd281bcf88d0941656d2e590ec685ad75389aa15d")
  (:PATH "raw/coverage-closed/fasl/src/storage/segment-header.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/storage/segment-header.fasl")
   :BYTES 16852 :SHA256
   "4d3b1a2b87c991871447bc0f7de29d364ea02f2924619709d2c13329e2ffcdd7")
  (:PATH "raw/coverage-closed/fasl/src/wal/builder.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/wal/builder.fasl")
   :BYTES 22927 :SHA256
   "f1fc5e4a2561e39fd3e0af63d57e48689d4fc5bd3f74d9cf1ad684e11f6e03f1")
  (:PATH "raw/coverage-closed/fasl/src/wal/csn.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/wal/csn.fasl")
   :BYTES 23999 :SHA256
   "2c8b9f72ff33d1c7cee6ce198fc2d1d009ae9d79dd6108bf0420c98fa65bdec1")
  (:PATH "raw/coverage-closed/fasl/src/wal/executor.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/wal/executor.fasl")
   :BYTES 19763 :SHA256
   "c4cf00f241fd80e845a895f3335b0580500078d0e62a4cb008cce7a84d118fcf")
  (:PATH "raw/coverage-closed/fasl/src/wal/group.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/wal/group.fasl")
   :BYTES 17864 :SHA256
   "2bf61ddd7e998eeb127014bc15c46dd525248cac54902bb54b4f040c669b45ce")
  (:PATH "raw/coverage-closed/fasl/src/wal/package.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/wal/package.fasl")
   :BYTES 2183 :SHA256
   "44f77a9c1a496ca016e9dfa7a1b477d3b43d2f89c4eac5f38c9b87d99ae40a00")
  (:PATH "raw/coverage-closed/fasl/src/wal/types.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/src/wal/types.fasl")
   :BYTES 46366 :SHA256
   "0cca0f635b1494a3b65ebc01f42bbae7f6bf2b2b1dd796fdab8f04d962d6cf94")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-float-write-support.fasl"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/codec/cbor-float-write-support.fasl")
   :BYTES 64976 :SHA256
   "480d43b8b826ac030630631472357c6a60d2ef6a6070ca05a6eeb32b899d9152")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-float-write-threads.fasl"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/codec/cbor-float-write-threads.fasl")
   :BYTES 17914 :SHA256
   "1b3df49b236c18c742914e2db44bc30bd55162837ce8b5cdb83e0685df35d030")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-float-write.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/codec/cbor-float-write.fasl")
   :BYTES 93345 :SHA256
   "37e5f242a7e07b678012dcb992da7621a6140e965b823d5110a7559767f1b838")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-header.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/codec/cbor-header.fasl")
   :BYTES 50936 :SHA256
   "c00bebac864be7cfdf19c7372f853e83efd7d878148760bd7a69dd84bd6593b9")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-minimal-edges.fasl" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/codec/cbor-minimal-edges.fasl")
   :BYTES 6376 :SHA256
   "7ef3b4cfa4919ee1c037c09ac01cc10a82076cd9fdd8335593a9f327ddf9f699")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-minimal-scan-support.fasl"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/codec/cbor-minimal-scan-support.fasl")
   :BYTES 55142 :SHA256
   "af6254006ff457110f973d2edec38823a3d87a5655a641e3dee8f30276658c0a")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-minimal-scan-threads.fasl"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/codec/cbor-minimal-scan-threads.fasl")
   :BYTES 21280 :SHA256
   "182d5218b3628fa09b797861917867b78b4aed451aff4e8f43de856bd199aaf7")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-minimal-scan.fasl" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/codec/cbor-minimal-scan.fasl")
   :BYTES 76658 :SHA256
   "72c099ef5ec16c81b2499dfb00ec3dff4413db3211dc88adff5ca1fc73e23cc1")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-minimal-support.fasl"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/codec/cbor-minimal-support.fasl")
   :BYTES 54134 :SHA256
   "2952b6a4407e4c71ec8e4df65e858c219ef1d127aa8edab36c79a267aa7566e8")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-minimal-threads.fasl"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/codec/cbor-minimal-threads.fasl")
   :BYTES 18093 :SHA256
   "78ff37dc270a06b591e4dbdfa2a86e24624a73caf37bcde80c2e9ef8f7f1e04b")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-minimal.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/codec/cbor-minimal.fasl")
   :BYTES 55768 :SHA256
   "e45848b497b2ee8df1f01408293535f0d25312977c9fda60596b533228159719")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-simple-write-support.fasl"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/codec/cbor-simple-write-support.fasl")
   :BYTES 31081 :SHA256
   "15a777eda2fd7d8480b07f0ba9704b8a95f699e8c949917fd2358b0b4164ce3d")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-simple-write-threads.fasl"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/codec/cbor-simple-write-threads.fasl")
   :BYTES 17994 :SHA256
   "800c1ea5b65dcac4c88c87b0f3a9a16f664c8ce22aa884ce0bc12c6ca4da6af7")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-simple-write.fasl" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/codec/cbor-simple-write.fasl")
   :BYTES 52716 :SHA256
   "0c1bd5124de082539e70a107c714c498ec0c1ce9fa58f76cf27d5091b764c46d")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-string-write-support.fasl"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/codec/cbor-string-write-support.fasl")
   :BYTES 37650 :SHA256
   "e45ea7ce65098d950e1107495c5159d295883064b48b3026a0f5908871fc1028")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-string-write-threads.fasl"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/codec/cbor-string-write-threads.fasl")
   :BYTES 17605 :SHA256
   "4a19b14b64c36036fe64ab1f011d9e97cfaff425a79a2b8f92e62ddc0b7d464b")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-string-write.fasl" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/codec/cbor-string-write.fasl")
   :BYTES 67518 :SHA256
   "6e096ad162c576a3a0d7740e57fe57d9a6dbc3cdcac3c01e0bdfaba042555e3a")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-structure-support.fasl"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/codec/cbor-structure-support.fasl")
   :BYTES 71326 :SHA256
   "76c02c364be1c73759a467de3dbd66beceba5a1e7d8250e9f9f44ed70d77570e")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-structure-threads.fasl"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/codec/cbor-structure-threads.fasl")
   :BYTES 21613 :SHA256
   "a33111f38b8e89a0d9bebe91ec6f27a60b50c1bab9db8392e892c610a5620641")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-structure.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/codec/cbor-structure.fasl")
   :BYTES 93259 :SHA256
   "439f749f82e3d229823044cec9ba3eef6baac9b4fc3cbb74a81fc57300c56605")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-support.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/codec/cbor-support.fasl")
   :BYTES 39008 :SHA256
   "84bfd0eea3e10808b524c4894c11dcd9e80e0c007c2bef7d6cde8255eae6317b")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-threads.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/codec/cbor-threads.fasl")
   :BYTES 17901 :SHA256
   "9567d573963a3610f3ac2bc024351b94a0f8c26ea1d482a29e604bba35e719bf")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-write-roundtrip.fasl"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/codec/cbor-write-roundtrip.fasl")
   :BYTES 5213 :SHA256
   "4b1012e518b11760cc96894a5c046104a8e61297f92772512254c48379c195bd")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-write-support.fasl" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/codec/cbor-write-support.fasl")
   :BYTES 27511 :SHA256
   "3a1f2cf5e7d7a78cf4cf5c31c5a70b41198cad1b598002d2046d995792cb6124")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-write-threads.fasl" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/codec/cbor-write-threads.fasl")
   :BYTES 17873 :SHA256
   "07c602be59078fe3a078ee06462d501a9edfdbd45361c275c5a5d1cde41db695")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-write.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/codec/cbor-write.fasl")
   :BYTES 43604 :SHA256
   "1380614f6e43940731967d6dd7c56cf90ee284fd605b1921beacc5e556f738cc")
  (:PATH "raw/coverage-closed/fasl/tests/codec/support.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/codec/support.fasl")
   :BYTES 35215 :SHA256
   "312bf210968d78406eec16a8b8496baedf67d54829845167cb8dbe58d56b472c")
  (:PATH "raw/coverage-closed/fasl/tests/codec/threads.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/codec/threads.fasl")
   :BYTES 15055 :SHA256
   "db418564af810b21f57aeab72132e725982a4ed6e36caff8388ca6035b705e0f")
  (:PATH "raw/coverage-closed/fasl/tests/codec/utf8.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/codec/utf8.fasl")
   :BYTES 59043 :SHA256
   "b74c5320b4784cea673f57d79a8af5aae77d29ccacd580529594a83ee8f90fe4")
  (:PATH "raw/coverage-closed/fasl/tests/csn/registry.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/csn/registry.fasl")
   :BYTES 109829 :SHA256
   "c0121af5cef410329c93bc5e03d05b2093b58f3968bebf5ffb72de24265d43bd")
  (:PATH "raw/coverage-closed/fasl/tests/csn/support.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/csn/support.fasl")
   :BYTES 78028 :SHA256
   "9cad104cbd2a6179d9284429baf138b64b28d77737f3e3293294e30e1e87f85e")
  (:PATH "raw/coverage-closed/fasl/tests/csn/threads.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/csn/threads.fasl")
   :BYTES 49397 :SHA256
   "e5172d7b635ecc69fb6aaca2ddde316031efcb17580c0e652871209383a8c56a")
  (:PATH "raw/coverage-closed/fasl/tests/epochs/lifecycle.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/epochs/lifecycle.fasl")
   :BYTES 188392 :SHA256
   "eac3a5a2a957de96c9ee51507a48a47862a5bfd0c63c410bcbfababb61ae09fe")
  (:PATH "raw/coverage-closed/fasl/tests/epochs/support.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/epochs/support.fasl")
   :BYTES 43365 :SHA256
   "76a73af2d42019b49d8ab591fa82afe2303d558f4a7f0f99b9a33877e563b33a")
  (:PATH "raw/coverage-closed/fasl/tests/epochs/threads.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/epochs/threads.fasl")
   :BYTES 23188 :SHA256
   "97f25eda983822ca2b572fcc399fb4963017c7e9699e4c3ee03d30b7d3c42980")
  (:PATH "raw/coverage-closed/fasl/tests/execution/handoff.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/execution/handoff.fasl")
   :BYTES 196932 :SHA256
   "ea2be4edfc85865f6f493ff63e35176ea3e9759417d64407596300946e0a04f3")
  (:PATH "raw/coverage-closed/fasl/tests/execution/queue.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/execution/queue.fasl")
   :BYTES 85790 :SHA256
   "6586d90f9bc32f79fb558f857d014bfff5d8c8b0d02bb9f07d9647f7baf53b9c")
  (:PATH "raw/coverage-closed/fasl/tests/execution/ready-recycle.fasl" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/execution/ready-recycle.fasl")
   :BYTES 156694 :SHA256
   "84cd8a2172c77d54fcb2a977b4814b55f2b595024fa3c664af0ac34b366866c9")
  (:PATH "raw/coverage-closed/fasl/tests/execution/ready.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/execution/ready.fasl")
   :BYTES 191334 :SHA256
   "d471113d53144b453e19a4ea73fda184225d0f5b73b62ae8ea3bd37d6c566821")
  (:PATH "raw/coverage-closed/fasl/tests/execution/support.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/execution/support.fasl")
   :BYTES 29611 :SHA256
   "7a74ac6f74a2ae4fb418c6c81b559b55252449f7d5d44a2e5d4668b5970e8455")
  (:PATH "raw/coverage-closed/fasl/tests/execution/threads.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/execution/threads.fasl")
   :BYTES 65488 :SHA256
   "a426f0da058d37d7e0a842aa917374c30d343c3de77f407bf032b2777d1f10f7")
  (:PATH "raw/coverage-closed/fasl/tests/execution/worker.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/execution/worker.fasl")
   :BYTES 354772 :SHA256
   "0fcff4041442023a6cd28efc54f5e59262a1cee7079e623a34d9d8da8069b6b9")
  (:PATH "raw/coverage-closed/fasl/tests/foundation/batch.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/foundation/batch.fasl")
   :BYTES 43974 :SHA256
   "8af4b523a5eab3861f506f3ab269730f24e44b33a8ec4f316d76ed7e51a5a13a")
  (:PATH "raw/coverage-closed/fasl/tests/foundation/binary.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/foundation/binary.fasl")
   :BYTES 32088 :SHA256
   "09de86ae6a0e36433f5f6e3342b3f0d788383c0b159ce36a88ca45e0908a75bf")
  (:PATH "raw/coverage-closed/fasl/tests/foundation/record.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/foundation/record.fasl")
   :BYTES 129721 :SHA256
   "15209273f6b3af523c7e55df25f7fd226c228d9d519ba9e1ede72eabcf1b1514")
  (:PATH "raw/coverage-closed/fasl/tests/foundation/support.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/foundation/support.fasl")
   :BYTES 17114 :SHA256
   "e8c3ed9872a622afb2d83904e9134dff68ceae276cd8f6fe162a3dabc2984da3")
  (:PATH "raw/coverage-closed/fasl/tests/get-active/construction.fasl" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/get-active/construction.fasl")
   :BYTES 107507 :SHA256
   "5bc73ff3bbc6a865b6a4e409b09405725a7f42c5b7db19d249d3a405925232a2")
  (:PATH "raw/coverage-closed/fasl/tests/get-active/directory.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/get-active/directory.fasl")
   :BYTES 39446 :SHA256
   "0b44c1772bcc58c451b3db6390613ef9be33e1a1f5d2c95ad32082f01596db48")
  (:PATH "raw/coverage-closed/fasl/tests/get-active/read.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/get-active/read.fasl")
   :BYTES 144898 :SHA256
   "6782381fbd3e12da0fec21070b22e53fef2b351e538a7edc7f972130bb3e161b")
  (:PATH "raw/coverage-closed/fasl/tests/get-active/support.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/get-active/support.fasl")
   :BYTES 224440 :SHA256
   "4347b7f384a71936dd13729b4e5349fce80200d04fab85b020cc322051e254f2")
  (:PATH "raw/coverage-closed/fasl/tests/get-directory/construction.fasl"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/get-directory/construction.fasl")
   :BYTES 82972 :SHA256
   "f730a88fff4cafaff2501708dd11b8515537192cd9254f1787acf877671a2518")
  (:PATH "raw/coverage-closed/fasl/tests/get-directory/read.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/get-directory/read.fasl")
   :BYTES 159077 :SHA256
   "3741ac8180d4ee7db37f68336cd3b40d89dd361ecb4bd794259304761a68b90e")
  (:PATH "raw/coverage-closed/fasl/tests/get-directory/series-read.fasl"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/get-directory/series-read.fasl")
   :BYTES 218216 :SHA256
   "7cbcb9e08a3b6c8be4201112256593d81bfbad4927918a1cf8236daef2b6ad3c")
  (:PATH "raw/coverage-closed/fasl/tests/get-directory/series-support.fasl"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/get-directory/series-support.fasl")
   :BYTES 117799 :SHA256
   "c238874ce4c8756efba1c8fb374a93287c94d1f3e6674c0a1f8c850fe3395fd8")
  (:PATH "raw/coverage-closed/fasl/tests/get-directory/support.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/get-directory/support.fasl")
   :BYTES 163537 :SHA256
   "409c0f4cb14e623b9d511c8fa16337bab0cdc86e7eceeb83c59ae7b317647c55")
  (:PATH "raw/coverage-closed/fasl/tests/get-directory/threads.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/get-directory/threads.fasl")
   :BYTES 31619 :SHA256
   "f6315f6728c752bbfd484b8a2343c15aac2427e85373135bde1b5380a7c10ecf")
  (:PATH "raw/coverage-closed/fasl/tests/get-performance/guards.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/get-performance/guards.fasl")
   :BYTES 41790 :SHA256
   "dc76d44be8a9aa5c157f7c95d4d2b12fbc46c4bae6ae4df063189e62c03abbc1")
  (:PATH "raw/coverage-closed/fasl/tests/get-performance/paths.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/get-performance/paths.fasl")
   :BYTES 32736 :SHA256
   "93ebb260b6d9de1cf3e3f45e57228ea7d820ffad8c0ca8f0fd90e89edb2c0977")
  (:PATH "raw/coverage-closed/fasl/tests/get-performance/support.fasl" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/get-performance/support.fasl")
   :BYTES 142379 :SHA256
   "5eb06eea901c85d04b946a96f0045e09a30f3eaee2b3d84f11cdfce57fa6d9c9")
  (:PATH "raw/coverage-closed/fasl/tests/get-performance/threads.fasl" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/get-performance/threads.fasl")
   :BYTES 21167 :SHA256
   "ec82ed1f5591ff16e0a2624ec25638ceaa4d3d1768ed003b771096f5a88d3739")
  (:PATH "raw/coverage-closed/fasl/tests/get-resolver/construction.fasl"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/get-resolver/construction.fasl")
   :BYTES 75576 :SHA256
   "0a363db0ed5d5445284f98be5977443d12852a06fdbe444db5efa51a2f6f2233")
  (:PATH "raw/coverage-closed/fasl/tests/get-resolver/read.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/get-resolver/read.fasl")
   :BYTES 157205 :SHA256
   "8abe54d4037e9f78725e0e46e545562e958b326c44bf843a08257edc9af8d0b5")
  (:PATH "raw/coverage-closed/fasl/tests/get-resolver/sort.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/get-resolver/sort.fasl")
   :BYTES 39431 :SHA256
   "7441088d898c7071c1ec0cf413bced1625f49e16787a24b337e680e0cd3bf401")
  (:PATH "raw/coverage-closed/fasl/tests/get-resolver/support.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/get-resolver/support.fasl")
   :BYTES 163592 :SHA256
   "f0a42a4ce43060e8f43c9e699d42c5735639aad1f9904ea367af3fd0cb891d1a")
  (:PATH "raw/coverage-closed/fasl/tests/get/lifecycle.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/get/lifecycle.fasl")
   :BYTES 181794 :SHA256
   "f96fd7e132d8f2b48756a8b7032b6a1c3aaadcc6c27cd1cd52ead8d09b994b4d")
  (:PATH "raw/coverage-closed/fasl/tests/get/segment.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/get/segment.fasl")
   :BYTES 131220 :SHA256
   "3a9a6181d5e51472b5c01ed85f68e6b7fd93656d99a015b33439aee750855a16")
  (:PATH "raw/coverage-closed/fasl/tests/get/support.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/get/support.fasl")
   :BYTES 106880 :SHA256
   "ffc06f2a42a217121d8193c7d97a1aabe5a100b370b233660437838036613565")
  (:PATH "raw/coverage-closed/fasl/tests/hash/guards.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/hash/guards.fasl")
   :BYTES 8309 :SHA256
   "e62d7dcc5720cb8197dab4c1e7781166f560be2a60c5d9c1ef1093935accaf02")
  (:PATH "raw/coverage-closed/fasl/tests/hash/hash64.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/hash/hash64.fasl")
   :BYTES 82836 :SHA256
   "64d57875d3f0195b0b37191673bff8a924093c3385777709dbff09ab0fef9131")
  (:PATH "raw/coverage-closed/fasl/tests/hash/support.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/hash/support.fasl")
   :BYTES 60593 :SHA256
   "b003ed42731f6e5f0c7d9fdd50c25ad9b2b3925ef8173eecbb763da2295984b7")
  (:PATH "raw/coverage-closed/fasl/tests/hash/threads.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/hash/threads.fasl")
   :BYTES 32523 :SHA256
   "b2321f80d633d9032be93510c5affa2a06a7f76627b393740169f789a4025712")
  (:PATH "raw/coverage-closed/fasl/tests/index/hash-digests.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/index/hash-digests.fasl")
   :BYTES 202726 :SHA256
   "8ad631eb7a56e5dc245887bb2ee8ab9ad3cbfd0d4be9a3be44d097a83785df2d")
  (:PATH "raw/coverage-closed/fasl/tests/index/primary-support.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/index/primary-support.fasl")
   :BYTES 66477 :SHA256
   "209337f75d24218e6e252d63863d15a6c01d89955b1a996e930dec0824074d39")
  (:PATH "raw/coverage-closed/fasl/tests/index/primary-threads.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/index/primary-threads.fasl")
   :BYTES 72503 :SHA256
   "e866b28fc96fb13e91e7e13fd6a1ead0ad532977cad84f527aeae77b2a802146")
  (:PATH "raw/coverage-closed/fasl/tests/index/primary.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/index/primary.fasl")
   :BYTES 193992 :SHA256
   "92294f13f2cca30a1473910d5c8053475ed264b79cbd68f5d2bcf42e20e5dbd6")
  (:PATH "raw/coverage-closed/fasl/tests/index/rebuild.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/index/rebuild.fasl")
   :BYTES 183033 :SHA256
   "f4f864e5fb1c504bcd7733866f3c606e56f01e6b29c5d73e6a8881105faf0a8d")
  (:PATH "raw/coverage-closed/fasl/tests/index/slot-support.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/index/slot-support.fasl")
   :BYTES 62581 :SHA256
   "353cb5e6a4c2f76dfd2bfacd6335b908641acbc85315811d82e57e1f9fc9107c")
  (:PATH "raw/coverage-closed/fasl/tests/index/slot-threads.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/index/slot-threads.fasl")
   :BYTES 69701 :SHA256
   "7706e17fff0f9812ea99b5f7b1bcb43fef80460a2778067aecbae456b30d1f2a")
  (:PATH "raw/coverage-closed/fasl/tests/index/slots.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/index/slots.fasl")
   :BYTES 194628 :SHA256
   "ed9de171ecbf7b09f5ff19ba4bba0845007fa27f40c4c8dc26d7e9c9d0aebd17")
  (:PATH "raw/coverage-closed/fasl/tests/io/native.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/io/native.fasl")
   :BYTES 65699 :SHA256
   "a0587a0393e5ab97dbbf7ae31dd88c16b7541c6bdb62d363545477a1c995ff99")
  (:PATH "raw/coverage-closed/fasl/tests/io/support.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/io/support.fasl")
   :BYTES 23464 :SHA256
   "0192ffc7d970c7398921a043c70134989e1f818f987f4ed077ca98adb3cc128b")
  (:PATH "raw/coverage-closed/fasl/tests/io/transfer.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/io/transfer.fasl")
   :BYTES 114055 :SHA256
   "21bfd570a1a57b295a28d5f69718bddcac3d4073a7c9eccc7c3c4ca5c1c6a2d3")
  (:PATH "raw/coverage-closed/fasl/tests/mvcc/capture.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/mvcc/capture.fasl")
   :BYTES 112444 :SHA256
   "4d068e9d3c7a600805c62d982a30f95e9659a726c26176857f7e1f53c3b0212b")
  (:PATH "raw/coverage-closed/fasl/tests/mvcc/lifecycle.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/mvcc/lifecycle.fasl")
   :BYTES 222608 :SHA256
   "ec632f8821e9c2b2e748f7dae11637994060f515e3a3363018276526241aaad2")
  (:PATH "raw/coverage-closed/fasl/tests/mvcc/support.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/mvcc/support.fasl")
   :BYTES 46352 :SHA256
   "8e43c83682e08508d2ec81749d75b8038d9c33cecbbf63d5c233aef1e7ef90e4")
  (:PATH "raw/coverage-closed/fasl/tests/read/lifecycle.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/read/lifecycle.fasl")
   :BYTES 286954 :SHA256
   "4d1942b407dd3b0cbeb064ded860d7c078fbc690c1a70ac75aa44c06e9d41970")
  (:PATH "raw/coverage-closed/fasl/tests/read/support.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/read/support.fasl")
   :BYTES 41727 :SHA256
   "4e604cccc5affaa92fff7183469659a63f4ccb905db9b564c8922f578dc7d47e")
  (:PATH "raw/coverage-closed/fasl/tests/read/threads.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/read/threads.fasl")
   :BYTES 39199 :SHA256
   "579ac3679c7796dab7d0592b17ed0cc77f94e0d71ccb745e56e78f499168ae95")
  (:PATH "raw/coverage-closed/fasl/tests/recovery/corruption.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/recovery/corruption.fasl")
   :BYTES 35294 :SHA256
   "12c9cbfe48a48a6b93160e8399f9fe055f9934d6dd5b924c08cd695033c7003b")
  (:PATH "raw/coverage-closed/fasl/tests/recovery/decisions-audit.fasl" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/recovery/decisions-audit.fasl")
   :BYTES 75398 :SHA256
   "c7f4e92750c1363826aa5b928421395c22d8cce69d69a1e4a5b5f24f45dc02ef")
  (:PATH "raw/coverage-closed/fasl/tests/recovery/decisions-radix.fasl" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/recovery/decisions-radix.fasl")
   :BYTES 146469 :SHA256
   "15291bb842493d8b5b9c602d069c17fc049fc36cf43712595932b798b00f8f60")
  (:PATH "raw/coverage-closed/fasl/tests/recovery/decisions-support.fasl"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/recovery/decisions-support.fasl")
   :BYTES 35952 :SHA256
   "ccc7de7d3600f9af90d480e748074cba003350e5cdbe925d0b337feea92feea6")
  (:PATH "raw/coverage-closed/fasl/tests/recovery/decisions.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/recovery/decisions.fasl")
   :BYTES 117731 :SHA256
   "90a397825e72def467ba479907fad9d6df1c3088dc12f3e50867e5f58bafca5f")
  (:PATH "raw/coverage-closed/fasl/tests/recovery/inventory-support.fasl"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/recovery/inventory-support.fasl")
   :BYTES 42480 :SHA256
   "34445417f18d580762d031713820e6c845b4c0385b04dfd920486ccf2b5f793d")
  (:PATH "raw/coverage-closed/fasl/tests/recovery/inventory.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/recovery/inventory.fasl")
   :BYTES 78880 :SHA256
   "c5c031277561e45848c3bff083d06f666759043c997879cd4f74fa5dbbfc46be")
  (:PATH "raw/coverage-closed/fasl/tests/recovery/manifest-audit.fasl" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/recovery/manifest-audit.fasl")
   :BYTES 96389 :SHA256
   "ce8c88a5e7246956f2c9d5c28d38f076aea11d77d60d7f2f6519cf09db65db6f")
  (:PATH "raw/coverage-closed/fasl/tests/recovery/manifest-support.fasl"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/recovery/manifest-support.fasl")
   :BYTES 54500 :SHA256
   "d437235419b425446bd569a7ac79cbe5ec18635b8f8d97d56b458fa1ab50f45b")
  (:PATH "raw/coverage-closed/fasl/tests/recovery/manifest.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/recovery/manifest.fasl")
   :BYTES 71116 :SHA256
   "a1f93443931162088323943e80bc17f02e57962f6be54614be207038ba959c65")
  (:PATH "raw/coverage-closed/fasl/tests/recovery/scan.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/recovery/scan.fasl")
   :BYTES 108282 :SHA256
   "835c7dda0b05cef1e887ad1b60574233e401c2b8a896b80f6b2d3436f37e5e99")
  (:PATH "raw/coverage-closed/fasl/tests/recovery/support.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/recovery/support.fasl")
   :BYTES 34715 :SHA256
   "b5318dce3eb2dabd3d4626788b26347f0a502a8ab354884eeedb5a96ad7d5d53")
  (:PATH "raw/coverage-closed/fasl/tests/scheduler/controller.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/scheduler/controller.fasl")
   :BYTES 108267 :SHA256
   "e57b0b0f44775ffcdeffcb0c9b05265f239973900250b4fceed99dd8ab083cf7")
  (:PATH "raw/coverage-closed/fasl/tests/scheduler/support.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/scheduler/support.fasl")
   :BYTES 19473 :SHA256
   "d16535e3967b9ed954aaa09e705185d0a890e036b09e5e85c896b45568be9636")
  (:PATH "raw/coverage-closed/fasl/tests/series/boundaries.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/series/boundaries.fasl")
   :BYTES 26472 :SHA256
   "09e6b686ec6d9b7a439fdad9403239a2e3035c0cac2c694d40b5ea74c220352a")
  (:PATH "raw/coverage-closed/fasl/tests/series/controller.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/series/controller.fasl")
   :BYTES 304530 :SHA256
   "769321f1d65f10c5ab276731067d01c4c72d9f66a3a1091449ba6909c0cedfc2")
  (:PATH "raw/coverage-closed/fasl/tests/series/support.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/series/support.fasl")
   :BYTES 119667 :SHA256
   "e527d507b18037847a2a6b24e242cbed434b2304683bde819ff0d10052454ff6")
  (:PATH "raw/coverage-closed/fasl/tests/series/threads.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/series/threads.fasl")
   :BYTES 89539 :SHA256
   "cebe124faaca0d21e48a4716038dfebdfd77432daee0332f207b3749353458c9")
  (:PATH "raw/coverage-closed/fasl/tests/series/worker-bridge.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/series/worker-bridge.fasl")
   :BYTES 280761 :SHA256
   "f616edfc8e20b3eadbc0613c6e96ebf1163b85ee39d7d7ac03fdb6957197b372")
  (:PATH "raw/coverage-closed/fasl/tests/series/worker-routing.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/series/worker-routing.fasl")
   :BYTES 156729 :SHA256
   "7def52a6314c104a6a0653ae5d8adf30067ba802a9c00b110cd9ec23962bee62")
  (:PATH "raw/coverage-closed/fasl/tests/smoke.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/smoke.fasl")
   :BYTES 4859 :SHA256
   "680b9b0e9440d0435bfacef7ee2a7847b9d3612476e84beae7fef85152d206a0")
  (:PATH "raw/coverage-closed/fasl/tests/storage/compaction-scan.fasl" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/storage/compaction-scan.fasl")
   :BYTES 80088 :SHA256
   "c93af0d4f6790550b4a54e2a2335d505d2c07b29068c787fabad8a41b4d4f74a")
  (:PATH "raw/coverage-closed/fasl/tests/storage/control-payload.fasl" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/storage/control-payload.fasl")
   :BYTES 123127 :SHA256
   "6a6016458f4a60d327c583beca19b56dd46a283a72cd3589d41f82d8f7698ef8")
  (:PATH "raw/coverage-closed/fasl/tests/storage/log-header.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/storage/log-header.fasl")
   :BYTES 79472 :SHA256
   "552d5c9ec2618dc291d3ab8b559f036de51979cdf7ef20abb02cdf5ad85976e1")
  (:PATH "raw/coverage-closed/fasl/tests/storage/segment-header.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/storage/segment-header.fasl")
   :BYTES 38955 :SHA256
   "cc452c2800d7d3eeb7c441d4c0e166d277c0e6f38cb42aeb24cc9d2b9e34d84e")
  (:PATH "raw/coverage-closed/fasl/tests/storage/support.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/storage/support.fasl")
   :BYTES 28177 :SHA256
   "134cc62f2bcc4e8014ccf0bc99a4feed65f2defa55a0e72c3df9b6b7d4756553")
  (:PATH "raw/coverage-closed/fasl/tests/wal/builder.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/wal/builder.fasl")
   :BYTES 39776 :SHA256
   "ffaf34def1368c5221db7a22840a56ebbb26e98d4a3230ba6f8a6e11b2f35db5")
  (:PATH "raw/coverage-closed/fasl/tests/wal/csn-threads.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/wal/csn-threads.fasl")
   :BYTES 65563 :SHA256
   "68000b23a2c9f599fd6a5e082ad0df0e833def7382c06397603272b3c866b30d")
  (:PATH "raw/coverage-closed/fasl/tests/wal/csn.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/wal/csn.fasl")
   :BYTES 220505 :SHA256
   "2043320adfb954e58263b7421a77430934e80122de3be353348430fdee7828d3")
  (:PATH "raw/coverage-closed/fasl/tests/wal/fault.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/wal/fault.fasl")
   :BYTES 65701 :SHA256
   "3bb859d23db1d742841e25f663d53c64dc4810648b62dc578b569ede8e49a795")
  (:PATH "raw/coverage-closed/fasl/tests/wal/group.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/wal/group.fasl")
   :BYTES 57955 :SHA256
   "4518c4513bf16c163d8a0f4561a26c4d5f4003533ed51394378bd3d617a65072")
  (:PATH "raw/coverage-closed/fasl/tests/wal/native.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/wal/native.fasl")
   :BYTES 21736 :SHA256
   "c1cb1df3e36d26453a34a1ba595ac9738590704cc1dce956bd470e54ffc829c9")
  (:PATH "raw/coverage-closed/fasl/tests/wal/support.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/get-resolver-active-compat-R2/fasl/tests/wal/support.fasl")
   :BYTES 14758 :SHA256
   "65b965a5c529e5addd805733d8312f659416955a6e9748576fa765ccb3249ad7")
  (:PATH "raw/reader-process-fixtures/completion-exit/isolated-build.lisp"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912276-reader-self-test-45514-0/completion-exit/isolated-build.lisp")
   :BYTES 197 :SHA256
   "1a45dcf8a6d03f1e8866e49280c6f0edb894320c90624d5620fad1e3d546cea9")
  (:PATH "raw/reader-process-fixtures/completion-exit/stderr.log" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912276-reader-self-test-45514-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/reader-process-fixtures/completion-exit/stdout.log" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912276-reader-self-test-45514-0/completion-exit/stdout.log")
   :BYTES 105 :SHA256
   "5e630c1b44d68ce71b27d151e76bf367e3cbd941200adc36cdd30e0fe7390531")
  (:PATH "raw/reader-process-fixtures/report.lisp" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912276-reader-self-test-45514-0/report.lisp")
   :BYTES 1979 :SHA256
   "d16a28f162d9137ab000e94102c31105ec651a2d53561fa1a6620d3ca9938451")
  (:PATH "raw/reader-process-fixtures/signal/isolated-build.lisp" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912276-reader-self-test-45514-0/signal/isolated-build.lisp")
   :BYTES 247 :SHA256
   "ff5cf55dda241d32ea1b4308172c7dc526436cbf1d546e7471148cee95a873d1")
  (:PATH "raw/reader-process-fixtures/signal/stderr.log" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912276-reader-self-test-45514-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/reader-process-fixtures/signal/stdout.log" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912276-reader-self-test-45514-0/signal/stdout.log")
   :BYTES 126 :SHA256
   "3697c68fa71f124c8d05d8cc5d649a744586a10989eb2e67c5bdce6bfc760142")
  (:PATH "raw/snapshot-process-fixtures/completion-exit/isolated-build.lisp"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912275-snapshot-self-test-45506-0/completion-exit/isolated-build.lisp")
   :BYTES 199 :SHA256
   "b8bb4416a818775bae5c77341eeec2c356a2733f633ac2bc8b6ac3ff955d05e0")
  (:PATH "raw/snapshot-process-fixtures/completion-exit/stderr.log" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912275-snapshot-self-test-45506-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/snapshot-process-fixtures/completion-exit/stdout.log" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912275-snapshot-self-test-45506-0/completion-exit/stdout.log")
   :BYTES 107 :SHA256
   "4f22544421d9012fe132a36bf15950cd327ca959b8f9c5ef3d386e0c8b62a25c")
  (:PATH "raw/snapshot-process-fixtures/report.lisp" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912275-snapshot-self-test-45506-0/report.lisp")
   :BYTES 1997 :SHA256
   "ce4d3e7d434bf91db50af4bf599a66515bec5b01c415779c883462e2a20b2f5d")
  (:PATH "raw/snapshot-process-fixtures/signal/isolated-build.lisp" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912275-snapshot-self-test-45506-0/signal/isolated-build.lisp")
   :BYTES 249 :SHA256
   "a345276e3dfe377c0bbd359793165915b1527938a65250d367ce5ac079feecc1")
  (:PATH "raw/snapshot-process-fixtures/signal/stderr.log" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912275-snapshot-self-test-45506-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/snapshot-process-fixtures/signal/stdout.log" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912275-snapshot-self-test-45506-0/signal/stdout.log")
   :BYTES 128 :SHA256
   "e3502e714a0530acb1f0130c4ced4a016607bcb067e3686f6f29704db8423ea5")
  (:PATH "raw/spikes-native/SPK-01.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912456-check-50098-0/SPK-01.lisp")
   :BYTES 27228 :SHA256
   "8a02ba63b39863b0a17a3db1f9f3208e94392b73548b76ffe51b745d07564b14")
  (:PATH "raw/spikes-native/SPK-02.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912456-check-50098-0/SPK-02.lisp")
   :BYTES 1607 :SHA256
   "8d3741ab8478f492a890f802d9e22a71105915d58a983eb53edbc8c81a82f661")
  (:PATH "raw/spikes-native/SPK-03.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912456-check-50098-0/SPK-03.lisp")
   :BYTES 3656 :SHA256
   "cb571eb3f0469d6f539912a795c7051c16d77487319ab4aa27859f17bbaaa7e5")
  (:PATH "raw/spikes-native/SPK-04.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912456-check-50098-0/SPK-04.lisp")
   :BYTES 6752 :SHA256
   "d269fef9b6fc8286953e55dc93236a9784074b2f0a03a93babe268de39250d8b")
  (:PATH "raw/spikes-native/SPK-05.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912456-check-50098-0/SPK-05.lisp")
   :BYTES 10159 :SHA256
   "2317d29b952fd9ab602c14a43211606c307d26facb21ed6c1b63c76d3e4f94e1")
  (:PATH "raw/spikes-native/SPK-06.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912456-check-50098-0/SPK-06.lisp")
   :BYTES 24124 :SHA256
   "b4366fde4bb4446662bfcf8c3fc4845114488dab723052e0ff16e6a07841aa42")
  (:PATH "raw/spikes-native/SPK-07.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912456-check-50098-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "4bc9b0598fa1d9bc4a1f8358d6275cafb8b34639f4d842622153cb84ad55ac50")
  (:PATH "raw/spikes-native/SPK-07.lisp.gz" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912456-check-50098-0/SPK-07.lisp.gz")
   :BYTES 410642 :SHA256
   "b362894300346ebfc5051513c7c2a996da7ee398197332c98b1a0fc403c8d2a9")
  (:PATH "raw/spikes-native/SPK-08.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912456-check-50098-0/SPK-08.lisp")
   :BYTES 291712 :SHA256
   "2eacac0d369315b560c09e759a51cfcd5ef9283d3b745c15237be4be2da5d798")
  (:PATH "raw/spikes-native/SPK-09.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912456-check-50098-0/SPK-09.lisp")
   :BYTES 2472 :SHA256
   "471770524c46e5c2c74b4514d52e0db2976624a4dd8ca2fbcb3b910c2b455dad")
  (:PATH "raw/spikes-native/SPK-10.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912456-check-50098-0/SPK-10.lisp")
   :BYTES 22977 :SHA256
   "178542baaccb4a4b5ca297e7d89f634da9caa16ab831652cef686df9c03e21bb")
  (:PATH "raw/spikes-native/conservazione.lisp" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912456-check-50098-0/conservazione.lisp")
   :BYTES 2331 :SHA256
   "aaec7d6e9b8d59380c126df3f126064033c93560fad0cae4195c57aae7585cd4")
  (:PATH "raw/spikes-native/report.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912456-check-50098-0/report.lisp")
   :BYTES 318 :SHA256
   "3789060044d91c36c8b9b172ab388496c26597f8d4a5ab80a3329fff16dcf98d")
  (:PATH "raw/spikes-native/report.lisp.gz" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912456-check-50098-0/report.lisp.gz")
   :BYTES 466772 :SHA256
   "a475559e0db335985d355d79c1e5b21a97ede2540025aed2e549e9abf4940379")
  (:PATH "raw/usage-duplicate-suite/conservazione.lisp" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912239-command-44378-0/conservazione.lisp")
   :BYTES 1171 :SHA256
   "eefa1791582b0a5d8f6bb737b2782345b2be11a54cb04f99757cf61df01c774b")
  (:PATH "raw/usage-duplicate-suite/report.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-integration/ArcDocDB/spikes/out/4000912239-command-44378-0/report.lisp")
   :BYTES 167563 :SHA256
   "e43f44d8d1fbd282474226f56a6db25d48648f19d3aa860027ef1bd551279d86"))
 :LIMITS
 (:COMPLETE-EXPLICIT-GROUPS :RAW-FASL-PRESERVED-AS-DATA :SOURCE-AND-COPY-SHA256
  :LOSSLESS-GZIP-FOR-LARGE-RAW :NO-RESULT-PROMOTION))
