<a id="10--concorrenza-e-scheduling"></a>

# 10 — Concurrency and scheduling

> **Source:** ‘Concurrency’, ‘Dynamic thread pool’, ‘Dynamic compaction scheduler’, and
> ‘Parallelism’ of the [specification](specifica/specifica-originale.md).
> **Modules:** M13 Scheduler, M14 Dynamic Thread Pool.
> **Decisions:** [ADR-0017](adr/0017-piattaforma-e-io.md) (compute and I/O pools),
> [ADR-0045](adr/0045-modello-di-esecuzione.md) (run-to-completion tasks, waits as
> parking, read migration),
> [ADR-0019](adr/0019-durability-e-group-commit-pipelined.md) (writer never blocked),
> [ADR-0016](adr/0016-epoch-based-reclamation.md) (epochs), [ADR-0023](adr/0023-politiche-di-compaction.md)
> (load state).

<a id="modello"></a>

## Model

```
1 logical writer per Serie  +  many concurrent readers
```

Do NOT use:

- one permanent thread per Serie;
- one thread per request;
- a global writer lock.

Independent Serie MUST be able to write in parallel:

```
client → queue Serie A → Writer A → WAL A
client → queue Serie B → Writer B → WAL B
```

The writer serializes **only what must be serialized** within a single Serie.

> **Decided ([architecture](architettura.md#thread-pool))** — A ‘logical writer’ without a dedicated thread is implemented as a **serial executor**:
> each Serie has a write queue; when it is nonempty, a pool worker takes ownership
> and drains it in batches, and no other worker can do so concurrently. Mutual exclusion
> applies to the queue, not a thread. The batch naturally coincides with the group-commit
> group ([04](04-wal-e-durability.md)).

> **Decided ([ADR-0019](adr/0019-durability-e-group-commit-pipelined.md), [architecture](architettura.md#percorso-di-scrittura))** — ‘Only what must be serialized’ suggests keeping all parallelizable work outside
> the writer: parsing, schema validation, and record encoding happen in the worker receiving
> the request; version checking, order assignment, WAL/segment append, and index updates
> remain in the writer. This determines the throughput ceiling per Serie
> (RSK-04, QA-26).

> **Decided ([ADR-0036](adr/0036-leggi-di-progetto.md))** — Parallelism is a **foundational
> principle**, not a performance target: there are no locks or shared writes between Serie
> per operation, and what is shared is the closed list in
> [architecture](architettura.md#archivio-coordinamento-minimo) (INV-P6). Each mechanism
> declares what it serializes.

<a id="isolamento-tra-serie"></a>

## Isolation between Serie

The Serie is the main unit of load isolation (INV-P3). A read burst on
Serie A must not prevent:

- writes on Serie B;
- queries on Serie C;
- controlled compaction on Serie D.

Resources actually shared, and therefore needing control, are: pool workers, the cache
(partitionable, [09](09-cache.md)), the NVMe device, memory, and — in SBCL — the garbage
collector, which stops all threads (RSK-01).

<a id="thread-pool-dinamico"></a>

## Dynamic thread pool

- A dynamic pool of **reused** worker threads: threads are not continuously created
  and destroyed.
- The scheduler adjusts worker count based on:

| Area | Signals |
|---|---|
| Queues | queue depth |
| CPU | utilization |
| Requests | throughput, P50, P95, P99 |
| Serie | number of active Serie, load distribution between Serie |
| I/O | I/O utilization, WAL throughput |
| Compaction | backlog |

Control strategy: **EWMA** (smooth signals), **AIMD** (additive increase, multiplicative
decrease), **hysteresis** (avoid oscillation).

Illustrative rules:

| Observation | Action |
|---|---|
| growing queue + spare CPU | increase workers |
| growing queue + saturated CPU | do not increase blindly |
| P99 worsens significantly | stop expansion or reduce workers |
| empty queue + low CPU | reduce workers |

The same scheduler coordinates query, writer, WAL, and compaction load.

## Compaction Scheduler

It has **independent** limits from the request scheduler ([07](07-compaction.md#parallelismo-e-scheduling)).
Priority order (INV-P4):

```
user traffic  >  WAL/durability  >  required CLEAN  >  opportunistic MERGE
```

<a id="questioni-decise-e-rischi"></a>

## Decided questions and risks

- **QA-12** ([ADR-0023](adr/0023-politiche-di-compaction.md)) — Operational definition of low/high load, shared by the scheduler and MERGE
  low-load policy.
- **QA-16** ([ADR-0016](adr/0016-epoch-based-reclamation.md)) — Active-reader tracking (required for reclaim) with negligible cost on the
  read path.
- **QA-26** ([ADR-0028](adr/0028-target-e-obiettivi-di-latenza.md)) — Are throughput targets per Serie or aggregate?
- **RSK-04** — Single-writer ceiling; **RSK-12** — controller stability (many signals,
  oscillation risk); **RSK-01** — GC pauses as a source of global contention.
- Blocking calls (`write`, `fsync`, NVMe reads) occupy a worker for their duration:
  they are all **I/O-pool** tasks; a compute worker never blocks
  (INV-P5, [ADR-0045](adr/0045-modello-di-esecuzione.md)). The I/O-pool ceiling limits
  device concurrency and, because the collector stops every thread, also the GC pause
  (SPK-02).

<a id="metriche"></a>

## Metrics

Worker count, queue depth, CPU and I/O utilization, compaction concurrency
([12 Observability](12-osservabilita.md)).
