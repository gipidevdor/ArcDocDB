<a id="registro-delle-decisioni-architetturali-adr"></a>

# Architecture decision record (ADR) register

[Documentation](../README.md) · [Architecture](../architettura.md) · [Invariants](../invarianti.md)

An ADR records **one** decision: context, choice, consequences, and how its soundness is
evaluated. ADRs are the project's memory: they explain why the architecture has this form.

<a id="regole"></a>

## Rules

- Sequential four-digit numbering; an ADR is never renumbered or deleted.
- States: **Proposed** → **Accepted** → possibly **Superseded by ADR-nnnn** or
  **Withdrawn**.
- An accepted ADR is not rewritten: to change a decision, write a new one that
  supersedes the previous one.
- An ADR amending the [specification](../specifica/specifica-originale.md) declares this in its
  “Relationship to the specification” field.
- Every [open question](../questioni-aperte.md) is closed with an ADR.
- Template: [0000-modello.md](0000-modello.md).

<a id="decisioni-registrate"></a>

## Recorded decisions

ADRs 0001–0012 record decisions **already contained in specification v1**. Their
“Alternatives” and “Evaluation” sections are contributions from the evaluation phase, not
part of the specification.

| ADR | Decision | Status |
|---|---|---|
| [0001](0001-common-lisp-sbcl.md) | Common Lisp/SBCL; Common Lisp only for now | Accepted (amends the specification) |
| [0002](0002-serie-unita-di-storage-e-parallelismo.md) | Serie as the unit of storage and parallelism | Accepted |
| [0003](0003-wal-per-serie.md) | WAL per Serie, no global data WAL | Accepted |
| [0004](0004-storage-append-only-un-solo-active.md) | Append-only storage with a single ACTIVE segment | Accepted |
| [0005](0005-writer-logico-per-serie.md) | One logical writer per Serie with optimistic checking | Accepted |
| [0006](0006-transazioni-multiserie-2pc.md) | 2PC-like multiseries transactions with a single `multiserie.log` | Accepted |
| [0007](0007-clean-e-merge-distinti.md) | Separate CLEAN and MERGE, copy-on-write | Accepted |
| [0008](0008-merge-opportunistico.md) | Opportunistic MERGE: 50 s stability + low load | Accepted |
| [0009](0009-indici-immutabili-atomic-swap.md) | Immutable indexes for readers, atomic swap | Accepted |
| [0010](0010-cache-clock.md) | CLOCK cache, partitionable by Serie | Accepted |
| [0011](0011-thread-pool-dinamico.md) | Dynamic thread pool with EWMA/AIMD/hysteresis | Accepted |
| [0012](0012-simd-guidato-dai-benchmark.md) | SIMD only where benchmarks justify it | Accepted |

<a id="software-critico-fase-0-2026-10-03"></a>

## Critical software (Phase 0, 2026-10-03)

Decisions made by applying the critical-software criteria requested by the author
([ADR-0031](0031-software-critico-criteri-e-priorita.md)); they form a group with the
[reliability analyses](../affidabilita/README.md).

| ADR | Decision | Status |
|---|---|---|
| [0031](0031-software-critico-criteri-e-priorita.md) | Priority hierarchy (reliability above performance), integrity classes, rigor per class | Accepted (amends the specification) |
| [0032](0032-seqlock-a-64-bit.md) | 64-bit seqlock, bounded retries, fallback to writer; 6-word slot | Accepted (partially supersedes 0015; slot layout: 0043) |
| [0033](0033-fail-stop-e-integrita-end-to-end.md) | Fail-stop on I/O errors, read verification, mid-log corruption, scrubbing, offline verifier, health states | Accepted (truncated tail: 0037) |
| [0034](0034-policy-di-compilazione-e-standard-di-codifica.md) | `safety` ≥ 2, no warnings, prohibitions, linter | Accepted |
| [0035](0035-strategia-di-verifica-e-tracciabilita.md) | Checked bidirectional traceability, deterministic simulator, verification levels, release criteria | Accepted |

<a id="analisi-progettuale-fase-0-2026-10-03"></a>

