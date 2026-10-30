<a id="verifica-del-registro-snapshot-e-del-collegamento-csn"></a>

# Snapshot-register and CSN-connection verification

<a id="ambito-preregistrato"></a>

## Preregistered scope

Campaign checks existing `arcdocdb.mvcc` APIs using same
Archivio's canonical `arcdocdb.csn` register. Planning began
October 9 on main `edb043b`; October 11 resumption integrates
main `5768e02` without snapshot/CSN changes.
[Method](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-snapshot-verification/metodo.lisp)
frozen before recorded executions, unchanged:
`:planned`/`:not-collected` describe that moment before tests.
Observed October 11 outcomes below/in
[campaign evidence](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-snapshot-verification/README.md).
No product API/format/protocol changes.

Scope includes registration, frontier capture, activation,
verification, termination, bounded expiration, retention threshold. Depends on
[snapshot-register](registro-snapshot.md)/
[CSN-connection](snapshot-csn.md) contracts. Existing CSN-register tests
alone do not demonstrate connection.

Affected requirements REQ-MVC-003, REQ-MVC-004, REQ-MVC-005,
REQ-MVC-007, REQ-CON-004, REQ-AFF-004, REQ-AFF-008; invariants
INV-M1, INV-M2, INV-M4, INV-P5, INV-A8. New scope does not declare
requirements verified for whole engine.

<a id="decisioni-e-casi-attesi"></a>

## Decisions and expected cases

| Decision | Distinctions to exercise |
|---|---|
| CSN-S01 | `H0 <= H1` and `H1 <= s` separately; consistent frontiers, u32 carry, maximum u64. |
| CSN-S02 | Successful capture, `:csn-busy`, other `resource-exhausted`, CSN fault, nonlocal exit. |
| CSN-S03 | Announcement with/without previous pins; writer-observed retention; revocation without identity/credit consumption. |
| CSN-S04 | Body returning `NIL`, contention, recursion, mutex release after nonlocal exit. |
| CSN-S05 | Terminal/repeated invalidation; fault during capture/publication; snapshot-reader rejection after fault. |
| Lifecycle | Empty Archivio, immediately active/waiting snapshot, commits resolved out of order, activation only at `H >= s`. |
| Resources/time | Configuration, capacity, u64 generations/deadlines, exact waiting/duration deadlines, timer budget. |
| Identity/results | Context/slot reuse, old-generation event, buffer intact on rejection, idempotent termination. |
| Retention | Minimum active/waiting pin, recomputation after termination/expiry, bounded visit, timer cursor. |

Core functional case preserves original tokens of two commits:
first stays pending, second resolved. Snapshot captures
latest CSN but waits for horizon. Resolving first allows
activation; pin retains threshold until termination/expiry
removes it. Oracle checks public values/rejections without replicating
product code.

Fixtures use explicit time/small capacities. Private states
prepared only for boundaries unreachable through short sequence,
such as u64 generation exhaustion, or declared fault.
Frozen method lists 28 lifecycle cases, 15 capture cases, 10
targeted mutants. Final executions passed all 43 dedicated cases,
detected 10 mutants at runtime.

Suites `tests/mvcc/support.lisp`, `lifecycle.lisp`, `capture.lisp`:
package `arcdocdb.mvcc.tests`, register `*mvcc-tests*`, function `run`.
Runner `tools/snapshot-mutation.lisp` selects targeted test using exact
registered name without requirement-prefix filters.

<a id="errori-da-distinguere"></a>

## Errors to distinguish

| Condition | Expected reasons on corresponding path |
|---|---|
| `invalid-argument` | `:snapshot-registry-configuration`, `:snapshot-context-pinned`, `:snapshot-not-ready`, `:snapshot-sweep-budget`, `:snapshot-result-range`, `:snapshot-commit-zero`. |
| `resource-exhausted` | `:snapshot-capacity`, `:snapshot-generation-exhausted`, `:snapshot-deadline-overflow`, `:snapshot-wait-timeout`. |
| Recoverable contention | `resource-exhausted` with `:snapshot-busy`/`:csn-busy`; no internal wait/retry. |
| `snapshot-too-old` | `:snapshot-stale-identity`, `:snapshot-age-expired`, `:snapshot-ended`. |
| `invariant-violation` | Terminal fault, inconsistent frontiers, corrupt metadata; do not convert to normal contention. |

Contention after announcement restores provisional threshold only.
Another condition/nonlocal exit after announcement makes register
`FAULTED`. Busy termination preserves pin/rescheduling obligation;
busy timer preserves cursor. Buffer verification publishes no
result on rejection.

<a id="metodo-e-due-letture"></a>

## Method and two readings

Concurrent tests coordinate workers through semaphores/finite
wait/join deadlines. No `sleep` to assume order. Bounded
cleanup releases semaphores, joins workers or terminates them on
fixture failure, propagates errors. No case may leave
blocked thread or hide failure.

