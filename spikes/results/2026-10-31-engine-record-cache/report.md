# Verified record cache integrated into M1

The existing per-Serie record cache is now connected to the production engine,
automatic RAM/paged primary storage, live rotation/compaction and Unix service.
It is privately constructed from a separate fixed payload grant; zero remains
the default. Use `:record-cache-budget 1048576` in the engine/service library or
`--record-cache-budget 1048576` in the server CLI for the normal 64 KiB frame
limit. A 4 MiB grant was used for the paired measurements below.

Every hit still verifies CRC, exact key, CSN, flags and size. Cache corruption
falls back to canonical storage and reports the event; canonical source failures
still fault admission. A warm cache never bypasses ACTIVE/CLOSED membership.
Writes and compaction do not retag/invalidate cached records. RAM/paged switching
keeps one coherent logical path. [Contract](../../../docs/adr/0079-cache-record-m1.md).

## Qualification

The frozen final source contains **1,602 inventoried files**. Both campaigns
retain identical byte identities before/after execution:

- [Complete SBCL 2.6.9 check](full-check-2.6.9/report.lisp): product compilation/tests,
  lint, trace, links, legal/full-text checks, evidence and command-archive negative
  fixtures, SPK-01 through SPK-11 correctness, and CI self-tests; passed.
- [Strict SBCL 2.6.10 build and complete product tests](strict-2.6.10/report.lisp):
  warnings and style warnings are errors; passed. Compiler optimization notes
  remain in the raw diagnostics. The engine suite now has 167 registered methods.
- [Documentation](documentation/report.lisp): 553 Markdown documents, 1,106 HTML
  pages, 84,344 local links/anchors, runtime reference consistency across 53 packages,
  and the public Unix PUT/GET/reopen/DELETE example; passed. Existing renderer and
  isolated documentation-dependency warnings are retained, separate from product
  warning-free qualification.
- Seven new engine methods and two local dispatcher/configuration methods cover
  exact/minimum/zero budgets, v1/v2, all primary profiles, ACTIVE/CLOSED, recovery,
  update/delete, compaction, migration, cache/source corruption, canonical proof
  rejection with a warm record, closure and CLI validation. The
  [focused campaign](focused-nine/report.lisp) passes all nine explicit methods.
- The existing real Unix automatic-index campaign now runs its 1,200-key paged
  write/crash/recovery/return-to-RAM scenarios with a 1 MiB record-cache grant,
  for both formats. The complete real-process/crash suites remain part of both
  product campaigns; repetitions are not added as independent coverage.

[Two static readings, decisions and retained development failures](review.md).
These are local C4 results, not MC/DC, Linux, physical power-loss or phase-gate
qualification. No spike implementation was copied into product code.

## Direct engine measurement

SBCL 2.6.10, macOS ARM64, safety 3. The
[preregistered method](method.md) compares cache zero/4 MiB on identical workloads:
eight hot keys, 128 strong overwrites, 2,048/60,000-byte values, v1/v2 and all
primary profiles. ACTIVE, compacted and freshly reopened phases each have five
repetitions of 4,096 checked warmed GETs: **24 configurations, 360 samples,
1,474,560 timed GETs**. The following ranges compare the median throughput of
five repetitions in each matched case, across both formats and all three phases.

| Primary profile | Value bytes | Throughput improvement | Baseline → cached P99, microseconds |
|---|---:|---:|---|
| Automatic RAM | 2,048 | 35.7–40.1% | 3 → 2 |
| Automatic paged | 2,048 | 14.3–23.0% | 4–5 → 4–5 |
| Automatic RAM | 60,000 | 2.1–7.4% | 17–20 → 17 |
| Automatic paged | 60,000 | 1.7–5.4% | 19–20 → 19–20 |
| Legacy RAM reference | 2,048 | 36.7–40.3% | 3 → 2 |
| Legacy RAM reference | 60,000 | 1.6–7.4% | 17–18 → 17 |

**All 360 timed engine samples observed zero managed allocation**, with and
without cache. This concerns the measured hot loop, not startup or process RSS.
RAM cases remove all 4,096 record-read API calls per sample. In paged ACTIVE
cases, 6,144 total read calls become 2,048; the remaining calls belong to primary
pages. Compacted/reopened paged cases remove their 4,096 read calls after warmup.
These are API counters, not physical-device traffic.

The 4 MiB grant reserves 4,168,172 bytes of accounted cache payload, excluding
Lisp headers/mutexes. Retained cache data are verified again on every hit;
the observed gain falls for large values, whose copies and checksums are still required.
The single cached CLOSED row map is still reverified on a map miss; random
cross-segment thrashing and cache scan pollution remain unmeasured here.

[Raw command](engine-benchmark/report.lisp), [aggregates](metrics.lisp),
[36 exact comparisons](comparison.lisp), [computed ranges](ranges.lisp-data).

## Unix measurement

A subsequent serial campaign runs the production server in a separate process:
v1/v2, normal RAM and a 3,400,000-byte primary quota that is proved paged by
seeding 1,200 distinct keys; cache zero/4 MiB; eight hot 60,000-byte CBOR documents.
Five repetitions of 1,024 checked synchronous round trips per configuration:
**8 configurations, 40 samples, 40,960 timed GETs**. Startup, strong seeding and
warmup are excluded. Original server stdout/stderr are in `unix-logs/`.

| Primary / format | Throughput change | P50: zero → cache, µs | P99: zero → cache, µs |
|---|---:|---:|---:|
| RAM / v1 | −2.1% | 215 → 212 | 277 → 257 |
| Paged / v1 | +2.1% | 220 → 217 | 247 → 240 |
| RAM / v2 | +1.6% | 214 → 212 | 299 → 235 |
| Paged / v2 | approximately 0% | 220 → 219 | 243 → 279 |

There is **no demonstrated material end-to-end throughput improvement for this
60 KB Unix workload**: the variation is about ±2.1%, and one P99 worsens. The
small direct-engine gain does not dominate transport/client processing. This
single-client campaign does not qualify loaded service tails; allocation fields
refer to the client, not the server. Cache therefore remains opt-in by grant.

[Raw Unix command](unix-benchmark/report.lisp), [aggregates](unix-metrics.lisp).

## Integration and retained evidence

The code/test changes are based on `f3c8350`. Remote `f3b2079` adds an independent
review driver and historical evidence only; merging it changes no product,
test, build or documentation-tool executable path. Its original artifacts are
preserved. The complete frozen source inventory and exact proof-driver hashes
are retained separately from development/preliminary runs. Reports retain their
original bytes through verified lossless gzip descriptors; raw stdout/stderr
are never normalized. [Archive copy manifest](archive-copies.lisp).

The next write-performance integration boundary is
[bounded group admission](next-integration.md), including cumulative index
reservations and FIFO publication after a shared durable flush. It is not part
of this completed cache increment, and no group-commit speedup is claimed.

[Final integration proof](final-integration.lisp) confirms all 1,602 qualified
source files still match exactly after merging `f3b2079`, and verifies 66 original
archive copies through lossless storage. The
[merged-tree checks](final-merged-checks/report.lisp) pass lint, trace, links and
evidence validation. [Cleanup](cleanup.lisp) removes 206,251,575 logical bytes of
regenerable build, spike-output and exact-worktree compiler-cache files. This is
logical size, not a measured count of physical blocks released. Qualified records
remain archived; the primary checkout and other chats' files are untouched.
