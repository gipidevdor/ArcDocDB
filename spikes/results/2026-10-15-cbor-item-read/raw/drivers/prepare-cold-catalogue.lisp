(defparameter *specs*
  '((:scalar (0) 1 0)
    (:text (98 195 169) 1 0)
    (:array (130 0 245) 3 1)
    (:map (162 97 97 0 97 98 129 244) 6 2)
    (:tag-chain (192 193 129 97 122) 4 1)
    (:mixed-array (132 32 249 60 0 66 0 255 160) 5 2)))
(let* ((fixtures
         (loop for (name item nodes peak) in *specs*
               for next = (+ 2 (length item))
               for buffer = (append '(165 165) item '(255 28 24 0 165 165))
               for token = (+ (* nodes 17) (* peak 257) (* next 65537)
                              (loop for byte in buffer for weight from 1 sum (* byte weight)))
               collect (list :name name :item-literal item :nodes nodes :peak peak :next next
                             :start 2 :end (+ next 4) :tail-literal '(255 28 24 0)
                             :full-buffer-literal buffer :token token)))
       (data
         (list :schema-version 1 :kind :cbor-item-pre-product-catalogue
               :method-blob "a67a79bf4fefe11c4778cd881eb5279a006966ca"
               :method-commit "03dbc4e2" :chronology :frozen-before-reading-item-product
               :api "leggi-item-cbor-minimo" :result-policy :exact-three-nodes-peak-next
               :byte-budget-policy :whole-authorized-window-including-tail
               :benchmark '(:iterations 1024 :warmup 64 :replicas 5 :start 2
                            :prefix-sentinel 165 :physical-tail-sentinel 165
                            :token-nodes-weight 17 :token-peak-weight 257 :token-next-weight 65537
                            :buffer-token-weight :physical-index-plus-one
                            :workspace-scalars (:cursor :top :nodes :depth :peak-depth :pending-tag))
               :fixtures fixtures
               :mutation-semantics
               '((:name "generic-scan" :defect :minimality-disabled)
                 (:name "drain-on-physical-end" :defect :root-completion-requires-window-eof)
                 (:name "next-equals-end" :defect :next-skips-unvalidated-tail)
                 (:name "node-budget-ignored" :defect :configured-node-budget-replaced-by-maximum)
                 (:name "depth-budget-ignored" :defect :configured-depth-replaced-by-maximum)
                 (:name "byte-budget-ignored" :defect :authorized-window-budget-replaced-by-maximum)
                 (:name "start-skipped" :defect :source-start-ignored)
                 (:name "extra-return-value" :defect :extra-nil-with-copy-only-coherent-ftype))
               :limits '(:no-new-product-or-corpus-read :no-product-load-or-execution
                         :tail-not-validated :exact-scanner-not-an-oracle
                         :no-result-or-performance-inferred))))
  (with-open-file (out "spikes/out/cbor-item-read-20261015/drivers/fixtures-and-mutations.lisp"
                       :direction :output :if-exists :error :if-does-not-exist :create)
    (let ((*print-readably* t)) (write data :stream out :pretty t) (terpri out)))
  (let ((*print-readably* t)) (write fixtures :pretty t) (terpri)))
