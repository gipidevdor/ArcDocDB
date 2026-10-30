<a id="adr-0001--common-lispsbcl-solo-common-lisp-per-ora"></a>

# ADR-0001 — Common Lisp/SBCL; Common Lisp only for now

- **Status:** Accepted
- **Date:** 2026-10-01
- **Relationship to the specification:** records the specification's language choice and **amends**
  the “SIMD and native optimizations” section (see Decision, item 2)
- **References:** [15 Native optimizations](../15-ottimizzazioni-native.md), INV-X3

<a id="contesto"></a>

## Context

The specification calls for a database “written primarily in Common Lisp, with SBCL as the
reference implementation,” and allows SBCL-specific operations, foreign functions, C/C++, or
Rust for the most demanding hot paths.

On 2026-10-01, while structuring the project, the author decided that the project would use
**Common Lisp only** for now.

<a id="decisione"></a>

## Decision

1. The project language is Common Lisp; SBCL is the reference implementation.
2. **For now, all code in the repository is Common Lisp**: no components in C, C++, or
   Rust, even for hot paths. The option allowed by the specification is suspended.
3. SBCL extensions and contrib modules are allowed.
4. This constraint can be reconsidered only through a new ADR, supported by measurements
   showing a hot path that cannot be addressed otherwise.

<a id="conseguenze"></a>

## Consequences

- One language, one memory model, no foreign boundary on the hot path.
- Primitives that would otherwise come from C libraries (checksums, hashing, compression,
  asynchronous I/O) must be written in Common Lisp or obtained through SBCL facilities.
- SBCL's GC behavior becomes a design constraint: compact structures, no allocation on
  the hot path.
- To clarify: whether third-party Common Lisp libraries are allowed (QA-22).

<a id="alternative-considerate"></a>

## Alternatives considered

- *C/Rust core with Lisp logic:* rejected by the author's decision; may be revisited later.
- *Another Common Lisp implementation:* the specification names SBCL as the reference.

<a id="valutazione"></a>

## Assessment

- Risks: RSK-01 (GC), RSK-16 (primitives without foreign code), RSK-11 (platforms).
- Verification: SPK-02 (GC), SPK-01 (index), SPK-03 and SPK-05 (I/O), SPK-08 (generated code).
- Reasons to revisit the decision: GC pauses incompatible with the P99 target even in the
  best configuration; a measured hot path missing its target with no remedy in Common
  Lisp.
