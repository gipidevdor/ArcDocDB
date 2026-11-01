(:SCHEMA-VERSION 1 :KIND :METRICS-EVIDENCE-CLOSURE :STATUS :OK
 :DATE-UNIVERSAL-TIME 4002530953 :LISP #A((4) BASE-CHAR . "SBCL") :VERSION
 #A((5) BASE-CHAR . "2.6.9") :OS #A((6) BASE-CHAR . "Darwin") :MACHINE
 #A((5) BASE-CHAR . "ARM64") :QUALIFIED-PRODUCT-COMMIT
 "4aab6777b828b475803c77810e8e9a24149ac1f2"
 :PRODUCT-TEST-ASDF-AND-COUNTER-DRIVER-DIFF :EMPTY
 :C4-FOLLOWUP-SEPARATELY-VERIFIED T :DOCUMENTATION-FOLLOWUP T :COMMANDS
 ((:LABEL "prepare-v1" :RECORD-PATH
   #A((32) BASE-CHAR . "processes/prepare-v1/report.lisp"))
  (:LABEL "collect" :RECORD-PATH
   #A((29) BASE-CHAR . "processes/collect/report.lisp"))
  (:LABEL "recovered-closure" :RECORD-PATH
   #A((39) BASE-CHAR . "processes/recovered-closure/report.lisp"))
  (:LABEL "collector-selftest" :RECORD-PATH
   #A((40) BASE-CHAR . "processes/collector-selftest/report.lisp"))
  (:LABEL "report" :RECORD-PATH
   #A((28) BASE-CHAR . "processes/report/report.lisp"))
  (:LABEL "final-check" :RECORD-PATH
   #A((33) BASE-CHAR . "processes/final-check/report.lisp"))
  (:LABEL "cleanup" :RECORD-PATH
   #A((29) BASE-CHAR . "processes/cleanup/report.lisp")))
 :FILES
 ((:PATH "archive/archive-index.lisp" :BYTES 67313 :SHA256
   "4bddc307e27ee9d536c1d3b2cfb3f940d1f49da8ee848754e9a53bbd9e14dd93")
  (:PATH "archive/catalogo.lisp" :BYTES 403 :SHA256
   "f9ddb7b3fbad37cc5de7e3464b926c8b54a5333331ff2b9fd0a54a7e8128be16")
  (:PATH "archive/ci-self-test/boundaries.lisp" :BYTES 976 :SHA256
   "45a300e40479bcaec51cae42c82b55e481861c06880c2d00527c2289c818df23")
  (:PATH "archive/ci-self-test/conditions.lisp" :BYTES 663 :SHA256
   "d209de8e93efe4255f1ae149b8e88eef50a683378263e7953917230221c9235f")
  (:PATH "archive/ci-self-test/data.lisp" :BYTES 3214 :SHA256
   "1b61eec62d79d44cb0543b91c83c37d8c3ef787f125208c0093df05d63717fb2")
  (:PATH "archive/ci-self-test/measure.lisp" :BYTES 2041 :SHA256
   "9da2833aeafef2ba03a78ef72bc7a1976d1fba4fee3ca693aab46a6e144dcb6c")
  (:PATH "archive/ci-self-test/publication.lisp" :BYTES 1181 :SHA256
   "eb5ada9bf495a2d0c4f265a3499cd941e55c4ba526c118d9091f345b46fff8fc")
  (:PATH "archive/ci-self-test/report.lisp" :BYTES 632 :SHA256
   "1ae97ae4103f11530749a8627e2ba2cc908579dc933ba091a1eafd94a48a5125")
  (:PATH "archive/ci-self-test/tests.lisp" :BYTES 2463 :SHA256
   "8c9a7b4a108d45597a13ce8f189a332e8a362d9a61561604c3f786efb9a78314")
  (:PATH "archive/ci-self-test/workflow.lisp" :BYTES 310 :SHA256
   "f23e28f3852503b75fcedf6218a881660f446a802dbbd7ef3bbc2ca17fe436a7")
  (:PATH "archive/ci-self-test/workflow.lisp.gz" :BYTES 3383 :SHA256
   "65ef5865e2a8bcb699e2b198c990c96183d7e9da6772156178630f8e76782735")
  (:PATH "archive/collection-manifest.lisp" :BYTES 43078 :SHA256
   "b1b8955198826ceefe89526c48187cffe5946d20aa3cae49455f9c353b7295e3")
  (:PATH "archive/collection-source.lisp" :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH "archive/expected-negative.lisp" :BYTES 2683 :SHA256
   "321bae4581a84d6aa06616d46f4e98408c31fe0a437ee176dad5d16a23874653")
  (:PATH "archive/full-tests/tests.events.lisp" :BYTES 318 :SHA256
   "97b96b1c18b980d5fb0c06c5afba68fdd87b03840b49b10671fae489cc74c98d")
  (:PATH "archive/full-tests/tests.events.lisp.gz" :BYTES 157223 :SHA256
   "5de6ac797e8489c92ab7d39f02303b6d2606e99a3ce7bbc287bb8f97be0ff39c")
  (:PATH "archive/full-tests/tests.lisp" :BYTES 309 :SHA256
   "eaeb12c4129a906332e897a518887a25a69826a39b3b1d714b259c49bc3b7812")
  (:PATH "archive/full-tests/tests.lisp.gz" :BYTES 73229 :SHA256
   "005e15966646eb8551a40090e174b9d1b20a9aa2cd12c0d242360b2b90737fba")
  (:PATH "archive/method/independent-histogram-review.lisp" :BYTES 330 :SHA256
   "c91e5dd70963948fda71fc95c3d7d7645f2ce1cceca2016e1bb835ecf308d755")
  (:PATH "archive/method/independent-histogram-review.lisp.gz" :BYTES 6982
   :SHA256 "91d0e5d426f3eed68fb7f6fe35b06ae207f2aea085602b295f6eac877653664f")
  (:PATH "archive/method/independent-increment2-final-review.lisp" :BYTES 337
   :SHA256 "001cb37052b8ca5edd62f51864c3e4dc974b2befa0fa53c8e2c6f70d3195d633")
  (:PATH "archive/method/independent-increment2-final-review.lisp.gz" :BYTES
   6319 :SHA256
   "1e4be6a9cacd51365c08a0577294dd8d88bb7adbc6a3bc1a77889b760082fda6")
  (:PATH "archive/method/independent-increment2-final-tweaks-review.lisp"
   :BYTES 343 :SHA256
   "42f98f7c963a9f0e84c6cf3e56aaa172cde773bfae01e1424145f328504fb095")
  (:PATH "archive/method/independent-increment2-final-tweaks-review.lisp.gz"
   :BYTES 2503 :SHA256
   "d1ba7eee7475eda0325bc5b4330773bbb19367f21ca4d93670537fce43dc5cf6")
  (:PATH "archive/method/independent-increment2-r1-resolution.lisp" :BYTES 337
   :SHA256 "da67fbd4dd1b60a454c774fe7011b3e212cd7c820e35d27eb397d12c96e9a9d4")
  (:PATH "archive/method/independent-increment2-r1-resolution.lisp.gz" :BYTES
   3844 :SHA256
   "0ffaee9e2301f2b407975fc020bc75e8fa4791d7f9afc28d323592b1c826f802")
  (:PATH "archive/method/packet-support.lisp" :BYTES 2296 :SHA256
   "c836d6f7320dcac68829b41d6529c1e8bf12362c099bce147a3a2c1da8fbad4c")
  (:PATH "archive/method/prepare-archive.lisp" :BYTES 317 :SHA256
   "b0e718c895cd399669bc8e6de69b5df7536cb78813894f0a228bdf4101055a80")
  (:PATH "archive/method/prepare-archive.lisp.gz" :BYTES 3585 :SHA256
   "77c0fed0aff8a3a9c451b9448f3e20222fcf3d4b16ffdef517bfd4968c5d66c3")
  (:PATH "archive/method/runtime-tool-followup-review.lisp" :BYTES 826 :SHA256
   "884c148ee3e31dcfca1c5c5d847d8be1e324d654808f5441790809171cfcb476")
  (:PATH "archive/method/static-reviews.lisp" :BYTES 1684 :SHA256
   "49dba73ebd3ed319085f38d3c83227ca79583da5e5fbc96947c081147f0e02d0")
  (:PATH "archive/method/verify-product.lisp" :BYTES 2562 :SHA256
   "1f00edf96224a4aaaa174cd8f21d723e1a75f013d701befe41872dde2cc2351a")
  (:PATH "archive/method/write-report.lisp" :BYTES 314 :SHA256
   "5dfcc9a0935d2bb6464164679ae7975cb5b5342c5fd17944c8a13ea6d1eaf451")
  (:PATH "archive/method/write-report.lisp.gz" :BYTES 4275 :SHA256
   "4278cfa9970d38b41a0953ee47b96542c2935c6db6de3935325a56617e437088")
  (:PATH "archive/observations/bench-2610.lisp" :BYTES 312 :SHA256
   "d7f48f680b0d4a718623f64b77dcfac09d38ba977ae9c2d84dc2729d1668e04d")
  (:PATH "archive/observations/bench-2610.lisp.gz" :BYTES 5264 :SHA256
   "904e3a6188f8de6784c25eb3765aababd710e8074970051908ffb30bc5eecab6")
  (:PATH "archive/observations/bench-269.lisp" :BYTES 311 :SHA256
   "19a24108dd00c5284088fd7991a85561b25c3f6db0f824d43e0c06a0ee49cd7a")
  (:PATH "archive/observations/bench-269.lisp.gz" :BYTES 5236 :SHA256
   "5e2484f89565c794a4a20ea2b37bf4d2b72e1e58113d7be8cee19f292131bf3e")
  (:PATH "archive/processes/audit-269-v1/conservazione.lisp" :BYTES 1217
   :SHA256 "c98d30bef144e5fe59751fdf3d05d18907b8bc6b2c9daffae5b6995b35e28368")
  (:PATH "archive/processes/audit-269-v1/report.lisp" :BYTES 311 :SHA256
   "b0af171a4c803ed4e830b79f5f387e139eaf2b32b8e81a861dc8c22e7a78b8ce")
  (:PATH "archive/processes/audit-269-v1/report.lisp.gz" :BYTES 115561 :SHA256
   "d8783a759475c985e8fc5ad500db11ecf073b4eb1532c315a4c8e73cac04cce5")
  (:PATH "archive/processes/audit-child-01/conservazione.lisp" :BYTES 1177
   :SHA256 "18cd2e480483c792daca293b786a018e05d1baead8bb818905f365cd0d3bcc6f")
  (:PATH "archive/processes/audit-child-01/report.lisp" :BYTES 311 :SHA256
   "4af41a0e08300135f10c8ae5731f0747ea8e8174c79298add0311bf24db7dcaa")
  (:PATH "archive/processes/audit-child-01/report.lisp.gz" :BYTES 112748
   :SHA256 "18c377c93e029fe922632321a35c41c3a297b1ee5d324f7c8c38683e5b7027c9")
  (:PATH "archive/processes/audit-continuation-269-v1/conservazione.lisp"
   :BYTES 1243 :SHA256
   "e6dac0ae7972fada750906a3019298935d8622b9134bcd1f6e86cc07ac13e1f5")
  (:PATH "archive/processes/audit-continuation-269-v1/report.lisp" :BYTES 311
   :SHA256 "638d1fd6d4388e7587f11cc5faece21a2479111773a338eafae26d3841ef05c8")
  (:PATH "archive/processes/audit-continuation-269-v1/report.lisp.gz" :BYTES
   120444 :SHA256
   "cecbe71f8f3e636074085c4e601640ca7fdb50ab6f3a83bbe406a4ff512c7fa2")
  (:PATH "archive/processes/bench-2610/conservazione.lisp" :BYTES 1213 :SHA256
   "081251c27520dcb97d634ad8e36aa3a2ded350b83cfc6e5610f1a9fd1c418f06")
  (:PATH "archive/processes/bench-2610/report.lisp" :BYTES 311 :SHA256
   "16c07ea653a2096ad60fd35b80ebeba6a3708d58dd062d344e815aec5831956f")
  (:PATH "archive/processes/bench-2610/report.lisp.gz" :BYTES 118482 :SHA256
   "7a81f56fdc7f82b5e4a779f3186ded0ea6976b952b92151b5664adb546a3e8c8")
  (:PATH "archive/processes/bench-269/conservazione.lisp" :BYTES 1211 :SHA256
   "4a748d73e34b44ff4b2c598424f2716ddb98d371c9ddc15de1493b77d8f002c6")
  (:PATH "archive/processes/bench-269/report.lisp" :BYTES 311 :SHA256
   "0adaf10152c1bf09728a108201fb9836b4da7d14b9a8e0100d4a63a55c7e636a")
  (:PATH "archive/processes/bench-269/report.lisp.gz" :BYTES 118431 :SHA256
   "ca407bb4bd7b135ae9aa61a55d95a44d0fb8cc07f1c1b29347fe32b1135bcb1f")
  (:PATH "archive/processes/bench-negative-269/conservazione.lisp" :BYTES 1229
   :SHA256 "8ced49be66bfe443afe1768f48270d9e2554d60cde33e3152a4a78ab9af6c819")
  (:PATH "archive/processes/bench-negative-269/report.lisp" :BYTES 311 :SHA256
   "3811de742d0ab076e9c5c842324ca4804b89b3ba0080496133b85e4dd78e3d71")
  (:PATH "archive/processes/bench-negative-269/report.lisp.gz" :BYTES 113852
   :SHA256 "ff2058970bde0012c88ac4a792dfdf1243adb33e9e60c16e06897ff756992770")
  (:PATH "archive/processes/bench-selftest-269/conservazione.lisp" :BYTES 1229
   :SHA256 "5521e3a6519111de97b3eeeb82c5ab0e14b95d205d46dfc7a1d02954e1718907")
  (:PATH "archive/processes/bench-selftest-269/report.lisp" :BYTES 311 :SHA256
   "17bda976ea074299d4aa2f03a9b53e80ff356d90fb2bbc13c13b6a28deac0772")
  (:PATH "archive/processes/bench-selftest-269/report.lisp.gz" :BYTES 115511
   :SHA256 "30cc11f27f4c4d67a3fff87979d2af7c201493a283cb675cdaa88039737e48d1")
  (:PATH "archive/processes/focused-2610-v1/conservazione.lisp" :BYTES 1223
   :SHA256 "09c5b4f825f98d30b0614abd6d05787c0735e98721f3fe33f3d775c9ed77cc6e")
  (:PATH "archive/processes/focused-2610-v1/report.lisp" :BYTES 311 :SHA256
   "eb7964f84175d9774a8b3ce39953284b3ec1d7f04f11c3f4505e6d1246540bfa")
  (:PATH "archive/processes/focused-2610-v1/report.lisp.gz" :BYTES 114442
   :SHA256 "f24240fa022c17357c525fdd3bebb0dd67fbbf5932fee6bad115d3bab4dfe468")
  (:PATH "archive/processes/focused-269-v1/conservazione.lisp" :BYTES 1221
   :SHA256 "cd8d47ee8b9dfb367e05e3dcb705fa691c4804d24669a69692205097f2a6340d")
  (:PATH "archive/processes/focused-269-v1/report.lisp" :BYTES 311 :SHA256
   "b42ed5f47c9fc60ccdcdcd7df781a89d50f2a58866006b55640d40893303b5f6")
  (:PATH "archive/processes/focused-269-v1/report.lisp.gz" :BYTES 114399
   :SHA256 "e4a13a82765885aad1f56fbfeb4feb6c0a9d7e027df6d6bd33129870690d5c72")
  (:PATH "archive/processes/full-269-v1/conservazione.lisp" :BYTES 1215 :SHA256
   "986503b06e0110a34b9894f9120c46386ad2d1343d60174c350274dc7e203da1")
  (:PATH "archive/processes/full-269-v1/report.lisp" :BYTES 311 :SHA256
   "4b3fe9bae8278f193a598f0b8adac2306d6895a3471aaedb5e8fb9da650c7cb5")
  (:PATH "archive/processes/full-269-v1/report.lisp.gz" :BYTES 170168 :SHA256
   "fb7306ed83fd8b0768bf63056d55f97eb34d1812b2a13ef9f98243b4bf680dcd")
  (:PATH "archive/processes/history-269-v1/conservazione.lisp" :BYTES 1221
   :SHA256 "a3af6650cdf859a037d3dd81e93121fda8eda35ef679a4452630e712f46af513")
  (:PATH "archive/processes/history-269-v1/report.lisp" :BYTES 311 :SHA256
   "3279af35415cc9333661043b8ac22a40872ff6df36322bf0ae7cd104e3ae2bd9")
  (:PATH "archive/processes/history-269-v1/report.lisp.gz" :BYTES 112830
   :SHA256 "dd265cc139a3233dcbf8f5d4687b8dfb7d9c34f51b198bc1b23c7e9869d031e8")
  (:PATH "archive/processes/runtime-tools-2610-v1/conservazione.lisp" :BYTES
   1235 :SHA256
   "156475b8a697002999249a68c06e6826309e45f101fffa57ae55b366b3e2e76d")
  (:PATH "archive/processes/runtime-tools-2610-v1/report.lisp" :BYTES 311
   :SHA256 "62816952fe1f7731af311ae8f8b777862f6d355b69bf418c847264d30d1da222")
  (:PATH "archive/processes/runtime-tools-2610-v1/report.lisp.gz" :BYTES 117186
   :SHA256 "fe82f4df865f10a199d93fc83b674b3a1ed8cad93ea5cc03e9aa5d71eb1f1442")
  (:PATH "archive/processes/runtime-tools-269-v1/conservazione.lisp" :BYTES
   1233 :SHA256
   "ae18a9a184f074ba1198f5093ad7c72407ef30ccde86aa269cac3467d6b54193")
  (:PATH "archive/processes/runtime-tools-269-v1/report.lisp" :BYTES 311
   :SHA256 "a9507a83d792f41de9cfffdecc985d84790ea5cecd734051f4d56aaf7d4c22bb")
  (:PATH "archive/processes/runtime-tools-269-v1/report.lisp.gz" :BYTES 117142
   :SHA256 "2265bf7e2aacad4dbf311f50469055e3f05a3a577736cc8d5201297969898ef9")
  (:PATH "archive/processes/runtime-tools-269-v2/conservazione.lisp" :BYTES
   1233 :SHA256
   "9b98cabb10a7f66814ef214fb1c588912f92672d6c51e15f837d15308511c93b")
  (:PATH "archive/processes/runtime-tools-269-v2/report.lisp" :BYTES 311
   :SHA256 "c9926aee4f8aeb755d83e6d5cc8479eb84c9f4873e5ecee075d4d5984f0a3194")
  (:PATH "archive/processes/runtime-tools-269-v2/report.lisp.gz" :BYTES 117185
   :SHA256 "aa35d43ed7c5c2b3295529f3098ab973b84a1cc49e9e836e2355f8c739bbb1d0")
  (:PATH "archive/processes/trace-generation/conservazione.lisp" :BYTES 1225
   :SHA256 "43175c76d4f4f1cd49b996f2a69cc9f714302c3afea9d47292c8aa2b0d0e3c70")
  (:PATH "archive/processes/trace-generation/report.lisp" :BYTES 311 :SHA256
   "d275a8e7ce358fb854bb2a38190e81b1f01bd5768e95b6b8ba91bc409c834682")
  (:PATH "archive/processes/trace-generation/report.lisp.gz" :BYTES 112769
   :SHA256 "bfde465cc2af4401bc0cfe6ffeebd5adfc48acfd9e903426c89da9889ea653bf")
  (:PATH "archive/qualification.lisp" :BYTES 314 :SHA256
   "820c6ead0b31e8a7ec2e44c86ee94fac14b0d1530853562a53174ae43100ae5d")
  (:PATH "archive/qualification.lisp.gz" :BYTES 2228 :SHA256
   "57d15bcd3a5831b3a94c53ba45acd041aa7e4c22b72eac519bde576fd8812881")
  (:PATH
   "archive/runtime-controls/runtime-tools-2610-v1/fixture-1/completion-exit/isolated-build.lisp"
   :BYTES 199 :SHA256
   "b8bb4416a818775bae5c77341eeec2c356a2733f633ac2bc8b6ac3ff955d05e0")
  (:PATH
   "archive/runtime-controls/runtime-tools-2610-v1/fixture-1/completion-exit/stderr.log"
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "archive/runtime-controls/runtime-tools-2610-v1/fixture-1/completion-exit/stdout.log"
   :BYTES 107 :SHA256
   "4f22544421d9012fe132a36bf15950cd327ca959b8f9c5ef3d386e0c8b62a25c")
  (:PATH "archive/runtime-controls/runtime-tools-2610-v1/fixture-1/report.lisp"
   :BYTES 2125 :SHA256
   "44da701d782d9f5f9f183c06b36e480332412aec2ea3fd1b8e50362bfe8f8be0")
  (:PATH
   "archive/runtime-controls/runtime-tools-2610-v1/fixture-1/signal/isolated-build.lisp"
   :BYTES 249 :SHA256
   "a345276e3dfe377c0bbd359793165915b1527938a65250d367ce5ac079feecc1")
  (:PATH
   "archive/runtime-controls/runtime-tools-2610-v1/fixture-1/signal/stderr.log"
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "archive/runtime-controls/runtime-tools-2610-v1/fixture-1/signal/stdout.log"
   :BYTES 128 :SHA256
   "e3502e714a0530acb1f0130c4ced4a016607bcb067e3686f6f29704db8423ea5")
  (:PATH
   "archive/runtime-controls/runtime-tools-2610-v1/fixture-2/completion-exit/isolated-build.lisp"
   :BYTES 197 :SHA256
   "1a45dcf8a6d03f1e8866e49280c6f0edb894320c90624d5620fad1e3d546cea9")
  (:PATH
   "archive/runtime-controls/runtime-tools-2610-v1/fixture-2/completion-exit/stderr.log"
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "archive/runtime-controls/runtime-tools-2610-v1/fixture-2/completion-exit/stdout.log"
   :BYTES 105 :SHA256
   "5e630c1b44d68ce71b27d151e76bf367e3cbd941200adc36cdd30e0fe7390531")
  (:PATH "archive/runtime-controls/runtime-tools-2610-v1/fixture-2/report.lisp"
   :BYTES 2107 :SHA256
   "cd106ae6f7597e17192964f938ef2f0643f174363ee8593f3d03dd9b852b1bf9")
  (:PATH
   "archive/runtime-controls/runtime-tools-2610-v1/fixture-2/signal/isolated-build.lisp"
   :BYTES 247 :SHA256
   "ff5cf55dda241d32ea1b4308172c7dc526436cbf1d546e7471148cee95a873d1")
  (:PATH
   "archive/runtime-controls/runtime-tools-2610-v1/fixture-2/signal/stderr.log"
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "archive/runtime-controls/runtime-tools-2610-v1/fixture-2/signal/stdout.log"
   :BYTES 126 :SHA256
   "3697c68fa71f124c8d05d8cc5d649a744586a10989eb2e67c5bdce6bfc760142")
  (:PATH
   "archive/runtime-controls/runtime-tools-269-v1/fixture-1/completion-exit/isolated-build.lisp"
   :BYTES 199 :SHA256
   "b8bb4416a818775bae5c77341eeec2c356a2733f633ac2bc8b6ac3ff955d05e0")
  (:PATH
   "archive/runtime-controls/runtime-tools-269-v1/fixture-1/completion-exit/stderr.log"
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "archive/runtime-controls/runtime-tools-269-v1/fixture-1/completion-exit/stdout.log"
   :BYTES 107 :SHA256
   "4f22544421d9012fe132a36bf15950cd327ca959b8f9c5ef3d386e0c8b62a25c")
  (:PATH "archive/runtime-controls/runtime-tools-269-v1/fixture-1/report.lisp"
   :BYTES 2149 :SHA256
   "e01c18f054a9e0a3d7e0669c1cbe589905300b2810160c3777b068a81cf7000a")
  (:PATH
   "archive/runtime-controls/runtime-tools-269-v1/fixture-1/signal/isolated-build.lisp"
   :BYTES 249 :SHA256
   "a345276e3dfe377c0bbd359793165915b1527938a65250d367ce5ac079feecc1")
  (:PATH
   "archive/runtime-controls/runtime-tools-269-v1/fixture-1/signal/stderr.log"
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "archive/runtime-controls/runtime-tools-269-v1/fixture-1/signal/stdout.log"
   :BYTES 128 :SHA256
   "e3502e714a0530acb1f0130c4ced4a016607bcb067e3686f6f29704db8423ea5")
  (:PATH
   "archive/runtime-controls/runtime-tools-269-v1/fixture-2/completion-exit/isolated-build.lisp"
   :BYTES 197 :SHA256
   "1a45dcf8a6d03f1e8866e49280c6f0edb894320c90624d5620fad1e3d546cea9")
  (:PATH
   "archive/runtime-controls/runtime-tools-269-v1/fixture-2/completion-exit/stderr.log"
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "archive/runtime-controls/runtime-tools-269-v1/fixture-2/completion-exit/stdout.log"
   :BYTES 105 :SHA256
   "5e630c1b44d68ce71b27d151e76bf367e3cbd941200adc36cdd30e0fe7390531")
  (:PATH "archive/runtime-controls/runtime-tools-269-v1/fixture-2/report.lisp"
   :BYTES 2131 :SHA256
   "9f769a06ad476098da3bbcad78d8c4519ff5d90939c6a1cd25d1d07c321b59f4")
  (:PATH
   "archive/runtime-controls/runtime-tools-269-v1/fixture-2/signal/isolated-build.lisp"
   :BYTES 247 :SHA256
   "ff5cf55dda241d32ea1b4308172c7dc526436cbf1d546e7471148cee95a873d1")
  (:PATH
   "archive/runtime-controls/runtime-tools-269-v1/fixture-2/signal/stderr.log"
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "archive/runtime-controls/runtime-tools-269-v1/fixture-2/signal/stdout.log"
   :BYTES 126 :SHA256
   "3697c68fa71f124c8d05d8cc5d649a744586a10989eb2e67c5bdce6bfc760142")
  (:PATH
   "archive/runtime-controls/runtime-tools-269-v2/fixture-1/completion-exit/isolated-build.lisp"
   :BYTES 199 :SHA256
   "b8bb4416a818775bae5c77341eeec2c356a2733f633ac2bc8b6ac3ff955d05e0")
  (:PATH
   "archive/runtime-controls/runtime-tools-269-v2/fixture-1/completion-exit/stderr.log"
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "archive/runtime-controls/runtime-tools-269-v2/fixture-1/completion-exit/stdout.log"
   :BYTES 107 :SHA256
   "4f22544421d9012fe132a36bf15950cd327ca959b8f9c5ef3d386e0c8b62a25c")
  (:PATH "archive/runtime-controls/runtime-tools-269-v2/fixture-1/report.lisp"
   :BYTES 2149 :SHA256
   "7b1f980832d48991889e419f4a3f984294e8544019dafdba217930d2fffb5397")
  (:PATH
   "archive/runtime-controls/runtime-tools-269-v2/fixture-1/signal/isolated-build.lisp"
   :BYTES 249 :SHA256
   "a345276e3dfe377c0bbd359793165915b1527938a65250d367ce5ac079feecc1")
  (:PATH
   "archive/runtime-controls/runtime-tools-269-v2/fixture-1/signal/stderr.log"
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "archive/runtime-controls/runtime-tools-269-v2/fixture-1/signal/stdout.log"
   :BYTES 128 :SHA256
   "e3502e714a0530acb1f0130c4ced4a016607bcb067e3686f6f29704db8423ea5")
  (:PATH
   "archive/runtime-controls/runtime-tools-269-v2/fixture-2/completion-exit/isolated-build.lisp"
   :BYTES 197 :SHA256
   "1a45dcf8a6d03f1e8866e49280c6f0edb894320c90624d5620fad1e3d546cea9")
  (:PATH
   "archive/runtime-controls/runtime-tools-269-v2/fixture-2/completion-exit/stderr.log"
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "archive/runtime-controls/runtime-tools-269-v2/fixture-2/completion-exit/stdout.log"
   :BYTES 105 :SHA256
   "5e630c1b44d68ce71b27d151e76bf367e3cbd941200adc36cdd30e0fe7390531")
  (:PATH "archive/runtime-controls/runtime-tools-269-v2/fixture-2/report.lisp"
   :BYTES 2131 :SHA256
   "b98f64c4d9ebdcac2740057d5a619148953d1157910f1db9f0b8017a8db2e613")
  (:PATH
   "archive/runtime-controls/runtime-tools-269-v2/fixture-2/signal/isolated-build.lisp"
   :BYTES 247 :SHA256
   "ff5cf55dda241d32ea1b4308172c7dc526436cbf1d546e7471148cee95a873d1")
  (:PATH
   "archive/runtime-controls/runtime-tools-269-v2/fixture-2/signal/stderr.log"
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH
   "archive/runtime-controls/runtime-tools-269-v2/fixture-2/signal/stdout.log"
   :BYTES 126 :SHA256
   "3697c68fa71f124c8d05d8cc5d649a744586a10989eb2e67c5bdce6bfc760142")
  (:PATH "archive/runtime-failure/report.lisp" :BYTES 1012 :SHA256
   "92b0b700e3aa9e67d6dba15a353e3a551ba2762327094c108136406615960a18")
  (:PATH "archive/runtime-failure/signal/isolated-build.lisp" :BYTES 249
   :SHA256 "a345276e3dfe377c0bbd359793165915b1527938a65250d367ce5ac079feecc1")
  (:PATH "archive/runtime-failure/signal/stderr.log" :BYTES 180 :SHA256
   "78286f111482a806f005c6fe4bac6b4d2adff427ea4a93f4b3b62ee0fdd647ec")
  (:PATH "archive/runtime-failure/signal/stdout.log" :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "archive/source-identity.lisp" :BYTES 318 :SHA256
   "cc0765196faef9cb6e48135567d7e9ac81dc7cfe1f6c2c3b9bf874abc03dccb4")
  (:PATH "archive/source-identity.lisp.gz" :BYTES 28072 :SHA256
   "e444bffbfddff95c312454abc961392701d9754613fae2b419511c34a03702ed")
  (:PATH "archive/spikes-check/SPK-01.lisp" :BYTES 308 :SHA256
   "4b836ce989628d93fc705b2bd287e0b9544073708f9ce4f22c4f877590e8ff63")
  (:PATH "archive/spikes-check/SPK-01.lisp.gz" :BYTES 2881 :SHA256
   "7707ed6dba5a2560b036e2feac967cf15c766b1b091bf401e93f22e4e2f0127b")
  (:PATH "archive/spikes-check/SPK-02.lisp" :BYTES 1605 :SHA256
   "76b797d80ff6fa75c91b941590edbbfea84e96a187a32bf7c19a1adadd4527ed")
  (:PATH "archive/spikes-check/SPK-03.lisp" :BYTES 3658 :SHA256
   "77a8d809eb802954574c96958e51ac23a4266ded3ebeef52a87cb51e3df71552")
  (:PATH "archive/spikes-check/SPK-04.lisp" :BYTES 307 :SHA256
   "099d44e2592fb71c73e6dd0744991cea2efa8e8ac50e1153f9b627aa8622e5af")
  (:PATH "archive/spikes-check/SPK-04.lisp.gz" :BYTES 1612 :SHA256
   "c108e438a0556b3420b4e46fca25efa72aff8f67efd960b63d514a936b50b231")
  (:PATH "archive/spikes-check/SPK-05.lisp" :BYTES 308 :SHA256
   "32ab1cb66ded3c4d4e7d36aa5cb78b05fdb93bbcafe1180e81439574e99f5c5c")
  (:PATH "archive/spikes-check/SPK-05.lisp.gz" :BYTES 1986 :SHA256
   "c4db04cb0f1fdecf671ff75fbc9728810539d0baed0f2287d90d2b27ce23b62b")
  (:PATH "archive/spikes-check/SPK-06.lisp" :BYTES 308 :SHA256
   "d1001182635d44265fdd289f249353ce68c1cdb8eedc8246fb730207fd1b705a")
  (:PATH "archive/spikes-check/SPK-06.lisp.gz" :BYTES 4132 :SHA256
   "9caed45d7113c45fece9e0b46efe0f8f9f6a1bbada50f8d7f0d5dbb0160e258f")
  (:PATH "archive/spikes-check/SPK-07.lisp" :BYTES 318 :SHA256
   "79bfad994b5a735b54a87855baba85701f1edd71f74c75307319b5f8f1a1032c")
  (:PATH "archive/spikes-check/SPK-07.lisp.gz" :BYTES 411750 :SHA256
   "c4f43437935fc3f160ef3763b86109c2f24aedc63bdf633e872348a4afede8d5")
  (:PATH "archive/spikes-check/SPK-08.lisp" :BYTES 310 :SHA256
   "39ce57b027a24248fade46d91d6c391f1f714bafe7d22f3b510845eced5a6f79")
  (:PATH "archive/spikes-check/SPK-08.lisp.gz" :BYTES 45436 :SHA256
   "e6bc56caa389808538ff2d6f6288a949ebf7eb3468ddc3415bcb775a10814485")
  (:PATH "archive/spikes-check/SPK-09.lisp" :BYTES 2472 :SHA256
   "59483f3a65e0f07c4bef00e4e2d3d2c9574c42f3999080425c092c805a9f38cc")
  (:PATH "archive/spikes-check/SPK-10.lisp" :BYTES 308 :SHA256
   "2572df05bf5ab0905b40e7bd431a7d741c916fa32dca21994d83c1612a27dcc8")
  (:PATH "archive/spikes-check/SPK-10.lisp.gz" :BYTES 4298 :SHA256
   "fe915b2795e78eb73ce19e77614dd4b5f6bbfafb076e4f2da083dd4cf7a90cf5")
  (:PATH "archive/spikes-check/SPK-11.lisp" :BYTES 308 :SHA256
   "66d7a9af2e6896db493bc5ed287c4eed1a24ee4e52a8d561706238caee065e35")
  (:PATH "archive/spikes-check/SPK-11.lisp.gz" :BYTES 7990 :SHA256
   "ba4b702a4bdc963a2650efd4753bc8e44c6a25c81dcdb9a4edbfd5aefa357f51")
  (:PATH "archive/spikes-check/conservazione.lisp" :BYTES 2341 :SHA256
   "876bb67cd5fad43b51a6ca7da8a22ede247a7666d072e568ce1313382d3dc7e4")
  (:PATH "archive/spikes-check/report.lisp" :BYTES 318 :SHA256
   "901af9d4175d35bbc074dad7d8653ad67c5ffff6554f745679aca392947c29ed")
  (:PATH "archive/spikes-check/report.lisp.gz" :BYTES 483740 :SHA256
   "6d839f65bf537826441d4ee2815f3fbf7c7c3c058f09142f2507f4769a2bab98")
  (:PATH "cleanup.lisp" :BYTES 2552 :SHA256
   "e3ce701352649a33f2ebd78a7381b133ea318f01f1ce99f2cbd04d9902f63851")
  (:PATH "receipts/cleanup-plan.lisp" :BYTES 2303 :SHA256
   "b9f97ae853eb83460dca8cf75dfc669b196bc51195f1342234e9f3890e03b4a7")
  (:PATH "receipts/closed-check.log" :BYTES 180 :SHA256
   "a3e23ea5af5b62b579fe80b7b522fee20a4fce9a5b474af9db1a104a558e23dc")
  (:PATH "receipts/collection-recovery.lisp" :BYTES 369 :SHA256
   "1cbea1f93c82bdd3ddae5d761eccd73530c9b5df7c1329062ae27187eafe9afc")
  (:PATH "receipts/collection.lisp" :BYTES 312 :SHA256
   "b1fedddaa513caa1636ec04de5ee41fbedd6774ae70b07e2bd5ac8360c9566d9")
  (:PATH "receipts/collection.lisp.gz" :BYTES 9869 :SHA256
   "c4e9c9d2c1eb96e5d8af30a4edae32c929e3b616fac16b164e000890a41bafa8")
  (:PATH "receipts/method/cleanup-owned.lisp" :BYTES 2470 :SHA256
   "80c835b296ab17935fd81ffeaa608ee47fdc08b3d69e7465d296a64490dbb9d3")
  (:PATH "receipts/method/close-publication.lisp" :BYTES 318 :SHA256
   "833c23a68c877b294e42f09344c7432dfa0ded22180bd8260ff3182f95b5f67f")
  (:PATH "receipts/method/close-publication.lisp.gz" :BYTES 1813 :SHA256
   "7842edd3b78188c3942dc9c57d6b111cb9d11b4680155e50c0b58c3e76723355")
  (:PATH "receipts/method/packet-support.lisp" :BYTES 2296 :SHA256
   "c836d6f7320dcac68829b41d6529c1e8bf12362c099bce147a3a2c1da8fbad4c")
  (:PATH "receipts/processes/cleanup/conservazione.lisp" :BYTES 1209 :SHA256
   "47c90f0a4edd4d86c352c422b6cd64e78818b6f8eed6980ab2070e937207df45")
  (:PATH "receipts/processes/cleanup/report.lisp" :BYTES 311 :SHA256
   "2134a439a3938d9ea9899e8b003910752d4b7701610848ed286b6906e31100d0")
  (:PATH "receipts/processes/cleanup/report.lisp.gz" :BYTES 113058 :SHA256
   "2d5669f8c3d9699d038a6cb50f3912e337e467a9824c0d2d3272bb7aef1b9f85")
  (:PATH "receipts/processes/collect/conservazione.lisp" :BYTES 1209 :SHA256
   "98f4f59377870ea4d6656516c163a720d6097880f00c73979e1805504321529d")
  (:PATH "receipts/processes/collect/report.lisp" :BYTES 311 :SHA256
   "193b2f453e3d938b20cca336671f63dad2f2121198bfd05c3cb0bfda8ad37e42")
  (:PATH "receipts/processes/collect/report.lisp.gz" :BYTES 112835 :SHA256
   "99cc5abdbf245b2731e266badc774d387b20ff7736b6fd33a0bda26c739beb92")
  (:PATH "receipts/processes/collector-selftest/conservazione.lisp" :BYTES 1231
   :SHA256 "6edece54360723052a2549a21a83355c02a5c9529c8a0b15aa9deb683f29a64f")
  (:PATH "receipts/processes/collector-selftest/report.lisp" :BYTES 311 :SHA256
   "9ca291872215d02d18ba2199191b3299175c328715c8a9a5d9d0f4181ca84c3f")
  (:PATH "receipts/processes/collector-selftest/report.lisp.gz" :BYTES 115590
   :SHA256 "9fb566562ea21bce1ab63a7ed984859ab5232790c38d66257f071c60f91d70b6")
  (:PATH "receipts/processes/final-check/conservazione.lisp" :BYTES 1217
   :SHA256 "125df66a7e27b5d8edc809c206a280b7ce3a910186616e272895410d75773ad0")
  (:PATH "receipts/processes/final-check/report.lisp" :BYTES 311 :SHA256
   "e812808165af473e288423d15a9bb38ffad166572ca2aad84fed9687c70704e7")
  (:PATH "receipts/processes/final-check/report.lisp.gz" :BYTES 113028 :SHA256
   "67194f086058bd85ff5182a6f30a96c54936ec402f4bf82e94b6f58241a2cd94")
  (:PATH "receipts/processes/prepare-v1/conservazione.lisp" :BYTES 1215 :SHA256
   "86cd1592b4ea1de56c00c6c3eba28713f267aed97b771d12d6243a97b03d176d")
  (:PATH "receipts/processes/prepare-v1/report.lisp" :BYTES 311 :SHA256
   "34e7a4ce8e04bd904a63243b279356349fe79c48c9711197d66390a0104ac19e")
  (:PATH "receipts/processes/prepare-v1/report.lisp.gz" :BYTES 112598 :SHA256
   "25a195e27c6e8f97ad241ec9604b6f4a02618302abfb186a7bf7e82b0bae5da8")
  (:PATH "receipts/processes/recovered-closure/conservazione.lisp" :BYTES 1229
   :SHA256 "3c8b3ec1e16a6e3ce96838fec773cb9e83abf48b222771b3c59c24ae8ef701b7")
  (:PATH "receipts/processes/recovered-closure/report.lisp" :BYTES 311 :SHA256
   "088a057cd42c7c9f3d3832b3647ba3b14ad064fc5599310366df9a6787fea052")
  (:PATH "receipts/processes/recovered-closure/report.lisp.gz" :BYTES 114348
   :SHA256 "06be296fe97d1f8672a5ca3a16b09797c593fb1f1a318dc9963ca2608195603f")
  (:PATH "receipts/processes/report/conservazione.lisp" :BYTES 1207 :SHA256
   "642b65dfba830ecf0d69a1b8a9984aaf3c6b47ae6b44869435307d2338ccf806")
  (:PATH "receipts/processes/report/report.lisp" :BYTES 311 :SHA256
   "e222b2023fba439c3e522f4189bc6ce21e7f5f95c7c730112ce32b156a469544")
  (:PATH "receipts/processes/report/report.lisp.gz" :BYTES 112640 :SHA256
   "5b286d4661ecc3fbbdeba88ef604a19263f3b43b25b41ae17d3d1dac84b63d35")
  (:PATH "report.md" :BYTES 9471 :SHA256
   "bd5d32250c4a375c6540139e19248574cb746d3f765aada048f187518a1950ee"))
 :FILE-COUNT 187 :STORED-LOGICAL-BYTES 4115481 :LIMITS
 (:FINITE-PRECEDING-ARTIFACT-RECEIPT :SELF-EXCLUDED
  :NO-REQUIREMENT-OR-ENGINE-PERFORMANCE-PROMOTION
  :ALL-SOURCE-COMMAND-OUTPUT-PRESERVED :NOT-PHYSICAL-DISK-USAGE))
