<a id="controller-della-serie--risultati-locali"></a>

# Serie controller — local results

Date: 2026-10-09. Product: `arcdocdb.series`, controller for publication,
CSN resolution, and I/O retirement. [Contract](controller-serie.md),
[method](controller-serie-metodo.md), [decisions](controller-serie-decisioni.md),
and [two static readings](controller-serie-revisione.md) bound the result.

The final campaign uses `ffa210780d36036572046cc2135486927d11361e`, a clean
checkout, and sources stable before/after every successful invocation. It includes merge
`80b4834` with `main` at `e07d772`, preserving recovery inventory and minimal CBOR
codec developed in parallel. Controller base: `cf60913`.
Later additions to this campaign are documents and preserved evidence.

<a id="correttezza-e-strumenti"></a>

## Correctness and tools

| Verification | Outcome | Record |
|---|---|---|
| Strict compilation, suite and general checks | 436 unit tests + 2 smokes; 44 Series tests, including 6 concurrent; zero warnings/style-warnings. Lint on 72 files: zero violations. Traceability, links, preservation, and correctness spikes pass. | [Integrated check](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-series-controller/4000549590-command-22639-0-report.lisp) |
| Controller: baseline and four deliberate defects | Baseline passes; 4/4 mutants compile and fail in the named test without timeout. | [Series mutations](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-series-controller/series-mutations-02/report.lisp) |
| WAL–CSN bridge regression | Baseline passes; 4/4 mutants detected. | [WAL mutations](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-series-controller/series-wal-mutations-02/report.lisp) |
| Measurement sensor | Empty window: 0 bytes; positive control: 16 live 1 MiB objects, 16,777,472 bytes observed; zero/negative time, nonzero heap, and missing metric rejected. Persisted fields and plist aliases checked. | [Benchmark and self-test](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-series-controller/series-bench-01-report.lisp) |
| New collection preservation | 12 positive/negative checks: intact copies, lossless gzip beyond 1 MiB, idempotence, refusal of differing overwrite, valid relative HTML links and rejected missing link. | [Collection self-test](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-series-controller/4000548975-command-79587-0-report.lisp) |

The four Series defects respectively remove the generation comparison,
publication FIFO, ban on repeating CAS after busy, and I/O retirement
requirement before reuse. Failed compilation, timeout, or a test other than
the target is not counted as valid detection. Reconstructible source
copies and FASLs are excluded from publication; concrete variant,
recipe, Git SHA, fingerprints, stdout, and stderr are preserved.

Tests include full without partial adoption, stale/foreign, high CSN and
carry, delayed H across Serie, busy after CAS without republication, async with
separate cursors, write/flush faults, quiescence before cancellation, retirement
of never-accepted dispatch, preflight invariants, and uncertain nonlocal exit.
Lease, immutable root, and I/O retirement also receive real concurrent tests.

<a id="condizioni-composte-e-copertura"></a>

### Compound conditions and coverage

| Direct decision | Discriminating test |
|---|---|
| D01, factory budget | `series-invalid-configuration-preserves-wal`: separately false type/capacity/offset, rejection before construction. Default, 1, and 1024 pass in the limit test. |
| D02, capacity and cursors | `series-ring-invalid-capacity-before-indexing` and `series-ring-cursors-fail-separately`: FI on capacity 0/1025 and individual head/tail/publish-head. Invalid capacity is excluded by normal factory and read-only SLOTS. |
| D03, counters | `series-ring-counts-fail-separately`: count above capacity, unresolved above count, and active-io above count; Archivio scope and graph preserved. |
| D04, lease | `series-lease-busy-stale-and-single-release` and foreign-thread test: separate type, zero, generation, and owner. |
| D05, event | `series-foreign-event-same-generation-and-csn`, `series-false-event-and-invalid-generation-before-mutation`, `series-free-and-stale-preallocated-event-after-wrap`. |
| D06, CSN order | `series-csn-after-explicit-truth-pairs`, carry and strict order: high greater/less, equal high and low greater/equal. |

Abbreviated names: full symbols in records include `TEST-REQ-*` prefixes.
FI cases restore corruption before fixture cleanup;
fault remains terminal. Delegated WAL decisions retain their own
[matrix](wal-csn-decisioni.md) and receive combined WAL and Series tests.

