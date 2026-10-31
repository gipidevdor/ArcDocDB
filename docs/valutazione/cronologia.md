<a id="cronologia-delle-valutazioni"></a>

# Assessment history

[Assessment](README.md) · [Current implementation](../implementazione/README.md)

This register preserves initial assessments and campaigns in their temporal
context. Descriptions of remaining work refer to that time;
current status is in the implementation index.

<a id="fattibilità-aggiornata-al-2026-10-15"></a>

## Feasibility updated through 2026-10-15

> **Proposal** — The current assessment supports feasibility of fundamental
> mechanisms. Product integration and quantitative targets remain open.

The project has code for WAL/CSN, index, cache, snapshots, I/O,
GET, recovery, and scheduling, with [dedicated campaigns](../implementazione/README.md).
The [vertical test](../implementazione/prova-verticale.md) composes one Serie:
it writes and reads, actually interrupts the process, recovers files, publishes
a checkpoint, and rereads values and deletions in new processes, including
after rotation. The test includes new writes with a reconstructed CSN base
and a second crash, for one Serie with ordinary records. This adds
experimental evidence to design plausibility; bootstrap,
coordination, and index replay remain in the fixture.

| Question | Available evidence | Remaining work |
|---|---|---|
| Can the mechanisms be implemented in SBCL? | Product foundations and native functional tests | Complete contract and fault-path qualification |
| Can writing and recovery be composed? | v1/v2 vertical test: SIGKILL, write resumption, and second recovery | Product coordinator, general inventory, Archivio CSN, and admission |
| Are concurrency and isolation demonstrated? | Dedicated component and pool/Serie chain tests | Complete data path under concurrency, MVCC, and multiseries transactions |
| Is full-text search available? | Semantics and architecture approved in [ADR-0053](../adr/0053-ricerca-full-text-indici-invertiti.md), REQ-SEC-003…006 designed | Analyzers, binary format, indexes/deltas, queries, rebuild, and phase 8 qualification |
| Are performance targets achieved? | Microbenchmarks and local campaigns with declared scope | Persistent pool, GC, P99, sustained load, and reference hardware |
| Is v1 complete? | Components and partial integrations | Complete compaction, backup/restore, queries and full text, networking, and roadmap gates |

The next uncertainty reduction requires engine opening and recovery
orchestration, followed by admission of new writes with reconstructed
CSN. The serial test does not justify promises about whole-database performance or
reliability. Results and failed attempts are
preserved in the [campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-vertical-crash/README.md).

