<a id="verifica-dellattuazione-logica-dei-worker"></a>

# Verification of logical worker actuation

The C3 campaign verifies ports, requests, and acknowledgments for preallocated workers
according to the [contract](pool-worker-lifecycle.md),
[preregistered method](pool-worker-lifecycle-metodo.md), and
[code reading](pool-worker-lifecycle-revisione.md).
The frozen copy starts from `c4bbb037b779d33ee9e8c01b4a33aac875ccf96f`
and preserves the increment's thirteen files. Original bytes and identities are
collected in the [campaign catalog](https://github.com/gpicchiarelli/ArcDocDB/tree/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-lifecycle/).

<a id="processi-congelati"></a>

## Frozen processes

| Process | Record | Outcome |
|---|---|---|
| Strict compilation and C4 self-test | [4000910603-command-11895-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-lifecycle/processes/selftest/report.lisp) | OK, STABLE, exit 0 |
| Two normal-path campaigns | [4000910621-command-11962-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-lifecycle/processes/benchmark/report.lisp) | OK, STABLE, exit 0 |
| Coverage and scheduler suite | [4000910644-command-12377-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-lifecycle/processes/coverage/report.lisp) | OK, STABLE, exit 0 |
| Full repository check | [4000910703-command-13310-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-lifecycle/processes/check-core/report.lisp) | OK, STABLE, exit 0 |

Tool and product builds treat warnings and style-warnings
as errors. The coverage suite passes 41 tests: 23 for the existing
controller and 18 new logical actuation tests. C4 self-tests detect
16777472 bytes of deliberate allocation, reject mismatched sinks and API results,
distinguish a below-resolution clock, and preserve partial raw output
and preexisting destinations. The full check passes 1076 named tests,
smoke tests, lint, traceability, links, tool self-tests, evidence
preservation, and the ten spikes. Execution takes 201,656 seconds.

Two preliminary attempts at the full check remain failed and preserved:
[shell options](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-lifecycle/processes/check-core-attempt-1/report.lisp)
and [cache configuration](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-lifecycle/processes/check-core-attempt-2/report.lisp).
Both end before product tests; their outcomes are not promoted.

<a id="copertura"></a>

## Coverage

Native SB-COVER and HTML index agree on the five new lifecycle files
and package: **414/415 expressions (99,759%), 60/60 branches (100%)**.
The C3 minimum of 95% is exceeded without file or path exclusions.
Old controller and worker sources do not contribute to these
denominators; generated paths in new sources remain included.
MC/DC is not deduced from counts.

The only missing expression remains in the denominator: file
`src/scheduler/lifecycle-build.lisp`, native index 36, path `(3 2 3)`;
HTML places it in the optional initializer `(active t)` at line
10. The [inventory of originals](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-lifecycle/development-manifest.lisp)
identifies native state, index, and six HTML pages, preserved losslessly
in bundles; the [exact audit](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-lifecycle/data/coverage-audit/coverage-audit.lisp)
retains counts and missing paths. Measurement
passes on the first frozen attempt; preliminary raw outputs retain their
distinct identities.

<a id="misura-locale"></a>

## Local measurement

Two separate campaigns, each with five replicas of 4096 measured cycles
and 128 warmup cycles per replica: **20480 measured cycles per campaign**,
ten samples overall in the [sensor report](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-lifecycle/data/benchmark/report.lisp). Factory, fixture thread startup,
synchronization, and full GC precede the measured segment.

APPLY performs retirement, repeated acknowledgment, activation, and repeated acknowledgment on
a genuine IDLE context. Private C4 requests are serial and
generations advance without reset; this fixture does not measure the
concurrent coordinator. REGISTRY uses two distinct registers with four
contexts created on two real owners; each cycle performs two updates and two
reads under hold and pending conditions, without waits in the sensor.

| Replica | APPLY ticks | REGISTRY ticks | APPLY / REGISTRY heap bytes |
|---|---:|---:|---:|
| 0 | 647 | 1351 | 0 / 0 |
| 1 | 640 | 1425 | 0 / 0 |
| 2 | 646 | 1271 | 0 / 0 |
| 3 | 655 | 1261 | 0 / 0 |
| 4 | 644 | 1271 | 0 / 0 |

SBCL 2.6.9, ARM64, Apple M4, Darwin 27.0.0; safety 3 and uncontrolled external
load. The clock has 1000000 units per second. All ten samples
complete 4096 cycles with the expected sink and zero observed heap bytes.
Ticks are local observations, without a time threshold, calibration, or
throughput conclusion. The sensor does not demonstrate universal absence of
allocation.

Verified actuation is logical: the product does not start,
suspend, or destroy any OS thread. Park/wake, shutdown, dead workers,
admission, I/O, real sensors, and a complete pool remain outside scope.

<a id="integrazione-su-main"></a>

## Integration on main

After the frozen campaign, commit `0714638e56a4a058b74839064a2b00dd583c5384`
was integrated with `ba78d8272a475af25e89b7df8c5033ff50e30b3b`, containing
the new GET and ACTIVE initialization components. Merge
`a95dab36f40560157a6631557e4774a8b320fde5` preserves the package,
five lifecycle sources, tests, and qualification sensor byte for byte. ASDF integrates the
additional modules; the changelog retains both concurrent additions.

The [integrated check](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-lifecycle/processes/integrated-build/report.lisp)
`4000911049-command-19367-0` passes 1099 named tests and smoke tests,
strict compilation, lint, and traceability: OK, STABLE, exit 0, 30,059868 seconds.
The full campaign and ten spikes remain those of the frozen base;
that process is not retroactively attributed to the merge. Evidence separately preserves
qualified sources and final sources, including added documents.

<a id="conservazione-c4"></a>

## C4 preservation

The [preservation self-test](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-lifecycle/processes/publication-selftest/report.lisp)
`4000911543-command-23689-0` passes 58 checks: OK, STABLE, exit 0.
It checks exclusive copies, original bytes and identities, UTF-8 inventory,
lossless gzip payloads, and rejection of special files or changed sources.

The [first attempt](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-lifecycle/processes/publication-selftest-attempt-1/report.lisp)
remains FAILED, STABLE, exit 1: the fixture sought pathname `/tmp`
in a record retaining canonical identity `/private/tmp`. The correction
normalizes only that lookup; bytes, SHA, Git blob, and roundtrip remain
checked by the same assertions. The attempt's original sources, diagnostics, and payloads
are preserved with their distinct outcome.

[Copy publication](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-lifecycle/processes/publication/report.lisp)
`4000911736-command-27429-0` ends OK, STABLE, exit 0, after checking
originals and copies. The [final check](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-lifecycle/processes/final-verification/report.lisp)
`4000911991-command-38401-0` passes links and preservation: OK, STABLE, exit 0,
154,602746 seconds, 370 Markdown files and 2748 links without breakage;
84 catalogs, 18868 preserved files, 535386346 bytes. These counts
belong to the process before its closing copies were added.
A new manifest preserves those records and this document's concluding version
without replacing previous raw outputs or manifests.
