# 14 — Fault injection

> **Source:** ‘Fault injection’ of the [specification](specifica/specifica-originale.md).

<a id="scenari"></a>

## Scenarios

Fault-injection tests must be implemented for at least these crash points.

| ID | Crash… | Subsystem | Invariants to check |
|---|---|---|---|
| FI-01 | during WAL append | [WAL](04-wal-e-durability.md) | INV-D1 |
| FI-02 | during fsync | [WAL](04-wal-e-durability.md) | INV-D1 |
| FI-03 | after prepare | [Transactions](05-transazioni.md) | INV-T4, INV-D1 |
| FI-04 | before the commit decision | [Transactions](05-transazioni.md) | INV-T4, INV-T3 |
| FI-05 | after the commit decision | [Transactions](05-transazioni.md) | INV-T4, INV-T3, INV-D1 |
| FI-06 | during atomic index swap | [Compaction](07-compaction.md), [Indexes](08-indici.md) | INV-C7, INV-C8, INV-D1 |
| FI-07 | during CLEAN | [Compaction](07-compaction.md) | INV-C3, INV-C8, INV-C9 |
| FI-08 | during MERGE | [Compaction](07-compaction.md) | INV-C3, INV-C8, INV-C9 |
| FI-09 | during reclaim | [Compaction](07-compaction.md), [MVCC](06-mvcc-e-snapshot.md) | INV-R1, INV-D1 |
| FI-10 | during index rebuild | [Recovery](11-recovery.md) | INV-D1, INV-S6 |
| FI-11 | with active snapshots | [MVCC](06-mvcc-e-snapshot.md) | INV-M1, INV-M2, INV-R1 |
| FI-12 | during a multiseries transaction | [Transactions](05-transazioni.md) | INV-T4, INV-T5 |
| FI-13 | during Serie creation/deletion (added by [ADR-0022](adr/0022-registri-come-serie-catalogo.md)) | [Logical model](02-modello-logico.md#catalogo) | catalog consistent with directories; no partially created Serie |

<a id="invarianti-da-verificare"></a>

## Invariants to check

From the specification, with corresponding identifiers in [invarianti.md](invarianti.md):

| # | Invariant | ID |
|---|---|---|
| 1 | no committed data may be lost | INV-D1 |
| 2 | no multiseries transaction may be partially committed | INV-T4 |
| 3 | no still-referenced segment may be deleted | INV-R1 |
| 4 | no snapshot may observe an inconsistent version | INV-M1 |
| 5 | a source segment must remain recoverable until the swap completes | INV-C8 |
| 6 | an interrupted compaction must be repeatable or completable during recovery | INV-C9 |

<a id="implicazioni-architetturali"></a>

## Architectural implications

Fault injection shapes the design from the start; it is not added at the end.

> **Decided ([ADR-0035](adr/0035-strategia-di-verifica-e-tracciabilita.md))** — Testability requirements:
>
> - **Named crash points.** Each protocol step (append, fsync, prepare, decision,
>   swap, segment-state change, deletion) passes through an identifiable injection point,
>   so FI scenarios can be expressed as ‘crash at point X’.
> - **Replaceable I/O layer.** All writes and `fsync`s go through one interface,
>   which tests can use to simulate partial writes, skipped `fsync`s, and loss
>   of unsynchronized data.
> - **Oracle.** A reference model records what was acknowledged to the client; after
>   recovery, database state is compared with the model.
> - **Two levels.** Deterministic in-process simulation (fast, exhaustive over crash points)
>   and real SBCL process crashes (`kill -9`) on a real filesystem.
> - **Protocol models.** 2PC + recovery and the compaction + reclaim workflow are small
>   enough to describe as state machines and explore exhaustively before writing code:
>   this is an evaluation-phase activity
>   ([spike plan](valutazione/piano-spike.md), SPK-07).

<a id="questioni-decise"></a>

## Decided questions

- ‘Committed’ for the oracle: acknowledged at `:group` or `:strong` level; with `:async`, the
  oracle requires only a consistent log prefix
  ([ADR-0019](adr/0019-durability-e-group-commit-pipelined.md)).
- Per-platform flush: `fdatasync` on Linux, `F_FULLFSYNC` on macOS, behind a single
  primitive ([ADR-0017](adr/0017-piattaforma-e-io.md)). A flush reported successful but not
  durable remains a declared residual risk
  ([FM-03](affidabilita/analisi-dei-guasti.md#fm-03)).
- Beyond crashes, the simulator injects I/O errors, corruption, and lost writes: see
  the [failure analysis](affidabilita/analisi-dei-guasti.md).
- In FI-01 and FI-02, the simulator persists **any subset** of not-yet-synchronized
  batches, including out of order and partially: recovery must conclude
  ‘tail’, not ‘corruption’ ([ADR-0037](adr/0037-lotto-sigillato.md), INV-F3).
- Every scenario is expressed as ‘crash before or after the operation's atomicity point’
  ([ADR-0036](adr/0036-leggi-di-progetto.md)); after every recovery, segment bytes are
  compared with their pre-recovery contents (INV-A9).
