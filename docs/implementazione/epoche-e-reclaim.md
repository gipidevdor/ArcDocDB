<a id="epoche-e-reclaim-dei-segmenti"></a>

# Epochs and segment reclamation

[`src/epochs/`](../../src/epochs/) introduces a per-Archivio EBR domain from
[ADR-0016](../adr/0016-epoch-based-reclamation.md), scope clarified by
[ADR-0043](../adr/0043-primary-index-a-frammenti.md) and
[ADR-0045](../adr/0045-modello-di-esecuzione.md). It protects removed-segment
descriptors/files; Lisp directories/fragments remain the collector's responsibility.

<a id="risorse-e-proprietà"></a>

## Resources and ownership

`crea-registro-epoche(W, K)` preallocates the entire domain:

- `1 <= W <= 4.096`: shared ceiling for compute/I/O workers that may
  read this Archivio. IDs are distinct across both pools.
- `1 <= K <= 65.536`: tickets/strong references to segment descriptors under
  maintenance. Every reservation holds credit until cancellation/reclaim.
- One `u64` announcement per worker: zero inactive, positive
  epoch. Used words **128 bytes** apart, with leading/trailing padding.
  No 128-byte array-base alignment is assumed; words 128 bytes
  apart share no 64/128-byte cache line.
- `u64` generations/epochs, `u8` states, reference arrays/canonical tickets.
  Retirement numeric fields occupy `17K` bytes; announcements `128(W+1)` bytes.
  Add common words, reference vectors, contexts, headers, mutex.

`contesto-epoca(registry, worker-id)` always returns the same preallocated
context. The controller assigns the ID to **one live worker only**. Reuse
requires completed tasks/join of previous worker; two threads
cannot use the same slot. The pool controller owns this constraint:
the module identifies no threads through global variables.

A worker writes only its own announcement. It reads epoch `E` without modifying it.
Maintenance modifies `E`, tickets, counters, threshold under per-Archivio
mutex once per segment/retirement group. No successful GET takes
the mutex; no request increments a shared counter.
`E`/threshold words are 128 bytes from numeric counters updated during
reservation.

<a id="ingresso-e-uscita-del-reader"></a>

## Reader entry and exit

`entra-epoca(reader)` has **one attempt only**:

1. Check health/inactive slot.
2. Read `E = e` with read barrier.
3. Publish `e` in exclusive slot; full barrier.
4. Reread `E`/health before any root/location/descriptor.
5. If epoch changed, clear slot, return `NIL`.
6. If still `e`, return `T`: task may read.

On `NIL`, the controller requeues the task under admission budgets/request
deadline. The module neither waits, retries internally, nor
keeps the section open during requeue. `E` regression
causes fail-stop; zero is never a valid current epoch.

[Read context](compiti-lettura.md) installs task cleanup
before entry, allows lookup only after `T`, calls `esci-epoca`
after final access. Owner-only `epoca-attiva-p` also covers
interruption between confirmation and `entra-epoca` return; it does not authorize
dereference. Exit executes a full barrier before publishing
zero. This is allowed even after `FAULTED` for worker cleanup.
Nested entry/exit from inactive slot are `invalid-argument`.

```text
entra-epoca = T
  → check initial snapshot, if present
  → root / index / cache / segment
  → final index and snapshot check, including on miss
  → esci-epoca
  → send response
```

An I/O-pool task may read disk inside its own epoch.
Migration first ends the section, then restarts from the beginning on another
worker: no location, descriptor, or epoch crosses
the queue. Network operations, parking, and callbacks do not run inside the section.

<a id="ticket-di-ritiro"></a>

## Retirement tickets

Maintenance obtains a ticket **before removing references**:

| Interface | Contract |
|---|---|
| `prenota-ritiro(registry, resource)` | Retains canonical descriptor, returns ticket/original generation. Reserves slot and one `E` increment. |
| `annulla-ritiro(ticket, generation)` | Before any reference removal only; releases credits. Idempotent for same canceled identity. |
| `pubblica-ritiro(ticket, generation)` | After completed relocation and removal of index/retained-version references, records `r = E`, advances `E`. |
| `aggiorna-soglia-reclaim(registry)` | One scan of `W` announcements updates acquired frontier for multiple tickets. |
| `acquisisci-reclaim(ticket, generation)` | Returns `T` only for `r < soglia`; assigns sole reclaim owner. Otherwise `NIL`. |
| `leggi-risorsa-ritiro(ticket, generation)` | Returns retained strong reference; does not grant descriptor-close rights. |
| `completa-reclaim(ticket, generation)` | Only after successful close/removal under manifest proof; releases reference/credit. Idempotent for same completed identity. |
| `leggi-ritiro`, `leggi-registro-epoche` | State, epoch, threshold, occupancy for observability, under mutex. |

Ticket state machine:

```text
RESERVED → RETIRED → CLAIMED → COMPLETED
    └─────────────────────→ CANCELLED (only before swap)
```

`leggi-ritiro` exposes states as keywords. A ticket is a canonical object
with a fixed slot; an increasing nonwrapping **generation** identifies an individual
retirement. Every event retains the generation from `prenota-ritiro`. An old-generation
event does not change a reused ticket. A second claim is
rejected: two tasks cannot acquire the same resource simultaneously.
The register rejects a canonical descriptor already present; Segment Manager
must guarantee one descriptor identity per file.

I/O error after claim leaves ticket/resource `CLAIMED`: same
owner may retry idempotent I/O completion. Credit is not
returned by a timer/timeout. Generations distinguish reuse/late
events, not a substitute for scheduler-assigned task ownership.

<a id="frontiera-e-barriere"></a>

## Frontier and barriers

