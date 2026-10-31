# M1 — Single-Series Durable Core

Milestone [Production Engine Bootstrap](https://github.com/gpicchiarelli/ArcDocDB/milestone/1).
The [preregistered method](production-engine-bootstrap-metodo.md) focuses work
on the existing path, without new full text functionality or a parallel roadmap.

<a id="ingresso-di-produzione"></a>

## Production entry point

```lisp
(arcdocdb.engine:apri-motore directory archive-uuid series-uuid
 :create t :clock #'get-internal-real-time)
;; Returns only a READY engine; otherwise signals a condition.
```

The private directory must exist. `:create t` is explicit initialization,
allowed only when empty; normal opening does not create missing files
or overwrite existing storage. The two UUIDs are sixteen-byte octets,
copied and compared with the canonical headers. Only one serial I/O actor
owns the handle and all FDs: no calls from another thread or reentry
during a request, including from observation callbacks.

Nonblocking advisory exclusion is acquired on the directory FD before
observing or mutating storage, and lasts until its close. All M1 writers
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
No alternative decoder or format.

The writer reuses batch, group, and scratch. Format/capacity preflight precedes
the CSN, including load, key arena, slot credit, and index revision.
Canonical preflight does not mutate the index or reserve concurrent resources:
it applies to the sole M1 owner, without another mutator until application.
A predictable index limit leaves READY, CSN, and files unchanged;
admissible updates and tombstones remain usable, including after reopen
with the same budgets. DELETE does not reclaim bytes from the append-only arena.
Failed index health/an invariance failure instead closes admission even when
detected in preflight, preserving the cause and without append or CSN consumption.
SEAL, write, flush, canonical root publication and CSN resolution, index, and
reference retirement follow. Acknowledgment is issued only at the end.
Root before index is correct only with the serial M1 actor: concurrent GETs
and historical MVCC are not exposed. Losing the response can leave an unknown
outcome; there is no automatic retry.

Replay traverses only CLOSED prefixes verified by the existing APIs,
requires strictly increasing ordinary CSNs, and includes tombstones.
A conflict or corrupt data closes bootstrap. The maximum does not derive
from segment IDs, offsets, or CONTROL stamps. The inspection's zero CSN
context has no writer: the only operational registry is the one created by
the final plan.

<a id="errori-risorse-e-limiti-m1"></a>

## Errors, resources, and M1 limits

Startup, recovering, faulted, and closed reject requests. An incomplete admitted
request makes the engine FAULTED and retains the cause, without acknowledgment,
rollback, or reuse of uncertain buffers. Close shuts admission before resources;
all sets and FDs receive one attempt, parent last. Secondary errors are
retained; startup failure aggregates any cleanup without losing the primary
error. The owner thread is not canceled asynchronously; SIGKILL terminates
the process and the kernel releases descriptors/locks.

Existing segments are always read-only. Tails without SEAL, orphan temporaries,
and unpublished CONTROL files are retained; observed IDs are not reused.
An existing `control.log.tmp` is moved to a distinct name without replacing
an existing target, then the parent is fsynced. An unexpected final file is a
blocking anomaly: it is not deleted. Orphan garbage collection is not
implemented; exhausted budget requires explicit intervention, without silent loss.

M1 configures exactly one Serie and a decision log without DECISION; it does
not discover the multiserie catalog. Prepared records and locations beyond u32 are rejected. Canonical compaction
outputs and REMOVED are verified and completed at startup. The format remains v1/v2; this is an entry point
restriction, not a change to the u64 storage types. Each reopen prepares a new
ACTIVE. [Live rotation](../adr/0076-rotazione-live-m1.md) connects canonical
checkpoint publication to normal PUT/DELETE before the next data CSN. Byte or
record saturation prepares a fresh ACTIVE while retaining the runtime registry,
primary index and current-read semantics. Total segment capacity remains bounded;
current-only compaction reclaims obsolete bytes; concurrent snapshot reclamation
remains separate work.

Defaults: 16 MiB file, 64 KiB frame, 64 segments, 65,536 records per file,
index capacity 4096, and 1 MiB key arena. Configurable, checked budgets,
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

The [paged primary integration](indice-paginato-m1.md) adds an explicit read-only
candidate at startup and its use in current GET. The resident index remains
present; before each admitted write, the derivative is retired.

## Canonical compaction

[ADR-0078](../adr/0078-compattazione-prefix-m1.md) integrates synchronous full-prefix
compaction. `arcdocdb.engine:compatta-motore` selects current live records through
the existing RAM/paged index and preserves the maximum-CSN witness, including a
last tombstone. `:force t` bypasses only the default 25% gain threshold. Automatic
maintenance probes at rotation boundaries with four CLOSED segments and history
above twice the live count, or at total segment capacity. A spare segment remains
reserved for recovery. `statistiche-compattazione-motore` returns per-handle scalar
counters and canonical/live counts.

Outputs are durable and independently verified before CONTROL replacement. Old
sources are positively REMOVED, readers retired, locations relocated, and only
then inode/header-bound deletion and parent synchronization precede metadata
pruning. Startup completes interrupted reclamation. Active snapshots/readers
refuse before effects; other maintenance failures fault admission without a data
CSN or ACK. No wire operation or alternative RAM/paged semantics are introduced.
See [qualification and timing](../../spikes/results/2026-10-31-engine-compaction/report.md).
