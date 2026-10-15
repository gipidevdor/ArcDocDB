(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "r1-outer" :RECORD-PATH "processes/r1-outer/report.lisp" :COMMAND
   (#A((3) BASE-CHAR . "env")
    #A((262) BASE-CHAR
       . "ASDF_OUTPUT_TRANSLATIONS=(:output-translations (#P\"/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/**/*.*\" #P\"/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-R1-fasl/**/*.*\") :ignore-inherited-configuration)")
    #A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "check"))
   :STATUS :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "r1-inner" :RECORD-PATH "processes/r1-inner/report.lisp" :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "r2-outer" :RECORD-PATH "processes/r2-outer/report.lisp" :COMMAND
   (#A((3) BASE-CHAR . "env")
    #A((262) BASE-CHAR
       . "ASDF_OUTPUT_TRANSLATIONS=(:output-translations (#P\"/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/**/*.*\" #P\"/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-R2-fasl/**/*.*\") :ignore-inherited-configuration)")
    #A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "check"))
   :STATUS :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "r2-inner" :RECORD-PATH "processes/r2-inner/report.lisp" :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :FAILED :EXIT-CODE 2 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "r3-outer" :RECORD-PATH "processes/r3-outer/report.lisp" :COMMAND
   (#A((3) BASE-CHAR . "env")
    #A((262) BASE-CHAR
       . "ASDF_OUTPUT_TRANSLATIONS=(:output-translations (#P\"/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/**/*.*\" #P\"/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-R3-fasl/**/*.*\") :ignore-inherited-configuration)")
    #A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "check"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "r3-inner" :RECORD-PATH "processes/r3-inner/report.lisp" :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "counter" :RECORD-PATH "processes/counter/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((18) BASE-CHAR . "--disable-debugger") #A((8) BASE-CHAR . "--script")
    #A((55) BASE-CHAR
       . "spikes/out/serie-inventory-count-tools/count-tests.lisp")
    #A((11) BASE-CHAR . "--workspace")
    #A((61) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB")
    #A((8) BASE-CHAR . "--commit")
    #A((40) BASE-CHAR . "88a8cdd77027bfebdbab01c47ce3d4dfbbedec85"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "trace-write" :RECORD-PATH "processes/trace-write/report.lisp"
   :COMMAND (#A((4) BASE-CHAR . "make") #A((11) BASE-CHAR . "trace-write"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "integration-check" :RECORD-PATH
   "processes/integration-check/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "make") #A((4) BASE-CHAR . "lint")
    #A((5) BASE-CHAR . "trace") #A((5) BASE-CHAR . "links"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "README.md" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-publication-inputs/README-final.md")
   :BYTES 3384 :SHA256
   "ce6c8258cdbd06133bf22d12ac233772264d1bbdecbd0d9484038821a01e87b6")
  (:PATH "collection-manifest.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-publication-inputs/manifest-candidate-final.lisp")
   :BYTES 17457 :SHA256
   "857f80ed600fe5af1a57537fd048fb2723ab3f158b0bbc5ed4ad38b8dcc60b59")
  (:PATH "collection-source.lisp" :SOURCE
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH "counter-runtime/counter-S-R1.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-count-runtime/counter-S-R1.lisp")
   :BYTES 151 :SHA256
   "2e3cfe33d8a37c6333b2ab0face7c4fe14f106bcee11671fb14cbc800b269f93")
  (:PATH "counter-runtime/counter-command.stderr.log" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-count-runtime/counter-command.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "counter-runtime/counter-command.stdout.log" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-count-runtime/counter-command.stdout.log")
   :BYTES 354 :SHA256
   "d4803f870de058df46e364f743e17b3f8408981e9d3261ff422576e9b60a3cd5")
  (:PATH "fixtures/reader/completion-exit/isolated-build.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085796-reader-self-test-54296-0/completion-exit/isolated-build.lisp")
   :BYTES 197 :SHA256
   "1a45dcf8a6d03f1e8866e49280c6f0edb894320c90624d5620fad1e3d546cea9")
  (:PATH "fixtures/reader/completion-exit/stderr.log" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085796-reader-self-test-54296-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "fixtures/reader/completion-exit/stdout.log" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085796-reader-self-test-54296-0/completion-exit/stdout.log")
   :BYTES 105 :SHA256
   "5e630c1b44d68ce71b27d151e76bf367e3cbd941200adc36cdd30e0fe7390531")
  (:PATH "fixtures/reader/report.lisp" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085796-reader-self-test-54296-0/report.lisp")
   :BYTES 1931 :SHA256
   "c30c4e8e7a438d4a7621b8e0ab9fa74d57476b1ce8f2885fbb7a5ca5fc8118a4")
  (:PATH "fixtures/reader/signal/isolated-build.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085796-reader-self-test-54296-0/signal/isolated-build.lisp")
   :BYTES 247 :SHA256
   "ff5cf55dda241d32ea1b4308172c7dc526436cbf1d546e7471148cee95a873d1")
  (:PATH "fixtures/reader/signal/stderr.log" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085796-reader-self-test-54296-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "fixtures/reader/signal/stdout.log" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085796-reader-self-test-54296-0/signal/stdout.log")
   :BYTES 126 :SHA256
   "3697c68fa71f124c8d05d8cc5d649a744586a10989eb2e67c5bdce6bfc760142")
  (:PATH "fixtures/snapshot/completion-exit/isolated-build.lisp" :SOURCE
   #A((146) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085795-snapshot-self-test-54264-0/completion-exit/isolated-build.lisp")
   :BYTES 199 :SHA256
   "b8bb4416a818775bae5c77341eeec2c356a2733f633ac2bc8b6ac3ff955d05e0")
  (:PATH "fixtures/snapshot/completion-exit/stderr.log" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085795-snapshot-self-test-54264-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "fixtures/snapshot/completion-exit/stdout.log" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085795-snapshot-self-test-54264-0/completion-exit/stdout.log")
   :BYTES 107 :SHA256
   "4f22544421d9012fe132a36bf15950cd327ca959b8f9c5ef3d386e0c8b62a25c")
  (:PATH "fixtures/snapshot/report.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085795-snapshot-self-test-54264-0/report.lisp")
   :BYTES 1949 :SHA256
   "053add0c92587735aa14a3e030050c502ed4c452c99ba1229f4b45b953ce3c11")
  (:PATH "fixtures/snapshot/signal/isolated-build.lisp" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085795-snapshot-self-test-54264-0/signal/isolated-build.lisp")
   :BYTES 249 :SHA256
   "a345276e3dfe377c0bbd359793165915b1527938a65250d367ce5ac079feecc1")
  (:PATH "fixtures/snapshot/signal/stderr.log" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085795-snapshot-self-test-54264-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "fixtures/snapshot/signal/stdout.log" :SOURCE
   #A((128) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085795-snapshot-self-test-54264-0/signal/stdout.log")
   :BYTES 128 :SHA256
   "e3502e714a0530acb1f0130c4ced4a016607bcb067e3686f6f29704db8423ea5")
  (:PATH "fixtures/spk/SPK-01.lisp" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001086155-check-63270-0/SPK-01.lisp")
   :BYTES 27228 :SHA256
   "c0578e3760558d3d47b39937d81f40b69d7dfd979753b2e7ff2727ed6ac0aa46")
  (:PATH "fixtures/spk/SPK-02.lisp" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001086155-check-63270-0/SPK-02.lisp")
   :BYTES 1607 :SHA256
   "331c1561b6d6b0bdf03b3e53028f2a0e76b3621334b683a7dbf439cfb0ec5921")
  (:PATH "fixtures/spk/SPK-03.lisp" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001086155-check-63270-0/SPK-03.lisp")
   :BYTES 3640 :SHA256
   "efa37d976ed8157ef3d8be5d99046e6b1e52bd438b0e5ecf4f9b1309d4067115")
  (:PATH "fixtures/spk/SPK-04.lisp" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001086155-check-63270-0/SPK-04.lisp")
   :BYTES 6752 :SHA256
   "b2faa02f4dae0241cd378ab55db80e45766b685295b7de2708153cb004a02f51")
  (:PATH "fixtures/spk/SPK-05.lisp" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001086155-check-63270-0/SPK-05.lisp")
   :BYTES 10161 :SHA256
   "f22090935a4b903a16705d8f5619382a35b8a8e5d069ec9983ba1e693c07fe6f")
  (:PATH "fixtures/spk/SPK-06.lisp" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001086155-check-63270-0/SPK-06.lisp")
   :BYTES 24152 :SHA256
   "ed69903fe0213c0d79b2b5f9a751e3da4cbc7ea04e79d96e70f20ada1913ccff")
  (:PATH "fixtures/spk/SPK-07.lisp" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001086155-check-63270-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "c29738e5a65c489f5f1cf13b6973608f3fdd0b10d08ea14ae931133d15ba6996")
  (:PATH "fixtures/spk/SPK-07.lisp.gz" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001086155-check-63270-0/SPK-07.lisp.gz")
   :BYTES 410617 :SHA256
   "cc72cc63018406d067b2aae902d55bf7dc37a866d16dfefb6354aa639e4532bd")
  (:PATH "fixtures/spk/SPK-08.lisp" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001086155-check-63270-0/SPK-08.lisp")
   :BYTES 291712 :SHA256
   "6a5c6bc4372cd563cd80a77f3fdcc67cefb8aa1a7d0b1158e78be8caabc2a12d")
  (:PATH "fixtures/spk/SPK-09.lisp" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001086155-check-63270-0/SPK-09.lisp")
   :BYTES 2472 :SHA256
   "9953bc3989a60d491804dd40db7e8f4a549aaca4623e48d344c4501701d0c95f")
  (:PATH "fixtures/spk/SPK-10.lisp" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001086155-check-63270-0/SPK-10.lisp")
   :BYTES 22977 :SHA256
   "0116f812d86a623185158af4e52aaaa9a967c74f43f75612431f3a50b0c13fe9")
  (:PATH "fixtures/spk/conservazione.lisp" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001086155-check-63270-0/conservazione.lisp")
   :BYTES 2289 :SHA256
   "6755bc067901b29399bda88b9c01fb0513b490517f5b999c16f1b82e6e4ba669")
  (:PATH "fixtures/spk/report.lisp" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001086155-check-63270-0/report.lisp")
   :BYTES 318 :SHA256
   "92ebc64abaed7e0f04a708ac434a87217fbb718c3ff66389ee207be503505fd3")
  (:PATH "fixtures/spk/report.lisp.gz" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001086155-check-63270-0/report.lisp.gz")
   :BYTES 467051 :SHA256
   "5dd79c70b03d502320303a07468b7bc657baa78abab206b318760994cd90358f")
  (:PATH "inputs/README.txt" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-publication-inputs/README.txt")
   :BYTES 1858 :SHA256
   "592745662a00e93fcf254fa376c0329268b301a29c404b1b662be3ffb5c40b15")
  (:PATH "inputs/SHA256SUMS-sources.txt" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-publication-inputs/SHA256SUMS-sources.txt")
   :BYTES 4646 :SHA256
   "109c0ece8ae47e777f404cc1f5c5de634987257c6a5b33debf217f39116a93b5")
  (:PATH "inputs/capture-provenance.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-publication-inputs/capture-provenance.lisp")
   :BYTES 9870 :SHA256
   "edc5dff458f8f1ff1a64256cf187f560da522395c5e5867163ade673c79077e0")
  (:PATH "inputs/counter/count-tests.lisp.txt" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-publication-inputs/counter/count-tests.lisp.txt")
   :BYTES 14296 :SHA256
   "1cb93fc4901faefaa66fdfe4207f012f51f683f8ab622ec5a25a92aa4512541e")
  (:PATH "inputs/counter/source-authentication.txt" :SOURCE
   #A((141) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-publication-inputs/counter/source-authentication.txt")
   :BYTES 122 :SHA256
   "5574bac4730bb16a1da3d259470c2b9aaa7b52088374c74aa2aa08bfac32696a")
  (:PATH "inputs/frozen-S3/arcdocdb.asd.txt" :SOURCE
   #A((134) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-publication-inputs/frozen-S3/arcdocdb.asd.txt")
   :BYTES 19807 :SHA256
   "783d65d937064bd90be3bb1046f05e06061a6e60b35e74a43f99a07b05d51e52")
  (:PATH
   "inputs/frozen-S3/docs/implementazione/inventario-directory-metodo.md.txt"
   :SOURCE
   #A((173) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-publication-inputs/frozen-S3/docs/implementazione/inventario-directory-metodo.md.txt")
   :BYTES 4910 :SHA256
   "4d4d9b558a3bc6c05a571fd69165a71f11f79fba41a28c6da2387ad51ac7f463")
  (:PATH "inputs/frozen-S3/tests/recovery/inventory-directory-native.lisp.txt"
   :SOURCE
   #A((168) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-publication-inputs/frozen-S3/tests/recovery/inventory-directory-native.lisp.txt")
   :BYTES 9088 :SHA256
   "76fefa41d307eaeb6b739f5e8ed71456ea4aefb1485930bce201ba04fbfa0810")
  (:PATH "inputs/frozen-S3/tests/recovery/inventory-directory-support.lisp.txt"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-publication-inputs/frozen-S3/tests/recovery/inventory-directory-support.lisp.txt")
   :BYTES 6750 :SHA256
   "d0673b678247916baddd1478b947f3d0e2f6ab56776ccd460f89ecda3206d1f4")
  (:PATH "inputs/frozen-S3/tests/recovery/inventory-directory.lisp.txt" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-publication-inputs/frozen-S3/tests/recovery/inventory-directory.lisp.txt")
   :BYTES 13122 :SHA256
   "6f8219a0cd13b7dec8135a04809156ba4ff2824a10ffd93c844916b3f036bcea")
  (:PATH
   "inputs/variants/S1/docs/implementazione/inventario-directory-revisione.md.txt"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-publication-inputs/variants/S1/docs/implementazione/inventario-directory-revisione.md.txt")
   :BYTES 3118 :SHA256
   "3ab973b2151ebd3631d7041232a785af3ae58204b131946b6f3eafb18d90b584")
  (:PATH "inputs/variants/S1/src/io/directory.lisp.txt" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-publication-inputs/variants/S1/src/io/directory.lisp.txt")
   :BYTES 4056 :SHA256
   "95267cc8294d3d5f5e98371230e3cde912250ecc5782487a88c56c8e8886093b")
  (:PATH "inputs/variants/S1/src/io/native-directory.lisp.txt" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-publication-inputs/variants/S1/src/io/native-directory.lisp.txt")
   :BYTES 6948 :SHA256
   "77cb85183a5d036c0abde487112a39d67c6a46e02b04c36dcb7ec9b96fbce9d0")
  (:PATH "inputs/variants/S1/src/recovery/inventory-directory.lisp.txt" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-publication-inputs/variants/S1/src/recovery/inventory-directory.lisp.txt")
   :BYTES 6874 :SHA256
   "6bae703f2569fe5c8adff8f2adbf5b53aff0e555a7c0dc00507876b3fa0d030c")
  (:PATH
   "inputs/variants/S2/docs/implementazione/inventario-directory-revisione.md.txt"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-publication-inputs/variants/S2/docs/implementazione/inventario-directory-revisione.md.txt")
   :BYTES 3422 :SHA256
   "d8563e86ca589a7cfb92266a7dbb1bb89f84b77288f2154bc6a6d1dfe27b6d4f")
  (:PATH "inputs/variants/S2/src/io/directory.lisp.txt" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-publication-inputs/variants/S2/src/io/directory.lisp.txt")
   :BYTES 4056 :SHA256
   "95267cc8294d3d5f5e98371230e3cde912250ecc5782487a88c56c8e8886093b")
  (:PATH "inputs/variants/S2/src/io/native-directory.lisp.txt" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-publication-inputs/variants/S2/src/io/native-directory.lisp.txt")
   :BYTES 6948 :SHA256
   "77cb85183a5d036c0abde487112a39d67c6a46e02b04c36dcb7ec9b96fbce9d0")
  (:PATH "inputs/variants/S2/src/recovery/inventory-directory.lisp.txt" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-publication-inputs/variants/S2/src/recovery/inventory-directory.lisp.txt")
   :BYTES 6869 :SHA256
   "30fe064d636baefdb5366daabdc96e7dc9766a06808ee4b70045e312c20a6a60")
  (:PATH
   "inputs/variants/S3/docs/implementazione/inventario-directory-revisione.md.txt"
   :SOURCE
   #A((178) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-publication-inputs/variants/S3/docs/implementazione/inventario-directory-revisione.md.txt")
   :BYTES 3590 :SHA256
   "590659df96a40fc7bb50d2bec983d9b518ac660daf28b9cef5fca20842cf0f2b")
  (:PATH "inputs/variants/S3/src/io/directory.lisp.txt" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-publication-inputs/variants/S3/src/io/directory.lisp.txt")
   :BYTES 4066 :SHA256
   "bfb22b87ae9d84264883224a8ab0835e8683bd6d8c5eacee9fc5208ed4e59249")
  (:PATH "inputs/variants/S3/src/io/native-directory.lisp.txt" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-publication-inputs/variants/S3/src/io/native-directory.lisp.txt")
   :BYTES 6958 :SHA256
   "781b3fcf6d422efa811e0c136c11735aa9f9123d1a42f45fc2d4c8d4e82ac08b")
  (:PATH "inputs/variants/S3/src/recovery/inventory-directory.lisp.txt" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/serie-inventory-publication-inputs/variants/S3/src/recovery/inventory-directory.lisp.txt")
   :BYTES 6859 :SHA256
   "c3d45d7c41661865b9739fda5bf9762fc1e238ab213638285579cfe4d2c86fb4")
  (:PATH "processes/counter/conservazione.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085326-command-41872-0/conservazione.lisp")
   :BYTES 1147 :SHA256
   "b5eefd797fbb865266385d332906118cebcae271831a9064e166f10e723297d6")
  (:PATH "processes/counter/report.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085326-command-41872-0/report.lisp")
   :BYTES 210840 :SHA256
   "90a378464c604e234d4dc283401600149fbe635b6fb96cfdcb950b55195ce4a5")
  (:PATH "processes/integration-check/conservazione.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001086256-command-66853-0/conservazione.lisp")
   :BYTES 1147 :SHA256
   "e44a8695b6f56de9e403bb7f75d67f1faa2b6cbda9683587c464a5b87915b9a1")
  (:PATH "processes/integration-check/report.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001086256-command-66853-0/report.lisp")
   :BYTES 212614 :SHA256
   "3ff4c97d1c63f5d10ab577515f2e30a0aebca656f74f3087e2303423b28757ae")
  (:PATH "processes/r1-inner/conservazione.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085279-command-39956-0/conservazione.lisp")
   :BYTES 1147 :SHA256
   "e4b692011956ef8f65974413086a43a341d9f7bf4202505934c451e32725aaea")
  (:PATH "processes/r1-inner/report.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085279-command-39956-0/report.lisp")
   :BYTES 452401 :SHA256
   "9dcee0ad74eddcff006dbd6da717ce77daea6eed66df856d93efa1fda2234894")
  (:PATH "processes/r1-outer/conservazione.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085276-command-39864-0/conservazione.lisp")
   :BYTES 1147 :SHA256
   "f1a5fbcc66245670b4c1a69b7bba8e27e16ff5af90316d41a8de59cb02a966d0")
  (:PATH "processes/r1-outer/report.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085276-command-39864-0/report.lisp")
   :BYTES 210990 :SHA256
   "1aa336ef3d8ad404fbb3cd542d8bfa1d335386e2beb6ec79aeee8bdac6959423")
  (:PATH "processes/r2-inner/conservazione.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085441-command-45779-0/conservazione.lisp")
   :BYTES 1725 :SHA256
   "5d96dd3182fa488ceaaadf46d186dc8a9801070cbcb467e38053e548b8ccd211")
  (:PATH "processes/r2-inner/report.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085441-command-45779-0/report.lisp")
   :BYTES 317 :SHA256
   "a36a3873508496ff7eb227b04a3ace34cf850019bea85806a69bece6d0a16c77")
  (:PATH "processes/r2-inner/report.lisp.gz" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085441-command-45779-0/report.lisp.gz")
   :BYTES 191926 :SHA256
   "7e388ff4eb98261a826a7f6dfdd22da687e0df19a22592ff936f0e3e13881af2")
  (:PATH "processes/r2-outer/conservazione.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085438-command-45718-0/conservazione.lisp")
   :BYTES 1147 :SHA256
   "4e59673b2337de54391b906e363a70f8ca4ea248480668a293d956097b56819f")
  (:PATH "processes/r2-outer/report.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085438-command-45718-0/report.lisp")
   :BYTES 210991 :SHA256
   "9e313809174cb1fbc6e1b817d29a5cb965055e8c84363b4978d895c971783cf7")
  (:PATH "processes/r3-inner/conservazione.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085707-command-52310-0/conservazione.lisp")
   :BYTES 1727 :SHA256
   "d78c83813f8a05c99b30d981c5c4dbc2460e8a53665749b4ea76efa030ad9fb6")
  (:PATH "processes/r3-inner/report.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085707-command-52310-0/report.lisp")
   :BYTES 317 :SHA256
   "0b93f845519ffb0173bf264a91c9ed99395ba6d38b937f2033a00d59dc2cf4bb")
  (:PATH "processes/r3-inner/report.lisp.gz" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085707-command-52310-0/report.lisp.gz")
   :BYTES 207082 :SHA256
   "447b3e43c86716b12700e21e762a816c9ff4ecc39f614eb35eebce25545acfde")
  (:PATH "processes/r3-outer/conservazione.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085705-command-52273-0/conservazione.lisp")
   :BYTES 1147 :SHA256
   "49efdebdb932ae615a9c598326819664ca6fe67ab0481494049fdd5957ee37b1")
  (:PATH "processes/r3-outer/report.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085705-command-52273-0/report.lisp")
   :BYTES 210957 :SHA256
   "16964ce2133cb6a80785e84582828206f92245ae3b5c3872fd9f83dc1ad76720")
  (:PATH "processes/trace-write/conservazione.lisp" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085685-command-51732-0/conservazione.lisp")
   :BYTES 1147 :SHA256
   "6c245e04c74a8de47d4667e05a515bd67e66c9d844e4464961af4d4a05b444e1")
  (:PATH "processes/trace-write/report.lisp" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-recovery/ArcDocDB/spikes/out/4001085685-command-51732-0/report.lisp")
   :BYTES 210596 :SHA256
   "f42e3ef71171e288afdbb1dbfacf1b6552a27a9c8bd8d010007676f63bc2d41a"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
