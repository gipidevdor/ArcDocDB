<a id="verifiche-della-lettura-del-primo-item-cbor-minimo"></a>

# Verification of reading the first minimal CBOR item

Campaign of 2026-10-15 for [REQ-CBR-008](cbor-item-metodo.md):
structural reading of the first item without interpreting the tail.
MAX-BYTES limits the entire authorized window, including the tail.
Exact scanners retain the EOF obligation.
[Original evidence](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-cbor-item-read/catalogo.lisp)
preserves corpus, readings, processes, and raw results.

<a id="sorgenti-e-cronologia"></a>

## Sources and chronology

Method `a67a79bf4fefe11c4778cd881eb5279a006966ca`, preregistration
`03dbc4e2b59e021456d2c3d67e7d8ff12662e2e2`. The new kernel is
written after corpus freeze; ASDF/exports and coverage scope
are prepared as declarative integration. Two C1 readings
precede any kernel compilation.
The compiled freeze is `46aee8b920d447aafae4a4e47a44d13631c47cb1`.

| File | Git blob |
|---|---|
| src/codec/cbor-item-read.lisp | b9099dc8a8c96281063811e686deb4dcb2b1d39b |
| tests/codec/cbor-item-read-support.lisp | 0326100362a1c4b24d2c7e511e45357f09a56d33 |
| tests/codec/cbor-item-read.lisp | b2cbdcb4255c51d9da4fe73b28939c1cb923fefe |
| tests/codec/cbor-item-read-threads.lisp | a0da65545ed80ede0a967cadbb337731f6fe1ce9 |

Complete kernel inventory: one 34-line function, eight syntactic
paths including LOOP, six predicates, five ERROR arms,
four binary comparisons, zero AND/OR, and zero numeric chains.
The loop is bounded by SPAN and drain by 102; preflight and readers
retain existing checks. All branches and internal guards
remain in denominators. The snapshot preserves 24 files,
240535 bytes, and three bytes/SHA comparisons per copy, 72 total.

<a id="corpus-e-parallelismo"></a>

## Corpus and parallelism

17 nominal tests pass, 16 serial and one parallel.
Literal and arithmetic oracles cover all majors, widths, raw floats,
UTF8, and containers, with empty, valid, malformed, and nonminimal tails.
They also cover concatenated boundaries, nonzero START, logical END, entire physical array,
arity three, aliases, immutable preflight and precedence, bytes 16 MiB/+1,
nodes including root/tags, depth 0/100/101, and reuse after error.
Exact scanners are secondary checks: 520 on the prefix,
390 trailing rejections and two on concatenation, outside the new API total.

Fuzzing uses 1024 cases: seed `49544538`, final `6CB25938`, 512 successes and
512 rejections in eight families. The final value is asserted in the corpus and
recalculated cold, without attributing a runtime print to it.

Two real workers are reused for two waves of 2048 calls each:
8192 reads with shared read-only buffer and private scratch.
Contents C0 A1 61 61 82 F4 F5, tail FF 1C 18 00, START 7/END 18;
6 nodes, peak 2, and NEXT 14 are checked per call by the corpus.
Token 36196 and sink 74129408 per worker/wave agree with oracles.
START/FIRST/END, sink, and overlap are printed. Initial overlap is
4831/3652 ticks at one million ticks/s; full-check overlap is 3339/2681.
Intervals include rendezvous after first item and checks:
they measure neither the decoder alone nor scaling or simultaneous execution on cores.

The 9901 calls are an arithmetic plan denominator:
685 non-fuzz (551 successes/134 rejections), 1024 fuzz, and 8192 parallel;
9255 successes and 646 rejections. This is not an instrumented counter.

<a id="benchmark-e-mutazioni"></a>

## Benchmark and mutations

Six cold fixtures have five replicates of 1024 calls and 64 warmup calls:
all 30 samples have a heap counter that reports zero.
All three values, physical buffer, and six scratch scalars are
checked per call. The zero baseline reports zero, and the positive control of
16 × 1 MiB reports 16777472 bytes. Sample sum 0.035106 s; wrapper 3.358691 s.
Uncontrolled external load and check costs included:
absolute absence of allocation or engine throughput is not established.
The audit passes 71252 checks; the independent DATA reading passes 8389.

