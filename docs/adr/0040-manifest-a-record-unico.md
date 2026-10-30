<a id="adr-0040--manifest-a-record-unico-edit-il-catalogo-decide-le-directory-seguono"></a>

# ADR-0040 — Single-record manifest (EDIT); the catalog decides, directories follow

- **Status:** Accepted
- **Date:** 2026-10-03
- **Relationship to the specification:** no amendment; implements “Segments” (states), “Clean/Merge
  workflow,” “Recovery,” “Catalog.” **Partially supersedes**
  [ADR-0018](0018-control-log-manifest-swap.md) (record types, order of rename and record,
  timestamps, orphans) and [ADR-0022](0022-registri-come-serie-catalogo.md) item 3 (Serie
  creation and deletion). What remains from ADR-0018: the control log is the manifest; the
  swap is a single record.
- **References:** [design analysis](../analisi-progettuale.md) AP-14;
  [laws](0036-leggi-di-progetto.md); [formats](../formati-su-disco.md#control-log);
  INV-A9, INV-A10, INV-A11, INV-C7, INV-C8, INV-C9

<a id="contesto"></a>

## Context

The control log recorded seven event types, but the only fact that must survive a
restart is **which segments make up the Serie**. After a restart there are no readers or
snapshots: `OBSOLETE` and `RECLAIMABLE` have no durable content; counters are derived
(INV-S6); monotonic timestamps cannot be compared across restarts. The “rename, then
record” order left files with final names unknown to the manifest, to be deleted “because absent.”

<a id="decisione"></a>

## Decision

<a id="1-un-solo-record-edit"></a>

### 1. A single record: EDIT

```
EDIT { completo?,  apre: id | nessuno,
       chiude:  [(id, lunghezza-valida, esiti: [(txid, csn)…])…],
       rimuove: [id…] }
```

A Serie's structural state is the **fold** of EDITs in log order:

- the set of `CLOSED` segments, each with its valid length and any outcomes
  ([ADR-0041](0041-multiserie-segmenti-autosufficienti.md));
- the single `ACTIVE`;
- the set of **removed** segments whose files may still exist.

An EDIT with the `completo` flag declares the entire state: it is the first record of every
control log file, replacing the old `CHECKPOINT`. It also carries the **next segment-id**:
an identifier named by an EDIT is never reused, even after the segment is deleted and
the log compacted, so that no derived file or cached data can be attributed to a
segment other than the one for which it was created.

| Operation | EDIT |
|---|---|
| Rotation | `chiude: (a, n)` · `apre: b` |
| CLEAN, MERGE | `chiude: (output, n)` · `rimuove: sorgenti` |
| Segment with no required records | `rimuove: s` |
| Closure after a crash | `chiude: (a, P, esiti)` · `apre: b`, inside a `completo` EDIT |

The specification's states remain the model states: `ACTIVE` and `CLOSED` mean membership
in the set; `OBSOLETE` (removed, still being read), `RECLAIMABLE` (removed, no readers:
[ADR-0016](0016-epoch-based-reclamation.md)), and `DELETED` are **in-memory** states of a
removed segment.

<a id="2-prepara-decidi-completa"></a>

### 2. Prepare, decide, complete

For each new file (`ACTIVE` segment, compaction output):

1. **prepare**: write `<id>.seg.tmp`, make it durable, synchronize the directory;
2. **decide**: the EDIT, written by the Serie's writer in a sealed control log batch
   ([ADR-0037](0037-lotto-sigillato.md)), durable;
3. **complete**: rename to `<id>.seg`; for removed sources, wait for the epoch,
   close descriptors, delete.

The writer writes to the new `ACTIVE` through the already open descriptor: it does not wait
for the rename. Index relocations follow the EDIT, as in ADR-0018.

<a id="3-riconciliazione-al-riavvio"></a>

### 3. Reconciliation on restart

| File found | Manifest says | Action |
|---|---|---|
| `x.seg.tmp` | `x` not named | delete: never decided |
| `x.seg.tmp` | `x` open or closed | rename to `x.seg` |
| `x.seg` | `x` open or closed | use |
| `x.seg` | `x` removed | delete, along with hints and indexes |
| `x.seg` | `x` never named | **anomaly**: leave untouched, record the event |
| none | `x` closed | missing segment: quarantine, Serie `DEGRADED` |
| none | `x` open | `FAULTED` |

Recovery then validates the `ACTIVE` ([ADR-0037](0037-lotto-sigillato.md) §3), prepares the new
`ACTIVE`, and writes a **compacted** control log to `control.log.tmp` — a `completo` EDIT that
closes the old `ACTIVE` at its valid length, with the outcomes, and opens the new one — makes
it durable, and renames it over the original. That rename is the atomicity point of Serie
recovery: before it, nothing has changed; after it, recovery is complete. The same
step compacts the log during operation when it exceeds a threshold; the list of removed
segments not yet deleted is carried into the new file.

<a id="4-che-cosa-non-sta-nel-manifest"></a>

### 4. What is outside the manifest

- **Counters** (records, live and dead bytes): derived, recalculated from hints.
- **Stabilization** (50 s rule): the instant, read from the process's monotonic clock,
  when the segment became `CLOSED`; after a restart, the end of recovery.
- **Hints and indexes**: derived; a worker produces them after closure, with `.tmp` and rename,
  and regenerates them if missing. Until they exist, the newly closed segment's in-memory
  index remains in use, and a restart scans the segment.

<a id="5-catalogo-stessa-legge"></a>

### 5. Catalog: the same law

- **Serie creation.** Prepare the complete `<id>.tmp/` directory (control log with
  the initial EDIT, first segment), durable. The Serie's **document** in the catalog, with
  state `active` and `:strong` durability, is the decision. Then rename to `<id>/`.
- **Deletion.** The document changes to `dropping`: this is the decision, and the Serie stops
  accepting requests. Then, once the epoch is passed, remove the directory and write the
  document's tombstone.

| Directory found | Catalog says | Action |
|---|---|---|
| `<id>.tmp/` | no document | delete: never decided |
| `<id>.tmp/` | `active` | rename |
| `<id>/` | `active` | open |
| `<id>/` | `dropping` | remove, then tombstone |
| `<id>/` | no document | **anomaly**: leave untouched, record the event |
| none | `active` | Serie `FAULTED` |
| none | `dropping` | tombstone |

The `creating` state no longer exists.

Pattern: MANIFEST as a sequence of changes to the file set, with a complete state at the
start (LevelDB/RocksDB `VersionEdit`); temporary file, decision, rename.

<a id="conseguenze"></a>

## Consequences

- One record type instead of seven; no durable state for restart to interpret.
- The swap remains a single record (INV-C7, INV-C8, INV-C9); each row in the tables above is a
  fault injection scenario.
- A final file is never deleted without a record saying so (INV-A10).
- Closing a segment no longer stops the writer to write hints and indexes.

<a id="alternative-considerate"></a>

## Alternatives considered

- *No manifest: the directory is the set* (Bitcask): even leaner, but an externally deleted
  segment would not be detectable (FM-16); the manifest is the list of what **must** exist.
- *Rename before the record (ADR-0018):* leaves unknown final files after a crash and
  forces their deletion because they are absent.
- *Serie creation with state `creating`:* two catalog writes for a single fact.

<a id="valutazione"></a>

## Evaluation

- Verification: FI-06…FI-09, FI-13; model in SPK-07 with a crash in each table row;
  verifier tests on unknown or missing files and directories.
