<a id="lettura-c4-dello-scope-di-copertura-cbor-minimo-strutturale"></a>

# C4 reading of the minimal structural CBOR coverage scope

Static reading by the driver author, before campaigns. The scope
is the coordinator's change to `tools/foundation-coverage.lisp`: filter
`cbor-minimal-scan`, suite dispatcher, and synthetic filter checks.
This is not a C1 product reading or human approval. The reviewer ran no product,
test, compilation, or coverage campaign;
the new product tests were not read.

<a id="filtro-e-dispatcher"></a>

## Filter and dispatcher

The new scope selects only the exact suffixes
`/src/codec/cbor-scan.lisp` and `/src/codec/cbor-scan-minimal.lisp`. Comparison
requires the suffix to end at the path's end, excluding
`.lisp.fake` names and `/child` subpaths. The self-test adds both
positives and five negatives: header, item handler, test path,
false suffix, and subpath. The `codec` filter retains the whole module.

Dispatcher `cbor-minimal-scan` first calls
`arcdocdb.cbor.minimal.scan.tests:run`, then
`arcdocdb.cbor.structure.tests:run`. The second call also exercises
the generic API in the common file. The `codec` branch adds the new suite after
UTF-8, headers, minimal headers, and generic structure. The new scope name
appears in the CLI whitelist, usage, and diagnostics. Earlier commands
retain their branches.

The reading was renewed after integration with main
`b8cc54d81510bf0573e3c68abe3d51fa1d43a61a`. Upstream scope `series`
retains the `/src/series/` module filter, publication positive and
tests/controller negative, dispatcher `arcdocdb.series.tests:run`, and
presence in CLI whitelist, usage, and diagnostics. Both
`series` and `cbor-minimal-scan` scopes appear in the resulting file.

<a id="importazione-del-motore-di-mutazione"></a>

## Importing the mutation engine

Resolution fully imports the upstream engine from the same main:
real transport with exit/signal, distinct `:worker-error` classification
for signals and failures after the final marker, counters, logs, and self-tests
of SIGKILL/exit7 children and baseline copy/transport rejections. Group
`--scan` selects only catalog and metadata; copies, private cache,
baseline, classifiers, and workers are shared by both groups. The initial
report retains `:worker-errors 0` and `:mutants NIL` required by the engine.
The earlier driver blob `80a3b0ddd84a3827872d8b4d45fb8b7af178002a` was
preserved byte for byte in
`spikes/out/cbor-minimal-mutation-before-upstream.lisp`. This reading is
static: real engine self-tests and campaigns for both groups remain
to be run. The preregistered scan catalog was not changed.

<a id="produzione-delle-evidenze-e-limiti"></a>

## Evidence production and limits

The unchanged engine compiles product and tests with `:force t`, turns
warnings into errors, and translates ASDF outputs into the working
directory's `fasl` cache; it also checks that cache mapping is internal.
Saving `coverage-state.lisp` precedes the filtered HTML report: the filter
does not remove forms or guards from the two focal files. Reports without data
are rejected. Input, stack, item, header, and UTF-8 modules are loaded but
remain outside the focal denominator; this selection establishes neither their
coverage nor MC/DC coverage.

The caller chooses the directory. The driver uses
`ensure-directories-exist`, so exclusivity and absence of old reports
must be guaranteed by the campaign runner. The reading confirms the static
call path; runtime existence and completion of
suites, self-tests, numerators, and raw state remain pending.

<a id="snapshot-ed-esito"></a>

## Snapshots and outcome

| Source | Git blob read |
|---|---|
| `tools/foundation-coverage.lisp`, after integration | `f40669cb156abf7d781b1359fc1406f58bbb45e5` |
| Upstream mutation engine, main b8cc54d | `a9a94354a24bd3dc6bfe3a1511adbeb1d52c88d6` |
| `tools/cbor-minimal-mutation.lisp`, after integration | `60b1ac184498623d1364df66e1d95f93165af159` |

Files were read as forms with `*read-eval* NIL`, through EOF, without
loading or executing them. No open finding in the scope change or
static engine import. Benchmark and evidence collection
are outside this reading;
runtime coverage verification must be recorded separately.
