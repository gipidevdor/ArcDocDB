<a id="verifiche-della-scrittura-float-cbor"></a>

# CBOR float-writing verification

Campaigns dated 2026-10-13 under the [preregistered method](cbor-float-scrittura-metodo.md),
blob `755b13a91ab72f54383d96faee5780da36e750d6`. The corpus is frozen
before the product; two C1 readings precede first compilation.
Versions tested are narrow `cd5749edc0a757ee3a5b470eda566a6685d32fd8`
and write `03c6aed61e2c243d8b1a6c4332ce1837c4e9a77c`.

<a id="corpus-e-parallelismo"></a>

## Corpus and parallelism

The 18 tests comprise 17 serial tests and one with two reused workers.
All 65,536 binary16 values and exact binary32/64 expansions give
196,608 successes, rotating eight offsets and three configurations. Capacities
0/1/2 produce another 196,608 rejections, with rotated AI25/26/27.
Rotated configurations do not constitute a Cartesian product.
Literal vectors and an arithmetic oracle check normal and subnormal
thresholds, sign, NaNs, word crossing, and the entire physical array.

Fuzz uses 2,048 cases and seed `464C5434`: 768 successes, 256 insufficient
capacities, 128 invalid AIs, 128 HIGH, 128 LOW, 256 word
inconsistencies, and 384 invalid ranges. Exact arity, precedence,
displaced arrays, reuse, and 38-byte concatenation are also verified.

Two real workers perform two waves of 8,192 calls each:
32,768 operations with private buffers and immutable plans. Each wave has
distinct READY/GO/DONE signals, bounded timeouts and cleanup. Sinks are
2,115,584/2,148,352 in both waves; in integration `1f36b40`,
intervals overlap by 2,564/2,559 ticks, at 1,000,000 ticks/s.
This does not measure scaling or simultaneous execution on cores.

<a id="misure-e-mutazioni"></a>

## Measurements and mutations

Six frozen fixtures cover half 1.5, double reduced to half 1.5,
double reduced to single but not half, retained double, minimum half
subnormal from double, and negative double NaN with nonshortenable payload.
Five replicates of 4,096 calls, after 128 warmup calls, produce
30 samples with zero observed heap allocation. Zero baseline and positive sensor
of 16 × 1 MiB observe zero and 16,777,472 bytes respectively.

NEXT, cold arity, entire array, token, and sink are checked.
The hot loop uses the primary value; the corpus verifies arity on
every success. Samples sum to 0.033414 s; the wrapper takes 1.416727 s.
The auditor recalculates IEEE bytes through integers and rationals: 55,824
successful checks, without calling product or driver. There is no speed
threshold or absolute proof of nonallocation. The binary64→32
subnormal path that crosses words has functional tests,
but is not among the six measured fixtures.

Eight compilable mutants are detected: `8 DETECTED`, no
`SURVIVED`, `INVALID`, or `WORKER-ERROR`. The nine copies have 280 files
each: 2,520 files compared, with private caches and one exact
replacement per mutant. The 281 declared fingerprints also include the
uncopied driver; they do not prove closure of the private trees.

The nine complete logs show baseline with 989 OK, smoke at line 2,
and termination at line 1,067. Each mutant has smoke before Unhandled,
exit 1 without signal or warning, and a numbered frame from the
REQ-CBR-004 corpus. The classifier rejects compilation errors, warnings,
signals, and faults after completion. The additional NIL
value mutation changes FTYPE and DEFUN consistently in only the copy.
Classification and logs remain local execution observations.

<a id="copertura-e-letture"></a>

## Coverage and readings

| Source | Expressions | Branch outcomes |
|---|---:|---:|
| cbor-float-narrow.lisp | 175/220 | 26/36 |
| cbor-float-write.lisp | 190/220 | 35/40 |
| Total | 365/440 | 61/76 |

75 expressions are missing: 11 declarations and 64 internal ERROR nodes.
15 outcomes are missing: 13 guards and two subnormal-exponent fallbacks.
All remain in the denominator. Raw state with 274 files, the two selected
entries, and three HTML files agree; nine observations remain stable.
There is no attestation of MC/DC, unreachability, or C1 qualification.
The [decision inventory](cbor-float-scrittura-decisioni.md) includes
AND/OR, chained relations, and quotient postcondition.

Original raw state is 1,991,414 bytes with SHA256
`e6d67d0e7c452205c2531375b68ec584740e47d6e45302ebdaef1f5d730a54f4`.
Lossless compression follows readings and preserves descriptor,
gzip, and fingerprint of reconstructed bytes.

