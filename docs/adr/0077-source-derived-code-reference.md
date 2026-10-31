# ADR-0077 — Source-derived code reference in the CommonDoc Codex edition

- **Status:** Accepted for the documentation expansion requested on 2026-10-31
- **Scope:** Code documentation, source docstrings and publication verification
- **References:** ADR-0001, ADR-0027, ADR-0051, ADR-0075

## Context

The first online edition published the Markdown manual, including implementation
notes and design documents, but did not extract a reference from the Lisp code.
The author explicitly requested that missing reference and a complete linguistic
review. The reference must track the actual source and retain platform-specific
definitions without suggesting that they are active or qualified everywhere.

## Decision

Extend the documentation-only Common Lisp toolchain with a static source adapter.
It tokenizes source syntax without using the Common Lisp reader on product forms,
interning symbols, evaluating `#.` forms or expanding product macros. It preserves
reader-conditional branches and source offsets. Package exports must resolve to
explicit definitions, supported standard generated bindings or imported bindings.
Unresolved exports fail publication.

Render a package interface page and a reference for each Lisp source file through
the existing CommonDoc Codex assembly and project HTML template. Include explicit
argument lists, declared function types, docstrings, type and slot declarations,
source locations and direct condition signals with their static-analysis limit.
Identify generated bindings and internal definitions explicitly. Include code
pages in navigation, search, the sitemap and the publication coverage checks.

Translate and edit source docstrings in place. They remain the authoritative prose
contracts; no separate hand-maintained API description is introduced. Editorial
changes do not authorize changes to executable forms, contracts or accepted
concurrency guarantees. Missing documentation must remain visible until written
from verified source behavior rather than being filled with an inferred promise.

The documentation workflow also runs when `src/` or the product ASDF definition
changes. Its artifact records source hashes and an export/definition inventory.
Tests cover the source constructs the adapter claims to support and reject
malformed syntax or incomplete published coverage.

After rendering, independently compile and load the product in a separate process
to compare runtime package exports and exported prose contracts with the source
reference. Run the public Lisp example through an isolated temporary Unix service.
These checks may load product definitions and create disposable example storage;
they are not part of source extraction or page rendering. They extend ADR-0075's
verification scope without giving the renderer a dependency on a running engine.

## Alternatives and consequences

The pinned CommonDoc Codex version delegates system extraction to Docparser,
whose loader can catch compilation errors and continue. Using that path alone
would require independent coverage checks and would extract only the branches
selected by the build host. The static adapter gives explicit, testable source
coverage while preserving the existing rule that rendering does not load or
start the storage engine.

The adapter is not a Common Lisp evaluator or a general macro expander. New
definition-producing constructs require explicit support and tests. The reference
reports source declarations, not a proof of runtime behavior. Product compilation,
tests, performance evidence and platform qualification remain separate checks.
No product dependency, durable format or runtime protocol is changed.
