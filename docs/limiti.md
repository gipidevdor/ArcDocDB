<a id="limiti-dimensionali"></a>

# Size limits

Limits derived from [on-disk formats](formati-su-disco.md) and the primary-index slot
layout ([ADR-0043](adr/0043-primary-index-a-frammenti.md)). A ‘hard’ limit changes only
with a new format; a ‘practical’ limit depends on hardware. Practical-limit figures are
**estimates** (INV-X2), to be replaced by spike measurements.

<a id="limiti-hard-dai-formati"></a>

## Hard limits (from formats)

| Quantity | Limit | Origin |
|---|---|---|
| `_id` length | 1–65,535 bytes | v2 `key-len u16` in record and hint |
| Record size (header + key + document) | 16,842,775 bytes per PUT | document + key + header; u32 length in v2 slot |
| Document size | **exactly 16 MiB**, default and maximum; configurable lower limit | uncompressed CBOR document, excluding header and key; ADR-0048 |
| Segment size | 4 GiB − 1 | 32-bit `offset` in slot and hint |
| Segments per Serie (distinct IDs over the Serie lifetime, never reused) | 2³² | 32-bit `segment-id` in slot (`u64` on disk); the Serie rejects writes on exhaustion |
| Records per segment | 2³² | `u32` rows in segment indexes and hint |
| Key section of a hint file | 4 GiB | `key-off u32` in hint |
| Commits (CSNs) over an Archivio's lifetime; also document version numbers | 2⁶⁴ (over 580,000 years at 1 M batches/s) | `stamp u64` in record, slot word 0 ([ADR-0038](adr/0038-orizzonte-di-visibilita.md)) |
| Multiseries transactions (TXIDs) | 2⁶⁴ | `stamp u64` |
| Serie participating in a multiseries transaction | 65 535 | `n-part u16` in `multiserie.log` |
| Secondary indexes per Serie | no format limit (one file per index and segment) | — |
| Distinct values in a segment's `category` or `bitmap` index | 2³² | `u32` dictionary |
| Document depth | 100 map/array levels, including root | ADR-0048; decoder check |

The v2 format uses five-word slots (41 B plus keys), 32-bit key offsets, and explicit arena budgets. The v1 format and existing experiments are not evidence for the new layout.

<a id="limiti-pratici-dallhardware"></a>

## Practical limits (from hardware)

| Quantity | Order of magnitude | What determines it |
|---|---|---|
| Documents per server | no universal maximum; resident capacity must be remeasured for v2 | primary index in RAM; 41 B slots plus keys and resources; beyond-RAM path in ADR-0049, still proposed |
| Data per server | limited by disk, not index | at 2 KB per document ≈ 2 TB per billion; larger documents ⇒ more TB for the same RAM |
| Serie per Archivio | thousands without special measures | each Serie has at least one index fragment (~0.3 MB), batch buffers, a cache partition, file descriptors (≥ 1 per open segment) |
| Archivio instances per server | no format limit | each Archivio adds CSN, horizon, coordinator, `multiserie.log` |
| Simultaneously open segments | system file-descriptor limit | ~4,000 segments per TB at 256 MB |
| Throughput per Serie | logical-writer ceiling ([budget](valutazione/stime-ordine-di-grandezza.md#budget-del-writer-logico)) | scale by distributing over multiple Serie |
| **Query on a secondary index** | cost proportional to the Serie's **segment count** | indexes are per segment ([ADR-0026](adr/0026-indici-secondari-segmentati.md)): an equality query checks one filter per segment, a range query checks every segment index not excluded by min/max. At ~4,000 segments per TB, this is the first limit a large Serie encounters: to be measured, with a per-Serie summary index as the planned remedy |
| Active snapshots | configured maximum count; retained-version memory grows with writes × duration | configurable maximum duration ([ADR-0020](adr/0020-csn-snapshot-isolamento.md)) |
| In-flight commits per Archivio | configured registry capacity (proposed default 256) | beyond it, writers do not close new batches; parking remains within byte and time limits ([ADR-0046](adr/0046-orizzonte-con-registro-limitato.md)) |
| On-disk tombstones | at most the unreclaimed dead records, plus filter false positives (~1 %) | [ADR-0042](adr/0042-tombstone-e-indice-dei-vivi.md) |
| I/O workers | configured ceiling | device concurrency and GC pause (SPK-02) |
| Connections | operating-system limit | — |

<a id="che-cosa-non-è-limitato"></a>

## What has no separate limit

- Field count: within size and decoder budgets; maximum nesting 100 levels.
- Document count per Serie: limited only by server RAM (see above). **Deleted** documents
  consume no memory.
- Index-file size: proportional to the segment.

<a id="come-si-estendono-i-limiti-hard"></a>

## Extending hard limits

A hard limit is extended with a new format version number and migration
([principles](principi-di-ingegneria.md)). The most likely candidates are record size
(32 bits in v2) and segment size (32 bits): both live in the index slot, and extending
both costs 8 bytes per slot.

Limits the system **also** enforces as a reliability requirement (INV-A8): every queue,
buffer, request, connection, snapshot, parking list, and attempt has a configured
maximum; exceeding it produces an explicit rejection.

<a id="budget-della-ricerca-full-text"></a>

## Full-text search budgets

> **Decided ([ADR-0053](adr/0053-ricerca-full-text-indici-invertiti.md))** — Dedicated inverted
> indexes require additional budgets. The subsequent
> [ADR-0054](adr/0054-contratto-e-formato-full-text.md) fixes
> [defaults and admission rules](full-text.md#budget-iniziali), with
> [binary limits](formato-indice-full-text.md) separate from documents. Qualification
> remains in phase 8.

The contract limits analyzed bytes, bytes per term, tokens, and positions per document.
The Serie limits index count and retained generations, delta memory, and transient
build/rebuild space. Queries limit nodes, depth, postings visited, temporary memory,
results, and duration. Index count has no limit imposed by the current format,
but must still have a configured operational maximum (INV-A8).

A format-valid document may exceed the index budget: the write is rejected before
the durable decision, without silently skipping terms.
An over-budget query returns an explicit error. Dictionaries, postings, and positions
may expand the text: costs depend on vocabulary, frequencies, and retained versions
and require the [dedicated campaign](13-benchmark.md#ricerca-full-text).

<a id="capacità-oltre-la-ram"></a>

## Capacity beyond RAM

[ADR-0049](adr/0049-capacita-oltre-la-ram.md) proposes a persistent index with a bounded per-Serie cache. It requires an experiment and format decision before adoption; it is not an available feature.

[ADR-0057](adr/0057-selezione-automatica-indice.md) approves automatic
per-Serie selection: resident when it fits, paged beyond the quota, and return with
hysteresis. The [first selector](implementazione/indice-automatico.md) is separate
from the runtime. The [page codec](implementazione/pagine-indice.md) defines
three sizes, directory, and external keys; cache, backend, and migration remain to be integrated.
