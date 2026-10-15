(:SCHEMA-VERSION 1 :KIND :POOL-WORKER-STEP-COMPONENT-MANIFEST :BASE
 "5be241d8f295e3c82df06e75c9b12e0bf75eb202" :QUALIFIED-SNAPSHOT
 #A((57) BASE-CHAR . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/") :PUBLIC-API
 ("arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool"
  "arcdocdb.scheduler.dispatch:prendi-collegamento-pool"
  "arcdocdb.scheduler.dispatch:collega-obbligo-pool"
  "arcdocdb.scheduler.dispatch:ricircola-collegamento-pool"
  "arcdocdb.scheduler.dispatch:inizia-obbligo-pool"
  "arcdocdb.scheduler.dispatch:passo-dispatcher-pool")
 :RUNTIME-SOURCES
 ("src/dispatch/package.lisp" "src/dispatch/types.lisp" "src/dispatch/build.lisp"
  "src/dispatch/claim.lisp" "src/dispatch/recycle.lisp" "src/dispatch/begin.lisp"
  "src/dispatch/step.lisp")
 :SCOPE
 (:SINGLE-OPERATIONAL-ENTRY :IDLE-CLAIMED-RESCHEDULE :TAGGED-CURSOR-COUNT :NIL-CURRENT-METADATA
  :NOTINLINE-UNTYPED-PHASE :NO-FALLTHROUGH :NO-IMPLICIT-BEGIN-POP-END-OR-RETRY)
 :QUALIFIED-SOURCE-INVENTORY
 ((:RELATIVE-PATH "CHANGELOG.md" :PATH
   #A((69) BASE-CHAR . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/CHANGELOG.md")
   :BYTES 22772 :SHA256 "7d7d5c0d386e4178fe735eef1781d24c80e810fd877c8c82cdb75e62f53a58d1"
   :GIT-BLOB "cc6cfc829996fe57482e2430a0952f49c9d5d4b5")
  (:RELATIVE-PATH "arcdocdb.asd" :PATH
   #A((69) BASE-CHAR . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/arcdocdb.asd")
   :BYTES 17450 :SHA256 "35df1308676510bde78858c31c756b3f976f8ee0aeb17d8e520d51f7f8506fd0"
   :GIT-BLOB "cd8ff016298d3da2958455c06a9fcc17fa2bce3d")
  (:RELATIVE-PATH "docs/implementazione/README.md" :PATH
   #A((87) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/docs/implementazione/README.md")
   :BYTES 11412 :SHA256 "3b87337c4bfb7e44c8ca33ef57c0a5eec35b7c1d523feb8fcb42cdaa0bc0f428"
   :GIT-BLOB "ac16de880bc1bde7073d589017db8526a2955a08")
  (:RELATIVE-PATH "docs/implementazione/pool-dispatch.md" :PATH
   #A((94) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/docs/implementazione/pool-dispatch.md")
   :BYTES 5905 :SHA256 "5532aa81a4f3256146a85ef71a1e7375fbd9c7651fffe2392d9dcbbd9906d83b" :GIT-BLOB
   "b539520e7efdfad99de69e1473170db427f27031")
  (:RELATIVE-PATH "src/dispatch/begin.lisp" :PATH
   #A((80) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/src/dispatch/begin.lisp")
   :BYTES 1658 :SHA256 "4ae4bf8f6b7afe53af099a4b37ad75d253c05077f0cc7fbe39f4f1cab9f89a8d" :GIT-BLOB
   "1f54e226a0b7d5c796ef09b6336866e1a74b78b1")
  (:RELATIVE-PATH "src/dispatch/build.lisp" :PATH
   #A((80) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/src/dispatch/build.lisp")
   :BYTES 1176 :SHA256 "c78d31a753db78baea520e9ea0cccf6e88cad9cca8bc75261a6ff26c2ac01fe5" :GIT-BLOB
   "d1f2397592a8ba9c3af21394f191017e9fd2219c")
  (:RELATIVE-PATH "src/dispatch/claim.lisp" :PATH
   #A((80) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/src/dispatch/claim.lisp")
   :BYTES 2713 :SHA256 "224e4114b8b91affced874bea9c23cae5c79526e8ddae62e31a0cafcbb763682" :GIT-BLOB
   "f7717c94b765165eae4144042308e3639644ed5e")
  (:RELATIVE-PATH "src/dispatch/package.lisp" :PATH
   #A((82) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/src/dispatch/package.lisp")
   :BYTES 573 :SHA256 "98f56140a06f18597e125c13dfa9593f9594daf129bde17c26f75bf1f4252669" :GIT-BLOB
   "d240598b5ae98d3350505fe9f15eda8557db1c14")
  (:RELATIVE-PATH "src/dispatch/recycle.lisp" :PATH
   #A((82) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/src/dispatch/recycle.lisp")
   :BYTES 2612 :SHA256 "9fa3294cd28d1904cfb8db5153f93188b02f1bfbaf1800dad788731007c29ad0" :GIT-BLOB
   "adcd65ee5fd683d70a40b89b31a2edf7fc93994c")
  (:RELATIVE-PATH "src/dispatch/step.lisp" :PATH
   #A((79) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/src/dispatch/step.lisp")
   :BYTES 3096 :SHA256 "0d7653e6cbc0d93295f2ee1f84d142602af795933bf3147de9fc462c476212de" :GIT-BLOB
   "a4089abcd78bb811ca8279361af027e9822722c0")
  (:RELATIVE-PATH "src/dispatch/types.lisp" :PATH
   #A((80) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/src/dispatch/types.lisp")
   :BYTES 1872 :SHA256 "cc44882c565a89de08f5add79333868ebfca4fc3f97bf9104d36375d014d4720" :GIT-BLOB
   "09b357c8f46c67d8e57994e1fa37affdd25a1695")
  (:RELATIVE-PATH "tests/scheduler/pool-step.lisp" :PATH
   #A((87) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/tests/scheduler/pool-step.lisp")
   :BYTES 28210 :SHA256 "d3e71761c6c27e3f90fb445eb1994e3c567812ea5e512acf10e36232ef26fc31"
   :GIT-BLOB "d0ff803608990744408749722210e812f6268782")
  (:RELATIVE-PATH "tools/measure-pool-step.lisp" :PATH
   #A((85) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/tools/measure-pool-step.lisp")
   :BYTES 19012 :SHA256 "91cc73d2d1550312c60b9ff5b3e74561ce38dbcd3960ff013613ff811b86862c"
   :GIT-BLOB "cdcb410e27475282d157b0d64a4656ea6ad069a1")
  (:RELATIVE-PATH "docs/implementazione/pool-step.md" :PATH
   #A((90) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/docs/implementazione/pool-step.md")
   :BYTES 4151 :SHA256 "d01df081f65cd39a2bbff0377bfc737a76e3e098aae4f99702d1575df3a5775c" :GIT-BLOB
   "fc764576920a560b0ec6cdac9800b876191b42f6")
  (:RELATIVE-PATH "docs/implementazione/pool-step-metodo.md" :PATH
   #A((97) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/docs/implementazione/pool-step-metodo.md")
   :BYTES 3551 :SHA256 "a4eca30aab6b238a4367cbacadee9a88e9b7c517315c29ead4a178ae25f232d2" :GIT-BLOB
   "b86c360abb0cc4349e4831bf3ba91c1c7a72d386")
  (:RELATIVE-PATH "docs/implementazione/pool-step-revisione.md" :PATH
   #A((100) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-step-qualification-1792043614/docs/implementazione/pool-step-revisione.md")
   :BYTES 12601 :SHA256 "163c4e01d1601603b5814281792289fa0a896b57c973dd7186c6c00633d5c746"
   :GIT-BLOB "f16e3beb60d31637d25a07a6d585528bc1ecc6dc"))
 :ORIGINAL-INPUT
 (:PATH #A((43) BASE-CHAR . "spikes/out/pool-step-publication-input.lisp") :BYTES 3193 :SHA256
  "97c34b36b04fedbf46e967ec017404faca26189129aeee466099ab1e56b723b0" :GIT-BLOB
  "9d1ab60630b7499e473b441b2adb660cf162f79c")
 :GENERIC-COMPATIBILITY
 (:CATALOG-COMPONENT :WRITER-WORKER :QUALIFIED-SOURCE-KIND :POOL-WORKER-LIFECYCLE-QUALIFIED-SOURCES
  :FINAL-SOURCE-KIND :POOL-WORKER-LIFECYCLE-FINAL-SOURCES :DEVELOPMENT-SOURCE-KIND
  :POOL-WORKER-LIFECYCLE-DEVELOPMENT :LARGE-DEVELOPMENT-KIND
  :POOL-WORKER-LIFECYCLE-DEVELOPMENT-LARGE :DEVELOPMENT-MANIFEST-KIND
  :POOL-CONTROLLER-DEVELOPMENT-MANIFEST :PROCESS-MANIFEST-KIND
  :POOL-WORKER-LIFECYCLE-PROCESS-MANIFEST :WHOLE-FILE-MANIFEST-KIND
  :POOL-WORKER-LIFECYCLE-WHOLE-FILE-MANIFEST)
 :LIMITS
 (:LOGICAL-DISPATCH-STEP-ONLY :GENERIC-FAMILY-DOES-NOT-EXPAND-PRODUCT-SCOPE
  :ORIGINAL-PROOF-AND-STATUS-PRESERVED :NO-NATIVE-PARK-WAKE))
