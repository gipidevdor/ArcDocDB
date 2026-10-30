<a id="esiti-dei-processi-nelle-mutazioni-cbor"></a>

# Process outcomes in CBOR mutations

CBOR header/structure runners must distinguish mutant rejection
from errors in process running tests. Review of
2026-10-09 found two false detections: nonzero exit after exact
build-completion line counted as detected mutant; result
transport lost operating-system signal.

Catalog remains 9 header mutants, 10 structure mutants.
Correction concerns verification tools, no codec changes.
Previous campaigns retain original bytes/states.

Classification follows this order:

1. Operating-system signal produces `:worker-error`.
2. Nonzero exit after exact completion produces `:worker-error`.
3. Compilation error or incomplete run without valid smoke
   remains invalid verification.
4. Zero exit requires exact smoke/completion to establish
   mutant survival.
5. Normal runtime error after smoke/before completion establishes
   mutant detection.

Baseline must finish without signal, code zero, both exact
markers. Baseline/mutants separately retain exit code/signal.
Startup/transport errors are worker errors.
Counters/campaign outcome do not turn these errors into
 detections. Applicable rules COD-60/COD-61 of
[coding standard](../affidabilita/standard-di-codifica.md).

<a id="metodo-registrato-prima-delle-esecuzioni"></a>

## Method registered before executions

Each runner has two real fixtures using same transport
as campaign: child writes smoke, flushes output, sends SIGKILL
to own PID; another writes smoke/completion then exits code 7.
Both must be `:worker-error`, without detection. Self-tests
also check precedence, baselines, LF/CRLF markers, rejecting
quotations/extra text on same line.

After both files reviewed, sources/Git index
frozen during every recorded execution. Run both `--self-test`,
then both full campaigns and `make check-core`. Campaigns may
run in parallel in independent directories/copies; each catalog
runs serially. Preserve command records, reports,
generated runners/original logs, including fixtures repeated by `--run`.
Evidence catalog checks data presence/size/integrity.
Two `--invalid` invocations also check COD-61: each process
must fail nonzero with file/rule diagnostic.
Negative-check records retain `:failed` status.

Tests verify runner reliability. Do not repeat codec benchmarks/
coverage or approve new C1 conditions, MC/DC, engine
qualifications.

<a id="risultati-osservati"></a>

## Observed results

Both self-tests/full campaigns succeeded with stable source
hashes. Baselines complete 377 tests plus smoke without signals/
warnings; campaigns detect all 9 header/10 structure
mutants, zero worker errors. `make check-core` additionally completes
lint, traceability, links, evidence checks, ten spikes.

Four fixture executions, including campaign repetitions,
retain SIGKILL as exit 137 / signal 9, postcompletion failure
as exit 7 / signal nil: always `:worker-error`, never `:detected`.
Structure fixtures also preserve injected baseline copy/transport
rejections with unobserved code/signal, logs, counters.
Both CLIs reject `--invalid` exit 1, file/COD-61
diagnostic; both records `:failed` as method requires.

[Catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-cbor-mutation-signals/catalogo.lisp)
preserves commands, C4 readings, reports, original log/runner bytes.
No automatic campaign-process timeout imposed.

<a id="metodo-della-nuova-integrazione-con-cbor-minimo"></a>

## New minimal-CBOR integration method

Main `e07d772` adds minimal CBOR profile/15 tests. Its
mutation runner has same two defects as other tools:
new C4 correction affects runner only. Codec, formats,
product tests introduced by main unchanged. Header/structure
runners retain previous revision hashes.

[New integration method](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-cbor-mutation-signals-integration/metodo.lisp)
registered before new execution. After freeze/C4 reading,
plan `--self-test`/`--invalid` on minimal runner, three full campaigns
in new independent directories, `make check-core`, final
`make evidence trace links` after evidence preservation.
Expected counts 8 minimal mutants, 9 headers, 10
structure, 392 tests plus smoke: forecasts, not observed outcomes.

