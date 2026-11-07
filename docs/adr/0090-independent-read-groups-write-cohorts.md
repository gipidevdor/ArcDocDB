# ADR-0090 — Read groups across independent same-turn writes

- **Status:** Accepted for incremental implementation under the author's development instruction.
- **Date:** 2026-11-07
- **References:** ADR-0084/0088/0089, REQ-IPC-002, REQ-IDX-001,
  REQ-WAL-002/006, REQ-LIM-003, REQ-AFF-004/008.

## Decision

Extend independent-read scheduling to negotiated opcode 5. Decode and validate
all 1..8 keys once into the existing per-connection workspace. With the engine
READY and the full 65,536-byte frame credit, a group may execute before a
nonempty queued write prefix only if **every** key differs exactly from **every**
queued mutation key. The bound is 64 exact comparisons. Duplicates in the read
group retain their order. An unevaluated conditional mutation, including one
that will conflict, remains a dependency. Reduced-credit, invalid, unnegotiated
and unavailable requests drain earlier writes as before. Explicit mutating
groups and PING retain their barriers.

All canonical GETs execute serially without interleaved mutation. Unrelated
queued writes cannot change any group member; later mutations to a read key
remain logically later. The response buffer owns the complete copied result
before subsequent admission, maintenance, rotation or cache eviction. Full
frame credit does not promise that arbitrary aggregate documents fit: the
existing bounded collector returns one status-5/null rejection on aggregate
overflow. This read-only refusal may precede independent writes and never
authorizes a partial vector. There is no short engine target or new payload arena.

Fresh original-deadline checks follow decode and any drain and surround each
canonical GET. Output queueing preserves the existing response deadline rules.
Every exit clears the group workspace, including errors and nonlocal exits.
Dispatch sends nothing; all pending writes complete strongly before the actor
can send any copied read. A read fault can prevent earlier independent,
unacknowledged writes from being admitted. A later write fault aborts the turn;
outer service cleanup discards responses and closes peers. Existing unknown
outcome, independent SEAL and recovery rules remain unchanged.

No wire, capability, durable-format, public API, thread, wait, transaction or
historical snapshot is introduced. This decision changes physical read/fault
order only for validated full-credit disjoint groups.

## Verification

The [implementation method](../implementazione/letture-gruppo-indipendenti.md)
specifies exact-key and credit controls, duplicate/absence ordering, whole-frame
overflow, single decoding, deadlines, fallback/rotation and failure cleanup.
Real Unix process fixtures cover v1/v2, resident/paged primary storage, failure
before/after strong flush, no response escape and reopening after SIGKILL.
Controlled cohorts measure strong-flush counts, not natural-arrival throughput
or power-loss durability. Complete C1/MC/DC and cross-platform qualification
remain separate gates.
