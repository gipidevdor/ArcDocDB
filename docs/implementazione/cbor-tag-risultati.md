<a id="verifiche-della-composizione-dei-tag-cbor"></a>

# CBOR tag composition verification

Campaign dated 2026-10-14 for [REQ-CBR-007](cbor-tag-metodo.md):
MT6 structural composition from an already-encoded item. Application
tag semantics and document profile remain higher-level.
The [original evidence](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-cbor-tag-write/catalogo.lisp)
preserves corpus, readings, recorded processes, and raw results.

<a id="sorgenti-e-cronologia"></a>

## Sources and chronology

Method `3175390e496173398781bf8b39170cb33892125f`, preregistration
`44017fe7d117f7107989c453687b8f68280b78bf`. Blind corpus precedes
product; two C1 readings precede first compilation.
Compiled freeze is `df37306ed0e97f1665fb9f59aca79842c49d96a5`,
with clean working tree.

| File | Git blob |
|---|---|
| src/codec/cbor-tag-input.lisp | 6dfad07035ac8040b2aec0a455c175ea15dfd9ad |
| src/codec/cbor-tag-write.lisp | 16b91fc27eabafd7ff12bfb0a56ed34208c2bd4b |
| tests/codec/cbor-tag-write-support.lisp | 15978d05251705387205d6468031a701ad95ec85 |
| tests/codec/cbor-tag-write.lisp | df97950ec8d24157bb6566c7995262f7beea7742 |
| tests/codec/cbor-tag-write-threads.lisp | def870295400af2c84ca00e7a9b5cd5b747ec315 |

Six functions measure 9/19/11/24/21/33 lines and 4/6/8/5/8/4
paths. Complete inventory: 23 guards and their ERRORs, five
AND/OR with 11 operands, two chained comparisons with four
relations, 21 binary comparisons, no new loop.
Public witnesses cover aliases and overlap; unobserved internal branches
remain in denominators and open obligations.

Matrix was still designed during static readings: it is
regenerated before freeze and first compilation. Aggregate
codec scope includes tag RUN. Product and corpus remain
unchanged during every campaign and integration.

<a id="corpus-e-parallelismo"></a>

## Corpus and parallelism

20 named tests pass, 19 serial and one parallel, with cold
oracles for header, payload, whole buffers, source, and scratch.
Verified: u32 boundaries and all header widths,
wire sentinels, ranges, precedence, aliases, overlap including
header, logical capacity, complete 16 MiB limit, nodes including
root, depth zero/100/101, chains of over a thousand tags without
extra frames, full parsing, and arity. The 116 scanner round trips
are secondary checks.

Fuzz: 1024 calls with seed `54414737`, 512 successes and 512 rejections.
Final state `F8004B37` is asserted in corpus and independently
recalculated; campaign does not print it.

Two real reused workers for two waves of 2048 calls each:
8192 compositions with source shared for reading and private destinations
and scratch. NEXT 13/17, tokens 32601/47515, and sinks
66766848/97310720 per worker and wave agree with oracles.
First build observes overlaps of 2333/2329 ticks at one million
ticks/s; full check 1687/2704 ticks. Individual
intervals are not printed; scaling or simultaneous execution
on cores is not inferred.

9658 calls to new API are an arithmetic total from plan:
442 non-fuzz, 1024 fuzz, and 8192 parallel; 8848 successes and 810 rejections.
Not an instrumented counter.

<a id="benchmark-e-mutazioni"></a>

## Benchmark and mutations

Six cold fixtures, five replicates of 1024 calls and warmup 64:
30 samples, all with a present heap counter equal to zero.
Zero baseline zero and positive control of 16 × 1 MiB passed.
NEXT 4/7/6/10/14/17 and tokens 5368/10359/9825/10464/16425/43144
agree with fixtures. Wrapper takes 3.047504 s.
External load uncontrolled and check cost included:
neither absolute nonallocation nor engine throughput
attested. Independent auditing passes 68028 data checks.

Eight compilable mutants are DETECTED: physical capacity, MT5,
swapped high/low halves, omitted scanning, overlap excluding header,
excluded root node, decremented child depth, and extra arity.
Every log contains exact smoke, Unhandled, and a named function
from frozen whitelist, with exit 1, signal NIL, and no worker
error. Warnings, failed compilations, signals, and faults after
completion do not count as detection. Baseline passes
1412 named tests and two smoke tests; wrapper takes 286.719013 s.

