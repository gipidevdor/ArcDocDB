# Offline canonical M1 verifier — October 31, 2026

## Scope and method

Implements the scoped read-only verifier in [the contract](../../../docs/implementazione/verificatore-offline-m1.md),
under ADR-0033 §7 and REQ-AFF-010. The work starts on `17621d4`; an upstream CI
reconciliation-only commit is included before committing the implementation.
Other worktree changes, including engine group commit, are not incorporated or edited.

The method is registered before execution in the contract. The focused
[driver](../../verify-m1-check.lisp) is source-eligible for both command snapshots.
It uses the canonical readers, while independent expected counts/bytes and
existing engine child value/tombstone oracles check the results. The inspection
never invokes engine startup, repair or document-index construction. Namespace
and file bytes are compared before/after successful and rejected inspections.

Two static readings by the same reviewer cover acquisition/cleanup and canonical
validation, then report ownership/status and ASDF/CLI integration. The contract
contains the decision map; no independent reviewer or complete C1/MC/DC approval
is claimed. The second reading identified shared literal report lists; the
public result ownership test reproduces that defect before its correction.

## Results and retained failures

The [closed original archive](../2026-10-31-offline-verifier-originals/archive-index.lisp)
retains these attempts separately, with their command environment, stdout/stderr,
source blobs before/after, exit status and retention sidecars. All listed command
snapshots are `:STABLE`; this does not change a failed command into a pass.

| Record label | Outcome |
|---|---|
| `initial` | Failed: corruption fixture opened an existing file without explicit `:if-exists :overwrite`; fixed in the fixture |
| `focused-2` | Failed: inventory `:ready` does not exclude unknown-final `:anomaly` actions; verifier now explicitly rejects anomalies/missing/conflicts |
| `focused-3` | Failed: diagnostic-observer fixture used a character string where `simple-base-string` was required; fixed in the fixture |
| `focused-4` | Passed: 17 focused cases, including real crash-before-recovery inspection |
| `lint` | Passed: product coding checks |
| `focused-5` | Passed: 18 cases, adding mixed decision/empty-ACTIVE version rejection |
| `full-check` | Deliberately stopped, exit 143, after the second reading found shared report lists; not a complete-check pass |
| `report-isolation-failure` | Failed: syntax error in the new ownership fixture; no defect reproduction claimed for this attempt |
| `report-isolation-reproduction` | Failed at the ownership assertion: two calls shared report list spines; corrected by constructing private lists |
| `full-check-final` | All product tests and preceding repository targets passed; the command ended with exit 2 solely at the CI self-test's stale 57-suite expectation |
| `docs` | Passed: generated documentation and negative publication fixtures |
| `docs-runtime` | Passed: compiled public-reference comparison and real Unix client/server example |
| `ci-catalog-follow-up` | Passed: complete CI self-test after updating the expected count to 58 and requiring the verifier suite |

The initial CI child command and its detailed case/summary data are retained too.
They identify exactly one failed case, `:catalog-57-suites`; all other 41 test
module cases passed. A deliberately timed-out negative child diagnostic is not
the cause of this failure. The successful follow-up retains all seven module
summaries with no failed or unexecuted cases.

## Product verification

`full-check-final` recompiles product code with warnings treated as errors and
passes every product suite, including **19** verifier cases. They cover clean
v1/v2 stores, repeated calls, private result lists, unchanged next CSN, exact
segment capacity, live rotation/compaction, terminal tombstones, malformed headers
and committed bodies, unsealed suffixes, unknown/missing files, duplicate CSNs
despite valid CRCs, lock contention, combined primary/cleanup failures, foreign
exits, and CLI parsing/status codes.

The before-recovery case runs four v1/v2 × plain/tail scenarios, each with two
real SIGKILLs and a final independent engine verification. Canonical data are
inspected before either recovery; an incomplete 13-byte suffix remains present
and is reported as attention, including after recovery preserves it in CLOSED.

That command also passes legal checks, lint (**501 files, zero violations**),
traceability (**141 requirements, 71 invariants, 13 FI scenarios, 79 ADRs**), links
(**790 files, 3,782 references, zero broken**), full-text checks, evidence/tool
self-tests, existing evidence checks and all **11** spike checks. Compiler
optimization notes and deliberately failing negative oracles remain in raw output.

The complete command runs on `e867e20701f3dbe09ca07ac7de7ff1464ad681b6`.
The CI follow-up runs on `dd00ed2694389a4b50ba789b1352f937e641bda8`; the intervening
commit changes only `tools/ci/test-self-test.lisp`, not product or product-test
bytes. The failed aggregate is retained as failed. Only its affected C4 target
is repeated after this correction; a new successful local aggregate is not claimed.
The focused driver has Git blob `5ec3e4bf45087fec1fd8f878f746dfec63bbb1ab` in both
snapshots of the product-check command.

## Documentation and limits

The documentation run verifies **554 source documents, 1,114 HTML pages and
84,926 local links/anchors**, 46 documentation regression cases, 24 code-reference
cases and 14 damaged-publication rejections. Runtime checks match 54 packages,
684 exported bindings and 621 prose contracts. The public Lisp example exercises
PUT/GET, reopen, DELETE and absence through a real Unix socket. Upstream
documentation dependency warnings remain visible in stderr; zero stderr is not claimed.

The platform is SBCL **2.6.10**, macOS ARM64. No benchmark, Linux result, power-loss
guarantee, whole-engine qualification or full Archivio verifier is inferred.
REQ-AFF-010 remains globally designed: catalog, derived indexes/hints, integrated
multiseries consistency and verified backup/restore remain separate work.
No engine request/write path or accepted ADR is changed by this increment.

The archive is an explicit collection of completed command records and selected
diagnostic data, not a transitive backup of every temporary child database or
nested local output. The collector's report and independent closed-inventory
observation are retained beside this file with byte/SHA256 copy checks; the
closed original archive is never appended to afterward.

## Retention and final metadata

The collector used four workers. Its independent closure check found **38 indexed
files, 40 actual files and 14 command records**, with a closed inventory. Collection
observations and their process/sidecar were copied with byte comparison and
SHA256 checks before and after copying, as recorded in `retention-audit.lisp`.

The subsequent recorded `make lint trace links evidence` passed with exit **0**,
stable source snapshots and empty stderr: **501** product files with zero lint
violations, unchanged traceability totals, **795** Markdown files / **3,785** links
with none broken, and **10** evidence catalogs / **33** artifact references checked.
Its original record and sidecar are retained as `final-metadata-process.lisp` and
`final-metadata-retention.lisp`, with their copy checks and literal helper in
`final-retention-audit.lisp`. The earlier metadata command does not attest to its
own subsequent retention files or this later prose. The closed originals remain
unchanged.
