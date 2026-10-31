<a id="scrittura-delle-stringhe-cbor--revisione-dei-dati"></a>

# CBOR string writing — data review

Reading on 2026-10-11, frozen in spikes/out during the recorded
campaigns; no trackable file or frozen test is modified by the reading.
The reading starts no build, test, benchmark, coverage, or mutation run.
Final review of the listed records; the draft and any helpers for
this reading are frozen before collection. Links still show
original paths as historical metadata. Bytes are preserved
in the [original archive](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-cbor-string-write/archive-index.lisp),
which maps each source path to its published copy.

<a id="record-preliminare"></a>

## Preliminary record

Record read in full as data through
`arcdocdb.evidence:read-evidence` in `tools/evidence-storage.lisp`:
`spikes/out/4000708581-command-2575-0/report.lisp`.
The reader returns schema1, kind COMMAND-VERIFICATION, command
`make test lint trace`, STATUS OK, EXIT-CODE0, SOURCE-CONSISTENCY STABLE,
and WALL-SECONDS13.692469d0. The 606 SOURCE-BLOBS-BEFORE and AFTER elements
are equal, including frozen product and corpus.

Declared environment: SBCL2.6.9, Darwin27.0.0 ARM64, AppleM4, ten logical
CPUs, 16GiB RAM; external load UNCONTROLLED. Git base
`2a0011f9d2bef104b22f7ad1eb86d7e5d60d5e11`, working tree recorded.
Time includes the entire command and does not measure a single operation.

Blobs in the record match the freeze:

| Artifact | Git blob |
|---|---|
| Product | `a2c5c77dd51bff760bff4508e998d94370921eda` |
| Blind support | `e45437a508fc7893c4df06f3129ab064d3a4dbdd` |
| Blind serial tests | `ed0f6a67c46498bdc9c721480cb76bc727fc5b4f` |
| Blind worker tests | `33c7e6a9a0d6bbd551d4171ece6681b66bf87657` |
| Second static reading | `6602c0c81fe57865cd417c0a1e8eea275742c876` |
| ASDF | `e3a98df96d9e7be83e41bfef21a2bf08a59017e8` |

<a id="test-compilazione-e-controlli"></a>

## Tests, compilation, and checks

The record contains 122,711 STDOUT characters and 220,252 STDERR characters, examined
in full through the reader. There are 683 `ok    ` lines, all unique:
681 named tests and two smoke tests (`package ARCDOCDB presente` and
`ARCDOCDB:*VERSION* è una stringa`). The eighteen suite counts
sum to 681:

| Suite | Named tests |
|---|---:|
| Foundations | 28 |
| UTF-8 | 17 |
| CBOR headers | 17 |
| Minimal CBOR headers | 15 |
| CBOR structure | 24 |
| Minimal CBOR structure | 22 |
| CBOR header writing | 17 |
| CBOR string writing | 21 |
| CSN register | 20 |
| Snapshot/CSN | 43 |
| Writer/worker queues | 89 |
| Storage metadata | 44 |
| I/O | 18 |
| Recovery | 95 |
| WAL | 48 |
| Serie controller | 44 |
| Index slots v2 | 64 |
| Primary index | 55 |

All twenty-one REQ-CBR-002 names in the frozen corpus appear once,
including the parallel test. The log records 8,194 length comparisons
and fuzz2048, seed53574342, with 1,546 accepted and 502 UTF-8 rejections:
the sum matches the plan. Other corpus quantities are
deduced from frozen asserts and fixtures, without a new independent
counter in the log.

Forced compilation and tools/build.lisp policy treat warnings
and style-warnings as errors. The complete content contains no
warning/style-warning or Unhandled; the final marker appears:
`build e test: nessun avviso, tutti i controlli superati`.
STDERR retains compilation notes: 158 for the product and 198 for
tests, without observed warnings. Lint records 125 files, zero violations;
trace records 116 requirements, 65 invariants, 13 FI scenarios, 52 ADRs, and zero
errors. EXIT-CODE0 and STATUS OK are consistent with these markers.

<a id="dati-dei-worker"></a>

## Worker data

Two real workers, each with a private destination, are reused in
two waves. Each worker performs 8,192 items per wave on a shared,
immutable 1,024-byte source. On every call, the corpus checks a single fixnum
NEXT and the entire destination; after join it checks the complete source
and buffers. Waits, join, and cleanup have bounds and check
termination. The named test passes in the preliminary record.

