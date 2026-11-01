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
Mixed workloads range from 0.441× to 1.516×; their CSN/flush ledgers still pass.
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

The remote main branch advanced with the independently completed offline backup
while these checks ran. Integration of that committed state, any subsequent
combined-source qualification, archive closure and owned cleanup will be recorded
below. The completed increment measurements above remain a separate source scope.

[Preregistered method and amendment](method.md) · [Two C1 readings](review.md).
