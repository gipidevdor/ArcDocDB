<a id="specifica-originale-v1"></a>

# Original specification (v1)

> This file is the project's **source of truth**: it contains the initial specification,
> with Markdown formatting restored (headings, lists, code blocks, trees).
> The specification body is retained in full, translated into English without changing requirements.
>
> Transcription notes:
> - ‘50 seconds of stability + low load’ applies only to MERGE, not CLEAN;
> - the `>` separators in ‘Conceptual priority’ were restored.
>
> **Decided (2026-10-08 → ADR-0051)** — document name and introduction
> aligned with technical documentation; requirements unchanged.
>
> Every change to this file is a specification change: it must have an accompanying ADR in
> [`../adr/`](../adr/README.md) and updates to derived documents.

---

Design a general-purpose document-oriented database server written primarily in Common
Lisp, with SBCL as the reference implementation.

The main goal is high speed for fundamental operations, strong parallelism between
independent Serie, low P95/P99 latency, good scalability on multicore CPUs and NVMe,
reliable WAL, local and multiseries transactions, MVCC/snapshots, concurrent compaction,
and the ability to maintain good performance during sudden read bursts.

The database MUST NOT be designed specifically for blogging or CMS: it must be a
general-purpose document engine.

<a id="architettura-logica"></a>

## LOGICAL ARCHITECTURE

The logical hierarchy is:

```
Server
└── Archivio
    └── Serie
        └── Documento
```

Server:

* main process/server;
* connection management;
* global scheduler;
* dynamic thread pool;
* Archivio management.

Archivio:

* logical container/domain;
* contains multiple Serie;
* represents the level at which multiseries transactions and snapshots may be requested;
* must contain a special Serie named Registri.

Serie:

* document namespace;
* defines the document paradigm/contract;
* defines structure/schema, validation, indexes, and storage configuration;
* is the primary unit of storage;
* is the primary unit of parallelism;
* owns its WAL;
* owns its segments;
* owns its indexes;
* must operate in parallel and independently of other Serie.

Documento:

* logical data unit;
* has an `_id` unique within the Serie;
* may have historical versions managed through append-only storage and MVCC.

<a id="serie-speciale-registri"></a>

## SPECIAL SERIE Registri

Every Archivio must contain:

```
Registri
```

Registri is NOT the data WAL.

Registri contains:

* Serie catalog/metadatabase;
* Serie configuration metadata;
* information required for catalog recovery;
* a single persistent `multiserie.log` file.

`multiserie.log` is the transaction decision log for transactions involving multiple Serie.

There must not be a separate global file per transaction.

<a id="transazioni-single-series"></a>

## SINGLE-SERIE TRANSACTIONS

A transaction involving only one Serie:

* uses only the Serie WAL;
* does not write to `multiserie.log`;
* is serialized by the Serie's logical writer;
* uses optimistic version checking to detect conflicts on the same document.

Example:

```
doc42 = version 18
TX101 reads v18
TX102 reads v18
TX101 commit → v19
TX102 checks expected-version = 18 → conflict → abort/retry
```

Version checking must be atomic with respect to the Serie writer applying the change.

<a id="transazioni-multiserie"></a>

## MULTISERIES TRANSACTIONS

If a transaction modifies documents belonging to multiple Serie, it must be treated
as a multiseries transaction.

Example:

```
TX300:
  * modifies A.doc42;
  * modifies B.doc87.
```

The transaction uses:

* Serie A WAL;
* Serie B WAL;
* `Registri/multiserie.log`.

All changes in the same transaction share one TXID.

Use a 2PC-equivalent protocol:

1. BEGIN
2. PREPARE on participants
3. flush/fsync participating WALs according to durability level
4. durable decision recording in `multiserie.log`
5. COMMIT or ABORT
6. application/visibility of decision on participants.

The COMMIT decision must be durable in `multiserie.log` before the transaction is
considered definitively committed.

After a crash:

* the Recovery Manager reads `multiserie.log`;
* identifies prepared/incomplete transactions;
* determines the definitive decision;
* completes COMMIT or ABORT on participating Serie WALs.

There must not be a global data WAL.

Only the global transaction decision log `multiserie.log` exists.

