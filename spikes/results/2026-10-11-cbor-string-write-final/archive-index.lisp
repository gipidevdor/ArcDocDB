(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "originalCollection" :RECORD-PATH
   "processes/originalCollection/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((36) BASE-CHAR . "spikes/out/header-write/collect.lisp")
    #A((9) BASE-CHAR . "--collect")
    #A((62) BASE-CHAR
       . "spikes/out/cbor-string-write-20261011/collection-manifest.lisp")
    #A((44) BASE-CHAR . "spikes/results/2026-10-11-cbor-string-write/")))
  (:LABEL "originalClosedAudit" :RECORD-PATH
   "processes/originalClosedAudit/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((32) BASE-CHAR . "tools/check-command-archive.lisp")
    #A((9) BASE-CHAR . "--archive")
    #A((44) BASE-CHAR . "spikes/results/2026-10-11-cbor-string-write/")))
  (:LABEL "integratedCheck" :RECORD-PATH
   "processes/integratedCheck/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core")))
  (:LABEL "integratedCoverageSelf" :RECORD-PATH
   "processes/integratedCoverageSelf/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((11) BASE-CHAR . "--self-test")
    #A((63) BASE-CHAR
       . "spikes/out/cbor-string-write-integrated-coverage-self-20261011/")))
  (:LABEL #A((15) BASE-CHAR . "finalCollection") :RECORD-PATH
   "processes/finalCollection/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((36) BASE-CHAR . "spikes/out/header-write/collect.lisp")
    #A((9) BASE-CHAR . "--collect")
    #A((68) BASE-CHAR
       . "spikes/out/cbor-string-write-final-20261011/collection-manifest.lisp")
    #A((50) BASE-CHAR . "spikes/results/2026-10-11-cbor-string-write-final/")))
  (:LABEL #A((10) BASE-CHAR . "finalLinks") :RECORD-PATH
   "processes/finalLinks/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "links")))
  (:LABEL #A((23) BASE-CHAR . "initialFinalClosedAudit") :RECORD-PATH
   "processes/initialFinalClosedAudit/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((20) BASE-CHAR . "--dynamic-space-size")
    #A((4) BASE-CHAR . "2048") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((32) BASE-CHAR . "tools/check-command-archive.lisp")
    #A((9) BASE-CHAR . "--archive")
    #A((50) BASE-CHAR
       . "spikes/results/2026-10-11-cbor-string-write-final/"))))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-final-20261011/collection-manifest.lisp")
   :BYTES 1290 :SHA256
   "a8cb2d860b4407ea6739e5ae3d6d3b5fe3b9e6381aee4fd548b766745695eb05")
  (:PATH "collection-source.lisp" :SOURCE
   #A((101) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/header-write/collect.lisp")
   :BYTES 9677 :SHA256
   "f59f7a52934c7fe6103b5047aade87214f17494e857fe35c568968c681790d81")
  (:PATH "processes/integratedCheck/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000710709-command-45721-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "762010d9afdbc435571a4b9346ca501e1c7a857d9c3a82f25fa164de0cfa28cb")
  (:PATH "processes/integratedCheck/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000710709-command-45721-0/report.lisp")
   :BYTES 665082 :SHA256
   "aacf2fc11459d7f4837efcd747196dcd4e8a7bdad9175a21733b2bce0d5dfa1e")
  (:PATH "processes/integratedCoverageSelf/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000710709-command-45705-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "f45f80a762def746165ce4d6f78626d9681ef946a6e297dfeaa2fd2844d46c68")
  (:PATH "processes/integratedCoverageSelf/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000710709-command-45705-0/report.lisp")
   :BYTES 133013 :SHA256
   "c4ad3d900f61718181c749bde380c2d3a13156df39cc7b832aefbc2494bc864f")
  (:PATH "processes/originalClosedAudit/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000710389-command-36958-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "d73ff478040ccbf97f003ec4cf2168727719d3a3abdd14c41140e0dd57374d28")
  (:PATH "processes/originalClosedAudit/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000710389-command-36958-0/report.lisp")
   :BYTES 133220 :SHA256
   "225d4bf11732366264839331999c2b2cf29feb45c581fd496bd87970ade78d10")
  (:PATH "processes/originalCollection/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000709687-command-20928-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "cf31b2cd0c828656d1f17238f28573f43cac14cea0b2389d852083bd589ddaa9")
  (:PATH "processes/originalCollection/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000709687-command-20928-0/report.lisp")
   :BYTES 127278 :SHA256
   "f4d4b90ed8eb117112429cfaba8259eb552e21bf5c54332a8c5f3e4148985684")
  (:PATH "raw/integrated-coverage-self/0f403933409ac860b3aa6571db0d04f2.html"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-integrated-coverage-self-20261011/0f403933409ac860b3aa6571db0d04f2.html")
   :BYTES 2847 :SHA256
   "ad03dca9db84069c82b858b416c1685521bce2d60628af2162493d618e4138b8")
  (:PATH "raw/integrated-coverage-self/cover-index.html" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-integrated-coverage-self-20261011/cover-index.html")
   :BYTES 1807 :SHA256
   "8d141308fc787366c1aa2155de451f9fecbe36cde084b9ba7306336262a36b28")
  (:PATH "raw/integrated-coverage-self/coverage-fixture.fasl" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-integrated-coverage-self-20261011/coverage-fixture.fasl")
   :BYTES 1637 :SHA256
   "10d4c21ed46b5ab8f09976638c55760d8ffa31bfc9933bf69ac5da3ab6c54894")
  (:PATH "raw/integrated-coverage-self/coverage-fixture.lisp" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-integrated-coverage-self-20261011/coverage-fixture.lisp")
   :BYTES 147 :SHA256
   "3767518fde8bde1e1286dbf663e97eac01f02e038d7f3161df436d9fd3e92559")
  (:PATH "raw/integrated-spikes/SPK-01.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000710848-check-49601-0/SPK-01.lisp")
   :BYTES 27228 :SHA256
   "ee8f55f5a7e6b872099350c182c210c5361a46ad9303c4869f2f1556b3befbbd")
  (:PATH "raw/integrated-spikes/SPK-02.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000710848-check-49601-0/SPK-02.lisp")
   :BYTES 1607 :SHA256
   "8a3800da02b393f24bcf88bf80d6818f76fefc24cf0862f9e081836ca23b5427")
  (:PATH "raw/integrated-spikes/SPK-03.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000710848-check-49601-0/SPK-03.lisp")
   :BYTES 3646 :SHA256
   "39c009eb15d1e9b17f2a3de5f16e66ab495ad3cbd6759d72b6efba8cb5b374b7")
  (:PATH "raw/integrated-spikes/SPK-04.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000710848-check-49601-0/SPK-04.lisp")
   :BYTES 6752 :SHA256
   "0aaa37d07403e9f14fe72148065af0cd5a94ab01f4a76e695105bf5737f09791")
  (:PATH "raw/integrated-spikes/SPK-05.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000710848-check-49601-0/SPK-05.lisp")
   :BYTES 10170 :SHA256
   "a9c7833d6ddbd0e15a6423c649cf5eb143f0347f6486af5d582ba61480389146")
  (:PATH "raw/integrated-spikes/SPK-06.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000710848-check-49601-0/SPK-06.lisp")
   :BYTES 24096 :SHA256
   "edb3d12f465ecb00cac82258adedd71728bd942080c8413830b3e8628d3f10b6")
  (:PATH "raw/integrated-spikes/SPK-07.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000710848-check-49601-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "8b6b379e1c634e85f4efc31f9c1ee504f4e54fec6330bb5107af226a2a5e646d")
  (:PATH "raw/integrated-spikes/SPK-07.lisp.gz" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000710848-check-49601-0/SPK-07.lisp.gz")
   :BYTES 410628 :SHA256
   "538e940750c98c6b4e74dc3626a19c057e360fe19511dd6ff186b42d6579790e")
  (:PATH "raw/integrated-spikes/SPK-08.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000710848-check-49601-0/SPK-08.lisp")
   :BYTES 292334 :SHA256
   "fa6049257d770de7b41da0c966d2ba1a48700649e7b773db29534f373ed2d0aa")
  (:PATH "raw/integrated-spikes/SPK-09.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000710848-check-49601-0/SPK-09.lisp")
   :BYTES 2472 :SHA256
   "dbfb4b1e5bccf49fa885d6fbb6a78dca16c98265245bddf3140a9e0bdc8a3318")
  (:PATH "raw/integrated-spikes/SPK-10.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000710848-check-49601-0/SPK-10.lisp")
   :BYTES 22976 :SHA256
   "63307525ee624bb4bbc04edc8b3a6a94826534ca4ecd564b1799fdbe0c23fcde")
  (:PATH "raw/integrated-spikes/conservazione.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000710848-check-49601-0/conservazione.lisp")
   :BYTES 2306 :SHA256
   "bb6523912eb56b9a7a03fbe1bebe402006ee490fc7ac1674423106574fea6066")
  (:PATH "raw/integrated-spikes/report.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000710848-check-49601-0/report.lisp")
   :BYTES 318 :SHA256
   "82ad79b28598d298a44e928b76786abdd2934b30dc042cd437365e54f83dc9b7")
  (:PATH "raw/integrated-spikes/report.lisp.gz" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000710848-check-49601-0/report.lisp.gz")
   :BYTES 467023 :SHA256
   "658174cd3dfe3a89b32a51e837ca61368781da53ed3efb46e00dae96b7f63521")
  (:PATH "raw/integration-setup/collection-manifest.lisp" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-final-20261011/collection-manifest.lisp")
   :BYTES 1290 :SHA256
   "a8cb2d860b4407ea6739e5ae3d6d3b5fe3b9e6381aee4fd548b766745695eb05")
  (:PATH "raw/integration-setup/frozen-manifest.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-final-20261011/frozen-manifest.lisp")
   :BYTES 1172 :SHA256
   "739375c6c42f37eff3ef23f9b354dd071d98a22895093d46383a007d0b01ad7e")
  (:PATH "raw/integration-setup/frozen/arcdocdb.asd.txt" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-final-20261011/frozen/arcdocdb.asd.txt")
   :BYTES 11061 :SHA256
   "3a948b5f2bb478c76ea4112041a50eb03c1730ec16bd04eb0d9d3f953e1daa4c")
  (:PATH
   "raw/integration-setup/frozen/docs/implementazione/cbor-stringhe-dati.md.txt"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-final-20261011/frozen/docs/implementazione/cbor-stringhe-dati.md.txt")
   :BYTES 16499 :SHA256
   "61d01328b6a08064c70015b40cec305ee57dc664df03a4445067356943349c6a")
  (:PATH
   "raw/integration-setup/frozen/docs/implementazione/cbor-stringhe-risultati.md.txt"
   :SOURCE
   #A((167) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-final-20261011/frozen/docs/implementazione/cbor-stringhe-risultati.md.txt")
   :BYTES 6549 :SHA256
   "fbfd173aa1dfddfa39523bc750a4240ac9a88c81b2d020b4c41702a9a1d8120c")
  (:PATH "raw/integration-setup/frozen/tools/foundation-coverage.lisp.txt"
   :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-final-20261011/frozen/tools/foundation-coverage.lisp.txt")
   :BYTES 12819 :SHA256
   "61407c521d6ecbbbf1b431ba835afb8efd3d055497f935440caa3a9cb28abe44")
  (:PATH "raw/integration-setup/prepare.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/cbor-string-write-final-20261011/prepare.lisp")
   :BYTES 3973 :SHA256
   "62abf1c533fc137c9e15171e4a9848ad34e015a34879874501b42de538a6ed3f")
  (:PATH "processes/finalCollection/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000711151-command-55043-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "35654b62648f5f12946c6ca8b200617e0b3a4b6276ba903b571dd79ccee7cf55")
  (:PATH "processes/finalCollection/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000711151-command-55043-0/report.lisp")
   :BYTES 133274 :SHA256
   "e053e4c51bf33e0fe68a6cb407ff0576ef36429cb7b4993a893e361f708ffe9f")
  (:PATH "processes/finalLinks/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000711178-command-55768-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "9dbac8b392ecbde175020d9eebad9e49cad06102d859b2b797f99b3d12de3ce7")
  (:PATH "processes/finalLinks/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000711178-command-55768-0/report.lisp")
   :BYTES 132896 :SHA256
   "24dbddaa4d81549faedd2fd80e0ddca5b31c301aab7d543c6059ac99e46228d4")
  (:PATH "processes/initialFinalClosedAudit/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000711178-command-55769-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "10ee9ed0d8699b9ae7743e9f320b89b5d341a555463f6f6ab1e3d10fd49e5a98")
  (:PATH "processes/initialFinalClosedAudit/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-string-write/ArcDocDB/spikes/out/4000711178-command-55769-0/report.lisp")
   :BYTES 135397 :SHA256
   "a59ee433043afd37cde80dfea9088f04ecbbf38ac87206e843ad403864b074d9"))
 :LIMITS
 (:SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :FASL-EXCLUDED-FROM-PUBLISHED-MUTATION-TREES
  :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