Cold sink recalculation: payload1024 requires header3; START3 implies
NEXT1030. Initial header bytes are MT2=#x59=89 and MT3=#x79=121;
the final payload byte is #x42=66. Token per item: 1030+89+66=1185 and
1030+121+66=1217. Multiplying by8192 gives exactly
9707520/9969664, both sinks observed in both waves.

| Wave | Total items | MT2/MT3 sink | Overlap at 1,000,000 ticks/s |
|---|---:|---|---:|
| 0 | 16,384 | 9,707,520 / 9,969,664 | 47,821 ticks = 47.821 ms |
| 1 | 16,384 | 9,707,520 / 9,969,664 | 47,752 ticks = 47.752 ms |

Total32.768 items and 33,554,432 copied payload bytes. Actual intervals
overlap and sinks depend on observed values/bytes. The record
supports functional concurrency on a shared source and private
destinations; it does not establish simultaneity across cores or scaling. Cold
check overhead remains in command and test timing.

<a id="benchmark-seriale-e-sensori"></a>

## Serial benchmark and sensors

Record `spikes/out/4000708804-command-7496-0/report.lisp`, read as data
through evidence-storage: wrapper OK/exit0/STABLE, 83.243866 seconds,
606 equal before/after blobs. Internal CBOR-STRING-WRITE-BENCHMARK report
OK, sources STABLE with 127 equal fingerprints, one worker, safety3,
clock1.000.000 ticks/s. Empty STDERR.

Nine fixtures have five samples each, 4,096 measured calls and
warmup128 per sample: 45 samples, 184,320 measured calls. Every
sample observes heap0. A separate recalculation, without loading product or
driver, reconstructs the arithmetic header, payload, and entire buffer with two
initial and four final sentinels. All expected-full-buffer values,
NEXT, tokens, and cold-values match; each cold arity is one.
All samples match the independent sink
4096×token+(4096×4095)/2, with warmup/iterations and ticks/seconds conversion.
The source-unchanged, private-preallocated-buffer-and-source,
and complete-output-checked-per-call observations are true for every fixture.

| Fixture | NEXT | Cold token | Complete buffer bytes | Min–max seconds per 4,096 calls |
|---|---:|---:|---:|---|
| MT2, 23 bytes | 26 | 107,567 | 30 | 0.003207–0.003285 |
| MT2, 24 bytes | 28 | 121,993 | 32 | 0.003421–0.003479 |
| MT2, 256 bytes | 261 | 8,889,817 | 265 | 0.025691–0.025793 |
| MT2, 65,536 bytes | 65,543 | 547,776,994,183 | 65,547 | 6.279073–7.036515 |
| MT3 ASCII, 23 bytes | 26 | 53,153 | 30 | 0.004466–0.004555 |
| MT3 ASCII, 24 bytes | 28 | 59,521 | 32 | 0.004665–0.004754 |
| MT3 ASCII, 256 bytes | 261 | 3,490,105 | 265 | 0.037904–0.038055 |
| MT3 ASCII, 65,536 bytes | 65,543 | 208,396,917,735 | 65,547 | 9.293614–9.424335 |
| MT3 Unicode, 16 bytes | 19 | 49,192 | 23 | 0.002944–0.002979 |

Checks recorded in the same benchmark observe baselineheap0,
sink8.386.560 for4096 null calls, and positiveheap16.777.472 bytes for
16 deliberate 1MiB arrays, sink16.777.336. The output check
reports token3529, altered NEXT rejected, and three
prefix/payload/suffix alterations rejected; the arity check accepts a single
value and rejects four arity/NEXT fixtures.

Frozen driver `c4bd98e145d13deb47b7eedb0f4581a241f1d0e1` runs
checked-token on the whole buffer on every measured call and compares
the source at the end. Timings include these checks. The counter
measures the observed managed heap delta on success, with GC and warmup
outside measurement; it is not absolute proof of no allocation and does not
cover error paths, pool, I/O, or scaling. External load is uncontrolled.

The data auditor's self-test is preserved in record
`spikes/out/4000708787-command-7053-0/report.lisp`: OK/exit0/STABLE,
1.812891 seconds, four positive and 54 negative fixtures, 37,424 checks.
These are synthetic data, without product execution. The previous
attempt `spikes/out/4000708581-command-2576-0/report.lisp` remains
FAILED/exit1/STABLE, 1.41555 seconds, 9,432 checks: undefined SETF FIRST-SAMPLE
setter in the auditor fixture. The correction is in auditor blob
`ae591bf0f2b37d0ed2ae08f16d0270568268a048`; the old file remains in the
original freeze. Neither attempt is omitted.

