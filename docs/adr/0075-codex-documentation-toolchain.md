# ADR-0075 — Codex toolchain for the documentation edition

- **Status:** Accepted for the documentation workflow requested on 2026-10-31
- **Scope:** Documentation generation and GitHub Pages; no product behavior change
- **References:** ADR-0001, ADR-0027, ADR-0051

## Context

The author requested a complete GitHub Pages edition, including the design
documentation, using the Common Lisp module Codex. The existing Markdown is the
canonical source. The database and its tests retain their SBCL-only dependency
contract. An external documentation generator requires an explicit, separate scope.

## Decision

Use CommonDoc Codex for the documentation build, with a project CommonDoc macro
and registered HTML template. 3bmd renders the existing Markdown. The builder
generates a temporary Scriba document and manifest, then calls `codex:document`.
It does not load, introspect or modify the running storage engine.

All bootstrap, generation and verification tools are Common Lisp. The
documentation-only dependency closure is fixed by archive SHA256 in a readable
Lisp lock file. Setup uses HTTPS and verifies every archive before extraction.
ASDF sources and compiled files stay in a private ignored build directory;
the user's Quicklisp installation is neither required nor changed.

The requested browser edition also contains its own HTML, CSS and JavaScript.
JavaScript provides local search, appearance preferences and optional Mermaid
rendering. Reading, the full catalog, tables, source links and diagram source
remain available without JavaScript. Scripts and fonts do not require a remote
runtime service. The optional preview may use Python's standard HTTP server;
Python is not required to build or verify the site.

These are explicit documentation exceptions to the repository-wide language and
dependency rules. They do not amend the `arcdocdb` system, its runtime, product
tests or spikes. No third-party library enters a database execution path.

## Publication contract

Every repository Markdown document is included except GitHub issue/PR templates
and raw `spikes/results/` evidence. Links to code and raw evidence retain access
to the corresponding GitHub source revision. Documentation is not replaced by
summaries. The site distinguishes executable M1 capabilities from designed
contracts and unqualified claims.

Pull requests build and verify the complete edition. Only `main` deploys, through
GitHub's Pages artifact and OIDC workflow. No generated site branch or personal
access token is introduced. A failed build does not publish an incomplete edition.
Coverage, source hashes, rendered structure, unique anchors, relative links and
search coverage are publication gates. Visual browser qualification is separate
and must not be claimed from static checks alone.

## Consequences and alternatives

Codex is archived upstream. Fixed dependencies and a local extension make its
maintenance scope visible, but upstream compiler warnings and future toolchain
compatibility remain documentation concerns. They are not silently granted an
exception in a product build. Product builds do not load this toolchain.

A hosted documentation service would add an unnecessary publishing dependency.
Converting the source collection to Scriba would create editorial churn and risk
breaking stable links. A separate hand-maintained website would duplicate source
material. The selected adapter preserves the existing documents and lets Codex
own assembly and HTML emission.
