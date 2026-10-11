(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "collection" :RECORD-PATH "processes/collection/report.lisp" :STATUS
   :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((36) BASE-CHAR . "spikes/out/header-write/collect.lisp")
    #A((9) BASE-CHAR . "--collect")
    #A((48) BASE-CHAR . "spikes/out/header-write-collection-manifest.lisp")
    #A((44) BASE-CHAR . "spikes/results/2026-10-11-cbor-header-write/")))
  (:LABEL "original-archive-audit" :RECORD-PATH
   "processes/original-archive-audit/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((32) BASE-CHAR . "tools/check-command-archive.lisp")
    #A((9) BASE-CHAR . "--archive")
    #A((44) BASE-CHAR . "spikes/results/2026-10-11-cbor-header-write/")))
  (:LABEL "final-collection" :RECORD-PATH
   "processes/final-collection/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((36) BASE-CHAR . "spikes/out/header-write/collect.lisp")
    #A((9) BASE-CHAR . "--collect")
    #A((43) BASE-CHAR . "spikes/out/header-write-final-manifest.lisp")
    #A((50) BASE-CHAR . "spikes/results/2026-10-11-cbor-header-write-final/")))
  (:LABEL "integrated-coverage-self" :RECORD-PATH
   "processes/integrated-coverage-self/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((11) BASE-CHAR . "--self-test")
    #A((56) BASE-CHAR
       . "spikes/out/cbor-write-integrated-coverage-self-20261011/")))
  (:LABEL "integrated-check" :RECORD-PATH
   "processes/integrated-check/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core")))
  (:LABEL #A((18) BASE-CHAR . "publication-append") :RECORD-PATH
   "processes/publication-append/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((41) BASE-CHAR . "spikes/out/header-write-final-append.lisp")))
  (:LABEL #A((20) BASE-CHAR . "final-links-evidence") :RECORD-PATH
   "processes/final-links-evidence/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "links")
    #A((8) BASE-CHAR . "evidence")))
  (:LABEL #A((27) BASE-CHAR . "archive-audit-before-append") :RECORD-PATH
   "processes/archive-audit-before-append/report.lisp" :STATUS :OK :EXIT-CODE 0
   :SOURCE-CONSISTENCY :STABLE :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((32) BASE-CHAR . "tools/check-command-archive.lisp")
    #A((9) BASE-CHAR . "--archive")
    #A((50) BASE-CHAR
       . "spikes/results/2026-10-11-cbor-header-write-final/"))))
 :FILES
 ((:PATH "collection-manifest.lisp" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write-final-manifest.lisp")
   :BYTES 995 :SHA256
   "25339ed906bb1506b7ddce96704f390663cfc493ef16006af7afff6268489fe1")
  (:PATH "collection-source.lisp" :SOURCE
   #A((101) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write/collect.lisp")
   :BYTES 9677 :SHA256
   "f59f7a52934c7fe6103b5047aade87214f17494e857fe35c568968c681790d81")
  (:PATH "processes/collection/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703905-command-55149-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "44602f3a0323688daa844b141e32bcfa6ae35484d4c479e63a4af88faa123c7b")
  (:PATH "processes/collection/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703905-command-55149-0/report.lisp")
   :BYTES 115402 :SHA256
   "438cda1795fff8a30e7a6d652ef4b7b9e949ba0ded5af8ca2c1554f02d276f1e")
  (:PATH "processes/original-archive-audit/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704146-command-58659-0/conservazione.lisp")
   :BYTES 1155 :SHA256
   "faffffad21f9f8413c04363a9981f93a1c4b05f8a5d8041c8de81eac793c04de")
  (:PATH "processes/original-archive-audit/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704146-command-58659-0/report.lisp")
   :BYTES 119653 :SHA256
   "0b55a6575af61fd59bc765816565e57f89b2dbbbd7cbec72b5145a4d0d258141")
  (:PATH "raw/publication/archive-audit.stderr.log" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write-archive-audit.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/publication/archive-audit.stdout.log" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write-archive-audit.stdout.log")
   :BYTES 269 :SHA256
   "c64500302557205d6ff37274f315afbcd9983b63f7a5868ca9812f0d53e23171")
  (:PATH "raw/publication/cbor-scrittura-risultati.md.txt" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/docs/implementazione/cbor-scrittura-risultati.md")
   :BYTES 6048 :SHA256
   "bcafebb6a7f02c29042f3035ac3921cb106b1e999e1e4035e2c4e1077f953668")
  (:PATH "raw/publication/collection.stderr.log" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write-collection.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/publication/collection.stdout.log" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write-collection.stdout.log")
   :BYTES 322 :SHA256
   "e1698023b0a0aaff4656173385426249faa6fb6c72a1bf2eab9503a192c63b61")
  (:PATH "raw/publication/manifest.stderr.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write-manifest.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "raw/publication/manifest.stdout.log" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write-manifest.stdout.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "processes/final-collection/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704225-command-59923-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "fe732c9e46bdbd08ecb9ad63bba1ba7d08f3ff1ca2e8b662fcf4cac0766bdaf2")
  (:PATH "processes/final-collection/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704225-command-59923-0/report.lisp")
   :BYTES 115447 :SHA256
   "c84cd0e5b627ccee60f76469e4fa7e02beb564075479b50a1f0130462631fc0d")
  (:PATH "processes/integrated-coverage-self/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704345-command-60914-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "4e339e8d4e4e579dca578044cd092d15e3024c8ef9eec51c2beb787bcb0fbddc")
  (:PATH "processes/integrated-coverage-self/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704345-command-60914-0/report.lisp")
   :BYTES 118059 :SHA256
   "f7a5146e411346a09890222e93c90d2b451f115beb146583c482888d62c55791")
  (:PATH "processes/integrated-check/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704345-command-60929-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "1e1d3f26c7205234dea68ae16949d32237e4ec9846c31215a84242636c320302")
  (:PATH "processes/integrated-check/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704345-command-60929-0/report.lisp")
   :BYTES 452066 :SHA256
   "16b9d41fc367776da1fe7695cdfbc17d43d23b7b78bd6e3e16bbf08e6879f026")
  (:PATH "integration/cbor-scrittura-risultati.md.txt" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/docs/implementazione/cbor-scrittura-risultati.md")
   :BYTES 6625 :SHA256
   "a613333011725e9ca6c828e02e3deb88753266b4aa2ec3c5f82bcd561519b4ea")
  (:PATH "integration/arcdocdb.asd" :SOURCE
   #A((77) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/arcdocdb.asd")
   :BYTES 9205 :SHA256
   "5507308590fdbbc1292b8c7057866c9d73ee285046519e14ac0d6a8c7a9bd2d7")
  (:PATH "integration/foundation-coverage.lisp" :SOURCE
   #A((95) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/tools/foundation-coverage.lisp")
   :BYTES 10174 :SHA256
   "71710a20b6f1259c1320af5cd3dc6ec828076b0d94066a45693fd990095e461f")
  (:PATH "integration/header-write-final-append.lisp" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write-final-append.lisp")
   :BYTES 2470 :SHA256
   "3f8db14617dc71f73a2e903f1b710ead76e1499c93d5e9aee0e833cbc83e82e1")
  (:PATH "integration/header-write-integrated-check.stderr.log" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write-integrated-check.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "integration/header-write-integrated-check.stdout.log" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write-integrated-check.stdout.log")
   :BYTES 344 :SHA256
   "860c2199eb6c9143d05a6a4e64df129a747964dfc36258dedf38e2a6427a2040")
  (:PATH "integration/header-write-integrated-coverage-self.stderr.log" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write-integrated-coverage-self.stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "integration/header-write-integrated-coverage-self.stdout.log" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/header-write-integrated-coverage-self.stdout.log")
   :BYTES 281 :SHA256
   "47e107ef47c03549907cefb9059f614b1a73f3afbc26a3781cff9620e8d39123")
  (:PATH "integration/4000703323-check-48171-0/SPK-01.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703323-check-48171-0/SPK-01.lisp")
   :BYTES 27228 :SHA256
   "23ceaa4d4ba0f96535c8aa232ce805092367792a35a3d2d58b70e6869405034c")
  (:PATH "integration/4000703323-check-48171-0/SPK-02.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703323-check-48171-0/SPK-02.lisp")
   :BYTES 1607 :SHA256
   "9593717cfc97b40dc8a67868457b32b7bd8e2de9b2744dac58b335a0eb2e7fa2")
  (:PATH "integration/4000703323-check-48171-0/SPK-03.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703323-check-48171-0/SPK-03.lisp")
   :BYTES 3646 :SHA256
   "a46bc5dd6687deab8ce50e6deb7cb2cdcb9b44e49eb3821b66a77d30df4664b5")
  (:PATH "integration/4000703323-check-48171-0/SPK-04.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703323-check-48171-0/SPK-04.lisp")
   :BYTES 6752 :SHA256
   "25600272284ae707b9f596155b1e3c50015f55c86ddd9612ee5ef95ce185b94d")
  (:PATH "integration/4000703323-check-48171-0/SPK-05.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703323-check-48171-0/SPK-05.lisp")
   :BYTES 10172 :SHA256
   "1df9bc6ce6e59c1f263abd0875730c75a6f972586b74bdd940cfdeb5d95694bd")
  (:PATH "integration/4000703323-check-48171-0/SPK-06.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703323-check-48171-0/SPK-06.lisp")
   :BYTES 24147 :SHA256
   "3476c6374d3c92255c80151aac98d31b1b88a004161d145c6a0899a57592e6b4")
  (:PATH "integration/4000703323-check-48171-0/SPK-07.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703323-check-48171-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "040f7c85423b3a5a23a66d123b8e8803bbcc2a1645ad572ab0ea3aadd8dde115")
  (:PATH "integration/4000703323-check-48171-0/SPK-07.lisp.gz" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703323-check-48171-0/SPK-07.lisp.gz")
   :BYTES 410627 :SHA256
   "aa243a009efae688cfcff55dee2f1f255dfe7f1cb20a472fcf81fc354890862c")
  (:PATH "integration/4000703323-check-48171-0/SPK-08.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703323-check-48171-0/SPK-08.lisp")
   :BYTES 292334 :SHA256
   "686e35159db1e9ec5fe54c1c75d91c6b13d625b1c1ffecd082eed378528f01cd")
  (:PATH "integration/4000703323-check-48171-0/SPK-09.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703323-check-48171-0/SPK-09.lisp")
   :BYTES 2472 :SHA256
   "e5618176b08aec36ec45c1a8416d0d98f86dc1d7513137d45b91a14bca99c055")
  (:PATH "integration/4000703323-check-48171-0/SPK-10.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703323-check-48171-0/SPK-10.lisp")
   :BYTES 22975 :SHA256
   "d95293c4297bed38b6602e44f211354c1d07a5cb06102babc1acdfc00493b9cb")
  (:PATH "integration/4000703323-check-48171-0/conservazione.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703323-check-48171-0/conservazione.lisp")
   :BYTES 2306 :SHA256
   "0454936ad35b3738b8ed312efc43ea37e0975d6e37a7d4f8b03a163a55ff9cc3")
  (:PATH "integration/4000703323-check-48171-0/report.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703323-check-48171-0/report.lisp")
   :BYTES 318 :SHA256
   "fbbc51ce88ec1d80e7db190a9e5e405970c0d8dd855a4681dc2a51dbbe339e12")
  (:PATH "integration/4000703323-check-48171-0/report.lisp.gz" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000703323-check-48171-0/report.lisp.gz")
   :BYTES 467322 :SHA256
   "e195dccd9006fe6aa7754cd8c302f7ed2a823db63f77438f8b59b586e4df7eab")
  (:PATH "integration/4000704462-check-62024-0/SPK-01.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704462-check-62024-0/SPK-01.lisp")
   :BYTES 27228 :SHA256
   "529021fa116f9c0e0d119ffd4e0c33434df8d4f5948b4fa457b043b0d2d9f71f")
  (:PATH "integration/4000704462-check-62024-0/SPK-02.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704462-check-62024-0/SPK-02.lisp")
   :BYTES 1607 :SHA256
   "6a20eea63f9b00a718972f09942cc472367fd3972e05c51bcdb43546ea2ccdad")
  (:PATH "integration/4000704462-check-62024-0/SPK-03.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704462-check-62024-0/SPK-03.lisp")
   :BYTES 3646 :SHA256
   "253c7ab85caa967d4e2d9306752901c095c2b2a6b74e7726485be7fb5943aca9")
  (:PATH "integration/4000704462-check-62024-0/SPK-04.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704462-check-62024-0/SPK-04.lisp")
   :BYTES 6752 :SHA256
   "f2b97000fe986acae2aa98fe51458a49f4e1f9ff1f8df1feb985c99e40aa2e70")
  (:PATH "integration/4000704462-check-62024-0/SPK-05.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704462-check-62024-0/SPK-05.lisp")
   :BYTES 10170 :SHA256
   "9f825c87049789c13c67d6b980285cc0fba7049bf768cf742d22102219374f4e")
  (:PATH "integration/4000704462-check-62024-0/SPK-06.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704462-check-62024-0/SPK-06.lisp")
   :BYTES 24128 :SHA256
   "612cf2451be61f0cdc340d123176a5fda809661fa98fec06bdb2be77cc370542")
  (:PATH "integration/4000704462-check-62024-0/SPK-07.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704462-check-62024-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "c9f15c8b3e7d053a209248362f78d934025d5dde1defba6083820deba709dc67")
  (:PATH "integration/4000704462-check-62024-0/SPK-07.lisp.gz" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704462-check-62024-0/SPK-07.lisp.gz")
   :BYTES 410660 :SHA256
   "855dbddf0ca0607048d029efaf5b75ea3bda810551a806d62e3cc95cfbd17d1c")
  (:PATH "integration/4000704462-check-62024-0/SPK-08.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704462-check-62024-0/SPK-08.lisp")
   :BYTES 292333 :SHA256
   "973f845f682865b6beb1a32ebaae2ba26538ff3292a498bad8ea6d1835b72792")
  (:PATH "integration/4000704462-check-62024-0/SPK-09.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704462-check-62024-0/SPK-09.lisp")
   :BYTES 2472 :SHA256
   "816f294e06913a2b32f8c771c555dccd83ba59235772262572a022cc75dc8492")
  (:PATH "integration/4000704462-check-62024-0/SPK-10.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704462-check-62024-0/SPK-10.lisp")
   :BYTES 22977 :SHA256
   "cac2043c8deb4ac6a091b078fa6b4e56bcd115050be5ac5da4ad5bc1cefd087f")
  (:PATH "integration/4000704462-check-62024-0/conservazione.lisp" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704462-check-62024-0/conservazione.lisp")
   :BYTES 2306 :SHA256
   "b6ae9dee84e6b1abbc4b55ff94ab369d377236a5a27267f18e4fdfcc17f6813f")
  (:PATH "integration/4000704462-check-62024-0/report.lisp" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704462-check-62024-0/report.lisp")
   :BYTES 318 :SHA256
   "d56d88fa2c40975017fcd71137729fea6348b5e77d39d10ad6f88462e10e8c82")
  (:PATH "integration/4000704462-check-62024-0/report.lisp.gz" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704462-check-62024-0/report.lisp.gz")
   :BYTES 467030 :SHA256
   "ef1c51df7cea7df63068613575a54d6c3aa14c1dec010396422d0a67491b9126")
  (:PATH
   "integration/cbor-write-integrated-coverage-self-20261011/6bfe6bb7c328517ef0fa0500b2cf9215.html"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-integrated-coverage-self-20261011/6bfe6bb7c328517ef0fa0500b2cf9215.html")
   :BYTES 2840 :SHA256
   "fc69701bb0b2a857b7adb6f0fc297e88cc413d246e669bba7d4251e157aff4c3")
  (:PATH
   "integration/cbor-write-integrated-coverage-self-20261011/cover-index.html"
   :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-integrated-coverage-self-20261011/cover-index.html")
   :BYTES 1800 :SHA256
   "9506135228fb53d83147df57a3820732a2fa1869c1f11de611d4535503f89c4e")
  (:PATH
   "integration/cbor-write-integrated-coverage-self-20261011/coverage-fixture.fasl"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-integrated-coverage-self-20261011/coverage-fixture.fasl")
   :BYTES 1623 :SHA256
   "0068463460566e1db3555b1fb9755413bc381cda1d609551cd93760f8f2c08d3")
  (:PATH
   "integration/cbor-write-integrated-coverage-self-20261011/coverage-fixture.lisp"
   :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/cbor-write-integrated-coverage-self-20261011/coverage-fixture.lisp")
   :BYTES 147 :SHA256
   "3767518fde8bde1e1286dbf663e97eac01f02e038d7f3161df436d9fd3e92559")
  (:PATH "processes/publication-append/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704540-command-62824-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "8bd6451ce02e2d3ed9c7b430ffbffbeae3f4b891abc4d999ed4cf3fc134d34c6")
  (:PATH "processes/publication-append/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704540-command-62824-0/report.lisp")
   :BYTES 118356 :SHA256
   "053f6dbcdc820af8984c42080a108ca6fcda9c46a20034185273584df3f3e565")
  (:PATH "processes/final-links-evidence/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704599-command-64254-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "af9c76aad790587b20d7a85f883bcac68b9167ac747f00c8f5c2e6ebdb60ae97")
  (:PATH "processes/final-links-evidence/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704599-command-64254-0/report.lisp")
   :BYTES 118565 :SHA256
   "54e3bc039373cb991ca9ed291413eb971c8efe487c6676d86fcc420a472776bf")
  (:PATH "processes/archive-audit-before-append/conservazione.lisp" :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704599-command-64253-0/conservazione.lisp")
   :BYTES 1156 :SHA256
   "fff5362db1062e55fec0a80882ef387a3742c12e7a92bb843e3fe6db7e45f9d2")
  (:PATH "processes/archive-audit-before-append/report.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/cbor-header-write/ArcDocDB/spikes/out/4000704599-command-64253-0/report.lisp")
   :BYTES 120969 :SHA256
   "87b1238bce340f34a761e67116089f79eeafb13446f305da0e23fb62109d330a"))
 :LIMITS
 (:SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :FASL-EXCLUDED-FROM-PUBLISHED-MUTATION-TREES
  :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
