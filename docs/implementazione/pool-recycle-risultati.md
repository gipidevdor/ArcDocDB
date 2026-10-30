<a id="verifica-del-ricircolo-poolserie"></a>

# Verification of pool/Serie recycling

Qualification follows [contract](pool-recycle.md),
[preregistered method](pool-recycle-metodo.md), and
[independent C3 review](pool-recycle-revisione.md).
Frozen base `a5715a1aa0b2571d650d1b794e9bb7b7324e951e`, fourteen
sources and fourteen helpers copied byte for byte. Originals are in the
[campaign catalog](https://github.com/gpicchiarelli/ArcDocDB/tree/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-pool-worker-recycle/).

<a id="processi-e-prove"></a>

## Processes and tests

| Process | Original record | Outcome |
|---|---|---|
| Publication adapter and self-test | [4000984350-command-38941-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-pool-worker-recycle/processes/publisher-selftest/report.lisp) | OK, STABLE, exit 0 |
| Strict native/HTML reader | [4000984374-command-39216-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-pool-worker-recycle/processes/coverage-reader/report.lisp) | OK, STABLE, exit 0 |
| Strict sensor and self-test | [4000984374-command-39217-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-pool-worker-recycle/processes/selftest/report.lisp) | OK, STABLE, exit 0 |
| Coverage and complete scheduler | [4000984374-command-39218-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-pool-worker-recycle/processes/coverage/report.lisp) | OK, STABLE, exit 0 |
| ROOM/FULL campaigns | [4000984410-command-39982-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-pool-worker-recycle/processes/benchmark/report.lisp) | OK, STABLE, exit 0 |
| Frozen full check | [4000984350-command-38940-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-pool-worker-recycle/processes/check-core/report.lisp) | OK, STABLE, exit 0 |
| Compilation/test/lint/trace after integration | [4000984849-command-45285-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-pool-worker-recycle/processes/integrated-build/report.lisp) | OK, STABLE, exit 0 |

**13 new tests** pass, complete scheduler **80/80**. They verify one
ready operation, FIFO publication without second acquisition or routing,
count distinct from cursor, full A→B exchange, and B link still IDLE.
Subsequent bridge is explicit. Inactive port, pending retirement, and inconsistent
lifecycle words do not prevent recycling; ACK occurs only
at next explicit IDLE acquisition.

Actually held ready guard, owner on separate thread, binding across
different contexts, and consistent phases have preimage and first cause retained.
A routing error after full is checked after actual exchange:
old writer in ring, new reference/home in FAULTED, controller and
Serie lease intact. No rollback inferred from exception. Ready corruption
within INDEX type checks original C1 diagnosis.

Full check passes **1277 named product tests, two smokes,
and four linter fixtures**, plus lint, trace, links, C4 self-tests,
preservation, and ten spikes. The 1283 `ok` markers include four fixtures,
which are not called product tests. Duration 258.237184 seconds, with
856 stable sources. Compilation without warnings/style-warnings; stderr
preserves 706755 compiler-note characters.

<a id="guardia-di-stato-e-sviluppo"></a>

## State guard and development

Initial probe, with interposed delegate violating its ftype,
actually returned `(NIL :UNKNOWN 1)`: SBCL removed the defensive branch
assuming declared domain valid. Original outcome stays preserved;
it is not transformed into rejection evidence.

Qualified version introduces a separate guard with T argument and
NOTINLINE. The thirteenth test forces six out-of-contract statuses and actually
observes `invariant-violation :pool-dispatcher-state` before routing or
gate, with one interposed call and unchanged preimage. Preexisting first
FAULTED cause remains EQ. This is quiescent boundary FI, not a
nominal C1 return or concurrent stress; functions are restored.

First two test-development attempts failed for parentheses and a
constant-type warning; subsequent attempts pass twelve preliminary
and thirteen final tests. First two sensor attempts failed before
measurement due to a still-being-written test and a cleanup-parameter
typo; third passes. Snapshots/raw data remain distinct from qualification.
None of seven formal processes listed above failed.

Three local Git references with invalid names were preserved in
quarantine outside active refs, with bytes and manifest, before freeze.
Fetch and synchronization then succeeded. No valid branches were deleted
by that repair; diagnostics remain development, not C3 evidence.

<a id="copertura"></a>

## Coverage

Native SB-COVER and six original HTML files agree across entire five-file
package: **155/163 expressions (95.092%) and 10/10 native branches (100%)**.
C3 95% gate passed without manual exclusions. Original native output
occupies 2541351 bytes. [Library audit](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-pool-worker-recycle/data/coverage-audit/coverage-audit.lisp)
and [recycling audit](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-pool-worker-recycle/data/recycle-coverage-audit/coverage-dispatch-audit.lisp)
preserve counts and all eight missing paths.

| File | Expressions | Native branches | Missing |
|---|---:|---:|---:|
| `package.lisp` | 1/1 | 0/0 | 0 |
| `types.lisp` | 40/40 | 8/8 | 0 |
| `build.lisp` | 24/24 | 2/2 | 0 |
| `claim.lisp` | 45/49 | 0/0 | 4 |
| `recycle.lisp` | 45/49 | 0/0 | 4 |

Missing forms are final `otherwise` branches in both adapters: in claim, status outside
gate ftype; in recycle, status already validated by separate guard.
They remain in denominator. For recycle, native indices are 39–42, paths
`(1 4 2 3 3 4 6)`, `(1 1 4 2 3 3 4 6)`,
`(2 1 4 2 3 3 4 6)`, `(3 1 4 2 3 3 4 6)`; audit also preserves four
claim paths. Operational guard is exercised with valid/invalid returns.
Zero native branches in case files does not mean no source
decisions. No MC/DC inference or C1 delegate denominator.

<a id="misure-locali"></a>

## Local measurements

Two campaigns, five replicates of 4096 cycles and 128 warmup each, fresh fixture
per replicate: **20480 cycles per campaign**, ten complete samples in the
[original report](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-pool-worker-recycle/data/benchmark/report.lisp).
Prepopulated writers, preallocated queues/capabilities, quantum one. Factory,
API resolution, GC, and bounded public drain remain outside clock.

ROOM includes published recycling, explicit acquisition, execution
begin/pop/ack/end. FULL alternates both links after exchange and includes same
execution slice. Links stay IDLE: no bridge begin or Serie
lease in clock. C1 protocol and scalar oracles are part of cost;
time is not attributed to adapter alone. No private reset.

| Replicate | ROOM ticks | FULL ticks | Heap per campaign |
|---|---:|---:|---:|
| 0 | 4146 | 3393 | 0 |
| 1 | 4123 | 3392 | 0 |
| 2 | 4141 | 3384 | 0 |
| 3 | 4108 | 3370 | 0 |
| 4 | 4051 | 3330 | 0 |

SBCL 2.6.9, ARM64, Apple M4, Darwin 27.0.0, safety 3, and clock 1000000
units/s. Every sample completes 4096 cycles, observed zero heap, and exact
sink: 8513536 ROOM, 8562688 FULL. Positive control detects 16777472
deliberate bytes; self-tests detect differing results, wrong sink, below-resolution
clock, invalid CLI, and loss of partial raw data or existing
destinations. Neither concurrent coordinator nor Archivio shutdown
is qualified. External load uncontrolled; no threshold, tuning, or
throughput conclusion; zero heap does not prove universal nonallocation.

<a id="integrazione-e-conservazione"></a>

## Integration and preservation

Commit `7a9614151208e75cf518b2785d47c2f6cc420d8c` was integrated
with `2278ad5b6ab5b796d7fba4be497f344ead476ebe`, extending CONTROL/recovery.
Merge `a07a66e322c032a0374e354632a42d3cc6e2531e` preserves byte for byte
five frozen dispatch sources, tests, and sensor; ASDF, changelog,
and index retain both additions.

Integrated check passes strict compilation, **1277 named tests and
two smokes**, lint on 210 files without violations, and trace without errors:
37.932058 seconds, 861 stable sources. It does not qualify new recovery APIs
or retroactively attribute freeze coverage/ten spikes to merge.

Preservation reuses verified C4 writers with new namespace and
manifest specific to extended dispatcher's four APIs. Generic legacy formats
remain declared and do not broaden scope. New adapter passes one
positive and six negative fixtures, for every missing runtime source and
altered fingerprint. Only intermediate FASLs are excluded from UTF-8
development sources; native output, HTML, and original raw data remain preserved.

[Original publication](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-pool-worker-recycle/processes/publication/report.lisp)
passes in 254.541876 seconds, with 862 stable sources. Subsequent
[link/archive verification](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-pool-worker-recycle/processes/final-verification/report.lisp)
passes in 168.966589 seconds: 409 files, 2933 unbroken links, 100 catalogs,
3174 evidence references, 25311 files, and 731948502 preserved bytes. Both
records retain OK, STABLE, and exit 0; counts precede closure
copies and two links added in this paragraph. Closure manifest
preserves both original processes, final document, and integrated
sources; previous evidence is not rewritten. Final diagnostic
summarizer distinguishes stderr characters and UTF-8 bytes: 706755 and
706765 in frozen check; previous version remains preserved.

Server loop, payload application, admission,
real sensors, park/wake, physical startup/shutdown, and Archivio coordination are not implemented.
C1/durable protocols remain unchanged; complete-engine gates stay open.
