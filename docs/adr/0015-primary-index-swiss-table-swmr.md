<a id="adr-0015--primary-index-tabella-swiss-single-writermulti-reader-seqlock-per-slot-versioni-trattenute"></a>

# ADR-0015 — Primary index: single-writer/multi-reader Swiss Table, per-slot seqlock, retained versions

- **Status:** Accepted (clarifies the interpretation of INV-I1 for the primary index); **partially superseded by [ADR-0032](0032-seqlock-a-64-bit.md)**: 64-bit seqlock with bounded attempts and a 6-word slot layout (56 B per entry). Where this ADR says 8 bits and 48 bytes, ADR-0032 applies. **Also partially superseded by [ADR-0043](0043-primary-index-a-frammenti.md)** (fragment directory in place of the single table and key arena; 4-word slots), by [ADR-0039](0039-cornice-unica-dei-record.md) (hints), and by [ADR-0042](0042-tombstone-e-indice-dei-vivi.md) (reconstruction by maximum CSN, not lineage).
- **Date:** 2026-10-03
- **Relationship to the specification:** closes QA-24 and QA-03; clarifies "Index snapshot" for the
  primary index
- **References:** [architecture](../architettura.md#primary-index),
  [on-disk formats](../formati-su-disco.md#file-hint), INV-I1, INV-V3

<a id="contesto"></a>

## Context

The primary index receives a change for every write, serves O(1) lookups at millions of
operations per second from many readers, must let snapshots find versions that are no longer
current, and is relocated in bulk by compaction while the writer is working (tensions T1 and
T3 in the [critical analysis](../valutazione/analisi-critica.md)).

<a id="decisione"></a>

## Decision

<a id="struttura"></a>

### Structure

Hash table with **open addressing and separate control metadata** (Swiss
Table layout: one control byte per slot with 7 bits of secondary hash, probing in groups of 16
slots), with slots in **parallel specialized arrays** of `(unsigned-byte 64)`: 64-bit hash;
key reference in the key arena; location (segment-id, offset); length and version;
CSN and seqlock counter. No Lisp object per entry. ~48 bytes per entry at a
7/8 load factor.

**Key arena:** append-only byte array per Serie containing keys; the index points into it.
Key verification takes place in memory.

<a id="concorrenza"></a>

### Concurrency

- **One writer** (the Serie's logical writer) mutates the table.
- **Readers without locks**: each slot has an 8-bit **seqlock** counter; the writer
  increments it to odd before changing the slot and to even afterward (with memory barriers); the
  reader reads the counter, the fields, and the counter again, retrying if it is odd or changed.
  Reading a slot is wait-free for the writer and has no contention between readers. Eight bits
  suffice: a false "equal" would require 256 writes to the same slot during a
  ~100 ns read, while the writer does not exceed a few million operations per second in total.
- **Resizing**: the writer builds a new table and publishes it with an atomic
  reference swap; the old table is retired using epoch-based reclamation
  ([ADR-0016](0016-epoch-based-reclamation.md)). This is the specification's "atomic swap," applied
  at the table level.

INV-I1 for the primary index is to be read as follows: *a reader never observes an intermediate state of
an entry or a table*; the mechanism is a per-slot seqlock plus table
swapping.

<a id="versioni-trattenute-mvcc"></a>

### Retained versions (MVCC)

The entry contains only the **current** version. When the writer overwrites a document and
at least one snapshot exists with a CSN lower than the new version's CSN, it records the
previous version in the Serie's **retained-version table** (compact hash map
`chiave → elenco di (csn-da, csn-a, location, versione)`). A reader with snapshot `s` uses the
current entry if `csn(current) ≤ s`; otherwise it searches the retained versions. Entries are
removed when no active snapshot has a CSN lower than `csn-a`. Without active snapshots, the
cost is zero.

<a id="rilocazione-da-compaction"></a>

### Compaction relocation

Compaction does not replace the table: it sends the writer a batch of **conditional
relocations** `(chiave, location-vecchia → location-nuova)`; the writer applies each one only
if the entry (or retained version) still points to the old location (INV-V3). Since the
copy is identical to the original and the original remains readable while `OBSOLETE`, a reader is
correct with either location during the window.

<a id="persistenza"></a>

### Persistence

The index is derived data. Each closed segment has a **hint file** (`<id>.hint`) with
the key, version, CSN, offset, length, and type of each record, written at close or when
produced by compaction. On restart, the index is rebuilt by reading the hints for
`CLOSED` segments in lineage order and scanning the `ACTIVE` segment; segments without hints are
scanned in full.

Patterns: Swiss Table (Abseil); seqlock (Linux kernel); RCU/EBR for replacing
structures; hint files (Bitcask).

<a id="conseguenze"></a>

## Consequences

- Lookups without locks or allocation; write cost is a handful of stores per slot.
- Memory ~48 B/entry + keys: 1 billion documents ≈ 48 GB + arena. Server capacity
  limit to be documented; beyond that, scale with multiple servers (outside v1 scope).
- Restart is proportional to document count (reading hints), not data volume.
- The logical writer is the only place that touches the index, retained versions, and relocations: no
  protocol between multiple writers.

<a id="alternative-considerate"></a>

## Alternatives considered

- *Persistent structure with structural sharing:* O(1) snapshots but objects with pointers,
  slower lookup, GC; contrary to the compactness requirement.
- *On-disk version chain:* I/O for old versions and pointers invalidated by
  relocation.
- *Read/write lock on the table:* contention between readers and writer.

<a id="valutazione"></a>

## Assessment

- Risks: RSK-02 closed at the design level; residual performance risk verified by SPK-01 (lookups/s,
  bytes/entry, concurrent correctness under stress); relocation model in SPK-07.
- Would prompt reconsideration: lookup throughput an order of magnitude below the target
  or consistency errors in the concurrent test.
