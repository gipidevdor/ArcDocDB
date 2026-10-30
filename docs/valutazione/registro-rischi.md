<a id="registro-dei-rischi"></a>

# Risk register

> Preliminary assessment. See [caveats](README.md). Probability and impact are
> qualitative judgments (L low, M medium, H high), to revisit after every spike.

<a id="prima-evidenza-spk-04-2026-10-08"></a>

## First SPK-04 evidence (2026-10-08)

> **Proposal** — The [SPK-04 campaign](risultati-SPK-04-2026-10-08.md)
> locally verifies FIFO, writer exclusivity, bounded queues, and park/restart
> models. RSK-04 remains open on performance: short windows, a pool created
> per case, and prequeued load do not confirm targets. SPK-04 does not exercise
> the adaptive scheduler or RSK-12 controllers.

<a id="prima-evidenza-spk-06-2026-10-08"></a>

## First SPK-06 evidence (2026-10-08)

> **Proposal** — The [SPK-06 campaign](risultati-SPK-06-2026-10-08.md)
> verifies boundaries, continuous timers, and quotas in the finite load model;
> separately measures local interference between buffered copies and reads.
> RSK-12 remains open on real feedback, calibration, and pool AIMD. RSK-08
> starvation remains accepted: no emergency threshold is introduced.
> Measurements do not verify an engine compaction.

<a id="quadro"></a>

## Overview

> **Decided (initial SPK-07 tests → ADR-0046, 2026-10-08)** — RSK-05 is reopened
> for verification: the horizon ring loses a completion with a slow commit even
> when credits are respected. The bounded pending registry corrects the
> counterexample in the small model. Weak memory, snapshot expiration,
> compaction/writer interleavings, and fault injection on the future engine
> remain. Design mitigations are not implementation correctness proofs.

