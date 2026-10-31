# M1 local performance integration — contract before measurement

REQ-IPC-002, REQ-IPC-003, REQ-LIM-003, REQ-FOR-003, INV-I1, INV-I8, INV-P6.
CRC qualification follows [ADR-0074](../adr/0074-crc32c-sbcl-2.6.10.md);
local framing and strong acknowledgments retain ADR-0055/0056.

Replace the client/server fixed 1 ms sleep with descriptor readiness. A private
I/O poll array has at most nine slots (listener plus eight connections), eight
bytes each. Client owns one slot. Descriptors are borrowed and never closed by
the wait layer. Only macOS ARM64 and Linux x86-64 pollfd ABIs are admitted;
all pinning/FFI is confined to I/O. Owner and reentry are checked before scratch
writes; unwind cleanup releases the waiter on errors/nonlocal exits. No global
event handler is registered.

Read interest follows HELLO/REQUEST; write interest follows WELCOME/RESPONSE.
The server first gives every slot a finite nonblocking step, then waits only
when none made progress. The next wait is capped by the nearest existing
absolute deadline and 100 ms, preserving stop responsiveness without polling
at 1 kHz. Poll timeout rounding does not admit expired work: deadlines are
checked again after wakeup, before any request. No engine pin/lease spans a
peer wait. Client waits for the actual transfer direction after EAGAIN/EINTR;
absolute deadlines are never renewed by progress or interruption.

POLLHUP/POLLERR wake the existing transfer/EOF handling. POLLNVAL fails explicitly
instead of spinning. EINTR returns to the actor without retry; malformed native
count/errno/flags fail invariant checks. Error and nonlocal-exit boundaries keep
existing cleanup and unknown-outcome semantics. Shutdown still closes only owned
resources; no wire opcode, durable record, scheduler or per-client thread is added.
A trusted injected backend may implement `:poll(buffer,count,ms)` for fault tests.

## Verification decisions

| Decision | Required checks |
|---|---|
| Capacity 1..9 / callback type / qualified ABI | endpoints, each false term, at most 72 bytes |
| Owner and reentry | wrong thread, nested wait/configuration, nonlocal exit and reuse |
| Slot in capacity / FD NIL or int including zero / direction | separate failures, disabled slot, FD zero, input/output |
| Timeout 0..100 / native count bounds / errno domain and sign | exact bounds, each independent invalid result |
| Ready flags/count / NVAL / EINTR versus hard failure | count/flag mismatch, EOF/error, interrupted, I/O fault |
| Clock expired or remaining cap | deadline equality/past, sub-ms ceil, exact 100 ms, cap |
| Request idle versus started frame / read versus output state | HELLO, idle REQUEST, partial REQUEST, WELCOME/RESPONSE, closed |
| Compiler allowlist/platform/disablement | 2.6.9 and 2.6.10 positive, unknown versions and independent false features |

Native pipe/socket wake tests, scripted partial transfers and EINTR/error paths
precede real product server/client tests and the complete strict suite.
CRC checks compare against the independent software kernel across offsets,
lengths, seeds, incremental splits and unchanged buffers; fresh processes
exercise native/software/native ASDF cache reuse with no force.

Re-run the exact earlier focused and GET component benchmark drivers on the
new sources. Compare to [the recorded baseline](../../spikes/results/2026-10-31-local-index-bench/report.md)
without changing its raw data or driver. Preserve runtime/backend, key/value
sizes, request counts, three/five replicas, warmups, and oracle/timer costs.
No claim of cache-cold throughput, peak RSS, concurrent M1 or power-loss follows.

Two C1 readings cover borrowed-FD ownership, bounded waits and deadline/error
boundaries, then compiler/CPU gating, format compatibility and unchanged
canonical durability. [Results](../../spikes/results/2026-10-31-local-performance-fix/report.md).
