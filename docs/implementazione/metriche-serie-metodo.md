# Owner-local metric events — preregistered C4 method

**2026-11-01, before execution.** This English method registers the component
benchmark in [metrics-counter-bench.lisp](../../tools/metrics-counter-bench.lisp)
against the [metric partition contract](metriche-serie.md). It follows the
recording conventions of the [histogram method](istogrammi-latenza-metodo.md).
Writing and static review supply no timing, allocation or correctness evidence.
Freeze the reviewed product, tests and driver before recorded execution. Close
writing/reviewing agents first; retain every failed attempt and its actual source
identity before correcting it in a new variant.

## Correctness before measurement

Generate/check the trace matrix before the source freeze, retaining the
generator's actual source-consistency result. Then commit the reviewed inputs.
Run strict core/local/test compilation and the whole metrics registry, including
the original histogram cases, merge cases, event/provenance cases and eight-path
allocation case. Allocation instrumentation is excluded only from coverage;
all ordinary runs retain both metrics allocation cases.

Run the complete product catalog plus legal, lint, trace, links, CI, spike and
evidence-tool self-tests and the retained-evidence integrity check. Independent
correctness/audit jobs can run concurrently on frozen inputs. Wait for all to
finish before timing. Use SBCL 2.6.9 as the reference runtime; an available
2.6.10 campaign is supplementary, with its matching home/core selected
explicitly so the recorder's environment cannot choose a different core.

The component tests include typed invalid inputs before mutation, exact
counter/distribution conservation, closed saturated event families, zero-time
and rational rates, sampled/unknown queues, hierarchical provenance overlap,
strict window advancement, guarded admission, foreign owners, interrupted
mutations and recovery that forgets uncertain queue state. Near-limit fixtures
are synthetic, internally consistent populations, not billions of executed
events. No source edit is permitted during any recorded verification command.

## API and ownership

Resolve only exported functions in `arcdocdb.metrics` after an ordinary, forced
ASDF load of core system `arcdocdb`. Capture is the **two-argument function**
`(istantanea-metriche metrics fine)`. The **one-argument reader**
`(istantanea-metriche-serie snapshot)` returns the Serie identity. The snapshot
type is also named `istantanea-metriche`; Common Lisp's separate type/function
namespaces permit this. Never substitute the identity reader for capture.

Each window has a fresh partition owned by the sole Lisp thread. The driver
starts no threads and checks the thread count before and after measurement.
Warmup uses a separate disposable partition, so a warmed queue observation does
not make the measured partition's initial queue state known. Configuration,
partitions, closures, raw result cells and workload vectors exist before the
sensors open. The cap-one case prefills one successful zero-duration `:ok`
request before warmup and before measurement, on their respective partitions.
Reset requires a new start **strictly greater** than the previous start; equal
starts are invalid. The fresh measured partitions here need no warmup reset.
Normal reset preserves known current queues and starts their peaks there. Only
recovery of a previously faulted partition clears queue knowledge; fault
injection/recovery qualification remains with the product tests.

## Registered workloads and bounds

The exact command modes are:

```text
--bench [--iterations N] [--repetitions R]
--self-test
--negative-fixture
```

`N` is 1..10,000,000, default 1,000,000; `R` is 1..20, default 5. Only canonical
ASCII decimal is accepted: no signs, whitespace, leading zeros or suffixes.
Reject missing values, unknown or duplicate options, extra arguments and mixed
modes. Options may appear in either order after `--bench`. Work is bounded;
these limits do not promise a wall time.

