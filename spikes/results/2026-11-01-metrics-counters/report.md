# Owner-local counters and coherent metric sums

Increment 2 adds completed-request/error counts, cache events, WAL append bytes, flush/group counts, request/flush latency distributions and sampled request/WAL queues. One owner updates a fixed partition; an immutable capture contains the corresponding counters and distributions. Exact rates use supplied window endpoints and clock scale. Aggregation sums compatible histograms before percentile queries and preserves original partition provenance through hierarchy, rejecting duplicate contributions and mismatched windows.

The [contract](../../../docs/implementazione/metriche-serie.md) and [preregistered method](../../../docs/implementazione/metriche-serie-metodo.md) specify limits and integration. At default geometry a partition owns **61,056 bytes of counter/queue/histogram payload**, excluding metadata, headers and allocator overhead. Retained snapshots and original-source counts are separately bounded by the caller; an aggregate admits at most 4,096 original partitions.

## Consolidated behavior

Capacity rejection closes only the affected event family until reset and preserves an accepted prefix. Counts and their latency observation are admitted together. Incompleteness propagates per counter and distribution; aggregate overflow fails rather than truncating. Unknown queues remain unknown. The sum of source queue peaks is labeled an upper bound, rather than an observed global peak.

Reset requires a strictly newer start. Normal reset preserves current queue samples and restarts peaks there; recovery of interrupted state forgets uncertain queues. Read-only guarded setup validates mutable window bounds before the mutation marker, and reset reads original fault state under that same guard. Failed preconditions preserve prior health. Capture failures leave valid sources unchanged; interrupted mutation blocks updates/capture until owner recovery.

## Qualification and source identity

Product source **`4aab6777b828b475803c77810e8e9a24149ac1f2`** passed strict SBCL 2.6.9 core/local/test compilation, all **72 metrics cases**, and the complete **2682/2682 product catalog**, with no failures, skips or unexecuted cases. The metrics registry comprises the original 23 cases, 16 merge cases, 32 counter/isolation cases and one eight-path allocation case. Supplementary SBCL 2.6.10 strict compilation and the same 72 cases also passed; the complete catalog was not repeated there.

The tests include independent raw-sample percentile/count oracles, configuration mismatches despite equal array lengths, coherent event populations, sticky rejection including smaller later groups, reset/retained-snapshot isolation, unknown queues, nested provenance overlap, original-source budgets, exact rational rates, foreign owners and abnormal mutation. Near-2^60 arithmetic uses explicitly synthetic consistent populations. Four guarded-setup cases exercise original fault state, marker order, rejected preconditions, unwinding, reentry and single macro expansion.

The warmed allocation test recorded **zero bytes in all eight spans** on both runtimes: 100,000 operations each for normal/error requests, cache, append, flush, queue and saturated requests, plus 10,000 reset operations. Ordinary GC stayed enabled. Construction/capture/report allocation was outside those spans. Coverage alone excludes the allocation cases; normal runs retain them.

Legal, lint, source-recording, trace, link, full-text, evidence-tool, eleven spike correctness and CI checks passed in the recorded audit groups. Historical-evidence integrity passed separately. The [closed original archive](archive/archive-index.lisp) and [qualification data](archive/qualification.lisp) preserve command outputs, exact identities, statuses, measurements and failures.

## Review finding and C4 execution failure

Independent static review found mutable window/fault decisions before owner-scope entry: a same-owner callback could invalidate those decisions before capture/reset. The guarded pure prelude and in-scope capture check fixed that finding before the first compilation. Original open finding and scoped resolution artifacts remain in the archive; this is static interleaving evidence supported by the later scope tests, not a claim of exhaustive asynchronous-interrupt qualification.

The initial audit failed in an existing snapshot mutation-driver process self-test. Its generic `sbcl` child selected 2.6.10 from PATH while inheriting the recording process's 2.6.9 home/core; the child exited 1 before fixture code, instead of producing the expected signal. That failed command and actual child runner/stdout/stderr remain unchanged in the archive.

C4 follow-up **`09463388992bd0fad91ca36d3aa7418187c34ad2`** makes both snapshot/reader drivers use the current absolute runtime path. Product, tests, ASDF definition and counter benchmark driver are byte-identical to the qualified variant. Actual signal-9 and exit-7 self-test children passed on both runtimes, including a reference run with an explicitly conflicting PATH recorded in argv. These process self-tests do not stand for complete product mutation campaigns.

