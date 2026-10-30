<a id="questioni-aperte"></a>

# Open questions

Points the [specification](specifica/specifica-originale.md) does not decide. Closing them is
[Phase 0](roadmap.md)'s main work. Each question closes with an ADR; its entry remains here,
marked ‘Resolved by ADR-nnnn’.

**Status on 2026-10-03: every question is closed by an ADR** (see *Status* column).
The [design analysis](analisi-progettuale.md) later revised some answers with ADR
0036–0045: the *Status* column names the original decision and its revision.
ADR-0028 and ADR-0030 were confirmed by the author on 2026-10-08. Experimental
evaluation corrected the horizon registry with ADR-0046. Detailed sections below
retain evaluated options; reasons for the choice are in the ADR.

**Priority**

- **A** — architectural: decide in Phase 0, since it affects on-disk formats or multiple modules.
- **B** — decide before implementing the affected module.
- **C** — deferrable.

<a id="quadro"></a>

## Overview

| ID | Question | Priority | Status | Spike | Risks |
|---|---|---|---|---|---|
| [QA-01](#qa-01) | Document and record format | A | Resolved by [ADR-0014](adr/0014-formato-record-documento-id.md); record revised by [ADR-0039](adr/0039-cornice-unica-dei-record.md) | — | — |
| [QA-02](#qa-02) | WAL ↔ segment relationship | A | Resolved by [ADR-0013](adr/0013-log-structured-segmento-active-come-log.md) (amends the specification) | SPK-03 | RSK-03 |
| [QA-03](#qa-03) | Primary-index persistence | A | Resolved by [ADR-0015](adr/0015-primary-index-swiss-table-swmr.md); hint revised by [ADR-0039](adr/0039-cornice-unica-dei-record.md) | SPK-01 | RSK-07 |
| [QA-04](#qa-04) | Segment manifest and atomic swap | A | Resolved by [ADR-0018](adr/0018-control-log-manifest-swap.md); revised by [ADR-0040](adr/0040-manifest-a-record-unico.md) | SPK-07 | RSK-02 |
| [QA-05](#qa-05) | Durability levels | A | Resolved by [ADR-0019](adr/0019-durability-e-group-commit-pipelined.md); mechanics revised by [ADR-0037](adr/0037-lotto-sigillato.md) | SPK-03 | — |
| [QA-06](#qa-06) | TXID, Archivio commit order, multiseries snapshots | A | Resolved by [ADR-0020](adr/0020-csn-snapshot-isolamento.md); revised by [ADR-0038](adr/0038-orizzonte-di-visibilita.md) | SPK-07 | RSK-05 |
| [QA-07](#qa-07) | PREPARED state: visibility and blocking | A | Resolved by [ADR-0021](adr/0021-2pc-intenti-outcome.md); revised by [ADR-0041](adr/0041-multiserie-segmenti-autosufficienti.md) | SPK-07 | RSK-05 |
| [QA-08](#qa-08) | Truncation of `multiserie.log` | B | Resolved by [ADR-0021](adr/0021-2pc-intenti-outcome.md) | — | RSK-06 |
| [QA-09](#qa-09) | Isolation levels | A | Resolved by [ADR-0020](adr/0020-csn-snapshot-isolamento.md) | SPK-07 | — |
| [QA-10](#qa-10) | Physical nature of Registri and catalog | B | Resolved by [ADR-0022](adr/0022-registri-come-serie-catalogo.md); DDL revised by [ADR-0040](adr/0040-manifest-a-record-unico.md) | — | RSK-15 |
| [QA-11](#qa-11) | CLEAN and MERGE thresholds | C | Resolved by [ADR-0023](adr/0023-politiche-di-compaction.md) | SPK-06 | — |
| [QA-12](#qa-12) | Low-load definition; MERGE preemption and starvation | B | Resolved by [ADR-0023](adr/0023-politiche-di-compaction.md) | SPK-06 | RSK-08, RSK-12 |
| [QA-13](#qa-13) | Stabilization timestamp | B | Resolved by [ADR-0018](adr/0018-control-log-manifest-swap.md) | — | — |
| [QA-14](#qa-14) | Long-lived snapshots | B | Resolved by [ADR-0020](adr/0020-csn-snapshot-isolamento.md) | — | RSK-09 |
| [QA-15](#qa-15) | Tombstone lifetime | B | Resolved by [ADR-0042](adr/0042-tombstone-e-indice-dei-vivi.md) (supersedes the rule in ADR-0023) | — | — |
| [QA-16](#qa-16) | Reader tracking for reclaim | B | Resolved by [ADR-0016](adr/0016-epoch-based-reclamation.md) | SPK-01 | — |
| [QA-17](#qa-17) | Cache granularity and key | B | Resolved by [ADR-0025](adr/0025-cache-per-location.md); revised by [ADR-0044](adr/0044-cache-acceleratore-puro.md) | SPK-05 | RSK-10 |
| [QA-18](#qa-18) | SBCL GC and off-heap memory | A | Resolved by [ADR-0024](adr/0024-memoria-e-gc.md) (hypothesis verified by SPK-02) | SPK-02 | RSK-01 |
| [QA-19](#qa-19) | Reference platform and I/O primitives | A | Resolved by [ADR-0017](adr/0017-piattaforma-e-io.md); clarified by [ADR-0045](adr/0045-modello-di-esecuzione.md) | SPK-03, SPK-05 | RSK-11 |
| [QA-20](#qa-20) | Network protocol and query language | C | Resolved by [ADR-0029](adr/0029-interfacce-protocollo-query-contratto.md); primary transport updated by [ADR-0055](adr/0055-interfaccia-locale-unix-socket.md) | — | — |
| [QA-21](#qa-21) | Serie schema/contract | C | Resolved by [ADR-0029](adr/0029-interfacce-protocollo-query-contratto.md) | — | — |
| [QA-22](#qa-22) | Dependencies and test framework | B | Resolved by [ADR-0027](adr/0027-dipendenze-e-test.md) | — | — |
| [QA-23](#qa-23) | Features outside v1 scope | C | Resolved by [ADR-0030](adr/0030-scope-v1.md), confirmed on 2026-10-08; full text added by [ADR-0053](adr/0053-ricerca-full-text-indici-invertiti.md) | — | RSK-14 |
| [QA-24](#qa-24) | Primary index: MVCC, concurrency, relocation | A | Resolved by [ADR-0015](adr/0015-primary-index-swiss-table-swmr.md); structure revised by [ADR-0043](adr/0043-primary-index-a-frammenti.md) | SPK-01, SPK-07 | RSK-02 |
| [QA-25](#qa-25) | Secondary indexes: synchronization, snapshots, persistence | B | Resolved by [ADR-0026](adr/0026-indici-secondari-segmentati.md), extended for full text by [ADR-0053](adr/0053-ricerca-full-text-indici-invertiti.md) | — | RSK-13 |
| [QA-26](#qa-26) | Targets: per Serie or aggregate; numerical latency objectives | A | Resolved by [ADR-0028](adr/0028-target-e-obiettivi-di-latenza.md), confirmed on 2026-10-08 | — | RSK-04 |

---

<a id="dati-e-formati"></a>

## Data and formats

### QA-01

**Document and record format.** The specification defines neither document format,
`_id` type, nor record encoding in segments and WAL.

- *To decide:* document representation (JSON-like text, custom binary, opaque bytes
  + schema); fixed- or arbitrary-length `_id`; record header (length,
  checksum, version, TXID, tombstone flag).
- *Direction:* binary record with leading length and checksum, sequentially readable
  without an index (needed for scans, CLEAN, and recovery). Fixed-length `_id` greatly
  simplifies a compact primary index (QA-24).
- *Affects:* M02, M03, M05, M12, M15.

### QA-02

**WAL ↔ segment relationship.** The specification requires both WAL and segments per Serie,
but does not say how a record passes from one to the others or when WAL may be truncated.

| Option | Description | Pros | Cons |
|---|---|---|---|
| a | Full record in WAL, then ACTIVE segment; WAL truncated at checkpoint | simple recovery | every byte written twice |
| b | Like (a), but segment populated later from WAL, outside commit path | minimum commit latency | same amplification; recent reads from WAL |
| c | Data written once to ACTIVE segment; WAL contains only small records (reference, checksum, transaction markers) | one data write | two files to synchronize per commit |
| d | WAL and ACTIVE segment coincide | minimum amplification | contradicts prescribed separation: requires an ADR amending specification |

- *Criteria:* write amplification relative to NVMe bandwidth
  ([estimates](valutazione/stime-ordine-di-grandezza.md#banda-di-scrittura)), flushes per
  commit, recovery complexity.

### QA-03

**Primary-index persistence.** The index is in RAM; whether and how it is persisted is unspecified.

| Option | Restart | Notes |
|---|---|---|
| a. RAM only, rebuild by reading segments | proportional to total data | simplest |
| b. *Hint* file per closed segment (compact `_id`/offset/version list) | proportional to document count | fits immutable segments: hint written once |
| c. Periodic checkpoint of whole table + WAL replay | proportional to writes since checkpoint | expensive checkpoint on large tables |

- *Direction:* (b), possibly (c) later. In all cases, the index remains derived data,
  rebuildable from segments.

### QA-04

**Segment manifest and atomic-swap mechanism.** An authoritative, atomic record of the
segments composing a Serie is needed to recognize an incomplete swap during recovery.

| Option | Description |
|---|---|
| a | Per-Serie manifest file, atomically rewritten in full (temporary file, flush, rename) |
| b | Append-only manifest log (sequence of ‘add S042, remove S017’) |
| c | Swap records in Serie WAL, emitted by logical writer |

- *Direction:* (c) puts the swap in the same total order as Serie writes and introduces
  no second durability mechanism; evaluate with QA-24.

---

<a id="durability-e-transazioni"></a>

## Durability and transactions

### QA-05

**Durability levels.** Names, semantics, defaults, and granularity need definition.

- *Direction:* three levels — `async` (acknowledge before flush), `group` (acknowledge
  after shared flush; default), `strong` (dedicated flush). Per-Serie default, with a
  stronger level requestable per operation.
- *To decide:* what ‘committed’ means for INV-D1 with `async`; which level applies to a
  multiseries transaction whose participants have different configurations.

### QA-06

**TXID, Archivio commit order, multiseries snapshots.** An Archivio-wide consistent snapshot
requires a common reference between otherwise independent Serie.

| Option | Description | Note |
|---|---|---|
| a | Archivio commit sequence number (atomic counter), recorded by each Serie; snapshot = one number | shared point between Serie, but an in-memory increment, not I/O |
| b | Snapshot = vector of each Serie's current positions | no shared counter; needs barrier against partially applied multiseries transactions |
| c | Archivio sequence only for multiseries, local order for single-Serie | minimizes sharing; more complex snapshot |

- *Common requirement:* a multiseries transaction must appear to a snapshot **all or
  nothing**, even if participants apply it at different times.

### QA-07

**PREPARED state.** Between PREPARE and decision, a document has a pending change.

- *To decide:* does GET see the previous version? Does a concurrent write to the same
  document immediately abort or wait? How does a snapshot created in that interval behave?
- *Constraint:* the Serie writer cannot stop to await the decision (INV-P3); pending
  changes must be kept separately until the decision arrives.

### QA-08

**Truncating `multiserie.log`.** The file is single and persistent, so it grows.

- *Direction:* a decision can be forgotten when every participant has made the outcome
  durable in its WAL. Define how to compact a file that must remain single
  (atomic rewrite at checkpoint).

### QA-09

**Isolation levels.** The specification defines write-write conflicts on the same
document, not the isolation level.

- *Direction:* simple GET = read committed; transactions = snapshot isolation; possible
  serializability option also validating versions of read documents.

### QA-10

**Physical nature of Registri.** ‘Special Serie’ but with its own layout (`catalog/`,
`multiserie.log`).

| Option | Pros | Cons |
|---|---|---|
| a. Registri is an ordinary Serie (WAL, segments, index) with configuration built into code; catalog entries are documents | transactional, crash-safe catalog without new mechanisms | circular dependency to resolve at bootstrap |
| b. Dedicated-format catalog with atomic rewrite | trivial bootstrap | second durability mechanism to verify |

- *Also to decide:* whether creating a Serie and writing to it may be one transaction.

---

## Compaction

### QA-11

**Thresholds.** Per-Serie parameters to introduce: dead-space fraction triggering CLEAN;
size below which a segment is ‘small’; minimum small-segment count for MERGE;
maximum MERGE output size. Values are determined by measurements.

> **Proposed** — The [first SPK-06 campaign](valutazione/risultati-SPK-06-2026-10-08.md)
> verifies admission conditions and policy in the finite model. Local copies do not
> calibrate engine CLEAN/MERGE thresholds: ADR-0023 defaults remain to be evaluated
> with real compaction.

### QA-12

**Low load, preemption, starvation.**

- *Direction:* discrete load state (low / normal / high) computed by the scheduler
  from smoothed signals, with hysteresis; MERGE allowed only after a minimum stay in
  low state. For ongoing MERGE: first slow, then suspend, finally abandon (partial
  output can be discarded without consequences).
- *To decide:* if load never drops, MERGE never starts. Is that accepted (with metric
  and alarm), or is an emergency threshold needed? The second option amends the specification.

> **Decided (QA-12 → ADR-0023)** — Starvation is accepted with metric and alarm,
> without an emergency threshold. Thresholds and dwell times are defined by ADR-0023.

> **Proposed** — [SPK-06](valutazione/risultati-SPK-06-2026-10-08.md) verifies
> continuous thresholds and timers on finite traces. The model and concurrent copies
> are independent tests; real feedback and P99 compliance during engine CLEAN/MERGE
> remain to be verified.

### QA-13

**Stabilization timestamp.** For writer segments, close time. For compaction-produced
segments: direction = swap completion. After restart, if metadata were rebuilt:
direction = restart the 50 s count at end of recovery. A monotonic clock is needed.

### QA-14

**Long-lived snapshots.** They retain versions (space) and suspend MERGE of affected
segments. Options: metric and alarm only; maximum duration with forced snapshot
termination; configurable per-Serie limit.

### QA-15

**Tombstone lifetime.** A tombstone may be discarded only if no previous version of the
same `_id` remains in an on-disk segment and no snapshot needs it: otherwise rebuilding
the index from segments would ‘resurrect’ the document. Depends on QA-03.

---

## Runtime

### QA-16

**Reader tracking.** Reclaim requires knowing when no reader uses a segment anymore,
without burdening reads. Options: per-worker epoch (reader publishes the epoch it entered);
per-segment reference counter (simple, but a shared write on every read).

### QA-17

**Cache.** Granularity (document or block), key (direction: location, see
[09](09-cache.md)), budget allocation between Serie, relationship to operating-system
page cache, measurable scan-pollution definition.

> **Proposed** — The [SPK-05 campaign](valutazione/risultati-SPK-05-2026-10-08.md)
> exercises pread and mapping on small files, without an application cache or compaction.
> It determines neither cache budget nor granularity and changes neither ADR-0025 nor ADR-0044.

### QA-18

**SBCL GC and memory.** Which structures live in the managed heap and which outside.

- *To evaluate:* GC cost of very large specialized arrays; off-heap memory for index
  and cache; per-request hot-path allocation (goal: zero); collector parameters and
  variants available in SBCL.
- *Constraint:* Common Lisp only (INV-X3) — external-memory access must use SBCL facilities.

### QA-19

**Reference platform and I/O.** The specification names hardware, not operating system
or architecture. Development takes place on macOS/ARM64.

- *To decide:* benchmark reference platform; per-platform flush primitives (on macOS,
  `fsync` does not guarantee media persistence: `F_FULLFSYNC` is required); blocking I/O
  on workers versus asynchronous I/O; positional segment reads or memory mapping.

> **Proposed** — Primitives are exercised in the local macOS/ARM64
> [SPK-05 campaign](valutazione/risultati-SPK-05-2026-10-08.md).
> Mapping remains a comparison; ADR-0017 prescribes pread. Linux x86-64,
> cold cache, and beyond-RAM datasets remain to be measured.

---

<a id="interfacce"></a>

## Interfaces

### QA-20

**Network protocol and query language.** Unspecified. Deferrable until the engine
exists; however, the Query Engine's internal interface should be designed to be
independent of the protocol.

### QA-21

**Serie schema/contract.** Definition language, validation, schema evolution over
already written append-only data.

---

<a id="progetto"></a>

## Project

### QA-22

**Dependencies and tests.** Under ‘Common Lisp only’: are third-party Common Lisp
libraries allowed, or only SBCL and its contrib modules? Which test framework?
Fewer dependencies mean more hot-path control and more code to write.

> **Proposed** — The [SPK-08 bitmap extension](valutazione/risultati-SPK-08-bitmap-2026-10-08.md)
> uses only Common Lisp and SBCL, with independent oracles and recorded tests.
> NEON contrib availability is observed separately; this changes neither ADR-0017's
> dependency policy nor x86-64 platform qualification.

### QA-23

**Outside v1 scope.** Replication, high availability, backup/restore, authentication
and authorization, and encryption are not mentioned in the specification. They must
be explicitly excluded or added; some (backup, replication) benefit from immutable
segments and should not be precluded by formats.

**Updated outcome:** ADR-0030 includes backup/restore and offline verification;
ADR-0053 explicitly adds full text to v1, in phase 8.
The preceding question retains the original evaluation text.

### QA-24

**Primary index: MVCC, concurrency, relocation.** The most densely constrained
architectural question: three requirements apply to the same structure.

1. *Continuous writes.* The writer updates the index on every commit; a complete
   new version on every change (INV-I1 read literally) is impractical.
2. *Snapshots.* A snapshot must find locations of versions no longer current.
3. *Compaction.* The swap relocates many entries in bulk while the writer keeps working.

| Option | Description | Pros | Cons |
|---|---|---|---|
| a | Compact mutable table (one writer, readers without locks) + side table of **retained versions**, populated only when writer overwrites a document while snapshots are active | zero cost without snapshots; remains compact | concurrent read protocol to verify |
| b | Persistent index with structural sharing (every commit produces a new root) | O(1) snapshots; literal INV-I1 | many pointer-containing objects: contrary to compactness and heavy for GC |
| c | On-disk version chain (every record points to predecessor) | no extra memory | old-version reads need more I/O; relocation invalidates pointers |

- *Relocation observation:* compaction's copy has identical contents to the original,
  and the original remains readable while `OBSOLETE`. A reader is therefore correct
  with either old or new location: the atomic, durable change must be the segment set
  (QA-04), while entry updates may be a series of conditional replacements (‘if still
  pointing to old location’) executed by the logical writer.
- *Direction:* (a), interpreting INV-I1 as ‘a reader never observes an intermediate
  state’, to confirm with an ADR.

### QA-25

**Secondary indexes.** Synchronous update with commit or deferred? What does a snapshot
see through a secondary index? Persistence or rebuild on restart? Cost on the Serie's
logical writer.

**Full-text extension:** ADR-0053 fixes dedicated inverted indexes,
commit/snapshot-consistent publication, and complete generations.
Binary format, code, and qualification remain to be produced; details
are not demonstrated by campaigns for already implemented indexes.

### QA-26

**Targets.** Only GET targets are declared ‘aggregate’. Clarify whether each target
is per Serie or summed, and fix **numerical** P95/P99 latency objectives: the specification
asks for ‘low latency’ without a value, and without one neither GC nor the low-load
policy can be evaluated.
