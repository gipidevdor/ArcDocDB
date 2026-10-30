<a id="spk-11--trasporto-unix-e-sessione-locale-di-controllo"></a>

# SPK-11 — Unix transport and local control session

Method preregistered 2026-10-17, before runs. REQ-IPC-001…REQ-IPC-003,
REQ-VAL-001; [ADR-0055](../../docs/adr/0055-interfaccia-locale-unix-socket.md).
The [session contract](../../docs/implementazione/sessione-locale.md) is a separate
proposal: this experiment does not implement it in full.
The [preregistered session variant](session-method.md) adds HELLO/WELCOME and PING
in the 4096-byte C4 control profile only.
The [owned-buffer I/O variant](native-io-method.md) compares recv/send wrappers
with previous transport and deterministic backends.

<a id="domanda-e-criterio"></a>

## Question and criterion

Does SBCL contrib `sb-bsd-sockets` support a Unix stream with explicit framing state,
partial I/O, and observable runtime resources between two processes without external
libraries? Success: reconstructed bytes identical to fixtures, incorrect lengths
rejected before body allocation, no deletion of occupied/replaced names, children
terminated with expected outcome within absolute deadline. No latency measurement.

<a id="metodo-e-oracoli"></a>

## Method and oracles

- Bounded C4 u32be decoder: every split of two coalesced frames, one-byte input,
  0/max+1/u32 maximum, EOF in prefix and body. Explicit body-allocation counter,
  not heap bytes.
- Sensitivity: one corrupt byte, excess length, and truncated body must fail oracle.
  Valid/malformed CBOR uses product codec, loaded without introducing a second codec.
- Server/client in two separate SBCL processes. Listener already listening before
  child creation: no delay used as synchronization. First exchange limits reads/sends
  to one byte; second sends two frames together and reverses responses, checked by
  contents/ID.
- Exactly 16 MiB CBOR map document and 65,535-byte key in one frame. Byte-for-byte
  comparison; existing codec verifies document/key separately, not complete envelope
  exceeding 16 MiB.
- Zero and above-17-MiB lengths sent by child: decoder rejection, no body allocation.
  Peer closed midframe: truncation.
- Private 0700 directory, restricted 0600 node; preflight lstat against listener,
  orphan, regular file, symlink. Identity `lstat` before/after. Shutdown with replaced
  node: replacement stays intact. Raw bind to dangling link is a separate OS diagnostic,
  confined to target inside private directory.
- All socket I/O nonblocking with FD wait and 10 s deadline per exchange; child
  supervisor has 15 s deadline, then terminates/reaps child even on error.
  Deadlines are test limits, not proposed product limits.

C4 code may allocate and directly use sockets/clocks/processes.
No persistent database file is opened or modified. Test runtime files are created
in an exclusive `/tmp` directory, removed only after closing/reaping all owned resources.

<a id="variante-di-sessione"></a>

## Session variant

Eight families check frozen binary fixtures, ordered maps without encoded duplicates
including nested maps, negotiation, u64 correlation, credits, logical clock, and
context isolation. Four mutations check oracles. Prefix limit changes from 4096
before HELLO to phase limit; previous tests retain 17 MiB default.

Five new interprocess exchanges verify fragmented handshake and coalesced PINGs
with reversed responses, duplicate HELLO key, request before HELLO, prefix beyond
handshake limit, and reused ID. Logical result credits remain occupied until final
byte; saturation consumes no IDs. Maximum u64 stops new reads and requires reconnection
after draining. Progress does not renew logical deadlines. Simulated gate produces
`unavailable` without engine calls; it does not prove completed recovery.

<a id="esecuzione"></a>

## Execution

I/O variant separates each synchronous step from FD waiting: preallocated simple
vector, explicit offset/count, single nonblocking recv/send. Pin stays within syscall;
EAGAIN/EINTR preserve progress without internal retry, absolute deadline unchanged.
Guards and injected backends check ranges, short I/O, EOF, and errors before three
new interprocess scenarios: native server, native client, partial EOF.
Session peer uses previous transport with identical HELLO/WELCOME/PING golden bytes.

A local pair tests empty receive, saturation without reader, and send to closed
peer without SIGPIPE. Lisp-counter windows exclude construction, waits, codec,
and report; disassembly retained. Result measures neither transient malloc,
kernel memory, nor RSS. C4 frames/session still allocate; this is not product I/O pool.

```sh
sbcl --noinform --no-userinit --no-sysinit --script tools/run-spikes.lisp --check SPK-11
```

Runner compiles without warnings/style-warnings and retains child argv/output in
result. `--bench` returns `:unsupported`: no benchmark defined. Environment,
version, commit, and blobs recorded by shared harness. Every failure remains in
original records, including variants corrected later.

<a id="limiti"></a>

## Limits

Not tests of product listener/dispatcher, engine APIs, recovery/admission,
commit/durability, lost response, EBR, pool saturation, access denial with another
UID, or Linux/macOS qualification. No per-connection thread proposed for product.
Reversed responses are transport fixtures, not query results.
Test closes neither RSK-14 nor RSK-16 and promotes none of REQ-IPC-001…REQ-IPC-004.
Model allocates/accounts only REQUEST results; real I/O-owner pool, scratch/handshake,
idle deadline, product buffers, maximum envelope, and data commands remain pending.
Map checking attests neither application tag semantics nor key equivalence.

<a id="risultati"></a>

## Results

The [owned-buffer I/O collection](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-22-unix-native-io/report.md)
retains variants, disassemblies, and complete original checks from October 17,
closed in the October 22 collection.

The [local campaign and originals](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-17-unix-socket/report.md)
retain successful exchanges, rejections, five initial failures, and complete
intermediate checks. No estimated performance or M16 qualification.

Method variant after first name check: on macOS, raw bind accepted dangling link
without changing identity. Explicit lstat rejection before bind implements ADR-0055's
requirement without relying on kernel behavior. Earlier runs remain failed.