| ID | Risk | Prob. | Impact | Verification | Questions |
|---|---|---|---|---|---|
| [RSK-01](#rsk-01) | SBCL GC pauses incompatible with P99 | M | H | SPK-02 | QA-18 |
| [RSK-02](#rsk-02) | Primary index: design not yet defined for concurrency, snapshots, relocation | M | H | SPK-01, SPK-07 | QA-24, QA-04 |
| [RSK-03](#rsk-03) | Write amplification beyond device bandwidth | M | H | SPK-03 | QA-02 |
| [RSK-04](#rsk-04) | Single writer per Serie ceiling below targets | M | M | SPK-04 | QA-26, QA-25 |
| [RSK-05](#rsk-05) | Multiserie transactions: atomic visibility and PREPARED state | M | H | SPK-07 | QA-06, QA-07, QA-09 |
| [RSK-06](#rsk-06) | `multiserie.log` as Archivio contention point | L | M | SPK-03 | QA-08 |
| [RSK-07](#rsk-07) | Index memory and restart time | M | M | SPK-01 | QA-03 |
| [RSK-08](#rsk-08) | MERGE never runs under sustained load | M | M | SPK-06 | QA-12 |
| [RSK-09](#rsk-09) | Space retained by long-lived snapshots | M | M | — | QA-14 |
| [RSK-10](#rsk-10) | Cache: double storage and cooling after compaction | M | L | SPK-05 | QA-17 |
| [RSK-11](#rsk-11) | Divergence between development and reference platforms | H | M | SPK-03, SPK-08 | QA-19 |
| [RSK-12](#rsk-12) | Dynamic controller instability | M | M | SPK-06 | QA-12 |
| [RSK-13](#rsk-13) | Secondary index cost and consistency | M | M | — | QA-25 |
| [RSK-14](#rsk-14) | Project breadth | H | M | — | QA-23 |
| [RSK-15](#rsk-15) | Registri and catalog bootstrap | L | M | — | QA-10 |
| [RSK-16](#rsk-16) | “Common Lisp only” constraint on I/O and SIMD primitives | M | M | SPK-03, SPK-05, SPK-08 | QA-19, QA-22 |
| [RSK-17](#rsk-17) | Single data copy: loss of medium = loss of data | M | H | backup (ADR-0030), checker | — |
| [RSK-18](#rsk-18) | Defects in trusted base: SBCL (compiler, GC, runtime), operating system, firmware | L | H | CI on two platforms, soak, end-to-end checks | — |
| [RSK-19](#rsk-19) | Reliability check cost (read CRC, safety ≥ 2, scrubbing) exceeds performance budget | M | M | SPK-09 | — |
| [RSK-20](#rsk-20) | Limited verification independence: sole author | H | M | tools, checklists, data-based review | — |

<a id="stato-dopo-gli-adr-2026-10-03"></a>

## Status after ADRs (2026-10-03)

| ID | Status | Effect of decisions |
|---|---|---|
| RSK-01 | **open (quantitative)** | ADR-0024 minimizes GC work; ADR-0028 sets criterion (pause ≤ 5 ms); SPK-02 decides |
| RSK-02 | mitigated in design; **open on performance** | ADR-0015/0016/0018 define structure, concurrency, relocation; SPK-01 and SPK-07 verify |
| RSK-03 | mitigated | ADR-0013: 1× writing; residual: concurrent flushes from many Serie (SPK-03) |
| RSK-04 | mitigated | ADR-0019: writer never blocked; ADR-0028: per-Serie target = 1/4 of aggregate |
| RSK-05 | mitigated in design | ADR-0020/0021: CSN after decision, wait for multiserie transactions being applied, no-wait intents; SPK-07 model |
| RSK-06 | mitigated | ADR-0021: group commit and checkpoint truncation |
| RSK-07 | accepted, quantified | ~56 B/entry (ADR-0032); restart from hints (ADR-0015) |
| RSK-08 | explicitly accepted | ADR-0023: metric and alarm, no emergency threshold |
| RSK-09 | mitigated | ADR-0020: maximum snapshot lifetime |
| RSK-10 | mitigated | ADR-0025: entry relabeling at relocation |
| RSK-11 | mitigated | ADR-0017: reference platform fixed; per-platform `durable-flush` |
| RSK-12 | mitigated | ADR-0023: two signals, hysteresis, explicit states |
| RSK-13 | mitigated | ADR-0026: per-segment indexes, built at closure, no separate merge |
| RSK-14 | mitigated | ADR-0030: v1 scope; vertical-slice roadmap |
| RSK-15 | mitigated | ADR-0022: built-in configuration, DDL state machine |
| RSK-16 | mitigated | ADR-0017/0027: syscalls through contrib; own primitives |
| RSK-17 | **open** | ADR-0030 (proposal): consistent backup and offline checker in v1; mirroring in v1.1 |
| RSK-18 | declared residual | ADR-0033/0034: end-to-end verification, always-active checks; pinned SBCL version; Linux and macOS CI |
| RSK-19 | **open (quantitative)** | ADR-0031 §5: performance minimums are reasonable; SPK-09 measures cost |
| RSK-20 | declared residual | ADR-0031: automatic tools, checklist, data-based rereading |
| RSK-02 (update) | further mitigated | ADR-0032: 64-bit seqlock, no timing argument |

<a id="stato-dopo-lanalisi-progettuale-2026-10-03"></a>

## Status after design analysis (2026-10-03)

[Design analysis](../analisi-progettuale.md) found defects in mitigations taken
for granted; decisions 0036–0045 close them in design. They remain to be
verified in a model (SPK-07) and through measurements.

| ID | Status | Effect of decisions |
|---|---|---|
| RSK-02 | mitigated in design; **open on performance** | ADR-0043: fragments; no writer stop or memory peak during growth; 4-word slots. SPK-01 measures |
| RSK-03 | mitigated; declared residual | ADR-0037: an ordinary crash is no longer classified as corruption; RES-05 remains (at-rest damage in last flush) |
| RSK-04 | further mitigated | ADR-0039: no per-byte work in writer beyond copying; no per-operation TXID |
| RSK-05 | further mitigated | ADR-0038: horizon also covers in-flight batches (previously a snapshot could change view); ADR-0041: outcome cannot be separated from records it resolves |
| RSK-07 | accepted, **corrected estimate** | ~75–80 B per document on average, ~650 million documents per 64 GB (previously 56 B, valid only at maximum occupancy) |
| RSK-10 | accepted, to measure | ADR-0044: no relabeling; cooling after compaction measured (SPK-05) before adding a mechanism |
| RSK-13 | **open (quantitative)** | Query cost grows with segment count: limit declared in [limiti.md](../limiti.md); value filters in index files |
| RSK-15 | further mitigated | ADR-0040: creation with `.tmp` directory, no `creating` state, no deletion due to absence |
| RSK-01 | **open (quantitative)** | Additionally: pause versus thread count and replaced fragments (SPK-02) |
| RSK-18, RSK-20 | declared residual, reduced | ADR-0036: a manifest or catalog calculation defect leaves a reported unknown object, not loss; recovery does not write segments |

---

<a id="stato-dopo-la-prima-campagna-locale-2026-10-08"></a>

## Status after first local campaign (2026-10-08)

Source: [measurements and raw data](risultati-2026-10-08.md). No risk is closed
by microbenchmarks alone. v1 and v2 evidence is distinct and partial.

| Risk | Evidence | Remaining action |
|---|---|---|
| RSK-01 | 48 cases at 128 MiB; GC calls with 64 active workers can last tens of ms or more; not exact STW time | Real pool, parked/I/O workers, large heaps, and Linux |
| RSK-02, RSK-07 | v1 at 10 million: 82.21 B/doc and maximum split 98.827 ms; v2: 664 oracle comparisons and seven rejections without state change; O(2^G) directory cost clarified by ADR-0050 | Higher scale, long churn, v2 directory/splits, weak memory, and RSS |
| RSK-03, RSK-11 | F_FULLFSYNC about 4 ms with one file; median about 12 ms with four files | Real pipeline, Serie count, Linux campaign, and fault injection |
| RSK-05 | Horizon ring corrected; prepared CSN proof added with ADR-0047 | Authoritative resolver, missing interleavings, and real crashes |
| RSK-19 | Slicing-by-8 about 0.7 GB/s on v1 bodies; inline avoids observed CSN boxing; v2 codec: 416 cases and maximum record verified | I/O, prepared and complete v2 path, x86-64 disassembly |

Old rows on maintenance cost C and absence of peaks are historical: slots,
keys, directory, retained objects, and collector have distinct costs.
The correction adds no coordination between Serie.

> **Proposal** — [SPK-07/08 progress](risultati-SPK-07-08-2026-10-08.md)
> adds evidence for RSK-02 (two readers/two slots in SC), RSK-05/RSK-19
> (49,120 byte cases and unwitnessed last flush), and RSK-11/RSK-16
> (NEON and SWAR in Common Lisp at safety 3). Risks remain open: complete
> weak memory, external frontier proof, real filesystem, index integration,
> and x86-64 platform are not qualified.

---

### RSK-01


**SBCL GC pauses.** The SBCL collector stops all threads during collection:
this is *global* contention, crossing isolation between Serie. With large
heaps and high allocation, pauses can dominate P99.

- *Mitigations:* no hot-path allocation; indexes and cache in pointer-free
  specialized arrays or outside managed heap; collector tuning; evaluation
  of collector variants available in SBCL.
- *Warning sign:* pauses above the P99 target with read-only load.
- *Note:* the specification already includes GC metrics and compact structures;
  it does not include a numeric pause target (QA-26).

### RSK-02

**Primary index.** See tensions T1 and T3 in the [critical analysis](analisi-critica.md).
The system's most stressed structure has three apparently conflicting
requirements and no specified mechanism.

- *Mitigations:* decide QA-24 with an ADR supported by a prototype (SPK-01)
  and swap model (SPK-07) before any other storage work.

### RSK-03

**Write amplification.** See [estimates](stime-ordine-di-grandezza.md#banda-di-scrittura).

- *Mitigations:* choose a QA-02 option writing data only once; compression;
  limit CLEAN/MERGE bandwidth; revise upper target range.

### RSK-04

**Single writer ceiling.** Everything entering the serial part reduces
a Serie's maximum throughput.

- *Mitigations:* parallelizable work outside writer; batching; secondary indexes
  updated outside critical path; clarify QA-26. For loads beyond one Serie,
  the model already provides distribution over multiple Serie.

### RSK-05

**Multiserie transactions.** See tensions T4 and T5. Risks concern correctness
(a snapshot seeing half a transaction) and performance (documents stuck in
PREPARED, waiting writers).

- *Mitigations:* exhaustive protocol model exploration with crashes FI-03,
  FI-04, FI-05, FI-12 before implementation (SPK-07); explicit recovery rule.

### RSK-06

**Shared `multiserie.log`.** This is the only log traversed by every multiserie
transaction in an Archivio. Group commit contains the risk, but a slow flush
on this file slows all multiserie transactions. It is also a single growing file.

- *Mitigations:* group commit; truncation policy (QA-08); dedicated metric.

### RSK-07

**Memory and restart.** See [estimates](stime-ordine-di-grandezza.md#memoria-del-primary-index).

- *Mitigations:* compact entries; hint or checkpoint files (QA-03); parallel
  recovery per Serie; document capacity limit per server.

### RSK-08

**MERGE never runs.** See tension T7.

- *Mitigations:* metric and alarm on small-segment count; structures tolerating
  thousands of segments; explicit decision on any emergency threshold (QA-12).

> **Decided (QA-12 → ADR-0023)** — MERGE starvation is accepted with a
> metric and alarm; no emergency threshold is planned. SPK-06 verifies
> policy on finite traces and does not demonstrate progress under sustained load.

### RSK-09

**Long-lived snapshots.** They retain versions and segments; with many writes,
occupied space grows without bound for the snapshot's lifetime.

- *Mitigations:* metric on oldest snapshot age; configurable maximum lifetime
  (QA-14).

### RSK-10

**Cache.** If segments are read through the operating system's page cache,
data resides in memory twice. CLEAN/MERGE relocation also changes locations:
a location-indexed cache loses the warmth of moved records.

- *Mitigations:* decide read mode (QA-19); assess transfer of hot entries during
  compaction; measure before complicating.

> **Proposal** — The [SPK-05 campaign](risultati-SPK-05-2026-10-08.md)
> compares pread and mapping on 16 MiB files. It exercises no own cache,
> relocation, or beyond-RAM dataset: RSK-10 remains quantitatively open.

### RSK-11

**Platforms.** Development on macOS/ARM64; reference hardware (16–32 cores,
PCIe 4/5 NVMe) suggests x86-64 Linux servers, but this is undecided.
Flush semantics, I/O primitives, SIMD support in SBCL, and GC behavior differ.

- *Mitigations:* decide QA-19 immediately; run I/O spikes on the reference
  platform; treat development-machine measurements as indicative.

### RSK-12

**Dynamic controllers.** Low-load policy uses two smoothed signals under
ADR-0023; the thread pool also considers queues, CPU, and backlog under
ADR-0011. A poorly tuned controller oscillates or reacts late, and its
defects can emerge under real load.

- *Mitigations:* start with few signals and simple rules with hysteresis;
  simulate controller on load traces; make every scheduler decision observable.

> **Proposal** — SPK-06 verifies thresholds and transitions in the finite
> model. Device feedback, EWMA from real metrics, and pool AIMD remain to
> be verified; the I/O campaign is independent of the controller model.

### RSK-13

**Secondary indexes.** Four different structures plus Bloom filters, each
with a delta model, must remain consistent with commit, snapshots, and
recovery. If updated by the logical writer, they consume its budget.

- *Mitigations:* defer until after basic storage; decide QA-25; introduce
  one index type at a time.

**Update 2026-10-15 — full text approved.**
[ADR-0053](../adr/0053-ricerca-full-text-indici-invertiti.md) adds versioned
analyzers, dictionary, postings and positions, ACTIVE delta, and generation
change. CPU, RAM, build/rebuild I/O, and work to complete before commit
acknowledgment increase. Risks include incomplete results, mixed versions,
and interference with GET and other Serie.

- *Defined mitigations:* budgets checked before durable decision; complete
  coverage and fixed generation per query; visibility of the same version
  for text and filters; explicit errors for unavailable derivatives;
  no new global coordination per document.
- *Verification still to produce:* scan oracle, Unicode, update/delete,
  snapshot, abort, generation change, crash/restore, corruption, and saturation;
  [dedicated measurements](../13-benchmark.md#ricerca-full-text) of memory,
  space, commit latency, P99, scalability, and isolation. Primary index
  and bitmap spikes do not close this risk for full text.

### RSK-14

**Breadth.** Eighteen modules, including a query engine, network protocol,
and adaptive controller, represent considerable work.

The ADR-0053 v1 full text extension adds work to M06/M15 in phase 8.
Its approval does not complete implementation or qualification, and does
not shift immediate storage/recovery priorities. Ranking, fuzzy search,
and synonyms do not implicitly enter approved scope.

- *Mitigations:* minimal vertical slice (one Serie, GET/PUT, WAL, recovery)
  before everything else; declared out-of-scope functionality (QA-23);
  phases with exit criteria ([roadmap](../roadmap.md)).

### RSK-15

**Bootstrap.** See tension T9.

- *Mitigations:* Registri configuration built into code; Registri recovery
  as first step, separate from other Serie recovery.

### RSK-16

**Common Lisp only.** The constraint excludes C libraries for asynchronous
I/O, compression, hashing, and SIMD. Everything must be obtained with SBCL,
its contribs, and any Common Lisp libraries.

- *Mitigations:* verify in spikes that flush, positional reads, and atomic
  operations are available without allocation; write the few required
  primitives (checksum, hash) in Common Lisp; reopen the constraint with
  an ADR only in response to a measurement.

> **Proposal** — [SPK-05](risultati-SPK-05-2026-10-08.md) performs pread,
> mmap, and CRC verification in Common Lisp/SBCL on macOS ARM64. The final
> isolated cycle shows no allocation in the sample; Linux and other
> primitives remain to be verified. Local availability does not close RSK-16.

> **Proposal** — The [SPK-08 bitmap extension](risultati-SPK-08-bitmap-2026-10-08.md)
> verifies two Common Lisp kernels and their generated code on ARM64.
> Scalar popcount uses compiler-internal NEON instructions, even without
> a contrib popcount API. Packing, x86-64, and engine hot path remain
> to be measured; no new product dependency is introduced.

- *Benefit:* one language, one memory model to understand, no foreign boundary
  to cross on the hot path.

### RSK-17

**Single data copy.** Only one device in v1: losing the medium means losing
data, regardless of software quality. With reliability as the ultimate
goal, this is the largest residual risk
([failure analysis](../affidabilita/analisi-dei-guasti.md), RES-03).

- *Mitigations:* consistent backup (closed segments, control log, hints at
  one CSN) verifiable by the offline checker; immutable segments make backup
  incremental and inexpensive; segment mirroring to a second path as a
  planned extension.
- *Author decision required:* [ADR-0030](../adr/0030-scope-v1.md) (backup
  and checker in v1).

### RSK-18

**Trusted base.** SBCL compiler, GC, and runtime, kernel, and firmware are
not qualified.

- *Mitigations:* end-to-end verification (CRC and index comparison on every
  read); always-active type and bounds checks; pinned SBCL version; Linux
  and macOS CI; soak tests.
- *Limit:* a defect producing wrong data **with a valid CRC** cannot be
  detected from within.

### RSK-19

**Check cost.** CRC32C in typed Common Lisp, `safety` ≥ 2, background
scrubbing: all consume CPU and bandwidth.

- *Mitigations:* [ADR-0028](../adr/0028-target-e-obiettivi-di-latenza.md)
  performance minimums are reasonable by construction; SPK-09 measures CRC
  throughput (including tables) and overhead; if a minimum is missed,
  change algorithms, not checks.

### RSK-20

**Limited independence.** The author is also the verifier.

- *Mitigations:* tools independent of the author (linter, traceability,
  simulator, models, fuzzing, mutation testing); review checklist; rereading
  by a second reviewer using verifiable data
  ([verification plan](../affidabilita/piano-di-verifica.md)).

<a id="impatto-dei-limiti-v2"></a>

## Impact of v2 limits

ADR-0048 expands keys and slots: it increases RSK-07 (memory) and split,
hashing, and verification cost. SPK-01/SPK-09 v1 evidence does not close
these risks for v2. Maximum requests and depth require decoder and protocol
budgets. ADR-0049 remains a proposal: cold lookups, write amplification,
and new-index crashes require evidence before adoption.

<a id="trasporto-locale-2026-10-17"></a>

## Local transport (2026-10-17)

[SPK-11](../../spikes/SPK-11-unix-socket/README.md) adds SBCL interprocess
transport tests to RSK-14/RSK-16 without closing them. Raw bind on macOS
can follow a dangling link: occupied-name preflight in the owned directory
is mandatory before calling it. Contrib `socket-receive` allocates an
alien buffer per call; the future product adapter must use preallocated
buffers, injectable I/O, and deadlines. Admission, commit, isolation,
and reference platform remain open; no latency target demonstrated.
