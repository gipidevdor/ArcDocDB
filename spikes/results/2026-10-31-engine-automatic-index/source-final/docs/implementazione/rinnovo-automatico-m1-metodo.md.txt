# Automatic M1 renewal — preregistered method

Registered on 2026-10-31 before implementation and execution. C1:
REQ-IDX-012, INV-I1, INV-I8, INV-A8, INV-P6;
[ADR-0072](../adr/0072-rinnovo-automatico-delta-m1.md).

1. Strict compilation with warnings/style warnings fatal, safety 3, lint and
   traceability. Two C1 readings and a compound-decision table.
2. Real PUT/DELETE across repeated automatic renewals in v1/v2 and 4/16/64 KiB
   pages. Compare values/absence and exact CSNs against a separate workload
   oracle. No manual maintenance between document operations.
3. Independent threshold-only and next-key-capacity-only triggers, including
   a key larger than the remaining arena below the threshold. Existing keys
   still validate their published state. Oversized-for-empty keys, invalid
   records, and resident-capacity exhaustion must reject before derivatives.
4. Full old/new renewal array reservation: exact boundary succeeds, one byte
   below rejects without namespace, CSN, FD, or delta changes. Test page/file
   exhaustion after admission separately as FAULTED.
5. Name collision, finite count, ID endpoint and overflow, invalid configuration,
   wrong owner, disabling, manual delta retirement, and shared immutable
   configuration across two independent engines. Never retry or overwrite.
6. Inject error and nonlocal exit before/after image swap and after automatic
   renewal but before WAL append. Preserve the primary condition, exclude API
   reentry throughout BUSY, never acknowledge an uncommitted document.
7. SIGKILL in independent processes before/after derivative publication and
   after the subsequent durable document commit, both record formats. Restart
   verifies the independently expected frontier and values. This does not
   qualify power loss.
8. Five warmed, serial windows of 100,000 no-renewal preflights, preallocated
   keys, report and GC outside the window; check the returned no-op and
   bytes-consed. Expected zero observed Lisp bytes, not RSS or throughput.
9. Full `make check` with coherent pinned runtime/PATH/core; freeze canonical
   sources during qualification. Preserve failures and exact source identity.

The configuration bounds renewals per installation (default 64, maximum
65,536), pages per renewal, file bytes, and maintenance payload. It adds no
background task, timer, OS-memory estimate, disk cleanup, or retry loop.
Publish a compact report and lossless originals; exclude compiled artifacts.
