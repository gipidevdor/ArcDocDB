<a id="decisioni-del-confine-io"></a>

# I/O-boundary decisions

COD-54 inventory; tests in [`tests/io/`](../../tests/io/), with REQ in names.
This is not MC/DC attestation or C1 qualification.

| Predicate | Cases |
|---|---|
| `nome-file`: empty or NUL | both rejected, valid name: `REQ-STO-003-open-preflight-and-errors` |
| `nome-file`: directory and non-root component | normal directory, symlink with trailing slash, normal file: `REQ-STO-003-native-no-follow-file-kinds-and-cloexec`; root not normalized |
| `nome-file`: append and valid `.tmp` suffix | read-only without suffix, valid append, too short and wrong suffix: preflight test |
| `apri`: max-transfer in range and positive capacity | 0, over maximum, zero capacity, valid: preflight test |
| `progresso`: integer and 1 ≤ n ≤ remaining | 1/short/complete, 0/negative/excessive, nil/double/keyword: `REQ-AFF-008-invalid-progress-and-eof`, short append/pread |
| `chiudi`: state not closed | normal close, EINTR/EIO error, impossible return, repeated close: `REQ-AFF-001-close-once-even-eintr`, `REQ-AFF-001-invalid-close-result-and-closed-reader` |
| `fallisci`: read operation | nonmutating read, faulted write/flush: read/write errors and flush-frontier tests |
| `native-open`: directory or regular file | correct directory, correct file, directory used as file, FIFO, file used as directory: type/symlink/CLOEXEC tests |

<a id="decisioni-semplici-e-corrispondenze"></a>

## Simple decisions and mappings

- Pointer/offset progress: `REQ-STO-003-short-pread-positional-no-state-write`.
- Capacity and transfer budget checked before syscall; equality allowed,
  zero bytes without syscall: `REQ-AFF-008-preflight-budget-and-zero-length`.
- Written position updated only after positive progress, durable only
  after successful flush: short append and `REQ-AFF-001-flush-error-preserves-durable-frontier`.
- Write/flush error never retried, including interrupts: EIO/ENOSPC/EINTR error tests.
- Directory uses fsync and file uses strong flush; directory failure faults it:
  `REQ-AFF-001-directory-flush-dispatch-and-invalid-return`,
  `REQ-AFF-001-directory-failure-and-empty-file-flush`.
- Immediate errno and primary/secondary cleanup preserved:
  `REQ-AFF-004-native-errno-and-cleanup-provenance`.
- Uninitialized private FD rejected before syscall:
  `REQ-AFF-004-invalid-private-descriptor-before-syscall`.

<a id="copertura-da-qualificare"></a>

## Coverage to qualify

No external bytes can make the final transfer-loop branch
true: every iteration advances by at least one verified byte, bound is byte
count, and scanning ends when remainder is zero. Final durable-frontier
check is defensive against an internal defect. Mode types and ABIs
impossible in the current environment remain active guards.

sb-cover data includes definitions/proclamations and inline copies of native
wrappers. Native branches for other OSes, fstat failure between open/validation, and all
defensive exceptions still require C1 analysis and review. Direct
cleanup testing and open callbacks do not establish every kernel failure.
No automatic denominator exclusion and no complete certification.
