<a id="adr-0019--livelli-di-durability-e-group-commit-pipelined"></a>

# ADR-0019 — Durability levels and pipelined group commit

- **Status:** Accepted; **partially superseded by [ADR-0037](0037-lotto-sigillato.md)**: one I/O task at a time per log (no longer multiple batches in flight on the same file), CSN at batch closure, acknowledgment after publication. The levels remain.
- **Date:** 2026-10-03
- **Relationship to the specification:** closes QA-05; clarifies “WAL” (group commit)
- **References:** [architecture](../architettura.md#percorso-di-scrittura), INV-D1, INV-V1

<a id="decisione"></a>

## Decision

<a id="livelli"></a>

### Levels

| Level | Client acknowledgment | Reader visibility | Use |
|---|---|---|---|
| `:strong` | after the group flush, started **immediately** | after the flush | critical operations |
| `:group` (**default**) | after the group flush, started at batch closure | after the flush | general use |
| `:async` | on in-memory application | immediate | bulk ingestion |

- The level is configured **per Serie**; an individual operation may request a stronger one,
  never a weaker one.
- **“Committed” for INV-D1** = acknowledged at `:group` or `:strong` level. With `:async`,
  the contract is: acknowledged operations that have not yet been flushed may be lost in a
  crash; the order of surviving operations is preserved (log prefix).
- A multiseries transaction uses at least `:group` on all participants.
- INV-V1: with `:group` and `:strong`, a reader never sees a version that is not yet durable.

<a id="group-commit-pipelined"></a>

### Pipelined group commit

The logical writer forms a batch, encodes it in the `ACTIVE` segment buffer, performs
`write`, and **hands the flush to the I/O pool**, then immediately moves on to the next batch.
On flush completion, the callback (executed by the writer itself, queued after operations)
publishes index updates and acknowledges the batch's clients. Several batches may be in
flight; publications occur in batch order.

Per-Serie parameters: maximum batch size (bytes and operations) and maximum formation wait
(default 0: the batch closes when the writer has drained the queue or reached the size,
i.e., it adapts to load without a timer).

Pattern: pipelined group commit (MySQL binlog group commit; PostgreSQL WAL writer);
configurable synchronization levels (PostgreSQL `synchronous_commit`).

> **Revision 2026-10-03 ([ADR-0033](0033-fail-stop-e-integrita-end-to-end.md) §10):** `:async` is never the default, requires an explicit per-Serie choice, and is forbidden for Registri and for participants in multiseries transactions.

<a id="conseguenze"></a>

## Consequences

- The writer never blocks on I/O: the per-Serie ceiling is determined by CPU, not flushes.
- Latency for `:group` is ≈ one flush + batch wait; `:strong` removes the batch wait
  but not the flush.
- The `io` module must provide asynchronous flush with completion queued to the writer.

<a id="alternative-considerate"></a>

## Alternatives considered

- *Batch formation timer:* adds latency at low load; the adaptive batch is
  sufficient.
- *Writer waiting for the flush:* simple, but halves per-Serie throughput.

<a id="valutazione"></a>

## Evaluation

- Verification: SPK-03 (flush), FI-01, FI-02; batch publication order tests.
