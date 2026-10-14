(:schema-version 1 :kind :cbor-map-pre-product-catalogue
 :method-blob "636dd2706c2903542978606cf029e7198bf4dbb3"
 :method-commit "2968cdc8ef50e35f418b96d58e27b6a5ecf7fcb3"
 :chronology :frozen-before-reading-map-product
 :api "scrivi-mappa-cbor-minima"
 :count-policy :pairs
 :active-item-ends-policy :twice-count
 :benchmark (:iterations 1024 :warmup 64 :replicas 5 :start 2 :sentinel 165
             :residual 2 :physical-tail 2 :cold-value-count 1)
 :fixtures
 ((:name :empty :count 0 :source-literal nil :item-ends-literal nil
   :wire-literal (160) :token 4608)
  (:name :scalar-pair :count 1 :source-literal (0 1) :item-ends-literal (1 2)
   :wire-literal (161 0 1) :token 5938)
  (:name :two-mixed-pairs :count 2 :source-literal (97 97 1 97 98 130 244 245)
   :item-ends-literal (2 3 5 8)
   :wire-literal (162 97 97 1 97 98 130 244 245) :token 18549)
  (:name :twenty-four-pairs :count 24 :source-repeat (48 0)
   :item-ends-arithmetic (1 1 48) :wire-prefix-literal (184 24)
   :wire-repeat (48 0) :token 37165)
  (:name :two-hundred-fifty-six-pairs :count 256 :source-repeat (512 0)
   :item-ends-arithmetic (1 1 512) :wire-prefix-literal (185 1 0)
   :wire-repeat (512 0) :token 344441)
  (:name :array-tag-text-pair :count 1 :source-literal (130 0 1 192 98 195 169)
   :item-ends-literal (3 7) :wire-literal (161 130 0 1 192 98 195 169)
   :token 15337))
 :mutation-semantics
 ((:name "physical-capacity" :defect :physical-tail-counted-as-span)
  (:name "wrong-major" :defect :header-major-four-instead-of-five)
  (:name "wrong-count" :defect :header-item-count-instead-of-pair-count)
  (:name "scan-omitted" :defect :keys-and-values-not-scanned-before-write)
  (:name "overlap-without-header" :defect :overlap-check-excludes-map-header)
  (:name "item-ends-unchecked" :defect :monotonicity-bounds-last-not-validated)
  (:name "root-node-excluded" :defect :node-budget-omits-root)
  (:name "extra-return-value" :defect :extra-nil-with-copy-only-coherent-ftype))
 :limits (:no-map-product-read :no-product-execution :no-results-inferred
          :pair-order-preserved :no-key-sorting-or-uniqueness-qualification))
