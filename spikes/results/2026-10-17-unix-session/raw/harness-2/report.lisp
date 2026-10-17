(:DIAGNOSTIC
 #A((94) BASE-CHAR . "Package ARCDOCDB.SPK11 does not exist.

  Stream: #<SB-IMPL::STRING-INPUT-STREAM {8007A12173}>")
 :SCHEMA-VERSION 1 :ENVIRONMENT
 (:LISP #A((4) BASE-CHAR . "SBCL") :VERSION #A((5) BASE-CHAR . "2.6.9") :OS
  #A((6) BASE-CHAR . "Darwin") :OS-VERSION #A((6) BASE-CHAR . "27.0.0")
  :MACHINE #A((5) BASE-CHAR . "ARM64") :CPU "Apple M4" :MEMORY-BYTES
  17179869184 :LOGICAL-CPUS 10 :EXTERNAL-LOAD-STATUS :UNCONTROLLED
  :LOAD-AVERAGE "{ 4.09 5.27 7.24 }" :COMMIT
  "5d656ccbd76fe2fe63828f80dc77659e50a87709" :WORKING-TREE
  "M spikes/SPK-11-unix-socket/core.lisp
 M spikes/SPK-11-unix-socket/run.lisp
 M spikes/SPK-11-unix-socket/scenarios.lisp
 M spikes/SPK-11-unix-socket/transport.lisp
 M tools/run-spikes.lisp
?? spikes/SPK-11-unix-socket/session-checks.lisp
?? spikes/SPK-11-unix-socket/session-model.lisp
?? spikes/SPK-11-unix-socket/session-transport.lisp
?? spikes/SPK-11-unix-socket/session-wire.lisp"
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
   (:PATH "src/foundation/crc32c.lisp" :GIT-BLOB
    "f9c691d28620427099d1d89a89a1ff5d04cbe257")
   (:PATH "src/foundation/record.lisp" :GIT-BLOB
    "09185339cab38ab937045b40c52bb1b9092ffb8e")
   (:PATH "src/foundation/batch.lisp" :GIT-BLOB
    "2cbd40c539b13dd80070eedf4af82bd1b26f4b28")
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
    "a354bbfd7f75576f94bc2ce7c8bdb0560faa4961")
   (:PATH "spikes/SPK-11-unix-socket/run.lisp" :GIT-BLOB
    "214f25aea6dfcf93541c2b7ea7f1092cba590ff5")
   (:PATH #A((35) BASE-CHAR . "spikes/SPK-11-unix-socket/core.lisp") :GIT-BLOB
    "7b526422d5be781d26213e128a49a07bc3e25788")
   (:PATH "spikes/SPK-11-unix-socket/transport.lisp" :GIT-BLOB
    "cfe4a32c04da589ed66a7d2b61e5dd7dcd8dd7f6")
   (:PATH "spikes/SPK-11-unix-socket/session-wire.lisp" :GIT-BLOB
    "d3bd3a22eb6ab70554f13ca798b8ea5ab310e863")
   (:PATH "spikes/SPK-11-unix-socket/session-model.lisp" :GIT-BLOB
    "104a8ef0c6b7be7a2ce30b5828100c08895ce6d5")
   (:PATH "spikes/SPK-11-unix-socket/session-checks.lisp" :GIT-BLOB
    "7a8270867109ba78e6109766b2bea8b00dbae007")
   (:PATH "spikes/SPK-11-unix-socket/session-transport.lisp" :GIT-BLOB
    "a79fed48095bd01e56860372badc1e168ac8eb7a")
   (:PATH "spikes/SPK-11-unix-socket/scenarios.lisp" :GIT-BLOB
    "e934df86ffd7617a616b1ee117f61292e5fcc1da")
   (:PATH "spikes/SPK-11-unix-socket/codec-inputs.lisp" :GIT-BLOB
    "d0db0b9a40edd8e47d5e758f012bb45d489eaa89")
   (:PATH "src/package.lisp" :GIT-BLOB
    "3d0181717e3f334580bab9a6a507e2dfe57261ff")
   (:PATH "src/foundation/package.lisp" :GIT-BLOB
    "bca6808e75e144ac7e9643df07a1cc6df4f70ed3")
   (:PATH "src/foundation/conditions.lisp" :GIT-BLOB
    "edbe5eaa88c50dc13af8e367b73f7f41fd7bd724")
   (:PATH "src/foundation/binary.lisp" :GIT-BLOB
    "2d514f6fe2e81eecb29fa53de611fa5e28696904")
   (:PATH "src/codec/package.lisp" :GIT-BLOB
    "7139b8ce1a947efe6599f2cbbdf78a02e35a68f1")
   (:PATH "src/codec/utf8.lisp" :GIT-BLOB
    "e2339f232be3d432311503cb48f9ad8e2e53e8e8")
   (:PATH "src/codec/cbor-package.lisp" :GIT-BLOB
    "3e31d60234585442baa5664be96a83915e034397")
   (:PATH "src/codec/cbor-header.lisp" :GIT-BLOB
    "db635a50678f2712ec9516be335717ea254d4d09")
   (:PATH "src/codec/cbor-float-minimal.lisp" :GIT-BLOB
    "ca6215b30010d3d2eb90eaa6fd09dd5a9ac7778f")
   (:PATH "src/codec/cbor-minimal.lisp" :GIT-BLOB
    "761302dad1073c841397f6c88d595b114af8d9ef")
   (:PATH "src/codec/cbor-space.lisp" :GIT-BLOB
    "a8330e50a77b52a6b9044ebbb48f62bb4b3222a3")
   (:PATH "src/codec/cbor-scan-input.lisp" :GIT-BLOB
    "57ffc48cc688a4de8ebec5cb14c1e69c4209704a")
   (:PATH "src/codec/cbor-scan-stack.lisp" :GIT-BLOB
    "c574e87af5e195ddf3f596a4ae527e69c7a3c6a6")
   (:PATH "src/codec/cbor-scan-items.lisp" :GIT-BLOB
    "70272936e323b3e0cb05173c9fb68cb2b614c355")
   (:PATH "src/codec/cbor-scan.lisp" :GIT-BLOB
    "e3d7d77407046338d23e26eb0b8a2e8fdc3d699d")
   (:PATH "src/codec/cbor-scan-minimal.lisp" :GIT-BLOB
    "f1afe79c7a4d49abd6a6e5f6975dec830ef7b1f6"))
  :DYNAMIC-SPACE-MIB 4096 :DATE-UNIVERSAL-TIME 4001224281)
 :MODE #A((7) BASE-CHAR . "--check") :STATUS :FAILED :RUNS NIL :RUN-ARTIFACTS
 (#A((86) BASE-CHAR
     . "/Users/gpicchiarelli/Documents/ArcDocDB/spikes/out/4001224275-check-9681-0/SPK-11.lisp")))
