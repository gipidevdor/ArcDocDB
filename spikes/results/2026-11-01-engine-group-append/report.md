# Bounded M1 group append

M1 now combines independently sealed small groups into one append entry using
its existing exclusive scratch. Eight-operation groups fitting 64 KiB use
**8→1 append entries**, with the same individual CSNs/SEALs, one canonical
strong flush and FIFO publication. No additional payload buffer is allocated.
Measured managed allocation remains **79.98 bytes/write** in all six cases.

The same-file alternating diagnostic observes **57.2–67.4% lower append CPU**
in the three small-group cases. This is a scoped observation: durable throughput
varies in both directions and no stable end-to-end speedup is established.

## Implementation

[ADR-0082](../../../docs/adr/0082-bounded-group-append.md) adds optional borrowed
`:buffer` to the generic WAL executor; its default remains sequential. Before
log acquisition, validate type and reject aliasing with every batch. Coalescing
requires more than one batch and total bytes no greater than the minimum of
scratch length, 65,536 bytes and the immutable file-transfer limit. Single
batches, insufficient scratch and larger groups select the sequential path
before I/O. An unused oversized scratch does not force fallback.

After existing complete group acquisition/preflight, recheck every batch start
and the final copied sum. One `append-esatto` entry writes byte-identical frames
and SEALs; the exact returned frontier precedes written states. Positive short
writes use existing bounded completion. EINTR and other syscall errors fault
without retry. An append entry can require multiple native writes: entry counts
are not measured syscall counts.

The unwind guard is installed before acquisition and faults only an incomplete
group that owns the log. Both paths preserve the original error/nonlocal
transfer and retain log/group/batch ownership. Unacquired rejections preserve
normal state; there is no fallback after I/O, uncertain retry or early response.
The caller retains exclusive scratch ownership until return; no reference is
retained by the WAL. Each operation's SEAL remains its durable atomicity point.

M1 borrows its existing scratch after serial recovery/maintenance. Index choice,
automatic RAM/paged behavior, group limit eight, root/token/location order,
disk/wire formats and the Unix collector remain unchanged. The
[two author readings](review.md) cover bounds, ownership, failure handoff,
byte routing and lifecycle; this is not independent external review.

## Qualification and source identity

- [Full check-core on SBCL 2.6.9](full-check-2.6.9/report.lisp) and
  [strict product build/tests on 2.6.10](strict-2.6.10/report.lisp) pass with
  product warnings treated as errors. Each runtime passes 57 WAL methods and
  178 engine methods, including all existing worker, index, lifecycle and Unix
  suites. All eleven spikes and repository/CI/evidence gates pass.
- [Ten focused new methods](focused/report.lisp): nine WAL methods and one
  real engine method. They cover exact/short/zero/oversized scratch, each alias,
  independent transfer caps, exactly 65,536/65,537 bytes, one batch/default path,
  short writes, hard errors after progress, arbitrary errors/nonlocal exits,
  before/after acquisition, damaged start/sum/return, flush failure and reuse.
  Real engine cases check both formats and all three primary profiles with
  2,048/60,000-byte values, scratch identity/overwrite and cold reopen/new CSN.
- The byte-cut model checks **1,632 combinations**: both formats, all 272 cuts
  through three mixed PUT/tombstone/multi-PUT batches, and chunks 1/7/full.
  Independently computed ends/counts and exact prefix bytes check recovery.
- The real group crash matrix passes on each runtime: **36 scenarios,
  108 children, 72 SIGKILLs**. Cuts now use exact cumulative batch/SEAL offsets
  in the coalesced buffer; the same recovery-prefix predictions remain in force.
- [Complete documentation](documentation/report.lisp) passes: 557 source
  documents, 1,129 HTML pages, 86,046 links/anchors, 1,891 source docstrings;
  54 packages, 688 exported bindings and 625 prose contracts. Traceability has
  141 requirements, 71 invariants, 13 FI and 82 ADR, with zero errors.

The [validator](validate.lisp) checks complete markers, zero exits, stable
inventories and driver hashes. Three historical baseline campaigns and the C4
candidate have the same **1,636 source blobs** as the preceding qualified
ACTIVE integration. All eight final qualification/measurement campaigns have
identical **1,640 source blobs**. These inventories include tracked/untracked
product, tests, tools and docs, excluding only result artifacts. See
[source identity](source-identity.lisp). The supplemental paired diagnostic
independently verifies equality with that exact qualified inventory and retains
driver/expanded-identity SHA-256 values in [paired metrics](paired-metrics.lisp).

Base commit: `8a808a3c098cd7766b5aa53013de414fd8998ca1`.

## Measurements

The [method](method.md) distinguishes preregistration, the C4 candidate and the
explicit post-result follow-up. The historical engine/Unix/allocation baseline
is the preceding ACTIVE campaign's final measurement on exactly the unchanged
base sources. The three drivers are byte-identical; final runs use this private
directory and never overwrite old logs. Setup, seed, full GC, aggregation and
full-value checks remain outside timing. Returned CSNs, values, flush counts,
append counts and cold reopen are checked. Host load, thermals, core placement,
device state and page cache are not controlled.

