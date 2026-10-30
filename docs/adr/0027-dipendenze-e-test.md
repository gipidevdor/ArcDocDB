<a id="adr-0027--nessuna-dipendenza-esterna-harness-di-test-proprio"></a>

# ADR-0027 — No external dependencies; custom test harness

- **Status:** Accepted
- **Date:** 2026-10-03
- **Relationship to the specification:** closes QA-22; applies [ADR-0001](0001-common-lisp-sbcl.md)
- **References:** [engineering principles](../principi-di-ingegneria.md)

<a id="decisione"></a>

## Decision

1. The `arcdocdb` system depends only on SBCL and its contrib modules (`sb-thread`, `sb-posix`,
   `sb-unix`, `sb-concurrency` where useful, `sb-simd` with the backends available on x86-64 and
   ARM64, including NEON, under [ADR-0012](0012-simd-guidato-dai-benchmark.md)). Each backend
   requires support detection and platform qualification; allowing the contrib module
   does not establish its availability. No third-party libraries, even for
   CBOR, CRC, hashing, or the CLI.
2. Tests use a **custom harness** (`arcdocdb/tests`): per-module test registration,
   assertions, parallel execution where possible, and the **fault-injection runner**
   (crashes at named points, simulated I/O, oracle). An external framework would not
   provide the latter, which is the part that matters.
3. Spikes follow the same rule.
4. Development tools (CI, link checking) are Common Lisp scripts run with
   `sbcl --script`.

<a id="conseguenze"></a>

## Consequences

- Full control over code on hot paths and in recovery.
- More code to write (CBOR, CRC32C, hashing, histograms): all small and table-driven.
- No package manager required to build: `sbcl` and ASDF suffice.

<a id="alternative-considerate"></a>

## Alternatives considered

- *Quicklisp with a few established libraries:* convenient, but introduces code not typed
  for our purposes on hot paths and an uncontrolled quality boundary.
