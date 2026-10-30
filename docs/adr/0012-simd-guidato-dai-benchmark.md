<a id="adr-0012--simd-solo-dove-i-benchmark-lo-giustificano"></a>

# ADR-0012 — SIMD only where benchmarks justify it

- **Status:** Accepted
- **Date:** 2026-10-01
- **Clarification:** 2026-10-22, systematic evaluation of SIMD variants that can be used safely.
- **Relationship to the specification:** records a specification decision (“SIMD and
  native optimizations”), within [ADR-0001](0001-common-lisp-sbcl.md)
- **References:** [15 Native optimizations](../15-ottimizzazioni-native.md), INV-X1

<a id="contesto"></a>

## Context

Many database operations lend themselves to SIMD, but specialized code has portability
and maintenance costs, and optimizing before measuring often means optimizing the
wrong place.

<a id="decisione"></a>

## Decision

The following requirements are mandatory criteria for introducing a kernel into the engine.
Existing spikes do not establish product dispatch, fallback, or qualification.

- The system is designed to be SIMD-friendly: compact structures, typed arrays,
  type declarations, few allocations, sequential access.
- For each hot path identified through profiling, systematically evaluate all SIMD
  variants available and safe to use on the agreed platforms:
  reference Linux x86-64 and development macOS ARM64 ([ADR-0017](0017-piattaforma-e-io.md)).
  Adopt the variant that benchmarks show to be useful for the operation and size;
  greater vector width alone is not a selection criterion.
- Candidates: bitmap operations, Bloom filters, scans, comparisons, filters, parsing,
  hashing, compression.
- For now, the allowed tools are typed Common Lisp and SBCL-specific operations
  (ADR-0001).
- Selection checks the features actually usable by the CPU, operating system,
  and SBCL runtime before executing the kernel. An unavailable or unqualified variant
  uses the scalar reference, which is always executable and can be forced in tests;
  data or invariant errors retain the same semantics and are not hidden by fallback.
- Every variant retains type and bounds checks, with `safety 3` by default and only the
  exceptions already allowed by [ADR-0034](0034-policy-di-compilazione-e-standard-di-codifica.md).
  No vector access crosses the valid logical window; tails and alignment have defined
  and verified paths, without reading padding or unrelated bytes.

<a id="conseguenze"></a>

## Consequences

- Data layout is decided immediately with these optimizations in mind; the optimizations
  themselves come later.
- Each optimized primitive has a portable reference version, also used to verify
  correctness with an independent differential oracle; tests and benchmarks
  can force each backend and the scalar path.
- Benchmark infrastructure is required before any optimization.
- Oracles, datasets, and comparison methods are shared by the two platforms; results,
  disassembly, and selection costs must be collected separately for each before
  promotion. An `unsupported` backend is distinct from successful verification and
  does not qualify the platform.

<a id="alternative-considerate"></a>

## Alternatives considered

- *Pervasive SIMD from the start:* rejected; contrary to the measurement principle.
- *No SIMD:* gives up known gains on bitmaps and scans.

<a id="valutazione"></a>

## Assessment

- Risks: RSK-11, RSK-16.
- Verification: SPK-08 (generated code and tools available per architecture).
- Platforms decided by ADR-0017 (QA-19); backend qualification remains subject
  to real tests on each platform. SPK-08 experiments do not promote the engine
  or other unverified SIMD extensions.
