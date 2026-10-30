<a id="verifica-della-presa-governata-dal-pool"></a>

# Verification of pool-governed acquisition

C3 qualification follows [contract](pool-worker-claim.md),
[preregistered method](pool-worker-claim-metodo.md), and
[independent review](pool-worker-claim-revisione.md).
Frozen copy starts from `900fa93d9e14a252e6a2b5a009d19728b2de34af`
and preserves ten increment files, with identities distinct from final documents
added afterward. Originals are in the
[campaign catalog](https://github.com/gpicchiarelli/ArcDocDB/tree/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-claim/).

<a id="processi-congelati"></a>

## Frozen processes

| Process | Record | Outcome |
|---|---|---|
| Strict compilation and C4 self-test | [4000913361-command-73795-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-claim/processes/selftest/report.lisp) | OK, STABLE, exit 0 |
| Coverage and scheduler suite | [4000913361-command-73794-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-claim/processes/coverage/report.lisp) | OK, STABLE, exit 0 |
| Three normal-path campaigns | [4000913399-command-74843-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-claim/processes/benchmark/report.lisp) | OK, STABLE, exit 0 |
| Strict native/HTML reader and self-test | [4000913465-command-76699-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-claim/processes/coverage-reader/report.lisp) | OK, STABLE, exit 0 |
| Full repository check | [4000913331-command-73208-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-claim/processes/check-core/report.lisp) | OK, STABLE, exit 0 |

Scheduler suite passes **53 named tests: 41 existing and 12 new**.
Checks actually populated ready queue, growth/retirement on separate owners,
no polling while inactive, every non-IDLE state, inconsistent IDLE,
invalid pool words, and CAS conflict. Confirms late request
allows the already authorized single claim to complete and applies at
next IDLE. Bridge/full recycling retain leases, debt, and
next-writer routing. Boundary FI is quiescent/declared;
late command is injected interleaving, not observed random race.

Tools compile without warnings/style-warnings. Self-tests check
separate oracles for all four new-API values, detect
16777472 deliberate allocation bytes and wrong sinks, distinguish below-resolution
clock, and preserve partial raw data/existing destinations.
Original reader reused unchanged with explicit new scope;
its negative cases precede product measurement.

Full check passes **1109 named product tests, two smoke
tests, and four linter fixtures**, plus lint, traceability, links,
tool self-tests, preservation, and ten spikes. Duration
237.501985 seconds. The 1115 `ok`-prefixed output records include
four linter fixtures; they are not called 1115 product tests.

<a id="copertura"></a>

## Coverage

Native SB-COVER data and HTML agree: **44/44 expressions and 4/4 branches,
100%**, across all `src/scheduler/pool-claim.lisp` and package. No
exclusion or missing path. New file has 43/43 expressions
and 4/4 branches; package 1/1 expressions and no branch. Exact
comparison exceeds C3 95% gate; no MC/DC inference.

Original native output occupies 2205402 bytes; index and two HTML pages
remain original. The [inventory](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-claim/development-manifest.lisp)
identifies sources and lossless bundles. [Library audit](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-claim/data/coverage-audit/coverage-audit.lisp)
and [new-scope audit](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-claim/data/claim-coverage-audit/coverage-claim-audit.lisp)
preserve same counts/paths with distinct metadata.
Delegated C1 files do not contribute to new-component denominators.

<a id="misura-locale"></a>

## Local measurement

Three separate campaigns, each five replicates of 4096 cycles and 128 warmup
cycles per replicate: **20480 measured cycles per campaign**, fifteen samples
overall in [sensor report](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-claim/data/benchmark/report.lisp).
Factory, API resolution, and full GC precede clock.

EMPTY makes four acquisitions on four empty shards, checking rotation
1/2/3/0 and unchanged action. INACTIVE makes four acquisitions preserving
cursor 2. SWITCH makes six acquisitions: retirement, repeated acknowledgment,
activation, and four total EMPTYs with rotation 1/2/3/0. Two monotonic generations
per cycle, no reset. SWITCH fixture serializes owner/coordinator
and publishes private requests only after preceding acknowledgment; it does not
qualify concurrent coordinator.

| Replicate | EMPTY ticks | INACTIVE ticks | SWITCH ticks | Heap for each campaign |
|---|---:|---:|---:|---:|
| 0 | 4394 | 892 | 5328 | 0 |
| 1 | 4504 | 912 | 5355 | 0 |
| 2 | 4476 | 899 | 5317 | 0 |
| 3 | 4403 | 1069 | 5345 | 0 |
| 4 | 4433 | 901 | 5300 | 0 |

SBCL 2.6.9, ARM64, Apple M4, Darwin 27.0.0, safety 3, clock 1000000
units per second. Every sample completes 4096 cycles with observed
zero heap and exact sink: 8435712 EMPTY, 8468480 INACTIVE, 8574976 SWITCH.
External load, including other verification processes, uncontrolled.
Ticks define neither threshold, tuning, nor throughput conclusion.
Observed zero heap does not demonstrate universal nonallocation.

<a id="conservazione-e-limiti"></a>

## Preservation and limits

No formal failed attempts among five listed frozen processes.
First test-development runner failed at relative cache
configuration before compilation; runner/output remain development
diagnostics without promotion to passed test. Test versions and other
preliminary raw data stay distinct from frozen originals.

Preservation reuses verified C4 writers and explicitly declares
generic manifest families. Component manifest identifies
claim APIs/sources; legacy formats broaden no product scope.
Only intermediate FASLs excluded from UTF-8 development sources.

Gate qualifies new logical acquisition. It changes no C1 sources, payloads,
leases, or durable protocols; it implements neither complete dispatcher, startup, park/wake,
sensors, Archivio coordination, message admission, nor physical shutdown.
ACK retention if a subsequent claim fails is verified statically
in code order without dedicated FI for precisely that case in twelve tests.
REQ-THR-001 and QA-12/19 remain open for complete engine.

<a id="integrazione-su-main"></a>

## Integration on main

Commit `3751494703a848cd911cc1c13c11f0692bef4a38` was integrated with
`061e638200f0d97fc2443c7dec38d4362ef274e1`, containing CONTROL checkpoint
preparation. Merge `e1ad69b1bae70fa8a2a0def075024206ff20391c`
preserves qualification gate, package, twelve tests, and sensor byte for byte.
ASDF integrates new modules; documentation index/changelog retain
both additions.

[Integrated check](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-claim/processes/integrated-build/report.lisp)
`4000913736-command-84415-0` passes strict compilation, 1109 named tests
and two smokes, lint, and traceability: OK, STABLE, exit 0. Coverage,
benchmark, or ten spikes of frozen copy are not retroactively
attributed to merge. Final sources preserved separately.

<a id="chiusura-della-conservazione"></a>

## Preservation closure

[Copy publication](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-claim/processes/publication/report.lisp)
`4000913849-command-86077-0` ends OK, STABLE, exit 0 after original/copy
checks. [Final check](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-claim/processes/final-verification/report.lisp)
`4000914088-command-91880-0` passes links/preservation: OK, STABLE, exit 0,
152.397584 seconds, 376 Markdown files and 2786 unbroken links; 86 catalogs,
18938 preserved files and 542334642 bytes. Counts precede addition
of copies of the process itself. New manifest preserves these two
records and this document's final version without replacing
previous raw data/manifests.
