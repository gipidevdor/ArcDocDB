<a id="matrice-di-tracciabilità"></a>

# Traceability matrix

> **Generated** from [requisiti.lisp](requisiti.lisp) with `make trace-write`. Do not edit by hand: `make trace` fails if it differs.

**Summary.** 141 requirements. By class: C1 112, C2 10, C3 12, C4 7. By state: specified 0, designed 125, implemented 15, verified 1. Invariants covered: 71/71. FI scenarios covered: 13/13.

<a id="requisiti"></a>

## Requirements

| ID | Statement | Source | Class | State | Invariants | ADR | Verification | FI |
|---|---|---|---|---|---|---|---|---|
| REQ-ARC-001 | The logical hierarchy is Server, Archivio, Serie, Documento. | Logical architecture | C2 | designed |  | [0002](../adr/0002-serie-unita-di-storage-e-parallelismo.md) | rev, test |  |
| REQ-ARC-002 | The Serie is the primary unit of storage and parallelism; it owns its logs, segments, and indexes and operates independently of other Serie. | Logical architecture | C1 | designed | INV-W1, INV-P3 | [0002](../adr/0002-serie-unita-di-storage-e-parallelismo.md) | test, bench |  |
| REQ-ARC-003 | A Documento has an _id unique within the Serie and may have historical versions managed by append-only storage and MVCC. | Logical architecture | C1 | designed |  | [0014](../adr/0014-formato-record-documento-id.md) | test, diff |  |
| REQ-ARC-004 | The Archivio is the level of multiseries transactions and snapshots and must contain the Registri Serie. | Logical architecture | C1 | designed |  | [0022](../adr/0022-registri-come-serie-catalogo.md) | test |  |
| REQ-REG-001 | Registri is not the data WAL: it contains the catalog and a single multiserie.log file; there is no per-transaction file. | Special Serie Registri | C1 | designed | INV-W2 | [0006](../adr/0006-transazioni-multiserie-2pc.md), [0022](../adr/0022-registri-come-serie-catalogo.md) | rev, test |  |
| REQ-REG-002 | For each Serie, the catalog stores name, configuration, schema, indexes, segment configuration, state, and recovery metadata, and supports transactional, crash-safe modifications: the Serie document is the atomicity point for creation and deletion; the directory follows. | Catalog | C1 | designed | INV-A7, INV-A11 | [0022](../adr/0022-registri-come-serie-catalogo.md), [0040](../adr/0040-manifest-a-record-unico.md) | test, fi | FI-13 |
| REQ-REG-003 | Each Serie is physically independent in its own directory; there is no global data WAL. | Physical layout | C1 | designed | INV-W1 | [0003](../adr/0003-wal-per-serie.md) | rev, analysis |  |
| REQ-STO-001 | Records already written to segments are never modified in place. | Storage append-only | C1 | designed | INV-S1 | [0004](../adr/0004-storage-append-only-un-solo-active.md) | test, rev |  |
| REQ-STO-002 | There is exactly one ACTIVE segment per Serie, and it is the only writable segment. | Storage append-only | C1 | designed | INV-S2, INV-S3 | [0004](../adr/0004-storage-append-only-un-solo-active.md) | test, model |  |
| REQ-STO-003 | A segment that ceases to be ACTIVE is immutable and is never reopened for writing. | Storage append-only | C1 | designed | INV-S4 | [0004](../adr/0004-storage-append-only-un-solo-active.md), [0076](../adr/0076-rotazione-live-m1.md) | test |  |
| REQ-STO-004 | New writes always go to a new ACTIVE segment, never to a segment produced by compaction. | Segments | C1 | designed | INV-S5 | [0004](../adr/0004-storage-append-only-un-solo-active.md) | test |  |
| REQ-STO-005 | Writer-created segments have a target size of approximately 256 MB, configurable per Serie; segments produced by compaction have no size requirement. | Segments | C1 | designed | INV-C4 | [0004](../adr/0004-storage-append-only-un-solo-active.md), [0023](../adr/0023-politiche-di-compaction.md) | test |  |
| REQ-STO-006 | Segment states are ACTIVE, CLOSED, OBSOLETE, RECLAIMABLE, DELETED with one-way transitions; only ACTIVE is writable; only membership in the manifest's recorded set is durable. | Segments | C1 | designed | INV-S3, INV-S4 | [0018](../adr/0018-control-log-manifest-swap.md), [0040](../adr/0040-manifest-a-record-unico.md) | test, model |  |
| REQ-MET-001 | Segment metadata (identifier, counts, bytes, state, times, epoch) are derived data and can be rebuilt, verified, and corrected from logs, data, and index. | Segment metadata | C1 | designed | INV-S6 | [0018](../adr/0018-control-log-manifest-swap.md), [0040](../adr/0040-manifest-a-record-unico.md) | test, fi | FI-10 |
| REQ-VER-001 | Each version is LIVE, SNAPSHOT-LIVE, or DEAD; a DEAD version is reclaimable only without references from indexes, snapshots, and transactions. | Record versions | C1 | designed | INV-R1, INV-M2 | [0015](../adr/0015-primary-index-swiss-table-swmr.md), [0020](../adr/0020-csn-snapshot-isolamento.md), [0038](../adr/0038-orizzonte-di-visibilita.md) | test, model |  |
| REQ-CLN-001 | CLEAN transforms one source segment into a new immutable segment containing only live or required records. | Clean | C1 | designed | INV-C1 | [0007](../adr/0007-clean-e-merge-distinti.md) | test, diff |  |
| REQ-CLN-002 | CLEAN is copy-on-write: the source segment is never modified, becomes OBSOLETE after the swap, and remains readable as long as needed. | Clean | C1 | designed | INV-C3 | [0007](../adr/0007-clean-e-merge-distinti.md), [0018](../adr/0018-control-log-manifest-swap.md), [0040](../adr/0040-manifest-a-record-unico.md) | test, fi | FI-07 |
| REQ-CLN-003 | The segment produced by CLEAN may be much smaller than the target and may remain small indefinitely. | Segments | C1 | designed | INV-C4 | [0007](../adr/0007-clean-e-merge-distinti.md) | test |  |
| REQ-MRG-001 | MERGE transforms N small segments into a new immutable segment and leaves sources immutable. | Merge | C1 | designed | INV-C2, INV-C3 | [0007](../adr/0007-clean-e-merge-distinti.md) | test, fi | FI-08 |
| REQ-MRG-002 | MERGE is not automatically performed after every CLEAN. | Merge | C3 | designed | INV-C4 | [0008](../adr/0008-merge-opportunistico.md) | test |  |
| REQ-MRG-003 | A segment is a MERGE candidate only if it is CLOSED, immutable, not ACTIVE, stable for at least 50 seconds since closure or stabilization, not required by an active snapshot, in a group exceeding the thresholds, and with the engine under low load. | Mandatory conditions for Merge | C3 | designed | INV-C5, INV-C6 | [0008](../adr/0008-merge-opportunistico.md), [0023](../adr/0023-politiche-di-compaction.md) | test, bench |  |
| REQ-MRG-004 | Load is evaluated before MERGE; under high load no MERGEs start, their concurrency is reduced, and requests and logs take priority; if load rises during MERGE, noncritical work is suspended or slowed. | Low-load merge policy | C3 | designed | INV-C6, INV-P4 | [0008](../adr/0008-merge-opportunistico.md), [0023](../adr/0023-politiche-di-compaction.md) | test, bench |  |
| REQ-CMP-001 | With live equal to zero and no references, the segment is deleted; with partial live content, CLEAN is performed; with live approximately equal to total, no compaction is performed. | General compaction policy | C3 | designed |  | [0023](../adr/0023-politiche-di-compaction.md) | test |  |
| REQ-CMP-002 | The compaction workflow follows the specification's thirteen steps; the new segment is not visible as definitive before its data are durable. | Workflow Clean/Merge | C1 | designed | INV-C7 | [0018](../adr/0018-control-log-manifest-swap.md), [0040](../adr/0040-manifest-a-record-unico.md) | test, model, fi | FI-06 |
| REQ-CMP-003 | A source segment remains recoverable until the swap completes. | Fault injection | C1 | designed | INV-C8 | [0018](../adr/0018-control-log-manifest-swap.md), [0040](../adr/0040-manifest-a-record-unico.md) | model, fi | FI-06, FI-07, FI-08 |
| REQ-CMP-004 | An interrupted compaction is repeatable or completable during recovery. | Fault injection | C1 | designed | INV-C9, INV-A7 | [0018](../adr/0018-control-log-manifest-swap.md), [0040](../adr/0040-manifest-a-record-unico.md) | model, fi | FI-07, FI-08 |
| REQ-CMP-005 | Readers continue reading old segments during compaction; compaction does not globally block reads; after the swap, new readers use the new segment. | Readers during compaction | C1 | designed | INV-C10 | [0016](../adr/0016-epoch-based-reclamation.md) | test, model, bench |  |
| REQ-CMP-006 | Compaction can run in parallel per segment and per Serie, with limits independent of the request scheduler and priorities of user, log, necessary CLEAN, MERGE. | Parallel compaction | C3 | designed | INV-P4 | [0011](../adr/0011-thread-pool-dinamico.md), [0023](../adr/0023-politiche-di-compaction.md) | test, bench |  |
| REQ-CMP-007 | A segment is deleted only when no index, snapshot, active transaction, or reader references or uses it. | Index/Snapshot/Reclaim | C1 | designed | INV-R1 | [0016](../adr/0016-epoch-based-reclamation.md) | model, fi | FI-09, FI-11 |
| REQ-CMP-008 | Compaction discards a tombstone only if it is superseded by a newer durable version, or if no version of the key is retained and no other segment can contain an older record for that key (existence filter and segment minimum CSN). | ADR-0042 | C1 | designed | INV-D1, INV-C11 | [0042](../adr/0042-tombstone-e-indice-dei-vivi.md) | test, prop, model |  |
| REQ-CMP-009 | Compaction copies only required records (referenced by the index, referenced by retained versions, nondiscardable tombstones), rewrites committed prepared records as ordinary records with their CSN, and never copies SEAL or OUTCOME. | ADR-0042 | C1 | designed | INV-C1, INV-S7 | [0041](../adr/0041-multiserie-segmenti-autosufficienti.md), [0042](../adr/0042-tombstone-e-indice-dei-vivi.md) | test, diff, model |  |
| REQ-WAL-001 | Each Serie has an independent data log (ACTIVE segment) and a structural control log; there is no global data WAL. | WAL | C1 | designed | INV-W1, INV-F1 | [0003](../adr/0003-wal-per-serie.md), [0013](../adr/0013-log-structured-segmento-active-come-log.md) | test, rev |  |
| REQ-WAL-002 | The system uses group commit; it does not flush every operation unless strong durability is requested; each log has only one I/O task at a time, which writes closed batches and flushes. | WAL | C1 | designed |  | [0019](../adr/0019-durability-e-group-commit-pipelined.md), [0037](../adr/0037-lotto-sigillato.md) | test, bench |  |
| REQ-WAL-003 | Durability levels are async, group, and strong and change only publication and acknowledgment timing; for group and strong, acknowledged data are not lost and are not visible before being durable. | WAL | C1 | designed | INV-D1, INV-V1 | [0019](../adr/0019-durability-e-group-commit-pipelined.md), [0037](../adr/0037-lotto-sigillato.md) | test, fi | FI-01, FI-02, FI-05 |
| REQ-WAL-004 | multiserie.log uses group commit. | WAL | C1 | designed | INV-W2 | [0021](../adr/0021-2pc-intenti-outcome.md), [0041](../adr/0041-multiserie-segmenti-autosufficienti.md) | test, bench |  |
| REQ-WAL-005 | Each log is a sequence of sealed batches: a batch is valid in full (SEAL fixes its file, position, record count, and contents) or does not exist; a non-prepared record is committed if and only if it is in a valid batch; the batch CSN is taken at closure. | ADR-0037 | C1 | designed | INV-F2, INV-M5 | [0037](../adr/0037-lotto-sigillato.md), [0039](../adr/0039-cornice-unica-dei-record.md) | test, fuzz, corr, fi, model | FI-01, FI-02 |
| REQ-WAL-006 | A write is acknowledged to the client only after publication in the index and, for group and strong, only after the flush covering its batch; publication follows batch order. | ADR-0037 | C1 | designed | INV-V5, INV-V1 | [0037](../adr/0037-lotto-sigillato.md) | test, diff, fi | FI-01, FI-02 |
| REQ-TXS-001 | A single-Serie transaction uses only the Serie log and does not write to multiserie.log. | Single-Serie transactions | C1 | designed | INV-T1 | [0005](../adr/0005-writer-logico-per-serie.md) | test |  |
| REQ-TXS-002 | A single-Serie transaction is serialized by the logical writer and detects conflicts with optimistic version checking; version checking is atomic with respect to application. | Single-Serie transactions | C1 | designed | INV-T2, INV-P1 | [0005](../adr/0005-writer-logico-per-serie.md) | test, diff, model |  |
| REQ-TXS-003 | When two transactions read the same version, the second to commit fails with a conflict and may retry. | Single-Serie transactions | C1 | designed | INV-T2 | [0005](../adr/0005-writer-logico-per-serie.md) | test, diff |  |
| REQ-TXM-001 | All changes in a multiseries transaction share a single TXID. | Multiseries transactions | C1 | designed | INV-T5 | [0006](../adr/0006-transazioni-multiserie-2pc.md), [0041](../adr/0041-multiserie-segmenti-autosufficienti.md) | test, fi | FI-12 |
| REQ-TXM-002 | A multiseries transaction follows a 2PC protocol: BEGIN, PREPARE on participants, flush, durable decision, COMMIT or ABORT, application. | Multiseries transactions | C1 | designed |  | [0006](../adr/0006-transazioni-multiserie-2pc.md), [0021](../adr/0021-2pc-intenti-outcome.md), [0041](../adr/0041-multiserie-segmenti-autosufficienti.md) | test, model, fi | FI-03 |
| REQ-TXM-003 | The COMMIT decision is durable in multiserie.log before the transaction is considered committed. | Multiseries transactions | C1 | designed | INV-T3 | [0021](../adr/0021-2pc-intenti-outcome.md), [0041](../adr/0041-multiserie-segmenti-autosufficienti.md) | model, fi | FI-04, FI-05 |
| REQ-TXM-004 | No multiseries transaction is partially committed, even after a crash, and a snapshot sees all or none of it. | Fault injection | C1 | designed | INV-T4, INV-V2 | [0020](../adr/0020-csn-snapshot-isolamento.md), [0021](../adr/0021-2pc-intenti-outcome.md), [0038](../adr/0038-orizzonte-di-visibilita.md), [0041](../adr/0041-multiserie-segmenti-autosufficienti.md) | model, fi | FI-03, FI-04, FI-05, FI-12 |
| REQ-TXM-005 | After a crash, the Recovery Manager reads multiserie.log, identifies prepared or incomplete transactions, determines the decision (presumed abort: without DECISION the transaction is aborted), and makes each participant's COMMIT outcome durable in the record closing its segment. | Multiseries transactions | C1 | designed | INV-T4, INV-A7 | [0021](../adr/0021-2pc-intenti-outcome.md), [0041](../adr/0041-multiserie-segmenti-autosufficienti.md) | model, fi | FI-03, FI-04, FI-05 |
| REQ-TXM-006 | A Serie writer does not stop to wait for a multiseries decision; documents with a pending intent return conflict without waiting. | ADR-0021 | C1 | designed | INV-P3 | [0021](../adr/0021-2pc-intenti-outcome.md) | test, model, bench |  |
| REQ-TXM-007 | A CLOSED segment is self-contained: rotation waits until the Serie has no pending intents; a prepared record is committed if and only if its OUTCOME is in the same segment or its outcome is in the manifest record that closed the segment. | ADR-0041 | C1 | designed | INV-S7 | [0041](../adr/0041-multiserie-segmenti-autosufficienti.md), [0040](../adr/0040-manifest-a-record-unico.md) | test, model, fi | FI-03, FI-05, FI-12 |
| REQ-TXM-008 | A multiseries transaction is acknowledged to the client after the decision is durable and the outcome has been applied in memory on all healthy participants; an abort writes no record. | ADR-0041 | C1 | designed | INV-V5, INV-T3 | [0041](../adr/0041-multiserie-segmenti-autosufficienti.md) | test, model, fi | FI-05, FI-12 |
| REQ-IDX-001 | The primary index maps _id to location (segment-id, offset, length, version; the version is the CSN) with average O(1) lookup in compact structures without one Lisp object per entry. | Index | C1 | designed |  | [0015](../adr/0015-primary-index-swiss-table-swmr.md), [0024](../adr/0024-memoria-e-gc.md), [0043](../adr/0043-primary-index-a-frammenti.md) | test, bench |  |
| REQ-IDX-002 | Indexes are immutable for readers; new versions become visible through atomic swap and previous readers finish on the old version. | Index snapshot | C1 | designed | INV-I1 | [0009](../adr/0009-indici-immutabili-atomic-swap.md) | test, model, fi | FI-06 |
| REQ-IDX-003 | Reading a primary-index entry never observes an intermediate state, with bounded attempts and fallback to the writer. | ADR-0032 | C1 | designed | INV-I1, INV-A8 | [0015](../adr/0015-primary-index-swiss-table-swmr.md), [0032](../adr/0032-seqlock-a-64-bit.md), [0043](../adr/0043-primary-index-a-frammenti.md) | test, model, soak |  |
| REQ-IDX-004 | Compaction relocation updates an entry only if it still points to the source location and never overwrites a newer version. | ADR-0015 | C1 | designed | INV-V3 | [0015](../adr/0015-primary-index-swiss-table-swmr.md) | test, model, fi | FI-06 |
| REQ-IDX-005 | The primary index is a directory of fixed-capacity fragments: no maintenance copies more than one fragment, deleted slot and key space is reclaimed on split, and the same table implements the index, retained versions, and pending versions. | ADR-0043 | C1 | designed | INV-I3, INV-A8 | [0043](../adr/0043-primary-index-a-frammenti.md) | test, model, bench |  |
| REQ-IDX-006 | The primary index contains only live documents; rebuilding selects the committed record with the maximum CSN for each key and gives the same result for any segment read order. | ADR-0042 | C1 | designed | INV-C11, INV-S6 | [0042](../adr/0042-tombstone-e-indice-dei-vivi.md), [0039](../adr/0039-cornice-unica-dei-record.md) | test, prop, fi | FI-10 |
| REQ-SEC-001 | Secondary indexes use structures suited to query type (strings and prefixes, ranges, categories, bitmaps); the value Bloom filter, a section of the index file, says only absent or possibly present. | Secondary index | C2 | designed | INV-I2 | [0026](../adr/0026-indici-secondari-segmentati.md), [0039](../adr/0039-cornice-unica-dei-record.md) | test, diff |  |
| REQ-SEC-002 | Secondary indexes follow the base-plus-immutable-deltas model and the new base is built without blocking readers. | Secondary index delta | C2 | designed |  | [0026](../adr/0026-indici-secondari-segmentati.md) | test, diff |  |
| REQ-SEC-003 | The Serie declares dedicated full-text indexes: dictionary by field and term, postings by row and frequency, positions for phrases; a deterministic, versioned analyzer shared by documents and queries, combined with structured filters. | ADR-0053 | C2 | designed | INV-I4 | [0053](../adr/0053-ricerca-full-text-indici-invertiti.md), [0026](../adr/0026-indici-secondari-segmentati.md), [0029](../adr/0029-interfacce-protocollo-query-contratto.md) | test, diff, bench |  |
| REQ-SEC-004 | The full-text delta is published with documents before acknowledgment and visibility advancement; every result and filter uses the same committed version visible in the snapshot, including after updates, deletes, aborts, and compaction. | ADR-0053 | C1 | designed | INV-I4, INV-M1, INV-V5 | [0053](../adr/0053-ricerca-full-text-indici-invertiti.md), [0038](../adr/0038-orizzonte-di-visibilita.md), [0041](../adr/0041-multiserie-segmenti-autosufficienti.md) | test, diff, model, fi | FI-05, FI-06, FI-11 |
| REQ-SEC-005 | Full-text indexes are rebuildable derivatives: identity, CRC, profile, and coverage are verified; build and analyzer changes publish a complete generation without mixing; loss, corruption, or incomplete rebuild are explicitly reported, including after recovery and restore. | ADR-0053 | C1 | designed | INV-I4, INV-A10, INV-A11 | [0053](../adr/0053-ricerca-full-text-indici-invertiti.md), [0026](../adr/0026-indici-secondari-segmentati.md), [0040](../adr/0040-manifest-a-record-unico.md) | test, diff, corr, fi | FI-09, FI-10, FI-13 |
| REQ-SEC-006 | Full-text analysis, delta, and queries have finite budgets; an over-limit write is rejected before the durable decision, an over-budget query ends with an explicit error without presenting partial results as complete; no global per-document coordination. | ADR-0053 | C1 | designed | INV-A8, INV-P6 | [0053](../adr/0053-ricerca-full-text-indici-invertiti.md), [0036](../adr/0036-leggi-di-progetto.md), [0045](../adr/0045-modello-di-esecuzione.md) | test, soak, bench, rev |  |
| REQ-SEC-007 | The unicode-word-18.0.0-v1 profile fixes Unicode 18.0.0, NFC, C/F case folding, and word breaks; explicit AST leaves, phrases with repetitions, stable ordering, and terminal state have semantics reproducible with official corpora and manual expected results. | ADR-0054 | C2 | designed | INV-I4 | [0053](../adr/0053-ricerca-full-text-indici-invertiti.md), [0054](../adr/0054-contratto-e-formato-full-text.md) | test, diff, rev |  |
| REQ-SEC-008 | The full-text .idx v2 type-5 file verifies header, six sections, fixed-width arrays, CRC, ordering, and bounds; identity and configuration match the catalog, segment, and exact hint bytes, without reusing ordinals from another hint. | ADR-0054 | C1 | designed | INV-I5, INV-A2 | [0054](../adr/0054-contratto-e-formato-full-text.md) | test, fuzz, corr, mut, rev |  |
| REQ-SEC-009 | A full-text generation captures new commits without gaps relative to the initial prefix and becomes READY only after rechecking inventory and frontiers; separate files per generation, retirement decided by the catalog, and reclaim after quiescence. | ADR-0054 | C1 | designed | INV-I4, INV-I6, INV-A10, INV-A11 | [0054](../adr/0054-contratto-e-formato-full-text.md), [0040](../adr/0040-manifest-a-record-unico.md) | test, diff, model, fi | FI-06, FI-09, FI-10, FI-11, FI-13 |
| REQ-SEC-010 | Before SEAL/PREPARE, the writer reserves delta, staging, and a conservative upper bound for the full-text file; rotation prevents over-budget indexes; queries and builds account for resources, work, deadlines, and attempts with a single cleanup and terminal completion. | ADR-0054 | C1 | designed | INV-I6, INV-A8, INV-P6 | [0054](../adr/0054-contratto-e-formato-full-text.md), [0041](../adr/0041-multiserie-segmenti-autosufficienti.md), [0045](../adr/0045-modello-di-esecuzione.md) | test, model, soak, bench, rev |  |
| REQ-IDX-007 | The reader rechecks root and generation after probing, including on a miss, with bounded attempts; maintenance declares and checks slots, key bytes, directory references, and transient memory separately. | ADR-0050 | C1 | designed | INV-I3, INV-A8 | [0043](../adr/0043-primary-index-a-frammenti.md), [0050](../adr/0050-pubblicazione-e-costi-della-directory.md) | test, model, bench, rev |  |
| REQ-IDX-008 | In the serial M1 profile, index mode is selected automatically per Serie at startup and during operation: resident when it fits, paged beyond the quota, with hysteresis on return. Switching requires a reserved memory peak including the retained source and consistent publication, without admitting over-budget work or changing the commit protocol. | ADR-0057 | C1 | implemented | INV-I7, INV-A8, INV-P6 | [0073](../adr/0073-indice-automatico-operativo-m1.md), [0057](../adr/0057-selezione-automatica-indice.md), [0049](../adr/0049-capacita-oltre-la-ram.md), [0050](../adr/0050-pubblicazione-e-costi-della-directory.md) | test, model, bench, fi, rev | FI-06, FI-10, FI-11 |
| REQ-IDX-009 | Derived primary-index pages have Serie/image/offset/generation identity, version, and CRC32C; flat buckets, radix directory, and key fragments are verified before use. Backward references, canonical packing, geometry, and v2 bounds prevent structural aliases and false local misses; the codec introduces no independent commit. | ADR-0058 | C1 | designed | INV-I8, INV-A2, INV-A8, INV-P6 | [0068](../adr/0068-rinnovo-seriale-immagini-m1.md), [0058](../adr/0058-pagine-indice-primario.md), [0065](../adr/0065-costruzione-immagini-dal-motore.md), [0057](../adr/0057-selezione-automatica-indice.md), [0043](../adr/0043-primary-index-a-frammenti.md) | test, diff, corr, rev |  |
| REQ-IDX-010 | A paged root is adopted only from a complete image verified read-only against canonical source, seed, count, and authoritative candidates; derivative completion is distinct from data commit, with cumulative budgets and rejection of duplicates/unreachable entries. | ADR-0063 | C1 | designed | INV-I8, INV-A2, INV-A8, INV-P6 | [0063](../adr/0063-immagini-sigillate-indice-primario.md), [0064](../adr/0064-adozione-indice-paginato-m1.md), [0065](../adr/0065-costruzione-immagini-dal-motore.md), [0066](../adr/0066-attivazione-seriale-immagini-m1.md), [0067](../adr/0067-delta-seriale-indice-m1.md), [0068](../adr/0068-rinnovo-seriale-immagini-m1.md), [0069](../adr/0069-manutenzione-a-soglie-delta-m1.md), [0070](../adr/0070-scoperta-readonly-immagini-m1.md), [0058](../adr/0058-pagine-indice-primario.md), [0057](../adr/0057-selezione-automatica-indice.md) | test, diff, corr, fi, rev | FI-06, FI-10 |
| REQ-IDX-011 | The serial M1 paged delta stores exact private keys and committed normalized locations or explicit tombstones; touched-key lookup uses neither the resident index nor the base image. Publication follows durable SEAL under BUSY, incomplete operations fault, and activation/renewal reserve all old and new delta arrays before effects. | ADR-0071 | C1 | implemented | INV-I1, INV-I8, INV-V5, INV-A8, INV-P6 | [0071](../adr/0071-delta-location-indice-m1.md), [0067](../adr/0067-delta-seriale-indice-m1.md), [0068](../adr/0068-rinnovo-seriale-immagini-m1.md), [0069](../adr/0069-manutenzione-a-soglie-delta-m1.md) | test, diff, corr, fi, rev | FI-01, FI-02 |
| REQ-IDX-012 | An optionally configured M1 engine renews its paged image automatically before PUT/DELETE at the delta threshold or next-key capacity limit. The full renewal reservation and finite fresh-name sequence are checked before admission; one BUSY scope covers renewal and document commit, with no CSN/ACK for the derivative and FAULTED on incomplete admitted exits. | ADR-0072 | C1 | implemented | INV-I1, INV-I8, INV-A8, INV-P6 | [0072](../adr/0072-rinnovo-automatico-delta-m1.md), [0068](../adr/0068-rinnovo-seriale-immagini-m1.md), [0069](../adr/0069-manutenzione-a-soglie-delta-m1.md), [0071](../adr/0071-delta-location-indice-m1.md) | test, diff, fi, rev | FI-01, FI-02 |
| REQ-IDX-013 | The automatic M1 primary backend has bounded resident growth, verified migration both ways with hysteresis, independent paged writes, bounded-memory WAL replay and bounded CLOSED resolver caching. Immutable checksummed disk nodes use fixed cache/path/batch storage; canonical WAL remains the only data commit and private derivative removal requires bound ownership proof. | ADR-0073 | C1 | implemented | INV-I1, INV-I7, INV-I8, INV-A2, INV-A8, INV-A10, INV-P6 | [0073](../adr/0073-indice-automatico-operativo-m1.md), [0057](../adr/0057-selezione-automatica-indice.md), [0058](../adr/0058-pagine-indice-primario.md) | test, diff, corr, fi, bench, rev | FI-01, FI-02, FI-06, FI-10 |
| REQ-CCH-001 | The cache uses CLOCK, may be partitioned by Serie, and measures scan pollution to decide whether to evolve to 2Q. | Cache | C3 | designed |  | [0010](../adr/0010-cache-clock.md), [0025](../adr/0025-cache-per-location.md) | test, bench |  |
| REQ-CCH-002 | The cache is version-aware: a reader never obtains a version incompatible with its snapshot. | Cache and snapshots | C1 | designed | INV-M3 | [0025](../adr/0025-cache-per-location.md), [0044](../adr/0044-cache-acceleratore-puro.md) | test, prop |  |
| REQ-CCH-003 | The read path is request, Serie, snapshot and index, cache, segment. | Cache | C2 | designed |  | [0025](../adr/0025-cache-per-location.md) | test |  |
| REQ-CCH-004 | The cache is a pure accelerator: no invalidation, relabeling, or clearing; the system gives the same answers with the cache disabled; a failed check on cached data discards it and rereads from the segment without quarantine. | ADR-0044 | C1 | designed | INV-A12, INV-M3 | [0044](../adr/0044-cache-acceleratore-puro.md) | test, diff, corr |  |
| REQ-CON-001 | There is one logical writer per Serie and many concurrent readers. | Concurrency | C1 | designed | INV-P1 | [0005](../adr/0005-writer-logico-per-serie.md) | test, model |  |
| REQ-CON-002 | There is no global writer lock, permanent thread per Serie, or thread per request; every change to a Serie's state goes through its writer. | Concurrency | C1 | designed | INV-P2, INV-V4 | [0005](../adr/0005-writer-logico-per-serie.md) | rev, analysis, test |  |
| REQ-CON-003 | Independent Serie write in parallel; a burst on one Serie does not prevent writes, queries, or compaction on the others. | Parallelism | C3 | designed | INV-P3 | [0002](../adr/0002-serie-unita-di-storage-e-parallelismo.md) | bench, test |  |
| REQ-THR-001 | A dynamic pool of reused workers adjusts worker count with EWMA, AIMD, and hysteresis, without continuously creating and destroying threads. | Dynamic thread pool | C3 | designed |  | [0011](../adr/0011-thread-pool-dinamico.md), [0017](../adr/0017-piattaforma-e-io.md) | test, bench |  |
| REQ-CON-005 | Parallelism is a foundational principle: between Serie there are no locks or shared writes per operation; what Serie share is a closed list with bounded cost, paid at most per batch, multiseries transaction, or snapshot; each mechanism declares what it serializes; reads, compaction, recovery, index rebuild, and queries proceed in parallel over their respective units. | Parallelism | C1 | designed | INV-P6, INV-P3 | [0036](../adr/0036-leggi-di-progetto.md), [0002](../adr/0002-serie-unita-di-storage-e-parallelismo.md), [0045](../adr/0045-modello-di-esecuzione.md) | rev, analysis, bench, test |  |
| REQ-CON-004 | Every unit of work is a run-to-completion task; a compute worker makes no blocking calls; every wait is parking on a list with maximum length and duration; a cache-miss read migrates to the I/O pool and restarts from the beginning. | ADR-0045 | C1 | designed | INV-P5, INV-A8 | [0045](../adr/0045-modello-di-esecuzione.md) | test, rev, bench |  |
| REQ-MVC-001 | A snapshot is a consistent logical view; a simple GET reads the current committed version. | Snapshot / MVCC | C1 | designed | INV-M1 | [0020](../adr/0020-csn-snapshot-isolamento.md) | test, prop, diff | FI-11 |
| REQ-MVC-002 | A local transaction may use a Serie snapshot; a multiseries transaction may use an Archivio-wide consistent snapshot. | Snapshot / MVCC | C1 | designed | INV-V2 | [0020](../adr/0020-csn-snapshot-isolamento.md), [0038](../adr/0038-orizzonte-di-visibilita.md) | test, model | FI-12 |
| REQ-MVC-003 | A snapshot prevents compaction from deleting versions it needs. | Snapshot / MVCC | C1 | designed | INV-M2 | [0020](../adr/0020-csn-snapshot-isolamento.md) | test, fi | FI-11 |
| REQ-MVC-004 | A snapshot beyond its maximum duration is terminated and operations using it receive snapshot-too-old. | ADR-0020 | C1 | designed | INV-A8 | [0020](../adr/0020-csn-snapshot-isolamento.md) | test |  |
| REQ-MVC-005 | A snapshot with CSN s performs its first read only when the visibility horizon is at least s; two reads of the same document in the same snapshot give the same result; a snapshot created after commit acknowledgment sees that commit. | ADR-0038 | C1 | designed | INV-M4, INV-M1 | [0038](../adr/0038-orizzonte-di-visibilita.md) | test, prop, model, fi | FI-11, FI-12 |
| REQ-MVC-006 | A document's version is the CSN of the commit that produced it: expected-version is a CSN, is never reused, and does not restart after deletion; for each document, CSN order is version order. | ADR-0038 | C1 | designed | INV-M5, INV-T2 | [0038](../adr/0038-orizzonte-di-visibilita.md) | test, diff, model |  |
| REQ-MVC-007 | The writer retains a replaced version when the snapshot registry threshold is below the new CSN; snapshot registration publishes the threshold before reading its own CSN, with a full memory barrier. | ADR-0038 | C1 | designed | INV-M2 | [0038](../adr/0038-orizzonte-di-visibilita.md) | test, model, soak |  |
| REQ-MVC-008 | The in-flight CSN registry has fixed capacity; CSN assignment and registration are indivisible with respect to horizon advancement; a slot is not reused until its CSN is published or canceled; when none are pending, H reaches the latest CSN, even if many completed commits overtook a slow commit. | ADR-0046 | C1 | designed | INV-M4, INV-M6, INV-A8 | [0046](../adr/0046-orizzonte-con-registro-limitato.md) | test, model, bench |  |
| REQ-REC-001 | The Recovery Manager verifies logs, segment metadata, index metadata, atomic swap, segment state, transaction state, and multiserie.log. | Recovery | C1 | designed | INV-F1 | [0018](../adr/0018-control-log-manifest-swap.md), [0033](../adr/0033-fail-stop-e-integrita-end-to-end.md), [0037](../adr/0037-lotto-sigillato.md) | test, fi | FI-01, FI-06 |
| REQ-REC-002 | After a crash, the system recovers Serie logs, rebuilds or verifies indexes, identifies segments, completes or rolls back incomplete compactions, processes multiserie.log, and completes prepared multiseries transactions. | Recovery | C1 | designed | INV-A7 | [0018](../adr/0018-control-log-manifest-swap.md), [0021](../adr/0021-2pc-intenti-outcome.md), [0040](../adr/0040-manifest-a-record-unico.md), [0041](../adr/0041-multiserie-segmenti-autosufficienti.md) | test, fi, soak | FI-07, FI-08, FI-10 |
| REQ-REC-003 | No committed data are lost. | Fault injection | C1 | designed | INV-D1 | [0013](../adr/0013-log-structured-segmento-active-come-log.md), [0019](../adr/0019-durability-e-group-commit-pipelined.md), [0037](../adr/0037-lotto-sigillato.md) | fi, diff, soak | FI-01, FI-02, FI-05, FI-06, FI-09, FI-10 |
| REQ-REC-004 | An incomplete atomic swap is recognizable during recovery. | Recovery | C1 | designed | INV-C7 | [0018](../adr/0018-control-log-manifest-swap.md), [0040](../adr/0040-manifest-a-record-unico.md) | model, fi | FI-06 |
| REQ-IPC-001 | The default client interface uses a Unix stream socket with a configurable absolute path per instance; TCP is optional, later, and disabled by default, with no automatic fallback on local errors. Initial M16 integration follows startup, recovery, and admission and precedes query/TCP completion. | ADR-0055 | C2 | designed | INV-N1 | [0055](../adr/0055-interfaccia-locale-unix-socket.md) | test, rev |  |
| REQ-IPC-002 | Local transport uses u32-plus-CBOR frames, versioning, and multiplexed identifiers; it handles partial transfers and checks limits before allocation and admission. Connections, requests, buffers, and waits are bounded; slow clients neither retain EBR epochs nor block writers or compute workers. | ADR-0055 | C1 | designed | INV-A8, INV-P5, INV-P6 | [0029](../adr/0029-interfacce-protocollo-query-contratto.md), [0045](../adr/0045-modello-di-esecuzione.md), [0048](../adr/0048-limiti-documentali-e-formato-v2.md), [0055](../adr/0055-interfaccia-locale-unix-socket.md) | test, fuzz, model, bench, rev |  |
| REQ-IPC-003 | The local listener verifies path, runtime directory, owner, and restricted access before exposure; an occupied name fails without automatic removal at startup. Shutdown removes only the node still identified as its own in a protected directory; orphans require explicit intervention. | ADR-0055 | C2 | designed |  | [0055](../adr/0055-interfaccia-locale-unix-socket.md) | test, rev |  |
| REQ-IPC-004 | Acknowledgment on the local socket follows engine publication and durability; application traffic is admitted after recovery. Disconnection neither cancels decided commits nor repeats writes: a lost response means a potentially unknown outcome for the client, without implicit request-ID deduplication. | ADR-0055 | C1 | designed | INV-D1, INV-V1, INV-V5, INV-A11 | [0037](../adr/0037-lotto-sigillato.md), [0041](../adr/0041-multiserie-segmenti-autosufficienti.md), [0055](../adr/0055-interfaccia-locale-unix-socket.md) | test, diff, model, fi, rev | FI-01, FI-02, FI-05 |
| REQ-OBS-001 | Request metrics are exposed: throughput, P50, P95, P99, P99.9. | Observability | C3 | designed |  | [0011](../adr/0011-thread-pool-dinamico.md) | test |  |
| REQ-OBS-002 | The storage, log, index, cache, scheduler, and GC metrics listed in the specification are exposed. | Observability | C3 | designed |  | [0011](../adr/0011-thread-pool-dinamico.md) | test |  |
| REQ-BEN-001 | Benchmarks are reproducible and, when comparing other systems, run with equivalent hardware, datasets, indexes, durability, concurrency, and semantics. | Benchmark | C4 | designed | INV-X2 | [0028](../adr/0028-target-e-obiettivi-di-latenza.md) | bench, rev |  |
| REQ-BEN-002 | Performance targets are hypotheses until verified; no superiority is claimed from heterogeneous benchmarks. | Preliminary targets | C4 | designed | INV-X2 | [0028](../adr/0028-target-e-obiettivi-di-latenza.md) | rev |  |
| REQ-FLT-001 | Fault-injection tests are implemented for the specification's twelve scenarios and for Serie creation. | Fault injection | C1 | designed |  | [0035](../adr/0035-strategia-di-verifica-e-tracciabilita.md) | fi | FI-01, FI-02, FI-03, FI-04, FI-05, FI-06, FI-07, FI-08, FI-09, FI-10, FI-11, FI-12, FI-13 |
| REQ-SIM-001 | The system uses compact structures and typed arrays; every measured hot path evaluates all SIMD variants safely usable on Linux x86-64 and macOS ARM64. Selection verifies CPU, operating system, and runtime; the scalar reference remains executable and forceable. Checks, valid windows, and error semantics remain unchanged; differential oracles and common benchmarks, run separately on each platform, demonstrate the adopted variant's correctness and usefulness; unsupported does not mean verification passed. | SIMD and native optimizations | C3 | designed | INV-X1 | [0012](../adr/0012-simd-guidato-dai-benchmark.md), [0017](../adr/0017-piattaforma-e-io.md), [0024](../adr/0024-memoria-e-gc.md), [0034](../adr/0034-policy-di-compilazione-e-standard-di-codifica.md) | test, rev, bench |  |
| REQ-SIM-002 | Project code is Common Lisp only. | ADR-0001 | C4 | designed | INV-X3 | [0001](../adr/0001-common-lisp-sbcl.md), [0027](../adr/0027-dipendenze-e-test.md) | analysis, rev |  |
| REQ-MOD-001 | The system is organized into at least the specification's eighteen modules. | Software modules | C2 | designed |  | [0031](../adr/0031-software-critico-criteri-e-priorita.md) | rev |  |
| REQ-VAL-001 | The Phase-0 suite compiles experiments without warnings in isolated processes, runs deterministic checks and separate benchmarks, and records every test and benchmark in structured form: parameters, commands, environment, revision, source hashes, results, limits, raw output, and failures. No spike outcome automatically promotes an engine requirement to verified. | Spike plan | C4 | implemented | INV-X2, INV-X3 | [0035](../adr/0035-strategia-di-verifica-e-tracciabilita.md) | test, analysis |  |
| REQ-FOR-001 | Every record and persistent file carries a length and CRC32C; what fails verification is treated as nonexistent (tail), regenerated (derived data), or declared corrupt (acknowledged data). | ADR-0013 | C1 | designed | INV-F1 | [0013](../adr/0013-log-structured-segmento-active-come-log.md), [0014](../adr/0014-formato-record-documento-id.md), [0039](../adr/0039-cornice-unica-dei-record.md), [0052](../adr/0052-header-dei-log-di-controllo.md) | test, fuzz, corr, fi | FI-01, FI-10 |
| REQ-FOR-002 | Every persistent file has a magic value and format version; a format does not change, a new version with migration is created. | ADR-0014 | C1 | designed | INV-F1 | [0014](../adr/0014-formato-record-documento-id.md), [0052](../adr/0052-header-dei-log-di-controllo.md) | test, rev |  |
| REQ-FOR-003 | All records in all logs share the same 24-byte frame with header CRC and body CRC; the header is verified before lengths are used; body CRC is computed outside the writer. | ADR-0039 | C1 | designed | INV-F1, INV-F2 | [0074](../adr/0074-crc32c-sbcl-2.6.10.md), [0039](../adr/0039-cornice-unica-dei-record.md), [0059](../adr/0059-crc32c-arm64-sbcl.md), [0060](../adr/0060-crc32c-caricamento-portabile.md) | test, fuzz, corr, bench, diff |  |
| REQ-FOR-004 | Reading a prepared record verifies authoritative segment proof (OUTCOME or manifest outcome): the proof TXID matches the record stamp and its CSN matches the entry's; missing, corrupt, or wrong-version proof produces an integrity error. | ADR-0047 | C1 | designed | INV-A2, INV-S7 | [0039](../adr/0039-cornice-unica-dei-record.md), [0047](../adr/0047-verifica-csn-dei-record-prepared.md) | test, corr, fuzz, diff |  |
| REQ-CBR-009 | Reading the first minimal CBOR MT2/3 string returns type and absolute payload range without copies; it checks the entire window's budget and UTF-8 for MT3, ignores the tail, and preserves the buffer for shared read-only use. | ADR-0014 | C1 | implemented | INV-A5, INV-A8, INV-P6 | [0014](../adr/0014-formato-record-documento-id.md), [0024](../adr/0024-memoria-e-gc.md), [0035](../adr/0035-strategia-di-verifica-e-tracciabilita.md), [0048](../adr/0048-limiti-documentali-e-formato-v2.md) | test, diff, fuzz, bench, mut, rev |  |
| REQ-CBR-008 | Reading the first minimal structural CBOR item returns nodes, array/map depth, and absolute frontier without interpreting the tail; it first checks the entire window's limits, uses private scratch, and preserves the buffer for shared reads. Exact scanners remain separate; application semantics and the document profile remain open. | ADR-0014 | C1 | implemented | INV-A5, INV-A8, INV-P6 | [0014](../adr/0014-formato-record-documento-id.md), [0024](../adr/0024-memoria-e-gc.md), [0035](../adr/0035-strategia-di-verifica-e-tracciabilita.md), [0048](../adr/0048-limiti-documentali-e-formato-v2.md) | test, diff, fuzz, bench, mut, rev |  |
| REQ-CBR-007 | CBOR tag composition verifies a single minimal structural content before writing the MT6 header and exact payload; budgets include the tag node without adding array/map depth, destination and scratch are private, and source is stable. Tag semantics and the document profile remain at the higher level. | ADR-0014 | C1 | implemented | INV-A5, INV-A8, INV-P6 | [0014](../adr/0014-formato-record-documento-id.md), [0024](../adr/0024-memoria-e-gc.md), [0035](../adr/0035-strategia-di-verifica-e-tracciabilita.md), [0048](../adr/0048-limiti-documentali-e-formato-v2.md) | test, diff, fuzz, bench, mut, rev |  |
| REQ-CBR-006 | CBOR map composition verifies already encoded minimal structural keys and values before writing the MT5 header for the pair count and exact payload; budgets include the root, source and table are stable, and scratch is private. Key ordering and uniqueness remain the document profile's responsibility. | ADR-0014 | C1 | implemented | INV-F1, INV-P6, INV-A8 | [0014](../adr/0014-formato-record-documento-id.md), [0033](../adr/0033-fail-stop-e-integrita-end-to-end.md), [0035](../adr/0035-strategia-di-verifica-e-tracciabilita.md), [0048](../adr/0048-limiti-documentali-e-formato-v2.md) | test, diff, fuzz, bench, mut, rev |  |
| REQ-CBR-005 | CBOR array composition verifies all already encoded minimal items before writing the MT4 header and exact payload into the exclusive destination; byte, node, and depth budgets include the root, scratch is private, and source and table remain stable. | ADR-0014 | C1 | implemented | INV-F1, INV-P6, INV-A8 | [0014](../adr/0014-formato-record-documento-id.md), [0033](../adr/0033-fail-stop-e-integrita-end-to-end.md), [0035](../adr/0035-strategia-di-verifica-e-tracciabilita.md), [0048](../adr/0048-limiti-documentali-e-formato-v2.md) | test, diff, fuzz, bench, mut, rev |  |
| REQ-CBR-004 | CBOR float writing selects the smallest exact raw IEEE width, preserving sign, zero, infinity, and NaN significand; it checks range, words, and capacity before mutating the exclusive destination, with work bounded to nine bytes and a single NEXT. | ADR-0014 | C1 | implemented | INV-F1, INV-P6 | [0014](../adr/0014-formato-record-documento-id.md), [0033](../adr/0033-fail-stop-e-integrita-end-to-end.md), [0035](../adr/0035-strategia-di-verifica-e-tracciabilita.md), [0048](../adr/0048-limiti-documentali-e-formato-v2.md) | test, diff, fuzz, bench, mut, rev |  |
| REQ-CBR-003 | CBOR MT7 simple-value writing emits wire code 0..23 or 32..255 in minimal representation into an exclusive destination; it checks range, reserved codes, and capacity before mutation, with work bounded to two bytes and a single NEXT. | ADR-0014 | C1 | implemented | INV-F1, INV-P6 | [0014](../adr/0014-formato-record-documento-id.md), [0033](../adr/0033-fail-stop-e-integrita-end-to-end.md), [0035](../adr/0035-strategia-di-verifica-e-tracciabilita.md), [0048](../adr/0048-limiti-documentali-e-formato-v2.md) | test, diff, fuzz, bench, mut, rev |  |
| REQ-CBR-002 | CBOR MT2/3 string writing emits a minimal header and exact payload into an exclusive buffer; it checks range, full budget, capacity, overlap, and UTF-8 before mutation, with a stable source and bounded work. | ADR-0014 | C1 | implemented | INV-F1, INV-P6, INV-A8 | [0014](../adr/0014-formato-record-documento-id.md), [0033](../adr/0033-fail-stop-e-integrita-end-to-end.md), [0035](../adr/0035-strategia-di-verifica-e-tracciabilita.md), [0048](../adr/0048-limiti-documentali-e-formato-v2.md) | test, diff, fuzz, bench, mut, rev |  |
| REQ-CBR-001 | The CBOR argument-header writing primitive for MT0..6 uses minimal width and high/low big-endian u32 words; it checks arguments and capacity before modifying the caller's exclusive destination, with work bounded to nine bytes. | ADR-0014 | C1 | implemented | INV-F1, INV-P6 | [0014](../adr/0014-formato-record-documento-id.md), [0033](../adr/0033-fail-stop-e-integrita-end-to-end.md), [0035](../adr/0035-strategia-di-verifica-e-tracciabilita.md) | test, fuzz, rev, bench |  |
| REQ-AFF-001 | A write, flush, rename, or directory-sync error moves the Serie or Archivio to FAULTED without retry and without batch acknowledgment. | ADR-0033 | C1 | designed | INV-A1 | [0033](../adr/0033-fail-stop-e-integrita-end-to-end.md) | test, fi | FI-02 |
| REQ-AFF-002 | Every record read from disk or cache is verified using header and body CRC32C and key and CSN (version) comparison before return; unverified data are never returned. | ADR-0033 | C1 | designed | INV-A2 | [0033](../adr/0033-fail-stop-e-integrita-end-to-end.md), [0039](../adr/0039-cornice-unica-dei-record.md) | test, corr, fuzz |  |
| REQ-AFF-003 | No product code is compiled with safety below 2; compilation is warning-free; prohibited constructs are detected by the linter. | ADR-0034 | C4 | implemented | INV-A3 | [0034](../adr/0034-policy-di-compilazione-e-standard-di-codifica.md) | analysis |  |
| REQ-AFF-004 | Every error is a typed condition in the arcdocdb-error hierarchy and is never ignored; invariant assertions remain active and, in C1, move the Serie to FAULTED. | ADR-0033 | C1 | designed | INV-A4 | [0033](../adr/0033-fail-stop-e-integrita-end-to-end.md), [0034](../adr/0034-policy-di-compilazione-e-standard-di-codifica.md) | analysis, rev, mut |  |
| REQ-AFF-005 | Every requirement has a source, class, and verification; every invariant and FI scenario is covered by at least one requirement; the matrix is generated and checked. | ADR-0035 | C4 | verified | INV-A5 | [0035](../adr/0035-strategia-di-verifica-e-tracciabilita.md) | analysis |  |
| REQ-AFF-006 | A scrubbing process verifies closed segments in a full cycle within 7 days and quarantines segments with errors. | ADR-0033 | C1 | designed | INV-A6 | [0033](../adr/0033-fail-stop-e-integrita-end-to-end.md) | test, corr |  |
| REQ-AFF-007 | Recovery is idempotent: interrupting it at any point and rerunning it produces the same final state. | ADR-0033 | C1 | designed | INV-A7 | [0033](../adr/0033-fail-stop-e-integrita-end-to-end.md), [0036](../adr/0036-leggi-di-progetto.md) | model, fi, soak | FI-01, FI-06, FI-07, FI-08, FI-10 |
| REQ-AFF-008 | Every resource has a configured, enforced limit; exceeding it produces an explicit rejection; no loop is unbounded. | ADR-0033 | C1 | designed | INV-A8 | [0033](../adr/0033-fail-stop-e-integrita-end-to-end.md), [0034](../adr/0034-policy-di-compilazione-e-standard-di-codifica.md) | test, rev |  |
| REQ-AFF-009 | Recovery distinguishes a tail from corruption using the durable frontier declared by SEALs: an anomaly below the frontier of a later valid SEAL moves the log to FAULTED without any write; otherwise valid length is the start of the first invalid batch. The rule applies to ACTIVE segments, control logs, and multiserie.log and does not depend on persistence order of unsynchronized writes. | ADR-0037 | C1 | designed | INV-F1, INV-F3, INV-A1 | [0033](../adr/0033-fail-stop-e-integrita-end-to-end.md), [0037](../adr/0037-lotto-sigillato.md) | test, fi, corr, model | FI-01, FI-02 |
| REQ-AFF-010 | An offline verifier opens an Archivio read-only, verifies formats, CRCs, and consistency between logs, segments, hints, indexes, multiserie.log, and catalog, and reports every anomaly. | ADR-0033 | C1 | designed | INV-F1 | [0033](../adr/0033-fail-stop-e-integrita-end-to-end.md) | test, corr |  |
| REQ-AFF-011 | Opening an Archivio acquires an exclusive lock; a second open fails immediately. | ADR-0033 | C1 | designed |  | [0033](../adr/0033-fail-stop-e-integrita-end-to-end.md) | test |  |
| REQ-AFF-012 | The system meets the binding minimum performance levels with all reliability checks active. | ADR-0028 | C3 | designed |  | [0028](../adr/0028-target-e-obiettivi-di-latenza.md), [0031](../adr/0031-software-critico-criteri-e-priorita.md) | bench |  |
| REQ-AFF-013 | Time, randomness, scheduling, and I/O pass through injectable interfaces; the whole system runs in a deterministic simulator reproducible from a seed. | ADR-0035 | C1 | designed |  | [0035](../adr/0035-strategia-di-verifica-e-tracciabilita.md) | test, rev |  |
| REQ-AFF-014 | A consistent backup exists (closed segments, control log, and hints at a CSN), verifiable by the offline verifier; restore rejects a backup that fails verification. | ADR-0030 | C1 | designed | INV-F1 | [0030](../adr/0030-scope-v1.md) | test, corr |  |
| REQ-AFF-015 | Serie and Archivio have defined health states (HEALTHY, DEGRADED, FAULTED, MULTI-DISABLED); every transition is a recorded event and a metric. | ADR-0033 | C1 | designed | INV-A1 | [0033](../adr/0033-fail-stop-e-integrita-end-to-end.md) | test, model |  |
| REQ-AFF-016 | The system has no external dependencies beyond SBCL and its contrib modules. | ADR-0027 | C4 | designed | INV-X3 | [0027](../adr/0027-dipendenze-e-test.md) | analysis |  |
| REQ-AFF-017 | Recovery neither modifies nor truncates any existing segment: it closes the discovered ACTIVE at its valid length with a manifest record and opens a new one; its per-Serie atomicity point is renaming the compacted control log. | ADR-0036 | C1 | designed | INV-A9, INV-A7 | [0036](../adr/0036-leggi-di-progetto.md), [0037](../adr/0037-lotto-sigillato.md), [0040](../adr/0040-manifest-a-record-unico.md) | test, model, fi, soak | FI-01, FI-02, FI-10 |
| REQ-AFF-018 | A file or directory is deleted only if it has a tmp suffix and no source of truth names it, or if a source of truth records its removal; an unknown object with a definitive name is left untouched and reported; a segment-id named by the manifest is never reused. | ADR-0036 | C1 | designed | INV-A10 | [0036](../adr/0036-leggi-di-progetto.md), [0040](../adr/0040-manifest-a-record-unico.md) | test, fi, corr | FI-09, FI-13 |
| REQ-AFF-019 | Every operation changing durable state has a single atomicity point (SEAL, EDIT, DECISION, catalog document); what precedes it is discardable and what follows is idempotent completion repeated by recovery. | ADR-0036 | C1 | designed | INV-A11, INV-A7 | [0036](../adr/0036-leggi-di-progetto.md), [0040](../adr/0040-manifest-a-record-unico.md) | model, fi, rev | FI-06, FI-07, FI-08, FI-13 |
| REQ-LIM-001 | The uncompressed CBOR document allows an effective 16 MiB excluding header and key; v2 uses u16 key-len, u32 record length, and five-word slots, without interpreting v1 as v2. | ADR-0048 | C1 | designed | INV-F1, INV-A8 | [0048](../adr/0048-limiti-documentali-e-formato-v2.md) | test, fuzz, corr, fi | FI-01 |
| REQ-LIM-002 | The decoder limits CBOR containers to 100 levels with the root at level 1 and applies explicit budgets before the writer. | ADR-0048 | C2 | designed | INV-A8 | [0048](../adr/0048-limiti-documentali-e-formato-v2.md) | test, fuzz, rev |  |
| REQ-LIM-003 | Binary keys allow 1..65535 bytes; arenas, copies, and migrations have budgets and do not acknowledge incomplete operations; migration preserves sources and atomicity. | ADR-0048 | C1 | designed | INV-A8, INV-A11 | [0048](../adr/0048-limiti-documentali-e-formato-v2.md) | test, fi, bench, rev | FI-06 |

