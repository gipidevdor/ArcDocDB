<a id="metodo-preregistrato-controller-bounded-di-pubblicazione-della-serie"></a>

# Preregistered method: bounded Serie publication controller

Registered on 2026-10-09, before running tests or measurements. C4 tool:
`tools/series-controller-bench.lisp`; C1 product: `arcdocdb.series`.
References: [ADR-0037](../adr/0037-lotto-sigillato.md),
[ADR-0046](../adr/0046-orizzonte-con-registro-limitato.md),
[ADR-0033](../adr/0033-fail-stop-e-integrita-end-to-end.md), and
[coding standard](../affidabilita/standard-di-codifica.md), COD-01,
COD-30, COD-40, COD-42, COD-60, and COD-61.

**Preregistration status: no execution.** The parent authorizes
the campaign only after freezing the shared worktree. During
windows, no compilation, other tests, benchmarks, metadata
collection, printing, or report construction takes place. External machine
load remains uncontrolled; operating system isolation
is not claimed. Source stability is a success condition.

<a id="copertura-e-mutazioni-preregistrate"></a>

## Preregistered coverage and mutations

The parent runs verification campaigns in processes separate from measurements,
only after freeze. C4 driver
[series-controller-mutation.lisp](../../tools/series-controller-mutation.lisp)
derives from the WAL/CSN sensor: `*mutants*` contains source, exact replacement,
and selected test; `*test-names*` and `run-probes` declare the four
`ARCDOCDB.SERIES.TESTS` tests. Their definitions are in
[tests/series/controller.lisp](../../tests/series/controller.lisp).
These four detection hypotheses are preregistered:

| Mutant | Source and change | Selected test |
|---|---|---|
| `ignore-event-generation` | `src/series/events.lisp`: omits equality between captured generation and event generation. | `TEST-REQ-AFF-004-SERIES-FREE-AND-STALE-PREALLOCATED-EVENT-AFTER-WRAP` |
| `ignore-publication-fifo` | `src/series/events.lisp`: omits the FIFO guard for unresolved commits. | `TEST-REQ-WAL-006-SERIES-PUBLICATION-FIFO-UNRESOLVED-AND-RETURNED-H` |
| `retry-root-cas` | `src/series/publication.lisp`: repeats root CAS in phase `:pubblicato` when retrying after busy. | `TEST-REQ-MVC-008-SERIES-BUSY-AFTER-CAS-KEEPS-ROOT-ONCE-AND-CAPTURED-TOKEN` |
| `reuse-before-io-retirement` | `src/series/retirement.lisp`: omits the consumer `:retired` guard before reuse. | `TEST-REQ-WAL-006-SERIES-ASYNC-SEPARATE-PUBLICATION-AND-RETIREMENT-CURSORS` |

Before mutants, the four-test baseline must pass, in the driver-declared
order, on an intact copy. A failed baseline invalidates
the campaign and prevents mutant startup. Each mutant uses a
complete source/test copy, fresh process, and isolated FASLs through
recursive mapping after loading ASD. The replacement must have
a unique target; absence or ambiguity invalidates the test.

A kill (`:detected`) requires successful compilation, phase `:tests`, exit 1,
and `:failed-test` equal to that mutant's selected test. Failed compilation,
timeout (child deadline 30 seconds), failure of another
test, unreadable report, or infrastructure fault is `:invalid`.
A passing selected test is `:survived`: this also prevents
campaign success. Copies, argv, stdout/stderr, raw results,
before/after fingerprints, and diagnostics remain preserved. C4 self-test,
baseline, and each mutant outcome are distinct evidence; no kill has
yet been observed.

Coverage uses
[foundation-coverage.lisp](../../tools/foundation-coverage.lisp), with
sensor self-test and explicit scope `series`. This scope runs
`ARCDOCDB.SERIES.TESTS:RUN` and filters the report to `src/series/` sources,
excluding tests. Coverage state and raw per-file reports are
preserved, with strict build and private cache, outside benchmark windows.
Decisions and conditions to verify are inventoried in
[controller-serie-decisioni.md](controller-serie-decisioni.md): instrumented
branch coverage and four targeted mutants do not guarantee MC/DC,
complete condition coverage, or interruption-path coverage.

After exporting WAL preflights, new observations of existing WAL are
also collected on the integrated checkout: suite `ARCDOCDB.WAL.TESTS:RUN`,
report with scope `wal`, and C4 campaigns from
[wal-csn-bench.lisp](../../tools/wal-csn-bench.lisp), according to its
[method](wal-csn-metodo.md). The context of
`verifica-token-lotto`, `verifica-pubblicazione-lotto`, `verifica-riuso-lotto`,
and `marca-log-faulted`, and the preserved resolver are observed. The `series` report
attributes no coverage to preflights in `src/wal/`: WAL data must be
examined separately, making any unexercised branches explicit.
WAL evidence preceding the export does not attest to the new checkout.
These campaigns also remain preregistered and unexecuted until freeze.

<a id="contratto-e-ambito"></a>

## Contract and scope

