<a id="adr-0037--il-lotto-sigillato-un-solo-percorso-di-scrittura-un-flush-alla-volta-frontiera-durevole"></a>

# ADR-0037 — The sealed batch: a single write path, one flush at a time, durable frontier

- **Status:** Accepted
- **Date:** 2026-10-03
- **Relationship to the specification:** no amendment; clarifies “WAL” (group commit) and “Recovery.”
  **Partially supersedes** [ADR-0019](0019-durability-e-group-commit-pipelined.md) (group commit
  mechanics; levels remain), [ADR-0033](0033-fail-stop-e-integrita-end-to-end.md)
  §4 (truncated tail), and [ADR-0013](0013-log-structured-segmento-active-come-log.md) item 4
  (when a record is committed)
- **References:** [design analysis](../analisi-progettuale.md) AP-02, AP-03, AP-08;
  [architecture](../architettura.md#percorso-di-scrittura);
  [formats](../formati-su-disco.md#lotto-e-seal); INV-F2, INV-F3, INV-V5, INV-A9

<a id="contesto"></a>

## Context

ADR-0019 allowed several batches in flight on the same file, and ADR-0033 classified every
valid record following an anomaly as corruption: together, they turn an ordinary power loss
into a Serie failure (AP-03). The CSN was acquired before the batch contents were fixed
(AP-02). Control logs had no rule for their own tail (AP-08).

<a id="decisione"></a>

## Decision

<a id="1-il-lotto"></a>

### 1. The batch

The **batch** is a log's unit of atomicity, durability, and publication. It is a sequence
of records followed by a **SEAL** record that fixes its file, start position, record
count, contents (CRC of the record CRCs), CSN, and the **durable frontier** known
at closure. A batch is valid in its entirety or does not exist (INV-F2): none of its
records are applied if the SEAL is missing or does not match.

A non-prepared record is committed **if and only if it is in a valid batch**. There are no
TXID lists: membership is positional.

<a id="2-il-percorso-uguale-per-ogni-log"></a>

### 2. The path, identical for every log

```
pending ──closure──▶ written ──flush──▶ durable ──▶ published ──▶ acknowledged
```

1. The writer validates each operation and **holds its effect pending**: a record in the open
   batch buffer, an entry in the Serie's pending-version table.
2. **Closure**: when the queue is empty or the batch has reached the limit (bytes, operations).
   At closure the writer acquires the **CSN** (one atomic increment), writes it into the records,
   computes the header CRCs, and appends the SEAL. The closed batch is immutable.
3. **One I/O task at a time** per log, executed by the I/O pool: it writes (`write`) all
   closed batches not yet written, then performs the durable flush. On completion, if
   other batches have closed in the meantime, the next task starts. The writer makes no
   blocking calls and does not wait: it keeps forming batches
   ([ADR-0045](0045-modello-di-esecuzione.md)).
4. **Publication** in batch order, when a completed flush covers the batch: the
   versions move from the pending table to the index.
5. Client **acknowledgment** after publication (INV-V5).

The durability level changes **only the timing** of publication and acknowledgment:

| Level | Publication and acknowledgment |
|---|---|
| `:group` (default), `:strong` | after the flush covering the batch |
| `:async` | on `write` completion, before the flush |

`:strong` and `:group` provide the same guarantee; `:strong` closes the batch immediately,
without any formation wait. With `:async`, data is in the page cache at acknowledgment:
it survives process termination, but not machine shutdown. The restrictions in
ADR-0033 §10 remain.

Closed batches that are not yet durable are bounded in bytes per Serie; beyond the limit,
the writer stops draining the queue, which is itself bounded (`resource-exhausted`, INV-A8).

<a id="3-coda-troncata-o-corruzione-decidibile-dal-contenuto-inv-f3"></a>

### 3. Truncated tail or corruption: decidable from the contents (INV-F3)

Let `P` be the position of a log's first invalid batch. From `P` onward, search for valid
SEAL records **of that file** (the declared identifier and position match the actual
ones). Let `D` be the maximum durable frontier they declare.

- `D > P` → when that later batch was closed, the bytes at `P` were already durable: they
  have been altered. **Corruption**: `FAULTED`, no writes, operator decision.
- otherwise (no SEAL, or `D ≤ P`) → batches from `P` onward were not covered by a completed
  flush: **tail**. The log's valid length is `P`.

The rule does not depend on the order in which the medium persists unsynchronized writes.
A false SEAL found by chance causes opening to be refused, never silent
loss.

<a id="4-il-recovery-non-tronca-inv-a9"></a>

### 4. Recovery does not truncate (INV-A9)

The tail is not removed. Recovery **closes** the `ACTIVE` it found with a manifest record
that fixes its valid length `P`, and opens a new `ACTIVE`
([ADR-0040](0040-manifest-a-record-unico.md)). An `ACTIVE` segment therefore lives in a single
process; bytes beyond `P` are ignored by every reader and disappear through CLEAN.

<a id="5-tre-log-un-meccanismo"></a>

### 5. Three logs, one mechanism

The `ACTIVE` segment, `wal/control.log`, and `multiserie.log` are **logs of sealed batches**:
the same record frame ([ADR-0039](0039-cornice-unica-dei-record.md)), the same SEAL, the same
single flush, the same tail rule. Only the type of contained records differs. For the two
control logs, which never close, tail `P` is ignored on reads and the first batch
after restart is written in a compacted file (atomic rename).

Pattern: group commit with one flush at a time and acknowledgment by coverage (PostgreSQL:
WAL writes, group flush, waiting for the flush to reach one's LSN; `synchronous_commit`
for `:async`); separately verified header and body with the batch as the unit
(TigerBeetle); a new active file on every open (Bitcask).

<a id="conseguenze"></a>

## Consequences

- A single write path to verify, for three logs and three levels.
- Bounded writer state: the open batch, closed unpublished batches, one I/O
  task.
- Every restart leaves one additional closed segment, even a small one: it is a MERGE candidate.
- `:group` latency: between one and two flushes under load (the current one and its own).

<a id="limite-dichiarato"></a>

## Declared limit

Damage affecting, **at rest**, only the batches made durable by the last flush before an
abrupt shutdown — and not yet witnessed by the SEAL of a later batch — is
indistinguishable from a tail. This is the boundary of what a log can know about itself; it
coincides with the class of failures not tolerated (non-durable flush, FM-03) and is recorded
as [RES-05](../affidabilita/analisi-dei-guasti.md#rischi-residui-accettati). An orderly shutdown
closes the segment: no window.

<a id="alternative-considerate"></a>

## Alternatives considered

- *Multiple flushes in flight on the same file (ADR-0019):* no throughput gain (a flush
  synchronizes the entire file anyway) and writer state not bounded in advance.
- *Only one unsynchronized batch at a time, accumulating in memory:* simpler tail rule,
  but with `:async`, acknowledged data would reside only in process memory.
- *Truncating the tail during recovery:* a destructive write driven by a classification;
  a classification error would become a loss.

<a id="valutazione"></a>

## Evaluation

- Risks: closes the correctness portion of RSK-03; RES-05 declared.
- Verification: FI-01, FI-02 with unordered persistence of unsynchronized batches
  ([FM-25](../affidabilita/analisi-dei-guasti.md#fmea)); model in SPK-07 (any subset
  of unsynchronized batches may be lost or partial); SPK-03 measures latency and
  throughput with one flush at a time.
- Revisit if: SPK-03 shows that one flush at a time cannot reach the minimums in
  [ADR-0028](0028-target-e-obiettivi-di-latenza.md).
