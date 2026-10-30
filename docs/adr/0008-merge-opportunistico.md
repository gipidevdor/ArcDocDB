<a id="adr-0008--merge-opportunistico-50-secondi-di-stabilità--basso-carico"></a>

# ADR-0008 — Opportunistic MERGE: 50 seconds of stability + low load

- **Status:** Accepted
- **Date:** 2026-10-01
- **Relationship to the specification:** records a specification decision ("Mandatory
  conditions for Merge," "Low-load merge policy," "Dynamic compaction scheduler"). This is the
  rule added in the latest specification revision.
- **References:** [07 Compaction](../07-compaction.md#merge), INV-C5, INV-C6, INV-P4

<a id="contesto"></a>

## Context

MERGE is a structural optimization: it improves locality and segment count, but it is
not required for correctness or space reclamation. Running it at the wrong time competes
with user traffic for CPU, device, memory, and cache resources.

<a id="decisione"></a>

## Decision

A segment is a MERGE candidate only if **all** conditions hold:

1. it is `CLOSED`, immutable, and not `ACTIVE`;
2. it has been stable for at least **50 seconds**, measured from its close/stabilization timestamp;
3. it is not needed by an active snapshot;
4. it belongs to a group that exceeds the segmentation thresholds;
5. the engine is under **low load**.

The Compaction Scheduler evaluates load before starting a MERGE (CPU, P95/P99, queues,
throughput, WAL and flushes, NVMe and I/O queue, backlog, active workers). Under high load it does not start
MERGE, reduces its concurrency, and prioritizes requests and WAL. If load rises during
a MERGE, it starts no additional MERGEs and may slow or suspend noncritical work.

The rule applies **only to MERGE**; CLEAN has no stability constraint.

Priority: user traffic > WAL/durability > necessary CLEAN > opportunistic MERGE.

<a id="conseguenze"></a>

## Consequences

- MERGE cannot worsen tail latency during periods of load.
- Newly closed segments are not processed again immediately.
- Under sustained load, MERGE may never start: the system must also work well
  with many small segments.
- An operational, stable definition of "low load" is needed.
- A long-lived snapshot suspends MERGE for the segments it needs.

<a id="alternative-considerate"></a>

## Alternatives considered

- *Threshold-triggered MERGE, regardless of load:* keeps segment count under control, but
  interferes with traffic at the worst times.
- *MERGE immediately after CLEAN:* explicitly ruled out by the specification.

<a id="valutazione"></a>

## Assessment

- Risks: RSK-08 (MERGE never runs), RSK-12 (controller instability), RSK-09.
- Verification: SPK-06; burst benchmarks with MERGE waiting and in progress.
- Open: definition of low load, preemption, possible emergency threshold (QA-12);
  stabilization timestamp and restart (QA-13); long-lived snapshots (QA-14); thresholds (QA-11).