## WAL

Each Serie owns an independent WAL.

The WAL provides:

* durability;
* recovery;
* state reconstruction;
* ordered recording of changes.

The system must favor group commit.

Example:

```
TX101 ─┐
TX102 ─┼──> WAL append ──> fsync
TX103 ─┘
```

Avoid fsync per operation unless strong durability is explicitly requested.

Group commit must allow many transactions to share one flush operation.

`multiserie.log` must also use group commit where appropriate.

<a id="storage-append-only"></a>

## APPEND-ONLY STORAGE

Serie storage is append-only.

Do not modify records already written to segments in place.

There is exactly one writable `ACTIVE` segment per Serie.

Fundamental rule:

```
ACTIVE = only mutable segment.
```

When a segment ceases to be ACTIVE:

* it becomes immutable;
* it can no longer be reopened for writing;
* it can no longer receive new records.

New writes always go to a new ACTIVE segment.

<a id="segmenti"></a>

## SEGMENTS

Normal target/maximum for a segment created by the writer:

* approximately 256 MB;
* configurable per Serie.

256 MB is an operational target/limit for normal segment creation by the writer.

Compaction-produced segments are NOT required to be 256 MB.

Example:

```
S017 = 256 MB
live = 20 MB
dead = 236 MB
```

CLEAN may produce:

```
S042 = 20 MB
```

S042 is immutable.

New writes MUST NOT be appended to S042 to bring it to 256 MB.

They must instead go to:

```
S043 = ACTIVE
```

Therefore:

```
S017
 ↓ CLEAN
S042 = 20 MB immutable

new writes
 ↓
S043 = ACTIVE
```

Possible states:

```
ACTIVE
CLOSED
OBSOLETE
RECLAIMABLE
DELETED
```

Only ACTIVE is writable.

CLOSED, OBSOLETE, and RECLAIMABLE are always immutable.

## SEGMENT METADATA

Every segment must have metadata for at least:

* segment-id;
* record-count;
* live-records;
* dead-records;
* total-bytes;
* live-bytes;
* dead-bytes;
* state;
* creation time;
* close time;
* version/epoch if applicable;
* references required for recovery and snapshot management.

These metadata are derived data/cache and MUST NOT be considered the sole source of truth.

They must be:

* rebuildable;
* verifiable;
* correctable through WAL/data/index.

<a id="versioni-dei-record"></a>

## RECORD VERSIONS

Every version can be classified as:

LIVE

* version currently reachable from the current index.

SNAPSHOT-LIVE

* version no longer current but still required by an active snapshot.

DEAD

* no current index or active snapshot can reach it.

A DEAD record can be reclaimed only when there are no remaining references from:

* current index;
* active snapshots;
* transactions requiring that version.

## CLEAN

CLEAN operates on one segment.

Rule:

```
1 source segment
→ 1 new immutable segment containing only live/required records.
```

Example:

```
S017:
  256 MB total
  20 MB live
  236 MB dead

CLEAN:
  S017 → S042
```

S042 contains only the required 20 MB.

Original segment S017:

* is not modified;
* becomes OBSOLETE after swap;
* remains readable as long as needed;
* is deleted only when no reader/snapshot uses it.

CLEAN must be copy-on-write.

Never modify the source segment in place.

## MERGE

MERGE is distinct from CLEAN.

MERGE reduces an excessive number of small segments.

Rule:

```
N small segments
→ 1 new immutable segment.
```

Source segments remain immutable.

Do not automatically perform MERGE after every CLEAN.

A cleaned segment may remain small indefinitely.

<a id="condizioni-obbligatorie-per-merge"></a>

## MANDATORY CONDITIONS FOR MERGE

A segment can be a MERGE candidate only if:

* it is CLOSED;
* it is immutable;
* it is not ACTIVE;
* it has been stable for at least 50 seconds;
* it is not required by an active snapshot;
* it belongs to a group exceeding segmentation/small-segment-count thresholds;
* the engine is under low load.

The minimum stability threshold is:

```
segment age >= 50 seconds
```

The reference timestamp must be the segment's closure/stabilization time.

The purpose is to avoid immediately compacting newly closed segments.