The publication collector encountered the same unqualified-runtime issue at its
final external closure check, after copying and indexing all files. Its failed
record and failed checker log remain preserved. The common checker subsequently
verified that existing archive's closed inventory without rewriting any original.
Follow-up `ecee2cd` applies the same current-runtime rule to the collector; its
self-test passed with an explicitly conflicting PATH. Final receipts include
the original failure, successful independent verification and a comparison of
their process metadata. The [source identity](archive/source-identity.lisp)
separately verifies identical product/tests/ASDF/counter-driver inputs across
the full qualification and both timing campaigns.

## Repeated event-loop costs

Each runtime campaign ran serially after correctness work on the available Apple M4/macOS ARM64 host. Eight scenarios × five repetitions × 1,000,000 iterations give **40 windows per runtime**, 80 total, including 10 million baseline iterations and 70 million public event calls. Separate warmed fixtures, fresh measured partitions, preallocated working sets, rotated order and full GC before each window follow the method. Two batch clock readings enclose each loop; nominal tick quantum is retained without a calibrated effective-resolution claim.

Values below are **median [minimum–maximum] elapsed ns per iteration**, retaining all five windows. They include public guards, dispatch, driver tallies and sink. Baseline is retained without subtraction. Synthetic snapshot endpoints validate rate arithmetic and are not benchmark timing coordinates.

| Event | SBCL 2.6.9 | SBCL 2.6.10 |
| --- | ---: | ---: |
| Baseline loop | 5.84 [5.76–6.03] | 5.77 [5.75–5.82] |
| Completed request | 19.67 [19.66–20.07] | 19.82 [19.63–20.49] |
| Error request | 20.61 [20.29–20.75] | 20.28 [20.13–21.41] |
| Cache hit | 13.26 [13.14–13.60] | 13.09 [12.99–13.11] |
| WAL append, 16 bytes | 13.80 [13.77–14.65] | 13.73 [13.63–14.85] |
| WAL flush, 4 records | 21.12 [20.94–21.59] | 20.81 [20.76–22.12] |
| Request queue sample | 15.98 [15.92–16.13] | 15.96 [15.43–16.16] |
| Saturated request | 13.37 [13.31–13.51] | 13.28 [13.13–14.47] |

Across all 80 windows, measured whole-process bytes-consed deltas range from **0 to 0 bytes**. All repetitions and both absolute sensor readings remain in [2.6.9 observations](archive/observations/bench-269.lisp) and [2.6.10 observations](archive/observations/bench-2610.lisp). These are component-loop costs, not database throughput, individual latency percentiles, RSS or universal allocation guarantees.

The C4 driver self-test passed CLI, exact/injected sensor arithmetic, zero-tick handling, counter regressions, row/checksum corruption, a retained positive 1 MiB allocation control and cold public-API checks. The deliberate missing-`:completed` fixture failed with exit 1 and the specified `:missing-field` diagnostic. Its original command remains failed; the [separate assessment](archive/expected-negative.lisp) records expected detection without rewriting that outcome.

## Limits and retained evidence

Completeness concerns valid submitted-event accounting, not uninstrumented operations or missing producers. Matching supplied intervals and coherent immutable sums do not create a globally atomic cut across workers. Safe publication, truthful clock cuts and source identities remain adapter obligations. Engine/Unix instrumentation, diagnosis reports and the full REQ-OBS-001/002 exposure remain subsequent work. Local measurements do not qualify Linux, concurrency scaling, power loss, C1/MC/DC or database performance; host load is uncontrolled.

Large records are losslessly gzip-compressed with byte counts and SHA-256 descriptors. Compiled caches are excluded. Use `tools/read-evidence.lisp` to read data; do not load result records as code. Final publication checks and cleanup receipts are kept separately under `receipts/`; the finite closure receipt excludes itself.

The cleanup receipt in `cleanup.lisp` records removal of 4,143 generated cache
files, totaling 82,279,639 logical bytes. Source, original evidence, shared
caches and other worktrees were preserved. This is not a measurement of
physical free-space change.
