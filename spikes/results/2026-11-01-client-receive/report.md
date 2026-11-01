# Bounded synchronous client receive

Base: `68b79c69a6d8a7df92f2005132b5c24d377af1e7`.
[Method](method.md), [two C1 readings and decision table](review.md).

The client receives a prefix and available body into its existing full-frame
grant, validates exactly one response and retains a coalesced suffix privately.
The next request must still be sent before its response is decoded. One in-flight
request, exact ID/CBOR/document validation, deadlines, rejection reuse and close/
unknown-mutation semantics remain. No public API, server scheduling or durable
engine path changes. Two owner-local bounded indices replace a mandatory
prefix-only recv; no receive buffer is added or grown. Empty-input receives use
the prefix-attempt deadline check; retained bytes get a fresh check before reuse.

## Confirmed resource effect

The same hashed native diagnostic runs 500 reads per resident/paged ×
1,024/60,000-byte case (2,000 per campaign), through real production server
processes and the injectable native client backend. Every response byte and the
final version/CSN are checked outside timing. Each case has these exact totals:

| Receiver | recv calls | Positive recv | Waiting recv | Reads |
| --- | ---: | ---: | ---: | ---: |
| Immutable base | 1,500 | 1,000 | 500 | 500 |
| Final product | 1,000 | 500 | 500 | 500 |

That is **one fewer recv/read**, 33.3% fewer recv calls and 50% fewer positive
recv calls in this diagnostic. Received byte totals are identical: 519,846 for
1,024-byte documents and 30,007,846 for 60,000-byte documents, including framing
and changing request-ID widths. This is a recv count, not a count of all syscalls;
poll/send/clock and server work remain. Larger or fragmented traffic can require
more than one positive recv. No syscall count claim is made for every workload.

The complete public-client windows retain approximately **131.07 allocated
bytes/read**, the pre-existing envelope/protocol cost. They do not make the whole
client zero-allocation. Empty and 16-byte suffix compaction report zero allocation
over 10,000 calls each. A separate allocation-only fixture covers a 65,524-byte
suffix over 10,000 self-overlapping copies; its terminal record states the actual
allocation result without a CPU/latency claim during the concurrent qualification.

## Timing and limits

There is **no demonstrated uniform throughput or latency improvement**. The
standalone final comparison ranges from 0.871× to 1.090× the pre-edit baseline.
The first final-candidate run overlaps the end of the focused process and is
retained as diagnostic only; the standalone final-candidate-repeat runs alone.
Counterbalanced final campaigns use the same connected clients and production
server, the same public GET-INTO API, 100 alternating warm reads, five pairs per
case and alternating order. Each completes eight cases, 80 windows and 180,000
byte-verified reads; the repeat uses the same four frozen driver hashes.

Both receiver choices pay the same C4 dispatcher and no-unread-suffix guard.
The base function is read from the immutable commit and compiled with the same
safety 3/speed 2/debug 2 policy; it is not a reimplementation of that receiver.
The selector changes only while all workers are parked. Neither server dispatch
nor arrival timing is altered. The common dispatcher overhead belongs to this
calibration and is absent from standalone product timing.

| Mode | Document bytes | Clients | Paired median gain | Repeat |
| --- | ---: | ---: | ---: | ---: |
| resident | 1,024 | 1 | 1.0994× | 1.0055× |
| resident | 1,024 | 8 | 0.8817× | 1.0067× |
| resident | 60,000 | 1 | 1.0367× | 1.0119× |
| resident | 60,000 | 8 | 0.9971× | 1.0185× |
| paged | 1,024 | 1 | 1.0187× | 0.9748× |
| paged | 1,024 | 8 | 1.0188× | 0.9904× |
| paged | 60,000 | 1 | 0.9998× | 1.0030× |
| paged | 60,000 | 8 | 1.0147× | 0.9931× |

These are medians of five paired per-window throughput ratios, not ratios of
separately computed API medians. Every raw window, API latency, exact quantile,
CPU/allocation counter, child outcome and driver hash is retained. Per-request
latency excludes byte validation; window throughput and client CPU/allocation
include validation and synchronization. Client counters exclude server CPU.
Independent analysis checks exact ledgers, counts, quantiles and copied bytes.

