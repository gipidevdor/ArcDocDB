<a id="adr-0041--multiserie-su-disco-segmenti-autosufficienti-abort-senza-traccia-conferma-dopo-la-pubblicazione"></a>

# ADR-0041 — Multiseries on disk: self-contained segments, abort without a trace, acknowledgment after publication

- **Status:** Accepted
- **Date:** 2026-10-03
- **Relationship to the specification:** no amendment; implements “Multiseries transactions” and
  steps 1–6 of the protocol. **Partially supersedes** [ADR-0021](0021-2pc-intenti-outcome.md)
  (PREPARE record, ABORT outcomes, OUTCOME record lifetime, acknowledgment timing, format of
  `multiserie.log`). What remains from ADR-0021: nonblocking writer, intents without waiting,
  *presumed abort*, single decision log.
- **References:** [design analysis](../analisi-progettuale.md) AP-05, AP-06, AP-08;
  [architecture](../architettura.md#transazioni-multiserie);
  [formats](../formati-su-disco.md#multiserielog); INV-S7, INV-T3, INV-T4, INV-V5

<a id="contesto"></a>

## Context

ADR-0021 left the OUTCOME record's lifetime undefined: it could reside in a different segment
from the records it resolves and be discarded by CLEAN while the decision had already been
truncated from `multiserie.log` — on restart, the prepared records would have been
aborted (AP-05). The client received acknowledgment before the transaction was visible
(AP-06). Three records (PREPARE, ABORT decision, OUTCOME ABORT) carried no information that
the rest of the format did not already provide.

<a id="decisione"></a>

## Decision

<a id="1-protocollo"></a>

### 1. Protocol

1. The coordinator sends `PREPARE(T, operazioni)` to each participant's writer queue.
2. The writer checks expected-version and pending versions; on conflict it responds
   `abort` (without waiting). Otherwise it appends records with the *prepared* flag and
   `stamp = TXID` to the open batch and registers **intents** in the pending-version table. All
   of T's operations on the Serie are in **one** batch: the SEAL makes them atomic. When
   the batch is durable, it responds `prepared`.
3. Having received all `prepared` responses, the coordinator queues `DECISION(T, partecipanti)`
   to the logical writer of `multiserie.log`; at batch closure T receives its **CSN**, which
   remains in flight ([ADR-0038](0038-orizzonte-di-visibilita.md)). When the batch is durable,
   T is **committed** (INV-T3) and the coordinator sends `OUTCOME(T, csn)` to the participants.
4. On `OUTCOME`, the writer publishes T's versions in the index with that CSN, removes
   the intents, appends the `OUTCOME` record to the open batch, and responds `applicato`;
   when the batch is durable, it responds `esito durevole`.
5. Once all `applicato` responses arrive: the CSN leaves the horizon and the coordinator
   **acknowledges the client** (INV-V5). Once all `esito durevole` responses arrive: the decision
   **may be forgotten**.

<a id="2-abort-senza-traccia"></a>

### 2. Abort without a trace

With *presumed abort*, the absence of a COMMIT decision **is** the abort. Therefore:

- `multiserie.log` contains only `DECISION` records, and every DECISION is a COMMIT;
- if a participant responds `abort` or does not respond within the limit, the coordinator
  sends `ABORT(T)`: the writer removes the intents and writes nothing; prepared records
  remain in the segment, without an outcome, and are dead.

<a id="3-segmenti-autosufficienti-inv-s7"></a>

### 3. Self-contained segments (INV-S7)

**Rotation of `ACTIVE` waits until the Serie has no pending intents.** Because
`OUTCOME` is appended to the same `ACTIVE` that contains the prepared records, and the wait
is bounded by the maximum transaction duration, it follows that:

> in a `CLOSED` segment, a prepared record is committed if and only if its `OUTCOME` is
> in the same segment, or — for a segment closed by recovery — its outcome is in the
> manifest's closure record. Otherwise it is aborted.

A closed segment can be interpreted on its own: without `multiserie.log`, without other segments.
If `ACTIVE` reaches its maximum size with intents still pending, the writer refuses new
writes (`resource-exhausted`) until they resolve.

Direct consequences:

- hints and indexes, written after closure, are always **resolved** (final CSN);
- CLEAN and MERGE rewrite committed prepared records as ordinary records with their CSN and
  **never copy** an `OUTCOME`: compaction output contains only resolved records;
- no tracking across segments.

### 4. Recovery

1. Read `multiserie.log`: the decision table.
2. For each Serie, in the `ACTIVE` found: a prepared record with an `OUTCOME` in the segment is
   committed; without an `OUTCOME`, it is committed if the table contains T, otherwise aborted.
   COMMIT outcomes derived from the table are written in the EDIT that closes the segment
   ([ADR-0040](0040-manifest-a-record-unico.md)): from that point, the outcome is durable in
   the participant.
3. When every participant in T has a durable outcome, the decision may be forgotten. At the
   end of recovery, `multiserie.log` is rewritten with only decisions concerning
   Serie that were not opened (`FAULTED`).

### 5. `multiserie.log`

A log of sealed batches ([ADR-0037](0037-lotto-sigillato.md)) with its own Archivio
logical writer and group commit. Compaction: a new file with decisions that cannot be forgotten,
atomic rename. If a decision flush fails, the Archivio enters `MULTI-DISABLED`:
T's outcome is unknown to the process, its intents remain until restart, and its CSN is
canceled in the horizon.

Pattern: 2PC *presumed abort* (Mohan, Lindsay, Obermarck: aborts are not recorded); outcome
recorded in the participant so that the decision may be forgotten; acknowledgment after application
(Percolator acknowledges after the primary commits; here application is in memory).

<a id="conseguenze"></a>

## Consequences

- Three fewer records (PREPARE, ABORT decision, OUTCOME ABORT) and one fewer field in the
  decision; an aborted transaction costs no writes after PREPARE.
- After acknowledgment, the transaction is visible to every subsequent read.
- Rotation may be delayed by a few milliseconds; a segment may slightly exceed its
  target.
- Commit latency unchanged: PREPARE flush, decision flush, in-memory application.

<a id="alternative-considerate"></a>

## Alternatives considered

- *OUTCOME in a later segment with a reference to the prepared-record segment:* works,
  but forces compaction to know which segments still exist to decide whether an OUTCOME
  is needed.
- *Retain decisions as long as the prepared-record segment exists:* `multiserie.log`
  would grow with cold segments.
- *Acknowledgment at durable decision (ADR-0021):* a GET after acknowledgment may not see the
  transaction.

<a id="valutazione"></a>

## Evaluation

- Risks: RSK-05 closed at the design level; RSK-06 unchanged.
- Verification: FI-03, FI-04, FI-05, FI-12; model in SPK-07 with a crash at every step,
  concurrent rotation, CLEAN of the segment containing an OUTCOME, hint regeneration.
