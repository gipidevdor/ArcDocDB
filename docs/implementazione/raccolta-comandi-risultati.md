<a id="verifica-della-raccolta-degli-archivi-di-comandi"></a>

# Command-archive collection verification

C4 collector uses explicit manifest, four workers, and independent
closed-inventory checker. [Contract](raccolta-comandi.md)
describes inputs, outputs, and limits; campaign verifies tool,
without qualifying engine.

<a id="versioni-e-tentativi-conservati"></a>

## Versions and preserved attempts

First run on `82100f5a` found API defect:
tests passed valid pathnames while entry required strings.
Self-test and full check ended FAILED, with exits 1 and 2.
Both preserved 59 cases, 984 checks, and 48 failed cases;
collector copies had not begun.

Correction on `6d47d2df` normalizes only manifest, destination, and
observations at API entry. Manifest fields remain strings.
59-case corpus unchanged. Explicit rerun and run within
`make check-core` passed every case, with 2,807 checks each.

| File | Git blob |
|---|---|
| Initial collector | `48c4e1a23390a43767a3630d66514d9c03a79159` |
| Corrected collector | `d2eb1bd8a62b0fd98ec023243b2a768c19988dc7` |
| Unchanged self-test | `49da390b7e170acc9ffdafa78285f215aec75f44` |

Static readings corrected empty-label diagnosis, accessory-payload
binding, and self-test directory template.
Failed syntactic preparations preserved; notes
distinguish diagnostics remaining in conversation from physical logs.

<a id="esiti-dello-strumento"></a>

## Tool outcomes

Main case preserves four distinct historical processes: OK,
FAILED with exit NIL, SOURCE-CHANGED, and FAILED with exit 7. Result
contains nine indexed files and eleven actual files, including index
and catalog. Four distinct threads perform copies; observed counts
3, 2, 2, 2. Caller does not perform copies.

Second compressed case retains descriptor as accessory without
listing among processes: nine files, three processes, counts 3, 2, 3, 1.
Bytes of eighteen copies across both cases compared in full,
alongside two destinations at exact size limits.
Fixtures verify immutable inputs, binary copies and hidden
names, original metadata, and no implicit inclusions.

Rejections include malformed manifests, duplicate keys, nonrelative
paths, reserved names, file/directory collisions, incomplete records,
inconsistent metadata, final symlinks, existing destinations, overlapping
outputs, missing or moved payloads, incorrect hashes, and exceeded budgets.
READ-EVAL remains NIL and one form through EOF required.

Copy alteration detected as COPIED-BYTES and source change
as SOURCE-CHANGED. Hidden file added at root
causes CLOSED-CHECK: child checker detects INVENTORY. Logs and failed
report stay external, partial copies preserved.

<a id="integrazione-e-lettura-indipendente"></a>

## Integration and independent reading

On `6d47d2df`, `make check-core` passed 1,651 named tests,
two smoke tests, four linter fixtures, and 59 collector cases.
Product tests distinct from linter C4 checks.

Lint: 237 files and zero violations. Traceability: 122 requirements, 65
invariants, 13 FI scenarios, and 52 ADRs without errors. Links: 476 files,
3,199 links, zero broken. Evidence includes 123 catalogs,
3,565 references, and 42,702 preserved files. Ten spikes run
only in `--check` mode.

Independent DATA reading passed 1,694 checks over 251 physical
files, with stable before/after hashes and metadata. Verifies two successful
wrappers, two failed, copies, four workers, historical metadata,
and final checker. Wrappers observed 972 stable sources.
First reader did not recognize test names in printed format;
failed attempt and corrected variant preserved.

<a id="conservazione"></a>

## Preservation

[Main archive](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-command-archive-collector/archive-index.lisp)
contains 454 manifest-listed files and two automatic manifest/collector
copies: 456 indexed files, 458 actual, 2,189,674 indexed
bytes, and six processes, three OK and three FAILED. Final checker
verified closed inventory after index and catalog
writing.

[Supplement](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-command-archive-collector-final/archive-index.lisp)
preserves completed preparation and main-collection records,
including checker result: two processes, 53 indexed files, and
55 actual. Supplement also passed final checker.
No append changes either archive after respective verification.

Initial preparer summary reported 46 files because SORT
reordered list and subsequent count began at old head.
Serialized manifest contained all 454 files: collector plan
and inventory confirm presence. Supplement preparer
sorts list copy; initial source and report
remain preserved unchanged.

Complete fixtures, including deliberately over-budget ones, remain
in local evidence backup. Published archive selects case
reports and logs: does not contain every input directory or partial
archive. Manifest makes each selected file explicit.

Collection success attests copies and inventory, does not promote failed
commands. No throughput, speedup, durable atomicity,
or C1/MC/DC qualification derived from campaign.

