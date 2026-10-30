<a id="spk-06--compaction-e-carico"></a>

# SPK-06 — Compaction and load

> **Proposed** — Evaluation experiment: finite state machine and file copies concurrent
> with reads. Not engine compaction; does not change
> [ADR-0023](../../docs/adr/0023-politiche-di-compaction.md) defaults.

<a id="domande-e-criteri-prima-dellesecuzione"></a>

## Questions and criteria before execution

How does the controller react to signals and boundary timers? How do read latency
and copy bandwidth change when adding concurrent copying with different bandwidth
limits? Tests are accepted only if model cases produce declared outcomes, every
read verifies CRC/key/stamp, copied output matches source, and source remains
immutable. A case without actual overlap is declared as such; it is not an
interference measurement. No product P99 threshold or bandwidth is assumed verified.

<a id="modello-del-controllore"></a>

## Controller model

Injected monotonic time, no threads or sleep. Owned traces of at most 256 samples,
times 0 to 1,000,000 ms, signal ratios 0 to 2000 thousandths of target.
Regular sampling every 500 ms after first sample. Exact EWMA with `alpha=1/2`;
finite length bounds rational-numerator growth.

> **Proposed** — The 500 ms step and `1/2` weight are declared experimental parameters;
> ADR-0023 indicates a window around one second. They do not calibrate engine controller.

Thresholds follow ADR-0023: high if any signal strictly exceeds 80%, low after both
strictly below 40% for at least 10 s, otherwise normal. Ongoing MERGE slows in normal,
suspends in high, and is abandoned after 30 continuous seconds of high. Exiting high
resets timer. No new MERGE in normal/high; urgent CLEAN in high requires at least
80% dead space and has one worker.

MERGE admission separately checks CLOSED, immutability, not ACTIVE, no snapshot,
sufficient group, low load, and at least 50 s stability. After restart, stabilization
starts at recovery end ([ADR-0040](../../docs/adr/0040-manifest-a-record-unico.md)).
Model token bucket has finite credit, exact consumption, and rejection without negative
credit. Regressing time, invalid traces, and parameters produce explicit errors before
sample mutation. Starvation and priorities remain distinct properties.

<a id="interferenza-reale"></a>

## Real interference

Common Lisp/SBCL only, `safety 3`, zero warnings/style-warnings. Reuses public I/O
and record APIs from [SPK-05](../SPK-05-segment-read/README.md), without its controller.
An immutable 8192-record file of 2048-byte records (16 MiB) is generated and verified
before matrix. Body is synthetic, without CBOR; no commit, snapshot, or durability attestation.

Matrix: 1/2 readers, 32,768 aggregate random reads per case, same deterministic
sequence for comparisons, three replications with alternating order.
Conditions: no copy, unlimited copy, 16 MiB/s copy, 64 MiB/s copy: **24 cases**.
Copy traverses file once in 64 KiB blocks, checks records, and writes exclusive
`.tmp` output; after joins, output is reopened and fully compared with source.
No fsync: measures buffered copying, not media persistence.

Bandwidth limit is a token bucket for copy worker only, maximum credit one block,
with one initial block available. Quota precedes block read, verification, and write.
Real clock and pacing waits are on I/O worker; attempts and work have diagnostic
limits. Controller model uses a separate injected clock: observed latency is not
turned into a synthetic signal of actual device utilization.

Buffers, FDs, plans, and samples are worker-exclusive and ready before loop.
A common gate is used at case boundaries; no shared locks or writes per record.
Timings distinguish startup/join, reads, copy, pacing, final verification, and cleanup.
Retain timestamps and raw samples, overall P99 and P99 only for reads whose intervals
are wholly inside actual reader/copy overlap, with count of such reads.
A common gate alone does not prove overlap. Percentiles use upper rank.
Copy window includes token-bucket waits: a covered read does not prove the copy syscall
is active at the same instant. In data, reconstruct each operation's end by adding
start and latency, in worker order declared by `:worker-operation-counts`.

Zero observed duration is declared `:below-clock-resolution`, with `nil` rates,
original ticks, and resolution retained, for reads and copy. No positive duration
is forced and no overlap inferred from a zero interval. REQ-BEN-002 fixture verifies
zero, one positive tick, negative intervals, and incorrect counts; last two rejected.

Waits and joins have 10 s timeouts. A stalled syscall can exceed budget; a live worker
prevents fixture close/removal until process exit. Exclusive directories/files are
created under `out/data/`; delete only objects created by test. Source file is not written.

<a id="riproduzione-e-ambiente"></a>

## Reproduction and environment

```sh
sbcl --script tools/run-spikes.lisp --check SPK-06
sbcl --script tools/run-spikes.lisp --bench SPK-06
```

Checks and measurements run in isolated processes; runner compiles in a separate
per-PID directory with fatal warnings and produces one outcome plist.
Hardware, OS, SBCL, command, configured heap, and before/after source blobs are in
structured record. `--check` uses small fixtures and is not a performance measurement.
Campaigns run serially with other spikes.

<a id="risultati-e-limiti"></a>

## Results and limits

The [first campaign](../../docs/valutazione/risultati-SPK-06-2026-10-08.md)
passes model and worker checks; 24 cases complete 786,432 verified reads and 18
copies reopened and fully compared. Checks, measurements, derived comparison,
and first compilation error are retained in catalog. Final-run sources are stable
before/after.

Dataset is small, freshly written, with uncontrolled page cache and external load.
Linux x86-64, cold-cache NVMe, beyond-RAM dataset, WAL traffic, required-record
selection, relocations, reclaim, durable CLEAN/MERGE, and full controller feedback
are not measured. RSK-08 (accepted starvation) and RSK-12 (real-load stability)
remain open within declared scope.
