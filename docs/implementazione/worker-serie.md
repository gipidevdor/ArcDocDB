<a id="collegamento-del-worker-alla-serie"></a>

# Connecting a worker to a Serie

Authorized C1 foundation, conforming to REQ-CON-001/002/004/005 and
REQ-AFF-001/004/008; ADR-0005, ADR-0033, and ADR-0045. Package
`arcdocdb.execution.series` loaded after execution and Serie controller.
The [preregistered method](worker-serie-metodo.md) fixes verification;
[decision inventory](worker-serie-decisioni.md) retains denominators.
[Two C1 readings](worker-serie-revisione.md) and
[local results](worker-serie-risultati.md) link preserved evidence.

Caller configures one logical writer/Serie association at startup and
preallocates `collegamento-worker-serie` per context/association pair.
Configuration is precondition: factory does not search global register
for duplicates. Context, writer, and controller remain read-only. Binding
belongs to context thread without migration or reentrancy. A worker may
use multiple preallocated bindings, one at a time, according to writer claimed
from ready list; claim, recycling, and yield remain worker APIs.

| API | Precondition and outcome |
|---|---|
| `crea-collegamento-worker-serie` | Startup on context thread; produces IDLE without assuming obligation. |
| `inizia-worker-serie` | IDLE with associated writer's CLAIMED worker; acquires writer then Serie. Returns token, phase, reason. |
| `lease-worker-serie` | ACTIVE and current token; returns lease for controller APIs. |
| `preleva-worker-serie` | ACTIVE and current token; delegates pop, returns count/status/batch token. |
| `conferma-worker-serie` | ACTIVE and fully processed batch; acknowledges only current batch token. |
| `termina-worker-serie` | ACTIVE without debt, or CLOSING; releases Serie before ending worker. |
| `stato-worker-serie`, `errore-worker-serie` | Owner-only diagnostics, even in FAULTED; no ownership transfer. |

Start returns `(token :active nil)` when both leases present.
If second acquisition rejects, returns `(token :closing :serie-busy)`
or `(token :closing :serie-lease-generation)`. Second reason is permanent
exhaustion: caller must close slice and handle resource,
without indefinite rescheduling. CLOSING permits no pop, ack, new
acquisition, or Serie-lease reading. Caller explicitly calls finish;
bridge performs no implicit retry or cleanup. Busy on first begin leaves IDLE and
worker CLAIMED without consuming slice token.

Slice token and batch token are different capabilities, both local and monotonic,
without wrapping. Slice token valid only with same binding. Exhaustion and
wrong binding checked before begin; stale/zero or wrong-type tokens
rejected before mutation. Captured leases checked against
current capabilities: directly using underlying APIs during a bridge
slice violates protocol, and stale capability prevents new pops.

Batch debt prevents finishing before Serie release. After successful
release, local Serie token becomes zero: end busy retains CLOSING and
writer lease in FINISHING; only retrying finish is allowed.
Retry neither reads nor releases controller again, already usable by
another worker. Result `:schedule` remains unique worker obligation,
to recycle or yield through its APIs. No batch prefix reapplied.

Boundary records same unexpected condition in terminal bridge and worker,
retaining references and leases. If worker already FAULTED, retains its
first cause; bridge records current operation's cause. Marks
controller FAULTED with Archivio scope
only when Serie-lease owner and generation still match
captured values. After successful handoff or stale lease does not touch
next slice's controller: caller must stop and coordinate Archivio using
retained diagnostics. No rollback, automatic release, or quiescence proof
promised. Health does not prevent acquisition: controller APIs
continue distinguishing allowed I/O draining from new publication
prohibited on fault. I/O completion, retirement, and reuse remain controller-governed.

Internal coupling to execution and Series explicit: owner/lease checks,
captured generation, and fault marking without verifiers that could mask
original error. No I/O, threads, waits, callbacks, lookups, or global counters
added. New APIs O(1), beyond already bounded batch copying.
Bridge changes in-memory ownership; introduces no durable atomicity.
Routing, Archivio coordinator, pool, admission, wake/park, and payload
application remain open. Local tests do not qualify whole engine.
