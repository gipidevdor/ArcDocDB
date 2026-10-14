(:SCHEMA-VERSION 1 :KIND :CBOR-TAG-STATIC-TARGET-DIFFS :STATUS :OK
 :SOURCE-FILES
 (("src/codec/cbor-tag-input.lisp" "6dfad07035ac8040b2aec0a455c175ea15dfd9ad")
  ("src/codec/cbor-tag-write.lisp" "16b91fc27eabafd7ff12bfb0a56ed34208c2bd4b"))
 :MATERIALIZED-CATALOGUE-BLOB "60b7970c18a1d17642d1efc39f5068b5e10f181d"
 :MUTANTS
 ((:NAME "physical-capacity" :ORIGINAL "src/codec/cbor-tag-input.lisp"
   :SOURCE-BLOB "6dfad07035ac8040b2aec0a455c175ea15dfd9ad" :AFTER
   "spikes/out/cbor-tag-write-20261014/drivers/target-diffs/physical-capacity.after.lisp.txt"
   :AFTER-BLOB "9a6baf2ff226fd16cce6a196b2efbb208c9201cf" :PATCH
   "spikes/out/cbor-tag-write-20261014/drivers/target-diffs/physical-capacity.patch"
   :PATCH-BLOB "b7c8d0d8925d393ac39c855506851ac38a2b217b" :REPLACEMENT-COUNT 1
   :COMPILED NIL :LOADED NIL)
  (:NAME "wrong-major" :ORIGINAL "src/codec/cbor-tag-write.lisp" :SOURCE-BLOB
   "16b91fc27eabafd7ff12bfb0a56ed34208c2bd4b" :AFTER
   "spikes/out/cbor-tag-write-20261014/drivers/target-diffs/wrong-major.after.lisp.txt"
   :AFTER-BLOB "ec6ae78a852808bb1d97ae69498cb612b162f4bf" :PATCH
   "spikes/out/cbor-tag-write-20261014/drivers/target-diffs/wrong-major.patch"
   :PATCH-BLOB "c53e3a5d79692a2600a79cedeb5f61aa6f3e1f51" :REPLACEMENT-COUNT 1
   :COMPILED NIL :LOADED NIL)
  (:NAME "swapped-words" :ORIGINAL "src/codec/cbor-tag-write.lisp" :SOURCE-BLOB
   "16b91fc27eabafd7ff12bfb0a56ed34208c2bd4b" :AFTER
   "spikes/out/cbor-tag-write-20261014/drivers/target-diffs/swapped-words.after.lisp.txt"
   :AFTER-BLOB "07f51fc0219f17e41f3286b0a41ac58cac738e6d" :PATCH
   "spikes/out/cbor-tag-write-20261014/drivers/target-diffs/swapped-words.patch"
   :PATCH-BLOB "8480fa5f592511e35add7e942f828cb5c4032425" :REPLACEMENT-COUNT 1
   :COMPILED NIL :LOADED NIL)
  (:NAME "scan-omitted" :ORIGINAL "src/codec/cbor-tag-write.lisp" :SOURCE-BLOB
   "16b91fc27eabafd7ff12bfb0a56ed34208c2bd4b" :AFTER
   "spikes/out/cbor-tag-write-20261014/drivers/target-diffs/scan-omitted.after.lisp.txt"
   :AFTER-BLOB "eab2b4465b9bdde5c356e3b658ca0c2885447903" :PATCH
   "spikes/out/cbor-tag-write-20261014/drivers/target-diffs/scan-omitted.patch"
   :PATCH-BLOB "ec39f8b9f915ff6994fe7f69674cd317edcb6849" :REPLACEMENT-COUNT 1
   :COMPILED NIL :LOADED NIL)
  (:NAME "overlap-without-header" :ORIGINAL "src/codec/cbor-tag-input.lisp"
   :SOURCE-BLOB "6dfad07035ac8040b2aec0a455c175ea15dfd9ad" :AFTER
   "spikes/out/cbor-tag-write-20261014/drivers/target-diffs/overlap-without-header.after.lisp.txt"
   :AFTER-BLOB "8f51bcdcecc2293c038c10a917146617ba2034bc" :PATCH
   "spikes/out/cbor-tag-write-20261014/drivers/target-diffs/overlap-without-header.patch"
   :PATCH-BLOB "8f2b86d30b8387101c8f8eb67699ab4cba6bf875" :REPLACEMENT-COUNT 1
   :COMPILED NIL :LOADED NIL)
  (:NAME "root-node-excluded" :ORIGINAL "src/codec/cbor-tag-write.lisp"
   :SOURCE-BLOB "16b91fc27eabafd7ff12bfb0a56ed34208c2bd4b" :AFTER
   "spikes/out/cbor-tag-write-20261014/drivers/target-diffs/root-node-excluded.after.lisp.txt"
   :AFTER-BLOB "524fc3192facbbe9874d56f42ae4546400bf458e" :PATCH
   "spikes/out/cbor-tag-write-20261014/drivers/target-diffs/root-node-excluded.patch"
   :PATCH-BLOB "e3d1fe62bf1c52c52d89d30512a47095c671c6e4" :REPLACEMENT-COUNT 1
   :COMPILED NIL :LOADED NIL)
  (:NAME "tag-depth-charged" :ORIGINAL "src/codec/cbor-tag-write.lisp"
   :SOURCE-BLOB "16b91fc27eabafd7ff12bfb0a56ed34208c2bd4b" :AFTER
   "spikes/out/cbor-tag-write-20261014/drivers/target-diffs/tag-depth-charged.after.lisp.txt"
   :AFTER-BLOB "834b512b26a8e78885dbd3721125b7bd4953a3da" :PATCH
   "spikes/out/cbor-tag-write-20261014/drivers/target-diffs/tag-depth-charged.patch"
   :PATCH-BLOB "5cfcb125c7052d2593763dc34344ea6006a6c93f" :REPLACEMENT-COUNT 1
   :COMPILED NIL :LOADED NIL)
  (:NAME "extra-return-value" :ORIGINAL "src/codec/cbor-tag-write.lisp"
   :SOURCE-BLOB "16b91fc27eabafd7ff12bfb0a56ed34208c2bd4b" :AFTER
   "spikes/out/cbor-tag-write-20261014/drivers/target-diffs/extra-return-value.after.lisp.txt"
   :AFTER-BLOB "95fc872071c980f9997d74ca35f32e35ab6e6ffe" :PATCH
   "spikes/out/cbor-tag-write-20261014/drivers/target-diffs/extra-return-value.patch"
   :PATCH-BLOB "098e1b470142d5b58517bf98ff55939878f82ba7" :REPLACEMENT-COUNT 1
   :COMPILED NIL :LOADED NIL))
 :PRODUCT-FILES-WRITTEN NIL :NO-CORPUS-BODIES-READ T :CAMPAIGN-EXECUTED NIL)
