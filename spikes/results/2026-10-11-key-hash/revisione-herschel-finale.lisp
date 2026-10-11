;;; DATI SCHEMA 1: revisione statica; non caricare/eseguire.
(:schema-version 1 :kind :static-review :reviewer :herschel
 :status :no-open-static-findings
 :commit "c9c75615d467c96808a0d4e9989d0ca209f64f7f"
 :delta-base "fdde3a9d2ca0bd8b86ffeb6a51e6340d3dce5140"
 :reading :bounded-final-product-delta
 :scope ("src/hash/blocks.lisp" "src/index/hash-seed.lisp" "src/index/hash-digests.lisp")
 :head-before "c9c75615d467c96808a0d4e9989d0ca209f64f7f"
 :head-after "344e8fb541a0e88b1cc9a470d2ba152dde4241ac"
 :head-unchanged nil :reviewed-file-hashes-stable t
 :head-change "Main avanzato; integrazione e modifiche esterne al delta non esaminate. ASDF del main escluso dalla stabilita finale del perimetro."
 :findings nil :open-findings nil
 :findings-history
 ((:id "HASH-R01" :priority :p1 :status :closed-static
   :original "Digest interno discordante lasciava OPEN tramite INVALID-ARGUMENT."
   :closure "hash-digests:47-48 converte solo INVALID-ARGUMENT del verificatore interno in FAULTED :primary-hash-source-digest; invarianti bancarie identiche.")
  (:id "HASH-R02" :priority :p2 :status :closed-static
   :original "Root NIL produceva TYPE-ERROR senza fail-stop."
   :closure "hash-digests:29 usa acquisisci-root: FAULTED :primary-index-missing-root prima di scratch/mappe.")
  (:id "HASH-R03" :priority :standard :status :closed-static
   :original "Relazioni degli helper garantite soltanto dalla API."
   :closure "Preflight relazionali e postcursori espliciti in blocchi/coda; cursore unico e limiti dimostrati. R04 chiude la propagazione al proprietario.")
  (:id "HASH-R04" :priority :p2 :status :closed-static
   :original "Asserzione kernel propagata con indice OPEN."
   :closure "hash-seed:24-25 cattura solo INVARIANT-VIOLATION, invalida il proprietario, ERROR sul medesimo oggetto condizione; usato da key:36 e map:45."))
 :handler-cases
 (:kernel-owner "Filtro solo INVARIANT-VIOLATION: invalidazione prima del rilancio identico; INVALID-ARGUMENT esterno non trasformato."
  :internal-verifier "Filtro solo INVALID-ARGUMENT: guasto tipizzato dell'indice; INVARIANT-VIOLATION del banco non riclassificata.")
 :cod-13 (:status :static-pass :limit 10
  :method "Base 1; selezioni/cicli/rami gestore; n-1 per AND/OR; conteggio manuale."
  :counts (("hash-blocks" 5) ("hash-tail" 7) ("hash-con-seme-indice" 2) ("calcola-digests-frammento" 8)))
 :cod-24 (:status :closed-static-for-reviewed-findings
  :evidence "Guardie pre/post significative e fail-stop del proprietario. Helper aritmetici elementari valutati tramite tipi e formule; nessuna asserzione tautologica richiesta.")
 :cod-50 (:status :closed-static-for-reported-gap
  :evidence "blocks:12 e tail:40 dichiarano INVARIANT-VIOLATION e ragioni span/progress; helper proprietario e API chiave descrivono il guasto.")
 :checklist
 ((:point 1 :status :static-pass :note "REQ/ADR coerenti; argomenti delle letture precedenti conservati.")
  (:point 2 :status :static-pass-runtime-pending :note "Invarianti espliciti; regressioni parent non eseguite dal revisore.")
  (:point 3 :status :static-pass-runtime-pending :note "R01/R02/R04 chiusi; condizioni originali preservate nei percorsi pertinenti.")
  (:point 4 :status :static-pass :note "2047 stripe; coda <=31 byte; C campioni e probe limitati da C; nessuna attesa.")
  (:point 5 :status :qualification-pending :note "Heap/boxing/GC non misurati; scratch manutenzione 80 byte payload.")
  (:point 6 :status :static-pass :note "Due u32; seed completo prima di scratch/mappe; scritture dopo verifica; mappe parziali private scartabili.")
  (:point 7 :status :inventory-static-pass-runtime-pending :note "HASH-D01..D12; nessuna copertura o MC/DC attestata.")
  (:point 8 :status :static-pass :note "Proprietari dichiarati; fail-stop del solo indice proprietario.")
  (:point 9 :status :runtime-pending :note "Annotazioni REQ; nessun gate eseguito o risultato parent accettato qui.")
  (:point 10 :status :static-pass-for-reviewed-findings :note "COD13/24/50 chiusi nel perimetro; qualifica COD01/30 pendente.")
  (:point 11 :status :static-pass :note "Nessun nuovo lock/I/O/attesa o stato condiviso tra Serie.")
  (:point 12 :status :not-applicable-static-pass :note "Nessuna scrittura durevole; seed lifecycle al controller."))
 :hash-algorithm :sha256 :hash-basis :actual-checkout-bytes
 :source-hashes
 (  (:path "src/hash/blocks.lisp" :sha256-before "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f" :sha256-after "5f5dff95ae6c34dfc15538c537ba2fa8d34ba2376ad66ad9975745ea13a2175f" :git-blob-at-c9 "f115b63c6089960e9857469475f821f3035a5ef2" :stable t)
  (:path "src/index/hash-seed.lisp" :sha256-before "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1" :sha256-after "ae86514101e95737747ba58a4f0c5dc1ddb44d2b3a18bceb8fd0d0756b57a7a1" :git-blob-at-c9 "5627b4179b115c008379aa3e60a4724e63f9657b" :stable t)
  (:path "src/index/hash-digests.lisp" :sha256-before "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673" :sha256-after "924bb7dab91ff56c1e909f2b06dff5f74b443ac6442e379498f29b25f1fa2673" :git-blob-at-c9 "6d05b467aee412f447308eb697daa7f4f5ec6f0d" :stable t))
 :activity (:product-executions 0 :test-executions 0 :build-executions 0 :benchmark-executions 0
  :product-modifications nil :test-modifications nil :contract-modifications nil :git-mutations nil
  :only-file-written "spikes/results/2026-10-11-key-hash/revisione-herschel-finale.lisp")
 :limits (:source-inspection-only :previous-checklist-reused-with-limits
          :no-integration-main-review :no-parent-test-results-attributed
          :no-runtime-heap-native-code-inline-limit-or-platform-qualification
          :no-lisp-report-evaluation :no-global-c1-certification))
