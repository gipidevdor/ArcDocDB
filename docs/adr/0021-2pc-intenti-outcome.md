<a id="adr-0021--2pc-con-writer-non-bloccante-intenti-no-wait-record-outcome-troncamento-di-multiserielog"></a>

# ADR-0021 — 2PC with a nonblocking writer: no-wait intents, OUTCOME records, truncation of `multiserie.log`

- **Status:** Accepted; **partially superseded by [ADR-0041](0041-multiserie-segmenti-autosufficienti.md)**: no PREPARE record or ABORT outcome, OUTCOME in the same segment as prepared records, acknowledgment after application, `multiserie.log` with only the DECISION record. These remain: nonblocking writer, no-wait intents, *presumed abort*.
- **Date:** 2026-10-03
- **Relationship to the specification:** closes QA-07 and QA-08; implements [ADR-0006](0006-transazioni-multiserie-2pc.md)
- **References:** [architecture](../architettura.md#transazioni-multiserie),
  [on-disk formats](../formati-su-disco.md#multiserielog), INV-T3, INV-T4, INV-P3

<a id="decisione"></a>

## Decision

<a id="protocollo"></a>

### Protocol

1. The coordinator (the worker serving the request) sends each participating Serie
   `PREPARE(T, operazioni)` through the writer queue.
2. The writer, within the batch, checks expected-version and **intents**; on conflict it
   replies `abort`; otherwise it appends data records with the *prepared* flag and CSN 0, then a
   `PREPARE T` record; records the intents `chiave → T`; the batch goes to flush (`:group` or
   stronger); on completion it replies `prepared`. **The writer does not wait for the decision.**
3. After receiving every `prepared`, the coordinator appends the decision to `multiserie.log` (group
   commit). When it is durable: it assigns the CSN, inserts `T` into the "being applied" set,
   acknowledges the client (INV-T3), and sends `OUTCOME(T, COMMIT, csn)` to the participants.
4. On `OUTCOME`, the writer updates the index (version, CSN), removes the intents, appends
   an `OUTCOME T` record to the segment (flushed with the next batch), and replies.
5. When all participants have made the `OUTCOME` durable, the coordinator removes `T`
   from "being applied" and marks it **forgettable**.
6. If a participant replies `abort` or fails to reply before the timeout: an `ABORT` decision,
   same path; intents are removed and the records remain dead in the segment.

<a id="stato-prepared"></a>

### PREPARED state

- **Readers (read committed and snapshot):** see the previous version. An intent is
  never visible.
- **Concurrent writes to the same document (single-Serie or multiseries):** the writer
  immediately replies `conflict` (**no-wait**). No waiting inside the writer.
- A single-Serie conflict with an intent is indistinguishable to the client from a
  version conflict: retry.

### Recovery

- *Presumed abort.* On restart, the Recovery Manager loads decisions from `multiserie.log`.
  A `PREPARE T` without an `OUTCOME` in the segment is resolved as COMMIT if a COMMIT decision is
  in the log, otherwise ABORT. The missing `OUTCOME` is appended.
- The coordinator writes nothing before the decision: without a decision, no client has
  received an acknowledgment.

### `multiserie.log`

- Records `{seq, tipo: COMMIT|ABORT|CHECKPOINT, txid, csn, partecipanti, CRC32C}`.
- Truncation: when forgettable decisions exceed a threshold, the coordinator writes
  `multiserie.log.new` with a `CHECKPOINT` and only the nonforgettable decisions, flushes it,
  renames it over the original, and runs directory `fsync`. There is still only one file.

Patterns: presumed-abort 2PC (Mohan et al.); no-wait intents (Percolator uses pending
locks; here there is no waiting because there is only one writer); decision log compacted through
checkpoints.

<a id="conseguenze"></a>

## Consequences

- A Serie never stops for a multiseries transaction: it costs two records in the batch (PREPARE and
  OUTCOME) and one intent entry.
- Commit latency: PREPARE flush + decision flush.
- Dead records in segments for aborted transactions (reclaimed by CLEAN).

<a id="alternative-considerate"></a>

## Alternatives considered

- *Waiting on intents:* waiting queues inside the writer and possible deadlocks between
  Serie.
- *Decision also written in every participant's segment before acknowledgment:* one more flush
  per participant without benefit: the decision in the single log suffices.

<a id="valutazione"></a>

## Assessment

- Verification: FI-03, FI-04, FI-05, FI-12; model in SPK-07 with a crash at every step.
