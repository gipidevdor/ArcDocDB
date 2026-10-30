<a id="adr-0043--primary-index-a-frammenti-directory-estendibile-slot-a-quattro-parole-chiavi-locali"></a>

# ADR-0043 — Fragmented primary index: extensible directory, four-word slots, local keys

> **Revision:** [ADR-0048](0048-limiti-documentali-e-formato-v2.md) supersedes the relevant document limits and v2 layout. The text below preserves the historical v1 decision.

- **Status:** Accepted (fragment capacity tunable through SPK-01;
  directory publication and costs clarified by [ADR-0050](0050-pubblicazione-e-costi-della-directory.md))
- **Date:** 2026-10-03
- **Relationship to the specification:** no amendment; implements "Index" (Swiss Table, compact
  structures, no object per entry). **Partially supersedes**
  [ADR-0015](0015-primary-index-swiss-table-swmr.md) (single table, key arena,
  resizing), [ADR-0032](0032-seqlock-a-64-bit.md) item 2 (slot layout),
  [ADR-0016](0016-epoch-based-reclamation.md) (EBR scope), and
  [ADR-0024](0024-memoria-e-gc.md) item 3 (growth by replacing the entire structure).
  These remain: one writer and readers without locks, 64-bit seqlock with bounded attempts and fallback
  to the writer, retained versions, conditional relocation, index as derived data.
