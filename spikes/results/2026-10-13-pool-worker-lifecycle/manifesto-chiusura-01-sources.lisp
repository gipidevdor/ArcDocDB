(:SCHEMA-VERSION 1 :KIND :POOL-WORKER-LIFECYCLE-CLOSURE-SOURCES :VERSION
 "c4bbb037b779d33ee9e8c01b4a33aac875ccf96f" :PART 1 :PARTS 1 :SOURCES
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
  (:PATH #A((43) BASE-CHAR . "spikes/out/lifecycle-publication-input.lisp") :BYTES 3805 :SHA256
   "f1cd8250a34e7a872f682b04dee315cbd49a72ffe225dee9446be8e63615c899" :GIT-BLOB
   "f166a1014fdbb9523cadd7e487f62f9d2f2c0814" :TEXT
   "(:base \"c4bbb037b779d33ee9e8c01b4a33aac875ccf96f\" :snapshot \"/tmp/arcdocdb-pool-lifecycle-qualification-1791921785\" :paths (\"arcdocdb.asd\" \"docs/implementazione/README.md\" \"src/scheduler/package.lisp\" \"tests/scheduler/support.lisp\" \"src/scheduler/lifecycle-build.lisp\" \"src/scheduler/lifecycle-read.lisp\" \"src/scheduler/lifecycle-types.lisp\" \"src/scheduler/lifecycle-update.lisp\" \"src/scheduler/lifecycle-worker.lisp\" \"tests/scheduler/lifecycle.lisp\" \"tools/measure-pool-lifecycle.lisp\" \"docs/implementazione/pool-worker-lifecycle.md\" \"docs/implementazione/pool-worker-lifecycle-metodo.md\") :final-paths (\"arcdocdb.asd\" \"docs/implementazione/README.md\" \"src/scheduler/package.lisp\" \"tests/scheduler/support.lisp\" \"src/scheduler/lifecycle-build.lisp\" \"src/scheduler/lifecycle-read.lisp\" \"src/scheduler/lifecycle-types.lisp\" \"src/scheduler/lifecycle-update.lisp\" \"src/scheduler/lifecycle-worker.lisp\" \"tests/scheduler/lifecycle.lisp\" \"tools/measure-pool-lifecycle.lisp\" \"docs/implementazione/pool-worker-lifecycle.md\" \"docs/implementazione/pool-worker-lifecycle-metodo.md\" \"CHANGELOG.md\" \"docs/implementazione/controllore-pool.md\" \"docs/implementazione/pool-worker-lifecycle-revisione.md\" \"docs/implementazione/pool-worker-lifecycle-risultati.md\") :records ((:name \"selftest\" :id \"4000910603-command-11895-0\") (:name \"benchmark\" :id \"4000910621-command-11962-0\") (:name \"coverage\" :id \"4000910644-command-12377-0\") (:name \"check-core\" :id \"4000910703-command-13310-0\") (:name \"check-core-attempt-1\" :id \"4000910605-command-11912-0\") (:name \"check-core-attempt-2\" :id \"4000910632-command-12130-0\") (:name \"integrated-build\" :id \"4000911049-command-19367-0\" :root \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB\") (:name \"publication-selftest-attempt-1\" :id \"4000911325-command-22225-0\" :root \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB\") (:name \"publication-selftest\" :id \"4000911543-command-23689-0\" :root \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB\")) :benchmark-report \"/tmp/arcdocdb-pool-lifecycle-qualification-1791921785/spikes/out/lifecycle-measure/bench-attempt-01/report.lisp\" :evidence ((:name \"coverage-audit\" :source \"/tmp/arcdocdb-pool-lifecycle-qualification-1791921785/spikes/out/lifecycle-measure/coverage-attempt-01/coverage-audit.lisp\") (:name \"publication-selftest-attempt-1\" :source \"/tmp/lifecycle-publication-fixture-ZxpZN6/selftest-report.lisp\") (:name \"publication-selftest\" :source \"/tmp/lifecycle-publication-fixture-l7tyL8/selftest-report.lisp\")) :evidence-directories ((:name \"check-core-spikes\" :source \"/tmp/arcdocdb-pool-lifecycle-qualification-1791921785/spikes/out/4000910872-check-16097-0\") (:name \"publication-fixture-attempt-1-large\" :source \"/tmp/lifecycle-publication-fixture-ZxpZN6/large-published/\")) :extra-development-sources (\"/tmp/arcdocdb-pool-lifecycle-qualification-1791921785/spikes/out/lifecycle-fullcheck-attempt-01.log\" \"/tmp/arcdocdb-pool-lifecycle-qualification-1791921785/spikes/out/lifecycle-fullcheck-attempt-02.log\" \"/tmp/arcdocdb-pool-lifecycle-qualification-1791921785/spikes/out/lifecycle-fullcheck-attempt-03.log\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/lifecycle-integrated-attempt-01.log\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/lifecycle-publication-selftest-attempt-01.log\" \"/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/lifecycle-publication-selftest-attempt-02.log\" \"/tmp/lifecycle-publication-fixture-ZxpZN6/large-native/raw-native.py\" \"/tmp/lifecycle-publication-fixture-ZxpZN6/large-native/small.note\") :extra-sources (\"/tmp/arcdocdb-lifecycle-state.json\" \"/tmp/arcdocdb-pool-lifecycle-qualification-1791921785/spikes/out/lifecycle-integrated-build.lisp\" \"spikes/out/pool-command-summary.lisp\"))
")
  (:PATH #A((37) BASE-CHAR . "spikes/out/lifecycle-closure-run.lisp") :BYTES 654 :SHA256
   "ebaabefaeb10b308709d9f278d5fca8a87ced898fbb4bc5e8f9f0a1426583d13" :GIT-BLOB
   "690b01a2574fa50c421812ed277ec507e8a7b812" :TEXT "(require :asdf)
(let ((*features* (cons :pool-worker-lifecycle-closure-library *features*)))
  (load \"spikes/out/lifecycle-close-records.lisp\"))
(lifecycle-close-records
 #p\"spikes/out/lifecycle-publication-input.lisp\" \"manifesto-chiusura-01\"
 '((:name \"publication\" :id \"4000911736-command-27429-0\")
   (:name \"final-verification\" :id \"4000911991-command-38401-0\"))
 :extra-sources '(#p\"spikes/out/lifecycle-closure-run.lisp\"
                  #p\"spikes/out/lifecycle-publication-attempt-01.log\"
                  #p\"spikes/out/lifecycle-final-verification-attempt-01.log\"
                  #p\"docs/implementazione/pool-worker-lifecycle-risultati.md\"))
")
  (:PATH #A((47) BASE-CHAR . "spikes/out/lifecycle-publication-attempt-01.log") :BYTES 259 :SHA256
   "7898947c4ec6bc16a77de6886459da93b3fc99f8a7dd393fbe48977bae156f5f" :GIT-BLOB
   "d0a1368832104091ef7c05fd0340304a2ec8ba70" :TEXT
   ":OK: sbcl --noinform --no-userinit --no-sysinit --script spikes/out/lifecycle-publication.lisp spikes/out/lifecycle-publication-input.lisp; record: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4000911736-command-27429-0/report.lisp
")
  (:PATH #A((54) BASE-CHAR . "spikes/out/lifecycle-final-verification-attempt-01.log") :BYTES 145
   :SHA256 "1773d6ad65596f17cf73a87003423580263cad8bc1361b8b70a9336eee546a20" :GIT-BLOB
   "a0bd15f2a14f5c9b55039b0239d2987f1d8d6444" :TEXT
   ":OK: make links evidence; record: /Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/out/4000911991-command-38401-0/report.lisp
")
  (:PATH #A((55) BASE-CHAR . "docs/implementazione/pool-worker-lifecycle-risultati.md") :BYTES 7601
   :SHA256 "6b4029aa62d86578c76359bf0e9d4d9b06b17add6bd79093ac1b25ad188d81d6" :GIT-BLOB
   "d3c3c91217d83796fdcd86ae9fbaed5a613c3864" :TEXT "# Verifica dell'attuazione logica dei worker

La campagna C3 verifica porte, richieste e conferme dei worker preallocati
secondo [contratto](pool-worker-lifecycle.md),
[metodo preregistrato](pool-worker-lifecycle-metodo.md) e
[lettura del codice](pool-worker-lifecycle-revisione.md).
La copia congelata parte da `c4bbb037b779d33ee9e8c01b4a33aac875ccf96f`
e conserva i tredici file dell'incremento. Byte originali e identità sono
raccolti nel [catalogo della campagna](../../spikes/results/2026-10-13-pool-worker-lifecycle/).

## Processi congelati

| Processo | Record | Esito |
|---|---|---|
| Compilazione strict e self-test C4 | [4000910603-command-11895-0](../../spikes/results/2026-10-13-pool-worker-lifecycle/processes/selftest/report.lisp) | OK, STABLE, exit 0 |
| Due campagne del percorso normale | [4000910621-command-11962-0](../../spikes/results/2026-10-13-pool-worker-lifecycle/processes/benchmark/report.lisp) | OK, STABLE, exit 0 |
| Copertura e suite scheduler | [4000910644-command-12377-0](../../spikes/results/2026-10-13-pool-worker-lifecycle/processes/coverage/report.lisp) | OK, STABLE, exit 0 |
| Controllo completo del repository | [4000910703-command-13310-0](../../spikes/results/2026-10-13-pool-worker-lifecycle/processes/check-core/report.lisp) | OK, STABLE, exit 0 |

Il build degli strumenti e del prodotto tratta warning e style-warning
come errori. La suite della copertura passa 41 prove: 23 del controllore
esistente e 18 nuove dell'attuazione logica. I self-test C4 rilevano
16777472 byte di allocazione deliberata, respingono sink e risultati API
difformi, distinguono il clock sotto risoluzione e conservano raw parziali
e destinazioni preesistenti. Il controllo completo passa 1076 prove nominate,
gli smoke test, lint, tracciabilità, link, self-test degli strumenti, conservazione
delle evidenze e i dieci spike. L'esecuzione dura 201,656 secondi.

Due tentativi preliminari del controllo completo restano falliti e conservati:
[opzioni shell](../../spikes/results/2026-10-13-pool-worker-lifecycle/processes/check-core-attempt-1/report.lisp)
e [configurazione della cache](../../spikes/results/2026-10-13-pool-worker-lifecycle/processes/check-core-attempt-2/report.lisp).
Entrambi terminano prima dei test del prodotto; i loro esiti non vengono promossi.

## Copertura

Nativo SB-COVER e indice HTML concordano sui cinque nuovi file lifecycle
e sul package: **414/415 espressioni (99,759%), 60/60 rami (100%)**.
Il minimo C3 del 95% è superato senza esclusioni di file o percorsi.
I vecchi sorgenti del controllore e dei worker non contribuiscono a questi
denominatori; i percorsi generati dei nuovi sorgenti restano inclusi.
Non si deduce MC/DC dai conteggi.

L'unica espressione mancante resta nel denominatore: file
`src/scheduler/lifecycle-build.lisp`, indice nativo 36, percorso `(3 2 3)`;
l'HTML la colloca nell'inizializzatore facoltativo `(active t)` alla linea
10. L'[inventario degli originali](../../spikes/results/2026-10-13-pool-worker-lifecycle/development-manifest.lisp)
identifica stato nativo, indice e sei pagine HTML, conservati senza perdita
nei bundle; l'[audit esatto](../../spikes/results/2026-10-13-pool-worker-lifecycle/data/coverage-audit/coverage-audit.lisp)
conserva conteggi e percorsi mancanti. La misura
passa al primo tentativo congelato; i raw preliminari conservano la loro
identità distinta.

## Misura locale

Due campagne separate, ciascuna con cinque repliche da 4096 cicli misurati
e 128 cicli di warmup per replica: **20480 cicli misurati per campagna**,
dieci campioni complessivi nel [rapporto del sensore](../../spikes/results/2026-10-13-pool-worker-lifecycle/data/benchmark/report.lisp). Factory, avvio dei thread della fixture,
sincronizzazione e GC completa precedono il tratto misurato.

APPLY esegue ritiro, conferma ripetuta, attivazione e conferma ripetuta su
un contesto autentico IDLE. Le richieste private C4 sono seriali e le
generazioni progrediscono senza reset; questa fixture non misura il
coordinatore concorrente. REGISTRY usa due registri distinti con quattro
contesti creati su due owner reali; ogni ciclo esegue due update e due
letture nelle condizioni hold e pending, senza attese nel sensore.

| Replica | Tick APPLY | Tick REGISTRY | Byte heap APPLY / REGISTRY |
|---|---:|---:|---:|
| 0 | 647 | 1351 | 0 / 0 |
| 1 | 640 | 1425 | 0 / 0 |
| 2 | 646 | 1271 | 0 / 0 |
| 3 | 655 | 1261 | 0 / 0 |
| 4 | 644 | 1271 | 0 / 0 |

SBCL 2.6.9, ARM64, Apple M4, Darwin 27.0.0; safety 3 e carico esterno non
controllato. Il clock ha 1000000 unità al secondo. Tutti i dieci campioni
completano 4096 cicli con sink atteso e zero byte heap osservati.
I tick sono osservazioni locali, senza soglia di tempo, taratura o
conclusione sul throughput. Il sensore non dimostra assenza universale di
allocazioni.

L'attuazione verificata è logica: nessun thread OS viene avviato,
sospeso o distrutto dal prodotto. Park/wake, shutdown, worker morti,
admission, I/O, sensori reali e un pool completo restano fuori scope.

## Integrazione su main

Dopo la campagna congelata, il commit `0714638e56a4a058b74839064a2b00dd583c5384`
è stato integrato con `ba78d8272a475af25e89b7df8c5033ff50e30b3b`, contenente
i nuovi componenti GET e inizializzazione ACTIVE. Il merge
`a95dab36f40560157a6631557e4774a8b320fde5` conserva byte per byte package,
cinque sorgenti lifecycle, test e sensore della qualifica. ASDF integra i moduli
aggiuntivi; il changelog conserva entrambe le aggiunte concorrenti.

Il [controllo integrato](../../spikes/results/2026-10-13-pool-worker-lifecycle/processes/integrated-build/report.lisp)
`4000911049-command-19367-0` passa 1099 prove nominate e gli smoke test,
compilazione strict, lint e tracciabilità: OK, STABLE, exit 0, 30,059868 secondi.
La campagna completa e i dieci spike restano quelli della base congelata; non
si attribuisce retroattivamente quel processo al merge. Le evidenze conservano
separatamente sorgenti qualificati e sorgenti finali, inclusi i documenti aggiunti.

## Conservazione C4

Il [self-test della conservazione](../../spikes/results/2026-10-13-pool-worker-lifecycle/processes/publication-selftest/report.lisp)
`4000911543-command-23689-0` passa 58 controlli: OK, STABLE, exit 0.
Verifica copie esclusive, byte e identità originali, inventario UTF-8,
payload gzip senza perdita e rifiuto di file speciali o fonti mutate.

Il [primo tentativo](../../spikes/results/2026-10-13-pool-worker-lifecycle/processes/publication-selftest-attempt-1/report.lisp)
resta FAILED, STABLE, exit 1: la fixture cercava il pathname `/tmp`
nel record che conservava l'identità canonica `/private/tmp`. La correzione
normalizza soltanto quel lookup; byte, SHA, Git blob e roundtrip restano
verificati dalle medesime asserzioni. Fonti, diagnostica e payload originali
del tentativo sono conservati con il loro esito distinto.

La [pubblicazione delle copie](../../spikes/results/2026-10-13-pool-worker-lifecycle/processes/publication/report.lisp)
`4000911736-command-27429-0` termina OK, STABLE, exit 0, dopo aver verificato
gli originali e le copie. Il [controllo finale](../../spikes/results/2026-10-13-pool-worker-lifecycle/processes/final-verification/report.lisp)
`4000911991-command-38401-0` passa link e conservazione: OK, STABLE, exit 0,
154,602746 secondi, 370 file Markdown e 2748 link senza rotture;
84 cataloghi, 18868 file conservati, 535386346 byte. Questi conteggi
appartengono al processo prima dell'aggiunta delle sue copie di chiusura.
Un nuovo manifesto conserva quei record e la versione conclusiva di questo
documento senza sostituire i raw o i manifesti precedenti.
")))
