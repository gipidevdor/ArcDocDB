(:SCHEMA-VERSION 1 :KIND :ORIGINAL-COMMAND-ARCHIVE :METADATA-POLICY
 :READ-WITHOUT-RESULT-INFERENCE :PROCESSES
 ((:LABEL "trace-write" :RECORD-PATH
   #A((33) BASE-CHAR . "processes/trace-write/report.lisp") :COMMAND
   (#A((4) BASE-CHAR . "make") #A((11) BASE-CHAR . "trace-write")) :STATUS :OK
   :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "r1-outer" :RECORD-PATH
   #A((30) BASE-CHAR . "processes/r1-outer/report.lisp") :COMMAND
   (#A((3) BASE-CHAR . "env")
    #A((193) BASE-CHAR
       . "ASDF_OUTPUT_TRANSLATIONS=(:output-translations (t \"/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-R1-fasl/\") :ignore-inherited-configuration)")
    #A((4) BASE-CHAR . "make") #A((5) BASE-CHAR . "check"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "r1-inner" :RECORD-PATH
   #A((30) BASE-CHAR . "processes/r1-inner/report.lisp") :COMMAND
   (#A((55) BASE-CHAR
       . "/Applications/Xcode.app/Contents/Developer/usr/bin/make")
    #A((10) BASE-CHAR . "check-core"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE)
  (:LABEL "r2-integration" :RECORD-PATH
   #A((36) BASE-CHAR . "processes/r2-integration/report.lisp") :COMMAND
   (#A((3) BASE-CHAR . "env")
    #A((193) BASE-CHAR
       . "ASDF_OUTPUT_TRANSLATIONS=(:output-translations (t \"/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-R2-fasl/\") :ignore-inherited-configuration)")
    #A((4) BASE-CHAR . "make") #A((4) BASE-CHAR . "test")
    #A((4) BASE-CHAR . "lint") #A((5) BASE-CHAR . "trace")
    #A((5) BASE-CHAR . "links"))
   :STATUS :OK :EXIT-CODE 0 :SOURCE-CONSISTENCY :STABLE))
 :FILES
 ((:PATH "README.md" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/README.md.txt")
   :BYTES 3607 :SHA256
   "e5d4363e7c541d45ed1f24ef6d7d682e2d5c4f7147b408c3224adc4cc2baa493")
  (:PATH "collection-manifest.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/manifest-R2.lisp")
   :BYTES 19360 :SHA256
   "f81159384dc674ff775f142fd6027e56de5596e819193bc5b3176254b78fbf66")
  (:PATH "collection-source.lisp" :SOURCE
   #A((103) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/tools/collect-command-archive.lisp")
   :BYTES 31268 :SHA256
   "4edf03e7257d5d4b19c37cb7c51cec772660f79d9f9268b2db4ad6cb66e55c1e")
  (:PATH "fixtures/reader/completion-exit/isolated-build.lisp" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237562-reader-self-test-93293-0/completion-exit/isolated-build.lisp")
   :BYTES 197 :SHA256
   "1a45dcf8a6d03f1e8866e49280c6f0edb894320c90624d5620fad1e3d546cea9")
  (:PATH "fixtures/reader/completion-exit/stderr.log" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237562-reader-self-test-93293-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "fixtures/reader/completion-exit/stdout.log" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237562-reader-self-test-93293-0/completion-exit/stdout.log")
   :BYTES 105 :SHA256
   "5e630c1b44d68ce71b27d151e76bf367e3cbd941200adc36cdd30e0fe7390531")
  (:PATH "fixtures/reader/report.lisp" :SOURCE
   #A((127) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237562-reader-self-test-93293-0/report.lisp")
   :BYTES 1973 :SHA256
   "43ab19c198656c33308db4b51d3a15c94f018a12c757ec48f96792923c39fc2d")
  (:PATH "fixtures/reader/signal/isolated-build.lisp" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237562-reader-self-test-93293-0/signal/isolated-build.lisp")
   :BYTES 247 :SHA256
   "ff5cf55dda241d32ea1b4308172c7dc526436cbf1d546e7471148cee95a873d1")
  (:PATH "fixtures/reader/signal/stderr.log" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237562-reader-self-test-93293-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "fixtures/reader/signal/stdout.log" :SOURCE
   #A((133) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237562-reader-self-test-93293-0/signal/stdout.log")
   :BYTES 126 :SHA256
   "3697c68fa71f124c8d05d8cc5d649a744586a10989eb2e67c5bdce6bfc760142")
  (:PATH "fixtures/snapshot/completion-exit/isolated-build.lisp" :SOURCE
   #A((153) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237562-snapshot-self-test-93280-0/completion-exit/isolated-build.lisp")
   :BYTES 199 :SHA256
   "b8bb4416a818775bae5c77341eeec2c356a2733f633ac2bc8b6ac3ff955d05e0")
  (:PATH "fixtures/snapshot/completion-exit/stderr.log" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237562-snapshot-self-test-93280-0/completion-exit/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "fixtures/snapshot/completion-exit/stdout.log" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237562-snapshot-self-test-93280-0/completion-exit/stdout.log")
   :BYTES 107 :SHA256
   "4f22544421d9012fe132a36bf15950cd327ca959b8f9c5ef3d386e0c8b62a25c")
  (:PATH "fixtures/snapshot/report.lisp" :SOURCE
   #A((129) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237562-snapshot-self-test-93280-0/report.lisp")
   :BYTES 1991 :SHA256
   "761a8d78481aefa67f38d505c626704ed5a047cee6d73d2796c70ff970e7f5dc")
  (:PATH "fixtures/snapshot/signal/isolated-build.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237562-snapshot-self-test-93280-0/signal/isolated-build.lisp")
   :BYTES 249 :SHA256
   "a345276e3dfe377c0bbd359793165915b1527938a65250d367ce5ac079feecc1")
  (:PATH "fixtures/snapshot/signal/stderr.log" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237562-snapshot-self-test-93280-0/signal/stderr.log")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "fixtures/snapshot/signal/stdout.log" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237562-snapshot-self-test-93280-0/signal/stdout.log")
   :BYTES 128 :SHA256
   "e3502e714a0530acb1f0130c4ced4a016607bcb067e3686f6f29704db8423ea5")
  (:PATH "fixtures/spk/SPK-01.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237957-check-4586-0/SPK-01.lisp")
   :BYTES 27228 :SHA256
   "205d5affcb168a3a4e55beac0dbfd2576013b96411c65aba92759d39172b3ee2")
  (:PATH "fixtures/spk/SPK-02.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237957-check-4586-0/SPK-02.lisp")
   :BYTES 1607 :SHA256
   "da2cbad11bb985d68f3d00baf8ae63bd7a706d071518d87905ee6c888e9367ec")
  (:PATH "fixtures/spk/SPK-03.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237957-check-4586-0/SPK-03.lisp")
   :BYTES 3654 :SHA256
   "572ec86efdcdf98ebc7992f89e1aa2f74281352e2822182ed7e25d0803115aee")
  (:PATH "fixtures/spk/SPK-04.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237957-check-4586-0/SPK-04.lisp")
   :BYTES 6752 :SHA256
   "85926819a87a2627221c80bb5330f3f0f0c8358e69f02e20a2225c3d862dfd0d")
  (:PATH "fixtures/spk/SPK-05.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237957-check-4586-0/SPK-05.lisp")
   :BYTES 10067 :SHA256
   "f9b9955626040137d65f2940b319455830a35884c5f2653071594bcf148bee1a")
  (:PATH "fixtures/spk/SPK-06.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237957-check-4586-0/SPK-06.lisp")
   :BYTES 24132 :SHA256
   "54712d2f52ad9e7406c299a877b900298fa85f5d45932a0783630ae15b96fb3d")
  (:PATH "fixtures/spk/SPK-07.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237957-check-4586-0/SPK-07.lisp")
   :BYTES 318 :SHA256
   "e9c1778cf9d47e6cde2c5d470a32d50ac255bc2d75907b2f735e623cd767a32a")
  (:PATH "fixtures/spk/SPK-07.lisp.gz" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237957-check-4586-0/SPK-07.lisp.gz")
   :BYTES 410633 :SHA256
   "1a767861265d527c5301e9cf81a8e78e48e1326912a6b9d172ae070b4d381396")
  (:PATH "fixtures/spk/SPK-08.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237957-check-4586-0/SPK-08.lisp")
   :BYTES 292333 :SHA256
   "d5f7780a19fff299f8cf2c14c509528e9dd013edc3aee27fd98bba87bdbccd3f")
  (:PATH "fixtures/spk/SPK-09.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237957-check-4586-0/SPK-09.lisp")
   :BYTES 2472 :SHA256
   "28f49c0bf45007c9d7d26a41bd9b549722e00cb85157e7f9d87ef28b7fc7491a")
  (:PATH "fixtures/spk/SPK-10.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237957-check-4586-0/SPK-10.lisp")
   :BYTES 22973 :SHA256
   "b8f4b45d2b9286044768764ef7171da481158d424707738c7e4887dc8b0ce126")
  (:PATH "fixtures/spk/SPK-11.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237957-check-4586-0/SPK-11.lisp")
   :BYTES 31121 :SHA256
   "848328730b223153103d532ac5b6cb500bfd026d59d20c66516d9a65914eba15")
  (:PATH "fixtures/spk/conservazione.lisp" :SOURCE
   #A((122) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237957-check-4586-0/conservazione.lisp")
   :BYTES 2321 :SHA256
   "9ad845d187900d72281d83a3b7e587ae031b931bde42b1855e3d8027c77be2fb")
  (:PATH "fixtures/spk/report.lisp" :SOURCE
   #A((115) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237957-check-4586-0/report.lisp")
   :BYTES 318 :SHA256
   "611ef32708757f7d641a928f2ee58da31c839aaa684133de9a3294db753ec3a9")
  (:PATH "fixtures/spk/report.lisp.gz" :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237957-check-4586-0/report.lisp.gz")
   :BYTES 471216 :SHA256
   "c3926eaf6c809c4edbf505d8e21e995c5e7ed39e5a1c232aa2b8063f0ec5fbd5")
  (:PATH "preparation/fixture-context.lisp" :SOURCE
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/fixture-context.lisp")
   :BYTES 4003 :SHA256
   "d140e03018e793c5d44ed149185d07a4695d62219e8975db5917f73bc53f7ade")
  (:PATH "preparation/fixture-inventory-R1.nul" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/fixture-inventory-R1.nul")
   :BYTES 1720 :SHA256
   "e369866d8a687b6923cc401b2008b31b8b731b11ab5a5d78e3f7973181e23ecf")
  (:PATH "preparation/manifest-builder-R2.lisp.txt" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/manifest-builder-R2.lisp.txt")
   :BYTES 2955 :SHA256
   "40194821c5c3f8f72efa50f71aa892a8939564baead05f83f273ee18411df1c4")
  (:PATH "preparation/manifest-builder.lisp.txt" :SOURCE
   #A((136) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/manifest-builder.lisp.txt")
   :BYTES 2775 :SHA256
   "339fe71c1f07fd7c7a4d7c5b34de3516c707592ebd49ffd9348ae586fb6ae695")
  (:PATH "preparation/manifest-builder.stderr.txt" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/manifest-builder.stderr.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "preparation/manifest-builder.stdout.txt" :SOURCE
   #A((138) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/manifest-builder.stdout.txt")
   :BYTES 40 :SHA256
   "80d85ca26163384e1723b72b12af9acc8d67b6076eb599006ba8395098cbc527")
  (:PATH "preparation/manifest.lisp" :SOURCE
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/manifest.lisp")
   :BYTES 18446 :SHA256
   "9ec6a7ef6ce1634ab1daf4d60441bfc1b3fbbf4b201fa9b96578ee7cebd10790")
  (:PATH "preparation/prepare-fixture-rows.lisp.txt" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/prepare-fixture-rows.lisp.txt")
   :BYTES 5573 :SHA256
   "216b05c4de6d6e50fd205c1b556c23baccbb5bcd53c463e221117da400fa8ef1")
  (:PATH "preparation/prepare-fixture-rows.stderr.txt" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/prepare-fixture-rows.stderr.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "preparation/prepare-fixture-rows.stdout.txt" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/prepare-fixture-rows.stdout.txt")
   :BYTES 68 :SHA256
   "adedf5e69d6e4ecc2c9e82ae64fc166f76d12a851bf07a9f797f2c4859051cfd")
  (:PATH "preparation/prepare-source-S1-R2.lisp.txt" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/prepare-source-S1-R2.lisp.txt")
   :BYTES 6619 :SHA256
   "ea84d356bc45c5182aedb792f7b4226647c013b38cfb49ed00f84b58b20e03ed")
  (:PATH "preparation/prepare-source-S1-R2.stderr.txt" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/prepare-source-S1-R2.stderr.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH "preparation/prepare-source-S1-R2.stdout.txt" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/prepare-source-S1-R2.stdout.txt")
   :BYTES 181 :SHA256
   "4bd0ce22d46b3941585a51b2c6bd1c4ed292dca67bc2cc0985713e8e37ea5bd7")
  (:PATH "preparation/prepare-source-S1.lisp.txt" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/prepare-source-S1.lisp.txt")
   :BYTES 6164 :SHA256
   "23fbf29a9829e80cafc76e46b5a22f9079fa366eb9862e57371cfe562d9058bf")
  (:PATH "preparation/prepare-source-S1.stderr.txt" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/prepare-source-S1.stderr.txt")
   :BYTES 5112 :SHA256
   "9f73b961d35c22a3df845487f7060deb5e72b84166449909bd42abda17a3acbc")
  (:PATH "preparation/prepare-source-S1.stdout.txt" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/prepare-source-S1.stdout.txt")
   :BYTES 0 :SHA256
   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
  (:PATH #A((37) BASE-CHAR . "processes/r1-inner/conservazione.lisp") :SOURCE
   #A((125) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237419-command-89011-0/conservazione.lisp")
   :BYTES 1755 :SHA256
   "f9e3380a29b9851672cbe66b11f9492e111855f733f17d46f7f4b7aa7af67027")
  (:PATH #A((30) BASE-CHAR . "processes/r1-inner/report.lisp") :SOURCE
   #A((118) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237419-command-89011-0/report.lisp")
   :BYTES 317 :SHA256
   "5f2764faaf9098cfa7dd05c5bbbf2d5ebd41112cc898e16ab44849a889c6be57")
  (:PATH #A((33) BASE-CHAR . "processes/r1-inner/report.lisp.gz") :SOURCE
   #A((121) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/4001237419-command-89011-0/report.lisp.gz")
   :BYTES 259611 :SHA256
   "92ac0538b395095d70061aa5fecc638e2688cd3da98751e27d1aee8cdc7654e9")
  (:PATH #A((37) BASE-CHAR . "processes/r1-outer/conservazione.lisp") :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-R1/conservazione.lisp")
   :BYTES 1158 :SHA256
   "a9d5f60ee7510ebcc8b7b6c10fa1ff46bcf3e87ae1f192f29f815d36d0629a6a")
  (:PATH #A((30) BASE-CHAR . "processes/r1-outer/report.lisp") :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-R1/report.lisp")
   :BYTES 265050 :SHA256
   "077ff2340ac507cfdf3c718cfef3d3cc891ded6b5ac5efc2faee3f26e2ae7263")
  (:PATH #A((43) BASE-CHAR . "processes/r2-integration/conservazione.lisp")
   :SOURCE
   #A((120) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-R2/conservazione.lisp")
   :BYTES 1740 :SHA256
   "dca9502cdae6d553c3813f219a855fefd6fa3b1a60ffcb6a8b82161bf6bdfdcc")
  (:PATH #A((36) BASE-CHAR . "processes/r2-integration/report.lisp") :SOURCE
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-R2/report.lisp")
   :BYTES 317 :SHA256
   "7f3e0f26467af63ae205ece62feebd739694e57720255f123914ca3a427a9f58")
  (:PATH #A((39) BASE-CHAR . "processes/r2-integration/report.lisp.gz") :SOURCE
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-R2/report.lisp.gz")
   :BYTES 249196 :SHA256
   "2063defea19757db78dd8bb915fdd8d43a1dc66fb0aa156a883cb327c50f9bac")
  (:PATH #A((40) BASE-CHAR . "processes/trace-write/conservazione.lisp")
   :SOURCE
   #A((126) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-trace-R0/conservazione.lisp")
   :BYTES 1170 :SHA256
   "5628c33c6950965862b259689c73e32b65500b1804310470a894a1fdcfe26a62")
  (:PATH #A((33) BASE-CHAR . "processes/trace-write/report.lisp") :SOURCE
   #A((119) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-trace-R0/report.lisp")
   :BYTES 265268 :SHA256
   "8b51e2ba1c606e669f4da5c95ef15b5576159bdd6050a761af187e926206d7e7")
  (:PATH "selection/fixture-rows.lisp" :SOURCE
   #A((135) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/fixture-source-rows.lisp")
   :BYTES 6186 :SHA256
   "90efd4599451290cef39b795023b684d7ad5015eab2ab489598f13d80fcf8a27")
  (:PATH "selection/preparation-rows.lisp" :SOURCE
   #A((139) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/preparation-source-rows.lisp")
   :BYTES 1409 :SHA256
   "164e551c32bc0acfcc0f26c838b0da8fdbfab46bce4f1bbcbb8fedaf49506f0f")
  (:PATH "selection/source-rows.lisp" :SOURCE
   #A((147) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/collector-source-rows.lisp")
   :BYTES 5530 :SHA256
   "6771de4acad9162328b3891c9e9061206ee03b5aeb4fc72a40e08a84ff30a451")
  (:PATH "sources/S1/CHANGELOG.md.txt" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/CHANGELOG.md.txt")
   :BYTES 36136 :SHA256
   "774b9dc20f5e335307c114f1a687d8aace9fa0a3fa4418f54dc28b7a5509d326")
  (:PATH "sources/S1/arcdocdb.asd.txt" :SOURCE
   #A((137) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/arcdocdb.asd.txt")
   :BYTES 23792 :SHA256
   "8befb245892d1903979e547cd0c1eb27050ff3c4ba59cbdbfc57cc1ea3817980")
  (:PATH "sources/S1/capture-provenance.lisp" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/capture-provenance.lisp")
   :BYTES 23463 :SHA256
   "d72846d5f4eb865f63b1afd50293055b9d992978255d55461348db55296d809b")
  (:PATH "sources/S1/docs/implementazione/README.md.txt" :SOURCE
   #A((155) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/docs/implementazione/README.md.txt")
   :BYTES 18609 :SHA256
   "c0ca9e1cb694a27345be768575790982d3f892664411e9b6144eaaf829ddfc28")
  (:PATH "sources/S1/docs/implementazione/io-creazione-relativa-metodo.md.txt"
   :SOURCE
   #A((177) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/docs/implementazione/io-creazione-relativa-metodo.md.txt")
   :BYTES 6209 :SHA256
   "d94511192a422d4fc506d89bcd2cd76974d79d7c2a771282fdce0e4a76837f8d")
  (:PATH
   "sources/S1/docs/implementazione/io-creazione-relativa-revisione.md.txt"
   :SOURCE
   #A((180) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/docs/implementazione/io-creazione-relativa-revisione.md.txt")
   :BYTES 4213 :SHA256
   "8780ea5690eba71858ee9d116cd616bec8d92c15e202be5496280bdfc38e6c40")
  (:PATH "sources/S1/docs/implementazione/io-creazione-relativa.md.txt" :SOURCE
   #A((170) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/docs/implementazione/io-creazione-relativa.md.txt")
   :BYTES 2571 :SHA256
   "1af4522ec6d1bcff095f39de7df4a783d9bec231cb230089b500bc3855676f4a")
  (:PATH "sources/S1/docs/implementazione/io.md.txt" :SOURCE
   #A((151) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/docs/implementazione/io.md.txt")
   :BYTES 9849 :SHA256
   "19d7ecb74f35699a948756845727d2de151563868caf99de996da8812d1ad696")
  (:PATH "sources/S1/docs/implementazione/prova-verticale.md.txt" :SOURCE
   #A((164) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/docs/implementazione/prova-verticale.md.txt")
   :BYTES 7499 :SHA256
   "00f6e671fc7adf5eaa1b0cbe94304808965fc74facc70851707c9674c016639b")
  (:PATH "sources/S1/docs/roadmap.md.txt" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/docs/roadmap.md.txt")
   :BYTES 15171 :SHA256
   "a496373e57b7aed3223f80672dba120c6583bf66e110702c6bdbae57e991c9b7")
  (:PATH "sources/S1/prepare-source-S1.lisp.txt" :SOURCE
   #A((140) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/prepare-source-S1-R2.lisp.txt")
   :BYTES 6619 :SHA256
   "ea84d356bc45c5182aedb792f7b4226647c013b38cfb49ed00f84b58b20e03ed")
  (:PATH "sources/S1/src/io/create-relative.lisp.txt" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/src/io/create-relative.lisp.txt")
   :BYTES 5960 :SHA256
   "444a479156881ad66fd2a63460f42116f25f9f5a749442ce911d6bca2540c86f")
  (:PATH "sources/S1/src/io/native-create-relative.lisp.txt" :SOURCE
   #A((159) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/src/io/native-create-relative.lisp.txt")
   :BYTES 2180 :SHA256
   "56b824eb7c4ad9ee1a3e3b8bf3690e117d28d1fa4cb2e8e3a282ba252f14b121")
  (:PATH "sources/S1/src/io/native-open-relative.lisp.txt" :SOURCE
   #A((157) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/src/io/native-open-relative.lisp.txt")
   :BYTES 2178 :SHA256
   "5d3b7f128061a7b5fbae7ff611c1fe4b1e6e7e83e4909789dc1cbb5efeae0242")
  (:PATH "sources/S1/src/io/open-relative.lisp.txt" :SOURCE
   #A((150) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/src/io/open-relative.lisp.txt")
   :BYTES 10396 :SHA256
   "78faa5443804b61daca3bb58433064ce680a4ef50066541869c3affe2f01922c")
  (:PATH "sources/S1/src/io/package.lisp.txt" :SOURCE
   #A((144) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/src/io/package.lisp.txt")
   :BYTES 911 :SHA256
   "3654b5eb7f060615debfc9b36aa5bc43d8be3e049cfafec879efca41c21faab5")
  (:PATH "sources/S1/src/io/types.lisp.txt" :SOURCE
   #A((142) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/src/io/types.lisp.txt")
   :BYTES 5699 :SHA256
   "aab5bc1d17bbb848785222385686bc21443fc824cfae1569355e67fba646d70d")
  (:PATH "sources/S1/tests/io/create-relative-native.lisp.txt" :SOURCE
   #A((161) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/tests/io/create-relative-native.lisp.txt")
   :BYTES 9736 :SHA256
   "93c711a1b7ec5e8a23c1c1d713867c153aab043d144de7644c856711634a9a95")
  (:PATH "sources/S1/tests/io/create-relative-support.lisp.txt" :SOURCE
   #A((162) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/tests/io/create-relative-support.lisp.txt")
   :BYTES 6334 :SHA256
   "76df4adf981328f463d040d9d9037ad1ebe427276014333b5ed64cc55b1e8ae7")
  (:PATH "sources/S1/tests/io/create-relative.lisp.txt" :SOURCE
   #A((154) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/tests/io/create-relative.lisp.txt")
   :BYTES 12385 :SHA256
   "0bb3b18fdc5baa871a7be684b0681d3a6d1de4969dcb76fb8a7b1e2539479d1d")
  (:PATH "sources/S1/tests/vertical/method.md.txt" :SOURCE
   #A((149) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/tests/vertical/method.md.txt")
   :BYTES 8438 :SHA256
   "2b5019f648be9871478b8334013411b355be16510d9db751d36a3cb71495a376")
  (:PATH "sources/S1/tests/vertical/support.lisp.txt" :SOURCE
   #A((152) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/serie-create-relative/ArcDocDB/spikes/out/creazione-relativa-publication/source-S1/tests/vertical/support.lisp.txt")
   :BYTES 15199 :SHA256
   "06c74c302c0dc8a9ec4ca6ac33f5a667446a278675869b5bf6c3dfbd4ed7790a"))
 :LIMITS
 (:EXPLICIT-FILE-MANIFEST :SHA256-BYTE-COPY-CHECK :RAW-ORIGINALS-PRESERVED
  :NO-RESULT-OR-GATE-INFERENCE :NO-REQUIREMENT-OR-RELEASE-PROMOTION))
