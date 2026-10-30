<a id="verifica-del-decision-log-autorevole-dellarchivio"></a>

# Verification of the Archivio's authoritative decision log

<a id="metodo-registrato-prima-delle-esecuzioni"></a>

## Method registered before runs

Suite `tests/recovery-archive/` exercises public APIs of module
`src/recovery-archive/`, in v1 and v2 formats, reusing independent bytewise
and bitwise-CRC oracles from DECISION, CONTROL, and ACTIVE tests. Does not change
database format or limits.

Static review found R1 on COD-25: two reads in assertion
predicate. Correction retains read result in local
variable before pure comparison, without changing I/O sequence,
conditions, or offsets. Tests observe exact requests and bytes,
including short transfers and failures; patch rereading remains
in review document.

Injected backend retains one read-only FD per fixture; records at
most 32768 events and files at most 4096 bytes. 64-byte header and body
observed separately. Tests verify preflight without I/O, complete
identity, budgets, short transfers, original errors, sealed prefix,
copy ownership, and scalar queries. Function replacements, if
needed for guards unreachable with correct dependencies, are serial,
bounded, and restored before return. `guards.lisp` injects inconsistent
results from preflight, transfer, header decoder, and replay: every rejection
precedes delivery and is followed by valid read with restored
dependencies. Body-predicate pairs and P limits/consistency
explicit. Private constructors also dynamically invoked with invalid
types, without suppressing warnings or weakening product types.

Bridge uses Archivio with UUID distinct from Serie, associated with its
own canonical GET scope. Byte identity, scope identity,
and FD lifetime separate. Budgets pass to canonical ACTIVE reader;
decisions derive from header and entire log read by new APIs.

Native chain uses existing private 0700 CONTROL fixture: exclusive
temporary, flush, and rename in setup only; then real read-only Archivio,
ACTIVE recovery, checkpoint builder, and CONTROL publication. Complete/tail,
v1/v2 cases check bytes, namespace, FDs, offsets, and exact read
counts. Contradictory decision in unsealed tail remains
excluded; zero and high CSNs remain integers. Fixture limits: 128 FDs,
64 names, 4096 bytes per file, serial deadline 30 seconds. No new
native worker or power-loss test.

<a id="esecuzione-e-copertura"></a>

## Execution and coverage

Before tests, writer agents closed and sources frozen.
Every command, including failures, goes through existing structured recorder;
revision, before/after snapshots, argv, environment, output, and exit code
remain preserved. A correction creates new revision and run.

`tools/foundation-coverage.lisp --report directory/ recovery-archive` selects
exactly `types`, `read`, `build`, `query`, `active`, excluding package and
fixtures. Counters zeroed after loading and before suite.
Self-test includes positive selections, false suffixes, and external files,
plus fixture detecting missing branch. SBCL forms and branches are not
MC/DC; denominators not reduced through implicit exceptions.

The [campaign register](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-decisioni-verifica/report.md)
separately preserves actual outcomes, attempts, and revisions.

No new benchmark planned in this increment. Parallel tests,
if present, demonstrate only declared matrix outcomes; do not
measure scalability, DB throughput, or universal nonallocation.
Recorder times include bootstrap and fixtures; external load
uncontrolled. Results published separately in evidence
register, losslessly compacting large outputs.

<a id="limiti"></a>

## Limits

Fixture attests EOF and freezes file and namespace; product API
certifies neither catalog nor prevention of external writes. Local qualification
does not complete C1, CLOSED reconciliation, indexes, CSN horizon, traffic
admission, or complete Recovery Manager. Independent review
remains separate from runtime outcomes.

<a id="integrazione-con-le-altre-suite"></a>

## Integration with other suites

The [integration campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-decisioni-integrazione/report.md)
separately records graph also comprising independent
ACTIVE-checkpoint and pool/Serie chain suites arriving during closure.
First-campaign evidence remains unchanged and attributed to its revisions.
