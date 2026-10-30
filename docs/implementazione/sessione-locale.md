<a id="sessione-locale-m16"></a>

# M16 local session

**Proposal — ADR-0056.** This is a contract to accept before M16
code, not an already available service. It implements the priority in
[ADR-0055](../adr/0055-interfaccia-locale-unix-socket.md). The
[SPK-11 method](../../spikes/SPK-11-unix-socket/README.md) distinguishes transport
tests from those still needed for the product.

<a id="frame-e-vocabolario"></a>

## Frames and vocabulary

For the first production service, the author authorized the
[M1 profile](production-unix-m1.md): same session vocabulary and
four commands with fixed payloads, one owner, and lower limits.
The extended proposal below remains distinct from that profile and its qualification.

Each frame is `length:u32be | body:length bytes`. Length excludes the
prefix and must be 1…17,825,792 bytes (17 MiB). Zero and larger values
close the connection after four bytes, before reserving the body.
There is no magic, delimiter, padding, compression, or TCP negotiation.
EOF with an incomplete prefix or body is truncation; EOF between frames is closure.

The body contains exactly one RFC 8949 deterministic CBOR item: minimal
headers, definite lengths, maps ordered lexicographically by key bytes
according to [RFC 8949 §4.2.1](https://www.rfc-editor.org/rfc/rfc8949.html#section-4.2.1),
without duplicate keys or
trailing bytes. The product codec is reused. Its structural scanner alone
does not certify map ordering/deduplication: these checks are
session decoder obligations. No external data passes through the Lisp reader.

The envelope is a five-element array `[version, kind, id, code, payload]`.
`version=1`; the other first four fields are unsigned integers, `id` at most
u64, `kind` and `code` at most u16. Payload is a CBOR item whose form is
defined by the command. Maximum envelope depth 8, excluding any
documents carried as byte strings and checked separately with the
16 MiB/100-level limit. Envelope and metadata occupy at most 64 KiB;
documents and keys have separate budgets. A batch requires an
additional contract with operation and byte limits; it is not an implicit command.

<a id="handshake-e-correlazione"></a>

## Handshake and correlation

| Kind | Direction | ID/code | Payload |
|---|---|---|---|
| 0 HELLO | client → server, first and only | 0/0 | map `{0: max-frame, 1: max-inflight}` |
| 1 WELCOME | server → client | 0/0 | map `{0: max-frame, 1: max-inflight, 2: [opcodes]}` |
| 2 REQUEST | client → server after WELCOME | positive ID/opcode | command arguments |
| 3 RESPONSE | server → client | same ID/status | result or `null` on error |

HELLO/WELCOME maps have exactly the keys shown. Client
capabilities are `4096 <= max-frame <= 17825792`, `1 <= max-inflight <= 16`;
the server chooses the minimum of its limits and those requested. The
limits apply in both directions and WELCOME confirms them. HELLO/WELCOME
fit within 4096 bytes; before handshake the decoder applies that limit.
No request executes before WELCOME. Invalid version, kind, direction,
shape, or ID closes without response, including a second HELLO.

REQUEST IDs increase strictly in received frame order, even
after completion; last ID and an in-flight request table suffice.
They do not represent commit order. Each admitted request has exactly one
terminal response if the connection survives; responses may arrive
out of order. A duplicate or unknown response is a client protocol
error. At maximum u64, finish in-flight work and reconnect.

The only opcode defined here is `0 PING`, argument `null`, result `null`.
It is available only after the engine gate. Other opcodes produce
`unsupported` without engine admission and without closing the session;
GET/PUT/DELETE, queries, and multiseries each require an approved payload.
WELCOME announces only operations actually enabled.
The opcode list is strictly increasing, without duplicates, of u16 integers.

| Status | Meaning |
|---|---|
| 0 ok | Result according to command |
| 1 invalid-arguments | Valid envelope, invalid command arguments; not admitted |
| 2 busy | Command capacity exhausted; not admitted |
| 3 unavailable | Engine state not operational; not admitted |
| 4 unsupported | Opcode absent from capabilities; not admitted |
| 5 limit-exceeded | Command budget exceeded before admission |

These errors do not describe an already admitted write. The outcome after
admission depends on the command and cannot be translated into a generic
`busy` or `aborted`. If the server cannot complete a correct response,
it closes; the client treats the outcome of unanswered requests as unknown.

<a id="capacità-proprietà-e-scadenze"></a>

## Capacity, ownership, and deadlines

Proposed defaults, all checked before opening:

| Resource | Limit |
|---|---|
| Transport I/O owners | 8, configurable 1…64 |
| Connections per owner | 8, including handshakes; backlog 64 per listener |
| In-flight requests per connection | 16, including results still to send |
| Retained input bytes per connection | 17 MiB + 4 |
| Retained output bytes per connection | 17 MiB + 4 |
| Byte pool per owner | 128 MiB, shared only by its connections |
| Complete HELLO | 5 s from accept |
| Assembly of a subsequent frame | 30 s from its first byte |
| Queued response through last byte sent | 30 s from enqueue |
| Idle connection, without in-flight work | 300 s from last complete frame |

No deadline is renewed by partial transfer. Time is
monotonic and injectable. The pool includes buffers retained by requests,
results, prefixes, and pending I/O; ownership movement does not release
budget. Contexts, codec scratch, and metadata have fixed size,
preallocated by capacity: they must be accounted separately from the byte
pool before starting service. These limits are not an RSS budget.

Connections have an immutable owner; the overall limit is the
product of owners and local capacity. Pools are disjoint, without a
global per-request counter. The body is reserved after the valid
prefix, before receipt. If capacity is unavailable, reading pauses with
the deadline retained, without queueing elsewhere. At the in-flight request limit,
reading stops; already coalesced data remains in the accounted buffer.
The prefix does not authorize the command: complete validation and result
reservation precede engine admission.

Deadline, incomplete EOF, or slow peer closes only that connection.
A result copied into the output buffer retains no EBR pin or writer
lease. Closure releases contexts once I/Os that own them have
completed, without releasing still-borrowed buffers. Future code must
check saturation and isolation with the real ADR-0045 pool.

<a id="percorso-avvio-e-arresto"></a>

## Path, startup, and shutdown

Explicit absolute path, without NUL, nonempty final component, maximum
100 UTF-8 bytes excluding NUL: a conservative common Linux/macOS ceiling to
verify on both, not inferred from Lisp character count.
The runtime directory must already exist, belong to the service UID,
and be 0700 (same account) or 0750 (configured client group).
Socket 0600 or 0660 according to mode; directory and namespace chain must
be owned and not replaceable by untrusted accounts. Symlinks
and group/other-writable directories are rejected; owned opening and
checks must prevent races between namespace check and use.

The listener appears after recovery, root publication, and the engine
admission gate. The runtime capsule alone or H=M does not attest
completed recovery. There is no automatic alternate TCP listener.
An occupied node remains intact, even if it is an orphaned socket. Shutdown
closes admission, then connections/listener; only the node whose
device/inode identity still matches the one created by the instance in the
protected directory is deleted. Replaced node: diagnostics and no removal.
Orphan management remains an explicit action with the service stopped.

<a id="fixture-indipendenti-e-gate-residui"></a>

## Independent fixtures and remaining gates

PING request ID 1: `00 00 00 06 85 01 02 01 00 f6`.
Response: `00 00 00 06 85 01 03 01 00 f6`.
ID 2 may receive a response before ID 1. HELLO with capabilities 4096/1:
`00 00 00 0c 85 01 00 00 00 a2 00 19 10 00 01 01`.
A negative variant uses `0d` as body length and must be
truncated at EOF. M16 tests must include both.

The [SBCL 2.6.9 socket-receive source](https://github.com/sbcl/sbcl/blob/sbcl-2.6.9/contrib/sb-bsd-sockets/sockets.lisp)
allocates a temporary alien buffer and copies received bytes. The C4 spike may
use it; the product hot path requires a native I/O adapter
with owned/preallocated buffers and explicit offsets, also checked for native
allocations. The contrib remains usable for socket
lifecycle. No direct connection from compute worker to recv/send.

Before product code, ADR-0056 acceptance, session decoder
fixtures (including maps and negotiation), injectable I/O API, and data command
contracts are needed. Before application integration, all gates in
the [verification plan](../affidabilita/piano-di-verifica.md#interfaccia-locale-unix-socket) remain.

The [SPK-11 C4 variant](../../spikes/SPK-11-unix-socket/session-method.md)
now checks the 4096-byte control profile: handshake, limits,
maps, IDs, reversed responses, and logical deadlines. The gate indicator and
credits are a model; the real pool and admission remain to be connected.
That result does not extend to documents, data commands, or a product listener.
The [report and originals](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-17-unix-session/report.md)
retain the three variants, harness failure, and full verification.

The [I/O variant on owned buffers](../../spikes/SPK-11-unix-socket/native-io-method.md)
now prepares one direct recv/send step on preallocated vectors, with replaceable
backend, explicit offsets, and deadlines. FD waiting and parsing remain outside
the adapter. Fault injection, independent peer, and guards check
progress and boundaries; the Lisp counter and disassembly do not qualify
native malloc, pool/scheduler, or the whole session. It remains C4 experimental code.
The [collection of originals](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-22-unix-native-io/report.md)
retains the fourteen scenarios, five variants, and two full checks
run before the subsequent general integration.
