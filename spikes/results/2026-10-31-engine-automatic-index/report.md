# Automatic M1 primary index — local verification

2026-10-31 · REQ-IDX-008/013 · [ADR-0073](../../../docs/adr/0073-indice-automatico-operativo-m1.md)
· [Operational contract](../../../docs/implementazione/indice-automatico-operativo.md)
· [Preregistered method](../../../docs/implementazione/indice-automatico-completamento-metodo.md)

Automatic backend selection is implemented for **serial M1**, including writes,
recovery, both migration directions and release of the full resident root.
Resident flat fragments grow while their checked maintenance peak fits the
assigned grant. The disk backend uses fixed cache/path/batch memory. It keeps
no complete resident index; CLOSED resolver rows use one fixed frame instead
of a table for every historical PUT. No disk shadow is maintained while resident.
Canonical WAL/SEAL remains the only data commit.

## Results

| Check | Observed result | Original record |
|---|---|---|
| Complete pinned `make check`, SBCL 2.6.9 | exit 0, source STABLE, 742.40 s; 128 engine cases and all normal gates | [Full](full-final-2.6.9.lisp) |
| Unmodified CI self-test in that run | 364/364 passed | [CI](ci-final-2.6.9.lisp) |
| Targeted final-source tests, SBCL 2.6.10 | 24 new engine cases passed | [Targeted](qualified-targeted-2.6.10.lisp) |
| Bounded-heap write/replay/GET | 4,096 × 32 KiB keys = 128 MiB key bytes, 96 MiB child dynamic heap, 8 MiB index grant; all values verified | [Heap](heap-final.lisp) |
| Warm allocation windows, SBCL 2.6.9 | 10 windows × 100,000 lookups, all 0 Lisp bytes-consed; indexed result and zero index I/O checked | [Allocation](allocation-final-2.6.9.lisp) |
| Same allocation experiment, SBCL 2.6.10 | same result: another million lookups | [Allocation](allocation-final-2.6.10.lisp) |

The full run checked 479 product Lisp files with zero lint violations,
141 requirements, 71 invariants, 13 FI scenarios and 73 ADRs with zero trace
errors, 3,457 links with zero broken targets, all normal self-tests and 11
spikes. All **1,536 source/document blobs** were identical before and after
that run and were checked against the delivered working tree. This is local
working-tree evidence, not a remote GitHub run or a claim about HEAD alone.

The Unix dispatcher now has a positive test beyond its old 28-entry fixture
limit. The old BUSY/noncommit oracle explicitly uses the legacy reference
profile. Normal default service handles use automatic growth.

## Scope of the experiments

PUT/GET/DELETE, repeated transitions and replay run in v1/v2 with 4/16/64 KiB
frames. Both a shrinking live set and changed grants trigger return to RAM.
An increased grant on an already resident handle permits a larger maintenance
peak without an unnecessary disk transition: the case uses twelve maximum-
length keys and asserts zero transitions. Quota rejection, full digests with
unequal exact keys, absent deletion, u64 descriptors/CSNs, node corruption,
fixed-work bounds, partial append, source witnesses and CLOSED map-cache reuse
have explicit oracles.

The core differential model applies 1,800 mutations and repeatedly compares
all 127 keys to an independent hash table. Separate forced full-hash-collision
cases preserve exact keys, long prefixes and high-bit u64 values through copy
and deletion. Supplemental fixtures vary collided key lengths from 8 through
65,535 bytes and churn 600 resident commits without accumulating dead key bytes.

There are 26 real SIGKILL checkpoint combinations (13 stages × v1/v2), followed
by independent reopen/value/frontier verification. Stages cover preparation,
verification and publication of both mode switches and compaction, as well as
before WAL append, after durable flush, index update and completed commit.
A deliberately wrong frontier oracle fails as expected. Separate exception
and nonlocal-exit tests verify that retired source input/append descriptors
are closed even if the observer exits immediately after publication.

The heap fixture generates one key at a time and uses ten write processes
followed by a fresh verification process. Existing M1 startup checkpointing
provides the segment boundaries; no hot rotation implementation is implied.
Final replay reports 4,096 entries, 134,217,728 key bytes, a 140,922,624-byte
derived file, no resident root, and a 1,225,824-byte fixed controller reservation.
The sampled final dynamic usage is 84,851,168 bytes under a 100,663,296-byte
child limit. These are managed-heap observations, **not process RSS or peak RSS**.
The index grant also bounds resident maintenance and simultaneous disk workspaces.

The allocation fixture has 180 keys of 128 bytes, low CSNs, a preallocated
output and 64 explicitly configured cache frames. Five warmed windows per
backend per SBCL version observe no Lisp allocation; an I/O hook asserts no
index read during them. This isolates warm lookup, not full GET, large-cardinality
DRAM behavior or arbitrary-value allocation behavior. Raw timing ticks are
retained, but other qualification processes ran concurrently, so no calibrated
throughput, p99 or speedup is claimed. Disk misses, compaction and CLOSED-map
misses perform blocking I/O; a resolver miss reverifies a bounded segment.

## Review and unsuccessful attempts

[Two C1 readings and 113 compound decisions](review.md) cover layout, bounds,
source lifetime, publication, cleanup and progress assumptions. Both readings
were by the implementation author; no independent review or complete MC/DC
certificate is claimed.

The review found two operational defects and added regression oracles before
delivery: retired descriptors could escape cleanup after a publication callback
exit, and a resident factory ceiling could retain an earlier, smaller grant.
Both are fixed. The exact pre-retirement source files were recovered and their
Git blob identities checked against the diagnostic record. Failed quota
reproduction, successful regressions, syntax/fixture attempts, and original
successful records are preserved without rewriting their outcomes. One full
run was intentionally stopped for the retirement fix; another exposed the old
fixed-capacity Unix test assumption. Only the final full run above qualifies
this implementation.

The archive includes the final changed-source snapshots and identities, the
working-tree patch, prereview differences, drivers, diagnostics and compressed
original command records. It excludes FASLs, temporary database fixtures and
per-process compiled caches. Earlier location-delta/renewal work is preserved;
its explicit legacy profile remains the differential reference.

## Limits and reproduction

Executed locally on macOS ARM64 / Apple M4 with SBCL 2.6.9 and 2.6.10. The new
I/O operation uses the Darwin/Linux POSIX `unlinkat` ABI and injected callbacks;
Linux execution is **not** qualified by these local results. Physical-RAM-scale
capacity, power loss, concurrent snapshots, multiseries operation, complete
hot rotation and whole-engine performance retain their separate gates.
Neither immutable nodes nor zero observed allocation is a proof of formal
lock-free GET. M1 serial admission, GC/runtime progress and blocking miss paths
remain explicit.

The [operational contract](../../../docs/implementazione/indice-automatico-operativo.md)
contains configuration, charged-memory formulas, layout, recovery, cleanup and
rollback requirements. Files in `drivers/`, including `targeted.lisp`, `allocation.lisp`, `heap-driver.lisp`
and `heap-worker.lisp` preserve the experiment drivers. Original argv and
source identities are in each command record. Compressed records are read via
`arcdocdb.evidence:read-evidence`; small `.lisp` files are lossless gzip wrappers.
