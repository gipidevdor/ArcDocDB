# 09 — Cache

> **Source:** ‘Cache’ and ‘Cache and snapshots’ of the [specification](specifica/specifica-originale.md).
> **Modules:** M07 Cache Manager.
> **Decisions:** [ADR-0025](adr/0025-cache-per-location.md) (location key, CLOCK per
> partition), [ADR-0044](adr/0044-cache-acceleratore-puro.md) (pure accelerator: associative
> sets, no relabeling, system correct even without the cache).

<a id="politica"></a>

## Policy

- The initial cache uses **CLOCK**.
- If benchmarks show significant *scan pollution*, evaluate **2Q**. This switch is
  conditional on a measurement, not made in advance.
- The cache MAY be **partitioned by Serie** to prevent a burst on one Serie from
  monopolizing the entire cache.

## Read path

```
request → Serie → snapshot/index → cache → segment
```

The index is consulted **before** the cache: the cache is queried with the required
version already known.

<a id="cache-e-snapshot"></a>

## Cache and snapshots

The cache MUST be aware of the data's version/epoch; a reader must not obtain a
version incompatible with its snapshot (INV-M3).

> **Decided ([ADR-0025](adr/0025-cache-per-location.md))** — Key the cache by **location** (`segment-id`, `offset`) rather than
> `_id`. Because closed segments are immutable, a location's contents never change:
> an entry cannot become ‘stale’, updates need no invalidation, and snapshot compatibility
> is guaranteed by construction, because every reader reaches the cache with the location
> of the version its snapshot must see. CLEAN/MERGE relocation changes locations:
> relocated records reenter the cache on the first read
> ([ADR-0044](adr/0044-cache-acceleratore-puro.md)); loss of warmth is measured, rather than
> offset by a mechanism (RSK-10). The cache participates in no protocol and the
> system gives the same answers with the cache disabled (INV-A12).

<a id="questioni-decise-e-rischi"></a>

## Decided questions and risks

- **QA-17** ([ADR-0025](adr/0025-cache-per-location.md)) — Granularity (document or block), key, per-Serie budget, and criteria for
  allocation between Serie.
- **RSK-10** — Double caching with the operating system's page cache if segments are read
  through buffered I/O or `mmap`; loss of warmth after compaction.
- Cache memory is subject to the same GC considerations as indexes: payloads must not
  live as collector-managed objects (QA-18).

<a id="metriche"></a>

## Metrics

Hit/miss, eviction, per-Serie occupancy, scan pollution
([12 Observability](12-osservabilita.md)). The scan-pollution metric determines whether
to switch to 2Q: it must be defined before benchmarking.
