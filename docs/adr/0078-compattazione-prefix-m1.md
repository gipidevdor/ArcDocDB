# ADR-0078 — Full-prefix compaction in serial M1

- **Status:** Accepted for integration authorized on 2026-10-31; serial current-only M1
- **References:** ADR-0042, ADR-0073, ADR-0076; REQ-CMP-001, REQ-CMP-007,
  REQ-CMP-008, REQ-CMP-009, REQ-REC-001, REQ-AFF-018

## Decision

Compact all canonical CLOSED prefixes and the fully durable ACTIVE together.
One BUSY owner excludes requests throughout maintenance; active snapshots, EBR
readers or retirement obligations refuse before effects. This is the existing
single-reader current-only M1 profile, not concurrent historical compaction.

Use the existing primary backend to select exact current live locations. Retain
the maximum-CSN record even if deleted: an all-deleted archive must preserve its
CSN high-water. Full-prefix coverage proves that discarded tombstones cannot
resurrect an older version elsewhere. Copy ordinary frames byte-identically in
strict CSN order into fresh ascending IDs; publish a fresh header-only ACTIVE
after every output ID. No SEAL, prepared record or outcome is copied, and no new
data CSN or persistent format is introduced.

Bound the output and comparison windows by file/maximum-record geometry. Source
metadata is proportional to the configured segment limit, never key count.
Independent verification checks framing, CRC, ordering, exact original bytes,
current membership, live count and CSN high-water before publication. The first
canonical CONTROL checkpoint decides the complete replacement and marks every
input REMOVED. Then retire old readers, relocate current index locations with
unchanged CSNs, and install the new sources/controller using the same runtime
registry and scope. Paged relocation path-copies the existing disk tree without
building a full resident index. Legacy sealed images/deltas are invalidated when
the physical source identity changes; automatic RAM/paged storage remains coherent.

Only positive membership in durable REMOVED authorizes deletion. Validate the
archive/series header, exact segment ID and the opened inode; consume a distinct
single-use canonical-removal capability. Close old borrowers before unlink,
synchronize the parent, then publish a second CONTROL checkpoint that removes
absent REMOVED entries while preserving every live source and ID high-water.
Startup performs the same completion before runtime adoption. Any maintenance
error or nonlocal exit faults admission; regular recovery resolves durable
effects. No rollback, hidden retry or acknowledgment occurs on failure.

## Policy and API

`arcdocdb.engine:compatta-motore` returns a copied result plist. Without `:force t`,
accept only plans saving at least 25% of canonical segment bytes including the
fresh ACTIVE. Force bypasses the gain threshold, not output capacity or integrity.
Always reserve a spare segment for the next recovery. No-op planning releases
only its temporary readers and preserves canonical bytes and READY admission.
`statistiche-compattazione-motore` exposes scalar completion/reclaim counters
and current canonical/live record counts; counters restart with the handle.

At a normal rotation boundary, probe automatically after four CLOSED segments
when historical records exceed twice the live count, or when the total segment
limit is reached. Unique append traffic avoids unnecessary compaction scans.
Automatic maintenance precedes reservation of the next request's data CSN and
uses the same logical RAM/paged index. No socket operation or client setting is
needed. This supersedes ADR-0076's pending-compaction capacity limitation; its
closed-segment immutability still holds for retained canonical files.

## Verification and limits

[Exact qualification and performance records](../../spikes/results/2026-10-31-engine-compaction/report.md).
Tests cover both formats, RAM/paged and legacy compatibility, deleted archives,
repeated automatic reclamation, gain/capacity no-op, output corruption,
location-only relocation guards, IO faults, nonlocal exits, retained snapshots,
real SIGKILL/restart boundaries and the real Unix service.

This implementation scans the bounded canonical set independently at multiple
proof boundaries. Synchronous maintenance pauses its request; hot GET benchmarks
must not be interpreted as loaded socket P99. Concurrent/background CLEAN/MERGE,
partial-source selection, historical MVCC, multiseries, power-loss qualification
and reference-platform performance remain separate work. General requirements
retain their existing qualification status.
