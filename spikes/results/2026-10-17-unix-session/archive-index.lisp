(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "command-0" :RECORD-PATH "processes/command-0/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((21) BASE-CHAR . "tools/run-spikes.lisp")
    #A((7) BASE-CHAR . "--check") #A((6) BASE-CHAR . "SPK-11"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-1" :RECORD-PATH "processes/command-1/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script") #A((21) BASE-CHAR . "tools/run-spikes.lisp")
    #A((7) BASE-CHAR . "--check") #A((6) BASE-CHAR . "SPK-11"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-2" :RECORD-PATH "processes/command-2/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "make") #A((11) BASE-CHAR . "trace-write")) :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-3" :RECORD-PATH "processes/command-3/report.lisp" :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "command-4" :RECORD-PATH "processes/command-4/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((67) BASE-CHAR
       . "/tmp/arcdocdb-unix-integration-Zq6kA8/verify-final-integration.lisp")
    #A((49) BASE-CHAR . "spikes/out/4001224473-command-10725-0/report.lisp")
    #A((49) BASE-CHAR . "/tmp/arcdocdb-session-5nljuC/verified-inputs.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((50) BASE-CHAR . "/private/tmp/arcdocdb-session-5nljuC/manifest.lisp")
   :BYTES 9163 :SHA256
   "b30fd75f8d480e00119fe79b1473f8b828dad3de0c983c2443085be39e8e5d69")
  (:PATH "collection-source.lisp" :SOURCE
   #A((74) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH "processes/command-0/conservazione.lisp" :SOURCE
   #A((95) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001224273-command-9656-0/conservazione.lisp")
   :BYTES 1076 :SHA256
   "95847efca20c8a5d9f16972e54dfa6f584236175b4e72b55c9479ff3140e6bab")
  (:PATH "processes/command-0/report.lisp" :SOURCE
   #A((88) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001224273-command-9656-0/report.lisp")
   :BYTES 267039 :SHA256
   "546438536097edbb6676462e6462bac9eaccae69cb9952880c1cb6a5c403c324")
  (:PATH "processes/command-1/conservazione.lisp" :SOURCE
   #A((95) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001224314-command-9991-0/conservazione.lisp")
   :BYTES 1076 :SHA256
   "292771dc847ffe9c6e84bff7ec678b9e36d50666a0c100e7b46bf291c69740bd")
  (:PATH "processes/command-1/report.lisp" :SOURCE
   #A((88) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001224314-command-9991-0/report.lisp")
   :BYTES 263408 :SHA256
   "d61fb20279d790defb58002473024bf70495093ea26ce318138880a5c592da73")
  (:PATH "processes/command-2/conservazione.lisp" :SOURCE
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001224410-command-10469-0/conservazione.lisp")
   :BYTES 1079 :SHA256
   "77bff02fb6ac1ab98d33628e9ffc4b638664f46d444991753e0fb3649e449074")
  (:PATH "processes/command-2/report.lisp" :SOURCE
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001224410-command-10469-0/report.lisp")
   :BYTES 263327 :SHA256
   "aa5f99155267bd55c7057aac64f8074b742d22f3222de1b3a563a66537546395")
  (:PATH "processes/command-3/conservazione.lisp" :SOURCE
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001224473-command-10725-0/conservazione.lisp")
   :BYTES 1635 :SHA256
   "7d2109200fee878782c9b153da089a6cb41d1d438d8e29a47017f07b9563c681")
  (:PATH "processes/command-3/report.lisp" :SOURCE
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001224473-command-10725-0/report.lisp")
   :BYTES 317 :SHA256
   "865b0c23620fe97f292e8d6df5fc7055a414c6bef3578d01e76907d7c422bd8e")
  (:PATH "processes/command-3/report.lisp.gz" :SOURCE
   #A((92) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001224473-command-10725-0/report.lisp.gz")
   :BYTES 259579 :SHA256
   "6937cec8beec07fb5da1126683333a3d942c8e1f11637f95dfdb434c07a33225")
  (:PATH "processes/command-4/conservazione.lisp" :SOURCE
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001225101-command-17794-0/conservazione.lisp")
   :BYTES 1079 :SHA256
   "57a3d630188f559606b9d056ff1c19125724388507b28eb41dbcc8504a6b9ba9")
  (:PATH "processes/command-4/report.lisp" :SOURCE
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001225101-command-17794-0/report.lisp")
   :BYTES 263114 :SHA256
   "781c447256b93fe6b826dcdd1db636c7b65068ab8c811cf8e0c8813814aa1473")
  (:PATH "raw/harness-0/SPK-01.lisp" :SOURCE
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001225008-check-17024-0/SPK-01.lisp")
   :BYTES 27228 :SHA256
   "993fc6d5b4e91f9664189293f4d59356a1ddac5ee2d8a373ef767c9c54a0982b")
  (:PATH "raw/harness-0/SPK-02.lisp" :SOURCE
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001225008-check-17024-0/SPK-02.lisp")
   :BYTES 1607 :SHA256
   "dcaecac75ac84b5d3ff7276b20209ecebad55f3288d269d4d72a0bd3addb3e21")
  (:PATH "raw/harness-0/SPK-03.lisp" :SOURCE
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001225008-check-17024-0/SPK-03.lisp")
   :BYTES 3596 :SHA256
   "24633e06e5617c1379a34c7deb443d5ce61ba7062db98a3d0185d9afc5baf22b")
  (:PATH "raw/harness-0/SPK-04.lisp" :SOURCE
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001225008-check-17024-0/SPK-04.lisp")
   :BYTES 6752 :SHA256
   "915d267f2dfb6f907739f4adcf85fc5e617cdb99fefe55cf572506ce1bb32800")
  (:PATH "raw/harness-0/SPK-05.lisp" :SOURCE
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001225008-check-17024-0/SPK-05.lisp")
   :BYTES 10143 :SHA256
   "68ed8b9c86f9717dc90e247498a8f1892172934ead11a66fa50ba56d497c970b")
  (:PATH "raw/harness-0/SPK-06.lisp" :SOURCE
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001225008-check-17024-0/SPK-06.lisp")
   :BYTES 24124 :SHA256
   "53433fa4923a8279207a5a53b04e4aa35bbf9e7c72dc355632132255912aad46")
  (:PATH "raw/harness-0/SPK-07.lisp" :SOURCE
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001225008-check-17024-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "e18e22370b3a70147bec6f64f52ec958a479ea030177d34c0adde1698f219f04")
  (:PATH "raw/harness-0/SPK-07.lisp.gz" :SOURCE
   #A((90) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001225008-check-17024-0/SPK-07.lisp.gz")
   :BYTES 410640 :SHA256
   "c5e3f39b9afef1060c9f9acc39ff4294890a303fe8b1f638449fb1386e2ed1dc")
  (:PATH "raw/harness-0/SPK-08.lisp" :SOURCE
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001225008-check-17024-0/SPK-08.lisp")
   :BYTES 291712 :SHA256
   "f6d1f9a92988580f09e5f4534159637903e0421bd71d98e839b9687fd737ad12")
  (:PATH "raw/harness-0/SPK-09.lisp" :SOURCE
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001225008-check-17024-0/SPK-09.lisp")
   :BYTES 2472 :SHA256
   "f8b14f2710495c33e916cbb76da2092291c6d918624b01e28a10a3c59ad568c5")
  (:PATH "raw/harness-0/SPK-10.lisp" :SOURCE
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001225008-check-17024-0/SPK-10.lisp")
   :BYTES 22977 :SHA256
   "459e695888935feb443d41f2c7bd45eba9ae9c9897c2358d72711e45e4d2d7be")
  (:PATH "raw/harness-0/SPK-11.lisp" :SOURCE
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001225008-check-17024-0/SPK-11.lisp")
   :BYTES 29244 :SHA256
   "66bc8389ae559dbcaffd70f5d62462fa9fa2473088d8fbb061b6d959b0540ca9")
  (:PATH "raw/harness-0/conservazione.lisp" :SOURCE
   #A((94) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001225008-check-17024-0/conservazione.lisp")
   :BYTES 2177 :SHA256
   "88611dad0eefea5d618cfcab6f6fff2c6574ed5940911be90a9e433b694e2664")
  (:PATH "raw/harness-0/report.lisp" :SOURCE
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001225008-check-17024-0/report.lisp")
   :BYTES 318 :SHA256
   "3bd6ebb80f1a2e8cefd2ce60cc6dc8a3fe3b26e5bae686acc1599b9675831683")
  (:PATH "raw/harness-0/report.lisp.gz" :SOURCE
   #A((90) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001225008-check-17024-0/report.lisp.gz")
   :BYTES 470364 :SHA256
   "e0b6c5ad56b47991fd30172aa7ce3f29863995fdd08c8cd5ffb51e8295a40c5c")
  (:PATH "raw/harness-1/SPK-11.lisp" :SOURCE
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001224316-check-10011-0/SPK-11.lisp")
   :BYTES 29243 :SHA256
   "75170d2140922234a2ef939ec801d77a43ef76c2e2d521144b55a1dbe2587f8d")
  (:PATH "raw/harness-1/conservazione.lisp" :SOURCE
   #A((94) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001224316-check-10011-0/conservazione.lisp")
   :BYTES 1075 :SHA256
   "38bb6a6be85e1f758dabe7ffb8f0f1a72fd76fa8fccdb9a5667d830725be992d")
  (:PATH "raw/harness-1/report.lisp" :SOURCE
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001224316-check-10011-0/report.lisp")
   :BYTES 38965 :SHA256
   "4803fb7b913d9ac640311658521742686dd689ec627cbdaee7a6edeb67bd968c")
  (:PATH "raw/harness-2/SPK-11.lisp" :SOURCE
   #A((86) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001224275-check-9681-0/SPK-11.lisp")
   :BYTES 21031 :SHA256
   "8ed4f708ae376d4db129a25fe7957bb099bb4b05ca65904e830afc298091d3c3")
  (:PATH "raw/harness-2/conservazione.lisp" :SOURCE
   #A((93) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001224275-check-9681-0/conservazione.lisp")
   :BYTES 1072 :SHA256
   "04c7d45ba758eb68da0a4824e42845e5db75e5999e802b968b515ffef933d5f4")
  (:PATH "raw/harness-2/report.lisp" :SOURCE
   #A((86) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001224275-check-9681-0/report.lisp")
   :BYTES 9303 :SHA256
   "1bd54176f9fb4d427b1a5825a178a3e2496ac4e35e2cb62b0f31c62d56394c8a")
  (:PATH "raw/prepare-session-archive.lisp.txt" :SOURCE
   #A((65) BASE-CHAR
      . "/private/tmp/arcdocdb-session-5nljuC/prepare-session-archive.lisp")
   :BYTES 3536 :SHA256
   "6d80d06303524038808c337e722ca876f96bb0404e5ee08b458e7e32b6ee64c0")
  (:PATH "raw/verified-inputs.lisp" :SOURCE
   #A((57) BASE-CHAR
      . "/private/tmp/arcdocdb-session-5nljuC/verified-inputs.lisp")
   :BYTES 85035 :SHA256
   "94658ffb8d909d5bfd78f2484d35406a893934c55f8fb51ef20b3b5d5102d8a4")
  (:PATH "raw/verify-inputs.lisp.txt" :SOURCE
   #A((75) BASE-CHAR
      . "/private/tmp/arcdocdb-unix-integration-Zq6kA8/verify-final-integration.lisp")
   :BYTES 4729 :SHA256
   "ea82728f8d16b582ead37125a779a1d8b1ab21a55e424304e3e0904f620b198e")
  (:PATH "report.md" :SOURCE
   #A((46) BASE-CHAR . "/private/tmp/arcdocdb-session-5nljuC/report.md") :BYTES
   4833 :SHA256
   "70830e45d12d79158e7fdad7d8d0260a275a08f5b42acfe9d74d6b0686e24fef")
  (:PATH "sources/session-method.md.txt" :SOURCE
   #A((83) BASE-CHAR
      . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/SPK-11-unix-socket/session-method.md")
   :BYTES 2725 :SHA256
   "3281205c364e64dc4cf2216fdf179d347f758138915e49bc15baa2bc08a45711")
  (:PATH "sources/v1/codec-inputs.lisp.txt" :SOURCE
   #A((57) BASE-CHAR
      . "/private/tmp/arcdocdb-session-5nljuC/v1/codec-inputs.lisp")
   :BYTES 581 :SHA256
   "28233a1ac780db554bb0620345af6dedae8ad3f81bb0ecb88c1bf96769d560ba")
  (:PATH "sources/v1/core.lisp.txt" :SOURCE
   #A((49) BASE-CHAR . "/private/tmp/arcdocdb-session-5nljuC/v1/core.lisp")
   :BYTES 6407 :SHA256
   "bf167df3aeff75b4426460cb8a4ab1f4692a443dc0815705071ac4838971f7bc")
  (:PATH "sources/v1/run-spikes.lisp.txt" :SOURCE
   #A((55) BASE-CHAR
      . "/private/tmp/arcdocdb-session-5nljuC/v1/run-spikes.lisp")
   :BYTES 14318 :SHA256
   "73c9f115d8ace51713b7a10073c6cb52d12a46f937beb2503bbe7e61941843eb")
  (:PATH "sources/v1/run.lisp.txt" :SOURCE
   #A((48) BASE-CHAR . "/private/tmp/arcdocdb-session-5nljuC/v1/run.lisp")
   :BYTES 2839 :SHA256
   "340cd250324211adc04affe05cae893e09a0f36661525b23ecb874a4b775d791")
  (:PATH "sources/v1/scenarios.lisp.txt" :SOURCE
   #A((54) BASE-CHAR
      . "/private/tmp/arcdocdb-session-5nljuC/v1/scenarios.lisp")
   :BYTES 9168 :SHA256
   "3764b2939ba91c860b186877d3a0833033bca92f42f6bf953c6e5dae294b5ed6")
  (:PATH "sources/v1/session-checks.lisp.txt" :SOURCE
   #A((59) BASE-CHAR
      . "/private/tmp/arcdocdb-session-5nljuC/v1/session-checks.lisp")
   :BYTES 10261 :SHA256
   "2551d6700c82255e88abadc6b2ec20df3d961a3830f0f0a725a055109be6325a")
  (:PATH "sources/v1/session-model.lisp.txt" :SOURCE
   #A((58) BASE-CHAR
      . "/private/tmp/arcdocdb-session-5nljuC/v1/session-model.lisp")
   :BYTES 6249 :SHA256
   "5218331342e0ed9cd892e084e53009dddc1691828ec5043e3de3ced5e35a6e3b")
  (:PATH "sources/v1/session-transport.lisp.txt" :SOURCE
   #A((62) BASE-CHAR
      . "/private/tmp/arcdocdb-session-5nljuC/v1/session-transport.lisp")
   :BYTES 4204 :SHA256
   "795d4f13c4e45627bde655ab14ea4d36881b72948246022c4f3f542841273862")
  (:PATH "sources/v1/session-wire.lisp.txt" :SOURCE
   #A((57) BASE-CHAR
      . "/private/tmp/arcdocdb-session-5nljuC/v1/session-wire.lisp")
   :BYTES 6947 :SHA256
   "d96347804beb2208be39dcde369093758c6dc33f62d9902d33f50ffeba69e414")
  (:PATH "sources/v1/transport.lisp.txt" :SOURCE
   #A((54) BASE-CHAR
      . "/private/tmp/arcdocdb-session-5nljuC/v1/transport.lisp")
   :BYTES 6438 :SHA256
   "952d05a8dd01fccbf3a244db81cfb3d7b7f84669d438d51b869f149814db21d8")
  (:PATH "sources/v2/codec-inputs.lisp.txt" :SOURCE
   #A((57) BASE-CHAR
      . "/private/tmp/arcdocdb-session-5nljuC/v2/codec-inputs.lisp")
   :BYTES 581 :SHA256
   "28233a1ac780db554bb0620345af6dedae8ad3f81bb0ecb88c1bf96769d560ba")
  (:PATH "sources/v2/core.lisp.txt" :SOURCE
   #A((49) BASE-CHAR . "/private/tmp/arcdocdb-session-5nljuC/v2/core.lisp")
   :BYTES 6407 :SHA256
   "bf167df3aeff75b4426460cb8a4ab1f4692a443dc0815705071ac4838971f7bc")
  (:PATH "sources/v2/run-spikes.lisp.txt" :SOURCE
   #A((55) BASE-CHAR
      . "/private/tmp/arcdocdb-session-5nljuC/v2/run-spikes.lisp")
   :BYTES 14318 :SHA256
   "73c9f115d8ace51713b7a10073c6cb52d12a46f937beb2503bbe7e61941843eb")
  (:PATH "sources/v2/run.lisp.txt" :SOURCE
   #A((48) BASE-CHAR . "/private/tmp/arcdocdb-session-5nljuC/v2/run.lisp")
   :BYTES 2839 :SHA256
   "340cd250324211adc04affe05cae893e09a0f36661525b23ecb874a4b775d791")
  (:PATH "sources/v2/scenarios.lisp.txt" :SOURCE
   #A((54) BASE-CHAR
      . "/private/tmp/arcdocdb-session-5nljuC/v2/scenarios.lisp")
   :BYTES 9168 :SHA256
   "3764b2939ba91c860b186877d3a0833033bca92f42f6bf953c6e5dae294b5ed6")
  (:PATH "sources/v2/session-checks.lisp.txt" :SOURCE
   #A((59) BASE-CHAR
      . "/private/tmp/arcdocdb-session-5nljuC/v2/session-checks.lisp")
   :BYTES 10275 :SHA256
   "c88740342d7b03019196b4d486b183451c882aad6b9313a63fe7edf9e34fbaa8")
  (:PATH "sources/v2/session-model.lisp.txt" :SOURCE
   #A((58) BASE-CHAR
      . "/private/tmp/arcdocdb-session-5nljuC/v2/session-model.lisp")
   :BYTES 6249 :SHA256
   "5218331342e0ed9cd892e084e53009dddc1691828ec5043e3de3ced5e35a6e3b")
  (:PATH "sources/v2/session-transport.lisp.txt" :SOURCE
   #A((62) BASE-CHAR
      . "/private/tmp/arcdocdb-session-5nljuC/v2/session-transport.lisp")
   :BYTES 4204 :SHA256
   "795d4f13c4e45627bde655ab14ea4d36881b72948246022c4f3f542841273862")
  (:PATH "sources/v2/session-wire.lisp.txt" :SOURCE
   #A((57) BASE-CHAR
      . "/private/tmp/arcdocdb-session-5nljuC/v2/session-wire.lisp")
   :BYTES 6947 :SHA256
   "d96347804beb2208be39dcde369093758c6dc33f62d9902d33f50ffeba69e414")
  (:PATH "sources/v2/transport.lisp.txt" :SOURCE
   #A((54) BASE-CHAR
      . "/private/tmp/arcdocdb-session-5nljuC/v2/transport.lisp")
   :BYTES 6438 :SHA256
   "952d05a8dd01fccbf3a244db81cfb3d7b7f84669d438d51b869f149814db21d8")
  (:PATH "sources/v3/codec-inputs.lisp.txt" :SOURCE
   #A((57) BASE-CHAR
      . "/private/tmp/arcdocdb-session-5nljuC/v3/codec-inputs.lisp")
   :BYTES 581 :SHA256
   "28233a1ac780db554bb0620345af6dedae8ad3f81bb0ecb88c1bf96769d560ba")
  (:PATH "sources/v3/core.lisp.txt" :SOURCE
   #A((49) BASE-CHAR . "/private/tmp/arcdocdb-session-5nljuC/v3/core.lisp")
   :BYTES 6407 :SHA256
   "bf167df3aeff75b4426460cb8a4ab1f4692a443dc0815705071ac4838971f7bc")
  (:PATH "sources/v3/run-spikes.lisp.txt" :SOURCE
   #A((55) BASE-CHAR
      . "/private/tmp/arcdocdb-session-5nljuC/v3/run-spikes.lisp")
   :BYTES 14318 :SHA256
   "73c9f115d8ace51713b7a10073c6cb52d12a46f937beb2503bbe7e61941843eb")
  (:PATH "sources/v3/run.lisp.txt" :SOURCE
   #A((48) BASE-CHAR . "/private/tmp/arcdocdb-session-5nljuC/v3/run.lisp")
   :BYTES 2839 :SHA256
   "340cd250324211adc04affe05cae893e09a0f36661525b23ecb874a4b775d791")
  (:PATH "sources/v3/scenarios.lisp.txt" :SOURCE
   #A((54) BASE-CHAR
      . "/private/tmp/arcdocdb-session-5nljuC/v3/scenarios.lisp")
   :BYTES 9168 :SHA256
   "3764b2939ba91c860b186877d3a0833033bca92f42f6bf953c6e5dae294b5ed6")
  (:PATH "sources/v3/session-checks.lisp.txt" :SOURCE
   #A((59) BASE-CHAR
      . "/private/tmp/arcdocdb-session-5nljuC/v3/session-checks.lisp")
   :BYTES 10355 :SHA256
   "b45e465d2c32a4e1a2f562ecec8e100144ce68b224d39a8a114191efa4a2d60c")
  (:PATH "sources/v3/session-model.lisp.txt" :SOURCE
   #A((58) BASE-CHAR
      . "/private/tmp/arcdocdb-session-5nljuC/v3/session-model.lisp")
   :BYTES 6232 :SHA256
   "8775eaca2a7df7f42c29b410b8ec35dc1367f6f297626684deaa42f9196e6ac5")
  (:PATH "sources/v3/session-transport.lisp.txt" :SOURCE
   #A((62) BASE-CHAR
      . "/private/tmp/arcdocdb-session-5nljuC/v3/session-transport.lisp")
   :BYTES 4204 :SHA256
   "795d4f13c4e45627bde655ab14ea4d36881b72948246022c4f3f542841273862")
  (:PATH "sources/v3/session-wire.lisp.txt" :SOURCE
   #A((57) BASE-CHAR
      . "/private/tmp/arcdocdb-session-5nljuC/v3/session-wire.lisp")
   :BYTES 6947 :SHA256
   "d96347804beb2208be39dcde369093758c6dc33f62d9902d33f50ffeba69e414")
  (:PATH "sources/v3/transport.lisp.txt" :SOURCE
   #A((54) BASE-CHAR
      . "/private/tmp/arcdocdb-session-5nljuC/v3/transport.lisp")
   :BYTES 6438 :SHA256
   "952d05a8dd01fccbf3a244db81cfb3d7b7f84669d438d51b869f149814db21d8"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
