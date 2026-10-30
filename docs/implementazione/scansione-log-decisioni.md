<a id="decisioni-della-scansione-dei-log"></a>

# Log-scanning decisions

Compound-predicate inventory under COD-54. Regression cases in
[`tests/recovery/`](../../tests/recovery/). This table alone certifies neither
MC/DC coverage nor full-recovery qualification.

| Function and decision | Conditions and cases |
|---|---|
| `check-scan-arguments`: log type and file-id | segment with opaque ID; control/multiserie with zero; other type and nonzero ID rejected, even with empty log |
| `check-scan-arguments`: budget types, minimums, and sums | valid budget; each prohibited negative or null parameter; batch-records beyond u32; batch below 56 bytes; file-offset + end overflow |
| `check-scan-arguments`: physical EOF | u64 file-size equal absolute end; missing or invalid value; window not reaching EOF |
| `check-scan-arguments`: log bytes | range exactly at budget accepted; one byte over rejected |
| `checked-batch`: verifier progress and result | intact batch; internal verifier error distinct from external corruption; only corruption-detected starts search |
| `seal-witness`: type filter | no SEAL; present candidate, including unaligned; no external length drives read |
| `seal-witness`: frame postconditions | 56 bytes, SEAL type, zero flags, empty key, and 32-byte body already guaranteed by codec; defensive checks always active |
| `seal-witness`: identity and positions | exact/different file; batch start before record area, inside area, and beyond candidate; frontier not beyond/beyond batch-start |
| `search-durable-witness`: candidate and frontier | invalid candidate; D < P, D = P, and D > P; damaged witness-batch body with intact SEAL |
| `search-durable-witness`: all positions | first/last candidate, inconclusive SEAL before witness; one-byte advancement and search through end − 56 inclusive |
| `search-durable-witness`: budget | no possible position; exact budget; one missing position rejects classification |
| `scan-prefix`: end, error, and batch limit | empty log; exact end; failed batch with P at its start; bytes remaining after last allowed batch; prefix-only counts |

Tests `REQ-AFF-009-every-log-truncation`,
`REQ-AFF-009-frontier-boundary-and-failed-batch-start`,
`REQ-AFF-009-invalid-witnesses-are-ignored`, and
`REQ-AFF-008-invalid-configuration-is-never-tail` cover prefix
boundaries, strict frontier, every external witness field, and scanning
parameters. All-bit tests in
[`corruption.lisp`](../../tests/recovery/corruption.lisp), with direct
calls to explicit scanner version and offsets.
`REQ-AFF-009-overlapping-seal-after-noncovering-frontier` constructs two
valid-CRC SEALs overlapping 32 bytes apart: inconclusive one
must not hide later `D > P` witness.

<a id="rami-difensivi-e-confini-della-prova"></a>

## Defensive branches and test boundaries

`checked-batch` checks `verifica-lotto` postconditions: progress,
ranges, and counts. `seal-witness` rechecks shape returned by codec.
Failing these checks cannot result from external bytes after correct
lower-level verification; it signals internal defect.
`scan-prefix` also checks record count is compatible
with actual bytes consumed.

Definitions, proclamations, and defensive branches remain in raw
coverage denominator. Any exception requires registration and review
under [verification plan](../affidabilita/piano-di-verifica.md).
The [evidence catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-recovery/catalogo.lisp)
preserves raw report, nine-mutant campaign, and two independent
module readings. Second reading added a batch budget beyond
`most-positive-fixnum` to invalid-configuration case;
type check therefore exercised separately from 56-byte
minimum. Defensive branches listed above not subtracted from totals.
Final report measures 416/480 expressions (86.7%) and 52/66 branches (78.8%)
in `scan.lisp`. The 14 untaken branches are five `checked-batch`
postconditions/preconditions, six in `seal-witness`, initial search
boundary, and two `scan-prefix` checks; they would require internal-contract
violation or defective codec. `package.lisp` also remains in report with
one unexecuted definition and no branch. Results do not close
coverage or engine-qualification gate.
In-memory corruption tests simulate neither persistence, flush, nor
`FAULTED` transitions; verify scan result on supplied bytes.
