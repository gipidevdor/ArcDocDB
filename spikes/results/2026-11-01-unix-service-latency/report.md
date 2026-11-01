# Unix socket full-frame buffers and latency profiling

This increment integrates the completed owner-local histogram component and
uses it in a C4 adapter around the actual production service. The measured
fragmentation motivated a bounded acquisition-time buffer reservation; actor
scheduling, engine/wire formats and strong durability remain unchanged.

The unchanged-code baseline is 66 cases, 330 windows and 512,000 operations.
Both baseline and candidate calibration have eight cases, 48 windows and 86,400
operations. The parent/server/common drivers are byte-identical across these
campaigns. All checked values, per-key versions, consecutive acknowledged CSNs,
strong frontiers and histogram nearest-rank bounds passed.

In calibration, 60,000-byte single-connection response queue-to-drained P50 falls
from 126–132 µs to 6 µs; engine read P50 stays around 19–26 µs. Accept calls per
completed request fall from about 18 to 4. These observations support reduced
fragmentation; residence includes partial sends/backpressure and is not merely
the first-send delay. The original proposal to add another output phase was
deferred. Profiling overhead and all unprofiled windows are retained separately.

The first final unprofiled matrix also passed all 66 cases/330 windows/512,000
operations. Selected format-2 medians of actual completed throughput are:

| Mode / connections | Baseline MB/s | Full-frame MB/s | Gain | Baseline → candidate window P50 |
|---|---:|---:|---:|---:|
| Resident / 1 | 243.29 | 595.55 | 2.448× | 232 → 98 µs |
| Resident / 8 | 277.45 | 762.82 | 2.749× | 976 → 458 µs |
| Paged / 1 | 222.91 | 548.17 | 2.459× | 272 → 103 µs |
| Paged / 8 | 265.18 | 746.95 | 2.817× | 1,022 → 468 µs |

Across all sixteen 60,000-byte cases (both formats, modes and all four connection
counts), measured gains range from 1.409× to 4.314×. Keep the full range rather
than selecting the largest gain. Small-read results include a 0.981× case.
Mixed workloads range from 0.441× to 1.516×; their CSN/strong-group ledgers still pass.
Host load and durability costs were not isolated, so no write-speed improvement
or causal attribution of these mixed-workload fluctuations is claimed. Forced
maintenance cases pass at 1.039×/1.098× measured throughput. Profiling off/on
ratios remain available in the calibration artifacts; do not subtract phase
percentiles or interpret negative apparent overhead as a profiler speedup.

The increment's 1,703 non-result source files passed the complete SBCL 2.6.9
`make check-core` (including all eleven correctness spikes and CI self-tests),
the strict full SBCL 2.6.10 build/test run, 151 focused native/wire/actor/client
methods, and complete documentation build/runtime/example checks. Both complete
runs include the unchanged group crash matrix (36 scenarios, 108 children, 72
SIGKILLs) and Unix process suite (18 methods, 50 scenarios, 169 children, 30
SIGKILLs). These are process-crash checks, not power-loss qualification.

Retained failures include four C4 harness setup failures (path/package/API
resolution), the corrected untrusted-FD FType compilation warning, a missing docs
bootstrap after prior owned cleanup, and isolated C4 analyzer/archive syntax/name
errors. Their original records and driver variants are kept; successful runs
replace none of their bytes. Positive self-tests detect malformed quantile/CSN
ledgers, changed copies, incomplete qualification and wrong cleanup/closure scope.

Remote main advanced with the independently completed offline backup while these
checks ran. Merge `b3d949a` preserves that committed history and this increment;
`adf3141` reconciles the existing backup integration spike with sixty suites and
adds metrics to its affected-suite checks. Other worktrees and their branches
were not edited or removed. The original full-run source identity remains a
separate scope from the combined integration identity.

The integrated tree passed another byte-identical 66-case/330-window/512,000-op
matrix. Selected format-2 60,000-byte results are:

| Mode / connections | Integrated MB/s | Gain against baseline | Window P50 |
|---|---:|---:|---:|
| Resident / 1 | 597.06 | 2.454× | 96 µs |
| Resident / 8 | 760.98 | 2.743× | 458 µs |
| Paged / 1 | 557.69 | 2.502× | 105 µs |
| Paged / 8 | 725.50 | 2.736× | 483 µs |

The combined 1,734-file source inventory passed warning-as-error forced product
builds and the affected backup, verifier, metrics and four Unix suites on both
2.6.9 and 2.6.10, including the real Unix process campaign. Combined documentation
checks passed 566 source documents, 1,180 HTML pages, 89,902 local links/anchors,
56 runtime packages, 736 exported bindings and 653 prose contracts. Static
audits and CI self-tests also passed. The earlier full-repository runs and these
combined affected-suite runs are deliberately identified separately.

The integration proof checks that every prior product source remains identical
except the five declared I/O/verifier extension files; new backup/directory
components are exercised by the integration spike. The actor, native transport,
engine, WAL, index and histogram sources remain unchanged after their full runs.
Post-integration global Unix stream defaults still read 8,192/8,192 bytes: only
owned socket grants were adjusted.

Raw windows, all three main matrices, both profiler calibrations, successful and
failed command records, exact failed driver variants and child-copy hashes are
retained. See [comparison](comparison-integrated.lisp),
[increment qualification](qualification-data.lisp),
[full-run source identity](source-identity.lisp), and
[combined integration identity](integration-source-identity.lisp).

[Evidence closure](closure.lisp) passed 1,690 retained-file hash checks after
lossless compaction. A subsequent independent replay of all 66 baseline versus
integrated comparisons also passed using the compressed data. The completed
closure command and final archive records are retained in the
[tail archive](tail-archive-data.lisp), including the failed diagnostic records.

[Owned cleanup](cleanup.lisp) removed nineteen generated/cache/failed-fixture
roots totaling **214,062,507 logical regular-file bytes**. This is not a physical
free-space measurement. `_build`, this worktree's spike output and exact
2.6.9/2.6.10 cache prefixes were removed only after verification; other worktrees,
branches and shared Git storage were not cleaned. Final artifact/source checks
run again after cleanup before publication.

The final main reconciliation also includes the completed counter/aggregation
component from `5c0a5a1` and the independently measured offline comparison from
`dc8e3fc`. Warning-as-error product builds and affected metrics/backup/verifier/
Unix suites passed on both runtimes; the later offline-only change received
fresh forced builds and both offline suites on both runtimes. The final docs,
CI and static audits passed again (568 documents, 1,188 HTML pages, 90,601 local
links, 56 packages, 758 exported bindings and 670 prose contracts).

Four final large-read controls reuse the exact original benchmark definitions,
server and common adapter: format 2, resident/paged, one/eight connections,
five windows of 400 rounds each, **36,000 checked GETs**. Results are 576.00/529.84
MB/s with one connection and 764.75/728.99 MB/s with eight (resident/paged).
Their source scope is the completed metric integration before the subsequent
offline-only comparison change; no read/engine/transport source changed in that
later update. All raw controls are retained, with the isolated C4 reader-scope
failure and its corrected driver variant.

The [final 1,750-file identity](late-main/source-identity.lisp) distinguishes
earlier unchanged-source integration from the seven explicit backup extension
paths and their fresh checks. Against `dc8e3fc`, the sole product difference is
`src/local/native.lisp`, byte-identical to the native file in the earlier full
runs. [Final closure](late-closure.lisp) verifies the new copies separately from
the original archive. [Final cleanup](late-cleanup.lisp) removed four regenerated
roots totaling another 159,262,841 logical bytes. These are cumulative removals
of generated files across the two phases, not a net physical-space claim.

[Preregistered method and amendment](method.md) · [Two C1 readings](review.md).
