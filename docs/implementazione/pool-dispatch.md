<a id="collegamento-dal-pool-alla-serie"></a>

# Connection from pool to Serie

C3 component `arcdocdb.scheduler.dispatch` connects
[pool-governed acquisition](pool-worker-claim.md) to
[preallocated routing](routing-worker.md), for REQ-THR-001,
REQ-CON-001/002/004/005, and REQ-AFF-008. Resource control remains
outside C1 barriers; it writes neither integrity fields, writer, nor controller.
The [preregistered method](pool-dispatch-metodo.md) bounds qualification.

<a id="binding-e-ingressi"></a>

## Binding and entry points

`crea-dispatcher-writer-pool porta tabella` creates an immutable binding on the
owner thread. Port and table must refer by EQ to the same completely IDLE
execution context. Port type, owner, table type,
and context identity are checked in that order before reading
phase or applying a command. The C1 IDLE barrier is read-only.
Factory assumes no obligations, acquires no lease, and acknowledges no pool command.
Port may be inactive or have a pending command.

| API | Outcome |
|---|---|
| `prendi-collegamento-pool dispatcher` | Only free IDLE: new acquisition through gate, then CLAIMED routing. Returns link or NIL, original status, cursor and lifecycle action. |
| `collega-obbligo-pool dispatcher` | Only already assumed CLAIMED: current-writer routing without reading request/ack/active or pool acknowledgment. Returns preallocated link. |
| `ricircola-collegamento-pool dispatcher` | Only RESCHEDULE: one recycling step, then new CLAIMED routing if full; otherwise publishes and ends IDLE. Returns link/NIL, status and partition count. |
| `inizia-obbligo-pool dispatcher` | Only CLAIMED: current routing and one bridge begin; returns link, original token, phase and reason. |
| `passo-dispatcher-pool dispatcher` | One step: selects claim, current or recycle from verified phase; five values with explicit origin, without begin or second acquisition. |

First entry returns a link only with `:claimed`. With `:empty`,
`:busy`, or `:inactive`, returns NIL without routing. Link is still IDLE:
`inizia-worker-serie`, token, pop, ack, and close remain explicit
[bridge](worker-serie.md) steps. No implicit Serie acquisition.
EMPTY and BUSY demonstrate neither global quiescence nor park/shutdown authorization.

Second entry resumes CLAIMED retained after writer-busy, full
recycling, or adoption. Every selection uses the current writer;
it does not reuse the previous slice's link. Repeatable while link
remains IDLE, without new capabilities. Even inconsistent lifecycle words
do not prevent this entry: an existing obligation must remain completable.
Inconsistent binding or foreign owner are always rejected.

<a id="ritiro-errore-e-responsabilità-del-caller"></a>

## Retirement, errors, and caller responsibility

Pending retirement is acknowledged at the next IDLE entry through
gate. It is not applied during CLAIMED, RUNNING, BATCH, FINISHING, or
RESCHEDULE. After `:schedule`, caller explicitly invokes
`ricircola-collegamento-pool` or recycles/hands off the obligation through execution
APIs. If direct recycling assigns a new CLAIMED, use
`collega-obbligo-pool`; recycling adapter already returns its link.
After successful publication, context returns
IDLE and can apply retirement at the next new acquisition.

[Explicit recycling](pool-recycle.md) resolves the single obligation without
consulting pool. [Explicit startup](pool-begin.md) uses a separate
CLAIMED entry; acquisition and recycling entries include no begin. Pop, end,
retry, cleanup, and rollback remain with caller. Writer-busy and Serie-busy rejections retain different
bridge states: former preserves CLAIMED, latter produces CLOSING and a
token to close explicitly. Caller retains references and tokens
until completion; no obligation is ignored on error.

[Coordinated step](pool-step.md) selects only one acquisition,
current-link, or recycling entry without a second mutable C3 state.
Origin distinguishes cursor and count; publication ends the step and
retirement remains applicable only at next explicit IDLE entry.

Invalid routing after claim retains writer, home, and obligation in
FAULTED context under existing C1 barrier. No Serie lease
is acquired. Already successful activation ACK remains valid: generations are
not revoked. Archivio must handle diagnosis as under execution/bridge
contracts. C3 does not directly fault-mark worker or controller.

Wrong configuration type: `invalid-argument
:pool-dispatcher-configuration`; foreign owner: `invalid-argument
:pool-worker-owner`; different contexts: `invalid-argument
:pool-dispatcher-binding`. Non-IDLE phase in factory or gate:
`resource-exhausted :worker-state`, without replacing first cause.
Routing rejections remain those of C1 API. A gate return
inconsistent between writer and status reports `invariant-violation
:pool-dispatcher-state` without abandoning or mutating context.

<a id="costo-e-ambito"></a>

## Cost and scope

Binding costs O(1) at startup beyond already preallocated O(N) table.
Every entry checks owner and EQ identity in O(1). New acquisition: gate and
O(K) ready scan, K maximum 64; only after CLAIMED, O(1) routing
by ordinal. Current obligation: O(1) routing only. No new intentional
hot-path allocation, Serie scan, hash,
shared cross-Serie write, wait, thread, callback, or I/O.

Private coupling reads only port owner/context and table
context. C1 and lifecycle protocols remain unchanged. Dispatcher is a
logical writer entry point, not complete server loop: thread startup/shutdown,
park/wake, real sensors, message admission, payload
application, and Archivio coordination remain open. No complete-engine
gate is closed by this qualification.
