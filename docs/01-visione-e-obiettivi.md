<a id="01--visione-e-obiettivi"></a>

# 01 — Vision and goals

> **Source:** introduction and ‘Final goal’ of the [specification](specifica/specifica-originale.md).

<a id="che-cosè"></a>

## What it is

ArcDocDB is a **general-purpose document database server**, written primarily in Common
Lisp with **SBCL** as the reference implementation. It is not intended for a specific
application domain (it is not a blogging or CMS engine).

<a id="applicazione-di-riferimento"></a>

## Reference application

> **Decided (author's direction, 2026-10-15; priority confirmed on 2026-10-16)** —
> ArcDocDB's first use will be as the database for an NNTP Usenet server
> written in Common Lisp. This use guides implementation and verification priorities.

The [NNTP use case](valutazione/caso-duso-nntp.md) guides evaluations of
Message-ID reads, ordered group scans, cross-group publication,
full-text search, retention, and recovery. The engine remains
general-purpose; daemon development and application benchmarks are future work.

> **Decided ([ADR-0055](adr/0055-interfaccia-locale-unix-socket.md), 2026-10-16)** —
> For the first NNTP use, the default and highest-priority interface is a local
> Unix socket between the daemon and database. Initial integration follows startup,
> recovery, and admission; TCP remains optional and comes later. Implementation and
> qualification of the interface have yet to be produced.

<a id="obiettivi"></a>

## Goals

| Goal | How the specification intends to achieve it | Document |
|---|---|---|
| High speed for fundamental operations | Short hot path: primary index in RAM, append-only storage, cache | [03](03-storage.md), [08](08-indici.md), [09](09-cache.md) |
| Strong parallelism between independent Serie | The Serie is the unit of storage and parallelism: its own WAL, segments, and indexes | [02](02-modello-logico.md), [10](10-concorrenza-e-scheduling.md) |
| Low P95/P99 latency | Dynamic scheduler, compaction subordinate to user traffic | [10](10-concorrenza-e-scheduling.md), [07](07-compaction.md) |
| Multicore and NVMe scalability | One logical writer per Serie, many readers, parallel compaction | [10](10-concorrenza-e-scheduling.md) |
| Reliable WAL | Per-Serie WAL with group commit | [04](04-wal-e-durability.md) |
| Local and multiseries transactions | OCC on the Serie writer; 2PC-like protocol with `multiserie.log` | [05](05-transazioni.md) |
| MVCC/snapshots | Logical snapshots over append-only storage | [06](06-mvcc-e-snapshot.md) |
| Full-text search (added by the author, [ADR-0053](adr/0053-ricerca-full-text-indici-invertiti.md)) | Dedicated inverted indexes for words and phrases, versioned analyzers, and snapshot-consistent filters; future implementation | [08](08-indici.md#ricerca-full-text), [13](13-benchmark.md#ricerca-full-text) |
| Concurrent compaction | Distinct copy-on-write CLEAN and MERGE operations, which can run in parallel | [07](07-compaction.md) |
| Resilience under read bursts | Per-Serie isolation, partitionable cache, opportunistic MERGE | [09](09-cache.md), [07](07-compaction.md) |

The final goal, in the specification's terms: a highly efficient hot path for common
operations, strong parallelism between Serie, crash-safe append-only storage, adaptive
copy-on-write compaction, robust local and multiseries transactions, and **predictable
behavior** under mixed workloads and sudden read bursts.

<a id="non-obiettivi"></a>

## Non-goals

Declared by the specification:

- It is **not** a specialized blogging/CMS engine.
- Superiority over Oracle, MySQL/InnoDB, or MongoDB is **not** claimed on the basis of
  heterogeneous benchmarks: the short-path advantage is an **architectural hypothesis to verify**
  (see [13 Benchmark](13-benchmark.md)).
- The [preliminary targets](13-benchmark.md#target-preliminari) are **not** demonstrated results.

> **Decided (QA-23 → [ADR-0030](adr/0030-scope-v1.md))** — The specification does not mention replication, backup, authentication/authorization,
> or encryption. Until decided otherwise, these are considered outside v1 scope.

<a id="le-scelte-che-definiscono-il-progetto"></a>

## Decisions that define the project

These decisions underpin everything else; each has an ADR.

> **Decided ([ADR-0036](adr/0036-leggi-di-progetto.md))** — **Parallelism is a foundational
> principle**: it is the way state is divided, rather than a performance target. Serie
> never wait for each other; what they share is a closed list, with no per-operation
> cost (INV-P6). This is the first of the ten [laws](analisi-progettuale.md#le-leggi) from
> which the project's mechanisms follow.

1. Common Lisp/SBCL for general logic ([ADR-0001](adr/0001-common-lisp-sbcl.md)).
2. The Serie as the unit of storage and parallelism ([ADR-0002](adr/0002-serie-unita-di-storage-e-parallelismo.md)).
3. Per-Serie WAL, no global data WAL ([ADR-0003](adr/0003-wal-per-serie.md)).
4. Append-only storage with a single ACTIVE segment ([ADR-0004](adr/0004-storage-append-only-un-solo-active.md)).
5. One logical writer per Serie with optimistic version checking ([ADR-0005](adr/0005-writer-logico-per-serie.md)).
6. 2PC-like multiseries transactions with a single `multiserie.log` ([ADR-0006](adr/0006-transazioni-multiserie-2pc.md)).
7. Distinct copy-on-write CLEAN and MERGE operations ([ADR-0007](adr/0007-clean-e-merge-distinti.md)).
8. Opportunistic MERGE: 50 s of stability + low load ([ADR-0008](adr/0008-merge-opportunistico.md)).
9. Immutable indexes for readers, with atomic swap ([ADR-0009](adr/0009-indici-immutabili-atomic-swap.md)).
10. CLOCK cache, partitionable by Serie ([ADR-0010](adr/0010-cache-clock.md)).
11. Dynamic thread pool with EWMA/AIMD/hysteresis ([ADR-0011](adr/0011-thread-pool-dinamico.md)).
12. SIMD only where benchmarks justify it ([ADR-0012](adr/0012-simd-guidato-dai-benchmark.md)).
