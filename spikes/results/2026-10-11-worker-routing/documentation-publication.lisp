(:SCHEMA-VERSION 1 :KIND :WORKER-ROUTING-DOCUMENTATION-BUNDLE :VERSION "final-reviewed-publication"
 :SOURCES
 ((:PATH
   #A((91) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/README.md")
   :BYTES 6825 :SHA256 "d85cbea154f0ffc15069de954ce4f08c0620833bed11dad189bb0013d28e4928" :GIT-BLOB
   "3e32a3e4706a2c32f34f216667818a3735c6c70d" :TEXT "# Implementazione

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
| Collegamento CSN/snapshot | [Registro unico e coordinamento senza attese](snapshot-csn.md) | [`src/mvcc/snapshots-csn.lisp`](../../src/mvcc/snapshots-csn.lisp) |
| Verifica snapshot e CSN | [Metodo preregistrato, decisioni e limiti](snapshot-verifica.md) | Registro e adattatore già presenti in `src/mvcc/` |
| Registro snapshot | [Pin, identità, attivazione e scadenza](registro-snapshot.md) | [`src/mvcc/snapshots-register.lisp`](../../src/mvcc/snapshots-register.lisp) |
| Epoche e reclaim | [Slot dei reader e ticket limitati per i segmenti](epoche-e-reclaim.md) | [`src/epochs/`](../../src/epochs/) |
| Compiti di lettura | [Ingresso EBR, controlli snapshot e cleanup](compiti-lettura.md) | [`src/read/`](../../src/read/) |
| Verifica EBR e lettura | [Suite, metodo, mutanti e limiti](lettura-verifica.md) | [`tests/epochs/`](../../tests/epochs/) e [`tests/read/`](../../tests/read/) |
| Resolver GET CLOSED | [Frontiera dal manifest, flag e prova OUTCOME](get-resolver.md) | [`src/get-resolver/`](../../src/get-resolver/) |
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
   #A((73) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/CHANGELOG.md")
   :BYTES 13459 :SHA256 "5ba1abe1a33d17fca86a3541edeb398eb1f99b1618b3ab83023efa036f49d9f0"
   :GIT-BLOB "15467a1106a993242cf378c22561e81e4a2e2823" :TEXT "# Changelog

Formato basato su [Keep a Changelog](https://keepachangelog.com/it-IT/1.1.0/). Il progetto
non ha ancora rilasci; le versioni seguiranno la [roadmap](docs/roadmap.md).

## [Non rilasciato]

### Aggiunto

- Routing preallocato dei writer pronti alla Serie: ordinali immutabili,
  registro con associazioni verificate e tabella privata per worker.
  Selezione diretta in tempo costante, anche dopo ricircolo a coda piena,
  senza scritture condivise per messaggio. Include18 nuove regressioni,
  due letture C1, audit completo della copertura e cinque misure locali;
  pool e coordinatore restano aperti.

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
   #A((99) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/routing-worker.md")
   :BYTES 4350 :SHA256 "9ac1584adaa0099ca71e39699f6cfea94d8e4637a8e7bd6a674e29faffa2586b" :GIT-BLOB
   "3c2423f187253e7c2c83b3848c7efbd43d269641" :TEXT "# Routing preallocato dal writer alla Serie

Fondazione C1 per REQ-CON-001/002/004/005 e REQ-AFF-008;
ADR-0005, ADR-0033 e ADR-0045. Il routing connette il writer già
preso dalla lista pronta al suo [collegamento worker/Serie](worker-serie.md).
Il [metodo preregistrato](routing-worker-metodo.md), [le decisioni](routing-worker-decisioni.md),
[la revisione](routing-worker-revisione.md) e [i risultati](routing-worker-risultati.md) delimitano le prove.

Il caller assegna all'avvio un `routing-index` immutabile al writer.
L'indice è locale al registro, da 0 a 65535; `NIL` conserva il contratto
dei writer esistenti che non usano questo routing. Non esiste un contatore
globale per attribuire gli indici. Un registro ha da 1 a 65536 associazioni
dense: il writer nello slot i deve avere indice i. I controller del registro
sono distinti per identità EQ, così due writer non rappresentano la stessa
Serie nel medesimo registro. Una sola associazione logica per Serie fra
registri diversi resta una precondizione di configurazione del caller.

| API | Contratto |
|---|---|
| `crea-writer-programmabile :routing-index` | Costruzione all'avvio; indice `NIL` oppure intero nel budget dichiarato. Nessuna attribuzione implicita. |
| `indice-routing-writer writer` | Legge l'ordinale immutabile, senza assumere obblighi o lease. |
| `crea-registro-worker-serie writers controllers` | Copia i vettori del caller, valida tipo, lunghezza, ordinali e unicità dei controller; produce un registro condivisibile immutabile. Nessun claim. |
| `crea-tabella-worker-serie context registro` | Owner corrente, worker IDLE; prealloca un collegamento locale per ogni associazione. Non acquisisce writer o Serie. |
| `collega-writer-worker-serie tabella` | Worker CLAIMED; seleziona lo slot dell'ordinale corrente, controlla identità writer/contesto e collegamento IDLE, restituisce il collegamento. Nessun begin o pop. |

Il registro copia i vettori e mantiene privata la loro rappresentazione:
modificare gli input dopo la factory non cambia le associazioni. Il registro
può essere letto da più worker; ciascuno possiede la propria tabella e i propri
collegamenti sul thread che ha creato il contesto. Nessun collegamento migra
fra thread. La tabella contiene O(N) collegamenti per worker e deve essere
contabilizzata nel budget di memoria all'avvio: il limite massimo ammesso
non è una raccomandazione di dimensionamento.

La selezione usa l'ordinale del writer CLAIMED e un solo accesso indicizzato.
Verifica anche EQ del writer: un writer estraneo con lo stesso numero non
può selezionare una Serie valida per caso. Dopo un ricircolo a ring pieno il
worker può avere un altro writer; il caller ripete la selezione sul nuovo
CLAIMED, senza conservare come corrente il collegamento del tratto precedente.
Ripetere la selezione finché il collegamento è IDLE restituisce lo stesso
oggetto e non crea un nuovo obbligo o una seconda capacità.

La selezione riuscita precede `inizia-worker-serie`; pop, ack, chiusura e
ricircolo usano i contratti già esistenti. Il routing non consulta la salute
del controller, così resta possibile il drenaggio I/O già consentito su una
Serie FAULTED. Non trasferisce una lease e non applica i payload.

Owner estraneo è rifiutato prima del confine, senza avvelenare gli oggetti.
Fase worker errata resta un rifiuto ordinario. Un ordinale assente o fuori
tabella, un writer estraneo, una tabella privata incoerente o un collegamento
già impegnato sono invece difetti della configurazione/protocollo dopo claim:
il worker diventa FAULTED e conserva writer, home e obbligo, insieme alla
condizione originale. Nessun controller viene marcato senza una sua lease;
fermare e coordinare l'Archivio sulla diagnosi resta compito del caller.
Non sono promessi rollback, pubblicazione, cessione o riuso automatici.

Il lookup normale è O(1), senza scansioni, hash, allocazioni, scritture
condivise, thread, attese, callback o I/O. La costruzione è separata dal
percorso caldo e può usare un hash EQ per verificare i controller distinti.
La scansione bounded della lista pronta resta O(K), al più 64 partizioni,
ed è già implementata dal worker. Questo componente non realizza il pool,
wake/park, admission, adattamento EWMA/AIMD, retirement o shutdown.
Non introduce cambiamenti durevoli né qualifica il motore completo.
")
  (:PATH
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/routing-worker-metodo.md")
   :BYTES 4692 :SHA256 "9d4fe6ac9ef16ec4496bd14fb0e01f5a31d9639056b4dd94edb895d1d899e25f" :GIT-BLOB
   "b6c4a6992ef5ca707c19e08dfbdc7d1e01e1e900" :TEXT "# Metodo preregistrato del routing worker/Serie

Base iniziale `92decf4265554cd4959e32a1c881cf00758bb6a1`.
Metodo fissato prima delle campagne dedicate al routing nuovo.
Ambito: estensione immutabile del writer programmabile, registro condiviso,
tabella locale e lookup, dichiarazioni package/ASDF, test e C4 di misura.
Il [contratto](routing-worker.md) mantiene espliciti i confini non integrati.

Verifiche previste:

- Ordinale `NIL` compatibile con writer esistenti, 0 e 65535 validi;
  valori fuori tipo/budget rifiutati all'avvio prima della pubblicazione.
- Registro da 1 a 65536 slot, input di tipo/lunghezza coerenti,
  ordinale esattamente uguale allo slot; controller duplicati EQ rifiutati.
  Copie private: modificare entrambi gli input dopo la factory non cambia
  il lookup. Registri indipendenti possono usare gli stessi numeri.
- Tabella creata sul thread owner del contesto IDLE, collegamenti locali
  preallocati, distinti fra worker e riferiti allo stesso registro.
  Owner e fase errati non consumano obblighi o lease.
- Catena reale accettazione, pubblicazione ready, claim, lookup, doppia lease,
  FIFO, pop, ack, fine e ricircolo. Il ricircolo full deve cambiare writer e
  quindi collegamento senza ripetere il tratto del precedente writer.
- Lookup ripetuto su CLAIMED/IDLE restituisce lo stesso collegamento senza
  mutare il grafo di stato; nessuna lease Serie è acquisita dal lookup.
- Writer estraneo con ordinale valido, writer senza ordinale e indice oltre
  la tabella diventano fault terminali del worker dopo claim. Stessa
  condizione EQ conservata e propagata; writer/home/obbligo restano disponibili
  alla diagnosi. Nessuna mutazione di alcun controller non acquisito.
- FI quiescente della tabella privata: slot o binding incoerente, contesto
  estraneo, collegamento non IDLE. Il rifiuto precede begin/pop e non libera
  o marca una Serie di cui il routing non possiede la lease.
- Due worker reali, due Serie e stesso registro: collegamenti locali distinti,
  due Serie contemporaneamente ACTIVE. Semafori e deadline sono nel solo
  harness. Si distingue il controllo d'identità dall'esclusione già provata
  dal bridge; la fixture non misura throughput o equità del pool.
- Serie FAULTED selezionabile per il drenaggio già previsto dal controller.
  Nessun gate di salute aggiunto al lookup; nuova pubblicazione resta regolata
  dal controller. Nessuna prova di arresto globale Archivio è dedotta.
- Due letture C1 sui dodici punti, inventario di tutte le decisioni e dei
  controlli delegati, comprese eventuali decisioni composte condizione per
  condizione. Copertura nativa e HTML nello stesso processo che esegue le
  suite Series ed execution: unione completa di 15 sorgenti Series e
  11 sorgenti execution, package e helper inclusi. Il denominatore contiene
  anche le forme preesistenti di handoff, macro worker e bridge; nessuna
  decisione execution è attribuita al solo scope Series. Tutte le identità
  dei percorsi mancanti restano nell'audit, senza esclusioni approvate.
- Allocazione locale su ciclo completo con due writer, due controller,
  un worker, ready con una partizione/capacità1 e tabella preallocati.
  Ogni ciclo alterna il writer e compone enqueue, publish, claim, due lookup
  EQ/indice atteso, begin/lease, pop/ack ed end idle. Due cicli di startup
  popolano le identità fuori sensore. Warmup128, cinque campioni da4096 cicli,
  GC/stampa fuori misura. Sink indipendente del driver:
  `12+17+19+13+11+13+3+25+7+23=143`,
  campione `N*143+N*(N-1)/2`; token bridge e lease Serie monotoni per writer,
  token batch monotono nel worker. Controlli baseline, heap positivo16×1MiB,
  sink errato e clock sotto risoluzione dimostrano il rilevamento del C4.
- C4 compilato integralmente con warning e style-warning fatali, self-test
  del FASL, rilevamento heap/sink errato e CLI invalida. La sola eccezione
  runtime ASDF è `sb-kernel:redefinition-warning`, già prevista dal build;
  nessuna eccezione agli avvisi di compilazione del nuovo strumento.
- Build e test mirati prima del controllo generale; `make check` una volta
  sul codice finale congelato, salvo cambiamenti o failure reali.

Ogni campagna usa `tools/record-command.lisp`, con stdout/stderr, argv,
ambiente, snapshot iniziale/finale e tentativi falliti conservati. Le campagne
usano copie congelate e cache separate. Dati grandi compressi senza perdita,
catalogo e verifica dei byte conservati; nessun raw viene ricostruito.

Le misure locali distinguono startup e percorso normale. Non si deducono
heap nullo universale, throughput, P99, fairness, scalabilità o chiusura dei
gate della Fase0. Stati globali dei requisiti restano `progettato`.
")
  (:PATH
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/routing-worker-decisioni.md")
   :BYTES 10456 :SHA256 "f2f909eef13f7ee89509b4079b50ca43588b61c0ace945226601afd638a509d6"
   :GIT-BLOB "f77e4acc65f3582d76bee6867e7a728757a98d4c" :TEXT
   "# Inventario delle decisioni del routing worker/Serie

Lettura del 2026-10-11 sulla base
`92decf4265554cd4959e32a1c881cf00758bb6a1`, dopo RW-REV-01.
Questo inventario manuale non è una misura di copertura o MC/DC.
Il [metodo](routing-worker-metodo.md), il [contratto](routing-worker.md)
e la [revisione C1](routing-worker-revisione.md) delimitano lo scope.

| Sorgente letto | SHA-256 |
|---|---|
| `src/execution/handoff.lisp` | `3ce9f47008416f210173fd3a83ee7665b2103f26039d36e2601b31e5e3ebd72a` |
| `src/execution/package.lisp` | `833e501e6ee6e3acb8a6d37139c4605a05e06c425a35318adbcf651aa2f9db30` |
| `src/series/worker-package.lisp` | `dcab7a17e4fabcf256c2eddfb655d18145a1d789dd8d64a889945badc418e4b7` |
| `src/series/routing-types.lisp` | `31ae51c0fb11a802164a4d1e11ec63f835a2c67b52c751c5685bcc8947e5e0f1` |
| `src/series/routing-build.lisp` | `70135e73ecb1f6080683dd615c47a50530485061797382d74441743cd9a0f92d` |
| `src/series/routing-select.lisp` | `796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a` |
| `arcdocdb.asd` | `a4852ba400f91c52af42df0143b921fbcb1895479d4e250f16d57ad8d65f7fb9` |

## Controlli locali

Gli ID comprendono tutti i 21 predicati scalari dei tre file nuovi,
la decisione composta aggiunta alla factory writer, i due cicli startup
e i due gate macro della selezione. Le decisioni già presenti in handoff,
worker e bridge restano nei loro inventari; non si eliminano dal
denominatore della copertura dei file completi.

| ID / posizione | Decisione | Esiti e obbligo |
|---|---|---|
| H01 / handoff:71–72 | Factory writer, `unless (or A B)` | A: indice NIL; B: indice del tipo integer0..65535. Almeno uno vero accetta; entrambi falsi `invalid-argument :writer-configuration` prima della coda. |
| T01 / types:33 | `%routing-size`, `unless (<= 1 size 65536)` | Nel budget prosegue; fuori produce `invariant-violation :worker-serie-routing`. Nessuna scansione. |
| T02 / types:35 | Stesso helper, lunghezze writers/controllers uguali | Uguali restituisce size; diverse invariante prima di usare elementi. |
| I01 / build:12 | `%routing-input-size`, writers simple-vector | Tipo accettato prosegue; altro `invalid-argument :worker-serie-routing-configuration`. |
| I02 / build:14 | Stesso helper, controllers simple-vector | Tipo accettato prosegue; altro stesso rifiuto, prima delle copie. |
| I03 / build:17 | Stesso helper, size1..65536 | Budget accettato prosegue; vuoto/eccessivo stesso rifiuto. |
| I04 / build:19 | Stesso helper, lunghezze uguali | Uguali restituisce size; diverse stesso rifiuto. |
| E01 / build:28 | `%routing-input-entry`, tipo writer | Writer valido prosegue; altro `invalid-argument :worker-serie-routing-binding`. |
| E02 / build:30 | Stesso helper, indice writer EQL ordinal | Ordinale esatto prosegue; NIL, ordinal diverso o writer duplicato nello slot diverso stesso rifiuto. |
| E03 / build:32 | Stesso helper, tipo controller | Controller valido prosegue; altro stesso rifiuto. Non consulta salute/owner/ring. |
| E04 / build:34 | Stesso helper, `when (gethash controller seen)` | Già visto EQ rifiuta il duplicato; nuovo entra nel solo hash startup. |
| R01 / build:51 | Factory registro, size finale uguale a size input | Postcondizione coerente restituisce registro; diversa invariante, senza pubblicazione. |
| W01 / build:68 | Factory tabella, lunghezza links uguale a size | Postcondizione coerente restituisce tabella; diversa invariante, nessuna lease assunta. |
| O01 / select:14 | `%routing-ordinal`, lunghezza links uguale al registro | Uguale prosegue; diversa invariante prima dell'accesso link. |
| O02 / select:16 | Stesso helper, ordinal del tipo index | Index prosegue; NIL/invalido invariante dopo claim. |
| O03 / select:18 | Stesso helper, ordinal minore di size | Nel range prosegue; fuori invariante prima di `svref`. |
| O04 / select:20 | Stesso helper, writer EQ nello slot | Identico restituisce ordinal; estraneo, anche con stesso numero, invariante. |
| L01 / select:31 | `%routing-link`, tipo link | Collegamento valido prosegue; altro invariante. |
| L02 / select:33 | Stesso helper, contesto link EQ contesto tabella | Identico prosegue; estraneo invariante prima dell'accesso alle capacità. |
| L03 / select:35 | Stesso helper, writer link EQ writer corrente | Identico prosegue; altro invariante. Nessun riuso del link del tratto precedente. |
| L04 / select:37–38 | Stesso helper, controller link EQ controller registro | Identico prosegue; altro invariante, senza leggere lo stato del controller. |
| L05 / select:40 | Stesso helper, fase link IDLE | IDLE delega forma/lease locale a `%check-worker-serie` e restituisce link; altro invariante, nessun cleanup. |
| C01 / select:53 | Gate FAULTED di `%passo-worker` esterno | Terminale rifiuta prima del handler preservando la prima diagnosi; operativo esegue il preflight CLAIMED. Owner è controllato prima del gate. |
| C02 / select:55 | Gate FAULTED di `%passo-worker` interno | Terminale rifiuta prima del handler; operativo protegge soltanto i helper lookup con allowlist vuote. RW-REV-01. |
| Q01 / build:48 | `dotimes` della factory registro | Esattamente N iterazioni, N validato1..65536; nessun retry e nessun ciclo nel lookup. |
| Q02 / build:64 | `dotimes` della factory tabella | Esattamente N binding preallocati; limite dal registro T01/T02 prima dell'array. |

Il getter `indice-routing-writer`, le strutture e i package non aggiungono
altre decisioni. La factory tabella delega il controllo IDLE del worker
prima di allocare; la selezione delega CLAIMED prima del boundary interno.
Entrambi verificano il proprietario attraverso execution.

## Decisione composta H01

A è `(null routing-index)`; B è
`(typep routing-index '(integer 0 65535))`.
Le assegnazioni richieste dalle fixture sono indipendenti rispetto alla
decisione di accettazione:

| Input della fixture | A | B | Decisione | Contrasto |
|---|---|---|---|---|
| Simbolo estraneo | F | F | Rifiuta configurazione. | Base comune. |
| `NIL` | V | F | Accetta writer compatibile senza routing. | Con base cambia soltanto A. |
| `0` | F | V | Accetta ordinale0. | Con base cambia soltanto B. |
| `65535` | F | V | Accetta limite superiore. | Verifica ulteriore del budget. |
| `65536`, `-1`, float o stringa | F | F | Rifiuta configurazione. | Verifica ulteriore di tipo/range. |

`or` cortocircuita: con A vero B non viene valutato. I valori della tabella
sono quelli degli input, non una attestazione di esecuzione di ogni operando.
Non si inferisce MC/DC da sb-cover o dal solo successo della fixture.

## Confine degli errori e controlli delegati

| Passo | Resource recuperabili | Invalid recuperabili |
|---|---|---|
| Factory writer/registro/tabella | Nessun handler nuovo; input/fase rifiutati prima della pubblicazione. | Nessun handler nuovo. |
| Selezione esterna, preflight owner/CLAIMED | Soltanto `:worker-state`. | Nessuna. |
| Selezione interna, helper lookup | Nessuna. | Nessuna. |

La selezione esterna permette la chiamata fuori fase senza mutazione.
Il lookup interno non può usare quella allowlist: un errore del lookup
con la stessa ragione `:worker-state` viene registrato come terminale prima
del passaggio nel confine esterno. La condizione è propagata senza cambiarne
l'identità; se l'esterno la riconosce, il worker è comunque già FAULTED.
Un nuovo passo sul worker terminale rifiuta fuori dai handler senza
sostituire la diagnosi. Wrong-thread è analogamente rifiutato prima del
handler, senza poisoning del contesto, tabella, link o controller.

| Delegato letto | Obbligo |
|---|---|
| `execution::%passo-worker` | Valutazione singola del contesto, owner/gate terminale fuori dal handler, valori del corpo preservati e diagnosi persistente. Due istanze locali dynamic-extent; macro già documentata e testata nel worker. |
| `execution::%richiedi-worker` | Forma/capacità/cursori del worker e fase richiesta; factory IDLE, selezione CLAIMED. Non assume un nuovo obbligo. |
| `writer-worker-writer` | Getter owner-only; riferimento current writer conservato dopo claim. |
| `%check-worker-serie` | Forma IDLE, fault NIL e lease locali zero; non consulta lo stato vivo della Serie in IDLE. |
| `crea-collegamento-worker-serie` | Preallocazione sul thread del contesto, riferimenti immutabili, nessuna lease. |

Questo coupling interno resta esplicito e richiede rilettura se cambiano
worker, macro, binding o forma del registro. Nessuna salute Archivio è
scritta sul percorso normale. Non si marca una Serie su un errore routing
senza averne la lease: il coordinamento del guasto rimane aperto.

## Limiti e denominatori

La complessità locale si conta come una base più ogni `when`/`unless`,
un ingresso ulteriore per il secondo operando di `or` e un ingresso per
ogni `dotimes`; i controlli dei delegati restano nei loro helper. Il massimo
dei tre file nuovi è6 in `%routing-link`; `%routing-input-size`,
`%routing-input-entry` e `%routing-ordinal` sono5, `%routing-size` è3,
le due factory sono3. La selezione pubblica è3 includendo i due gate delle
espansioni macro; la factory writer modificata è3. Corpi entro60righe,
nessuna nuova ricorsione, attesa, callback, retry, thread o syscall.

Ogni accesso hot è O(1). La factory registro occupa O(N) spazio e usa hash
EQ solo per l'unicità all'avvio; non si promette un costo worst-case O(N)
del runtime hash. La tabella occupa O(N) spazio per worker. Il limite
N≤65536 controlla memoria/cicli del componente; il caller deve includerlo
nel budget complessivo di startup.

La copertura dedicata deve mantenere i file completi: 15 sorgenti Series,
inclusi package e tre nuovi file late, e 11 sorgenti execution, incluso
handoff modificato. L'ordinal writer e i controlli del worker non vengono
attribuiti allo scope Series. Rapporti nativi/HTML, denominatori e tutte
le identità missing restano nel risultato grezzo; nessuna esclusione è
approvata. Il numero di test passati non attesta copertura totale, tutti
gli interleaving, heap nullo universale o qualifica del motore.

La tabella degli SHA sopra identifica lo scope delle campagne dedicate
v2 sulla base92decf4. Il congelamento generale integra d155db3, che cambia
ASDF per CBORstring-write e GETresolver senza cambiare execution/Series;
8fb3051 aggiunge poi solo artefatti, senza cambiare sorgenti, tool o docs.
La [revisione](routing-worker-revisione.md#integrazione-con-main-avanzato)
mantiene distinti qualificazione dedicata e controllo generale integrato.
")
  (:PATH
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/routing-worker-revisione.md")
   :BYTES 13355 :SHA256 "3b98a3b4e8bf8645699388025a6ffdc3288fc303ff5a8949b4092d4d9ef4d282"
   :GIT-BLOB "1f93cf67fb8d32892a6ff2372a49928f2d2cd5f6" :TEXT "# Revisione del routing worker/Serie

Due letture C1 del 2026-10-11: contratto, sorgenti di prodotto e
dipendenze esecuzione/Serie. Prima lettura: agente `next_execution_audit`;
seconda lettura indipendente: agente `routing_measure`, dopo RW-REV-01.
La seconda lettura ha confrontato anche le fixture, prima delle campagne.
Il root ha poi eseguito le campagne e `next_execution_audit` ne ha letto
i raw dedicati v2: target, copertura, audit nativo/HTML, misure e strict C4.
Il controllo generale sul congelamento integrato passa: 835 test,
2 smoke, 21 suite e dieci spike con sorgenti stabili. Anche questi raw
sono stati letti da `next_execution_audit`. Sono letture di agenti,
non attestazioni umane; i gate globali di qualificazione restano aperti.
Base iniziale `92decf4265554cd4959e32a1c881cf00758bb6a1`.

| Punto C1 | Prima lettura | Seconda lettura / evidenza |
|---|---|---|
| 1. REQ e ADR | REQ-CON-001/002/004/005 e REQ-AFF-008; ADR-0005/0033/0045. Routing del writer già CLAIMED al binding locale, senza scheduler implicito. | Confermati nel delta writer, tre routing, package e ASDF. Nessun cambio del modello a compiti espliciti. |
| 2. Invarianti sensibili ai test | Ordinal immutabile e locale, registro denso 1..65536, controller distinti EQ, input copiati, owner worker, CLAIMED, writer EQ, link del contesto/coppia e IDLE. | Le 18 fixture v2 passano: copie, alias controller, ricircolo full, FI link, owner, fase, RW-REV-01, Serie FAULTED e shape privata. Confrontano identità e immagini prima/dopo; il limite 65536 è provato nella shape, senza costruire 65536 controller reali. |
| 3. Errori tipizzati | Configurazione invalida prima della pubblicazione; fase/owner ordinari; errore routing dopo claim rende FAULTED il worker e conserva l'obbligo. Segnalato RW-REV-01 sul confine delle ragioni recuperabili. | RW-REV-01 chiuso nel sorgente e nella campagna v2: FI su entrambi i helper con ragione `:worker-state`, condizione EQ, writer/home conservati e controller intatti. Nessun errore del lookup diventa recuperabile attraverso l'allowlist esterna. |
| 4. Cicli e attese | Due cicli di costruzione, ciascuno limitato dalla dimensione verificata N≤65536. Nessun ciclo nel lookup, nessuna attesa/ricorsione/thread/callback. | Confermato sui sorgenti finali; semafori/deadline soltanto nel harness concorrente, nessun retry nascosto. |
| 5. Allocazione calda | Slot e riferimenti immutabili, tabella locale preallocata, handler worker `dynamic-extent`. Hash EQ soltanto startup. Lettura statica non attesta heap nullo. | Cinque campioni v2 da 4096 cicli dopo warmup 128: heap `[0,0,0,0,0]`, sink 8972288 ciascuno. Controllo positivo 16777472 byte, sink errato rifiutato e clock nullo sotto risoluzione. Solo successo seriale locale preallocato, non heap zero universale. |
| 6. Dati verificati all'uscita | Range prima di `svref`; EQ prima di restituire link; owner/fase e shape verificati dai helper. Getter ordinale non attribuisce membership o lease. | Confermato ordine range, writer EQ, context/writer/controller EQ, IDLE e forma link. Nessun acquire, pop o accesso allo stato vivo della Serie dalla selezione. |
| 7. Decisioni composte | Una nuova decisione composta nella factory writer: `or` tra NIL e tipo integer0..65535. Altre decisioni scalari, cicli e boundary elencati nell'inventario. | Input NIL,0,invalido coprono VF/FV/FF, con cortocircuito dichiarato. Audit nativo/HTML dei 26 file PASS: 3250/3766 espressioni, 436/526 rami; tre routing 267/291 e 40/42. Tutte le 516 espressioni e 90 rami missing conservati; nessun MC/DC inferito. |
| 8. Proprietà condivisa | Registro privato dopo copie, condiviso in sola lettura. Contesto/tabella/link locali al thread. Lookup non legge salute, owner o ring del controller. | Confermati copie e slot read-only, assenza di scritture condivise calde e owner prima dei handler. Nessun poisoning su wrong-thread e nessun fault marking su controller senza lease. |
| 9. Tracciabilità e check | REQ sulle nuove definizioni; package/ASDF caricano routing dopo il bridge. Requisiti globali restano `progettato`. | Confermata sequenza di caricamento senza dipendenze invertite. Tracciabilità e check completo PASS sul congelamento integrato: 835 test, 2 smoke, 21 suite e dieci spike stabili. Nessuna promozione dei requisiti globali. |
| 10. Regole e deviazioni | Safety3, slot typed/read-only, ftype/docstring, pre/post, corpi≤60righe, complessità locale≤10. Nessuna syscall o deviazione nuova individuata. | Nessun nuovo difetto statico o deviazione individuato. Strict compile completo C4 e self-test FASL PASS in v1, prodotto/C4 invariati in v2; reader audit strict compile/FASL e self-test PASS in v2, entrambi stderr vuoti. Fullcheck integrato PASS, compilazione senza warning; 370114 byte di note compilatore conservati nello stderr. |
| 11. Serializzazione e INV-P6 | Nessun lock, wait, hash o scrittura globale nel lookup per tratto. O(1); coda pronta e lease restano nei protocolli già esistenti. | Fixture v2 PASS: due tabelle locali sullo stesso registro read-only, due Serie ACTIVE prima delle release. La correttezza di questo interleaving finito non è una misura di scalabilità o fairness. |
| 12. Atomicità durevole | Cambia soltanto configurazione in memoria e selezione di un oggetto. Non scrive WAL, non elimina dati, non conferma effetti. Nessun nuovo punto durevole. | Confermato: nessun I/O, record durevole, eliminazione, rollback o cleanup. Recovery/shutdown globale non sono qualificati. |

## Osservazioni della prima lettura

| ID | Osservazione | Stato |
|---|---|---|
| RW-REV-01 / P2 | L'allowlist `:worker-state` dell'API selezione racchiudeva anche i helper di lookup. Un errore `resource-exhausted :worker-state` inatteso proveniente dal lookup poteva restare recuperabile per coincidenza di ragione con il rifiuto di fase. La prima lettura non ha individuato un ramo naturale attuale che lo producesse; il rischio riguarda contenimento di guasto e coupling futuro. | Boundary lookup interno con allowlist vuote dopo il controllo CLAIMED, in `routing-select.lisp:55`, riletto da entrambi gli agenti. La regressione `test-REQ-AFF-008-routing-lookup-reason-cannot-bypass-terminal-boundary` inietta entrambi i helper e passa nel target v2. |

Il routing non possiede una lease Serie quando fallisce: non marca un
controller che potrebbe appartenere a un altro worker. La diagnosi e il
writer/home/obbligo conservati devono essere presi in carico dal futuro
coordinatore Archivio. Il fail-stop locale non dimostra arresto globale,
quiescenza, pool, shutdown o riuso sicuro dopo un errore.

## Tentativi preliminari

Il primo congelamento v1 ha compilato il prodotto senza avvisi, ma il
test dei budget massimi ha esaurito lo stack del comparatore ricorsivo
dell'immagine della fixture su vettori da65537 elementi. Il record originale
`4000711896-command-71058-0` resta un fallimento conservato, non viene
promosso a PASS. Il comparatore del solo test viene corretto prima della
campagna v2; sorgenti del prodotto e distinzione fra le campagne restano
espliciti. Il target v2 passa dopo questa correzione del solo harness.

## Gate dedicati letti

I quattro record di processo dedicati e il record dell'audit sono stati
letti con `:STATUS :OK`, `:SOURCE-CONSISTENCY :STABLE` ed exit0. Le copie
canoniche e il controllo generale sono descritti nei risultati.

| Gate | Record originale | Esito e ambito |
|---|---|---|
| Target v2 | `4000712082-command-76603-0` | 18 test routing PASS; include FI shape, Serie FAULTED e RW-REV-01. |
| Suite e copertura v2 | `4000712082-command-76602-0` | 88 test Serie e 89 execution PASS nello stesso processo; unione nativa/HTML dei 26 file completi. |
| Audit copertura v2 | `4000712247-command-79840-0` | Strict COMPILE-FILE completo reader, FASL, self-test e concordanza nativo/HTML PASS; stderr vuoto. 26 righe, 3250/3766 espressioni e 436/526 rami; 24 espressioni e 2 rami missing nei tre routing, tutte le identità preservate. |
| Strict C4 v1 | `4000711978-command-74703-0` | COMPILE-FILE completo e self-test FASL PASS, warning/style-warning fatali, stderr vuoto. C4 SHA invariato in v2. |
| Misura v2 | `4000712105-command-77187-0` | Cinque campioni da 4096 cicli: heap0, sink8972288, ticks6792/6802/6814/6820/6815. Controllo positivo 16777472 byte; badsink3 atteso1 rifiutato, clock0 sotto risoluzione, raw parziale e CLI verificati. |

Il report C4 originale `routing-bench-01/report.lisp` contiene 53759 byte,
SHA-256 `9f8fb919d590c230ce75063ca754782537759779048cddfb2490fea97bf58b93`.
I ticks sono in unità 1e6/s della piattaforma locale e non sono throughput,
P99 o confronto parallelo. Startup/compilazione/GC/stampa restano fuori
sensore; il ciclo è seriale, con due Serie alternate e I/O mock della fixture.

## Controllo generale finale

Il record `4000712542-command-86913-0` del congelamento integrato d155db3
con il delta routing passa con `:OK/:STABLE`, exit0 e 673 source blob.
Il processo esegue `make check-core`, nucleo richiamato da `make check`,
con cache ASDF privata: 835 test nominati, 2 smoke e 21 suite in
182.076021 secondi. Lo stderr originale contiene 370114 byte di note
del compilatore, senza warning o condizioni non gestite.

Il master `4000712691-check-90489-0` è `:COMPLETE`: tutti i dieci spike
hanno sorgenti stabili, exit0 e stderr vuoto; SPK-007 è PASS, gli altri OK.
La proiezione compatta `4000712744-routing-fullcheck-projection-92144`
è stata confrontata con i record originali. Le prove ausiliarie conservano
14 file originali e 2 file di orchestrazione; i fallimenti intenzionali
dei self-test sono distinti dal successo della campagna e non sono nuovi
gate C4.

La pubblicazione conserva questi dati nei file canonici
`full-check.lisp`, `fullcheck-summary.lisp` e `fullcheck-selftests.lisp`,
con provenienza e verifica dei byte dichiarate nei risultati. La copertura
rimane parziale, nessun MC/DC è inferito e la qualificazione generale del
motore e il gate F0 restano aperti. Dopo il controllo generale cambiano
soltanto documentazione e conservazione delle evidenze.

## Integrazione con main avanzato

La qualificazione dedicata rimane sul congelamento v2 della base92decf4.
Il congelamento generale integra
`d155db3f977677fa95280f59c23fbe46a5e116d2`:
aggiunge scrittura di stringhe CBOR e resolver GET, senza modificare
execution/Series o foundation/hash/io/wal/csn. Il delta ASDF aggiunge le
nuove unità e la suite CBOR; il delta `foundation-coverage.lisp` aggiunge
lo scope CBORstring-write e non cambia i predicate Series/execution.

L'avanzamento remoto successivo a
`8fb30517a72c5a7bf51f0f5746c6d04a0a8c3486` aggiunge soltanto artefatti:
il diff da d155db3 non cambia sorgenti, strumenti, documenti o ASDF.
Questa distinzione conserva la base effettiva nei record del congelamento.

Questi delta non cambiano i tre routing, il bridge, la modifica writer,
le fixture routing o il C4. I raw dedicati mantengono base, fonti e scope
originari: non sono presentati come nuove misure sulla base integrata.
ASDF, indice implementazione e changelog vengono composti conservando
entrambe le aggiunte. Il controllo generale sul pacchetto integrato passa
nel record `4000712542-command-86913-0`, con dieci spike nel relativo
master: questo esito viene dai raw finali, senza dedurlo dai gate dedicati.

## Pubblicazione e conservazione dei byte

Il wrapper di pubblicazione `4000712318-command-81618-0` ha exit0,
ma stato `:SOURCE-CHANGED` e source consistency `:CHANGED`: non è un
test PASS. La proiezione dei blob prima/dopo mostra 672→673 file e due
delta documentali concorrenti: creazione di `routing-worker-risultati.md`
e aggiornamento dei link di `routing-worker.md`. Gli altri blob rimangono
identici, compresi tutti i sorgenti di prodotto, test e strumenti.
Il record originale conserva questo stato senza normalizzarlo.

La copia dei raw e la costruzione del catalogo sono state completate con
verifica dei byte originali ed espansi. Il successivo controllo separato
`4000712554-command-87125-0`, letto dopo che i documenti erano stabili,
rilegge tutti i byte raw/espansi del catalogo e passa con `:OK/:STABLE`,
exit0 e stderr vuoto. Questo gate attesta la conservazione degli artefatti;
non trasforma il wrapper precedente in PASS e non sostituisce `make check`
sul codice finale.

## Ultima integrazione prima del push

Una lettura separata del delta d155→6eeb501 conferma che non modifica
execution/Series/routing o relativi contratti. Cache/read salta posti
disabilitati/rifiutati entro gli otto way prima del tag; la copia ricontrolla
ancora disponibilità e sequenza. La nuova suite GET e i tre strumenti
associati non invocano API routing. ASDF conserva entrambe le aggiunte e
`foundation-coverage.lisp` mantiene identici i predicati Series/execution.

Il nuovo snapshot683 sorgenti/documenti su
`6eeb501d2eace49fad8e2ec333ed0c6c1386dd6c` è verificato dal processo
`4000713646-command-11645-0`: OK/STABLE/exit0,854 test più2smoke,
22suite, nessun warning/style-warning. Dieci esperimenti aggiuntivi sono
riusciti nel master `4000713800-check-18712-0`, tutti stabili.
I raw835+2 precedenti rimangono storici; non sono reinterpretati come
prova della nuova base. Le due letture C1, le misure e il denominatore
dedicati mantengono fonte e scope originari. Il nuovo controllo generale
non chiude Fase0 o la qualifica del motore.
")
  (:PATH
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/routing-worker-risultati.md")
   :BYTES 7998 :SHA256 "48b3423ef1909e114eab4facc1f3d8115d9c4ca82f53a5363831b36911f124ab" :GIT-BLOB
   "737a738c8404c6d17d0655a2f1809c94540a3bd7" :TEXT "# Risultati locali del routing worker/Serie

Campagna del 2026-10-11, SBCL2.6.9/macOS ARM64 AppleM4, safety3.
Il [metodo preregistrato](routing-worker-metodo.md), la
[revisione in due letture](routing-worker-revisione.md) e
[l'inventario](routing-worker-decisioni.md) delimitano la fondazione.
Dati canonici in [`2026-10-11-worker-routing`](../../spikes/results/2026-10-11-worker-routing/).
Nessuna esclusione o deviazione nuova è approvata.

Le prove mirate, la copertura e la misura sono congelate sulla base
`92decf4265554cd4959e32a1c881cf00758bb6a1`. La successiva integrazione
comprende `d155db3f977677fa95280f59c23fbe46a5e116d2`: nuove stringhe CBOR,
resolver GET e prove associate, senza modificare execution/Series o i loro
contratti. ASDF, indice e changelog mantengono entrambe le aggiunte.
I dati della prima base restano distinti dal controllo generale integrato;
nessuna misura viene reinterpretata come qualifica dei componenti successivi.

| Processo | Esito letto |
|---|---|
| `4000711896-command-71058-0` / target v1 | Fallito, STABLE/exit1: comparatore ricorsivo della fixture su65537 slot esaurisce lo stack. Prodotto compilato senza avvisi; sorgenti v1 e raw conservati. |
| `4000711978-command-74703-0` / C4 v1 | OK/STABLE/exit0, stderr0: COMPILE-FILE integrale con ogni warning/style-warning fatale, caricamento FASL e self-test. Il comparatore del test non è eseguito dal sensore. |
| `4000712082-command-76603-0` / target v2 | OK/STABLE/exit0:18 test dedicati, inclusi preimage iterativa, health FAULTED, shape FI, due Serie ACTIVE e RW-REV-01 su entrambi i helper. |
| `4000712082-command-76602-0` / copertura v2 | OK/STABLE/exit0: suite Series ed execution nello stesso processo, raw nativo e27HTML conservati (26 sorgenti più indice). |
| `4000712247-command-79840-0` / audit copertura | OK/STABLE/exit0: reader C4 integralmente compilato senza avvisi, self-test FASL positivi/negativi, identità e conteggi nativi confrontati con l'HTML effettivo. |
| `4000712105-command-77187-0` / misura v2 | OK/STABLE/exit0:5×4096 cicli completi, due writer alternati, sensori e sorgenti stabili. |

## Copertura con denominatore completo

| Scope | Espressioni eseguite/totali | Esiti branch eseguiti/totali | Mancanti espressioni / branch |
|---|---|---|---|
| Execution,11 file interi |1470/1676|201/234|206/33|
| Series,15 file interi |1780/2090|235/292|310/57|
| Unione26 file |3250/3766|436/526|516/90|
| Tre file routing nuovi |267/291|40/42|24/2|
| Handoff writer intero |189/206|18/20|17/2|

`coverage-audit.lisp` conserva tutte le identità native mancanti, indice,
kind e path, e tutti i conteggi per file. `coverage-bundle.lisp` conserva
entrambi i raw nativi originali e tutti gli HTML, compressi senza perdita.
I file interi, compresi package e verificatori difensivi, restano nel
denominatore. La decisione composta H01 è letta separatamente con input
VF/FV/FF e cortocircuito esplicito; non si inferisce MC/DC da sb-cover.
Copertura parziale e prove locali non chiudono il gate C1 del motore.

## Allocazione e sensori

| Replica | Cicli dopo128 warmup | Heap osservato, byte | Tick raw | Sink indipendente |
|---|---|---|---|---|
|0|4096|0|6792|8972288|
|1|4096|0|6802|8972288|
|2|4096|0|6814|8972288|
|3|4096|0|6820|8972288|
|4|4096|0|6815|8972288|

Timer1000000 unità/s. Sink `4096*143+4096*4095/2=8972288`;
143/ciclo è fissato nel driver prima delle campagne, indipendentemente
dalle API. Ogni ciclo verifica enqueue, publish, claim, lookup ripetuto,
identità/ordinali, doppia lease, span/payload, ack e fine IDLE. Tutti gli
oggetti e le API sono preallocati o risolti prima del sensore; GC e stampa
sono fuori misura. I token bridge/Serie crescono per writer, batch per worker.

Il controllo positivo16×1MiB rileva16777472 byte; baseline zero, sink
errato, CLI invalida, destinazione precedente, clock nullo e misura
interrotta sono rilevati dai self-test. La misura interrotta conserva
cicli completati, tick7, heap e sink, senza inventare dati dopo l'errore.
La sola eccezione runtime ASDF riguarda `sb-kernel:redefinition-warning`
come nel build; il COMPILE-FILE del C4 non esclude avvisi.

La fixture mock I/O è usata soltanto all'avvio. Queste sono misure seriali
locali del percorso riuscito, con carico esterno non controllato: non
qualificano heap nullo universale, fairness, throughput, P99, scalabilità,
pool, dispositivo, fault cleanup o durata delle Serie. Registro e tabelle
restano configurazione statica O(N) per worker, senza inserimenti/retirement.

## Controllo generale integrato

Il processo `4000712542-command-86913-0` è OK/STABLE/exit0 sulla base
integrata d155, con673 sorgenti/documenti invariati:835 test nominati,
2smoke e21suite, incluse88 prove Series. Nessun warning/style-warning;
i370114 byte stderr sono note di compilazione e restano integri.
Durata complessiva182.076021s, che include tutti i controlli e non è una
misura del percorso caldo. Linter, tracciabilità, link, evidenze e self-test
passano. La cache FASL è privata nello snapshot; il recorder conserva
l'argv effettivo `env ASDF_OUTPUT_TRANSLATIONS=… make check-core`, lo stesso
core richiamato da `make check`.

Il master F0 `4000712691-check-90489-0` è COMPLETE:10 esperimenti,
ciascuno STABLE/exit0/stderr0; SPK07 PASS, gli altri OK. I raw completi
sono nel catalogo distinto `2026-10-11-worker-routing-spikes-check`.
Le prove dei runner snapshot/reader sono PASSED con due rifiuti attesi
ciascuna (SIGKILL9/exit137 e completionexit7). I14 file originali, inclusi
runner/stdout/stderr, sono conservati nel bundle ausiliario; fallimenti
iniettati non diventano failure del prodotto.

La pubblicazione iniziale `4000712318-command-81618-0` ha verificato le
copie e completato il catalogo, ma il recorder dichiara SOURCE-CHANGED:
mentre scriveva i raw, il root ha creato questo documento e aggiornato i
link del contratto. Gli altri sourceblob sono invariati. Il tentativo
resta conservato come non-PASS. La rilettura indipendente dei byte
`4000712554-command-87125-0` è OK/STABLE/exit0/stderr0.

Il byteproof ausiliario `4000712842-command-93594-0` è OK/exit0:
16 file (14 raw originali e2runner di orchestrazione) sono confrontati
byte per byte dopo reencoding UTF-8 e SHA256. Una prima utility ignored
aveva una parentesi mancante ed è fallita prima del corpo; il suo sorgente
rimane conservato ma il raw originario non era registrato. Il replay
identico `4000712876-command-94086-0` è un nuovo probe FAILED/exit1, con
stdout/stderr conservati: non sostituisce il raw mancante e non è un gate
C4 o un fallimento del prodotto.

## Integrazione successiva della cache e delle prove GET

Prima della pubblicazione main avanza a
`6eeb501d2eace49fad8e2ec333ed0c6c1386dd6c`. Il delta aggiunge la suite
GET-performance e fa saltare al lookup cache i posti disabled/rejected
entro gli otto way. Execution, Series, bridge, routing, fixture dedicate e
C4 di misura sono invariati. ASDF e indice sono composti con preimage
originali conservate; lo scope Series/execution del reader di copertura
rimane invariato. Le misure sulla base92 restano storiche.

Il nuovo congelamento generale passa nel processo
`4000713646-command-11645-0`: OK/STABLE/exit0,683 sorgenti/documenti,
854 test nominati più2smoke,22suite, comprese le19 nuove prove GET.
Durata185.668746s; nessun warning/style-warning,407320 byte stderr
originali conservati. Il master `4000713800-check-18712-0` è COMPLETE,
con10 run STABLE/exit0/stderr0. I raw del master restano separati dal
precedente nella sottodirectory `2026-10-11-worker-routing-spikes-check/latest`.
I self-test snapshot e reader sono PASSED, inclusi due rifiuti OS attesi
per ciascuno. Proiezione, sorgenti dei lettori e byteproof rimangono distinti
dalla campagna C4 e dal primo congelamento d155.

Dopo il controllo completo cambiano solo documentazione ed evidenze;
nessun sorgente, fixture o C4 di prodotto viene modificato. Requisiti
globali restano `progettato`, Fase0 e qualifica del motore rimangono aperte.
")
  (:PATH
   #A((111) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing/README.md")
   :BYTES 540 :SHA256 "b71e7ba8a90950843f7c4d4704e26d4fccc3bdbe4d43b1a33639df163db72557" :GIT-BLOB
   "b92fd48fd8c43fd12bd8d2d5f804e5315c040681" :TEXT "# Campagna locale routing worker/Serie

Sorgenti congelati v1/v2 sulla base92decf4; confronto mirato e misura
separati dalla verifica della base integrata. Metodo e limiti in
[risultati](../../../docs/implementazione/routing-worker-risultati.md).
Catalogo flat con SHA256 e Git blob dei byte originali, payload compressi
senza perdita. Tutti i tentativi e tutte le identità mancanti restano conservati.

Il controllo generale della seconda integrazione6eeb501 conserva
854 test più2smoke e dieci nuovi esperimenti, separati dai raw d155.
")
  (:PATH
   #A((124) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/README.md")
   :BYTES 528 :SHA256 "112916ec15bf2dbe4630b1a46ddbf5d0fd26225f937e2ecfddccb4d2751989ee" :GIT-BLOB
   "0e6da3457c158738d158d3f67521658f40929cac" :TEXT
   "# Dieci esperimenti del controllo routing integrato

Master originale4000712691-check-90489-0, base d155db3 e snapshot finale
routing:10 run STABLE/exit0/stderr0, SPK07 PASS e altri OK.
Descriptor e payload hanno byte originali verificati, in un catalogo
separato per evitare collisioni di basename `report.lisp.gz`.
Scope e limiti nei [risultati](../../../docs/implementazione/routing-worker-risultati.md).

La successiva base6eeb501 ha una seconda campagna distinta in
[`latest`](latest/), con master4000713800-check-18712-0.
")
  (:PATH
   #A((131) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/spikes/results/2026-10-11-worker-routing-spikes-check/latest/README.md")
   :BYTES 386 :SHA256 "72423f798dfc5a0d38306e137fb73d0d8dacb92f4a478e84b786b4d9efdca6d5" :GIT-BLOB
   "87a8d2b2f6aa7ba8b4bad6fa3dc80e4034571b86" :TEXT
   "# Esperimenti della seconda integrazione routing

Base6eeb501, master originale4000713800-check-18712-0: dieci run
STABLE/exit0/stderr0, SPK07 PASS e altri OK. I raw della prima base
d155 rimangono nella directory superiore; questo catalogo mantiene i
propri descriptor e payload originali.
Metodo e limiti nei [risultati](../../../../docs/implementazione/routing-worker-risultati.md).
")))
