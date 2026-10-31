# Code and language review — October 31, 2026

This edition adds the [source-derived code reference](code-reference.md) and
revises the English prose of the manual and source docstrings. CommonDoc Codex
assembles both forms of documentation into the same published edition.

## Scope

| Material | Review performed |
|---|---|
| 545 existing published Markdown documents | Complete reading for grammar, syntax, idiom, cohesion, clarity and consistent American English terminology |
| 1,773 existing source docstrings, including the root package | Translation or close review, with preconditions, postconditions, ownership, errors, numbers and literal identifiers preserved |
| Three public local-service conditions without docstrings | Source-based descriptions added for rejection, unknown outcome and cleanup failures |
| Generated reference and new guides | Editorial review of navigation, labels, scope statements and code-reference explanations |

Parallel AI editorial passes were followed by integration checks. The
[editorial policy](editorial-policy.md) defines the technical and evidentiary
limits of an editorial correction.

## Corrections and preservation

Corrections include missing articles and verbs, unclear antecedents, awkward
coordination, literal translations, cramped counts and inconsistent numeric
separators. Mathematical labels were translated where they were explanatory
placeholders rather than program identifiers. Eleven heading aliases preserve
previously published anchors after titles were corrected.

Source and accepted-ADR checks resolved ambiguity about the inclusive visibility
horizon, COMMIT-only decisions, I/O ownership, page-chain construction order,
fragment entry counts, cache-hit verification and CBOR comparison totals.
Historical measurements, failed attempts and qualification limits retain their
original scope. The edited presentation of the frozen float report identifies
its preserved original explicitly; raw archives were not rewritten.

The existing docstring replacements were checked byte for byte against their
source offsets: bytes outside those documentation tokens remained unchanged.
The three added condition descriptions change documentation metadata only.
Signatures, executable bodies, declared types and persistent formats are preserved.

## Verification

Publication checks cover Markdown and code inventories, source hashes, package
export resolution, definition anchors, direct symbol search and local links.
Separate runtime checks compare 53 loaded package interfaces, 670 exported
bindings and 613 exported prose contracts with the generated reference.
The [executable public example](lisp-api.md) checks the Unix-socket client through
PUT, GET, a clean service restart, DELETE and an absent result.
The product also passes its strict compilation and regression test suite on
SBCL 2.6.9, macOS ARM64, after the docstring edits.

These checks establish the stated documentation coverage and consistency. They
do not turn design targets, source comments or local tests into broader runtime,
performance or platform qualification.
