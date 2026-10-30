<a id="15--ottimizzazioni-native-e-simd"></a>

# 15 — Native optimizations and SIMD

> **Source:** ‘SIMD and native optimizations’ of the [specification](specifica/specifica-originale.md),
> amended by [ADR-0001](adr/0001-common-lisp-sbcl.md).
> **Modules:** M18 SIMD/Hot Path Optimization Layer.

<a id="vincolo-corrente-solo-common-lisp"></a>

## Current constraint: Common Lisp only

**Decision of 2026-10-01:** for now, the project is **Common Lisp only**. The specification allows
C/C++ or Rust via foreign functions for extreme hot paths; this option is **suspended**
until reopened by a new ADR. All repository code, including spikes and benchmark tools,
is Common Lisp on SBCL.

SBCL extensions and contrib modules (threads, atomic primitives, system-call access)
remain available, because they are Common Lisp on the reference implementation.

<a id="progettare-simd-friendly"></a>

## Designing for SIMD

The database MUST be designed to be SIMD-friendly. In Common Lisp/SBCL, this means,
in order:

1. use compact data structures;
2. use typed arrays;
3. declare types;
4. minimize boxing and allocations;
5. favor sequential access;
6. profile;
7. systematically evaluate SIMD variants that can be used safely **on each measured
   hot path**, adopting those with demonstrated benefits (INV-X1).

The first five points are *data-layout* choices, to make during architecture:
they cannot be recovered later. The last two are measurement-driven activities.

SBCL can generate SIMD code automatically in some appropriately typed numerical cases.

<a id="scala-di-intervento"></a>

## Intervention levels

| Level | Tool | Status |
|---|---|---|
| 1 | Typed Common Lisp: specialized arrays, declarations, no allocation | always |
| 2 | SBCL-specific operations | allowed on measured hot paths |
| 3 | Foreign functions, C/C++, Rust | **suspended** (Common Lisp only for now) |

Evaluate the next level on measured hot paths; adopt it only when tests show a
benefit while retaining every check.

<a id="selezione-sicura-e-verifica-dei-backend"></a>

## Safe backend selection and verification

These are mandatory criteria for introducing a kernel into the engine; existing spikes
do not establish product dispatch, fallback, or qualification.

The 2026-10-22 clarification to [ADR-0012](adr/0012-simd-guidato-dai-benchmark.md)
requires evaluating all available variants for measured hot paths on **Linux
x86-64**, the reference platform, and **macOS ARM64**, supported for development. Selection
depends on the operation, size, and measurements; greater vector width does not establish
a benefit. Untested extensions remain unqualified.

Before executing a kernel, selection must verify actual CPU, operating-system,
and SBCL runtime support. The declared architecture alone is insufficient.
The scalar reference path always remains executable and forceable, as does every available
backend in tests; it is used if a variant is absent, unqualified, or unsuitable for that
workload. A data or invariant error retains its semantics and does not trigger a fallback
that conceals it.

Each kernel preserves the reference's types, bounds, input immutability, and error
semantics. The default is `safety 3`, with only the exceptions already governed by
[ADR-0034](adr/0034-policy-di-compilazione-e-standard-di-codifica.md). Every vector load
and store must fit entirely within the authorized logical window:
no reads past the end, even into accessible padding. Tails have a verified scalar path;
unaligned access is allowed only with verified backend semantics, otherwise the scalar
path is used.

Differential verification uses an independent oracle and forces each available backend
and the scalar path: empty and short buffers, lengths around the vector width,
unaligned offsets, tails, adversarial inputs, and rejections must yield equivalent
results and errors without unrelated modifications. Datasets, parameters, and benchmark
methods are shared by both platforms; each retains its environment, generated code,
results, allocations, and selection cost. `unsupported` remains distinct from a passed test.
A microbenchmark or ARM64 measurement qualifies neither the complete path nor x86-64.

<a id="candidati-simd"></a>

## SIMD candidates

- bitmap AND/OR/XOR;
- Bloom filters;
- scans;
- comparisons;
- filters;
- parsing;
- hashing;
- compression/decompression.

Append-only storage with immutable segments and sequential scans favors these
optimizations: data are contiguous and do not change beneath the reader.

<a id="questioni-decise-e-rischi"></a>

## Decided questions and risks

- **QA-18** ([ADR-0024](adr/0024-memoria-e-gc.md)) — Garbage collector and memory: which structures live in the Lisp heap and
  which outside it (RSK-01). This is the main technical risk of choosing SBCL.
- **QA-19** ([ADR-0017](adr/0017-piattaforma-e-io.md)) — Reference architecture. SBCL's explicit SIMD support must be verified
  per architecture (x86-64 and ARM64): development takes place on macOS/ARM64, while the
  reference platform is Linux x86-64 (RSK-11).
- The ‘Common Lisp only’ constraint also applies to I/O system calls: the WAL spike must
  verify that `fsync` and positional reads are accessible without non-Lisp code and
  without critical-path allocations (SPK-03, SPK-05).
