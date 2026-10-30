<a id="lista-dei-writer-pronti"></a>

# Ready writer list

`lista-writer-pronti` transports `:schedule` obligations produced by
[local handoff](writer-handoff.md). It is a preallocated list with independent
partitions, each with a FIFO ring and single-attempt guard. A contended
partition does not prevent acquiring a segment from another.

| API | Contract |
|---|---|
| `crea-lista-writer-pronti :shards :capacity` | From 1 to 64 partitions, default 4; from 1 to 65536 slots per partition, default 1024. Construction before hot path. |
| `pubblica-writer-pronto lista shard writer` | Publishes an already obtained obligation only once, returning the partition's new count. Writer remains a reference, without reading its state. |
| `preleva-writer-pronto lista start` | Searches at most K partitions in circular order. Returns reference, status, and next cursor. No internal retry or wait. |

The returned cursor follows the served partition if status is `:writer`;
it follows start for other outcomes. `:busy` means no writer was acquired
and at least one partition was contended. `:empty` means the K local
observations were empty. It is not proof of quiescence: publication can
occur after an observation, even before the scan ends. FIFO applies within
each partition; there is no global order between partitions or bounded-time
starvation guarantee.

<a id="trasferimento-dellobbligo"></a>

## Obligation transfer

1. `accoda-lavoro-writer` from idle, or `termina-tratto-writer` with backlog,
   returns `:schedule`: the caller owns an obligation.
2. Successful `pubblica-writer-pronto` transfers it to the ring. Full/busy
   retain it with the caller: retry publication without repeating payload
   acceptance. A success is not published again.
3. A `:writer` extraction transfers the obligation to the worker. If writer
   begin signals busy, the worker retains the reference until successful retry.
   Not-ready signals an ineligible or duplicate task; it is not a blind retry.
4. The worker processes the segment and terminates it. A new `:schedule`
   is published, including through [atomic recycling](writer-recycle.md)
   if the worker can acquire a new head at a full ring; `:idle` requires
   no scheduler-state cleanup.

A Serie's partition is the caller's choice, fixed before the hot path.
Index, structure, and capacity are private to the list; message buffers
remain private to the consumer. The component adds no membership or
`scheduled` flag: it cannot cancel a new wave through previous-segment
cleanup. It does not check duplicates, abandoned obligations, or writer
eligibility, which belong to the caller contract. Low-level primitives
are not mixed with private objects.

<a id="rifiuti-e-limiti"></a>

## Rejections and limits

| Response | Handling |
|---|---|
| `invalid-argument`, `:ready-configuration` | Budgets outside limits; no list published. |
| `invalid-argument`, `:ready-target` / `:ready-writer` | Invalid index or reference; no publication. |
| `resource-exhausted`, `:ready-queue-full` / `:ready-queue-busy` | Obligation still caller-owned; rejection before mutation. |
| `invariant-violation`, `:ready-queue-invariant` / `:ready-queue-guard` | Owner fail-stop; no rollback promised after internal failure. |

Publication O(1), search O(K), space O(K·capacity), with static bounds.
Each candidate requires one acquisition CAS attempt and, if successful,
one release CAS: at most K acquisitions and 2K CAS operations total per scan.
The guard serializes only the short operation on its ring; it is not a
lock-free algorithm. The shared list is touched per segment, as in
[ADR-0045 §8](../adr/0045-modello-di-esecuzione.md), without common writes
per message. It introduces no threads, callbacks, I/O, wakeups, or global
state. A parking protocol must coordinate new publication and wakeup:
`:empty` alone is insufficient. Adaptive pool, shutdown, and controller
remain components to integrate, without complete engine qualification.

The [preregistered method](writer-ready-metodo.md),
[inventory](writer-ready-decisioni.md), and [results](writer-ready-risultati.md)
bound correctness tests, contention tests, and observed allocation.

[Atomic recycling](writer-recycle.md) integrates obligation transport for a
consumer able to acquire another writer. At a full ring it inserts the new
reference and returns the old head in the same section, with unchanged count.
Simple publication preserves its full/busy contract; a pool where all consumers
retry only insertion must handle the risk of saturation deadlock.
