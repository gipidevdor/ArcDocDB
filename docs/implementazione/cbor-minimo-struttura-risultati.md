<a id="item-cbor-con-testate-minime--risultati-del-2026-10-09"></a>

# CBOR items with minimal headers — results dated 2026-10-09

The [new API](cbor-minimo-struttura.md) verifies a complete item, UTF-8,
minimal headers, and budgets in a single traversal, with private scratch
for each worker. Local campaigns under the [method](cbor-minimo-struttura-metodo.md)
pass; key order/equivalence and tag semantics remain outside
the contract. The full document profile and engine are not qualified.

<a id="correttezza-e-concorrenza"></a>

## Correctness and concurrency

The 22 blind named tests remain identical to the three blobs frozen in the
[second C1 reading](cbor-minimo-struttura-revisione.md), without supplements
or oracle adjustments. Preliminary build: 458 tests and two smoke tests,
**460 outcomes**, without warnings; lint and traceability pass.
All 768 lead cases are verified: 84 accepted and 684 rejected.
The 512 ASTs and finite fuzz of 4096 spans, seed `53434d31`, agree with
the oracle: 41 valid and 4055 rejected in fuzz. Named cases include
exact/beyond 16 MiB, depth 100/101, budgets, unchanged preflight,
immutability, and reuse after error, not just the positive path.

Two real workers, each with private buffer and scratch, complete
24 scans per worker; independent sinks 4718784 and 9437376.
The preliminary run observes overlap of 100317 ticks at 1000000 ticks/s:
wall time, without inference about cores, CPU time, or scaling.
Test-data auditing passes 53 checks, also confirming six product/corpus
blobs and complete before/after record snapshots.

<a id="heap-mutazioni-e-copertura"></a>

## Heap allocation, mutations, and coverage

Serial benchmark on SBCL 2.6.9, ARM64/Darwin, safety 3: eight fixtures,
five replicates of 4096 scans, warmup 128. All **40 samples have
zero observed heap allocation**, zero baseline, and positive control 16777472 bytes.
Cold arity exactly three, values, tokens, sinks, and immutable inputs are
verified. No speed threshold or absolute proof of nonallocation.

Full baseline and all **eight mutants DETECTED**, without SURVIVED,
INVALID, or WORKER-ERROR. Nine conforming private copies; each mutant changes
only the target file and with the preregistered replacement. Failed compilation,
OS signals, and faults after completion are not detections.
When inlining omits the test name in the first backtrace, the report
preserves observed helper, condition, and last PASS without inventing the name.

| Focal file | Observed/total forms | Observed/total branch outcomes |
|---|---:|---:|
| `cbor-scan.lisp` | 160/207 | 20/32 |
| `cbor-scan-minimal.lisp` | 10/16 | 0/0 |
| Raw total | 170/223 | 20/32 |

The 53 missing forms are attributed to nine declaration forms, 38 forms
associated with internal errors, and six keyword defaults; twelve missing outcomes
belong to internal guards. Complete state and three HTML files agree.
No denominator exclusion, MC/DC attestation, or unreachability
proof. Independent auditing of the three campaigns passes **1895
checks**, without findings. Bytewise verification confirms that gzip
reconstructs the original 1113055-byte coverage state.

<a id="verifica-e-conservazione"></a>

## Verification and preservation

`make check` passes: 460 build outcomes, four lint-selftest markers
distinct from tests, lint, traceability, links, preservation, and ten spikes.
The original record has zero exit and stable snapshot. Subsequent
integration of `edb043b` imports Makefile, documentation, and tests,
without modifying sources, tests, tools, or ASDF; final
link and preservation checking uses the updated memory budget.

The [campaign archive](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-cbor-minimal-scan/archive-index.lisp)
keeps 165 indexed files and ten processes unchanged, with bytes/SHA256 and
metadata read from records. The
[second archive](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-cbor-minimal-scan-final/archive-index.lisp)
preserves collection, full check, spikes, audits, and reader attempts.
Complete copies/FASLs, original plain state, and all checker negative
fixtures, including symlinks and over-budget files, remain in the local backup
`spikes/out/cbor-minimal-scan-isolated-20261009/`. The published mutation
subset includes targets, runner, reports, and logs; it does not replace copies.

The Common Lisp checker passes 24 fixtures and verifies closed inventory,
sizes/SHAs, and four process metadata; limits and nonpreventive
enumeration are explicit in the [C4 reading](archivi-comandi-lettura.md).
New CL checks of both preceding CBOR archives also pass,
1313/87 files and eight/six processes, with their original indexes unchanged.

Failed attempts of helpers alone are preserved: test-reader relative
directory, reader setup, mutator stdout preamble, and
first HTML TR without explicit closure. Corrections concern readers;
original campaigns are neither repeated nor rewritten. The manifest
generator printed a count of one after NREVERSE while saving the complete
list: original and diagnostic-only correction are preserved.
Observations remain local/per file, without atomic snapshot,
platform performance comparison, or gate promotion.
