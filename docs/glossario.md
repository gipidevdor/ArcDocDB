<a id="glossario"></a>

# Glossary

<a id="convenzione-linguistica"></a>
## Language convention

- Documentation is written in **American English**. Established **domain names** retain
  their Italian spelling for continuity with the specification and code:
  `archivio`, `serie`, `documento`, `registri`, `multiserie`.
- **Serie** is invariant: one Serie, several Serie. Code uses `serie` for both
  singular and plural; use an explicit collection name such as `serie-table` when needed.
- Established technical terms use English: WAL, segment, snapshot, commit, flush,
  group commit, compaction, reclaim, swap, writer, reader, worker.
- Specification state and operation names use uppercase: `ACTIVE`, `CLOSED`,
  `OBSOLETE`, `RECLAIMABLE`, `DELETED`; `LIVE`, `SNAPSHOT-LIVE`, `DEAD`; CLEAN, MERGE.

<a id="modello-logico"></a>
## Logical model

| Term | Definition |
|---|---|
| **Server** | Main process: connections, global scheduler, thread pool and Archivio management. |
| **Archivio** | Logical container for several Serie; the level at which multiseries transactions and snapshots are requested. |
| **Serie** | Document namespace; primary unit of storage and parallelism. Owns its WAL, segments and indexes. |
| **Documento** | Logical data unit, identified by an `_id` unique within its Serie. |
| **`_id`** | Document identifier, unique within the Serie. |
| **Registri** | Required special Serie in every Archivio: catalog and `multiserie.log`. It is not the data WAL. |
| **Catalog** | Serie metadata database, stored under `Registri/catalog/`. |
| **Contract** | What a Serie defines for its documents: schema, validation, indexes and storage configuration. |

## Storage

| Term | Definition |
|---|---|
| **Append-only** | Written records are not modified; every change is a new record. |
| **Segment** | File containing a Serie's records. Target size is about 256 MB when created by the writer. |
| **ACTIVE** | The only writable segment of a Serie. |
| **CLOSED** | Immutable segment in use. |
| **OBSOLETE** | Segment replaced by compaction, still readable by readers and snapshots that were already active. |
| **RECLAIMABLE** | Segment no longer used by anyone and eligible for deletion. |
| **DELETED** | Deleted segment. |
| **Segment metadata** | Segment counters and times; derived, reconstructible data. |
| **Tombstone** | Record marking a document deletion. |
| **Location** | Position of a version: segment-id, offset, length, version. The version is its CSN (ADR-0038). |
| **LIVE** | Version reachable from the current index. |
| **SNAPSHOT-LIVE** | Version no longer current but required by an active snapshot. |
| **DEAD** | Version unreachable from both the current index and active snapshots. |
| **Manifest** | Authoritative record of a Serie's segment set: its control log (ADR-0018, ADR-0040). |

## Compaction

| Term | Definition |
|---|---|
| **Compaction** | General term covering CLEAN and MERGE. |
| **CLEAN** | One source segment → one new segment containing only required records. Reclaims dead space. |
| **MERGE** | N small segments → one new segment. Reduces fragmentation. Opportunistic. |
| **Copy-on-write** | The result is a new file; source files are untouched. |
| **Atomic swap** | Atomic transition of readers from the old index or segment version to the new one. |
| **Reclaim** | Deletion of a segment that is no longer referenced. |
| **Stability** | Time since a segment was closed or stabilized; at least 50 s for MERGE. |
| **Low load** | Engine condition assessed by the Compaction Scheduler and required to start a MERGE. |

<a id="log-e-transazioni"></a>
## Logs and transactions

| Term | Definition |
|---|---|
| **WAL** | Write-ahead log; one per Serie. |
| **Group commit** | Several transactions share one flush operation. |
| **Durability** | Guarantee that acknowledged data survives a crash; available at multiple levels (QA-05). |
| **`multiserie.log`** | Archivio transaction decision log: COMMIT/ABORT decisions for multiseries transactions. Contains no document data. |
| **Single-Serie transaction** | Changes documents in one Serie and uses only that Serie's WAL. |
| **Multiseries transaction** | Changes documents in several Serie using a 2PC-like protocol. |
| **TXID** | Transaction identifier, shared by all changes of one multiseries transaction. |
| **PREPARE** | First 2PC phase: a participant durably records its ability to commit. |
| **Commit point** | Point at which the COMMIT decision is durable in `multiserie.log`. |
| **Optimistic version checking (OCC)** | At commit, verify that the version read is still current; otherwise report a conflict. |
| **Expected-version** | Version expected by the transaction at commit: a CSN; zero means the document must not exist (ADR-0038). |

<a id="concorrenza"></a>
## Concurrency

