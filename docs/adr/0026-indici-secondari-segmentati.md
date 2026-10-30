<a id="adr-0026--indici-secondari-segmentati-un-file-immutabile-a-formato-fisso-per-segmento-delta-in-memoria-per-lactive"></a>

# ADR-0026 — Segmented secondary indexes: one immutable fixed-format file per segment, in-memory delta for ACTIVE

- **Status:** Accepted; **clarified by [ADR-0039](0039-cornice-unica-dei-record.md) and [ADR-0042](0042-tombstone-e-indice-dei-vivi.md)**: the key Bloom filter is a hint section and serves tombstone disposal; value filters are a section of `.idx` files; there is no `.bloom` file. The `ACTIVE` delta consists only of append-only arrays (no in-memory ART).
- **Date:** 2026-10-03
- **Relationship to the specification:** closes QA-25; implements "Secondary index," "Secondary index
  delta," "Index snapshot." Author's decision (2026-10-03): indexes have a predefined
  format and are divided by segment.
- **References:** [architecture](../architettura.md#indici-secondari),
  [on-disk formats](../formati-su-disco.md#file-indice), INV-I1, INV-I2

<a id="contesto"></a>

## Context

> **Addition 2026-10-15:** [ADR-0053](0053-ricerca-full-text-indici-invertiti.md)
> adds a full-text type to the `.idx` family: dictionary by field/term,
> postings, frequencies, and positions, with an ACTIVE delta and complete generations.
> For these indexes it clarifies publication, snapshots, build, and rebuild;
> the visible version is also resolved through the engine's retained
> versions, rather than being limited to the primary index's current entry.
> The concrete binary format remains to be fixed before implementation.
> Analysis algorithms and per-document cost require their own measurements:
> O(1) append per entry does not mean O(1) indexing per document.

Secondary indexes must remain consistent with commits, snapshots, and recovery, cost little for the
writer, and support optimal algorithms (sequential, SIMD-friendly). The specification calls for
type-specialized structures and a base + delta model.

<a id="decisione"></a>

## Decision

<a id="segmentazione"></a>

### Segmentation

**Every closed segment owns its immutable index files**, produced together with the
segment (when closing `ACTIVE`, or by compaction for its outputs):

- `<id>.hint` — segment primary index ([ADR-0015](0015-primary-index-swiss-table-swmr.md));
- `<id>.<indice>.idx` — one file for each secondary index defined in the contract;
- `<id>.bloom` — Bloom filter on the segment's keys.

The specification's "base index" is the **union of closed-segment indexes**; the "delta" is
the **in-memory index of the `ACTIVE` segment**, updated by the writer within the batch (append to
specialized arrays, O(1) cost per entry). "Asynchronous merge" is segment closure
(which materializes the delta into files) and segment MERGE (which merges the source
indexes). There are no other structures to merge or maintain.

<a id="formato-fisso"></a>

### Fixed format

All index files share the same **shape**: fixed header (magic, format
version, index type, segment-id, entry count, section offsets), fixed-width
or offset-based array sections, footer with CRC32C. They are read with `pread` into reused
buffers or loaded in full into specialized arrays: no parsing, no
per-entry allocation, sequential access.

| Type (from contract) | Structure in the segment file | Algorithms |
|---|---|---|
| string / prefix | sorted keys with front-coding + offset array (in-memory ART only in the delta) | binary search, sequential prefix scan |
| number / date / range | sorted fixed-width array of `(valore, riga)` | binary search, range scan, vectorizable |
| category | value dictionary + row posting lists (delta-encoded) | sequential intersection/union |
| boolean / low cardinality | bitmap per value (one word per 64 rows) | word-level AND/OR/XOR, SIMD-friendly |
| Bloom | bit array with k functions derived from the 64-bit hash | absence test |

A "row" is the record's ordinal in the segment; the hint maps the ordinal to offset, key,
version, and CSN.

<a id="query"></a>

### Queries

An index query visits segments **in parallel** (they are independent), obtains rows
per segment, converts them to `(chiave, versione, CSN)` through the hint, and **filters for
visibility** through the primary index: a row is a result only if its version is the one
the snapshot (or read committed) sees. No deletion in segment indexes:
superseded versions are discarded by the filter and disappear from the file when CLEAN produces the
new segment.

<a id="coerenza-e-recovery"></a>

### Consistency and recovery

- **Synchronous** update with commit (within the writer batch), therefore consistent with the
  CSN by construction.
- Segment indexes are derived data: on restart, the `ACTIVE` delta is rebuilt
  by scanning the segment; a missing or corrupt index file is regenerated from the segment.
- Contract changes (new index) generate missing files in the background, segment
  by segment; the contract records the segment-id from which the index is complete.

Patterns: immutable per-segment indexes merged by compaction (Apache Lucene; LevelDB/RocksDB
SSTables with per-file filters); posting lists and bitmaps (Lucene, Roaring).

<a id="conseguenze"></a>

## Consequences

- The writer pays only for in-memory appends; files are built at close, outside
  the commit path.
- Immutability and fixed format make SIMD, prefetch, and `pread` without parsing natural.
- Query cost grows with segment count: this is why MERGE exists;
  the Bloom filter and per-segment min/max metadata reduce the number of segments visited.
- A single persistence mechanism for all indexes (the segment and its files).

<a id="alternative-considerate"></a>

## Alternatives considered

- *Global secondary index per Serie (in-memory B+ tree/ART) with LSM delta:* pointer
  structures, merges separate from compaction, its own persistence; more mechanisms.
- *Memory-only indexes rebuilt on restart:* requires rereading all documents.

<a id="valutazione"></a>

## Assessment

- Verification: "indexed query" benchmark with increasing segment counts; snapshot
  consistency tests; FI-10 (regeneration).
- Reconsider if: query latency with many segments (e.g. 1000) exceeds the target even
  with Bloom and min/max → ADR on a summary index per Serie.
