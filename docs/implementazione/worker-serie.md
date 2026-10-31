<a id="collegamento-del-worker-alla-serie"></a>

# Connecting a worker to a Serie

Authorized C1 foundation, conforming to REQ-CON-001/002/004/005 and
REQ-AFF-001/004/008; ADR-0005, ADR-0033, and ADR-0045. Package
`arcdocdb.execution.series` is loaded after execution and Serie controller.
The [preregistered method](worker-serie-metodo.md) fixes verification;
[decision inventory](worker-serie-decisioni.md) retains denominators.
[Two C1 readings](worker-serie-revisione.md) and
[local results](worker-serie-risultati.md) link preserved evidence.

The caller configures one logical writer/Serie association at startup and
preallocates `collegamento-worker-serie` per context/association pair.
Configuration is a precondition: the factory does not search a global registry
for duplicates. Context, writer, and controller remain read-only. Binding
belongs to the context's thread without migration or reentrancy. A worker may
use multiple preallocated bindings, one at a time, according to the writer claimed
from the ready list; claim, recycling, and yield remain worker APIs.

| API | Precondition and outcome |
|---|---|
| `crea-collegamento-worker-serie` | Startup on context thread; produces IDLE without assuming obligation. |
| `inizia-worker-serie` | IDLE with associated writer's CLAIMED worker; acquires writer then Serie. Returns token, phase, reason. |
| `lease-worker-serie` | ACTIVE and current token; returns lease for controller APIs. |
| `preleva-worker-serie` | ACTIVE and current token; delegates pop, returns count/status/batch token. |
| `conferma-worker-serie` | ACTIVE and fully processed batch; acknowledges only current batch token. |
| `termina-worker-serie` | ACTIVE without debt, or CLOSING; releases Serie before ending worker. |
| `stato-worker-serie`, `errore-worker-serie` | Owner-only diagnostics, even in FAULTED; no ownership transfer. |

Start returns `(token :active nil)` when both leases are present.
If the second acquisition rejects, it returns `(token :closing :serie-busy)`
or `(token :closing :serie-lease-generation)`. The second reason is permanent
exhaustion: the caller must close the slice and handle the resource limit,
without indefinite rescheduling. CLOSING permits no pop, ack, new
acquisition, or Serie-lease reading. The caller explicitly calls finish;
the bridge performs no implicit retry or cleanup. Busy on the first begin leaves IDLE and
worker CLAIMED without consuming a slice token.

Slice token and batch token are different capabilities, both local and monotonic,
without wrapping. The slice token is valid only with the same binding. Exhaustion and
wrong binding are checked before begin; stale/zero or wrong-type tokens are
rejected before mutation. Captured leases are checked against
current capabilities: directly using underlying APIs during a bridge
slice violates the protocol, and stale capability prevents new pops.

Batch debt prevents finishing before Serie release. After successful
release, local Serie token becomes zero: end busy retains CLOSING and
writer lease in FINISHING; only retrying finish is allowed.
The retry neither reads nor releases the controller again; it is already usable by
another worker. Result `:schedule` remains a unique worker obligation,
to recycle or yield through its APIs. No batch prefix is reapplied.

The boundary records the same unexpected condition in the terminal bridge and worker,
retaining references and leases. If the worker is already FAULTED, it retains its
first cause; the bridge records the current operation's cause. It marks the
controller FAULTED with Archivio scope
only when Serie-lease owner and generation still match
captured values. After successful handoff or with a stale lease, it does not touch
the next slice's controller: the caller must stop and coordinate the Archivio using
retained diagnostics. No rollback, automatic release, or quiescence proof is
promised. Health does not prevent acquisition: controller APIs
continue distinguishing allowed I/O draining from new publication
prohibited on fault. I/O completion, retirement, and reuse remain controller-governed.

Internal coupling to execution and Series is explicit: owner/lease checks,
captured generation, and fault marking without verifiers that could mask
the original error. No I/O, threads, waits, callbacks, lookups, or global counters are
added. New APIs are O(1), beyond already bounded batch copying.
The bridge changes in-memory ownership; it introduces no durable atomicity.
Routing, Archivio coordinator, pool, admission, wake/park, and payload
application remain open. Local tests do not qualify the whole engine.