MERGE is a structural optimization and MUST NOT compete with user traffic.

## LOW-LOAD MERGE POLICY

Before starting MERGE, the Compaction Scheduler must check engine load.

Consider at least:

* CPU utilization;
* P95 request latency;
* P99 request latency;
* queue depth;
* request throughput;
* WAL throughput;
* WAL/fsync latency;
* NVMe utilization;
* I/O queue depth;
* compaction backlog;
* active worker count.

If load is high:

* do not start new MERGEs;
* reduce MERGE concurrency;
* prioritize user requests and WAL.

If load increases significantly during MERGE:

* do not start new merges;
* reduce future concurrency;
* if appropriate, pause or slow noncritical work.

MERGE must not monopolize:

* CPU;
* NVMe;
* memory;
* cache;
* memory bandwidth.

<a id="politica-generale-di-compaction"></a>

## GENERAL COMPACTION POLICY

The policy is:

```
live = 0
→ DELETE directly if no snapshot/reference uses it.

0 < live < total
→ CLEAN → new segment containing only live/needed records.

live ≈ total
→ no compaction needed.

too many small segments
→ MERGE, but only if:
  * candidate segments have at least 50 seconds of stability;
  * engine load is low.
```

CLEAN and MERGE therefore have different purposes.

CLEAN:

* reclaim dead space;
* remove unnecessary versions.

MERGE:

* reduce fragmentation;
* reduce segment count;
* improve read locality.

<a id="compaction-parallela"></a>

## PARALLEL COMPACTION

Compaction must be parallelizable per:

* segment;
* Serie.

Example:

```
Compaction Scheduler
│
├── Worker 1 → S017 → S101
├── Worker 2 → S018 → S102
├── Worker 3 → S019 → S103
└── Worker 4 → S020 → S104
```

Do not impose one global compaction worker.

The scheduler must distribute work dynamically.

<a id="workflow-cleanmerge"></a>

## CLEAN/MERGE WORKFLOW

General workflow:

1. select candidate segment;
2. check state;
3. check snapshots/references;
4. read segment sequentially;
5. copy only required records;
6. create new segment;
7. fsync new segment;
8. prepare metadata;
9. perform atomic index swap;
10. mark source segment OBSOLETE;
11. wait until no reader/snapshot uses it;
12. mark RECLAIMABLE;
13. delete.

For MERGE:

* read multiple segments;
* produce one new segment;
* use the same copy-on-write mechanism;
* keep sources immutable until reclaim.

<a id="readers-durante-compaction"></a>

## READERS DURING COMPACTION

Readers must be able to continue reading old segments while compaction produces new ones.

Compaction must not globally block reads.

After atomic swap:

* new readers use the new index/segment;
* already active readers can finish using the old segment.

## INDEX

Primary index:

```
_id → location
```

Location must contain at least:

* segment-id;
* offset;
* length;
* version.

The `_id` index must be highly optimized for average O(1) lookup.

Evaluate a Swiss Table-style structure.

Avoid millions of separate Lisp objects for entries.

Prefer:

* packed arrays;
* vectors;
* compact structures;
* binary metadata;
* contiguous memory.

## SECONDARY INDEX

Use different structures according to query type:

Strings/prefix:

* ART.

Numbers/dates/ranges:

* B+ tree or equivalent ordered structure.

Categories:

* posting lists.

Boolean/low cardinality:

* bitmap.

Per-segment Bloom filter:

* use only to establish a value is definitely absent or possibly present;
* do not use as a definitive location structure.

## SECONDARY INDEX DELTA

For frequently modified secondary indexes, use an LSM-like model:

```
base index
+
immutable delta(s)
→ asynchronous merge
→ new base index
```

Example:

```
category="tech"
→ REMOVE 42

category="sport"
→ ADD 42
```

The new base index is built without globally blocking readers.

## INDEX SNAPSHOT

Indexes must be immutable for readers.

Example:

```
Reader → Index v17

Writer:
  builds Index v18
  atomic swap

new readers → Index v18
previous readers → finish on v17.
```

## CACHE

The initial cache uses CLOCK.

If benchmarks show significant scan pollution, evaluate 2Q.