| Scenario | One measured iteration | Expected default outcome |
| --- | --- | --- |
| `:baseline-loop` | Vector reads, dispatch, tallies and sink; no product call | Baseline tally |
| `:request-ok` | `registra-richiesta(partition, duration, :ok)` | `:recorded` |
| `:request-error` | `registra-richiesta(partition, duration, :errore)` | `:recorded` |
| `:cache-hit` | `registra-cache(partition, :hit)` | `:recorded` |
| `:wal-append-16-bytes` | `registra-append-wal(partition, 16)` | `:recorded` |
| `:wal-flush-4-records` | `registra-flush-wal(partition, duration, 4)` | `:recorded` |
| `:queue-update` | `registra-coda(partition, :richieste, depth)` | Same partition |
| `:saturated-request` | `registra-richiesta(partition, duration, :ok)` after cap-one prefill | `:saturated` |

One precision, 7 bits; maximum 60,000,000,000 nanoseconds; scale 1,000,000,000
units/second; domain `:monotono`. Normal cap is **100,000,000**, saturated cap 1.
The default is **8 scenarios × 5 repetitions × 1,000,000 = 40 windows**.
Scenario order rotates by repetition. Retain every repetition, including every
positive byte observation and below-resolution window.

The cap also bounds scalar byte counts. Consequently, with the required
100,000,000 cap, the append scenario accepts the first 6,250,000 calls; a larger
requested window has an explicitly expected saturated tail. Its accepted and
rejected populations and checksum are checked separately. The default campaign
has no such tail. A ten-million-call flush window retains 40,000,000 records,
within the cap. Do not describe upper-bound append windows as wholly accepted
updates or silently change their cap.

Preallocated 256-element fixnum vectors contain deterministic duration anchors
at zero, low bucket transitions and long durations through the configured
maximum, plus a permutation of depths 0..255. They are fixed working sets, not
per-event logs. Warmup is 1,024 iterations per scenario in benchmark mode.
The measured loop includes scenario dispatch, the resolved public call and its
owner/value/reentry/fault guards, status/accepted/completed tallies, and a
bounded checksum consuming selected inputs and return classifications. Public
functions are called directly with `funcall`; no allocating rest-argument
adapter runs inside the window. A cold cycle-sum oracle checks the sink,
including an append window with a saturated suffix.

Construction, explicit full GC, capture, validation, reset, rate queries,
formatting and report allocation stay outside measurement windows. Ordinary
automatic GC remains enabled. The baseline is retained without subtraction.
No performance threshold or universal zero-allocation assertion is registered.

## Sensors, raw records and cold checks

The batch helper accepts injected clock and byte-counter functions plus a
positive integer frequency. Production sensors are `get-internal-real-time`,
`internal-time-units-per-second`, and `sb-ext:get-bytes-consed`. Read bytes,
then clock, run the batch, then read clock and bytes. Thus the byte interval
includes the clock reads; the elapsed-time interval excludes the byte reads.
Keep absolute readings, frequency, differences and nominal tick quantum in
each row. Effective clock resolution is not calibrated. All arithmetic in the
report is exact rational arithmetic. Negative, missing or regressing readings
fail. Zero elapsed ticks have `:below-resolution`, zero elapsed seconds and
`nil` ns/operation and operations/second; no invented duration is allowed.

The allocation counter covers the whole process, not an individual partition,
RSS or retained storage. Positive differences are valid observations. A zero
difference only describes this process, toolchain, sensor interval and workload.

Cold public snapshots check all ten counter totals and completeness, request
and flush histogram populations/saturation, identity, source count and both
queues' exact or unobserved state. The measured partition begins with unknown
queues. Queue updates establish only the sampled request queue's current and
prefix maximum; the WAL queue remains unobserved. Snapshot endpoints 0 and
1,000,000,000 are injected **validation coordinates**, not measured timestamps;
they do not generate benchmark performance rates. Initial captures use end 0.

