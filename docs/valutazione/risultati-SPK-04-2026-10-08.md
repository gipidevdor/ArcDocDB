<a id="spk-04--prima-campagna-locale-2026-10-08"></a>

# SPK-04 — first local campaign, 2026-10-08

[Evaluation](README.md) · [Method and code](../../spikes/SPK-04-writer-pool/README.md)

> **Proposal** — Experimental evidence for writer and waiting models,
> with `safety 3`. Does not verify the engine or ADR-0028 targets.

<a id="ambiente-e-prove-conservate"></a>

## Environment and retained tests

SBCL 2.6.9 on macOS ARM64; process heap 4 GiB. Hardware environment,
uncontrolled external load, command, and source blobs are retained in
reports. Reference commit is `6913318`, with explicit local changes.
The four spike sources and harness are identified before/after: both
successful runs report `:source-consistency :stable`.

- [Checks](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk04-check.lisp).
- [Benchmark](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk04-bench.lisp).
- [Complete repository check](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk04-full-check.lisp):
  successful `make check`, seven spikes, valid traceability and links.
- [First failed attempt](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk04-check-initial-failed.lisp)
  and [diagnostics](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk04-check-initial-failed-process.lisp).
- [Second failed attempt](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk04-check-parking-failed.lisp)
  and [diagnostics](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk04-check-parking-failed-process.lisp).

The first attempt detects a macro redefinition warning at load: the local
macro is now defined during compilation, while the FASL contains its
expansions. The second detects an extra closing parenthesis in the parking
model. Corrections do not erase failures. Final compilation and loading
without warnings.

<a id="correttezza-osservata"></a>

## Observed correctness

| Scope | Check and outcome |
|---|---|
| Serie ring | Capacity 2, rejection without mutation, and FIFO wrap-around |
| Real producers and writers | 8 producers, 4 Serie, 4 workers, 256 requests; 40 segments and 44 ready list accesses; no lost or duplicated request |
| Handoff | One Serie, four successive threads; worker sequence 0/1/0/1 |
| Deterministic burst | Hot Serie with 64 requests, three cold with 4 each; all cold Serie completed by fourth segment with one worker |
| Worker error | Injected error propagated and four threads terminated |
| Parking | 15 fixtures on batch clients, snapshots, and coordinators; saturation, inclusive expiration, FIFO, reuse, and stale notifications |
| Read restart | 9 combinations and 54 model assertions; no location or epoch in migrated context |

Burst-case fairness is a result in **segments**, not a latency promise.
Producers terminate before drain; new requests arriving while writers work
are not exercised. Parking and reads are finite models, distinct from the
real-thread pool.

<a id="benchmark-diagnostico"></a>

## Diagnostic benchmark

54 cases: uniform/skewed load, 1/4/16 Serie, 1/2/4 workers,
segments of 1/8/64 requests, 4,096 requests per case and 32 synthetic steps.
Total: **221,184 operations**. Process lasts **0.968645 s**, including
compilation, checks, and measurements; this is not a single throughput window.

Example with 16 Serie and 64-request segments:

| Load | Workers | Wall time, ms | Segments | Ready list accesses | Process allocated bytes |
|---|---:|---:|---:|---:|---:|
| Uniform | 1 | 0.937 | 64 | 65 | 65,520 |
| Uniform | 2 | 0.727 | 64 | 66 | 131,040 |
| Uniform | 4 | 0.737 | 64 | 68 | 262,080 |
| Skewed | 1 | 0.983 | 78 | 79 | 65,520 |
| Skewed | 2 | 0.959 | 78 | 80 | 131,040 |
| Skewed | 4 | 1.167 | 78 | 82 | 262,080 |

The ready list counter equals segments plus worker retirements, without
global updates from each request. With one-request segments, common cost
is per operation: that case is diagnostic only.

Table windows are below 2 ms and have only one sample:
**they permit no scalability conclusion**. They include sequential thread
startup, join, FIFO/bitmap checks, and per-request clock; they exclude
preallocation and generator. Allocations include process harness and
threads, at SBCL counter granularity. They are neither RSS nor an isolated
kernel measurement. Per-Serie times in the report measure the interval
from common start to completion, including service.

<a id="conseguenze-e-limiti-residui"></a>

## Consequences and remaining limits

> **Proposal** — The pool and models provide initial executable evidence
> for ADR-0045. RSK-04 remains quantitatively open: an already started pool,
> long windows, replicas, producers during drain, writer messages, dynamic
> adaptation, and the reference Linux platform are needed. CSN, horizon,
> epochs, I/O, and durable commit are not implemented by the spike.

Mutex acquisition uses nonblocking attempts capped at 100,000;
the synthetic body performs no I/O. An attempt may yield scheduling:
it does not demonstrate execution without runtime suspension. The controller
has joins with diagnostic timeout and only one second attempt after stop;
a still-live thread produces `cleanup-incomplete`, never success.
No attempt or time budget is presented as a guarantee.