The audit of real data is read in record
`spikes/out/4000708897-command-8700-0/report.lisp`: OK/exit0/STABLE,
1.895363 seconds, empty STDERR, 19,170 checks. Before/after, the benchmark
wrapper retains 654,034 bytes and SHA256
`9fb205681abf9b324bf392eb56348c4484941a849035b18d827994f7c60dde59`.
The audit confirms nine cells, 45 samples, heap0, coldarity1, 127 fingerprints,
baseline0, and positive16.777.472 bytes. Sample times sum to
79.272522 seconds, within the83,243866 of the complete command. The auditor
retains its limits concerning data consistency, declared inventory, before/after
observations, and absence of proof of authenticity or execution.

<a id="copertura-grezza-e-forma-other"></a>

## Raw coverage and OTHER form

Record `spikes/out/4000708897-command-8699-0/report.lisp`:
OK/exit0/STABLE, 11.407834 seconds, empty STDERR. The coverage command
uses scope `cbor-string-write`, private cache, and all21 suite tests.
The same fuzz counts and sinks appear in the instrumented record; worker overlap
56,188/55,237 ticks. Instrumented times remain diagnostic.

Raw outputs preserved in `spikes/out/cbor-string-write-coverage-20261011/`:
coverage-state.lisp, cover-index.html, and the sole source HTML
`de5dd74a96006e359337b0ce64959b64.html`. Raw state saves204 files,
while the HTML scope contains only the new product. Independent
reading of raw vectors through call-with-evidence-bytes and READ
with READ-EVAL NIL confirms256/308 expressions and39/52 branch outcomes;
both HTML tables agree, respectively83,1% and75,0%.

Coverage audit: record
`spikes/out/4000708950-command-9144-0/report.lisp`, OK/exit0/STABLE,
2.236314 seconds, 74 checks; result taskroot/audit-coverage.lisp.
Five before/after file observations match. The52 uncovered expressions
are syntactically associated with7 declarations,44 internal-error forms,
and one OTHER; the13 uncovered branch outcomes are associated
with internal guards, with zero OTHER branches. All
denominators and internal-error forms are retained.

The single OTHER has raw-path `(8 2 11)` and forward-path `(11 2 8)`:
it is `(max-bytes +cbor-scan-max-bytes+)`, a keyword argument with default
in the public function's lambda-list, line99. The path was
resolved directly in source forms read as data; source
HTML marks exactly that form with state-2. It remains OTHER and in the
denominator. Calls without the keyword in the corpus do not
authorize correction of instrumented data or declaration that the form
is unreachable. Association of remaining gaps is syntactic, without
proof of unreachability, exclusions, MC/DC, or C1 gate closure.

<a id="mutazioni-e-lettura-dei-log"></a>

## Mutations and log reading

Record `spikes/out/4000708897-command-8701-0/report.lisp`, directory
`spikes/out/cbor-string-write-mutations-20261011/`:
OK/exit0/STABLE, 85.832531 seconds, empty STDERR. Internal report OK,
stable fingerprints, baseline OK/exit0/signalNIL, and eight mutants detected,
zero survivors, invalids, or worker-errors. The exact preamble identifies
the worker self-test, with preserved report
`spikes/out/4000708899-cbor-string-write-worker-self-test-8780/report.lisp`.
Self-test data record dispatcher2valid/6negative, unique replacement,
exact smoke marker, invalid compilation, signal, and post-completion fault
distinct from detections, eight applicable targets.

Reading all nine complete logs through evidence-storage: baseline has
683 ok lines, smoke at line2, build-end at743, and no Unhandled.
Each mutant has exit1, signalNIL, smoke before the first Unhandled,
no build-end, and a recognizable path in the new suite. Both
COPY-PROGRESS guards are runtime errors in the mutated product. The other
six alterations are caught by blind asserts; some rejections
also show the subsequent immutable-array assert during cleanup,
without constituting an additional detection.

