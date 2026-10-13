(:SCHEMA-VERSION 1 :KIND :POOL-CONTROLLER-FINAL-SOURCES :VERSION
 "4344d9e1f2ceb45e5fa3d5076b57d09505e69ac3" :PART 1 :PARTS 1 :SOURCES
 ((:PATH
   #A((73) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/CHANGELOG.md")
   :BYTES 15156 :SHA256 "92b505445fda88d76aff91f7709b603c63f77a5edb63035926aba2049ef9aded"
   :GIT-BLOB "a69618e07e767b84b4c93d63d00fdd261b191596" :TEXT "# Changelog

Formato basato su [Keep a Changelog](https://keepachangelog.com/it-IT/1.1.0/). Il progetto
non ha ancora rilasci; le versioni seguiranno la [roadmap](docs/roadmap.md).

## [Non rilasciato]

### Aggiunto

- Controllore locale del numero di worker di calcolo: EWMA intere,
  crescita additiva, riduzione moltiplicativa e permanenza delle condizioni.
  Campioni e tempo iniettati, target distinto dai worker effettivi,
  aggiornamento limitato senza allocazioni dopo l’avvio. Avvio, risveglio
  e ritiro dei thread restano il prossimo componente del pool.

- Directory GET dei segmenti CLOSED: ID u32 compatti e riferimenti privati
  immutabili, controllo di Serie/ordine/budget prima delle copie, ricerca
  limitata a diciassette passi e collegamento al resolver/cache/I/O.
  Una location pubblicata senza segmento è un guasto, mai un miss.
  Pubblicazione, ACTIVE, rotazione e reclaim restano integrazioni distinte.
  Corretto il confronto del ritorno di lettura nel resolver CLOSED: l'API
  restituisce END nel buffer, anche quando la regione comincia a 64.

- Scrittura minima dei valori semplici CBOR MT7: codici wire 0..23 e
  32..255, preflight di range/codice/capacità e destinazione esclusiva.
  Include confronto su tutti i codici, fuzz e due worker riusati;
  profilo applicativo, composizione e qualifica C1 restano aperti.

- Routing preallocato dei writer pronti alla Serie: ordinali immutabili,
  registro con associazioni verificate e tabella privata per worker.
  Selezione diretta in tempo costante, anche dopo ricircolo a coda piena,
  senza scritture condivise per messaggio. Include18 nuove regressioni,
  due letture C1, audit completo della copertura e cinque misure locali;
  pool e coordinatore restano aperti.

- Resolver GET ACTIVE per lotti ordinari: radice acquisita dalla pubblicazione
  della Serie, pagine immutabili e directory persistente con quattro piccoli
  vettori per append. Preflight prima del CSN, verifica del solo lotto nuovo e riuso cache/lettura GET;
  budget, fail-stop e confini documentati. Prepared/OUTCOME ACTIVE, indice
  concreto, rotazione/reclaim e qualifica C1 restano aperti.

- Collegamento preallocato worker/Serie: doppia lease, token monotoni, debito
  batch e rilascio Serie prima del worker, con retry limitato alla fine e
  conservazione dei guasti originali. Include 26 prove, due letture C1,
  copertura completa nel denominatore e cinque misure locali del percorso
  seriale; pool e coordinatore Archivio restano da integrare.

- Resolver GET dei segmenti CLOSED: frontiera dal manifest, prefisso writer
  sigillato o compaction verificato, righe u32 immutabili e prove OUTCOME
  risolte senza I/O nel lookup. Connessione a cache e lettura GET, budget
  espliciti e controlli di posizione/CSN; ACTIVE, prove EDIT, directory e
  qualifica C1 restano aperti.

- Hash delle chiavi XXH64 tipizzato: ritorno in due u32, seme esplicito
  immutabile nell'indice, mappe verificate degli slot fisici per rebuild/split,
  propagazione dei guasti interni. Include 46 nuove regressioni, mutazioni,
  misure seriali/parallele e registri strutturati; lifecycle del seme e GET
  integrato ancora aperti.

- Nucleo GET con contesto preallocato per worker: hash col seme dell'indice e lookup sotto EBR,
  capacità segmento con header verificato, cache e I/O readonly, prova
  OUTCOME letta dallo stesso file e risposta privata fino alla conferma
  snapshot. Ricerca storica richiesta esplicitamente sui casi non risolvibili
  dall'indice corrente; resolver, pool, protocollo e qualifica C1 aperti.

- Cache dei record per Serie: classi preallocate, insiemi di otto posti,
  CLOCK limitato, ricerca senza lock e inserimento opportunistico. Ogni hit
  verifica CRC, chiave, CSN e prova prepared; corruzione della cache distinta
  dall’input del segmento. Verificatore comune con CSN in due u32,
  budget e contratti documentati; GET integrato e qualifica C1 aperti.

- Indice primario v2 in memoria: controlli Swiss a gruppi di 16, chiavi binarie
  in arena, lookup con budget comune e conferma root anche sul miss, upsert e
  cancellazione/rilocazione condizionale nel writer, crescita arena e piani monouso di pubblicazione
  directory, con hash delle chiavi e costruttore verificato split/rebuild.
  Lifecycle del seme e GET integrato ancora aperti;
  include contratti, tracciabilità ed evidenze statiche, qualifica C1 aperta.

- Banco di slot v2 dell'indice: parole u64 contigue, lettura in buffer privato
  con otto tentativi, pubblicazione e rimozione sotto seqlock, rilocazione
  condizionale, credito di scrittura e congelamento permanente. Include
  contratti, decisioni da coprire ed evidenze statiche; qualifica C1 aperta.

- Contesto di lettura preallocato per worker: ingresso EBR a tentativo singolo,
  snapshot controllato prima e dopo il lookup, anche sul miss, e cleanup del
  pin prima della migrazione. Collegato ai registri CSN/snapshot/epoche;
  indice, cache e pool restano da integrare, qualifica concorrente aperta.

- Dominio EBR per Archivio: annunci dei worker distanti 128 byte, ingresso
  senza mutex a tentativo singolo, ticket preallocati e crediti di epoca prima
  dello swap. Frontiera condivisa da più ritiri e claim esclusivo del reclaim;
  integrazione con segmenti/pool e qualifica concorrente restano aperte.

- Registro snapshot per Archivio: soglia annunciata prima della cattura del CSN,
  contesti preallocati con generazione, controlli di lettura senza mutex,
  deadline e scadenze con budget. Interfaccia in buffer per i reader;
  qualifica concorrente, controller ed EBR restano da integrare.

- Registro CSN per Archivio con orizzonte monotono e budget finito;
  l’implementazione attiva è `arcdocdb.csn`, con token slot/high/low.
- Ricostruzione in memoria del manifest dal prefisso sigillato di `control.log`:
  ACTIVE, CLOSED con esiti, rimozioni esplicite e limite degli ID. Workspace
  indipendenti per Serie; nessuna riconciliazione o scrittura dei file.

- Validazione UTF-8 pura su span immutabili, con budget massimo di 16 MiB,
  conteggio dei valori scalari ed errori tipizzati con offset. Utilizzabile
  in parallelo dai worker prima del writer; il parser CBOR resta da integrare.
  Diciassette test, nove mutanti rilevati e zero heap nei 25 campioni locali;
  prove concorrenti ed evidenze grezze conservate.

- Code MPSC locali preallocate e gettone del writer con quota cumulativa:
  contesa e saturazione distinte, FIFO e rifiuto dei gettoni vecchi.
  Diciassette test, inclusi producer/consumer su thread reali e calcolo
  sovrapposto tra Serie; otto mutanti rilevati e zero heap nelle misure locali.

- Verifica in memoria dei segmenti compattati CLOSED v1/v2: identità, CRC,
  soli PUT/TOMBSTONE ordinari, limite valido autorevole e budget byte/record.
  Conteggi fisici restituiti dopo il controllo integrale; 15 test indipendenti,
  otto mutanti rilevati e misure locali delle allocazioni conservate.

- Tabella delle decisioni multiserie inclusa nella compilazione e nei test ordinari:
  ricostruzione dal prefisso sigillato, duplicati idempotenti o discordanti,
  budget finiti, query scalari e copie possedute dei partecipanti. Non applica
  i prepared e non realizza il recovery completo del database.

- SPK-08 bitmap: kernel scalari byte/u64 equivalenti, oracoli indipendenti,
  90 campioni locali e disassemblati conservati. Packing escluso e nessuna
  promozione a ottimizzazione del motore.

- SPK-07: due reader/due slot in SC, 28 mutanti rilevati; crash sui byte
  v1/v2, 49.120 casi e 303.432 interruzioni/ripartenze equivalenti. Frontiera
  esterna e limiti del modello dichiarati; tutti i tentativi conservati.

- SPK-08: maschere scalar/SWAR esatte e kernel NEON/SSE2 a safety 3;
  70 campioni seriali su Apple M4, zero byte consed osservati nei cicli.
  SSE2 e indice concorrente restano da verificare; report leggibili senza
  caricare i package sperimentali, originali integralmente conservati.

- Scansione recovery in memoria dei log v1/v2: prefisso verificato, coda e
  corruzione testimoniata da SEAL successivo, EOF esplicito e budget distinti
  dagli errori dei dati; 19 test, inclusi 20.256 casi di alterazione dei bit.

- SPK-06: modello finito del controllore di carico, quote e timer; 24 confronti
  locali tra letture e copie concorrenti, con verifica integrale, intervalli
  di sovrapposizione e campioni grezzi conservati. Compaction del motore e
  feedback reale restano da verificare.

- SPK-05: letture pread e mmap di file immutabili, CRC/chiave/stamp verificati,
  errori I/O e worker espliciti; 36 confronti locali per variante e profilo
  senza allocazioni osservate nel ciclo finale. Varianti e fallimenti conservati.

- SPK-04: writer sperimentale su pool, code limitate, modelli di parcheggio
  e ripartenza delle letture; controlli e 54 benchmark diagnostici conservati,
  con limiti e tentativi falliti espliciti.

- SPK-10: quattro moduli sperimentali Common Lisp per codec v1/v2, indice a
  cinque parole, CBOR iterativo e modello di migrazione; integrazione in memoria
  dei limiti massimi. Nessun codice di produzione, gate v2 ancora aperto.
- Registro strutturato di prove e benchmark, inclusi fallimenti e diagnostiche;
  blob dei sorgenti prima/dopo, risultati decodificati e output originali.
  `make check` registra l'intera verifica; la CI conserva gli artefatti.
- Campagne locali conservate: indice v1 fino a 10 milioni di documenti,
  profiling di allocazione e controlli/benchmark v2 separati.

- ADR-0050: root dell'indice ricontrollata anche su miss, costi e budget della
  directory separati dagli slot; nessuna promessa di pausa indipendente dalla Serie.
- ADR-0048: documenti da 16 MiB effettivi, profondità 100, chiavi fino a 65.535 byte e layout v2; tre requisiti progettati, gate di verifica e migrazione. ADR-0049 propone il percorso oltre RAM senza dichiararlo disponibile.

- Suite eseguibile della Fase 0 per SPK-01, SPK-02, SPK-03, SPK-07 e SPK-09; harness
  `tools/run-spikes.lisp`, compilazione senza avvisi, processi isolati, comandi e output
  grezzo; `make spikes-check` in CI e `make spikes-bench` per misure locali in serie.
- ADR-0046 e INV-M6: SPK-07 trova un controesempio nell'anello dell'orizzonte; il registro
  preallocato dei veri CSN pendenti lo sostituisce. I requisiti del motore restano progettati.
- ADR-0047: lettura dei prepared con prova autorevole del CSN (OUTCOME o manifest), oltre a
  CRC, chiave e flag. Una location verso un'altra versione della stessa chiave è rifiutata.

- Specifica originale, documentazione tematica (16 documenti), invarianti (`INV-…`),
  glossario.
- Valutazione architetturale: analisi critica, stime, registro dei rischi, piano degli spike.
- Progetto consolidato: [architettura](docs/architettura.md),
  [formati su disco](docs/formati-su-disco.md), [limiti dimensionali](docs/limiti.md).
- 30 ADR (0001–0030): le 26 questioni aperte sono chiuse; ADR-0028 e ADR-0030 attendono la
  conferma dell'autore.
- Sistema ASDF minimo, smoke test, `tools/check-links.lisp`, CI.
- Licenza BSD-2-Clause.
- **Software critico (ADR-0031…0035):** gerarchia delle priorità con l'affidabilità sopra le
  prestazioni; otto nuovi invarianti (INV-A1…A8); analisi dei guasti con 24 modi di guasto;
  standard di codifica (regole `COD-…`); piano di verifica; registro delle deviazioni.
- **Tracciabilità controllata da strumento:** 90 requisiti in `requisiti.lisp`, matrice generata,
  `make trace`.
- Strumenti in Common Lisp: build senza avvisi (`tools/build.lisp`), linter con auto-verifica
  (`tools/lint.lisp`), controllo della tracciabilità (`tools/check-trace.lisp`).
- SPK-09 (costo dei controlli di affidabilità).

- **Analisi progettuale** ([docs/analisi-progettuale.md](docs/analisi-progettuale.md)) e ADR
  0036–0045: dieci leggi di progetto — la prima: **il parallelismo è un principio fondante**,
  con l'elenco chiuso di ciò che le Serie condividono — tabella dei punti di atomicità, sedici
  rilievi `AP-…`; quattordici nuovi invarianti (INV-F2, F3, V5, M4, M5, S7, C11, I3, P5, P6,
  A9…A12), 107 requisiti, 27 modi di guasto, rischio residuo RES-05.

### Cambiato

- I test con worker riusati delle stringhe CBOR usano segnali distinti
  per ondata, evitando che un worker consumi il permesso dell'altro
  nell'ondata successiva.

- Snapshot collegati all'unico registro `arcdocdb.csn` dell'Archivio; rimosso
  l'allocatore CSN duplicato del ramo. Coordinamento snapshot senza attese,
  revoca della soglia provvisoria su `:csn-busy` e invalidazione terminale
  al guasto. API del registro canonico e sue evidenze conservate.

- Guide del repository consolidate, note degli esperimenti uniformate al metodo
  tecnico e specifica originale rinominata; requisiti ed evidenze conservati (ADR-0051).

- ADR-0028 e ADR-0030 confermati dall'autore il 2026-10-08, incluse le revisioni su minimi
  di prestazione, backup, restore verificato, verificatore offline e scrubbing.

- **Correzioni di progetto dall'analisi (nessun codice toccato, formati mai implementati):**
  - uno snapshot nasce quando l'orizzonte di visibilità lo ha raggiunto: prima poteva vedere
    comparire un lotto in volo (ADR-0038);
  - coda o corruzione di un log si decidono con la frontiera durevole dei SEAL: prima un crash
    ordinario con più lotti in volo portava la Serie in `FAULTED`; il recovery non tronca più
    (ADR-0037);
  - tombstone scartati con il filtro di esistenza: la regola per lineage faceva riapparire
    documenti eliminati dopo un MERGE di segmenti non adiacenti (ADR-0042);
  - l'esito di una multiserie sta nello stesso segmento dei record che risolve: prima un CLEAN
    poteva perderlo (ADR-0041);
  - primary index a frammenti: nessun raddoppio che triplica la memoria e ferma il writer; slot
    a 4 parole; stima corretta a ~75–80 byte per documento (ADR-0043).
- **Semplificazioni:** la versione di un documento è il CSN; una sola cornice di record con due
  CRC (24 byte); quattro tipi di record nei segmenti; control log con il solo record EDIT;
  `multiserie.log` con il solo record DECISION; nessun file `.bloom`, nessun lineage, nessuno
  stato `creating`; cache senza ri-etichettatura; EBR solo per i file (ADR 0038–0044).
- **Modello di esecuzione:** compiti a completamento, attese come parcheggi, ogni chiamata
  bloccante nel pool di I/O (ADR-0045).

- **Linguaggio visivo rifatto** ([assets/README.md](assets/README.md)): identità monocroma con un
  solo colore, l'ambra, riservato a ciò che può cambiare; nuovo marchio; illustrazione dei
  segmenti e diagramma del percorso di scrittura e lettura in vettoriale, chiaro e scuro; README
  riscritto; anteprima per i social. Il controllo dei link verifica anche i percorsi delle
  immagini.

- ADR-0032 sostituisce in parte ADR-0015: il contatore seqlock passa da 8 a 64 bit, con tentativi
  limitati e ripiego sul writer, perché l'argomento a 8 bit si reggeva sui tempi e non era una
  garanzia per costruzione. Costo: +8 byte per entry (56 B).
- ADR-0028 (proposta) distingue obiettivi e minimi vincolanti di prestazione; ADR-0030
  (proposta) porta backup e verificatore offline nella v1.
")
  (:PATH
   #A((73) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/arcdocdb.asd")
   :BYTES 13307 :SHA256 "3593d876c5096f55a472f742f1de5f74eb4518f561953e75518d2e6efe93a23e"
   :GIT-BLOB "5c31ac1b6564dd0b05d5f59b5cb3947880dc3e82" :TEXT
   ";;;; arcdocdb.asd — definizione di sistema ASDF.
;;;;
;;;; Fondazioni dello storage, autorizzate dall'autore il 2026-10-08.

(in-package #:asdf-user)

(defsystem \"arcdocdb\"
  :description \"Database server documentale general-purpose, append-only, in Common Lisp (SBCL).\"
  :author \"Giacomo Picchiarelli\"
  :license \"BSD-2-Clause\"
  :version \"0.0.0\"
  :pathname \"src/\"
  :serial t
  :depends-on (\"sb-posix\")
  :components ((:file \"package\")
               (:module \"foundation\"
                :serial t
                :components ((:file \"package\") (:file \"conditions\")
                             (:file \"binary\") (:file \"crc32c\")
                             (:file \"record\") (:file \"batch\")))
               (:module \"hash\" :serial t
                :components ((:file \"package\") (:file \"arithmetic\") (:file \"blocks\") (:file \"hash64\")))
               (:module \"codec\" :serial t
                :components ((:file \"package\") (:file \"utf8\")
                             (:file \"cbor-package\") (:file \"cbor-header\")
                             (:file \"cbor-float-minimal\") (:file \"cbor-minimal\")
                             (:file \"cbor-space\") (:file \"cbor-scan-input\")
                             (:file \"cbor-scan-stack\") (:file \"cbor-scan-items\")
                             (:file \"cbor-scan\") (:file \"cbor-scan-minimal\")
                             (:file \"cbor-write\") (:file \"cbor-string-write\")
                             (:file \"cbor-simple-write\")))
               (:module \"csn\" :serial t
                :components ((:file \"package\") (:file \"registry\")))
               (:module \"cache\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"build\") (:file \"core\")
                             (:file \"read\") (:file \"clock\") (:file \"write\")))
               (:module \"execution\" :serial t
                :components ((:file \"package\") (:file \"queue\") (:file \"writer\")
                             (:file \"handoff\") (:file \"ready-types\") (:file \"ready\")
                             (:file \"ready-recycle\")
                             (:file \"worker-types\") (:file \"worker-boundary\") (:file \"worker-claim\") (:file \"worker-run\")))
               (:module \"scheduler\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"build\")
                             (:file \"read\") (:file \"policy\") (:file \"update\")))
               (:module \"storage\"
                :serial t
                :components ((:file \"package\") (:file \"formats\") (:file \"segment-header\")
                             (:file \"log-header\") (:file \"compaction-scan\")
                             (:file \"control-payload\") (:file \"payload-record\")
                             (:file \"payload-write\")))
               (:module \"io\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"native\")
                             (:file \"lifecycle\") (:file \"transfer\") (:file \"flush\")))
               (:module \"wal\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"builder\")
                             (:file \"group\") (:file \"executor\") (:file \"csn\")))
               (:module \"series\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"ownership\")
                             (:file \"events\") (:file \"io-events\") (:file \"publication\")
                             (:file \"query\") (:file \"retirement\")
                             (:file \"worker-package\") (:file \"worker-types\")
                             (:file \"worker-boundary\") (:file \"worker-run\")
                             (:file \"routing-types\") (:file \"routing-build\") (:file \"routing-select\")))
               (:module \"index\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"core\")
                             (:file \"validation\") (:file \"read\") (:file \"write\") (:file \"relocate\")
                             (:file \"primary-package\") (:file \"primary-types\") (:file \"primary-core\")
                             (:file \"primary-build\") (:file \"primary-probe\") (:file \"primary-read\")
                             (:file \"primary-write\") (:file \"primary-relocate\")
                             (:file \"primary-arena\") (:file \"primary-directory\")
                             (:file \"rebuild-scan\") (:file \"rebuild-budget\")
                             (:file \"rebuild-copy\") (:file \"rebuild\")
                             (:file \"hash-seed\") (:file \"hash-digests\")))
               (:module \"mvcc\" :serial t
                :components ((:file \"package\") (:file \"types\")
                             (:file \"snapshots-types\") (:file \"snapshots-core\") (:file \"snapshots-csn\")
                             (:file \"snapshots-register\") (:file \"snapshots-lifecycle\")
                             (:file \"snapshots-read\")))
               (:module \"epochs\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"core\")
                             (:file \"read\") (:file \"retire\") (:file \"reclaim\")))
               (:module \"read\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"core\")
                             (:file \"task\")))
               (:module \"get\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"build\")
                             (:file \"lifecycle\") (:file \"lookup\") (:file \"target\") (:file \"segment\")))
               (:module \"recovery\"
                :serial t
                :components ((:file \"package\") (:file \"scan\")
                             (:file \"decisions-package\") (:file \"decisions-types\")
                             (:file \"decisions-sort\") (:file \"decisions-radix\") (:file \"decisions-build\")
                             (:file \"decisions-query\")
                             (:file \"manifest-package\") (:file \"manifest-types\")
                             (:file \"manifest-decode\") (:file \"manifest-fold\")
                             (:file \"manifest-build\") (:file \"manifest-query\")
                             (:file \"inventory-types\") (:file \"inventory-build\")
                             (:file \"inventory-query\")))
               (:module \"get-resolver\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"scan\") (:file \"sort\")
                             (:file \"rows\") (:file \"build\") (:file \"read\")
                             (:file \"active-types\") (:file \"active-directory\")
                             (:file \"active-scan\") (:file \"active-build\")
                             (:file \"active-preflight\") (:file \"active-read\")))
               (:module \"get-directory\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"build\") (:file \"read\"))))
  :in-order-to ((test-op (test-op \"arcdocdb/tests\"))))

(defsystem \"arcdocdb/tests\"
  :description \"Test di ArcDocDB.\"
  :author \"Giacomo Picchiarelli\"
  :license \"BSD-2-Clause\"
  :depends-on (\"arcdocdb\")
  :pathname \"tests/\"
  :serial t
  :components ((:file \"smoke\")
               (:module \"hash\" :serial t
                :components ((:file \"support\") (:file \"hash64\") (:file \"guards\") (:file \"threads\")))
               (:module \"foundation\"
                :serial t
                :components ((:file \"support\") (:file \"binary\")
                             (:file \"record\") (:file \"batch\")))
               (:module \"codec\" :serial t
                :components ((:file \"support\") (:file \"utf8\") (:file \"threads\")
                             (:file \"cbor-support\") (:file \"cbor-header\") (:file \"cbor-threads\")
                             (:file \"cbor-minimal-support\") (:file \"cbor-minimal\")
                             (:file \"cbor-minimal-threads\") (:file \"cbor-minimal-edges\")
                             (:file \"cbor-structure-support\") (:file \"cbor-structure\")
                             (:file \"cbor-structure-threads\")
                             (:file \"cbor-minimal-scan-support\") (:file \"cbor-minimal-scan\")
                             (:file \"cbor-minimal-scan-threads\")
                             (:file \"cbor-write-support\") (:file \"cbor-write\")
                             (:file \"cbor-write-threads\") (:file \"cbor-write-roundtrip\")
                             (:file \"cbor-string-write-support\") (:file \"cbor-string-write\")
                             (:file \"cbor-string-write-threads\")
                             (:file \"cbor-simple-write-support\") (:file \"cbor-simple-write\")
                             (:file \"cbor-simple-write-threads\")))
               (:module \"csn\" :serial t
                :components ((:file \"support\") (:file \"registry\") (:file \"threads\")))
               (:module \"mvcc\" :serial t
                :components ((:file \"support\") (:file \"lifecycle\") (:file \"capture\")))
               (:module \"epochs\" :serial t
                :components ((:file \"support\") (:file \"lifecycle\") (:file \"threads\")))
               (:module \"read\" :serial t
                :components ((:file \"support\") (:file \"lifecycle\") (:file \"threads\")))
               (:module \"get\" :serial t
                :components ((:file \"support\") (:file \"lifecycle\") (:file \"segment\")))
               (:module \"get-performance\" :serial t
                :components ((:file \"support\") (:file \"paths\") (:file \"guards\") (:file \"threads\")))
               (:module \"get-directory\" :serial t
                :components ((:file \"support\") (:file \"construction\") (:file \"read\") (:file \"threads\")))
               (:module \"execution\" :serial t
                :components ((:file \"support\") (:file \"queue\") (:file \"threads\")
                             (:file \"handoff\") (:file \"ready\") (:file \"ready-recycle\") (:file \"worker\")))
               (:module \"scheduler\" :serial t
                :components ((:file \"support\") (:file \"controller\")))
               (:module \"storage\"
                :serial t
                :components ((:file \"support\") (:file \"segment-header\") (:file \"log-header\")
                             (:file \"compaction-scan\")
                             (:file \"control-payload\")))
               (:module \"io\" :serial t
                :components ((:file \"support\") (:file \"transfer\") (:file \"native\")))
               (:module \"recovery\"
                :serial t
                :components ((:file \"support\") (:file \"scan\") (:file \"corruption\")
                             (:file \"decisions-support\") (:file \"decisions\")
                             (:file \"decisions-audit\") (:file \"decisions-radix\") (:file \"manifest-support\")
                             (:file \"manifest\") (:file \"manifest-audit\")
                             (:file \"inventory-support\") (:file \"inventory\")))
               (:module \"wal\" :serial t
                :components ((:file \"support\") (:file \"builder\") (:file \"group\") (:file \"fault\")
                             (:file \"native\") (:file \"csn\") (:file \"csn-threads\")))
               (:module \"series\" :serial t
                :components ((:file \"support\") (:file \"controller\") (:file \"boundaries\") (:file \"threads\")
                             (:file \"worker-bridge\") (:file \"worker-routing\")))
               (:module \"index\" :serial t
                :components ((:file \"slot-support\") (:file \"slots\") (:file \"slot-threads\")
                             (:file \"primary-support\") (:file \"primary\") (:file \"primary-threads\")
                             (:file \"rebuild\") (:file \"hash-digests\"))))
  :perform (test-op (o c)
             (uiop:symbol-call '#:arcdocdb.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.hash64.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.foundation.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.utf8.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.minimal.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.structure.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.minimal.scan.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.string.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.cbor.simple.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.csn.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.mvcc.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.epochs.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.read.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.get.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.get.performance.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.get.directory.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.execution.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.scheduler.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.storage.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.io.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.recovery.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.wal.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.series.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.index.slots.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.index.primary.tests '#:run)))
")
  (:PATH
   #A((91) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/README.md")
   :BYTES 7597 :SHA256 "c713c63c5627a88c325ecb05eab3ed2fda2b7d14491c476db4eb19ba5ec5d8aa" :GIT-BLOB
   "ed26c6100142ed7ec481b0353a3fa3d1ec86a7e5" :TEXT "# Implementazione

Fondazioni introdotte dopo la richiesta dell'autore del 2026-10-08 di iniziare la scrittura
del codice. L'autorizzazione non equivale alla chiusura dei criteri della Fase 0 o alla
qualifica del motore completo.

| Modulo | Contratto e verifica | Codice |
|---|---|---|
| Fondazioni binarie | [Record v1/v2, CRC32C e lotti SEAL](fondazioni-binarie.md) | [`src/foundation/`](../../src/foundation/) |
| Testo UTF-8 | [Validazione limitata, pura e parallela](utf8.md) | [`src/codec/utf8.lisp`](../../src/codec/utf8.lisp) |
| Testate CBOR | [Lettura pura in sei valori](cbor-header.md) | [`src/codec/cbor-header.lisp`](../../src/codec/cbor-header.lisp) |
| Testate CBOR minime | [Larghezze di argomenti e float, senza decodifica](cbor-minimo.md) | [`src/codec/cbor-minimal.lisp`](../../src/codec/cbor-minimal.lisp) |
| Scrittura delle testate CBOR | [MT0..6 minimi, destinazione privata e preflight](cbor-scrittura.md) | [`src/codec/cbor-write.lisp`](../../src/codec/cbor-write.lisp) |
| Scrittura delle stringhe CBOR | [Item MT2/3, budget completo, UTF-8 e overlap](cbor-stringhe.md) | [`src/codec/cbor-string-write.lisp`](../../src/codec/cbor-string-write.lisp) |
| Scrittura dei valori semplici CBOR | [Codici wire MT7, preflight e destinazione privata](cbor-semplici.md) | [`src/codec/cbor-simple-write.lisp`](../../src/codec/cbor-simple-write.lisp) |
| Struttura CBOR | [Item completo, UTF-8 e budget con scratch per worker](cbor-struttura.md) | [`src/codec/cbor-scan.lisp`](../../src/codec/cbor-scan.lisp) |
| Item CBOR con testate minime | [Un attraversamento, limiti e scratch privato](cbor-minimo-struttura.md) | [`src/codec/cbor-scan-minimal.lisp`](../../src/codec/cbor-scan-minimal.lisp) |
| CSN di Archivio | [Registro dei commit in corso e orizzonte](csn.md) | [`src/csn/`](../../src/csn/) |
| Metadati storage | [Header dei segmenti, EDIT e DECISION](metadati-storage.md) | [`src/storage/`](../../src/storage/) |
| Header dei log | [Identità e integrità di control e multiserie](header-log.md) | [`src/storage/log-header.lisp`](../../src/storage/log-header.lisp) |
| Segmenti compattati | [Prefisso CLOSED e record ordinari](segmenti-compattati.md) | [`src/storage/compaction-scan.lisp`](../../src/storage/compaction-scan.lisp) |
| Code dei writer | [MPSC locale, gettone e tratti limitati](code-writer.md) | [`src/execution/`](../../src/execution/) |
| Consegna dei writer | [Idle, pronto, in esecuzione e obbligo di scheduling](writer-handoff.md) | [`src/execution/handoff.lisp`](../../src/execution/handoff.lisp) |
| Lista dei writer pronti | [Ring preallocati, partizioni indipendenti e scansione limitata](writer-ready.md) | [`src/execution/ready.lisp`](../../src/execution/ready.lisp) |
| Ricircolo dei writer pronti | [Scambio FIFO atomico a ring pieno](writer-recycle.md) | [`src/execution/ready-recycle.lisp`](../../src/execution/ready-recycle.lisp) |
| Contesto worker | [Lease, batch confermati, retry e fault locale](writer-worker.md) | [`src/execution/worker-types.lisp`](../../src/execution/worker-types.lisp) |
| Integrazione dei worker | [Base comune, scope e controllo completo](writer-worker-integrazione.md) | [`arcdocdb.asd`](../../arcdocdb.asd) |
| Controllore del pool | [Target limitato, EWMA, AIMD e isteresi](controllore-pool.md) | [`src/scheduler/`](../../src/scheduler/) |
| Confine I/O | [Append, pread e flush durevole](io.md) | [`src/io/`](../../src/io/) |
| Lotti WAL | [Formazione, SEAL e group commit](wal.md) | [`src/wal/`](../../src/wal/) |
| CSN dei lotti WAL | [Chiusura, token e risoluzione](wal-csn.md) | [`src/wal/csn.lisp`](../../src/wal/csn.lisp) |
| Controller della Serie | [Pubblicazione FIFO, token e ritiro I/O](controller-serie.md) | [`src/series/`](../../src/series/) |
| Worker e Serie | [Doppia lease, debito batch e ordine dell'handoff](worker-serie.md) | [`src/series/worker-run.lisp`](../../src/series/worker-run.lisp) |
| Routing dei worker | [Ordinali immutabili, registro copiato e selezione diretta](routing-worker.md) | [`src/series/routing-select.lisp`](../../src/series/routing-select.lisp) |
| Verifica del controller | [Prove strutturate, copertura e misure parallele](controller-serie-risultati.md) | [`tests/series/`](../../tests/series/) |
| Slot dell'indice v2 | [Payload compatto, seqlock e rilocazione](slot-indice-v2.md) | [`src/index/`](../../src/index/) |
| Indice primario v2 | [Chiavi, gruppi Swiss e pubblicazione della directory](indice-primario.md) | [`src/index/primary-read.lisp`](../../src/index/primary-read.lisp) |
| Hash delle chiavi | [XXH64 tipizzato, seme immutabile e mappe fisiche](hash-chiavi.md) | [`src/hash/`](../../src/hash/) |
| Cache dei record | [Insiemi associativi, CLOCK e copie verificate](cache-record.md) | [`src/cache/`](../../src/cache/) |
| Prestazioni del nucleo GET | [Metodo, oracoli e stress parallelo](get-performance-metodo.md) | [`tests/get-performance/`](../../tests/get-performance/) |
| Percorso GET | [Candidato, fonte readonly, cache e conferma snapshot](get-record.md) | [`src/get/`](../../src/get/) |
| Verifica GET | [Prima suite funzionale, metodo e limiti](get-verifica.md) | [`tests/get/`](../../tests/get/) |
| Collegamento CSN/snapshot | [Registro unico e coordinamento senza attese](snapshot-csn.md) | [`src/mvcc/snapshots-csn.lisp`](../../src/mvcc/snapshots-csn.lisp) |
| Verifica snapshot e CSN | [Metodo preregistrato, decisioni e limiti](snapshot-verifica.md) | Registro e adattatore già presenti in `src/mvcc/` |
| Registro snapshot | [Pin, identità, attivazione e scadenza](registro-snapshot.md) | [`src/mvcc/snapshots-register.lisp`](../../src/mvcc/snapshots-register.lisp) |
| Epoche e reclaim | [Slot dei reader e ticket limitati per i segmenti](epoche-e-reclaim.md) | [`src/epochs/`](../../src/epochs/) |
| Compiti di lettura | [Ingresso EBR, controlli snapshot e cleanup](compiti-lettura.md) | [`src/read/`](../../src/read/) |
| Verifica EBR e lettura | [Suite, metodo, mutanti e limiti](lettura-verifica.md) | [`tests/epochs/`](../../tests/epochs/) e [`tests/read/`](../../tests/read/) |
| Resolver GET CLOSED | [Frontiera dal manifest, flag e prova OUTCOME](get-resolver.md) | [`src/get-resolver/`](../../src/get-resolver/) |
| Directory GET CLOSED | [Selezione limitata del segmento nella Serie](get-directory.md) | [`src/get-directory/`](../../src/get-directory/) |
| Resolver GET ACTIVE ordinario | [Lotti verificati, root della Serie e directory persistente](get-active.md) | [`src/get-resolver/active-build.lisp`](../../src/get-resolver/active-build.lisp) |
| Scansione recovery | [Prefisso dei log e testimonianze SEAL](scansione-log.md) | [`src/recovery/`](../../src/recovery/) |
| Decisioni multiserie | [Tabella TXID, CSN e partecipanti](decisioni-multiserie.md) | [`src/recovery/decisions-build.lisp`](../../src/recovery/decisions-build.lisp) |
| Manifest della Serie | [Ripiegamento degli EDIT del control log](manifest-control-log.md) | [`src/recovery/`](../../src/recovery/) |
| Inventario recovery | [Piano di riconciliazione dei nomi dei segmenti](inventario.md) | [`src/recovery/inventory-build.lisp`](../../src/recovery/inventory-build.lisp) |
| Ordinamento delle decisioni | [Radix misurato e query concorrenti](decisioni-radix-risultati.md) | [`src/recovery/decisions-radix.lisp`](../../src/recovery/decisions-radix.lisp) |

Le evidenze hanno un ambito esplicito: un test del codec non verifica transazioni,
durability, recovery o prestazioni del database.

Gli [esiti dei processi nelle mutazioni CBOR](cbor-mutazioni-processi.md)
distinguono i rilevamenti dei mutanti dagli errori dei worker di verifica.
")
  (:PATH
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/controllore-pool-decisioni.md")
   :BYTES 1424 :SHA256 "1deb86de4dd82c8152a9178d948ab4b883bd5e696b9e600f263b5fb393ef6109" :GIT-BLOB
   "15c6e4b9b671396d935faa3a60015ecdfd57b755" :TEXT "# Decisioni del controllore del pool

Il componente è C3 ([ADR-0031](../adr/0031-software-critico-criteri-e-priorita.md));
la copertura minima è 95% di istruzioni e rami su tutti i sei file di
[`src/scheduler/`](../../src/scheduler/), inclusi gli accessor generati.
Non si deduce MC/DC dalla copertura dei rami. Le decisioni composte sono
elencate comunque per facilitare le due letture.

| Decisione | Condizioni, in ordine | Prova prevista |
|---|---|---|
| `%pool-range` | fixnum; lower ≤ value ≤ upper | tipo non intero, bignum, minimo/massimo validi e fuori intervallo |
| `%pool-direction` shrink | P99 ≥1200; oppure coda <1 e CPU ≤300 | P99 degradato con coda alta; coda vuota con CPU bassa/alta; coda occupata con CPU bassa |
| `%pool-direction` grow | coda ≥queue-high; CPU <700; P99 ≤1000 | soglie inclusive/esclusive e blocco per ciascun segnale |
| aggiornamento reset | primo campione; oppure gap >2×period | primo tick zero/nonzero, gap uguale al limite e un tick oltre |

Tutti i segnali confrontati sono EWMA con scala 256. Le soglie sono una
politica iniziale esplicita e configurabile solo per pressione della coda;
non sono tarate su carichi del database. Le condizioni singole comprendono
owner, intervallo dei campioni, limiti target, clock interno, pending,
direzione, permanenza e clamp. La fault injection è limitata alle due
invarianti controllate e alla direzione privata inattesa.
")
  (:PATH
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/controllore-pool-metodo.md")
   :BYTES 8608 :SHA256 "d0de0ed4012781b0c7acf16f74fa8dfdcf13a3e009c1f26b29cea7cb06cab6bc" :GIT-BLOB
   "30b830f5e01fb9941b7f4f64155865cd10f67bec" :TEXT
   "# Metodo preregistrato del controllore di calcolo

Preregistrazione del 2026-10-13, prima delle campagne del componente, sulla
base `4344d9e1f2ceb45e5fa3d5076b57d09505e69ac3`. Scope: nuovo package
`arcdocdb.scheduler`, configurazione e stato owner-only, EWMA fixed-point,
policy bounded e getter, integrazione ASDF, test, documentazione e misure
locali. Il [contratto](controllore-pool.md) fissa API, domini e limiti.

Il componente è C3: [ADR-0031](../adr/0031-software-critico-criteri-e-priorita.md)
richiede lo standard integrale, una revisione e copertura di istruzioni e
rami almeno 95%. La lettura ulteriore sui dodici punti C1 è un rafforzamento
della verifica; non cambia classe né qualifica il percorso dei dati.
REQ-THR-001 è soddisfatto soltanto nella parte di controllo; REQ-AFF-008/013
e REQ-CON-005 delimitano budget, tempo iniettato e separazione dal percorso
delle richieste. REQ-OBS-001/002 e un pool operativo restano fuori scope.

## Controlli previsti

- Configurazione default ed esplicita, limiti cores 1/65536 e maximum 2×cores,
  minimum/maximum/initial coerenti. Valori negativi, zero dove vietato,
  valori oltre budget, float, simboli, stringhe e NIL fuori contratto sono
  rifiutati prima della pubblicazione dell'istanza.
- Period 1..2^20, dwell da period a 2^20 e queue-high1..2^20: soglie esatte,
  interval mismatch e budget sbagliati sono rifiutati. Nessun default è
  presentato come risultato di calibrazione o come unità temporale implicita.
- Domini completi dei campioni; actual è minimum..maximum, compreso il
  rifiuto di zero prima dell'avvio confermato. Snapshot pubblico dei sette
  valori invariato dopo ogni input rifiutato, anche con sensori già
  inizializzati e target pending; configurazione immutabile e validazione
  completa prima delle scritture verificate in lettura del sorgente.
- Tick iniziale zero, massimo 2^40−1, duplicati, regressioni, delta sotto
  period, delta uguale a period e a 2×period. Un gap maggiore di 2×period
  resetta EWMA e permanenza; non conta tempo di cui manca l'osservazione.
  Nessun wrap; la sottrazione esatta resta entro fixnum, anche quando il
  delta negativo serve a rifiutare una regressione prima della mutazione.
- EWMA iniziale esatta e successive floor((7E+256x)/8), incluse frazioni
  perse, sequenze alternate, tutti i segnali al massimo, ritorno verso zero
  e intervalli validi diversi. L'oracolo usa aritmetica razionale nel solo
  harness per confrontare i valori interi e l'arrotondamento del prodotto.
- Soglie composte, ciascun operando decisivo nei casi di test: coda<1 e
  CPU≤300 per riduzione idle; P99≥1200 che prevale anche con coda alta;
  coda≥queue-high, CPU<700 e P99≤1000 per crescita. Input ed EWMA scalate
  non si confondono. Provare i valori appena sotto, uguali e appena sopra.
- Permanenza inclusiva dwell; primo candidato, ripetizione, cambio di
  direzione, hold intermedio, gap e pending azzerano la continuità. Dopo un
  comando serve una nuova permanenza. Nessuna azione implicita al primo
  campione se manca una permanenza già osservata.
- AIMD: +1 e floor(3×target/4), inclusi arrotondamento, saturazione al massimo
  e clamp al minimo. Ai limiti, risultato hold senza falso comando grow/shrink.
  Il target non esce mai dall'intervallo configurato.
- Actual diverso dal target: EWMA aggiornate, target identico e pending,
  anche con molti campioni o pressione invertita. Conferma successiva del
  target riparte con una nuova permanenza. Una crescita pending con P99
  degradato resta pending: la fixture deve mostrare esplicitamente questo
  limite, senza dichiarare una revoca assente.
- Getter con sette valori prima e dopo campioni, rifiuti e comandi; nessun
  accesso owner estraneo. Secondo thread reale per il rifiuto del proprietario
  su aggiornamento e getter; deadline e sincronizzazione appartengono al
  solo harness. Controllori su thread diversi non condividono stato locale.
- Tracce finite con inversione brusca di carico, oscillazioni attorno alle
  soglie, assenza prolungata di campioni e attuazione ritardata. Oracolo
  indipendente per target, esito, sensori, candidato e permanenza. Non si
  deduce stabilità di un sistema reale da tracce sintetiche.
- Invarianti verificati della rappresentazione privata: target fuori
  minimum..maximum e origine della permanenza oltre l'ultimo tick; iniezioni
  a quiescenza conservate senza riparazione. Direzione privata inattesa
  rifiutata dal helper AIMD. I domini degli slot sono protetti dai tipi e
  dalla factory, senza promettere rilevamento di ogni corruzione arbitraria.
  Diagnosi typed e rifiuti ordinari distinguibili; ogni ramo nuovo resta nel
  denominatore della copertura.

## Analisi, copertura e misura

Compilazione senza warning/style-warning, safety 3, dichiarazioni di tipi,
slot read-only dove appropriato, docstring e commenti REQ/OWNER/SHARED.
Verificare funzioni entro 60 righe, complessità contenuta, nessun ciclo o
attesa nascosti, nessuna sorgente temporale letta dal componente e nessun
aggiornamento condiviso per richiesta. La policy opera solo dentro barriere
che non cambiano dati, obblighi o lease di C1/C2.

Una prima e una seconda lettura della modifica confrontano sorgenti e
contratto; l'inventario conserva predicati scalari, decisioni composte,
precondizioni, postcondizioni ed eventuali macro/delegati. Le due letture
sono agenti automatici, non una certificazione o indipendenza umana.

La copertura include tutti i file del package, compresi package e helper,
senza attribuire al nuovo componente rami dei vecchi worker. Conservare
rapporti nativi e HTML, denominatori e identità di tutti i percorsi mancanti,
senza esclusioni implicite. Confrontare la misura con il minimo C3 del 95%
per istruzioni e rami; `sb-cover` non attesta MC/DC. Un'eventuale lacuna
resta dichiarata, non eliminata dal denominatore.

La misura locale del percorso normale esclude factory, startup e GC e
usa controllore, input, target ed oracolo preallocati. Warmup e cinque
campioni bounded conservano heap, tick grezzi e risultato osservato;
coprire aggiornamento inizializzato, hold, pending e azioni applicate dal
solo harness. Lo strumento C4 deve rilevare heap positivo e risultato errato
e indicare un clock sotto risoluzione; compilazione e self-test sono conservati.
Le misure riguardano questo calcolo, non un pool reale o i target del motore.

Il driver `tools/pool-controller-bench.lisp` fissa warmup 128 e cinque
campioni da 4096 cicli. Ogni ciclo contiene 160 update/getter del controllore
principale, con 80 input di coda alta e 80 di coda vuota, più un update/getter
pending e uno hold su due controllori privati distinti: 162 passi per ciclo.
CPU e P99 sono costanti nella trace principale; l'oracolo startup calcola
EWMA, target, candidato e origine della permanenza. I casi P99 e le soglie
restano anche nei vettori attesi dei test, senza inferire esplorazione
esaustiva della macchina a stati.

Build e test mirati precedono il controllo generale sul codice congelato.
Ogni campagna usa `tools/record-command.lisp` con argv, ambiente, output,
errori e snapshot iniziale/finale; i tentativi falliti sono conservati.
Cache e copie congelate separano i test dagli altri lavori nel repository.
Byte originali e SHA degli artefatti pubblicati sono verificati; nessun
output mancante è ricostruito come se provenisse dal processo iniziale.

I [risultati](controllore-pool-risultati.md) devono distinguere prove eseguite,
limiti e lavoro residuo. La [lettura del codice](controllore-pool-revisione.md)
rimane distinta dai record dei processi e dalle misure.
RSK-12 resta aperto su sensori, feedback reale, ritardo dell'attuatore,
stabilità e taratura. Pool vivo, park/wake, admission, retirement, shutdown,
I/O, compaction e coordinatore Archivio non sono inclusi; né i gate delle
fasi né gli stati `progettato` dei requisiti vengono chiusi dalla campagna.

## Chiusura del metodo prima della campagna congelata

I tentativi preliminari hanno richiesto checkpoint SAVE-COVERAGE dopo
ciascun caricamento per conservare anche le esecuzioni di startup, prima
che i componenti temporanei siano recuperati dal GC. Il conteggio finale
include ancora tutti i record nativi, senza esclusioni né modifiche dei
segni. Il confronto EQUALP generato è nel denominatore: due controllori
identici e differenze isolate in period, dwell, queue-high, CPU e P99
esercitano entrambi gli esiti dei suoi confronti. La suite finale ha
23 prove; le fixture da 20 prove lette nella prima revisione sono
conservate come preimmagine. I sei sorgenti di prodotto sono invariati.
")
  (:PATH
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/controllore-pool-revisione-2.md")
   :BYTES 5120 :SHA256 "244d28ca1fcfe4795b31701fabe99ee253f9d3723e67a560af575af76946a012" :GIT-BLOB
   "18b67528a581db82aa5fd6c99282ebe3026d3813" :TEXT "# Seconda lettura del controllore del pool

Lettura del 2026-10-13 da un agente distinto dall'autore del prodotto, su
`src/scheduler/{package,types,build,read,policy,update}.lisp`, test e
strumento `tools/pool-controller-bench.lisp`. Il componente è C3; questa
lettura usa anche i dodici punti C1 come controllo ulteriore. Ho letto la suite finale di 23 test, inclusa la fixture EQUALP con
cinque differenze singole provate in entrambi gli ordini. Non è una
revisione umana né una certificazione. Il [contratto](controllore-pool.md),
il [metodo](controllore-pool-metodo.md), l'[inventario](controllore-pool-decisioni.md)
e i [risultati conservati](controllore-pool-risultati.md) delimitano le conclusioni.

| Punto | Esito della lettura |
|---|---|
| 1. Requisiti e ADR | REQ-THR-001, REQ-CON-005 e REQ-AFF-008/013 indicati nelle definizioni. ADR-0011 consente la policy iniziale con pochi segnali; ADR-0031 la classifica C3 e ADR-0045 delimita l'esecuzione non bloccante. La modifica realizza il calcolo del target, senza dichiarare un pool operativo. |
| 2. Invarianti | Target entro minimum..maximum e since≤last controllati prima e dopo gli aggiornamenti. Test di fault injection della rappresentazione privata e della direzione inattesa; domini, clamp e proprietario hanno regressioni dedicate. Gli slot tipizzati proteggono la forma della rappresentazione. |
| 3. Errori | INVALID-ARGUMENT distingue configurazione, campioni, periodo e owner; INVARIANT-VIOLATION segnala stato privato. Il campione completo viene validato prima della prima scrittura. Test confrontano la preimmagine dopo rifiuti, anche sullo stato inizializzato/pending. Un errore del caller non viene trasformato in un comando applicato. |
| 4. Limiti | Prodotto senza loop, ricorsione, callback, attesa, thread nuovi o I/O. Core≤65536, worker≤131072, tempo<2^40 e segnali bounded; EWMA usa interi di grandezza fissa, senza denominatori crescenti. |
| 5. Heap caldo | Factory e trace sono startup. Update e getter restituiscono valori scalari e modificano slot preallocati. Il tool preregistra cinque repliche di 4096 cicli con 128 warmup, verifica tutti i sette valori e gli esiti grow/shrink/hold/pending. L'evidenza qualificata e i limiti del contatore sono nei risultati; la sola lettura non prova heap zero. |
| 6. Dati in uscita | Il getter verifica owner e invarianti. I due risultati dell'update arrivano dopo il controllo finale; sette risultati del getter senza riferimenti mutabili allo stato. La policy propone un target: il caller conferma actual e applica le variazioni con un futuro protocollo. |
| 7. Decisioni | Tabella delle decisioni per range, soglie e reset. Test esercitano operandi decisivi, soglie inclusive/esclusive, precedenza shrink, isteresi interrotta, pending, gap e limiti. La copertura include package, factory, helper, accessor e confronto EQUALP generati; i cinque confronti degli slot numerici sono verificati con uguaglianza e differenza singola. Non è MC/DC. |
| 8. Proprietario | Owner immutabile è il thread creatore. Getter e update verificano lo stesso thread; due controller non condividono stato. Commenti OWNER/SHARED collocano il controllo nella voce scheduler/metriche dell'elenco chiuso dell'architettura. |
| 9. Tracciabilità e check | Definizioni e test nominano gli ID esistenti; gli stati globali dei requisiti restano progettato. Build senza avvisi, copertura integrale C3, lint, trace, link e controllo generale devono risultare nello snapshot congelato descritto nei risultati. I dryrun durante gli edit non sostituiscono questi gate. |
| 10. Deviazioni | Safety3, tipi degli slot, configurazione read-only, ftype completi, funzioni brevi, docstring e REQ presenti. Nessuna deviazione nuova richiesta o identificata nella lettura. Gli strumenti C4 hanno self-test positivo/negativo e diagnosi nonzero. |
| 11. Parallelismo | Il controller serializza soltanto la propria amministrazione periodica sul suo owner. Nessun lock né scrittura condivisa per operazione tra Serie, nessun accesso alla ready list e nessuna inferenza EMPTY=quiescenza. Metriche reali, attuatore, park/wake e scaling restano fuori scope. |
| 12. Durabilità | Nessun cambiamento durevole, syscall, cancellazione, segmento, log o lease attraversa questa policy. Non introduce nuovi punti di atomicità o autorizzazioni di rimozione. |

Ho verificato due dettagli che limitano l'interpretazione della policy.
Dopo l'inizializzazione il getter restituisce un tick `since` anche quando
il candidato è `:hold`; NIL è riservato allo stato precedente al primo
campione. Se actual è diverso dal target, la policy continua ad aggiornare
i sensori e mantiene `:pending` anche se P99 peggiora. I test rendono
esplicito questo comportamento; diagnosi, revoca e scadenza dei comandi
sono responsabilità del futuro attuatore, senza claim di sicurezza del
feedback reale.

La revisione non identifica difetti bloccanti nel contratto limitato.
L'esito di pubblicazione dipende dai gate e dagli artefatti dello snapshot
congelato, non da questa lettura né dai dryrun. RSK-12 e lo sviluppo del
pool vivo restano aperti.
")
  (:PATH
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/controllore-pool-revisione.md")
   :BYTES 10325 :SHA256 "e9808608a7fa6f868c22fbf7c21429e60c0a9b9e77e9d336076faad163457663"
   :GIT-BLOB "c11c4866bb2698a43c9707878fc3b635d815daab" :TEXT
   "# Prima lettura del controllore di calcolo

Lettura statica del 2026-10-13 sulla base
`4344d9e1f2ceb45e5fa3d5076b57d09505e69ac3`, eseguita da un agente diverso
dall'autore del codice. Sono stati letti tutti i sei file del package,
l'integrazione ASDF, le fixture scheduler, il [contratto](controllore-pool.md),
il [metodo](controllore-pool-metodo.md), ADR-0011/0031/0035/0045 e lo
[standard](../affidabilita/standard-di-codifica.md).

Il componente è C3. I dodici punti C1 sono utilizzati come lista aggiuntiva:
questa lettura non attribuisce classe C1 alla policy e non sostituisce build,
copertura, misura o controllo generale. Nessun test è stato eseguito dal
revisore. I risultati delle campagne devono essere collegati separatamente.

| File letto | SHA-256 |
|---|---|
| `src/scheduler/package.lisp` | `1ae4001c0349d4e9f7d282e9c05129573149d50418880073789a46fa18b1968b` |
| `src/scheduler/types.lisp` | `3b174be0919f8b27312ada4071d831c3753d62bb12be99d7e9394c48dcab474a` |
| `src/scheduler/build.lisp` | `58baf595f221826c64e3fb38344242c3bdf403d65904193bf1a8e06e09d7c336` |
| `src/scheduler/read.lisp` | `5cdc1e5b7ba97c9aab66a5acaf74336b0df33144e24104e0242b7fc2552a1ae2` |
| `src/scheduler/policy.lisp` | `92b3ca3a81ae0b3ac342a63e5fe5c5d7524091a63065b0232c14c57ee80c4aac` |
| `src/scheduler/update.lisp` | `e35a704ee0b9445c559a768de048169a8e39837a6df21843d8df58215c482472` |
| `tests/scheduler/support.lisp` | `d8aeec53062cccf036c693ff709baf1086e331f8a247a5693b82c0ff1c7a4401` |
| `tests/scheduler/controller.lisp` | `04a223429449e26eae1a651e74b7b736e5952a08f1cee6aacf066c53c7ab0c7d` |
| `arcdocdb.asd` | `3593d876c5096f55a472f742f1de5f74eb4518f561953e75518d2e6efe93a23e` |

## Dodici punti

1. **Requisiti e ADR:** REQ-THR-001, REQ-CON-005 e REQ-AFF-008/013
   identificano policy, separazione dal percorso caldo, limiti e ingressi
   iniettati. ADR-0011 richiede EWMA/AIMD/isteresi; ADR-0031 limita C3 a
   scelte di risorse. La policy non scrive alcun dato C1/C2 e non dichiara un
   pool completo o sensori di REQ-OBS-001/002.
2. **Invarianti:** owner corrente, target minimum..maximum, since≤last;
   campioni e intermedi aritmetici limitati, nessun wrap del tick. La factory
   valida gli ordinamenti e i tipi degli slot preservano i domini. Le fixture
   leggono il getter pubblico per confrontare sensori, candidato e clock;
   le iniezioni quiescenti di target e clock verificano entrambi i rami
   invariant. Il helper AIMD è provato con un simbolo estraneo.
3. **Errori:** tutte le ragioni input sono esplicite; owner e stato si
   verificano prima di validare il campione. La validazione completa precede
   il primo setf. Configurazione e rifiuti campione sono coperti da fixture
   staticamente presenti, incluse le iniezioni dei rami invariant e della
   direzione privata inattesa. Il tipo symbol del helper rende raggiungibile
   il suo rifiuto esplicito. Non si nascondono condizioni e non esistono
   handler o rollback nel prodotto.
4. **Limiti:** non ci sono cicli, ricorsioni, lock, attese o retry nei sei
   sorgenti. L'aritmetica EWMA ha massimo intermedio 2^31; i tick sono interi
   limitati a 2^40−1. I due confronti temporali usano soltanto input validati
   e campi locali coerenti. Pending è un esito di una chiamata breve, non un
   thread in attesa dell'attuatore.
5. **Allocazione:** factory separata; nessuna lista, closure, copia, hash,
   allocazione esplicita o razionale crescente nei passi e nel getter.
   `%pool-range` usa tipo fixnum e confronto scalare, senza costruire una
   specifica di tipo a runtime. L'assenza di heap osservato resta da misurare
   con sensore C4 verificato, non si deduce dalla sola lettura.
6. **Dati verificati:** il getter espone sette valori scalari dopo owner e
   invarianti, senza pubblicare rappresentazione o capacità mutabile.
   L'aggiornamento espone target bounded e quattro esiti chiusi. Nessun dato
   di richiesta, Serie o storage entra o esce dal package.
7. **Decisioni:** inventario completo dei predicati espliciti e dei delegati
   qui sotto. Le soglie composte hanno fixture che rendono decisivo ogni
   operando. Per C3 non è prescritto MC/DC; non si inferisce tale proprietà
   da numeri di test o sb-cover.
8. **Proprietà:** owner immutabile creato sul thread scheduler, getter e
   aggiornamento owner-only, API non rientranti e prive di callback. Nessuno
   stato globale mutabile. La fixture foreign-owner conserva lo snapshot del
   proprietario; otto thread costruiscono ciascuno un controllore privato,
   dopo una barriera del solo harness con timeout di 15 secondi.
9. **Tracciabilità e verifica:** definizioni e test nominano i requisiti;
   ASDF carica il package dopo execution e i test scheduler nel controllo
   generale. Build, heap, copertura e `make check` non sono stati eseguiti
   dal revisore; il minimo C3 è 95% di istruzioni e rami, non una percentuale
   già raggiunta dalla presenza dei test. Le campagne e le loro lacune vanno
   lette nei [risultati](controllore-pool-risultati.md).
10. **Standard:** safety 3, tipi completi delle funzioni, slot typed/read-only
    e copier NIL, docstring e OWNER/SHARED. Corpi entro 60 righe e complessità
    contenuta; nessuna nuova macro, syscall, `ignore-errors` o eccezione di
    compilazione. Non è stata identificata una deviazione da registrare;
    lint e build rimangono verifiche eseguibili distinte dalla lettura.
11. **Parallelismo:** nessuna scrittura comune per richiesta né dipendenza
    fra Serie; la policy opera nella voce scheduler/metriche dell'elenco
    chiuso. I test paralleli verificano isolamento locale e determinismo
    delle EWMA, senza misurare scalabilità, fairness o isolamento del motore.
12. **Durabilità:** nessun cambiamento persistente, file, lease, batch,
    controller Serie o CSN toccato. Non esiste un punto di atomicità su disco
    da dichiarare per questo componente.

## Inventario dei predicati

L'inventario è una lettura del sorgente, non un rapporto di copertura.
Tipi degli slot, forme package/ASDF e codice prodotto dalle forme di
definizione restano nell'ambito dei file completi del denominatore sb-cover.

| ID / funzione | Predicato o ramo esplicito | Effetto |
|---|---|---|
| B01 / `%pool-range` | `and` di tipo fixnum e range lower..upper | Entrambi veri restituisce il valore; altrimenti invalid typed prima della mutazione. |
| B02 / factory | Maximum presente | Usa maximum, oppure default 2×cores. NIL esplicito usa il default. |
| B03 / factory | Initial presente | Usa initial, oppure minimum. NIL esplicito usa il default. |
| C01 / `%check-pool` | Owner EQ thread corrente | Estraneo invalid prima di ogni lettura di stato pubblica o scrittura. |
| C02 / `%check-pool` | Minimum≤target≤maximum | Incoerente invariant `:pool-state`. |
| C03 / `%check-pool` | Since≤last | Incoerente invariant `:pool-state`. |
| G01, G02 / getter | Initialized, due occorrenze | Last/since numerici dopo campione, NIL prima. |
| E01 / `%pool-ewma` | Reset | Campione×256, oppure floor della media 1/8. |
| D01 / `%pool-direction` | `or` di P99≥1200×256 e `and` coda<256/CPU≤300×256 | Shrink con precedenza. |
| D02 / `%pool-direction` | `and` coda≥queue-high×256, CPU<700×256, P99≤1000×256 | Grow soltanto se shrink falso e tutti veri. |
| D03 / `%pool-direction` | Fallback cond | Hold esplicito. |
| A01 / `%pool-apply` | Case grow/shrink/hold/otherwise | Target successivo bounded; direction privata estranea invariant. |
| A02 / `%pool-apply` | Target successivo uguale al corrente | Hold e reset, anche quando una direzione incontra il limite. |
| A03 / `%pool-apply` | Direzione diversa dal candidato | Avvia nuova permanenza; nessuna azione. |
| A04 / `%pool-apply` | Elapsed<dwell | Hold; soglia inclusiva agisce nel fallback. |
| A05 / `%pool-apply` | Fallback cond | Applica target e resetta candidato hold/since=tick. |
| S01 / `%pool-sample` | Initialized | Prima chiamata senza delta; dopo, valida almeno period. |
| S02 / `%pool-sample` | Delta≥period | Troppo breve/regressivo invalid prima delle scritture. |
| U01 / aggiornamento | `or` non-initialized/gap>2×period | Reset sensori e permanenza; gap esatto 2 period continua. |
| U02 / aggiornamento | Reset | Candidato :hold e since=tick, poi valutazione del campione corrente. |
| U03 / aggiornamento | Actual diverso dal target | Sensori aggiornati, pending con target identico e reset della permanenza. |

Delegati dell'aggiornamento: `%check-pool` prima e dopo, `%pool-sample`
completo prima del setf, tre `%pool-ewma`, `%pool-direction` e `%pool-apply`.
Il getter delega un `%check-pool`. Le chiamate a `%pool-range` hanno limiti
letterali o derivati dalla configurazione validata; non sono loop o retry.

## Lacune e rischi dichiarati

Nessun bug funzionale è stato identificato nella lettura della versione
descritta. La rilettura finale include i due verificatori invariant, il
rifiuto del simbolo direction estraneo e la barriera degli otto thread;
gli SHA sopra identificano questi sorgenti. Nessun ramo va rimosso dal
denominatore prima di valutare il 95%.

L'oracolo parallelo della suite confronta i sensori EWMA; gli esiti della
policy nelle inversioni P99 sono controllati da vettori attesi manuali.
Il C4 `tools/pool-controller-bench.lisp` aggiunge un oracolo startup della
traccia grow/shrink con CPU/P99 costanti, confrontando tutte le sette uscite
ad ogni passo, più pending e hold. È una trace finita specifica, non una
dimostrazione esaustiva della policy o del feedback reale.

La policy non rileva ogni alterazione arbitraria dei campi privati. Una
crescita pending resta target anche se P99 peggiora; nessuna revoca o
scadenza dell'attuatore è implementata. Gap resetta l'evidenza di permanenza
e può ritardare indefinitamente un comando in presenza di campioni troppo
sporadici; è una scelta conservativa, non una garanzia di progresso.

Actual è un numero attestato dal caller, non contato dal componente.
Conferme sbagliate o metriche errate possono produrre scelte sbagliate di
risorse, ma la policy non può modificare dati C1/C2. Mancano attuatore,
protocollo di comandi obsoleti, wake/park e shutdown; RSK-12 resta aperto su
feedback reale e calibrazione. La verifica finale del prodotto e del C4 e
i byte delle prove sono responsabilità delle campagne separate.
")
  (:PATH
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/controllore-pool-risultati.md")
   :BYTES 4812 :SHA256 "e640744066d5cbf3db0c862a9d60a3f0ce91baa5ef21a573c7cafa2bd26eba20" :GIT-BLOB
   "db5a0cd0013656e8671772bec7941d476e0821f0" :TEXT "# Verifica del controllore del pool

Il componente C3 calcola un target bounded, con EWMA intere, AIMD e
permanenza delle condizioni. [Contratto](controllore-pool.md),
[metodo](controllore-pool-metodo.md), [decisioni](controllore-pool-decisioni.md),
[prima lettura](controllore-pool-revisione.md) e
[seconda lettura](controllore-pool-revisione-2.md) delimitano la verifica.
La base integrata è `4344d9e1f2ceb45e5fa3d5076b57d09505e69ac3`.

## Campagna congelata

Tutti gli esiti positivi sono OK/STABLE/exit 0 su 740 sorgenti e documenti
invariati nella copia congelata. Il catalogo dei byte originali è
[`2026-10-13-pool-controller`](../../spikes/results/2026-10-13-pool-controller/).
Le due letture e la preregistrazione precedono questi processi.

| Processo | Record | Esito |
|---|---|---|
| Copertura e 23 fixture | `4000906285-command-38489-0` | 344/348 espressioni, 50/50 rami |
| Compilazione e self-test del sensore | `4000906285-command-38487-0` | OK; controlli positivi e rifiuti attesi |
| Cinque repliche della misura | `4000906340-command-39064-0` | OK; zero byte heap in ciascuna replica |
| Controllo generale | `4000906339-command-39039-0` | OK; 998 prove nominate e 2 smoke |

Il controllo generale dura 200,078223 s: comprende build, lint e relativo
self-test, self-test dei runner snapshot/reader, tracciabilità, link,
self-test delle evidenze, cataloghi e dieci esperimenti F0. I 460160 byte
stderr sono note di compilazione: il build tratta warning e style-warning
come errori. I dieci esperimenti sono COMPLETE e conservati con i loro
raw, compreso il master `4000906505-check-41362-0`. La durata del controllo
non è una misura del percorso caldo.

## Copertura completa del package

| File | Espressioni hit/totale | Rami hit/totale |
|---|---:|---:|
| package | 1/1 | 0/0 |
| types, compresi helper generati | 25/25 | 10/10 |
| build | 74/78 | 4/4 |
| read | 46/46 | 10/10 |
| policy | 93/93 | 16/16 |
| update | 105/105 | 10/10 |
| Totale | 344/348, 98,85% | 50/50, 100% |

Nativo e HTML coincidono per tutti i sei file. Le quattro espressioni
mancanti di build restano nel denominatore: indici nativi 78..81, percorsi
`(2 2 5)`, `(5 2 5)`, `(6 2 5)`, `(7 2 5)`, inizializzatori degli argomenti
facoltativi della factory. Il minimo C3 del 95% è superato senza
esclusioni; non si deduce MC/DC da questi conteggi. Il reader compila
senza avvisi e verifica fixture positive, negative e soglia esatta.

## Misura del percorso normale

Ogni replica usa 4096 cicli, con 128 cicli di warmup. Un ciclo comprende
160 aggiornamenti grow/shrink e relativi getter, più due coppie update/read
per pending e hold. Le attese delle sette uscite e del target provengono
da un oracolo calcolato prima della misura. GC completa e avvio sono fuori
dal tratto misurato; tutta la verifica del risultato è nel tratto.

| Replica | Tick grezzi | Secondi | Byte heap |
|---|---:|---:|---:|
| 0 | 83427 | 0,083427 | 0 |
| 1 | 82384 | 0,082384 | 0 |
| 2 | 85044 | 0,085044 | 0 |
| 3 | 82709 | 0,082709 | 0 |
| 4 | 85129 | 0,085129 | 0 |

SBCL 2.6.9, ARM64, Apple M4; carico esterno non controllato. Il self-test
rileva 16777472 byte di allocazione deliberata, rifiuta sink e target
errati, distingue un clock sotto risoluzione da una durata numerica e
conserva risultato parziale e campioni precedenti dopo un errore. La misura
attesta questi percorsi post-avvio, non un'assenza universale di allocazioni.

## Tentativi preliminari

Le prove funzionali iniziali passano; i tentativi di copertura hanno
evidenziato due problemi del metodo: perdita dei segni di caricamento
dopo GC e mancato esercizio del confronto EQUALP generato. Il runner
conserva lo startup usando SAVE-COVERAGE dopo ciascun caricamento. Le
fixture verificano oggetti uguali e differenze nei campi. Tutti i conteggi
precedenti, inclusi quelli sotto il minimo C3, rimangono tentativi falliti.
L'esperimento di caricamento diretto dei sorgenti non è stato adottato.
Il primo controllo generale (`4000906285-command-38488-0`) è
FAILED/STABLE/exit 2 prima della compilazione, per un percorso relativo
nella configurazione della cache. Il record conserva la diagnosi originale;
il secondo processo usa un percorso assoluto e non ne riscrive l'esito.

## Limiti

Le soglie iniziali non sono calibrate sul carico del database. La misura
riguarda il calcolo del target, con tempo e campioni iniettati: non verifica
throughput, P99 del motore, sensori reali, fairness o stabilità del feedback.
Se actual non raggiunge target, il controllore resta pending anche quando
P99 peggiora. Revoca, scadenza e rifiuti dell'attuatore sono lavoro futuro.
Avvio, park/wake senza notifiche perdute, admission, retirement, shutdown,
pool I/O e coordinatore Archivio restano aperti; REQ-THR-001 e gli altri
requisiti globali mantengono lo stato progettato.
")
  (:PATH
   #A((101) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/controllore-pool.md")
   :BYTES 7431 :SHA256 "f1b2fd4be201e59fea66259598b379c3e50ba14982b1ad3e9ce8bd44d7554758" :GIT-BLOB
   "d4af7550cb42a8016d3fd6d7c0f438394945548a" :TEXT "# Controllore locale dei worker di calcolo

Il componente `arcdocdb.scheduler` realizza una parte di REQ-THR-001:
propone un numero di worker usando EWMA, AIMD e isteresi. È governo delle
risorse di classe C3 secondo [ADR-0031](../adr/0031-software-critico-criteri-e-priorita.md),
con limiti espliciti e tempo iniettato, REQ-AFF-008/013 e REQ-CON-005.
[ADR-0011](../adr/0011-thread-pool-dinamico.md) consente di partire con pochi
segnali; [il metodo preregistrato](controllore-pool-metodo.md),
[la lettura del codice](controllore-pool-revisione.md) e
[i risultati](controllore-pool-risultati.md) delimitano le prove.

Il controllore appartiene al thread che lo crea. Il solo scheduler legge e
aggiorna il suo stato; i getter rispettano lo stesso proprietario. Campioni,
worker effettivi e tick provengono dal caller. Non si legge il clock del
processo, non si raccoglie CPU o latenza e non si accede a writer, lista pronta,
Serie o richieste. Questa amministrazione è fuori dal percorso delle richieste,
come previsto dall'[elenco dello stato condiviso](../architettura.md#archivio-coordinamento-minimo).

| API | Contratto |
|---|---|
| `crea-controllore-pool cores &key minimum maximum initial period dwell queue-high` | Avvio sul thread proprietario; valida tutta la configurazione prima di costruire lo stato. Il target iniziale è nel budget. |
| `aggiorna-controllore-pool c tick queue cpu p99 actual` | Owner corrente; valida tutti gli input prima della mutazione. Restituisce target e `:hold`, `:pending`, `:grow` o `:shrink`. Ogni chiamata termina senza attese. |
| `leggi-controllore-pool c` | Owner corrente; restituisce sette valori: target, EWMA coda/CPU/P99 scalate, ultimo tick oppure NIL, candidato `:hold`/`:grow`/`:shrink`, origine della permanenza oppure NIL. Nessuna copia del controllore. |

## Domini e avvio

`cores` è un intero da 1 a 65536; `1 ≤ minimum ≤ maximum ≤ 2×cores`.
Il default di minimum è 1, quello di maximum è 2×cores, quello di initial è
minimum. Initial deve appartenere a minimum..maximum. Il tetto è quello del
pool di calcolo di [architettura](../architettura.md#thread-pool), non una
raccomandazione di usare sempre il massimo e non un tetto del pool di I/O.

Period è da 1 a 2^20, default 500; dwell è da period a 2^20, default 2000;
queue-high è da 1 a 2^20, default 8. Il caller assegna un'unità coerente ai tick,
a period e a dwell. I default non fissano millisecondi né una calibrazione.

Un campione contiene tick da 0 a 2^40−1, queue da 0 a 2^20, CPU da 0 a 1000
permille, P99 da 0 a 10000 permille del target di latenza e actual da minimum
a maximum. Il pool è quindi già avviato con un numero confermato di worker:
actual=0 è rifiutato. P99=1000 significa raggiungere il target di latenza.
La scelta del target, i sensori e l'aggregazione delle metriche restano al
caller; il componente non realizza REQ-OBS-001/002.

Dopo il primo campione il tempo deve avanzare almeno di period. Tick
duplicati, regressivi o troppo ravvicinati sono rifiutati senza cambiare
sensori, candidato o target. Tick non fa wrap; raggiungere il suo massimo
non autorizza a riutilizzare zero sullo stesso controllore.

## EWMA e decisione

I tre sensori hanno scala 256. Il primo campione inizializza `E=256×x`;
i successivi aggiornano `E=floor((7×E+256×x)/8)`. Alpha è 1/8 per campione,
con arrotondamento verso il basso. Il numero di bit degli interi resta
limitato dal dominio, senza crescita di denominatori razionali. Un salto
di tempo maggiore di 2×period inizializza di nuovo i sensori dal campione
corrente e azzera la permanenza: un intervallo senza campioni non attesta
carico stabile. La soglia di 2×period è inclusiva per continuare la EWMA.

La riduzione ha precedenza sulla crescita. Le soglie si applicano alle EWMA
scalate, non ai soli input istantanei:

| Candidato | Condizioni |
|---|---|
| `:shrink` | P99≥1200×256, oppure coda<256 e CPU≤300×256. |
| `:grow` | Coda≥queue-high×256, CPU<700×256 e P99≤1000×256. |
| `:hold` | Altri casi. |

Il primo campione con un candidato registra il tick di inizio. Cambiare
direzione o tornare hold azzera la permanenza. La stessa direzione deve
durare almeno dwell: alla soglia inclusiva la crescita è target+1, limitata
a maximum; la riduzione è floor(3×target/4), limitata a minimum. Dopo un
cambiamento serve una nuova permanenza per agire ancora. Una direzione che
non può cambiare il target perché è già al limite restituisce hold e non
crea un comando senza effetto.

Se actual è diverso dal target, i sensori si aggiornano ma l'esito è
`:pending`: il target resta identico e la permanenza viene azzerata. Quando
actual raggiunge target, il candidato riparte dal nuovo campione; il tempo
passato pending non contribuisce all'isteresi. Il caller conferma soltanto
worker effettivamente attivi, senza assumere che un target sia già applicato.

## Errori e confini

Owner estraneo, configurazione errata o campione fuori dominio producono
`invalid-argument` con le ragioni seguenti:

| Controllo | Ragione |
|---|---|
| Thread estraneo, in getter e aggiornamento | `:pool-owner` |
| Factory: cores, minimum, maximum, initial | `:pool-cores`, `:pool-minimum`, `:pool-maximum`, `:pool-initial` |
| Factory: period, dwell, queue-high | `:pool-period`, `:pool-dwell`, `:pool-queue-threshold` |
| Campione: tick, queue, CPU, P99, actual | `:pool-tick`, `:pool-queue`, `:pool-cpu`, `:pool-p99`, `:pool-actual` |
| Tick duplicato, regressivo o troppo ravvicinato | `:pool-sample-period` |

Input e proprietario sono verificati prima delle scritture; un rifiuto
ordinario non applica un prefisso dell'aggiornamento. Il verificatore privato
controlla target fra minimum e maximum e origine della permanenza non
successiva all'ultimo tick; incoerenze producono `invariant-violation`
`:pool-state`. I domini degli altri slot sono protetti dai tipi e dalla
factory. Non è promessa la rilevazione di ogni modifica arbitraria della
rappresentazione privata, né una riparazione o un rollback al guasto.
Il componente non registra un FAULTED della Serie perché non possiede né
accede a una Serie.

Una crescita pending non viene revocata se la latenza peggiora. Non c'è un
timeout dell'attuatore nel controllore: pending può durare per un numero
arbitrario di chiamate brevi. Il caller deve diagnosticare un target non
applicato e governare errore o scadenza dell'attuatore. Revoca, precedenza dei
comandi e rifiuto di comandi obsoleti richiedono il futuro protocollo del pool.

Il calcolo normale è O(1), con strutture allocate soltanto dalla factory,
senza thread nuovi, attese, lock, I/O, callback o scritture condivise per
richiesta. Controllore e getter non creano, parcheggiano, risvegliano o
ritirano worker. Un target è una proposta: non trasferisce obblighi, lease
o batch e non cambia dati o stato di una Serie.

Pool vivo, wake senza notifiche perse, admission, retirement, shutdown,
coordinatore Archivio, pool di I/O, compaction, metriche reali e calibrazione
rimangono da integrare. EMPTY/BUSY della lista pronta non sono una prova di
quiescenza per dormire o arrestarsi; i [contesti worker](writer-worker.md)
rimangono sul thread creatore e conservano gli obblighi ancora posseduti.
Questa policy non promette equità, P99, throughput, scalabilità o stabilità
del feedback reale. RSK-12 e i gate del motore restano aperti; gli stati
globali dei requisiti restano `progettato`.
")
  (:PATH
   #A((85) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/build.lisp")
   :BYTES 1975 :SHA256 "58baf595f221826c64e3fb38344242c3bdf403d65904193bf1a8e06e09d7c336" :GIT-BLOB
   "a925a9380e48a0d0018e00eb97676679db2e8eba" :TEXT
   ";;; OWNER: thread creatore prima della pubblicazione, configurazione immutabile.
;;; SHARED: nessuno; nessuna lettura di metriche reali o numero di core del sistema.
(in-package #:arcdocdb.scheduler)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-AFF-008 REQ-AFF-013
(declaim (ftype (function (t fixnum fixnum keyword) pool-tick) %pool-range))
(defun %pool-range (value lower upper reason)
  \"Pre: limiti fixnum validi. Post: intero verificato; INVALID-ARGUMENT prima di mutare.\"
  (unless (and (typep value 'fixnum) (<= lower value upper))
    (error 'invalid-argument :reason reason))
  value)

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008 REQ-AFF-013
(declaim (ftype (function (t &key (:minimum t) (:maximum t) (:initial t)
                          (:period t) (:dwell t) (:queue-high t)) controllore-pool)
                crea-controllore-pool))
(defun crea-controllore-pool (cores &key (minimum 1) maximum initial
                                      (period 500) (dwell 2000) (queue-high 8))
  \"Pre: configurazione stabile; CORES iniettato, non rilevato dal sistema.
Post: target INITIAL (default MINIMUM), MAXIMUM default 2*CORES, owner corrente.
INVALID-ARGUMENT dominio/ordine; alloca solo all'avvio, nessun thread avviato.\"
  (let* ((core-count (%pool-range cores 1 65536 :pool-cores))
         (low (%pool-range minimum 1 (* 2 core-count) :pool-minimum))
         (high (%pool-range (if maximum maximum (* 2 core-count))
                            low (* 2 core-count) :pool-maximum))
         (start (%pool-range (if initial initial low) low high :pool-initial))
         (interval (%pool-range period 1 1048576 :pool-period))
         (residence (%pool-range dwell interval 1048576 :pool-dwell))
         (pressure (%pool-range queue-high 1 1048576 :pool-queue-threshold)))
    (%make-controllore-pool :minimum low :maximum high :target start
                           :period interval :dwell residence :queue-high pressure)))
")
  (:PATH
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/package.lisp")
   :BYTES 374 :SHA256 "1ae4001c0349d4e9f7d282e9c05129573149d50418880073789a46fa18b1968b" :GIT-BLOB
   "345098e3888c64c98819d402cf883c9651be6aad" :TEXT
   ";;;; Politica locale del pool di calcolo; nessun attuatore di thread.
;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008 REQ-AFF-013
(defpackage #:arcdocdb.scheduler
  (:use #:cl)
  (:import-from #:arcdocdb.conditions #:invalid-argument #:invariant-violation)
  (:export #:controllore-pool #:crea-controllore-pool
           #:aggiorna-controllore-pool #:leggi-controllore-pool))
")
  (:PATH
   #A((86) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/policy.lisp")
   :BYTES 2878 :SHA256 "92b3ca3a81ae0b3ac342a63e5fe5c5d7524091a63065b0232c14c57ee80c4aac" :GIT-BLOB
   "b9f30d56f58b77c9cf42df9481f37586faf0c4c2" :TEXT
   ";;; OWNER: il solo scheduler possiede EWMA, target e permanenza; nessun attuatore.
;;; SHARED: scheduler/metriche fuori dal percorso delle richieste (INV-P6).
(in-package #:arcdocdb.scheduler)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-AFF-008
(declaim (ftype (function (pool-signal (integer 0 1048576) boolean) pool-signal) %pool-ewma))
(defun %pool-ewma (previous sample reset)
  \"Pre: segnali limitati. Post: scala256, alpha1/8, floor; reset usa solo il campione.
Nessun razionale crescente, loop, I/O o condizione con gli ingressi verificati.\"
  (if reset (* sample 256) (floor (+ (* 7 previous) (* sample 256)) 8)))

;;; REQ: REQ-THR-001 REQ-AFF-008
(declaim (ftype (function (controllore-pool) pool-direction) %pool-direction))
(defun %pool-direction (controller)
  \"Pre: EWMA aggiornate. Post: direzione pura con soglie esplicite e deadband P99.
SHRINK ha precedenza; nessun errore, target non modificato.\"
  (cond
    ((or (>= (controllore-pool-p99 controller) 307200)
         (and (< (controllore-pool-queue controller) 256)
              (<= (controllore-pool-cpu controller) 76800))) :shrink)
    ((and (>= (controllore-pool-queue controller)
              (* 256 (controllore-pool-queue-high controller)))
          (< (controllore-pool-cpu controller) 179200)
          (<= (controllore-pool-p99 controller) 256000)) :grow)
    (t :hold)))

;;; REQ: REQ-THR-001 REQ-AFF-008 REQ-AFF-013
(declaim (ftype (function (controllore-pool pool-tick symbol) pool-direction)
                %pool-apply))
(defun %pool-apply (controller tick direction)
  \"Pre: owner e tempo verificati. Post: variazione solo dopo permanenza continua.
Crescita +1, riduzione floor(3*target/4), clamp; nessuna variazione ai limiti.
INVARIANT-VIOLATION per direzione privata inattesa; nessuna attesa o thread ritirato.\"
  (let* ((target (controllore-pool-target controller))
         (next (case direction
                 (:grow (min (controllore-pool-maximum controller) (1+ target)))
                 (:shrink (max (controllore-pool-minimum controller) (floor (* 3 target) 4)))
                 (:hold target)
                 (otherwise (error 'invariant-violation :reason :pool-state)))))
    (cond
      ((= target next)
       (setf (controllore-pool-candidate controller) :hold
             (controllore-pool-since controller) tick)
       :hold)
      ((not (eq direction (controllore-pool-candidate controller)))
       (setf (controllore-pool-candidate controller) direction
             (controllore-pool-since controller) tick)
       :hold)
      ((< (- tick (controllore-pool-since controller)) (controllore-pool-dwell controller))
       :hold)
      (t
       (setf (controllore-pool-target controller) next
             (controllore-pool-candidate controller) :hold
             (controllore-pool-since controller) tick)
       direction))))
")
  (:PATH
   #A((84) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/read.lisp")
   :BYTES 2065 :SHA256 "5cdc1e5b7ba97c9aab66a5acaf74336b0df33144e24104e0242b7fc2552a1ae2" :GIT-BLOB
   "cabd8cdb2f83333b321653fd63549eb5716d7b59" :TEXT
   ";;; OWNER: lettura e controllo esclusivi del thread scheduler creatore.
;;; SHARED: nessuno; il risultato non pubblica uno stato mutabile.
(in-package #:arcdocdb.scheduler)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008 REQ-AFF-013
(declaim (ftype (function (controllore-pool) null) %check-pool))
(defun %check-pool (controller)
  \"Pre: oggetto locale. Post: owner, target e clock coerenti senza mutazione.
INVALID-ARGUMENT :POOL-OWNER; INVARIANT-VIOLATION :POOL-STATE per stato interno.\"
  (unless (eq (controllore-pool-owner controller) sb-thread:*current-thread*)
    (error 'invalid-argument :reason :pool-owner))
  (unless (<= (controllore-pool-minimum controller) (controllore-pool-target controller)
              (controllore-pool-maximum controller))
    (error 'invariant-violation :reason :pool-state))
  (unless (<= (controllore-pool-since controller) (controllore-pool-last controller))
    (error 'invariant-violation :reason :pool-state))
  nil)

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008 REQ-AFF-013
(declaim (ftype (function (controllore-pool)
                         (values pool-workers pool-signal pool-signal pool-signal
                                 (or null pool-tick) pool-direction (or null pool-tick)
                                 &optional)) leggi-controllore-pool))
(defun leggi-controllore-pool (controller)
  \"Pre: owner esclusivo. Post: target, EWMA queue/CPU/P99 scala 256, last, candidate, since.
Clock NIL prima del primo campione; nessuna allocazione di snapshot o mutazione.
Propaga controllo tipizzato dell'owner e delle invarianti.\"
  (%check-pool controller)
  (values (controllore-pool-target controller) (controllore-pool-queue controller)
          (controllore-pool-cpu controller) (controllore-pool-p99 controller)
          (if (controllore-pool-initialized controller) (controllore-pool-last controller) nil)
          (controllore-pool-candidate controller)
          (if (controllore-pool-initialized controller) (controllore-pool-since controller) nil)))
")
  (:PATH
   #A((85) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/types.lisp")
   :BYTES 1541 :SHA256 "3b174be0919f8b27312ada4071d831c3753d62bb12be99d7e9394c48dcab474a" :GIT-BLOB
   "728f410292749214a020047d8efa744c54ed0a6e" :TEXT
   ";;;; Aritmetica intera limitata: massimo intermedio EWMA 2^31.
;;; OWNER: thread scheduler creatore, accesso esclusivo non rientrante.
;;; SHARED: scheduler/metriche fuori dal percorso delle richieste (INV-P6).
(in-package #:arcdocdb.scheduler)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-AFF-008 REQ-AFF-013
(deftype pool-tick () '(integer 0 1099511627775))
(deftype pool-workers () '(integer 1 131072))
(deftype pool-signal () '(integer 0 268435456))
(deftype pool-direction () '(member :hold :grow :shrink))

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008 REQ-AFF-013
(defstruct (controllore-pool (:constructor %make-controllore-pool)
                           (:copier nil))
  \"Pre: configurazione verificata e thread proprietario. Post: target iniziale fisso.
Gli ingressi sono aggregati esternamente; nessuna coda, thread, attesa o I/O.
Nessuna condizione della costruzione privata oltre ai tipi degli slot.\"
  (owner sb-thread:*current-thread* :type sb-thread:thread :read-only t)
  (minimum 1 :type pool-workers :read-only t)
  (maximum 1 :type pool-workers :read-only t)
  (period 500 :type (integer 1 1048576) :read-only t)
  (dwell 2000 :type (integer 1 1048576) :read-only t)
  (queue-high 8 :type (integer 1 1048576) :read-only t)
  (target 1 :type pool-workers)
  (initialized nil :type boolean)
  (last 0 :type pool-tick)
  (queue 0 :type pool-signal)
  (cpu 0 :type (integer 0 256000))
  (p99 0 :type (integer 0 2560000))
  (candidate :hold :type pool-direction)
  (since 0 :type pool-tick))
")
  (:PATH
   #A((86) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/update.lisp")
   :BYTES 3077 :SHA256 "e35a704ee0b9445c559a768de048169a8e39837a6df21843d8df58215c482472" :GIT-BLOB
   "ac1a02b8dcb4432a99ab7f93686b0c02d5c775d8" :TEXT
   ";;; OWNER: aggiornamento non rientrante sul solo thread scheduler, nessun callback.
;;; SHARED: scheduler/metriche fuori dal percorso delle richieste (INV-P6).
(in-package #:arcdocdb.scheduler)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-AFF-008 REQ-AFF-013
(declaim (ftype (function (controllore-pool t t t t t) pool-tick) %pool-sample))
(defun %pool-sample (controller tick queue cpu p99 actual)
  \"Pre: owner verificato. Post: tutto il campione valido prima di qualsiasi scrittura.
INVALID-ARGUMENT dominio, actual fuori min..max, clock regressivo o intervallo troppo breve.\"
  (%pool-range tick 0 1099511627775 :pool-tick)
  (%pool-range queue 0 1048576 :pool-queue)
  (%pool-range cpu 0 1000 :pool-cpu)
  (%pool-range p99 0 10000 :pool-p99)
  (%pool-range actual (controllore-pool-minimum controller)
               (controllore-pool-maximum controller) :pool-actual)
  (when (controllore-pool-initialized controller)
    (unless (>= (- tick (controllore-pool-last controller)) (controllore-pool-period controller))
      (error 'invalid-argument :reason :pool-sample-period)))
  tick)

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008 REQ-AFF-013
(declaim (ftype (function (controllore-pool t t t t t)
                         (values pool-workers (member :hold :pending :grow :shrink) &optional))
                aggiorna-controllore-pool))
(defun aggiorna-controllore-pool (controller tick queue cpu p99 actual)
  \"Pre: owner esclusivo; tempo, coda, CPU/P99 in millimi e worker effettivi iniettati.
Post: target limitato e azione; :PENDING conserva target se actual diverso, senza attesa.
Gap >2 periodi resetta EWMA/permanenza. Propaga preflight tipizzato senza mutazione.
Non crea/ritira thread, non revoca target pending, non tratta ready EMPTY come quiescenza.\"
  (%check-pool controller)
  (%pool-sample controller tick queue cpu p99 actual)
  (let ((reset (or (not (controllore-pool-initialized controller))
                   (> (- tick (controllore-pool-last controller))
                      (* 2 (controllore-pool-period controller))))))
    (setf (controllore-pool-queue controller) (%pool-ewma (controllore-pool-queue controller) queue reset)
          (controllore-pool-cpu controller) (%pool-ewma (controllore-pool-cpu controller) cpu reset)
          (controllore-pool-p99 controller) (%pool-ewma (controllore-pool-p99 controller) p99 reset)
          (controllore-pool-initialized controller) t
          (controllore-pool-last controller) tick)
    (when reset
      (setf (controllore-pool-candidate controller) :hold (controllore-pool-since controller) tick))
    (let ((action (if (/= actual (controllore-pool-target controller))
                      (progn
                        (setf (controllore-pool-candidate controller) :hold
                              (controllore-pool-since controller) tick)
                        :pending)
                      (%pool-apply controller tick (%pool-direction controller)))))
      (%check-pool controller)
      (values (controllore-pool-target controller) action))))
")
  (:PATH
   #A((92) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/controller.lisp")
   :BYTES 18617 :SHA256 "e986e3facc9d1b9b4eab0d135259a61d7e0f188a7f268cb2e5ee5f9c700c40be"
   :GIT-BLOB "8e14282e1f42f3b247a5c578d8a683ddc6147381" :TEXT
   ";;;; Policy EWMA/AIMD: attese e risultati derivano dai campioni del test.
;;;; Gli snapshot pubblici provano l'assenza di mutazioni dopo i rifiuti.
(in-package #:arcdocdb.scheduler.tests)

;;; REQ: REQ-THR-001 REQ-AFF-008 REQ-AFF-013
(deftest test-REQ-THR-001-pool-construction-defaults-and-valid-bounds
  (dolist (cores '(1 2 65536))
    (is (equal '(1 0 0 0 nil :hold nil)
               (pool-state (crea-controllore-pool cores)))))
  (let ((controller (crea-controllore-pool
                     65536 :minimum 131072 :maximum 131072 :initial 131072
                     :period 1048576 :dwell 1048576 :queue-high 1048576)))
    (is (equal '(131072 0 0 0 nil :hold nil) (pool-state controller))))
  (let ((controller (crea-controllore-pool 2 :minimum 2 :maximum 3 :initial 3
                                         :period 1 :dwell 1 :queue-high 1)))
    (is (= 3 (first (pool-state controller))))))

;;; REQ: REQ-THR-001 REQ-AFF-008 REQ-AFF-013
(deftest test-REQ-AFF-008-pool-private-construction-defaults-and-explicit-state
  \"Fixture valida anche senza il factory pubblico; non altera tipi o codice generato.\"
  (let ((default (funcall (symbol-function 'arcdocdb.scheduler::%make-controllore-pool))))
    (is (funcall (symbol-function 'arcdocdb.scheduler::controllore-pool-p) default))
    (is (equal '(1 0 0 0 nil :hold nil) (pool-state default)))
    (pool-check-sample default 0 8 0 0 1 1 :hold))
  (let ((explicit (funcall (symbol-function 'arcdocdb.scheduler::%make-controllore-pool)
                           :owner sb-thread:*current-thread* :minimum 2 :maximum 6
                           :period 7 :dwell 14 :queue-high 21 :target 4 :initialized t
                           :last 123 :queue 5376 :cpu 0 :p99 0 :candidate :grow :since 116)))
    (is (equal '(4 5376 0 0 123 :grow 116) (pool-state explicit)))
    (pool-check-sample explicit 130 21 0 0 4 5 :grow))
  (dolist (other '(nil 1 :hold))
    (is (not (funcall (symbol-function 'arcdocdb.scheduler::controllore-pool-p) other)))))

;;; REQ: REQ-THR-001 REQ-AFF-008 REQ-AFF-013
(deftest test-REQ-AFF-008-pool-generated-equality-compares-each-bounded-signal
  \"Due fixture distinte hanno stato uguale; ciascun segnale diverso rompe EQUALP.\"
  (let* ((arguments (list :minimum 2 :maximum 6 :period 500 :dwell 2000 :queue-high 8
                          :target 4 :initialized t :last 1000 :queue 2048 :cpu 100000
                          :p99 256000 :candidate :hold :since 1000))
         (constructor (symbol-function 'arcdocdb.scheduler::%make-controllore-pool))
         (baseline (apply constructor arguments))
         (duplicate (apply constructor arguments)))
    (is (not (eq baseline duplicate)))
    (is (funcall (symbol-function 'equalp) baseline duplicate))
    (dolist (difference '((:period 501) (:dwell 2001) (:queue-high 9)
                          (:cpu 100001) (:p99 256001)))
      (let ((changed-arguments (copy-list arguments)))
        (setf (getf changed-arguments (first difference)) (second difference))
        (let ((different (apply constructor changed-arguments)))
          (is (not (funcall (symbol-function 'equalp) baseline different)))
          (is (not (funcall (symbol-function 'equalp) different baseline))))))))

;;; REQ: REQ-THR-001 REQ-AFF-008 REQ-AFF-013
(deftest test-REQ-AFF-008-pool-declared-integer-domains-and-direction-members
  \"TYPEP a runtime verifica i domini dichiarati senza assumerne l'espansione.\"
  (dolist (entry '((arcdocdb.scheduler::pool-tick 0 1099511627775)
                   (arcdocdb.scheduler::pool-workers 1 131072)
                   (arcdocdb.scheduler::pool-signal 0 268435456)))
    (destructuring-bind (type lower upper) entry
      (dolist (valid (list lower upper))
        (is (funcall (symbol-function 'typep) valid type)))
      (dolist (invalid (list nil (1- lower) (1+ upper) 1.0))
        (is (not (funcall (symbol-function 'typep) invalid type))))))
  (dolist (valid '(:hold :grow :shrink))
    (is (funcall (symbol-function 'typep) valid 'arcdocdb.scheduler::pool-direction)))
  (dolist (invalid '(nil :pending :unknown 1))
    (is (not (funcall (symbol-function 'typep) invalid 'arcdocdb.scheduler::pool-direction)))))

;;; REQ: REQ-THR-001 REQ-AFF-008 REQ-AFF-013
(deftest test-REQ-AFF-008-pool-invalid-configuration-has-typed-reasons
  (dolist (bad (list nil 0 -1 65537 1.0 (1+ most-positive-fixnum)))
    (signals invalid-argument (crea-controllore-pool bad) :pool-cores))
  (dolist (entry '((:minimum :pool-minimum nil 0 -1 3 1.0)
                   (:maximum :pool-maximum 0 -1 3 1.0)
                   (:initial :pool-initial 0 -1 3 1.0)
                   (:period :pool-period nil 0 -1 1048577 1.0)
                   (:dwell :pool-dwell nil 0 -1 499 1048577 1.0)
                   (:queue-high :pool-queue-threshold nil 0 -1 1048577 1.0)))
    (destructuring-bind (keyword reason &rest bad-values) entry
      (dolist (bad bad-values)
        (signals invalid-argument
          (apply #'crea-controllore-pool 1 (list keyword bad)) reason))))
  (signals invalid-argument
    (crea-controllore-pool 2 :minimum 3 :maximum 2) :pool-maximum)
  (signals invalid-argument
    (crea-controllore-pool 2 :minimum 2 :initial 1) :pool-initial)
  (signals invalid-argument
    (crea-controllore-pool 2 :period 1000 :dwell 999) :pool-dwell))

;;; REQ: REQ-THR-001 REQ-AFF-013
(deftest test-REQ-THR-001-pool-first-sample-seeds-exact-fixed-point-signals
  (let ((controller (crea-controllore-pool 4)))
    (pool-check-sample controller 98765 9 650 800 1 1 :hold '(2304 166400 204800))
    (is (equal '(1 2304 166400 204800 98765 :grow 98765) (pool-state controller))))
  (let ((controller (crea-controllore-pool 4)))
    (pool-check-sample controller 0 2 900 1100 1 1 :hold '(512 230400 281600))
    (is (eq :hold (sixth (pool-state controller)))))
  (let ((controller (crea-controllore-pool 4 :initial 4)))
    (pool-check-sample controller 0 9 950 1200 4 4 :hold '(2304 243200 307200))
    (is (eq :shrink (sixth (pool-state controller))))))

;;; REQ: REQ-THR-001 REQ-AFF-008 REQ-AFF-013
(deftest test-REQ-AFF-013-pool-ewma-independent-oracle-and-negative-rounding
  (let ((controller (crea-controllore-pool 4 :dwell 1048576))
        (expected nil))
    (loop for (queue cpu p99) in '((100 999 1199) (0 0 0) (1 1 1) (777 551 1451)
                                  (2 2 2) (0 0 0) (1048576 1000 10000))
          for tick from 0 by 500
          do (setf expected (pool-reference-sensors expected queue cpu p99))
             (pool-check-sample controller tick queue cpu p99 1 1 :hold expected))
    (is (every #'integerp expected))))

;;; REQ: REQ-THR-001 REQ-AFF-008 REQ-AFF-013
(deftest test-REQ-AFF-008-pool-invalid-samples-preserve-entire-public-state
  (let ((controller (crea-controllore-pool 4 :minimum 2 :maximum 6 :initial 4)))
    (pool-check-sample controller 1000 2 400 1000 4 4 :hold)
    (let ((before (pool-state controller)))
      (dolist (entry (list (list 0 :pool-tick nil -1 1099511627776 1500.0)
                          (list 1 :pool-queue nil -1 1048577 1.0)
                          (list 2 :pool-cpu nil -1 1001 1.0)
                          (list 3 :pool-p99 nil -1 10001 1.0)
                          (list 4 :pool-actual nil -1 0 1 7 1.0)))
        (destructuring-bind (position reason &rest values) entry
          (dolist (bad values)
            (let ((arguments (list 1500 2 400 1000 4)))
              (setf (nth position arguments) bad)
              (signals invalid-argument
                (apply #'aggiorna-controllore-pool controller arguments) reason)
              (is (equal before (pool-state controller)))))))
      (dolist (tick '(0 999 1000 1001 1499))
        (signals invalid-argument
          (aggiorna-controllore-pool controller tick 2 400 1000 4) :pool-sample-period)
        (is (equal before (pool-state controller)))))))

;;; REQ: REQ-THR-001 REQ-AFF-008 REQ-AFF-013
(deftest test-REQ-AFF-008-pool-sample-upper-bounds-and-clock-exhaustion
  (let ((controller (crea-controllore-pool 65536 :initial 131072)))
    (pool-check-sample controller 1099511627775 1048576 1000 10000 131072
                       131072 :hold '(268435456 256000 2560000))
    (let ((before (pool-state controller)))
      (signals invalid-argument
        (aggiorna-controllore-pool controller 1099511627776 0 0 0 131072) :pool-tick)
      (is (equal before (pool-state controller))))))

;;; REQ: REQ-THR-001 REQ-AFF-013
(deftest test-REQ-THR-001-pool-additive-growth-needs-complete-dwell
  (let ((controller (crea-controllore-pool 4)))
    (dotimes (step 4)
      (pool-check-sample controller (* step 500) 8 699 1000 1 1 :hold)
      (is (eq :grow (sixth (pool-state controller)))))
    (pool-check-sample controller 2000 8 699 1000 1 2 :grow)
    (is (equal '(:hold 2000) (subseq (pool-state controller) 5 7)))
    (pool-check-sample controller 2500 8 699 1000 2 2 :hold)
    (pool-check-sample controller 3000 8 699 1000 2 2 :hold)
    (pool-check-sample controller 3500 8 699 1000 2 2 :hold)
    (pool-check-sample controller 4000 8 699 1000 2 2 :hold)
    (pool-check-sample controller 4500 8 699 1000 2 3 :grow)))

;;; REQ: REQ-THR-001 REQ-AFF-013
(deftest test-REQ-THR-001-pool-multiplicative-decrease-floors-and-clamps
  (dolist (entry '((8 6) (7 5) (3 2) (2 1)))
    (destructuring-bind (start expected) entry
      (let ((controller (crea-controllore-pool 4 :initial start :dwell 500)))
        (pool-check-sample controller 0 100 1000 1200 start start :hold)
        (pool-check-sample controller 500 100 1000 1200 start expected :shrink))))
  (let ((controller (crea-controllore-pool 4 :minimum 4 :initial 5 :dwell 500)))
    (pool-check-sample controller 0 0 300 0 5 5 :hold)
    (pool-check-sample controller 500 0 300 0 5 4 :shrink)))

;;; REQ: REQ-THR-001 REQ-AFF-013
(deftest test-REQ-THR-001-pool-hysteresis-thresholds-are-inclusive-as-specified
  (dolist (entry '((8 699 1000 :grow) (8 700 1000 :hold) (7 699 1000 :hold)
                   (8 699 1001 :hold) (0 300 1000 :shrink) (0 301 1000 :hold)
                   (1 300 1000 :hold) (1 700 1199 :hold) (1 700 1200 :shrink)))
    (destructuring-bind (queue cpu p99 candidate) entry
      (let ((controller (crea-controllore-pool 4 :initial 4 :dwell 500)))
        (pool-check-sample controller 0 queue cpu p99 4 4 :hold)
        (is (eq candidate (sixth (pool-state controller))))
        (pool-check-sample controller 500 queue cpu p99 4
                           (case candidate (:grow 5) (:shrink 3) (otherwise 4))
                           candidate)))))

;;; REQ: REQ-THR-001 REQ-AFF-013
(deftest test-REQ-THR-001-pool-configurable-queue-threshold-and-custom-period
  (let ((controller (crea-controllore-pool 3 :initial 3 :period 7 :dwell 14
                                         :queue-high 21)))
    (pool-check-sample controller 3 21 1 1 3 3 :hold)
    (pool-check-sample controller 10 21 1 1 3 3 :hold)
    (pool-check-sample controller 17 21 1 1 3 4 :grow))
  (let ((controller (crea-controllore-pool 3 :initial 3 :period 7 :dwell 14
                                         :queue-high 21)))
    (dotimes (step 4) (pool-check-sample controller (* step 7) 20 1 1 3 3 :hold))))

;;; REQ: REQ-THR-001 REQ-AFF-013
(deftest test-REQ-THR-001-pool-bounds-do-not-emit-zero-change-commands
  (let ((controller (crea-controllore-pool 1 :initial 2 :dwell 500)))
    (dotimes (step 6)
      (pool-check-sample controller (* step 500) 8 0 0 2 2 :hold)
      (is (eq :hold (sixth (pool-state controller))))))
  (let ((controller (crea-controllore-pool 1 :dwell 500)))
    (dotimes (step 6)
      (pool-check-sample controller (* step 500) 0 0 1200 1 1 :hold)
      (is (eq :hold (sixth (pool-state controller))))))
  (let ((controller (crea-controllore-pool 2 :minimum 3 :maximum 3)))
    (dotimes (step 6) (pool-check-sample controller (* step 500) 8 0 0 3 3 :hold))))

;;; REQ: REQ-THR-001 REQ-AFF-013
(deftest test-REQ-THR-001-pool-hold-region-breaks-continuous-dwell
  (let ((controller (crea-controllore-pool 4 :initial 4 :dwell 1000)))
    (pool-check-sample controller 0 8 699 1000 4 4 :hold)
    (pool-check-sample controller 500 8 707 1000 4 4 :hold '(2048 179200 256000))
    (is (eq :hold (sixth (pool-state controller))))
    (pool-check-sample controller 1000 8 0 1000 4 4 :hold)
    (is (equal '(:grow 1000) (subseq (pool-state controller) 5 7)))
    (pool-check-sample controller 1500 8 0 1000 4 4 :hold)
    (pool-check-sample controller 2000 8 0 1000 4 5 :grow)))

;;; REQ: REQ-THR-001 REQ-AFF-013
(deftest test-REQ-THR-001-pool-direction-change-restarts-dwell
  (let ((controller (crea-controllore-pool 4 :initial 4 :dwell 1000)))
    (pool-check-sample controller 0 8 0 0 4 4 :hold)
    (pool-check-sample controller 500 8 0 10000 4 4 :hold '(2048 0 320000))
    (is (equal '(:shrink 500) (subseq (pool-state controller) 5 7)))
    (pool-check-sample controller 1000 8 0 10000 4 4 :hold)
    (pool-check-sample controller 1500 8 0 10000 4 3 :shrink)))

;;; REQ: REQ-THR-001 REQ-AFF-013
(deftest test-REQ-THR-001-pool-long-gap-resets-ewma-and-dwell
  (let ((controller (crea-controllore-pool 4 :initial 4 :dwell 1000)))
    (pool-check-sample controller 0 8 0 0 4 4 :hold)
    (pool-check-sample controller 500 8 0 0 4 4 :hold)
    (pool-check-sample controller 2001 8 0 1200 4 4 :hold '(2048 0 307200))
    (is (equal '(:shrink 2001) (subseq (pool-state controller) 5 7)))
    (pool-check-sample controller 2501 8 0 1200 4 4 :hold)
    (pool-check-sample controller 3001 8 0 1200 4 3 :shrink)))

;;; REQ: REQ-THR-001 REQ-AFF-013
(deftest test-REQ-THR-001-pool-gap-exactly-two-periods-keeps-existing-dwell
  (let ((controller (crea-controllore-pool 4 :initial 4 :dwell 1000)))
    (pool-check-sample controller 123 8 0 0 4 4 :hold)
    (pool-check-sample controller 1123 8 0 0 4 5 :grow '(2048 0 0))))

;;; REQ: REQ-THR-001 REQ-AFF-013
(deftest test-REQ-THR-001-pool-pending-target-is-retained-and-sensors-advance
  (let ((controller (crea-controllore-pool 4 :initial 4 :dwell 500)))
    (pool-check-sample controller 0 8 0 0 4 4 :hold)
    (pool-check-sample controller 500 8 0 0 4 5 :grow)
    (pool-check-sample controller 1000 0 1000 10000 4 5 :pending '(1792 32000 320000))
    (is (equal '(:hold 1000) (subseq (pool-state controller) 5 7)))
    (pool-check-sample controller 1500 0 1000 10000 6 5 :pending)
    (pool-check-sample controller 2000 0 1000 10000 5 5 :hold)
    (is (equal '(:shrink 2000) (subseq (pool-state controller) 5 7)))
    (pool-check-sample controller 2500 0 1000 10000 5 3 :shrink)))

;;; REQ: REQ-THR-001 REQ-AFF-013
(deftest test-REQ-THR-001-pool-first-pending-sample-and-completed-command-dwell
  (let ((controller (crea-controllore-pool 4 :initial 4 :dwell 500)))
    (pool-check-sample controller 77 8 0 0 3 4 :pending '(2048 0 0))
    (is (equal '(:hold 77) (subseq (pool-state controller) 5 7)))
    (pool-check-sample controller 577 8 0 0 4 4 :hold)
    (pool-check-sample controller 1077 8 0 0 4 5 :grow)
    (pool-check-sample controller 1577 8 0 0 5 5 :hold)
    (pool-check-sample controller 2077 8 0 0 5 6 :grow)))

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-cross-thread-access-rejected-without-owner-mutation
  (let* ((controller (crea-controllore-pool 4))
         (before (pool-state controller))
         (thread (pool-thread
                  \"pool-controller-foreign-owner\"
                  (lambda ()
                    (signals invalid-argument (leggi-controllore-pool controller) :pool-owner)
                    (signals invalid-argument
                      (aggiorna-controllore-pool controller 0 0 0 0 1) :pool-owner)
                    :ok))))
    (unwind-protect (pool-join thread) (pool-stop-threads (list thread)))
    (is (equal before (pool-state controller)))
    (pool-check-sample controller 0 8 0 0 1 1 :hold)))

;;; REQ: REQ-THR-001 REQ-AFF-008 REQ-AFF-013
(deftest test-REQ-AFF-008-pool-private-bound-and-clock-faults-are-detected
  \"FI quiescente: modifica slot privati soltanto per i controlli delle invarianti.\"
  (let ((controller (crea-controllore-pool 4 :minimum 2 :maximum 6 :initial 4)))
    (pool-check-sample controller 1000 8 0 0 4 4 :hold)
    (let ((before (pool-state controller)))
      (signals invariant-violation
        (arcdocdb.scheduler::%pool-apply controller 1000 :unknown) :pool-state)
      (is (equal before (pool-state controller)))
      (dolist (target '(1 7))
        (setf (arcdocdb.scheduler::controllore-pool-target controller) target)
        (signals invariant-violation (leggi-controllore-pool controller) :pool-state)
        (signals invariant-violation
          (aggiorna-controllore-pool controller 1500 1 400 1000 4) :pool-state)
        (setf (arcdocdb.scheduler::controllore-pool-target controller) 4)
        (is (equal before (pool-state controller))))
      (setf (arcdocdb.scheduler::controllore-pool-since controller) 1001)
      (signals invariant-violation (leggi-controllore-pool controller) :pool-state)
      (signals invariant-violation
        (aggiorna-controllore-pool controller 1500 1 400 1000 4) :pool-state)
      (setf (arcdocdb.scheduler::controllore-pool-since controller) 1000)
      (is (equal before (pool-state controller))))))

(defun pool-parallel-sequence (ordinal)
  \"Ogni thread crea il proprio stato; 256 campioni deterministici non condivisi.\"
  (let ((controller (crea-controllore-pool 4 :initial 4 :dwell 1048576))
        (expected nil))
    (dotimes (step 256)
      (let ((queue (mod (+ (* step 31) ordinal) 1048577))
            (cpu (mod (+ (* step 43) ordinal) 1001))
            (p99 (mod (+ (* step 59) ordinal) 10001)))
        (setf expected (pool-reference-sensors expected queue cpu p99))
        (pool-check-sample controller (* step 500) queue cpu p99 4 4 :hold expected)))
    :ok))

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-013
(deftest test-REQ-CON-005-pool-independent-controllers-have-deterministic-parallel-traces
  (let ((threads nil) (ready (sb-thread:make-semaphore)) (start (sb-thread:make-semaphore)))
    (unwind-protect
         (progn
           (dotimes (ordinal 8)
             (let ((seed ordinal))
               (push (pool-thread (format nil \"pool-controller-~D\" seed)
                                  (lambda ()
                                    (sb-thread:signal-semaphore ready)
                                    (pool-wait start)
                                    (pool-parallel-sequence seed))) threads)))
           (pool-wait ready 8)
           (dotimes (ordinal 8) (sb-thread:signal-semaphore start))
           (dolist (thread threads) (pool-join thread)))
      (pool-stop-threads threads))))
")
  (:PATH
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/support.lisp")
   :BYTES 2807 :SHA256 "d8aeec53062cccf036c693ff709baf1086e331f8a247a5693b82c0ff1c7a4401" :GIT-BLOB
   "ad7ce95befc752839c247a8b0e85d924b98bca6a" :TEXT
   ";;;; Fixture del controllore: campioni e tempo iniettati, oracoli senza slot privati.
(defpackage #:arcdocdb.scheduler.tests
  (:use #:cl)
  (:import-from #:arcdocdb.foundation.tests #:is #:signals)
  (:import-from #:arcdocdb.conditions #:invalid-argument #:invariant-violation
                #:error-reason)
  (:import-from #:arcdocdb.scheduler #:crea-controllore-pool
                #:aggiorna-controllore-pool #:leggi-controllore-pool)
  (:export #:run))
(in-package #:arcdocdb.scheduler.tests)

(defvar *tests* nil)
(defmacro deftest (name &body body)
  `(progn (defun ,name () ,@body) (pushnew ',name *tests*)))

(defun run ()
  (dolist (test (reverse *tests*))
    (funcall test)
    (format t \"ok    ~A~%\" test))
  (format t \"~D test del controllore pool superati.~%\" (length *tests*))
  t)

(defun pool-state (controller)
  \"Snapshot pubblico; nessuna lettura della rappresentazione del controllore.\"
  (multiple-value-list (leggi-controllore-pool controller)))

(defun pool-check-sample (controller tick queue cpu p99 actual target status
                         &optional expected-sensors)
  (multiple-value-bind (command actual-status)
      (aggiorna-controllore-pool controller tick queue cpu p99 actual)
    (is (= target command))
    (is (eq status actual-status)))
  (let ((state (pool-state controller)))
    (is (= target (first state)))
    (is (= tick (fifth state)))
    (when expected-sensors (is (equal expected-sensors (subseq state 1 4))))))

(defun pool-reference-sensors (previous queue cpu p99)
  \"Oracolo razionale: arrotonda ciascuna media soltanto dopo la ponderazione.\"
  (let ((samples (list queue cpu p99)))
    (if previous
        (mapcar (lambda (old sample) (floor (+ (* 7/8 old) (* 32 sample))))
                previous samples)
        (mapcar (lambda (sample) (* 256 sample)) samples))))

(defun pool-thread (name thunk)
  \"Gli errori appartengono alla fixture e vengono restituiti al join bounded.\"
  (sb-thread:make-thread
   (lambda () (handler-case (funcall thunk) (error (condition) condition))) :name name))

(defun pool-wait (semaphore &optional (count 1))
  \"La barriera della fixture attende al massimo 15 secondi, mai nel prodotto.\"
  (unless (sb-thread:wait-on-semaphore semaphore :n count :timeout 15)
    (error \"Barriera della fixture oltre il limite.\"))
  t)

(defun pool-join (thread)
  (let ((result (sb-thread:join-thread thread :timeout 15 :default :timeout)))
    (when (typep result 'error) (error result))
    (is (eq result :ok))))

(defun pool-stop-threads (threads)
  \"Rilascia soltanto thread della fixture, anche se un'asserzione interrompe il test.\"
  (dolist (thread threads)
    (when (sb-thread:thread-alive-p thread) (sb-thread:terminate-thread thread))
    (sb-thread:join-thread thread :timeout 1 :default :terminated))
  nil)
")
  (:PATH
   #A((93) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tools/pool-controller-bench.lisp")
   :BYTES 22887 :SHA256 "8c23121bb53be3a63e0c7a911d60ef31321b9a66186df60433b81b96c2b86c66"
   :GIT-BLOB "cf6f31dd9c7a8d7f4e7cc1f19c4b9c5a48af6d55" :TEXT
   ";;;; C4: controller pool owner-only EWMA/AIMD/isteresi; nessun thread creato o sospeso.
;;;; Preregistrato: cinque repliche di 4096 cicli, 128 warmup, GC completa prima del sensore.
;;;; Ciclo: 80 campioni grow, 80 shrink, un controller pending e uno hold; read dopo ogni update.
;;;; Oracolo lento indipendente genera tutte le attese prima del clock e torna alla base dopo 160 tick.
;;;; --self-test oppure --bench directory-nuova/; startup/errori esclusi dal percorso caldo.
;;;; Feature biblioteca: :arcdocdb-pool-controller-bench-library.
;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008 REQ-BEN-001 REQ-BEN-002
;;; OWNER: un thread possiede controller, trace, contatori e sensore; nessuno SHARED.
(eval-when (:compile-toplevel :load-toplevel :execute)
  (require :asdf) (require :sb-md5) (require :sb-posix))
(defpackage #:arcdocdb.pool-controller.bench (:use #:cl))
(in-package #:arcdocdb.pool-controller.bench)
(declaim (optimize (safety 3) (speed 2) (debug 2)))
(defconstant +iterations+ 4096)
(defconstant +warmup+ 128)
(defconstant +replicas+ 5)
(defconstant +phase-length+ 80)

(defun fingerprints ()
  \"ASD, controller, test e sensore: confronto di stabilita, non autenticita.\"
  (loop for path in (append '(#p\"arcdocdb.asd\" #p\"tools/pool-controller-bench.lisp\")
                            (sort (append (directory \"src/**/*.lisp\") (directory \"tests/**/*.lisp\"))
                                  #'string< :key #'namestring))
        collect (list :file (enough-namestring path)
                      :md5 (format nil \"~(~{~2,'0X~}~)\" (coerce (sb-md5:md5sum-file path) 'list)))))

(defun load-product ()
  \"Compila prima della misura; warning/style-warning fatali salvo ridefinizione runtime ASDF.\"
  (setf asdf:*compile-file-failure-behaviour* :error asdf:*compile-file-warnings-behaviour* :error)
  (let ((*standard-output* *error-output*))
    (handler-bind ((warning (lambda (c)
                             (unless (typep c 'sb-kernel:redefinition-warning)
                               (error \"COD-01 tools/pool-controller-bench.lisp: ~A.\" c)))))
      (asdf:load-asd (merge-pathnames \"arcdocdb.asd\" (truename \"./\")))
      (asdf:load-system \"arcdocdb/tests\" :force t))))

(defun api (name)
  \"Risolve soltanto API pubbliche prima del clock; un nome mancante e difetto C4.\"
  (multiple-value-bind (symbol visibility) (find-symbol name \"ARCDOCDB.SCHEDULER\")
    (unless (and symbol (eq :external visibility) (fboundp symbol))
      (error \"COD-60 tools/pool-controller-bench.lisp: API ~A assente.\" name))
    (symbol-function symbol)))

(defun action-token (action)
  \"Codici di risultato distinti, preregistrati; rifiuta un risultato inatteso.\"
  (ecase action (:hold 11) (:pending 17) (:grow 23) (:shrink 31)))

(defun reference-trace ()
  \"Oracolo matematico startup: EWMA razionale troncata, +1 e floor(3N/4), dwell=1.
Le righe sono vettori (actual target action queue-scaled candidate since-relative).
Non chiama il prodotto. Il giro torna a target=1, EWMA=0 e candidato :hold.\"
  (let ((rows (make-array (* 2 +phase-length+))) (queue 0) (target 1)
        (candidate :hold) (since 0) (token 0))
    (dotimes (index (length rows))
      (let* ((tick (1+ index)) (actual target) (value (if (< index +phase-length+) 128 0))
             (action :hold))
        (setf queue (floor (+ (* 7 queue) (* 256 value)) 8))
        (let ((direction (cond ((< queue 256) :shrink) ((>= queue 2048) :grow) (t :hold))))
          (cond
            ((or (eq direction :hold) (and (eq direction :grow) (= target 8))
                 (and (eq direction :shrink) (= target 1)))
             (setf candidate :hold since tick))
            ((not (eq direction candidate)) (setf candidate direction since tick))
            ((>= (- tick since) 1)
             (setf target (if (eq direction :grow) (min 8 (1+ target)) (max 1 (floor (* 3 target) 4)))
                   action direction candidate :hold since tick))))
        (setf (svref rows index) (vector actual target action queue candidate since))
        (incf token (+ target (action-token action) queue))))
    (unless (and (= target 1) (= queue 0) (eq candidate :hold) (= since (* 2 +phase-length+)))
      (error \"COD-60 tools/pool-controller-bench.lisp: l'oracolo non torna alla base.\"))
    (values rows (+ token 4 17 4 11))))

(defun verify-state (read controller target queue cpu p99 tick candidate since)
  \"Confronta tutti i sette risultati; le attese sono scalari/oggetti preregistrati.\"
  (multiple-value-bind (a b c d e f g) (funcall read controller)
    (unless (and (eql a target) (eql b queue) (eql c cpu) (eql d p99)
                 (eql e tick) (eq f candidate) (eql g since))
      (error \"COD-60 tools/pool-controller-bench.lisp: oracolo del controller difforme al tick ~A.\" tick))))

(defun create-cycle ()
  \"Prealloca tre controller e trace; restituisce funzione caldo e token indipendente.
Controller principale: period=dwell=1, min=1/max=8. Altri due period=dwell=160.\"
  (let* ((create (api \"CREA-CONTROLLORE-POOL\")) (update (api \"AGGIORNA-CONTROLLORE-POOL\"))
         (read (api \"LEGGI-CONTROLLORE-POOL\"))
         (main (funcall create 4 :minimum 1 :maximum 8 :initial 1 :period 1 :dwell 1))
         (pending (funcall create 4 :initial 4 :period 160 :dwell 160))
         (hold (funcall create 4 :initial 4 :period 160 :dwell 160)) (offset 0))
    (funcall update main 0 0 100 900 1)
    (funcall update pending 0 128 100 900 1)
    (funcall update hold 0 128 900 900 4)
    (multiple-value-bind (rows token) (reference-trace)
      (values
       (lambda ()
         (let ((sink 0))
           (declare (type fixnum sink offset))
           (dotimes (index (length rows))
             (let* ((row (svref rows index)) (tick (+ offset index 1))
                    (value (if (< index +phase-length+) 128 0))
                    (since (+ offset (the fixnum (svref row 5)))))
               (multiple-value-bind (target action) (funcall update main tick value 100 900 (svref row 0))
                 (unless (and (eql target (svref row 1)) (eq action (svref row 2)))
                   (error \"COD-60 tools/pool-controller-bench.lisp: decisione difforme al tick ~D.\" tick))
                 (verify-state read main target (svref row 3) 25600 230400 tick (svref row 4) since)
                 (incf sink (+ (the fixnum target) (action-token action) (the fixnum (svref row 3)))))))
           (incf offset (* 2 +phase-length+))
           (multiple-value-bind (target action) (funcall update pending offset 128 100 900 1)
             (unless (and (eql target 4) (eq action :pending))
               (error \"COD-60 tools/pool-controller-bench.lisp: pending non conserva target.\"))
             (verify-state read pending 4 32768 25600 230400 offset :hold offset)
             (incf sink (+ (the fixnum target) (action-token action))))
           (multiple-value-bind (target action) (funcall update hold offset 128 900 900 4)
             (unless (and (eql target 4) (eq action :hold))
               (error \"COD-60 tools/pool-controller-bench.lisp: CPU alta non conserva target.\"))
             (verify-state read hold 4 32768 230400 230400 offset :hold offset)
             (incf sink (+ (the fixnum target) (action-token action))))
           sink)) token))))

(defun sample-record (replica iterations warmup token)
  \"Tutti i campi esistono prima di warmup, heap e clock; oracolo calcolato indipendentemente.\"
  (list :replica replica :status :running :stage :warmup :iterations iterations
        :warmup-iterations warmup :completed-iterations 0 :heap-bytes nil :raw-ticks nil
        :seconds nil :time-quality :pending :sink nil :diagnostic nil
        :expected-sink (logand most-positive-fixnum
                              (+ (* iterations token) (/ (* iterations (1- iterations)) 2)))))

(defun sample (function iterations token progress &key (warmup +warmup+) (clock #'get-internal-real-time))
  \"Misura bounded, GC prima del clock; anche l'errore conserva cicli e raw parziali.\"
  (unless (and (<= 1 iterations +iterations+) (<= 0 warmup +warmup+)
               (typep token '(integer 0 #.most-positive-fixnum)))
    (error \"COD-60: parametri fuori dal budget preregistrato.\"))
  (dotimes (i warmup) (funcall function))
  (sb-ext:gc :full t)
  (setf (getf progress :stage) :measured)
  (let ((before (funcall clock)) (heap-before (sb-ext:get-bytes-consed)) (sink 0) (failure nil))
    (declare (type fixnum sink))
    (handler-case
        (dotimes (i iterations)
          (setf sink (logand most-positive-fixnum (+ sink i (the fixnum (funcall function))))
                (getf progress :completed-iterations) (1+ i)))
      (error (condition) (setf failure condition)))
    (let ((heap (- (sb-ext:get-bytes-consed) heap-before)) (ticks (- (funcall clock) before)))
      (setf (getf progress :heap-bytes) heap (getf progress :raw-ticks) ticks
            (getf progress :sink) sink (getf progress :time-quality)
            (if (zerop ticks) :below-resolution :measured)
            (getf progress :seconds) (when (plusp ticks) (/ ticks (float internal-time-units-per-second 1d0))))
      (when failure (error failure))
      (unless (and (>= heap 0) (>= ticks 0) (= sink (getf progress :expected-sink)))
        (error \"COD-60: heap/clock negativo o sink ~D diverso da ~D.\" sink (getf progress :expected-sink)))
      (setf (getf progress :status) :ok (getf progress :stage) :complete)))
  progress)

(defun campaign (report checkpoint)
  \"Cinque repliche owner-only; ogni fixture e all'esterno del tratto misurato.\"
  (multiple-value-bind (function token) (create-cycle)
    (setf (getf report :expected-cycle-token) token)
    (dotimes (replica +replicas+)
      (let ((progress (sample-record replica +iterations+ +warmup+ token)))
        (setf (getf report :current-replica) replica
              (getf report :samples) (append (getf report :samples) (list progress)))
        (funcall checkpoint)
        (sample function +iterations+ token progress)
        (funcall checkpoint)
        (unless (zerop (getf progress :heap-bytes))
          (setf (getf progress :status) :failed (getf progress :diagnostic) \"COD-30: heap osservato positivo.\")
          (error \"COD-30 tools/pool-controller-bench.lisp: heap positivo nella replica ~D.\" replica)))))
  (setf (getf report :current-replica) nil)
  report)

(defun make-report ()
  \"Metadati, formula e limiti espliciti; misure non qualificano il pool runtime.\"
  (list :schema-version 1 :kind :pool-controller-benchmark :status :running :stage :pending
        :diagnostic nil :process-argv sb-ext:*posix-argv* :tool-arguments (uiop:command-line-arguments)
        :source-fingerprints-before (fingerprints) :source-fingerprints-after nil
        :source-consistency :pending :recorded-at (get-universal-time) :self-test nil
        :samples nil :current-replica nil :sbcl (lisp-implementation-version)
        :machine (machine-type) :os (software-type) :os-version (software-version)
        :controllers 3 :owner-threads 1 :cores-input 4 :minimum 1 :maximum 8 :safety 3
        :iterations +iterations+ :warmup +warmup+ :replicas +replicas+ :samples-per-cycle 162
        :timer-units-per-second internal-time-units-per-second :expected-cycle-token nil
        :trace '(:grow-samples 80 :queue 128 :cpu 100 :p99 900 :shrink-samples 80 :queue 0
                 :pending-actual 1 :pending-target 4 :hold-cpu 900 :hold-target 4)
        :token-formula \"sum(target+action-token+queue-scaled) on 160 rows; pending=4+17; hold=4+11; sample=N*token+N*(N-1)/2\"
        :limits '(:serial-owner :injected-inputs :preallocated-trace :startup-errors-excluded
                  :counter-not-absolute-nonallocation-proof :external-load-uncontrolled
                  :clock-zero-is-below-resolution :no-time-threshold-no-tuning-claim
                  :no-pool-worker-park-wake-contention-io-durability-or-release-qualification)))

(defun acquire-directory (path)
  \"Directory esclusiva 0700; rifiuta una destinazione precedente senza scriverla.\"
  (let ((directory (uiop:ensure-directory-pathname (merge-pathnames path (uiop:getcwd)))))
    (ensure-directories-exist
     (merge-pathnames \"parent-placeholder\" (uiop:pathname-parent-directory-pathname directory)))
    (sb-posix:mkdir (namestring directory) #o700)
    directory))

(defun write-report (report directory)
  \"Checkpoint esclusivo nella directory reclamata; ultimo rapporto leggibile conservato.\"
  (with-open-file (stream (merge-pathnames \"report.next.lisp\" directory)
                          :direction :output :if-exists :supersede)
    (let ((*print-readably* t)) (write report :stream stream :pretty t) (terpri stream)))
  (uiop:rename-file-overwriting-target (merge-pathnames \"report.next.lisp\" directory)
                                     (merge-pathnames \"report.lisp\" directory)))

(defun run-driver (args &key (product-loader #'load-product) (tester #'self-test) (runner #'campaign))
  \"CLI, load e sensori conservati; fallimenti mantengono replica e contatori già raccolti.\"
  (let ((report (make-report)) (directory nil))
    (handler-case
        (progn
          (unless (or (equal args '(\"--self-test\"))
                      (and (= 2 (length args)) (string= \"--bench\" (first args))))
            (error \"COD-61: uso --self-test oppure --bench directory-nuova/.\"))
          (when (= 2 (length args)) (setf directory (acquire-directory (second args))))
          (setf (getf report :stage) :load-product)
          (when directory (write-report report directory))
          (funcall product-loader)
          (setf (getf report :stage) :self-test (getf report :self-test) (funcall tester))
          (when directory
            (setf (getf report :stage) :campaign)
            (funcall runner report (lambda () (write-report report directory))))
          (setf (getf report :status) :ok (getf report :stage) :complete))
      (error (condition)
        (setf (getf report :status) :failed (getf report :diagnostic) (princ-to-string condition))
        (let ((last (car (last (getf report :samples)))))
          (when (and last (eq :running (getf last :status)))
            (setf (getf last :status) :failed (getf last :diagnostic) (princ-to-string condition))))))
    (let ((after (fingerprints)))
      (setf (getf report :source-fingerprints-after) after (getf report :source-consistency)
            (if (equal (getf report :source-fingerprints-before) after) :stable :changed))
      (when (and (eq :ok (getf report :status)) (eq :changed (getf report :source-consistency)))
        (setf (getf report :status) :source-changed (getf report :diagnostic) \"COD-61: sorgenti cambiati.\")))
    (when directory (write-report report directory))
    report))

(defun fresh-self-test-directory ()
  \"Fixture temporanea esclusiva; limite esplicito di mille collisioni.\"
  (loop for attempt below 1000
        for directory = (merge-pathnames
                         (format nil \"arcdocdb-pool-controller-bench-~D-~D-~D/\"
                                 (get-universal-time) (sb-posix:getpid) attempt)
                         (uiop:temporary-directory))
        do (handler-case (progn (sb-posix:mkdir (namestring directory) #o700)
                                (return-from fresh-self-test-directory directory))
             (sb-posix:syscall-error (condition)
               (unless (= sb-posix:eexist (sb-posix:syscall-errno condition)) (error condition)))))
  (error \"COD-60: impossibile acquisire directory della fixture.\"))

(defun read-self-test-report (directory)
  \"Legge soltanto la fixture prodotta dal sensore; nessuna valutazione del dato.\"
  (let ((*read-eval* nil))
    (with-open-file (stream (merge-pathnames \"report.lisp\" directory)) (read stream))))

(defun self-test-reporter ()
  \"Destinazione precedente intatta; campione completo e raw parziale sopravvivono all'errore.\"
  (let ((root (fresh-self-test-directory)))
    (unwind-protect
         (let* ((existing (acquire-directory (merge-pathnames \"existing/\" root)))
                (failed (merge-pathnames \"failed/\" root)))
           (write-report '(:sentinel :unchanged) existing)
           (unless (and (eq :failed (getf (run-driver (list \"--bench\" (namestring existing))
                                                    :product-loader (constantly nil)
                                                    :tester (constantly :passed)) :status))
                        (equal (read-self-test-report existing) '(:sentinel :unchanged)))
             (error \"COD-60: report precedente non conservato.\"))
           (run-driver (list \"--bench\" (namestring failed))
                       :product-loader (constantly nil) :tester (constantly :passed)
                       :runner (lambda (report checkpoint)
                                 (setf (getf report :current-replica) 1 (getf report :samples)
                                       (list (list :status :ok :raw-ticks 3 :heap-bytes 0)
                                             (list :status :running :raw-ticks 7 :heap-bytes 11
                                                   :diagnostic nil)))
                                 (funcall checkpoint)
                                 (error \"fixture: replica interrotta\")))
           (let* ((saved (read-self-test-report failed)) (samples (getf saved :samples)))
             (unless (and (eq :failed (getf saved :status)) (= 1 (getf saved :current-replica))
                          (= 2 (length samples)) (eq :ok (getf (first samples) :status))
                          (eq :failed (getf (second samples) :status))
                          (= 7 (getf (second samples) :raw-ticks))
                          (= 11 (getf (second samples) :heap-bytes)))
               (error \"COD-60: campione precedente o raw del fallimento persi.\"))))
      ;; La cancellazione C4 riguarda soltanto la directory acquisita da questa fixture.
      (uiop:delete-directory-tree root :validate t)))
  :passed)

(defun self-test-partial-sample ()
  \"Errore del ciclo misurato: clock/heap/sink e numero completato sono preservati.\"
  (let ((progress (sample-record 0 4 0 0)) (calls 0) (clock 0))
    (unless (handler-case
                (progn (sample (lambda ()
                                 (incf calls)
                                 (when (= calls 2) (error \"fixture: misura interrotta\"))
                                 0)
                               4 0 progress :warmup 0 :clock (lambda () (incf clock 7)))
                       nil)
              (error (condition)
                (setf (getf progress :status) :expected-rejection
                      (getf progress :diagnostic) (princ-to-string condition)) t))
      (error \"COD-60: ciclo difettoso non interrotto.\"))
    (unless (and (= calls 2) (= 1 (getf progress :completed-iterations))
                 (= 0 (getf progress :sink)) (= 7 (getf progress :raw-ticks))
                 (>= (getf progress :heap-bytes) 0) (eq :measured (getf progress :stage)))
      (error \"COD-60: raw parziale della misura non conservato.\"))
    progress))

(defun self-test-invalid-input ()
  \"Rifiuto tipizzato fuori misura; il campione invalido non applica un prefisso.\"
  (let* ((controller (funcall (api \"CREA-CONTROLLORE-POOL\") 4))
         (update (api \"AGGIORNA-CONTROLLORE-POOL\")) (read (api \"LEGGI-CONTROLLORE-POOL\")))
    (funcall update controller 0 128 100 900 1)
    (let ((before (multiple-value-list (funcall read controller))))
      (unless (handler-case
                  (progn (funcall update controller 500 128 1001 900 1) nil)
                (error (condition)
                  (typep condition (find-symbol \"INVALID-ARGUMENT\" \"ARCDOCDB.CONDITIONS\"))))
        (error \"COD-60 tools/pool-controller-bench.lisp: campione invalido accettato o errore non tipizzato.\"))
      (unless (equal before (multiple-value-list (funcall read controller)))
        (error \"COD-60 tools/pool-controller-bench.lisp: campione invalido muta il controller.\"))))
  :passed)

(defun self-test ()
  \"Fixture positiva/negativa: sensore heap, sink, clock, oracolo API, output e CLI.\"
  (let* ((baseline (sample-record 0 +iterations+ +warmup+ 0))
         (positive (sample-record 0 16 0 1048576)) (probe nil)
         (wrong (sample-record 0 2 0 0)) (zero (sample-record 0 2 0 0)) (composed nil))
    (sample (lambda () 0) +iterations+ 0 baseline)
    (unless (zerop (getf baseline :heap-bytes)) (error \"COD-60: baseline heap non nullo.\"))
    (sample (lambda () (setf probe (make-array 1048576 :element-type '(unsigned-byte 8) :initial-element 0))
              (length probe)) 16 1048576 positive :warmup 0)
    (unless (and (= 1048576 (length probe)) (>= (getf positive :heap-bytes) (* 16 1048576)))
      (error \"COD-60: allocazione deliberata non rilevata.\"))
    (unless (handler-case (progn (sample (lambda () 1) 2 0 wrong :warmup 0) nil)
              (error (condition) (setf (getf wrong :status) :expected-rejection
                                      (getf wrong :diagnostic) (princ-to-string condition)) t))
      (error \"COD-60: sink errato non respinto.\"))
    (sample (lambda () 0) 2 0 zero :warmup 0 :clock (constantly 0))
    (unless (and (eq :below-resolution (getf zero :time-quality)) (null (getf zero :seconds)))
      (error \"COD-60: clock nullo convertito in durata.\"))
    (multiple-value-bind (function token) (create-cycle)
      (setf composed (sample-record 0 4 0 token))
      (sample function 4 token composed :warmup 0))
    (unless (handler-case
                (progn (verify-state (lambda (controller) (declare (ignore controller))
                                       (values 2 0 0 0 nil :hold nil)) nil 1 0 0 0 nil :hold nil) nil)
              (error () t))
      (error \"COD-60: fixture target difforme non respinta.\"))
    (let ((called nil))
      (dolist (args '(nil (\"--bench\") (\"--bad\") (\"--bench\" \"directory\" \"extra\")))
        (unless (and (eq :failed (getf (run-driver args :product-loader (lambda () (setf called t))) :status))
                     (null called))
          (error \"COD-60: CLI invalida eseguita.\"))))
    (list :status :ok :baseline baseline :positive-control positive :wrong-sink-probe wrong
          :zero-clock-probe zero :composed-api-probe composed :invalid-cli :rejected
          :target-oracle-positive-negative :passed :invalid-non-hot (self-test-invalid-input)
          :existing-destination-and-partial-raw (self-test-reporter)
          :measured-partial-raw (self-test-partial-sample))))

(defun main ()
  \"Rapporto leggibile; ogni errore esce nonzero con diagnosi C4.\"
  (let ((report (run-driver (uiop:command-line-arguments))))
    (let ((*print-readably* t)) (write report :pretty t) (terpri))
    (unless (eq :ok (getf report :status))
      (format *error-output* \"~&tools/pool-controller-bench.lisp: ~A~%\" (getf report :diagnostic))
      (uiop:quit 1))))
(unless (member :arcdocdb-pool-controller-bench-library *features*) (main))
")))
