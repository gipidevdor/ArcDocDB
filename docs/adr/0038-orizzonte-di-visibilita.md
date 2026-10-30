<a id="adr-0038--orizzonte-di-visibilità-nascita-degli-snapshot-registro-degli-snapshot-la-versione-è-il-csn"></a>

# ADR-0038 — Visibility horizon: snapshot creation, snapshot registry, the version is the CSN

- **Status:** Accepted (amends the specification only in version numbering); item 2 superseded by [ADR-0046](0046-orizzonte-con-registro-limitato.md): bounded registry of in-flight CSNs, after the counterexample found by SPK-07.
- **Date:** 2026-10-03
- **Relationship to the specification:** implements “Snapshot/MVCC.” **Amends** the example in
  “Single-Serie transactions” (`v18 → v19`): version numbers increase but are not
  consecutive. **Partially supersedes** [ADR-0020](0020-csn-snapshot-isolamento.md) (snapshot
  creation, timing of CSN assignment) and [ADR-0015](0015-primary-index-swiss-table-swmr.md)
  (version field). Isolation, maximum lifetime, and `snapshot-too-old` from ADR-0020 remain.
- **References:** [design analysis](../analisi-progettuale.md) AP-01, AP-02, AP-07, AP-15;
  [architecture](../architettura.md#snapshot-e-mvcc); INV-M1, INV-M2, INV-M4, INV-M5, INV-V2

<a id="contesto"></a>

## Context

ADR-0020 defines the snapshot as a number `s` and, at creation, waits only for multiseries
transactions being applied. But even a single-Serie batch has a CSN assigned before it
is published: a snapshot created in that window sees the batch appear (AP-01). The
active snapshot registry had no protocol (AP-07). The document version
duplicated the CSN and restarted after a deletion (AP-15).

<a id="decisione"></a>

## Decision

<a id="1-il-csn-nasce-con-il-punto-di-atomicità"></a>

### 1. The CSN is created at the atomicity point

- Single-Serie batch: the CSN is acquired **at batch closure**
  ([ADR-0037](0037-lotto-sigillato.md)).
- Multiseries: the CSN is acquired at closure of the `multiserie.log` batch containing the
  DECISION ([ADR-0041](0041-multiserie-segmenti-autosufficienti.md)).

A CSN is **in flight** from the moment it is acquired until its commit is published (batch) or
applied on all healthy participants (multiseries), or canceled because the Serie has
entered `FAULTED`.

**INV-M5.** For each document, CSN order coincides with version order: an
intent blocks every other write to the document until the outcome, and a batch acquires its CSN
after fixing its contents.

<a id="2-lorizzonte"></a>

### 2. The horizon

The Archivio's **visibility horizon** `H` is the largest CSN such that no CSN ≤ `H`
is in flight. Implementation:

- a ring of `N` words `fatto[]` and the word `H`, with an Archivio mutex used **only**
  by publishers (once per batch, never by readers);
- once commit `c` is published or canceled: under the mutex, `fatto[c mod N] ← c`, then while
  `fatto[(H+1) mod N] = H+1`, increment `H`; wake waiting snapshots;
- in-flight CSNs are limited to `N/2` by a credit counter: without credit the writer does not
  close the batch (it continues accumulating); no loop is unbounded (INV-A8).

`H` is read with an atomic read.

<a id="3-nascita-di-uno-snapshot-inv-m4"></a>

### 3. Snapshot creation (INV-M4)

1. Registration in the registry (item 4), fixing `s` = last acquired CSN.
2. **Wait until `H ≥ s`.** Only then does the snapshot perform its first read.

It follows that every commit with CSN ≤ `s` is already published when the snapshot reads, and
none can appear later (INV-M1); a multiseries transaction is seen entirely or not at all
(INV-V2); a snapshot created after a commit's acknowledgment always sees it. The wait is at
most that of ongoing flushes; it has a configured timeout, beyond which the request receives
`resource-exhausted`. A GET without a snapshot does not wait at all.

<a id="4-registro-degli-snapshot"></a>

### 4. Snapshot registry

Fixed-size array of active CSNs, plus the word **`soglia`** = minimum active CSN
(or “none”). Creation and release occur under the registry mutex; `soglia` is read without
locks.

- *Creation:* `soglia ← min(soglia, H)`; **full memory barrier**; `s ← ultimo CSN
  preso`; register `s`.
- *Release:* remove `s` and recompute `soglia`.
- *Writer, on publication* of a version with CSN `c` that replaces another: if
  `soglia < c`, the previous version goes into **retained versions** *before* updating
  the slot; otherwise it does not.
- *Pruning:* a retained version whose validity ends at `a` is deleted when `soglia ≥ a`.

Correctness: if the writer does not see the registration, its read of `soglia` precedes the
snapshot's write; therefore its CSN `c` had already been acquired when the snapshot reads `s`,
and `s ≥ c`: the snapshot will see the new version and does not need the old one. In every
other case, `soglia ≤ s` and the version is retained. When in doubt, retain it.

A snapshot read checks, **after** the lookup, that the snapshot is still active: if
it has expired, it returns `snapshot-too-old`, never “not found.”

<a id="5-la-versione-è-il-csn"></a>

### 5. The version is the CSN

A document's **version** is the CSN of the commit that produced it. `expected-version` is a
CSN (zero = the document must not exist). There is no per-document counter.

- The index location remains `(segment-id, offset, length, versione)` as the specification
  requires: the version is the CSN.
- A CSN never repeats or restarts: an optimistic check cannot succeed against
  another incarnation of the same `_id`.
- When a Serie opens, the Archivio counter advances at least to the maximum CSN the
  Serie contains; at startup it resumes from the maximum observed plus one.

Pattern: horizon of published commits (PostgreSQL: a snapshot excludes transactions
still in progress; WiredTiger `all_durable`; CockroachDB *closed timestamp*); registration
with publication of the bound before the read (the same scheme as epochs,
[ADR-0016](0016-epoch-based-reclamation.md)); version = commit sequence number
(etcd `mod_revision`, FoundationDB *versionstamp*).

<a id="conseguenze"></a>

## Consequences

- A single mechanism for batches and multiseries transactions; the “being applied” set of
  ADR-0020 and ADR-0021 no longer exists as a separate structure.
- Shared cost across Serie: one atomic increment at closure and one mutex acquisition
  at publication, per batch. No cost for readers.
- Snapshot creation depends on the slowest ongoing flush in the Archivio: this is the only
  point at which one Serie can delay another, bounded in time and declared in
  [architecture](../architettura.md#archivio-coordinamento-minimo).
- One fewer field in records, hints, and slots.

<a id="alternative-considerate"></a>

## Alternatives considered

- *Snapshot at `s = H` without waiting:* would not see a commit just acknowledged to the same
  client.
- *Making every write acknowledgment wait for the horizon:* immediate snapshots, but every
  write would depend on flushes of all other Serie (against INV-P3).
- *Scanning the oldest in-flight CSN for each Serie:* no mutex, but a cost proportional
  to the number of Serie for every snapshot.
- *Ring without a mutex:* possible, but requires a memory-ordering argument to avoid
  stopping the horizon; the mutex is acquired once per batch and removes the need for that
  argument ([principles](../principi-di-ingegneria.md), condition 4).

<a id="valutazione"></a>

## Evaluation

- Risks: RSK-05 (atomic visibility) closed at the design level.
- Verification: model in SPK-07 — two Serie, one batch in flight, one multiseries transaction,
  a snapshot created at every point, a Serie entering `FAULTED` with a CSN in flight; property
  test “two reads from the same snapshot return the same result” in the simulator; FI-11, FI-12.
- Revisit if: the wait at snapshot creation exceeds transaction latency objectives
  ([ADR-0028](0028-target-e-obiettivi-di-latenza.md)).