The bounded controller for one Serie is observed, with dedicated CSN register and
segment log. The root is an immutable opaque reference: two alternating
preexisting symbols, without hash index, snapshot, or engine pool.
The controller adopts an already `:sealed` batch before starting I/O.
The lease is acquired in the owning thread and covers the entire warmup
or measurement segment; release and acquisition remain outside the clock. In
parallel execution, no lease acquired in main is transferred to a worker.

The cycle reads the current root as expected-root and chooses the other
symbol as new-root. It includes: PUT, `sigilla-lotto-con-csn`, WAL token capture,
`registra-commit-serie`, event and generation capture,
group construction/closure, `inizia-io-commit-serie`, write and flush,
`completa-io-commit-serie`, `pubblica-commit-serie`, CSN resolution,
`riusa-gruppo`, `riusa-commit-serie`. The controller reuses the batch;
the sensor does not call reuse a second time. The measured level
is `:group`.

The simulated backend performs write/flush in the same owning thread.
Synchronous completion of `esegui-gruppo`, followed by a memory barrier,
precedes controller I/O completion. This model makes task completion
order explicit; it does not prove a cross-thread handoff or a real
pool. The local counter must pass `0 → 1 → 0`; state
`:written` alone is not used as completion.

The additional API `ritira-io-commit-serie` concerns the fault path
with dispatch never accepted or definitively retired through synchronized
handoff: faulted Serie, group already aborted, and batch still sealed.
It retires the I/O obligation without write/flush and preserves the pending token;
it does not independently revoke a task or enable buffer reuse.
Its guards and rejection on a healthy Serie belong to the parent's
tests and `series` coverage report. The measured healthy cycle continues
to use `completa-io-commit-serie` after write/flush.

This update changes product sources and their fingerprints.
The benchmark driver already recursively includes all `src/**/*.lisp` files
in before/after SHA-256 comparison, therefore including the API and new
export. Campaign fingerprints will be collected on frozen content;
no integration-phase fingerprint is promoted to runtime evidence.

Every error or unexpected `:pendente` interrupts the window and invocation,
without retry, implicit abort, or recycling of faulty buffers. An
unexpected interruption after assignment is not treated as rollback.
Actual busy/full and reasons are preserved; controller-returned `:pendente`
is explicitly recorded as normalized CSN busy.
Negative product tests (rejections, stale lease, FIFO, Serie/
Archivio fault, quiescent aborts, published/busy without double CAS, async
during flush, generation exhaustion, and interruptions) remain the parent's
responsibility; the sensor's healthy path does not replace them.

<a id="compilazione-e-fixture"></a>

## Compilation and fixtures

Each explicit invocation, including `--self-test`, loads ASD before
installing recursive ASDF translation `**/*.* → fasl/**/*.*` in the
run's exclusive directory. Before compilation, destinations of all
product sources are checked, including nested modules.
Product build is forced and C4 source also compiled in the
private cache, with warnings and style-warnings treated as errors, safety 3.
The C4 FASL is preserved as compilation evidence, without reloading
the driver or making a second invocation. The function table is resolved only after build;
a missing export fails the run. No API resolution
or fixture construction enters the windows.

Each fixture preallocates file/backend, log, 256-slot register, 512-byte
single-record batch, single-batch group, and controller with the
default capacity of 64 events. A 16-byte key, 64-byte value,
and maximum u64 file-id preboxed before measurement. Token descriptor,
event identity and generation history, counters, and raw records
are also preallocated. The sensor requires SBCL where every u32
is representable as a fixnum.

<a id="oracoli-entro-il-clock"></a>

## Oracles inside the clock

Each cycle checks the independent two-u32 CSN successor, WAL token
pending and identical to the captured event's token, stamps in PUT and SEAL
bytes, `:preparato` event, expected root, and positive generation
equal to the previous global generation's successor and strictly
increasing for the same event identity. History is a
scan bounded to 64 elements, without allocation or u64 CSN integers.
Count checking observes adoption, dispatch, completion,
resolution, and retirement inside the clock and under the same lease.

After write/flush, expected end, backend bytes, and written/durable
frontiers must match; batch and group must be durable and log healthy. After
publication the root is the other symbol, event/token are resolved,
`H = ultimo-CSN = CSN atteso`. After group release and retirement the batch
is open and empty, token/event free, group building, controller
counts `(count, unresolved, active-io) = (0, 0, 0)`, and root still
published. Final observations also preserve write/flush
counts, bytes, adoptions/publications/retirements, and observed generation/events.

<a id="campagne-seriali-e-parallele"></a>

## Serial and parallel campaigns

Warmup of 1024 cycles on a separate fixture, followed by full GC outside
measurement. Fresh measured fixture for every attempt. All serial runs
come first: five replicas with CSN base `(0, 0)`, then five with base
`(#x80000000, #xfffffff0)`. The second base's sixteenth iteration
crosses carry in the measured window without reconstructing a u64.

