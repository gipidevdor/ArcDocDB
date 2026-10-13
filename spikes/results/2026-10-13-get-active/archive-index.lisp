(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "core-R1-wrapper-failed" :RECORD-PATH
   "raw/core-R1-wrapper-failed/report.lisp" :COMMAND
   (#A((3) BASE-CHAR . "env")
    #A((269) BASE-CHAR
       . "ASDF_OUTPUT_TRANSLATIONS=(:output-translations (\"/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/**/*.*\" \"/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl/**/*.*\") :ignore-inherited-configuration)")
    #A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "check"))
   :STATUS :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "core-R1-native-failed" :RECORD-PATH
   "raw/core-R1-native-failed/report.lisp" :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "core-R2-wrapper" :RECORD-PATH "raw/core-R2-wrapper/report.lisp"
   :COMMAND
   (#A((3) BASE-CHAR . "env")
    #A((276) BASE-CHAR
       . "ASDF_OUTPUT_TRANSLATIONS=(:output-translations (#P\"/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/**/*.*\" #P\"/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/**/*.*\") :ignore-inherited-configuration)")
    #A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "check"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "core-R2-native" :RECORD-PATH "raw/core-R2-native/report.lisp"
   :COMMAND
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
    #A((34) BASE-CHAR . "spikes/out/get-active-coverage-R1/")
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
    #A((41) BASE-CHAR . "spikes/out/get-resolver-active-compat-R1/"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "usage-unknown-suite" :RECORD-PATH
   "raw/usage-unknown-suite/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((32) BASE-CHAR . "tools/get-resolver-coverage.lisp")
    #A((8) BASE-CHAR . "--report")
    #A((35) BASE-CHAR . "spikes/out/active-negative-unknown/")
    #A((7) BASE-CHAR . "--suite") #A((6) BASE-CHAR . "ignota"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "usage-duplicate-suite" :RECORD-PATH
   "raw/usage-duplicate-suite/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((32) BASE-CHAR . "tools/get-resolver-coverage.lisp")
    #A((8) BASE-CHAR . "--report")
    #A((43) BASE-CHAR . "spikes/out/active-negative-duplicate-suite/")
    #A((7) BASE-CHAR . "--suite") #A((6) BASE-CHAR . "active")
    #A((7) BASE-CHAR . "--suite") #A((6) BASE-CHAR . "active"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "usage-duplicate-report" :RECORD-PATH
   "raw/usage-duplicate-report/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((32) BASE-CHAR . "tools/get-resolver-coverage.lisp")
    #A((8) BASE-CHAR . "--report")
    #A((44) BASE-CHAR . "spikes/out/active-negative-duplicate-report/")
    #A((8) BASE-CHAR . "--report")
    #A((50) BASE-CHAR . "spikes/out/active-negative-duplicate-report-other/"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "README.md" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-publication/README-template.txt")
   :BYTES 2009 :SHA256
   "81180836b9073935a505da1810843acccb3eaaa8a09700d1d85d2ac76113878e")
  (:PATH "collection-manifest.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-publication/manifest.lisp")
   :BYTES 2074 :SHA256
   "3ea9539e5dd344e60fed792ee94f0f8008f7da2be8725995dad548b5b94b0e23")
  (:PATH "collection-source.txt" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-publication/collect.lisp")
   :BYTES 9914 :SHA256
   "ac7ba91fb6580801459ab7da54968b791b045b2d71b76506bb3e9b21f565ab9b")
  (:PATH "publication-audit-contract.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-publication-audit/contract.lisp")
   :BYTES 1950 :SHA256
   "c444256c7fafedbb0bce96bb341ac223cef960ecedc223bb4154919374fbb091")
  (:PATH "publication-audit-source.txt" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-publication-audit/audit.lisp")
   :BYTES 20061 :SHA256
   "dee576bed743f096a52b16539febf57b5899808ca2c29bb587393196f44c1ce4")
  (:PATH "raw/SPK-01/check-lettura-buffer.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-01-primary-index/out/check-lettura-buffer.fasl")
   :BYTES 112357 :SHA256
   "fd7dfe4262fafe8435f459218d51a34a0a58666153c1d2a41df597c4b6e2254f")
  (:PATH "raw/SPK-01/core.fasl" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-01-primary-index/out/core.fasl")
   :BYTES 158718 :SHA256
   "77289266190d32e6b9bb903fb1cf820047e9088ee45777067054cee39965b08e")
  (:PATH "raw/SPK-01/lettura-buffer.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-01-primary-index/out/lettura-buffer.fasl")
   :BYTES 8173 :SHA256
   "6b05a3140bdf3b16c9cc80958888498d10d1dfe92a8808ff0d31285aef278d5f")
  (:PATH "raw/SPK-02/core.fasl" :SOURCE
   #A((101) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-02-gc/out/core.fasl")
   :BYTES 110740 :SHA256
   "0bd6b0b877e238e98ee05bf49631f7d527c548c186ec94838602c6de656876cf")
  (:PATH "raw/SPK-03/core.fasl" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-03-group-commit/out/core.fasl")
   :BYTES 102610 :SHA256
   "1486ac9fd740aab263de8c2ec2142f8f48858e471d94effb038205a3296e194f")
  (:PATH "raw/SPK-04/14822/core.fasl" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-04-writer-pool/out/14822/core.fasl")
   :BYTES 7322 :SHA256
   "d2c57f348c366dbeee495d005b43964b3d27bc5377dcde700d98e2ac341e023b")
  (:PATH "raw/SPK-04/14822/parcheggi.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-04-writer-pool/out/14822/parcheggi.fasl")
   :BYTES 86740 :SHA256
   "950e5ac45cbb324e51076565c372f0acc64083d9fe27dedc800968b30e0f5976")
  (:PATH "raw/SPK-04/14822/pool.fasl" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-04-writer-pool/out/14822/pool.fasl")
   :BYTES 96540 :SHA256
   "e0bc6bb081bc6d7639662ed33a10f59bdf1271442d6043dcfd21f1ff2f5ef2d7")
  (:PATH "raw/SPK-05/14843/core.fasl" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-05-segment-read/out/14843/core.fasl")
   :BYTES 67991 :SHA256
   "6e30ae447d8ee0378fae391d707e7304f774e03a82e1ef6d269556b1e3df0218")
  (:PATH "raw/SPK-05/14843/io.fasl" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-05-segment-read/out/14843/io.fasl")
   :BYTES 62193 :SHA256
   "baff00506920a215cff8a74284c8651b4cd720e328f92fddc740f2f892948187")
  (:PATH "raw/SPK-05/14843/record.fasl" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-05-segment-read/out/14843/record.fasl")
   :BYTES 24820 :SHA256
   "8ab71eae95123b188c6c74c3b917eba0c012ddfc88c68893b348f91438b70f87")
  (:PATH "raw/SPK-06/14865/controllore.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-06-compaction-load/out/14865/controllore.fasl")
   :BYTES 66805 :SHA256
   "6c742aeaa98d7b34f52165ef1aa31deac9ea825bcff503f5bb04ca7ecf4333f1")
  (:PATH "raw/SPK-06/14865/core.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-06-compaction-load/out/14865/core.fasl")
   :BYTES 3297 :SHA256
   "8549c8c83119f108383b615274966de8f517c547bb79138622f2d698e63a3695")
  (:PATH "raw/SPK-06/14865/interferenza.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-06-compaction-load/out/14865/interferenza.fasl")
   :BYTES 102512 :SHA256
   "6457907bc66ef48d9ff8907dc4f4148725670a4119227fabbdd2873a0bf9255a")
  (:PATH "raw/SPK-06/14865/spk05-io.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-06-compaction-load/out/14865/spk05-io.fasl")
   :BYTES 62352 :SHA256
   "7c7eec795844f2822c4868d13412ce3c80e967826f994b31e43a21f0b9771778")
  (:PATH "raw/SPK-06/14865/spk05-record.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-06-compaction-load/out/14865/spk05-record.fasl")
   :BYTES 24873 :SHA256
   "b8f43b1285ac7dc9220e68eabfb03454d7d2ea77bbba039b9a8e404c85144a5f")
  (:PATH "raw/SPK-07/suite-4000910777-14937/byte-crash.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000910777-14937/byte-crash.fasl")
   :BYTES 114108 :SHA256
   "73471294e508bbe5ae276c8f10aca8da63b9df878981d36fbb46eb0315bf85b6")
  (:PATH "raw/SPK-07/suite-4000910777-14937/compaction.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000910777-14937/compaction.fasl")
   :BYTES 86782 :SHA256
   "b9cd20da78accb13d31f9018ed52a031bcd30bfff6554cd1030c7087927b7af6")
  (:PATH "raw/SPK-07/suite-4000910777-14937/core.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000910777-14937/core.fasl")
   :BYTES 64579 :SHA256
   "4bee3756db1a12898cb1308cc50da616ecc2faedddf0f44b9448f182183a89bc")
  (:PATH "raw/SPK-07/suite-4000910777-14937/foundation-batch.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000910777-14937/foundation-batch.fasl")
   :BYTES 9731 :SHA256
   "5975202809ee4da8a87fc50e2b4a03c2edfe2a8eb3a410a664efe63b7b8b115f")
  (:PATH "raw/SPK-07/suite-4000910777-14937/foundation-binary.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000910777-14937/foundation-binary.fasl")
   :BYTES 9137 :SHA256
   "f949c04805e4c341d1610ffca53fe43a2246f7bb04071b1d21fddf6d0de86d13")
  (:PATH "raw/SPK-07/suite-4000910777-14937/foundation-conditions.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000910777-14937/foundation-conditions.fasl")
   :BYTES 6434 :SHA256
   "59594c325a3c585699f07eea440ab81102565cfd275073a507ecdf9189168c37")
  (:PATH "raw/SPK-07/suite-4000910777-14937/foundation-crc32c.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000910777-14937/foundation-crc32c.fasl")
   :BYTES 4313 :SHA256
   "46d15c42216874ea61e76b5d3dd7ffd1d53d29769c5410c0cde375e6e72d6447")
  (:PATH "raw/SPK-07/suite-4000910777-14937/foundation-package.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000910777-14937/foundation-package.fasl")
   :BYTES 2145 :SHA256
   "589d4a5239ed8f5bb20a3a2ead17a352b90e12982f659bc5ffc54fc29a2883db")
  (:PATH "raw/SPK-07/suite-4000910777-14937/foundation-record.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000910777-14937/foundation-record.fasl")
   :BYTES 36518 :SHA256
   "8ddbed3d149a70cd7f8386575c9caa2cfcaa83709c86dad2b3b7334271696a1e")
  (:PATH "raw/SPK-07/suite-4000910777-14937/memoria.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000910777-14937/memoria.fasl")
   :BYTES 17419 :SHA256
   "89828c2d868515f8c817adef643aa8a08bed71f3635583e1c6f6115e4007b8a6")
  (:PATH "raw/SPK-07/suite-4000910777-14937/pubblicazione.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000910777-14937/pubblicazione.fasl")
   :BYTES 86637 :SHA256
   "eb994092632829e285d590f5a945e4f8e90c1e061e69cbc8e1f449d8df5c6e12")
  (:PATH "raw/SPK-07/suite-4000910777-14937/root-package.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000910777-14937/root-package.fasl")
   :BYTES 1468 :SHA256
   "7e2fa1791b3d2ad8ce7d50ee3f1c9bd4bfa7c05f35a24d803aa832dffc98a7c9")
  (:PATH "raw/SPK-07/suite-4000910777-14937/scadenza.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000910777-14937/scadenza.fasl")
   :BYTES 85848 :SHA256
   "6c5ad3c9e13ee54df2d1e54fded140389f82c621060c5506ea60e0dc537cd605")
  (:PATH "raw/SPK-07/suite-4000910777-14937/seqlock-readers.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000910777-14937/seqlock-readers.fasl")
   :BYTES 79349 :SHA256
   "340a7dc072083ab60925cd6ed6b352e541e6a19a8e34d68fc9071e06d8c9275e")
  (:PATH "raw/SPK-07/suite-4000910777-14937/suite.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000910777-14937/suite.fasl")
   :BYTES 3876 :SHA256
   "41a8956170af2ea587091516ec246f5304bd7d8049e78341670ebffe0e3de63e")
  (:PATH "raw/SPK-08/process-4000910787-15061/bitmap.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-08-generated-code/out/process-4000910787-15061/bitmap.fasl")
   :BYTES 23572 :SHA256
   "7262518ae4ecec6651f9792d6922ad057645567e1f20dd7525303fa9ffb9403d")
  (:PATH "raw/SPK-08/process-4000910787-15061/core-bitmap.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-08-generated-code/out/process-4000910787-15061/core-bitmap.fasl")
   :BYTES 13292 :SHA256
   "b14bbf63c4b429516d39adb7d2e64bc85d11cf929cbc9a31a2e337ef1ddb7bb6")
  (:PATH "raw/SPK-08/process-4000910787-15061/impronte.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-08-generated-code/out/process-4000910787-15061/impronte.fasl")
   :BYTES 68387 :SHA256
   "2f2617ccc8fc25613c54532c1979f1ed0f3aeaed306181b279f5974b13c1120c")
  (:PATH "raw/SPK-08/process-4000910787-15061/simd.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-08-generated-code/out/process-4000910787-15061/simd.fasl")
   :BYTES 20616 :SHA256
   "d4c04584d69f5ff7497c7c7c44f9bd850d3000aa66a1154e8d9d1540fb57285d")
  (:PATH "raw/SPK-09/core.fasl" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-09-integrity/out/core.fasl")
   :BYTES 115023 :SHA256
   "c4ee41d0fd3d43560199865b5be01af6e19dcf60b5917528e429fcec2657b80a")
  (:PATH "raw/SPK-10/cbor.fasl" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-10-v2-limits/out/cbor.fasl")
   :BYTES 83955 :SHA256
   "e0639d4b6f61edeffb49e6c69fd42a0c151f0aa15be494093e965205e7e546af")
  (:PATH "raw/SPK-10/codec.fasl" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-10-v2-limits/out/codec.fasl")
   :BYTES 81674 :SHA256
   "b3d982952d3db08c610f9a0e150e1dbd478e2cd4e8f61ee891aad0e86184754b")
  (:PATH "raw/SPK-10/core.fasl" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-10-v2-limits/out/core.fasl")
   :BYTES 15832 :SHA256
   "0c8513ca757162a1470e052b2aca5ea68c7c245cf28aefb97a4500a2423ecbb1")
  (:PATH "raw/SPK-10/crc.fasl" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-10-v2-limits/out/crc.fasl")
   :BYTES 115063 :SHA256
   "18e1e89d104506ce984a6e484c3006ebb069957bba94b5ee445b89c89f8a4494")
  (:PATH "raw/SPK-10/indice.fasl" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-10-v2-limits/out/indice.fasl")
   :BYTES 154893 :SHA256
   "eae043a88de7f54667f6c416a31fa1fb6ec0d9021e407fbebf14991a4412b7ad")
  (:PATH "raw/SPK-10/migrazione.fasl" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/SPK-10-v2-limits/out/migrazione.fasl")
   :BYTES 81707 :SHA256
   "4691d82ebf5fb3218a509cfc5e9534a2b298b5fe792fea4ebc456cdbf765b2fe")
  (:PATH "raw/active-local-audit/audit-at-full-R1.lisp.txt" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-local-audit/audit-at-full-R1.lisp.txt")
   :BYTES 32166 :SHA256
   "7d50588aaa88e5f1bedfe570b94acb670d52472951357059fa1067e828eda61e")
  (:PATH "raw/active-local-audit/audit.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-local-audit/audit.lisp")
   :BYTES 32238 :SHA256
   "511f7e7155d7b231a67e50dffdd2ae81a8c7293807ee3248a95064a6ea77ef2a")
  (:PATH "raw/active-local-audit/coverage-negative-audit.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-local-audit/coverage-negative-audit.lisp")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/active-local-audit/coverage-negative-audit.stderr" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-local-audit/coverage-negative-audit.stderr")
   :BYTES 3254 :SHA256
   "c4864e82969fed8f8a67c2d8c2dc0c68cbf9e5ca53dff5eb2b112c959ca3b01a")
  (:PATH "raw/active-local-audit/failure-audit-at-R1.lisp.txt" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-local-audit/failure-audit-at-R1.lisp.txt")
   :BYTES 30016 :SHA256
   "a6c2f1fc4f063bc5b1e1d0097d141f054e14665eff978f50dd9d72341275f042")
  (:PATH "raw/active-local-audit/failure-audit.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-local-audit/failure-audit.lisp")
   :BYTES 30417 :SHA256
   "d5804e7ee0b84aed00359b81e1271e8de56cf8264988b81824325785fa875559")
  (:PATH "raw/active-local-audit/fixture-audit.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-local-audit/fixture-audit.lisp")
   :BYTES 8329 :SHA256
   "204ad5f69a36a29b177abe2c5b9c459164541ee1d01af1299136280d61b9ff6b")
  (:PATH "raw/active-local-audit/fixtures-audit-R1.lisp" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-local-audit/fixtures-audit-R1.lisp")
   :BYTES 6854 :SHA256
   "aa0d59654e3c0c735f94c1a2697f3ec5feb080b85e3629b7b046307d335fbd74")
  (:PATH "raw/active-local-audit/fixtures-audit-R1.stderr" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-local-audit/fixtures-audit-R1.stderr")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/active-local-audit/full-audit-R1.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-local-audit/full-audit-R1.lisp")
   :BYTES 299 :SHA256
   "44aa35730704323c909de35b15ee6efd66b3b928e5477502bb9a1566212253ce")
  (:PATH "raw/active-local-audit/full-audit-R1.stderr" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-local-audit/full-audit-R1.stderr")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/active-local-audit/full-audit-R2.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-local-audit/full-audit-R2.lisp")
   :BYTES 99415 :SHA256
   "9406ad18959b0bd6b8e382fc67dbcd34e9c1ebec9102eec3b3c2e17fdff7b233")
  (:PATH "raw/active-local-audit/full-audit-R2.stderr" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-local-audit/full-audit-R2.stderr")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/active-local-audit/initial-core-failure-audit-R2.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-local-audit/initial-core-failure-audit-R2.lisp")
   :BYTES 1329 :SHA256
   "dfb2d834b05588aadf851982a739444a23d6919c6a8755433f56c65a5115aff5")
  (:PATH "raw/active-local-audit/initial-core-failure-audit-R2.stderr" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-local-audit/initial-core-failure-audit-R2.stderr")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/active-local-audit/initial-core-failure-audit.lisp" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-local-audit/initial-core-failure-audit.lisp")
   :BYTES 234 :SHA256
   "e3674106b4dbebae50e62cd13fc6ab21f04b9fba7c9b6723416d29d23891a7ce")
  (:PATH "raw/active-local-audit/initial-core-failure-audit.stderr" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-local-audit/initial-core-failure-audit.stderr")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/core-R1-native-failed/conservazione.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910526-command-10449-0/conservazione.lisp")
   :BYTES 1174 :SHA256
   "70d1cd4e524dbdf6f578fb9ba63c4aa0eaa1b08f022c23af7feac33878251de6")
  (:PATH "raw/core-R1-native-failed/report.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910526-command-10449-0/report.lisp")
   :BYTES 170927 :SHA256
   "2faa0e33a5f0c1561e7b93be7061f4dab47916b3ba23225ba269d981c089fa17")
  (:PATH "raw/core-R1-wrapper-failed/conservazione.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910524-command-10397-0/conservazione.lisp")
   :BYTES 1174 :SHA256
   "8465498cfaef0279d1a003297b5cdf8cef8388c571815d05a49b0506e1030b22")
  (:PATH "raw/core-R1-wrapper-failed/report.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910524-command-10397-0/report.lisp")
   :BYTES 160291 :SHA256
   "fde04ccc31ec0ffcb1638755d5d73b84a696bac3075b2c2fd4ecdcef7588c845")
  (:PATH "raw/core-R2-native/conservazione.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910594-command-11798-0/conservazione.lisp")
   :BYTES 1174 :SHA256
   "3b6f346604a13a014a0e7db2bca80da370b414a8a0a387494dd4ea921c3eddab")
  (:PATH "raw/core-R2-native/report.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910594-command-11798-0/report.lisp")
   :BYTES 1003971 :SHA256
   "7655679f84ca390f81025264f24cc638634687fc0b6f3e1ffa93e3c5148b1044")
  (:PATH "raw/core-R2-wrapper/conservazione.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910591-command-11679-0/conservazione.lisp")
   :BYTES 1173 :SHA256
   "b391b4c3b5675e4bdab9c09ed196053c1b4e7df593fd070f40f1a9e80ca55d87")
  (:PATH "raw/core-R2-wrapper/report.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910591-command-11679-0/report.lisp")
   :BYTES 160265 :SHA256
   "3d32f0b1cd1254f2d6dfc262be3651e60f340eb2d9d9aa7cbf34b3aff9825dee")
  (:PATH "raw/core-compiler-fasl/src/cache/build.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/cache/build.fasl")
   :BYTES 8849 :SHA256
   "1c91c8812ceee834afdc9e977ef43e8d152d0b1869ebd53019313a9a95028826")
  (:PATH "raw/core-compiler-fasl/src/cache/clock.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/cache/clock.fasl")
   :BYTES 4890 :SHA256
   "90facf51b28edaacaf3be4cb74aad9c3d70e11b9432a3e3d6e72e630200a32d2")
  (:PATH "raw/core-compiler-fasl/src/cache/core.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/cache/core.fasl")
   :BYTES 7265 :SHA256
   "985b59a35372c7e8109a3d41bfc9308c376fc5a722ccc008cd1154a484405d22")
  (:PATH "raw/core-compiler-fasl/src/cache/package.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/cache/package.fasl")
   :BYTES 1172 :SHA256
   "c1eaf4512dd3485c5d33e6f8d48b72e229330d4bd3220b5f83430d4357efffd7")
  (:PATH "raw/core-compiler-fasl/src/cache/read.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/cache/read.fasl")
   :BYTES 11963 :SHA256
   "74911fb1a26058d41596d2d0bd231adcf8e34730e5e5f503ff7e8126f2ca8e08")
  (:PATH "raw/core-compiler-fasl/src/cache/types.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/cache/types.fasl")
   :BYTES 17990 :SHA256
   "99a7c15cbb4f1637b7efda9d381a4816d6b616c110342802737712fcaacb181c")
  (:PATH "raw/core-compiler-fasl/src/cache/write.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/cache/write.fasl")
   :BYTES 9829 :SHA256
   "af7152fe07455a2e7314351a5d7938037af83c142273f6fdd9f88e2ca5d708e3")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-float-minimal.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/codec/cbor-float-minimal.fasl")
   :BYTES 4232 :SHA256
   "8c23a5bf342a443f3c7f1ddb17b3855bd048c413a69233adb840ef0fc7acc4c3")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-float-narrow.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/codec/cbor-float-narrow.fasl")
   :BYTES 5050 :SHA256
   "c68b6f90d5e1a71ce7bc94e60b564eebee12742e9e9520f65064ca5ec0f44094")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-float-write.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/codec/cbor-float-write.fasl")
   :BYTES 6800 :SHA256
   "9ccb532dcba2e71e8acf76377587753bcd28a23ade2cc019cc451f0a7e1cd455")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-header.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/codec/cbor-header.fasl")
   :BYTES 7382 :SHA256
   "ef2330a99cc39803128a129f511a2f66cbc322363fa67969e433bed742185694")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-minimal.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/codec/cbor-minimal.fasl")
   :BYTES 5470 :SHA256
   "65d9da1182f9ae065456b9c9d90e577fbbebb12744035bda22f37feeaaee4d26")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-package.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/codec/cbor-package.fasl")
   :BYTES 1173 :SHA256
   "d0a0fa1c3cc27dbca2d968794ff529a281f9da3992930959d973421f579fb24a")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-scan-input.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/codec/cbor-scan-input.fasl")
   :BYTES 3455 :SHA256
   "746fa07f7473de2197542ba0d186115457f7f19b12dadb52854a94182c5dbcf0")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-scan-items.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/codec/cbor-scan-items.fasl")
   :BYTES 10661 :SHA256
   "49c6b4c2bcdf0a1ce5f78cb4dad16a07e703fbcb76df0e70cfd45b0455ce5777")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-scan-minimal.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/codec/cbor-scan-minimal.fasl")
   :BYTES 2931 :SHA256
   "652065ff5bbf4fe090a3d9ba0704bc2c2d68b4f828c07e8fe513a68b9593f5f8")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-scan-stack.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/codec/cbor-scan-stack.fasl")
   :BYTES 8020 :SHA256
   "c0774fa78b127d7eb265fadc61faea33ad5f829b2ce63f57f817f7cd0e6a491e")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-scan.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/codec/cbor-scan.fasl")
   :BYTES 8481 :SHA256
   "f2e9df6aed50c7f0348f619aa33818b98c5635578f23b22eb23a2d1a5df3935c")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-simple-write.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/codec/cbor-simple-write.fasl")
   :BYTES 3946 :SHA256
   "a1ddd767a7a02d6afad6fa11361416ce05f2f1e9cb42e0d37d761333add46482")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-space.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/codec/cbor-space.fasl")
   :BYTES 11635 :SHA256
   "6eb9b4aa7e95f55d248071e812cc9639698a172e79d3dbe200f15facb49181af")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-string-write.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/codec/cbor-string-write.fasl")
   :BYTES 9760 :SHA256
   "584a6b066f8b76b0936f047031e48f3534d27b0d7e926e7e1a33f88c54e119a6")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-write.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/codec/cbor-write.fasl")
   :BYTES 6925 :SHA256
   "e366ff0f8443d26ff11ad486fb18b899c834c0a61ddce1f2ac66235da4a398c9")
  (:PATH "raw/core-compiler-fasl/src/codec/package.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/codec/package.fasl")
   :BYTES 941 :SHA256
   "753b87ccce5b42747bf5cb10e01c73febf96c13eacdb8717d84e97972145ac5a")
  (:PATH "raw/core-compiler-fasl/src/codec/utf8.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/codec/utf8.fasl")
   :BYTES 8338 :SHA256
   "3ea77f02da6912bc66f9b82a9d36785f4a824b276a0400d7f66fe4953a7f2893")
  (:PATH "raw/core-compiler-fasl/src/csn/package.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/csn/package.fasl")
   :BYTES 974 :SHA256
   "df539f5690eb5b19cbbfd8364c17ae1cdd87648c757c84d96c83130a3f4a041b")
  (:PATH "raw/core-compiler-fasl/src/csn/registry.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/csn/registry.fasl")
   :BYTES 29101 :SHA256
   "a245ed8c878f65f9cf228679619216033b389dfb93e6b73b33967ad8d50e48e5")
  (:PATH "raw/core-compiler-fasl/src/epochs/core.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/epochs/core.fasl")
   :BYTES 9456 :SHA256
   "d704e2eed9c9bf8a3c796f7ee969c2594e3e210bc030bf2dfbcbee1131ffee04")
  (:PATH "raw/core-compiler-fasl/src/epochs/package.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/epochs/package.fasl")
   :BYTES 1199 :SHA256
   "5f0a8fc679ec6bd005eac1da2ad60c02fb915de7b89172f39bfe603ecd5f667b")
  (:PATH "raw/core-compiler-fasl/src/epochs/read.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/epochs/read.fasl")
   :BYTES 5295 :SHA256
   "3526b9aea8bbc00f05cdc677cb30803f45025593651843ca4ee5e1b398827b2f")
  (:PATH "raw/core-compiler-fasl/src/epochs/reclaim.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/epochs/reclaim.fasl")
   :BYTES 10805 :SHA256
   "c801cfe273f13c2be31bc847ef62f1a468c4df3d4bfc227427004e8d923ff45a")
  (:PATH "raw/core-compiler-fasl/src/epochs/retire.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/epochs/retire.fasl")
   :BYTES 9414 :SHA256
   "b8ab5455d7c45ec133e9e95e5faa0a5711113bfc0f94f1031e668fbc831207ee")
  (:PATH "raw/core-compiler-fasl/src/epochs/types.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/epochs/types.fasl")
   :BYTES 24020 :SHA256
   "a090c78627fe91911db35c465a90e3956628b8aab89368bbb0d2122168bd2cb7")
  (:PATH "raw/core-compiler-fasl/src/execution/handoff.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/execution/handoff.fasl")
   :BYTES 15929 :SHA256
   "413b16d847b8770b6630c3fd2902479f1b4435bcff95bfdd9d1e9fbe64bd6fd6")
  (:PATH "raw/core-compiler-fasl/src/execution/package.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/execution/package.fasl")
   :BYTES 1610 :SHA256
   "29526ec1537aabaca63b81f89d5f74c2020cc2daf4550c499496b0956c272aaa")
  (:PATH "raw/core-compiler-fasl/src/execution/queue.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/execution/queue.fasl")
   :BYTES 17784 :SHA256
   "12a3b3919110091263a64ad61be4b1ac000022c7bd71a4affa5c886cd6525c18")
  (:PATH "raw/core-compiler-fasl/src/execution/ready-recycle.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/execution/ready-recycle.fasl")
   :BYTES 5169 :SHA256
   "7e5a26d3fc8646ce7feeb859422af8d410e78fec59fc571db919e775d87f8466")
  (:PATH "raw/core-compiler-fasl/src/execution/ready-types.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/execution/ready-types.fasl")
   :BYTES 14961 :SHA256
   "6495033bab1ebbd98e2d112fb80f8ae9776778f35651b414d858bda3685fcd59")
  (:PATH "raw/core-compiler-fasl/src/execution/ready.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/execution/ready.fasl")
   :BYTES 9707 :SHA256
   "0be4781f466239023371aac0f1622ac65151a5f51641eaac707e7f9744de3127")
  (:PATH "raw/core-compiler-fasl/src/execution/worker-boundary.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/execution/worker-boundary.fasl")
   :BYTES 6425 :SHA256
   "73e75cba1437ff63547d9c32e6ee8cd4ca0f6b437d07cce1e05f51e2cc6dbfe7")
  (:PATH "raw/core-compiler-fasl/src/execution/worker-claim.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/execution/worker-claim.fasl")
   :BYTES 12435 :SHA256
   "1ff43e20afb1680930a7d2e0d14fa719ed63ba5878df69daae135d4ee676fd12")
  (:PATH "raw/core-compiler-fasl/src/execution/worker-run.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/execution/worker-run.fasl")
   :BYTES 9029 :SHA256
   "ba1c825d086bc951d0a5ccd30cde49f7d3cde6333244cbf9cb450f3de8728894")
  (:PATH "raw/core-compiler-fasl/src/execution/worker-types.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/execution/worker-types.fasl")
   :BYTES 22085 :SHA256
   "e66f3942c7974b093c680034e2c1fe55feb3a5caa4123273d7399225a4320eee")
  (:PATH "raw/core-compiler-fasl/src/execution/writer.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/execution/writer.fasl")
   :BYTES 8972 :SHA256
   "adfec73e51b7c5aa60816acae59a88198c2412f4edf0263009edcd49556df0f0")
  (:PATH "raw/core-compiler-fasl/src/foundation/batch.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/foundation/batch.fasl")
   :BYTES 9671 :SHA256
   "39c3c2937f35cfe9c0eafaf9b4a706cfc7b55e8cb704a59eef20c8f67fd135f1")
  (:PATH "raw/core-compiler-fasl/src/foundation/binary.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/foundation/binary.fasl")
   :BYTES 9077 :SHA256
   "aeb11960a5cd65195691229f555607b1232cc93e192cfc6a1e6a0fbeba811e00")
  (:PATH "raw/core-compiler-fasl/src/foundation/conditions.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/foundation/conditions.fasl")
   :BYTES 6271 :SHA256
   "94ae396f711b3cec48bccd6d1cb15dcd40b6d36724523e9a615b1fe545d7f929")
  (:PATH "raw/core-compiler-fasl/src/foundation/crc32c.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/foundation/crc32c.fasl")
   :BYTES 4253 :SHA256
   "0a0f7d6b91bbffa75e6fa000e2958c0fc697cd7bafeb6bc013c2b046a62c0977")
  (:PATH "raw/core-compiler-fasl/src/foundation/package.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/foundation/package.fasl")
   :BYTES 2084 :SHA256
   "70dc596604b0dc659237a38f36b91384e8b658be0e0525e3a759e4e35b703e9a")
  (:PATH "raw/core-compiler-fasl/src/foundation/record.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/foundation/record.fasl")
   :BYTES 36360 :SHA256
   "a9fc60132544a83f3b21d4a2b843df98c572c6a27431fdbfed1a22e668e63713")
  (:PATH "raw/core-compiler-fasl/src/get-directory/build.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/get-directory/build.fasl")
   :BYTES 6186 :SHA256
   "acc19bae89ebd2d1c6064415f6fd978e8d1882e3f4a14d1acbcaaf1d3805c605")
  (:PATH "raw/core-compiler-fasl/src/get-directory/package.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/get-directory/package.fasl")
   :BYTES 1584 :SHA256
   "62d558bb93d6acdd8c8b2642ca9ed67aad0902557d3e709d077aee6841ccc047")
  (:PATH "raw/core-compiler-fasl/src/get-directory/read.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/get-directory/read.fasl")
   :BYTES 7282 :SHA256
   "fd1aa37033fd48a3b1a94e130a8ae2b819d93ae3cb2b736ea91856dc8f7c2f64")
  (:PATH "raw/core-compiler-fasl/src/get-directory/types.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/get-directory/types.fasl")
   :BYTES 7019 :SHA256
   "a7f043c405b6e651efb8baa2749df6bf67b44e1a501b1a8515be3003b0aecab2")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/active-build.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/get-resolver/active-build.fasl")
   :BYTES 13955 :SHA256
   "0a639fc5c3a7b22d8cd9e5bc9f14d72b21adcc728f97aff88828319dd3c34fe1")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/active-directory.fasl"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/get-resolver/active-directory.fasl")
   :BYTES 6967 :SHA256
   "017fd01057b76cc0e9fbf53607196bbba4950064de37be3578fc50699688ea2e")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/active-preflight.fasl"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/get-resolver/active-preflight.fasl")
   :BYTES 9007 :SHA256
   "c8715baa0f3ce33c0794ff017bc5cc6ce0ce0bb938e5c37dab83b567f17b7088")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/active-read.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/get-resolver/active-read.fasl")
   :BYTES 5516 :SHA256
   "324ea5ffdb6cfad5e0545a4e40c7a97ba57b01c96c38cb539a7dfd6fa0669702")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/active-scan.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/get-resolver/active-scan.fasl")
   :BYTES 8221 :SHA256
   "b0314c7a6c913d57bc2963b0ab521dfdf87b76059f007d8ac4e0a5a64a4ffbf6")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/active-types.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/get-resolver/active-types.fasl")
   :BYTES 17194 :SHA256
   "893621c82cd1733080ad86591029375dbdb0cd6ebf0588ee14f46217381355b2")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/build.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/get-resolver/build.fasl")
   :BYTES 10750 :SHA256
   "4a0e0e867540fd5665a0ac310279fcd7111ebf70cc62531db44961eddd3143dd")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/package.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/get-resolver/package.fasl")
   :BYTES 2569 :SHA256
   "44b1ade77d5dc2fe73320c85571da2cb0ec79d6129d63a3c55dd9f138e744131")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/read.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/get-resolver/read.fasl")
   :BYTES 10513 :SHA256
   "2a129c7314dba6cc1dfc35537b7b62b8dbc73f686f7060386ca4f74d9800fce7")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/rows.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/get-resolver/rows.fasl")
   :BYTES 5860 :SHA256
   "9ac9f24fa36093564283d6d51ce91c422e3b7f9a9bb1eab0381f4a53eb53157f")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/scan.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/get-resolver/scan.fasl")
   :BYTES 10738 :SHA256
   "88d4f17c1fdd086992cd01e92bad2e91abe05cddec98b21559f4351132112d29")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/sort.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/get-resolver/sort.fasl")
   :BYTES 9385 :SHA256
   "85c941f4ed41e10be3439c93ef9cac80488fa255f3dca51e565f53e9d748bd74")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/types.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/get-resolver/types.fasl")
   :BYTES 7432 :SHA256
   "46a1d6f27487d776925a6c243bd5b3b6ae681c432402c82722f6147700be54b3")
  (:PATH "raw/core-compiler-fasl/src/get/build.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/get/build.fasl")
   :BYTES 6740 :SHA256
   "9dd6bc5c47515c04c69778d6a075989843cc6a8189c07b8750dff4e4417b0a5d")
  (:PATH "raw/core-compiler-fasl/src/get/lifecycle.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/get/lifecycle.fasl")
   :BYTES 8681 :SHA256
   "045b06122c1eac24c13eb49ab88185dabd50941bca0bc98ba90809ac95a7b160")
  (:PATH "raw/core-compiler-fasl/src/get/lookup.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/get/lookup.fasl")
   :BYTES 11201 :SHA256
   "3e69d3373c04bd5dfb51b04d0b9404e710427b040eaeea89b0a658632a343c69")
  (:PATH "raw/core-compiler-fasl/src/get/package.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/get/package.fasl")
   :BYTES 2164 :SHA256
   "50727c1e4e65e3e5e8a4a44b38c640ded7d3b2d50b6898017596d85ff15054eb")
  (:PATH "raw/core-compiler-fasl/src/get/segment.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/get/segment.fasl")
   :BYTES 10561 :SHA256
   "5995a5a66d66c43ee2658440019256e8dc681a8d9667d7ee36191b8db11462ea")
  (:PATH "raw/core-compiler-fasl/src/get/target.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/get/target.fasl")
   :BYTES 7806 :SHA256
   "678e11d7d19b9ffcc34dcb6c0297cb5701f0e34323883f3faa87f56f103290c0")
  (:PATH "raw/core-compiler-fasl/src/get/types.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/get/types.fasl")
   :BYTES 30914 :SHA256
   "cb7354efc24e0a1dd325d21aeb7d342ff3ea88d445f88561c0cd251524c5eb3b")
  (:PATH "raw/core-compiler-fasl/src/hash/arithmetic.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/hash/arithmetic.fasl")
   :BYTES 7682 :SHA256
   "e870bc5ee176e0cb9447f6e00a1c83dd4efda81dfa4d4c6024cef5b6531121a0")
  (:PATH "raw/core-compiler-fasl/src/hash/blocks.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/hash/blocks.fasl")
   :BYTES 8293 :SHA256
   "5da2b105ef22d0cc77b3a7b2813be732f434270ff770449059b84db4fe4b0b9f")
  (:PATH "raw/core-compiler-fasl/src/hash/hash64.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/hash/hash64.fasl")
   :BYTES 6642 :SHA256
   "4328e7b7dda000f06f904eafc1a0e1ae0098cb5dab0841dcd177da2fa91720b6")
  (:PATH "raw/core-compiler-fasl/src/hash/package.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/hash/package.fasl")
   :BYTES 949 :SHA256
   "0d9b1f91dcfdaab4d2280beb2ad7553a6ce4607caee7dddf5607b93c574dbbfe")
  (:PATH "raw/core-compiler-fasl/src/index/core.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/index/core.fasl")
   :BYTES 6185 :SHA256
   "e6188c13aaa7fdc871f5cedcf4cec9b7bc1d528e6ab36e8b9bb36d79aa1ac692")
  (:PATH "raw/core-compiler-fasl/src/index/hash-digests.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/index/hash-digests.fasl")
   :BYTES 6102 :SHA256
   "9d9acf8025088c9920774c9e4bda44780e75d484ef1570a5fdb2654309421510")
  (:PATH "raw/core-compiler-fasl/src/index/hash-seed.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/index/hash-seed.fasl")
   :BYTES 5134 :SHA256
   "798de10fddf43e36f8870bb9643703e0e407a40390612361c877dbb86bac2c88")
  (:PATH "raw/core-compiler-fasl/src/index/package.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/index/package.fasl")
   :BYTES 1144 :SHA256
   "bd8c095741b48508d72a5a1382d0915ca7934502af381459195ad37794175e01")
  (:PATH "raw/core-compiler-fasl/src/index/primary-arena.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/index/primary-arena.fasl")
   :BYTES 6824 :SHA256
   "b4d94cc1249ba5266d37e0ec00362d5bf6920ebe4db089e2585af2e9356e5cc9")
  (:PATH "raw/core-compiler-fasl/src/index/primary-build.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/index/primary-build.fasl")
   :BYTES 10597 :SHA256
   "021f98d659c0d8c9760120525cba781d0da02a513e2da7848a728c87d815e9a3")
  (:PATH "raw/core-compiler-fasl/src/index/primary-core.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/index/primary-core.fasl")
   :BYTES 8750 :SHA256
   "062c4bf17bcf3f7cb572ed3bdfb4902958dc6c6cc311bc878db3cb5505921f28")
  (:PATH "raw/core-compiler-fasl/src/index/primary-directory.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/index/primary-directory.fasl")
   :BYTES 14234 :SHA256
   "e7b7a258ba572212ab3b1c6da0a0a4ae564d62453f489058d21cf107ab5667d2")
  (:PATH "raw/core-compiler-fasl/src/index/primary-package.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/index/primary-package.fasl")
   :BYTES 1719 :SHA256
   "7b3049699162fdae683acbea909afc4c283a685abed3e9d1195c63b555d3a6d9")
  (:PATH "raw/core-compiler-fasl/src/index/primary-probe.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/index/primary-probe.fasl")
   :BYTES 13340 :SHA256
   "ccfeb6ad49c79b6154f17d88b09d2939a3b8d612c84b0a858261dc4d965d522d")
  (:PATH "raw/core-compiler-fasl/src/index/primary-read.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/index/primary-read.fasl")
   :BYTES 7543 :SHA256
   "65eee7a7e03bf974a2e4fe94fa106f9a40bea4a246693e9fba76069e4268fb3e")
  (:PATH "raw/core-compiler-fasl/src/index/primary-relocate.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/index/primary-relocate.fasl")
   :BYTES 9171 :SHA256
   "958b637a0cb32fa50c98f29de30fce79f361bd07f360776a22b8d6e8af266b25")
  (:PATH "raw/core-compiler-fasl/src/index/primary-types.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/index/primary-types.fasl")
   :BYTES 36218 :SHA256
   "5411117d90d3eb33edaa4d81fce2a317bde85865a530e04b607d27e2f2b7f4a1")
  (:PATH "raw/core-compiler-fasl/src/index/primary-write.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/index/primary-write.fasl")
   :BYTES 15733 :SHA256
   "2bb06d396e87f1773ef445860cacb108693119bc471bf9186111f4b748d0140a")
  (:PATH "raw/core-compiler-fasl/src/index/read.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/index/read.fasl")
   :BYTES 7198 :SHA256
   "03fd11683c3ee1235ecf977ca7bac183e3cfc334bc790080e9a2710a2e7d0ec9")
  (:PATH "raw/core-compiler-fasl/src/index/rebuild-budget.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/index/rebuild-budget.fasl")
   :BYTES 6564 :SHA256
   "d211ed56cddb83b6d798de8b55ebe9ead97fc6dae68ad0f18528aafff0282ae4")
  (:PATH "raw/core-compiler-fasl/src/index/rebuild-copy.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/index/rebuild-copy.fasl")
   :BYTES 8107 :SHA256
   "9a033872cd03e86ca44f17f64735edb0f7286b93e7363de175b231acd26251df")
  (:PATH "raw/core-compiler-fasl/src/index/rebuild-scan.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/index/rebuild-scan.fasl")
   :BYTES 12577 :SHA256
   "61269a15b88683379c451ee6194a26a11d57297cd54b45871d37ba316737a5fa")
  (:PATH "raw/core-compiler-fasl/src/index/rebuild.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/index/rebuild.fasl")
   :BYTES 4517 :SHA256
   "d5b3259f7a1b64df3810d89cc5dccded89ca4385f30379580287da5d42bc1c3d")
  (:PATH "raw/core-compiler-fasl/src/index/relocate.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/index/relocate.fasl")
   :BYTES 6685 :SHA256
   "bb4fd1f733d1e5df54f96b39824d54337e11f0de76128694f876ca3df5023bc1")
  (:PATH "raw/core-compiler-fasl/src/index/types.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/index/types.fasl")
   :BYTES 9939 :SHA256
   "a6fe11f2ec3a4860381ec48093d9bc1ee8607ab7a90075d1b952ef34c327716a")
  (:PATH "raw/core-compiler-fasl/src/index/validation.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/index/validation.fasl")
   :BYTES 9608 :SHA256
   "baff2f55eb48091be8e43794fb6e8f29b6c09668020e6d6e236db6fb088886fb")
  (:PATH "raw/core-compiler-fasl/src/index/write.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/index/write.fasl")
   :BYTES 12518 :SHA256
   "c65b39a8f6469fb9d26f340ce1c53bbf95c442c958ba3ef38bece53b6aaf9184")
  (:PATH "raw/core-compiler-fasl/src/io/flush.fasl" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/io/flush.fasl")
   :BYTES 3557 :SHA256
   "a2aec441222211515c71afd8448dae5536bb884bec8de2332021721e77aaa89c")
  (:PATH "raw/core-compiler-fasl/src/io/identity-types.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/io/identity-types.fasl")
   :BYTES 4470 :SHA256
   "ae61d0cb6e417e9d6119ee2a182f30ef1ad0a6a2d5f5291f847be50decb81bca")
  (:PATH "raw/core-compiler-fasl/src/io/identity.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/io/identity.fasl")
   :BYTES 6194 :SHA256
   "055d98bb4a82fea6af086427596d5a60c1cd03d563e445b2d7c1049d6e82cb0e")
  (:PATH "raw/core-compiler-fasl/src/io/lifecycle.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/io/lifecycle.fasl")
   :BYTES 10853 :SHA256
   "2c4baf720cd4c5497bdeb0487141eddc73890de2aa8985eb633ae4908e536a0c")
  (:PATH "raw/core-compiler-fasl/src/io/native.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/io/native.fasl")
   :BYTES 22504 :SHA256
   "04faf2ba5deea76eea99f5f131bbb4be85ccdb8d7b97fd129ee2f741156a467c")
  (:PATH "raw/core-compiler-fasl/src/io/package.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/io/package.fasl")
   :BYTES 1235 :SHA256
   "9b3695b0e56628bd5910f0c2f4dbeebf2e9bbdd4deb9506ac118406180d5d1eb")
  (:PATH "raw/core-compiler-fasl/src/io/transfer.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/io/transfer.fasl")
   :BYTES 13062 :SHA256
   "8763aba18c5564a808f2d3e6588a1ecde66feac145c55934889a28d0d33bc6e1")
  (:PATH "raw/core-compiler-fasl/src/io/types.fasl" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/io/types.fasl")
   :BYTES 21765 :SHA256
   "5ba0e6cf8a0d7fa47b194dc4534e24617994ad15c80c0cac7c6f31756f796956")
  (:PATH "raw/core-compiler-fasl/src/mvcc/package.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/mvcc/package.fasl")
   :BYTES 1312 :SHA256
   "104afcfb6708551a4f4f3634a3d757700972d425c4bd6dd44dcafb73f92a0183")
  (:PATH "raw/core-compiler-fasl/src/mvcc/snapshots-core.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/mvcc/snapshots-core.fasl")
   :BYTES 11945 :SHA256
   "0b9d7f0012ce9b9aaadc6ed4350978d0f75abd70a7211480b39ccae6f9a4480f")
  (:PATH "raw/core-compiler-fasl/src/mvcc/snapshots-csn.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/mvcc/snapshots-csn.fasl")
   :BYTES 6271 :SHA256
   "b33ac1c38ca8826eb92cc8357306d227d47b4e3afbf56c35876263a79d80ca22")
  (:PATH "raw/core-compiler-fasl/src/mvcc/snapshots-lifecycle.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/mvcc/snapshots-lifecycle.fasl")
   :BYTES 10482 :SHA256
   "79d6991529f08e06a452a4c3fd48ab717d1dc6bd73cc36f4f6cf2bf74517d3fb")
  (:PATH "raw/core-compiler-fasl/src/mvcc/snapshots-read.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/mvcc/snapshots-read.fasl")
   :BYTES 13706 :SHA256
   "846f702a5b74b9b6b65ddcabd6b250e4f600ee23b618d02a1854af93de93bb7b")
  (:PATH "raw/core-compiler-fasl/src/mvcc/snapshots-register.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/mvcc/snapshots-register.fasl")
   :BYTES 10016 :SHA256
   "3015aa5ffc254014219ff71bf8f8fc34c0e757b896379026e01ae015fa81171b")
  (:PATH "raw/core-compiler-fasl/src/mvcc/snapshots-types.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/mvcc/snapshots-types.fasl")
   :BYTES 21782 :SHA256
   "2f3e4a58f715926e21410b2a046964a399dd817aa67b0007a679d0d13719bf94")
  (:PATH "raw/core-compiler-fasl/src/mvcc/types.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/mvcc/types.fasl")
   :BYTES 1396 :SHA256
   "6ee65a830a6a26e7b0f23f8f0087879ef2cd36da71250635d003ab1c23e77b45")
  (:PATH "raw/core-compiler-fasl/src/package.fasl" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/package.fasl")
   :BYTES 1408 :SHA256
   "98349c99ce917a1e839a7bc19988139dd50467401c75b052fbcc207c7e128e11")
  (:PATH "raw/core-compiler-fasl/src/read/core.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/read/core.fasl")
   :BYTES 6242 :SHA256
   "55ec65cc00955ddfdb41c31eaf2fc41700c24d6b8258f735cc3eb934642530bb")
  (:PATH "raw/core-compiler-fasl/src/read/package.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/read/package.fasl")
   :BYTES 1204 :SHA256
   "19d96b1f39f7f80726f64f0f00bb85e7c787228262ed5d4d7d1d1e19630b84dc")
  (:PATH "raw/core-compiler-fasl/src/read/task.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/read/task.fasl")
   :BYTES 14108 :SHA256
   "9805c484a29b4a498a305d1d3d73cdfc57dc6838f10ebac53ef37f72b29a2d8b")
  (:PATH "raw/core-compiler-fasl/src/read/types.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/read/types.fasl")
   :BYTES 9780 :SHA256
   "faba7c552b55f343d2f3e11177ba11c79d3594a42efbc9eef603c5a730589531")
  (:PATH "raw/core-compiler-fasl/src/recovery/decisions-build.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/recovery/decisions-build.fasl")
   :BYTES 17731 :SHA256
   "7cd0e3f80a96a878910e5908a572248c4202cea7384a4e2191834e930e6d350c")
  (:PATH "raw/core-compiler-fasl/src/recovery/decisions-package.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/recovery/decisions-package.fasl")
   :BYTES 1303 :SHA256
   "ff06aa1d1c1d7cc4e03b135550cc6a81710d148dfa32d42dc919970fcbde5f50")
  (:PATH "raw/core-compiler-fasl/src/recovery/decisions-query.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/recovery/decisions-query.fasl")
   :BYTES 7484 :SHA256
   "927e953d03057cb8b5ff74776594fe51583414694608b3312bcc1f63c8aa0812")
  (:PATH "raw/core-compiler-fasl/src/recovery/decisions-radix.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/recovery/decisions-radix.fasl")
   :BYTES 14792 :SHA256
   "2ed0572ad3ca61857abfd3b11c5f6ef8fa6d543d7d6074e9cc8ec112902bcd81")
  (:PATH "raw/core-compiler-fasl/src/recovery/decisions-sort.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/recovery/decisions-sort.fasl")
   :BYTES 14185 :SHA256
   "1ce79e31ac876ce1b2d4997afdefaf35a636f55ec827075af6f06c2e7e3dbf41")
  (:PATH "raw/core-compiler-fasl/src/recovery/decisions-types.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/recovery/decisions-types.fasl")
   :BYTES 11082 :SHA256
   "d9c0b1364859b54d098430afc5d56ed51d97ac9fd2fd152c77d76214fa6ffe76")
  (:PATH "raw/core-compiler-fasl/src/recovery/inventory-build.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/recovery/inventory-build.fasl")
   :BYTES 14474 :SHA256
   "e1c27fdf0fc7a21e36db369db8bd73cd6666193695ae16c20d04310cc12224c9")
  (:PATH "raw/core-compiler-fasl/src/recovery/inventory-query.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/recovery/inventory-query.fasl")
   :BYTES 3821 :SHA256
   "a17f55d3118088e41c336964ce9f052c108f773303e68ab408b2b0a6eac2f037")
  (:PATH "raw/core-compiler-fasl/src/recovery/inventory-types.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/recovery/inventory-types.fasl")
   :BYTES 14869 :SHA256
   "1a0fcfdb1a0f6b19669879d392ade8c72f3576cb9668e955a6bd517ff1860bae")
  (:PATH "raw/core-compiler-fasl/src/recovery/manifest-build.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/recovery/manifest-build.fasl")
   :BYTES 15468 :SHA256
   "76c13c8b9cb34c6f47bbc3d1993e23d42f13a2e5cc391c6177fb9050ac125442")
  (:PATH "raw/core-compiler-fasl/src/recovery/manifest-decode.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/recovery/manifest-decode.fasl")
   :BYTES 10756 :SHA256
   "05d47e3edad7b865b3cdf29bcbf1cfeed33b63b700119859a62208869597af6b")
  (:PATH "raw/core-compiler-fasl/src/recovery/manifest-fold.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/recovery/manifest-fold.fasl")
   :BYTES 14553 :SHA256
   "128ea20e2c6e6a0d0068def04ae2e4211a8ac3de4c0082435a98effe7bf869e7")
  (:PATH "raw/core-compiler-fasl/src/recovery/manifest-package.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/recovery/manifest-package.fasl")
   :BYTES 1740 :SHA256
   "86972cdb6a8c62e375456edd35321d5678d45ccb2efa69411cd5d55d54bb41c1")
  (:PATH "raw/core-compiler-fasl/src/recovery/manifest-query.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/recovery/manifest-query.fasl")
   :BYTES 6813 :SHA256
   "4d9d7d8c746a4b61fb7ec4edcd4a49972a836cd6b52e04cebef9c0965d60d1be")
  (:PATH "raw/core-compiler-fasl/src/recovery/manifest-types.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/recovery/manifest-types.fasl")
   :BYTES 30422 :SHA256
   "d8ba2fc5c709cf6488e868e0e64553fc077b4dd7548735db2ec12e673e852608")
  (:PATH "raw/core-compiler-fasl/src/recovery/package.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/recovery/package.fasl")
   :BYTES 1346 :SHA256
   "d4ac7a21340e023ca3b177c8628bad86a770c87eb2e1aac65d5b2e3947448722")
  (:PATH "raw/core-compiler-fasl/src/recovery/scan.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/recovery/scan.fasl")
   :BYTES 25455 :SHA256
   "56a0175e9655e0d82f56292d95467122fccfd6b61e115424064f21c9385ba87f")
  (:PATH "raw/core-compiler-fasl/src/scheduler/build.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/scheduler/build.fasl")
   :BYTES 4107 :SHA256
   "9b9b97b2369d81b30ac851e03955b1bd46dbac1f58825d1d496610063c5560bc")
  (:PATH "raw/core-compiler-fasl/src/scheduler/package.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/scheduler/package.fasl")
   :BYTES 949 :SHA256
   "44556aff7f0ae02a4a95dd7f5edd86a0160c523e45d437cf7be7c9179766ceea")
  (:PATH "raw/core-compiler-fasl/src/scheduler/policy.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/scheduler/policy.fasl")
   :BYTES 4420 :SHA256
   "0584700da039323c4aef29d0e8e5854a14bf434c274b37c4c4bbd6084b681135")
  (:PATH "raw/core-compiler-fasl/src/scheduler/read.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/scheduler/read.fasl")
   :BYTES 3337 :SHA256
   "65a74e99081c3b10f376577783e91fb4a4ba8ef27d958b22a35b4b8cae6c921d")
  (:PATH "raw/core-compiler-fasl/src/scheduler/types.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/scheduler/types.fasl")
   :BYTES 16612 :SHA256
   "75f588d50c91acda7027240f8fab2088cd676110f3aa5fc426b9393c1ca92a6b")
  (:PATH "raw/core-compiler-fasl/src/scheduler/update.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/scheduler/update.fasl")
   :BYTES 4738 :SHA256
   "33c6aa2e0a1a80b592a637b2b48d94858e3727bbb1d68125a52ac98987e83d60")
  (:PATH "raw/core-compiler-fasl/src/series/events.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/series/events.fasl")
   :BYTES 17566 :SHA256
   "b24ef990493969d11edb07ec942e12161c61dea2c461ce901b0b48fd10f0b594")
  (:PATH "raw/core-compiler-fasl/src/series/io-events.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/series/io-events.fasl")
   :BYTES 8396 :SHA256
   "7f24a480af68097d2d80be99cff6d640c991fb3181742b7bda6afda1a6e7d8cb")
  (:PATH "raw/core-compiler-fasl/src/series/ownership.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/series/ownership.fasl")
   :BYTES 13666 :SHA256
   "75e7db1625848c2b5cbae1fca69a145e853795080f7a1dd197b914bc5bc18471")
  (:PATH "raw/core-compiler-fasl/src/series/package.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/series/package.fasl")
   :BYTES 1726 :SHA256
   "e9b34ba679b7a5585aca56c1b8924c04d45ca7b4581cf9ec1a8e6451fad5c23e")
  (:PATH "raw/core-compiler-fasl/src/series/publication.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/series/publication.fasl")
   :BYTES 11513 :SHA256
   "4fa48865c8dcfa03972037d783f2da04c204ff66626eb812d34d0006af3ba67e")
  (:PATH "raw/core-compiler-fasl/src/series/query.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/series/query.fasl")
   :BYTES 6502 :SHA256
   "d7c250cf8ded0e12d59c45af021acd3fb278d4ba6aff6e39490eb5565d275236")
  (:PATH "raw/core-compiler-fasl/src/series/retirement.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/series/retirement.fasl")
   :BYTES 8218 :SHA256
   "5816a8ebe1cb9b3c196024d4339dd36a3eebf8817029784dfbe14ca250f9c1fc")
  (:PATH "raw/core-compiler-fasl/src/series/routing-build.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/series/routing-build.fasl")
   :BYTES 6421 :SHA256
   "f22ce33e5f6634ad771c5196b561fae58c3918c14de7b71f6ca4ff396bf0fa7d")
  (:PATH "raw/core-compiler-fasl/src/series/routing-select.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/series/routing-select.fasl")
   :BYTES 6879 :SHA256
   "a3209d382e9b530a1ee1823cb01f6e9c7c29f8e08134fa5ae7ce16425095d945")
  (:PATH "raw/core-compiler-fasl/src/series/routing-types.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/series/routing-types.fasl")
   :BYTES 9278 :SHA256
   "528ed028c1cb9ebdb3a0b21db2bba121c516ee4d77415bd3ffa8f0fec0734d58")
  (:PATH "raw/core-compiler-fasl/src/series/types.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/series/types.fasl")
   :BYTES 34017 :SHA256
   "15a88048904d84b4062d68eb1a63cf36cc4a276ce8555cb6c714332af204b853")
  (:PATH "raw/core-compiler-fasl/src/series/worker-boundary.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/series/worker-boundary.fasl")
   :BYTES 7854 :SHA256
   "97ed09acc8b00d87cc39983ab3e02edc726b7a8c292c8b08a8d0794a87c2983b")
  (:PATH "raw/core-compiler-fasl/src/series/worker-package.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/series/worker-package.fasl")
   :BYTES 1595 :SHA256
   "cc1cb09a76dc8e91b047d12f670299583a66655c94979e4db23ec70a00b6573c")
  (:PATH "raw/core-compiler-fasl/src/series/worker-run.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/series/worker-run.fasl")
   :BYTES 15266 :SHA256
   "128f57f09883becfca6b79c5e2435e6649a85f2ec53ad7d6c3e439d786107a3e")
  (:PATH "raw/core-compiler-fasl/src/series/worker-types.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/series/worker-types.fasl")
   :BYTES 17272 :SHA256
   "9096bf463a09f8bbb2385a61cf6fe6b76e7bfc0d932710106ac31ea95b2050a7")
  (:PATH "raw/core-compiler-fasl/src/storage/compaction-scan.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/storage/compaction-scan.fasl")
   :BYTES 8292 :SHA256
   "198e1598375e67df964aef294bc0c8df9d2812f5aeb34a5ed69bf3fa24bd5c3c")
  (:PATH "raw/core-compiler-fasl/src/storage/control-payload.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/storage/control-payload.fasl")
   :BYTES 12138 :SHA256
   "abe14ec565354e844904c0bcf3f1d250637b8246f6a4f37cb80c450c1c114a08")
  (:PATH "raw/core-compiler-fasl/src/storage/formats.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/storage/formats.fasl")
   :BYTES 8590 :SHA256
   "5aa0b54e3c816506d5901fa573eea95399660d8ad519ddaf63954c7851a821af")
  (:PATH "raw/core-compiler-fasl/src/storage/log-header.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/storage/log-header.fasl")
   :BYTES 7978 :SHA256
   "142b24b950d7462e54a597463d5db8dac797a05b5addc573f8dabddba2ebd2d4")
  (:PATH "raw/core-compiler-fasl/src/storage/package.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/storage/package.fasl")
   :BYTES 1504 :SHA256
   "4abba63fb1995d63ac805f77e97ebaac74cb04723098f6f036a9d9303b5216f8")
  (:PATH "raw/core-compiler-fasl/src/storage/payload-record.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/storage/payload-record.fasl")
   :BYTES 6755 :SHA256
   "204ddba68ddd8bdae6dfae476af332aa763b26baef48f1809112a8ff165700f8")
  (:PATH "raw/core-compiler-fasl/src/storage/payload-write.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/storage/payload-write.fasl")
   :BYTES 9555 :SHA256
   "5aa46f0a991607fe7a6fea602cbe25827bf9b3c6189e8ffffbcbf84bdbcb19fe")
  (:PATH "raw/core-compiler-fasl/src/storage/segment-header.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/storage/segment-header.fasl")
   :BYTES 10318 :SHA256
   "1fbd5311bc78d568fae38ea41c463e89bee7e740dcec2f59d07a138f1852487a")
  (:PATH "raw/core-compiler-fasl/src/wal/builder.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/wal/builder.fasl")
   :BYTES 14601 :SHA256
   "9f3e6938e6416ebc3a55bf67605a3b625e46d9efb51c276fce0aab2e8ceaee4f")
  (:PATH "raw/core-compiler-fasl/src/wal/csn.fasl" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/wal/csn.fasl")
   :BYTES 16441 :SHA256
   "14a8f006578337c5334b3df1dcc9a8bee53e27e13d3d681efb5306d1f300d9c0")
  (:PATH "raw/core-compiler-fasl/src/wal/executor.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/wal/executor.fasl")
   :BYTES 13808 :SHA256
   "fb5ea52408ef17e5d2a0672169e4010c633d5b351d17062e339952f0396bb6f1")
  (:PATH "raw/core-compiler-fasl/src/wal/group.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/wal/group.fasl")
   :BYTES 11036 :SHA256
   "f3ad3d0051713f8ac01c88d3904627694d0e5245c645ac13432563cea04a6fdb")
  (:PATH "raw/core-compiler-fasl/src/wal/package.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/wal/package.fasl")
   :BYTES 2129 :SHA256
   "948bda24d4f10fa8536c2da19ca3b198541c84eb3504b3df68f23b7f14515352")
  (:PATH "raw/core-compiler-fasl/src/wal/types.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/src/wal/types.fasl")
   :BYTES 38895 :SHA256
   "bb942ef6a102b0430c34809167650b67a6c3adb7cfb46bcdd5cf2cf5ddbe3d03")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-float-write-support.fasl"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/codec/cbor-float-write-support.fasl")
   :BYTES 30023 :SHA256
   "49eacc9be73a578e319ea33e75bf639361bb6c27ce4b0698a16453e270d8fe3e")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-float-write-threads.fasl"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/codec/cbor-float-write-threads.fasl")
   :BYTES 8187 :SHA256
   "c43ee429f4564d5ae4dd2f34dbc5474e92c33d9be923cd21feb26e5051699cb6")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-float-write.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/codec/cbor-float-write.fasl")
   :BYTES 40123 :SHA256
   "9126fa11e2a504b5dd426252c386063454474883b2f4b382b6798034268dfec6")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-header.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/codec/cbor-header.fasl")
   :BYTES 22715 :SHA256
   "9340482159ac80b98d25e687e462302f3caa8931239c90d4c715ea162d05e6ca")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-minimal-edges.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/codec/cbor-minimal-edges.fasl")
   :BYTES 3143 :SHA256
   "bc26dc0a93a0d1c0c0f13dc1ec15c4e179c371b35c5745cc3506e9771edc7534")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-minimal-scan-support.fasl"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/codec/cbor-minimal-scan-support.fasl")
   :BYTES 30234 :SHA256
   "716367de514c931f727b30e963651dac0e797ef45c990dbbf61a921720050feb")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-minimal-scan-threads.fasl"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/codec/cbor-minimal-scan-threads.fasl")
   :BYTES 9326 :SHA256
   "b13fa89da5f98ca1edb9c4041114ce1fddcb4e3e8fea1db275b1beb92659bfa1")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-minimal-scan.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/codec/cbor-minimal-scan.fasl")
   :BYTES 33527 :SHA256
   "50c53862028069c7d34bf08f0abcb40157477c8cd91e263da0476306c0907d5a")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-minimal-support.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/codec/cbor-minimal-support.fasl")
   :BYTES 23899 :SHA256
   "cadb20beb479aa240bd6e8a261e51e49a763aa481f108b312f3ee7b7b5079eb8")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-minimal-threads.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/codec/cbor-minimal-threads.fasl")
   :BYTES 7778 :SHA256
   "6e933c6d88852b63784af024ee49d210f2f43e6bf633c836f308cba36c25b48a")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-minimal.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/codec/cbor-minimal.fasl")
   :BYTES 24423 :SHA256
   "747f9eed6fa2dd2a5fdb50f137f31f4769c2d59ffe707d08f93503d1992aac1e")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-simple-write-support.fasl"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/codec/cbor-simple-write-support.fasl")
   :BYTES 16271 :SHA256
   "67714293f8f1fe01a7682e039fe5880e203ae79e55ca5dc3adf73651f50750ee")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-simple-write-threads.fasl"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/codec/cbor-simple-write-threads.fasl")
   :BYTES 8140 :SHA256
   "9ae91ed919b4fabbae3450c4ef0f60d684d36cdc2246611492517c17dabfd780")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-simple-write.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/codec/cbor-simple-write.fasl")
   :BYTES 23627 :SHA256
   "be528d85add26dccc7ef634a898b2f1b1301c7a46e8886df783644db7854c812")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-string-write-support.fasl"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/codec/cbor-string-write-support.fasl")
   :BYTES 19216 :SHA256
   "ff498bc48181a2d72b8b2e01fc6de33254cdb56b605db543510ff6ece6b6f68f")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-string-write-threads.fasl"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/codec/cbor-string-write-threads.fasl")
   :BYTES 8090 :SHA256
   "06ad4f81b999e7db9520f0d255b2468ce431a5dd9c4773690469f3ea931652d1")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-string-write.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/codec/cbor-string-write.fasl")
   :BYTES 28848 :SHA256
   "8ef02edf37462e46ba4a201c134f8fdb624aab2801b714d88b995726a8e2f97b")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-structure-support.fasl"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/codec/cbor-structure-support.fasl")
   :BYTES 34950 :SHA256
   "a3354fa89f88e4a660a6342a466200f0d443d999f0febeb73dadf684ee6146b5")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-structure-threads.fasl"
   :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/codec/cbor-structure-threads.fasl")
   :BYTES 9655 :SHA256
   "cd48b38ee83de10d73b36a994c44ca08cd42f5ed3963257982fb2aafbc024eb1")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-structure.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/codec/cbor-structure.fasl")
   :BYTES 41685 :SHA256
   "54f0c68157b9bd9727dabb448706950ceb71c745228f7a8e9560dfd48c5f377b")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-support.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/codec/cbor-support.fasl")
   :BYTES 18141 :SHA256
   "e5e1c0a8467dadddc395c3769b30c8d3ed70676161cc2f1bbfcfc82b79a17233")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-threads.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/codec/cbor-threads.fasl")
   :BYTES 8103 :SHA256
   "995ea388869609104979524bfdfbf0c80df2776ef737bca54d5f1b5b9b641f1f")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-write-roundtrip.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/codec/cbor-write-roundtrip.fasl")
   :BYTES 2562 :SHA256
   "c08ec4a569ce25408f9567a9daa7457bd5087ba4ef128b2c79e43792d9d0c09d")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-write-support.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/codec/cbor-write-support.fasl")
   :BYTES 14018 :SHA256
   "b09353d539e67a279c5af21e8211e792b23bbe5a92b0720a8e10a796f3131c8e")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-write-threads.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/codec/cbor-write-threads.fasl")
   :BYTES 8189 :SHA256
   "5f8aad4c428cbb7060c84829730aa2178c7a54ab6526a526ecd1f5c5328e75bc")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-write.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/codec/cbor-write.fasl")
   :BYTES 19800 :SHA256
   "bb2fd3158b60f0ebcfd6c4f5a3f9c96ce38e051ca474e076dfe83f311eb8f895")
  (:PATH "raw/core-compiler-fasl/tests/codec/support.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/codec/support.fasl")
   :BYTES 17735 :SHA256
   "a14831cb92fdae12c21457fed2722370d2390c881d7098d0ec189086459a630e")
  (:PATH "raw/core-compiler-fasl/tests/codec/threads.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/codec/threads.fasl")
   :BYTES 6736 :SHA256
   "5ef785832e48f24f3ff6442cbb55a21975b4c302440e0000dbb5ebc8e80717e1")
  (:PATH "raw/core-compiler-fasl/tests/codec/utf8.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/codec/utf8.fasl")
   :BYTES 25378 :SHA256
   "c9bfbfc3978ebb42fda0485af0fd1bfcd6bdcaac64b6a29c97ab29ceba05bc81")
  (:PATH "raw/core-compiler-fasl/tests/csn/registry.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/csn/registry.fasl")
   :BYTES 50837 :SHA256
   "60f4b8ac55a0769b3b75aee108d6572e1182f077a39c2830d3336643fd6b01a1")
  (:PATH "raw/core-compiler-fasl/tests/csn/support.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/csn/support.fasl")
   :BYTES 39998 :SHA256
   "bdca12ccff424f11d3ea62148383a30beac6e9befe64d1b215584fe506c23b09")
  (:PATH "raw/core-compiler-fasl/tests/csn/threads.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/csn/threads.fasl")
   :BYTES 22678 :SHA256
   "6202b2f936b36ec8058f729de5ca4934d786877dc9fa3f42802cb33d2333b0ae")
  (:PATH "raw/core-compiler-fasl/tests/epochs/lifecycle.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/epochs/lifecycle.fasl")
   :BYTES 73991 :SHA256
   "8bcf62a09a25249d1463b7d746d0a2bca86e985c95267135b1ec08642452ab2d")
  (:PATH "raw/core-compiler-fasl/tests/epochs/support.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/epochs/support.fasl")
   :BYTES 35869 :SHA256
   "63ff4500a431a03aea61b0f592987bb5b77bee2745187801172671155b17b628")
  (:PATH "raw/core-compiler-fasl/tests/epochs/threads.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/epochs/threads.fasl")
   :BYTES 10426 :SHA256
   "678a822e0388423d9b4eca4abfbbc5827794c9c353176ae3a2d18580be682450")
  (:PATH "raw/core-compiler-fasl/tests/execution/handoff.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/execution/handoff.fasl")
   :BYTES 90790 :SHA256
   "bfc34d6d3372d5e801f8fd90e37e82b51404b55f4275de7aada6e533624a337b")
  (:PATH "raw/core-compiler-fasl/tests/execution/queue.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/execution/queue.fasl")
   :BYTES 40341 :SHA256
   "f8f5a2a0f05c7ae35cf03bfadb8cb2f1cb6a91808af59d5fce5c77230e763b35")
  (:PATH "raw/core-compiler-fasl/tests/execution/ready-recycle.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/execution/ready-recycle.fasl")
   :BYTES 67058 :SHA256
   "d84e4a2925f77bfc11efbe858e58bb5e8243a97b6951000587ae329e6e23210b")
  (:PATH "raw/core-compiler-fasl/tests/execution/ready.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/execution/ready.fasl")
   :BYTES 82274 :SHA256
   "53712a4876fe8b3ecb9880729d3bd0da6863ca006bfd34dcd0a5c4776e1a0e26")
  (:PATH "raw/core-compiler-fasl/tests/execution/support.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/execution/support.fasl")
   :BYTES 16062 :SHA256
   "cec190a4408edfd3ba66114935318ede69bec87716edd5c4e5e2d4fa1160dabc")
  (:PATH "raw/core-compiler-fasl/tests/execution/threads.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/execution/threads.fasl")
   :BYTES 29758 :SHA256
   "2d121f2cb235d86e2fb513e14f10070a656c4f10afd99764d56aeb9c8c98d9a6")
  (:PATH "raw/core-compiler-fasl/tests/execution/worker.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/execution/worker.fasl")
   :BYTES 158274 :SHA256
   "93da895b6b9dddb5d848f453bb31509e1dc1e69b6ef6e7788bc48ccb03012d39")
  (:PATH "raw/core-compiler-fasl/tests/foundation/batch.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/foundation/batch.fasl")
   :BYTES 18997 :SHA256
   "7ba7d886474e481d9f424daa02ab53527141bf120655e12fc9dbec1167b9a5f6")
  (:PATH "raw/core-compiler-fasl/tests/foundation/binary.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/foundation/binary.fasl")
   :BYTES 15565 :SHA256
   "e060a61c88a8d4f9df1406281ac6eafcc5593f80a159b5deb639fef09fbe9557")
  (:PATH "raw/core-compiler-fasl/tests/foundation/record.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/foundation/record.fasl")
   :BYTES 59120 :SHA256
   "6acade0a5aca2751aa8b28c8cec16f664ed5a2ff0c639ffeadf4f9a1e09dd8da")
  (:PATH "raw/core-compiler-fasl/tests/foundation/support.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/foundation/support.fasl")
   :BYTES 10279 :SHA256
   "0d93107c02d6b319f5044e391f5932eea9e7561e628920b92cf66298d64fd53c")
  (:PATH "raw/core-compiler-fasl/tests/get-active/construction.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/get-active/construction.fasl")
   :BYTES 80701 :SHA256
   "5c6b96948e9f3d0e82a7e0c6f69ddc239c2ae98305d3a7b33aff5da598f8f0d2")
  (:PATH "raw/core-compiler-fasl/tests/get-active/directory.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/get-active/directory.fasl")
   :BYTES 29463 :SHA256
   "fd62835edbef1eac5fc1630017c804a7829686f0e0c3364389091dc6f2d12525")
  (:PATH "raw/core-compiler-fasl/tests/get-active/read.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/get-active/read.fasl")
   :BYTES 110769 :SHA256
   "a7829a1b9f49230804e022b0cca24180c7d15c3321c6be5bac939e70e0104c8f")
  (:PATH "raw/core-compiler-fasl/tests/get-active/support.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/get-active/support.fasl")
   :BYTES 179838 :SHA256
   "b2d7e6714af6d4f3ab2e31a072068dd3e0d8d349be36493f5247436175b901d7")
  (:PATH "raw/core-compiler-fasl/tests/get-directory/construction.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/get-directory/construction.fasl")
   :BYTES 40545 :SHA256
   "c7172a3ab1300fb59dc9f4f19af5d7b3fd4c4270670b2e981b7c3d865124778d")
  (:PATH "raw/core-compiler-fasl/tests/get-directory/read.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/get-directory/read.fasl")
   :BYTES 65623 :SHA256
   "7a6a0388ba56764716cc98f683169c205f46ca47bdd55a94a60f781f51b8f970")
  (:PATH "raw/core-compiler-fasl/tests/get-directory/support.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/get-directory/support.fasl")
   :BYTES 130098 :SHA256
   "be749315c9923b259276209b6fd301c8f4a77843cb54d2f85bb737ae95351f76")
  (:PATH "raw/core-compiler-fasl/tests/get-directory/threads.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/get-directory/threads.fasl")
   :BYTES 15446 :SHA256
   "104d3a9c4086f71129899662d5edf8c54039db45c8e2b22c13ace2ac9a38b05d")
  (:PATH "raw/core-compiler-fasl/tests/get-performance/guards.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/get-performance/guards.fasl")
   :BYTES 19323 :SHA256
   "8722e567f0b242254ec7c185d475974ea904f356a4d4e24dd5dddb9520fdfddd")
  (:PATH "raw/core-compiler-fasl/tests/get-performance/paths.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/get-performance/paths.fasl")
   :BYTES 15874 :SHA256
   "41a8c7f9e172eea3fe498712efb0ce75020e9706d990a8a58115ad529f9a99c5")
  (:PATH "raw/core-compiler-fasl/tests/get-performance/support.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/get-performance/support.fasl")
   :BYTES 114328 :SHA256
   "a6dc0f92ea9cedfbcfddda57e8f641015454ffa170b98505310cbef9518bf934")
  (:PATH "raw/core-compiler-fasl/tests/get-performance/threads.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/get-performance/threads.fasl")
   :BYTES 10488 :SHA256
   "40b7a7ceb61bd2ab55728d9273fc78b7dcf8cdb9bc032fd0013666edde85a08e")
  (:PATH "raw/core-compiler-fasl/tests/get-resolver/construction.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/get-resolver/construction.fasl")
   :BYTES 56487 :SHA256
   "f5913efb82b1f2120957d5cacbee9db902664750aa26ff8f2d62e43608a88d1f")
  (:PATH "raw/core-compiler-fasl/tests/get-resolver/read.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/get-resolver/read.fasl")
   :BYTES 122920 :SHA256
   "394f1e31d76263b2c15d7e9ff0a9fda696d95b98610eea0271046abc2cba03c6")
  (:PATH "raw/core-compiler-fasl/tests/get-resolver/sort.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/get-resolver/sort.fasl")
   :BYTES 31281 :SHA256
   "778188adfcb5558cd032bd2b7e10d274c0c268843bb6de9311acc5d44133a0d5")
  (:PATH "raw/core-compiler-fasl/tests/get-resolver/support.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/get-resolver/support.fasl")
   :BYTES 130398 :SHA256
   "7187559b3c27080a1104d27978130043f1507ce2695def00137f3c796baf6987")
  (:PATH "raw/core-compiler-fasl/tests/get/lifecycle.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/get/lifecycle.fasl")
   :BYTES 86073 :SHA256
   "29cf68c9cc555063cde8a9177bb543216a81702f2fb3a4c5ee1d2f7af7c3ac08")
  (:PATH "raw/core-compiler-fasl/tests/get/segment.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/get/segment.fasl")
   :BYTES 64574 :SHA256
   "e9ca170992a9797957b244ee9075f0b3771e9fd8f55b626c6499508260649aaa")
  (:PATH "raw/core-compiler-fasl/tests/get/support.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/get/support.fasl")
   :BYTES 56073 :SHA256
   "9dc8309c6368389492e2d76aa7533d6b7a5dccfa5b521586f84a03dbf9860fa8")
  (:PATH "raw/core-compiler-fasl/tests/hash/guards.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/hash/guards.fasl")
   :BYTES 4813 :SHA256
   "7ca217d121b0cce1982d9bff0e92c4d048c46596768e1ee8f6ac2155cc89a999")
  (:PATH "raw/core-compiler-fasl/tests/hash/hash64.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/hash/hash64.fasl")
   :BYTES 37240 :SHA256
   "89dee8ef05aa4442866b439d2c5292b8af34ee892a8d912ebcd19cd4096df5da")
  (:PATH "raw/core-compiler-fasl/tests/hash/support.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/hash/support.fasl")
   :BYTES 46851 :SHA256
   "1ba516f13f1d8db74aa50074ac8e3e1ed8b696ebffa2ed521d01f34187305ef3")
  (:PATH "raw/core-compiler-fasl/tests/hash/threads.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/hash/threads.fasl")
   :BYTES 14676 :SHA256
   "62c715226ea546a778a5eaa6e70efba83f38ba74ae5ba15692f44900481dff65")
  (:PATH "raw/core-compiler-fasl/tests/index/hash-digests.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/index/hash-digests.fasl")
   :BYTES 149735 :SHA256
   "d3fcacf90db469665fd709bc0cdcbd4c54a1737cfa3a0e2796d4d5713cdc36bb")
  (:PATH "raw/core-compiler-fasl/tests/index/primary-support.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/index/primary-support.fasl")
   :BYTES 55217 :SHA256
   "ae1e2daf27a7970c9a85b27185ef376ab82ecda3869d0b71821e252378c4de77")
  (:PATH "raw/core-compiler-fasl/tests/index/primary-threads.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/index/primary-threads.fasl")
   :BYTES 54605 :SHA256
   "2a929be2ea1a57ac5977bbf7e3387ce4d6b20a6e444b1771bb6bc982c1d9857b")
  (:PATH "raw/core-compiler-fasl/tests/index/primary.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/index/primary.fasl")
   :BYTES 143085 :SHA256
   "9ffe426d968585c4e65a8aec595833d23f6d91ea69b5e37e484619066e0ca45b")
  (:PATH "raw/core-compiler-fasl/tests/index/rebuild.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/index/rebuild.fasl")
   :BYTES 135883 :SHA256
   "45a1f72692ee247203c8166e71de085881bb2fa170f82c2bccb4d2e9ff88e264")
  (:PATH "raw/core-compiler-fasl/tests/index/slot-support.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/index/slot-support.fasl")
   :BYTES 48231 :SHA256
   "898f2f71628c6f828f1f7371d003e28d3e21c7a395f4777d5131309845122a5f")
  (:PATH "raw/core-compiler-fasl/tests/index/slot-threads.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/index/slot-threads.fasl")
   :BYTES 52731 :SHA256
   "e1ef86cd5d7a3970c53b31cca453b02cd9b0bcd2707f0e22c82fc8f820fed87e")
  (:PATH "raw/core-compiler-fasl/tests/index/slots.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/index/slots.fasl")
   :BYTES 148208 :SHA256
   "d23b356421325d03f3848646af4180ec80d37d7a49897f2ec6a7d663b622fca0")
  (:PATH "raw/core-compiler-fasl/tests/io/native.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/io/native.fasl")
   :BYTES 34324 :SHA256
   "05dd596c4d948e52eadd5509e7f45cd861cf09d02a2e17c9f0ce4211310647a5")
  (:PATH "raw/core-compiler-fasl/tests/io/support.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/io/support.fasl")
   :BYTES 16072 :SHA256
   "7e38d4b7ec42e5b724a7a891d41c7e02a897de502f524dc611eca68e4498cbda")
  (:PATH "raw/core-compiler-fasl/tests/io/transfer.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/io/transfer.fasl")
   :BYTES 53177 :SHA256
   "f5a819c73a4b801c602910f66935d66cafd33e161f8d7b6aa401145bd844ba88")
  (:PATH "raw/core-compiler-fasl/tests/mvcc/capture.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/mvcc/capture.fasl")
   :BYTES 48565 :SHA256
   "b927fe641761720ed562d4a8638bf6638851adaf7631cf49d863261567b382d6")
  (:PATH "raw/core-compiler-fasl/tests/mvcc/lifecycle.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/mvcc/lifecycle.fasl")
   :BYTES 89147 :SHA256
   "89fc75be18f83ecb6d22072528e42329e43d23e5ef004a6e68f46bf454796028")
  (:PATH "raw/core-compiler-fasl/tests/mvcc/support.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/mvcc/support.fasl")
   :BYTES 38348 :SHA256
   "168965b6597d2f377ea29a3a6fd96ca2357e776b2099581ba5807449ad986ea5")
  (:PATH "raw/core-compiler-fasl/tests/read/lifecycle.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/read/lifecycle.fasl")
   :BYTES 122292 :SHA256
   "7d89a264dd3f32b15b8730a270f5e5b04081b65c96a0ceb996f2a935d2ddb35e")
  (:PATH "raw/core-compiler-fasl/tests/read/support.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/read/support.fasl")
   :BYTES 20926 :SHA256
   "b2d1b70d5837fcaaea5d4bdb8ab6bf81c76746753fef24e65a8fdb8c5e10964e")
  (:PATH "raw/core-compiler-fasl/tests/read/threads.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/read/threads.fasl")
   :BYTES 16888 :SHA256
   "c80d8fce9b988a55a9b4ace96119dc91e6859fbd93aefd5c07dc284a666377f4")
  (:PATH "raw/core-compiler-fasl/tests/recovery/corruption.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/recovery/corruption.fasl")
   :BYTES 13096 :SHA256
   "196e8c14f17350a74e7fd3335a0db94f6ef03a8e344fc532db88792534dae1dc")
  (:PATH "raw/core-compiler-fasl/tests/recovery/decisions-audit.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/recovery/decisions-audit.fasl")
   :BYTES 34012 :SHA256
   "7c424a1349e037b1fa0377ff4ce8c12fe6a35bef995f600ee4a6ee66924f2031")
  (:PATH "raw/core-compiler-fasl/tests/recovery/decisions-radix.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/recovery/decisions-radix.fasl")
   :BYTES 69382 :SHA256
   "5d853671b87b919f82588b76d160e759e9c457c5c6670da1dd7dd02feb4f0eeb")
  (:PATH "raw/core-compiler-fasl/tests/recovery/decisions-support.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/recovery/decisions-support.fasl")
   :BYTES 16622 :SHA256
   "8adc5e9df71e95eb70f05fa38d8ae91748e69757aaaf0c3648ea612202883392")
  (:PATH "raw/core-compiler-fasl/tests/recovery/decisions.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/recovery/decisions.fasl")
   :BYTES 57597 :SHA256
   "1d1f96dc7c4b33a43a1e43b40435e80f02a39abe7778c0229c5fff699a270976")
  (:PATH "raw/core-compiler-fasl/tests/recovery/inventory-support.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/recovery/inventory-support.fasl")
   :BYTES 20593 :SHA256
   "2558918b1ed46b14d202e3278d532eff1f3f4fd18aaf3b2edbbf12b51c54a2c5")
  (:PATH "raw/core-compiler-fasl/tests/recovery/inventory.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/recovery/inventory.fasl")
   :BYTES 37711 :SHA256
   "f42c157aacd632a5d29afd65efaa25659c33e857526d088f53e49051dbb74f15")
  (:PATH "raw/core-compiler-fasl/tests/recovery/manifest-audit.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/recovery/manifest-audit.fasl")
   :BYTES 47969 :SHA256
   "3f48650ad0f2e38e57b3e6ec8fd10018ffa93c3e2b0395bb437a146c8d36d1f7")
  (:PATH "raw/core-compiler-fasl/tests/recovery/manifest-support.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/recovery/manifest-support.fasl")
   :BYTES 24107 :SHA256
   "657f0b9a4e00b83b35e30ade972addd99441fd9b515aabfca921737d71d0026c")
  (:PATH "raw/core-compiler-fasl/tests/recovery/manifest.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/recovery/manifest.fasl")
   :BYTES 33934 :SHA256
   "36a782f862c3df14087dc06c10d2fefb7d91cbafc955a152257b8c2fd257ea0b")
  (:PATH "raw/core-compiler-fasl/tests/recovery/scan.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/recovery/scan.fasl")
   :BYTES 52950 :SHA256
   "6c251d7efbd589adcf49b22972b49154d25e63ecabe39c073d44642ee817913a")
  (:PATH "raw/core-compiler-fasl/tests/recovery/support.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/recovery/support.fasl")
   :BYTES 17910 :SHA256
   "7e949b721cb301e6b0a372e77ee151d8e6d7b596da1b0e3228afea66c2f6125a")
  (:PATH "raw/core-compiler-fasl/tests/scheduler/controller.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/scheduler/controller.fasl")
   :BYTES 48541 :SHA256
   "41483a8526d41eb6e001ac593a4cbc79dc1b430c44f8ff6ffbce2d281753b7eb")
  (:PATH "raw/core-compiler-fasl/tests/scheduler/support.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/scheduler/support.fasl")
   :BYTES 10716 :SHA256
   "dcb0abab0ecafe5ae9484ee3ff5d05b7bfecfd9564e188afe8e982664ee62acb")
  (:PATH "raw/core-compiler-fasl/tests/series/boundaries.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/series/boundaries.fasl")
   :BYTES 10727 :SHA256
   "08e623643ad29da5ac923f7c3e71042778063c30dd1606e82231725d36889d57")
  (:PATH "raw/core-compiler-fasl/tests/series/controller.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/series/controller.fasl")
   :BYTES 112892 :SHA256
   "c756b8a878c4af359a3c8e40288ffb74813f726046d57973f4a5d3a81956066c")
  (:PATH "raw/core-compiler-fasl/tests/series/support.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/series/support.fasl")
   :BYTES 94484 :SHA256
   "aadf1ebe12bcb29400ff424f19ab9db129f8bc9aa0bd8963a199a1901b6da73c")
  (:PATH "raw/core-compiler-fasl/tests/series/threads.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/series/threads.fasl")
   :BYTES 36252 :SHA256
   "55b353402fa3b7790ebb8533a2c80c39651571c9b1e251670b2acd67255e89cd")
  (:PATH "raw/core-compiler-fasl/tests/series/worker-bridge.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/series/worker-bridge.fasl")
   :BYTES 111071 :SHA256
   "a4a67d03dd2d7d5c1f6761c7c07b5b83697683b0f84dc895921ab5d4aec17606")
  (:PATH "raw/core-compiler-fasl/tests/series/worker-routing.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/series/worker-routing.fasl")
   :BYTES 64487 :SHA256
   "fdee556c3593456242f39684378e14146f100dbd670f9581c8e66a9f769835f6")
  (:PATH "raw/core-compiler-fasl/tests/smoke.fasl" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/smoke.fasl")
   :BYTES 3292 :SHA256
   "bf54f88d2551abac01c5547be4ade12bc16ddac34a1d1eebb167142b7ff85049")
  (:PATH "raw/core-compiler-fasl/tests/storage/compaction-scan.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/storage/compaction-scan.fasl")
   :BYTES 35506 :SHA256
   "1342cab5555e907046333354bb48eddecb98b372ee9e30890414abd1f5c33e3d")
  (:PATH "raw/core-compiler-fasl/tests/storage/control-payload.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/storage/control-payload.fasl")
   :BYTES 59359 :SHA256
   "682277c60b8b4c125f1a956c0a994ccbe36e0a0208efeeaceb6afc66e434e248")
  (:PATH "raw/core-compiler-fasl/tests/storage/log-header.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/storage/log-header.fasl")
   :BYTES 36645 :SHA256
   "da6472085884f1586c6863fbc336d00dcbe4e5c91579b9b4d4f88953c605c4ae")
  (:PATH "raw/core-compiler-fasl/tests/storage/segment-header.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/storage/segment-header.fasl")
   :BYTES 18224 :SHA256
   "9e287ded1d701d48125bc8db32b741f905aedfa0271908bf05f73a5ae54e4a5f")
  (:PATH "raw/core-compiler-fasl/tests/storage/support.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/storage/support.fasl")
   :BYTES 13726 :SHA256
   "610dfd327960e8523c19ddcb84f5cc461c521c96fa9075f76de8fe572524b7aa")
  (:PATH "raw/core-compiler-fasl/tests/wal/builder.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/wal/builder.fasl")
   :BYTES 17402 :SHA256
   "d532974d7efc7108cdcd8b3c2baa7c544035a8c547c821155d5151275ee76845")
  (:PATH "raw/core-compiler-fasl/tests/wal/csn-threads.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/wal/csn-threads.fasl")
   :BYTES 27294 :SHA256
   "c584cf7c125908a8ff1ae4735fe681c2653e57f0d22130ab383ee942636f82e0")
  (:PATH "raw/core-compiler-fasl/tests/wal/csn.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/wal/csn.fasl")
   :BYTES 167874 :SHA256
   "bbf20da1baca344a357b6415787df7820acd23de72197a50670303afa4fd4d3b")
  (:PATH "raw/core-compiler-fasl/tests/wal/fault.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/wal/fault.fasl")
   :BYTES 28704 :SHA256
   "7e7c014801f4b67460c983527121df531f9e7f5e6450da717aebcec3a6c826fe")
  (:PATH "raw/core-compiler-fasl/tests/wal/group.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/wal/group.fasl")
   :BYTES 25478 :SHA256
   "9379cf0ae09a5c2a192c726109a82d0fdddfad71ae374669b63a4a21ec26378a")
  (:PATH "raw/core-compiler-fasl/tests/wal/native.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/wal/native.fasl")
   :BYTES 9845 :SHA256
   "55ca7e417ce0e7d2850261dc71f70befc8a9ceadc1928dcd7ff1604d11d7721d")
  (:PATH "raw/core-compiler-fasl/tests/wal/support.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/active-core-fasl-R2/tests/wal/support.fasl")
   :BYTES 8024 :SHA256
   "309a4dd72940bd30094e33d7ab8f1b9959f21a1e2f2f08fe996c5aa415bbc119")
  (:PATH "raw/coverage-active-command/conservazione.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910524-command-10396-0/conservazione.lisp")
   :BYTES 1174 :SHA256
   "e9e7fa51cec3678dea90003309466a95a52c6d364b8d10ae854dcbb019ad56cf")
  (:PATH "raw/coverage-active-command/report.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910524-command-10396-0/report.lisp")
   :BYTES 162180 :SHA256
   "ddb43c23552022dbb2bc323dcef99c2bf7b8f2b2f912b1b4d61743e435479085")
  (:PATH "raw/coverage-active/004295b73a57d5e2a290e7899828af88.html" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/004295b73a57d5e2a290e7899828af88.html")
   :BYTES 42333 :SHA256
   "d36720286c0d93fdb7167e99f9f6fb1f9cd51aa10d91925b423d406fa13eceb9")
  (:PATH "raw/coverage-active/04076e76b4fc5fcdc5195e10e258c570.html" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/04076e76b4fc5fcdc5195e10e258c570.html")
   :BYTES 19691 :SHA256
   "3443a0275bcdb6725fad12f32f5624f3d56ffd5415d2b3c2791dca4c128fa59e")
  (:PATH "raw/coverage-active/0a1abb78426f9259ec99d9abbe21d585.html" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/0a1abb78426f9259ec99d9abbe21d585.html")
   :BYTES 14105 :SHA256
   "ad97fb3a8749efe676a5e1ec03196feeccfe15a3164ad6171e5bfd625f215dca")
  (:PATH "raw/coverage-active/1561296e51191b2b75341b8d23064470.html" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/1561296e51191b2b75341b8d23064470.html")
   :BYTES 18937 :SHA256
   "a82e31d19e1f4a4f78cca9159a863dd77312f0c3919381b7016786583c39ee1b")
  (:PATH "raw/coverage-active/1ca483f559ef2db0576097941306903b.html" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/1ca483f559ef2db0576097941306903b.html")
   :BYTES 17849 :SHA256
   "6a3415d5ebfdae65315c7bea55961e7a04416aef9cac3325a380c0f74ebda9a5")
  (:PATH "raw/coverage-active/1d4da170ad6f4c10df4c94c88178dcab.html" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/1d4da170ad6f4c10df4c94c88178dcab.html")
   :BYTES 32292 :SHA256
   "36ff20ce6bd4a8656b2243317988f341c5554906926a165d46677e0a11ef8e1e")
  (:PATH "raw/coverage-active/283c01a024edc3bc6aa60e3b1eb9e449.html" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/283c01a024edc3bc6aa60e3b1eb9e449.html")
   :BYTES 11588 :SHA256
   "9058bfdb210e39f22a343728f4f2a5043e33611b4e03f06c67c72790970d6a28")
  (:PATH "raw/coverage-active/2ed64f3662ffefb9fa08ff1e43eb7985.html" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/2ed64f3662ffefb9fa08ff1e43eb7985.html")
   :BYTES 26355 :SHA256
   "c2e4f568d69fb8b204b03c42f1690f5492ae0aa641d4c159e35c3a937fe2562d")
  (:PATH "raw/coverage-active/4fcd0cc179ab6313179f4126aa0d485d.html" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/4fcd0cc179ab6313179f4126aa0d485d.html")
   :BYTES 40406 :SHA256
   "8546deea7b6267b219d35cea87cf4fca8048a5c831ad9aedc26567b270f8d8f0")
  (:PATH "raw/coverage-active/8228849258afdb3f2c39668f00d54dd3.html" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/8228849258afdb3f2c39668f00d54dd3.html")
   :BYTES 28296 :SHA256
   "191ee4700de91ed7eb7b18546e447aa4118355a427b4f7a063275e33513f79eb")
  (:PATH "raw/coverage-active/cover-index.html" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/cover-index.html")
   :BYTES 3441 :SHA256
   "24824669f6b701634a8552a02a9bc9cea004811067e9e94451c16a74d76baee0")
  (:PATH "raw/coverage-active/coverage-state.lisp.gz" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/coverage-state.lisp")
   :BYTES 309274 :SHA256
   "656861b32cf5e6174600621ee797a114d6e243cd657d97069db7d4cfd85dc9b4" :CODEC
   :GZIP :UNCOMPRESSED-BYTES 2168965 :UNCOMPRESSED-SHA256
   "0d6ae91a607627362c15054d420693fc9aeaaf7e9bc5f685e9542ee09f3ae4a6")
  (:PATH "raw/coverage-active/coverage-summary.lisp" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/coverage-summary.lisp")
   :BYTES 3673 :SHA256
   "af7db9096913c6977625aba55f1e2f7e83f77454eac5842e7c87db8200d2f7ac")
  (:PATH "raw/coverage-active/fasl/src/cache/build.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/cache/build.fasl")
   :BYTES 14453 :SHA256
   "b1554ca19481eb4cb80f45283504ae23246c93f3f3891d5b8e75186b3b640b8a")
  (:PATH "raw/coverage-active/fasl/src/cache/clock.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/cache/clock.fasl")
   :BYTES 7952 :SHA256
   "823a205c6cef95b01fe7209ab267438f21858e326934f26e7c0284c11467c02b")
  (:PATH "raw/coverage-active/fasl/src/cache/core.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/cache/core.fasl")
   :BYTES 10955 :SHA256
   "0a039d3aa2f7f7c3d8bdf6df83261de0b46057eaad1a007fbdb784b06c403a8e")
  (:PATH "raw/coverage-active/fasl/src/cache/package.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/cache/package.fasl")
   :BYTES 1228 :SHA256
   "4f1feb8fc4243b7bfcecf6919df8ef2242abb1b58315e2b3eefc0ad0819db47c")
  (:PATH "raw/coverage-active/fasl/src/cache/read.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/cache/read.fasl")
   :BYTES 18380 :SHA256
   "de79874d5891d913c0ae1106876e350235bf10297b526a5cfb06c1f71d9a80cb")
  (:PATH "raw/coverage-active/fasl/src/cache/types.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/cache/types.fasl")
   :BYTES 20972 :SHA256
   "9b36af2ae2a729057dfcdfc420741fa9ccb017f187cd371226dd21fed2ff3c11")
  (:PATH "raw/coverage-active/fasl/src/cache/write.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/cache/write.fasl")
   :BYTES 14808 :SHA256
   "7ca7db3ed02def2d261a43be6d7f826c6617451f78ae9de828d1d3b0746041b1")
  (:PATH "raw/coverage-active/fasl/src/codec/cbor-float-minimal.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/codec/cbor-float-minimal.fasl")
   :BYTES 8603 :SHA256
   "7fcd93b27fa2c5bde281b7153546c70814a97de3ee3a62dd001a3d8156473ced")
  (:PATH "raw/coverage-active/fasl/src/codec/cbor-float-narrow.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/codec/cbor-float-narrow.fasl")
   :BYTES 10237 :SHA256
   "40bc5b1877079ab2bcda09c1a867126084c9900b069c7017207fa94e541393c4")
  (:PATH "raw/coverage-active/fasl/src/codec/cbor-float-write.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/codec/cbor-float-write.fasl")
   :BYTES 12246 :SHA256
   "a304ddbba94d3f3d574d137070cb0f57b603fe10fe0bdb897189a81566ef2055")
  (:PATH "raw/coverage-active/fasl/src/codec/cbor-header.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/codec/cbor-header.fasl")
   :BYTES 13886 :SHA256
   "fca55a66112f2ca4565936d2398c896577d25428ab220d950347a66b450ec264")
  (:PATH "raw/coverage-active/fasl/src/codec/cbor-minimal.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/codec/cbor-minimal.fasl")
   :BYTES 10154 :SHA256
   "a4e8060e9712434ce6dacd06032c60c9e8c208d9d50f0228c77622dec6ffbae8")
  (:PATH "raw/coverage-active/fasl/src/codec/cbor-package.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/codec/cbor-package.fasl")
   :BYTES 1229 :SHA256
   "7404028d593441c0f7d14c77dfa68dbad080aa1007319b8134b74695772bc1b9")
  (:PATH "raw/coverage-active/fasl/src/codec/cbor-scan-input.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/codec/cbor-scan-input.fasl")
   :BYTES 5858 :SHA256
   "d660521f9eca689a953f210f25efd7a5c46820dd267f54b8a27d2239169c7e72")
  (:PATH "raw/coverage-active/fasl/src/codec/cbor-scan-items.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/codec/cbor-scan-items.fasl")
   :BYTES 19506 :SHA256
   "adac638705a5ac7d97c7a99ed68cb7610fcf32cb81ee76c80bb33e9705e0eaa6")
  (:PATH "raw/coverage-active/fasl/src/codec/cbor-scan-minimal.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/codec/cbor-scan-minimal.fasl")
   :BYTES 3208 :SHA256
   "f8005a1a7086683a38d55ae1565c3721585277a9cb7d3ee3ea0e8fe814ccc06f")
  (:PATH "raw/coverage-active/fasl/src/codec/cbor-scan-stack.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/codec/cbor-scan-stack.fasl")
   :BYTES 14669 :SHA256
   "5289bd1e0989aa8c80abb7c617c89f90de611fcf8f9d091c2af5054496e09b49")
  (:PATH "raw/coverage-active/fasl/src/codec/cbor-scan.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/codec/cbor-scan.fasl")
   :BYTES 13424 :SHA256
   "451d33e222c38c1f31daa03ae98acf654883e446f00bc1003190e710088e27f0")
  (:PATH "raw/coverage-active/fasl/src/codec/cbor-simple-write.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/codec/cbor-simple-write.fasl")
   :BYTES 6709 :SHA256
   "653dd78cef7090c4afbca8da7395f08975962d0a3fe7ee893bc8634674f7f79b")
  (:PATH "raw/coverage-active/fasl/src/codec/cbor-space.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/codec/cbor-space.fasl")
   :BYTES 14701 :SHA256
   "45ffdbdc4b372226711519e0e28eaa3f483273040f942ed86d53798a5c1a70ae")
  (:PATH "raw/coverage-active/fasl/src/codec/cbor-string-write.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/codec/cbor-string-write.fasl")
   :BYTES 17300 :SHA256
   "1f9f478f6b62a7250f18d758ed0d33deb793631daa3974bc2365eb4492676313")
  (:PATH "raw/coverage-active/fasl/src/codec/cbor-write.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/codec/cbor-write.fasl")
   :BYTES 13500 :SHA256
   "259c2bd4df78831b8551a9178583c7087edd8f887d60bfb4966c8a7bebb5327b")
  (:PATH "raw/coverage-active/fasl/src/codec/package.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/codec/package.fasl")
   :BYTES 997 :SHA256
   "904316e7c0c740beec7ac675fe0db4eb5f92114854118f098e3b71397b421151")
  (:PATH "raw/coverage-active/fasl/src/codec/utf8.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/codec/utf8.fasl")
   :BYTES 16206 :SHA256
   "9d8cce91c6a30cc8370173e98b55653ce25154eeee5f96ff9a745f707db08453")
  (:PATH "raw/coverage-active/fasl/src/csn/package.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/csn/package.fasl")
   :BYTES 1030 :SHA256
   "43376166e2a88d5bad976813b44d9ae2992f920d327bb9e62e50a6cbf23b4543")
  (:PATH "raw/coverage-active/fasl/src/csn/registry.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/csn/registry.fasl")
   :BYTES 41581 :SHA256
   "31a2c1706b000f50f59b680473fef0f010246d2dd97824f328aeed62bd24526c")
  (:PATH "raw/coverage-active/fasl/src/epochs/core.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/epochs/core.fasl")
   :BYTES 15739 :SHA256
   "cf992a1ef3cd318c9c23670c1f05d497deecf0e75590b7111354b40c0bc18ed4")
  (:PATH "raw/coverage-active/fasl/src/epochs/package.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/epochs/package.fasl")
   :BYTES 1255 :SHA256
   "48e87b29f08ad77ad1fab25bfc76ee37ee5ce0ce3d08367d5521f94990adf721")
  (:PATH "raw/coverage-active/fasl/src/epochs/read.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/epochs/read.fasl")
   :BYTES 7409 :SHA256
   "c1b388567022e08d9a46368bb49da42caeb7fd72b6d6db7917f2d926bd968c76")
  (:PATH "raw/coverage-active/fasl/src/epochs/reclaim.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/epochs/reclaim.fasl")
   :BYTES 16045 :SHA256
   "4d13bd469964f99a413bc98f32a8ef872bd06784837b7c581b9e9b2c02f5fc9c")
  (:PATH "raw/coverage-active/fasl/src/epochs/retire.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/epochs/retire.fasl")
   :BYTES 14474 :SHA256
   "a2b5e77ec0110f50131175b7b7c729611bcc487512fd7bf971a4b727075fb1ad")
  (:PATH "raw/coverage-active/fasl/src/epochs/types.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/epochs/types.fasl")
   :BYTES 29339 :SHA256
   "c0e74cce6eaac1cc2ab7eab005bb798e490b25566a0793e5bed2a08f8a12db2c")
  (:PATH "raw/coverage-active/fasl/src/execution/handoff.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/execution/handoff.fasl")
   :BYTES 21401 :SHA256
   "a1b08518835a7c6ec3c6551480b07b18011394887aa8c5f9e4ada64ecaf425c0")
  (:PATH "raw/coverage-active/fasl/src/execution/package.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/execution/package.fasl")
   :BYTES 1666 :SHA256
   "ad1726b0105d8af3d4179553a3f9c9bbf09568424b72f5d09a5c6e1482024708")
  (:PATH "raw/coverage-active/fasl/src/execution/queue.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/execution/queue.fasl")
   :BYTES 23891 :SHA256
   "e5c69b2e43e7834b965bc50794ffe6c0096b53408ac1a97c7d5a0371011203eb")
  (:PATH "raw/coverage-active/fasl/src/execution/ready-recycle.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/execution/ready-recycle.fasl")
   :BYTES 7015 :SHA256
   "1b8d97780e4b6d1cf2985b06a7fdda5cb8646bc82fedf92a310a753961c14410")
  (:PATH "raw/coverage-active/fasl/src/execution/ready-types.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/execution/ready-types.fasl")
   :BYTES 20711 :SHA256
   "c77bc91a7d5cfbde57a17b2f703d30b13eab70d9d020dc3b9f92ab6d0f9d957e")
  (:PATH "raw/coverage-active/fasl/src/execution/ready.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/execution/ready.fasl")
   :BYTES 14445 :SHA256
   "9cddbd4c10214bbc9aba4e7d0e2fd9af48d16e5e3ef6007a4d41ea97d05877aa")
  (:PATH "raw/coverage-active/fasl/src/execution/worker-boundary.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/execution/worker-boundary.fasl")
   :BYTES 7927 :SHA256
   "97b03274b93bb3640685e7c9a2f81557413c50379aaf839f2a29ce6d676ef313")
  (:PATH "raw/coverage-active/fasl/src/execution/worker-claim.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/execution/worker-claim.fasl")
   :BYTES 17056 :SHA256
   "3dcd933ff135a9dac6559265f4e694186a18a3c6d9320bc5fc15b7eae7a20f7b")
  (:PATH "raw/coverage-active/fasl/src/execution/worker-run.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/execution/worker-run.fasl")
   :BYTES 13134 :SHA256
   "75181b5a072266f3dab684c7ef058b37300408e58e921a3e0f9da872e8ad5d03")
  (:PATH "raw/coverage-active/fasl/src/execution/worker-types.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/execution/worker-types.fasl")
   :BYTES 29019 :SHA256
   "f8a7975d12f5ae77fb1a5553cd466c8ca5ca6459aade114a296b31bf0cb65ed0")
  (:PATH "raw/coverage-active/fasl/src/execution/writer.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/execution/writer.fasl")
   :BYTES 14985 :SHA256
   "086309fea49d61399986b770184d86ba6cff9741eefefc3fa12b418e0c6140a2")
  (:PATH "raw/coverage-active/fasl/src/foundation/batch.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/foundation/batch.fasl")
   :BYTES 15595 :SHA256
   "c6665a446fe300cf5d356786c014c4cc22c8ff43816b0d86f179c4f963fa5a53")
  (:PATH "raw/coverage-active/fasl/src/foundation/binary.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/foundation/binary.fasl")
   :BYTES 12241 :SHA256
   "bb46a0d75ea2c25f7f2d31b44e4fc43b32bfebb6ce18c618f554696b09991aa1")
  (:PATH "raw/coverage-active/fasl/src/foundation/conditions.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/foundation/conditions.fasl")
   :BYTES 6844 :SHA256
   "28ec4b37182ef418a65e39c0984f330ec12af44b3df062d9a10b134418b9fd29")
  (:PATH "raw/coverage-active/fasl/src/foundation/crc32c.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/foundation/crc32c.fasl")
   :BYTES 7402 :SHA256
   "b3872e07fcc0d38e77df25a5617b96d40d9f3c08debdfdd29a7d0f29cf35b6bf")
  (:PATH "raw/coverage-active/fasl/src/foundation/package.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/foundation/package.fasl")
   :BYTES 2192 :SHA256
   "713035ac7f826188cfd50f0658e8de8be6671fa392118fef8e2c15efe1673b1a")
  (:PATH "raw/coverage-active/fasl/src/foundation/record.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/foundation/record.fasl")
   :BYTES 54570 :SHA256
   "bf3bfb6b5ec9740aaf3e638e00c69e9a1b3fb71ef99b4f12ee28c9059078c0ac")
  (:PATH "raw/coverage-active/fasl/src/get-directory/build.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/get-directory/build.fasl")
   :BYTES 9751 :SHA256
   "fe901b1491bbbdf01fc287ea3dda89f17ef116ab2c037df2a24a9606e5eb91ca")
  (:PATH "raw/coverage-active/fasl/src/get-directory/package.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/get-directory/package.fasl")
   :BYTES 1640 :SHA256
   "2b5842b4652cc1d1ce27f087d62918743a567aa9828584fa7fe9a86415435ddc")
  (:PATH "raw/coverage-active/fasl/src/get-directory/read.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/get-directory/read.fasl")
   :BYTES 9941 :SHA256
   "efe67201b8e18ff3292bbaef2a3df8fda3e0d02dd6d7b10274e57479f48a74fa")
  (:PATH "raw/coverage-active/fasl/src/get-directory/types.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/get-directory/types.fasl")
   :BYTES 7847 :SHA256
   "58475c24956aa2b77dbd5cc5d202d32d734c10aee71fe7e6ee56bc1e181f8b7e")
  (:PATH "raw/coverage-active/fasl/src/get-resolver/active-build.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/get-resolver/active-build.fasl")
   :BYTES 21180 :SHA256
   "44485ae541371e2be8b01e90d732f895b05cf6817e925e15932510e5289566d1")
  (:PATH "raw/coverage-active/fasl/src/get-resolver/active-directory.fasl"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/get-resolver/active-directory.fasl")
   :BYTES 11091 :SHA256
   "86df3c6f63232debaadd4e23fd34edf94d54bc1e18e870fea2bda2b0b4a2228e")
  (:PATH "raw/coverage-active/fasl/src/get-resolver/active-preflight.fasl"
   :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/get-resolver/active-preflight.fasl")
   :BYTES 13751 :SHA256
   "68052f023c5ecc0384cff13ebf4bee0674be2b2b84dd5e19811f652471712209")
  (:PATH "raw/coverage-active/fasl/src/get-resolver/active-read.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/get-resolver/active-read.fasl")
   :BYTES 7256 :SHA256
   "cd64d8c28866a9ccd13b4e54578850c02bc3c1fc5ad68f7832f81044e05a5ec0")
  (:PATH "raw/coverage-active/fasl/src/get-resolver/active-scan.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/get-resolver/active-scan.fasl")
   :BYTES 14250 :SHA256
   "9914dea222004ba38fdad1ab74d46923e3ead56866abc32b9b35143067ca417f")
  (:PATH "raw/coverage-active/fasl/src/get-resolver/active-types.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/get-resolver/active-types.fasl")
   :BYTES 19493 :SHA256
   "1ad1031806c370dc6087a549f93231a96e97e20c203519db91fce736ea8f24b9")
  (:PATH "raw/coverage-active/fasl/src/get-resolver/build.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/get-resolver/build.fasl")
   :BYTES 17043 :SHA256
   "dadf84d9a1cf8673741be8400a4b41fdcbfeec8e39520f95ce471a6171da51bb")
  (:PATH "raw/coverage-active/fasl/src/get-resolver/package.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/get-resolver/package.fasl")
   :BYTES 2628 :SHA256
   "cb1701f21dbc054584a87a6d2099412e3abfe4a81be029a66576a7f551d32d6d")
  (:PATH "raw/coverage-active/fasl/src/get-resolver/read.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/get-resolver/read.fasl")
   :BYTES 16780 :SHA256
   "f1a74c0104d81378ca023e46819e2788a884d371ded90eed70ea751b791e9a35")
  (:PATH "raw/coverage-active/fasl/src/get-resolver/rows.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/get-resolver/rows.fasl")
   :BYTES 9421 :SHA256
   "dd9395fc2c0cc5e6a50785d46573f393d7ed48e85f42a67b33f13b3e9ecf8442")
  (:PATH "raw/coverage-active/fasl/src/get-resolver/scan.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/get-resolver/scan.fasl")
   :BYTES 18231 :SHA256
   "bf03da298902f023d335737f4097be4c1a20ffa96b14b83cb9917c12f36eea71")
  (:PATH "raw/coverage-active/fasl/src/get-resolver/sort.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/get-resolver/sort.fasl")
   :BYTES 18737 :SHA256
   "29ffa9e5963cc0e6d78c9c8f33b3cf38acd579bbee201f9241ee5b85b4c9cd68")
  (:PATH "raw/coverage-active/fasl/src/get-resolver/types.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/get-resolver/types.fasl")
   :BYTES 8446 :SHA256
   "10151c4335d8ccf36980cd47e39d5dc3179329292736ee1caa21ed1e19e1de5b")
  (:PATH "raw/coverage-active/fasl/src/get/build.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/get/build.fasl")
   :BYTES 10165 :SHA256
   "aa4400af687ecc5a2cd2534cf0b5f7997d06daff1f1a9c129686969ae5205e7d")
  (:PATH "raw/coverage-active/fasl/src/get/lifecycle.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/get/lifecycle.fasl")
   :BYTES 13462 :SHA256
   "31723066c81681cf2b6d19a50a62ec9c7e913dca97d9f4ee2b06c9276d005677")
  (:PATH "raw/coverage-active/fasl/src/get/lookup.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/get/lookup.fasl")
   :BYTES 16882 :SHA256
   "9bd67cdd9cd7eb6478717447ff6808c40a7b4946ae04a715513944754c4f89e0")
  (:PATH "raw/coverage-active/fasl/src/get/package.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/get/package.fasl")
   :BYTES 2220 :SHA256
   "192a1d4a10d00e644b3ee1cfb13b19e7a9fb9944acc61350bcc2adfe18a8a8e4")
  (:PATH "raw/coverage-active/fasl/src/get/segment.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/get/segment.fasl")
   :BYTES 18538 :SHA256
   "801ba258f5aa76120bed382ab335fceac993bf53fa2e4c0645402b74fbe0f059")
  (:PATH "raw/coverage-active/fasl/src/get/target.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/get/target.fasl")
   :BYTES 13163 :SHA256
   "ffbdcb16eaeb2da0cd9daf960b3a2242a97b14777c996ac86580a7fc35309dd3")
  (:PATH "raw/coverage-active/fasl/src/get/types.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/get/types.fasl")
   :BYTES 34985 :SHA256
   "ba09e2f6262fd83b9fd92553cf89aa40d72e01815a1d20480c6ac27b53c0890d")
  (:PATH "raw/coverage-active/fasl/src/hash/arithmetic.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/hash/arithmetic.fasl")
   :BYTES 9931 :SHA256
   "f256856e76ecc8cb3840ca7863dc58d14054c96657fd49c9e4a4bd42b3073254")
  (:PATH "raw/coverage-active/fasl/src/hash/blocks.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/hash/blocks.fasl")
   :BYTES 13043 :SHA256
   "dd369d74637a18b32f003bfe328eeb79444e59707785f34a1210b2e20f478306")
  (:PATH "raw/coverage-active/fasl/src/hash/hash64.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/hash/hash64.fasl")
   :BYTES 9053 :SHA256
   "dd3af81890e947d6adfaf99b6f365ab23a44e2ac1ab6acc6d35a1de9e582fc18")
  (:PATH "raw/coverage-active/fasl/src/hash/package.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/hash/package.fasl")
   :BYTES 1005 :SHA256
   "dfc461483213952863b94ec6e8535fb2442ab37db585d15562d01601b1ca0632")
  (:PATH "raw/coverage-active/fasl/src/index/core.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/index/core.fasl")
   :BYTES 8100 :SHA256
   "09ca259b4a16b74f62d5ea3fb6b7329797dd31de206235a1b3b19a4f4f173210")
  (:PATH "raw/coverage-active/fasl/src/index/hash-digests.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/index/hash-digests.fasl")
   :BYTES 9770 :SHA256
   "a8fe7971edd1b2e229af0cd702d6830b707bcbc798111e05cc26f9579f2b7b1c")
  (:PATH "raw/coverage-active/fasl/src/index/hash-seed.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/index/hash-seed.fasl")
   :BYTES 6515 :SHA256
   "89bc4b7779e688474b73c38f437fa2f0d3af97bba6018d786cbc73fcec1c783e")
  (:PATH "raw/coverage-active/fasl/src/index/package.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/index/package.fasl")
   :BYTES 1200 :SHA256
   "f63acc4134e0c02a47e0c730c53d728d2f89250eccd9d93ed1440f81e54acc18")
  (:PATH "raw/coverage-active/fasl/src/index/primary-arena.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/index/primary-arena.fasl")
   :BYTES 10767 :SHA256
   "f5e2636c850442b8fba8fe6c338a7a05a50bc6c81087169b17dad4ac1ecd4405")
  (:PATH "raw/coverage-active/fasl/src/index/primary-build.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/index/primary-build.fasl")
   :BYTES 16297 :SHA256
   "e2444cee491bd6fc66aac6d15c5881683d055cc2b6aa325ef9b5cb29b569a1bb")
  (:PATH "raw/coverage-active/fasl/src/index/primary-core.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/index/primary-core.fasl")
   :BYTES 11773 :SHA256
   "12737477dc4441803176ae4eb04c7930d558de34bd83630912fda0880c43bab1")
  (:PATH "raw/coverage-active/fasl/src/index/primary-directory.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/index/primary-directory.fasl")
   :BYTES 22878 :SHA256
   "93e324a5c2a8d41c47dcfec32f1fa1358bdb0ceee299e6ae372f441ed61db553")
  (:PATH "raw/coverage-active/fasl/src/index/primary-package.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/index/primary-package.fasl")
   :BYTES 1775 :SHA256
   "a5572e64ced43239450fac7c1ac942d5e470c7e9a34c19dc8fe0c267fe24fd62")
  (:PATH "raw/coverage-active/fasl/src/index/primary-probe.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/index/primary-probe.fasl")
   :BYTES 22102 :SHA256
   "cb41ea6baaccd5318d6a0e5d521a3433b35cfe984e2fac5669328c91f1c538b5")
  (:PATH "raw/coverage-active/fasl/src/index/primary-read.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/index/primary-read.fasl")
   :BYTES 11410 :SHA256
   "a78283cbbcd46739d0c7535820ab46055895451e31be5960a8ed19b87d960a2f")
  (:PATH "raw/coverage-active/fasl/src/index/primary-relocate.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/index/primary-relocate.fasl")
   :BYTES 15955 :SHA256
   "044b319ef954368f66320bd8fef9d5b3445e04df0934353ac8dc27cd6c0d2087")
  (:PATH "raw/coverage-active/fasl/src/index/primary-types.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/index/primary-types.fasl")
   :BYTES 41278 :SHA256
   "bd028ee5cc195a3983f9cd5a1301071d3752ee6b85392f096cd7e089aab50fe8")
  (:PATH "raw/coverage-active/fasl/src/index/primary-write.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/index/primary-write.fasl")
   :BYTES 23969 :SHA256
   "326ff5c1176bbb0abd763f898fe3eda5e64b648abf5d900a6331359eda218729")
  (:PATH "raw/coverage-active/fasl/src/index/read.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/index/read.fasl")
   :BYTES 11147 :SHA256
   "31d71ddfa1f5f2e5a13363fb7de3729760e9973cae3a9f1b647b19099c23d66a")
  (:PATH "raw/coverage-active/fasl/src/index/rebuild-budget.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/index/rebuild-budget.fasl")
   :BYTES 10026 :SHA256
   "071b5f881336f1fb3192b9d7d810cfa1f52172aca9a02519ab714b466a04931b")
  (:PATH "raw/coverage-active/fasl/src/index/rebuild-copy.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/index/rebuild-copy.fasl")
   :BYTES 12322 :SHA256
   "b9fd3f0e1b4b34615df12723324d0348c3b464715d644affbc6bb6564176c8f8")
  (:PATH "raw/coverage-active/fasl/src/index/rebuild-scan.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/index/rebuild-scan.fasl")
   :BYTES 18809 :SHA256
   "4f3d771aa9e33fc471022e3f406ea4911c0a947f1d9ed1dfbadd269c72735677")
  (:PATH "raw/coverage-active/fasl/src/index/rebuild.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/index/rebuild.fasl")
   :BYTES 6300 :SHA256
   "f1bd1286786cf1fda61096c3c2da794066a843071d719e828ad3290c95597cf8")
  (:PATH "raw/coverage-active/fasl/src/index/relocate.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/index/relocate.fasl")
   :BYTES 11589 :SHA256
   "9a87a5c95cc5c93757a5c907a291a8f76e499beefe9a57d1dd50e782e5181d37")
  (:PATH "raw/coverage-active/fasl/src/index/types.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/index/types.fasl")
   :BYTES 12014 :SHA256
   "8c8f49470280ba772907ef7b39c4d6160da446750df697c6abda666e4fa4c889")
  (:PATH "raw/coverage-active/fasl/src/index/validation.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/index/validation.fasl")
   :BYTES 13510 :SHA256
   "ab965436ee81246d42adff4f556b35bbdd0725a2dcdb184bbedd1203d1f2b310")
  (:PATH "raw/coverage-active/fasl/src/index/write.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/index/write.fasl")
   :BYTES 20655 :SHA256
   "414be7a9f8fc75de971cac72f16dcff66d59e3c7d8c54ccd8c3bb30511447e5d")
  (:PATH "raw/coverage-active/fasl/src/io/flush.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/io/flush.fasl")
   :BYTES 4970 :SHA256
   "7379577f9949c36f9702d71876c4d2119bf99151acac791768376425352cd31b")
  (:PATH "raw/coverage-active/fasl/src/io/identity-types.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/io/identity-types.fasl")
   :BYTES 4891 :SHA256
   "a917d143afc6980cdebbd7a355531da57be0dfe57ea5529099a74d2a24b479a2")
  (:PATH "raw/coverage-active/fasl/src/io/identity.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/io/identity.fasl")
   :BYTES 8957 :SHA256
   "42a3c83aa5e0d0db944bcf4a1e9dcff572994d295b8b889c83f18df9e01aef7c")
  (:PATH "raw/coverage-active/fasl/src/io/lifecycle.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/io/lifecycle.fasl")
   :BYTES 15002 :SHA256
   "2872ad100092c26d7af5d8787a4959c4fa018a739e371fc0343c381e1ae37f15")
  (:PATH "raw/coverage-active/fasl/src/io/native.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/io/native.fasl")
   :BYTES 26780 :SHA256
   "f65cd06008476148bc9e799e9d7027d7fb7fd692748e5d6da4fbc445497902ea")
  (:PATH "raw/coverage-active/fasl/src/io/package.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/io/package.fasl")
   :BYTES 1291 :SHA256
   "ce6a31e367c98cb6220d97d0468da62636cd53ccd2f19c18777714bd04cc96d5")
  (:PATH "raw/coverage-active/fasl/src/io/transfer.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/io/transfer.fasl")
   :BYTES 18897 :SHA256
   "62b1de9590b556393d31ffb872dd730e84ca70bf5afe98820fd2ef76d3245897")
  (:PATH "raw/coverage-active/fasl/src/io/types.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/io/types.fasl")
   :BYTES 25429 :SHA256
   "c184200136e136dd473f3260d64767630b5877858d85f43c81a88980c10c1e95")
  (:PATH "raw/coverage-active/fasl/src/mvcc/package.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/mvcc/package.fasl")
   :BYTES 1368 :SHA256
   "278fb149a611453f9853a29cf82b4914833c01ae24da3b6c1d604ae2b5c4389d")
  (:PATH "raw/coverage-active/fasl/src/mvcc/snapshots-core.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/mvcc/snapshots-core.fasl")
   :BYTES 18568 :SHA256
   "a9e3804a4fe46a38b06d942b2b23b009be79b37641740b192ebe9a61006ff110")
  (:PATH "raw/coverage-active/fasl/src/mvcc/snapshots-csn.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/mvcc/snapshots-csn.fasl")
   :BYTES 8064 :SHA256
   "3cc0a2ecc964f238458495e9cc92a53ee1e57b9749e24f4ebe05a707f5216267")
  (:PATH "raw/coverage-active/fasl/src/mvcc/snapshots-lifecycle.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/mvcc/snapshots-lifecycle.fasl")
   :BYTES 16947 :SHA256
   "5eb513eda41c21be774093823c82fddf7a68ab68a9ffa267f073a7a63c65d6f9")
  (:PATH "raw/coverage-active/fasl/src/mvcc/snapshots-read.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/mvcc/snapshots-read.fasl")
   :BYTES 19648 :SHA256
   "4cde8606883db615011b1ce86ce461e525c032566e8bcfb21c18844ee1215f4f")
  (:PATH "raw/coverage-active/fasl/src/mvcc/snapshots-register.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/mvcc/snapshots-register.fasl")
   :BYTES 15820 :SHA256
   "c7eb77053c0d0f018c79a54a409dc2b1479de02ccfb49f45268b1f59125e7f45")
  (:PATH "raw/coverage-active/fasl/src/mvcc/snapshots-types.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/mvcc/snapshots-types.fasl")
   :BYTES 25802 :SHA256
   "756becea380a21477664ef421cfc1692abf616f0877fe1dd087bc5a3a74a99cd")
  (:PATH "raw/coverage-active/fasl/src/mvcc/types.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/mvcc/types.fasl")
   :BYTES 1556 :SHA256
   "0f650217378dab31fb1bf277cbdc387ff91621da1ea4f98af2ea822b0c837df0")
  (:PATH "raw/coverage-active/fasl/src/package.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/package.fasl")
   :BYTES 1506 :SHA256
   "5dd6427804fdd31ff3b7627464030e6e560bc2ce2404516a7f5345d5bf2cdc33")
  (:PATH "raw/coverage-active/fasl/src/read/core.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/read/core.fasl")
   :BYTES 10006 :SHA256
   "7a1f3e2991b311a7a0cad6d2744edc6832f7f6ece71fcd9cfdb93b122df91761")
  (:PATH "raw/coverage-active/fasl/src/read/package.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/read/package.fasl")
   :BYTES 1260 :SHA256
   "935fceb457fe89bc2a187add285df753c8c2d71dac1703796c571790138d815b")
  (:PATH "raw/coverage-active/fasl/src/read/task.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/read/task.fasl")
   :BYTES 20683 :SHA256
   "88f0f9b53c73da449d16e7a595d8fef18a125609e995a3b85f3900d5949b0a32")
  (:PATH "raw/coverage-active/fasl/src/read/types.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/read/types.fasl")
   :BYTES 11221 :SHA256
   "118dadc5a1ca34c99dea81bafc98940ae7813155c8950d260a72d6b1c8578524")
  (:PATH "raw/coverage-active/fasl/src/recovery/decisions-build.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/recovery/decisions-build.fasl")
   :BYTES 29768 :SHA256
   "ddbfb82653c409b92b4a3fdf3f9402c5be8704cababc67f43ddb0fcb8ba45c65")
  (:PATH "raw/coverage-active/fasl/src/recovery/decisions-package.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/recovery/decisions-package.fasl")
   :BYTES 1359 :SHA256
   "fc9a24da85fe7d6ac720c0495930eba726284f5695cb34a1816590ed17342721")
  (:PATH "raw/coverage-active/fasl/src/recovery/decisions-query.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/recovery/decisions-query.fasl")
   :BYTES 11760 :SHA256
   "e03b344071841c1e83f7363e34b2fa335752b8e6cd5370504caac97665ce8214")
  (:PATH "raw/coverage-active/fasl/src/recovery/decisions-radix.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/recovery/decisions-radix.fasl")
   :BYTES 25773 :SHA256
   "a37b6e5fb20dddd13fa2e5bd0afce314744c4e48f3094439ee5d417a5baa40f9")
  (:PATH "raw/coverage-active/fasl/src/recovery/decisions-sort.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/recovery/decisions-sort.fasl")
   :BYTES 24537 :SHA256
   "6463c8cc7137b9a50b059c2d268d220801070a1e608fc4d78f812729cf9264a1")
  (:PATH "raw/coverage-active/fasl/src/recovery/decisions-types.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/recovery/decisions-types.fasl")
   :BYTES 12713 :SHA256
   "acf366a843dc52d5fcb408b22354943017bf9573e6550f1e4b650de57bb56c8b")
  (:PATH "raw/coverage-active/fasl/src/recovery/inventory-build.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/recovery/inventory-build.fasl")
   :BYTES 24706 :SHA256
   "2443a77131a58dce7ebdbf4bfe4b525a867f8d3e9a4d283c92b754fac5f33565")
  (:PATH "raw/coverage-active/fasl/src/recovery/inventory-query.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/recovery/inventory-query.fasl")
   :BYTES 4614 :SHA256
   "917a7dbb3c388ededa8615c007f7b1cd292bd14f069f287a81796df8f9d56810")
  (:PATH "raw/coverage-active/fasl/src/recovery/inventory-types.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/recovery/inventory-types.fasl")
   :BYTES 16471 :SHA256
   "512a7b51875df842391ec02149ccc7c346efd72317604dd8193cae9dd70d8d8f")
  (:PATH "raw/coverage-active/fasl/src/recovery/manifest-build.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/recovery/manifest-build.fasl")
   :BYTES 25786 :SHA256
   "bcc1f42ad8a3c3b8d4798cd84affef64e26f8bc60fc0988faa8715d2b9c328a3")
  (:PATH "raw/coverage-active/fasl/src/recovery/manifest-decode.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/recovery/manifest-decode.fasl")
   :BYTES 17424 :SHA256
   "f52bd1f1c694e9c2f069ff440a2fbe85a7cefeff9ebf1c4e63dcf5d80b5b2c9e")
  (:PATH "raw/coverage-active/fasl/src/recovery/manifest-fold.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/recovery/manifest-fold.fasl")
   :BYTES 22647 :SHA256
   "c114c7b344d69287f824dfbe13889fbc6cc4cbfed3e6b4b0f08efe8025b5b05e")
  (:PATH "raw/coverage-active/fasl/src/recovery/manifest-package.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/recovery/manifest-package.fasl")
   :BYTES 1796 :SHA256
   "ba1b73a024af4e14d5be2829c7dd5e5b35ca8c53ad4292f8c0ed3d61ac87a585")
  (:PATH "raw/coverage-active/fasl/src/recovery/manifest-query.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/recovery/manifest-query.fasl")
   :BYTES 8590 :SHA256
   "f8306adb8abb980319a7878a64303aaf6b1c10439126bcb3bff45482e037e018")
  (:PATH "raw/coverage-active/fasl/src/recovery/manifest-types.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/recovery/manifest-types.fasl")
   :BYTES 34319 :SHA256
   "60bb343d277d91435a60883b0d9c0d0f53db6cade223aea7b1b20b00ee4168c4")
  (:PATH "raw/coverage-active/fasl/src/recovery/package.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/recovery/package.fasl")
   :BYTES 1402 :SHA256
   "11c578bb6542ac4f027cd0b731d072c7597f337ba2866c20e7881e7911a901e4")
  (:PATH "raw/coverage-active/fasl/src/recovery/scan.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/recovery/scan.fasl")
   :BYTES 37048 :SHA256
   "bbd2f2a756989abf5b7c8c55fdff12c7f2c9e7247342718a651ae02181abfaef")
  (:PATH "raw/coverage-active/fasl/src/scheduler/build.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/scheduler/build.fasl")
   :BYTES 5658 :SHA256
   "a6ac7f0fcbda4f7568b9343827e25b88c7fa0c901fa8b3dee44606cdc32b3392")
  (:PATH "raw/coverage-active/fasl/src/scheduler/package.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/scheduler/package.fasl")
   :BYTES 1005 :SHA256
   "eeb5993dab692a6d82399d36d6438321fc219d8721d8039a75822918633fbd8c")
  (:PATH "raw/coverage-active/fasl/src/scheduler/policy.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/scheduler/policy.fasl")
   :BYTES 6991 :SHA256
   "712467421e47f3f0442dabce1454f16c748ae13df13d547139153b4363276eca")
  (:PATH "raw/coverage-active/fasl/src/scheduler/read.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/scheduler/read.fasl")
   :BYTES 4561 :SHA256
   "dc87104fb22206ab3192dabdcec43a5718247ab828efbc2242f5494e8a262530")
  (:PATH "raw/coverage-active/fasl/src/scheduler/types.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/scheduler/types.fasl")
   :BYTES 18695 :SHA256
   "2b1fcbbb47334a0fd0f62aeb3b4a8cc9f3e3e48eab349c86e7ccb685833ee7e8")
  (:PATH "raw/coverage-active/fasl/src/scheduler/update.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/scheduler/update.fasl")
   :BYTES 7171 :SHA256
   "7e0f501ab2c28a10bf0dbe8869a5da84d5ab93cca30dcf4658e19c1e0902b3fa")
  (:PATH "raw/coverage-active/fasl/src/series/events.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/series/events.fasl")
   :BYTES 26107 :SHA256
   "9566b198317915a8a82f11e8e5805d9e42f4542b5a82d564625d83a0102fab05")
  (:PATH "raw/coverage-active/fasl/src/series/io-events.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/series/io-events.fasl")
   :BYTES 13857 :SHA256
   "d59a21024d3ed40aa8c8429a987ee0399a8bc416140269671271b239f3476ef2")
  (:PATH "raw/coverage-active/fasl/src/series/ownership.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/series/ownership.fasl")
   :BYTES 21428 :SHA256
   "43b732749bfb9eb8a186f93f0f347d2186ab789abbbfb603a57644008835b568")
  (:PATH "raw/coverage-active/fasl/src/series/package.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/series/package.fasl")
   :BYTES 1782 :SHA256
   "66c90415b98c23d417a651dd6f1a1714786ceb53949c6df31c6236cb9111fad1")
  (:PATH "raw/coverage-active/fasl/src/series/publication.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/series/publication.fasl")
   :BYTES 16564 :SHA256
   "2a49655001a14138ccc32343364696a6ab87d971b43aae297744129ca070f752")
  (:PATH "raw/coverage-active/fasl/src/series/query.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/series/query.fasl")
   :BYTES 8527 :SHA256
   "2687e8940aeaab108ac53df5b46c682af1654e9756e7495e46b1a7182c0c78d7")
  (:PATH "raw/coverage-active/fasl/src/series/retirement.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/series/retirement.fasl")
   :BYTES 12380 :SHA256
   "a02f9c3fe217ab04f0367f9b9e1db31b720bad6e5872735dd41374058ef55e01")
  (:PATH "raw/coverage-active/fasl/src/series/routing-build.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/series/routing-build.fasl")
   :BYTES 9634 :SHA256
   "0e0d32e0f9fa8fd529429c7b4b01dec9130b274af0260f80f50725b80b9a975b")
  (:PATH "raw/coverage-active/fasl/src/series/routing-select.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/series/routing-select.fasl")
   :BYTES 9547 :SHA256
   "f429f002823ab34b55cc77396b8412fdddf530514d3a04a880d0f942b8ad348c")
  (:PATH "raw/coverage-active/fasl/src/series/routing-types.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/series/routing-types.fasl")
   :BYTES 10818 :SHA256
   "2121d10a66aa627a307d5522d676ddcf328caf7d88e4d06bca7d6d0b79b98d07")
  (:PATH "raw/coverage-active/fasl/src/series/types.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/series/types.fasl")
   :BYTES 39234 :SHA256
   "06afeb26d44d56ef4314f236465a9d661ff2b0b2dd7ad30a2ae1f3d47720ae70")
  (:PATH "raw/coverage-active/fasl/src/series/worker-boundary.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/series/worker-boundary.fasl")
   :BYTES 10481 :SHA256
   "68c32ab4ca891577ba01ac5e5e68015eec74cd5acbf4955d837213d457829cd8")
  (:PATH "raw/coverage-active/fasl/src/series/worker-package.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/series/worker-package.fasl")
   :BYTES 1651 :SHA256
   "b6c3164c3684535fd8904ae948b628924ee73f6a33a225ee2c096d4ef185bfb5")
  (:PATH "raw/coverage-active/fasl/src/series/worker-run.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/series/worker-run.fasl")
   :BYTES 19687 :SHA256
   "bc91b32e627a2ca14218b7391566d832fbe3bd3f6203e2f9e3143d8eaa5e3859")
  (:PATH "raw/coverage-active/fasl/src/series/worker-types.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/series/worker-types.fasl")
   :BYTES 22524 :SHA256
   "3b7bd2fca6c59dcf0c3ec2c4861839511ed6408c0d92468602f0074446f584e0")
  (:PATH "raw/coverage-active/fasl/src/storage/compaction-scan.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/storage/compaction-scan.fasl")
   :BYTES 13810 :SHA256
   "0969c8244e63dbfd225a73220a476fad7e930a70c8365907d49731e9e5ddfe1e")
  (:PATH "raw/coverage-active/fasl/src/storage/control-payload.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/storage/control-payload.fasl")
   :BYTES 18199 :SHA256
   "89812e61dceac65539e7caeea79ae3286e560316292d37b84545fe9bee1642c3")
  (:PATH "raw/coverage-active/fasl/src/storage/formats.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/storage/formats.fasl")
   :BYTES 10996 :SHA256
   "25ef7ba186e646c0df6d2b268e4466f4e054b9f937f6ef455fa8bb33d6c6f772")
  (:PATH "raw/coverage-active/fasl/src/storage/log-header.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/storage/log-header.fasl")
   :BYTES 12800 :SHA256
   "11ccda7c32da8dae1a9c682c5e98c1eccf225a2bb5ad4d3d105bcb29bcfcd5af")
  (:PATH "raw/coverage-active/fasl/src/storage/package.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/storage/package.fasl")
   :BYTES 1560 :SHA256
   "7ec78b4af53be47d25a667e60dab28f33d24a7d35ca1da6a75bbdce1bd3415df")
  (:PATH "raw/coverage-active/fasl/src/storage/payload-record.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/storage/payload-record.fasl")
   :BYTES 8774 :SHA256
   "277ef3c69de62b68d5f4fac24ccabd42dbe4e436bdc276b375b750bf508bba0a")
  (:PATH "raw/coverage-active/fasl/src/storage/payload-write.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/storage/payload-write.fasl")
   :BYTES 14879 :SHA256
   "dcc62487f7f3cb5fa0e9f44026bc6c52ffb5782b3b802310bdf82d409b2c5f51")
  (:PATH "raw/coverage-active/fasl/src/storage/segment-header.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/storage/segment-header.fasl")
   :BYTES 16854 :SHA256
   "ee51d4986634e41393e096562b13451562c1d422aece26dd647bc11075f2ab37")
  (:PATH "raw/coverage-active/fasl/src/wal/builder.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/wal/builder.fasl")
   :BYTES 22929 :SHA256
   "7c9d4d36196dd8cb4fbc220b5e2fb07417ffc11939cca5308bfa2fe245917f8a")
  (:PATH "raw/coverage-active/fasl/src/wal/csn.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/wal/csn.fasl")
   :BYTES 24001 :SHA256
   "dc5ff2a7a227d6fabb56a55c50d78d45ea42a2cc48a5cec9d0197cc5b8e065d3")
  (:PATH "raw/coverage-active/fasl/src/wal/executor.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/wal/executor.fasl")
   :BYTES 19765 :SHA256
   "78d04488c87c54aea965648fcd2d24a7a061920a3bd60cbc07ea85e01307121e")
  (:PATH "raw/coverage-active/fasl/src/wal/group.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/wal/group.fasl")
   :BYTES 17866 :SHA256
   "e15271914463769bb64ad9fa409ee154d014fbcf6a8d5ebc675a1e74f705bb34")
  (:PATH "raw/coverage-active/fasl/src/wal/package.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/wal/package.fasl")
   :BYTES 2185 :SHA256
   "fb7e83fd86427ba6843a4677a1e182cc212a518825599bfe37b4e7de8e6d6cd3")
  (:PATH "raw/coverage-active/fasl/src/wal/types.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/src/wal/types.fasl")
   :BYTES 46360 :SHA256
   "920400f910964f2c091983670f28eb0dcd9e06e5c75e299187ac5f8a20bdc452")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-float-write-support.fasl"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/codec/cbor-float-write-support.fasl")
   :BYTES 64978 :SHA256
   "d44232bdf280fef3f8954d92cdbb86669c53d9d65972a218a9c0281087880935")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-float-write-threads.fasl"
   :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/codec/cbor-float-write-threads.fasl")
   :BYTES 17916 :SHA256
   "dba6d65c83db93636f174bf71b01ac515c1295b825a9a9a3428da2ac8526a72a")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-float-write.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/codec/cbor-float-write.fasl")
   :BYTES 93347 :SHA256
   "3892db212b4c6ef42fe85dcbb1cdf0ade37062c341d5276352e5fc5aa0fd78ba")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-header.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/codec/cbor-header.fasl")
   :BYTES 50938 :SHA256
   "5edd0360ab0033f844487fc2d359faf2eb282bcb671c75433ac3157e7514ebbe")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-minimal-edges.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/codec/cbor-minimal-edges.fasl")
   :BYTES 6378 :SHA256
   "6832fbfdd1da2d69d2047d4102fe753f8947d2a5d5dcd53273149b327e52627c")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-minimal-scan-support.fasl"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/codec/cbor-minimal-scan-support.fasl")
   :BYTES 55144 :SHA256
   "14703a248468cb720c1a13cdf91d92074227fbd04c9890197afa736fbe197b97")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-minimal-scan-threads.fasl"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/codec/cbor-minimal-scan-threads.fasl")
   :BYTES 21282 :SHA256
   "77f605db341974253d8cd5c9d21dc0f37deebaf48364b721c79552e668bb5ba2")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-minimal-scan.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/codec/cbor-minimal-scan.fasl")
   :BYTES 76660 :SHA256
   "58680bd682c0d02b2187a315dbc2666a963eefcd95fe241a24148a0cf5ecfba5")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-minimal-support.fasl"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/codec/cbor-minimal-support.fasl")
   :BYTES 54136 :SHA256
   "8a38027ab862bbec16b9c36a567c0f4b0ca74a3505d89f91f552bea5340e0091")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-minimal-threads.fasl"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/codec/cbor-minimal-threads.fasl")
   :BYTES 18095 :SHA256
   "3646192801b921890a50495c013cde7dc824eb044931aa9bb68e3dee676b8e4c")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-minimal.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/codec/cbor-minimal.fasl")
   :BYTES 55770 :SHA256
   "cdbd9013b12af697e30cf76298838de7ec49ba8c288b1ad96f40085fb399b4bc")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-simple-write-support.fasl"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/codec/cbor-simple-write-support.fasl")
   :BYTES 31083 :SHA256
   "a84293fafb30fd5a77c4af6a54f14dda66be659cef525ffcfdf263983cfda02e")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-simple-write-threads.fasl"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/codec/cbor-simple-write-threads.fasl")
   :BYTES 17996 :SHA256
   "599f0101557138275c91dee63d3f1b1d28fb91ea70a17893944034fca6046a04")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-simple-write.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/codec/cbor-simple-write.fasl")
   :BYTES 52718 :SHA256
   "26289384ca3ca5bbee69ee1a879a65a290d1a31ab526f59cb423f1211b131de7")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-string-write-support.fasl"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/codec/cbor-string-write-support.fasl")
   :BYTES 37652 :SHA256
   "975d5670dfdc3abd1090e58792876c3b317400b582d624f8acb67ca9713aa090")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-string-write-threads.fasl"
   :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/codec/cbor-string-write-threads.fasl")
   :BYTES 17607 :SHA256
   "fdfd47b42533e71f7f8e5abc3e79228c95abf53677eddbf53028c8114ee81c47")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-string-write.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/codec/cbor-string-write.fasl")
   :BYTES 67520 :SHA256
   "73444db06f3bad7229de7af66690f17db9092c66d19e6c4ce1aa002ca1dfbb20")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-structure-support.fasl"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/codec/cbor-structure-support.fasl")
   :BYTES 71328 :SHA256
   "f858bb57c4bd1caa6cae60507725bb43f2cdbb0ec72eaa787cae7cf6d4979726")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-structure-threads.fasl"
   :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/codec/cbor-structure-threads.fasl")
   :BYTES 21615 :SHA256
   "af58663ec23dd034c039c6308ede79d93b08b7c8cc8a6b114051bac84b43a116")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-structure.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/codec/cbor-structure.fasl")
   :BYTES 93261 :SHA256
   "2f455f35855c72af281cdb488499a3a0ac34692c8079314cb2347b71652840e1")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-support.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/codec/cbor-support.fasl")
   :BYTES 39010 :SHA256
   "01706cb22e88344632b9cef866313a6d681cff201f3e06d1e6ae908730a772d4")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-threads.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/codec/cbor-threads.fasl")
   :BYTES 17903 :SHA256
   "9600324e0abc3bad04c27c3d0d49b0a141bc1ba6b9959133929f79d5ffa13af6")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-write-roundtrip.fasl"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/codec/cbor-write-roundtrip.fasl")
   :BYTES 5215 :SHA256
   "5db6f19d3d2b36d274dde6b4d6317c6ec27d1ae4f996222301e7a68cfb8f3a5f")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-write-support.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/codec/cbor-write-support.fasl")
   :BYTES 27513 :SHA256
   "0bb345fa6aaa4a6a9f760e4cdccd528bb061263ecfb8f5a4962d4622ffc18a6e")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-write-threads.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/codec/cbor-write-threads.fasl")
   :BYTES 17875 :SHA256
   "ec1b4929d9a6553af76d7def078fe985630135fd1f8896660854821f058bcd86")
  (:PATH "raw/coverage-active/fasl/tests/codec/cbor-write.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/codec/cbor-write.fasl")
   :BYTES 43606 :SHA256
   "b6d84ed8e2e4ba026a91af4a15ab018d69d6cf3bd3313439e64f1245da721535")
  (:PATH "raw/coverage-active/fasl/tests/codec/support.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/codec/support.fasl")
   :BYTES 35217 :SHA256
   "6bb420a333c425daee3adb8dd57a696041224bf1aca5d4402d41002ca5c0c956")
  (:PATH "raw/coverage-active/fasl/tests/codec/threads.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/codec/threads.fasl")
   :BYTES 15057 :SHA256
   "776f3cd9332b1695b01fff23c9857764ff15e9ab1c314896045e2b12f9c5e39c")
  (:PATH "raw/coverage-active/fasl/tests/codec/utf8.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/codec/utf8.fasl")
   :BYTES 59045 :SHA256
   "c29d0623b22faf04b50c77a1528b4843f55adfc23d44e9b9cd18c654dc2f4de9")
  (:PATH "raw/coverage-active/fasl/tests/csn/registry.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/csn/registry.fasl")
   :BYTES 109831 :SHA256
   "ed9b7664bc46301126f021d0b4d1d4739bc34bdbcf027ac837c50013b0001977")
  (:PATH "raw/coverage-active/fasl/tests/csn/support.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/csn/support.fasl")
   :BYTES 78030 :SHA256
   "fe3132d3f9a682bef8de98cfeec67d429f2e43167d7e04d4e56b8cf7c079d357")
  (:PATH "raw/coverage-active/fasl/tests/csn/threads.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/csn/threads.fasl")
   :BYTES 49399 :SHA256
   "1abcf50cef82298d4b3c7ad77085829a65b8ca5fd674602fa07d5ab0acadb00b")
  (:PATH "raw/coverage-active/fasl/tests/epochs/lifecycle.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/epochs/lifecycle.fasl")
   :BYTES 188394 :SHA256
   "392b74c158941407c3950d406d983a086302077011981cb3454e49c0b729ac32")
  (:PATH "raw/coverage-active/fasl/tests/epochs/support.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/epochs/support.fasl")
   :BYTES 43367 :SHA256
   "15288cd4a829775c4277373a015fa1224643947279d3d56749beba38d72f41a2")
  (:PATH "raw/coverage-active/fasl/tests/epochs/threads.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/epochs/threads.fasl")
   :BYTES 23190 :SHA256
   "b4a5bf93c069b39e512da68c5dca333fa0cd23c55ab75e2d33cfdce31ea88cf5")
  (:PATH "raw/coverage-active/fasl/tests/execution/handoff.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/execution/handoff.fasl")
   :BYTES 196934 :SHA256
   "3ed27c4954556f3c11896a7109410e121b9bd354b2a2feaffb1e7e206a5304e8")
  (:PATH "raw/coverage-active/fasl/tests/execution/queue.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/execution/queue.fasl")
   :BYTES 85792 :SHA256
   "ec9406201f011aaca52fb0216f9f0007c802bfaef5ebd6cf1dd312175947f176")
  (:PATH "raw/coverage-active/fasl/tests/execution/ready-recycle.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/execution/ready-recycle.fasl")
   :BYTES 156696 :SHA256
   "27ca780c8f916ecd1d91dece7f106002f053e85cab8ad4cd5bc7ba675010a50e")
  (:PATH "raw/coverage-active/fasl/tests/execution/ready.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/execution/ready.fasl")
   :BYTES 191336 :SHA256
   "615e284b8201e6691d8377fa06e69c9dd96a5c918ddba61141d1c8a35ca0953f")
  (:PATH "raw/coverage-active/fasl/tests/execution/support.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/execution/support.fasl")
   :BYTES 29613 :SHA256
   "02e77a81b8008ca4ab38f13707a7fcda287136238cb4dbc2306afa7691f752e0")
  (:PATH "raw/coverage-active/fasl/tests/execution/threads.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/execution/threads.fasl")
   :BYTES 65490 :SHA256
   "50b59a955ca9607393afd6d7501175a920e0d4b9cde62681085c56f19b99019d")
  (:PATH "raw/coverage-active/fasl/tests/execution/worker.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/execution/worker.fasl")
   :BYTES 354774 :SHA256
   "97a2770e8e771df436028f0cdc95cb1799a2e63d4eb20ac0a6f67483cbfea5d4")
  (:PATH "raw/coverage-active/fasl/tests/foundation/batch.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/foundation/batch.fasl")
   :BYTES 43976 :SHA256
   "a881f0ea14cec72972cfeee87f15760ba63d51aa144a4a4c45111a91ec0d83da")
  (:PATH "raw/coverage-active/fasl/tests/foundation/binary.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/foundation/binary.fasl")
   :BYTES 32090 :SHA256
   "a0b9a490d21dd90f23122567d3cb07b5d812b95f28b64fe23ef5740a164a74da")
  (:PATH "raw/coverage-active/fasl/tests/foundation/record.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/foundation/record.fasl")
   :BYTES 129723 :SHA256
   "372f81f6522e07e398fb800a861e59e927580b4d3ea0fc3cb88ef9a7510e6b82")
  (:PATH "raw/coverage-active/fasl/tests/foundation/support.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/foundation/support.fasl")
   :BYTES 17116 :SHA256
   "77220dccbafd9ab03c7c4338c5ba8404037bc69d32494b17b0053efdf6199d8f")
  (:PATH "raw/coverage-active/fasl/tests/get-active/construction.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/get-active/construction.fasl")
   :BYTES 107509 :SHA256
   "f78492547fd5907563bac6eb91ddf8a17d1bb7c14e527e7a42bf351d2e4eaf6a")
  (:PATH "raw/coverage-active/fasl/tests/get-active/directory.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/get-active/directory.fasl")
   :BYTES 39448 :SHA256
   "967206ef94911cad79a01f08b3cd87850ef9d2c36e8e95175f9730d865362eb5")
  (:PATH "raw/coverage-active/fasl/tests/get-active/read.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/get-active/read.fasl")
   :BYTES 144900 :SHA256
   "26d6b9444dc0f8d527eec7def27d1884276e1e2c02a2b67e7a05a00811acca80")
  (:PATH "raw/coverage-active/fasl/tests/get-active/support.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/get-active/support.fasl")
   :BYTES 224442 :SHA256
   "ab82dd68719182e2f28fe34b8dd83bc2bfe8d90d497eac6ff39035dce63aee1d")
  (:PATH "raw/coverage-active/fasl/tests/get-directory/construction.fasl"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/get-directory/construction.fasl")
   :BYTES 82974 :SHA256
   "04382b2f899459bb8ca605eb5a54f04043771b57f4296e388f90e1b9d5a7f461")
  (:PATH "raw/coverage-active/fasl/tests/get-directory/read.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/get-directory/read.fasl")
   :BYTES 159079 :SHA256
   "28a5286d154bdee0d139a5db03d0e249d05b9398931c2e3ff29169abfecdb0d2")
  (:PATH "raw/coverage-active/fasl/tests/get-directory/support.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/get-directory/support.fasl")
   :BYTES 163539 :SHA256
   "a12c35e646ec16dde17e4d91e8c6b6908dc025ff3c21ff5100d470abc07e5faa")
  (:PATH "raw/coverage-active/fasl/tests/get-directory/threads.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/get-directory/threads.fasl")
   :BYTES 31621 :SHA256
   "e3bf988290961242204c49d905532bc32ff1b0af5c5d78b540909d34fdc6a108")
  (:PATH "raw/coverage-active/fasl/tests/get-performance/guards.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/get-performance/guards.fasl")
   :BYTES 41792 :SHA256
   "820e99e49312e9e9990a6c727dfdc2905c71bffe9db36fff8a3a4d2bd789fc10")
  (:PATH "raw/coverage-active/fasl/tests/get-performance/paths.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/get-performance/paths.fasl")
   :BYTES 32738 :SHA256
   "47bc83e6155b950e85f2e43c362e7b57de6460493ec1cc6aeced4f9ea01d64d2")
  (:PATH "raw/coverage-active/fasl/tests/get-performance/support.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/get-performance/support.fasl")
   :BYTES 142381 :SHA256
   "17d98b76da8aeee9e5043a8c9fde575b5361dd2da88113ebf0aae7bfdb10ba7e")
  (:PATH "raw/coverage-active/fasl/tests/get-performance/threads.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/get-performance/threads.fasl")
   :BYTES 21169 :SHA256
   "5cbb7f00bee3c08571b0caeb6fe1d754582095cab66ac82ff63c53fe2e4c006a")
  (:PATH "raw/coverage-active/fasl/tests/get-resolver/construction.fasl"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/get-resolver/construction.fasl")
   :BYTES 75578 :SHA256
   "f858531386c5ca41b81343f91a03aead431c77462344cda8704f9f67de4d7ee5")
  (:PATH "raw/coverage-active/fasl/tests/get-resolver/read.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/get-resolver/read.fasl")
   :BYTES 157207 :SHA256
   "d674fed5859df1c8b4843b6e3ab9f29b3b9afdff4fd4ba50319731673df2f6a9")
  (:PATH "raw/coverage-active/fasl/tests/get-resolver/sort.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/get-resolver/sort.fasl")
   :BYTES 39433 :SHA256
   "636fe31c6efbe09243bc2648c119eea51e71d2797984dcbf4190f234fe713d9f")
  (:PATH "raw/coverage-active/fasl/tests/get-resolver/support.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/get-resolver/support.fasl")
   :BYTES 163594 :SHA256
   "4dfce5aba036d68a95781e08918e6735806ff237f6418105443802b429874e09")
  (:PATH "raw/coverage-active/fasl/tests/get/lifecycle.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/get/lifecycle.fasl")
   :BYTES 181796 :SHA256
   "28d11afd158ebb5e45f6b521cd0047fa8c9aa414d49402eeee2901a917c89522")
  (:PATH "raw/coverage-active/fasl/tests/get/segment.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/get/segment.fasl")
   :BYTES 131222 :SHA256
   "1eec8798e7271970b57ab5f1752201c6fb66a3a0af8f955f72bea82a144a0d8e")
  (:PATH "raw/coverage-active/fasl/tests/get/support.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/get/support.fasl")
   :BYTES 106882 :SHA256
   "2ae3bb52542ab90abe25defbe3da2e2cc7175faa19c675f6dafd54a3e824b0c9")
  (:PATH "raw/coverage-active/fasl/tests/hash/guards.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/hash/guards.fasl")
   :BYTES 8311 :SHA256
   "e702174ae680d9b4acd3e481e476b443d7ab1aa6df02f475a30653b07a32cac5")
  (:PATH "raw/coverage-active/fasl/tests/hash/hash64.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/hash/hash64.fasl")
   :BYTES 82838 :SHA256
   "6d03f8cf8a111982ae31877983c3449f987759697446eeeca92a4ddf26997e6e")
  (:PATH "raw/coverage-active/fasl/tests/hash/support.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/hash/support.fasl")
   :BYTES 60595 :SHA256
   "fe368dc7a33278b35914d05c6603d30e16361181001052ec2284a7b825ce26ec")
  (:PATH "raw/coverage-active/fasl/tests/hash/threads.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/hash/threads.fasl")
   :BYTES 32525 :SHA256
   "f10852f117c756bfd98b0d1f06762b879013f177327c3183e00332f917e8122a")
  (:PATH "raw/coverage-active/fasl/tests/index/hash-digests.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/index/hash-digests.fasl")
   :BYTES 202728 :SHA256
   "67a1580bf7a119503e42110bb4c579e42521c7c5e541f5299e711a54f97f9e9e")
  (:PATH "raw/coverage-active/fasl/tests/index/primary-support.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/index/primary-support.fasl")
   :BYTES 66479 :SHA256
   "3c0057875896c0c1af4c793cc8131cae2659340af753f9885d5bdab147a55eac")
  (:PATH "raw/coverage-active/fasl/tests/index/primary-threads.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/index/primary-threads.fasl")
   :BYTES 72505 :SHA256
   "5795171fc8cac9097e399cf322e2fe3f763c425863d272f857a2d13aabe849ee")
  (:PATH "raw/coverage-active/fasl/tests/index/primary.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/index/primary.fasl")
   :BYTES 193996 :SHA256
   "dcfc209a99a3f59a6020127858c76d35705816ce80e9e4a2563417d431a21d19")
  (:PATH "raw/coverage-active/fasl/tests/index/rebuild.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/index/rebuild.fasl")
   :BYTES 183035 :SHA256
   "7815b4eb419d82ef0657b0500988fc285beb8a89c774ce170da74ec1bc9e2b94")
  (:PATH "raw/coverage-active/fasl/tests/index/slot-support.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/index/slot-support.fasl")
   :BYTES 62583 :SHA256
   "239cfb9ab9ad4ba731847ec5e4391997c5f5295214b737e9bb30f42ef440f3af")
  (:PATH "raw/coverage-active/fasl/tests/index/slot-threads.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/index/slot-threads.fasl")
   :BYTES 69703 :SHA256
   "d1de0710c79637fc864ece924e2841f2b5d1ff179340463b0d5db24fa9a984fe")
  (:PATH "raw/coverage-active/fasl/tests/index/slots.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/index/slots.fasl")
   :BYTES 194630 :SHA256
   "37f3c5112348636055f634deacfb151d21ab1daba796a3e38c5e8c85dcf8385d")
  (:PATH "raw/coverage-active/fasl/tests/io/native.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/io/native.fasl")
   :BYTES 65701 :SHA256
   "ef47859ec5600147020d87cf3081dbeba2b86d0f803f2dd9b6695906d4f7d8d3")
  (:PATH "raw/coverage-active/fasl/tests/io/support.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/io/support.fasl")
   :BYTES 23466 :SHA256
   "df24c455510e632931cfb11eee459df6b6eeac510a9e24de234d1e7ca64ef0c5")
  (:PATH "raw/coverage-active/fasl/tests/io/transfer.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/io/transfer.fasl")
   :BYTES 114057 :SHA256
   "aee09789c4919baafe4f4bee9ba5fabece482cc64418f835a95c1e3940df8a65")
  (:PATH "raw/coverage-active/fasl/tests/mvcc/capture.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/mvcc/capture.fasl")
   :BYTES 112446 :SHA256
   "099b40936c4e1336938508aa119dcc5fd7560b660d254fe10230096981c7cb75")
  (:PATH "raw/coverage-active/fasl/tests/mvcc/lifecycle.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/mvcc/lifecycle.fasl")
   :BYTES 222610 :SHA256
   "143f9da0be7d6d9af4fd8ff383b4ce4376fb5f284bfa85917b56a2f08381d424")
  (:PATH "raw/coverage-active/fasl/tests/mvcc/support.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/mvcc/support.fasl")
   :BYTES 46354 :SHA256
   "356369a48cf3e7d6c67f611d8f6e2924bc431ab1c7735788f298a85a08d946d6")
  (:PATH "raw/coverage-active/fasl/tests/read/lifecycle.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/read/lifecycle.fasl")
   :BYTES 286956 :SHA256
   "11e8d2fd94dc4a4f53780e755aa51d37f25bebf7236444b9f287a876114f07d8")
  (:PATH "raw/coverage-active/fasl/tests/read/support.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/read/support.fasl")
   :BYTES 41729 :SHA256
   "e7952ae3162a449edcbe86f7a6fc23aa95d4205d3099612bd75b9e27e0fd8b1d")
  (:PATH "raw/coverage-active/fasl/tests/read/threads.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/read/threads.fasl")
   :BYTES 39201 :SHA256
   "d9afe7fa2aac2f08701f62b828f06e42a9ab13b99f6d2ddba0e5b0dabba7f451")
  (:PATH "raw/coverage-active/fasl/tests/recovery/corruption.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/recovery/corruption.fasl")
   :BYTES 35296 :SHA256
   "1eaa0fdc85943c2a1338e9b37b9df2a28b4f874ffbd3050cc195d24945652f18")
  (:PATH "raw/coverage-active/fasl/tests/recovery/decisions-audit.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/recovery/decisions-audit.fasl")
   :BYTES 75400 :SHA256
   "96e9b5959715d4b42b5a8557146f0af9277a8588189e6a21261bcec5ab45da0d")
  (:PATH "raw/coverage-active/fasl/tests/recovery/decisions-radix.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/recovery/decisions-radix.fasl")
   :BYTES 146471 :SHA256
   "48a5daf540ebcbc6d1619748922eb87a89687ac08511cbd263329b4cff123508")
  (:PATH "raw/coverage-active/fasl/tests/recovery/decisions-support.fasl"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/recovery/decisions-support.fasl")
   :BYTES 35954 :SHA256
   "4deea54c3ca1935660d1f15b0ff5897e4cec617744cac0424804a0b830f921c7")
  (:PATH "raw/coverage-active/fasl/tests/recovery/decisions.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/recovery/decisions.fasl")
   :BYTES 117733 :SHA256
   "b3e00fdc74cc7d7fe46238522ef5b16a552f37ce42db8394b00495830e723725")
  (:PATH "raw/coverage-active/fasl/tests/recovery/inventory-support.fasl"
   :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/recovery/inventory-support.fasl")
   :BYTES 42482 :SHA256
   "6f13045a6c92d50bcb439357ca796c79f8b4f8b883c1ad789c69cffe84814f9c")
  (:PATH "raw/coverage-active/fasl/tests/recovery/inventory.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/recovery/inventory.fasl")
   :BYTES 78882 :SHA256
   "28d5caf4e0f78e359dd794aca78f0c2e57a2e45c7e65342670ff5ca869b88117")
  (:PATH "raw/coverage-active/fasl/tests/recovery/manifest-audit.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/recovery/manifest-audit.fasl")
   :BYTES 96391 :SHA256
   "ce961a76d2fae9bbb754d5344375a915ed4c4995347149e81fc93aef0d7c7f0b")
  (:PATH "raw/coverage-active/fasl/tests/recovery/manifest-support.fasl"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/recovery/manifest-support.fasl")
   :BYTES 54502 :SHA256
   "b19c17e00d149f2598beef8b6eacf98af804a9a5ece93db02bbd86dc6905f7fb")
  (:PATH "raw/coverage-active/fasl/tests/recovery/manifest.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/recovery/manifest.fasl")
   :BYTES 71118 :SHA256
   "23f5e2b7eae53ee5e66810d103f13feb4e482b9913773f85596db619411b8875")
  (:PATH "raw/coverage-active/fasl/tests/recovery/scan.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/recovery/scan.fasl")
   :BYTES 108284 :SHA256
   "66c35fed19ab7fe6d706b8d6d747300561528c5f3e72aaecc8c8e778a24b499e")
  (:PATH "raw/coverage-active/fasl/tests/recovery/support.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/recovery/support.fasl")
   :BYTES 34717 :SHA256
   "51a9536c69393762489b3f20ab49b989683b5aaafa5f5322d2913014e9b41423")
  (:PATH "raw/coverage-active/fasl/tests/scheduler/controller.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/scheduler/controller.fasl")
   :BYTES 108269 :SHA256
   "2c11839b351124d7c6af1114b9c6211417d0a61944b1ae9d2ea0894655ee4849")
  (:PATH "raw/coverage-active/fasl/tests/scheduler/support.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/scheduler/support.fasl")
   :BYTES 19475 :SHA256
   "a91db0fb41e4a3191b139b8a86a5a8ab1853b88774c5c324d61ad23102469814")
  (:PATH "raw/coverage-active/fasl/tests/series/boundaries.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/series/boundaries.fasl")
   :BYTES 26474 :SHA256
   "f7b741d9f9a1025014f899ae8e20c4f90cf9f0db6da7f80f2509a65cc4b9b5a5")
  (:PATH "raw/coverage-active/fasl/tests/series/controller.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/series/controller.fasl")
   :BYTES 304532 :SHA256
   "b019acd7b784b50a09e6af7e9c688570009cb25918bb57478c8fd84b3a42a37a")
  (:PATH "raw/coverage-active/fasl/tests/series/support.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/series/support.fasl")
   :BYTES 119669 :SHA256
   "ca1dd2ef91a23fc00bad7c364d9ab1eb44d7d092aaf3640cca2b6c43c62e7c44")
  (:PATH "raw/coverage-active/fasl/tests/series/threads.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/series/threads.fasl")
   :BYTES 89541 :SHA256
   "54809d7d3f9454a4f67ae8e38b940dd3bd9ce6b95654f4bfbca996548eafcf79")
  (:PATH "raw/coverage-active/fasl/tests/series/worker-bridge.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/series/worker-bridge.fasl")
   :BYTES 280763 :SHA256
   "f6559b756e7dddae2a4b249b995b2698d83e145a8c3b8e68ee38734951bf837e")
  (:PATH "raw/coverage-active/fasl/tests/series/worker-routing.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/series/worker-routing.fasl")
   :BYTES 156731 :SHA256
   "47997647920003918ccad6b8e3a979c99d57961d264bc8e180d8539b057492e5")
  (:PATH "raw/coverage-active/fasl/tests/smoke.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/smoke.fasl")
   :BYTES 4861 :SHA256
   "d35699a65dd09f42c95711b65e7792da1738b5e12554bb753eed92f16f2e3632")
  (:PATH "raw/coverage-active/fasl/tests/storage/compaction-scan.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/storage/compaction-scan.fasl")
   :BYTES 80090 :SHA256
   "7beeaa3edf2cb9644ccdf4375e7e9f30ec2a272e0a153709863ba85c5f0ec650")
  (:PATH "raw/coverage-active/fasl/tests/storage/control-payload.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/storage/control-payload.fasl")
   :BYTES 123129 :SHA256
   "eef79c0def71e82f0e86d58d7ea93c45220edb2edb9fa92adde62922cab386f3")
  (:PATH "raw/coverage-active/fasl/tests/storage/log-header.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/storage/log-header.fasl")
   :BYTES 79474 :SHA256
   "06f17bd6f457885c33413ddcfaa8aa2aa86b02bd37c76bffe3565f592448cc1a")
  (:PATH "raw/coverage-active/fasl/tests/storage/segment-header.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/storage/segment-header.fasl")
   :BYTES 38957 :SHA256
   "a6402cb95e4a76930028363df5997a7a7dcd0366f987a2459d02c28d5a8f87a7")
  (:PATH "raw/coverage-active/fasl/tests/storage/support.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/storage/support.fasl")
   :BYTES 28179 :SHA256
   "c25b94066f47842ac7ac90b425510ba99403daef45338b614c57c2e16eb37f3e")
  (:PATH "raw/coverage-active/fasl/tests/wal/builder.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/wal/builder.fasl")
   :BYTES 39778 :SHA256
   "245285cb8bb701e1566c2e80a860604a1086ae27322cd9833c5195f9f9090fad")
  (:PATH "raw/coverage-active/fasl/tests/wal/csn-threads.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/wal/csn-threads.fasl")
   :BYTES 65565 :SHA256
   "093e95dff36bc30ca8c46897a5d8024de9b5987dc784e9d6df91cdc38f8662ff")
  (:PATH "raw/coverage-active/fasl/tests/wal/csn.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/wal/csn.fasl")
   :BYTES 220505 :SHA256
   "652303d89ff1140f624c04b803f8281d59eb0b55046d646dab8853b6efaf0688")
  (:PATH "raw/coverage-active/fasl/tests/wal/fault.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/wal/fault.fasl")
   :BYTES 65703 :SHA256
   "c09237699547b2523e41cda61f26b38f1fd61bb9687c87f97cbdff1ae1e3e060")
  (:PATH "raw/coverage-active/fasl/tests/wal/group.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/wal/group.fasl")
   :BYTES 57957 :SHA256
   "05625e0261f8f011ce3c8d21273e1a10e629e818fe4e953fdf71860783ceaf3b")
  (:PATH "raw/coverage-active/fasl/tests/wal/native.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/wal/native.fasl")
   :BYTES 21738 :SHA256
   "b2491e79c485548df16abc04ae87e714ac9b062f1dc0d358c7775c4634e720b0")
  (:PATH "raw/coverage-active/fasl/tests/wal/support.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-active-coverage-R1/fasl/tests/wal/support.fasl")
   :BYTES 14758 :SHA256
   "b1fff2f9d587ed0e7ea06ef0e376e7f06f9f7718114154c8bb219046fca46c4d")
  (:PATH "raw/coverage-closed-command/conservazione.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910524-command-10398-0/conservazione.lisp")
   :BYTES 1174 :SHA256
   "6f663fb374103afd37c6ccc05d812e97252204979ac5c3e55ee140a51022726d")
  (:PATH "raw/coverage-closed-command/report.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910524-command-10398-0/report.lisp")
   :BYTES 163102 :SHA256
   "445201075f1ea7db55ab6ad546d004cffc4ff2b51fb614d6b10d7039f1f9c543")
  (:PATH "raw/coverage-closed/04076e76b4fc5fcdc5195e10e258c570.html" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/04076e76b4fc5fcdc5195e10e258c570.html")
   :BYTES 19906 :SHA256
   "42cdb208c49785dc921aa1b9a8e41c4328dd4254808fe06d52071ae760af5ba9")
  (:PATH "raw/coverage-closed/0a1abb78426f9259ec99d9abbe21d585.html" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/0a1abb78426f9259ec99d9abbe21d585.html")
   :BYTES 14105 :SHA256
   "ad97fb3a8749efe676a5e1ec03196feeccfe15a3164ad6171e5bfd625f215dca")
  (:PATH "raw/coverage-closed/283c01a024edc3bc6aa60e3b1eb9e449.html" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/283c01a024edc3bc6aa60e3b1eb9e449.html")
   :BYTES 11588 :SHA256
   "927d68a0988e3bb9c7d682720237e55e6151232ddaf4f0e8834da570321fa9e9")
  (:PATH "raw/coverage-closed/29832b57535925a6c0d439d5a18f74a4.html" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/29832b57535925a6c0d439d5a18f74a4.html")
   :BYTES 39375 :SHA256
   "8150be446e496e78a03b049df481e9ac893350c95acf1bc1d58568462858629e")
  (:PATH "raw/coverage-closed/4fcd0cc179ab6313179f4126aa0d485d.html" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/4fcd0cc179ab6313179f4126aa0d485d.html")
   :BYTES 40521 :SHA256
   "943b1a67882c12d1a3e3a1c498f73da40fbfcd03827fce201af67f96364ab788")
  (:PATH "raw/coverage-closed/944feee8becbdd964e85cb1317756b6b.html" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/944feee8becbdd964e85cb1317756b6b.html")
   :BYTES 42630 :SHA256
   "9e76133a8652972a926f4733063518cc2453fae4141d197d75c4b94c4d572ae6")
  (:PATH "raw/coverage-closed/cover-index.html" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/cover-index.html")
   :BYTES 2848 :SHA256
   "390ca381caa15f371be378764e78584402ad44aa5fed81ebba8dd98ffb822965")
  (:PATH "raw/coverage-closed/coverage-state.lisp.gz" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/coverage-state.lisp")
   :BYTES 308995 :SHA256
   "dd379685b26102cda9a2b37ba60c2388f406200740e673f969121578a5834bd0" :CODEC
   :GZIP :UNCOMPRESSED-BYTES 2168965 :UNCOMPRESSED-SHA256
   "9037e5a04b6a2d6b35b1669f831c4cf3b34650531fb884d4c3d03adf5a935535")
  (:PATH "raw/coverage-closed/coverage-summary.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/coverage-summary.lisp")
   :BYTES 2760 :SHA256
   "ef2d0ff26e936785b551422065db8f476eaadc0839c3ce1959625bd0145b90c3")
  (:PATH "raw/coverage-closed/d3ed8ff50cf16d6694367e6ac196f2f4.html" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/d3ed8ff50cf16d6694367e6ac196f2f4.html")
   :BYTES 36763 :SHA256
   "35aa944186df62f32a3e80f3391768a745c32ceaaee473e201896f67322e291b")
  (:PATH "raw/coverage-closed/fasl/src/cache/build.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/cache/build.fasl")
   :BYTES 14453 :SHA256
   "b1554ca19481eb4cb80f45283504ae23246c93f3f3891d5b8e75186b3b640b8a")
  (:PATH "raw/coverage-closed/fasl/src/cache/clock.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/cache/clock.fasl")
   :BYTES 7952 :SHA256
   "823a205c6cef95b01fe7209ab267438f21858e326934f26e7c0284c11467c02b")
  (:PATH "raw/coverage-closed/fasl/src/cache/core.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/cache/core.fasl")
   :BYTES 10955 :SHA256
   "0a039d3aa2f7f7c3d8bdf6df83261de0b46057eaad1a007fbdb784b06c403a8e")
  (:PATH "raw/coverage-closed/fasl/src/cache/package.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/cache/package.fasl")
   :BYTES 1228 :SHA256
   "4f1feb8fc4243b7bfcecf6919df8ef2242abb1b58315e2b3eefc0ad0819db47c")
  (:PATH "raw/coverage-closed/fasl/src/cache/read.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/cache/read.fasl")
   :BYTES 18380 :SHA256
   "de79874d5891d913c0ae1106876e350235bf10297b526a5cfb06c1f71d9a80cb")
  (:PATH "raw/coverage-closed/fasl/src/cache/types.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/cache/types.fasl")
   :BYTES 20972 :SHA256
   "9b36af2ae2a729057dfcdfc420741fa9ccb017f187cd371226dd21fed2ff3c11")
  (:PATH "raw/coverage-closed/fasl/src/cache/write.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/cache/write.fasl")
   :BYTES 14808 :SHA256
   "7ca7db3ed02def2d261a43be6d7f826c6617451f78ae9de828d1d3b0746041b1")
  (:PATH "raw/coverage-closed/fasl/src/codec/cbor-float-minimal.fasl" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/codec/cbor-float-minimal.fasl")
   :BYTES 8603 :SHA256
   "7fcd93b27fa2c5bde281b7153546c70814a97de3ee3a62dd001a3d8156473ced")
  (:PATH "raw/coverage-closed/fasl/src/codec/cbor-float-narrow.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/codec/cbor-float-narrow.fasl")
   :BYTES 10237 :SHA256
   "40bc5b1877079ab2bcda09c1a867126084c9900b069c7017207fa94e541393c4")
  (:PATH "raw/coverage-closed/fasl/src/codec/cbor-float-write.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/codec/cbor-float-write.fasl")
   :BYTES 12246 :SHA256
   "a304ddbba94d3f3d574d137070cb0f57b603fe10fe0bdb897189a81566ef2055")
  (:PATH "raw/coverage-closed/fasl/src/codec/cbor-header.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/codec/cbor-header.fasl")
   :BYTES 13886 :SHA256
   "fca55a66112f2ca4565936d2398c896577d25428ab220d950347a66b450ec264")
  (:PATH "raw/coverage-closed/fasl/src/codec/cbor-minimal.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/codec/cbor-minimal.fasl")
   :BYTES 10154 :SHA256
   "a4e8060e9712434ce6dacd06032c60c9e8c208d9d50f0228c77622dec6ffbae8")
  (:PATH "raw/coverage-closed/fasl/src/codec/cbor-package.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/codec/cbor-package.fasl")
   :BYTES 1229 :SHA256
   "7404028d593441c0f7d14c77dfa68dbad080aa1007319b8134b74695772bc1b9")
  (:PATH "raw/coverage-closed/fasl/src/codec/cbor-scan-input.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/codec/cbor-scan-input.fasl")
   :BYTES 5858 :SHA256
   "d660521f9eca689a953f210f25efd7a5c46820dd267f54b8a27d2239169c7e72")
  (:PATH "raw/coverage-closed/fasl/src/codec/cbor-scan-items.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/codec/cbor-scan-items.fasl")
   :BYTES 19506 :SHA256
   "adac638705a5ac7d97c7a99ed68cb7610fcf32cb81ee76c80bb33e9705e0eaa6")
  (:PATH "raw/coverage-closed/fasl/src/codec/cbor-scan-minimal.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/codec/cbor-scan-minimal.fasl")
   :BYTES 3208 :SHA256
   "f8005a1a7086683a38d55ae1565c3721585277a9cb7d3ee3ea0e8fe814ccc06f")
  (:PATH "raw/coverage-closed/fasl/src/codec/cbor-scan-stack.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/codec/cbor-scan-stack.fasl")
   :BYTES 14669 :SHA256
   "5289bd1e0989aa8c80abb7c617c89f90de611fcf8f9d091c2af5054496e09b49")
  (:PATH "raw/coverage-closed/fasl/src/codec/cbor-scan.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/codec/cbor-scan.fasl")
   :BYTES 13424 :SHA256
   "451d33e222c38c1f31daa03ae98acf654883e446f00bc1003190e710088e27f0")
  (:PATH "raw/coverage-closed/fasl/src/codec/cbor-simple-write.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/codec/cbor-simple-write.fasl")
   :BYTES 6709 :SHA256
   "653dd78cef7090c4afbca8da7395f08975962d0a3fe7ee893bc8634674f7f79b")
  (:PATH "raw/coverage-closed/fasl/src/codec/cbor-space.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/codec/cbor-space.fasl")
   :BYTES 14701 :SHA256
   "45ffdbdc4b372226711519e0e28eaa3f483273040f942ed86d53798a5c1a70ae")
  (:PATH "raw/coverage-closed/fasl/src/codec/cbor-string-write.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/codec/cbor-string-write.fasl")
   :BYTES 17300 :SHA256
   "1f9f478f6b62a7250f18d758ed0d33deb793631daa3974bc2365eb4492676313")
  (:PATH "raw/coverage-closed/fasl/src/codec/cbor-write.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/codec/cbor-write.fasl")
   :BYTES 13500 :SHA256
   "259c2bd4df78831b8551a9178583c7087edd8f887d60bfb4966c8a7bebb5327b")
  (:PATH "raw/coverage-closed/fasl/src/codec/package.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/codec/package.fasl")
   :BYTES 997 :SHA256
   "904316e7c0c740beec7ac675fe0db4eb5f92114854118f098e3b71397b421151")
  (:PATH "raw/coverage-closed/fasl/src/codec/utf8.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/codec/utf8.fasl")
   :BYTES 16206 :SHA256
   "9d8cce91c6a30cc8370173e98b55653ce25154eeee5f96ff9a745f707db08453")
  (:PATH "raw/coverage-closed/fasl/src/csn/package.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/csn/package.fasl")
   :BYTES 1030 :SHA256
   "43376166e2a88d5bad976813b44d9ae2992f920d327bb9e62e50a6cbf23b4543")
  (:PATH "raw/coverage-closed/fasl/src/csn/registry.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/csn/registry.fasl")
   :BYTES 41581 :SHA256
   "31a2c1706b000f50f59b680473fef0f010246d2dd97824f328aeed62bd24526c")
  (:PATH "raw/coverage-closed/fasl/src/epochs/core.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/epochs/core.fasl")
   :BYTES 15739 :SHA256
   "cf992a1ef3cd318c9c23670c1f05d497deecf0e75590b7111354b40c0bc18ed4")
  (:PATH "raw/coverage-closed/fasl/src/epochs/package.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/epochs/package.fasl")
   :BYTES 1255 :SHA256
   "48e87b29f08ad77ad1fab25bfc76ee37ee5ce0ce3d08367d5521f94990adf721")
  (:PATH "raw/coverage-closed/fasl/src/epochs/read.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/epochs/read.fasl")
   :BYTES 7409 :SHA256
   "c1b388567022e08d9a46368bb49da42caeb7fd72b6d6db7917f2d926bd968c76")
  (:PATH "raw/coverage-closed/fasl/src/epochs/reclaim.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/epochs/reclaim.fasl")
   :BYTES 16045 :SHA256
   "4d13bd469964f99a413bc98f32a8ef872bd06784837b7c581b9e9b2c02f5fc9c")
  (:PATH "raw/coverage-closed/fasl/src/epochs/retire.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/epochs/retire.fasl")
   :BYTES 14474 :SHA256
   "a2b5e77ec0110f50131175b7b7c729611bcc487512fd7bf971a4b727075fb1ad")
  (:PATH "raw/coverage-closed/fasl/src/epochs/types.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/epochs/types.fasl")
   :BYTES 29339 :SHA256
   "c0e74cce6eaac1cc2ab7eab005bb798e490b25566a0793e5bed2a08f8a12db2c")
  (:PATH "raw/coverage-closed/fasl/src/execution/handoff.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/execution/handoff.fasl")
   :BYTES 21401 :SHA256
   "a1b08518835a7c6ec3c6551480b07b18011394887aa8c5f9e4ada64ecaf425c0")
  (:PATH "raw/coverage-closed/fasl/src/execution/package.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/execution/package.fasl")
   :BYTES 1666 :SHA256
   "ad1726b0105d8af3d4179553a3f9c9bbf09568424b72f5d09a5c6e1482024708")
  (:PATH "raw/coverage-closed/fasl/src/execution/queue.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/execution/queue.fasl")
   :BYTES 23891 :SHA256
   "e5c69b2e43e7834b965bc50794ffe6c0096b53408ac1a97c7d5a0371011203eb")
  (:PATH "raw/coverage-closed/fasl/src/execution/ready-recycle.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/execution/ready-recycle.fasl")
   :BYTES 7015 :SHA256
   "1b8d97780e4b6d1cf2985b06a7fdda5cb8646bc82fedf92a310a753961c14410")
  (:PATH "raw/coverage-closed/fasl/src/execution/ready-types.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/execution/ready-types.fasl")
   :BYTES 20711 :SHA256
   "c77bc91a7d5cfbde57a17b2f703d30b13eab70d9d020dc3b9f92ab6d0f9d957e")
  (:PATH "raw/coverage-closed/fasl/src/execution/ready.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/execution/ready.fasl")
   :BYTES 14445 :SHA256
   "9cddbd4c10214bbc9aba4e7d0e2fd9af48d16e5e3ef6007a4d41ea97d05877aa")
  (:PATH "raw/coverage-closed/fasl/src/execution/worker-boundary.fasl" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/execution/worker-boundary.fasl")
   :BYTES 7927 :SHA256
   "97b03274b93bb3640685e7c9a2f81557413c50379aaf839f2a29ce6d676ef313")
  (:PATH "raw/coverage-closed/fasl/src/execution/worker-claim.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/execution/worker-claim.fasl")
   :BYTES 17056 :SHA256
   "3dcd933ff135a9dac6559265f4e694186a18a3c6d9320bc5fc15b7eae7a20f7b")
  (:PATH "raw/coverage-closed/fasl/src/execution/worker-run.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/execution/worker-run.fasl")
   :BYTES 13134 :SHA256
   "75181b5a072266f3dab684c7ef058b37300408e58e921a3e0f9da872e8ad5d03")
  (:PATH "raw/coverage-closed/fasl/src/execution/worker-types.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/execution/worker-types.fasl")
   :BYTES 29019 :SHA256
   "f8a7975d12f5ae77fb1a5553cd466c8ca5ca6459aade114a296b31bf0cb65ed0")
  (:PATH "raw/coverage-closed/fasl/src/execution/writer.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/execution/writer.fasl")
   :BYTES 14985 :SHA256
   "086309fea49d61399986b770184d86ba6cff9741eefefc3fa12b418e0c6140a2")
  (:PATH "raw/coverage-closed/fasl/src/foundation/batch.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/foundation/batch.fasl")
   :BYTES 15595 :SHA256
   "c6665a446fe300cf5d356786c014c4cc22c8ff43816b0d86f179c4f963fa5a53")
  (:PATH "raw/coverage-closed/fasl/src/foundation/binary.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/foundation/binary.fasl")
   :BYTES 12241 :SHA256
   "bb46a0d75ea2c25f7f2d31b44e4fc43b32bfebb6ce18c618f554696b09991aa1")
  (:PATH "raw/coverage-closed/fasl/src/foundation/conditions.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/foundation/conditions.fasl")
   :BYTES 6844 :SHA256
   "28ec4b37182ef418a65e39c0984f330ec12af44b3df062d9a10b134418b9fd29")
  (:PATH "raw/coverage-closed/fasl/src/foundation/crc32c.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/foundation/crc32c.fasl")
   :BYTES 7402 :SHA256
   "b3872e07fcc0d38e77df25a5617b96d40d9f3c08debdfdd29a7d0f29cf35b6bf")
  (:PATH "raw/coverage-closed/fasl/src/foundation/package.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/foundation/package.fasl")
   :BYTES 2192 :SHA256
   "713035ac7f826188cfd50f0658e8de8be6671fa392118fef8e2c15efe1673b1a")
  (:PATH "raw/coverage-closed/fasl/src/foundation/record.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/foundation/record.fasl")
   :BYTES 54570 :SHA256
   "bf3bfb6b5ec9740aaf3e638e00c69e9a1b3fb71ef99b4f12ee28c9059078c0ac")
  (:PATH "raw/coverage-closed/fasl/src/get-directory/build.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/get-directory/build.fasl")
   :BYTES 9751 :SHA256
   "fe901b1491bbbdf01fc287ea3dda89f17ef116ab2c037df2a24a9606e5eb91ca")
  (:PATH "raw/coverage-closed/fasl/src/get-directory/package.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/get-directory/package.fasl")
   :BYTES 1640 :SHA256
   "2b5842b4652cc1d1ce27f087d62918743a567aa9828584fa7fe9a86415435ddc")
  (:PATH "raw/coverage-closed/fasl/src/get-directory/read.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/get-directory/read.fasl")
   :BYTES 9941 :SHA256
   "efe67201b8e18ff3292bbaef2a3df8fda3e0d02dd6d7b10274e57479f48a74fa")
  (:PATH "raw/coverage-closed/fasl/src/get-directory/types.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/get-directory/types.fasl")
   :BYTES 7847 :SHA256
   "58475c24956aa2b77dbd5cc5d202d32d734c10aee71fe7e6ee56bc1e181f8b7e")
  (:PATH "raw/coverage-closed/fasl/src/get-resolver/active-build.fasl" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/get-resolver/active-build.fasl")
   :BYTES 21180 :SHA256
   "44485ae541371e2be8b01e90d732f895b05cf6817e925e15932510e5289566d1")
  (:PATH "raw/coverage-closed/fasl/src/get-resolver/active-directory.fasl"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/get-resolver/active-directory.fasl")
   :BYTES 11091 :SHA256
   "86df3c6f63232debaadd4e23fd34edf94d54bc1e18e870fea2bda2b0b4a2228e")
  (:PATH "raw/coverage-closed/fasl/src/get-resolver/active-preflight.fasl"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/get-resolver/active-preflight.fasl")
   :BYTES 13751 :SHA256
   "68052f023c5ecc0384cff13ebf4bee0674be2b2b84dd5e19811f652471712209")
  (:PATH "raw/coverage-closed/fasl/src/get-resolver/active-read.fasl" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/get-resolver/active-read.fasl")
   :BYTES 7256 :SHA256
   "cd64d8c28866a9ccd13b4e54578850c02bc3c1fc5ad68f7832f81044e05a5ec0")
  (:PATH "raw/coverage-closed/fasl/src/get-resolver/active-scan.fasl" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/get-resolver/active-scan.fasl")
   :BYTES 14250 :SHA256
   "9914dea222004ba38fdad1ab74d46923e3ead56866abc32b9b35143067ca417f")
  (:PATH "raw/coverage-closed/fasl/src/get-resolver/active-types.fasl" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/get-resolver/active-types.fasl")
   :BYTES 19493 :SHA256
   "1ad1031806c370dc6087a549f93231a96e97e20c203519db91fce736ea8f24b9")
  (:PATH "raw/coverage-closed/fasl/src/get-resolver/build.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/get-resolver/build.fasl")
   :BYTES 17043 :SHA256
   "dadf84d9a1cf8673741be8400a4b41fdcbfeec8e39520f95ce471a6171da51bb")
  (:PATH "raw/coverage-closed/fasl/src/get-resolver/package.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/get-resolver/package.fasl")
   :BYTES 2628 :SHA256
   "cb1701f21dbc054584a87a6d2099412e3abfe4a81be029a66576a7f551d32d6d")
  (:PATH "raw/coverage-closed/fasl/src/get-resolver/read.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/get-resolver/read.fasl")
   :BYTES 16780 :SHA256
   "f1a74c0104d81378ca023e46819e2788a884d371ded90eed70ea751b791e9a35")
  (:PATH "raw/coverage-closed/fasl/src/get-resolver/rows.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/get-resolver/rows.fasl")
   :BYTES 9421 :SHA256
   "dd9395fc2c0cc5e6a50785d46573f393d7ed48e85f42a67b33f13b3e9ecf8442")
  (:PATH "raw/coverage-closed/fasl/src/get-resolver/scan.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/get-resolver/scan.fasl")
   :BYTES 18231 :SHA256
   "bf03da298902f023d335737f4097be4c1a20ffa96b14b83cb9917c12f36eea71")
  (:PATH "raw/coverage-closed/fasl/src/get-resolver/sort.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/get-resolver/sort.fasl")
   :BYTES 18737 :SHA256
   "29ffa9e5963cc0e6d78c9c8f33b3cf38acd579bbee201f9241ee5b85b4c9cd68")
  (:PATH "raw/coverage-closed/fasl/src/get-resolver/types.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/get-resolver/types.fasl")
   :BYTES 8446 :SHA256
   "10151c4335d8ccf36980cd47e39d5dc3179329292736ee1caa21ed1e19e1de5b")
  (:PATH "raw/coverage-closed/fasl/src/get/build.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/get/build.fasl")
   :BYTES 10165 :SHA256
   "aa4400af687ecc5a2cd2534cf0b5f7997d06daff1f1a9c129686969ae5205e7d")
  (:PATH "raw/coverage-closed/fasl/src/get/lifecycle.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/get/lifecycle.fasl")
   :BYTES 13462 :SHA256
   "31723066c81681cf2b6d19a50a62ec9c7e913dca97d9f4ee2b06c9276d005677")
  (:PATH "raw/coverage-closed/fasl/src/get/lookup.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/get/lookup.fasl")
   :BYTES 16882 :SHA256
   "9bd67cdd9cd7eb6478717447ff6808c40a7b4946ae04a715513944754c4f89e0")
  (:PATH "raw/coverage-closed/fasl/src/get/package.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/get/package.fasl")
   :BYTES 2220 :SHA256
   "192a1d4a10d00e644b3ee1cfb13b19e7a9fb9944acc61350bcc2adfe18a8a8e4")
  (:PATH "raw/coverage-closed/fasl/src/get/segment.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/get/segment.fasl")
   :BYTES 18538 :SHA256
   "801ba258f5aa76120bed382ab335fceac993bf53fa2e4c0645402b74fbe0f059")
  (:PATH "raw/coverage-closed/fasl/src/get/target.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/get/target.fasl")
   :BYTES 13163 :SHA256
   "ffbdcb16eaeb2da0cd9daf960b3a2242a97b14777c996ac86580a7fc35309dd3")
  (:PATH "raw/coverage-closed/fasl/src/get/types.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/get/types.fasl")
   :BYTES 34985 :SHA256
   "ba09e2f6262fd83b9fd92553cf89aa40d72e01815a1d20480c6ac27b53c0890d")
  (:PATH "raw/coverage-closed/fasl/src/hash/arithmetic.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/hash/arithmetic.fasl")
   :BYTES 9931 :SHA256
   "f256856e76ecc8cb3840ca7863dc58d14054c96657fd49c9e4a4bd42b3073254")
  (:PATH "raw/coverage-closed/fasl/src/hash/blocks.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/hash/blocks.fasl")
   :BYTES 13043 :SHA256
   "dd369d74637a18b32f003bfe328eeb79444e59707785f34a1210b2e20f478306")
  (:PATH "raw/coverage-closed/fasl/src/hash/hash64.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/hash/hash64.fasl")
   :BYTES 9053 :SHA256
   "dd3af81890e947d6adfaf99b6f365ab23a44e2ac1ab6acc6d35a1de9e582fc18")
  (:PATH "raw/coverage-closed/fasl/src/hash/package.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/hash/package.fasl")
   :BYTES 1005 :SHA256
   "dfc461483213952863b94ec6e8535fb2442ab37db585d15562d01601b1ca0632")
  (:PATH "raw/coverage-closed/fasl/src/index/core.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/index/core.fasl")
   :BYTES 8100 :SHA256
   "09ca259b4a16b74f62d5ea3fb6b7329797dd31de206235a1b3b19a4f4f173210")
  (:PATH "raw/coverage-closed/fasl/src/index/hash-digests.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/index/hash-digests.fasl")
   :BYTES 9770 :SHA256
   "a8fe7971edd1b2e229af0cd702d6830b707bcbc798111e05cc26f9579f2b7b1c")
  (:PATH "raw/coverage-closed/fasl/src/index/hash-seed.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/index/hash-seed.fasl")
   :BYTES 6515 :SHA256
   "89bc4b7779e688474b73c38f437fa2f0d3af97bba6018d786cbc73fcec1c783e")
  (:PATH "raw/coverage-closed/fasl/src/index/package.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/index/package.fasl")
   :BYTES 1200 :SHA256
   "f63acc4134e0c02a47e0c730c53d728d2f89250eccd9d93ed1440f81e54acc18")
  (:PATH "raw/coverage-closed/fasl/src/index/primary-arena.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/index/primary-arena.fasl")
   :BYTES 10767 :SHA256
   "f5e2636c850442b8fba8fe6c338a7a05a50bc6c81087169b17dad4ac1ecd4405")
  (:PATH "raw/coverage-closed/fasl/src/index/primary-build.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/index/primary-build.fasl")
   :BYTES 16297 :SHA256
   "e2444cee491bd6fc66aac6d15c5881683d055cc2b6aa325ef9b5cb29b569a1bb")
  (:PATH "raw/coverage-closed/fasl/src/index/primary-core.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/index/primary-core.fasl")
   :BYTES 11773 :SHA256
   "12737477dc4441803176ae4eb04c7930d558de34bd83630912fda0880c43bab1")
  (:PATH "raw/coverage-closed/fasl/src/index/primary-directory.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/index/primary-directory.fasl")
   :BYTES 22878 :SHA256
   "93e324a5c2a8d41c47dcfec32f1fa1358bdb0ceee299e6ae372f441ed61db553")
  (:PATH "raw/coverage-closed/fasl/src/index/primary-package.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/index/primary-package.fasl")
   :BYTES 1775 :SHA256
   "a5572e64ced43239450fac7c1ac942d5e470c7e9a34c19dc8fe0c267fe24fd62")
  (:PATH "raw/coverage-closed/fasl/src/index/primary-probe.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/index/primary-probe.fasl")
   :BYTES 22102 :SHA256
   "cb41ea6baaccd5318d6a0e5d521a3433b35cfe984e2fac5669328c91f1c538b5")
  (:PATH "raw/coverage-closed/fasl/src/index/primary-read.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/index/primary-read.fasl")
   :BYTES 11410 :SHA256
   "a78283cbbcd46739d0c7535820ab46055895451e31be5960a8ed19b87d960a2f")
  (:PATH "raw/coverage-closed/fasl/src/index/primary-relocate.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/index/primary-relocate.fasl")
   :BYTES 15955 :SHA256
   "044b319ef954368f66320bd8fef9d5b3445e04df0934353ac8dc27cd6c0d2087")
  (:PATH "raw/coverage-closed/fasl/src/index/primary-types.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/index/primary-types.fasl")
   :BYTES 41278 :SHA256
   "bd028ee5cc195a3983f9cd5a1301071d3752ee6b85392f096cd7e089aab50fe8")
  (:PATH "raw/coverage-closed/fasl/src/index/primary-write.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/index/primary-write.fasl")
   :BYTES 23969 :SHA256
   "326ff5c1176bbb0abd763f898fe3eda5e64b648abf5d900a6331359eda218729")
  (:PATH "raw/coverage-closed/fasl/src/index/read.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/index/read.fasl")
   :BYTES 11147 :SHA256
   "31d71ddfa1f5f2e5a13363fb7de3729760e9973cae3a9f1b647b19099c23d66a")
  (:PATH "raw/coverage-closed/fasl/src/index/rebuild-budget.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/index/rebuild-budget.fasl")
   :BYTES 10026 :SHA256
   "071b5f881336f1fb3192b9d7d810cfa1f52172aca9a02519ab714b466a04931b")
  (:PATH "raw/coverage-closed/fasl/src/index/rebuild-copy.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/index/rebuild-copy.fasl")
   :BYTES 12322 :SHA256
   "b9fd3f0e1b4b34615df12723324d0348c3b464715d644affbc6bb6564176c8f8")
  (:PATH "raw/coverage-closed/fasl/src/index/rebuild-scan.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/index/rebuild-scan.fasl")
   :BYTES 18809 :SHA256
   "4f3d771aa9e33fc471022e3f406ea4911c0a947f1d9ed1dfbadd269c72735677")
  (:PATH "raw/coverage-closed/fasl/src/index/rebuild.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/index/rebuild.fasl")
   :BYTES 6300 :SHA256
   "f1bd1286786cf1fda61096c3c2da794066a843071d719e828ad3290c95597cf8")
  (:PATH "raw/coverage-closed/fasl/src/index/relocate.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/index/relocate.fasl")
   :BYTES 11589 :SHA256
   "9a87a5c95cc5c93757a5c907a291a8f76e499beefe9a57d1dd50e782e5181d37")
  (:PATH "raw/coverage-closed/fasl/src/index/types.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/index/types.fasl")
   :BYTES 12014 :SHA256
   "8c8f49470280ba772907ef7b39c4d6160da446750df697c6abda666e4fa4c889")
  (:PATH "raw/coverage-closed/fasl/src/index/validation.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/index/validation.fasl")
   :BYTES 13510 :SHA256
   "ab965436ee81246d42adff4f556b35bbdd0725a2dcdb184bbedd1203d1f2b310")
  (:PATH "raw/coverage-closed/fasl/src/index/write.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/index/write.fasl")
   :BYTES 20655 :SHA256
   "414be7a9f8fc75de971cac72f16dcff66d59e3c7d8c54ccd8c3bb30511447e5d")
  (:PATH "raw/coverage-closed/fasl/src/io/flush.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/io/flush.fasl")
   :BYTES 4970 :SHA256
   "7379577f9949c36f9702d71876c4d2119bf99151acac791768376425352cd31b")
  (:PATH "raw/coverage-closed/fasl/src/io/identity-types.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/io/identity-types.fasl")
   :BYTES 4891 :SHA256
   "a917d143afc6980cdebbd7a355531da57be0dfe57ea5529099a74d2a24b479a2")
  (:PATH "raw/coverage-closed/fasl/src/io/identity.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/io/identity.fasl")
   :BYTES 8957 :SHA256
   "42a3c83aa5e0d0db944bcf4a1e9dcff572994d295b8b889c83f18df9e01aef7c")
  (:PATH "raw/coverage-closed/fasl/src/io/lifecycle.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/io/lifecycle.fasl")
   :BYTES 15002 :SHA256
   "2872ad100092c26d7af5d8787a4959c4fa018a739e371fc0343c381e1ae37f15")
  (:PATH "raw/coverage-closed/fasl/src/io/native.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/io/native.fasl")
   :BYTES 26780 :SHA256
   "f65cd06008476148bc9e799e9d7027d7fb7fd692748e5d6da4fbc445497902ea")
  (:PATH "raw/coverage-closed/fasl/src/io/package.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/io/package.fasl")
   :BYTES 1291 :SHA256
   "ce6a31e367c98cb6220d97d0468da62636cd53ccd2f19c18777714bd04cc96d5")
  (:PATH "raw/coverage-closed/fasl/src/io/transfer.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/io/transfer.fasl")
   :BYTES 18897 :SHA256
   "62b1de9590b556393d31ffb872dd730e84ca70bf5afe98820fd2ef76d3245897")
  (:PATH "raw/coverage-closed/fasl/src/io/types.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/io/types.fasl")
   :BYTES 25429 :SHA256
   "c184200136e136dd473f3260d64767630b5877858d85f43c81a88980c10c1e95")
  (:PATH "raw/coverage-closed/fasl/src/mvcc/package.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/mvcc/package.fasl")
   :BYTES 1368 :SHA256
   "278fb149a611453f9853a29cf82b4914833c01ae24da3b6c1d604ae2b5c4389d")
  (:PATH "raw/coverage-closed/fasl/src/mvcc/snapshots-core.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/mvcc/snapshots-core.fasl")
   :BYTES 18568 :SHA256
   "a9e3804a4fe46a38b06d942b2b23b009be79b37641740b192ebe9a61006ff110")
  (:PATH "raw/coverage-closed/fasl/src/mvcc/snapshots-csn.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/mvcc/snapshots-csn.fasl")
   :BYTES 8064 :SHA256
   "3cc0a2ecc964f238458495e9cc92a53ee1e57b9749e24f4ebe05a707f5216267")
  (:PATH "raw/coverage-closed/fasl/src/mvcc/snapshots-lifecycle.fasl" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/mvcc/snapshots-lifecycle.fasl")
   :BYTES 16947 :SHA256
   "5eb513eda41c21be774093823c82fddf7a68ab68a9ffa267f073a7a63c65d6f9")
  (:PATH "raw/coverage-closed/fasl/src/mvcc/snapshots-read.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/mvcc/snapshots-read.fasl")
   :BYTES 19648 :SHA256
   "4cde8606883db615011b1ce86ce461e525c032566e8bcfb21c18844ee1215f4f")
  (:PATH "raw/coverage-closed/fasl/src/mvcc/snapshots-register.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/mvcc/snapshots-register.fasl")
   :BYTES 15820 :SHA256
   "c7eb77053c0d0f018c79a54a409dc2b1479de02ccfb49f45268b1f59125e7f45")
  (:PATH "raw/coverage-closed/fasl/src/mvcc/snapshots-types.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/mvcc/snapshots-types.fasl")
   :BYTES 25802 :SHA256
   "756becea380a21477664ef421cfc1692abf616f0877fe1dd087bc5a3a74a99cd")
  (:PATH "raw/coverage-closed/fasl/src/mvcc/types.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/mvcc/types.fasl")
   :BYTES 1556 :SHA256
   "0f650217378dab31fb1bf277cbdc387ff91621da1ea4f98af2ea822b0c837df0")
  (:PATH "raw/coverage-closed/fasl/src/package.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/package.fasl")
   :BYTES 1506 :SHA256
   "5dd6427804fdd31ff3b7627464030e6e560bc2ce2404516a7f5345d5bf2cdc33")
  (:PATH "raw/coverage-closed/fasl/src/read/core.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/read/core.fasl")
   :BYTES 10006 :SHA256
   "7a1f3e2991b311a7a0cad6d2744edc6832f7f6ece71fcd9cfdb93b122df91761")
  (:PATH "raw/coverage-closed/fasl/src/read/package.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/read/package.fasl")
   :BYTES 1260 :SHA256
   "935fceb457fe89bc2a187add285df753c8c2d71dac1703796c571790138d815b")
  (:PATH "raw/coverage-closed/fasl/src/read/task.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/read/task.fasl")
   :BYTES 20683 :SHA256
   "88f0f9b53c73da449d16e7a595d8fef18a125609e995a3b85f3900d5949b0a32")
  (:PATH "raw/coverage-closed/fasl/src/read/types.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/read/types.fasl")
   :BYTES 11221 :SHA256
   "118dadc5a1ca34c99dea81bafc98940ae7813155c8950d260a72d6b1c8578524")
  (:PATH "raw/coverage-closed/fasl/src/recovery/decisions-build.fasl" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/recovery/decisions-build.fasl")
   :BYTES 29768 :SHA256
   "ddbfb82653c409b92b4a3fdf3f9402c5be8704cababc67f43ddb0fcb8ba45c65")
  (:PATH "raw/coverage-closed/fasl/src/recovery/decisions-package.fasl" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/recovery/decisions-package.fasl")
   :BYTES 1359 :SHA256
   "fc9a24da85fe7d6ac720c0495930eba726284f5695cb34a1816590ed17342721")
  (:PATH "raw/coverage-closed/fasl/src/recovery/decisions-query.fasl" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/recovery/decisions-query.fasl")
   :BYTES 11760 :SHA256
   "e03b344071841c1e83f7363e34b2fa335752b8e6cd5370504caac97665ce8214")
  (:PATH "raw/coverage-closed/fasl/src/recovery/decisions-radix.fasl" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/recovery/decisions-radix.fasl")
   :BYTES 25773 :SHA256
   "a37b6e5fb20dddd13fa2e5bd0afce314744c4e48f3094439ee5d417a5baa40f9")
  (:PATH "raw/coverage-closed/fasl/src/recovery/decisions-sort.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/recovery/decisions-sort.fasl")
   :BYTES 24537 :SHA256
   "6463c8cc7137b9a50b059c2d268d220801070a1e608fc4d78f812729cf9264a1")
  (:PATH "raw/coverage-closed/fasl/src/recovery/decisions-types.fasl" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/recovery/decisions-types.fasl")
   :BYTES 12713 :SHA256
   "acf366a843dc52d5fcb408b22354943017bf9573e6550f1e4b650de57bb56c8b")
  (:PATH "raw/coverage-closed/fasl/src/recovery/inventory-build.fasl" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/recovery/inventory-build.fasl")
   :BYTES 24706 :SHA256
   "2443a77131a58dce7ebdbf4bfe4b525a867f8d3e9a4d283c92b754fac5f33565")
  (:PATH "raw/coverage-closed/fasl/src/recovery/inventory-query.fasl" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/recovery/inventory-query.fasl")
   :BYTES 4614 :SHA256
   "917a7dbb3c388ededa8615c007f7b1cd292bd14f069f287a81796df8f9d56810")
  (:PATH "raw/coverage-closed/fasl/src/recovery/inventory-types.fasl" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/recovery/inventory-types.fasl")
   :BYTES 16471 :SHA256
   "512a7b51875df842391ec02149ccc7c346efd72317604dd8193cae9dd70d8d8f")
  (:PATH "raw/coverage-closed/fasl/src/recovery/manifest-build.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/recovery/manifest-build.fasl")
   :BYTES 25786 :SHA256
   "bcc1f42ad8a3c3b8d4798cd84affef64e26f8bc60fc0988faa8715d2b9c328a3")
  (:PATH "raw/coverage-closed/fasl/src/recovery/manifest-decode.fasl" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/recovery/manifest-decode.fasl")
   :BYTES 17424 :SHA256
   "f52bd1f1c694e9c2f069ff440a2fbe85a7cefeff9ebf1c4e63dcf5d80b5b2c9e")
  (:PATH "raw/coverage-closed/fasl/src/recovery/manifest-fold.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/recovery/manifest-fold.fasl")
   :BYTES 22647 :SHA256
   "c114c7b344d69287f824dfbe13889fbc6cc4cbfed3e6b4b0f08efe8025b5b05e")
  (:PATH "raw/coverage-closed/fasl/src/recovery/manifest-package.fasl" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/recovery/manifest-package.fasl")
   :BYTES 1796 :SHA256
   "ba1b73a024af4e14d5be2829c7dd5e5b35ca8c53ad4292f8c0ed3d61ac87a585")
  (:PATH "raw/coverage-closed/fasl/src/recovery/manifest-query.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/recovery/manifest-query.fasl")
   :BYTES 8590 :SHA256
   "f8306adb8abb980319a7878a64303aaf6b1c10439126bcb3bff45482e037e018")
  (:PATH "raw/coverage-closed/fasl/src/recovery/manifest-types.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/recovery/manifest-types.fasl")
   :BYTES 34319 :SHA256
   "60bb343d277d91435a60883b0d9c0d0f53db6cade223aea7b1b20b00ee4168c4")
  (:PATH "raw/coverage-closed/fasl/src/recovery/package.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/recovery/package.fasl")
   :BYTES 1402 :SHA256
   "11c578bb6542ac4f027cd0b731d072c7597f337ba2866c20e7881e7911a901e4")
  (:PATH "raw/coverage-closed/fasl/src/recovery/scan.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/recovery/scan.fasl")
   :BYTES 37048 :SHA256
   "bbd2f2a756989abf5b7c8c55fdff12c7f2c9e7247342718a651ae02181abfaef")
  (:PATH "raw/coverage-closed/fasl/src/scheduler/build.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/scheduler/build.fasl")
   :BYTES 5658 :SHA256
   "a6ac7f0fcbda4f7568b9343827e25b88c7fa0c901fa8b3dee44606cdc32b3392")
  (:PATH "raw/coverage-closed/fasl/src/scheduler/package.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/scheduler/package.fasl")
   :BYTES 1005 :SHA256
   "eeb5993dab692a6d82399d36d6438321fc219d8721d8039a75822918633fbd8c")
  (:PATH "raw/coverage-closed/fasl/src/scheduler/policy.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/scheduler/policy.fasl")
   :BYTES 6991 :SHA256
   "712467421e47f3f0442dabce1454f16c748ae13df13d547139153b4363276eca")
  (:PATH "raw/coverage-closed/fasl/src/scheduler/read.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/scheduler/read.fasl")
   :BYTES 4561 :SHA256
   "dc87104fb22206ab3192dabdcec43a5718247ab828efbc2242f5494e8a262530")
  (:PATH "raw/coverage-closed/fasl/src/scheduler/types.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/scheduler/types.fasl")
   :BYTES 18695 :SHA256
   "2b1fcbbb47334a0fd0f62aeb3b4a8cc9f3e3e48eab349c86e7ccb685833ee7e8")
  (:PATH "raw/coverage-closed/fasl/src/scheduler/update.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/scheduler/update.fasl")
   :BYTES 7171 :SHA256
   "7e0f501ab2c28a10bf0dbe8869a5da84d5ab93cca30dcf4658e19c1e0902b3fa")
  (:PATH "raw/coverage-closed/fasl/src/series/events.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/series/events.fasl")
   :BYTES 26107 :SHA256
   "9566b198317915a8a82f11e8e5805d9e42f4542b5a82d564625d83a0102fab05")
  (:PATH "raw/coverage-closed/fasl/src/series/io-events.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/series/io-events.fasl")
   :BYTES 13857 :SHA256
   "d59a21024d3ed40aa8c8429a987ee0399a8bc416140269671271b239f3476ef2")
  (:PATH "raw/coverage-closed/fasl/src/series/ownership.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/series/ownership.fasl")
   :BYTES 21428 :SHA256
   "43b732749bfb9eb8a186f93f0f347d2186ab789abbbfb603a57644008835b568")
  (:PATH "raw/coverage-closed/fasl/src/series/package.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/series/package.fasl")
   :BYTES 1782 :SHA256
   "66c90415b98c23d417a651dd6f1a1714786ceb53949c6df31c6236cb9111fad1")
  (:PATH "raw/coverage-closed/fasl/src/series/publication.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/series/publication.fasl")
   :BYTES 16564 :SHA256
   "2a49655001a14138ccc32343364696a6ab87d971b43aae297744129ca070f752")
  (:PATH "raw/coverage-closed/fasl/src/series/query.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/series/query.fasl")
   :BYTES 8527 :SHA256
   "2687e8940aeaab108ac53df5b46c682af1654e9756e7495e46b1a7182c0c78d7")
  (:PATH "raw/coverage-closed/fasl/src/series/retirement.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/series/retirement.fasl")
   :BYTES 12380 :SHA256
   "a02f9c3fe217ab04f0367f9b9e1db31b720bad6e5872735dd41374058ef55e01")
  (:PATH "raw/coverage-closed/fasl/src/series/routing-build.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/series/routing-build.fasl")
   :BYTES 9634 :SHA256
   "0e0d32e0f9fa8fd529429c7b4b01dec9130b274af0260f80f50725b80b9a975b")
  (:PATH "raw/coverage-closed/fasl/src/series/routing-select.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/series/routing-select.fasl")
   :BYTES 9547 :SHA256
   "f429f002823ab34b55cc77396b8412fdddf530514d3a04a880d0f942b8ad348c")
  (:PATH "raw/coverage-closed/fasl/src/series/routing-types.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/series/routing-types.fasl")
   :BYTES 10818 :SHA256
   "2121d10a66aa627a307d5522d676ddcf328caf7d88e4d06bca7d6d0b79b98d07")
  (:PATH "raw/coverage-closed/fasl/src/series/types.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/series/types.fasl")
   :BYTES 39234 :SHA256
   "06afeb26d44d56ef4314f236465a9d661ff2b0b2dd7ad30a2ae1f3d47720ae70")
  (:PATH "raw/coverage-closed/fasl/src/series/worker-boundary.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/series/worker-boundary.fasl")
   :BYTES 10481 :SHA256
   "68c32ab4ca891577ba01ac5e5e68015eec74cd5acbf4955d837213d457829cd8")
  (:PATH "raw/coverage-closed/fasl/src/series/worker-package.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/series/worker-package.fasl")
   :BYTES 1651 :SHA256
   "b6c3164c3684535fd8904ae948b628924ee73f6a33a225ee2c096d4ef185bfb5")
  (:PATH "raw/coverage-closed/fasl/src/series/worker-run.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/series/worker-run.fasl")
   :BYTES 19687 :SHA256
   "bc91b32e627a2ca14218b7391566d832fbe3bd3f6203e2f9e3143d8eaa5e3859")
  (:PATH "raw/coverage-closed/fasl/src/series/worker-types.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/series/worker-types.fasl")
   :BYTES 22524 :SHA256
   "3b7bd2fca6c59dcf0c3ec2c4861839511ed6408c0d92468602f0074446f584e0")
  (:PATH "raw/coverage-closed/fasl/src/storage/compaction-scan.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/storage/compaction-scan.fasl")
   :BYTES 13810 :SHA256
   "0969c8244e63dbfd225a73220a476fad7e930a70c8365907d49731e9e5ddfe1e")
  (:PATH "raw/coverage-closed/fasl/src/storage/control-payload.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/storage/control-payload.fasl")
   :BYTES 18199 :SHA256
   "89812e61dceac65539e7caeea79ae3286e560316292d37b84545fe9bee1642c3")
  (:PATH "raw/coverage-closed/fasl/src/storage/formats.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/storage/formats.fasl")
   :BYTES 10996 :SHA256
   "25ef7ba186e646c0df6d2b268e4466f4e054b9f937f6ef455fa8bb33d6c6f772")
  (:PATH "raw/coverage-closed/fasl/src/storage/log-header.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/storage/log-header.fasl")
   :BYTES 12800 :SHA256
   "11ccda7c32da8dae1a9c682c5e98c1eccf225a2bb5ad4d3d105bcb29bcfcd5af")
  (:PATH "raw/coverage-closed/fasl/src/storage/package.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/storage/package.fasl")
   :BYTES 1560 :SHA256
   "7ec78b4af53be47d25a667e60dab28f33d24a7d35ca1da6a75bbdce1bd3415df")
  (:PATH "raw/coverage-closed/fasl/src/storage/payload-record.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/storage/payload-record.fasl")
   :BYTES 8774 :SHA256
   "277ef3c69de62b68d5f4fac24ccabd42dbe4e436bdc276b375b750bf508bba0a")
  (:PATH "raw/coverage-closed/fasl/src/storage/payload-write.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/storage/payload-write.fasl")
   :BYTES 14879 :SHA256
   "dcc62487f7f3cb5fa0e9f44026bc6c52ffb5782b3b802310bdf82d409b2c5f51")
  (:PATH "raw/coverage-closed/fasl/src/storage/segment-header.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/storage/segment-header.fasl")
   :BYTES 16854 :SHA256
   "ee51d4986634e41393e096562b13451562c1d422aece26dd647bc11075f2ab37")
  (:PATH "raw/coverage-closed/fasl/src/wal/builder.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/wal/builder.fasl")
   :BYTES 22929 :SHA256
   "7c9d4d36196dd8cb4fbc220b5e2fb07417ffc11939cca5308bfa2fe245917f8a")
  (:PATH "raw/coverage-closed/fasl/src/wal/csn.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/wal/csn.fasl")
   :BYTES 24001 :SHA256
   "dc5ff2a7a227d6fabb56a55c50d78d45ea42a2cc48a5cec9d0197cc5b8e065d3")
  (:PATH "raw/coverage-closed/fasl/src/wal/executor.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/wal/executor.fasl")
   :BYTES 19765 :SHA256
   "78d04488c87c54aea965648fcd2d24a7a061920a3bd60cbc07ea85e01307121e")
  (:PATH "raw/coverage-closed/fasl/src/wal/group.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/wal/group.fasl")
   :BYTES 17866 :SHA256
   "e15271914463769bb64ad9fa409ee154d014fbcf6a8d5ebc675a1e74f705bb34")
  (:PATH "raw/coverage-closed/fasl/src/wal/package.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/wal/package.fasl")
   :BYTES 2185 :SHA256
   "fb7e83fd86427ba6843a4677a1e182cc212a518825599bfe37b4e7de8e6d6cd3")
  (:PATH "raw/coverage-closed/fasl/src/wal/types.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/src/wal/types.fasl")
   :BYTES 46368 :SHA256
   "9d3234fbd5440f2a324035d26e0e35cffc8d8cbd3503614241931eb38e128d38")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-float-write-support.fasl"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/codec/cbor-float-write-support.fasl")
   :BYTES 64978 :SHA256
   "d44232bdf280fef3f8954d92cdbb86669c53d9d65972a218a9c0281087880935")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-float-write-threads.fasl"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/codec/cbor-float-write-threads.fasl")
   :BYTES 17916 :SHA256
   "dba6d65c83db93636f174bf71b01ac515c1295b825a9a9a3428da2ac8526a72a")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-float-write.fasl" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/codec/cbor-float-write.fasl")
   :BYTES 93347 :SHA256
   "3892db212b4c6ef42fe85dcbb1cdf0ade37062c341d5276352e5fc5aa0fd78ba")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-header.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/codec/cbor-header.fasl")
   :BYTES 50938 :SHA256
   "5edd0360ab0033f844487fc2d359faf2eb282bcb671c75433ac3157e7514ebbe")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-minimal-edges.fasl" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/codec/cbor-minimal-edges.fasl")
   :BYTES 6378 :SHA256
   "6832fbfdd1da2d69d2047d4102fe753f8947d2a5d5dcd53273149b327e52627c")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-minimal-scan-support.fasl"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/codec/cbor-minimal-scan-support.fasl")
   :BYTES 55144 :SHA256
   "14703a248468cb720c1a13cdf91d92074227fbd04c9890197afa736fbe197b97")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-minimal-scan-threads.fasl"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/codec/cbor-minimal-scan-threads.fasl")
   :BYTES 21282 :SHA256
   "77f605db341974253d8cd5c9d21dc0f37deebaf48364b721c79552e668bb5ba2")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-minimal-scan.fasl" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/codec/cbor-minimal-scan.fasl")
   :BYTES 76660 :SHA256
   "58680bd682c0d02b2187a315dbc2666a963eefcd95fe241a24148a0cf5ecfba5")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-minimal-support.fasl"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/codec/cbor-minimal-support.fasl")
   :BYTES 54136 :SHA256
   "8a38027ab862bbec16b9c36a567c0f4b0ca74a3505d89f91f552bea5340e0091")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-minimal-threads.fasl"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/codec/cbor-minimal-threads.fasl")
   :BYTES 18095 :SHA256
   "3646192801b921890a50495c013cde7dc824eb044931aa9bb68e3dee676b8e4c")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-minimal.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/codec/cbor-minimal.fasl")
   :BYTES 55770 :SHA256
   "cdbd9013b12af697e30cf76298838de7ec49ba8c288b1ad96f40085fb399b4bc")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-simple-write-support.fasl"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/codec/cbor-simple-write-support.fasl")
   :BYTES 31083 :SHA256
   "a84293fafb30fd5a77c4af6a54f14dda66be659cef525ffcfdf263983cfda02e")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-simple-write-threads.fasl"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/codec/cbor-simple-write-threads.fasl")
   :BYTES 17996 :SHA256
   "599f0101557138275c91dee63d3f1b1d28fb91ea70a17893944034fca6046a04")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-simple-write.fasl" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/codec/cbor-simple-write.fasl")
   :BYTES 52718 :SHA256
   "26289384ca3ca5bbee69ee1a879a65a290d1a31ab526f59cb423f1211b131de7")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-string-write-support.fasl"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/codec/cbor-string-write-support.fasl")
   :BYTES 37652 :SHA256
   "975d5670dfdc3abd1090e58792876c3b317400b582d624f8acb67ca9713aa090")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-string-write-threads.fasl"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/codec/cbor-string-write-threads.fasl")
   :BYTES 17607 :SHA256
   "fdfd47b42533e71f7f8e5abc3e79228c95abf53677eddbf53028c8114ee81c47")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-string-write.fasl" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/codec/cbor-string-write.fasl")
   :BYTES 67520 :SHA256
   "73444db06f3bad7229de7af66690f17db9092c66d19e6c4ce1aa002ca1dfbb20")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-structure-support.fasl"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/codec/cbor-structure-support.fasl")
   :BYTES 71328 :SHA256
   "f858bb57c4bd1caa6cae60507725bb43f2cdbb0ec72eaa787cae7cf6d4979726")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-structure-threads.fasl"
   :SOURCE
   #A((156) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/codec/cbor-structure-threads.fasl")
   :BYTES 21615 :SHA256
   "af58663ec23dd034c039c6308ede79d93b08b7c8cc8a6b114051bac84b43a116")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-structure.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/codec/cbor-structure.fasl")
   :BYTES 93261 :SHA256
   "2f455f35855c72af281cdb488499a3a0ac34692c8079314cb2347b71652840e1")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-support.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/codec/cbor-support.fasl")
   :BYTES 39010 :SHA256
   "01706cb22e88344632b9cef866313a6d681cff201f3e06d1e6ae908730a772d4")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-threads.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/codec/cbor-threads.fasl")
   :BYTES 17903 :SHA256
   "9600324e0abc3bad04c27c3d0d49b0a141bc1ba6b9959133929f79d5ffa13af6")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-write-roundtrip.fasl"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/codec/cbor-write-roundtrip.fasl")
   :BYTES 5215 :SHA256
   "5db6f19d3d2b36d274dde6b4d6317c6ec27d1ae4f996222301e7a68cfb8f3a5f")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-write-support.fasl" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/codec/cbor-write-support.fasl")
   :BYTES 27513 :SHA256
   "0bb345fa6aaa4a6a9f760e4cdccd528bb061263ecfb8f5a4962d4622ffc18a6e")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-write-threads.fasl" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/codec/cbor-write-threads.fasl")
   :BYTES 17875 :SHA256
   "ec1b4929d9a6553af76d7def078fe985630135fd1f8896660854821f058bcd86")
  (:PATH "raw/coverage-closed/fasl/tests/codec/cbor-write.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/codec/cbor-write.fasl")
   :BYTES 43606 :SHA256
   "b6d84ed8e2e4ba026a91af4a15ab018d69d6cf3bd3313439e64f1245da721535")
  (:PATH "raw/coverage-closed/fasl/tests/codec/support.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/codec/support.fasl")
   :BYTES 35217 :SHA256
   "6bb420a333c425daee3adb8dd57a696041224bf1aca5d4402d41002ca5c0c956")
  (:PATH "raw/coverage-closed/fasl/tests/codec/threads.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/codec/threads.fasl")
   :BYTES 15057 :SHA256
   "776f3cd9332b1695b01fff23c9857764ff15e9ab1c314896045e2b12f9c5e39c")
  (:PATH "raw/coverage-closed/fasl/tests/codec/utf8.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/codec/utf8.fasl")
   :BYTES 59045 :SHA256
   "c29d0623b22faf04b50c77a1528b4843f55adfc23d44e9b9cd18c654dc2f4de9")
  (:PATH "raw/coverage-closed/fasl/tests/csn/registry.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/csn/registry.fasl")
   :BYTES 109831 :SHA256
   "ed9b7664bc46301126f021d0b4d1d4739bc34bdbcf027ac837c50013b0001977")
  (:PATH "raw/coverage-closed/fasl/tests/csn/support.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/csn/support.fasl")
   :BYTES 78030 :SHA256
   "fe3132d3f9a682bef8de98cfeec67d429f2e43167d7e04d4e56b8cf7c079d357")
  (:PATH "raw/coverage-closed/fasl/tests/csn/threads.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/csn/threads.fasl")
   :BYTES 49399 :SHA256
   "1abcf50cef82298d4b3c7ad77085829a65b8ca5fd674602fa07d5ab0acadb00b")
  (:PATH "raw/coverage-closed/fasl/tests/epochs/lifecycle.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/epochs/lifecycle.fasl")
   :BYTES 188394 :SHA256
   "392b74c158941407c3950d406d983a086302077011981cb3454e49c0b729ac32")
  (:PATH "raw/coverage-closed/fasl/tests/epochs/support.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/epochs/support.fasl")
   :BYTES 43367 :SHA256
   "15288cd4a829775c4277373a015fa1224643947279d3d56749beba38d72f41a2")
  (:PATH "raw/coverage-closed/fasl/tests/epochs/threads.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/epochs/threads.fasl")
   :BYTES 23190 :SHA256
   "b4a5bf93c069b39e512da68c5dca333fa0cd23c55ab75e2d33cfdce31ea88cf5")
  (:PATH "raw/coverage-closed/fasl/tests/execution/handoff.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/execution/handoff.fasl")
   :BYTES 196934 :SHA256
   "3ed27c4954556f3c11896a7109410e121b9bd354b2a2feaffb1e7e206a5304e8")
  (:PATH "raw/coverage-closed/fasl/tests/execution/queue.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/execution/queue.fasl")
   :BYTES 85792 :SHA256
   "ec9406201f011aaca52fb0216f9f0007c802bfaef5ebd6cf1dd312175947f176")
  (:PATH "raw/coverage-closed/fasl/tests/execution/ready-recycle.fasl" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/execution/ready-recycle.fasl")
   :BYTES 156696 :SHA256
   "27ca780c8f916ecd1d91dece7f106002f053e85cab8ad4cd5bc7ba675010a50e")
  (:PATH "raw/coverage-closed/fasl/tests/execution/ready.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/execution/ready.fasl")
   :BYTES 191336 :SHA256
   "615e284b8201e6691d8377fa06e69c9dd96a5c918ddba61141d1c8a35ca0953f")
  (:PATH "raw/coverage-closed/fasl/tests/execution/support.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/execution/support.fasl")
   :BYTES 29613 :SHA256
   "02e77a81b8008ca4ab38f13707a7fcda287136238cb4dbc2306afa7691f752e0")
  (:PATH "raw/coverage-closed/fasl/tests/execution/threads.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/execution/threads.fasl")
   :BYTES 65490 :SHA256
   "50b59a955ca9607393afd6d7501175a920e0d4b9cde62681085c56f19b99019d")
  (:PATH "raw/coverage-closed/fasl/tests/execution/worker.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/execution/worker.fasl")
   :BYTES 354774 :SHA256
   "97a2770e8e771df436028f0cdc95cb1799a2e63d4eb20ac0a6f67483cbfea5d4")
  (:PATH "raw/coverage-closed/fasl/tests/foundation/batch.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/foundation/batch.fasl")
   :BYTES 43976 :SHA256
   "a881f0ea14cec72972cfeee87f15760ba63d51aa144a4a4c45111a91ec0d83da")
  (:PATH "raw/coverage-closed/fasl/tests/foundation/binary.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/foundation/binary.fasl")
   :BYTES 32090 :SHA256
   "a0b9a490d21dd90f23122567d3cb07b5d812b95f28b64fe23ef5740a164a74da")
  (:PATH "raw/coverage-closed/fasl/tests/foundation/record.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/foundation/record.fasl")
   :BYTES 129723 :SHA256
   "372f81f6522e07e398fb800a861e59e927580b4d3ea0fc3cb88ef9a7510e6b82")
  (:PATH "raw/coverage-closed/fasl/tests/foundation/support.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/foundation/support.fasl")
   :BYTES 17116 :SHA256
   "77220dccbafd9ab03c7c4338c5ba8404037bc69d32494b17b0053efdf6199d8f")
  (:PATH "raw/coverage-closed/fasl/tests/get-active/construction.fasl" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/get-active/construction.fasl")
   :BYTES 107509 :SHA256
   "f78492547fd5907563bac6eb91ddf8a17d1bb7c14e527e7a42bf351d2e4eaf6a")
  (:PATH "raw/coverage-closed/fasl/tests/get-active/directory.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/get-active/directory.fasl")
   :BYTES 39448 :SHA256
   "967206ef94911cad79a01f08b3cd87850ef9d2c36e8e95175f9730d865362eb5")
  (:PATH "raw/coverage-closed/fasl/tests/get-active/read.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/get-active/read.fasl")
   :BYTES 144900 :SHA256
   "26d6b9444dc0f8d527eec7def27d1884276e1e2c02a2b67e7a05a00811acca80")
  (:PATH "raw/coverage-closed/fasl/tests/get-active/support.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/get-active/support.fasl")
   :BYTES 224442 :SHA256
   "ab82dd68719182e2f28fe34b8dd83bc2bfe8d90d497eac6ff39035dce63aee1d")
  (:PATH "raw/coverage-closed/fasl/tests/get-directory/construction.fasl"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/get-directory/construction.fasl")
   :BYTES 82974 :SHA256
   "04382b2f899459bb8ca605eb5a54f04043771b57f4296e388f90e1b9d5a7f461")
  (:PATH "raw/coverage-closed/fasl/tests/get-directory/read.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/get-directory/read.fasl")
   :BYTES 159079 :SHA256
   "28a5286d154bdee0d139a5db03d0e249d05b9398931c2e3ff29169abfecdb0d2")
  (:PATH "raw/coverage-closed/fasl/tests/get-directory/support.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/get-directory/support.fasl")
   :BYTES 163539 :SHA256
   "a12c35e646ec16dde17e4d91e8c6b6908dc025ff3c21ff5100d470abc07e5faa")
  (:PATH "raw/coverage-closed/fasl/tests/get-directory/threads.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/get-directory/threads.fasl")
   :BYTES 31621 :SHA256
   "e3bf988290961242204c49d905532bc32ff1b0af5c5d78b540909d34fdc6a108")
  (:PATH "raw/coverage-closed/fasl/tests/get-performance/guards.fasl" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/get-performance/guards.fasl")
   :BYTES 41792 :SHA256
   "820e99e49312e9e9990a6c727dfdc2905c71bffe9db36fff8a3a4d2bd789fc10")
  (:PATH "raw/coverage-closed/fasl/tests/get-performance/paths.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/get-performance/paths.fasl")
   :BYTES 32738 :SHA256
   "47bc83e6155b950e85f2e43c362e7b57de6460493ec1cc6aeced4f9ea01d64d2")
  (:PATH "raw/coverage-closed/fasl/tests/get-performance/support.fasl" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/get-performance/support.fasl")
   :BYTES 142381 :SHA256
   "17d98b76da8aeee9e5043a8c9fde575b5361dd2da88113ebf0aae7bfdb10ba7e")
  (:PATH "raw/coverage-closed/fasl/tests/get-performance/threads.fasl" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/get-performance/threads.fasl")
   :BYTES 21169 :SHA256
   "5cbb7f00bee3c08571b0caeb6fe1d754582095cab66ac82ff63c53fe2e4c006a")
  (:PATH "raw/coverage-closed/fasl/tests/get-resolver/construction.fasl"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/get-resolver/construction.fasl")
   :BYTES 75578 :SHA256
   "f858531386c5ca41b81343f91a03aead431c77462344cda8704f9f67de4d7ee5")
  (:PATH "raw/coverage-closed/fasl/tests/get-resolver/read.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/get-resolver/read.fasl")
   :BYTES 157207 :SHA256
   "d674fed5859df1c8b4843b6e3ab9f29b3b9afdff4fd4ba50319731673df2f6a9")
  (:PATH "raw/coverage-closed/fasl/tests/get-resolver/sort.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/get-resolver/sort.fasl")
   :BYTES 39433 :SHA256
   "636fe31c6efbe09243bc2648c119eea51e71d2797984dcbf4190f234fe713d9f")
  (:PATH "raw/coverage-closed/fasl/tests/get-resolver/support.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/get-resolver/support.fasl")
   :BYTES 163594 :SHA256
   "4dfce5aba036d68a95781e08918e6735806ff237f6418105443802b429874e09")
  (:PATH "raw/coverage-closed/fasl/tests/get/lifecycle.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/get/lifecycle.fasl")
   :BYTES 181796 :SHA256
   "28d11afd158ebb5e45f6b521cd0047fa8c9aa414d49402eeee2901a917c89522")
  (:PATH "raw/coverage-closed/fasl/tests/get/segment.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/get/segment.fasl")
   :BYTES 131222 :SHA256
   "1eec8798e7271970b57ab5f1752201c6fb66a3a0af8f955f72bea82a144a0d8e")
  (:PATH "raw/coverage-closed/fasl/tests/get/support.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/get/support.fasl")
   :BYTES 106882 :SHA256
   "2ae3bb52542ab90abe25defbe3da2e2cc7175faa19c675f6dafd54a3e824b0c9")
  (:PATH "raw/coverage-closed/fasl/tests/hash/guards.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/hash/guards.fasl")
   :BYTES 8311 :SHA256
   "e702174ae680d9b4acd3e481e476b443d7ab1aa6df02f475a30653b07a32cac5")
  (:PATH "raw/coverage-closed/fasl/tests/hash/hash64.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/hash/hash64.fasl")
   :BYTES 82838 :SHA256
   "6d03f8cf8a111982ae31877983c3449f987759697446eeeca92a4ddf26997e6e")
  (:PATH "raw/coverage-closed/fasl/tests/hash/support.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/hash/support.fasl")
   :BYTES 60595 :SHA256
   "fe368dc7a33278b35914d05c6603d30e16361181001052ec2284a7b825ce26ec")
  (:PATH "raw/coverage-closed/fasl/tests/hash/threads.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/hash/threads.fasl")
   :BYTES 32525 :SHA256
   "f10852f117c756bfd98b0d1f06762b879013f177327c3183e00332f917e8122a")
  (:PATH "raw/coverage-closed/fasl/tests/index/hash-digests.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/index/hash-digests.fasl")
   :BYTES 202728 :SHA256
   "67a1580bf7a119503e42110bb4c579e42521c7c5e541f5299e711a54f97f9e9e")
  (:PATH "raw/coverage-closed/fasl/tests/index/primary-support.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/index/primary-support.fasl")
   :BYTES 66479 :SHA256
   "3c0057875896c0c1af4c793cc8131cae2659340af753f9885d5bdab147a55eac")
  (:PATH "raw/coverage-closed/fasl/tests/index/primary-threads.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/index/primary-threads.fasl")
   :BYTES 72505 :SHA256
   "5795171fc8cac9097e399cf322e2fe3f763c425863d272f857a2d13aabe849ee")
  (:PATH "raw/coverage-closed/fasl/tests/index/primary.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/index/primary.fasl")
   :BYTES 193994 :SHA256
   "e7b31330b2ab17cc8683d8c42d27e29d73372811da260f9294d35bc2962f6bff")
  (:PATH "raw/coverage-closed/fasl/tests/index/rebuild.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/index/rebuild.fasl")
   :BYTES 183035 :SHA256
   "7815b4eb419d82ef0657b0500988fc285beb8a89c774ce170da74ec1bc9e2b94")
  (:PATH "raw/coverage-closed/fasl/tests/index/slot-support.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/index/slot-support.fasl")
   :BYTES 62583 :SHA256
   "239cfb9ab9ad4ba731847ec5e4391997c5f5295214b737e9bb30f42ef440f3af")
  (:PATH "raw/coverage-closed/fasl/tests/index/slot-threads.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/index/slot-threads.fasl")
   :BYTES 69703 :SHA256
   "d1de0710c79637fc864ece924e2841f2b5d1ff179340463b0d5db24fa9a984fe")
  (:PATH "raw/coverage-closed/fasl/tests/index/slots.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/index/slots.fasl")
   :BYTES 194630 :SHA256
   "37f3c5112348636055f634deacfb151d21ab1daba796a3e38c5e8c85dcf8385d")
  (:PATH "raw/coverage-closed/fasl/tests/io/native.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/io/native.fasl")
   :BYTES 65701 :SHA256
   "ef47859ec5600147020d87cf3081dbeba2b86d0f803f2dd9b6695906d4f7d8d3")
  (:PATH "raw/coverage-closed/fasl/tests/io/support.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/io/support.fasl")
   :BYTES 23466 :SHA256
   "df24c455510e632931cfb11eee459df6b6eeac510a9e24de234d1e7ca64ef0c5")
  (:PATH "raw/coverage-closed/fasl/tests/io/transfer.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/io/transfer.fasl")
   :BYTES 114057 :SHA256
   "aee09789c4919baafe4f4bee9ba5fabece482cc64418f835a95c1e3940df8a65")
  (:PATH "raw/coverage-closed/fasl/tests/mvcc/capture.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/mvcc/capture.fasl")
   :BYTES 112446 :SHA256
   "099b40936c4e1336938508aa119dcc5fd7560b660d254fe10230096981c7cb75")
  (:PATH "raw/coverage-closed/fasl/tests/mvcc/lifecycle.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/mvcc/lifecycle.fasl")
   :BYTES 222610 :SHA256
   "143f9da0be7d6d9af4fd8ff383b4ce4376fb5f284bfa85917b56a2f08381d424")
  (:PATH "raw/coverage-closed/fasl/tests/mvcc/support.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/mvcc/support.fasl")
   :BYTES 46354 :SHA256
   "356369a48cf3e7d6c67f611d8f6e2924bc431ab1c7735788f298a85a08d946d6")
  (:PATH "raw/coverage-closed/fasl/tests/read/lifecycle.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/read/lifecycle.fasl")
   :BYTES 286956 :SHA256
   "11e8d2fd94dc4a4f53780e755aa51d37f25bebf7236444b9f287a876114f07d8")
  (:PATH "raw/coverage-closed/fasl/tests/read/support.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/read/support.fasl")
   :BYTES 41729 :SHA256
   "e7952ae3162a449edcbe86f7a6fc23aa95d4205d3099612bd75b9e27e0fd8b1d")
  (:PATH "raw/coverage-closed/fasl/tests/read/threads.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/read/threads.fasl")
   :BYTES 39201 :SHA256
   "d9afe7fa2aac2f08701f62b828f06e42a9ab13b99f6d2ddba0e5b0dabba7f451")
  (:PATH "raw/coverage-closed/fasl/tests/recovery/corruption.fasl" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/recovery/corruption.fasl")
   :BYTES 35296 :SHA256
   "1eaa0fdc85943c2a1338e9b37b9df2a28b4f874ffbd3050cc195d24945652f18")
  (:PATH "raw/coverage-closed/fasl/tests/recovery/decisions-audit.fasl" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/recovery/decisions-audit.fasl")
   :BYTES 75400 :SHA256
   "96e9b5959715d4b42b5a8557146f0af9277a8588189e6a21261bcec5ab45da0d")
  (:PATH "raw/coverage-closed/fasl/tests/recovery/decisions-radix.fasl" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/recovery/decisions-radix.fasl")
   :BYTES 146471 :SHA256
   "48a5daf540ebcbc6d1619748922eb87a89687ac08511cbd263329b4cff123508")
  (:PATH "raw/coverage-closed/fasl/tests/recovery/decisions-support.fasl"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/recovery/decisions-support.fasl")
   :BYTES 35954 :SHA256
   "4deea54c3ca1935660d1f15b0ff5897e4cec617744cac0424804a0b830f921c7")
  (:PATH "raw/coverage-closed/fasl/tests/recovery/decisions.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/recovery/decisions.fasl")
   :BYTES 117733 :SHA256
   "b3e00fdc74cc7d7fe46238522ef5b16a552f37ce42db8394b00495830e723725")
  (:PATH "raw/coverage-closed/fasl/tests/recovery/inventory-support.fasl"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/recovery/inventory-support.fasl")
   :BYTES 42482 :SHA256
   "6f13045a6c92d50bcb439357ca796c79f8b4f8b883c1ad789c69cffe84814f9c")
  (:PATH "raw/coverage-closed/fasl/tests/recovery/inventory.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/recovery/inventory.fasl")
   :BYTES 78882 :SHA256
   "28d5caf4e0f78e359dd794aca78f0c2e57a2e45c7e65342670ff5ca869b88117")
  (:PATH "raw/coverage-closed/fasl/tests/recovery/manifest-audit.fasl" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/recovery/manifest-audit.fasl")
   :BYTES 96391 :SHA256
   "ce961a76d2fae9bbb754d5344375a915ed4c4995347149e81fc93aef0d7c7f0b")
  (:PATH "raw/coverage-closed/fasl/tests/recovery/manifest-support.fasl"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/recovery/manifest-support.fasl")
   :BYTES 54502 :SHA256
   "b19c17e00d149f2598beef8b6eacf98af804a9a5ece93db02bbd86dc6905f7fb")
  (:PATH "raw/coverage-closed/fasl/tests/recovery/manifest.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/recovery/manifest.fasl")
   :BYTES 71118 :SHA256
   "23f5e2b7eae53ee5e66810d103f13feb4e482b9913773f85596db619411b8875")
  (:PATH "raw/coverage-closed/fasl/tests/recovery/scan.fasl" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/recovery/scan.fasl")
   :BYTES 108284 :SHA256
   "66c35fed19ab7fe6d706b8d6d747300561528c5f3e72aaecc8c8e778a24b499e")
  (:PATH "raw/coverage-closed/fasl/tests/recovery/support.fasl" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/recovery/support.fasl")
   :BYTES 34717 :SHA256
   "51a9536c69393762489b3f20ab49b989683b5aaafa5f5322d2913014e9b41423")
  (:PATH "raw/coverage-closed/fasl/tests/scheduler/controller.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/scheduler/controller.fasl")
   :BYTES 108269 :SHA256
   "2c11839b351124d7c6af1114b9c6211417d0a61944b1ae9d2ea0894655ee4849")
  (:PATH "raw/coverage-closed/fasl/tests/scheduler/support.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/scheduler/support.fasl")
   :BYTES 19475 :SHA256
   "a91db0fb41e4a3191b139b8a86a5a8ab1853b88774c5c324d61ad23102469814")
  (:PATH "raw/coverage-closed/fasl/tests/series/boundaries.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/series/boundaries.fasl")
   :BYTES 26474 :SHA256
   "f7b741d9f9a1025014f899ae8e20c4f90cf9f0db6da7f80f2509a65cc4b9b5a5")
  (:PATH "raw/coverage-closed/fasl/tests/series/controller.fasl" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/series/controller.fasl")
   :BYTES 304532 :SHA256
   "b019acd7b784b50a09e6af7e9c688570009cb25918bb57478c8fd84b3a42a37a")
  (:PATH "raw/coverage-closed/fasl/tests/series/support.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/series/support.fasl")
   :BYTES 119669 :SHA256
   "ca1dd2ef91a23fc00bad7c364d9ab1eb44d7d092aaf3640cca2b6c43c62e7c44")
  (:PATH "raw/coverage-closed/fasl/tests/series/threads.fasl" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/series/threads.fasl")
   :BYTES 89541 :SHA256
   "54809d7d3f9454a4f67ae8e38b940dd3bd9ce6b95654f4bfbca996548eafcf79")
  (:PATH "raw/coverage-closed/fasl/tests/series/worker-bridge.fasl" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/series/worker-bridge.fasl")
   :BYTES 280763 :SHA256
   "f6559b756e7dddae2a4b249b995b2698d83e145a8c3b8e68ee38734951bf837e")
  (:PATH "raw/coverage-closed/fasl/tests/series/worker-routing.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/series/worker-routing.fasl")
   :BYTES 156731 :SHA256
   "47997647920003918ccad6b8e3a979c99d57961d264bc8e180d8539b057492e5")
  (:PATH "raw/coverage-closed/fasl/tests/smoke.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/smoke.fasl")
   :BYTES 4861 :SHA256
   "d35699a65dd09f42c95711b65e7792da1738b5e12554bb753eed92f16f2e3632")
  (:PATH "raw/coverage-closed/fasl/tests/storage/compaction-scan.fasl" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/storage/compaction-scan.fasl")
   :BYTES 80090 :SHA256
   "7beeaa3edf2cb9644ccdf4375e7e9f30ec2a272e0a153709863ba85c5f0ec650")
  (:PATH "raw/coverage-closed/fasl/tests/storage/control-payload.fasl" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/storage/control-payload.fasl")
   :BYTES 123129 :SHA256
   "eef79c0def71e82f0e86d58d7ea93c45220edb2edb9fa92adde62922cab386f3")
  (:PATH "raw/coverage-closed/fasl/tests/storage/log-header.fasl" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/storage/log-header.fasl")
   :BYTES 79474 :SHA256
   "06f17bd6f457885c33413ddcfaa8aa2aa86b02bd37c76bffe3565f592448cc1a")
  (:PATH "raw/coverage-closed/fasl/tests/storage/segment-header.fasl" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/storage/segment-header.fasl")
   :BYTES 38957 :SHA256
   "a6402cb95e4a76930028363df5997a7a7dcd0366f987a2459d02c28d5a8f87a7")
  (:PATH "raw/coverage-closed/fasl/tests/storage/support.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/storage/support.fasl")
   :BYTES 28179 :SHA256
   "c25b94066f47842ac7ac90b425510ba99403daef45338b614c57c2e16eb37f3e")
  (:PATH "raw/coverage-closed/fasl/tests/wal/builder.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/wal/builder.fasl")
   :BYTES 39778 :SHA256
   "745b0fb5e8f1081ed5b025d9288733d80a7d04830931e0b1115cc8da304c319b")
  (:PATH "raw/coverage-closed/fasl/tests/wal/csn-threads.fasl" :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/wal/csn-threads.fasl")
   :BYTES 65565 :SHA256
   "093e95dff36bc30ca8c46897a5d8024de9b5987dc784e9d6df91cdc38f8662ff")
  (:PATH "raw/coverage-closed/fasl/tests/wal/csn.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/wal/csn.fasl")
   :BYTES 220507 :SHA256
   "b7206f7a3bb08d7627d994bd0674c26b6c2b3f0812a5cd3d1bf6637fd1e0b89b")
  (:PATH "raw/coverage-closed/fasl/tests/wal/fault.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/wal/fault.fasl")
   :BYTES 65703 :SHA256
   "c09237699547b2523e41cda61f26b38f1fd61bb9687c87f97cbdff1ae1e3e060")
  (:PATH "raw/coverage-closed/fasl/tests/wal/group.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/wal/group.fasl")
   :BYTES 57957 :SHA256
   "05625e0261f8f011ce3c8d21273e1a10e629e818fe4e953fdf71860783ceaf3b")
  (:PATH "raw/coverage-closed/fasl/tests/wal/native.fasl" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/wal/native.fasl")
   :BYTES 21738 :SHA256
   "b2491e79c485548df16abc04ae87e714ac9b062f1dc0d358c7775c4634e720b0")
  (:PATH "raw/coverage-closed/fasl/tests/wal/support.fasl" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/get-resolver-active-compat-R1/fasl/tests/wal/support.fasl")
   :BYTES 14760 :SHA256
   "0a36937143c97e81964ddb5853cc53a8d4f4c481953d09436fb8c6f5d0061bf7")
  (:PATH "raw/reader-process-fixtures/completion-exit/isolated-build.lisp"
   :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910623-reader-self-test-11984-0/completion-exit/isolated-build.lisp")
   :BYTES 197 :SHA256
   "1a45dcf8a6d03f1e8866e49280c6f0edb894320c90624d5620fad1e3d546cea9")
  (:PATH "raw/reader-process-fixtures/completion-exit/stderr.log" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910623-reader-self-test-11984-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/reader-process-fixtures/completion-exit/stdout.log" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910623-reader-self-test-11984-0/completion-exit/stdout.log")
   :BYTES 105 :SHA256
   "5e630c1b44d68ce71b27d151e76bf367e3cbd941200adc36cdd30e0fe7390531")
  (:PATH "raw/reader-process-fixtures/report.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910623-reader-self-test-11984-0/report.lisp")
   :BYTES 1985 :SHA256
   "e76bc84c7c8a5ada94141fef79e181ea2a6d6b92508ea5fee00456b301b633a7")
  (:PATH "raw/reader-process-fixtures/signal/isolated-build.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910623-reader-self-test-11984-0/signal/isolated-build.lisp")
   :BYTES 247 :SHA256
   "ff5cf55dda241d32ea1b4308172c7dc526436cbf1d546e7471148cee95a873d1")
  (:PATH "raw/reader-process-fixtures/signal/stderr.log" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910623-reader-self-test-11984-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/reader-process-fixtures/signal/stdout.log" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910623-reader-self-test-11984-0/signal/stdout.log")
   :BYTES 126 :SHA256
   "3697c68fa71f124c8d05d8cc5d649a744586a10989eb2e67c5bdce6bfc760142")
  (:PATH "raw/snapshot-process-fixtures/completion-exit/isolated-build.lisp"
   :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910623-snapshot-self-test-11981-0/completion-exit/isolated-build.lisp")
   :BYTES 199 :SHA256
   "b8bb4416a818775bae5c77341eeec2c356a2733f633ac2bc8b6ac3ff955d05e0")
  (:PATH "raw/snapshot-process-fixtures/completion-exit/stderr.log" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910623-snapshot-self-test-11981-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/snapshot-process-fixtures/completion-exit/stdout.log" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910623-snapshot-self-test-11981-0/completion-exit/stdout.log")
   :BYTES 107 :SHA256
   "4f22544421d9012fe132a36bf15950cd327ca959b8f9c5ef3d386e0c8b62a25c")
  (:PATH "raw/snapshot-process-fixtures/report.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910623-snapshot-self-test-11981-0/report.lisp")
   :BYTES 2003 :SHA256
   "ed885711f08dc566ad02f0c34a797bfdca24708967965ed3419edf38e49d2b2d")
  (:PATH "raw/snapshot-process-fixtures/signal/isolated-build.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910623-snapshot-self-test-11981-0/signal/isolated-build.lisp")
   :BYTES 249 :SHA256
   "a345276e3dfe377c0bbd359793165915b1527938a65250d367ce5ac079feecc1")
  (:PATH "raw/snapshot-process-fixtures/signal/stderr.log" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910623-snapshot-self-test-11981-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/snapshot-process-fixtures/signal/stdout.log" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910623-snapshot-self-test-11981-0/signal/stdout.log")
   :BYTES 128 :SHA256
   "e3502e714a0530acb1f0130c4ced4a016607bcb067e3686f6f29704db8423ea5")
  (:PATH "raw/spikes-native/SPK-01.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910766-check-14613-0/SPK-01.lisp")
   :BYTES 27226 :SHA256
   "0ca7ad674a61fa2ac9e2cf406cedc39de017de276ea2fa55ab74757da2e28f84")
  (:PATH "raw/spikes-native/SPK-02.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910766-check-14613-0/SPK-02.lisp")
   :BYTES 1607 :SHA256
   "0cf2dec56584fba1189886af01aec22d4c4aff654f2567cbe208d3038a8db1e8")
  (:PATH "raw/spikes-native/SPK-03.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910766-check-14613-0/SPK-03.lisp")
   :BYTES 3658 :SHA256
   "5a33ad69616c39a7e3c1f8f2ace030177a785e7d55ff3a4dbb1a98969e08ea53")
  (:PATH "raw/spikes-native/SPK-04.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910766-check-14613-0/SPK-04.lisp")
   :BYTES 6752 :SHA256
   "82c76940cb938dd99977655e9d1ea0fe60475828a205e01c63b2ffbcac9daae3")
  (:PATH "raw/spikes-native/SPK-05.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910766-check-14613-0/SPK-05.lisp")
   :BYTES 10163 :SHA256
   "a8173e6417ae2287dc6ff322841b43ef848b8ba1cc37d30b15f02867a073b603")
  (:PATH "raw/spikes-native/SPK-06.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910766-check-14613-0/SPK-06.lisp")
   :BYTES 24127 :SHA256
   "db36670382acfcd37f6658b8c94af39cf01be020d57705d0d1240ddc8f313885")
  (:PATH "raw/spikes-native/SPK-07.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910766-check-14613-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "c8b40fd16830bc19451d45ca0d3647467e65662f2e93f45e90fbc5e36235a6d2")
  (:PATH "raw/spikes-native/SPK-07.lisp.gz" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910766-check-14613-0/SPK-07.lisp.gz")
   :BYTES 410645 :SHA256
   "0ec3c44df723e03205412842e39b1cd7cd8cb243431911b78bc6ed5c159bc91e")
  (:PATH "raw/spikes-native/SPK-08.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910766-check-14613-0/SPK-08.lisp")
   :BYTES 292334 :SHA256
   "060698941492bee577d5c3af098b358720b4ce9499f166fd7bce6bb8b572dc30")
  (:PATH "raw/spikes-native/SPK-09.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910766-check-14613-0/SPK-09.lisp")
   :BYTES 2472 :SHA256
   "b82eb3504a90b4ad16b1115b85641f8a31637aab9341656c77e07b629108111f")
  (:PATH "raw/spikes-native/SPK-10.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910766-check-14613-0/SPK-10.lisp")
   :BYTES 22976 :SHA256
   "2d9e080c32e436cabdcd9ab581ce99ed2a0bcefad4ac32e23c996c3f06922b15")
  (:PATH "raw/spikes-native/conservazione.lisp" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910766-check-14613-0/conservazione.lisp")
   :BYTES 2336 :SHA256
   "6f838db2a2a912647eac3ce9f235eb2fbdd72fac2659849bdf52b3253d366e0a")
  (:PATH "raw/spikes-native/report.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910766-check-14613-0/report.lisp")
   :BYTES 318 :SHA256
   "aa330bdbc9c3dcb72aa598ef92176912eb3994347c374a7b686790d3af00507f")
  (:PATH "raw/spikes-native/report.lisp.gz" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910766-check-14613-0/report.lisp.gz")
   :BYTES 467060 :SHA256
   "a4f4a36342381446c6baab40a7c25c566e0b427256ddee687f6a6ec0c0ce2f44")
  (:PATH "raw/usage-duplicate-report/conservazione.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910591-command-11685-0/conservazione.lisp")
   :BYTES 1174 :SHA256
   "3948ba97f2e22d13c8b5e703c895988e7b20c874d2c0d52de2dd63b3a3c57dfb")
  (:PATH "raw/usage-duplicate-report/report.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910591-command-11685-0/report.lisp")
   :BYTES 165564 :SHA256
   "04b1712cded7e39217a535eacd8547da29c38b4bb04114f53b5c50f4e85bd6c8")
  (:PATH "raw/usage-duplicate-suite/conservazione.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910591-command-11683-0/conservazione.lisp")
   :BYTES 1174 :SHA256
   "30f1c4a66b729e17fe0ed2ea62a00386db2661c230dda331a0c0e6b5a74a4f97")
  (:PATH "raw/usage-duplicate-suite/report.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910591-command-11683-0/report.lisp")
   :BYTES 165724 :SHA256
   "608c1da3346e65f90177bea9eac54925d8a9e30dea2dcc26f7375b7b418dfdfe")
  (:PATH "raw/usage-unknown-suite/conservazione.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910591-command-11681-0/conservazione.lisp")
   :BYTES 1174 :SHA256
   "12b39c3d7e1f681bd073101eab90a74b75261f3d52e8a70165ccb31275813097")
  (:PATH "raw/usage-unknown-suite/report.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-verification/ArcDocDB/spikes/out/4000910591-command-11681-0/report.lisp")
   :BYTES 165504 :SHA256
   "b53656b6355c74290bb80f1bee44497303f1932efbd4df2c623245221d96c64c"))
 :LIMITS
 (:COMPLETE-EXPLICIT-GROUPS :RAW-FASL-PRESERVED-AS-DATA :SOURCE-AND-COPY-SHA256
  :LOSSLESS-GZIP-FOR-LARGE-RAW :NO-RESULT-PROMOTION))
