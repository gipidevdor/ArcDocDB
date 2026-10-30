<a id="risultati-della-lista-dei-writer-pronti"></a>

# Ready-writer list results

Local campaigns 2026-10-09, initial base `92d8b0e`, macOS ARM64/Apple M4,
SBCL 2.6.9, safety3. Integrated checks first use `fd96fb3` (manifest),
then `201562d` (CBOR header), `33aa224` (CSN register), other-chat contributions.
Both ready sources, tests, benchmark
identical; ASDF integrates components, mutation runner
strengthened. Every record retains own version; external load
uncontrolled.
[Contract](writer-ready.md) preserves obligation-transport boundaries.

<a id="correttezza-e-fault-injection"></a>

## Correctness and fault injection

On initial base, forced build/full suite without warnings/style-warnings: 237 tests
of seven modules plus smoke, 51 execution (34 previous, 17 new).
FIFO-list/cursor oracle checks 9000 steps over nine configurations,
eleven reused writers, pending obligations on full, completion before
reuse. Default limit uses 1025 distinct writers; rejected
reference retained/published after drain.

Tests cover wrap, capacity/input, rotation, 24 busy/cursor patterns,
seven inconsistent ring shapes, invalid arrays/slots/payloads, helpers called
without guard/by another thread. Private FI/opaque duplicate-ring fixture
remain distinct from public oracles with legal obligations.

Four real threads reused over six waves/36 payloads: producers
remain alive during consumption, one consumer completes slices while
other Serie's partition occupied. Two additional contending
consumers reused over eight waves take one reference per
wave. Payload/CRC checks outside list guards;
semaphores/retries/joins belong to harness with explicit bounds.
No throughput, speedup, P99, temporal fairness measurement.

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
| Total | 848/974 | 126/146 |

Independent raw-vector recalculation agrees with HTML index.
[Inventory](writer-ready-decisioni.md) retains declarations/defaults,
two defensive CAS checks, otherwise, legacy gaps.
No subtracted form, approved exclusion, full MC/DC qualification.

Initial campaign has successful execution baseline 51. Twelve mutants compile/detected;
zero survivors, compilation failure, before-tests. Preregistered set
checks FIFO, wrap, full, count, freed slot, release, busy, last
partition, cursor; not all possible defects.

Integration distinguishes test-detected error from process
failure: OS signal or nonzero exit after real completion
is `:worker-error`. Self-test uses own SIGKILLed child,
preserving exit/signal/log/report. Previous campaign/tool
version preserved; twelve mutants unchanged.
Repeat on `fd96fb3` passes baseline 51 and 12/12 detections,
exit 1/signal NIL per mutant; zero worker errors, survivors,
compilation failure, before-tests. All thirteen logs preserved.

<a id="allocazioni-osservate"></a>

## Observed allocations

| Preallocated composition | Samples × cycles | Heap per sample | Exact sink |
|---|---:|---:|---:|
| One partition, two writers, capacity 3 | 5 × 4096 | 0 bytes | 9,246,720 |
| Four partitions, eight writers, capacity 3 | 5 × 4096 | 0 bytes | 12,797,952 |

Every cycle includes preallocated payload acceptance, publication,
claim, start, consumption, writer finish; measures handoff/ready-list
composition without attributing time to list alone.
Warmup 128/GC outside counter. Independent token
`27K²+154K+29` (210/1077), 13/49 API calls per cycle; identity/count/
status/cursor/generation checked. Expected sum also includes
4096 iteration indices.

Positive control detects 16,777,472 bytes in deliberately allocated
16 × 1 MiB. Zero counter baseline; wrong sink rejected, zero clock
distinct, partial reports/existing destinations preserved.
Startup/error conditions excluded; observed samples prove neither
universal nonallocation nor pool performance.

<a id="verifiche-integrate"></a>

## Integrated verification

`make check` on `fd96fb3` passes stable sources/exit 0:
257 tests of seven modules plus smoke (26 foundation, 17 codec,
51 execution, 44 storage, 18 I/O, 82 recovery, 19 WAL).
Forced compilation without warnings/style-warnings, lint 48 files,
zero violations, trace, links, evidence preservation/self-tests,
all ten correctness spikes. Full report
with original output [preserved](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-ready/check-integrato-processo.lisp)
with [spike master](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-ready-fd96-spikes/spikes.lisp),
compressed payload verified lossless. Editorial additions/final
report publication later receive link/evidence checks.
Verification concerns integration, without promoting engine gates.

After CBOR-header integration, `make check` on `201562d` passes
again, OK/STABLE/exit 0: 274 tests of eight modules plus smoke,
17 additional CBOR tests; lint 50 files without violations, all
other checks including ten spikes passed.
[Catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-ready/catalogo.lisp) preserves
final process/compressed spike master alongside first
integration. Code, ready tests, both tools identical
to version checked on `fd96fb3`; ASDF changes to register CBOR.
Coverage/mutations/allocations retain measurement base.

Concluding CSN-register integration on `33aa224` passes
294 tests of nine modules plus smoke (20 additional CSN), lint 52 files
without violations, all ten spikes. Process
OK/STABLE/exit 0; ASDF registers new module, ready sources/
tests/tools unchanged. Catalog also preserves check
and spike master; previous two checks separate.
Only later editorial closure receives link/evidence checks.

<a id="riproduzione-e-conservazione"></a>

## Reproduction and preservation

```sh
make test
sbcl --script tools/foundation-coverage.lisp --report directory-nuova/ execution
sbcl --script tools/writer-ready-mutation.lisp --self-test
sbcl --script tools/writer-ready-mutation.lisp --run altra-directory-nuova/
sbcl --script tools/writer-ready-bench.lisp --self-test
sbcl --script tools/writer-ready-bench.lisp --bench ulteriore-directory-nuova/
make check
```

To preserve command/environment/sources/full output, prefix command with
`sbcl --script tools/record-command.lisp --`.
[Catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-ready/catalogo.lisp)
preserves processes, raw coverage, baseline/all twelve mutant logs,
measurements, adapters, inspection probes. Both C4 tools fully compiled with
fatal warnings, FASL self-tests in separate private processes/caches.
[Review](writer-ready-revisione.md) distinguishes two C1 readings
and later integrated verification. Engine gates open.
