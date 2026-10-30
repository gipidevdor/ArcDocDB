<a id="confine-io"></a>

# I/O boundary

POSIX primitives in Common Lisp/SBCL: exclusive creation, positional read,
append, durable flush, and close. They implement the boundary required by
[ADR-0017](../adr/0017-piattaforma-e-io.md), with errors under
[ADR-0033](../adr/0033-fail-stop-e-integrita-end-to-end.md). The owner executes
them in I/O pool tasks ([ADR-0045](../adr/0045-modello-di-esecuzione.md)).
The pool and transaction engine remain modules to integrate.

<a id="contratti"></a>

## Contracts

| API | Result |
|---|---|
| `apri-lettura` | read-only regular-file capability, concurrent preads on separate buffers |
| `apri-lettura-nella-directory` | [read-only capability and size from same FD](io-apertura-relativa.md), anchored to owned directory |
| `crea-temporaneo` | new `.tmp` with O_EXCL, O_APPEND and 0600 permissions; no writable reopening |
| `crea-temporaneo-nella-directory` | [new `.tmp` relative to parent FD](io-creazione-relativa.md), empty regular file and identity verified before return |
| `apri-directory` | directory capability for fsync |
| `leggi-esatto` | fills `[start,end)` from explicit offset; returns end without modifying cursor |
| `append-esatto` | completes range and returns written position; certifies neither commit nor durability |
| `durable-flush` | file: fdatasync Linux, F_FULLFSYNC macOS; directory: fsync; advances frontier after success |
| `chiudi` | invalidates capability before one close; subsequent calls no-op |
| `stato-file` | open, faulted or closed |
| `mode-file` | immutable input, append or directory mode; no descriptor exposed |
| `verifica-capienza-append` | checks group total and maximum chunk before first write |
| `verifica-capienza-lettura` | checks mode/state and allowed byte count before effects on other files |
| `associa-file`, `verifica-associazione-file` | read-only/append [physical identity proof](associazione-file.md), created in I/O pool and checked without syscall |
| `posizione-scritta`, `posizione-durevole` | new-file frontiers observed by owner |

`file-io` is a capability with a private descriptor. The caller owns
namespace, prevents external modifications, and keeps descriptor live until
all readers finish. Append and flush on the same file have one owning
task. There is no global lock, thread per Serie, or mutable state across
files/Serie. A successful or failed reader does not write capability state.
Closing requires readers to have finished: reference protocol
and segment quarantine belong to the owner.

Reads return bytes to the codec, which must verify CRC and identity before
a client response. These APIs publish no indexes and acknowledge no batches.
The two-SEAL-batch test demonstrates I/O/codec connection, not an integrated
engine commit. [Temporary replacement](pubblicazione-control.md)
adds rename relative to parent FD with names bound to expected
files. Deletion and truncation still have no product API.

<a id="guasti-e-frontiere"></a>

## Failures and frontiers

Every syscall with positive progress advances by exactly that byte count.
A loop has at most one iteration per requested byte. Completing short I/O is
distinct from retrying an error: **no error is retried**, including EINTR.
Zero write, EOF, and impossible returns are explicit failures.

Failed writes/flushes mark file faulted before reporting `io-fault`.
Every future append/flush is rejected without syscall; durable frontier remains
that of the last successful flush. Controller must propagate the event to
Serie/Archivio state and metrics: that connection remains to be integrated.
The condition is not ignored and no batch is acknowledged after error.

The condition exposes operation, errno, and known progress. Close is not
retried because FD number may already have been reused. An fstat failure
during opening closes the unpublished descriptor once;
both primary error and any cleanup errno are preserved.

<a id="confini-e-risorse"></a>

## Boundaries and resources

Buffers are specialized octets. They are exclusive during reads and stable during
append. Ranges, budgets, and offsets are checked before first syscall.
Configuration/capacity rejection does not fault the file. All
pointers and pins remain inside `src/io/` and are not exported through APIs.

> **Proposal** — Maximum transfer budget 256 MiB, lowerable per capability;
> initial new-file capacity 4 GiB−1, configurable. Positions/capacities are
> nonnegative fixnums through `most-positive-fixnum`, staying within 64-bit off_t.
> This is an in-memory interface limit, not a persistent-format change.
> It avoids boxing/bignums in hot-path arithmetic. Segments remain subject
> to ADR-0048's v2 limit; individual log capacity must be configured by
> its controller. This module decides no rollover.

