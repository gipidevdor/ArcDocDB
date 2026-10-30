<a id="passo-bounded-del-dispatcher-poolserie"></a>

# Bounded pool/Serie dispatcher step

`arcdocdb.scheduler.dispatch:passo-dispatcher-pool` coordinates one step
before bridge startup. C3 increment for REQ-THR-001,
REQ-CON-001/002/004/005 and REQ-AFF-008: reuses [dispatcher](pool-dispatch.md)
and introduces no second mutable state for leases, tokens, or obligations.
The [preregistered method](pool-step-metodo.md) bounds qualification.

<a id="contratto-e-risultati"></a>

## Contract and results

Current owner, no reentrancy, previous bridge closed, consistent
context. Port/table binding and owner checked before phase.
Public context getter determines one operational entry:

| Input phase | Operation | Origin | Detail | Lifecycle action |
|---|---|---|---|---|
| IDLE | New governed acquisition | `:claim` | Original cursor | Original gate action |
| CLAIMED | Connect current obligation | `:current` | NIL | NIL |
| RESCHEDULE | One recycling operation | `:recycle` | Partition count | NIL |

Five values: **link/NIL, status, origin, detail, lifecycle action**.
Status is `:claimed`, `:empty`, `:busy`, `:inactive`, or `:published`,
original from selected entry; current returns `:claimed`.
NIL in current's last two values means no transfer and
no lifecycle observation. NIL recycle action does not mean unchanged
command: pool was not consulted.

Every call performs **one operational entry and at most one ready
transfer**. Binding, getter, and read-only routing are not transfers.
EMPTY, BUSY, and INACTIVE are outcomes only of fresh acquisition; cursor remains
as gate returned, without reinterpretation as occupancy.
They prove neither global quiescence, parking, nor safe shutdown.

CLAIMED performs no new acquisition, recycling, or pool ACK: it selects current
IDLE link and retains obligation even with inactive pool, pending retirement,
or inconsistent commands. Repeated current alone makes no progress.
Caller separately uses [explicit startup](pool-begin.md), then bridge
APIs for pop, acknowledgment, and end.

RESCHEDULE reuses [recycling](pool-recycle.md): room publishes and ends
immediately IDLE without falling into second acquisition. Full returns
new CLAIMED and its link, never previous link. It neither reads lifecycle nor
acknowledges retirement: that belongs to next IDLE call.
Retirement convergence under permanent saturation is not promised.

<a id="rifiuti-e-guasti"></a>

## Rejections and failures

RUNNING, BATCH, FINISHING, and FAULTED report `resource-exhausted
:worker-state` before any operational entry, preserving debts,
leases, ring, and first cause. C3 resource control does not revalidate fields of
an active or terminal context. Owner and binding retain
existing entry-point order and diagnostics.

Unexpected phase reports `invariant-violation :pool-dispatcher-state`.
Case is in a NOTINLINE helper with T argument: even getter FI
outside its ftype passes an operational check, without confusing this
boundary test with a nominal C1 return.

New-acquisition BUSY returns claim origin and cursor.
Recycling's `resource-exhausted :ready-queue-busy` instead remains original
condition with RESCHEDULE/obligation retained. No retry,
handler, cleanup, or rollback added. Failed routing after full
cannot undo successful exchange: new writer reference/home
remain in FAULTED context with original cause; old writer is already
in ring. Caller retains references and coordinates Archivio diagnosis.

<a id="costo-e-limiti"></a>

## Cost and limits

O(1) phase selection; O(1) current lookup and home recycling. Only claim
may perform O(K) ready scan, K maximum 64. No new loop,
intentional allocation, callback, thread, wait, I/O, or cross-Serie shared
write per message. C1 delegate cost included.

Step neither starts/ends bridge nor applies payload and is not the
server loop. Message admission, sensors, park/wake, physical startup/shutdown,
and Archivio coordination remain open. No durable protocol changes
or complete-engine gate closure.
