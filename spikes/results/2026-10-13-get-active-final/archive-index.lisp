(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "core-outer" :RECORD-PATH "raw/core-outer/report.lisp" :COMMAND
   (#A((3) BASE-CHAR . "env")
    #A((265) BASE-CHAR
       . "ASDF_OUTPUT_TRANSLATIONS=(:output-translations (#P\"/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/**/*.*\" #P\"/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/**/*.*\") :ignore-inherited-configuration)")
    #A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "check"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "core-inner" :RECORD-PATH "raw/core-inner/report.lisp" :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "local-audit-R1-command" :RECORD-PATH
   "raw/local-audit-R1-command/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((46) BASE-CHAR . "spikes/out/active-final-local-audit/audit.lisp")
    #A((11) BASE-CHAR . "--workspace")
    #A((63) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB")
    #A((8) BASE-CHAR . "--commit")
    #A((40) BASE-CHAR . "ae4022fb66914c53a8f9fba69298e88ce2a35d98")
    #A((6) BASE-CHAR . "--core")
    #A((49) BASE-CHAR . "spikes/out/4000914478-command-99440-0/report.lisp")
    #A((12) BASE-CHAR . "--outer-core")
    #A((49) BASE-CHAR . "spikes/out/4000914477-command-99166-0/report.lisp")
    #A((8) BASE-CHAR . "--reader")
    #A((56) BASE-CHAR
       . "spikes/out/4000914510-reader-self-test-956-0/report.lisp")
    #A((10) BASE-CHAR . "--snapshot")
    #A((58) BASE-CHAR
       . "spikes/out/4000914510-snapshot-self-test-932-0/report.lisp")
    #A((10) BASE-CHAR . "--fasl-dir")
    #A((34) BASE-CHAR . "spikes/out/active-final-core-fasl/")
    #A((14) BASE-CHAR . "--expect-tests") #A((4) BASE-CHAR . "1125"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "local-audit-R2-command" :RECORD-PATH
   "raw/local-audit-R2-command/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((49) BASE-CHAR . "spikes/out/active-final-local-audit/audit-R2.lisp")
    #A((11) BASE-CHAR . "--workspace")
    #A((63) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB")
    #A((8) BASE-CHAR . "--commit")
    #A((40) BASE-CHAR . "ae4022fb66914c53a8f9fba69298e88ce2a35d98")
    #A((6) BASE-CHAR . "--core")
    #A((49) BASE-CHAR . "spikes/out/4000914478-command-99440-0/report.lisp")
    #A((12) BASE-CHAR . "--outer-core")
    #A((49) BASE-CHAR . "spikes/out/4000914477-command-99166-0/report.lisp")
    #A((8) BASE-CHAR . "--reader")
    #A((56) BASE-CHAR
       . "spikes/out/4000914510-reader-self-test-956-0/report.lisp")
    #A((10) BASE-CHAR . "--snapshot")
    #A((58) BASE-CHAR
       . "spikes/out/4000914510-snapshot-self-test-932-0/report.lisp")
    #A((10) BASE-CHAR . "--fasl-dir")
    #A((34) BASE-CHAR . "spikes/out/active-final-core-fasl/")
    #A((14) BASE-CHAR . "--expect-tests") #A((4) BASE-CHAR . "1125"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "README.md" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-publication/README-template.txt")
   :BYTES 3196 :SHA256
   "ffb0c1f34725cad55e5e8996b90e64c58e2267be9703bc18c5d4e0fb44ff8d7f")
  (:PATH "collection-manifest.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-publication/manifest.lisp")
   :BYTES 1727 :SHA256
   "dd8d72bda7ea2589b45d8f2425810cb6d3ea6fbfdbf22f9bb70ab2df7b8df95a")
  (:PATH "collection-source.txt" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-publication/collect.lisp")
   :BYTES 16793 :SHA256
   "64724e5e99686930aeac8b39664274f6e665b4acb56ea87a7d4e62f1fa0ee79d")
  (:PATH "publication-audit-contract.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-publication/contract.lisp")
   :BYTES 1030 :SHA256
   "cc4a77fd4ee60ceca31f72ea1596c21744429c72ddad064d55908e05c9890a26")
  (:PATH "publication-audit-source.txt" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-publication-audit/audit.lisp")
   :BYTES 20060 :SHA256
   "b4c7af36c501647ecdca81b0a9ac314ed76d8c8bd6f8f5d50a5d1c6c411a46d9")
  (:PATH "raw/SPK-01/check-lettura-buffer.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-01-primary-index/out/check-lettura-buffer.fasl")
   :BYTES 112343 :SHA256
   "9ac9c860e17580e6999840a076f65bfbc2ad2cce92969a314628a7570810f040")
  (:PATH "raw/SPK-01/core.fasl" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-01-primary-index/out/core.fasl")
   :BYTES 158704 :SHA256
   "47f4893c0a95c93cacd7469c82fafa2d21fabf097fdea600ef49dc81d818d4f3")
  (:PATH "raw/SPK-01/lettura-buffer.fasl" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-01-primary-index/out/lettura-buffer.fasl")
   :BYTES 8159 :SHA256
   "94b76817819a202d3625f95d9c16f04a291786cb5241cbd9a8d1cdcc498aadbb")
  (:PATH "raw/SPK-02/core.fasl" :SOURCE
   #A((94) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-02-gc/out/core.fasl")
   :BYTES 110726 :SHA256
   "1f2f62c016f00016e62990ee76facd5f63309b6f4b4be2f32297ae689b637aee")
  (:PATH "raw/SPK-03/core.fasl" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-03-group-commit/out/core.fasl")
   :BYTES 102596 :SHA256
   "0d7df2c7c4f066898737b6a24e7bd8c6ad011645e8a2f4329733d319ac854ad5")
  (:PATH "raw/SPK-04/7593/core.fasl" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-04-writer-pool/out/7593/core.fasl")
   :BYTES 7308 :SHA256
   "5a03064c22b3c6990308c4e9867f85997f3c28d78bb575ceccbf89cc969f1ec4")
  (:PATH "raw/SPK-04/7593/parcheggi.fasl" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-04-writer-pool/out/7593/parcheggi.fasl")
   :BYTES 86726 :SHA256
   "d10916ef60e36a1f092cdb6c29f95c3bfc28aca90a2f5a5e965f8e9ec5dc6632")
  (:PATH "raw/SPK-04/7593/pool.fasl" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-04-writer-pool/out/7593/pool.fasl")
   :BYTES 96526 :SHA256
   "0950dbd0530aa1e5a8a22a49c9872100ad00535b719d244ae5ecba39271276a9")
  (:PATH "raw/SPK-05/7683/core.fasl" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-05-segment-read/out/7683/core.fasl")
   :BYTES 67977 :SHA256
   "04017a7034bbaf4c22985c647a41b9e6e8474bafc975b2d8788d24586770fc6e")
  (:PATH "raw/SPK-05/7683/io.fasl" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-05-segment-read/out/7683/io.fasl")
   :BYTES 62179 :SHA256
   "cc6c3b0706ea38c75ce6f0327b7d55b5e93588179eaa66b1802df98f6a128931")
  (:PATH "raw/SPK-05/7683/record.fasl" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-05-segment-read/out/7683/record.fasl")
   :BYTES 24806 :SHA256
   "88b662b223da132be6e2bdf00d067895b7f871d15ceb630959a2bfcf90f20876")
  (:PATH "raw/SPK-06/7752/controllore.fasl" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-06-compaction-load/out/7752/controllore.fasl")
   :BYTES 66791 :SHA256
   "895576f41b81e757442de8044f31b5e14f93afbaf1d54523b16d1238acc84163")
  (:PATH "raw/SPK-06/7752/core.fasl" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-06-compaction-load/out/7752/core.fasl")
   :BYTES 3283 :SHA256
   "f786ec24b2a586833b5871cc7f34f7f758eaaba36322dbacecd0fa87ad83f989")
  (:PATH "raw/SPK-06/7752/interferenza.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-06-compaction-load/out/7752/interferenza.fasl")
   :BYTES 102498 :SHA256
   "1414cd4f83e9e357b9d1aac6670e4eb9aa822e5340a8f8b956cad2099033e9a3")
  (:PATH "raw/SPK-06/7752/spk05-io.fasl" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-06-compaction-load/out/7752/spk05-io.fasl")
   :BYTES 62330 :SHA256
   "d5a2ba1dd570610a86914a907ffd80b23019349f87858659f59e597732488923")
  (:PATH "raw/SPK-06/7752/spk05-record.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-06-compaction-load/out/7752/spk05-record.fasl")
   :BYTES 24859 :SHA256
   "0ec4bc728e284ca9cdeb3a6ea9245ae6b01f781cef820edc3e0f8fc2460d3d37")
  (:PATH "raw/SPK-07/suite-4000914705-7831/byte-crash.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000914705-7831/byte-crash.fasl")
   :BYTES 114094 :SHA256
   "3925e78b2987b04ef82c88db2c1c2ec48c72a323f47bc5dc958938aca2a1b26f")
  (:PATH "raw/SPK-07/suite-4000914705-7831/compaction.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000914705-7831/compaction.fasl")
   :BYTES 86768 :SHA256
   "b33dc028451aed5554d350162c46fc0dda14688c5fb9741b481112f69e53d92e")
  (:PATH "raw/SPK-07/suite-4000914705-7831/core.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000914705-7831/core.fasl")
   :BYTES 64565 :SHA256
   "00fe1e7456347d945829656d0a6d701e04df8b5490af93c9c47c41f307d82846")
  (:PATH "raw/SPK-07/suite-4000914705-7831/foundation-batch.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000914705-7831/foundation-batch.fasl")
   :BYTES 9717 :SHA256
   "f6778fb109c32c4f1653d18b099a6ae07bc69a63323e5bdfa15fe78075383191")
  (:PATH "raw/SPK-07/suite-4000914705-7831/foundation-binary.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000914705-7831/foundation-binary.fasl")
   :BYTES 9123 :SHA256
   "f92d3f8f3e23fdf5635c737680be6c303d672b9995a5a6340b186983bb861a62")
  (:PATH "raw/SPK-07/suite-4000914705-7831/foundation-conditions.fasl" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000914705-7831/foundation-conditions.fasl")
   :BYTES 6412 :SHA256
   "ed585b19379c1f013e6bdd6921601f95f1567e220507ea020286786767ac10d9")
  (:PATH "raw/SPK-07/suite-4000914705-7831/foundation-crc32c.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000914705-7831/foundation-crc32c.fasl")
   :BYTES 4299 :SHA256
   "b6c51e65af3e78f7488d42a808aafd50ca6dddd2f72a187993b464ffbfabe77c")
  (:PATH "raw/SPK-07/suite-4000914705-7831/foundation-package.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000914705-7831/foundation-package.fasl")
   :BYTES 2130 :SHA256
   "eb2565fff624910a957071117dcaf5b99a9a69de13caa63a6ba37cdad7c4d181")
  (:PATH "raw/SPK-07/suite-4000914705-7831/foundation-record.fasl" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000914705-7831/foundation-record.fasl")
   :BYTES 36497 :SHA256
   "244c3f619bf38e2d1cf5fca16dac1c7fd271003491de4272ed98ca3e7ad43f12")
  (:PATH "raw/SPK-07/suite-4000914705-7831/memoria.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000914705-7831/memoria.fasl")
   :BYTES 17405 :SHA256
   "581fd9e4a1a4c5e81092e8ae73f3f109bb7258442941d914675f9e44cc50c221")
  (:PATH "raw/SPK-07/suite-4000914705-7831/pubblicazione.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000914705-7831/pubblicazione.fasl")
   :BYTES 86623 :SHA256
   "88b5ce2f4f8ad03bcc1e543ccce082593aad561d5b64e88ac315bdbdf6e4f352")
  (:PATH "raw/SPK-07/suite-4000914705-7831/root-package.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000914705-7831/root-package.fasl")
   :BYTES 1454 :SHA256
   "949f39c802a0e186d9fa72ac45fc85171d72ec62a210292e131cc090490a9982")
  (:PATH "raw/SPK-07/suite-4000914705-7831/scadenza.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000914705-7831/scadenza.fasl")
   :BYTES 85834 :SHA256
   "5a859d72d39aaa75b62130b493de75cd63ebc8d438fd84908be2ebf091b65100")
  (:PATH "raw/SPK-07/suite-4000914705-7831/seqlock-readers.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000914705-7831/seqlock-readers.fasl")
   :BYTES 79335 :SHA256
   "d42c0690a41867cca275e9433d8422bf025252124c522f02c09aa3e9f93d23e8")
  (:PATH "raw/SPK-07/suite-4000914705-7831/suite.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-07-protocols/out/suite-4000914705-7831/suite.fasl")
   :BYTES 3862 :SHA256
   "6012e95c34205b60c7dd99bcf6cc68d3ff890f954fa70a2cb8988dc93c47bdb2")
  (:PATH "raw/SPK-08/process-4000914716-8143/bitmap.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-08-generated-code/out/process-4000914716-8143/bitmap.fasl")
   :BYTES 23558 :SHA256
   "3175b9d809f35255d65a298f351a555039dec05aed427cbfc7013eb1a542a2b9")
  (:PATH "raw/SPK-08/process-4000914716-8143/core-bitmap.fasl" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-08-generated-code/out/process-4000914716-8143/core-bitmap.fasl")
   :BYTES 13278 :SHA256
   "e178e628f153961090a9dec3aaf85201a4b0966226282713b95aac66f4256993")
  (:PATH "raw/SPK-08/process-4000914716-8143/impronte.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-08-generated-code/out/process-4000914716-8143/impronte.fasl")
   :BYTES 68373 :SHA256
   "5a9a22e404efd3b0df0e3d33be5bce8adc66f01d44e3d38e3ebe11bee9ac2d1a")
  (:PATH "raw/SPK-08/process-4000914716-8143/simd.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-08-generated-code/out/process-4000914716-8143/simd.fasl")
   :BYTES 20602 :SHA256
   "707b2736792ef0e0e8e877beb3f0e03460ec7c98774a3e1a09cbfaa54830f488")
  (:PATH "raw/SPK-09/core.fasl" :SOURCE
   #A((101) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-09-integrity/out/core.fasl")
   :BYTES 115009 :SHA256
   "77f1c0c82a3492864963632f56d6f4a04e336b3fc81502804ed8a64b772c5394")
  (:PATH "raw/SPK-10/cbor.fasl" :SOURCE
   #A((101) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-10-v2-limits/out/cbor.fasl")
   :BYTES 83941 :SHA256
   "08400e58970133a00a83c5d25c0c248dfe4e62508b06e456dd2b58cce9d00bc7")
  (:PATH "raw/SPK-10/codec.fasl" :SOURCE
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-10-v2-limits/out/codec.fasl")
   :BYTES 81660 :SHA256
   "c547b71d4d85b025814d7fa2488344c287d8262996d6fc3d39c53ae1b341efb8")
  (:PATH "raw/SPK-10/core.fasl" :SOURCE
   #A((101) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-10-v2-limits/out/core.fasl")
   :BYTES 15818 :SHA256
   "b8c6ff9111b8432a250beba18c9a4cd0843fe1744e668c429e6c3a8101d5a1e9")
  (:PATH "raw/SPK-10/crc.fasl" :SOURCE
   #A((100) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-10-v2-limits/out/crc.fasl")
   :BYTES 115049 :SHA256
   "25f5f6927184e79fdbbd1153c65924d16de5350437e60441c78fa18f4bfc024f")
  (:PATH "raw/SPK-10/indice.fasl" :SOURCE
   #A((103) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-10-v2-limits/out/indice.fasl")
   :BYTES 154879 :SHA256
   "e543646ba57ac4de1138cf50bcc149a3ba4f9f31bcb1183737d653f18d9ba054")
  (:PATH "raw/SPK-10/migrazione.fasl" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/SPK-10-v2-limits/out/migrazione.fasl")
   :BYTES 81693 :SHA256
   "535f2e9df4fb64b83f708efa68d5e13545074d4d8ba44d0b9765a05202ac87d5")
  (:PATH "raw/core-compiler-fasl/src/active/package.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/active/package.fasl")
   :BYTES 1574 :SHA256
   "9938bb010366015e1c237085cc3f57da6edfdd01ae81a5dfe942c88216fa85bc")
  (:PATH "raw/core-compiler-fasl/src/active/preflight.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/active/preflight.fasl")
   :BYTES 4784 :SHA256
   "38fa0880d3cdab50b78eb32bf010bc9db76152f8435a3b9066338b944d7952b3")
  (:PATH "raw/core-compiler-fasl/src/active/prepare.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/active/prepare.fasl")
   :BYTES 5546 :SHA256
   "da6b727081895917751fab2e434e6d876fd8b45aa73ddce8532a7d462aaf5f55")
  (:PATH "raw/core-compiler-fasl/src/active/source.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/active/source.fasl")
   :BYTES 5200 :SHA256
   "0758b9a5c3f0c43f68f397e8cc00c3c73dca561e5db9975932230f51f173b407")
  (:PATH "raw/core-compiler-fasl/src/active/types.fasl" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/active/types.fasl")
   :BYTES 5961 :SHA256
   "5ec5c74a645f569ce74b3a6b654c33f09d0a42e884d87a0061a92c89784b2e99")
  (:PATH "raw/core-compiler-fasl/src/cache/build.fasl" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/cache/build.fasl")
   :BYTES 8835 :SHA256
   "693918d890d81dd0a0fb48116e7f7ed158949babcd41c26ea4b83bbcdaa8c092")
  (:PATH "raw/core-compiler-fasl/src/cache/clock.fasl" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/cache/clock.fasl")
   :BYTES 4876 :SHA256
   "087515ccb77701d647f7f95f9d6ba496db52a467698f96d342dfb912bcada54a")
  (:PATH "raw/core-compiler-fasl/src/cache/core.fasl" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/cache/core.fasl")
   :BYTES 7251 :SHA256
   "c66be468e0dd17e7b77ee52332c74613791d6884c8383e6c02555863edae793b")
  (:PATH "raw/core-compiler-fasl/src/cache/package.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/cache/package.fasl")
   :BYTES 1158 :SHA256
   "cb9b05e266b0e00f8b62f9e2479b41b1d44ab75eea0657075930bf151e17710e")
  (:PATH "raw/core-compiler-fasl/src/cache/read.fasl" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/cache/read.fasl")
   :BYTES 11949 :SHA256
   "f73e0531e1c2c0cd59f837e114e8b63f8f5ff84b5f24bef7de6ea67409cf7c51")
  (:PATH "raw/core-compiler-fasl/src/cache/types.fasl" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/cache/types.fasl")
   :BYTES 17976 :SHA256
   "d0dc6d830e4ed57a9da85b0d4690110b5dd8486b9c9aa239285763c54076ac03")
  (:PATH "raw/core-compiler-fasl/src/cache/write.fasl" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/cache/write.fasl")
   :BYTES 9815 :SHA256
   "b4635e93edd72660ad407610498b662ed1ac007982051e98ee1f1f80a2a2122d")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-float-minimal.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/codec/cbor-float-minimal.fasl")
   :BYTES 4218 :SHA256
   "bd5db90974def6f3d5e34caaabec23ac404c29d966a762096ebd55f498e8be4e")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-float-narrow.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/codec/cbor-float-narrow.fasl")
   :BYTES 5036 :SHA256
   "de697f51c6684be5adbed6c602a7fbd1fda40cc2f296d2e03e70e03b61d24e8b")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-float-write.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/codec/cbor-float-write.fasl")
   :BYTES 6786 :SHA256
   "8461fd448c8cb24b3457d42c5489fcf7456eefe487ab56945978a937e04d2e7e")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-header.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/codec/cbor-header.fasl")
   :BYTES 7368 :SHA256
   "1c6166c44fc5fc7448905a947fa9b19334948a7e6aa05933f9985e2b4f573260")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-minimal.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/codec/cbor-minimal.fasl")
   :BYTES 5456 :SHA256
   "9289ab656abc49f4604895be603edb2944125c2130ee91bd683f096f38792f93")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-package.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/codec/cbor-package.fasl")
   :BYTES 1159 :SHA256
   "b81a2981ea0c51cfc0c6b7e480fa4194e8bba02cc3ae4e3c1074b71b2656d3e5")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-scan-input.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/codec/cbor-scan-input.fasl")
   :BYTES 3441 :SHA256
   "0d57970681cab048eb54ce5265dfd74297b5c8111395e066bb7ab0d861f1ce99")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-scan-items.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/codec/cbor-scan-items.fasl")
   :BYTES 10647 :SHA256
   "abe8660291696c1a9f7a8632b5769a28da299658fa06181620fa39656182a9e1")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-scan-minimal.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/codec/cbor-scan-minimal.fasl")
   :BYTES 2917 :SHA256
   "097b16fbc58ab6b99e635e627ec908c79547e919f1c2e28938b45f8df3906363")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-scan-stack.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/codec/cbor-scan-stack.fasl")
   :BYTES 8006 :SHA256
   "3b0424f4604b8559beb885595fbdbb48b17db0c71712162f536328ece81d21e4")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-scan.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/codec/cbor-scan.fasl")
   :BYTES 8467 :SHA256
   "5c65bf4c336e027022267ba4b5e123e95f6031ad5a55a1c895019214584a813c")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-simple-write.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/codec/cbor-simple-write.fasl")
   :BYTES 3932 :SHA256
   "fc27e5459930202f114bc64e1e31e703e7f35acec7b734972facfde918ac9443")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-space.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/codec/cbor-space.fasl")
   :BYTES 11621 :SHA256
   "2bca00a0c9d2fea9cb9802d23e1ce9fabac52431e5d21932f60e2613802c5017")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-string-write.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/codec/cbor-string-write.fasl")
   :BYTES 9746 :SHA256
   "89d70ae970859bf204fcc492c21424659871f329ae6920edb4a497330ac39ef1")
  (:PATH "raw/core-compiler-fasl/src/codec/cbor-write.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/codec/cbor-write.fasl")
   :BYTES 6911 :SHA256
   "4d13e0d9fd8aaee0a7a4daa60ca7d90a91f5ffe1dbe3713cd63636b26ba14d27")
  (:PATH "raw/core-compiler-fasl/src/codec/package.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/codec/package.fasl")
   :BYTES 927 :SHA256
   "223f12d17bffdb161619b52acc7058c4928ff7a4d971ba6a3f5845d3088beb18")
  (:PATH "raw/core-compiler-fasl/src/codec/utf8.fasl" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/codec/utf8.fasl")
   :BYTES 8324 :SHA256
   "aac069e331b5c2774ee89b3ca969ed76956a46d2393d6e00061661e268625ccb")
  (:PATH "raw/core-compiler-fasl/src/control/build.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/control/build.fasl")
   :BYTES 8191 :SHA256
   "2139cde119f9eabb52f1fa73420ed07cbca94f4d649cdbbbfa7ad5a14e4ba9f7")
  (:PATH "raw/core-compiler-fasl/src/control/dependency.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/control/dependency.fasl")
   :BYTES 3980 :SHA256
   "a83cad74770a6936ea2c17411400880f43ddf0190f284d84e2c9ec9d88002ffc")
  (:PATH "raw/core-compiler-fasl/src/control/package.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/control/package.fasl")
   :BYTES 1890 :SHA256
   "7945c5ce62a05402a3cb21387a2e7b8ff80639fca767e3f21a358ba83cbd78eb")
  (:PATH "raw/core-compiler-fasl/src/control/preflight.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/control/preflight.fasl")
   :BYTES 5163 :SHA256
   "693791aed357e935c926cdbbdb19dd9e1b0a5eb20ee2267b2994e3e98bf135d6")
  (:PATH "raw/core-compiler-fasl/src/control/prepare.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/control/prepare.fasl")
   :BYTES 5544 :SHA256
   "c85f1ba58da0211cd4088648568943f8b6cea3b25578baa5f26b0c93cae026c2")
  (:PATH "raw/core-compiler-fasl/src/control/transfer.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/control/transfer.fasl")
   :BYTES 4868 :SHA256
   "e4c468ca83631d2a285ddb8b9b9347d25cd4daed27cf4cc360b9a27b52f32fb9")
  (:PATH "raw/core-compiler-fasl/src/control/types.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/control/types.fasl")
   :BYTES 14444 :SHA256
   "823b26eabc57a8657762d3c6b02588f0bad634ca10b649082e5e642da8dfec04")
  (:PATH "raw/core-compiler-fasl/src/csn/package.fasl" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/csn/package.fasl")
   :BYTES 960 :SHA256
   "66caf73c733f2840a56c97390cbff01ec6cd8b59aae3dde44139e809a7f96beb")
  (:PATH "raw/core-compiler-fasl/src/csn/registry.fasl" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/csn/registry.fasl")
   :BYTES 29087 :SHA256
   "748d5dca910f3198cb7f84c4ffcf4334f17902b8e79845f476ff99338af9abf6")
  (:PATH "raw/core-compiler-fasl/src/epochs/core.fasl" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/epochs/core.fasl")
   :BYTES 9442 :SHA256
   "987f0bd6a6300e61e983254ddd00bb742d6591b73dc9d3afb04f8adb5250aa6f")
  (:PATH "raw/core-compiler-fasl/src/epochs/package.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/epochs/package.fasl")
   :BYTES 1185 :SHA256
   "472692337250480185d9a95e726aa782e06465f7f814e490e63417bdd2b1ed22")
  (:PATH "raw/core-compiler-fasl/src/epochs/read.fasl" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/epochs/read.fasl")
   :BYTES 5281 :SHA256
   "49075eb869ef9519ce079f77e6a3b1c196c89a525b4a8769940d3262e19cc82f")
  (:PATH "raw/core-compiler-fasl/src/epochs/reclaim.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/epochs/reclaim.fasl")
   :BYTES 10791 :SHA256
   "63f53d4bc6b5080c51513865da12da82f3f5e8daef28bb8e92d57edc92c0ee19")
  (:PATH "raw/core-compiler-fasl/src/epochs/retire.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/epochs/retire.fasl")
   :BYTES 9400 :SHA256
   "33f2e066b55525172f72b290024c17fe412e7961ba889cf079964aafa52782af")
  (:PATH "raw/core-compiler-fasl/src/epochs/types.fasl" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/epochs/types.fasl")
   :BYTES 24006 :SHA256
   "c39f640efc11ab696b8c7152ad09927295c2086f313dbb5ef783243f5895b743")
  (:PATH "raw/core-compiler-fasl/src/execution/handoff.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/execution/handoff.fasl")
   :BYTES 15915 :SHA256
   "789b1a3f047741117b31b37931b7d3efc814349cdca6e6182b8925cf565f8591")
  (:PATH "raw/core-compiler-fasl/src/execution/package.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/execution/package.fasl")
   :BYTES 1596 :SHA256
   "313cff54f57eba1a617719792b2004d158c6cca3ef37320ddeab6701433614c8")
  (:PATH "raw/core-compiler-fasl/src/execution/queue.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/execution/queue.fasl")
   :BYTES 17770 :SHA256
   "4fd710851747f28c026a0c62d0f6fd59fa5011a1b97aeac086362b256149933e")
  (:PATH "raw/core-compiler-fasl/src/execution/ready-recycle.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/execution/ready-recycle.fasl")
   :BYTES 5155 :SHA256
   "704f7a3880fcd830fb7c220feb1ecfd87af849e1aa37eeae24b28ce441893edf")
  (:PATH "raw/core-compiler-fasl/src/execution/ready-types.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/execution/ready-types.fasl")
   :BYTES 14947 :SHA256
   "319876d4e47a9113ee8f1ac3c28527cbf5c1cae7743e1dd2350f22aac0046f75")
  (:PATH "raw/core-compiler-fasl/src/execution/ready.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/execution/ready.fasl")
   :BYTES 9693 :SHA256
   "ea283dee817d1dbc244c660a44db50ecc08607101fc543901936290b99707e60")
  (:PATH "raw/core-compiler-fasl/src/execution/worker-boundary.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/execution/worker-boundary.fasl")
   :BYTES 6411 :SHA256
   "c535991d0f4963ebacff4ced096abe778a39dc7840729d3dd5c3e1699330e508")
  (:PATH "raw/core-compiler-fasl/src/execution/worker-claim.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/execution/worker-claim.fasl")
   :BYTES 12421 :SHA256
   "0d95a1272b0bfc0581ba19ece0b03ece5b9502c8ff5fa1651d0a28b528ea566e")
  (:PATH "raw/core-compiler-fasl/src/execution/worker-run.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/execution/worker-run.fasl")
   :BYTES 9015 :SHA256
   "ff6b6e999be33ce1bfa910060eeffcf183c131b7a0ae16572bdc16e873fd91ef")
  (:PATH "raw/core-compiler-fasl/src/execution/worker-types.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/execution/worker-types.fasl")
   :BYTES 22071 :SHA256
   "4dd8d48c09a9d3281c4d060b3c16327ac6ecc60e42c7dd485726921ffc073e50")
  (:PATH "raw/core-compiler-fasl/src/execution/writer.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/execution/writer.fasl")
   :BYTES 8958 :SHA256
   "f7f77618151fc7a43c0994d1fdbae7455ce909912ecd61caa6db692090a5c219")
  (:PATH "raw/core-compiler-fasl/src/foundation/batch.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/foundation/batch.fasl")
   :BYTES 9657 :SHA256
   "d59df31ce5072516ced29b7e38c5e06fb68b9ab823034edd7f6d6af1016b3429")
  (:PATH "raw/core-compiler-fasl/src/foundation/binary.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/foundation/binary.fasl")
   :BYTES 9063 :SHA256
   "4bd7cb3c07f43ebf7e4442374549cb4e41a9f97efefc55fb132f92052535a6c3")
  (:PATH "raw/core-compiler-fasl/src/foundation/conditions.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/foundation/conditions.fasl")
   :BYTES 6257 :SHA256
   "feee0431234bf85509e2cf35da349117437e1f8baae246bb32fca24ffe4ca9a1")
  (:PATH "raw/core-compiler-fasl/src/foundation/crc32c.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/foundation/crc32c.fasl")
   :BYTES 4239 :SHA256
   "abe91f2acef640255d33f96be77e3bf05e2379dfc76a423555eb3fd63d9b69ce")
  (:PATH "raw/core-compiler-fasl/src/foundation/package.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/foundation/package.fasl")
   :BYTES 2070 :SHA256
   "3b43d7fbb8392bdba9952d74112fdd85e888918acbb66300eed953688fcb28b9")
  (:PATH "raw/core-compiler-fasl/src/foundation/record.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/foundation/record.fasl")
   :BYTES 36346 :SHA256
   "af86bf6c8f9f7458a53ea8bbdcaa4ddd17281c38077a8550bc6e57a890d166a5")
  (:PATH "raw/core-compiler-fasl/src/get-directory/build.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/get-directory/build.fasl")
   :BYTES 6172 :SHA256
   "27dd1036b11f5297a9cff8b18bebffa5d13e27556ad6b0869c7f0ff492334704")
  (:PATH "raw/core-compiler-fasl/src/get-directory/package.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/get-directory/package.fasl")
   :BYTES 2093 :SHA256
   "00a8e9dd2c96ec0dd16448cb97bc4ce6de2ebc58a31541c9126e0b8f1a9f1840")
  (:PATH "raw/core-compiler-fasl/src/get-directory/read.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/get-directory/read.fasl")
   :BYTES 7268 :SHA256
   "0b57db7a2621766c862ead1ff326e222e1891e6fa1d5579f7ef4adc2716df1aa")
  (:PATH "raw/core-compiler-fasl/src/get-directory/sources-read.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/get-directory/sources-read.fasl")
   :BYTES 8219 :SHA256
   "f91672473261316e15b57be35bc414cefd90a8bc48c348b6dd965a21b6056060")
  (:PATH "raw/core-compiler-fasl/src/get-directory/sources-types.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/get-directory/sources-types.fasl")
   :BYTES 10572 :SHA256
   "269da557ad50dbd2471f3d5a9cccf3622e2e03843afa5e9fb0424dd27e88c129")
  (:PATH "raw/core-compiler-fasl/src/get-directory/types.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/get-directory/types.fasl")
   :BYTES 7005 :SHA256
   "afa68afa0707a68b51f0c3fb00d169a6ea53d70a39445a5cd878d0e12ff95421")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/active-build.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/get-resolver/active-build.fasl")
   :BYTES 13941 :SHA256
   "9dc67bbbe5f53d1eaedb96299bb6a5d197e068aaaa2daa6ce9f0befb263ea640")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/active-directory.fasl"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/get-resolver/active-directory.fasl")
   :BYTES 6953 :SHA256
   "ec2887186a27fc45b20745499dfb2b3b8bc5697e814c6dce63de0d8ce81a25ca")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/active-preflight.fasl"
   :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/get-resolver/active-preflight.fasl")
   :BYTES 8993 :SHA256
   "c45ee450af6dafedd747e768595e991c4e85e0b12196bf7f698fbb4802435074")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/active-read.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/get-resolver/active-read.fasl")
   :BYTES 6863 :SHA256
   "0effb1521c3dcc0293622c0246b2485fc8c02dab1fab72166da154c228474533")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/active-scan.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/get-resolver/active-scan.fasl")
   :BYTES 8207 :SHA256
   "81392423d74454cf7544c36f91f2cdeca774d3f5805b78b88b385982a0d3d83b")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/active-types.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/get-resolver/active-types.fasl")
   :BYTES 17180 :SHA256
   "e886222cdccf14fb7ee2900b600363116c35768eb8c78f9060e8254ef8de284f")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/build.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/get-resolver/build.fasl")
   :BYTES 10736 :SHA256
   "62b87438f105450ad210ca94b9ccbaca1c92be8367790607be08aba7adb126e6")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/package.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/get-resolver/package.fasl")
   :BYTES 2594 :SHA256
   "20a447e0ba9d3ec03e5334663d429658471b9a72dbc0cdb408da71aeb102e52c")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/read.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/get-resolver/read.fasl")
   :BYTES 10499 :SHA256
   "4408e8f7de4991e4b9ce53ec4b66cb75244380c6f77c6cdc6601568cb25d1eaf")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/rows.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/get-resolver/rows.fasl")
   :BYTES 5846 :SHA256
   "de4582167e6127204adb87845b6cfe75c84959999fede4be306b006bf76a1ca8")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/scan.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/get-resolver/scan.fasl")
   :BYTES 10724 :SHA256
   "f8c83a9f689eb34550155af2e13d54f4fd056c63b359a5c5bbff046a6d3600a3")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/sort.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/get-resolver/sort.fasl")
   :BYTES 9371 :SHA256
   "ffff8468d078c07ce22d0539b2334471d00cb45d8f441338a9ff4c821629883b")
  (:PATH "raw/core-compiler-fasl/src/get-resolver/types.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/get-resolver/types.fasl")
   :BYTES 7418 :SHA256
   "97ba1f4256c15c68b8ee038e89992fea1bdbbb53e748beb94e5e5251a8a29054")
  (:PATH "raw/core-compiler-fasl/src/get/build.fasl" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/get/build.fasl")
   :BYTES 6726 :SHA256
   "795113ad8c4caebbfb9e50216dc2aa73761104307bc8bb400cb63ed9848e799d")
  (:PATH "raw/core-compiler-fasl/src/get/lifecycle.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/get/lifecycle.fasl")
   :BYTES 8667 :SHA256
   "fee44a4c145ff7a06d661ba86b65dc5161b8b66156c78f1931c49356af9e1eba")
  (:PATH "raw/core-compiler-fasl/src/get/lookup.fasl" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/get/lookup.fasl")
   :BYTES 11187 :SHA256
   "fef2c5980a16533c5ac7fa429ae3c8fb3d772a02905a4aebf7f58ee80084eab6")
  (:PATH "raw/core-compiler-fasl/src/get/package.fasl" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/get/package.fasl")
   :BYTES 2150 :SHA256
   "47ca1026eb0beab2cf17409946f70a0d3a5879d1628c7f27d59c61127afb22b5")
  (:PATH "raw/core-compiler-fasl/src/get/segment.fasl" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/get/segment.fasl")
   :BYTES 10547 :SHA256
   "3b974592b337a9c19a42be4ceadf59a49d25f5543ba963090e1d863b653f3ac2")
  (:PATH "raw/core-compiler-fasl/src/get/target.fasl" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/get/target.fasl")
   :BYTES 7792 :SHA256
   "c621d0d5701322349533c52bc10ae146c803180ff9afda798fbb30000350796c")
  (:PATH "raw/core-compiler-fasl/src/get/types.fasl" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/get/types.fasl")
   :BYTES 30900 :SHA256
   "a323b97360b9dc4598afe066738c92e9143f21ab4db880439c5992f8e4a519c6")
  (:PATH "raw/core-compiler-fasl/src/hash/arithmetic.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/hash/arithmetic.fasl")
   :BYTES 7668 :SHA256
   "2db0cb94cf22468afbf5a6ac95a2a97aab0c68b70088fab8dab6ef2219662365")
  (:PATH "raw/core-compiler-fasl/src/hash/blocks.fasl" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/hash/blocks.fasl")
   :BYTES 8279 :SHA256
   "4571f66c3ebac5dc5c84af5233f00d5882102f7f61a0acdc2f37d660ad61525b")
  (:PATH "raw/core-compiler-fasl/src/hash/hash64.fasl" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/hash/hash64.fasl")
   :BYTES 6628 :SHA256
   "1df475043652803d2f9e25dcdf084811cc4daf572d5d7e99d9c5d7294a5d0564")
  (:PATH "raw/core-compiler-fasl/src/hash/package.fasl" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/hash/package.fasl")
   :BYTES 935 :SHA256
   "6d144712b025dcb8b3e9928b5d404a297ab6e8dba54e717e322cec8f0c66a8d9")
  (:PATH "raw/core-compiler-fasl/src/index/core.fasl" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/index/core.fasl")
   :BYTES 6171 :SHA256
   "d8481e727d4077b4a9a96d1774dfaf2fa2b79d8134f905bbf97de77abc1805a2")
  (:PATH "raw/core-compiler-fasl/src/index/hash-digests.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/index/hash-digests.fasl")
   :BYTES 6088 :SHA256
   "545b79f7d8a53b8656f9d2a8638b172aebf85b7790334d509505d19836f798b8")
  (:PATH "raw/core-compiler-fasl/src/index/hash-seed.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/index/hash-seed.fasl")
   :BYTES 5120 :SHA256
   "85aa941ff7182ed0c58924266a997fde75bdba30e0e37ca869e7caa6b6c05479")
  (:PATH "raw/core-compiler-fasl/src/index/package.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/index/package.fasl")
   :BYTES 1130 :SHA256
   "d64ae6c62717e262850944e5627db63a10ad50c9cf0944f34ccb56b370fb731f")
  (:PATH "raw/core-compiler-fasl/src/index/primary-arena.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/index/primary-arena.fasl")
   :BYTES 6810 :SHA256
   "be90703ff31e9d4b845a0f77fb26192f49280b9eda96d86d7cb376972c837aaf")
  (:PATH "raw/core-compiler-fasl/src/index/primary-build.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/index/primary-build.fasl")
   :BYTES 10583 :SHA256
   "077ccbcf09d735e1558b80b16b4cdd19062270f70c1e4e71a519ad231c30084d")
  (:PATH "raw/core-compiler-fasl/src/index/primary-core.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/index/primary-core.fasl")
   :BYTES 8736 :SHA256
   "71c93568cac9d4ef7d53d01093726f9bd8fe6ff3e486880a26cb95d5dd2fce3f")
  (:PATH "raw/core-compiler-fasl/src/index/primary-directory.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/index/primary-directory.fasl")
   :BYTES 14220 :SHA256
   "7491c78cb13c8390ce708a193f31b15902d04d016dfda235c706be89aca6e60d")
  (:PATH "raw/core-compiler-fasl/src/index/primary-package.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/index/primary-package.fasl")
   :BYTES 1705 :SHA256
   "7becf3b53fa3a7d05da301ea01e6d1ba9c7e69d9153e2b995fbf370f77c54dc6")
  (:PATH "raw/core-compiler-fasl/src/index/primary-probe.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/index/primary-probe.fasl")
   :BYTES 13326 :SHA256
   "4d2d2e335d0399c763b727f46e3c892591204d4c185c5960cb4c8b71d3be074b")
  (:PATH "raw/core-compiler-fasl/src/index/primary-read.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/index/primary-read.fasl")
   :BYTES 7529 :SHA256
   "d02925ba05605e898bc2ef6fa9c9f44e0521a9452d6cd40cbd9e33842084d27e")
  (:PATH "raw/core-compiler-fasl/src/index/primary-relocate.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/index/primary-relocate.fasl")
   :BYTES 9157 :SHA256
   "5e4406e4c33ffe5d492d343068a619479a93d62a18ad7438532e7258b3e0a484")
  (:PATH "raw/core-compiler-fasl/src/index/primary-types.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/index/primary-types.fasl")
   :BYTES 36204 :SHA256
   "751ad6082bc906c2eb241dd93a61897065831027e4500974187a2177d7a181b2")
  (:PATH "raw/core-compiler-fasl/src/index/primary-write.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/index/primary-write.fasl")
   :BYTES 15719 :SHA256
   "d5d2ee6e15b98592d5309e891addc71b47b250be64a7aab94445f484a12179ab")
  (:PATH "raw/core-compiler-fasl/src/index/read.fasl" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/index/read.fasl")
   :BYTES 7184 :SHA256
   "eca8cb3eb3c464dc353ed71f868013da95592036eaa7820ece02eb0efe030ad0")
  (:PATH "raw/core-compiler-fasl/src/index/rebuild-budget.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/index/rebuild-budget.fasl")
   :BYTES 6550 :SHA256
   "d096727d158aefa687a193b820eaaaaa2f85cddbe4e36cc017c62a377c1e3cac")
  (:PATH "raw/core-compiler-fasl/src/index/rebuild-copy.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/index/rebuild-copy.fasl")
   :BYTES 8093 :SHA256
   "a24916512c32948918c851eebe88c02936f712a74ad132b407423c5f5dcf28e2")
  (:PATH "raw/core-compiler-fasl/src/index/rebuild-scan.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/index/rebuild-scan.fasl")
   :BYTES 12563 :SHA256
   "7dc5f628f81e10572095da961b8717204f26073f763e5614815476a4f638712f")
  (:PATH "raw/core-compiler-fasl/src/index/rebuild.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/index/rebuild.fasl")
   :BYTES 4503 :SHA256
   "cd1720d69c86eb85e5565bdb5e49575c21c0c9362683fcbf28f10ee3f6b2777f")
  (:PATH "raw/core-compiler-fasl/src/index/relocate.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/index/relocate.fasl")
   :BYTES 6671 :SHA256
   "dba0bd0b930998faaf5a722d94d228bf74b4fb6e56a314fe18140bd9549d78d5")
  (:PATH "raw/core-compiler-fasl/src/index/types.fasl" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/index/types.fasl")
   :BYTES 9925 :SHA256
   "50833414b1ecb193e8228c1d6dd00238665aafb886577b2e9c3825283a4fd43d")
  (:PATH "raw/core-compiler-fasl/src/index/validation.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/index/validation.fasl")
   :BYTES 9594 :SHA256
   "e27d8da8f2f649b912c783a6f9cb082fae1fa23bdefe576f575abf39375a38a3")
  (:PATH "raw/core-compiler-fasl/src/index/write.fasl" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/index/write.fasl")
   :BYTES 12504 :SHA256
   "0b972d8a747893ce11a1647fa9ce2f206d5446949247809cc5b40c3180905ab7")
  (:PATH "raw/core-compiler-fasl/src/io/flush.fasl" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/io/flush.fasl")
   :BYTES 3543 :SHA256
   "85b396b152b78c6e3d81b2180f233d3bb71bad19bc6a45e62b3b10b2e24d12b0")
  (:PATH "raw/core-compiler-fasl/src/io/identity-types.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/io/identity-types.fasl")
   :BYTES 4456 :SHA256
   "27836ecb580bcaefcfd4371cfd9e0e90d8cd7faf7720711528eee910b92c613a")
  (:PATH "raw/core-compiler-fasl/src/io/identity.fasl" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/io/identity.fasl")
   :BYTES 7728 :SHA256
   "2a4484c2b5a74641fcdde4b394e62a866c2bd0fc3ea16f6714a529ffb37f24c7")
  (:PATH "raw/core-compiler-fasl/src/io/lifecycle.fasl" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/io/lifecycle.fasl")
   :BYTES 10839 :SHA256
   "3e231ea3d83ab46e47fa1de1ee5bf7b9885a72d3e847fd8795ab6bd9b37e2196")
  (:PATH "raw/core-compiler-fasl/src/io/native.fasl" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/io/native.fasl")
   :BYTES 22490 :SHA256
   "6b02d225fb9e872a64ab54ffe3a40f5d929012a42216a428d2e35def78d8e95e")
  (:PATH "raw/core-compiler-fasl/src/io/package.fasl" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/io/package.fasl")
   :BYTES 1274 :SHA256
   "d0d82a0c33d82bfb89c86e2d7524cf36f4d522b119150b8573d31274593dfe51")
  (:PATH "raw/core-compiler-fasl/src/io/transfer.fasl" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/io/transfer.fasl")
   :BYTES 14005 :SHA256
   "0a23d3d4a41bc400e07b07a5ec0c62d95a691f3f941c2accbd3a7f14a9500c3f")
  (:PATH "raw/core-compiler-fasl/src/io/types.fasl" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/io/types.fasl")
   :BYTES 21751 :SHA256
   "eb5e0a51111eb5ba6f81c4c5252f9f356ed583201df83060e23f0c8bdd3babad")
  (:PATH "raw/core-compiler-fasl/src/mvcc/package.fasl" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/mvcc/package.fasl")
   :BYTES 1298 :SHA256
   "bdfd910f320b0f26482691fe10363be8b91ee32e71344537b8d344758d96a740")
  (:PATH "raw/core-compiler-fasl/src/mvcc/snapshots-core.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/mvcc/snapshots-core.fasl")
   :BYTES 11931 :SHA256
   "9cdb2df4aec93c7c7a1a794b6005b59d32b4a0a0165dc8812d8dd517fb2964fa")
  (:PATH "raw/core-compiler-fasl/src/mvcc/snapshots-csn.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/mvcc/snapshots-csn.fasl")
   :BYTES 6257 :SHA256
   "1b885a2206b444ad60e43a882358c35c73b37996635f799019444cbb79fbcd26")
  (:PATH "raw/core-compiler-fasl/src/mvcc/snapshots-lifecycle.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/mvcc/snapshots-lifecycle.fasl")
   :BYTES 10468 :SHA256
   "3226e97e933e3880ad486087d5d2c20324fa4cd948bf9c8bb1c37b02d5401126")
  (:PATH "raw/core-compiler-fasl/src/mvcc/snapshots-read.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/mvcc/snapshots-read.fasl")
   :BYTES 13692 :SHA256
   "8fca6c7eb997c592f2a97af415dffd24e946430feb74a8e93c726e94d03d5c5e")
  (:PATH "raw/core-compiler-fasl/src/mvcc/snapshots-register.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/mvcc/snapshots-register.fasl")
   :BYTES 10002 :SHA256
   "198ccca38689d2a3dedcad85e25de9369bc4d4ffc4c0d9aafb22db0084fd5853")
  (:PATH "raw/core-compiler-fasl/src/mvcc/snapshots-types.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/mvcc/snapshots-types.fasl")
   :BYTES 21768 :SHA256
   "a60a5e3bd1a4281d6e727d353ca8ab3721ceb759f9595ec9396c6f84e47f814e")
  (:PATH "raw/core-compiler-fasl/src/mvcc/types.fasl" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/mvcc/types.fasl")
   :BYTES 1382 :SHA256
   "d9cb220a27793aadba902c88f066fcab9f12d516279e9be3d401836a3b69d1df")
  (:PATH "raw/core-compiler-fasl/src/package.fasl" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/package.fasl")
   :BYTES 1394 :SHA256
   "27f5deb901a81dba6fccede5130a57dcf6fc7b6a914495926c7713609e18a68e")
  (:PATH "raw/core-compiler-fasl/src/read/core.fasl" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/read/core.fasl")
   :BYTES 6228 :SHA256
   "605bc9647714b47e803e15d191d4240c513fba3071706463a67ba39ec7245c82")
  (:PATH "raw/core-compiler-fasl/src/read/package.fasl" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/read/package.fasl")
   :BYTES 1190 :SHA256
   "6aac8b5767679138f09cb04eb606cb9849047e65d455daf24366c24eea62e202")
  (:PATH "raw/core-compiler-fasl/src/read/task.fasl" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/read/task.fasl")
   :BYTES 14094 :SHA256
   "557a5cb05e88c62aba4b8c5e52d186b17bb8ba198f39cba037f8472275b94c00")
  (:PATH "raw/core-compiler-fasl/src/read/types.fasl" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/read/types.fasl")
   :BYTES 9766 :SHA256
   "c0365470eed2f0ab4b63dc4c107064c2fdfc5d9f14280c45e58292b856d9cbc0")
  (:PATH "raw/core-compiler-fasl/src/recovery/decisions-build.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/recovery/decisions-build.fasl")
   :BYTES 17717 :SHA256
   "7646c184b633d27664992ff20f3764d4b98d5af14766c83aa145cfcc013aa8b3")
  (:PATH "raw/core-compiler-fasl/src/recovery/decisions-package.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/recovery/decisions-package.fasl")
   :BYTES 1289 :SHA256
   "b253e403dc5aa60425b90ec2de191d63e3940691b5a9a161e222c76da3ae0c92")
  (:PATH "raw/core-compiler-fasl/src/recovery/decisions-query.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/recovery/decisions-query.fasl")
   :BYTES 7470 :SHA256
   "c76e01b94badcb91f8fd979f04c5ee59154cba88851b3b4db4a46b141a98fe2d")
  (:PATH "raw/core-compiler-fasl/src/recovery/decisions-radix.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/recovery/decisions-radix.fasl")
   :BYTES 14778 :SHA256
   "77a7e35dd96933cd3dff27cc09c66a770e501f1a012c2dbc90c185f85ed9e4ff")
  (:PATH "raw/core-compiler-fasl/src/recovery/decisions-sort.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/recovery/decisions-sort.fasl")
   :BYTES 14171 :SHA256
   "fa1043706891717f7fe7fd2a8399f23b46317e44f943de9a8f11be133c1dbe36")
  (:PATH "raw/core-compiler-fasl/src/recovery/decisions-types.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/recovery/decisions-types.fasl")
   :BYTES 11068 :SHA256
   "aef35fb9e3e8f9dd50fc48c9224b198b02d19308d99f2dcf6dce0d2b5c272172")
  (:PATH "raw/core-compiler-fasl/src/recovery/inventory-build.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/recovery/inventory-build.fasl")
   :BYTES 14460 :SHA256
   "d8e13f835cb0f77ab1dd3f1ee6ded5387d25cce08fde6c203493a64dd9343276")
  (:PATH "raw/core-compiler-fasl/src/recovery/inventory-query.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/recovery/inventory-query.fasl")
   :BYTES 3807 :SHA256
   "6260dfbdfaf55d10d00e0a714cbdb639ae8f34ac1798923c1579915c1e01307d")
  (:PATH "raw/core-compiler-fasl/src/recovery/inventory-types.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/recovery/inventory-types.fasl")
   :BYTES 14855 :SHA256
   "31e1e253053adfc6261d98d49906cb0c949cb06b509fb2fe99312a13ac7d0fc5")
  (:PATH "raw/core-compiler-fasl/src/recovery/manifest-build.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/recovery/manifest-build.fasl")
   :BYTES 15454 :SHA256
   "84f695f9aa460ab7fd58270dded524e7e2bb3efb299368dba96ae193e4ed3baf")
  (:PATH "raw/core-compiler-fasl/src/recovery/manifest-decode.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/recovery/manifest-decode.fasl")
   :BYTES 10742 :SHA256
   "8d3648d5f384d7b8ab2846403d9de7e56800ec63d91bc9aa3fea441675f52e65")
  (:PATH "raw/core-compiler-fasl/src/recovery/manifest-fold.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/recovery/manifest-fold.fasl")
   :BYTES 14539 :SHA256
   "471611c411089cb9ce1cdda74125a07858b088babb0c1efaaa289f7128e35392")
  (:PATH "raw/core-compiler-fasl/src/recovery/manifest-package.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/recovery/manifest-package.fasl")
   :BYTES 1726 :SHA256
   "5368ecb6ea3737719d1dec71e1b7272dd05b45f6084beafe1453b636654d1224")
  (:PATH "raw/core-compiler-fasl/src/recovery/manifest-query.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/recovery/manifest-query.fasl")
   :BYTES 6799 :SHA256
   "57aea062f2ee4582794d8fb5effdb227094a00ce40f22c3622f65a2be76e6cfd")
  (:PATH "raw/core-compiler-fasl/src/recovery/manifest-types.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/recovery/manifest-types.fasl")
   :BYTES 30408 :SHA256
   "1d56291a6fecc94790e37dee15314181d312f6a83031fe1ef46de42b498c6d0d")
  (:PATH "raw/core-compiler-fasl/src/recovery/package.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/recovery/package.fasl")
   :BYTES 1332 :SHA256
   "4dc96975c4ba708885de9409bf453d2d9befe4d3ed5ae5c8f9e7ab0fc4cb7b82")
  (:PATH "raw/core-compiler-fasl/src/recovery/scan.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/recovery/scan.fasl")
   :BYTES 25441 :SHA256
   "fc8380425600ca0382c53f90721cd469040263e7dcc498a881590b365edab4a6")
  (:PATH "raw/core-compiler-fasl/src/scheduler/build.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/scheduler/build.fasl")
   :BYTES 4093 :SHA256
   "e1f1c8a48607d6db431a1f97a24a92d0fad832d53de5da7d66b04d585abd628d")
  (:PATH "raw/core-compiler-fasl/src/scheduler/lifecycle-build.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/scheduler/lifecycle-build.fasl")
   :BYTES 6598 :SHA256
   "94baa8981bfb483906e752e3ed45a736d01ae57a91d79e088e566d1ef6499bae")
  (:PATH "raw/core-compiler-fasl/src/scheduler/lifecycle-read.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/scheduler/lifecycle-read.fasl")
   :BYTES 4481 :SHA256
   "f4543159a14bada7738386595d8fb2eb3db145ee1babb8624e36e66e07f9c0e4")
  (:PATH "raw/core-compiler-fasl/src/scheduler/lifecycle-types.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/scheduler/lifecycle-types.fasl")
   :BYTES 13327 :SHA256
   "08974d2aed026ba853528da45c8739141fb73114d3792cd97c756617041b54f7")
  (:PATH "raw/core-compiler-fasl/src/scheduler/lifecycle-update.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/scheduler/lifecycle-update.fasl")
   :BYTES 5718 :SHA256
   "3a90289a26b368d2b1ca62cad97d6de17669957e2ff9e5d29263004d49b0353f")
  (:PATH "raw/core-compiler-fasl/src/scheduler/lifecycle-worker.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/scheduler/lifecycle-worker.fasl")
   :BYTES 3550 :SHA256
   "f6b4c28cd99eb17ce658fa2f096bc260bb5000fdbe6cd3d0b25c979c6b0ff1f1")
  (:PATH "raw/core-compiler-fasl/src/scheduler/package.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/scheduler/package.fasl")
   :BYTES 1113 :SHA256
   "0657a678a21340525e837f630c11fe87efd389207828a8d5a3426b480392fd99")
  (:PATH "raw/core-compiler-fasl/src/scheduler/policy.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/scheduler/policy.fasl")
   :BYTES 4406 :SHA256
   "7c8863411db0e998bc286c2a43d989348e117c42b380b4fd0dc0652c3aeb0c1a")
  (:PATH "raw/core-compiler-fasl/src/scheduler/read.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/scheduler/read.fasl")
   :BYTES 3323 :SHA256
   "20dcd759a532e7d147a94895c5c730951736424ea6dc6112740894c84dd82156")
  (:PATH "raw/core-compiler-fasl/src/scheduler/types.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/scheduler/types.fasl")
   :BYTES 16598 :SHA256
   "2e1b7b6d923c2498cb7a404281bfe8a6f463967c26f33a546563183127ab4cf9")
  (:PATH "raw/core-compiler-fasl/src/scheduler/update.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/scheduler/update.fasl")
   :BYTES 4724 :SHA256
   "13da6d212e307d476933243136795b545746f480808254405ede0901fea0995e")
  (:PATH "raw/core-compiler-fasl/src/series/events.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/series/events.fasl")
   :BYTES 17552 :SHA256
   "7eb8034c65f1f57ca2191ba33432f7efb7b529def830ba8a2759791a64af9699")
  (:PATH "raw/core-compiler-fasl/src/series/io-events.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/series/io-events.fasl")
   :BYTES 8382 :SHA256
   "c93ba58004bdbd4efbbc8f8e73bdc95a7a490a20d295396bf4006f14821e289c")
  (:PATH "raw/core-compiler-fasl/src/series/ownership.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/series/ownership.fasl")
   :BYTES 13652 :SHA256
   "eff00595f1a8720500bbe954f388ad05077194cd2e716c26ba389a372629ef96")
  (:PATH "raw/core-compiler-fasl/src/series/package.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/series/package.fasl")
   :BYTES 1712 :SHA256
   "c3f56e82121fd905db6eea52a17c7959a2cece72119556e2c3af7a2f4201003c")
  (:PATH "raw/core-compiler-fasl/src/series/publication.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/series/publication.fasl")
   :BYTES 11499 :SHA256
   "f7b34d39904e15e74e07a3586d45232e8000974610c2aef513010060f09721fe")
  (:PATH "raw/core-compiler-fasl/src/series/query.fasl" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/series/query.fasl")
   :BYTES 6488 :SHA256
   "3a97b46c78d14ef4b5ac785fb440c1c8e3e541ee1a9ce2c31f704382386a7a16")
  (:PATH "raw/core-compiler-fasl/src/series/retirement.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/series/retirement.fasl")
   :BYTES 8204 :SHA256
   "ba8fc8adefdcb1c20188efa303ddc51e3e14e189797e481f129bba8cda53250b")
  (:PATH "raw/core-compiler-fasl/src/series/routing-build.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/series/routing-build.fasl")
   :BYTES 6407 :SHA256
   "e8c466c3b624c020f18acf579ba1b7de8f4478a3f4cf4150a4e2e918d9fb11fa")
  (:PATH "raw/core-compiler-fasl/src/series/routing-select.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/series/routing-select.fasl")
   :BYTES 6865 :SHA256
   "45bf5dc379f2b68b9fb12b778df46c99691e85486e67f058b91e255263f3d466")
  (:PATH "raw/core-compiler-fasl/src/series/routing-types.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/series/routing-types.fasl")
   :BYTES 9264 :SHA256
   "f9069f6767c870f5b325956606ae88b10f83f0c31fad0d760f47944aa0d32f69")
  (:PATH "raw/core-compiler-fasl/src/series/types.fasl" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/series/types.fasl")
   :BYTES 34003 :SHA256
   "c071949491fda1b0fc8c3f3fc44459d3e0ffaeb4b7dde3fbb5cc5cd49ec77ddd")
  (:PATH "raw/core-compiler-fasl/src/series/worker-boundary.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/series/worker-boundary.fasl")
   :BYTES 7840 :SHA256
   "0f6b7c97753cfa54811ea79754f4245f5244e4e044be31a940ee27656b6bd833")
  (:PATH "raw/core-compiler-fasl/src/series/worker-package.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/series/worker-package.fasl")
   :BYTES 1581 :SHA256
   "063acbd288edde2895711e5a2970aa17ad0d7f8413ac10a7056c672682280a65")
  (:PATH "raw/core-compiler-fasl/src/series/worker-run.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/series/worker-run.fasl")
   :BYTES 15252 :SHA256
   "b4513313edd40be0b584269092ea31d099084cb9720fe96f69990869c16dcadb")
  (:PATH "raw/core-compiler-fasl/src/series/worker-types.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/series/worker-types.fasl")
   :BYTES 17258 :SHA256
   "70c3f384fb87361a0923aad7020ba2d783e34f4159299289d6376750796a8ab1")
  (:PATH "raw/core-compiler-fasl/src/storage/compaction-scan.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/storage/compaction-scan.fasl")
   :BYTES 8278 :SHA256
   "c0aa438cf6c153d2e65d41a62e215997f193da640fbaa9492612ab3356928d39")
  (:PATH "raw/core-compiler-fasl/src/storage/control-payload.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/storage/control-payload.fasl")
   :BYTES 12124 :SHA256
   "5211920c2c2697fbf12679d993b7a9a516fe694f0890a274d6bf21336987fcfd")
  (:PATH "raw/core-compiler-fasl/src/storage/formats.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/storage/formats.fasl")
   :BYTES 8576 :SHA256
   "3b2b2bf8f5597ad35dd0c73628360ab6a9a9002a90f3d9e64687e7bd9421e0ab")
  (:PATH "raw/core-compiler-fasl/src/storage/log-header.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/storage/log-header.fasl")
   :BYTES 7964 :SHA256
   "a0c85db56e907daf8958e3fe5e9642da5348ee3b95c5144dd07b7ff02e67e4f6")
  (:PATH "raw/core-compiler-fasl/src/storage/package.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/storage/package.fasl")
   :BYTES 1490 :SHA256
   "4752a7175acc5dd27e3650ffe8a8afe17c5a377e222588caebc3cd599dff4875")
  (:PATH "raw/core-compiler-fasl/src/storage/payload-record.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/storage/payload-record.fasl")
   :BYTES 6741 :SHA256
   "22a133ca5e14b8a7c7fbb1bdb223b42829fbec3712fc1c261b15f8b8f5d20559")
  (:PATH "raw/core-compiler-fasl/src/storage/payload-write.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/storage/payload-write.fasl")
   :BYTES 9541 :SHA256
   "a7926f3e7040c651925d8980907cd0e443e3e3c47cabaccefdc39289fd739afb")
  (:PATH "raw/core-compiler-fasl/src/storage/segment-header.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/storage/segment-header.fasl")
   :BYTES 10304 :SHA256
   "11d5ba28af8e168fc67d3f7ad043b48fbb5d6e882f0079b276230723dd6d2087")
  (:PATH "raw/core-compiler-fasl/src/wal/builder.fasl" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/wal/builder.fasl")
   :BYTES 14587 :SHA256
   "7c8296b7e4cee7a8c153f16ca0560940015eec79fd746735054ad7026f260296")
  (:PATH "raw/core-compiler-fasl/src/wal/csn.fasl" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/wal/csn.fasl")
   :BYTES 16427 :SHA256
   "21976fe3505ba03c664e61fbe6055ddb438e1c7a93d7f29ec90cbb32a0e7d18f")
  (:PATH "raw/core-compiler-fasl/src/wal/executor.fasl" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/wal/executor.fasl")
   :BYTES 13794 :SHA256
   "a50a855c551664597971372a2153f0a13bb2f503835741853e7f517445f4896e")
  (:PATH "raw/core-compiler-fasl/src/wal/group.fasl" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/wal/group.fasl")
   :BYTES 11022 :SHA256
   "cd70096d98e3e4b5f9a9989ce6ed535f7a07050117ad9668aeb317681a3df013")
  (:PATH "raw/core-compiler-fasl/src/wal/package.fasl" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/wal/package.fasl")
   :BYTES 2115 :SHA256
   "7f6b94220c6224bdb88e4108268a597a281a03ed23b20c422d457ada87b81942")
  (:PATH "raw/core-compiler-fasl/src/wal/types.fasl" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/src/wal/types.fasl")
   :BYTES 38881 :SHA256
   "98e72c88fee4a8c774984367bf7af673a0fde4e35c1f8cf257f407d9794617ff")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-float-write-support.fasl"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/codec/cbor-float-write-support.fasl")
   :BYTES 30009 :SHA256
   "d98480aa793846f94887757c3386e04c09b6f488bc22d866b124f1cd254905ef")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-float-write-threads.fasl"
   :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/codec/cbor-float-write-threads.fasl")
   :BYTES 8173 :SHA256
   "33da4e37b5be0653e5b48f9f6148e874129161c9ee6a6feaa34efec4447cbe95")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-float-write.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/codec/cbor-float-write.fasl")
   :BYTES 40109 :SHA256
   "6173fb17d31f0d4f7535e1ea0c2c0e26af2afba71e8b2de0af16c86d271b31c9")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-header.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/codec/cbor-header.fasl")
   :BYTES 22701 :SHA256
   "339a6c602bd54159e7cc5d87fcce08d0cb94708fbb65e7a4cab3302739396dbd")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-minimal-edges.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/codec/cbor-minimal-edges.fasl")
   :BYTES 3129 :SHA256
   "24dc0890c353ee2342ff44a0a4691214d8aaa428eaed1ccd8e9f1d5b20c01593")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-minimal-scan-support.fasl"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/codec/cbor-minimal-scan-support.fasl")
   :BYTES 30220 :SHA256
   "2141f44c5aa1a2882b1a0bfe3457aa5257b7e6525a803c39770c7e4e1cedae1f")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-minimal-scan-threads.fasl"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/codec/cbor-minimal-scan-threads.fasl")
   :BYTES 9312 :SHA256
   "896730c1f26692796187a2e2339936cab00f1ca9e3cbff71b3f3e194a122ade3")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-minimal-scan.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/codec/cbor-minimal-scan.fasl")
   :BYTES 33513 :SHA256
   "a3c2058013c358ef1e8f903bcc38e365b53e4f7b1f4addbec5f78872d45643f9")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-minimal-support.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/codec/cbor-minimal-support.fasl")
   :BYTES 23885 :SHA256
   "bf6d8f725129335f8c5936089de1cc22957192e3216a8a63648d037c194a89ba")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-minimal-threads.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/codec/cbor-minimal-threads.fasl")
   :BYTES 7764 :SHA256
   "d0c0058d9ef08d17662fd5f8ed724cf91ede328e2476c0a0cb49f94fb9e7a707")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-minimal.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/codec/cbor-minimal.fasl")
   :BYTES 24409 :SHA256
   "d037876ef0a1b844d1f312af1e2b455b0e8b0ba29f1a1c5251465af6e713a273")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-simple-write-support.fasl"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/codec/cbor-simple-write-support.fasl")
   :BYTES 16257 :SHA256
   "3f8b51761536409e241aa87d46231638db4620229301a0d8b40c50b97bd7693b")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-simple-write-threads.fasl"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/codec/cbor-simple-write-threads.fasl")
   :BYTES 8126 :SHA256
   "d8696cc9ebd8a49981878c709e194f1f94c3e98c82fdec934d0edf53916163d4")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-simple-write.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/codec/cbor-simple-write.fasl")
   :BYTES 23613 :SHA256
   "78a70106bc7f5e808257612938f87133609e857a910ebd2d2f39395ed4b74d9a")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-string-write-support.fasl"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/codec/cbor-string-write-support.fasl")
   :BYTES 19202 :SHA256
   "66155324f40a613a307c6992a3d3e7c4d1a8297f2e2bca7c9447bf40456bf758")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-string-write-threads.fasl"
   :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/codec/cbor-string-write-threads.fasl")
   :BYTES 8076 :SHA256
   "8bc4e5f9fae1e0aeee89f785230508450af7823ca54734a0a239dea33fef39bc")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-string-write.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/codec/cbor-string-write.fasl")
   :BYTES 28834 :SHA256
   "68dc45ab6d26c378d2feb7d028883d46f2ee265da3233a1ed014135ac80f3942")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-structure-support.fasl"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/codec/cbor-structure-support.fasl")
   :BYTES 34936 :SHA256
   "2ab1ac7b0a1c4faad8189d35bcb17a62674cda45ea7b3e8a2d1ca5283c3c2eb5")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-structure-threads.fasl"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/codec/cbor-structure-threads.fasl")
   :BYTES 9641 :SHA256
   "26ab94abdaf1165acc4e283580ac0787ddafdbe5e1046d8a7b494b8becc164bb")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-structure.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/codec/cbor-structure.fasl")
   :BYTES 41671 :SHA256
   "c69dd78035c06fb38e639442c55a487982af08471aa364ee128fceba3a80ee66")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-support.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/codec/cbor-support.fasl")
   :BYTES 18127 :SHA256
   "654002b033032b7bc4e7435d78fef638d018f70b53eabee589e4057573d7ab12")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-threads.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/codec/cbor-threads.fasl")
   :BYTES 8089 :SHA256
   "aca3b758e664a15bae4925cb89768877ed437e1c6079ad8872b74e18aba17e46")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-write-roundtrip.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/codec/cbor-write-roundtrip.fasl")
   :BYTES 2548 :SHA256
   "cb9b1db1e888ed284fe00d3ffe817bb6f548597dcf9cab4177e3c416834560e9")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-write-support.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/codec/cbor-write-support.fasl")
   :BYTES 14004 :SHA256
   "8d158ae30d81481bcac75be86b9b3a292fe274ce4b909929502b4173db2e1853")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-write-threads.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/codec/cbor-write-threads.fasl")
   :BYTES 8175 :SHA256
   "1643febe37b6eb69377612d1f6c08a3bfbd002ff1c9b41711f49d0c27386e462")
  (:PATH "raw/core-compiler-fasl/tests/codec/cbor-write.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/codec/cbor-write.fasl")
   :BYTES 19786 :SHA256
   "7e4281d7d04839d446a66b2673bc023cec8fbdfe4ce88345b8f20a07d6d1949c")
  (:PATH "raw/core-compiler-fasl/tests/codec/support.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/codec/support.fasl")
   :BYTES 17721 :SHA256
   "0dde31b44cfefdffda8611254de3e6817ed51a77d740f6fd7f7474948a5fe63d")
  (:PATH "raw/core-compiler-fasl/tests/codec/threads.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/codec/threads.fasl")
   :BYTES 6722 :SHA256
   "5bb87f2deb6eb876705ae3ef740a25c764b705bbd9daafe1d45b6f5da58e53ef")
  (:PATH "raw/core-compiler-fasl/tests/codec/utf8.fasl" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/codec/utf8.fasl")
   :BYTES 25364 :SHA256
   "d8e0c664e792f791013772a16f0341a4d431005adac8da3674bb595913b9b729")
  (:PATH "raw/core-compiler-fasl/tests/csn/registry.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/csn/registry.fasl")
   :BYTES 50823 :SHA256
   "7858fb4bc5da83bc1f1b8443c29c46af57e8e9c286535b8d9935882ce8c32bd4")
  (:PATH "raw/core-compiler-fasl/tests/csn/support.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/csn/support.fasl")
   :BYTES 39984 :SHA256
   "302b33b62382edfcdffacfd7ef03d7f1c39c9d436e854729461ff110c35172bd")
  (:PATH "raw/core-compiler-fasl/tests/csn/threads.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/csn/threads.fasl")
   :BYTES 22664 :SHA256
   "53f7117fe1f2f07ed310ad4ad66fef3cca0babf586cc99aab27e1b5219ec10a4")
  (:PATH "raw/core-compiler-fasl/tests/epochs/lifecycle.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/epochs/lifecycle.fasl")
   :BYTES 73977 :SHA256
   "820c28990e316f96773c4a9901792c64ac1f66386f14ced9dc7d7e195d5dc648")
  (:PATH "raw/core-compiler-fasl/tests/epochs/support.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/epochs/support.fasl")
   :BYTES 35855 :SHA256
   "2a137c2a92c24712bf9ce119b7f1c0cb1925f8fd5a70d17ad1cde0f6f8cc0e7e")
  (:PATH "raw/core-compiler-fasl/tests/epochs/threads.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/epochs/threads.fasl")
   :BYTES 10412 :SHA256
   "a61520bcb685a1a908679cfe0b4ad48986d49d688c1ee71dde9919a72e77ca2e")
  (:PATH "raw/core-compiler-fasl/tests/execution/handoff.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/execution/handoff.fasl")
   :BYTES 90776 :SHA256
   "752255540c6d519d0f6475fb689bb4a44b792c8a0e51c289a3d11a9ee1687c32")
  (:PATH "raw/core-compiler-fasl/tests/execution/queue.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/execution/queue.fasl")
   :BYTES 40327 :SHA256
   "4e2678abfa3fee2a48885bfe283f07471871ff81dedfaf66b206e166e1323feb")
  (:PATH "raw/core-compiler-fasl/tests/execution/ready-recycle.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/execution/ready-recycle.fasl")
   :BYTES 67044 :SHA256
   "b44bce9a7d7310a74292dd9d473683f81fd47e871899dc3eee9be0fc59b4a2d1")
  (:PATH "raw/core-compiler-fasl/tests/execution/ready.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/execution/ready.fasl")
   :BYTES 82260 :SHA256
   "5311761ea3f1167f0cc6b8449b3b002fd4fa772d34db26f8e544a730f566ebb0")
  (:PATH "raw/core-compiler-fasl/tests/execution/support.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/execution/support.fasl")
   :BYTES 16048 :SHA256
   "4bb7547f9cf1f0f8339a2bf12f2868308c356b211aa3ccac2eb61ec8cedef9c0")
  (:PATH "raw/core-compiler-fasl/tests/execution/threads.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/execution/threads.fasl")
   :BYTES 29744 :SHA256
   "8b7e5c2ab064504a4054180e9305db2a7c50c682bb063e780d4c60dce38b11a1")
  (:PATH "raw/core-compiler-fasl/tests/execution/worker.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/execution/worker.fasl")
   :BYTES 158260 :SHA256
   "9cee982e897ac4a04e864f3b75d0a380be04aaafc21881fcad776573ceda3633")
  (:PATH "raw/core-compiler-fasl/tests/foundation/batch.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/foundation/batch.fasl")
   :BYTES 18983 :SHA256
   "4c3adbf560388c1756de3e0d5c3cdd9df886f3c67176313da29a2db4b985b2a7")
  (:PATH "raw/core-compiler-fasl/tests/foundation/binary.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/foundation/binary.fasl")
   :BYTES 15551 :SHA256
   "ee9c047dab1c3fa3592ab345ebda16855a69e8d3f4cbf1a6d710fccb2a70f9ca")
  (:PATH "raw/core-compiler-fasl/tests/foundation/record.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/foundation/record.fasl")
   :BYTES 59106 :SHA256
   "e34e364824f6376ede82c28176fd5dc4d44f0d398763e688c24714ebb01b1eee")
  (:PATH "raw/core-compiler-fasl/tests/foundation/support.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/foundation/support.fasl")
   :BYTES 10265 :SHA256
   "b772344b98e91dae563bce5a2f7ea1e6b4f334998218b7df56ae6a423beff494")
  (:PATH "raw/core-compiler-fasl/tests/get-active/construction.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/get-active/construction.fasl")
   :BYTES 80687 :SHA256
   "41d9b2db674caf6e5747c5b5e653aea5929b58a411b6caf62a65a54947ccdabd")
  (:PATH "raw/core-compiler-fasl/tests/get-active/directory.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/get-active/directory.fasl")
   :BYTES 29449 :SHA256
   "79fe1bb87f7b824b542264a886e71d9313ab4a5610e36553b32fc1f37ecc5376")
  (:PATH "raw/core-compiler-fasl/tests/get-active/read.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/get-active/read.fasl")
   :BYTES 110755 :SHA256
   "d06a17a1beb335a95be1b8c074ec030bcd51e9acc939c13bb4fe7588af1c38cb")
  (:PATH "raw/core-compiler-fasl/tests/get-active/support.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/get-active/support.fasl")
   :BYTES 179824 :SHA256
   "6cdeb2886347cfc84b181f1d70283a0872cea42146d6bd361226fc104e9bed08")
  (:PATH "raw/core-compiler-fasl/tests/get-directory/construction.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/get-directory/construction.fasl")
   :BYTES 40531 :SHA256
   "ababba145575514b323fa552105d5e687c94994b831d93594e38c348ca509075")
  (:PATH "raw/core-compiler-fasl/tests/get-directory/read.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/get-directory/read.fasl")
   :BYTES 65609 :SHA256
   "8d5853069690be8cb6c2b686993049010c968c5bee88b912e169ae8b7fb46762")
  (:PATH "raw/core-compiler-fasl/tests/get-directory/series-read.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/get-directory/series-read.fasl")
   :BYTES 165816 :SHA256
   "7933103b2a7037d2d8241f3c2780875f70293f098719c3b272d223f3098f1f58")
  (:PATH "raw/core-compiler-fasl/tests/get-directory/series-support.fasl"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/get-directory/series-support.fasl")
   :BYTES 95452 :SHA256
   "431a52b6f05ba44e5d31cd2a6d45220a96592402247b253d1657c4d04ee4fcca")
  (:PATH "raw/core-compiler-fasl/tests/get-directory/support.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/get-directory/support.fasl")
   :BYTES 130084 :SHA256
   "2a9434b19b66309de9f03d121a92d35fd662bd57b766b91305a57d7703831bd4")
  (:PATH "raw/core-compiler-fasl/tests/get-directory/threads.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/get-directory/threads.fasl")
   :BYTES 15432 :SHA256
   "d1afb2849bfe635954789124137c382872f8249840022439408ab8d85210dca2")
  (:PATH "raw/core-compiler-fasl/tests/get-performance/guards.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/get-performance/guards.fasl")
   :BYTES 19309 :SHA256
   "dfc336594ad457d329a7b66964a0a49694fa0a04424c17279b58312f3795b2dc")
  (:PATH "raw/core-compiler-fasl/tests/get-performance/paths.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/get-performance/paths.fasl")
   :BYTES 15860 :SHA256
   "a872c4e0fe402ec561df3427a26721460ff1a2139d468b8769b65799b240e9e0")
  (:PATH "raw/core-compiler-fasl/tests/get-performance/support.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/get-performance/support.fasl")
   :BYTES 114314 :SHA256
   "493d7d9a7d12ef38f39277f2288311eb069617a03694bbd5f67695ec6073f5df")
  (:PATH "raw/core-compiler-fasl/tests/get-performance/threads.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/get-performance/threads.fasl")
   :BYTES 10474 :SHA256
   "dccc114426eccefd36afb65e673725939c2332c0153d4f7c09dea36cce682407")
  (:PATH "raw/core-compiler-fasl/tests/get-resolver/construction.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/get-resolver/construction.fasl")
   :BYTES 56473 :SHA256
   "1598f5db20f423b03e0982b89c986ce9a9d80a1e874011a167f53377b3f9622e")
  (:PATH "raw/core-compiler-fasl/tests/get-resolver/read.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/get-resolver/read.fasl")
   :BYTES 122906 :SHA256
   "7677089fada3b3a98d69513d8873518ca2f0136ebda7ce226c071499302a0cc1")
  (:PATH "raw/core-compiler-fasl/tests/get-resolver/sort.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/get-resolver/sort.fasl")
   :BYTES 31267 :SHA256
   "a4d42c690298e7bc188480d7945dc2129f2bbc6f20a012d2f31e4bf64fe8eae4")
  (:PATH "raw/core-compiler-fasl/tests/get-resolver/support.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/get-resolver/support.fasl")
   :BYTES 130384 :SHA256
   "fe8d2a5d9bccb0c70cc5686f96b3c4c36cdd7704f3eb30aea42f1a025b6845b1")
  (:PATH "raw/core-compiler-fasl/tests/get/lifecycle.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/get/lifecycle.fasl")
   :BYTES 86059 :SHA256
   "d89fcbfffd42ad101ad305432a0ff809ead04d0f518e4ad32b09a15eeb99445d")
  (:PATH "raw/core-compiler-fasl/tests/get/segment.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/get/segment.fasl")
   :BYTES 64560 :SHA256
   "cf2320489f91e992141d947f6d586f2b3827cc4d41ea8e562a30e184b6902fdb")
  (:PATH "raw/core-compiler-fasl/tests/get/support.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/get/support.fasl")
   :BYTES 56059 :SHA256
   "ddd16f4c01d8a61ceec309965c7b98c77121e56fc39b20e93d0147c307a5a296")
  (:PATH "raw/core-compiler-fasl/tests/hash/guards.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/hash/guards.fasl")
   :BYTES 4799 :SHA256
   "4d1023d23039353f7c6ff2a8db59a47bcdb25acea12400fdec0e984b1b0cd276")
  (:PATH "raw/core-compiler-fasl/tests/hash/hash64.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/hash/hash64.fasl")
   :BYTES 37226 :SHA256
   "0ca5f1509990298f042399d441fa3939f260875299e5159bf838fed8b027a1cc")
  (:PATH "raw/core-compiler-fasl/tests/hash/support.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/hash/support.fasl")
   :BYTES 46837 :SHA256
   "d3c372221afb013e6ab1e3ca0fdc70983ec52ea0c37848fe1bafbdd978581e6f")
  (:PATH "raw/core-compiler-fasl/tests/hash/threads.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/hash/threads.fasl")
   :BYTES 14662 :SHA256
   "3f1962165e562403561a9590517d6baaceca28c2d1bc1ae33c15b8308f67c6ed")
  (:PATH "raw/core-compiler-fasl/tests/index/hash-digests.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/index/hash-digests.fasl")
   :BYTES 149721 :SHA256
   "611b39d4ae1a837548ed8ef1442fed983be5f94348b11e5a9f1d92373a5df97e")
  (:PATH "raw/core-compiler-fasl/tests/index/primary-support.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/index/primary-support.fasl")
   :BYTES 55203 :SHA256
   "e546e60e52f8170587605f275741480f7663da42fc9c99f34943fecb1b08da49")
  (:PATH "raw/core-compiler-fasl/tests/index/primary-threads.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/index/primary-threads.fasl")
   :BYTES 54591 :SHA256
   "d22f46875a35b201e6829f6c3dfcdc792762bb041ef54dbf6fb22c6ecb383efa")
  (:PATH "raw/core-compiler-fasl/tests/index/primary.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/index/primary.fasl")
   :BYTES 143071 :SHA256
   "8b5e150e5a2f59d1ce6b04f67102392b77cf5199ce7d91780d0a8edb534ee18f")
  (:PATH "raw/core-compiler-fasl/tests/index/rebuild.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/index/rebuild.fasl")
   :BYTES 135869 :SHA256
   "8ac3fdc892d8f0d0d2030db1196d547b12b60a79c172fddc232abb35d41ba913")
  (:PATH "raw/core-compiler-fasl/tests/index/slot-support.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/index/slot-support.fasl")
   :BYTES 48217 :SHA256
   "5afe4519b58d0bd4d0a8e2752b0ede6ddff809ab1f87196ab96dad0119ff19a3")
  (:PATH "raw/core-compiler-fasl/tests/index/slot-threads.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/index/slot-threads.fasl")
   :BYTES 52717 :SHA256
   "34b04be9472cc8cc40e4aa9c3a52ba732ff78e3bf94de1681a361346241a7ff7")
  (:PATH "raw/core-compiler-fasl/tests/index/slots.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/index/slots.fasl")
   :BYTES 148194 :SHA256
   "c7bb50c7722953ea16b694e899de4df4c95a3a2d059d726b791d629c7a3c23cc")
  (:PATH "raw/core-compiler-fasl/tests/io/native.fasl" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/io/native.fasl")
   :BYTES 34310 :SHA256
   "a2e3d37a5b10ef8b9aa557f3c27e6b165f943a2c4a554af165406038faea1a08")
  (:PATH "raw/core-compiler-fasl/tests/io/support.fasl" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/io/support.fasl")
   :BYTES 16058 :SHA256
   "2d29d69e099736b99998e5376e8c6a480aff7f9992e7fb59296eaf63999ff74a")
  (:PATH "raw/core-compiler-fasl/tests/io/transfer.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/io/transfer.fasl")
   :BYTES 53163 :SHA256
   "8cbe3faf46ac3fb03af4155a4b6c67ec9901814c2dc5a98abfac5ff5e39ca892")
  (:PATH "raw/core-compiler-fasl/tests/mvcc/capture.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/mvcc/capture.fasl")
   :BYTES 48551 :SHA256
   "cfa1a08bb4aa057f659c3934abac99bb163e12a8dfee1ea5fd4c5c0ea3361bf5")
  (:PATH "raw/core-compiler-fasl/tests/mvcc/lifecycle.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/mvcc/lifecycle.fasl")
   :BYTES 89133 :SHA256
   "2e784c35d7bb451cede1913099ecf96a7a20fdf81b6fa51965e6dcb2e0fda000")
  (:PATH "raw/core-compiler-fasl/tests/mvcc/support.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/mvcc/support.fasl")
   :BYTES 38334 :SHA256
   "6d036a5bce5ee81a5a82a06eeb22dc580cc6e4c743e1fb86837cab8427554355")
  (:PATH "raw/core-compiler-fasl/tests/read/lifecycle.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/read/lifecycle.fasl")
   :BYTES 122278 :SHA256
   "a3bb57ed106f2f11c16148665ac032f962acee0bfeed965a3f04f7d3c9139ea4")
  (:PATH "raw/core-compiler-fasl/tests/read/support.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/read/support.fasl")
   :BYTES 20912 :SHA256
   "a51609de7785f437bdfc5d6373a61da97777abc61fd97f5d9b207875c1f13a3c")
  (:PATH "raw/core-compiler-fasl/tests/read/threads.fasl" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/read/threads.fasl")
   :BYTES 16874 :SHA256
   "c8a339368aae57c6aaa4a7783edaf21c8815ad45da495894420e1c22443387d5")
  (:PATH "raw/core-compiler-fasl/tests/recovery/corruption.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/recovery/corruption.fasl")
   :BYTES 13082 :SHA256
   "59cf21948075aeabe60f608d5780c0499174cf3f0402eab7fbf6bda5f376d8ae")
  (:PATH "raw/core-compiler-fasl/tests/recovery/decisions-audit.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/recovery/decisions-audit.fasl")
   :BYTES 33998 :SHA256
   "23be166aef90c74ef500d67df451d30acf2dc9e9874f5fe40917de028330cb55")
  (:PATH "raw/core-compiler-fasl/tests/recovery/decisions-radix.fasl" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/recovery/decisions-radix.fasl")
   :BYTES 69368 :SHA256
   "0a4e2adb1894250549fb07a956f829b95aa69b00d9c4f8d4bdd7f0551e775b19")
  (:PATH "raw/core-compiler-fasl/tests/recovery/decisions-support.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/recovery/decisions-support.fasl")
   :BYTES 16608 :SHA256
   "6518c395e5f503efdaf9e64b52cfe70c9e7218e5731f021e078859e8ac3516ac")
  (:PATH "raw/core-compiler-fasl/tests/recovery/decisions.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/recovery/decisions.fasl")
   :BYTES 57583 :SHA256
   "87326dede91b9502f9ccc9a4dd828a2510da26bc78f873dee438f86b42ce38b1")
  (:PATH "raw/core-compiler-fasl/tests/recovery/inventory-support.fasl" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/recovery/inventory-support.fasl")
   :BYTES 20579 :SHA256
   "01ed07161e980d4e93cc371c34c9ff50fb5cd2a365c857566839ed47e138f92f")
  (:PATH "raw/core-compiler-fasl/tests/recovery/inventory.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/recovery/inventory.fasl")
   :BYTES 37697 :SHA256
   "a45a24b5db846ca88e0025f82cafa9548d33b1090ddf67ea1cc78b90e2a35943")
  (:PATH "raw/core-compiler-fasl/tests/recovery/manifest-audit.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/recovery/manifest-audit.fasl")
   :BYTES 47955 :SHA256
   "1a30dd2554e05570ffbc96a31e6c5658ab810f57d94224e08d62d9895a2ffbb2")
  (:PATH "raw/core-compiler-fasl/tests/recovery/manifest-support.fasl" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/recovery/manifest-support.fasl")
   :BYTES 24093 :SHA256
   "82e41667316bb072d36e0d44a02b32ce617613165ab7721d315e9e370c4f0875")
  (:PATH "raw/core-compiler-fasl/tests/recovery/manifest.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/recovery/manifest.fasl")
   :BYTES 33920 :SHA256
   "e53aaf14245e6839dddce943f35341988342d0298083cfcf78ab3ed0063fcc50")
  (:PATH "raw/core-compiler-fasl/tests/recovery/scan.fasl" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/recovery/scan.fasl")
   :BYTES 52936 :SHA256
   "d004a8ab52dbd01e9e47fc7b4354b3c06a508b521c3727300a4d3a70c5d54305")
  (:PATH "raw/core-compiler-fasl/tests/recovery/support.fasl" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/recovery/support.fasl")
   :BYTES 17896 :SHA256
   "156aa7884a8f6dd366de77d97ed1bbe3b2956ed8e7b3b94c031b72270b2bdad0")
  (:PATH "raw/core-compiler-fasl/tests/scheduler/controller.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/scheduler/controller.fasl")
   :BYTES 48527 :SHA256
   "8a65a02f1b890c57b663cda6d451be20406d5b9bc5df4c3b3cc5a3ae96319079")
  (:PATH "raw/core-compiler-fasl/tests/scheduler/lifecycle.fasl" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/scheduler/lifecycle.fasl")
   :BYTES 96586 :SHA256
   "d04a0828b024a10e120f46f1cf8e698759a9286c359418a1bc3b832e6ee61681")
  (:PATH "raw/core-compiler-fasl/tests/scheduler/support.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/scheduler/support.fasl")
   :BYTES 10724 :SHA256
   "9bb1e096f5386bee16f705a177ea22d34714ec2e18c3d96cc172cfd9fa20503c")
  (:PATH "raw/core-compiler-fasl/tests/series/boundaries.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/series/boundaries.fasl")
   :BYTES 10713 :SHA256
   "011b4a4cf06d1b97c455c85a935913f59ce606f3b501e864533cc1a99333a4f2")
  (:PATH "raw/core-compiler-fasl/tests/series/controller.fasl" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/series/controller.fasl")
   :BYTES 112878 :SHA256
   "a88317dfdc63e9582c29b35d62c9eb53cadce650ab7a511c07bcda13cc57571d")
  (:PATH "raw/core-compiler-fasl/tests/series/support.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/series/support.fasl")
   :BYTES 94470 :SHA256
   "795380f886369cb8415254bf01c7379e73e84a58420969d599432ae319af06c6")
  (:PATH "raw/core-compiler-fasl/tests/series/threads.fasl" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/series/threads.fasl")
   :BYTES 36238 :SHA256
   "dafdb7a4a4ca2907e01c67b4590eefe22b3f51da19ee6c565a722449d497c1fb")
  (:PATH "raw/core-compiler-fasl/tests/series/worker-bridge.fasl" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/series/worker-bridge.fasl")
   :BYTES 111057 :SHA256
   "cc4bc0deee1d9782760c6ec69da523fc3edd6713f94f3894040166b3bf43843d")
  (:PATH "raw/core-compiler-fasl/tests/series/worker-routing.fasl" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/series/worker-routing.fasl")
   :BYTES 64473 :SHA256
   "31b795c16b98433b48153440e98536d58c3316d5e84fde88066333d536d3de72")
  (:PATH "raw/core-compiler-fasl/tests/smoke.fasl" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/smoke.fasl")
   :BYTES 3278 :SHA256
   "864fa5038846a234931358a095282908ce4c3cda41f26d3e043eac3f533082b6")
  (:PATH "raw/core-compiler-fasl/tests/storage/compaction-scan.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/storage/compaction-scan.fasl")
   :BYTES 35492 :SHA256
   "190330797ea433478f5b7524a3297fa7eaf806f6c80a4486f3f74a497e9e37f8")
  (:PATH "raw/core-compiler-fasl/tests/storage/control-payload.fasl" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/storage/control-payload.fasl")
   :BYTES 59345 :SHA256
   "635808209ea7dd4dbfdcb3f0ee416b0aa7d0f4d6171cca5ae4ef793be046626f")
  (:PATH "raw/core-compiler-fasl/tests/storage/log-header.fasl" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/storage/log-header.fasl")
   :BYTES 36631 :SHA256
   "e8dc15140167e6b85422ebf8bde3b8bcccff5863a08405fd73e2044fd48c238c")
  (:PATH "raw/core-compiler-fasl/tests/storage/segment-header.fasl" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/storage/segment-header.fasl")
   :BYTES 18210 :SHA256
   "f7e573ea5c11b826803ba53b6df7c6ef3967df095ae295b1dbf83df547f42b81")
  (:PATH "raw/core-compiler-fasl/tests/storage/support.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/storage/support.fasl")
   :BYTES 13712 :SHA256
   "c75b0ca6340ced443954a17da94573154d46ac1ed91c9f12213ba5e7845b22d6")
  (:PATH "raw/core-compiler-fasl/tests/wal/builder.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/wal/builder.fasl")
   :BYTES 17388 :SHA256
   "a7f4de6114ea59ea710db6a814c6ac7562a0c285ccbb0d187c572ba0ede08635")
  (:PATH "raw/core-compiler-fasl/tests/wal/csn-threads.fasl" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/wal/csn-threads.fasl")
   :BYTES 27280 :SHA256
   "f19a08d1be27d6c47a2d09bee4c15ac9105fadac27ee2ae49cba79802c834ce2")
  (:PATH "raw/core-compiler-fasl/tests/wal/csn.fasl" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/wal/csn.fasl")
   :BYTES 167860 :SHA256
   "d76b7a0eeaac718510aea9d0f472d8f80a7a3c8eed042ef0859ab0c98a22696d")
  (:PATH "raw/core-compiler-fasl/tests/wal/fault.fasl" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/wal/fault.fasl")
   :BYTES 28690 :SHA256
   "a95e19f18a10a9d9a2da5b92b209c26497797b88885020426f86149b57345baa")
  (:PATH "raw/core-compiler-fasl/tests/wal/group.fasl" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/wal/group.fasl")
   :BYTES 25464 :SHA256
   "077e2eb5ea91c955b138bc3d505b50b1f42ef39a220756b0d4b8c822bceb4a0c")
  (:PATH "raw/core-compiler-fasl/tests/wal/native.fasl" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/wal/native.fasl")
   :BYTES 9831 :SHA256
   "7c0222663105bb1a4578f73db42d476e98410f93a21adeb4ceca789fa8b35793")
  (:PATH "raw/core-compiler-fasl/tests/wal/support.fasl" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-fasl/tests/wal/support.fasl")
   :BYTES 8010 :SHA256
   "5dc95f971c2c84243137cde8fd875a469bab4b73db05e6af66fcbaeace944752")
  (:PATH "raw/core-console/stderr.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-command/stderr.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/core-console/stdout.txt" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-core-command/stdout.txt")
   :BYTES 409 :SHA256
   "6e717a292a98fc39db8aeb9b70994a48847b2f85d9d268e61845446cc9b20fee")
  (:PATH "raw/core-inner/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914478-command-99440-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "81006126ca2459976260da83418f27ebf7481af5d56b9408a6c5429875def7aa")
  (:PATH "raw/core-inner/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914478-command-99440-0/report.lisp")
   :BYTES 1040121 :SHA256
   "b711c249d0c093fefa9774970158c0083ecf83782231a341aa9a8beb2c7b06cd")
  (:PATH "raw/core-outer/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914477-command-99166-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "6f57fd4a5c5a561acac5d108a48ca7b39f088b34329f7b13acca4ed844300942")
  (:PATH "raw/core-outer/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914477-command-99166-0/report.lisp")
   :BYTES 167654 :SHA256
   "e19cb63aee8f34cefe52791060ccb3b89310b462479b1f1ee8dd8f599bbd5116")
  (:PATH "raw/local-audit-R1-command/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914900-command-12135-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "d05edcb002fd9949773ed61d001a747245f23a908d671a7b7ff2cd87a0e5a779")
  (:PATH "raw/local-audit-R1-command/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914900-command-12135-0/report.lisp")
   :BYTES 250925 :SHA256
   "5c3a46f65be5f579a0f01fc1dcb9c2e3f0c155cc45af9d276a93a568fe844eab")
  (:PATH "raw/local-audit-R2-command/conservazione.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000915068-command-16026-0/conservazione.lisp")
   :BYTES 1153 :SHA256
   "5d74137e71027b04f5339dfa1d01e5172cae3556689cd47991ad03729f1e8334")
  (:PATH "raw/local-audit-R2-command/report.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000915068-command-16026-0/report.lisp")
   :BYTES 250983 :SHA256
   "82efe488a3fffde7ff1684726382d63fa888e64ff92b757f3c31023ca542aaec")
  (:PATH "raw/local-audit/audit-R2.lisp" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-local-audit/audit-R2.lisp")
   :BYTES 32339 :SHA256
   "2e21d354370e68bb215d59933190fec1267386610d99fc256fff423b509c37bc")
  (:PATH "raw/local-audit/audit-before-translation-check.lisp.txt" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-local-audit/audit-before-translation-check.lisp.txt")
   :BYTES 30777 :SHA256
   "160db6c871d30d608a37dd2f73bd8bff82c8b44214e43451ed04907577c72f8c")
  (:PATH "raw/local-audit/audit-command-R1.stderr" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-local-audit/audit-command-R1.stderr")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/local-audit/audit-command-R1.stdout" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-local-audit/audit-command-R1.stdout")
   :BYTES 701 :SHA256
   "460f8b87649f007ffb53c2ac02113496d20951662e8e8e6e2e4e65ac552c30c9")
  (:PATH "raw/local-audit/audit-command-R2.stderr" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-local-audit/audit-command-R2.stderr")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/local-audit/audit-command-R2.stdout" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-local-audit/audit-command-R2.stdout")
   :BYTES 704 :SHA256
   "8f6b693602856856856255e2258fe08bd9ca6df5bd407a97e4d2277518107184")
  (:PATH "raw/local-audit/audit-original.lisp.txt" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-local-audit/audit-original.lisp.txt")
   :BYTES 37560 :SHA256
   "ce7877778ada522c45a3136b6f74997574e41d154004bfb0f8aaf4fd24621163")
  (:PATH "raw/local-audit/audit.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-local-audit/audit.lisp")
   :BYTES 30777 :SHA256
   "160db6c871d30d608a37dd2f73bd8bff82c8b44214e43451ed04907577c72f8c")
  (:PATH "raw/local-audit/fixture-original.lisp.txt" :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-local-audit/fixture-original.lisp.txt")
   :BYTES 9295 :SHA256
   "c4ff67bf90b22f9aaef113dac4339afc7aa5d61ac25da5f07adc40fea648cdc5")
  (:PATH "raw/local-audit/syntax-read-R1.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-local-audit/syntax-read-R1.lisp")
   :BYTES 159 :SHA256
   "4e214b8bfd18a19b8dcc644568d45ae35180b3ed08f268094e9fa31e33d82a06")
  (:PATH "raw/local-audit/syntax-read-R1.stderr" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-local-audit/syntax-read-R1.stderr")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/local-audit/syntax-reader.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/active-final-local-audit/syntax-reader.lisp")
   :BYTES 561 :SHA256
   "8b4299cd3c96b52727507d127abb28ae866738d03f88453ce9dbed10c55161a8")
  (:PATH "raw/reader-process-fixtures/completion-exit/isolated-build.lisp"
   :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914510-reader-self-test-956-0/completion-exit/isolated-build.lisp")
   :BYTES 197 :SHA256
   "1a45dcf8a6d03f1e8866e49280c6f0edb894320c90624d5620fad1e3d546cea9")
  (:PATH "raw/reader-process-fixtures/completion-exit/stderr.log" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914510-reader-self-test-956-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/reader-process-fixtures/completion-exit/stdout.log" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914510-reader-self-test-956-0/completion-exit/stdout.log")
   :BYTES 105 :SHA256
   "5e630c1b44d68ce71b27d151e76bf367e3cbd941200adc36cdd30e0fe7390531")
  (:PATH "raw/reader-process-fixtures/report.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914510-reader-self-test-956-0/report.lisp")
   :BYTES 1931 :SHA256
   "79e4da5ba834a70f1a077a06ca14e4a71f37f973e165d66959e8ebb2f1f93acb")
  (:PATH "raw/reader-process-fixtures/signal/isolated-build.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914510-reader-self-test-956-0/signal/isolated-build.lisp")
   :BYTES 247 :SHA256
   "ff5cf55dda241d32ea1b4308172c7dc526436cbf1d546e7471148cee95a873d1")
  (:PATH "raw/reader-process-fixtures/signal/stderr.log" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914510-reader-self-test-956-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/reader-process-fixtures/signal/stdout.log" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914510-reader-self-test-956-0/signal/stdout.log")
   :BYTES 126 :SHA256
   "3697c68fa71f124c8d05d8cc5d649a744586a10989eb2e67c5bdce6bfc760142")
  (:PATH "raw/snapshot-process-fixtures/completion-exit/isolated-build.lisp"
   :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914510-snapshot-self-test-932-0/completion-exit/isolated-build.lisp")
   :BYTES 199 :SHA256
   "b8bb4416a818775bae5c77341eeec2c356a2733f633ac2bc8b6ac3ff955d05e0")
  (:PATH "raw/snapshot-process-fixtures/completion-exit/stderr.log" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914510-snapshot-self-test-932-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/snapshot-process-fixtures/completion-exit/stdout.log" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914510-snapshot-self-test-932-0/completion-exit/stdout.log")
   :BYTES 107 :SHA256
   "4f22544421d9012fe132a36bf15950cd327ca959b8f9c5ef3d386e0c8b62a25c")
  (:PATH "raw/snapshot-process-fixtures/report.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914510-snapshot-self-test-932-0/report.lisp")
   :BYTES 1949 :SHA256
   "51c97713d392d9fbd231a70f6f25b16bfda2cc61e09d38f9568640c0434b7612")
  (:PATH "raw/snapshot-process-fixtures/signal/isolated-build.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914510-snapshot-self-test-932-0/signal/isolated-build.lisp")
   :BYTES 249 :SHA256
   "a345276e3dfe377c0bbd359793165915b1527938a65250d367ce5ac079feecc1")
  (:PATH "raw/snapshot-process-fixtures/signal/stderr.log" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914510-snapshot-self-test-932-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/snapshot-process-fixtures/signal/stdout.log" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914510-snapshot-self-test-932-0/signal/stdout.log")
   :BYTES 128 :SHA256
   "e3502e714a0530acb1f0130c4ced4a016607bcb067e3686f6f29704db8423ea5")
  (:PATH "raw/spikes-native/SPK-01.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914694-check-7379-0/SPK-01.lisp")
   :BYTES 27228 :SHA256
   "8e737770a902f9dd1e540f9d58a13f9981f8bc072ab3bf13d0482b0062220393")
  (:PATH "raw/spikes-native/SPK-02.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914694-check-7379-0/SPK-02.lisp")
   :BYTES 1607 :SHA256
   "4476fdb6e26119fae6dd31b68d82486a6c6d3c909eb8bf727c244685d88deb73")
  (:PATH "raw/spikes-native/SPK-03.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914694-check-7379-0/SPK-03.lisp")
   :BYTES 3644 :SHA256
   "4f00af2ede6f925a034df31582afd136e8b97ffa9da0edb65240e3394a92c3ee")
  (:PATH "raw/spikes-native/SPK-04.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914694-check-7379-0/SPK-04.lisp")
   :BYTES 6752 :SHA256
   "bde3afd397b3459d2ac1b47b02b095b454250a7bf646cdd8c053ec95852ae3d9")
  (:PATH "raw/spikes-native/SPK-05.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914694-check-7379-0/SPK-05.lisp")
   :BYTES 10051 :SHA256
   "5062ce0bfd83d5a416e1e6e1cd0932a76cbdaed5a9b55c42e19af2b223a2ed5c")
  (:PATH "raw/spikes-native/SPK-06.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914694-check-7379-0/SPK-06.lisp")
   :BYTES 24026 :SHA256
   "e0bfe5412faaf51ed4b8cdc7f6e72d38475e5d40039c497caf80533c72fecdf3")
  (:PATH "raw/spikes-native/SPK-07.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914694-check-7379-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "7d9bd180c72b2463b97ed506ffbd095a720766fb8c97bdb3608ef364ba1abcd3")
  (:PATH "raw/spikes-native/SPK-07.lisp.gz" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914694-check-7379-0/SPK-07.lisp.gz")
   :BYTES 410621 :SHA256
   "b814ef17d6e0cbc8df2d24f84ae71876c61a113dc4d5b22b18e644133abb602d")
  (:PATH "raw/spikes-native/SPK-08.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914694-check-7379-0/SPK-08.lisp")
   :BYTES 291712 :SHA256
   "aac763c0f2b4cf7c4d73a868f8ee6a2d1296dd5765159850abffa95f9888114c")
  (:PATH "raw/spikes-native/SPK-09.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914694-check-7379-0/SPK-09.lisp")
   :BYTES 2472 :SHA256
   "6f771ac423964feda66b7754554a66269ef9443268c0478ade07b457d9720cbd")
  (:PATH "raw/spikes-native/SPK-10.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914694-check-7379-0/SPK-10.lisp")
   :BYTES 22977 :SHA256
   "b45b656bbd2be0b9f178e7b62e1670b651607aaddb110f5f8a399bc151530d44")
  (:PATH "raw/spikes-native/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914694-check-7379-0/conservazione.lisp")
   :BYTES 2294 :SHA256
   "1cf5a0d656b59e8430683626d042cea9df589d83ce7fed10255f8ff6d5253dc5")
  (:PATH "raw/spikes-native/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914694-check-7379-0/report.lisp")
   :BYTES 318 :SHA256
   "e57a06634391ae57f64251f910606bea0d1223779d943bd08ad6960b07e1966f")
  (:PATH "raw/spikes-native/report.lisp.gz" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/get-active-final/ArcDocDB/spikes/out/4000914694-check-7379-0/report.lisp.gz")
   :BYTES 466798 :SHA256
   "39b1510000c6974a3d777c8d9895724abfe5e0a54f0722dc91c61747eeb914d2"))
 :LIMITS
 (:COMPLETE-EXPLICIT-GROUPS :RAW-FASL-PRESERVED-AS-DATA :SOURCE-AND-COPY-SHA256
  :LOSSLESS-GZIP-FOR-LARGE-RAW :NO-RESULT-PROMOTION))
