<a id="adr-0036--leggi-di-progetto-il-parallelismo-è-fondante-un-punto-di-atomicità-per-operazione-prepara-decidi-completa-nulla-si-distrugge-per-assenza"></a>

# ADR-0036 — Design laws: parallelism is foundational; one atomicity point per operation; prepare, decide, complete; nothing is destroyed because it is absent

- **Status:** Accepted (parallelism as a foundational principle is the author's decision,
  2026-10-03)
- **Date:** 2026-10-03
- **Relationship to the specification:** no amendment; makes normative, in general form, rules
  that the specification states as a goal (“high parallelism across independent Serie,”
  “Parallelism”) or applies case by case (“Clean/Merge workflow,” “Recovery,” “Catalog”)
- **References:** [design analysis](../analisi-progettuale.md#le-leggi),
  [architecture](../architettura.md#leggi), INV-P6, INV-A9, INV-A10, INV-A11

<a id="contesto"></a>

## Context

ADRs 0013–0035 define a mechanism for each problem. The [design analysis](../analisi-progettuale.md)
showed that every defect found arose where a mechanism had its *own* rule
instead of applying a general one: compaction decided with a record, the catalog with a
state machine, recovery with truncation, cleanup with “what is not mentioned.”
A critical system is easier to verify when special cases follow from a few laws.

Parallelism, which the specification places among the project's goals, existed as a set
of invariants (INV-P1…P4, INV-W1), but not as a **criterion**: no rule said that a
new mechanism must be judged by what it serializes. An Archivio counter touched on
every operation (AP-13) could enter the design without anything flagging it.

<a id="decisione"></a>

## Decision

The ten laws in the [analysis](../analisi-progettuale.md#le-leggi) are **normative**: a
mechanism that does not follow from one of them requires an ADR justifying it. Four were
not previously invariants and now become invariants.

<a id="1-il-parallelismo-è-fondante-inv-p6"></a>

### 1. Parallelism is foundational (INV-P6)

Parallelism is not an optimization added later: it is **the way state is
partitioned**. It is the first law because it determines structure before any other choice.

- **Units.** Every piece of work belongs to a unit of parallelism and proceeds without waiting
  for other units at the same level: Archivi; Serie within an Archivio; readers within a Serie,
  relative to one another and to the writer; batches in different logs; segments, for compaction,
  recovery, and queries; index fragments. The hierarchy is in
  [architecture](../architettura.md#parallelismo).
- **Closed list of shared elements.** Across Serie there is no lock and no
  shared write on the path of an individual operation. The shared elements are
  only those listed in [architecture](../architettura.md#archivio-coordinamento-minimo),
  each with a **bounded** cost paid at most once **per batch, per multiseries
  transaction, or per snapshot** — never per operation. Adding an entry to the list requires an
  ADR.
- **Design criterion.** Every mechanism declares what it serializes and at what level.
  With equivalent guarantees, the solution that serializes less and lower in the hierarchy wins.
- **Relationship to priorities.** The law does not change the hierarchy in
  [ADR-0031](0031-software-critico-criteri-e-priorita.md): integrity remains above everything. But
  parallelism and correctness do not compete here because they have the same origin:
  the unit of parallelism coincides with the unit of state ownership (a single writer per
  Serie). Where a higher guarantee requires a shared point — the visibility horizon
  for INV-M1 — that point must be declared, bounded, placed where it costs least, and approved
  through an ADR ([ADR-0038](0038-orizzonte-di-visibilita.md) is the example: the wait occurs
  at snapshot creation, not at write acknowledgment).

<a id="2-un-punto-di-atomicità-per-operazione-inv-a11"></a>

### 2. One atomicity point per operation (INV-A11)

Every operation that changes durable state is decided by **a single durable record** in the
source of truth at its level:

| Level | Source of truth | Record |
|---|---|---|
| Serie data | `ACTIVE` segment | batch SEAL ([ADR-0037](0037-lotto-sigillato.md)) |
| Serie structure | `wal/control.log` | EDIT ([ADR-0040](0040-manifest-a-record-unico.md)) |
| multiseries transaction | `Registri/multiserie.log` | DECISION ([ADR-0041](0041-multiserie-segmenti-autosufficienti.md)) |
| Serie in the Archivio | catalog (Registri Serie) | Serie document |

Everything before the record is **preparation**: it has no visible effects and can be discarded.
Everything after it is **completion**: it is determined by the record, is idempotent, and
recovery repeats it. There is no operation with two atomicity points.

<a id="3-prepara-decidi-completa"></a>

### 3. Prepare, decide, complete

- Anything prepared on disk is created with a **`.tmp`** suffix (file or directory), is made
  durable, and remains `.tmp` until the decision.
- The **decision** is the record in section 2.
- **Completion** brings the file system (rename from `.tmp`, deletion of removed objects) and
  in-memory structures into agreement.

On restart: a `.tmp` not named by the source of truth is deleted; a `.tmp` named by the source
of truth is renamed; an object removed from the source of truth but still present is
deleted.

<a id="4-nulla-si-distrugge-per-assenza-inv-a10"></a>

### 4. Nothing is destroyed because it is absent (INV-A10)

A file or directory is deleted **only** if:

- it has a `.tmp` suffix and the source of truth does not name it (it was never decided), or
- the source of truth **records its removal** (an EDIT's removed list, state
  `dropping` in the catalog).

An object with a final name that the source of truth does not know is an **anomaly**: it is
left untouched, the event is recorded, and the offline verifier reports it. An object named by
the source of truth but missing is a failure (FM-16): quarantine or `FAULTED`.

<a id="5-il-recovery-non-distrugge-inv-a9"></a>

### 5. Recovery does not destroy (INV-A9)

Recovery neither modifies nor truncates any existing data file. Its only durable effects
are records in the sources of truth (section 2) and completions (section 3). An
`ACTIVE` found on restart is closed with its valid length and replaced by a new one
([ADR-0037](0037-lotto-sigillato.md)).

Pattern: partitioned state with one writer per partition and no sharing on the operation
path (*shared-nothing* architectures; Seastar/ScyllaDB; Kafka partitions); a single commit
point and idempotent redo (ARIES, for the principle); MANIFEST as the sole source of the
file set (LevelDB/RocksDB); a new active file on every open (Bitcask).

<a id="conseguenze"></a>

## Consequences

- Every future ADR fills in “what it serializes” as well as the atomicity point.
- Scaling with the number of Serie and cores becomes a verifiable property: the list
  of shared elements is closed and every entry has a measurable cost.
- Recovery has no logic of its own: for every source of truth, it discards what precedes the
  last valid record and completes what follows it; it proceeds in parallel by Serie and segment.
  Idempotence (INV-A7) is a consequence, not a property to demonstrate case by case.
- A defect in computing the segment set or catalog can no longer destroy
  data: at worst it leaves an unknown object, which is reported.
- Every new durable operation is designed by filling in a row of the
  [atomicity points table](../analisi-progettuale.md#punti-di-atomicità).

<a id="limite-dichiarato"></a>

## Declared limit

Three things remain shared by the entire process and cannot be eliminated by the design: the
**device**, the **workers**, and SBCL's **garbage collector**, which stops every thread on each
collection (RSK-01). The design manages them — I/O priorities, sized pools, no
allocation on hot paths — but does not make them parallel.

<a id="alternative-considerate"></a>

## Alternatives considered

- *Parallelism as a performance goal achieved through optimizations:* at the bottom of the
  priority hierarchy, it would be sacrificed for every convenient choice; a serial point
  introduced into the structure cannot later be removed through a measurement.
- *Per-mechanism rules, as before:* each rule must be verified on its own; defects AP-03,
  AP-05, and AP-14 arose this way.
- *Deleting “unmentioned” orphans:* simpler, but turns a manifest defect into
  data loss.

<a id="valutazione"></a>

## Evaluation

- Risks: reduces RSK-18 and RSK-20 (an error is detected rather than propagated); RSK-04 and RSK-12
  (shared elements are enumerated).
- Verification: review of the closed list at every ADR; scaling benchmarks with the number of
  Serie and cores and isolation benchmarks (burst on one Serie, [13](../13-benchmark.md));
  SPK-04; recovery model in SPK-07 with a crash before and after every atomicity point;
  verifier tests on unknown and missing objects.
