<a id="adr-0005--un-writer-logico-per-serie-con-controllo-ottimistico"></a>

# ADR-0005 — One logical writer per Serie with optimistic checking

- **Status:** Accepted
- **Date:** 2026-10-01
- **Relationship to the specification:** records a specification decision (“Concurrency,”
  “Single-Serie transactions”)
- **References:** [10 Concurrency](../10-concorrenza-e-scheduling.md),
  [05 Transactions](../05-transazioni.md), INV-P1, INV-P2, INV-T1, INV-T2

<a id="contesto"></a>

## Context

Writes to a Serie must be ordered (WAL, versions) and conflicts on the same document
must be detected, without global locks or a thread per Serie or request.

<a id="decisione"></a>

## Decision

- Each Serie has one logical writer and many concurrent readers.
- The writer is not a dedicated thread: it is a role performed by pool workers.
- The writer serializes only what must be serialized within the Serie.
- Single-Serie transactions use only the Serie's WAL and detect conflicts through
  optimistic version checking; checking the expected version is atomic with respect
  to applying the change.
- No global writer lock.

<a id="conseguenze"></a>

## Consequences

- No per-document lock: “check and apply” in the writer is atomic by construction.
- The Serie has a total order of changes, matching WAL order.
- A Serie's write throughput is limited by the serial portion: all work that can run
  in parallel must remain outside the writer.
- Conflicts incur abort/retry costs: workloads with heavy contention on the same document
  waste work.
- The writer cannot wait for external events without stopping the Serie (relevant to 2PC,
  QA-07).

<a id="alternative-considerate"></a>

## Alternatives considered

- *Multiple writers with per-document locks:* more parallelism within the Serie, at the cost
  of locks, deadlocks, and coordination of WAL order.
- *Dedicated thread per Serie:* simple, but excluded by the specification (does not scale
  with the number of Serie).

<a id="valutazione"></a>

## Assessment

- Risks: RSK-04.
- Verification: SPK-04; [budget](../valutazione/stime-ordine-di-grandezza.md#budget-del-writer-logico).
- Open: isolation level (QA-09); per-Serie or aggregate targets (QA-26).
