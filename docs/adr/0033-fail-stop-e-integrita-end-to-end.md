<a id="adr-0033--fail-stop-integrità-end-to-end-politica-degli-errori"></a>

# ADR-0033 — Fail-stop, end-to-end integrity, error policy

- **Status:** Accepted; **§4 superseded by [ADR-0037](0037-lotto-sigillato.md)** (tail or corruption is determined by the durable frontier of SEALs; recovery does not truncate; control logs also have a legitimate tail); read verification clarified by [ADR-0039](0039-cornice-unica-dei-record.md) §4 and, for the cache, by [ADR-0044](0044-cache-acceleratore-puro.md).
- **Date:** 2026-10-03
- **Relationship to the specification:** no amendment; specifies **how** "crash-safe
  recovery" and "no committed data may be lost" are implemented in the presence of faults; clarifies
  [ADR-0019](0019-durability-e-group-commit-pipelined.md) for the `:async` level.
- **References:** [fault analysis](../affidabilita/analisi-dei-guasti.md), INV-A1…INV-A8,
  INV-F1

<a id="contesto"></a>

## Context

The specification describes correct behavior and recovery after a crash; it does not describe
how the system responds to faults that **are not** a clean shutdown: I/O errors, bit rot,
partial writes, resource exhaustion, internal defects. A critical system must have a
defined response for each (ADR-0031).

<a id="decisione"></a>

## Decision

<a id="1-stati-di-salute"></a>

### 1. Health states

| Level | States |
|---|---|
| Serie | `HEALTHY` · `DEGRADED` (one or more quarantined segments) · `FAULTED` |
| Archivio | `HEALTHY` · `MULTI-DISABLED` (`multiserie.log` faulted) · `FAULTED` (Registri faulted) |

- `FAULTED`: the Serie neither accepts nor acknowledges any operation; it can restart only with
  recovery (or offline verification). On-disk state is not touched (append-only).
- `DEGRADED`: reads of documents in quarantined segments return
  `corruption-detected`; the rest of the Serie works; CLEAN and MERGE skip quarantined
  segments.
- Every transition is a recorded event and a metric.

<a id="2-errori-di-scrittura-e-di-flush-fail-stop-mai-ritentati-inv-a1"></a>

### 2. Write and flush errors: fail-stop, never retried (INV-A1)

An error from `write`, `fdatasync`/`F_FULLFSYNC`, `rename`, or directory synchronization
puts the Serie (or the Archivio for `multiserie.log` and Registri) into `FAULTED`. **Do not retry
or ignore it.** Reason: after an `fsync` failure, the state of pages in the operating
system cache is undefined; another `fsync` may succeed without the data being
durable (PostgreSQL defect discovered in 2018). A batch whose flush failed is
never acknowledged.

`ENOSPC`: prevented with a **space reservation** — below the configured free-space
threshold, the system rejects new writes with `resource-exhausted` (backpressure), ensuring
space for compaction and recovery. An `ENOSPC` that nevertheless occurs on a
write is treated as a write error (`FAULTED`).

<a id="3-verifica-in-lettura-inv-a2"></a>

### 3. Read verification (INV-A2)

Every record read — from disk **and from cache** — is verified before being returned:
record CRC32C, matching key, version, and CSN against the index entry that
pointed to it. Failed verification never returns the data: `corruption-detected`, the segment
is quarantined (`DEGRADED`), and the event is recorded. The cost (CRC32C in typed Common Lisp)
is accepted (ADR-0031 §5) and measured by SPK-09.

<a id="4-recovery-coda-troncata-o-corruzione-a-metà-log"></a>

### 4. Recovery: truncated tail or mid-log corruption

While reading the `ACTIVE` segment, the first record with an inconsistent length or incorrect CRC
sets a **stop point**. Recovery then performs a **resynchronization scan**
through the rest of the segment, byte by byte, looking for a valid record (plausible header,
correct CRC) with a CSN higher than the last known one:

- no valid record after the stop point → **tail truncated** by a crash: truncate and
  continue;
- a valid record after the stop point → **mid-log corruption**: committed data
  may follow; the Serie enters `FAULTED` and nothing is truncated. An operator decision is
  required (offline verification, restore).

