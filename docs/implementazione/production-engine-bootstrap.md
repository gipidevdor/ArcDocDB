<a id="m1--single-series-durable-core"></a>

# M1 — Durable core for one Serie

Milestone [Production Engine Bootstrap](https://github.com/gpicchiarelli/ArcDocDB/milestone/1).
The [preregistered method](production-engine-bootstrap-metodo.md) focuses work
on the existing path, without new full-text functionality or a parallel roadmap.

<a id="ingresso-di-produzione"></a>

## Production entry point

```lisp
(arcdocdb.engine:apri-motore directory archive-uuid series-uuid
 :create t :clock #'get-internal-real-time)
;; Returns only a READY engine; otherwise signals a condition.
```

The private directory must exist. `:create t` is explicit initialization,
allowed only when empty; normal opening does not create missing files
or overwrite existing storage. Each of the two UUIDs consists of sixteen octets,
which are copied and compared with the canonical headers. Only one serial I/O actor
owns the handle and all FDs: no calls from another thread or reentry
during a request, including from observation callbacks.

Nonblocking advisory exclusion is acquired on the directory FD before
observing or mutating storage and lasts until the FD is closed. All M1 writers
must use it; it does not protect against hostile processes that ignore flock
or external replacement of path ancestors. The private directory and
absence of external mutators remain preconditions.

`apri-motore` owns the entire cycle:

1. Configuration, private resources, parent opening, and exclusive lock.
2. Optional initialization with ACTIVE/CONTROL preparers and canonical decision log headers.
3. Complete CONTROL and inventory, owned read-only sources, semantic readers,
   and Archivio/CSN gates before effects.
4. Completion of names already decided, fresh ID from the planner, and a new
   durable ACTIVE. The existing publisher renames CONTROL and synchronizes the
   parent: this remains the atomicity point of Serie recovery.
5. New canonical reading, unchanged maximum CSN, all names completed.
6. Canonical runtime at M, CLOSED maps of the same FD, replay of the private
   index, adoption of the new ACTIVE, and complete GET root.
7. Only then READY: no gate simulated in the test or future transport.

The new ACTIVE is prepared in the recovery view, requested by the CONTROL
publisher. After the decision, the runtime wrapper rereads the same header/FD,
retains the log and physical association, and uses the canonical registry of
the new scope. No file is prepared twice or reopened for writing. Previous
sources and FDs remain owned until close.

<a id="richieste-e-conferma"></a>

## Requests and acknowledgment

```lisp
(arcdocdb.engine:scrivi-documento engine key encoded-value) ; CSN u64 strong
(arcdocdb.engine:leggi-documento engine key output :start 0) ; :found/:absent, byte
(arcdocdb.engine:cancella-documento engine key)              ; tombstone strong
(arcdocdb.engine:chiudi-motore engine)
```

Keys and values are bytes of canonical frames. The M1 persistence core
adds no Query Engine, CBOR extraction, or application document validation.
The Unix session must apply its document contract before admission.
The core introduces no alternative decoder or format.

`leggi-documento-con-versione` returns status, copied byte count and verified
current CSN (`0` for absence). `scrivi-documento-se-versione` and
`cancella-documento-se-versione` compare the expected u64 token with the current
live version and return `:applied/new-strong-CSN` or `:conflict/current-live-CSN`.
Expected zero tests absence; positive tokens prevent stale overwrites even
after delete/reinsert. Conflicts precede maintenance and WAL effects. These
single-operation conditions reuse the serial writer, not transaction write sets
or historical MVCC. The original GET still returns exactly two values.
[Contract](../adr/0085-conditional-current-writes.md).

The writer reuses batch, group, and scratch. Format/capacity preflight precedes
the CSN, including load, key arena, slot credit, and index revision.
Canonical preflight does not mutate the index or reserve concurrent resources:
it applies to the sole M1 owner, without another mutator until application.
A predictable index limit leaves READY, CSN, and files unchanged;
admissible updates and tombstones remain usable, including after reopen
with the same budgets. DELETE does not reclaim bytes from the append-only arena.
An index health failure or invariant violation instead closes admission even when
detected in preflight; the cause is preserved, with no append or CSN consumption.
SEAL, write, flush, canonical root publication and CSN resolution, index, and
reference retirement follow. Acknowledgment is issued only at the end.
Publishing the root before updating the index is correct only with the serial M1
actor: concurrent GETs and historical MVCC are not exposed. Losing the response can leave an unknown
outcome; there is no automatic retry.

Replay traverses only CLOSED prefixes verified by the existing APIs,
requires strictly increasing ordinary CSNs, and includes tombstones.
A conflict or corrupt data closes bootstrap. The maximum does not derive
from segment IDs, offsets, or CONTROL stamps. The inspection's zero CSN
context has no writer: the only operational registry is the one created by
the final plan.

<a id="errori-risorse-e-limiti-m1"></a>

## Errors, resources, and M1 limits

The engine rejects requests during startup and recovery and while faulted or
closed. An incomplete admitted request makes the engine FAULTED and retains the cause, without acknowledgment,
rollback, or reuse of uncertain buffers. Close shuts admission before releasing resources;
cleanup attempts each set and FD once, with the parent last. Secondary errors are
retained; startup failure aggregates any cleanup errors without losing the primary
error. The owner thread is not canceled asynchronously; SIGKILL terminates
the process and the kernel releases descriptors/locks.

Existing segments are always read-only. Tails without SEAL, orphan temporaries,
and unpublished CONTROL files are retained; observed IDs are not reused.
An existing `control.log.tmp` is moved to a distinct name without replacing
an existing target, then the parent is fsynced. An unexpected final file is a
blocking anomaly: it is not deleted. Orphan garbage collection is not
implemented; an exhausted budget requires explicit intervention, without silent loss.

M1 configures exactly one Serie and a decision log without DECISION; it does
not discover the multiseries catalog. Prepared records and locations beyond u32
are rejected. Canonical compaction outputs and REMOVED are verified and completed
at startup. The format remains v1/v2; this is an entry point
restriction, not a change to the u64 storage types. Each reopen prepares a new
ACTIVE. [Live rotation](../adr/0076-rotazione-live-m1.md) connects canonical
checkpoint publication to normal PUT/DELETE before the next data CSN. Byte or
record saturation prepares a fresh ACTIVE while retaining the runtime registry,
primary index and current-read semantics. Total segment capacity remains bounded;
current-only compaction reclaims obsolete bytes; concurrent snapshot reclamation
remains separate work.

Defaults: 16 MiB file, 64 KiB frame, 64 segments, 65,536 records per file,
index capacity 4096, and 1 MiB key arena. These budgets are configurable and checked
without clamping. They are neither final format limits nor performance
measurements. Startup, index, roots, and runtime may allocate; optimizations,
heap/GC budgets, and complete COD-30 qualification remain outside M1.

<a id="verifica-del-percorso-reale"></a>

## Verification of the real path

The existing campaign remains separate from the new production suite:

- `tools/vertical-crash.lisp --self-test`: 18 scenarios, 71 processes,
  26 intentional SIGKILLs and two negatives, with a summary derived from events.
- `tools/engine-crash.lisp --self-test`: uses only engine opening and requests
  in children; no checkpoint, replay, ID selection, or CSN reset in the test.
  Two SIGKILLs and restart for v1/v2, plus crashes during recovery,
  incomplete tail, declared errors, admission, and a negative oracle.

Commands go through the recorder. Tests and diagnostics are separate from
benchmarks, C1/MC/DC qualification, power loss, unexecuted Linux, and permanent
disk failures. P3 now uses the [production Unix service](production-unix-m1.md)
on this qualified cycle; the SPK-11 PING model remains an experiment.

<a id="evidenze-del-nucleo"></a>

## Core evidence

The [report with originals and structured summaries](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-22-production-engine-bootstrap/report.md)
links tests to source `73436eac`: 2164/2164 cases in 51 suites without
exclusions, 15 engine tests, 80 primary index tests, and two negatives on the
previous writer. The dedicated engine campaign observes 31 processes and 22
SIGKILLs; the existing vertical campaign, 71 processes and 26 SIGKILLs.
Repetitions in the complete catalog are not added to these counts.

P0 and the P1–P2 core are verified within the stated model. The
[P3 report](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-23-production-unix-m1/report.md)
now verifies the real Unix path on `11d2e95a`: 2215/2215 tests, 74 local processes,
four SIGKILLs, and ACK loss after strong commit. The optional application record
validator rejects incompatible data before the checkpoint. The complete FI
matrix and phase gate remain open. No benchmark or C1/MC/DC/power loss
qualification is inferred from functional passes.

The initial [paged primary integration](indice-paginato-m1.md) added an explicit
read-only candidate at startup and used it for current GET. In that increment,
the resident index remained present, and each admitted write retired the derivative.
The current default [automatic profile](indice-automatico-operativo.md) supports
resident and paged writes; a paged handle retains no complete resident index.

## Canonical compaction

[ADR-0078](../adr/0078-compattazione-prefix-m1.md) integrates synchronous full-prefix
compaction. `arcdocdb.engine:compatta-motore` selects current live records through
the existing RAM/paged index and preserves the maximum-CSN witness, including a
last tombstone. `:force t` bypasses only the default 25% gain threshold. Automatic
maintenance probes at rotation boundaries when there are at least four CLOSED
segments and the historical record count exceeds twice the live count, or when rotation would
consume recovery headroom. A spare segment, an unused u32 ID and sufficient
CONTROL revisions remain reserved for recovery.
`statistiche-compattazione-motore` returns per-handle scalar
counters and canonical/live counts.

Outputs are durable and independently verified before CONTROL replacement. Old
sources are explicitly marked REMOVED, their readers are retired, and locations
are relocated. Only then are the old files deleted with inode/header checks and
the parent synchronized, before metadata is pruned. Startup completes interrupted
reclamation. Maintenance is rejected before effects if snapshots or readers are
active; other maintenance failures fault admission without a data
CSN or ACK. No wire operation or alternative RAM/paged semantics are introduced.
See [qualification and timing](../../spikes/results/2026-10-31-engine-compaction/report.md).

A review regression covers capacity refusal before startup effects: recovery
requires room for its mandatory fresh ACTIVE and leaves all canonical files
unchanged if the configured segment budget is exhausted. Increasing the budget
permits the same data to be reopened. Repeated read-only openings consume structural
capacity; ordinary writes compact before consuming recovery headroom. Planning
shares the strict canonical order scan; output verification remains independent.

## Bounded strong write groups

[ADR-0080](../adr/0080-group-commit-m1.md) connects the existing WAL group and
planned-root FIFO. For example, construct a stable simple vector of
`(crea-operazione-scrittura :put key value)` and
`(crea-operazione-scrittura :delete key)` descriptors, allocate a specialized
`(unsigned-byte 64)` result vector, and call
`(scrivi-gruppo-documenti engine operations results :count n)`.
The API returns `n` after one strong flush and complete FIFO publication;
`results[0..n)` contains distinct increasing operation CSNs. `n` is 1..8 and
the group must fit one ACTIVE's configured record/byte budget and the WAL's
existing group bound. Inputs remain borrowed and immutable until return.

Every operation retains an independent SEAL and CSN; a group is not a transaction.
Known input/preflight rejections leave output and data CSNs unchanged. Admitted
errors/nonlocal exits fault admission; output is not confirmed and recovery may
retain a sealed prefix. No implicit retry or durability downgrade occurs.
Cumulative index reservation accounts for repeated keys, deletions, live peaks,
arena bytes, revision/slot credits and paged append headroom. Legacy deltas reserve
each distinct key once and renew at most once before sealing. Automatic index
maintenance retains transparent RAM/paged behavior.

A fixed per-ACTIVE workspace contains eight one-record batches; the existing
single-write API reuses batch zero. Extra batch buffers and planning/event arrays
are separate from the index/cache grants and are released with the handle.
[Verification and measurements](../../spikes/results/2026-10-31-engine-group-commit/report.md).

## Bounded ACTIVE metadata

M1 selects the [append-only ACTIVE arena](../adr/0081-active-append-metadata.md)
with page/PUT bounds equal to `max-records`. Three specialized u32 arrays reserve
`32 * max-records + 4` payload bytes before admission (2,097,156 bytes at the
default 65,536-record limit). This reservation is separate from primary-index
and record-cache grants and excludes object headers; it is not an RSS bound.

Single writes and groups initialize only a private tail, then publish the exact
captured prefix through the existing FIFO/flush protocol. Paging/growth/return
does not replace the arena; canonical rotation/compaction creates a fresh one.
The generic source factories keep their persistent default. M1 still creates
one immutable root descriptor per commit; allocation and broader heap/GC gates
remain measured residuals. [Evidence](../../spikes/results/2026-11-01-engine-active-directory/report.md).

## Bounded group append

[ADR-0082](../adr/0082-bounded-group-append.md) reuses the engine's exclusive
scratch for independently sealed strong groups fitting 64 KiB and the existing
file-transfer limit. These groups use one append entry; single batches and
larger groups retain per-batch append. No additional payload buffer is allocated.
The serial owner finishes recovery/maintenance before borrowing the scratch,
and no scratch reference survives the call. CSNs, SEALs, one canonical strong
flush, FIFO publication and acknowledgment order remain unchanged. Every
incomplete acquired WAL exit now faults its retained ownership, including
nonlocal acquisition handoff and copy exits. See
[verification and measurements](../../spikes/results/2026-11-01-engine-group-append/report.md).