Capture injections confined to isolated test process.
Every temporary adapter replacement restored through
`unwind-protect`. No callback/new API introduced in
product; original functions retained for noninjected cases.

Mutants alter specific snapshot guards/transitions in
isolated copies. Baseline first must complete unchanged suite,
structured `:complete` phase/exact passed-test list.
Compilation error, OS signal, incomplete baseline,
nonzero exit after completion are worker errors, not detected
mutants. Runner retains exit/signal/log/generated sources;
fixtures/negative CLI check verify COD-60/COD-61.
Target `snapshot-mutation-selftest` included in `make check-core`,
thus Linux/macOS CI jobs too. Mutation campaign remains
explicit local execution;
self-test child runners/logs/reports preserved.

Partial coverage reuses `tools/foundation-coverage.lisp`, scope
`mvcc`. Driver instruments product sources but runs only
`arcdocdb.mvcc.tests:run`; report selects eight
`src/mvcc/` files. Self-test/final report run; SB-COVER
state/HTML preserved with denominators/gaps. Partial observation:
not MC/DC measurement or release-gate closure.

Before execution, readings on actual sources completed,
authors/independent reviewers/hashes/findings/explicit C1 checklist in
[review record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-snapshot-verification/revisione.lisp).
Command records preserve arguments,
environment, outputs, exits, before/after hashes. Sources/docs/Git index
frozen during each recorded command.

<a id="esiti-osservati-l11-ottobre-2026"></a>

## Outcomes observed October 11, 2026

Local integrated verification at commit `aa4f462` succeeded:
[core-finale.lisp](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-snapshot-verification/core-finale.lisp)
retains `:status :ok`, exit 0, stable sources. 501 dedicated
module tests passed, including 43 new MVCC/22 CBOR cases already
integrated from main, plus smoke test. Warning-free compilation,
lint, self-tests, traceability, links, evidence verification, ten
spikes succeeded.

First attempt
[core-iniziale.lisp](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-snapshot-verification/core-iniziale.lisp)
remains `:failed`, exit 2: COD-01 rejected unused `REGISTRY`
variable in lifecycle fixture.
[Recorded correction](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-snapshot-verification/correzione-fixture.lisp)
adds assertion on context's public register identity.
Fixture blob `4e9a15f` → `2cc481d`; test counts/
product sources unchanged. Difference from original
freeze explicit; method/initial outcomes preserved.

In [mutazioni-finale.lisp](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-snapshot-verification/mutazioni-finale.lisp),
baseline completes exactly 43 expected tests, `:complete` phase,
exit 0. All ten named mutants fail targeted runtime test,
exit 1, no signals/timeouts; zero worker errors.
Runner fixtures instead actually produce SIGKILL 9 and
exit 7 after `:complete`: both classified `:worker-error`
as intended, preserved logs/runners. Negative CLI check
remains `:failed`, exit 1, expected COD-61 rejection.

[Final coverage command](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-snapshot-verification/copertura-finale-comando.lisp)
succeeded. [HTML index](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-snapshot-verification/raw/copertura-finale/cover-index.html)
reports 784/1084 expressions (72.3247%), 88/132 branches (66.6667%):
300 expressions/44 branches uncounted. `snapshots-read.lisp`:
31/209 expressions (14.8%), 0/28 branches. Suites exercise reader APIs;
`INLINE` expansions limit counter attribution to file,
so values do not demonstrate corresponding paths were
unexecuted. Independent reading reconstructed all eight
HTML files/checked annotated-source identity.

Before push also integrated main `f16e978`, adding index
campaign without snapshot/CSN changes.
[Integrated verification](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-snapshot-verification/integrazione.lisp)
at commit `ac52376` passes 620 tests plus smoke, including 64 slot/55
primary-index cases. Unified coverage-driver self-test
succeeded; independent review confirms both suites and
`mvcc`/`index` scopes. Previous evidence original.

<a id="criteri-di-chiusura-e-limiti"></a>

## Closure criteria and limits

Campaign closes when agreed mapping exercised by
dedicated suite, runner distinguishes fixture faults,
target mutants detected/analyzed, integrated checks pass,
CI concerns exact published commit. At publication of
results, commit's CI **pending**; local outcomes do not
anticipate result. [Catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-snapshot-verification/catalogo.lisp) preserves schema-1
records with LEAF names, original bytes/failed-attempt states.
Any unexercised cases explicit gaps.

Preregistration separate from results. Expression/branch
measurement retains denominator, does not measure MC/DC.
Coordinated sequences prove neither ARM64/x86-64 weak memory nor
benchmark performance. Remaining: EBR/reclaim, primary index, retained versions,
GET, engine timer/scheduler, durability, crash recovery. No
zero heap, measured latency, complete C1 qualification, phase
closure claimed. Runtime evidence separate from previous
static inspections.
