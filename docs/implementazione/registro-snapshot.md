<a id="registro-degli-snapshot"></a>

# Snapshot registry

The registry in [`src/mvcc/`](../../src/mvcc/) implements registration, activation,
validation, and expiration of snapshot contexts according to
[ADR-0038](../adr/0038-orizzonte-di-visibilita.md),
[ADR-0020](../adr/0020-csn-snapshot-isolamento.md), and
[ADR-0045](../adr/0045-modello-di-esecuzione.md).
It uses its Archivio's [canonical CSN registry](csn.md) through the
[public binding](snapshot-csn.md). It assigns no other CSNs.

<a id="ambito-e-risorse"></a>

## Scope and resources

One registry per Archivio; specialized arrays with fixed capacity `K`, with
`1 <= K <= 65.536`. Request contexts are preallocated and reusable.
The registry retains CSN, generation, deadline, wait limit, and state per
slot. It does not copy documents or hold physical segment references.

`crea-registro-snapshot(csns, K, lifetime-ticks, wait-ticks)` requires explicit,
positive durations with `wait-ticks <= lifetime-ticks`; `csns` is the same
`arcdocdb.csn:registro-csn` used by Archivio writers. The controller translates
configuration into these units; the architectural default lifetime remains
one hour. All `now` values come from the environment's **same monotonic time base**,
are `u64`, and must be sampled anew for each
operation. No global clock, thread, callback, or autonomous timer is created
by the registry. Samples from different threads may arrive out of order;
the registry does not interpret them as clock regression.

The four `u64` arrays and the `u8` state array occupy `33K` bytes of payload,
plus two shared words, objects, headers, and mutex. The context owns two words
for generation and a CSN copy. Exhaustion of `K` rejects registration
before lowering the threshold. Overflow of `now + lifetime-ticks` or
`u64` generation is an explicit rejection, without wrap.

<a id="interfacce"></a>

## Interfaces

| Interface | Contract |
|---|---|
| `crea-contesto-snapshot` | Preallocates the context associated with the registry; no pin acquired. |
| `registra-snapshot(context, now)` | Returns generation, CSN `s`, and activity flag. If not ready, the owner parks the context. |
| `attiva-snapshot(context, generation, now)` | Returns `T` only with `H >= s` and valid deadline, or `NIL` if still waiting. Does not block waiting for commit. |
| `verifica-snapshot(context, generation, now)` | Returns CSN only for an active, unexpired identity; no mutex on the successful path. |
| `verifica-snapshot-in-buffer` | Same guards; writes CSN into one word of the worker's private buffer. Buffer remains intact on rejection. |
| `termina-snapshot(context, generation)` | Removes the pin. Idempotent for the same already ended/expired identity; an old identity does not end a new registration. |
| `scadi-snapshot(registry, now, max-slots)` | Visits at most the configured budget, returns visits and expirations, and advances a circular cursor. |
| `soglia-snapshot`, `deve-trattenere-p` | Mutex-free acquire reads for retention and logical version pruning. |
| `leggi-registro-snapshot` | Consistent counters under mutex, for observability. |
| `invalida-registro-snapshot` | Terminal `FAULTED` state, without waiting; the Archivio boundary uses it after CSN faults. Does not release pins or readers. |

Coordination APIs attempt the snapshot mutex once with `:wait-p nil`.
`:snapshot-busy` and `:csn-busy` require retaining the task and rescheduling it
within its budgets, with fresh time. Busy termination retains the pin
and the obligation to terminate it; a busy timer does not advance the cursor. Reader
checks acquire no mutex.

A **generation** is the context's identity; the **CSN** is the view's
identity. Two snapshots may have the same CSN, including zero on an empty Archivio.
Generation increases without reuse in the registry; it is not a second document
version. Every event and reader retains the original generation.

<a id="registrazione-e-visibilità"></a>

## Registration and visibility

Operation order, under the snapshot mutex:

1. Check context, capacity, generation, and deadline, without mutations.
2. Sample `H` from the CSN registry.
3. Publish `soglia = min(soglia, H)`; **full barrier**.
4. Sample `s = ultimo CSN assegnato` and the new `H` in the same consistent sample.
   On `:csn-busy`, restore only the previous threshold: no pin or identity
   has changed and no generation has been consumed.
5. Invalidate the context and slot to reuse with generation zero; full barrier.
6. Write metadata and state; publish the slot generation first and then
   the context generation, with write barriers.

The snapshot is immediately active if the second sample satisfies `H >= s`;
otherwise it waits. The threshold is already announced during the wait: writers
can retain required versions before the first read.

The controller queues a new task when the horizon advances and calls
`attiva-snapshot`. It does not keep a worker occupied, poll without bounds, or
wake contexts while holding the CSN mutex. Parking lists,
notifications, and request admission remain scheduler
responsibilities; this module exposes the state machine and its bounds.

<a id="letture-riuso-e-barriere"></a>

## Reads, reuse, and barriers

A snapshot read retains the original generation and enters the worker's
epoch. Then:

```text
check snapshot → search index/cache/segment → check snapshot → respond
       └──────────────── same reader epoch ──────────────────┘
```

