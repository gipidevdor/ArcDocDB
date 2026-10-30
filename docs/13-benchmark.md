<a id="13--benchmark"></a>

# 13 — Benchmarks

> **Source:** ‘Benchmarks’, ‘Preliminary targets’, and ‘Comparison with Oracle, MySQL, and MongoDB’ of the
> [specification](specifica/specifica-originale.md).

<a id="principio"></a>

## Principle

Performance is **measured**, not declared. The numbers in this document are architectural
targets, not results (INV-X2).

<a id="hardware-di-riferimento"></a>

## Reference hardware

| Resource | Value |
|---|---|
| CPU | 16–32 cores |
| RAM | 64–128 GB |
| Storage | NVMe PCIe 4/5 |
| Dataset | large enough not to fit entirely in cache when measuring storage |
| Documents | approximately 1–4 KB |

Hardware MUST be identical in comparisons with other systems.

<a id="workload"></a>

## Workloads

| Category | Workload |
|---|---|
| Point reads | GET `_id`; GET `_id` with cache hit; GET `_id` with NVMe access |
| Writes | INSERT; UPDATE; DELETE/tombstone |
| Queries | indexed query; sequential scan |
| Full-text search | terms, Boolean combinations, phrases, and structured filters; dedicated inverted indexes ([ADR-0053](adr/0053-ricerca-full-text-indici-invertiti.md)) |
| Maintenance | CLEAN; MERGE |
| Mixed | mixed read/write; read-only bursts; write bursts |
| Transactions | single-Serie; multiseries |

> **Decided ([ADR-0036](adr/0036-leggi-di-progetto.md))** — Because parallelism is a
> foundational principle (INV-P6), two workloads are added to verify it:
> **scalability** (the same load distributed over 1, 2, 4, … Serie and an increasing
> number of cores: aggregate throughput should grow while cores and device bandwidth
> remain available) and **isolation** (a burst on one Serie, with latency and throughput
> measured on the others). The result is a measurement, not a target declared in advance (INV-X2).

<a id="che-cosa-misurare-sempre"></a>

## What to measure every time

Throughput; P50, P95, P99; CPU; RAM; cache hit rate; WAL bandwidth; fsync latency; NVMe
bandwidth; queue depth; compaction throughput; worker count; contention; SBCL GC.

<a id="interfaccia-locale-unix-socket"></a>

## Local Unix socket interface

> **Decided ([ADR-0055](adr/0055-interfaccia-locale-unix-socket.md))** — The reference
> client/server path for the first NNTP use uses a local Unix socket.
> Implementation and measurements are future work; no numerical advantage is attributed to UDS.

