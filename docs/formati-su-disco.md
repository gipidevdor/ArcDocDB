<a id="formati-su-disco"></a>

# On-disk formats

> Persistent formats defined by ADRs [0039](adr/0039-cornice-unica-dei-record.md) (record
> frame, hint), [0037](adr/0037-lotto-sigillato.md) (batch and SEAL),
> [0040](adr/0040-manifest-a-record-unico.md) (control log, catalog),
> [0041](adr/0041-multiserie-segmenti-autosufficienti.md) (`multiserie.log`),
> [0026](adr/0026-indici-secondari-segmentati.md) (indexes). These replace the first draft
> (ADR 0013–0021), which was never implemented. From the first code onward, a format does
> not change: a change is a new version number with migration ([principles](principi-di-ingegneria.md)).

<a id="versioni-del-formato"></a>

## Format versions

[ADR-0048](adr/0048-limiti-documentali-e-formato-v2.md) defines v2 for an effective 16 MiB document size and keys up to 65,535 bytes. Existing spikes exercise v1; v2 evidence remains to be produced. The file version selects decoder and migration.

<a id="convenzioni-comuni"></a>

## Common conventions

- **Little-endian** integers, no natural-alignment requirement.
- Every file starts with an 8-byte ASCII **magic** and `u16` **version**.
- Checksum: **CRC32C** (Castagnoli polynomial).
- All records in all logs have the same [frame](#cornice-del-record).
- What fails verification is **nonexistent**: a tail (for a log), data to regenerate (for
  a derived file), declared corruption (for acknowledged data). INV-F1, INV-F3.
- Timestamps: nanoseconds, `u64`, wall clock; informational only.
- Identifiers: per-Serie increasing `segment-id` `u64`, **never reused**; per-Archivio
  increasing `txid` `u64` (multiseries transactions only); `csn` `u64`; 16-byte Serie ID.

<a id="intestazione-dei-log-di-controllo-64-byte"></a>

### Control-log header (64 bytes)

[ADR-0052](adr/0052-header-dei-log-di-controllo.md) completes the layout of
`control.log` and `multiserie.log` before their first codec. Valid for v1/v2:

| Offset | Type | Field |
|---|---|---|
| 0 | `char[8]` | magic `ARCDCTL1` (control) or `ARCDMSL1` (multiseries) |
| 8 | `u16` | record version, 1 or 2 |
| 10 | `byte[6]` | reserved zero |
| 16 | `byte[16]` | Serie ID (control) or Archivio ID (multiseries) |
| 32 | `byte[24]` | reserved zero |
| 56 | `u32` | CRC32C of bytes 0–55 |
| 60 | `byte[4]` | reserved zero, checked even outside the CRC |

Archivio identity is 16 opaque bytes. Type and identity are compared with the
authoritative source before scanning records. An invalid header is an integrity
error; the tail rule applies to batches after the header.
The magic above remains the same for v2; the version selects the decoder.

<a id="cornice-del-record"></a>

## Record frame

Fixed 24-byte header, followed by key and value.

| Offset | Type | Field |
|---|---|---|
| 0 | `u32` | `header-crc`: CRC32C of bytes 4–23 |
| 4 | `u32` | `body-crc`: CRC32C of key and value bytes |
| 8 | `u8` | type |
| 9 | `u8` | flags: bit0 prepared · bit1 compressed (reserved) · bit2 versioned-contract · bit3 complete (EDIT only) |
| 10 | `u16` | v2 `key-len` (1–65,535 for PUT and TOMBSTONE; 0 for other types); v1 uses u8 plus reserved zero |
| 12 | `u32` | `value-len` |
| 16 | `u64` | `stamp` |
| 24 | `byte[key-len]` | key |
| … | `byte[value-len]` | value |

Record length = `24 + key-len + value-len`. A reader verifies `header-crc` **before**
using lengths, then `body-crc`.

| Type | Log | `stamp` | Value |
|---|---|---|---|
| 1 PUT | segment | batch CSN; TXID if prepared | CBOR document |
| 2 TOMBSTONE | segment | batch CSN; TXID if prepared | empty |
| 3 SEAL | all | batch CSN (segment); sequence number (control logs) | see [Batch and SEAL](#lotto-e-seal) |
| 4 OUTCOME | segment | TXID | transaction `u64 csn` |
| 5 EDIT | control log | sequence number | see [Control log](#control-log) |
| 6 DECISION | `multiserie.log` | TXID | see [`multiserie.log`](#multiserielog) |

<a id="lotto-e-seal"></a>

## Batch and SEAL

A log is a sequence of **batches**. A batch is a sequence of records followed by a SEAL.

SEAL value (32 bytes):

| Offset | Type | Field |
|---|---|---|
| 0 | `u64` | file identifier: `segment-id`; zero for control logs |
| 8 | `u64` | `batch-start`: file offset of the batch's first record |
| 16 | `u64` | `durable-offset`: file durable frontier known at batch closure |
| 24 | `u32` | `count`: batch record count, excluding SEAL |
| 28 | `u32` | `batch-crc`: CRC32C of the sequence of batch records' `header-crc` values |

A batch is **valid** if: every record has valid `header-crc` and `body-crc`; the following
SEAL declares this file's identifier, the actual position of the first record as
`batch-start`, the actual count and `batch-crc`; every non-prepared record has the same
`stamp` as the SEAL. An invalid batch does not exist (INV-F2).

Tail rule ([ADR-0037](adr/0037-lotto-sigillato.md) §3): let `P` be the start of the first
invalid batch. If a valid SEAL for this file at a later position declares
`durable-offset > P`, the log is **corrupt**; otherwise valid length is `P`.

<a id="segmento"></a>

## Segment

File `segments/<segment-id:016x>.seg`.

<a id="intestazione-64-byte"></a>

### Header (64 bytes)

| Offset | Type | Field |
|---|---|---|
| 0 | `char[8]` | magic `ARCDSEG1` |
| 8 | `u16` | format version = 1 |
| 10 | `u8` | origin: 1 writer · 2 compaction |
| 11 | `byte[5]` | reserved |
| 16 | `byte[16]` | Serie ID |
| 32 | `u64` | segment-id |
| 40 | `u64` | created-at |
| 48 | `u64` | reserved |
| 56 | `u32` | CRC32C of bytes 0–55 |
| 60 | `u32` | reserved |

<a id="contenuto"></a>

### Contents

From offset 64 to the **valid length** recorded in the manifest:

- **writer origin**: sealed batches of PUT, TOMBSTONE, OUTCOME records;
- **compaction origin**: **resolved** PUT and TOMBSTONE records only (never prepared,
  never OUTCOME, no SEAL), each with its own CSN.

Bytes beyond valid length (the tail of an `ACTIVE` closed by recovery) are not
part of the segment.

<a id="quali-record-sono-committed"></a>

### Which records are committed

In a `CLOSED` segment, within valid length:

| Record | Committed if |
|---|---|
| Non-prepared PUT, TOMBSTONE | always; CSN is `stamp` |
| Prepared PUT, TOMBSTONE | the same segment contains an OUTCOME with the same TXID, or the manifest records the outcome for that TXID at segment closure; CSN is the outcome's |
| Everything else | not committed (aborted transaction) |

The same applies to valid `ACTIVE` batches during recovery, with the
`multiserie.log` decision table replacing the manifest (INV-S7).

<a id="verifica-in-lettura"></a>

### Read-time verification

A record reached from an index entry `(chiave, CSN, location, flag)` is returned only if
**all** conditions hold (INV-A2): valid `header-crc`; PUT type; `24 + key-len +
value-len` equals entry length; valid `body-crc`; matching key; if the record is
not prepared, `stamp` equals entry CSN and entry lacks prepared flag; if the record is
prepared, entry has prepared flag. The rule is the same for records read from segments
and obtained from cache.

> **Decided (prepared verification → ADR-0047)** — For a prepared record, the entry flag
> is insufficient: the reader also verifies the segment's OUTCOME or closure EDIT outcome.
> Proof TXID must match record `stamp` and resolved CSN must match entry CSN.
> No verifiable proof means an integrity error;
> [ADR-0047](adr/0047-verifica-csn-dei-record-prepared.md) does not change the format.

<a id="file-hint"></a>

## Hint file

File `segments/<segment-id>.hint`: segment index. Derived data, written after
closure; regenerable from segment and manifest.

| Section | Contents |
|---|---|
| header (128 B) | magic `ARCDHNT1`, version, Serie ID, segment-id, `n` entries, `csn-min`, `csn-max`, section `(offset, len)` table, CRC |
| entries (24 B × n) | `u32 offset` · `u32 len` · `u64 csn` · `u32 key-off` · `u16 key-len` · `u8 tipo` · `u8 flag` (v2; v1 uses u8 key-len and a final reserved byte) |
| keys | concatenated keys, addressed by `key-off` |
| bloom | existence filter on entry keys: `u32 m` bits, `u32 k` functions, then `u64[ceil(m/64)]`; `k` functions from 64-bit hash (double hashing), ~1 % false positives |
| footer | `u32` CRC32C of all sections |

One entry per **committed** PUT or TOMBSTONE record, in `offset` order; `csn`
is definitive. The entry ordinal is the ‘row’ used by secondary indexes. The flag
indicates whether the on-disk record is prepared.

<a id="file-indice"></a>

## Index file

File `segments/<segment-id>.<nome-indice>.idx`, one per contract index. Derived data.

| Section | Contents |
|---|---|
| header (64 B) | magic `ARCDIDX1`, version, index type, Serie ID, segment-id, `n` indexed rows, `k` sections, section `(offset, len)` table, CRC |
| sections | depend on type (below) |
| footer | `u32` CRC32C of all sections |

| Type | Sections |
|---|---|
| **string** | `keys`: sorted keys with front coding in blocks of 16 · `key-offsets`: `u32[]` start of each block · `rows`: `u32[]` row per key · `bloom` on values |
| **ordered** (numbers, dates) | `values`: sorted `u64[]` (int64/double/epoch, order-preserving encoding) · `rows`: `u32[]`; first and last value in header |
| **category** | `dict`: sorted distinct values (front coding) · `postings`: per value, `u32 count` + delta-encoded varint rows · `bloom` on values |
| **bitmap** | per distinct value: `u64[ceil(n/64)]` |

An index file's `bloom` section has the same format as the hint's and concerns
indexed **values**: it says only ‘definitely absent / possibly present’ (INV-I2)
and lets an equality query skip the segment.

<a id="indice-full-text"></a>

### Full-text index

> **Decided ([ADR-0053](adr/0053-ricerca-full-text-indici-invertiti.md))** — A full-text type
> extends the `.idx` family. Later completion in
> [ADR-0054](adr/0054-contratto-e-formato-full-text.md) fixes the
> [`.idx` v2, type-5 layout](formato-indice-full-text.md), separate from document
> versions. The product codec and its qualification remain to be implemented.

One file per full-text index and segment contains Serie/segment identity, generation,
and analysis profile; sorted `(campo, termine)` dictionary; sorted posting lists
of row ordinals with frequencies; token positions within fields; section counts
and limits, protected by CRC32C. Rows resolve only through the associated segment's
hint. The first layout includes neither Bloom nor compression; a term filter in a
future codec would indicate only absence or possible presence.

Before use, verify version, identity, generation/profile, CRC, section boundaries,
counts, ordering, and row/position ranges. The decoder rejects inconsistent values
even with correct CRC. Generation management verifies coverage relative to segments
and published delta; CRC alone does not prove it.
An unusable file is reported and rebuilt from committed documents, never interpreted
as an empty list. CLEAN/MERGE regenerate references to new rows.
Document record formats v1/v2 and durable atomicity points remain unchanged.

## Control log

File `wal/control.log`: the Serie manifest. A 64-byte header (magic `ARCDCTL1`,
version, Serie ID, CRC), followed by sealed batches of **EDIT** records.

EDIT value:

| Field | Type | Meaning |
|---|---|---|
| `next-id` | `u64` | next segment-id (only with complete flag; otherwise zero) |
| `open` | `u64` | new `ACTIVE` segment-id; zero = unchanged |
| `n-closed` | `u32` | number of segments becoming or already `CLOSED` |
| for each | `u64 segment-id` · `u64 valid-bytes` · `u32 n-res` · `n-res × (u64 txid, u64 csn)` | valid length and outcomes recorded at closure |
| `n-removed` | `u32` | number of removed segments |
| for each | `u64 segment-id` | — |

Every file's first record has the **complete** flag and declares the entire state:
`ACTIVE`, all `CLOSED`, removed segments whose files may still exist, and next segment-id.
Subsequent EDITs fold over it. Compaction and recovery write `control.log.tmp` with
a complete EDIT and rename it over the original.

## `multiserie.log`

File `Registri/multiserie.log`. A 64-byte header (magic `ARCDMSL1`, version, Archivio
ID, CRC), followed by sealed batches of **DECISION** records. Every DECISION is a COMMIT.

DECISION value:

| Offset | Type | Field |
|---|---|---|
| 0 | `u64` | transaction `csn` |
| 8 | `u16` | `n-part` |
| 10 | `byte[16][n-part]` | participating Serie IDs |

Compaction: `multiserie.log.tmp` with only decisions not yet forgettable, then rename
over the original.

<a id="catalogo-documenti-di-registri"></a>

## Catalog (Registri documents)

CBOR document with key = Serie ID (16 bytes). Fields: `name`, `state`
(`active`/`dropping`), `created-at`, `durability`, `segment-target-bytes`,
`contract` (version, fields, policy), `indexes` (name, type, field, `complete-from`
segment-id), `compaction` ([ADR-0023](adr/0023-politiche-di-compaction.md) thresholds),
`cache-share`, `path` (optional, for different devices).

<a id="nomi-temporanei"></a>

## Temporary names

Every **prepared** file or directory has a `.tmp` suffix until its level's source
of truth names it ([ADR-0036](adr/0036-leggi-di-progetto.md)):

| Object | Decision making it definitive |
|---|---|
| `<id>.seg.tmp` | EDIT opening or closing it |
| `<id>.hint.tmp`, `<id>.<indice>.idx.tmp` | none: derivatives, renamed once complete |
| `control.log.tmp`, `multiserie.log.tmp` | rename itself |
| directory `<id-serie>.tmp/` | catalog `active` document |

On restart: an unnamed `.tmp` is deleted; a named one is renamed; an object with a
definitive name unknown to every source of truth is **left untouched** (INV-A10).
