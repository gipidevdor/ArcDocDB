<a id="ricircolo-atomico-dei-writer-pronti"></a>

# Atomic recycling of ready writers

`ricircola-writer-pronto(lista, shard, writer)` integrates the
[ready list](writer-ready.md) with FIFO exchange when the ring is full.
The caller owns a unique `:schedule` obligation obtained through
[local handoff](writer-handoff.md) and must be able to take another writer.
The primitive transports references without reading writer state.

| Ring space | Returned values | Ownership after success |
|---|---|---|
| Available | NIL, `:published`, new count | New obligation belongs to ring. |
| Exhausted | Old head, `:writer`, capacity | New obligation belongs to ring; head belongs to caller. |

Full `[C,B,…,Z]` becomes `[B,…,Z,A]`: one slot is replaced,
head/tail advance one modulo capacity, count unchanged.
Capacity 1: `[C]`→`[A]`. Shape checks guarantee head=tail
when count=capacity. The guard makes the transfer indivisible relative
to other producers/consumers; separate pop/publication does not
satisfy the same contract.

Success is not retried. With `:writer`, the caller takes the returned
reference and retains ownership during any start busy.
The newly inserted writer stays in the ring. Consumption/slice completion
occur outside the list guard. After `:idle` finish, no scheduler
cleanup: a new wave may already be published.

<a id="saturazione-e-parallelismo"></a>

## Saturation and parallelism

If all consumers finish with backlog while producers filled
rings, publication alone can leave every consumer busy retrying
insertion with nobody consuming. Recycling instead allows a
consumer to publish its own obligation and take the head in the same
operation without an extra queue or growing capacity.
The regression preserves the counterexample with two consumers/two
refill references.

Cost is O(1): one acquire CAS attempt and, if successful, one release
CAS; no retry, wait, scan, or global state in the new code.
Guards remain independent per shard, touched per slice,
as [ADR-0045 §8](../adr/0045-modello-di-esecuzione.md).
No shared per-message writes, product threads, I/O, callbacks.
The factory and queue/writer/handoff/ready sources are unchanged.

<a id="rifiuti-e-responsabilità"></a>

## Rejections and responsibilities

| Condition | Effect and handling |
|---|---|
| `invalid-argument :ready-target` / `:ready-writer` | Wrong index/reference before guard and mutation. |
| `resource-exhausted :ready-queue-busy` | No transfer; caller retains obligation and controls retry. |
| `invariant-violation :ready-queue-invariant` / `:ready-queue-guard` | Inconsistent shape, payload, ownership: owner fail-stop without promised rollback after internal fault. |
| `invariant-violation :ready-recycle-full` | Private exchange helper called outside full precondition; not ordinary public-API rejection. |

Full capacity is not a rejection in this API. Unique obligation and caller's
ability to assume another writer are preconditions: no
deduplication or eligibility check. A producer unable to
consume can still use `pubblica-writer-pronto`, retaining the
obligation on full/busy under a controller-defined bounded policy.

Exchange resolves capacity-only blocking in the modeled
protocol. A full chain stays on its shard and proves neither fairness,
no starvation, nor progress with perpetually contended guards, abandoned/
duplicated obligations, faulted Serie. Empty is a local observation, not
a quiescence proof for parking/shutdown. Pool, wakeups, FAULTED controller,
admission, shutdown still need integration.

[Method](writer-recycle-metodo.md), [inventory](writer-recycle-decisioni.md),
[results](writer-recycle-risultati.md), [review](writer-recycle-revisione.md)
preserve local-verification scope/limits.
