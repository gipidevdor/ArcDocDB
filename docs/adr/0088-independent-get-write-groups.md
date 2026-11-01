# ADR-0088 — Independent GETs across same-turn write groups

- **Status:** Accepted for incremental integration under the author's instruction.
- **Date:** 2026-11-01
- **References:** ADR-0080/0086, REQ-IPC-002, REQ-IDX-001, REQ-WAL-002/006,
  REQ-LIM-003, REQ-AFF-004/008.

## Decision

An ordinary, fully decoded GET with sufficient negotiated response credit may
use canonical GET before a preceding same-turn write queue when its exact binary
key differs from every queued operation. The queue must be nonempty and the
engine READY. At most eight exact comparisons are needed. No new allocation,
speculative value/version overlay, timer, wait, reader thread or API is added.

The serial M1 owner excludes intervening mutation. Independent preceding writes
cannot change this key, and maintenance preserves logical current values. Thus
the copied read result equals its original logical slot's result. Later writes
to that read key remain after the read. Canonical CRC, exact-key, epoch, cache,
RAM/paged and resource checks still execute through the normal engine API.
The private encoded response owns its bytes before any later write or rotation.

Same-key GET (including preceding DELETE or conditional mutation), PING,
versioned/explicit groups, malformed, unsupported, unavailable and insufficient
frame requests still drain the queue. Administrative group limits, stable expiry
compaction, FIFO write admission/CSNs and fresh absolute-deadline checks remain.
The response deadline starts when encoded output is queued and is never renewed
while waiting for the final strong flush.

Dispatch performs no socket send. Before it returns, the collector is strongly
completed and cleared. A failed flush or nonlocal exit aborts the service turn;
the existing outer cleanup closes all peers. An already encoded independent
read cannot escape that failed turn. No write success precedes strong completion.

## Failure ordering and scope

Physical read verification may now precede admission of independent queued
writes. A read fault can therefore stop those unacknowledged writes before CSN
assignment, where the former barrier would have admitted them first. Conversely,
a later strong failure may discard an already encoded read. Trusted injectable
I/O/observer callbacks may observe this changed physical order. They retain
their no-reentry and no-logical-mutation contracts.

There is no guaranteed durable prefix for requests without responses, including
after response loss. Recovery still accepts independently sealed durable writes;
the client retains the existing unknown-outcome rules and must not retry blindly.
This changes the physical barrier policy of ADR-0080/0086 only for qualified
ordinary independent GETs. It introduces no transaction, isolation, persistent
format, wire-format or strong-durability change.

## Evaluation and relationship to the specification

Verify exact dependencies, old values before later same-key writes, rejection
gates, administrative limits, expiry before/after copying, capacity fallback,
read/flush faults, nonlocal exits, no-send-before-strong and process recovery.
Use unchanged-driver before/after Unix campaigns with raw CSNs, checked documents,
group widths and timed strong calls, separately calibrating instrumentation.
See [method](../../spikes/results/2026-11-01-disjoint-read-groups/method.md).
This refines serial M1 scheduling within existing specified strong group commit;
concurrent readers, natural-arrival qualification and power-loss remain separate.
