# Owner-local counters and coherent metric snapshots

**Increment 2, 2026-11-01 — REQ-OBS-001/002, C3.** This component extends the
[bounded histogram contract](istogrammi-latenza.md). Engine, scheduler and Unix
instrumentation, automatic publication and load diagnosis are separate work.
The full requirements remain designed; this increment is a component API.

## Ownership and events

`crea-metriche-serie(serie, worker, inizio, configuration=default)` creates one
owner-local partition. `serie` is an immutable unsigned 128-bit integer identity;
`worker` is an integer 0..2^60−1 assigned by the adapter. Identity conversion
from the engine's byte representation happens outside the hot path. `inizio`
is an injected integer clock reading, in the configuration's unit/domain.
The constructing thread alone updates, captures and resets the partition.
No hot call reads a clock, allocates a sample, waits or writes shared counters.
Counts are cumulative since construction or the last successful reset. WAL
observations are diagnostic input supplied by the adapter, not evidence of a
durable commit. Metric failure never makes a database durability decision.

| API | Event and result |
| --- | --- |
| `registra-richiesta(metrics, duration, outcome=:ok)` | One completed request, including `:errore`; matching latency observation; `:recorded/:above-range/:saturated` |
| `registra-cache(metrics, outcome)` | `:hit/:miss/:espulsione/:errore-verifica`; one counter; `:recorded/:saturated` |
| `registra-append-wal(metrics, bytes)` | One append and its nonnegative byte count, accepted together; `:recorded/:saturated` |
| `registra-flush-wal(metrics, duration, records)` | One flush, its nonnegative group size and matching latency, accepted together; histogram status |
| `registra-coda(metrics, kind, depth)` | Sampled current/peak depth for `:richieste/:wal`; returns metrics |
| `istantanea-metriche(metrics, fine)` | Coherent immutable copy, including both distributions and counter completeness |
| `azzera-metriche-serie(metrics, new-start)` | Strictly newer window; normal reset preserves current queue samples; fault recovery forgets uncertain queues |

Durations, byte/group increments, queue depths and ticks are 0..2^60−1.
The configuration sample cap is also each scalar counter's cap. Invalid public
arguments are rejected with `invalid-argument` before mutation. Within an event,
all affected counts and its latency are accepted together or rejected together.
Capacity-rejected valid events preserve accepted counts and set sticky incompleteness bits;
flush/request rejection also marks its latency distribution incomplete.
The affected event family then rejects further events until reset, including
smaller groups or zero-byte appends. Its distribution retains an accepted
prefix, rather than silently skipping a large event and admitting a smaller one.
Unrelated event families can continue after one family saturates. No counter
wraps. Counter and latency populations agree for accepted requests/flushes.

The private request histogram supplies the existing owner/reentry/fault scope
for the entire partition. No nested public histogram operations are used. A
mutation marks this scope faulty before any write and clears it last. After
an abnormal mutation, capture/update fails until a complete owner reset.
Capture is cold and allocating; allocation failure does not fault valid state.
The child histograms and mutable arrays are never exposed.

## Reading and time

`valore-contatore(snapshot, key)` returns count and completeness for these keys:
`:richieste`, `:errori`, `:cache-hit`, `:cache-miss`, `:cache-espulsioni`,
`:cache-errori-verifica`, `:wal-append`, `:wal-byte`, `:wal-flush`, `:wal-record`.
`metriche-complete-p(snapshot)` concerns valid submitted-event accounting,
not whether the caller has instrumented every real operation. Invalid
instrumentation calls leave state unchanged and signal a condition for the
adapter to report separately.

`tasso-contatore(snapshot, key)` returns an exact per-second rational rate,
`:ok/:incomplete/:zero-window`, and completeness. The rate uses injected
`fine-inizio` and the configuration's tick scale. A zero window returns no rate.
This cold calculation may allocate; it is not database performance evidence.
Capture requires `fine >= inizio`.
Reset requires a strictly greater start: two distinct windows cannot acquire
the same identity merely because the clock did not advance. When clock
granularity cannot distinguish them, the caller must defer reset or choose a
finer valid clock unit. These checks do not verify the caller's clock or its
event/window attribution. Recovery reset clears queue knowledge because an
interrupted event may have changed only part of a queue sample.

Scalar snapshot readers expose `serie`, `worker`, `inizio`, `fine`,
`latenza-richieste` and `latenza-flush` using the `istantanea-metriche-` prefix.
`numero-fonti-metriche` exposes the number of original partitions. Latency
snapshots use the existing percentile API and preserve range/completeness.
`stato-coda(snapshot, kind)` returns current, peak and quality:
`:exact` for one source, `:upper-bound` for a multi-source peak, or
`nil/nil/:unobserved` if any source lacks that queue observation. Peaks concern
submitted queue samples; unseen intermediate states are not measured.

## Aggregation and publication

`unisci-istantanee-latenze(simple-vector, :limite-campioni cap)` sums compatible
distributions into fresh storage. Input length is 1..4096. Precision, maximum,
unit, scale and domain must match; source caps may differ. The output cap
defaults to 2^60−1. Saturation is propagated. Total overflow signals
`resource-exhausted`; no arbitrary prefix is silently selected.

`aggrega-metriche(simple-vector)` accepts a caller-stable vector of 1..4096
immutable metric snapshots.
It requires identical window endpoints and compatible latency configurations.
It preserves original `(serie, worker)` provenance, including through prior
aggregates, and rejects duplicates/overlap. At most 4096 original partitions
are admitted. No snapshots from two different cuts of one partition can be
double counted. All counters and queue sums must fit 2^60−1, or the complete
aggregation fails with `resource-exhausted` (queue sums apply only to queues
observed by every source). The sources remain unchanged.

Select one Serie's partitions for a per-Serie result; supply all disjoint
partitions for a total. A result retains its Serie identity only when all
origins share it, and its worker identity only when it has one origin.
Percentiles come from merged distributions, never averaged source percentiles.
Current queue depths sum; the sum of source peaks is an **upper bound**, not
an observed peak of the total queue. Incompleteness is propagated per counter.

A coherent owner capture and a coherent sum of published immutable captures
do not establish a globally atomic instant across workers. The future adapter
must supply safe publication and truthful common-window cuts. This component
neither blocks workers to obtain them nor invents a publication protocol.

## Fixed storage and verification

Each live partition owns ten unsigned 64-bit counters, four queue cells and
two fixed histogram arrays. At default geometry this is 61,056 payload bytes,
excluding configuration, metadata, headers and allocator overhead. Each capture
has independent bounded storage. Callers bound retained snapshots and partition
counts; aggregation also budgets original provenance explicitly.

The [preregistered method](metriche-serie-metodo.md) separates correctness,
limits, saturation, provenance, isolation, interrupted mutation and hot
allocation/cost. Results must retain exact source
identities, original failures, parameters and all measurement repetitions.

The [2026-11-01 qualification](../../spikes/results/2026-11-01-metrics-counters/report.md)
retains 72 metrics cases on SBCL 2.6.9/2.6.10, the complete 2.6.9 product
catalog and all 80 timed windows. A completed request measured a local median
19.67 ns per event-loop iteration on the Apple M4, including the driver;
that is a component measurement, not database performance.
