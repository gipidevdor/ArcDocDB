<a id="riferimenti"></a>

# References

[Documentation](README.md) · [Implementation](implementazione/README.md)

Complete index of topic documents and reading conventions.

<a id="mappa-dei-documenti"></a>

## Document map

| Document | Contents | Specification sections covered |
|---|---|---|
| [01 Vision and goals](01-visione-e-obiettivi.md) | Purpose, goals, non-goals | Introduction, Final goal |
| [02 Logical model](02-modello-logico.md) | Hierarchy, Registri, catalog, physical layout | Logical architecture, Special Serie Registri, Catalog, Physical layout |
| [03 Storage](03-storage.md) | Append-only, segments, states, metadata, versions | Append-only storage, Segments, Segment metadata, Record versions |
| [04 WAL and durability](04-wal-e-durability.md) | Per-Serie WAL, group commit | WAL |
| [05 Transactions](05-transazioni.md) | Single-Serie (OCC), multiseries (2PC), `multiserie.log` | Single-Serie transactions, Multiseries transactions |
| [06 MVCC and snapshots](06-mvcc-e-snapshot.md) | Logical snapshots, visibility, reclaim | Snapshot/MVCC, Index/Snapshot/Reclaim, Cache and snapshots |
| [07 Compaction](07-compaction.md) | CLEAN, MERGE, 50 s + low-load rule, workflow | Clean, Merge, Mandatory conditions for Merge, Low-load merge policy, General policy, Parallel compaction, Workflow, Readers during compaction, Dynamic compaction scheduler |
| [08 Indexes](08-indici.md) | Primary index, secondary indexes, full-text search with inverted indexes, deltas, index snapshots | Index, Secondary index, Secondary index delta, Index snapshot; ADR-0053 extension |
| [Full-text contract](full-text.md) | Unicode profile, queries, interfaces, generations, budgets, and acceptance | ADR-0054 completion |
| [Full-text index format](formato-indice-full-text.md) | `.idx` v2/type 5: header, six sections, postings, positions, and hint binding | ADR-0054 completion |
| [09 Cache](09-cache.md) | CLOCK, partitioning, read path | Cache, Cache and snapshots |
| [10 Concurrency and scheduling](10-concorrenza-e-scheduling.md) | Logical writer, dynamic thread pool, priorities | Concurrency, Dynamic thread pool, Parallelism |
| [11 Recovery](11-recovery.md) | Restart procedure, crash safety | Recovery |
| [12 Observability](12-osservabilita.md) | Metrics | Observability |
| [13 Benchmarks](13-benchmark.md) | Methodology, workloads, targets, comparisons | Benchmarks, Preliminary targets, Comparison with Oracle/MySQL/MongoDB |
| [14 Fault injection](14-fault-injection.md) | Crash scenarios and checked invariants | Fault injection |
| [15 Native optimizations](15-ottimizzazioni-native.md) | SBCL, SIMD, FFI | SIMD and native optimizations |
| [16 Modules](16-moduli.md) | The 18 modules, packages, dependencies, code map | Software modules |

Consolidated design:

| Document | Contents |
|---|---|
| [Architecture](architettura.md) | Complete design in one document: structures, read and write paths, transactions, compaction, recovery, intermodule contracts |
| [Design analysis](analisi-progettuale.md) | Critical rereading of the design: ten laws (the first: parallelism is foundational), atomicity points, `AP-…` findings with counterexamples and decisions, account of what was removed |
| [On-disk formats](formati-su-disco.md) | Record frame, batch and SEAL, segment, hint, indexes, control log, `multiserie.log`, catalog |
| [Size limits](limiti.md) | Hard limits from formats and practical limits from hardware |
| [Engineering principles](principi-di-ingegneria.md) | Pattern admission criteria; write it once |
| [Reliability](affidabilita/README.md) | Critical software: reliability case, failure analysis (FMEA), coding standard, verification plan, deviations |
| [Traceability](tracciabilita/README.md) | `REQ-…` requirements, matrix generated and checked by `make trace` |

Cross-cutting documents:

| Document | Contents |
|---|---|
| [Invariants](invarianti.md) | Numbered list (`INV-…`) of inviolable rules, with sources and tests checking them |
| [Glossary](glossario.md) | Domain terms and language convention |
| [Open questions](questioni-aperte.md) | Numbered list (`QA-…`) of points not decided by the specification |
| [Roadmap](roadmap.md) | Phase 0 (definition and evaluation) with exit criteria; later phases |
| [ADRs](adr/README.md) | Architectural decision register |

Architectural evaluation ([valutazione/](valutazione/README.md)):

| Document | Contents |
|---|---|
| [Critical analysis](valutazione/analisi-critica.md) | Strengths, internal specification tensions, gaps, comparison with known architectures |
| [Order-of-magnitude estimates](valutazione/stime-ordine-di-grandezza.md) | Target plausibility against hardware limits |
| [Risk register](valutazione/registro-rischi.md) | `RSK-…` risks with mitigations and checks |
| [Spike plan](valutazione/piano-spike.md) | Phase-0 `SPK-…` experiments |

<a id="convenzioni"></a>

## Conventions

**Authority levels.** In a conflict, precedence is, in order:

1. the [original specification](specifica/specifica-originale.md);
2. accepted [ADRs](adr/README.md) (which may explicitly amend the specification);
3. the [invariants](invarianti.md);
4. topic documents.

**What is specification and what is not.** In topic documents, ordinary text states what
the specification prescribes. Everything else is explicitly marked:

> **Proposed** — interpretation or design choice absent from the specification. It requires
> confirmation; until then, it does not constrain implementation.

> **Decided (QA-nn → ADR-nnnn)** — a point the specification did not decide, resolved by the
> named ADR. The following text describes the question; the decision is in the ADR.

> **Open (QA-nn)** — a point not yet decided; refers to
> [questioni-aperte.md](questioni-aperte.md).

**Normative words.** MUST / MUST NOT express requirements; SHOULD expresses a strong
preference; MAY expresses permission.

**Identifiers.** `INV-…` invariants, `QA-…` open questions, `FI-…` fault-injection
scenarios, `M01…M18` modules, `ADR-…` decisions, `RSK-…` risks, `SPK-…` spikes. Identifiers
are stable: retire rather than renumber them. Added by ADR-0031: `REQ-…` requirements
([traceability](tracciabilita/README.md)), `FM-…` failure modes, `COD-…` coding rules,
`DEV-…` deviations, `COV-…` coverage exceptions; `AP-…` findings from the
[design analysis](analisi-progettuale.md).

**Language.** Documentation is in English. Domain terms (Archivio, Serie, Documento,
Registri, `multiserie.log`) remain in Italian, including in code; established technical
terms (WAL, segment, snapshot, commit…) remain in English. Details in the [glossary](glossario.md).

<a id="come-si-mantiene"></a>

## Maintenance

- A requirement change starts with the specification (or an amending ADR), then propagates
  to invariants and topic documents in the same commit.
- An open question is closed by an ADR; its entry in `questioni-aperte.md` is marked
  ‘Resolved by ADR-nnnn’, not deleted.
- Performance numbers enter documents only if produced by reproducible benchmarks
  (see [13 Benchmarks](13-benchmark.md)); otherwise they are declared as targets.
