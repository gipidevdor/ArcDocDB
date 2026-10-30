<a id="adr-0007--clean-e-merge-distinti-copy-on-write"></a>

# ADR-0007 — Separate CLEAN and MERGE, copy-on-write

- **Status:** Accepted
- **Date:** 2026-10-01
- **Relationship to the specification:** records a specification decision (“Clean,” “Merge,”
  “General compaction policy,” “Clean/Merge workflow,” “Parallel compaction”)
- **References:** [07 Compaction](../07-compaction.md), INV-C1…INV-C4, INV-C7…INV-C10, INV-R1

<a id="contesto"></a>

## Context

Append-only storage accumulates dead versions. Reclaiming space and reducing fragmentation
are two needs with different degrees of urgency.

<a id="decisione"></a>

## Decision

- **CLEAN:** 1 segment → 1 new immutable segment containing only live/required records.
- **MERGE:** N small segments → 1 new immutable segment.
- Both are copy-on-write: sources are never modified; they become `OBSOLETE`
  after the swap and are deleted only when no one uses them.
- A segment with `live = 0` is deleted directly; one with `live ≈ total` is left untouched.
- No automatic MERGE after a CLEAN; a cleaned segment may remain small.
- Produced segments have no size requirements and never receive new writes.
- Compaction can run in parallel by segment and by Serie; no single global worker.
- The new segment becomes visible only after it is durable; readers are not blocked
  globally.

<a id="conseguenze"></a>

## Consequences

- Until the swap, an interrupted operation leaves no effects and can be repeated.
- Space is reclaimed without depending on defragmentation.
- Compaction requires additional space equal to the data copied.
- The number of segments may grow (small segments that are not merged).
- The swap must coordinate with the Serie's writer and with snapshots.

<a id="alternative-considerate"></a>

## Alternatives considered

- *A single compaction operation that cleans and merges:* simpler to describe, but ties
  space reclamation to heavier work that is harder to defer.
- *In-place reuse of dead space:* contrary to append-only storage.

<a id="valutazione"></a>

## Evaluation

- Risks: RSK-02 (swap), RSK-08, RSK-10.
- Verification: SPK-07 (swap/reclaim model), SPK-06 (interference); FI-06…FI-09.
- Open: manifest and swap (QA-04, QA-24), thresholds (QA-11), tombstones (QA-15).
