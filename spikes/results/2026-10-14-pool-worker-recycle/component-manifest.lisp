(:SCHEMA-VERSION 1 :KIND :POOL-WORKER-RECYCLE-COMPONENT-MANIFEST :BASE
 "a5715a1aa0b2571d650d1b794e9bb7b7324e951e" :QUALIFIED-SNAPSHOT
 #A((60) BASE-CHAR . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/") :PUBLIC-API
 ("arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool"
  "arcdocdb.scheduler.dispatch:prendi-collegamento-pool"
  "arcdocdb.scheduler.dispatch:collega-obbligo-pool"
  "arcdocdb.scheduler.dispatch:ricircola-collegamento-pool")
 :RUNTIME-SOURCES
 ("src/dispatch/package.lisp" "src/dispatch/types.lisp" "src/dispatch/build.lisp"
  "src/dispatch/claim.lisp" "src/dispatch/recycle.lisp")
 :SCOPE
 (:SINGLE-READY-TRANSFER :RESCHEDULE-ONLY :LIFECYCLE-INDEPENDENT :DELEGATED-C1-RECYCLE
  :DIRECT-ORDINAL-ROUTING :NOTINLINE-UNTYPED-STATUS-CHECK :NO-IMPLICIT-CLAIM-OR-BEGIN)
 :QUALIFIED-SOURCE-INVENTORY
 ((:RELATIVE-PATH "CHANGELOG.md" :PATH
   #A((72) BASE-CHAR . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/CHANGELOG.md")
   :BYTES 19136 :SHA256 "3e5a5dcb2c1c17d5be0deb4bb75bda72b23380e8ee0d91629b44879267df0b35"
   :GIT-BLOB "dba1bc4ebacb24b7cecb11d344f3fc8235034222")
  (:RELATIVE-PATH "arcdocdb.asd" :PATH
   #A((72) BASE-CHAR . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/arcdocdb.asd")
   :BYTES 15798 :SHA256 "ef5423225107a6b33e1eb71d4713dfd77ad441e5af6e07cdb2c95bf0bbb0ffb6"
   :GIT-BLOB "056319d9fe4b6b02b72c76627e0eb99578e34e51")
  (:RELATIVE-PATH "docs/implementazione/README.md" :PATH
   #A((90) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/docs/implementazione/README.md")
   :BYTES 9991 :SHA256 "866bee34870a0419f7750438af7374d6a858659aec851e35cef52541a8c740c9" :GIT-BLOB
   "0b08094c9a50c15cf3a6f597ff5ea5cb48b0f910")
  (:RELATIVE-PATH "docs/implementazione/pool-dispatch.md" :PATH
   #A((97) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/docs/implementazione/pool-dispatch.md")
   :BYTES 5168 :SHA256 "1637ddfee4a304e4683b41c36c4993babaf880c99643f3733cd7964eaf0cc294" :GIT-BLOB
   "5156c7f15add2f2fc1551b7d739e83b3d0bc4c7a")
  (:RELATIVE-PATH "src/dispatch/package.lisp" :PATH
   #A((85) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/src/dispatch/package.lisp")
   :BYTES 516 :SHA256 "7f1eea26b8d8fd34186a85cff9aebae5842dc731de45b361058e0af4788090e8" :GIT-BLOB
   "fe810cbefc4d0de0d1aabae5e26117dc70bd2a70")
  (:RELATIVE-PATH "src/dispatch/types.lisp" :PATH
   #A((83) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/src/dispatch/types.lisp")
   :BYTES 1872 :SHA256 "cc44882c565a89de08f5add79333868ebfca4fc3f97bf9104d36375d014d4720" :GIT-BLOB
   "09b357c8f46c67d8e57994e1fa37affdd25a1695")
  (:RELATIVE-PATH "src/dispatch/build.lisp" :PATH
   #A((83) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/src/dispatch/build.lisp")
   :BYTES 1176 :SHA256 "c78d31a753db78baea520e9ea0cccf6e88cad9cca8bc75261a6ff26c2ac01fe5" :GIT-BLOB
   "d1f2397592a8ba9c3af21394f191017e9fd2219c")
  (:RELATIVE-PATH "src/dispatch/claim.lisp" :PATH
   #A((83) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/src/dispatch/claim.lisp")
   :BYTES 2713 :SHA256 "224e4114b8b91affced874bea9c23cae5c79526e8ddae62e31a0cafcbb763682" :GIT-BLOB
   "f7717c94b765165eae4144042308e3639644ed5e")
  (:RELATIVE-PATH "src/dispatch/recycle.lisp" :PATH
   #A((85) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/src/dispatch/recycle.lisp")
   :BYTES 2612 :SHA256 "9fa3294cd28d1904cfb8db5153f93188b02f1bfbaf1800dad788731007c29ad0" :GIT-BLOB
   "adcd65ee5fd683d70a40b89b31a2edf7fc93994c")
  (:RELATIVE-PATH "tests/scheduler/pool-recycle.lisp" :PATH
   #A((93) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/tests/scheduler/pool-recycle.lisp")
   :BYTES 25923 :SHA256 "079a58b0c8850df0be62c71229e25d052fb716f36f1996e9e8ab2c4c2a38fa86"
   :GIT-BLOB "3c779589cd7df6ae1146c2ca50b70320093bbf4a")
  (:RELATIVE-PATH "tools/measure-pool-recycle.lisp" :PATH
   #A((91) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/tools/measure-pool-recycle.lisp")
   :BYTES 20280 :SHA256 "f9f33a86334719cf22a0c6d9f27ccae426895c247c67044ddf52b70200b05c7a"
   :GIT-BLOB "cb20f6d271889a9801106daf230ee934aaa7bf81")
  (:RELATIVE-PATH "docs/implementazione/pool-recycle.md" :PATH
   #A((96) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/docs/implementazione/pool-recycle.md")
   :BYTES 4318 :SHA256 "65da387e05a4179fc930e440f4068a6025c9afc5f22d7917ac5bc748457b44ff" :GIT-BLOB
   "c38c4f50f84907b380e9f57e291c9f8503efc5c2")
  (:RELATIVE-PATH "docs/implementazione/pool-recycle-metodo.md" :PATH
   #A((103) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/docs/implementazione/pool-recycle-metodo.md")
   :BYTES 4729 :SHA256 "a3abb270ad16b8eb2262411faba5091dbe4fbaea54c6b30bf376f1339d56babb" :GIT-BLOB
   "023722e1a91e1c0826867fe204eeb9eab72dc72e")
  (:RELATIVE-PATH "docs/implementazione/pool-recycle-revisione.md" :PATH
   #A((106) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/docs/implementazione/pool-recycle-revisione.md")
   :BYTES 12583 :SHA256 "b660a90542a75fa77390456b00b2be5bf458dadff147e6dbdedfcd0a65f28a90"
   :GIT-BLOB "fd875bca51e4fd0d58251c123cadb6417e82bd76"))
 :ORIGINAL-INPUT
 (:PATH #A((46) BASE-CHAR . "spikes/out/pool-recycle-publication-input.lisp") :BYTES 2786 :SHA256
  "3a942f4ebf4a7dfa85345df76f7f235f37799e448b1cf7b9170b8d0409d4956b" :GIT-BLOB
  "ec729bb6c2165765fa0b50c37b6a652825fc9437")
 :GENERIC-COMPATIBILITY
 (:CATALOG-COMPONENT :WRITER-WORKER :QUALIFIED-SOURCE-KIND :POOL-WORKER-LIFECYCLE-QUALIFIED-SOURCES
  :FINAL-SOURCE-KIND :POOL-WORKER-LIFECYCLE-FINAL-SOURCES :DEVELOPMENT-SOURCE-KIND
  :POOL-WORKER-LIFECYCLE-DEVELOPMENT :LARGE-DEVELOPMENT-KIND
  :POOL-WORKER-LIFECYCLE-DEVELOPMENT-LARGE :DEVELOPMENT-MANIFEST-KIND
  :POOL-CONTROLLER-DEVELOPMENT-MANIFEST :PROCESS-MANIFEST-KIND
  :POOL-WORKER-LIFECYCLE-PROCESS-MANIFEST :WHOLE-FILE-MANIFEST-KIND
  :POOL-WORKER-LIFECYCLE-WHOLE-FILE-MANIFEST)
 :LIMITS
 (:LOGICAL-RECYCLE-ONLY :GENERIC-FAMILY-DOES-NOT-EXPAND-PRODUCT-SCOPE
  :ORIGINAL-PROOF-AND-STATUS-PRESERVED :NO-NATIVE-PARK-WAKE))
