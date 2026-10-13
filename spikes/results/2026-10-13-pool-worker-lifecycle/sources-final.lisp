(:SCHEMA-VERSION 1 :KIND :POOL-WORKER-LIFECYCLE-FINAL-SOURCES :VERSION
 "c4bbb037b779d33ee9e8c01b4a33aac875ccf96f" :PART 1 :PARTS 1 :SOURCES
 ((:PATH
   #A((73) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/arcdocdb.asd")
   :BYTES 14496 :SHA256 "2e1185465e9cf14b91065fa9b8074de3837fb602bfb81e7ffbff2174ca2713aa"
   :GIT-BLOB "b16c8b0d9b5cdcd7f13d49d13b2b99b8e0d27764" :TEXT
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
                             (:file \"lifecycle-update\")))
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
                             (:file \"prepare\") (:file \"source\"))))
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
                :components ((:file \"support\") (:file \"controller\") (:file \"lifecycle\")))
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
   :BYTES 8539 :SHA256 "80131677c6f5fcc022ac68720985a82e417e9acc284456543fd9e534952cc271" :GIT-BLOB
   "eb5f657f4e7c2127615c5260ab95cd6a9535f506" :TEXT "# Implementazione

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
| Confine I/O | [Append, pread e flush durevole](io.md) | [`src/io/`](../../src/io/) |
| Associazione dei file | [Device/inode e capacità readonly/append del medesimo ACTIVE](associazione-file.md) | [`src/io/identity.lisp`](../../src/io/identity.lisp) |
| Nuovo segmento writer | [Header durevole, rilettura, directory e sorgente certificata](inizializzazione-active.md) | [`src/active/`](../../src/active/) |
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
   #A((87) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/package.lisp")
   :BYTES 611 :SHA256 "5a139172de1648b30e09fdc6fc068141299c2034702f8d5b5f44bb0de14a3112" :GIT-BLOB
   "cec9b27dc26bd5ea50553704d2d2864a0d0ab045" :TEXT
   ";;;; Politica e attuatore logico del pool; thread preesistenti, nessuna attesa.
;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008 REQ-AFF-013
(defpackage #:arcdocdb.scheduler
  (:use #:cl)
  (:import-from #:arcdocdb.conditions #:invalid-argument #:invariant-violation
                #:resource-exhausted)
  (:export #:controllore-pool #:crea-controllore-pool
           #:aggiorna-controllore-pool #:leggi-controllore-pool
           #:porta-worker-pool #:crea-porta-worker-pool #:applica-stato-worker-pool
           #:registro-pool #:crea-registro-pool #:leggi-registro-pool
           #:aggiorna-registro-pool))
")
  (:PATH
   #A((89) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/support.lisp")
   :BYTES 2828 :SHA256 "300234f9ac7931f8c8b9bf305498a2742a3b8868dd9158dbab8c7fdceed5a1e4" :GIT-BLOB
   "f2301a1adf44c33284aaa1171acd90c5828b0396" :TEXT
   ";;;; Fixture del controllore: campioni e tempo iniettati, oracoli senza slot privati.
(defpackage #:arcdocdb.scheduler.tests
  (:use #:cl)
  (:import-from #:arcdocdb.foundation.tests #:is #:signals)
  (:import-from #:arcdocdb.conditions #:invalid-argument #:invariant-violation #:resource-exhausted
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
   #A((95) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/lifecycle-build.lisp")
   :BYTES 3949 :SHA256 "d6d67faf8721f26e7fcd228d6ab9a7dfdc36ff5ec56c67ed9e5fb6d914006a9e" :GIT-BLOB
   "379a139fdf6d202937a44af3ceae4444a26ed48a" :TEXT
   ";;; OWNER: costruzione e binding sul coordinator; porte create sul rispettivo worker.
;;; SHARED: configurazione pubblicata dal chiamante dopo handshake di avvio.
(in-package #:arcdocdb.scheduler)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (arcdocdb.execution:contesto-worker-writer
                          &key (:coordinator t) (:active t)) porta-worker-pool)
                crea-porta-worker-pool))
(defun crea-porta-worker-pool (context &key (coordinator sb-thread:*current-thread*) (active t))
  \"Pre: worker owner corrente, contesto IDLE verificato; nessun altro compito/epoca.
Post: porta preallocata, stato iniziale confermato. INVALID-ARGUMENT coordinator/bit;
propaga barriera C1 read-only. Pubblicazione tra thread a carico dell'handshake di avvio.\"
  (unless (typep coordinator 'sb-thread:thread)
    (error 'invalid-argument :reason :pool-owner))
  (unless (typep active 'boolean) (error 'invalid-argument :reason :pool-active))
  (arcdocdb.execution::%richiedi-worker context :idle)
  (let ((word (if active 1 0)))
    (%make-porta-worker-pool sb-thread:*current-thread* coordinator context word word)))

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (controllore-pool t fixnum) sb-thread:thread) %pool-startup-owner))
(defun %pool-startup-owner (controller port position)
  \"Pre: controller owner corrente, indice bounded. Post: porta stabile e owner restituito.
INVALID-ARGUMENT tipo, coordinatore, binding o stato iniziale non conforme.\"
  (unless (typep port 'porta-worker-pool) (error 'invalid-argument :reason :pool-ports))
  (unless (eq (porta-worker-pool-coordinator port) sb-thread:*current-thread*)
    (error 'invalid-argument :reason :pool-owner))
  (when (porta-worker-pool-bound port) (error 'invalid-argument :reason :pool-binding))
  (unless (and (<= (porta-worker-pool-request port) 1)
               (= (porta-worker-pool-request port) (porta-worker-pool-ack port))
               (eq (oddp (porta-worker-pool-request port))
                   (< position (controllore-pool-target controller))))
    (error 'invalid-argument :reason :pool-port-state))
  (porta-worker-pool-owner port))

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (controllore-pool t) simple-vector) %pool-validate-ports))
(defun %pool-validate-ports (controller ports)
  \"Pre: controller owner verificato. Post: tutte le porte validabili senza binding.
INVALID-ARGUMENT forma, owner duplicato, coordinatore, pending, prefix o binding.
Hash EQ solo all'avvio: scansione bounded O(N), nessuna ricerca quadratica.\"
  (unless (and (typep ports 'simple-vector)
               (= (controllore-pool-maximum controller) (length ports)))
    (error 'invalid-argument :reason :pool-ports))
  (let ((owners (make-hash-table :test #'eq :size (length ports))))
    (dotimes (i (length ports))
      (let ((owner (%pool-startup-owner controller (svref ports i) i)))
        (when (gethash owner owners)
          (error 'invalid-argument :reason :pool-ports))
        (setf (gethash owner owners) t))))
  ports)

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008 REQ-AFF-013
(declaim (ftype (function (controllore-pool t) registro-pool) crea-registro-pool))
(defun crea-registro-pool (controller ports)
  \"Pre: controller locale, startup stabile con worker distinti; target attivo a prefisso.
Post: copia privata e binding permanente delle porte, allocazioni solo all'avvio.
Tutti i rifiuti typed precedono il binding; usare solo wrapper dopo il collegamento.\"
  (%check-pool controller)
  (%pool-validate-ports controller ports)
  (let* ((copy (copy-seq ports))
         (registry (%make-registro-pool controller copy sb-thread:*current-thread*
                                      (controllore-pool-target controller))))
    (dotimes (i (length copy)) (setf (porta-worker-pool-bound (svref copy i)) t))
    registry))
")
  (:PATH
   #A((94) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/lifecycle-read.lisp")
   :BYTES 3018 :SHA256 "c60e1d5f67eeafb216b374fa001d27f87d1a734c5d066fc092902c0301069200" :GIT-BLOB
   "261ef5a3b909b3f552df0eb57fb2124d92be502c" :TEXT
   ";;; OWNER: diagnostica del registro al coordinatore, ack solo al proprio worker.
;;; SHARED: letture acquire di parole CAS fixnum indipendenti per worker.
(in-package #:arcdocdb.scheduler)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (porta-worker-pool) (values pool-command pool-command &optional))
                %pool-port-words))
(defun %pool-port-words (port)
  \"Pre: coordinator esclusivo o worker owner. Post: parole acquire coerenti.
INVARIANT-VIOLATION :POOL-PORT-STATE se comando duplicato, regressivo o salto.\"
  (let ((request (porta-worker-pool-request port)) (ack (porta-worker-pool-ack port)))
    (sb-thread:barrier (:read))
    (unless (or (= request ack)
                (and (= (ash request -1) (1+ (ash ack -1)))
                     (not (eq (oddp request) (oddp ack)))))
      (error 'invariant-violation :reason :pool-port-state))
    (values request ack)))

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (registro-pool) null) %check-registro-pool))
(defun %check-registro-pool (registry)
  \"Pre: accesso non rientrante. Post: owner e target/controller coerenti.
INVALID-ARGUMENT owner; INVARIANT-VIOLATION target o capacità privata.\"
  (unless (eq (registro-pool-owner registry) sb-thread:*current-thread*)
    (error 'invalid-argument :reason :pool-owner))
  (%check-pool (registro-pool-controller registry))
  (unless (and (= (registro-pool-target registry)
                  (controllore-pool-target (registro-pool-controller registry)))
               (= (controllore-pool-maximum (registro-pool-controller registry))
                  (length (registro-pool-ports registry))))
    (error 'invariant-violation :reason :pool-state))
  nil)

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008 REQ-AFF-013
(declaim (ftype (function (registro-pool) (values pool-workers pool-workers boolean &optional))
                leggi-registro-pool))
(defun leggi-registro-pool (registry)
  \"Pre: owner esclusivo; porte private non modificate esternamente.
Post: actual da ACK, target, pending da REQUEST/=ACK. Snapshot progressivo bounded;
senza pending tutte le conferme corrispondono al target. Propaga verificatori typed.\"
  (%check-registro-pool registry)
  (let ((actual 0) (pending nil) (ports (registro-pool-ports registry)))
    (declare (type (integer 0 131072) actual))
    (dotimes (i (length ports))
      (multiple-value-bind (request ack) (%pool-port-words (svref ports i))
        (unless (eq (oddp request) (< i (registro-pool-target registry)))
          (error 'invariant-violation :reason :pool-port-state))
        (when (oddp ack) (incf actual))
        (unless (= request ack) (setf pending t))))
    (unless (<= (controllore-pool-minimum (registro-pool-controller registry)) actual
                (controllore-pool-maximum (registro-pool-controller registry)))
      (error 'invariant-violation :reason :pool-state))
    (values actual (registro-pool-target registry) pending)))
")
  (:PATH
   #A((95) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/lifecycle-types.lisp")
   :BYTES 1961 :SHA256 "4fe980e00f1d273e9b8278cd2daace6b4a9e4ab948ddfac83b79f4b0c537cb7c" :GIT-BLOB
   "56dc619b46eb6cb3cbe934be586a8fc13e769b34" :TEXT
   ";;;; Attivazione logica di worker preesistenti; nessun thread o attesa nel prodotto.
;;; OWNER: contesto e ack al worker; request/binding al coordinatore non rientrante.
;;; SHARED: una porta per worker, al massimo un comando per campione (INV-P6).
(in-package #:arcdocdb.scheduler)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008
(deftype pool-command () '(and fixnum unsigned-byte))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-005 REQ-AFF-008
(defstruct (porta-worker-pool
             (:constructor %make-porta-worker-pool (owner coordinator context request ack))
             (:copier nil))
  \"Pre: creazione sul worker IDLE, coordinator valido. Post: stato iniziale confermato.
REQUEST/ACK = 2*generazione + bit attivo; un solo comando outstanding, mai reset.
Il ritiro conserva contesto, thread e diagnostica; non trasferisce obblighi.\"
  (owner sb-thread:*current-thread* :type sb-thread:thread :read-only t)
  (coordinator sb-thread:*current-thread* :type sb-thread:thread :read-only t)
  (context (error 'invariant-violation :reason :pool-port-state)
           :type arcdocdb.execution:contesto-worker-writer :read-only t)
  (request 1 :type pool-command) (ack 1 :type pool-command)
  (bound nil :type boolean))

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008 REQ-AFF-013
(defstruct (registro-pool
             (:constructor %make-registro-pool (controller ports owner target)) (:copier nil))
  \"Pre: porte distinte, stabili e prefisso attivo uguale al target del controller.
Post: vettore privato, binding permanente; accesso owner-only senza snapshot heap.
ACTUAL conta conferme logiche, non thread OS o stato di salute dell'Archivio.\"
  (controller (error 'invariant-violation :reason :pool-state)
              :type controllore-pool :read-only t)
  (ports #() :type simple-vector :read-only t)
  (owner sb-thread:*current-thread* :type sb-thread:thread :read-only t)
  (target 1 :type pool-workers))
")
  (:PATH
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/lifecycle-update.lisp")
   :BYTES 3416 :SHA256 "2020e46809e9fe8fa74e061a420b8085679d5f461eabd8b044f3975c1024800e" :GIT-BLOB
   "34d4685b42ec26942109309666d85093a53146fd" :TEXT
   ";;; OWNER: coordinator unico, fuori dai compiti di richiesta e non rientrante.
;;; SHARED: richieste CAS per porta, una sola ondata monotona in corso (INV-P6).
(in-package #:arcdocdb.scheduler)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (porta-worker-pool pool-command pool-command) null) %pool-request-command))
(defun %pool-request-command (port old word)
  \"Pre: coordinatore esclusivo, parola validata, OLD corrente. Post: REQUEST pubblicata.
INVARIANT-VIOLATION :POOL-PORT-STATE su conflitto; non attesta un comando fallito.\"
  (sb-thread:barrier (:write))
  (unless (= old (sb-ext:compare-and-swap (porta-worker-pool-request port) old word))
    (error 'invariant-violation :reason :pool-port-state))
  nil)

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (registro-pool) null) %pool-generation-budget))
(defun %pool-generation-budget (registry)
  \"Pre: owner e porte stabili. Post: una nuova generazione disponibile su ogni porta.
RESOURCE-EXHAUSTED :POOL-GENERATION prima di campione/comandi; nessun wrap/reset.
Preflight conservativo anche per hold: l'esaurimento richiede sostituzione amministrativa.\"
  (let ((ports (registro-pool-ports registry)))
    (dotimes (i (length ports))
      (unless (< (ash (porta-worker-pool-request (svref ports i)) -1)
                 (ash most-positive-fixnum -1))
        (error 'resource-exhausted :reason :pool-generation))))
  nil)

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (registro-pool pool-workers) null) %pool-publish-target))
(defun %pool-publish-target (registry target)
  \"Pre: porte stabili, generazioni disponibili, nuovo target validato dal controller.
Post: solo bit modificati ricevono generation+1; ACK esclusivo resta al worker.
Un'ondata cresce oppure ritira: finché pending, actual differisce dal target.\"
  (let ((ports (registro-pool-ports registry)))
    (dotimes (i (length ports))
      (let* ((port (svref ports i)) (old (porta-worker-pool-request port))
             (active (< i target)))
        (unless (eq (oddp old) active)
          (let ((word (+ (logand old -2) 2 (if active 1 0))))
            (%pool-request-command port old word)))))
    (setf (registro-pool-target registry) target))
  nil)

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008 REQ-AFF-013
(declaim (ftype (function (registro-pool t t t t)
                         (values pool-workers (member :hold :pending :grow :shrink)
                                 pool-workers boolean &optional)) aggiorna-registro-pool))
(defun aggiorna-registro-pool (registry tick queue cpu p99)
  \"Pre: owner esclusivo; tempo e metriche iniettati come nel controller.
Post: target, azione, actual letto prima del campione, pending corrente/conservativo.
Nessuna nuova ondata finché esistono ACK pendenti; nessun blocco/allocazione normale.
Preflight typed prima delle scritture; controller collegato aggiornato solo qui.\"
  (multiple-value-bind (actual old-target pending) (leggi-registro-pool registry)
    (unless pending (%pool-generation-budget registry))
    (multiple-value-bind (target action)
        (aggiorna-controllore-pool (registro-pool-controller registry) tick queue cpu p99 actual)
      (unless (= target old-target)
        (%pool-publish-target registry target)
        (setf pending t))
      (values target action actual pending))))
")
  (:PATH
   #A((96) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/src/scheduler/lifecycle-worker.lisp")
   :BYTES 2191 :SHA256 "ec8b462ff3f5f7a6435f0f0c01b62034d8de2a784a9e354d469a0adfec9cf837" :GIT-BLOB
   "70224b35cb011adbc0caa7738ef61fd0f2564f09" :TEXT
   ";;; OWNER: passo bounded sul thread della porta, tra compiti a completamento.
;;; SHARED: ACK release/CAS per ondata; nessun campo writer/Serie modificato.
(in-package #:arcdocdb.scheduler)
(declaim (optimize (safety 3) (speed 2) (debug 2)))

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (porta-worker-pool pool-command pool-command) null) %pool-ack-command))
(defun %pool-ack-command (port old word)
  \"Pre: worker owner verificato, barriera IDLE passata, OLD letto acquire. Post: ACK pubblicato.
INVARIANT-VIOLATION :POOL-PORT-STATE su conflitto; nessun falso successo.\"
  (sb-thread:barrier (:write))
  (unless (= old (sb-ext:compare-and-swap (porta-worker-pool-ack port) old word))
    (error 'invariant-violation :reason :pool-port-state))
  nil)

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-CON-004 REQ-CON-005 REQ-AFF-008
(declaim (ftype (function (porta-worker-pool)
                         (values boolean (member :unchanged :activated :retired :busy :faulted)
                                 &optional)) applica-stato-worker-pool))
(defun applica-stato-worker-pool (port)
  \"Pre: owner corrente non rientrante; chiamare tra compiti, senza epoca/risorse esterne.
Post: bit actual e stato; conferma soltanto dopo barriera C1 IDLE completa.
BUSY/FAULTED conservano comando e obblighi; nessuna revoca, release, reset o attesa.
INVALID-ARGUMENT owner; invarianti della porta/contesto propagate senza occultarle.\"
  (unless (eq (porta-worker-pool-owner port) sb-thread:*current-thread*)
    (error 'invalid-argument :reason :pool-worker-owner))
  (multiple-value-bind (request ack) (%pool-port-words port)
    (when (= request ack)
      (return-from applica-stato-worker-pool (values (oddp ack) :unchanged)))
    (let* ((context (porta-worker-pool-context port))
           (state (arcdocdb.execution:stato-worker-writer context)))
      (unless (eq state :idle)
        (return-from applica-stato-worker-pool
          (values (oddp ack) (if (eq state :faulted) :faulted :busy))))
      (arcdocdb.execution::%richiedi-worker context :idle))
    (%pool-ack-command port ack request)
    (values (oddp request) (if (oddp request) :activated :retired))))
")
  (:PATH
   #A((91) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tests/scheduler/lifecycle.lisp")
   :BYTES 33440 :SHA256 "eff59c0cf6d9c6c1ddec57a4efa26a8fcaeedc850b77764b818bc1c22eb73e38"
   :GIT-BLOB "874391809401f42a4db81fe544306165f99ceb5d" :TEXT
   ";;;; Lifecycle di worker reali distinti; i canali bloccanti appartengono alla fixture.
;;;; FI quiescenti dichiarate verificano atomicità dei rifiuti e campi conservati.
(in-package #:arcdocdb.scheduler.tests)

(defstruct (lifecycle-fixture (:constructor %make-lifecycle-fixture (active coordinator)))
  (active t :type boolean :read-only t)
  (coordinator sb-thread:*current-thread* :type sb-thread:thread :read-only t)
  (ready (sb-thread:make-semaphore) :type sb-thread:semaphore :read-only t)
  (work (sb-thread:make-semaphore) :type sb-thread:semaphore :read-only t)
  (done (sb-thread:make-semaphore) :type sb-thread:semaphore :read-only t)
  (thread nil :type (or null sb-thread:thread))
  (context nil :type (or null arcdocdb.execution:contesto-worker-writer))
  (port nil :type (or null arcdocdb.scheduler:porta-worker-pool))
  (command nil :type (or null function keyword))
  (result nil :type t))

(defun lifecycle-fixture-main (fixture)
  \"Il thread crea e possiede context/porta; massimo 64 comandi con attese da 15s.\"
  (let* ((ready (arcdocdb.execution:crea-lista-writer-pronti :shards 1 :capacity 2))
         (context (arcdocdb.execution:crea-contesto-worker-writer ready)))
    (setf (lifecycle-fixture-context fixture) context
          (lifecycle-fixture-port fixture)
          (arcdocdb.scheduler:crea-porta-worker-pool
           context :coordinator (lifecycle-fixture-coordinator fixture)
           :active (lifecycle-fixture-active fixture)))
    (sb-thread:signal-semaphore (lifecycle-fixture-ready fixture))
    (loop repeat 64
          do (pool-wait (lifecycle-fixture-work fixture))
             (let ((command (lifecycle-fixture-command fixture)))
               (when (eq command :stop) (return-from lifecycle-fixture-main :ok))
               (setf (lifecycle-fixture-result fixture)
                     (handler-case (funcall command fixture) (error (condition) condition)))
               (sb-thread:signal-semaphore (lifecycle-fixture-done fixture)))
          finally (error \"Budget dei comandi della fixture esaurito.\"))))

(defun lifecycle-fixture-start (active)
  (let ((fixture (%make-lifecycle-fixture active sb-thread:*current-thread*)))
    (setf (lifecycle-fixture-thread fixture)
          (pool-thread \"pool-lifecycle-owner\" (lambda () (lifecycle-fixture-main fixture))))
    (handler-case (pool-wait (lifecycle-fixture-ready fixture))
      (error (condition)
        (pool-stop-threads (list (lifecycle-fixture-thread fixture))) (error condition)))
    fixture))

(defun lifecycle-call (fixture command)
  (setf (lifecycle-fixture-command fixture) command)
  (sb-thread:signal-semaphore (lifecycle-fixture-work fixture))
  (pool-wait (lifecycle-fixture-done fixture))
  (let ((result (lifecycle-fixture-result fixture)))
    (when (typep result 'error) (error result))
    result))

(defun lifecycle-fixtures-stop (fixtures)
  (dolist (fixture fixtures)
    (let ((thread (lifecycle-fixture-thread fixture)))
      (when (sb-thread:thread-alive-p thread)
        (setf (lifecycle-fixture-command fixture) :stop)
        (sb-thread:signal-semaphore (lifecycle-fixture-work fixture)))
      (unwind-protect (pool-join thread) (pool-stop-threads (list thread)))))
  nil)

(defun lifecycle-ports (fixtures)
  (map 'simple-vector #'lifecycle-fixture-port fixtures))

(defun lifecycle-registry-state (registry)
  (multiple-value-list (arcdocdb.scheduler:leggi-registro-pool registry)))

(defun lifecycle-words (port)
  \"FI/snapshot quiescente: parole e binding, senza derivare la politica attesa.\"
  (list (arcdocdb.scheduler::porta-worker-pool-request port)
        (arcdocdb.scheduler::porta-worker-pool-ack port)
        (arcdocdb.scheduler::porta-worker-pool-bound port)))

(defun lifecycle-check-worker (fixture active status)
  (lifecycle-call fixture
                  (lambda (owned)
                    (multiple-value-bind (actual action)
                        (arcdocdb.scheduler:applica-stato-worker-pool (lifecycle-fixture-port owned))
                      (is (eq active actual)) (is (eq status action)) :ok))))

(defun lifecycle-context-state (context)
  \"Solo immagine FI dei debiti: non fornisce l'ordine atteso delle transizioni.\"
  (list (arcdocdb.execution::contesto-worker-writer-state context)
        (arcdocdb.execution::contesto-worker-writer-writer context)
        (arcdocdb.execution::contesto-worker-writer-lease context)
        (arcdocdb.execution::contesto-worker-writer-pending context)
        (arcdocdb.execution::contesto-worker-writer-batch-generation context)
        (arcdocdb.execution::contesto-worker-writer-cursor context)
        (arcdocdb.execution::contesto-worker-writer-home context)
        (arcdocdb.execution::contesto-worker-writer-fault context)))

(defun lifecycle-owned-busy (fixture phase &optional (status :busy))
  (let* ((context (lifecycle-fixture-context fixture)) (port (lifecycle-fixture-port fixture))
         (before (lifecycle-context-state context)) (words (lifecycle-words port)))
    (is (eq phase (arcdocdb.execution:stato-worker-writer context)))
    (multiple-value-bind (actual action) (arcdocdb.scheduler:applica-stato-worker-pool port)
      (is actual) (is (eq status action)))
    (is (equal before (lifecycle-context-state context)))
    (is (equal words (lifecycle-words port)))))

(defun lifecycle-owned-writer (fixture count)
  (let ((writer (arcdocdb.execution:crea-writer-programmabile :capacity 4 :quantum 1)))
    (dotimes (i count)
      (multiple-value-bind (size action) (arcdocdb.execution:accoda-lavoro-writer writer i)
        (is (= (1+ i) size)) (is (eq (if (zerop i) :schedule :queued) action))))
    (is (null (arcdocdb.execution:adotta-writer-worker
               (lifecycle-fixture-context fixture) writer 0)))
    writer))

(defun lifecycle-queue-busy (queue thunk)
  \"FI di contesa quiescente: prende/rilascia la guardia con gli stessi CAS del writer.\"
  (let ((owner sb-thread:*current-thread*))
    (is (null (sb-ext:compare-and-swap (arcdocdb.execution::coda-writer-guard queue) nil owner)))
    (unwind-protect (funcall thunk)
      (is (eq owner (sb-ext:compare-and-swap
                     (arcdocdb.execution::coda-writer-guard queue) owner nil))))))

(defun lifecycle-check-update (registry tick queue cpu p99 target action actual pending)
  (multiple-value-bind (next status count outstanding)
      (arcdocdb.scheduler:aggiorna-registro-pool registry tick queue cpu p99)
    (is (= target next)) (is (eq status action))
    (is (= actual count)) (is (eq pending outstanding))))

(defun lifecycle-start-retirement (controller registry)
  (is (= 2 (first (pool-state controller))))
  (lifecycle-check-update registry 0 0 0 1200 2 :hold 2 nil)
  (lifecycle-check-update registry 500 0 0 1200 1 :shrink 2 t)
  (is (equal '(2 1 t) (lifecycle-registry-state registry))))

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-port-owner-and-registry-coordinator-are-distinct
  (let* ((worker (lifecycle-fixture-start t)) (port (lifecycle-fixture-port worker))
         (controller (crea-controllore-pool 1 :maximum 1))
         (registry (arcdocdb.scheduler:crea-registro-pool controller (vector port))))
    (unwind-protect
         (progn
           (signals invalid-argument (arcdocdb.scheduler:applica-stato-worker-pool port)
                    :pool-worker-owner)
           (signals invalid-argument
             (arcdocdb.scheduler:crea-porta-worker-pool (lifecycle-fixture-context worker))
             :worker-owner)
           (lifecycle-call
            worker (lambda (owned)
                     (declare (ignore owned))
                     (signals invalid-argument (arcdocdb.scheduler:leggi-registro-pool registry)
                              :pool-owner)
                     (signals invalid-argument
                       (arcdocdb.scheduler:aggiorna-registro-pool registry 0 0 0 0) :pool-owner)
                     :ok))
           (is (equal '(1 1 nil) (lifecycle-registry-state registry)))
           (lifecycle-check-worker worker t :unchanged))
      (lifecycle-fixtures-stop (list worker)))))

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-THR-001-pool-activation-retirement-await-real-worker-acks
  (let* ((workers (list (lifecycle-fixture-start t) (lifecycle-fixture-start nil)))
         (controller (crea-controllore-pool 1 :dwell 500))
         (registry (arcdocdb.scheduler:crea-registro-pool controller (lifecycle-ports workers)))
         (second (second workers)))
    (unwind-protect
         (progn
           (lifecycle-check-worker second nil :unchanged)
           (lifecycle-check-update registry 0 8 0 0 1 :hold 1 nil)
           (lifecycle-check-update registry 500 8 0 0 2 :grow 1 t)
           (is (equal '(1 2 t) (lifecycle-registry-state registry)))
           (let ((before (lifecycle-words (lifecycle-fixture-port second))))
             (lifecycle-check-update registry 1000 0 1000 10000 2 :pending 1 t)
             (is (equal before (lifecycle-words (lifecycle-fixture-port second)))))
           (lifecycle-check-worker second t :activated)
           (is (equal '(2 2 nil) (lifecycle-registry-state registry)))
           (lifecycle-check-update registry 1500 0 1000 10000 2 :hold 2 nil)
           (lifecycle-check-update registry 2000 0 1000 10000 1 :shrink 2 t)
           (lifecycle-check-update registry 2500 0 1000 10000 1 :pending 2 t)
           (lifecycle-check-worker second nil :retired)
           (lifecycle-check-worker second nil :unchanged)
           (is (equal '(1 1 nil) (lifecycle-registry-state registry)))
           (lifecycle-check-worker (first workers) t :unchanged))
      (lifecycle-fixtures-stop workers))))

;;; REQ: REQ-THR-001 REQ-AFF-008 REQ-AFF-013
(deftest test-REQ-AFF-008-pool-registry-copies-caller-vector-and-binds-once
  (let* ((workers (list (lifecycle-fixture-start t) (lifecycle-fixture-start nil)))
         (ports (lifecycle-ports workers)) (controller (crea-controllore-pool 1 :dwell 500))
         (registry (arcdocdb.scheduler:crea-registro-pool controller ports)))
    (unwind-protect
         (progn
           (signals invalid-argument
             (arcdocdb.scheduler:crea-registro-pool controller ports) :pool-binding)
           (setf (svref ports 0) :changed (svref ports 1) nil)
           (is (equal '(1 1 nil) (lifecycle-registry-state registry)))
           (lifecycle-check-update registry 0 8 0 0 1 :hold 1 nil)
           (lifecycle-check-update registry 500 8 0 0 2 :grow 1 t)
           (lifecycle-check-worker (second workers) t :activated)
           (is (equal '(2 2 nil) (lifecycle-registry-state registry))))
      (lifecycle-fixtures-stop workers))))

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-registry-invalid-shape-does-not-bind-any-port
  (let* ((workers (list (lifecycle-fixture-start t) (lifecycle-fixture-start nil)))
         (ports (lifecycle-ports workers)) (controller (crea-controllore-pool 1)))
    (unwind-protect
         (progn
           (dolist (bad (list nil '(nil nil) (vector) (vector (svref ports 0))
                             (vector (svref ports 0) :invalid)
                             (vector (svref ports 0) (svref ports 1) (svref ports 1))
                             (make-array 2 :adjustable t :initial-contents (coerce ports 'list))))
             (signals invalid-argument (arcdocdb.scheduler:crea-registro-pool controller bad)
                      :pool-ports)
             (dolist (port (coerce ports 'list))
               (is (not (arcdocdb.scheduler::porta-worker-pool-bound port)))))
           (signals invalid-argument
             (arcdocdb.scheduler:crea-registro-pool
              (crea-controllore-pool 1 :initial 2)
              (vector (svref ports 0) (svref ports 0))) :pool-ports)
           (signals invalid-argument
             (arcdocdb.scheduler:crea-registro-pool
              controller (vector (svref ports 1) (svref ports 0))) :pool-port-state)
           (is (equal '(1 1 nil)
                      (lifecycle-registry-state
                       (arcdocdb.scheduler:crea-registro-pool controller ports)))))
      (lifecycle-fixtures-stop workers))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-AFF-008
(deftest test-REQ-CON-001-pool-retirement-preserves-claim-lease-batch-and-finishing
  (let* ((workers (list (lifecycle-fixture-start t) (lifecycle-fixture-start t)))
         (controller (crea-controllore-pool 1 :initial 2 :dwell 500))
         (registry (arcdocdb.scheduler:crea-registro-pool controller (lifecycle-ports workers))))
    (unwind-protect
         (progn
           (lifecycle-start-retirement controller registry)
           (lifecycle-call
            (second workers)
            (lambda (owned)
              (let* ((context (lifecycle-fixture-context owned))
                     (writer (lifecycle-owned-writer owned 1)))
                (lifecycle-owned-busy owned :claimed)
                (is (plusp (arcdocdb.execution:inizia-tratto-worker context)))
                (lifecycle-owned-busy owned :running)
                (multiple-value-bind (count status token)
                    (arcdocdb.execution:preleva-lavori-worker context (vector nil) 0 1)
                  (is (= 1 count)) (is (eq status :messages))
                  (lifecycle-owned-busy owned :batch)
                  (is (null (arcdocdb.execution:conferma-lavori-worker context token))))
                (lifecycle-queue-busy
                 (arcdocdb.execution::writer-programmabile-queue writer)
                 (lambda ()
                   (signals arcdocdb.conditions:resource-exhausted
                     (arcdocdb.execution:termina-tratto-worker context) :writer-queue-busy)
                   (lifecycle-owned-busy owned :finishing)))
                (is (eq :idle (arcdocdb.execution:termina-tratto-worker context)))
                :ok)))
           (is (equal '(2 1 t) (lifecycle-registry-state registry)))
           (lifecycle-check-worker (second workers) nil :retired)
           (is (equal '(1 1 nil) (lifecycle-registry-state registry))))
      (lifecycle-fixtures-stop workers))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-002 REQ-AFF-008
(deftest test-REQ-CON-002-pool-reschedule-obligation-blocks-retirement-until-transfer
  (let* ((workers (list (lifecycle-fixture-start t) (lifecycle-fixture-start t)))
         (controller (crea-controllore-pool 1 :initial 2 :dwell 500))
         (registry (arcdocdb.scheduler:crea-registro-pool controller (lifecycle-ports workers))))
    (unwind-protect
         (progn
           (lifecycle-start-retirement controller registry)
           (lifecycle-call
            (second workers)
            (lambda (owned)
              (let ((context (lifecycle-fixture-context owned)))
                (lifecycle-owned-writer owned 2)
                (is (plusp (arcdocdb.execution:inizia-tratto-worker context)))
                (multiple-value-bind (count status token)
                    (arcdocdb.execution:preleva-lavori-worker context (vector nil) 0 1)
                  (is (= 1 count)) (is (eq :messages status))
                  (is (null (arcdocdb.execution:conferma-lavori-worker context token))))
                (is (eq :schedule (arcdocdb.execution:termina-tratto-worker context)))
                (lifecycle-owned-busy owned :reschedule)
                (multiple-value-bind (writer status count) (arcdocdb.execution:ricircola-worker context)
                  (is (null writer)) (is (eq :published status)) (is (= 1 count)))
                :ok)))
           (lifecycle-check-worker (second workers) nil :retired)
           (is (equal '(1 1 nil) (lifecycle-registry-state registry))))
      (lifecycle-fixtures-stop workers))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-CON-004 REQ-AFF-008
(deftest test-REQ-CON-004-pool-faulted-worker-retains-command-reference-and-diagnostic
  (let* ((workers (list (lifecycle-fixture-start t) (lifecycle-fixture-start t)))
         (controller (crea-controllore-pool 1 :initial 2 :dwell 500))
         (registry (arcdocdb.scheduler:crea-registro-pool controller (lifecycle-ports workers))))
    (unwind-protect
         (progn
           (lifecycle-start-retirement controller registry)
           (lifecycle-call
            (second workers)
            (lambda (owned)
              (let ((context (lifecycle-fixture-context owned)))
                (lifecycle-owned-writer owned 1)
                ;; FI quiescente: l'indice corrotto produce il fault C1 al vero confine.
                (setf (arcdocdb.execution::contesto-worker-writer-cursor context) 1)
                (signals invariant-violation
                  (arcdocdb.execution:inizia-tratto-worker context) :worker-state)
                (is (typep (arcdocdb.execution:errore-worker-writer context) 'invariant-violation))
                (dotimes (attempt 2) (lifecycle-owned-busy owned :faulted :faulted))
                :ok)))
           (lifecycle-check-update registry 1000 8 0 0 1 :pending 2 t)
           (is (equal '(2 1 t) (lifecycle-registry-state registry))))
      (lifecycle-fixtures-stop workers))))

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-port-startup-validates-flags-coordinator-and-idle-debts
  (let ((worker (lifecycle-fixture-start t)))
    (unwind-protect
         (lifecycle-call
          worker
          (lambda (owned)
            (let ((context (lifecycle-fixture-context owned)))
              (dolist (bad '(nil :owner 0))
                (signals invalid-argument
                  (arcdocdb.scheduler:crea-porta-worker-pool context :coordinator bad) :pool-owner))
              (dolist (bad '(0 1 :active))
                (signals invalid-argument
                  (arcdocdb.scheduler:crea-porta-worker-pool context :active bad) :pool-active))
              (is (equal '(1 1 nil) (lifecycle-words
                                    (arcdocdb.scheduler:crea-porta-worker-pool context))))
              (is (equal '(0 0 nil) (lifecycle-words
                                    (arcdocdb.scheduler:crea-porta-worker-pool context :active nil))))
              (setf (arcdocdb.execution::contesto-worker-writer-pending context) 1)
              (signals invariant-violation
                (arcdocdb.scheduler:crea-porta-worker-pool context) :worker-state)
              (setf (arcdocdb.execution::contesto-worker-writer-pending context) 0)
              (lifecycle-owned-writer owned 1)
              (signals arcdocdb.conditions:resource-exhausted
                (arcdocdb.scheduler:crea-porta-worker-pool context) :worker-state)
              :ok)))
      (lifecycle-fixtures-stop (list worker)))))

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-startup-rejects-coordinator-and-reused-worker-owner
  (let ((worker (lifecycle-fixture-start t)))
    (unwind-protect
         (let* ((foreign
                  (lifecycle-call worker
                                  (lambda (owned)
                                    (arcdocdb.scheduler:crea-porta-worker-pool
                                     (lifecycle-fixture-context owned)))))
                (duplicates
                  (lifecycle-call
                   worker (lambda (owned)
                            (let* ((ready (arcdocdb.execution:crea-lista-writer-pronti))
                                   (context (arcdocdb.execution:crea-contesto-worker-writer ready)))
                              (vector (lifecycle-fixture-port owned)
                                      (arcdocdb.scheduler:crea-porta-worker-pool
                                       context :coordinator (lifecycle-fixture-coordinator owned)
                                       :active nil)))))))
           (signals invalid-argument
             (arcdocdb.scheduler:crea-registro-pool
              (crea-controllore-pool 1 :maximum 1) (vector foreign)) :pool-owner)
           (signals invalid-argument
             (arcdocdb.scheduler:crea-registro-pool (crea-controllore-pool 1) duplicates) :pool-ports)
           (is (not (arcdocdb.scheduler::porta-worker-pool-bound foreign)))
           (dotimes (i 2) (is (not (arcdocdb.scheduler::porta-worker-pool-bound (svref duplicates i))))))
      (lifecycle-fixtures-stop (list worker)))))

;;; REQ: REQ-THR-001 REQ-AFF-008 REQ-AFF-013
(deftest test-REQ-AFF-008-pool-startup-rejects-nonzero-or-pending-generation-before-binding
  (let* ((workers (list (lifecycle-fixture-start t) (lifecycle-fixture-start nil)))
         (ports (lifecycle-ports workers)) (controller (crea-controllore-pool 1))
         (second (svref ports 1)))
    (unwind-protect
         (progn
           (dolist (pair '((2 2) (3 0) (0 1)))
             (setf (arcdocdb.scheduler::porta-worker-pool-request second) (first pair)
                   (arcdocdb.scheduler::porta-worker-pool-ack second) (second pair))
             (let ((before (mapcar #'lifecycle-words (coerce ports 'list))))
               (signals invalid-argument
                 (arcdocdb.scheduler:crea-registro-pool controller ports) :pool-port-state)
               (is (equal before (mapcar #'lifecycle-words (coerce ports 'list))))))
           (setf (arcdocdb.scheduler::porta-worker-pool-request second) 0
                 (arcdocdb.scheduler::porta-worker-pool-ack second) 0)
           (is (equal '(1 1 nil)
                      (lifecycle-registry-state
                       (arcdocdb.scheduler:crea-registro-pool controller ports)))))
      (lifecycle-fixtures-stop workers))))

(defun lifecycle-raw-registry-state (registry)
  \"Snapshot FI non allocato dal prodotto; include target, controller e tutte le parole.\"
  (list (pool-state (arcdocdb.scheduler::registro-pool-controller registry))
        (arcdocdb.scheduler::registro-pool-target registry)
        (map 'list #'lifecycle-words (arcdocdb.scheduler::registro-pool-ports registry))))

;;; REQ: REQ-THR-001 REQ-AFF-008 REQ-AFF-013
(deftest test-REQ-AFF-008-pool-invalid-samples-do-not-mutate-controller-or-ports
  (let* ((workers (list (lifecycle-fixture-start t) (lifecycle-fixture-start nil)))
         (registry (arcdocdb.scheduler:crea-registro-pool
                    (crea-controllore-pool 1) (lifecycle-ports workers))))
    (unwind-protect
         (progn
           (lifecycle-check-update registry 1000 8 0 0 1 :hold 1 nil)
           (let ((before (lifecycle-raw-registry-state registry)))
             (dolist (entry '((0 :pool-tick nil -1 1099511627776)
                              (1 :pool-queue nil -1 1048577)
                              (2 :pool-cpu nil -1 1001)
                              (3 :pool-p99 nil -1 10001)))
               (destructuring-bind (position reason &rest values) entry
                 (dolist (bad values)
                   (let ((arguments (list 1500 8 0 0)))
                     (setf (nth position arguments) bad)
                     (signals invalid-argument
                       (apply #'arcdocdb.scheduler:aggiorna-registro-pool registry arguments) reason)
                     (is (equal before (lifecycle-raw-registry-state registry)))))))
             (signals invalid-argument
               (arcdocdb.scheduler:aggiorna-registro-pool registry 1499 8 0 0) :pool-sample-period)
             (is (equal before (lifecycle-raw-registry-state registry)))))
      (lifecycle-fixtures-stop workers))))

;;; REQ: REQ-THR-001 REQ-AFF-008 REQ-AFF-013
(deftest test-REQ-AFF-008-pool-generation-exhaustion-precedes-every-controller-and-port-write
  (let* ((workers (list (lifecycle-fixture-start t) (lifecycle-fixture-start nil)))
         (ports (lifecycle-ports workers))
         (registry (arcdocdb.scheduler:crea-registro-pool (crea-controllore-pool 1) ports)))
    (unwind-protect
         (progn
           (dotimes (exhausted 2)
             (let* ((port (svref ports exhausted))
                    (word (+ (* 2 (ash most-positive-fixnum -1)) (if (zerop exhausted) 1 0))))
               (setf (arcdocdb.scheduler::porta-worker-pool-request port) word
                     (arcdocdb.scheduler::porta-worker-pool-ack port) word)
               (let ((before (lifecycle-raw-registry-state registry)))
                 (dolist (queue '(0 8))
                   (signals arcdocdb.conditions:resource-exhausted
                     (arcdocdb.scheduler:aggiorna-registro-pool registry 0 queue 0 0) :pool-generation)
                   (is (equal before (lifecycle-raw-registry-state registry)))))
               (setf (arcdocdb.scheduler::porta-worker-pool-request port) (if (zerop exhausted) 1 0)
                     (arcdocdb.scheduler::porta-worker-pool-ack port) (if (zerop exhausted) 1 0))))
           (lifecycle-check-update registry 0 8 0 0 1 :hold 1 nil))
      (lifecycle-fixtures-stop workers))))

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-word-protocol-faults-refuse-reader-coordinator-and-worker
  (let* ((workers (list (lifecycle-fixture-start t) (lifecycle-fixture-start nil)))
         (registry (arcdocdb.scheduler:crea-registro-pool
                    (crea-controllore-pool 1) (lifecycle-ports workers)))
         (port (lifecycle-fixture-port (second workers))))
    (unwind-protect
         (progn
           (dolist (pair '((2 0) (4 0) (5 0) (0 2) (1 0) (0 1)))
             (setf (arcdocdb.scheduler::porta-worker-pool-request port) (first pair)
                   (arcdocdb.scheduler::porta-worker-pool-ack port) (second pair))
             (let ((before (lifecycle-raw-registry-state registry)))
               (signals invariant-violation (arcdocdb.scheduler:leggi-registro-pool registry)
                        :pool-port-state)
               (signals invariant-violation
                 (arcdocdb.scheduler:aggiorna-registro-pool registry 0 8 0 0) :pool-port-state)
               (lifecycle-call
                (second workers)
                (lambda (owned)
                  (signals invariant-violation
                    (arcdocdb.scheduler:applica-stato-worker-pool (lifecycle-fixture-port owned))
                    :pool-port-state) :ok))
               (is (equal before (lifecycle-raw-registry-state registry)))))
           (setf (arcdocdb.scheduler::porta-worker-pool-request port) 0
                 (arcdocdb.scheduler::porta-worker-pool-ack port) 0)
           (is (equal '(1 1 nil) (lifecycle-registry-state registry))))
      (lifecycle-fixtures-stop workers))))

;;; REQ: REQ-THR-001 REQ-CON-001 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-idle-debt-refuses-ack-without-poisoning-or-reset
  (let* ((workers (list (lifecycle-fixture-start t) (lifecycle-fixture-start t)))
         (controller (crea-controllore-pool 1 :initial 2 :dwell 500))
         (registry (arcdocdb.scheduler:crea-registro-pool controller (lifecycle-ports workers))))
    (unwind-protect
         (progn
           (lifecycle-start-retirement controller registry)
           (lifecycle-call
            (second workers)
            (lambda (owned)
              (let* ((context (lifecycle-fixture-context owned))
                     (port (lifecycle-fixture-port owned)) (words (lifecycle-words port)))
                ;; FI quiescente: IDLE incoerente non può confermare un ritiro.
                (setf (arcdocdb.execution::contesto-worker-writer-pending context) 1)
                (let ((before (lifecycle-context-state context)))
                  (signals invariant-violation
                    (arcdocdb.scheduler:applica-stato-worker-pool port) :worker-state)
                  (is (equal before (lifecycle-context-state context)))
                  (is (equal words (lifecycle-words port))))
                (setf (arcdocdb.execution::contesto-worker-writer-pending context) 0)
                :ok)))
           (lifecycle-check-worker (second workers) nil :retired))
      (lifecycle-fixtures-stop workers))))

;;; REQ: REQ-THR-001 REQ-AFF-008 REQ-AFF-013
(deftest test-REQ-AFF-008-pool-private-registry-target-capacity-prefix-and-count-invariants
  (let* ((workers (list (lifecycle-fixture-start t) (lifecycle-fixture-start nil)))
         (ports (lifecycle-ports workers)) (controller (crea-controllore-pool 1))
         (registry (arcdocdb.scheduler:crea-registro-pool controller ports)))
    (unwind-protect
         (progn
           (setf (arcdocdb.scheduler::registro-pool-target registry) 2)
           (signals invariant-violation (arcdocdb.scheduler:leggi-registro-pool registry) :pool-state)
           (setf (arcdocdb.scheduler::registro-pool-target registry) 1)
           (let ((small (funcall (symbol-function 'arcdocdb.scheduler::%make-registro-pool)
                                 controller (vector (svref ports 0)) sb-thread:*current-thread* 1)))
             (signals invariant-violation (arcdocdb.scheduler:leggi-registro-pool small) :pool-state))
           (setf (arcdocdb.scheduler::porta-worker-pool-request (svref ports 1)) 3)
           (signals invariant-violation (arcdocdb.scheduler:leggi-registro-pool registry)
                    :pool-port-state)
           (setf (arcdocdb.scheduler::porta-worker-pool-request (svref ports 1)) 0
                 (arcdocdb.scheduler::porta-worker-pool-request (svref ports 0)) 3
                 (arcdocdb.scheduler::porta-worker-pool-ack (svref ports 0)) 0)
           (signals invariant-violation (arcdocdb.scheduler:leggi-registro-pool registry) :pool-state)
           (setf (arcdocdb.scheduler::porta-worker-pool-request (svref ports 0)) 1
                 (arcdocdb.scheduler::porta-worker-pool-ack (svref ports 0)) 1)
           (is (equal '(1 1 nil) (lifecycle-registry-state registry))))
      (lifecycle-fixtures-stop workers))))

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-AFF-008-pool-cas-conflict-cannot-report-request-or-ack-success
  (let ((worker (lifecycle-fixture-start t)))
    (unwind-protect
         (progn
           (let* ((port (lifecycle-fixture-port worker)) (before (lifecycle-words port)))
             (signals invariant-violation
               (arcdocdb.scheduler::%pool-request-command port 3 4) :pool-port-state)
             (is (equal before (lifecycle-words port))))
           (lifecycle-call
            worker (lambda (owned)
                     (let* ((port (lifecycle-fixture-port owned)) (before (lifecycle-words port)))
                       (signals invariant-violation
                         (arcdocdb.scheduler::%pool-ack-command port 3 4) :pool-port-state)
                       (is (equal before (lifecycle-words port))) :ok))))
      (lifecycle-fixtures-stop (list worker)))))

;;; REQ: REQ-THR-001 REQ-AFF-008 REQ-AFF-013
(deftest test-REQ-AFF-008-pool-generated-port-equality-compares-request-ack-and-binding
  \"Fixture private tipizzate: pending e confermato differiscono per una sola parola.\"
  (let ((worker (lifecycle-fixture-start t)))
    (unwind-protect
         (lifecycle-call
          worker
          (lambda (owned)
            (let* ((constructor (symbol-function 'arcdocdb.scheduler::%make-porta-worker-pool))
                   (owner sb-thread:*current-thread*) (coordinator (lifecycle-fixture-coordinator owned))
                   (context (lifecycle-fixture-context owned))
                   (left (funcall constructor owner coordinator context 2 1))
                   (same (funcall constructor owner coordinator context 2 1)))
              (is (not (eq left same))) (is (funcall (symbol-function 'equalp) left same))
              (dolist (words '((1 1) (2 2)))
                (let ((different (funcall constructor owner coordinator context
                                         (first words) (second words))))
                  (is (not (funcall (symbol-function 'equalp) left different)))))
              (setf (arcdocdb.scheduler::porta-worker-pool-bound same) t)
              (is (not (funcall (symbol-function 'equalp) left same)))
              (is (funcall (symbol-function 'arcdocdb.scheduler::porta-worker-pool-p) left))
              (is (not (funcall (symbol-function 'arcdocdb.scheduler::porta-worker-pool-p) nil)))
              :ok)))
      (lifecycle-fixtures-stop (list worker)))))

;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008
(deftest test-REQ-CON-005-pool-two-retirement-acks-can-arrive-with-a-prefix-hole
  (let* ((workers (loop repeat 6 collect (lifecycle-fixture-start t)))
         (controller (crea-controllore-pool 3 :initial 6 :dwell 500))
         (registry (arcdocdb.scheduler:crea-registro-pool controller (lifecycle-ports workers))))
    (unwind-protect
         (progn
           (lifecycle-check-update registry 0 0 0 1200 6 :hold 6 nil)
           (lifecycle-check-update registry 500 0 0 1200 4 :shrink 6 t)
           (lifecycle-check-worker (nth 4 workers) nil :retired)
           ;; ACK index4=false con index5 ancora attivo: il conteggio ammette il buco.
           (is (equal '(5 4 t) (lifecycle-registry-state registry)))
           (let ((before (mapcar (lambda (fixture) (lifecycle-words (lifecycle-fixture-port fixture)))
                                 workers)))
             (lifecycle-check-update registry 1000 8 0 0 4 :pending 5 t)
             (is (equal before
                        (mapcar (lambda (fixture) (lifecycle-words (lifecycle-fixture-port fixture)))
                                workers))))
           (lifecycle-check-worker (nth 5 workers) nil :retired)
           (is (equal '(4 4 nil) (lifecycle-registry-state registry))))
      (lifecycle-fixtures-stop workers))))
")
  (:PATH
   #A((94) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/tools/measure-pool-lifecycle.lisp")
   :BYTES 26190 :SHA256 "87c4985bc50445ab77c2196de535b83e42e107ff7a9b2ac8bd5d7f04b7f90fc0"
   :GIT-BLOB "3a229eecc3c158cec9af8fad6abd5fc2d980e2dd" :TEXT
   ";;;; C4: attuazione logica worker; APPLY e REGISTRY separati dalle barriere della fixture.
;;;; Preregistrato: cinque repliche di 4096 cicli, 128 warmup, GC completa prima del sensore.
;;;; APPLY usa richiesta privata quiescente; REGISTRY usa due owner reali preavviati.
;;;; Nessun clock, thread o attesa in prodotto; questo file contiene soltanto il sensore C4.
;;;; --self-test oppure --bench directory-nuova/; startup/errori esclusi dal percorso caldo.
;;;; Feature biblioteca: :arcdocdb-pool-lifecycle-measure-library.
;;; REQ: REQ-THR-001 REQ-CON-005 REQ-AFF-008 REQ-BEN-001 REQ-BEN-002
;;; OWNER: sensore/registri al coordinatore; ogni contesto al suo worker di startup.
;;; SHARED: solo pubblicazione iniziale C4 e porte del protocollo, senza messaggi nel clock.
(eval-when (:compile-toplevel :load-toplevel :execute)
  (require :asdf) (require :sb-md5) (require :sb-posix))
(defpackage #:arcdocdb.pool-lifecycle.measure (:use #:cl))
(in-package #:arcdocdb.pool-lifecycle.measure)
(declaim (optimize (safety 3) (speed 2) (debug 2)))
(defconstant +iterations+ 4096)
(defconstant +warmup+ 128)
(defconstant +replicas+ 5)

(defun fingerprints ()
  \"ASD, controller, test e sensore: confronto di stabilita, non autenticita.\"
  (loop for path in (append '(#p\"arcdocdb.asd\" #p\"tools/measure-pool-lifecycle.lisp\")
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
                               (error \"COD-01 tools/measure-pool-lifecycle.lisp: ~A.\" c)))))
      (asdf:load-asd (merge-pathnames \"arcdocdb.asd\" (truename \"./\")))
      (asdf:load-system \"arcdocdb/tests\" :force t))))

(defun api (name)
  \"Risolve soltanto API pubbliche prima del clock; un nome mancante e difetto C4.\"
  (multiple-value-bind (symbol visibility) (find-symbol name \"ARCDOCDB.SCHEDULER\")
    (unless (and symbol (eq :external visibility) (fboundp symbol))
      (error \"COD-60 tools/measure-pool-lifecycle.lisp: API ~A assente.\" name))
    (symbol-function symbol)))

(defun lookup-function (name package &optional setter)
  \"API e accessor C4 risolti prima del clock; niente simboli o closure nel percorso caldo.\"
  (let ((symbol (find-symbol name package)))
    (unless symbol (error \"COD-60: simbolo ~A/~A assente.\" package name))
    (fdefinition (if setter (list 'setf symbol) symbol))))

(defun verify-apply (apply port active status)
  \"Oracolo scalare indipendente per ciascun risultato applicato o ripetuto.\"
  (multiple-value-bind (actual action) (funcall apply port)
    (unless (and (eq active actual) (eq status action))
      (error \"COD-60: applica restituisce ~S/~S invece di ~S/~S.\" actual action active status))))

(defun verify-registry (read registry actual target pending)
  \"Tre risultati pubblici distinti; un comando non vale una conferma.\"
  (multiple-value-bind (a b c) (funcall read registry)
    (unless (and (eql a actual) (eql b target) (eq c pending))
      (error \"COD-60: registro diverso dall'oracolo ~S/~S/~S.\" actual target pending))))

(defun make-context ()
  \"Contesto C1 autentico e IDLE, creato fuori dalla misura sul suo owner.\"
  (let ((ready (lookup-function \"CREA-LISTA-WRITER-PRONTI\" \"ARCDOCDB.EXECUTION\"))
        (context (lookup-function \"CREA-CONTESTO-WORKER-WRITER\" \"ARCDOCDB.EXECUTION\")))
    (funcall context (funcall ready :shards 1 :capacity 1))))

(defun create-apply-cycle ()
  \"Fixture C4 privata: un thread svolge serialmente ruoli owner/coordinator.
Scrive REQUEST soltanto dopo la conferma precedente; nessun lease, reset o wrap.
Quattro applicazioni/ciclo: retired, unchanged, activated, unchanged; token fisso78.\"
  (let* ((port (funcall (api \"CREA-PORTA-WORKER-POOL\") (make-context)))
         (apply (api \"APPLICA-STATO-WORKER-POOL\"))
         (set-request (lookup-function \"PORTA-WORKER-POOL-REQUEST\" \"ARCDOCDB.SCHEDULER\" t))
         (read-ack (lookup-function \"PORTA-WORKER-POOL-ACK\" \"ARCDOCDB.SCHEDULER\"))
         (generation 0))
    (values
     (lambda ()
       (declare (type fixnum generation))
       (let ((retired (* 2 (incf generation))))
         (funcall set-request retired port)
         (verify-apply apply port nil :retired)
         (verify-apply apply port nil :unchanged)
         (unless (= retired (the fixnum (funcall read-ack port)))
           (error \"COD-60: conferma ritiro diversa dalla generazione richiesta.\")))
       (let ((activated (1+ (* 2 (incf generation)))))
         (funcall set-request activated port)
         (verify-apply apply port t :activated)
         (verify-apply apply port t :unchanged)
         (unless (= activated (the fixnum (funcall read-ack port)))
           (error \"COD-60: conferma attivazione diversa dalla generazione richiesta.\")))
       78)
     78 (constantly nil))))

(defun fixture-worker (index ports failures coordinator ready stop)
  \"Solo startup C4: due contesti del worker, pubblicazione e attesa bounded fuori clock.\"
  (handler-case
      (progn
        (dolist (offset '(0 2))
          (setf (svref ports (+ index offset))
                (funcall (api \"CREA-PORTA-WORKER-POOL\") (make-context)
                         :coordinator coordinator :active (zerop index))))
        (sb-thread:signal-semaphore ready)
        (loop repeat 120 when (sb-thread:wait-on-semaphore stop :timeout 1d0) return t))
    (error (condition)
      (setf (svref failures index) condition)
      (sb-thread:signal-semaphore ready))))

(defun fixture-cleanup (threads stop)
  \"Termina soltanto i thread della fixture, con timeout esplicito; niente kill.\"
  (dolist (thread threads) (declare (ignore thread)) (sb-thread:signal-semaphore stop))
  (dolist (thread threads)
    (when (eq :join-timeout (sb-thread:join-thread thread :timeout 5d0 :default :join-timeout))
      (error \"COD-60: owner fixture non terminato entro il budget.\")))
  nil)

(defun create-registry-cycle ()
  \"Due registri distinti su due owner reali; attese e startup fuori dal sensore.
HOLD target1 CPU900, PENDING target2 actual1 pubblicato da un vero grow iniziale.
Ogni ciclo contiene due update e due letture; nessuna conferma finta; token34.\"
  (let* ((ports (make-array 4 :initial-element nil)) (failures (make-array 2 :initial-element nil))
         (ready (sb-thread:make-semaphore)) (stop (sb-thread:make-semaphore))
         (coordinator sb-thread:*current-thread*) (threads nil) (complete nil))
    (unwind-protect
         (progn
           (dotimes (index 2)
             (let ((i index))
               (push (sb-thread:make-thread
                      (lambda () (fixture-worker i ports failures coordinator ready stop))
                      :name \"pool-lifecycle-C4-startup\") threads)))
           (dotimes (index 2)
             (unless (sb-thread:wait-on-semaphore ready :timeout 5d0)
               (error \"COD-60: owner fixture non avviato entro il budget.\")))
           (dotimes (index 2) (when (svref failures index) (error (svref failures index))))
           (let* ((create (api \"CREA-CONTROLLORE-POOL\")) (register (api \"CREA-REGISTRO-POOL\"))
                  (update (api \"AGGIORNA-REGISTRO-POOL\")) (read (api \"LEGGI-REGISTRO-POOL\"))
                  (hold (funcall register (funcall create 1 :maximum 2 :initial 1 :period 1 :dwell 1)
                                 (vector (svref ports 0) (svref ports 1))))
                  (pending (funcall register (funcall create 1 :maximum 2 :initial 1 :period 1 :dwell 1)
                                    (vector (svref ports 2) (svref ports 3)))) (tick 1))
             (funcall update hold 1 128 900 900)
             (funcall update pending 0 128 100 900)
             (multiple-value-bind (target action actual outstanding) (funcall update pending 1 128 100 900)
               (unless (and (= 2 target) (eq :grow action) (= 1 actual) outstanding)
                 (error \"COD-60: grow iniziale non ha prodotto comando pendente.\")))
             (verify-registry read hold 1 1 nil) (verify-registry read pending 1 2 t)
             (setf complete t)
             (values
              (lambda ()
                (declare (type fixnum tick))
                (incf tick)
                (multiple-value-bind (target action actual outstanding) (funcall update hold tick 128 900 900)
                  (unless (and (= 1 target) (eq :hold action) (= 1 actual) (null outstanding))
                    (error \"COD-60: wrapper hold diverso dall'oracolo.\")))
                (verify-registry read hold 1 1 nil)
                (multiple-value-bind (target action actual outstanding) (funcall update pending tick 128 100 900)
                  (unless (and (= 2 target) (eq :pending action) (= 1 actual) outstanding)
                    (error \"COD-60: wrapper pending diverso dall'oracolo.\")))
                (verify-registry read pending 1 2 t)
                34)
              34 (lambda () (fixture-cleanup threads stop)))))
      (unless complete (fixture-cleanup threads stop)))))

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

(defun campaign-group (name maker report checkpoint)
  \"Una fixture startup e cinque repliche; gli errori mantengono anche il raw parziale.\"
  (multiple-value-bind (function token cleanup) (funcall maker)
    (unwind-protect
         (dotimes (replica +replicas+)
           (let ((progress (sample-record replica +iterations+ +warmup+ token)))
             (setf (getf progress :campaign) name (getf report :current-replica) replica
                   (getf report :samples) (append (getf report :samples) (list progress)))
             (funcall checkpoint)
             (sample function +iterations+ token progress)
             (funcall checkpoint)
             (unless (zerop (getf progress :heap-bytes))
               (setf (getf progress :status) :failed (getf progress :diagnostic) \"COD-30: heap osservato positivo.\")
               (error \"COD-30: heap positivo nella campagna ~S replica ~D.\" name replica))))
      (funcall cleanup)))
  report)

(defun campaign (report checkpoint)
  \"APPLY e REGISTRY misurati separatamente; nessuna sincronizzazione nel tratto caldo.\"
  (campaign-group :owner-apply #'create-apply-cycle report checkpoint)
  (campaign-group :coordinator-registry #'create-registry-cycle report checkpoint)
  (setf (getf report :current-replica) nil)
  report)

(defun make-report ()
  \"Confini espliciti: conferme logiche e fixture C4, nessuna misura park/wake o motore vivo.\"
  (list :schema-version 1 :kind :pool-lifecycle-benchmark :status :running :stage :pending
        :diagnostic nil :process-argv sb-ext:*posix-argv* :tool-arguments (uiop:command-line-arguments)
        :source-fingerprints-before (fingerprints) :source-fingerprints-after nil
        :source-consistency :pending :recorded-at (get-universal-time) :self-test nil
        :samples nil :current-replica nil :sbcl (lisp-implementation-version)
        :machine (machine-type) :os (software-type) :os-version (software-version) :safety 3
        :iterations +iterations+ :warmup +warmup+ :replicas +replicas+
        :timer-units-per-second internal-time-units-per-second
        :campaigns '((:owner-apply :real-context t :roles-serialized t :private-request-fixture t
                     :apply-per-cycle 4 :generation-increments-per-cycle 2 :token 78)
                    (:coordinator-registry :registries 2 :workers 2 :contexts 4 :ports 4
                     :updates-per-cycle 2 :reads-per-cycle 2 :token 34))
        :token-formula \"sample=N*cycle-token+N*(N-1)/2; APPLY=78; REGISTRY=34\"
        :limits '(:preallocated-product-and-inputs :startup-and-gc-excluded
                  :fixture-thread-barriers-outside-clock :no-thread-harness-heap-attribution
                  :counter-not-absolute-nonallocation-proof :external-load-uncontrolled
                  :clock-zero-is-below-resolution :no-time-threshold-no-tuning-claim
                  :no-physical-start-retire-park-wake-shutdown-io-durability-qualification)))

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
                         (format nil \"arcdocdb-pool-lifecycle-measure-~D-~D-~D/\"
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
        (error \"COD-60 tools/measure-pool-lifecycle.lisp: campione invalido accettato o errore non tipizzato.\"))
      (unless (equal before (multiple-value-list (funcall read controller)))
        (error \"COD-60 tools/measure-pool-lifecycle.lisp: campione invalido muta il controller.\"))))
  :passed)

(defun self-test-composed (maker)
  \"Fixture positive API prima della campagna; cleanup bounded anche dopo l'errore.\"
  (multiple-value-bind (function token cleanup) (funcall maker)
    (let ((progress (sample-record 0 4 0 token)))
      (unwind-protect (sample function 4 token progress :warmup 0)
        (funcall cleanup))
      progress)))

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
    (setf composed (self-test-composed #'create-apply-cycle))
    (unless (handler-case
                (progn (verify-apply (lambda (port) (declare (ignore port)) (values nil :retired))
                                     nil t :activated) nil)
              (error () t))
      (error \"COD-60: risultato owner difforme non respinto.\"))
    (unless (handler-case
                (progn (verify-registry (lambda (registry) (declare (ignore registry)) (values 1 1 nil))
                                        nil 1 2 t) nil)
              (error () t))
      (error \"COD-60: risultato registro difforme non respinto.\"))
    (let ((called nil))
      (dolist (args '(nil (\"--bench\") (\"--bad\") (\"--bench\" \"directory\" \"extra\")))
        (unless (and (eq :failed (getf (run-driver args :product-loader (lambda () (setf called t))) :status))
                     (null called))
          (error \"COD-60: CLI invalida eseguita.\"))))
    (list :status :ok :baseline baseline :positive-control positive :wrong-sink-probe wrong
          :zero-clock-probe zero :composed-api-probe composed
          :composed-registry-probe (self-test-composed #'create-registry-cycle) :invalid-cli :rejected
          :owner-and-registry-oracle-positive-negative :passed :invalid-non-hot (self-test-invalid-input)
          :existing-destination-and-partial-raw (self-test-reporter)
          :measured-partial-raw (self-test-partial-sample))))

(defun main ()
  \"Rapporto leggibile; ogni errore esce nonzero con diagnosi C4.\"
  (let ((report (run-driver (uiop:command-line-arguments))))
    (let ((*print-readably* t)) (write report :pretty t) (terpri))
    (unless (eq :ok (getf report :status))
      (format *error-output* \"~&tools/measure-pool-lifecycle.lisp: ~A~%\" (getf report :diagnostic))
      (uiop:quit 1))))
(unless (member :arcdocdb-pool-lifecycle-measure-library *features*) (main))
")
  (:PATH
   #A((106) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/pool-worker-lifecycle.md")
   :BYTES 8950 :SHA256 "fc1b46e82defedcff90b0c9e05b9d47dee3fe759bcfa1c145aba59b4494e873c" :GIT-BLOB
   "7f49d119fd998aa2648c1e69fc52b4355d0ca0f0" :TEXT "# Attuazione logica del pool di worker

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

REQ-THR-001 resta progettato a livello del motore completo. Mancano dispatcher che
rispetta active, sensori e coordinamento dell'Archivio, avvio graduale dei thread,
risveglio persistente dalla ready, gestione del guasto del pool e arresto fisico.
Il componente non qualifica un'attesa idle nativa, il pump di risveglio, il numero
di thread da avviare sull'hardware o la latenza end-to-end. QA-12/19 restano aperte.
")
  (:PATH
   #A((113) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/pool-worker-lifecycle-metodo.md")
   :BYTES 6094 :SHA256 "e529f3c3959b8143b099febef773ebc880aeae0424c01e3ddec89583d2d3615b" :GIT-BLOB
   "598212501b1d8ecff6b4c90c0f04d551df2ff043" :TEXT
   "# Metodo preregistrato dell'attuazione logica dei worker

Preregistrazione del 2026-10-13, prima delle campagne congelate, sulla base
`105ae0dd28a6ae3e7ee60ab1477815a49b1b350b`. Scope: cinque nuovi sorgenti
`src/scheduler/lifecycle-{types,build,read,worker,update}.lisp`, modifiche
del package e di ASDF, test e strumento locale C4. Il componente C3 collega
il target del controllore a richieste e conferme per worker preallocati.
Non crea thread, non esegue attese, non segnala semafori e non modifica
ready, lease, obblighi o collegamenti Serie dei componenti C1.

L'attivazione e il ritiro sono logici: soltanto il thread del contesto può
confermare una richiesta, dopo la barriera completa del worker IDLE.
Il conteggio effettivo proviene dalle conferme; l'invio di un comando non
equivale al suo completamento. La porta conserva proprietari e contesto;
una generazione monotona impedisce riuso o sovrascrittura di comandi
pendenti. Un owner fisico e la sua porta non si trasferiscono.

## Verifiche previste

- Factory della porta sul proprietario del contesto e registrazione sul
  proprietario del controllore; configurazione valida, contesti liberi,
  porte e owner distinti, massimo coerente e prefisso iniziale attivo.
  Copia del vettore di porte; input originario modificabile senza cambiare
  il registro pubblicato. Domini e configurazioni errati devono essere
  rifiutati prima di pubblicare o legare una struttura incompleta.
- Valori packed e generazioni ai limiti; separazione fra comando e
  conferma, conservazione della richiesta pendente e rifiuto di riuso,
  regressione o esaurimento prima di qualsiasi mutazione.
- Comando identico già applicato, passaggio attivo/inattivo e ritorno
  attivo. Conferma soltanto sull'owner reale. Gli stati CLAIMED, RUNNING,
  BATCH, FINISHING, RESCHEDULE e FAULTED non attestano IDLE; lease, debito,
  riferimento e fault devono restare integri dopo un rifiuto o rinvio.
- Tutti i conteggi di una lettura si riferiscono a conferme osservate;
  richieste in corso non entrano nel numero dei worker attivi. Il registro
  controlla owner e legame, intervalli e relazione richiesta/conferma.
  Non dedurre quiescenza globale da una lista ready EMPTY o BUSY.
- Wrapper del campione: preflight completo di metriche, tempo, conteggi e
  budget di generazione prima delle scritture; target conservato quando
  ci sono conferme pendenti. Un errore del campione non deve lasciare
  comandi o un controllore aggiornati solo parzialmente.
- Tracce finite con crescita, riduzione e inversione del carico, worker
  occupato e conferma ritardata; prove su due owner reali con deadline nel
  solo harness. Verificare che nessun comando sostituisca quello ancora
  pendente e che il feedback attenda le conferme.
- Lettura del codice per tipi, safety 3, dichiarazioni, REQ/OWNER/SHARED,
  funzioni bounded, nessun callback, thread o attesa nel prodotto e nessuna
  scrittura globale condivisa nel percorso di una richiesta. Le letture
  automatiche indipendenti non sono una certificazione umana.

## Copertura e misure

Il gate C3 è almeno 95% di espressioni e rami, confrontato tramite interi
esatti senza arrotondare. Lo scope include tutti i cinque nuovi file e
`src/scheduler/package.lisp`, compresi i percorsi generati dalle strutture;
nessuna esclusione. I vecchi file del controllore e dei worker non sono
attribuiti al nuovo componente. Il lettore verifica l'inventario completo,
concordanza fra dato nativo SB-COVER e indice HTML, denominatori non nulli,
identità e posizioni di ogni percorso mancante. I checkpoint pubblici
SAVE-COVERAGE dopo il caricamento preservano i segni di startup prima che
il runtime recuperi i code component; non alterano i segni. Conservare il
dato nativo e tutti gli HTML originali anche nei tentativi falliti.
SB-COVER non attesta MC/DC.

La misura heap separa prodotto e coordinamento del test. Startup, factory,
thread, sincronizzazione, oracoli e GC sono fuori dal tratto misurato.
Warmup 128 cicli, cinque repliche da 4096 cicli, safety 3; nessun reset o
wrap delle generazioni. Il sensore conserva byte heap, tick grezzi,
conteggio completato e sink deterministico; un clock nullo significa
sotto risoluzione, non tempo nullo. Nessuna soglia di tempo o prestazione
viene ricavata dalla campagna e il carico esterno resta incontrollato.

La campagna A applica sull'owner corrente del contesto una fixture C4 di
comandi packed preallocata. Ogni ciclo conserva la progressione monotona
e verifica ritiro, conferma ripetuta, attivazione e conferma ripetuta.
La fixture può scrivere una richiesta a quiescenza senza concorrenti e conservando
la progressione del protocollo, ma è dichiarata privata e non qualifica il coordinatore.
La campagna B crea durante startup due contesti su owner reali distinti,
con prefisso iniziale attivo, e misura soltanto update/lettura del registro
sul coordinatore nelle condizioni hold e pending. Le barriere del test
restano fuori dal sensore heap. Crescita, riduzione e conferme realmente
concorrenti si verificano nei test d'integrazione; non si presentano come
una misura priva di allocazioni del relativo harness.

Lo strumento C4 deve rilevare un'allocazione deliberata, un sink errato,
un risultato di API diverso dall'oracolo, un clock sotto risoluzione,
CLI invalida, destinazione preesistente e raw parziali dopo un errore.
Il lettore di copertura deve respingere bit, lunghezze, duplicati e schema
HTML malformati, conteggi discordanti e gate sotto soglia. Compilazione
senza warning/style-warning e self-test precedono le misure del prodotto.

Ogni processo di qualifica congelato usa `tools/record-command.lisp`:
argv, ambiente, output originali, esito e identità sorgenti iniziale/finale.
Cache dedicate evitano contaminazioni. I tentativi falliti rimangono prove
fallite; nessun raw mancante è ricostruito o promosso. SHA e byte originali
degli artefatti pubblicati sono verificati. Park/wake fisico, avvio e join,
shutdown, worker morti, I/O, admission, sensori reali e taratura restano
fuori scope: questa campagna qualifica l'attuazione logica bounded.
")
  (:PATH
   #A((73) BASE-CHAR . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/CHANGELOG.md")
   :BYTES 16866 :SHA256 "9100dc13952f9f0ed071d6cf099820f1cb30eedb429cafa8b273446683652b83"
   :GIT-BLOB "4918c0821cb1464be8d318657cc55ed98a6291cc" :TEXT "# Changelog

Formato basato su [Keep a Changelog](https://keepachangelog.com/it-IT/1.1.0/). Il progetto
non ha ancora rilasci; le versioni seguiranno la [roadmap](docs/roadmap.md).

## [Non rilasciato]

### Aggiunto

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
   #A((101) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/controllore-pool.md")
   :BYTES 7655 :SHA256 "8a9aee11cb1059e8d8d6263538a6c7e62e7a2f578cf563e2ab87ebf6ee648392" :GIT-BLOB
   "e22552b984aa27cfc53c279b00b0ef1bc3b91ecc" :TEXT "# Controllore locale dei worker di calcolo

Il componente `arcdocdb.scheduler` realizza una parte di REQ-THR-001:
propone un numero di worker usando EWMA, AIMD e isteresi. È governo delle
risorse di classe C3 secondo [ADR-0031](../adr/0031-software-critico-criteri-e-priorita.md),
con limiti espliciti e tempo iniettato, REQ-AFF-008/013 e REQ-CON-005.
[ADR-0011](../adr/0011-thread-pool-dinamico.md) consente di partire con pochi
segnali; [il metodo preregistrato](controllore-pool-metodo.md),
[la lettura del codice](controllore-pool-revisione.md) e
[i risultati](controllore-pool-risultati.md) delimitano le prove.

Il [registro di attuazione logica](pool-worker-lifecycle.md) è il componente
successivo: collega questa politica alle conferme dei worker preesistenti.
Il controller da solo conserva il contratto e lo scope descritti qui.

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
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/pool-worker-lifecycle-revisione.md")
   :BYTES 11433 :SHA256 "be93f70faf3858551ef3548d74f642b4f6faa536014b29a7b8871bec77a63c4f"
   :GIT-BLOB "ce1cbddbfe9605c4eae9a5bcacf3a96d35d344b5" :TEXT
   "# Revisione indipendente dell'attuazione logica dei worker

Lettura statica del 2026-10-13 sulla base
`105ae0dd28a6ae3e7ee60ab1477815a49b1b350b`, eseguita da un agente diverso
dall'autore dei sorgenti. Esito della lettura finale: **positivo per lo scope
C3**, dopo le due correzioni descritte sotto. Questo esito non attesta build,
test, copertura, misura heap o qualifica del motore.

Sono stati letti integralmente i cinque nuovi sorgenti lifecycle, package e
integrazione ASDF, il [contratto](pool-worker-lifecycle.md) e il
[metodo preregistrato](pool-worker-lifecycle-metodo.md). Sono stati riletti
controllore, verificatore IDLE, claim/cessione del worker e bridge worker/Serie;
ADR-0011/0031/0035/0045, invarianti e
[standard di codifica](../affidabilita/standard-di-codifica.md) delimitano la
valutazione. Il revisore non ha eseguito compilazione, test o benchmark e non
ha modificato sorgenti, test, ASDF, contratto o Git.

Prima del congelamento è stata riletta l'integrazione sulla base
`c4bbb037b779d33ee9e8c01b4a33aac875ccf96f`, dopo l'inclusione dei float CBOR
e delle evidenze precedenti. Sono stati riletti integralmente ASDF,
README dell'implementazione e contratto corrente. L'ordine execution,
controllore e lifecycle e la registrazione dei test scheduler sono
preservati; la nuova voce README rimanda al contratto e al sorgente corretti.
Il contratto mantiene invariato il proprio SHA. La tabella seguente riporta
l'identità dell'ASDF integrato, senza attribuire a questa revisione la
qualifica dei nuovi componenti codec.

## Identità dei file della lettura finale

| File | SHA-256 |
|---|---|
| `src/scheduler/lifecycle-types.lisp` | `4fe980e00f1d273e9b8278cd2daace6b4a9e4ab948ddfac83b79f4b0c537cb7c` |
| `src/scheduler/lifecycle-read.lisp` | `c60e1d5f67eeafb216b374fa001d27f87d1a734c5d066fc092902c0301069200` |
| `src/scheduler/lifecycle-build.lisp` | `d6d67faf8721f26e7fcd228d6ab9a7dfdc36ff5ec56c67ed9e5fb6d914006a9e` |
| `src/scheduler/lifecycle-worker.lisp` | `ec8b462ff3f5f7a6435f0f0c01b62034d8de2a784a9e354d469a0adfec9cf837` |
| `src/scheduler/lifecycle-update.lisp` | `2020e46809e9fe8fa74e061a420b8085679d5f461eabd8b044f3975c1024800e` |
| `src/scheduler/package.lisp` | `5a139172de1648b30e09fdc6fc068141299c2034702f8d5b5f44bb0de14a3112` |
| `arcdocdb.asd` | `a81c523ececccd4f1f5deaea037cfa419738c881ef37a89f7869f18f6becc7db` |
| `docs/implementazione/README.md` | `b863d42ce333caa19e9e87c9b67d8b12472aba47d2586d0681ff56df445a7aba` |
| `docs/implementazione/pool-worker-lifecycle.md` | `39c95f21b87752208b77844bca26092a4cd9f4f45900a04ead6c3ed42b10dba4` |
| `docs/implementazione/pool-worker-lifecycle-metodo.md` | `e529f3c3959b8143b099febef773ebc880aeae0424c01e3ddec89583d2d3615b` |

## Rilievi corretti prima dell'esito positivo

1. **Valore dei CAS non verificato, COD-23.** Nella prima versione i CAS di
   request e ack ignoravano il valore restituito; un conflitto inatteso
   poteva essere seguito da un falso successo. L'autore ha introdotto
   `%pool-request-command` e `%pool-ack-command`: entrambi verificano il
   valore atteso e segnalano `invariant-violation :pool-port-state`.
   La rilettura conferma la correzione. Non è un retry: un conflitto rompe
   l'esclusività e impone di interrompere l'uso del componente; un'ondata
   parzialmente pubblicata non viene annullata. Nessun campo C1 è toccato.
2. **Complessità della validazione startup, COD-13.** La prima
   `%pool-validate-ports` raggiungeva complessità ciclomatica 11 contando
   il ciclo e i cortocircuiti Boolean. L'autore ha estratto
   `%pool-startup-owner`; forma/capacità e deduplicazione rimangono nel
   validatore. Entrambi i corpi sono ora sotto il massimo di 10 percorsi
   indipendenti. Il contratto startup e il binding dopo validazione
   completa sono preservati.

Le identità precedenti erano `ee00fa5436a02bd467368b7eb199f1e1364826c1f01257f731e323ccb4da051f`
per lifecycle-worker, `ef52c911164e7dfe7f0ab0a8d90e5bfc9583a9725de5c546e01639ab76217bf9`
per lifecycle-update e `5fec1f6e81fc7f1d87e15e4cdcf7904fb9bb75ecb08d92ccc5596e9181a35191`
per lifecycle-build. Non sono le versioni approvate dalla lettura finale.

## Classificazione e barriere

Il componente resta C3 secondo ADR-0031: decide l'abilitazione logica e
conta conferme, senza modificare dati, code ready, writer, lease, debiti,
bridge o controller Serie. La barriera C1 esistente
`execution::%richiedi-worker :idle` è chiamata soltanto in lettura prima
di una conferma; non è sostituita da un predicato C3 più debole. L'ack
packed è esso stesso lo stato active: non esiste una seconda copia da
sincronizzare. La chiamata factory verifica IDLE prima della costruzione.

Il dispatcher deve rispettare il Boolean confermato e non iniziare nuovi
compiti su una porta inactive. Senza questa cooperazione le API execution
restano utilizzabili: il nuovo componente non promette un pool esecutivo
completo. Epoche o risorse esterne al contesto devono essere già rilasciate
dal caller; il verificatore IDLE non può attestarle. Il bridge va usato
senza bypass delle API sottostanti durante un tratto.

## Lista di controllo

I dodici punti C1 sono impiegati come lista aggiuntiva; non cambiano la
classe né trasformano questa lettura nella qualifica richiesta a C1.

| Punto | Valutazione statica e limite |
|---|---|
| 1. Requisiti e ADR | REQ-THR-001, REQ-CON-001/002/004/005, REQ-AFF-008/013 indicano adattamento, barriera del worker, parallelismo, limiti e ingressi iniettati. REQ-THR-001 resta progettato per il motore completo. |
| 2. Invarianti | Owner/coordinatore immutabili; request e ack non negativi entro fixnum; una sola generazione pendente con bit diverso; capacità uguale al maximum; request a prefisso e minimo sempre attivo. Il conteggio usa ack, non invio del comando. |
| 3. Errori | Ragioni tipizzate per owner, input, binding, parole, target e generazione. Rifiuti ordinari precedono binding o campione; conflitto CAS è un'invariante terminale. Nessun handler generico, rollback o errore occultato. |
| 4. Limiti | Cicli bounded dal vettore di massimo 131072 porte, nessuna ricorsione, attesa, syscall, callback o retry CAS. Worker O(1) oltre al controllo C1 bounded; lettura/aggiornamento O(maximum). |
| 5. Allocazione | Hash, copia e strutture solo in startup. Nei passi non compaiono liste, closure o strutture nuove; preflight mantiene l'aritmetica packed entro fixnum. Zero heap osservato resta da misurare, non è dedotto dalla lettura. |
| 6. Risultati verificati | Getter e wrapper controllano owner, legame, parole, prefisso delle request e conteggio. `:unchanged` legge soltanto la conferma precedente: non attesta salute o IDLE. Nessun dato applicativo viene restituito. |
| 7. Decisioni | Predicati composti circoscritti a parole, startup, legame e intervallo del conteggio; inventario sotto. Per C3 non è prescritto MC/DC. Copertura dei file completi e forme generate ancora da eseguire. |
| 8. Proprietà | Request/binding del coordinatore, ack del worker; barriere read/write e CAS verificati. Accessi non rientranti, handshake startup esplicito, vettore privato dopo copia. Nessuno stato globale mutabile nuovo. |
| 9. Tracciabilità e verifica | REQ su definizioni; ASDF carica lifecycle dopo execution e controllore e include il file test lifecycle. Test e campagne non eseguiti dal revisore; gate C3 almeno 95% di istruzioni/espressioni e rami resta pendente. |
| 10. Standard | Safety 3, ftype completi per le 13 funzioni, slot typed/read-only dove immutabili, copier NIL, docstring, OWNER/SHARED. Funzioni entro 60 righe e complessità sotto 10 dopo estrazione. Lint e compilazione restano verifiche separate. |
| 11. Parallelismo | Parole indipendenti per worker, scritture per campione/conferma fuori dal corpo delle operazioni della Serie. Nessun lock o contatore globale sul percorso di una richiesta. Non si misura qui scalabilità o equità. |
| 12. Durabilità | Nessun file, cambiamento durevole, effetto sui payload, CSN o controller Serie. I CAS sono punti di pubblicazione in memoria, senza atomicità su disco da rivendicare. |

## Inventario del protocollo letto

| Confine | Decisioni ed effetto |
|---|---|
| Parole | Uguali, oppure generation request=ack+1 con bit diverso; ogni altro caso è invariante. |
| Porta startup | Coordinator thread valido, Boolean valido e contesto IDLE completo prima di costruire. |
| Registro startup | Vettore semplice di capacità esatta; porta/coordinatore validi, bound falso, generation zero, request=ack, prefisso corretto e owner distinti prima del binding. |
| Registro vivo | Owner corrente, controller/target/capacità coerenti, request a prefisso; actual da ack entro minimum..maximum e pending da ogni disuguaglianza. |
| Applicazione | Owner prima di ogni accesso; nessun comando restituisce unchanged. Un comando su faulted/busy conserva entrambi i word; IDLE completo precede CAS ack e risultato activated/retired. |
| Budget | Quando pending è falso, tutte le generation devono avere spazio prima del campione; esaurimento rifiutato anche per hold. Pending non crea un'altra ondata. |
| Pubblicazione | Solo porte con bit da cambiare ricevono generation+1; CAS verificato, target locale aggiornato dopo la pubblicazione. Nessun comando identico sovrascrive un pending. |
| Wrapper | Delega il campione al controllore esistente; target diverso pubblica una sola ondata e pending conservativo. Metriche e tick invalidi non pubblicano request. |

Le letture request/ack non richiedono uno snapshot atomico di tutto il
pool: nel coordinatore request resta stabile durante la scansione; nel
worker ack ha un solo writer locale non rientrante. Un'ondata cambia tutti
i bit nella stessa direzione, quindi gli ack possono arrivare fuori ordine
e il conteggio osservato resta monotono. I buchi nel prefisso degli ack
intermedi sono leciti. Se pending è falso, tutte le parole lette coincidono
e actual=target; un pending già osservato può invece restare vero dopo una
conferma sopraggiunta. Il wrapper non presenta actual come misura della
salute dei worker o del numero di thread OS.

## Obblighi residui e verifiche mancanti

Un controller appartiene a un solo registro; dopo il binding viene
aggiornato esclusivamente tramite il wrapper. Una sola porta operativa
per contesto, anche fra registri differenti, rimane obbligo del caller:
bound impedisce il riuso della stessa porta, non individua nuove porte
duplicate. Startup e vettore di input restano esclusivi fino alla factory;
la pubblicazione fra owner richiede l'handshake documentato.

FAULTED conserva il comando e può bloccare l'ondata indefinitamente in
tempo esterno; ogni API resta bounded. La risposta del coordinatore al
guasto, il dispatcher, avvio/arresto fisico, park/wake, I/O, sensori reali
e taratura non sono realizzati. Nessun timeout nativo o garanzia di
progressione del motore è attestato da questa revisione.

Prima della qualifica conservare risultati eseguibili per owner errato,
startup invalido senza binding parziale, copia dell'input, stati execution
non IDLE senza perdita di capacità, word incoerenti/esaurimento, conflitti
dei due helper CAS, ack fuori ordine e campioni invalidi senza mutazione.
Le prove concorrenti richiedono deadline nel solo harness. Build, lint,
trace/check, copertura completa dello scope, self-test C4 e misura heap
restano pendenti al termine di questa lettura: nessun loro risultato è
stato assunto o promosso a PASS.
")
  (:PATH
   #A((116) BASE-CHAR
      . "/Users/gpicchiarelli/.codex/worktrees/writer-worker/ArcDocDB/docs/implementazione/pool-worker-lifecycle-risultati.md")
   :BYTES 6839 :SHA256 "22ffc52ac6826a99bf6360d5bb9f27166c1b56e66185295afcdff0b43b4105ac" :GIT-BLOB
   "f8d4f9102b35a36358b8bd336d686d401a259daa" :TEXT "# Verifica dell'attuazione logica dei worker

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
")))
