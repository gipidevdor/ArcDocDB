<a id="verifica-parallela-dei-cataloghi"></a>

# Parallel catalog verification

`tools/check-evidence.lisp` is C4 tool for REQ-VAL-001 and
REQ-AFF-012. Checks structure, presence, size, integrity of
compressed evidence. Closed-inventory verification remains with
`tools/check-command-archive.lisp`.

<a id="contratto-e-risorse"></a>

## Contract and resources

Global size check remains serial, before catalog
reading. Catalogs follow `directory` order;
each retains entry order and `:artifact`,
`:original`, `:process-artifact` key order. Repeated references also read
and counted each time. Preserved results not interpreted.

`--jobs 1` uses direct serial path. With `--jobs 2..4`, each
catalog verified in separate SBCL process. Results reduced
by index after process collection; first failed catalog
in serial order determines rejection regardless of completion
order. Original diagnostics preserved; parent condition
identifies catalog. No failed-catalog retry in parent
or conversion of failure into success.

Defaults: four processes, 300 seconds per catalog, 2048 MiB
heap per process. Heap limit applies separately per worker:
four may thus use 8192 MiB total heap,
beyond parent, stacks, native utilities. Parent does not read
expanded records. Serial mode available on lower-RAM machines.
`EVIDENCE_JOBS`, `EVIDENCE_WORKER_SECONDS`,
`EVIDENCE_DYNAMIC_SPACE_SIZE` configure `make evidence`.

Worker creates private POSIX session, publishes marker before
gzip/SHA-256 utilities. Covers distinct groups created
by `run-program` on Darwin/Linux too. On expiry or abnormal exit,
parent enumerates only owned session's PIDs, terminates them,
collects child within additional five-second bound. Forced
collection of `ps`, if needed, has additional one-second margin;
cleanup error always prevents success. Grandchildren termination
observed, reap applies to direct child only.
Enumeration requires `ps` snapshot ending exit zero, no signal/
diagnostic, positive PIDs, parent present: may retry
up to three times within same deadline. Failed/incomplete snapshot
never proves no processes; stdout/stderr/state
of every attempt preserved beside worker logs.
Only invalid snapshots retried. Startup, I/O,
cleanup, timeout errors propagate without becoming new scan.
Even after serious cleanup condition, other workers'
closures attempted; all faults contribute to final rejection.
Logs/temporary files belong to
exclusive directory under `spikes/out/evidence-check-*`, preserved even
on error. Malformed protocol, signal, inconsistent exit
cannot produce success.

Evidence directory must remain unchanged during verification.
`make -j check-core` not supported way to obtain parallelism:
some self-tests deliberately introduce over-budget files in
same tree. Parallelism internal only to catalog-reading
phase, after global size check.

<a id="verifica"></a>

## Verification

`--self-test` exercises fixtures separate from published catalogs,
part of `make evidence-selftest`. Includes serial/parallel equivalence,
rejection order, reference counts, argument bounds,
protocol, actual concurrency, timeout with child collection.
Compressed-reader regressions remain in storage suite already
called by same target. Observed times/qualification
results recorded separately; no assumed speedup.

<a id="risultati-del-2026-10-16"></a>

## Results of 2026-10-16

Full run on `33ffda01` positive, stable sources: warning-free build/
tests, lint, tool self-tests, traceability, links,
evidence, experiments. Checker suite ran 46 cases, 738
assertions. Later cleanup completion checked with two
additional permanent cases/18 assertions, calling same test
function; previous 46 cases not repeated in probe.

After final integration on `15a17713`, build/tests, lint, traceability,
links positive. Separate global evidence check positive
on same state, checker `e3df9f52`. Both commands ran
in parallel without self-tests mutating results tree.
Qualifies C4 tool; does not close engine C1/MC/DC criteria.

Earlier comparison, checker `d75c465b`, base `fc487afa`, returned
same 150 catalogs, 3747 references, 44686 files
(1190618013 preserved bytes): 197.929 seconds with one process, 110.730
with four. One sample per mode, serial before parallel,
before final diagnostic/cleanup completion. Caches and
external load uncontrolled; no scaling guarantee.

[Campaign catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-16-evidenze-parallele/catalogo.lisp)
preserves 13 completed records, including failed/interrupted attempts.
[Summary](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-16-evidenze-parallele/tools/results-report.lisp)
distinguishes reasons without altering originals. Fixtures, worker
logs, process observations, intentionally invalid symlinks
in [raw container](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-16-evidenze-parallele/raw.tar.gz).
Collector checked copies, process metadata, closed inventory.
