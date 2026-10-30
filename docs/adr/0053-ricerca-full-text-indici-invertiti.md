<a id="adr-0053--ricerca-full-text-con-indici-invertiti-dedicati"></a>

# ADR-0053 — Full-text search with dedicated inverted indexes

- **Status:** Accepted for the design; implementation and qualification remain to be produced
- **Date:** 2026-10-15
- **Relationship to the specification:** at the author's request, adds full-text search
  to “Secondary index,” “Query,” and “Benchmark”; extends the v1 scope of
  [ADR-0030](0030-scope-v1.md), in phase 8. Supplements
  [ADR-0026](0026-indici-secondari-segmentati.md) and
  [ADR-0029](0029-interfacce-protocollo-query-contratto.md), without replacing their other contracts.
- **References:** [indexes](../08-indici.md#ricerca-full-text),
  [NNTP case](../valutazione/caso-duso-nntp.md), REQ-SEC-003…REQ-SEC-006, INV-I4

<a id="contesto"></a>

## Context

Equality, prefixes, and categories are insufficient to search for words and phrases in a
document's contents. The future NNTP server in Common Lisp requires consideration of
searching article subjects, authors, and bodies, combined with group and date.
The feature belongs to the general-purpose engine: MIME and the NNTP protocol remain
the application's responsibility. The current request concerns design, without code development.

<a id="decisione"></a>

## Decision

<a id="contratto-e-semantica"></a>

### Contract and semantics

The Serie's contract declares **full-text** indexes, distinct from equality,
category, and range indexes. Each declaration identifies a name, scalar text fields,
and an immutable, versioned analysis profile. A missing field or an
empty string produces no terms; a value of the wrong type follows the rejection defined
by the contract. The original text remains in the document, without destructive normalization.

The profile identifies the Unicode version, normalization, case folding, segmentation,
and every linguistic parameter. The base profile uses **NFC → full Unicode case folding
→ NFC → word segmentation**; it retains segments containing
letters or numbers, preserves accents, and applies neither stemming nor implicit stopwords.
Rules and tables are fixed by the profile version, never by the process locale
or the latest available version. Documents and queries use exactly the same profile.
Any additional linguistic profiles require their own verifiable contract.

The query AST of ADR-0029 is extended with two predicates, each on a declared field:

| Logical predicate | Meaning |
|---|---|
| `text-match(campo, testo, all/any)` | analyzes the query text; requires all terms or at least one |
| `text-phrase(campo, testo)` | requires the same terms in consecutive positions in the same field |

Leaves combine with `and/or/not` and existing structured filters. A phrase
does not cross two fields. The complement of `not` is computed over the set of live
documents visible in the query snapshot, including those without the field. A query
containing no terms after analysis is explicitly rejected. Code received from the client
is not executed. Node names and wire encoding will be fixed with the API surface
in phases 8–9; this decision fixes semantics, not a text parser.

The first version offers Boolean matching and phrases, with explicit ordering and
stable tie-breaking by `_id`. Relevance ranking (e.g., BM25), fuzzy search,
synonyms, and proximity other than phrases require subsequent decisions. Frequencies
stored in the index do not imply an already defined ranking.

<a id="indice-invertito-per-segmento"></a>

### Inverted index per segment

Each `CLOSED` segment has a dedicated immutable file per full-text index, in the
`.idx` family of ADR-0026. Its logical contents are:

| Section | Contents |
|---|---|
| Identity | Serie, segment, index name/generation, contract, and analysis profile |
| Dictionary | sorted `(campo, termine)` pairs and references to posting lists |
| Posting list | sorted row ordinals, term frequency in the row, and references to positions |
| Positions | token ordinals in the field, needed for phrases; no field crossing |
| Checks | counts, section bounds, and CRC32C; optional term Bloom filter only as a negative filter |

The row identifies the record through the same segment's hint: key and CSN are not
replaced by a global text identifier. Posting lists may use
delta encoding and blocks to skip ranges; codecs, offsets, and binary limits will be fixed
before implementation with an explicit index-type version. The v1/v2 document
record format does not change. No external dependency is adopted.

For `ACTIVE`, an in-memory delta consistent with the published frontier is maintained,
in compact arrays and blocks that support stable reads. Tokenization and buffer preparation
run on compute workers before submitting work to the writer;
contract and generation are rechecked before commit. Delta publication
remains serial on the Serie's writer alone. Queries and `CLOSED` file construction
distribute by segment, with their own budgets; no new global lock or counter
per document and no second full-text scheduler.

<a id="commit-snapshot-e-manutenzione"></a>

### Commit, snapshots, and maintenance

The index is **derived from committed documents**, without its own WAL or commit. The durable
atomicity point remains SEAL for local writes and DECISION for multiseries
transactions. Before advancing the visibility horizon and acknowledging publication,
every usable full-text index must also include the delta of new records.
If derived publication fails after the decision, complete it or declare
failure according to existing contracts: do not acknowledge an incomplete searchable state.

Postings are **candidates**. Before returning a result, resolve the key,
committed outcome, and version actually visible in the snapshot, using the engine's
retained versions; comparison with only the current version is insufficient. Terms
and filters must refer to the same version. Updates and tombstones make old
postings invisible to new views; an earlier view retains the results it is entitled
to while valid. Each document is emitted only once, and the record read
undergoes ordinary integrity checks.

CLEAN/MERGE rebuild the dictionary, postings, and positions for rows in new
segments, retaining versions needed by snapshots: they do not copy ordinals
tied to old hints. Publication and reclamation follow the existing EDIT and EBR protocols.

Adding an index or changing the analyzer creates a **new generation**.
The catalog contract is the durable decision; readiness and files are reconstructible
derived state. The build covers segments and the concurrent delta up to a published
frontier, then atomically exposes a complete view of the Serie. A query fixes its
generation and profile for its entire duration; it does not mix analyzers. The old
generation remains usable by already admitted readers until they become quiescent.

A missing file, incorrect CRC, inconsistent identity, or incomplete rebuild does not mean
“no results.” Recovery and restore rebuild from the same documents and the
authoritative contract; until coverage is complete, the query receives an explicit
index-unavailable error. Any scan fallback must apply
the same semantics and respect budgets, without presenting itself as a ready index.
A corrupt file is reported and excluded; its replacement follows the derivative
publication protocol, without blindly modifying or deleting final files.

<a id="risorse-e-stato-del-lavoro"></a>

### Resources and work status

Configured limits are mandatory for analyzed text bytes, term length,
tokens and positions per document, delta size, query nodes and depth,
postings visited, temporary memory, results, and duration. Write-side excess
is rejected before the durable decision: no text is silently partially indexed.
Reads return an explicit error if the budget cannot support
completion; a requested `limit` is distinct from partial results due to budget
exhaustion. Cancellation, parking, and I/O follow the engine's execution model.

M06 owns full-text derivatives and M15 owns predicates and iterators. Phase 8 includes
implementation and verification; this decision adds the requirement and acceptance
criteria without declaring code, correctness evidence, or performance available.

<a id="conseguenze"></a>

## Consequences

- Text search becomes an explicit design capability, including for NNTP.
- Positions and deltas add memory, disk space, and write/rebuild cost:
  simple-query targets do not transfer to full-text search.
- Search availability depends on verified index coverage; losing a derivative
  does not change the documentary source of truth.

<a id="alternative-considerate"></a>

## Alternatives considered

- Scanning text on every query: useful as an oracle, costly for large corpora.
- Reusing category indexes without positions: does not support phrases.
- External engine: adds dependencies and a second consistency and recovery protocol.
- Asynchronous indexing with incomplete results after commit: incompatible with
  the chosen visibility contract.

<a id="valutazione"></a>

## Evaluation

Verification **still to be implemented**, tracked in REQ-SEC-003…REQ-SEC-006: comparison with an
independent scan for terms/phrases and Unicode; updates, deletes, aborts, and snapshots;
`ACTIVE` plus `CLOSED`; CLEAN/MERGE; concurrent build and generation changes; restart,
restore, and derivative corruption; saturation and cancellation. Measurements and corpora are
described in [13 Benchmarks](../13-benchmark.md#ricerca-full-text). None of these
tests is already demonstrated by existing primary index or vertical proof tests.

The reference pattern is the positional inverted index, described in
[Introduction to Information Retrieval, §2.4.2](https://nlp.stanford.edu/IR-book/html/htmledition/positional-indexes-1.html).
References for Unicode analysis are
[UAX #29](https://www.unicode.org/reports/tr29/) and
[UAX #15](https://www.unicode.org/reports/tr15/); the specific version must be
fixed in the profile, not inferred from these updateable links.
