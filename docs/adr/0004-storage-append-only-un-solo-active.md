<a id="adr-0004--storage-append-only-con-un-solo-segmento-active"></a>

# ADR-0004 — Append-only storage with a single ACTIVE segment

- **Status:** Accepted
- **Date:** 2026-10-01
- **Relationship to the specification:** records a specification decision (“Append-only
  storage,” “Segments,” “Segment metadata”)
- **References:** [03 Storage](../03-storage.md), INV-S1…INV-S6

<a id="contesto"></a>

## Context

The system needs fast writes on NVMe, historical versions for MVCC, and crash safety that is
simple to demonstrate.

<a id="decisione"></a>

## Decision

- Storage is append-only: no in-place changes.
- Each Serie has exactly one `ACTIVE` segment, the only writable segment.
- A segment that leaves the `ACTIVE` state is immutable forever and is never reopened.
- New writes always go into a new `ACTIVE` segment; never into a segment produced by
  compaction.
- Target size of writer-created segments: ~256 MB, configurable per Serie.
- States: `ACTIVE → CLOSED → OBSOLETE → RECLAIMABLE → DELETED`.
- Segment metadata is derived, reconstructible data.

<a id="conseguenze"></a>

## Consequences

- Sequential writes; old versions remain available for snapshots at no additional cost.
- An immutable file cannot be corrupted by an interrupted write: crash safety concerns only
  the `ACTIVE` segment and state changes.
- Dead space accumulates: compaction is required ([ADR-0007](0007-clean-e-merge-distinti.md)).
- Immutable segments are easy to cache, copy, and verify.
- Every read goes through an index that must know the current location.

<a id="alternative-considerate"></a>

## Alternatives considered

- *In-place updates (page-based B-tree):* reads without an in-RAM index, but random writes,
  pages that need protection against partial writes, and no free historical versions.
- *LSM-tree with sorted runs:* does not require the index in RAM, but entails leveled
  compaction and reads across multiple levels.

<a id="valutazione"></a>

## Evaluation

- Risks: RSK-03 (write bandwidth), RSK-07 (in-RAM index), RSK-09 (retained space).
- Verification: scenarios FI-01, FI-02; estimates for
  [rotation](../valutazione/stime-ordine-di-grandezza.md#rotazione-dei-segmenti).
- Open: record format (QA-01), relationship to the WAL (QA-02), manifest (QA-04).
