<a id="risultati-della-consegna-locale-dei-writer"></a>

# Local writer handoff results

Local campaign on 2026-10-09, macOS ARM64/Apple M4, SBCL 2.6.9, safety 3.
Targeted test base `85a4e05`; integrated verification on updated base
`4215fca`, which adds compact evidence retention without
changing execution code. Sources and tests match byte for byte
between workspace and verified copy. External load is uncontrolled.

<a id="correttezza-e-fault-injection"></a>

## Correctness and fault injection

The 17 new tests, together with the 17 previous queue tests, pass
forced compilation without warning/style-warning. The FIFO list oracle
checks 7200 operations over nine finite configurations; it checks every count,
payload, span, quantum, and scheduling obligation without reading the ring.

Fixtures exercise both acceptance orderings relative to
empty end, early completion, backlog, cumulative quantum, and a new
wave. Full/busy, old/foreign tokens, invalid targets, and exhausted
generation preserve the stated properties. Seven inconsistent states and
the three helpers without a guard/with a foreign guard are tested through private FI.

Four real threads are reused over six waves, 36 messages, and two Serie,
with producers still open during consumption. B completes slices while A
holds guard and lease. Two additional workers hand off eight slices over
four waves. Waits belong to the fixtures, with timeouts and rethrowing
errors. No product pool is introduced or qualified.

<a id="copertura-e-mutazioni"></a>

## Coverage and mutations

| Execution file | Raw expressions | Raw branch outcomes |
|---|---:|---:|
| package | 0/1 | 0/0 |
| queue | 142/184 | 24/34 |
| writer | 190/218 | 36/44 |
| handoff | 173/190 | 16/16 |
| Total | 505/593 | 76/94 |

The new module's 17 unmarked expressions include declarations,
defaults, and four forms in the defensive otherwise branch; all 16
instrumented outcomes are marked. The [inventory](writer-handoff-decisioni.md#copertura-raw-osservata)
also retains the legacy gaps. No approved exclusions or complete MC/DC.
Independent recalculation of the raw vectors matches the HTML index.

The mutation baseline compiles and passes all 34 execution tests.
Sixteen mutants compile and are detected: eight in the handoff protocol,
eight in delegated primitives and the refactor. Zero survivors, zero
compilation-failure, zero failures before tests. The score concerns
the preregistered set, not all possible defects.

<a id="allocazioni-osservate"></a>

## Observed allocations

| Preallocated path | Samples × cycles | Observed heap | Sink per sample |
|---|---:|---:|---:|
| Capacity 1, quantum 2, empty end | 5 × 4096 | 0 bytes in each | 8,669,184 |
| Capacity 32, quantum 16, backlog and requeue | 5 × 4096 | 0 bytes in each | 23,246,848 |

Warmup of 128 cycles and GC outside the counter. Fixtures, parsing, compilation,
and reports are excluded; API checks and responses are included.
The positive control detects 16,777,472 bytes from 16 MiB deliberately
allocated. No measurement of speedup, throughput, P99, or universal guarantee
of no allocations; errors and scheduler integration not measured.

<a id="riproduzione-ed-evidenze"></a>

## Reproduction and evidence

```sh
make test
sbcl --script tools/foundation-coverage.lisp --report spikes/out/handoff-coverage/ execution
sbcl --script tools/writer-handoff-mutation.lisp --self-test
sbcl --script tools/writer-handoff-mutation.lisp --run directory-nuova/
sbcl --script tools/writer-handoff-bench.lisp --self-test
sbcl --script tools/writer-handoff-bench.lisp --bench altra-directory-nuova/
make check
```

To retain provenance and output, use `tools/record-command.lisp --`
before the command. The [catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-handoff/catalogo.lisp)
includes process records, raw coverage, baseline/mutant logs,
measurements, self-tests, failed attempts, and sources of temporary adapters.
The [review](writer-handoff-revisione.md) retains both C1 readings.
The [contract](writer-handoff.md) bounds the local obligation: scheduling,
wakeups, shutdown, and adaptive controller still require integration.

Integrated `make check` passes 203 tests across six modules plus
smoke, linter (38 files, zero violations), traceability (114 requirements,
65 invariants, 13 FI, and 52 ADR), links, evidence, and ten spikes. The
[integrated check](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-handoff/check-integrato.lisp)
record is `:ok`, exit 0, and sources `:stable`; the
[spike campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-handoff/spikes-integrati.lisp)
retains all children only in the master, compressed losslessly, without
duplicating their reports. Subsequent editorial additions are checked
with links and catalogs; code and tests remain those of the full verification.


The subsequent integration with `7f8ca93` also retains the new UTF-8 codec.
The [final check on main](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-handoff-main/check-integrato.lisp)
passes with 220 tests across seven modules plus smoke (26 foundation, 17 codec,
34 execution, 44 storage, 18 I/O, 62 recovery, 19 WAL), zero warnings,
40 files in the linter without violations, and the same traceability. The ten spikes
are retained in the [final master](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-handoff-main/spikes-integrati.lisp)
with compressed payload and verified hashes. This second
[catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-handoff-main/catalogo.lisp)
retains the wrapper, full check, and integration appendix;
raw data from the targeted campaign and previous verification remain intact.