## Design analysis (Phase 0, 2026-10-03)

Decisions arising from the [design analysis](../analisi-progettuale.md): they close findings
`AP-01…AP-16`. Each declares which parts of previous ADRs it supersedes; partially
superseded ADRs remain valid in all other respects and carry a note in their status.

| ADR | Decision | Findings | Status |
|---|---|---|---|
| [0036](0036-leggi-di-progetto.md) | Design laws: parallelism is foundational; one atomicity point per operation; prepare, decide, complete; nothing is destroyed because it is absent | AP-13, AP-14 | Accepted |
| [0037](0037-lotto-sigillato.md) | Sealed batch: one write path, one flush at a time, durable frontier, recovery without truncation | AP-02, AP-03, AP-08 | Accepted |
| [0038](0038-orizzonte-di-visibilita.md) | Visibility horizon; snapshot registry; the version is the CSN | AP-01, AP-02, AP-07, AP-15 | Accepted (amends the specification; pending registry: 0046) |
| [0039](0039-cornice-unica-dei-record.md) | Single record frame: two CRCs, four types in segments, resolved hint with existence filter | AP-08, AP-11, AP-13 | Accepted |
| [0040](0040-manifest-a-record-unico.md) | Single-record manifest (EDIT); the catalog decides, directories follow | AP-14 | Accepted |
| [0041](0041-multiserie-segmenti-autosufficienti.md) | Multiseries: self-contained segments, abort without a trace, acknowledgment after publication | AP-05, AP-06, AP-08 | Accepted |
| [0042](0042-tombstone-e-indice-dei-vivi.md) | Tombstones: live-only index, rebuild by maximum CSN, discard by existence filter | AP-04, AP-11 | Accepted |
| [0043](0043-primary-index-a-frammenti.md) | Fragmented primary index: extendible directory, four-word slots, local keys | AP-12, AP-16 | Accepted |
| [0044](0044-cache-acceleratore-puro.md) | The cache is a pure accelerator | AP-09 | Accepted |
| [0045](0045-modello-di-esecuzione.md) | Run-to-completion tasks, stateless migration, waits as parking | AP-10 | Accepted |

<a id="decisioni-di-progetto-fase-0-2026-10-03"></a>

## Design decisions (Phase 0, 2026-10-03)

These close the [open questions](../questioni-aperte.md). Each ADR cites the adopted pattern and
where it is used in production ([engineering principles](../principi-di-ingegneria.md)). The
consolidated result is in [architettura.md](../architettura.md) and
[formati-su-disco.md](../formati-su-disco.md).

