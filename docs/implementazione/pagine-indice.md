<a id="pagine-persistenti-dellindice-primario--i2"></a>

# Persistent primary-index pages — I2

> **Decided (authorized incremental implementation → ADR-0058)** — Local C1
> codec, REQ-IDX-009, INV-I8, INV-A2, INV-A8, INV-P6. Backend, cache,
> engine publication remain to integrate; current index stays resident.

[ADR-0058](../adr/0058-pagine-indice-primario.md) defines binary representation
without changing segments, WAL, control log, SEAL, EDIT, DECISION.
[Automatic selector](indice-automatico.md) remains separate component.

<a id="identita-e-pageref"></a>

## Identity and PageRef

A page belongs to (16-byte Serie UUID, image, offset, generation,
size). Image/offset/generation positive, below 2^60.
Offset aligned to size, zero reserved; one image uses one size.
Offset an address in future image file, not location in document
segments. Container header/publication not implemented.

PageRef contains u64 offset/generation; Serie/image/size inherited
from context. Zero/zero absence, partial pair corrupt.
Child offset strictly less than parent's, generation no
greater, both checked even with valid CRC. Writer will build
children/tails before parents/heads. No offset/image reuse
or generation rollback. Reader checks expected identity on
every load; same offset in another image is different page.

Rules prevent local reference cycles but certify neither presence,
durable frontier, nor graph coverage. Future file allocator
will also check file-system limits, quotas, reservations before append.

<a id="header-comune-little-endian"></a>

## Common header, little-endian

| Offset | Bytes | Field and constraint |
|---:|---:|---|
| 0 | 8 | ASCII magic `ARCIPG01` |
| 8 | 2 | Version 1 |
| 10 | 1 | Type: 1 bucket, 2 directory, 3 key fragment |
| 11 | 1 | Size log2: 12, 14, 16 |
| 12 | 4 | Zero flags |
| 16 | 16 | Exact Serie UUID |
| 32 | 8 | Image identity |
| 40 | 8 | This page's offset |
| 48 | 8 | This page's generation |
| 56 | 4 | Used body bytes excluding header/padding |
| 60 | 4 | Count, type-specific meaning |
| 64 | 8 | NEXT offset (bucket overflow/next fragment), zero for directory |
| 72 | 8 | NEXT generation |
| 80 | 4 | Type-specific parameter |
| 84 | 4 | Reserved zero |
| 88 | 4 | CRC32C of bytes [0,88) |
| 92 | 4 | CRC32C of whole body [96,size), including padding |

Header CRC checked before fields. Unknown versions/types with
intact header produce `unsupported-format`. Incomplete body, wrong CRC,
inconsistent identity/geometry/references produce `corruption-detected`.
Unused padding must be zero even after CRC verification.
Valid checksum does not mean valid semantics/committed data.

```text
page = header96 | used body | zero padding
bucket = controls[C] | entry[C * 64] | inline key arena
directory = PageRef[2^bits]
key = contiguous byte fragment of the complete key
```

<a id="bucket-flat"></a>

## Flat bucket

| Size | Slots C | Maximum live (7/8 C) | Maximum inline arena | Maximum body |
|---:|---:|---:|---:|---:|
| 4096 | 32 | 28 | 1920 | 4000 |
| 16384 | 128 | 112 | 7968 | 16288 |
| 65536 | 512 | 448 | 32160 | 65440 |

Layout calculations, not performance/RSS measurements. Parameter = C, count =
live slots. Control EMPTY 255 or fingerprint 0..127, digest's seven
low bits. DELETED/other values not persisted: new pages
compact copies, not in-place updates.

Initial group `(digest-low32 >> 7) & (C-16)`; groups of 16 advance
circularly by 16 as resident primary. All group candidates
examined before declaring absence on EMPTY. Verifier
rejects slot placed after earlier group containing EMPTY: checksum
alone would not prevent false miss. No probe exceeds C/16 groups.

Each 64-byte entry contains:

| Entry offset | Bytes | Field |
|---:|---:|---|
| 0 | 8 | Complete digest, same Serie hash/seed to integrate into builder |
| 8 | 8 | Nonzero CSN, all 64 bits available |
| 16 | 8 | v2 record location |
| 24 | 4 | v2 record length |
| 28 | 2 | Key length 1..65535 |
| 30 | 2 | 0 inline, 1 external |
| 32 | 4 | Key offset relative to body, or zero if external |
| 36 | 4 | Reserved zero |
| 40 | 8 | First key-page offset, or zero if inline |
| 48 | 8 | First key-page generation, or zero if inline |
| 56 | 8 | Reserved zero |

EMPTY slots have all 64 bytes zero. Inline keys packed
in physical slot order from C*65, without gaps/overlaps;
end must match USED. External keys consume no arena, require
non-null PageRef. Complete key decides equality, never hash alone.
CSN/location/length meet primary v2-payload limits; seqlock
not serialized. Codec neither checks key-derived digest,
detects every duplicate, nor certifies visibility/document CRC.
These are builder/lookup obligations integrated with seed/snapshot.

