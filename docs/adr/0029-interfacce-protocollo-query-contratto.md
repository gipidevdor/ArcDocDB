<a id="adr-0029--interfacce-protocollo-a-frame-cbor-query-come-dati-contratto-della-serie"></a>

# ADR-0029 — Interfaces: CBOR frame protocol, queries as data, Serie contract

- **Status:** Accepted; primary TCP choice superseded by [ADR-0055](0055-interfaccia-locale-unix-socket.md). Queries, contract, and framing remain valid; initial local integration moved earlier in the roadmap.
- **Date:** 2026-10-03
- **Relationship to the specification:** closes QA-20 and QA-21
- **References:** [architecture](../architettura.md#interfacce), [ADR-0014](0014-formato-record-documento-id.md)

<a id="decisione"></a>

## Decision

<a id="protocollo-di-rete"></a>

### Network protocol

- TCP, **length-prefixed binary frames** (`u32 len` + CBOR body), requests with
  an identifier for multiplexing on the same connection, responses in any order.
- The same CBOR vocabulary serves documents, requests, and responses: one codec.
- No compatibility with other databases' protocols.
- Authentication and encryption: outside v1 scope ([ADR-0030](0030-scope-v1.md)); the protocol
  provides a version field and an extensible handshake.

<a id="query"></a>

### Queries

- Queries are **data** (a CBOR structure, an s-expression in Lisp): field predicates
  (`=`, `<`, `prefix`, `in`, `and/or/not`), ordering, limit, projection, explicit
  or automatic index use. No textual language in v1: a text parser can be
  added on top without changing the engine.
- The Query Engine compiles the query into an iterator pipeline over segment indexes
  ([ADR-0026](0026-indici-secondari-segmentati.md)) with a visibility filter and document
  fetches.

<a id="contratto-della-serie"></a>

### Serie contract

- The contract is a CBOR document in the catalog: declared fields with type, requiredness,
  and simple constraints; indexes with type and field; a policy for undeclared fields
  (allowed or rejected).
- Validation at write time, in the worker receiving the request (outside the
  writer).
- **Additive evolution**: adding optional fields and indexes is always allowed; removing
  fields or changing their types requires a new contract version, and existing documents
  remain valid against the version under which they were written (the record carries
  the contract version in the document's CBOR header).

Pattern: length-prefixed frame protocols with multiplexing (Redis RESP3, PostgreSQL wire);
queries as AST data (MongoDB, Datalog); additive schema evolution (Protocol Buffers).

<a id="conseguenze"></a>

## Consequences

- One codec and one data format end to end.
- The engine is syntax-independent: textual languages and drivers are layers above it.

<a id="contratto-documentale-v2"></a>

## Document contract v2

[ADR-0048](0048-limiti-documentali-e-formato-v2.md) defines CBOR documents up to 16 MiB and 100 levels. The frame budget is separate from the document: it must allow a maximum-size document plus the request key and envelope, with an explicit limit and a length check before allocation. Batches have separate budgets and are not allowed without a limit.

<a id="estensione-full-text-2026-10-15"></a>

## Full-text extension (2026-10-15)

[ADR-0053](0053-ricerca-full-text-indici-invertiti.md) adds the logical
predicates `text-match(campo, testo, all/any)` and
`text-phrase(campo, testo)` to the AST, combinable with structured filters in the
same MVCC view. Text is a value to analyze according to the index's versioned
profile, without introducing a textual query language.
Node names and wire encoding are fixed in phases 8–9.

The contract declares scalar fields and an immutable profile; changing the
analyzer creates a new generation. Queries retain the generation and
profile for their entire duration; an unready index and an exhausted budget
produce explicit errors. The approved semantics do not imply that APIs,
parsers, or full-text indexes are already implemented.
