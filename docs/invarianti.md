<a id="invarianti"></a>

# Invariants

Rules that no implementation, optimization, or later decision may violate without an
explicit specification change (ADR). They derive from the ‘Fundamental architectural principles’,
the invariants in the ‘Fault injection’ section, and normative rules in individual sections of the
[specification](specifica/specifica-originale.md).

Every invariant has a stable identifier. The **Verification** column indicates how compliance
is checked: [fault-injection](14-fault-injection.md) scenarios (`FI-…`), tests,
design review, or benchmarks.

## Storage

| ID | Invariant | Source | Verification |
|---|---|---|---|
| INV-S1 | Storage is append-only: records already written to segments are never modified in place. | Storage append-only | test, review |
| INV-S2 | There is exactly one `ACTIVE` segment per Serie. | Storage append-only | test, recovery |
| INV-S3 | Only the `ACTIVE` segment is writable. | Segments | test |
| INV-S4 | `CLOSED`, `OBSOLETE`, and `RECLAIMABLE` segments are always immutable; a segment never returns to `ACTIVE` or reopens for writing. | Storage append-only, Segments | test |
| INV-S5 | New writes always go to a new `ACTIVE` segment; records are never appended to a segment produced by compaction. | Segments | test |
| INV-S6 | Segment metadata are derived data: they are not the sole source of truth and must be rebuildable, verifiable, and correctable from WAL, data, and index. | Segment metadata | FI-10, test |

## Compaction

| ID | Invariant | Source | Verification |
|---|---|---|---|
| INV-C1 | CLEAN: 1 source segment → 1 new immutable segment containing only live/required records. | Clean | test |
| INV-C2 | MERGE: N segments → 1 new immutable segment. | Merge | test |
| INV-C3 | CLEAN and MERGE are copy-on-write: they never modify source segments. | Clean, Merge | FI-07, FI-08 |
| INV-C4 | Segments produced by compaction have no size requirements; MERGE is not automatic after CLEAN; a cleaned segment may remain small indefinitely. | Segments, Merge | policy test |
| INV-C5 | MERGE only on segments stable for at least 50 seconds (since closure/stabilization). | Mandatory conditions for Merge | policy test |
| INV-C6 | MERGE only when engine load is low; it must not compete with user traffic. | Low-load merge policy | policy test, benchmark |
| INV-C7 | A new segment does not become visible as definitive before its data are durable. | Recovery | FI-06 |
| INV-C8 | A source segment remains recoverable until the swap completes. | Fault injection (5) | FI-06, FI-07, FI-08 |
| INV-C9 | An interrupted compaction is repeatable or completable during recovery. | Fault injection (6) | FI-07, FI-08 |
| INV-C10 | Compaction does not globally block reads; already active readers finish on old segments. | Readers during compaction | concurrency test, benchmark |

## Reclaim

| ID | Invariant | Source | Verification |
|---|---|---|---|
| INV-R1 | A segment is deleted only when no current index, snapshot, active transaction, or reader references or uses it. | Index/Snapshot/Reclaim; Fault injection (3) | FI-09, FI-11 |

<a id="wal-e-log"></a>

## WAL and logs

| ID | Invariant | Source | Verification |
|---|---|---|---|
| INV-W1 | Each Serie has an independent WAL and is physically independent of others; there is no global data WAL. | WAL, Physical layout | review |
| INV-W2 | There is one `Registri/multiserie.log` per Archivio; there is no per-transaction file. | Special Serie Registri | review |

<a id="transazioni-e-durability"></a>

## Transactions and durability

| ID | Invariant | Source | Verification |
|---|---|---|---|
| INV-D1 | No committed data are lost. | Fault injection (1) | FI-01, FI-02, FI-05, FI-06, FI-09, FI-10 |
| INV-T1 | A single-Serie transaction uses only the Serie WAL and does not write to `multiserie.log`. | Single-Serie transactions | test |
| INV-T2 | Expected-version checking is atomic with respect to the Serie writer applying the change. | Single-Serie transactions | concurrency test |
| INV-T3 | A multiseries transaction is committed only when the `COMMIT` decision is durable in `multiserie.log`. | Multiseries transactions | FI-04, FI-05 |
| INV-T4 | No multiseries transaction is partially committed. | Fault injection (2) | FI-03, FI-04, FI-05, FI-12 |
| INV-T5 | All changes in a multiseries transaction share a single TXID. | Multiseries transactions | FI-12 |

