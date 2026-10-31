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

The current owner calls the API on a preallocated dispatcher without
reentrancy, with worker RESCHEDULE, single obligation, no lease/debt, and
previous bridge already closed. Port/table binding and owner are
checked before any transfer. The context is the port's immutable
context: no second context argument can become mismatched.

The step performs **exactly one** `execution:ricircola-worker` on the home
partition, then returns three values:

| Value | Meaning |
|---|---|
| link or NIL | Preallocated link of new CLAIMED writer; NIL if published. |
| `:claimed` or `:published` | Original recycling outcome. |
| count | Single-partition occupancy at recycling point; neither cursor nor global snapshot. |

With ring space, it publishes the previous writer and returns IDLE. It returns
NIL and ends immediately: no link selection, pool query,
or new writer acquisition. Subsequent acquisition remains an explicit call.

With full ring, the C1 FIFO exchange hands the old head to the context and
publishes the previous writer at the tail, preserving count. The API selects
**new** CLAIMED link by verified ordinal/writer identity.
The link stays IDLE; begin, token, pop, ack, and bridge end remain explicit.
It reuses no previous-slice link and changes neither home nor cursor.

<a id="ritiro-e-guasti"></a>

## Retirement and failures

The step does not read request/ack/active or apply lifecycle commands.
Pending retirement, inactive port, or inconsistent pool words do not prevent
resolving an already assumed obligation. After successful publication, the caller
may separately invoke `prendi-collegamento-pool`: IDLE barrier
then allows retirement acknowledgment before new acquisition.
A full exchange instead assigns another obligation to complete. Retirement
convergence under perpetual ring saturation is not promised.

Wrong owner/binding have the same rejections as the existing dispatcher,
before transfer. Non-RESCHEDULE phases and execution
verifiers remain in C1 barriers. FAULTED retains the first cause.
A held ready guard reports `resource-exhausted :ready-queue-busy`,
with RESCHEDULE/obligation intact: every retry belongs to the caller.

Invalid routing after full does not undo the exchange: the old writer is
already in the ring; the new reference/home remain in the FAULTED worker with
the original condition, without a Serie lease. The caller coordinates Archivio
diagnosis. Unchanged preimage is not claimed after successful transfer.
The new component does not directly write faults, writer, ring, or controller.

Inconsistent delegate writer/status returns report
`invariant-violation :pool-dispatcher-state` before routing; unexpected
status also passes a separate T-argument NOTINLINE guard,
keeping the check active even if the delegate violates its ftype.
The subsequent case retains a final defensive branch. No error-hiding handlers,
rollback, cleanup, handoff, or additional publication.

<a id="costo-e-ambito"></a>

## Cost and scope

The step is O(1): owner/EQ identity check, one home partition, one
guard attempt, and indexed routing only after full. No scan,
hash, new intentional allocation, cross-Serie shared write per
message, callback, wait, thread, or I/O. Count describes the just-completed
transfer; other workers may already have changed the ring on return.

The dispatcher now separately exposes new acquisition, connection of an
already owned CLAIMED, and RESCHEDULE recycling. It is not a complete server
loop: payload application, sensors, admission, park/wake, physical startup/shutdown,
and Archivio coordination remain open. It changes no durable
protocols and closes no complete-engine gates.
