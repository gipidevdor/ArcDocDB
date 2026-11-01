<a id="socket-unix-di-produzione--profilo-m1"></a>

# Production Unix socket — M1 profile

Restricted profile implemented under the author's direction of 2026-10-22:
startup → recovery → admission → PUT/GET from distinct processes. It completes
[bootstrap](production-engine-bootstrap.md), reuses ADR-0055 and framing
from [ADR-0056](../adr/0056-sessione-locale-m16.md). The M16 proposal's multithread/
multiseries defaults are outside this profile.

<a id="contratto-fissato-prima-del-codice"></a>

## Contract fixed before code

The server is a separate library, `arcdocdb/local`, with no startup on loading.
The calling thread owns the engine/transport. Up to eight connections are
served in nonblocking steps, with one request in flight per connection.
The listener is opened only after `apri-motore` returns READY.
No test manually rebuilds server state.

Frame: `u32be length | CBOR [1, kind, id, code, payload]`. HELLO/WELCOME,
correlation, ordered maps, and states follow the session contract.
The server limit is 65,536 body bytes; the client requests at least 4096 and
at most 17,825,792. The minimum is negotiated; the in-flight limit is always 1.
The HELLO/WELCOME limit is 4096. u64 IDs are positive and strictly
increasing; no reuse or automatic retry after disconnect.

| Opcode | Arguments | Status-0 result |
|---|---|---|
| 0 PING | `null` | `null` |
| 1 PUT | `[key: bstr, document: bstr]` | durable unsigned u64 CSN |
| 2 GET | `key: bstr` | `[true, document: bstr]` or `[false, null]` |
| 3 DELETE | `key: bstr` | durable unsigned u64 CSN, even if already absent |
| 4 WRITE-GROUP, explicitly negotiated | `[[1,key,document] or [3,key], ...]`, 1..8 members | exact increasing positive u64 CSN array |
| 5 READ-GROUP, explicitly negotiated | `[key:bstr,...]`, 1..8 members | exact array of `[true,document:bstr]` or `[false,null]` |
| 6 VERSION, explicitly negotiated | `[0,key]`, `[1,key,expected,document]` or `[3,key,expected]` | versioned GET or conditional strong write result |

Default HELLO/WELCOME retain their original bytes and four commands.
`connect-local :write-groups t` offers HELLO key `2: [4]`; the server then
announces `[0,1,2,3,4]`. The client requires the exact offered capability before
READY. Missing/unsolicited capabilities are errors; no downgrade or retry.
Without negotiation, opcode 4 returns status 4 before engine admission.
See [ADR-0083](../adr/0083-explicit-unix-write-groups.md).

`connect-local :read-groups t` offers opcode 5. HELLO key 2 is the ordered
nonempty subset of `[4,5,6]`; WELCOME includes `[0,1,2,3]` followed
by exactly that subset. `:versions t` enables opcode 6 alongside either group option. The client checks
all flags and the absolute deadline before READY; incomplete handshakes close
ownership. Default and write-only bytes remain unchanged.
See [ADR-0084](../adr/0084-explicit-unix-read-groups.md).

Versioned GET returns `[true,CSN,document:bstr]` or `[false,0,null]`; conditional
PUT/DELETE returns `[true,new-CSN]` or `[false,current-live-CSN]`. Expected zero
tests absence. A conflict is status 0 and consumes no CSN/flush. Version operations
with a dependency on an earlier queued key drain those writes before comparison.
Independent ready mutations share the existing strong group writer, filtering
conflicts without CSNs or flushes; no timer or peer wait forms the group. Each
applicable operation retains its own SEAL and result. Versioned GET remains a
barrier and requires at least 60,040 body
bytes; other limits and mutation uncertainty remain unchanged.
See [ADR-0085](../adr/0085-conditional-current-writes.md).
Independent conditional coalescing and deadline/fallback rules are specified in
[ADR-0086](../adr/0086-conditional-same-turn-group-commit.md).

Binary keys are 1 to 1024 bytes; documents are 1 to 60,000 bytes. A document
contains one CBOR item with minimal headers/valid UTF-8, maximum
depth 100, verified separately from the container. The profile neither
normalizes nor promises ordering/deduplication of maps inside the document.
Envelope/control maps are deterministic and have an exact shape;
no external bytes pass through the Lisp reader. A write group must fit the
same complete-frame limit; each member retains the single-write limits.
All members are validated before any copy or engine admission. The configured
`max-write-group` limit applies to explicit write groups too (status 5 when exceeded).
An explicit group drains earlier collected writes and acts as a barrier.
Cumulative capacity refusal returns status 2 without splitting or retry.
Each operation retains its own CSN/SEAL; one shared strong flush precedes FIFO
publication and the response. A crash can recover a sealed prefix, and losing
the response can leave all writes committed. This is not a transaction.