<a id="mvcc-e-snapshot"></a>

## MVCC and snapshots

| ID | Invariant | Source | Verification |
|---|---|---|---|
| INV-M1 | No snapshot observes an inconsistent version: its view remains that of its creation point until it ends. | Snapshot/MVCC; Fault injection (4) | FI-11, concurrency test |
| INV-M2 | A snapshot prevents compaction from deleting versions it needs. | Snapshot/MVCC | FI-11 |
| INV-M3 | The cache is version/epoch-aware: it does not return a version incompatible with the reader's snapshot. | Cache and snapshots | concurrency test |

<a id="indici"></a>

## Indexes

| ID | Invariant | Source | Verification |
|---|---|---|---|
| INV-I1 | Indexes are immutable for readers; updates become visible through atomic swap and previous readers finish on the old version. | Index snapshot | concurrency test, FI-06 |
| INV-I2 | The per-segment Bloom filter indicates only ‘definitely absent / possibly present’; it is never the definitive location structure. | Secondary index | review, test |
| INV-I4 | A full-text query uses one generation and one analysis profile per index, with complete coverage of the requested view; results and filters belong to the same visible committed document version. A missing, corrupt, or incomplete derivative produces an explicit error, never an empty or incomplete result declared correct. | [ADR-0053](adr/0053-ricerca-full-text-indici-invertiti.md) | comparison with scan, snapshots and concurrent updates, corruption, rebuild, and restart (checks to implement) |
| INV-I5 | A full-text index is usable only with the exact Serie, segment, generation, configuration, valid length, and hint for which it was built; rows are not reinterpreted against a different hint. | [ADR-0054](adr/0054-contratto-e-formato-full-text.md) | independent fixtures, swapped hints, alterations with valid CRC, rebuild (to implement) |
| INV-I6 | Delta capacity, prepared buffers, and the upper bound of the future full-text index are reserved before SEAL/PREPARE; a READY proposal is published only if covered inventory and frontiers match the Serie view at swap time. | [ADR-0054](adr/0054-contratto-e-formato-full-text.md) | saturation, writer during build, concurrent rotation and compaction, crash before/after publication (to implement) |
| INV-I7 | Index mode is selected automatically within the Serie quota; no switch admits new work beyond budget or publishes an incomplete view. Transient memory includes retained source, destination, delta, and metadata. Return to resident mode has hysteresis and changes neither commit decisions nor snapshots. | [ADR-0057](adr/0057-selezione-automatica-indice.md) | selector tests; migration, fault injection, and runtime qualification to implement |
| INV-I8 | A derived page is used only after verifying identity, version, checksum, and local structure; PageRefs are null or point to earlier children in the same image. A bucket does not hide entries behind an EMPTY group; keys and metadata respect v2 limits. Local verification certifies neither committed coverage nor root durability. Adopting an image also requires a canonical source, entry uniqueness/coverage, and complete read-only verification under [ADR-0063](adr/0063-immagini-sigillate-indice-primario.md); the [M1 builder](adr/0065-costruzione-immagini-dal-motore.md) fully verifies the derivative before success; M1 integration retires the derivative before admitted writes except for the [explicit serial delta](adr/0067-delta-seriale-indice-m1.md), which routes every touched key to the canonical resident index ([ADR-0064](adr/0064-adozione-indice-paginato-m1.md)); [ADR-0066](adr/0066-attivazione-seriale-immagini-m1.md) allows verified serial activation and FD closure on retirement without concurrent borrowers; [ADR-0068](adr/0068-rinnovo-seriale-immagini-m1.md) combines construction and activation under one admission with source rechecking; [ADR-0070](adr/0070-scoperta-readonly-immagini-m1.md) allows bounded candidate discovery at startup, with mandatory full verification before READY. | [ADR-0058](adr/0058-pagine-indice-primario.md) | independent fixtures, alterations with valid CRC, collisions, truncation, graph coverage, and serial M1 integration; catalog and concurrent swap to implement |

<a id="concorrenza-e-priorità"></a>

## Concurrency and priorities

