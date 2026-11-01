# Offline M1 backup, restore and comparison — November 1, 2026

Implementation and registered method:
[backup contract](../../../docs/implementazione/backup-offline-m1.md), REQ-AFF-014,
ADR-0030/0033. Initial base `6361666`. The separate integration chat owns engine
conditional groups/protocol work; this work owns offline backup, relative directory
I/O and a borrowed, locked canonical-verifier session.

Each validation attempt has a separate command record under
`spikes/out/backup-m1-20261101/`. Source-eligible drivers live under `spikes/`.
Feature commit `f843301` passes complete `make check-core` with a stable source
inventory, including the warning-as-error product build, all registered suites,
legal checks, lint, traceability, links, tool self-tests, evidence checks, all
eleven correctness spikes and the CI self-test.

Merge `4b8dc70` integrates the other chat's already published `de8429f` without
changing its runtime code. Both changelog entries and ASDF/test registrations are
preserved. On the merged source inventory, a forced warning-as-error product
build and six affected suites pass: backup, verifier, Unix wire, native I/O,
actor/client and real processes. The process suite includes the upstream
conditional groups and 30 actual SIGKILLs. This targeted integration run is
distinct from the complete pre-merge `check-core`; the full tool self-test suite
is not claimed rerun after the merge.

The final focused run passes 26 backup cases and the 19 existing offline-verifier
cases, including 26 real backup/paged-source SIGKILLs and eight verifier SIGKILLs.
The targeted late-corruption reproduction fails before the correction and the
full focused follow-up passes afterward. The initial attempt at that reproduction
failed at fixture syntax and is not counted as a product-defect reproduction.

## Attempt ledger

Every row names a separate command-record directory; failures remain failures.
The syntax-only reader driver does not establish runtime correctness. Its positive
and deliberately malformed fixtures only demonstrate the source reader boundary.

| Attempt | Outcome and interpretation |
| --- | --- |
| `foundation-build` | PASS; relative-directory I/O and borrowed verifier session |
| `first-product-build` | FAIL; canonical segment parser returns two values, not three; compiler detected the wrong binding |
| `product-build-2` | PASS after correcting that binding |
| `focused-1` | PASS; initial seven backup cases plus 19 verifier cases |
| `lint-1` | PASS; 542 product files, zero violations |
| `cli-selftest-1` | PASS; 18 parser fixtures |
| `focused-2` | FAIL; unmatched test form in guards fixture |
| `focused-3` | FAIL; incorrect fixture expectation that a clean engine close retains a private paged derivative |
| `focused-4` | FAIL; unmatched test form in crash fixture |
| `focused-5` | FAIL; cleanup assertion did not traverse the canonical recovery cleanup aggregate |
| `focused-6` | PASS; 21 backup cases, 19 verifier cases, actual crash cases |
| `focused-7` | FAIL; unmatched forms in newly added fault/streaming fixtures |
| `reader-audit-1` | FAIL; diagnoses those syntax defects, without semantic inference |
| `reader-audit-2` | PASS; syntax-only follow-up |
| `focused-8` | PASS; 25 backup cases plus 19 verifier cases |
| `late-corruption-reproduction` | FAIL at fixture syntax; not a runtime reproduction |
| `late-corruption-reproduction-2` | FAIL at the expected rejection assertion: old restore incorrectly approved suffix damage injected after initial verification |
| `focused-final` | PASS; 26 backup cases plus 19 verifier cases, including the corrected late-corruption rejection |
| `docs-build` | PASS; 562 sources, 1,164 HTML pages, 88,675 local links/anchors; 46 documentation and 24 code-reference regressions; 14 damaged publication fixtures rejected |
| `docs-runtime` | PASS; 55 packages, 712 exported bindings, 643 prose contracts; public Unix roundtrip/reopen example |
| `full-check` | PASS on feature commit `f843301`; complete `check-core`, stable inventory, exit 0 |
| `integration` | PASS on merge `4b8dc70`; forced product compilation and six affected suites, stable inventory, exit 0 |
| `integrated-docs` | PASS; 563 sources, 1,169 HTML pages, 89,040 local links/anchors, same documentation/publication regression gates |
| `integrated-docs-runtime` | PASS; 55 packages, 713 exported bindings, 644 prose contracts; public Unix roundtrip/reopen example |

The pre-fix `copy.lisp` and `operations.lisp` are reconstructed by applying the
inverse correction to the final files and checking each exact Git blob against
the stable failing record's source inventory. Both match. This retains the two
uncommitted runtime variants behind the real failed reproduction, together with
the literal reconstruction helper and audit; it is not a claim that every earlier
fixture variant is reconstructible from its hashes alone.

The documentation command's retained stderr includes dependency and Markdown
parser warnings. Its publication/link gates pass; this is separate from the
product's warning-as-error compilation rule.

The CI self-test's timeout diagnostic belongs to its deliberate timeout fixture;
all seven modules pass (364 checks). Its nested command and complete tests/summary
are retained separately from the outer `full-check` command. No local command is
represented as a successful hosted CI run.

## Retention and closure

The [closed originals](../2026-11-01-offline-backup-m1-originals/archive-index.lisp)
contain 66 indexed content files (9,214,823 bytes) and 25 completed process records:
24 campaign commands plus the nested CI self-test command. Nine failed attempts
retain FAILED/exit-1 status; all source inventories are STABLE. The archive has
68 actual files including its index/catalog. An independent closure process
verifies the exact inventory and returns exit 0; see the
[collector report](collection-report.lisp) and [closed check](closed-check.lisp).

The [retention audit](retention-audit.lisp) records exact byte comparison and
SHA-256 before/after for the collector's completed record, retention sidecar,
report and closed-check log. Original record/sidecar pairs are not replaced by
success summaries. The [pre-fix audit](../2026-11-01-offline-backup-m1-originals/pre-fix/audit.lisp)
binds the retained runtime variants to the failing source inventory.

A final `make lint trace links evidence` is recorded after archive closure and
parent catalog publication. Its completed record and sidecar are retained in the
parent as `final-metadata-process.lisp` and `final-metadata-retention.lisp`, with
`final-retention-audit.lisp`. These final self-records are deliberately outside
the closed originals; the earlier check does not attest its own later copying.

Results apply to executed fixtures/platform only, not physical power loss,
complete C1/MC/DC, performance targets, full Archivio or online/incremental backup.
