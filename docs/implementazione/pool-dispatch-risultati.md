<a id="verifica-del-collegamento-poolserie"></a>

# Pool/Serie binding verification

Qualification follows the [contract](pool-dispatch.md),
[preregistered method](pool-dispatch-metodo.md), and
[independent C3 reading](pool-dispatch-revisione.md).
Frozen base `14fd7738c216e3a0bd3ce9612576b9b57d648f74`, thirteen
increment sources and fourteen helpers copied byte for byte.
Originals are in the [campaign catalog](https://github.com/gpicchiarelli/ArcDocDB/tree/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-dispatch/).
The namespace date follows preregistration; records retain their original
times and are not backdated.

<a id="processi"></a>

## Processes

| Process | Original record | Outcome |
|---|---|---|
| Publication adapter, positive and negative fixtures | [4000917478-command-65255-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-dispatch/processes/publisher-selftest/report.lisp) | OK, STABLE, exit 0 |
| Strict native/HTML reader and self-test | [4000917499-command-65649-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-dispatch/processes/coverage-reader/report.lisp) | OK, STABLE, exit 0 |
| Strict sensor and self-test | [4000917499-command-65650-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-dispatch/processes/selftest/report.lisp) | OK, STABLE, exit 0 |
| Coverage and complete scheduler | [4000917538-command-66469-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-dispatch/processes/coverage/report.lisp) | OK, STABLE, exit 0 |
| Three local campaigns | [4000917578-command-67114-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-dispatch/processes/benchmark/report.lisp) | OK, STABLE, exit 0 |
| Frozen full check | [4000917476-command-65223-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-dispatch/processes/check-core/report.lisp) | OK, STABLE, exit 0 |
| Build, tests, lint, and trace after integration | [4000917560-command-66775-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-dispatch/processes/integrated-build/report.lisp) | OK, STABLE, exit 0 |

The **14 new tests** pass; complete scheduler **67/67**. They use two
real writers with different ordinals, routing without implicit begin and explicit dual
lease, acknowledged batches, and bridge end. They check binding and owner
before ACK/claim, no routing for INACTIVE/EMPTY/BUSY, pending retirement,
writer-busy with CAS guard and obligation retry, full recycling A→B, and routing
of the new writer. CLAIMED lookup ignores deliberately inconsistent
pool words, while the IDLE gate retains rejection.

The activation-then-invalid-routing test uses a real claim:
ACK confirmed, writer/home and obligation retained in FAULTED, EQ cause and
controllers unchanged. Activation request is quiescent coordinator
FI, not a random race. Other declared FI checks preimage
on corrupt phases/debts, private bindings, and inconsistent writer/status returns;
function sentinels are restored. C1 protocol qualification is not inferred
from the fourteen new tests alone.

The frozen full check passes **1148 named product tests,
two smoke tests, and four linter fixtures**, plus lint, trace, links,
tool self-tests, retention, and ten spikes. It lasts 241.266408
seconds; 1154 `ok` markers include the four fixtures, without calling them
product tests. Compilation without warning/style-warning; stderr contains
compiler notes, retained in the original.

<a id="copertura"></a>

## Coverage

Native SB-COVER data and five original HTML pages agree on the entire
scope, **110/114 expressions (96.49%) and 10/10 native branches (100%)**.
The preregistered 95% C3 gate is passed, with **no manual exclusions**.
Original native data occupies 2306672 bytes; the [library audit](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-dispatch/data/coverage-audit/coverage-audit.lisp)
and [dispatch audit](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-dispatch/data/dispatch-coverage-audit/coverage-dispatch-audit.lisp)
retain counts and missing paths.

| File | Expressions | Native branches |
|---|---:|---:|
| `package.lisp` | 1/1 | 0/0 |
| `types.lisp` | 40/40 | 8/8 |
| `build.lisp` | 24/24 | 2/2 |
| `claim.lisp` | 45/49 | 0/0 |

The four missing items are solely in `otherwise` of `claim.lisp:31`, rejecting
a status outside the gate's ftype domain. They remain in the denominator's
114 elements. Native paths 31–34: `(1 4 3 3 4 3)`,
`(1 1 4 3 3 4 3)`, `(2 1 4 3 3 4 3)`, `(3 1 4 3 3 4 3)`.
The zero branch denominator for `claim.lisp` is the one emitted by SBCL;
it does not mean absence of source decisions. No MC/DC inference,
no coverage of C1 delegates in the dispatcher denominator.

<a id="misura-locale"></a>

## Local measurement

Three separate campaigns, each with five replicates of 4096 cycles and
128 warmup: **20480 measured cycles per campaign**, fifteen samples in the
[original report](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-dispatch/data/benchmark/report.lisp).
Factory, API resolution, and GC precede timing. Four calls per cycle:
EMPTY rotates 1/2/3/0; INACTIVE retains cursor 2; ROUTE-CURRENT selects
the same IDLE link of a stable CLAIMED four times.
The last includes scalar phase/identity oracles: initial claim and final
drain are outside timing, no begin, lease, or pop in measurement.

| Replicate | EMPTY ticks | INACTIVE ticks | ROUTE-CURRENT ticks | Heap per campaign |
|---|---:|---:|---:|---:|
| 0 | 5110 | 1505 | 2021 | 0 |
| 1 | 5896 | 1057 | 2307 | 0 |
| 2 | 6652 | 1226 | 2290 | 0 |
| 3 | 5518 | 1676 | 2167 | 0 |
| 4 | 7346 | 1377 | 2175 | 0 |

SBCL 2.6.9, ARM64, Apple M4, Darwin 27.0.0, safety 3, clock 1000000
units/s. Each sample completes 4096 cycles, observed zero heap, and exact
sink: 8435712 EMPTY, 8468480 INACTIVE, 8501248 ROUTE-CURRENT.
Positive control detects 16777472 deliberate bytes; self-tests
detect wrong sinks, all mismatched returns, sub-resolution clock,
invalid CLI, and loss of partial raw data or preexisting destinations.

External load and other verification processes are uncontrolled.
No timing threshold, tuning, or engine-throughput conclusion.
Observed zero heap does not prove universal absence of allocations, and
measurement does not include a new claim with an actually queued writer.

<a id="sviluppo-integrazione-e-limiti"></a>

## Development, integration, and limits

No formal attempt listed above failed. The first two development test
runners failed because of IGNORE declarations in the fixture macro;
the third had FI debts incompatible with C1 routing phases. The fourth
passes 13 tests; the fifth passes the final 14. All logs and snapshots
remain development diagnostics, distinct from frozen qualification.
The preliminary sensor self-test failed while loading that first
fixture with warnings; the second passed. Development errors are not
promoted to passed tests. Intermediate FASLs are excluded from development
UTF-8 bundles; original native/HTML data remains retained.

Commit `bfbf687929e1f28f67ddd1a21dbab5334b8e1a67` was integrated
with `06cc1354cd6843c40da0570e5314fef7cf68a667`, which adds the
GET ACTIVE suite. Merge `8df3608c63c85f9d72b5c22d8d0fce67020290e5`
retains byte for byte four dispatcher sources, tests, and sensor.
Changelog and documentation index retain both additions.
Integrated check passes **1176 named tests and two smoke tests**,
strict compilation, 198 sources without lint violations, and trace without errors.
It lasts 34.333722 seconds. The 28 GET ACTIVE tests added in the merge explain
the difference from the frozen set; coverage and ten spikes are not
retroactively attributed to the merge.

Retention reuses verified C4 writers, with a new namespace and manifest
specific to the three APIs and four sources. Legacy generic families
remain declared and do not broaden scope. Publication adapter
passes one positive and five negative fixtures, for missing runtime sources
and altered fingerprint, without publishing those test data.

Server loops, physical startup/shutdown, park/wake, real
sensors, admission, payload execution, and Archivio coordination are not implemented.
C1 and durable protocols remain unchanged; REQ-THR-001 and whole-engine
gates remain open.

<a id="ultima-integrazione-e-chiusura"></a>

## Final integration and closure

The [original publication](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-dispatch/processes/publication/report.lisp)
`4000917815-command-71100-0` ends OK, STABLE, exit 0 after 211.37401
seconds, checking sources and copies without modifying them. Meanwhile main
acquired `e599703a6d840f3788e642042facf3ea71d8d32a`, with I/O
namespace and CONTROL publication. Final merge
`f26a2b2b0220c061e80d93f5e3e2d577b98e7463` retains byte for byte the
four dispatch sources, fourteen tests, and sensor. ASDF retains
both new module sets; changelog and index lose no additions.

The [final integration check](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-dispatch/processes/final-integrated-build/report.lisp)
`4000918109-command-76942-0` passes strict compilation, 1176 named tests
and two smoke tests, lint on 202 sources without violations, and trace without errors:
OK, STABLE, exit 0, 33.961707 seconds. It checks loading and fixture compatibility
with the extended backend, without qualifying the new CONTROL
or rename APIs. Coverage and measurements remain those of the declared frozen set.

The [final link and retention check](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-worker-dispatch/processes/final-verification/report.lisp)
`4000918109-command-76941-0` ends OK, STABLE, exit 0: 155.55193 seconds,
394 Markdown files, 2857 links without breakage, 95 catalogs, 21743 retained files, and
667652832 bytes. Counts precede copying these three processes and
adding this section. Closure retains original reports/retentions,
final sources of this increment, and final document version
in new bundles; no previous raw data is replaced.
