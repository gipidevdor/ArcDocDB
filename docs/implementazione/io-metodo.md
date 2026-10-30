<a id="metodo-di-verifica-del-confine-io"></a>

# I/O-boundary verification method

Registered before implementation and campaign execution. Scope:
read-only opening, exclusive `.tmp` creation, exact pread, exact append,
file/directory flush, single close. No rename, deletion,
truncation, index publication, or transaction acknowledgment.

<a id="contratti-da-verificare"></a>

## Contracts to verify

- Reads do not change file cursor or write shared state; the
  caller keeps descriptor alive and owns destination buffer.
- A task owns the writable file until append/flush completes.
  Different files share no mutable state, locks, or per-operation counters.
- Every positive progress advances by the amount returned; every loop has at most
  as many steps as requested bytes. Zero progress and impossible returns
  are errors. A write/flush error, including EINTR, is not retried.
- Budgets, capacity, and offsets checked before first syscall. A rejection
  leaves file usable; a write/flush fault makes it faulted.
- Durable position advances only after successful flush. A later error
  does not undo historical positions but prevents future mutating operations.
- Close invalidates descriptor before calling backend: no retry or
  second close, even with EINTR, because the number could be reused.
- Native: Linux fdatasync, macOS F_FULLFSYNC; fsync for directories. Buffer pinning
  only in io module; no pointer exported through public APIs.

<a id="prove"></a>

## Tests

Injected backend with short returns, one-byte progress, initial/partial EOF,
negative/excessive/noninteger returns, EIO, ENOSPC, and EINTR before/after progress.
Checks: argv/offset, buffer contents, call count, file
state, written/durable position, and no calls after failure.

Real fixtures in an exclusive temporary directory: creation, append of a
header and SEAL batches, flush, read-only reopening, byte comparison, and codec
verification. Directory also synchronized. Checks include existing files,
symlinks, wrong file/directory types, and repeated/concurrent positional reads.
These tests do not simulate power loss or storage-media malfunction.

`make test lint` and `make check`. Wrapper `tools/record-command.lisp` preserves
command, environment, revision, blobs before/after, outcome, stdout/stderr, and failures.
Targeted coverage and mutations in processes separate from measurements.

<a id="misure"></a>

## Measurements

Five samples, warmup, preallocated fixtures and buffers, full GC before
sample, safety 3. Measure time and SBCL heap: real pread from file-system
cache (2 KiB), real append without per-operation flush, and simulated backend to isolate
check costs. A self-test also detects deliberate allocations. Check
zero heap bytes in selected successful paths, without generalizing to errors.

Any flush measurements are local syscall latency, not engine commits
or sustained NVMe throughput; samples preserved in full. P99 is not
inferred from five samples. External load and OS cache uncontrolled.
C1 qualification, Linux x86-64, Serie/Archivio events, I/O pool, and integrated
engine faults remain separate criteria.
