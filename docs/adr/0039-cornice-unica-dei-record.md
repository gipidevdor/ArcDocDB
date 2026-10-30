<a id="adr-0039--cornice-unica-dei-record-due-crc-quattro-tipi-nei-segmenti-hint-risolto"></a>

# ADR-0039 — Common record frame: two CRCs, four segment types, resolved hints

> **Revision:** [ADR-0048](0048-limiti-documentali-e-formato-v2.md) supersedes the relevant document limits and v2 layout. The following text preserves the historical v1 decision.

- **Status:** Accepted; verification of prepared records clarified by [ADR-0047](0047-verifica-csn-dei-record-prepared.md): the effective CSN is verified through OUTCOME or the manifest outcome, not through the flag alone.
- **Date:** 2026-10-03
- **Relationship to the specification:** no amendment. **Partly supersedes**
  [ADR-0014](0014-formato-record-documento-id.md) item 3 (record header and types) and
  the hint-file portion of [ADR-0015](0015-primary-index-swiss-table-swmr.md). The document
  (CBOR), `_id`, and hash from ADR-0014 remain.
- **References:** [design analysis](../analisi-progettuale.md) AP-08, AP-11, AP-13;
  [on-disk formats](../formati-su-disco.md); INV-F1, INV-F2, INV-A2

<a id="contesto"></a>

## Context

The v1 format is not yet implemented: it can be corrected without migration. Three problems:
the single CRC covers fields only the writer knows, so the writer must calculate the CRC of
the entire document (AP-13); segments, the control log, and `multiserie.log` have three different
headers; some fields and one record type serve no purpose.

<a id="decisione"></a>

## Decision

<a id="1-una-sola-cornice-per-ogni-record-di-ogni-log"></a>

### 1. One frame for every record in every log

Fixed **24-byte** header, followed by key and value:

| Offset | Type | Field |
|---|---|---|
| 0 | `u32` | `header-crc`: CRC32C of bytes 4–23 |
| 4 | `u32` | `body-crc`: CRC32C of key and value |
| 8 | `u8` | type |
| 9 | `u8` | flags |
| 10 | `u8` | `key-len` |
| 11 | `u8` | reserved |
| 12 | `u32` | `value-len` |
| 16 | `u64` | `stamp` |

- Record length is `24 + key-len + value-len`: there is no separate length field
  that could lie. The header is verified **on its own** before trusting the
  lengths.
- `header-crc` covers `body-crc`: header and body are linked.
- **Who calculates what.** The worker receiving the request calculates `body-crc` (work
  proportional to bytes, outside the writer). When closing the batch, the writer writes `stamp`
  and calculates `header-crc` over 20 bytes: no per-byte work in the serial portion beyond
  copying into the buffer.

<a id="2-tipi"></a>

### 2. Types

| Type | Where | `stamp` | Value |
|---|---|---|---|
| 1 PUT | segment | CSN; TXID if prepared | document |
| 2 TOMBSTONE | segment | CSN; TXID if prepared | empty |
| 3 SEAL | every log | batch CSN (segment); sequence number (control log) | file identifier, batch start, durable frontier, record count, batch CRC |
| 4 OUTCOME | segment | TXID | transaction CSN |
| 5 EDIT | control log | sequence number | opens, closes, removes ([ADR-0040](0040-manifest-a-record-unico.md)) |
| 6 DECISION | `multiserie.log` | TXID | CSN, participants |

Compared with the previous format, the following disappear: the `PREPARE` record (prepared
records are recognized by their flag and made atomic by their batch's SEAL), the `version`
field ([ADR-0038](0038-orizzonte-di-visibilita.md)), TXID for ordinary operations (a batch is
atomic by position, [ADR-0037](0037-lotto-sigillato.md)), `ABORT` outcomes
([ADR-0041](0041-multiserie-segmenti-autosufficienti.md)), and the dedicated headers for the control
log and `multiserie.log`.

<a id="3-hint-sempre-risolto-con-il-filtro-di-esistenza"></a>

### 3. Hints: always resolved, with the existence filter

A closed segment's hint file has one **24-byte** entry for each **committed** PUT or
TOMBSTONE record, in offset order, with the **final** CSN (for prepared records,
the outcome's CSN: every outcome is known at closing, INV-S7). It also contains:

- in the header, the segment's `csn-min` and `csn-max`;
- a **Bloom** section over entry keys: the existence filter governing
  tombstone removal ([ADR-0042](0042-tombstone-e-indice-dei-vivi.md)).

The separate `.bloom` file no longer exists. Filters on secondary-index **values** are
sections of their respective `.idx` files ([ADR-0026](0026-indici-secondari-segmentati.md)), as
required by the specification (“Bloom filter per segment … a value is definitely absent”).

The hint remains derived data: it is regenerated from the segment and manifest; if missing
or invalid, tombstone removal treats it as “possibly present” and index rebuilding
scans the segment.

<a id="4-verifica-in-lettura-precisa-inv-a2"></a>

### 4. Verification on read (clarifies INV-A2)

A record reached through an index entry is returned only if: `header-crc` is valid; the
type is PUT; the calculated length matches the entry's length; `body-crc` is valid; the
key matches; and — if the record is not prepared — `stamp` matches the entry's CSN.
If the record is prepared, the entry must carry the corresponding flag (the CSN comes
from the outcome). The rule is identical for disk and cache.

Pattern: separate header and body CRCs, with the former covering the latter
(TigerBeetle); self-delimiting record verifiable before reading its body (Kafka record
batch); per-file existence filter (LevelDB/RocksDB SSTables, Cassandra).

<a id="conseguenze"></a>

## Consequences

- One codec and one fuzzer for segments, the control log, and `multiserie.log`.
- 24 bytes per record instead of 40; 24 bytes per hint entry instead of 32.
- The writer's per-operation budget no longer depends on document size, except
  for copying.
- A worker defect in calculating `body-crc` produces an invalid record: it is
  detected on the first read and by scrubbing, without silent corruption.

<a id="alternative-considerate"></a>

## Alternatives considered

- *Single CRC calculated by the writer:* per-byte work in the serial portion.
- *Single CRC calculated beforehand, with CSN outside the record:* segments produced by compaction
  contain records from different batches and still need a CSN per record.
- *Combine two CRCs using CRC algebra:* avoids the second field, but adds another algorithm
  to verify to save 4 bytes.

<a id="valutazione"></a>

## Assessment

- Verification: frame fuzzing; deliberate corruption of every field (every damage detected);
  SPK-09 measures separate header and body CRCs.
