<a id="adr-0025--cache-dei-record-per-location-arena-a-slot-clock-per-partizione"></a>

# ADR-0025 — Record cache by location, slot arena, CLOCK per partition

- **Status:** Accepted; **partly superseded by [ADR-0044](0044-cache-acceleratore-puro.md)**: set associativity replaces the hash table (item 3), no relabeling (item 5), no per-segment eviction. Unit, key, CLOCK, and partitions remain.
- **Date:** 2026-10-03
- **Relationship to the specification:** closes QA-17; implements [ADR-0010](0010-cache-clock.md)
- **References:** [architecture](../architettura.md#percorso-di-lettura), INV-M3

<a id="decisione"></a>

## Decision

1. **Unit:** the record (document + header).
2. **Key:** the location `(segment-id, offset)`. Closed segments are immutable: an entry
   never becomes stale, no invalidation is needed, and INV-M3 holds by construction,
   because the reader reaches the cache with the location of the version its snapshot sees.
3. **Memory:** a per-Serie arena of fixed-size slots in classes (e.g., 1, 2, 4, 8, 16 KB),
   in `(unsigned-byte 8)` arrays; `pread` copies the record into the slot. Cache index:
   compact hash table `(segment-id, offset) → slot`, same layout as the primary index.
4. **Replacement:** CLOCK per partition; one partition per Serie, with a budget assigned
   by the scheduler (configurable per-Serie quota, the rest proportional to recent use
   with a guaranteed minimum). The reference bit occupies one byte per slot.
5. **Reads during compaction:** when the writer applies a conditional relocation,
   if the old location is cached, the entry is **relabeled** with the new location
   (same contents): no loss of cache warmth.
6. The operating system page cache is an uncontrolled second level; benchmarks
   measure with a dataset larger than RAM.
7. **Scan-pollution metric:** fraction of slots inserted by scans and evicted without
   ever being reread. If it exceeds 30 % in a reference benchmark, a new ADR
   evaluates 2Q (as specified).

Pattern: block cache with CLOCK (PostgreSQL buffer pool, clock-sweep); key based on
immutable physical location (RocksDB block cache for immutable SSTs).

<a id="conseguenze"></a>

## Consequences

- No invalidation on writes; the cache does not participate in consistency protocols.
- The record stays cached as long as the segment exists, even if the version is dead:
  space is freed by CLOCK or when the segment is reclaimed (its entries are removed).
- Per-Serie cost is a budget to control: part of the scheduler.

<a id="valutazione"></a>

## Assessment

- Verification: SPK-05; GET benchmarks with cache hits/misses and concurrent scans.
