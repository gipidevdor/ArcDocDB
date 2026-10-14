(:schema-version 1 :kind :cbor-tag-pre-product-catalogue
 :method-blob "3175390e496173398781bf8b39170cb33892125f"
 :chronology :frozen-before-reading-tag-product
 :api "scrivi-tag-cbor-minimo"
 :tag-policy :two-u32-words :depth-policy :tag-does-not-add-container-level
 :benchmark (:iterations 1024 :warmup 64 :replicas 5 :start 2 :sentinel 165
             :residual 2 :physical-tail 2 :cold-value-count 1)
 :fixtures
 ((:name :scalar-small :high 0 :low 1 :source-literal (0)
   :wire-literal (193 0) :next 4 :token 5368)
  (:name :text-24 :high 0 :low 24 :source-literal (98 195 169)
   :wire-literal (216 24 98 195 169) :next 7 :token 10359)
  (:name :self-described-map :high 0 :low 55799 :source-literal (160)
   :wire-literal (217 217 247 160) :next 6 :token 9825)
  (:name :array-65536 :high 0 :low 65536 :source-literal (130 0 1)
   :wire-literal (218 0 1 0 0 130 0 1) :next 10 :token 10464)
  (:name :bytes-high-one :high 1 :low 0 :source-literal (66 0 255)
   :wire-literal (219 0 0 0 1 0 0 0 0 66 0 255) :next 14 :token 16425)
  (:name :tag-chain-container :high 4294967295 :low 4294967295
   :source-literal (192 193 130 97 97 245)
   :wire-literal (219 255 255 255 255 255 255 255 255 192 193 130 97 97 245)
   :next 17 :token 43144))
 :mutation-semantics
 ((:name "physical-capacity" :defect :physical-tail-counted-as-span)
  (:name "wrong-major" :defect :header-major-five-instead-of-six)
  (:name "swapped-words" :defect :tag-high-and-low-words-swapped)
  (:name "scan-omitted" :defect :content-not-scanned-before-write)
  (:name "overlap-without-header" :defect :overlap-check-excludes-tag-header)
  (:name "root-node-excluded" :defect :node-budget-omits-tag-root)
  (:name "tag-depth-charged" :defect :tag-consumes-one-container-depth-level)
  (:name "extra-return-value" :defect :extra-nil-with-copy-only-coherent-ftype))
 :limits (:no-tag-product-read :no-product-execution :no-results-inferred
          :no-application-tag-semantics-or-deterministic-document-qualification))