Eight compilable mutants are DETECTED: disabled minimality,
drain at physical END, NEXT=END with skipped tail, ignored node budget,
ignored depth, ignored byte budget, skipped START, and extra arity.
Two smoke markers precede Unhandled and exactly one nominal function
from the 17-entry whitelist appears as a zero-argument frame: exit 1,
signal NIL, no warning, compilefail, or completion marker.
Such unrelated failures do not count as detections.

The baseline passes 1545 nominal tests and two smoke tests; the wrapper takes 405.513322 s.
There are nine private copies/caches/runners, 382 files per copy, and 387 internal
hashes, including five ignored drivers/catalogs; 931 external sources are STABLE.
The DATA reader performs 3438 binary comparisons on the full Git context
and originals: baseline 0 differences, one exact catalog
replacement in each mutant. FTYPE and extra return change consistently
in that copy only. Comparison neither authenticates execution nor demonstrates
exclusive causality.

<a id="copertura-grezza"></a>

## Raw coverage

The new-source-only report observes **64/90 expressions and 8/12
branches**, or 71.111111% and 66.666667%. The full denominators are retained.
The 30 missing records are 26 expressions (three declarations, 20 records
from five ERRORs, and three keyword defaults) and four ELSE branches.
HTML, index, and raw data agree; no exclusion or reclassification.
Zero AND/OR in the new kernel does not qualify MC/DC of the entire decoder.

After the frozen DATA reading, raw data of 3004878 bytes is compacted
losslessly. Decoded SHA256
`795f90f4291b16ddc8fcb61ca82150eabd1499539a02e04275daf542dfcc54cd`;
The payload occupies 428375 bytes. Limits remain 1 MiB plain and 8 MiB gzip.

<a id="verifiche-integrate"></a>

## Integrated verification

The full check passes on freeze 46aee8b9: 1545 nominal tests, two smoke tests,
four linter self-tests, 225 files with zero violations, 122 requirements,
65 invariants, 13 FI scenarios, and 52 ADRs without errors; 511 files and 3076 links
without breakage. Preservation self-tests pass, with 114 catalogs,
3393 references and 40699 files, and all ten spikes.
The wrapper takes 469.05808 s; 931 sources are STABLE and the working tree is clean.
Compiler notes and intentional self-test failures are preserved.

After main 2cf3c38d integration on merge 203e3c71, build,
lint, trace, and links pass: 1545 nominal tests and two smoke tests, 231 files with zero violations,
122 requirements/65 invariants/13 FI/52 ADR, 520 files and 3089 links without breakage.
The wrapper takes 57.257384 s; 938 sources are STABLE and the working tree is clean. All four kernel/corpus
blobs remain identical; worker overlap 2151/2278 ticks at 1 MHz.
The preceding full check retains its 46aee8b9 scope:
this command does not rerun global spikes.

<a id="conservazione"></a>

## Preservation

Initial collection uses four workers and closes 422 files for 14
processes, with worker copy counts 140/140/141/1 and no errors.
The origin before/after and the copy match in bytes/SHA, decoded processes
are identical, and the independent validator checks the closed inventory.

Serial appends preserve preparation, preflight, collection, DATA reading,
and verified copies of original observation/closure. Hash and metadata audit
passes before and after every append. Final inventory
contains 19 recorded processes, all OK/exit 0/STABLE: 436 indexed files,
438 with index and catalog, totaling 8560283 indexed bytes. The index size is
154755 bytes; limits remain 1 MiB plain and 8 MiB gzip.

After the last append, independent strict checking
of the entire final inventory also passes. Its record is in the
[concluding supplement](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-cbor-item-read-final/catalogo.lisp):
one process and four indexed files, six with index and catalog.
The supplement preserves that result without modifying the archive
just verified; its collection also passes the validator.
Initial collection, append audits, and final closure retain distinct scopes.

All nine full mirrors remain in verified local backup.
The published archive preserves reports, logs, ASDF, runners, and the four
codec/corpus sources per copy; other unchanged files can be
reconstructed from commit 46aee8b9. Full mirrors are not all duplicated
in the published archive.

Preparations are inventoried in notes: provisional seed corrected
before the kernel, an escape in snapshot helper, inherited collector dates,
synthetic driver checks and consistent pins, DATA readers adapted
to actual schemas/paths, and parenthesized inline query. Available variants and local
outcomes are preserved; diagnostics present only in conversation
are distinguished from original local logs. No preparatory failure
is attributed to the product or counted as a detected mutation.

Historical map and tag summaries now distinguish append audits
from independent closure of initial collection, with originals unchanged.
C1, MC/DC, and deterministic document profile remain open.

