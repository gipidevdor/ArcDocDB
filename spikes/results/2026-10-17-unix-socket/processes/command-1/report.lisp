(:DIAGNOSTIC
 #A((212) BASE-CHAR . "SPK-11 fallito (exit 1):
(:STATUS :ERROR :SPIKE :SPK-11 :DIAGNOSTIC
 \"SPK-11 compilazione: redefining ARCDOCDB.CSN::%WITH-CSN-GUARD in DEFMACRO\")

; 
; compilation unit aborted
;   caught 1 fatal ERROR condition
")
 :SCHEMA-VERSION 1 :ENVIRONMENT
 (:LISP #A((4) BASE-CHAR . "SBCL") :VERSION #A((5) BASE-CHAR . "2.6.9") :OS
  #A((6) BASE-CHAR . "Darwin") :OS-VERSION #A((6) BASE-CHAR . "27.0.0")
  :MACHINE #A((5) BASE-CHAR . "ARM64") :CPU "Apple M4" :MEMORY-BYTES
  17179869184 :LOGICAL-CPUS 10 :EXTERNAL-LOAD-STATUS :UNCONTROLLED
  :LOAD-AVERAGE "{ 4.85 4.52 4.55 }" :COMMIT
  "c9e97fd0b124f0dfce5d42e21d9d1f15407b6a2a" :WORKING-TREE "M docs/adr/README.md
 M docs/implementazione/README.md
 M docs/valutazione/piano-spike.md
 M spikes/README.md
 M tools/run-spikes.lisp
?? docs/adr/0056-sessione-locale-m16.md
?? docs/implementazione/sessione-locale.md
?? spikes/SPK-11-unix-socket/"
  :SOURCE-BLOBS
  ((:PATH "spikes/SPK-01-primary-index/profile.lisp" :GIT-BLOB
    "a71fde100e32072b6e7b010228683b640ea4ff9a")
   (:PATH "tools/finish-evidence.lisp" :GIT-BLOB
    "c8ebe7bbe4c99a3c712033d0f58e97610914f87f")
   (:PATH "tools/compact-evidence.lisp" :GIT-BLOB
    "72a1c32b1efcb7fd89ff798a669a558ceffb0aa0")
   (:PATH "tools/evidence-storage.lisp" :GIT-BLOB
    "fa2b5d36dca0837e2ed5e49b282887b2e110b2b7")
   (:PATH "spikes/SPK-01-primary-index/run.lisp" :GIT-BLOB
    "b6e680b0c2d1a96c1d7fc3b0e133c80b6564a01e")
   (:PATH #A((37) BASE-CHAR . "spikes/SPK-01-primary-index/core.lisp")
    :GIT-BLOB "c019f6ad53e173a0d336a4dbfaf903e274a66f08")
   (:PATH "spikes/SPK-01-primary-index/lettura-buffer.lisp" :GIT-BLOB
    "34b3574a554ca4e03a34f04b3fc66022abb7893b")
   (:PATH "spikes/SPK-01-primary-index/check-lettura-buffer.lisp" :GIT-BLOB
    "fd32c5260ffb7c6e96cf1a420765eb01effe70bc")
   (:PATH "spikes/SPK-02-gc/run.lisp" :GIT-BLOB
    "9fbe499100da40c2f7a14072af67c35c734949c5")
   (:PATH #A((26) BASE-CHAR . "spikes/SPK-02-gc/core.lisp") :GIT-BLOB
    "01f6760c75fa6e96a480fca41b1426941a9f703d")
   (:PATH "spikes/SPK-03-group-commit/run.lisp" :GIT-BLOB
    "c0b093e87028dd587c43d3cd52e59492270fdc38")
   (:PATH #A((36) BASE-CHAR . "spikes/SPK-03-group-commit/core.lisp") :GIT-BLOB
    "d3c58f2866e299ba27b0fa820c20317438774410")
   (:PATH "spikes/SPK-04-writer-pool/run.lisp" :GIT-BLOB
    "77056cc1f695574ed0f4d34795b99aaea736f378")
   (:PATH #A((35) BASE-CHAR . "spikes/SPK-04-writer-pool/core.lisp") :GIT-BLOB
    "557b32e6378290c46c7d9b128fc8e59a0e7e0a44")
   (:PATH "spikes/SPK-04-writer-pool/pool.lisp" :GIT-BLOB
    "cbec51aad2b64fb8c5be026891eff859ba371c18")
   (:PATH "spikes/SPK-04-writer-pool/parcheggi.lisp" :GIT-BLOB
    "c0fee7b738395fcaf3359f297282cd266ce6dfad")
   (:PATH "spikes/SPK-05-segment-read/run.lisp" :GIT-BLOB
    "c67a3ae8e672f96d9105deb935fb621b07d67afb")
   (:PATH #A((36) BASE-CHAR . "spikes/SPK-05-segment-read/core.lisp") :GIT-BLOB
    "15fad418184ce9969c337b181317b855ede9f5ce")
   (:PATH "spikes/SPK-06-compaction-load/run.lisp" :GIT-BLOB
    "b2863cbac49d0988b850bdeeae1713108a21bfca")
   (:PATH #A((39) BASE-CHAR . "spikes/SPK-06-compaction-load/core.lisp")
    :GIT-BLOB "375cb97e1490e0252c04fd1a3076a17342cefd68")
   (:PATH "spikes/SPK-06-compaction-load/controllore.lisp" :GIT-BLOB
    "4602972e2400d31d4d3b771f60703c68e23f0804")
   (:PATH "spikes/SPK-06-compaction-load/interferenza.lisp" :GIT-BLOB
    "9ad30ce92bdb643aeb5163e96508bf677996a4ef")
   (:PATH "spikes/SPK-05-segment-read/io.lisp" :GIT-BLOB
    "ba470bce3cae0ce14888dbec6e26c5656e9bbd1a")
   (:PATH "spikes/SPK-05-segment-read/record.lisp" :GIT-BLOB
    "baea7833c8e6f9a49b5ea2f8ee15f76fe35f93fe")
   (:PATH "spikes/SPK-07-protocols/run.lisp" :GIT-BLOB
    "648bd776767e4be914a2470069afced14bc1c1e5")
   (:PATH #A((33) BASE-CHAR . "spikes/SPK-07-protocols/core.lisp") :GIT-BLOB
    "489e2732cf5bfed4cd11251bb686a5d4f4e10b3e")
   (:PATH "spikes/SPK-07-protocols/pubblicazione.lisp" :GIT-BLOB
    "d317849b3f95394a7f604b82fb131495b5b3770c")
   (:PATH "spikes/SPK-07-protocols/scadenza.lisp" :GIT-BLOB
    "05a5e93591e2d6e96c2c7548e90888424cbb1f9f")
   (:PATH "spikes/SPK-07-protocols/compaction.lisp" :GIT-BLOB
    "93483f72f3bfe43f0e2afa93b022892114a824e1")
   (:PATH "spikes/SPK-07-protocols/memoria.lisp" :GIT-BLOB
    "96b6cf64d481643cdba7857f339a7cb7c029b765")
   (:PATH "spikes/SPK-07-protocols/suite.lisp" :GIT-BLOB
    "a813fbeb55cd03980b2215c99fc3170d6afa4d92")
   (:PATH "spikes/SPK-07-protocols/seqlock-readers.lisp" :GIT-BLOB
    "b2e704bbe7e699b9df68173319f64d2ae8abc5fc")
   (:PATH "spikes/SPK-07-protocols/byte-crash.lisp" :GIT-BLOB
    "66a6c3b458d808fc214f7c3bd96e09d239312c67")
   (:PATH "spikes/SPK-08-generated-code/run.lisp" :GIT-BLOB
    "a1fdf6705a10fcca3926f40e26051fe7b6df5bf0")
   (:PATH "spikes/SPK-08-generated-code/impronte.lisp" :GIT-BLOB
    "d187e3d95f0e85a0a8ae84843a67a326e803cd2c")
   (:PATH "spikes/SPK-08-generated-code/simd.lisp" :GIT-BLOB
    "dbd551322880f1e0ddac6436c8af8f0dd85ddb9f")
   (:PATH "spikes/SPK-08-generated-code/bitmap.lisp" :GIT-BLOB
    "cbeff7e2a58f268291b01cb6a1f124533063d5d6")
   (:PATH "spikes/SPK-08-generated-code/core-bitmap.lisp" :GIT-BLOB
    "a4be2005a702a77a631f35568778673c503c60b5")
   (:PATH "spikes/SPK-09-integrity/run.lisp" :GIT-BLOB
    "c95660a4df5f2e6f6eb93e1078c2c36df6dabc85")
   (:PATH "spikes/SPK-10-v2-limits/run.lisp" :GIT-BLOB
    "6aa63afeac91c3b75174b76daba61e354bb7fe4d")
   (:PATH #A((33) BASE-CHAR . "spikes/SPK-10-v2-limits/core.lisp") :GIT-BLOB
    "c5b7cfd27c663734b7d5fae481dde939418566b5")
   (:PATH "spikes/SPK-10-v2-limits/codec.lisp" :GIT-BLOB
    "567c84546d29e1b8ddc5cd9e1a31b4e93519c75d")
   (:PATH "spikes/SPK-10-v2-limits/indice.lisp" :GIT-BLOB
    "bc978eb16aa7f0d69e3deac2df86057a650f8551")
   (:PATH "spikes/SPK-10-v2-limits/cbor.lisp" :GIT-BLOB
    "d6a5c93e34a0444d64b206df875a25b380545631")
   (:PATH "spikes/SPK-10-v2-limits/migrazione.lisp" :GIT-BLOB
    "cab850dc32ff9908b487b24edf3e1df2cc90008c")
   (:PATH "spikes/SPK-09-integrity/core.lisp" :GIT-BLOB
    "80cdac4c0e52703618e1f274413b2ecbe00e6b14")
   (:PATH "tools/run-spikes.lisp" :GIT-BLOB
    "9c1be97f432b93dab76f26115c2f36adf7e62be1")
   (:PATH "spikes/SPK-11-unix-socket/run.lisp" :GIT-BLOB
    "e78e7670d9904e2edd39b3f75e2150a9bd297567")
   (:PATH #A((35) BASE-CHAR . "spikes/SPK-11-unix-socket/core.lisp") :GIT-BLOB
    "4fb04f5816fdb0db321e6bfc63f5c357eda17a3b")
   (:PATH "spikes/SPK-11-unix-socket/transport.lisp" :GIT-BLOB
    "fdc11f225dcadc0d86065c9082065544c1891b2e")
   (:PATH "spikes/SPK-11-unix-socket/scenarios.lisp" :GIT-BLOB
    "6e7dfef0ce47cc102dce6e2d51f4121da72a6ab7")
   (:PATH "arcdocdb.asd" :GIT-BLOB "6d988741a426434acc3f9eae5281bf915f23d7e0")
   (:PATH "src/active/package.lisp" :GIT-BLOB
    "fbd3a32b30808508424c007ece26c9f3ea9ad0a9")
   (:PATH "src/active/preflight.lisp" :GIT-BLOB
    "827f0b580b404ad6c41184a7c9802ce50a8d413c")
   (:PATH "src/active/prepare.lisp" :GIT-BLOB
    "b2a326e3a17de2e1c9d0785d4a86b2137e41fce2")
   (:PATH "src/active/source.lisp" :GIT-BLOB
    "56f258d204b2c1af544f38d15fc1e357977b336f")
   (:PATH "src/active/types.lisp" :GIT-BLOB
    "91238be2c204434cb3583fd96743ebc98e46b503")
   (:PATH "src/cache/build.lisp" :GIT-BLOB
    "45255a912edb4300b1f22c9505d09be5177d1d4b")
   (:PATH "src/cache/clock.lisp" :GIT-BLOB
    "5aca4d48de7bf0d849eafe87ae89f6e7800282d8")
   (:PATH "src/cache/core.lisp" :GIT-BLOB
    "9ab280c17b61b8f98f8299cbfae676942bb3ae47")
   (:PATH "src/cache/package.lisp" :GIT-BLOB
    "c86ef56ec05e92ebc0fa155423289775970eedd2")
   (:PATH "src/cache/read.lisp" :GIT-BLOB
    "5f4f08a4609bd264fa058ec25ba8f6a516c162c8")
   (:PATH "src/cache/types.lisp" :GIT-BLOB
    "b335ea1d241672a3989da65b9a7ec516e7533347")
   (:PATH "src/cache/write.lisp" :GIT-BLOB
    "bcd7de80241f809dcfce472741f120a61ac787b4")
   (:PATH "src/codec/cbor-array-input.lisp" :GIT-BLOB
    "d3b3d07fc18bd2a077c1a2d79020a76263b2779e")
   (:PATH "src/codec/cbor-array-write.lisp" :GIT-BLOB
    "a410297c29c5d043ad60d3804bd3711e22c2833b")
   (:PATH "src/codec/cbor-float-minimal.lisp" :GIT-BLOB
    "ca6215b30010d3d2eb90eaa6fd09dd5a9ac7778f")
   (:PATH "src/codec/cbor-float-narrow.lisp" :GIT-BLOB
    "cd5749edc0a757ee3a5b470eda566a6685d32fd8")
   (:PATH "src/codec/cbor-float-write.lisp" :GIT-BLOB
    "03c6aed61e2c243d8b1a6c4332ce1837c4e9a77c")
   (:PATH "src/codec/cbor-header.lisp" :GIT-BLOB
    "db635a50678f2712ec9516be335717ea254d4d09")
   (:PATH "src/codec/cbor-item-read.lisp" :GIT-BLOB
    "b9099dc8a8c96281063811e686deb4dcb2b1d39b")
   (:PATH "src/codec/cbor-map-input.lisp" :GIT-BLOB
    "d7a593badeb6e6b71f28dc4e80c641b07189d0b8")
   (:PATH "src/codec/cbor-map-write.lisp" :GIT-BLOB
    "22e814ea68e606c5bc58033c2a31e945303a9d65")
   (:PATH "src/codec/cbor-minimal.lisp" :GIT-BLOB
    "761302dad1073c841397f6c88d595b114af8d9ef")
   (:PATH "src/codec/cbor-package.lisp" :GIT-BLOB
    "3e31d60234585442baa5664be96a83915e034397")
   (:PATH "src/codec/cbor-scan-input.lisp" :GIT-BLOB
    "57ffc48cc688a4de8ebec5cb14c1e69c4209704a")
   (:PATH "src/codec/cbor-scan-items.lisp" :GIT-BLOB
    "70272936e323b3e0cb05173c9fb68cb2b614c355")
   (:PATH "src/codec/cbor-scan-minimal.lisp" :GIT-BLOB
    "f1afe79c7a4d49abd6a6e5f6975dec830ef7b1f6")
   (:PATH "src/codec/cbor-scan-stack.lisp" :GIT-BLOB
    "c574e87af5e195ddf3f596a4ae527e69c7a3c6a6")
   (:PATH "src/codec/cbor-scan.lisp" :GIT-BLOB
    "e3d7d77407046338d23e26eb0b8a2e8fdc3d699d")
   (:PATH "src/codec/cbor-simple-write.lisp" :GIT-BLOB
    "58c7a3a040ec814fae2dfe636f569b5623cba8f0")
   (:PATH "src/codec/cbor-space.lisp" :GIT-BLOB
    "a8330e50a77b52a6b9044ebbb48f62bb4b3222a3")
   (:PATH "src/codec/cbor-string-read.lisp" :GIT-BLOB
    "d4a4f774c2264c46349e7eda61ee4a2a3118d742")
   (:PATH "src/codec/cbor-string-write.lisp" :GIT-BLOB
    "a2c5c77dd51bff760bff4508e998d94370921eda")
   (:PATH "src/codec/cbor-tag-input.lisp" :GIT-BLOB
    "6dfad07035ac8040b2aec0a455c175ea15dfd9ad")
   (:PATH "src/codec/cbor-tag-write.lisp" :GIT-BLOB
    "16b91fc27eabafd7ff12bfb0a56ed34208c2bd4b")
   (:PATH "src/codec/cbor-write.lisp" :GIT-BLOB
    "61f0d6e2783e4790ed7e19a45bba6407d6e5b3de")
   (:PATH "src/codec/package.lisp" :GIT-BLOB
    "7139b8ce1a947efe6599f2cbbdf78a02e35a68f1")
   (:PATH "src/codec/utf8.lisp" :GIT-BLOB
    "e2339f232be3d432311503cb48f9ad8e2e53e8e8")
   (:PATH "src/control/build.lisp" :GIT-BLOB
    "b20fd8bbde30f47d2b9b6723cd04ee8c57f84ad4")
   (:PATH "src/control/dependency.lisp" :GIT-BLOB
    "70e4b4052d3e787f86273c0a8bec60de38b6163a")
   (:PATH "src/control/package.lisp" :GIT-BLOB
    "e56a6bb83abe9441350baa46573d74c6d55edf4e")
   (:PATH "src/control/preflight.lisp" :GIT-BLOB
    "638bad1673c8fd83876551ab3e7969167f611a1c")
   (:PATH "src/control/prepare.lisp" :GIT-BLOB
    "a75979cadbc8910c4955f2b091bd861150e5a26b")
   (:PATH "src/control/publication-read.lisp" :GIT-BLOB
    "6970c03f6387dad6948121852a9ad04ee9cca48e")
   (:PATH "src/control/publication.lisp" :GIT-BLOB
    "696f6208a139c1362f9cfcdd9be0f2c2396843ff")
   (:PATH "src/control/recovery-publication.lisp" :GIT-BLOB
    "906ea6d3f42c19f20bfde45bc477ba6ee4bc1040")
   (:PATH "src/control/recovery-read.lisp" :GIT-BLOB
    "5ec9c664bbf137e7456a4058dd14a934839fe6b3")
   (:PATH "src/control/recovery-types.lisp" :GIT-BLOB
    "07d3b1273fea4f1c8b2695c9fa563a0579bdb2e5")
   (:PATH "src/control/transfer.lisp" :GIT-BLOB
    "f29a92a80d75718c1bca9d7403c8764cb24399a2")
   (:PATH "src/control/types.lisp" :GIT-BLOB
    "d45ec11a4475dd9ecf32f37e2f656b127f19c98b")
   (:PATH "src/csn/package.lisp" :GIT-BLOB
    "9eb660cca8f097e25ca3c1535cace8c20bc1e238")
   (:PATH "src/csn/registry.lisp" :GIT-BLOB
    "80cb600f6c6d724cf1eaec25c3d2742c8c320906")
   (:PATH "src/dispatch/begin.lisp" :GIT-BLOB
    "1f54e226a0b7d5c796ef09b6336866e1a74b78b1")
   (:PATH "src/dispatch/build.lisp" :GIT-BLOB
    "d1f2397592a8ba9c3af21394f191017e9fd2219c")
   (:PATH "src/dispatch/claim.lisp" :GIT-BLOB
    "f7717c94b765165eae4144042308e3639644ed5e")
   (:PATH "src/dispatch/package.lisp" :GIT-BLOB
    "db21c798588ff4a88be5b69b5fbe72bc84811a46")
   (:PATH "src/dispatch/recycle.lisp" :GIT-BLOB
    "adcd65ee5fd683d70a40b89b31a2edf7fc93994c")
   (:PATH "src/dispatch/start.lisp" :GIT-BLOB
    "9b1964850e91e273ef21f9e371bdd2cd81673825")
   (:PATH "src/dispatch/step.lisp" :GIT-BLOB
    "a4089abcd78bb811ca8279361af027e9822722c0")
   (:PATH "src/dispatch/types.lisp" :GIT-BLOB
    "09b357c8f46c67d8e57994e1fa37affdd25a1695")
   (:PATH "src/epochs/core.lisp" :GIT-BLOB
    "9388a84a1beb35cfa2bf016471389c881ad38628")
   (:PATH "src/epochs/package.lisp" :GIT-BLOB
    "43bc1aefdeec0e19e729160b3aa085091634a11a")
   (:PATH "src/epochs/read.lisp" :GIT-BLOB
    "a3dfde4a4780554b88e6e037ab4f70731f9c884a")
   (:PATH "src/epochs/reclaim.lisp" :GIT-BLOB
    "57235763cf556ecd7633a0052f265ce3eb2b0462")
   (:PATH "src/epochs/retire.lisp" :GIT-BLOB
    "f0f1cd22e87892119a4b7768b4efe5e519925dff")
   (:PATH "src/epochs/types.lisp" :GIT-BLOB
    "909dfdbc901c4cbdeae5b47faf52480350372524")
   (:PATH "src/execution/handoff.lisp" :GIT-BLOB
    "34c8add62a6df92446be5234ef013893ebcf6879")
   (:PATH "src/execution/package.lisp" :GIT-BLOB
    "dcdf82cb17b20f6d4e96cc94d3f1522520c3a236")
   (:PATH "src/execution/queue.lisp" :GIT-BLOB
    "bb4d4d6f222aa360ec64ef2f45ee6ba0524dd2f0")
   (:PATH "src/execution/ready-recycle.lisp" :GIT-BLOB
    "58981c7e41ce2694dbfcaed99010a3a53e3c1dea")
   (:PATH "src/execution/ready-types.lisp" :GIT-BLOB
    "5b3c26f78d5c4aa53ca200abdd3e0f753f926b54")
   (:PATH "src/execution/ready.lisp" :GIT-BLOB
    "4119f86231b7d8698fc3558868ff8a5bcbdf3090")
   (:PATH "src/execution/worker-boundary.lisp" :GIT-BLOB
    "720f16e96203f00e308727b430b66b28689dc7bb")
   (:PATH "src/execution/worker-claim.lisp" :GIT-BLOB
    "4f34d18152d77fbf63bf708ebd0aabac178c3ac1")
   (:PATH "src/execution/worker-run.lisp" :GIT-BLOB
    "65a3f3c9e84c83b900c1dd8c9cc2fc21cec36c52")
   (:PATH "src/execution/worker-types.lisp" :GIT-BLOB
    "6d36e1f64d79f24c95209fd70551953e40c62335")
   (:PATH "src/execution/writer.lisp" :GIT-BLOB
    "8e5102497f628796fa8faffa2085a165496af230")
   (:PATH "src/foundation/batch.lisp" :GIT-BLOB
    "2cbd40c539b13dd80070eedf4af82bd1b26f4b28")
   (:PATH "src/foundation/binary.lisp" :GIT-BLOB
    "2d514f6fe2e81eecb29fa53de611fa5e28696904")
   (:PATH "src/foundation/conditions.lisp" :GIT-BLOB
    "edbe5eaa88c50dc13af8e367b73f7f41fd7bd724")
   (:PATH "src/foundation/crc32c.lisp" :GIT-BLOB
    "f9c691d28620427099d1d89a89a1ff5d04cbe257")
   (:PATH "src/foundation/package.lisp" :GIT-BLOB
    "bca6808e75e144ac7e9643df07a1cc6df4f70ed3")
   (:PATH "src/foundation/record.lisp" :GIT-BLOB
    "09185339cab38ab937045b40c52bb1b9092ffb8e")
   (:PATH "src/fulltext/analysis-emit.lisp" :GIT-BLOB
    "ede43f9e120f37fc2ed4970bd1b0623b07ae2333")
   (:PATH "src/fulltext/analysis-nfc.lisp" :GIT-BLOB
    "580f823c9e33a75e1233ef61eaaaf15b0060137c")
   (:PATH "src/fulltext/analysis-package.lisp" :GIT-BLOB
    "5729cfba660c391cf9dee6fc3d5e6ccbddcd2552")
   (:PATH "src/fulltext/analysis-properties.lisp" :GIT-BLOB
    "f0879979dc318cefa5f8a870a2b8dc4132094f3a")
   (:PATH "src/fulltext/analysis-space.lisp" :GIT-BLOB
    "0f295b4eca162d908746ad5d7f7238480325b00c")
   (:PATH "src/fulltext/analysis-word-context.lisp" :GIT-BLOB
    "e4660d31ae0d6d47adf4e1c9b003c86180275b5d")
   (:PATH "src/fulltext/analysis-word-rules.lisp" :GIT-BLOB
    "227219f9faa098057970f25ea441f1e448ca85c4")
   (:PATH "src/fulltext/analysis.lisp" :GIT-BLOB
    "26ca9e242db4516fbf83ce56464cc7c76e460b07")
   (:PATH "src/fulltext/codec-input.lisp" :GIT-BLOB
    "ec3d8865324e21198ad1ef238907eb22706922a7")
   (:PATH "src/fulltext/codec-package.lisp" :GIT-BLOB
    "3c00fe5b42beae166bad39cb9314dc83c687858f")
   (:PATH "src/fulltext/codec-plan.lisp" :GIT-BLOB
    "60f9c3ca01fb0b29bf992c255bd4e40ce8ad44c4")
   (:PATH "src/fulltext/codec-query.lisp" :GIT-BLOB
    "2e77838f54f12cf998341f494a92127770f05e7f")
   (:PATH "src/fulltext/codec-read-base.lisp" :GIT-BLOB
    "c6fe327a9a49cef8a126350fc45d4ae6260d1afc")
   (:PATH "src/fulltext/codec-read-dict.lisp" :GIT-BLOB
    "70bd43d2e1e50625ad47df827f5615734d15ae61")
   (:PATH "src/fulltext/codec-read-lengths.lisp" :GIT-BLOB
    "a3549d187caf9b6a86ef4126197ab68eb7a177de")
   (:PATH "src/fulltext/codec-read-postings.lisp" :GIT-BLOB
    "79e34c0e71d2e1f2d2b78a7c61c4d85811c9aa8d")
   (:PATH "src/fulltext/codec-read-term.lisp" :GIT-BLOB
    "15178d8d735daff2b162030e815b5e3da6a37cae")
   (:PATH "src/fulltext/codec-run.lisp" :GIT-BLOB
    "73022c24cfe46dfaa93e185153296f1da7adc58a")
   (:PATH "src/fulltext/codec-space.lisp" :GIT-BLOB
    "fcad6ec5ee926a710794e01ee652b8cf7befcebc")
   (:PATH "src/fulltext/codec-view.lisp" :GIT-BLOB
    "b986c8a9eafb72344f640ba5de52bd32643be341")
   (:PATH "src/fulltext/codec-write-entries.lisp" :GIT-BLOB
    "567a7ca7a7ac23f6a5240bdd54b08ed138a56301")
   (:PATH "src/fulltext/codec-write.lisp" :GIT-BLOB
    "2c9fd28d25a840a5e695e92f839f60898122db6a")
   (:PATH "src/fulltext/descriptor.lisp" :GIT-BLOB
    "eef3aa97b7a43a5a0bd6575e6cab2a3f9e54f985")
   (:PATH "src/fulltext/document-analysis.lisp" :GIT-BLOB
    "a7c79f8e9fb4a47e5718db454be405d47e689831")
   (:PATH "src/fulltext/document-bound.lisp" :GIT-BLOB
    "8f3783161f38d67900c0115429255281822ab2cc")
   (:PATH "src/fulltext/document-config-input.lisp" :GIT-BLOB
    "3dc4712c1c1bfe56b97e851baeb7a2b2c8d3afe0")
   (:PATH "src/fulltext/document-config.lisp" :GIT-BLOB
    "c27b728d847fa0e1a0b42c19e04f4f8568379717")
   (:PATH "src/fulltext/document-package.lisp" :GIT-BLOB
    "c95277890c41d43af04cd3db67dedf204c398bc7")
   (:PATH "src/fulltext/document-paths.lisp" :GIT-BLOB
    "d5bb755161e099835faed15bd1ca486a50febd16")
   (:PATH "src/fulltext/document-scan.lisp" :GIT-BLOB
    "7556be1b270ce4e2c63fba26f50c68548d4b72d1")
   (:PATH "src/fulltext/document-space.lisp" :GIT-BLOB
    "f921d0c8090cc035604c573873027889daedccfe")
   (:PATH "src/fulltext/document-start.lisp" :GIT-BLOB
    "b044f1d4914385f171557e082a014d772e671c9d")
   (:PATH "src/fulltext/document.lisp" :GIT-BLOB
    "8e1f972c5b0eaeb3e340b915108af5b49b734208")
   (:PATH "src/fulltext/format-constants.lisp" :GIT-BLOB
    "68c8831f87e45614e05d783e82a3ad0a2585325d")
   (:PATH "src/fulltext/format-input.lisp" :GIT-BLOB
    "92a17dc2bcdfd837d50b969a0f0156ae7709d50a")
   (:PATH "src/fulltext/format-package.lisp" :GIT-BLOB
    "1f72e2d40467a20422c5bfaa2564bb5b84fedf29")
   (:PATH "src/fulltext/format-read.lisp" :GIT-BLOB
    "0eafbb6b7f6644fccb198135fccf1ac9b101e1f2")
   (:PATH "src/fulltext/format-write.lisp" :GIT-BLOB
    "d87702218efa8b4e5992c3ede59674743fa53d3f")
   (:PATH "src/fulltext/index-build.lisp" :GIT-BLOB
    "026cd085b27531258e0828a3da34cd834b866875")
   (:PATH "src/fulltext/index-lookup.lisp" :GIT-BLOB
    "f3125aa4f88279fb0f21431a369e7479c642ea71")
   (:PATH "src/fulltext/index-package.lisp" :GIT-BLOB
    "711bbbc0c7491d10b6c0e411c38099add1230a7b")
   (:PATH "src/fulltext/index-sort.lisp" :GIT-BLOB
    "53447fbf8db853d6b5299875af52f764deded5f7")
   (:PATH "src/fulltext/index-step.lisp" :GIT-BLOB
    "8bbd1228e7ee78435a718ad71c37a4f8095302ff")
   (:PATH "src/fulltext/meta-fields.lisp" :GIT-BLOB
    "0aad5b5452a86ca0f333fed0648e91a264596ecc")
   (:PATH "src/fulltext/meta-read.lisp" :GIT-BLOB
    "b51cb3e7a022d5e95f7aad3ee8c9baacb5ebbce8")
   (:PATH "src/fulltext/unicode-tables.lisp" :GIT-BLOB
    "4b8f977f590d09fd4a2386ef14642b182170cd2c")
   (:PATH "src/get-directory/build.lisp" :GIT-BLOB
    "f1a1a37ccd59a81e7ff91fcb36009d5953d7edd5")
   (:PATH "src/get-directory/package.lisp" :GIT-BLOB
    "8dcddeb0536c1104af92c722ffbfab2059601c74")
   (:PATH "src/get-directory/read.lisp" :GIT-BLOB
    "1d93461227b222a8effc53ec9344c5dab0b531fe")
   (:PATH "src/get-directory/sources-read.lisp" :GIT-BLOB
    "ca171a29008377ec491dce07afd6cf24f12cd8fe")
   (:PATH "src/get-directory/sources-types.lisp" :GIT-BLOB
    "29abe8ab7a3756eb33365ec8c8ffacdc2a7a0564")
   (:PATH "src/get-directory/types.lisp" :GIT-BLOB
    "ec99839d234468298b553e331873a320c8ece53f")
   (:PATH "src/get-resolver/active-build.lisp" :GIT-BLOB
    "d135084116b62ed3b55f81ee5798618919f76ead")
   (:PATH "src/get-resolver/active-directory.lisp" :GIT-BLOB
    "70341c7c32b364603d38bdc42e8b3af1cc631773")
   (:PATH "src/get-resolver/active-init.lisp" :GIT-BLOB
    "b0586a8815a9ad72c1a897ac16d14a3f1ed530ca")
   (:PATH "src/get-resolver/active-preflight.lisp" :GIT-BLOB
    "bd75d3a4b7483900689417ae3eb2dd65e76c8468")
   (:PATH "src/get-resolver/active-read.lisp" :GIT-BLOB
    "0a93acd78d9b8b341011531e23e5663ae1df4f72")
   (:PATH "src/get-resolver/active-scan.lisp" :GIT-BLOB
    "5ae454c03e8a9b9196653c8b28df0727e480d142")
   (:PATH "src/get-resolver/active-types.lisp" :GIT-BLOB
    "590b969dd48f4a789e15d692addb92cd7970bebf")
   (:PATH "src/get-resolver/build.lisp" :GIT-BLOB
    "956b6c7145a25dc64a7247f2e14321876ac08f15")
   (:PATH "src/get-resolver/package.lisp" :GIT-BLOB
    "33d7b898b5f5a7b20c8112484191c14df44b770e")
   (:PATH "src/get-resolver/read.lisp" :GIT-BLOB
    "1177496e5baca7f7c698156e196c60fe1fe2566a")
   (:PATH "src/get-resolver/rows.lisp" :GIT-BLOB
    "e1bf83fbcc737b55eaa71bd6b41a912a901178ce")
   (:PATH "src/get-resolver/scan.lisp" :GIT-BLOB
    "6f54751adb255f49582ff1da62f951965c3860a1")
   (:PATH "src/get-resolver/sort.lisp" :GIT-BLOB
    "9cbbdb6200af813bc9595d0ef964628a9ba0368f")
   (:PATH "src/get-resolver/types.lisp" :GIT-BLOB
    "53438f156d3e1e15f3732ec840223231b308a7a5")
   (:PATH "src/get/build.lisp" :GIT-BLOB
    "cb426426eac6e923224bc57c1dd602405f4bc040")
   (:PATH "src/get/lifecycle.lisp" :GIT-BLOB
    "23f16c3039b71be0bd46d6bf92f05791e444683e")
   (:PATH "src/get/lookup.lisp" :GIT-BLOB
    "5a105a141b43f5585f8e79c2965d59e96cd35ac6")
   (:PATH "src/get/package.lisp" :GIT-BLOB
    "a22de99a63db56417822bb5e66f82e5c89d73bc2")
   (:PATH "src/get/segment.lisp" :GIT-BLOB
    "cf168c44bfe5aedd2e34180ce4f766a6a89500a7")
   (:PATH "src/get/target.lisp" :GIT-BLOB
    "c9b8488d0a1aa7643a6ab1570765ec870aa7c9e4")
   (:PATH "src/get/types.lisp" :GIT-BLOB
    "032ad088b19ec3498a7c80a5e4b96d7777257dad")
   (:PATH "src/hash/arithmetic.lisp" :GIT-BLOB
    "0d8e799b889df829aeb46054ef100377845dd0e0")
   (:PATH "src/hash/blocks.lisp" :GIT-BLOB
    "f115b63c6089960e9857469475f821f3035a5ef2")
   (:PATH "src/hash/hash64.lisp" :GIT-BLOB
    "6d43b042d7d9018f8aa48e88fc58c24b5a089cdf")
   (:PATH "src/hash/package.lisp" :GIT-BLOB
    "0c73ce15b8de3f9173a99f7216ead4e79d04d535")
   (:PATH "src/index/core.lisp" :GIT-BLOB
    "a83ee5a2d8903538f8ba977ef0f5ddbe3a357d6b")
   (:PATH "src/index/hash-digests.lisp" :GIT-BLOB
    "6d05b467aee412f447308eb697daa7f4f5ec6f0d")
   (:PATH "src/index/hash-seed.lisp" :GIT-BLOB
    "5627b4179b115c008379aa3e60a4724e63f9657b")
   (:PATH "src/index/package.lisp" :GIT-BLOB
    "02d4fd9bf5f1701eefd5e6997b89c1d98a8cef5c")
   (:PATH "src/index/primary-arena.lisp" :GIT-BLOB
    "20de8a35a4deaa830348a6db5b5bb033a82c81d2")
   (:PATH "src/index/primary-build.lisp" :GIT-BLOB
    "aa80e1b0b6af77379cfe2f2bd12c0b17e5c6851b")
   (:PATH "src/index/primary-core.lisp" :GIT-BLOB
    "20d4b57b2a7c4b9f11205e753b92301f74f56cfc")
   (:PATH "src/index/primary-directory.lisp" :GIT-BLOB
    "1d7969c842b1f9a4cd0b9eba2ea3496cf914a2c4")
   (:PATH "src/index/primary-package.lisp" :GIT-BLOB
    "aacbb9975ad3795d848c4523d178af31d34aa7b2")
   (:PATH "src/index/primary-probe.lisp" :GIT-BLOB
    "f36b55b9e2d9002ed2ce203a0289c92984c89ac9")
   (:PATH "src/index/primary-read.lisp" :GIT-BLOB
    "b5b8243bc40b44af8c34ba76a5ab732675690af5")
   (:PATH "src/index/primary-relocate.lisp" :GIT-BLOB
    "2282593c0a431f3f73fb47cdfc7a8e530e704ce7")
   (:PATH "src/index/primary-types.lisp" :GIT-BLOB
    "b8009b8313054c9abebb70de8f8223fb1df708f3")
   (:PATH "src/index/primary-write.lisp" :GIT-BLOB
    "5db1d132d91fa11be2b2624ed4c0c8d5405ce591")
   (:PATH "src/index/read.lisp" :GIT-BLOB
    "abfdeb5397f8be1d390cbdf47f4f02cd2f36bf91")
   (:PATH "src/index/rebuild-budget.lisp" :GIT-BLOB
    "77df997ef72008e7758899a348ae07695bce0b38")
   (:PATH "src/index/rebuild-copy.lisp" :GIT-BLOB
    "8555e14347d05182c99b756a312207019e2f904f")
   (:PATH "src/index/rebuild-scan.lisp" :GIT-BLOB
    "79d794b102c3ebf50679426e7cebbf49f02683ce")
   (:PATH "src/index/rebuild.lisp" :GIT-BLOB
    "321ae3d1fdcda8e34efbdaac4b10dfc08fe9d9a5")
   (:PATH "src/index/relocate.lisp" :GIT-BLOB
    "012c8cff2c265aa7f0daa909a9a0dd01adf7ca3b")
   (:PATH "src/index/types.lisp" :GIT-BLOB
    "3c7cd919b94dd9458422143c18075dd7498fda1f")
   (:PATH "src/index/validation.lisp" :GIT-BLOB
    "a8088783354d2e4e5048d6ac7a3bee7afff92719")
   (:PATH "src/index/write.lisp" :GIT-BLOB
    "80156ca526a341c845fc43fc9963097f8669e65a")
   (:PATH "src/io/directory.lisp" :GIT-BLOB
    "2a9b0a14c2b84db07d65374be0cdd5bd71d51768")
   (:PATH "src/io/flush.lisp" :GIT-BLOB
    "99fb51535f9bfbbaf8a2d7831dbd14b5f727b9d6")
   (:PATH "src/io/identity-types.lisp" :GIT-BLOB
    "9c94bab051b318a872d78efa45ba3358bf74f8b6")
   (:PATH "src/io/identity.lisp" :GIT-BLOB
    "326635b36bfa8f47778e7ff6cd1c72354352b5d5")
   (:PATH "src/io/lifecycle.lisp" :GIT-BLOB
    "77e43979548e6343066036c363a3aa2208ac1e10")
   (:PATH "src/io/namespace.lisp" :GIT-BLOB
    "d33e105874769a569fdc38de337d0f595375474e")
   (:PATH "src/io/native-directory.lisp" :GIT-BLOB
    "a126ce400de0a058e80b3178198f4af36c96cc90")
   (:PATH "src/io/native-namespace.lisp" :GIT-BLOB
    "72282e6cb1a9702359f7da9758304a5258c83f87")
   (:PATH "src/io/native-open-relative.lisp" :GIT-BLOB
    "e99bea95eefaaa8fe53849dc99cac7b1f4d94453")
   (:PATH "src/io/native.lisp" :GIT-BLOB
    "18b23eba1b6cabfacf4d2c423714408f0b592bd4")
   (:PATH "src/io/open-relative.lisp" :GIT-BLOB
    "f74ab7d8bae2edf28545c02f55d8224c5d7ba82f")
   (:PATH "src/io/package.lisp" :GIT-BLOB
    "e69102bee71cd3613a6251d1f8f2c6d78f142904")
   (:PATH "src/io/rename.lisp" :GIT-BLOB
    "4c9dc11fde2c2ed51d02cfb0201239dd5e14aaf5")
   (:PATH "src/io/transfer.lisp" :GIT-BLOB
    "5b24bd30aeb12b71b7b1a6a5aa537887a847bf10")
   (:PATH "src/io/types.lisp" :GIT-BLOB
    "2a1dcc8ab855fa112893150f8e5bddb1564d87a8")
   (:PATH "src/mvcc/package.lisp" :GIT-BLOB
    "d45fbf57051e43d0d998f3de9b4177665d24c9d9")
   (:PATH "src/mvcc/snapshots-core.lisp" :GIT-BLOB
    "01875b76743c514ef07346a32587f4dc5c34d2f8")
   (:PATH "src/mvcc/snapshots-csn.lisp" :GIT-BLOB
    "48372f6f09a54cfcee793ac03ec321fca6ad18f5")
   (:PATH "src/mvcc/snapshots-lifecycle.lisp" :GIT-BLOB
    "25d93efc7c604042d09dc84e31baf1f4e2c4c45e")
   (:PATH "src/mvcc/snapshots-read.lisp" :GIT-BLOB
    "09d73425a6e571c8fac6669b14b98e3ceeb7c96b")
   (:PATH "src/mvcc/snapshots-register.lisp" :GIT-BLOB
    "c9cadaabf755add3671cd1cc0408c3ff216df2a5")
   (:PATH "src/mvcc/snapshots-types.lisp" :GIT-BLOB
    "bf80277418243422144cf6ee71eef83d7eff6da5")
   (:PATH "src/mvcc/types.lisp" :GIT-BLOB
    "4cf0edbc70bc9e02ff3b0442cbce4ca44630d3e6")
   (:PATH "src/package.lisp" :GIT-BLOB
    "3d0181717e3f334580bab9a6a507e2dfe57261ff")
   (:PATH "src/read/core.lisp" :GIT-BLOB
    "132e44c138e209d3f8840b098cca0424853d09c3")
   (:PATH "src/read/package.lisp" :GIT-BLOB
    "dd00cd8e7dc8340e2006cfe03b0bf141968223fd")
   (:PATH "src/read/task.lisp" :GIT-BLOB
    "b3601060197a27c6e8a2aaee22b5576c6b0c6e5a")
   (:PATH "src/read/types.lisp" :GIT-BLOB
    "b30795fb7efad5f5313198d345ffabb43249e3fa")
   (:PATH "src/recovery-active/build.lisp" :GIT-BLOB
    "41f1eef0201a63afaf65b74cd54d899f44399153")
   (:PATH "src/recovery-active/closure.lisp" :GIT-BLOB
    "8d2f81d87c79c32f98060e73a84fc4cfdb671970")
   (:PATH "src/recovery-active/csn.lisp" :GIT-BLOB
    "e2cac366c83ae79062f97f74275fe399049c215e")
   (:PATH "src/recovery-active/frames.lisp" :GIT-BLOB
    "157221a830991415d120e19b033f73b2c6c2d946")
   (:PATH "src/recovery-active/package.lisp" :GIT-BLOB
    "474cd54f2a31f4ded95fd723b4170bee8addece4")
   (:PATH "src/recovery-active/publication.lisp" :GIT-BLOB
    "2a8500476de79bd62e395566a7471d0ca050556f")
   (:PATH "src/recovery-active/query.lisp" :GIT-BLOB
    "3e3bb0d5a126adf584ad4c4c77fd1b965c301e70")
   (:PATH "src/recovery-active/read.lisp" :GIT-BLOB
    "909abac62163856136bdfdc1ad30c3da90f884d5")
   (:PATH "src/recovery-active/resolve.lisp" :GIT-BLOB
    "d74f2261aa5ed16cbccb8201707f8f484380a18e")
   (:PATH "src/recovery-active/types.lisp" :GIT-BLOB
    "5d0d4f0219087001fd1df97339a530e64c39476f")
   (:PATH "src/recovery-archive-csn/build.lisp" :GIT-BLOB
    "125980e85ace529df3b36ea9fc83fc2ac7b236fa")
   (:PATH "src/recovery-archive-csn/package.lisp" :GIT-BLOB
    "bacf4fc95e38a8d0416110c6b87b506d561a7e59")
   (:PATH "src/recovery-archive-csn/preflight.lisp" :GIT-BLOB
    "cdc70f16eb9e736ea33d6f794910b9f97afad6df")
   (:PATH "src/recovery-archive-csn/query.lisp" :GIT-BLOB
    "b228e158ba87f83f7591f4a192a9d6b2cbf7b882")
   (:PATH "src/recovery-archive-csn/series.lisp" :GIT-BLOB
    "e6149b810be34b6da2b619c8f62cf02640c0060b")
   (:PATH "src/recovery-archive-csn/types.lisp" :GIT-BLOB
    "895ad3ef063684b8b5cced19cdeddb0e43afc149")
   (:PATH "src/recovery-archive/active.lisp" :GIT-BLOB
    "b61b332de594d6c74d6ed5fd5869face459ac34e")
   (:PATH "src/recovery-archive/build.lisp" :GIT-BLOB
    "454d4cad54c4db3e237d11a6de6304c86fd4e478")
   (:PATH "src/recovery-archive/package.lisp" :GIT-BLOB
    "82c707853b1a5b2b6d657e120c7e0ecb82404134")
   (:PATH "src/recovery-archive/query.lisp" :GIT-BLOB
    "eef7686bdd6ecbc03e3b9e86b73d29ae663742f6")
   (:PATH "src/recovery-archive/read.lisp" :GIT-BLOB
    "b46823a3fdc2d16e19c0c5702759bb198805eae2")
   (:PATH "src/recovery-archive/types.lisp" :GIT-BLOB
    "9aa3830c38b4b55a9b0475f6f3a6515508d7689a")
   (:PATH "src/recovery-checkpoint/build.lisp" :GIT-BLOB
    "585f09fe65c662b3023e563fddbcf4205dffa513")
   (:PATH "src/recovery-checkpoint/order.lisp" :GIT-BLOB
    "318d549b7c52da1e09c2bfb923f2041ffaef020c")
   (:PATH "src/recovery-checkpoint/package.lisp" :GIT-BLOB
    "7b191ecff3dbac6b5f690ad221c68b4762a9f0aa")
   (:PATH "src/recovery-checkpoint/preflight.lisp" :GIT-BLOB
    "2cde31db83995a20c7ec586b5c0e5f131fd7596e")
   (:PATH "src/recovery-checkpoint/sections.lisp" :GIT-BLOB
    "468baa20f0a1059593391018227206228126f0f8")
   (:PATH "src/recovery-closed/build.lisp" :GIT-BLOB
    "9c406904057e54e6d568a3ade2eee94c3770d202")
   (:PATH "src/recovery-closed/csn-serie.lisp" :GIT-BLOB
    "1c83dc034e7291254348ce361056afc2896e196e")
   (:PATH "src/recovery-closed/csn.lisp" :GIT-BLOB
    "20a710ad5bdcaa8fde8f1527812ca0881448cf99")
   (:PATH "src/recovery-closed/package.lisp" :GIT-BLOB
    "49ac245e2430e719b1d417b91b0ffcd53555e47d")
   (:PATH "src/recovery-closed/publication.lisp" :GIT-BLOB
    "31152707be3e4d12a6dadf63c8773c3c7c3fe343")
   (:PATH "src/recovery-closed/read.lisp" :GIT-BLOB
    "0947da79acc2bfd8eea7c4e0158913cd03291a1b")
   (:PATH "src/recovery-closed/resolve.lisp" :GIT-BLOB
    "e84f68c5dcb94240966607b2135e9e6f3c8f2711")
   (:PATH "src/recovery-closed/types.lisp" :GIT-BLOB
    "e32d665f9ce6bfba9d3c0ab6c8a8b4f980b4e10e")
   (:PATH "src/recovery-closed/verify.lisp" :GIT-BLOB
    "e7895a628234195e41b5d9f53b2d163bb5f9d199")
   (:PATH "src/recovery/decisions-build.lisp" :GIT-BLOB
    "87cc54024e59757c16e20f3025970b1699b11662")
   (:PATH "src/recovery/decisions-package.lisp" :GIT-BLOB
    "58a3e620a8def39d2b24cd210d9283184c247ed2")
   (:PATH "src/recovery/decisions-query.lisp" :GIT-BLOB
    "bca1698068955fb8de9959e23ee30e55ecc9c699")
   (:PATH "src/recovery/decisions-radix.lisp" :GIT-BLOB
    "e58176890a26751bf5767582b279cb667a29744e")
   (:PATH "src/recovery/decisions-sort.lisp" :GIT-BLOB
    "b133ea00a3b8063e9e934a1b41f10cad024471ae")
   (:PATH "src/recovery/decisions-types.lisp" :GIT-BLOB
    "4a16574f26c35b12db7693804b9b5c35e1b85cb7")
   (:PATH "src/recovery/inventory-build.lisp" :GIT-BLOB
    "60057f6a50c657f016bee3c21c21911b582f86fe")
   (:PATH "src/recovery/inventory-directory-id.lisp" :GIT-BLOB
    "53565668f4d3734dbf9014f929c1c0e953ed3908")
   (:PATH "src/recovery/inventory-directory.lisp" :GIT-BLOB
    "221a2c0e19f551bcae502434e369462af92bd470")
   (:PATH "src/recovery/inventory-id.lisp" :GIT-BLOB
    "752ff8bc2b6a30cfcf2bdcfdb41ecc5d9d3215c4")
   (:PATH "src/recovery/inventory-query.lisp" :GIT-BLOB
    "47810fb2944b4b5c18d9a9c8e60dfdc1c5f19db4")
   (:PATH "src/recovery/inventory-types.lisp" :GIT-BLOB
    "68c357d2d522fcabe79284c540c2631e5fa87780")
   (:PATH "src/recovery/manifest-build.lisp" :GIT-BLOB
    "e74b806f5116db46f3a385821515c317b2dcb452")
   (:PATH "src/recovery/manifest-decode.lisp" :GIT-BLOB
    "ae5b8e4677fdd1dcee2f2a1baf293f49d9ce2972")
   (:PATH "src/recovery/manifest-fold.lisp" :GIT-BLOB
    "eaddc83c63dce2fde59227e0416917bbc766e325")
   (:PATH "src/recovery/manifest-package.lisp" :GIT-BLOB
    "4c7f26f8f12a9cf815f38e27b9c605ba12e199bd")
   (:PATH "src/recovery/manifest-query.lisp" :GIT-BLOB
    "55e56d621129d1637eac1a787bad60dd0f0405b1")
   (:PATH "src/recovery/manifest-transition.lisp" :GIT-BLOB
    "1f92455ec8c38c780b6e6455166be5c49ef3fefa")
   (:PATH "src/recovery/manifest-types.lisp" :GIT-BLOB
    "e062c804e68a8f62eddadd5c87db0e7af392744f")
   (:PATH "src/recovery/package.lisp" :GIT-BLOB
    "b97b5c9bca6955e5dc45d9d4257089ab7132f3fb")
   (:PATH "src/recovery/scan.lisp" :GIT-BLOB
    "7ad6b7541397611f1ecbda7dffdda98c4453dbf1")
   (:PATH "src/runtime/active.lisp" :GIT-BLOB
    "6145d557b43cc2e0f8e4a75e5356c7e3b1def45e")
   (:PATH "src/runtime/build.lisp" :GIT-BLOB
    "a0c63b925024e75f3edc917af2739362966db11e")
   (:PATH "src/runtime/package.lisp" :GIT-BLOB
    "67c778a8093e0b7a4eaeba4e6c3cf075d73a1a43")
   (:PATH "src/runtime/preflight.lisp" :GIT-BLOB
    "c82afb340fb354ef738866c01ad59595ada09713")
   (:PATH "src/runtime/query.lisp" :GIT-BLOB
    "10cc651efa58bcd71852f9e75b00451a6cce20a6")
   (:PATH "src/runtime/types.lisp" :GIT-BLOB
    "4eeff088a44159541019ed3cfe3048bc36762f7e")
   (:PATH "src/scheduler/build.lisp" :GIT-BLOB
    "a925a9380e48a0d0018e00eb97676679db2e8eba")
   (:PATH "src/scheduler/lifecycle-build.lisp" :GIT-BLOB
    "379a139fdf6d202937a44af3ceae4444a26ed48a")
   (:PATH "src/scheduler/lifecycle-read.lisp" :GIT-BLOB
    "261ef5a3b909b3f552df0eb57fb2124d92be502c")
   (:PATH "src/scheduler/lifecycle-types.lisp" :GIT-BLOB
    "56dc619b46eb6cb3cbe934be586a8fc13e769b34")
   (:PATH "src/scheduler/lifecycle-update.lisp" :GIT-BLOB
    "34d4685b42ec26942109309666d85093a53146fd")
   (:PATH "src/scheduler/lifecycle-worker.lisp" :GIT-BLOB
    "70224b35cb011adbc0caa7738ef61fd0f2564f09")
   (:PATH "src/scheduler/package.lisp" :GIT-BLOB
    "cadff5f2e29e7c5b625b95f9387faf29aad02178")
   (:PATH "src/scheduler/policy.lisp" :GIT-BLOB
    "b9f30d56f58b77c9cf42df9481f37586faf0c4c2")
   (:PATH "src/scheduler/pool-claim.lisp" :GIT-BLOB
    "476372e627724a17b7c86257171ff1d33bd5b809")
   (:PATH "src/scheduler/read.lisp" :GIT-BLOB
    "cabd8cdb2f83333b321653fd63549eb5716d7b59")
   (:PATH "src/scheduler/types.lisp" :GIT-BLOB
    "728f410292749214a020047d8efa744c54ed0a6e")
   (:PATH "src/scheduler/update.lisp" :GIT-BLOB
    "ac1a02b8dcb4432a99ab7f93686b0c02d5c775d8")
   (:PATH "src/series/events.lisp" :GIT-BLOB
    "63fb4a20faeedceb47b8cd550262f1bdca497c06")
   (:PATH "src/series/io-events.lisp" :GIT-BLOB
    "128fe9650a741541b46d1ad0887b872cb2e85012")
   (:PATH "src/series/ownership.lisp" :GIT-BLOB
    "7352a27581b8e2e68407611e65e46773efdc333c")
   (:PATH "src/series/package.lisp" :GIT-BLOB
    "6fd26253982dba01e9eef2702c5f4ede6ba70659")
   (:PATH "src/series/publication.lisp" :GIT-BLOB
    "d5f27e3366e71651a3b41322b68d9ca7ab871fe3")
   (:PATH "src/series/query.lisp" :GIT-BLOB
    "7f91ca22b7f2f339b450db0f4c26c97f86906c58")
   (:PATH "src/series/retirement.lisp" :GIT-BLOB
    "fc42b51a0f8606687881e239ba650a9f1bb58124")
   (:PATH "src/series/routing-build.lisp" :GIT-BLOB
    "6fbe5e4720187be3bcada2dcc9fc40026267da07")
   (:PATH "src/series/routing-select.lisp" :GIT-BLOB
    "f280c35e8f7ed283d30e8f4a43bbf2f172600816")
   (:PATH "src/series/routing-types.lisp" :GIT-BLOB
    "e350df4e2fdc2f651ffbdb136bdbb266ccafcb1c")
   (:PATH "src/series/types.lisp" :GIT-BLOB
    "5630ae60278a168326cf19e7cee4eacb3deacbe6")
   (:PATH "src/series/worker-boundary.lisp" :GIT-BLOB
    "acc9f6ea83a8ef2774b41bdb114165b6bfb54949")
   (:PATH "src/series/worker-package.lisp" :GIT-BLOB
    "d0316128bae48e4251a519d7daab25dbaf52f031")
   (:PATH "src/series/worker-run.lisp" :GIT-BLOB
    "02c219d556a8cd807a0e322667dfb401d8b06fb6")
   (:PATH "src/series/worker-types.lisp" :GIT-BLOB
    "39f28974f3fae098d32d4ad1a056a45b06f777a6")
   (:PATH "src/storage/compaction-scan.lisp" :GIT-BLOB
    "233556c366a99b7b263af1c7bc19b47ceaebf940")
   (:PATH "src/storage/control-payload.lisp" :GIT-BLOB
    "7980cac6cc8070836b9aa49fc8a0d6fb42630749")
   (:PATH "src/storage/formats.lisp" :GIT-BLOB
    "fc942f1c8e30e637abaf13dc26343d40417fc72f")
   (:PATH "src/storage/log-header.lisp" :GIT-BLOB
    "fde8608e6ad3fe062937c48bdcb7d2d5870207bf")
   (:PATH "src/storage/package.lisp" :GIT-BLOB
    "c15553a65171e5dfb2dbadb62c92ed4dc48aee3a")
   (:PATH "src/storage/payload-record.lisp" :GIT-BLOB
    "0012eaf90064c4cc2949834a60e83c9db8ba6308")
   (:PATH "src/storage/payload-write.lisp" :GIT-BLOB
    "6cbbb89f681965173e9b1b95edf3f7f870af1eca")
   (:PATH "src/storage/segment-header.lisp" :GIT-BLOB
    "f1d99b205b1ea5e6ad059ecd7971d3633411b040")
   (:PATH "src/wal/builder.lisp" :GIT-BLOB
    "6d30698383477880c693954314bab03ca8affe24")
   (:PATH "src/wal/csn.lisp" :GIT-BLOB
    "f65662b4dea8ef04e4e59ce38b29a94fecea4f6c")
   (:PATH "src/wal/executor.lisp" :GIT-BLOB
    "edc8ce7474365e0885925d557a378779655d2e70")
   (:PATH "src/wal/group.lisp" :GIT-BLOB
    "8245bc10cedafbff8665489fbced6833f078a373")
   (:PATH "src/wal/package.lisp" :GIT-BLOB
    "ad1b1356eeb10248526f15ac31d2cc9b59811fc5")
   (:PATH "src/wal/types.lisp" :GIT-BLOB
    "4201cc4ef852de026543996223e586e91e6b494c"))
  :DYNAMIC-SPACE-MIB 4096 :DATE-UNIVERSAL-TIME 4001217274)
 :MODE #A((7) BASE-CHAR . "--check") :STATUS :FAILED :RUNS NIL :RUN-ARTIFACTS
 (#A((87) BASE-CHAR
     . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001217248-check-76247-0/SPK-11.lisp")))