- **References:** [design analysis](../analisi-progettuale.md) AP-12, AP-16;
  [architecture](../architettura.md#primary-index); [limits](../limiti.md); INV-I1, INV-I3,
  INV-A8

<a id="contesto"></a>

## Context

A single table that grows by doubling has three defects made explicit by the analysis
(AP-12): copying requires the old and new tables together, **three times** the size of the
old one; the Serie writer stops for the entire copy; space for deleted slots and
keys is never reclaimed because the key arena is append-only. For a large Serie,
the first defect makes doubling impossible within RAM, the second stops
writes for seconds, and the third violates INV-A8.

<a id="decisione"></a>

## Decision

<a id="1-struttura"></a>

### 1. Structure

```
Serie ──▶ directory (vector of 2^G references) ──▶ fragment
                                                      ├─ ctrl   : control bytes (one per slot)
                                                      ├─ slots  : 4 contiguous 64-bit words per slot
                                                      └─ keys   : additional key bytes
```

- **Extendible hashing.** The top `G` bits of the 64-bit hash select the
  directory entry; multiple entries may point to the same fragment (local depth ≤ `G`).
- **Fragment**: Swiss Table with a fixed capacity of `C` slots (default **8.192**: the slot
  array exceeds the collector's large-object threshold, so it is not copied), with one
  control byte per slot and group probing. Maximum load factor 7/8.
- **Slot: 4 contiguous words** in the same array (32 bytes: two slots per cache line).

  | Word | Contents |
  |---|---|
  | 0 | CSN of the current version (it is the version, [ADR-0038](0038-orizzonte-di-visibilita.md)) |
  | 1 | segment-id (32) · offset (32) |
  | 2 | key-off (24) · key-len (8) · record length (24) · flags (8) |
  | 3 | seqlock counter (64) |

  The hash is not in the slot: the control byte's 7 bits filter, key comparison
  decides, and splitting recalculates hashes from keys.
- **Local keys**: each fragment has its own append-only key area, immutable after
  publication of the slot pointing to it; it grows by array replacement.

<a id="2-crescita-e-pulizia-una-divisione-alla-volta-inv-i3"></a>

### 2. Growth and cleanup: one split at a time (INV-I3)

When a fragment reaches its maximum load factor, the writer builds **two**
new fragments, redistributing live entries on the next hash bit, and publishes their references
in the directory. If local depth is already `G`, it first doubles the directory (copying
references). A split copies only live entries: deleted slots and keys no longer
referenced **do not survive**. A fragment with many deleted slots or a key area
full of dead keys, or whose highest seqlock counter approaches the threshold in
[ADR-0032](0032-seqlock-a-64-bit.md), is **rebuilt** in the same way without splitting:
counter fail-stop becomes a rebuild.

Maximum cost of any index maintenance: copying `C` slots. Transient
memory: two fragments. Directory maximum depth is declared; beyond it, explicit rejection
(INV-A8).

<a id="3-concorrenza"></a>

### 3. Concurrency

- **Reader**: reads the directory reference, then the fragment reference, then probes groups; each
  slot is read with ADR-0032's seqlock protocol (read counter, fields,
  counter again). A reader that already obtained a reference to a fragment subsequently
  replaced reads a **frozen, consistent** state: the writer no longer modifies a
  fragment after replacing it. The read is linearizable at the instant the
  reference was read.
- **Control bytes**: transition from empty to occupied, occupied to deleted, deleted to
  occupied; **never back to empty** within a fragment's lifetime. A probe therefore never
  stops before a slot that existed when it began.
- **Writer**: writes the key into the key area; then the slot (odd counter, fields,
  even counter); then the control byte. On deletion: slot marked free (flag)
  under seqlock, then control byte.
- **Key area**: the reader reads its reference **after** reading the slot; since the
  writer publishes a larger area before writing the slot pointing to it, the area read
  always contains the key.

<a id="4-una-struttura-tre-usi"></a>

### 4. One structure, three uses

The same fragmented table, with parameterized slot width, implements:

| Use | Slot | Read by |
|---|---|---|
| primary index | 4 words | all readers |
| retained versions (multiple entries per key; additionally: validity-end CSN) | 5 words | snapshot readers |
| pending versions: unpublished batches and intents ([ADR-0037](0037-lotto-sigillato.md), [ADR-0041](0041-multiserie-segmenti-autosufficienti.md)) | 4 words | writer only |

A single C1 concurrent structure to model, test, and mutation-test.

<a id="5-chi-ritira-che-cosa"></a>

### 5. Who retires what

Replaced directories and fragments are heap objects: they remain live while a reader
references them, then the **garbage collector** reclaims them. ADR-0016's epoch-based reclamation
governs only **external resources**: descriptors and removed-segment files.

Patterns: Swiss Table (Abseil) within an extendible-hashing directory with one-table-at-a-time
splitting (Go maps from version 1.24; Fagin et al. 1979); seqlock (Linux
kernel).

<a id="conseguenze"></a>

## Consequences

- No writer pause proportional to Serie size; no memory spike.
- Memory: 33 bytes per slot. At maximum occupancy, ~38 bytes per document plus the key;
  immediately after a split, twice that. The expected average is around **75–80 bytes per
  document** with 16-byte `_id`: this is an **estimate**, to be measured (SPK-01). The "56 bytes" figure
  in earlier documents applied only at the instant before doubling.
- One extra reference hop per lookup (directory → fragment), through small, hot
  structures.
- Fragments are writer allocations: rare, large, outside the reader path. The
  allocation rate due to splits is included in SPK-02 measurements.

<a id="alternative-considerate"></a>

## Alternatives considered

- *Single table with doubling (ADR-0015):* memory spike and writer pause.
- *Incremental doubling with two live tables:* each lookup may need to inspect two tables;
  a single huge allocation remains.
- *8-word slots with inline key:* one cache line per lookup with generated `_id`,
  but two key representations to verify.
- *EBR for fragments too:* a second mechanism for what the collector already does.

<a id="valutazione"></a>

## Assessment

- Risks: RSK-02, RSK-07.
- Verification: SPK-01 (lookups and inserts per second, measured bytes per document, split
  duration, correctness under stress with continuous splitting); seqlock and
  split model in SPK-07; differential test against a reference table.
- Reconsider if: split duration or the extra-hop cost brings lookup below
  the minimums in [ADR-0028](0028-target-e-obiettivi-di-latenza.md).
