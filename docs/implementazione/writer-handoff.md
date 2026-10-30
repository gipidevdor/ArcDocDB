<a id="consegna-locale-dei-tratti-del-writer"></a>

# Local writer segment handoff

`arcdocdb.execution` adds `writer-programmabile`: it owns a private
[writer queue](code-writer.md) and coordinates acceptance and segment end
through the same ring guard. A message arriving after the last pop
preserves the obligation to run the next segment. Each object belongs
to a distinct Serie, without a guard between Serie.

| Operation | Result |
|---|---|
| `crea-writer-programmabile :capacity :quantum` | Preallocated private queue and idle state; same limits/defaults as low-level queues. |
| `accoda-lavoro-writer writer payload` | Count after acceptance and `:schedule` only on idle→ready; `:queued` if ready/running. NIL remains a valid payload. |
| `inizia-tratto-writer writer` | Ready→running with thread-bound lease; no implicit pop. |
| `preleva-lavori-writer writer lease target start end` | FIFO, cumulative quota, and span as in `preleva-messaggi`. |
| `termina-tratto-writer writer lease` | Releases lease; ready and `:schedule` if work remains, idle and `:idle` if empty. |

The consumer processes extracted messages before terminating the segment.
It may finish before the quantum: any remaining messages still require
a new task. Acceptance and completion share the guard; the lease preserves
writer exclusivity during processing.

`:schedule` is an obligation transferred to the caller: publish the next
task only once and retain it until successful begin. If scheduler delivery
fails, retain and retry notification; do not repeat payload acceptance.
The internal queue object remains private: using low-level APIs on it
would invalidate the protocol.

<a id="ordini-del-passaggio-di-consegna"></a>

## Handoff orders

| Order under local guard | Outcome |
|---|---|
| Producer accepts while running, then writer terminates | `:queued`, then termination sees backlog and returns `:schedule`. |
| Writer terminates empty, then producer accepts | `:idle`, then idle→ready acceptance with `:schedule`. |
| Other producers accept while ready | `:queued`; the single already owed task remains. |

In each order, accepted work remains associated with a current segment
or a next task. Count is not read without the guard to decide reenqueuing.
The future ready Serie list is touched only to start or reenqueue a segment;
ordinary messages modify only their own Serie's state, as required by
[ADR-0045 §8](../adr/0045-modello-di-esecuzione.md).

<a id="rifiuti-e-responsabilità"></a>

## Rejections and responsibilities

| Rejection | Ownership and caller action |
|---|---|
| `:writer-queue-busy` | Only one CAS attempt. No acceptance/extraction; at termination lease, quota, and state retained. Retry only the rejected operation. |
| `:writer-queue-full` | Payload still producer-owned, no state change or notification. |
| `:writer-not-ready` | Begin rejected on idle/running: ineligible or duplicate assignment. Do not enqueue a blind retry that could consume a future wave. |
| `:writer-generation` | Permanent exhaustion without wrap; ready and messages retained, no new lease. Controller handles rejection. |
| `:writer-lease` / `:writer-target` | Old/wrong/other-thread lease or invalid target; current ownership retained. |
| `invariant-violation` | Inconsistent state/ring/owner; controller must apply Serie fail-stop. |

Conditions belong to the ArcDocDB hierarchy. The module does not yet own
the Serie controller, so it signals invariants to the caller. It changes
no persistent data and introduces no durable atomicity point.

<a id="verifica-e-confini"></a>

## Verification and boundaries

The [preregistered method](writer-handoff-metodo.md) requires an independent
FIFO oracle, deterministic race orders, reused real workers, fault injection,
raw coverage, mutants, preallocated allocation measurements, and two C1 readings.
[Local results](writer-handoff-risultati.md), the
[decision table](writer-handoff-decisioni.md), and
[review](writer-handoff-revisione.md) retain the verification scope.

This block transfers the local scheduling obligation. Ready list, wakeups,
worker shutdown, and adaptive controller require integration; progress is
not proven if the caller abandons the task or lease. Primitives create
no threads and perform no callbacks or I/O. No requirement is promoted
and no engine gate is closed.

The subsequent [partitioned ready list](writer-ready.md) implements transport
of these obligations. Full/busy rejections retain the obligation with the
caller; extraction transfers it to the worker. Integration adds no writer
membership and preserves this campaign's local contract.
