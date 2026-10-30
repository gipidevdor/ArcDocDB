<a id="formato-binario-dellindice-full-text"></a>

# Full-text index binary format

> **Decided ([ADR-0054](adr/0054-contratto-e-formato-full-text.md))** — Design format
> `.idx` version 2, full-text type 5. The [product codec](implementazione/full-text-codec.md)
> is available for the six sections and local verification against the descriptor;
> durable publication and engine qualification remain incomplete.
> Completes the family described in [formati-su-disco.md](formati-su-disco.md#file-indice).

Fixed-width integers are unsigned little-endian. Byte and array ranges are half-open;
sums are checked before use. Offsets are absolute within the file except where explicitly
section-relative. Document records retain their v1/v2 format: index-file versioning
is independent.

<a id="header-e-directory"></a>

## Header and directory

| Offset | Type | Field and constraint |
|---|---|---|
| 0 | `char[8]` | ASCII magic `ARCDIDX1` |
| 8 | `u16` | index-file version: 2 |
| 10 | `u16` | type: 5, reserved for full text |
| 12 | `u16` | section count: 6 |
| 14 | `u16` | flags: zero |
| 16 | `byte[16]` | authoritative Serie identity |
| 32 | `u64` | segment-id, compared with manifest and hint |
| 40 | `u64` | exact file length, including footer |
| 48 | `u64` | directory offset: 64 |
| 56 | `u32` | CRC32C of bytes `[0,56)` |
| 60 | `u32` | reserved zero, checked separately |

The directory occupies `[64,208)`: six 24-byte entries ordered by section type.
Each entry contains `u16 tipo`, `u16 flag=0`, `u32 riservato=0`, `u64 offset`,
`u64 lunghezza`. There are no optional sections in version 2/type 5.

| Type | Section | Structure |
|---|---|---|
| 1 | META | a single CBOR array, described below |
| 2 | DICT | 32-byte entries, one per distinct field/term pair |
| 3 | TERMS | UTF-8 term bytes, without terminator |
| 4 | POSTINGS | 16-byte entries |
| 5 | POSITIONS | `u32` array |
| 6 | LENGTHS | 16-byte entry per present row/field |

Sections occur in that order. The first offset is 208; each subsequent offset is
`align8(end of previous section)`. Zero padding, at most seven bytes between sections.
An empty section has zero length and may share its offset with the next.
No additional gaps, overlaps, or unknown trailing bytes are allowed.

The footer is a `u32 CRC32C` immediately after LENGTHS, without final padding: it covers
all bytes `[64,file-length-4)`, including directory and padding. Even the minimum file
contains META, directory, and footer; a term-free index is valid if segment coverage
and counts are valid. The effective file limit is configured, default 16 GiB,
always within the platform's positive `off_t` range.

## META

One definite-length CBOR array of exactly 12 elements. Arrays and strings have definite
lengths; integers and headers are minimal; no maps, tags, floats, or extra elements.
The decoder also applies the section's 64 KiB budget before allocation.

| Index | Element |
|---|---|
| 0 | `index-id`, positive integer within `u64` |
| 1 | `generation-id`, positive integer within `u64` |
| 2 | `contract-version`, positive integer within `u64` |
| 3 | source segment valid length, within `u64` |
| 4 | associated hint's exact byte length, within `u64` |
| 5 | CRC32C of **all** associated hint bytes, within `u32` |
| 6 | hint row count, within `2^32` |
| 7 | profile string: `unicode-word-18.0.0-v1` |
| 8 | profile revision: integer 1 |
| 9 | field array: each is `[field-id, alias, [chiavi del percorso]]`, ordered by field-id |
| 10 | analysis limits: `[input-bytes, term-bytes, tokens-per-document, prepared-bytes, analysis-work]`, five positive integers within `u64` |
| 11 | committed PUT record count in the segment prefix, within row count |

IDs, field configuration, profile, and limits are compared in full with the expected
generation descriptor. A configuration hash is insufficient.
Valid length and rows must match verified manifest/hint. The hint CRC binds ordinals
to the exact bytes of that map: rebuilding a hint with a different order requires
rebuilding the full-text index. Verification of the hint itself and documents remains
mandatory; its CRC does not certify text contents.

Build considers every committed PUT in the prefix, including historical ones;
it does not index tombstones, OUTCOME, or aborted prepared records. A committed prepared
record uses the authoritative CSN resolved under the segment contract. Missing fields
have no LENGTHS entry; present but empty fields have a zero-token entry.
No terms is still distinct from unknown coverage or an incomplete build.

<a id="dizionario-e-posting"></a>

## Dictionary and postings

32-byte DICT entry:

| Relative offset | Type | Field |
|---|---|---|
| 0 | `u16` | declared field-id |
| 2 | `u16` | reserved zero |
| 4 | `u32` | term byte length, positive and within declared limit |
| 8 | `u64` | term offset relative to TERMS start |
| 16 | `u64` | first entry index in POSTINGS |
| 24 | `u64` | positive posting count |

DICT is strictly ordered by field-id and UTF-8 term bytes, without locale.
TERMS contains strings in that same order, contiguous and without shared ranges.
The first offset is zero; the sum of lengths is the TERMS length.
Every term is valid UTF-8 and must already be output of the declared profile.

16-byte POSTINGS entry: `u32 row`, `u32 frequency`, `u64 first-position`.
`row` is a zero-based hint ordinal; `frequency` is positive; `first-position`
is an index into the POSITIONS array, not a byte offset. Each list has strictly
increasing rows without duplicates. Lists follow DICT order, are contiguous, and
partition the whole POSTINGS section. `frequency` gives the number of POSITIONS entries
belonging to the posting; their lists follow the same order and partition POSITIONS.

16-byte LENGTHS entry: `u32 row`, `u16 field-id`, `u16 riservato=0`,
`u32 token-count`, `u32 riservato=0`. Strict `(row, field-id)` order, without
duplicates. Every posting finds its row/field entry; every position is below
`token-count` and positions within a posting strictly increase. Frequency matches
the position-list length. Per row/field, summed frequencies match `token-count`;
full verification also checks that the union of positions is exactly `[0,token-count)`,
without duplicates across different terms.

The initial version uses no delta encoding, varints, front coding, Bloom filters, or
skip blocks. Sorted DICT and postings permit binary search and range intersection;
another representation requires an explicit format version.

<a id="validazione-e-ammissione"></a>

## Validation and admission

Before exposing the file as usable coverage, the checker verifies lengths, CRC,
identity, types/versions, reserved fields, padding, exact sections, and counts.
It verifies ordering, uniqueness, every string/list boundary, and hint binding,
including rows, CSNs, and committed outcomes. These checks apply even if all CRCs are
correct. DICT, POSTINGS, POSITIONS, and LENGTHS lengths must be multiples of
32, 16, 4, and 16 respectively; META must consume its entire section.
Correctness of terms relative to documents requires full verification with independent
reanalysis: a file-only check does not establish it.

Work is divided into bounded tasks and buffers, without per-entry allocation or writer
I/O. Budget is checked before acquiring memory; if insufficient, the file is not
declared ready. A valid-CRC file with an unknown version produces `unsupported-format`;
a recognized inconsistency produces `index-corrupt`.

These are hard format constraints: row within `u32`, field-id within `u16`,
frequencies/token-count within `u32`, sections within `u64` and platform I/O limits.
Summed tokens per document/index are at most `2^32-1`, even if defaults are raised.
No count multiplication may overflow before comparison with its section.

<a id="limite-superiore-e-rotazione"></a>

## Upper bound and rotation

For every document and index, analysis returns an upper bound:

```
U(documento) = 16 × present fields
             + sum, for every distinct (field, term) in the document,
                 of (32 + term UTF-8 bytes + 16)
             + 4 × total token count
```

The sum of these contributions, plus header/directory (208 bytes), META limit,
at most 35 padding bytes, and footer (4 bytes), is a file upper bound.
The sum overestimates the dictionary when a term occurs in multiple documents and
therefore remains conservative. Empty inputs, prepared PUTs, and subsequently updated
documents do not authorize reducing the reservation without outcome proof: a resolved
abort may release it, while committed versions still physically present count until compaction.

M01 reserves this cost for every index before append/prepare. Exceeding the segment
budget requires rotation before admission; a request that cannot fit an empty segment
is rejected. Temporary-space budget is reserved before build. The estimate is not a
space or performance measurement: it avoids discovering afterward that the admitted
format cannot represent committed documents.

<a id="fixture-binaria-minima-indipendente"></a>

## Independent minimal binary fixture

An independent fixture uses one field with two rows: row 0 `alpha beta alpha`, row 1
`beta`. DICT contains `alpha`, `beta`; TERMS concatenates their UTF-8 bytes.
POSTINGS contains rows `[0]` for `alpha` and `[0,1]` for `beta`, with frequencies `[2]`
and `[1,1]`. POSITIONS follows posting order: `[0,2,1,0]`. LENGTHS contains
`(0,campo,3)` and `(1,campo,1)`. Tests cover phrase `alpha beta`, phrase `beta alpha`,
duplicate rows, swapped hint, out-of-section offset, and altered positions with
recomputed CRC. The [complete 468 bytes](../tests/fulltext/minimum-v2.hex) and expected
CRCs are computed by an [independent oracle](../tools/fulltext-codec-fixture.lisp), without
loading the product, and frozen before the encoder's first execution.
The [implementation method](implementazione/full-text-codec.md) distinguishes this test
from hint verification and document reanalysis.
