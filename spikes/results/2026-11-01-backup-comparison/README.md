# Exact offline comparison — November 1, 2026

Registered [method](method.md); base `2acefea`, product equivalent to `8d4349a`.
The comparison primitive is used by copy readback and source/backup comparison.
Complete buffers now use typed octet `EQUALP`; a short final prefix keeps the
original scalar loop. All reads, CRCs, source locks, publication and error/cleanup
boundaries remain in place. No request-path or other chat's runtime code changes.

## Local native-read comparison

Two identical 16 MiB + 37-byte files, warm OS cache, eight full comparisons per
window, five ABBA/BAAB rounds, ten windows per variant/buffer/campaign. Useful
throughput counts one file; actual requested native reads count both files.
The raw timing field `:physical-read-bytes` is that logical PREAD byte count,
not measured physical storage I/O. No NVMe or full-backup throughput follows.

The control run compares two scalar implementations and yields speedup ratios
0.997..1.001. The scalar function's argument list/body is checked against the
pinned old production definition before each run. The
[source binding](../2026-11-01-backup-comparison-originals/observations/source-identity.lisp)
checks the same immutable timing driver across all six timed campaigns and the
same complete 546-file production inventory for final timing, qualification,
documentation and CI self-test.

| Buffer | First EQUALP speedup | Reverse-order repeat | Final-source speedup | Final scalar / product MB/s |
| --- | ---: | ---: | ---: | ---: |
| 4 KiB | 1.287× | 1.276× | 1.290× | 696.86 / 898.63 |
| 64 KiB | 1.349× | 1.369× | 1.390× | 878.15 / 1220.48 |
| 1 MiB | 1.403× | 1.401× | 1.440× | 878.20 / 1264.79 |

All measured variants report zero managed bytes within the comparison windows.
Fixture construction, buffers, resource acquisition and result allocation are
outside those windows. Host load is uncontrolled; other work was active. These
are local ARM64/SBCL 2.6.9 comparison measurements, not SLOs or database benchmarks.
The initial `MISMATCH` candidate is rejected: both runs deliver only
0.09..0.11 times scalar throughput. Their successful execution status means the
data checks completed; it does not mean the candidate improved performance.

## Correctness and review

Forced warning-as-error product compilation passes. All 28 backup and 19 verifier
methods pass, including 26 backup/paged-source and eight verifier SIGKILLs.
New permanent native-file regressions cover empty/one-byte files, byte/word/chunk
edges, equal and known single-bit-different images, poisoned unused scratch
suffixes and truncated left/right files. The timing driver's 38 native fixtures
also pass. Analysis self-tests include known medians/ratios and five malformed
sample campaigns. Complete sample vectors and every validation attempt remain
separate in the retained evidence.

Two readings by the same author cover the full-buffer/tail decision and unchanged
I/O/short-read/error boundary. For prepared jobs, both vectors have the same
simple octet element type and length: full EQUALP has the same numeric byte
equality as the original loop; the partial path compares only COUNT bytes. No
new allocation, unsafe pointer, lock, FFI, dependency or persistent format is
introduced. These readings are not independent C1/MC/DC qualification.

Documentation passes: 563 sources, 1,169 pages, 89,040 local links/anchors; 46
documentation and 24 code-reference regressions; 14 damaged publication fixtures
rejected. Runtime reference checks cover 55 packages, 713 exports and 644 prose
contracts, and the public Unix roundtrip example passes. The retained documentation
stderr still contains dependency/parser warnings, separate from product warnings.

## CI evidence and limits

The earlier hosted run on `8d4349a` passes Linux, macOS, coverage, benchmark and
documentation jobs, but its tools audit and dependent sealing fail. The downloaded
audit artifact hashes to `2ae98c372f39dc90db41105ea9bb5f5fa8a805e422b30e5d48ce52052b6acc74`;
its retained C4 record shows failure at nested `make ci-selftest`. The packet does
not contain that failed nested command's detailed module outputs, so its cause is
not established. It is not a proven timeout or a product regression.

On the current source `make ci-selftest` passes locally; its outer/nested records
and tests/summary are retained. This does not turn the earlier hosted failure
green. A new hosted run must determine its status; no CI policy or limit has been
relaxed here. Full `check-core` is not claimed rerun for this one-function change;
the prior campaign retains that baseline, while this campaign reruns the affected
offline suites, forced compilation, documentation and current CI self-test.

The first driver self-test and first product self-test failed at unmatched closing
parentheses before execution. Their records and exact source variants are retained
and checked against the recorded blobs. No failed command qualifies a measurement.
The same source audit binds the old scalar file and rejected MISMATCH file too.

## Closed retention

The [closed originals](../2026-11-01-backup-comparison-originals/archive-index.lisp)
contain 79 indexed files (9,555,377 bytes), 81 actual files including index/catalog,
and 25 completed process records: 23 local campaign commands, one nested local CI
self-test and the earlier hosted C4 failure. All source inventories are STABLE;
three failed records remain failed. Independent inventory/hash closure passes.
See the [collection report](collection-report.lisp),
[closed check](closed-check.lisp) and [byte/SHA256 retention audit](retention-audit.lisp).

The final lint/trace/link/evidence command is recorded after archive closure and
catalog publication. Its record/sidecar are copied into this parent as
`final-metadata-process.lisp` and `final-metadata-retention.lisp`, with
`final-retention-audit.lisp`. These later self-record copies are outside the closed
originals; their byte/SHA256 audit does not claim atomic filesystem proof or that
the earlier check verified its own later copying.

## Integration with published observability

After the initial archive closed, main advanced to `5c0a5a1`. Merge `f96c556`
preserves that published metrics/counter work and selected-runtime tool fixes.
The optimized file is unchanged from feature commit `15e150e`: both Git blobs
are `6f7c5382b58f14ad9dfae3685f95699587a227e4`. Neither backup, verifier nor I/O
runtime receives any additional merge change. Earlier complete 546-file bindings
describe the pre-merge phase; the metrics module extends that inventory.

On the merged source, forced warning-as-error compilation and all 28 backup/19
verifier methods pass again, as does the current CI self-test with 60 suites.
The manual is regenerated: 567 documents, 1,187 pages, 90,515 local links/anchors;
all documentation/publication regressions pass. Runtime reference/example and
lint/trace/link/evidence checks are recorded separately for the merged source.

Post-merge command/retention pairs use the `merged-*-process.lisp` and
`merged-*-retention.lisp` names in this parent. The nested CI command and its
tests/summary are retained too. `merged-retention-audit.lisp` binds their exact
bytes and before/after SHA256 without modifying the closed initial archive.
Its final metadata command precedes its own later retained copies, as above.
