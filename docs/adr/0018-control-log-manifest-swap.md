<a id="adr-0018--control-log-della-serie-manifest-dei-segmenti-e-swap-atomico"></a>

# ADR-0018 — Serie control log: segment manifest and atomic swap

- **Status:** Accepted; **partially superseded by [ADR-0040](0040-manifest-a-record-unico.md)**: a single record type (EDIT), decision before rename, no timestamp or lineage in the log, no deletion based on absence. These remain: the control log is the manifest; a swap is a single record.
- **Date:** 2026-10-03
- **Relationship to the specification:** closes QA-04 and QA-13; implements INV-C7, INV-C8, INV-C9
- **References:** [on-disk formats](../formati-su-disco.md#control-log),
  [architecture](../architettura.md#compaction), [ADR-0013](0013-log-structured-segmento-active-come-log.md)

<a id="contesto"></a>

## Context

An authoritative, atomic record of a Serie's set of valid segments is needed,
so that a crash at any point in the compaction workflow can be recognized and resolved.

<a id="decisione"></a>

## Decision

1. **`wal/control.log`** is an append-only log of `{seq, tipo, payload, CRC32C}` records:
   `SEG-OPEN`, `SEG-CLOSE`, `SWAP`, `SEG-OBSOLETE`, `SEG-RECLAIMABLE`, `SEG-DELETED`,
   `CHECKPOINT`. Only the Serie's logical writer writes it, with group commit.
2. **A segment's state is the last record concerning it.** The physical `ACTIVE` state
   is the last `SEG-OPEN` without a `SEG-CLOSE`.
3. **Swap = one record.** `SWAP {op-id, output: [id…], sources: [id…], lineage-min}` is
   compaction's single atomicity point: before the record, outputs are invisible;
   afterward, they are final and sources are `OBSOLETE`. The record is written only after the
   outputs (segment + hints + indexes) have been flushed and renamed from `.tmp` to their final names,
   with directory `fsync`.
4. **Relocation after the swap.** Conditional index relocations
   ([ADR-0015](0015-primary-index-swiss-table-swmr.md)) follow the `SWAP` record; if the
   process crashes between them, the index is rebuilt from output hints on restart.
5. **Log compaction.** When it exceeds a threshold, the writer writes `control.log.new`
   with a single `CHECKPOINT` listing the current set of segments with state, timestamp, and
   lineage, flushes it, renames it over the original, and synchronizes the directory.
6. **Stabilization timestamp** (for the 50 s rule): the time of the
   `SEG-CLOSE` or `SWAP` record that made the segment immutable, from a monotonic clock, stored
   in the record. After a restart, segments use the time recovery finishes.
7. On restart, `.tmp` files and segments not mentioned in the log are orphans and are
   deleted.

Patterns: MANIFEST + CURRENT (LevelDB/RocksDB); atomic rename + directory fsync.

<a id="conseguenze"></a>

## Consequences

- Every row in the [crash table](../11-recovery.md#casi-di-compaction-interrotta) has
  a deterministic response.
- A single structural durability mechanism per Serie, in the same total order as
  writes (the writer).
- The log is small: one record per structural event, not per write.

<a id="alternative-considerate"></a>

## Alternatives considered

- *Manifest rewritten in full at each event:* simple but O(segments) per event.
- *Swap record in the data log:* mixes structure and data; the data log rotates.

<a id="valutazione"></a>

## Assessment

- Verification: FI-06, FI-07, FI-08, FI-09; model in SPK-07.
