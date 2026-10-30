<a id="architettura-di-arcdocdb"></a>

# ArcDocDB architecture

> Consolidated design document, the outcome of Phase 0. Combines decisions from the
> [specification](specifica/specifica-originale.md) and [ADRs](adr/README.md) into one
> coherent description, following the [design analysis](analisi-progettuale.md) of 2026-10-03
> (ADR 0036–0045). In doubt, the specification and ADRs take precedence; this document cites
> them. Persistent formats are in [formati-su-disco.md](formati-su-disco.md).

<a id="in-una-pagina"></a>

## One-page overview

ArcDocDB is a **log-structured** document database, **parallel by construction**:
Serie are independent units that never wait for each other; each Serie writes records
once, in **sealed batches**, to its `ACTIVE` segment; a **compact in-memory primary
index** maps `_id` to the current version's location; closed segments are **immutable**
and self-contained; **compaction** copies what is needed into new segments and never
touches old ones. Concurrency is **one writer per Serie, readers without locks**;
visibility is governed by a per-Archivio **commit sequence number (CSN)**, also the
version of each document; multiseries transactions use **2PC** with a single decision
log. Every durable change has **one atomicity point**. Everything is Common Lisp on
SBCL, without hot-path allocations.

```
                 Engine (library) inside the Server (SBCL process)
 ┌─────────────────────────────────────────────────────────────────────────┐
 │ Unix socket · CBOR frames       Scheduler · compute pool · I/O pool     │
 │                                                                         │
 │  Archivio ─ CSN ─ horizon ─ coordinator ─ Registri/multiserie.log       │
 │   │                                                                     │
 │   ├── Serie A ── queue ─▶ writer A ─▶ ACTIVE A ──▶ CLOSED… (immutable)  │
 │   │                │        │  (sealed batches)     │                   │
 │   │                │   index A (RAM, in fragments)  hint/idx per segment│
 │   │              reader ◀── cache A ◀─────── pread ◀┘                   │
 │   ├── Serie B …                                                         │
 │   └── Registri (catalog = Serie)                                        │
 │                                                                         │
 │  Compaction Scheduler ─ worker CLEAN/MERGE ─ EBR ─ reclaim              │
 └─────────────────────────────────────────────────────────────────────────┘
```

<a id="leggi"></a>

## Laws

