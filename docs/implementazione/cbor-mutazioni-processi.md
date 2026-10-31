<a id="esiti-dei-processi-nelle-mutazioni-cbor"></a>

# Process outcomes in CBOR mutations

CBOR header/structure runners must distinguish mutant rejection
from errors in the process running the tests. The review on
2026-10-09 found two false detections: a nonzero exit after the exact
build-completion line was counted as a detected mutant, and result
transport lost the operating-system signal.

The catalog still contains 9 header mutants and 10 structure mutants.
The correction concerns verification tools; no codec changes are made.
Previous campaigns retain their original bytes and states.

Classification follows this order:

1. An operating-system signal produces `:worker-error`.
2. A nonzero exit after exact completion produces `:worker-error`.
3. A compilation error or incomplete run without a valid smoke marker
   remains invalid verification.
4. A zero exit requires exact smoke/completion markers to establish
   mutant survival.
5. A normal runtime error after smoke and before completion establishes
   mutant detection.

The baseline must finish without a signal, with exit code zero and both exact
markers. Baseline and mutants separately retain exit code and signal.
Startup/transport errors are worker errors.
Counters and the campaign outcome do not turn these errors into
detections. The applicable rules are COD-60/COD-61 of the
[coding standard](../affidabilita/standard-di-codifica.md).

<a id="metodo-registrato-prima-delle-esecuzioni"></a>

## Method registered before executions

Each runner has two real fixtures using the same transport
as the campaign: one child writes smoke, flushes output, and sends SIGKILL
to its own PID; another writes smoke/completion and then exits with code 7.
Both must be `:worker-error`, without detection. Self-tests
also check precedence, baselines, and LF/CRLF markers, rejecting
quotations or extra text on the same line.

After both files are reviewed, sources and the Git index remain
frozen during every recorded execution. Run both `--self-test` commands,
then both full campaigns and `make check-core`. Campaigns may
run in parallel in independent directories/copies; each catalog
runs serially. Preserve command records, reports,
and generated runners/original logs, including fixtures repeated by `--run`.
The evidence catalog checks data presence, size, and integrity.
Two `--invalid` invocations also check COD-61: each process
must fail with a nonzero exit code and a file/rule diagnostic.
Negative-check records retain `:failed` status.

These tests verify runner reliability. They do not repeat codec benchmarks or
coverage measurements, or approve new C1 conditions, MC/DC, or engine
qualifications.

<a id="risultati-osservati"></a>

## Observed results

Both self-tests and full campaigns succeeded with stable source
hashes. Baselines complete 377 tests plus smoke without signals or
warnings; campaigns detect all 9 header and 10 structure
mutants, with zero worker errors. `make check-core` additionally completes
lint, traceability, links, evidence checks, and ten spikes.

Four fixture executions, including campaign repetitions,
retain SIGKILL as exit 137 / signal 9 and postcompletion failure
as exit 7 / signal nil: always `:worker-error`, never `:detected`.
Structure fixtures also preserve injected baseline copy/transport
rejections with unobserved code/signal, logs, and counters.
Both CLIs reject `--invalid` with exit 1 and a file/COD-61
diagnostic; both records are `:failed`, as the method requires.

The [catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-cbor-mutation-signals/catalogo.lisp)
preserves commands, C4 readings, reports, and original log/runner bytes.
No automatic campaign-process timeout is imposed.

<a id="metodo-della-nuova-integrazione-con-cbor-minimo"></a>

## New minimal-CBOR integration method

Main `e07d772` adds the minimal CBOR profile and 15 tests. Its
mutation runner has the same two defects as the other tools:
the new C4 correction affects the runner only. The codec, formats, and
product tests introduced by main remain unchanged. Header/structure
runners retain their previous revision hashes.

The [new integration method](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-cbor-mutation-signals-integration/metodo.lisp)
is registered before the new execution. After freeze and C4 reading,
the plan calls for `--self-test`/`--invalid` on the minimal runner, three full campaigns
in new independent directories, `make check-core`, and a final
`make evidence trace links` after evidence preservation.
Expected counts are 8 minimal mutants, 9 headers, 10
structure mutants, and 392 tests plus smoke: forecasts, not observed outcomes.

