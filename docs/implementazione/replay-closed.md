<a id="visita-dei-record-closed-recuperati"></a>

# Visiting recovered CLOSED records

> **Decided (ADR-0042, ADR-0047, ADR-0036)** — reconstruction considers
> committed records from all segments, retains tombstones until final
> selection, and resolves prepared records without using TXID as CSN.

`arcdocdb.recovery.replay` connects the [CLOSED reader](closed-recuperato.md)
to private bootstrap consumers. Requirements REQ-REC-001, REQ-STO-006,
REQ-TXM-007, REQ-IDX-006, REQ-AFF-002, and REQ-AFF-008; invariants INV-D1,
INV-C11, INV-I2, and INV-A9. No persistent format or ADR changed.

<a id="contratto"></a>

## Contract

```lisp
(arcdocdb.recovery.replay:visita-record-closed-recuperato
 recovered scratch limits visitor)
;; => delivered-records, aborted-records
```

`recovered` is canonical proof of a writer or compaction CLOSED.
`limits` is the read-only `limiti-recovery-serie` configuration already
used by the coordinator. Scratch must hold the entire P prefix.
The task belongs to the Serie I/O pool: it keeps CONTROL, FDs, files,
and namespace frozen, with admission still closed. Visitor destinations
are private bootstrap candidates.

The function rereads **the same read-only FD**, up to the manifest's
authoritative P; it does not use EOF as the frontier, read the tail, or
reopen files. The canonical reader checks alias, backend, capability,
budget, header, CRC, batches/SEAL, and OUTCOME/EDIT resolution before any
callback. The new proof must match the received proof in authority,
geometry, counts, presence, and maximum CSN. Comparison does not prove
body equality: source immutability remains a precondition.

The reader with workspace is a shared **internal** entry point: it gives
the visitor the same semantic workspace just verified, without rebuilding
a second table. The public `leggi-closed-recuperato` API continues to
deliver only one result, without workspace or buffer.

<a id="callback-e-prepared"></a>

## Callback and prepared records

```lisp
(visitor buffer start end segment-id file-offset version prepared-csn)
;; => NIL
```

Only committed PUT and TOMBSTONE records are delivered, in physical order
within the segment. OUTCOME and SEAL do not enter the visitor. Bytes are
borrowed, read-only, and valid during the synchronous call: no modification,
reuse, scratch reentry, or retention of document references. A consumer
that needs to retain data explicitly copies only the part specified by
its own contract.

| Record | Delivery | `prepared-csn` |
|---|---|---|
| Ordinary PUT/TOMBSTONE in a verified prefix | Yes | NIL; CSN in stamp |
| Prepared with local OUTCOME | Yes | OUTCOME CSN |
| Prepared without OUTCOME, with EDIT outcome | Yes | EDIT CSN |
| Prepared without either proof | No, counted as aborted | No callback |
| OUTCOME or SEAL | No | No callback |

Contradictions between OUTCOME and EDIT are rejected by the reader **before**
the visit. CLOSED does not consult `multiserie.log`; an outcome from
DECISION must already be retained in canonical EDIT. CSN zero is present
and passed as integer zero, distinct from NIL. Segment ID, TXID, and CSN
retain all u64 bits, without introducing the u32 constraints of the
primary/GET recipient.

The complete span and version can feed
`considera-record-recuperato` of the [selector](selezione-versioni-recovery.md),
with explicit `prepared-csn` only for prepared records. The visit does not
group keys: the consumer must collect all candidates for the same key
from **all** segments before [index materialization](indice-da-recovery.md).
A complete replay obtained by rescanning every segment for every key is
not intended.

`file-offset` is absolute in the file. Here it equals `start` because the
buffer contains the prefix starting at the header; the two arguments remain
distinct in the consumer contract.

<a id="risultato-errori-e-durata"></a>

## Result, errors, and lifetime

The two counters concern **records**, not TXIDs: a prepared transaction
with multiple aborted modifications increments the second counter for each
modification. Reader counts retain their original meaning. The loop has
exactly BATCHES + RECORDS steps and must end exactly at P, with frame and
batch counts identical to those verified.

The visitor must check the outcomes of its own work and return NIL.
Another value produces INVALID-ARGUMENT after any effects it has made.
Conditions and nonlocal exits propagate without retry, rollback, or
implicit close. An error after some callbacks leaves an incomplete private
candidate: the coordinator must discard or invalidate it and keep admission
closed. The Serie FAULTED boundary remains to be connected; this API does
not introduce a new controller.

Before the first callback, any reader error leaves the consumer intact.
This applies to the individual segment, not the entire Archivio.
After the last callback, open capabilities and consumption are checked again.
A successful result does not publish indexes, GET roots, or commit visibility,
and does not transfer FD ownership.

<a id="lavoro-e-memoria"></a>

## Work and memory

One sequential rereading of the prefix, complete canonical checks, and
an additional traversal of headers only for delivery. Bodies are not
copied by the visitor; the consumer can recheck them. The proof workspace
remains bounded by the reader's prepared/outcome budgets and is released
after the visit. Delivery explicitly creates no new table or Lisp entry
per record.

P-byte scratch, reader objects, and its tables are cold-path allocations,
not an RSS estimate. Visitor work, EDIT lookup, boxing, GC, and latency
are not measured here. No work added to the ordinary GET/PUT path and no
new shared write or wait between Serie. ACTIVE, key grouping, and the
overall gate remain separate increments.

<a id="decisioni-e-qualifica-aperta"></a>

## Decisions and open qualification

| ID | Decision to qualify | Status |
|---|---|---|
| RCR-D01 | Internal reader with workspace; public API with only one value | Open |
| RCR-D02 | Budget/alias/frontier and complete checks before visitor | Open |
| RCR-D03 | Same authority, geometry, counts, and maximum CSN | Open |
| RCR-D04 | Ordinary, local OUTCOME, EDIT, or aborted prepared | Open |
| RCR-D05 | Present CSN zero, high u64 values, and absence distinct from zero | Open |
| RCR-D06 | PUT/TOMBSTONE only; OUTCOME/SEAL exclusion | Open |
| RCR-D07 | Synchronous visitor, mandatory NIL, and exit propagation | Open |
| RCR-D08 | Bounded loop, per-record counts, and exact consumption to P | Open |
| RCR-D09 | Ordinary compaction, empty, and NIL workspace | Open |
| RCR-D10 | Sources open until delivery; no partial publication | Open |

[Preregistered method and local results](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-22-closed-replay/README.md).
Dedicated functional tests, public reader compatibility, FI, MC/DC,
coverage, independent review, performance measurements, and C1 qualification
remain open. Static checks do not close these items.
