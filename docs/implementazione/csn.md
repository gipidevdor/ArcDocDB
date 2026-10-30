<a id="csn-di-archivio-e-orizzonte-di-visibilità"></a>

# Archivio CSN and visibility horizon

`arcdocdb.csn` implements the bounded registry from
[ADR-0046](../adr/0046-orizzonte-con-registro-limitato.md). Each Archivio owns
one registry; Serie touch it at closure and resolution of a batch
or multiseries decision. No shared access per document.

| API | Contract |
|---|---|
| `crea-registro-csn :capacity :initial-high :initial-low` | Capacity 1..65536, default 256. Base validated by recovery; no pending CSNs, latest=H=base. |
| `prendi-csn registro` | Returns `slot, high, low`: new positive CSN already registered. Retain all three values together with registry. |
| `risolvi-csn registro slot high low` | After valid publication or cancellation, releases credit. Returns `H-high, H-low`. |
| `leggi-frontiere-csn registro` | Returns `ultimo-high, ultimo-low, H-high, H-low` from a consistent section. |

A CSN is `high × 2^32 + low`; product retains separate words and does
not construct bignums on hot path. Zero identifies a free slot.
Maximum CSN can be assigned once only; next request is rejected
before any change. Tokens are numeric and belong to registry
retained by caller: they are not capabilities for external input. Two Archivi
may assign the same numeric pair; do not exchange their tokens.

<a id="sincronizzazione-e-progresso"></a>

## Synchronization and progress

All fields are private and require Archivio mutex. Each API attempts
acquisition once only, without waiting; `:csn-busy` requires controller to
retain and reschedule task. Do not retry an already-successful assignment when
a later step fails. For `risolvi-csn`, busy preserves token and resolution
obligation. Module creates no workers, callbacks, timers, or parking lists.

A circular search visits at most K slots for assignment; resolution visits
at most K slots to check count and calculate `H=min(pendenti)-1`. If no
pending CSNs remain, `H=ultimo`. Out-of-order completions immediately return
credit and do not increase H past oldest pending CSN. Numeric distance
between latest and H consumes no credit.

Frontier reading uses the same mutex attempt: consistent even
across word carry. GETs without snapshots do not call it.
Atomic reading of H without locks and snapshot wakeup are not exposed by
this block. The [snapshot registry](snapshot-csn.md) uses this public API
to announce threshold before CSN capture, without a second allocator.
Connection has evidence and qualification separate from CSN component.

<a id="condizioni-e-responsabilità"></a>

## Conditions and responsibilities

| Condition/reason | Action |
|---|---|
| `invalid-argument / :csn-config` | Configuration or initial words outside domain. |
| `resource-exhausted / :csn-busy` | No change; retain task for rescheduling. |
| `resource-exhausted / :csn-full` | Batch still open; capacity for actual pending CSNs exhausted. |
| `resource-exhausted / :csn-exhausted` | Permanent u64 exhaustion; never wrap or zero. |
| `invalid-argument / :csn-token` | Type/range/zero, old token, or noncurrent identity; no credit released. |
| `invariant-violation` | Controller must apply fail-stop to Archivio. |

A Serie fault with a CSN in progress does not permit automatic removal:
resolution requires correct publication or cancellation. H is not the durable-byte
frontier. Controller must not acknowledge a commit from resolution alone.

<a id="avvio-e-confini"></a>

## Startup and boundaries

Recovery must collect validated maximum CSN of entire Archivio before
constructing registry and admitting writes. Base cannot change after
construction. [Recovered-CSN queries](recovery-csn.md) provide maxima
of ACTIVE, CLOSED, complete Serie, and decision log; aggregation of entire
Archivio and admission remain to connect. The [WAL bridge](wal-csn.md) now retains segment-batch tokens.
Late Serie opening, controller, and lifecycle require integration;
this API does not authorize concurrent imports with CSNs above base.

The [preregistered method](csn-metodo.md) describes oracles, mutants, and measurements.
[Local results](csn-risultati.md) and [C1 rereading](csn-revisione.md)
preserve component evidence and boundaries.
Component retains volatile state only and introduces no durable atomicity.
