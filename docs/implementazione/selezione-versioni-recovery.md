<a id="selezione-delle-versioni-durante-il-recovery"></a>

# Version selection during recovery

The `arcdocdb.recovery.selection` module implements the per-key
comparison from [ADR-0042 §2](../adr/0042-tombstone-e-indice-dei-vivi.md):
maximum CSN, then greater physical offset within the same segment. It retains
the tombstone as provisional winner until the key is complete.
Requirements REQ-REC-001, REQ-IDX-001, REQ-IDX-006, REQ-TXM-007,
REQ-FOR-003, REQ-LIM-003, REQ-AFF-002, REQ-AFF-004, REQ-AFF-008;
invariants INV-D1, INV-C11, and INV-I2.

This is a cold-path reconstruction component, not the complete Recovery
Manager. Key grouping, coverage of all segments,
and index publication remain to be connected. No change
to decisions or persistent formats.

<a id="contratto"></a>

## Contract

```lisp
(crea-selettore-versione-recuperata :key-capacity 65535 :budget-payload 65647)
;; => reusable private worker workspace
(inizializza-chiave-recuperata selector key start end)
;; => NIL, key copied and no winner
(considera-record-recuperato selector buffer start end segment-id file-offset
                            :version 2 :prepared-csn nil)
;; => :selected | :kept | :duplicate | :ambiguous
(leggi-versione-selezionata selector)
;; => :none | :put | :tombstone, csn, segment-id, file-offset, record-bytes, version, flags
```

Code names are exported from package `arcdocdb.recovery.selection`.
One worker owns the selector and reuses it for successive keys. Each
group belongs to one Serie: the caller does not mix different
namespaces with the same key byte sequence. Before
reset it must have completed or explicitly abandoned the previous
key. Reset does not publish data or rehabilitate FAULTED.

The caller supplies only records already recognized as **committed** in
authoritative prefixes from the [ACTIVE](active-recuperato.md) and
[CLOSED](closed-recuperato.md) readers. It preserves segment identity,
file version, and immutable bytes during the operation. `start` is
the index in the buffer; `file-offset` is the absolute file offset, even
when the buffer contains only part of the segment. They are not
interchangeable. IDs remain u64, including zero, without truncation.

The selector rechecks header/body CRC, explicit v1/v2 format,
PUT/TOMBSTONE type, full binary key, and location representability
before changing the winner. It retains no buffers, body,
FDs, or reader objects. It does not independently verify SEAL, manifest,
segment membership, CBOR contract, or Archivio completeness:
a record with a valid CRC alone does not authorize replay.

For an ordinary record it uses the frame stamp and rejects an
additional prepared CSN. For a prepared record it requires explicit `prepared-csn`,
derived from the caller's canonical OUTCOME/EDIT/DECISION resolution.
TXID is not interpreted as CSN. An aborted or unresolved prepared record
must not enter the selector. NIL distinguishes absence of proof from
CSN zero; all u64 bits are preserved.

<a id="ordine-e-tombstone"></a>

## Ordering and tombstones

For consistent authoritative candidates, arrival order does not change the
winner: an older version does not replace a newer one, and for equal CSN
within the same segment the greater offset wins, even when switching
from PUT to TOMBSTONE or vice versa. A tombstone remains represented by
the same provisional tuple as a PUT. It must be translated into absence in the live
index only **after** the complete key scan.

The function can deliver the maximum of the subset considered so far;
completeness is a coordinator precondition before final
use. Reading an initialized key with no candidates
returns `:none` with zero fields, version 2, and zero flags. `:none` is
distinct from an actual winner with CSN zero. Primary index location
and CSN restrictions remain checks for future
materialization; values are not restricted here to make them fit.

<a id="ambiguità-e-guasti"></a>

## Ambiguity and faults

ADR-0042 defines tie-breaking within the same segment.
Equal CSN in different segments returns `:ambiguous`, without inventing
an ordering by segment ID. Conflicting metadata at the same
location also produces this outcome. Equal CRC and metadata identify
only a repeated candidate at the same location; they do not prove
body equality against collisions or mutated files.

The ambiguous state prevents `leggi-versione-selezionata`. It remains
ambiguous even after an older candidate or a later offset with the
same CSN; a strictly greater CSN dominates all those candidates
and allows a new selection. The coordinator must handle the outcome,
not choose a replica without external proof. For inputs that
violate file immutability, behavior is conservative, without
guaranteeing order-independent acceptance.

Codec, key, budget, or prepared-proof rejections
precede winner mutation. Private scratch may be
reused: no result references it. Interruption during
reset or adoption makes the selector FAULTED; an inconsistent private tuple
is rejected before delivery. A codec assertion also makes
the selector FAULTED, retaining the original condition.
Local assertions do not replace
the Serie's COD-24 boundary, still to be integrated into the coordinator.

<a id="memoria-e-lavoro"></a>

## Memory and work

The workspace owns a u8 key array and two tuples of seven u64s:
**key-capacity + 112 bytes of payload**. Budget is checked before
arrays. It excludes array headers, structure, GC, stack, and caller
buffers; it is not RSS. No per-document object is retained and no
new array is explicitly created per candidate or reset.

Each candidate reads the body for CRC and compares at most 65,535
key bytes, hence O(record-bytes + key-bytes), even when it is
superseded. Tuple comparison/copy: at most seven words. This is not a
lookup path: it adds no work to operating GET/PUT, locks between
Serie, I/O, threads, or CSN assignment. Actual allocations, boxing,
GC, throughput, and latency were not measured in this increment.

<a id="decisioni-da-qualificare"></a>

## Decisions to qualify

| ID | Decision | Status |
|---|---|---|
| SVR-D01 | Configuration and payload before arrays | Open |
| SVR-D02 | Reset: state, range, length, and capacity before copy | Open |
| SVR-D03 | Exact key, with full comparison and buffer bounds | Open |
| SVR-D04 | PUT/TOMBSTONE, physical offset, and CRC before candidate | Open |
| SVR-D05 | Ordinary stamp / explicit prepared CSN, zero and high u64 | Open |
| SVR-D06 | Maximum CSN, later offset, and repeated candidate | Open |
| SVR-D07 | Ambiguity across segments or metadata at the same location | Open |
| SVR-D08 | Ambiguity retained at equal CSN, resolved only by greater CSN | Open |
| SVR-D09 | Incomplete reset/adoption and private invariants => FAULTED | Open |
| SVR-D10 | Read: no candidate, PUT, TOMBSTONE, and ambiguity | Open |

The [method and local results](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-22-recovery-selection/README.md)
distinguish static checks and qualification. Dedicated tests, permutation
properties, FI, MC/DC, coverage, independent review, and integration
with index/roots/admission remain open.