NEXT allows overflow for collisions/full buckets. Future split/
overflow policy must have work/I/O budgets, distinguish every outcome;
arbitrary chains not accepted as complete lock-free lookup.
Local EMPTY-group miss does not finish chain search:
when NEXT present, backend must continue even if bucket has
free slots, through last verified page. Codec does not traverse.
Cold validation may probe C/16 groups per entry:
conservative O(C^2) bound, C <=512, to measure during loading.

<a id="directory-paginata"></a>

## Paged directory

Parameter = `bits | (shift << 8)`, high bits zero; bits 1..7/9/11 for
4/16/64 KiB, shift 0..63, bits+shift <=64. Child index uses
corresponding digest range. Exact body `2^bits * 16` bytes,
count non-null PageRefs, null NEXT. Repeated references legal
for buckets covering multiple positions. Root/subsequent levels
will be connected by backend with prefix/coverage checks;
local codec knows neither parent nor entire dataset.

Calculated maximum fanout 128/512/2048. Nodes may load through
same future cache: no fully resident directory requirement.
Tests build split directory with two separate buckets;
not yet concurrent-split algorithm/publication implementation.

<a id="frammenti-di-chiave"></a>

## Key fragments

Count = total key length, parameter = fragment position.
USED = min(body space, total-position). Every nonfinal fragment full;
NEXT non-null iff content remains. For 65535 bytes, 17/5/2
pages required at three sizes, buildable tail-to-head with offsets decreasing
in read order. Future lookup checks total equals entry,
contiguous positions, generations, byte comparison without mandatory
full buffer. Correct pages alone do not prove complete chain.

<a id="api-e-proprieta"></a>

## API and ownership

Package `arcdocdb.index.page`:

- `crea-identita-pagina(serie, immagine, offset, generazione)` copies 16 Serie
  bytes into immutable descriptor. Invalid numbers/length rejected
  before copy; alignment checked when size known.
- `crea-descrittore-pagina(identita, tipo, count, parametro, :next, :next-generation)`
  prepares immutable metadata. Neither reserves engine memory nor writes files.
- `scrivi-pagina-indice(buffer, start, end, descrittore, body, from, to)` verifies
  caller-prepared canonical body, then writes page/CRC.
  Ranges, aliases, limits, structure checked before destination
  modification. Returns END; guards/source preserved.
- `verifica-pagina-indice(buffer, start, end, identita)` returns type,
  count, parameter, used, next, next-generation only after all checks.
  No buffer modification, per-entry object allocation, retained references.

Operations on preparation/loading path, outside hot resident
lookup. Reading u64 values may produce SBCL bignums; no
zero-allocation, lock-freedom, GC-pause immunity claim for
codec. Buffers/descriptors stable during call;
future cache supplies separate lifetime protocol (I3). No per-Serie shared
lock/counter/write added.

<a id="metodo-preregistrato-e-decisioni-c1"></a>

## Preregistered method and C1 decisions

Before first execution: manual little-endian fixtures/bitwise CRC
without product helpers; encoder compared bytewise, decoder
checked on independent fixtures. Nonzero guards/copied sources
identify external writes/rejection effects. Executions recorded with
blobs before/after/every failure, then global `make check`.

| Compound decision (COD-54) | Planned independent conditions/cases |
|---|---|
| Constructors | UUID 15/16 bytes; each number zero/negative/fraction/beyond 2^60; count/parameter/next/generation individually wrong |
| Reference | null/null; partial pairs; valid/unaligned/self/forward page; positive/previous/future generation; beyond-domain numbers |
| Body | USED within page/buffer; exact arena/one-byte overrun; nonzero buffer offset |
| Record | Nonzero CSN; positive key; minimum/maximum record; maximum document; location end within u32; separate reserved fields |
| Inline | Offset equals cursor; length within USED; null PageRef; packing without extra bytes |
| External | Zero offset/nonzero reference; beyond-domain/future references |
| Bucket | C matches size; minimum USED; 7/8 C and next slot; live=count, final arena=USED |
| Directory | Zero high bits; minimum/maximum bits; shift/sum; exact body; count <= fanout/equal non-null references |
| Fragment | Positive total within u16; position before end; exact length; NEXT consistent with final/nonfinal |
| Header | Two-word magic; size code; flags/reserved field; each identity component; USED/count/PageRef in domain |
| Writing | Header-CRC/USED postconditions; preflight before any effect |
| Private contracts | Known geometry, capacity/slots/cursors within buffers; header pre/postconditions. Inputs derived from public preflight without expanding allowed domain |

Arithmetically dependent conditions/private checks already guaranteed
by preflight do not imply reachable independent MC/DC pairs.
Functional campaign neither C1/MC/DC qualification nor full-graph proof.
Raw corruption of every 4 KiB page byte/alterations with recalculated CRC
distinguish physical integrity from structural validation. Three-size,
maximum-key, collision, split-image tests remain separate from
write-amplification, latency, beyond-RAM capacity measurements still to produce.

[Initial results](pagine-indice-risultati.md) also preserve failed
attempts/fixture corrections, distinguishing targeted/global verification.
