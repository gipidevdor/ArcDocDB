<a id="stabilizzazione-dellinsieme-serie--metodo"></a>

# Serie set stabilization — method

> **API proposal** — Method preregistered on 2026-10-22 against base
> `3b874756`, before code and diagnostics. Implements live name completion
> from ADR-0040 §2–3; no new format or commit point.

<a id="contratto-previsto"></a>

## Planned contract

`recovery.series:stabilizza-nomi-serie-recuperata(directory, sources,
active, closed, :max-segmenti 65536)` receives the open owned set and the
two results of `leggi-serie-recuperata`. CLOSED is a complete simple-vector
ordered by u64 ID; ACTIVE may appear anywhere in the source set. The
controller keeps catalog, CONTROL, namespace, set, vector, and capabilities
exclusive/stable in the I/O pool, before checkpoint and admission. The
Archivio gate remains the coordinator's obligation.

Three phases, all bounded by the source count:

1. Complete metadata check: count/budget before scans, strictly increasing
   IDs, unique ACTIVE, alignment with every CLOSED token, same CONTROL by
   EQ, same FDs, canonical ACTIVE EOF and CLOSED P.
2. I/O preflight of all names: modes/backend, name/FD, exactly one form
   present; exclusive capability only for a temporary. No rename or fsync
   before this scan completes.
3. Completion in ID order with the existing per-source primitive:
   exclusive publication if temporary, postcondition, and parent fsync
   even when already final. Two counts return only on complete success:
   renamed and already final, with their sum equal to the source count.

Strict set ID order, exact manifest cardinality, and membership of every
row prove completeness without another seen table. Every consumed CLOSED
must have the same ID as the row: duplicates, permutations, and omissions
are not accepted. Zero and high u64 bits remain valid for CLOSED; NIL
indicates ACTIVE not yet encountered, even if its final position is zero.
Per-source semantic guards are reused.

The `max-segmenti` budget is an `index`, zero allowed; it includes ACTIVE.
Exceeding it produces `resource-exhausted` before scans. No per-source
array, hash, or plan added: only cursor/count and short private names
from existing primitives. Copies and FFI may allocate on the cold path;
this is neither an RSS budget nor a zero-heap promise.

<a id="preflight-io-condiviso"></a>

## Shared I/O preflight

`io:verifica-stabilizzazione-temporaneo` performs the same preflight as
the completion primitive and returns T for temporary or NIL for final.
A private helper owns both leaves and the selected branch; both public
preflight and completion reuse it. The result is neither a lease nor a
reservation: completion rechecks before effects. No new backend or less
restrictive fallback.

<a id="guasti-e-proprietà"></a>

## Failures and ownership

An error in the last row or last name preflight precedes all effects.
During the third phase, each completed source remains completed: the group
is not an atomic transaction. An I/O primitive failure preserves its parent
fail-stop and original cause; the group does not close, undo, retry, or hide
errors and returns no partial counts. Interruption between two completed
calls does not imply pending I/O. Reacquisition after a faulted capability
and new name observation remain those of existing idempotent completion.
Admission stays closed until the coordinator completes all recovery.

No lock, thread, registry, or shared write between Serie. The internal
sequence belongs to only one Serie; distinct Serie keep separate capabilities
and workspaces. Removals, new ACTIVE, CONTROL checkpoint, indexes, CSN
frontier, and traffic are not completed by this API.

<a id="decisioni-c1-da-qualificare"></a>

## C1 decisions to qualify

| ID | Boundary |
|---|---|
| SGS-D01 | Valid budget/admitted count; set count = 1 + CLOSED and CLOSED = manifest |
| SGS-D02 | Strictly increasing set IDs; initial zero, duplicate, and regression |
| SGS-D03 | Unique ACTIVE; valid position zero, exact token/EOF/FD/manifest |
| SGS-D04 | Next CLOSED available and typed; exact ID/P/FD, same CONTROL EQ |
| SGS-D05 | Entire CLOSED consumption and ACTIVE presence; no omission or permutation |
| SGS-D06 | All name preflights precede effects, including last source |
| SGS-D07 | First/last temporary or final; exclusive backend required only when needed |
| SGS-D08 | Complete counts and exact sum, FD/CONTROL/parent still open |
| SGS-D09 | Error/interruption during completion; previous effects retained, no partial output |

Before processes: committed code, two author readings, independent static
review, and agents closed. Forced product-only compilation with fatal warnings
and private hierarchical cache; lint, trace, links, and compiled-code reading.
All diagnostics, including failures, go through the recorder; lossless copies,
common collector with four workers, and verified closed inventory. Preparatory
reports use the `.source` suffix even in staging; preparer counts use already
ordered and stable lists.

No functional tests, FI, coverage, mutations, or benchmarks are added or run.
SGS-D01…D09, MC/DC, C1 qualification, filesystem failures, and complete recovery
remain open. Compilation and static review do not replace them.
