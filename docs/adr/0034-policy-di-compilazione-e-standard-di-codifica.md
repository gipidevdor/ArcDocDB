<a id="adr-0034--politica-di-compilazione-e-standard-di-codifica"></a>

# ADR-0034 — Compilation policy and coding standard

- **Status:** Accepted
- **Date:** 2026-10-03
- **Relationship to the specification:** no amendment; clarifies "SIMD and native optimizations" items
  2–4 (type declarations, minimizing boxing) within the framework of [ADR-0031](0031-software-critico-criteri-e-priorita.md)
- **References:** [coding standard](../affidabilita/standard-di-codifica.md), INV-A3,
  INV-A4, INV-A8

<a id="contesto"></a>

## Context

Common Lisp with `(safety 0)` or `truly-the` removes the checks that turn a defect
into a signaled error: an out-of-bounds write becomes silent memory corruption.
In a critical system, a defect must be **detected**, not propagated.

<a id="decisione"></a>

## Decision

1. **Safety.** No product code is compiled with `safety` below 2. With `safety 2`
   (or 3), SBCL retains full type and array-bounds checks
   (verified: out-of-bounds access in a `(safety 2) (speed 3)` function signals
   `invalid-array-index-error`). Default policy: `(safety 3)`. Hot paths entered
   in the exception register may use `(safety 2) (speed 3)`; **never** `(safety 0)`,
   `(safety 1)` with higher `speed` (which weakens type checks), `truly-the`,
   `(optimize (sb-c::insert-array-bounds-checks 0))`.
2. **Warning-free compilation.** The build fails on any `warning` or `style-warning`
   (undefined function or variable, inconsistent type, unused variable).
3. **Declarations.** Every C1 and C2 function has a complete `ftype` declaration; every structure
   slot has a type; C1 structures are `defstruct` with typed slots and, where
   possible, `:read-only`. Format constants (offsets, sizes) are defined once
   in a formats module and used by everyone.
4. **Prohibitions** (checked by `tools/lint.lisp`): `eval`, `compile`, `load`, and `intern`
   on external data; `read` of untrusted data (and `*read-eval*` always `nil`);
   `ignore-errors`; `truly-the`; `safety 0`; functions longer than 60 lines; product
   functions without docstrings.
5. **Structural rules** (adapted from "Power of 10," detailed in the
   [standard](../affidabilita/standard-di-codifica.md)): loops with a proven
   or declared upper bound; recursion allowed only with bounded and declared depth; minimum variable
   scope; explicit checking of every return value that may indicate an error;
   restricted, documented macros; no mutable global state without a declared owner
   (INV-V4).
6. **Concurrency.** Only `sb-thread`, `sb-ext:compare-and-swap`, and `sb-thread:barrier`; every
   shared structure has a single declared owner and a documented protocol;
   `without-interrupts` and `without-gcing` prohibited outside the `io` module (if ever necessary,
   as a registered deviation).
7. **Hot-path exception register** (`docs/affidabilita/deviazioni.md`,
   "Hot path" section): a function is entered only with a measurement (SPK) showing that
   `(safety 3)` does not meet the [performance minimums](0028-target-e-obiettivi-di-latenza.md),
   and it retains all `(safety 2)` checks.
8. **Tools.** `tools/lint.lisp` (prohibitions, length, docstrings); warning-free
   compilation in `make`; both run by CI. The tool itself is verified by
   invalid-code fixtures (`--self-test`).

<a id="conseguenze"></a>

## Consequences

- An indexing or type defect becomes a signaled error (→ `invariant-violation`,
  Serie `FAULTED`, [ADR-0033](0033-fail-stop-e-integrita-end-to-end.md)), not corruption.
- Performance cost of checks: estimated around 10–30 % in the tightest loops;
  measured by SPK-09. If minimums are not met, algorithms are improved.
- Code is uniform and tool-verifiable.

<a id="alternative-considerate"></a>

## Alternatives considered

- *`(safety 0)` on hot paths with extensive testing:* rejected: a defect missed by tests
  becomes silent corruption.
- *An external linter:* no external dependencies ([ADR-0027](0027-dipendenze-e-test.md));
  there are few rules and they are project-specific.

<a id="valutazione"></a>

## Assessment

- Risks: RSK-19.
- Verification: `make lint` and warning-free compilation in CI; linter
  regression tests; SPK-09 measures the cost.
