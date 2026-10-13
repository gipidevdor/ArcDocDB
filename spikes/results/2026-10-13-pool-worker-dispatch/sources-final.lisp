(:SCHEMA-VERSION 1 :KIND :POOL-WORKER-LIFECYCLE-FINAL-SOURCES :VERSION
 "14fd7738c216e3a0bd3ce9612576b9b57d648f74" :PART 1 :PARTS 1 :SOURCES
 ((:PATH
   #A((73) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/CHANGELOG.md")
   :BYTES 18152 :SHA256 "66192d6abf0ea9afaa713da18dca723491e6cb6de02e1eda3b5aa44c0abc19c7"
   :GIT-BLOB "120f4cd2fa131dc86a5564c2878ab02cfc36f10f" :TEXT "# Changelog

Formato basato su [Keep a Changelog](https://keepachangelog.com/it-IT/1.1.0/). Il progetto
non ha ancora rilasci; le versioni seguiranno la [roadmap](docs/roadmap.md).

## [Non rilasciato]

### Aggiunto

- Dispatcher logico dal pool al collegamento della Serie: binding preallocato
  sul medesimo contesto, routing solo dopo una presa autorizzata e ingresso
  distinto per completare gli obblighi già CLAIMED. Nessun begin, pop o retry
  implicito; ritiro e diagnosi conservano i confini C1 esistenti.

- Suite funzionale dedicata al GET ACTIVE ordinario: 28 test con file reali,
  formati v1/v2, oracoli wire indipendenti, confini di payload e directory,
  cache, guasti e cleanup snapshot/EBR. Copertura isolata e compatibilità
  CLOSED conservate con prove grezze e audit indipendenti; qualifica C1 e
  MC/DC restano aperti.

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
   :BYTES 15204 :SHA256 "239435606cefaa2a2fdddaae1e9a36c046b254cee2a07ea2f63376b1fd766438"
   :GIT-BLOB "18d28dbfbefb9d05f9b220e3f4a10180a2de40cd" :TEXT
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
               (:module \"dispatch\" :serial t
                :components ((:file \"package\") (:file \"types\") (:file \"build\") (:file \"claim\")))
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
                             (:file \"active-scan\") (:file \"active-build\") (:file \"active-init\")
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
               (:module \"get-active\" :serial t
                :components ((:file \"support\") (:file \"construction\") (:file \"directory\") (:file \"read\")))
               (:module \"execution\" :serial t
                :components ((:file \"support\") (:file \"queue\") (:file \"threads\")
                             (:file \"handoff\") (:file \"ready\") (:file \"ready-recycle\") (:file \"worker\")))
               (:module \"scheduler\" :serial t
                :components ((:file \"support\") (:file \"controller\") (:file \"lifecycle\")
                             (:file \"pool-claim\") (:file \"dispatch\")))
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
             (uiop:symbol-call '#:arcdocdb.get.active.tests '#:run)
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
   :BYTES 9267 :SHA256 "84295e15669203a6568b9e07461a15ef718decb8e968c8d3fd95f2eb6afcd25d" :GIT-BLOB
   "a5495eb8d43c402c36eeaaaa4e3ec5f93de30577" :TEXT "# Implementazione

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
| Collegamento pool/Serie | [Binding immutabile, nuova presa e obblighi già assunti](pool-dispatch.md) | [`src/dispatch/`](../../src/dispatch/) |
| Confine I/O | [Append, pread e flush durevole](io.md) | [`src/io/`](../../src/io/) |
| Associazione dei file | [Device/inode e capacità readonly/append del medesimo ACTIVE](associazione-file.md) | [`src/io/identity.lisp`](../../src/io/identity.lisp) |
| Nuovo segmento writer | [Header durevole, rilettura, directory e sorgente certificata](inizializzazione-active.md) | [`src/active/`](../../src/active/) |
| ACTIVE vuoto | [Radice iniziale, CLOSED recuperati e primo lotto](get-active-vuoto.md) | [active-init.lisp](../../src/get-resolver/active-init.lisp) |
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
| Resolver GET ACTIVE ordinario | [Lotti verificati, root della Serie e directory persistente](get-active.md); [metodo](get-active-metodo.md) e [risultati delle prove funzionali](get-active-verifica.md) | [`src/get-resolver/active-build.lisp`](../../src/get-resolver/active-build.lisp) |
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
   #A((102) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/pool-worker-claim.md")
   :BYTES 5260 :SHA256 "ededc2d612a211930efeafca8bbafcfe85c44f95dfd2962aa9041878f806f075" :GIT-BLOB
   "02681055d4c93e109c70e72cf094fd87a2a8b9e5" :TEXT "# Presa dei lavori governata dal pool

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
Il [dispatcher pool/Serie](pool-dispatch.md) lega questa porta alla tabella
del medesimo contesto e restituisce il collegamento del writer appena preso.

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
   #A((86) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/dispatch/package.lisp")
   :BYTES 486 :SHA256 "acb5fd19599e89e821a89bcca8f94064f33cdc71cdfcf204aadcd4fb52dd795f" :GIT-BLOB
   "1f7a7cab1ff9d31b7532c45a4be203e27122b8d9" :TEXT
   ";;;; Dispatcher logico, caricato dopo il routing e il governo del pool.
;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(defpackage #:arcdocdb.scheduler.dispatch
  (:use #:cl)
  (:import-from #:arcdocdb.binary #:index)
  (:import-from #:arcdocdb.conditions #:invalid-argument #:resource-exhausted
                #:invariant-violation)
  (:export #:dispatcher-writer-pool #:crea-dispatcher-writer-pool
           #:prendi-collegamento-pool #:collega-obbligo-pool))
")
  (:PATH
   #A((84) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/dispatch/types.lisp")
   :BYTES 1872 :SHA256 "cc44882c565a89de08f5add79333868ebfca4fc3f97bf9104d36375d014d4720" :GIT-BLOB
   "09b357c8f46c67d8e57994e1fa37affdd25a1695" :TEXT
   ";;;; Binding immutabile tra porta del pool e routing locale dello stesso worker.
;;; OWNER: dispatcher e tabella del thread creatore; nessuna migrazione o reentrancy.
;;; SHARED: nessuna nuova struttura condivisa o scrittura globale per operazione.
(in-package #:arcdocdb.scheduler.dispatch)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(defstruct (dispatcher-writer-pool
             (:constructor %make-dispatcher-writer-pool (port table)) (:copier nil))
  \"Pre: porta e tabella sul medesimo contesto IDLE, owner corrente verificato.
Post: binding preallocato immutabile; nessun claim, lease o comando applicato.\"
  (port nil :type arcdocdb.scheduler:porta-worker-pool :read-only t)
  (table nil :type arcdocdb.execution.series:tabella-worker-serie :read-only t))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (t t) null) %check-dispatcher-binding))
(defun %check-dispatcher-binding (port table)
  \"Pre: factory o dispatcher privato. Post: owner e identità del contesto validi.
INVALID-ARGUMENT configuration/owner/binding prima di ACK, claim o routing.
Nessuna lettura di fase, parole pool, ready, lease o controller vivo.\"
  (unless (typep port 'arcdocdb.scheduler:porta-worker-pool)
    (error 'invalid-argument :reason :pool-dispatcher-configuration))
  (unless (eq (arcdocdb.scheduler::porta-worker-pool-owner port) sb-thread:*current-thread*)
    (error 'invalid-argument :reason :pool-worker-owner))
  (unless (typep table 'arcdocdb.execution.series:tabella-worker-serie)
    (error 'invalid-argument :reason :pool-dispatcher-configuration))
  (unless (eq (arcdocdb.scheduler::porta-worker-pool-context port)
              (arcdocdb.execution.series::tabella-worker-serie-context table))
    (error 'invalid-argument :reason :pool-dispatcher-binding))
  nil)
")
  (:PATH
   #A((84) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/dispatch/build.lisp")
   :BYTES 1176 :SHA256 "c78d31a753db78baea520e9ea0cccf6e88cad9cca8bc75261a6ff26c2ac01fe5" :GIT-BLOB
   "d1f2397592a8ba9c3af21394f191017e9fd2219c" :TEXT
   ";;;; Costruzione separata dal percorso caldo, prima di qualsiasi obbligo.
;;; OWNER: factory sul thread che possiede porta e contesto, senza reentrancy.
;;; SHARED: solo riferimenti immutabili, nessuna pubblicazione o lettura di comandi.
(in-package #:arcdocdb.scheduler.dispatch)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (t t) dispatcher-writer-pool) crea-dispatcher-writer-pool))
(defun crea-dispatcher-writer-pool (port table)
  \"Pre: porta e tabella preallocate, stesso contesto libero, owner corrente.
Post: dispatcher immutabile senza acquisire lavoro o applicare comandi.
INVALID-ARGUMENT tipo/owner/binding; RESOURCE-EXHAUSTED fase non-IDLE;
barriera C1 read-only sull'IDLE completo, nessun nuovo fault marking C3.\"
  (%check-dispatcher-binding port table)
  (let ((context (arcdocdb.scheduler::porta-worker-pool-context port)))
    (unless (eq (arcdocdb.execution:stato-worker-writer context) :idle)
      (error 'resource-exhausted :reason :worker-state))
    (arcdocdb.execution::%richiedi-worker context :idle))
  (%make-dispatcher-writer-pool port table))
")
  (:PATH
   #A((84) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/dispatch/claim.lisp")
   :BYTES 2713 :SHA256 "224e4114b8b91affced874bea9c23cae5c79526e8ddae62e31a0cafcbb763682" :GIT-BLOB
   "f7717c94b765165eae4144042308e3639644ed5e" :TEXT
   ";;;; Nuova presa governata; gli obblighi esistenti hanno un ingresso indipendente.
;;; OWNER: dispatcher, contesto e collegamenti locali al medesimo worker.
;;; SHARED: solo API pool/ready/routing esistenti per tratto (ADR-0045 §8).
(in-package #:arcdocdb.scheduler.dispatch)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (dispatcher-writer-pool)
                         (values (or null arcdocdb.execution.series:collegamento-worker-serie)
                                 (member :claimed :empty :busy :inactive) index
                                 (member :unchanged :activated :retired :busy :faulted) &optional))
                prendi-collegamento-pool))
(defun prendi-collegamento-pool (dispatcher)
  \"Pre: owner corrente, worker IDLE libero. Post: link preallocato solo dopo CLAIMED,
oppure NIL/esito/cursore/azione originali del gate. Nessun begin, lease o pop.
Binding rifiutato prima del gate; errori delegati mantengono confini e obblighi.
Un fault di routing conserva il claim e l'ACK già riuscito, senza rollback.\"
  (let ((port (dispatcher-writer-pool-port dispatcher))
        (table (dispatcher-writer-pool-table dispatcher)))
    (%check-dispatcher-binding port table)
    (multiple-value-bind (writer status cursor action)
        (arcdocdb.scheduler:prendi-writer-pool port)
      (case status
        (:claimed
         (unless writer (error 'invariant-violation :reason :pool-dispatcher-state))
         (values (arcdocdb.execution.series:collega-writer-worker-serie table)
                 status cursor action))
        ((:empty :busy :inactive)
         (when writer (error 'invariant-violation :reason :pool-dispatcher-state))
         (values nil status cursor action))
        (otherwise (error 'invariant-violation :reason :pool-dispatcher-state))))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (dispatcher-writer-pool) arcdocdb.execution.series:collegamento-worker-serie)
                collega-obbligo-pool))
(defun collega-obbligo-pool (dispatcher)
  \"Pre: owner corrente, CLAIMED già assunto da busy begin, ricircolo o adozione.
Post: link corrente preallocato, selezione ripetibile senza nuove capacità.
Non legge comandi/active e non conferma ritiro: il caller completa l'obbligo.
Binding/owner e routing delegati; fase/fault preservati dai confini C1 esistenti.\"
  (let ((port (dispatcher-writer-pool-port dispatcher))
        (table (dispatcher-writer-pool-table dispatcher)))
    (%check-dispatcher-binding port table)
    (arcdocdb.execution.series:collega-writer-worker-serie table)))
")
  (:PATH
   #A((90) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/dispatch.lisp")
   :BYTES 31966 :SHA256 "600eb0b5fdf9a52d020e2f4c638f0f3dba43d9d9711be73eaffff208578821eb"
   :GIT-BLOB "6a493f0022ac8c9b6117c2a62df49fa596194c7b" :TEXT
   ";;;; Dispatch pool -> routing preallocato; begin, batch e handoff restano espliciti.
;;;; OWNER: porta, contesto, tabella e link sul thread creatore della fixture.
;;;; SHARED: solo ready/registro immutabile e parole pool nei passaggi reali.
;;;; FI quiescenti: immagini bounded, sentinelle ripristinate e binding corrotti dichiarati.
(in-package #:arcdocdb.scheduler.tests)

(defmacro with-pool-dispatch ((dispatcher port context ready table writers controllers
                              &key (active t) (shards 1) (capacity 1) (start 0)
                                (left-items ''(:a1 :a2)) (right-items ''(:b1)))
                             &body body)
  \"Fixture C4 locale, con due routing ordinal distinti e risorse sempre chiuse.\"
  (let ((left (gensym \"LEFT\")) (right (gensym \"RIGHT\"))
        (left-file (gensym \"LEFT-FILE\")) (right-file (gensym \"RIGHT-FILE\")))
    `(multiple-value-bind (,port ,context ,ready)
         (pool-claim-local :active ,active :shards ,shards :capacity ,capacity :start ,start)
       (multiple-value-bind (,left ,left-file) (pool-claim-series 81)
         (multiple-value-bind (,right ,right-file) (pool-claim-series 82)
           (unwind-protect
                (let* ((,port ,port) (,context ,context) (,ready ,ready)
                       (,writers (vector (pool-claim-writer ,left-items 0)
                                        (pool-claim-writer ,right-items 1)))
                       (,controllers (vector ,left ,right))
                       (,table (arcdocdb.execution.series:crea-tabella-worker-serie
                                ,context (arcdocdb.execution.series:crea-registro-worker-serie
                                          ,writers ,controllers)))
                       (,dispatcher (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool
                                     ,port ,table)))
                  ,@body)
             (arcdocdb.io:chiudi ,right-file) (arcdocdb.io:chiudi ,left-file)))))))

(defun pool-dispatch-series-image (controller)
  \"FI: tutti i campi mutabili del controller e dei due slot preallocati della fixture.\"
  (list
   (mapcar (lambda (slot) (slot-value controller slot))
           '(arcdocdb.series::root arcdocdb.series::planned-root arcdocdb.series::next-offset
             arcdocdb.series::owner arcdocdb.series::lease-generation
             arcdocdb.series::event-generation arcdocdb.series::last-high
             arcdocdb.series::last-low arcdocdb.series::head arcdocdb.series::tail
             arcdocdb.series::publish-head arcdocdb.series::count arcdocdb.series::unresolved
             arcdocdb.series::active-io arcdocdb.series::state arcdocdb.series::effect-active))
   (map 'list
        (lambda (commit)
          (mapcar (lambda (slot) (slot-value commit slot))
                  '(arcdocdb.series::generation arcdocdb.series::lotto arcdocdb.series::slot
                    arcdocdb.series::high arcdocdb.series::low arcdocdb.series::expected-root
                    arcdocdb.series::root arcdocdb.series::level arcdocdb.series::phase
                    arcdocdb.series::io-state)))
        (arcdocdb.series::controllore-serie-slots controller))))

(defun pool-dispatch-link-image (link)
  (if (typep link 'arcdocdb.execution.series:collegamento-worker-serie)
      (mapcar (lambda (slot) (slot-value link slot))
              '(arcdocdb.execution.series::context arcdocdb.execution.series::writer
                arcdocdb.execution.series::controller arcdocdb.execution.series::generation
                arcdocdb.execution.series::writer-lease arcdocdb.execution.series::series-lease
                arcdocdb.execution.series::state arcdocdb.execution.series::fault))
      link))

(defun pool-dispatch-image (port table writers)
  \"Preimage bounded: entrambe le associazioni, ready, debiti, link e controller.\"
  (list (pool-claim-image port (coerce writers 'list))
        (lifecycle-context-state (arcdocdb.execution.series::tabella-worker-serie-context table))
        (map 'list #'pool-dispatch-link-image
             (arcdocdb.execution.series::tabella-worker-serie-links table))
        (map 'list #'pool-dispatch-series-image
             (arcdocdb.execution.series::registro-worker-serie-controllers
              (arcdocdb.execution.series::tabella-worker-serie-registry table)))))

(defun pool-dispatch-refusal (port table writers thunk type reason)
  (let ((before (pool-dispatch-image port table writers)))
    (arcdocdb.execution.tests::worker-capture-condition thunk type reason)
    (is (equalp before (pool-dispatch-image port table writers)))))

(defun pool-dispatch-check (dispatcher link status cursor action)
  (is (equal (list link status cursor action)
             (multiple-value-list
              (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher)))))

(defun pool-dispatch-finish (link item action)
  \"Tratto reale: begin esplicito, un batch pubblicato/ACK e terminazione esplicita.\"
  (let ((token (pool-claim-bridge-begin link)))
    (is (null (arcdocdb.execution.series:conferma-worker-serie
               link token (pool-claim-bridge-pop link token item))))
    (is (eq action (arcdocdb.execution.series:termina-worker-serie link token)))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-dispatch-factory-type-and-context-binding-refuse-without-effects
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable dispatcher))
    (dolist (invalid (list nil :invalid #() '(port)))
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool invalid table))
       'invalid-argument :pool-dispatcher-configuration)
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool port invalid))
       'invalid-argument :pool-dispatcher-configuration))
    (let* ((other (arcdocdb.execution:crea-contesto-worker-writer ready))
           (registry (arcdocdb.execution.series:crea-registro-worker-serie writers controllers))
           (other-table (arcdocdb.execution.series:crea-tabella-worker-serie other registry))
           (before (lifecycle-context-state other)))
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool port other-table))
       'invalid-argument :pool-dispatcher-binding)
      (is (equal before (lifecycle-context-state other))))
    (is (eq :idle (arcdocdb.execution:stato-worker-writer context)))))

;;; REQ: REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-dispatch-factory-requires-complete-idle-before-construction
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable dispatcher ready controllers))
    (is (null (arcdocdb.execution:adotta-writer-worker context (svref writers 0) 0)))
    (pool-dispatch-refusal
     port table writers
     (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool port table))
     'resource-exhausted :worker-state)
    (multiple-value-bind (writer home) (arcdocdb.execution:cede-writer-worker context)
      (is (eq writer (svref writers 0))) (is (= 0 home)))
    ;; FI IDLE incoerente: getter di fase valido, debito non vuoto da rifiutare.
    (setf (arcdocdb.execution::contesto-worker-writer-pending context) 1)
    (pool-dispatch-refusal
     port table writers
     (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool port table))
     'invariant-violation :worker-state)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-dispatch-foreign-owner-precedes-table-phase-and-pool-checks
  (let ((worker (lifecycle-fixture-start t)) (dispatcher nil) (table nil) (writers nil)
        (left-file nil) (right-file nil))
    (unwind-protect
         (progn
           (lifecycle-call
            worker
            (lambda (owned)
              (multiple-value-bind (left resource) (pool-claim-series 83)
                (setf left-file resource)
                (multiple-value-bind (right resource) (pool-claim-series 84)
                  (setf right-file resource writers (vector (pool-claim-writer '(:kept) 0)
                                                           (pool-claim-writer '(:other) 1)))
                  (setf table (arcdocdb.execution.series:crea-tabella-worker-serie
                               (lifecycle-fixture-context owned)
                               (arcdocdb.execution.series:crea-registro-worker-serie
                                writers (vector left right)))
                        dispatcher (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool
                                    (lifecycle-fixture-port owned) table)))) :ok))
           (let ((port (lifecycle-fixture-port worker))
                 (context (lifecycle-fixture-context worker)))
             ;; FI quiescente: l'owner deve precedere tipo table e ogni dato corrotto.
             (setf (arcdocdb.scheduler::porta-worker-pool-request port) 4
                   (arcdocdb.execution::contesto-worker-writer-state context) :faulted)
             (pool-dispatch-refusal
              port table writers
              (lambda () (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool port :invalid))
              'invalid-argument :pool-worker-owner)
             (dolist (api '(arcdocdb.scheduler.dispatch:prendi-collegamento-pool
                            arcdocdb.scheduler.dispatch:collega-obbligo-pool))
               (pool-dispatch-refusal port table writers (lambda () (funcall api dispatcher))
                                      'invalid-argument :pool-worker-owner))))
      (when left-file
        (lifecycle-call worker (lambda (owned) (declare (ignore owned))
                                 (when right-file (arcdocdb.io:chiudi right-file))
                                 (arcdocdb.io:chiudi left-file) :ok)))
      (lifecycle-fixtures-stop (list worker)))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-dispatch-inactive-empty-busy-never-enter-routing
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :active nil :shards 3 :start 1 :left-items '(:a1))
    (declare (ignorable controllers))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 (svref writers 0))))
    (let ((before (pool-dispatch-image port table writers)))
      (pool-claim-function-fi
       'arcdocdb.execution.series:collega-writer-worker-serie
       (lambda (value) (declare (ignore value)) (error \"Routing di worker inattivo.\"))
       (lambda () (pool-dispatch-check dispatcher nil :inactive 1 :unchanged)))
      (is (equalp before (pool-dispatch-image port table writers))))
    ;; Cleanup esplicito dell'obbligo: il gate inattivo lo ha lasciato nel ring.
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (arcdocdb.execution.tests::worker-complete-one context (svref writers 0) :a1))
  (with-pool-dispatch (dispatcher port context ready table writers controllers :shards 3 :start 1)
    (declare (ignorable table controllers))
    (pool-claim-function-fi
     'arcdocdb.execution.series:collega-writer-worker-serie
     (lambda (value) (declare (ignore value)) (error \"Routing senza writer acquisito.\"))
     (lambda ()
       (pool-dispatch-check dispatcher nil :empty 2 :unchanged)
       (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 (svref writers 1))))
       (arcdocdb.execution.tests::ready-call-with-guards
        (list (arcdocdb.execution.tests::ready-test-partition ready 2))
        (lambda () (pool-dispatch-check dispatcher nil :busy 0 :unchanged)))))
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 1) :claimed 0)
    (arcdocdb.execution.tests::worker-complete-one context (svref writers 1) :b1)
    (is (equal '(1 1 nil) (lifecycle-words port)))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-dispatch-routes-two-real-writers-without-implicit-begin
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :capacity 2 :left-items '(:a1))
    (declare (ignorable port))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 1))))
    (is (= 2 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    (let ((links (arcdocdb.execution.series::tabella-worker-serie-links table)))
      (loop for ordinal in '(1 0) for item in '(:b1 :a1)
            do (let ((link (svref links ordinal))
                     (series-before (map 'list #'pool-dispatch-series-image controllers)))
                 (pool-dispatch-check dispatcher link :claimed 0 :unchanged)
                 (is (eq :claimed (arcdocdb.execution:stato-worker-writer context)))
                 (is (eq (svref writers ordinal) (arcdocdb.execution:writer-worker-writer context)))
                 (is (eq :idle (arcdocdb.execution.series:stato-worker-serie link)))
                 (is (equalp series-before (map 'list #'pool-dispatch-series-image controllers)))
                 ;; Un controller e ancora acquisibile: routing non possiede lease.
                 (let* ((controller (svref controllers ordinal))
                        (lease (arcdocdb.series:acquisisci-controllore-serie controller)))
                   (is (plusp lease)) (arcdocdb.series:rilascia-controllore-serie controller lease))
                 (pool-dispatch-finish link item :idle)))
      (pool-dispatch-check dispatcher nil :empty 0 :unchanged))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-dispatch-existing-claimed-routes-without-reading-corrupt-pool-words
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (declare (ignorable controllers))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    (let ((link (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0)))
      (pool-dispatch-check dispatcher link :claimed 0 :unchanged)
      ;; FI in modo quiescente: collegare un obbligo non legge il canale lifecycle.
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 4
            (arcdocdb.scheduler::porta-worker-pool-ack port) 0)
      (let ((before (pool-dispatch-image port table writers)))
        (pool-claim-function-fi
         'arcdocdb.scheduler:prendi-writer-pool
         (lambda (value) (declare (ignore value)) (error \"Gate su un obbligo CLAIMED.\"))
         (lambda ()
           (dotimes (attempt 2)
             (is (eq link (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher))))))
        (is (equalp before (pool-dispatch-image port table writers))))
      (pool-dispatch-finish link :a1 :idle)
      (is (eq :idle (arcdocdb.execution:stato-worker-writer context))))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-dispatch-pending-retire-drains-existing-claimed-before-ack
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (declare (ignorable controllers))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    ;; FI: pubblicazione del coordinator prima della ripresa dell'obbligo CLAIMED.
    (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
    (let ((link (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0)))
      (is (eq link (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher)))
      (is (equal '(2 1 nil) (lifecycle-words port)))
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
       'resource-exhausted :worker-state)
      (pool-dispatch-finish link :a1 :idle)
      (is (equal '(2 1 nil) (lifecycle-words port)))
      (pool-dispatch-check dispatcher nil :inactive 0 :retired)
      (is (equal '(2 2 nil) (lifecycle-words port))))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-dispatch-full-recycle-routes-new-claimed-while-retire-pending
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    (let* ((links (arcdocdb.execution.series::tabella-worker-serie-links table))
           (left-link (svref links 0)) (right-link (svref links 1)))
      (pool-dispatch-check dispatcher left-link :claimed 0 :unchanged)
      (pool-dispatch-finish left-link :a1 :schedule)
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 1))))
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
      (arcdocdb.execution.tests::worker-check-recycle context (svref writers 1) :claimed 1)
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
       'resource-exhausted :worker-state)
      (is (eq right-link (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher)))
      (is (not (eq left-link right-link)))
      (is (equal '(2 1 nil) (lifecycle-words port)))
      (let ((token (pool-claim-bridge-begin right-link))
            (lease (arcdocdb.series:acquisisci-controllore-serie (svref controllers 0))))
        (is (plusp lease))
        (arcdocdb.series:rilascia-controllore-serie (svref controllers 0) lease)
        (signals resource-exhausted
          (arcdocdb.series:acquisisci-controllore-serie (svref controllers 1)) :serie-busy)
        (is (null (arcdocdb.execution.series:conferma-worker-serie
                   right-link token (pool-claim-bridge-pop right-link token :b1))))
        (is (eq :idle (arcdocdb.execution.series:termina-worker-serie right-link token))))
      (pool-dispatch-check dispatcher nil :inactive 0 :retired)
      ;; A e ancora nel ring; viene completato con acquisizione C4 esplicita.
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-dispatch-finish
       (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle))))

;;; REQ: REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-004-pool-dispatch-all-disallowed-phases-preserve-first-fault-and-debts
  (with-pool-dispatch (dispatcher port context ready table writers controllers :active nil)
    (declare (ignorable ready controllers))
    (let ((original (make-condition 'invariant-violation :reason :worker-state)))
      ;; FI quiescente: il nuovo claim rifiuta prima dei debiti di ogni fase non IDLE.
      (setf (arcdocdb.execution::contesto-worker-writer-writer context) (svref writers 0)
            (arcdocdb.execution::contesto-worker-writer-lease context) 7
            (arcdocdb.execution::contesto-worker-writer-pending context) 2
            (arcdocdb.execution::contesto-worker-writer-batch-generation context) 9
            (arcdocdb.execution::contesto-worker-writer-fault context) original)
      (dolist (phase '(:claimed :running :batch :finishing :reschedule :faulted))
        (setf (arcdocdb.execution::contesto-worker-writer-state context) phase)
        (pool-dispatch-refusal
         port table writers
         (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
         'resource-exhausted :worker-state))
      (is (eq original (arcdocdb.execution:errore-worker-writer context)))
      ;; Il routing delegato verifica i debiti C1 prima della fase: le immagini
      ;; successive sono coerenti e prodotte da begin/batch/end reali della fixture.
      (setf (arcdocdb.execution::contesto-worker-writer-state context) :idle
            (arcdocdb.execution::contesto-worker-writer-writer context) nil
            (arcdocdb.execution::contesto-worker-writer-lease context) 0
            (arcdocdb.execution::contesto-worker-writer-pending context) 0
            (arcdocdb.execution::contesto-worker-writer-fault context) nil)
      (flet ((refuse-obligation ()
               (pool-dispatch-refusal
                port table writers
                (lambda () (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher))
                'resource-exhausted :worker-state)))
        (refuse-obligation)
        (is (null (arcdocdb.execution:adotta-writer-worker context (svref writers 0) 0)))
        (let* ((link (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher))
               (token (pool-claim-bridge-begin link)))
          (refuse-obligation)
          (let ((batch (pool-claim-bridge-pop link token :a1)))
            (refuse-obligation)
            (is (null (arcdocdb.execution.series:conferma-worker-serie link token batch))))
          (lifecycle-queue-busy
           (arcdocdb.execution::writer-programmabile-queue (svref writers 0))
           (lambda ()
             (signals resource-exhausted
               (arcdocdb.execution.series:termina-worker-serie link token) :writer-queue-busy)
             (is (eq :finishing (arcdocdb.execution:stato-worker-writer context)))
             (refuse-obligation)))
          (is (eq :schedule (arcdocdb.execution.series:termina-worker-serie link token)))
          (refuse-obligation))
        (setf (arcdocdb.execution::contesto-worker-writer-state context) :faulted
              (arcdocdb.execution::contesto-worker-writer-fault context) original)
        (refuse-obligation))
      (is (eq original (arcdocdb.execution:errore-worker-writer context)))
      (dolist (api '(arcdocdb.scheduler.dispatch:prendi-collegamento-pool
                     arcdocdb.scheduler.dispatch:collega-obbligo-pool))
        (let ((before (pool-dispatch-image port table writers)))
          (signals type-error (funcall api :invalid))
          (is (equalp before (pool-dispatch-image port table writers))))))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-dispatch-routing-fault-retains-activation-ack-and-acquired-obligation
  (dolist (scenario '(:legacy :different-identity :out-of-range))
    (with-pool-dispatch (dispatcher port context ready table writers controllers
                                   :active nil :shards 2 :start 1)
      (declare (ignorable table))
      (let* ((claimed (ecase scenario
                        (:legacy (arcdocdb.execution.tests::worker-test-writer '(:legacy)))
                        (:different-identity (pool-claim-writer '(:other) 0))
                        (:out-of-range (pool-claim-writer '(:range) 2))))
             (controller-before (map 'list #'pool-dispatch-series-image controllers))
             (writer-before (arcdocdb.execution.tests::handoff-fi-snapshot claimed)))
        (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 1 claimed)))
        ;; FI coordinator quiescente: vera transizione inattivo -> attivo con ACK.
        (setf (arcdocdb.scheduler::porta-worker-pool-request port) 3)
        (let ((condition
                (arcdocdb.execution.tests::worker-capture-condition
                 (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
                 'invariant-violation :worker-serie-routing)))
          (is (equal '(3 3 nil) (lifecycle-words port)))
          (is (eq :faulted (arcdocdb.execution:stato-worker-writer context)))
          (is (eq claimed (arcdocdb.execution:writer-worker-writer context)))
          (is (= 1 (arcdocdb.execution::contesto-worker-writer-home context)))
          (is (= 0 (arcdocdb.execution::contesto-worker-writer-cursor context)))
          (is (zerop (arcdocdb.execution::contesto-worker-writer-lease context)))
          (is (zerop (arcdocdb.execution::contesto-worker-writer-pending context)))
          (is (eq condition (arcdocdb.execution:errore-worker-writer context)))
          (is (equalp controller-before (map 'list #'pool-dispatch-series-image controllers)))
          (is (equalp writer-before (arcdocdb.execution.tests::handoff-fi-snapshot claimed)))
          (let ((before (lifecycle-context-state context)))
            (dolist (api '(arcdocdb.scheduler.dispatch:prendi-collegamento-pool
                           arcdocdb.scheduler.dispatch:collega-obbligo-pool))
              (arcdocdb.execution.tests::worker-capture-condition
               (lambda () (funcall api dispatcher)) 'resource-exhausted :worker-state)
              (is (equal before (lifecycle-context-state context)))
              (is (eq condition (arcdocdb.execution:errore-worker-writer context))))))
        (is (every (lambda (writer) (not (eq claimed writer))) writers))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-dispatch-corrupt-table-binding-refuses-before-claim-or-routing
  (with-pool-dispatch (dispatcher port context ready table writers controllers :active nil)
    (declare (ignorable controllers))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    ;; FI coordinator: l'attivazione reale resterebbe applicabile a un gate valido.
    ;; Il binding incoerente deve rifiutare prima di confermare questo comando.
    (setf (arcdocdb.scheduler::porta-worker-pool-request port) 3)
    ;; FI bypass prive: dispatcher lega deliberatamente la tabella a contesto diverso.
    ;; Lo slot e immutabile nel prodotto; una nuova struct FI sostituisce il binding.
    (let* ((other (arcdocdb.execution:crea-contesto-worker-writer ready))
           (bad-table (arcdocdb.execution.series::%make-tabella-worker-serie
                       other (arcdocdb.execution.series::tabella-worker-serie-registry table)
                       (arcdocdb.execution.series::tabella-worker-serie-links table)))
           (bad (arcdocdb.scheduler.dispatch::%make-dispatcher-writer-pool port bad-table)))
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool bad))
       'invalid-argument :pool-dispatcher-binding)
      (is (equal '(3 0 nil) (lifecycle-words port)))
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-dispatch-refusal
       port table writers
       (lambda () (arcdocdb.scheduler.dispatch:collega-obbligo-pool bad))
       'invalid-argument :pool-dispatcher-binding)
      (is (equal '(3 0 nil) (lifecycle-words port)))
      (is (eq :idle (arcdocdb.execution:stato-worker-writer other)))
      (pool-dispatch-finish
       (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a1 :schedule)
      (arcdocdb.execution.tests::worker-check-recycle context nil :published 1)
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-dispatch-finish
       (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-dispatch-corrupt-link-faults-after-claim-without-begin-or-rollback
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (let* ((links (arcdocdb.execution.series::tabella-worker-serie-links table))
           (controller-before (map 'list #'pool-dispatch-series-image controllers))
           (writer-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0))))
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
      ;; FI quiescente dopo factory: nessuno dei link viene ricostruito nel path caldo.
      (setf (svref links 0) nil)
      (let ((condition
              (arcdocdb.execution.tests::worker-capture-condition
               (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
               'invariant-violation :worker-serie-routing)))
        (is (eq :faulted (arcdocdb.execution:stato-worker-writer context)))
        (is (eq (svref writers 0) (arcdocdb.execution:writer-worker-writer context)))
        (is (eq condition (arcdocdb.execution:errore-worker-writer context)))
        (is (equal '(1 1 nil) (lifecycle-words port)))
        (is (equalp controller-before (map 'list #'pool-dispatch-series-image controllers)))
        (is (equalp writer-before
                    (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0))))
        ;; Il pop acquisito e conservato: la partizione non ripubblica il writer.
        (let ((ready-partition (arcdocdb.execution.tests::ready-test-partition ready 0)))
          (is (zerop (arcdocdb.execution::partizione-pronta-count ready-partition))))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-dispatch-contradictory-gate-output-refuses-before-routing
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable context ready controllers))
    ;; FI di contratto, non una race reale: il gate restituisce combinazioni errate
    ;; dei quattro valori che rispettano ancora la sua firma di tipi.
    (dolist (scenario '(:claimed :empty :busy :inactive))
      (pool-claim-function-fi
       'arcdocdb.scheduler:prendi-writer-pool
       (lambda (value)
         (declare (ignore value))
         (values (unless (eq scenario :claimed) (svref writers 0)) scenario 0 :unchanged))
       (lambda ()
         (pool-claim-function-fi
          'arcdocdb.execution.series:collega-writer-worker-serie
          (lambda (value) (declare (ignore value)) (error \"Routing di risultato incoerente.\"))
          (lambda ()
            (pool-dispatch-refusal
             port table writers
             (lambda () (arcdocdb.scheduler.dispatch:prendi-collegamento-pool dispatcher))
             'invariant-violation :pool-dispatcher-state))))))))

;;; REQ: REQ-THR-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-dispatch-writer-busy-begin-keeps-claimed-for-explicit-retry
  (with-pool-dispatch (dispatcher port context ready table writers controllers :left-items '(:a1))
    (declare (ignorable controllers))
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
    (let ((link (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0)))
      (pool-dispatch-check dispatcher link :claimed 0 :unchanged)
      ;; FI quiescente di contesa: prende la vera guard con CAS e la rilascia sempre.
      ;; Il ritiro pendente non revoca l'obbligo già CLAIMED quando begin è busy.
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
      (lifecycle-queue-busy
       (arcdocdb.execution::writer-programmabile-queue (svref writers 0))
       (lambda ()
         (pool-dispatch-refusal
          port table writers
          (lambda () (arcdocdb.execution.series:inizia-worker-serie link))
          'resource-exhausted :writer-queue-busy)))
      (is (eq :claimed (arcdocdb.execution:stato-worker-writer context)))
      (is (eq :idle (arcdocdb.execution.series:stato-worker-serie link)))
      (is (equal '(2 1 nil) (lifecycle-words port)))
      (let ((before (pool-dispatch-image port table writers)))
        (pool-claim-function-fi
         'arcdocdb.scheduler:prendi-writer-pool
         (lambda (value) (declare (ignore value)) (error \"Nuova presa dopo begin busy.\"))
         (lambda ()
           (dotimes (attempt 2)
             (is (eq link (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher))))))
        (is (equalp before (pool-dispatch-image port table writers))))
      ;; Il caller ripete begin soltanto dopo il ritorno al proprio confine C4.
      (pool-dispatch-finish link :a1 :idle)
      (is (equal '(2 1 nil) (lifecycle-words port)))
      (pool-dispatch-check dispatcher nil :inactive 0 :retired)
      (is (equal '(2 2 nil) (lifecycle-words port))))))
")
  (:PATH
   #A((93) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tools/measure-pool-dispatch.lisp")
   :BYTES 17792 :SHA256 "5fe1dac5eb192bf91cfaa39020f18cad4242d3384605150d312d6f1dd1555837"
   :GIT-BLOB "bddb449176d3b7b6ae946e841a0ca3202e6c28ef" :TEXT
   ";;;; C4: composizione pool/routing; EMPTY, INACTIVE e ROUTE-CURRENT separati.
;;;; Cinque repliche di 4096 cicli, 128 warmup e quattro chiamate per ciclo.
;;;; Factory, claim iniziale, cleanup e GC fuori clock; nessun begin nel ciclo misurato.
;;;; Riusa invariati sample/record e fixture negative del lifecycle qualificato.
;;;; --self-test | --bench directory-nuova/. Feature: :arcdocdb-pool-dispatch-measure-library.
;;; REQ: REQ-CON-005 REQ-AFF-008 REQ-THR-001 REQ-BEN-001 REQ-BEN-002
;;; OWNER: dispatcher, contesto, link e sensore allo stesso thread C4.
;;; SHARED: ready autentico privato alla fixture; nessun coordinatore concorrente nel clock.
(eval-when (:compile-toplevel :load-toplevel :execute)
  (require :asdf)
  (unless (find-package \"ARCDOCDB.POOL-LIFECYCLE.MEASURE\")
    (let ((*features* (cons :arcdocdb-pool-lifecycle-measure-library *features*)))
      (load \"tools/measure-pool-lifecycle.lisp\"))))
(defpackage #:arcdocdb.pool-dispatch.measure
  (:use #:cl)
  (:import-from #:arcdocdb.pool-lifecycle.measure
                #:lookup-function #:sample #:sample-record #:campaign-group
                #:acquire-directory #:write-report #:load-product
                #:+iterations+ #:+warmup+ #:+replicas+))
(in-package #:arcdocdb.pool-dispatch.measure)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

(defun fingerprints ()
  \"Stabilita: biblioteca, questo sensore e tutti i sorgenti/test prodotto.\"
  (append (arcdocdb.pool-lifecycle.measure::fingerprints)
          (list (list :file \"tools/measure-pool-dispatch.lisp\"
                      :md5 (format nil \"~(~{~2,'0X~}~)\"
                                   (coerce (sb-md5:md5sum-file \"tools/measure-pool-dispatch.lisp\") 'list))))))

(defun api (name &optional (package \"ARCDOCDB.SCHEDULER.DISPATCH\"))
  \"Risolve soltanto funzioni pubbliche prima del clock, senza nomi nel percorso caldo.\"
  (multiple-value-bind (symbol visibility) (find-symbol name package)
    (unless (and symbol (eq :external visibility) (fboundp symbol))
      (error \"COD-60: API pubblica ~A/~A assente.\" package name))
    (symbol-function symbol)))

(defun make-series ()
  \"Backend pubblico C4 locale, nessun I/O richiesto dai lookup della campagna.\"
  (let* ((backend (funcall (api \"MAKE-BACKEND\" \"ARCDOCDB.IO\")
                           (lambda (path mode) (declare (ignore path mode)) 811)
                           (lambda (&rest arguments) (declare (ignore arguments))
                             (error \"COD-60: lettura I/O inattesa nella fixture dispatch.\"))
                           (lambda (fd bytes start count) (declare (ignore fd bytes start)) count)
                           (lambda (fd) (declare (ignore fd)) 0)
                           (lambda (fd) (declare (ignore fd)) 0)
                           (lambda (fd) (declare (ignore fd)) 0)))
         (file (funcall (api \"CREA-TEMPORANEO\" \"ARCDOCDB.IO\") \"pool-dispatch-C4.tmp\" :backend backend))
         (log (funcall (api \"CREA-LOG-IO\" \"ARCDOCDB.WAL\") file :segment 811)))
    (values (funcall (api \"CREA-CONTROLLORE-SERIE\" \"ARCDOCDB.SERIES\")
                     (funcall (api \"CREA-REGISTRO-CSN\" \"ARCDOCDB.CSN\") :capacity 4) log :capacity 2)
            file)))

(defun make-dispatch (active cursor)
  \"Quattro shard autentici e tabella singleton; costruzione e risoluzione API fuori clock.\"
  (multiple-value-bind (controller file) (make-series)
    (let* ((ready (funcall (api \"CREA-LISTA-WRITER-PRONTI\" \"ARCDOCDB.EXECUTION\") :shards 4 :capacity 1))
           (context (funcall (api \"CREA-CONTESTO-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\") ready :start cursor))
           (port (funcall (api \"CREA-PORTA-WORKER-POOL\" \"ARCDOCDB.SCHEDULER\") context :active active))
           (writer (funcall (api \"CREA-WRITER-PROGRAMMABILE\" \"ARCDOCDB.EXECUTION\")
                            :capacity 1 :quantum 1 :routing-index 0))
           (registry (funcall (api \"CREA-REGISTRO-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\")
                              (vector writer) (vector controller)))
           (table (funcall (api \"CREA-TABELLA-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\") context registry))
           (links (funcall (lookup-function \"TABELLA-WORKER-SERIE-LINKS\" \"ARCDOCDB.EXECUTION.SERIES\") table)))
      (values (funcall (api \"CREA-DISPATCHER-WRITER-POOL\") port table)
              context ready writer (svref links 0) file))))

(defun close-fixture (file)
  \"Solo cleanup C4: chiude il backend della fixture dopo ogni misura o rifiuto.\"
  (funcall (api \"CHIUDI\" \"ARCDOCDB.IO\") file))

(defun verify-claim (claim dispatcher expected status cursor lifecycle)
  \"Oracolo scalare dei quattro risultati; identita del link attesa dal caller.\"
  (multiple-value-bind (link outcome next action) (funcall claim dispatcher)
    (unless (and (eq expected link) (eq status outcome) (eql cursor next) (eq lifecycle action))
      (error \"COD-60: dispatch ~S/~S/~S/~S invece di ~S/~S/~S/~S.\"
             link outcome next action expected status cursor lifecycle))))

(defun verify-current (route dispatcher expected context writer read-state read-writer read-link-state)
  \"Lookup ripetibile: stesso link IDLE e obbligo CLAIMED, nessun begin o pool ACK.\"
  (unless (and (eq expected (funcall route dispatcher))
               (eq :claimed (funcall read-state context))
               (eq writer (funcall read-writer context))
               (eq :idle (funcall read-link-state expected)))
    (error \"COD-60: lookup current altera o perde il link/obbligo CLAIMED.\")))

(defun create-empty-cycle ()
  \"Quattro EMPTY attivi: rotazione0->1->2->3->0; token12.\"
  (multiple-value-bind (dispatcher context ready writer link file) (make-dispatch t 0)
    (declare (ignore context ready writer link))
    (let ((claim (api \"PRENDI-COLLEGAMENTO-POOL\")))
      (values (lambda ()
                (verify-claim claim dispatcher nil :empty 1 :unchanged)
                (verify-claim claim dispatcher nil :empty 2 :unchanged)
                (verify-claim claim dispatcher nil :empty 3 :unchanged)
                (verify-claim claim dispatcher nil :empty 0 :unchanged)
                12)
              12 (lambda () (close-fixture file))))))

(defun create-inactive-cycle ()
  \"Quattro INACTIVE preservano cursor2; token20.\"
  (multiple-value-bind (dispatcher context ready writer link file) (make-dispatch nil 2)
    (declare (ignore context ready writer link))
    (let ((claim (api \"PRENDI-COLLEGAMENTO-POOL\")))
      (values (lambda ()
                (dotimes (i 4) (verify-claim claim dispatcher nil :inactive 2 :unchanged))
                20)
              20 (lambda () (close-fixture file))))))

(defun drain-claim (context writer)
  \"Cleanup C4 fuori clock: consuma e conferma il solo payload sentinel, poi termina IDLE.\"
  (let ((target (vector nil)))
    (unless (plusp (funcall (api \"INIZIA-TRATTO-WORKER\" \"ARCDOCDB.EXECUTION\") context))
      (error \"COD-60: cleanup begin senza lease.\"))
    (multiple-value-bind (count status token)
        (funcall (api \"PRELEVA-LAVORI-WORKER\" \"ARCDOCDB.EXECUTION\") context target 0 1)
      (unless (and (= 1 count) (eq :messages status) (eq :dispatch-C4 (svref target 0)) (plusp token))
        (error \"COD-60: cleanup perde il payload della fixture.\"))
      (funcall (api \"CONFERMA-LAVORI-WORKER\" \"ARCDOCDB.EXECUTION\") context token))
    (unless (and (eq writer (funcall (api \"WRITER-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\") context))
                 (eq :idle (funcall (api \"TERMINA-TRATTO-WORKER\" \"ARCDOCDB.EXECUTION\") context)))
      (error \"COD-60: cleanup non termina il compito IDLE.\"))))

(defun create-current-cycle ()
  \"Quattro lookup del link CLAIMED stabile; claim iniziale e drain fuori clock; token28.\"
  (multiple-value-bind (dispatcher context ready writer link file) (make-dispatch t 0)
    (let ((claim (api \"PRENDI-COLLEGAMENTO-POOL\")) (route (api \"COLLEGA-OBBLIGO-POOL\"))
          (read-state (api \"STATO-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\"))
          (read-writer (api \"WRITER-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\"))
          (read-link-state (api \"STATO-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\")))
      (multiple-value-bind (count status)
          (funcall (api \"ACCODA-LAVORO-WRITER\" \"ARCDOCDB.EXECUTION\") writer :dispatch-C4)
        (unless (and (= 1 count) (eq :schedule status)) (error \"COD-60: enqueue iniziale difforme.\")))
      (unless (= 1 (funcall (api \"PUBBLICA-WRITER-PRONTO\" \"ARCDOCDB.EXECUTION\") ready 0 writer))
        (error \"COD-60: pubblicazione iniziale difforme.\"))
      (verify-claim claim dispatcher link :claimed 1 :unchanged)
      (values (lambda ()
                (dotimes (i 4)
                  (verify-current route dispatcher link context writer read-state read-writer read-link-state))
                28)
              28 (lambda () (unwind-protect (drain-claim context writer) (close-fixture file)))))))

(defun campaign (report checkpoint)
  \"Tre campagne preregistrate; startup, GC e serializzazione dei report esclusi dal clock.\"
  (campaign-group :empty #'create-empty-cycle report checkpoint)
  (campaign-group :inactive #'create-inactive-cycle report checkpoint)
  (campaign-group :route-current #'create-current-cycle report checkpoint)
  (setf (getf report :current-replica) nil)
  report)

(defun make-report ()
  \"Raw e confini C4: nessuna misura di begin, doppia lease o coordinatore vivo.\"
  (list :schema-version 1 :kind :pool-dispatch-benchmark :status :running :stage :pending
        :diagnostic nil :process-argv sb-ext:*posix-argv* :tool-arguments (uiop:command-line-arguments)
        :source-fingerprints-before (fingerprints) :source-fingerprints-after nil
        :source-consistency :pending :recorded-at (get-universal-time) :self-test nil
        :samples nil :current-replica nil :sbcl (lisp-implementation-version)
        :machine (machine-type) :os (software-type) :os-version (software-version) :safety 3
        :iterations +iterations+ :warmup +warmup+ :replicas +replicas+
        :timer-units-per-second internal-time-units-per-second
        :campaigns '((:empty :shards 4 :initial-cursor 0 :calls-per-cycle 4 :token 12)
                    (:inactive :shards 4 :initial-cursor 2 :calls-per-cycle 4 :token 20)
                    (:route-current :shards 4 :initial-cursor 0 :calls-per-cycle 4 :token 28
                     :initial-claim-outside-clock t :worker-phase :claimed :link-phase :idle
                     :scalar-state-oracle-in-cycle t))
        :token-formula \"sample=N*cycle-token+N*(N-1)/2; EMPTY=12; INACTIVE=20; ROUTE-CURRENT=28\"
        :limits '(:preallocated-product-and-inputs :startup-claim-drain-and-gc-excluded
                  :counter-not-absolute-nonallocation-proof :external-load-uncontrolled
                  :clock-zero-is-below-resolution :no-time-threshold-no-tuning-claim
                  :empty-is-local-observation :no-real-queued-claim-measured
                  :current-is-repeated-claimed-lookup-with-scalar-oracles
                  :no-begin-or-live-lease-in-clock :no-concurrent-coordinator
                  :no-physical-worker-lifecycle-qualification)))
(defun run-driver (args &key (product-loader #'load-product) (tester #'self-test) (runner #'campaign))
  \"Driver dispatch compatto; riusa I/O esclusivo e sensore qualificati, preserva raw del fallimento.\"
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

(defun self-test-reporter ()
  \"Il driver dispatch rifiuta CLI/destinazione e conserva replica conclusa più raw parziale.\"
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


(defun self-test-oracle ()
  \"Ogni risultato claim e ogni identita/fase current sbagliati devono essere respinti.\"
  (dolist (row '((:unexpected :empty 1 :unchanged) (nil :inactive 1 :unchanged)
                 (nil :empty 2 :unchanged) (nil :empty 1 :activated)))
    (unless (handler-case
                (progn (verify-claim (lambda (dispatcher) (declare (ignore dispatcher)) (values-list row))
                                     nil nil :empty 1 :unchanged) nil)
              (error () t))
      (error \"COD-60: risultato dispatch difforme non respinto: ~S.\" row)))
  (dolist (row '((:wrong :claimed :writer :idle) (:link :idle :writer :idle)
                 (:link :claimed :wrong :idle) (:link :claimed :writer :active)))
    (unless (handler-case
                (progn (verify-current (lambda (dispatcher) (declare (ignore dispatcher)) (first row))
                                        nil :link nil :writer (constantly (second row))
                                        (constantly (third row)) (constantly (fourth row))) nil)
              (error () t))
      (error \"COD-60: identita o fase current difforme non respinta: ~S.\" row)))
  :passed)

(defun self-test ()
  \"Sensore comune positivo/negativo, quattro risultati claim e lookup current reali.\"
  (list :status :ok :shared-sensor (arcdocdb.pool-lifecycle.measure::self-test)
        :dispatch-oracles (self-test-oracle) :dispatch-cli-and-partial-raw (self-test-reporter)
        :empty (arcdocdb.pool-lifecycle.measure::self-test-composed #'create-empty-cycle)
        :inactive (arcdocdb.pool-lifecycle.measure::self-test-composed #'create-inactive-cycle)
        :route-current (arcdocdb.pool-lifecycle.measure::self-test-composed #'create-current-cycle)))

(defun main ()
  \"Rapporto leggibile; errore nonzero anche per fonte cambiata o heap osservato positivo.\"
  (let ((report (run-driver (uiop:command-line-arguments))))
    (let ((*print-readably* t)) (write report :pretty t) (terpri))
    (unless (eq :ok (getf report :status))
      (format *error-output* \"~&tools/measure-pool-dispatch.lisp: ~A~%\" (getf report :diagnostic))
      (uiop:quit 1))))
(unless (member :arcdocdb-pool-dispatch-measure-library *features*) (main))
")
  (:PATH
   #A((98) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/pool-dispatch.md")
   :BYTES 4752 :SHA256 "1e8ae257234afd483f46d5ce3e9f13e904721981270741abe6576899c694e433" :GIT-BLOB
   "de9d8bae73540cd86d4bd36330c7800a9bde8ce3" :TEXT "# Collegamento dal pool alla Serie

Il componente C3 `arcdocdb.scheduler.dispatch` collega la
[presa governata dal pool](pool-worker-claim.md) al
[routing preallocato](routing-worker.md), per REQ-THR-001,
REQ-CON-001/002/004/005 e REQ-AFF-008. Il governo delle risorse resta
fuori dalle barriere C1; non scrive campi di integrità, writer o controller.
Il [metodo preregistrato](pool-dispatch-metodo.md) delimita la qualifica.

## Binding e ingressi

`crea-dispatcher-writer-pool porta tabella` crea un binding immutabile sul
thread proprietario. Porta e tabella devono riferirsi EQ allo stesso contesto
execution completamente IDLE. Tipo della porta, owner, tipo della tabella
e identità del contesto sono verificati in quest'ordine, prima di leggere
la fase o applicare un comando. La barriera IDLE C1 è read-only.
La factory non assume obblighi, acquisisce lease o conferma il pool.
La porta può essere inattiva o avere un comando pendente.

| API | Esito |
|---|---|
| `prendi-collegamento-pool dispatcher` | Solo IDLE libero: nuova presa attraverso il gate, poi routing del CLAIMED. Restituisce link oppure NIL, status, cursore e azione lifecycle originali. |
| `collega-obbligo-pool dispatcher` | Solo CLAIMED già assunto: routing del writer corrente, senza leggere request/ack/active e senza conferme del pool. Restituisce il link preallocato. |

Il primo ingresso restituisce un link solo con `:claimed`. Con `:empty`,
`:busy` o `:inactive` restituisce NIL senza routing. Il link è ancora IDLE:
`inizia-worker-serie`, token, pop, ack e chiusura rimangono passi espliciti
del [bridge](worker-serie.md). Nessuna acquisizione della Serie è implicita.
EMPTY e BUSY non dimostrano quiescenza globale né autorizzano park/shutdown.

Il secondo ingresso riprende un CLAIMED conservato dopo writer-busy, un
ricircolo full o un'adozione. Ogni selezione usa il writer attuale; non
riutilizza il collegamento del tratto precedente. È ripetibile finché il link
rimane IDLE, senza nuove capacità. Neppure parole lifecycle incoerenti
impediscono questo ingresso: l'obbligo esistente deve restare completabile.
Un binding incoerente o un owner estraneo sono invece sempre rifiutati.

## Ritiro, errore e responsabilità del caller

Il ritiro pendente viene confermato al prossimo ingresso IDLE attraverso il
gate. Non viene applicato durante CLAIMED, RUNNING, BATCH, FINISHING o
RESCHEDULE. Dopo `:schedule` il caller ricircola o cede l'obbligo con le
API execution; se il ricircolo assegna un nuovo CLAIMED, usa
`collega-obbligo-pool`. Dopo una pubblicazione riuscita il contesto torna
IDLE e può applicare il ritiro con la successiva nuova presa.

Il dispatcher non include begin, pop, end, ricircolo, retry, cleanup o
rollback. I rifiuti writer-busy e Serie-busy mantengono gli stati differenti
del bridge: il primo conserva CLAIMED, il secondo produce CLOSING e un
token da chiudere esplicitamente. Il caller conserva riferimenti e token
fino alla conclusione; non ignora alcun obbligo su errore.

Un routing invalido dopo claim conserva writer, home e obbligo nel contesto
FAULTED secondo la barriera C1 già presente. Nessuna lease della Serie
viene acquisita. L'ACK di attivazione già riuscito resta valido: non si
revocano generazioni. L'Archivio deve gestire la diagnosi, come nei contratti
execution/bridge. C3 non marca direttamente worker o controller.

Tipo della configurazione errato: `invalid-argument
:pool-dispatcher-configuration`; owner estraneo: `invalid-argument
:pool-worker-owner`; contesti diversi: `invalid-argument
:pool-dispatcher-binding`. Fase non-IDLE nella factory o nel gate:
`resource-exhausted :worker-state`, senza sostituire la prima causa.
I rifiuti di routing restano quelli dell'API C1. Un ritorno del gate
incoerente fra writer e status segnala `invariant-violation
:pool-dispatcher-state`, senza abbandonare o mutare il contesto.

## Costo e ambito

Il binding costa O(1) all'avvio, oltre alla tabella O(N) già preallocata.
Ogni ingresso verifica owner e identità EQ in O(1). Nuova presa: gate e
scansione ready O(K), con K massimo 64; solo dopo CLAIMED, routing O(1)
tramite ordinale. Obbligo corrente: solo routing O(1). Nessuna nuova
allocazione intenzionale nel percorso caldo, scansione delle Serie, hash,
scrittura condivisa tra Serie, attesa, thread, callback o I/O.

Il coupling privato legge soltanto owner/context della porta e context della
tabella. I protocolli C1 e lifecycle restano invariati. Il dispatcher è un
ingresso logico per writer, non il loop completo del server: avvio e arresto
dei thread, park/wake, sensori reali, admission dei messaggi, applicazione dei
payload e coordinamento dell'Archivio restano aperti. Nessun gate del motore
completo viene chiuso da questa qualifica.
")
  (:PATH
   #A((105) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/pool-dispatch-metodo.md")
   :BYTES 3641 :SHA256 "c00510ab85c22fe7c542d37a0efc6fd7094885d3ec48a5a9478ae00f07455bb4" :GIT-BLOB
   "d94f69542c7685c30f91899889ce7dbb12783a15" :TEXT "# Metodo del collegamento pool/Serie

Preregistrazione del 2026-10-13, base
`14fd7738c216e3a0bd3ce9612576b9b57d648f74`, prima delle campagne formali.
Scope C3 completo: `src/dispatch/package.lisp`, `types.lisp`, `build.lisp`
e `claim.lisp`. Il [contratto](pool-dispatch.md) definisce i due ingressi.
Nessun sorgente C1 viene modificato; si riusano claim, routing e bridge
con le loro verifiche e barriere originali.

## Prove e lettura indipendente

- Tipi e binding nella factory, owner verificato prima della tabella;
  preimage di porta, contesto, ready e writer su rifiuto.
- Porta/tabella di contesti differenti: rifiuto prima di ACK/claim, anche
  con una richiesta di attivazione pendente e lavoro pronto.
- INACTIVE, EMPTY e BUSY: quattro risultati originali e nessun routing.
  Le sentinelle FI sono quiescenti, temporanee e ripristinate.
- Writer realmente pronto, scelta per ordinale e begin esplicito della
  doppia lease; pop, conferma e fine attraverso il bridge esistente.
- CLAIMED conservato, ritiro pendente e parole pool invalide: lookup del
  solo obbligo, nessuna conferma e completamento consentito.
- Ricircolo full con nuovo writer: routing ripetuto sul nuovo obbligo;
  dopo IDLE il ritiro impedisce una nuova presa.
- Attivazione valida e claim reale seguiti da routing sconosciuto:
  ACK conservato, worker FAULTED con riferimento/home e causa originale,
  nessuna acquisizione o mutazione del controller.
- Fasi errate e owner estraneo: diagnosi, debito e lease conservati.
- Ritorni del gate incoerenti vengono iniettati separatamente dalla
  normale esecuzione per verificare le difese del confine C3. Un status
  fuori dal dominio ftype non viene presentato come ritorno nominale.
- Una lettura indipendente C3 con lista di controllo, safety 3,
  compilazione senza warning/style-warning, lint e tracciabilità.

## Copertura e memoria

Gate C3 almeno 95% di espressioni e rami sull'intero scope, senza esclusioni
manuali. Conservare native SB-COVER, HTML e audit con denominatori, percorsi
mancanti e impronte esatte. Confrontare i conteggi interi native/HTML;
nessuna inferenza MC/DC e nessuna copertura C1 ereditata nel denominatore.
Il reader verificato resta invariato, l'adattatore dichiara heading e scope
dispatch e verifica file/shape/missing paths con casi negativi.

Il sensore C4 riusa campionamento e conservazione lifecycle già verificati,
con self-test dedicati. Cinque repliche da 4096 cicli e 128 cicli di warmup
per campagna, factory/API lookup/GC fuori clock, nessuna taratura.

| Campagna | Ciclo |
|---|---|
| EMPTY | Quattro nuove prese su quattro shard vuoti, cursori 1/2/3/0, NIL e azione invariata. |
| INACTIVE | Quattro nuove prese, cursore 2 invariato, NIL e nessun routing. |
| ROUTE-CURRENT | Quattro selezioni del link preallocato su un CLAIMED stabile, senza begin/pop o nuovi obblighi. |

Tutti i valori e le identità contribuiscono all'oracolo del ciclo.
Conservare heap, tick, sink e cicli completati; heap zero osservato non
dimostra assenza universale di allocazione. Carico esterno incontrollato,
nessuna conclusione sul throughput del motore. Il sensore deve rilevare
allocazione deliberata, sink errato, ritorni difformi e clock sotto risoluzione,
conservando output parziali e destinazioni esistenti.

Le campagne formali usano una copia congelata e `record-command.lisp`,
con cache dedicate, argv, stdout/stderr, exit e identità iniziali/finali.
Fallimenti rimangono tali, raw preliminari restano separati. Le copie
pubblicate sono verificate byte per byte e i nuovi manifesti non sostituiscono
gli originali. Il controllo completo include i dieci spike esistenti.
")
  (:PATH
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/pool-dispatch-revisione.md")
   :BYTES 12633 :SHA256 "d3818829222a72aec962e218db33ab03f58e03035c2b1a0fdd9bd79b7d057a47"
   :GIT-BLOB "33a30b807c66ec62c47fea6124c65126f693c91d" :TEXT
   "# Revisione indipendente del dispatcher pool/Serie

Lettura statica del 2026-10-13, sulla base
`14fd7738c216e3a0bd3ce9612576b9b57d648f74`, eseguita da un agente diverso
dall'autore. Esito sul codice letto: **positivo per lo scope C3**. Il revisore
non ha modificato codice di prodotto o test. La lettura non è una revisione
umana e non attesta build, esecuzione dei test, copertura o allocazioni.

Il quadro applicato comprende
[ADR-0031](../adr/0031-software-critico-criteri-e-priorita.md),
[ADR-0034](../adr/0034-policy-di-compilazione-e-standard-di-codifica.md),
[ADR-0045](../adr/0045-modello-di-esecuzione.md) e lo
[standard di codifica](../affidabilita/standard-di-codifica.md).
Sono stati letti il [contratto](pool-dispatch.md), il
[metodo preregistrato](pool-dispatch-metodo.md), i quattro sorgenti nuovi,
l'ordine ASDF, i quattordici test nuovi e le barriere preesistenti di claim,
routing, worker execution e bridge Serie.

## Identità del codice letto

| File | SHA-256 |
|---|---|
| `src/dispatch/package.lisp` | `acb5fd19599e89e821a89bcca8f94064f33cdc71cdfcf204aadcd4fb52dd795f` |
| `src/dispatch/types.lisp` | `cc44882c565a89de08f5add79333868ebfca4fc3f97bf9104d36375d014d4720` |
| `src/dispatch/build.lisp` | `c78d31a753db78baea520e9ea0cccf6e88cad9cca8bc75261a6ff26c2ac01fe5` |
| `src/dispatch/claim.lisp` | `224e4114b8b91affced874bea9c23cae5c79526e8ddae62e31a0cafcbb763682` |
| `arcdocdb.asd` | `0128c4955e2682cf22400c2995e0769072a57530c6d289aa258c8bac9a96cd4c` |
| `tests/scheduler/dispatch.lisp` | `600eb0b5fdf9a52d020e2f4c638f0f3dba43d9d9711be73eaffff208578821eb` |
| `docs/implementazione/pool-dispatch.md` | `1e8ae257234afd483f46d5ce3e9f13e904721981270741abe6576899c694e433` |
| `docs/implementazione/pool-dispatch-metodo.md` | `c00510ab85c22fe7c542d37a0efc6fd7094885d3ec48a5a9478ae00f07455bb4` |

Le barriere delegate sono state verificate su queste fonti, senza modificarle:

| Fonte | SHA-256 |
|---|---|
| `src/scheduler/pool-claim.lisp` | `e384f6091a5fcb506e718e12e77b06ab8dd4233a41024bc57ca3b14425e10b14` |
| `src/scheduler/lifecycle-worker.lisp` | `ec8b462ff3f5f7a6435f0f0c01b62034d8de2a784a9e354d469a0adfec9cf837` |
| `src/series/routing-select.lisp` | `796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a` |
| `src/series/worker-run.lisp` | `f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f` |
| `src/execution/worker-boundary.lisp` | `4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a` |
| `src/execution/worker-types.lisp` | `62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317` |
| `src/execution/worker-claim.lisp` | `62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e` |

Le campagne successive devono indicare se usano gli stessi byte. Il documento
separa questa identità dalla qualificazione eseguita da altri strumenti.

## Confine e conservazione degli obblighi

Il dispatcher contiene soltanto due riferimenti tipizzati e read-only: porta
del pool e tabella locale di routing. La factory controlla tipo della porta,
owner della porta, tipo della tabella e identità EQ dei due contesti, in
quest'ordine. Verifica poi fase IDLE e forma C1 completa in sola lettura,
prima della propria allocazione. Non applica un comando o assume un obbligo.

Le due API calde ripetono i controlli di binding prima della delega. Il loro
helper non legge stato execution, parole request/ack, ring, lease o stato vivo
della Serie. L'owner execution viene nuovamente verificato dalle API delegate.
Non si usa l'uguaglianza delle ready come sostituto dell'identità del contesto.

`prendi-collegamento-pool` delega esattamente una nuova presa al gate
`prendi-writer-pool`. Solo `:claimed` seleziona il link preallocato sul contesto
associato; gli altri tre esiti conservano NIL, cursore e azione del gate.
Nessun begin, pop, token del bridge o seconda lease viene introdotto. Se il
routing fallisce dopo un claim reale, execution conserva il proprio confine
di fault, writer, home e obbligo. Un ACK già riuscito resta valido. Il nuovo
codice non cancella la diagnosi e non esegue rollback, cessione o pubblicazione.

`collega-obbligo-pool` ripete il binding e delega direttamente il routing di un
CLAIMED già posseduto. Non legge request, ack o active: busy all'inizio del
tratto, ricircolo full e adozione non dipendono da un nuovo consenso del pool.
Il lookup è ripetibile finché il link rimane IDLE. Dopo ricircolo full seleziona
il writer corrente, che può essere diverso da quello del tratto precedente.
Le fasi non CLAIMED e FAULTED mantengono i rifiuti e la prima causa delle API
C1 esistenti; non vengono adattate al dispatcher con cleanup impliciti.

Il caller continua a iniziare e completare il bridge, confermare i batch e
ricircolare gli obblighi attraverso le API esistenti. La richiesta di ritiro
non revoca un CLAIMED, non impedisce il drain e non garantisce il ritorno a
IDLE con ring perpetuamente pieno. Le API C1 dirette rimangono disponibili:
questa integrazione non rende impossibile un caller che aggira il gate.

## Lista di controllo

I dodici punti della lista C1 sono applicati come controllo aggiuntivo. La
lettura resta il singolo passaggio C3 previsto da ADR-0031, senza riclassificare
i delegati C1 né sostituire le loro revisioni e verifiche.

| Punto | Valutazione statica e limite |
|---|---|
| 1. Requisiti e ADR | REQ-THR-001, REQ-CON-001/002/004/005 e REQ-AFF-008 indicati sulle API; l'ammissione avviene tra compiti secondo ADR-0045. Il requisito del pool completo resta aperto. |
| 2. Invarianti | Owner prima della tabella, contesto identico prima del gate, IDLE C1 completo alla factory; link soltanto per un claim, routing degli obblighi senza lifecycle. Le quattordici fixture lette verificano identità e immagini complete su rifiuto; non viene attribuito alla lettura il loro risultato di esecuzione. |
| 3. Errori | Factory e binding hanno ragioni typed; fase e invarianti delegate senza occultamento. Non esiste handler o nuovo fault marking C3. Le incoerenze tra writer restituito ed esito hanno una ragione distinta `:pool-dispatcher-state`. |
| 4. Limiti | Nessun ciclo, ricorsione, attesa, callback, syscall o retry nuovo. Binding e routing O(1); il gate può delegare la scansione pronta bounded su al più 64 partizioni. |
| 5. Allocazione | Una struttura creata solo all'avvio; nessun costruttore, lista, closure o hash nel percorso caldo. L'assenza di heap deve essere misurata e non è dedotta dalla sintassi. |
| 6. Risultati | Esito, cursore e azione del gate inoltrati; writer sostituito dal link verificato solo dopo `:claimed`. Coerenza writer/NIL controllata e ramo inatteso esplicito; nessun valore che indica errore viene ignorato. |
| 7. Decisioni | Predicati semplici, nessuna nuova decisione composta. Complessità: helper binding 5, factory 2, claim 5, lookup di obbligo 1; nessuna funzione supera 60 righe o 10 percorsi. MC/DC non richiesto a C3. |
| 8. Proprietà | Dispatcher e tabella del thread creatore; porta/contesto e registro già posseduti secondo i loro contratti. Riferimenti read-only, nessun nuovo stato globale o protocollo di sincronizzazione. |
| 9. Tracciabilità | REQ su definizioni, package e nomi dei quattordici test; ASDF carica dispatch dopo series/routing e inserisce le fixture scheduler dopo pool-claim. Esecuzione di build, lint, trace e check completo resta distinta da questa lettura. |
| 10. Standard | Safety 3, ftype e slot tipizzati, docstring e OWNER/SHARED; case con otherwise typed, nessun ignore-errors, cleanup o rimozione di controlli. Nessuna deviazione individuata. |
| 11. Parallelismo | Nessun lock o contatore globale nuovo. ACK per ondata e ready partizionata restano delegati; il mapping è indicizzato e preallocato per worker. La lettura non dimostra equità o scalabilità. |
| 12. Durabilità | Nessuna scrittura su payload, controller, CSN o file; nessun cambiamento durevole o eliminazione. Atomicità persistente non applicabile. |

## Lettura delle prove nuove

Il revisore ha letto i quattordici test nominati nella versione identificata
sopra, senza eseguirli. Le prove distinguono esecuzione delle API reali,
contesa della vera guardia e FI deliberate del protocollo o della forma.

| Gruppo | Evidenza prevista dal codice e limite |
|---|---|
| Factory e binding | Tipi invalidi, contesti diversi, CLAIMED reale e IDLE incoerente FI; rifiuti confrontati con immagini di porta, contesto, ready, writer, link e controller. Factory non applica comandi. |
| Owner estraneo | Porta creata su worker reale distinto; owner viene rifiutato prima di tabella invalida, fase e parole corrotte FI. Le due API calde conservano le immagini. |
| Nessun routing senza claim | Sentinella quiescente ripristinata sul routing, INACTIVE con lavoro reale accodato, EMPTY e BUSY su guardia pronta realmente acquisita. Quattro valori e cursori confrontati con gli attesi. |
| Due writer reali | Ordinali distinti, link ancora IDLE e controller acquisibile dopo la selezione; begin, pop, ACK ed end espliciti attraverso il bridge. Nessuna acquisizione implicita attribuita al dispatcher. |
| Obbligo indipendente dal pool | Lookup ripetuto sul CLAIMED con parole lifecycle corrotte FI e sentinella sul gate; immagini uguali, poi completamento reale del tratto. |
| Ritiro dopo drain | Comando pending pubblicato in modo quiescente FI, rifiuto della nuova presa durante CLAIMED, termine reale e ACK del ritiro soltanto alla nuova presa IDLE. Non è un test della pubblicazione concorrente del coordinatore. |
| Ricircolo full | Ring pieno e trasferimento reali; nuovo CLAIMED seleziona il secondo link, entrambe le Serie restano indipendenti, ACK pending conservato. Il primo obbligo nel ring viene poi completato esplicitamente. |
| Begin writer-busy | Contesa FI sulla vera guardia con CAS/rilascio; begin reale conserva CLAIMED e link IDLE. Lookup ripetuto senza gate, retry begin esplicito, drain e ACK del ritiro dopo IDLE. Non è uno stress di contesa casuale. |
| Fasi e diagnosi | Tutte le fasi non-IDLE rifiutate dal gate prima di lease/debito incoerenti FI; lookup dell'obbligo rifiutato su stati coerenti ottenuti da begin/batch/end reali. Prima causa EQ conservata nella fase terminale. |
| Fault dopo attivazione | Writer legacy, identità estranea e ordinale fuori range: vera attivazione/ACK e claim precedono il fault routing. Writer/home e causa EQ conservati; nessuna mutazione di controller o acquisizione Serie. La pubblicazione request è FI quiescente. |
| Binding e link corrotti | Dispatcher FI con contesto diverso rifiutato prima dell'ACK pending 3/0 e del claim, anche durante l'obbligo corrente; slot link NIL provoca il fault C1 dopo claim conservando il riferimento e lasciando ready senza falsa ripubblicazione. |
| Output incoerenti | Ritorni del gate sostituiti temporaneamente, con combinazioni writer/status incoerenti ma valori nei tipi dichiarati; sentinella sul routing e immagini uguali. Queste prove non sono interleaving reali né autorizzano una nuova diagnosi sul contesto C1. |

La prima lettura delle fixture aveva individuato l'assenza di una prova
dedicata di begin writer-busy e di un binding incoerente con attivazione
pending. La versione finale introduce entrambe; il codice di prodotto è
rimasto identico. Le prove non simulano Serie-busy attraverso il nuovo
dispatcher: begin rimane esplicito e il suo contratto C1 resta quello del
bridge preesistente.

## Limite dei rami difensivi

Un delegate che rispetta il proprio ftype restituisce sempre uno dei quattro
esiti noti; `otherwise` non è un caso nominale. Le guardie writer/esito
proteggono una coerenza non espressa dalla sola dichiarazione dei valori
multipli: una FI può produrre NIL con `:claimed`, oppure un writer con un esito
senza claim, restando nei tipi dichiarati. Uno status estraneo viola invece
il contratto ftype del delegate.

Un'eventuale FI di sostituzione della funzione deve essere quiescente e
ripristinare l'originale. La campagna di copertura deve conservare il
denominatore nativo, dichiarare quali rami difensivi il compilatore mantiene e
distinguere queste prove da risultati nominali. La lettura non esclude rami
dal denominatore, non attesta la soglia C3 e non deduce un PASS dal fatto che
il ritorno inatteso sia impossibile per una funzione corretta.

## Limiti di qualificazione

L'integrazione non esegue i payload e non decide la gestione di un Archivio
FAULTED. Avvio e arresto fisici, park/wake, worker morti, sensori, admission dei
messaggi e dispatcher completo del server restano fuori dallo scope. I gate
di fase, il motore completo e REQ-THR-001 non sono chiusi da questa revisione.
")
  (:PATH
   #A((108) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/pool-dispatch-risultati.md")
   :BYTES 8119 :SHA256 "a9bc70c87310f6b94d324de1e40f65bb00fae788d327db9d89657346959933b3" :GIT-BLOB
   "9ce8d7144743a7ed64fe64446eaa42247dfa05e9" :TEXT "# Verifica del collegamento pool/Serie

La qualifica segue [contratto](pool-dispatch.md),
[metodo preregistrato](pool-dispatch-metodo.md) e
[lettura indipendente C3](pool-dispatch-revisione.md).
Base congelata `14fd7738c216e3a0bd3ce9612576b9b57d648f74`, tredici
fonti dell'incremento e quattordici helper copiati byte per byte.
Gli originali sono nel [catalogo della campagna](../../spikes/results/2026-10-13-pool-worker-dispatch/).
La data del namespace segue la preregistrazione; i record conservano i propri
tempi originali e non vengono retrodatati.

## Processi

| Processo | Record originale | Esito |
|---|---|---|
| Adattatore di pubblicazione, fixture positive e negative | [4000917478-command-65255-0](../../spikes/results/2026-10-13-pool-worker-dispatch/processes/publisher-selftest/report.lisp) | OK, STABLE, exit 0 |
| Reader native/HTML strict e self-test | [4000917499-command-65649-0](../../spikes/results/2026-10-13-pool-worker-dispatch/processes/coverage-reader/report.lisp) | OK, STABLE, exit 0 |
| Sensore strict e self-test | [4000917499-command-65650-0](../../spikes/results/2026-10-13-pool-worker-dispatch/processes/selftest/report.lisp) | OK, STABLE, exit 0 |
| Copertura e scheduler completo | [4000917538-command-66469-0](../../spikes/results/2026-10-13-pool-worker-dispatch/processes/coverage/report.lisp) | OK, STABLE, exit 0 |
| Tre campagne locali | [4000917578-command-67114-0](../../spikes/results/2026-10-13-pool-worker-dispatch/processes/benchmark/report.lisp) | OK, STABLE, exit 0 |
| Controllo completo congelato | [4000917476-command-65223-0](../../spikes/results/2026-10-13-pool-worker-dispatch/processes/check-core/report.lisp) | OK, STABLE, exit 0 |
| Build, test, lint e trace dopo integrazione | [4000917560-command-66775-0](../../spikes/results/2026-10-13-pool-worker-dispatch/processes/integrated-build/report.lisp) | OK, STABLE, exit 0 |

Le **14 nuove prove** passano; scheduler completo **67/67**. Usano due
writer reali con ordinali differenti, routing senza begin implicito e doppia
lease esplicita, batch confermati e fine del bridge. Verificano binding e owner
prima di ACK/claim, assenza di routing per INACTIVE/EMPTY/BUSY, ritiro pendente,
writer-busy con guard CAS e retry dell'obbligo, ricircolo full A→B e routing
del nuovo writer. Il lookup CLAIMED ignora le parole pool deliberatamente
incoerenti, mentre il gate IDLE conserva il rifiuto.

La prova di attivazione seguita da routing invalido usa un claim reale:
ACK confermato, writer/home e obbligo conservati in FAULTED, causa EQ e
controller invariati. La richiesta di attivazione è una FI quiescente del
coordinatore, non una gara casuale. Altre FI dichiarate verificano preimage
su fasi/debiti corrotti, binding privati e ritorni writer/status incoerenti;
le sentinelle di funzione sono ripristinate. Non si deduce una qualifica
dei protocolli C1 dai soli quattordici test nuovi.

Il controllo completo congelato passa **1148 prove nominate del prodotto,
due smoke e quattro fixture del linter**, oltre a lint, trace, link,
self-test degli strumenti, conservazione e dieci spike. Dura 241,266408
secondi; i 1154 marker `ok` includono le quattro fixture, senza chiamarle
test del prodotto. Compilazione senza warning/style-warning; stderr contiene
le note del compilatore, conservate nell'originale.

## Copertura

Il dato SB-COVER nativo e cinque pagine HTML originali concordano sull'intero
scope, **110/114 espressioni (96,49%) e 10/10 rami nativi (100%)**.
Il gate C3 preregistrato del 95% è superato, con **nessuna esclusione manuale**.
Il nativo originale occupa 2306672 byte; [audit della biblioteca](../../spikes/results/2026-10-13-pool-worker-dispatch/data/coverage-audit/coverage-audit.lisp)
e [audit dispatch](../../spikes/results/2026-10-13-pool-worker-dispatch/data/dispatch-coverage-audit/coverage-dispatch-audit.lisp)
conservano conteggi e percorsi mancanti.

| File | Espressioni | Rami nativi |
|---|---:|---:|
| `package.lisp` | 1/1 | 0/0 |
| `types.lisp` | 40/40 | 8/8 |
| `build.lisp` | 24/24 | 2/2 |
| `claim.lisp` | 45/49 | 0/0 |

I quattro missing sono nel solo `otherwise` di `claim.lisp:31`, che rifiuta
uno status fuori dal dominio ftype del gate. Rimangono nei 114 elementi del
denominatore. Percorsi nativi 31–34: `(1 4 3 3 4 3)`,
`(1 1 4 3 3 4 3)`, `(2 1 4 3 3 4 3)`, `(3 1 4 3 3 4 3)`.
Il denominatore zero dei rami di `claim.lisp` è quello emesso da SBCL;
non equivale ad assenza di decisioni nel sorgente. Nessuna inferenza MC/DC,
nessuna copertura dei delegati C1 nel denominatore del dispatcher.

## Misura locale

Tre campagne separate, ciascuna con cinque repliche da 4096 cicli e
128 warmup: **20480 cicli misurati per campagna**, quindici campioni nel
[rapporto originale](../../spikes/results/2026-10-13-pool-worker-dispatch/data/benchmark/report.lisp).
Factory, risoluzione API e GC precedono il clock. Quattro chiamate per ciclo:
EMPTY ruota 1/2/3/0; INACTIVE conserva il cursore 2; ROUTE-CURRENT seleziona
quattro volte lo stesso collegamento IDLE di un CLAIMED stabile.
Quest'ultima include oracoli scalari di fase/identità: claim iniziale e drain
finale sono fuori clock, nessun begin, lease o pop nella misura.

| Replica | Tick EMPTY | Tick INACTIVE | Tick ROUTE-CURRENT | Heap per campagna |
|---|---:|---:|---:|---:|
| 0 | 5110 | 1505 | 2021 | 0 |
| 1 | 5896 | 1057 | 2307 | 0 |
| 2 | 6652 | 1226 | 2290 | 0 |
| 3 | 5518 | 1676 | 2167 | 0 |
| 4 | 7346 | 1377 | 2175 | 0 |

SBCL 2.6.9, ARM64, Apple M4, Darwin 27.0.0, safety 3, clock 1000000
unità/s. Ogni campione completa 4096 cicli, heap osservato zero e sink
esatto: 8435712 EMPTY, 8468480 INACTIVE, 8501248 ROUTE-CURRENT.
Il controllo positivo rileva 16777472 byte deliberati; i self-test
rilevano sink errati, tutti i ritorni difformi, clock sotto risoluzione,
CLI invalida e perdita di raw parziali o destinazioni preesistenti.

Il carico esterno e gli altri processi di verifica sono incontrollati.
Nessuna soglia temporale, taratura o conclusione sul throughput del motore.
Heap zero osservato non dimostra assenza universale di allocazioni e la
misura non comprende un nuovo claim con writer realmente accodato.

## Sviluppo, integrazione e limiti

Nessun tentativo formale sopra elencato è fallito. I primi due runner di
sviluppo dei test fallivano per dichiarazioni IGNORE nella macro fixture;
il terzo aveva debiti FI incompatibili con le fasi del routing C1. Il quarto
passa 13 prove; il quinto passa le 14 definitive. Tutti i log e snapshot
restano diagnostica di sviluppo, distinti dalla qualifica congelata.
Il self-test preliminare del sensore falliva nel caricamento di quella
prima fixture con warning; il secondo è passato. Non si promuovono errori
di sviluppo a prove superate. Gli intermedi FASL sono esclusi dai bundle
UTF-8 di sviluppo; native/HTML originali restano conservati.

Il commit `bfbf687929e1f28f67ddd1a21dbab5334b8e1a67` è stato integrato
con `06cc1354cd6843c40da0570e5314fef7cf68a667`, che aggiunge la suite
GET ACTIVE. Il merge `8df3608c63c85f9d72b5c22d8d0fce67020290e5`
conserva byte per byte quattro sorgenti dispatcher, test e sensore.
Changelog e indice documentale conservano entrambe le aggiunte.
Il controllo integrato passa **1176 prove nominate e due smoke**,
compilazione strict, 198 sorgenti senza violazioni lint e trace senza errori.
Dura 34,333722 secondi. Le 28 prove GET ACTIVE entrate nel merge spiegano
la differenza rispetto al set congelato; la copertura e i dieci spike non
vengono attribuiti retroattivamente al merge.

La conservazione riusa i writer C4 verificati, con namespace nuovo e manifesto
specifico delle tre API e dei quattro sorgenti. Le famiglie generiche legacy
restano dichiarate e non ampliano lo scope. L'adattatore di pubblicazione
supera una fixture positiva e cinque negative, per sorgenti runtime mancanti
e impronta alterata, senza pubblicare quei dati di prova.

Non sono realizzati loop server, avvio/arresto fisico, park/wake, sensori
reali, admission, esecuzione dei payload o coordinamento dell'Archivio.
I protocolli C1 e durevoli restano invariati; REQ-THR-001 e i gate del
motore completo rimangono aperti.
")))
