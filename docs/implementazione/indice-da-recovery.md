<a id="materializzazione-dellindice-dal-recovery"></a>

# Materializing the index from recovery

Connects [version selector](selezione-versioni-recovery.md) to
[primary index](indice-primario.md), without changing ADR-0015, ADR-0042,
ADR-0048, or slot format. Requirements REQ-REC-001, REQ-IDX-001,
REQ-IDX-003, REQ-IDX-005, REQ-IDX-006, REQ-LIM-003, REQ-AFF-004,
REQ-AFF-008; invariants INV-D1, INV-C11, and INV-I2.

<a id="una-chiave-completa-poi-una-voce"></a>

## One complete key, then one entry

```lisp
(arcdocdb.recovery.selection:materializza-chiave-recuperata
 selector primary context source)
;; => :inserted | :present | :absent
```

Coordinator must have considered **all** committed key
candidates in same Serie. Primary is a private bootstrap
candidate, with admission and application readers still closed. Writer
retains exclusive ownership of index, selector, context, and scratch throughout
call. `source` is a preallocated five-u64 buffer, distinct
from `contesto-indice` scratch. No new array per key.

Function uses selector's private key and index's immutable
seed: accepts no external digest and retains no reference
to original buffer. Ambiguous selector rejected. Busy context,
alias, or absent seed rejected before scratch write.

| Selector winner | Effect on primary candidate |
|---|---|
| PUT, absent key | Insertion through canonical preflight and writer |
| PUT, same entry already present | `:present`, no new mutation |
| PUT, different entry present | Rejection, no overwrite |
| TOMBSTONE or no candidate, absent key | `:absent`, no entry |
| TOMBSTONE or no candidate, present entry | Rejection, no removal |

Tombstone remains in selector until key completion and does not
enter live index under ADR-0042. Primary receives no
provisional versions to correct later. If it already contains
a different entry, it is not expected candidate for this materialization:
coordinator must resolve problem before admission.

Grouping and key completeness remain coordinator
responsibilities. Early reset/delivery may violate those
preconditions: function does not establish replay of entire Serie
or Archivio.

<a id="payload-e-compatibilità"></a>

## Payload and compatibility

For PUT, effective CSN, location, key length,
record length, and zero validity-end are prepared. Arena offset
rebuilt by canonical writer. For TOMBSTONE/NONE, buffer
zeroed and primary receives NIL, meaning **expected absence**.
Scratch is not commit proof and must not be published alone.

Before writing it, bridge checks current recipient's constraints:
positive CSN, positive segment ID representable in u32, offset and record
end within u32. Unrepresentable winner rejected, never
truncated. Selector and readers retain u64 IDs/CSNs, including zero;
this increment neither restricts their contract nor expands
primary/GET format. Tombstone producing no entry needs no
primary-representable location.

Record format and flags remain GET-source responsibilities.
Materializing a prepared PUT retains already resolved CSN;
it does not remove need for OUTCOME/EDIT/DECISION proofs or
build/publish GET maps.

<a id="ripristino-canonico-nel-primary"></a>

## Canonical primary restore

`arcdocdb.index.primary:ripristina-chiave-indice` receives index, key
span, trusted digest, live source or NIL, and exclusive context.
In-memory entry for bootstrap use; operational writer
continues using normal transactional protocol.

Full writer probe checks presence with at most C fragment
slots. An already present live source must match CSN,
location, record length, validity end, and key length: only
arena offset ignored because it may change with rebuild/split.
This comparison is not body verification: record and
immutability must already be attested by recovery.

For a new entry, normal preflight repeats probe,
checks load, arena, credits, and revision, then applies normal
slot publication. Second probe must confirm absence
under same writer. Final reread checks LIVE state and
payload identity. New insertion costs at most two probes;
absence and identical entry cost one. No unbounded retry or
fallback to eight-credit reader.

Repeating an already successful restore returns `:present` or
`:absent` without consuming new revision, sequence, arena, or capacity.
A different root after maintenance is resolved anew, without
retaining a slot or arena offset between calls.

<a id="errori-concorrenza-e-confini"></a>

## Errors, concurrency, and boundaries

Invalid input, incompatibility, or insufficient capacity rejected before
index mutation. Private scratch may change; after
RESOURCE-EXHAUSTED, coordinator can complete rebuild/split or
arena expansion and repeat same key. No automatic growth,
new threshold, or total-document limit introduced.

A primary invariant makes it FAULTED before propagating
original cause; bridge also makes selector FAULTED.
Context released on every exit. Mutation interruptions
follow canonical writer fail-stop, without rollback.
Private construction must not be confused with application-root
publication, EBR lifetime, or traffic opening.

Cold operations, serialized by individual Serie's writer;
independent Serie share no new locks, registers, or writes.
Bridge reuses caller's five u64 words and existing scratch;
retains no new per-document objects and performs no I/O. These are not
measurements of allocations, GC, RSS, throughput, or latency.

<a id="decisioni-e-qualifica-aperta"></a>

## Decisions and open qualification

| ID | Decision to qualify | Status |
|---|---|---|
| IMR-D01 | Free context, valid source, key length, and aliases | Open |
| IMR-D02 | Probe found, space exhausted, and valid absence even at full table | Open |
| IMR-D03 | Identical/different entry; NIL means absence, never deletion | Open |
| IMR-D04 | Second probe, canonical budgets, and final reread | Open |
| IMR-D05 | Empty, PUT, TOMBSTONE, or ambiguous selector | Open |
| IMR-D06 | Compatible CSN/ID/offset before scratch | Open |
| IMR-D07 | Valid payload, non-PUT zeroing, and index seed | Open |
| IMR-D08 | Invariants, fail-stop, and context release | Open |

[Preregistered method and local results](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-22-index-materialization/README.md).
Dedicated functional tests, permutations, fault injection, MC/DC, coverage,
independent review, and performance measurements remain open. So do
complete per-key replay, GET sources, root publication,
and coordinator gate. Static checks close neither these
obligations nor C1 qualification.
