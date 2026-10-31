# M1 committed location delta — local verification

2026-10-31 · REQ-IDX-011 · [ADR-0071](../../../docs/adr/0071-delta-location-indice-m1.md)
· [Contract](../../../docs/implementazione/delta-location-m1.md)
· [Preregistered method](../../../docs/implementazione/delta-location-m1-metodo.md)

The serial paged GET now obtains a touched key's complete committed location
or tombstone from the delta. It does not consult the resident index; untouched
keys use the verified base image. Publication follows the existing durable
SEAL and canonical publication. Interrupted publication closes admission as
FAULTED. No persistent format or commit protocol changes.

## Final results

| Check | Outcome | Original record |
|---|---|---|
| Complete `make check`, pinned SBCL 2.6.9 | exit 0, source STABLE; strict build, 93 engine cases, all standard checks and 11 spikes | [Full](full-final-2.6.9.lisp) |
| Unmodified CI self-test inside the final full run | all 364 cases passed across seven modules | [CI](ci-final-2.6.9.lisp) |
| Targeted delta/renewal/maintenance, SBCL 2.6.10, final sources | 33 cases passed, source STABLE | [Targeted](targeted-final-2.6.10.lisp) |
| Allocation, final sources, SBCL 2.6.9 | 30 windows, 3,000,000 checked lookups; every window 0 observed bytes-consed | [Allocation](allocation-final-2.6.9.lisp) |
| Allocation, final sources, SBCL 2.6.10 | same fixed workload and result | [Allocation](allocation-final-2.6.10.lisp) |

The final full run checked 456 Lisp sources with zero lint violations and
139 requirements, 71 invariants, 13 fault-injection scenarios, and 71 ADRs
with zero traceability errors. Its recorded command is `make check-core`,
invoked by the `make check` recording wrapper. All recorded source blobs
matched the working tree again after completion.

The targeted suite includes independently constructed five-word descriptors,
full-width field boundaries, exact array-byte accounting, admission before
WAL effects, corrupt/unpublished state rejection, unchanged output on
tombstones, reentry and primary-error preservation, and complete public GET
with the resident handle disconnected in a test-only scope. Differential
checks execute 200 writes/deletes per format and verify all 16 keys after
each operation against an independent value model, including renewal and
restart. Four new SIGKILL cases cover before/after delta publication in both
formats; with the retained delta and renewal cases the targeted run executes
16 SIGKILL scenarios. These are process-crash checks, not power-loss tests.

## Allocation scope and payload

Five warmed windows of 100,000 lookups cover each of delta LIVE, delta
TOMBSTONE, and untouched base LIVE in both formats. Keys, output, expected
words, and fixtures are preallocated. The resident handle is disconnected
inside BUSY admission. Expected descriptor words are constructed from known
CSN and pre-append positions; tombstones must preserve a sentinel output.
Warmup, full GC, setup, and reporting are outside each measured window.

Unlike the preregistered plan's outside-window oracle, this driver checks
the outcome and all five expected words **inside** each allocation window.
There is no timed throughput measurement. Zero is an observation from
`sb-ext:get-bytes-consed`, including those checks, on the stated fixtures:
16-byte keys, 23-byte values and small CSNs. It does not qualify RSS, native
allocations, arbitrary full-width no-allocation behavior, or GET latency.

For capacity C, the next power of two at least twice the key quota, array
payload is exactly `57*C + key-byte-quota`. The maximum configured payload is
24,248,320 bytes (23.125 MiB). Activation and renewal count both retained and
new deltas. Lisp headers, objects, GC, and the complete resident index are
additional memory; this increment does not establish an RSS cap.

## Environment and reproduction

Apple M4, ARM64, 16 GiB RAM, Darwin 27.2.0; external load uncontrolled.
Full qualification here uses SBCL 2.6.9. SBCL 2.6.10 has the targeted and
allocation results above, with the CI limitation below. Base commit:
`5eef14ffeb0329a04a2c55a0e3a7c63c6a076ca4`, plus the source blobs in each
record; the implementation was uncommitted during verification.

Run from the repository root, substituting the installed pinned runtime/core
paths when necessary:

```sh
env PATH="/opt/homebrew/Cellar/sbcl/2.6.9/bin:$PATH" \
  SBCL_HOME=/opt/homebrew/Cellar/sbcl/2.6.9/lib/sbcl \
  make check SBCL=/opt/homebrew/Cellar/sbcl/2.6.9/bin/sbcl
sbcl --script tools/record-command.lisp -- sbcl --noinform --no-userinit --no-sysinit --script spikes/results/2026-10-31-engine-location-delta/targeted.lisp
sbcl --script tools/record-command.lisp -- sbcl --noinform --no-userinit --no-sysinit --script spikes/results/2026-10-31-engine-location-delta/allocation.lisp
```

The final full check took 634.68 seconds including all checks and child
processes. This is command duration, not an engine performance metric.
Two C1 readings covered publication/exact-key safety and then numeric bounds,
ownership, payload accounting, and error paths. A late review split the field
validation helper to stay within the ten-path limit; final qualification
was repeated on the resulting unchanged sources. No runtime source changed
after that final run.

## Failed attempts and diagnostic limits

All 19 command records are retained in the [archive index](archive-index.lisp),
including failures and superseded runs. The first three targeted attempts
exposed a wrong expected condition, a test-file parenthesis error, and the
still-wrong condition expectation. The real CSN-stamp rejection is the
existing `invariant-violation :resolver-candidate-csn`. Fixtures were corrected
to that exact early rejection. Exact earlier test blobs and the pre-review
product blob are retained under `snapshots/` with their Git identities.

The first full run was source CHANGED during the C1 refactor and cannot
qualify final sources. It also failed one unmodified CI data self-test on
2.6.10 (`git-only-output-prefixes-allowed`, 363/364). An unchanged standalone
2.6.10 rerun reproduced that failure. Isolated data diagnostics passed;
adding only failure-reason reporting to the coordinator made all 364 pass.
The cause remains unestablished. Diagnostic successes do not replace the
unmodified suite, and no CI assertion or repository CI source was relaxed.
Diagnostic source copies accompany their raw records under `diagnostics/`.

The next full attempt selected the pinned binary but left `sbcl` on PATH
at 2.6.10. An existing child launcher used that name with the inherited
2.6.9 core, causing a runtime/core mismatch in the snapshot-tool self-test.
The final invocation above sets both PATH and SBCL_HOME coherently; the
unmodified complete suite, including CI, then passed on 2.6.9.

## Remaining boundaries

The full resident index is still required for write preflight/publication,
image construction, source counts, and recovery verification. Automatic
resident/paged selection, releasing the resident index, bounded startup,
and workloads larger than physical RAM remain open increments. There is
no new lock-free, concurrent-reader, snapshot-reclamation, Linux, x86-64,
throughput, or power-loss qualification in these results.

Raw records use lossless gzip with byte-count and SHA-256 verification.
Descriptors are read through `tools/evidence-storage.lisp`; collection and
catalog hashes cover the closed file inventory. FASLs and disposable data
files are excluded. The archive preserves observations; it does not
automatically promote requirements or release gates.