The [first C1 reading](cbor-float-scrittura-revisione.md) found a
post-guard redundant with the u23 type. Before compilation it is
replaced with separate HIGH and LOW reconstruction, without u64.
Original, correction, and note are preserved. The two final readings,
including the [second C1 reading](cbor-float-scrittura-lettura.md), have
no open findings. Static review is not a runtime failure.

The [data](cbor-float-scrittura-dati.md) and
[coverage](cbor-float-scrittura-copertura.md) readings retain their own
provenance. The corpus author does not claim independence from the suite;
the auditor's author declares authorship and the coordinator reads its
code. Ad hoc extractor errors are declared separately
from campaigns, with partially available observations. Inventories
and fingerprints do not authenticate execution. The C4 reader checks
proper acyclic conses, without promising a general vector check.

<a id="integrazione"></a>

## Integration

The preliminary run on `364ac3b` passes with 987 named tests and two smoke tests:
989 distinct OK, 25.80555 s, 738 source fingerprints identical before/after,
165 lint files without violations, and 118 REQ/65 INV/13 FI/52 ADR without errors.
There are no warnings or style-warnings.

`make check` on `1f36b4073a0595f3bd215305ffce4715b171e4a6` integrates
`main` at `3106a49` and physical read-only/append file binding:
987 named + two smoke = 989 suite OK; four linter self-tests
bring the total to 993 unique OK. The 741 fingerprints are stable,
the working tree is clean, and elapsed time is 210.370008 s. Lint: 167 files,
zero violations; traceability: 118/65/13/52, zero errors; links:
348 files and 2,598 links, zero errors. All 123 evidence-storage
self-checks and the other verifiers pass.

Ten spikes give nine OK and SPK-07 PASS, all exit 0/STABLE.
Artifacts match aggregate results including type, sizes,
and array elements; 62 fingerprints across 50 paths match
the wrapper. This does not close spike or engine gates.

Subsequent integration of the 42 GET-resolver OUTCOME tests,
on `56e0a3acc26633bc8a9c5377f7b6a946466d9a45`, passes with 1,029 named
tests, two smoke tests, and four linter self-tests: 1,035 unique OK.
The 751 fingerprints are identical before/after; core checking takes
225.684821 s and the wrapper 228.782840 s. Lint and traceability remain
error-free; links number 2,638 across 356 files, all valid. Evidence
includes 79 catalogs, 2,585 references, and 17,967 files. Float sinks
remain 2,115,584/2,148,352; observed overlaps are 2,586/2,722 ticks.

Final integration on `3ed6ebfba4dc692b524a4cf3416c8757de978e41`
also includes the pool controller published at `45eb153`: `make check`
is OK/0/STABLE in 209.526331 s, with 766 identical before/after fingerprints
and clean working tree. The suite passes with 1,052 named and two smoke tests;
four linter self-tests bring the total to 1,058 unique OK.
Lint: 173 files, zero violations; traceability: 118/65/13/52, zero errors.
Float writer and corpus retain their original frozen fingerprints.
Links number 2,668 across 363 files, all valid; evidence checking
passes across 80 catalogs, 2,610 references, and 18,053 files. The ten
spike tests remain OK/PASS, exit 0/STABLE, and identical to their aggregates,
with 62 fingerprints across 50 paths matching. Both float waves
retain original sinks; overlaps are 2,570/2,564 ticks.
The first summary count included four linter self-tests among
named tests: it is corrected before preservation of the final document.

<a id="conservazione"></a>

## Preservation

The [main archive](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-cbor-float-write/catalogo.lisp)
preserves 2,795 indexed files, 2,797 total files, and 26,641,257 indexed
bytes: registers, frozen code, mutant copies, logs, measurements,
raw/HTML, and readings. The 15 processes comprise 13 OK and two failed
attempts of the C4 collection helper, due to parentheses and
SIGNAL-SEMAPHORE signature, without product loading. Versions and registers
are preserved; later self-tests pass with 18 copies, four
workers, and specific rejections for corruption, duplicate target, and existing
destination. Correcting the date to 2026-10-13 preserves the previous
version and another successful self-test.

Collection uses four workers, three SHAs per copy, directories created
before workers, and an index published after comparisons. Workers copy
380/632/852/931 files without errors; the wrapper takes 628.033756 s,
including independent verification of the sealed inventory. This is not a
parallelism benchmark. The main archive remains unchanged after
collection. Observations are local, without live comparison of
origins, atomic publication, or C1 promotion.

The [final supplement](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-cbor-float-write-final/catalogo.lisp)
preserves later integration checks, original collection,
its observation and closure log, final readings, and copies of
published documents. Its inventory is verified separately.
The [final integration reading](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-cbor-float-write-final/raw/pool-integration-review-final.md.txt)
preserves data comparisons and their limits.
