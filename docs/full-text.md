<a id="ricerca-full-text--contratto-di-progetto"></a>

# Full-text search — design contract

> **Decided ([ADR-0054](adr/0054-contratto-e-formato-full-text.md))** — Normative specification
> completing [ADR-0053](adr/0053-ricerca-full-text-indici-invertiti.md).
> Status: integration designed; the first [implemented core](implementazione/full-text.md)
> is available for analysis and positional runs, with [complete codec and verified views](implementazione/full-text-codec.md).
> [Preparation from CBOR documents](implementazione/full-text-documenti.md) is also available,
> with cumulative budgets and an upper bound, as are [local writer reservations](implementazione/full-text-riserve.md)
> with owned copies. The [PUT/WAL bridge](implementazione/full-text-put.md) connects
> analysis and append of the same bytes; durable publication and MVCC remain to be connected.
> [Physical references](implementazione/full-text-riferimenti.md) retain position and
> stamp after WAL-buffer reuse, without bringing forward commit or visibility.
> The [private row directory](implementazione/full-text-righe.md) resolves them under
> lease; the delta's published immutable map remains to be connected.
> No complete full-text engine benchmarks.

The first version searches terms and phrases in a Serie's scalar text fields, together
with structured filters. Ranking, fuzzy search, synonyms, text wildcards, stemming,
and text arrays require later decisions. The [binary format](formato-indice-full-text.md)
is separate from document format; the [NNTP case](valutazione/caso-duso-nntp.md) remains
an application of the general-purpose engine.

<a id="contratto-della-serie"></a>

## Serie contract

Each full-text index is an immutable declaration per generation:

| Field | Rule |
|---|---|
| `index-id` | positive `u64`, allocated by Serie catalog; never reused, even after drop |
| `name` | UTF-8 alias, 1–64 bytes, unique among Serie indexes; never becomes a filesystem path |
| `generation-id` | positive increasing `u64` per index; exhaustion rejected, no wrap |
| `contract-version` | contract version introducing the generation |
| `profile` | `unicode-word-18.0.0-v1` in the first version |
| `fields` | list ordered by `field-id`, without duplicate IDs, aliases, or paths |
| field | positive `field-id u16`; UTF-8 alias 1–64 bytes; nonempty path of CBOR text keys through maps only, within 100 levels |
| `analysis-limits` | text bytes, bytes per term, tokens per document/index, prepared-buffer bytes, and analysis units |

Aliases and paths are compared byte for byte, without case folding. A missing path
produces no tokens; an empty string produces zero tokens; present `null`, arrays,
numbers, or other values are type errors. The contract continues to validate documents
before writes. For an index added over existing data, an incompatible or over-budget
value explicitly fails build: no document is silently omitted.

The catalog retains the desired generation, previous generations still owned by readers,
and explicitly retired generations awaiting cleanup. Every generation retains its full
declaration. A retirement record is removed only after cleanup verification; counters
keep IDs nonreusable. At most two generations per index are retained across
construction/reading/retirement: a third change is rejected until a previous one is released.

<a id="profilo-di-analisi"></a>

## Analysis profile

`unicode-word-18.0.0-v1` fixes this sequence:

