# Reusable grouped GET output

Base: `94397753569159f01e1bbeef6f4cbec7c9d064bc`.
[Method](method.md), [two C1 readings and decision table](review.md),
[public API](../../../docs/lisp-api.md#caller-owned-group-read-buffers).

`client-get-group-into` reuses negotiated opcode 5 and returns count/total bytes
into one caller-owned 65,536-byte arena and UB64 lengths prefix. Documents are
packed in selected key order; zero length is absence, distinct from a one-byte
CBOR null. Duplicates occupy duplicate slices. All validation and exact capacity
checks precede copying. Only successful return authorizes outputs; late failure
can leave unconfirmed bytes/lengths. No new result/document vector, capability,
server policy, engine path or durable state is introduced. The old allocating
API and the new consumer share one complete validator.

The pre-edit public allocating baseline completes 16 cases, 80 windows and
1,800,000 groups (8,100,000 returned documents). Four frozen driver hashes bind
the baseline and later calibration. Longer 5,000-group windows reduce the weight
of short host disturbances without qualifying natural arrivals or a production
SLO. Actual completed comparisons, qualification and evidence closure follow.


## Completed public Unix comparison

Apple M4, SBCL 2.6.9, format 2, one serial production service per case, actual
resident/paged mode checked before READY. The paired campaign completes **16
cases, 160 windows, 3,600,000 groups and 16,200,000 returned documents**. Each
case reuses the same connected clients and server for both APIs, warms 100 calls,
and counterbalances five pairs of 5,000 groups per worker. Parent selection only
changes while workers are parked. Every byte, member order, numeric output,
private request-ID count and final canonical value/version is checked.

The table selects the eight-member cases. MB/s is decimal useful document
payload. Gain is the median of five per-window into/copy throughput ratios;
it can differ from the ratio of separately computed MB/s medians.

| Mode | Bytes/member | Clients | Copy → into MB/s | Paired gain | Copy → into reported bytes/group |
| --- | ---: | ---: | ---: | ---: | ---: |
| resident | 1,024 | 1 | 123.82 → 127.91 | +3.48% | 8,534.42 → 131.04 |
| resident | 1,024 | 8 | 321.47 → 325.52 | +1.02% | 8,487.34 → 131.04 |
| resident | 7,500 | 1 | 409.04 → 428.25 | +5.41% | 60,370.46 → 131.04 |
| resident | 7,500 | 8 | 1,261.35 → 1,331.37 | +5.55% | 59,976.30 → 131.04 |
| paged | 1,024 | 1 | 104.48 → 107.76 | +3.18% | 8,534.42 → 131.04 |
| paged | 1,024 | 8 | 219.61 → 221.17 | +1.33% | 8,487.34 → 131.04 |
| paged | 7,500 | 1 | 373.51 → 393.06 | +4.93% | 60,370.46 → 131.04 |
| paged | 7,500 | 8 | 1,032.78 → 1,061.62 | +2.99% | 59,943.57 → 131.04 |

All sixteen paired throughput medians are positive: 1.0058× to 1.0754×.
Single-member 60,000-byte groups gain 4.42–7.54%; single-member 1,024-byte
results are only 0.58–0.95% faster and should be treated as small local effects.
The four large eight-member cases gain 2.99–5.55% and remove approximately
**99.78% of reported client allocation**. Eight-member 1,024-byte groups remove
about 98.46%; the remaining protocol allocation is independent of payload size.
This is not a claim that the complete client allocates zero.

Reported process-wide allocation is not exact per-object accounting: some
multithreaded copying rows fall below their raw payload size. Both APIs use the
same sampling method with quiescent workers. Independent isolated decoder
fixtures confirm the source-level removal of result/document vectors; they
exclude transport and per-frame envelope construction.

For eight-client, eight-member 60,000-byte groups, copying accumulates
492.58 ms (resident) / 454.41 ms (paged) of client GC CPU across five windows;
into reports zero in those windows. These are aggregate CPU counters, not
pause percentiles. A full collection occurs before each measured window and
is outside it; longer uninterrupted-client GC behavior remains unqualified.
The isolated eight-member 65,472-byte decoder reports **9.780 → 4.276 μs CPU**
per call across 5,000 calls, with **zero reported allocation** on the new path.
The one-member 60,000-byte decoder reports 5.781 → 1.766 μs CPU; the new path
also reports zero allocation for both small-document fixtures.

Every raw window and nearest-rank latency quantile is retained and independently
checked against exact sample counts, wall/CPU/allocation/GC counters, byte totals,
all four driver hashes and losslessly copied child logs. Public-call adapter
latency excludes byte validation; complete window throughput and client counters
include it, synchronization and one canary scan per window. Server CPU is outside
those counters. Cold construction, seed writes, connection startup and final
version probes are outside measurement. No server arrival gate or artificial
delay is used. Both API choices reserve the same cold worker arena/length arrays
so the timing comparison measures response handling, not constructor cost.

These are local hot-data closed-loop observations, not physical disk bandwidth,
natural arrivals, concurrent engine readers, reference-platform qualification,
power loss or production SLOs. Group throughput counts group calls; document
throughput multiplies by the member count. The 7,500-byte rows contain 60,000
bytes per group, rather than eight 60,000-byte documents. The longer windows
produce consistent local medians; this campaign alone supplies no statistical
or universal performance guarantee.

## Functional qualification

The final native/wire/actor run passes **191 cases**, including eleven new methods.
A new real-process method passes four format/mode combinations, eight child
processes and four SIGKILL/reopen cases. It checks 65,472-byte aggregate reads,
absence/null/duplicates, whole-frame overflow with preserved output/reuse,
independent legacy copies and the next strong CSN. The updated executable public
example passes with one arena shared by single and grouped APIs before/after
restart and absence.

The strict affected qualification passes **290 cases in eight suites on each of
SBCL 2.6.9 and 2.6.10**, with exact planned/started/passed inventories. This covers
the four CBOR suites and local wire, native client, actor and process suites.
The unchanged engine/I/O/WAL/index paths inherit the immutable base qualification;
this increment does not claim a new full-engine run.

`make legal-check lint lint-selftest record-command-selftest
snapshot-mutation-selftest reader-mutation-selftest trace links fulltext-check
evidence-selftest evidence spikes-check ci-selftest` passes, including all eleven
registered spikes and nested CI self-tests. `make docs` also passes: locked
documentation setup, rendered manual tests, compiled export/docstring comparison
and the real Unix round-trip example. A post-archive link check passes 834 files
and 4,133 links, with none broken.

## Source and evidence closure

`source-identity.lisp` verifies all **1,761 current source files**, the exact
pre-edit baseline, identical planned/started/passed coverage on both runtimes,
all current functional/performance/static/docs receipts and the nested CI run.
Engine/I/O/WAL/index bytes are identical to the immutable base. The runtime delta
is exactly the four local client/wire files and the ASDF test inventory; no other
product path changed. The initial archive retains 473 exact-byte files.

`closure.lisp` verifies **545 archived command/child files** by original byte
hash and completes 286 lossless compactions; the retained tree occupies about
12 MiB locally. `tail-archive-data.lisp` separately retains all four terminal
archive/identity/closure command receipts (eight copies). Original failures and
negative fixtures retain their exact bytes and are not counted as product
qualification.

`cleanup.lisp` removes **207,201,622 logical bytes in 15 owned regenerable paths**:
this worktree's build/spike outputs and exact worktree-specific SBCL caches.
This is a logical inventory, not a physical-free-space measurement. Other
worktrees, branches and shared Git storage are untouched. Publication retains
upstream CI-only commit `594ad0ef95db7e07e1771a52bdc9ec771bea4ff0`; its two paths
are under `spikes/results/ci/`, outside the verified source inventory.