| ID | Invariant | Source | Verification |
|---|---|---|---|
| INV-P1 | One logical writer per Serie; many concurrent readers. | Concurrency | review, test |
| INV-P2 | No global writer lock, permanent thread per Serie, or thread per request. | Concurrency | review |
| INV-P3 | Serie have load isolation: traffic on one Serie does not prevent writes, queries, or controlled compaction on others. | Parallelism | benchmark (burst) |
| INV-P4 | Priorities: user traffic > WAL/durability > necessary CLEAN > opportunistic MERGE. | Dynamic compaction scheduler | benchmark, policy test |

<a id="interfacce"></a>

## Interfaces

| ID | Invariant | Source | Verification |
|---|---|---|---|
| INV-N1 | The default client interface is a local Unix stream socket; TCP requires explicit activation and is never an automatic fallback on local error. | [ADR-0055](adr/0055-interfaccia-locale-unix-socket.md) | default configuration, unavailable socket, no implicit TCP listener or attempt (tests to implement) |

<a id="metodo"></a>

## Method

| ID | Invariant | Source | Verification |
|---|---|---|---|
| INV-X1 | Every measured hot path evaluates all SIMD variants safely usable on the agreed platforms; only variants useful according to benchmarks are adopted, with CPU/OS/runtime selection, executable and forceable scalar reference, unchanged checks and semantics. | SIMD and native optimizations, [ADR-0012](adr/0012-simd-guidato-dai-benchmark.md) | review, differential tests and benchmarks per platform (qualification incomplete) |
| INV-X2 | Performance targets remain hypotheses until verified by reproducible benchmarks; no superiority claims from heterogeneous benchmarks. | Preliminary targets, Comparison | review |
| INV-X3 | Project code is Common Lisp only until an ADR reopens foreign-code use; this also applies to verification models and tools (no TLA+ or equivalent for now). | [ADR-0001](adr/0001-common-lisp-sbcl.md) (decision of 2026-10-01) | review |

<a id="derivati-dalle-decisioni-di-progetto-adr-00130030"></a>

## Derived from design decisions (ADR 0013–0030)

