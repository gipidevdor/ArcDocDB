<a id="adr-0057--selezione-automatica-del-modo-dellindice-per-serie"></a>

# ADR-0057 — Automatic index-mode selection per Serie

- **Status:** Accepted by the author on 2026-10-22; incremental implementation
- **Date:** 2026-10-22
- **Relationship to the specification:** extends resident mode with automatic selection
  per Serie, making ADR-0049 concrete; does not change persistent formats or commits
- **References:** [ADR-0049](0049-capacita-oltre-la-ram.md),
  [ADR-0050](0050-pubblicazione-e-costi-della-directory.md),
  [implementation contract](../implementazione/indice-automatico.md),
  REQ-IDX-008, INV-I7, INV-A8, INV-P6

<a id="contesto"></a>

## Context

The author requires an index beyond RAM, preserving the resident path when
memory suffices and selecting automatically during startup and operation. A
fully cached paged index is not equivalent to the flat resident path:
pinning, copies, and page management have additional costs.

<a id="decisione"></a>

## Decision

1. Default, automatic behavior is local to the Serie. At startup,
   if the resident peak fits the assigned budget, resident mode is selected.
2. During operation, resident mode remains active while the predicted peak stays within the
   budget. Exceeding it requires paged mode before admitting
   work that would exceed the limit; it does not authorize swap use.
3. Return from paged to resident is automatic with hysteresis: resident
   peak within a percentage of budget, configurable 1..99, default 75.
   The default is a policy, not a benchmark result. The separate
   band avoids repeated switches when estimates fluctuate near the limit.
4. Every switch requires reservation of the migration peak: source
   still usable, destination, staging, delta, and retained references.
   If memory is unavailable, the selector returns insufficient budget: it does not begin
   allocations or change the root. The caller suspends or rejects new
   work it cannot reserve, maintaining already-admitted reads.
5. Estimates include slots, keys, directory, history, metadata, retained
   garbage, and relevant transients. Budgets and estimates are conservative integer
   byte counts, not just the OS's instantaneous free RAM.
   The peaks for the two modes describe the next work to admit; the migration
   peak describes switching on the current dataset, before that
   work. It may be lower than the future resident peak the switch avoids,
   but not lower than the destination peak. This makes it possible to anticipate
   growth rather than waiting for an index already too large to migrate.
6. The selector is pure, performs no I/O, allocates nothing after configuration, and
   touches no global state. The controller uses it outside GET lookup;
   it adds no counters or serialization between Serie.
7. Selection is a proposal, not publication. The future actuator must
   build and verify the destination, recheck frontiers, and
   publish a single consistent view; commits, snapshots, outcomes, and epochs
   remain the engine's. No new durable atomicity point.

The first increment implements only the selector and the abstract frame-lifetime
model. It has no paged primary backend, migration,
physical-memory meter, or engine actuator; it does not advertise those
functions as available. The current index continues to use resident mode.

<a id="conseguenze"></a>

## Consequences

The API distinguishes desired destination from admissible action. No flag
allows pretending a migration has completed. Two Serie with different
budgets may select different modes without per-request synchronization.
Global quotas remain the controller's responsibility: the sum also includes
concurrent migrations and the engine's other components.

Paged mode still requires a format ADR and a verified decision
on cache, directory, and history. The lock-free property is evaluated
separately for resident lookup, acquire/release, and misses with I/O.

<a id="alternative-considerate"></a>

## Alternatives considered

- Always-on paging: imposes overhead even when the index fits in RAM.
- Selection only manually or at startup: does not meet automatic growth and return requirements.
- The same threshold in both directions: may cause continuous oscillation.
- Immediately switching a flag: does not demonstrate commit or snapshot coverage.
- Deciding from free RAM alone: overlooks reservations and transient memory.

The deadband and capacity-based selection pattern follows the principle of the
[controller already planned in ADR-0011](0011-thread-pool-dinamico.md).
Hysteresis decides when to prepare a switch, not publication correctness.

<a id="valutazione"></a>

## Assessment

Tests at exact thresholds, initial selection, growth, shrinkage, budget
changes, insufficient transient capacity, saturation, and independent Serie.
Composed decisions listed in the contract. Before the actuator, differential
oracles, crashes before/after the swap, concurrent snapshots and writers,
memory beyond RAM without swap, and measured comparisons of the two modes are needed.