1. Validate the string as a sequence of Unicode scalars, with valid UTF-8 input.
2. NFC under [UAX #15 revision 58](https://www.unicode.org/reports/tr15/tr15-58.html).
3. Full case folding with **C + F** mappings, excluding **S and T**, from
   [CaseFolding-18.0.0.txt](https://www.unicode.org/Public/18.0.0/ucd/CaseFolding.txt).
4. NFC again, then default word boundaries under
   [UAX #29 revision 49](https://www.unicode.org/reports/tr29/tr29-49.html), without tailoring.
5. Retain the entire segment if it contains at least one scalar in Unicode general
   categories `L*` or `N*`; other segments do not become tokens. Encode the term
   as UTF-8 of the transformed segment. Consecutive positions from zero per field.

Accents and marks inside words remain; no stopword removal, apostrophe replacement,
compatibility normalization, or language inference. Default segmentation does not
promise linguistic analysis of every language. Original text and Message-ID remain
unchanged. Tables from a different SBCL version are not used automatically.
An unsupported version produces an explicit unsupported-profile error.

Versions, SHA256 hashes, and licenses of UCD files used for tables are retained in
[Unicode data](../data/unicode/18.0.0/README.md), including normalization, categories,
case folding, and word breaks. The first implementation verifies official corpora
from the same release; these checks do not qualify integrations still missing.

<a id="query-e-risultati"></a>

## Queries and results

AST leaves are CBOR maps with these exact text fields; duplicate or unknown keys
and incorrect types are rejected. In Common Lisp, they remain data.

| Key | `text-match` | `text-phrase` |
|---|---|---|
| `op` | string `text-match` | string `text-phrase` |
| `index` | index alias, mandatory | index alias, mandatory |
| `field` | alias of an index field | alias of an index field |
| `text` | string to analyze with generation profile | same rule |
| `mode` | string `all` or `any`, mandatory | prohibited |

`all` operates on the set of distinct terms; repeating a word does not change the match.
`any` is union. A phrase preserves order and repetitions: each term must occupy the
previous position plus one, in the same field and version. Queries with no terms
after analysis: `invalid-query`. Leaves on different fields combine through the existing
Boolean AST. The complement of `not` includes all visible live documents, including
those without the field; it requires MVCC enumeration, not just the posting set.

Before execution, M15 fixes the snapshot, contract versions, generation for each index,
and ordering. Without an explicit order it uses increasing `_id` bytes;
every other order ends with the same tie-breaker. Initial queries cover one Serie.
NNTP group filtering on memberships in another Serie is an application-level combination
over the same Archivio snapshot, with Message-ID deduplication.

Every candidate carries Serie, segment, row, and generation; hint and MVCC resolve key,
CSN, and visible version. Terms and filters in the same leaf/AST apply to that version;
terms belonging to two different versions of a key are not intersected.
Leaves are first evaluated per row/version; only afterward are visible candidates
combined and keys deduplicated. Fetch follows ordinary CRC and identity checks.

The logical response contains snapshot, generations used, ordered results, and terminal
state. Intermediate batches are provisional until `complete`; error, timeout, or
cancellation makes the operation incomplete and does not certify the received prefix.
`limit` normally completes the requested prefix with `complete`, without promising
a total count. The first version has no cursor resumable between requests:
a new request creates a new view, unless an explicitly still-valid snapshot is used.
General network framing and envelopes remain those of ADR-0029.
`limit` applies after filters and ordering: the first N postings are not necessarily
the first N results. A top-N accumulator uses bounded memory; early exit is allowed
only if the plan proves no remaining candidate can precede the prefix.

<a id="confini-tra-moduli"></a>

## Module boundaries

Operations below are logical contracts, not names of already exported functions.
Inputs are immutable or owned capabilities; outputs use caller buffers.
Outcomes contain code, phase, and counters without changing ownership on rejection.
Every asynchronous request has a single terminal continuation.

| Operation | Owner and input | Outcome and obligations |
|---|---|---|
| Analyze | M06 worker: document, declaration, private scratch | terms/positions and byte upper bound, or error; no Serie-state writes |
| Admit | M01/M06 writer: prepared buffers, version/generation, budget | reserves delta, staging, and index cost; rejection before SEAL/PREPARE; reservation is not commit |
| Publish | writer: committed outcome and already reserved buffers | makes document and postings visible together before H/ACK; abort releases reservations |
| Acquire view | M15 with M08: snapshot and requested indexes | fixed complete view, or index unavailable; no waiting in EBR |
| Iterate and verify | M15/M06 tasks: view and query budget | candidates, MVCC checks, and results in buffer; bounded restarts and terminal state |
| Build/verify file | M06 worker with M03/M12 and I/O pool: verified segment, hint, and configuration | complete validated `.tmp` file, or error; no worker-driven swap |
| Install coverage | writer: build result and source-view identity | adopts only still-valid coverage; inventory change requires reconciliation |
| Retire | M17 catalog, writer, M08/M11 | retirement decision, then quiescence, closure, and idempotent cleanup |

Prepared-record reservations remain transaction-owned until the authoritative outcome.
After DECISION, insufficient memory cannot be converted to abort: an unexpected
publication error follows fail-stop and recovery, without successful ACK.
Preparation with a superseded contract is rejected with `contract-changed` and may
be reanalyzed outside the writer within a finite number of attempts.

<a id="delta-e-frontiere"></a>

## Delta and frontiers

The delta is organized in preallocated blocks of field/term pairs, rows, and positions.
Unpublished bytes remain writer-private. A reader acquires a view with an immutable
frontier: later changes do not extend the blocks it may read.
Prepared buffers are ordered by field/term/row and form immutable runs;
the query consults every run at its frontier within budget. The delta row map belongs
to the view and resolves offsets and CSNs; switching to an `.idx` built with the CLOSED
hint explicitly remaps rows without reusing ordinals from another map. The previous
view retains its own map until quiescence.
Batch indexing is prepared in staging before the decision. Publication follows the
existing protocol: document-entry updates with seqlocks, delta completion,
reference/frontier publication, and finally H advancement and ACK. No complete
primary-table copy per commit. The reader fixes its snapshot before acquiring the
view and verifies compatible published frontiers; superseded acquisition retries
within the attempt limit. An old reader finishes on the old view, protected by the
same MVCC/EBR contracts.

On rotation, the delta becomes a frozen source for `CLOSED` and remains searchable
until its verified `.idx` is installed. A missing file creates no empty window.
Frozen deltas and retained views also count against the Serie budget;
pressure causes bounded backpressure before admitting new writes.

<a id="generazioni-e-costruzione-concorrente"></a>

## Generations and concurrent construction

These states are derived in memory; configuration and retirements are durable
in the catalog. Advancing a CSN alone is not proof of coverage.

| State | New queries | Allowed transition |
|---|---|---|
| `BUILDING` | `index-unavailable` for desired generation | delta capture active, previous segments/data under construction |
| `READY` | complete view acquirable | every new publication maintains coverage; loss of a source leads to `UNAVAILABLE` |
| `UNAVAILABLE` | explicit error | rebuild; corruption of definitive file requires new generation |
| `RETIRING` | no new acquisition | already admitted readers, then authorized cleanup |
| `RETIRED` | none | cleanup completion and removal of corresponding retirement record |

For addition, profile change, or rebuild with a new generation:

1. The catalog decides the new declaration with `:strong` durability and retains it
   alongside the previous one. New queries requiring it remain unavailable until ready.
2. The writer adopts the declaration at a publication boundary: it must have completed
   prepared records and batches already decided under the old contract. Adoption uses
   admission and finite waits; it neither holds a worker nor blocks the whole Archivio.
   Preparations not yet admitted under the previous contract must be reanalyzed.
3. In the same step, it fixes initial inventory and frontiers and activates capture of
   new-generation postings for every subsequently admitted write. All committed PUTs
   in the initial prefix, including physically present historical versions, are analyzed
   in the background; deletes and aborts produce no terms.
4. Each segment's coverage is identified by Serie, segment, valid length, verified hint,
   and generation. For ACTIVE, published record ranges covered by blocks count.
   There must be neither gaps nor duplicate emissions before or after the capture
   boundary; an Archivio CSN alone does not identify these ranges.
5. Compaction and rotation change inventory: build results for obsolete sources are not
   installed; new sources or frozen deltas are used. I/O capabilities own the file for
   the task duration; descriptors and buffers do not depend on an EBR pointer retained
   while waiting. MVCC pins and build memory are bounded.
6. The worker proposes a complete view; the writer checks current configuration,
   inventory, and frontiers, incorporates the captured delta, and publishes `READY`
   with one in-memory swap. A concurrent change invalidates the proposal; attempts are bounded.

The writer continues publishing ordinary commits within budgets. If build cannot
complete within its limits, it remains a declared administrative error: no completion
promise under unlimited writes. Old queries already fixed a snapshot; they do not
require the previous generation to index later commits.

<a id="file-recovery-e-ritiro"></a>

## Files, recovery, and retirement

The derived name is `segments/<segment-id>.ft-<index-id>-<generation-id>.idx`, with canonical
decimal integers without leading zeros. Catalog configuration and the manifest-named
segment authorize that derivative family.

A worker builds in a private `.tmp` area on the same filesystem, verifies the file,
performs required flush and synchronization, and proposes installation. Only one builder
is active per segment/index/generation: the local bounded ticket is assigned by the
writer. If a final file already exists, it is verified and reused; an existing definitive
file is not overwritten by rename. Rename completes a derivative of an already decided
configuration, then the directory is synchronized. A crash may lose index availability
without losing the document commit.

| Situation on restart | Outcome |
|---|---|
| Valid configuration, intact consistent final file and hint | verify coverage before readiness |
| Final file absent | rebuild; queries unavailable until complete coverage |
| `.tmp` without completed installation | do not use as coverage; delete unpublished temporary and rebuild |
| Final file corrupt or bound to another hint | report, generation `UNAVAILABLE`; new generation for rebuild |
| Generation explicitly retired in catalog | no readers after recovery: complete idempotent cleanup |
| Definitive file of never-named generation/segment | anomaly, preserve; no deletion due to absence |
| Source document/segment not intact | apply engine health states; index rebuild does not repair data |

Index drop decides retirement in the catalog; a generation change also explicitly
decides retirement of the previous one, preserving its descriptor for already admitted
readers. A segment removed by EDIT authorizes cleanup of its derivatives after
quiescence. Restore obtains generations and configurations from the restored catalog
and rebuilds derivatives against restored segments: a newer file is insufficient.
Retirement stops new build/install authorizations and also awaits closure of already
granted tickets, with bounded cancellation and completion. The retirement descriptor
remains authoritative until readers, tickets, and cleanup finish: an already authorized
I/O rename cannot create a definitive file after that descriptor's removal.

<a id="budget-iniziali"></a>

## Initial budgets

These **design defaults** are configurable policies requiring qualification; they are
not throughput estimates. An effective limit is the minimum of format, declaration,
and Serie/worker budget. Sums are checked before allocation, without overflow.

| Resource | Default |
|---|---|
| Full-text indexes per Serie; fields per index | 8; 16 |
| Concurrent generations per index | 2, including build, readers, and retirement |
| UTF-8 input text per document, summed across an index's fields | 16 MiB |
| Term after transformation | 1,024 UTF-8 bytes |
| Tokens/positions per document and index | 1,048,576, summed across all fields |
| Analysis work per document and index | 268,435,456 units; every scalar consumed/emitted or normalization comparison costs at least one unit |
| Analysis memory per worker and prepared buffers per request | 64 MiB each; input and already owned reservations charged to respective pools |
| Serie delta, including frozen deltas, reservations, and old views | 256 MiB total |
| Build memory per Serie | 128 MiB, one build per index and at most two build tasks per Serie |
| Full-text `.idx` file per segment/index/generation | 16 GiB; budget separate from data segment |
| Temporary build space per Serie | 32 GiB total; admission before file creation |
| `.idx` META | 64 KiB |
| Query AST; depth; analyzed tokens per leaf | 256 nodes; 32 levels; 256 tokens |
| Query text | 64 KiB total before and after normalization |
| Temporary memory; postings visited per query | 32 MiB; 1,000,000, counted across all leaves/segments |
| Query work budget | 4,000,000 units: posting advancement, position/byte comparison, dictionary probe, or document enumerated/verified costs at least one unit; includes query-text analysis |
| Results; query duration | 10,000; 5 seconds on injectable monotonic clock |
| Build duration; retries of invalidated view | 300 seconds; 8 attempts |

Global pool, snapshot, and queue budgets remain the engine's. A configured capacity
below the maximum of one possible request produces explicit rejection, not a partial
reservation. Unit accounting also covers `not` scans and repeated-position comparisons;
a posting-count limit alone is insufficient.
Durations are logical deadlines, checked at task boundaries and before outcome;
they are neither a real-time guarantee nor the ability to interrupt any I/O.
Normalization and tokenization also proceed through bounded tasks with resumable
private context; a long combining-mark text does not authorize unbounded compute work.
Limits apply jointly: reaching all of them simultaneously on one request is not promised.

Before commit, M06 calculates a conservative serialized-byte upper bound
([format formula](formato-indice-full-text.md#limite-superiore-e-rotazione)). M01 reserves
that cost too: if a segment would exceed an index budget, it proposes rotation before
append. A single request that cannot fit an empty segment is rejected.
Rotation respects ADR-0041's pending intents; it does not occur midway through a prepared transaction.

<a id="esiti"></a>

## Outcomes

| Logical code | Meaning |
|---|---|
| `complete` | requested result completed on declared view |
| `invalid-query`, `invalid-document` | invalid structure, type, or text |
| `unsupported-profile`, `unsupported-format` | unsupported version; no implicit fallback |
| `index-unavailable` | requested generation not ready or coverage missing |
| `index-corrupt` | derivative integrity failure; event and generation identified |
| `contract-changed` | preparation predates adopted declaration; no commit performed |
| `resource-limit`, `query-budget-exceeded` | admission capacity or work exhausted; not a complete result |
| `cancelled`, `timeout`, `snapshot-too-old` | request explicitly terminated, owned resources cleaned up |
| `build-failed` | build ended without readiness, retaining phase and cause |

Source-data errors and `FAULTED`/`DEGRADED` states remain the engine's.
Retry of a request with an existing durable decision follows transaction identity:
these codes do not authorize blindly repeating a publication.

<a id="criteri-di-accettazione"></a>

## Acceptance criteria

These tests are **to implement** in phase 8. Every row requires preregistered expected
results and inputs, an oracle negative control, and retention of every attempt.

| Requirements | Test and success condition |
|---|---|
| REQ-SEC-003, REQ-SEC-007 | Official Unicode 18.0.0 corpora, C/F mappings, manual cases below, and comparison with independent analysis; identical tokens and positions |
| REQ-SEC-003, REQ-SEC-008 | Independently built binary fixtures, empty file, two fields, repeated terms, boundary integers, truncation at every boundary, and mutations; rejection even with valid CRC |
| REQ-SEC-004, REQ-SEC-009 | Old version with one term and new version with another; `all` does not combine them; delete/abort, historical snapshots, ACTIVE/CLOSED, and compaction match scan results |
| REQ-SEC-005, REQ-SEC-009 | Writer between initial cut and capture, rotation/MERGE during build, proposal with stale inventory, profile change, and restart at every step; no gaps before READY |
| REQ-SEC-005, REQ-SEC-008 | Reordered hint, altered CRC/IDs, absent files, corrupt definitive files, temporaries, and unknown files; readiness and cleanup follow tables without deleting anomalies |
| REQ-SEC-006, REQ-SEC-010 | Every budget at limit, limit minus one, and limit plus one; saturation before PREPARE/SEAL; no ordinary capacity error after DECISION; cancellation and exact reservation release |
| REQ-SEC-009, REQ-SEC-010 | Slow reader, snapshot expiration, error after a batch, and generation drop; prefix without `complete` is not consumed as success |
| REQ-SEC-006 | Load across multiple Serie and interference with GET/compaction; separate measurements, no shared per-document write |

Minimal manual corpus, without invoking an analyzer to generate expected results:

| Document/field | Expected terms and positions |
|---|---|
| `Subject = Caffè CAFÉ` | `caffè: [0]`, `café: [1]` |
| `corpo = Stra\u00DFe` (where `\u00DF` denotes U+00DF, not six literal bytes) | `strasse: [0]` |
| `corpo = alpha, beta alpha` | `alpha: [0, 2]`, `beta: [1]`; phrase `alpha beta` yes, `beta beta` no |
| one field `alpha`, another `beta` | phrase `alpha beta` matches neither field |
| missing field or empty string | no terms; `not text-match(..., alpha, all)` includes the live document |

A second fixture uses `cafe` followed by U+0301 and must produce `café`; unaccented
`cafe` does not match. Tests distinguish actual text from scalar notation.
[Measurements](13-benchmark.md#ricerca-full-text) start only after these checks.
