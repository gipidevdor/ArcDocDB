# Native full-frame socket grants — two C1 readings

REQ-IPC-002, REQ-IPC-003, REQ-LIM-003, REQ-AFF-004; existing ADR-0055/0056
service/framing and ADR-0035 injectable I/O boundaries. No protocol, persistent
format, actor scheduling or engine admission change. All new functions retain
safety 3, speed 2, debug 2, complete FTypes, requirement tags and ownership contracts.

## First reading: ABI, bounds, grants and effects

Darwin ARM64 uses SOL_SOCKET 0xffff and buffer options 0x1001/0x1002, as declared
by the local platform SDK. The existing Linux x86-64 profile uses SOL_SOCKET 1,
buffer options 7/8. The fixed int/socklen scalar ABI is four bytes. Getter return
and exact returned size are checked before using the scalar; errno is captured
immediately on -1. Setters use one local int, no borrowed Lisp array or retained
pointer. Native platform gating remains before the default control adapter.

One fixed 65,540-byte request covers maximum M1 body plus prefix. Inspect both
directions independently. Preserve grants at/above this minimum; below it, set
once and verify a positive signed-int effective grant at/above the minimum.
Linux-style doubled readbacks are accepted. Kernel policy/accounting may retain
more than the request, and is separate from Lisp quotas/RSS. No global sysctl is
modified. Two directions bound the loop and at most six option syscalls occur
per acquisition; no option syscall or new allocation enters a request path.

## Second reading: ownership, failures and unchanged engine semantics

Configuration runs for newly created and accepted sockets, before the existing
FD handoff. NONBLOCK/CLOEXEC preserve unrelated flags. Any configuration error
returns through the existing single-close boundary, retaining primary and close
failure causes; FD zero remains valid. Injectable :configure continues to cover
the complete operation; detailed option operations are independently injectable.
Trusted native lifecycle callbacks retain their existing no-reentry/nonlocal-exit
preconditions. There is no retry or peer wait in the new operation.

Partial receive/send offsets, EINTR/EAGAIN, per-slot fairness, deadline expiry,
strong group completion, release of GET pins before send, CRC/exact-key checks,
STOP and cleanup remain on their existing code paths. The proposed second actor
output phase was not implemented. Larger buffers cannot certify complete sends;
all existing short-I/O and lost-response semantics remain required.

## Decisions and tests

| Decision | Detection |
|---|---|
| FD is int 0..2^31−1; backend valid | each invalid term rejected before any callback; zero exercised |
| Grant is positive signed int | zero, negative, NIL, string, overflow independently rejected in both directions |
| Grant below / equal / above 65,540 | cross-product endpoints, independent send/receive values, no shrinking |
| Set succeeds exactly with zero | syscall failure, EINTR, unexpected positive result; one attempt only |
| Readback valid and sufficient | small, malformed, failure; exact and doubled positive readbacks |
| Native getter returns zero and size four | each false term separately injected; actual EBADF errno capture |
| Native setter borrows int/four-byte size | argument inspection, actual EBADF errno capture |
| Failure before new/accepted FD handoff | both acquisitions, FD zero, exactly one close, optional close failure preserved |
| Qualified real socket | both effective grants, NONBLOCK/CLOEXEC and preservation of larger existing grant |

Eight new catalogued methods supplement existing native, actor/client, framing,
strong-group, process/recovery and crash-model suites. Full qualification and
source identities are recorded separately; this review alone does not certify a
completed run. No Linux execution, power-loss or reference-hardware claim follows.
