<a id="spk-04--writer-logico-su-thread-pool"></a>

# SPK-04 — logical writer on thread pool

> **Proposed** — Phase-0 experiment, Common Lisp/SBCL only. Method below recorded before
> tests. Studies ADR-0045 and INV-P5/INV-P6; neither implements engine nor closes
> production requirements.

<a id="domanda"></a>

## Question

Can a worker pool execute bounded writer turns for multiple Serie, with FIFO order,
one writer per Serie, bounded queues, and handoff paid per turn? Can a client await
an event in bounded context without occupying a worker or receiving two completions?

<a id="metodo"></a>

## Method

Three separate scopes:

- `pool.lisp`: preallocated per-Serie queues and ready-Serie list; reused workers and
  operations-per-turn limit. Shared list serves only turn handoff; no global counter
  updated by every operation. Synthetic work checks order, accounting, and uniqueness
  through bitmaps; checksum is an observed result.
- `parcheggi.lisp`: deterministic model of batch-client, snapshot, and coordinator
  lists. Logical clock, explicit capacity and deadlines; context generations distinguish
  stale notifications after slot reuse. Event and expiration produce one outcome.
- `core.lisp`: integration and model of a cache-miss read. I/O task restarts from
  request and rereads index; first task's location and epoch do not cross handoff.

<a id="serialità-e-limiti"></a>

### Serialization and limits

A turn's body modifies only its own Serie's data. The ready-Serie list is the
entry already allowed in [architecture](../../docs/architettura.md#archivio-coordinamento-minimo)'s
closed list: it serializes only turn-handoff administration. The prototype proves
neither constant latency, runtime fairness, zero waits, nor absence of contention.
An attempt bound is not a completion guarantee.

Loads are queued before workers start: they do not measure concurrent producers,
networking, parsing, WAL, CRC, or durability. One-operation turns make shared-list
cost per-operation cost: a diagnostic, not a recommended configuration.

Parking and read migration are in-memory models; they neither use the filesystem
nor simulate weak memory. Worker count is fixed per case: EWMA, AIMD, and hysteresis
remain outside the spike.

<a id="controlli-e-misure"></a>

## Checks and measurements

Before benchmarks: warning/style-warning-free compilation with `safety 3`, FIFO order
and exact per-Serie result, writer exclusivity, worker handoff, bursts, queue
saturation, error propagation, parking expiration and stale notifications,
read restart. Deterministic fairness is expressed in turns, not milliseconds.

The benchmark campaign compares uniform/skewed loads, Serie and worker counts,
and turn sizes. Each case reports operations, wall time, throughput, allocations,
and handoff counters. Timings include synthetic execution and coordination declared
in record, including sequential thread creation and joins; they do not measure
an already started pool. Clock is also read during request processing, so measurements
include harness instrumentation. Default has 54 cases: workers 1/2/4, Serie 1/4/16,
turns of 1/8/64 operations, uniform or skewed load, 4,096 total requests per case,
and 32 synthetic-work steps per request. Campaign does not measure shared catalog,
CSN, horizon, or threshold resources. External load is uncontrolled; local data
verify neither engine targets nor scalability on reference Linux platform.

<a id="esecuzione-e-registrazione"></a>

## Execution and recording

```sh
sbcl --noinform --no-userinit --no-sysinit --script tools/run-spikes.lisp --check SPK-04
sbcl --noinform --no-userinit --no-sysinit --script tools/run-spikes.lisp --bench SPK-04
```

Runner compiles modules in a separate local directory per process.
Harness retains environment, command, output, errors, and all source blobs before
and after testing, including failed campaigns.
Cited artifacts will be retained in `spikes/results/2026-10-08/`.

<a id="stato"></a>

## Status

The [first local campaign](../../docs/valutazione/risultati-SPK-04-2026-10-08.md)
passes five pool-check groups, 15 parking fixtures, and nine read-restart scenarios.
Retains 54 benchmarks, 221,184 synthetic operations, and two earlier failed attempts.
RSK-04 and RSK-12 remain open to verification; engine requirements remain designed.
Short measured windows do not demonstrate scalability.

Requirements studied: REQ-CON-001, REQ-CON-002, REQ-CON-003, REQ-CON-004,
REQ-CON-005, REQ-AFF-008, REQ-VAL-001, REQ-BEN-001, REQ-BEN-002.