| Campaign | Final measured work | Result |
|---|---|---|
| Allocation | 6 cases × 4,096 writes; legacy/resident/paged, width 1/8 | 327,600 counter bytes each, unchanged from baseline; zero persistent-builder calls |
| Engine writes | 48 cases × 5 × 128 writes; both formats, 2,048/60,000 bytes, widths 1/2/4/8 | historical throughput ratios 0.9048–1.0668 |
| Unix writes | 8 cases × 5 × 128 writes; eight clients, both formats, resident/paged, limit 1/8 | historical throughput ratios 0.9402–1.1270 |
| Same-code executor | 20 cells × 5 × 128 writes = 12,800 strong writes; 128/2,048/6,144/8,192/60,000 bytes, widths 1/8, two options | small-group append CPU ratios 0.3677–0.4182; no stable wall gain |
| Alternating same-file follow-up | 4 pairs × 2 options × 7 × 512 writes = 28,672 strong writes | small-group median paired append CPU ratios 0.3258–0.4279; wall ratios 0.9896–1.0136 |

Historical ratios are final/baseline medians of five repetitions. Complete
engine/Unix tables and allocation counters are in [comparison.lisp](comparison.lisp),
derived from [final metrics](metrics.lisp) and the unchanged
[baseline metrics](../2026-11-01-engine-active-directory/metrics.lisp).
[print-results.lisp](print-results.lisp) reproduces human tables.

Primary same-code comparison, eight-operation groups:

| Value bytes | Sequential append CPU µs/group | Buffered append CPU µs/group | Whole CPU ratio | Throughput ratio |
|---:|---:|---:|---:|---:|
| 128 | 73.250 | 26.938 | 0.8122 | 0.9711 |
| 2,048 | 64.563 | 27.000 | 0.7574 | 1.0052 |
| 6,144 | 85.375 | 33.625 | 0.7699 | 0.9869 |
| 8,192 | 91.625 | 97.188 | 1.0263 | 1.0011 |
| 60,000 | 151.750 | 151.250 | 0.9970 | 0.9810 |

The last two sizes exceed the coalescing cap and use sequential append. The
single-write controls also use the same path: their CPU ratios vary widely
(for example 0.6502 whole CPU at 2,048 bytes), so the primary timing cannot
establish causal improvement or non-regression by itself.

The follow-up keeps one live engine/file per case, reverses first option by
repetition, and reserves 8,192 records/64 MiB before timing to avoid rotation.
Every window still performs ordinary strong writes and exact checks; no sample
is replaced. It pairs adjacent repetitions and reports medians of paired ratios:

| Value bytes / width | Sequential append CPU median µs/group | Buffered median µs/group | Paired append CPU ratio | Paired whole CPU ratio | Paired throughput ratio |
|---|---:|---:|---:|---:|---:|
| 128 / 8 | 123.813 | 37.641 | 0.3258 | 0.6512 | 1.0136 |
| 2,048 / 8 | 116.313 | 38.531 | 0.3457 | 0.7011 | 0.9988 |
| 6,144 / 8 | 135.609 | 55.531 | 0.4279 | 0.7721 | 0.9896 |
| 2,048 / 1 control | 35.184 | 36.564 | 0.9668 | 0.9670 | 0.9679 |

Absolute columns are separate medians; paired ratios are not their quotient.
All 21 small-group paired append ratios are below one. The single-write control
still has noisy individual pairs (append ratios 0.5396–1.1747), despite a
near-one median; this is not an isolated-host significance test. CPU is measured
with `get-internal-run-time`, including the append observer/entry-counter costs.
Whole-CPU and wall observations remain separate. See
[raw follow-up](paired-benchmark/report.lisp) and [paired metrics](paired-metrics.lisp).

The preceding baseline's [flush diagnostic](../2026-11-01-engine-active-directory/sync-metrics.lisp)
placed 88.53–98.38% of median wall time in canonical strong flush. The current
data support reducing append work while retaining durability; they do not
demonstrate a general durable-throughput gain. In particular, the historical
engine/Unix matrices contain slower cases as well as faster ones.

Managed allocation is unchanged in all six 4,096-write windows. The roughly
80-byte immutable root remains; no zero-allocation, live-heap, RSS or GC-pause
improvement is inferred. The 64 KiB threshold bounds copying and is not a
universal optimum. These warm eight-key local cases do not qualify loaded
large-keyspace tails, concurrency, unexecuted Linux, full C1/MC/DC or physical
power loss.

## Retained development evidence

The [review](review.md#development-diagnostics) documents the failed inlined
native-counter experiment, missing test parenthesis and initial product bound
selection defect. The latter fell back safely to sequential append; `min` and
independent oversized-scratch/transfer-cap tests correct and detect it. Original
failed records and relevant driver/helper variants remain retained. The C4
candidate runs on the base revision and is not production qualification.

[Initial](initial-archive-map.lisp), [final](final-archive-map.lisp) and
[late](late-archive-map.lisp) maps identify the closed raw commands. Copy receipts
and verified gzip expansion preserve original bytes, including diagnostics and
whitespace. Final self-recording `closure.lisp` verifies all retained copies;
`cleanup.lisp` records removal of only owned regenerable builds, spike outputs,
exact per-worktree caches and the two named failed-test fixtures. Shared Git
storage, the primary checkout and other chat paths remain outside cleanup.
