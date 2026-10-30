<a id="preparazione-del-checkpoint-del-control-log"></a>

# Preparing the control log checkpoint

`arcdocdb.control` builds and prepares a new `control.log.tmp` containing
a header, one complete EDIT, and a SEAL. It implements file preparation from
[ADR-0040](../adr/0040-manifest-a-record-unico.md#3-riconciliazione-al-riavvio),
with the header from [ADR-0052](../adr/0052-header-dei-log-di-controllo.md).
The **recovery atomicity point** remains the subsequent rename over the
authoritative control log. The preparer does not rename; the
[recovery publisher](pubblicazione-control.md) performs this step
on an already verified, authoritative old control log.

<a id="api-e-proprietà"></a>

## API and ownership

| API | Contract |
|---|---|
| `crea-checkpoint-control(active, payload, stamp, :limiti…)` | builds the private file in memory and reconstructs its manifest |
| `lunghezza-checkpoint-control(plan)` | exact file size, for configuring capacity and scratch |
| `manifest-checkpoint-control(plan)` | owned manifest, consultable through existing scalar queries |
| `prepara-checkpoint-control(plan, input, append, directory, scratch, :chunk-bytes)` | write, flush, full reread, comparison, and parent fsync |
| `log-control-preparato(prepared)` | canonical `:control` log, file-id zero, for its sole owner |
| `manifest-control-preparato(prepared)` | manifest of the prepared and identically reread checkpoint |
| `io:verifica-file-distinti(left, right)` | two read-only capabilities of the same backend, physically different device/inode |

The new ACTIVE must be the result of
[`prepara-segmento-attivo`](inizializzazione-active.md), still containing only the
header: open capabilities, healthy log, and written/durable frontiers both 64.
The check repeats before and after construction and preparation.
The controller prevents concurrent writes and closes throughout the cycle.

Payload is a complete state, encoded with `scrivi-valore-edit` from the
authoritative source: next ID, new ACTIVE, CLOSED with lengths/outcomes, and
removed segments still to reconcile. The module copies it into the private plan;
the caller may reuse it after construction. It exposes no plan buffer.
Serie identity and version come from the already verified new ACTIVE;
the u64 stamp is the sequence number supplied by the controller, **not a CSN**.

<a id="costruzione-senza-io"></a>

## Construction without I/O

1. Verify the new ACTIVE's health, binding, and frontiers without syscalls.
2. Verify payload budget and record capacity in version v1/v2.
3. Build a private CONTROL batch containing one complete EDIT, TXID zero,
   sealed through the existing WAL builder: file-id zero, start at 64, and
   **historical zero** durable frontier, since the new file is not yet written.
4. Add the Serie's canonical header and copy the batch into the private file.
5. Verify header, frames, CRCs, SEAL, and payload using existing recovery.
   Require a complete manifest that consumes the entire file and names the same
   new ACTIVE. Budgets, set disjointness, lengths, outcomes, and next-id
   are checked by the manifest fold.
6. Recheck the new ACTIVE and return the complete plan.

Construction may allocate; it is outside the document hot path.
It creates no files, reads no clocks, reserves no IDs, takes no CSN, and publishes no indexes.
The in-memory scanner does not certify CLOSED presence: inventory, verification
of their data, and allocator correctness remain controller obligations.

The [recovery builder](checkpoint-recovery.md) derives complete payload
from recovered CONTROL and ACTIVE, retaining CLOSED, REMOVED, and outcomes and
verifying the transition before returning this same plan.

<a id="preparazione-nel-pool-io"></a>

## Preparation in the I/O pool

The controller creates the new `control.log.tmp` with **O_EXCL**, opens read-only and
the authoritative parent directory, and reserves the namespace. The actual parent is a
controller precondition; the module does not infer it from file inodes.
Read-only, append, directory, and new ACTIVE use the same backend, including
`nil` on the native path. Callbacks are trusted and respect ownership and buffers.

Preflight checks aliases, scratch, transfer budget, total file budget,
backend, and zero append frontiers before fstat or modifications.
Read-only/append binding proves that both control log capabilities
identify the same file. A second check proves that file is
**distinct from the new ACTIVE**, before any writing.

The task writes the plan in chunks, synchronizes the file, rereads it in
chunks, and compares **every byte**, including header, payload, stamp, and SEAL.
The first mismatch reports corruption with an absolute offset. It then synchronizes
the directory and verifies capabilities, ACTIVE dependency, and exact frontiers.
It returns the result only after all steps complete.

The result retains log, manifest, ACTIVE dependency, and physical binding;
it also retains the canonical directory and prepared frontier. It does not retain the serialized
plan or scratch. The controller retains all
capabilities and completes rename/adoption under ADR-0040. The complete,
durable file is not yet the authoritative control log and acknowledges no document.

<a id="errori-e-risorse"></a>

## Errors and resources

Typed codec, recovery, and I/O errors propagate without a generic handler,
error retry, rollback, truncation, close, or implicit deletion.
The caller retains resource ownership and handles quarantine/cleanup.
No partial result is delivered. After progress, another preparation
on the same append is rejected; failed write/flush applies `FAULTED`.
The temporary file must be reconciled against the authoritative source before deletion.

| Local rejection | Reason |
|---|---|
| ACTIVE advanced beyond header | `:control-active-advanced` |
| Unhealthy ACTIVE log | `:control-active-log` |
| Disallowed budget/payload | `:control-checkpoint-budget` / `:control-checkpoint-payload` |
| Manifest refers to another ACTIVE | `:control-checkpoint-active` |
| Zero chunk / scratch alias / different backend | `:control-checkpoint-chunk` / `:control-checkpoint-alias` / `:control-checkpoint-backend` |
| Append already started | `:control-checkpoint-started` |
| Control log and ACTIVE are the same file | `:io-file-alias` |
| Reread differs | `:control-checkpoint-readback` |
| Impossible internal returns/frontiers | `:control-checkpoint-*`, `invariant-violation` condition |

<a id="costi-e-decisioni-da-qualificare"></a>

## Costs and decisions to qualify

With payload P, the file occupies **P + 144 bytes**: 64 header, 24 EDIT frame,
and 56 SEAL. P is at most 16 MiB, with the v1 record limit checked
separately. Manifest budgets are existing ones: 65,536 segment mentions
and cumulative outcomes by default, configurable through the API.

Default chunk 64 KiB; any positive chunk is bounded by plan
bytes and I/O capabilities. Scratch requires `min(file-size, chunk)` bytes.
There are `ceiling(file-size/chunk)` exact transfers in each direction;
positive short I/O has the existing primitives' bound. At most
four fstats and two flushes. Rereading does not rebuild the manifest. The plan
retains the private file and manifest; the intermediate batch may be
collected after construction. These are static bounds, not latency,
RSS, heap, or throughput measurements.

| ID | Decision | Cases to qualify |
|---|---|---|
| CPL-D01 | ACTIVE written/durable at 64 | each frontier different, both exact |
| CPL-D02 | min/max budget and representable payload | every limit, v1/v2, one byte beyond |
| CPL-D03 | correct header end/version | each mismatching value, both correct |
| CPL-D04 | complete prefix to EOF | short prefix, tail, complete |
| CPL-D05 | manifest names new ACTIVE | other ID, canonical ID |
| CPL-D06 | scratch without three aliases | each alias separately, distinct buffer |
| CPL-D07 | all four backends identical | each binding different, identical, native |
| CPL-D08 | append written/durable zero | each frontier different, both zero |
| CPL-D09 | distinct device/inode | same device/other inode, other device/same inode, both equal |
| CPL-D10 | final frontiers equal size | each frontier different, both exact |
| CPL-D11 | correct SEAL/batch size | each mismatching return, all correct |
| CPL-D12 | byte equality in every chunk | first/middle/last byte, chunk boundary and short final block |

C1 qualification, functional cases, fault injection, concurrent stress, and dynamic
measurements are open. Author static readings do not constitute
independent review. The [authoritative rename](pubblicazione-control.md)
is now a separate module step; the recovery executor, catalog Serie
creation, and live rotation remain to be integrated.
