(:SCHEMA-VERSION 1 :KIND :POOL-WORKER-LIFECYCLE-QUALIFIED-SOURCES :VERSION
 "a5715a1aa0b2571d650d1b794e9bb7b7324e951e" :PART 1 :PARTS 1 :SOURCES
 ((:PATH
   #A((72) BASE-CHAR . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/CHANGELOG.md")
   :BYTES 19136 :SHA256 "3e5a5dcb2c1c17d5be0deb4bb75bda72b23380e8ee0d91629b44879267df0b35"
   :GIT-BLOB "dba1bc4ebacb24b7cecb11d344f3fc8235034222" :TEXT "# Changelog

Formato basato su [Keep a Changelog](https://keepachangelog.com/it-IT/1.1.0/). Il progetto
non ha ancora rilasci; le versioni seguiranno la [roadmap](docs/roadmap.md).

## [Non rilasciato]

### Aggiunto

- Ricircolo esplicito dal dispatcher alla Serie: pubblica l'obbligo e termina
  IDLE se c'è spazio; a ring pieno restituisce il link del nuovo writer
  CLAIMED dopo un solo scambio FIFO. Nessun gate del pool, ritiro o nuova
  presa impliciti; busy e guasti conservano i confini execution esistenti.

- Composizione di array CBOR da elementi già codificati: verifica completa
  prima della scrittura, testata minima e budget comprensivi della radice.
  Sorgente e indice condivisibili in lettura, destinazione e scratch privati
  per worker. Profilo documentale e qualifica C1 restano aperti.

- Dispatcher logico dal pool al collegamento della Serie: binding preallocato
  sul medesimo contesto, routing solo dopo una presa autorizzata e ingresso
  distinto per completare gli obblighi già CLAIMED. Nessun begin, pop o retry
  implicito; ritiro e diagnosi conservano i confini C1 esistenti.

- Pubblicazione del checkpoint recuperato: rinomina ancorata alla directory
  preparata, verifica delle foglie contro i FD del nuovo e vecchio control log,
  controllo del nome installato e fsync del parent. Gettone locale unico con
  cleanup prima del CAS; errori terminali senza retry, rollback o risultati
  parziali. Recovery completo e qualifica delle nuove chiamate restano aperti.

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
   #A((72) BASE-CHAR . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/arcdocdb.asd")
   :BYTES 15798 :SHA256 "ef5423225107a6b33e1eb71d4713dfd77ad441e5af6e07cdb2c95bf0bbb0ffb6"
   :GIT-BLOB "056319d9fe4b6b02b72c76627e0eb99578e34e51" :TEXT
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
                             (:file \"cbor-float-narrow\") (:file \"cbor-float-write\")
                             (:file \"cbor-array-input\") (:file \"cbor-array-write\")))
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
                             (:file \"native\") (:file \"native-namespace\") (:file \"lifecycle\") (:file \"identity\")
                             (:file \"rename\") (:file \"namespace\") (:file \"transfer\") (:file \"flush\")))
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
                :components ((:file \"package\") (:file \"types\") (:file \"build\") (:file \"claim\")
                             (:file \"recycle\")))
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
                             (:file \"build\") (:file \"preflight\") (:file \"transfer\") (:file \"prepare\")
                             (:file \"publication\") (:file \"publication-read\"))))
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
                             (:file \"cbor-float-write-threads\")
                             (:file \"cbor-array-write-support\") (:file \"cbor-array-write\")
                             (:file \"cbor-array-write-threads\")))
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
                             (:file \"pool-claim\") (:file \"dispatch\") (:file \"pool-recycle\")))
               (:module \"storage\"
                :serial t
                :components ((:file \"support\") (:file \"segment-header\") (:file \"log-header\")
                             (:file \"compaction-scan\")
                             (:file \"control-payload\")))
               (:module \"io\" :serial t
                :components ((:file \"support\") (:file \"transfer\") (:file \"native\")
                             (:file \"rename\") (:file \"rename-native\")))
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
             (uiop:symbol-call '#:arcdocdb.cbor.array.write.tests '#:run)
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
   #A((90) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/docs/implementazione/README.md")
   :BYTES 9991 :SHA256 "866bee34870a0419f7750438af7374d6a858659aec851e35cef52541a8c740c9" :GIT-BLOB
   "0b08094c9a50c15cf3a6f597ff5ea5cb48b0f910" :TEXT "# Implementazione

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
| Composizione degli array CBOR | [Item verificati, budget della radice e scratch privato](cbor-array.md), [verifiche](cbor-array-risultati.md) | [`src/codec/cbor-array-write.lisp`](../../src/codec/cbor-array-write.lisp) |
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
| Ricircolo pool/Serie | [Un solo trasferimento ready e routing del nuovo CLAIMED](pool-recycle.md) | [`src/dispatch/recycle.lisp`](../../src/dispatch/recycle.lisp) |
| Confine I/O | [Append, pread e flush durevole](io.md) | [`src/io/`](../../src/io/) |
| Rinomina nella directory | [FD parent, cambio atomico e fail-stop locale](io-rinomina.md) | [`src/io/rename.lisp`](../../src/io/rename.lisp) |
| Associazione dei file | [Device/inode e capacità readonly/append del medesimo ACTIVE](associazione-file.md) | [`src/io/identity.lisp`](../../src/io/identity.lisp) |
| Nuovo segmento writer | [Header durevole, rilettura, directory e sorgente certificata](inizializzazione-active.md) | [`src/active/`](../../src/active/) |
| ACTIVE vuoto | [Radice iniziale, CLOSED recuperati e primo lotto](get-active-vuoto.md) | [active-init.lisp](../../src/get-resolver/active-init.lisp) |
| Checkpoint del control log | [EDIT completo, piano privato e preparazione durevole a blocchi](checkpoint-control.md) | [`src/control/`](../../src/control/) |
| Pubblicazione del control log | [Rinomina ancorata, identità dei nomi e gettone unico](pubblicazione-control.md) | [`src/control/publication.lisp`](../../src/control/publication.lisp) |
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
   #A((97) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/docs/implementazione/pool-dispatch.md")
   :BYTES 5168 :SHA256 "1637ddfee4a304e4683b41c36c4993babaf880c99643f3733cd7964eaf0cc294" :GIT-BLOB
   "5156c7f15add2f2fc1551b7d739e83b3d0bc4c7a" :TEXT "# Collegamento dal pool alla Serie

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
| `ricircola-collegamento-pool dispatcher` | Solo RESCHEDULE: un ricircolo, poi routing del nuovo CLAIMED se full; altrimenti pubblica e termina IDLE. Restituisce link/NIL, status e count della partizione. |

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
RESCHEDULE. Dopo `:schedule` il caller invoca esplicitamente
`ricircola-collegamento-pool`, oppure ricircola o cede l'obbligo con le API
execution. Se il ricircolo diretto assegna un nuovo CLAIMED, usa
`collega-obbligo-pool`; l'adattatore di ricircolo restituisce già il suo link.
Dopo una pubblicazione riuscita il contesto torna
IDLE e può applicare il ritiro con la successiva nuova presa.

Il [ricircolo esplicito](pool-recycle.md) risolve il singolo obbligo senza
consultare il pool. Il dispatcher non include begin, pop, end, retry, cleanup
o rollback. I rifiuti writer-busy e Serie-busy mantengono gli stati differenti
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
   #A((85) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/src/dispatch/package.lisp")
   :BYTES 516 :SHA256 "7f1eea26b8d8fd34186a85cff9aebae5842dc731de45b361058e0af4788090e8" :GIT-BLOB
   "fe810cbefc4d0de0d1aabae5e26117dc70bd2a70" :TEXT
   ";;;; Dispatcher logico, caricato dopo il routing e il governo del pool.
;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(defpackage #:arcdocdb.scheduler.dispatch
  (:use #:cl)
  (:import-from #:arcdocdb.binary #:index)
  (:import-from #:arcdocdb.conditions #:invalid-argument #:resource-exhausted
                #:invariant-violation)
  (:export #:dispatcher-writer-pool #:crea-dispatcher-writer-pool
           #:prendi-collegamento-pool #:collega-obbligo-pool #:ricircola-collegamento-pool))
")
  (:PATH
   #A((83) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/src/dispatch/types.lisp")
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
   #A((83) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/src/dispatch/build.lisp")
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
   #A((83) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/src/dispatch/claim.lisp")
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
   #A((85) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/src/dispatch/recycle.lisp")
   :BYTES 2612 :SHA256 "9fa3294cd28d1904cfb8db5153f93188b02f1bfbaf1800dad788731007c29ad0" :GIT-BLOB
   "adcd65ee5fd683d70a40b89b31a2edf7fc93994c" :TEXT
   ";;;; Risolve un obbligo RESCHEDULE prima di consultare nuovamente il pool.
;;; OWNER: dispatcher, contesto e link del thread creatore, senza reentrancy.
;;; SHARED: una partizione ready home per tratto (ADR-0045 §8), poi routing immutabile.
(in-package #:arcdocdb.scheduler.dispatch)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-CON-004 REQ-AFF-008
(declaim (notinline %check-recycle-status))
(declaim (ftype (function (t) (member :claimed :published)) %check-recycle-status))
(defun %check-recycle-status (status)
  \"Pre: ritorno del delegato, verificato come T senza propagare assunzioni ftype.
Post: status noto; INVARIANT-VIOLATION inatteso senza mutare contesto o ready.
NOTINLINE mantiene il controllo al confine anche con FI fuori tipo del delegato.\"
  (case status
    ((:claimed :published) status)
    (otherwise (error 'invariant-violation :reason :pool-dispatcher-state))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (dispatcher-writer-pool)
                         (values (or null arcdocdb.execution.series:collegamento-worker-serie)
                                 (member :claimed :published) index &optional))
                ricircola-collegamento-pool))
(defun ricircola-collegamento-pool (dispatcher)
  \"Pre: owner corrente, RESCHEDULE con obbligo unico e bridge precedente chiuso.
Post: una sola operazione ready: NIL/PUBLISHED/count e IDLE, oppure link IDLE del
nuovo CLAIMED/count. Count della partizione, non cursore; nessun begin implicito.
Non legge il pool né conferma ritiro; busy conserva obbligo e retry esplicito.
Binding prima del trasferimento; errori C1 conservano i propri confini.
Routing fallito dopo full conserva lo scambio, senza rollback o nuovo fault C3.\"
  (let ((port (dispatcher-writer-pool-port dispatcher))
        (table (dispatcher-writer-pool-table dispatcher)))
    (%check-dispatcher-binding port table)
    (multiple-value-bind (writer outcome count)
        (arcdocdb.execution:ricircola-worker
         (arcdocdb.scheduler::porta-worker-pool-context port))
      (let ((status (%check-recycle-status outcome)))
        (case status
          (:claimed
           (unless writer (error 'invariant-violation :reason :pool-dispatcher-state))
           (values (arcdocdb.execution.series:collega-writer-worker-serie table) status count))
          (:published
           (when writer (error 'invariant-violation :reason :pool-dispatcher-state))
           (values nil status count))
          (otherwise (error 'invariant-violation :reason :pool-dispatcher-state)))))))
")
  (:PATH
   #A((93) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/tests/scheduler/pool-recycle.lisp")
   :BYTES 25923 :SHA256 "079a58b0c8850df0be62c71229e25d052fb716f36f1996e9e8ab2c4c2a38fa86"
   :GIT-BLOB "3c779589cd7df6ae1146c2ca50b70320093bbf4a" :TEXT
   ";;;; Ricircolo pool: un trasferimento ready e routing del solo obbligo CLAIMED.
;;;; OWNER: fixture, porta, dispatcher e bridge sul thread creatore.
;;;; FI quiescenti dichiarate: immagini, binding/parole corrotti e sentinelle ripristinate.
(in-package #:arcdocdb.scheduler.tests)

(defun pool-recycle-check (dispatcher link status count)
  \"Oracolo dei tre valori; count atteso dal caller, mai derivato dal cursore.\"
  (is (equal (list link status count)
             (multiple-value-list
              (arcdocdb.scheduler.dispatch:ricircola-collegamento-pool dispatcher)))))

(defun pool-recycle-reschedule (dispatcher context ready writers home)
  \"A viene acquisito e termina realmente un primo quantum con obbligo RESCHEDULE.\"
  (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready home (svref writers 0))))
  (arcdocdb.execution.tests::worker-check-claim
   context (svref writers 0) :claimed
   (mod (1+ home) (length (arcdocdb.execution::lista-writer-pronti-partitions ready))))
  (pool-dispatch-finish
   (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a1 :schedule)
  (is (eq :reschedule (arcdocdb.execution:stato-worker-writer context))))

(defun pool-recycle-without-gate (thunk)
  \"FI di chiamata: nessun nuovo claim o ACK lifecycle durante un obbligo esistente.\"
  (pool-claim-function-fi
   'arcdocdb.scheduler:prendi-writer-pool
   (lambda (port) (declare (ignore port)) (error \"Nuovo gate durante ricircolo.\"))
   (lambda ()
     (pool-claim-function-fi
      'arcdocdb.scheduler:applica-stato-worker-pool
      (lambda (port) (declare (ignore port)) (error \"ACK pool durante ricircolo.\"))
      thunk))))

(defun pool-recycle-refusal (dispatcher port table writers type reason)
  (pool-dispatch-refusal
   port table writers
   (lambda () (arcdocdb.scheduler.dispatch:ricircola-collegamento-pool dispatcher))
   type reason))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-recycle-room-publishes-once-without-second-claim-or-routing
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :shards 3 :capacity 2 :start 1)
    (pool-recycle-reschedule dispatcher context ready writers 2)
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 (svref writers 1))))
    (let ((series-before (map 'list #'pool-dispatch-series-image controllers))
          (cursor (arcdocdb.execution::contesto-worker-writer-cursor context))
          (home (arcdocdb.execution::contesto-worker-writer-home context))
          (calls 0) (original (fdefinition 'arcdocdb.execution:ricircola-worker)))
      (is (zerop cursor)) (is (= 2 home))
      (pool-recycle-without-gate
       (lambda ()
         (pool-claim-function-fi
          'arcdocdb.execution:ricircola-worker
          (lambda (worker) (incf calls) (funcall original worker))
          (lambda ()
            (pool-claim-function-fi
             'arcdocdb.execution.series:collega-writer-worker-serie
             (lambda (routing) (declare (ignore routing))
               (error \"Routing dopo pubblicazione senza nuovo obbligo.\"))
             (lambda () (pool-recycle-check dispatcher nil :published 2)))))))
      (is (= 1 calls))
      (is (eq :idle (arcdocdb.execution:stato-worker-writer context)))
      (is (null (arcdocdb.execution:writer-worker-writer context)))
      (is (= cursor (arcdocdb.execution::contesto-worker-writer-cursor context)))
      (is (= home (arcdocdb.execution::contesto-worker-writer-home context)))
      (is (equalp series-before (map 'list #'pool-dispatch-series-image controllers)))
      (is (equal '(1 1 nil) (lifecycle-words port))))
    ;; L'oracolo FIFO B poi A e indipendente dagli indici privati del ring.
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 1) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :b1 :idle)
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)
    (is (every (lambda (link) (eq :idle (arcdocdb.execution.series:stato-worker-serie link)))
               (arcdocdb.execution.series::tabella-worker-serie-links table)))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-recycle-full-routes-new-writer-without-begin-or-cursor-change
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :shards 3 :start 1)
    (pool-recycle-reschedule dispatcher context ready writers 2)
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 (svref writers 1))))
    (let* ((links (arcdocdb.execution.series::tabella-worker-serie-links table))
           (right (svref links 1))
           (series-before (map 'list #'pool-dispatch-series-image controllers))
           (left-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0)))
           (right-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 1)))
           (other-before (loop for i below 2 collect
                              (arcdocdb.execution.tests::ready-fi-snapshot
                               (arcdocdb.execution.tests::ready-test-partition ready i))))
           (original (fdefinition 'arcdocdb.execution:ricircola-worker)) (calls 0))
      (pool-recycle-without-gate
       (lambda ()
         (pool-claim-function-fi
          'arcdocdb.execution:ricircola-worker
          (lambda (worker) (incf calls) (funcall original worker))
          (lambda () (pool-recycle-check dispatcher right :claimed 1)))))
      (is (= 1 calls))
      (is (eq (svref writers 1) (arcdocdb.execution:writer-worker-writer context)))
      (is (eq :claimed (arcdocdb.execution:stato-worker-writer context)))
      (is (eq :idle (arcdocdb.execution.series:stato-worker-serie right)))
      (is (= 0 (arcdocdb.execution::contesto-worker-writer-cursor context)))
      (is (= 2 (arcdocdb.execution::contesto-worker-writer-home context)))
      (is (zerop (arcdocdb.execution::contesto-worker-writer-lease context)))
      (is (zerop (arcdocdb.execution::contesto-worker-writer-pending context)))
      (is (equalp series-before (map 'list #'pool-dispatch-series-image controllers)))
      (is (equalp left-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0))))
      (is (equalp right-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 1))))
      (is (equalp other-before (loop for i below 2 collect
                                    (arcdocdb.execution.tests::ready-fi-snapshot
                                     (arcdocdb.execution.tests::ready-test-partition ready i)))))
      (is (equal '(1 1 nil) (lifecycle-words port)))
      (pool-dispatch-finish right :b1 :idle))
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-004-pool-recycle-ready-busy-preserves-complete-obligation-and-ring
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable controllers))
    (pool-recycle-reschedule dispatcher context ready writers 0)
    (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 1))))
    ;; Vera guardia CAS detenuta dalla fixture; nessun BUSY sintetico.
    (arcdocdb.execution.tests::ready-call-with-guards
     (list (arcdocdb.execution.tests::ready-test-partition ready 0))
     (lambda ()
       (pool-recycle-without-gate
        (lambda () (pool-recycle-refusal dispatcher port table writers
                                          'resource-exhausted :ready-queue-busy)))))
    (pool-recycle-check dispatcher
                        (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 1)
                        :claimed 1)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :b1 :idle)
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-recycle-six-disallowed-phases-preserve-debts-and-first-fault
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable controllers))
    (flet ((refuse () (pool-recycle-refusal dispatcher port table writers
                                             'resource-exhausted :worker-state)))
      (refuse)
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 0))))
      (pool-dispatch-check dispatcher
                           (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 0)
                           :claimed 0 :unchanged)
      (refuse)
      (let* ((link (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher))
             (token (pool-claim-bridge-begin link)))
        (refuse)
        (let ((batch (pool-claim-bridge-pop link token :a1)))
          (refuse)
          (is (null (arcdocdb.execution.series:conferma-worker-serie link token batch))))
        (lifecycle-queue-busy
         (arcdocdb.execution::writer-programmabile-queue (svref writers 0))
         (lambda ()
           (signals resource-exhausted
             (arcdocdb.execution.series:termina-worker-serie link token) :writer-queue-busy)
           (is (eq :finishing (arcdocdb.execution:stato-worker-writer context)))
           (refuse)))
        (is (eq :schedule (arcdocdb.execution.series:termina-worker-serie link token))))
      (pool-recycle-check dispatcher nil :published 1)
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-dispatch-finish
       (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)
      ;; FI diagnostica quiescente: FAULTED conserva esattamente la prima causa.
      (let ((original (make-condition 'invariant-violation :reason :worker-state)))
        (setf (arcdocdb.execution::contesto-worker-writer-state context) :faulted
              (arcdocdb.execution::contesto-worker-writer-fault context) original)
        (refuse)
        (is (eq original (arcdocdb.execution:errore-worker-writer context)))))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-recycle-existing-obligation-ignores-inactive-and-corrupt-words
  (dolist (scenario '(:inactive :corrupt :retire))
    (with-pool-dispatch (dispatcher port context ready table writers controllers
                                   :active (not (eq scenario :inactive)))
      (declare (ignorable controllers))
      (pool-recycle-reschedule dispatcher context ready writers 0)
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 0 (svref writers 1))))
      ;; FI coordinator quiescente; il ricircolo non deve leggere queste parole.
      (case scenario
        (:corrupt (setf (arcdocdb.scheduler::porta-worker-pool-request port) 4
                        (arcdocdb.scheduler::porta-worker-pool-ack port) 0))
        (:retire (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)))
      (let ((words (lifecycle-words port)))
        (pool-recycle-without-gate
         (lambda ()
           (pool-recycle-check
            dispatcher (svref (arcdocdb.execution.series::tabella-worker-serie-links table) 1)
            :claimed 1)))
        (is (equal words (lifecycle-words port)))
        (pool-dispatch-finish
         (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :b1 :idle)
        (is (equal words (lifecycle-words port))))
      (when (eq scenario :retire)
        (pool-dispatch-check dispatcher nil :inactive 0 :retired)
        (is (equal '(2 2 nil) (lifecycle-words port))))
      (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
      (pool-dispatch-finish
       (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-002-pool-recycle-room-does-not-acknowledge-pending-retire
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable table controllers))
    (pool-recycle-reschedule dispatcher context ready writers 0)
    (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
    (pool-recycle-without-gate (lambda () (pool-recycle-check dispatcher nil :published 1)))
    (is (equal '(2 1 nil) (lifecycle-words port)))
    (is (eq :idle (arcdocdb.execution:stato-worker-writer context)))
    (pool-dispatch-check dispatcher nil :inactive 0 :retired)
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-recycle-binding-refuses-before-transfer
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable controllers))
    (pool-recycle-reschedule dispatcher context ready writers 0)
    (let* ((other (arcdocdb.execution:crea-contesto-worker-writer ready))
           (bad-table (arcdocdb.execution.series::%make-tabella-worker-serie
                       other (arcdocdb.execution.series::tabella-worker-serie-registry table)
                       (arcdocdb.execution.series::tabella-worker-serie-links table)))
           (bad (arcdocdb.scheduler.dispatch::%make-dispatcher-writer-pool port bad-table)))
      (pool-claim-function-fi
       'arcdocdb.execution:ricircola-worker
       (lambda (worker) (declare (ignore worker)) (error \"Trasferimento dopo binding errato.\"))
       (lambda () (pool-recycle-refusal bad port table writers
                                         'invalid-argument :pool-dispatcher-binding)))
      (is (eq :idle (arcdocdb.execution:stato-worker-writer other))))
    (pool-recycle-check dispatcher nil :published 1)
    (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
    (pool-dispatch-finish
     (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-recycle-foreign-owner-precedes-binding-and-pool-data
  (let ((worker (lifecycle-fixture-start t)) (dispatcher nil) (table nil) (writers nil)
        (left-file nil) (right-file nil))
    (unwind-protect
         (progn
           (lifecycle-call
            worker
            (lambda (owned)
              (multiple-value-bind (left resource) (pool-claim-series 85)
                (setf left-file resource)
                (multiple-value-bind (right resource) (pool-claim-series 86)
                  (setf right-file resource writers (vector (pool-claim-writer '(:a1 :a2) 0)
                                                           (pool-claim-writer '(:b1) 1))
                        table (arcdocdb.execution.series:crea-tabella-worker-serie
                               (lifecycle-fixture-context owned)
                               (arcdocdb.execution.series:crea-registro-worker-serie
                                writers (vector left right)))
                        dispatcher (arcdocdb.scheduler.dispatch:crea-dispatcher-writer-pool
                                    (lifecycle-fixture-port owned) table))))
              (pool-recycle-reschedule dispatcher (lifecycle-fixture-context owned)
                                       (pool-claim-ready (lifecycle-fixture-context owned)) writers 0)
              :ok))
           (let* ((port (lifecycle-fixture-port worker))
                  (ready (pool-claim-ready (lifecycle-fixture-context worker)))
                  (other (arcdocdb.execution:crea-contesto-worker-writer ready))
                  (bad-table (arcdocdb.execution.series::%make-tabella-worker-serie
                              other (arcdocdb.execution.series::tabella-worker-serie-registry table)
                              (arcdocdb.execution.series::tabella-worker-serie-links table)))
                  (bad (arcdocdb.scheduler.dispatch::%make-dispatcher-writer-pool port bad-table)))
             (setf (arcdocdb.scheduler::porta-worker-pool-request port) 4)
             (pool-recycle-refusal bad port table writers 'invalid-argument :pool-worker-owner)
             (setf (arcdocdb.scheduler::porta-worker-pool-request port) 1))
           (lifecycle-call
            worker
            (lambda (owned)
              (let ((context (lifecycle-fixture-context owned)))
                (pool-recycle-check dispatcher nil :published 1)
                (arcdocdb.execution.tests::worker-check-claim context (svref writers 0) :claimed 0)
                (pool-dispatch-finish
                 (arcdocdb.scheduler.dispatch:collega-obbligo-pool dispatcher) :a2 :idle)) :ok)))
      (when left-file
        (lifecycle-call worker (lambda (owned) (declare (ignore owned))
                                 (when right-file (arcdocdb.io:chiudi right-file))
                                 (arcdocdb.io:chiudi left-file) :ok)))
      (lifecycle-fixtures-stop (list worker)))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-recycle-routing-fault-keeps-completed-full-transfer
  (with-pool-dispatch (dispatcher port context ready table writers controllers
                                 :shards 3 :start 1)
    (pool-recycle-reschedule dispatcher context ready writers 2)
    (let* ((unknown (pool-claim-writer '(:unknown) 2))
           (series-before (map 'list #'pool-dispatch-series-image controllers))
           (left-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0)))
           (unknown-before (arcdocdb.execution.tests::handoff-fi-snapshot unknown)))
      (is (= 1 (arcdocdb.execution:pubblica-writer-pronto ready 2 unknown)))
      (setf (arcdocdb.scheduler::porta-worker-pool-request port) 2)
      (let ((condition
              (arcdocdb.execution.tests::worker-capture-condition
               (lambda () (arcdocdb.scheduler.dispatch:ricircola-collegamento-pool dispatcher))
               'invariant-violation :worker-serie-routing)))
        (is (eq :faulted (arcdocdb.execution:stato-worker-writer context)))
        (is (eq unknown (arcdocdb.execution:writer-worker-writer context)))
        (is (eq condition (arcdocdb.execution:errore-worker-writer context)))
        (is (= 0 (arcdocdb.execution::contesto-worker-writer-cursor context)))
        (is (= 2 (arcdocdb.execution::contesto-worker-writer-home context)))
        (is (zerop (arcdocdb.execution::contesto-worker-writer-lease context)))
        (is (zerop (arcdocdb.execution::contesto-worker-writer-pending context)))
        (is (equal '(2 1 nil) (lifecycle-words port)))
        (is (equalp series-before (map 'list #'pool-dispatch-series-image controllers)))
        (is (equalp left-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0))))
        (is (equalp unknown-before (arcdocdb.execution.tests::handoff-fi-snapshot unknown)))
        (pool-recycle-refusal dispatcher port table writers 'resource-exhausted :worker-state)
        (is (eq condition (arcdocdb.execution:errore-worker-writer context))))
      ;; Dopo il fault il vecchio A e gia nel ring: nessun rollback dello scambio.
      (multiple-value-bind (writer status next) (arcdocdb.execution:preleva-writer-pronto ready 2)
        (is (eq writer (svref writers 0))) (is (eq status :writer)) (is (zerop next))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-recycle-contradictory-output-refuses-before-routing-without-c3-fault
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable context ready controllers))
    ;; FI quiescente di contratto: combinazioni ammesse dai tipi ma incoerenti.
    (dolist (status '(:claimed :published))
      (pool-claim-function-fi
       'arcdocdb.execution:ricircola-worker
       (lambda (worker) (declare (ignore worker))
         (values (and (eq status :published) (svref writers 0)) status 1))
       (lambda ()
         (pool-claim-function-fi
          'arcdocdb.execution.series:collega-writer-worker-serie
          (lambda (routing) (declare (ignore routing)) (error \"Routing di output contraddittorio.\"))
          (lambda ()
            (pool-recycle-refusal dispatcher port table writers
                                  'invariant-violation :pool-dispatcher-state))))))))

;;; REQ: REQ-CON-002 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-recycle-invalid-dispatcher-type-has-no-effects
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable dispatcher context ready controllers))
    (let ((before (pool-dispatch-image port table writers)))
      (signals type-error
        (funcall (fdefinition 'arcdocdb.scheduler.dispatch:ricircola-collegamento-pool) :invalid))
      (is (equalp before (pool-dispatch-image port table writers))))))

;;; REQ: REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-004-pool-recycle-ready-invariant-preserves-original-c1-fault
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (pool-recycle-reschedule dispatcher context ready writers 0)
    (let ((partition (arcdocdb.execution.tests::ready-test-partition ready 0)))
      ;; FI quiescente: indice fuori capienza ma dentro il tipo INDEX dello slot.
      ;; Il verificatore C1 sotto guard reale deve produrre la causa originale.
      (setf (arcdocdb.execution::partizione-pronta-head partition) 1)
      (let ((ring-before (arcdocdb.execution.tests::ready-fi-snapshot partition))
            (writer-before (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0)))
            (series-before (map 'list #'pool-dispatch-series-image controllers))
            (links-before (map 'list #'pool-dispatch-link-image
                               (arcdocdb.execution.series::tabella-worker-serie-links table))))
        (let ((condition
                (arcdocdb.execution.tests::worker-capture-condition
                 (lambda () (arcdocdb.scheduler.dispatch:ricircola-collegamento-pool dispatcher))
                 'invariant-violation :ready-queue-invariant)))
          (is (eq :faulted (arcdocdb.execution:stato-worker-writer context)))
          (is (eq condition (arcdocdb.execution:errore-worker-writer context)))
          (is (eq (svref writers 0) (arcdocdb.execution:writer-worker-writer context)))
          (is (zerop (arcdocdb.execution::contesto-worker-writer-lease context)))
          (is (zerop (arcdocdb.execution::contesto-worker-writer-pending context)))
          (is (equal '(1 1 nil) (lifecycle-words port)))
          (is (equalp ring-before (arcdocdb.execution.tests::ready-fi-snapshot partition)))
          (is (equalp writer-before
                      (arcdocdb.execution.tests::handoff-fi-snapshot (svref writers 0))))
          (is (equalp series-before (map 'list #'pool-dispatch-series-image controllers)))
          (is (equalp links-before (map 'list #'pool-dispatch-link-image
                                       (arcdocdb.execution.series::tabella-worker-serie-links table))))
          (pool-recycle-refusal dispatcher port table writers 'resource-exhausted :worker-state)
          (is (eq condition (arcdocdb.execution:errore-worker-writer context))))))))

;;; REQ: REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-004-pool-recycle-unknown-status-refuses-at-runtime-without-effects
  (with-pool-dispatch (dispatcher port context ready table writers controllers)
    (declare (ignorable controllers))
    (pool-recycle-reschedule dispatcher context ready writers 0)
    ;; FI quiescente oltre la ftype C1: l'helper NOTINLINE accetta T e mantiene
    ;; il controllo runtime che il compilatore eliminava dal precedente CASE.
    ;; Nessun falso rifiuto di tipo viene scambiato per invariant di prodotto.
    (labels ((reject-status (status)
               (let ((calls 0))
                 (pool-claim-function-fi
                  'arcdocdb.execution:ricircola-worker
                  (lambda (worker) (declare (ignore worker))
                    (incf calls) (values nil status 1))
                  (lambda ()
                    (pool-claim-function-fi
                     'arcdocdb.execution.series:collega-writer-worker-serie
                     (lambda (routing) (declare (ignore routing))
                       (error \"Routing dopo status sconosciuto.\"))
                     (lambda ()
                       (pool-recycle-without-gate
                        (lambda ()
                          (pool-recycle-refusal dispatcher port table writers
                                                'invariant-violation :pool-dispatcher-state)))))))
                 (is (= 1 calls)))))
      (dolist (status (list :unknown nil 0 \"invalid\" '(invalid) #()))
        (reject-status status))
      ;; FI diagnostica indipendente: nemmeno una causa gia presente e sostituita
      ;; da questo errore C3. Il delegato FI non esegue il confine C1 FAULTED.
      (let ((original (make-condition 'invariant-violation :reason :worker-state)))
        (setf (arcdocdb.execution::contesto-worker-writer-state context) :faulted
              (arcdocdb.execution::contesto-worker-writer-fault context) original)
        (reject-status :unknown)
        (is (eq original (arcdocdb.execution:errore-worker-writer context)))))))
")
  (:PATH
   #A((91) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/tools/measure-pool-recycle.lisp")
   :BYTES 20280 :SHA256 "f9f33a86334719cf22a0c6d9f27ccae426895c247c67044ddf52b70200b05c7a"
   :GIT-BLOB "cb20f6d271889a9801106daf230ee934aaa7bf81" :TEXT
   ";;;; C4: ROOM e FULL reali con ricircolo, claim se room, begin/pop/ack/end.
;;;; Cinque fixture indipendenti: 4096 cicli +128 warmup, 4226 payload/writer, quantum1.
;;;; Factory, claim iniziale, GC e drain finale fuori clock; nessun reset privato.
;;;; Il clock include il protocollo C1 che ristabilisce RESCHEDULE e gli oracoli scalari.
;;;; --self-test | --bench directory-nuova/. Feature: :arcdocdb-pool-recycle-measure-library.
;;; REQ: REQ-CON-005 REQ-AFF-008 REQ-THR-001 REQ-BEN-001 REQ-BEN-002
;;; OWNER: dispatcher, contesto, link, target e sensore allo stesso thread C4.
;;; SHARED: ready autentico privato alla fixture; nessun coordinatore concorrente nel clock.
(eval-when (:compile-toplevel :load-toplevel :execute)
  (require :asdf)
  (unless (find-package \"ARCDOCDB.POOL-LIFECYCLE.MEASURE\")
    (let ((*features* (cons :arcdocdb-pool-lifecycle-measure-library *features*)))
      (load \"tools/measure-pool-lifecycle.lisp\"))))
(defpackage #:arcdocdb.pool-recycle.measure
  (:use #:cl)
  (:import-from #:arcdocdb.pool-lifecycle.measure
                #:lookup-function #:sample #:sample-record #:acquire-directory #:write-report
                #:load-product #:+iterations+ #:+warmup+ #:+replicas+))
(in-package #:arcdocdb.pool-recycle.measure)
(declaim (optimize (safety 3) (speed 2) (debug 2)))
(defconstant +payload-count+ 4226)

(defun fingerprints ()
  \"Stabilita: biblioteca, questo sensore e tutti i sorgenti/test prodotto.\"
  (append (arcdocdb.pool-lifecycle.measure::fingerprints)
          (list (list :file \"tools/measure-pool-recycle.lisp\"
                      :md5 (format nil \"~(~{~2,'0X~}~)\"
                                   (coerce (sb-md5:md5sum-file \"tools/measure-pool-recycle.lisp\") 'list))))))
(defun api (name &optional (package \"ARCDOCDB.SCHEDULER.DISPATCH\"))
  \"Risolve API pubbliche prima del clock, senza ricerca nomi nel tratto misurato.\"
  (multiple-value-bind (symbol visibility) (find-symbol name package)
    (unless (and symbol (eq :external visibility) (fboundp symbol))
      (error \"COD-60: API pubblica ~A/~A assente.\" package name))
    (symbol-function symbol)))
(defun make-series ()
  \"Backend pubblico C4 locale, nessun I/O nel protocollo C1 della campagna.\"
  (let* ((backend (funcall (api \"MAKE-BACKEND\" \"ARCDOCDB.IO\")
                           (lambda (path mode) (declare (ignore path mode)) 812)
                           (lambda (&rest arguments) (declare (ignore arguments))
                             (error \"COD-60: lettura I/O inattesa nella fixture recycle.\"))
                           (lambda (fd bytes start count) (declare (ignore fd bytes start)) count)
                           (lambda (fd) (declare (ignore fd)) 0)
                           (lambda (fd) (declare (ignore fd)) 0)
                           (lambda (fd) (declare (ignore fd)) 0)))
         (file (funcall (api \"CREA-TEMPORANEO\" \"ARCDOCDB.IO\") \"pool-recycle-C4.tmp\" :backend backend))
         (log (funcall (api \"CREA-LOG-IO\" \"ARCDOCDB.WAL\") file :segment 812)))
    (values (funcall (api \"CREA-CONTROLLORE-SERIE\" \"ARCDOCDB.SERIES\")
                     (funcall (api \"CREA-REGISTRO-CSN\" \"ARCDOCDB.CSN\") :capacity 4) log :capacity 2)
            file)))
(defun preload-writer (index payload)
  \"4226 payload simbolici immutabili; accettazione e obbligo iniziale verificati fuori clock.\"
  (let ((writer (funcall (api \"CREA-WRITER-PROGRAMMABILE\" \"ARCDOCDB.EXECUTION\")
                          :capacity 8192 :quantum 1 :routing-index index))
        (enqueue (api \"ACCODA-LAVORO-WRITER\" \"ARCDOCDB.EXECUTION\")))
    (dotimes (i +payload-count+)
      (multiple-value-bind (count action) (funcall enqueue writer payload)
        (unless (and (= (1+ i) count) (eq (if (zerop i) :schedule :queued) action))
          (error \"COD-60: preload perde count o obbligo iniziale.\"))))
    writer))
(defun make-fixture (full)
  \"Un ring autentico capacity1, uno/due writer, dispatcher e tabella preallocati.\"
  (multiple-value-bind (controller file) (make-series)
    (let* ((ready (funcall (api \"CREA-LISTA-WRITER-PRONTI\" \"ARCDOCDB.EXECUTION\") :shards 1 :capacity 1))
           (context (funcall (api \"CREA-CONTESTO-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\") ready))
           (other (when full (multiple-value-list (make-series))))
           (port (funcall (api \"CREA-PORTA-WORKER-POOL\" \"ARCDOCDB.SCHEDULER\") context))
           (a (preload-writer 0 :recycle-a)) (b (when full (preload-writer 1 :recycle-b)))
           (writers (if full (vector a b) (vector a)))
           (controllers (if full (vector controller (first other)) (vector controller)))
           (registry (funcall (api \"CREA-REGISTRO-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\")
                              writers controllers))
           (table (funcall (api \"CREA-TABELLA-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\") context registry))
           (links (funcall (lookup-function \"TABELLA-WORKER-SERIE-LINKS\" \"ARCDOCDB.EXECUTION.SERIES\") table))
           (dispatcher (funcall (api \"CREA-DISPATCHER-WRITER-POOL\") port table)))
      (unless (= 1 (funcall (api \"PUBBLICA-WRITER-PRONTO\" \"ARCDOCDB.EXECUTION\") ready 0 a))
        (error \"COD-60: pubblicazione A iniziale difforme.\"))
      (multiple-value-bind (link action cursor lifecycle)
          (funcall (api \"PRENDI-COLLEGAMENTO-POOL\") dispatcher)
        (unless (and (eq (svref links 0) link) (eq :claimed action)
                     (zerop cursor) (eq :unchanged lifecycle))
          (error \"COD-60: claim iniziale difforme.\")))
      (when full
        (unless (= 1 (funcall (api \"PUBBLICA-WRITER-PRONTO\" \"ARCDOCDB.EXECUTION\") ready 0 b))
          (error \"COD-60: pubblicazione B iniziale difforme.\")))
      (values dispatcher context writers links
              (if full (vector file (second other)) (vector file))))))
(defun consume-one (context target payload begin pop ack end)
  \"Una lease, un payload con token, un ack e un end; nessuna collezione di risultati.\"
  (unless (plusp (funcall begin context)) (error \"COD-60: lease non positiva.\"))
  (multiple-value-bind (count status token) (funcall pop context target 0 1)
    (unless (and (= 1 count) (eq :messages status) (plusp token) (eq payload (svref target 0)))
      (error \"COD-60: payload/count/token di pop difforme.\"))
    (funcall ack context token))
  (funcall end context))
(defun verify-recycle (recycle dispatcher expected status count)
  \"Oracolo indipendente su tutti e tre i risultati, compresa identita del link.\"
  (multiple-value-bind (link action actual-count) (funcall recycle dispatcher)
    (unless (and (eq expected link) (eq status action) (eql count actual-count))
      (error \"COD-60: recycle ~S/~S/~S invece di ~S/~S/~S.\"
             link action actual-count expected status count))))
(defun drain-fixture (dispatcher context writers files)
  \"Fuori clock: drena ogni obbligo soltanto con API pubbliche, limite2*4226+4.\"
  (let ((claim (api \"PRENDI-COLLEGAMENTO-POOL\")) (recycle (api \"RICIRCOLA-COLLEGAMENTO-POOL\"))
        (state (api \"STATO-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\"))
        (writer (api \"WRITER-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\"))
        (begin (api \"INIZIA-TRATTO-WORKER\" \"ARCDOCDB.EXECUTION\"))
        (pop (api \"PRELEVA-LAVORI-WORKER\" \"ARCDOCDB.EXECUTION\"))
        (ack (api \"CONFERMA-LAVORI-WORKER\" \"ARCDOCDB.EXECUTION\"))
        (end (api \"TERMINA-TRATTO-WORKER\" \"ARCDOCDB.EXECUTION\")) (target (vector nil)))
    (unwind-protect
         (loop repeat (+ (* 2 +payload-count+) 4)
               do (case (funcall state context)
                    (:reschedule (funcall recycle dispatcher))
                    (:idle (multiple-value-bind (link status) (funcall claim dispatcher)
                             (declare (ignore link))
                             (when (eq status :empty) (return-from drain-fixture :drained))
                             (unless (eq status :claimed) (error \"COD-60: drain claim difforme.\"))))
                    (:claimed nil)
                    (otherwise (error \"COD-60: drain con fase inattesa.\")))
                  (when (eq :claimed (funcall state context))
                    (consume-one context target
                                 (if (eq (svref writers 0) (funcall writer context)) :recycle-a :recycle-b)
                                 begin pop ack end))
               finally (error \"COD-60: drain fuori budget esplicito.\"))
      (loop for file across files do (funcall (api \"CHIUDI\" \"ARCDOCDB.IO\") file)))))
(defun create-cycle (full)
  \"ROOM: recycle+claim+tratto; FULL: recycle+tratto, alternando A/B; un ciclo ritorna RESCHEDULE.\"
  (multiple-value-bind (dispatcher context writers links file) (make-fixture full)
    (let ((recycle (api \"RICIRCOLA-COLLEGAMENTO-POOL\")) (claim (api \"PRENDI-COLLEGAMENTO-POOL\"))
          (begin (api \"INIZIA-TRATTO-WORKER\" \"ARCDOCDB.EXECUTION\"))
          (pop (api \"PRELEVA-LAVORI-WORKER\" \"ARCDOCDB.EXECUTION\"))
          (ack (api \"CONFERMA-LAVORI-WORKER\" \"ARCDOCDB.EXECUTION\"))
          (end (api \"TERMINA-TRATTO-WORKER\" \"ARCDOCDB.EXECUTION\"))
          (state (api \"STATO-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\"))
          (writer (api \"WRITER-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\"))
          (link-state (api \"STATO-WORKER-SERIE\" \"ARCDOCDB.EXECUTION.SERIES\"))
          (cursor (lookup-function \"CONTESTO-WORKER-WRITER-CURSOR\" \"ARCDOCDB.EXECUTION\"))
          (target (vector nil)) (index 0))
      (unless (eq :schedule (consume-one context target :recycle-a begin pop ack end))
        (error \"COD-60: tratto iniziale non produce RESCHEDULE.\"))
      (values
       (lambda ()
         (declare (type fixnum index))
         (when full (setf index (- 1 index)))
         (verify-recycle recycle dispatcher (when full (svref links index))
                         (if full :claimed :published) 1)
         (unless full
           (multiple-value-bind (link status next action) (funcall claim dispatcher)
             (unless (and (eq (svref links 0) link) (eq :claimed status)
                          (zerop next) (eq :unchanged action))
               (error \"COD-60: claim ROOM difforme.\"))))
         (unless (and (eq :claimed (funcall state context))
                      (eq (svref writers index) (funcall writer context))
                      (eq :idle (funcall link-state (svref links index)))
                      (zerop (funcall cursor context)))
           (error \"COD-60: obbligo/link/cursore dopo ricircolo difforme.\"))
         (unless (and (eq :schedule (consume-one context target (if (zerop index) :recycle-a :recycle-b)
                                               begin pop ack end))
                      (eq :reschedule (funcall state context))
                      (eq (svref writers index) (funcall writer context))
                      (zerop (funcall cursor context)))
           (error \"COD-60: fine ciclo non conserva RESCHEDULE/cursore/writer.\"))
         (if full 43 31))
       (if full 43 31) (lambda () (drain-fixture dispatcher context writers file))))))
(defun create-room-cycle () (create-cycle nil))
(defun create-full-cycle () (create-cycle t))
(defun campaign-group (name maker report checkpoint)
  \"Nuova fixture per ciascuna replica: budget payload indipendente e cleanup sempre fuori clock.\"
  (dotimes (replica +replicas+)
    (multiple-value-bind (function token cleanup) (funcall maker)
      (unwind-protect
           (let ((progress (sample-record replica +iterations+ +warmup+ token)))
             (setf (getf progress :campaign) name (getf report :current-replica) replica
                   (getf report :samples) (append (getf report :samples) (list progress)))
             (funcall checkpoint)
             (sample function +iterations+ token progress)
             (funcall checkpoint)
             (unless (zerop (getf progress :heap-bytes))
               (setf (getf progress :status) :failed (getf progress :diagnostic) \"COD-30: heap osservato positivo.\")
               (error \"COD-30: heap positivo nella campagna ~S replica ~D.\" name replica)))
        (funcall cleanup))))
  report)
(defun campaign (report checkpoint)
  \"Due costi composti preregistrati; nessuna attribuzione al solo wrapper C3.\"
  (campaign-group :room #'create-room-cycle report checkpoint)
  (campaign-group :full #'create-full-cycle report checkpoint)
  (setf (getf report :current-replica) nil) report)
(defun make-report ()
  \"Raw, costi inclusi e limiti: protocollo C1 reale, nessuna misura di park/wake o coordinatore vivo.\"
  (list :schema-version 1 :kind :pool-recycle-benchmark :status :running :stage :pending
        :diagnostic nil :process-argv sb-ext:*posix-argv* :tool-arguments (uiop:command-line-arguments)
        :source-fingerprints-before (fingerprints) :source-fingerprints-after nil
        :source-consistency :pending :recorded-at (get-universal-time) :self-test nil
        :samples nil :current-replica nil :sbcl (lisp-implementation-version)
        :machine (machine-type) :os (software-type) :os-version (software-version) :safety 3
        :iterations +iterations+ :warmup +warmup+ :replicas +replicas+
        :timer-units-per-second internal-time-units-per-second
        :campaigns '((:room :shards 1 :ring-capacity 1 :writers 1 :writer-capacity 8192
                     :payloads-per-writer 4226 :quantum 1 :recycle-per-cycle 1 :claim-per-cycle 1
                     :begin-pop-ack-end-per-cycle 1 :token 31)
                    (:full :shards 1 :ring-capacity 1 :writers 2 :writer-capacity 8192
                     :payloads-per-writer 4226 :quantum 1 :recycle-per-cycle 1 :claim-per-cycle 0
                     :begin-pop-ack-end-per-cycle 1 :alternating-writer-identity t :token 43))
        :token-formula \"sample=N*cycle-token+N*(N-1)/2; ROOM=31; FULL=43\"
        :limits '(:fresh-fixture-per-replica :preallocated-product-and-inputs
                  :startup-claim-first-tratto-drain-and-gc-excluded :public-bounded-drain-after-clock
                  :c1-protocol-and-scalar-oracles-in-clock :not-isolated-wrapper-throughput
                  :counter-not-absolute-nonallocation-proof :external-load-uncontrolled
                  :clock-zero-is-below-resolution :no-time-threshold-no-tuning-claim
                  :no-io-in-cycle :no-bridge-begin-or-live-series-lease-in-clock
                  :no-concurrent-coordinator :no-physical-worker-lifecycle-qualification)))
(defun run-driver (args &key (product-loader #'load-product) (tester #'self-test) (runner #'campaign))
  \"Driver recycle compatto; riusa I/O esclusivo e sensore qualificati, preserva raw del fallimento.\"
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
  \"Ciascuno dei tre risultati ricircolo difforme deve essere respinto.\"
  (dolist (row '((:unexpected :published 1) (nil :claimed 1) (nil :published 2)))
    (unless (handler-case
                (progn (verify-recycle (lambda (dispatcher) (declare (ignore dispatcher)) (values-list row))
                                       nil nil :published 1) nil)
              (error () t))
      (error \"COD-60: risultato recycle difforme non respinto: ~S.\" row)))
  :passed)
(defun self-test ()
  \"Sensore comune heap/sink/clock/partial, tre risultati e due protocolli reali con drain.\"
  (list :status :ok :shared-sensor (arcdocdb.pool-lifecycle.measure::self-test)
        :recycle-oracles (self-test-oracle) :recycle-cli-and-partial-raw (self-test-reporter)
        :room (arcdocdb.pool-lifecycle.measure::self-test-composed #'create-room-cycle)
        :full (arcdocdb.pool-lifecycle.measure::self-test-composed #'create-full-cycle)))
(defun main ()
  \"Rapporto leggibile; errore nonzero anche per fonte cambiata o heap osservato positivo.\"
  (let ((report (run-driver (uiop:command-line-arguments))))
    (let ((*print-readably* t)) (write report :pretty t) (terpri))
    (unless (eq :ok (getf report :status))
      (format *error-output* \"~&tools/measure-pool-recycle.lisp: ~A~%\" (getf report :diagnostic))
      (uiop:quit 1))))
(unless (member :arcdocdb-pool-recycle-measure-library *features*) (main))
")
  (:PATH
   #A((96) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/docs/implementazione/pool-recycle.md")
   :BYTES 4318 :SHA256 "65da387e05a4179fc930e440f4068a6025c9afc5f22d7917ac5bc748457b44ff" :GIT-BLOB
   "c38c4f50f84907b380e9f57e291c9f8503efc5c2" :TEXT "# Ricircolo dal dispatcher alla Serie

`arcdocdb.scheduler.dispatch:ricircola-collegamento-pool` completa il
[dispatcher pool/Serie](pool-dispatch.md) quando un tratto chiuso lascia
un obbligo RESCHEDULE. È un incremento C3 di REQ-THR-001,
REQ-CON-001/002/004/005 e REQ-AFF-008: riusa le barriere C1 di
[ricircolo](writer-recycle.md), worker e routing senza modificarle.
Il [metodo preregistrato](pool-recycle-metodo.md) delimita la verifica.

## Contratto del passo

Il proprietario corrente chiama l'API sul dispatcher preallocato, senza
rientranza, con worker RESCHEDULE, obbligo unico, lease e debito nulli e
bridge precedente già chiuso. Binding porta/tabella e owner vengono
verificati prima di qualsiasi trasferimento. Il contesto è quello immutabile
della porta: non esiste un secondo argomento context da disallineare.

Il passo esegue **una sola** `execution:ricircola-worker` sulla partizione
home, quindi restituisce tre valori:

| Valore | Significato |
|---|---|
| link oppure NIL | Link preallocato del nuovo writer CLAIMED; NIL se pubblicato. |
| `:claimed` oppure `:published` | Esito originale del ricircolo. |
| count | Occupazione della singola partizione al punto del ricircolo; non cursore né snapshot globale. |

Con spazio nel ring, pubblica il writer precedente e torna IDLE. Restituisce
NIL e termina immediatamente: non seleziona un link, non interroga il pool e
non prende un nuovo writer. La successiva presa rimane una chiamata esplicita.

Con ring pieno, lo scambio FIFO C1 consegna la vecchia testa al contesto e
pubblica in coda il writer precedente, conservando count. L'API seleziona
il link del **nuovo** CLAIMED mediante ordinale ed identità writer verificati.
Il link rimane IDLE; begin, token, pop, ack e fine del bridge sono espliciti.
Non riutilizza il link del tratto precedente e non modifica home o cursore.

## Ritiro e guasti

Il passo non legge request/ack/active e non applica comandi lifecycle.
Ritiro pendente, porta inattiva o parole pool incoerenti non impediscono di
risolvere un obbligo già assunto. Dopo una pubblicazione riuscita, il caller
può invocare separatamente `prendi-collegamento-pool`: la barriera IDLE
permette allora di confermare il ritiro prima di una nuova presa.
Uno scambio full assegna invece un altro obbligo da completare. Non si
promette convergenza del ritiro sotto saturazione perpetua del ring.

Owner e binding errati hanno gli stessi rifiuti del dispatcher esistente,
prima del trasferimento. Le fasi diverse da RESCHEDULE e i verificatori di
execution restano nelle barriere C1. FAULTED conserva la prima causa.
Una guard ready occupata segnala `resource-exhausted :ready-queue-busy`,
con RESCHEDULE e obbligo intatti: ogni retry appartiene al caller.

Un routing invalido dopo full non annulla lo scambio: il vecchio writer è
già nel ring; il nuovo riferimento e home restano nel worker FAULTED con la
condizione originale, senza lease della Serie. Il caller coordina la diagnosi
dell'Archivio. Non si rivendica preimage immutata dopo un trasferimento riuscito.
Il nuovo componente non scrive direttamente fault, writer, ring o controller.

Ritorni writer/status incoerenti del delegato segnalano
`invariant-violation :pool-dispatcher-state`, prima del routing; anche lo
status inatteso passa una guardia separata con argomento T e NOTINLINE,
che mantiene il controllo anche se il delegato viola il proprio ftype.
Il case successivo conserva il ramo finale difensivo. Non ci sono handler che nascondano un
errore, rollback, cleanup, cessione o pubblicazione aggiuntivi.

## Costo e ambito

Il passo è O(1): controllo owner e identità EQ, una partizione home, un
tentativo di guard e, solo dopo full, routing indicizzato. Nessuna scansione,
hash, nuova allocazione intenzionale, scrittura condivisa tra Serie per
messaggio, callback, attesa, thread o I/O. Il count descrive il trasferimento
appena concluso; altri worker possono già aver cambiato il ring al ritorno.

Il dispatcher ora espone separatamente nuova presa, collegamento di un
CLAIMED già posseduto e ricircolo di RESCHEDULE. Non è il loop completo del
server: applicazione dei payload, sensori, admission, park/wake, avvio e
arresto fisici e coordinamento dell'Archivio restano aperti. Non cambia
protocolli durevoli e non chiude i gate del motore completo.
")
  (:PATH
   #A((103) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/docs/implementazione/pool-recycle-metodo.md")
   :BYTES 4729 :SHA256 "a3abb270ad16b8eb2262411faba5091dbe4fbaea54c6b30bf376f1339d56babb" :GIT-BLOB
   "023722e1a91e1c0826867fe204eeb9eab72dc72e" :TEXT "# Metodo del ricircolo pool/Serie

Preregistrazione del 2026-10-14 sulla base
`a5715a1aa0b2571d650d1b794e9bb7b7324e951e`, prima delle campagne formali.
Il [contratto](pool-recycle.md) definisce una sola operazione ready per passo.
Scope C3 completo del dispatcher esteso: `src/dispatch/package.lisp`,
`types.lisp`, `build.lisp`, `claim.lisp` e nuovo `recycle.lisp`.
Nessun sorgente C1 è modificato; ricircolo, worker, routing e bridge sono delegati.

## Prove e revisione

- Room: pubblicazione FIFO dell'obbligo, NIL/status/count esatti e IDLE.
  Nessun routing, seconda presa o conferma del ritiro; distinguere count da cursore.
- Full: scambio reale A→B, A in coda, count invariato e link corrente B IDLE,
  senza begin. Home e cursore conservati.
- Porta inattiva, ritiro pendente e parole lifecycle incoerenti: ricircolo
  indipendente dal pool. Completamento del nuovo CLAIMED, ritorno a IDLE e
  ritiro confermato soltanto dalla successiva presa esplicita.
- Guard ready realmente occupata: errore busy e preimage di ring, contesto,
  writer, collegamenti, controller e parole pool; retry solo esplicito.
- Owner estraneo e binding fra contesti diversi: rifiuto prima del trasferimento.
- Tutte le fasi coerenti diverse da RESCHEDULE, FAULTED compresa: rifiuti
  delegati e diagnosi/debito/lease conservati, prima causa EQ.
- Writer sconosciuto o link invalido dopo full: trasferimento già avvenuto,
  vecchio obbligo in ready e nuovo riferimento conservato in FAULTED, controller
  e lease Serie intatti. Nessun rollback dedotto da un'eccezione.
- FI quiescenti e ripristinate per writer/status contraddittori e sentinelle
  che distinguono assenza di gate/routing da un semplice risultato NIL.
  Uno status fuori ftype è un guasto di contratto, non un ritorno nominale:
  la guardia separata NOTINLINE deve rifiutarlo prima del routing, preservando
  contesto, ring e prima causa. La FI non qualifica un ritorno C1 reale.
- Lettura indipendente C3 del componente esteso e dei test, con lista di
  controllo, compilazione strict, safety 3, lint e tracciabilità.

## Copertura

Almeno 95% di espressioni e rami sull'intero componente di cinque file,
senza esclusioni manuali. Pubblicare anche tutti i conteggi per file e i
missing, compresi i rami difensivi fuori dominio del delegato se SBCL li
mantiene. Denominatore zero significa solo nessuna sonda nativa di quel tipo,
non assenza di decisioni nel sorgente. Nessuna inferenza MC/DC o copertura
dei delegati C1 nel denominatore C3.

Conservare SB-COVER nativo, HTML originali e audit esatto native/HTML.
Riutilizzare il reader verificato con adattatore esplicito allo scope esteso,
test negativi su file, shape, duplicati, denominatori e missing paths.

## Memoria e misura locale

Sensore C4 con campionamento già verificato, self-test dedicati e due
campagne reali. Ogni replica ha una fixture nuova: cinque repliche da
4096 cicli, 128 warmup, queue preallocate con abbastanza payload simbolici
immutabili e quantum uno. Factory, API lookup, GC e drain finale sono fuori
clock; nessun reset di stati o generazioni privati.

| Campagna | Ciclo misurato |
|---|---|
| ROOM | Ricircolo pubblicato, nuova presa esplicita, begin execution, pop di un payload, ack e fine in RESCHEDULE; link IDLE. |
| FULL | Ricircolo su ring pieno, link alternato del nuovo CLAIMED, begin execution, pop di un payload, ack e fine in RESCHEDULE; link IDLE. |

Sono cicli integrati: comprendono il protocollo C1 execution e gli oracoli scalari,
senza attribuire il tempo al solo adapter. La nuova presa ROOM appartiene
alla fixture esplicita, non è una chiamata nascosta nel ricircolo.
Il bridge Serie non viene iniziato nel clock e nessuna lease Serie viene
acquisita dalla misura; le prove funzionali verificano separatamente il bridge.
Count, status e identità del link contribuiscono all'oracolo.
Cleanup pubblico bounded risolve tutti gli obblighi della fixture prima
di chiudere i backend I/O; nessun abbandono è qualificato come arresto valido.

Conservare tick, heap, sink e cicli completati. Il sensore deve rilevare
allocazione positiva deliberata, ritorni difformi, sink errato, clock sotto
risoluzione, CLI invalida, raw parziali e destinazioni preesistenti.
Carico esterno incontrollato, nessuna taratura, soglia o conclusione sul
throughput del motore. Heap zero osservato non prova assenza universale di
allocazione né correttezza di un coordinatore concorrente.

Qualifica in copia congelata con `record-command.lisp`, cache dedicate,
argv/output/exit e impronte iniziali/finali. Fallimenti e versioni preliminari
restano distinti dagli originali congelati. Conservazione byte per byte,
nuovi manifesti esclusivi e controllo completo con i dieci spike esistenti.
")
  (:PATH
   #A((106) BASE-CHAR
      . "/private/tmp/arcdocdb-pool-recycle-qualification-1791995415/docs/implementazione/pool-recycle-revisione.md")
   :BYTES 12583 :SHA256 "b660a90542a75fa77390456b00b2be5bf458dadff147e6dbdedfcd0a65f28a90"
   :GIT-BLOB "fd875bca51e4fd0d58251c123cadb6417e82bd76" :TEXT
   "# Revisione indipendente del ricircolo pool/Serie

Lettura statica del 2026-10-14 sulla base
`a5715a1aa0b2571d650d1b794e9bb7b7324e951e`, eseguita da un agente diverso
dall'autore del codice. Esito: **positivo per lo scope C3 letto**, senza
rilievi aperti sul prodotto. Il revisore ha modificato soltanto questo
documento; non ha eseguito le campagne e non attesta compilazione, risultati
dei test, copertura o allocazioni.

Il quadro applicato comprende [ADR-0031](../adr/0031-software-critico-criteri-e-priorita.md),
[ADR-0034](../adr/0034-policy-di-compilazione-e-standard-di-codifica.md),
[ADR-0045](../adr/0045-modello-di-esecuzione.md) e lo
[standard di codifica](../affidabilita/standard-di-codifica.md).
Sono stati letti il [contratto](pool-recycle.md), il
[metodo preregistrato](pool-recycle-metodo.md), i cinque sorgenti dispatch,
l'ordine ASDF, le tredici nuove prove, le fixture dispatch preesistenti e
le barriere C1 di ricircolo, contesto execution, routing e bridge Serie.

## Identità e denominatore

Lo scope di qualificazione è l'intero componente dispatch esteso: cinque
file, senza esclusioni manuali o limitazione alle righe nuove. I conteggi
devono essere pubblicati anche per ogni file, compreso `recycle.lisp`;
una soglia aggregata non sostituisce l'indicazione dei suoi percorsi mancanti.
I delegati C1 non entrano nel denominatore C3 e non sono riclassificati.

| Fonte letta | SHA-256 |
|---|---|
| `src/dispatch/package.lisp` | `7f1eea26b8d8fd34186a85cff9aebae5842dc731de45b361058e0af4788090e8` |
| `src/dispatch/types.lisp` | `cc44882c565a89de08f5add79333868ebfca4fc3f97bf9104d36375d014d4720` |
| `src/dispatch/build.lisp` | `c78d31a753db78baea520e9ea0cccf6e88cad9cca8bc75261a6ff26c2ac01fe5` |
| `src/dispatch/claim.lisp` | `224e4114b8b91affced874bea9c23cae5c79526e8ddae62e31a0cafcbb763682` |
| `src/dispatch/recycle.lisp` | `9fa3294cd28d1904cfb8db5153f93188b02f1bfbaf1800dad788731007c29ad0` |
| `arcdocdb.asd` | `ef5423225107a6b33e1eb71d4713dfd77ad441e5af6e07cdb2c95bf0bbb0ffb6` |
| `tests/scheduler/dispatch.lisp` | `600eb0b5fdf9a52d020e2f4c638f0f3dba43d9d9711be73eaffff208578821eb` |
| `tests/scheduler/pool-recycle.lisp` | `079a58b0c8850df0be62c71229e25d052fb716f36f1996e9e8ab2c4c2a38fa86` |
| `tools/measure-pool-recycle.lisp` | `f9f33a86334719cf22a0c6d9f27ccae426895c247c67044ddf52b70200b05c7a` |
| `docs/implementazione/pool-recycle.md` | `65da387e05a4179fc930e440f4068a6025c9afc5f22d7917ac5bc748457b44ff` |
| `docs/implementazione/pool-recycle-metodo.md` | `a3abb270ad16b8eb2262411faba5091dbe4fbaea54c6b30bf376f1339d56babb` |

Le fonti delegate determinanti per il nuovo passo sono rimaste invariate:

| Barriera | SHA-256 |
|---|---|
| `src/execution/worker-claim.lisp` | `62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e` |
| `src/execution/worker-types.lisp` | `62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317` |
| `src/execution/worker-boundary.lisp` | `4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a` |
| `src/execution/ready-recycle.lisp` | `2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b` |
| `src/series/routing-select.lisp` | `796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a` |
| `src/series/worker-run.lisp` | `f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f` |

Le impronte identificano i byte di questa lettura. La successiva qualifica
deve confrontarli con quelli congelati, senza dedurre un PASS da questa tabella.

## Un trasferimento e obblighi conservati

La nuova API riusa il binding immutabile fra porta del pool e tabella
locale. `%check-dispatcher-binding` controlla tipo della porta, owner, tipo
della tabella e identità EQ dei contesti, prima di chiamare execution.
Legge soltanto riferimenti e owner della porta; non legge request, ack o
active e non chiama il gate lifecycle.

`ricircola-collegamento-pool` invoca una sola `ricircola-worker`, che richiede
RESCHEDULE e obbligo unico senza lease o batch. Il C1 opera sulla sola
partizione home. Con spazio, il vecchio writer passa al ring e il contesto
torna IDLE: il nuovo ingresso restituisce NIL, `:published` e count, senza
routing, polling o seconda presa. Il ritiro può essere applicato soltanto
dalla successiva presa esplicita sul contesto libero.

Con ring pieno, il C1 pubblica il vecchio obbligo e consegna la testa al
worker nella stessa sezione protetta. Il nuovo ingresso risolve il link
del writer ora CLAIMED, mediante ordinale e identità verificati. Il link
rimane IDLE: nessun begin, token o lease Serie viene introdotto. Home e
cursore restano quelli di execution; count descrive il trasferimento locale,
senza essere un cursore o uno snapshot al momento del ritorno.

Il ritiro pendente o la porta inattiva non revocano l'obbligo. Una catena di
scambi full può continuare ad assegnare CLAIMED e non garantisce il ritorno
a IDLE sotto saturazione perpetua. Il dispatcher non acquisisce autorità su
park, wake, shutdown o coordinamento dell'Archivio.

Busy della guard conserva RESCHEDULE, writer e home; ogni retry è esplicito.
Un routing invalido dopo scambio conserva invece il trasferimento già
riuscito: vecchio writer nel ring, nuovo riferimento e home nel worker
FAULTED attraverso la barriera C1. Non esiste rollback, cessione, cleanup
o nuovo handler C3. Nessuna preimage immutata è promessa dopo tale successo
parziale; controller e lease Serie non vengono acquisiti dal routing.

## Guardia del risultato e compilatore

L'esito C1 è nominalmente ristretto dal suo ftype a `:claimed/:published`.
Una `case` applicata direttamente a quel risultato non basta a dimostrare
un rifiuto operativo di valori che violano il contratto: il compilatore
può eliminare il ramo che considera impossibile.

La versione letta introduce `%check-recycle-status`, con argomento T e
NOTINLINE, prima del dispatch sul risultato. La guardia verifica il dominio
nel proprio corpo e segnala `invariant-violation :pool-dispatcher-state`
senza scrivere fault o stato. Il suo ritorno ristretto permette poi di
specializzare la seconda `case`, che mantiene comunque un finale esplicito.
Le due guardie writer/NIL controllano separatamente la relazione fra valori
che il solo ftype non esprime.

La FI di uno status estraneo esercita questa barriera C3, non un ritorno
C1 nominale. La variante FAULTED sostituisce deliberatamente il delegato:
non dimostra che il vero C1 permetta il ricircolo da FAULTED. Tutte le
sostituzioni sono quiescenti e ripristinate. I denominatori nativi devono
restare quelli prodotti da SB-COVER, anche se un ramo difensivo successivo
non genera sonde; non si inferisce MC/DC o copertura dal solo sorgente.

## Lista di controllo

I dodici punti C1 sono usati come controllo aggiuntivo per il singolo
passaggio C3 previsto da ADR-0031. Questa lettura non sostituisce le due
revisioni o le altre verifiche dei delegati C1.

| Punto | Valutazione statica e limite |
|---|---|
| 1. Requisiti e ADR | REQ-THR-001, REQ-CON-001/002/004/005 e REQ-AFF-008 tracciati; un accesso ready per tratto e compiti senza sospensione coerenti con ADR-0045 §6/8. Il pool completo resta aperto. |
| 2. Invarianti | Binding verificato prima del trasferimento; una sola chiamata C1; routing soltanto per CLAIMED non-NIL; published termina IDLE senza nuova presa. Obbligo unico e bridge precedente chiuso restano precondizioni del caller. |
| 3. Errori | Ragioni binding/owner riusate; fase, busy e fault delegati senza occultamento. Stato e relazione writer/status hanno rifiuto C3 typed senza mutazione o sostituzione della prima causa. |
| 4. Limiti | Nessun ciclo, ricorsione, retry, callback o attesa nuovo. Ricircolo su home O(1), guard a tentativo singolo e routing O(1); nessuna scansione delle Serie o delle partizioni. |
| 5. Allocazione | Nessun costruttore, lista, closure, hash o nuovo stato nel percorso caldo. Zero heap richiede la campagna misurata: non deriva dalla lettura statica. |
| 6. Risultati | Tutti e tre i risultati sono usati; status validato con argomento T/NOTINLINE, writer verificato rispetto all'esito, count originale inoltrato senza inventare un nuovo significato. |
| 7. Decisioni | Helper nuovo: complessità 2, 7 righe di defun; API nuova: complessità 5, 22 righe. Binding 5, factory 2, claim 5 e lookup 1; nessuna funzione supera 60 righe o 10 percorsi. Nessuna nuova decisione composta C1. |
| 8. Proprietà | Dispatcher, contesto, tabella e link restano del thread creatore; owner e contesto EQ verificati prima della delega. Nessuna migrazione, reentrancy o struttura globale mutabile nuova. |
| 9. Tracciabilità | REQ sulle nuove definizioni e sui tredici test; export e ASDF dopo claim corretti. Build strict, lint, trace e controllo completo devono essere attestati dai loro processi separati. |
| 10. Standard | Safety 3, ftype espliciti, docstring e OWNER/SHARED; finali case typed. Nessun ignore-errors, handler generico, cleanup o rimozione di controlli C1. Nessuna deviazione individuata nel prodotto letto. |
| 11. Parallelismo | Una sola guard del proprio shard per tratto; nessun lock comune, contatore globale o scrittura condivisa fra Serie per messaggio. Questa lettura non dimostra equità, assenza di starvation o scalabilità. |
| 12. Durabilità | Nessun payload, controller, CSN o file modificato dal nuovo codice. Nessun cambiamento durevole o eliminazione; nessuna nuova atomicità persistente da qualificare. |

## Lettura delle prove e del sensore

Le tredici nuove prove sono state lette senza eseguirle. Le fixture usano
primitive C1 e bridge reali dove indicato; le FI del protocollo e delle
funzioni restano distinte dagli interleaving concorrenti.

| Gruppo | Evidenza prevista dalle fixture e limite |
|---|---|
| Room | Tre shard e capacity 2 separano home/count/cursore; FIFO B poi A, una chiamata al ricircolo e sentinelle su routing, gate e ACK. Controller intatti e link finali IDLE. |
| Full | Scambio reale A→B su home diversa dal cursore, count invariato, link B IDLE senza begin; altri shard e stati writer/controller confrontati. Il successivo bridge è esplicito. |
| Ready busy | Guardia reale detenuta tramite CAS; confronto di ring, contesto, writer, link, controller e parole pool. Retry soltanto successivo al rifiuto. Non è uno stress di contesa casuale. |
| Fasi e prima causa | IDLE, CLAIMED, RUNNING, BATCH e FINISHING ottenuti da operazioni reali; FAULTED iniettato separatamente. Rifiuti conservano debito, lease e causa EQ. |
| Indipendenza dal pool | Porta inattiva, parole corrotte e ritiro pendente quiescenti, con sentinelle sul gate; completamento del nuovo CLAIMED e ACK soltanto alla presa IDLE successiva. Prova room distinta per assenza di ACK implicito. |
| Binding e owner | Contesti diversi e owner su thread reale distinto rifiutati prima del trasferimento; snapshot e sentinella sul ricircolo. Non è una prova di migrazione consentita. |
| Fault dopo full | Writer estraneo al routing: vero scambio già riuscito, riferimento/home e causa conservati, vecchio A osservato nel ring. Controller e lease Serie intatti; nessun rollback dedotto dall'errore. |
| Risultati e tipo | Writer/status contraddittori entro i tipi, dispatcher invalido e sei status fuori ftype. Rifiuto prima del routing, una sola chiamata interposta e immagini uguali; prima causa FAULTED conservata nella FI separata. |
| Invariante ready | Head invalido dentro il tipo INDEX, verificato sotto vera guard: causa C1 originale, writer e dati diagnostici conservati; rifiuto successivo senza sostituire la causa. |

Il sensore C4 letto usa fixture nuove per replica, payload preallocati,
quantum uno e un ricircolo per ciclo. ROOM aggiunge una presa esplicita;
FULL alterna i due writer. Begin, pop, ack ed end nel clock sono quelli
execution: il bridge rimane IDLE e non viene acquisita una lease Serie.
Gli oracoli scalari, il protocollo C1 e il routing fanno parte del tempo;
non si misura il solo adapter. Factory, risoluzione API, GC e drain pubblico
bounded restano fuori clock. Il drain nominale non qualifica l'arresto
dell'Archivio dopo un fault.

I self-test del sensore prevedono heap positivo deliberato, sink errato,
clock sotto risoluzione, tre risultati difformi, CLI/destinazioni rifiutate
e raw parziali conservati. La lettura di tali controlli non ne attesta
l'esecuzione. La soglia C3, il confronto SB-COVER/HTML, i conteggi per file,
le repliche e la conservazione degli originali richiedono record separati.
Non si qualificano payload del motore, sensori reali, admission, park/wake,
worker morti, avvio/arresto fisici o un coordinatore concorrente.
")))
