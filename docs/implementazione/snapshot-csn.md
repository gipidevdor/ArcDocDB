<a id="un-solo-registro-csn-per-archivio"></a>

# One CSN registry per Archivio

<a id="contratto-e-ambito--2026-10-09"></a>

## Contract and scope — 2026-10-09

Writers and snapshots of the same Archivio use **the same**
`arcdocdb.csn:registro-csn`. The
[`snapshots-csn.lisp`](../../src/mvcc/snapshots-csn.lisp) adapter uses only
`leggi-frontiere-csn`, without reading private component fields, slots, or mutexes.
The registry and its `main` API remain unchanged. This branch's first CSN
implementation was [retired](orizzonte-csn.md).

[ADR-0046](../adr/0046-orizzonte-con-registro-limitato.md),
[ADR-0038](../adr/0038-orizzonte-di-visibilita.md), and
[ADR-0045](../adr/0045-modello-di-esecuzione.md) do not change. Integration is C1:
REQ-MVC-005, REQ-MVC-007, REQ-CON-004, REQ-AFF-004, REQ-AFF-008;
INV-M1, INV-M2, INV-M4, INV-P5, and INV-A8. Requirements remain designed.

<a id="cattura-contesa-e-pubblicazione"></a>

## Capture, contention, and publication

The controller builds the CSN registry from the recovered base, assigns it
to writers, and passes the same object to `crea-registro-snapshot`. No other
registry assigns versions for this Archivio.

To register a snapshot:

1. Try the snapshot mutex only once; on contention, `:snapshot-busy`
   before any change. Recursive acquisition is also rejected.
2. Validate capacity, reuse, generation, and deadline.
3. Read `H0` from the CSN API: `:csn-busy` here changes no snapshot data.
4. Retain the old threshold and publish `min(vecchia, H0)`, with a full barrier.
5. Capture last CSN `s` and new horizon `H1` from **one coherent sample**.
6. Check `H0 <= H1 <= s`, invalidate old identities, and publish
   metadata, pin, and generation. Active only if `H1 >= s`; otherwise waiting.

In step 5, ordinary `:csn-busy` restores the old threshold before propagating
the rejection. Context, slot, generation, count, and cursor have not yet
changed. The provisional threshold may have caused the writer to retain
additional versions: this is conservative. Its revocation preserves protection
of previous pins and does not revoke a created snapshot, because no new
identity has been published. A new attempt uses fresh time and captures a new CSN.

Revocation concerns **only the provisional threshold** on that recognized
contention. Nonlocal exit, corruption, or unexpected error after announcement
make the snapshot registry `FAULTED`; partial metadata publication is not
rolled back. An interruption after publication and before delivery to the
caller is conservatively a fault to isolate.

<a id="coordinamento-senza-attese"></a>

## Coordination without waits

Registration, activation, termination, timer, and diagnostics use
`with-mutex :wait-p nil`. The local acquisition flag distinguishes a body
returning `NIL` from a busy mutex. The runtime handles release on nonlocal
exit. No synchronization macro or callback API is introduced; bodies remain
in coordination functions.

| Rejection | Preserved state and controller action |
|---|---|
| `:snapshot-busy` | No mutation; retain and reschedule the task. |
| `:csn-busy` before announcement | No snapshot mutation. |
| `:csn-busy` after announcement | Threshold restored; no identity or credit consumed. |
| Activation with `:csn-busy` | Pin and waiting state retained. |
| Termination with `:snapshot-busy` | Pin and obligation to terminate it retained. |
| Timer with `:snapshot-busy` | No visit or cursor advancement. |

Order remains snapshot → CSN. Writer and coordinator must release the CSN
mutex before enqueueing activations/notifications. The module implements no
queues, wakeups, or autonomous timers. The controller applies budgets and
deadlines; none of the APIs retries internally.

Conversion of four u32 words into two u64s is confined to snapshot coordination.
It does not appear in current GET or reader verification. The u64 values
returned by coordination may require boxing beyond fixnum range: zero heap
is not claimed for registration. Capacity and scans remain bounded; the
lookup path uses the already defined preallocated contexts and buffers.

<a id="propagazione-dei-guasti"></a>

## Fault propagation

`invalida-registro-snapshot` publishes only terminal `FAULTED` state,
without a mutex, reset, or touching logical pins or physical readers.
This write is monotonic; maintenance and readers do not restore `:open`.
The trusted Archivio boundary calls it after a CSN registry fault observed
in a writer or coordinator and isolates the domain. Frontier conversion
catches only `invariant-violation`, invalidates snapshots, and rethrows
**the same** condition. It does not interpret the fault as contention.

Readers sample snapshot health with existing guards, without consulting
private CSN fields. Discovering inconsistent metadata publishes the same
terminal state without waiting for the mutex. Registration rechecks health
after publication before returning success. Invalidation does not delete
versions or segments and does not cancel a live worker's EBR announcement.
Effective Archivio isolation remains to be connected to the future executable
engine boundary.

<a id="decisioni-da-coprire--cod-54"></a>

## Decisions to cover — COD-54

| ID | Decision or transition | Required distinctions |
|---|---|---|
| CSN-S01 | Frontier progress | `H0 <= H1` and `H1 <= s`, separately; u32 carry and maximum u64. |
| CSN-S02 | Capture after announcement | Success; `:csn-busy`; other `resource-exhausted`; CSN fault; nonlocal exit. |
| CSN-S03 | Threshold revocation | No previous pin; previous pins; writer that saw provisional threshold; no identity consumed. |
| CSN-S04 | Mutex acquisition | Body with `NIL` value; contention; recursion; interruption while mutex owned. |
| CSN-S05 | Concurrent fault | Before/during/after capture or publication; active reader; repeated invalidations. |

Previous snapshot registry decisions still need coverage. This table
claims no tests or coverage achieved.

<a id="evidenze-e-qualifica"></a>

## Evidence and qualification

The [dedicated campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-snapshot-csn/README.md)
retains product-only compilation, lint, traceability, links, catalog checking,
and static disassembly, including failed attempts. A Git blob comparison
checks that the eight moved initial reports match `10d08ec` and the two
canonical CSN sources match `673987a`. It does not execute product functions.
No functional tests, concurrent tests, fault injection, models, benchmarks,
or tool self-checks are added or run locally.

[CSN registry](csn-risultati.md) tests cover its scope: they do not demonstrate
this connection. Contention/revocation verification, ARM64/x86-64 interleavings
with retention and invalidation, allocation/latency measurements, and writer,
index, timer, and pool integration remain open.

The [snapshot and CSN verification campaign](snapshot-verifica.md) preregisters
functional cases, contention, and adapter injections; results remain to be
observed and do not change this static snapshot.