| ID | Invariant | Source | Verification |
|---|---|---|---|
| INV-F1 | Every record and persistent file carries a length and CRC32C; what fails verification is treated as nonexistent (tail), regenerated (derived data), or declared corrupt (acknowledged data). | [ADR-0013](adr/0013-log-structured-segmento-active-come-log.md), [ADR-0014](adr/0014-formato-record-documento-id.md), [ADR-0039](adr/0039-cornice-unica-dei-record.md) | FI-01, FI-02, FI-10 |
| INV-V1 | With `:group` or `:strong` durability, no reader sees a version before it is durable. | [ADR-0019](adr/0019-durability-e-group-commit-pipelined.md) | FI-01, FI-02 |
| INV-V2 | A snapshot sees all or none of a multiseries transaction: its CSN stays outside the visibility horizon until applied on all participants, and a snapshot is created only when the horizon has reached it (INV-M4). | [ADR-0020](adr/0020-csn-snapshot-isolamento.md), [ADR-0038](adr/0038-orizzonte-di-visibilita.md), [ADR-0041](adr/0041-multiserie-segmenti-autosufficienti.md) | FI-12, SPK-07 model |
| INV-V3 | Compaction relocation updates an index entry only if it still points to the source location; it never overwrites a newer version. | [ADR-0015](adr/0015-primary-index-swiss-table-swmr.md) | FI-06, concurrency test |
| INV-V4 | Every change to a Serie's state (index, intents, retained versions, deltas, counters, control log) is applied by the Serie's logical writer. | [architecture](architettura.md#contratti) | review |

<a id="affidabilità-adr-00310035"></a>

## Reliability (ADR-0031…0035)

| ID | Invariant | Source | Verification |
|---|---|---|---|
| INV-A1 | A write, flush, rename, or directory-sync error is never retried or ignored: the Serie (or Archivio, for `multiserie.log` and Registri) enters `FAULTED` and no operation in the batch is acknowledged. | [ADR-0033](adr/0033-fail-stop-e-integrita-end-to-end.md) | simulator with I/O errors; FI-02 |
| INV-A2 | Every record read from disk or cache is verified (header and body CRC32C, key and CSN matching the index; CSN is the version) before return; unverified data never leave the engine. | [ADR-0033](adr/0033-fail-stop-e-integrita-end-to-end.md), [ADR-0039](adr/0039-cornice-unica-dei-record.md) | deliberate corruption, fuzzing, in-memory bit flip |
| INV-A3 | No product code is compiled with `safety` below 2; type and bounds checks are always active; `truly-the` is prohibited. | [ADR-0034](adr/0034-policy-di-compilazione-e-standard-di-codifica.md) | `make lint`, warning-free compilation |
| INV-A4 | No error is silent: every error condition has a declared type, is handled or propagated; `ignore-errors` is prohibited; invariant assertions remain active in production and, in C1, move the Serie to `FAULTED`. | [ADR-0033](adr/0033-fail-stop-e-integrita-end-to-end.md), [ADR-0034](adr/0034-policy-di-compilazione-e-standard-di-codifica.md) | `make lint`, review, mutation testing |
| INV-A5 | Every requirement has an identifier, source, class, and verification method; every invariant and fault-injection scenario is covered by at least one requirement; the matrix is generated and checked. | [ADR-0035](adr/0035-strategia-di-verifica-e-tracciabilita.md) | `make trace` |
| INV-A6 | Closed segments are periodically verified (scrubbing) against CRC, hints, indexes, and control log; each full cycle completes within 7 days; an error quarantines the segment before use. | [ADR-0033](adr/0033-fail-stop-e-integrita-end-to-end.md) | scrubber test, metric |
| INV-A7 | Recovery is idempotent: interrupting it at any point and rerunning it produces the same final state. | [ADR-0033](adr/0033-fail-stop-e-integrita-end-to-end.md) | interruption at every point in the simulator |
| INV-A8 | Every resource has a configured, enforced limit (queues, buffers, requests, connections, snapshots, attempts, recursion, memory); exceeding it produces an explicit rejection, never undefined degradation; no loop is unbounded. | [ADR-0033](adr/0033-fail-stop-e-integrita-end-to-end.md), [ADR-0032](adr/0032-seqlock-a-64-bit.md) | saturation test, review |

<a id="derivati-dallanalisi-progettuale-adr-00360045"></a>

## Derived from the design analysis (ADR 0036–0045)

| ID | Invariant | Source | Verification |
|---|---|---|---|
| INV-F2 | A batch is atomic: it is valid in full — its SEAL fixes file, position, record count, and contents — or does not exist; no record from an invalid batch is ever applied. A non-prepared record is committed if and only if it is in a valid batch. | [ADR-0037](adr/0037-lotto-sigillato.md), [ADR-0039](adr/0039-cornice-unica-dei-record.md) | FI-01, FI-02, fuzzing, deliberate corruption |
| INV-F3 | Tail or corruption is decided from log contents: each SEAL carries the durable frontier known at batch closure; an anomaly below the frontier declared by a later valid SEAL is corruption (fail-stop, no writes), otherwise it is a tail. The decision does not depend on the order in which media persist unsynchronized writes. | [ADR-0037](adr/0037-lotto-sigillato.md) | FI-01, FI-02 with unordered persistence, SPK-07 model |
| INV-V5 | A write is acknowledged only after publication and, with `:group` or `:strong`, only after becoming durable: every subsequent read sees it after acknowledgment. Applies to single-Serie and multiseries transactions. | [ADR-0037](adr/0037-lotto-sigillato.md), [ADR-0041](adr/0041-multiserie-segmenti-autosufficienti.md) | differential test, FI-05, FI-12 |
| INV-M4 | A snapshot with CSN `s` performs its first read only when the visibility horizon is ≥ `s`: every commit with CSN ≤ `s` has already been published or canceled, and none can appear later. | [ADR-0038](adr/0038-orizzonte-di-visibilita.md) | SPK-07 model, property tests in simulator, FI-11 |
| INV-M5 | For each document, CSN order matches version order; the CSN identifies the version, is the expected-version value, and is never reused, even after document deletion. | [ADR-0038](adr/0038-orizzonte-di-visibilita.md) | SPK-07 model, differential test |
| INV-M6 | Every assigned CSN not yet published or canceled occupies an exclusive slot in the bounded in-flight CSN registry; assignment and registration are indivisible with respect to H advancing. No slot is reused before its CSN completes. When the registry is empty, H reaches the latest assigned CSN, regardless of the distance from the first pending one. | [ADR-0046](adr/0046-orizzonte-con-registro-limitato.md) | ring counterexample and registry model in SPK-07 |
| INV-S7 | A `CLOSED` segment is self-contained: a prepared record in it is committed if and only if its outcome is in the same segment or the manifest record closing it; every other prepared record is aborted. Rotation waits until the Serie has no pending intents. | [ADR-0041](adr/0041-multiserie-segmenti-autosufficienti.md) | FI-03, FI-05, FI-12, SPK-07 model |
| INV-C11 | A tombstone is discarded only if superseded by a newer durable version, or if no version of the key is retained and no other segment can contain an older record for that key. The primary index contains only live documents and rebuilding it (maximum CSN per key) is independent of segment order: no deleted document reappears. | [ADR-0042](adr/0042-tombstone-e-indice-dei-vivi.md) | property tests with nonadjacent MERGEs and restarts, FI-07, FI-08, FI-10 |
| INV-I3 | No primary-index maintenance copies slots from more than one source fragment; deleted slot and key space is reclaimed on fragment split or rebuild; no index structure grows without bound from repeated inserts and deletes. Directory and keys have separate budgets. | [ADR-0043](adr/0043-primary-index-a-frammenti.md), [ADR-0050](adr/0050-pubblicazione-e-costi-della-directory.md) | SPK-01, saturation test |
| INV-P6 | Parallelism is structural: every work item belongs to a unit (Archivio, Serie, reader, batch, segment, fragment) that proceeds without waiting for others at the same level. Between Serie there are no locks or shared writes on a single operation's path; shared elements are only those in the closed list in [architecture](architettura.md#archivio-coordinamento-minimo), each with bounded cost paid at most once per batch, multiseries transaction, or snapshot. | [ADR-0036](adr/0036-leggi-di-progetto.md), [ADR-0045](adr/0045-modello-di-esecuzione.md) | closed-list review, scalability benchmark with Serie and cores, isolation benchmark (burst), SPK-04 |
| INV-P5 | A task does not suspend and a compute worker makes no blocking calls: every wait is parking on a list with maximum length and duration; every blocking call is an I/O-pool task. | [ADR-0045](adr/0045-modello-di-esecuzione.md) | review, saturation test, SPK-04 |
| INV-A9 | Recovery neither modifies nor truncates any existing segment: its only durable effects are records in sources of truth and idempotent completions; an `ACTIVE` found on restart is closed at its valid length and replaced with a new one. | [ADR-0036](adr/0036-leggi-di-progetto.md), [ADR-0037](adr/0037-lotto-sigillato.md), [ADR-0040](adr/0040-manifest-a-record-unico.md) | recovery interruption at every point, byte-for-byte segment comparison before and after |
| INV-A10 | Nothing is destroyed due to absence: a file or directory is deleted only if it is `.tmp` and no source of truth names it, or if a source of truth records its removal; an unknown object with a definitive name is a reported anomaly and is left untouched. | [ADR-0036](adr/0036-leggi-di-progetto.md), [ADR-0040](adr/0040-manifest-a-record-unico.md) | FI-09, FI-13, verifier test |
| INV-A11 | Every operation changing durable state has a single atomicity point, a durable record in its level's source of truth; before it there is only discardable preparation, afterward only idempotent completion. | [ADR-0036](adr/0036-leggi-di-progetto.md) | SPK-07 model with crashes before and after every point |
| INV-A12 | The cache is a pure accelerator: the system is correct with the cache disabled and the cache appears in no protocol; a failed check on cached data discards it and rereads from the segment, without quarantining the segment. | [ADR-0044](adr/0044-cache-acceleratore-puro.md) | differential test with and without cache, bit flip in arena |

<a id="corrispondenza-con-i-principi-della-specifica"></a>

## Mapping to specification principles

All 33 ‘Fundamental architectural principles’ are covered: principles that are verifiable
constraints are invariants above; design directions (group commit, dynamic scheduler,
highly optimized primary index, specialized secondary indexes, anti-scan-pollution cache,
dynamic thread pool, crash-safe recovery, fault injection, reproducible benchmarks) are
requirements in the corresponding topic documents and ADRs.

<a id="applicazione-dei-budget-ai-limiti-documentali"></a>

## Applying budgets to document limits

ADR-0048 applies INV-A8 to documents (16 MiB), depth (100), keys (65,535 bytes), arenas, and copies. INV-F1 requires distinguishing v1/v2; INV-A11 governs migration. No v1 result automatically verifies v2.
