<a id="associazione-fisica-dei-file"></a>

# Physical file association

`arcdocdb.io` associates read-only and append capabilities with the **same open
regular file**, through device and inode returned by `fstat`. This is local
identity evidence for the [ACTIVE resolver](get-active.md), distinct from headers,
CRCs, WAL frontier, commit, and durability. Architectural decisions remain
those of [ADR-0017](../adr/0017-piattaforma-e-io.md) and the
[I/O boundary](io.md).

<a id="contratti"></a>

## Contracts

| API | Precondition | Result |
|---|---|---|
| `associa-file input append` | exclusive controller in I/O pool; open capabilities, same backend; no concurrent close | immutable association, returned only after exact device/inode comparison |
| `verifica-associazione-file prova input append` | same ownership and capability lifetime | O(1) reference and state checks, without I/O |
| `verifica-file-distinti left right` | two stable read-only capabilities of the same backend, in I/O pool | two fstat/callbacks; rejects same device/inode, without mutation or retry |
| `make-backend … :identity callback` | trusted stable callback, same domain as other callbacks | optional extension; six previous positions remain compatible |
| `crea-sorgente-get-attiva … :associazione-file prova` | proof obtained in I/O pool | read-only verification of source and controller log's actual append capability before source construction |

The `identity` callback receives private FD and returns two integer values:
`st_dev` and `st_ino` of a regular file. It must signal `syscall-error` for errno,
never use a sentinel number as identity. A backend without callback can
continue other operations; association is rejected before
any call. No simulated FD is passed to the operating system.

Domain is the **exact** backend instance: `nil` for both selects POSIX;
two distinct instances are rejected even if containing the same functions.
Identity is compared as two complete integers, without hashing, truncation,
fixnum conversion, or sign normalization. Signed and unsigned
64-bit values are representable; SB-POSIX handles `stat` ABI.

<a id="sequenza-e-ownership"></a>

## Sequence and ownership

1. Open new append `.tmp` and read-only capability for same file.
2. In I/O pool, call `associa-file`; check header through
   normal `segmento-get` constructor.
3. In the Serie-owning task, pass proof to
   `crea-sorgente-get-attiva`. This call performs no syscall.
4. Keep both capabilities alive until their consumers are quiescent.
   [EBR protocol](epoche-e-reclaim.md) and controller authorize reclamation.

At most **two fstat calls**, one per capability, without retry. Comparison
and final state checks precede the sole new association. Names, size,
timestamps, FD numbers, or header contents are not consulted to
establish identity. A hard link to the same inode is acceptable; the same
name now pointing to another file provides no proof.

Association retains only two immutable references. After close,
old capability stays closed: reusing the FD number does not reactivate proof.
A new capability, even for the same inode, requires a new association.
Controller prevents concurrent closes, FD replacement through `dup2`,
and external namespace/file modifications. This API introduces no synchronization
or renewal of those preconditions through fstat on every read.

<a id="errori-e-compatibilità"></a>

## Errors and compatibility

| Case | Condition / reason | Effect |
|---|---|---|
| wrong mode | `invalid-argument / :io-mode` | no syscall |
| closed/faulted capability | `io-fault / :io-unavailable` | no proof returned |
| different backends | `invalid-argument / :io-identity-backend` | no callback |
| missing callback | `unsupported-format / :io-identity-unavailable` | no fallback |
| different device or inode | `invalid-argument / :io-file-mismatch` | no association |
| wrong-type result | `invariant-violation / :io-identity-result` | no association |
| failed fstat | `io-fault / :io-syscall`, operation `:identity`, errno preserved | no retry |
| nonregular file | `io-fault / :io-file-kind` | no association |
| proof used with another capability | `invalid-argument / :io-association-capability` | no syscall |

Rejections and faults do not mutate state/frontiers, close files, or adopt
batches. Controller retains cleanup and quarantine responsibility.
Typed callback errors propagate; no generic handler
absorbs them. Both states are rechecked after callbacks.

For compatibility, omitting `:associazione-file` retains the ACTIVE
constructor's original precondition: caller must prove physical identity.
The new explicit path verifies it in product. Concrete server
opening/rotation registration still needs to adopt it; constructor does not
open files automatically or make a path ignoring this proof safe.

The [new writer-segment preparer](inizializzazione-active.md) requires
proof before first write and on ACTIVE-source adoption,
alongside flush, header reread, and parent fsync.

<a id="decisioni-e-stato-delle-evidenze"></a>

## Decisions and evidence status

| ID | Compound decision | Outcomes to cover separately |
|---|---|---|
| FID-D01 | device and inode in allowed types | both valid; each invalid/missing result |
| FID-D02 | backend present and callback absent | native; injected with callback; injected without callback |
| FID-D03 | device equal and inode equal | both equal; each component different; both different |
| FID-D04 | read-only and append identical to proof references | both exact; each capability replaced |

Functional cases, fault injection, FD reuse and concurrency tests,
condition coverage, and independent C1 review remain to be run. Author's
static readings do not close these activities. Requirements REQ-AFF-001/004/008
and REQ-FOR-001 do not change status through this implementation alone.

[Local catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-file-identity/catalogo.lisp):
product compilation, static checks, and disassembly. These are neither benchmarks
nor whole-database reliability tests. GET path unchanged;
proof creation allocates and may represent POSIX integers as bignums,
only during association in I/O pool.
