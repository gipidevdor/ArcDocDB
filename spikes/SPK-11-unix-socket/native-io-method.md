<a id="io-unix-su-buffer-posseduti--metodo-preregistrato"></a>

# Unix I/O over owned buffers — preregistered method

SPK-11 C4 variant, October 17, 2026, before runs. Prepares ADR-0055's priority
NNTP path without introducing product M16 code or accepting ADR-0056.
REQ-IPC-002, REQ-VAL-001.

<a id="domanda-e-criterio"></a>

## Question and criterion

Can one `recv`/`send` call transfer a span of a preallocated byte vector without
slices or temporary alien buffers in adapter, with explicit offset, immediate
result/errno, and replaceable backend? Success: bytes identical to fixtures,
external guards intact, advancement only for confirmed bytes, at most one syscall
per step, no call after completion, EOF, error, or expiration.

<a id="proprietà-e-oracoli"></a>

## Ownership and oracles

- Owner retains FD and simple specialized vector for whole synchronous operation.
  Pin/pointer live only inside syscall; no asynchronous borrowing, concurrent close,
  or recycling modeled.
- Nonempty in-vector span, FD, direction, chunk, and clock checked before backend.
  Trusted callbacks receive FD/vector/offset/count and return byte count/errno
  under native rules.
- Deterministic scripts test short I/O, EAGAIN/EWOULDBLOCK, EINTR without internal
  retry, partial EOF, zero send, fatal errno, impossible results.
  Range/direction errors and deadlines must leave call count zero.
  No progress renews absolute deadline.
- Step neither waits on FD nor retries in a loop. C4 harness waits outside adapter
  with existing deadline, without compute workers.
- Two real SBCL processes exchange bytes with nonzero offsets/guards, one-byte
  and larger chunks; handshake/PING remain C4 fixtures. Old transport is independent
  peer for new adapter. Mid-transfer closure must produce EOF with exact progress.
- Local pair tests empty recv, send saturation without reader, closed peer.
  Per-call SIGPIPE suppression, no global signal change. Finite byte/call limits
  and deadlines.

<a id="allocazioni-e-sensibilità"></a>

## Allocations and sensitivity

Preallocate buffers/contexts and warm functions before observed window.
Record `sb-ext:get-bytes-consed` before/after successful native steps and recv
EAGAIN; counter must detect known allocation. Subtract no baseline.
Retain disassembly of two FFI wrappers and step. Result measures neither transient
libc/runtime malloc, kernel memory, RSS, socket open, FD wait, nor codec/session.
Source must show absence of `make-alien`, slices, and temporary copies in adapter
only; this observation does not qualify native allocator.

Known mutations check content/guard, progress, call-count, and deadline oracles.
Retain compilations and failed attempts with sources, without overwriting closed
session campaign.

<a id="riferimenti-e-confini"></a>

## References and boundaries

Return contract, short I/O, EOF, and errno follow Apple manuals for
[recv](https://developer.apple.com/library/archive/documentation/System/Conceptual/ManPages_iPhoneOS/man2/recv.2.html)
and [send](https://developer.apple.com/library/archive/documentation/System/Conceptual/ManPages_iPhoneOS/man2/send.2.html).
ABI/flags explicit for macOS ARM64/Linux x86-64; executed test qualifies only
recorded environment. FFI uses
[SBCL pointers](https://www.sbcl.org/manual/index.html#Foreign-Function-Interface).

Real pools/scheduler, engine gate, global credits, maximum document/envelope,
commit, EBR, lost response after commit, distinct users, and Linux not tested.
No benchmark. IPC requirements still designed; ADR-0056 acceptance and engine
integration remain before service.