Status 1: invalid arguments; 2: exhausted capacity; 3: unavailable engine;
4: unsupported opcode; 5: limit exceeded. Command-validation and write rejections
precede engine admission, with a `null` payload. Envelope/handshake/
ID/transfer errors close the connection. A fault after admission
that prevents a certain answer closes the connection; the client reports an unknown outcome.
PUT/DELETE/WRITE-GROUP respond only after strong engine completion.

The maximum response buffer is owned before dispatch. GET requires
a negotiated frame of at least 60,032 bytes, enough for any profile
result; otherwise status 5 before reading. The value is
copied and GET is finished before waiting for the peer: no EBR pin or writer
lease is retained during send. This is a conservative, declared limit.

Read groups validate every key before copies/GET, drain earlier writes and
complete serially without interleaved data operations or peer waits. Results
preserve order, duplicates and absence. Each GET uses the existing full value
scratch and releases its pin before response send. Cache and automatic RAM/paged
primary selection are shared with individual GET. There is no new server payload
arena, data CSN or flush, and the write-group policy does not limit reads.
The group provides one current serial view, without historical MVCC semantics.

The actual complete read-group response must fit the negotiated frame; otherwise
the whole group returns status 5/null, the engine stays usable and no partial
result is delivered. This read-only budget refusal may follow completed GETs;
write rejections still precede admission. A small negotiated frame can therefore
serve a group whose actual result fits, including a one-key group. The client
validates all members/documents before copies and checks correlation/deadline
before exposing its private vector. Read errors close without mutation outcome
uncertainty or implicit retries.

<a id="risorse-e-ciclo-di-vita"></a>

## Resources and lifecycle

Input/output buffers and scratch have finite per-connection capacities,
allocated before the listener opens. The prefix causes no allocation proportional
to unverified lengths. Receive/send retain explicit offsets;
exact boundary reads leave subsequent coalesced frames in the kernel.
There is no per-connection thread, unbounded spin, or engine wait for a peer.
The decoder uses connection scratch; each frame produces a fixed-size envelope
structure and argument copies within declared limits.
Transient allocations are serial within the actor rather than queued.
The client verifies the document with fixed call-local scratch.
The profile claims neither nonallocation nor an RSS ceiling.

The runtime directory is exclusively locked until service close:
the profile permits one listener per directory, even with different names.
All ancestors are kept open and their identities rechecked; root and
the service UID are trusted and must not mutate the namespace during use,
because Unix bind/chmod operate by pathname.

Injectable monotonic clock; HELLO within 5 s of accept, frame within 30 s
of first byte, response within 30 s of enqueue, idle within 300 s.
Readiness-driven waits use a preallocated, actor-owned poll set (at most nine
descriptors), capped by the closest deadline and 100 ms; the client waits on
its actual input/output interest. No fixed 1 ms delay is imposed per request.
[Wait/error/qualification contract](prestazioni-local-m1.md).
Partial progress does not renew the deadline. A slow client loses
its own connection; others continue through the actor loop.

Explicit absolute path, maximum 100 UTF-8 bytes, no NUL. The existing runtime
directory has mode 0700 and is owned by the service UID, with protected ancestors without symlinks or
group/other writes; the socket has mode 0600. Root and the service UID are trusted.
Namespace checks/owned descriptors accompany bind.
Data/runtime directories are distinct. An occupied node,
even an orphan after SIGKILL, is retained; startup explicitly fails.
The operator removes the orphan while the service is stopped or chooses a new path.
Restart tests use a new path to preserve the crash node.

Shutdown: stop admission, close connections/listener, remove
only the node still owned by identity, release namespace/engine.
Cleanup attempts all resources and preserves primary/secondary causes.
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
   value present, next CSN 2. The FI driver is a separate C4 tool;
   no failure option in product CLIs.

Two author static readings/independent review, then source/test
commit; all agent assignments end before execution. Every diagnostic command
uses the recorder. Failures/variants and lossless originals are preserved
through the common repository collection. Qualification/report must state
exact platform, source, executed cases, residual limits.
No benchmark/performance result is inferred from the campaign.
Milestone #1 remains open until all criteria are demonstrated.

