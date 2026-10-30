<a id="adr-nnnn--titolo-breve-della-decisione"></a>

# ADR-NNNN — Short decision title

- **Status:** Proposed | Accepted | Superseded by ADR-nnnn | Withdrawn
- **Date:** YYYY-MM-DD
- **Relationship to the specification:** records a specification decision | resolves QA-nn |
  amends section …
- **References:** subject guides, invariants, spikes

<a id="contesto"></a>
## Context

The problem and constraints. Why a decision is needed now.

<a id="decisione"></a>
## Decision

What was decided, in prescriptive form. Every decision also answers the two
questions from the [design laws](0036-leggi-di-progetto.md):

- **what it serializes**, and at which level: parallelism is foundational, with no
  shared point across Serie outside the closed list;
- **where its atomicity point is**, if the operation changes durable state:
  what is preparation and what is completion.

<a id="conseguenze"></a>
## Consequences

What becomes simpler, what becomes harder, and what obligations arise for other modules.

<a id="alternative-considerate"></a>
## Alternatives considered

For each alternative: a one-line description and the reason it was rejected.

<a id="valutazione"></a>
## Evaluation

Related risks (`RSK-…`), how the decision is verified (`SPK-…`, benchmarks, tests),
and what result would lead to reconsidering it.