The final check runs **even on a miss**. An expired view cannot
become a false “not found.” Initial and final time samples
are distinct; reusing the first could hide expiration during lookup.

Validation reads the context generation, slot generation, and metadata;
a read barrier precedes the second check of both generations.
The slot CSN is compared with the context's owned copy. Any
reuse spanning the read invalidates generation before changing fields:
the reader rejects the response without retrying or accessing the new incarnation.

Readers take no mutex, even when they discover inconsistent internal metadata:
they publish only terminal `FAULTED` state and propagate the error. The threshold
read may be conservative and retain more versions; this does not introduce
an incorrect result.

These primitives use SBCL word/u8 accesses on the 64-bit platforms
in [ADR-0017](../adr/0017-piattaforma-e-io.md), with explicit barriers
([SBCL manual](https://www.sbcl.org/manual/#Barriers)). The contract is not extended
to other runtimes or architectures. Local ARM64 disassembly
retains word loads, `DMB ISHLD` barriers, and result writes;
it is static inspection of generated code, without executing the paths.

<a id="retention-scadenza-e-reclaim"></a>

## Retention, expiration, and reclaim

Before updating the index slot with commit `c`, the writer uses
`deve-trattenere-p(registry, c)`: if `soglia < c`, it must retain the replaced
version **before** publication. The initial threshold may remain
below the minimum registered CSN; it is recalculated when pins are removed.
A version with validity end `a` may be removed from retained versions
when `soglia >= a`, still respecting reader epochs.

`MAX-U64` is the threshold without pins. The same value may be a valid snapshot
CSN: at the u64 limit no new commit can exceed it; comparisons remain
correct. The count distinguishes pin presence and absence for metrics.

Maximum lifetime starts at registration, **including the initial wait**.
At `now >= deadline`, the snapshot is expired. A wait reaching its own
deadline produces `resource-exhausted` on activation; an expired active
snapshot produces `snapshot-too-old`. The timer removes expired pins even without
further requests, with a bounded circular scan. A single scan
of `K` slots recalculates the threshold after the group of expirations: not one scan
per snapshot. Timer cadence is the controller's responsibility.

Validation rejects a time-expired context even if the timer has not
visited it yet; until that visit the pin is conservative. Termination and
expiration **do not release physical references** of already admitted readers:
[EBR](../adr/0016-epoch-based-reclamation.md) must protect them until the task
ends: [epoch primitives](epoche-e-reclaim.md) expose entry,
exit, and frontier for segments; the [read context](compiti-lettura.md)
connects entry, snapshot checks, and cleanup. Index/cache and pool boundaries
remain to be integrated. The context is reused only when all old consumers have
finished. This module does not delete segments or index structures.

<a id="guasti-e-stato-della-qualifica"></a>

## Faults and qualification status

Compound transitions use fail-stop cleanup: a nonlocal exit after
mutation begins marks the registry `FAULTED`; no partial metadata rollback
is attempted. Revocation of the provisional threshold on normal `:csn-busy`
occurs before changing identity, slot, or count. Inconsistency in count,
threshold, state, or CSN copy produces a typed error. CSN faults observed
by the adapter invalidate snapshots; those observed by the writer/coordinator
must call `invalida-registro-snapshot` at the Archivio boundary. The owner
isolates the Archivio and repeats recovery; volatile
snapshots do not survive restart.

| Requirement | Implementation introduced | Qualification still needed |
|---|---|---|
| REQ-MVC-004 | Deadline, `snapshot-too-old` error, budgeted timer. | Time boundaries, expiration during lookup, real controller and timer. |
| REQ-MVC-005 | Announcement, capture of `s`, activation only with `H >= s`. | Integrated writer/index/retained versions, FI-11/FI-12. |
| REQ-MVC-007 | Threshold announced before capture, recalculation, and reuse guards. | Real x86-64/ARM64 concurrent orderings, saturation, and u64 generations. |
| REQ-MVC-003, REQ-CMP-007 | Logical pins distinct from reader epochs. | Integrated EBR, pruning, compaction, and reclaim. |
| REQ-AFF-008 | Bounded `K`, deadlines, generations, and timer steps. | Load, timer cadence, and costs under mutex. |

The [evidence catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-snapshot/catalogo.lisp)
retains product-only compilation, static checks, and disassembly,
including the first linter rejection: it mistook the barrier's `(:read)` option
for a `CL:READ` call. Recognition now excludes keywords;
actual `READ` calls remain prohibited. Local commands added or ran no
functional tests, linter self-tests, concurrent tests, or benchmarks.

Requirements remain **designed**. No C1 qualification, coverage,
measured absence of allocations, or MVCC completion is claimed. The buffer interface
avoids returning a Lisp integer for CSN on the intended reader path;
scalability, barrier cost, and allocations still need measurement.
Integration with the single registry has [separate evidence](snapshot-csn.md#evidenze-e-qualifica).

The [snapshot and CSN verification campaign](snapshot-verifica.md) preregisters
functional tests, controlled contention, and targeted mutations. Its results
will be retained separately from this static evidence.