Every `--run` repeats the self-test with two real child processes.
Preserve exit/signal/counters/reports/logs/runners for fixtures and
campaigns. The negative CLI check must stay `:failed` with a
file/COD-61 diagnostic. Every command is recorded with its
actual arguments/environment/output/hashes; no source file or Git index
may change during execution.

The new catalog will use artifact names only at the dated-folder
level, preserving native-record bytes and gzip payload names.
The previously observed 377-test snapshot remains unchanged. This step does not
repeat coverage measurements or benchmarks, or approve C1, MC/DC, full recovery, or
engine qualification. Workers still have no automatic timeout.

<a id="risultati-osservati-della-nuova-integrazione"></a>

## Observed new-integration results

The minimal runner self-test succeeded; `--invalid` is a successful negative
check retaining the original `:failed` status, exit 1, and file/COD-61
diagnostic. Three full campaigns detect 9 header,
10 structure, and 8 minimal mutants, with zero worker errors. Baselines
complete 392 tests plus smoke, with exit zero, no signal, and exact
completion. Six commands retain stable source hashes.

The new `make check-core` completes 392 tests plus smoke and ten spikes.
SPK-07 retains its original `:pass` status; the other nine retain `:ok`,
and the global report is `:complete`. Four fixture executions,
including self-tests repeated by three `--run` calls, retain eight child
processes: SIGKILL exit 137 / signal 9 or exit 7 / signal nil after
completion, always `:worker-error`, never `:detected`. Injected
baseline rejections retain original reports/logs/counters.

The [integrated catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-cbor-mutation-signals-integration/catalogo.lisp)
preserves native records/gzip payloads with unchanged bytes, reports/logs,
runners from three campaigns/four fixtures, two minimal-profile C4
readings, and independent result audits. The final evidence,
traceability, and link check is recorded after publication.
The previous 377-test snapshot stays in the original catalog;
no coverage measurement, benchmark, or engine qualification is added.

<a id="metodo-dellintegrazione-con-controller-series-e-wal"></a>

<a id="integration-method-with-series-controller-and-wal"></a>

## Integration method with the Serie controller and WAL

Main `1cb968d` is integrated after publication `bffbdd0`.
The [preregistered method](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-cbor-mutation-signals-series-integration/metodo.lisp)
plans only a new `make check-core`, a final
`make evidence trace links` after evidence preservation, and CI
on the exact published commit. Independent comparison must confirm that the
three CBOR runners and target codecs are unchanged.

Expected outcomes are exit zero and stable source hashes; the new
test count is derived from actual output. These are expectations to
verify, not already observed outcomes. Sources, documents, and the index remain
frozen during each recorded command.

The new catalog keeps only LEAF names in the dated folder:
core/final-check records and preservation, ten spikes,
the global report with original payloads, method, summary, impact
comparison, and native-byte audit. Earlier 377/
392-test snapshots, including 27 CBOR mutations observed on main `e07d772`,
remain unchanged. This step does not repeat mutation campaigns,
fixtures, coverage, or benchmarks, or add engine qualifications.

<a id="integrazione-delle-serie-e-memoria-del-checker"></a>

## Serie integration and checker memory

Base `1cb968d` adds Serie controller/WAL changes.
Recorded full verification passes 436 tests plus smoke and ten spikes.
Anchors, tests, and the three CBOR runners remain unchanged; the copier includes
all new components. The 27 mutations remain evidence of the
`e07d772` snapshot in the previous catalog.

Linux CI of commit `bffbdd0` also completes 436 tests, then exhausts
heap while reading the historical archive in the evidence checker. The record
retains `:failed`. The [additional method](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-cbor-mutation-signals-series-integration/heap-method.lisp)
records the correction before verification: only the `evidence` recipe
uses 2048 MiB, configurable through `EVIDENCE_DYNAMIC_SPACE_SIZE`. The product,
parser, and file limits remain unchanged. Recorded verification and CI
on the new commit must confirm the configuration result.

The [integrated-evidence catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-cbor-mutation-signals-series-integration/catalogo.lisp)
preserves original records, including the Linux failure and byte
comparison. No benchmarks, coverage measurements, or CBOR campaigns are repeated.
