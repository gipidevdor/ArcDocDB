<a id="massimo-csn-osservato-nel-recovery"></a>

# Maximum CSN observed during recovery

Recovery collects verified CSNs before initializing the Archivio registry,
as specified by [ADR-0020](../adr/0020-csn-snapshot-isolamento.md)
and the [architecture](../architettura.md#recovery). This increment provides
queries on read-only results and aggregation of a complete Serie.
It does not build the registry or open traffic.

The [Archivio plan](csn-archivio-recovery.md) now aggregates these queries
against the canonical list supplied by the controller, including Registri,
and checks that every ACTIVE used the same decision replay.
Persistent catalog and admission remain to be connected.

<a id="contratto-pubblico"></a>

## Public contract

Each query returns **two values: presence, u64 maximum**.
`NIL, 0` means no source; `T, 0` means CSN zero actually observed.
No sum or conversion to u32 truncates the maximum.

| Namespace | API | Source |
|---|---|---|
| `arcdocdb.recovery.active` | `massimo-csn-active-recuperato(result)` | Fully verified and resolved old ACTIVE |
| `arcdocdb.recovery.closed` | `massimo-csn-closed-recuperato(result)` | CLOSED verified up to CONTROL P and its EDIT outcomes |
| `arcdocdb.recovery.closed` | `massimo-csn-serie-recuperata(active, closed :max-segmenti 65536)` | ACTIVE and all CLOSED of the same CONTROL |
| `arcdocdb.recovery.archive` | `massimo-csn-decisioni-recuperate(result)` | All DECISION records in the verified prefix of `multiserie.log` |
| `arcdocdb.recovery.decisions` | `massimo-csn-decisioni(table)` | Scalar query of the canonical table, lacking Archivio identity on its own |

Reader results retain two additional read-only scalars. They do not retain
scratch, new tables, or callbacks. ACTIVE also retains a private replay
marker, which does not retain the table. Public signatures and previous
reader values remain the same; the private representation of ACTIVE/CLOSED
results changes, requiring a system reload.

<a id="che-cosa-contribuisce"></a>

## What contributes

| Already verified source | Included value |
|---|---|
| Ordinary PUT/TOMBSTONE | `stamp`, which is the CSN |
| Prepared PUT/TOMBSTONE | No contribution from its `stamp`: it is a TXID |
| SEAL of a writer segment | Batch CSN, even if it contains only prepared records |
| OUTCOME in the segment | Payload CSN, even without local prepared records |
| DECISION resolving an ACTIVE prepared record without OUTCOME | Decision CSN |
| CLOSED EDIT outcomes | All CSNs, even without prepared records reachable in the prefix |
| Compacted segment | Stamps of ordinary PUT/TOMBSTONE records only, plus any retained EDIT outcomes |
| Complete DECISION table | All CSNs, even without prepared records in the open Serie |
| Header, TXID, segment ID, frontiers, CONTROL/multiserie SEAL | No contribution |
| Bytes beyond P, invalid ACTIVE tail, decision log tail | No contribution |

The result is an **observed maximum**, not the visibility horizon H
or a list of transactions to acknowledge. Retaining the maximum of valid
proof without a local document avoids lowering the base when some data
has been deleted. An outcome does not create a document; a SEAL does not
commit a prepared record without proof. Conflicts between proofs and
participants remain canonical reader errors and prevent the result.

<a id="autorità-e-insieme-completo"></a>

## Authority and complete set

Serie aggregation uses `verifica-closed-completi` before consuming maxima:
exact cardinality, same CONTROL token by `EQ` identity, unique u64 IDs,
CLOSED membership, and exact P. It also checks that ACTIVE, CONTROL,
and CLOSED keep their read-only capabilities open.
The `max-segmenti` budget precedes the private duplicate table.

The controller freezes sources, vector, and namespace throughout the operation.
The result does not certify physical reconciliation, names, inodes, catalog,
future FD health, or a complete Archivio inventory. Scalar queries on
individual tokens describe the already completed reading; they do not reread
files. The decision log query checks that its FD remains open.

The Archivio coordinator must still:

1. know all canonical Serie, including Registri;
2. recover them and verify decisions and pending obligations;
3. aggregate maxima of the Serie **and the complete decision log**;
4. build the single CSN registry and the snapshot registry that uses it;
5. complete publications and obligations before admission.

[Registry creation](csn.md) receives the **last CSN**, not the next one.
With base `M`, the first assignment produces `M+1`; passing `M+1` to
creation would skip a value. If `M = 2^64-1`, the existing registry
rejects every new assignment with `:csn-exhausted`: no wrap or reset.
A subset of Serie does not authorize an Archivio base.

<a id="costi-e-limiti"></a>

## Costs and limits

- Writer ACTIVE/CLOSED: scalar updates during the existing semantic
  traversal; no new pass or I/O.
- Compacted CLOSED: one additional pass over `COUNT` headers in the
  already verified scratch; does not recalculate body CRCs or reread the file.
- EDIT: one pass over its outcomes, already bounded by the reader budget.
- DECISION: one pass over the unique entries of the owned table.
- Serie: one pass over CLOSED beyond the complete gate. The gate allocates
  the private ID table as already documented; this is not an RSS cap.

No additional per-record container. Boxing of u64 integers, Lisp objects,
and GC remain to be measured. There are no changes to request or commit
paths, or throughput/latency measurements in this increment.

<a id="decisioni-e-qualifica"></a>

## Decisions and qualification

Requirements: REQ-REC-001, REQ-MVC-005/006, REQ-TXM-005/007, REQ-STO-006,
REQ-CMP-009, REQ-AFF-008. Invariants involved: INV-A2, INV-M5, and INV-P6;
the maximum neither replaces commit proofs nor produces writes between Serie.

| Case | Decision/dedicated verification obligation |
|---|---|
| CSR-D01 | Ordinary/prepared: same stamp bits, only the ordinary record contributes as stamp |
| CSR-D02 | Presence distinct from value: empty, CSN zero, high bits, and maximum u64 |
| CSR-D03 | Writer SEAL and OUTCOME: included even without ordinary data or local prepared records |
| CSR-D04 | Consistent DECISION/OUTCOME/EDIT; conflict rejected before the result |
| CSR-D05 | EDIT present/absent, even without prepared records and for empty compaction |
| CSR-D06 | Compaction: `(PUT OR TOMBSTONE) AND NOT PREPARED`; each condition, progress, and count |
| CSR-D07 | Entire prefix and excluded tail, v1/v2, writer/compaction origin |
| CSR-D08 | Complete Serie: count, duplicates, different CONTROL, different P, closed FD, budget |
| CSR-D09 | DECISION without local prepared records, identical duplicates, TXID order different from CSN order |
| CSR-D10 | Single registry, base M, first assignment M+1, exhaustion without wrap |

The [initial evidence](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-recovery-csn/README.md)
separated compilation, static checks, and author readings from functional
tests. The dedicated [CLOSED/Serie](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-16-closed-verifica/report.md)
and [Archivio plan](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-16-archivio-csn-verifica/report.md)
campaigns retain functional tests, FI, native tests, review, and raw coverage,
with their respective boundaries. MC/DC/C1, allocations/performance, and
controller/single registry integration remain open; CI does not close these obligations.
