<a id="metodo-di-verifica-funzionale-get-active-ordinario"></a>

# Functional verification method: ordinary GET ACTIVE

Campaign adds first dedicated suite in
[`tests/get-active/`](../../tests/get-active/). Scope: Serie ACTIVE
source, OPEN preflight, immutable page construction,
acquisition of actually published root, ordinary reading.
Integration ancestor `105ae0dd28a6ae3e7ee60ab1477815a49b1b350b`.
Method precedes execution; freeze/outcomes will be recorded in
native evidence. No product-code changes.
Before freeze also integrate `c4bbb037b779d33ee9e8c01b4a33aac875ccf96f`,
including float-writer tests added by another campaign.

<a id="oracoli-e-casi-fissati"></a>

## Oracles and fixed cases

Fix 28 named tests: 12 construction/preflight, four directory
geometry, 12 reading. Format/boundary iterations do not
increase named-test count. Internal access checks declared
local contracts; public entries remain distinct.

Standalone fixture owns real file with associated append/read-only
capabilities, literal header, initial controller with NIL root and offset
64. Uses public preflight, CSN sealing, adoption, WAL,
publication protocol; controller/worker not subject to new tests.
Expected headers, frames, bitwise CRC independent of product
encoders. Offsets/frontiers derive from plan: header 64, record
`24 + K + V`, SEAL 56. Expected CSN derives from known initial
register value, without reading built map to derive oracle.

Construction cases include v1/v2, PUT/tombstone, page without PUT,
file identity/capacity, preflight without CSN allocation or I/O,
page/PUT/record/byte/payload budgets. First PUT requires 536
peak payload bytes; second append requires 1072 peak and
retains 560 bytes in resulting root. Exact and one-below
limits tested. Valid PREPARED/OUTCOME rejected before CSN; batch,
root, register unchanged. Legitimate batch reuse does not
alter previous root. Corrupt CRC in SEALED batch causes
specified Archivio fault with original cause preserved.

Geometry crosses ranks 15/16, 255/256, 4095/4096, and synthetic
maximum view of 65,536 pages. Latter is local search/convergence
contract built with independent direct oracle;
does not represent 65,536 native batches. Absent node, wrong width/leaf,
append to occupied leaf check guards and persistence
of previous graph, respecting declared types.

Reads enter through AVVIA-GET with real snapshots/EBR and call
three ACTIVE APIs. Compare bytes, sentinels, all five read
outcomes, cold/hot cache, v1/v2 formats, ordinary flags 0/4, CSN beyond
low word. Merely planned root does not authorize candidate;
earlier PUT retains page frontier after append.
Locations in header, SEAL, tombstone, outside frontier, or without row,
CSN disagreement in either word, wrong size, closed FD are faults.
Check wrong owner, small buffer, new GET entry,
expiry after provisional copy, nonlocal exit during pread.
Observer records FD/offset/amount; resolve/probe read nothing.
GET/EBR cleanup must be checked before external cleanup.

<a id="esecuzione-e-conservazione"></a>

## Execution and preservation

Before groups, commit sources, tests, tools, method. None
changes during execution. `tools/record-command.lisp`
preserves argv, environment, commit, working tree, inventories/hashes before/after,
stdout/stderr, exit code even on error. Corrections require
new freeze; previous evidence remains attributed to its commit.

Full local verification `make check`. Isolated coverage uses
[`get-resolver-coverage.lisp`](../../tools/get-resolver-coverage.lisp)
with `--suite active`: loads tests without test-op, resets SB-COVER,
runs new suite only. Scope includes package, types,
rows, read, six resolver active-* files: ten sources, eleven HTML files
including index. Raw state saved before validation and
counts compared with HTML. Existing CLOSED
profile retains defaults, scope, behavior.
Separate positive process checks CLOSED default; three negative
fixtures check unknown suite, duplicate suite, duplicate report.
Must exit usage error before directory creation.

<a id="ripetizione-dopo-lintegrazione-delle-fonti-della-serie"></a>

### Repeat after Serie-source integration

First freeze `42dcad77530c09784f9d77fabb92ff4477927983`.
Before repetition integrate exact main
`64a5ef06987af61c36ce9818eb24ca8f0a0eb7f4`: adds 27 ACTIVE/CLOSED
source tests and changes ACTIVE wrapper to delegate to captured-root
resolver. Expected total becomes 1,107 module tests in
29 suites plus two smoke checks; verifier nevertheless derives it from
frozen Git sources. Our 28 tests retain ordinary scope;
do not independently qualify new captured-root API.

Repeat `make check`, ACTIVE coverage, CLOSED compatibility on
new freeze in separate processes/private caches. CLI fixture
`--suite active --suite active`, four arguments and no `--report`,
must reach specific duplicate guard. Previous six-argument
fixture reaches cardinality guard only; its evidence
remains attributed to first freeze. Second working copy keeps
original groups unchanged while final audit proceeds in parallel.

<a id="ultima-integrazione-prima-della-pull-request"></a>

### Final integration before pull request

Then integrate exact main
`061e638200f0d97fc2443c7dec38d4362ef274e1`, adding pool
lifecycle and CONTROL checkpoint preparation. 18 new pool
tests bring expected total to 1,125 tests in 29 suites plus two smoke
checks; final count derived from frozen Git sources.
Our ACTIVE suite code/tests unchanged.

Commit integration/documents, run full verification
in third separate copy with private FASL cache. Do not rewrite
spike groups already frozen in first two copies. Coverage
retains both freezes; not rerun because all ten scoped
files unchanged in final integration.
Final local audit derives inventory, names, order, counts from new
freeze, preserving all full-check groups and fixtures.

Before pull request, warning-free compilation, regression,
static checks, traceability, links, preservation pass. CI
repeats checks on Linux/macOS, documents separately. Evidence
read as data through `tools/evidence-storage.lisp`, never loaded
as code; full groups, raw outputs, failures, original FASLs preserved.
Independent fixture/oracle/result review.

<a id="limiti-delle-conclusioni"></a>

## Limits of conclusions

No performance, RSS, allocation measurement; payloads are geometry
calculations. SB-COVER does not demonstrate MC/DC. C1 qualification,
unexercised decisions, requirements, Phase 0 remain open. Excluded:
prepared/OUTCOME ACTIVE functionality, EDIT, atomic concrete index, mixed
directory, rotation/reclaim, multiseries, stress, scheduler, server.
