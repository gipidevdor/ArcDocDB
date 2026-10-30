# 11 — Recovery

> **Source:** ‘Recovery’ of the [specification](specifica/specifica-originale.md); references from
> ‘Multiseries transactions’, ‘Segment metadata’, and ‘Clean/Merge workflow’.
> **Modules:** M12 Recovery Manager.
> **Decisions:** the definitive sequence is in [architettura.md](architettura.md#recovery);
> mechanisms in [ADR-0036](adr/0036-leggi-di-progetto.md) (one atomicity point, nondestructive
> recovery), [ADR-0037](adr/0037-lotto-sigillato.md) (tail or corruption),
> [ADR-0040](adr/0040-manifest-a-record-unico.md) (manifest, reconciliation),
> [ADR-0041](adr/0041-multiserie-segmenti-autosufficienti.md) (multiseries outcomes),
> [ADR-0022](adr/0022-registri-come-serie-catalogo.md) (bootstrap).

<a id="compito"></a>

## Responsibility

The Recovery Manager MUST be able to rebuild the system after a crash. It checks:

- WAL;
- segment metadata;
- index metadata;
- atomic swap;
- segment states;
- transaction states;
- `multiserie.log`.

<a id="che-cosa-fa-dopo-un-crash"></a>

## What it does after a crash

- recovers individual Serie WALs;
- rebuilds or verifies indexes;
- identifies `ACTIVE` / `CLOSED` / `OBSOLETE` segments;
- completes or rolls back incomplete compaction operations;
- processes `multiserie.log`;
- completes prepared multiseries transactions.

<a id="requisiti-di-crash-safety"></a>

## Crash-safety requirements

- Compaction operations MUST be crash-safe.
- A new segment MUST NOT become visible as definitive before its data are durable
  (INV-C7).
- An incomplete atomic swap MUST be recognizable during recovery.
- Segment metadata are derived data: recovery verifies them and, if necessary,
  rebuilds them from WAL, data, and index (INV-S6).

<a id="sequenza"></a>

## Sequence

> **Decided ([architecture](architettura.md#recovery))** — The specification lists activities but
> not their order. The sequence below respects dependencies between activities; recovery is
> idempotent (INV-A7) and **nondestructive** (INV-A9): it neither truncates nor modifies any
> segment. For each Serie, step 5 reads `ACTIVE` batch by batch, and the only durable effect
> is renaming a compacted control log that closes the old `ACTIVE` at its valid length and
> opens a new one. Step 7 does not write to segments: COMMIT outcomes obtained from
> `multiserie.log` are recorded in that same closure record.

| # | Step | Why at this point |
|---|---|---|
| 1 | Recover the catalog in `Registri/` | without the catalog, the Serie to open are unknown |
| 2 | Read `multiserie.log` → decision table | needed to interpret PREPAREs in Serie WALs |
| 3 | For each Serie (**in parallel**): inventory segments and their states | identifies ACTIVE/CLOSED/OBSOLETE and incomplete compaction files |
| 4 | For each Serie: resolve interrupted compactions | discard output not yet visible, or complete the swap |
| 5 | For each Serie: replay the WAL | rebuilds state; PREPARED transactions are resolved using the table from step 2 |
| 6 | For each Serie: rebuild or verify indexes and segment metadata | derived data |
| 7 | Complete prepared multiseries transactions | COMMIT if the decision is durable, otherwise ABORT |
| 8 | Open to traffic | — |

Serie are physically independent, so steps 3–6 lend themselves to parallel recovery
per Serie: restart time is dominated by the slowest Serie, not the sum.

<a id="casi-di-compaction-interrotta"></a>

## Interrupted compaction cases

Referring to the [workflow](07-compaction.md#workflow) steps:

| Crash… | State found | Action |
|---|---|---|
| during copying (steps 4–6) | partial, unreferenced output file | discard output; source is intact; operation is repeatable |
| after `fsync`, before swap (7–8) | complete but invisible output | discard (or reuse) output; source intact |
| during swap (9) | partial swap | MUST be recognizable; complete or roll back |
| after swap, before OBSOLETE (10) | output visible, source still `CLOSED` | mark source `OBSOLETE` |
| during reclaim (11–13) | source `OBSOLETE`/`RECLAIMABLE`, file possibly already removed | after restart there are no previous readers or snapshots: reclaim may complete |

> **Decided (QA-04 → [ADR-0018](adr/0018-control-log-manifest-swap.md), [ADR-0040](adr/0040-manifest-a-record-unico.md))** — Recognizing an incomplete swap requires an authoritative, atomic record of
> the valid segment set for a Serie (a *manifest*, or dedicated records in the Serie WAL).
> This decision makes the whole table above deterministic: the swap is **one EDIT record**.
> Before EDIT, output is a `.tmp` and is deleted; afterward, recovery completes rename
> and source deletion. There is no ‘partial swap’. A file with a definitive name unknown
> to the manifest is not deleted: it is a reported anomaly (INV-A10).

<a id="recovery-degli-indici-full-text"></a>

## Full-text index recovery

Under [ADR-0053](adr/0053-ricerca-full-text-indici-invertiti.md), the
authoritative contract and committed documents allow full-text files
and deltas to be rebuilt. Recovery verifies identity, CRC, profile,
generation, and coverage; a missing or corrupt file does not mean
there are no documents matching the query.

Until rebuild completely covers the requested view, the query
receives an explicit index-unavailable error. Any scan fallback
preserves the contract's semantics and budgets. Restore must also
rebuild and verify these derivatives. Current single-Serie vertical
tests do not yet verify this phase-8 path.

<a id="questioni-decise-e-rischi"></a>

## Decided questions and risks

- **QA-04** ([ADR-0018](adr/0018-control-log-manifest-swap.md)) — Segment manifest and swap mechanism.
- **QA-03** ([ADR-0015](adr/0015-primary-index-swiss-table-swmr.md)) — Rebuilding the index from scratch requires rereading all segments; without
  checkpoints, restart time grows with data size (RSK-07).
- **QA-10** ([ADR-0022](adr/0022-registri-come-serie-catalogo.md)) — Registri/catalog bootstrap (RSK-15).
- **QA-08** ([ADR-0021](adr/0021-2pc-intenti-outcome.md)) — How long a decision remains in `multiserie.log`.
- Each row of the tables above corresponds to a
  [fault-injection](14-fault-injection.md) scenario.

<a id="metriche"></a>

## Metrics

Overall and per-Serie recovery time, index rebuild time, number of multiseries transactions
resolved, number of compactions repeated or completed.