| Term | Definition |
|---|---|
| **Logical writer** | The only execution flow mutating a Serie at a given time; it is not a dedicated thread. |
| **Reader** | An ongoing read operation; it may run concurrently with a writer and compaction. |
| **Worker** | Thread in the dynamic pool. |
| **Snapshot** | Consistent logical view at a point or version; not a physical copy. |
| **MVCC** | Multi-version concurrency control: readers observe versions rather than locks. |
| **EWMA / AIMD / hysteresis** | Exponentially weighted moving average / additive increase and multiplicative decrease / separate rising and falling thresholds: dynamic control tools. |
| **Scan pollution** | Cache degradation caused by scans evicting frequently used data. |

<a id="termini-introdotti-dalle-decisioni-di-progetto"></a>
## Terms introduced by design decisions

| Term | Definition |
|---|---|
| **Control log** | `wal/control.log`: the Serie manifest, a sequence of EDIT records. ADR-0013, ADR-0018, ADR-0040. |
| **CSN** | Commit Sequence Number: Archivio counter ordering commits and defining visibility. ADR-0020. |
| **Hint file** | Primary index for a closed segment, used to rebuild the in-memory index. ADR-0015. |
| **Key arena** | *(withdrawn)* One shared key area for a Serie (ADR-0015), replaced by each fragment's local key area (ADR-0043). |
| **Retained versions** | Table of versions no longer current but still visible to a snapshot. ADR-0015, ADR-0038. |
| **Seqlock** | Per-slot counter supporting reads without locks and detecting concurrent writes. ADR-0032. |
| **EBR** | Epoch-based reclamation: delete a removed segment after every reader has passed its removal epoch. Governs descriptors and files only. ADR-0016, ADR-0043. |
| **Intent** | Prepared, undecided change to a document in a multiseries transaction. ADR-0021. |
| **OUTCOME** | Record storing a multiseries COMMIT and its CSN in the same segment as the prepared records. ADR-0021, ADR-0041. |
| **Presumed abort** | Without a durable COMMIT decision, the transaction is aborted; an abort writes no record. ADR-0021, ADR-0041. |
| **Lineage** | *(withdrawn)* Smallest segment-id among a segment's ancestors (ADR-0023). Its rule was unsafe and was replaced by the existence filter (ADR-0042). |
| **Load state** | `basso` / `normale` / `alto`, meaning low / normal / high: governs CLEAN and MERGE. ADR-0023. |
| **Conditional relocation** | Index entry update after compaction, applied only if the entry still points at the source location. ADR-0015. |

<a id="ricerca-full-text"></a>
## Full-text search

Terminology from [ADR-0053](adr/0053-ricerca-full-text-indici-invertiti.md),
an approved v1 requirement with implementation planned for phase 8.

| Term | Definition |
|---|---|
| **Full text** | Word and phrase search over declared text fields, combined with structured filters in the same snapshot view. |
| **Analyzer / analysis profile** | Immutable, versioned normalization, case-folding and segmentation rules, identical for documents and queries. |
| **Inverted index** | Dictionary per field and term, with posting lists of rows, frequencies and positions; derived from committed documents. |
| **Posting** | Candidate reference to a row in the same segment; resolve key, outcome and visible version before returning the document. |
| **Position** | Token ordinal within a field; consecutive positions support phrases without crossing field boundaries. |
| **Index generation** | Build and profile identity pinned by a query; an analyzer change builds a new generation without mixing generations. |
| **Readiness / coverage** | Derived state allowing an index to be used only when it fully covers the requested view; incomplete or corrupt data does not mean an empty result. |

<a id="termini-introdotti-dallanalisi-progettuale"></a>
## Terms introduced by the design analysis

