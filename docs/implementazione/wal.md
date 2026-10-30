<a id="lotti-wal-e-group-commit"></a>

# WAL batches and group commit

Implementation of the common path from [ADR-0037](../adr/0037-lotto-sigillato.md):
in-memory formation, SEAL, writing multiple batches, one flush. Common Lisp/SBCL
only, safety 3. [Method](wal-metodo.md), [decisions](wal-decisioni.md),
[evidence](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-wal/catalogo.lisp).

<a id="preparazione-senza-io"></a>

## Preparation without I/O

`crea-lotto` preallocates buffer, u32 offsets, and SEAL scratch. `aggiungi-record`
copies with the codec and always reserves SEAL space; it does not assign batch
CSN. `sigilla-lotto` receives the CSN just acquired by the caller, planned position,
and durable frontier observed through the previous flush event.
The [batch CSN bridge](wal-csn.md) registers and retains the token at closure,
checks coverage/health at resolution, and prevents pending reuse.
The [Archivio CSN registry](csn.md) and [writer queues](code-writer.md)
are distinct components; the controller coordinating queues, index, and acknowledgments remains to be integrated.

Closure restamps ordinary PUT/tombstone and EDIT, preserves prepared,
OUTCOME, and DECISION TXIDs, recalculates header and aggregate CRCs, and
writes SEAL. The private buffer is not exported and is immutable from sealed
until reuse. File-id in SEAL is encoded once at initialization: even maximum
u64 values cause no boxing on the measured path. CBOR values, contracts,
and EDIT/DECISION semantics are validated by the caller; this module builds
the frame.

> **Proposal** — Initial budgets: 256 KiB/1024 records per batch, configurable
> caps of 64 MiB/65536 records; 64 batches/64 MiB per group, maximum 1024 batches.
> These are preallocated resource limits, not new format limits or scheduler thresholds.

<a id="compito-io"></a>

## I/O task

`crea-log-io` binds an already open append capability to a log/version/file-id.
The capability is owned exclusively by that log: it cannot have a second
wrapper or receive direct append/flush during the wrapper's lifetime.
`aggiungi-lotto` checks identity, contiguity, and budget; a CAS on batch
ownership prevents enqueueing it in two groups. `chiudi-gruppo` prepares a
nonempty snapshot for the I/O pool.

| Operation | Effect |
|---|---|
| `scrivi-gruppo` | Log CAS, preflight of all budgets/frontiers, N appends, written state |
| `sincronizza-gruppo` | CAS written → flushing, one flush, N durable states, log release |
| `esegui-gruppo` | Both phases in the same I/O task |
| `coperto-p` | Checks byte coverage: written for async, durable for group/strong |
| `annulla-gruppo` | Releases batches of a building/ready group retired from the scheduler |
| `riusa-gruppo`, `riusa-lotto` | Reuse only after durable completion and consumer completion |

A second group on the same log receives `resource-exhausted` without a
syscall, wait, or spin. CAS and states are local to the log; independent
Serie share no writes or locks. Write and flush belong to the **I/O pool**,
never to the writer in the compute pool. The scheduler must retain message
ownership and lifetime; these primitives do not implement it.

Preflight checks whole-group capacity, maximum transfer, initial written
offset, and each SEAL's historical frontier. A rejection releases I/O
ownership without writing. A write/flush failure marks the log, group,
and affected batches faulted; it retains ownership to prevent new groups,
does not retry, and does not advance the durable frontier. The event toward
Serie/Archivio remains to be integrated at the worker boundary.

`coperto-p` **does not publish or acknowledge**: ordered index publication,
Serie health, 2PC outcomes, and client acknowledgment are controller checks.
An earlier already durable batch retains that coverage even if a subsequent
group fails; this does not authorize acknowledgments after the fault.
Async is rejected for control/multiserie; PREPARE/COMMIT obligations still
require Transaction Manager checks.

<a id="durata-riuso-e-guasti"></a>

## Lifetime, reuse, and faults

A batch still owned by a group cannot be reused. After flush, the controller
waits for consumers to finish, reuses the group, then the batches. Canceling
a group requires its retirement from the scheduler: it does not cancel an
already in-flight task. External references and event publication must honor
a lifetime protocol; states do not replace that protocol.

The atomicity point is SEAL; formation prepares it, write/flush complete
its persistence. No rename, deletion, reopening, or truncation. Header and
initial offset are the Segment Manager's responsibility; the native test
uses real v1/v2 headers and starts at offset 64. For control logs, the
decision on their header before file publication also applies.

<a id="prove-e-limiti"></a>

## Tests and limits

19 WAL tests, 330 v1/v2 crash prefixes, real files with F_FULLFSYNC and
directory fsync, codec/recovery oracles, EIO/ENOSPC/EINTR errors, concurrent
groups, concurrent flushes made deterministic with semaphores, budgets,
and reuse. The 12 targeted mutations are detected; a compilation error
does not count as a detected mutation. Failed attempts, mutated copy logs,
and raw coverage remain in the catalog.

Local measurements include formation of eight 2 KiB records, SEAL,
**simulated** group I/O, and reuse: about 37 thousand groups/s, with zero
heap bytes in five samples, including maximum u64 CSN and file-id. These
are not database throughput, NVMe flush, or request latency. Hardware,
load, and hashes are in the campaign record.

Requirements: REQ-WAL-002/003/005/006, REQ-AFF-001/008/009, REQ-FOR-003, REQ-VAL-001.
Two readings: format/CRC/TXID/frontiers, then ownership/CAS/resources/reuse.
Independent review, complete C1 coverage/MC/DC, native Linux, controller,
CSN, queues/pool, publication/ack, and integrated engine fault injection remain open.
No engine requirement is automatically promoted by these local tests.
