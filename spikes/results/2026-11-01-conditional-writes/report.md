# Current versions and conditional writes — qualification

Scope: [ADR-0085](../../../docs/adr/0085-conditional-current-writes.md).
Current versioned GET and conditional strong PUT/DELETE are integrated through
the serial engine and optional Unix capability 6. Expected zero tests current
absence; positive CSNs prevent stale writes after delete/reinsert. Conflict
returns the current live version without writer maintenance, append, CSN or flush.
The same primary lookup handles RAM, legacy images/deltas and automatic paging.
Existing GET returns exactly two values, previous handshake bytes are preserved,
and mutations retain the original strong writer and unknown-outcome behavior.

## Completed qualification

The [source identity](source-identity.lisp) verifies all **1,668** non-result files
against the complete equal inventories in the final focused campaign, full SBCL
2.6.9 `check-core`, strict 2.6.10 build/tests, documentation, both serial benchmark
campaigns and the CI self-test. Each completed command has an exit-zero terminal
marker, stable source inventories and a preserved raw report.

- 24 new permanent methods; independent engine histories cover 570 transitions
  across both formats and all three primary profiles. Independent wire fixtures
  cover eight capability combinations and 132 ID/token/operation configurations.
- 186 engine methods per runtime, plus the existing 36 group-crash scenarios,
  108 child processes and 72 verified SIGKILLs. Local qualification covers 14
  process methods, 141 children, 34 scenarios and 18 SIGKILLs per runtime.
  [Structured counts](qualification.lisp).
- Tests include whole-input validation, full u64 token carry, ABA, saturated
  capacity, unchanged files/frontiers/flushes on conflict, callback exclusion,
  fault/nonlocal cleanup, rotation/reopen, actor write barriers, absolute
  deadlines, malformed response classification and a deliberately dropped
  response after a real conditional strong commit.
- All 11 historical spikes, evidence/tool negative tests and CI self-tests pass.
  Documentation verifies 560 Markdown documents, 1,144 HTML pages, 87,179 local
  links/anchors, 696 exports and 633 runtime-matched prose contracts.

## Serial measurements

Both runtimes use the same hashed measurement and server drivers. Twelve engine
cases cross formats 1/2, legacy/resident/paged indexes and 128/4,096-byte values;
four real Unix cases cross formats and resident/paged storage with 128-byte
values. Five alternating-order windows per operation/case produce **800 timed
samples and 128,000 operations** overall. Every result/token is checked. All
3,840 timed engine writes have exactly one durable flush each; all timed engine
reads and conflicts have zero flushes. Unix flush counts are not inferred from
the client's counters. [Method](method.md), [raw samples for 2.6.9](samples.lisp),
[2.6.10](samples-2.6.10.lisp) and [validated metrics](metrics.lisp).

The following numbers are medians across case medians, in microseconds per
operation. PUT includes the full strong flush; these are repeated-window costs,
not individual request latency percentiles.

| Runtime/layer | GET | Versioned GET | Conflict | PUT strong | Conditional PUT strong |
|---|---:|---:|---:|---:|---:|
| 2.6.9 engine | 3.344 | 3.236 | 0.855 | 3,664.250 | 3,885.094 |
| 2.6.10 engine | 3.736 | 2.893 | 0.826 | 3,732.125 | 3,827.406 |
| 2.6.9 Unix | 34.625 | 31.084 | 32.045 | 3,695.938 | 3,931.719 |
| 2.6.10 Unix | 34.906 | 30.951 | 33.459 | 3,758.781 | 3,869.594 |

The median paired conditional/ordinary PUT cost ratios are 1.0633/1.0218 in the
engine and 1.0638/1.0282 over Unix for runtimes 2.6.9/2.6.10 respectively. The
additional condition is not free; strong flush cost still dominates a successful
write. A rejected stale write avoids that flush. GET ratio variation, especially
the 0.525..1.449 engine case range on 2.6.9, does not establish an API speedup or
a regression bound against older code. These are local same-final-code comparisons,
without confidence intervals, concurrency scaling or a prior-revision baseline.

## Evidence and scope limits

Command copies are verified byte-for-byte, then large reports and raw diagnostic
streams are compressed losslessly with verified expansion hashes. The closure
and cleanup ledgers scope removal to regenerable paths in this worktree, its
exact versioned compiler caches and the one owned empty failed benchmark fixture.
Other checkouts, chat worktrees, Git history and shared caches are untouched.
The [closure](closure.lisp) verifies 135 copied files and 30 compactions; final
self-record streams have their own lossless receipts. Post-compaction analysis
reproduces the same metrics. The [cleanup ledger](cleanup.lisp) records
**201,816,913 regular-file bytes** removed from owned regenerable paths. This is
a logical byte count, not an APFS physical free-space measurement.

Preserve development records separately: the first benchmark completed engine
cases but rejected an absolute server script path before launching a Unix child;
the corrected final drivers use the required relative path. Two convenience
printer form errors are also retained with their variants. None alters qualified
product sources or final measurement samples. [Review](review.md).

This is single-operation current-only optimistic comparison, not complete
transaction write sets, historical MVCC, multiseries 2PC, exactly-once delivery,
power-loss qualification or a completed memory/RSS allocation qualification.
A conflict after a lost response does not identify who committed the value.