| Copy | Target | Observed runtime outcome |
|---|---|---|
| 0 | MT2/3 major swapped | Entire destination differs in literal-vector test |
| 1 | Scalar length instead of bytes | Entire destination differs in Unicode/no-normalization test |
| 2 | Final payload byte omitted | INVARIANT-VIOLATION COPY-PROGRESS in literal test |
| 3 | Zero source origin | INVARIANT-VIOLATION COPY-PROGRESS, including empty span with source offset |
| 4 | Budget without header | Unexpected normal return and mutated buffer in budget/empty-item test |
| 5 | Physical capacity instead of END | Unexpected normal return and mutated buffer in capacity/physical-suffix test |
| 6 | Overlap ignoring initial byte | Unexpected normal return in overlap test including header |
| 7 | Nonempty text validation skipped | Unexpected normal return and mutated buffer in malformed-UTF-8/offset test |

Mutation audit: record
`spikes/out/4000709011-command-9525-0/report.lisp`, OK/exit0/STABLE,
9.133384 seconds, empty STDERR, 11,828 checks; taskroot/audit-mutations.lisp.
The36 before/after file observations match. Nine copies of210 files
in the declared inventory are compared: baseline identical; each
mutant changes only the expected product, with a unique replacement
matching the catalog. Private runners and caches are present.

The comparison closes the declared inventory without attesting to the entire
copy tree or record authenticity. The runtime classifier uses
markers/exit and does not alone demonstrate that the error comes from the target;
the auditor's log-check seeks smoke and Unhandled without enforcing their order
or suite origin. For actual logs, this reading separately checked
that Unhandled follows smoke and involves REQ-CBR-002 tests,
with the outcomes in the table. Results cover only the eight targets,
without promoting durability, composite documents, engine, or release.

<a id="tentativi-della-lettura-dati"></a>

## Data reading attempts

Two inline reader attempts failed during this review,
before the corrected retry: using a plist reader on SB-COVER raw state,
which is a list, and a missing parenthesis in the log-reading
fragment. These are distinct from runtime campaigns, product, and recorded
validators. Available fragments and diagnostics are preserved in
[original excerpts](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-cbor-string-write/raw/cbor-string-write-20261011/reading-data-reader-attempts.md.txt), without reconstructing missing output.
The corrected retry decodes raw state with call-with-evidence-bytes,
READ-EVAL NIL, and reads all logs separately; no trackable file,
test, or product code was executed or modified by the review.

<a id="esito-preliminare-e-parti-pendenti"></a>

## Preliminary outcome and pending work

Preliminary PASS confirmed for compilation, corpus, regressions present
in the runner, lint, traceability, and source stability. Benchmark and its
sensors are consistent with the local zero observed heap criterion;
benchmark auditor self-test examined with failed attempt
preserved. Audits of actual benchmark/coverage/mutation data are
consistent; all coverage gaps and validator limitations
remain explicit. At this reading's freeze, full MAKE CHECK
still required confirmation during integration. The reading does not close C1/MC/DC gates or engine
and dependency qualifications. No further changes to product
or frozen tests are necessary based on the records examined.

<a id="registrazione-successiva-dellintegrazione"></a>

## Subsequent integration record

The coordinator adds metadata from final verification, after the
frozen reading: commit `ceac2dedfcfd6af05f2331282645bebf4b5be442`,
`make check` PASS, EXIT-CODE0, STABLE, 172.707537d0. Record
`spikes/out/4000710709-command-45721-0/report.lisp` retains 791 named tests
and two smoke tests, 793 OK names without duplicates, lint on 138 files without
violations, traceability without errors, and ten completed spikes.
The 643 SOURCE-BLOBS-BEFORE and AFTER elements match; product and
three test files retain blobs identified in the original reading.
The integrated coverage driver self-test passes in record
`spikes/out/4000710709-command-45705-0/report.lisp`.
These records and raw spike results are preserved
in the [final archive](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-cbor-string-write-final/archive-index.lisp).
This record does not extend the independent reading to new
main dependencies or promote gates or qualifications.

After the worker/Serie connection arrived on main `92decf4`, merge
`997f5e6505cdcf4554d5f99ede7d5743ce4be7bd` again passes `make check`:
record `spikes/out/4000711291-command-57732-0/report.lisp`, 177.072076d0,
EXIT-CODE0, STABLE, 655 source elements. Results are 817 named tests
and two smoke tests, 819 OK names without duplicates, lint on 142 files without violations,
traceability without errors, and ten completed spikes. Writer product and corpus
remain frozen. The
[supplement](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-cbor-string-write-worker-integration/archive-index.lisp)
preserves these data; the limitation on subsequent recording relative
to the original independent reading remains applicable.
