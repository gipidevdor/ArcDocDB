<a id="ricircolo-dal-dispatcher-alla-serie"></a>

# Recycling from dispatcher to Serie

`arcdocdb.scheduler.dispatch:ricircola-collegamento-pool` completes the
[pool/Serie dispatcher](pool-dispatch.md) when a closed slice leaves
a RESCHEDULE obligation. It is a C3 increment for REQ-THR-001,
REQ-CON-001/002/004/005, and REQ-AFF-008: it reuses C1
[recycling](writer-recycle.md), worker, and routing barriers unchanged.
The [preregistered method](pool-recycle-metodo.md) bounds verification.

<a id="contratto-del-passo"></a>

## Step contract

Current owner calls API on preallocated dispatcher without
reentrancy, with worker RESCHEDULE, single obligation, no lease/debt, and
previous bridge already closed. Port/table binding and owner are
checked before any transfer. Context is the port's immutable
context: no second context argument can become mismatched.

Step performs **exactly one** `execution:ricircola-worker` on home
partition, then returns three values:

| Value | Meaning |
|---|---|
| link or NIL | Preallocated link of new CLAIMED writer; NIL if published. |
| `:claimed` or `:published` | Original recycling outcome. |
| count | Single-partition occupancy at recycling point; neither cursor nor global snapshot. |

With ring space, it publishes previous writer and returns IDLE. Returns
NIL and ends immediately: no link selection, pool query,
or new writer acquisition. Subsequent acquisition remains an explicit call.

With full ring, C1 FIFO exchange hands old head to context and
publishes previous writer at tail, preserving count. API selects
**new** CLAIMED link by verified ordinal/writer identity.
Link stays IDLE; begin, token, pop, ack, and bridge end remain explicit.
It reuses no previous-slice link and changes neither home nor cursor.

<a id="ritiro-e-guasti"></a>

## Retirement and failures

Step does not read request/ack/active or apply lifecycle commands.
Pending retirement, inactive port, or inconsistent pool words do not prevent
resolving an already assumed obligation. After successful publication, caller
may separately invoke `prendi-collegamento-pool`: IDLE barrier
then allows retirement acknowledgment before new acquisition.
A full exchange instead assigns another obligation to complete. Retirement
convergence under perpetual ring saturation is not promised.

Wrong owner/binding have same rejections as existing dispatcher,
before transfer. Non-RESCHEDULE phases and execution
verifiers remain in C1 barriers. FAULTED retains first cause.
A held ready guard reports `resource-exhausted :ready-queue-busy`,
with RESCHEDULE/obligation intact: every retry belongs to caller.

Invalid routing after full does not undo exchange: old writer is
already in ring; new reference/home remain in FAULTED worker with
original condition, without Serie lease. Caller coordinates Archivio
diagnosis. Unchanged preimage is not claimed after successful transfer.
New component does not directly write faults, writer, ring, or controller.

Inconsistent delegate writer/status returns report
`invariant-violation :pool-dispatcher-state` before routing; unexpected
status also passes a separate T-argument NOTINLINE guard,
keeping check active even if delegate violates its ftype.
Subsequent case retains final defensive branch. No error-hiding handlers,
rollback, cleanup, handoff, or additional publication.

<a id="costo-e-ambito"></a>

## Cost and scope

Step is O(1): owner/EQ identity check, one home partition, one
guard attempt, and indexed routing only after full. No scan,
hash, new intentional allocation, cross-Serie shared write per
message, callback, wait, thread, or I/O. Count describes the just-completed
transfer; other workers may already have changed ring on return.

Dispatcher now separately exposes new acquisition, connection of an
already owned CLAIMED, and RESCHEDULE recycling. It is not complete server
loop: payload application, sensors, admission, park/wake, physical startup/shutdown,
and Archivio coordination remain open. It changes no durable
protocols or closes complete-engine gates.
