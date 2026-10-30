<a id="adr-0016--epoch-based-reclamation-per-segmenti-tabelle-e-indici-ritirati"></a>

# ADR-0016 — Epoch-based reclamation for retired segments, tables, and indexes

- **Status:** Accepted; **clarified by [ADR-0043](0043-primary-index-a-frammenti.md)** (EBR governs only segment descriptors and files; the collector retires directories and fragments) and by [ADR-0045](0045-modello-di-esecuzione.md) (a read section is a task).
- **Date:** 2026-10-03
- **Relationship to the specification:** closes QA-16; implements INV-R1 and INV-C10
- **References:** [architecture](../architettura.md#reclaim), INV-R1

<a id="contesto"></a>

## Context

Reclaiming an `OBSOLETE` segment, a replaced index table, or a secondary index base requires
knowing when no reader uses it anymore, with negligible cost on the read path and without
shared counters.

<a id="decisione"></a>

## Decision

**Epoch-based reclamation (EBR)** at Archivio level:

- A global epoch counter `E` (64 bits).
- Each worker has its own slot (separate cache line) in which it publishes the current epoch
  when entering a read section and an “inactive” value when leaving. Entry costs one
  read of `E` and one local write.
- Whoever retires an object (segment, table, index base) queues it with retirement epoch
  `r` and increments `E`.
- A retired object is **reclaimable** when every worker is inactive or has published an epoch
  `> r`. The Compaction Scheduler checks this periodically.

Snapshots do not hold segment references: they hold a CSN, and locations come from the index
and retained versions ([ADR-0015](0015-primary-index-swiss-table-swmr.md)). Transactions hold
(key, version), not locations. Therefore, after conditional relocation, the four conditions
of INV-R1 reduce to: *no remaining reference from the index or retained versions* (guaranteed
by completed relocation) **and** *the epoch has been passed*.

Pattern: EBR (Fraser 2004; Crossbeam; RCU in the Linux kernel).

<a id="conseguenze"></a>

## Consequences

- Wait-free readers with no shared writes.
- A worker blocked inside a read section holds up reclamation: read sections
  are short by construction (they include neither network I/O nor waits).
- Reclamation is deferred by a few epochs: disk space is freed after a delay of
  milliseconds–seconds, never longer.

<a id="alternative-considerate"></a>

## Alternatives considered

- *Reference count per segment:* one shared atomic write per read.
- *Hazard pointers:* more complex for objects as large and numerous as segments.

<a id="valutazione"></a>

## Evaluation

- Verification: FI-09, FI-11; model in SPK-07; read stress test during compaction.
