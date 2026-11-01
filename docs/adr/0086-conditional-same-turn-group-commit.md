# ADR-0086 — Conditional same-turn strong group commit

- **Status:** Accepted for incremental integration under the author's instruction.
- **Date:** 2026-11-01
- **References:** [ADR-0080](0080-group-commit-m1.md),
  [ADR-0085](0085-conditional-current-writes.md), REQ-TXS-002/003,
  REQ-WAL-002/005/006, REQ-MVC-008, REQ-IPC-002, REQ-IDX-013, REQ-AFF-004/008.

## Decision

Extend the existing bounded same-turn Unix collector to opcode-6 conditional
PUT/DELETE. Keep the negotiated capability, request/response bytes, public API,
strong acknowledgment and one-request credit unchanged. Collect only complete
already-ready requests, at most the configured 1..8 operations. Add no timer,
peer wait, write thread, durable format or CSN allocator.

A conditional request whose binary key matches any preceding queued operation
drains that queue before enqueueing. Ordinary writes may follow a conditional
on the same key. Reads, PING, explicit groups, versioned GET, and malformed,
unnegotiated or unavailable requests remain barriers. This rule is enforced
again at the internal engine boundary before any lookup or effect.

The engine validates the whole input prefix, output ownership and dependency
rule, then probes conditional keys through the existing guarded authoritative
lookup. Pack matching and ordinary operations into fixed private scratch.
Preceding writes cannot affect a condition's key, so probing before the group
is equivalent to serial application in actor order. Later ordinary writes on
that key do not change the earlier condition's linearization. A conflict token
describes that point, not a promise that it remains current until response receipt.
Do not predict future CSNs or maintain a speculative key/version overlay.

No callout or peer wait occurs between guarded probes and entry to the existing
writer. The M1 owner excludes concurrent mutation and asynchronous API reentry;
existing preflight maintenance preserves versions and guards its callbacks.
Use the existing cumulative preflight, independent SEALs, one strong flush,
FIFO root/index publication and resource reuse. Scatter new CSNs only after
whole completion, then copy complete status/token prefixes. A conflict consumes
no CSN. An all-conflict cohort skips writer preflight, capacity, maintenance,
append and flush, including when ACTIVE or writer credits are saturated.

Only an unadmitted capacity refusal with READY engine state may fall back to
the original individual operations. Recheck each condition and absolute deadline
at its individual admission. Never retry an admitted fault or encoder failure.
The resource catch surrounds only the engine call; later encoding failure cannot
become a false busy rejection. Preserve uncertainty after a lost response.

Expiry compacts connection, operation, condition flag and expected version together.
Recheck the original deadline after draining a full/dependent queue, before each
individual fallback, and before queuing responses. A deadline passing during a
commit cannot cancel or roll back the write; close that connection without a
false success. Clear all collector/projection references and scalar results on
every exit, including nonlocal exits.

## Resources and scope

Reserve 208 fixed payload bytes per engine for eight projected operations,
positions, applied flags, conflict tokens and packed CSNs, independent of ACTIVE
rotation. Add 80 payload bytes to the single service collector for expected
versions and condition/result flags. Object/array headers are additional. There
is no new per-connection payload arena. The collector reuses ordinary operation
descriptors; constructing descriptors and wire copies still allocates in M1.
This does not close COD-30 or a complete heap/RSS qualification.

This extends ADR-0085's immediate conditional-write barrier with independent
same-turn coalescing. Its version/absence/ABA, strong durability, fault and
unknown-outcome contracts remain. Operations retain individual commits and
prefix recovery. There is no group transaction, historical MVCC, exactly-once
delivery or change to RAM/paged policy.

## Evaluation

Exercise both formats, all primary profiles, serial reference histories,
same-key/ABA barriers, mixed/all conflicts, capacity fallback, expired-member
compaction, output aliases, failures after flush and encoding, SIGKILL/reopen
and public-client response loss. Keep prior API/protocol tests and all spikes.

Record unchanged-code baseline before product edits and final measurements with
the same hashed drivers, controlled ready cohorts of 1/2/4/8 clients, real Unix
frames and independently counted durable flushes. Controlled cohorts measure
available coalescing, not natural arrival probability. No production wait is
introduced. Preserve [method and evidence](../../spikes/results/2026-11-01-conditional-group-commit/report.md).

## Relationship to the specification

Reuse the specified group-commit mechanism and optimistic per-document CSNs.
No persistent format or isolation change. Full transaction write sets and the
concurrent multiseries path remain separate work.
