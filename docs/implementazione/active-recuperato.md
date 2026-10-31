<a id="recovery-readonly-del-vecchio-active"></a>

# Read-only recovery of the old ACTIVE

The result also retains a private marker identifying the DECISION replay used,
without retaining the table. The [Archivio CSN plan](csn-archivio-recovery.md)
compares this provenance before aggregating Serie.

The module in [`src/recovery-active/`](../../src/recovery-active/) connects
the [recovered control log](control-recuperato.md) to closure of the old ACTIVE,
under [ADR-0037](../adr/0037-lotto-sigillato.md#4-il-recovery-non-tronca-inv-a9),
[ADR-0040](../adr/0040-manifest-a-record-unico.md#3-riconciliazione-al-riavvio), and
[ADR-0041](../adr/0041-multiserie-segmenti-autosufficienti.md#4-recovery).
The valid length and outcomes to record now derive from the file that was read
and the Archivio decision table.

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

An absent query outcome does not mean abort: the segment may already contain OUTCOME.
Present zero CSNs and all u64 ID/TXID/CSN bits are
significant. No buffer, array, hash table, or numeric FD is exported.

<a id="autorità-e-ownership"></a>

## Authority and ownership

The task runs in the I/O pool during exclusive Serie recovery.
`control` is the result of reading the catalog's control log; its
manifest supplies the ACTIVE ID. A header read through the same read-only
capability checks the Serie, ID, CRC, reserved fields, and version. The origin must be
writer; this is checked before reading the body.

The caller attests `size` as the **complete stable physical EOF**, keeps the
control log and segment open, and freezes the file/FD/namespace until publication.
Read-only does not prevent external mutation. Physical size and inventory
reconciliation remain controller responsibilities.

`decisions` must be the complete authoritative table from
`Registri/multiserie.log` **in the same Archivio**, with its header already verified.
The existing table type does not retain Archivio identity:
binding and completeness remain explicit preconditions. A partial table,
one from another Archivio, or one built only to represent “no
decision” does not authorize presumed abort. No fallback from `nil`.

The new entry point [`leggi-active-con-decisioni`](decisioni-recuperate.md)
receives the complete result from the read-only decision-log reader and
checks that it has the same canonical Archivio scope before ACTIVE I/O.
The bare-table precondition remains for the previous API.

The result retains the recovered control log, segment capability, and
scalars; derived outcomes occupy two private u64 arrays. It retains no
scratch, workspace, or Archivio table. The controller keeps the old
segment FD until EBR-authorized reclamation; there is no implicit close.

<a id="ordine-della-lettura"></a>

## Read order

1. No-I/O preflight: capabilities, scratch aliases, complete ranges and budgets.
2. Verify that the old segment and control log are physically distinct
   files in the same backend through the existing I/O primitive.
3. Create a GET capability from the header read from the same FD; reject
   compaction origin. Read the header once.
4. Read the body through EOF in chunks without rereading the header.
5. Use the existing scanner on the **entire file**. CRCs, SEAL, file-id,
   frontiers, and witness search precede all semantics.
6. Traverse only the verified prefix: recheck headers;
   bodies are already covered by the first CRC pass, and the buffer is still exclusive.
7. Resolve prepared TXIDs, check counts, sort and copy
   outcomes to retain; deliver only a complete result.

The tail stays in the file and is ignored beyond P; it is not truncated. A SEAL
witness of durable corruption, exhausted budget, or semantic
contradiction propagates typed conditions to the controller for fail-stop.
No partial result or tail record is published.

<a id="risoluzione-dei-prepared"></a>

## Prepared resolution

| OUTCOME in prefix | Authoritative DECISION | Resolution |
|---|---|---|
| present | absent | locally committed; decision may already be forgotten |
| present | present, same Serie and CSN | locally committed, no duplicate EDIT outcome |
| absent | present, Serie participating | committed; TXID/CSN pair to record in closing |
| absent | absent | presumed abort, no outcome written |
| any | present but inconsistent participant/CSN | corruption, no publication |

Prepared operations with the same TXID must belong to one batch
([ADR-0041](../adr/0041-multiserie-segmenti-autosufficienti.md#1-protocollo)).
Prepared records following OUTCOME for the same TXID are rejected, as in the
[CLOSED resolver](get-resolver.md). Duplicate OUTCOMEs with same CSN
coalesce; a different CSN is corruption. OUTCOMEs without prepared records in
this segment create no effects or closing outcomes on their own.

The check visits distinct TXIDs: each is classified once.
`prepared = locali + derivati + abort` is checked before returning the result.
The document format remains opaque; the API neither verifies schema/CBOR
nor rebuilds the primary index.

<a id="chiusura-e-pubblicazione"></a>

## Closing and publication

A CLOSED entry occupies exactly `20 + 16 × E` bytes: u64 ID, u64 P, u32 count,
then TXID/CSN pairs ordered by TXID. Sizes and offsets derive
from existing codec constants. The checkpoint writer preserves other
CLOSED and REMOVED entries and builds a complete EDIT with this entry.

The serializer checks aliases, shape, and the entire range before the first
in-memory write. Packing rejects an entry beyond the metadata-codec
limit before array allocation; the whole-EDIT budget
is still checked by the checkpoint preparer.

`pubblica-control-da-active` requires old ID CLOSED in new manifest,
**length exactly P and all and only derived outcomes**.
It checks that the old FD is still open before any claim.
It then delegates to the conservative control-log transition: same view,
preservation of other segments/outcomes, new ID, single publisher.
The atomic point remains the control-log rename; acknowledgment follows
directory fsync, with the same terminal states and original conditions.

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

These are configurable task budgets, not new persistent database
limits. The segment-format maximum remains. The capability must
allow `max(64, min(size-64, chunk))` bytes per transfer.
Zero prepared/outcome limits allow opening files without them;
they do not delete or ignore over-budget records.

Read cost: two identity observations, header, and
`ceiling((size-64)/chunk)` exact transfers. Scanner and traversal
are bounded by bytes/batches/frames; the second pass does not recalculate
document CRCs. DECISION queries use existing binary searches.
Packing sorts private TXIDs; result outcomes occupy `16 × E`
payload bytes excluding Lisp objects. Transient hash tables
are bounded by configured counts and provide average O(1) lookup.

This opening path includes allocations, u64 boxing, and sorting: no
zero-heap, latency, or throughput promise. No locks, CSN increments,
or shared writes between Serie are introduced.

<a id="decisioni-da-qualificare"></a>

## Decisions to qualify

The [functional-test method](active-recovery-metodo.md) records
integrated read-only verification, outcomes, and publisher connection.
Execution outcomes and limits remain distinct from the complete C1 matrix.
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
concern compilation and static checks. The later
[functional campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-active-recovery-verification/README.md)
adds 27 tests with v1/v2 variants on real FDs: resolution, errors,
queries and serializer, closing to publisher, and control-log reopening.
The local result belongs to the frozen commit declared in the campaign;
C1 qualification, complete decision matrix, and measurements remain open.
The [Archivio-bound decision-log reader](decisioni-recuperate.md)
is now available; dedicated qualification is still open. Physical name
reconciliation, indexes/CSN horizon, and the Recovery Manager admission gate
remain to be integrated.
The result alone does not authorize forgetting global decisions or
reopening Serie traffic.

The [complete checkpoint builder](checkpoint-recovery.md) now derives
state from the ACTIVE result and retained CONTROL; dedicated
qualification is still open. It preserves the single publisher described above.

The [CLOSED reader and set check](closed-recuperato.md) now verify
named prefixes and offer `pubblica-control-con-closed` before
the canonical publisher. Dedicated qualification of the new entry points remains open.
