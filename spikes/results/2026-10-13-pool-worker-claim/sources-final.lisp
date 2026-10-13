(:SCHEMA-VERSION 1 :KIND :POOL-WORKER-LIFECYCLE-FINAL-SOURCES :VERSION
 "900fa93d9e14a252e6a2b5a009d19728b2de34af" :PART 1 :PARTS 1 :SOURCES
 ((:PATH
   #A((73) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/CHANGELOG.md")
   :BYTES 17525 :SHA256 "6ef6ab54cc35d0ef7651278a7e823a9bd73a5e9fbe2aaaf74c5d130c53918e06"
   :GIT-BLOB "2e29d5d4d0f57204ecdd25db0ceae3c1fd7e8fcb" :TEXT "# Changelog

Formato basato su [Keep a Changelog](https://keepachangelog.com/it-IT/1.1.0/). Il progetto
non ha ancora rilasci; le versioni seguiranno la [roadmap](docs/roadmap.md).

## [Non rilasciato]

### Aggiunto

- Presa dei writer governata dallo stato del pool: conferma il comando solo
  dopo la barriera IDLE, delega il claim C1 quando attivo e lascia ready e
  cursore intatti quando inattivo. Compiti e ricircoli già acquisiti completano
  i propri obblighi prima del ritiro; nessuna attesa o gestione fisica dei thread.

- Preparazione del checkpoint `control.log.tmp`: header della Serie, EDIT
  completo e SEAL costruiti senza I/O, manifest verificato contro il nuovo
  ACTIVE, file fisicamente distinto, trasferimenti a blocchi, rilettura esatta
  e fsync del parent. Nessun CSN o rinomina implicita; integrazione del recovery
  e qualifica C1 restano aperte.

- Attuazione logica del controllore pool su worker preesistenti: richieste
  persistenti e conteggio delle sole conferme, ritiro soltanto a contesto IDLE
  senza abbandonare lease o batch, riattivazione degli stessi contesti.
  Include 18 prove con worker reali, copertura C3 senza esclusioni e misure
  senza allocazioni dopo l'avvio. Dispatcher, risveglio e avvio fisico restano aperti.

- Preparazione del nuovo segmento writer: preflight senza effetti, identità
  readonly/append prima della write, header canonico durevole, rilettura esatta
  e fsync del parent. Adattatore ACTIVE con prova obbligatoria e verifica del
  registro CSN della vista; errori senza retry o risultati parziali. Decisione
  EDIT, apertura/rotazione del server e qualifica C1 restano da integrare.

- Ponte fonti GET della Serie: directory CLOSED nel contenuto della radice
  ACTIVE, acquisizione unica dal controller sotto EBR, risoluzione dalla
  stessa radice catturata e rifiuto di owner/ID duplicati prima dell'adozione.
  Mantiene il protocollo WAL e i cinque esiti del nucleo GET; rotazione e
  reclaim completo restano distinti.

- Scrittura dei float CBOR da parole IEEE: riduzione esatta della larghezza,
  preservazione di segno e payload NaN, preflight prima della mutazione
  e destinazioni private per i worker. Qualifica C1 e profilo documentale
  restano aperti.

- Controllore locale del numero di worker di calcolo: EWMA intere,
  crescita additiva, riduzione moltiplicativa e permanenza delle condizioni.
  Campioni e tempo iniettati, target distinto dai worker effettivi,
  aggiornamento limitato senza allocazioni dopo l’avvio. Avvio, risveglio
  e ritiro dei thread restano il prossimo componente del pool.

- Associazione fisica readonly/append: confronto esatto device/inode nel pool
  I/O, prova immutabile legata alle capacità e verifica senza syscall nel
  costruttore ACTIVE. Backend iniettabile esteso con identity opzionale;
  rifiuti senza fallback, retry o mutazioni. Percorso GET invariato;
  adozione nel server e qualifica C1 restano aperte.

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
   :BYTES 14799 :SHA256 "fef2becb12036ffefbb5cee6a68d65b9d58fae09faaaab6bcd4d9d3656be076d"
   :GIT-BLOB "30b239c3ec9aabef9e3e8acb61f361e003f53e5d" :TEXT
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
                             (:file \"cbor-simple-write\")
                             (:file \"cbor-float-narrow\") (:file \"cbor-float-write\")))
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
                             (:file \"read\") (:file \"policy\") (:file \"update\")
                             (:file \"lifecycle-types\") (:file \"lifecycle-read\")
                             (:file \"lifecycle-build\") (:file \"lifecycle-worker\")
                             (:file \"lifecycle-update\") (:file \"pool-claim\")))
               (:module \"storage\"
                :serial t
                :components ((:file \"package\") (:file \"formats\") (:file \"segment-header\")
                             (:file \"log-header\") (:file \"compaction-scan\")
                             (:file \"control-payload\") (:file \"payload-record\")
                             (:file \"payload-write\")))
               (:module \"io\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"identity-types\")
                             (:file \"native\") (:file \"lifecycle\") (:file \"identity\")
                             (:file \"transfer\") (:file \"flush\")))
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
                :components ((:file \"package\") (:file \"types\") (:file \"build\") (:file \"read\")
                             (:file \"sources-types\") (:file \"sources-read\")))
               (:module \"active\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"preflight\")
                             (:file \"prepare\") (:file \"source\")))
               (:module \"control\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"dependency\")
                             (:file \"build\") (:file \"preflight\") (:file \"transfer\") (:file \"prepare\"))))
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
                             (:file \"cbor-simple-write-threads\")
                             (:file \"cbor-float-write-support\") (:file \"cbor-float-write\")
                             (:file \"cbor-float-write-threads\")))
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
                :components ((:file \"support\") (:file \"construction\") (:file \"read\") (:file \"threads\")
                             (:file \"series-support\") (:file \"series-read\")))
               (:module \"get-resolver\" :serial t
                :components ((:file \"support\") (:file \"sort\") (:file \"construction\") (:file \"read\")))
               (:module \"execution\" :serial t
                :components ((:file \"support\") (:file \"queue\") (:file \"threads\")
                             (:file \"handoff\") (:file \"ready\") (:file \"ready-recycle\") (:file \"worker\")))
               (:module \"scheduler\" :serial t
                :components ((:file \"support\") (:file \"controller\") (:file \"lifecycle\")
                             (:file \"pool-claim\")))
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
             (uiop:symbol-call '#:arcdocdb.cbor.float.write.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.csn.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.mvcc.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.epochs.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.read.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.get.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.get.performance.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.get.directory.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.get.resolver.tests '#:run)
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
   :BYTES 8874 :SHA256 "5a6904fdc0e22b0eec06575e34bfcf0a825fa2ac21de8e88aee4f98a1d9a9b91" :GIT-BLOB
   "2a8ad6dd73ac5599f6dbb6e4d3b813d21a13c299" :TEXT "# Implementazione

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
| Scrittura dei float CBOR | [Bit IEEE, riduzione esatta e destinazione privata](cbor-float-scrittura.md) | [`src/codec/cbor-float-write.lisp`](../../src/codec/cbor-float-write.lisp) |
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
| Attuazione del pool | [Attivazione e ritiro confermati dai worker](pool-worker-lifecycle.md) | [`src/scheduler/lifecycle-worker.lisp`](../../src/scheduler/lifecycle-worker.lisp) |
| Presa governata dal pool | [Gate active, contesto IDLE e presa C1 delegata](pool-worker-claim.md) | [`src/scheduler/pool-claim.lisp`](../../src/scheduler/pool-claim.lisp) |
| Confine I/O | [Append, pread e flush durevole](io.md) | [`src/io/`](../../src/io/) |
| Associazione dei file | [Device/inode e capacità readonly/append del medesimo ACTIVE](associazione-file.md) | [`src/io/identity.lisp`](../../src/io/identity.lisp) |
| Nuovo segmento writer | [Header durevole, rilettura, directory e sorgente certificata](inizializzazione-active.md) | [`src/active/`](../../src/active/) |
| Checkpoint del control log | [EDIT completo, piano privato e preparazione durevole a blocchi](checkpoint-control.md) | [`src/control/`](../../src/control/) |
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
| Resolver GET CLOSED | [Frontiera dal manifest, flag e prova OUTCOME](get-resolver.md); [metodo delle prove funzionali](get-resolver-metodo.md) | [`src/get-resolver/`](../../src/get-resolver/) |
| Directory GET CLOSED | [Selezione limitata del segmento nella Serie](get-directory.md) | [`src/get-directory/`](../../src/get-directory/) |
| Fonti GET della Serie | [Acquisizione ACTIVE/CLOSED dalla singola radice pubblicata](get-fonti-serie.md) | [`src/get-directory/sources-read.lisp`](../../src/get-directory/sources-read.lisp) |
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
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/pool-worker-lifecycle.md")
   :BYTES 9048 :SHA256 "3dc8ad5ce8a66a00d79822bf928dc8105bdf1aa52a1e3e5fc9929d06d62f9913" :GIT-BLOB
   "e45c6941e0534180995d60f8882629b427f06f01" :TEXT "# Attuazione logica del pool di worker

Il registro di `arcdocdb.scheduler` collega il [controllore EWMA/AIMD](controllore-pool.md)
a worker preesistenti, ciascuno proprietario del proprio contesto writer. La crescita
e il ritiro diventano richieste persistenti; il numero effettivo cambia soltanto
quando il worker conferma. È un incremento C3 di REQ-THR-001, REQ-CON-005 e
REQ-AFF-008/013 secondo [ADR-0031](../adr/0031-software-critico-criteri-e-priorita.md).
La [metodologia](pool-worker-lifecycle-metodo.md) preregistra le prove; la
[revisione indipendente](pool-worker-lifecycle-revisione.md) e
[i risultati](pool-worker-lifecycle-risultati.md) delimitano l'evidenza disponibile.

## Confine e proprietà

Il coordinatore possiede un controller e un registro, in modo esclusivo e non
rientrante. Ogni worker crea sul proprio thread un contesto e una porta; il caller
pubblica queste porte al coordinatore tramite un handshake di avvio. La factory del
registro copia il vettore, verifica tutti gli elementi e poi lega permanentemente
le porte. Un controller è usato in un solo registro; dopo il collegamento si aggiorna
esclusivamente tramite `aggiorna-registro-pool`. Il getter originale resta utilizzabile.
Il caller non accede alla rappresentazione privata né riutilizza una porta in un altro
pool. Crea una sola porta operativa per contesto e mantiene il vettore di input
esclusivo durante la factory. La factory rifiuta il secondo binding delle porte;
non rileva duplicazioni di nuove porte dello stesso contesto fra registri differenti.

Il vettore contiene esattamente `controller.maximum` porte con owner distinti. I
worker attivi iniziali sono il prefisso di lunghezza `controller.target`; gli altri
sono già creati ma logicamente inattivi. Tutti iniziano con generazione zero e stato
confermato, senza comando pendente. La costruzione alloca; i passi successivi usano
solo parole fixnum, valori multipli e scansioni bounded. La deduplicazione usa un hash
EQ all'avvio, evitando ricerche quadratiche.

`actual` conta **attivazioni logiche confermate**, non thread OS, worker sani, epoche
o richieste. Il worker usa il Boolean restituito dal proprio passo per decidere se
può iniziare altri compiti. Un dispatcher deve rispettare quel Boolean: le API
execution esistenti non consultano la porta. Non sono introdotti spawn, join, kill,
attese, semafori, mutex, clock reali o callback nel codice di prodotto. Thread e
contesti inattivi restano disponibili per il riuso.

La conferma avviene tra compiti a completamento, senza epoche di lettura né risorse
esterne al contesto writer. Il verificatore C1 esistente
`execution::%richiedi-worker :idle` è chiamato soltanto in lettura; controlla owner,
stato, riferimento al writer, lease e debito batch. L'attuatore non modifica writer,
ready, Serie o bridge. Nessuna nuova barriera d'integrità viene affidata a C3.
Questo confine rispetta [ADR-0045](../adr/0045-modello-di-esecuzione.md): non sospende
un compito e non esegue chiamate bloccanti.

## API

| API | Risultato e obblighi |
|---|---|
| `crea-porta-worker-pool context &key coordinator active` | Sul thread owner, contesto IDLE verificato; default coordinator corrente e active=T. Costruisce una porta con stato iniziale già confermato. |
| `crea-registro-pool controller ports` | Sul coordinatore del controller; vettore semplice della capacità esatta, porte owner distinti, prefisso attivo conforme e stabile. Copia privata e binding solo dopo la validazione completa. |
| `applica-stato-worker-pool port` | Sul worker owner. Restituisce active confermato e `:unchanged`, `:activated`, `:retired`, `:busy` oppure `:faulted`; massimo un comando applicato. |
| `leggi-registro-pool registry` | Sul coordinatore. Restituisce actual, target e pending senza copia heap. La scansione è progressiva durante le conferme concorrenti. |
| `aggiorna-registro-pool registry tick queue cpu p99` | Sul coordinatore. Restituisce target, azione del controller, actual letto prima del campione e pending conservativo. Tempo e metriche restano iniettati. |

Non c'è comando da applicare quando request=ack: il passo restituisce `:unchanged`
senza ispezionare lo stato execution; questo esito non certifica salute né IDLE.
Quando c'è un comando, CLAIMED, RUNNING,
BATCH, FINISHING e RESCHEDULE producono `:busy`; FAULTED produce `:faulted`.
In entrambi i casi il comando resta pendente e contesto, lease e diagnostica restano
intatti. Un contesto che dichiara IDLE ma ha obblighi incoerenti fallisce nella
barriera C1 prima della conferma.

## Protocollo e concorrenza

Ogni porta ha due parole atomiche: `request` del coordinatore e `ack` del worker.
La codifica è `2 × generation + active-bit`, con generation da zero a
`floor(most-positive-fixnum/2)`. Una sola richiesta può essere pendente. Il coordinatore
pubblica con barriera release e CAS; il worker legge acquire, controlla IDLE e
pubblica ack con release/CAS. Il coordinatore legge ack acquire. Il solo writer di
ciascuna parola è il suo proprietario; nessun retry CAS o ciclo di attesa è necessario.

Una nuova richiesta cambia il bit active e incrementa generation di uno. Porte
già nello stato desiderato non ricevono comandi. Il target seleziona sempre un
prefisso, quindi ogni ondata contiene soltanto attivazioni oppure soltanto ritiri.
Il prefisso minimo resta sempre attivo. Finché resta un comando pendente,
actual differisce dal target e il controller conserva la proposta con `:pending`.
Il tempo passato ad attendere conferme non matura una nuova isteresi.

Le conferme possono arrivare fuori ordine: durante la crescita, un worker successivo
può attivarsi prima del precedente. Il prefisso vale per le request; non è richiesto
agli ack intermedi. Il getter restituisce un conteggio progressivo, conservativo
rispetto al completamento dell'ondata. Se pending=NIL, tutte le conferme lette sono
uguali alle richieste correnti e actual=target. Il wrapper può restituire pending=T
anche se l'ultima conferma arriva subito dopo la lettura.

L'invariante delle parole ammette request=ack, oppure una generazione di differenza
con bit active diverso. Un comando regressivo, un salto di generazione o un comando
senza cambio di stato è rifiutato. Nessuna generation fa wrap o viene azzerata.
Prima di aggiornare un controller stabile si verifica il budget di generazione di
tutte le porte: l'esaurimento è un rifiuto conservativo anche per un campione hold.
L'esaurimento richiede la sostituzione amministrativa del componente; non autorizza
a resettare contesti o abbandonare comandi. Ogni preflight precede le scritture del
campione e delle request, evitando applicazioni parziali per errori ordinari.

Il registro ha costo O(maximum) per lettura/aggiornamento; il worker fa un passo O(1),
oltre alla barriera C1 bounded. Le scritture condivise avvengono per campione e per
conferma, fuori dalle operazioni della Serie, senza un contatore globale caldo.
Rispetta quindi INV-P6 e l'[elenco di stato condiviso](../architettura.md#archivio-coordinamento-minimo).

## Errori

| Condizione | Ragione |
|---|---|
| `invalid-argument` | `:pool-owner` per coordinatore invalido/estraneo; `:pool-worker-owner` per owner del passo estraneo; `:pool-active` per Boolean invalido. |
| `invalid-argument` | `:pool-ports` per vettore/capacità/elemento/owner duplicato; `:pool-binding` per una porta già legata; `:pool-port-state` per startup non stabile, non iniziale o prefisso errato. |
| `invariant-violation` | `:pool-port-state` per parole o richieste incoerenti; `:pool-state` per target/controller/capacità o conteggio privato incoerenti. |
| `resource-exhausted` | `:pool-generation` per budget di comando esaurito, senza mutazione. |
| Verificatori delegati | Factory e passo propagano le condizioni execution; il wrapper propaga i rifiuti di campioni del controller. |

Un comando bloccato da FAULTED resta diagnosticabile. Il coordinatore deve gestire
il guasto dell'Archivio e la mancata progressione; il componente non libera risorse
o decrementa un conteggio per nascondere il problema. Non ci sono handler generici,
cleanup che occultano errori o policy di recovery implicite.

Un conflitto CAS viola l'esclusività dei proprietari ed è un'invariante terminale,
non un rifiuto ordinario recuperabile. La pubblicazione di un'ondata può essere
parziale in questo caso; non si continua a usare il registro. Il passo non attesta
una conferma fallita, e nessuno dei campi d'integrità C1 viene modificato.

## Integrazione ancora richiesta

La [presa governata dal pool](pool-worker-claim.md) rispetta active e collega il
passo IDLE alla presa C1. REQ-THR-001 resta progettato a livello del motore completo.
Mancano dispatcher del server, sensori e coordinamento dell'Archivio, avvio graduale dei thread,
risveglio persistente dalla ready, gestione del guasto del pool e arresto fisico.
Il componente non qualifica un'attesa idle nativa, il pump di risveglio, il numero
di thread da avviare sull'hardware o la latenza end-to-end. QA-12/19 restano aperte.
")
  (:PATH
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/package.lisp")
   :BYTES 643 :SHA256 "a44fd2c3d435e1f6729bf861b6caeb54a184f31c92e7909aad9c18b491f03cdf" :GIT-BLOB
   "cadff5f2e29e7c5b625b95f9387faf29aad02178" :TEXT
   ";;;; Politica e attuatore logico del pool; thread preesistenti, nessuna attesa.
;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008 REQ-AFF-013
(defpackage #:arcdocdb.scheduler
  (:use #:cl)
  (:import-from #:arcdocdb.conditions #:invalid-argument #:invariant-violation
                #:resource-exhausted)
  (:export #:controllore-pool #:crea-controllore-pool
           #:aggiorna-controllore-pool #:leggi-controllore-pool
           #:porta-worker-pool #:crea-porta-worker-pool #:applica-stato-worker-pool
           #:prendi-writer-pool
           #:registro-pool #:crea-registro-pool #:leggi-registro-pool
           #:aggiorna-registro-pool))
")
  (:PATH
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/pool-worker-claim.md")
   :BYTES 5107 :SHA256 "20240f3011569792d86d0369e374b3e6c43dcac48192ea34c0fd37b54f211ef7" :GIT-BLOB
   "aa02b31d2e7360599c41e441dda1c0e735915f90" :TEXT "# Presa dei lavori governata dal pool

`arcdocdb.scheduler:prendi-writer-pool` collega l'attivazione logica del
[pool](pool-worker-lifecycle.md) alla presa di un writer dalla lista pronta.
È un incremento C3 di REQ-THR-001, REQ-CON-001/002/004/005 e REQ-AFF-008:
governa quando chiamare la barriera C1 esistente, senza sostituirla.
Il [metodo preregistrato](pool-worker-claim-metodo.md) delimita le prove.

## API e proprietà

La funzione riceve soltanto la `porta-worker-pool`: usa il contesto immutabile
associato alla porta, evitando una coppia porta/contesto estranea. La chiamata
appartiene al proprietario del worker, non è rientrante e avviene tra compiti
a completamento, senza epoca di lettura o risorse esterne ancora acquisite.
Il contesto deve essere IDLE e completamente libero.

Restituisce quattro valori:

| Valore | Significato |
|---|---|
| writer oppure NIL | Obbligo assunto soltanto con `:claimed`. |
| `:claimed`, `:empty`, `:busy`, `:inactive` | Esito della presa; i primi tre sono quelli dell'API execution. |
| cursore | Cursore restituito da execution se attivo; cursore conservato se inattivo. |
| azione lifecycle | Conferma applicata o `:unchanged`; il dominio dichiarato conserva quello di `applica-stato-worker-pool`. |

Il chiamante usa questa API per ogni nuova presa dal pool. Le API execution
dirette restano disponibili per i loro contratti; non consultano una porta.
Il nuovo gate non può impedire a un caller che lo aggira di prendere lavoro.

## Ordine del passo

1. Verifica il proprietario della porta.
2. Legge la fase execution e rifiuta ogni fase diversa da IDLE, compreso
   FAULTED, prima di leggere le lease di un compito in corso.
3. Esegue in sola lettura il verificatore C1 completo `%richiedi-worker :idle`.
   Un esito lifecycle `:unchanged` da solo non prova IDLE né salute.
4. Applica l'eventuale comando di attivazione o ritiro sull'owner reale.
5. Se attivo, delega un solo `execution:prendi-writer-worker`. Se inattivo,
   restituisce NIL, `:inactive` e il cursore corrente, senza interrogare
   i ring, acquisire guardie, scansionare o modificare la lista pronta.

La barriera C1 del punto 3 legge comunque la forma immutabile di ready e
verifica i riferimenti alle partizioni del contesto. Non legge head, tail,
count o slots del ring, non acquisisce una guardia e non cerca lavoro.

Il solo trasferimento di un obbligo rimane nell'API C1. Nessun campo writer,
lease, batch, Serie o ready viene scritto direttamente dal nuovo componente.
I controlli C3 restano fuori dal confine `%passo-worker`: un difetto della
porta non introduce una nuova scrittura di fault nel contesto C1.
La presa delegata conserva invece il suo confine e la diagnosi originaria.

## Ritiro e compiti in corso

Una richiesta di ritiro osservata al passo IDLE viene confermata prima del
polling di ready: anche con lavoro pronto il worker non assume un nuovo obbligo.
Una richiesta arrivata dopo la lettura active può lasciare partire quel singolo
claim. Rimane pendente finché il worker completa il compito e torna a IDLE;
la conferma non è anticipata né revocata.

Pop, conferma dei payload, chiusura del bridge Serie, ricircolo, cessione e
adozione mantengono i contratti esistenti e non sono sottoposti a questo gate.
Un RESCHEDULE deve pubblicare o trasferire l'obbligo unico prima del ritiro.
Il ricircolo a ring pieno può assegnare subito un altro writer CLAIMED: il
worker completa anche quell'obbligo, selezionando di nuovo il routing. Non
si promette convergenza del ritiro sotto saturazione perpetua del ring.
EMPTY e BUSY sono osservazioni locali, senza prova di quiescenza globale.

La conferma di un comando lifecycle resta valida se la successiva presa
delegata fallisce. Non si fa rollback dell'ACK, non si azzerano generazioni
e il conteggio active continua a rappresentare attivazioni logiche, non salute.
Il coordinatore deve gestire la diagnosi del worker e l'Archivio.

## Rifiuti e costo

Owner della porta estraneo: `invalid-argument :pool-worker-owner`.
Fase diversa da IDLE: `resource-exhausted :worker-state`, conservando fase,
prima causa, riferimenti, lease, batch, cursore e parole del pool.
Un IDLE incoerente fallisce nella barriera C1 prima di qualunque ACK o pop.
Parole o CAS del pool incoerenti propagano il rifiuto del lifecycle prima
della presa. Le condizioni della presa delegata restano quelle di execution.
Non ci sono retry, cleanup o handler che nascondano un errore.

Il gate è O(1), oltre ai verificatori C1 bounded. Solo il ramo attivo aggiunge
la scansione ready esistente O(K), con K massimo 64. Non introduce hash,
allocazioni intenzionali, callback, thread, attese o contatori globali.
Le conferme condivise avvengono per ondata, e ready usa le proprie partizioni.
Il passo non sospende un compito, secondo ADR-0045.

Il componente integra la presa logica, non il dispatcher completo del server.
Avvio graduale, park/wake persistente, sensori, coordinamento Archivio,
admission dei messaggi, worker morti e arresto fisico restano da realizzare.
REQ-THR-001 e QA-12/19 restano aperti a livello del motore completo.
")
  (:PATH
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/pool-worker-claim-metodo.md")
   :BYTES 4036 :SHA256 "aedfadbf875ef9b58ba54bc4b5269aba438983e53137c5c3eef645e1265f1e19" :GIT-BLOB
   "35575db9de839268157d59f2d5cd9de776d46abf" :TEXT
   "# Metodo preregistrato della presa governata dal pool

Preregistrazione del 2026-10-13 sulla base
`900fa93d9e14a252e6a2b5a009d19728b2de34af`, prima delle campagne congelate.
Il nuovo componente C3 è `src/scheduler/pool-claim.lisp`, con export nel
package e registrazione ASDF. Non si modificano sorgenti C1; le loro API
e verifiche vengono delegate senza indebolire proprietà o barriere.
Il [contratto](pool-worker-claim.md) fissa l'ordine dei controlli.

## Prove e revisione

- Porta inattiva con writer realmente pronto: nessun pop, rotazione del
  cursore, perdita o duplicazione di obblighi; ready e contesto conservati.
- Crescita e riduzione richieste dal controllore su owner reali distinti:
  l'attivazione precede il claim, il ritiro precede il polling di ready.
  La forma immutabile di ready viene comunque letta dalla barriera C1.
- Owner estraneo, tutte le fasi non-IDLE compresa FAULTED e IDLE incoerente:
  rifiuto prima di ACK/pop, con prima causa, riferimenti, lease e debito intatti.
  Le fault injection private dichiarate avvengono a quiescenza della fixture.
- Parole del pool incoerenti e conflitto di conferma: nessun claim riportato
  riuscito, nessuna nuova scrittura C3 nei campi d'integrità C1.
- EMPTY e BUSY conservano i risultati e la rotazione prevista da execution;
  INACTIVE restituisce il cursore originario senza scansione ready.
- Ritiro pendente dopo claim: completamento del bridge, conferma dei payload,
  rilascio Serie prima del writer e drenaggio dell'obbligo RESCHEDULE.
  Ring pieno: il writer successivo resta CLAIMED e riceve il proprio routing.
- Una lettura indipendente C3 di ordine dei controlli, owner, coupling privato,
  preservazione degli errori e costi bounded. Safety 3, compilazione senza
  warning/style-warning, lint e tracciabilità devono passare.

## Copertura

Scope completo: nuovo file `pool-claim.lisp` e `src/scheduler/package.lisp`,
senza esclusioni. Gate C3 almeno 95% di espressioni e rami, confronto esatto
su interi e denominatori non nulli. Confrontare dato nativo SB-COVER e HTML,
conservando tutti gli originali, inventario e percorsi mancanti. Il lettore
esistente resta invariato: un adattatore dichiara lo scope nuovo e passa i
self-test del lettore. Non si attribuisce la copertura C1 ereditata al gate
e non si deduce MC/DC dai conteggi.

## Misura locale

Il sensore C4 riusa quello lifecycle già verificato. Cinque repliche da
4096 cicli per campagna, 128 cicli di warmup e GC completa prima del clock.
Factory, API lookup, oracoli e setup sono fuori dal tratto misurato.
Tutti i quattro valori di ogni passo contribuiscono alla verifica del ciclo.

| Campagna | Ciclo e oracolo |
|---|---|
| EMPTY | Porta attiva, quattro shard vuoti; quattro prese, cursori 1/2/3/0 e azione `:unchanged`. |
| INACTIVE | Porta inattiva, quattro shard, cursore 2; quattro prese senza rotazione, azione `:unchanged`. |
| SWITCH | Richiesta privata di ritiro, due prese inattive; richiesta di attivazione, quattro prese EMPTY con cursori 1/2/3/0. Sei chiamate e due generazioni monotone per ciclo. |

SWITCH serializza i ruoli owner/coordinatore in una fixture C4 quiescente;
non qualifica conferme concorrenti né reimposta contesti o generazioni.
Le prove con lavoro vero e controllore concorrente appartengono ai test.
Conservare tick grezzi, heap, sink e numero di cicli completati. Clock nullo
significa sotto risoluzione; non si stabilisce una soglia di tempo né una
taratura. Zero heap osservato non è prova universale di non allocazione.

Prima delle misure, il sensore deve rilevare allocazione deliberata, sink
errato e ciascuno dei quattro risultati difformi, clock sotto risoluzione,
CLI invalida, destinazione preesistente e raw parziali dopo errore.
Ogni qualifica congelata usa `tools/record-command.lisp`, cache dedicate,
argv/output/esiti originali e identità sorgenti iniziale/finale. Fallimenti
rimangono fallimenti; copie e payload compressi sono verificati byte per byte.
Il controllo completo del repository include i dieci spike esistenti.
")
  (:PATH
   #A((90) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/pool-claim.lisp")
   :BYTES 1918 :SHA256 "e384f6091a5fcb506e718e12e77b06ab8dd4233a41024bc57ca3b14425e10b14" :GIT-BLOB
   "476372e627724a17b7c86257171ff1d33bd5b809" :TEXT
   ";;;; Admission logica del singolo claim; obblighi preesistenti restano a execution.
;;; OWNER: solo proprietario della porta e del suo contesto, non rientrante.
;;; SHARED: ACK del lifecycle per ondata; ready modificata solo dall'API C1 delegata.
(in-package #:arcdocdb.scheduler)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (porta-worker-pool)
                         (values (or null arcdocdb.execution:writer-programmabile)
                                 (member :claimed :empty :busy :inactive)
                                 arcdocdb.binary:index
                                 (member :unchanged :activated :retired :busy :faulted)
                                 &optional)) prendi-writer-pool))
(defun prendi-writer-pool (port)
  \"Pre: owner corrente, IDLE senza epoca o risorse esterne; nessuna rientranza.
Post: un claim C1 se attivo, oppure INACTIVE senza mutare ready/cursore.
INVALID-ARGUMENT owner, RESOURCE-EXHAUSTED fase; invarianti prima del gate.
Comandi tardivi restano pendenti fino al prossimo IDLE; nessun rollback o attesa.\"
  (unless (eq (porta-worker-pool-owner port) sb-thread:*current-thread*)
    (error 'invalid-argument :reason :pool-worker-owner))
  (let ((context (porta-worker-pool-context port)))
    (unless (eq (arcdocdb.execution:stato-worker-writer context) :idle)
      (error 'resource-exhausted :reason :worker-state))
    (arcdocdb.execution::%richiedi-worker context :idle)
    (multiple-value-bind (active action) (applica-stato-worker-pool port)
      (if active
          (multiple-value-bind (writer status next)
              (arcdocdb.execution:prendi-writer-worker context)
            (values writer status next action))
          (values nil :inactive
                  (arcdocdb.execution::contesto-worker-writer-cursor context) action)))))
")
  (:PATH
   #A((92) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/pool-claim.lisp")
   :BYTES 22728 :SHA256 "f968d57b6ff4dfc3cc31f1b1979afa896d95435093406b36320800783629901f"
   :GIT-BLOB "f636ee873deb2cd5347a50c9aec4a6afa16d13c5" :TEXT
   ";;;; Claim ammesso dal pool soltanto alla barriera C1 IDLE, senza revoca di compiti.
;;;; OWNER: porta, contesto e bridge sul thread creatore; coordinator delle fixture distinto.
;;;; FI quiescenti: immagini, parole corrotte e sostituzioni temporanee sempre ripristinate.
;;;; Le fixture Serie usano il backend pubblico e non dipendono da tests/series.
(in-package #:arcdocdb.scheduler.tests)

(defun pool-claim-check (port writer status cursor action)
  \"Oracolo dei quattro valori pubblici; identita writer e cursore sono attesi dal caller.\"
  (is (equal (list writer status cursor action)
             (multiple-value-list (arcdocdb.scheduler:prendi-writer-pool port)))))

(defun pool-claim-ready (context)
  (arcdocdb.execution::contesto-worker-writer-ready context))

(defun pool-claim-image (port &optional writers)
  \"Immagine FI bounded, solo per dimostrare l'assenza di mutazioni sui rifiuti.\"
  (let* ((context (arcdocdb.scheduler::porta-worker-pool-context port))
         (ready (pool-claim-ready context)))
    (list (lifecycle-words port) (lifecycle-context-state context)
          (map 'list #'arcdocdb.execution.tests::ready-fi-snapshot
               (arcdocdb.execution::lista-writer-pronti-partitions ready))
          (mapcar #'arcdocdb.execution.tests::handoff-fi-snapshot writers))))

(defun pool-claim-refusal (port type reason &optional writers)
  (let ((before (pool-claim-image port writers)))
    (arcdocdb.execution.tests::worker-capture-condition
     (lambda () (arcdocdb.scheduler:prendi-writer-pool port)) type reason)
    (is (equalp before (pool-claim-image port writers)))))

(defun pool-claim-local (&key (active t) (shards 1) (capacity 1) (start 0))
  (let* ((ready (arcdocdb.execution:crea-lista-writer-pronti
                 :shards shards :capacity capacity))
         (context (arcdocdb.execution:crea-contesto-worker-writer ready :start start)))
    (values (arcdocdb.scheduler:crea-porta-worker-pool context :active active) context ready)))

(defun pool-claim-writer (items &optional (ordinal 0))
  (let ((writer (arcdocdb.execution:crea-writer-programmabile
                 :capacity 4 :quantum 1 :routing-index ordinal)))
    (loop for item in items for count from 1
          do (arcdocdb.execution.tests::handoff-check-enqueue
              writer item count (if (= count 1) :schedule :queued)))
    writer))

(defun pool-claim-function-fi (name replacement thunk)
  \"FI quiescente: nessun worker esegue NAME durante la sostituzione della fixture.\"
  (let ((saved (fdefinition name)))
    (unwind-protect (progn (setf (fdefinition name) replacement) (funcall thunk))
      (setf (fdefinition name) saved))))

(defun pool-claim-series (id)
  \"Controller reale su backend C4 in memoria; nessun I/O richiesto dai compiti della prova.\"
  (let* ((backend (arcdocdb.io:make-backend
                   (lambda (path mode) (declare (ignore path mode)) id)
                   (lambda (&rest arguments) (declare (ignore arguments))
                     (error \"Lettura I/O inattesa nella fixture pool.\"))
                   (lambda (fd bytes start count) (declare (ignore fd bytes start)) count)
                   (lambda (fd) (declare (ignore fd)) 0)
                   (lambda (fd) (declare (ignore fd)) 0)
                   (lambda (fd) (declare (ignore fd)) 0)))
         (file (arcdocdb.io:crea-temporaneo \"pool-claim-series.tmp\" :backend backend))
         (log (arcdocdb.wal:crea-log-io file :segment id)))
    (values (arcdocdb.series:crea-controllore-serie
             (arcdocdb.csn:crea-registro-csn :capacity 4) log :capacity 2)
            file)))

(defun pool-claim-bridge-begin (link)
  (multiple-value-bind (token status reason) (arcdocdb.execution.series:inizia-worker-serie link)
    (is (plusp token)) (is (eq :active status)) (is (null reason)) token))

(defun pool-claim-bridge-pop (link token item)
  (let ((target (vector :left :untouched :right)))
    (multiple-value-bind (count status batch)
        (arcdocdb.execution.series:preleva-worker-serie link token target 1 2)
      (is (= 1 count)) (is (eq :messages status)) (is (plusp batch))
      (is (eq :left (svref target 0))) (is (eq item (svref target 1)))
      (is (eq :right (svref target 2))) batch)))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-inactive-claim-keeps-real-ready-obligation-and-cursor
  (multiple-value-bind (port context ready) (pool-claim-local :active nil :shards 3 :start 2)
    (let ((writer (pool-claim-writer '(:kept))))
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 writer)))
      (let ((before (pool-claim-image port (list writer))))
        ;; La sentinella FI distingue assenza di scansione da scansione senza pop.
        (pool-claim-function-fi
         'arcdocdb.execution::%prova-pronta
         (lambda (partition) (declare (ignore partition)) (error \"Scansione di worker inattivo.\"))
         (lambda () (dotimes (attempt 2) (pool-claim-check port nil :inactive 2 :unchanged))))
        (is (equalp before (pool-claim-image port (list writer)))))
      (arcdocdb.execution.tests::worker-check-claim context writer :claimed 1)
      (arcdocdb.execution.tests::worker-complete-one context writer :kept))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-THR-001-pool-real-grow-acknowledges-before-taking-ready-writer
  (let* ((workers (list (lifecycle-fixture-start t) (lifecycle-fixture-start nil)))
         (registry (arcdocdb.scheduler:crea-registro-pool
                    (crea-controllore-pool 1 :dwell 500) (lifecycle-ports workers)))
         (worker (second workers)) (writer nil))
    (unwind-protect
         (progn
           (lifecycle-call worker
                           (lambda (owned)
                             (setf writer (pool-claim-writer '(:activated)))
                             (is (= 1 (arcdocdb.execution:pubblica-writer-pronto
                                       (pool-claim-ready (lifecycle-fixture-context owned)) 0 writer)))
                             (pool-claim-check (lifecycle-fixture-port owned) nil :inactive 0 :unchanged)
                             :ok))
           (lifecycle-check-update registry 0 8 0 0 1 :hold 1 nil)
           (lifecycle-check-update registry 500 8 0 0 2 :grow 1 t)
           (lifecycle-call worker
                           (lambda (owned)
                             (pool-claim-check (lifecycle-fixture-port owned) writer :claimed 0 :activated)
                             (arcdocdb.execution.tests::worker-complete-one
                              (lifecycle-fixture-context owned) writer :activated) :ok))
           (is (equal '(2 2 nil) (lifecycle-registry-state registry))))
      (lifecycle-fixtures-stop workers))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-THR-001-pool-real-shrink-retires-before-removing-ready-writer
  (let* ((workers (list (lifecycle-fixture-start t) (lifecycle-fixture-start t)))
         (controller (crea-controllore-pool 1 :initial 2 :dwell 500))
         (registry (arcdocdb.scheduler:crea-registro-pool controller (lifecycle-ports workers))))
    (unwind-protect
         (progn
           (lifecycle-start-retirement controller registry)
           (lifecycle-call
            (second workers)
            (lambda (owned)
              (let* ((port (lifecycle-fixture-port owned)) (context (lifecycle-fixture-context owned))
                     (ready (pool-claim-ready context)) (writer (pool-claim-writer '(:retained))))
                (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 writer)))
                (let ((queue-before (arcdocdb.execution.tests::ready-fi-snapshot
                                     (arcdocdb.execution.tests::ready-test-partition ready 0)))
                      (context-before (lifecycle-context-state context))
                      (writer-before (arcdocdb.execution.tests::handoff-fi-snapshot writer)))
                  (pool-claim-check port nil :inactive 0 :retired)
                  (is (equalp queue-before (arcdocdb.execution.tests::ready-fi-snapshot
                                            (arcdocdb.execution.tests::ready-test-partition ready 0))))
                  (is (equal context-before (lifecycle-context-state context)))
                  (is (equalp writer-before (arcdocdb.execution.tests::handoff-fi-snapshot writer))))
                (pool-claim-check port nil :inactive 0 :unchanged)
                ;; Cleanup C4: trasferisce esplicitamente l'obbligo rimasto nel ring.
                (arcdocdb.execution.tests::worker-check-claim context writer :claimed 0)
                (arcdocdb.execution.tests::worker-complete-one context writer :retained)) :ok))
           (is (equal '(1 1 nil) (lifecycle-registry-state registry))))
      (lifecycle-fixtures-stop workers))))

;;; REQ: REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-foreign-owner-rejection-precedes-phase-and-word-checks
  (let ((worker (lifecycle-fixture-start nil)))
    (unwind-protect
         (let* ((port (lifecycle-fixture-port worker)) (context (lifecycle-fixture-context worker)))
           ;; FI quiescente dopo il ritorno della barriera: entrambi i livelli invalidi.
           (setf (arcdocdb.scheduler::porta-worker-pool-request port) 4
                 (arcdocdb.execution::contesto-worker-writer-state context) :faulted)
           (pool-claim-refusal port 'invalid-argument :pool-worker-owner))
      (lifecycle-fixtures-stop (list worker)))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-004-pool-every-nonidle-phase-refuses-before-inactive-or-debt-validation
  (multiple-value-bind (port context ready) (pool-claim-local :active nil)
    (declare (ignore ready))
    (let ((writer (pool-claim-writer '(:obligation)))
          (original (make-condition 'invariant-violation :reason :worker-state)))
      ;; FI quiescente: debiti e fault deliberatamente incompatibili con alcune fasi.
      ;; Il gate fuori IDLE deve conservarli, senza validazione, ACK o poisoning C1.
      (setf (arcdocdb.execution::contesto-worker-writer-writer context) writer
            (arcdocdb.execution::contesto-worker-writer-lease context) 7
            (arcdocdb.execution::contesto-worker-writer-pending context) 2
            (arcdocdb.execution::contesto-worker-writer-batch-generation context) 9
            (arcdocdb.execution::contesto-worker-writer-fault context) original)
      (dolist (phase '(:claimed :running :batch :finishing :reschedule :faulted))
        (setf (arcdocdb.execution::contesto-worker-writer-state context) phase)
        (pool-claim-refusal port 'resource-exhausted :worker-state (list writer))
        (is (eq original (arcdocdb.execution:errore-worker-writer context)))))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-004 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-idle-inconsistency-refuses-retirement-ack-and-c1-poisoning
  (multiple-value-bind (port context ready) (pool-claim-local)
    (declare (ignore ready))
    (let ((writer (pool-claim-writer '(:kept))))
      ;; FI: un singolo campo IDLE corrotto, anche con porta senza comando pendente.
      (dolist (pair '((1 1) (0 0) (2 1) (3 0)))
        (setf (arcdocdb.scheduler::porta-worker-pool-request port) (first pair)
              (arcdocdb.scheduler::porta-worker-pool-ack port) (second pair))
        (dolist (slot '(arcdocdb.execution::cursor arcdocdb.execution::home
                        arcdocdb.execution::writer arcdocdb.execution::lease
                        arcdocdb.execution::pending arcdocdb.execution::fault))
          (let ((saved (slot-value context slot))
                (bad (case slot
                       (arcdocdb.execution::writer writer)
                       (arcdocdb.execution::fault
                        (make-condition 'invariant-violation :reason :worker-state))
                       (otherwise 1))))
            (unwind-protect
                 (progn (setf (slot-value context slot) bad)
                        (pool-claim-refusal port 'invariant-violation :worker-state (list writer)))
              (setf (slot-value context slot) saved)))))
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2
            (arcdocdb.scheduler::porta-worker-pool-ack port) 1)
      (pool-claim-check port nil :inactive 0 :retired)
      (is (null (arcdocdb.execution:errore-worker-writer context))))))

;;; REQ: REQ-CON-001 REQ-CON-004 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-corrupt-word-protocol-preserves-ready-and-local-worker
  (multiple-value-bind (port context ready) (pool-claim-local)
    (let ((writer (pool-claim-writer '(:kept))))
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 writer)))
      (dolist (pair '((2 0) (4 0) (0 2) (1 0) (0 1)))
        ;; FI quiescente: malformazione del canale fuori dal handler C1.
        (setf (arcdocdb.scheduler::porta-worker-pool-request port) (first pair)
              (arcdocdb.scheduler::porta-worker-pool-ack port) (second pair))
        (pool-claim-refusal port 'invariant-violation :pool-port-state (list writer))
        (is (null (arcdocdb.execution:errore-worker-writer context))))
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 1
            (arcdocdb.scheduler::porta-worker-pool-ack port) 1)
      (pool-claim-check port writer :claimed 0 :unchanged)
      (arcdocdb.execution.tests::worker-complete-one context writer :kept))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-004 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-retirement-ack-cas-conflict-cannot-take-a-ready-writer
  (multiple-value-bind (port context ready) (pool-claim-local)
    (let* ((writer (pool-claim-writer '(:kept)))
           (saved (fdefinition 'arcdocdb.scheduler::%pool-ack-command)) (calls 0))
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 writer)))
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
      ;; FI quiescente: invochiamo il vero CAS con OLD errato, senza mutare ACK.
      (pool-claim-function-fi
       'arcdocdb.scheduler::%pool-ack-command
       (lambda (value old word) (incf calls) (funcall saved value (+ old 2) word))
       (lambda () (pool-claim-refusal port 'invariant-violation :pool-port-state (list writer))))
      (is (= 1 calls)) (is (null (arcdocdb.execution:errore-worker-writer context)))
      (pool-claim-check port nil :inactive 0 :retired)
      (arcdocdb.execution.tests::worker-check-claim context writer :claimed 0)
      (arcdocdb.execution.tests::worker-complete-one context writer :kept))))

;;; REQ: REQ-CON-001 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-active-empty-and-busy-preserve-c1-cursor-rotation
  (multiple-value-bind (port context ready) (pool-claim-local :shards 3 :start 1)
    (pool-claim-check port nil :empty 2 :unchanged)
    (let* ((writer (pool-claim-writer '(:busy-kept)))
           (partition (arcdocdb.execution.tests::ready-test-partition ready 2)))
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 writer)))
      (arcdocdb.execution.tests::ready-call-with-guards
       (list partition) (lambda () (pool-claim-check port nil :busy 0 :unchanged)))
      (pool-claim-check port writer :claimed 0 :unchanged)
      (arcdocdb.execution.tests::worker-complete-one context writer :busy-kept)
      (pool-claim-check port nil :empty 1 :unchanged))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-THR-001-pool-retire-after-active-sample-permits-one-last-complete-task
  (multiple-value-bind (port context ready) (pool-claim-local)
    (let* ((writer (pool-claim-writer '(:last)))
           (saved (fdefinition 'arcdocdb.scheduler:applica-stato-worker-pool)) (calls 0))
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 writer)))
      ;; FI quiescente al confine: pubblicazione dopo la lettura attiva, prima del pop.
      ;; Lo stesso ordinamento puo avvenire dal vero coordinator concorrente.
      (pool-claim-function-fi
       'arcdocdb.scheduler:applica-stato-worker-pool
       (lambda (value)
         (multiple-value-bind (active action) (funcall saved value)
           (incf calls) (is active) (is (eq :unchanged action))
           (setf (arcdocdb.scheduler::porta-worker-pool-request value) 2)
           (values active action)))
       (lambda () (pool-claim-check port writer :claimed 0 :unchanged)))
      (is (= 1 calls)) (is (equal '(2 1 nil) (lifecycle-words port)))
      (pool-claim-refusal port 'resource-exhausted :worker-state (list writer))
      (arcdocdb.execution.tests::worker-complete-one context writer :last)
      (pool-claim-check port nil :inactive 0 :retired)
      (is (equal '(2 2 nil) (lifecycle-words port))))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-pending-retire-waits-for-bridge-batch-and-explicit-handoff
  (let* ((workers (list (lifecycle-fixture-start t) (lifecycle-fixture-start t)))
         (controller (crea-controllore-pool 1 :initial 2 :dwell 500))
         (registry (arcdocdb.scheduler:crea-registro-pool controller (lifecycle-ports workers)))
         (worker (second workers)) (file nil) (writer nil) (link nil) (token nil) (batch nil))
    (unwind-protect
         (progn
           (lifecycle-call
            worker (lambda (owned)
                     (multiple-value-bind (serie resource) (pool-claim-series 71)
                       (setf file resource writer (pool-claim-writer '(:first :second)))
                       (let ((context (lifecycle-fixture-context owned)))
                         (is (= 1 (arcdocdb.execution:pubblica-writer-pronto
                                   (pool-claim-ready context) 0 writer)))
                         (pool-claim-check (lifecycle-fixture-port owned) writer :claimed 0 :unchanged)
                         (setf link (arcdocdb.execution.series:crea-collegamento-worker-serie
                                     context writer serie)
                               token (pool-claim-bridge-begin link)
                               batch (pool-claim-bridge-pop link token :first)))) :ok))
           (lifecycle-start-retirement controller registry)
           (lifecycle-call
            worker (lambda (owned)
                     (let ((port (lifecycle-fixture-port owned))
                           (context (lifecycle-fixture-context owned)))
                       (pool-claim-refusal port 'resource-exhausted :worker-state (list writer))
                       (is (null (arcdocdb.execution.series:conferma-worker-serie link token batch)))
                       (is (eq :schedule (arcdocdb.execution.series:termina-worker-serie link token)))
                       (pool-claim-refusal port 'resource-exhausted :worker-state (list writer))
                       (multiple-value-bind (obligation home) (arcdocdb.execution:cede-writer-worker context)
                         (is (eq writer obligation)) (is (= 0 home))
                         (is (= 1 (arcdocdb.execution:pubblica-writer-pronto
                                   (pool-claim-ready context) home obligation))))
                       (pool-claim-check port nil :inactive 0 :retired)
                       ;; Un altro claim C4 completa l'obbligo esplicitamente trasferito.
                       (arcdocdb.execution.tests::worker-check-claim context writer :claimed 0)
                       (arcdocdb.execution.tests::worker-complete-one context writer :second)) :ok))
           (is (equal '(1 1 nil) (lifecycle-registry-state registry))))
      (when file (lifecycle-call worker (lambda (owned) (declare (ignore owned))
                                         (arcdocdb.io:chiudi file) :ok)))
      (lifecycle-fixtures-stop workers))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-full-recycle-keeps-claimed-and-routes-new-writer-before-retire
  (multiple-value-bind (port context ready) (pool-claim-local)
    (multiple-value-bind (left left-file) (pool-claim-series 72)
      (multiple-value-bind (right right-file) (pool-claim-series 73)
        (unwind-protect
             (let* ((a (pool-claim-writer '(:a1 :a2) 0)) (b (pool-claim-writer '(:b) 1))
                    (registry (arcdocdb.execution.series:crea-registro-worker-serie
                               (vector a b) (vector left right)))
                    (table (arcdocdb.execution.series:crea-tabella-worker-serie context registry)))
               (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 a)))
               (pool-claim-check port a :claimed 0 :unchanged)
               (let* ((first-link (arcdocdb.execution.series:collega-writer-worker-serie table))
                      (token (pool-claim-bridge-begin first-link)))
                 (is (null (arcdocdb.execution.series:conferma-worker-serie
                            first-link token (pool-claim-bridge-pop first-link token :a1))))
                 (is (eq :schedule (arcdocdb.execution.series:termina-worker-serie first-link token)))
                 (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 b)))
                 ;; FI quiescente: comando arriva durante l'obbligo RESCHEDULE.
                 (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
                 (arcdocdb.execution.tests::worker-check-recycle context b :claimed 1)
                 (pool-claim-refusal port 'resource-exhausted :worker-state (list a b))
                 (let* ((next-link (arcdocdb.execution.series:collega-writer-worker-serie table))
                        (next-token (pool-claim-bridge-begin next-link)))
                   (is (not (eq first-link next-link)))
                   ;; B possiede soltanto la seconda Serie; la prima resta acquisibile.
                   (let ((lease (arcdocdb.series:acquisisci-controllore-serie left)))
                     (is (plusp lease)) (arcdocdb.series:rilascia-controllore-serie left lease))
                   (signals resource-exhausted (arcdocdb.series:acquisisci-controllore-serie right) :serie-busy)
                   (is (null (arcdocdb.execution.series:conferma-worker-serie
                              next-link next-token (pool-claim-bridge-pop next-link next-token :b))))
                   (is (eq :idle (arcdocdb.execution.series:termina-worker-serie next-link next-token))))
                 (pool-claim-check port nil :inactive 0 :retired)
                 (arcdocdb.execution.tests::worker-check-claim context a :claimed 0)
                 (arcdocdb.execution.tests::worker-complete-one context a :a2)))
          (arcdocdb.io:chiudi right-file) (arcdocdb.io:chiudi left-file))))))
")
  (:PATH
   #A((90) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tools/measure-pool-claim.lisp")
   :BYTES 13115 :SHA256 "c4d9c85aaf32a9eb3017007e2ac63119f5feeb2874c0ad4be66639035072eb4b"
   :GIT-BLOB "712a4a5393b69539f02cd625223918e404b331d3" :TEXT
   ";;;; C4: claim bounded dal gate pool; EMPTY, INACTIVE e SWITCH separati.
;;;; Cinque repliche di 4096 cicli, warmup128, quattro o sei chiamate/ciclo, GC fuori clock.
;;;; SWITCH usa richieste private seriali quiescenti; non qualifica il coordinatore concorrente.
;;;; Riusa sensore heap/clock/sink, checkpoint e fixture negative del lifecycle qualificato.
;;;; --self-test | --bench directory-nuova/. Feature: :arcdocdb-pool-claim-measure-library.
;;; REQ: REQ-CON-005 REQ-AFF-008 REQ-THR-001 REQ-BEN-001 REQ-BEN-002
;;; OWNER: contesto e sensore allo stesso thread C4; startup e risoluzione API fuori clock.
;;; SHARED: nessuno nel clock; REQUEST privato della fixture SWITCH senza worker concorrenti.
(eval-when (:compile-toplevel :load-toplevel :execute)
  (require :asdf)
  (unless (find-package \"ARCDOCDB.POOL-LIFECYCLE.MEASURE\")
    (let ((*features* (cons :arcdocdb-pool-lifecycle-measure-library *features*)))
      (load \"tools/measure-pool-lifecycle.lisp\"))))
(defpackage #:arcdocdb.pool-claim.measure
  (:use #:cl)
  (:import-from #:arcdocdb.pool-lifecycle.measure
                #:api #:lookup-function #:sample #:sample-record #:campaign-group
                #:acquire-directory #:write-report #:load-product
                #:+iterations+ #:+warmup+ #:+replicas+))
(in-package #:arcdocdb.pool-claim.measure)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

(defun fingerprints ()
  \"Stabilita: include la biblioteca, questo sensore e tutti i sorgenti/test prodotto.\"
  (append (arcdocdb.pool-lifecycle.measure::fingerprints)
          (list (list :file \"tools/measure-pool-claim.lisp\"
                      :md5 (format nil \"~(~{~2,'0X~}~)\"
                                   (coerce (sb-md5:md5sum-file \"tools/measure-pool-claim.lisp\") 'list))))))

(defun make-port (active cursor)
  \"Quattro shard vuoti autentici, contesto owner C1; fixture preallocata prima del clock.\"
  (let* ((ready (lookup-function \"CREA-LISTA-WRITER-PRONTI\" \"ARCDOCDB.EXECUTION\"))
         (context (lookup-function \"CREA-CONTESTO-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\"))
         (queue (funcall ready :shards 4 :capacity 1)))
    (funcall (api \"CREA-PORTA-WORKER-POOL\") (funcall context queue :start cursor) :active active)))

(defun verify-claim (claim port status cursor lifecycle)
  \"Oracolo scalare indipendente di tutti i quattro valori, senza cons nel percorso riuscito.\"
  (multiple-value-bind (writer outcome next action) (funcall claim port)
    (unless (and (null writer) (eq status outcome) (eql cursor next) (eq lifecycle action))
      (error \"COD-60: claim ~S/~S/~S/~S invece di NIL/~S/~S/~S.\"
             writer outcome next action status cursor lifecycle))))

(defun create-empty-cycle ()
  \"EMPTY attivo: quattro osservazioni locali e rotazione0->1->2->3->0; token12.\"
  (let ((port (make-port t 0)) (claim (api \"PRENDI-WRITER-POOL\")))
    (values (lambda ()
              (verify-claim claim port :empty 1 :unchanged)
              (verify-claim claim port :empty 2 :unchanged)
              (verify-claim claim port :empty 3 :unchanged)
              (verify-claim claim port :empty 0 :unchanged)
              12)
            12 (constantly nil))))

(defun create-inactive-cycle ()
  \"INACTIVE da cursor2: quattro rifiuti preservano lo stesso cursore; token20.\"
  (let ((port (make-port nil 2)) (claim (api \"PRENDI-WRITER-POOL\")))
    (values (lambda ()
              (dotimes (i 4) (verify-claim claim port :inactive 2 :unchanged))
              20)
            20 (constantly nil))))

(defun create-switch-cycle ()
  \"Sei claim: retired/inactive, inactive, activated/empty e altri tre EMPTY; token46.
Ruoli seriali C4; generazioni monotone, una richiesta solo dopo la conferma precedente.
Quattro EMPTY ruotano0->1->2->3->0; ritiro e INACTIVE lo conservano, nessun reset.\"
  (let ((port (make-port t 0)) (claim (api \"PRENDI-WRITER-POOL\"))
        (set-request (lookup-function \"PORTA-WORKER-POOL-REQUEST\" \"ARCDOCDB.SCHEDULER\" t))
        (ack (lookup-function \"PORTA-WORKER-POOL-ACK\" \"ARCDOCDB.SCHEDULER\"))
        (generation 0))
    (values
     (lambda ()
       (declare (type fixnum generation))
       (let ((retired (* 2 (incf generation))))
         (funcall set-request retired port)
         (verify-claim claim port :inactive 0 :retired)
         (verify-claim claim port :inactive 0 :unchanged)
         (unless (= retired (the fixnum (funcall ack port)))
           (error \"COD-60: ritiro non confermato nella generazione richiesta.\")))
       (let ((activated (1+ (* 2 (incf generation)))))
         (funcall set-request activated port)
         (verify-claim claim port :empty 1 :activated)
         (verify-claim claim port :empty 2 :unchanged)
         (verify-claim claim port :empty 3 :unchanged)
         (verify-claim claim port :empty 0 :unchanged)
         (unless (= activated (the fixnum (funcall ack port)))
           (error \"COD-60: attivazione non confermata nella generazione richiesta.\")))
       46)
     46 (constantly nil))))

(defun campaign (report checkpoint)
  \"Tre campagne predefinite: startup, API, GC e serializzazione dei report fuori clock.\"
  (campaign-group :empty #'create-empty-cycle report checkpoint)
  (campaign-group :inactive #'create-inactive-cycle report checkpoint)
  (campaign-group :switch #'create-switch-cycle report checkpoint)
  (setf (getf report :current-replica) nil)
  report)

(defun make-report ()
  \"Raw dei tre percorsi e confini C4, senza attribuire latenza o heap al coordinatore vivo.\"
  (list :schema-version 1 :kind :pool-claim-benchmark :status :running :stage :pending
        :diagnostic nil :process-argv sb-ext:*posix-argv* :tool-arguments (uiop:command-line-arguments)
        :source-fingerprints-before (fingerprints) :source-fingerprints-after nil
        :source-consistency :pending :recorded-at (get-universal-time) :self-test nil
        :samples nil :current-replica nil :sbcl (lisp-implementation-version)
        :machine (machine-type) :os (software-type) :os-version (software-version) :safety 3
        :iterations +iterations+ :warmup +warmup+ :replicas +replicas+
        :timer-units-per-second internal-time-units-per-second
        :campaigns '((:empty :shards 4 :initial-cursor 0 :claim-per-cycle 4 :token 12)
                    (:inactive :shards 4 :initial-cursor 2 :claim-per-cycle 4 :token 20)
                    (:switch :shards 4 :initial-cursor 0 :claim-per-cycle 6 :token 46
                     :roles-serialized t :private-request-fixture t :generation-increments-per-cycle 2))
        :token-formula \"sample=N*cycle-token+N*(N-1)/2; EMPTY=12; INACTIVE=20; SWITCH=46\"
        :limits '(:preallocated-product-and-inputs :startup-and-gc-excluded
                  :counter-not-absolute-nonallocation-proof :external-load-uncontrolled
                  :clock-zero-is-below-resolution :no-time-threshold-no-tuning-claim
                  :empty-is-local-observation :no-real-queued-claim-measured
                  :no-concurrent-coordinator-or-physical-worker-lifecycle-qualification)))

(defun run-driver (args &key (product-loader #'load-product) (tester #'self-test) (runner #'campaign))
  \"Driver claim compatto; riusa I/O esclusivo e sensore qualificati, preserva raw del fallimento.\"
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

(defun self-test-oracle ()
  \"Il sensore deve rifiutare separatamente writer, esito, cursore e azione errati.\"
  (dolist (row '((:unexpected :empty 1 :unchanged) (nil :inactive 1 :unchanged)
                 (nil :empty 2 :unchanged) (nil :empty 1 :activated)))
    (unless (handler-case
                (progn (verify-claim (lambda (port) (declare (ignore port)) (values-list row))
                                     nil :empty 1 :unchanged) nil)
              (error () t))
      (error \"COD-60: valore claim difforme non respinto: ~S.\" row)))
  :passed)

(defun self-test-reporter ()
  \"Il driver claim rifiuta CLI/destinazione e conserva replica conclusa più raw parziale.\"
  (let ((called nil) (root (arcdocdb.pool-lifecycle.measure::fresh-self-test-directory)))
    (unwind-protect
         (progn
           (dolist (args '(nil (\"--bench\") (\"--bad\") (\"--bench\" \"directory\" \"extra\")))
             (unless (and (eq :failed (getf (run-driver args :product-loader (lambda () (setf called t))) :status))
                          (null called))
               (error \"COD-60: CLI invalida eseguita.\")))
           (let* ((existing (acquire-directory (merge-pathnames \"existing/\" root)))
                  (failed (merge-pathnames \"failed/\" root)))
             (write-report '(:sentinel :unchanged) existing)
             (unless (and (eq :failed (getf (run-driver (list \"--bench\" (namestring existing))
                                                      :product-loader (constantly nil)
                                                      :tester (constantly :passed)) :status))
                          (equal (arcdocdb.pool-lifecycle.measure::read-self-test-report existing)
                                 '(:sentinel :unchanged)))
               (error \"COD-60: destinazione precedente non conservata.\"))
             (run-driver (list \"--bench\" (namestring failed))
                         :product-loader (constantly nil) :tester (constantly :passed)
                         :runner (lambda (report checkpoint)
                                   (setf (getf report :current-replica) 1 (getf report :samples)
                                         (list (list :status :ok :raw-ticks 3 :heap-bytes 0)
                                               (list :status :running :raw-ticks 7 :heap-bytes 11
                                                     :diagnostic nil)))
                                   (funcall checkpoint) (error \"fixture: replica interrotta\")))
             (let* ((saved (arcdocdb.pool-lifecycle.measure::read-self-test-report failed))
                    (samples (getf saved :samples)))
               (unless (and (eq :failed (getf saved :status)) (= 1 (getf saved :current-replica))
                            (= 2 (length samples)) (eq :ok (getf (first samples) :status))
                            (eq :failed (getf (second samples) :status))
                            (= 7 (getf (second samples) :raw-ticks))
                            (= 11 (getf (second samples) :heap-bytes)))
                 (error \"COD-60: replica o raw parziale persi.\")))))
      (uiop:delete-directory-tree root :validate t)))
  :passed)

(defun self-test ()
  \"Sensore comune positivo/negativo e tre nuove fixture con oracoli dei quattro valori.\"
  (list :status :ok :shared-sensor (arcdocdb.pool-lifecycle.measure::self-test)
        :four-value-oracle (self-test-oracle) :claim-cli-and-partial-raw (self-test-reporter)
        :empty (arcdocdb.pool-lifecycle.measure::self-test-composed #'create-empty-cycle)
        :inactive (arcdocdb.pool-lifecycle.measure::self-test-composed #'create-inactive-cycle)
        :switch (arcdocdb.pool-lifecycle.measure::self-test-composed #'create-switch-cycle)))

(defun main ()
  \"Rapporto leggibile e uscita nonzero, anche per fonte cambiata o heap osservato positivo.\"
  (let ((report (run-driver (uiop:command-line-arguments))))
    (let ((*print-readably* t)) (write report :pretty t) (terpri))
    (unless (eq :ok (getf report :status))
      (format *error-output* \"~&tools/measure-pool-claim.lisp: ~A~%\" (getf report :diagnostic))
      (uiop:quit 1))))
(unless (member :arcdocdb-pool-claim-measure-library *features*) (main))
")
  (:PATH
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/pool-worker-claim-revisione.md")
   :BYTES 11253 :SHA256 "b88b546a7d59af00264006a31cc6e49d71d44354a9192287338aeffbf8577c92"
   :GIT-BLOB "c2703de72d08d7d0c66a5a45ac587d7c763ca598" :TEXT
   "# Revisione indipendente della presa governata dal pool

Lettura statica del 2026-10-13 sulla base
`900fa93d9e14a252e6a2b5a009d19728b2de34af`, eseguita da un agente diverso
dall'autore del nuovo gate. Esito finale: **positivo per lo scope C3**, dopo
la precisazione documentale descritta sotto. Non sono stati modificati
codice di prodotto o test dal revisore. Questa lettura non è una revisione
umana e non attesta esiti di build, test, copertura o misure.

Sono stati letti il [contratto](pool-worker-claim.md), il
[metodo preregistrato](pool-worker-claim-metodo.md), il gate, l'export,
l'ordine ASDF e i dodici test nuovi. Il quadro applicato è
[ADR-0031](../adr/0031-software-critico-criteri-e-priorita.md),
[ADR-0034](../adr/0034-policy-di-compilazione-e-standard-di-codifica.md),
[ADR-0045](../adr/0045-modello-di-esecuzione.md) e lo
[standard di codifica](../affidabilita/standard-di-codifica.md).

## Identità della lettura finale

Le identità SHA-256 seguenti si riferiscono ai file letti, prima delle
campagne congelate. Gli eventuali risultati successivi devono dichiarare
se hanno usato queste stesse versioni.

| File | SHA-256 |
|---|---|
| `src/scheduler/pool-claim.lisp` | `e384f6091a5fcb506e718e12e77b06ab8dd4233a41024bc57ca3b14425e10b14` |
| `src/scheduler/package.lisp` | `a44fd2c3d435e1f6729bf861b6caeb54a184f31c92e7909aad9c18b491f03cdf` |
| `arcdocdb.asd` | `766acc26f77abbcf6c19b9d1e4ba02042a31f14f70fdf62b53d71e6ea3965937` |
| `tests/scheduler/pool-claim.lisp` | `f968d57b6ff4dfc3cc31f1b1979afa896d95435093406b36320800783629901f` |
| `tests/scheduler/support.lisp` | `300234f9ac7931f8c8b9bf305498a2742a3b8868dd9158dbab8c7fdceed5a1e4` |
| `docs/implementazione/pool-worker-claim.md` | `20240f3011569792d86d0369e374b3e6c43dcac48192ea34c0fd37b54f211ef7` |
| `docs/implementazione/pool-worker-claim-metodo.md` | `aedfadbf875ef9b58ba54bc4b5269aba438983e53137c5c3eef645e1265f1e19` |

Il coupling C1 e il protocollo lifecycle sono stati verificati su queste
fonti preesistenti, senza modifiche nei relativi file:

| Fonte | SHA-256 |
|---|---|
| `src/execution/worker-types.lisp` | `62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317` |
| `src/execution/worker-boundary.lisp` | `4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a` |
| `src/execution/worker-claim.lisp` | `62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e` |
| `src/execution/ready-types.lisp` | `0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f` |
| `src/scheduler/lifecycle-worker.lisp` | `ec8b462ff3f5f7a6435f0f0c01b62034d8de2a784a9e354d469a0adfec9cf837` |
| `src/scheduler/lifecycle-read.lisp` | `c60e1d5f67eeafb216b374fa001d27f87d1a734c5d066fc092902c0301069200` |

## Rilievo corretto

La prima formulazione diceva che un worker inattivo non consultava ready
e che il ritiro precedeva ogni suo accesso. La funzione esegue invece
sempre `%richiedi-worker :idle` prima del lifecycle. Il verificatore C1
legge la dimensione del vettore delle partizioni, gli indici cursor/home
e il tipo delle due partizioni riferite dal contesto. Non legge head,
tail, count o slots del ring; non acquisisce una guardia e non cerca lavoro.

Il contratto e il metodo finali distinguono questa verifica della forma
immutabile da polling, scansione e mutazione dei ring. La docstring ora
promette la conservazione di ready/cursore. La rilettura conferma la
correzione; il corpo eseguibile del gate è rimasto invariato.

La versione precedente del gate aveva SHA-256
`37d8e2f60d7da8f5de1f5df6774bb2ac32e430771d370adc3689c25dd3222ddb`.
Le prime versioni di contratto e metodo avevano rispettivamente
`ee7cbc96be1e4a9895025ea4d9580dab034315c82786f27d8fe1015e4dbbec4e`
e `af28052c22ebe07e4d26d93d8ff618d960ea5221a80190436a51e606c08ac1df`.
Queste identità distinguono le formulazioni precedenti dalla lettura finale.

## Confine C3 e protocollo

Il gate controlla quando delegare una nuova presa. La porta contiene il
contesto immutabile, quindi il caller non può fornire separatamente un
contesto diverso. L'owner della porta precede ogni accesso al contesto;
il getter della fase verifica anche l'owner execution. Ogni fase non-IDLE,
compresa FAULTED, è rifiutata senza leggere una lease live, applicare un
comando o sostituire la prima causa del fault.

Sul contesto IDLE la barriera C1 completa precede il lifecycle anche quando
la porta è inattiva o request=ack. Il valore `:unchanged` non viene quindi
usato come prova di IDLE o salute. Dopo il gate, solo il ramo attivo chiama
`execution:prendi-writer-worker`, che conserva verificatori, trasferimento
dell'obbligo e confine di fault propri. Il nuovo file non scrive campi di
integrità C1 e non racchiude gli errori del pool in `%passo-worker`.

Le dipendenze private sono `%richiedi-worker` e la lettura del cursore
validato. Richiedono attenzione nelle future modifiche a execution: il
gate deve conservare l'ordine owner/fase/forma e la lettura senza mutazione.

Un ritiro pubblicato dopo la lettura active può lasciare partire un singolo
claim. Il comando resta pendente fino al ritorno a IDLE. Gli obblighi
CLAIMED, batch, FINISHING e RESCHEDULE continuano a usare le API esistenti;
un ring pieno può assegnare un nuovo writer e impedire ancora il ritiro.
Il contratto non promette convergenza sotto saturazione perpetua.

Il quarto valore conserva il dominio del lifecycle di base. Sul percorso
normale, esclusivo e IDLE, sono attesi `:unchanged`, `:activated` e `:retired`;
la dichiarazione ammette anche `:busy` e `:faulted` come l'API delegata.
Non viene attribuita a questi due valori una raggiungibilità nuova.

## Lista di controllo

I dodici punti della lista C1 sono usati come controllo aggiuntivo. Non
cambiano la classe C3 né costituiscono le due revisioni richieste a C1.

| Punto | Valutazione statica e limite |
|---|---|
| 1. Requisiti e ADR | REQ-THR-001, REQ-CON-001/002/004/005 e REQ-AFF-008 coerenti con governo delle nuove prese, proprietà e limiti. REQ-THR-001 resta aperto per il motore completo. |
| 2. Invarianti | Owner prima dei campi, contesto associato alla porta, non-IDLE prima dell'ACK, IDLE C1 completo anche per porta inattiva, claim solo nel ramo active. Preservazione degli obblighi coperta nelle fixture lette. |
| 3. Errori | Ragioni typed per owner e fase; invarianti delegate senza occultamento. I rifiuti del gate non fanno poisoning C1. Gli errori del claim mantengono il confine execution. Nessun rollback dell'ACK dopo un claim fallito. |
| 4. Limiti | Nessun ciclo, ricorsione, attesa, syscall o retry nel gate. O(1) oltre ai verificatori C1; il solo ramo attivo delega la scansione bounded su al più 64 partizioni. |
| 5. Allocazione | Nessuna lista, closure o struttura creata esplicitamente nel gate; valori multipli. L'assenza di heap resta da misurare e non viene attestata dalla lettura. |
| 6. Risultati | Writer, esito e cursore del claim sono inoltrati senza reinterpretazione; inattivo restituisce NIL e cursore già validato. Quarto valore del lifecycle conservato; nessun valore d'errore ignorato. |
| 7. Decisioni | Due `unless` semplici e un `if`; nessun nuovo predicato composto. Complessità ciclomatica 4. MC/DC non richiesto a C3; copertura di espressioni e rami resta separata. |
| 8. Proprietà | Porta e contesto del worker non rientrante, ACK delegato al suo owner; request del coordinatore. Nessun nuovo stato globale o protocollo di sincronizzazione. |
| 9. Tracciabilità | REQ sulla funzione e nei nomi dei dodici test. ASDF carica il gate dopo execution/lifecycle e registra i test. Build, lint, trace e controllo completo non eseguiti dal revisore. |
| 10. Standard | Safety 3, ftype completo, docstring e commenti OWNER/SHARED; funzione di 18 righe. Nessun handler, cleanup, dichiarazione che rimuove controlli o deviazione individuata. |
| 11. Parallelismo | Nessuna scrittura globale per messaggio. ACK per ondata e ready partizionata, toccata dalla sola presa C1 attiva. La revisione non misura scalabilità, equità o progressione sotto carico. |
| 12. Durabilità | Nessun effetto su payload, CSN, file o controller Serie; nessun cambiamento durevole o eliminazione. Atomicità su disco non applicabile a questo gate. |

## Lettura delle prove nuove

Il file test contiene dodici prove nominate. Sono state lette come codice,
senza eseguirle e senza attribuire alla revisione il PASS riportato da altri.
Il caller usa writer e liste pronte reali; i claim riusciti sono verificati
con identità del writer e completamento attraverso le API execution.

| Gruppo di prove | Evidenza prevista dal codice e limite |
|---|---|
| Inattivo con lavoro pronto | Immagini di porta, contesto, ring e writer conservate; sentinella FI in `%prova-pronta` distingue nessuna scansione da scansione senza pop. |
| Crescita e ritiro reali | Controller e registro reali con owner distinti; crescita porta al claim di un writer già accodato, ritiro lascia il writer nel ring. |
| Owner e fasi | Owner estraneo prima di fase/parole corrotte; tutte le sei fasi non-IDLE conservano riferimenti, debito e prima causa, anche deliberatamente incoerenti. |
| IDLE e protocollo corrotti | FI quiescenti su cursor/home/writer/lease/pending/fault, quattro configurazioni active/request/ack e parole invalide. Immagini preservate prima dell'ACK/pop; nessun fault C1 aggiunto dal pool. |
| CAS della conferma | La fixture invoca il vero helper CAS con OLD errato; conta l'invocazione e verifica rifiuto senza pop, poi applica il comando originale. |
| EMPTY e BUSY | Esiti e rotazione del cursore verificati su shard reali; guardia occupata impedisce il claim e conserva il lavoro. |
| Comando tardivo | FI al confine dopo il vero campione active, prima del pop; un compito viene completato e il ritiro confermato alla presa successiva. L'interleaving è iniettato, non una gara casuale osservata. |
| Bridge e ring pieno | Pop sotto le due lease, conferma, chiusura e trasferimento esplicito dell'obbligo; ricircolo pieno restituisce un nuovo writer e il routing seleziona la sua Serie. |

Le FI che sostituiscono temporaneamente funzioni ripristinano le definizioni
con `unwind-protect` e dichiarano quiescenza. I bypass diretti di execution
nelle prove sono esplicitamente setup, drenaggio o cleanup C4; non sono
presentati come claim autorizzati da una porta inattiva. I payload sentinella
sono controllati nel buffer; ciò non qualifica effetti durevoli di operazioni
applicative. Il backend Serie in memoria non qualifica I/O nativo.

## Limiti dell'esito

La lettura non esegue build, lint, trace, test, self-test degli strumenti,
campagne di copertura o benchmark. Il gate C3 di almeno 95% su espressioni
e rami, la misura di heap e il controllo completo restano da attestare su
fonti congelate e output originali. La dichiarazione che l'ACK resta valido
se il claim successivo fallisce è verificata staticamente nell'ordine del
codice; nelle dodici prove lette non c'è una FI dedicata a quel preciso caso.

Non sono attestati wake/park, avvio graduale, worker morti, sensori,
coordinamento Archivio, admission dei messaggi, shutdown fisico o dispatcher
completo. QA-12/19 e il requisito di thread del motore restano aperti.
Nessun risultato di una revisione umana o qualifica formale è implicato.
")
  (:PATH
   #A((112) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/pool-worker-claim-risultati.md")
   :BYTES 7339 :SHA256 "72fdb5a43d1988bffec7e01c017b590bfade22895eae0b34e1b563a7e9b3c55c" :GIT-BLOB
   "e5eb23717504179efa5fb11e31c61c1801823dcc" :TEXT "# Verifica della presa governata dal pool

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
")))
