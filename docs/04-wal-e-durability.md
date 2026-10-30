<a id="04--wal-e-durability"></a>

# 04 — WAL and durability

> **Source:** ‘WAL’ of the [specification](specifica/specifica-originale.md); references from ‘Multiseries
> transactions’ and ‘Recovery’.
> **Modules:** M02 WAL Manager.
> **Decisions:** [ADR-0013](adr/0013-log-structured-segmento-active-come-log.md) **amends
> this section**: the Serie's data log is the ACTIVE segment; `wal/control.log` is the
> structural WAL. [ADR-0019](adr/0019-durability-e-group-commit-pipelined.md) defines
> durability levels; [ADR-0037](adr/0037-lotto-sigillato.md) defines the mechanics: sealed
> batches, one I/O task at a time per log, acknowledgment after publication, and the durable
> frontier. The text below reproduces the original specification; where it differs,
> the ADRs take precedence.

<a id="un-wal-per-serie"></a>

## One WAL per Serie

Each Serie owns an independent WAL in `Serie/wal/`. There MUST NOT be a global
data WAL (INV-W1).

The WAL provides:

- **durability** — acknowledged operations survive a crash;
- **recovery** — restarting after a crash ([11 Recovery](11-recovery.md));
- **state reconstruction** — indexes and metadata are derivable;
- **ordered recording of changes** — WAL order is commit order within the Serie.

Since only the Serie's logical writer writes the WAL
([10](10-concorrenza-e-scheduling.md)), appending requires no coordination with other Serie.

## Group commit

The system MUST favor group commit: many transactions share a single flush
operation.

```
TX101 ─┐
TX102 ─┼──> WAL append ──> fsync
TX103 ─┘
```

- Avoid an `fsync` for every individual operation, **unless** strong durability is
  explicitly requested.
- `multiserie.log` MUST also use group commit where appropriate.

<a id="livelli-di-durability"></a>

## Durability levels

The specification assumes several levels without formally listing them. Three can be inferred:

| Level | Where it appears in the specification | Expected behavior |
|---|---|---|
| async | ‘INSERT async durability’ target | acknowledgment before flush; a window of recent writes may be lost on a crash |
| group commit | ‘favor group commit’, ‘INSERT group commit’ target | acknowledgment after an `fsync` shared with other transactions |
| strong | ‘unless strong durability is explicitly requested’ | `fsync` dedicated to the operation |

> **Decided (QA-05 → [ADR-0019](adr/0019-durability-e-group-commit-pipelined.md))** — Names, exact semantics, the default level, and granularity (per Serie,
> request, or transaction) need definition. In particular, the meaning of ‘committed’
> for INV-D1 at the async level must be specified.

<a id="il-wal-nelle-transazioni-multiserie"></a>

## The WAL in multiseries transactions

In a multiseries transaction, each participating Serie records its own PREPARE in its
WAL and performs flush/fsync according to the durability level **before** the decision is
written to `multiserie.log`. The Serie WAL therefore also contains protocol records
(prepare, commit, abort) in addition to changes. See [05 Transactions](05-transazioni.md).

<a id="metriche"></a>

## Metrics

To expose ([12 Observability](12-osservabilita.md)): append throughput, `fsync` latency,
group size, and WAL queue depth. `fsync` latency and WAL throughput are also load signals
for the MERGE [low-load policy](07-compaction.md#low-load-policy) and the
[scheduler](10-concorrenza-e-scheduling.md).

<a id="questioni-decise"></a>

## Decided questions

- **QA-02** ([ADR-0013](adr/0013-log-structured-segmento-active-come-log.md)) — WAL ↔ segment relationship and WAL truncation policy.
- **QA-05** ([ADR-0019](adr/0019-durability-e-group-commit-pipelined.md)) — Durability levels.
- **QA-19** ([ADR-0017](adr/0017-piattaforma-e-io.md)) — Per-platform I/O primitives. Relevant to macOS development: `fsync` there
  does not guarantee persistence on physical media (`F_FULLFSYNC` is needed); durability
  tests must therefore be interpreted per platform.

> **Decided ([ADR-0039](adr/0039-cornice-unica-dei-record.md), [ADR-0037](adr/0037-lotto-sigillato.md))** —
> Every record carries lengths and two CRC32C checksums (header and body); every batch ends
> with a SEAL fixing its contents and declaring the durable frontier. Recovery can thus
> distinguish a complete batch from a tail (scenario FI-01), and a tail from corruption,
> without depending on the order in which media persisted the writes (INV-F2, INV-F3).
> In multiseries transactions there is no PREPARE record: prepared records are made atomic
> by their batch's SEAL ([ADR-0041](adr/0041-multiserie-segmenti-autosufficienti.md)). Format in
> [formati-su-disco.md](formati-su-disco.md#cornice-del-record).
