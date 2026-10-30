<a id="controller-della-pubblicazione-di-una-serie"></a>

# Publication controller for a Serie

`arcdocdb.series` adopts batches already closed by the [WAL–CSN bridge](wal-csn.md)
and governs publication, resolution, and retirement. The ring has fixed capacity;
each slot is a preallocated event bound to one controller. The root
is a reference to an immutable view built by the calling index.
The module does not yet build the primary index or a snapshot.

The factory now enforces unique binding on the canonical log;
`trova-controllore-serie` retrieves the reference. Contract, runtime
adoption, and method are in [ACTIVE adoption](adozione-controller-runtime.md).

<a id="protocollo"></a>

## Protocol

1. Create a controller per registry/segment log, with an initial root and
   `:next-offset` of the first batch. The factory allocates all events.
2. Acquire the local lease for the writer slice. No internal waiting:
   busy leaves the work with the caller. Release before migrating the role
   to another thread; generation never restarts or wraps.
3. Seal the batch with the WAL–CSN bridge. Build the new private root
   with the obtained token. `registra-commit-serie` retains batch, token,
   previous/new root, and durability level **before I/O dispatch**.
4. `inizia-io-commit-serie` retains the consumer before handing the
   group to the I/O pool. If delivery is refused, reschedule that task;
   do not repeat registration or I/O entry.
5. After the synchronized coverage message, `pubblica-commit-serie`
   checks event, token, log, coverage, and FIFO before root CAS.
   The written SEAL remains the WAL atomicity point; CAS publishes memory.
6. Resolve the captured token. `:pendente` is only `:csn-busy`: the root
   is already published, the obligation remains in the slot, and retry only resolves.
   H words returned with `:pendente` are zero, not an H measurement.
7. Only after synchronized **I/O COMPLETION**, `completa-io-commit-serie` retires the
   consumer. `:written` is insufficient; the batch must be durable or faulted.
8. After group retirement, `riusa-commit-serie` requires retirement FIFO,
   resolution, retired consumer, and WAL preconditions. It reopens the batch and
   releases slot references, retaining the anti-ABA generation.

The unresolved-CSN cursor is separate from the retirement cursor. In async,
several batches in the same group may publish after write while their
buffers remain protected until flush completion and group retirement.
The new module has no callbacks, syscalls, threads, parking, or retries.

<a id="identità-ordine-e-proprietà"></a>

## Identity, order, and ownership

The message retains **event object and captured generation**. Verification
uses the event's physical identity, original controller, and physical slot;
equal numbers in another Serie are not a valid capability. A generation
read from the event after reuse is not the original message token.

Adoption requires contiguous offset, increasing CSN, and previous root equal
to the last planned root. Full, exhausted generation, and ordinary rejections
precede controller mutation: the caller retains the already sealed
batch and its CSN until successful adoption or failure handling.
Success is not retried. Generation and counters are bounded fixnums;
CSN words remain u32, without materializing u64 on the hot path.

Only one leased writer modifies ring and metadata. The local owner CAS is
touched per slice; the shared registry is still touched per batch. The root
has one CAS per publication and readers use a read barrier.
Roots and the entire reachable graph must remain immutable. A strong
GC reference protects Lisp objects without certifying reclamation of external
buffers, files, or MVCC versions. The controller does not verify root
contents, expected-version, or multiseries intent filtering.

<a id="guasti-e-uscite-incomplete"></a>

## Failures and incomplete exits

Health and scope are encoded in **one word**: healthy, Serie faulted,
or Archivio faulted. The transition never returns to healthy; a local fault does not
reduce a previous Archivio fault. A known I/O failure prevents new
entries/publications while draining already accepted tasks.

A caller-retained dispatch never accepted by the scheduler,
or definitively retired through handoff, may be drained after FAULTED
with `ritira-io-commit-serie`: first cancel the never-written group,
then retire the event's obligation. The buffer must be sealed
without an owning group. This path does not revoke a task and does not
itself certify absence of workers: proof of retirement is a precondition.

WAL adoption and release preflight invariants also make the
controller FAULTED. Internal phase `:pubblicando`, if observed outside
the effect, is an uncertain outcome: the getter signals the invariant and requires
Archivio fail-stop, without returning it as an ordinary public state.

Every local effect acquires explicit ownership. Cleanup releases its
resource; an incomplete exit makes the controller Archivio FAULTED,
retaining references and original cause. It attempts no rollback of root
CAS or the registry. In that situation, the coordinator must stop
**the entire Archivio**: one Serie's controller does not stop the others.
Automatic recovery of a task-abandoned lease is not promised.

`annulla-commit-serie` requires a Serie fault, all I/O tasks retired,
and FIFO order of unresolved entries. On the failure path, a scan of every
slot (at most 1024) rechecks quiescence beyond the counter. Only then
does it mark the log terminal and cancel the captured token. Busy retains the obligation.
At Archivio scope, automatic cleanup is refused; no faulty buffer
is reopened and no file is deleted.

<a id="verifica-e-confini"></a>

## Verification and boundaries

[Method](controller-serie-metodo.md), [decisions](controller-serie-decisioni.md),
and [second reading](controller-serie-revisione.md) define local test
scope. Pool, notifications/scheduling, client acknowledgments, concrete index,
snapshot registration, and multiseries coordinator remain separate
integrations. No whole-engine requirement is promoted by this block.

[Local results](controller-serie-risultati.md): integrated check, conditions,
coverage, mutations, serial/parallel measurements, and preserved diagnostics.
