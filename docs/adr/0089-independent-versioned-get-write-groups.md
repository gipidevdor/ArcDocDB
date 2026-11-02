# ADR-0089 — Versioned GETs across independent same-turn writes

- **Status:** Accepted for incremental integration under the author's instruction.
- **Date:** 2026-11-02
- **References:** ADR-0086/0088, REQ-IPC-002, REQ-TXS-002, REQ-IDX-001,
  REQ-WAL-002/006, REQ-LIM-003, REQ-AFF-004/008.

## Decision

Extend ADR-0088's scheduling rule to negotiated opcode 6 operation 0. A fully
validated versioned GET with response credit at least 60040 may precede a
nonempty queued write prefix only when the engine is READY and its exact binary
key differs from every queued operation. Share the bounded key/credit/state
predicate with ordinary GET, retaining its 60032 credit requirement. Mutations,
including conditional conflicts whose outcome has not been evaluated, participate
in exact dependency checks. Same-key reads and invalid, unnegotiated, unavailable
or insufficient-credit requests retain their barriers. Explicit groups retain
their scheduling rules. No wire, capability, durable format or public API changes.

The existing serial owner excludes intervening mutations. Canonical
`leggi-documento-con-versione` verifies the record, key, index, epoch and cache,
and copies the value with its verified current record CSN (zero for absence).
Unrelated queued writes cannot change that pair; later writes to the read key
remain logically later. Neither the global frontier nor an expected conditional
token substitutes for the read's version. The encoded private response owns all
bytes before later write admission, fallback, rotation or cache eviction.

Fresh absolute deadlines are checked after decode/drain, immediately before and
after canonical GET, and before output is queued. The response deadline starts
at queueing and is never renewed while waiting for strong completion. Dispatcher
execution sends nothing and drains/clears all queued writes before returning.
A read verification failure can stop earlier independent unacknowledged writes
before admission. A later strong error or nonlocal exit aborts the turn; outer
cleanup closes every peer and discards the copied read. Unknown-outcome and
recovery rules of ADR-0088 remain unchanged, including durable writes whose
responses are lost. No transaction, concurrent reader, wait, thread, arena or
persistent state is added.

## Evaluation

Use unchanged-driver before/after measurements of actual strong flush counts
and dispatch time, with ordinary GET and same-key controls; verify exact bytes
and CSNs in every turn. Qualify legacy/resident/paged indexes, v1/v2, cache hits
and verification fallback, mixed conditional writes, expiry, rejection, rotation,
read faults and strong failures. Separate real Unix processes verify no response
before strong completion, no copied read escaping a failed turn and recovery.
See the [method](../../spikes/results/2026-11-02-versioned-read-cohorts/method.md).
Controlled ready cohorts do not establish natural-arrival service throughput,
production SLOs, power-loss qualification or complete C1/MC/DC coverage.
