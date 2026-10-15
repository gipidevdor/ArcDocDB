(:schema-version 1 :kind :local-static-reading :qualification nil :independent nil
 :source-product-commit "242f47e8"
 :readings
 ((:scope :authority-and-values
   :observations (:prepared-stamp-is-txid :writer-seal-is-csn
                  :outcome-body-is-csn :resolved-decision-included
                  :closure-outcomes-included :no-new-visibility-or-durability))
  (:scope :boundaries-cost-and-completeness
   :observations (:exclude-tail :zero-present-distinct :full-u64
                  :closed-set-gated :no-new-writer-pass-or-io
                  :compacted-header-pass :archive-admission-unimplemented)))
 :c4-finding
 (:artifact "conservazione-verifica.lisp"
  :issue :diagnostic-count-after-destructive-nreverse
  :printed-count 1 :data-copy-count 4
  :retained-paths ("raccolta-processo.lisp" "raccolta-conservazione.lisp"
                   "raccolta.lisp" "archivio-verifica.lisp")
  :effect :diagnostic-only :copy-audit-status :ok
  :observation :reread-data-and-count-four-entries
  :source-policy :executed-helper-text-preserved-in-audit)
 :open (:dedicated-functional-cases :mcdc :fault-injection :allocation-and-performance
        :independent-review :whole-archive-csn-and-admission))
