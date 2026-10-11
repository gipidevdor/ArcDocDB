(:SCHEMA-VERSION 1 :KIND :WORKER-ROUTING-SOURCE-BUNDLE :VERSION
 "final-ASDF-tested-and-docs-updated" :SOURCES
 ((:PATH
   #A((73) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/arcdocdb.asd")
   :BYTES 12257 :SHA256 "853ec4f3ffdf01dc09dfa38b435a7ae85f49f2c406131d2f33aac683042758b6"
   :GIT-BLOB "34be23e8db42f4cbc8ae58cbd9c56de19e6d43ee" :TEXT
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
                             (:file \"cbor-write\") (:file \"cbor-string-write\")))
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
                             (:file \"active-preflight\") (:file \"active-read\"))))
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
                             (:file \"cbor-string-write-threads\")))
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
               (:module \"execution\" :serial t
                :components ((:file \"support\") (:file \"queue\") (:file \"threads\")
                             (:file \"handoff\") (:file \"ready\") (:file \"ready-recycle\") (:file \"worker\")))
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
             (uiop:symbol-call '#:arcdocdb.csn.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.mvcc.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.epochs.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.read.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.get.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.get.performance.tests '#:run)
             (uiop:symbol-call '#:arcdocdb.execution.tests '#:run)
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
   :BYTES 7133 :SHA256 "4691428e052b080c0b2380e33143bd0e9f7d0dbbd34d8a9c0287367be2aceefc" :GIT-BLOB
   "d22bbe878f2aa8985e4fb036312b5d28eeb375ca" :TEXT "# Implementazione

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
| Verifica GET | [Prima suite funzionale, metodo e limiti](get-verifica.md) | [`tests/get/`](../../tests/get/) |
| Collegamento CSN/snapshot | [Registro unico e coordinamento senza attese](snapshot-csn.md) | [`src/mvcc/snapshots-csn.lisp`](../../src/mvcc/snapshots-csn.lisp) |
| Verifica snapshot e CSN | [Metodo preregistrato, decisioni e limiti](snapshot-verifica.md) | Registro e adattatore già presenti in `src/mvcc/` |
| Registro snapshot | [Pin, identità, attivazione e scadenza](registro-snapshot.md) | [`src/mvcc/snapshots-register.lisp`](../../src/mvcc/snapshots-register.lisp) |
| Epoche e reclaim | [Slot dei reader e ticket limitati per i segmenti](epoche-e-reclaim.md) | [`src/epochs/`](../../src/epochs/) |
| Compiti di lettura | [Ingresso EBR, controlli snapshot e cleanup](compiti-lettura.md) | [`src/read/`](../../src/read/) |
| Verifica EBR e lettura | [Suite, metodo, mutanti e limiti](lettura-verifica.md) | [`tests/epochs/`](../../tests/epochs/) e [`tests/read/`](../../tests/read/) |
| Resolver GET CLOSED | [Frontiera dal manifest, flag e prova OUTCOME](get-resolver.md) | [`src/get-resolver/`](../../src/get-resolver/) |
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
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/routing-worker-risultati.md")
   :BYTES 9516 :SHA256 "393f2bf4f7822410e505962ef24149357b8d9ea1ba4cf8981e1a085c0cc53458" :GIT-BLOB
   "b275c083f9705d1ed32b4cf282fd0c12c39d98a2" :TEXT "# Risultati locali del routing worker/Serie

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

## Composizione finale con GET ACTIVE

L'ultimo avanzamento `be9d2dd6816f8c999fcab383702c7a133c061902`
aggiunge sei unità ACTIVE nel resolver e relativa documentazione.
Non cambia execution, Series, routing, fixture dedicate, strumenti o
suite esistenti. ASDF carica le nuove unità dopo il resolver CLOSED;
indice e changelog conservano entrambe le aggiunte, con preimage originali.

La tree combinata è verificata dal processo
`4000714586-command-55084-0`: `make build`, OK/STABLE/exit0,
690 sorgenti/documenti,854 test nominati e2smoke, senza avvisi.
Il controllo usa una cache FASL privata e dura circa20,36s. Queste prove
esercitano la suite esistente; non qualificano le nuove API ACTIVE o
le loro allocazioni. F0, copertura e misure mantengono i congelamenti
precedenti: non vengono ripetuti o reinterpretati per questo delta.

I sorgenti del routing, le fixture dedicate e il C4 qualificati restano
invariati. La configurazione ASDF composta è verificata dal nuovo build. Requisiti
globali restano `progettato`, Fase0 e qualifica del motore rimangono aperte.

## Integrazione della suite GET finale

La PR9 porta main a `644e53f176d0dce2c5ac5870659e7d89c0c9df3e`:
aggiunge70 test GET, caricamento della suite, scope GET di copertura e
documentazione. Non modifica sorgenti di prodotto o i predicati di
copertura Series/execution. L'integrazione conserva i precedenti delta.

Il build combinato `4000715110-command-98694-0` è OK/STABLE/exit0,
con694 sorgenti/documenti,924 test nominati e2smoke, senza avvisi;
cache FASL privata, circa22,71s. Questo controllo ripete la suite con i
nuovi test; F0, copertura e misure routing mantengono le basi originali.
Non è una nuova qualifica delle API ACTIVE, del pool o del motore.
")
  (:PATH
   #A((109) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/routing-worker-revisione.md")
   :BYTES 14895 :SHA256 "1c8336daf03cb18b1b2de6db4c54ad7c12bfa3120de59d84db4f3cd77a5f6bbd"
   :GIT-BLOB "6fbe1f002e3e18df09a964292f27c3657bb46004" :TEXT "# Revisione del routing worker/Serie

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
motore e il gate F0 restano aperti. I sorgenti routing, le fixture e il C4
qualificati in questo congelamento restano invariati.

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

## Composizione finale con resolver ACTIVE

Il delta6eeb501→be9d2dd non modifica execution/Series/routing o loro
contratti. Sei unità ACTIVE sono caricate dopo il resolver CLOSED,
senza cicli o riordino del routing. Le nuove API leggono la radice della
Serie, non agganciano automaticamente il bridge o il lookup routing e
non ridefiniscono le loro funzioni. L'allocazione dei metadati ACTIVE per
lotto rimane fuori dallo scope delle misure seriali routing.

Il build della tree combinata, record `4000714586-command-55084-0`,
è OK/STABLE/exit0 con690 sorgenti/documenti e854 test più2smoke,
senza avvisi. I test esistenti non esercitano le nuove API ACTIVE: questo
PASS non ne attesta C1/C4. I congelamenti F0/copertura/misura precedenti
mantengono fonte e scope. Preimage di ASDF, indice e changelog sono
conservate; entrambe le aggiunte rimangono nella tree finale.

## Integrazione della suite GET finale

La PR9 porta main a `644e53f176d0dce2c5ac5870659e7d89c0c9df3e`:
aggiunge70 test GET, caricamento della suite, scope GET di copertura e
documentazione. Non modifica sorgenti di prodotto o i predicati di
copertura Series/execution. L'integrazione conserva i precedenti delta.

Il build combinato `4000715110-command-98694-0` è OK/STABLE/exit0,
con694 sorgenti/documenti,924 test nominati e2smoke, senza avvisi;
cache FASL privata, circa22,71s. Questo controllo ripete la suite con i
nuovi test; F0, copertura e misure routing mantengono le basi originali.
Non è una nuova qualifica delle API ACTIVE, del pool o del motore.
")))