Each sample starts at 20000 cycles, minimum 20 timer ticks. Only a
correct but below-resolution window permits doubling. At most
five attempts: 20000, 40000, 80000, 160000, 320000; all are
preserved, without discarding anomalies or choosing the best replica.
The serial gate requires exactly zero heap bytes on success for
the entire window with oracles. No throughput threshold.

Then 1, 2, and 4 real workers, three replicas per count, high base with
carry. Each worker owns an independent simulated Archivio: register,
file, log, batch, group, controller, and event history. Fixtures are
warmed separately; thread construction, ready gate, and GC precede
start. The common work/join deadline is 30 seconds, and each
serial window also has a 30-second limit checked every 256 iterations.
Ready-gate waits are bounded; cleanup has a common
2-second budget. Fields of still-live workers are not read, their files
are not closed, and the run fails. Worker termination does not
assert release of its lease or rollback of its tokens.

Parallel windows preserve each worker's data and a temporal aggregate
from first start to last end. SBCL's heap counter is process-global:
worker observations overlap, are not summed,
and are not attributed to individual threads. Process heap between start
gate and join, including runtime coordination, is observational.
Replicas and attempts follow one another without other sensor activity
inside a window.

<a id="autoverifica-c4-e-persistenza"></a>

## C4 self-test and persistence

Before campaigns, an empty window is measured: exactly zero heap.
The positive control allocates 16 arrays of 1 MiB and keeps every array
live through the end of counter reading: at least 16 MiB must
be detected. These controls check the sensor without requiring
20 ticks or attributing product throughput to them.

The self-test demonstrates that the validator rejects nonzero heap when
zero is required, negative time or time below required resolution, and a
missing metric. Preservation of metrics changed through an alias of the same plist
is also checked after saving and rereading.
All modified keys exist before sharing.
The final report is reread with `*read-eval* nil`, compared in full,
and validated again; persistence is a gate, not a diagnostic note.

Schema 1 reports: argv, SBCL/OS/CPU/memory/CPU count, commit and checkout
state, before/after source SHA-256, verified FASL mapping,
raw windows (ticks and heap before/after, sink, completed work), all
replicas and attempts, final oracles, reasons, and failure diagnostics.
A change to files or their list prevents success. The initial report
is written before build; an error preserves the final report
and produces nonzero exit with tool name and rule.

<a id="chiusura-della-verifica-sul-congelamento"></a>

## Verification closure on the frozen content

Closure is the parent's responsibility after declaring
integrated content frozen. Structured build/check records, C4 self-tests,
integration suite, baseline and four preregistered mutants, `series` coverage,
and WAL observations are correlated with that content,
along with benchmark campaigns retaining every attempt.
The full repository gate is `make check`, with the record required
by Makefile; specific campaigns remain separate processes and do not
overlap measurements. A failure or invalid test remains explicit
and prevents declaring the corresponding verification complete.

The checklist and closure of C1 findings are documented in
[controller-serie-revisione.md](controller-serie-revisione.md), comparing
actual corrections and relevant tests on the frozen product,
including I/O retirement without dispatch. This method records future
obligations: it does not close findings on the reviewer's behalf, attribute runtime
outcomes, or guarantee MC/DC through mutations or instrumented coverage.

<a id="esecuzione-futura-e-limiti-delle-conclusioni"></a>

## Future execution and limits of conclusions

From the frozen worktree, a new direct-child directory of `spikes/out/`:

```sh
sbcl --noinform --no-userinit --no-sysinit --script tools/record-command.lisp -- \
  sbcl --noinform --no-userinit --no-sysinit --script tools/series-controller-bench.lisp \
  --self-test --output-dir spikes/out/series-self-test-UNIQUE/
sbcl --noinform --no-userinit --no-sysinit --script tools/record-command.lisp -- \
  sbcl --noinform --no-userinit --no-sysinit --script tools/series-controller-bench.lisp \
  --bench --output-dir spikes/out/series-bench-UNIQUE/
```

Additional campaigns are recorded with the same wrapper, using new
directories and separate processes: mutation driver first with `--self-test`,
then `--check spikes/out/series-mutations-UNIQUE/`; coverage driver
first with `--self-test spikes/out/series-coverage-self-test-UNIQUE/`, then
`--report spikes/out/series-coverage-UNIQUE/ series` and, separately,
`--report spikes/out/series-wal-coverage-UNIQUE/ wal`. C4 WAL
observations follow commands preregistered in the WAL/CSN method. All precede
or follow benchmark campaigns without overlapping their windows.

Without an explicit directory, the tool chooses an exclusive name. Output:
`report.lisp`, `self-test-metrics.lisp`, `build.log`, private `fasl/` cache;
the final report is also emitted to stdout. The outer record preserves
the full command, stdout/stderr, and exit code. `--bench` includes
self-test. Maximum budget: 10 serial samples and 9 parallel replicas,
each with five windows; maximum sum 620000 cycles per sample/worker.

The backend performs no real data I/O. Cycles/s and bytes/s measure the
simulated path with oracles; they do not prove NVMe performance, database
throughput, client latency, real durability, recovery, snapshot, or pool.
The heap counter does not demonstrate absolute absence of allocation.
