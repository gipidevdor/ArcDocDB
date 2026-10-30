<a id="adr-0044--la-cache-è-un-acceleratore-puro"></a>

# ADR-0044 — The cache is a pure accelerator

- **Status:** Accepted
- **Date:** 2026-10-03
- **Relationship to the specification:** no amendment; implements “Cache” and “Cache and snapshots.”
  **Partially supersedes** [ADR-0025](0025-cache-per-location.md): item 3 (cache
  table) and item 5 (retagging). What remains: unit = record, key = location, CLOCK,
  partition per Serie with a scheduler-provided budget, scan pollution metric.
- **References:** [design analysis](../analisi-progettuale.md) AP-09;
  [architecture](../architettura.md#percorso-di-lettura); INV-M3, INV-A2, INV-A12

<a id="contesto"></a>

## Context

ADR-0025 chooses the key well: a location in an immutable segment never changes its
contents, so the cache needs no invalidation. But it then asks for two things that
bring it back into consistency protocols: retagging entries when compaction
relocates a record, and deleting them when a segment is reclaimed. It also does not define
concurrency for a structure into which many readers insert. The risk register (RSK-10)
already said: measure before adding complexity.

<a id="decisione"></a>

## Decision

1. **Contract.** The cache is a partial function `(segment-id, offset) → byte del record`.
   Only two operations: *lookup* (copy to the caller's buffer, or *miss*) and *insert*.
   **There is no** invalidation, retagging, or per-segment clearing. Since a
   segment-id is never reused ([ADR-0040](0040-manifest-a-record-unico.md)), an entry cannot
   become false: at worst it becomes useless, and CLOCK evicts it.
2. **The system is correct without the cache** (INV-A12). With a zero budget, every read goes
   to the segment. The cache appears in no protocol: neither compaction, reclamation,
   nor recovery.
3. **Structure.** For each partition (Serie) and size class, a **set-associative
   structure**: the location selects a set of 8 contiguous slots; each slot has
   a tag (the location), a seqlock counter, a CLOCK reference byte, and
   a data area in a byte arena. No separate hash table, no probing beyond
   the set: each operation's cost is bounded by construction.
4. **Readers without locks.** Compare the set's tags; in the matching slot, read
   the counter, tag, and bytes, then the counter again — the same seqlock protocol
   as the index ([ADR-0032](0032-seqlock-a-64-bit.md)). Odd or changed counter: **miss**.
   There are no retries: the fallback is a read from the segment.
5. **Opportunistic insertion.** After reading from the segment, the reader tries to
   acquire the mutex of the stripe containing the set **without waiting**; if it is
   busy, the reader gives up. With the mutex: choose the victim using CLOCK, set the counter
   to odd, write the tag and bytes, set it back to even.
6. **Verification.** Every cached record undergoes the same read verification as a
   record read from disk ([ADR-0039](0039-cornice-unica-dei-record.md) §4). If it fails:
   free the slot, count the event (`cache-verify-failed`, with an alert: it indicates
   altered memory or a defect), and **reread from the segment**. Only failed verification
   on a segment read leads to quarantine: the cache cannot accuse the disk.
7. **Warmth after compaction.** Relocated records return to the cache on the next read,
   from the operating system's page cache, where compaction has just written them.
   The loss is measured (SPK-05); if a measurement shows an impact, a new ADR
   evaluates transferring them.

Pattern: set-associative cache with CLOCK replacement (processor caches;
RocksDB HyperClockCache: fixed-size table, reads without locks); key based on an immutable
physical position (block cache for immutable files).

<a id="conseguenze"></a>

## Consequences

- The cache leaves the set of components that can compromise consistency: a defect in it
  produces at most a *miss* or a reread. Its policy (CLOCK, budget) is
  class C3; the copy and verification path remains C1.
- Compaction and the writer do not touch the cache.
- Two reads of the same location may collide in the same set: this is an efficiency
  issue, measured by the hit rate.

<a id="alternative-considerate"></a>

## Alternatives considered

- *Retagging on relocation (ADR-0025):* preserves warmth, but makes the writer update
  a structure shared with readers and makes the cache part of the compaction protocol.
- *Mutex on reads as well:* simpler to verify, but puts a lock on the read path,
  which the design excludes.
- *No engine cache, only the page cache:* the leanest option; the specification requires a cache
  partitionable by Serie against bursts, which the page cache does not offer. With this ADR,
  the choice remains open at zero cost: zero budget.

<a id="valutazione"></a>

## Evaluation

- Risks: RSK-10 (accepted, measured by SPK-05).
- Verification: differential test with cache enabled and with zero budget (same answers);
  stress with concurrent insertions and verification; bit-flip injection into the arena
  (detected, reread, never quarantine).
