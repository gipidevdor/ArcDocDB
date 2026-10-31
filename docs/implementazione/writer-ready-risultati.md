<a id="risultati-della-lista-dei-writer-pronti"></a>

# Ready-writer list results

Local campaigns 2026-10-09, initial base `92d8b0e`, macOS ARM64/Apple M4,
SBCL 2.6.9, safety 3. Integrated checks first use `fd96fb3` (manifest),
then `201562d` (CBOR header), `33aa224` (CSN register), other-chat contributions.
Both ready sources, tests, and benchmark are
identical; ASDF integrates components, and the mutation runner is
strengthened. Every record retains its own version; external load is
uncontrolled.
[Contract](writer-ready.md) preserves obligation-transport boundaries.

<a id="correttezza-e-fault-injection"></a>

## Correctness and fault injection

On the initial base, forced build/full suite without warnings/style-warnings: 237 tests
of seven modules plus smoke, 51 execution (34 previous, 17 new).
FIFO-list/cursor oracle checks 9000 steps over nine configurations,
eleven reused writers, pending obligations on full, completion before
reuse. Default limit uses 1025 distinct writers; the rejected
reference is retained/published after drain.

Tests cover wrap, capacity/input, rotation, 24 busy/cursor patterns,
seven inconsistent ring shapes, invalid arrays/slots/payloads, helpers called
without guard/by another thread. Private FI/opaque duplicate-ring fixture
remain distinct from public oracles with legal obligations.

Four real threads are reused over six waves/36 payloads: producers
remain alive during consumption, one consumer completes slices while
another Serie's partition is occupied. Two additional contending
consumers reused over eight waves take one reference per
wave. Payload/CRC checks are outside list guards;
semaphores/retries/joins belong to the harness with explicit bounds.
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

The initial campaign has a successful execution baseline of 51. Twelve mutants compile and are detected;
zero survivors, compilation failure, before-tests. Preregistered set
checks FIFO, wrap, full, count, freed slot, release, busy, last
partition, cursor; not all possible defects.

Integration distinguishes test-detected error from process
failure: OS signal or nonzero exit after real completion
is `:worker-error`. The self-test uses its own SIGKILLed child,
preserving exit/signal/log/report. The previous campaign/tool
version is preserved; the twelve mutants are unchanged.
Repeat on `fd96fb3` passes baseline 51 and 12/12 detections,
exit 1/signal NIL per mutant; zero worker errors, survivors,
compilation failure, before-tests. All thirteen logs are preserved.

<a id="allocazioni-osservate"></a>

## Observed allocations

| Preallocated composition | Samples × cycles | Heap per sample | Exact sink |
|---|---:|---:|---:|
| One partition, two writers, capacity 3 | 5 × 4096 | 0 bytes | 9,246,720 |
| Four partitions, eight writers, capacity 3 | 5 × 4096 | 0 bytes | 12,797,952 |

Every cycle includes preallocated payload acceptance, publication,
claim, start, consumption, writer finish; it measures the handoff/ready-list
composition without attributing time to the list alone.
Warmup 128/GC outside counter. Independent token
`27K²+154K+29` (210/1077), 13/49 API calls per cycle; identity/count/
status/cursor/generation are checked. Expected sum also includes
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
all ten correctness spikes. The full report
with original output is [preserved](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-ready/check-integrato-processo.lisp)
with [spike master](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-ready-fd96-spikes/spikes.lisp),
the compressed payload is verified lossless. Editorial additions/final
report publication later receive link/evidence checks.
Verification concerns integration, without promoting engine gates.

After CBOR-header integration, `make check` on `201562d` passes
again, OK/STABLE/exit 0: 274 tests of eight modules plus smoke,
17 additional CBOR tests; lint 50 files without violations, all
other checks including ten spikes passed.
[Catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-ready/catalogo.lisp) preserves
final process/compressed spike master alongside first
integration. Code, ready tests, and both tools are identical
to the version checked on `fd96fb3`; ASDF changes to register CBOR.
Coverage/mutations/allocations retain their measurement base.

Concluding CSN-register integration on `33aa224` passes
294 tests of nine modules plus smoke (20 additional CSN), lint 52 files
without violations, all ten spikes. Process
OK/STABLE/exit 0; ASDF registers the new module, and ready sources/
tests/tools are unchanged. The catalog also preserves the check
and spike master; the previous two checks remain separate.
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

To preserve command/environment/sources/full output, prefix the command with
`sbcl --script tools/record-command.lisp --`.
[Catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-ready/catalogo.lisp)
preserves processes, raw coverage, baseline/all twelve mutant logs,
measurements, adapters, inspection probes. Both C4 tools are fully compiled with
fatal warnings, FASL self-tests in separate private processes/caches.
[Review](writer-ready-revisione.md) distinguishes two C1 readings
and later integrated verification. Engine gates remain open.
