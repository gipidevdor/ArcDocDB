(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "coverage-initial" :RECORD-PATH
   "processes/coverage-initial/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((8) BASE-CHAR . "--report")
    #A((33) BASE-CHAR . "spikes/out/directory-id-coverage/")
    #A((8) BASE-CHAR . "recovery"))
   :STATUS :FAILED :EXIT-CODE 1 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "mutation-self-test" :RECORD-PATH
   "processes/mutation-self-test/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-mutation.lisp")
    #A((11) BASE-CHAR . "--self-test"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "coverage-final" :RECORD-PATH "processes/coverage-final/report.lisp"
   :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-coverage.lisp")
    #A((8) BASE-CHAR . "--report")
    #A((35) BASE-CHAR . "spikes/out/directory-id-coverage-2/")
    #A((8) BASE-CHAR . "recovery"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "vertical" :RECORD-PATH "processes/vertical/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((25) BASE-CHAR . "tools/vertical-crash.lisp")
    #A((11) BASE-CHAR . "--self-test"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "mutation" :RECORD-PATH "processes/mutation/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((8) BASE-CHAR . "--script")
    #A((30) BASE-CHAR . "tools/foundation-mutation.lisp")
    #A((5) BASE-CHAR . "--run")
    #A((33) BASE-CHAR . "spikes/out/directory-id-mutation/")
    #A((12) BASE-CHAR . "inventory-id") #A((6) BASE-CHAR . "--jobs")
    #A((1) BASE-CHAR . "4"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "full-check" :RECORD-PATH "processes/full-check/report.lisp" :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "integrated-tests" :RECORD-PATH
   "processes/integrated-tests/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "make") #A((4) BASE-CHAR . "test")
    #A((4) BASE-CHAR . "lint") #A((5) BASE-CHAR . "trace")
    #A((5) BASE-CHAR . "links"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "integrated-evidence" :RECORD-PATH
   "processes/integrated-evidence/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "make") #A((8) BASE-CHAR . "evidence")) :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "clock-integration" :RECORD-PATH
   "processes/clock-integration/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "sbcl") #A((10) BASE-CHAR . "--noinform")
    #A((13) BASE-CHAR . "--no-userinit") #A((12) BASE-CHAR . "--no-sysinit")
    #A((8) BASE-CHAR . "--script")
    #A((59) BASE-CHAR
       . "spikes/out/directory-id-audit/verify-clock-integration.lisp"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "README.md" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/README.txt")
   :BYTES 4139 :SHA256
   "504df591149176d791f084b33dde8285c9324735467d901d8dd3ff30fa2bb933")
  (:PATH "collection-manifest.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/manifest.lisp")
   :BYTES 39243 :SHA256
   "a4d17cb7b6ff9170d8b12eee0a83cdaff00db0bf8568ff125d0a5f7d05c4c942")
  (:PATH "collection-source.lisp" :SOURCE
   #A((95) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH "processes/clock-integration/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001155683-command-18865-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "f2318c0868797b3fa0a33f26554b63dfd0cc2cd98c3b464e85fd9877ffac4b39")
  (:PATH "processes/clock-integration/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001155683-command-18865-0/report.lisp")
   :BYTES 219503 :SHA256
   "19c57d266420b04407899d2796a86e331b883619d7750c4f17bb2fb72e06a54a")
  (:PATH "processes/coverage-final/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001154353-command-85838-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "92a57cdbc48a83219b37b600918efbe0711646122a50ac80942726b9ebac018d")
  (:PATH "processes/coverage-final/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001154353-command-85838-0/report.lisp")
   :BYTES 226101 :SHA256
   "d46d94ab397c0a50433b679c0546bb9d82f8daabdeb5c0585d0fef928d76fcb6")
  (:PATH "processes/coverage-initial/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001154281-command-84702-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "678643616d5ce0650ce4e855f4c83eb3cb30e07d813879ae2f53a2989d640553")
  (:PATH "processes/coverage-initial/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001154281-command-84702-0/report.lisp")
   :BYTES 226513 :SHA256
   "5f3ec6585258fc84f4ef79215e6e76125900cdc5b9f75314a2de579c0183c23f")
  (:PATH "processes/full-check/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001154602-command-91340-0/conservazione.lisp")
   :BYTES 1721 :SHA256
   "e99df6b555305c5b22d43b11a764e23a891c1d164c3e4709b443028eaa2807b9")
  (:PATH "processes/full-check/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001154602-command-91340-0/report.lisp")
   :BYTES 317 :SHA256
   "3b70f6ebfbd642f7effb8f1aa67b8ae843e0ac68dcf78a9dfb186f7382f756d7")
  (:PATH "processes/full-check/report.lisp.gz" :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001154602-command-91340-0/report.lisp.gz")
   :BYTES 212343 :SHA256
   "6496ef4a4ca110d8baeedbc3d0adb853ca90cd8550125f7d55bf5b0a94e2ef3f")
  (:PATH "processes/integrated-evidence/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001155326-command-12118-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "571149dbe9eff9788052fb719230357733bfec09eafd19446b4f13857c27d851")
  (:PATH "processes/integrated-evidence/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001155326-command-12118-0/report.lisp")
   :BYTES 217305 :SHA256
   "369b2e07970b9ec6665496dee457f615f27044a62b7f493c4ca4c812c6dae997")
  (:PATH "processes/integrated-tests/conservazione.lisp" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001155214-command-8037-0/conservazione.lisp")
   :BYTES 1717 :SHA256
   "b9777a147d94b1ae4a51e5d505ff056e79f0251e6696435037a70849e724ec84")
  (:PATH "processes/integrated-tests/report.lisp" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001155214-command-8037-0/report.lisp")
   :BYTES 317 :SHA256
   "b8ff030a572de04a33793931dfbfda6364c17dc95091397b03f28b64b3c27a5b")
  (:PATH "processes/integrated-tests/report.lisp.gz" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001155214-command-8037-0/report.lisp.gz")
   :BYTES 204097 :SHA256
   "3786be4bb310cebaadf88ccc69ef4ddbf6709788d5d50a87da12fef3beb0bb2f")
  (:PATH "processes/mutation-self-test/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001154308-command-85197-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "6b327c5040be8f5f79bc92459b211a37eac30f9ab1bd00cac4dad2bcdc1b738a")
  (:PATH "processes/mutation-self-test/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001154308-command-85197-0/report.lisp")
   :BYTES 215976 :SHA256
   "66086c986247a5d542c17e033e30b257fbd699c223abdd4119f9e425c682c1ed")
  (:PATH "processes/mutation/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001154425-command-87352-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "ec29185a0a6ecb4921d3883a8e4fbf64c614506c9c439f7f53e43d51a48ccb74")
  (:PATH "processes/mutation/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001154425-command-87352-0/report.lisp")
   :BYTES 219467 :SHA256
   "42ffb63f23cf83eab7383b3cb06da493a6b0a663897159fe35e36d46b4d2d171")
  (:PATH "processes/vertical/conservazione.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001154377-command-86278-0/conservazione.lisp")
   :BYTES 1142 :SHA256
   "2e27631f3522db7e49380ef46b35f3ef0865f49554d1b8a0991e02f9ede483e8")
  (:PATH "processes/vertical/report.lisp" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001154377-command-86278-0/report.lisp")
   :BYTES 224107 :SHA256
   "6b4d8b2d46512ac60abf7cab6ed17d38711b04bba83dc71a1cb28452a3fd0506")
  (:PATH "raw/audit/clock-summary.lisp" :SOURCE
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-audit/clock-summary.lisp")
   :BYTES 252 :SHA256
   "67ca0219210a692c4b8615ed89d27f4ec087180d5674e731cb99cbfbe613d161")
  (:PATH "raw/audit/coverage-audit-result.lisp" :SOURCE
   #A((117) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-audit/coverage-audit-result.lisp")
   :BYTES 1182 :SHA256
   "fb0e6cd357b679659a5aab3d6e62ee1e922587f49cc3ccf52abf5f542236f6cc")
  (:PATH "raw/audit/coverage-audit.lisp.txt" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-audit/coverage-audit.lisp")
   :BYTES 3898 :SHA256
   "07ec2d1b2531a905a2e6e056e728a04578683f956f0624585d9640eaa72fad23")
  (:PATH "raw/audit/development-records.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-audit/development-records.lisp")
   :BYTES 989 :SHA256
   "d39e0ef828cd78f9d9feff7b5954b8a2151ae3582704a4b193070babc29692af")
  (:PATH "raw/audit/full-check-summary.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-audit/full-check-summary.lisp")
   :BYTES 260 :SHA256
   "9cafc8681910fccfad3ce0b7e8d9209dc6491de71315a6d95662f8766f366a2e")
  (:PATH "raw/audit/integrated-evidence-summary.lisp" :SOURCE
   #A((123) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-audit/integrated-evidence-summary.lisp")
   :BYTES 251 :SHA256
   "b0c25ac0285579ec68490b2a402c9ad8a1b2a205bd6b0fae478a71ce3debc583")
  (:PATH "raw/audit/integrated-summary.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-audit/integrated-summary.lisp")
   :BYTES 260 :SHA256
   "fce3feb12c9188bc7241c7041ff60136a0c587140364b584d5dbe5c86f011d0a")
  (:PATH "raw/audit/read-check.lisp.txt" :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-audit/read-check.lisp")
   :BYTES 1621 :SHA256
   "30792f85951186eae59c1c7276673447c6e49e64a9a74a8da26dffdb8c52020e")
  (:PATH "raw/audit/read-records.lisp.txt" :SOURCE
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-audit/read-records.lisp")
   :BYTES 1473 :SHA256
   "c85ac498e97bc1771a33d31517c475d29965c35a29f60ddfcff2fc0350e9d6c6")
  (:PATH "raw/audit/verify-clock-integration.lisp.txt" :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-audit/verify-clock-integration.lisp")
   :BYTES 607 :SHA256
   "6d141a01874f2035a8d36bd279955da0f736e394bba648c7b892c0bacbad2aac")
  (:PATH "raw/code-comparison.txt" :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/code-comparison.txt")
   :BYTES 422 :SHA256
   "c2093b034212d22292d5feffe9601b55f2a0e8675bf8abdf0b99ada0607a8f32")
  (:PATH "raw/coverage/27a7f863c1371612a48a85b3485fa16d.html" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-coverage-2/27a7f863c1371612a48a85b3485fa16d.html")
   :BYTES 19760 :SHA256
   "ff900809cebccc89c7bcaab5ed898b0dc4d3add40398bf06956a3b3bebe02924")
  (:PATH "raw/coverage/289acc711dc8cbe75654900bbac173ff.html" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-coverage-2/289acc711dc8cbe75654900bbac173ff.html")
   :BYTES 10377 :SHA256
   "cddb58a3d76a9c4cbf56b4c021924b9003e5856170916b054719d391e7eac1a6")
  (:PATH "raw/coverage/33bf973423200aea09d36605b6ad41ba.html" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-coverage-2/33bf973423200aea09d36605b6ad41ba.html")
   :BYTES 7040 :SHA256
   "56d4c9716f34d97c9d16c16e351f27c82c111c4b6b0f93246ac57b050f6a586e")
  (:PATH "raw/coverage/453ecce9ed0c1a8b83ba14054b5388f4.html" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-coverage-2/453ecce9ed0c1a8b83ba14054b5388f4.html")
   :BYTES 30257 :SHA256
   "eb47f61bdfec67796cbfd4acacc5b8442090e847c1215a10acbabcc243bd1997")
  (:PATH "raw/coverage/4cb32f6a4e79ed7c5602172741d3a4f7.html" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-coverage-2/4cb32f6a4e79ed7c5602172741d3a4f7.html")
   :BYTES 57520 :SHA256
   "d21f9d9b37609c6d5cf94bbbdd29fd7c4ed379fd80d28401ac680dfcc8856f2e")
  (:PATH "raw/coverage/5dd36d40288a8d37053e0c0ec4faf50b.html" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-coverage-2/5dd36d40288a8d37053e0c0ec4faf50b.html")
   :BYTES 9567 :SHA256
   "76a9fc3c55f9e1098143bc000895754b69209c05885835ffb33184c087b44c4c")
  (:PATH "raw/coverage/629541ca7b566d0a18ef753bd1062a8e.html" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-coverage-2/629541ca7b566d0a18ef753bd1062a8e.html")
   :BYTES 17672 :SHA256
   "1b64dd5d61ebd826e782a0d093201bd401adb1def7d2e3de78b0ffe72116e79b")
  (:PATH "raw/coverage/6c97a011e2c5a4dec8eaf271aeaf13b0.html" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-coverage-2/6c97a011e2c5a4dec8eaf271aeaf13b0.html")
   :BYTES 19611 :SHA256
   "342b23074be5267c1b8c0f82a93ded70e48b902ec0920f2db7452747e0d1d86f")
  (:PATH "raw/coverage/7089fd62da87fbc3e485077d81c6ed2d.html" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-coverage-2/7089fd62da87fbc3e485077d81c6ed2d.html")
   :BYTES 12293 :SHA256
   "86b4408ad1c1b0bf93cbb5e25104fb08a0979e1d3538ef408ac779c6cfa5c564")
  (:PATH "raw/coverage/73044a2cf511751a3edea0528f0e3a00.html" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-coverage-2/73044a2cf511751a3edea0528f0e3a00.html")
   :BYTES 45753 :SHA256
   "956e45048bb69b128ec04213091883567feb95bc5ec792ff1dc9219b923fb691")
  (:PATH "raw/coverage/7562c61cc4608f158a0e82806e20767c.html" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-coverage-2/7562c61cc4608f158a0e82806e20767c.html")
   :BYTES 56651 :SHA256
   "cc25b73afeac5813819e30dcdfb85dffbdd7740bd4aee8fc9bebfd4046da470d")
  (:PATH "raw/coverage/7ffdd16fc0a2e00438392ff57394d0c8.html" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-coverage-2/7ffdd16fc0a2e00438392ff57394d0c8.html")
   :BYTES 72964 :SHA256
   "0f517bafb5d395229982f0ef6b743012816ae16af5d869b4a3772d3b4b3932c4")
  (:PATH "raw/coverage/86d53797d3cab9327b3a19d79833eafa.html" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-coverage-2/86d53797d3cab9327b3a19d79833eafa.html")
   :BYTES 12338 :SHA256
   "acf005d7723e467ccb54725f048484789a7a88b7d0ec7e176f0f60ca960b4338")
  (:PATH "raw/coverage/980c75095272b3077f6cd57f1f82efe8.html" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-coverage-2/980c75095272b3077f6cd57f1f82efe8.html")
   :BYTES 13668 :SHA256
   "de98100b10f1db120bd89c6e92e47d434abaa004558516cca7ab1c5b4229e0a8")
  (:PATH "raw/coverage/9b162382a6e1954fc0ae8b70ac4d10da.html" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-coverage-2/9b162382a6e1954fc0ae8b70ac4d10da.html")
   :BYTES 66964 :SHA256
   "0598f22c463b67af5b972be3e18128cbcd616e7d4d5cd2c07b7eb11ff9c5057d")
  (:PATH "raw/coverage/acf97880925b02c1f4ee153ea089f1ed.html" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-coverage-2/acf97880925b02c1f4ee153ea089f1ed.html")
   :BYTES 37568 :SHA256
   "825fbd5cfbdbe443636edc82f6636da37b8a0b04e348e53a013dbe63012650a9")
  (:PATH "raw/coverage/b821902cbd573ec8a825c2cfeee21742.html" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-coverage-2/b821902cbd573ec8a825c2cfeee21742.html")
   :BYTES 20370 :SHA256
   "e5f07fd3df6e150a9c69bfc4b66d168b6d43983a451dff4525b79e7d13ddcb4f")
  (:PATH "raw/coverage/cover-index.html" :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-coverage-2/cover-index.html")
   :BYTES 5576 :SHA256
   "ed05e62399886760d92cb5750ed91163c45ed6d5c9866e8bdac8599c28b1504f")
  (:PATH "raw/coverage/coverage-state.lisp.gz" :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/coverage-state.lisp.gz")
   :BYTES 490067 :SHA256
   "84b4ee9649e39b1fcc1047c9a588f05b75b44d807e2153b9ed4df42e826fc71e")
  (:PATH "raw/coverage/d9dce4ce8564715b729420ce30e4a537.html" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-coverage-2/d9dce4ce8564715b729420ce30e4a537.html")
   :BYTES 38964 :SHA256
   "7c1ab633106819990a9d2bfe9c4fc732cb9015a6b17a76ae05074c9042f10886")
  (:PATH "raw/coverage/ebc53c7f343684c5e6d739ca04a44d08.html" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-coverage-2/ebc53c7f343684c5e6d739ca04a44d08.html")
   :BYTES 63768 :SHA256
   "0c1ecfa1ef9b70ea128bd2044fa2af1e29f49735ad046ff529b9611b6866b76f")
  (:PATH "raw/coverage/eeca36d650ca02d2cfd327494a1dee5b.html" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-coverage-2/eeca36d650ca02d2cfd327494a1dee5b.html")
   :BYTES 6084 :SHA256
   "057a414fcc9ef4f815d4cd7ae21bf7e2ce430018ea0cd29f4b351756d29a2229")
  (:PATH "raw/coverage/f8a63000ada3f970f085ccad83c4deb4.html" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-coverage-2/f8a63000ada3f970f085ccad83c4deb4.html")
   :BYTES 34756 :SHA256
   "9e878f9b87661eec59aac261eab9201c7ce53abe27b2b715276057320604fede")
  (:PATH "raw/current/CHANGELOG.md.txt" :SOURCE
   #A((73) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/CHANGELOG.md")
   :BYTES 29847 :SHA256
   "6ede2191c15f6cb34dedf8fa147183a24d0f988ea0ee7ef70a2c7555f0c0155b")
  (:PATH "raw/current/arcdocdb.asd.txt" :SOURCE
   #A((73) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/arcdocdb.asd")
   :BYTES 20530 :SHA256
   "42a82133b6e8f9ba337fab37c19d0defdefe09d84f6bf6ba230a002a15929fc6")
  (:PATH "raw/current/docs/affidabilita/copertura-eccezioni.md.txt" :SOURCE
   #A((101) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/affidabilita/copertura-eccezioni.md")
   :BYTES 21895 :SHA256
   "40492dd15342a8f7b998527fae0913363a3da13b62ba8c570bfbf2e10fa2d8e9")
  (:PATH "raw/current/docs/implementazione/README.md.txt" :SOURCE
   #A((91) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/README.md")
   :BYTES 14858 :SHA256
   "3d6486d2eb34773153f4324f2c4cf8ec403d8e9e142567406c21447209bff3e7")
  (:PATH "raw/current/docs/implementazione/active-recuperato.md.txt" :SOURCE
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/active-recuperato.md")
   :BYTES 12009 :SHA256
   "97df55764cef2c1f78dc375e56b64947350aeadd1c1bff704fa1e2dc7ef359e5")
  (:PATH "raw/current/docs/implementazione/cbor-stringa-lettura-metodo.md.txt"
   :SOURCE
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/cbor-stringa-lettura-metodo.md")
   :BYTES 4362 :SHA256
   "8991e8feebab164658d533185853cd5bd70829d52426a0009490621ce93c4948")
  (:PATH "raw/current/docs/implementazione/csn-archivio-recovery.md.txt"
   :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/csn-archivio-recovery.md")
   :BYTES 6917 :SHA256
   "e42d3f168104fcda8aa60b8ce127fa5ead4ad74dd0d1851e9fa723f878ff8941")
  (:PATH "raw/current/docs/implementazione/id-directory-recovery.md.txt"
   :SOURCE
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/id-directory-recovery.md")
   :BYTES 8564 :SHA256
   "dc44bc256b7b712ea84b0b961ab00a7bdaf265cabd944a89fa23b57eb550ed5c")
  (:PATH "raw/current/docs/implementazione/id-segmento-recovery.md.txt" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/id-segmento-recovery.md")
   :BYTES 8870 :SHA256
   "4a938a796ab00b8578c525b2bba12aa81f06f12e3148863b6214fac76ee361d8")
  (:PATH "raw/current/docs/implementazione/prova-verticale.md.txt" :SOURCE
   #A((100) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/prova-verticale.md")
   :BYTES 5888 :SHA256
   "0fe561d85df913dba54938c0d496fc0e567627fe7982284cb848412ff281982d")
  (:PATH "raw/current/docs/implementazione/recovery-csn.md.txt" :SOURCE
   #A((97) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/recovery-csn.md")
   :BYTES 7283 :SHA256
   "0b4356f49b1fc9f20d13ea1900ea996615f978d7283f14a2a61b56b19d464047")
  (:PATH "raw/current/docs/roadmap.md.txt" :SOURCE
   #A((76) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/roadmap.md")
   :BYTES 12770 :SHA256
   "b5fbab9ad0986dc9006f22db5203bd1d376202e9fe34a19b42f7dcf82e225c4c")
  (:PATH "raw/current/src/recovery-active/build.lisp.txt" :SOURCE
   #A((91) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery-active/build.lisp")
   :BYTES 5138 :SHA256
   "1dce9634f8e97e9926ae9962c3ae1a342c412c3bc880d1a5e09aee366e018d2e")
  (:PATH "raw/current/src/recovery-active/types.lisp.txt" :SOURCE
   #A((91) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery-active/types.lisp")
   :BYTES 2443 :SHA256
   "13d586064264522fb6e8e4bcf0adf3b4c3c027b52c48d1b2bd020fb176f3089f")
  (:PATH "raw/current/src/recovery-archive-csn/build.lisp.txt" :SOURCE
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery-archive-csn/build.lisp")
   :BYTES 2409 :SHA256
   "31f512bc8b36a9cb12c073c2ba6e9dc11f6b18c8deaed58d294d39ae6d2c4093")
  (:PATH "raw/current/src/recovery-archive-csn/package.lisp.txt" :SOURCE
   #A((98) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery-archive-csn/package.lisp")
   :BYTES 1041 :SHA256
   "628d3e05b663c4adce473b2f47a3c3bbf4308c2eb6e925a95d3289368f3099b8")
  (:PATH "raw/current/src/recovery-archive-csn/preflight.lisp.txt" :SOURCE
   #A((100) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery-archive-csn/preflight.lisp")
   :BYTES 2961 :SHA256
   "981914146c6c4f6ec8666c84f40e55eae55d5937bc6cbdbd701a9805ade915b9")
  (:PATH "raw/current/src/recovery-archive-csn/query.lisp.txt" :SOURCE
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery-archive-csn/query.lisp")
   :BYTES 2153 :SHA256
   "dc91c0b645bb494ddbbc99aeffc8c4635904f3d2b6b7e393c8ee4a36413ca289")
  (:PATH "raw/current/src/recovery-archive-csn/series.lisp.txt" :SOURCE
   #A((97) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery-archive-csn/series.lisp")
   :BYTES 3147 :SHA256
   "93b69a8353e2617e18dd2245fe2db5ad6d5170401e79c2bd4f787c79254c0b29")
  (:PATH "raw/current/src/recovery-archive-csn/types.lisp.txt" :SOURCE
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery-archive-csn/types.lisp")
   :BYTES 1553 :SHA256
   "8ca0c4ab26431c3bce083247047f29b788a6c99908ad2fbdbca4d03ecd1f3180")
  (:PATH "raw/current/src/recovery/decisions-types.lisp.txt" :SOURCE
   #A((94) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/decisions-types.lisp")
   :BYTES 2510 :SHA256
   "9bd9914dc071f1606fae6a7a26bf5348ed2c4e4268472adee6f589ac26b95022")
  (:PATH "raw/current/src/recovery/inventory-directory-id.lisp.txt" :SOURCE
   #A((101) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/inventory-directory-id.lisp")
   :BYTES 1869 :SHA256
   "20b78e7ad2f6d2bc75b5a7f77470383943989bf2b041a66e454b1f131a34e6d2")
  (:PATH "raw/current/src/recovery/inventory-id.lisp.txt" :SOURCE
   #A((91) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/inventory-id.lisp")
   :BYTES 3569 :SHA256
   "4d0681d4021f24df8d134df9a72790c25099889594224f3d9fa78e1f662babf7")
  (:PATH "raw/current/src/recovery/manifest-package.lisp.txt" :SOURCE
   #A((95) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/manifest-package.lisp")
   :BYTES 1534 :SHA256
   "834398fe14d84559654f83cd7b422a2a38674cbf5449f0bd381aebd711ef0fa0")
  (:PATH "raw/current/tests/codec/cbor-string-read-threads.lisp.txt" :SOURCE
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/codec/cbor-string-read-threads.lisp")
   :BYTES 3866 :SHA256
   "b4ac6b2b09afa8d51e6578b577503a6aa2def65b4df61836b2a3cc912bdb4d83")
  (:PATH "raw/current/tests/recovery/inventory-directory-id.lisp.txt" :SOURCE
   #A((103) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/recovery/inventory-directory-id.lisp")
   :BYTES 14266 :SHA256
   "87740363f797bc2e46f4d4999c98800a9ceecd58e8f772dea65d1466b6b3661e")
  (:PATH "raw/current/tests/vertical/method.md.txt" :SOURCE
   #A((85) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/vertical/method.md")
   :BYTES 5414 :SHA256
   "7615a1d6687d2c4ff573a5644a84183845bc5d115bf3292eebf0ce74f0ac899d")
  (:PATH "raw/current/tests/vertical/scenarios.lisp.txt" :SOURCE
   #A((90) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/vertical/scenarios.lisp")
   :BYTES 5923 :SHA256
   "59e7d98ea2dce103d22ed87377654fc3c22cda92f0f8063db5fbadf022e0fffe")
  (:PATH "raw/current/tests/vertical/support.lisp.txt" :SOURCE
   #A((88) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/vertical/support.lisp")
   :BYTES 13839 :SHA256
   "e429d35024a76e5422c65e2738aad30163b68e1c98434296354ec3c5a1b13689")
  (:PATH "raw/current/tools/foundation-mutation.lisp.txt" :SOURCE
   #A((91) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tools/foundation-mutation.lisp")
   :BYTES 43698 :SHA256
   "e0e7816fbb233bc82c0308f1137b6c421eae671adf6cd12fcccd91b3dd6b1e9a")
  (:PATH "raw/mutation/0/src/recovery/inventory-directory-id.lisp.txt" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/0/src/recovery/inventory-directory-id.lisp")
   :BYTES 1869 :SHA256
   "20b78e7ad2f6d2bc75b5a7f77470383943989bf2b041a66e454b1f131a34e6d2")
  (:PATH "raw/mutation/0/src/recovery/inventory-id.lisp.txt" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/0/src/recovery/inventory-id.lisp")
   :BYTES 3563 :SHA256
   "ce44c63c799e90dcf720f8e81a65d6d7b90c4aa9aa5a455dff7c8b3650d24f6d")
  (:PATH "raw/mutation/0/test.log" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/0/test.log")
   :BYTES 12911 :SHA256
   "0a69b1db9d17be62b9584863b1310a78ff74a44fef6022e07ea75ef62f18e4b5")
  (:PATH "raw/mutation/0/tools/mutation-isolated-build.lisp.txt" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/0/tools/mutation-isolated-build.lisp")
   :BYTES 1977 :SHA256
   "8e2290288501293e6929a80fc4b418ffd1943d2bab03b03c28c436cbe0e68983")
  (:PATH "raw/mutation/1/src/recovery/inventory-directory-id.lisp.txt" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/1/src/recovery/inventory-directory-id.lisp")
   :BYTES 1869 :SHA256
   "20b78e7ad2f6d2bc75b5a7f77470383943989bf2b041a66e454b1f131a34e6d2")
  (:PATH "raw/mutation/1/src/recovery/inventory-id.lisp.txt" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/1/src/recovery/inventory-id.lisp")
   :BYTES 3569 :SHA256
   "b7594a6a19c318967bfa89bfe2b0a1e93c4ba222f20bd0cce2f164759b8e1cdd")
  (:PATH "raw/mutation/1/test.log" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/1/test.log")
   :BYTES 12876 :SHA256
   "5e2dc4fd74927d5ef9e63d27f71db3fefcb822d503aa990d0736da149b012dbf")
  (:PATH "raw/mutation/1/tools/mutation-isolated-build.lisp.txt" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/1/tools/mutation-isolated-build.lisp")
   :BYTES 1977 :SHA256
   "639959519945480e74303c875d1a27ce1cc02c016025d54406a9fc53da1c5de4")
  (:PATH "raw/mutation/10/src/recovery/inventory-directory-id.lisp.txt" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/10/src/recovery/inventory-directory-id.lisp")
   :BYTES 1869 :SHA256
   "20b78e7ad2f6d2bc75b5a7f77470383943989bf2b041a66e454b1f131a34e6d2")
  (:PATH "raw/mutation/10/src/recovery/inventory-id.lisp.txt" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/10/src/recovery/inventory-id.lisp")
   :BYTES 3574 :SHA256
   "b6179872da56ab214b79f567d31faec4fa065e0880b62d7558349d73088b02bd")
  (:PATH "raw/mutation/10/test.log" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/10/test.log")
   :BYTES 12516 :SHA256
   "01ffc7ddb49abc71337e10354c984ce2918cf76133ef9800ba886fa29587b5c4")
  (:PATH "raw/mutation/10/tools/mutation-isolated-build.lisp.txt" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/10/tools/mutation-isolated-build.lisp")
   :BYTES 1979 :SHA256
   "4ed207072ce5857acaa117884be381a0373949edec6e3dfdd839d856c64c05c8")
  (:PATH "raw/mutation/11/src/recovery/inventory-directory-id.lisp.txt" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/11/src/recovery/inventory-directory-id.lisp")
   :BYTES 1881 :SHA256
   "7a6f869dcd582b2c141057eef4a419fac2bee89397537e3a1e79870dfeb06268")
  (:PATH "raw/mutation/11/src/recovery/inventory-id.lisp.txt" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/11/src/recovery/inventory-id.lisp")
   :BYTES 3569 :SHA256
   "4d0681d4021f24df8d134df9a72790c25099889594224f3d9fa78e1f662babf7")
  (:PATH "raw/mutation/11/test.log" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/11/test.log")
   :BYTES 15480 :SHA256
   "6fac4ffa1447a081b524e4204466734147637e94dbe538d809d9aeab65e86e8a")
  (:PATH "raw/mutation/11/tools/mutation-isolated-build.lisp.txt" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/11/tools/mutation-isolated-build.lisp")
   :BYTES 1979 :SHA256
   "db92d2b33f9bb65cd04026a5e1589684b5c74066ca6a887d3cb98145bbd8d0d8")
  (:PATH "raw/mutation/12/src/recovery/inventory-directory-id.lisp.txt" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/12/src/recovery/inventory-directory-id.lisp")
   :BYTES 1881 :SHA256
   "d648da24c1b009c58d3a13d3075f9e59a11a590cc024337df4d3a23f04bdd276")
  (:PATH "raw/mutation/12/src/recovery/inventory-id.lisp.txt" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/12/src/recovery/inventory-id.lisp")
   :BYTES 3569 :SHA256
   "4d0681d4021f24df8d134df9a72790c25099889594224f3d9fa78e1f662babf7")
  (:PATH "raw/mutation/12/test.log" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/12/test.log")
   :BYTES 15547 :SHA256
   "28f7732486cc76c015319e27499797a0744419550426781dceb9763dfe154d5c")
  (:PATH "raw/mutation/12/tools/mutation-isolated-build.lisp.txt" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/12/tools/mutation-isolated-build.lisp")
   :BYTES 1979 :SHA256
   "687f5807274cda9f8b4404ca3e5dbdb08fc2ff1e9e80124e0f34397d63f9decd")
  (:PATH "raw/mutation/13/src/recovery/inventory-directory-id.lisp.txt" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/13/src/recovery/inventory-directory-id.lisp")
   :BYTES 1881 :SHA256
   "d38a67300d659da1d2061b34d8f011d5e6b562e43b60314143cf4a75e9325a3a")
  (:PATH "raw/mutation/13/src/recovery/inventory-id.lisp.txt" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/13/src/recovery/inventory-id.lisp")
   :BYTES 3569 :SHA256
   "4d0681d4021f24df8d134df9a72790c25099889594224f3d9fa78e1f662babf7")
  (:PATH "raw/mutation/13/test.log" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/13/test.log")
   :BYTES 15565 :SHA256
   "ff73e7d366260b11a1b4862c0ab91dad25e6a06eb6598a0e82266791fe958c19")
  (:PATH "raw/mutation/13/tools/mutation-isolated-build.lisp.txt" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/13/tools/mutation-isolated-build.lisp")
   :BYTES 1979 :SHA256
   "4498c2df7109883cfd71b9b7daede9ac723c33f92557422de96d8d3ea9b5ee33")
  (:PATH "raw/mutation/14/src/recovery/inventory-directory-id.lisp.txt" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/14/src/recovery/inventory-directory-id.lisp")
   :BYTES 1884 :SHA256
   "5f8cfe520898c247aa287af9efe05acf3638ea976b4e1abb6dc5162c0a65b228")
  (:PATH "raw/mutation/14/src/recovery/inventory-id.lisp.txt" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/14/src/recovery/inventory-id.lisp")
   :BYTES 3569 :SHA256
   "4d0681d4021f24df8d134df9a72790c25099889594224f3d9fa78e1f662babf7")
  (:PATH "raw/mutation/14/test.log" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/14/test.log")
   :BYTES 15567 :SHA256
   "dbc519000e8e1926c8a0b84b4b08722d21758d8dfb13e9ee4672bac1420d78c3")
  (:PATH "raw/mutation/14/tools/mutation-isolated-build.lisp.txt" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/14/tools/mutation-isolated-build.lisp")
   :BYTES 1979 :SHA256
   "cd00ab8cd08f34fe44d33df9b299ad2d7908651c9b9aa8f7a3d0c7fe6580236e")
  (:PATH "raw/mutation/15/src/recovery/inventory-directory-id.lisp.txt" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/15/src/recovery/inventory-directory-id.lisp")
   :BYTES 1879 :SHA256
   "607159aa7a288ed0b84ddfb562b458fa9b81d6435a8928821cea32789905d487")
  (:PATH "raw/mutation/15/src/recovery/inventory-id.lisp.txt" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/15/src/recovery/inventory-id.lisp")
   :BYTES 3569 :SHA256
   "4d0681d4021f24df8d134df9a72790c25099889594224f3d9fa78e1f662babf7")
  (:PATH "raw/mutation/15/test.log" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/15/test.log")
   :BYTES 15562 :SHA256
   "206614945d655d80738e4b246b6e20866edd22743b0cdfd16cf1b91d51aea42e")
  (:PATH "raw/mutation/15/tools/mutation-isolated-build.lisp.txt" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/15/tools/mutation-isolated-build.lisp")
   :BYTES 1979 :SHA256
   "fc910b22f4446c269b7007c5749a0ec4ffddb09f52880fac9fb161cb2158791c")
  (:PATH "raw/mutation/16/src/recovery/inventory-directory-id.lisp.txt" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/16/src/recovery/inventory-directory-id.lisp")
   :BYTES 1918 :SHA256
   "e9a78362caf5f3be27b28c37b2121579b28c781170809b552570d2864f377627")
  (:PATH "raw/mutation/16/src/recovery/inventory-id.lisp.txt" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/16/src/recovery/inventory-id.lisp")
   :BYTES 3569 :SHA256
   "4d0681d4021f24df8d134df9a72790c25099889594224f3d9fa78e1f662babf7")
  (:PATH "raw/mutation/16/test.log" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/16/test.log")
   :BYTES 16499 :SHA256
   "00c029da5d787c17263240ec9c2e5264254760a3f80afacb3390696d1a10e855")
  (:PATH "raw/mutation/16/tools/mutation-isolated-build.lisp.txt" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/16/tools/mutation-isolated-build.lisp")
   :BYTES 1979 :SHA256
   "dc9db2774a7e38090525d0c0a420f0348f9a7921caba96deb935b4d19d6a2f9a")
  (:PATH "raw/mutation/2/src/recovery/inventory-directory-id.lisp.txt" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/2/src/recovery/inventory-directory-id.lisp")
   :BYTES 1869 :SHA256
   "20b78e7ad2f6d2bc75b5a7f77470383943989bf2b041a66e454b1f131a34e6d2")
  (:PATH "raw/mutation/2/src/recovery/inventory-id.lisp.txt" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/2/src/recovery/inventory-id.lisp")
   :BYTES 3564 :SHA256
   "edfb69fbc6fabfca024c4aa2e3ecc8890e254f298b8aa0ae88fc38cfe8451eba")
  (:PATH "raw/mutation/2/test.log" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/2/test.log")
   :BYTES 12876 :SHA256
   "aa0bb5561a0bed543b9c176ff54eae7abba2508be0a004e518f81413b713a393")
  (:PATH "raw/mutation/2/tools/mutation-isolated-build.lisp.txt" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/2/tools/mutation-isolated-build.lisp")
   :BYTES 1977 :SHA256
   "3d7ac54abb331b1af2f96abee9fb0708efd3efef905c8b22f6b56ed99d8157e5")
  (:PATH "raw/mutation/3/src/recovery/inventory-directory-id.lisp.txt" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/3/src/recovery/inventory-directory-id.lisp")
   :BYTES 1869 :SHA256
   "20b78e7ad2f6d2bc75b5a7f77470383943989bf2b041a66e454b1f131a34e6d2")
  (:PATH "raw/mutation/3/src/recovery/inventory-id.lisp.txt" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/3/src/recovery/inventory-id.lisp")
   :BYTES 3576 :SHA256
   "67e5068d21259f4c8454dcf05d41d35d9142783fbbb0ae94a40e70a36680b05b")
  (:PATH "raw/mutation/3/test.log" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/3/test.log")
   :BYTES 12559 :SHA256
   "6f915e04f35d7f721297d1ad439433122bee07ad6b9942b6af7088538d752cbf")
  (:PATH "raw/mutation/3/tools/mutation-isolated-build.lisp.txt" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/3/tools/mutation-isolated-build.lisp")
   :BYTES 1977 :SHA256
   "b0e68920916549e4b311ad22d80d3f55aa7461035e61181321898ac4e03e7581")
  (:PATH "raw/mutation/4/src/recovery/inventory-directory-id.lisp.txt" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/4/src/recovery/inventory-directory-id.lisp")
   :BYTES 1869 :SHA256
   "20b78e7ad2f6d2bc75b5a7f77470383943989bf2b041a66e454b1f131a34e6d2")
  (:PATH "raw/mutation/4/src/recovery/inventory-id.lisp.txt" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/4/src/recovery/inventory-id.lisp")
   :BYTES 3568 :SHA256
   "65bdb8a37c4e819261dbc32f6fe2da54fb0153d1e88abb927a14bb955b990c60")
  (:PATH "raw/mutation/4/test.log" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/4/test.log")
   :BYTES 12755 :SHA256
   "142c3de3198b1b940cf688ebcf7db122406e7572b304e296754725df237b0863")
  (:PATH "raw/mutation/4/tools/mutation-isolated-build.lisp.txt" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/4/tools/mutation-isolated-build.lisp")
   :BYTES 1977 :SHA256
   "70b89af2354342e0e2dd590161865d5f3979880d1e75be17798d5c9bd4a83d58")
  (:PATH "raw/mutation/5/src/recovery/inventory-directory-id.lisp.txt" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/5/src/recovery/inventory-directory-id.lisp")
   :BYTES 1869 :SHA256
   "20b78e7ad2f6d2bc75b5a7f77470383943989bf2b041a66e454b1f131a34e6d2")
  (:PATH "raw/mutation/5/src/recovery/inventory-id.lisp.txt" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/5/src/recovery/inventory-id.lisp")
   :BYTES 3570 :SHA256
   "a40de83476a69ad9fc424cf301ca964b4ab1a259fa66ee5ab314158ac3bde49e")
  (:PATH "raw/mutation/5/test.log" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/5/test.log")
   :BYTES 12559 :SHA256
   "4b0dc4ec35f3329cbaaebf14ee6b495824aae77a56e04d3d8efb66406337d738")
  (:PATH "raw/mutation/5/tools/mutation-isolated-build.lisp.txt" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/5/tools/mutation-isolated-build.lisp")
   :BYTES 1977 :SHA256
   "cd4bc67b7554c772b13dbc18d3e287881d71beae7bdb9cde3c2390cbd7af87cf")
  (:PATH "raw/mutation/6/src/recovery/inventory-directory-id.lisp.txt" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/6/src/recovery/inventory-directory-id.lisp")
   :BYTES 1869 :SHA256
   "20b78e7ad2f6d2bc75b5a7f77470383943989bf2b041a66e454b1f131a34e6d2")
  (:PATH "raw/mutation/6/src/recovery/inventory-id.lisp.txt" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/6/src/recovery/inventory-id.lisp")
   :BYTES 3568 :SHA256
   "09dc37182c67f580d335468fbee0365c1dab8601c00fb8ba40719f0da41929cf")
  (:PATH "raw/mutation/6/test.log" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/6/test.log")
   :BYTES 12559 :SHA256
   "82108b43803ca791a365cfe942a5ae1b7e4fa1d675072a75e7aa7aea7f045d2e")
  (:PATH "raw/mutation/6/tools/mutation-isolated-build.lisp.txt" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/6/tools/mutation-isolated-build.lisp")
   :BYTES 1977 :SHA256
   "d7eb8a17f702a3dcc81fecc49d7c361ff9c629d776684c73bd04c0b3582661e6")
  (:PATH "raw/mutation/7/src/recovery/inventory-directory-id.lisp.txt" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/7/src/recovery/inventory-directory-id.lisp")
   :BYTES 1869 :SHA256
   "20b78e7ad2f6d2bc75b5a7f77470383943989bf2b041a66e454b1f131a34e6d2")
  (:PATH "raw/mutation/7/src/recovery/inventory-id.lisp.txt" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/7/src/recovery/inventory-id.lisp")
   :BYTES 3564 :SHA256
   "cb2b40de29dacef791a45f04ea41b19ad5a1bfb4c7f6858901a1c9afedb6fab8")
  (:PATH "raw/mutation/7/test.log" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/7/test.log")
   :BYTES 12757 :SHA256
   "cfb0765239d27843956947de1be2d406a281b5bded10e2396a404305d974d054")
  (:PATH "raw/mutation/7/tools/mutation-isolated-build.lisp.txt" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/7/tools/mutation-isolated-build.lisp")
   :BYTES 1977 :SHA256
   "92ba887cffb57fe6148f6429c94ef1399fb7d9bc8ee7eeaee2d6a5cb82f7d727")
  (:PATH "raw/mutation/8/src/recovery/inventory-directory-id.lisp.txt" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/8/src/recovery/inventory-directory-id.lisp")
   :BYTES 1869 :SHA256
   "20b78e7ad2f6d2bc75b5a7f77470383943989bf2b041a66e454b1f131a34e6d2")
  (:PATH "raw/mutation/8/src/recovery/inventory-id.lisp.txt" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/8/src/recovery/inventory-id.lisp")
   :BYTES 3567 :SHA256
   "41653efadf9c4e56b5ad89b2f8781ac82384f0c26257ef89ab94a1d158a231de")
  (:PATH "raw/mutation/8/test.log" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/8/test.log")
   :BYTES 12559 :SHA256
   "6172d6e7c23b9001cfd55fa11d51a6c68a34f1b4dd32bc95d31b660f5e8e2ba5")
  (:PATH "raw/mutation/8/tools/mutation-isolated-build.lisp.txt" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/8/tools/mutation-isolated-build.lisp")
   :BYTES 1977 :SHA256
   "24a1b0380c603d64d07cabbf481c4fdf45a1b19b6b1eba57a9d87cf2d0a87126")
  (:PATH "raw/mutation/9/src/recovery/inventory-directory-id.lisp.txt" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/9/src/recovery/inventory-directory-id.lisp")
   :BYTES 1869 :SHA256
   "20b78e7ad2f6d2bc75b5a7f77470383943989bf2b041a66e454b1f131a34e6d2")
  (:PATH "raw/mutation/9/src/recovery/inventory-id.lisp.txt" :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/9/src/recovery/inventory-id.lisp")
   :BYTES 3567 :SHA256
   "d59943806b6931055cdb793c2350f559137bfec80e34d032a7a4fbfdb1539e81")
  (:PATH "raw/mutation/9/test.log" :SOURCE
   #A((104) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/9/test.log")
   :BYTES 12687 :SHA256
   "5f5ddb9ee0a4849b7d625b976506b4e47bdd938c29c4d226594efb83d158c862")
  (:PATH "raw/mutation/9/tools/mutation-isolated-build.lisp.txt" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/9/tools/mutation-isolated-build.lisp")
   :BYTES 1977 :SHA256
   "346f44f700fe48af8506de11da5bf5f3670ce553363a6776d4debb55a2878dc2")
  (:PATH "raw/mutation/baseline/src/recovery/inventory-directory-id.lisp.txt"
   :SOURCE
   #A((143) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/baseline/src/recovery/inventory-directory-id.lisp")
   :BYTES 1869 :SHA256
   "20b78e7ad2f6d2bc75b5a7f77470383943989bf2b041a66e454b1f131a34e6d2")
  (:PATH "raw/mutation/baseline/src/recovery/inventory-id.lisp.txt" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/baseline/src/recovery/inventory-id.lisp")
   :BYTES 3569 :SHA256
   "4d0681d4021f24df8d134df9a72790c25099889594224f3d9fa78e1f662babf7")
  (:PATH "raw/mutation/baseline/test.log" :SOURCE
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/baseline/test.log")
   :BYTES 2583 :SHA256
   "3b6f8e378a785b3835fd84b95f4f9fd93796510d17cd2e81b4724c23c3fdea1c")
  (:PATH "raw/mutation/baseline/tools/mutation-isolated-build.lisp.txt" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/baseline/tools/mutation-isolated-build.lisp")
   :BYTES 1991 :SHA256
   "daa7d10a5faae0e9f5aad8ef4c652b1b9a2b89ea26674864550aec7643955871")
  (:PATH "raw/mutation/report.lisp" :SOURCE
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-mutation/report.lisp")
   :BYTES 3637 :SHA256
   "559099ea2e6ac824fcad677857d6353e9987673262dd7b6d0304b92a4178a138")
  (:PATH "raw/spikes/SPK-01.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001155075-check-3491-0/SPK-01.lisp")
   :BYTES 27228 :SHA256
   "124b955b35c1e563d0dc5f196d48800ce66f72ac57a37647c2cfa581ba899c20")
  (:PATH "raw/spikes/SPK-02.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001155075-check-3491-0/SPK-02.lisp")
   :BYTES 1607 :SHA256
   "c7e4f9318fc2527e46dda77dbebbfcff91cc51c0a1455849152803d92c7fa20a")
  (:PATH "raw/spikes/SPK-03.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001155075-check-3491-0/SPK-03.lisp")
   :BYTES 3638 :SHA256
   "88f4398255c3dbdb01d3346e005e43459239082fd78f7d3edc7c7c78c83c043a")
  (:PATH "raw/spikes/SPK-04.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001155075-check-3491-0/SPK-04.lisp")
   :BYTES 6752 :SHA256
   "cdf331dd1362ad0db8c877b3f41f6a78b057814caebc2713d3c5aab59038771f")
  (:PATH "raw/spikes/SPK-05.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001155075-check-3491-0/SPK-05.lisp")
   :BYTES 10105 :SHA256
   "8a878885ea78fad96d07a5ea6dc350ea8d9a48187394da0a8d7dfdcbf8d98894")
  (:PATH "raw/spikes/SPK-06.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001155075-check-3491-0/SPK-06.lisp")
   :BYTES 24038 :SHA256
   "c13e6d2c334a976c13e637f92cf07b898b815fe18e9b5dddccfdfcee33222928")
  (:PATH "raw/spikes/SPK-07.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001155075-check-3491-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "18e849a4a6e0895e633443def6f9b4a4a2e4582f52232bfd5c1ba6443bb3cb39")
  (:PATH "raw/spikes/SPK-07.lisp.gz" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001155075-check-3491-0/SPK-07.lisp.gz")
   :BYTES 410618 :SHA256
   "569589c9a387cc3821fe9506da849c6f974e2cb09fc8ab94da4c1e0ee3e82301")
  (:PATH "raw/spikes/SPK-08.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001155075-check-3491-0/SPK-08.lisp")
   :BYTES 291711 :SHA256
   "503a9a9baeebaa57096f1172128aad4558030ebac64a7e3863d661de75ec6c32")
  (:PATH "raw/spikes/SPK-09.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001155075-check-3491-0/SPK-09.lisp")
   :BYTES 2472 :SHA256
   "0ab418a1c45d976ea7054efa692ecf68b470113327da178d5b9ce2ec83d2e2ac")
  (:PATH "raw/spikes/SPK-10.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001155075-check-3491-0/SPK-10.lisp")
   :BYTES 22975 :SHA256
   "c0f84952d9d93af5c6ab43bd0e6d68a7775bd2b161df40b265151eab75f0780d")
  (:PATH "raw/spikes/conservazione.lisp" :SOURCE
   #A((114) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001155075-check-3491-0/conservazione.lisp")
   :BYTES 2277 :SHA256
   "4c52e970560c843d79901e74469fe9d09843e6b1b56611355f8b91956a15d74e")
  (:PATH "raw/spikes/report.lisp" :SOURCE
   #A((107) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001155075-check-3491-0/report.lisp")
   :BYTES 318 :SHA256
   "5331a5fb9e24adc55149710ad58cc5876be094f24da0c93f451fb73c497479a3")
  (:PATH "raw/spikes/report.lisp.gz" :SOURCE
   #A((110) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001155075-check-3491-0/report.lisp.gz")
   :BYTES 466944 :SHA256
   "8b174db7b22fd073f0153c0f7e3e117c50f20569c5d0a3d358c63734d3106e83")
  (:PATH "raw/variants/initial/CHANGELOG.md.txt" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/variants/initial/CHANGELOG.md.txt")
   :BYTES 29151 :SHA256
   "3e6b57ed8556866e99f129be71089c67c183e2bc6e5cffab6863506102e31ed0")
  (:PATH "raw/variants/initial/arcdocdb.asd.txt" :SOURCE
   #A((130) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/variants/initial/arcdocdb.asd.txt")
   :BYTES 20310 :SHA256
   "6171416ba91eac4f18710dcb28746488548e3a0e6437f3f66a15f7469363d674")
  (:PATH "raw/variants/initial/docs/implementazione/README.md.txt" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/variants/initial/docs/implementazione/README.md.txt")
   :BYTES 14675 :SHA256
   "5da15de40b00291f647ab908f90b63e658d6ef43c514b7096622c6f8d4ba342c")
  (:PATH
   "raw/variants/initial/docs/implementazione/id-directory-recovery.md.txt"
   :SOURCE
   #A((163) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/variants/initial/docs/implementazione/id-directory-recovery.md.txt")
   :BYTES 5656 :SHA256
   "479eb9adebb169d84576b91396fcd2db41a1bd8f5fc0832c31c6d11eb2eafc64")
  (:PATH
   "raw/variants/initial/docs/implementazione/id-segmento-recovery.md.txt"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/variants/initial/docs/implementazione/id-segmento-recovery.md.txt")
   :BYTES 8870 :SHA256
   "4a938a796ab00b8578c525b2bba12aa81f06f12e3148863b6214fac76ee361d8")
  (:PATH "raw/variants/initial/docs/implementazione/prova-verticale.md.txt"
   :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/variants/initial/docs/implementazione/prova-verticale.md.txt")
   :BYTES 5909 :SHA256
   "ca87597289ca9760d5e2fed10903f6276038511086aa94a2e101997903674d65")
  (:PATH "raw/variants/initial/docs/roadmap.md.txt" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/variants/initial/docs/roadmap.md.txt")
   :BYTES 12770 :SHA256
   "b5fbab9ad0986dc9006f22db5203bd1d376202e9fe34a19b42f7dcf82e225c4c")
  (:PATH "raw/variants/initial/src/recovery/inventory-directory-id.lisp.txt"
   :SOURCE
   #A((158) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/variants/initial/src/recovery/inventory-directory-id.lisp.txt")
   :BYTES 1869 :SHA256
   "20b78e7ad2f6d2bc75b5a7f77470383943989bf2b041a66e454b1f131a34e6d2")
  (:PATH "raw/variants/initial/src/recovery/inventory-id.lisp.txt" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/variants/initial/src/recovery/inventory-id.lisp.txt")
   :BYTES 3569 :SHA256
   "4d0681d4021f24df8d134df9a72790c25099889594224f3d9fa78e1f662babf7")
  (:PATH "raw/variants/initial/src/recovery/manifest-package.lisp.txt" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/variants/initial/src/recovery/manifest-package.lisp.txt")
   :BYTES 1534 :SHA256
   "834398fe14d84559654f83cd7b422a2a38674cbf5449f0bd381aebd711ef0fa0")
  (:PATH "raw/variants/initial/tests/recovery/inventory-directory-id.lisp.txt"
   :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/variants/initial/tests/recovery/inventory-directory-id.lisp.txt")
   :BYTES 14267 :SHA256
   "23274cd8f5f76d65843ed04974f89fe6488ed3720590e8cbad5ca186b157865b")
  (:PATH "raw/variants/initial/tests/vertical/method.md.txt" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/variants/initial/tests/vertical/method.md.txt")
   :BYTES 5414 :SHA256
   "7615a1d6687d2c4ff573a5644a84183845bc5d115bf3292eebf0ce74f0ac899d")
  (:PATH "raw/variants/initial/tests/vertical/scenarios.lisp.txt" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/variants/initial/tests/vertical/scenarios.lisp.txt")
   :BYTES 5923 :SHA256
   "59e7d98ea2dce103d22ed87377654fc3c22cda92f0f8063db5fbadf022e0fffe")
  (:PATH "raw/variants/initial/tests/vertical/support.lisp.txt" :SOURCE
   #A((145) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/variants/initial/tests/vertical/support.lisp.txt")
   :BYTES 13839 :SHA256
   "e429d35024a76e5422c65e2738aad30163b68e1c98434296354ec3c5a1b13689")
  (:PATH "raw/variants/initial/tools/foundation-mutation.lisp.txt" :SOURCE
   #A((148) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/variants/initial/tools/foundation-mutation.lisp.txt")
   :BYTES 43698 :SHA256
   "e0e7816fbb233bc82c0308f1137b6c421eae671adf6cd12fcccd91b3dd6b1e9a")
  (:PATH
   "raw/variants/preregistered/docs/implementazione/id-directory-recovery.md.txt"
   :SOURCE
   #A((169) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/variants/preregistered/docs/implementazione/id-directory-recovery.md.txt")
   :BYTES 4227 :SHA256
   "45f3c3c004bea86b93101102bb360adef61365ca3e4aa0cd39d6f5994421339b")
  (:PATH "raw/variants/qualified/CHANGELOG.md.txt" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/variants/qualified/CHANGELOG.md.txt")
   :BYTES 29151 :SHA256
   "3e6b57ed8556866e99f129be71089c67c183e2bc6e5cffab6863506102e31ed0")
  (:PATH "raw/variants/qualified/arcdocdb.asd.txt" :SOURCE
   #A((132) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/variants/qualified/arcdocdb.asd.txt")
   :BYTES 20310 :SHA256
   "6171416ba91eac4f18710dcb28746488548e3a0e6437f3f66a15f7469363d674")
  (:PATH "raw/variants/qualified/docs/implementazione/README.md.txt" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/variants/qualified/docs/implementazione/README.md.txt")
   :BYTES 14675 :SHA256
   "5da15de40b00291f647ab908f90b63e658d6ef43c514b7096622c6f8d4ba342c")
  (:PATH
   "raw/variants/qualified/docs/implementazione/id-directory-recovery.md.txt"
   :SOURCE
   #A((165) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/variants/qualified/docs/implementazione/id-directory-recovery.md.txt")
   :BYTES 5656 :SHA256
   "479eb9adebb169d84576b91396fcd2db41a1bd8f5fc0832c31c6d11eb2eafc64")
  (:PATH
   "raw/variants/qualified/docs/implementazione/id-segmento-recovery.md.txt"
   :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/variants/qualified/docs/implementazione/id-segmento-recovery.md.txt")
   :BYTES 8870 :SHA256
   "4a938a796ab00b8578c525b2bba12aa81f06f12e3148863b6214fac76ee361d8")
  (:PATH "raw/variants/qualified/docs/implementazione/prova-verticale.md.txt"
   :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/variants/qualified/docs/implementazione/prova-verticale.md.txt")
   :BYTES 5888 :SHA256
   "0fe561d85df913dba54938c0d496fc0e567627fe7982284cb848412ff281982d")
  (:PATH "raw/variants/qualified/docs/roadmap.md.txt" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/variants/qualified/docs/roadmap.md.txt")
   :BYTES 12770 :SHA256
   "b5fbab9ad0986dc9006f22db5203bd1d376202e9fe34a19b42f7dcf82e225c4c")
  (:PATH "raw/variants/qualified/src/recovery/inventory-directory-id.lisp.txt"
   :SOURCE
   #A((160) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/variants/qualified/src/recovery/inventory-directory-id.lisp.txt")
   :BYTES 1869 :SHA256
   "20b78e7ad2f6d2bc75b5a7f77470383943989bf2b041a66e454b1f131a34e6d2")
  (:PATH "raw/variants/qualified/src/recovery/inventory-id.lisp.txt" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/variants/qualified/src/recovery/inventory-id.lisp.txt")
   :BYTES 3569 :SHA256
   "4d0681d4021f24df8d134df9a72790c25099889594224f3d9fa78e1f662babf7")
  (:PATH "raw/variants/qualified/src/recovery/manifest-package.lisp.txt"
   :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/variants/qualified/src/recovery/manifest-package.lisp.txt")
   :BYTES 1534 :SHA256
   "834398fe14d84559654f83cd7b422a2a38674cbf5449f0bd381aebd711ef0fa0")
  (:PATH
   "raw/variants/qualified/tests/recovery/inventory-directory-id.lisp.txt"
   :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/variants/qualified/tests/recovery/inventory-directory-id.lisp.txt")
   :BYTES 14266 :SHA256
   "87740363f797bc2e46f4d4999c98800a9ceecd58e8f772dea65d1466b6b3661e")
  (:PATH "raw/variants/qualified/tests/vertical/method.md.txt" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/variants/qualified/tests/vertical/method.md.txt")
   :BYTES 5414 :SHA256
   "7615a1d6687d2c4ff573a5644a84183845bc5d115bf3292eebf0ce74f0ac899d")
  (:PATH "raw/variants/qualified/tests/vertical/scenarios.lisp.txt" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/variants/qualified/tests/vertical/scenarios.lisp.txt")
   :BYTES 5923 :SHA256
   "59e7d98ea2dce103d22ed87377654fc3c22cda92f0f8063db5fbadf022e0fffe")
  (:PATH "raw/variants/qualified/tests/vertical/support.lisp.txt" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/variants/qualified/tests/vertical/support.lisp.txt")
   :BYTES 13839 :SHA256
   "e429d35024a76e5422c65e2738aad30163b68e1c98434296354ec3c5a1b13689")
  (:PATH "raw/variants/qualified/tools/foundation-mutation.lisp.txt" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/directory-id-publication/variants/qualified/tools/foundation-mutation.lisp.txt")
   :BYTES 43698 :SHA256
   "e0e7816fbb233bc82c0308f1137b6c421eae671adf6cd12fcccd91b3dd6b1e9a"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
