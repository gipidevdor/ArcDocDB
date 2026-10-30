<a id="02--modello-logico"></a>

# 02 — Logical model

> **Source:** ‘Logical architecture’, ‘Special Serie Registri’, ‘Catalog’, and ‘Physical layout’ of the
> [specification](specifica/specifica-originale.md).

<a id="gerarchia"></a>

## Hierarchy

```
Server
└── Archivio
    └── Serie
        └── Documento
```

### Server

The main process. It is responsible for:

- connection management;
- the global scheduler;
- the dynamic thread pool;
- managing Archivio instances.

### Archivio

A logical container (domain) grouping multiple Serie. It is the **level at which multiseries
transactions and snapshots are requested**. Every Archivio MUST contain the special
[Registri](#registri) Serie.

### Serie

The document namespace and, above all, **the primary unit of storage and parallelism**.
A Serie:

- defines the paradigm/contract of its documents: structure/schema, validation, indexes,
  and storage configuration;
- owns its WAL, segments, and indexes;
- MUST be able to operate in parallel and independently of other Serie.

Everything physically shared between Serie is a potential point of contention: the specification
limits this to `multiserie.log` (and the computing resources controlled by the scheduler).

> **Decided (QA-21 → [ADR-0029](adr/0029-interfacce-protocollo-query-contratto.md))** — The specification does not define the schema/contract language or
> schema evolution rules.

The contract may declare **full-text** indexes with a name, scalar text fields,
and an immutable, versioned analysis profile
([ADR-0053](adr/0053-ricerca-full-text-indici-invertiti.md)). Documents and
queries use the same profile. Original text remains in the document;
changing the analyzer builds a new index generation.

### Documento

The logical data unit. It has an `_id` unique **within the Serie** and may have historical
versions, retained by append-only storage and governed by MVCC.

> **Decided (QA-01 → [ADR-0014](adr/0014-formato-record-documento-id.md))** — The document format, `_id` type, and on-disk record encoding are
> not specified.

## Registri

Registri is a special Serie, mandatory in every Archivio. **It is not the data WAL.**
It contains:

- the Serie catalog (metadatabase);
- Serie configuration metadata;
- the information required for catalog recovery;
- a single persistent `multiserie.log` file.

`multiserie.log` is the *transaction decision log* for transactions involving multiple Serie
(see [05 Transactions](05-transazioni.md)). There is **exactly one per Archivio**: there MUST NOT
be a separate file for each transaction.

> **Decided (QA-10 → [ADR-0022](adr/0022-registri-come-serie-catalogo.md))** — Registri is defined as a ‘special Serie’, but the illustrative layout shows only
> `catalog/` and `multiserie.log`. It remains to be decided whether the catalog is stored using the
> normal Serie mechanism (its own WAL + segments) or a dedicated format, and how bootstrap works
> (opening the Serie requires the catalog, which itself must be recovered first).

<a id="catalogo"></a>

## Catalog

`Registri/catalog/` contains the Serie catalog. For each Serie it stores at least:

| Field | Notes |
|---|---|
| name | identifies the Serie within the Archivio |
| configuration | general parameters |
| schema/contract | document structure and validation |
| index configuration | names, types, and fields; for full text, also the versioned analysis profile ([08](08-indici.md)) |
| segment configuration | e.g., target segment size (default ~256 MB) |
| state | Serie state |
| recovery metadata | what the [Recovery Manager](11-recovery.md) needs |

The catalog MUST support **transactional, crash-safe** modifications: creating, changing,
or deleting a Serie cannot leave the catalog in an intermediate state after a crash.
For full text, the catalog contract is authoritative; files, deltas, and
readiness are rebuildable derivatives. A generation becomes queryable
only when it completely covers the requested view.

<a id="layout-fisico"></a>

## Physical layout

Illustrative on-disk structure:

```
Archivio/
├── Registri/
│   ├── catalog/
│   └── multiserie.log
│
├── Serie-A/
│   ├── wal/
│   ├── segments/
│   └── index/
│
├── Serie-B/
│   ├── wal/
│   ├── segments/
│   └── index/
│
└── ...
```

Rules:

- each Serie remains **physically independent** (INV-W1);
- there MUST NOT be a global data WAL (INV-W1);
- the only shared log at Archivio level is `Registri/multiserie.log` (INV-W2).

> **Decided ([ADR-0022](adr/0022-registri-come-serie-catalogo.md))** — Because the Serie directories are siblings of `Registri/`, the name
> `Registri` must be reserved: no user Serie may have that name. It is also advisable for the
> directory name to be a stable internal identifier rather than the logical Serie name, so
> renaming changes only the catalog.

<a id="parallelismo-gerarchico"></a>

## Hierarchical parallelism

```
Server → Archivio → Serie → writer/readers → WAL → compaction → query/index operations
```

The Serie is the main unit of **load isolation**: a heavily used Serie must not
block others (INV-P3). Details in [10 Concurrency and scheduling](10-concorrenza-e-scheduling.md).