| ADR | Decision | Closes | Status |
|---|---|---|---|
| [0013](0013-log-structured-segmento-active-come-log.md) | The ACTIVE segment is the data log; `wal/` is the control log | QA-02 | Accepted (amends the specification; committed record: 0037) |
| [0014](0014-formato-record-documento-id.md) | Binary record with CRC32C, CBOR documents, `_id` 1–255 bytes | QA-01 | Accepted (record header: 0039) |
| [0015](0015-primary-index-swiss-table-swmr.md) | Swiss SWMR primary index, per-slot seqlock, retained versions, per-segment hints | QA-24, QA-03 | Accepted (structure: 0043; hints: 0039; rebuild: 0042) |
| [0016](0016-epoch-based-reclamation.md) | Epoch-based reclamation | QA-16 | Accepted (scope: 0043, 0045) |
| [0017](0017-piattaforma-e-io.md) | Linux x86-64 reference platform; blocking I/O on a dedicated pool; `durable-flush` | QA-19 | Accepted (what goes through the I/O pool: 0045) |
| [0018](0018-control-log-manifest-swap.md) | Control log as manifest; `SWAP` as a single record; stabilization | QA-04, QA-13 | Accepted (records and order: 0040) |
| [0019](0019-durability-e-group-commit-pipelined.md) | `:async`/`:group`/`:strong` levels; pipelined group commit | QA-05 | Accepted (mechanics: 0037) |
| [0020](0020-csn-snapshot-isolamento.md) | Archivio CSN; snapshot = number; SI + `:serializable`; `snapshot-too-old` | QA-06, QA-09, QA-14 | Accepted (snapshot creation: 0038) |
| [0021](0021-2pc-intenti-outcome.md) | 2PC with no-wait intents, OUTCOME record, presumed abort, truncation | QA-07, QA-08 | Accepted (records and acknowledgment: 0041) |
| [0022](0022-registri-come-serie-catalogo.md) | Registri is a Serie; document catalog; bootstrap | QA-10 | Accepted (creation and deletion: 0040) |
| [0023](0023-politiche-di-compaction.md) | Thresholds, load states, bandwidth limiter, lineage-based tombstones | QA-11, QA-12, QA-15 | Accepted (tombstones: 0042) |
| [0024](0024-memoria-e-gc.md) | Long-lived specialized arrays; zero allocation on the hot path | QA-18 | Accepted (index growth: 0043) |
| [0025](0025-cache-per-location.md) | Cache by location, slot arena, CLOCK per partition | QA-17 | Accepted (structure, no retagging: 0044) |
| [0026](0026-indici-secondari-segmentati.md) | Secondary indexes per segment, fixed format, in-memory delta | QA-25 | Accepted (Bloom: 0039, 0042) |
| [0027](0027-dipendenze-e-test.md) | No external dependency; own harness | QA-22 | Accepted |
| [0028](0028-target-e-obiettivi-di-latenza.md) | Aggregate targets; numerical latency and GC pause objectives | QA-26 | Accepted by the author on 2026-10-08 |
| [0029](0029-interfacce-protocollo-query-contratto.md) | CBOR frame protocol; queries as data; additive contract | QA-20, QA-21 | Accepted; primary transport superseded by 0055 |
| [0030](0030-scope-v1.md) | v1 scope | QA-23 | Accepted by the author on 2026-10-08 |

<a id="valutazione-sperimentale-2026-10-08"></a>

## Experimental evaluation (2026-10-08)

| ADR | Decision | Evidence | Status |
|---|---|---|---|
| [0046](0046-orizzonte-con-registro-limitato.md) | Bounded registry of in-flight CSNs; indivisible assignment and registration; H derived from minimum pending | reproducible counterexample in SPK-07 | Accepted |
| [0047](0047-verifica-csn-dei-record-prepared.md) | Prepared-record CSN verified through OUTCOME or authoritative outcome in manifest; flag alone is insufficient | record verification in SPK-09 | Accepted |
| [0050](0050-pubblicazione-e-costi-della-directory.md) | Root rechecked even on miss; directory cost and transient memory separate from C slots | SPK-01 publication and counters | Accepted; scale and memory verification open |

<a id="limiti-e-capacità-2026-10-08"></a>

## Limits and capacity (2026-10-08)

| ADR | Decision | Status |
|---|---|---|
| [0048](0048-limiti-documentali-e-formato-v2.md) | Effective 16 MiB, 100 levels, extended keys, v2 format | Accepted; evidence to be produced |
| [0049](0049-capacita-oltre-la-ram.md) | Persistent index with cache to exceed RAM | Proposed |
| [0057](0057-selezione-automatica-indice.md) | Automatic resident/paged selection, hysteresis and migration peak per Serie | Accepted by the author on 2026-10-22; initial selector, backend and actuator open |
| [0058](0058-pagine-indice-primario.md) | 4/16/64 KiB page codec, flat buckets, paged directory, external keys and verified identities | Accepted in incremental implementation; backend integration open |
| [0059](0059-crc32c-arm64-sbcl.md) | ARM64 CRC32C with SBCL VOP, controlled loads and Lisp fallback | Accepted; local qualification in implementation |
| [0060](0060-crc32c-caricamento-portabile.md) | Isolation of native CRC dependencies and portable bootstrap | Accepted |
| [0061](0061-conservazione-esterna-delle-prove.md) | Verified external historical tests; recent summaries in checkout | Accepted |
| [0062](0062-cronologia-git-due-commit.md) | Authorized reduction of history to the last two commits | Accepted |

