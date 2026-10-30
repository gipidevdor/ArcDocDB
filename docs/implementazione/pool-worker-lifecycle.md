<a id="attuazione-logica-del-pool-di-worker"></a>

# Logical worker pool actuation

The `arcdocdb.scheduler` registry connects the [EWMA/AIMD controller](controllore-pool.md)
to existing workers, each owning its own writer context. Growth and retirement
become persistent requests; the actual count changes only when the worker
acknowledges. This is a C3 increment for REQ-THR-001, REQ-CON-005, and
REQ-AFF-008/013 under [ADR-0031](../adr/0031-software-critico-criteri-e-priorita.md).
The [methodology](pool-worker-lifecycle-metodo.md) preregisters tests; the
[independent review](pool-worker-lifecycle-revisione.md) and
[results](pool-worker-lifecycle-risultati.md) bound the available evidence.

<a id="confine-e-proprietà"></a>

## Boundary and ownership

The coordinator owns one controller and one registry, exclusively and without
reentrancy. Each worker creates a context and a port on its own thread; the caller
publishes these ports to the coordinator through a startup handshake. The registry
factory copies the vector, checks all elements, and then permanently binds the
ports. A controller is used in only one registry; after attachment it is updated
exclusively through `aggiorna-registro-pool`. The original getter remains usable.
The caller does not access the private representation or reuse a port in another
pool. It creates only one operational port per context and keeps the input vector
exclusive during the factory. The factory rejects a second binding of ports;
it does not detect duplicate new ports for the same context across different registries.

The vector contains exactly `controller.maximum` ports with distinct owners. The
initial active workers are the prefix of length `controller.target`; the others
are already created but logically inactive. All start at generation zero and in an
acknowledged state, without a pending command. Construction allocates; subsequent
steps use only fixnum words, multiple values, and bounded scans. Deduplication uses
an EQ hash at startup, avoiding quadratic searches.

`actual` counts **acknowledged logical activations**, not OS threads, healthy workers,
epochs, or requests. The worker uses the Boolean returned by its own step to decide
whether it can start further tasks. A dispatcher must honor that Boolean: the
existing execution APIs do not consult the port. No spawn, join, kill, waits,
semaphores, mutexes, real clocks, or callbacks are introduced in product code.
Inactive threads and contexts remain available for reuse.

Acknowledgment occurs between run-to-completion tasks, without read epochs or
resources outside the writer context. The existing C1 checker
`execution::%richiedi-worker :idle` is called only for reading; it checks owner,
state, writer reference, lease, and batch debt. The actuator does not modify the
writer, ready, Serie, or bridge. No new integrity barrier is entrusted to C3.
This boundary follows [ADR-0045](../adr/0045-modello-di-esecuzione.md): it does not
suspend a task or make blocking calls.

## API

| API | Result and obligations |
|---|---|
| `crea-porta-worker-pool context &key coordinator active` | On the owner thread, verified IDLE context; defaults to current coordinator and active=T. Builds a port with an already acknowledged initial state. |
| `crea-registro-pool controller ports` | On the controller's coordinator; simple vector of exact capacity, distinct port owners, compliant and stable active prefix. Private copy and binding only after full validation. |
| `applica-stato-worker-pool port` | On the owner worker. Returns acknowledged active and `:unchanged`, `:activated`, `:retired`, `:busy`, or `:faulted`; at most one command applied. |
| `leggi-registro-pool registry` | On the coordinator. Returns actual, target, and pending without a heap copy. The scan is progressive during concurrent acknowledgments. |
| `aggiorna-registro-pool registry tick queue cpu p99` | On the coordinator. Returns target, controller action, actual read before the sample, and conservative pending. Time and metrics remain injected. |

There is no command to apply when request=ack: the step returns `:unchanged`
without inspecting execution state; this outcome certifies neither health nor IDLE.
When a command exists, CLAIMED, RUNNING,
BATCH, FINISHING, and RESCHEDULE produce `:busy`; FAULTED produces `:faulted`.
In both cases the command remains pending and the context, lease, and diagnostics
remain intact. A context that declares IDLE but has inconsistent obligations fails
at the C1 barrier before acknowledgment.