| SB-COVER scope | Expressions | Branches | Raw report |
|---|---:|---:|---|
| Series, 44 tests | 1,155 / 1,383 = 83.51% | 141 / 186 = 75.81% | [Series HTML](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-series-controller/series-coverage-02/cover-index.html) |
| WAL, WAL + Series suites | 1,136 / 1,286 = 88.34% | 162 / 190 = 85.26% | [Combined WAL HTML](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-series-controller/series-wal-coverage-03/cover-index.html) |

These sum raw counts, including generated forms and packages; tests are
excluded from the denominator. HTML and SB-COVER state retain original paths.
Percentages do not certify all interruption paths, general MC/DC,
safety, or engine qualification. The six direct decisions have explicit
per-condition cases; this does not extend the conclusion to macros/runtime or
the entirety of delegated decisions.

<a id="prestazioni-del-ciclo-integrato"></a>

## Integrated-cycle performance

Environment: Apple M4, 10 logical CPUs, 16 GiB RAM, Darwin 27.0.0, SBCL 2.6.9.
A cycle forms a PUT with 16-byte key and 64-byte value, seals WAL with CSN,
adopts the root, starts I/O, writes and synchronizes with a simulated backend,
receives I/O completion, publishes with CAS, resolves, and retires group/batch/event.
That is 160 WAL bytes per cycle. Root, token, frontier, and counter oracles are inside the
clock. Factory, preallocated roots, lease, warmup of 1,024 cycles, and metric
collection are outside the serial window. Parallel windows also have
a separate global counter including startup and joins.

Ten serial windows, five per base, 20,000 cycles each; **0 heap bytes
in all ten**, zero busy/full/retry, all final oracles consistent.
Times range from 73,458 to 87,856 ticks, at 1,000,000 ticks per second.

| CSN base `(high low)` | Median cycles/s | Min–max cycles/s |
|---|---:|---:|
| `(0 0)` | 268,622 | 261,185–272,264 |
| `(#x80000000 #xfffffff0)` | 259,041 | 227,645–266,852 |

Nine parallel windows, three per worker count: each worker owns
controller, log, group, batch, and **independent Archivio/registry**.
The separate concurrent test checks the shared registry; these measurements
do not demonstrate scaling of several Serie on the same Archivio registry.

| Workers | Aggregate median cycles/s | Min–max | Global startup/join heap per replicate |
|---:|---:|---:|---:|
| 1 | 265,530 | 258,301–265,904 | 65,520 bytes |
| 2 | 446,803 | 439,184–451,493 | 131,040 bytes |
| 4 | 789,679 | 782,695–820,462 | 262,080 bytes |

With four workers, the local median is about 2.97 times the one-worker median.
Worker windows use the same process heap counter and
overlap: **they cannot be summed**. Parallel heap remains an observation,
not a pass through the serial zero gate. Serial zero is also a measurement
of the validated SBCL sensor, not absolute proof of nonallocation.

The backend performs no physical I/O: no NVMe performance, real durability,
client latency, or database throughput can be inferred from these figures.
External load uncontrolled, no acceptance throughput threshold.
Serial measurements completed before creating workers; no other parent
check or development agent ran during the campaign.

<a id="diagnostiche-preservate-e-spazio"></a>

## Preserved diagnostics and space

The [catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-series-controller/catalogo.lisp)
also includes failed attempts: first compilation stopped by the invariant signaler's
`null` type, self-test CLI missing `--output-dir`,
false positive lint on keyword `:read`, first generation mutant
not compilable. Tools do not promote these tests to successes. In the first
rejected CLI, the driver had not yet collected the initial fingerprint and marks
the local comparison changed; the wrapper observes stable sources. This is neither a
measured campaign nor a code change during measurement.

Large records are descriptors plus verified lossless gzip;
no stdout/stderr truncation or serialized-string modification. Associated raw
files retain sizes and SHA-256. The collector also applies
gzip to raw output above 1 MiB and verifies decompressed contents.
Whitespace checks concern sources and documents; raw stdout/stderr
retain the compiler's original spaces too.
Every published file in this campaign stays below 1 MiB; temporary
copies/FASLs are removed when archiving the worktree after push.

The controller is implemented within the declared scope. Concrete index,
snapshot registration, pool, client acknowledgment, and Archivio coordinator
remain subsequent work; no whole-engine requirement is promoted.
