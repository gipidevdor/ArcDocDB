<a id="adr-0028--target-per-serie-e-aggregati-obiettivi-numerici-di-latenza"></a>

# ADR-0028 — Per-Serie and aggregate targets; numerical latency objectives

- **Status:** Accepted by the author on 2026-10-08, including the minimums in the 2026-10-03 revision.
- **Date:** 2026-10-03
- **Relationship to the specification:** closes QA-26; clarifies “Preliminary targets”
- **References:** [13 Benchmarks](../13-benchmark.md), [estimates](../valutazione/stime-ordine-di-grandezza.md)

<a id="decisione"></a>

## Decision

1. The specification's throughput targets are **aggregated across the entire server**, with
   the workload distributed across at least 8 Serie. Targets **per individual Serie**: at least
   1/4 of the lower-end aggregate target (e.g., INSERT group commit ≥ 75k ops/s on one Serie).
2. Latency objectives on the reference hardware, measured server-side at a load of 70 %
   of the lower-end throughput:

| Operation | P99 | P99.9 |
|---|---|---|
| GET from cache/index | ≤ 1 ms | ≤ 5 ms |
| GET from NVMe | ≤ 2 ms | ≤ 10 ms |
| `:async` write | ≤ 1 ms | ≤ 5 ms |
| `:group` write | ≤ flush P99 + 2 ms | ≤ flush P99 + 10 ms |
| `:group` multiseries transaction | ≤ 2 × flush P99 + 3 ms | ≤ 2 × flush P99 + 15 ms |

3. Allowed **maximum GC pause**: 5 ms (P99.9 of pauses) — the SPK-02 criterion follows
   from this.
4. The objectives apply **during** CLEAN and while MERGE is in progress as well: this is the
   criterion used to measure the low-load policy.

<a id="conseguenze"></a>

## Consequences

- The load controller ([ADR-0023](0023-politiche-di-compaction.md)) has a numerical
  reference for P99.
- An SPK-02 result exceeding a 5 ms pause signals a need to revisit ADR-0024/ADR-0001.

<a id="alternative-considerate"></a>

## Alternatives considered

- *Per-Serie targets equal to aggregate targets:* incompatible with one writer per Serie
  ([budget](../valutazione/stime-ordine-di-grandezza.md#budget-del-writer-logico)).

<a id="revisione-2026-10-03-obiettivi-e-minimi-vincolanti"></a>

## Revision 2026-10-03: objectives and binding minimums

With reliability as the ultimate goal ([ADR-0031](0031-software-critico-criteri-e-priorita.md)),
the specification's targets remain **objectives**, with added **binding minimums**: reasonable
values achievable with all reliability checks enabled
([ADR-0033](0033-fail-stop-e-integrita-end-to-end.md), [ADR-0034](0034-policy-di-compilazione-e-standard-di-codifica.md)).
Failure to meet a minimum is a defect; failure to meet an objective is information.

| Operation (reference hardware) | Objective (specification) | **Binding minimum** |
|---|---|---|
| GET `_id`, cache/index, aggregate | 1–4 M ops/s | **300 k ops/s** |
| GET `_id`, NVMe, aggregate | 150–600 k ops/s | **50 k ops/s** |
| INSERT `:group`, aggregate (≥ 8 Serie) | 300 k–1 M ops/s | **100 k ops/s** (≥ 25 k per Serie) |
| UPDATE / DELETE, aggregate | 400 k–1.5 M ops/s | **100 k ops/s** |
| Simple indexed query | 500 k–2 M ops/s | **50 k ops/s** |
| Sequential scan | 1–5+ GB/s | **500 MB/s** |
| CLEAN | 0.5–3+ GB/s | **200 MB/s** |
| `:group` multiseries transactions | tens–hundreds of thousands/s | **10 k tx/s** |
| Operation P99 | table above | **3 × the values in the table above** |
| Maximum GC pause (P99.9) | 5 ms | **20 ms** |

The author confirmed the minimums on 2026-10-08. SPK-09 measures the cost of checks;
reproducible benchmarks verify the minimums (REQ-AFF-012).