Every `--run` repeats self-test with two real child processes.
Preserve exit/signal/counters/reports/logs/runners for fixtures/
campaigns. Negative CLI check must stay `:failed` with
file/COD-61 diagnostic. Every command recorded with
actual arguments/environment/output/hashes; no source/Git index
may change during execution.

New catalog will use artifact names only at dated-folder
level, preserving native-record bytes/gzip payload names.
Previous observed 377-test snapshot remains original. No
repeat coverage/benchmarks or approval of C1, MC/DC, full recovery,
engine qualification. Workers remain without automatic timeout.

<a id="risultati-osservati-della-nuova-integrazione"></a>

## Observed new-integration results

Minimal runner self-test succeeded; `--invalid` successful negative
check retaining original `:failed`, exit 1, file/COD-61
 diagnostic. Three full campaigns detect 9 header,
10 structure, 8 minimal mutants, zero worker errors. Baselines
complete 392 tests plus smoke, zero exit, no signal, exact
completion. Six commands retain stable source hashes.

New `make check-core` completes 392 tests plus smoke/ten spikes.
SPK-07 original status stays `:pass`; other nine retain `:ok`,
global report `:complete`. Four fixture executions,
including self-tests repeated by three `--run` calls, retain eight child
processes: SIGKILL exit 137 / signal 9 or exit 7 / signal nil after
completion, always `:worker-error`, never `:detected`. Injected
baseline rejections retain original reports/logs/counters.

[Integrated catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-cbor-mutation-signals-integration/catalogo.lisp)
preserves native records/gzip payloads with unchanged bytes, reports/logs,
runners from three campaigns/four fixtures, two minimal-profile C4
readings, independent result audits. Final evidence,
traceability/link check recorded after publication.
Previous 377-test snapshot stays in original catalog;
no coverage measurement, benchmark, engine qualification added.

<a id="metodo-dellintegrazione-con-controller-series-e-wal"></a>

## Integration method with Series controller and WAL

Main `1cb968d` integrated after publication `bffbdd0`.
[Preregistered method](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-cbor-mutation-signals-series-integration/metodo.lisp)
plans only new `make check-core`, final
`make evidence trace links` after evidence preservation, CI
on exact published commit. Independent comparison must confirm
three CBOR runners/target codecs unchanged.

Expected outcomes zero exit/stable source hashes; new
 test count derived from actual output. Expectations to
verify, not already observed outcomes. Sources/docs/index
frozen during each recorded command.

New catalog keeps only LEAF names in dated folder:
core/final-check records and preservation, ten spikes,
global report with original payloads, method, summary, impact
comparison, native-byte audit. Earlier 377/
392-test snapshots, including 27 CBOR mutations observed on main `e07d772`,
remain original. Step does not repeat mutation campaigns,
fixtures, coverage, benchmarks or add engine qualifications.

<a id="integrazione-delle-serie-e-memoria-del-checker"></a>

## Serie integration and checker memory

Base `1cb968d` adds Serie controller/WAL changes.
Recorded full verification passes 436 tests plus smoke/ten spikes.
Anchors, tests, three CBOR runners unchanged; copier includes
all new components. 27 mutations remain evidence of
`e07d772` snapshot in previous catalog.

Linux CI of commit `bffbdd0` also completes 436 tests then exhausts
heap reading historical archive in evidence checker. Record
retains `:failed`. [Additional method](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-cbor-mutation-signals-series-integration/heap-method.lisp)
records correction before verification: only `evidence` recipe
uses 2048 MiB configurable through `EVIDENCE_DYNAMIC_SPACE_SIZE`. Product,
parser, file limits unchanged. Recorded verification/CI
on new commit must confirm configuration result.

[Integrated-evidence catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-cbor-mutation-signals-series-integration/catalogo.lisp)
preserves original records, including Linux failure, byte
comparison. No benchmarks, coverage, CBOR campaigns repeated.
