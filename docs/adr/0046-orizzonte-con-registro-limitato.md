<a id="adr-0046--orizzonte-con-registro-limitato-dei-csn-in-volo"></a>

# ADR-0046 — Horizon with a bounded registry of in-flight CSNs

- **Status:** Accepted
- **Date:** 2026-10-08
- **Relationship to the specification:** no amendment; corrects item 2 of
  [ADR-0038](0038-orizzonte-di-visibilita.md). Snapshots, version ordering, and CSNs remain.
- **References:** [SPK-07](../../spikes/SPK-07-protocols/README.md), INV-M4, INV-M6,
  REQ-MVC-008, RSK-05

<a id="controesempio-eseguibile"></a>

## Executable counterexample

Credit based only on pending commits does not bound the distance between the latest CSN and the horizon.
With a four-word ring and at most two pending commits:

```text
acquire 1, acquire 2, publish 2,
acquire 3, publish 3, acquire 4, publish 4,
acquire 5, publish 5, publish 1
```

Publishing 5 uses the position that later contains 1. In the end there are no pending commits,
but `H=4` and `ultimo-CSN=5`: snapshots cannot be created. The explorer finds the path
in ten transitions; the pending-commit limit is respected in every state.

<a id="decisione"></a>

## Decision

1. **Preallocated registry of in-flight CSNs only**, configured capacity `K`, proposed default
   256. Zero indicates a free slot. Each batch or decision retains its slot index.
   An array is no longer indexed by `csn mod N`.
2. **Indivisible assignment and registration**, under the horizon mutex: reserve
   a free slot, increment the latest CSN, and register it before releasing the mutex.
   No publication can advance `H` past an assigned but unregistered CSN.
3. **Publication or cancellation**: under the same mutex, verify CSN identity,
   free its slot, and set `H=min(CSN in volo)-1`; if the registry is empty,
   `H=ultimo-CSN`. Finding the minimum visits at most `K` words. `H` does not decrease.
4. **Capacity exhausted**: the batch stays open or the request is parked according to
   [ADR-0045](0045-modello-di-esecuzione.md), with bounded bytes and time. Credit returns
   when that commit is published or canceled; distance from `H` does not consume credit.
5. **64-bit exhaustion**: explicit rejection before incrementing, never wraparound. The value
   of `K` and the cost of two critical sections per batch are to be measured in SPK-04.

Coordination remains per batch, decision, or snapshot. Readers without snapshots read
without taking the mutex. The registry is an entry in the Archivio's already-shared list;
frequency rises from one to two critical sections per batch.

<a id="alternative"></a>

## Alternatives

- Ring with credit based on `ultimo-CSN-H`: correct in the small model, but a slow commit
  consumes the window even after the others finish. The registry retains the
  limit on genuinely pending commits.
- Heap of in-flight CSNs: cheaper minimum lookup, with more structures to maintain.
  Introduce it only if SPK-04 measures the registry as a scalability limit.

<a id="verifica-e-limiti"></a>

## Verification and limits

SPK-07 explores up to six CSNs with capacity two: the registry does not skip pending commits and,
when all finish, reaches the latest CSN. The original variant must fail.
This is verification of a finite model with sequentially consistent memory; implementation barriers
and synchronization remain to be tested on real threads.
