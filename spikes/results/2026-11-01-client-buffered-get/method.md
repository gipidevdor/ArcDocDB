# Caller-owned GET output — method before product edits

Base: `d8b976ba9e5cddaad39dace43f5a4618abcf3300`, 2026-11-01. Add an ordinary
Unix client GET variant returning FOUND/byte-count into a reusable caller-owned
octet buffer. Keep the existing allocating GET API. Use the same complete
response correlation, minimal CBOR/document validation, absolute deadline,
owner/state, rejection and close-on-incomplete rules. No wire, server, engine,
durability, scheduling or negotiated-capability change is proposed.

Require a complete 60,000-byte output grant from the supplied offset before
encoding, ID consumption or I/O. Reject aliases with the key and client-owned
input/output buffers. Absence and pre-copy validation/rejection leave output
unchanged. Only the returned successful prefix is authorized; a deadline or
nonlocal exit after copying may leave unconfirmed bytes. Never expose borrowed
wire spans. The existing allocating decoder and the new path must share the
same canonical GET validation rather than maintain two grammars.

Before product edits, record the public allocating API on actual Unix server
processes. Eight cases: resident/paged primary storage, 1/8 client threads and
1,024/60,000-byte minimal CBOR documents. One synchronous request per private
client; synchronized window starts followed by continuous closed-loop reads,
with no server cohort gate, batching timer or artificial arrival delay. Five
windows of 500 reads per worker: 40 windows and 90,000 checked operations.
Allocate worker buffers and latency arrays before measurement, warm 100 reads,
and collect once before each window. Parent wall/CPU/reported allocated bytes
and cumulative GC CPU ticks surround only the active window. Preserve every
raw latency and exact nearest-rank quantile. GC CPU is not a pause distribution.

Validate every returned byte, each private client's ID count, final canonical
value/version (CSN 1), actual server primary mode and child outcome. Keep cold
serialization, thread construction, connection startup and final version probes
outside measurement. The main allocation counter is process-wide, sampled when
workers are quiescent; remaining envelope/protocol allocation is in scope.
Fixed per-window synchronization is included in wall time.

Freeze parent/server/common drivers before the baseline. After integration run
both the allocating control and caller-buffer API with those same hashes;
repeat the latter if timing or GC variability needs resolution. Report actual
completed throughput, allocation and latency separately, including regressions.
Local M4 observations do not qualify natural arrivals, concurrent engine readers,
RSS ceilings, reference hardware or power loss.

Qualify output bounds/canaries, every preflight gate, wrong IDs/kinds/statuses,
malformed/minimal CBOR and trailing data, absence, partial I/O, EINTR/EAGAIN,
deadlines before/after decoding/copy, nonlocal exits, rejection reuse and real
process/reopen behavior. Perform two C1 readings and a compound-decision table.
Run strict affected suites on both SBCL runtimes, static/trace/docs checks and
relevant spikes. Retain failures and exact source identities; archive/hash and
losslessly compact completed evidence before owned cleanup and non-forcing
publication. Other worktrees and branches stay outside this task.

The initial allocating campaign uses a generic sequence MISMATCH inside the
request timer and is retained as `baseline/` with its exact driver variant.
A separate comparison microfixture exposes its verification cost; the corrected
`baseline-final/` uses one shared, typed, bounded exact byte-prefix validator.
Per-request latency stops immediately after the public API returns; complete
window wall/CPU/allocation still includes validation and synchronization.
The initial microfixture's identical-object EQUALP is only an identity control;
the distinct-buffer microfixture compares actual value bytes. Both raw methods
remain retained. Only campaigns with identical driver hashes may be compared.

The independent-process legacy control also exhibits severe timing variation.
Before interpreting a new-API gain, use a second frozen driver which alternates
copy/into on the same connected clients and server for each case. Warm both APIs,
park workers before changing the dispatcher, counterbalance order by repetition,
and require exact ID/CSN/byte outcomes. Run the complete eight-case, 80-window,
180,000-operation paired campaign twice with identical four-driver hashes.
Report paired medians and both campaigns, not a selected best window. Supplement
process-wide allocation sampling with alternating same-thread allocation windows;
keep full-byte checks identical and outside API latency timers.
