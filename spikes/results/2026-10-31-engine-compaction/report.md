# Serial M1 canonical compaction — 2026-10-31

Implements full-prefix current-only compaction in the production engine. The
existing index decides the globally latest live records. The exact maximum-CSN
record is retained even when it is a tombstone, preserving restart high-water
without resurrecting deleted keys. Records are copied byte-identically into
fresh ascending IDs; a later header-only ACTIVE follows every output.

Outputs are independently verified against original canonical bytes and current
membership before the first CONTROL publication. That durable decision replaces
the complete source set and records every old source as REMOVED. Only after
serial reader retirement and location publication may an inode/header-bound
positive removal capability unlink those leaves. Parent synchronization precedes
a second CONTROL checkpoint that prunes deletion metadata without reusing IDs.
Normal recovery completes either durable decision. No data CSN is allocated.

The automatic RAM/paged primary remains one logical index. Paged compaction uses
location-only persistent path copying; ordinary PUT/DELETE CSN validation is
unchanged. No resident key table is rebuilt. Work buffers and source metadata
are bounded by the configured file/record/segment limits, independent of key
cardinality. Legacy sealed images and their deltas are retired when physical
source identity changes; this compatibility path does not redefine automatic
paging.

## Qualification scope

Targeted cases cover v1/v2 and legacy/resident/paged; exact values, deletions,
CSNs, runtime identities, reopened data, physical reclamation and stable resource
counts; automatic repeated maintenance; empty/all-deleted archives; gain/capacity
no-op; corrupted outputs rejected before CONTROL; declared I/O errors at twelve
phases; nonlocal exits; unlink errors before/after kernel effect; active EBR and
snapshot rejection before effects; location relocation with inline/external
keys, stale/idempotent requests and unchanged normal CSN guards.

The real SIGKILL matrix has 44 scenarios: both formats, RAM/paged, eleven
publication/reclaim boundaries. Each uses three independent child lifetimes:
kill during maintenance, reopen/check/write next CSN and kill again, final
reopen/check. Total: 132 child processes and 88 deliberate SIGKILLs.

A separate real Unix service workload overwrites four keys with 1200 valid
60000-byte CBOR values per format. Its 72 MB logical history must fall below
16 MiB of physical segment files through automatic compaction, then survive
SIGKILL, recover exact values and continue at CSNs 1201/1202.

## Performance method

[Benchmark driver](bench.lisp) measures product APIs in a private archive: 4096
strong overwrites, 128 live keys, 4096-byte values. Five timed samples of 2048
hot GETs run on each side, with independent byte/value checks. Every latency
sample is retained; P50/P99/max, throughput and allocation are reported.
Compaction records elapsed time, allocations, counted IO bytes/calls and flush
calls. Full GC lies outside timed regions. Dynamic heap includes the driver;
it is neither process RSS nor a standalone index-memory measure. Canonical
CSNs/backend remain unchanged and a fresh reopen verifies all keys.

The initial resident-v2 measurement, before the final integration-test changes,
reclaims 16641024 of 17170560 input bytes (96.92%); outputs occupy 529472 bytes
plus a 64-byte ACTIVE. Maintenance takes 0.064482 seconds, allocates 589744
bytes, reads 71342860 bytes in 572 calls, appends 529928 bytes in seven calls
and performs fifteen flush calls. This exposes the cost of repeated independent
canonical verification rather than hiding it behind write throughput.

These are local macOS ARM64 measurements. Synchronous M1 maintenance pauses the
request executing it; warm GET timing does not establish request-tail latency
under load. Concurrent readers/background compaction, partial merges, historical
MVCC, multiseries, power loss and reference-machine phase gates remain separate
work. No benchmark establishes “absolute” performance across workloads.

## Recorded attempts

[Final targeted twelve-case campaign](targeted-twelve-2.6.9/report.lisp),
[rotation and real-service integration](integration-2.6.9/report.lisp),
[benchmark self-test](bench-selftest-2.6.9/report.lisp) and
[initial resident-v2 measurement](bench-initial-resident-v2/report.lisp) pass.
The integration campaign also runs all existing live-rotation cases; its Unix
workload demonstrates automatic physical compaction through the unchanged client.

