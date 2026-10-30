<a id="compiti-di-lettura-epoche-snapshot-e-cleanup"></a>

# Read tasks: epochs, snapshots, and cleanup

<a id="ambito"></a>

## Scope

`arcdocdb.read` connects the [snapshot registry](registro-snapshot.md) to the
[EBR domain](epoche-e-reclaim.md) for a task's duration. Implements the
boundary planned by [ADR-0045](../adr/0045-modello-di-esecuzione.md), without
changing snapshot or segment protocol.

Module is included in product system. It does not yet consult a primary
index, cache, or segment; it is not a complete GET. Byte
verification remains `arcdocdb.record:verifica-put`'s responsibility, including prepared
OUTCOME proof under [ADR-0047](../adr/0047-verifica-csn-dei-record-prepared.md).
A read context protects access; it does not attest record contents.

Class C1. Affected requirements: REQ-CON-004, REQ-CMP-005, REQ-CMP-007,
REQ-MVC-004, REQ-MVC-005, REQ-AFF-004, and REQ-AFF-008. Remain `:progettato`.
Invariants: INV-P5, INV-A8, INV-C10, INV-R1, INV-M1, and INV-M4.

<a id="proprietà-e-memoria"></a>

## Ownership and memory

Controller creates **one context per Archivio worker slot**, before
pool startup, passing canonical EBR reader and snapshot registry
of the same Archivio. Both registries have independent identities: pairing
is controller responsibility, not inferred from read data.
Compute and I/O worker IDs must be distinct in EBR domain.

Context contains immutable bindings, a temporary snapshot
reference, and four private u64 words: expected generation, initial CSN,
initial time, and rechecked CSN. Words are zeroed at cleanup.
It retains no roots, locations, descriptors, data buffers, or results.

Capacity is that of domain workers, without per-document
or per-request structures. Only shared write is worker's EBR announcement;
snapshot checks read registry. No global queue, mutex,
timer, callback, thread creation, or system call on successful
path. Cleanup visits exactly four words; EBR entry is a
single attempt. Registry error paths may take a mutex.

Buffers and CSN-check functions are specialized and inline to
avoid a boxed u64 return on intended path. This is an implementation
constraint: nonallocation and actual cost require measurements.

## API

| Function | Contract |
|---|---|
| `crea-contesto-lettura(reader, snapshots)` | Controller preallocation; already-active reader rejected. |
| `avvia-lettura(ctx, snapshot, generazione, now)` | `T`: epoch confirmed and snapshot checked if applicable. `NIL`: epoch changed, no access allowed; requeue within request budget/deadline. |
| `copia-limite-lettura(ctx, buffer, indice)` | `T`: snapshot CSN copied. `NIL`: current GET, buffer intact. Lookup must check boolean and select appropriate version. |
| `concludi-lettura(ctx, now)` | After lookup, **including on miss**: rechecks snapshot and time, then releases EBR. Only normal return permits delivering private result. |
| `abbandona-lettura(ctx)` | Cleanup without authorizing results; idempotent when inactive. Discard all locations before migration. |
| `stato-contesto-lettura(ctx)` | Owner-local diagnostics; does not synchronize a controller with a live worker. |

Current GET: `snapshot=NIL`, `generazione=0`. With snapshot: original
positive identity and registry identical to context's. A snapshot
from another Archivio is rejected before EBR announcement. Generation, state,
CSN, and deadline are then checked by registry inside epoch.

`now` is fresh, monotonic, and in snapshot-registry units.
Final check rejects a value lower than initial; it cannot
detect caller reuse of a stale timestamp. Time
source remains injectable and caller responsibility.

<a id="confine-del-compito"></a>

## Task boundary

Worker installs `unwind-protect` **before calling `avvia-lettura`** and
always calls `abbandona-lettura` in cleanup. This also covers nonlocal
exit after admission and before function return. Installing
protection only after receiving `T` is insufficient.

