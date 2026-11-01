# Bounded owner-local latency histograms

Increment 1 supplies the fixed-memory latency distribution primitive in `src/metrics/`. The public API accepts injected integer durations and returns inclusive percentile intervals, range status and completeness. It retains counts, not every sample. P50/P95/P99/P99.9 use exact nearest ranks. The default geometry has 3,809 unsigned 64-bit cells: **30,472 bytes of counter payload**, plus headers and metadata. Positive regular intervals have inclusive relative span below 1/128 at default precision; overflow has a separate explicit interval and no relative-precision guarantee.

See the [stable contract](../../../docs/implementazione/istogrammi-latenza.md), [preregistered method](../../../docs/implementazione/istogrammi-latenza-metodo.md) and [static reviews](archive/method/reviews.lisp). Updates belong to the constructing thread. Captures copy mutable state and allocate separately. A thread-local dynamic scope rejects reentry; a fault marker set before mutation prevents capture after an interrupted update until owner reset. No current engine, scheduler or Unix request path is instrumented. REQ-OBS-001/002 remain designed in their full scope.

## Qualification

Qualified product source is `46d254e8025c70861adc397be4a559eb4b07a543`. SBCL 2.6.9 strict core/local/test compilation and all **23 dedicated metrics cases** passed. The complete product catalog passed **2633/2633 cases**, with no failures, skipped or unexecuted cases. It includes the existing engine and separate-process crash/reopen suites; their passage does not extend the histogram component's own scope. A supplementary SBCL 2.6.10 strict compilation and the same 23 metrics cases also passed; the complete product catalog was not repeated on 2.6.10.

Deterministic tests cover every supported precision and power-of-two boundary, an independent dyadic-band oracle, rational nearest ranks against sorted populations, clipped maxima, the regular/overflow boundary, invalid arguments, full-cap arithmetic, sticky saturation, independent/reset snapshots, foreign owners, reentry and interrupted mutation. Full-cap tests use internally consistent synthetic populations rather than pretending to perform 2^60 observations.

Four warmed allocation assertions passed on each runtime: 100,000 regular observations, 100,000 above-range observations, 100,000 saturated attempts and 10,000 reusable reset windows. Each asserted **zero bytes consed** inside its measured interval with ordinary GC enabled. These observations exclude construction/capture/assertion allocation and do not prove allocation freedom for every workload. Coverage instrumentation alone excludes that allocation case; every normal catalog keeps it.

The separately recorded audit passed legal checks, lint and negative fixtures, source-recording/mutation-runner self-tests, traceability, links, full-text checks, evidence/collector self-tests, all eleven spike correctness checks and the CI self-test. The historical-evidence integrity command also passed. Original command states and outputs remain in the [closed archive](archive/archive-index.lisp); [qualification data](archive/qualification.lisp) summarize them without changing their states.

## Repeated update-loop cost

Both runtime campaigns ran in series after correctness work on the available Apple M4/macOS ARM64 host. Each contains 60 windows: precisions 4/7/10 × four scenarios × five repetitions × 1,000,000 iterations, including 15 million baseline-loop iterations and 45 million public update calls. Fresh fixtures, 1,024-operation warmups, rotated scenario order and full GC before each window follow the method. Timing uses two batch clock readings; the nominal clock quantum is recorded, not calibrated effective resolution.

The tables show **median [minimum–maximum] elapsed ns per loop operation** across all five windows. Cost includes dispatch, public guards, driver tallies and checksum. The baseline is retained and not subtracted. These are component-loop averages, not individual latency percentiles or database throughput.

### SBCL 2.6.9

| Precision | Baseline loop | Accepted regular | Above range | Saturated attempt |
| --- | ---: | ---: | ---: | ---: |
| 4 | 4.32 [4.32–4.32] | 15.08 [15.02–15.12] | 14.75 [14.56–14.90] | 13.20 [13.19–13.32] |
| 7 | 4.32 [4.31–4.33] | 14.99 [14.86–15.18] | 14.93 [14.64–15.16] | 13.07 [12.92–13.32] |
| 10 | 4.32 [4.31–4.32] | 14.89 [14.88–15.42] | 14.56 [14.51–14.95] | 13.13 [12.96–13.21] |

### SBCL 2.6.10

| Precision | Baseline loop | Accepted regular | Above range | Saturated attempt |
| --- | ---: | ---: | ---: | ---: |
| 4 | 4.42 [4.34–4.47] | 15.30 [14.73–15.38] | 15.19 [14.80–16.22] | 13.86 [13.36–15.43] |
| 7 | 4.38 [4.33–5.10] | 15.89 [15.46–16.38] | 16.05 [15.23–16.17] | 13.51 [13.30–16.62] |
| 10 | 4.44 [4.32–4.47] | 15.51 [15.46–15.97] | 15.22 [14.88–16.75] | 13.73 [13.31–14.36] |

Across the 120 timed windows, bytes-consed deltas range from 0 to 0 bytes (whole-process counter, not RSS). Every repetition, both absolute clock/byte readings and all outcomes remain in [2.6.9 observations](archive/observations/bench-269.lisp) and [2.6.10 observations](archive/observations/bench-2610.lisp). A deliberately retained 1 MiB allocation provides a positive sensor control. No fastest-window selection, outlier removal, baseline subtraction or cross-runtime speedup claim is made.

## Preserved failures and limits

The first focused command on source `c4616d1` failed after warning-free compilation: the test macro oracle counted incidental cons tails as forms. Commit `46d254e` corrected only that oracle, added positive/negative traversal checks and reran all 23 metrics cases successfully; product code was unchanged. The original failed record remains failed in the archive.

The first supplementary 2.6.10 invocation failed before loading the project: the 2.6.9 recording wrapper passed its `SBCL_HOME` to the other runtime, selecting an incompatible core. The fresh retry explicitly selected the matching 2.6.10 home and core; it required no installation or product change. Both the failed invocation and successful retry are preserved. The supplementary benchmark uses that same explicit runtime/core selection.

The benchmark driver's deliberate missing-`:completed` fixture exited 1 with `:missing-field`, as required. Its command remains failed; the [separate detection assessment](archive/expected-negative.lisp) records why that outcome satisfies the control. The driver's self-test also passed parser, arithmetic, injected-sensor, malformed-row and public-API checks.

Local host load is uncontrolled. These results qualify neither Linux nor other hardware, C1/MC/DC, power loss, universal allocation bounds, multiseries aggregation or engine performance. Counters, coherent aggregation, merged-distribution percentiles and diagnostic reports are subsequent increments. The component defines the adapter boundary but does not choose runtime publication or sampling cadence.

Large retained records are gzip-compressed losslessly with byte counts and SHA-256 descriptors. Compiled caches are excluded. Read data with `tools/read-evidence.lisp`; do not load result files as code. Closure and final documentation checks are recorded separately under `receipts/` to avoid a self-referential archive.

The cleanup receipt in `cleanup.lisp` records removal of 4,947 generated cache files,
totaling 101,085,950 logical bytes. Original evidence, shared caches and other
worktrees were preserved. This is not a measurement of physical free-space change.
The finite `closure.lisp` receipt hashes all preceding published files and
excludes itself.
