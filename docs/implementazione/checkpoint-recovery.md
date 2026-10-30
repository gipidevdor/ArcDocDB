<a id="checkpoint-completo-dal-recovery-active"></a>

# Complete checkpoint from ACTIVE recovery

`arcdocdb.recovery.checkpoint:crea-checkpoint-da-active(recovered, active, stamp, …)`
connects [recovered ACTIVE](active-recuperato.md) and
[new prepared ACTIVE](inizializzazione-active.md) to the
[CONTROL plan](checkpoint-control.md). It applies
[ADR-0040§3](../adr/0040-manifest-a-record-unico.md#3-riconciliazione-al-riavvio)
and [ADR-0041§4](../adr/0041-multiserie-segmenti-autosufficienti.md#4-recovery)
without changing formats or architectural decisions.

<a id="contratto-e-composizione"></a>

## Contract and composition

Returns an existing `checkpoint-control`: consult its queries,
prepare it with `prepara-checkpoint-control`, and publish it with
`pubblica-control-da-active(prepared, recovered)`. Complete EDIT payload
is derived from sources, without manual caller reconstruction.
No I/O, ID reservation, new CSN, or second publication token.
The u64 stamp is the ordinal supplied by the controller.

Recovery is exclusive. The controller keeps CONTROL, old ACTIVE,
new ACTIVE, and authoritative namespace frozen and open until
publication. The new ACTIVE must belong to the **exact same view**
as CONTROL and remain at only the durable header. Checks repeat on return.
Decision authority remains in the contract of the ACTIVE reader used;
the [Archivio-bound reader](decisioni-recuperate.md) is available.

The new ID comes from its verified header: it must be at least the
previous high-water and `next-id = id + 1` must be u64. No wrap,
reuse, or new on-disk sentinel. The controller reserves and prepares the ID.

State retains every CLOSED with length and outcomes, every REMOVED, the
old ACTIVE closed at **exact P** with all and only derived outcomes,
the new prepared ACTIVE, and the next high-water. CLOSED/REMOVED are
sorted by unsigned u64 ID, outcomes by TXID. Present zero and high bits
remain meaningful; source tables remain immutable.

Private sections reuse the ACTIVE serializer and `scrivi-valore-edit`.
The canonical CONTROL builder adds header/EDIT/SEAL and rebuilds the
manifest. Final verification compares transition, P, count, and every derived
outcome. No partial plan. Atomicity remains the control log rename;
acknowledgment after parent fsync by the existing publisher. Construction
or preparation alone does not make the plan authoritative.

<a id="budget-e-costi"></a>

## Budgets and costs

| Configuration | Default |
|---|---:|
| `max-payload` | 16 MiB, within metadata ceiling and v1/v2 record capacity |
| `max-segmenti` | 65,536 mentions, including the new ACTIVE |
| `max-esiti` | 65,536 total pairs in CLOSED segments, including new closure |
| `budget-workspace` | 64 MiB of array payload owned by the builder |

With C = final CLOSED segments, R = REMOVED, E = old CLOSED outcomes, and D = derived
outcomes: `Bc = 20C + 16(E+D)`, `Br = 8R`, `Pedit = 24 + Bc + Br` bytes.
Owned arrays cumulatively create
`Pedit + Bc + Br + 8(C+R+E)` bytes, including each CLOSED's temporary keys,
without assuming immediate GC reclamation. Excluded:
Lisp objects/headers, boxing, internal `SORT` work, CONTROL builder,
rebuilt manifest, and GC: **this is not an RSS ceiling**. The controller accounts
for these costs too and for simultaneous builders. Temporary sections and payloads
do not remain in the returned plan.

Sizes, `1 + C + R` mentions, outcomes, v1/v2 capacity, and workspace are
checked before arrays. No metadata is discarded to fit
budgets. Zero outcomes is valid if none exist; new
CLOSED and new ACTIVE are still required. These are task budgets, not new database limits.
Loops over known cardinalities and finite arrays; `SORT` on local copies in the opening
path. No new lock or shared write across Serie. No heap,
latency, RSS, or throughput measurement claimed.

<a id="decisioni-ed-errori"></a>

## Decisions and errors

`invalid-argument` for a different view, reused ID, or invalid payload
configuration; `resource-exhausted` for exhausted IDs, unrepresentable next-id,
or insufficient budgets; `invariant-violation` for internal inconsistencies.
Original capability, codec, replay, and transition conditions propagate;
no generic handler, retry, close, rollback, deletion, or truncation.

| ID | Compound decision / boundary | Required cases, open |
|---|---|---|
| CRB-D01 | payload beyond caller budget or version capacity | each true, both false; v1/v2 boundaries |
| CRB-D02 | EXTRA present and already in table | NIL, zero, new ID, duplicate |
| CRB-D03 | room for key and u64 type | each false, both true; changed cardinality |
| CRB-D04 | outcome present and u64 CSN | absent, wrong type, valid zero and high bits |
| CRB-D05 | exact CLOSED closure, P and count | each mismatching field separately, all exact |
| CRB-D06 | derived outcome present and equal CSN | absence, mismatch, present zero |
| CRB-G01 | canonical sources and lifetime | different view, closed FDs, advanced/faulted new ACTIVE |
| CRB-G02 | next-id and budgets before arrays | ID exhausted/below/at/above high-water; each budget exact/insufficient |
| CRB-G03 | preservation and order | zero/high u64; no/many CLOSED and REMOVED; coalescing outcomes; ACTIVE at start/middle/end |
| CRB-G04 | consumption and postconditions | mismatching codec returns, mutated source, entire plan and no I/O |

The [local evidence](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-recovery-checkpoint/README.md)
concerns compilation and static checks. C1 qualification, independent
review, functional/FI cases, and dedicated measurements remain open.
Physical reconciliation, indexes/CSN horizon, decision forgetting,
and Recovery Manager gates remain to be integrated.

The [CLOSED reader and set check](closed-recuperato.md) are
now available with dedicated qualification open. The additional entry
`pubblica-control-con-closed` verifies old CLOSED segments before delegating to the
ACTIVE publisher; this builder and plan format remain unchanged.
