<a id="adr-0054--contratto-operativo-e-formato-degli-indici-full-text"></a>

# ADR-0054 — Operational contract and format of full-text indexes

- **Status:** Accepted for the design; no full-text component implemented or qualified
- **Date:** 2026-10-15
- **Relationship to the specification:** completes details deferred by
  [ADR-0053](0053-ricerca-full-text-indici-invertiti.md): initial profile, queries, budgets,
  interfaces, generations, and binary format. Extends the `.idx` format of
  [ADR-0026](0026-indici-secondari-segmentati.md) with a full-text-specific
  version; clarifies publication of derivatives under
  [ADR-0040](0040-manifest-a-record-unico.md). Other indexes and v1/v2 records remain unchanged.
- **References:** [full-text contract](../full-text.md),
  [binary format](../formato-indice-full-text.md), REQ-SEC-007…REQ-SEC-010,
  INV-I4, INV-I5, INV-I6

<a id="contesto"></a>

## Context

Full-text search is approved, but details left to phase 8 still permit
incompatible interpretations: implicit Unicode version, reuse of ordinals from
another hint, partial results during build, and saturation after a durable decision.
The author asks to complete the design without developing code.

<a id="decisione"></a>

## Decision

The two documents linked above are a normative part of this decision. They establish:

1. Profile `unicode-word-18.0.0-v1`, with Unicode 18.0.0 tables, NFC, full
   non-Turkic case folding, and words according to UAX #29 revision 49. The version is explicit;
   it is not inherited from SBCL, the operating system, or the locale.
2. Full-text AST leaves with explicit index and field, `all/any`, and phrases. Every query has
   a snapshot, one generation per index, and a terminal outcome; a result delivered
   before an error does not constitute a completed search.
3. Inverted `.idx` index version 2, type 5, with a 64-byte header, six sections,
   fixed-width dictionary and postings, `u32` positions, generation identity,
   and verified binding to hint bytes. No compression or Bloom in the first codec.
4. Index and generation identifiers allocated by the catalog, never reused. Each
   generation has its own files. Rebuilding a corrupt final file moves to a new
   generation; it does not overwrite the old file. Removal of a generation is
   authorized by the catalog and completed after reader quiescence.
5. Coverage verified against segment inventory and published frontiers,
   capturing new commits during build. Readiness is derived state:
   only the Serie writer publishes the new complete view.
6. Delta and buffer capacity reserved before SEAL or PREPARE; a conservative upper
   bound on future index-file size also guides rotation.
   The configuration document declares finite limits, with design defaults.
7. Contracts for analysis, admission, publication, queries, I/O, build, and reclamation, with
   explicit ownership and rejections. Initial search covers one Serie; combining it
   with NNTP memberships in other Serie belongs to the application on the same snapshot.

<a id="serializzazione-e-atomicità"></a>

### Serialization and atomicity

The Serie writer serializes contract adoption, reservations, delta application,
and view swaps. File analysis, construction, and verification operate on private
buffers in the existing pools. I/O goes through the dedicated pool. No shared write
per document across Serie, new global coordinator, or waiting inside an EBR epoch.

SEAL and DECISION retain their role for documents. An index-configuration
change is decided by a catalog document with `:strong` durability. Renaming
a prepared derivative completes an already-decided configuration and does not introduce a
second document commit. In-memory readiness is lost and verified again
on restart. Rotation and compaction remain decided by EDIT.

<a id="conseguenze"></a>

## Consequences

- Format, semantics, and module boundaries are precise enough to develop codecs,
  analyzer, and models without choosing mutually incompatible behavior.
- The first format uses more space than compressed postings; this is a verifiability
  choice, to be measured before any new codec/version.
- A profile change may make new queries temporarily unavailable. Already-admitted readers
  retain their generation and snapshot within budgets.
- Defaults and limits are admission policies, not performance results or promises.
- Requirement status remains `:progettato`; phase 8 gates remain open.

<a id="alternative-considerate"></a>

## Alternatives considered

- Delegating analysis to the runtime's Unicode version: makes the meaning of
  existing indexes unstable during a process upgrade.
- Compressing immediately with varints, front-coding, and skips: increases first-decoder cases;
  an extension point is retained through a new format version.
- Recalculating full text after acknowledgment: introduces a window of incomplete results.
- Replacing a corrupt file in place: complicates identity, active readers, and preservation
  of the anomaly; a new generation makes the transition explicit.

<a id="valutazione"></a>

## Assessment

The [acceptance matrix](../full-text.md#criteri-di-accettazione) specifies corpora,
oracles, crashes, saturation, and negative cases. These tests are to be implemented, separate from the
document checks performed now. The profile is qualified using official Unicode
corpora for the fixed version and manual expectations; the codec using independent binary
fixtures, alterations including recalculated CRCs, and separate decoder/encoder.
