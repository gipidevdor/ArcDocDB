<a id="adr-0049--percorso-di-capacità-oltre-la-ram"></a>

# ADR-0049 — Capacity path beyond RAM

- **Status:** Proposed; research direction authorized, format and algorithm to be evaluated.
- **Date:** 2026-10-08
- **Relationship to the specification:** proposes an extension to the resident index; does not yet supersede ADR-0043 or v1 scope.

<a id="obiettivo"></a>

## Objective

A Serie's capacity must be able to exceed the memory available for the primary index. The resident mode's estimate of documents per RAM is not a universal product limit.

<a id="proposta"></a>

## Proposal

An optional per-Serie mode with a derived persistent primary index and bounded cache. Evaluate sorted copy-on-write pages and a persistent hash directory; neither has been selected yet. Complete keys and locations must be able to reside on disk; moving only keys is insufficient. The writer remains local, reader views consistent, recovery rebuildable from segments and manifest. No shared writes between Serie; no resource without a budget.

<a id="evidenze-necessarie-prima-delladozione"></a>

## Evidence required before adoption

An experiment with an index larger than the cache, comparisons of hot/cold lookup, P95/P99, bounded memory, split cost, write amplification, rebuild, crashes, and snapshots during maintenance. Measure with short and long keys. Declare the atomicity point in a later ADR and update traceability before implementing the engine.

Resident mode retains the optimized path; persistent mode adds possible NVMe reads and does not inherit its latency targets. Replication and sharding remain separate extensions. No capacity beyond RAM has been demonstrated today.