<a id="copertura-degli-invarianti"></a>

## Invariant coverage

| Invariant | Requirements |
|---|---|
| INV-S1 | REQ-STO-001 |
| INV-S2 | REQ-STO-002 |
| INV-S3 | REQ-STO-002, REQ-STO-006 |
| INV-S4 | REQ-STO-003, REQ-STO-006 |
| INV-S5 | REQ-STO-004 |
| INV-S6 | REQ-MET-001, REQ-IDX-006 |
| INV-C1 | REQ-CLN-001, REQ-CMP-009 |
| INV-C2 | REQ-MRG-001 |
| INV-C3 | REQ-CLN-002, REQ-MRG-001 |
| INV-C4 | REQ-STO-005, REQ-CLN-003, REQ-MRG-002 |
| INV-C5 | REQ-MRG-003 |
| INV-C6 | REQ-MRG-003, REQ-MRG-004 |
| INV-C7 | REQ-CMP-002, REQ-REC-004 |
| INV-C8 | REQ-CMP-003 |
| INV-C9 | REQ-CMP-004 |
| INV-C10 | REQ-CMP-005 |
| INV-R1 | REQ-VER-001, REQ-CMP-007 |
| INV-W1 | REQ-ARC-002, REQ-REG-003, REQ-WAL-001 |
| INV-W2 | REQ-REG-001, REQ-WAL-004 |
| INV-D1 | REQ-CMP-008, REQ-WAL-003, REQ-REC-003, REQ-IPC-004 |
| INV-T1 | REQ-TXS-001 |
| INV-T2 | REQ-TXS-002, REQ-TXS-003, REQ-MVC-006 |
| INV-T3 | REQ-TXM-003, REQ-TXM-008 |
| INV-T4 | REQ-TXM-004, REQ-TXM-005 |
| INV-T5 | REQ-TXM-001 |
| INV-M1 | REQ-SEC-004, REQ-MVC-001, REQ-MVC-005 |
| INV-M2 | REQ-VER-001, REQ-MVC-003, REQ-MVC-007 |
| INV-M3 | REQ-CCH-002, REQ-CCH-004 |
| INV-I1 | REQ-IDX-002, REQ-IDX-003, REQ-IDX-011, REQ-IDX-012, REQ-IDX-013 |
| INV-I2 | REQ-SEC-001 |
| INV-I4 | REQ-SEC-003, REQ-SEC-004, REQ-SEC-005, REQ-SEC-007, REQ-SEC-009 |
| INV-I5 | REQ-SEC-008 |
| INV-I6 | REQ-SEC-009, REQ-SEC-010 |
| INV-I7 | REQ-IDX-008, REQ-IDX-013 |
| INV-I8 | REQ-IDX-009, REQ-IDX-010, REQ-IDX-011, REQ-IDX-012, REQ-IDX-013 |
| INV-P1 | REQ-TXS-002, REQ-CON-001 |
| INV-P2 | REQ-CON-002 |
| INV-P3 | REQ-ARC-002, REQ-TXM-006, REQ-CON-003, REQ-CON-005 |
| INV-P4 | REQ-MRG-004, REQ-CMP-006 |
| INV-N1 | REQ-IPC-001 |
| INV-X1 | REQ-SIM-001 |
| INV-X2 | REQ-BEN-001, REQ-BEN-002, REQ-VAL-001 |
| INV-X3 | REQ-SIM-002, REQ-VAL-001, REQ-AFF-016 |
| INV-F1 | REQ-WAL-001, REQ-REC-001, REQ-FOR-001, REQ-FOR-002, REQ-FOR-003, REQ-CBR-006, REQ-CBR-005, REQ-CBR-004, REQ-CBR-003, REQ-CBR-002, REQ-CBR-001, REQ-AFF-009, REQ-AFF-010, REQ-AFF-014, REQ-LIM-001 |
| INV-V1 | REQ-WAL-003, REQ-WAL-006, REQ-IPC-004 |
| INV-V2 | REQ-TXM-004, REQ-MVC-002 |
| INV-V3 | REQ-IDX-004 |
| INV-V4 | REQ-CON-002 |
| INV-A1 | REQ-AFF-001, REQ-AFF-009, REQ-AFF-015 |
| INV-A2 | REQ-SEC-008, REQ-IDX-009, REQ-IDX-010, REQ-IDX-013, REQ-FOR-004, REQ-AFF-002 |
| INV-A3 | REQ-AFF-003 |
| INV-A4 | REQ-AFF-004 |
| INV-A5 | REQ-CBR-009, REQ-CBR-008, REQ-CBR-007, REQ-AFF-005 |
| INV-A6 | REQ-AFF-006 |
| INV-A7 | REQ-REG-002, REQ-CMP-004, REQ-TXM-005, REQ-REC-002, REQ-AFF-007, REQ-AFF-017, REQ-AFF-019 |
| INV-A8 | REQ-IDX-003, REQ-IDX-005, REQ-SEC-006, REQ-SEC-010, REQ-IDX-007, REQ-IDX-008, REQ-IDX-009, REQ-IDX-010, REQ-IDX-011, REQ-IDX-012, REQ-IDX-013, REQ-CON-004, REQ-MVC-004, REQ-MVC-008, REQ-IPC-002, REQ-CBR-009, REQ-CBR-008, REQ-CBR-007, REQ-CBR-006, REQ-CBR-005, REQ-CBR-002, REQ-AFF-008, REQ-LIM-001, REQ-LIM-002, REQ-LIM-003 |
| INV-F2 | REQ-WAL-005, REQ-FOR-003 |
| INV-F3 | REQ-AFF-009 |
| INV-V5 | REQ-WAL-006, REQ-TXM-008, REQ-SEC-004, REQ-IDX-011, REQ-IPC-004 |
| INV-M4 | REQ-MVC-005, REQ-MVC-008 |
| INV-M5 | REQ-WAL-005, REQ-MVC-006 |
| INV-M6 | REQ-MVC-008 |
| INV-S7 | REQ-CMP-009, REQ-TXM-007, REQ-FOR-004 |
| INV-C11 | REQ-CMP-008, REQ-IDX-006 |
| INV-I3 | REQ-IDX-005, REQ-IDX-007 |
| INV-P6 | REQ-SEC-006, REQ-SEC-010, REQ-IDX-008, REQ-IDX-009, REQ-IDX-010, REQ-IDX-011, REQ-IDX-012, REQ-IDX-013, REQ-CON-005, REQ-IPC-002, REQ-CBR-009, REQ-CBR-008, REQ-CBR-007, REQ-CBR-006, REQ-CBR-005, REQ-CBR-004, REQ-CBR-003, REQ-CBR-002, REQ-CBR-001 |
| INV-P5 | REQ-CON-004, REQ-IPC-002 |
| INV-A9 | REQ-AFF-017 |
| INV-A10 | REQ-SEC-005, REQ-SEC-009, REQ-IDX-013, REQ-AFF-018 |
| INV-A11 | REQ-REG-002, REQ-SEC-005, REQ-SEC-009, REQ-IPC-004, REQ-AFF-019, REQ-LIM-003 |
| INV-A12 | REQ-CCH-004 |

