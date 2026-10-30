<a id="verifiche-della-composizione-delle-mappe-cbor"></a>

# Verification of CBOR map composition

Campaign on 2026-10-14 for [REQ-CBR-006](cbor-map-metodo.md):
structural MT5 composition from already encoded keys and values.
Ordering, key uniqueness, and document profile remain at higher
layers. The [original evidence](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-cbor-map-write/catalogo.lisp)
preserves corpus, readings, recorded processes, and raw results.

<a id="sorgenti-e-cronologia"></a>

## Sources and chronology

Method `636dd2706c2903542978606cf029e7198bf4dbb3`, preregistration
`2968cdc8ef50e35f418b96d58e27b6a5ecf7fcb3`. The blind corpus is frozen
before the two product sources; two C1 readings precede the first
compilation.

| File | Git blob |
|---|---|
| src/codec/cbor-map-input.lisp | d7a593badeb6e6b71f28dc4e80c641b07189d0b8 |
| src/codec/cbor-map-write.lisp | 22e814ea68e606c5bc58033c2a31e945303a9d65 |
| tests/codec/cbor-map-write-support.lisp | a389e51f2416437d608c4f7745b9680eca27bc60 |
| tests/codec/cbor-map-write.lisp | 6ad0e9b5a48ba9c32c46d720f2f7f1821368d6c8 |
| tests/codec/cbor-map-write-threads.lisp | 6a65b58ce236b92b33772e1861dbd8c1257bee13 |

The readings inventory ten functions of 9–38 lines and 3–9 paths,
five AND/OR forms with 14 operands, nine chained comparisons, 40 guards,
and two loops, without exclusions. Before campaigns, map
RUN is added to the coverage tool's aggregate codec scope.
Product and corpus remain unchanged; the verified tool is `e273f103`.

A documentation correction mistakenly uses transient test names:
it is reverted before the first compilation, restoring
inventory `16c60314`. Both versions and the note are preserved.
The compiled freeze is `15c458eff76896f3fc83ad7756ae922f64eb22d7`,
with a clean working tree.

<a id="corpus-e-parallelismo"></a>

## Corpus and parallelism

20 named tests pass: 19 serial and one parallel, with cold oracles
for header, payload, and entire buffers. Checks cover COUNT 0/1/23/24/255/256,
types and ranges, all precedence, half table and span before doubling,
even and odd inactive tails, aliases including empty cases, header overlap,
exact and insufficient capacity, complete 16 MiB budget and excesses,
nodes/tags/root, child depth 99/100, key and value parsing,
scratch reuse, and arity. An additional 65 scanner roundtrips are included.

Fuzz: 1024 calls with seed `4D415035`, 512 successes and 64 rejections
for each of eight error families. Final state `0D123435`
is asserted in the corpus and recalculated by the independent reader; the campaign
does not print it.

Two real workers reused for two waves of 2048 calls each:
8192 compositions, with source and table shared for reading and
private destinations/scratch. Sinks 54677504/77537280, NEXT 12/16, and
buffers 19/23 agree with cold oracles. The first build
observes overlap of 3107/3104 ticks at one million ticks/s; the full
check observes 3160/3067 ticks. Individual intervals are not
printed; no scaling or simultaneous core execution is inferred.

The 9499 calls to the new API are an arithmetic total from the plan:
283 non-fuzz, 1024 fuzz, and 8192 parallel; not an instrumented counter.

<a id="benchmark-e-mutazioni"></a>

## Benchmark and mutations

Six cold fixtures, five replicates of 1024 calls, and warmup 64:
30 samples with zero bytes observed by the heap counter. Null baseline
zero and positive control of 16 × 1 MiB: 16777472 bytes. NEXT, entire
buffers, source, and table are checked during measurement; arity
is checked in cold code. Samples total 0.682974 s; the wrapper takes
2.388207 s. External load uncontrolled and check cost included;
absolute absence of allocation or engine throughput is not certified.
The independent audit passes 79357 data checks.

