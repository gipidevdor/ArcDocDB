<a id="recovery-readonly-del-vecchio-active"></a>

# Read-only recovery of the old ACTIVE

Result also retains private marker of DECISION replay used,
without retaining table. The [Archivio CSN plan](csn-archivio-recovery.md)
compares this provenance before aggregating Serie.

Module [`src/recovery-active/`](../../src/recovery-active/) connects
[recovered control log](control-recuperato.md) to old ACTIVE
closing, under [ADR-0037](../adr/0037-lotto-sigillato.md#4-il-recovery-non-tronca-inv-a9),
[ADR-0040](../adr/0040-manifest-a-record-unico.md#3-riconciliazione-al-riavvio), and
[ADR-0041](../adr/0041-multiserie-segmenti-autosufficienti.md#4-recovery).
Valid length and outcomes to record now derive from read file
and Archivio decision table.

## API

| API | Result |
|---|---|
| `leggi-active-recuperato(control, input, size, decisions, scratch, …)` | old read-only ACTIVE, verified prefix, resolved prepared records |
| `frontiere-active-recuperato(result)` | attested EOF, absolute P, `:complete`/`:tail`, format 1/2 |
| `statistiche-active-recuperato(result)` | batches, records excluding SEAL, distinct prepared TXIDs, local commits, derived commits, aborts |
| `segmento-active-recuperato(result)` | opaque old-segment capability, without ownership transfer |
| `esito-chiusura-active(result, txid)` | presence and CSN **from DECISION to insert in EDIT**, `nil/0` if absent |
| `lunghezza-chiusura-active(result)` | exact CLOSED-entry bytes, excluding other EDIT fields |
| `scrivi-chiusura-active(result, output, start)` | deterministic CLOSED entry with ID, P, and sorted derived outcomes |
| `pubblica-control-da-active(prepared, result)` | verifies scan-derived closing and delegates to canonical publisher |

Absent query outcome does not mean abort: segment may already contain OUTCOME.
Present zero CSNs and all u64 ID/TXID/CSN bits are
significant. No buffer, array, hash table, or numeric FD exported.

<a id="autorità-e-ownership"></a>

## Authority and ownership

Task runs in I/O pool during exclusive Serie recovery.
`control` is catalog control-log reading result; that
manifest supplies ACTIVE ID. Header read through same read-only
capability checks Serie, ID, CRC, reserved fields, and version. Origin must be
writer, checked before body reading.

Caller attests `size` as **complete stable physical EOF**, keeps
control log and segment open, and freezes file/FD/namespace until publication.
Read-only does not prevent external mutation. Physical size and inventory
reconciliation remain controller responsibilities.

`decisions` must be complete authoritative table of
`Registri/multiserie.log` **from same Archivio**, header already verified.
Existing table type does not retain Archivio identity:
binding and completeness remain explicit preconditions. A partial table,
one from another Archivio, or one built only to represent “no
decision” does not authorize presumed abort. No fallback from `nil`.

New entry [`leggi-active-con-decisioni`](decisioni-recuperate.md)
receives complete read-only decision-log reader result and
checks same canonical Archivio scope before ACTIVE I/O.
Bare-table precondition remains for previous API.

Result retains recovered control log, segment capability, and
scalars; derived outcomes occupy two private u64 arrays. Retains no
scratch, workspace, or Archivio table. Controller keeps old
segment FD until EBR-authorized reclamation; no implicit close.

<a id="ordine-della-lettura"></a>

## Read order

1. No-I/O preflight: capabilities, scratch aliases, complete ranges and budgets.
2. Verify old segment and control log physically distinct
   files in same backend through existing I/O primitive.
3. Create GET capability from header read from same FD; reject
   compaction origin. Header read once.
4. Read body through EOF by chunks without rereading header.
5. Use existing scanner on **entire file**. CRCs, SEAL, file-id,
   frontiers, and witness search precede all semantics.
6. Traverse only verified prefix: headers rechecked,
   bodies already covered by first CRC pass, buffer still exclusive.
7. Resolve prepared TXIDs, check counts, sort and copy
   outcomes to retain; deliver only complete result.

Tail stays in file and is ignored beyond P; not truncated. A SEAL
witness of durable corruption, exhausted budget, or semantic
contradiction propagates typed conditions to controller for fail-stop.
No partial result or tail record published.

<a id="risoluzione-dei-prepared"></a>

## Prepared resolution

| OUTCOME in prefix | Authoritative DECISION | Resolution |
|---|---|---|
| present | absent | locally committed; decision may already be forgotten |
| present | present, same Serie and CSN | locally committed, no duplicate EDIT outcome |
| absent | present, Serie participating | committed; TXID/CSN pair to record in closing |
| absent | absent | presumed abort, no outcome written |
| any | present but inconsistent participant/CSN | corruption, no publication |

Prepared operations of same TXID must belong to one batch
([ADR-0041](../adr/0041-multiserie-segmenti-autosufficienti.md#1-protocollo)).
Prepared record following OUTCOME for same TXID rejected, as in
[CLOSED resolver](get-resolver.md). Duplicate OUTCOMEs with same CSN
coalesce; different CSN is corruption. OUTCOMEs without prepared records in
this segment create no effects or closing outcomes on their own.

Check visits distinct TXIDs: each classified once.
`prepared = locali + derivati + abort` checked before result.
Document format remains opaque; API neither verifies schema/CBOR
nor rebuilds primary index.

<a id="chiusura-e-pubblicazione"></a>

## Closing and publication

CLOSED entry exactly `20 + 16 × E` bytes: u64 ID, u64 P, u32 count,
then TXID/CSN pairs ordered by TXID. Sizes and offsets derive
from existing codec constants. Checkpoint writer preserves other
CLOSED and REMOVED entries and builds complete EDIT with this entry.

Serializer checks aliases, shape, and entire range before first
in-memory write. Packing rejects entry beyond metadata-codec
limit before array allocation; whole-EDIT budget
still checked by checkpoint preparer.

`pubblica-control-da-active` requires old ID CLOSED in new manifest,
**length exactly P and all and only derived outcomes**.
Checks old FD still open before any claim.
Then delegates to conservative control-log transition: same view,
preservation of other segments/outcomes, new ID, single publisher.
Atomic point remains control-log rename; acknowledgment follows
directory fsync, with same terminal states and original conditions.

<a id="budget-e-costi"></a>

## Budgets and costs

| Opening budget | Default |
|---|---:|
| whole file/scratch | 256 MiB |
| body chunk | 64 KiB |
| batches / records per batch | 65,536 / 65,536 |
| bytes per batch | 64 MiB |
| total records, excluding SEAL | 1,048,576 |
| distinct prepared TXIDs | 65,536 |
| physical OUTCOMEs, including duplicates | 65,536 |

Configurable task budgets, not new persistent database
limits. Segment-format maximum remains. Capability must
allow `max(64, min(size-64, chunk))` bytes per transfer.
Zero prepared/outcome limits allow opening files without them;
they do not delete or ignore over-budget records.

Read cost: two identity observations, header, and
`ceiling((size-64)/chunk)` exact transfers. Scanner and traversal
bounded by bytes/batches/frames; second pass does not recalculate
 document CRCs. DECISION queries use existing binary searches.
Packing sorts private TXIDs; result outcomes occupy `16 × E`
payload bytes excluding Lisp objects. Transient hash tables
bounded by configured counts, average O(1) lookup.

Opening path with allocations, u64 boxing, and sorting: no
zero-heap, latency, or throughput promise. No locks, CSN increments,
or shared writes between Serie introduced.

<a id="decisioni-da-qualificare"></a>

## Decisions to qualify

The [functional-test method](active-recovery-metodo.md) records
integrated read-only verification, outcomes, and publisher connection.
Execution outcomes/limits remain distinct from complete C1 matrix.
The [parallel verification campaign](active-recuperato-verifica.md) preserves
59 further tests and its own readings, fault injection, and measurements. Both suites
use distinct packages and records and both run through ASDF.

| ID | Decision | Cases |
|---|---|---|
| ARV-D01 | positive chunk and byte budget at least header | each false, both true; size 63/64; byte thresholds |
| ARV-D02 | caller-budget or format overrun | each true, both false; different backend/physical alias |
| ARV-D03 | header progress, end within prefix, coherent value range | each false, all true; v1/v2 |
| ARV-D04 | TXID already present and different batch | first, repeated in same/another batch; prepared after OUTCOME |
| ARV-D05 | OUTCOME already present and different CSN | absent, identical duplicate, different, zero/high u64 |
| ARV-D06 | exact prefix/batch/record consumption | each count different; header only; tail and durable corruption |
| ARV-D07 | DECISION with at least two participants and Serie present | each false, both true |
| ARV-D08 | OUTCOME present and CSN differs from DECISION | every resolution-table branch |
| ARV-D09 | initial local/abort/derived counters zero | each different; final class counts |
| ARV-D10 | packing: increasing order and CSN presence/type | unordered input, zero, high bits, entry beyond codec |
| ARV-D11 | prefix within range and coherent COMPLETE/TAIL state | boundaries and each inconsistent branch |
| ARV-D12 | serializer: equal lengths and u32 count | each false; alias, exact/insufficient range |
| ARV-D13 | checkpoint CLOSED with exact P/count | false state, P, count separately; omitted/added/changed outcome |
| ARV-D14 | outcome present and identical CSN | absent, different, present zero; FD closed before claim |

[Initial local tests](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-active-recovery/README.md)
concern compilation and static checks. Later
[functional campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-active-recovery-verification/README.md)
adds 27 tests with v1/v2 variants on real FDs: resolution, errors,
queries and serializer, closing to publisher, and control-log reopening.
Local result belongs to frozen commit declared in campaign;
C1 qualification, complete decision matrix, and measurements remain open.
The [Archivio-bound decision-log reader](decisioni-recuperate.md)
now available, dedicated qualification still open. Physical name
reconciliation, indexes/CSN horizon, and Recovery Manager admission gate
remain to integrate.
Result alone does not authorize forgetting global decisions or
reopening Serie traffic.

[Complete checkpoint builder](checkpoint-recovery.md) now derives
state from ACTIVE result and retained CONTROL, dedicated
qualification still open; preserves single publisher described above.

[CLOSED reader and set check](closed-recuperato.md) now verify
named prefixes and offer `pubblica-control-con-closed` before
canonical publisher. Dedicated qualification of new entries remains open.
