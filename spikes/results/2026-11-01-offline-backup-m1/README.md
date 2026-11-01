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

Results apply to executed fixtures/platform only, not physical power loss,
complete C1/MC/DC, performance targets, full Archivio or online/incremental backup.
