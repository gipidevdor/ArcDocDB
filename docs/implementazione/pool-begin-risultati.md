<a id="verifica-dellavvio-poolserie"></a>

# Pool/Serie start verification

Qualification follows the [contract](pool-begin.md),
[preregistered method](pool-begin-metodo.md), and
[independent C3 review](pool-begin-revisione.md). Frozen base
`ad829a40f6ce72837b59982d2e4f83e8c9ca9f3e`: fifteen sources and fourteen
helpers copied byte for byte; seventeen review fingerprints match
in checkout and clone. Originals in the
[campaign catalog](https://github.com/gpicchiarelli/ArcDocDB/tree/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-pool-worker-begin/).

<a id="processi-e-prove"></a>

## Processes and tests

| Process | Original record | Outcome |
|---|---|---|
| Publication adapter and self-test | [4000996071-command-39309-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-pool-worker-begin/processes/publisher-selftest/report.lisp) | OK, STABLE, exit 0 |
| Strict native/HTML reader | [4000996086-command-40256-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-pool-worker-begin/processes/coverage-reader/report.lisp) | OK, STABLE, exit 0 |
| Strict sensor and self-test | [4000996086-command-40255-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-pool-worker-begin/processes/selftest/report.lisp) | OK, STABLE, exit 0 |
| Coverage and complete scheduler | [4000996086-command-40257-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-pool-worker-begin/processes/coverage/report.lisp) | OK, STABLE, exit 0 |
| ACTIVE campaign | [4000996125-command-41073-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-pool-worker-begin/processes/benchmark/report.lisp) | OK, STABLE, exit 0 |
| Frozen full check | [4000996069-command-39211-0](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-pool-worker-begin/processes/check-core/report.lisp) | OK, STABLE, exit 0 |

**14 new tests** and the complete scheduler **94/94** pass. They check
real start with dual lease and all four values, a single begin,
explicit pop/ACK/end, and full swap A→B that starts B while A remains
in the ring. A CLAIMED with inactive gate, inconsistent commands, or pending retirement
remains completable without implicit gate, lifecycle ACK, claim, or recycle.

Real writer contention preserves CLAIMED, IDLE link, and generation;
Serie contention and exhaustion of its lease return
CLOSING and a token to close explicitly. The bridge generation
limit is instead rejected before acquiring the writer.
Owner on a different thread, inconsistent binding, and disallowed phases precede
acquisition; debt, leases, and first cause remain retained.

Invalid routing, actually not-ready writer, and an error injected during
the second acquisition check the EQ original C1 cause and remaining
capabilities. An unexpected error does not return the four values or promise
cleanup: the caller retains references and coordinates the Archivio. Cleanup
of C4 fixtures alone is not presented as product recovery.

The full check passes **1420 named product tests, two smoke
tests, and four linter fixtures**, plus lint, trace, links, C4 self-tests,
retention, and ten spikes. The 1426 `ok` markers include fixtures,
which are not called product tests. Lint on 213 files without
violations; trace on 120 requirements, 65 invariants, 13 FI scenarios, and 52 ADR,
without errors. The process lasts 269.513968 seconds with 891 stable sources.
Compilation without warning/style-warning; stderr retains 861956 characters
of compiler notes, equivalent to 861966 UTF-8 bytes.

None of the six formal processes failed. The preexisting archive
check sees 106 catalogs, 3241 references, 37401 files, and 961373366
retained bytes: these counts precede the new begin namespace.

<a id="copertura"></a>

## Coverage

Native SB-COVER and seven original HTML files agree on the entire six-file
package: **176/184 expressions (95.652%) and 10/10 native branches (100%)**,
without exclusions. The new entry point covers 21/21 expressions. The original
native data occupies 2769774 bytes. The [library audit](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-pool-worker-begin/data/coverage-audit/coverage-audit.lisp)
and [component audit](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-pool-worker-begin/data/begin-coverage-audit/coverage-dispatch-audit.lisp)
retain denominators, native/HTML comparison, and all missing items.

| File | Expressions | Native branches | Missing |
|---|---:|---:|---:|
| `package.lisp` | 1/1 | 0/0 | 0 |
| `types.lisp` | 40/40 | 8/8 | 0 |
| `build.lisp` | 24/24 | 2/2 | 0 |
| `claim.lisp` | 45/49 | 0/0 | 4 |
| `recycle.lisp` | 45/49 | 0/0 | 4 |
| `begin.lisp` | 21/21 | 0/0 | 0 |

The eight missing items match the previous recycling campaign in data
and paths: final otherwise branches of claim and recycle, retained
in the denominator. Claim: indices 31–34, paths `(1 4 3 3 4 3)`,
`(1 1 4 3 3 4 3)`, `(2 1 4 3 3 4 3)`, `(3 1 4 3 3 4 3)`.
Recycle: indices 39–42, paths `(1 4 2 3 3 4 6)`,
`(1 1 4 2 3 3 4 6)`, `(2 1 4 2 3 3 4 6)`, `(3 1 4 2 3 3 4 6)`.
In the first case, the gate's declared domain permits branch
elimination; in the second, the preceding guard validates status. No new
gap in begin, no MC/DC inference, and no inherited C1 denominator.
Zero native branch probes does not mean absence of source decisions.

<a id="misura-locale-active"></a>

## Local ACTIVE measurement

The [original report](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-pool-worker-begin/data/benchmark/report.lisp)
retains five replicates, each with a new fixture: **4096 cycles and
128 warmup**, 20480 measured cycles overall. A real symbolic payload
remains queued. Timed: bridge start with four-value oracle,
monotonic token and dual lease, end without pop, C1 room recycling, and explicit
C1 claim. No private reset. Factory, API lookup, GC, and final public
drain with pop/ACK/end remain outside timing.

| Replicate | Ticks | Completed cycles | Observed heap | Sink |
|---|---:|---:|---:|---:|
| 0 | 4930 | 4096 | 0 | 8579072 |
| 1 | 4863 | 4096 | 0 | 8579072 |
| 2 | 4886 | 4096 | 0 | 8579072 |
| 3 | 4866 | 4096 | 0 | 8579072 |
| 4 | 4878 | 4096 | 0 | 8579072 |

SBCL 2.6.9, ARM64, Darwin 27.0.0, clock 1000000 units/s and safety 3;
the C1 protocol and scalar oracles
are part of the cost. Time is not attributed to the adapter alone. Uncontrolled
external load, no threshold or tuning; observed zero heap does not
prove universal nonallocation. CLOSING, busy,
concurrent coordination, and engine throughput are not measured.

Self-test detects 16777472 deliberate bytes, wrong sink, four
mismatched values, and sub-resolution clock; it also checks the CLOSING oracle,
CLI, preexisting destinations, and retained partial raw data. The C4 reader
checks six files and unexpected denominators/missing items. Publication checks
one positive and seven negative fixtures: each missing runtime source and
an altered fingerprint. No out-of-contract result is attributed to
a nominal C1 return.

<a id="integrazione-e-conservazione"></a>

## Integration and retention

Product commit `5b3673f407777ebeeefa7caa6320f387a14c85db`
contains the same qualified bytes. The new entry point directly forwards
the bridge's three values: no C3 guard after acquisition separates the
token from caller. No C1 source changes.

Preliminary evidence remains separate: fourteen tests and scheduler
passed on first attempt; sensor with two passing development self-tests
(second with private cache), reader passed, and strict product
compilation without warnings. Only intermediate FASLs are excluded from bundles.
Formal processes retain argv, original outputs, exit, and fingerprints,
with stable sources. C4 writers and legacy generic formats are reused without
broadening the new specific manifest's scope.

The [original publication](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-pool-worker-begin/processes/publication/report.lisp)
passes in 306.647160 seconds and the subsequent
[link and archive check](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-pool-worker-begin/processes/final-verification/report.lisp)
in 221.384083 seconds. Both processes retain OK, STABLE, and exit 0,
892 stable sources, and empty stderr. Verification checks 431 files and 3007
links, none broken; 107 catalogs, 3252 references, 37444 files, and 965767686
retained bytes. Counts precede closure copies and the two links
added in this paragraph. The closure manifest retains both
original processes, final document, and sources; earlier tests
are not rewritten.

Server loops, payload application, admission,
real sensors, park/wake, physical startup/shutdown, and Archivio coordination are not implemented.
Durable protocols and whole-engine gates remain open.
