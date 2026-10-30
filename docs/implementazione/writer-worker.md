<a id="contesto-worker-dei-writer"></a>

# Writer worker context

The preallocated context integrates [handoff](writer-handoff.md),
the [ready list](writer-ready.md), and [recycling](writer-recycle.md) on the
worker thread that creates it. It retains obligations, lease, cursor, shard,
and batch debt; the component has no global queue, threads, or application callbacks.
A context has a single owner and is neither reentrant nor migratable.

| API | Precondition and effect |
|---|---|
| `crea-contesto-worker-writer ready :start` | Once at startup of the current worker; starts idle, default cursor 0. |
| `prendi-writer-worker ctx` | Idle; bounded scan returns writer/claimed/cursor, or NIL/empty or busy/cursor. |
| `inizia-tratto-worker ctx` | Claimed; acquires the lease and enters running. Begin is separate from popping payloads. |
| `preleva-lavori-worker ctx target start end` | Running; returns count/status/token. Messages creates batch; empty/yield leaves token 0 and running. |
| `conferma-lavori-worker ctx token` | Batch fully processed by the caller; current ack returns to running, with the same slice/quantum/lease. |
| `termina-tratto-worker ctx` | Running after ack, or finishing; latches finishing before end, then idle or reschedule. |
| `ricircola-worker ctx` | Reschedule; room→NIL/published/count and idle, full→head/claimed/unchanged count. |
| `adotta-writer-worker ctx writer home` | Idle; receives a single obligation from the caller that is not already in the ring, with stable home. |
| `cede-writer-worker ctx` | Claimed/reschedule; returns writer/home to the caller and releases to idle. Does not yield active leases. |
| `stato-worker-writer`, `writer-worker-writer`, `errore-worker-writer` | Owner-only getters for diagnostics; they do not transfer ownership. |

<a id="proprietà-e-retry"></a>

## Ownership and retries

The head removed from the ring remains in the context during begin busy. Home is
derived from the predecessor modulo K of the cursor returned by the ready list,
without searching for the writer. Empty/busy also rotate cursor: they are local
observations, not proof of quiescence for parking or shutdown.

A messages pop produces explicit debt: no new pop or end before
ack. The local token increases once per batch, not on empty/yield,
does not reset on idle/yield, and does not wrap. It is tied to the
context/token pair; it is not unique across contexts. Ack attests the caller's work:
the component cannot verify external effects, WAL, or responses without integrating the engine.

Busy on the first end leaves finishing, with lease/reference retained;
only retrying end is allowed. After schedule, the lease has already been released:
recycle busy retains the obligation without repeating end. Full passes a new
head to the context without increasing capacity; the previous reference
now belongs to the ring. No cleanup on the writer can erase a new
wave after an idle end.

Yield/adopt transfer only obligations without a lease. They do not check
deduplication or eligibility: the caller maintains unique ownership. Do not abandon
a yielded reference or republish one already transferred to the ring.
The context may be retired after yielding, with generation retained;
this does not implement a pool retirement protocol.

<a id="errori-e-confine-locale"></a>

## Errors and local boundary

| Error | Handling |
|---|---|
| Different owner, `invalid-argument :worker-owner` | Rejected before the handler and mutation, including in getters. |
| Wrong phase, `resource-exhausted :worker-state` | No transition; a faulted context rejects all subsequent steps. |
| Wrong/stale token, `:worker-batch`; target/span/alias, `:writer-target`; adoption, `:worker-writer` / `:ready-target` | Input rejected before writes, same phase. |
| Expected queue/ready busy | Only the reason expected for that step is recoverable; fields retained, except for the first finishing latch. |
| `resource-exhausted :worker-generation` | Local budget exhausted before pop after target preflight; even empty/yield is rejected. End and yield remain available, no reset/wrap. |
| Other errors, including not-ready, writer-generation, private lease, and invariants | Original condition recorded and propagated, persistent faulted phase and fields retained; no rollback or reuse. |

The boundary uses an internal dynamic-extent handler: it preserves the same
condition and does not hide it. Recoverable reasons are distinguished by type and API;
private index checks produce invariants, so an invalid caller home
does not mask a corrupted context. A faulted context cannot yield or
adopt: diagnostics and external control of the Serie must govern the fault.
The Serie's FAULTED controller and controlled resource release
in this case remain to be integrated; a local fault does not qualify the whole engine.

<a id="costo-e-confini"></a>

## Cost and boundaries

Local fields are not shared across workers. The shared list is
touched per slice, not per message. Take delegates the existing scan of
≤64 shards/128 CAS; the other steps are O(1), in addition to the bounded batch
copy. Consumption and ack occur outside ready guards, with zero internal waits/retries.
Factory at startup, preallocated inputs/targets on the normal path.

A full chain stays on the same shard: pool quotas, global fairness,
admission, wake/park, shutdown, controller, and effect application
require integration. The [method](writer-worker-metodo.md),
[decisions](writer-worker-decisioni.md), [results](writer-worker-risultati.md),
and [review](writer-worker-revisione.md) bound the local verification.
