<a id="risultati-locali-del-routing-workerserie"></a>

# Local worker/Serie routing results

Campaign on 2026-10-11, SBCL2.6.9/macOS ARM64 AppleM4, safety3.
The [preregistered method](routing-worker-metodo.md),
[two-reading review](routing-worker-revisione.md), and
[inventory](routing-worker-decisioni.md) bound the foundation.
Canonical data in [`2026-10-11-worker-routing`](https://github.com/gpicchiarelli/ArcDocDB/tree/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-worker-routing/).
No new exclusion or deviation is approved.

Targeted tests, coverage, and measurement are frozen on base
`92decf4265554cd4959e32a1c881cf00758bb6a1`. Subsequent integration
includes `d155db3f977677fa95280f59c23fbe46a5e116d2`: new CBOR strings,
GET resolver, and associated tests, without modifying execution/Series or
their contracts. ASDF, index, and changelog retain both additions.
Data from the first base remain separate from the integrated general check;
no measurement is reinterpreted as qualification of subsequent components.

| Process | Outcome read |
|---|---|
| `4000711896-command-71058-0` / target v1 | Failed, STABLE/exit1: recursive fixture comparator on65537 slots exhausts stack. Product compiled without warnings; v1 sources and raw retained. |
| `4000711978-command-74703-0` / C4 v1 | OK/STABLE/exit0, stderr0: complete COMPILE-FILE with every warning/style-warning fatal, FASL loading and self-test. Test comparator is not run by the sensor. |
| `4000712082-command-76603-0` / target v2 | OK/STABLE/exit0:18 dedicated tests, including iterative preimage, FAULTED health, shape FI, two ACTIVE Serie, and RW-REV-01 on both helpers. |
| `4000712082-command-76602-0` / coverage v2 | OK/STABLE/exit0: Series and execution suites in the same process, native raw and27HTML retained (26 sources plus index). |
| `4000712247-command-79840-0` / coverage audit | OK/STABLE/exit0: C4 reader fully compiled without warnings, positive/negative FASL self-tests, native identities and counts compared with actual HTML. |
| `4000712105-command-77187-0` / measurement v2 | OK/STABLE/exit0:5×4096 complete cycles, two alternating writers, stable sensors and sources. |

<a id="copertura-con-denominatore-completo"></a>

## Coverage with complete denominator

| Scope | Executed/total expressions | Executed/total branch outcomes | Missing expressions / branches |
|---|---|---|---|
| Execution,11 complete files |1470/1676|201/234|206/33|
| Series,15 complete files |1780/2090|235/292|310/57|
| Union26 files |3250/3766|436/526|516/90|
| Three new routing files |267/291|40/42|24/2|
| Complete writer handoff |189/206|18/20|17/2|

`coverage-audit.lisp` retains all missing native identities, index,
kind and path, and all per-file counts. `coverage-bundle.lisp` retains
both original native raw outputs and all HTML, compressed losslessly.
Complete files, including packages and defensive checkers, remain in the
denominator. Compound decision H01 is read separately with TF/FT/FF
inputs and explicit short-circuiting; MC/DC is not inferred from sb-cover.
Partial coverage and local tests do not close the engine C1 gate.

<a id="allocazione-e-sensori"></a>

## Allocation and sensors

| Replica | Cycles after128 warmup | Observed heap, bytes | Raw ticks | Independent sink |
|---|---|---|---|---|
|0|4096|0|6792|8972288|
|1|4096|0|6802|8972288|
|2|4096|0|6814|8972288|
|3|4096|0|6820|8972288|
|4|4096|0|6815|8972288|

Timer1000000 units/s. Sink `4096*143+4096*4095/2=8972288`;
143/cycle is fixed in the driver before campaigns, independently of the
APIs. Each cycle checks enqueue, publish, claim, repeated lookup,
identities/ordinals, double lease, span/payload, ack, and IDLE end. All
objects and APIs are preallocated or resolved before the sensor; GC and
printing are outside measurement. Bridge/Serie tokens grow per writer,
batch per worker.

The positive16×1MiB control detects16777472 bytes; zero baseline, wrong
sink, invalid CLI, existing destination, zero clock, and interrupted
measurement are detected by self-tests. Interrupted measurement retains
completed cycles, tick7, heap, and sink, without inventing data after the
error. The only ASDF runtime exception concerns `sb-kernel:redefinition-warning`
as in the build; C4 COMPILE-FILE excludes no warnings.

The mock I/O fixture is used only at startup. These are local serial
measurements of the successful path, with uncontrolled external load:
they do not qualify universal zero heap, fairness, throughput, P99,
scalability, pool, device, fault cleanup, or Serie lifetime. Registry and
tables remain static O(N) configuration per worker, without insertion/retirement.

<a id="controllo-generale-integrato"></a>

## Integrated general check

Process `4000712542-command-86913-0` is OK/STABLE/exit0 on the integrated
d155 base, with673 unchanged sources/documents:835 named tests,
2smoke and21suites, including88 Series tests. No warning/style-warning;
the370114 stderr bytes are compilation notes and remain intact.
Total duration182.076021s includes all checks and is not a hot-path
measurement. Linter, traceability, links, evidence, and self-tests pass.
The FASL cache is private in the snapshot; the recorder retains the actual
argv `env ASDF_OUTPUT_TRANSLATIONS=… make check-core`, the same core
invoked by `make check`.

F0 master `4000712691-check-90489-0` is COMPLETE:10 experiments,
each STABLE/exit0/stderr0; SPK07 PASS, the others OK. Complete raw outputs
are in the separate `2026-10-11-worker-routing-spikes-check` catalog.
Snapshot/reader runner tests are PASSED with two expected rejections
each (SIGKILL9/exit137 and completionexit7). The14 original files, including
runner/stdout/stderr, are retained in the auxiliary bundle; injected
failures do not become product failures.

Initial publication `4000712318-command-81618-0` verified copies and
completed the catalog, but the recorder declares SOURCE-CHANGED:
while it wrote raw outputs, root created this document and updated contract
links. Other sourceblobs are unchanged. The attempt remains retained as
non-PASS. Independent byte rereading `4000712554-command-87125-0` is
OK/STABLE/exit0/stderr0.

Auxiliary byteproof `4000712842-command-93594-0` is OK/exit0:
16 files (14 original raw files and2orchestration runners) are compared
byte for byte after UTF-8 reencoding and SHA256. An initial ignored
utility had a missing parenthesis and failed before its body; its source
remains retained but the original raw output was not recorded. Identical
replay `4000712876-command-94086-0` is a new FAILED/exit1 probe, with
stdout/stderr retained: it does not replace missing raw output and is
neither a C4 gate nor a product failure.

<a id="integrazione-successiva-della-cache-e-delle-prove-get"></a>

## Subsequent cache and GET test integration

Before publication, main advances to
`6eeb501d2eace49fad8e2ec333ed0c6c1386dd6c`. The delta adds the
GET-performance suite and makes cache lookup skip disabled/rejected slots
within the eight ways. Execution, Series, bridge, routing, dedicated fixtures,
and measurement C4 are unchanged. ASDF and index are composed with original
preimages retained; the coverage reader's Series/execution scope remains
unchanged. Measurements on base92 remain historical.

The new general freeze passes in process
`4000713646-command-11645-0`: OK/STABLE/exit0,683 sources/documents,
854 named tests plus2smoke,22suites, including the19 new GET tests.
Duration185.668746s; no warning/style-warning,407320 original stderr
bytes retained. Master `4000713800-check-18712-0` is COMPLETE,
with10 STABLE/exit0/stderr0 runs. Master raw outputs remain separate from
the previous ones in subdirectory `2026-10-11-worker-routing-spikes-check/latest`.
Snapshot and reader self-tests are PASSED, including two expected OS
rejections each. Projection, reader sources, and byteproof remain distinct
from the C4 campaign and first d155 freeze.

<a id="composizione-finale-con-get-active"></a>

## Final composition with GET ACTIVE

The last advance `be9d2dd6816f8c999fcab383702c7a133c061902`
adds six ACTIVE units in the resolver and related documentation.
It changes no execution, Series, routing, dedicated fixtures, tools, or
existing suites. ASDF loads the new units after the CLOSED resolver;
index and changelog retain both additions, with original preimages.

The combined tree is verified by process
`4000714586-command-55084-0`: `make build`, OK/STABLE/exit0,
690 sources/documents,854 named tests and2smoke, without warnings.
The check uses a private FASL cache and lasts about20.36s. These tests
exercise the existing suite; they do not qualify the new ACTIVE APIs or
their allocations. F0, coverage, and measurements retain previous freezes:
they are not repeated or reinterpreted for this delta.

Qualified routing sources, dedicated fixtures, and C4 remain unchanged.
The composed ASDF configuration is verified by the new build. Global
requirements remain `progettato`, Phase0 and engine qualification remain open.

<a id="integrazione-della-suite-get-finale"></a>

## Final GET suite integration

PR9 brings main to `644e53f176d0dce2c5ac5870659e7d89c0c9df3e`:
it adds70 GET tests, suite loading, GET coverage scope, and documentation.
It changes neither product sources nor Series/execution coverage predicates.
Integration preserves the previous deltas.

Combined build `4000715110-command-98694-0` is OK/STABLE/exit0,
with694 sources/documents,924 named tests and2smoke, without warnings;
private FASL cache, about22.71s. This check repeats the suite with new
tests; F0, routing coverage, and measurements retain their original bases.
It is not a new qualification of ACTIVE APIs, pool, or engine.
