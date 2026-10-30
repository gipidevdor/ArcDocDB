<a id="16--moduli-software"></a>

# 16 — Software modules

> **Source:** ‘Software modules’ of the [specification](specifica/specifica-originale.md).

The specification calls for organizing the system into **at least** the following 18 modules.
Identifiers `M01…M18` follow specification order.

<a id="elenco-e-responsabilità"></a>

## List and responsibilities

| ID | Module | Responsibility | Document |
|---|---|---|---|
| M01 | Storage Engine | Per-Serie facade: coordinates WAL, segments, index, and cache on read and write paths | [03](03-storage.md) |
| M02 | WAL Manager | Per-Serie WAL: ordered append, group commit, flush, replay | [04](04-wal-e-durability.md) |
| M03 | Segment Manager | Segment lifecycle: single ACTIVE, rotation, states, reads | [03](03-storage.md) |
| M04 | Segment Metadata Manager | Live/dead counters and times; derived, rebuildable data | [03](03-storage.md#segment-metadata) |
| M05 | Primary Index Manager | `_id → location`, compact in-RAM table | [08](08-indici.md) |
| M06 | Secondary Index Manager | ART, B+ tree, posting lists, bitmap, Bloom; full-text inverted indexes with positions and generations; base + delta | [08](08-indici.md#indici-secondari) |
| M07 | Cache Manager | CLOCK, per-Serie partitioning, version awareness | [09](09-cache.md) |
| M08 | Snapshot/MVCC Manager | Logical snapshots, visibility, protection of versions from reclaim | [06](06-mvcc-e-snapshot.md) |
| M09 | Transaction Manager | Single-Serie transactions (OCC) and multiseries coordination | [05](05-transazioni.md) |
| M10 | Multiseries Transaction Log Manager | `Registri/multiserie.log`: durable decisions, group commit | [05](05-transazioni.md#multiserielog) |
| M11 | Compaction Manager | CLEAN, MERGE, candidate selection, swap, reclaim | [07](07-compaction.md) |
| M12 | Recovery Manager | Restart after a crash | [11](11-recovery.md) |
| M13 | Scheduler | Load control: request scheduler and Compaction Scheduler | [10](10-concorrenza-e-scheduling.md) |
| M14 | Dynamic Thread Pool | Reused workers, dynamic sizing | [10](10-concorrenza-e-scheduling.md#thread-pool-dinamico) |
| M15 | Query Engine | Query execution over indexes and scans; full-text predicates and phrases combined with filters in the same MVCC view | [08](08-indici.md) |
| M16 | Network/Protocol Layer | Priority local Unix socket, connections, CBOR framing, and admission; optional TCP later | [Interfaces](architettura.md#interfacce), [ADR-0055](adr/0055-interfaccia-locale-unix-socket.md) |
| M17 | Archivio/Serie/Documento Catalog Manager | Transactional catalog in `Registri/catalog/` | [02](02-modello-logico.md#catalogo) |
| M18 | SIMD/Hot Path Optimization Layer | Optimized primitives for hot paths | [15](15-ottimizzazioni-native.md) |

> **Proposed** — Two support modules not listed in the specification but required:
> **metrics** (required by the Observability section and used by controllers) and **io**
> (single interface to files and `fsync`, required for fault injection, see
> [14](14-fault-injection.md#implicazioni-architetturali)).

<a id="stratificazione"></a>

## Layers

> **Proposed** — Dependencies allowed only from higher to lower layers. This keeps modules
> independently verifiable and avoids cycles between packages.

```
Layer 5 — access        M16 Network/Protocol
                          M15 Query Engine
Layer 4 — coordination  M09 Transaction    M11 Compaction    M12 Recovery    M17 Catalog
Layer 3 — Serie          M01 Storage Engine    M08 Snapshot/MVCC    M10 Multiseries Log
Layer 2 — structures      M02 WAL    M03 Segment    M04 Segment Metadata
                          M05 Primary Index    M06 Secondary Index    M07 Cache
Layer 1 — runtime        M13 Scheduler    M14 Thread Pool
Layer 0 — foundation           M18 Hot Path    metrics    io
```

Dependencies crossing layers that deserve attention:

| Relationship | Why it is delicate |
|---|---|
| M11 Compaction ↔ M05 Primary Index ↔ Serie writer (M01) | swap modifies the index while the writer updates it (QA-24) |
| M11 Compaction → M08 MVCC | determines which versions are needed and when a segment is reclaimable |
| M09 Transaction → M10 Multiseries Log → M02 WAL | flush order in 2PC (INV-T3) |
| M12 Recovery → almost everything | must know every persistent structure's format |
| M13 Scheduler ← metrics ← all | controllers depend on measurements produced everywhere |
| M17 Catalog → M01 Storage Engine | if Registri is a Serie, the catalog uses the storage it describes (QA-10) |

<a id="organizzazione-del-codice"></a>

## Code organization

> **Proposed** — One Common Lisp package per module (`arcdocdb.wal`, `arcdocdb.segment`, …), an
> `arcdocdb` ASDF system and an `arcdocdb/tests` test system. For now, the repository contains
> only the minimal system (`arcdocdb.asd`, [`src/package.lisp`](../src/package.lisp)): package
> subdivision is introduced with the first implementation milestone, when interfaces
> between modules have been fixed by [Phase 0](roadmap.md) decisions.

The code is **Common Lisp only** ([ADR-0001](adr/0001-common-lisp-sbcl.md)).

> **Decided ([ADR-0053](adr/0053-ricerca-full-text-indici-invertiti.md))** — Full-text search
> belongs to existing modules M06/M15. Analysis is prepared on compute workers;
> the Serie writer applies and publishes the delta with documents. Implementation
> and qualification remain in phase 8. The later completion of
> [ADR-0054](adr/0054-contratto-e-formato-full-text.md) defines
> [interfaces and ownership](full-text.md#confini-tra-moduli) and the
> [binary format](formato-indice-full-text.md).

<a id="contratti-tra-moduli"></a>

## Contracts between modules

Common interface rules are established in [architettura.md](architettura.md#contratti).
For each module, the following are also produced before implementation:

- offered operations and their durable effects;
- invariants the module guarantees and assumes from others;
- concurrency model (who may call what, from which context: Serie writer,
  reader, compaction worker);
- persistent formats it owns;
- crash points exposed for fault injection.
