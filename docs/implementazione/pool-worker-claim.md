<a id="presa-dei-lavori-governata-dal-pool"></a>

# Pool-governed work acquisition

`arcdocdb.scheduler:prendi-writer-pool` connects logical activation of the
[pool](pool-worker-lifecycle.md) to writer acquisition from the ready list.
C3 increment for REQ-THR-001, REQ-CON-001/002/004/005, and REQ-AFF-008:
it governs when to call existing C1 barrier without replacing it.
The [preregistered method](pool-worker-claim-metodo.md) bounds tests.

<a id="api-e-proprietà"></a>

## API and ownership

Function receives only `porta-worker-pool`: it uses the port's immutable
associated context, avoiding a foreign port/context pair. Call
belongs to worker owner, is non-reentrant, and occurs between run-to-completion
tasks, without read epoch or external resources still acquired.
Context must be IDLE and completely free.

Returns four values:

| Value | Meaning |
|---|---|
| writer or NIL | Obligation assumed only with `:claimed`. |
| `:claimed`, `:empty`, `:busy`, `:inactive` | Acquisition outcome; first three from execution API. |
| cursor | Execution-returned cursor when active; retained cursor when inactive. |
| lifecycle action | Applied acknowledgment or `:unchanged`; declared domain retains that of `applica-stato-worker-pool`. |

Caller uses this API for every new pool acquisition. Direct execution
APIs stay available under their contracts; they consult no port.
New gate cannot prevent a bypassing caller from taking work.
[Pool/Serie dispatcher](pool-dispatch.md) binds this port to the same
context's table and returns just-acquired writer's link.

<a id="ordine-del-passo"></a>

## Step order

1. Check port owner.
2. Read execution phase and reject every non-IDLE phase, including
   FAULTED, before reading an ongoing task's leases.
3. Run complete C1 verifier `%richiedi-worker :idle` read-only.
   Lifecycle `:unchanged` alone proves neither IDLE nor health.
4. Apply any activation/retirement command on actual owner.
5. If active, delegate one `execution:prendi-writer-worker`. If inactive,
   return NIL, `:inactive`, and current cursor without querying
   rings, acquiring guards, scanning, or modifying ready list.

C1 barrier in item 3 still reads immutable ready shape and
checks context partition references. It reads no ring head, tail,
count, or slots, acquires no guard, and searches no work.

Only obligation transfer remains in C1 API. New component directly
writes no writer, lease, batch, Serie, or ready field.
C3 checks stay outside `%passo-worker`: a port defect
introduces no new fault write in C1 context.
Delegated acquisition retains its boundary and original diagnosis.

<a id="ritiro-e-compiti-in-corso"></a>

## Retirement and ongoing tasks

Retirement request observed at IDLE step is acknowledged before ready
polling: even with ready work, worker assumes no new obligation.
A request arriving after active read may allow that single
claim to start. It stays pending until worker completes task and returns IDLE;
acknowledgment is neither premature nor revoked.

Pop, payload acknowledgment, Serie bridge closure, recycling, handoff,
and adoption retain existing contracts and are not subject to this gate.
RESCHEDULE must publish or transfer its single obligation before retirement.
Full-ring recycling may immediately assign another CLAIMED writer:
worker completes that obligation too, reselecting routing. Retirement
convergence under perpetual ring saturation is not promised.
EMPTY/BUSY are local observations without global quiescence proof.

Lifecycle-command acknowledgment remains valid if subsequent delegated
acquisition fails. ACK is not rolled back, generations not cleared,
and active count still represents logical activations, not health.
Coordinator must handle worker diagnosis and Archivio.

<a id="rifiuti-e-costo"></a>

## Rejections and cost

Foreign port owner: `invalid-argument :pool-worker-owner`.
Non-IDLE phase: `resource-exhausted :worker-state`, preserving phase,
first cause, references, lease, batch, cursor, and pool words.
Inconsistent IDLE fails in C1 barrier before any ACK or pop.
Inconsistent pool words/CAS propagate lifecycle rejection before
acquisition. Delegated acquisition conditions remain execution's.
No retries, cleanup, or error-hiding handlers.

Gate is O(1) beyond bounded C1 verifiers. Only active branch adds
existing O(K) ready scan, K maximum 64. It introduces no hash,
intentional allocations, callbacks, threads, waits, or global counters.
Shared acknowledgments occur per wave; ready uses its partitions.
Step does not suspend a task, under ADR-0045.

Component integrates logical acquisition, not complete server dispatcher.
Gradual startup, persistent park/wake, sensors, Archivio coordination,
message admission, dead workers, and physical shutdown remain to implement.
REQ-THR-001 and QA-12/19 remain open for complete engine.