<a id="copertura-degli-scenari-di-fault-injection"></a>

## Fault-injection scenario coverage

| Scenario | Requirements |
|---|---|
| FI-01 | REQ-WAL-003, REQ-WAL-005, REQ-WAL-006, REQ-IDX-011, REQ-IDX-012, REQ-IDX-013, REQ-REC-001, REQ-REC-003, REQ-IPC-004, REQ-FLT-001, REQ-FOR-001, REQ-AFF-007, REQ-AFF-009, REQ-AFF-017, REQ-LIM-001 |
| FI-02 | REQ-WAL-003, REQ-WAL-005, REQ-WAL-006, REQ-IDX-011, REQ-IDX-012, REQ-IDX-013, REQ-REC-003, REQ-IPC-004, REQ-FLT-001, REQ-AFF-001, REQ-AFF-009, REQ-AFF-017 |
| FI-03 | REQ-TXM-002, REQ-TXM-004, REQ-TXM-005, REQ-TXM-007, REQ-FLT-001 |
| FI-04 | REQ-TXM-003, REQ-TXM-004, REQ-TXM-005, REQ-FLT-001 |
| FI-05 | REQ-WAL-003, REQ-TXM-003, REQ-TXM-004, REQ-TXM-005, REQ-TXM-007, REQ-TXM-008, REQ-SEC-004, REQ-REC-003, REQ-IPC-004, REQ-FLT-001 |
| FI-06 | REQ-CMP-002, REQ-CMP-003, REQ-IDX-002, REQ-IDX-004, REQ-SEC-004, REQ-SEC-009, REQ-IDX-008, REQ-IDX-010, REQ-IDX-013, REQ-REC-001, REQ-REC-003, REQ-REC-004, REQ-FLT-001, REQ-AFF-007, REQ-AFF-019, REQ-LIM-003 |
| FI-07 | REQ-CLN-002, REQ-CMP-003, REQ-CMP-004, REQ-REC-002, REQ-FLT-001, REQ-AFF-007, REQ-AFF-019 |
| FI-08 | REQ-MRG-001, REQ-CMP-003, REQ-CMP-004, REQ-REC-002, REQ-FLT-001, REQ-AFF-007, REQ-AFF-019 |
| FI-09 | REQ-CMP-007, REQ-SEC-005, REQ-SEC-009, REQ-REC-003, REQ-FLT-001, REQ-AFF-018 |
| FI-10 | REQ-MET-001, REQ-IDX-006, REQ-SEC-005, REQ-SEC-009, REQ-IDX-008, REQ-IDX-010, REQ-IDX-013, REQ-REC-002, REQ-REC-003, REQ-FLT-001, REQ-FOR-001, REQ-AFF-007, REQ-AFF-017 |
| FI-11 | REQ-CMP-007, REQ-SEC-004, REQ-SEC-009, REQ-IDX-008, REQ-MVC-001, REQ-MVC-003, REQ-MVC-005, REQ-FLT-001 |
| FI-12 | REQ-TXM-001, REQ-TXM-004, REQ-TXM-007, REQ-TXM-008, REQ-MVC-002, REQ-MVC-005, REQ-FLT-001 |
| FI-13 | REQ-REG-002, REQ-SEC-005, REQ-SEC-009, REQ-FLT-001, REQ-AFF-018, REQ-AFF-019 |

