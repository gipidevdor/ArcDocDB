<a id="adr-0011--thread-pool-dinamico-con-ewmaaimdisteresi"></a>

# ADR-0011 — Dynamic thread pool with EWMA/AIMD/hysteresis

- **Status:** Accepted
- **Date:** 2026-10-01
- **Relationship to the specification:** records a specification decision ("Dynamic thread
  pool," "Dynamic compaction scheduler")
- **References:** [10 Concurrency and scheduling](../10-concorrenza-e-scheduling.md), INV-P2,
  INV-P4

<a id="contesto"></a>

## Context

Load varies in intensity and in its distribution across Serie. A fixed thread count is
wrong in both directions; creating threads on demand is costly and unpredictable.

<a id="decisione"></a>

## Decision

- A dynamic pool of reused workers; no thread per request or per Serie.
- The scheduler adapts worker count based on queue depth, CPU, throughput,
  P50/P95/P99, number of active Serie and load distribution, I/O, WAL throughput,
  and compaction backlog.
- Strategy: EWMA for signals, AIMD for changes, hysteresis against oscillation.
- Guiding rules: growing queue and available CPU → more workers; growing queue and saturated CPU
  → do not increase blindly; worsening P99 → stop expanding or reduce; empty queue
  and low CPU → reduce.
- The same scheduler coordinates queries, writers, WAL, and compaction.
- The Compaction Scheduler has limits independent of the request scheduler.

<a id="conseguenze"></a>

## Consequences

- The system adapts without manual thread-count configuration.
- Metrics become part of operation, as well as diagnostics: they must be
  inexpensive and always available.
- A controller is a component to design, tune, and verify on its own.

<a id="alternative-considerate"></a>

## Alternatives considered

- *Fixed pool equal to the core count:* simple and predictable, but unsuitable when many workers
  are blocked on I/O.
- *Separate fixed pools by work type:* clear isolation, no adaptation.

<a id="valutazione"></a>

## Assessment

- Risks: RSK-12.
- Verification: SPK-04 (mechanism), SPK-06 (controller on load traces).
- Open: definition of load states (QA-12); workers blocked on I/O (QA-19).
- Guidance: start with a few signals and simple rules; add signals only when
  measurement shows they are needed.
