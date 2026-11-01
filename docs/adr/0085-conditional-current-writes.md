# ADR-0085 — Current versions and serial conditional strong writes

- **Status:** Accepted for incremental integration under the author's instruction.
- **Date:** 2026-11-01
- **References:** [ADR-0005](0005-writer-logico-per-serie.md),
  [ADR-0073](0073-indice-automatico-operativo-m1.md),
  [ADR-0084](0084-explicit-unix-read-groups.md),
  REQ-TXS-002/003, REQ-IDX-001/010/013, REQ-MVC-006, REQ-WAL-006, REQ-AFF-004/008.

## Decision

Expose the existing positive u64 document commit CSN as a current version.
`leggi-documento-con-versione` returns `:found`, copied byte count and CSN, or
`:absent`, zero and zero. Capture the candidate CSN within the GET task and
authorize it only after the existing record verifier, copying and completion.
The old `leggi-documento` retains exactly two return values.

Add `scrivi-documento-se-versione(engine,key,value,expected)` and
`cancella-documento-se-versione(engine,key,expected)`. Both return
`:applied,new-strong-CSN` or `:conflict,current-live-CSN`. A zero expected token
tests current absence, including a deleted key. Zero is a predicate, never a
stored version. Deleting and reinserting a key cannot reuse its positive CSN;
a stale positive token still conflicts. Matching absence in DELETE produces an
ordinary tombstone, consistent with unconditional DELETE.

Check owner, READY state, input and token domain first. Probe the authoritative
primary/delta/paged index under BUSY. A conflict precedes capacity checks,
maintenance, CSN allocation, append and flush. Cache lookup counters may change;
canonical files and logical versions do not. An admitted probe error or
incomplete exit faults admission, preserving the primary cause.

On a match, enter the existing strong writer synchronously, with no intervening
callback, yield or peer wait. The single serial owner admits no concurrent
mutation, asynchronous cancellation or API reentry. Writer preflight maintenance
preserves logical versions and guards observation callbacks under BUSY. Comparison
and application are therefore atomic with respect to the permitted data operations.
Do not introduce another CSN allocator, durable version field, commit path or
format. Known writer preflight refusal remains possible after a matching token.

## Unix capability

`connect-local :versions t` requests opcode 6. HELLO key 2 now contains a strictly
ordered nonempty subset of `[4,5,6]`; WELCOME has `[0,1,2,3]` followed by exactly
that subset. All previous flag combinations retain their bytes and public
handshake decoders retain their two values. Extend ADR-0084's optional capability
set; its existing read-group semantics remain in force.

| Opcode 6 payload | Status-0 response | Client operation |
|---|---|---|
| `[0,key:bstr]` | `[true,CSN,document:bstr]` or `[false,0,null]` | `client-get-version` → status/document/CSN |
| `[1,key:bstr,expected:u64,document:bstr]` | `[true,new-CSN]` or `[false,current-live-CSN]` | `client-put-if` → status/CSN |
| `[3,key:bstr,expected:u64]` | same conditional result | `client-delete-if` → status/CSN |

Validate the whole request before copies or engine work. Opcode 6 is a barrier
that drains earlier collected writes and never enters the opportunistic write
collector. Check the original absolute deadline after draining and validation,
and after engine work, before queuing a response. Unnegotiated requests return
4, malformed arguments 1 and budget refusals 5. Conflict is a successful result,
not busy. Only resource refusal from the engine with READY admission becomes
status 2; encoder/deadline failures after a commit cannot become that rejection.

Use the existing 60,000-byte value scratch and output arena. Versioned GET requires
a conservative negotiated body grant of at least 60,040 bytes; no too-small
target reaches GET. Complete correlation, token/boolean/null/document/end and
fresh deadline validation precede exposure. Read failure closes without
`outcome-unknown`; incomplete conditional mutation is `outcome-unknown`, with
no retry, downgrade or split. No new per-connection payload arena is required.

## Scope and evaluation

This implements single-operation optimistic compare and apply in current-only M1.
It does not complete transaction write sets, historical MVCC or multiseries 2PC.
An absence token cannot detect an intervening insert/delete cycle. After a lost
ACK, a conflict or equal document cannot prove which client committed a value;
applications must reconcile their own intent. There is no exactly-once claim.

Evaluate both record formats and legacy/resident/paged indexes, independent
conditional state histories, unchanged WAL/frontiers/flushes on conflict,
rotation/recovery, full u64 tokens, callback exclusion and fail-stop cleanup.
Use independent wire fixtures and real distinct-process clients for stale-token
conflicts, SIGKILL recovery and a dropped response after strong commit. Compare
conditional and unconditional costs without changing durability or timed flushes.
Retain [method and evidence](../../spikes/results/2026-11-01-conditional-writes/report.md).

## Relationship to the specification

Reuse the specified optimistic version model and existing commit CSNs. No change
to persistent formats or transaction isolation guarantees; the M1 restriction
remains one serial actor and current reads.
