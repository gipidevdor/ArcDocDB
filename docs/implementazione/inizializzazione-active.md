<a id="inizializzazione-di-un-nuovo-segmento-writer"></a>

# Initializing a new writer segment

`arcdocdb.active` prepares a new `.seg.tmp` header and binds result
to [ACTIVE resolver](get-active.md). Performs file preparation under
[ADR-0040](../adr/0040-manifest-a-record-unico.md#2-prepara-decidi-completa): header,
file flush, and directory synchronization. **Durable EDIT** remains
manifest's segment-opening decision; this module does not write it.

<a id="api-e-responsabilità"></a>

## API and responsibilities

| API | Result |
|---|---|
| `prepara-segmento-attivo(view, input, append, directory, id, created-at, header, scratch, :version)` | log, GET capability, and identity proof after flush and reread |
| `log-segmento-attivo-preparato(prepared)` | canonical log for constructing one Serie controller |
| `crea-sorgente-get-preparata(controller, lease, prepared, :limiti…)` | ACTIVE source with mandatory physical association, without I/O |
| `verifica-capienza-lettura(file, count)` | read-only budget preflight without buffer, offset, or syscall |

Controller reserves namespace and identifier, creates new append with
`crea-temporaneo` (**O_EXCL**, never reopening an existing segment), opens
read-only capability and authoritative parent directory. Capabilities and both
buffers exclusive until preparation returns, performed in I/O pool.
`created-at` supplied by caller as u64; module reads no clock.

Both files' association [verified through device/inode](associazione-file.md).
Directory must be actual parent of reserved name: a controller
precondition not derivable from two inodes. All three files must
use same backend instance, including `nil` for native path.
Callbacks remain trusted and honor buffer ownership/stability.

<a id="ordine-degli-effetti"></a>

## Effect order

1. Check v1/v2 format, positive u32 ID, two ranges of at least 64 bytes,
   no aliases, open capabilities, read/append budgets, and append written/
   durable frontiers both zero. No I/O or buffer effects.
2. Verify read-only/append physical identity and create private log.
   Missing `identity` callback or different identity prevents writing.
3. Prepare canonical **writer** header with Serie, ID, version, timestamp,
   zero reserved fields, and CRC. Write exactly 64 bytes to new append.
4. Synchronize file; verify return to 64.
5. Reread with `crea-segmento-get` through associated read-only capability:
   verify header/CRC/Serie/ID/format. Compare all 64 bytes with written bytes,
   including timestamp, origin, and reserved fields.
6. Synchronize parent directory. Recheck open capabilities
   and file frontiers both at 64 before returning result.
7. Writer performs EDIT decision and completion under ADR-0040.
   Only after this decision admits traffic on new ACTIVE.

Controller uses returned log, initial root `nil`, and `next-offset = 64`.
With its lease, `crea-sorgente-get-preparata` compares actual log and
Archivio CSN register with snapshot register in GET view; requires
file still at header only. Existing ACTIVE factory always receives
identity proof, without syscalls, mutexes, or H reads.

Caller builds **one controller per log** and prevents other writers,
concurrent close/dup2, and external changes. Result is not catalog
uniqueness token. Headers are not WAL records, receive no CSN, and do not
establish document commit. File/directory durability
does not replace EDIT opening decision.

<a id="guasti-e-cleanup"></a>

## Faults and cleanup

Configuration, ranges, aliases, capacity, and already started file rejected
before fstat/write/flush. Undersized buffers produce no partial
header. With valid formats, failed fstat or unverifiable backend precedes
header preparation.

Failed append/flush applies normal `FAULTED` state of
[I/O boundary](io.md). Failed read/CRC/mismatched reread or directory fsync
prevents result return. Original conditions propagate:
no generic handler, error retries, truncation, or rollback.

Caller retains capability ownership on every exit. Handles
quarantine and cleanup at its own boundary, without ignoring error or opening
segment in catalog. After positive progress, repeating preparation on
same file rejected because position no longer zero; failed write/flush
also terminal. Crash leaves temporary file to reconcile under
[manifest and inventory](inventario.md), not authority to delete it without
required proof. Module neither deletes, renames, nor closes files.

| Local rejection | Condition / reason |
|---|---|
| ID not representable by ACTIVE path | `invalid-argument / :active-initialization-id` |
| buffer alias | `invalid-argument / :active-initialization-alias` |
| different backends | `invalid-argument / :active-initialization-backend` |
| nonempty append or advanced after preparation | `invalid-argument / :active-initialization-started` |
| controller uses another log | `invalid-argument / :active-initialization-log` |
| different CSN register | `invalid-argument / :active-initialization-csn` |
| different reread header | `corruption-detected / :active-initialization-readback` |
| impossible internal returns/frontiers | `invariant-violation / :active-initialization-*` |

<a id="costi-e-decisioni-da-qualificare"></a>

## Costs and decisions to qualify

At most two fstat calls, two flushes, and one 64-byte write/read range each.
Positive short I/O uses at most 64 steps per range; errors not
retried. Comparison has at most 64 iterations. Two caller buffers,
at least 128 total bytes, and few opening objects; result retains no
buffers or record lists. Document GET and commit add no operations
for this preparation. Not latency or allocation measurements.

| ID | Decision | Cases to verify |
|---|---|---|
| AIN-D01 | header/scratch/identity not aliased | each alias separately; distinct buffers |
| AIN-D02 | read-only backend = append = directory | each different association; native; identical backend |
| AIN-D03 | append written = 0 and durable = 0 | each frontier nonzero; both zero |
| AIN-D04 | post-I/O written = 64 and durable = 64 | each frontier different; both exact |
| AIN-D05 | equality of 64 reread bytes | first/middle/last byte, timestamp, CRC, origin, reserved fields |
| AIN-D06 | frontiers still at 64 on adoption | advanced append, different durable frontier, unchanged capability |
| AIN-D07 | controller log identical to prepared log | another log object with same numbers; canonical log |
| AIN-D08 | Serie CSN register identical to view's | another Archivio; canonical register |

C1 qualification, functional cases, per-step fault injection, concurrent stress,
and dynamic measurements remain open. Author's static readings are not
independent review and do not promote engine requirements.
[Local catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-active-init/catalogo.lisp).

Preparer still needs connection to opening/rotation executor and
catalog EDIT decision. Ordinary ACTIVE resolver's prepared/OUTCOME limits
and concrete index publication remain as documented.

[Control-log checkpoint](checkpoint-control.md) can now use this
result to prepare header, complete EDIT, and SEAL, verifying same
ACTIVE and keeping control log physically distinct. Authoritative
recovery decision remains rename under ADR-0040.
