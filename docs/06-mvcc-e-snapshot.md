<a id="06--mvcc-e-snapshot"></a>

# 06 — MVCC and snapshots

> **Source:** ‘Snapshots / MVCC’, ‘Index/Snapshot/Reclaim’, and ‘Cache and snapshots’ of the
> [specification](specifica/specifica-originale.md).
> **Modules:** M08 Snapshot/MVCC Manager.
> **Decisions:** [ADR-0020](adr/0020-csn-snapshot-isolamento.md) (snapshot = CSN, maximum
> duration), [ADR-0038](adr/0038-orizzonte-di-visibilita.md) (visibility horizon,
> snapshot registry), [ADR-0015](adr/0015-primary-index-swiss-table-swmr.md) (retained
> versions), [ADR-0016](adr/0016-epoch-based-reclamation.md) (reclaim).

> **Decided (SPK-07 counterexample → ADR-0046)** — Point 2 of ADR-0038 is superseded by the
> [bounded registry of in-flight CSNs](adr/0046-orizzonte-con-registro-limitato.md).
> Assignment and registration are indivisible with respect to H advancing; the CSN-indexed
> ring, which could lose completions when a commit was slow, is no longer used.

<a id="che-cosè-uno-snapshot"></a>

## What a snapshot is

A snapshot is a **consistent logical view** at a given point/version. It is not a physical
copy of the database. Append-only storage naturally retains historical versions until
reclaim: a snapshot merely determines which versions are visible and prevents their
removal.

```
Snapshot S sees:   A = 100, B = 200
Another transaction updates A and B.
Snapshot S still sees:   A = 100, B = 200   (until it ends)
```

> **Decided ([ADR-0038](adr/0038-orizzonte-di-visibilita.md))** — To ensure the view really does not change, a snapshot with CSN `s`
> is created only when the **visibility horizon** has reached `s`: all commits with CSN ≤ `s`
> have already been published, including batches being flushed when the snapshot was
> requested (INV-M4). A GET without a snapshot does not wait for anything.

<a id="chi-usa-che-cosa"></a>

## Which operation uses which view

| Operation | View |
|---|---|
| Simple GET | no global snapshot: reads the current committed version |
| Local transaction (single-Serie) | MAY use a Serie snapshot |
| Multiseries transaction | MAY use an Archivio-wide consistent snapshot |

<a id="obblighi"></a>

## Obligations

- A snapshot MUST prevent compaction from deleting the versions it needs
  (INV-M2). These versions are classified as `SNAPSHOT-LIVE` ([03 Storage](03-storage.md)).
- No snapshot may observe an inconsistent version (INV-M1).
- The cache MUST be aware of the data's version/epoch: a reader must not obtain
  a version incompatible with its snapshot (INV-M3). See [09 Cache](09-cache.md).

<a id="visibilità-della-ricerca-full-text"></a>

## Full-text search visibility

[ADR-0053](adr/0053-ricerca-full-text-indici-invertiti.md) applies the same
view to terms, phrases, and structured filters. Postings are candidates:
the key, committed outcome, and visible version must be resolved,
including versions retained for historical snapshots. An update
or tombstone must not change results for a still-valid snapshot.

Each query holds a single generation and profile per index.
Coverage must include CLOSED and the ACTIVE delta for the requested view;
a missing, corrupt, or incomplete derivative produces an explicit error.
This contract is designed; implementation and verification are planned for phase 8.

## Reclaim

A segment is reclaimed only when (INV-R1):

- no current index references it;
- no snapshot references it;
- no active transaction needs it;
- no reader is still using it.

These four conditions correspond to the `OBSOLETE → RECLAIMABLE` transition
([03 Storage](03-storage.md#stati-del-segmento)).

<a id="questioni-decise-e-rischi"></a>

## Decided questions and risks

The specification establishes snapshot *behavior* but not the *mechanism*. The following
questions were architectural and have been resolved by the listed ADRs.

- **QA-24** ([ADR-0015](adr/0015-primary-index-swiss-table-swmr.md)) — How a snapshot locates a version that is no longer current. The primary index
  maps `_id → location` for the current version; a structure is needed to retain previous
  locations for documents updated while a snapshot is active, and to remain valid when
  compaction relocates records.
- **QA-06** ([ADR-0020](adr/0020-csn-snapshot-isolamento.md)) — Archivio-wide consistent snapshots with independent writers per Serie: a
  common reference point is needed (Archivio commit sequence or a vector of per-Serie
  positions), along with a guarantee that a multiseries transaction becomes visible
  atomically with respect to the snapshot.
- **QA-14** ([ADR-0020](adr/0020-csn-snapshot-isolamento.md)) — Long-lived snapshots: they block reclaim (space) and, through the MERGE
  conditions, defragmentation too. A policy is needed (duration limit, metric, alarm).
- **QA-16** ([ADR-0016](adr/0016-epoch-based-reclamation.md)) — How active readers are tracked for reclaim (epochs, per-segment refcounts).
- Related risks: RSK-02, RSK-05, RSK-09.
