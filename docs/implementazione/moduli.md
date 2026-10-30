<a id="moduli-e-verifiche"></a>

# Modules and verification

[Implementation](README.md) · [Architecture](../architettura.md) · [Project modules](../16-moduli.md)

Catalog of component contracts, code, and verification. For integration
status, start with the [implementation index](README.md).
Each method and result retains its own scope.

| Module | Contract and verification | Code |
|---|---|---|
| M1 image discovery | [Bounded inventory, canonical source, and fully verified adoption](scoperta-indice-m1.md) | [`src/engine/image-discovery.lisp`](../../src/engine/image-discovery.lisp) |
| M1 delta maintenance | [Key/byte policy and renewal only at threshold](manutenzione-indice-m1.md) | [`src/engine/image-maintenance.lisp`](../../src/engine/image-maintenance.lisp) |
| M1 image renewal | [Build and activation under one admission, total quota, and empty delta](rinnovo-indice-m1.md) | [`src/engine/image-renewal.lisp`](../../src/engine/image-renewal.lisp) |
| M1 image delta | [Exact bounded membership for PUT/DELETE](delta-indice-m1.md); resident still complete | [`src/engine/delta.lisp`](../../src/engine/delta.lisp) |
| M1 image activation | [Hot publication and file closure on retirement](attivazione-indice-m1.md); controller choice, without durable catalog | [`src/engine/image-activation.lisp`](../../src/engine/image-activation.lisp) |
| M1 image construction | [Plan from canonical slots, adaptive radix, and full verification](costruzione-indice-m1.md); without automatic activation | [`src/engine/image-build.lisp`](../../src/engine/image-build.lisp) |
| M1 paged index | [Canonical source, startup, GET, and serial retirement](indice-paginato-m1.md); resident still present, durable catalog separate | [`src/engine/image-recovery.lisp`](../../src/engine/image-recovery.lisp) |
| Index images and root | [Seal, read-only verification, and serial adoption](immagini-indice-paginato.md); [M1 startup and serial GET](indice-paginato-m1.md) connected, durable catalog separate | [`src/index/image-recovery.lisp`](../../src/index/image-recovery.lisp) |
| Index page construction | [Bounded plans, keys, buckets, and append-only directory](costruzione-indice-paginato.md); publication still separate | [`src/index/page-build.lisp`](../../src/index/page-build.lisp) |
| Paged index reads | [Directory, buckets, overflow, and complete keys](lettura-indice-paginato.md); candidates compatible with resident | [`src/index/page-lookup.lisp`](../../src/index/page-lookup.lisp) |
| Serial page cache | [Fixed frames, private copies, and verified PREAD](cache-pagine.md); backend connected to optional M1 GET | [`src/index/page-cache.lisp`](../../src/index/page-cache.lisp) |
| M1 Single-Series Durable Core | [Startup, recovery, admission, and production requests](production-engine-bootstrap.md), [method](production-engine-bootstrap-metodo.md), [core evidence](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-22-production-engine-bootstrap/report.md) | [`src/engine/`](../../src/engine/) |
| M1 Unix session | [Contract, limits, and production CLI](production-unix-m1.md), [local qualification](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-23-production-unix-m1/report.md) | [`src/local/`](../../src/local/) |
| Archivio name completion | [Canonical gate, global preflight, and per-Serie effects](stabilizzazione-archivio.md), [method](stabilizzazione-archivio-metodo.md) | [`src/recovery-bootstrap/`](../../src/recovery-bootstrap/) |
| Full-text core | [Unicode profile, positional run, predicates, and frame](full-text.md), [decisions](full-text-decisioni.md) | [`src/fulltext/`](../../src/fulltext/) |
| Full-text codec and views | [Complete file, descriptor binding, and queries on bytes](full-text-codec.md), [review](full-text-codec-decisioni.md) | [`src/fulltext/`](../../src/fulltext/) |
| Full-text document preparation | [CBOR, paths, cumulative budgets, and file limit](full-text-documenti.md), [review](full-text-documenti-decisioni.md) | [`src/fulltext/document.lisp`](../../src/fulltext/document.lisp) |
| Writer full-text reservations | [Collective budgets, owned copies, and ownership](full-text-riserve.md), [method and decisions](full-text-riserve-metodo.md) | [`src/fulltext-admission/`](../../src/fulltext-admission/) |
| Full-text PUT/WAL binding | [Owned frame, append, and batch references](full-text-put.md), [method and decisions](full-text-put-metodo.md) | [`src/fulltext-put/`](../../src/fulltext-put/) |
| Full-text physical references | [Capture from sealed batch and lifetime](full-text-riferimenti.md), [method and decisions](full-text-riferimenti-metodo.md) | [`src/fulltext-put/physical.lisp`](../../src/fulltext-put/physical.lisp) |
| Full-text row directory | [Local lookup and references](full-text-righe.md), [method and decisions](full-text-righe-metodo.md) | [`src/fulltext-admission/rows.lisp`](../../src/fulltext-admission/rows.lisp), [`src/fulltext-put/row-reference.lisp`](../../src/fulltext-put/row-reference.lisp) |
| Evidence verification (C4) | [Isolated processes, limits, and ordered reduction](evidenze-parallele.md) | [`tools/check-evidence.lisp`](../../tools/check-evidence.lisp) |
| Vertical Serie test | [Writing, SIGKILL, recovery, resume, and second crash](prova-verticale.md) | [`tests/vertical/`](../../tests/vertical/) |
| Relative temporary creation | [New exclusive file from owned parent](io-creazione-relativa.md), [method](io-creazione-relativa-metodo.md) | [`src/io/create-relative.lisp`](../../src/io/create-relative.lisp) |
| Binary foundations | [v1/v2 records, CRC32C, and SEAL batches](fondazioni-binarie.md) | [`src/foundation/`](../../src/foundation/) |
| ARM64 CRC32C | [Lisp/SBCL backend and GET results](crc32c-arm64.md); [method](crc32c-arm64-metodo.md) | [`crc32c-native.lisp`](../../src/foundation/crc32c-native.lisp) |
| 16/32 B CRC32C | [Comparison, small records, and full GET](crc32c-unroll32.md); 16 B kernel retained | [`spike e metodo`](../../spikes/SPK-08-generated-code/metodo-crc32c-unroll32.md) |
| UTF-8 text | [Bounded, pure, parallel validation](utf8.md) | [`src/codec/utf8.lisp`](../../src/codec/utf8.lisp) |
| CBOR headers | [Pure read in six values](cbor-header.md) | [`src/codec/cbor-header.lisp`](../../src/codec/cbor-header.lisp) |
| Minimal CBOR headers | [Argument and float widths, without decoding](cbor-minimo.md) | [`src/codec/cbor-minimal.lisp`](../../src/codec/cbor-minimal.lisp) |
| CBOR header writing | [Minimal MT0..6, private destination, and preflight](cbor-scrittura.md) | [`src/codec/cbor-write.lisp`](../../src/codec/cbor-write.lisp) |
| CBOR string writing | [MT2/3 items, full budget, UTF-8, and overlap](cbor-stringhe.md) | [`src/codec/cbor-string-write.lisp`](../../src/codec/cbor-string-write.lisp) |
| CBOR simple value writing | [MT7 wire codes, preflight, and private destination](cbor-semplici.md) | [`src/codec/cbor-simple-write.lisp`](../../src/codec/cbor-simple-write.lisp) |
| CBOR float writing | [IEEE bits, exact reduction, and private destination](cbor-float-scrittura.md) | [`src/codec/cbor-float-write.lisp`](../../src/codec/cbor-float-write.lisp) |
| CBOR array composition | [Verified items, root budget, and private scratch](cbor-array.md), [checks](cbor-array-risultati.md) | [`src/codec/cbor-array-write.lisp`](../../src/codec/cbor-array-write.lisp) |
| CBOR map composition | [Verified pairs, root budget, and private scratch](cbor-map.md), [checks](cbor-map-risultati.md) | [`src/codec/cbor-map-write.lisp`](../../src/codec/cbor-map-write.lisp) |
| CBOR tag composition | [Verified contents, inclusive nodes, and unchanged depth](cbor-tag.md), [checks](cbor-tag-risultati.md) | [`src/codec/cbor-tag-write.lisp`](../../src/codec/cbor-tag-write.lisp) |
| First CBOR item reading | [Absolute frontier, unread tail, and private scratch](cbor-item.md), [checks](cbor-item-risultati.md) | [`src/codec/cbor-item-read.lisp`](../../src/codec/cbor-item-read.lisp) |
| CBOR string reading | [Read-only MT2/3 payload range and UTF-8](cbor-stringa-lettura.md), [checks](cbor-stringa-lettura-risultati.md) | [`src/codec/cbor-string-read.lisp`](../../src/codec/cbor-string-read.lisp) |
| CBOR structure | [Complete item, UTF-8, and budget with per-worker scratch](cbor-struttura.md) | [`src/codec/cbor-scan.lisp`](../../src/codec/cbor-scan.lisp) |
| CBOR item with minimal headers | [One traversal, limits, and private scratch](cbor-minimo-struttura.md) | [`src/codec/cbor-scan-minimal.lisp`](../../src/codec/cbor-scan-minimal.lisp) |
| Archivio CSN | [In-progress commit registry and horizon](csn.md) | [`src/csn/`](../../src/csn/) |
| Storage metadata | [Segment headers, EDIT, and DECISION](metadati-storage.md) | [`src/storage/`](../../src/storage/) |
| Log headers | [Control and multiseries identity and integrity](header-log.md) | [`src/storage/log-header.lisp`](../../src/storage/log-header.lisp) |
| Compacted segments | [CLOSED prefix and ordinary records](segmenti-compattati.md) | [`src/storage/compaction-scan.lisp`](../../src/storage/compaction-scan.lisp) |
| Writer queues | [Local MPSC, token, and bounded slices](code-writer.md) | [`src/execution/`](../../src/execution/) |
| Writer handoff | [Idle, ready, running, and scheduling obligation](writer-handoff.md) | [`src/execution/handoff.lisp`](../../src/execution/handoff.lisp) |
| Ready writer list | [Preallocated rings, independent partitions, and bounded scan](writer-ready.md) | [`src/execution/ready.lisp`](../../src/execution/ready.lisp) |
| Ready writer recycling | [Atomic FIFO swap on full ring](writer-recycle.md) | [`src/execution/ready-recycle.lisp`](../../src/execution/ready-recycle.lisp) |
| Worker context | [Lease, acknowledged batches, retries, and local fault](writer-worker.md) | [`src/execution/worker-types.lisp`](../../src/execution/worker-types.lisp) |
| Worker integration | [Common base, scope, and full check](writer-worker-integrazione.md) | [`arcdocdb.asd`](../../arcdocdb.asd) |
| Pool controller | [Bounded target, EWMA, AIMD, and hysteresis](controllore-pool.md) | [`src/scheduler/`](../../src/scheduler/) |
| Pool actuation | [Worker-acknowledged activation and retirement](pool-worker-lifecycle.md) | [`src/scheduler/lifecycle-worker.lisp`](../../src/scheduler/lifecycle-worker.lisp) |
| Pool-governed claim | [Active gate, IDLE context, and delegated C1 claim](pool-worker-claim.md) | [`src/scheduler/pool-claim.lisp`](../../src/scheduler/pool-claim.lisp) |
| Pool/Serie binding | [Immutable binding, new claim, and existing obligations](pool-dispatch.md) | [`src/dispatch/`](../../src/dispatch/) |
| Pool/Serie recycling | [One ready transfer and routing of new CLAIMED](pool-recycle.md) | [`src/dispatch/recycle.lisp`](../../src/dispatch/recycle.lisp) |
| Pool/Serie obligation start | [Current routing and explicit dual lease](pool-begin.md) | [`src/dispatch/begin.lisp`](../../src/dispatch/begin.lisp) |
| Pool/Serie dispatcher step | [Single choice between admission and existing obligations](pool-step.md) | [`src/dispatch/step.lisp`](../../src/dispatch/step.lisp) |
| Pool/dispatcher/Serie chain | [Real workers, isolation, and retirement with handoff](pool-catena-risultati.md); [method](pool-catena-metodo.md) | [`tests/scheduler/pool-chain.lisp`](../../tests/scheduler/pool-chain.lisp) |
| Pool/Serie slice preparation | [Selection and one start, with explicit tokens and rejections](pool-prepara.md); [results](pool-prepara-risultati.md) | [`src/dispatch/start.lisp`](../../src/dispatch/start.lisp) |
| I/O boundary | [Append, pread, and durable flush](io.md); [relative read-only opening and size](io-apertura-relativa.md) | [`src/io/`](../../src/io/) |
| I/O completion | [Cleanup, frontiers, and capabilities after short I/O](io-completamento.md) | [`src/io/flush.lisp`](../../src/io/flush.lisp), [`src/io/transfer.lisp`](../../src/io/transfer.lisp) |
| Directory rename | [Parent FD, atomic change, and local fail-stop](io-rinomina.md) | [`src/io/rename.lisp`](../../src/io/rename.lisp) |
| Temporary publication | [Exclusive rename, identity, and completion without replacement](io-pubblicazione.md) | [`src/io/publish.lisp`](../../src/io/publish.lisp) |
| File association | [Device/inode and read-only/append capabilities for the same ACTIVE](associazione-file.md) | [`src/io/identity.lisp`](../../src/io/identity.lisp) |
| New writer segment | [Durable header, reread, directory, and certified source](inizializzazione-active.md) | [`src/active/`](../../src/active/) |
| Empty ACTIVE | [Initial root, recovered CLOSED, and first batch](get-active-vuoto.md) | [active-init.lisp](../../src/get-resolver/active-init.lisp) |
| Control log checkpoint | [Complete EDIT, private plan, and blockwise durable preparation](checkpoint-control.md) | [`src/control/`](../../src/control/) |
| Control log publication | [Anchored rename, name identity, and unique token](pubblicazione-control.md) | [`src/control/publication.lisp`](../../src/control/publication.lisp) |
| Recovered control log | [Read-only read, owned manifest, and conservative transition](control-recuperato.md); [measurement method](control-transizione-metodo.md) | [`src/control/recovery-read.lisp`](../../src/control/recovery-read.lisp) |
| Recovered old ACTIVE | [Read-only prefix, resolved prepared records, and verified closure](active-recuperato.md); [checks](active-recuperato-verifica.md) and [measurement method](active-recuperato-metodo.md) | [`src/recovery-active/`](../../src/recovery-active/) |
| Recovery checkpoint | [Complete state from CONTROL and ACTIVE](checkpoint-recovery.md) | [`src/recovery-checkpoint/`](../../src/recovery-checkpoint/) |
| Recovered CLOSED | [Authoritative prefix, local outcomes, and complete set before publisher](closed-recuperato.md) | [`src/recovery-closed/`](../../src/recovery-closed/) |
| Recovered CSNs | [Observed maximum, authoritative sources, and complete Serie aggregation](recovery-csn.md) | [`src/recovery-active/csn.lisp`](../../src/recovery-active/csn.lisp), [`src/recovery-closed/csn-serie.lisp`](../../src/recovery-closed/csn-serie.lisp) |
| Archivio CSN plan | [Serie set, replay provenance, and overall maximum](csn-archivio-recovery.md) | [`src/recovery-archive-csn/`](../../src/recovery-archive-csn/) |
| WAL batches | [Formation, SEAL, and group commit](wal.md) | [`src/wal/`](../../src/wal/) |
| WAL batch CSNs | [Closure, token, and resolution](wal-csn.md) | [`src/wal/csn.lisp`](../../src/wal/csn.lisp) |
| Serie controller | [FIFO publication, token, and I/O retirement](controller-serie.md) | [`src/series/`](../../src/series/) |
| Worker and Serie | [Dual lease, batch debt, and handoff order](worker-serie.md) | [`src/series/worker-run.lisp`](../../src/series/worker-run.lisp) |
| Worker routing | [Immutable ordinals, copied registry, and direct selection](routing-worker.md) | [`src/series/routing-select.lisp`](../../src/series/routing-select.lisp) |
| Controller verification | [Structured tests, coverage, and parallel measurements](controller-serie-risultati.md) | [`tests/series/`](../../tests/series/) |
| v2 index slots | [Compact payload, seqlock, and relocation](slot-indice-v2.md) | [`src/index/`](../../src/index/) |
| v2 primary index | [Keys, Swiss groups, and directory publication](indice-primario.md) | [`src/index/primary-read.lisp`](../../src/index/primary-read.lisp) |
| Automatic index mode | [First resident/paged selector and lifetime model](indice-automatico.md); backend and actuator open | [`src/index/mode-policy.lisp`](../../src/index/mode-policy.lisp) |
| Index pages | [Codec and format for buckets, directory, and long keys](pagine-indice.md) | [`src/index/page-read.lisp`](../../src/index/page-read.lisp) |
| Key hashing | [Typed XXH64, immutable seed, and physical maps](hash-chiavi.md) | [`src/hash/`](../../src/hash/) |
| Record cache | [Associative sets, CLOCK, and verified copies](cache-record.md) | [`src/cache/`](../../src/cache/) |
| GET core performance | [Method, oracles, and parallel stress](get-performance-metodo.md) | [`tests/get-performance/`](../../tests/get-performance/) |
| GET costs and cardinality | [Preregistered method](get-costi-metodo.md); [results on CRC, copies, and 4.19 million keys](get-costi-risultati.md) | [`tools/get-cost-bench.lisp`](../../tools/get-cost-bench.lisp) |
| GET path | [Candidate, read-only source, cache, and snapshot confirmation](get-record.md) | [`src/get/`](../../src/get/) |
| GET verification | [First functional suite, method, and limits](get-verifica.md) | [`tests/get/`](../../tests/get/) |
| CSN/snapshot binding | [Single registry and coordination without waits](snapshot-csn.md) | [`src/mvcc/snapshots-csn.lisp`](../../src/mvcc/snapshots-csn.lisp) |
| Snapshot and CSN verification | [Preregistered method, decisions, and limits](snapshot-verifica.md) | Registry and adapter already present in `src/mvcc/` |
| Snapshot registry | [Pins, identity, activation, and expiration](registro-snapshot.md) | [`src/mvcc/snapshots-register.lisp`](../../src/mvcc/snapshots-register.lisp) |
| Epochs and reclaim | [Reader slots and bounded segment tickets](epoche-e-reclaim.md) | [`src/epochs/`](../../src/epochs/) |
| Read tasks | [EBR entry, snapshot checks, and cleanup](compiti-lettura.md) | [`src/read/`](../../src/read/) |
| EBR and read verification | [Suites, method, mutants, and limits](lettura-verifica.md) | [`tests/epochs/`](../../tests/epochs/) and [`tests/read/`](../../tests/read/) |
| CLOSED GET resolver | [Manifest frontier, flags, and OUTCOME proof](get-resolver.md); [functional test method](get-resolver-metodo.md) | [`src/get-resolver/`](../../src/get-resolver/) |
| CLOSED GET directory | [Bounded segment selection in the Serie](get-directory.md) | [`src/get-directory/`](../../src/get-directory/) |
| Serie GET sources | [ACTIVE/CLOSED acquisition from the single published root](get-fonti-serie.md) | [`src/get-directory/sources-read.lisp`](../../src/get-directory/sources-read.lisp) |
| Ordinary ACTIVE GET resolver | [Verified batches, Serie root, and persistent directory](get-active.md); [functional tests](get-active-verifica.md), [method](get-active-preflight-metodo.md), and [OPEN rejection verification](get-active-preflight-verifica.md) | [`src/get-resolver/active-build.lisp`](../../src/get-resolver/active-build.lisp) |
| Recovery scanning | [Log prefix and SEAL witnesses](scansione-log.md) | [`src/recovery/`](../../src/recovery/) |
| Multiseries decisions | [TXID, CSN, and participant table](decisioni-multiserie.md) | [`src/recovery/decisions-build.lisp`](../../src/recovery/decisions-build.lisp) |
| Archivio decision log | [Read-only read, identity, and ACTIVE recovery binding](decisioni-recuperate.md) | [`src/recovery-archive/`](../../src/recovery-archive/) |
| Serie manifest | [Folding control log EDITs](manifest-control-log.md) | [`src/recovery/`](../../src/recovery/) |
| Recovery inventory | [Plan and read-only directory collection](inventario.md); [native test method](inventario-directory-metodo.md) | [`src/recovery/inventory-build.lisp`](../../src/recovery/inventory-build.lisp), [`inventory-directory.lisp`](../../src/recovery/inventory-directory.lisp) |
| Owned recovery sources | [Complete read-only set, budget, and cleanup](fonti-recovery.md); [method](fonti-recovery-metodo.md) | [`src/recovery/inventory-sources.lisp`](../../src/recovery/inventory-sources.lisp) |
| Recovered names | [Idempotent completion of a live source, identity, and parent fsync](stabilizzazione-nomi-recovery.md) | [`src/recovery-series/stabilize.lisp`](../../src/recovery-series/stabilize.lisp), [`src/io/stabilize.lisp`](../../src/io/stabilize.lisp) |
| Recovered versions | [Maximum CSN, physical offsets, and provisional tombstone per key](selezione-versioni-recovery.md) | [`src/recovery-selection/`](../../src/recovery-selection/) |
| Index from recovery | [Private per-key materialization and idempotent restoration](indice-da-recovery.md) | [`src/recovery-selection/index.lisp`](../../src/recovery-selection/index.lisp), [`src/index/primary-restore.lisp`](../../src/index/primary-restore.lisp) |
| CLOSED visit for replay | [Fully verified prefix and delivery of committed data only](replay-closed.md) | [`src/recovery-replay/`](../../src/recovery-replay/) |
| Whole-Serie names | [Global preflight before effects, completion, and counts](stabilizzazione-serie.md) | [`src/recovery-series/stabilize-set.lisp`](../../src/recovery-series/stabilize-set.lisp) |
| IDs after recovery | [Proposal above high-water and observed names, without reservation](id-segmento-recovery.md) | [`src/recovery/inventory-id.lisp`](../../src/recovery/inventory-id.lisp) |
| IDs from directory inventory | [One attested enumeration, plan selection, and borrowed directory](id-directory-recovery.md) | [`src/recovery/inventory-directory-id.lisp`](../../src/recovery/inventory-directory-id.lisp) |
| Decision ordering | [Measured radix and concurrent queries](decisioni-radix-risultati.md) | [`src/recovery/decisions-radix.lisp`](../../src/recovery/decisions-radix.lisp) |

