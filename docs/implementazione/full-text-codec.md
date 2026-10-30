<a id="codec-completo-degli-indici-full-text"></a>

# Complete full-text index codec

The [full-text core](full-text.md) now has serialization and validation
for all six sections of the [v2/type 5 format](../formato-indice-full-text.md), in addition to
the frame. A verified view searches serialized bytes directly without rebuilding
the run in memory. APIs are in `arcdocdb.fulltext.codec`, code in
[`src/fulltext/`](../../src/fulltext/), under [ADR-0054](../adr/0054-contratto-e-formato-full-text.md).

First use remains the database for a Usenet NNTP server in Common Lisp.
The reopen test uses fields `subject` and `body`; protocol and MIME decoding
remain application responsibility. No NNTP daemon is introduced.

<a id="descrittore-e-autorita"></a>

## Descriptor and authority

`crea-descrittore-full-text(meta, identity, segment, source-bytes, hint, hint-start,
hint-end, rows)` is a cold constructor. Receives authoritative META declaration in
CBOR, Serie identity, segment and prefix length, exact hint bytes, and
bitmap with one bit per ordinal: set only for resolved committed PUTs, including historical ones.
Caller must have verified hint, prefix, and decisions before supplying these data.
Creating this object does not replace that verification.

Constructor checks definite/minimal CBOR arrays, three positive u64 IDs, lengths,
whole-hint-span CRC32C, row and PUT counts, Unicode 18.0.0/revision 1 profile,
ordered fields, unique aliases and paths, UTF-8, and positive limits. Token limit is within
u32. Produces private copies of META, identity, fields, and bitmap; does not retain hint.
Paths have 1…100 text keys; current constructor allows up to 16 fields,
beyond which signals `resource-exhausted`. META is at most 64 KiB. `:max-memory` is
checked conservatively before copies and temporary tables.
Segment ID is retained already boxed in a private cell created at open:
repeated reading of a raw u64 slot allocated on SBCL x86-64 for IDs beyond fixnum.
Cell is immutable after construction and included in descriptor overhead.

A file must match this canonical META byte for byte: a configuration hash
alone is insufficient. A hint rebuilt with different bytes or order requires a new
binding and new index. CRC identifies bytes under format's integrity
model; it neither authenticates data nor proves document correctness.

<a id="scratch-e-scrittura"></a>

## Scratch and writing

`crea-spazio-codec-full-text` preallocates LENGTHS prefixes, position bitmap,
six offsets/lengths, and private analysis workspace. Configurable capacities:
`:max-lengths` (default 65536), `:max-positions` (1048576), `:max-term-bytes` (1024),
`:max-memory` (64 MiB). Conservative count includes payload and 8192 bytes overhead;
does not measure whole-process memory, source files, or shared Unicode tables.
A valid file may require more scratch: rejection is resource exhaustion, not corruption.

`dimensione-indice-full-text(run, descriptor, space)` requires a sealed run.
Calculates exact size, checking permitted rows, fields, tokens per document,
terms, ordering, and position coverage. It is not writer's pre-SEAL/PREPARE reservation.
`scrivi-indice-full-text(run, descriptor, space, buffer, start, end)` repeats preflight,
checks aliases/capacity, and reserves completion work before mutating buffer.
Returns actual file end; destination prefix and tail remain unchanged.
Preflight rejection leaves destination intact. Internal error offers no rollback:
owner discards that buffer and applies fail-stop at worker boundary.

Writing groups occurrences into dictionary, unique strings, postings/frequencies,
and positions; also retains lengths of present empty fields. Header, reserved areas,
padding, and CRC are those already defined by ADR-0054. Format offsets have one
source in `format-constants.lisp`. No I/O, rename, flush, or durable atomicity
point is introduced by codec.

<a id="lettura-e-ricerca"></a>

## Reading and search

`verifica-indice-full-text(buffer, start, end, descriptor, space)` returns `end`
only after frame, expected META, and all local checks:

- Ordered/unique LENGTHS, declared fields, bitmap PUT rows, and zero reserved areas;
  per-document token sum and total equal to position count.
- DICT ordered by field and term bytes; contiguous strings, valid UTF-8, and
  already one identical token in declared profile, without implicit normalization.
- Contiguous postings with increasing rows, positive frequencies, and references within section.
- Increasing positions within posting and field, without duplicates across different terms;
  global bitmap and prefixes demonstrate exact union `[0, token-count)` per field.
- No residual byte or element in partitions. These checks apply even with
  correctly recalculated CRCs.

Codec CPU APIs are synchronous with finite work budget, default
268435456 units. Count CRC, comparisons, analysis, entries, and bitmaps; scratch is
reusable after error. Build-task orchestration, I/O, and deadlines belong
to later M06 connection. No per-entry allocations on measured path.

`crea-vista-indice-full-text` verifies file and, on cold open path,
allocates view and copies of only six spans. Retains immutable buffer, not scratch.
Owner must keep it alive until reader quiescence and cannot rewrite it.
`corrisponde-riga-indice-full-text(view, row, field, query, mode)` supports `:all`,
`:any`, `:phrase`, with 1…256 tokens. Binary search in DICT, POSTINGS, and POSITIONS;
phrase repetitions require consecutive positions in same row/field.
Each reader uses its own query workspace and cumulative budget; no write to file
or shared view. Predicate concerns physical version, without resolving MVCC.

<a id="prove-e-confini-residui"></a>

## Tests and remaining boundaries

Independent fixture [minimum-v2.hex](../../tests/fulltext/minimum-v2.hex) contains
468 bytes: row 0 `alpha beta alpha`, row 1 `beta`. Hex-file SHA256:
`d94f6144c7533cc273784446b803a5d872ba44a8d2833ef0c4d8f317ca699f80`.
The [C4 oracle](../../tools/fulltext-codec-fixture.lisp) does not load product; generates
CBOR, little-endian, and CRC with a separate algorithm. Bytes were frozen
before first encoder execution and are regenerated/compared in `make check`.

Fifteen codec tests join core's 24: byte-for-byte identity on
32 prefixes, 3744 single alterations, 468 truncations, 26 semantic corruptions with
correct CRC, incorrect META/hint/configurations, budgets, empty fields, four readers,
43200 comparisons with independent scanning, and fuzz of 1024 variants with correct CRC.
Fuzz distinguishes 1020 typed rejections and four structurally valid variants;
does not compare source document. After warmup, 1000 writes/verifications/searches
allocate no measured heap bytes, including maximum u64 ID, on SBCL 2.6.9 arm64.
Core semantic negative checks increase from four to six.

The [C4 persistence test](../../tools/fulltext-persistence.lisp) saves file and
starts two child SBCL processes with bounded waits: one verifies nine subject/body queries,
the other rejects an inconsistent position despite correct CRC. Demonstrates
round trip after normal close, not durability after power loss or
engine recovery. The [C1 review](full-text-codec-decisioni.md) separates these
results from full qualification.

Generation I/O/publication, writer reservations before decision,
READY inventory/frontiers, hint validation and document reanalysis,
MVCC, Query Engine, and reclamation remain. REQ-SEC-003…REQ-SEC-010 remain designed in their
overall scope. A structurally valid view certifies neither Serie
coverage nor a complete NNTP response.

[Document preparation](full-text-documenti.md) now extracts CBOR fields,
produces a SEALED run, and calculates conservative cost before future writer connection.