The cache may be partitioned by Serie to prevent a burst on one Serie from
monopolizing the entire cache.

Read path:

```
request
→ Serie
→ snapshot/index
→ cache
→ segment
```

<a id="concorrenza"></a>

## CONCURRENCY

Prefer:

```
1 logical writer per Serie
+
many concurrent readers.
```

Do not use:

* a permanent thread per Serie;
* a thread per request;
* a global writer lock.

Independent Serie must be able to write in parallel.

Example:

```
client
→ queue Serie A
→ Writer A
→ WAL A

client
→ queue Serie B
→ Writer B
→ WAL B
```

The writer serializes only what must be serialized within a single Serie.

<a id="thread-pool-dinamico"></a>

## DYNAMIC THREAD POOL

Use a dynamic pool of worker threads.

Do not continuously create/destroy threads.

Reuse workers.

The scheduler must dynamically adjust worker count based on:

* queue depth;
* CPU utilization;
* throughput;
* P50;
* P95;
* P99;
* active Serie count;
* load distribution between Serie;
* I/O utilization;
* WAL throughput;
* compaction backlog.

Use a strategy such as:

* EWMA;
* AIMD;
* hysteresis.

Illustrative rules:

```
queue grows + CPU available
→ increase workers.

queue grows + CPU saturated
→ do not increase blindly.

P99 worsens significantly
→ stop expansion or reduce workers.

queue empty + CPU low
→ reduce workers.
```

The same scheduler must coordinate load from:

* queries;
* writers;
* WAL;
* compaction.

<a id="compaction-scheduler-dinamico"></a>

## DYNAMIC COMPACTION SCHEDULER

The Compaction Scheduler must have limits independent of the normal request scheduler.

It must be able to:

* increase CLEAN workers when the system is idle;
* reduce them as traffic increases;
* prevent MERGE under high load;
* prefer urgent CLEAN over MERGE;
* prevent user-request starvation.

Conceptual priority:

```
user traffic
>
WAL/durability
>
required CLEAN
>
opportunistic MERGE
```

MERGE is therefore deliberately opportunistic.

<a id="snapshot--mvcc"></a>

## SNAPSHOTS / MVCC

A snapshot is a consistent logical view at a given point/version.

It is not a physical copy of the whole database.

An ordinary GET needs no global snapshot:

* it reads the current committed version.

A local transaction may use a Serie snapshot.

A multiseries transaction may use an Archivio-wide consistent snapshot.

Append-only storage naturally retains historical versions until reclaim.

A snapshot must prevent compaction from deleting versions it needs.

Example:

```
Snapshot S sees:
  A = 100
  B = 200

Another transaction updates both.

The snapshot continues to see:
  A = 100
  B = 200

until it ends.
```

## INDEX/SNAPSHOT/RECLAIM

A segment must be reclaimed only when:

* no current index references it;
* no snapshot references it;
* no active transaction needs it;
* no reader is still using the segment.

<a id="cache-e-snapshot"></a>

## CACHE AND SNAPSHOTS

The cache must be aware of the data's version/epoch.

Prevent a reader from obtaining a version incompatible with its snapshot.

<a id="simd-e-ottimizzazioni-native"></a>

## SIMD AND NATIVE OPTIMIZATIONS

The database must be designed to be SIMD-friendly.

In Common Lisp/SBCL:

1. use compact data structures;
2. typed arrays;
3. type declarations;
4. minimize boxing and allocations;
5. favor sequential access;
6. profile;
7. introduce SIMD only on actual hot paths.

SBCL can generate SIMD automatically in some appropriately typed numerical cases.

For extreme hot paths, it is possible to use:

* SBCL-specific operations;
* foreign functions;
* C/C++;
* Rust.

Still prefer Common Lisp for general database logic.

SIMD candidates:

* bitmap AND/OR/XOR;
* Bloom filters;
* scans;
* comparisons;
* filters;
* parsing;
* hashing;
* compression/decompression.

Append-only structure with immutable segments and sequential scans must favor these
optimizations.

## RECOVERY

The Recovery Manager must be able to rebuild the system after crashes.

It must verify:

* WAL;
* segment metadata;
* index metadata;
* atomic swap;
* segment state;
* transaction state;
* `multiserie.log`.

