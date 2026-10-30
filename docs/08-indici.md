<a id="08--indici"></a>

# 08 — Indexes

> **Source:** ‘Index’, ‘Secondary index’, ‘Secondary index delta’, and ‘Index snapshot’ of the
> [specification](specifica/specifica-originale.md).
> **Modules:** M05 Primary Index Manager, M06 Secondary Index Manager.
> **Decisions:** [ADR-0015](adr/0015-primary-index-swiss-table-swmr.md) and
> [ADR-0043](adr/0043-primary-index-a-frammenti.md) (fragmented Swiss SWMR primary index),
> [ADR-0039](adr/0039-cornice-unica-dei-record.md) (per-segment hint),
> [ADR-0042](adr/0042-tombstone-e-indice-dei-vivi.md) (live documents only, reconstruction by
> maximum CSN), [ADR-0026](adr/0026-indici-secondari-segmentati.md) (**per-segment**
> secondary indexes, fixed format, with an in-memory delta for ACTIVE),
> [ADR-0053](adr/0053-ricerca-full-text-indici-invertiti.md) (full-text search with dedicated
> inverted indexes; core available, integration incomplete). Formats in
> [formati-su-disco.md](formati-su-disco.md#file-indice).

## Primary index

```
_id → location
```

The `location` contains at least:

| Field | Meaning |
|---|---|
| `segment-id` | segment containing the record |
| `offset` | position within the segment |
| `length` | record length |
| `version` | document version (used by optimistic version checking, [05](05-transazioni.md)): the commit CSN ([ADR-0038](adr/0038-orizzonte-di-visibilita.md)) |

Requirements:

- highly optimized **average O(1)** lookup;
- evaluate a **Swiss Table**-style structure;
- avoid millions of separate Lisp objects (one per entry);
- prefer packed arrays, vectors, compact structures, binary metadata, contiguous memory.

The specification places the primary index **in RAM** (section comparing other systems).
The constraint on Lisp objects is not just about speed: millions of objects with pointers
create garbage-collector work, whereas specialized arrays contain no pointers to trace
([15](15-ottimizzazioni-native.md)).

> **Decided (QA-03 → [ADR-0015](adr/0015-primary-index-swiss-table-swmr.md))** — Index persistence: the Serie's `index/` directory exists in the layout,
> but the specification does not say whether it contains a primary-index checkpoint or only
> secondary indexes. The choice determines restart time.

> **Decided (QA-01 → [ADR-0014](adr/0014-formato-record-documento-id.md))** — The type and length of `_id` affect table format (inline fixed-length
> keys or hash + verification).

<a id="indici-secondari"></a>

## Secondary indexes

Different structures for different query types:

| Data / query type | Structure |
|---|---|
| Strings, prefix | ART (Adaptive Radix Tree) |
| Numbers, dates, range | B+ tree or equivalent ordered structure |
| Categories | posting lists |
| Boolean, low cardinality | bitmap |
| Text, words, and phrases | dedicated inverted index: dictionary, posting lists, and positions ([ADR-0053](adr/0053-ricerca-full-text-indici-invertiti.md)) |

**Per-segment Bloom filter.** It only establishes that a value is *definitely absent*
or *possibly present*. It MUST NOT be used as a definitive location structure
(INV-I2).

> **Decided ([ADR-0039](adr/0039-cornice-unica-dei-record.md), [ADR-0042](adr/0042-tombstone-e-indice-dei-vivi.md))** —
> Filters on **values** are a section of segment index files and let an equality query skip
> the segment. The filter on `_id` **keys** is a section of the hint and serves just one
> purpose: deciding when a tombstone can be discarded.

<a id="modello-a-delta"></a>

### Delta model

For secondary indexes subject to frequent changes, an LSM-like model:

```
base index + immutable delta(s)  →  asynchronous merge  →  new base index
```

An update moving document 42 from `category="tech"` to `category="sport"` produces:

```
category="tech"  → REMOVE 42
category="sport" → ADD 42
```

The new base is built **without globally blocking readers**.

<a id="ricerca-full-text"></a>

### Full-text search

> **Decided ([ADR-0053](adr/0053-ricerca-full-text-indici-invertiti.md))** — Full-text search
> enters the v1 design with dedicated indexes. The first [core](implementazione/full-text.md)
> implements analysis, positional runs, a complete codec, and verified views;
> integration and qualification remain in phase 8,
> including for the [NNTP server](valutazione/caso-duso-nntp.md).

The Serie contract declares text fields and a versioned analyzer shared by
indexing and queries. The base profile normalizes Unicode and case,
preserves accents, and does not implicitly remove words or apply stemming. The
original document is retained in full. Each index has this logical structure:

```
(field, term) → posting list of rows → frequencies and positions in the field
                         │
                         └→ segment hint → key and CSN → visible version
```

An immutable `.idx` file per `CLOSED` segment contains the dictionary, postings, and positions;
the `ACTIVE` delta includes new documents before they are published.
Tokenization and preparation happen outside the writer; delta application remains
serial within the Serie. Full text adds neither a dedicated WAL nor a dedicated scheduler.

Structured predicates are planned for all/any terms and for phrases with consecutive
positions in the same field. These combine with `and/or/not`, date filters,
equality, and ranges. `not` uses live documents from the same snapshot; query text
with no terms is explicitly rejected. Ordering and `_id` tie-breaking are
deterministic; relevance ranking and fuzzy search remain later decisions.

Updates, deletes, and aborts must not leave matches from invisible versions:
every candidate is checked against the snapshot's committed version, including
retained versions, before applying text and filters together. CLEAN/MERGE rebuild
postings with new rows. Indexes are derivatives rebuildable from documents;
a missing or corrupt file, or incomplete generation, produces an explicit error.
A new analyzer generation becomes usable only with complete coverage,
without mixing profiles within one query (INV-I4).

Analyzed bytes, terms, positions, delta memory, and query work have finite
budgets; no silent truncation on writes or partial result declared complete.
Semantics and publication protocol are in the ADR; logical on-disk sections in
[formats](formati-su-disco.md#indice-full-text), and future tests in
[benchmarks](13-benchmark.md#ricerca-full-text).

> **Decided ([ADR-0054](adr/0054-contratto-e-formato-full-text.md))** — The
> [operational contract](full-text.md) completes the Unicode profile, AST leaves, ownership,
> generations, budgets, and acceptance criteria. The
> [`.idx` v2/type 5 format](formato-indice-full-text.md) fixes the header, sections, and arrays,
> with hint binding and conservative byte reservation before commit. This initial
> version uses fixed-width arrays; codec optimizations require a new version and
> dedicated measurements. The [implemented codec](implementazione/full-text-codec.md)
> verifies sections and binding to the supplied descriptor/hint; verification of the hint
> itself, documents, and generation coverage remains to be integrated.

## Index snapshot

Indexes MUST be immutable for readers (INV-I1):

```
Reader → Index v17

Writer: builds Index v18, atomic swap

new readers      → Index v18
previous readers → finish on v17
```

<a id="questioni-decise-e-rischi"></a>

## Decided questions and risks

- **QA-24** ([ADR-0015](adr/0015-primary-index-swiss-table-swmr.md)) — The ‘immutable version + swap’ model is natural for secondary indexes
  (base + delta) and bulk relocation by compaction. For the **primary index**, which
  receives a change on every write, building a complete new version at every commit is
  impractical: how reader immutability coexists with continuous writer updates needs
  definition (RSK-02).
  Resolved with per-slot seqlocks ([ADR-0032](adr/0032-seqlock-a-64-bit.md)) and atomic
  replacement of one fragment at a time
  ([ADR-0043](adr/0043-primary-index-a-frammenti.md)).
- **QA-25** ([ADR-0026](adr/0026-indici-secondari-segmentati.md)) — Secondary indexes: updated synchronously with commit or with delay? What
  does a snapshot see? Are they persisted or rebuilt on restart?
- **QA-03** ([ADR-0015](adr/0015-primary-index-swiss-table-swmr.md)) — Primary-index persistence and rebuild time (RSK-07).

<a id="metriche"></a>

## Metrics

Hit rate, lookup latency, rebuild time ([12 Observability](12-osservabilita.md)).
For full text: dictionary/posting/position bytes, delta memory, analysis and commit
cost, postings visited, candidates discarded for visibility, latency, and generation
coverage. These measurements remain to be produced, without reusing GET targets.
