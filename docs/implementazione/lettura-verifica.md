<a id="verifica-ebr-e-compiti-di-lettura"></a>

# EBR and read task verification

The 2026-10-11 campaign checks the already implemented contracts for
[epochs and reclaim](epoche-e-reclaim.md) and [read tasks](compiti-lettura.md).
The product, APIs, and formats remain those of integrated base `2a0011f`.
The [preregistered method](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-reader-verification/metodo.lisp)
freezes 34 EBR cases, 30 read cases, and eight mutants before recorded
runs. The authors' exploratory checks are not qualified evidence.

<a id="casi-e-osservazioni"></a>

## Cases and observations

Epoch and identity expectations are independent lists and integers.
Suites observe public APIs; private images serve to preserve
state after rejection or for explicit FI on isolated fixtures.
Read tests use real CSN registries, snapshots, and epochs, original tokens,
and explicit logical times. Buffers have sentinels before and after the written field.

| Decisions | Planned witnesses |
|---|---|
| EBR-D01..D02 | Minimum/maximum capacities, rejections, counters, and epoch credits |
| EBR-D03..D04 | Zero/old identities, ticket reuse, metadata, and faulted state |
| EBR-D05..D08 | Exhausted generation/credit, duplicates, publication, and retained references |
| READ-D01 | Four residual words varied separately and residual snapshot |
| READ-D02..D03 | Zero generation, foreign registry, and valid binding |
| READ-D04 | Current read generation/CSN and retained buffer |
| Completion/abandonment | Ended or expired snapshot, regressed time, pin release, and irreversible fault |

Two real threads compete for the same claim; a reader completes with the
maintenance mutex owned by another thread. Migration completes
the first task, advances the epoch, and admits a second worker with its own
slot. Semaphores and joins have finite budgets, and no wait occurs in
an active read epoch. The expiration/reclaim sequence is a logical
interleaving among public APIs, distinct from internal races.

The independent reading confirms the partial mapping; out-of-range slots,
some metadata combinations, zero publication credit,
and slot-search anomalies remain. Strict threshold and exclusive claim are
additional checks, not MC/DC witnesses for EBR-D01..D08 decisions.

<a id="strumento-e-criteri"></a>

## Tool and criteria

The runner copies 26 product files and seven test files, uses private FASLs and
separate processes. Baseline must pass exactly all 64 names,
in EBR-then-read order. Each mutant runs only the named test:
detection requires exit 1 and runtime failure of that test. Compilation
warnings, signals, timeouts, and nonzero exit after `:complete` are worker
errors. Two real fixtures test SIGKILL 9 and exit 7 after completion;
the negative CLI check retains the COD-61 rejection as a failed outcome.

The `epochs` and `read` coverage scopes have separate directories and FASLs,
run their respective suites, and retain SB-COVER state and HTML. Numerators and denominators are reported below, with gaps.
INLINE expansion limits attribution of counters to original files.

<a id="risultati-locali-e-conservazione"></a>

## Local results and retention

The [full verification](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-reader-verification/verifica-completa.lisp)
at freeze `9d07fff` passes **724 tests plus smoke**, including 34 EBR cases and
30 read tasks, compiling without warnings. Traceability, links,
evidence retention, and existing SPK experiments pass.
The [mutation campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-reader-verification/mutazioni.lisp)
passes the exact baseline of 64 names in order and detects all eight
mutants in their respective runtime tests: exit 1, no signal, timeout,
or worker error. The four campaigns of real runner fixtures
retain SIGKILL 9 with observed exit 137 and exit 7 after `:complete`,
classified as `:worker-error`. The
[negative CLI](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-reader-verification/cli-negativo.lisp)
with `--invalid` remains `:failed`, exit 1, expected COD-61 rejection.

The first static fixture correction had introduced an extra
parenthesis. Initial runs remain failed: core exit 2,
mutation baseline exit 2 classified as compilation error, mutation
parent and coverage exit 1. The path with `.lisp` suffix was
accepted as a directory, and its baseline failure is not a
negative CLI check. The [preregistered correction](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-reader-verification/rettifica.lisp)
retains the original method and fixes only the syntax change before
reruns, without changing cases, mutants, or product. A second
reading checked syntax and worker properties on the corrected blob.

| SB-COVER scope | Expressions | Branches | Uncounted |
|---|---:|---:|---|
| EBR, six files | 651/838 (77.68%) | 85/110 (77.27%) | 187 expressions, 25 branches |
| Read, four files | 108/306 (35.29%) | 11/52 (21.15%) | 198 expressions, 41 branches |

The [EBR HTML](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-reader-verification/raw/reader-coverage-epochs-finale/cover-index.html)
and [read HTML](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-reader-verification/raw/reader-coverage-read-finale/cover-index.html)
agree with the details and annotated source bytes, according to
the [independent reading](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-reader-verification/copertura-revisione.lisp).
`epochs/read.lisp` shows 0/88 expressions and 0/10 branches even though tests
execute successful entries and exits: INLINE attribution prevents
interpreting these zeros as absence of API execution.

The [catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-reader-verification/catalogo.lisp)
uses LEAF names. The [copy audit](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-reader-verification/audit-copia.lisp)
checks raw bytes and SHA-256: runner, logs, source copies,
private FASLs, native descriptor/payload pairs, and losslessly compressed
SB-COVER states. Consultation references generated for compressed
records are explicitly declared; native records in the
`raw` groups retain original bytes, payload names, outcomes, and provenance.

<a id="limiti-e-ci"></a>

## Limits and CI

CI for the first published commit `00ce558` passed on Ubuntu and macOS,
as did documentation ([run 38135803760](https://github.com/gpicchiarelli/ArcDocDB/actions/runs/38135803760)).
CI for the subsequent integration is pending when local results are collected.
Decision mapping remains partial and
coverage does not measure MC/DC. Preregistration remains distinct from
actually observed outcomes.

Tests leave out the internal INLINE window, the entry point that
returns NIL after an epoch change, and internal cleanup interruption.
No attestation of weak memory, MC/DC, zero heap, latency, complete C1
qualification, or phase closure. GET, SegmentManager, durability, and crash
recovery require integration and further campaigns.

<a id="integrazione-con-hash-delle-chiavi"></a>

## Integration with key hashing

Before merging PR #8, the main branch advanced to `8101eb8`.
The [integration method](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-reader-verification/integrazione-metodo.lisp)
retains previous tests and preregisters a new full verification
of the common base. An independent reading confirms that the reader campaign's 26
product files, six test files, and mutator are
unchanged; ASD and coverage retain both branches'
suites and scopes. The [integrated results](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-reader-verification/integrazione-risultati.lisp)
confirm **770 tests plus two smoke checks**, 34 EBR cases and 30 read cases,
with stable sources. The coverage driver's self-test, real
reader and snapshot process fixtures, and ten SPK experiments pass;
original records and diagnostics are retained in the catalog.

The main branch then advanced to `96c0f4f` with the seven GET core files,
integrated without changing the reader campaign. The
[additional method](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-reader-verification/integrazione-get-metodo.lisp)
records compilation, existing suites, artifact checks, and new full CI
before merging. This update introduces no functional GET
tests and does not attest its qualification.
