<a id="verifiche-della-composizione-array-cbor"></a>

# Verification of CBOR array composition

Campaigns of 2026-10-13 against the [preregistered method](cbor-array-metodo.md),
blob `2f257c9e8a56a5182142934dada3f3b38b5bef65`. Corpus frozen
before product; both C1 readings precede first compilation.
Tested versions are input `d3b3d07fc18bd2a077c1a2d79020a76263b2779e`
and writer `a410297c29c5d043ad60d3804bd3711e22c2833b`.

<a id="corpus-e-parallelismo"></a>

## Corpus and parallelism

Twenty tests comprise nineteen serial tests and one with two reused
workers. Literal vectors cover empty array, scalars, five types,
COUNT23/24/255/256, array/map/tag children, UTF-8 text, and raw floats.
Checks include exact arity, complete physical destination, source,
table, error precedence, scratch aliases, header
overlap, touching boundaries, absolute offsets, and reuse after error.
Exact 16MiB budgets, root in node count,
zero remainder before the next child, and child depth99/100 are tested.
The table's ignored tail is neither read nor limited by budget.

Fuzz uses 1,024 cases and seed `41525235`: 512 successes and 64 rejections
for each of eight classes: capacity, bytes, ends, nodes, depth,
parsing, source range, and COUNT. The suite count of 9,474 calls
derives from frozen loops, without a separate runtime counter.

Two real workers, with private buffers and scratch, share source and
index read-only. Two waves of 2,048 calls per worker give 8,192
operations, with READY/GO/DONE, bounded timeouts and cleanup. Sinks are
52,178,944/75,218,944 per worker in both waves. Work intervals
of the first build overlap by 3,939/3,151 ticks at 1,000,000 ticks/s;
this observation does not measure scaling or simultaneous execution on cores.

<a id="misure-e-mutazioni"></a>

## Measurements and mutations

Six frozen fixtures cover empty, scalar, five types, 24 scalars,
256 scalars, and array/tag/text. Five samples of 1,024 calls per
fixture after warmup64 produce thirty samples with zero observed
heap. Zero baseline and positive sensor of 16 × 1MiB observe
zero and 16,777,472 bytes, respectively.

NEXT, cold arity, full array, source, table, tokens, and sinks
are checked. The hot loop uses the primary value; the corpus checks
arity on every success. Samples sum to 0.336716s, wrapper duration
1.716347s. The auditor recalculates all six fixtures arithmetically and checks
67,470 relations without loading product or driver. There is no speed
threshold or absolute proof of no allocation.

Eight compilable mutations check physical capacity against END,
major type, COUNT, scanner omission, overlap without header,
unverified table, root excluded from nodes, and extra NIL value.
The semantic catalog precedes the product; concrete replacements
are materialized later on private copies. The arity
mutation consistently updates FTYPE and declarations in that copy only.

Baseline ends with 1,101 total OK lines, twenty from the array
corpus. All eight logs have smoke before Unhandled, exit1 without
signal or warning, and an exact nominal corpus frame: `8 DETECTED`,
no `SURVIVED`, `INVALID`, or `WORKER-ERROR`. Nine copies contain
308 files each: 2,772 comparisons verify baseline and, for each
mutant, 307 unchanged files plus the expected single replacement.
The 313 internal hashes include five helpers not copied; they are not
a complete transitive closure. Reclassification and hashes
remain local observations, without proof of exclusive causality.

The classifier requires smoke, Unhandled, and a numbered frame with
an exact symbol from one of twenty zero-argument nominal tests. It rejects
quoted namespaces, strings, unrelated functions, warnings, compilation
failures, signals, and faults after completion. Two preparatory
driver defects, permissive frame matching and constant EOF sentinel,
are corrected before the campaign; versions and history remain
preserved. The final reader uses READ-EVAL NIL, standard readtable, and
GENSYM sentinel; it also rejects a second literal `:eof` form.

