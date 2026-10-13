(:SCHEMA-VERSION 1 :KIND :POOL-WORKER-LIFECYCLE-CLOSURE-SOURCES :VERSION
 "900fa93d9e14a252e6a2b5a009d19728b2de34af" :PART 1 :PARTS 1 :SOURCES
 ((:PATH #A((39) BASE-CHAR . "spikes/out/lifecycle-close-records.lisp") :BYTES 6209 :SHA256
   "d2955e271c7789a60d1c2ba25e0b39c42254770732655f59758ffede391af3b5" :GIT-BLOB
   "75de45b6baa47497aebc62012585a974574f2350" :TEXT
   ";;;; Chiusura esplicita, dopo la prima pubblicazione; nessuna esecuzione al LOAD library.
;;;; Il manifesto nuovo conserva gli stati originali e tutte le impronte delle copie.
(require :asdf)
(let ((*features* (cons :pool-worker-lifecycle-publication-library *features*)))
  (load \"spikes/out/lifecycle-publication.lisp\"))
(in-package #:cl-user)

(defun lifecycle-close-status-fields (data)
  \"Proiezione dei campi presenti: nessuna inferenza o promozione di uno stato assente.\"
  (loop for key in '(:schema-version :kind :status :source-consistency :exit-code :test-count)
        when (loop for field on data by #'cddr thereis (eq (first field) key))
          append (list key (getf data key))))

(defun lifecycle-close-record-plan (record root destination)
  (let* ((plan (pool-publication-record-plan record root destination))
         (source (getf plan :source))
         (target (getf plan :target)))
    (when (probe-file target) (error \"Chiusura non sovrascrive record presenti: ~A\" target))
    (dolist (leaf '(\"report.lisp\" \"conservazione.lisp\"))
      (multiple-value-bind (proof data)
          (worker-evidence-byte-proof (merge-pathnames leaf source))
        (setf (getf plan (if (string= leaf \"report.lisp\") :report-proof :conservation-proof))
              proof)
        (setf (getf plan (if (string= leaf \"report.lisp\") :report-status :conservation-status))
              (lifecycle-close-status-fields data))))
    plan))

(defun lifecycle-close-copy-record (plan)
  (dolist (entry '((\"report.lisp\" :report-proof) (\"conservazione.lisp\" :conservation-proof)))
    (unless (worker-evidence-proofs-equal-p
             (getf plan (second entry))
             (worker-evidence-byte-proof (merge-pathnames (first entry) (getf plan :source))))
      (error \"Record cambiato dopo il piano di chiusura: ~A\" (getf plan :source))))
  (let ((copied (pool-publication-copy-record plan)))
    (dolist (entry '((\"report.lisp\" :report-proof) (\"conservazione.lisp\" :conservation-proof)))
      (unless (and (worker-evidence-proofs-equal-p
                    (getf plan (second entry))
                    (worker-evidence-byte-proof
                     (merge-pathnames (first entry) (getf plan :target))))
                   (worker-evidence-proofs-equal-p
                    (getf plan (second entry))
                    (worker-evidence-byte-proof
                     (merge-pathnames (first entry) (getf plan :source)))))
        (error \"Bytes di chiusura diversi dagli originali pianificati: ~A\" (getf plan :target))))
    (append copied
            (list :original-report-status-fields (getf plan :report-status)
                  :original-conservation-status-fields (getf plan :conservation-status)
                  :copied-files (lifecycle-publication-files (getf plan :target))))))

(defun lifecycle-close-records (input-path stem records
                               &key (record-root (uiop:getcwd)) extra-sources)
  \"Aggiunge prove originali in directory nuove e produce un manifesto di chiusura esclusivo.\"
  (let* ((config (worker-read-raw-data input-path))
         (base (getf config :base))
         (destination (lifecycle-directory *lifecycle-publication-directory*))
         (root (lifecycle-directory record-root)))
    (unless (and (stringp base) (= 40 (length base))
                 (every (lambda (character) (digit-char-p character 16)) base)
                 (worker-leaf-p stem) records)
      (error \"Chiusura richiede base SHA40 dell'input, stem leaf e almeno un record.\"))
    (unless (= (length records)
               (length (remove-duplicates records :test #'string=
                                          :key (lambda (entry) (getf entry :name)))))
      (error \"Nomi dei record di chiusura duplicati.\"))
    (dolist (leaf (list (format nil \"~A.lisp\" stem) (format nil \"~A-file.lisp\" stem)))
      (when (probe-file (merge-pathnames leaf destination))
        (error \"Manifesto di chiusura già esistente: ~A\" leaf)))
    (let* ((plans (mapcar (lambda (record)
                           (lifecycle-close-record-plan record root destination)) records))
           (sources
             (worker-plan-source-bundles
              (remove-duplicates
               (append (list #p\"spikes/out/lifecycle-close-records.lisp\" input-path)
                       extra-sources) :test #'equal)
              (format nil \"~A-sources\" stem) :pool-worker-lifecycle-closure-sources :version base)))
      ;; Preflight delle collisioni anche per ogni bundle, prima della prima nuova copia.
      (dolist (plan sources)
        (when (probe-file (merge-pathnames (getf plan :leaf) destination))
          (error \"Bundle di chiusura già presente: ~A\" (getf plan :leaf))))
      (worker-validate-source-plans sources)
      (let ((copied (mapcar #'lifecycle-close-copy-record plans)))
        (pool-publication-write-plans sources destination)
        (worker-save-data
         (list :schema-version 1 :kind :pool-worker-lifecycle-closure-manifest
               :base base :input-source (worker-byte-record input-path)
               :processes copied :source-bundles (mapcar (lambda (plan) (getf plan :leaf)) sources)
               :limits '(:original-report-and-conservation-bytes :original-status-fields-only
                         :no-status-promotion :exclusive-new-process-directories
                         :sha256-bytes-git-blobs :original-gzip-payload-names))
         (merge-pathnames (format nil \"~A.lisp\" stem) destination))
        (lifecycle-publication-refresh-manifest
         base :stem (format nil \"~A-file\" stem) :directory destination)
        (format t \"Lifecycle closure: ~D original records copied and verified; manifest ~A.lisp.~%\"
                (length copied) stem)
        t))))

(unless (member :pool-worker-lifecycle-closure-library *features*)
  (let ((args (uiop:command-line-arguments)))
    (unless (and (>= (length args) 4) (evenp (- (length args) 2)))
      (error \"Uso: sbcl --script spikes/out/lifecycle-close-records.lisp input-plist stem name id [name id ...]\"))
    (lifecycle-close-records
     (pathname (first args)) (second args)
     (loop for (name id) on (cddr args) by #'cddr collect (list :name name :id id)))))
")
  (:PATH #A((44) BASE-CHAR . "spikes/out/pool-claim-publication-input.lisp") :BYTES 2424 :SHA256
   "38f3ea855c52d1e5aff6a2f766b182980b7140107131ed223ce7fdfe5694e7b3" :GIT-BLOB
   "4a4f4f6741b66c253c6a547a7d9245348dd50887" :TEXT
   "(:base \"900fa93d9e14a252e6a2b5a009d19728b2de34af\" :snapshot \"/tmp/arcdocdb-pool-claim-qualification-1791924432\" :paths (\"CHANGELOG.md\" \"arcdocdb.asd\" \"docs/implementazione/README.md\" \"docs/implementazione/pool-worker-lifecycle.md\" \"src/scheduler/package.lisp\" \"docs/implementazione/pool-worker-claim.md\" \"docs/implementazione/pool-worker-claim-metodo.md\" \"src/scheduler/pool-claim.lisp\" \"tests/scheduler/pool-claim.lisp\" \"tools/measure-pool-claim.lisp\") :final-paths (\"CHANGELOG.md\" \"arcdocdb.asd\" \"docs/implementazione/README.md\" \"docs/implementazione/pool-worker-lifecycle.md\" \"src/scheduler/package.lisp\" \"docs/implementazione/pool-worker-claim.md\" \"docs/implementazione/pool-worker-claim-metodo.md\" \"src/scheduler/pool-claim.lisp\" \"tests/scheduler/pool-claim.lisp\" \"tools/measure-pool-claim.lisp\" \"docs/implementazione/pool-worker-claim-revisione.md\" \"docs/implementazione/pool-worker-claim-risultati.md\") :records ((:name \"selftest\" :id \"4000913361-command-73795-0\") (:name \"coverage\" :id \"4000913361-command-73794-0\") (:name \"benchmark\" :id \"4000913399-command-74843-0\") (:name \"coverage-reader\" :id \"4000913465-command-76699-0\") (:name \"check-core\" :id \"4000913331-command-73208-0\") (:name \"integrated-build\" :id \"4000913736-command-84415-0\" :root \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB\")) :benchmark-report \"/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/pool-claim-measure/bench-attempt-01/report.lisp\" :evidence ((:name \"coverage-audit\" :source \"/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/pool-claim-measure/coverage-attempt-01/coverage-audit.lisp\") (:name \"claim-coverage-audit\" :source \"/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/pool-claim-measure/coverage-attempt-01/coverage-claim-audit.lisp\")) :evidence-directories ((:name \"check-core-spikes\" :source \"/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/4000913535-check-78876-0\")) :extra-development-sources (\"/tmp/arcdocdb-pool-claim-qualification-1791924432/spikes/out/pool-claim-fullcheck-attempt-01.log\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/pool-claim-integrated-attempt-01.log\") :extra-sources (\"/tmp/arcdocdb-pool-claim-state.json\" \"spikes/out/pool-command-summary.lisp\" \"tools/measure-pool-lifecycle.lisp\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/lifecycle-measure/lifecycle-coverage-reader.lisp\"))
")
  (:PATH #A((38) BASE-CHAR . "spikes/out/pool-claim-publication.lisp") :BYTES 5968 :SHA256
   "6dff21fb4e24f2d985a13005df3efbede145841b403f82743629a2e300efde52" :GIT-BLOB
   "54e7ec4dfff42944e69991c6e70b945e703d3ee3" :TEXT
   ";;;; Wrapper claim: riusa byte per byte il publisher C4 lifecycle verificato.
;;;; Solo esecuzione esplicita dopo freeze; feature :pool-worker-claim-publication-library.
(require :asdf)
(let ((*features* (cons :pool-worker-lifecycle-publication-library *features*)))
  (load \"spikes/out/lifecycle-publication.lisp\"))
(in-package #:cl-user)

(defparameter *pool-worker-claim-publication-directory*
  #p\"spikes/results/2026-10-13-pool-worker-claim/\")
(defparameter *pool-worker-claim-development-roots*
  '(#p\"spikes/out/pool-claim-dev/\" #p\"spikes/out/pool-claim-tests/\"
    #p\"spikes/out/pool-claim-measure/\"))
(defparameter *pool-worker-claim-development-required*
  '(#p\"spikes/out/pool-claim-dev/compile-product-attempt-01.log\"
    #p\"spikes/out/pool-claim-dev/lint-attempt-01.log\"
    #p\"spikes/out/pool-claim-dev/trace-attempt-01.log\"
    #p\"spikes/out/pool-claim-tests/attempt-01.log\"
    #p\"spikes/out/pool-claim-tests/attempt-02.log\"
    #p\"spikes/out/pool-claim-tests/attempt-03.log\"))

(defun pool-worker-claim-publication-input (config)
  \"Adatta solo i parametri del publisher generico; l'input originale resta conservato.\"
  (let* ((adapted (copy-list config))
         (snapshot (pool-publication-root (getf config :snapshot))))
    (unless (getf adapted :development-roots)
      (setf (getf adapted :development-roots)
            (append *pool-worker-claim-development-roots*
                    (list (merge-pathnames \"spikes/out/pool-claim-measure/\" snapshot)))))
    (unless (getf adapted :development-required)
      (setf (getf adapted :development-required) *pool-worker-claim-development-required*))
    (setf (getf adapted :extra-sources)
          (remove-duplicates
           (append (getf config :extra-sources)
                   '(#p\"spikes/out/pool-claim-publication.lisp\"
                     #p\"spikes/out/pool-claim-closure-run.lisp\"
                     #p\"spikes/out/lifecycle-close-records.lisp\")) :test #'equal))
    adapted))

(defun pool-worker-claim-component-manifest (config input-path)
  \"Identifica il componente concreto e le impronte esatte delle fonti frozen qualificate.\"
  (let* ((snapshot (pool-publication-root (getf config :snapshot)))
         (paths (getf config :paths))
         (sources
           (mapcar (lambda (path)
                     (let ((source (pool-publication-source path snapshot)))
                       (lifecycle-regular-file source)
                       (append (list :relative-path (enough-namestring source snapshot))
                               (worker-byte-record source)))) paths)))
    (unless (find \"src/scheduler/pool-claim.lisp\" sources :test #'string=
                  :key (lambda (source) (getf source :relative-path)))
      (error \"Il componente claim richiede il suo sorgente nel set frozen qualificato.\"))
    (list :schema-version 1 :kind :pool-worker-claim-component-manifest
          :base (getf config :base) :qualified-snapshot (namestring snapshot)
          :public-api '(\"arcdocdb.scheduler:prendi-writer-pool\")
          :runtime-sources '(\"src/scheduler/pool-claim.lisp\")
          :scope '(:owner-only-logical-claim-admission :full-idle-validation
                   :activation-gate :inactive-no-ready-pop :delegated-c1-claim)
          :qualified-source-inventory sources :original-input (worker-byte-record input-path)
          :generic-compatibility
          '(:catalog-component :writer-worker
            :qualified-source-kind :pool-worker-lifecycle-qualified-sources
            :final-source-kind :pool-worker-lifecycle-final-sources
            :development-source-kind :pool-worker-lifecycle-development
            :large-development-kind :pool-worker-lifecycle-development-large
            :development-manifest-kind :pool-controller-development-manifest
            :process-manifest-kind :pool-worker-lifecycle-process-manifest
            :whole-file-manifest-kind :pool-worker-lifecycle-whole-file-manifest)
          :limits '(:claim-admission-only :generic-family-does-not-expand-product-scope
                    :original-proof-and-status-preserved :no-native-park-wake))))

(defun pool-worker-claim-validate-component (component)
  (dolist (source (append (getf component :qualified-source-inventory)
                         (list (getf component :original-input))))
    (unless (worker-byte-records-equal-p source (worker-byte-record (getf source :path)))
      (error \"Fonte/input del manifesto claim mutato: ~A\" (getf source :path))))
  t)

(defun pool-worker-claim-publication-run (config input-path)
  \"Namespace claim nuovo; prove originali e writer esclusivo sono quelli C4 già verificati.\"
  (let* ((adapted (pool-worker-claim-publication-input config))
         (component (pool-worker-claim-component-manifest config input-path))
         (*lifecycle-publication-directory* *pool-worker-claim-publication-directory*))
    (when (> (length (worker-data-octets component)) 1048576)
      (error \"Manifesto componente oltre il budget plain prima della pubblicazione.\"))
    (lifecycle-publication-run adapted input-path)
    (pool-worker-claim-validate-component component)
    (worker-save-data component (merge-pathnames \"component-manifest.lisp\"
                                                *lifecycle-publication-directory*))
    (pool-worker-claim-validate-component component)
    (lifecycle-publication-refresh-manifest
     (getf config :base) :stem \"manifesto-componente-file\"
     :directory *lifecycle-publication-directory*)
    (format t \"Pool worker claim component: frozen sources and generic compatibility recorded.~%\")
    t))

(unless (member :pool-worker-claim-publication-library *features*)
  (let ((args (uiop:command-line-arguments)))
    (unless (= (length args) 1)
      (error \"Uso: sbcl --script spikes/out/pool-claim-publication.lisp input-plist.lisp\"))
    (let* ((path (pathname (first args))) (config (worker-read-raw-data path)))
      (pool-worker-claim-publication-run config path))))
")
  (:PATH #A((38) BASE-CHAR . "spikes/out/pool-claim-closure-run.lisp") :BYTES 1422 :SHA256
   "e9e77982ff6377f456a7da9a438e7ddb11c8028f658f98fd6dba463778e9dbde" :GIT-BLOB
   "58d06bdf010776bb3ae2785816a2f223545f0d5e" :TEXT
   ";;;; Chiusura claim: stesso helper C4, con directory dinamica del namespace claim.
;;;; Input/source extra e risultati finali sono copiati in bundle lossless nuovi.
(require :asdf)
(let ((*features* (cons :pool-worker-claim-publication-library
                       (cons :pool-worker-lifecycle-closure-library *features*))))
  (load \"spikes/out/pool-claim-publication.lisp\")
  (load \"spikes/out/lifecycle-close-records.lisp\"))
(in-package #:cl-user)

(defun pool-worker-claim-close-records (input-path stem records &key extra-sources)
  (let ((*lifecycle-publication-directory* *pool-worker-claim-publication-directory*))
    (lifecycle-close-records
     input-path stem records
     :extra-sources
     (remove-duplicates
      (append '(#p\"spikes/out/pool-claim-publication.lisp\"
                #p\"spikes/out/pool-claim-closure-run.lisp\"
                #p\"docs/implementazione/pool-worker-claim-risultati.md\")
              extra-sources) :test #'equal))))

(unless (member :pool-worker-claim-closure-library *features*)
  (let ((args (uiop:command-line-arguments)))
    (unless (and (>= (length args) 4) (evenp (- (length args) 2)))
      (error \"Uso: sbcl --script spikes/out/pool-claim-closure-run.lisp input-plist stem name id [name id ...]\"))
    (pool-worker-claim-close-records
     (pathname (first args)) (second args)
     (loop for (name id) on (cddr args) by #'cddr collect (list :name name :id id)))))
")
  (:PATH #A((51) BASE-CHAR . "docs/implementazione/pool-worker-claim-risultati.md") :BYTES 8112
   :SHA256 "958dc775a824652c1e844f32ff260b6dbdcbccb4151d112450964148a66991af" :GIT-BLOB
   "d1b07131d0ef3f831f86860ba6258f6bbc24b799" :TEXT "# Verifica della presa governata dal pool

La qualifica C3 segue [contratto](pool-worker-claim.md),
[metodo preregistrato](pool-worker-claim-metodo.md) e
[revisione indipendente](pool-worker-claim-revisione.md).
La copia congelata parte da `900fa93d9e14a252e6a2b5a009d19728b2de34af`
e conserva dieci file dell'incremento, con identità distinte dai documenti
finali aggiunti dopo. Gli originali sono nel
[catalogo della campagna](../../spikes/results/2026-10-13-pool-worker-claim/).

## Processi congelati

| Processo | Record | Esito |
|---|---|---|
| Compilazione strict e self-test C4 | [4000913361-command-73795-0](../../spikes/results/2026-10-13-pool-worker-claim/processes/selftest/report.lisp) | OK, STABLE, exit 0 |
| Copertura e suite scheduler | [4000913361-command-73794-0](../../spikes/results/2026-10-13-pool-worker-claim/processes/coverage/report.lisp) | OK, STABLE, exit 0 |
| Tre campagne del percorso normale | [4000913399-command-74843-0](../../spikes/results/2026-10-13-pool-worker-claim/processes/benchmark/report.lisp) | OK, STABLE, exit 0 |
| Lettore native/HTML strict e self-test | [4000913465-command-76699-0](../../spikes/results/2026-10-13-pool-worker-claim/processes/coverage-reader/report.lisp) | OK, STABLE, exit 0 |
| Controllo completo del repository | [4000913331-command-73208-0](../../spikes/results/2026-10-13-pool-worker-claim/processes/check-core/report.lisp) | OK, STABLE, exit 0 |

La suite scheduler passa **53 prove nominate: 41 esistenti e 12 nuove**.
Verifica ready realmente popolata, crescita e ritiro su owner distinti,
assenza di polling quando inattivo, tutti gli stati non-IDLE, IDLE incoerente,
parole del pool invalide e conflitto CAS. Conferma che una richiesta tardiva
lascia completare il singolo claim già autorizzato e viene applicata al
successivo IDLE. Bridge e ricircolo pieno conservano le lease, il debito e
il routing del writer successivo. Le FI al confine sono quiescenti e dichiarate;
il comando tardivo è un interleaving iniettato, non una gara casuale osservata.

Gli strumenti compilano senza warning/style-warning. I self-test verificano
oracoli separati per tutti i quattro valori della nuova API, rilevano
16777472 byte di allocazione deliberata e sink errati, distinguono il clock
sotto risoluzione e conservano raw parziali e destinazioni preesistenti.
Il lettore originale viene riusato invariato con uno scope esplicito nuovo;
i suoi casi negativi precedono la misura del prodotto.

Il controllo completo passa **1109 prove nominate del prodotto, due smoke
test e quattro fixture del linter**, oltre a lint, tracciabilità, link,
self-test degli strumenti, conservazione e dieci spike. Il processo dura
237,501985 secondi. I 1115 record di output con prefisso `ok` comprendono
le quattro fixture del linter; non vengono chiamati 1115 test del prodotto.

## Copertura

Il dato nativo SB-COVER e l'HTML concordano: **44/44 espressioni e 4/4 rami,
100%**, su tutto `src/scheduler/pool-claim.lisp` e il package. Nessuna
esclusione, nessun percorso mancante. Il nuovo file conta 43/43 espressioni
e 4/4 rami; il package conta 1/1 espressioni e nessun ramo. Il confronto
esatto supera il gate C3 del 95%; non si deduce MC/DC.

Il nativo originale occupa 2205402 byte; l'indice e le due pagine HTML
rimangono originali. L'[inventario](../../spikes/results/2026-10-13-pool-worker-claim/development-manifest.lisp)
identifica fonti e bundle senza perdita. L'[audit della biblioteca](../../spikes/results/2026-10-13-pool-worker-claim/data/coverage-audit/coverage-audit.lisp)
e l'[audit del nuovo scope](../../spikes/results/2026-10-13-pool-worker-claim/data/claim-coverage-audit/coverage-claim-audit.lisp)
conservano gli stessi conteggi e percorsi, con metadati distinti.
I file C1 delegati non contribuiscono ai denominatori del componente nuovo.

## Misura locale

Tre campagne separate, ciascuna con cinque repliche da 4096 cicli e 128 cicli
di warmup per replica: **20480 cicli misurati per campagna**, quindici campioni
totali nel [rapporto del sensore](../../spikes/results/2026-10-13-pool-worker-claim/data/benchmark/report.lisp).
Factory, risoluzione delle API e GC completa precedono il clock.

EMPTY esegue quattro prese su quattro shard vuoti, verificando rotazione
1/2/3/0 e azione invariata. INACTIVE esegue quattro prese conservando il
cursore 2. SWITCH esegue sei prese: ritiro, conferma ripetuta, attivazione
e quattro EMPTY complessivi con rotazione 1/2/3/0. Due generazioni monotone
per ciclo, nessun reset. La fixture SWITCH serializza owner e coordinatore
e pubblica richieste private soltanto dopo la conferma precedente; non
qualifica il coordinatore concorrente.

| Replica | Tick EMPTY | Tick INACTIVE | Tick SWITCH | Heap per ciascuna campagna |
|---|---:|---:|---:|---:|
| 0 | 4394 | 892 | 5328 | 0 |
| 1 | 4504 | 912 | 5355 | 0 |
| 2 | 4476 | 899 | 5317 | 0 |
| 3 | 4403 | 1069 | 5345 | 0 |
| 4 | 4433 | 901 | 5300 | 0 |

SBCL 2.6.9, ARM64, Apple M4, Darwin 27.0.0, safety 3 e clock di 1000000
unità al secondo. Tutti i campioni completano 4096 cicli, con heap osservato
zero e sink esatto: 8435712 EMPTY, 8468480 INACTIVE, 8574976 SWITCH.
Il carico esterno, compresi gli altri processi di verifica, è incontrollato.
I tick non definiscono una soglia, taratura o conclusione sul throughput.
Zero heap osservato non dimostra assenza universale di allocazioni.

## Conservazione e limiti

Non ci sono tentativi formali falliti nei cinque processi congelati elencati.
Il primo runner di sviluppo dei test falliva nella configurazione relativa
della cache prima della compilazione; runner e output restano diagnostica
di sviluppo, senza promozione a prova superata. Le versioni dei test e gli
altri raw preliminari restano distinti dagli originali congelati.

La conservazione riusa i writer C4 già verificati e dichiara esplicitamente
le famiglie generiche dei manifesti. Il manifesto del componente identifica
API e sorgenti claim; i formati legacy non ampliano lo scope di prodotto.
Solo gli intermedi FASL sono esclusi dalle fonti di sviluppo UTF-8.

Il gate qualifica la nuova presa logica. Non modifica sorgenti C1, payload,
lease o protocolli durevoli; non realizza dispatcher completo, avvio, park/wake,
sensori, coordinamento Archivio, admission dei messaggi o shutdown fisico.
L'ACK conservato se un successivo claim fallisce è verificato staticamente
nell'ordine del codice, senza FI dedicata a quel preciso caso nei dodici test.
REQ-THR-001 e QA-12/19 restano aperti a livello del motore completo.

## Integrazione su main

Il commit `3751494703a848cd911cc1c13c11f0692bef4a38` è stato integrato con
`061e638200f0d97fc2443c7dec38d4362ef274e1`, contenente la preparazione del
checkpoint CONTROL. Il merge `e1ad69b1bae70fa8a2a0def075024206ff20391c`
conserva byte per byte gate, package, dodici test e sensore della qualifica.
ASDF integra i nuovi moduli, l'indice documentale e il changelog mantengono
entrambe le aggiunte.

Il [controllo integrato](../../spikes/results/2026-10-13-pool-worker-claim/processes/integrated-build/report.lisp)
`4000913736-command-84415-0` passa compilazione strict, 1109 prove nominate
e due smoke, lint e tracciabilità: OK, STABLE, exit 0. Non si attribuiscono
retroattivamente al merge la copertura, il benchmark o i dieci spike della
copia congelata. Le fonti finali vengono conservate separatamente.

## Chiusura della conservazione

La [pubblicazione delle copie](../../spikes/results/2026-10-13-pool-worker-claim/processes/publication/report.lisp)
`4000913849-command-86077-0` termina OK, STABLE, exit 0, dopo le verifiche
degli originali e delle copie. Il [controllo finale](../../spikes/results/2026-10-13-pool-worker-claim/processes/final-verification/report.lisp)
`4000914088-command-91880-0` passa link e conservazione: OK, STABLE, exit 0,
152,397584 secondi, 376 file Markdown e 2786 link senza rotture; 86 cataloghi,
18938 file conservati e 542334642 byte. Questi conteggi precedono l'aggiunta
delle copie del processo stesso. Un nuovo manifesto conserva questi due
record e la versione conclusiva di questo documento, senza sostituire
raw o manifesti precedenti.
")
  (:PATH #A((33) BASE-CHAR . "spikes/out/pool-claim-finish.lisp") :BYTES 636 :SHA256
   "a4e69bebcdc501d5a955b51ad71f52a34e858b51c68f744fa359fdbc29512771" :GIT-BLOB
   "c49e9d835662f118d1c72326193814b5c9673bdb" :TEXT "(require :asdf)
(let ((*features* (cons :pool-worker-claim-closure-library *features*)))
  (load \"spikes/out/pool-claim-closure-run.lisp\"))
(pool-worker-claim-close-records
 #p\"spikes/out/pool-claim-publication-input.lisp\" \"manifesto-chiusura-01\"
 '((:name \"publication\" :id \"4000913849-command-86077-0\")
   (:name \"final-verification\" :id \"4000914088-command-91880-0\"))
 :extra-sources '(#p\"spikes/out/pool-claim-finish.lisp\"
                  #p\"spikes/out/pool-claim-publication-attempt-01.log\"
                  #p\"spikes/out/pool-claim-final-verification-attempt-01.log\"
                  #p\"/tmp/arcdocdb-pool-claim-state.json\"))
")
  (:PATH #A((48) BASE-CHAR . "spikes/out/pool-claim-publication-attempt-01.log") :BYTES 261 :SHA256
   "45258a4137543a8eaec2342fc12e951732ff7ead2c75d19e90688b2dd376f6d0" :GIT-BLOB
   "1aa3fc67805e9b81d310569202526c7a51fdd303" :TEXT
   ":OK: sbcl --noinform --no-userinit --no-sysinit --script spikes/out/pool-claim-publication.lisp spikes/out/pool-claim-publication-input.lisp; record: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4000913849-command-86077-0/report.lisp
")
  (:PATH #A((55) BASE-CHAR . "spikes/out/pool-claim-final-verification-attempt-01.log") :BYTES 145
   :SHA256 "4ec0b3cc3ac68dab476608b46fa7b0aeced22611e88b57cd7e9a0899baeb7960" :GIT-BLOB
   "287e11b9ae75a9bf72b49b692913bae1c4bf484d" :TEXT
   ":OK: make links evidence; record: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4000914088-command-91880-0/report.lisp
")
  (:PATH #A((35) BASE-CHAR . "/tmp/arcdocdb-pool-claim-state.json") :BYTES 3907 :SHA256
   "1d166a37aa3463bd0fe9a345c3aa8092819b9debd33960f4fa6f824bca8c28ad" :GIT-BLOB
   "bc80a2e0322ef670cbb2ff626ecbcd4b77d89b7b" :TEXT
   "{\"base\": \"900fa93d9e14a252e6a2b5a009d19728b2de34af\", \"snapshot\": \"/tmp/arcdocdb-pool-claim-qualification-1791924432\", \"root\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB\", \"frozen\": true, \"paths\": [\"CHANGELOG.md\", \"arcdocdb.asd\", \"docs/implementazione/README.md\", \"docs/implementazione/pool-worker-lifecycle.md\", \"src/scheduler/package.lisp\", \"docs/implementazione/pool-worker-claim.md\", \"docs/implementazione/pool-worker-claim-metodo.md\", \"src/scheduler/pool-claim.lisp\", \"tests/scheduler/pool-claim.lisp\", \"tools/measure-pool-claim.lisp\"], \"source_sha256\": {\"CHANGELOG.md\": \"abaa818f096d899be9e13525faff827dc70857632f18c02711db4defba994ffd\", \"arcdocdb.asd\": \"766acc26f77abbcf6c19b9d1e4ba02042a31f14f70fdf62b53d71e6ea3965937\", \"docs/implementazione/README.md\": \"af6f6709ecb96d8043cbe8aa125a6ed4436f23d4a5081874d5dd9646f25af1bf\", \"docs/implementazione/pool-worker-lifecycle.md\": \"3dc8ad5ce8a66a00d79822bf928dc8105bdf1aa52a1e3e5fc9929d06d62f9913\", \"src/scheduler/package.lisp\": \"a44fd2c3d435e1f6729bf861b6caeb54a184f31c92e7909aad9c18b491f03cdf\", \"docs/implementazione/pool-worker-claim.md\": \"20240f3011569792d86d0369e374b3e6c43dcac48192ea34c0fd37b54f211ef7\", \"docs/implementazione/pool-worker-claim-metodo.md\": \"aedfadbf875ef9b58ba54bc4b5269aba438983e53137c5c3eef645e1265f1e19\", \"src/scheduler/pool-claim.lisp\": \"e384f6091a5fcb506e718e12e77b06ab8dd4233a41024bc57ca3b14425e10b14\", \"tests/scheduler/pool-claim.lisp\": \"f968d57b6ff4dfc3cc31f1b1979afa896d95435093406b36320800783629901f\", \"tools/measure-pool-claim.lisp\": \"c4d9c85aaf32a9eb3017007e2ac63119f5feeb2874c0ad4be66639035072eb4b\"}, \"helpers\": [\"spikes/out/pool-claim-measure/coverage-run.lisp\", \"spikes/out/pool-claim-measure/claim-coverage-reader.lisp\", \"spikes/out/pool-claim-measure/reader-run.lisp\", \"spikes/out/pool-claim-measure/tool-run.lisp\", \"spikes/out/lifecycle-measure/lifecycle-coverage-reader.lisp\"], \"helper_sha256\": {\"spikes/out/pool-claim-measure/coverage-run.lisp\": \"7b2c70035f08e40ad8ea8808700af5a8f60633e586de58871e2533d054858fc2\", \"spikes/out/pool-claim-measure/claim-coverage-reader.lisp\": \"4e81190202e0044e9eaff8b00953fbf47a494fd0d0a30ef41811b41dfade92dc\", \"spikes/out/pool-claim-measure/reader-run.lisp\": \"a066bba7120a5a05dcd8fb0e45bac7d300d500c651394e5983f07cbe941eb254\", \"spikes/out/pool-claim-measure/tool-run.lisp\": \"ff2cfb6c377e7ba6ea287833bd4829c4c571afe8b45c87e7a6c0be0737c3f007\", \"spikes/out/lifecycle-measure/lifecycle-coverage-reader.lisp\": \"4696348d1a4cb37c1d135e2df29309f4f7abc58b9da3220214612109fd5bfb2c\"}, \"final_paths\": [\"CHANGELOG.md\", \"arcdocdb.asd\", \"docs/implementazione/README.md\", \"docs/implementazione/pool-worker-lifecycle.md\", \"src/scheduler/package.lisp\", \"docs/implementazione/pool-worker-claim.md\", \"docs/implementazione/pool-worker-claim-metodo.md\", \"src/scheduler/pool-claim.lisp\", \"tests/scheduler/pool-claim.lisp\", \"tools/measure-pool-claim.lisp\", \"docs/implementazione/pool-worker-claim-revisione.md\", \"docs/implementazione/pool-worker-claim-risultati.md\"], \"records\": [{\"name\": \"selftest\", \"id\": \"4000913361-command-73795-0\"}, {\"name\": \"coverage\", \"id\": \"4000913361-command-73794-0\"}, {\"name\": \"benchmark\", \"id\": \"4000913399-command-74843-0\"}, {\"name\": \"coverage-reader\", \"id\": \"4000913465-command-76699-0\"}, {\"name\": \"check-core\", \"id\": \"4000913331-command-73208-0\"}, {\"name\": \"integrated-build\", \"id\": \"4000913736-command-84415-0\", \"root\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB\"}, {\"name\": \"publication\", \"id\": \"4000913849-command-86077-0\", \"root\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB\"}, {\"name\": \"final-verification\", \"id\": \"4000914088-command-91880-0\", \"root\": \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB\"}], \"implementation_commit\": \"3751494703a848cd911cc1c13c11f0692bef4a38\", \"integrated_commit\": \"e1ad69b1bae70fa8a2a0def075024206ff20391c\", \"integrated_parent\": \"061e638200f0d97fc2443c7dec38d4362ef274e1\"}
")))