The scan's possible error is in the safe direction: a false positive (a "valid" record
found by chance, probability ≈ 2⁻³² per position) causes refusal to open, never
silent loss. An invalid record in a **CLOSED** segment or in `control.log`,
`multiserie.log` is always corruption (there is no tail to truncate): segment quarantine
(`DEGRADED`) or `FAULTED` for control logs.

<a id="5-recovery-idempotente-inv-a7"></a>

### 5. Idempotent recovery (INV-A7)

Recovery can be interrupted and rerun at any point: the final state is the
same. Every recovery step is therefore described by durable control-log records
or files with atomic rename, never by in-memory state.

### 6. Scrubbing (INV-A6)

A background process, with limited bandwidth and lower priority than CLEAN, rereads closed
segments: CRC of every record, consistency of hints, indexes, and Bloom with the segment, presence of files
listed by the control log. The target is a full cycle **within 7 days**; deviation is a
metric with an alarm. A detected error quarantines the segment **before** a
read needs it.

<a id="7-verificatore-offline-arcdocdb-verify"></a>

### 7. Offline verifier `arcdocdb-verify`

A Common Lisp tool that opens an Archivio **read-only** and verifies everything that can be
verified offline: formats and CRCs, consistency of control log, segments, hints, indexes,
`multiserie.log`, catalog, and directories. It exits with a nonzero code and a detailed report.
It serves the operator, backup, and tests (an oracle after every simulated crash).

<a id="8-condizioni-ed-errori-inv-a4"></a>

### 8. Conditions and errors (INV-A4)

- Condition hierarchy: `arcdocdb-error` ← `corruption-detected`, `io-fault`,
  `resource-exhausted`, `conflict`, `invalid-request`, `snapshot-too-old`,
  `serie-faulted`, `invariant-violation`.
- `ignore-errors` and handlers that catch `error`/`serious-condition` without
  re-signaling or recording and transitioning to a defined state are prohibited. A generic handler is allowed only at
  boundaries (request, worker), with recording and state transition.
- **Internal invariant assertions remain enabled in production at all times.** A
  violation in C1 code puts the Serie into `FAULTED` (`invariant-violation`), rather than
  continuing. A process crash is reserved for heap exhaustion or a fatal runtime
  error.

<a id="9-limiti-di-risorse-inv-a8"></a>

### 9. Resource limits (INV-A8)

Every resource is bounded by a configured **and enforced** value: length of every queue,
size of every buffer, maximum request, connection count, snapshot count and duration,
attempts in every loop, depth of every recursion, heap memory. Exceeding a
limit causes explicit rejection (`resource-exhausted`), never undefined degradation.
Heap exhaustion is prevented by a startup memory budget and rejection thresholds
well below the limit.

<a id="10-livello-async"></a>

### 10. `:async` level

`:async` **is never the default**, requires an explicit per-Serie choice recorded in the
catalog, is **prohibited for Registri and participants in multiseries transactions**, is excluded
from INV-D1 (already in ADR-0019), and is a system metric ("Serie in `:async`").

<a id="11-lock-dellarchivio"></a>

### 11. Archivio lock

On opening, the process acquires an **exclusive lock** on the Archivio's `LOCK` file and
holds it until close: a second instance opening the same Archivio fails
immediately.

Patterns: fail-stop (Gray, 1985), end-to-end checksums (ZFS, RocksDB, TigerBeetle), scrubbing
(ZFS), always-enabled assertions and deterministic recovery (TigerBeetle), fatal `fsync`
(PostgreSQL post-2018).

<a id="conseguenze"></a>

## Consequences

- The Serie stops more often (fail-stop) than an availability-oriented system
  would: this is intentional (ADR-0031 §1).
- Performance cost of read CRC and scrubbing: measured (SPK-09), accepted.
- Every error state is a state-machine element to verify (FI, model).

<a id="alternative-considerate"></a>

## Alternatives considered

- *Retry `fsync` with backoff:* rejected (known defect).
- *Always truncate at the first anomaly:* rejected: it would silently lose committed data in
  cases of mid-log corruption.
- *Return data even if CRC fails, with a warning:* rejected (priority 2).

<a id="valutazione"></a>

## Assessment

- Risks: RSK-18, RSK-19.
- Verification: [fault analysis](../affidabilita/analisi-dei-guasti.md) (every fault → test);
  FI-01, FI-02, FI-10; decoder fuzzing; deliberate corruption tests for every file.
