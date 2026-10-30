<a id="piano-degli-spike"></a>

# Spike plan

A **spike** is a small, focused experiment answering an evaluation question.
It is not production code: it lives in [`spikes/`](../../spikes/README.md), is
disposable, and its product is a **measurement with a recommendation**.

<a id="regole"></a>

## Rules

- Common Lisp on SBCL only ([ADR-0001](../adr/0001-common-lisp-sbcl.md)).
- Every spike declares its question, method, and outcome criterion *before* running.
- Every result reports hardware, operating system, SBCL version and parameters,
  and exact command ([reproducibility](../13-benchmark.md#riproducibilità)).
- Development-machine measurements are indicative; those depending on I/O and
  core count must be repeated on the reference platform (QA-19).
- At completion, update the [risk register](registro-rischi.md),
  [estimates](stime-ordine-di-grandezza.md), and linked open question.

<a id="quadro"></a>

## Overview

| ID | Spike | Answers | Risks | Order |
|---|---|---|---|---|
| [SPK-01](#spk-01) | Compact primary index | QA-24, QA-03, QA-16 | RSK-02, RSK-07 | 1 |
| [SPK-02](#spk-02) | SBCL GC under load | QA-18 | RSK-01 | 1 |
| [SPK-03](#spk-03) | WAL and group commit | QA-02, QA-05, QA-19 | RSK-03, RSK-06, RSK-11 | 2 |
| [SPK-04](#spk-04) | Logical writer on thread pool | QA-26 | RSK-04 | 4 |
| [SPK-05](#spk-05) | Segment read path | QA-17, QA-19 | RSK-10, RSK-16 | 4 |
| [SPK-06](#spk-06) | Compaction interference and load controller | QA-11, QA-12 | RSK-08, RSK-12 | 5 |
| [SPK-07](#spk-07) | Protocol models | QA-04, QA-06, QA-07, QA-09, QA-24 | RSK-02, RSK-05 | 3 |
| [SPK-08](#spk-08) | SIMD and generated code | QA-19 | RSK-11, RSK-16 | 5 |
| [SPK-09](#spk-09) | Reliability check cost | ADR-0033, ADR-0034 | RSK-19 | 1 |
| [SPK-10](#spk-10) | Limits, formats, and v2 migration | ADR-0048 | RSK-02, RSK-07, RSK-19 | 1, before engine |
| [SPK-11](#spk-11) | Unix socket between two processes | ADR-0055, proposed ADR-0056 | RSK-14, RSK-16 | 1, contract before M16 |

---

### SPK-11

**Priority local transport.** The [preregistered method](../../spikes/SPK-11-unix-socket/README.md)
checks bounded framing, two SBCL processes, maximum document/key, occupied
names, and node release. No benchmark or engine qualification; access with
distinct identities and Linux/macOS remain separate tests.

### SPK-01

**Compact primary index.**

- *Question:* can a compact hash table in specialized arrays, with one writer
  and many readers without locks, be implemented entirely in Common Lisp with
  performance in the required order of magnitude?
- *Method:* prototype of the fragmented table from
  [ADR-0043](../adr/0043-primary-index-a-frammenti.md) (extendible directory,
  fixed-capacity Swiss fragments, 4-word slots, local keys) on specialized arrays;
  load with 10⁷–10⁸ entries; one thread writes, N read; continuous splits under
  load; repeated insertions and deletions at constant population; 5-word variant
  for retained versions. Verify in generated code that every word is read and
  written with a single instruction on both platforms.
- *Measurements:* lookup/s per core and aggregate; insertions/s; **bytes per document**
  (mean and range); split duration; memory at constant population with key turnover
  (must remain bounded); effect on GC pauses; concurrent-read correctness;
  seqlock fallback frequency.
- *Outcome:* lookup order of magnitude compatible with GET target; per-entry memory
  within the [estimate](stime-ordine-di-grandezza.md#memoria-del-primary-index);
  no inconsistent read.

### SPK-02

**SBCL GC under load.**

- *Question:* what pauses does the collector produce with heaps of the expected
  sizes, and how much do they depend on where index and cache live?
- *Method:* process with (a) tens of GB in specialized arrays on heap, (b) the same
  memory outside managed heap; synthetic multithreaded load with variable allocation
  per request (zero, low, high); comparison of collector configurations.
  Additionally ([ADR-0043](../adr/0043-primary-index-a-frammenti.md), [ADR-0045](../adr/0045-modello-di-esecuzione.md)):
  the same memory in tens of thousands of ~256 KiB fragments rather than a few
  huge arrays, with continuous fragment replacement; increasing thread counts
  (16, 64, 256), with threads stopped in system calls.
- *Measurements:* pause distribution (P50, P99, maximum); frequency; total GC time;
  synthetic request latency; **pause versus thread count** (sets the I/O pool cap).
- *Outcome:* pauses within the numeric P99 target (to be set with QA-26) in the
  best configuration. Otherwise, quantify the gap and reassess ADR-0001.

### SPK-03

**WAL and group commit.**

- *Question:* what does a flush cost, how does group commit scale, and what happens
  with many WALs flushing in parallel on the same device?
- *Method:* batched append + flush on one file; vary group and record size; repeat
  with 1, 4, 16, 64 concurrent files; compare available flush primitives; compare
  single and double record writing (QA-02 options). Discipline from
  [ADR-0037](../adr/0037-lotto-sigillato.md): one I/O task at a time per file
  (writes closed batches, then flush), with batches forming during flush.
- *Measurements:* flush duration (distribution); durable operations/s; bandwidth;
  scalability with file count.
- *Outcome:* data to decide QA-02 and QA-05 and confirm or revise the “INSERT group
  commit” target. Verify flush and writes are reachable from Common Lisp without allocation.
- *Caution:* on macOS, ordinary flush does not guarantee persistence; durability
  measurements must use the correct primitive and be repeated on the reference platform.

### SPK-04

**Logical writer on a thread pool.**

> **Proposal** — [Executable experiment](../../spikes/SPK-04-writer-pool/README.md)
> verified in the [local campaign](risultati-SPK-04-2026-10-08.md): bounded queues,
> writer segments, parking, and read restart. Real tests and finite models
> remain distinct; no engine target is confirmed.

- *Question:* what is the throughput ceiling of a serial executor per Serie on a
  shared pool, and how does it scale with Serie count?
- *Method:* per-Serie queues drained in batches by pool workers; synthetic serial
  work of controlled duration; 1…N Serie; uniform and skewed load. Under
  [ADR-0045](../adr/0045-modello-di-esecuzione.md): bounded-length writer segments,
  ready Serie list touched once per segment, reads performed by the receiving
  worker, parking and resumption of a batch's clients; and, for parallelism as
  a founding principle ([ADR-0036](../adr/0036-leggi-di-progetto.md), INV-P6),
  closed-inventory elements (CSN, horizon, threshold, epoch) exercised at expected frequency.
- *Measurements:* per-Serie and aggregate operations/s; handoff cost; queue latency;
  fairness between Serie; **aggregate throughput versus Serie and core count**;
  time spent on each shared element; effect of a burst on one Serie on others.
- *Outcome:* confirm mechanism cost is small relative to the
  [budget](stime-ordine-di-grandezza.md#budget-del-writer-logico); nearly linear
  scaling with Serie while cores remain available; no closed-inventory element
  becomes the bottleneck. Otherwise, the result identifies which item to revise.

### SPK-05

**Segment read path.**

> **Proposal** — [Executable experiment](../../spikes/SPK-05-segment-read/README.md)
> on immutable 16 MiB files: pread/mmap comparison with the same checker,
> random access and scans, 1/2/4 workers and three replicas. The method declares
> uncontrolled page cache, synthetic payload, and separate allocation profile;
> beyond-RAM dataset, own cache, and reference platform remain to be measured.

- *Question:* how can a record be read from an immutable segment without copying
  or allocation, and with what I/O concurrency?
- *Method:* compare positional reads into reused buffers with memory mapping;
  random reads with increasing concurrency; sequential scan.
- *Measurements:* reads/s; latency; scan GB/s; allocation per read; behavior with
  a dataset larger than RAM.
- *Outcome:* read mode (QA-19) and cache granularity (QA-17) choice; confirmation
  or revision of “GET NVMe” and “sequential scan” targets.

### SPK-06

**Compaction interference and load controller.**

- *Question:* how much does request latency worsen while CLEAN or MERGE is running,
  and can a simple controller contain it?
- *Method:* synthetic read/write load plus sequential segment copying at variable
  bounded bandwidth; controller simulation (load states with hysteresis) on traces.
- *Measurements:* P99 with and without compaction; achieved compaction bandwidth;
  controller stability.
- *Outcome:* initial threshold values (QA-11, QA-12); evidence that opportunistic
  MERGE does not alter P99.

> **Proposal** — The [first local campaign](risultati-SPK-06-2026-10-08.md)
> verifies a deterministic model with exact EWMA, thresholds, and timers from
> ADR-0023, and measures bounded-bandwidth buffered copies concurrent with
> reads on synthetic files. Overlap is observed from worker and individual
> sample times, without inferring it solely from the start gate. The controller
> does not receive signals from I/O measurements: threshold calibration and
> low-load policy testing on the engine remain open.

### SPK-07

**Protocol models.**

- *Question:* do protocols preserve invariants under every interleaving and a crash
  at every point?
- *Method:* describe as state machines and explore exhaustively over small
  configurations: (1) 2PC with nonblocking writer, `multiserie.log`, recovery;
  (2) CLEAN/MERGE with concurrent writer, swap, reader, snapshot, reclaim.
  The explorer is a Common Lisp program: no specification language or external
  verification tool (author decision, 2026-10-03;
  [ADR-0035](../adr/0035-strategia-di-verifica-e-tracciabilita.md)).
- *Additional models (ADR-0032, ADR-0033):* (3) the 64-bit seqlock protocol with
  1 writer, 2 readers, 2 slots, every interleaving and suspension, including
  writer fallback; (4) **recovery idempotence**: recovery interruption at every
  step and reexecution.
- *Design analysis models (ADRs 0036–0043):* (5) **batch and durable frontier**:
  multiple closed unsynchronized batches, every lost or partial subset, and
  alternatively damage below the frontier — recovery concludes “tail” in the
  first case and “corruption” in the second, without ever writing segments;
  (6) **visibility horizon**: two Serie, one in-flight batch, one multiserie
  transaction, a snapshot created at every point, snapshot registration racing
  publication, a Serie entering `FAULTED` with an in-flight CSN;
  (7) **self-sufficient segments**: rotation, CLEAN, and hint regeneration at
  every point of a multiserie transaction; (8) **tombstones**: deletions,
  recreations, CLEAN, MERGE of nonadjacent segments, snapshots, restart at every
  point; (9) fragment split with concurrent readers; (10) crash before and after
  **every atomicity point** in the [table](../analisi-progettuale.md#punti-di-atomicità).
- *Verification:* INV-D1, INV-T3, INV-T4, INV-M1, INV-M2, INV-R1, INV-C7, INV-C8,
  INV-C9, INV-I1, INV-A7 in scenarios FI-01…FI-13; additionally INV-F2, INV-F3,
  INV-V5, INV-M4, INV-M5, INV-S7, INV-C11, INV-A9, INV-A10, INV-A11.
- *Outcome:* no violation; otherwise the counterexample guides the decision on
  QA-04, QA-06, QA-07, QA-24. Models remain a reference for fault injection tests.

> **Decided (SPK-07 → ADR-0046)** — The first finite suite is executable in
> [SPK-07-protocols](../../spikes/SPK-07-protocols/README.md). It found horizon-ring
> blocking and verifies the bounded registry replacing it. Remaining gaps are
> declared in output; SPK-07 is not yet complete for the gate.

> **Proposal** — The local extension of 2026-10-08 adds finite models of
> publication, expiration, compaction with ACTIVE writer, and barrier observation.
> [Preregistered methods and results](../../spikes/SPK-07-protocols/README.md)
> distinguish domains, assumptions, and negative controls. Complete architectural
> memory with multiple readers/slots and crashes on real files remain in the gate.
> [Subsequent progress](risultati-SPK-07-08-2026-10-08.md) adds two readers/two
> slots in SC and 49,120 byte cases; confirmed frontier is an external fact
> and complete recovery coverage remains open.

### SPK-08

**SIMD and generated code.**

- *Question:* what does SBCL generate for typical loops (bitmap operations,
  fingerprint comparison, checksum) on the target architectures, and what
  explicit SIMD tools are available on each?
- *Method:* candidate-loop microbenchmarks; generated-code inspection; verification
  of explicit SIMD support on x86-64 and ARM64.
- *Outcome:* inventory of loops where typed code suffices and those needing
  intervention; no optimization introduced in this phase (INV-X1).

> **Proposal** — [SPK-08](../../spikes/SPK-08-generated-code/README.md) is now
> executable: exact scalar/SWAR masks, NEON/SSE2 kernels with safety 3 checks,
> disassembly, and 70 local serial samples on ARM64. x86-64 execution, bitmap,
> checksum, and real index remain to be assessed. Measurements do not promote
> an optimization into the engine.

### SPK-09

**Reliability check cost.**

- *Question:* what do mandatory design checks cost in typed Common Lisp — CRC32C
  on every read, `safety` 2/3, scrubbing — and do the minimum performance levels
  of [ADR-0028](../adr/0028-target-e-obiettivi-di-latenza.md) remain reachable?
- *Method:* (a) CRC32C in Lisp: bitwise, byte-table, *slicing-by-8*, with and
  without `(safety 3)`, separately for header (20 bytes) and body; (b) read loop
  for a 2 KB record checking both CRCs, key, and CSN, versus the same read without
  checking; (c) same loop compiled with `safety` 3, `safety` 2 with `speed` 3,
  and (for reference only, never adoptable) `safety` 0, to quantify check cost.
- *Measurements:* CRC bytes/s per core; ns per record; percentage overhead for
  verification and `safety`; allocation per operation (target: 0).
- *Outcome:* minimum throughput reachable with **all** checks active and
  `safety` ≥ 2. Otherwise change the algorithm (for example slicing-by-8,
  block verification) and record it in an ADR; **do not** remove a check (ADR-0031 §5).

<a id="estensione-v2-da-eseguire"></a>

## v2 extension to execute

SPK-01: 5-word slots, keys up to 65,535 bytes, arena budgets and splits.
SPK-09: v2 lengths, document 16 MiB/16 MiB+1, boundary keys, depth 100/101,
fuzzing, and interrupted conversion. v1 measurements remain valid only for v1.
ADR-0049 also requires a beyond-RAM experiment with an index larger than cache.

### SPK-10

**Limits, formats, and v2 migration.**

- *Question:* can the ADR-0048 contract be represented and checked at boundaries
  without interpreting v1 as v2, allocating from unchecked lengths, or losing sources?
- *Method:* [four modules](../../spikes/SPK-10-v2-limits/README.md) in parallel:
  codec and hint with explicit versions, fragment with v2 slots and bounded
  arenas, iterative CBOR validator, and finite conversion model. Independent
  checks, strict compilation, and harness integration; serial benchmarks.
- *Measurements:* verification and lookup throughput and allocations for keys
  of different lengths, arena bytes and transient peak; migration states
  and counterexamples.
- *Outcome:* boundary fixtures, explicit overflow, truncation, and budget
  rejections; unverified-publication or early-reclaim mutants detected.
  Uncovered CBOR subset, directory, weak memory, and real filesystem are
  declared, not assumed verified. Engine gate remains distinct from spike success.
