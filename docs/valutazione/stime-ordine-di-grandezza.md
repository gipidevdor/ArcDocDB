<a id="stime-di-ordine-di-grandezza"></a>

# Order-of-magnitude estimates

> **These are not measurements.** They are desk calculations to check whether
> [preliminary targets](../13-benchmark.md#target-preliminari) are compatible with the physical
> limits of the [reference hardware](../13-benchmark.md#hardware-di-riferimento). Hardware
> figures are indicative typical values, to replace with measurements on the actual
> machine (SPK-03, SPK-05). They help identify *where* the limit lies, not predict a result.

<a id="banda-di-scrittura"></a>

## Write bandwidth

Bandwidth = operations/s × document size (without headers or compression).

| INSERT target | 1 KB document | 4 KB document |
|---|---|---|
| 300k ops/s (group commit, minimum) | 0.3 GB/s | 1.2 GB/s |
| 1 M ops/s (group commit, maximum) | 1 GB/s | 4 GB/s |
| 2 M ops/s (async, maximum) | 2 GB/s | 8 GB/s |

For comparison: a PCIe 4 NVMe has an interface ceiling around 7–8 GB/s for sequential
writes, and *sustained* bandwidth is usually substantially lower; PCIe 5 roughly doubles this.

Consequences:

1. With 4 KB documents, the upper INSERT target range is **at or beyond the limit** of a single
   PCIe 4 device, even writing each record only once.
2. If each record is written twice (WAL + segment, QA-02 options a/b), required bandwidth
   doubles: the limit is reached halfway through the range.
3. CLEAN and MERGE contend for the same bandwidth while writing new segments.

> **Proposal** — The [local SPK-06 comparison](risultati-SPK-06-2026-10-08.md)
> uses small files and uncontrolled page cache. Observed buffered-copy
> bandwidth does not replace sustained device-bandwidth measurement or
> verify engine CLEAN/MERGE. Physical estimates still need confirmation
> on reference hardware.

→ The upper range is reachable only with small documents, one write per record,
compression, or multiple devices. This is the main argument for deciding QA-02. It also
confirms priority principle INV-P4: on the device, WAL must take precedence over
compaction.

<a id="rotazione-dei-segmenti"></a>

## Segment rotation

A Serie writing 1 GB/s fills a 256 MB segment in about 0.25 s: ~4 segments per
second, ~4,000 segments per TB.

- Rotation must be cheap and nonblocking for the writer.
- The 50 s rule does not burden these segments: they are born at full size and are not
  MERGE candidates. It concerns small segments produced by CLEAN.
- Segment count per Serie is in the thousands: metadata, Bloom filters, and open
  files must be sized accordingly.

<a id="memoria-del-primary-index"></a>

## Primary index memory

Local v1 measurement: 64.22656 B/document of array payload at 100,000
documents, before and after 50,000 key replacements
([2026-10-08 campaign](risultati-2026-10-08.md)). Excludes headers, runtime,
garbage, and retained fragments: it does not replace v2 capacity estimates.
Directory and transient-memory cost is separate from C slots
([ADR-0050](../adr/0050-pubblicazione-e-costi-della-directory.md)).

At 10 million documents, measured v1 payload is 82.2099968 B/doc,
822,099,968 bytes. The figure exceeds the value at 100,000 documents because fragment
occupancy changes; it is not a guaranteed capacity or a v2 figure.

Layout decided in [ADR-0043](../adr/0043-primary-index-a-frammenti.md): fixed-capacity
fragments, 1 control byte + 4 64-bit words per slot (CSN, location, key and length,
seqlock counter) = **33 bytes per slot**, plus keys in the fragment-local area (16
bytes for generated IDs).

Cost per document depends on occupancy, which in an extendible hash table
varies per fragment between 7/16 (just after splitting) and 7/8 (just before):

| Occupancy | Slot | Key (16 B ID, area at 75%) | Total per document |
|---|---|---|---|
| maximum (7/8) | ~38 B | ~18 B | ~56 B |
| expected average (~0.61) | ~54 B | ~21 B | **~75–80 B** |
| minimum (7/16) | ~75 B | ~37 B | ~112 B |

| Documents | Index memory (average) | Live data at 2 KB/doc |
|---|---|---|
| 100 million | ~8 GB | 200 GB |
| 1 billion | ~80 GB | 2 TB |

→ With ~15% of RAM reserved for cache and runtime, a 64 GB server holds about **650
million** documents and a 128 GB server about **1.3 billion**. This memory is not GC work
([ADR-0024](../adr/0024-memoria-e-gc.md)). Deleted documents occupy no memory.

Note on the previous estimate (“56 bytes per entry,” 750 million per 64 GB): it was the
maximum-occupancy value for a single table, true only just before doubling; that
same table averaged more than 90 bytes per document and during doubling
required triple the memory ([design analysis](../analisi-progettuale.md#ap-12)).
Actual average occupancy is one of SPK-01's measurements.

<a id="tempo-di-riavvio"></a>

## Restart time

| Strategy (QA-03) | Restart work for 1 billion documents / 2 TB | Order of magnitude |
|---|---|---|
| Rebuild from segments | read 2 TB at 1–5 GB/s | ~7 to ~35 minutes |
| Per-segment hint files | read ~24 GB of entries plus keys and reinsert 1 billion entries, in parallel and any order | tens of seconds to a few minutes |
| Table checkpoint | load 30–40 GB + replay recent WAL | tens of seconds |

→ Full reconstruction is acceptable as a safety net (the index is derived
data), not as the normal restart path. Parallel recovery per Serie reduces
time only if data is distributed across multiple Serie.

<a id="budget-del-writer-logico"></a>

## Logical writer budget

One writer per Serie means the serial portion of every write runs on a single
core at a time.

| Throughput on one Serie | Time available per operation in serial portion |
|---|---|
| 300k ops/s | ~3.3 µs |
| 1 M ops/s | 1 µs |
| 2 M ops/s | 0.5 µs |

Typical serial costs: index update with likely cache miss (~0.1 µs),
copying a 2 KB record into buffer (~0.1–0.2 µs), version check, accounting.
The order of magnitude is compatible with ~1 M ops/s per Serie **only if** nothing
else is in the serial portion: no parsing, validation, allocation, or synchronous secondary
index update. At 2 M ops/s on a single Serie, no margin remains.

**CRC** deserves its own paragraph. A table-based CRC32C in Common Lisp costs on the order of
1–2 µs per 2 KB record (estimate, SPK-09): if the writer computed it, it alone would consume
much of the budget at 300k ops/s. This is why records have two CRCs
([ADR-0039](../adr/0039-cornice-unica-dei-record.md)): body CRC is computed by the request
worker, in parallel; the writer computes only the 20-byte header CRC.

→ Write targets are plausible as an *aggregate across multiple Serie*; as a *per-Serie*
value, the upper range is at the limit. This is why QA-26 needs immediate clarification, and secondary
indexes (QA-25) must be assessed against this budget.

<a id="letture-puntuali"></a>

## Point reads

> **Proposal** — The [first SPK-04 campaign](risultati-SPK-04-2026-10-08.md)
> measures only draining synthetic queues with start/join and instrumentation.
> Retained data does not confirm the writer's serial budget: records,
> CRC, index, durable commit, and concurrent producers during drain are excluded.


**From cache/index.** 1–4 M aggregate ops/s on 16–32 cores equates to 4–16 µs per operation
per core: ample for an in-memory lookup. Protocol and network will dominate cost, plus
any per-request allocation.

**From NVMe.** A random read costs on the order of 0.1 ms. With blocking I/O, one thread
therefore performs ~10,000 reads per second: 150k–600k ops/s requires 15 to 60 reads
in flight simultaneously.

→ The upper range requires more I/O-blocked threads than cores, or asynchronous
I/O. The dynamic thread pool must distinguish CPU-using workers from those waiting
for I/O (QA-19), and selection must respect the “Common Lisp only” constraint.

> **Proposal** — The [SPK-05 campaign](risultati-SPK-05-2026-10-08.md)
> measures a newly written 16 MiB file, with uncontrolled page cache.
> It does not replace the NVMe estimates above or confirm the GET target: datasets
> beyond RAM and the reference platform are needed. The isolated cycle's zero allocation
> delta does not include index, cache, or request service.

## Group commit

Let *f* be flush duration. A Serie can perform at most 1/*f* flushes per second; each
transaction waits on average about one flush.

| Flush duration | Flushes/s per Serie | Group size at 300k ops/s | Added latency |
|---|---|---|---|
| 0.1 ms | 10,000 | 30 | ~0.1 ms |
| 1 ms | 1,000 | 300 | ~1 ms |
| 5 ms | 200 | 1,500 | ~5 ms |

- Durable write latency cannot fall below flush duration: the numeric
  P99 objective (QA-26) must account for it, separately by durability level. With one
  I/O task at a time per log ([ADR-0037](../adr/0037-lotto-sigillato.md)), a write
  waits between one and two flushes: the one in progress on arrival and its own.
- One WAL per Serie means **N concurrent flush streams** on the same device. If the
  device serializes flushes, the advantage of independence between Serie decreases precisely
  on the durable path. This hypothesis needs measurement (SPK-03), directly affecting ADR-0003.

<a id="transazioni-multiserie"></a>

## Multiseries transactions

Minimum multiseries commit latency: PREPARE flush (in parallel across participants) +
decision flush = **two sequential flushes**. Throughput: bounded by
`multiserie.log` groups (flushes/s × transactions per group); at 1,000 flushes/s, groups
of tens to hundreds of transactions are needed to reach tens to hundreds of thousands of tx/s.

→ The target is plausible if groups form well. Each multiseries transaction also consumes
each participant writer's budget at least twice (PREPARE and outcome).

## Garbage collector

Load assumption: 1 M requests/s. If each request allocates 1 KB in managed heap, the allocation
rate is 1 GB/s: young-generation collection several times per second, and at
each collection **all** threads stop.

→ “No allocation on the hot path” is an architectural requirement, not a refinement: it must
be considered when designing module interfaces (reused buffers, results written into
caller-supplied memory). Pause duration with heaps of tens of GB is the measurement
SPK-02 must produce.

<a id="ricerca-full-text"></a>

## Full-text search

[ADR-0053](../adr/0053-ricerca-full-text-indici-invertiti.md) adds
full text to v1. Previous estimates for primary index bytes per entry,
GET, and simple queries exclude analysis, postings, or positions.
They are therefore not text-search capacity or performance estimates.

| Item to size | Data needed |
|---|---|
| Document and query analysis | Text bytes, fields, Unicode profile and version, produced tokens; CPU and temporary memory |
| Dictionary | Distinct field/term pairs and their lengths |
| Postings and frequencies | Term/row associations, term distribution, and block codec |
| Positions | Token occurrences per field, repetitions, and position encoding |
| ACTIVE delta and publication | Buffer budgets, growth with documents, commit latency, and writer interference |
| Build, generation change, and compaction | Coexistence of old/new derivatives and readers, transient space, I/O bandwidth, and completion time |

The absence of a separate index WAL does not eliminate derived-file
writes. Average document length alone determines neither vocabulary
nor posting and position counts. Before attributing bytes
per document or throughput targets, corpus, profile, codec, and
measurements from the [full-text campaign](../13-benchmark.md#ricerca-full-text) are needed.
The new feature's costs must also be included in mixed workloads and
GC, P99, and isolation measurements, distinguishing enabled and disabled indexes.

<a id="riepilogo"></a>

## Summary

The [proposed local session](../implementazione/sessione-locale.md) separates
document, envelope, and frame. Pool defaults are configuration budgets,
not measured RSS memory. SPK-11 checks socket bytes and lifecycle:
it does not yet attribute throughput, latency, or advantages over TCP to the engine.

| Target | Desk assessment | Depends on |
|---|---|---|
| GET from cache/index | plausible | protocol, allocations, GC |
| GET from NVMe | plausible in lower range; upper range needs highly concurrent I/O | QA-19 |
| INSERT / UPDATE / DELETE | plausible in aggregate; upper range at device limit with large documents | QA-02, QA-26 |
| Indexed query | cannot assess: depends on QA-25 and Query Engine | QA-25 |
| Full text: words, phrases, and filters | unquantified; semantics approved, implementation and binary format to produce | ADR-0053, corpus, and dedicated campaign |
| Sequential scan, CLEAN | plausible: sequential work bounded by device | I/O priority |
| Multiseries transactions | plausible if group commit forms large groups | QA-06, QA-07 |
| Low P95/P99 latency | objectives defined by ADR-0028; compliance during compaction still to measure | SPK-02, SPK-06, engine |

<a id="revisione-v2-adr-0048"></a>

## v2 revision (ADR-0048)

The preceding tables estimate v1 layout. V2 costs 41 B/slot instead of 33: +8/occupancy B per document (about +9.1 at 7/8 load, +18.3 at 7/16), besides keys. With a 16 B key and preceding average assumptions, about 88 B/document; decimal 64 GB with 15% reserved would yield about 618 million, an **illustrative estimate**. Large keys greatly reduce capacity. Remeasure in SPK-01; no beyond-RAM-mode capacity is demonstrated.