<a id="protocollo-e-concorrenza"></a>

## Protocol and concurrency

Each port has two atomic words: the coordinator's `request` and the worker's `ack`.
The encoding is `2 × generation + active-bit`, with generation from zero to
`floor(most-positive-fixnum/2)`. Only one request may be pending. The coordinator
publishes with a release barrier and CAS; the worker reads acquire, checks IDLE,
and publishes ack with release/CAS. The coordinator reads ack acquire. The only
writer of each word is its owner; no CAS retry or waiting loop is necessary.

A new request changes the active bit and increments generation by one. Ports
already in the desired state receive no commands. The target always selects a
prefix, so each wave contains only activations or only retirements. The minimum
prefix always stays active. While a command remains pending, actual differs from
target and the controller retains the proposal with `:pending`. Time spent
waiting for acknowledgments does not advance a new hysteresis period.

Acknowledgments can arrive out of order: during growth, a later worker may
activate before an earlier one. The prefix applies to requests; it is not required
of intermediate acks. The getter returns a progressive count, conservative with
respect to wave completion. If pending=NIL, all acknowledgments read equal the
current requests and actual=target. The wrapper may return pending=T even if the
last acknowledgment arrives immediately after the read.

The word invariant allows request=ack, or a difference of one generation with a
different active bit. A regressive command, generation jump, or command without
a state change is rejected. No generation wraps or is reset.
Before updating a stable controller, the generation budget of all ports is checked:
exhaustion is a conservative rejection even for a hold sample. Exhaustion requires
administrative replacement of the component; it does not authorize resetting
contexts or abandoning commands. Every preflight precedes sample and request
writes, avoiding partial application for ordinary errors.

The registry costs O(maximum) per read/update; the worker performs an O(1) step,
beyond the bounded C1 barrier. Shared writes occur per sample and acknowledgment,
outside Serie operations, without a hot global counter.
It therefore follows INV-P6 and the [shared state inventory](../architettura.md#archivio-coordinamento-minimo).

<a id="errori"></a>

## Errors

| Condition | Reason |
|---|---|
| `invalid-argument` | `:pool-owner` for an invalid/foreign coordinator; `:pool-worker-owner` for a foreign step owner; `:pool-active` for an invalid Boolean. |
| `invalid-argument` | `:pool-ports` for vector/capacity/element/duplicate owner; `:pool-binding` for an already bound port; `:pool-port-state` for unstable, noninitial startup or an incorrect prefix. |
| `invariant-violation` | `:pool-port-state` for inconsistent words or requests; `:pool-state` for inconsistent target/controller/capacity or private count. |
| `resource-exhausted` | `:pool-generation` for exhausted command budget, without mutation. |
| Delegated checkers | Factory and step propagate execution conditions; the wrapper propagates controller sample rejections. |

A command blocked by FAULTED remains diagnosable. The coordinator must handle
Archivio failure and lack of progress; the component does not free resources or
decrement a count to hide the problem. There are no generic handlers, cleanup
that hides errors, or implicit recovery policies.

A CAS conflict violates owner exclusivity and is a terminal invariant,
not an ordinary recoverable rejection. Wave publication may be partial in this
case; use of the registry does not continue. The step does not attest to a failed
acknowledgment, and none of the C1 integrity fields is modified.

<a id="integrazione-ancora-richiesta"></a>

## Integration still required

The [pool-controlled claim](pool-worker-claim.md) honors active and connects the
IDLE step to the C1 claim. REQ-THR-001 remains designed at the complete engine level.
The server dispatcher, sensors and Archivio coordination, gradual thread startup,
persistent wakeup from ready, pool fault handling, and physical shutdown are missing.
The component does not qualify a native idle wait, the wakeup pump, the number of
threads to start on hardware, or end-to-end latency. QA-12/19 remain open.
