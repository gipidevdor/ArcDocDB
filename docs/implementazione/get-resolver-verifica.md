<a id="verifica-funzionale-delle-prove-outcome-del-resolver-closed"></a>

# Functional verification of CLOSED resolver OUTCOME proofs

The dedicated suite adds **42 tests**: 8 for proof sorting/search,
13 for construction, 21 for reading. It follows the
[preregistered method](get-resolver-metodo.md) without changing formats,
requirements, or resolver code.
[Native evidence](https://github.com/gpicchiarelli/ArcDocDB/tree/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-get-resolver-outcome/)
preserves commands, outputs, complete raw files, including FASLs as data.
[Complementary spike-output collection](https://github.com/gpicchiarelli/ArcDocDB/tree/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-get-resolver-spikes-raw/)
also preserves FASLs generated outside the general evidence directory.

<a id="risultati-locali"></a>

## Local results

Freeze `e75caed6694e4a2c141b5ff155dfe0d418191c75` passes `make check`
without warnings: 1,011 module tests, two smoke checks.
Regression, static checks, traceability,
links, evidence verification, and spike checks pass.
The resolver suite also passes in a separate coverage process.
Both records report exit code 0, initially clean working tree, and
the same **731 path/blob** pairs before/after, checked against the freeze.
Results belong to this commit, preceding page.

Integration with `main` is verified at freeze
`15fc91c824b0c49ad91dfdfc9845d4e9e2148102`: `make check` R3 passes
with 1,011 module tests, two smoke checks, exit 0, **735 path/blob** pairs
stable and matching the commit. Coverage R2 separately repeats
42 tests, with the same counts as the table below.
[Integration collection](https://github.com/gpicchiarelli/ArcDocDB/tree/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-13-get-resolver-integration/)
fully preserves previous `make check` R2, exit 2:
tests passed but seven links in temporary collection README
prevented documentation check. The template was
renamed `.txt`; R3 verifies full check after correction.
R2 is not qualified as overall success.

CLOSED writer fixtures use real read-only files, v1/v2 header/SEAL/manifest,
independent CRC encoding. Expected values include literal offsets/values,
u64 TXID/CSN, physically reordered OUTCOMEs, first duplicate
proof, separate high/low-word disagreement. Payload limits
pass exactly, fail one byte below, preserving the previous map.
The reused source buffer does not alter the map; tail after `valid-bytes`
stays intact, not read by constructor.

Hot prepared cache still rereads OUTCOME from the same FD. Conflicting CRC, CSN,
or TXID prevents an answer even with a cached value;
a second identical proof does not replace a corrupt first proof.
Persistent FI restores only fixture bytes. Errors, nonlocal
exit, and snapshot expiry after provisional copy release GET/EBR.
Prepared-without-OUTCOME case retains zero CSN/proof: a positive public
candidate fails first with `:resolver-candidate-csn`; this is not independent
proof of internal `:resolver-missing-outcome` guard.

<a id="copertura-diagnostica-isolata"></a>

## Isolated diagnostic coverage

SB-COVER is reset after loading, before running only the 42 resolver tests.
The tool saves raw state before validating and compares data-derived
counts with HTML counts. The report includes only
seven CLOSED files; ACTIVE and other suites are excluded from counts.

| File | Executed/total expressions | Executed/total branches |
|---|---:|---:|
| package | 0/1 | 0/0 |
| types | 6/29 | 0/0 |
| scan | 246/307 | 27/40 |
| sort | 346/387 | 44/50 |
| rows | 147/167 | 12/16 |
| build | 184/260 | 21/38 |
| read | 227/265 | 27/40 |
| **Total** | **1156/1416 (81.64%)** | **131/184 (71.20%)** |

Zero branches means zero denominator, no invented percentage.
Coverage diagnoses the suite; it is not an MC/DC measurement. No speed,
allocation, RSS, or mutation results are attributed.

<a id="revisione-e-limiti"></a>

## Review and limits

Independent pre-freeze reading corrected two fixture expectations:
empty vector and byte budget compatible with batch budget.
Subsequent record reading checks all path/blob pairs, 42 names and
test order, raw state, each HTML page's counts.
The product required no correction in the campaign.

C1 qualification, unexercised decisions, and MC/DC remain open. The suite
does not verify ACTIVE, EDIT proofs, history, mixed directory, rotation/reclaim,
concurrent publication, or server integration. It promotes no requirement
and does not close Phase 0. Pull-request CI repeats `make check` on Linux
and macOS, checks documents separately; its outcomes belong to
the actually published commit, distinct from local freeze reported here.
