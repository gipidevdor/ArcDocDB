<a id="adr-0024--modello-di-memoria-array-specializzati-a-vita-lunga-zero-allocazione-sul-hot-path"></a>

# ADR-0024 — Memory model: long-lived specialized arrays, zero allocation on the hot path

- **Status:** Accepted (pause hypothesis verified by SPK-02); **item 3 clarified by [ADR-0043](0043-primary-index-a-frammenti.md)**: the index grows one fragment at a time and the collector retires replaced structures.
- **Date:** 2026-10-03
- **Relationship to the specification:** closes QA-18; implements "SIMD and native optimizations" items 1–5
- **References:** [architecture](../architettura.md#memoria), RSK-01

<a id="contesto"></a>

## Context

SBCL's collector stops all threads. Pauses depend on how much it must examine (objects
with pointers) and copy (small live objects), and on frequency (allocation rate).

<a id="decisione"></a>

## Decision

1. **All large structures are specialized arrays** (`(unsigned-byte 8)`,
   `(unsigned-byte 64)`) **allocated once** and long-lived: index tables, key
   arena, retained versions, cache arena, segment and I/O buffers, secondary-index
   deltas, metric histograms. They contain no pointers: the collector does not
   scan them; as large objects, it does not copy them.
2. **Zero allocation on the hot path**: GET, PUT, lookup, segment reads, and metric
   updates do not allocate in the managed heap. Results are written to buffers supplied
   by the caller; records are passed as (array, start, end). Interfaces between modules
   are designed accordingly ([architecture](../architettura.md#contratti)).
3. **Growth** through structure replacement: new area, copy, atomic swap, retirement
   with EBR ([ADR-0016](0016-epoch-based-reclamation.md)). No structure grows "in pieces"
   with pointers.
4. **Memory in the managed heap**, not external: avoids explicit pinning and dual management;
   arrays passed to system calls are pinned for the duration of the call.
5. **Collector parameters** set at startup based on RAM: dynamic heap
   size, large allocation threshold between collections, generations tuned so
   long-lived structures reach the oldest generation quickly.
6. Any remaining allocation on a hot path is a defect and has a metric (allocation
   rate per worker).

Patterns: arenas and pointer-free flat structures; zero-allocation hot path (storage engines
in GC languages: Cassandra off-heap, Go pebble).

<a id="conseguenze"></a>

## Consequences

- The GC sees a large but nearly pointer-free heap and a low allocation rate:
  infrequent, brief collections are the hypothesis, to be measured.
- Constrained coding style: type declarations, `simple-array`, no lists or closures
  on hot paths.

<a id="alternative-considerate"></a>

## Alternatives considered

- *Off-heap memory (alien):* no GC advantage over large specialized
  arrays, with the cost of manual management.
- *Per-entry objects:* ruled out by the specification.

<a id="valutazione"></a>

## Assessment

- Verification: SPK-02 measures pauses with heaps of tens of GB and synthetic load; SPK-01 and
  SPK-05 measure allocation per operation (target: 0 bytes).
- Reconsider if: pauses exceed the P99 target ([ADR-0028](0028-target-e-obiettivi-di-latenza.md))
  even with zero allocation → replace with an ADR on an alternative collector or external memory.