| Term | Definition |
|---|---|
| **Unit of parallelism** | What progresses without waiting for its peers: Archivio, Serie, reader, batch, segment, fragment. Parallelism is the foundational design principle. ADR-0036. |
| **Closed list** | The only elements shared by Serie, with stated cost and frequency; none is paid per operation. ADR-0036. |
| **Atomicity point** | The single durable record deciding an operation: discardable preparation precedes it, idempotent completion follows it. ADR-0036. |
| **Prepare, decide, complete** | Order of every durable operation: `.tmp` object, record in the source of truth, file-system alignment. ADR-0036. |
| **Batch** | A log's unit of atomicity, durability and publication: records followed by a SEAL. ADR-0037. |
| **SEAL** | Record closing a batch and fixing its file, position, record count, contents, CSN and durable frontier. ADR-0037, ADR-0039. |
| **Durable frontier** | Position through which a log was durable when a batch closed; stored in the SEAL, distinguishing a tail from corruption. ADR-0037. |
| **Valid length** | Closed segment extent recorded in the manifest; later bytes are not part of the segment. ADR-0040. |
| **Pending versions** | Written but unpublished versions, including batches awaiting flush and multiseries intents; visible only to the writer. ADR-0037. |
| **Visibility horizon** | Largest CSN below which every commit is published; a snapshot is born when the horizon reaches it. ADR-0038. |
| **In-flight CSN** | A CSN already taken whose commit is not yet published. ADR-0038. |
| **In-flight CSN register** | Fixed-capacity vector; allocation and registration are indivisible. H is the smallest pending CSN minus one, or the last CSN when empty. Replaces the ADR-0038 ring. ADR-0046. |
| **Threshold** | Minimum CSN among active snapshots, published by the snapshot register; the writer retains a version if the threshold is below the new CSN. ADR-0038. |
| **Frame** | Common 24-byte header for every record in every log, with header and body CRCs. ADR-0039. |
| **EDIT** | The only control-log record type: opens, closes and removes segments. ADR-0040. |
| **DECISION** | The only `multiserie.log` record type: a transaction COMMIT with its CSN and participants. ADR-0041. |
| **Self-contained segment** | Closed segment interpretable on its own: each prepared record's outcome is in the segment or its closing record. ADR-0041. |
| **Existence filter** | Bloom section in the hint file over segment keys; determines when a tombstone can be discarded. ADR-0039, ADR-0042. |
| **Fragment** | Fixed-capacity Swiss table with its own keys; the primary index is a directory of fragments. ADR-0043. |
| **Task** | Work unit executed by a worker from start to finish without suspension. ADR-0045. |
| **Parking** | Wait implemented by recording a request context in a bounded list without occupying a worker. ADR-0045. |
| **Migration** | Transfer of a read from the compute pool to the I/O pool, restarting from the beginning. ADR-0045. |

<a id="affidabilità"></a>
## Reliability

| Term | Definition |
|---|---|
| **Integrity class** | C1 data path, C2 functional correctness, C3 resource control, C4 tools. ADR-0031. |
| **Fail-stop** | On an unrecoverable fault, the component stops rather than continuing with uncertain state. ADR-0033. |
| **HEALTHY / DEGRADED / FAULTED** | Serie health states; `MULTI-DISABLED` applies to the Archivio. ADR-0033. |
| **Quarantine** | State of a segment whose data cannot be verified: neither read nor compacted. ADR-0033. |
| **Verification on read** | Check header and body CRC32C, key and CSN before returning a record. ADR-0033, ADR-0039. |
| **Scrubbing** | Periodic reread of closed segments to detect latent corruption. ADR-0033. |
| **Resynchronization scan** | Search for valid SEAL records after a log anomaly; their durable frontier distinguishes a tail from corruption. ADR-0033, ADR-0037. |
| **Offline verifier** | `arcdocdb-verify`: read-only verification of an Archivio's formats, CRCs and consistency. ADR-0033. |
| **Deterministic simulator** | System execution with simulated time, randomness, scheduling and I/O, reproducible from a seed. ADR-0035. |
| **Differential test** | Same operation sequence on the engine and a reference model; results must match. ADR-0035. |
| **Deviation** | Recorded and approved departure from a coding rule. |

<a id="identificativi-della-documentazione"></a>
## Documentation identifiers

| Prefix | Meaning | Location |
|---|---|---|
| `INV-` | Invariant | [invarianti.md](invarianti.md) |
| `QA-` | Open question | [questioni-aperte.md](questioni-aperte.md) |
| `FI-` | Fault-injection scenario | [14-fault-injection.md](14-fault-injection.md) |
| `M01…M18` | Software module | [16-moduli.md](16-moduli.md) |
| `ADR-` | Architecture decision | [adr/](adr/README.md) |
| `RSK-` | Risk | [valutazione/registro-rischi.md](valutazione/registro-rischi.md) |
| `SPK-` | Evaluation spike | [valutazione/piano-spike.md](valutazione/piano-spike.md) |
| `REQ-` | Traced requirement | [tracciabilita/requisiti.lisp](tracciabilita/requisiti.lisp) |
| `FM-` | Failure mode | [affidabilita/analisi-dei-guasti.md](affidabilita/analisi-dei-guasti.md) |
| `COD-` | Coding rule | [affidabilita/standard-di-codifica.md](affidabilita/standard-di-codifica.md) |
| `DEV-` / `COV-` | Deviation / coverage exception | [affidabilita/deviazioni.md](affidabilita/deviazioni.md) |
| `AP-` | Design-analysis finding | [analisi-progettuale.md](analisi-progettuale.md) |