Ten laws underpin every mechanism ([ADR-0036](adr/0036-leggi-di-progetto.md),
[analysis](analisi-progettuale.md#le-leggi)):

1. **Parallelism is foundational**: units that do not wait for each other; shared elements
   form a closed list, never paid for per operation.
2. **Write once.** No written byte is modified; recovery does not truncate.
3. **One writer** for each state; others propose.
4. **One atomicity point per operation**: a durable record decides.
5. **Prepare, decide, complete**: `.tmp`, then the record, then the filesystem.
6. **Nothing is destroyed due to absence.**
7. **Pending → durable → published → acknowledged.**
8. **The CSN is the sole order and sole name of a version.**
9. **Verify before trusting, and report.**
10. **Everything is bounded; resource control does not decide correctness.**

| Operation | Atomicity point |
|---|---|
| single-Serie write | durable batch SEAL |
| multiseries transaction | durable DECISION in `multiserie.log` |
| rotation, CLEAN, MERGE | durable EDIT in control log |
| Serie recovery | rename of compacted control log |
| Serie creation / deletion | catalog document (`active` / `dropping`) |

<a id="parallelismo"></a>

## Parallelism

Parallelism is the architecture's **foundational principle** (law 1, INV-P6): it is not
added to a serial system, it is how state is divided. The unit of parallelism matches
the unit of state ownership, so the same division provides correctness (one writer)
and parallelism.

| Level | Unit | Proceeds in parallel | Remains serial |
|---|---|---|---|
| Server | Archivio | each Archivio has its own CSN, horizon, coordinator, and log | nothing |
| Archivio | Serie | writes, reads, flush, compaction, recovery | the [closed list](#archivio-coordinamento-minimo) |
| Serie | reader, writer | readers with each other and relative to writer, without locks | mutations: one writer |
| Write | request | parsing, validation, encoding, body CRC | version, copy, seal: in writer |
| Log | batch | flushes of different logs; batches form during flush | one I/O task per log |
| Compaction | segment | CLEAN and MERGE on different segments and Serie | EDIT and relocations: in writer |
| Recovery | Serie, segment | Serie; hints in any order | nothing |
| Query | segment | segment indexes | nothing |
| Index | fragment | split stops neither readers nor other fragments | split: in writer |

Consequent rules:

- between Serie, **no locks and no shared writes per operation**; shared elements are
  in the closed list in [Archivio: minimal coordination](#archivio-coordinamento-minimo);
- every mechanism declares what it serializes and at which level; for equal guarantees,
  the solution that serializes less and at a lower level wins;
- work distribution is not a serialization point: a read is executed by its receiving
  worker, with no common queue; a write enters **its own** Serie's queue; the ready-Serie
  list is touched once per writer turn, not per operation
  ([ADR-0045](adr/0045-modello-di-esecuzione.md)).

<a id="modello-logico"></a>

## Logical model

`Server → Archivio → Serie → Documento` ([02](02-modello-logico.md)). The Serie is the unit
of storage, parallelism, and isolation. The Archivio is the scope of CSNs, snapshots,
multiseries transactions, and the catalog.

<a id="archivio-e-registri"></a>

### Archivio and Registri

- **Registri is a Serie** with built-in configuration; each Serie in the Archivio is a
  catalog document, identified by a stable 16-byte ID naming its directory
  ([ADR-0022](adr/0022-registri-come-serie-catalogo.md)). Creation and deletion follow
  ‘prepare, decide, complete’ ([ADR-0040](adr/0040-manifest-a-record-unico.md) §5).
- The Archivio owns: the **CSN** counter and **visibility horizon**, the **active-snapshot**
  registry, the **coordinator** and `multiserie.log`, the **epoch** for reclaim.

<a id="layout-fisico"></a>

### Physical layout

```
Archivio/
├── LOCK
├── Registri/
│   ├── catalog/                 ← storage of the Registri Serie
│   │   ├── wal/control.log
│   │   ├── segments/<id>.seg|.hint|.<idx>.idx
│   │   └── index/               ← reserved (future summary indexes)
│   └── multiserie.log
├── 0f3a…c2/                     ← Serie (internal ID; name is in the catalog)
│   ├── wal/control.log
│   ├── segments/
│   └── index/
└── …
```

<a id="memoria"></a>

## Memory

All large structures are specialized arrays without pointers; hot paths do not
allocate ([ADR-0024](adr/0024-memoria-e-gc.md)). The index grows one fragment at a time
([ADR-0043](adr/0043-primary-index-a-frammenti.md)).

| Structure | Per | Contents | Growth |
|---|---|---|---|
| Primary index | Serie | directory + fragments (control bytes, 5 words/slot v2, local keys) | split one fragment |
| Retained versions | Serie | same table, five-word slots: versions still visible to a snapshot | only with active snapshots |
| Pending versions | Serie | same table, writer-only: unpublished batches and intents | bounded |
| Secondary-index deltas | Serie | `ACTIVE` entries for every index, append arrays | cleared on closure |
| Cache | Serie (partition) | associative sets by size class + byte arena | scheduler budget |
| Batch buffers | Serie | open batch + closed batches not yet durable | byte-bounded |
| Metrics | worker/Serie | padded counters + log-linear histograms | fixed |
| Epochs | worker | one padded word per worker | fixed |
| Horizon, snapshot registry | Archivio | in-flight CSN registry, active-snapshot CSN array | fixed |

<a id="concorrenza"></a>

## Concurrency

<a id="modello-di-esecuzione"></a>

### Execution model

**Run-to-completion tasks** ([ADR-0045](adr/0045-modello-di-esecuzione.md)): every unit of
work runs from start to finish without suspension. A wait **parks** the request context
on a bounded list (batch clients, snapshots awaiting the horizon, coordinators);
the awaited event queues a new task.

<a id="thread-pool"></a>

### Thread pools

Two dynamic pools ([ADR-0011](adr/0011-thread-pool-dinamico.md),
[ADR-0017](adr/0017-piattaforma-e-io.md)):

- **Compute pool**: requests, logical-writer turns, compaction (compute portion),
  queries. Makes no blocking calls (INV-P5). Sized by the scheduler
  (EWMA/AIMD/hysteresis) between `min` and `2 × core`.
- **I/O pool**: log writes, flushes, segment reads, renames, deletions. Has a ceiling
  that also limits device concurrency.

A Serie's **logical writer** is a serial executor: a bounded MPSC queue; the worker
acquiring the Serie token processes a bounded turn of operations and messages;
no dedicated thread, no global lock ([ADR-0005](adr/0005-writer-logico-per-serie.md)).

### Reclaim

Epoch-based reclamation for **external resources**: descriptors and removed-segment files
([ADR-0016](adr/0016-epoch-based-reclamation.md)). Replaced index directories and fragments
are heap objects: the collector reclaims them when no reader references them.
A read section coincides with a task: it may include a disk read, never networking
or waits.

<a id="percorso-di-scrittura"></a>

## Write path

```
request worker                  logical writer (execution slice)                    I/O pool
───────────────                   ──────────────────────                    ───────────
parse CBOR, validate contract,  ─▶ per op: index + pending versions,
hash key, encode record,     check expected-version (= CSN) and intents,
body-crc                          copy into the open batch buffer,
                                  pending entry, secondary index delta
                                  ── batch closure ──
                                  csn ← incf; stamp, header-crc, SEAL   ─▶  write closed batches
                                  (move to the next batch)               durable flush
                                  ◀── queued “durable through X” ─────────┘
                                  for each covered batch, in order:
                                  retain if threshold < csn, publish
                                  in the index (seqlock), move CSN
                                  out of the horizon, acknowledge clients
```

- A record is written **once**, to the `ACTIVE` segment ([ADR-0013](adr/0013-log-structured-segmento-active-come-log.md)).
- The **sealed batch** is atomic; one I/O task per log at a time; acknowledgment after
  publication ([ADR-0037](adr/0037-lotto-sigillato.md)). Levels `:async` / `:group` /
  `:strong`: only publication and acknowledgment timing changes
  ([ADR-0019](adr/0019-durability-e-group-commit-pipelined.md)).
- The writer performs no byte-proportional work beyond copying: body CRC is computed
  by the request worker ([ADR-0039](adr/0039-cornice-unica-dei-record.md)).
- **Rotation**: at `target` bytes, when every batch is durable and published and the Serie
  has no pending intents: new `.tmp` segment, EDIT `{chiude, apre}`, rename. A worker later
  produces the closed segment's hint and indexes ([ADR-0040](adr/0040-manifest-a-record-unico.md)).

<a id="percorso-di-lettura"></a>

## Read path

```
GET(serie, _id [, snapshot s])                       task in the compute pool
  enter epoch
  hash → directory → fragment → group → slot (seqlock) → key
  if s supplied and csn(entry) > s → retained versions
  location (seg, off, len)
  cache[(seg, off)] → hit: copy, verify, respond
                    → miss: request migrates to I/O pool and restarts from the beginning:
                            index → cache → pread → verify → insert → respond
  exit epoch
```

No allocation; no locks. The cache is keyed by location, is never invalidated, and
participates in no protocol ([ADR-0025](adr/0025-cache-per-location.md),
[ADR-0044](adr/0044-cache-acceleratore-puro.md)). Every record is verified before leaving
the engine, whether from disk or cache (INV-A2).

## Primary index

Extendible-hashing directory of **fragments**; each fragment is a fixed-capacity Swiss
table with its own keys; one writer, readers without locks using per-slot seqlocks
([ADR-0043](adr/0043-primary-index-a-frammenti.md), [ADR-0032](adr/0032-seqlock-a-64-bit.md)).
Contains **only live documents** ([ADR-0042](adr/0042-tombstone-e-indice-dei-vivi.md)).

The reader rechecks root and generation even on misses, with bounded attempts.
Maintenance copies at most C source slots, but the immutable directory costs O(2^G)
references and keys have a separate budget: no pause independent of Serie size is
promised ([ADR-0050](adr/0050-pubblicazione-e-costi-della-directory.md)).

V2 slot (5 words + 1 control byte = 41 B), [ADR-0048](adr/0048-limiti-documentali-e-formato-v2.md):

| Word | Contents |
|---|---|
| 0 | CSN = version |
| 1 | segment-id (32) · offset (32) |
| 2 | key-off (32) · key-len (16) · flags (8) · reserved (8) |
| 3 | seqlock counter (64) |
| 4 | record length (32) · reserved (32) |

Persistence: the index is derived data; it is rebuilt from closed-segment hints in
any order, selecting the maximum CSN for each key. Limits derived from the layout
are in [limiti.md](limiti.md).

<a id="indici-secondari"></a>

## Secondary indexes

One immutable fixed-format file per segment and index, with a value-existence filter;
in-memory delta (append arrays) for `ACTIVE`; per-segment queries in parallel with
visibility filtering through index and retained versions: a row is a result if its
CSN is the one the reader sees
([ADR-0026](adr/0026-indici-secondari-segmentati.md)).

**Full-text search, decided for the design in
[ADR-0053](adr/0053-ricerca-full-text-indici-invertiti.md):** dedicated inverted indexes,
with `(campo, termine)` dictionary, row postings, and phrase positions. Versioned
analyzer in the contract, identical for document and query; `ACTIVE` delta published
with documents, immutable files for `CLOSED` segments. Text and structured filters are
evaluated on the same visible version, including historical versions. A generation is
usable only with complete coverage; a missing or corrupt derivative is reported as
unavailable and rebuilt. Analysis on workers, publication on the Serie writer,
per-segment queries: no additional global coordination. Implementation and qualification
remain in phase 8; details in [08 Indexes](08-indici.md#ricerca-full-text).

[ADR-0054](adr/0054-contratto-e-formato-full-text.md) completes the
[operational contract](full-text.md): pinned Unicode profile, generations with separate
files and verified readiness, reservations before SEAL/PREPARE, and rotation also
guided by index budgets. The [`.idx` v2 format](formato-indice-full-text.md) binds every
posting to the exact hint; it does not change document records.

<a id="snapshot-e-mvcc"></a>

## Snapshots and MVCC

- **CSN** per Archivio, taken at batch or decision closure; for every document,
  CSN order is version order (INV-M5).
- **Visibility horizon** `H`: the largest CSN below which everything is published. A
  snapshot is a number `s` and is created when `H ≥ s` (INV-M4): its view cannot change.
- **Retained versions** for documents overwritten while a snapshot needs them,
  determined using the snapshot registry's `soglia`.
- `snapshot-too-old` beyond maximum duration; levels: read committed for GET, snapshot
  isolation for transactions, optional `:serializable` with read-set validation.

The in-flight CSN registry has fixed capacity; CSN assignment and registration are
indivisible. Publication frees the slot and derives H from the minimum still in flight,
or from the latest CSN if the registry is empty. No CSN-indexed ring is used:
SPK-07 found a counterexample with a slow commit (INV-M6).

([ADR-0038](adr/0038-orizzonte-di-visibilita.md), [ADR-0046](adr/0046-orizzonte-con-registro-limitato.md), [ADR-0020](adr/0020-csn-snapshot-isolamento.md))

<a id="transazioni"></a>

## Transactions

<a id="single-series"></a>

### Single-Serie

Operations with expected-version (a CSN) executed by the writer in the batch; conflict →
`conflict`; the batch is atomic; one CSN per batch ([ADR-0005](adr/0005-writer-logico-per-serie.md),
[ADR-0037](adr/0037-lotto-sigillato.md)).

<a id="transazioni-multiserie"></a>

### Multiseries transactions

```
coordinator            writer A                 writer B              multiserie.log
    │ PREPARE ─────────▶ check, record prepared
    │                    in batch, intents, flush
    │ PREPARE ─────────────────────────────────▶ (same)
    │ ◀ prepared ─────── │                        │
    │ ◀ prepared ─────────────────────────────────┘
    │ DECISION(T) ──────────────────────────────────────────────────▶ batch: csn ← incf; flush
    │ ◀ durable ───────────────────────────────────────────────────┘      (T is committed)
    │ OUTCOME(T, csn) ─▶ publish, remove intents,
    │                    OUTCOME record in batch
    │ OUTCOME(T, csn) ─────────────────────────▶ (same)
    │ ◀ applied ────── │ ◀ applied ──────────┘
    │ csn out of the horizon; acknowledge client
    │ ◀ durable outcome (all) → T may be forgotten
```

Writer never blocked; no-wait intents; *presumed abort* (an abort writes nothing);
self-contained segments: rotation waits for pending intents, so every prepared record's
outcome is in its own segment ([ADR-0021](adr/0021-2pc-intenti-outcome.md),
[ADR-0041](adr/0041-multiserie-segmenti-autosufficienti.md)).

## Compaction

- Selection by dead space (CLEAN) or count of small segments stable for ≥ 50 s (MERGE),
  with load state `{basso, normale, alto}` and per-worker bandwidth limiter
  ([ADR-0023](adr/0023-politiche-di-compaction.md)).
- Copy-on-write workflow: sequential source read → copy **required** records (referenced
  by index, referenced by retained versions, nondiscardable tombstones), with prepared
  records rewritten as ordinary records → durable `<id>.seg.tmp` with hint and indexes
  → **EDIT** `{chiude: output, rimuove: sorgenti}` → rename → conditional relocations
  through writer → sources `OBSOLETE` → epoch passed → `RECLAIMABLE` → deletion
  ([ADR-0040](adr/0040-manifest-a-record-unico.md)).
- A **tombstone** is discarded only if superseded by a newer version or if no other
  segment can contain an older record for the same key (existence filter in hints)
  ([ADR-0042](adr/0042-tombstone-e-indice-dei-vivi.md)).
- Parallel per segment and per Serie; readers never stop.

<a id="archivio-coordinamento-minimo"></a>

## Archivio: minimal coordination

What Serie share, and its cost. The list is **closed** (INV-P6): no entry has a shared-write
cost per individual operation, and adding one requires an ADR.

| Shared element | When paid | Cost |
|---|---|---|
| CSN | per batch (single-Serie) or decision (multiseries) | indivisible assignment and registration under horizon mutex ([ADR-0046](adr/0046-orizzonte-con-registro-limitato.md)) |
| Horizon | per published batch | one mutex-protected pass and scan of bounded pending registry; no reader cost |
| Snapshot creation | per snapshot | wait for horizon to reach snapshot: at most in-progress Archivio flushes, with a time limit. The only point where one Serie may delay another, protecting INV-M1 |
| Snapshot registry | per snapshot; per published batch | creation/closure under mutex; one `soglia` read per batch |
| Epoch | per read task | one shared read and one worker-**local** write |
| `multiserie.log` | per multiseries transaction | group commit |
| Catalog (Registri) | per Serie creation, change, deletion | one write in Registri |
| Ready-Serie list | per writer turn | one list operation |
| Scheduler, metrics | outside request path | per-worker and per-Serie counters, aggregated on read |

Shared by the whole process and impossible to eliminate, therefore **controlled**: the
device (INV-P4 priorities, bandwidth limiter, I/O-pool ceiling), workers (dynamic pools),
and garbage collector, which stops every thread (no hot-path allocations, RSK-01).

## Recovery

Read-only on segments; idempotent because every effect is an atomicity point or completion
([11](11-recovery.md), [ADR-0036](adr/0036-leggi-di-progetto.md)):

1. Exclusive Archivio lock. Registri: like any Serie (step 3), first.
2. `multiserie.log` → decision table; tail according to frontier rule.
3. For every catalog Serie, in parallel:
   - fold control log; reconcile with directory (unnamed `.tmp` deleted, named ones
     renamed, removed ones deleted, unknown ones reported, missing ones quarantined);
   - validate `ACTIVE` batch by batch; tail or corruption using durable frontier
     ([ADR-0037](adr/0037-lotto-sigillato.md) §3);
   - index from `CLOSED` hints and valid `ACTIVE` batches: maximum CSN wins for each key;
     prepared records resolved with OUTCOME, manifest, or decision table;
   - **atomicity point**: compacted control log closing old `ACTIVE` at valid length,
     with outcomes, and opening the new one; rename.
4. CSN = maximum observed + 1; horizon = CSN − 1; segment stabilization = end of
   recovery; `multiserie.log` rewritten with decisions for unopened Serie only.
5. Open to traffic. Missing hints and indexes are regenerated in the background.

<a id="affidabilità"></a>

## Reliability

The project is critical software ([ADR-0031](adr/0031-software-critico-criteri-e-priorita.md));
performance is subordinate. What this means architecturally:

| Aspect | Mechanism | Reference |
|---|---|---|
| Health states | Serie `HEALTHY`/`DEGRADED`/`FAULTED`; Archivio `HEALTHY`/`MULTI-DISABLED`/`FAULTED` | [ADR-0033](adr/0033-fail-stop-e-integrita-end-to-end.md) |
| I/O errors | fail-stop, never retry; space reserve against `ENOSPC` | ADR-0033 §2 |
| Verification | two CRC32C checks and index comparison on every read; for prepared records, also TXID and CSN of authoritative OUTCOME/manifest proof | ADR-0033 §3, [ADR-0039](adr/0039-cornice-unica-dei-record.md) §4, [ADR-0047](adr/0047-verifica-csn-dei-record-prepared.md) |
| Tail or corruption | durable frontier in SEALs: decidable from contents | [ADR-0037](adr/0037-lotto-sigillato.md) §3 |
| Recovery | nondestructive, idempotent, one atomicity point | [ADR-0036](adr/0036-leggi-di-progetto.md) |
| Destruction | only `.tmp` or recorded removals; never due to absence | ADR-0036 §3 |
| Latent detection | scrubbing within 7 days; offline verifier | ADR-0033 §6–7 |
| Code | `safety` ≥ 2, no warnings, prohibitions, linter | [ADR-0034](adr/0034-policy-di-compilazione-e-standard-di-codifica.md) |
| Concurrency | 64-bit seqlock with bounded attempts and writer fallback; one concurrent table | [ADR-0032](adr/0032-seqlock-a-64-bit.md), [ADR-0043](adr/0043-primary-index-a-frammenti.md) |
| System verification | models, simulator, fault injection, differential testing, fuzzing, mutation | [ADR-0035](adr/0035-strategia-di-verifica-e-tracciabilita.md) |
| Traceability | requirements, generated matrix, `make trace` | [traceability](tracciabilita/README.md) |

Full failure and response analysis: [affidabilita/analisi-dei-guasti.md](affidabilita/analisi-dei-guasti.md).

<a id="scheduler-e-osservabilità"></a>

## Scheduler and observability

Per-worker and per-Serie metrics, log-linear histograms, without allocation; the scheduler
reads EWMA values for: compute- and I/O-worker counts, per-Serie cache budget, load
state, compaction bandwidth and concurrency ([12](12-osservabilita.md)). The scheduler
selects numbers within verified ranges: it cannot change data (class C3).

<a id="interfacce"></a>

## Interfaces

The engine is a **library** with a ‘request plus continuation’ interface; the server exposes
it through a **local Unix stream socket**, with CBOR frames and multiplexing.
This is the default transport and priority path for the future NNTP daemon in a separate
process on the same machine. TCP remains optional and later, disabled by default,
without automatic fallback. Queries as data and the catalog's Serie contract with
additive evolution remain those of ADR-0029
([ADR-0029](adr/0029-interfacce-protocollo-query-contratto.md),
[ADR-0045](adr/0045-modello-di-esecuzione.md),
[ADR-0055](adr/0055-interfaccia-locale-unix-socket.md)).

The socket path is configurable in a protected runtime directory; collisions and orphans
produce explicit errors. Partial frames, in-flight requests, and buffers have limits
checked before admission; no client wait retains EBR epochs or blocks the writer.
A lost response neither cancels a commit nor authorizes automatic replay.
Initial local M16 integration follows engine startup, recovery, and admission, before
index/query and TCP completion; implementation remains pending.

<a id="contratti"></a>

## Contracts

Intermodule interface rules ([16](16-moduli.md)), derived from ADRs:

1. **No allocation** in hot-path APIs: inputs as `(array start end)`, outputs in
   caller buffers; outcome codes are immediate values.
2. **Only its writer mutates a Serie**: every change to index, pending and retained
   versions, deltas, counters, and control log passes through the writer queue.
   Compaction and coordinator *propose* (relocations, OUTCOME); the writer *applies*.
3. **Readers remain in an epoch** for the duration of their task, without networking or waits.
4. **All I/O passes through the `io` module**, replaceable in tests, and runs on the I/O pool.
5. **Every persistent file** has magic, version, and CRC32C; every log is a sequence of
   sealed batches with the same record frame (INV-F1, INV-F2).
6. **Every derivative declares its source** and has a rebuild procedure.
7. **Time, randomness, scheduling, and I/O use injectable interfaces**
   ([ADR-0035](adr/0035-strategia-di-verifica-e-tracciabilita.md)): in tests the whole system
   runs in a deterministic simulator reproducible from a seed.
8. **Unverified data never leave the engine** (INV-A2): every record read is checked
   (header and body CRC, key, CSN) before return.
9. **A write or flush error is fatal to the Serie** (INV-A1) and is never retried.
10. **No unbounded loop or wait** (INV-A8); every resource has an enforced limit.
11. **No task suspends** (INV-P5): a wait is parking on a bounded list;
    interfaces are ‘request plus continuation’.
12. **Every durable operation declares its atomicity point**, preparation, and completion
    (INV-A11); nothing is deleted without a record authorizing it (INV-A10).
13. **Every module declares what it shares between Serie**: nothing, or an entry in the
    closed list; never a shared write per operation (INV-P6).

<a id="moduli"></a>

## Modules

Mapping to the specification's 18 modules in [16-moduli.md](16-moduli.md); ADRs identify
mechanisms for each. Package: `arcdocdb.<modulo>`; support modules `io` and `metrics`.

<a id="che-cosa-resta-da-misurare"></a>

## What remains to measure

Decisions are made; five quantitative hypotheses remain to be checked with spikes before
Phase 1 ([evaluation](valutazione/cronologia.md#rivalutazione-2026-10-03)):

1. GC pauses with large heap, zero allocation, and increasing thread count (SPK-02,
   criterion ≤ 5 ms);
2. throughput, memory per document, and correctness of the fragmented primary index (SPK-01);
3. latency and scalability of one flush at a time per Serie, with many Serie (SPK-03),
   and overall scalability with Serie and core counts (SPK-04);
4. cost of reliability checks, read-time CRC, and `safety` ≥ 2 (SPK-09);
5. protocol models — batch and frontier, horizon, 2PC, swap, recovery — without
   violations (SPK-07).

<a id="limiti-documentali-e-capacità"></a>

## Document limits and capacity

The v2 contract accepts 16 MiB CBOR documents, depth up to 100, and keys up to 65,535 bytes (ADR-0048). Verification and migration remain to be produced. Beyond-RAM mode is a separate proposal ([ADR-0049](adr/0049-capacita-oltre-la-ram.md)), with cold lookups and latency to measure.

[Automatic selection](implementazione/indice-automatico.md), approved by
[ADR-0057](adr/0057-selezione-automatica-indice.md), preserves the flat path
when it fits and plans live switching and return with budgets and hysteresis.
The first component only decides: persistent backend, cache, and actuator
are not yet connected to the engine. No new lock-free guarantee is attributed
to GET from the frame-lifetime SC model alone.

[ADR-0058](adr/0058-pagine-indice-primario.md) adds the
[local page format](implementazione/pagine-indice.md): flat buckets,
radix directory, and key fragments with verified identity and CRC. The codec
prepares owned bytes without a new commit or file access.
