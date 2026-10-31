<a id="preparazione-del-tratto-poolserie-risultati-locali"></a>

# Preparing the pool/Serie segment: local results

C3/C4 increment on base `7f1cc54477483039bd98bd8c3f6508416f5c0ced`;
[contract](pool-prepara.md), [preregistered method](pool-prepara-metodo.md),
and [rereading with file identities](pool-prepara-revisione.md).
Implementation `fa2a483778a9a56ddcb2f12c7700e3f16ff489cc`.
Qualification uses 18 frozen files; no C1 source changes
belong to this increment. It adds 17 tests, bringing the scheduler package to 129.

<a id="processi-originali"></a>

## Original processes

All processes below are OK/STABLE/exit 0. References point to the
original copies, including preservation and gzip payloads, without promoting outcomes.

| Process | Wall s | Sources | Observed outcome |
|---|---:|---:|---|
| [Development 01](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-prepara/processes/development-01/report.lisp) | 27.950115 | 972 | 127 scheduler tests; 15 new |
| [Sensor in development](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-prepara/processes/sensor-development/report.lisp) | 25.095753 | 973 | Positive self-test, seven negative oracles, and heap/sink/clock checks |
| [Coverage reader](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-prepara/processes/reader-development/report.lisp) | 1.121031 | 973 | Independent self-test on eight identities, native/HTML, and rejections |
| [Development 02](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-prepara/processes/development-02/report.lisp) | 23.054720 | 973 | 129 scheduler tests; 17 new, including error after claim and ACK |
| [Full check](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-prepara/processes/check-core/report.lisp) | 300.887805 | 975 | 1,668 named tests, 2 smoke tests, 4 lint fixtures, all 10 spikes |
| [Coverage](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-prepara/processes/coverage/report.lisp) | 30.474354 | 975 | 129 scheduler tests, 8 files, C3 gate passed |
| [Measurements](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-prepara/processes/benchmark/report.lisp) | 38.320366 | 975 | 10 complete samples, zero observed heap |
| [Integrated build](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-prepara/processes/integrated/report.lisp) | 46.588497 | 983 | 1,722 named tests and 2 smoke tests; lint and traceability without errors |

The first test version is preserved in full and compared with the Git
blob in its record. The second adds the inactive fixture's final drain
and two scenarios after successful transfer, without changing the
product. The sensor and reader were not modified after their respective
self-tests. No failed process was discarded: all eight passed.

Strict compilation without warning/style-warning. The full check and
integrated build retain compiler notes in stderr: respectively
1,248,815 and 1,379,752 UTF-8 bytes; they are not presented as empty stderr.
The other six processes have empty stderr.

The full check includes links, traceability, tool fixtures, and
archive; its snapshot before the new publication counts 123
catalogs, 3,565 references, 42,702 files, and 1,138,547,016 bytes. All
original files from the 10-spike campaign are preserved separately.

<a id="copertura-senza-esclusioni"></a>

## Coverage without exclusions

[Specific audit](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-prepara/data/coverage/coverage-dispatch-audit.lisp):
**281/289 forms, 97.231834%; 14/14 native branches**. All of `src/dispatch/`,
without exclusions; MC/DC is not inferred.

| File | Forms | Branches |
|---|---:|---:|
| package | 1/1 | 0/0 |
| types | 40/40 | 8/8 |
| build | 24/24 | 2/2 |
| claim | 45/49 | 0/0 |
| recycle | 45/49 | 0/0 |
| begin | 21/21 | 0/0 |
| step | 51/51 | 0/0 |
| start | **54/54** | **4/4** |

The eight missing forms are preexisting and retained in the denominator:
claim, native indices 31–34, path `(1 4 3 3 4 3)` and prefixes 1/2/3;
recycle, indices 39–42, path `(1 4 2 3 3 4 6)` and prefixes 1/2/3.
The audit reports all exact paths without attributing them to new branches.
The 3,217,144-byte native original, nine HTML files, and two audits are
preserved as lossless UTF-8 text in development bundles. Only FASLs
are excluded intermediates. No coverage bit is rewritten.

<a id="allocazione-e-tempi-grezzi"></a>

## Allocation and raw timings

[Original report](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-prepara/data/benchmark/report.lisp).
SBCL 2.6.9 ARM64, Darwin 27, safety 3, clock 1,000,000 ticks/s.
Five fresh fixtures per campaign, 4096 cycles and 128 warmup cycles per replica,
four calls to the new API per cycle. Scalar checks remain inside the clock.

