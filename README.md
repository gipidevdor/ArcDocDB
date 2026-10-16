<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="assets/img/mark-dark.svg">
    <img src="assets/img/mark-light.svg" alt="" width="72" height="72">
  </picture>
</p>

<h1 align="center">ArcDocDB</h1>

<p align="center">
  An append-only document database.<br>
  Designed for integrity. Built in Common Lisp.
</p>

<p align="center">
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-BSD--2--Clause-8e8e93?style=flat-square&labelColor=3a3a3c" alt="License: BSD-2-Clause"></a>
  <a href="docs/adr/0001-common-lisp-sbcl.md"><img src="https://img.shields.io/badge/language-Common%20Lisp-8e8e93?style=flat-square&labelColor=3a3a3c" alt="Language: Common Lisp"></a>
  <a href="https://www.sbcl.org/"><img src="https://img.shields.io/badge/runtime-SBCL%202.6%2B-8e8e93?style=flat-square&labelColor=3a3a3c" alt="Runtime: SBCL 2.6+"></a>
  <a href="docs/adr/0027-dipendenze-e-test.md"><img src="https://img.shields.io/badge/dependencies-none-8e8e93?style=flat-square&labelColor=3a3a3c" alt="Dependencies: none"></a>
  <a href="docs/roadmap.md"><img src="https://img.shields.io/badge/phase-0%20%C2%B7%20architecture-c9892f?style=flat-square&labelColor=3a3a3c" alt="Phase 0: architecture"></a>
</p>

<p align="center">
  <a href="#the-idea">Idea</a> ·
  <a href="#how-it-works">How it works</a> ·
  <a href="#decisions">Decisions</a> ·
  <a href="#reliability">Reliability</a> ·
  <a href="#limits">Limits</a> ·
  <a href="#status">Status</a> ·
  <a href="#quick-start">Start</a> ·
  <a href="docs/README.md">Documentation</a>
</p>

<br>

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="assets/img/hero-dark.svg">
    <img src="assets/img/hero-light.svg" alt="The segments of a Serie: one ACTIVE segment in colour, the only one that changes; below it, closed segments that are immutable forever; two short ones left by CLEAN; an obsolete one waiting for its last reader." width="100%">
  </picture>
</p>

## The idea

<table>
  <tr>
    <td width="33%" valign="top">
      <strong>Nothing is overwritten.</strong><br><br>
      Every record is appended once. Closed segments remain immutable. Durable commits and recovery are designed
      around that stable foundation.
    </td>
    <td width="33%" valign="top">
      <strong>One writer per Serie.</strong><br><br>
      A Serie owns its log, its segments, its indexes. Serie write in parallel.
      Readers use concurrent index access with bounded retries.
    </td>
    <td width="33%" valign="top">
      <strong>Nothing unverified leaves.</strong><br><br>
      Every record is checked on every read. A write that fails stops the Serie
      instead of guessing.
    </td>
  </tr>
</table>

ArcDocDB is a general-purpose document engine, written in Common Lisp and engineered as
safety-critical software. Reliability comes first; performance follows from the layout
rather than from shortcuts.

The first intended use of ArcDocDB is as the database of a **Usenet NNTP server written
in Common Lisp**. This primary [use case](docs/valutazione/caso-duso-nntp.md) guides implementation and validation of
article lookup, ordered group overviews, full-text search, cross-posting, retention and recovery.
The default client interface will be a **local Unix stream socket** between the NNTP
daemon and database processes. Its first integration takes priority after engine startup,
recovery and request admission; TCP is an optional later transport, disabled by default
([ADR-0055](docs/adr/0055-interfaccia-locale-unix-socket.md)). The interface remains to be implemented.

