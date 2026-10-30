<a id="verifica-del-passo-poolserie"></a>

# Pool/Serie step verification

Qualification follows the [contract](pool-step.md),
[preregistered method](pool-step-metodo.md), and
[independent C3 review](pool-step-revisione.md). Frozen base
`5be241d8f295e3c82df06e75c9b12e0bf75eb202`: sixteen sources and fourteen
helpers copied byte for byte; eighteen review fingerprints match
in checkout and clone. Originals in the
[campaign catalog](https://github.com/gpicchiarelli/ArcDocDB/tree/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-worker-step/).

<a id="processi-e-prove"></a>

## Processes and tests

| Process | Original record | Outcome |
|---|---|---|
| publisher-selftest | [4001073020-command-38578-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-worker-step/processes/publisher-selftest/report.lisp) | OK, STABLE, exit 0 |
| coverage-reader | [4001073020-command-38579-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-worker-step/processes/coverage-reader/report.lisp) | OK, STABLE, exit 0 |
| selftest | [4001073020-command-38582-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-worker-step/processes/selftest/report.lisp) | OK, STABLE, exit 0 |
| coverage | [4001073032-command-39128-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-worker-step/processes/coverage/report.lisp) | OK, STABLE, exit 0 |
| benchmark | [4001073141-command-45181-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-worker-step/processes/benchmark/report.lisp) | OK, STABLE, exit 0 |
| Frozen check-core | [4001073020-command-38577-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-worker-step/processes/check-core/report.lisp) | OK, STABLE, exit 0 |
| Integrated compilation/tests/lint/trace | [4001073480-command-67324-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-worker-step/processes/integrated-build/report.lisp) | OK, STABLE, exit 0 |

**16 new tests** pass, complete scheduler **110/110**. Counters
forward to real APIs and check a single operational entry point: IDLE
claim, CLAIMED current, or RESCHEDULE recycle. The five results distinguish
cursor, count, and absence of transfer; NIL for lifecycle outside claim
is not reinterpreted as observation of an unchanged command.

Activation and retirement precede the new claim. A real CLAIMED from adoption,
claim, or full remains completable even with inactive gate, pending retirement,
or inconsistent commands; no implicit gate, ACK, begin, pop, or end.
Room preserves FIFO, distinguishes count 2 from cursor 0, and ends the step without
a second claim. Full selects B, leaves A in the ring, and then allows current
without further transfers. Only the next IDLE step applies retirement.

An actually occupied CAS guard distinguishes the claim's BUSY return from the
recycling `:ready-queue-busy` condition, retaining the obligation.
Owner on a different thread and inconsistent binding precede getters and entry points.
RUNNING/BATCH/FINISHING and FAULTED are rejected with zero operations;
debts, leases, and first cause remain intact. No positive overlap or
stress is inferred from the negative owner test.

Routing failure after full retains the completed swap and EQ original
C1 cause; after claim it retains the already successful activation ACK.
Quiescent getter FI beyond its ftype is actually rejected by
case T/NOTINLINE, even with a preexisting FAULTED cause. Six out-of-domain
values exercise C3 defense; they are not nominal C1 returns. No new
handler, rollback, cleanup, fault field, or second mutable state.

The frozen full check passes **1544 named product tests,
two smoke tests, and four linter fixtures**, plus lint, trace, links,
C4 self-tests, retention, and ten spikes. The 1550 `ok` markers include
fixtures, which are not called product tests. Lint on 225 files without
violations; trace on 121 requirements, 65 invariants, 13 FI scenarios, and 52 ADR,
without errors. The process lasts 435.846382 seconds with 928 stable sources.
Compilation without warning/style-warning; stderr retains 1034758
characters of compiler notes, equivalent to 1034772 UTF-8 bytes.

The preexisting archive contains 114 catalogs, 3393 references, 40699 files,
and 1072092045 retained bytes, before the new step namespace. Freeze
links number 3075 across 451 files, none broken. None of the seven
formal processes in the table failed.

<a id="copertura"></a>

## Coverage

Native SB-COVER and eight original HTML files agree on the entire seven-file
package: **227/235 expressions (96.596%) and 10/10 native branches (100%)**,
without exclusions. New `step.lisp` covers **51/51 expressions**, none
missing. Original native data occupies 2997008 bytes. The [library audit](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-worker-step/data/coverage-audit/coverage-audit.lisp)
and [component audit](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-worker-step/data/step-coverage-audit/coverage-dispatch-audit.lisp)
retain denominators, native/HTML comparison, and all missing paths.

| File | Expressions | Native branches | Missing |
|---|---:|---:|---:|
| `package.lisp` | 1/1 | 0/0 | 0 |
| `types.lisp` | 40/40 | 8/8 | 0 |
| `build.lisp` | 24/24 | 2/2 | 0 |
| `claim.lisp` | 45/49 | 0/0 | 4 |
| `recycle.lisp` | 45/49 | 0/0 | 4 |
| `begin.lisp` | 21/21 | 0/0 | 0 |
| `step.lisp` | 51/51 | 0/0 | 0 |

The eight missing items from the two previous adapters remain in the denominator.
Claim: indices 31–34, paths `(1 4 3 3 4 3)`, `(1 1 4 3 3 4 3)`,
`(2 1 4 3 3 4 3)`, `(3 1 4 3 3 4 3)`. Recycle: indices 39–42,
paths `(1 4 2 3 3 4 6)`, `(1 1 4 2 3 3 4 6)`,
`(2 1 4 2 3 3 4 6)`, `(3 1 4 2 3 3 4 6)`.
These are final otherwise branches eliminable by the gate domain or preceding
guard; they are not manually excluded. The new step's unexpected final
branch is actually exercised. No MC/DC inference or inherited
C1 denominator; zero native branch probes does not mean
absence of source decisions.

<a id="misure-locali"></a>

## Local measurements

The [original report](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-worker-step/data/benchmark/report.lisp)
retains two campaigns of five replicates: **4096 cycles and 128 warmup** per
replicate, 20480 cycles per campaign, and four calls per cycle. All
ten samples complete expected cycles with observed zero heap and exact
sink: 8435712 EMPTY, 8501248 CURRENT-INACTIVE.

| Replicate | EMPTY ticks | CURRENT-INACTIVE ticks | Heap per campaign |
|---|---:|---:|---:|
| 0 | 9224 | 3529 | 0 |
| 1 | 9866 | 3680 | 0 |
| 2 | 8655 | 5305 | 0 |
| 3 | 8957 | 6781 | 0 |
| 4 | 8282 | 4345 | 0 |

SBCL 2.6.9, ARM64, Darwin 27.0.0, safety 3, and clock 1000000 units/s.

Each cycle performs four steps and checks all five results.
EMPTY rotates cursor 1/2/3/0 over four empty shards with active pool.
CURRENT-INACTIVE selects a real CLAIMED four times with inactive
gate, checking identity, phase, and cursor 1. Each replicate uses a
new fixture. Factory, API lookup, initial claim, GC, and final public
drain of only the sentinel payload remain outside timing; no private reset,
begin, or active lease in the measured slice.

Time includes delegates and oracles, without attribution to the adapter
alone. Uncontrolled external load, no threshold or tuning; observed zero
heap does not prove universal nonallocation. RECYCLE,
CLOSING, contention, IDLE claim with real work, and concurrent coordination are not measured.
INACTIVE/IDLE is only in self-test, with a synthetic RECYCLE oracle.

Self-tests check five mismatched values, wrong sink, sub-resolution
clock, 16777472 deliberate bytes detected, CLI, preexisting
destinations, and partial raw data. The reader checks scope and denominators of
seven files; publication checks one positive and eight negative fixtures, for
each missing runtime source and altered fingerprint.

<a id="integrazione-e-conservazione"></a>

## Integration and retention

Product commit `c5550332911aaf1c2b7d36161d8997282a8b3974` contains the same
qualified bytes. No execution, series, or scheduler source changed.
The new C3 policy delegates without adding checks after transfer.
The previous closed bridge remains a caller precondition, without global
link scanning or proof of quiescence.

Product is integrated with `2cf3c38d297cf513df1d7c6312613099d79ad213`, which
adds read-only multiseries log recovery. Merge
`6ede7dbf6ab44660b7294047df45351275a71c48` retains byte for byte the seven
dispatch sources, tests, sensor, and delegated freeze barriers;
ASDF, index, and changelog retain both additions.

Integrated verification passes strict compilation, 1544 named tests and
two smoke tests, lint on 231 files, and trace without errors: 44.130150 seconds with
936 stable sources. It does not qualify the new recovery-archive C1 APIs
or retroactively attribute coverage or ten spikes to the new module.

Development evidence remains separate: sixteen new tests and scheduler
passed on first attempt; strict product compilation and lint/trace
passed; reader and sensor checked. The first sensor variant,
compiled without running campaigns, reused the fixture; the second
uses five fixtures per campaign, as preregistered, and is the
qualified one. Previous snapshots and raw data remain retained. Only intermediate
FASLs are excluded from development UTF-8 sources.

Formal processes retain argv, outputs, exit, and initial/final fingerprints.
C4 writers and legacy generic formats are reused with a specific manifest,
without broadening scope. No durable protocol changes. Message admission,
payloads, sensors, park/wake, physical startup/shutdown, and Archivio
coordination remain open; no whole-engine gate closes.

The [original publication](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-worker-step/processes/publication/report.lisp)
passes in 491.607474 seconds and the subsequent
[link and archive check](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-pool-worker-step/processes/final-verification/report.lisp)
in 265.611008 seconds. Both retain OK, STABLE, and exit 0, with 936
stable sources and empty stderr. Verification checks 454 files and 3102 links,
none broken; 116 catalogs, 3429 references, 40772 files, and 1078188211 retained
bytes. Counts precede closure copies and the two links added
here. The closure manifest retains these two original processes,
the final document, and integrated sources; earlier tests are not
rewritten.