Small functional fixtures check both request outcomes, all four cache outcomes,
append bytes, flush group size, both queues, exact rational counter rates,
zero-window absent rates, reset queue knowledge and immutable old snapshots.
Explicitly reject equal as well as regressing reset starts, before mutation.
Separate cold cap controls require sticky request/cache/append/flush rejection,
including a smaller subsequent byte/group increment that would otherwise fit,
while unrelated families continue. Counter and latency incompleteness must
agree with those rejected event families. Incomplete rates retain their quality.
Typed `invalid-argument` rejection must precede mutation: compare complete cold
summaries before and after each invalid event/capture/reset. Invalid construction
and reader arguments are checked too. This supplements rather than replaces
the separately owned product test suite.

## Detection controls and output boundary

`--self-test` runs eight small windows, 16 iterations and 16 warmups each, with
one repetition and no timing threshold. Both normal modes first run parser,
sensor/checker, retained positive-allocation and small public API controls.
Injected clock/byte streams require exactly two reads each. Fixed arithmetic
expectations check 20 ticks at 1,000 Hz for four operations, 64 bytes, exact
rates, and a zero-tick case. Counts, checksum, derived arithmetic, negative or
regressing clocks/bytes, invalid frequency, and a missing `:completed` field
must each trigger their specified diagnostic reason. An unrelated exception
does not count as detection. A retained 1 MiB byte vector is the positive
allocation-sensor control; it is not an allocation-rate benchmark.

`--negative-fixture` needs no product load. It deliberately removes `:completed`
from a synthetic row. Required outcome: exactly one readable failed plist,
structured diagnostic reason `:missing-field`, the damaged row retained, and
exit 1. The original command remains failed; an external assessment records
that the expected detection control succeeded. Preserve unexpected failures.

Each invocation writes exactly one readable plist to stdout, schema 1,
`:kind :metrics-counter-benchmark`, with parameters, environment/cache metadata,
clock metadata, controls and all rows. Progress/loading/warnings go to stderr.
Rows are published before warmup or measurement; cleanup retains partial raw
observations, including sensor readings already obtained. Failures set report
status `:failed`, preserve completed rows and mark unfinished rows failed,
record phase/reason/message and return nonzero. Read output with `*read-eval*`
bound to `nil` and require EOF after the sole object.

## Later execution and evidence retention

After two static author readings and independent review, close writing/reviewing
agents and freeze source before any execution. The parent must provision a
private hierarchical ASDF cache and pass it to children unchanged. The driver
records inherited `ASDF_OUTPUT_TRANSLATIONS` and `XDG_CACHE_HOME`; it does not
change user cache configuration. Core loads are forced, without coverage,
under strict warning/style-warning handling. Only recognized SBCL redefinition
warnings are muffled. No direct private product-file loading is substituted.

Recorded commands use fresh exclusive `tools/record-command.lisp`
directories and committed inputs, retaining exact argv, source blobs,
environment, stdout, stderr, exit status and failures. Do not change source or
method during a recorded command. Correctness and full regression checks
finish before serial measurements; retain each toolchain's full repetitions
separately. The available macOS/ARM64 SBCL host is the intended campaign scope.
External machine load is uncontrolled. These are public component event-loop
costs, not database throughput, latency percentiles, Linux qualification or
universal allocation claims.

## Static author readings — 2026-11-01

1. Read the complete driver and method against the contract and available core
   signatures. Checked the capture/identity-reader distinction, positional
   constructor configuration, scalar byte-cap consequence, direct public hot
   calls and sensor boundaries. Prebound the synthetic callable outside its
   window and retained successful injected sensor rows, including zero-byte
   observations. The 6,250,000-append cap boundary is an explicit registered
   constraint, not an assertion that all allowed append windows are accepted.
2. Read both complete files again after the contract strengthening. Checked
   strict reset advancement and unchanged state after invalid reset, normal
   queue preservation, sticky family rejection and independent family progress,
   counter/histogram/queue expectations, bounded CLI, partial raw-row retention,
   specified corruption diagnostics and the single-plist failure boundary.

These are two static author readings before execution. They do not establish
compilation success, passing self-tests, allocation results or timing; those
outcomes require the separately retained command records.
