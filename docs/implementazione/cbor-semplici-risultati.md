<a id="verifiche-della-scrittura-dei-valori-semplici-cbor"></a>

# Verification of writing CBOR simple values

Campaigns of 2026-10-11 against the [preregistered method](cbor-semplici-metodo.md),
blob `e8864f7c0124f86cebdcdbcb2449800e078e1cc8`. The blind corpus was
frozen before writing the product; compilation and campaigns follow
the [two](cbor-semplici-revisione.md) [C1 readings](cbor-semplici-lettura.md).
Product `58c7a3a040ec814fae2dfe636f569b5623cba8f0`, unchanged during tests.
The primitive writes MT7 wire codes, without added application semantics,
floats, composition, or durable publication.

<a id="corpus-e-worker"></a>

## Corpus and workers

16 new tests: 15 serial and one with two reused real workers. The preliminary
check on the integrated GET/cache base passes in 22.106124 s: 852 nominal
tests and two smoke tests, 854 distinct OK names, compilation without warnings or
style-warnings, lint on 150 files without violations, and traceability without errors
(117 requirements, 65 invariants, 13 FI scenarios, 52 ADRs). The 685 source
elements match before/after; HEAD `0865b2c` includes main `6eeb501`.

All 248 allowed codes, eight offsets, and three configurations: 5,952
cold successes; 3,776 insufficient capacities and 256 reserved-code
rejections. Fuzz 2,048 cases seed53494D43: 768 successes, 512 invalid values,
256 insufficient capacities, 512 invalid destinations/ranges. Code
concatenation in 472 bytes, exact arity, and full physical-array comparison.
Minimal reader and scanner are only supplementary checks after
independently calculated expected bytes.

Two waves of 8,192 items for each of two workers: 32,768 calls,
private destinations and immutable plans, sinks 3,804,160/3,836,928 in every
wave. Preliminary overlap 2,098/2,077 ticks at 1,000,000 ticks/s, bounded waits,
joins, and cleanup. No inference about simultaneous execution on cores,
scaling, or pool throughput.

Review of the new corpus found a risk in the old string harness:
a single GO/DONE for two waves allowed the fast worker
to consume the permit intended for the other. READY/GO/DONE are
now separate for each wave, in the new corpus and string fixture.
Originals and diffs are preserved; earlier archives remain unchanged.
The corrected string test retains sinks 9,707,520/9,969,664,
with preliminary overlap 48,278/48,460 ticks. The header test has
one wave and remains unchanged. The finding concerns false failures/timeouts
of the protocol, without attributing false PASS results to earlier campaigns.

<a id="misure-e-mutazioni"></a>

## Measurements and mutations

Six fixtures 0/20/22/23/32/255, five replicates of 4,096 calls with
warmup128: 30 samples with zero observed heap. Zero baseline and positive
sensor 16×1 MiB, 16,777,472 bytes observed. Bytes, full arrays, NEXT,
tokens, and sinks are recalculated by the independent audit: 20,409 checks.
The bench process takes 1.2138 s; measured samples sum to 0.02209 s,
including output checks. The local counter does not prove absolute
absence of allocation; there is no speed threshold. Arity is checked
cold in all six fixtures and every corpus call; the hot measurement
uses the primary value and complete-output token.

Eight mutations: 8 DETECTED, zero SURVIVED/INVALID/WORKER-ERROR. Full
baseline successful and private copies/caches. The audit checks 254 declared files
per copy, unique replacements, and nine logs, with 15,320 checks.
The independent reading separately checks rejection origin and order,
because the inherited automatic classification does not demonstrate
causality from the smoke marker and presence of Unhandled alone.
The declared inventory does not establish closure of private trees.

The capacity mutant uses MAX between span and physical capacity, retaining
typed use of SPAN to avoid a possible spurious style-warning.
Review is static, before compiling copies: no compilation
INVALID is invented. The arity mutant replaces one
DECLAIM+DEFUN fragment: in that copy only, FTYPE declares the second
NIL and the body returns two values. There is one runtime defect: arity.
Earlier catalog versions and diffs are preserved.

<a id="copertura-e-verificatori"></a>

## Coverage and verifiers

Coverage of only the new file: **95/111 expressions, 20/24 branch outcomes**.
All 16 expressions (four declarations and twelve internal-error
forms) and four missing guard outcomes remain in the denominator.
Raw state, two HTML files, and syntactic gap associations
are verified with 1,178 checks. The [inventory](cbor-semplici-decisioni.md)
includes two ANDs, the chained relation, and code TYPEP union;
it establishes neither MC/DC nor unreachability. The ADR-0035 C1 gate remains open.

The [tool reading](cbor-semplici-verificatori.md) also preserves
the limits of the classifier and declared inventories.
The [independent data reading](cbor-semplici-dati.md) compares
complete records, all nine logs, and results against the frozen corpus.
Driver and audit self-tests pass. The coverage/mutation helper
exercises 27 synthetic fixtures with 529 checks; its negative cases accept
a generic error without proving the exact reason. The benchmark auditor
also checks rejection reasons. These checks verify consistency
and byte stability without authenticating execution.

The first local orchestrator fails with exit1 when associating two records
created in parallel through directory differences. Both child commands
succeeded; no product or corpus changes. The correction reads
its own wrapper's marker and checks argv, with one positive
and four negative fixtures passing. Original, failure observation, and
full child records are preserved; the terminal observation
is declared partial. An auditor-comment correction clarifies
the actual chronology without changing logic or expected values.

<a id="conservazione"></a>

## Preservation

The [campaign archive](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-cbor-simple-write/archive-index.lisp)
preserves processes, frozen sources, tool revisions, coverage state and
HTML, copies, and logs. gzip compression with reconstructed-byte
verification, without rewriting earlier campaigns or promoting qualifications.
It has 2,439 indexed files and 15 processes; the closed-inventory verifier counts
2,441 actual files, including index and catalog, and verifies all published
bytes and hashes. Processes OK/exit0/STABLE, closed inventory.

The [final supplement](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-cbor-simple-write-final/archive-index.lisp)
preserves collection, original-archive audit, full check,
integrated coverage self-test, final collection, and the supplement's first audit,
as well as ten spike results, self-test logs, and the original data reading.
It has 58 indexed files, 60 actual files, and six processes. Sealing after
adding the audit also passes on the final contents; its
record remains in the complete local copy of ignored outputs.
Closed verification does not compare origins or establish atomic
publication, authenticity, or C1 qualification.

<a id="integrazione-finale"></a>

## Final integration

`make check` passes on `b5dcb1a59aa594978d6d3779d039dd03c3a054d3`, which
integrates main `7568456cde708007b751e34312d5a3ae6fb0a38b`: worker routing
and the GET suite are included alongside the new writer. **940 nominal tests
and two smoke tests**, compilation without warnings or style-warnings, lint,
verifier self-tests, traceability, links, preservation, and ten
successful spikes. Full-command duration 214.37419 s; all 709 source
elements match before/after. Product and CBOR corpus retain the blobs
frozen in earlier campaigns.
The 942 build OK lines and four linter self-tests are all
distinct: 946 OK lines in full output. Lint: 159 files, zero violations.

The simple corpus retains sinks 3,804,160/3,836,928 in both
waves, overlap 2,651/2,565 ticks; the corrected string corpus retains
9,707,520/9,969,664, overlap 50,189/55,312 ticks. Timer 1,000,000 ticks/s.
The integrated coverage self-test also passes after combining the
GET and simple-write scopes. No new heap or coverage measurement is inferred
from the full check; campaign limits remain unchanged.