After the [correctness tests](affidabilita/piano-di-verifica.md#interfaccia-locale-unix-socket),
measure with client and database in separate processes on the same machine:
throughput, p50/p95/p99 of the whole request, CPU, copies, allocations/GC,
buffer memory, in-flight requests, and admission time. Vary frame size,
connection count, multiplexing, and slow clients; also measure isolation of
other Serie under saturation. Record path, permissions, budgets, deadlines,
available operations, and durability alongside the environment.
Engine-only benchmarks exclude transport cost and are reported separately.
A future TCP comparison must keep the same frames, operations, concurrency,
and acknowledgment guarantees.

<a id="ricerca-full-text"></a>

## Full-text search

> **Decided ([ADR-0053](adr/0053-ricerca-full-text-indici-invertiti.md))** — Future phase-8
> campaign; no full-text results are available from this design change.

Before measurement, an independent scan oracle must return the same results
for terms and phrases, `all/any`, `and/or/not`, missing fields, empty text, filters, and snapshots.
The corpus includes accents, canonically equivalent Unicode forms, case folding,
punctuation, repeated tokens, and field boundaries. Also verify updates/deletes,
multiseries aborts, `ACTIVE` plus `CLOSED`, compaction with snapshots, generation changes
during writes, crash/recovery, restore, and missing or corrupt indexes. Exhausted budgets
must produce the contract's explicit outcomes, without silently incomplete results.

| Variation | Measurements and comparison |
|---|---|
| Rare, common, and very frequent terms; short/long phrases; selective and unselective filters | p50/p95/p99, throughput, postings visited, candidates, and results; comparison with equivalent scan |
| Text length, vocabulary, fields, and positions; NNTP and general-purpose corpora | dictionary/posting/position space, delta RAM, and temporary query memory |
| New publications with concurrent reads | analysis cost, commit latency, queuing, impact on GETs and other Serie |
| Increasing segments and Serie; warm and cold cache | fan-out cost, I/O, CPU, GC, scalability, and isolation |
| Build, profile change, CLEAN/MERGE, and restart | transient time and space, coverage restoration, and interference with traffic |

Record corpus and seed, profile and Unicode version, generation, indexed fields,
term distribution, concurrency, budgets, durability, and snapshots. GET and simple
indexed-query targets are not full-text search targets; new numerical objectives
require specific evidence.

<a id="target-preliminari"></a>

## Preliminary targets

**Illustrative architectural targets, NOT demonstrated benchmarks.** On suitable hardware:

| Operation | Target |
|---|---|
| GET `_id`, cache/index | ~1–4 M ops/s aggregate |
| GET `_id`, NVMe | ~150k–600k ops/s |
| INSERT, async durability | ~700k–2 M ops/s |
| INSERT, group commit | ~300k–1 M ops/s |
| UPDATE append-only | ~400k–1,2 M ops/s |
| DELETE/tombstone | ~500k–1,5 M ops/s |
| Simple indexed query | ~500k–2 M ops/s |
| Sequential scan | ~1–5+ GB/s |
| CLEAN | ~0,5–3+ GB/s |
| MERGE | depends on segment count and size, layout, I/O, and available load capacity |
| Multiseries transactions | tens to hundreds of thousands of tx/s, depending on participating Serie count and durable-commit cost |

These numbers MUST be verified with real benchmarks. An initial plausibility check
against physical hardware limits is in
[valutazione/stime-ordine-di-grandezza.md](valutazione/stime-ordine-di-grandezza.md).

> **Decided (QA-26 → [ADR-0028](adr/0028-target-e-obiettivi-di-latenza.md))** — Only the first target is declared ‘aggregate’. For the others, whether
> they apply per Serie or summed across all Serie needs clarification: the difference is
> substantial, because each Serie has only one logical writer.

<a id="confronto-con-altri-sistemi"></a>

## Comparison with other systems

Do NOT use heterogeneous benchmarks to claim direct superiority. Oracle, MySQL/InnoDB, and
MongoDB have different architectures, semantics, durability levels, workloads, and
configurations.

The **architectural hypothesis** — to be tested experimentally — is that ArcDocDB may have a
particularly short path for simple document/KV operations, thanks to: independent
Serie, one logical writer per Serie, primary index in RAM, append-only storage, per-Serie
WAL, group commit, immutable segments, cache, and horizontal parallelism between Serie.

A comparison is valid only with equivalent:

- hardware;
- dataset and document size;
- indexes;
- durability level;
- concurrency;
- workload;
- transaction semantics.

<a id="riproducibilità"></a>

## Reproducibility

> **Proposed** — Every result published in the documents must include: code revision,
> SBCL version and startup parameters (heap size, GC), hardware and operating system,
> Serie configuration (durability, segment size, indexes), dataset generator with seed,
> and exact command. A number without these details does not enter the documentation.

<a id="relazione-con-la-fase-di-valutazione"></a>

## Relationship to the evaluation phase

Full benchmarks require the implemented system. During architectural definition,
only targeted **spikes** are run to measure individual hypotheses (index, GC,
group commit…): see the [spike plan](valutazione/piano-spike.md).
