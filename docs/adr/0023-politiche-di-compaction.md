<a id="adr-0023--politiche-di-compaction-soglie-stati-di-carico-tombstone"></a>

# ADR-0023 — Compaction policies: thresholds, load states, tombstones

- **Status:** Accepted (default values tunable through benchmarks); **“Tombstones” section superseded by [ADR-0042](0042-tombstone-e-indice-dei-vivi.md)** (the lineage rule is unsafe). Thresholds, load states, and the limiter remain.
- **Date:** 2026-10-03
- **Relationship to the specification:** closes QA-11, QA-12, and QA-15; implements [ADR-0007](0007-clean-e-merge-distinti.md) and [ADR-0008](0008-merge-opportunistico.md)
- **References:** [architecture](../architettura.md#compaction), INV-C5, INV-C6, INV-P4

<a id="decisione"></a>

## Decision

<a id="selezione-dei-candidati-per-serie-parametri-configurabili"></a>

### Candidate selection (per Serie, configurable parameters)

| Rule | Default |
|---|---|
| CLEAN if `dead-bytes / total-bytes ≥ clean-ratio` | 0.5 |
| …or if `dead-bytes ≥ clean-min-dead` | 64 MB |
| CLEAN priority | descending `dead-bytes` |
| A segment is “small” if `total-bytes < small-ratio × target` | 0.25 (64 MB with a 256 MB target) |
| MERGE if there are `≥ merge-min-group` eligible small segments | 8 |
| Maximum MERGE output size | Serie target (256 MB) |
| Minimum stability for MERGE | 50 s (INV-C5, cannot be reduced) |

The writer updates `dead-bytes` counters on every overwrite/tombstone (they are
 derived; recalculated from hints on restart).

<a id="stato-di-carico"></a>

### Load state

The scheduler maintains an Archivio **load state** in `{basso, normale, alto}`,
computed from two EWMA-smoothed signals (window ~1 s):

- request `P99` relative to the objective ([ADR-0028](0028-target-e-obiettivi-di-latenza.md));
- device utilization (bandwidth used by flushes and reads relative to measured bandwidth).

Thresholds with hysteresis: `alto` if either exceeds 80 % of the objective; `basso` if both
are below 40 % for at least 10 s; `normale` otherwise. The additional signals listed by the
specification (queues, workers, backlog) are exposed as metrics and used by the worker
controller; they enter the load state only if a measurement shows that the two signals
are insufficient.

| State | CLEAN | MERGE |
|---|---|---|
| low | up to `clean-workers-max` | allowed, up to `merge-workers-max` |
| normal | up to `clean-workers-normal` | no new MERGE; ongoing ones continue with reduced bandwidth |
| high | urgent CLEAN only (`dead-ratio ≥ 0,8`), 1 worker | no new MERGE; ongoing ones are suspended, and abandoned if the state remains `alto` for 30 s |

Each compaction worker has a **bandwidth limiter** (token bucket in bytes/s), set
by the scheduler according to the state. An abandoned MERGE leaves no effects (sources
intact, `.tmp` output deleted).

**MERGE starvation:** accepted by the specification. Metric `segments-small-pending` and
an alert above a configurable threshold. No emergency threshold.

<a id="tombstone"></a>

### Tombstones

Each segment has `lineage-min` = the smallest segment-id among its ancestors (itself
for writer-created segments). A tombstone for key `k` in a segment with lineage `L`
may be discarded by CLEAN/MERGE when **no present segment has `lineage-min < L`**
and no active snapshot requires it. In that case, no older version of `k` can
reappear when the index is rebuilt.

Pattern: dead-space threshold compaction (Bitcask `dead_bytes_threshold`); bandwidth
limiter (RocksDB `RateLimiter`); lineage-based tombstone rule (Bitcask merge).

<a id="conseguenze"></a>

## Consequences

- CLEAN starts from measured dead space, not the number of segments.
- MERGE depends on an explicit, observable state; every transition is a metric.
- Values are defaults: SPK-06 and benchmarks tune them without changing the mechanism.

<a id="valutazione"></a>

## Evaluation

- Verification: SPK-06; interference benchmarks; load state machine tests using
  traces.
