<a id="adr-0056--contratto-della-sessione-locale-m16"></a>

# ADR-0056 — M16 local-session contract

- **Status:** M1 profile authorized by the author for production integration;
  full M16 extension still proposed; profile qualified locally
  in the [M1 report](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-23-production-unix-m1/report.md)
- **Date:** 2026-10-17
- **Relationship to the specification:** completes ADR-0029's framing and budgets required
  by ADR-0055; does not change persistent formats or engine semantics
- **References:** [proposed contract](../implementazione/sessione-locale.md),
  [ADR-0055](0055-interfaccia-locale-unix-socket.md), REQ-IPC-001…REQ-IPC-004,
  [SPK-11](../../spikes/SPK-11-unix-socket/README.md)

<a id="contesto"></a>

## Context

Unix-socket priority is accepted. Before implementing M16,
byte order, envelope, correlation, errors, and budgets must be fixed. A test
listener cannot certify engine recovery, admission, commit, or isolation.

<a id="decisione-proposta"></a>

## Proposed decision

The 2026-10-22 direction to proceed with startup → recovery → admission → PUT/GET
authorizes the [M1 profile](../implementazione/production-unix-m1.md),
which fixes the four commands' payloads, smaller limits,
one owner, and one in-flight request before the code. The profile reuses this ADR's frames, correlation,
errors, and durable boundaries. It does not adopt the extended contract's concurrency
defaults; their proposal and related gates remain open.

The [session contract](../implementazione/sessione-locale.md) proposes
a big-endian u32 prefix and a single deterministic CBOR item, versioned
handshake, strictly increasing IDs within a connection, and out-of-order responses.
Capacities are assigned to I/O owners at startup; transport admission and counters
are owner-local, with no new global lock per request.

Transport is fixed before the dispatcher: the first version defines HELLO
and PING; every data operation requires a verified payload contract and engine
path before appearing among advertised capabilities. No application
operation, including PING, is admitted before the engine recovery gate.

The only new serialization is the connection stream. Owner assignment
happens at opening, not per document or Serie. The transport
has no durable atomicity point: those of the respective commands remain.
No implicit retry or deduplication across reconnections.

<a id="conseguenze"></a>

## Consequences

Driver and server share independent binary fixtures. A maximum-size document
and maximum-size key fit in the same frame; the envelope budget remains
separate from document depth and size. Absolute deadlines
prevent small progress from renewing a wait indefinitely.
The values are proposed policies, not performance results.

<a id="alternative-considerate"></a>

## Alternatives considered

- A text protocol: introduces a second vocabulary and an additional parser.
- IDs reusable as soon as the response is sent: require more state and make
  delayed responses ambiguous; u64 exhaustion requires a new connection.
- A global budget contended on every request: adds avoidable serialization.
- Exposing PUT/GET immediately as echo: does not verify database guarantees.

The correlation and versioning pattern is published in the
[JSON-RPC 2.0 specification](https://www.jsonrpc.org/specification), without adopting its format;
the binary vocabulary remains that of [RFC 8949](https://www.rfc-editor.org/rfc/rfc8949.html).
Local implementability uses the
[SBCL sb-bsd-sockets](https://www.sbcl.org/manual/index.html#Local-Domain-Sockets) contrib.
These references justify the mechanisms, not the proposed defaults.

<a id="valutazione"></a>

## Assessment

SPK-11 verifies transport and its oracles in real processes. Handshake/dispatcher,
access by distinct users, product pools and memory,
recovery gate, response loss after commit, and crashes remain to be tested.
The authorized profile's contract precedes its code; the M16 extension
still requires a specific decision. The test does not close
RSK-14/RSK-16 or promote IPC requirements.
