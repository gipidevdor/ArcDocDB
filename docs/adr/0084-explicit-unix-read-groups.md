# ADR-0084 — Negotiated serial Unix read groups

- **Status:** Accepted for incremental integration under the author's instruction.
- **Date:** 2026-11-01
- **References:** [ADR-0056](0056-sessione-locale-m16.md),
  [ADR-0073](0073-indice-automatico-operativo-m1.md),
  [ADR-0079](0079-cache-record-m1.md), [ADR-0083](0083-explicit-unix-write-groups.md),
  REQ-IPC-002, REQ-IDX-001, REQ-CCH-002/004, REQ-LIM-003, REQ-AFF-004/008.

## Decision

Expose canonical point reads as one bounded Unix request to reduce synchronous
round trips. `connect-local :read-groups t` offers optional opcode 5. HELLO's
optional key 2 contains an exact ordered nonempty subset of `[4,5]`; WELCOME
contains `[0,1,2,3]` followed by exactly those optional opcodes. Preserve default
and write-only handshake bytes and the public decoders' two capacity values.
Verify both requested capabilities before READY, with a fresh absolute deadline
check. Every incomplete handshake closes ownership, including nonlocal exits.
No automatic downgrade, split or retry.

`client-get-group(client, keys, :count count)` accepts a stable simple-vector
prefix of 1..8 keys, each 1..1,024 bytes. Opcode 5 payload is an array of those
byte strings. Success returns an equally sized array of `[true,document:bstr]`
or `[false,null]`. The client returns one new simple vector of copied document
octets or NIL for absence, preserving order and duplicates. A CBOR null document
is an octet vector and remains distinct from absence.

All keys are validated before copies or engine GET. Drain earlier collected
writes, recheck the original deadline after draining/validation and between
reads, then complete the group in one serial dispatch without peer waits or
interleaved data operations. The actor and trusted nonreentrant callbacks
provide one current serial view; this adds no historical MVCC or concurrent
snapshot guarantee. Legacy read barriers also recheck after draining.

Use existing canonical GET, verified record cache and automatic RAM/paged
primary storage. Read each value into the existing full 60,000-byte connection
scratch, release its pin, and append only to private response storage. Reuse the
exclusive existing group workspace for validated key copies and clear it on
every exit. There is no new server payload arena, persistent format or flush.
The administrator's write-group limit continues to govern writes only.

Check the actual complete response against the negotiated body limit, at most
65,536 bytes. Overflow rejects the whole group with status 5 and an error/null
frame; no partial vector escapes and the engine remains usable. Never pass a
too-small target to engine GET. Unnegotiated opcode 5 returns 4, invalid member
shape returns 1 and key/count budgets return 5. Existing GET's conservative
minimum response grant remains unchanged; a small negotiated frame may serve
read groups whose actual complete response fits.

The client adds eight fixed u64 span slots (64 payload bytes, excluding headers).
Validate every result, embedded CBOR document, count and end before document
copies. Verify correlation and the original deadline before exposing the
private vector. Malformed/incomplete read exchanges close ownership and retain
their causes/control; they do not signal mutation outcome uncertainty.
Known rejection retains READY. Returned copies remain bounded allocations.

## Evidence and limits

The [method](../../spikes/results/2026-11-01-local-read-groups/method.md) and
[results](../../spikes/results/2026-11-01-local-read-groups/report.md) retain
unchanged-driver baselines, independent wire fixtures, budget/barrier/lifetime
checks, real Unix processes, cache fallback and restart checks, strict runtime
qualification and serial widths 1/2/4/8. SPK-01/07/11 inform lookup, publication
and transport checks. Neither read grouping nor local measurements qualify
whole-engine concurrency, physical power loss, unexecuted platforms or zero
allocation.
