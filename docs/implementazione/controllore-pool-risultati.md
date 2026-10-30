<a id="verifica-del-controllore-del-pool"></a>

# Pool-controller verification

C3 component calculates bounded target with integer EWMAs, AIMD, and
condition persistence. [Contract](controllore-pool.md),
[method](controllore-pool-metodo.md), [decisions](controllore-pool-decisioni.md),
[first reading](controllore-pool-revisione.md), and
[second reading](controllore-pool-revisione-2.md) delimit verification.
Frozen campaign base `4344d9e1f2ceb45e5fa3d5076b57d09505e69ac3`.

<a id="campagna-congelata"></a>

## Frozen campaign

All positive outcomes OK/STABLE/exit 0 over 740 unchanged sources and documents
in frozen copy. Original-byte catalog:
[`2026-10-13-pool-controller`](https://github.com/gpicchiarelli/ArcDocDB/tree/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-controller/).
Both readings and preregistration precede processes.

| Process | Record | Outcome |
|---|---|---|
| Coverage and 23 fixtures | `4000906285-command-38489-0` | 344/348 expressions, 50/50 branches |
| Sensor compilation and self-test | `4000906285-command-38487-0` | OK; positive checks and expected rejections |
| Five measurement replicates | `4000906340-command-39064-0` | OK; zero heap bytes in every replicate |
| General check | `4000906339-command-39039-0` | OK; 998 named tests and 2 smoke tests |

General check takes 200.078223 s: includes build, lint and self-test,
snapshot/reader runner self-tests, traceability, links,
evidence self-tests, catalogs, and ten F0 experiments. 460160 stderr bytes
are compilation notes: build treats warnings and style-warnings
as errors. Ten experiments COMPLETE, preserved with
raw data including master `4000906505-check-41362-0`. Check duration
not hot-path measurement.

<a id="copertura-completa-del-package"></a>

## Complete package coverage

| File | Hit/total expressions | Hit/total branches |
|---|---:|---:|
| package | 1/1 | 0/0 |
| types, including generated helpers | 25/25 | 10/10 |
| build | 74/78 | 4/4 |
| read | 46/46 | 10/10 |
| policy | 93/93 | 16/16 |
| update | 105/105 | 10/10 |
| Total | 344/348, 98.85% | 50/50, 100% |

Native and HTML agree for all six files. Four missing build
expressions remain in denominator: native indexes 78..81, paths
`(2 2 5)`, `(5 2 5)`, `(6 2 5)`, `(7 2 5)`, factory optional-argument
initializers. C3 minimum 95% passed without
exclusions; MC/DC not inferred from counts. Reader compiles
without warnings and verifies positive, negative, and exact-threshold fixtures.
Nine original qualification artifacts — native state, audit,
index, and six pages — preserved in
[qualified bundle](https://github.com/gpicchiarelli/ArcDocDB/tree/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-pool-controller/qualified-coverage/),
with full text, SHA256, bytes, and Git blob per file.

<a id="misura-del-percorso-normale"></a>

## Normal-path measurement

Each replicate uses 4096 cycles with 128 warmup cycles. One cycle includes
160 grow/shrink updates and respective getters, plus two update/read pairs
for pending and hold. Expectations for seven outputs and target come
from oracle computed before measurement. Full GC and startup outside
measured slice; complete result verification inside slice.

| Replicate | Raw ticks | Seconds | Heap bytes |
|---|---:|---:|---:|
| 0 | 83427 | 0.083427 | 0 |
| 1 | 82384 | 0.082384 | 0 |
| 2 | 85044 | 0.085044 | 0 |
| 3 | 82709 | 0.082709 | 0 |
| 4 | 85129 | 0.085129 | 0 |

SBCL 2.6.9, ARM64, Apple M4; external load uncontrolled. Self-test
detects 16777472 bytes deliberate allocation, rejects incorrect sinks and
targets, distinguishes below-resolution clock from numeric duration, and
preserves partial result and preceding samples after error. Measurement
attests these post-startup paths, not universal nonallocation.

<a id="tentativi-preliminari"></a>

## Preliminary attempts

Initial functional tests pass; coverage attempts
revealed two method problems: loss of loading marks after
GC and failure to exercise generated EQUALP comparison. Runner
preserves startup using SAVE-COVERAGE after each load.
Fixtures check equal objects and field differences. All preceding
counts, including below-C3-minimum counts, remain failed attempts.
Direct-source-loading experiment not adopted.
First general check (`4000906285-command-38488-0`)
FAILED/STABLE/exit 2 before compilation due to relative path
in cache configuration. Record preserves original diagnosis;
second process uses absolute path and does not rewrite outcome.

<a id="integrazione-e-conservazione"></a>

## Integration and preservation

Component commit `b984e3d` integrated with `main` at
`3106a498d10b7d876ce62f02afc3bd87f1bdeaa8`, in merge `6aca985`.
Both changelog entries preserved; six controller
sources and 23 fixtures remain qualified versions.

| Combined-version check | Record | Outcome |
|---|---|---|
| Fatal-warning build and all tests | `4000907488-command-66476-0` | OK; 994 named tests and 2 smoke tests |
| Lint | `4000907488-command-66477-0` | OK; 171 files, zero violations |
| Traceability | `4000907488-command-66478-0` | OK; 117 requirements, 65 invariants, 13 FI, 52 ADRs |
| Links | `4000907488-command-66479-0` | OK; 2614 links, zero broken |
| Preserved catalogs and evidence | `4000907488-command-66482-0` | OK |

All processes STABLE/exit 0 over 743 sources and documents.
Combined build takes 25.170712 s. General-check named-test total
also includes tool self-tests external to build;
both counts do not describe different controller suites.

Publisher `4000906724-command-45635-0` preserves original bytes and
compressed payloads without changing outcomes. Self-test
`4000907085-command-56510-0` passes eight checks: positive copy,
existing-destination rejection with unchanged bytes, raw inventory,
explicit FASL exclusion, unknown-extension rejection, and
invalid-plan rejection before writes. Subsequent
`4000907539-command-68065-0` preserves these records and static checks.

Independent check compares bytes, SHA256, and Git blobs of first manifest's
50 entries, plus reader validity: zero problems.
Original audit print incorrectly shows 1/50 for list destructively
reversed after saving; original report
contains all 50 proofs. Script, original output, and corrected projection
preserved together without rewriting attempt.
Bundles distinguish frozen sources, final documents, and integrated
version; each new seal adds exclusive manifest.

Subsequent PR #10 integration, `baaa68c636e0be84854af2e5d12a01dab0cf80cb`,
adds 42 OUTCOME fixtures without changing product code.
Merge `1b9fe8062fcd944b560638ece288225d3d5843cd` passes fatal-warning build
again: record `4000907892-command-73441-0`, 1036 named tests
and two smoke tests, 24.306801 s. Record `4000907893-command-73469-0` verifies
lint, traceability, and 2642 links without errors. Both OK/STABLE/exit 0
over 750 sources and documents. Controller coverage and measurements
remain frozen campaign's, with unchanged sources.
Post-merge catalogs also pass: record
`4000908000-command-75169-0`, OK/STABLE/exit 0 over 750 sources and documents.

<a id="limiti"></a>

## Limits

Initial thresholds not calibrated to database load. Measurement
concerns target calculation with injected time and samples: verifies neither
throughput, engine P99, real sensors, fairness, nor feedback stability.
If actual does not reach target, controller stays pending even when
P99 worsens. Actuator revocation, expiry, and rejection future work.
Startup, park/wake without lost notifications, admission, retirement, shutdown,
I/O pool, and Archivio coordinator remain open; REQ-THR-001 and other
global requirements retain designed state.