Evidence has an explicit scope: a codec test does not verify transactions,
durability, recovery, or database performance.

[Archivio runtime bootstrap](runtime-archivio.md) connects the CSN
plan to the single CSN/snapshot/epoch family and the new GET scope. The binding
does not yet authorize traffic.

[Serie semantic recovery](recovery-serie.md) connects owned read-only
sources to ACTIVE/CLOSED readers: set and budgets checked
before data, scratch reused, and two results only after the complete gate.

The [coordinated Archivio read](recovery-archivio.md) first applies
all Serie preflights and global budgets, then returns complete
reads and a canonical CSN plan, without starting runtime or publishing effects.

The [M16 local session](sessione-locale.md) proposes the contract needed
for the priority socket: framing, handshake, budgets, and deadlines. SPK-11 exercises
transport only; product startup/recovery/admission remain prerequisites.

[ACTIVE adoption into runtime](adozione-controller-runtime.md) connects
the prepared object to the common CSN and makes the controller unique per canonical log,
without acquiring leases or deciding the catalog.

[CLOSED adoption into runtime](adozione-closed-runtime.md) checks the set,
authority, and exact capabilities of recovered maps and builds a directory
in the new scope, sharing immutable rows without rereads or publication.

[Command archive collection](raccolta-comandi.md) uses an explicit
manifest, four workers, and the final closed inventory check.

The [initial CI and statistics design](ci-statistiche.md) describes measurements,
GitHub runners, and compact result publication. The executable entry point
is the [CI CLI](../../tools/ci.lisp); [PR provenance](ci-provenienza-pr.md)
documents the connection between runs and verified sources.

[Process outcomes in CBOR mutations](cbor-mutazioni-processi.md)
distinguish detected mutants from verification worker errors.
