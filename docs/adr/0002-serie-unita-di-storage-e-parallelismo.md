<a id="adr-0002--la-serie-come-unità-di-storage-e-parallelismo"></a>

# ADR-0002 — Serie as the unit of storage and parallelism

- **Status:** Accepted
- **Date:** 2026-10-01
- **Relationship to the specification:** records a specification decision (“Logical
  architecture,” “Parallelism”)
- **References:** [02 Logical model](../02-modello-logico.md),
  [10 Concurrency](../10-concorrenza-e-scheduling.md), INV-W1, INV-P3

<a id="contesto"></a>

## Context

The goals are high parallelism, low tail latency, and resilience under bursts. A clear unit
is needed within which to serialize operations and across which to parallelize them.

<a id="decisione"></a>

## Decision

The Serie is the primary unit of storage and parallelism. Each Serie owns its WAL, segments,
and indexes, is physically independent, and operates in parallel with the others. The Archivio
is the level at which multiseries transactions and snapshots are coordinated.

<a id="conseguenze"></a>

## Consequences

- Workload isolation is structural: no shared files on the single-Serie operation path.
- Recovery and compaction can run in parallel across Serie.
- Write parallelism is achieved *across* Serie, not *within* a Serie
  ([ADR-0005](0005-writer-logico-per-serie.md)): a workload concentrated on a single Serie
  does not benefit from it.
- Operations spanning several Serie require a dedicated protocol
  ([ADR-0006](0006-transazioni-multiserie-2pc.md)).
- Compute resources, the cache, the device, and GC remain shared: the scheduler must manage
  them.

<a id="alternative-considerate"></a>

## Alternatives considered

- *Single storage system per Archivio with logical namespaces:* one log and one index become
  global contention points, contrary to the isolation goal.
- *Automatic hash partitioning within a Serie:* would increase write parallelism but would
  make even local transactions span multiple partitions. Not planned.

<a id="valutazione"></a>

## Evaluation

- Risks: RSK-04 (per-Serie ceiling), RSK-01 (GC crosses isolation boundaries).
- Verification: SPK-04; burst benchmark on one Serie measuring latency on the others
  (INV-P3).
- Point to watch: many independent WALs perform concurrent flushes on the same
  device (SPK-03).