<a id="copertura-e-letture"></a>

## Coverage and readings

| Source | Expressions | Branch outcomes |
|---|---:|---:|
| cbor-array-input.lisp | 248/281 | 42/48 |
| cbor-array-write.lisp | 184/256 | 18/34 |
| Total | 432/537 | 60/82 |

105 expressions are missing: 14 top-level package/declaration forms,
88 subforms of 22 internal ERRORs, and three keyword defaults. Missing
22 branch outcomes are on the same internal guards. All remain in
the denominator. Global raw data contains 302 files; selected scope
includes only the two new sources. Raw data, HTML, and cold recalculation
agree. No exclusion, unreachability attestation,
MC/DC, or C1 qualification.

The [first C1 reading](cbor-array-revisione.md),
[second C1 reading](cbor-array-lettura.md), and
[decision inventory](cbor-array-decisioni.md) cover ten
functions, 9–36 lines and 3–8 paths: 36 WHEN/UNLESS forms, two LOOPs,
five AND/OR forms with fourteen operands, and eight chained relations.
Before compilation, the guard also limiting the table's ignored
tail is corrected; original and finding note are
preserved. Both final readings have no open static findings.

Runtime readings use distinct C4 data and readers without calling
product or driver. The corpus author declares authorship
in the coverage reading; they do not claim a third independent C1 review.
The first coverage extractor applied a plist reader to non-plist raw data:
correction and partial observation are declared in the note.
Inventories and hashes document local comparisons without authenticating
execution provenance or promoting the document profile.

The mutation reading compares copies against the frozen baseline,
checked against campaign pins. Five current files had changed
through later merges: they are not used as comparison origins.
Its preliminary version had two STRING= warnings and incorrectly required
current ASDF. Original output and reconstructed reader version are
preserved, distinguishing the latter from a fingerprinted original.
The corrected reader ends without warnings.

<a id="integrazione"></a>

## Integration

First `make check`, on `857bfc77962eb4d74b382bf225c8493824baef77`,
integrates CONTROL checkpoint and pool lifecycle: 1,117 nominal tests and two
smoke tests, plus four linter self-tests. All 811 tracked hashes are
stable. Lint: 194 files/zero violations; traceability: 119 REQ,65 INV,
13 FI,52 ADR,zero errors; links: 390 files,2,779 links,zero broken.

After pool-governed writer claiming, the check on
`bdf709edf713891410b4639f219e1c9c1ba1f31a` stops at links in the temporary
results draft: four relative to the future destination.
Suite, lint, and traceability had already passed; the full check
remains FAILED/exit2/STABLE. Draft and failed record are preserved.
The draft is renamed from `.md` to `.md.txt` with identical bytes.

Full check repeated on the same commit is OK/exit0/STABLE:
1,129 nominal tests, two smoke tests, and four linter self-tests; 818 stable
tracked hashes. Lint: 195 files,zero violations; traceability unchanged;
links: 395 files,2,807 links,zero broken. Preservation self-tests
pass: 123 checks on40 cases, plus publication2 and normalizer6.
Evidence then present comprises 86 catalogs,2,927 references,
18,945 files. Hashes of both products and all three corpus files remain exact.

Ten spikes finish with nine OK and SPK-07 PASS, all exit0/STABLE.
Child results match aggregate copies in array types and
contents too. The 62 hash occurrences in children
correspond to 54 unique paths; they match aggregate and wrapper.
These checks do not close spike or engine gates.
Preparatory reader attempts, including data shape, visit
budget, and initially fixed counts, remain distinct from product
failures and preserved with their limits.

Integration of empty ACTIVE bootstrap and evolution of Series
sources ends on commit `842064ad196e8ad4a9b32affe08773a996276656` with
another OK/exit0/STABLE check: 1,154 nominal tests, two smoke tests, and four
linter self-tests; 822 stable tracked hashes. Lint: 196 files and zero
violations; traceability: 119/65/13/52 and zero errors; links: 403 files,
2,814 links and zero broken. Ten spikes retain the same
outcomes and ratio of 54 unique paths/62 occurrences. Evidence then
present comprises 88 catalogs, 2,985 references, and 22,181 files.

