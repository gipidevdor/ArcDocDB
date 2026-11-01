# Preregistered ACTIVE directory integration

Question: can serial M1 replace four per-commit persistent-directory path copies
with bounded preallocated append-only metadata, preserving each published
root's exact immutable prefix, canonical verification and independent WAL seals?

First retain a baseline on unchanged production sources. Measure managed-heap
allocation over 4,096 writes with eight hot keys, both single writes and groups
of eight, legacy/automatic RAM/paged storage. Instrument the existing directory
builder to count its actual calls; allocation counters have TLAB granularity.
No latency or throughput inference is drawn from instrumented allocation runs.

Keep the existing persistent representation as the generic default. Any new
representation must charge its complete arrays before startup,
initialize each slot once before exposing the covering root, enforce prefix
bounds on every lookup, and retain controller/CSN/SEAL/publication checks.
Old root observations must not change when the writer fills later slots.
Failed or incomplete tail preparation must never permit unsafe reuse.

Before final qualification, independently enumerate reduced directory/admission/
publication/read schedules including incomplete exits and negative controls.
Test both formats, repeated PUT/DELETE, group boundaries, quota exhaustion,
corrupt/stale/missing entries, growth/paging/return, rotation/compaction/recovery,
and real crash boundaries. Preserve all failures and raw diagnostics losslessly.

Qualify frozen final sources with warning-as-error product builds/tests on
SBCL 2.6.9 and 2.6.10, all `make check-core` gates and complete documentation.
After functional campaigns finish, run allocation and durability-equivalent
performance measurements serially, using the existing group-commit matrix and
explicit before/after source identities and driver hashes. Report allocations,
actual canonical flush counts and observed timing separately. No zero-allocation,
RSS, physical-power-loss, full concurrency or loaded-tail claim is inferred.

The baseline confirmed 750.74 counter bytes/write over 4,096 writes and exactly
four directory-builder calls per write in all six cases. The earlier 128-write
windows reported about 512 bytes/write because of allocation-counter granularity;
they are not an exact per-object accounting. The baseline refinement chooses
three specialized u32 arrays (page ends, cumulative row limits and PUT rows),
rather than a pointer directory with per-page objects. Keep one immutable root
descriptor per commit; do not introduce a reusable root capability or claim
zero allocation. Preserve the generic persistent representation unchanged.

Fresh engine and Unix baseline matrices use byte-identical copies of the previous
group-commit drivers in this directory, so their log destinations are private.
The final after-campaigns use those exact driver bytes again; startup/seed/GC
remain outside timing and allocation instrumentation remains separate.

The final read comparison uses the same final code with the existing source
factory option selected by a C4 wrapper only during cold creation. Compare
`:persistent` and `:append-only`, both formats, all three primary profiles,
2,048/60,000-byte values, ACTIVE and compacted CLOSED control reads. Seed 128
ordinary writes over the eight keys in sixteen strong groups, outside timing;
the ACTIVE search therefore spans 128 pages rather than only eight. Five
2,048-read repetitions per cell follow 32 warmups; verify full values outside
timing and status/length/end bytes inside, with an independently predicted sink.
Retain all call samples and allocation counters. GC, startup, writes, compaction,
fresh recovery and reporting are outside timed windows. Alternate layout order
by format. CLOSED reads control shared resolver behavior; this is a same-code
layout comparison, not a second historical pre-change read campaign.

Post-result follow-up, without replacing any primary samples: the historical
write/Unix comparisons vary by several percent while same-code read ratios
remain near one. Run a same-final-code strong-write diagnostic with both
source layouts, resident/paged primary storage, group sizes 1/8 and 2,048/60,000
bytes. Five 128-write repetitions per cell record process CPU ticks and measured
canonical strong-flush wall ticks separately from total wall time, with exact
CSNs, values and flush counts. Cold layout selection and GC remain outside
timing; no durability weakening, timing subtraction or causal significance claim.
This instrumented follow-up diagnoses where time is spent and remains separate
from the uninstrumented before/after performance campaign.
