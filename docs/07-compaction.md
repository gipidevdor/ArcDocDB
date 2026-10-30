# 07 — Compaction

> **Source:** ‘Clean’, ‘Merge’, ‘Mandatory conditions for Merge’, ‘Low-load merge policy’,
> ‘General compaction policy’, ‘Parallel compaction’, ‘Clean/Merge workflow’, ‘Readers
> during compaction’, and ‘Dynamic compaction scheduler’ of the
> [specification](specifica/specifica-originale.md).
> **Modules:** M11 Compaction Manager (with M13 Scheduler).
> **Decisions:** [ADR-0018](adr/0018-control-log-manifest-swap.md) and
> [ADR-0040](adr/0040-manifest-a-record-unico.md) (swap = one EDIT record, decided before
> rename; stabilization), [ADR-0023](adr/0023-politiche-di-compaction.md) (thresholds, load
> states), [ADR-0042](adr/0042-tombstone-e-indice-dei-vivi.md) (tombstones),
> [ADR-0015](adr/0015-primary-index-swiss-table-swmr.md) (conditional relocation),
> [ADR-0016](adr/0016-epoch-based-reclamation.md) (reclaim).

<a id="due-operazioni-due-scopi"></a>

## Two operations, two purposes

| | CLEAN | MERGE |
|---|---|---|
| Purpose | reclaim dead space, remove unnecessary versions | reduce fragmentation and segment count, improve read locality |
| Input → output | 1 segment → 1 new immutable segment | N small segments → 1 new immutable segment |
| When | when a segment has significant dead space | only if there are too many small segments **and** all conditions below hold |
| Stability constraint | none | segments stable for ≥ 50 s |
| Load constraint | modulated by the scheduler | only under low load |
| Nature | necessary | opportunistic |

Both are **copy-on-write**: they never modify source segments (INV-C3) and always produce
a new immutable segment (INV-C1, INV-C2).

<a id="politica-generale"></a>

## General policy

| Segment condition | Action |
|---|---|
| `live = 0` | direct deletion, if no snapshot/reference uses it |
| `0 < live < total` | CLEAN → new segment containing only live/required records |
| `live ≈ total` | no compaction |
| too many small segments | MERGE, **only if** candidates have ≥ 50 s of stability **and** load is low |

> **Decided (QA-11 → [ADR-0023](adr/0023-politiche-di-compaction.md))** — Numerical thresholds are not specified: how much dead space triggers
> CLEAN, what counts as ‘small’, how many small segments form a group, and the maximum
> size of a MERGE output.

## CLEAN

```
S017: 256 MB total, 20 MB live, 236 MB dead
CLEAN: S017 → S042 (20 MB, immutable)
```

The source segment:

- is not modified;
- becomes `OBSOLETE` after the swap;
- remains readable as long as needed;
- is deleted only when no reader/snapshot uses it.

