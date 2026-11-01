# Offline M1 backup, restore and comparison — November 1, 2026

Implementation and registered method:
[backup contract](../../../docs/implementazione/backup-offline-m1.md), REQ-AFF-014,
ADR-0030/0033. Initial base `6361666`. The separate integration chat owns engine
conditional groups/protocol work; this work owns offline backup, relative directory
I/O and a borrowed, locked canonical-verifier session.

Campaign in progress. Completed attempts remain separate under
`spikes/out/backup-m1-20261101/` through the command recorder; the closed retained
archive and final results are added after repository checks complete. No pending
check is presented as passed. Source-eligible drivers live under `spikes/`.

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

The pre-fix `copy.lisp` and `operations.lisp` are reconstructed by applying the
inverse correction to the final files and checking each exact Git blob against
the stable failing record's source inventory. Both match. This retains the two
uncommitted runtime variants behind the real failed reproduction, together with
the literal reconstruction helper and audit; it is not a claim that every earlier
fixture variant is reconstructible from its hashes alone.

The documentation command's retained stderr includes dependency and Markdown
parser warnings. Its publication/link gates pass; this is separate from the
product's warning-as-error compilation rule.

Results apply to executed fixtures/platform only, not physical power loss,
complete C1/MC/DC, performance targets, full Archivio or online/incremental backup.
