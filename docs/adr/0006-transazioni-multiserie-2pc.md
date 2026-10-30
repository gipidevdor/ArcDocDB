<a id="adr-0006--transazioni-multiserie-2pc-like-con-un-unico-multiserielog"></a>

# ADR-0006 — 2PC-like multiseries transactions with a single `multiserie.log`

- **Status:** Accepted
- **Date:** 2026-10-01
- **Relationship to the specification:** records a specification decision ("Special Serie
  Registri," "Multiseries transactions")
- **References:** [05 Transactions](../05-transazioni.md), INV-T3, INV-T4, INV-T5, INV-W2

<a id="contesto"></a>

## Context

Serie are physically independent, and there is no global WAL. A transaction that
modifies multiple Serie must still be atomic, including across a crash.

<a id="decisione"></a>

## Decision

- A transaction that modifies multiple Serie follows a protocol equivalent to two-phase commit:
  BEGIN, PREPARE on the participants, flush their WALs, durable decision, COMMIT or ABORT,
  apply to the participants.
- All changes share a single TXID.
- The decision is recorded in `Registri/multiserie.log`: one file per Archivio, no
  per-transaction file, and group commit where appropriate.
- The transaction is committed only when the COMMIT decision is durable in `multiserie.log`.
- During recovery, the Recovery Manager reads `multiserie.log`, identifies prepared or
  incomplete transactions, and completes COMMIT or ABORT on the participants' WALs.

<a id="conseguenze"></a>

## Consequences

- Single-Serie transactions incur no overhead.
- A multiseries commit costs at least two sequential flushes.
- Between PREPARE and the decision, the affected documents have a pending change that must be managed without
  stopping the Serie writer.
- `multiserie.log` is a shared point in the Archivio and must be truncated.

<a id="alternative-considerate"></a>

## Alternatives considered

- *Global WAL for multiseries transactions:* atomicity with a single flush, but it reintroduces a
  shared data log; ruled out by the specification.
- *One file per transaction:* ruled out by the specification.
- *No multiseries transactions (application sagas):* does not meet the requirement.

<a id="valutazione"></a>

## Assessment

- Risks: RSK-05, RSK-06.
- Verification: SPK-07 (protocol model with a crash at every point); FI-03, FI-04, FI-05,
  FI-12.
- Open: Archivio commit order (QA-06), PREPARED state (QA-07), truncation (QA-08),
  isolation (QA-09).
