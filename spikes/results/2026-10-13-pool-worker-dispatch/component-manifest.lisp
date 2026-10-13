(:SCHEMA-VERSION 1 :KIND :POOL-WORKER-DISPATCH-COMPONENT-MANIFEST :BASE
 "14fd7738c216e3a0bd3ce9612576b9b57d648f74" :QUALIFIED-SNAPSHOT
 #A((61) BASE-CHAR . "/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/") :PUBLIC-API
 ("arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool"
  "arcdocdb.scheduler.dispatch:prendi-collegamento-pool"
  "arcdocdb.scheduler.dispatch:collega-obbligo-pool")
 :RUNTIME-SOURCES
 ("src/dispatch/package.lisp" "src/dispatch/types.lisp" "src/dispatch/build.lisp"
  "src/dispatch/claim.lisp")
 :SCOPE
 (:IMMUTABLE-OWNER-ONLY-BINDING :SAME-CONTEXT-BEFORE-CLAIM :DELEGATED-POOL-CLAIM
  :DELEGATED-C1-ROUTING :CLAIMED-OBLIGATION-INDEPENDENT-OF-LIFECYCLE :NO-IMPLICIT-BEGIN)
 :QUALIFIED-SOURCE-INVENTORY
 ((:RELATIVE-PATH "CHANGELOG.md" :PATH
   #A((73) BASE-CHAR . "/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/CHANGELOG.md")
   :BYTES 17825 :SHA256 "9500d7f796a6a78a252b5415f6220dfe87d3ab37ebeac20f96204b1677368bc2"
   :GIT-BLOB "c7fa1335f04fd7806da3d3405c8b4c39c40efb3a")
  (:RELATIVE-PATH "arcdocdb.asd" :PATH
   #A((73) BASE-CHAR . "/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/arcdocdb.asd")
   :BYTES 14982 :SHA256 "0128c4955e2682cf22400c2995e0769072a57530c6d289aa258c8bac9a96cd4c"
   :GIT-BLOB "ce1876bff4d70d05eec584767a0ecbc39acf867c")
  (:RELATIVE-PATH "docs/implementazione/README.md" :PATH
   #A((91) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/docs/implementazione/README.md")
   :BYTES 9174 :SHA256 "020a1890831defa5ecb505e52aaed2ec83856229dc80c8834c16f134c8b27c6e" :GIT-BLOB
   "5dc5e7a9540dd93ec7ec347d3c78b4b2cbd64ac6")
  (:RELATIVE-PATH "docs/implementazione/pool-worker-claim.md" :PATH
   #A((102) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/docs/implementazione/pool-worker-claim.md")
   :BYTES 5260 :SHA256 "ededc2d612a211930efeafca8bbafcfe85c44f95dfd2962aa9041878f806f075" :GIT-BLOB
   "02681055d4c93e109c70e72cf094fd87a2a8b9e5")
  (:RELATIVE-PATH "src/dispatch/package.lisp" :PATH
   #A((86) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/src/dispatch/package.lisp")
   :BYTES 486 :SHA256 "acb5fd19599e89e821a89bcca8f94064f33cdc71cdfcf204aadcd4fb52dd795f" :GIT-BLOB
   "1f7a7cab1ff9d31b7532c45a4be203e27122b8d9")
  (:RELATIVE-PATH "src/dispatch/types.lisp" :PATH
   #A((84) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/src/dispatch/types.lisp")
   :BYTES 1872 :SHA256 "cc44882c565a89de08f5add79333868ebfca4fc3f97bf9104d36375d014d4720" :GIT-BLOB
   "09b357c8f46c67d8e57994e1fa37affdd25a1695")
  (:RELATIVE-PATH "src/dispatch/build.lisp" :PATH
   #A((84) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/src/dispatch/build.lisp")
   :BYTES 1176 :SHA256 "c78d31a753db78baea520e9ea0cccf6e88cad9cca8bc75261a6ff26c2ac01fe5" :GIT-BLOB
   "d1f2397592a8ba9c3af21394f191017e9fd2219c")
  (:RELATIVE-PATH "src/dispatch/claim.lisp" :PATH
   #A((84) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/src/dispatch/claim.lisp")
   :BYTES 2713 :SHA256 "224e4114b8b91affced874bea9c23cae5c79526e8ddae62e31a0cafcbb763682" :GIT-BLOB
   "f7717c94b765165eae4144042308e3639644ed5e")
  (:RELATIVE-PATH "tests/scheduler/dispatch.lisp" :PATH
   #A((90) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/tests/scheduler/dispatch.lisp")
   :BYTES 31966 :SHA256 "600eb0b5fdf9a52d020e2f4c638f0f3dba43d9d9711be73eaffff208578821eb"
   :GIT-BLOB "6a493f0022ac8c9b6117c2a62df49fa596194c7b")
  (:RELATIVE-PATH "tools/measure-pool-dispatch.lisp" :PATH
   #A((93) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/tools/measure-pool-dispatch.lisp")
   :BYTES 17792 :SHA256 "5fe1dac5eb192bf91cfaa39020f18cad4242d3384605150d312d6f1dd1555837"
   :GIT-BLOB "bddb449176d3b7b6ae946e841a0ca3202e6c28ef")
  (:RELATIVE-PATH "docs/implementazione/pool-dispatch.md" :PATH
   #A((98) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/docs/implementazione/pool-dispatch.md")
   :BYTES 4752 :SHA256 "1e8ae257234afd483f46d5ce3e9f13e904721981270741abe6576899c694e433" :GIT-BLOB
   "de9d8bae73540cd86d4bd36330c7800a9bde8ce3")
  (:RELATIVE-PATH "docs/implementazione/pool-dispatch-metodo.md" :PATH
   #A((105) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/docs/implementazione/pool-dispatch-metodo.md")
   :BYTES 3641 :SHA256 "c00510ab85c22fe7c542d37a0efc6fd7094885d3ec48a5a9478ae00f07455bb4" :GIT-BLOB
   "d94f69542c7685c30f91899889ce7dbb12783a15")
  (:RELATIVE-PATH "docs/implementazione/pool-dispatch-revisione.md" :PATH
   #A((108) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-dispatch-qualification-1791928508/docs/implementazione/pool-dispatch-revisione.md")
   :BYTES 12633 :SHA256 "d3818829222a72aec962e218db33ab03f58e03035c2b1a0fdd9bd79b7d057a47"
   :GIT-BLOB "33a30b807c66ec62c47fea6124c65126f693c91d"))
 :ORIGINAL-INPUT
 (:PATH #A((47) BASE-CHAR . "spikes/out/pool-dispatch-publication-input.lisp") :BYTES 2754 :SHA256
  "ca646217d068aafd16a991aa8e07648ddd91ace66a1e64e9765630d534452e6d" :GIT-BLOB
  "f20504693aac6f95a9d43f3ab592e715815f2eca")
 :GENERIC-COMPATIBILITY
 (:CATALOG-COMPONENT :WRITER-WORKER :QUALIFIED-SOURCE-KIND :POOL-WORKER-LIFECYCLE-QUALIFIED-SOURCES
  :FINAL-SOURCE-KIND :POOL-WORKER-LIFECYCLE-FINAL-SOURCES :DEVELOPMENT-SOURCE-KIND
  :POOL-WORKER-LIFECYCLE-DEVELOPMENT :LARGE-DEVELOPMENT-KIND
  :POOL-WORKER-LIFECYCLE-DEVELOPMENT-LARGE :DEVELOPMENT-MANIFEST-KIND
  :POOL-CONTROLLER-DEVELOPMENT-MANIFEST :PROCESS-MANIFEST-KIND
  :POOL-WORKER-LIFECYCLE-PROCESS-MANIFEST :WHOLE-FILE-MANIFEST-KIND
  :POOL-WORKER-LIFECYCLE-WHOLE-FILE-MANIFEST)
 :LIMITS
 (:LOGICAL-DISPATCH-ONLY :GENERIC-FAMILY-DOES-NOT-EXPAND-PRODUCT-SCOPE
  :ORIGINAL-PROOF-AND-STATUS-PRESERVED :NO-NATIVE-PARK-WAKE))