<a id="organizzazione-della-documentazione-2026-10-08"></a>

## Documentation organization (2026-10-08)

| ADR | Decision | Status |
|---|---|---|
| [0051](0051-presentazione-della-documentazione.md) | Presentation of the specification, common guide, and preservation of original evidence | Accepted; requirements unchanged |

<a id="completamento-dei-formati-2026-10-08"></a>

## Format completion (2026-10-08)

| ADR | Decision | Status |
|---|---|---|
| [0052](0052-header-dei-log-di-controllo.md) | Offsets, identity and CRC of control and multiseries headers | Accepted; first codec |

<a id="ricerca-testuale-2026-10-15"></a>

## Text search (2026-10-15)

| ADR | Decision | Status |
|---|---|---|
| [0053](0053-ricerca-full-text-indici-invertiti.md) | Full-text search: per-segment inverted indexes, terms and positions, versioned analyzers, commit and snapshot consistency | Accepted for the design; implementation and qualification to be produced |
| [0054](0054-contratto-e-formato-full-text.md) | Operational full-text contract: fixed Unicode profile, queries, interfaces, generations, budgets and `.idx` v2 format | Accepted for the design; implementation and qualification to be produced |

<a id="interfaccia-locale-2026-10-16"></a>

## Local interface (2026-10-16)

| ADR | Decision | Status |
|---|---|---|
| [0055](0055-interfaccia-locale-unix-socket.md) | Default local Unix socket with NNTP priority; optional TCP later; first M16 integration brought forward | Accepted at the author's direction; implementation and qualification to be produced |
| [0056](0056-sessione-locale-m16.md) | Proposed M16 contract: framing, handshake, correlation, budgets and local deadlines | Proposed; SPK-11 investigation |

<a id="immagini-primarie-derivate-2026-10-28"></a>

## Derived primary images (2026-10-28)

| ADR | Decision | Status |
|---|---|---|
| [0063](0063-immagini-sigillate-indice-primario.md) | Completion, canonical source and read-only verification before root adoption | Accepted in incremental integration; catalog and M1 startup still separate |

| [0064](0064-adozione-indice-paginato-m1.md) | Canonical M1 source, explicit read-only candidate, paged GET and retirement before writing | Accepted in incremental integration; durable catalog separate |

| [0065](0065-costruzione-immagini-dal-motore.md) | Bounded image production from M1 resident index, adaptive radix and verification before success | Accepted in incremental integration; automatic activation separate |

| [0066](0066-attivazione-seriale-immagini-m1.md) | Private hot activation, bounded ownership and closure on M1 image retirement | Accepted in incremental integration; automatic selection and durable catalog separate |

| [0067](0067-delta-seriale-indice-m1.md) | Exact bounded membership for PUT/DELETE without M1 image retirement | Accepted in incremental integration; resident index still complete |

| [0068](0068-rinnovo-seriale-immagini-m1.md) | Construction and activation in one serial request, total quota and renewed delta | Accepted in incremental integration; catalog and automatic policy separate |

| [0069](0069-manutenzione-a-soglie-delta-m1.md) | Local threshold policy on keys/bytes and serial delta renewal | Accepted in incremental integration; backend selection and scheduler separate |

| [0070](0070-scoperta-readonly-immagini-m1.md) | Bounded search for current candidates and full verification at M1 startup | Accepted in incremental integration; durable catalog and mode selection separate |

| [0071](0071-delta-location-indice-m1.md) | Committed locations and tombstones in the M1 delta, without resident lookup for paged GET | Accepted in incremental integration; resident write/recovery dependencies remain |

| [0072](0072-rinnovo-automatico-delta-m1.md) | Bounded automatic renewal before M1 PUT/DELETE, with one admission for renewal and commit | Accepted in incremental integration; legacy image profile; operational selection in ADR-0073 |

| [0073](0073-indice-automatico-operativo-m1.md) | Automatic M1 resident/paged writes, bounded replay, return and derived cleanup | Implemented for serial M1; concurrent and physical-RAM qualification separate |
