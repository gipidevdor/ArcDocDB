(:INDEPENDENT-CLOSURE
 (:EXIT-CODE 0 :SIGNAL NIL :LOG
  #A((123) BASE-CHAR
     . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-collection/closed-check.log")
  :RESULT
  (:SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-AUDIT :STATUS :OK :ARCHIVE
   "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/results/2026-10-16-io-apertura-relativa/"
   :INDEXED-FILES 61 :ACTUAL-FILES 63 :INDEXED-BYTES 2382779 :PROCESSES
   ((:LABEL "r1-outer" :RECORD-PATH "processes/r1-outer/report.lisp" :COMMAND
     ("env"
      "ASDF_OUTPUT_TRANSLATIONS=(:output-translations (#P\"/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/**/*.*\" #P\"/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-R1-fasl/**/*.*\") :ignore-inherited-configuration)"
      "make" "check")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "r1-inner" :RECORD-PATH "processes/r1-inner/report.lisp" :COMMAND
     ("/Applications/Xcode.app/Contents/Developer/usr/bin/make" "check-core")
     :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "trace-write" :RECORD-PATH "processes/trace-write/report.lisp"
     :COMMAND ("make" "trace-write") :STATUS :OK :EXIT-CODE 0
     :SOURCE-CONSISTENCY :STABLE)
    (:LABEL "integration-check" :RECORD-PATH
     "processes/integration-check/report.lisp" :COMMAND
     ("make" "lint" "trace" "links") :STATUS :OK :EXIT-CODE 0
     :SOURCE-CONSISTENCY :STABLE))
   :INDEX-SHA256
   "142dc0956a8bc0dee66801acd36a7ca88044d88e27471704b0c5da395ae4bd06"
   :CATALOGUE-SHA256
   "b613e530d1aa29d2c14d38de094a113f8cb9e69969d37a91960fce103d58b440"
   :ORIGINS-COMPARED NIL :CLOSED-INVENTORY T :READ-EVAL NIL :EOF-REQUIRED T
   :LIMITS
   (:PLAIN-BYTES 1048576 :GZIP-BYTES 8388608 :PROCESS-EXPANDED-BYTES 134217728
    :ENTRIES 100000 :DIRECTORY-DEPTH 128 :DIRECTORY-ENUMERATION-NOT-PREBOUNDED
    T :PER-FILE-LOCAL-OBSERVATION T :ATOMIC-PUBLICATION NIL
    :RESULT-OR-GATE-INFERENCE NIL :MCDC-CLAIM NIL)))
 :CLEANUP-ERRORS NIL :WORKER-ERRORS (NIL NIL NIL NIL) :WORKER-COPIED-COUNTS
 (1 20 20 20) :COPY-RESULTS
 ((:STATUS :OK :ENTRY
   (:PATH "README.md" :SOURCE
    #A((134) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-publication-inputs/README-final.md.txt")
    :BYTES 4829 :SHA256
    "8428509de7d26d7d1d4d88494248c204b8b6339720926554810d3d1e8653e886"))
  (:STATUS :OK :ENTRY
   (:PATH #A((23) BASE-CHAR . "capture-provenance.lisp") :SOURCE
    #A((138) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-publication-inputs/capture-provenance.lisp")
    :BYTES 8872 :SHA256
    "59275e819d80e6a0f9fe426d5df85fbb74270447ea3a44b20fcfe00d9b6fdb60"))
  (:STATUS :OK :ENTRY
   (:PATH "fixtures/reader/completion-exit/isolated-build.lisp" :SOURCE
    #A((147) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155135-reader-self-test-5158-0/completion-exit/isolated-build.lisp")
    :BYTES 197 :SHA256
    "1a45dcf8a6d03f1e8866e49280c6f0edb894320c90624d5620fad1e3d546cea9"))
  (:STATUS :OK :ENTRY
   (:PATH "fixtures/reader/completion-exit/stderr.log" :SOURCE
    #A((138) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155135-reader-self-test-5158-0/completion-exit/stderr.log")
    :BYTES 0 :SHA256
    "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"))
  (:STATUS :OK :ENTRY
   (:PATH "fixtures/reader/completion-exit/stdout.log" :SOURCE
    #A((138) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155135-reader-self-test-5158-0/completion-exit/stdout.log")
    :BYTES 105 :SHA256
    "5e630c1b44d68ce71b27d151e76bf367e3cbd941200adc36cdd30e0fe7390531"))
  (:STATUS :OK :ENTRY
   (:PATH "fixtures/reader/report.lisp" :SOURCE
    #A((123) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155135-reader-self-test-5158-0/report.lisp")
    :BYTES 1949 :SHA256
    "7741a5f14da82f65603150120c8ffa496cef06f6c24fa0ffa5e202268482afe8"))
  (:STATUS :OK :ENTRY
   (:PATH "fixtures/reader/signal/isolated-build.lisp" :SOURCE
    #A((138) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155135-reader-self-test-5158-0/signal/isolated-build.lisp")
    :BYTES 247 :SHA256
    "ff5cf55dda241d32ea1b4308172c7dc526436cbf1d546e7471148cee95a873d1"))
  (:STATUS :OK :ENTRY
   (:PATH "fixtures/reader/signal/stderr.log" :SOURCE
    #A((129) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155135-reader-self-test-5158-0/signal/stderr.log")
    :BYTES 0 :SHA256
    "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"))
  (:STATUS :OK :ENTRY
   (:PATH "fixtures/reader/signal/stdout.log" :SOURCE
    #A((129) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155135-reader-self-test-5158-0/signal/stdout.log")
    :BYTES 126 :SHA256
    "3697c68fa71f124c8d05d8cc5d649a744586a10989eb2e67c5bdce6bfc760142"))
  (:STATUS :OK :ENTRY
   (:PATH "fixtures/snapshot/completion-exit/isolated-build.lisp" :SOURCE
    #A((149) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155135-snapshot-self-test-5147-0/completion-exit/isolated-build.lisp")
    :BYTES 199 :SHA256
    "b8bb4416a818775bae5c77341eeec2c356a2733f633ac2bc8b6ac3ff955d05e0"))
  (:STATUS :OK :ENTRY
   (:PATH "fixtures/snapshot/completion-exit/stderr.log" :SOURCE
    #A((140) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155135-snapshot-self-test-5147-0/completion-exit/stderr.log")
    :BYTES 0 :SHA256
    "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"))
  (:STATUS :OK :ENTRY
   (:PATH "fixtures/snapshot/completion-exit/stdout.log" :SOURCE
    #A((140) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155135-snapshot-self-test-5147-0/completion-exit/stdout.log")
    :BYTES 107 :SHA256
    "4f22544421d9012fe132a36bf15950cd327ca959b8f9c5ef3d386e0c8b62a25c"))
  (:STATUS :OK :ENTRY
   (:PATH "fixtures/snapshot/report.lisp" :SOURCE
    #A((125) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155135-snapshot-self-test-5147-0/report.lisp")
    :BYTES 1967 :SHA256
    "398c06347a5c5db53eb7868c32d98e5c6ffe879b71cb768cda0b395b3aaba6c4"))
  (:STATUS :OK :ENTRY
   (:PATH "fixtures/snapshot/signal/isolated-build.lisp" :SOURCE
    #A((140) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155135-snapshot-self-test-5147-0/signal/isolated-build.lisp")
    :BYTES 249 :SHA256
    "a345276e3dfe377c0bbd359793165915b1527938a65250d367ce5ac079feecc1"))
  (:STATUS :OK :ENTRY
   (:PATH "fixtures/snapshot/signal/stderr.log" :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155135-snapshot-self-test-5147-0/signal/stderr.log")
    :BYTES 0 :SHA256
    "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"))
  (:STATUS :OK :ENTRY
   (:PATH "fixtures/snapshot/signal/stdout.log" :SOURCE
    #A((131) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155135-snapshot-self-test-5147-0/signal/stdout.log")
    :BYTES 128 :SHA256
    "e3502e714a0530acb1f0130c4ced4a016607bcb067e3686f6f29704db8423ea5"))
  (:STATUS :OK :ENTRY
   (:PATH "fixtures/spk/SPK-01.lisp" :SOURCE
    #A((113) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155543-check-16824-0/SPK-01.lisp")
    :BYTES 27228 :SHA256
    "349df5cab6f0040f5c222baa025f240508d354c1e9c7940435fdadddc0433149"))
  (:STATUS :OK :ENTRY
   (:PATH "fixtures/spk/SPK-02.lisp" :SOURCE
    #A((113) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155543-check-16824-0/SPK-02.lisp")
    :BYTES 1607 :SHA256
    "6d9ae6aa9f6e7e444a28bc2159cc25e292e23aea281b022be87db7c9ad6ba0d5"))
  (:STATUS :OK :ENTRY
   (:PATH "fixtures/spk/SPK-03.lisp" :SOURCE
    #A((113) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155543-check-16824-0/SPK-03.lisp")
    :BYTES 3648 :SHA256
    "2ab83906c5f508b2c29e748c874478dfa937e73769e9c6810406ef9a07ae925d"))
  (:STATUS :OK :ENTRY
   (:PATH "fixtures/spk/SPK-04.lisp" :SOURCE
    #A((113) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155543-check-16824-0/SPK-04.lisp")
    :BYTES 6752 :SHA256
    "94b10dbec045a867d62dc9b1feb0893e63a1ca5ea4725c7769b452e6682d61fd"))
  (:STATUS :OK :ENTRY
   (:PATH "fixtures/spk/SPK-05.lisp" :SOURCE
    #A((113) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155543-check-16824-0/SPK-05.lisp")
    :BYTES 10163 :SHA256
    "350947101b01208da39a30b9385030bb2feef5aff5e74d3a950bdc028fe06c4e"))
  (:STATUS :OK :ENTRY
   (:PATH "fixtures/spk/SPK-06.lisp" :SOURCE
    #A((113) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155543-check-16824-0/SPK-06.lisp")
    :BYTES 24094 :SHA256
    "7ccd187979c119a211c8ce994481e659bd98f6e0a1ed228e3370b52281bbbfe6"))
  (:STATUS :OK :ENTRY
   (:PATH "fixtures/spk/SPK-07.lisp" :SOURCE
    #A((113) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155543-check-16824-0/SPK-07.lisp")
    :BYTES 318 :SHA256
    "1df797dbb562d8053a73127cd99ea6f3986c097223f76da1d98d5425e55eb4c8"))
  (:STATUS :OK :ENTRY
   (:PATH "fixtures/spk/SPK-07.lisp.gz" :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155543-check-16824-0/SPK-07.lisp.gz")
    :BYTES 410643 :SHA256
    "c706241c6e9479a0882c44f9e5a4653ee663f84853340a38668bf94f5360982a"))
  (:STATUS :OK :ENTRY
   (:PATH "fixtures/spk/SPK-08.lisp" :SOURCE
    #A((113) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155543-check-16824-0/SPK-08.lisp")
    :BYTES 291712 :SHA256
    "c50eb8a70b096808093e3a7a2cf5da4100f5189308e8841144b5479395cb0254"))
  (:STATUS :OK :ENTRY
   (:PATH "fixtures/spk/SPK-09.lisp" :SOURCE
    #A((113) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155543-check-16824-0/SPK-09.lisp")
    :BYTES 2471 :SHA256
    "e048978ac33a53a4c201e8daa82a8a70572bb9a58aafcf713475af24d15849df"))
  (:STATUS :OK :ENTRY
   (:PATH "fixtures/spk/SPK-10.lisp" :SOURCE
    #A((113) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155543-check-16824-0/SPK-10.lisp")
    :BYTES 22977 :SHA256
    "3aad30137768c0efb0de8e7949403c5567982d0bae31669dff1ba1d4c979d88a"))
  (:STATUS :OK :ENTRY
   (:PATH "fixtures/spk/conservazione.lisp" :SOURCE
    #A((120) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155543-check-16824-0/conservazione.lisp")
    :BYTES 2311 :SHA256
    "b51b9062bca972320559b2743db773d63eae509ec5f98f5c2fedaf2da6fdc9c1"))
  (:STATUS :OK :ENTRY
   (:PATH "fixtures/spk/report.lisp" :SOURCE
    #A((113) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155543-check-16824-0/report.lisp")
    :BYTES 318 :SHA256
    "62b5ee6829184998132decd341cf6a0d304405969a10b6435f38be83d017eed4"))
  (:STATUS :OK :ENTRY
   (:PATH "fixtures/spk/report.lisp.gz" :SOURCE
    #A((116) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155543-check-16824-0/report.lisp.gz")
    :BYTES 466871 :SHA256
    "4ab8bc83f3c4a90d47cd046b34200e46c1495124633e16b43ff7913816416c2b"))
  (:STATUS :OK :ENTRY
   (:PATH "inputs/local-verification.lisp" :SOURCE
    #A((119) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-local-verification.lisp")
    :BYTES 5100 :SHA256
    "b7eabb680dcc1ffc2e06427ec0116996d647f32e525883707f79aaa80bb97bb6"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/integration-check/conservazione.lisp" :SOURCE
    #A((122) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155625-command-18130-0/conservazione.lisp")
    :BYTES 1158 :SHA256
    "038bb1769fc3bb338ae6a8e079b822308c47e1faf2ad70ade0d31a82b473bc50"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/integration-check/report.lisp" :SOURCE
    #A((115) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155625-command-18130-0/report.lisp")
    :BYTES 218345 :SHA256
    "cfa59c2a14db7c90bf02fa0e2ebe8e55c12f66d4fb4e5acb3bcc827e68864219"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/r1-inner/conservazione.lisp" :SOURCE
    #A((121) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155048-command-2425-0/conservazione.lisp")
    :BYTES 1739 :SHA256
    "04fe4ba45df5e396ed456b2bca33fd32dd0deb16d55cbcf952cead074ca97132"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/r1-inner/report.lisp" :SOURCE
    #A((114) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155048-command-2425-0/report.lisp")
    :BYTES 317 :SHA256
    "a9bb30e124d8844f25c44062ab37a8d895004ebcf736d0da1e438058de3bbe9d"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/r1-inner/report.lisp.gz" :SOURCE
    #A((117) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155048-command-2425-0/report.lisp.gz")
    :BYTES 212325 :SHA256
    "fb30b6c998936b0a932af4f4446b882688e9bc4bc538d0a0aca8d013de2a6b32"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/r1-outer/conservazione.lisp" :SOURCE
    #A((121) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155046-command-2301-0/conservazione.lisp")
    :BYTES 1156 :SHA256
    "31d64ca5254724883811d6a2d3ae1ce2d14ba9bde775109d10562b29d5e14c75"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/r1-outer/report.lisp" :SOURCE
    #A((114) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155046-command-2301-0/report.lisp")
    :BYTES 217245 :SHA256
    "880c994ac6813aee1ee82bfe818f301ebfcd5c28388a16f0005e318f29461cf9"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/trace-write/conservazione.lisp" :SOURCE
    #A((121) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155026-command-1434-0/conservazione.lisp")
    :BYTES 1156 :SHA256
    "7dc96743a677d636a226bd2ed33a093b8078574c68e81152c8130e8d530ae0ce"))
  (:STATUS :OK :ENTRY
   (:PATH "processes/trace-write/report.lisp" :SOURCE
    #A((114) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/4001155026-command-1434-0/report.lisp")
    :BYTES 217307 :SHA256
    "2eb21a34a589cd0fbea6eed7314438ac947fe4654b966765eb5a23e69fafec52"))
  (:STATUS :OK :ENTRY
   (:PATH "provenance/README-draft.md.txt" :SOURCE
    #A((134) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-publication-inputs/README-draft.md.txt")
    :BYTES 1661 :SHA256
    "2ba34777ac4df3fd8d2b5f904aa17a3e11ca0a6d8c05a7991dc0aab8292c8be5"))
  (:STATUS :OK :ENTRY
   (:PATH #A((26) BASE-CHAR . "source-S1/CHANGELOG.md.txt") :SOURCE
    #A((141) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-publication-inputs/source-S1/CHANGELOG.md.txt")
    :BYTES 29159 :SHA256
    "1f9b5bf3d6f7d9ac44fbadca0c6058625f572c7c42e2e20d5396996b2588bbd3"))
  (:STATUS :OK :ENTRY
   (:PATH #A((26) BASE-CHAR . "source-S1/arcdocdb.asd.txt") :SOURCE
    #A((141) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-publication-inputs/source-S1/arcdocdb.asd.txt")
    :BYTES 20473 :SHA256
    "abe75a04fed6890a242aa98564939d3ca5554ea005d7d67b9ae8316ccdad662c"))
  (:STATUS :OK :ENTRY
   (:PATH #A((44) BASE-CHAR . "source-S1/docs/implementazione/README.md.txt")
    :SOURCE
    #A((159) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-publication-inputs/source-S1/docs/implementazione/README.md.txt")
    :BYTES 14516 :SHA256
    "f9623aea3d7b7f89f0d47b42e94b26cc8b33bc79ea3467b4f096ad3e0bcd8d9c"))
  (:STATUS :OK :ENTRY
   (:PATH
    #A((65) BASE-CHAR
       . "source-S1/docs/implementazione/io-apertura-relativa-metodo.md.txt")
    :SOURCE
    #A((180) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-publication-inputs/source-S1/docs/implementazione/io-apertura-relativa-metodo.md.txt")
    :BYTES 5956 :SHA256
    "77f288ce15abe0f899c41c8ebff17e755afc490fbd9765f92d0062f774be2946"))
  (:STATUS :OK :ENTRY
   (:PATH
    #A((68) BASE-CHAR
       . "source-S1/docs/implementazione/io-apertura-relativa-revisione.md.txt")
    :SOURCE
    #A((183) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-publication-inputs/source-S1/docs/implementazione/io-apertura-relativa-revisione.md.txt")
    :BYTES 3431 :SHA256
    "8302b21bb42ced0e4d8b1343023c908f01add5b02917fe7bf2c579366aeda2f4"))
  (:STATUS :OK :ENTRY
   (:PATH
    #A((58) BASE-CHAR
       . "source-S1/docs/implementazione/io-apertura-relativa.md.txt")
    :SOURCE
    #A((173) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-publication-inputs/source-S1/docs/implementazione/io-apertura-relativa.md.txt")
    :BYTES 2219 :SHA256
    "e8a6ab6b47c967ea58aa56079520659fe335f5280437a99ba8f083aea92b1e87"))
  (:STATUS :OK :ENTRY
   (:PATH #A((40) BASE-CHAR . "source-S1/docs/implementazione/io.md.txt")
    :SOURCE
    #A((155) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-publication-inputs/source-S1/docs/implementazione/io.md.txt")
    :BYTES 9557 :SHA256
    "ef469da527d08cd53b08f346aa0fe45c24b2b8922ca24c08ce88c7aa2363889c"))
  (:STATUS :OK :ENTRY
   (:PATH
    #A((53) BASE-CHAR
       . "source-S1/docs/implementazione/prova-verticale.md.txt")
    :SOURCE
    #A((168) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-publication-inputs/source-S1/docs/implementazione/prova-verticale.md.txt")
    :BYTES 6456 :SHA256
    "41fea34ba1ecca1aa6a931c3b4e6d938c5909db0ef3fbc28367cbb9111abcd4c"))
  (:STATUS :OK :ENTRY
   (:PATH #A((29) BASE-CHAR . "source-S1/docs/roadmap.md.txt") :SOURCE
    #A((144) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-publication-inputs/source-S1/docs/roadmap.md.txt")
    :BYTES 12656 :SHA256
    "304a073d398b97bb6d964c475d66e785137369f1aa4e04076dd6107fd6a0889d"))
  (:STATUS :OK :ENTRY
   (:PATH #A((46) BASE-CHAR . "source-S1/src/io/native-open-relative.lisp.txt")
    :SOURCE
    #A((161) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-publication-inputs/source-S1/src/io/native-open-relative.lisp.txt")
    :BYTES 2172 :SHA256
    "3ec8ca51841d3d07ce1e69153dbf069eecaa9de484d9c976642fc03527c3af32"))
  (:STATUS :OK :ENTRY
   (:PATH #A((39) BASE-CHAR . "source-S1/src/io/open-relative.lisp.txt")
    :SOURCE
    #A((154) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-publication-inputs/source-S1/src/io/open-relative.lisp.txt")
    :BYTES 9882 :SHA256
    "f1d37c3ca3d5d186cc02ecbf6479216d9b7c2d731ca06707004469077d795ecd"))
  (:STATUS :OK :ENTRY
   (:PATH #A((33) BASE-CHAR . "source-S1/src/io/package.lisp.txt") :SOURCE
    #A((148) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-publication-inputs/source-S1/src/io/package.lisp.txt")
    :BYTES 866 :SHA256
    "758e9ea9d232d5d3f56d9b1e4aa9ea3d6044dbaa5b6af06c8f4506542ad83bca"))
  (:STATUS :OK :ENTRY
   (:PATH #A((31) BASE-CHAR . "source-S1/src/io/types.lisp.txt") :SOURCE
    #A((146) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-publication-inputs/source-S1/src/io/types.lisp.txt")
    :BYTES 5306 :SHA256
    "a934f29924bd798ebb0aeb3ba7e75c23abc188820c8e78b3a35a6ed8796423d5"))
  (:STATUS :OK :ENTRY
   (:PATH
    #A((48) BASE-CHAR . "source-S1/tests/io/open-relative-native.lisp.txt")
    :SOURCE
    #A((163) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-publication-inputs/source-S1/tests/io/open-relative-native.lisp.txt")
    :BYTES 8091 :SHA256
    "21661f2f7dddf1ecc4eebdc2cdf11f8980d76195378fc34d748f174e90286b98"))
  (:STATUS :OK :ENTRY
   (:PATH
    #A((49) BASE-CHAR . "source-S1/tests/io/open-relative-support.lisp.txt")
    :SOURCE
    #A((164) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-publication-inputs/source-S1/tests/io/open-relative-support.lisp.txt")
    :BYTES 7234 :SHA256
    "a112dbf5f2a0d8a23a4422344a69451a8de98c4fa06bb34bd11122a0d19be2a3"))
  (:STATUS :OK :ENTRY
   (:PATH #A((41) BASE-CHAR . "source-S1/tests/io/open-relative.lisp.txt")
    :SOURCE
    #A((156) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-publication-inputs/source-S1/tests/io/open-relative.lisp.txt")
    :BYTES 11672 :SHA256
    "3ca382232e6061c525cd9a6a9bae4d7a235ec70df93062a6a3786a34c9d475f9"))
  (:STATUS :OK :ENTRY
   (:PATH #A((38) BASE-CHAR . "source-S1/tests/vertical/method.md.txt") :SOURCE
    #A((153) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-publication-inputs/source-S1/tests/vertical/method.md.txt")
    :BYTES 5947 :SHA256
    "f49a85c8c25092952f2181951017d7607973c6c28dec8dff4429ba211f3e3ef3"))
  (:STATUS :OK :ENTRY
   (:PATH #A((41) BASE-CHAR . "source-S1/tests/vertical/support.lisp.txt")
    :SOURCE
    #A((156) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-publication-inputs/source-S1/tests/vertical/support.lisp.txt")
    :BYTES 14050 :SHA256
    "69c30e40912871c45ff98bf5ddb1ff680dd8b49937a1b4ea98bafd9d6aaae4b7"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-manifest.lisp" :SOURCE
    #A((134) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-publication-inputs/manifest-final.lisp")
    :BYTES 14271 :SHA256
    "365d3d480906a307753a9c785c84c63bff6e6adf71ab8ee4413453d7eb0758b4"))
  (:STATUS :OK :ENTRY
   (:PATH "collection-source.lisp" :SOURCE
    #A((100) BASE-CHAR
       . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/tools/collect-command-archive.lisp")
    :BYTES 31268 :SHA256
    "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")))
 :PROCESSES
 ((:LABEL "r1-outer" :RECORD-PATH "processes/r1-outer/report.lisp" :COMMAND
   (#A((3) BASE-CHAR . "env")
    #A((273) BASE-CHAR
       . "ASDF_OUTPUT_TRANSLATIONS=(:output-translations (#P\"/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/**/*.*\" #P\"/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-R1-fasl/**/*.*\") :ignore-inherited-configuration)")
    #A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "check"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "r1-inner" :RECORD-PATH "processes/r1-inner/report.lisp" :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "trace-write" :RECORD-PATH "processes/trace-write/report.lisp"
   :COMMAND (#A((4) BASE-CHAR . "make") #A((11) BASE-CHAR . "trace-write"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "integration-check" :RECORD-PATH
   "processes/integration-check/report.lisp" :COMMAND
   (#A((4) BASE-CHAR . "make") #A((4) BASE-CHAR . "lint")
    #A((5) BASE-CHAR . "trace") #A((5) BASE-CHAR . "links"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :PLANNED-FILES 61 :SCHEMA-VERSION 1 :KIND :COMMAND-ARCHIVE-COLLECTION :STATUS
 :OK :PHASE :COMPLETE :DESTINATION
 #A((113) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/results/2026-10-16-io-apertura-relativa/")
 :OBSERVATIONS
 #A((107) BASE-CHAR
    . "/Users/gpicchiarelli/.codex/worktrees/serie-capabilities/ArcDocDB/spikes/out/serie-capabilities-collection/")
 :WORKERS 4 :SHA-PER-COPY 3 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :COMPLETED-COMMAND-RECORDS-ONLY
  :FRESH-DESTINATION-ONLY :NO-AUTO-SIDECARS-OR-TREES
  :LOCAL-PER-FILE-OBSERVATIONS :NO-ATOMICITY-OR-AUTHENTICATION
  :NO-RESULT-OR-GATE-INFERENCE :NO-MCDC-OR-RELEASE-QUALIFICATION))
