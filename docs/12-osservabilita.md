<a id="12--osservabilità"></a>

# 12 — Observability

> **Source:** ‘Observability’ of the [specification](specifica/specifica-originale.md).
> **Modules:** cross-cutting (the *metrics* support module, see [16 Modules](16-moduli.md)).

Metrics are not an accessory: they are the system controllers' **inputs**. The thread-pool
scheduler and MERGE low-load policy decide based on these values, and choices deferred to
benchmarks (2Q, SIMD) depend on them.

<a id="metriche-richieste"></a>

## Required metrics

| Area | Metrics | Also used by |
|---|---|---|
| Request | throughput; P50, P95, P99, P99.9 | scheduler, low-load policy |
| Storage | segment count; segment size; live/dead ratio; bytes reclaimed; CLEAN throughput; MERGE throughput | compaction candidate selection |
| WAL | append throughput; fsync latency; group size; WAL queue depth | scheduler, low-load policy |
| Index | hit rate; lookup latency; rebuild time | — |
| Full text, phase 8 | analyzed bytes; tokens; postings visited; candidates/results; dictionary/posting/position space; delta RAM; build/rebuild; coverage and generation; budget/index-unavailable errors | contract and interference verification |
| Cache | hit/miss; eviction; per-Serie occupancy; scan pollution | CLOCK → 2Q decision |
| Scheduler | worker count; queue depth; CPU utilization; I/O utilization; compaction concurrency | scheduler, low-load policy |
| GC/SBCL | allocation rate; GC frequency; GC pause; heap usage | RSK-01 evaluation |

<a id="requisiti-derivati"></a>

## Derived requirements

> **Proposed** — The nature of the system implies several requirements not written in the
> specification:
>
> - **Hot-path cost.** Metrics are updated on every request: updates must neither allocate
>   nor contend (per-worker or per-Serie counters, aggregated when read).
> - **Percentiles.** P99 and P99.9 require bounded-memory histograms, not retained samples.
> - **Dimensions.** Request, WAL, storage, and cache metrics must be collected **per Serie**
>   as well as in aggregate: only this verifies isolation between Serie (INV-P3).
> - **Windows.** Controllers read smoothed values (EWMA); external exposure may use
>   different windows.

<a id="metriche-full-text-da-implementare"></a>

## Full-text metrics to implement

[ADR-0053](adr/0053-ricerca-full-text-indici-invertiti.md) and the
[dedicated campaign](13-benchmark.md#ricerca-full-text) require analysis,
query, delta publication, and build/rebuild to be distinguished.
Associate measurements with Serie, index, generation, and profile; also
measure impact on commit latency, GETs, and other Serie.
Incomplete coverage and resource exhaustion must be observable.
Counters follow the already planned per-worker/Serie model and
aggregation, without new global per-document counters. These metrics
are designed: their inclusion here does not indicate available instrumentation.

<a id="questioni-decise"></a>

## Decided questions

- Metric exposure: through the CBOR-framed protocol
  ([ADR-0029](adr/0029-interfacce-protocollo-query-contratto.md)).
- ‘Scan pollution’: fraction of slots inserted by scans and evicted without ever being reread
  ([ADR-0025](adr/0025-cache-per-location.md)).
- Device utilization: flush and read bandwidth measured by `io` relative to bandwidth
  measured at startup ([ADR-0023](adr/0023-politiche-di-compaction.md)); operating-system
  I/O queue depth is not used by controllers.
- Reliability: Serie and Archivio health states, quarantined segments, scrubbing progress,
  seqlock fallbacks, Serie in `:async`
  ([ADR-0033](adr/0033-fail-stop-e-integrita-end-to-end.md)).
- From the [design analysis](analisi-progettuale.md): in-flight CSNs and distance between CSN
  and horizon, waiting at snapshot creation ([ADR-0038](adr/0038-orizzonte-di-visibilita.md));
  length of each parking list ([ADR-0045](adr/0045-modello-di-esecuzione.md));
  fragment splits and index bytes per document
  ([ADR-0043](adr/0043-primary-index-a-frammenti.md)); failed cache verifications
  ([ADR-0044](adr/0044-cache-acceleratore-puro.md)); retained tombstones
  ([ADR-0042](adr/0042-tombstone-e-indice-dei-vivi.md)); unknown objects found on
  restart ([ADR-0036](adr/0036-leggi-di-progetto.md)).
