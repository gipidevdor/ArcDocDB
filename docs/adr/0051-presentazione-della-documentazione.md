<a id="adr-0051--presentazione-della-specifica-e-delle-guide-del-repository"></a>

# ADR-0051 — Presentation of the specification and repository guides

- **Status:** Accepted (documentation reorganization requested by the author)
- **Date:** 2026-10-08
- **Relationship to the specification:** amends only the name and introductory note of the
  original specification; its body and requirements remain unchanged.
- **References:** [original specification](../specifica/specifica-originale.md),
  [repository guide](../guida-al-repository.md),
  [contributing](../../CONTRIBUTING.md), [test register](../valutazione/registro-delle-prove.md)

<a id="contesto"></a>

## Context

Work guides are duplicated and some experiment notes describe how work is organized
rather than the reproducible method. Public documentation must describe the design,
verification, and its limits.

<a id="decisione"></a>

## Decision

1. The original specification has a name consistent with its role as a technical
   document. The introductory note preserves the clarifications about transcription and
   MERGE; the body after the initial separator is identical.
2. Common rules are collected in the repository guide, linked from
   `CONTRIBUTING.md`. Local tool configurations remain local.
3. Spike notes describe modules, runners, dependencies, and campaigns.
   Data, commands, source hashes, and original test outputs are preserved.

The reorganization introduces no serialization into the engine, shared writes, or durable
operations; it requires no new atomicity point.

<a id="conseguenze"></a>

## Consequences

A single guide collects common rules. Links to the specification are updated
along with the document. Historical evidence retains its provenance and is not
rewritten to standardize its vocabulary.

<a id="alternative-considerate"></a>

## Alternatives considered

- Keeping duplicate guides: requires keeping them synchronized.
- Rewriting original reports too: compromises provenance verification.

<a id="valutazione"></a>

## Evaluation

Compare the specification body with the previous revision, check links and traceability,
and run the `make check` suite. No engine requirement changes status as a result
of the reorganization.