| Campaign | Ticks for the five replicas | Heap bytes | Sink per replica |
|---|---|---:|---:|
| EMPTY | 7507 / 7070 / 8177 / 7960 / 7980 | 0 in all | 8435712 |
| Full ACTIVE | 33711 / 36596 / 33516 / 76109 / 36643 | 0 in all | 8501248 |

40,960 measured cycles and 163,840 total preparations; ACTIVE processes 81,920
sentinel payloads in the samples alone, including enqueue, ready publication,
preparation, pop, ACK, and end. Factory, API lookup, GC, and backend
closure are excluded. All samples complete 4096 iterations.
The positive control detects 16,777,472 bytes; wrong sink, zero clock,
CLI, existing destination, and partial raw output are checked by the self-test.

The 76109-tick peak is retained. Campaigns are serial within their
process, while other local checks may be running:
external load is uncontrolled. The adapter's cost is not isolated, and these two
different paths are not compared as a speedup or regression.
A zero counter is not absolute proof of no allocation for every input.
Current/recycle, rejections, and a concurrent coordinator are not measured here.

<a id="integrazione-e-confini"></a>

## Integration and boundaries

Parent `b2536f616f34f297aec7ba67b77096cd556271cc`,
Archivio recovery qualification, was integrated with merge
`680f675237585e9d99a91a440c0f675817c892ea`. The 17 frozen files other than ASDF
remain identical; ASDF also includes the Archivio suite added by the parent.
The integrated check runs the entire suite: 238 lint files/0 violations;
122 requirements, 65 invariants, 13 FI, 52 ADRs/0 errors.

The [manifest](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-prepara/manifesto.lisp)
and [catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-prepara/catalogo.lisp)
link final sources, all frozen copies with `.txt` suffixes, processes,
and development. Verified C4 writers are reused unchanged; their generic
families are declared and do not expand the qualification scope.

No new positive concurrency test, server loop, database payload
application, or durable I/O is qualified by this campaign. CLOSING and
terminal faults remain explicit caller and Archivio responsibilities.

<a id="controllo-finale-e-conservazione-conclusiva"></a>

## Final check and concluding preservation

[Publication](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-prepara/processes/publication/report.lisp)
is OK/STABLE/exit 0, 295.396073 s, 984 sources, and empty stderr.
All 49 UTF-8 development files are preserved: an additional check
compares original bytes with text extracted from bundles, including the nine
HTML files and native output. The 18 files from the first eight processes are also compared
byte for byte with originals; no descriptor is rewritten.

After this publication, the CLOSED component, parent
`31c3776ff8304d04aed314f60c2ad66435b8654a`, was integrated with merge
`81c0e57dc9a9b79e27967832fbc524e9109c2027`. The only conflict was in the
changelog, and both entries are retained. The 17 frozen files other than
ASDF remain identical; no new measurement is attributed to CLOSED code.

The [final integrated check](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-prepara/processes/final-verification/report.lisp)
runs tests, lint, traceability, links, and evidence: OK/STABLE/exit 0,
239.448811 s, 992 sources. Passed 1,722 named tests and 2 smoke tests;
245 lint files/0 violations; 122 requirements/65 invariants/13 FI/52 ADRs/0 errors;
483 Markdown files/3,256 links/0 broken. Archive: 127 catalogs, 3,686 references,
42,949 files, and 1,154,887,206 bytes. Strict compilation without warnings;
stderr notes are preserved in full (1,401,121 UTF-8 bytes).
These counts precede the closing copies and three links added here.

The [closing manifest](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-prepara/chiusura-01.lisp)
retains the two original records and their compressed-reading capabilities,
along with final sources and closing scripts. It does not rewrite or
promote outcomes from earlier campaigns.

<a id="integrazione-finale-degli-strumenti-c4"></a>

## Final C4 tool integration

The collector from parent
`7c7255fad65336f7a7fff361ba569ad12fec1537` was then integrated. Product, tests, ASDF, and CI are
identical to the final check already reported; previous tools are
unchanged. Makefile adds the new collector's self-test.
The [additional record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-prepara-integrazione/processes/collector-self-test/report.lisp)
is OK/STABLE/exit 0, 159.863601 s, 996 sources, and empty stderr:
59 cases, 2,807 checks, fixtures preserved. No product campaign
is promoted by this C4 verification.
The [closed supplement](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-prepara-integrazione/archive-index.lisp)
retains the original record and final sources selected through an
explicit manifest; collection uses four workers and an independent checker.
Document copies retain original bytes with `.md.txt` suffixes,
so relative links still refer to original documentation.
