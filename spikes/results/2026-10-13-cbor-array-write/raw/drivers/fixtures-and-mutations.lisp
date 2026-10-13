(:schema-version 1 :kind :cbor-array-pre-product-catalogue
 :method-blob "2f257c9e8a56a5182142934dada3f3b38b5bef65"
 :chronology :frozen-before-reading-array-product
 :benchmark (:iterations 1024 :warmup 64 :replicas 5 :start 2 :sentinel 165
             :residual 2 :physical-tail 2 :cold-value-count 1)
 :fixtures
 ((:name :empty :count 0 :source-literal nil :item-ends-literal nil
   :wire-literal (128) :token 4512)
  (:name :scalar :count 1 :source-literal (0) :item-ends-literal (1)
   :wire-literal (129 0) :token 5176)
  (:name :five-types :count 5 :source-literal (0 56 24 97 65 245 249 62 0)
   :item-ends-literal (1 3 5 6 9)
   :wire-literal (133 0 56 24 97 65 245 249 62 0) :token 17476)
  (:name :twenty-four-scalars :count 24 :source-repeat (24 0)
   :item-ends-arithmetic (1 1 24) :wire-prefix-literal (152 24)
   :wire-repeat (24 0) :token 21205)
  (:name :two-hundred-fifty-six-scalars :count 256 :source-repeat (256 0)
   :item-ends-arithmetic (1 1 256) :wire-prefix-literal (153 1 0)
   :wire-repeat (256 0) :token 175129)
  (:name :array-tag-text :count 3 :source-literal (130 0 1 192 0 98 195 169)
   :item-ends-literal (3 5 8) :wire-literal (131 130 0 1 192 0 98 195 169)
   :token 16370))
 :mutation-semantics
 ((:name "physical-capacity" :defect :physical-tail-counted-as-span)
  (:name "wrong-major" :defect :header-major-three-instead-of-four)
  (:name "wrong-count" :defect :header-count-incremented)
  (:name "scan-omitted" :defect :children-not-scanned-before-write)
  (:name "overlap-without-header" :defect :overlap-check-excludes-array-header)
  (:name "item-ends-unchecked" :defect :monotonicity-bounds-last-not-validated)
  (:name "root-node-excluded" :defect :node-budget-omits-root)
  (:name "extra-return-value" :defect :extra-nil-with-copy-only-coherent-ftype))
 :limits (:no-array-product-read :no-product-execution :no-results-inferred))
