<a id="cache-seriale-delle-pagine-dellindice"></a>

# Serial index-page cache

Preparatory increment for I3/I4 integration under ADR-0057 and ADR-0058,
authorized by the author on 2026-10-24. REQ-IDX-009, REQ-LIM-003,
INV-I8, INV-A2, INV-A8, INV-P6. The M1 engine retains the resident primary index:
this cache connects the codec to the I/O module but does not yet implement the paged
backend, multilevel directory, or automatic migration.

<a id="contratto-e-integrazione"></a>

## Contract and integration

`arcdocdb.index.page:crea-cache-pagine(size, frame-count, loader)` prepares
fixed frames for 4096-, 16384-, or 65536-byte pages. Maximum payload is
256 MiB; frame count 1..65536. Each frame now has a preallocated owned copy
of identity: private cursors from the
[paged reader](lettura-indice-paginato.md) are not retained. The limit concerns byte arrays:
structure, reference vectors, and identities are additional metadata, O(frame-count),
and do not constitute an RSS measurement or the complete quota required by ADR-0057.
The caller must also account for metadata, targets, and retained sources.

`crea-cache-pagine-file(size, frame-count, file)` connects a borrowed immutable
read-only file to `io:leggi-esatto`. The controller keeps the file open;
the cache does not close it. Misses are synchronous and must run on the
I/O actor. Partial reads are completed by the I/O module; EOF and faults
propagate without retrying the error. No mmap is used.

`copia-pagina-cache(cache, identity, target, :start 0)` returns the end and
`:hit`/`:miss`. It searches at most all frames and uses FIFO replacement; a hit
does not change order. Serie, image, offset, and generation are part of the
complete key. Every miss verifies the entire page with the codec before
publishing it in the frame and copying it to the target. The target remains intact if
reading or verification fails. The victim slot remains invalid on error
or nonlocal exit; a later load cannot use a stale tail.

The injectable loader receives identity and an exclusive buffer and returns
exactly SIZE. It is trusted code: it neither retains nor later modifies
the buffer. The cache invalidates before loading and zeroes the frame. The return
value alone does not prove the loader read: CRC, identity, and
shape are verified regardless. A cache corrupted in memory after
verification is not detected by reverification on every hit.

A single thread owns the entire cache; callbacks cannot reenter.
No frame is lent to the caller, only copies in private memory.
These copies need no hazards and remain valid after reuse.
This serial contract does not replace the future I3 concurrent cache:
it does not demonstrate lock-free progress, SBCL primitives/barriers, or concurrent
borrower safety. No lock, counter, or write is shared between Serie.

<a id="verifica-e-letture-c1"></a>

## Verification and C1 readings

Method: binary fixtures independent of the product codec; three sizes,
complete identity, hit without new I/O, one/two-frame FIFO, private copies,
short read, bad CRC, wrong identity, reentry, foreign thread, and nonlocal
exit. The I/O bridge is exercised with four 1024-byte transfers,
hit without syscall, and a file closed before a miss. Tests enter the existing page
suite and therefore the ordinary ASDF and CI path.

| Compound decision | Conditions and cases |
|---|---|
| Factory | valid size, integer count 1..65536, function callback; each invalid domain separately |
| Hit identity | same image, offset, generation, and Serie; each difference causes a miss; different offset exercises FIFO |
| Candidate slot | NIL is invalid; valid equivalent identity is a hit; different is a miss |

First reading: domain/geometry, complete identity, integrity before
copy, no durable change, frame-bounded loops, cleanup without
masking errors, ownership, and reentry. Second reading: invalidation/
read/verification/publication order, error after victim invalidation, nonlocal exit,
copy immutability, borrowed-file lifetime. These are readings by the same
author, not independent review or full-engine MC/DC qualification.

Rollback removes this derived cache without changing logs or user data.
There is no new commit point: SEAL, EDIT, and DECISION remain authoritative.
EOF/corruption require a FAULTED transition at the future engine boundary;
the cache propagates the cause and does not independently choose derivative recovery.
