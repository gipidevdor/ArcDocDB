<a id="wal-e-csn-risultati-della-campagna-locale"></a>

# WAL and CSN: local campaign results

Date: 2026-10-09. Integrated code `ded5b1f8ed591fb893405e5241341879f91ccb0f`;
includes writer recycling added to main with `75ada9d` and structural
CBOR scanning integrated with `e4fa110`. The WAL–CSN product retains
the independent review's fingerprints.
[Contract](wal-csn.md), [preregistered method](wal-csn-metodo.md),
[decisions](wal-csn-decisioni.md), [two C1 readings](wal-csn-revisione.md).
Whole-engine requirements retain designed status.

<a id="correttezza-e-controlli"></a>

## Correctness and checks

Integrated verification passes **364 tests plus two smoke tests**, compilation without
warning/style-warning, lint and self-test, trace, links, evidence
retention, and ten correctness spikes. Breakdown: 28 foundation, 17 UTF-8,
17 CBOR header, 24 CBOR structure, 20 CSN, 66 writer, 44 storage, 18 I/O,
82 recovery, and 48 WAL.

The new contribution includes two word-based codec tests, 25 bridge tests,
and four fault/concurrency tests. Oracles include independent bytewise packing and
bitwise CRC, complete rejection images, v1/v2 comparison with
the previous format, and mathematical registry frontiers. Checks cover
carry, maximum u64, no wrap, stale events, different registry with
numerically equal token, wrong log, busy/full, publication distinct
from flush, premature reuse, partial append, and failed flush.

Four real Serie share K=3 and complete **500 cycles each**.
The first wave forces saturation; after each cycle the buffer is reused.
All 2000 CSNs are unique and consecutive, fixture effects precede
resolution, and H converges to the last CSN, crossing a high carry.
Retries and deadlines belong to the harness, not the product.

Four compilable mutants are detected by the four planned tests:
omitted high word, reuse with pending token, resolution as
published after log fault, transfer to another log with the same ID.
Baseline passes before mutants. Compilation failure, timeout, or error
outside the expected test invalidates the test; these do not count as kills.

| Measured file | Expressions | Branches |
|---|---:|---:|
| `src/wal/csn.lisp` | 231/242, 95.5% | 40/40, 100% |
| `src/wal/builder.lisp` | 302/322, 93.8% | 38/40, 95% |
| `src/foundation/record.lisp` | 670/744, 90.1% | 75/76, 98.7% |

HTML reports and raw SB-COVER state are retained:
[WAL](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-wal-csn/wal-csn-coverage-05/cover-index.html)
and [codec](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-wal-csn/wal-csn-coverage-foundation-02/cover-index.html).
The 100% concerns
bridge branches: it is not MC/DC, full WAL coverage, or engine qualification.

<a id="prestazioni-del-ciclo-simulato"></a>

## Simulated cycle performance

Apple M4 ARM64, 16 GiB, SBCL 2.6.9, Darwin 27.0.0; safety 3.
One cycle includes a PUT with 16-byte key and 64-byte value,
CSN and SEAL, one-batch group, simulated append/flush, CAS publication
of a preallocated descriptor, resolution, and reuse. Total 160 bytes per cycle.
Registry K=256; maximum u64 file-id. Oracles remain active in the cycle.

Three successful invocations are retained. Each runs ten serial
windows and nine parallel replicates. **All thirty serial windows observe
zero heap bytes**. Empty control observes zero; the final campaign's
positive control observes 16,777,472 bytes for sixteen live 1 MiB arrays.
Invalid time, nonzero heap, and missing metric are rejected by self-test.
Metrics are also checked after saving and rereading.

Third invocation medians, on the checkout integrated with CBOR structure:

| Scenario | Replicates | Cycles/s |
|---|---:|---:|
| Zero CSN base | 5 | 470,289 |
| High base with carry at sixteenth cycle | 5 | 471,109 |
| One worker, private registry/log | 3 | 470,688 |
| Two workers, independent registries/logs | 3 | 907,050 |
| Four workers, independent registries/logs | 3 | 1,719,321 |

Each window runs 20,000 cycles; final serial windows last at least 42,363 ticks
with a 1,000,000 tick/s timer. Busy, full, and retry are zero in parallel.
Shared-Archivio contention is checked by the separate test, not by
these cross-Archivio scalability measurements.

Parallel heap is observational and process-global, with start/join:
65,520 bytes in the three one-worker replicates, 131,040 in the three two-worker,
and 262,080 in the three four-worker. Worker windows overlap and are not
summed. These bytes are not attributed to an individual cycle or worker.
The zero-heap gate concerns successful serial windows. Errors and contention
may allocate conditions; no promise of absolute absence of heap.

Backend and publication are fixtures: no measurement of NVMe, real durability,
client latency, or database throughput. External load is
uncontrolled; this is not a soak campaign or platform qualification.

<a id="diagnostici-conservati-e-correzioni-c4"></a>

## Retained diagnostics and C4 corrections

The first build rejected an extra parenthesis in the new FI test:
corrected in `3c564f5`, then build succeeded. The attempt retains source and diagnostic.

The first parallel coverage campaign detected an ASDF cache
collision: the previous root-only mapping did not cover descendant files.
The first mutant baseline detected a missing probe FASL directory.
`522172d` introduces recursive wildcards, destination verification, and explicit
directory creation. Corrected campaigns have separate caches and pass.
Pre-fix tests remain historical observations; isolation claimed
by old tool invocations is not retroactively attested.

The first collection summary showed counts of one after `nreverse`,
despite saving the full catalog. The next version counts from the
reread catalog and adds a 3/2 self-test. Both sources are
retained. This correction concerns the summary, not test results.

Collection v3 retains the original coverage and mutant file hierarchy,
so HTML index relative links remain navigable. Transfer
checks sizes and SHA256 before and after moving, without duplicating
payloads; publication rejects missing HTML links. Initial self-test
rejected an unavailable UIOP symbol: source and diagnostic are
retained. Corrected version uses Common Lisp I/O and passes nine checks,
including hierarchy, unchanged bytes, and rejection of a missing link.

The Git whitespace check extended to records reports trailing spaces
in raw SBCL output. The finding is retained; output remains identical.
Whitespace checking on code and documentation excludes test
archives, which are checked through sizes, reading, and fingerprints.

<a id="conservazione-e-prossima-integrazione"></a>

## Retention and next integration

The [structured catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-wal-csn/catalogo.lisp)
retains argv, environment, HEAD, before/after fingerprints, raw stdout/stderr,
exit codes, failures, self-tests, samples, and coverage reports.
Sources for concrete mutants and C4 adapters are retained.
Large spike logs are compressed losslessly; no output
is cut to obtain a small file. FASLs and complete copies reconstructible
from Git source and exact substitutions remain outside the repository.

The Serie controller remains to be connected: validate the event before
publication, retain outcome on busy, apply fail-stop and quiescence,
respect order and acknowledgments. Index, snapshots, and multiseries coordinator
are not implemented by this bridge.