Early attempts are retained, not normalized away: a specialized empty-buffer
default; an inappropriate same-CSN normal-index update (replaced by a separate
location-only operation); missing ASDF registration; driver/test parentheses;
a test key larger than its fixture's frame allowance; wrong snapshot-helper
arity. Integration required adjusting old rotation expectations because obsolete
files are now legitimately reclaimed and legacy renewal counters reset when the
old image is retired. The final test accumulates observed renewals while retaining
all byte, value, CSN and backend assertions. Compiler/test failures are not
reported as passing measurements; no warning or CSN guard was suppressed.

Raw command reports retain stdout/stderr exactly, command arguments, environment
and before/after Git blob inventories. Large reports are stored as verified
lossless gzip payloads behind the repository's normal evidence descriptors.

[Documentation build and rendering checks](docs-2.6.9/report.lisp) pass on the
integrated manual. The first warning-strict full build stops at an unused local
manifest binding left after removing the old blanket rejection of compaction
sources. That binding is removed; the warning policy remains unchanged. The
[failed strict attempt](attempt-full-unused-binding/report.lisp) is retained.

The [independent SBCL 2.6.10 warning-strict all-suite build](strict-2.6.10/report.lisp)
passes with exit code zero and stable source inventories. Every product source
is forcibly recompiled; warnings and style warnings remain errors. Timing runs
are scheduled only after both qualification commands finish.

## Final qualification and measurements

The [complete SBCL 2.6.9 gate](full-2.6.9/report.lisp) passes: warning-strict
product compilation/all tests, lint and linter tests, command/snapshot/reader
runner tests, traceability, links, full-text fixtures, evidence tooling/storage/
publication/normalization/collection and validation, SPK-01–11 correctness and CI
self-tests. The independent strict 2.6.10 product gate also passes.
[Source identity](source-identity.lisp) checks all 1583 inventoried files identical
before/after both gates, across all eight final benchmarks and against the final
working files. No source changed during these qualifications.

[Exact final metrics](metrics.lisp) retain the raw-record paths. Each row is one
compaction measurement and five GET samples per side; GET figures below are
medians across those five samples, not eight independent replications of each
configuration. All eight fresh-reopen byte/CSN checks pass.

| SBCL | Format | Index storage | Compaction ms | GET/s before → after | GET P99 µs before → after |
|---|---:|---|---:|---:|---:|
| 2.6.9 | v1 | RAM | 70.750 | 345712 → 367157 | 3 → 3 |
| 2.6.9 | v1 | paged | 125.088 | 113866 → 113419 | 14 → 13 |
| 2.6.9 | v2 | RAM | 72.944 | 347472 → 367816 | 3 → 3 |
| 2.6.9 | v2 | paged | 114.943 | 113620 → 112912 | 14 → 13 |
| 2.6.10 | v1 | RAM | 67.872 | 347649 → 367025 | 3 → 3 |
| 2.6.10 | v1 | paged | 120.962 | 114966 → 113456 | 14 → 13 |
| 2.6.10 | v2 | RAM | 68.894 | 346707 → 365127 | 3 → 3 |
| 2.6.10 | v2 | paged | 121.572 | 114465 → 112825 | 14 → 13 |

Every row uses 17170560 input bytes and retains 529472 output bytes plus a
64-byte fresh ACTIVE: 16641024 bytes reclaimed, 96.92%. All timed GET samples
allocate zero bytes. RAM maintenance allocates 589744–589824 bytes, reads
71342860 bytes in 572 calls and appends 529928 bytes in seven calls. Paged
maintenance allocates 589824 bytes, reads 155426316 bytes in 22378 calls and
appends 631816 bytes in 135 calls, including index path copying. Each performs
fifteen flush calls. These are counted API bytes/calls, not physical device
traffic. Repeated paged membership probes are a measured optimization target.

RAM hot GET throughput rises about 5–6%; paged hot GET throughput is roughly
flat (0.4–1.4% lower here). There is no demonstrated universal throughput win.
The reliable result of this workload is canonical space reclamation, with its
synchronous maintenance pause reported separately. Each complete qualification
ran before the timed matrix; final benchmark processes ran sequentially.

[Final lint, traceability, links and manual rendering/coverage checks](final-checks/report.lisp)
pass after adding all final metrics and raw-record links. [Review](review.md)
records publication, relocation, memory/FD and reclamation reasoning with limits.
