# Roadmap

> The roadmap is a **proposed organization of work**: the specification does not prescribe phases.

<a id="stato-attuale"></a>

## Current status

**Architectural definition complete; evaluation and foundation development in progress.**
Since 2026-10-08, the author has authorized product code: completed components and
their boundaries are in the [implementation index](implementazione/README.md).
Their presence neither closes experimental gates nor qualifies the complete engine.

V1 scope includes **full-text search** approved by
[ADR-0053](adr/0053-ricerca-full-text-indici-invertiti.md): implementation and
qualification are in phase 8, alongside secondary indexes and Query Engine.
Current primary-index and recovery tests do not verify these new requirements.
[ADR-0054](adr/0054-contratto-e-formato-full-text.md) completes the
[operational contract](full-text.md) and [binary format](formato-indice-full-text.md).
The Unicode core, codec, and document preparation are now present;
commit, MVCC visibility, and durable publication remain to be integrated according to the
[verification plan](affidabilita/piano-di-verifica.md#ricerca-full-text).

The [vertical SIGKILL test](implementazione/prova-verticale.md) now connects
durable writes, index and GET, recovery, checkpoint, and rotation in a C4 fixture.
For v1/v2 formats, it also checks new writes after reopening, followed by a second
crash and recovery. The fixture rebuilds the CSN base for one Serie with ordinary
records; coordination remains in the test. The [M1 core](implementazione/production-engine-bootstrap.md)
now implements startup, recovery, and admission for one Serie. The Recovery Manager
and whole-Archivio frontier remain product work.

Development priority is moving this composition into the engine and making it
locally accessible. [ADR-0055](adr/0055-interfaccia-locale-unix-socket.md)
sets the **local Unix socket as the default, highest-priority interface** for the
first NNTP use: initial M16 integration follows startup, recovery, and admission,
without waiting for phases 8–9 to finish. TCP is optional and later.
Listener and client are available in the
[Unix M1 profile](implementazione/production-unix-m1.md); completion of the
extended M16 contract remains open.

The first product step is [choosing the new segment ID](implementazione/id-segmento-recovery.md):
a pure proposal from manifest and complete inventory, also used by the vertical
fixture. Namespace and identity collection is described below;
physical reconciliation and recovery coordination remain to be implemented;
complete read-only acquisition is now connected to the directory plan.
[Exclusive temporary-file publication](implementazione/io-pubblicazione.md)
now provides the I/O primitive rejecting existing targets and verifying the
name/FD binding. [Source-based stabilization](implementazione/stabilizzazione-nomi-recovery.md)
connects semantic token, CONTROL, exclusive publication, and parent fsync,
including for an already definitive name. The complete Recovery Manager sequence,
functional qualification, and admission remain open.

[Directory ID input](implementazione/id-directory-recovery.md) now connects
the real inventory to the new-segment proposal without a second scan.
The SIGKILL fixture also uses this path on canonical names; its eight-ID limit
does not limit product inventory.

| Order | Increment | Boundary to verify |
|---|---|---|
| 1 | Opening and recovering one Serie in the product | General inventory, identity, capability ownership, and failures at every step |
| 2 | Archivio CSN reconstruction and admission | All Serie and durable decisions, resolved pending work, single registry for writes and snapshots |
| 3 | Initial M16 integration on local Unix socket, with available fundamental operations | Two processes, CBOR framing, directory and permissions, collisions, limits, slow client, and lost response; [verification plan](affidabilita/piano-di-verifica.md#interfaccia-locale-unix-socket) |
| 4 | Complete concurrent path | Consistent index/root publication, isolation, MVCC, and multiseries, also exposed to local client when available |
| 5 | Load qualification | Persistent pool, repeated crashes, GC, and P99 on reference platform, including Unix socket |

These increments do not bring forward closure of Phase-0 gates.

The [M16 session contract](implementazione/sessione-locale.md) is an extended
proposal. The [authorized M1 profile](implementazione/production-unix-m1.md)
now implements order 3 with PING/PUT/GET/DELETE after recovery and admission;
[local qualification](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-23-production-unix-m1/report.md)
verifies separate processes, crashes, restart, and lost response. The profile
uses one owner and lower limits; full M16 completion and gates remain open.
[SPK-11](../spikes/SPK-11-unix-socket/README.md) retains the earlier investigation.
The [C4 session variant](../spikes/SPK-11-unix-socket/session-method.md)
adds handshake, negotiation, and PING between processes, with u64 IDs and
credit/deadline models. It does not bring forward contract acceptance or the real gate.
The [C4 I/O step](../spikes/SPK-11-unix-socket/native-io-method.md) adds
recv/send over owned spans and replaceable backends: a prerequisite for the
later product adapter. The M1 profile integrates real admission with
preallocated buffers and a serial actor; extended pools/scheduler remain to be integrated.

The [Archivio runtime bootstrap](implementazione/runtime-archivio.md)
now connects the complete CSN plan to the single CSN/snapshot/epoch family
and new GET scope. Reconciliation, effect publication, construction of
Serie controllers, and admission remain to be coordinated.

The first increment has [read-only inventory collection](implementazione/inventario.md#raccolta-dalla-directory)
from a directory capability, with names and identities verified before the planner.
[Relative read-only open](implementazione/io-apertura-relativa.md)
now provides capability and size from the same FD and is used by vertical-test
readers. [Owned source acquisition](implementazione/fonti-recovery.md)
now connects the complete plan to read-only ACTIVE/CLOSED with a cumulative
budget and child cleanup; physical reconciliation and recovery coordination
remain subsequent steps.
[Relative temporary-file creation](implementazione/io-creazione-relativa.md)
completes the boundary for new vertical-test outputs without reopening the
parent path or deciding orphan reconciliation.

As of 2026-10-03, **definition is complete**: the 26 open questions are closed by
ADR 0013–0030, the design is consolidated in [architettura.md](architettura.md), and formats in
[formati-su-disco.md](formati-su-disco.md). The same day's [design analysis](analisi-progettuale.md)
reread the whole, found five correctness defects, and closed them with ADR 0036–0045.
ADR-0028 and ADR-0030 were confirmed by the author on 2026-10-08.
**Experimental evaluation** is in progress: spike suite SPK-01, SPK-02, SPK-03, SPK-07,
SPK-09, with `make spikes-check` and `make spikes-bench`. SPK-07 already found a
counterexample in the horizon ring, corrected by
[ADR-0046](adr/0046-orizzonte-con-registro-limitato.md).
The SPK-07 suite now includes finite models of fragment publication,
expiration and protection of already admitted accesses, compaction with an ACTIVE
writer and barrier observation orders, two readers/two slots in SC, and byte-level
crashes with an explicit acknowledged frontier. Methods, results, and gaps are in the
[spike README](../spikes/SPK-07-protocols/README.md).

The [local 2026-10-08 campaign](valutazione/risultati-2026-10-08.md) retains
measurements and raw data for five v1 spikes and SPK-10: v2 codec, index,
CBOR, and model migration, with in-memory integration of maximum boundaries.
`make check` records the whole verification in structured form, including failures.
The complete v2 gate, full weak memory and engine byte-level crashes,
and reference-platform measurements remain pending; the gate is not closed.

SPK-08 adds [exact masks and NEON/SWAR kernels](valutazione/risultati-SPK-07-08-2026-10-08.md):
correctness, disassembly, and 70 local serial samples. x86-64, index integration,
bitmap/checksum, and reference platform remain pending.

<a id="fase-0--definizione-architetturale-e-valutazione"></a>

## Phase 0 — Architectural definition and evaluation

The [Common Lisp NNTP server](valutazione/caso-duso-nntp.md) is the reference
application confirmed by the author on 2026-10-15. Lookup, ordered ranges,
multiseries publication, retention, and recovery needs guide evaluation of
existing phases. The current request concerns documenting the objective;
daemon development and application benchmarks remain future work.
The later full-text search request explicitly extends v1 scope through
ADR-0053, without bringing gates forward.

Purpose: reach implementation with structural decisions made, main risks measured,
and critical protocols checked on models.

<a id="filoni-di-lavoro"></a>

### Workstreams

| Workstream | Activity | Outcome |
|---|---|---|
| **A. Decisions** | Close priority-A [open questions](questioni-aperte.md) | One ADR per question |
| **B. Spikes** | Run [spikes](valutazione/piano-spike.md) in risk order | Measurements and recommendations in `spikes/` |
| **C. Models** | Describe 2PC + recovery and compaction + swap + reclaim as state machines; explore crashes | Protocols verified against [invariants](invarianti.md) |
| **D. Formats** | Define persistent formats: record, WAL, segment, manifest, `multiserie.log`, catalog | On-disk format document |
| **E. Contracts** | Define interfaces between [modules](16-moduli.md#contratti-tra-moduli) | Contract per module |
| **F. Evaluation** | Update [risk register](valutazione/registro-rischi.md) and [estimates](valutazione/stime-ordine-di-grandezza.md) with results | Feasibility verdict |

<a id="ordine-consigliato-parte-restante"></a>

### Recommended order (remaining work)

1. Confirmation of **ADR-0028** (targets, latency, GC pause ≤ 5 ms) and **ADR-0030** (scope).
2. **SPK-02** (GC) and **SPK-01** (primary index): the two risks that could challenge
   foundational choices.
3. **SPK-07** (2PC + compaction/swap/reclaim model with crashes at every point).
4. **SPK-03** (concurrent flushes across many Serie).
5. Complete remaining checks for SPK-04, SPK-05, and SPK-06, which have first local
   campaigns, and complete SPK-08 on the reference platform; remaining spikes can
   also run during Phase 1.

<a id="criteri-di-uscita"></a>

### Exit criteria

- [x] All priority-A questions closed by an ADR (2026-10-03).
- [x] Persistent formats documented ([formati-su-disco.md](formati-su-disco.md)).
- [x] Every high-exposure risk has a decided mitigation or explicit acceptance
      ([register](valutazione/registro-rischi.md#stato-dopo-gli-adr-2026-10-03)).
- [x] Intermodule contracts defined ([architecture](architettura.md#contratti)).
- [x] Design analysis performed; AP-01…AP-16 findings closed by ADR 0036–0045
      ([analysis](analisi-progettuale.md)).
- [x] Critical-software criteria adopted ([ADR-0031](adr/0031-software-critico-criteri-e-priorita.md)): failure analysis, coding standard, verification plan, traced requirements, `make check` with linter and traceability.
- [x] ADR-0028 (with performance minima) and ADR-0030 (with backup and verifier in v1) confirmed by author on 2026-10-08.
- [ ] SPK-01, SPK-02, SPK-03, and **SPK-09** executed, with reproducible repository results.
- [ ] The SPK-07 model (2PC, compaction/swap/reclaim, seqlock, recovery idempotence, batch and durable frontier, visibility horizon, self-contained segments, tombstones, atomicity points) violates no invariants in any FI-01…FI-13 scenario.
- [ ] Targets in [13 Benchmarks](13-benchmark.md) confirmed or revised in light of estimates
      and spikes.
- [ ] Explicit decision to proceed to Phase 1.

<a id="gate-di-ogni-fase"></a>

## Gate for every phase

Every later phase closes only with the [release criteria](affidabilita/piano-di-verifica.md#criteri-di-rilascio-di-una-fase):
traced and verified requirements, class-specific coverage, no violations in models and
fault injection, clean offline verifier after crashes, C1 mutation score, passing
`make check`, no unapproved deviations.

<a id="fasi-successive-schema"></a>

## Later phases (outline)

Order follows two principles: a working **vertical slice** as soon as possible, and
**fault-injection** infrastructure before the protocols it must verify. Details are
defined when Phase 0 closes.

| Phase | Contents | Modules | Verification |
|---|---|---|---|
| 1 | One Serie: record frame, sealed batches in ACTIVE segment, EDIT-record manifest, rotation, fragmented primary index with 64-bit seqlocks, GET/PUT/DELETE, nondestructive recovery; run-to-completion tasks; **injectable environment** (time, randomness, scheduling, I/O) and **deterministic simulator**; read-time verification; **offline verifier**; test harness, reference model, decoder fuzzing, mutation testing | M01–M05, M12, io | FI-01, FI-02, FI-10 |
| 2 | Group commit with one I/O task at a time, durability levels, cache, metrics | M02, M07, metrics | basic benchmarks |
| 3 | Visibility horizon, snapshots/MVCC, and single-Serie transactions | M08, M09 | FI-11 |
| 4 | CLEAN, swap, reclaim; **scrubbing** | M11, M04 | FI-06, FI-07, FI-09 |
| 5 | Archivio, Registri, catalog, multiple Serie; logical writers on dynamic thread pool; scheduler; **backup and verified restore** | M13, M14, M17 | FI-13, isolation benchmarks between Serie |
| 6 | Multiseries transactions and `multiserie.log` | M09, M10 | FI-03, FI-04, FI-05, FI-12 |
| 7 | MERGE, low-load policy, Compaction Scheduler | M11, M13 | FI-08, interference benchmarks |
| 8 | Secondary indexes, **full-text search with dedicated inverted indexes**, and Query Engine ([ADR-0053](adr/0053-ricerca-full-text-indici-invertiti.md)) | M06, M15 | comparison with scan, snapshot/update/delete, build/rebuild, corruption, and budgets; [full-text campaign](13-benchmark.md#ricerca-full-text) |
| 9 | M16 protocol/server completion and optional TCP transport; initial Unix socket integration already brought forward after startup/recovery/admission (ADR-0055) | M16 | same semantics and limits as local path; TCP only with explicit activation |
| 10 | Benchmark campaign; optimizations on measured hot paths | M18 | [13 Benchmarks](13-benchmark.md) |

<a id="avanzamento-spk-04"></a>

## SPK-04 progress

The [first SPK-04 campaign](valutazione/risultati-SPK-04-2026-10-08.md)
adds an executable pool and finite models of read parking and restart.
Live load, messages, adaptive scheduler, and meaningful reference-platform
measurements remain pending; Phase 0 remains open.

<a id="gate-del-formato-v2"></a>

## V2 format gate

Before the engine: campaigns for ADR-0048 limits (documents, depth, keys), v1/v2 decoders, interrupted migration, and new-slot budgets. Update SPK-01 and SPK-09 with separate results. Beyond-RAM research (ADR-0049) requires comparison and an ADR before changing v1 scope.

On 2026-10-22, the author authorized incremental implementation of automatic
mode [ADR-0057](adr/0057-selezione-automatica-indice.md). The first
[increment](implementazione/indice-automatico.md#incrementi-successivi-e-completamento)
adds the budget selector and C4 lifetime model: format, cache, differential
backend, actuator with growth/return, and qualification follow.
The runtime index remains resident; no beyond-RAM gate is closed.

I2 introduces [ADR-0058](adr/0058-pagine-indice-primario.md) and the
[page codec](implementazione/pagine-indice.md). Pages and PageRefs are
locally verifiable; cache, writer split, complete graph, recovery, and
automatic live switching still require subsequent increments.

<a id="avanzamento-spk-05"></a>

## SPK-05 progress

> **Proposed** — The [local comparison](valutazione/risultati-SPK-05-2026-10-08.md)
> adds positional reads and real-file mapping, with CRC, key, and stamp checks.
> ADR-0017's pread choice remains confirmed by the design; beyond-RAM datasets,
> cache granularity, and NVMe targets remain to be verified.

<a id="avanzamento-spk-06"></a>

## SPK-06 progress

> **Proposed** — The [first local campaign](valutazione/risultati-SPK-06-2026-10-08.md)
> verifies the load model, MERGE admission, and quotas on finite inputs;
> it also measures buffered copies concurrent with positional reads. The two
> tests are independent: the model does not control copies through real signals.
> Engine compaction, calibration and device feedback, reference platform, and
> P99 compliance during CLEAN/MERGE remain pending. Phase gates and performance
> targets remain open.

Current-only serial M1 now includes [canonical full-prefix compaction](adr/0078-compattazione-prefix-m1.md)
with automatic physical reclamation and crash completion. Concurrent/background
CLEAN/MERGE, historical MVCC and multiseries remain separate milestones.