<a id="decisioni-adr-e-requisiti-che-le-realizzano"></a>

## Decisions (ADRs) and the requirements they implement

| ADR | Requirements |
|---|---|
| [0001](../adr/0001-common-lisp-sbcl.md) | REQ-SIM-002 |
| [0002](../adr/0002-serie-unita-di-storage-e-parallelismo.md) | REQ-ARC-001, REQ-ARC-002, REQ-CON-003, REQ-CON-005 |
| [0003](../adr/0003-wal-per-serie.md) | REQ-REG-003, REQ-WAL-001 |
| [0004](../adr/0004-storage-append-only-un-solo-active.md) | REQ-STO-001, REQ-STO-002, REQ-STO-003, REQ-STO-004, REQ-STO-005 |
| [0005](../adr/0005-writer-logico-per-serie.md) | REQ-TXS-001, REQ-TXS-002, REQ-TXS-003, REQ-CON-001, REQ-CON-002 |
| [0006](../adr/0006-transazioni-multiserie-2pc.md) | REQ-REG-001, REQ-TXM-001, REQ-TXM-002 |
| [0007](../adr/0007-clean-e-merge-distinti.md) | REQ-CLN-001, REQ-CLN-002, REQ-CLN-003, REQ-MRG-001 |
| [0008](../adr/0008-merge-opportunistico.md) | REQ-MRG-002, REQ-MRG-003, REQ-MRG-004 |
| [0009](../adr/0009-indici-immutabili-atomic-swap.md) | REQ-IDX-002 |
| [0010](../adr/0010-cache-clock.md) | REQ-CCH-001 |
| [0011](../adr/0011-thread-pool-dinamico.md) | REQ-CMP-006, REQ-THR-001, REQ-OBS-001, REQ-OBS-002 |
| [0012](../adr/0012-simd-guidato-dai-benchmark.md) | REQ-SIM-001 |
| [0013](../adr/0013-log-structured-segmento-active-come-log.md) | REQ-WAL-001, REQ-REC-003, REQ-FOR-001 |
| [0014](../adr/0014-formato-record-documento-id.md) | REQ-ARC-003, REQ-FOR-001, REQ-FOR-002, REQ-CBR-009, REQ-CBR-008, REQ-CBR-007, REQ-CBR-006, REQ-CBR-005, REQ-CBR-004, REQ-CBR-003, REQ-CBR-002, REQ-CBR-001 |
| [0015](../adr/0015-primary-index-swiss-table-swmr.md) | REQ-VER-001, REQ-IDX-001, REQ-IDX-003, REQ-IDX-004 |
| [0016](../adr/0016-epoch-based-reclamation.md) | REQ-CMP-005, REQ-CMP-007 |
| [0017](../adr/0017-piattaforma-e-io.md) | REQ-THR-001, REQ-SIM-001 |
| [0018](../adr/0018-control-log-manifest-swap.md) | REQ-STO-006, REQ-MET-001, REQ-CLN-002, REQ-CMP-002, REQ-CMP-003, REQ-CMP-004, REQ-REC-001, REQ-REC-002, REQ-REC-004 |
| [0019](../adr/0019-durability-e-group-commit-pipelined.md) | REQ-WAL-002, REQ-WAL-003, REQ-REC-003 |
| [0020](../adr/0020-csn-snapshot-isolamento.md) | REQ-VER-001, REQ-TXM-004, REQ-MVC-001, REQ-MVC-002, REQ-MVC-003, REQ-MVC-004 |
| [0021](../adr/0021-2pc-intenti-outcome.md) | REQ-WAL-004, REQ-TXM-002, REQ-TXM-003, REQ-TXM-004, REQ-TXM-005, REQ-TXM-006, REQ-REC-002 |
| [0022](../adr/0022-registri-come-serie-catalogo.md) | REQ-ARC-004, REQ-REG-001, REQ-REG-002 |
| [0023](../adr/0023-politiche-di-compaction.md) | REQ-STO-005, REQ-MRG-003, REQ-MRG-004, REQ-CMP-001, REQ-CMP-006 |
| [0024](../adr/0024-memoria-e-gc.md) | REQ-IDX-001, REQ-SIM-001, REQ-CBR-009, REQ-CBR-008, REQ-CBR-007 |
| [0025](../adr/0025-cache-per-location.md) | REQ-CCH-001, REQ-CCH-002, REQ-CCH-003 |
| [0026](../adr/0026-indici-secondari-segmentati.md) | REQ-SEC-001, REQ-SEC-002, REQ-SEC-003, REQ-SEC-005 |
| [0027](../adr/0027-dipendenze-e-test.md) | REQ-SIM-002, REQ-AFF-016 |
| [0028](../adr/0028-target-e-obiettivi-di-latenza.md) | REQ-BEN-001, REQ-BEN-002, REQ-AFF-012 |
| [0029](../adr/0029-interfacce-protocollo-query-contratto.md) | REQ-SEC-003, REQ-IPC-002 |
| [0030](../adr/0030-scope-v1.md) | REQ-AFF-014 |
| [0031](../adr/0031-software-critico-criteri-e-priorita.md) | REQ-MOD-001, REQ-AFF-012 |
| [0032](../adr/0032-seqlock-a-64-bit.md) | REQ-IDX-003 |
| [0033](../adr/0033-fail-stop-e-integrita-end-to-end.md) | REQ-REC-001, REQ-CBR-006, REQ-CBR-005, REQ-CBR-004, REQ-CBR-003, REQ-CBR-002, REQ-CBR-001, REQ-AFF-001, REQ-AFF-002, REQ-AFF-004, REQ-AFF-006, REQ-AFF-007, REQ-AFF-008, REQ-AFF-009, REQ-AFF-010, REQ-AFF-011, REQ-AFF-015 |
| [0034](../adr/0034-policy-di-compilazione-e-standard-di-codifica.md) | REQ-SIM-001, REQ-AFF-003, REQ-AFF-004, REQ-AFF-008 |
| [0035](../adr/0035-strategia-di-verifica-e-tracciabilita.md) | REQ-FLT-001, REQ-VAL-001, REQ-CBR-009, REQ-CBR-008, REQ-CBR-007, REQ-CBR-006, REQ-CBR-005, REQ-CBR-004, REQ-CBR-003, REQ-CBR-002, REQ-CBR-001, REQ-AFF-005, REQ-AFF-013 |
| [0036](../adr/0036-leggi-di-progetto.md) | REQ-SEC-006, REQ-CON-005, REQ-AFF-007, REQ-AFF-017, REQ-AFF-018, REQ-AFF-019 |
| [0037](../adr/0037-lotto-sigillato.md) | REQ-WAL-002, REQ-WAL-003, REQ-WAL-005, REQ-WAL-006, REQ-REC-001, REQ-REC-003, REQ-IPC-004, REQ-AFF-009, REQ-AFF-017 |
| [0038](../adr/0038-orizzonte-di-visibilita.md) | REQ-VER-001, REQ-TXM-004, REQ-SEC-004, REQ-MVC-002, REQ-MVC-005, REQ-MVC-006, REQ-MVC-007 |
| [0039](../adr/0039-cornice-unica-dei-record.md) | REQ-WAL-005, REQ-IDX-006, REQ-SEC-001, REQ-FOR-001, REQ-FOR-003, REQ-FOR-004, REQ-AFF-002 |
| [0040](../adr/0040-manifest-a-record-unico.md) | REQ-REG-002, REQ-STO-006, REQ-MET-001, REQ-CLN-002, REQ-CMP-002, REQ-CMP-003, REQ-CMP-004, REQ-TXM-007, REQ-SEC-005, REQ-SEC-009, REQ-REC-002, REQ-REC-004, REQ-AFF-017, REQ-AFF-018, REQ-AFF-019 |
| [0041](../adr/0041-multiserie-segmenti-autosufficienti.md) | REQ-CMP-009, REQ-WAL-004, REQ-TXM-001, REQ-TXM-002, REQ-TXM-003, REQ-TXM-004, REQ-TXM-005, REQ-TXM-007, REQ-TXM-008, REQ-SEC-004, REQ-SEC-010, REQ-REC-002, REQ-IPC-004 |
| [0042](../adr/0042-tombstone-e-indice-dei-vivi.md) | REQ-CMP-008, REQ-CMP-009, REQ-IDX-006 |
| [0043](../adr/0043-primary-index-a-frammenti.md) | REQ-IDX-001, REQ-IDX-003, REQ-IDX-005, REQ-IDX-007, REQ-IDX-009 |
| [0044](../adr/0044-cache-acceleratore-puro.md) | REQ-CCH-002, REQ-CCH-004 |
| [0045](../adr/0045-modello-di-esecuzione.md) | REQ-SEC-006, REQ-SEC-010, REQ-CON-005, REQ-CON-004, REQ-IPC-002 |
| [0046](../adr/0046-orizzonte-con-registro-limitato.md) | REQ-MVC-008 |
| [0047](../adr/0047-verifica-csn-dei-record-prepared.md) | REQ-FOR-004 |
| [0048](../adr/0048-limiti-documentali-e-formato-v2.md) | REQ-IPC-002, REQ-CBR-009, REQ-CBR-008, REQ-CBR-007, REQ-CBR-006, REQ-CBR-005, REQ-CBR-004, REQ-CBR-003, REQ-CBR-002, REQ-LIM-001, REQ-LIM-002, REQ-LIM-003 |
| [0049](../adr/0049-capacita-oltre-la-ram.md) | REQ-IDX-008 |
| [0050](../adr/0050-pubblicazione-e-costi-della-directory.md) | REQ-IDX-007, REQ-IDX-008 |
| [0051](../adr/0051-presentazione-della-documentazione.md) | —  (decision without a direct requirement) |
| [0052](../adr/0052-header-dei-log-di-controllo.md) | REQ-FOR-001, REQ-FOR-002 |
| [0053](../adr/0053-ricerca-full-text-indici-invertiti.md) | REQ-SEC-003, REQ-SEC-004, REQ-SEC-005, REQ-SEC-006, REQ-SEC-007 |
| [0054](../adr/0054-contratto-e-formato-full-text.md) | REQ-SEC-007, REQ-SEC-008, REQ-SEC-009, REQ-SEC-010 |
| [0055](../adr/0055-interfaccia-locale-unix-socket.md) | REQ-IPC-001, REQ-IPC-002, REQ-IPC-003, REQ-IPC-004 |
| [0056](../adr/0056-sessione-locale-m16.md) | —  (decision without a direct requirement) |
| [0057](../adr/0057-selezione-automatica-indice.md) | REQ-IDX-008, REQ-IDX-009, REQ-IDX-010, REQ-IDX-013 |
| [0058](../adr/0058-pagine-indice-primario.md) | REQ-IDX-009, REQ-IDX-010, REQ-IDX-013 |
| [0059](../adr/0059-crc32c-arm64-sbcl.md) | REQ-FOR-003 |
| [0060](../adr/0060-crc32c-caricamento-portabile.md) | REQ-FOR-003 |
| [0061](../adr/0061-conservazione-esterna-delle-prove.md) | —  (decision without a direct requirement) |
| [0062](../adr/0062-cronologia-git-due-commit.md) | —  (decision without a direct requirement) |
| [0063](../adr/0063-immagini-sigillate-indice-primario.md) | REQ-IDX-010 |
| [0064](../adr/0064-adozione-indice-paginato-m1.md) | REQ-IDX-010 |
| [0065](../adr/0065-costruzione-immagini-dal-motore.md) | REQ-IDX-009, REQ-IDX-010 |
| [0066](../adr/0066-attivazione-seriale-immagini-m1.md) | REQ-IDX-010 |
| [0067](../adr/0067-delta-seriale-indice-m1.md) | REQ-IDX-010, REQ-IDX-011 |
| [0068](../adr/0068-rinnovo-seriale-immagini-m1.md) | REQ-IDX-009, REQ-IDX-010, REQ-IDX-011, REQ-IDX-012 |
| [0069](../adr/0069-manutenzione-a-soglie-delta-m1.md) | REQ-IDX-010, REQ-IDX-011, REQ-IDX-012 |
| [0070](../adr/0070-scoperta-readonly-immagini-m1.md) | REQ-IDX-010 |
| [0071](../adr/0071-delta-location-indice-m1.md) | REQ-IDX-011, REQ-IDX-012 |
| [0072](../adr/0072-rinnovo-automatico-delta-m1.md) | REQ-IDX-012 |
| [0073](../adr/0073-indice-automatico-operativo-m1.md) | REQ-IDX-008, REQ-IDX-013 |
| [0074](../adr/0074-crc32c-sbcl-2.6.10.md) | REQ-FOR-003 |
| [0075](../adr/0075-codex-documentation-toolchain.md) | —  (decision without a direct requirement) |
| [0076](../adr/0076-rotazione-live-m1.md) | REQ-STO-003 |
