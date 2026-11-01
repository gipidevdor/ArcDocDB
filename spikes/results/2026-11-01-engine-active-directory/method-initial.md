# Preregistered ACTIVE directory integration

Question: can serial M1 replace four per-commit persistent-directory path copies
with a bounded preallocated append-only directory, preserving each published
root's exact immutable prefix, canonical verification and independent WAL seals?

First retain a baseline on unchanged production sources. Measure managed-heap
allocation over 4,096 writes with eight hot keys, both single writes and groups
of eight, legacy/automatic RAM/paged storage. Instrument the existing directory
builder to count its actual calls; allocation counters have TLAB granularity.
No latency or throughput inference is drawn from instrumented allocation runs.

Keep the existing persistent representation as the generic default. Any new
representation must charge its complete reference array before startup,
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
