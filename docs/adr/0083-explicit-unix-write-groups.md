# ADR-0083 — Negotiated explicit Unix write groups

- **Status:** Accepted for incremental integration under the author's instruction.
- **Date:** 2026-11-01
- **References:** [ADR-0056](0056-sessione-locale-m16.md),
  [ADR-0080](0080-group-commit-m1.md), [ADR-0082](0082-bounded-group-append.md),
  REQ-IPC-002, REQ-WAL-002/006, REQ-LIM-003, REQ-AFF-004/008.

## Decision

Expose the existing bounded strong group commit to one synchronous Unix client.
The opt-in `connect-local :write-groups t` sends HELLO with ordered keys
`{0: max-frame, 1: max-inflight, 2: [4]}`. Only that offer receives WELCOME's
opcode list `[0,1,2,3,4]`. The client verifies the exact requested capability
before becoming READY. Default HELLO/WELCOME and opcodes 0..3 keep their exact
previous bytes. Reject malformed, missing or unsolicited capabilities; never
downgrade or retry operations automatically. The public handshake decoders
continue to return exactly two capacities.

Negotiated opcode 4 carries an array of 1..8 operations, each either
`[1,key:bstr,document:bstr]` or `[3,key:bstr]`. Apply the existing key/document
validation and total negotiated body limit of 65,536 bytes to the whole frame.
The administrator's `max-write-group` limit also bounds explicit groups.
Validate every member before copies or engine admission. Without negotiation,
return status 4; invalid shape gives 1 and exceeded budgets give 5.

An explicit group drains earlier opportunistic writes and runs as a barrier;
it is never merged with adjacent commands. Recheck the absolute deadline after
draining and after full validation, immediately before admission. Use the
engine's cumulative reservation, independent CSNs/SEALs and FIFO publication.
One canonical strong flush precedes all results. A capacity refusal while
the engine remains READY returns status 2 without splitting the group.
Post-admission failures propagate uncertainty and never trigger fallback.

Success returns an exact array of positive, strictly increasing u64 CSNs.
`client-write-group` accepts a stable simple vector of existing engine
operation descriptors, an optional selected `:count` prefix and an exclusive
simple u64 result array. It validates the whole response in internal scratch,
checks correlation and the original absolute deadline, then copies results.
Malformed, rejected or late responses expose no partially decoded CSNs.
No result is authorized on an incomplete exit. Known rejection keeps the client
READY; other mutating exchange errors close it and signal `outcome-unknown`.
Nonlocal transfers close ownership while preserving control and retaining
secondary cleanup failures. This exchange guard also serves legacy commands.

Reserve eight span, operation and result slots per connection before listen;
clear references on every dispatch exit. The new server workspace contains
288 payload bytes per connection on 64-bit SBCL, excluding object headers.
The client adds 64 payload bytes of result scratch. Request/key/document copies
remain bounded allocations; this decision does not claim zero allocation.

Each operation's SEAL remains its atomicity point. A group is not an
all-or-nothing transaction: a crash can leave a recoverable sealed prefix,
and a lost response can hide a fully committed group. The application must
resolve an unknown outcome before any deliberate retry.

## Evidence and limits

SPK-03 motivates sharing strong flushes, SPK-07 supplies sealed-prefix/crash
ordering, and SPK-11 supplies framed partial I/O, deadlines and ownership.
The [method](../../spikes/results/2026-11-01-local-write-groups/method.md) and
[results](../../spikes/results/2026-11-01-local-write-groups/report.md) retain
unchanged-driver baselines, serial width comparisons, strict qualification,
independent wire fixtures, injected I/O and real service restart/response-loss
checks. Existing engine rotation, compaction and byte-cut/SIGKILL matrices also
run against the integrated sources. Platform, source identity and measurement
scope remain explicit; no broader concurrency, power-loss or whole-engine
completion claim follows.
