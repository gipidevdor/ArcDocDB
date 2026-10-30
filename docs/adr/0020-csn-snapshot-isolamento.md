<a id="adr-0020--csn-di-archivio-snapshot-e-livelli-di-isolamento"></a>

# ADR-0020 — Archivio CSN, snapshots, and isolation levels

- **Status:** Accepted; **partially superseded by [ADR-0038](0038-orizzonte-di-visibilita.md)**: a snapshot is created when the visibility horizon has reached it (it does not wait only for multiseries transactions), the CSN is acquired at batch closure, and the document version is the CSN. Isolation, maximum lifetime, and `snapshot-too-old` remain.
- **Date:** 2026-10-03
- **Relationship to the specification:** closes QA-06, QA-09, and QA-14; implements “Snapshot/MVCC”
- **References:** [architecture](../architettura.md#snapshot-e-mvcc), INV-M1, INV-M2, INV-V2

<a id="decisione"></a>

## Decision

### Commit Sequence Number

- Each Archivio has a **CSN**: a 64-bit counter, incremented with an atomic operation.
- Single-Serie transactions: the writer assigns **one CSN per batch** of group commit (one
  atomic increment per batch). All versions in the batch carry that CSN in the record.
- Multiseries transactions: the coordinator assigns the CSN **after** the COMMIT decision
  is durable in `multiserie.log` ([ADR-0021](0021-2pc-intenti-outcome.md)).
- Each version in the index carries the CSN at which it became visible.

<a id="snapshot"></a>

### Snapshots

- A snapshot is a number `s`: it sees the version of each document with the highest CSN
  `≤ s`. Serie and Archivio use the same mechanism.
- Creation: `s ← current CSN`; then wait until no multiseries transaction with CSN
  `≤ s` is still being applied (ordered set of multiseries transactions “being applied,”
  maintained by the coordinator; application is in memory, microseconds). INV-V2: a snapshot
  sees a multiseries transaction entirely or not at all.
- Active snapshots are registered per Archivio with their CSN; the active minimum
  governs retained versions ([ADR-0015](0015-primary-index-swiss-table-swmr.md)) and
  CLEAN.
- Configurable **maximum lifetime** (default 1 hour): beyond it, the snapshot is terminated and
  operations using it receive the `snapshot-too-old` error. Metric: age of the oldest
  active snapshot.

<a id="isolamento"></a>

### Isolation

| Operation | Level |
|---|---|
| GET without a snapshot | read committed: latest published version of the Serie |
| Transaction (single-Serie or multiseries) | **snapshot isolation**: reads from the snapshot, writes with expected-version (first-committer-wins) |
| Transaction with `:serializable` | as above, plus commit-time validation of the versions of all documents **read** (read-set), in each participant |

Two GETs without a snapshot on different Serie are not atomic with respect to a multiseries
transaction being applied: callers that require this use a snapshot.

Pattern: CSN/SCN for visibility (Oracle SCN, PostgreSQL CSN); snapshot isolation with
first-committer-wins; `snapshot too old` (Oracle ORA-01555, PostgreSQL
`old_snapshot_threshold`); read-set validation for serializability (classic OCC).

<a id="conseguenze"></a>

## Consequences

- Only one shared element across Serie: an atomic increment per batch. No shared I/O.
- The CSN goes into records and hints: 8 bytes per record.
- After a restart, the CSN resumes from the maximum observed + 1; snapshots do not survive
  the process.

<a id="alternative-considerate"></a>

## Alternatives considered

- *Per-Serie position vector:* no shared counter, but complex coordination for
  multiseries transactions and O(Serie)-sized snapshots.
- *Physical timestamps:* require reliable clocks; unnecessary within a single process.

<a id="valutazione"></a>

## Evaluation

- Verification: FI-11, FI-12; model in SPK-07 (snapshot during application of a
  multiseries transaction); write-skew tests for `:serializable`.
