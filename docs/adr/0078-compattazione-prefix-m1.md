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
Always reserve a spare segment and an unused u32 segment ID for the next recovery.
Before outputs, reserve three CONTROL revision increments: replace plus normal
prune and a later recovery checkpoint, or replace plus recovery checkpoint/prune
when interrupted. Counter exhaustion refuses before output creation. No-op planning releases
only its temporary readers and preserves canonical bytes and READY admission.
`statistiche-compattazione-motore` exposes scalar completion/reclaim counters
and current canonical/live record counts; counters restart with the handle.

At a normal rotation boundary, probe automatically after four CLOSED segments
when historical records exceed twice the live count, or when rotation would consume the recovery
slot, or a reopened handle already uses that slot. Unique append traffic avoids unnecessary compaction scans.
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

## Review refinement — 2026-10-31

[Review and regression evidence](../../spikes/results/2026-10-31-compaction-review/report.md)
cover exhausted counters and capacity. Startup checks room for its fresh ACTIVE
before any checkpoint or reclamation, preserving canonical bytes on refusal.
Ordinary writes retain one segment of recovery headroom, triggering compaction
earlier under pressure. Repeated read-only reopenings still consume segment IDs
and capacity; insufficient configured capacity is an explicit refusal, never an
oversized canonical checkpoint. Raising the budget permits recovery.

Planning now observes already checked ordinary frames during the strict canonical
order/validator pass. This removes a separate full-source planning scan; producer
validation, independent output/original byte comparisons, ordering, membership,
coverage and post-publication verification remain unchanged. No per-key table is
introduced and default recovery/rotation callers install no visitor.

## Bounded performance refinement — 2026-10-31

[Performance qualification](../../spikes/results/2026-10-31-engine-performance/report.md)
adds a conservative minimum live CSN for overwrite-heavy compaction. With history
above twice the current live count, visit the frozen current index once, using
its existing resident or paged storage, and verify exact live count and CSN range.
Frames below that minimum cannot be current and need no membership lookup.
The same traversal fills a fixed 512-byte live-CSN signature. An absent bit
proves absence; a present bit still requires exact membership. Modulo collisions
therefore cost extra lookups and cannot discard a live version, including when
an ancient cold key keeps the global minimum low. The signature is enabled only
after the independent live-count/range checks complete. Empty
indexes still retain the maximum-CSN witness; append-heavy inputs use zero as a
safe disabled threshold. Cold live keys keep the threshold low and are retained.

The shortcut is private maintenance metadata. Independent output membership,
exact original-byte comparison, coverage, ordering and high-water checks remain
mandatory; an incorrect derived threshold must fail before CONTROL publication.
The comparison window retains its exact source ID and reuses that immutable
binding while the requested bytes remain inside the already validated window.
Standard bounded vector comparison replaces the byte-at-a-time comparison loop.
No per-key table, retained key copy or persistent format is added.

The shared disk-index cache avoids clearing bytes immediately overwritten by a
complete read. A partial frame still clears its unused tail; no tag is published
until the read completes. Failed reads leave the frame unavailable. This applies
to paged reads, writes, migration, replay and maintenance without changing quotas.
