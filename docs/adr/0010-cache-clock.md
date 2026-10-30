<a id="adr-0010--cache-clock-partizionabile-per-serie"></a>

# ADR-0010 — CLOCK cache, partitionable by Serie

- **Status:** Accepted
- **Date:** 2026-10-01
- **Relationship to the specification:** records a specification decision (“Cache,” “Cache and
  snapshots”)
- **References:** [09 Cache](../09-cache.md), INV-M3

<a id="contesto"></a>

## Context

The cache is on every read path; its concurrency cost must be low, and scans or bursts
on a single Serie must not empty it.

<a id="decisione"></a>

## Decision

- The initial cache uses CLOCK.
- 2Q is evaluated only if benchmarks show significant scan pollution.
- The cache can be partitioned by Serie.
- The cache is version/epoch aware: it does not return a reader a version incompatible
  with that reader's snapshot.
- Read path: request → Serie → snapshot/index → cache → segment.

<a id="conseguenze"></a>

## Consequences

- CLOCK updates one bit on a read: low cost and low contention.
- Partitioning protects Serie from one another, but requires a budget allocation policy.
- Choosing a more sophisticated policy is deferred until measurements are available,
  which requires a defined scan-pollution metric.

<a id="alternative-considerate"></a>

## Alternatives considered

- *LRU:* list update on every read, contended among threads.
- *2Q or similar from the start:* more resistant to scans, but the complexity is not yet
  justified by measurements.

<a id="valutazione"></a>

## Assessment

- Risks: RSK-10.
- Verification: SPK-05; benchmarks with scans concurrent with point reads.
- Open: granularity, key, and budget (QA-17); memory outside the managed heap (QA-18).
- Related proposal: location-based key, making INV-M3 true by construction
  ([09](../09-cache.md#cache-e-snapshot)).