<a id="ingressi-eseguibili"></a>

## Executable entries

The server receives the data directory, socket path, hexadecimal Archivio/Serie UUIDs
(32 digits each), optional `--create`/`--version 1|2`. `--create` means
explicit initialization only: do not pass it on restart. Runtime
directory must be prepared with the stated permissions. The stdout `:state :ready`
record follows listener opening; diagnostics go to stderr.
SIGTERM/SIGINT initiate orderly CLI-process shutdown.

```text
sbcl --noinform --no-userinit --no-sysinit --script tools/local-server.lisp \
  DATA SOCKET ARCHIVE32 SERIES32 --create
sbcl --noinform --no-userinit --no-sysinit --script tools/local-client.lisp SOCKET put 01 182A
sbcl --noinform --no-userinit --no-sysinit --script tools/local-client.lisp SOCKET get 01
```

The client represents the key/CBOR document in hex, returns a structured
record, and does not use the Lisp reader for arguments. Example `182A`
is a CBOR document containing the unsigned integer 42. Error/unknown outcome produces nonzero
exit; the caller decides how to resolve a possible retry.

## Optional startup image discovery

The library's `:index-discovery` option and the CLI flag `--discover-index`
connect the bounded engine discovery path to service startup. Recovery and full
image verification finish before listen/READY. See the
[configuration, validation and limits](scoperta-indice-local-m1.md).

<a id="budget-indice-automatico"></a>
## Automatic index quota

The library accepts `:index-policy`, passed to `apri-motore`: `:automatic`
(default), an immutable `crea-politica-indice-automatico` policy, or the
explicit `:legacy` compatibility profile. With `:index-discovery`, the default
is `:legacy`; an explicit automatic policy conflicts with discovery. Invalid
policy types and conflicts are rejected before clock callbacks or resources.

The server CLI accepts `--index-budget BYTES` once, in any order with `--create`
and `--version 1|2`. BYTES is a bounded, unsigned decimal integer. The engine
factory validates the quota; startup may still reject a grant too small for
its fixed replay workspace and initial index. No listener or READY notification
precedes successful engine startup. `--discover-index` and `--index-budget`
are mutually exclusive.

```sh
sbcl --script tools/local-server.lisp DATA SOCKET ARCHIVE32 SERIES32 --create --index-budget 3400000
```

The quota controls index payload and reserved index/replay workspaces under
[ADR-0073](../adr/0073-indice-automatico-operativo-m1.md), not total process RSS,
free physical RAM, or a peer-requested backend. Page geometry and frame defaults
remain those of the engine factory. Omitting the option keeps the engine's
normal automatic policy. The wire protocol and strong acknowledgment semantics
are unchanged. See [verification](../../spikes/results/2026-10-31-local-index-budget/report.md).

## Optional verified record cache

Use `--record-cache-budget 1048576` (or library `:record-cache-budget 1048576`)
to grant a separate fixed record cache, alongside the normal primary index.
Zero is the default; a positive grant must fit all configured size classes.
The normal 64 KiB maximum frame needs at least 1,042,127 payload bytes.
Malformed, repeated or oversized CLI grants are rejected; a too-small positive
grant rejects engine startup and no READY/listener is published. The wire and
strong PUT/DELETE acknowledgment remain unchanged. See the
[cache contract and metrics](cache-record.md#serial-m1-integration).

## Automatic same-turn strong write grouping

[ADR-0080](../adr/0080-group-commit-m1.md) lets the serial actor combine complete
validated PUT/DELETE commands already ready in the current pass. Each retains
its own ID, CSN and SEAL; every response follows the shared strong flush and
complete publication. The wire shape and one-in-flight limit remain unchanged.
No timer waits to fill a group, and an isolated write follows the existing path.

Slot order is preserved: GET/PING/rejections drain preceding writes as a barrier.
Fresh absolute-deadline checks remove expired commands before admission. Only
an unadmitted capacity refusal may split into individually admitted requests;
uncertain admitted writes are never repeated. Peer sends happen after engine
completion and collector cleanup, without a retained pin or lease.

The library option `:max-write-group` has domain 1..8 and default 8. Limit 1
provides individual admissions for comparison or an owner-selected admission
policy; it does not weaken durability or change wire operations. The production
CLI uses the default. Buffers remain bounded before listen; this option is not
a limit on whole-process RSS. [Evidence](../../spikes/results/2026-10-31-engine-group-commit/report.md).
