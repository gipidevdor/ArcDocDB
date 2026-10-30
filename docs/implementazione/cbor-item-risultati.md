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
Compiled freeze is `46aee8b920d447aafae4a4e47a44d13631c47cb1`.

| File | Git blob |
|---|---|
| src/codec/cbor-item-read.lisp | b9099dc8a8c96281063811e686deb4dcb2b1d39b |
| tests/codec/cbor-item-read-support.lisp | 0326100362a1c4b24d2c7e511e45357f09a56d33 |
| tests/codec/cbor-item-read.lisp | b2cbdcb4255c51d9da4fe73b28939c1cb923fefe |
| tests/codec/cbor-item-read-threads.lisp | a0da65545ed80ede0a967cadbb337731f6fe1ce9 |

Complete kernel inventory: one 34-line function, eight syntactic
paths including LOOP, six predicates, five ERROR arms,
four binary comparisons, zero AND/OR, and zero numeric chains.
Loop bounded by SPAN, drain by102; preflight and readers
retain existing checks. All branches and internal guards
remain in denominators. Snapshot preserves 24 files,
240535 bytes, and three bytes/SHA comparisons per copy, 72 total.

<a id="corpus-e-parallelismo"></a>

## Corpus and parallelism

17 nominal tests pass, 16 serial and one parallel.
Literal and arithmetic oracles for all majors, widths, raw floats,
UTF8, and containers; empty, valid, malformed, and nonminimal tails.
Concatenated boundaries, nonzero START, logical END, entire physical array,
arity three, aliases, immutable preflight and precedence, bytes 16 MiB/+1,
nodes including root/tags, depth 0/100/101, and reuse after error.
Exact scanners are secondary checks: 520 on prefix,
390 trailing rejections and two on concatenation, outside the new API total.

Fuzz 1024: seed `49544538`, final `6CB25938`, 512 successes and
512 rejections in eight families. Final value is asserted in corpus and
recalculated cold, without attributing a runtime print to it.

Two real workers reused for two waves of2048 calls each:
8192 reads with shared read-only buffer and private scratch.
Contents C0 A1 61 61 82 F4 F5, tail FF 1C 18 00, START 7/END 18;
6 nodes, peak 2, and NEXT 14 checked per call by corpus.
Token 36196 and sink 74129408 per worker/wave agree with oracles.
START/FIRST/END, sink, and overlap printed. Initial overlap
4831/3652 ticks at one million ticks/s; full check3339/2681.
Intervals include rendezvous after first item and checks:
they measure neither decoder alone nor scaling or simultaneous execution on cores.

The 9901 calls are an arithmetic plan denominator:
685 non-fuzz (551 successes/134 rejections), 1024 fuzz, and 8192 parallel;
9255 successes and 646 rejections. This is not an instrumented counter.

<a id="benchmark-e-mutazioni"></a>

## Benchmark and mutations

Six cold fixtures, five replicates of1024 calls and warmup 64:
30 samples with heap counter present and zero.
All three values, physical buffer, and six scratch scalars are
checked per call. Zero baseline zero and positive control
16 × 1 MiB:16777472 bytes. Sample sum 0.035106 s; wrapper 3.358691 s.
Uncontrolled external load and check costs included:
absolute absence of allocation or engine throughput is not established.
Audit passes71252 checks; independent DATA reading8389.

Eight compilable mutants are DETECTED: disabled minimality,
drain at physical END, NEXT=END with skipped tail, ignored node budget,
ignored depth, ignored byte budget, skipped START, and extra arity.
Two smoke markers precede Unhandled and exactly one nominal function
from whitelist17 appears as a zero-argument frame: exit1,
signal NIL, no warning, compilefail, or completion marker.
Such unrelated failures do not count as detections.

