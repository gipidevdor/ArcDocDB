# Latency histograms — preregistered verification method

**2026-11-01, before execution.** This method covers the component contract in
[bounded latency histograms](istogrammi-latenza.md) and the C4 driver
[metrics-histogram-bench.lisp](../../tools/metrics-histogram-bench.lisp).
Source writing and static review are not quantitative evidence.

## Scope and execution gates

Freeze source after two author readings and independent review. Close writing
and reviewing agents before compilation or diagnostics. Each command uses a
fresh exclusive `tools/record-command.lisp` output directory, preserving argv,
environment, actual source blobs, stdout/stderr, exit code and failures.
Do not edit source or documentation while a recorded command is running.
Trace-matrix generation precedes the freeze. Any intentional matrix change is
retained with the generator's actual source-consistency status; generation is
not a frozen-source qualification run.
All subsequent compilation/test/measurement commands use the committed inputs.

Use private, distinct hierarchical ASDF caches inherited by child processes;
never change user configuration. The reference toolchain is SBCL 2.6.9 on the
available macOS ARM64 host. A separate SBCL 2.6.10 run is supplementary when
available. Run measurements in series, after correctness checks finish.
External machine load is uncontrolled; local measurements do not qualify Linux,
other CPUs, power loss, C1/MC/DC, or database performance.

## Correctness and detection controls

Run strict core/local/test compilation, the complete metrics suite and the
single catalog of product tests. Warnings and style warnings fail, except the
existing allowance for recognized SBCL/ASDF redefinition warnings. Register the
new suite in CI; the allocation case stays in every normal run and is excluded
only from coverage instrumentation, like the existing allocation cases.

The deterministic fixtures cover:

- Independent bucket enumeration by dyadic bands, exact low values, supported
  precisions, every power-of-two transition, configured-maximum clipping and
  adjacent regular/overflow values that otherwise share an index.
- Exact rational nearest ranks and P50/P95/P99/P99.9 intervals against sorted
  synthetic observations, including empty, zero, small and large populations.
- Invalid public arguments before mutation, configuration budgets, duration
  and count limits, sticky saturation, overflow-bin population, reset and
  independence of immutable snapshots.
- Different owners and Serie, bounded joins and safe publication, reentry
  rejection, thread-local scope isolation and interrupted-mutation recovery.
  Macro expansion/single evaluation and typed deterministic failure injection
  exercise the same owner-scope implementation as record/reset/capture.
- Synthetic, internally consistent populations near 2^60−1 validate full-cap
  arithmetic without pretending that 2^60 physical observations were executed.
- Warmed public update paths measure bytes consed for regular, above-range,
  saturated and reset-window operations with ordinary GC enabled. Construction,
  captures, assertions and formatting stay outside those intervals. A zero
  observation is scoped to that process, toolchain and workload.

Run lint, traceability, links and CI self-tests. The complete evidence/tool
audit and spike correctness checks remain separate from benchmark measurements.

## Benchmark budgets and workloads

Accepted driver modes are exact:

```text
--bench [--iterations N] [--repetitions R]
--self-test
--negative-fixture
```

The benchmark accepts canonical ASCII decimal integers, no signs, whitespace,
leading zeros, suffixes, duplicate or unknown options. Iterations are
1..10,000,000, default 1,000,000; repetitions 1..20, default 5. Its maximum
work is bounded, not a wall-time guarantee. The normal campaign contains
3 precisions × 4 scenarios × 5 repetitions = 60 windows of one million calls.

Precisions are 4, 7 and 10, with maximum 60,000,000,000 nanoseconds. Preallocated
256-element vectors select deterministic low/transition/long-duration anchors
or durations just above that maximum. Scenarios are a baseline loop, accepted
regular observations, accepted above-range observations and cap-saturated
rejections. Each repetition owns fresh fixtures; scenario order rotates.
The cap case prefills one zero observation and rejects subsequent attempts.
Other cases have a 20,000,000 count cap. Warmup is fixed at 1,024 operations;
histograms reset and the cap case prefills again before measurement.

The API function is resolved once and called directly inside the update loop.
The measured cost includes dispatch, public guards, driver status tallies and
a bounded checksum consuming each value/result. It excludes construction,
full GC requested before the window, snapshots, query/reset checks and report
allocation. The driver requires exactly its one Lisp thread; it starts none.
Counter payload is reported separately from headers, retained snapshots and RSS.

## Clock, allocations and interpretation

The measurement helper accepts injected clock, frequency and byte-counter
functions. Real timing uses two `get-internal-real-time` readings around the
whole batch. Record both readings, elapsed ticks, `internal-time-units-per-second`
and nominal tick quantum. Effective resolution is not calibrated. Zero ticks
produce `:below-resolution` with no cost/rate, never an invented nonzero duration.

For a completed batch, report elapsed seconds, average elapsed ns/operation and
operations/second. These are component-loop costs, not per-request latency
percentiles or database throughput. Keep all repetitions; do not select the
fastest, discard outliers, average percentile estimates or infer speedups.
The baseline is not subtracted because driver work and noise are not identical.

`sb-ext:get-bytes-consed` brackets the two clock readings and update batch.
It is a whole-process counter, not per-histogram memory or RSS. Record absolute
readings and the difference. Positive values remain observations; zero does not
prove universal absence of allocation. Ordinary GC stays enabled.

## Driver self-test and expected negative result

`--self-test` uses 16 operations and 16 warmups per scenario, one repetition.
It has no performance threshold. Fixtures cover five accepted and sixteen
rejected command lines, injected sensor arithmetic, zero ticks, regressing
clock/byte readings, invalid frequency, counts/checksum/missing-field corruption,
and a positive 1 MiB allocation control. A cold public API fixture verifies
empty/overflow/saturation query behavior and snapshot independence after reset.
The batch sink is checked against an independent cycle-sum oracle.

`--negative-fixture` deliberately removes `:completed` from a synthetic row.
It must emit one failed plist, preserve the damaged row, report `:missing-field`
and exit 1. Its original command remains **failed**, with a separate assessment
that this failure was the expected detection control. An unrelated exception
does not satisfy that control.

Each invocation emits exactly one readable plist: schema 1,
`:kind :metrics-histogram-benchmark`, parameters, environment, clock, payload
footprints and all measurement rows. Failure records include phase and
diagnostic, partial observations and nonzero exit. Product loading goes to
stderr before measurements. Read the output with `*read-eval* nil` and require
EOF after the sole object.

Publish compact original records, explicit source identity, all repetitions,
limits and failures. Large raw output follows the existing external-retention
policy; compiled caches do not belong in Git. No engine integration or
performance qualification is inferred from these component checks.
