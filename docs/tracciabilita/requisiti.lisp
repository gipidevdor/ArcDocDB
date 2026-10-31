;;;; requisiti.lisp — tracked ArcDocDB requirements (data, not code).
;;;;
;;;; Each requirement is a property list:
;;;;   :id    REQ-<AREA>-<nnn>, stable (retire rather than renumber)
;;;;   :src   specification section, ADR, or originating process
;;;;   :txt   verifiable statement (no double quotes in text)
;;;;   :cls   integrity class (ADR-0031): C1, C2, C3, C4
;;;;   :inv   invariants (INV-...) implemented by the requirement
;;;;   :adr   decisions (ADR-nnnn) implementing it
;;;;   :ver   verification methods: :test :prop :diff :model :fi :fuzz :corr :mut
;;;;          :soak :bench :rev :analisi   (at least one)
;;;;   :fi    fault-injection scenarios (FI-nn) verifying it
;;;;   :stato :specificato | :progettato | :implementato | :verificato
;;;;
;;;; The matrix docs/tracciabilita/matrice.md is GENERATED from this file with
;;;; `make trace-write` and checked by `make trace`. Canonical keywords stay stable.

(
 ;; ---- Logical architecture and Registri --------------------------------------
 (:id "REQ-ARC-001" :src "Logical architecture" :cls "C2" :stato :progettato
  :txt "The logical hierarchy is Server, Archivio, Serie, Documento."
  :inv () :adr ("ADR-0002") :ver (:rev :test) :fi ())
 (:id "REQ-ARC-002" :src "Logical architecture" :cls "C1" :stato :progettato
  :txt "The Serie is the primary unit of storage and parallelism; it owns its logs, segments, and indexes and operates independently of other Serie."
  :inv ("INV-W1" "INV-P3") :adr ("ADR-0002") :ver (:test :bench) :fi ())
 (:id "REQ-ARC-003" :src "Logical architecture" :cls "C1" :stato :progettato
  :txt "A Documento has an _id unique within the Serie and may have historical versions managed by append-only storage and MVCC."
  :inv () :adr ("ADR-0014") :ver (:test :diff) :fi ())
 (:id "REQ-ARC-004" :src "Logical architecture" :cls "C1" :stato :progettato
  :txt "The Archivio is the level of multiseries transactions and snapshots and must contain the Registri Serie."
  :inv () :adr ("ADR-0022") :ver (:test) :fi ())
 (:id "REQ-REG-001" :src "Special Serie Registri" :cls "C1" :stato :progettato
  :txt "Registri is not the data WAL: it contains the catalog and a single multiserie.log file; there is no per-transaction file."
  :inv ("INV-W2") :adr ("ADR-0006" "ADR-0022") :ver (:rev :test) :fi ())
 (:id "REQ-REG-002" :src "Catalog" :cls "C1" :stato :progettato
  :txt "For each Serie, the catalog stores name, configuration, schema, indexes, segment configuration, state, and recovery metadata, and supports transactional, crash-safe modifications: the Serie document is the atomicity point for creation and deletion; the directory follows."
  :inv ("INV-A7" "INV-A11") :adr ("ADR-0022" "ADR-0040") :ver (:test :fi) :fi ("FI-13"))
 (:id "REQ-REG-003" :src "Physical layout" :cls "C1" :stato :progettato
  :txt "Each Serie is physically independent in its own directory; there is no global data WAL."
  :inv ("INV-W1") :adr ("ADR-0003") :ver (:rev :analisi) :fi ())

 ;; ---- Storage, segments, versions -----------------------------------------
 (:id "REQ-STO-001" :src "Storage append-only" :cls "C1" :stato :progettato
  :txt "Records already written to segments are never modified in place."
  :inv ("INV-S1") :adr ("ADR-0004") :ver (:test :rev) :fi ())
 (:id "REQ-STO-002" :src "Storage append-only" :cls "C1" :stato :progettato
  :txt "There is exactly one ACTIVE segment per Serie, and it is the only writable segment."
  :inv ("INV-S2" "INV-S3") :adr ("ADR-0004") :ver (:test :model) :fi ())
 (:id "REQ-STO-003" :src "Storage append-only" :cls "C1" :stato :progettato
  :txt "A segment that ceases to be ACTIVE is immutable and is never reopened for writing."
  :inv ("INV-S4") :adr ("ADR-0004" "ADR-0076") :ver (:test) :fi ())
 (:id "REQ-STO-004" :src "Segments" :cls "C1" :stato :progettato
  :txt "New writes always go to a new ACTIVE segment, never to a segment produced by compaction."
  :inv ("INV-S5") :adr ("ADR-0004") :ver (:test) :fi ())
 (:id "REQ-STO-005" :src "Segments" :cls "C1" :stato :progettato
  :txt "Writer-created segments have a target size of approximately 256 MB, configurable per Serie; segments produced by compaction have no size requirement."
  :inv ("INV-C4") :adr ("ADR-0004" "ADR-0023") :ver (:test) :fi ())
 (:id "REQ-STO-006" :src "Segments" :cls "C1" :stato :progettato
  :txt "Segment states are ACTIVE, CLOSED, OBSOLETE, RECLAIMABLE, DELETED with one-way transitions; only ACTIVE is writable; only membership in the manifest's recorded set is durable."
  :inv ("INV-S3" "INV-S4") :adr ("ADR-0018" "ADR-0040") :ver (:test :model) :fi ())
 (:id "REQ-MET-001" :src "Segment metadata" :cls "C1" :stato :progettato
  :txt "Segment metadata (identifier, counts, bytes, state, times, epoch) are derived data and can be rebuilt, verified, and corrected from logs, data, and index."
  :inv ("INV-S6") :adr ("ADR-0018" "ADR-0040") :ver (:test :fi) :fi ("FI-10"))
 (:id "REQ-VER-001" :src "Record versions" :cls "C1" :stato :progettato
  :txt "Each version is LIVE, SNAPSHOT-LIVE, or DEAD; a DEAD version is reclaimable only without references from indexes, snapshots, and transactions."
  :inv ("INV-R1" "INV-M2") :adr ("ADR-0015" "ADR-0020" "ADR-0038") :ver (:test :model) :fi ())

 ;; ---- CLEAN, MERGE, compaction --------------------------------------------
 (:id "REQ-CLN-001" :src "Clean" :cls "C1" :stato :progettato
  :txt "CLEAN transforms one source segment into a new immutable segment containing only live or required records."
  :inv ("INV-C1") :adr ("ADR-0007") :ver (:test :diff) :fi ())
 (:id "REQ-CLN-002" :src "Clean" :cls "C1" :stato :progettato
  :txt "CLEAN is copy-on-write: the source segment is never modified, becomes OBSOLETE after the swap, and remains readable as long as needed."
  :inv ("INV-C3") :adr ("ADR-0007" "ADR-0018" "ADR-0040") :ver (:test :fi) :fi ("FI-07"))
 (:id "REQ-CLN-003" :src "Segments" :cls "C1" :stato :progettato
  :txt "The segment produced by CLEAN may be much smaller than the target and may remain small indefinitely."
  :inv ("INV-C4") :adr ("ADR-0007") :ver (:test) :fi ())
 (:id "REQ-MRG-001" :src "Merge" :cls "C1" :stato :progettato
  :txt "MERGE transforms N small segments into a new immutable segment and leaves sources immutable."
  :inv ("INV-C2" "INV-C3") :adr ("ADR-0007") :ver (:test :fi) :fi ("FI-08"))
 (:id "REQ-MRG-002" :src "Merge" :cls "C3" :stato :progettato
  :txt "MERGE is not automatically performed after every CLEAN."
  :inv ("INV-C4") :adr ("ADR-0008") :ver (:test) :fi ())
 (:id "REQ-MRG-003" :src "Mandatory conditions for Merge" :cls "C3" :stato :progettato
  :txt "A segment is a MERGE candidate only if it is CLOSED, immutable, not ACTIVE, stable for at least 50 seconds since closure or stabilization, not required by an active snapshot, in a group exceeding the thresholds, and with the engine under low load."
  :inv ("INV-C5" "INV-C6") :adr ("ADR-0008" "ADR-0023") :ver (:test :bench) :fi ())
 (:id "REQ-MRG-004" :src "Low-load merge policy" :cls "C3" :stato :progettato
  :txt "Load is evaluated before MERGE; under high load no MERGEs start, their concurrency is reduced, and requests and logs take priority; if load rises during MERGE, noncritical work is suspended or slowed."
  :inv ("INV-C6" "INV-P4") :adr ("ADR-0008" "ADR-0023") :ver (:test :bench) :fi ())
 (:id "REQ-CMP-001" :src "General compaction policy" :cls "C3" :stato :progettato
  :txt "With live equal to zero and no references, the segment is deleted; with partial live content, CLEAN is performed; with live approximately equal to total, no compaction is performed."
  :inv () :adr ("ADR-0023" "ADR-0078") :ver (:test) :fi ())
 (:id "REQ-CMP-002" :src "Workflow Clean/Merge" :cls "C1" :stato :progettato
  :txt "The compaction workflow follows the specification's thirteen steps; the new segment is not visible as definitive before its data are durable."
  :inv ("INV-C7") :adr ("ADR-0018" "ADR-0040") :ver (:test :model :fi) :fi ("FI-06"))
 (:id "REQ-CMP-003" :src "Fault injection" :cls "C1" :stato :progettato
  :txt "A source segment remains recoverable until the swap completes."
  :inv ("INV-C8") :adr ("ADR-0018" "ADR-0040") :ver (:model :fi) :fi ("FI-06" "FI-07" "FI-08"))
 (:id "REQ-CMP-004" :src "Fault injection" :cls "C1" :stato :progettato
  :txt "An interrupted compaction is repeatable or completable during recovery."
  :inv ("INV-C9" "INV-A7") :adr ("ADR-0018" "ADR-0040") :ver (:model :fi) :fi ("FI-07" "FI-08"))
 (:id "REQ-CMP-005" :src "Readers during compaction" :cls "C1" :stato :progettato
  :txt "Readers continue reading old segments during compaction; compaction does not globally block reads; after the swap, new readers use the new segment."
  :inv ("INV-C10") :adr ("ADR-0016" "ADR-0078") :ver (:test :model :bench) :fi ())
 (:id "REQ-CMP-006" :src "Parallel compaction" :cls "C3" :stato :progettato
  :txt "Compaction can run in parallel per segment and per Serie, with limits independent of the request scheduler and priorities of user, log, necessary CLEAN, MERGE."
  :inv ("INV-P4") :adr ("ADR-0011" "ADR-0023") :ver (:test :bench) :fi ())
 (:id "REQ-CMP-007" :src "Index/Snapshot/Reclaim" :cls "C1" :stato :progettato
  :txt "A segment is deleted only when no index, snapshot, active transaction, or reader references or uses it."
  :inv ("INV-R1") :adr ("ADR-0016" "ADR-0078") :ver (:model :fi) :fi ("FI-09" "FI-11"))
 (:id "REQ-CMP-008" :src "ADR-0042" :cls "C1" :stato :progettato
  :txt "Compaction discards a tombstone only if it is superseded by a newer durable version, or if no version of the key is retained and no other segment can contain an older record for that key (existence filter and segment minimum CSN)."
  :inv ("INV-D1" "INV-C11") :adr ("ADR-0042" "ADR-0078") :ver (:test :prop :model) :fi ())
 (:id "REQ-CMP-009" :src "ADR-0042" :cls "C1" :stato :progettato
  :txt "Compaction copies only required records (referenced by the index, referenced by retained versions, nondiscardable tombstones), rewrites committed prepared records as ordinary records with their CSN, and never copies SEAL or OUTCOME."
  :inv ("INV-C1" "INV-S7") :adr ("ADR-0041" "ADR-0042" "ADR-0078") :ver (:test :diff :model) :fi ())

 ;; ---- Log, durability -------------------------------------------------------
 (:id "REQ-WAL-001" :src "WAL" :cls "C1" :stato :progettato
  :txt "Each Serie has an independent data log (ACTIVE segment) and a structural control log; there is no global data WAL."
  :inv ("INV-W1" "INV-F1") :adr ("ADR-0003" "ADR-0013") :ver (:test :rev) :fi ())
 (:id "REQ-WAL-002" :src "WAL" :cls "C1" :stato :progettato
  :txt "The system uses group commit; it does not flush every operation unless strong durability is requested; each log has only one I/O task at a time, which writes closed batches and flushes."
  :inv () :adr ("ADR-0019" "ADR-0037") :ver (:test :bench) :fi ())
 (:id "REQ-WAL-003" :src "WAL" :cls "C1" :stato :progettato
  :txt "Durability levels are async, group, and strong and change only publication and acknowledgment timing; for group and strong, acknowledged data are not lost and are not visible before being durable."
  :inv ("INV-D1" "INV-V1") :adr ("ADR-0019" "ADR-0037") :ver (:test :fi) :fi ("FI-01" "FI-02" "FI-05"))
 (:id "REQ-WAL-004" :src "WAL" :cls "C1" :stato :progettato
  :txt "multiserie.log uses group commit."
  :inv ("INV-W2") :adr ("ADR-0021" "ADR-0041") :ver (:test :bench) :fi ())
 (:id "REQ-WAL-005" :src "ADR-0037" :cls "C1" :stato :progettato
  :txt "Each log is a sequence of sealed batches: a batch is valid in full (SEAL fixes its file, position, record count, and contents) or does not exist; a non-prepared record is committed if and only if it is in a valid batch; the batch CSN is taken at closure."
  :inv ("INV-F2" "INV-M5") :adr ("ADR-0037" "ADR-0039") :ver (:test :fuzz :corr :fi :model) :fi ("FI-01" "FI-02"))
 (:id "REQ-WAL-006" :src "ADR-0037" :cls "C1" :stato :progettato
  :txt "A write is acknowledged to the client only after publication in the index and, for group and strong, only after the flush covering its batch; publication follows batch order."
  :inv ("INV-V5" "INV-V1") :adr ("ADR-0037") :ver (:test :diff :fi) :fi ("FI-01" "FI-02"))

 ;; ---- Transactions -----------------------------------------------------------
 (:id "REQ-TXS-001" :src "Single-Serie transactions" :cls "C1" :stato :progettato
  :txt "A single-Serie transaction uses only the Serie log and does not write to multiserie.log."
  :inv ("INV-T1") :adr ("ADR-0005") :ver (:test) :fi ())
 (:id "REQ-TXS-002" :src "Single-Serie transactions" :cls "C1" :stato :progettato
  :txt "A single-Serie transaction is serialized by the logical writer and detects conflicts with optimistic version checking; version checking is atomic with respect to application."
  :inv ("INV-T2" "INV-P1") :adr ("ADR-0005") :ver (:test :diff :model) :fi ())
 (:id "REQ-TXS-003" :src "Single-Serie transactions" :cls "C1" :stato :progettato
  :txt "When two transactions read the same version, the second to commit fails with a conflict and may retry."
  :inv ("INV-T2") :adr ("ADR-0005") :ver (:test :diff) :fi ())
 (:id "REQ-TXM-001" :src "Multiseries transactions" :cls "C1" :stato :progettato
  :txt "All changes in a multiseries transaction share a single TXID."
  :inv ("INV-T5") :adr ("ADR-0006" "ADR-0041") :ver (:test :fi) :fi ("FI-12"))
 (:id "REQ-TXM-002" :src "Multiseries transactions" :cls "C1" :stato :progettato
  :txt "A multiseries transaction follows a 2PC protocol: BEGIN, PREPARE on participants, flush, durable decision, COMMIT or ABORT, application."
  :inv () :adr ("ADR-0006" "ADR-0021" "ADR-0041") :ver (:test :model :fi) :fi ("FI-03"))
 (:id "REQ-TXM-003" :src "Multiseries transactions" :cls "C1" :stato :progettato
  :txt "The COMMIT decision is durable in multiserie.log before the transaction is considered committed."
  :inv ("INV-T3") :adr ("ADR-0021" "ADR-0041") :ver (:model :fi) :fi ("FI-04" "FI-05"))
 (:id "REQ-TXM-004" :src "Fault injection" :cls "C1" :stato :progettato
  :txt "No multiseries transaction is partially committed, even after a crash, and a snapshot sees all or none of it."
  :inv ("INV-T4" "INV-V2") :adr ("ADR-0020" "ADR-0021" "ADR-0038" "ADR-0041") :ver (:model :fi) :fi ("FI-03" "FI-04" "FI-05" "FI-12"))
 (:id "REQ-TXM-005" :src "Multiseries transactions" :cls "C1" :stato :progettato
  :txt "After a crash, the Recovery Manager reads multiserie.log, identifies prepared or incomplete transactions, determines the decision (presumed abort: without DECISION the transaction is aborted), and makes each participant's COMMIT outcome durable in the record closing its segment."
  :inv ("INV-T4" "INV-A7") :adr ("ADR-0021" "ADR-0041") :ver (:model :fi) :fi ("FI-03" "FI-04" "FI-05"))
 (:id "REQ-TXM-006" :src "ADR-0021" :cls "C1" :stato :progettato
  :txt "A Serie writer does not stop to wait for a multiseries decision; documents with a pending intent return conflict without waiting."
  :inv ("INV-P3") :adr ("ADR-0021") :ver (:test :model :bench) :fi ())
 (:id "REQ-TXM-007" :src "ADR-0041" :cls "C1" :stato :progettato
  :txt "A CLOSED segment is self-contained: rotation waits until the Serie has no pending intents; a prepared record is committed if and only if its OUTCOME is in the same segment or its outcome is in the manifest record that closed the segment."
  :inv ("INV-S7") :adr ("ADR-0041" "ADR-0040") :ver (:test :model :fi) :fi ("FI-03" "FI-05" "FI-12"))
 (:id "REQ-TXM-008" :src "ADR-0041" :cls "C1" :stato :progettato
  :txt "A multiseries transaction is acknowledged to the client after the decision is durable and the outcome has been applied in memory on all healthy participants; an abort writes no record."
  :inv ("INV-V5" "INV-T3") :adr ("ADR-0041") :ver (:test :model :fi) :fi ("FI-05" "FI-12"))

 ;; ---- Indexes ----------------------------------------------------------------
 (:id "REQ-IDX-001" :src "Index" :cls "C1" :stato :progettato
  :txt "The primary index maps _id to location (segment-id, offset, length, version; the version is the CSN) with average O(1) lookup in compact structures without one Lisp object per entry."
  :inv () :adr ("ADR-0015" "ADR-0024" "ADR-0043") :ver (:test :bench) :fi ())
 (:id "REQ-IDX-002" :src "Index snapshot" :cls "C1" :stato :progettato
  :txt "Indexes are immutable for readers; new versions become visible through atomic swap and previous readers finish on the old version."
  :inv ("INV-I1") :adr ("ADR-0009") :ver (:test :model :fi) :fi ("FI-06"))
 (:id "REQ-IDX-003" :src "ADR-0032" :cls "C1" :stato :progettato
  :txt "Reading a primary-index entry never observes an intermediate state, with bounded attempts and fallback to the writer."
  :inv ("INV-I1" "INV-A8") :adr ("ADR-0015" "ADR-0032" "ADR-0043") :ver (:test :model :soak) :fi ())
 (:id "REQ-IDX-004" :src "ADR-0015" :cls "C1" :stato :progettato
  :txt "Compaction relocation updates an entry only if it still points to the source location and never overwrites a newer version."
  :inv ("INV-V3") :adr ("ADR-0015") :ver (:test :model :fi) :fi ("FI-06"))
 (:id "REQ-IDX-005" :src "ADR-0043" :cls "C1" :stato :progettato
  :txt "The primary index is a directory of fixed-capacity fragments: no maintenance copies more than one fragment, deleted slot and key space is reclaimed on split, and the same table implements the index, retained versions, and pending versions."
  :inv ("INV-I3" "INV-A8") :adr ("ADR-0043") :ver (:test :model :bench) :fi ())
 (:id "REQ-IDX-006" :src "ADR-0042" :cls "C1" :stato :progettato
  :txt "The primary index contains only live documents; rebuilding selects the committed record with the maximum CSN for each key and gives the same result for any segment read order."
  :inv ("INV-C11" "INV-S6") :adr ("ADR-0042" "ADR-0039") :ver (:test :prop :fi) :fi ("FI-10"))
 (:id "REQ-SEC-001" :src "Secondary index" :cls "C2" :stato :progettato
  :txt "Secondary indexes use structures suited to query type (strings and prefixes, ranges, categories, bitmaps); the value Bloom filter, a section of the index file, says only absent or possibly present."
  :inv ("INV-I2") :adr ("ADR-0026" "ADR-0039") :ver (:test :diff) :fi ())
 (:id "REQ-SEC-002" :src "Secondary index delta" :cls "C2" :stato :progettato
  :txt "Secondary indexes follow the base-plus-immutable-deltas model and the new base is built without blocking readers."
  :inv () :adr ("ADR-0026") :ver (:test :diff) :fi ())
 (:id "REQ-SEC-003" :src "ADR-0053" :cls "C2" :stato :progettato
  :txt "The Serie declares dedicated full-text indexes: dictionary by field and term, postings by row and frequency, positions for phrases; a deterministic, versioned analyzer shared by documents and queries, combined with structured filters."
  :inv ("INV-I4") :adr ("ADR-0053" "ADR-0026" "ADR-0029") :ver (:test :diff :bench) :fi ())
 (:id "REQ-SEC-004" :src "ADR-0053" :cls "C1" :stato :progettato
  :txt "The full-text delta is published with documents before acknowledgment and visibility advancement; every result and filter uses the same committed version visible in the snapshot, including after updates, deletes, aborts, and compaction."
  :inv ("INV-I4" "INV-M1" "INV-V5") :adr ("ADR-0053" "ADR-0038" "ADR-0041") :ver (:test :diff :model :fi) :fi ("FI-05" "FI-06" "FI-11"))
 (:id "REQ-SEC-005" :src "ADR-0053" :cls "C1" :stato :progettato
  :txt "Full-text indexes are rebuildable derivatives: identity, CRC, profile, and coverage are verified; build and analyzer changes publish a complete generation without mixing; loss, corruption, or incomplete rebuild are explicitly reported, including after recovery and restore."
  :inv ("INV-I4" "INV-A10" "INV-A11") :adr ("ADR-0053" "ADR-0026" "ADR-0040") :ver (:test :diff :corr :fi) :fi ("FI-09" "FI-10" "FI-13"))
 (:id "REQ-SEC-006" :src "ADR-0053" :cls "C1" :stato :progettato
  :txt "Full-text analysis, delta, and queries have finite budgets; an over-limit write is rejected before the durable decision, an over-budget query ends with an explicit error without presenting partial results as complete; no global per-document coordination."
  :inv ("INV-A8" "INV-P6") :adr ("ADR-0053" "ADR-0036" "ADR-0045") :ver (:test :soak :bench :rev) :fi ())
 (:id "REQ-SEC-007" :src "ADR-0054" :cls "C2" :stato :progettato
  :txt "The unicode-word-18.0.0-v1 profile fixes Unicode 18.0.0, NFC, C/F case folding, and word breaks; explicit AST leaves, phrases with repetitions, stable ordering, and terminal state have semantics reproducible with official corpora and manual expected results."
  :inv ("INV-I4") :adr ("ADR-0053" "ADR-0054") :ver (:test :diff :rev) :fi ())
 (:id "REQ-SEC-008" :src "ADR-0054" :cls "C1" :stato :progettato
  :txt "The full-text .idx v2 type-5 file verifies header, six sections, fixed-width arrays, CRC, ordering, and bounds; identity and configuration match the catalog, segment, and exact hint bytes, without reusing ordinals from another hint."
  :inv ("INV-I5" "INV-A2") :adr ("ADR-0054") :ver (:test :fuzz :corr :mut :rev) :fi ())
 (:id "REQ-SEC-009" :src "ADR-0054" :cls "C1" :stato :progettato
  :txt "A full-text generation captures new commits without gaps relative to the initial prefix and becomes READY only after rechecking inventory and frontiers; separate files per generation, retirement decided by the catalog, and reclaim after quiescence."
  :inv ("INV-I4" "INV-I6" "INV-A10" "INV-A11") :adr ("ADR-0054" "ADR-0040") :ver (:test :diff :model :fi) :fi ("FI-06" "FI-09" "FI-10" "FI-11" "FI-13"))
 (:id "REQ-SEC-010" :src "ADR-0054" :cls "C1" :stato :progettato
  :txt "Before SEAL/PREPARE, the writer reserves delta, staging, and a conservative upper bound for the full-text file; rotation prevents over-budget indexes; queries and builds account for resources, work, deadlines, and attempts with a single cleanup and terminal completion."
  :inv ("INV-I6" "INV-A8" "INV-P6") :adr ("ADR-0054" "ADR-0041" "ADR-0045") :ver (:test :model :soak :bench :rev) :fi ())

 (:id "REQ-IDX-007" :src "ADR-0050" :cls "C1" :stato :progettato
  :txt "The reader rechecks root and generation after probing, including on a miss, with bounded attempts; maintenance declares and checks slots, key bytes, directory references, and transient memory separately."
  :inv ("INV-I3" "INV-A8") :adr ("ADR-0043" "ADR-0050") :ver (:test :model :bench :rev) :fi ())
 (:id "REQ-IDX-008" :src "ADR-0057" :cls "C1" :stato :implementato
  :txt "In the serial M1 profile, index mode is selected automatically per Serie at startup and during operation: resident when it fits, paged beyond the quota, with hysteresis on return. Switching requires a reserved memory peak including the retained source and consistent publication, without admitting over-budget work or changing the commit protocol."
  :inv ("INV-I7" "INV-A8" "INV-P6") :adr ("ADR-0073" "ADR-0057" "ADR-0049" "ADR-0050") :ver (:test :model :bench :fi :rev) :fi ("FI-06" "FI-10" "FI-11"))
 (:id "REQ-IDX-009" :src "ADR-0058" :cls "C1" :stato :progettato
  :txt "Derived primary-index pages have Serie/image/offset/generation identity, version, and CRC32C; flat buckets, radix directory, and key fragments are verified before use. Backward references, canonical packing, geometry, and v2 bounds prevent structural aliases and false local misses; the codec introduces no independent commit."
  :inv ("INV-I8" "INV-A2" "INV-A8" "INV-P6") :adr ("ADR-0068" "ADR-0058" "ADR-0065" "ADR-0057" "ADR-0043") :ver (:test :diff :corr :rev) :fi ())

 (:id "REQ-IDX-010" :src "ADR-0063" :cls "C1" :stato :progettato
  :txt "A paged root is adopted only from a complete image verified read-only against canonical source, seed, count, and authoritative candidates; derivative completion is distinct from data commit, with cumulative budgets and rejection of duplicates/unreachable entries."
  :inv ("INV-I8" "INV-A2" "INV-A8" "INV-P6") :adr ("ADR-0063" "ADR-0064" "ADR-0065" "ADR-0066" "ADR-0067" "ADR-0068" "ADR-0069" "ADR-0070" "ADR-0058" "ADR-0057") :ver (:test :diff :corr :fi :rev) :fi ("FI-06" "FI-10"))

 (:id "REQ-IDX-011" :src "ADR-0071" :cls "C1" :stato :implementato
  :txt "The serial M1 paged delta stores exact private keys and committed normalized locations or explicit tombstones; touched-key lookup uses neither the resident index nor the base image. Publication follows durable SEAL under BUSY, incomplete operations fault, and activation/renewal reserve all old and new delta arrays before effects."
  :inv ("INV-I1" "INV-I8" "INV-V5" "INV-A8" "INV-P6") :adr ("ADR-0071" "ADR-0067" "ADR-0068" "ADR-0069") :ver (:test :diff :corr :fi :rev) :fi ("FI-01" "FI-02"))

 (:id "REQ-IDX-012" :src "ADR-0072" :cls "C1" :stato :implementato
  :txt "An optionally configured M1 engine renews its paged image automatically before PUT/DELETE at the delta threshold or next-key capacity limit. The full renewal reservation and finite fresh-name sequence are checked before admission; one BUSY scope covers renewal and document commit, with no CSN/ACK for the derivative and FAULTED on incomplete admitted exits."
  :inv ("INV-I1" "INV-I8" "INV-A8" "INV-P6") :adr ("ADR-0072" "ADR-0068" "ADR-0069" "ADR-0071") :ver (:test :diff :fi :rev) :fi ("FI-01" "FI-02"))

 (:id "REQ-IDX-013" :src "ADR-0073" :cls "C1" :stato :implementato
  :txt "The automatic M1 primary backend has bounded resident growth, verified migration both ways with hysteresis, independent paged writes, bounded-memory WAL replay and bounded CLOSED resolver caching. Immutable checksummed disk nodes use fixed cache/path/batch storage; canonical WAL remains the only data commit and private derivative removal requires bound ownership proof."
  :inv ("INV-I1" "INV-I7" "INV-I8" "INV-A2" "INV-A8" "INV-A10" "INV-P6") :adr ("ADR-0073" "ADR-0057" "ADR-0058") :ver (:test :diff :corr :fi :bench :rev) :fi ("FI-01" "FI-02" "FI-06" "FI-10"))

 ;; ---- Cache -------------------------------------------------------------------
 (:id "REQ-CCH-001" :src "Cache" :cls "C3" :stato :progettato
  :txt "The cache uses CLOCK, may be partitioned by Serie, and measures scan pollution to decide whether to evolve to 2Q."
  :inv () :adr ("ADR-0010" "ADR-0025") :ver (:test :bench) :fi ())
 (:id "REQ-CCH-002" :src "Cache and snapshots" :cls "C1" :stato :progettato
  :txt "The cache is version-aware: a reader never obtains a version incompatible with its snapshot."
  :inv ("INV-M3") :adr ("ADR-0025" "ADR-0044") :ver (:test :prop) :fi ())
 (:id "REQ-CCH-003" :src "Cache" :cls "C2" :stato :progettato
  :txt "The read path is request, Serie, snapshot and index, cache, segment."
  :inv () :adr ("ADR-0025") :ver (:test) :fi ())
 (:id "REQ-CCH-004" :src "ADR-0044" :cls "C1" :stato :progettato
  :txt "The cache is a pure accelerator: no invalidation, relabeling, or clearing; the system gives the same answers with the cache disabled; a failed check on cached data discards it and rereads from the segment without quarantine."
  :inv ("INV-A12" "INV-M3") :adr ("ADR-0044") :ver (:test :diff :corr) :fi ())

 ;; ---- Concurrency -----------------------------------------------------------
 (:id "REQ-CON-001" :src "Concurrency" :cls "C1" :stato :progettato
  :txt "There is one logical writer per Serie and many concurrent readers."
  :inv ("INV-P1") :adr ("ADR-0005") :ver (:test :model) :fi ())
 (:id "REQ-CON-002" :src "Concurrency" :cls "C1" :stato :progettato
  :txt "There is no global writer lock, permanent thread per Serie, or thread per request; every change to a Serie's state goes through its writer."
  :inv ("INV-P2" "INV-V4") :adr ("ADR-0005") :ver (:rev :analisi :test) :fi ())
 (:id "REQ-CON-003" :src "Parallelism" :cls "C3" :stato :progettato
  :txt "Independent Serie write in parallel; a burst on one Serie does not prevent writes, queries, or compaction on the others."
  :inv ("INV-P3") :adr ("ADR-0002") :ver (:bench :test) :fi ())
 (:id "REQ-THR-001" :src "Dynamic thread pool" :cls "C3" :stato :progettato
  :txt "A dynamic pool of reused workers adjusts worker count with EWMA, AIMD, and hysteresis, without continuously creating and destroying threads."
  :inv () :adr ("ADR-0011" "ADR-0017") :ver (:test :bench) :fi ())
 (:id "REQ-CON-005" :src "Parallelism" :cls "C1" :stato :progettato
  :txt "Parallelism is a foundational principle: between Serie there are no locks or shared writes per operation; what Serie share is a closed list with bounded cost, paid at most per batch, multiseries transaction, or snapshot; each mechanism declares what it serializes; reads, compaction, recovery, index rebuild, and queries proceed in parallel over their respective units."
  :inv ("INV-P6" "INV-P3") :adr ("ADR-0036" "ADR-0002" "ADR-0045") :ver (:rev :analisi :bench :test) :fi ())
 (:id "REQ-CON-004" :src "ADR-0045" :cls "C1" :stato :progettato
  :txt "Every unit of work is a run-to-completion task; a compute worker makes no blocking calls; every wait is parking on a list with maximum length and duration; a cache-miss read migrates to the I/O pool and restarts from the beginning."
  :inv ("INV-P5" "INV-A8") :adr ("ADR-0045") :ver (:test :rev :bench) :fi ())

 ;; ---- MVCC and snapshots -------------------------------------------------------
 (:id "REQ-MVC-001" :src "Snapshot / MVCC" :cls "C1" :stato :progettato
  :txt "A snapshot is a consistent logical view; a simple GET reads the current committed version."
  :inv ("INV-M1") :adr ("ADR-0020") :ver (:test :prop :diff) :fi ("FI-11"))
 (:id "REQ-MVC-002" :src "Snapshot / MVCC" :cls "C1" :stato :progettato
  :txt "A local transaction may use a Serie snapshot; a multiseries transaction may use an Archivio-wide consistent snapshot."
  :inv ("INV-V2") :adr ("ADR-0020" "ADR-0038") :ver (:test :model) :fi ("FI-12"))
 (:id "REQ-MVC-003" :src "Snapshot / MVCC" :cls "C1" :stato :progettato
  :txt "A snapshot prevents compaction from deleting versions it needs."
  :inv ("INV-M2") :adr ("ADR-0020") :ver (:test :fi) :fi ("FI-11"))
 (:id "REQ-MVC-004" :src "ADR-0020" :cls "C1" :stato :progettato
  :txt "A snapshot beyond its maximum duration is terminated and operations using it receive snapshot-too-old."
  :inv ("INV-A8") :adr ("ADR-0020") :ver (:test) :fi ())
 (:id "REQ-MVC-005" :src "ADR-0038" :cls "C1" :stato :progettato
  :txt "A snapshot with CSN s performs its first read only when the visibility horizon is at least s; two reads of the same document in the same snapshot give the same result; a snapshot created after commit acknowledgment sees that commit."
  :inv ("INV-M4" "INV-M1") :adr ("ADR-0038") :ver (:test :prop :model :fi) :fi ("FI-11" "FI-12"))
 (:id "REQ-MVC-006" :src "ADR-0038" :cls "C1" :stato :progettato
  :txt "A document's version is the CSN of the commit that produced it: expected-version is a CSN, is never reused, and does not restart after deletion; for each document, CSN order is version order."
  :inv ("INV-M5" "INV-T2") :adr ("ADR-0038") :ver (:test :diff :model) :fi ())
 (:id "REQ-MVC-007" :src "ADR-0038" :cls "C1" :stato :progettato
  :txt "The writer retains a replaced version when the snapshot registry threshold is below the new CSN; snapshot registration publishes the threshold before reading its own CSN, with a full memory barrier."
  :inv ("INV-M2") :adr ("ADR-0038") :ver (:test :model :soak) :fi ())
 (:id "REQ-MVC-008" :src "ADR-0046" :cls "C1" :stato :progettato
  :txt "The in-flight CSN registry has fixed capacity; CSN assignment and registration are indivisible with respect to horizon advancement; a slot is not reused until its CSN is published or canceled; when none are pending, H reaches the latest CSN, even if many completed commits overtook a slow commit."
  :inv ("INV-M4" "INV-M6" "INV-A8") :adr ("ADR-0046") :ver (:test :model :bench) :fi ())

 ;; ---- Recovery --------------------------------------------------------------
 (:id "REQ-REC-001" :src "Recovery" :cls "C1" :stato :progettato
  :txt "The Recovery Manager verifies logs, segment metadata, index metadata, atomic swap, segment state, transaction state, and multiserie.log."
  :inv ("INV-F1") :adr ("ADR-0018" "ADR-0033" "ADR-0037") :ver (:test :fi) :fi ("FI-01" "FI-06"))
 (:id "REQ-REC-002" :src "Recovery" :cls "C1" :stato :progettato
  :txt "After a crash, the system recovers Serie logs, rebuilds or verifies indexes, identifies segments, completes or rolls back incomplete compactions, processes multiserie.log, and completes prepared multiseries transactions."
  :inv ("INV-A7") :adr ("ADR-0018" "ADR-0021" "ADR-0040" "ADR-0041") :ver (:test :fi :soak) :fi ("FI-07" "FI-08" "FI-10"))
 (:id "REQ-REC-003" :src "Fault injection" :cls "C1" :stato :progettato
  :txt "No committed data are lost."
  :inv ("INV-D1") :adr ("ADR-0013" "ADR-0019" "ADR-0037") :ver (:fi :diff :soak) :fi ("FI-01" "FI-02" "FI-05" "FI-06" "FI-09" "FI-10"))
 (:id "REQ-REC-004" :src "Recovery" :cls "C1" :stato :progettato
  :txt "An incomplete atomic swap is recognizable during recovery."
  :inv ("INV-C7") :adr ("ADR-0018" "ADR-0040") :ver (:model :fi) :fi ("FI-06"))

 ;; ---- Local interface ---------------------------------------------------
 (:id "REQ-IPC-001" :src "ADR-0055" :cls "C2" :stato :progettato
  :txt "The default client interface uses a Unix stream socket with a configurable absolute path per instance; TCP is optional, later, and disabled by default, with no automatic fallback on local errors. Initial M16 integration follows startup, recovery, and admission and precedes query/TCP completion."
  :inv ("INV-N1") :adr ("ADR-0055") :ver (:test :rev) :fi ())
 (:id "REQ-IPC-002" :src "ADR-0055" :cls "C1" :stato :progettato
  :txt "Local transport uses u32-plus-CBOR frames, versioning, and multiplexed identifiers; it handles partial transfers and checks limits before allocation and admission. Connections, requests, buffers, and waits are bounded; slow clients neither retain EBR epochs nor block writers or compute workers."
  :inv ("INV-A8" "INV-P5" "INV-P6") :adr ("ADR-0029" "ADR-0045" "ADR-0048" "ADR-0055") :ver (:test :fuzz :model :bench :rev) :fi ())
 (:id "REQ-IPC-003" :src "ADR-0055" :cls "C2" :stato :progettato
  :txt "The local listener verifies path, runtime directory, owner, and restricted access before exposure; an occupied name fails without automatic removal at startup. Shutdown removes only the node still identified as its own in a protected directory; orphans require explicit intervention."
  :inv () :adr ("ADR-0055") :ver (:test :rev) :fi ())
 (:id "REQ-IPC-004" :src "ADR-0055" :cls "C1" :stato :progettato
  :txt "Acknowledgment on the local socket follows engine publication and durability; application traffic is admitted after recovery. Disconnection neither cancels decided commits nor repeats writes: a lost response means a potentially unknown outcome for the client, without implicit request-ID deduplication."
  :inv ("INV-D1" "INV-V1" "INV-V5" "INV-A11") :adr ("ADR-0037" "ADR-0041" "ADR-0055") :ver (:test :diff :model :fi :rev) :fi ("FI-01" "FI-02" "FI-05"))

 ;; ---- Observability, benchmarks, fault injection, native code, modules --------------
 (:id "REQ-OBS-001" :src "Observability" :cls "C3" :stato :progettato
  :txt "Request metrics are exposed: throughput, P50, P95, P99, P99.9."
  :inv () :adr ("ADR-0011") :ver (:test) :fi ())
 (:id "REQ-OBS-002" :src "Observability" :cls "C3" :stato :progettato
  :txt "The storage, log, index, cache, scheduler, and GC metrics listed in the specification are exposed."
  :inv () :adr ("ADR-0011") :ver (:test) :fi ())
 (:id "REQ-BEN-001" :src "Benchmark" :cls "C4" :stato :progettato
  :txt "Benchmarks are reproducible and, when comparing other systems, run with equivalent hardware, datasets, indexes, durability, concurrency, and semantics."
  :inv ("INV-X2") :adr ("ADR-0028") :ver (:bench :rev) :fi ())
 (:id "REQ-BEN-002" :src "Preliminary targets" :cls "C4" :stato :progettato
  :txt "Performance targets are hypotheses until verified; no superiority is claimed from heterogeneous benchmarks."
  :inv ("INV-X2") :adr ("ADR-0028") :ver (:rev) :fi ())
 (:id "REQ-FLT-001" :src "Fault injection" :cls "C1" :stato :progettato
  :txt "Fault-injection tests are implemented for the specification's twelve scenarios and for Serie creation."
  :inv () :adr ("ADR-0035") :ver (:fi) :fi ("FI-01" "FI-02" "FI-03" "FI-04" "FI-05" "FI-06" "FI-07" "FI-08" "FI-09" "FI-10" "FI-11" "FI-12" "FI-13"))
 (:id "REQ-SIM-001" :src "SIMD and native optimizations" :cls "C3" :stato :progettato
  :txt "The system uses compact structures and typed arrays; every measured hot path evaluates all SIMD variants safely usable on Linux x86-64 and macOS ARM64. Selection verifies CPU, operating system, and runtime; the scalar reference remains executable and forceable. Checks, valid windows, and error semantics remain unchanged; differential oracles and common benchmarks, run separately on each platform, demonstrate the adopted variant's correctness and usefulness; unsupported does not mean verification passed."
  :inv ("INV-X1") :adr ("ADR-0012" "ADR-0017" "ADR-0024" "ADR-0034") :ver (:test :rev :bench) :fi ())
 (:id "REQ-SIM-002" :src "ADR-0001" :cls "C4" :stato :progettato
  :txt "Project code is Common Lisp only."
  :inv ("INV-X3") :adr ("ADR-0001" "ADR-0027") :ver (:analisi :rev) :fi ())
 (:id "REQ-MOD-001" :src "Software modules" :cls "C2" :stato :progettato
  :txt "The system is organized into at least the specification's eighteen modules."
  :inv () :adr ("ADR-0031") :ver (:rev) :fi ())

 ;; ---- Formats ---------------------------------------------------------------
 (:id "REQ-VAL-001" :src "Spike plan" :cls "C4" :stato :implementato
  :txt "The Phase-0 suite compiles experiments without warnings in isolated processes, runs deterministic checks and separate benchmarks, and records every test and benchmark in structured form: parameters, commands, environment, revision, source hashes, results, limits, raw output, and failures. No spike outcome automatically promotes an engine requirement to verified."
  :inv ("INV-X2" "INV-X3") :adr ("ADR-0035") :ver (:test :analisi) :fi ())
 (:id "REQ-FOR-001" :src "ADR-0013" :cls "C1" :stato :progettato
  :txt "Every record and persistent file carries a length and CRC32C; what fails verification is treated as nonexistent (tail), regenerated (derived data), or declared corrupt (acknowledged data)."
  :inv ("INV-F1") :adr ("ADR-0013" "ADR-0014" "ADR-0039" "ADR-0052") :ver (:test :fuzz :corr :fi) :fi ("FI-01" "FI-10"))
 (:id "REQ-FOR-002" :src "ADR-0014" :cls "C1" :stato :progettato
  :txt "Every persistent file has a magic value and format version; a format does not change, a new version with migration is created."
  :inv ("INV-F1") :adr ("ADR-0014" "ADR-0052") :ver (:test :rev) :fi ())
 (:id "REQ-FOR-003" :src "ADR-0039" :cls "C1" :stato :progettato
  :txt "All records in all logs share the same 24-byte frame with header CRC and body CRC; the header is verified before lengths are used; body CRC is computed outside the writer."
  :inv ("INV-F1" "INV-F2") :adr ("ADR-0074" "ADR-0039" "ADR-0059" "ADR-0060") :ver (:test :fuzz :corr :bench :diff) :fi ())
 (:id "REQ-FOR-004" :src "ADR-0047" :cls "C1" :stato :progettato
  :txt "Reading a prepared record verifies authoritative segment proof (OUTCOME or manifest outcome): the proof TXID matches the record stamp and its CSN matches the entry's; missing, corrupt, or wrong-version proof produces an integrity error."
  :inv ("INV-A2" "INV-S7") :adr ("ADR-0039" "ADR-0047") :ver (:test :corr :fuzz :diff) :fi ())

 ;; ---- Document codec --------------------------------------------------
 (:id "REQ-CBR-009" :src "ADR-0014" :cls "C1" :stato :implementato
  :txt "Reading the first minimal CBOR MT2/3 string returns type and absolute payload range without copies; it checks the entire window's budget and UTF-8 for MT3, ignores the tail, and preserves the buffer for shared read-only use."
  :inv ("INV-A5" "INV-A8" "INV-P6") :adr ("ADR-0014" "ADR-0024" "ADR-0035" "ADR-0048")
  :ver (:test :diff :fuzz :bench :mut :rev) :fi ())
 (:id "REQ-CBR-008" :src "ADR-0014" :cls "C1" :stato :implementato
  :txt "Reading the first minimal structural CBOR item returns nodes, array/map depth, and absolute frontier without interpreting the tail; it first checks the entire window's limits, uses private scratch, and preserves the buffer for shared reads. Exact scanners remain separate; application semantics and the document profile remain open."
  :inv ("INV-A5" "INV-A8" "INV-P6") :adr ("ADR-0014" "ADR-0024" "ADR-0035" "ADR-0048")
  :ver (:test :diff :fuzz :bench :mut :rev) :fi ())
 (:id "REQ-CBR-007" :src "ADR-0014" :cls "C1" :stato :implementato
  :txt "CBOR tag composition verifies a single minimal structural content before writing the MT6 header and exact payload; budgets include the tag node without adding array/map depth, destination and scratch are private, and source is stable. Tag semantics and the document profile remain at the higher level."
  :inv ("INV-A5" "INV-A8" "INV-P6") :adr ("ADR-0014" "ADR-0024" "ADR-0035" "ADR-0048")
  :ver (:test :diff :fuzz :bench :mut :rev) :fi ())
 (:id "REQ-CBR-006" :src "ADR-0014" :cls "C1" :stato :implementato
  :txt "CBOR map composition verifies already encoded minimal structural keys and values before writing the MT5 header for the pair count and exact payload; budgets include the root, source and table are stable, and scratch is private. Key ordering and uniqueness remain the document profile's responsibility."
  :inv ("INV-F1" "INV-P6" "INV-A8") :adr ("ADR-0014" "ADR-0033" "ADR-0035" "ADR-0048")
  :ver (:test :diff :fuzz :bench :mut :rev) :fi ())
 (:id "REQ-CBR-005" :src "ADR-0014" :cls "C1" :stato :implementato
  :txt "CBOR array composition verifies all already encoded minimal items before writing the MT4 header and exact payload into the exclusive destination; byte, node, and depth budgets include the root, scratch is private, and source and table remain stable."
  :inv ("INV-F1" "INV-P6" "INV-A8") :adr ("ADR-0014" "ADR-0033" "ADR-0035" "ADR-0048")
  :ver (:test :diff :fuzz :bench :mut :rev) :fi ())
 (:id "REQ-CBR-004" :src "ADR-0014" :cls "C1" :stato :implementato
  :txt "CBOR float writing selects the smallest exact raw IEEE width, preserving sign, zero, infinity, and NaN significand; it checks range, words, and capacity before mutating the exclusive destination, with work bounded to nine bytes and a single NEXT."
  :inv ("INV-F1" "INV-P6") :adr ("ADR-0014" "ADR-0033" "ADR-0035" "ADR-0048")
  :ver (:test :diff :fuzz :bench :mut :rev) :fi ())
 (:id "REQ-CBR-003" :src "ADR-0014" :cls "C1" :stato :implementato
  :txt "CBOR MT7 simple-value writing emits wire code 0..23 or 32..255 in minimal representation into an exclusive destination; it checks range, reserved codes, and capacity before mutation, with work bounded to two bytes and a single NEXT."
  :inv ("INV-F1" "INV-P6") :adr ("ADR-0014" "ADR-0033" "ADR-0035" "ADR-0048")
  :ver (:test :diff :fuzz :bench :mut :rev) :fi ())
 (:id "REQ-CBR-002" :src "ADR-0014" :cls "C1" :stato :implementato
  :txt "CBOR MT2/3 string writing emits a minimal header and exact payload into an exclusive buffer; it checks range, full budget, capacity, overlap, and UTF-8 before mutation, with a stable source and bounded work."
  :inv ("INV-F1" "INV-P6" "INV-A8") :adr ("ADR-0014" "ADR-0033" "ADR-0035" "ADR-0048")
  :ver (:test :diff :fuzz :bench :mut :rev) :fi ())
 (:id "REQ-CBR-001" :src "ADR-0014" :cls "C1" :stato :implementato
  :txt "The CBOR argument-header writing primitive for MT0..6 uses minimal width and high/low big-endian u32 words; it checks arguments and capacity before modifying the caller's exclusive destination, with work bounded to nine bytes."
  :inv ("INV-F1" "INV-P6") :adr ("ADR-0014" "ADR-0033" "ADR-0035") :ver (:test :fuzz :rev :bench) :fi ())

 ;; ---- Reliability (critical software) --------------------------------------
 (:id "REQ-AFF-001" :src "ADR-0033" :cls "C1" :stato :progettato
  :txt "A write, flush, rename, or directory-sync error moves the Serie or Archivio to FAULTED without retry and without batch acknowledgment."
  :inv ("INV-A1") :adr ("ADR-0033") :ver (:test :fi) :fi ("FI-02"))
 (:id "REQ-AFF-002" :src "ADR-0033" :cls "C1" :stato :progettato
  :txt "Every record read from disk or cache is verified using header and body CRC32C and key and CSN (version) comparison before return; unverified data are never returned."
  :inv ("INV-A2") :adr ("ADR-0033" "ADR-0039") :ver (:test :corr :fuzz) :fi ())
 (:id "REQ-AFF-003" :src "ADR-0034" :cls "C4" :stato :implementato
  :txt "No product code is compiled with safety below 2; compilation is warning-free; prohibited constructs are detected by the linter."
  :inv ("INV-A3") :adr ("ADR-0034") :ver (:analisi) :fi ())
 (:id "REQ-AFF-004" :src "ADR-0033" :cls "C1" :stato :progettato
  :txt "Every error is a typed condition in the arcdocdb-error hierarchy and is never ignored; invariant assertions remain active and, in C1, move the Serie to FAULTED."
  :inv ("INV-A4") :adr ("ADR-0033" "ADR-0034") :ver (:analisi :rev :mut) :fi ())
 (:id "REQ-AFF-005" :src "ADR-0035" :cls "C4" :stato :verificato
  :txt "Every requirement has a source, class, and verification; every invariant and FI scenario is covered by at least one requirement; the matrix is generated and checked."
  :inv ("INV-A5") :adr ("ADR-0035") :ver (:analisi) :fi ())
 (:id "REQ-AFF-006" :src "ADR-0033" :cls "C1" :stato :progettato
  :txt "A scrubbing process verifies closed segments in a full cycle within 7 days and quarantines segments with errors."
  :inv ("INV-A6") :adr ("ADR-0033") :ver (:test :corr) :fi ())
 (:id "REQ-AFF-007" :src "ADR-0033" :cls "C1" :stato :progettato
  :txt "Recovery is idempotent: interrupting it at any point and rerunning it produces the same final state."
  :inv ("INV-A7") :adr ("ADR-0033" "ADR-0036") :ver (:model :fi :soak) :fi ("FI-01" "FI-06" "FI-07" "FI-08" "FI-10"))
 (:id "REQ-AFF-008" :src "ADR-0033" :cls "C1" :stato :progettato
  :txt "Every resource has a configured, enforced limit; exceeding it produces an explicit rejection; no loop is unbounded."
  :inv ("INV-A8") :adr ("ADR-0033" "ADR-0034") :ver (:test :rev) :fi ())
 (:id "REQ-AFF-009" :src "ADR-0037" :cls "C1" :stato :progettato
  :txt "Recovery distinguishes a tail from corruption using the durable frontier declared by SEALs: an anomaly below the frontier of a later valid SEAL moves the log to FAULTED without any write; otherwise valid length is the start of the first invalid batch. The rule applies to ACTIVE segments, control logs, and multiserie.log and does not depend on persistence order of unsynchronized writes."
  :inv ("INV-F1" "INV-F3" "INV-A1") :adr ("ADR-0033" "ADR-0037") :ver (:test :fi :corr :model) :fi ("FI-01" "FI-02"))
 (:id "REQ-AFF-010" :src "ADR-0033" :cls "C1" :stato :progettato
  :txt "An offline verifier opens an Archivio read-only, verifies formats, CRCs, and consistency between logs, segments, hints, indexes, multiserie.log, and catalog, and reports every anomaly."
  :inv ("INV-F1") :adr ("ADR-0033") :ver (:test :corr) :fi ())
 (:id "REQ-AFF-011" :src "ADR-0033" :cls "C1" :stato :progettato
  :txt "Opening an Archivio acquires an exclusive lock; a second open fails immediately."
  :inv () :adr ("ADR-0033") :ver (:test) :fi ())
 (:id "REQ-AFF-012" :src "ADR-0028" :cls "C3" :stato :progettato
  :txt "The system meets the binding minimum performance levels with all reliability checks active."
  :inv () :adr ("ADR-0028" "ADR-0031") :ver (:bench) :fi ())
 (:id "REQ-AFF-013" :src "ADR-0035" :cls "C1" :stato :progettato
  :txt "Time, randomness, scheduling, and I/O pass through injectable interfaces; the whole system runs in a deterministic simulator reproducible from a seed."
  :inv () :adr ("ADR-0035") :ver (:test :rev) :fi ())
 (:id "REQ-AFF-014" :src "ADR-0030" :cls "C1" :stato :progettato
  :txt "A consistent backup exists (closed segments, control log, and hints at a CSN), verifiable by the offline verifier; restore rejects a backup that fails verification."
  :inv ("INV-F1") :adr ("ADR-0030") :ver (:test :corr) :fi ())
 (:id "REQ-AFF-015" :src "ADR-0033" :cls "C1" :stato :progettato
  :txt "Serie and Archivio have defined health states (HEALTHY, DEGRADED, FAULTED, MULTI-DISABLED); every transition is a recorded event and a metric."
  :inv ("INV-A1") :adr ("ADR-0033") :ver (:test :model) :fi ())
 (:id "REQ-AFF-016" :src "ADR-0027" :cls "C4" :stato :progettato
  :txt "The system has no external dependencies beyond SBCL and its contrib modules."
  :inv ("INV-X3") :adr ("ADR-0027") :ver (:analisi) :fi ())
 (:id "REQ-AFF-017" :src "ADR-0036" :cls "C1" :stato :progettato
  :txt "Recovery neither modifies nor truncates any existing segment: it closes the discovered ACTIVE at its valid length with a manifest record and opens a new one; its per-Serie atomicity point is renaming the compacted control log."
  :inv ("INV-A9" "INV-A7") :adr ("ADR-0036" "ADR-0037" "ADR-0040") :ver (:test :model :fi :soak) :fi ("FI-01" "FI-02" "FI-10"))
 (:id "REQ-AFF-018" :src "ADR-0036" :cls "C1" :stato :progettato
  :txt "A file or directory is deleted only if it has a tmp suffix and no source of truth names it, or if a source of truth records its removal; an unknown object with a definitive name is left untouched and reported; a segment-id named by the manifest is never reused."
  :inv ("INV-A10") :adr ("ADR-0036" "ADR-0040") :ver (:test :fi :corr) :fi ("FI-09" "FI-13"))
 (:id "REQ-AFF-019" :src "ADR-0036" :cls "C1" :stato :progettato
  :txt "Every operation changing durable state has a single atomicity point (SEAL, EDIT, DECISION, catalog document); what precedes it is discardable and what follows is idempotent completion repeated by recovery."
  :inv ("INV-A11" "INV-A7") :adr ("ADR-0036" "ADR-0040") :ver (:model :fi :rev) :fi ("FI-06" "FI-07" "FI-08" "FI-13"))
 (:id "REQ-LIM-001" :src "ADR-0048" :cls "C1" :stato :progettato
  :txt "The uncompressed CBOR document allows an effective 16 MiB excluding header and key; v2 uses u16 key-len, u32 record length, and five-word slots, without interpreting v1 as v2."
  :inv ("INV-F1" "INV-A8") :adr ("ADR-0048") :ver (:test :fuzz :corr :fi) :fi ("FI-01"))
 (:id "REQ-LIM-002" :src "ADR-0048" :cls "C2" :stato :progettato
  :txt "The decoder limits CBOR containers to 100 levels with the root at level 1 and applies explicit budgets before the writer."
  :inv ("INV-A8") :adr ("ADR-0048") :ver (:test :fuzz :rev) :fi ())
 (:id "REQ-LIM-003" :src "ADR-0048" :cls "C1" :stato :progettato
  :txt "Binary keys allow 1..65535 bytes; arenas, copies, and migrations have budgets and do not acknowledge incomplete operations; migration preserves sources and atomicity."
  :inv ("INV-A8" "INV-A11") :adr ("ADR-0048") :ver (:test :fi :bench :rev) :fi ("FI-06"))
)
