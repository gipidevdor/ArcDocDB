# Next measurement boundary: loaded Unix service

The [completed 60,000-byte GET campaign](../2026-10-31-engine-record-cache/report.md#unix-measurement)
counts 4,523.73–4,750.99 operations/second across its eight cases. Multiplying
actual counted throughput by 60,000 document bytes gives 271.42–285.06 MB/s,
or 258.85–271.85 MiB/s. The reciprocal of P50 is not a throughput estimator.
These are repeated hot reads through one synchronous client. They neither
identify the limiting component nor measure physical disk bandwidth. Client
allocation is measured separately from server allocation in that campaign.

## First campaign

Measure one, two, four and eight independent owning clients against the same M1
actor, with 64-byte, 1,024-byte and 60,000-byte canonical documents. Keep data,
hash/key distributions, frame limits and warmup fixed. Include read-only, 95/5
and 50/50 GET/write mixes, with explicit write/conditional groups as separate
cases. Retain a group-limit-one control. Do not add a C4 ready-cohort gate to
the natural-arrival cases; report observed group-size and durable-flush counts.

Count completed operations and useful returned document bytes over actual total
window time. Preserve per-request send-to-complete-validation timings and report
their distributions separately from amortized group cost. Collect enough
requests per repeated window for an empirical P99, state sample counts, preserve
outliers and avoid presenting the maximum of a short run as a qualified tail.
Do not estimate throughput from P50 or report grouped cost as individual latency.

Collect server and client CPU, allocated Lisp bytes, GC activity, time/counts in
readiness waits, transferred bytes, canonical reads, cache hits and strong
flushes separately. First check instrumentation overhead against the same
unmodified workload. Use count/CSN/value oracles outside the measured interval
where possible; retain the exact validation included in request latency.

Exercise compaction boundaries under writes and record maintenance intervals
alongside read tails. Compare equal logical histories and maintenance triggers;
exclude no maintenance stalls from an end-to-end result. Add one partial/slow
peer to verify bounded fairness and absence of retained reader pins. SPK-03,
SPK-06/07 and SPK-11 provide the existing flush, maintenance, ordering and I/O
models; they do not substitute for loaded product measurements.

M1 still has serial engine ownership. Concurrent clients demonstrate transport
load and fairness, not concurrent engine readers or historical MVCC. The latter
requires a separate integration and qualification boundary.

## Paged and platform follow-up

Run a key/cardinality sweep with explicit measured heap/index/cache grants,
record resident-to-paged transitions and reopen/compaction costs, and keep the
automatic backend semantics unchanged. A deliberately small quota proves spill
behavior, not operation beyond physical RAM. A physical-RAM-scale run needs an
explicit disk/data budget and enough available workspace before creating data.

Repeat the same hashed drivers on reference hardware before treating local M4
results as SLO evidence. Real power-loss testing is separate from SIGKILL.
Comparisons with other databases require the same workload, durability,
document sizes, cache state, concurrency and validation; no such comparative
claim follows from the current campaigns.