After a crash:

* recover individual Serie WALs;
* rebuild or verify indexes;
* identify ACTIVE/CLOSED/OBSOLETE segments;
* complete or roll back incomplete compaction operations;
* process `multiserie.log`;
* complete prepared multiseries transactions.

Compaction operations must be crash-safe.

A new segment must not become visible as definitive before its data are durable.

An incomplete atomic swap must be identifiable during recovery.

<a id="catalogo"></a>

## CATALOG

`Registri/catalog/` contains the Serie catalog.

For every Serie, store at least:

* name;
* configuration;
* schema/contract;
* index configuration;
* segment configuration;
* state;
* recovery metadata.

The catalog must support transactional, crash-safe modification.

<a id="layout-fisico"></a>

## PHYSICAL LAYOUT

Illustrative structure:

```
Archivio/
├── Registri/
│   ├── catalog/
│   └── multiserie.log
│
├── Serie-A/
│   ├── wal/
│   ├── segments/
│   └── index/
│
├── Serie-B/
│   ├── wal/
│   ├── segments/
│   └── index/
│
└── ...
```

Do not create a global data WAL.

Every Serie remains physically independent.

<a id="parallelismo"></a>

## PARALLELISM

Parallelism must be hierarchical:

```
Server
→ Archivio
→ Serie
→ writer/readers
→ WAL
→ compaction
→ query/index operations
```

The Serie is the main unit of load isolation.

The goal is to prevent a heavily used Serie from blocking others.

A read burst on Serie A must not prevent:

* writes on Serie B;
* queries on Serie C;
* controlled compaction on Serie D.

<a id="osservabilità"></a>

## OBSERVABILITY

Implement detailed metrics for at least:

Request:

* throughput;
* P50;
* P95;
* P99;
* P99.9.

Storage:

* segment count;
* segment size;
* live/dead ratio;
* bytes reclaimed;
* CLEAN throughput;
* MERGE throughput.

WAL:

* append throughput;
* fsync latency;
* group size;
* WAL queue depth.

Index:

* hit rate;
* lookup latency;
* rebuild time.

Cache:

* hit/miss;
* eviction;
* per-Serie occupancy;
* scan pollution.

Scheduler:

* worker count;
* queue depth;
* CPU utilization;
* I/O utilization;
* compaction concurrency.

GC/SBCL:

* allocation rate;
* GC frequency;
* GC pause;
* heap usage.

<a id="benchmark"></a>

## BENCHMARKS

Benchmarks must run on identical hardware when comparing the database with other systems.

Reference hardware:

* 16–32 cores;
* 64–128 GB RAM;
* NVMe PCIe 4/5;
* dataset large enough to avoid purely cache-only benchmarks when measuring storage;
* documents approximately 1–4 KB.

Workloads to measure:

* GET `_id`;
* GET `_id` with cache hit;
* GET `_id` with NVMe access;
* INSERT;
* UPDATE;
* DELETE/tombstone;
* indexed query;
* sequential scan;
* CLEAN;
* MERGE;
* mixed read/write;
* read-only bursts;
* write bursts;
* single-Serie transactions;
* multiseries transactions.

Always measure:

* throughput;
* P50;
* P95;
* P99;
* CPU;
* RAM;
* cache hit rate;
* WAL bandwidth;
* fsync latency;
* NVMe bandwidth;
* queue depth;
* compaction throughput;
* worker count;
* contention;
* SBCL GC.

<a id="target-preliminari"></a>

## PRELIMINARY TARGETS

These values are illustrative architectural targets, NOT already demonstrated benchmarks.

On suitable hardware:

GET `_id`, cache/index:
~1–4 M ops/s aggregate.

GET `_id`, NVMe:
~150k–600k ops/s.

INSERT async durability:
~700k–2 M ops/s.

INSERT group commit:
~300k–1 M ops/s.

UPDATE append-only:
~400k–1.2 M ops/s.

DELETE/tombstone:
~500k–1.5 M ops/s.

Simple indexed query:
~500k–2 M ops/s.

Sequential scan:
~1–5+ GB/s.

CLEAN:
~0.5–3+ GB/s.