The single-hot-key, CSN-1, closed-loop local M4/SBCL 2.6.9 workload is not cold-disk
bandwidth, natural concurrent arrivals, concurrent engine readers, reference
hardware, power-loss qualification or a production SLO. Timing variation remains
material even within counterbalanced campaigns; regressions and outliers above
are not hidden or attributed to other chats. The supported outcome of this
increment is bounded, allocation-neutral receive efficiency and preserved
semantics, not an advertised end-to-end speedup.

## Retained alternatives and failures

The first bulk receiver queries the clock twice on the empty-input prefix path.
Its public and two paired campaigns have mixed timing outcomes. Two C4 spikes
also try readiness-first polling, with and without bulk receive; they have mixed
outcomes and introduce no product policy. The selected implementation removes
only the duplicate empty-input clock query: the next actual read still checks
its deadline. The initial experiment's changed source files are retained separately from
the active product. All campaign variants and raw child logs remain available.

New fixture variants initially fail strict compilation because of a wrong
accessor name and parentheses; a C4 paired-driver variant also misses a closing
parenthesis. Their exact sources and terminal diagnostics are retained. A second
smoke calibrates default compiler policy; final driver versions explicitly use
the product policy. Corrected functional and analysis fixtures pass.

## Functional and qualification scope

The focused final run passes **180 native, wire and actor/client cases**.
Eleven new methods cover complete-frame one-recv output (including 60,000 bytes),
every prefix split and partial next-frame cut, three coalesced IDs/results,
rejection/reuse and invalid output preflight, deferred malformed-response failure,
fresh buffered and prefix-attempt deadlines, EOF/I/O/error/throw cleanup,
negotiated grant canaries and each offset/type invariant independently. A fixture
injects an impossible input-step status to exercise the invariant boundary.

The complete affected qualification records every planned case as an ordered
started/passed pair on each SBCL runtime. Real process, lost-response, SIGKILL
and reopen campaigns exercise all client APIs, formats 1/2 and both primary
storage modes through the unchanged service. The source proof requires both
runtime qualifications and all final campaigns to match the complete current
inventory. Runtime changes must be exactly the system test registration and
local client/state modules; engine, I/O, WAL and indexes remain byte-identical
to the base and inherit its recorded full qualification. This increment does
not claim a new full-engine suite run. Terminal qualification, static/docs,
archive and cleanup outcomes are appended after completion.

The first static bundle stops at link checking: archived Markdown source copies
are mistaken for active manual pages with relative links. The snapshots are
renamed to `.md.source`, with identical SHA-256 bytes, so they remain historical
source evidence rather than duplicate documentation. No product source or active
document changes; both runtime qualifications retain the same inventory. The
maximum-suffix allocation fixture also passes with zero allocated bytes.

The terminal affected qualifications both pass: **278 cases in eight suites on
SBCL 2.6.9 and 2.6.10**, including the 20-method real-process suite and 38 SIGKILL
scenarios per runtime. Started/passed ledgers contain the same planned case IDs.
The final product still reports one positive and one waiting recv/read in every
native diagnostic case. The maximum 65,524-byte suffix fixture also reports zero
allocation across 10,000 copies. No full-engine, power-loss or platform claim is
added to these completed results.

The final static/legal/lint, mutation, trace, links, full-text/evidence and CI
self-test bundle passes, including **all 11 spikes**. The complete documentation
build, damaged-artifact sensitivity, compiled runtime reference and public Unix
example also pass. The example still checks both GET APIs before/after restart.
Archival, source identity and cleanup receipts in this result root are the
terminal authority for their own completed status.

The terminal source proof matches **1,759 files** to both runtime qualifications
and every final campaign. Verified closure checks **710 retained files** and
performs **419 lossless compactions**. Every terminal command receipt is retained
before the guarded cleanup. Raw terminal and fixture bytes are also protected
from Git line-ending conversion.

The guarded cleanup completes after all four terminal command receipts are
retained. It removes 15 owned regenerable roots totaling **215,103,314 logical
bytes** (about 215.1 MB), including this worktree's build, spike outputs and both
runtime caches. This is removed logical file size, not measured physical free
space. Other worktrees, branches, processes and shared Git maintenance are
untouched; the compressed evidence remains available here.
