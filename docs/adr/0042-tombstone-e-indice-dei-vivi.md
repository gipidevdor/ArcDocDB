<a id="adr-0042--tombstone-lindice-contiene-solo-documenti-vivi-scarto-per-filtro-di-esistenza"></a>

# ADR-0042 — Tombstones: the index contains only live documents; disposal through an existence filter

- **Status:** Accepted
- **Date:** 2026-10-03
- **Relationship to the specification:** no amendment; closes QA-15 again. **Supersedes** the
  "Tombstone" section of [ADR-0023](0023-politiche-di-compaction.md) and reconstruction "in
  lineage order" in [ADR-0015](0015-primary-index-swiss-table-swmr.md); assigns a
  purpose to the key Bloom filter in [ADR-0026](0026-indici-secondari-segmentati.md).
  Thresholds, load states, and the limiter in ADR-0023 remain.
- **References:** [design analysis](../analisi-progettuale.md) AP-04, AP-11;
  [architecture](../architettura.md#compaction); INV-C11, INV-D1, INV-I2

<a id="contesto"></a>

## Context

A tombstone exists on disk for only one reason: to prevent an older version of the
same document from appearing current again when the index is
rebuilt from segments. ADR-0023's lineage rule does not ensure this when MERGE combines
nonadjacent segments (counterexample in AP-04), and its safe form would almost never discard anything.
It was also undefined whether the in-memory index retained an entry for deleted
documents: in that case memory would grow with deletions, without bound.

<a id="decisione"></a>

## Decision

<a id="1-lindice-contiene-solo-documenti-vivi"></a>

### 1. The index contains only live documents

When publishing a tombstone, the writer retains the previous version if a snapshot
needs it ([ADR-0038](0038-orizzonte-di-visibilita.md)) and **removes the entry**. A
deleted document occupies no memory. A later creation of the same `_id` is a
new document, with a CSN higher than every past version.

<a id="2-ricostruzione-vince-il-csn-massimo"></a>

### 2. Reconstruction: maximum CSN wins

For each key, the committed record with the **highest CSN** across all segments is the
current version; if it is a tombstone, the key has no entry. When CSNs tie (two writes
to the same document in the same batch, hence the same segment), the higher offset
wins. The result **does not depend on the order** in which segments are read:
reconstruction proceeds in parallel and in any order. During reconstruction, tombstones
occupy temporary entries, removed at the end.

<a id="3-quando-un-tombstone-si-scarta"></a>

### 3. When a tombstone is discarded

Let `t` be a tombstone for key `k` with CSN `c`, encountered by compaction with sources
`I`. `t` **is not copied** if either holds:

- **(a) superseded**: the index has an entry for `k` with CSN `> c` whose record is in a
  `CLOSED` segment and therefore durable (the document was recreated: that record, or the
  tombstone that eventually deletes it, hides everything `t` hid);
- **(b) nothing left to hide**: no version of `k` is retained, and for every
  Serie segment `S` outside `I` with `csn-min(S) < c`, the existence filter for `S`
  answers "definitely absent" for `k`.

In every other case, `t` is a necessary record and is copied. The existence filter is the
hint's Bloom section ([ADR-0039](0039-cornice-unica-dei-record.md)); a missing or invalid
hint means "possibly present"; `ACTIVE` contains only records newer than any
tombstone in a closed segment and does not participate. A filter false positive retains a
tombstone longer: the error is in the safe direction, as INV-I2 requires.

Older versions of `k` inside sources `I` are dead and are not copied: this is why
`I` is excluded from the check.

<a id="4-contabilità"></a>

### 4. Accounting

A tombstone counts toward **necessary** bytes until compaction determines it can be
discarded. A segment containing tombstones is never deleted directly through the
"live = 0" rule: it goes through CLEAN.

Patterns: purge tombstones only if no other file can contain older data for the
same key, decided through the Bloom filter and each file's minimum timestamp (Apache
Cassandra); in-memory index of live documents only, with tombstones only on disk (Bitcask).

<a id="conseguenze"></a>

## Consequences

- No reappearance of deleted documents, by construction and without assumptions about which
  segments are merged.
- On-disk tombstones are bounded by dead records not yet reclaimed: every retained tombstone
  corresponds to at least one older record of the same key still present
  (or a filter false positive, ~1 %).
- Index memory proportional to live documents.
- `lineage-min` disappears from the segment header and manifest.
- Cost: for each candidate tombstone, one Bloom test for every older segment. This is
  compaction work, outside the request path; filters are read on demand
  from hint files.

<a id="alternative-considerate"></a>

## Alternatives considered

- *Lineage (ADR-0023):* unsafe with nonadjacent MERGEs.
- *Discard only when the tombstone's segment is the oldest in the Serie:* safe, but
  tombstones would accumulate over cold data forever.
- *Index checkpoint as the source of truth for what is dead:* would make the index
  cease to be derived data.

<a id="valutazione"></a>

## Assessment

- Verification: property tests against the reference model with deletions, recreations,
  CLEAN, MERGE of nonadjacent segments, active snapshots, and restart at every point (no
  deleted key reappears; no live key disappears); FI-07, FI-08, FI-10.
- Reconsider if: Bloom-test cost slows CLEAN below the minimum in
  [ADR-0028](0028-target-e-obiettivi-di-latenza.md) with deletion-heavy workloads.
