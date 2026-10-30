<a id="analisi-progettuale"></a>

# Design analysis

> Critical rereading of the whole design (specification, ADR 0001–0035, architecture, formats,
> failure analysis) performed on 2026-10-03 using four criteria: **robust, lean, practical,
> elegant**. Every `AP-nn` finding states what the design said, why it fails, and which
> decision resolves it. Decisions are in [ADR 0036–0045](adr/README.md#analisi-progettuale-fase-0-2026-10-03);
> the consolidated result is in [architettura.md](architettura.md) and
> [formati-su-disco.md](formati-su-disco.md). No performance number in this document
> is a measurement (INV-X2).

<a id="criteri"></a>

## Criteria

| Criterion | Operational meaning | How a violation is recognized |
|---|---|---|
| **Robust** | every invariant holds by construction under every interleaving and a crash at every point; every failure in the [model](affidabilita/analisi-dei-guasti.md) has a defined response | a counterexample exists: a sequence allowed by the design violates an invariant |
| **Lean** | one mechanism per problem; no field, record, file, state, or structure without a unique function | it can be removed without losing a guarantee |
| **Practical** | every mechanism is implementable with existing SBCL primitives, at bounded cost, without steps requiring unavailable memory or time | a step requires an absent primitive, hot-path allocation, unbounded pause, or unbounded transient memory |
| **Elegant** | few general laws from which special cases follow; the same form recurs at every level | a special case has its own rule not derived from a law |

A fifth criterion cuts across the other four and comes first in the system's structure: **parallelism**. A robust, lean, elegant solution introducing a serialization point between Serie is not admitted without an ADR declaring it ([Parallelism](#parallelismo)).

<a id="esito"></a>

## Outcome

The design's foundations hold: independent Serie working in parallel, append-only
storage, immutable segments, one writer per Serie, readers without locks, copy-on-write
compaction. Analysis found **five correctness defects**, **six undefined points**,
**two feasibility limits**, and several **redundant mechanisms**. All are resolved
by ten decisions that collectively *remove* more than they add.

| Finding | Nature | Summary | Decision |
|---|---|---|---|
| [AP-01](#ap-01) | defect | a snapshot can see a batch appear that was in flight at its creation (violates INV-M1) | [ADR-0038](adr/0038-orizzonte-di-visibilita.md) |
| [AP-02](#ap-02) | defect | CSN taken at batch start can invert causal order with a multiseries transaction | [ADR-0037](adr/0037-lotto-sigillato.md), [ADR-0038](adr/0038-orizzonte-di-visibilita.md) |
| [AP-03](#ap-03) | defect | an ordinary crash with multiple in-flight batches is classified as ‘mid-log corruption’ | [ADR-0037](adr/0037-lotto-sigillato.md) |
| [AP-04](#ap-04) | defect | lineage-based tombstone rule makes deleted documents reappear | [ADR-0042](adr/0042-tombstone-e-indice-dei-vivi.md) |
| [AP-05](#ap-05) | defect | CLEAN can discard a still-needed OUTCOME record: committed data lost on restart | [ADR-0041](adr/0041-multiserie-segmenti-autosufficienti.md) |
| [AP-06](#ap-06) | undefined | multiseries acknowledgment before visibility | [ADR-0041](adr/0041-multiserie-segmenti-autosufficienti.md) |
| [AP-07](#ap-07) | undefined | snapshot-registry protocol (creation/overwrite race) | [ADR-0038](adr/0038-orizzonte-di-visibilita.md) |
| [AP-08](#ap-08) | undefined | truncated control-log tail; read-time prepared-record verification; CSN ‘after’ decision but ‘inside’ record | [ADR-0037](adr/0037-lotto-sigillato.md), [ADR-0039](adr/0039-cornice-unica-dei-record.md), [ADR-0041](adr/0041-multiserie-segmenti-autosufficienti.md) |
| [AP-09](#ap-09) | undefined | cache concurrency; relabeling couples it to compaction | [ADR-0044](adr/0044-cache-acceleratore-puro.md) |
| [AP-10](#ap-10) | undefined | read transfer from compute pool to I/O pool; what blocks whom | [ADR-0045](adr/0045-modello-di-esecuzione.md) |
| [AP-11](#ap-11) | undefined | key Bloom filter has no function | [ADR-0042](adr/0042-tombstone-e-indice-dei-vivi.md), [ADR-0039](adr/0039-cornice-unica-dei-record.md) |
| [AP-12](#ap-12) | feasibility | doubling index table needs triple memory and stalls writer for seconds; key arena grows without bound | [ADR-0043](adr/0043-primary-index-a-frammenti.md) |
| [AP-13](#ap-13) | feasibility | whole-record CRC computed inside writer; Archivio TXID per operation | [ADR-0039](adr/0039-cornice-unica-dei-record.md) |
| [AP-14](#ap-14) | redundancy | control log with seven record types; destruction ‘due to absence’; truncating recovery | [ADR-0040](adr/0040-manifest-a-record-unico.md), [ADR-0036](adr/0036-leggi-di-progetto.md) |
| [AP-15](#ap-15) | redundancy | document version and CSN are two numbers for one fact | [ADR-0038](adr/0038-orizzonte-di-visibilita.md) |
| [AP-16](#ap-16) | redundancy | EBR for structures the collector already retires | [ADR-0043](adr/0043-primary-index-a-frammenti.md) |

<a id="le-leggi"></a>

## The laws

The elegance sought is this: **ten laws**, and every system mechanism applies one
at a particular level. They are normative ([ADR-0036](adr/0036-leggi-di-progetto.md));
verifiable invariants are shown in parentheses.

1. **Parallelism is foundational.** State is divided into units proceeding without waiting
   for each other: Archivio instances, an Archivio's Serie, readers with each other and
   relative to writer, segments in compaction, recovery, and queries. What remains shared
   is a closed list, with bounded cost never paid per individual operation. This is not
   an optimization: it is the system's shape, and each mechanism is judged first by what
   it serializes (INV-P1…P4, INV-P6, INV-W1).
2. **Write once.** A written byte is not modified; a closed file never changes again;
   recovery neither modifies nor truncates what it finds (INV-S1, INV-S4, INV-A9).
3. **One writer.** Every state has one owner mutating it in a total order: the logical
   writer for a Serie, the coordinator for `multiserie.log`. Others *propose*
   (INV-P1, INV-V4).
4. **One atomicity point per operation.** Every durable change is decided by **one**
   durable record. Before it, only discardable preparation; afterward, only idempotent
   completion (INV-A11).
5. **Prepare, decide, complete.** Prepared objects have `.tmp` names; the decision is a
   record in the source of truth; the filesystem follows afterward, and recovery repeats
   that alignment (INV-A7, INV-A11).
6. **Nothing is destroyed due to absence.** Delete only `.tmp` objects or those whose
   removal a source of truth records. An unknown object is a reported anomaly, not garbage
   (INV-A10).
7. **A version starts pending, becomes durable, then published; only then is it
   acknowledged.** The same lifecycle applies to a Serie batch and a multiseries
   transaction, which merely stays pending longer (INV-V1, INV-V5).
8. **The CSN is the sole order and sole name.** It orders commits, defines what a snapshot
   sees, and identifies a document version. A snapshot is created when the horizon has
   reached it (INV-M4, INV-M5).
9. **Verify before trusting, and report.** Every datum crossing a boundary (disk, cache,
   network) is verified; what fails verification does not leave; a fault stops, rather
   than guesses (INV-A1, INV-A2, INV-F1…F3).
10. **Everything is bounded, and resource control does not decide correctness.** Every
    resource has an enforced ceiling; the scheduler selects numbers within verified
    ranges and cannot change data (INV-A8, INV-P5).

Laws 1 and 3 describe the same division from two sides: the unit of parallelism (Serie)
is also the unit of state ownership. Therefore parallelism costs no guarantees, and
[ADR-0031](adr/0031-software-critico-criteri-e-priorita.md)'s priority hierarchy remains intact.

<a id="parallelismo"></a>

## Parallelism

Parallelism is a **foundational principle** by the author's decision (2026-10-03) and the
specification, which includes it in the goal (‘strong parallelism between independent
Serie’) and requires a hierarchy. Level by level:

| Level | Unit of parallelism | Proceeds in parallel | What remains serial, and where |
|---|---|---|---|
| Server | Archivio | each Archivio has its own CSN, horizon, coordinator, and logs | nothing between Archivio instances |
| Archivio | Serie | writes, reads, flushes, compaction, and recovery of different Serie | the [closed list](architettura.md#archivio-coordinamento-minimo), paid per batch, multiseries transaction, or snapshot |
| Serie | reader, writer | readers with each other and relative to writer, without locks | mutations: one writer |
| Write | request | parsing, validation, encoding, and body CRC, on workers | version checking, copy, and seal, in writer |
| Log | batch | flushes of different logs; writer forms batches during flush | one I/O task per log |
| Compaction | segment | CLEAN and MERGE on different segments and Serie; readers do not stop | EDIT and relocations, proposed to writer |
| Recovery | Serie, segment | Serie with each other; a Serie's hints in any order | nothing |
| Query | segment | a Serie's segment indexes | nothing |
| Index | fragment | splitting one fragment stops neither readers nor other fragments | split itself, in writer |

What this analysis's decisions contribute to parallelism:

- **removed** a write shared by all Serie on every operation (Archivio TXID,
  AP-13): one CSN per batch remains;
- **removed** byte-proportional work from the writer (body CRC, AP-13): a Serie's
  serial part does not grow with document size;
- the horizon wait is at **snapshot creation**, not write acknowledgment (AP-01):
  a Serie never waits for another's flush to write or read;
- index reconstruction is **independent of segment order** (AP-04): recovery is
  parallel even within a Serie;
- index growth **does not stop** writer or readers (AP-12); closed-segment hints and
  indexes are built outside writer (AP-14); writer does not write cache (AP-09);
- no compute worker blocks, and no read passes through a common queue (AP-10).

What the design cannot make parallel, and declares: the device, workers, and SBCL's
garbage collector, which stops every thread (RSK-01).

<a id="punti-di-atomicità"></a>

## Atomicity points

Law 4 applied to every system operation. For each row, recovery is: *discard what
precedes, complete what follows* — hence idempotence without its own logic.

| Operation | Preparation (discardable) | **Atomicity point** | Completion (idempotent) |
|---|---|---|---|
| Single-Serie write | batch records in buffer and file | **durable batch SEAL** | index publication, acknowledgment |
| Multiseries transaction | sealed prepared records on participants | **durable DECISION in `multiserie.log`** | application, OUTCOME record, acknowledgment |
| `ACTIVE` rotation | new `.tmp` segment | **EDIT in control log** | rename |
| CLEAN / MERGE | `.tmp` output segment with hint and indexes | **EDIT in control log** | rename, relocations, source retirement and deletion |
| Serie recovery | read-only; new `ACTIVE` and compacted `.tmp` control log | **compacted-control-log rename** (its EDIT closes old `ACTIVE` at valid length, with outcomes) | new `ACTIVE` rename |
| Serie creation | complete `.tmp` directory | **catalog document** | rename |
| Serie deletion | — | **catalog document in `dropping` state** | directory removal, tombstone |
| Control-log compaction | new `.tmp` file | **atomic rename** | — |

<a id="rilievi"></a>

## Findings

### AP-01

**A snapshot saw in-flight batches appear.** [ADR-0020](adr/0020-csn-snapshot-isolamento.md)
assigned batch CSN *before* flush (CSN is in the record) and
[ADR-0019](adr/0019-durability-e-group-commit-pipelined.md) published the batch *after* flush.
Snapshot creation took `s ← current CSN` and waited only for multiseries transactions
‘being applied’.

*Counterexample.* Serie A closes a batch with CSN 10 and starts flushing. Serie B commits
with CSN 11 and publishes. A snapshot is created with `s = 11`: it reads document X in
Serie A and sees the old version. A's flush finishes, batch 10 is published: the same
snapshot rereads X and sees the new version (10 ≤ 11). The view changed: INV-M1 is violated.

*Solution.* The **visibility horizon** `H`: the largest CSN such that every commit with
CSN ≤ `H` is published. A snapshot takes `s` and is created when `H ≥ s`. Batches and
multiseries transactions use the same mechanism: the ‘being applied’ set disappears
as a separate concept.

### AP-02

**Taking CSN at batch start could invert causality.** The writer opens a batch and takes
CSN 20; then applies the outcome of multiseries transaction T with CSN 21 on X; then,
in the same batch, accepts an update of X depending on it. The later version carries 20,
the preceding one 21: a snapshot at 20 sees the effect without the cause, and does not
see T on other Serie.

*Solution.* Batch CSN is taken **at closure**, when SEAL is written.
Because an intent blocks other writes to the same document until outcome, INV-M5
follows: for each document, CSN order = version order.

### AP-03

**An ordinary crash became a fault.** With several batches in flight on one file
(ADR-0019), the operating system may have persisted batch N+1 but not N — point 2
of the failure model. The rule in [ADR-0033](adr/0033-fail-stop-e-integrita-end-to-end.md)
§4 (‘valid record after an anomaly = mid-log corruption’) then moved the Serie to
`FAULTED` after ordinary power loss. The same section also declared an invalid record
in `control.log` or `multiserie.log` ‘always corruption’, although interrupted append
produces a legitimate tail there.

*Solution.* The **sealed batch** and **durable frontier**: each SEAL records how far the
log was durable when the batch closed. An anomaly at `P` is corruption only if a later
valid SEAL witnesses a frontier `> P`; otherwise it is a tail. The decision depends
on log contents, not media write ordering. All logs (`ACTIVE` segment, control log,
`multiserie.log`) are sequences of sealed batches with one flush at a time:
one mechanism, three instances.

*Declared limitation.* At-rest damage to only batches made durable by the final flush
before abrupt termination, not yet witnessed by a later batch, remains indistinguishable
from a tail ([RES-05](affidabilita/analisi-dei-guasti.md#rischi-residui-accettati)).

### AP-04

**The tombstone rule was unsafe.** [ADR-0023](adr/0023-politiche-di-compaction.md):
a tombstone in a segment with lineage `L` is discarded when no segment has
`lineage-min < L`.

*Counterexample.* Segments 3, 5, 7; 5 contains `PUT k`; 7 contains `TOMBSTONE k`.
MERGE of small segments 3 and 7 (5 is not small) produces a segment with
`lineage-min = 3`: the tombstone now ‘has’ lineage 3. On the next CLEAN, no segment has
lineage below 3, so the tombstone is discarded. Segment 5 still contains `PUT k`:
on restart, the index is rebuilt and **k reappears**. The safe variant of the rule
(maximum lineage) would almost never discard.

*Solution.* Three mutually supporting changes: (1) the in-memory index contains
**only live documents** (deletion removes the entry: no memory for deleted documents);
(2) reconstruction selects the **maximum CSN** per key and is independent of segment
order; (3) a tombstone is discarded when **no other segment can contain an older
record for the same key**, checked with the existence filter (Bloom) and minimum CSN
of every segment. Lineage disappears from formats and manifest.

### AP-05

**An OUTCOME could disappear before the records it resolves.** T's prepared records are
in segment 5; rotation puts OUTCOME in segment 6; the now ‘forgettable’ decision is
truncated from `multiserie.log`. The records CLEAN preserves did not include OUTCOME:
CLEAN of 6 removes it. If hint 5 needs regeneration, prepared records no longer have
an outcome: *presumed abort* → **committed data lost**.

*Solution.* **Self-contained segments**: rotation waits until no intents remain pending,
so every prepared record's outcome is in the same segment; for an `ACTIVE` closed by
recovery, outcomes reside in the manifest closure record. A `CLOSED` segment interprets
itself (INV-S7). PREPARE record (SEAL and flag suffice), ABORT decision, and ABORT
OUTCOME disappear (*presumed abort*: absence of COMMIT is abort).

### AP-06

**Acknowledged but not yet visible.** Multiseries transactions were acknowledged when
the decision became durable, before participant application: a GET after acknowledgment
might not see them. *Solution:* law 7 — acknowledge after publication on every healthy
participant; the cost is in-memory application.

### AP-07

**The snapshot registry had no protocol.** The writer decides whether to retain the
version it overwrites by looking at ‘active snapshots’; if a snapshot registers during
that decision, its needed version may not be retained. *Solution:* registration
**first** publishes a lower bound (`soglia`), **then** reads the CSN, with a full memory
barrier between them; writer retains when `soglia < CSN nuovo`. The decision is
conservative by construction: retain when in doubt.

### AP-08

**Three detailed inconsistencies.** (a) Control-log tail: see AP-03. (b) Read-time
verification compared record CSN against index, but a prepared record carries CSN zero:
rule now defined in [formats](formati-su-disco.md#verifica-in-lettura). (c) ADR-0020
assigned multiseries CSN ‘after’ the decision was durable, although CSN is a decision-record
field: it is now assigned at closure of the batch containing the decision, and stays
outside the horizon until application.

### AP-09

**The cache participated in coherence.** Relabeling entries on relocation made the
writer write a structure into which many readers insert, without a defined protocol.
*Solution:* cache is a **pure function** `location → byte`: no invalidation, relabeling,
or clearing. Readers access it with the same seqlock as the index; on contention,
fallback is a *miss*. The system is correct with cache disabled (INV-A12).

### AP-10

**Who blocks, and where.** The read path moved from compute pool to I/O pool without
saying how and held an epoch across the transfer. *Solution:* **run-to-completion
tasks**. A task never suspends midway; a read needing disk *migrates* to I/O pool
**restarting from the beginning** (no state crosses the transfer); a wait parks on a
bounded list. This property makes a deterministic Common Lisp simulator possible
without continuations.

### AP-11

**A file without a function.** The `.bloom` file contained the segment's `_id` keys,
but no read searches for a key per segment: the primary index is in memory and complete.
The specification asks for Bloom on secondary-index *values*. *Solution:* key filter
becomes a hint section and finds its purpose in tombstone disposal (AP-04); value filters
become an index-file section. One fewer file per segment.

### AP-12

**The index could not grow.** A single doubling table requires old and new together
during copy: three times the old size. A Serie with 300 million documents would need
~80 GB transient memory, and the writer would remain stopped for the entire copy
(seconds). ‘56 bytes per entry’ applied only just before doubling. The append-only
key arena also never reclaimed deleted-key space (contrary to INV-A8).

*Solution.* **Fragment directory** (extendible hashing): fixed-size fragments, each
a small Swiss table with its own keys; a full fragment splits in two.
Growth costs one fragment copy (fractions of a millisecond), transient memory is one
fragment, and deleted key/slot space is reclaimed on split. Slots shrink from six to
**four words** (version is CSN, hash is unnecessary in slot, keys are local).

### AP-13

**Per-byte work inside writer.** Version and CSN were in the header covered by the only
CRC: whole-record CRC had to be computed after their assignment, hence by the writer —
microseconds per document exactly where time is scarce. *Solution:* **two CRCs**.
Body CRC (key and document) is computed by the request worker; writer computes only
header CRC, 20 bytes, also covering body CRC.
Every operation also received a TXID from an Archivio counter, a shared write per
operation: the batch is now atomic by position (everything preceding SEAL), and TXID
exists only for multiseries transactions.

### AP-14

**More on-disk states than needed.** Control log had seven record types
(`SEG-OPEN`, `SEG-CLOSE`, `SWAP`, `SEG-OBSOLETE`, `SEG-RECLAIMABLE`, `SEG-DELETED`,
`CHECKPOINT`), although the only durable fact is *which segments belong to the Serie*.
*Solution:* one record, **EDIT** `{apre, chiude, rimuove}`; `OBSOLETE` and `RECLAIMABLE`
are in-memory states; a checkpoint is an EDIT declaring everything. Recovery no longer
truncates the `ACTIVE` tail: it closes it at valid length and opens a new one (law 2).
Deleting ‘unmentioned’ files is replaced by law 6.

### AP-15

**Two numbers for one fact.** Every version carried a per-document counter *and* CSN.
The counter restarted after definitive document deletion, exposing optimistic checking
to false success (same number, different incarnation). *Solution:* **version is CSN**.
Unique, increasing, never restarts. One fewer field in record, hint, and slot.

### AP-16

**Two collectors.** EBR also retired tables and fragments, which are heap objects:
the garbage collector keeps them alive while a reader references them and reclaims
them afterward. *Solution:* EBR controls only external resources (segment descriptors and files).

<a id="bilancio"></a>

## Balance

| Element | Before | After |
|---|---|---|
| Segment record types | 5 | 4 (PUT, TOMBSTONE, SEAL, OUTCOME) |
| Control-log record types | 7 | 1 (EDIT) |
| `multiserie.log` record types | 3 | 1 (DECISION) |
| Distinct record frames | 3 | 1 |
| Record header | 40 bytes | 24 bytes |
| Hint entry | 32 bytes | 24 bytes |
| Files per segment | `.seg` `.hint` `.bloom` `.idx` | `.seg` `.hint` `.idx` |
| Primary-index slot | 6 words + 1 byte | 4 words + 1 byte |
| Numbers identifying a version | version, CSN, TXID | CSN (TXID only for multiseries) |
| Shared Archivio writes per operation | one TXID | none (one CSN per batch) |
| Durable segment states | 5 | set membership |
| Catalog DDL states | `creating` `active` `dropping` | `active` `dropping` |
| Concurrent structures to verify | table, arena, retained versions, cache table | one fragmented table (three uses) and one associative set, same seqlock |
| Retirement mechanisms | EBR for files and structures | EBR for files; collector for structures |
| What Serie share | not enumerated | closed list with declared cost and frequency |
| Lineage, manifest timestamp, cache relabeling, PREPARE, ABORT records | present | removed |

<a id="fattibilità-in-sbcl"></a>

## Feasibility in SBCL

Every mechanism rests on an existing primitive. ‘Status’ reports what was checked
on 2026-10-03 on SBCL 2.6.9, macOS/ARM64: **presence and generated-code** verification,
not performance; performance remains for spikes.

| Mechanism | Primitive | Status |
|---|---|---|
| Atomically read/written words | `aref` on `(simple-array (unsigned-byte 64) (*))` | single load instruction per word with `(safety 2)`, bounds check present; repeat on x86-64 (SPK-01) |
| Seqlock barriers | `sb-thread:barrier` | present; emits barrier instruction on ARM64 |
| CSN counter, credits | `sb-ext:atomic-incf` on structure slots and word arrays | present |
| Atomic swaps (references, words) | `sb-ext:compare-and-swap` on `svref`, structure slots, word arrays | present |
| No-wait acquisition | `sb-thread:with-mutex (… :wait-p nil)` | present |
| Durable flush, rename, lock | `sb-posix`: `fdatasync`, `fsync`, `rename`, `fcntl`, `lockf` | present |
| Positional reads and writes | `pread`, `pwrite` through `sb-alien` | **not** in `sb-posix`: alien definition to libc ([ADR-0017](adr/0017-piattaforma-e-io.md)); SPK-05 |
| Fragments not copied by collector | specialized arrays beyond large-object threshold (256 KiB on this platform) | fragment capacity chosen accordingly; pauses to measure (SPK-02) |
| Deterministic simulation | run-to-completion tasks on injected scheduler | requires neither continuations nor threads ([ADR-0045](adr/0045-modello-di-esecuzione.md)) |
| CRC32C | table-based in typed Common Lisp | cost to measure (SPK-09) |

Two platform dependencies that spikes must measure and this analysis makes explicit:
collector pause as a function of **thread count** (each extra I/O worker is a thread
to stop at every collection), and fragment-split cost under load.

<a id="che-cosa-non-cambia"></a>

## What does not change

The specification, except version numbering (AP-15). Logical model, append-only storage,
CLEAN and MERGE with their conditions, durability levels, 2PC with nonblocking writer,
per-segment secondary indexes, dynamic scheduler, fail-stop, verification strategy.
The ten decisions refine mechanisms; none moves an architectural boundary.

<a id="limiti-che-restano"></a>

## Remaining limits

- **Secondary-index query cost.** Grows with a Serie's segment count (~4,000 per TB):
  the price of per-segment indexes, the author's decision
  ([ADR-0026](adr/0026-indici-secondari-segmentati.md)). Value-existence filters reduce
  it for equality, not ranges. Remains in [limiti.md](limiti.md) as a declared limit
  and first measurement candidate.
- **The horizon couples Serie only at snapshot creation**: a Serie with slow flush
  delays Archivio snapshots, never other Serie's reads or writes. Waiting is bounded
  and a `FAULTED` Serie immediately releases the horizon. The only point where law 1
  yields to a higher guarantee (INV-M1), declared in the closed list.
- **At-rest damage to final flush** (AP-03): declared, cannot be eliminated.
