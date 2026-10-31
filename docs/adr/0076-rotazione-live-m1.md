# ADR-0076 — Live segment rotation in the serial M1 engine

- **Status:** Accepted for integration authorized on 2026-10-31; serial M1 implementation
- **References:** ADR-0004, ADR-0055, ADR-0073; REQ-STO-002, REQ-STO-003,
  REQ-STO-004, REQ-REC-001, REQ-MVC-006, REQ-AFF-018

## Decision

Connect the canonical verified ACTIVE checkpoint and fresh-segment publisher to
normal M1 writes. Before reserving the next data CSN, rotate when the complete
record plus SEAL would exceed the file byte quota, or the ACTIVE record quota
has been reached. A known segment-count limit refuses with READY and unchanged
bytes. Invalid input and primary-index preflight still precede durable changes.

Maintenance runs within the same serial BUSY admission as the following write.
It verifies all canonical sources, strict CSN order and the exact runtime CSN
frontier; the old ACTIVE must be completely sealed with durable and written
frontiers equal. Inventory chooses a fresh ID without reusing orphan names.
The existing CONTROL publisher closes the old prefix and decides the new ACTIVE;
parent fsync and canonical-name stabilization precede volatile adoption.

Retain the existing CSN/snapshot/epoch family, primary backend and logical source
token. Build a complete new CLOSED lookup directory, invalidate the automatic
resolver's borrowed row cache, replace the idle GET context, and adopt a fresh
controller for the new log using the same runtime registry. Only after this
publication may the next request take a CSN and perform its normal strong commit.
No new wire operation or durable format is introduced.

The serial M1 profile admits no simultaneous GET borrower or historical snapshot
consumer. After adoption, retire old source sets and unused explicit FDs, retaining
one canonical set, the current writer's two capabilities and the parent directory.
This retirement rule does not authorize concurrent-reader reclamation or compaction.
Retired segments are never reopened for append, rewritten, truncated or deleted.

Any failure or nonlocal exit during maintenance faults the request before ACK;
completed durable effects remain for normal recovery. There is no rollback or
transparent request retry. Known total-segment exhaustion remains an operator
capacity boundary until compaction is integrated.

## Verification and limits

[Implementation evidence and exact commands](../../spikes/results/2026-10-31-live-rotation/report.md).

Check byte and record boundaries, v1/v2, legacy/resident/paged primary paths,
unchanged registry/scope identities and closed bytes, repeated rotation and FD
bounds, rejection before effects, fault injection and real SIGKILL/restart across
canonical and volatile publication. Add a real Unix service workload crossing a
segment boundary. Local tests do not qualify power loss, complete M16, multiseries,
concurrent snapshots, load P99 or phase gates.

The first implementation verifies the whole bounded canonical set at each rotation.
This trades rotation latency for reuse of established recovery proofs. Incremental
closed-set verification requires a later measured optimization with equivalent
integrity checks; a fully reopened/reset engine is rejected because it would replace
the live CSN family and make handle identity unstable.
