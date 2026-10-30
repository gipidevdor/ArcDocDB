<a id="risultati-del-ricircolo-dei-writer-pronti"></a>

# Ready-writer recycling results

Local campaigns of 2026-10-09, base `673987a`, macOS ARM64/Apple M4,
SBCL 2.6.9, safety3. Sources/tests/tools frozen in copy
`arcdocdb-recycle-verify-7meus4m5`; each process retains argv, environment,
full outputs, before/after snapshots. External load uncontrolled.
[Preregistered method](writer-recycle-metodo.md) and
[contract](writer-recycle.md) fix verification scope.

<a id="correttezza-e-concorrenza"></a>

## Correctness and concurrency

Forced build and `make check-core`, run through record-command as
`make check`, pass without warnings/style-warnings: 309 tests of nine modules
plus smoke. Execution increases from 51 to 66 tests, 15 new tests.
Independent-list oracle checks 8,000 steps across eight configurations:
capacity 1/2/3/9 × shards 1/4, 11 reused writers, unique payloads.
Every public obligation comes from handoff, transferred once,
completed before reuse; only opaque duplicates are declared private FI.

Regression starts consumers A/B with backlog, empties ring,
fills it with C/D while A/B running, finishes both with `:schedule`.
Simple publication rejects both without mutation; two recyclings
transfer C/D to callers, retain A/B FIFO in ring without intervening
pop. Every payload processed once, writers return idle.

Three real threads, two contending consumers and live producer,
reused for eight waves and 48 identity/CRC payloads. Busy retry
coordinated/bounded by harness. Further test retains first-shard
guard while another thread recycles/completes second.
Tests check input before guard, busy without effects, inconsistent
shape/payload, helper without guard/with foreign guard, busy start after
transfer, new wave without late cleanup.

<a id="copertura-e-mutazioni"></a>

## Coverage and mutations

| Execution file | Raw expressions | Raw outcomes |
|---|---:|---:|
| package | 0/1 | 0/0 |
| queue | 142/184 | 24/34 |
| writer | 190/218 | 36/44 |
| handoff | 173/190 | 16/16 |
| ready-types | 170/187 | 30/30 |
| ready | 173/194 | 20/22 |
| ready-recycle | 81/86 | 8/8 |
| Total | 929/1060 | 134/154 |

Native data and HTML index agree with two separate recalculations. Five
unmarked forms in new file top-level: package, declaim optimize,
three ftypes. [Inventory](writer-recycle-decisioni.md) retains all previous
gaps/decisions; no forms subtracted from denominator,
no approved exclusion or full MC/DC qualification.

Full baseline with 66 execution tests; eleven mutants compile and
are detected by tests. Each ends exit1/signal NIL; zero
survivors, compilation failure, before-tests, worker-error. Set
includes missing head/tail advancement: ring shape remains valid,
but oracle finds FIFO violation. Campaign covers eleven
preregistered defects, preserving baseline and all eleven logs.

One self-test child actually killed by SIGKILL: signal9,
exit137, `:worker-error`, zero detections. Failure after authentic
completion also worker-error. Checks avoid counting process
failure as test-detected defect.

<a id="allocazioni-osservate"></a>

## Observed allocations

| Shards × capacity | Total writers | Samples × cycles | Heap per sample | Exact sink |
|---|---:|---:|---:|---:|
| 1 × 1 | 2 | 5 × 4096 | 0 bytes | 9,439,232 |
| 1 × 3 | 4 | 5 × 4096 | 0 bytes | 10,672,128 |
| 4 × 1 | 8 | 5 × 4096 | 0 bytes | 13,395,968 |
| 4 × 3 | 16 | 5 × 4096 | 0 bytes | 21,620,736 |

Each composite handoff/ready/recycling cycle uses C+1 distinct writers per
shard, rotates roles, publishes C references, exchanges full ring,
consumes returned reference plus remaining references. Identity, count,
status, cursor, payload, generation checked. Warmup 128 and GC
precede window; no loop I/O. Independent tokens and
12/24/45/93 API calls per cycle derived in method.

Positive control measures 16,777,472 bytes on deliberately allocated
16 × 1 MiB; counter baseline zero. Wrong sink rejected, zero clock
reported below-resolution, existing destination intact,
partial report verified. Startup/error conditions outside
window. Twenty serial samples prove neither universal zero heap, speedup,
pool throughput, P99, fairness, nor engine qualification.

<a id="check-e-conservazione"></a>

## Checks and preservation

Full check OK/STABLE/exit0, process `4000528494-command-77199-0`:
26 foundation, 17 UTF-8, 17 CBOR, 20 CSN, 66 execution, 44 storage,
18 I/O, 82 recovery, 19 WAL, plus smoke. Lint 53 files, zero violations;
trace, links, tool/evidence self-tests, preservation, all ten
spikes pass. Master `4000528568-check-78100-0` preserved with
lossless compression. Both new C4 tools fully strictly compiled,
FASL self-tests in separate private processes/caches.

[Catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-recycle/catalogo.lisp)
preserves processes, native/HTML, logs, measurements, two C1 readings, negative
checks, adapter sources. Editorial closure/publication then receive
link/evidence checks. Pool, wakeups, admission, controller,
shutdown remain to integrate; engine gates open.

<a id="riproduzione"></a>

## Reproduction

```sh
make check
sbcl --script tools/foundation-coverage.lisp --report directory-nuova/ execution
sbcl --script tools/writer-recycle-mutation.lisp --self-test
sbcl --script tools/writer-recycle-mutation.lisp --run altra-directory-nuova/
sbcl --script tools/writer-recycle-bench.lisp --self-test
sbcl --script tools/writer-recycle-bench.lisp --bench ulteriore-directory-nuova/
```

To preserve argv, environment, sources, outputs, prefix command with
`sbcl --script tools/record-command.lisp --`.
[Review](writer-recycle-revisione.md) preserves twelve C1 points/limits.