**Full-text search** is an approved v1 requirement, designed around dedicated
per-segment inverted indexes for words and
phrases, combined with structured filters and snapshot visibility. The
[design](docs/08-indici.md#ricerca-full-text) is recorded. The first
[product core](docs/implementazione/full-text.md) implements Unicode analysis,
in-memory positional runs, the complete binary index codec and queries on verified file views.
[CBOR document preparation](docs/implementazione/full-text-documenti.md) adds nested field extraction,
cumulative limits and a conservative file size bound before writer admission;
writer/MVCC integration, generation publication and full qualification
belong to phase 8.

The [full-text contract](docs/full-text.md) and
[binary index format](docs/formato-indice-full-text.md) specify the analyzer, queries,
generation lifecycle, resource limits and acceptance criteria for that implementation.

## How it works

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="assets/img/flow-dark.svg">
    <img src="assets/img/flow-light.svg" alt="A write reaches the single writer of the Serie and is appended to the ACTIVE segment, which later becomes an immutable CLOSED segment that CLEAN and MERGE copy but never modify. A read takes no lock: primary index in memory, cache by location, verification with CRC32C, reply." width="100%">
  </picture>
</p>

```
Server
└── Archivio          commit order · snapshots · multi-Serie transactions
    ├── Registri      the catalog, itself a Serie
    └── Serie         one writer · its own log, segments, indexes
        └── Documento opaque, versioned, under a unique _id
```

Start with the consolidated design: [architettura.md](docs/architettura.md).

## Decisions

Each decision records its context, constraints and verification method.

| Area | Decision | Record |
|---|---|---|
| Laws | Parallelism is foundational. One atomic point per operation. Prepare, decide, complete. Nothing is destroyed by absence. | [0036](docs/adr/0036-leggi-di-progetto.md) |
| Storage | The ACTIVE segment is the log. Each record is written once, in sealed batches. | [0013](docs/adr/0013-log-structured-segmento-active-come-log.md) · [0037](docs/adr/0037-lotto-sigillato.md) |
| Index | A directory of small flat hash tables in memory: one writer, lock-free readers. | [0043](docs/adr/0043-primary-index-a-frammenti.md) · [0032](docs/adr/0032-seqlock-a-64-bit.md) |
| Secondary indexes | One immutable, fixed-format file per segment. | [0026](docs/adr/0026-indici-secondari-segmentati.md) |
| Full-text search | Dedicated inverted indexes with term positions, versioned analyzers and complete snapshot coverage. Planned for phase 8. | [0053](docs/adr/0053-ricerca-full-text-indici-invertiti.md) |
| Durability | Group commit by default. The writer never waits for a flush. | [0019](docs/adr/0019-durability-e-group-commit-pipelined.md) · [0037](docs/adr/0037-lotto-sigillato.md) |
| Snapshots | One commit sequence per Archivio; it is also the document version. A snapshot is born when everything below it is visible. | [0020](docs/adr/0020-csn-snapshot-isolamento.md) · [0038](docs/adr/0038-orizzonte-di-visibilita.md) |
| Transactions | Two-phase commit across Serie, with a writer that never blocks. | [0021](docs/adr/0021-2pc-intenti-outcome.md) · [0041](docs/adr/0041-multiserie-segmenti-autosufficienti.md) |
| Compaction | Copy-on-write. The swap is a single log record. | [0040](docs/adr/0040-manifest-a-record-unico.md) · [0023](docs/adr/0023-politiche-di-compaction.md) · [0042](docs/adr/0042-tombstone-e-indice-dei-vivi.md) |
| Integrity | Fail-stop on any write error. Verification on every read. Recovery never truncates. | [0033](docs/adr/0033-fail-stop-e-integrita-end-to-end.md) · [0039](docs/adr/0039-cornice-unica-dei-record.md) |
| Code | Checks always on. No warnings. No dependencies. | [0034](docs/adr/0034-policy-di-compilazione-e-standard-di-codifica.md) · [0027](docs/adr/0027-dipendenze-e-test.md) |

All decisions are in the [decision log](docs/adr/README.md); the reasoning that ties them
together is the [design analysis](docs/analisi-progettuale.md).

## Reliability

Priorities, in order. A lower one never weakens a higher one.

**Integrity of committed data · Correctness · Defined behaviour under faults · Verifiability · Availability · Performance**

| Design commitment | Planned verification |
|---|---|
| No committed datum is lost or corrupted without being detected and declared. | Fault injection, protocol models, offline verifier |
| No wrong answer is given in silence. | Verification on read, corruption tests, fuzzing |
| Every fault in the [fault model](docs/affidabilita/analisi-dei-guasti.md) has a defined response to verify. | Twenty-seven failure modes, each traced to a test |
| Every requirement is traced to its verification. | A [matrix](docs/tracciabilita/matrice.md) generated and checked by a tool |

It does not promise the impossible. It cannot survive the loss of every copy of the data,
a disk that lies about a flush, or a defect in the compiler. Those are stated, and made
detectable where they can be: see the [assurance case](docs/affidabilita/README.md).

## Limits

| Dimension | Limit |
|---|---|
| `_id` | 1 to 65,535 bytes (v2 design) |
| Document | 16 MiB of encoded document (v2 design) |
| Segment | up to 4 GiB · 256 MiB by default |
| Documents per server | resident capacity depends on memory and key size; v2 measurements pending |

Every limit and where it comes from: [limiti.md](docs/limiti.md).

## Status

[![CI](https://github.com/gpicchiarelli/ArcDocDB/actions/workflows/ci.yml/badge.svg)](https://github.com/gpicchiarelli/ArcDocDB/actions/workflows/ci.yml)

**Phase 0 — architecture, foundations and integration testing.** Product components are implemented; experiments and integration tests evaluate their contracts. The complete database engine remains under development.

| | |
|---|---|
| Done | Specification · architecture · on-disk formats · [product foundations](docs/implementazione/README.md) for storage, index, reads, recovery and scheduling |
| Now | A [single-Serie integration test](docs/implementazione/prova-verticale.md) with durable writes, rotation, SIGKILL, recovery, resumed writes and a second crash; coordination remains in the test harness |
| Next | Integrate production startup, recovery and request admission, then the first local Unix socket client/server path; complete the reference-scale campaigns and protocol models in the [spike plan](docs/valutazione/piano-spike.md) |
| Reference application | Database for a future Common Lisp NNTP server; application requirements are documented, protocol implementation remains future work |
| Full-text requirement | Unicode 18 analysis, CBOR document preparation, positional all/any/phrase predicates, complete `.idx` codec and verified file views implemented; durable publication, writer/MVCC and Query Engine integration remain pending |
| Then | Ten implementation phases, each closed by a verification gate: the [roadmap](docs/roadmap.md) |

Product throughput figures remain targets or estimates. Measurements from individual
experiments report the machine, command, scale and limitations separately.

## Quick start

SBCL is the only requirement.

```bash
git clone https://github.com/gpicchiarelli/ArcDocDB.git
cd ArcDocDB
make check
```

`make check` builds with every warning treated as an error, runs the tests and the linter,
verifies the traceability matrix and every link, and runs the ten experiment checks.
`make spikes-bench` runs local measurements in isolated processes, one experiment at a time;
the raw reports include commands and environment under `spikes/out/`.

## Repository

| Location | Purpose |
|---|---|
| [`docs/`](docs/README.md) | Specification, architecture, decisions, reliability, traceability. Written in Italian. |
| [`src/`](src) · [`tests/`](tests) | Product foundations and their component and integration tests. |
| [`spikes/`](spikes/README.md) | Disposable experiments. |
| [`tools/`](tools) | Build, linter, traceability and link checkers, in Common Lisp. |
| [`assets/`](assets/README.md) | The design language. |

Read the [documentation](docs/README.md), review the [changes](CHANGELOG.md), or follow the
[contribution guide](CONTRIBUTING.md). Report sensitive findings through the
[security policy](SECURITY.md).

<br>

<p align="center">
  <sub><a href="LICENSE">BSD 2-Clause</a> · Giacomo Picchiarelli</sub>
</p>