The internal-record DATA reading confirms these numbers, child
artifacts, and sixteen stable physical observations without loading product.
The external wrapper separately preserves invocation of the internal
check. All five array hashes are unchanged; coverage-tool
conflicts are resolved by retaining array and ACTIVE scopes. Static
reading and integrated-tool self-test pass. Preservation
checks retain 123/2/6 checks, and process fixtures
distinguish signals and faults after completion.

Remote integration `06cc1354cd6843c40da0570e5314fef7cf68a667`
adds 28 GET ACTIVE tests and its coverage tool, keeping
the product source tree identical. The merge retains array module,
RUN, and scope. The concluding check recompiles the system
and runs 1,182 nominal tests and two smoke tests without warnings; lint, traceability, and
links pass. Global evidence verification and ten spikes
precede this test integration; new records are preserved
in the supplement. Already closed archives retain exact versions
of documents and data observed during earlier campaigns.

CONTROL publication from main
`e599703a6d840f3788e642042facf3ea71d8d32a` is then integrated. Compilation and the full
combined suite pass with the same 1,182 nominal tests and two smoke tests;
lint, traceability, and links remain valid. Array products, corpus, and scopes
retain frozen hashes. Earlier global tests and spikes
remain distinct from this integration check;
open CONTROL-publication qualifications are not promoted.

The pool/Serie dispatcher from main
`6253f0389337a3712146a885b3c3abddf570199e` is integrated, retaining
array module, RUN, and hashes. The combined system is recompiled
without warnings: 1,196 nominal tests and two smoke tests pass, with 204 files and zero
lint violations, valid traceability, and 2,887 error-free links.
The final 1,050,740-byte record is losslessly compressed by the preservation
tool after completion, within existing limits.
This verification covers compilation, suite, lint, traceability, and links;
it neither repeats earlier global campaigns nor closes open qualifications.

<a id="conservazione-delle-prove"></a>

## Evidence preservation

The [main archive](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-cbor-array-write/catalogo.lisp)
preserves 3,003 indexed files and 3,005 total files, with fourteen
processes: thirteen OK and the failed draft check. Indexed files
sum to 30,037,030 bytes; index and catalog occupy 1,008,588 and 318 bytes.
Four workers copied 379/827/845/952 files without errors. Independent
closure verification ends OK/exit0 before the COMPLETE result.
Three hashes per copy compare origin before/after and destination;
they establish neither atomic publication nor execution provenance.

Raw coverage of 2,195,898 bytes is preserved losslessly through a
descriptor and gzip payload. Decoded SHA256 is
`1fe31c9fd8fa60689f910672a5c53cdcbabbd73da6d71f87209afdc3007a68ec`.
Limits of 1MiB per plain file and 8MiB per gzip remain unchanged.
Collection preflight agrees with final sizes.
The final observation outside collection, 1,086,541 bytes, is copied
with hash comparison and separately compressed losslessly
after data reading; the original remains intact in local backup.
SHA256 of reconstructed bytes is
`fd97df991f566b23f331318484640d55572af32db8811b14b11151ff3df03599`.

A collection attempt is interrupted before closure when
raw coverage over the plain limit is detected. SBCL exits0 after
SIGTERM, so wrapper OK does not indicate complete collection.
The attempt retains only partial copies without index or catalog;
it remains in local backup with its note, without being presented as
a closed archive. Original, record, and reason are preserved.

The [supplement](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-cbor-array-write-final/catalogo.lisp)
preserves later integration checks, data readings,
preflights, and collection records, including preparatory attempts.
Verified closure concerns the files actually indexed;
it does not close C1 qualification, MC/DC, or spike gates.
