(:SCHEMA-VERSION 1 :KIND :POOL-WORKER-BEGIN-COMPONENT-MANIFEST :BASE
 "ad829a40f6ce72837b59982d2e4f83e8c9ca9f3e" :QUALIFIED-SNAPSHOT
 #A((58) BASE-CHAR . "/private/tmp/arcdocdb-pool-begin-qualification-1792007072/") :PUBLIC-API
 ("arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool"
  "arcdocdb.scheduler.dispatch:prendi-collegamento-pool"
  "arcdocdb.scheduler.dispatch:collega-obbligo-pool"
  "arcdocdb.scheduler.dispatch:ricircola-collegamento-pool"
  "arcdocdb.scheduler.dispatch:inizia-obbligo-pool")
 :RUNTIME-SOURCES
 ("src/dispatch/package.lisp" "src/dispatch/types.lisp" "src/dispatch/build.lisp"
  "src/dispatch/claim.lisp" "src/dispatch/recycle.lisp" "src/dispatch/begin.lisp")
 :SCOPE
 (:CLAIMED-ONLY :LIFECYCLE-INDEPENDENT :DIRECT-ORDINAL-ROUTING :SINGLE-DELEGATED-C1-BEGIN
  :UNCHANGED-TOKEN-STATE-REASON :NO-POST-ACQUISITION-CHECK :NO-IMPLICIT-CLAIM-RECYCLE-OR-CLEANUP)
 :QUALIFIED-SOURCE-INVENTORY
 ((:RELATIVE-PATH "CHANGELOG.md" :PATH
   #A((70) BASE-CHAR . "/private/tmp/arcdocdb-pool-begin-qualification-1792007072/CHANGELOG.md")
   :BYTES 20477 :SHA256 "a3a3a0ebbb04600fc498519827c7e847087bb82327db6304970ba09221b57973"
   :GIT-BLOB "b829512e0b9332d65a465d974613d891d15738ad")
  (:RELATIVE-PATH "arcdocdb.asd" :PATH
   #A((70) BASE-CHAR . "/private/tmp/arcdocdb-pool-begin-qualification-1792007072/arcdocdb.asd")
   :BYTES 16629 :SHA256 "c9f2d60f0e73f1d951504da145b192584300a161cfd4df90984536fa9a34ec53"
   :GIT-BLOB "37876041b5104cdb4396017d8d891f547b060a1c")
  (:RELATIVE-PATH "docs/implementazione/README.md" :PATH
   #A((88) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-begin-qualification-1792007072/docs/implementazione/README.md")
   :BYTES 10810 :SHA256 "dfe2df8776ce028df1f682bc66cd4963010279e67728591415d268283e3768e7"
   :GIT-BLOB "fe4b735330176353bea8a2a2939a24606cb97ef5")
  (:RELATIVE-PATH "docs/implementazione/pool-dispatch.md" :PATH
   #A((95) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-begin-qualification-1792007072/docs/implementazione/pool-dispatch.md")
   :BYTES 5425 :SHA256 "c7d5a5ff9c6324c2a5f40cb658e79fa4d5f6051f50640bbb58d7515a12c9c2bc" :GIT-BLOB
   "4f68de61016c21066841ffd02d9f671963b566da")
  (:RELATIVE-PATH "src/dispatch/begin.lisp" :PATH
   #A((81) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-begin-qualification-1792007072/src/dispatch/begin.lisp")
   :BYTES 1658 :SHA256 "4ae4bf8f6b7afe53af099a4b37ad75d253c05077f0cc7fbe39f4f1cab9f89a8d" :GIT-BLOB
   "1f54e226a0b7d5c796ef09b6336866e1a74b78b1")
  (:RELATIVE-PATH "src/dispatch/build.lisp" :PATH
   #A((81) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-begin-qualification-1792007072/src/dispatch/build.lisp")
   :BYTES 1176 :SHA256 "c78d31a753db78baea520e9ea0cccf6e88cad9cca8bc75261a6ff26c2ac01fe5" :GIT-BLOB
   "d1f2397592a8ba9c3af21394f191017e9fd2219c")
  (:RELATIVE-PATH "src/dispatch/claim.lisp" :PATH
   #A((81) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-begin-qualification-1792007072/src/dispatch/claim.lisp")
   :BYTES 2713 :SHA256 "224e4114b8b91affced874bea9c23cae5c79526e8ddae62e31a0cafcbb763682" :GIT-BLOB
   "f7717c94b765165eae4144042308e3639644ed5e")
  (:RELATIVE-PATH "src/dispatch/package.lisp" :PATH
   #A((83) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-begin-qualification-1792007072/src/dispatch/package.lisp")
   :BYTES 549 :SHA256 "34ecf62cd625f8af0a884d713563338c88635afd88fd0eaa0ab8ba43d5f19486" :GIT-BLOB
   "2666d111a76d8510c490ac3f31cbe11118b55b29")
  (:RELATIVE-PATH "src/dispatch/recycle.lisp" :PATH
   #A((83) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-begin-qualification-1792007072/src/dispatch/recycle.lisp")
   :BYTES 2612 :SHA256 "9fa3294cd28d1904cfb8db5153f93188b02f1bfbaf1800dad788731007c29ad0" :GIT-BLOB
   "adcd65ee5fd683d70a40b89b31a2edf7fc93994c")
  (:RELATIVE-PATH "src/dispatch/types.lisp" :PATH
   #A((81) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-begin-qualification-1792007072/src/dispatch/types.lisp")
   :BYTES 1872 :SHA256 "cc44882c565a89de08f5add79333868ebfca4fc3f97bf9104d36375d014d4720" :GIT-BLOB
   "09b357c8f46c67d8e57994e1fa37affdd25a1695")
  (:RELATIVE-PATH "tests/scheduler/pool-begin.lisp" :PATH
   #A((89) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-begin-qualification-1792007072/tests/scheduler/pool-begin.lisp")
   :BYTES 28155 :SHA256 "ecb295cc76e3308f6e12e7a28b0fb46d517043709bffdac565ef8cbfd866b044"
   :GIT-BLOB "13a239cf97403806a73242abbd5b545440a17645")
  (:RELATIVE-PATH "tools/measure-pool-begin.lisp" :PATH
   #A((87) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-begin-qualification-1792007072/tools/measure-pool-begin.lisp")
   :BYTES 18722 :SHA256 "f572b29c9566c9ab282ef804c8136367beb574c7b57bee4a570bae961cb5c732"
   :GIT-BLOB "e3094d9f35efdaa647751f19a7acda00c36d515a")
  (:RELATIVE-PATH "docs/implementazione/pool-begin.md" :PATH
   #A((92) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-begin-qualification-1792007072/docs/implementazione/pool-begin.md")
   :BYTES 3144 :SHA256 "c3ca973e76cea42038adc378fcedb61c7688d50228eaac38821c245b7ed60b5e" :GIT-BLOB
   "e0e62896ea19af459f528060672729864f27133a")
  (:RELATIVE-PATH "docs/implementazione/pool-begin-metodo.md" :PATH
   #A((99) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-begin-qualification-1792007072/docs/implementazione/pool-begin-metodo.md")
   :BYTES 2922 :SHA256 "70308477c656e8fa44334e14aac68458f9345c38feb988be939e5d61c042b7ac" :GIT-BLOB
   "0a74eac283903d32bb75e108e95a06462a7f91bd")
  (:RELATIVE-PATH "docs/implementazione/pool-begin-revisione.md" :PATH
   #A((102) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-begin-qualification-1792007072/docs/implementazione/pool-begin-revisione.md")
   :BYTES 11803 :SHA256 "1b58c2b2bc903dfc9035a356e54cde82fed2f3855a326bf561835af771e215fb"
   :GIT-BLOB "10b9ab81741576c65c7862093f0cdc88d1c61de8"))
 :ORIGINAL-INPUT
 (:PATH #A((44) BASE-CHAR . "spikes/out/pool-begin-publication-input.lisp") :BYTES 2546 :SHA256
  "c7aa705896d87d61d05c5a4452e2aded54b674eedf15c5d28c8e3859e70af8a5" :GIT-BLOB
  "99bf71dcb2c50f8b250f4674284f61c7f674de72")
 :GENERIC-COMPATIBILITY
 (:CATALOG-COMPONENT :WRITER-WORKER :QUALIFIED-SOURCE-KIND :POOL-WORKER-LIFECYCLE-QUALIFIED-SOURCES
  :FINAL-SOURCE-KIND :POOL-WORKER-LIFECYCLE-FINAL-SOURCES :DEVELOPMENT-SOURCE-KIND
  :POOL-WORKER-LIFECYCLE-DEVELOPMENT :LARGE-DEVELOPMENT-KIND
  :POOL-WORKER-LIFECYCLE-DEVELOPMENT-LARGE :DEVELOPMENT-MANIFEST-KIND
  :POOL-CONTROLLER-DEVELOPMENT-MANIFEST :PROCESS-MANIFEST-KIND
  :POOL-WORKER-LIFECYCLE-PROCESS-MANIFEST :WHOLE-FILE-MANIFEST-KIND
  :POOL-WORKER-LIFECYCLE-WHOLE-FILE-MANIFEST)
 :LIMITS
 (:LOGICAL-BEGIN-ONLY :GENERIC-FAMILY-DOES-NOT-EXPAND-PRODUCT-SCOPE
  :ORIGINAL-PROOF-AND-STATUS-PRESERVED :NO-NATIVE-PARK-WAKE))
