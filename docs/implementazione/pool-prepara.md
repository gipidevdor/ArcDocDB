<a id="preparare-un-tratto-dal-pool-alla-serie"></a>

# Preparing a slice from pool to Serie

`arcdocdb.scheduler.dispatch:prepara-tratto-pool` combines the
[dispatcher step](pool-step.md) and one bridge begin on the
just-selected link. C3 increment for REQ-THR-001, REQ-CON-001/002/004/005 and
REQ-AFF-008; [preregistered method](pool-prepara-metodo.md),
[C3/C4 rereading](pool-prepara-revisione.md). No C1 protocol change.

<a id="sette-valori-un-solo-passo"></a>

## Seven values, one step

Current non-reentrant owner, consistent binding, previous bridge closed.
Step selects claim, current, or recycle from context phase.
With CLAIMED, returned link is already current: start directly
without second routing. First value group follows explicit startup;
second retains selection metadata without reinterpretation.

| State | Link | Token | Reason | Origin/detail/action |
|---|---|---|---|---|
| ACTIVE | Selected link | Positive, original from bridge | NIL | Original step values |
| CLOSING | Selected link | Positive, original from bridge | `:serie-busy` or `:serie-lease-generation` | Original step values |
| EMPTY, BUSY, INACTIVE | NIL | 0 | NIL | `:claim`, original cursor, lifecycle action |
| PUBLISHED | NIL | 0 | NIL | `:recycle`, partition count, NIL |

Order: **link, token, state, reason, origin, detail, action**.
For existing CLAIMED: origin `:current`, detail/action NIL.
For full: origin `:recycle`, count, and NIL action. NIL action does not prove
pool command unchanged: in these two cases pool is not consulted.
Pending retirement does not prevent completing current obligation.

Every call performs at most **one ready transfer and one begin attempt**.
Publication ends immediately: no second acquisition or retirement acknowledgment.
EMPTY/BUSY/INACTIVE prove no quiescence and authorize neither parking nor shutdown.
No pop, payload application, batch ACK, or bridge end performed.

<a id="rifiuti-e-guasti"></a>

## Rejections and failures

With ACTIVE, caller uses link/token to retrieve, apply, acknowledge, and
end explicitly. With CLOSING, it closes the slice before recycling;
it does not retry Serie acquisition. Exhausted generation
requires resource handling, not indefinite rescheduling.

Gate-returned BUSY starts nothing. Condition
`resource-exhausted :writer-queue-busy` during begin instead retains CLAIMED
and IDLE link without consuming a bridge token. If acquisition and activation
ACK already succeeded, they remain valid. Ready busy during recycle
retains RESCHEDULE and obligation. Caller decides any later attempts.

Owner, binding, and active phases are checked by step before new actions.
Inconsistent link/status pair or unexpected status reports
`invariant-violation :pool-dispatcher-state` before begin. NOTINLINE checks
with T arguments remain active even in out-of-contract FI.

Unexpected delegate failures propagate the same condition. Seven values
are not returned when begin fails: caller retains dispatcher,
context, table, and configured-resource references in advance. Leases,
link, and diagnosis remain in C1 structures even terminally; no new
post-FAULTED capability-recovery API is promised. Archivio
coordination remains necessary. No C3 handler, rollback, or cleanup added.

<a id="costo-e-confini"></a>

## Cost and boundaries

Outcome selection and startup are O(1); only claim may scan K partitions,
K ≤64. Routing executes once. No new mutable state, loop,
thread, callback, I/O, wait, or cross-Serie shared write per message.
No new intentional allocation: measurements include C1 checks
and actual fixture cycle without isolating adapter cost alone.
Engine payload application, park/wake, real sensors, physical lifecycle,
and Archivio coordination remain open; complete engine is not qualified.
