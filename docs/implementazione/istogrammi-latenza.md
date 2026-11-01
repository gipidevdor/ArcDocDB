# Bounded latency histograms

**Authorized increment 1, 2026-11-01 — REQ-OBS-001/002, C3.**
This component supplies the latency distribution primitive under `src/metrics/`.
The requirements remain designed in their full scope: request counters, throughput,
cross-Serie aggregation, controller diagnostics and engine/Unix instrumentation
are subsequent increments. No new shared coordination or persistent format is introduced.

## Stable contract

`arcdocdb.metrics` accepts integer elapsed durations supplied by its caller.
It never reads a clock, performs I/O, or updates a global accumulator. A worker
creates one independent histogram per Serie/measurement; immutable configuration
may be shared. A histogram's counter storage is fixed at construction.

| API | Result |
|---|---|
| `crea-configurazione-istogramma` | Validated immutable geometry, unit, scale, domain and count cap |
| `crea-istogramma` | Independent zeroed counters, owned by the constructing SBCL thread |
| `registra-latenza` | `:recorded`, `:above-range`, or `:saturated` |
| `istantanea-istogramma` | Independent immutable image captured by the owner; cold allocation |
| `percentile-latenza` | Inclusive lower/upper bounds, range status and completeness |
| `azzera-istogramma` | Begin a new empty window; previously captured images remain valid |

Construction, observation, capture and reset validate public arguments before
mutation and use the existing typed conditions. Raw counter arrays and internal
constructors are private. Scalar configuration and snapshot metadata are readable
through the exported structure accessors; ordinary accessor type checks apply.

### Units and compatibility

`bit-precisione` is 4..10, default 7. `massimo` defaults to 60,000,000,000
nanoseconds. Durations span 0..`+massima-latenza+` (2^60−1); the independent
`limite-campioni` spans 1..`+massimi-campioni+` (2^60−1).
Both bounds fit fixnums on the supported 64-bit SBCL targets.

`unita` is `:nanosecondi`, `:microsecondi`, or `:tick`. Standard units have fixed
scales of 10^9 or 10^6 units/second; `:tick` requires an injected positive
`tick-al-secondo`. `dominio`, default `:monotono`, is an immutable keyword
identifying the caller's clock domain. No implicit conversion is performed.
Supplying an incompatible scale is rejected. The maximum is always expressed in
the selected unit; the default denotes 60 seconds only for nanoseconds.

Future aggregation must compare precision, maximum, unit, scale and clock
domain, and account for count caps and incompleteness. Equal array lengths alone
are insufficient. Percentiles will be obtained from summed compatible counts,
never by averaging per-Serie percentiles. That aggregation is not implemented here.

## Integer geometry and declared precision

Let `B = 2^p`, where `p` is `bit-precisione`. For sample `v`:

```text
s = max(0, integer-length(v) − 1 − p)
index(v) = s × B + floor(v / 2^s)
```

Values 0..`2B−1` are exact. Subsequent regular buckets have width `2^s`.
For positive regular-bucket lower bound `L`, inclusive span `(U−L)/L < 1/B`.
For logarithmic (non-exact) buckets, the number of representable values divided
by `L` is instead **≤** `1/B`; that second claim does not apply to exact low buckets.
Zero is exact. These are value-quantization bounds, not confidence intervals.

The last regular bucket is clipped to the configured maximum. Above-range
observations are classified by comparing the actual value to `massimo`, even
when the two values would otherwise map to the same logarithmic bucket.
One reserved bucket retains their count. Its returned interval is
`[massimo+1, maximum accepted observation]`, marked `:above-range`; it has
**no regular relative-precision guarantee**. Long tails are not silently clamped.

The array has `index(massimo)+2` unsigned 64-bit cells, including overflow.
At default precision/range it holds 3,809 cells, or **30,472 bytes of counter
payload**. Metadata, headers and allocator overhead are additional; this is not
RSS. Maximum supported geometry stays below the enforced 65,536-cell budget.
Every retained snapshot owns another bounded counter array. Snapshot creation
is intentionally cold and allocating; callers must budget how many they retain.

## Percentiles and empty/saturated windows

`percentile-latenza(snapshot, numerator, denominator=1000)` uses exact nearest
rank `ceil(count × numerator / denominator)`, with `1 ≤ numerator ≤ denominator
≤ 1,000,000`. P50/P95/P99/P99.9 use 500/950/990/999 with denominator 1,000.
An integer quotient/remainder decomposition keeps intermediate arithmetic in
fixnum range instead of creating a potentially large product.

It returns four values:

1. Inclusive lower bound, or `nil` for an empty window.
2. Inclusive upper bound, or `nil` for an empty window.
3. `:ok`, `:above-range`, or `:empty`.
4. Whether all valid observations submitted to this window were accepted.

Counts sum exactly to the accepted population, including overflow. At the
configured count cap, further valid observations return `:saturated`, preserve
counts/population/accepted maximum, and make completeness sticky false.
The distribution still describes the accepted prefix; it cannot describe all
attempted observations. Controllers/exporters must carry this flag. The module
cannot detect observations never submitted by its caller.

Reset clears saturation and begins a new window. No automatic rescaling,
counter wrap, overwrite, or downsampling occurs. Very small sample populations
have defined nearest ranks but do not establish statistically reliable P99.9.

## Ownership, interruption and publication

Only the constructing thread may observe, reset or capture. A private dynamic
scope rejects same-thread reentry into any owner operation before counter
access. Its binding is thread-local and unwinds with the native Lisp stack;
the global root remains `nil` and is never assigned. No mutex, CAS loop,
shared counter write or wait is introduced per observation.

A mutation marks its state faulty **before** changing counters and clears
that marker only after all distribution state is consistent. An abnormal exit
therefore leaves it faulty without depending on an interruptible cleanup.
Further observation/capture signals
`invariant-violation` until an owner reset completes. This prevents a partially
updated population from being exported as a coherent image. Capture itself
only reads counters and never invalidates the histogram when allocation/copy
fails. The guard is not a claim that arbitrary SBCL interruption cannot occur.

Each snapshot copies all mutable distribution state. The owner performs the
capture without reentrant mutation. A snapshot subsequently remains unchanged
by updates and resets. Cross-thread readers need a publication edge supplied
by their caller, such as an existing synchronized handoff; this component does
not invent a lock-free publication protocol or instrumentation scheduling.

## Explicit integration boundary

An adapter allocates configuration and owner-local histograms at startup,
supplies elapsed durations after validating its injected monotonic clock,
checks the observation status, and captures at an owner boundary. It publishes
immutable snapshots through the existing execution model, preserving scale,
domain, range status and completeness. Metric failure is diagnostic state;
this component makes no database commit or durability decision.

The histogram is available independently of engine, scheduler and protocol.
No current request path is instrumented by this increment.

## Verification

The [preregistered method](istogrammi-latenza-metodo.md) defines correctness,
boundary, overflow, owner isolation, allocation and repeated-cost checks.
Results retain exact source identities, parameters, original outputs and
failures, without promoting component timing to database throughput.

The [2026-11-01 qualification](../../spikes/results/2026-11-01-metrics-histograms/report.md)
retains 23 dedicated cases on SBCL 2.6.9/2.6.10, the complete 2.6.9 product
catalog, allocation assertions and all 120 repeated measurement windows.
The default 2.6.9 accepted-update loop measured a median 14.99 ns/operation
on the local Apple M4, including driver work; that is not engine throughput.
