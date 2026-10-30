<a id="adr-0009--indici-immutabili-per-i-reader-atomic-swap"></a>

# ADR-0009 — Immutable indexes for readers, atomic swap

- **Status:** Accepted
- **Date:** 2026-10-01
- **Relationship to the specification:** records a specification decision (“Index,” “Secondary
  index,” “Secondary index delta,” “Index snapshot”)
- **References:** [08 Indexes](../08-indici.md), INV-I1, INV-I2

<a id="contesto"></a>

## Context

Reads and writes must proceed without blocking each other, and compaction must be able
 to replace segments without stopping readers.

<a id="decisione"></a>

## Decision

- Primary index `_id → location` (segment-id, offset, length, version), in RAM, optimized
  for average O(1) lookup; compact structure (consider a Swiss Table), without one Lisp
  object per entry.
- Secondary indexes specialized by query type: ART for strings/prefixes, B+ tree or
  equivalent for ranges, posting lists for categories, bitmaps for low cardinality.
- Per-segment Bloom filter used only to test absence, never as a definitive location lookup.
- Secondary indexes with frequent changes: immutable base + delta, asynchronous merge.
- Indexes are immutable for readers: a new version becomes visible through an atomic
  swap; readers already active finish on the previous version.

<a id="conseguenze"></a>

## Consequences

- Readers do not acquire locks on indexes.
- Old index versions must be retained while they have readers: the same reclamation
  problem as segments.
- The primary index must fit in RAM: a capacity and restart-time limit.
- For the primary index, updated on every write, the “new version + swap” model cannot
  be applied literally: an equivalent mechanism must be defined.

<a id="alternative-considerate"></a>

## Alternatives considered

- *Mutable indexes protected by read/write locks:* simple, but readers contend with
  the writer and compaction.
- *Primary index on disk:* no RAM limit, but at least one additional read per GET.

<a id="valutazione"></a>

## Assessment

- Risks: RSK-02, RSK-07, RSK-13.
- Verification: SPK-01 (primary-index prototype), SPK-07 (swap model); FI-06, FI-10.
- Open: QA-24 (primary-index mechanism), QA-03 (persistence), QA-25 (secondary
  indexes), QA-16 (reader tracking).
