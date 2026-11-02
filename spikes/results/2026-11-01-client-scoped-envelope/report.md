# Scoped immutable Unix response envelopes

Base `d6c69eec7d531adcd2e2bd7211386c0d4f00dcd8`.
[Preregistered method and pre-edit refinement](method.md),
[two C1 readings and decisions](review.md), [public API](../../../docs/lisp-api.md).

The synchronous client validates and consumes each immutable response envelope
within the call, after frame I/O. The complete public validator is shared; public
decoding and queued server requests retain fresh persistent envelopes. ID remains
a full u64, represented by two read-only u32 fields with an explicit full-ID
guard. No slot becomes mutable, wire view escapes or durable behavior changes.

The native `poll` wrapper is also inlined within its existing I/O pin scope.
The ABI, bounded wait, count/errno and ownership checks do not change. The
actual native helper now avoids temporary SAP boxing, with an allocating
out-of-line control retained in the C4 experiment.

## Final public Unix comparison

Apple M4, SBCL 2.6.9, format 2, actual resident/paged mode checked before READY.
The final paired campaign completes **16 cases, 160 windows, 3,600,000 groups
and 16,200,000 documents**. There are **80 scoped windows and 80 heap-control
windows**, 1,800,000 groups and 8,100,000 documents for each variant. All scoped
windows report **zero client allocation**; the final heap control reports a
median 117.96 bytes/group in every case. This is process-counter measurement,
not exact per-object accounting or a universal nonallocation guarantee.

Both variants use the final I/O boundary, validator and immutable representation.
The heap control compiles the frozen original client finisher with its identical
full FType under a C4-only alias. All owners are parked for selector changes;
the same connected clients/server are reused and the final implementation is
restored at exit. Warmup and all cold construction are outside measurement.
Each owner performs five paired 5,000-call windows, with alternating order and
a full GC before each window, outside its timing.

MB/s is decimal useful document payload per complete window, including byte
validation and synchronization. Gain is the median of five paired throughput
ratios, not the ratio of separately computed MB/s medians.

| Mode | Members | Bytes/member | Clients | Heap → scoped MB/s | Paired change |
| --- | ---: | ---: | ---: | ---: | ---: |
| resident | 1 | 1,024 | 1 | 30.70 → 30.58 | −0.39% |
| resident | 1 | 1,024 | 8 | 123.03 → 123.36 | +0.39% |
| resident | 1 | 60,000 | 1 | 506.82 → 509.38 | +0.40% |
| resident | 1 | 60,000 | 8 | 1,993.84 → 2,016.40 | +1.13% |
| resident | 8 | 1,024 | 1 | 127.18 → 127.24 | +0.06% |
| resident | 8 | 1,024 | 8 | 321.22 → 319.29 | −0.60% |
| resident | 8 | 7,500 | 1 | 431.28 → 431.15 | −0.21% |
| resident | 8 | 7,500 | 8 | 1,335.95 → 1,337.66 | +0.12% |
| paged | 1 | 1,024 | 1 | 31.11 → 30.48 | −1.97% |
| paged | 1 | 1,024 | 8 | 111.70 → 109.69 | −2.90% |
| paged | 1 | 60,000 | 1 | 505.26 → 507.34 | +0.32% |
| paged | 1 | 60,000 | 8 | 1,964.32 → 1,963.52 | −0.04% |
| paged | 8 | 1,024 | 1 | 107.78 → 108.26 | +0.42% |
| paged | 8 | 1,024 | 8 | 222.31 → 221.34 | −0.33% |
| paged | 8 | 7,500 | 1 | 395.03 → 395.61 | +0.52% |
| paged | 8 | 7,500 | 8 | 1,060.32 → 1,059.27 | +0.04% |

Observed paired changes span −2.90% to +1.13%; this campaign establishes no
uniform throughput improvement or statistical equivalence. The demonstrated
benefit is removal of reported hot client allocation in these windows. The
7,500-byte rows contain 60,000 bytes per group, not eight 60,000-byte documents.

All raw latencies, exact nearest-rank quantiles, CPU/allocation/GC counters,
returned-byte totals, final CSNs, private ID counts, child outcomes and five
frozen driver/source hashes are independently checked. Public-call adapter
latency stops before byte validation; complete-window throughput/counters include
it. Server CPU is separate. No artificial arrival gate or delay is used.

