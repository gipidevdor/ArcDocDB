<a id="adr-0013--storage-log-structured-il-segmento-active-è-il-log-dei-dati-wal-è-il-control-log-della-serie"></a>

# ADR-0013 — Log-structured storage: the ACTIVE segment is the data log; `wal/` is the Serie's control log

- **Status:** Accepted (amends the specification); **partially superseded by [ADR-0037](0037-lotto-sigillato.md)**: a record is committed if it is in a valid sealed batch (item 4); record types are in [ADR-0039](0039-cornice-unica-dei-record.md).
- **Date:** 2026-10-03
- **Relationship to the specification:** closes QA-02; **amends** the “WAL” section and the role of
  `wal/` in the “Physical layout.” Preserves: WAL per Serie, no global data WAL, group commit,
  a single `multiserie.log`.
- **References:** [architecture](../architettura.md#percorso-di-scrittura),
  [on-disk formats](../formati-su-disco.md), INV-W1, INV-D1, INV-F1

<a id="contesto"></a>

## Context

The specification provides a WAL and append-only segments for each Serie. If the full record
is written to both, every byte is written twice and the upper end of the INSERT targets exceeds
the bandwidth of an NVMe device ([estimates](../valutazione/stime-ordine-di-grandezza.md#banda-di-scrittura)).
A separate WAL protects structures updated in place; with append-only segments it is
redundant.

<a id="decisione"></a>

## Decision

1. **The `ACTIVE` segment is the Serie's data log.** Every record (PUT, tombstone,
   PREPARE, group COMMIT, OUTCOME) is written **once only**, to the `ACTIVE` segment,
   with a length and CRC32C. Group commit performs `write` + flush on the `ACTIVE` segment.
2. **`wal/control.log` is the Serie's WAL**: an append-only, write-ahead log of
   *structural* changes only — segment opening and closing, compaction swaps, state
   changes, checkpoints. It is small and written rarely; it uses group commit.
3. Data recovery for a Serie scans the `ACTIVE` segment from the last
   checkpoint; structural recovery replays `control.log`
   ([ADR-0018](0018-control-log-manifest-swap.md)).
4. A record is committed if followed, in the same segment, by a group COMMIT record that
   lists it; a PREPARE record is committed if an OUTCOME COMMIT exists for its TXID
   ([ADR-0021](0021-2pc-intenti-outcome.md)).

Pattern: log-structured storage with an in-memory index (Bitcask, Riak), where the data file is
the log; a separate manifest for the structure (LevelDB/RocksDB).

<a id="conseguenze"></a>

## Consequences

- 1× write amplification on the data path; a single flush per group.
- The part of the specification that assigns “durability, recovery, state reconstruction,
  ordered recording” to the WAL remains true for the combined “ACTIVE segment + control log.”
- Aborted transactions leave dead records in the segment: CLEAN reclaims them.
- The record format must suffice for recovery without an index (INV-F1).
- `multiserie.log` remains separate and unchanged.

<a id="alternative-considerate"></a>

## Alternatives considered

- *Full record in the WAL and then in the segment:* 2× writes; rejected due to bandwidth.
- *WAL with only references to records in the segment:* one write, but two files to synchronize
  in order for each group (two flushes): more complex and slower than a single log, with no benefit.

<a id="valutazione"></a>

## Evaluation

- Closed risks: RSK-03 (reduced to 1×). Remaining: many `ACTIVE` segments (one per Serie)
  perform concurrent flushes — measured by SPK-03.
- Verification: FI-01, FI-02 (truncated tail → discarded based on the CRC); SPK-07.
