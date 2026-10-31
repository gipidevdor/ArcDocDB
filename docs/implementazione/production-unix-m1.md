<a id="socket-unix-di-produzione--profilo-m1"></a>

# Production Unix socket — M1 profile

Restricted profile implemented under author's direction of 2026-10-22:
startup → recovery → admission → PUT/GET from distinct processes. Completes
[bootstrap](production-engine-bootstrap.md), reuses ADR-0055 and framing
from [ADR-0056](../adr/0056-sessione-locale-m16.md). M16 proposal's multithread/
multiseries defaults outside profile.

<a id="contratto-fissato-prima-del-codice"></a>

## Contract fixed before code

Server separate library `arcdocdb/local`, no startup on loading.
Calling thread owns engine/transport. Up to eight connections
served in nonblocking steps, one request in flight per connection.
Listener opened only after `apri-motore` returns READY.
No test manually rebuilds server state.

Frame: `u32be length | CBOR [1, kind, id, code, payload]`. HELLO/WELCOME,
correlation, ordered maps, states follow session contract.
Server limit 65,536 body bytes; client requests at least 4096,
at most 17,825,792. Minimum negotiated; in-flight always 1.
HELLO/WELCOME limit 4096. u64 IDs positive, strictly
increasing; no reuse or automatic retry after disconnect.

| Opcode | Arguments | Status-0 result |
|---|---|---|
| 0 PING | `null` | `null` |
| 1 PUT | `[key: bstr, document: bstr]` | durable unsigned u64 CSN |
| 2 GET | `key: bstr` | `[true, document: bstr]` or `[false, null]` |
| 3 DELETE | `key: bstr` | durable unsigned u64 CSN, even if already absent |

Binary keys 1 to 1024 bytes; documents 1 to 60,000 bytes. Document
contains one CBOR item with minimal headers/valid UTF-8, maximum
depth 100, verified separately from container. Profile neither
normalizes nor promises ordering/deduplication of maps inside document.
Envelope/control maps deterministic, exact shape;
no external bytes pass through Lisp reader. No implicit batch payload.

Status 1: invalid arguments; 2: exhausted capacity; 3: unavailable engine;
4: unsupported opcode; 5: limit exceeded. Rejections before
engine admission, `null` payload. Envelope/handshake/
ID/transfer errors close connection. Fault after admission
preventing certain answer closes; client reports unknown outcome.
PUT/DELETE respond only after strong engine completion.

Maximum response buffer owned before dispatch. GET requires
negotiated frame at least 60,032 bytes, enough for any profile
result; otherwise status 5 before reading. Value
copied/GET finished before waiting for peer: no EBR pin or writer
lease retained during send. Conservative, declared limit.

<a id="risorse-e-ciclo-di-vita"></a>

## Resources and lifecycle

Input/output buffers and scratch have finite per-connection capacities,
allocated before listener. Prefix causes no allocation proportional
to unverified lengths. Receive/send retain explicit offsets;
exact boundary reads leave subsequent coalesced frames in kernel.
No per-connection thread, unbounded spin, engine waiting for peer.
Decoder uses connection scratch; each frame produces fixed-size envelope
structure and argument copies within declared limits.
Transient allocations serial in actor, not a
queue. Client verifies document with fixed call-local scratch.
Profile claims neither nonallocation nor RSS ceiling.

Runtime directory exclusively locked until service close:
profile permits one listener per directory, even with different names.
All ancestors kept open, identities rechecked; root and
service UID trusted, must not mutate namespace during use,
because Unix bind/chmod operate by pathname.

Injectable monotonic clock; HELLO within 5 s of accept, frame within 30 s
of first byte, response within 30 s of enqueue, idle within 300 s.
Readiness-driven waits use a preallocated, actor-owned poll set (at most nine
descriptors), capped by the closest deadline and 100 ms; the client waits on
its actual input/output interest. No fixed 1 ms delay is imposed per request.
[Wait/error/qualification contract](prestazioni-local-m1.md).
Partial progress does not renew deadline. Slow client loses
own connection; others continue actor loop.

Explicit absolute path, maximum 100 UTF-8 bytes, no NUL. Existing runtime
directory 0700 owned by service UID, protected ancestors without symlinks or
group/other writes; socket 0600. Root/service UID trusted.
Namespace checks/owned descriptors accompany bind.
Data/runtime directories distinct. Occupied node,
even orphan after SIGKILL, retained; startup explicitly fails.
Operator removes orphan while service stopped or chooses new path.
Restart tests use new path to preserve crash node.

Shutdown: stop admission, close connections/listener, remove
only node still owned by identity, release namespace/engine.
Cleanup attempts all resources, preserves primary/secondary causes.
SIGKILL runs no application cleanup. No TCP fallback.

<a id="metodo-preregistrato"></a>

## Preregistered method

1. Independent wire fixtures: HELLO, WELCOME, PING, PUT, GET, DELETE, u64,
   exact limits, maps, duplicates, truncations, trailing bytes.
2. Injectable I/O: short transfers, EAGAIN, EINTR, EOF, errors, FD zero,
   absolute deadlines, sending without SIGPIPE.
3. Namespace: occupied, links, permissions, node replacement/cleanup.
4. Real dispatcher: invalidity/saturation before append, strong
   response, copied GET, admitted error without false busy, IDs/handshake.
5. Independent processes: product server, product client PUT/GET/DELETE,
   SIGKILL, reopen same storage/new path, new commits, second
   SIGKILL, third opening/exact data/tombstone comparison.
6. Fragmented client, coalesced frames, slow client/other operational client;
   no listener during recovery, collision without file destruction.
7. FI `:after-commit` through engine callback in real service:
   CLI client unknown outcome/no false acknowledgment, reopen with committed
   value present, next CSN 2. FI driver separate C4 tool;
   no failure option in product CLIs.

Two author static readings/independent review, then source/test
commit; all agents closed before execution. Every diagnostic command
uses recorder. Failures/variants preserved, lossless originals,
common repository collection. Qualification/report must state
exact platform, source, executed cases, residual limits.
No benchmark/performance result inferred from campaign.
Milestone #1 remains open until all criteria demonstrated.

<a id="ingressi-eseguibili"></a>

## Executable entries

Server receives data directory, socket path, hexadecimal Archivio/Serie UUIDs
(32 digits each), optional `--create`/`--version 1|2`. `--create` means
explicit initialization only: do not pass on restart. Runtime
directory must be prepared with stated permissions. Stdout `:state :ready`
record follows listener opening; diagnostics stderr.
SIGTERM/SIGINT initiate orderly CLI-process shutdown.

```text
sbcl --noinform --no-userinit --no-sysinit --script tools/local-server.lisp \
  DATA SOCKET ARCHIVE32 SERIES32 --create
sbcl --noinform --no-userinit --no-sysinit --script tools/local-client.lisp SOCKET put 01 182A
sbcl --noinform --no-userinit --no-sysinit --script tools/local-client.lisp SOCKET get 01
```

Client represents key/CBOR document in hex, returns structured
record, does not use Lisp reader for arguments. Example `182A`
is unsigned 42 CBOR document. Error/unknown outcome produces nonzero
exit; caller decides how to resolve possible retry.

## Optional startup image discovery

The library's `:index-discovery` option and the CLI flag `--discover-index`
connect the bounded engine discovery path to service startup. Recovery and full
image verification finish before listen/READY. See the
[configuration, validation and limits](scoperta-indice-local-m1.md).
