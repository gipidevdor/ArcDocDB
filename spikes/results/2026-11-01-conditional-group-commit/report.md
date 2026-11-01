# Conditional same-turn group commit

Independent conditional PUT/DELETE requests that are already ready in the same
actor turn now share the existing strong group commit. Eight independent writes
use one durable flush instead of eight, without a production batching timer or
peer wait. A condition depending on any preceding queued key drains that group
first. Conflicts consume no CSN; an all-conflict group performs no writer
preflight, maintenance, append or flush. Existing independent SEALs, FIFO
publication, strong acknowledgment, wire bytes and public APIs are preserved.

The implementation follows [ADR-0086](../../../docs/adr/0086-conditional-same-turn-group-commit.md)
and the [preregistered method](method.md). Fixed payload scratch is 208 bytes per
engine and 80 bytes in the single service collector, plus object/array headers.
See the [review](review.md) for ownership, deadline and fallback reasoning.

## Qualification

All final campaigns completed against the same 1,676-file source inventory;
the unchanged-code baseline matches the preceding increment's 1,668-file
inventory. The [source identity](source-identity.lisp) binds the focused tests,
full SBCL 2.6.9 check, strict SBCL 2.6.10 tests, documentation, both final benchmark
campaigns and CI self-test. No failed development command qualifies product code.

There are 21 new test methods: eight engine, eleven actor and two process
methods. Engine coverage includes 576 operations compared with a serial model
across both durable formats and legacy/resident/paged primary profiles, followed
by rotation, compaction and reopen. Tests cover mixed/all conflicts, same-key
ABA, barriers, input/output aliases, capacity fallback with original conditions,
expired-member metadata alignment, failures after flush, encoder failure and
nonlocal cleanup. Actor tests cover administrative group limits 1/2/8 and a
partial peer. Actual Unix peers verify durable versions after SIGKILL; public
client threads verify a deliberately lost strong reply and the subsequent
explicit conflict/read results.

Both full runtime campaigns passed without warnings, including 194 engine
tests each. The [qualification summary](qualification.lisp) records, per runtime,
the existing group crash matrix of 36 scenarios, 108 children and 72 SIGKILLs,
and the local process suite of 16 methods, 153 children, 42 scenarios and 22
SIGKILLs. The full 2.6.9 check also completed all eleven spikes. The independent
CI self-test completed its terminal success marker.

Documentation checks passed: 561 Markdown sources, 1,148 generated HTML pages,
87,476 local links/anchors, 54 runtime packages, 696 exported bindings and 633
prose contracts. The public Unix client roundtrip/reopen example also passed.

## Controlled cohort measurement

The baseline and final 2.6.9 campaigns ran serially on this Mac. Each campaign
contains 80 timed windows, 640 actual cohorts and 2,400 conditional mutations:
formats 1/2, resident/paged primary storage, widths 1/2/4/8, five windows per
case and eight cohorts per window. Documents contain 128 bytes. A C4-only gate
releases a complete bounded cohort; it is absent from the production actor.
The analyzer verifies the driver identities, identical timed definitions,
unchanged server driver, every raw child-log hash, cohort flush counts, CSNs and
post-window values. The only final parent-driver change namespaces untimed log
copies to prevent temporary-name reuse.

Each cell below is the median window elapsed time divided by its operation
count, in milliseconds per operation: **before → after**. These are amortized
cohort costs, not the response latency of each individual request.

| Format / primary | Width 1 | Width 2 | Width 4 | Width 8 | Width-8 gain |
| --- | ---: | ---: | ---: | ---: | ---: |
| v1 / resident | 3.994 → 7.685 | 3.710 → 1.837 | 3.872 → 0.985 | 3.705 → 0.476 | 7.79× |
| v1 / paged | 3.739 → 3.828 | 3.796 → 2.043 | 3.747 → 0.994 | 3.897 → 0.542 | 7.19× |
| v2 / resident | 3.857 → 4.272 | 3.869 → 2.364 | 3.771 → 1.310 | 3.764 → 0.632 | 5.96× |
| v2 / paged | 3.754 → 3.966 | 3.731 → 2.045 | 3.748 → 0.978 | 3.840 → 0.531 | 7.24× |

Observed durable flushes fall from 2,400 to 640 across the complete campaign.
At width eight the reduction is 87.5%; measured gains range from 5.96× to
7.79×, with a median across the four cases of 7.21×. Widths two and four also
improve in all four cases. Exact values and supplementary 2.6.10 measurements
are in [metrics.lisp](metrics.lisp). The 2.6.10 final campaign independently
checks another 2,400 mutations and 640 flushes; it has no old-code baseline and
does not establish a cross-runtime speedup.

## Singleton anomaly and diagnostic

The v1/resident singleton result in the primary 2.6.9 campaign is slower than
baseline and remains in the table. Its five window averages increase from
4.151 through 6.685, 7.685 and 8.935 to 12.757 ms/op. The supplementary 2.6.10
singleton medians are 3.727–3.993 ms/op across the four cases. This alone does
not explain the anomaly or demonstrate a regression bound.

A separate 2.6.9 diagnostic alternates the old and new dispatcher functions
inside the same server process, on the same engine and file, with one flush per
write. Immutable old function sources are checked against base `4818552`.
There are twenty old and twenty new calls in each of the four cases, with
alternating starting order. Per-call parent and flush wall times are paired
before taking medians; the residual is parent time minus time inside
`durable-flush`.

| Format / primary | Parent old → new (ms) | Residual old → new (µs) |
| --- | ---: | ---: |
| v1 / resident | 3.439 → 3.866 | 136.0 → 124.5 |
| v1 / paged | 3.922 → 3.934 | 93.5 → 92.5 |
| v2 / resident | 3.960 → 3.904 | 87.0 → 91.0 |
| v2 / paged | 3.981 → 4.002 | 93.5 → 88.5 |

The original doubling was not reproduced. Most wall time is inside the existing
durable flush; the v1/resident diagnostic still has a higher new median, along
with a higher flush median. This supports investigating flush variability but
does not isolate the original cause, measure pure device time, or prove absence
of a latency regression. The diagnostic uses runtime function replacement and
is explanatory evidence, not product qualification. Its checked raw logs and
results are retained in [diagnostic/summary.lisp](diagnostic/summary.lisp).

## Limits and retained evidence

These measurements demonstrate available coalescing for complete ready cohorts.
They do not measure the probability of natural request coalescing, individual
RPC tail latency, P99, allocation/RSS limits or reference-platform throughput.
Host load and storage latency are uncontrolled. SIGKILL/reopen checks do not
qualify power-loss behavior. Independent SEALs retain prefix recovery, not group
transaction atomicity, historical MVCC or exactly-once delivery. Descriptor and
wire-copy allocations remain in M1; this does not close COD-30.

Completed command records, child logs, failed development fixtures and their
byte hashes are retained. Large raw records/streams are compressed losslessly
and verified before owned generated files are removed. Cleanup excludes other
chat worktrees, the primary checkout and shared Git maintenance.

The completed [closure](closure.lisp) verifies 164 retained file hashes and
records 86 compactions; the [final self-record compaction](tail-compaction.lisp)
preserves the closure command and a successful analysis of the compressed logs.
The [cleanup receipt](cleanup.lisp) records removal of 203,714,311 logical bytes
from nineteen owned generated directories. This is a regular-file byte count,
not a measurement of physical free-space change.