MERGE:
depends on segment count, sizes, layout, I/O, and available load capacity.

Multiseries transactions:
order of magnitude from tens to hundreds of thousands of transactions/s, strongly
dependent on participating Serie count and durable-commit cost.

These numbers must be verified through real benchmarks.

<a id="confronto-con-oracle-mysql-e-mongodb"></a>

## COMPARISON WITH ORACLE, MYSQL, AND MONGODB

Do not use heterogeneous benchmarks to claim direct superiority.

Oracle, MySQL/InnoDB, and MongoDB have:

* different architectures;
* different semantics;
* different durability levels;
* different workloads;
* different configurations.

The proposed database may have a particularly short path for simple document/KV
operations thanks to:

* independent Serie;
* one logical writer per Serie;
* primary index in RAM;
* append-only storage;
* per-Serie WAL;
* group commit;
* immutable segments;
* cache;
* horizontal parallelism between Serie.

This must be treated as an architectural hypothesis to verify experimentally, not an
already demonstrated result.

For a fair comparison use:

* same hardware;
* same dataset;
* same document size;
* same indexes;
* same durability level;
* same concurrency;
* equivalent workload;
* same transaction semantics.

## FAULT INJECTION

Implement fault-injection tests for at least:

* crash during WAL append;
* crash during fsync;
* crash after prepare;
* crash before commit decision;
* crash after commit decision;
* crash during atomic index swap;
* crash during CLEAN;
* crash during MERGE;
* crash during reclaim;
* crash during index rebuild;
* crash with active snapshots;
* crash during multiseries transaction.

Verify invariants:

1. no committed data may be lost;
2. no multiseries transaction may be partially committed;
3. no still-referenced segment may be deleted;
4. no snapshot may observe an inconsistent version;
5. a source segment must remain recoverable until swap completion;
6. interrupted compaction must be repeatable or completable during recovery.

<a id="moduli-software"></a>

## SOFTWARE MODULES

Organize the system into at least these modules:

1. Storage Engine
2. WAL Manager
3. Segment Manager
4. Segment Metadata Manager
5. Primary Index Manager
6. Secondary Index Manager
7. Cache Manager
8. Snapshot/MVCC Manager
9. Transaction Manager
10. Multiseries Transaction Log Manager
11. Compaction Manager
12. Recovery Manager
13. Scheduler
14. Dynamic Thread Pool
15. Query Engine
16. Network/Protocol Layer
17. Archivio/Serie/Documento Catalog Manager
18. SIMD/Hot Path Optimization Layer

<a id="principi-architetturali-fondamentali"></a>

## FUNDAMENTAL ARCHITECTURAL PRINCIPLES

The design must respect these principles:

* append-only;
* one ACTIVE segment per Serie;
* only ACTIVE is writable;
* CLOSED/OBSOLETE/RECLAIMABLE segments always immutable;
* new writes always to a new ACTIVE;
* CLEAN produces a new immutable segment;
* MERGE produces a new immutable segment;
* CLEAN and MERGE never modify sources;
* CLEAN may produce segments much smaller than 256 MB;
* MERGE is not mandatory after CLEAN;
* MERGE only on segments stable for at least 50 seconds;
* MERGE only when engine load is low;
* MERGE is opportunistic and must not penalize user traffic;
* parallelizable compaction;
* dynamic scheduler;
* per-Serie WAL;
* group commit;
* no global data WAL;
* a single `Registri/multiserie.log`;
* 2PC-like multiseries transactions;
* logical MVCC/snapshots;
* reclaim only when no references remain;
* highly optimized primary index;
* specialized secondary indexes;
* anti-scan-pollution cache;
* parallelism between Serie;
* one logical writer per Serie;
* many concurrent readers;
* dynamic thread pool;
* SIMD only where benchmarks demonstrate usefulness;
* crash-safe recovery;
* fault injection;
* reproducible benchmarks.

Final goal: build a general-purpose Common Lisp/SBCL document database with a highly
efficient hot path for common operations, strong parallelism between Serie, crash-safe
append-only storage, adaptive copy-on-write compaction, robust local and multiseries
transactions, and predictable behavior under mixed workloads and sudden read bursts.
