<a id="apertura-readonly-relativa-metodo"></a>

# Relative read-only opening: method

Method registered before execution. The increment connects an already owned
namespace to readers under ADR-0017, ADR-0033, and COD-37.
It changes neither formats, durable decisions, nor the ADR-0040 table.

<a id="contratto-e-ownership"></a>

## Contract and ownership

`apri-lettura-nella-directory(directory, nome, …)` returns a new
read-only capability and size observed through the same FD.
Parent stays borrowed, open, and reusable. The controller
prevents namespace/file mutations during the call and
concurrent capability closes. The owner then keeps the
child live until its readers become quiescent.

Name is a printable ASCII leaf of 1 to 255 bytes, excluding `.`, `..`,
NUL, and separators. Private copy and capability are prepared before
opening. Native mode uses `openat` on parent, read-only,
`O_CLOEXEC`, `O_NOFOLLOW`, `O_NONBLOCK`; `fstat` must certify a regular file.
Complete device/inode are compared with the same parent's relative nofollow
entry before publication. No parent path is
reopened. Name certifies neither header nor manifest
membership: those checks remain with readers and controller.

Backend is inherited from parent. Optional extensions are
`open-relative(fd-parent, nome, :input) → fd-child` and
`file-metadata(fd-child) → device, inode, dimensione`; `entry-identity`
is also required. Callbacks check regular type and respect
ownership and immutable names. Until a valid FD is returned, the opening
callback owns its rollback; after return the product
owns the child. An FD equal to parent is rejected without closing it.
Missing callbacks do not fall back to native primitives.

Proposed budgets: transfer from 1 to 256 MiB and maximum size from
zero to `most-positive-fixnum`, default 4 GiB−1. Zero permits only
an empty file. Size is an opening snapshot: neither a validated,
committed, or durable frontier nor an RSS limit. The read-only capability's
`written` and `durable` frontiers remain zero.

<a id="guasti-e-cleanup"></a>

## Failures and cleanup

Every valid acquired but unpublished FD receives one close request
through the backend that opened it. The private capability
becomes `:closed` before the request; EINTR is not retried. This
cleanup is attempted even if a callback invalidated parent.
No rejection closes parent or an already caller-owned capability.

If close succeeds, the original typed condition propagates
as the same object. If cleanup fails too, `io-fault` retains
primary reason and offset and cleanup-errno; for an I/O cause it also retains
operation, errno, and progress. Class change for a primary non-I/O
cause is explicit and follows inventory's budget+cleanup policy.
A nonzero close return is failure even without available errno.
NIL errno therefore does not certify successful closure.

A nonlocal exit outside ordinary typed errors attempts
cleanup without attaching any secondary errno to the cause.
Close callbacks must respect the I/O-error contract;
unrelated cleanup errors remain outside this protocol.
Without-interrupt windows protect FD handoff and closure;
they introduce no asynchronous cancellation protocol. Syscalls
may block: this path belongs to the I/O pool and promises no
wall-time deadline.

<a id="decisioni-e-prove-preregistrate"></a>

## Decisions and preregistered tests

| ID | Decision / boundary | Cases |
|---|---|---|
| OR-D01 | valid parent and configuration | modes, closed/faulted, out-of-range budget, zero/exact |
| OR-D02 | valid private leaf name | empty, dot path, separators, NUL, non-ASCII, 255/256 bytes, caller-name reuse |
| OR-D03 | backend capabilities | native, three callbacks present, each absent, no fallback |
| OR-D04 | FD acquisition | valid, invalid result, parent alias, error before transfer |
| OR-D05 | regular bounded metadata | complete integer components, each invalid, zero/exact/excessive size |
| OR-D06 | bound FD and name | same device/inode, each component different, check failure |
| OR-D07 | parent still open | invalidation by every callback before further operations |
| OR-D08 | cleanup without publication | one close, no retry, correct backend, primary/secondary errno, nonzero |
| OR-D09 | anchored native read-only | bytes, EOF, flags, symlink/FIFO/directory, absent and renamed parent with decoy |
| OR-D10 | vertical-reader use | CONTROL, decision log and ACTIVE with same-capability EOF; existing v1/v2 and crash cases |

Native fixtures reuse bounded resource registries, exclusive
0700 namespaces, finite cooperative deadlines, and cleanup only of test-created names.
Interoperation checks do not interrupt a blocked syscall. They compare
bytes, identity, state/frontiers, and FD ownership with C4 POSIX oracles.
Injected tests also observe callback order and count.
Pure error tests do not certify native syscall fault injection.

Two static readings precede compilation and execution. Sources
are frozen in a commit; the complete check is recorded through
`record-command` and a new ASDF cache. Every attempt remains distinct,
including failures and corrections. Linux/macOS CI of the integrated
version is a separate snapshot. Cited evidence will be collected
with the existing collector, explicit manifest, and closed inventory.

Requirements: REQ-STO-003, REQ-REC-001, REQ-AFF-001/004/008/018,
REQ-FOR-001, and REQ-VAL-001. Invariants: INV-A7/A9/A10, INV-P6, INV-X3.
Owned collection of all live segments, reconciliation execution,
Recovery Manager, admission, complete C1, MC/DC,
mutation testing of new paths, and performance measurements remain open.
