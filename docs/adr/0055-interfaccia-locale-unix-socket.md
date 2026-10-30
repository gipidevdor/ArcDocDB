<a id="adr-0055--socket-unix-locale-come-interfaccia-prioritaria"></a>

# ADR-0055 — Local Unix socket as the priority interface

- **Status:** Accepted at the author's direction; implementation and qualification to be produced
- **Date:** 2026-10-16
- **Relationship to the specification:** supersedes TCP as the primary transport
  chosen in [ADR-0029](0029-interfacce-protocollo-query-contratto.md); queries, Serie
  contract, and CBOR framing remain valid. Moves M16 local integration earlier in the roadmap.
- **References:** [architecture](../architettura.md#interfacce),
  [NNTP case](../valutazione/caso-duso-nntp.md#integrazione-con-il-futuro-demone),
  [roadmap](../roadmap.md), REQ-IPC-001…REQ-IPC-004, INV-N1

<a id="contesto"></a>

## Context

The first intended use is the database for an NNTP server in Common Lisp.
The author requires the interface between application and database to use a
local Unix socket and have development priority. The previous open alternative
between embedding and TCP no longer represents the reference path.
The M16 layer is not yet implemented.

<a id="decisione"></a>

## Decision

<a id="trasporto-e-confine-applicativo"></a>

### Transport and application boundary

1. The default client interface is a **local Unix stream socket**
   (`AF_UNIX`/`AF_LOCAL`), with a filesystem address. The NNTP daemon and
   ArcDocDB process communicate through this socket on the same machine.
2. The absolute socket path is configurable per instance, in a dedicated
   runtime directory. Configuration must declare it; a missing,
   invalid, or overly long path produces an explicit error before opening.
3. TCP is a later optional transport, disabled in the default
   configuration and enabled only explicitly. A local-socket error
   does not cause automatic fallback to TCP, even on loopback.
4. The engine remains a library with a "request plus continuation" API.
   Embedding remains technically possible, but the reference NNTP integration
   and its tests use the Unix socket. M16 owns connections and framing;
   NNTP protocol, TLS, and NNTP client identities belong to the application.

<a id="protocollo-e-controllo-dellammissione"></a>

### Protocol and admission control

The socket carries the same protocol as ADR-0029: `u32 len` plus CBOR body,
version and extensible handshake, request identifiers, and multiplexed
responses that may complete out of order. No second
codec or special semantics for local requests are introduced.

The stream may split or coalesce frames: receiving and sending retain explicit
state for partial transfers. Length and budgets are checked before
allocating or queuing the body; document, envelope, and batch have the separate limits
in ADR-0029/ADR-0048. Connections, in-flight requests, input and output
buffers, and waiting duration have finite capacities and deadlines. Numeric values
and complete wire encoding are fixed in the M16 contract before its code.

A slow or saturated connection stops its own admission or is closed according to
the contract, without retaining EBR epochs or blocking writers or compute workers.
Socket operations go through injectable I/O; tasks comply with
[ADR-0045](0045-modello-di-esecuzione.md). Results and buffers remain owned
until the response completes or is released.

<a id="accesso-locale-e-ciclo-di-vita"></a>

### Local access and lifecycle

The runtime directory is owned by the service account and writable only
by that account; access and traversal are granted only to accounts or the group
configured for the client. Directory, owner, and permissions are verified before
exposing the listener. Socket-node permissions are restricted where supported;
directory protection remains necessary. This local control does not
add application authentication or encryption to ADR-0030's scope.

An occupied name produces an error: startup does not automatically delete
existing files, links, or sockets, even after a crash. Removing an orphan
requires explicit intervention while the service is stopped. Shutdown closes
the listener and connections; it removes the node only if it is still the one created
by the instance in the protected directory. The node is a runtime resource, separate
from the Archivio's persistent files.

<a id="guasti-parallelismo-e-atomicità"></a>

### Faults, parallelism, and atomicity

A disconnection does not cancel an already-decided commit or authorize the transport
to repeat a write. If the response is lost, the outcome may be unknown to the
client: request identifier and reconnection do not guarantee
deduplication. The NNTP daemon must resolve retries under the application
contract, including the Message-ID key.

Sending a response follows the engine's existing publication and durability
rules. Atomicity points remain SEAL, DECISION, and the others already defined;
the transport introduces no commits or persistent logs of its own. Admission of
application traffic waits for recovery to finish.

Only the byte stream of an individual connection is ordered. Requests
are distributed through existing Serie paths; no global lock or counter
per request and no thread per connection or request. The priority
established here concerns integration path and development order;
the scheduler's existing priorities and isolation remain.

<a id="priorità-di-realizzazione"></a>

### Implementation priority

After engine startup, recovery, and admission, implement M16's first local
client/server integration with the available fundamental operations. It does not
wait for completion of phase 8 or phase 9's TCP transport.
Queries, multiseries transactions, and indexes are exposed when their respective
product contracts are available and verified; the socket does not bring them forward.

<a id="conseguenze"></a>

## Consequences

The first application path exercises two processes and an explicit local
interface. TCP later uses the same dispatcher and codec; NNTP tests and
initial measurements include framing, copies, admission, and response over the Unix socket.
Runtime-directory configuration and explicit orphan management are needed.
This decision defines design and priority; it does not make a listener available.

<a id="alternative-considerate"></a>

## Alternatives considered

- Loopback TCP as the first interface: does not meet the requested local direction.
- Embedding as the main NNTP path: does not exercise the required process boundary.
- Datagrams or abstract namespace: the chosen path uses a stream and a filesystem
  node, with a protected directory and observable lifecycle.

The local connection pattern through Unix sockets is used by
[PostgreSQL/libpq](https://www.postgresql.org/docs/18/libpq-connect.html).
A directory writable only by the trusted account follows the protection described
in the [PostgreSQL documentation](https://www.postgresql.org/docs/17/preventing-server-spoofing.html).
The [SBCL `sb-bsd-sockets`](https://www.sbcl.org/manual/index.html#Local-Domain-Sockets)
contrib provides `local-socket`, without dependencies outside the allowed runtime.

<a id="valutazione"></a>

## Assessment

The [verification plan](../affidabilita/piano-di-verifica.md#interfaccia-locale-unix-socket)
ties the four requirements to tests to be implemented: selection of only local
transport, two real processes, permissions and collisions, partial and malformed frames,
saturation, slow clients, response loss, and restart. The first integration
must pass them before measurements of the complete path.
Unix-socket performance and advantages over TCP have not yet been measured.