These are hot-data local closed-loop observations, not physical disk bandwidth,
natural arrivals, concurrent engine readers or production SLOs. The measured
IDs fit fixnums and documents are binary-string CBOR values. Large numeric
conversions, allocating legacy APIs and errors retain no general nonallocation
promise. Per-window full GC also means uninterrupted client GC behavior is not
qualified; server envelopes remain persistent and server nonallocation is not
claimed.

## Controls and retained earlier variants

The pre-edit public grouped-into baseline completes 16 cases, 80 windows,
1,800,000 groups and 8,100,000 documents on the actual original finisher. Its
source inventory is the immutable base. It is distinct from final paired
calibration, whose two choices share the final representation, validator and I/O.

The first uninlined paired comparison also completes 3,600,000 groups. It has
variable/mixed throughput and about 13 reported bytes/group on its scoped path.
`variant-uninlined.lisp` retains exact copies of its eight changed source files.
Compiler disassembly and an injected-I/O public PING control show that its view
and consumer are already scoped; the residual is separated from this layer.

A native zero-timeout poll probe with one/nine disabled FDs reports 786,432 bytes
across 50,000 original calls, versus zero with the equivalent inline entry. The
final fixture exercises the actual product entry and retains a deliberately
out-of-line allocating control. It acquires no descriptors and performs only
bounded zero-timeout calls.

The final product parser/scalar fixture completes 2,000,000 calls in 40 windows;
all 20 scoped windows report zero allocation, with a persistent allocating
control. It excludes transport and document output. The injected-I/O public
PING fixture also reports zero for 50,000 scoped calls with exact send/receive/ID
counts; it does not measure kernel/socket performance. The complete real Unix
campaign above provides the end-to-end observation.

Original raw-slot and inline raw-slot prototypes retain allocation on ARM64.
Those disproven hypotheses, the bootstrap/PATH failure reproduction and fixture
compilation/reader failures remain distinct raw records. The initial wire source
is retained with the exact Git blob from its failed compilation record. No
failed prototype or fixture is counted as product qualification.

## Functional qualification and closure

The final focused run passes **361 I/O/native/wire/actor cases**. Ten methods are
new: six wire lifetime/ID/allocation methods, three client GC/reuse methods and
one native readiness allocation method. They include full u64 boundaries,
immutable persistent objects, malformed frames before consumer entry, nested
scope/GC, original error/throw propagation, independent copies after stack reuse
and rejected BUSY reentry. Existing native pipe/HUP, timeout/EINTR/error, all
negotiated operations, partial/coalesced I/O and late-copy failure checks remain.

Final strict qualification passes **460 cases in nine suites on each of SBCL
2.6.9 and 2.6.10**, with exact planned/started/passed inventories. It includes all
I/O cases, the four CBOR suites and local wire/native/actor/process suites.
Existing real-service recovery cases cover both formats, resident/paged storage,
strong writes and SIGKILL/reopen. Earlier 299-case qualifications belong to the
uninlined variant and remain separate.

`make check SBCL=/opt/homebrew/bin/sbcl` passes with stable source snapshots.
Its original nested `check-core` record retains the forced warning-as-error core
build and complete test run, legal/static/trace/link/fulltext/evidence checks,
all eleven registered spikes and CI self-tests. This is a fresh full repository
check, in addition to the two exact selected qualifications.

`make docs` also passes: hash-locked setup, rendered manual tests, compiled
export/docstring comparison and the actual Unix round-trip example. Raw-result
Markdown is outside the generated manual's source corpus.

The post-archive link check passes **837 files and 4,139 links**, with none broken.
`source-identity.lisp` binds all **1,763 source files** to the current focused,
isolated, native, Unix, two-runtime, full-repository and documentation receipts.
It separately validates the original base/source copies and the exact failed
initial wire blob. The runtime delta is exactly ASDF's test inventory, the native
readiness inline declaration and the two local client/wire files. Engine, other
I/O, WAL and index source bytes are unchanged. The initial command/support archive
retains **524 files**.

`closure.lisp` verifies **636 archived command, child-log and source-variant
files** by their original byte hashes; its receipt records 479 compactions.
The retained tree occupies about 21 MiB locally. `tail-archive-data.lisp` retains
the four completed archive/identity/closure command receipts (eight copies).
Raw diagnostics and failed variants retain their exact original bytes.

`cleanup.lisp` removes **217,202,592 logical bytes in 15 owned regenerable paths**:
this worktree's build/spike outputs and its exact SBCL 2.6.9/2.6.10 cache prefixes.
This is a logical inventory, not a physical-free-space measurement. Other
worktrees/branches and shared Git storage are untouched.