Baseline 1545 nominal tests and two smoke tests; wrapper 405.513322 s.
Nine private copies/caches/runners, 382 files per copy and 387 internal
hashes, including five ignored drivers/catalogs;931 external sources STABLE.
DATA reader performs3438 binary comparisons on the full Git context
and originals: baseline 0 differences, one exact catalog
replacement in each mutant. FTYPE and extra return change consistently
in that copy only. Comparison neither authenticates execution nor demonstrates
exclusive causality.

<a id="copertura-grezza"></a>

## Raw coverage

The new-source-only report observes **64/90 expressions and 8/12
branches**, or 71.111111% and 66.666667%. Full denominators.
The 30 missing records are 26 expressions (three declarations, 20 records
from five ERRORs, and three keyword defaults) and four ELSE branches.
HTML, index, and raw data agree; no exclusion or reclassification.
Zero AND/OR in the new kernel does not qualify MC/DC of the entire decoder.

After the frozen DATA reading, raw data of3004878 bytes is compacted
losslessly. Decoded SHA256
`795f90f4291b16ddc8fcb61ca82150eabd1499539a02e04275daf542dfcc54cd`;
payload428375 bytes. Limits remain1 MiB plain and 8 MiB gzip.

<a id="verifiche-integrate"></a>

## Integrated verification

Full check passes on freeze 46aee8b9:1545 nominal tests, two smoke tests,
four linter self-tests, 225 files with zero violations, 122 requirements,
65 invariants,13 FI scenarios, and 52 ADRs without errors;511 files and 3076 links
without breakage. Preservation self-tests pass,114 catalogs,
3393 references and 40699 files, and all ten spikes.
Wrapper 469.05808 s;931 sources STABLE and clean working tree.
Compiler notes and intentional self-test failures are preserved.

After main 2cf3c38d integration on merge203e3c71, build,
lint, trace, and links pass:1545 nominal tests and two smoke tests, 231 files with zero violations,
122 requirements/65 invariants/13 FI/52 ADR, 520 files and 3089 links without breakage.
Wrapper 57.257384 s;938 sources STABLE and clean working tree. All four kernel/corpus
blobs remain identical; worker overlap 2151/2278 ticks at 1 MHz.
The preceding full check retains its 46aee8b9 scope:
this command does not rerun global spikes.

<a id="conservazione"></a>

## Preservation

Initial collection uses four workers and closes 422 files for 14
processes, with worker copy counts 140/140/141/1 and no errors.
Origin before/after and copy match bytes/SHA, decoded processes
are identical, and the independent validator checks the closed inventory.

Serial appends preserve preparation, preflight, collection, DATA reading,
and verified copies of original observation/closure. Hash and metadata audit
passes before and after every append. Final inventory
contains 19 recorded processes, all OK/exit 0/STABLE: 436 indexed files,
438 with index and catalog, totaling 8560283 indexed bytes. Index size
154755 bytes; limits remain 1 MiB plain and 8 MiB gzip.

After the last append, independent strict checking
of the entire final inventory also passes. Its record is in the
[concluding supplement](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-cbor-item-read-final/catalogo.lisp):
one process and four indexed files, six with index and catalog.
The supplement preserves that result without modifying the archive
just verified; its collection also passes the validator.
Initial collection, append audits, and final closure retain distinct scopes.

All nine full mirrors remain in verified local backup.
Published archive preserves reports, logs, ASDF, runners, and the four
codec/corpus sources per copy; other unchanged files can be
reconstructed from commit 46aee8b9. Full mirrors are not all duplicated
in the published archive.

Preparations are inventoried in notes: provisional seed corrected
before kernel, escape in snapshot helper, inherited collector dates,
synthetic driver checks and consistent pins, DATA readers adapted
to actual schemas/paths, and parenthesized inline query. Available variants and local
outcomes are preserved; diagnostics present only in conversation
are distinguished from original local logs. No preparatory failure
is attributed to product or counted as a detected mutation.

Historical map and tag summaries now distinguish append audits
from independent closure of initial collection, with originals unchanged.
C1, MC/DC, and deterministic document profile remain open.

