<a id="avvio-dellobbligo-pool-sulla-serie"></a>

# Starting the pool obligation on a Serie

`arcdocdb.scheduler.dispatch:inizia-obbligo-pool` explicitly starts a
CLAIMED obligation already acquired by [dispatcher](pool-dispatch.md),
[full recycling](pool-recycle.md), or execution APIs. C3 increment of
REQ-THR-001, REQ-CON-001/002/004/005, and REQ-AFF-008; no C1 source changes.
The [preregistered method](pool-begin-metodo.md) bounds verification scope.

<a id="contratto"></a>

## Contract

Current owner, no reentrancy, CLAIMED worker, and associated IDLE link.
API checks port, owner, table, and context as other entry points do;
selects current writer's link through verified routing and calls
`inizia-worker-serie` once. Returns four values:

| Value | Meaning |
|---|---|
| link | Preallocated link selected on current CLAIMED obligation. |
| token | New execution slice's token, valid only with that link. |
| phase | `:active` or `:closing`, original bridge value. |
| reason | NIL, `:serie-busy`, or `:serie-lease-generation`, original bridge value. |

With ACTIVE, caller can use bridge for lease, pop, acknowledgment, and finish.
With CLOSING, retains link and token and explicitly calls
`termina-worker-serie`: cannot pop or retry Serie
acquisition. Generation exhaustion requires resource handling,
without indefinite rescheduling. No cleanup added.

Writer-busy signals original condition, leaves worker CLAIMED and
link IDLE, and consumes no bridge token; caller retains obligation
and decides a later attempt. Wrong phases, faults, and unexpected failures
retain C1 barriers' classifications and capabilities. Failed routing
precedes begin; an error during begin does not undo already successful
acquisitions. Same condition propagated without C3 handler.
On unexpected error after acquisition, four values are not
returned: references, capabilities, and diagnostics remain in C1 context and link
for Archivio coordination. Caller retains links already obtained
from claim/recycle; after adoption it can select them beforehand with
`collega-obbligo-pool`. No new closing path after terminal fault
is promised.

New API recalculates link at each entry: after full uses new
writer, without accepting previous slice's link from caller. Does not create
obligation, call claim or recycle, read pool commands, or
acknowledge retirement. Deactivation, pending retirement, or inconsistent lifecycle
words do not prevent completing an existing obligation.

<a id="costo-e-ambito"></a>

## Cost and scope

Step is O(1): EQ binding, ordinal routing, and one double-lease
attempt for that Serie only. No new intentional allocation, scan,
shared write between Serie, callback, I/O, thread, or wait. C1-barrier
cost remains included; no adapter-only performance claimed.

New claim, recycling, and starting remain separate entries. No
server loops, payload application, admission, sensors, park/wake,
physical startup/shutdown, or Archivio coordination introduced. Durable protocols and
whole-engine gates remain unchanged.
