(:INDEPENDENT-CLOSURE
 (:EXIT-CODE 0 :SIGNAL NIL :LOG
  #A((117) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-final-collection/closed-check.log")
  :RESULT
  (:SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-AUDIT :STATUS :OK :ARCHIVE
   "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-15-recovery-segment-id-verifica/"
   :INDEXED-FILES 62 :ACTUAL-FILES 64 :INDEXED-BYTES 2035529 :PROCESSES
   ((:LABEL "full-check" :RECORD-PATH "processes/full-check/report.lisp"
     :COMMAND
     ("/Applications/Xcode.app/Contents/Developer/usr/bin/make" "check-core")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "interrupted-before-integration" :RECORD-PATH
     "processes/interrupted-before-integration/report.lisp" :COMMAND
     ("/Applications/Xcode.app/Contents/Developer/usr/bin/make" "check-core")
     :STATUS :FAILED :EXIT-CODE 143 :SOURCE-CONSISTENCY :STABLE))
   :INDEX-SHA256
   "c1a1812821046e6d740daa482d86b9020bfed3efd507b91db7367b72c92e4973"
   :CATALOGUE-SHA256
   "9cf22b25bd5c1e65ce0826dae36fc461558db91de2cb1e8683283348e892a69e"
   :ORIGINS-COMPARED NIL :CLOSED-INVENTORY T :READ-EVAL NIL :EOF-REQUIRED T
   :LIMITS
   (:PLAIN-BYTES 1048576 :GZIP-BYTES 8388608 :PROCESS-EXPANDED-BYTES 134217728
    :ENTRIES 100000 :DIRECTORY-DEPTH 128 :DIRECTORY-ENUMERATION-NOT-PREBOUNDED
    T :PER-FILE-LOCAL-OBSERVATION T :ATOMIC-PUBLICATION NIL
    :RESULT-OR-GATE-INFERENCE NIL :MCDC-CLAIM NIL)))
 :CLEANUP-ERRORS NIL :WORKER-ERRORS (NIL NIL NIL NIL) :WORKER-COPIED-COUNTS
 (20 21 20 1) :COPY-RESULTS
 ((:STATUS :OK :ENTRY
   (:PATH "processes/full-check/conservazione.lisp" :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001085323-command-41709-0/conservazione.lisp")
    :BYTES 1721 :SHA256
    "9cda8916557448e58a94ff377b0f13eb9acbea00b50cb90e195a0f6668452435"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/full-check/report.lisp" :SOURCE
    #A((110) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001085323-command-41709-0/report.lisp")
    :BYTES 317 :SHA256
    "d3488a922fa266cb53288dd227ca6419d39311445e460844bcdca160db940a07"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/full-check/report.lisp.gz" :SOURCE
    #A((113) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001085323-command-41709-0/report.lisp.gz")
    :BYTES 208980 :SHA256
    "0c63eecae357f227c0926da207d7d63b4e92e0358ad09a525271efd1f4749347"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/interrupted-before-integration/conservazione.lisp" :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001085243-command-38399-0/conservazione.lisp")
    :BYTES 1721 :SHA256
    "36118c17c7d774e043fe565ed3154706bae14edb0afaf43f0524b8d286529469"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/interrupted-before-integration/report.lisp" :SOURCE
    #A((110) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001085243-command-38399-0/report.lisp")
    :BYTES 317 :SHA256
    "c0528c9ddb380ef701401dff6af1e12a6edfb94592585ea8e39064306a2529cd"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/interrupted-before-integration/report.lisp.gz" :SOURCE
    #A((113) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001085243-command-38399-0/report.lisp.gz")
    :BYTES 175395 :SHA256
    "93323fba7251227fff02f68d483239d791fe7d2666ced43f5e19bfed80b2126b"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/spikes/SPK-01.lisp" :SOURCE
    #A((108) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001085775-check-53649-0/SPK-01.lisp")
    :BYTES 27228 :SHA256
    "478396ae12cdd65c70a23aaa725f031559ea60e9f7051c3e7db5155599b4b0a8"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/spikes/SPK-02.lisp" :SOURCE
    #A((108) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001085775-check-53649-0/SPK-02.lisp")
    :BYTES 1606 :SHA256
    "c8c5347a3bf2d3b22d612ab6ef5d95c43116218820f1b3cd60735337546bfd3d"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/spikes/SPK-03.lisp" :SOURCE
    #A((108) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001085775-check-53649-0/SPK-03.lisp")
    :BYTES 3638 :SHA256
    "ffed87f9ab83411580eafede767b832f920f021b2a34b3f95ff16d80ef5bc9b4"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/spikes/SPK-04.lisp" :SOURCE
    #A((108) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001085775-check-53649-0/SPK-04.lisp")
    :BYTES 6752 :SHA256
    "879c12d2c260a7a148662e4329f4def34de269e0ba155034367c2e01e76884e2"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/spikes/SPK-05.lisp" :SOURCE
    #A((108) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001085775-check-53649-0/SPK-05.lisp")
    :BYTES 10099 :SHA256
    "a666fa99b2784033b7427a953ee3ddaff52f0edb499f21f5730df69b46994d82"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/spikes/SPK-06.lisp" :SOURCE
    #A((108) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001085775-check-53649-0/SPK-06.lisp")
    :BYTES 24112 :SHA256
    "2c75bff728a2a27b95cedc1c355bf02dd03ff51d5e2457bd32724ebc1381cce8"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/spikes/SPK-07.lisp" :SOURCE
    #A((108) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001085775-check-53649-0/SPK-07.lisp")
    :BYTES 318 :SHA256
    "2457531d27b95d8a1394ab224c27e3b76b6fc6b6bfa5e429ab83f3dcc60996f8"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/spikes/SPK-07.lisp.gz" :SOURCE
    #A((111) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001085775-check-53649-0/SPK-07.lisp.gz")
    :BYTES 410635 :SHA256
    "c86c3689a3da9546578a6c94c4e48b09cb0085737f4446f97a83a3edf003334b"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/spikes/SPK-08.lisp" :SOURCE
    #A((108) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001085775-check-53649-0/SPK-08.lisp")
    :BYTES 291712 :SHA256
    "95c8b16314754027ba1b6266f145e8bd7934933328bebe83e5565822831fd082"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/spikes/SPK-09.lisp" :SOURCE
    #A((108) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001085775-check-53649-0/SPK-09.lisp")
    :BYTES 2472 :SHA256
    "17a52130600af8367f31b5576049642e67439821e5543e46a7e859dbbf581715"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/spikes/SPK-10.lisp" :SOURCE
    #A((108) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001085775-check-53649-0/SPK-10.lisp")
    :BYTES 22977 :SHA256
    "a1843d32a992ee0832948d5a6371ae7da37797d08778bae304fdd92656f864e4"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/spikes/conservazione.lisp" :SOURCE
    #A((115) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001085775-check-53649-0/conservazione.lisp")
    :BYTES 2284 :SHA256
    "fa933bd348c1d3b315a73358c3b74fb97e431bc766f483903b1fdeb82f80a512"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/spikes/report.lisp" :SOURCE
    #A((108) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001085775-check-53649-0/report.lisp")
    :BYTES 318 :SHA256
    "eb78a21b51bebc423adc886fe57be8fa6e347b7e6f9c68249dba657c83d12ddb"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/spikes/report.lisp.gz" :SOURCE
    #A((111) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4001085775-check-53649-0/report.lisp.gz")
    :BYTES 466866 :SHA256
    "99012f34321e615426b9dea3d6e1424d82f9b557250f25113e1be620b73b43aa"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/development-collection/closed-check.log" :SOURCE
    #A((113) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-collection-2/closed-check.log")
    :BYTES 2851 :SHA256
    "706a2d34c8a341bae85ba2cbbb40ffee0a1385a917169375e3853ade27484ca0"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/development-collection/report.lisp" :SOURCE
    #A((108) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-collection-2/report.lisp")
    :BYTES 55976 :SHA256
    "cec8e526751651715922d36bd47916f5799e85b24cb4819e408a7a13da53e3ab"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/rejected-collection/report.lisp" :SOURCE
    #A((106) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-collection/report.lisp")
    :BYTES 808 :SHA256
    "d317efc01aa69b71d1fb3efc96b7d15747ee136987175fde548e58ee2aadc648"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/audit/read-full-check.lisp" :SOURCE
    #A((110) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-audit/read-full-check.lisp")
    :BYTES 1811 :SHA256
    "bd4b3f341ce102da2c8beaa0a9e68b6c9944f015cc5e98bba05b0dc27575f0e3"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/audit/read-full-check-before-asdf.lisp.txt" :SOURCE
    #A((126) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-audit/read-full-check-before-asdf.lisp.txt")
    :BYTES 1795 :SHA256
    "6ebe170ad5d25b2305b7eceda6e3e0d236f4d0c80cd913c9726eeb6154b07070"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/audit/read-full-check-before-asdf.log" :SOURCE
    #A((121) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-audit/read-full-check-before-asdf.log")
    :BYTES 3281 :SHA256
    "6c9ed19638b8043acc4e3f6c8991a3032e59dfc678fcaad8cbd9c5db3632673a"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/audit/full-check-summary.lisp" :SOURCE
    #A((113) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-audit/full-check-summary.lisp")
    :BYTES 328 :SHA256
    "0b1fc4a96a7026a1247d4d86999d979d4ba518f078713bef65f9289688d4c35c"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/audit/full-summary.log" :SOURCE
    #A((50) BASE-CHAR . "/private/tmp/arcdocdb-recovery-id-full-summary.log")
    :BYTES 18669 :SHA256
    "cbeeaa9ae264aaa68cf980d3a2ceb378bd99158c92cf444ef02cc3637a2459ff"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/transient-document-links.log" :SOURCE
    #A((46) BASE-CHAR . "/private/tmp/arcdocdb-recovery-id-doccheck.log")
    :BYTES 338 :SHA256
    "952d3d7fa3a720a3c91384152022e07ff4483cbe7e49ec2336b9f5883b495b00"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/CHANGELOG.md.txt" :SOURCE
    #A((73) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/CHANGELOG.md")
    :BYTES 27898 :SHA256
    "ac04a3d1f6934daab7f13cabc4a1ec072e52ebc47b923bd89896c9efabb8101a"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/arcdocdb.asd.txt" :SOURCE
    #A((73) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/arcdocdb.asd")
    :BYTES 19661 :SHA256
    "f5cce374f6ed80af53a7ea0eba6995dd895d7982336a811f06e0ca58be6db5d2"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/docs/affidabilita/copertura-eccezioni.md.txt" :SOURCE
    #A((101) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/affidabilita/copertura-eccezioni.md")
    :BYTES 21140 :SHA256
    "49b0da2e331891697dcf1b3d4038348ce7e5e4b8e913e08faf2521032d4858ea"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/docs/implementazione/README.md.txt" :SOURCE
    #A((91) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/README.md")
    :BYTES 13872 :SHA256
    "a879c0d84b3e6816c5b0fa468fba4b4b7115b31cb116c87d88c96e857b115f79"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/docs/implementazione/id-segmento-recovery.md.txt"
    :SOURCE
    #A((105) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/id-segmento-recovery.md")
    :BYTES 8513 :SHA256
    "16ab9d9c63b8558a4183ae17b089634d7177a96b129252f4971624772355050c"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/docs/implementazione/inventario.md.txt" :SOURCE
    #A((95) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/inventario.md")
    :BYTES 7269 :SHA256
    "61f500974b73e713c8fed1da25113bbbe5007f2c84e5f39f85636e75b8b6fdee"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/docs/implementazione/prova-verticale.md.txt" :SOURCE
    #A((100) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/prova-verticale.md")
    :BYTES 5748 :SHA256
    "e387bbe6296721caac22fba6bbf77b3f9d4efcf14c583871c54295d127aef026"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/docs/implementazione/recovery-csn.md.txt" :SOURCE
    #A((97) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/recovery-csn.md")
    :BYTES 6922 :SHA256
    "0446a14fd871bf46b7eed0ad2840cb5cd4bf1143b5a76033c4c56943c990e8d4"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/docs/roadmap.md.txt" :SOURCE
    #A((76) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/roadmap.md")
    :BYTES 11961 :SHA256
    "0128b8d7b0ca86629fd4fabd149e1f10ee11b07d45e3164d0297b38b0415453f"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/src/recovery-active/build.lisp.txt" :SOURCE
    #A((91) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery-active/build.lisp")
    :BYTES 5049 :SHA256
    "ce2966aaaf7d7763f8bca772e5d0573bfc86cc72f195cc12656dae4232c60c75"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/src/recovery-active/csn.lisp.txt" :SOURCE
    #A((89) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery-active/csn.lisp")
    :BYTES 1508 :SHA256
    "aa57526effb5c1efd324920552fb4a6fa511f837652d847a8313f2cb916ab67d"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/src/recovery-active/frames.lisp.txt" :SOURCE
    #A((92) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery-active/frames.lisp")
    :BYTES 5833 :SHA256
    "ae8533a1da4419278e884094894fd8c75ddfafe9a2ca4515c711c009ea0eb54a"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/src/recovery-active/package.lisp.txt" :SOURCE
    #A((93) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery-active/package.lisp")
    :BYTES 1769 :SHA256
    "5b9e77a61db5cf386c43646d139589c02819f5dc149c234ee206397ea8b9b4e0"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/src/recovery-active/resolve.lisp.txt" :SOURCE
    #A((93) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery-active/resolve.lisp")
    :BYTES 4984 :SHA256
    "5a52d018d316ff332c51ddea9823014779a30a5f795b34f0318924d58db898d9"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/src/recovery-active/types.lisp.txt" :SOURCE
    #A((91) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery-active/types.lisp")
    :BYTES 2337 :SHA256
    "298ff9d60ee4508aa7ad2512c25f6d695992d308ad24537adf337792a55f7189"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/src/recovery-archive/package.lisp.txt" :SOURCE
    #A((94) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery-archive/package.lisp")
    :BYTES 1265 :SHA256
    "2b2894b84038836bfbc484d32552dbaa08c09a00f9b02da5f407badbd28ad9ce"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/src/recovery-archive/query.lisp.txt" :SOURCE
    #A((92) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery-archive/query.lisp")
    :BYTES 3112 :SHA256
    "c568f10d85e7251057a09cb6ff208d4104129dfbf036801773383a8571e9780b"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/src/recovery-closed/build.lisp.txt" :SOURCE
    #A((91) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery-closed/build.lisp")
    :BYTES 4863 :SHA256
    "54ec2bb122002c86bb6176885896b9384de76c6806681be7ea2c16d91af681b7"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/src/recovery-closed/csn-serie.lisp.txt" :SOURCE
    #A((95) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery-closed/csn-serie.lisp")
    :BYTES 1783 :SHA256
    "58134d52cd615a1a2b922a906ae72a600497f31f58ef18fb32756b71de00be09"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/src/recovery-closed/csn.lisp.txt" :SOURCE
    #A((89) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery-closed/csn.lisp")
    :BYTES 3503 :SHA256
    "ed4a413a662c1fcaed5aa7eeedc28633f8c612f089671c1d6f15dfa665ae70f0"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/src/recovery-closed/package.lisp.txt" :SOURCE
    #A((93) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery-closed/package.lisp")
    :BYTES 1666 :SHA256
    "1d42c67e4040976f1546a109a177ebfe9bf35414b31ab5781d5bcfae8b6057b1"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/src/recovery-closed/types.lisp.txt" :SOURCE
    #A((91) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery-closed/types.lisp")
    :BYTES 2846 :SHA256
    "88835b9cdb2f5d4e056379d29298a23702a9e9e79ab223b47c174c1ba93e0e86"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/src/recovery/decisions-package.lisp.txt" :SOURCE
    #A((96) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/decisions-package.lisp")
    :BYTES 842 :SHA256
    "9c7d9f68d02125e7d6aaa3b45ccf1031f6cea46bf887f470fee70798fb5adac3"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/src/recovery/decisions-query.lisp.txt" :SOURCE
    #A((94) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/decisions-query.lisp")
    :BYTES 5278 :SHA256
    "79139f7ff5a241107f7896a43ab67c2676c27e33065e0370e9e448b46f2bb0a0"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/src/recovery/inventory-id.lisp.txt" :SOURCE
    #A((91) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/inventory-id.lisp")
    :BYTES 2856 :SHA256
    "5f32aae756e92b0225f1304a04ff85bc174193521afea313a24cb111c902130e"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/src/recovery/manifest-package.lisp.txt" :SOURCE
    #A((95) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/recovery/manifest-package.lisp")
    :BYTES 1445 :SHA256
    "c5d3e8523c665f20059e85a6e74f909e86b786cd38701831f2086a99694b8bac"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/tests/recovery/inventory-id.lisp.txt" :SOURCE
    #A((93) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/recovery/inventory-id.lisp")
    :BYTES 11082 :SHA256
    "142a8777aab71d30050a0dc6c8cecee9de7e5c673b499d409db30cf2fcb8c297"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/tests/vertical/method.md.txt" :SOURCE
    #A((85) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/vertical/method.md")
    :BYTES 4638 :SHA256
    "126ea9ea8c25ff3e5cb823709223108895c2b7064a47571bdf45880ad535837c"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/tests/vertical/support.lisp.txt" :SOURCE
    #A((88) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/vertical/support.lisp")
    :BYTES 13940 :SHA256
    "c00e0991c435561dd4e1f6fde68bad25985de808db583227ef2c164fb3aca3d6"))
  (:STATUS :OK :ENTRY
   (:PATH "raw/verified/tools/foundation-mutation.lisp.txt" :SOURCE
    #A((91) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tools/foundation-mutation.lisp")
    :BYTES 42679 :SHA256
    "4549110148d74dd75e96b3019c3a5039c97082242141b3e2ab99467a954faf1e"))
  (:STATUS :OK :ENTRY
   (:PATH "README.md" :SOURCE
    #A((112) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-final-publication/README.txt")
    :BYTES 2804 :SHA256
    "6680276e2b76dd147c6ce638191d16d3fc378a13276453de070c456a33788b0a"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-manifest.lisp" :SOURCE
    #A((115) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-final-publication/manifest.lisp")
    :BYTES 9870 :SHA256
    "6037ec9ee5c7e5ff1535df0c7e517c6845ec3e4ed12695954b3b4dcc3af8b804"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-source.lisp" :SOURCE
    #A((95) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tools/collect-command-archive.lisp")
    :BYTES 31268 :SHA256
    "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")))
 :PROCESSES
 ((:LABEL "full-check" :RECORD-PATH "processes/full-check/report.lisp" :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "interrupted-before-integration" :RECORD-PATH
   "processes/interrupted-before-integration/report.lisp" :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :FAILED :EXIT-CODE 143 :SOURCE-CONSISTENCY :STABLE))
 :PLANNED-FILES 62 :SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-COLLECTION :STATUS
 :OK :PHASE :COMPLETE :DESTINATION
 #A((116) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-15-recovery-segment-id-verifica/")
 :OBSERVATIONS
 #A((101) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/recovery-id-final-collection/")
 :WORKERS 4 :SHA-PER-COPY 3 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :COMPLETED-COMMAND-RECORDS-ONLY
  :FRESH-DESTINATION-ONLY :NO-AUTO-SIDECARS-OR-TREES
  :LOCAL-PER-FILE-OBSERVATIONS :NO-ATOMICITY-OR-AUTHENTICATION
  :NO-RESULT-OR-GATE-INFERENCE :NO-MCDC-OR-RELEASE-QUALIFICATION))