`E` starts at one, monotonic. Publishing retirement requires:

```text
remove references → full barrier → r = E; E = E + 1 → full barrier
```

Reader scan, serialized against retirements, uses `E` as upper
bound, computes `m = min(E, observed nonzero epochs)`. Full barriers
precede scan/threshold publication. A ticket is reclaimable
only with **strict** comparison `r < soglia`.

Threshold retains `max(soglia precedente, m)`: a worker may sample
an old `E` and announce after the scan, but confirmation rejects it
before resource access. A transient announcement does not undo
the already acquired frontier. An admitted old-epoch reader must instead
be observed before the frontier passes it. Never expire/clear
a still-live worker slot to force reclaim.

Reading new `E` follows publication of reference
removal; the reader consults the root only after confirmation. This
sequence links admission/retirement. Scanning slots alone without
entry/retirement barriers is insufficient.

Primitives from [SBCL manual](https://www.sbcl.org/manual/#Barriers)
on 64-bit platforms of [ADR-0017](../adr/0017-piattaforma-e-io.md).
Inspection of [Crossbeam protocol](https://github.com/crossbeam-rs/crossbeam/blob/master/crossbeam-epoch/src/internal.rs)
informed review of announcement/scan barriers; no Rust
code was imported and no equivalence between implementations was assumed.

<a id="esaurimento-guasti-e-persistenza"></a>

## Exhaustion, faults, persistence

Every reservation also reserves an epoch increment: invariant
`E + reserved <= MAX-U64`. The budget is checked **before swap**,
so `pubblica-ritiro` cannot discover overflow after reference removal.
Cancellation returns budget; publication consumes it. Exhausted
generation/full capacity produces `resource-exhausted` without wrapping.

Compound transitions use fail-stop cleanup. A nonlocal exit during
mutation marks the domain `FAULTED`; counters, identities, metadata remain
checked. The owner isolates the Archivio. No reclaim continues in
a faulted domain; already admitted readers may still exit.

EBR/tickets are **volatile**. After a crash, they are rebuilt from the manifest/
segments without restoring old epochs/contexts. `pubblica-ritiro` is not
a durable atomicity point. Reclaim admission proves reader absence
only: deletion I/O also requires manifest-removal proof
([REQ-AFF-018](../tracciabilita/matrice.md)) and an I/O-pool task.
The register neither closes descriptors nor deletes files.

Worker loss may leave a conservative pin. Read context now
has cleanup between admission/delivery to caller;
the worker boundary must install it before entry and finish
the task. A thread that may still read cannot be declared inactive.
Monitoring/join/failure handling remain to be integrated.

<a id="tracciabilità-e-qualifica"></a>

## Traceability and qualification

<a id="decisioni-composte-da-coprire"></a>

### Compound decisions to cover

The table identifies introduced decisions, not coverage.
Every condition requires an independent case beyond the successful path.

| ID | Function | Conditions |
|---|---|---|
| EBR-D01 | `crea-registro-epoche` | `W` in range and `K` in range, before allocation. |
| EBR-D02 | `verifica-contatori-epoche` | `reserved <= count <= K`, cursor in range, `1 <= soglia <= E`, advancement credits without overflow. |
| EBR-D03 | `esigi-identita-ritiro` | Slot in range, positive generation, equality to ticket generation. |
| EBR-D04 | `verifica-slot-ritiro` | Assigned generation; RESERVED with zero epoch/resource; RETIRED/CLAIMED with `0 < r < E`/resource; CANCELLED zero epoch/no resource; COMPLETED `0 < r < E`/no resource. |
| EBR-D05 | `prenota-ritiro` | Generation exhaustion or exhaustion of `MAX-U64 - E - reserved`. Capacity/duplicate distinct rejections. |
| EBR-D06 | `pubblica-ritiro` | Positive reserved credit and `E < MAX-U64`, after verified state/identity. |
| EBR-D07 | `trova-slot-ritiro` | Occupied state RESERVED through CLAIMED; `EQ` resource identity; free-slot choice or accounting error. |
| EBR-D08 | `leggi-risorsa-ritiro` | State RESERVED through CLAIMED and strong reference present. |

Protocol boundaries also require: reader suspended before/after
announcement, `E` change before confirmation, exit before/after scan,
old announcement arriving after threshold advancement, duplicate claim,
late event on reused slot, I/O error, worker interruption. Open
verification obligations, not scenarios run by this change.

| Requirement | Introduced portion | Remaining integration/verification |
|---|---|---|
| REQ-CMP-005 | Readers independent of maintenance mutex, single-attempt entry. | Real reads during CLEAN/MERGE, barrier costs. |
| REQ-CMP-007 | Epochs, strong references, exclusive claim after frontier. | Segment Manager, index/retained versions, FI-09/FI-11. |
| REQ-AFF-008 | Fixed slots/tickets, bounded scans, u64 credits before swap. | Saturation, u64 boundaries, stopped workers, pool integration. |
| REQ-AFF-004 | Typed errors, fail-stop interrupted mutations. | Interruptions in every transition, Archivio fault handling. |

Requirements remain **designed**. Product-only compilation, static
checks, and disassembly do not qualify the concurrent protocol. No
functional tests, stress, fault injection, module benchmarks were
added/run locally. Remaining: x86-64/ARM64 weak memory, measured
allocations/performance, durable-reclaim integration.
[Original records](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-ebr/catalogo.lisp)
preserve sources, commands, outputs, including script text
printing disassembly without executing inspected functions.

[Functional campaign of 2026-10-11](lettura-verifica.md) adds
EBR/read-task suites, targeted mutants, partial coverage.
The method distinguishes preregistration from execution results.