Nine private copies/caches, 361 files per copy, 366 internal fingerprints,
and 892 stable external sources. DATA reader performs 3249 binary
comparisons against freeze's entire Git context and originals:
baseline without differences and one exact catalog replacement
in each mutant. Extra-arity FTYPE and body change
consistently in copy only. Comparison neither authenticates
execution nor demonstrates exclusive causality.

<a id="copertura-grezza"></a>

## Raw coverage

| Source | Expressions | Branches |
|---|---:|---:|
| cbor-tag-input.lisp | 176/206 | 26/34 |
| cbor-tag-write.lisp | 115/158 | 10/20 |
| Total | 291/364 | 36/54 |

Full denominators: 364 expressions and 54 branches, coverage
79.945055% and 66.666667%, below C1 requirement. The 73 missing
expressions include ten declarations, 60 ERROR subforms, and three
keyword defaults; 18 ELSE branches also remain, for 91 missing records.
All points remain in raw
data, without exclusions. Reader, index, and HTML agree.
SB-COVER does not attest MC/DC.

After independent reading, 2775201-byte raw state is losslessly
compacted; decoded SHA256
`3309ea12a2d6acc7d734101748ecbf73e8461284f4c3889d1159127384ee2625`.
Payload measures 395719 bytes; limits remain 1 MiB plain and 8 MiB gzip.

<a id="verifiche-integrate"></a>

## Integrated verification

On freeze `df37306e`, full check passes: 1412 named tests,
two smoke tests, four linter self-tests, 214 files with zero violations,
121 requirements, 65 invariants, 13 FI scenarios, and 52 ADRs without errors;
472 files and 2988 links without breakage. Preservation
self-tests, 102 catalogs with 3237 references and 28687 files,
and all ten spikes pass. Wrapper 314.315971 s; 892 stable sources.
Intentional self-test failures and compiler notes
remain in raw data.

After integrating `main` at `505f531f`, on merge `7fbd327f`,
build, lint, trace, and links pass: 1440 named and two smoke tests, 224 files
with zero violations, same 121 requirements/65 invariants/13 FI/52 ADRs,
490 files and 3041 links without breakage. Wrapper 45.121117 s; 912 stable
sources and clean working tree. The five tag product/corpus blobs
remain identical. The 8192 parallel compositions observe overlap
2336/2284 ticks. Previous full verification retains its own
scope; this second command does not rerun global spikes.

<a id="conservazione"></a>

## Preservation

Initial collection uses four workers and closes 397 files for 15
processes; copies per worker: 132/132/132/1, without errors. Before/after
origin and copy fingerprints agree, decoded processes
are identical, and independent validator verifies closed inventory.

Serial appends preserve preparation, preflight, collection, DATA
reading, and verified copies of original observation/closure. Final
inventory contains 20 recorded processes: 19 OK/exit 0 and one
preparatory FAILED/exit 1 attempt; all have STABLE sources. The 411 indexed
files sum to 8444662 bytes; total files are 413 including
index and catalog.
Index measures 147480 bytes; limits remain 1 MiB plain and 8 MiB gzip.
Fingerprint and metadata auditing passes before and after every append.
Independent closed-inventory validator concerns initial
397-file collection; its outcome does not extend to appends.

Published archive preserves logs, ASDF, runner, tag product and corpus
for all nine copies, and report with complete fingerprints.
Nine complete copies remain in verified local backup;
other unchanged sources can be reconstructed from commit `df37306e`.

First materialized mutator contains two helper pins still
referring to maps: corrected before self-tests and
campaigns, preserving previous version and diff. One recorded
attempt uses invalid self-test CLI options: fails before
product, remains FAILED in archive, and is followed by corrected
command. Both mutation-reader preparations are preserved
before completed reading. C4 cloner parenthesis is also
corrected in a preserved variant: original diagnostic appears
in note, without attributing an unavailable local log to it.
Other preparatory variants are inventoried in readings.

Verification retains these distinct scopes. C1 and MC/DC remain open.