O_NOFOLLOW rejects final-component symlinks and CLOEXEC prevents descriptor
inheritance. Directories have the trailing separator removed before open,
so it cannot bypass O_NOFOLLOW. Path ancestors must be controlled
by the controller: no openat protocol for hostile namespaces is introduced here.
Directories/FIFOs cannot become read-only segments; O_NONBLOCK avoids
blocking on a FIFO before fstat rejects it.

The injectable backend is an immutable table of six functions: open, reader,
writer, file flush, directory flush, close, with optional `:identity` callback
to bind two capabilities to the same file. `:entry-identity` and `:rename`
are optional for [control-log publication](pubblicazione-control.md),
with replacement rejected if missing. `:open-relative` and
`:file-metadata`, together with `:entry-identity`, are needed only
for relative read-only opening. `:create-relative`, with
`:file-metadata` and `:entry-identity`, is required for exclusive relative
creation of new `.tmp` files. It receives vectors/ranges, never SAPs.
Callbacks are trusted code, signal syscall-error for errno, and respect
buffer lifetime and ownership. `nil` selects native path with two
inline alien calls; no C/C++/Rust or project library outside Lisp.

<a id="prove"></a>

## Tests

[Method](io-metodo.md), [decisions](io-decisioni.md), and
[catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-io/catalogo.lisp).

18 new tests include short I/O, one byte per step, partial EOF, EIO,
ENOSPC, EINTR, frontiers, budgets, ambiguous close, cleanup errno, file types,
symlink with trailing separator, CLOEXEC, concurrent preads, and two v1/v2 SEAL batches
written with one flush. All 10 targeted mutations detected; no warnings
or style-warnings in product compilation, lint without violations.

```sh
make test lint
sbcl --noinform --no-userinit --script tools/io-bench.lisp --self-test
sbcl --noinform --no-userinit --script tools/io-bench.lisp --bench
sbcl --noinform --no-userinit --script tools/foundation-coverage.lisp --report /tmp/io-cover/ io
sbcl --noinform --no-userinit --script tools/foundation-mutation.lisp --run /tmp/io-mutants-new/ io
make check
```

Requirements: REQ-STO-003, REQ-AFF-001/002/004/008, REQ-FOR-003, REQ-VAL-001.
Invariants: INV-A1/A2/A3/A4/A8/A9, INV-P6, INV-X3. Their engine-wide status
remains distinct from these local tests; no automatic promotion.

<a id="prestazioni-e-limiti-delle-evidenze"></a>

## Performance and evidence limits

The [first measurement](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-io/benchmark-iniziale.lisp)
found heap in native calls. Inline alien calls and fixnum arithmetic
removed those allocations without reducing safety or checks.
The [zero-allocation campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-io/benchmark-zero-heap.lisp)
reports zero heap bytes in all five samples of every selected path.
Original samples remain preserved; `io-bench` prints results and fails
if an otherwise successful campaign detects heap.

Local Apple M4/ARM64 measurements, SBCL 2.6.9, safety 3, one worker, median of five
samples: 2 KiB pread with warm OS cache about **1.34 M/s**; 2 KiB append without
per-operation flush about **206 k/s**; 64 KiB append + strong flush about **269
groups/s**. These are neither database performance, sustained NVMe I/O, nor request
latency. Flush cost depends on filesystem/device/local load;
P99 cannot be inferred from this campaign. Zero heap applies to measured successful
paths, not errors, opening, or initialization.

Two readings checked ABI/format/errno, then buffer/FD lifetime,
frontiers, bounded loops, and absence of cross-Serie state. Independent
review, C1 qualification, native Linux x86-64 testing, integrated engine
fault injection, and actual medium failures remain. Coverage retains definitions,
inline copies, and defensive guards in denominator; it does not equal MC/DC.
Successful flush still requires OS, filesystem, and medium to honor
the declared guarantee: it is not proof against a lying device.

Native constants compared with installed headers and primary sources:
[Apple XNU fcntl.h](https://github.com/apple-oss-distributions/xnu/blob/main/bsd/sys/fcntl.h),
[Linux UAPI fcntl.h](https://github.com/torvalds/linux/blob/master/include/uapi/asm-generic/fcntl.h).

[Parent-relative rename](io-rinomina.md) centralizes the POSIX effect and
local fail-stop, also used by verified temporary replacement.

[I/O completion](io-completamento.md) defines append/flush cleanup, captured frontier, and capability checks after every fragment. These checks also serve the CONTROL path; tests alone do not certify complete recovery.
