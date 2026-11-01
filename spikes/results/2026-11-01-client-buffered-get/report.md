# Ordinary GET into caller-owned storage

Base: `d8b976ba9e5cddaad39dace43f5a4618abcf3300`. The additive exported
`arcdocdb.local:client-get-into` returns FOUND/byte-count or ABSENT/0 into
caller-owned reusable octets using the ordinary GET wire operation. It removes
the per-read document vector while preserving the old allocating API. The two
paths share complete response correlation and the same canonical GET grammar.

A full 60,000-byte output grant from the requested offset and alias checks precede
encoding, request-ID consumption and transmission. Malformed responses, absence
and authoritative rejections do not write the target. Deadline/error/nonlocal
exit after copying can leave unconfirmed bytes; only a successful return
authorizes the returned prefix. The client retains no output-buffer reference.

[Method](method.md), [two C1 readings and decision table](review.md),
[public contract](../../../docs/lisp-api.md#caller-owned-read-buffers).

## Matched performance

Apple M4, SBCL 2.6.9, local Unix service, one hot key at CSN 1. Each campaign
covers resident/paged primary storage, 1/8 private synchronous client owners,
1,024/60,000-byte documents, five repetitions per case and alternating API order.
The same connected clients and server serve both APIs within each case; workers
park before changing the selected API. Both campaigns use identical frozen
parent/paired/server/common driver hashes. Together they complete **360,000
byte-verified reads in 160 windows**. Independent analysis checks raw latency
counts/quantiles, exact window ledgers, hashes and outcomes.

The table reports decimal useful payload MB/s, the separate medians for each API,
and the median of five paired throughput ratios. A median ratio can differ from
the ratio of the two independently computed medians.

| Mode | Bytes | Clients | First copy → into MB/s | Paired gain | Repeat copy → into MB/s | Paired gain |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| resident | 1,024 | 1 | 30.34 → 30.88 | +1.84% | 30.11 → 30.68 | +1.31% |
| resident | 1,024 | 8 | 125.60 → 126.15 | +0.18% | 125.73 → 127.10 | +0.72% |
| resident | 60,000 | 1 | 557.06 → 620.31 | +11.61% | 556.44 → 624.27 | +12.44% |
| resident | 60,000 | 8 | 1,930.70 → 2,080.03 | +7.72% | 1,922.45 → 2,058.94 | +8.31% |
| paged | 1,024 | 1 | 43.22 → 43.73 | +1.60% | 30.35 → 30.85 | +1.90% |
| paged | 1,024 | 8 | 116.02 → 115.72 | +0.97% | 120.44 → 121.02 | −0.09% |
| paged | 60,000 | 1 | 640.79 → 686.94 | +7.11% | 555.18 → 624.71 | +12.33% |
| paged | 60,000 | 8 | 1,919.71 → 2,027.28 | +6.11% | 1,883.39 → 1,999.97 | +6.36% |

Reported client-process allocation falls from **60,039.97 to 131.07 bytes/read**
for single-client 60,000-byte documents (99.782% less), and from **1,172.45 to
131.07 bytes/read** for 1,024-byte documents (88.821% less). The separate
same-thread alternating allocation campaign verifies the same values across
both storage modes in 20,000 reads. Multi-client 60,000-byte copying reports
roughly 59.5 KB/read because allocation-region counters quantize; the remaining
envelope allocation is still present. This API does **not** make the entire
client zero-allocation.

Across the five eight-client 60,000-byte copying windows, aggregate client GC
CPU is 54.11/53.24 ms (resident/paged) and 60.80/52.82 ms in the repeat. The
corresponding into windows report zero GC CPU. These are CPU counters, not
pause percentiles. The isolated 2,000-call decoder fixture reports 6.642 μs
CPU/copy versus 1.758 μs/into for 60,000-byte documents; into allocates zero
in that isolated decoder fixture. Transport and full-byte validation are outside
that microfixture's scope.

Per-request latency stops immediately after the public API returns. Window wall
throughput and client CPU/allocation include byte validation and synchronization;
server CPU is outside the client process counters. No server cohort gate, batching
timer or artificial arrival delay is used. Cold serialization, startup and final
CSN/version probes are outside the measured windows. These figures apply to this
hot-key workload on local M4; they are not cold-disk bandwidth, concurrent engine
reader qualification, power-loss tests or production SLOs. The previous turn's
burst workload is different, so its absolute bandwidth is not a before/after
baseline for this change.

## Diagnostic campaigns and retained failures

The original `baseline/` uses generic MISMATCH within the API timer. Typed-byte
microfixtures show that it dominates large-document measurements; its exact
three-driver variant is retained alongside `smoke-02/`. The corrected
`baseline-final/`, `copy-control/` and `into/` use identical drivers, with API
latency excluding byte validation. However, separate cold-process campaigns
vary severely: even the unchanged allocating control ranges from 0.144× to
1.182× its old baseline. These standalone results are retained as diagnostics,
and are not used to infer the feature's throughput effect. Public-API matched,
counterbalanced campaigns above address that confound, while the separate
same-thread experiment checks allocation attribution. Read-only host snapshots
record other active workloads outside measurement; no causal claim about them
is made and no other chat's processes were stopped.

Retained failures include the first smoke driver's missing closing parenthesis,
a test expecting the wrong existing condition for an oversized key, and a short
paired-analysis smoke dividing zero reported allocation by zero. Their exact
variants and terminal logs are kept. The fixture expectation now matches the
existing resource-exhausted contract. Zero reported allocation denominators
produce an unknown ratio, not a false zero-allocation claim. Corrected smoke,
analysis self-tests and affected tests pass.

## Qualification and evidence scope

Nine new actor/client test methods cover output offsets/canaries, all preflight
gates, 13 malformed/partial frame variants, owner/ID limits, all five authoritative
rejections with reuse, deadline checks and nonlocal exits before/after copying.
The new real-process method covers four format/mode combinations (formats 1/2,
resident/paged), maximum documents, small-frame rejection, eight children and
four SIGKILL/reopen cases. Legacy independent-copy ownership, absence, version
and the next CSN are checked through the ordinary service.

The strict affected qualification passes **267 cases across eight suites on each
of SBCL 2.6.9 and 2.6.10**. The append-only observer matches every planned test
to an ordered started/passed pair, with no missing, unexpected or repeated case.
Native, wire and actor tests also pass as a focused 169-case run. Static/legal,
trace, numeric/evidence, recorder mutation and CI self-tests pass, along with
all **11 spikes**. Documentation validation passes: 569 sources, 1,190 HTML
pages, 90,758 links, 759 exports and 671 contracts; 14 damaged-artifact fixtures
are rejected and restored. The public example exercises both GET APIs before
and after restart and passes.

The source-identity proof requires the pre-edit baseline to equal the immutable
base inventory, both runtime qualifications and final campaigns to match the
current complete source inventory, and the runtime delta to be exactly the
system definition and four local client/wire files. Engine, I/O, WAL, indexes
and full-text sources are unchanged and inherit the base commit's recorded full
qualification. This increment does not claim a fresh full-engine suite run.

Completed commands, child logs and diagnostic variants are retained with byte
hashes and verified lossless compression. Closure and cleanup receipts record
the actual completed result. Cleanup is limited to regenerable paths of this
worktree and explicitly archived owned failed fixtures; it excludes other
worktrees, branches, processes and shared Git object maintenance.

The completed identity proof matches **1,758 sources**; closure verifies **619
files** and performs **239 compactions**. All four terminal command receipts are
retained and checked before cleanup. The self-recorded cleanup removes 15 owned
regenerable roots containing **212,315,710 logical bytes** (about 212.3 MB).
This is the removed files' logical size, not a claim about physical free space.
The compressed evidence remains available in this result directory.