‘Required records’ includes both `LIVE` and `SNAPSHOT-LIVE` versions
([03 Storage](03-storage.md#classificazione-delle-versioni)).

The output segment may be much smaller than 256 MB and **may remain small
indefinitely** (INV-C4): CLEAN does not automatically trigger MERGE, and no new writes
are appended to its output (INV-S5).

## MERGE

<a id="condizioni-obbligatorie"></a>

### Mandatory conditions

A segment is a MERGE candidate **only if** all conditions hold:

1. it is `CLOSED`;
2. it is immutable;
3. it is not `ACTIVE`;
4. it has been stable for at least **50 seconds** (INV-C5);
5. no active snapshot needs it;
6. it belongs to a group exceeding the segmentation/small-segment-count thresholds;
7. the engine is under **low load** (INV-C6).

<a id="regola-di-stabilità"></a>

### Stability rule

```
segment age >= 50 seconds
```

The reference timestamp is the segment's **closure/stabilization** time. The purpose is
to avoid compacting newly closed segments immediately. The rule applies only to MERGE,
not CLEAN.

> **Decided (QA-13 → [ADR-0018](adr/0018-control-log-manifest-swap.md))** — For a segment produced by CLEAN or MERGE, the ‘stabilization’ timestamp
> needs definition (proposal: the instant the swap completes). Behavior after restart must
> also be decided, since close time lives in metadata, which are derived data: the
> conservative option is to restart the count at the end of recovery.
> A monotonic clock is required.

> **Decided (QA-14 → [ADR-0020](adr/0020-csn-snapshot-isolamento.md))** — Condition 5 implies that a long-lived snapshot suspends MERGE for the
> segments it needs, even though MERGE is copy-on-write and sources would remain
> readable until reclaim anyway.

### Low-load policy

Before starting MERGE, the Compaction Scheduler MUST check engine load,
considering at least:

| Area | Signals |
|---|---|
| CPU | CPU utilization, number of active workers |
| Requests | P95 and P99 latency, queue depth, throughput |
| WAL | throughput, WAL/fsync latency |
| I/O | NVMe utilization, I/O queue depth |
| Compaction | compaction backlog |

If load is high:

- do not start new MERGEs;
- reduce MERGE concurrency;
- prioritize user requests and WAL.

If load increases significantly **during** MERGE:

- do not start new MERGEs;
- reduce future concurrency;
- if appropriate, pause or slow noncritical work.

MERGE MUST NOT monopolize CPU, NVMe, memory, cache, or memory bandwidth, and MUST NOT
compete with user traffic.

> **Decided (QA-12 → [ADR-0023](adr/0023-politiche-di-compaction.md))** — ‘Low load’ needs an operational definition: thresholds, observation
> windows, and hysteresis to avoid oscillation. Whether an ongoing MERGE can be suspended
> and resumed or only abandoned must be decided (partial output can be safely discarded,
> because sources are intact). Finally, behavior when load never falls must be decided:
> MERGE does not start and segment count grows (RSK-08).

## Workflow

Common to CLEAN and MERGE:

| # | Step | On-disk state / visibility |
|---|---|---|
| 1 | select the candidate segment | — |
| 2 | check its state | source `CLOSED` |
| 3 | check snapshots/references | determines required records |
| 4 | read the segment sequentially | source unchanged |
| 5 | copy only required records | new file under construction, invisible |
| 6 | create the new segment | invisible |
| 7 | `fsync` the new segment | durable data, still invisible |
| 8 | prepare metadata | — |
| 9 | **atomic index swap** | new readers use the new segment |
| 10 | mark source `OBSOLETE` | source still readable |
| 11 | wait until no reader/snapshot uses it | — |
| 12 | mark `RECLAIMABLE` | — |
| 13 | delete | `DELETED` |

For MERGE: multiple segments are read, a single new segment is produced, with the same
copy-on-write mechanism and sources immutable until reclaim.

> **Decided ([ADR-0040](adr/0040-manifest-a-record-unico.md), [ADR-0042](adr/0042-tombstone-e-indice-dei-vivi.md))** —
> Mapping to the steps: output is written as `.tmp` (5–7); step 9 is **one EDIT record**
> in the control log that closes the output and removes sources, followed by rename and
> index relocations; steps 10–13 are in-memory states of the removed segment,
> until the file is deleted. ‘Required records’ are those referenced by the index,
> those referenced by retained versions, and tombstones not yet discardable; committed
> prepared records are rewritten as ordinary records.

Crash-safety properties (details in [11 Recovery](11-recovery.md)):

- before step 9, a crash leaves no effects: the partial file is discarded and the operation
  repeated (INV-C9);
- the new segment does not become visible before its data are durable: step 7 always
  precedes step 9 (INV-C7);
- the source remains recoverable until the swap completes (INV-C8);
- an interrupted step 9 MUST be recognizable during recovery.

> **Decided (QA-04, QA-24 → [ADR-0018](adr/0018-control-log-manifest-swap.md), [ADR-0015](adr/0015-primary-index-swiss-table-swmr.md))** — The ‘atomic index swap’ is the most delicate point of the workflow. The
> Serie writer continues working during copying: a copied document may have been updated
> in the meantime, in which case the index must not be changed for that document.
> The swap mechanism and its relationship to the logical writer need definition.

<a id="reader-durante-la-compaction"></a>

## Readers during compaction

- Readers continue reading old segments while compaction produces new ones.
- Compaction MUST NOT globally block reads (INV-C10).
- After the swap: new readers use the new index/segment; already active readers finish
  on the old one.

<a id="parallelismo-e-scheduling"></a>

## Parallelism and scheduling

Compaction can run in parallel **per segment** and **per Serie**; there is no single
global compaction worker, and the scheduler distributes work dynamically.

```
Compaction Scheduler
├── Worker 1 → S017 → S101
├── Worker 2 → S018 → S102
├── Worker 3 → S019 → S103
└── Worker 4 → S020 → S104
```

The Compaction Scheduler has **independent limits** from the request scheduler and MUST be able to:

- increase CLEAN workers when the system is idle, reduce them as traffic increases;
- prevent MERGE under high load;
- prefer urgent CLEAN over MERGE;
- prevent user-request starvation.

Priorities (INV-P4):

```
user traffic  >  WAL/durability  >  required CLEAN  >  opportunistic MERGE
```

<a id="derivati-full-text"></a>

## Full-text derivatives

Under [ADR-0053](adr/0053-ricerca-full-text-indici-invertiti.md), CLEAN and
MERGE rebuild the dictionary, postings, and positions over the new segments'
rows. Ordinals depend on the segment hint: they are not copied as if they
globally identified documents. Versions needed by snapshots are retained;
publication and reclaim follow EDIT and EBR.

Derivative work falls within compaction's compute, I/O, and space budgets
and measurements of interference with GET and commit. Full-text
implementation and qualification remain in phase 8.

<a id="metriche"></a>

## Metrics

Segment count and size, live/dead ratio, bytes reclaimed, CLEAN and MERGE throughput,
compaction concurrency, backlog ([12 Observability](12-osservabilita.md)).