1. Start without having read index, root, location, or descriptor.
2. If `NIL`, end task and requeue original request within
   its budget. No internal context retry.
3. If `T`, select CSN, consult index and retained versions,
   recheck root/generation even on miss (ADR-0050), verify
   bytes, and copy any response into request-private memory.
4. Call `concludi-lettura` with fresh time. If it fails, discard even
   negative result; no response allowed.
5. After normal return, end task and deliver private
   response to network layer outside epoch.

On cache miss in compute pool, leave section and discard
location **before** queuing request to I/O pool. Context
stays in worker; new task enters its own reader and restarts from
lookup. I/O pool permits `pread` inside section; network,
parking, or waiting for other tasks are not allowed.

Context provides neither pool adapter nor continuation and cannot
prevent a caller from delivering a result too early. Future
executable engine boundary must follow this sequence.

<a id="stati-errori-e-interruzioni"></a>

## States, errors, and interruptions

| State | Transition |
|---|---|
| `:idle` | Input validated without touching EBR; entry → `:entering`. |
| `:entering` | Successful EBR and snapshot confirmation → `:active`; epoch change or recoverable error → cleanup and `:idle`. |
| `:active` | Completion or abandonment → cleanup and `:idle`; invariant error → `:faulted`. |
| `:faulted` | Cleanup permitted; context remains unusable. No automatic reset. |

Cleanup first sets `:faulted`, checks only its own reader's
announcement, releases it, and zeroes data. Restores `:idle` only when everything
has finished and context was not already faulted. Interruption midway
retains `:faulted`; controller may complete cleanup only after
task completion or worker join, never clear a live reader.

`epoca-attiva-p` serves owner cleanup: observing an announcement
does not authorize resource dereference. It also allows releasing the
window where `entra-epoca` confirmed pin but has not yet returned
boolean to context. Entry rejects an already-active reader before
installing this cleanup, avoiding release of a preexisting section.

Registry conditions (`snapshot-too-old`, `resource-exhausted`,
`invalid-argument`, `invariant-violation`) remain typed and are neither
caught nor hidden. Nesting and use outside permitted state are
rejected. Internal inconsistency makes context `:faulted`; future worker
boundary must isolate affected Serie or Archivio and record
fault. That propagation is not yet integrated.

Logical snapshot expiry does not release a live task's EBR pin.
Final check rejects expired result; pin protects physical
access until last use. Ending a read does not end snapshot,
which may be shared by multiple Archivio requests.

<a id="decisioni-da-coprire--cod-54"></a>

## Decisions to cover — COD-54

| ID | Decision | Conditions to distinguish |
|---|---|---|
| READ-D01 | Inactive without residues | Null snapshot reference and each of four words zero. |
| READ-D02 | Input snapshot identity | Positive generation; equal registry. |
| READ-D03 | Active snapshot association | Positive generation; equal registry. |
| READ-D04 | Active current mode | Zero generation; zero initial CSN. |

Other simple decisions to exercise include nesting,
already-active announcement, epoch change, pending/ended/expired snapshot,
invalid buffer index, time regression, mismatched final CSN,
interruption during entry/completion/cleanup, and migration between workers.
Dedicated registry decision tables also apply.

<a id="evidenze-e-lavoro-restante"></a>

## Evidence and remaining work

The [2026-10-09 campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-read-task/README.md)
preserves product-only compilation, static checks, traceability,
links, catalogs, and ARM64 disassembly. No read function is
executed by campaign; no functional or concurrent tests,
fault injection, benchmarks, or tool self-checks were added or run.

Primary index, retained versions, cache, record reading,
and pool boundary remain to integrate. Qualification requires exercising decisions,
interruptions, and expiry/reclaim races, verifying migration on real
workers, and measuring allocation/latency on ARM64 and x86-64. Compilation and CI
of existing tests do not close these criteria.

The [functional campaign dated 2026-10-11](lettura-verifica.md) adds
EBR and read-task suites, targeted mutants, and partial coverage.
Method distinguishes preregistration from execution results.
