<a id="adr-0003--wal-per-serie-nessun-global-data-wal"></a>

# ADR-0003 — WAL per Serie, no global data WAL

- **Status:** Accepted
- **Date:** 2026-10-01
- **Relationship to the specification:** records a specification decision (“WAL,” “Physical
  layout”)
- **References:** [04 WAL and durability](../04-wal-e-durability.md), INV-W1, INV-W2

<a id="contesto"></a>

## Context

A single WAL is the classic way to achieve durability and a global order, but it is also a
serialization point for all writes in the system.

<a id="decisione"></a>

## Decision

Each Serie has an independent WAL. There is no global data WAL. The only log shared at
Archivio level is `Registri/multiserie.log`, which contains decisions rather than data. The
system favors group commit, including on `multiserie.log`.

<a id="conseguenze"></a>

## Consequences

- Writes to different Serie do not contend for a log.
- There is no global commit order: one must be constructed where needed (QA-06).
- Recovery handles each WAL separately and in parallel.
- Flushes from several WALs compete on the same device.

<a id="alternative-considerate"></a>

## Alternatives considered

- *Global WAL with group commit:* larger groups and a single flush stream, but all
  Serie share latency and contention; explicitly excluded by the specification.

<a id="valutazione"></a>

## Evaluation

- Risks: RSK-03 (amplification, related to QA-02), RSK-06.
- Verification: SPK-03 measures flushes with 1…64 concurrent WALs. If the device serializes
  flushes, the benefit on the durable path is smaller than expected: that result must be
  recorded here.
- Open: WAL ↔ segment relationship and truncation (QA-02); durability levels (QA-05).