Full text adds analysis, delta, dictionary, posting, and
position costs, as well as concurrent build and rebuild. Primary-index
measurements and simple-query targets do not transfer to text
search. Quantitative feasibility remains to assess with the
[dedicated campaign](../13-benchmark.md#ricerca-full-text), updating
[costs](stime-ordine-di-grandezza.md#ricerca-full-text) and
[risks RSK-13/14](registro-rischi.md#rsk-13). NNTP guides part of the corpus;
the engine and indexes remain general-purpose.

<a id="documenti"></a>

## Documents

| Document | Contents |
|---|---|
| [NNTP use case](caso-duso-nntp.md) | Goal of using ArcDocDB as the database for an NNTP server in Common Lisp; needs and boundaries for future assessments |
| [SPK-08, bitmaps](risultati-SPK-08-bitmap-2026-10-08.md) | Counting on byte/u64 arrays, generated code, and local comparison without packing |
| [Critical analysis](analisi-critica.md) | Strengths, internal specification tensions, design gaps |
| [Order-of-magnitude estimates](stime-ordine-di-grandezza.md) | Target plausibility against hardware limits |
| [Risk register](registro-rischi.md) | `RSK-…` risks with exposure, mitigation, and verification |
| [Spike plan](piano-spike.md) | `SPK-…` experiments measuring critical hypotheses |
| [Local results 2026-10-08](risultati-2026-10-08.md) | Serial campaign, raw outputs, optimizations, limitations, and remaining work |
| [Test register](registro-delle-prove.md) | Schema, metadata, preservation of tests, diagnostics, failures, and benchmarks |
| [SPK-04, first campaign](risultati-SPK-04-2026-10-08.md) | Pooled writers, bounded waits, read models, and diagnostic benchmarks |
| [SPK-05, first campaign](risultati-SPK-05-2026-10-08.md) | Actual pread/mmap reads, record validation, allocations, and local comparison |
| [SPK-06, first campaign](risultati-SPK-06-2026-10-08.md) | Finite load model, quotas, and local interference of copies with reads |
| [SPK-07 and SPK-08, progress](risultati-SPK-07-08-2026-10-08.md) | Byte-level crashes, two SC readers, exact masks, and NEON/SWAR benchmarks |
| [SPK-01, reading into buffers](risultati-SPK-01-lettura-2026-10-08.md) | Independent oracle, static validation, high u64, and 80 paired samples |

<a id="criteri-di-valutazione"></a>

## Assessment criteria

Architecture and each alternative in [open questions](../questioni-aperte.md) are judged
against these criteria, in importance order:

| # | Criterion | Question |
|---|---|---|
| 1 | **Correctness** | Are [invariants](../invarianti.md) guaranteed by construction or dependent on discipline? Can the protocol be model-checked? |
| 2 | **Predictability** | What happens to P99 under bursts, compaction, and GC? Are there global stall points? |
| 3 | **Serie isolation** | Which resources remain shared and how are they governed? |
| 4 | **Performance** | Is the hot path compatible with targets? Where is the physical limit? |
| 5 | **Recoverability** | How long does restart take? Is every intermediate state recognizable? |
| 6 | **Space and write costs** | Write amplification, space retained by versions and snapshots |
| 7 | **Implementability in Common Lisp/SBCL** | Can it be done without foreign code, without hot-path allocation, with available GC? |
| 8 | **Complexity** | How many distinct durability and concurrency mechanisms need verification? |

<a id="sintesi-preliminare"></a>

## Preliminary summary

**Foundation.** The architecture is consistent and conservative in choices that matter for
correctness. Append-only storage, immutable segments, and copy-on-write compaction make crash
safety largely *structural*: an immutable file cannot be partially corrupted, and
an operation writing only new files can always be repeated. Physical Serie
independence provides an isolation model that is simple to reason about. The closest relative is the
“append-only log + in-memory key index” model (popularized by Bitcask), extended here with
per-Serie partitioning, MVCC, multi-partition transactions, and compaction split into two
distinct operations.

**What is missing.** The specification defines *behaviors* well and leaves some
*mechanisms* open. Six are structural and must be decided before any disk format:

1. how the primary index reconciles continuous writes, snapshots, and relocation (QA-24);
2. how a record moves from WAL to segment and how many times it is written (QA-02);
3. where the authoritative segment set lives and how swap becomes atomic (QA-04);
4. how commits are ordered at Archivio level for multiseries snapshots (QA-06);
5. what happens to a document between PREPARE and decision (QA-07);
6. which structures live in SBCL's heap and which outside it (QA-18).

**Main risks.**

- *SBCL GC versus P99* (RSK-01): the risk most dependent on the chosen platform and
  least on architecture. It must be measured first.
- *Primary index* (RSK-02): three requirements on one structure; an error here costs
  every operation.
- *Write bandwidth* (RSK-03): the high end of INSERT targets, with 4 KB documents,
  reaches a single NVMe device's physical limit even with one write per record.
- *Multiseries transactions* (RSK-05): correctness of atomic visibility and handling
  PREPARED state without blocking the Serie writer.

**Direction.** Nothing found so far invalidates the architecture. Feasibility of stated
performance nevertheless depends on two checks that cannot be settled on paper — GC and
primary index in SBCL — and clarification of targets (QA-26). Proposed work order is
in the [roadmap](../roadmap.md#ordine-consigliato-parte-restante).

<a id="rivalutazione-2026-10-03"></a>

## Reassessment 2026-10-03

The 26 open questions were closed with ADRs 0013–0030, choosing for each the
pattern with the best known track record ([principles](../principi-di-ingegneria.md)). Consolidated
design is in [architettura.md](../architettura.md) and
[formati-su-disco.md](../formati-su-disco.md). Assessment by criterion:

| Criterion | Before | After | Why |
|---|---|---|---|
| Correctness | Mechanisms undefined | Defined and modelable | Swap = one record (ADR-0018); CSN waits for multiseries transactions being applied (ADR-0020); presumed abort and intents (ADR-0021); invariants INV-F1, INV-V1…V4 |
| Predictability | Depends on GC | Depends on GC, with numeric criterion | Zero allocation and pointer-free arrays (ADR-0024); pause ≤ 5 ms as SPK-02 criterion (ADR-0028); writer never blocked on I/O (ADR-0019) |
| Serie isolation | Good | Good, quantified | One atomic increment per batch is the only shared cost ([architecture](../architettura.md#archivio-coordinamento-minimo)) |
| Performance | Bandwidth at limit with double writes | 1× write | Log-structured (ADR-0013); per-segment indexes without extra writer work (ADR-0026) |
| Recoverability | Restart proportional to data | Proportional to documents | Per-segment hints (ADR-0015); every intermediate state recognizable from control log |
| Space costs | Unquantified | Quantified | ~56 B/index entry; dead records from aborted transactions recovered by CLEAN |
| Implementability in Common Lisp | To verify | Designed without foreign code | System calls via contrib (ADR-0017); own CBOR/CRC/hash (ADR-0027) |
| Complexity | 18 modules, open mechanisms | One mechanism per problem | One data log, one structural log, one codec, one memory policy |

**Risks after decisions.** See [updated status](registro-rischi.md#stato-dopo-gli-adr-2026-10-03).
Quantitatively open: RSK-01 (GC: SPK-02), only the performance part of RSK-02
(SPK-01), residual RSK-03 for concurrent flushes (SPK-03). All others are
mitigated by design or explicitly accepted.

**Design analysis.** After this reassessment, the decisions were reread as
a whole ([design analysis](../analisi-progettuale.md)). Three rows above
were optimistic: **correctness** had five defects (a snapshot could
change views; an ordinary crash could become a fault; the tombstone rule could
resurrect deleted documents; an outcome could be discarded before records it
resolves; CSN could reverse causal order); index **space costs**
applied only at maximum occupancy; **complexity** included more mechanisms than
necessary. ADRs 0036–0045 close findings and reduce mechanisms: one atomicity
point per operation, one record frame, one control-log record type, one
concurrent table. Assessment of the foundation does not change; confidence in details does,
now resting on counterexamples sought and no longer found, which SPK-07 modeling must
confirm.

**Author decisions (2026-10-08).** [ADR-0028](../adr/0028-target-e-obiettivi-di-latenza.md)
(targets and latencies) and [ADR-0030](../adr/0030-scope-v1.md) (scope) are confirmed, including
revisions on minimums, backup, and verifier.

**First executable evidence (2026-10-08).** SPK-07 finds a horizon stall with a four-word
ring and two pending commits: CSN distance can grow without violating
credits. [ADR-0046](../adr/0046-orizzonte-con-registro-limitato.md) replaces it with the
bounded register of pending items only. The corrected model passes the finite configuration;
the negative control retains the counterexample. Spike results remain distinct
from engine requirement verification, whose status remains `progettato`.

**Verdict.** Design is complete at the mechanism level: each module has an assigned
pattern, persistent format, and verification criterion. Phase 0 closes with
execution of SPK-01, SPK-02, SPK-03, and the SPK-07 model, which confirm or replace
quantitative hypotheses (with new ADRs, not tweaks).

<a id="evidenze-locali-2026-10-08"></a>

## Local evidence 2026-10-08

The [first campaign](risultati-2026-10-08.md) completes all five runners: v1 index
at 100,000 documents, GC at 128 MiB with 48 profiles, 12 append/flush cases, finite
models, and CRC/OUTCOME. Inlining the verifier preserves `safety 3` and eliminates
observed benchmark allocations even for maximum CSN. Initial index throughput
does not hide 152 bytes allocated per lookup: this is the first
path to optimize. Directory has costs separate from slots
([ADR-0050](../adr/0050-pubblicazione-e-costi-della-directory.md)).

GC with many active workers and concurrent durable flushes remain constraints
to measure in the real pool. Results are local and v1: they do not close minimums,
v2 gate, larger scales, Linux platform, or complete model.

The v1 index replica at **10 million documents** completes INSERTs,
measures 2.098 M GET/s and 82.21 B/doc payload. Inlining reduces GET
allocations to about 48 B/op in the 100,000 sample; maximum split at larger scale
is 98.827 ms. Profiling, larger scale, and v2 remain: the risk is not closed.

SPK-10 adds separate **v2** checks and measurements: codec, five-word index,
iterative CBOR, and modeled migration. Integration crosses fileheader,
record, document, hint, and index with keys up to 65,535 bytes, depth 100,
and maximum record 16,842,775 bytes. Excluded portions are declared in the
[result](risultati-2026-10-08.md#spk-10--limiti-v2-e-integrazione).
The [structured register](registro-delle-prove.md) also retains failures and
disproved variants; `make check` and CI collect verification outputs and metadata.

> **Proposal** — [SPK-06](risultati-SPK-06-2026-10-08.md) verifies load policy
> on finite traces and separately measures buffered copies concurrent
> with pread reads. The model uses injected signals and does not govern copies in the
> I/O campaign. Device calibration, real feedback, and P99 verification
> during engine CLEAN/MERGE on the reference platform remain open.