Eight compilable mutants are DETECTED: physical capacity, MT4,
item count in header, omitted scan, overlap without header,
unchecked ends, root node excluded, and extra arity. Every log contains
exact smoke, Unhandled, and a nominal function from the frozen corpus,
with exit 1, signal NIL, and no worker error. Warnings, failed
compilations, helper failures, signals, and errors after completion do not count
as detection. The baseline passes 1284 nominal tests and two smokes; the campaign
wrapper takes 236.203910 s.

Nine private copies/caches, 345 files per copy, 350 internal fingerprints,
and 860 stable external sources. The DATA reader compares all
files bytewise: baseline with no differences, one exact catalog substitution
in each mutant. FTYPE and the extra-arity body change consistently
only in the copy. Comparison does not authenticate execution or establish
exclusive causality.

<a id="copertura-grezza"></a>

## Raw coverage

| Source | Expressions | Branches |
|---|---:|---:|
| cbor-map-input.lisp | 272/317 | 45/54 |
| cbor-map-write.lisp | 190/266 | 19/36 |
| Total | 462/583 | 64/90 |

Full denominators: 583 expressions and 90 branches; coverage 79.245283%
and 71.111111%, below the C1 requirement. The 121 missing expressions include
14 top-level declarations, 104 ERROR subforms from 26 internal guards, and
three keyword defaults. All 26 missing branches remain in raw data.
Reader, summary, and HTML agree; no point is excluded or
reclassified. SB-COVER does not certify MC/DC.

The first DATA reader fails due to a parenthesis before reading the
record; the corrected variant passes without a new product campaign.
Both attempts are preserved. After reading, the 2573180-byte raw output
is compacted losslessly; decoded SHA256
`22d23eb3d3f6929d92952713ca9f60287a2c1becf4c5c3b6c538b6ee59e4ef86`.
Payload is 363928 bytes; limits remain 1 MiB plain and 8 MiB gzip.

<a id="verifiche-integrate"></a>

## Integrated verification

On freeze `15c458ef`, the full check, 1284 nominal tests and two
smokes, four linter self-tests, 207 files with zero violations, 120
requirements, 65 invariants, 13 FI scenarios, and 52 ADRs pass without errors; 440 files
and 2914 links without breakage. Preservation self-tests, 98
catalogs with 3136 references and 25236 files, and all ten spikes pass.
Wrapper: 260.414101 s; 860 stable sources. Intentional self-test
failures and compiler notes remain in raw data.

After integrating `main` at `55149bfd`, on merge `e4b3b826`,
build, lint, trace, and link pass: 1297 nominal tests and two smokes, 212 files
with zero violations, the same 120 requirements/65 invariants/13 FI/52 ADRs,
452 files and 2952 links without breakage. Wrapper: 41.161955 s; 872 stable
sources and clean working tree. The five map product/corpus blobs
remain identical. The earlier full verification retains its
scope; this second command does not rerun global spikes.

<a id="conservazione"></a>

## Preservation

Initial collection uses four workers and closes 311 files for 14
processes; copies per worker: 103/34/70/104, without errors. Source
fingerprints before/after and copy fingerprints agree, decoded processes
are identical, and the independent validator verifies the closed inventory.

Serial appends preserve preparation, preflight, collection, DATA
reading, and verified copies of original observation/closure. The final
inventory contains 19 recorded processes, all OK/exit 0/STABLE, and 325 indexed
files (327 including index and catalog). Indexed files total
7644795 bytes; the index is 118625 bytes. Limits remain 1 MiB plain
and 8 MiB gzip. Fingerprint and metadata audits pass before and after
each append. The independent closed-inventory validator concerns
the initial 311-file collection; its outcome does not extend to appends.

The nine complete mutant copies remain in verified local backup.
The published archive preserves logs, ASDF, runners, map products/corpus
for every copy, and the report with complete fingerprints. Other unchanged
sources are reconstructible from commit `15c458ef`; the nine complete
mirrors are not all duplicated in the archive.

Preparations and failed attempts reported in the readings are preserved.
Verification retains these distinct scopes. C1 and MC/DC remain open.
