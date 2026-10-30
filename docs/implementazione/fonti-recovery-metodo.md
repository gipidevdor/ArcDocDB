<a id="acquisizione-posseduta-dei-segmenti-per-il-recovery"></a>

# Owned segment acquisition for recovery

Method preregistered on 2026-10-17 before code and tests.
C1 increment under ADR-0040 and COD-37; no new persistent format.

`apri-fonti-recovery(manifest, directory, …)` collects complete namespace
once through directory planner and acquires read-only
**all and only ACTIVE/CLOSED**, in ascending u64 order. Requires
`:ready` plan: DEGRADED/FAULTED rejected before first open. Result
owns children; parent, manifest, and namespace remain controller-owned.
Namespace must stay exclusive and stable from inventory through acquisition
completion; no asynchronous deletion in ownership window.
Live temporary forms read under their `.seg.tmp` name, without rename.
Anomalies, REMOVED, and orphan temporary files remain only in returned plan.

Queries return ID, ACTIVE/CLOSED state, form, borrowed read-only
capability, and size observed from its own FD. Caller does not close
children separately and ends every reader before `chiudi-fonti-recovery`.
Close is idempotent, invalidates set first, and attempts each child once
even after fault. Aggregate error preserves original primary
condition (or NIL), first close condition, and failed-close
count. No error returns partial set; successful cleanup propagates
primary condition by EQ. Out-of-contract exits attempt cleanup,
without replacing original cause. No retry after EINTR.

Five inventory budgets retain defaults and semantics; `max-transfer`
and `max-file-bytes` retain I/O defaults and semantics. `max-total-file-bytes` (default
4 GiB−1, integer `index`, zero allowed) bounds sum of live EOFs:
equality valid, subtraction before addition, no wrap. Every required
configuration and callback checked before enumeration.
Child exceeding total enters private set first so it can be closed.
Header, CRC, valid prefix, roots/CSNs, physical reconciliation, and admission
remain subsequent responsibilities. No write, deletion, flush,
ID reservation, lock between Serie, or worker creation. Cold path with
allocations; O(N) sequential opens bounded by live-segment count.

<a id="decisioni-e-prove-previste"></a>

## Decisions and planned tests

| ID | Decision / independence cases |
|---|---|
| FRS-D01 | `:ready` or DEGRADED/FAULTED rejection before open |
| FRS-D02 | ACTIVE/CLOSED state admitted; REMOVED/UNKNOWN never opened |
| FRS-D03 | FINAL/TEMPORARY form consistent with USE/RENAME; FI of each inconsistency |
| FRS-D04 | Total EOF <= budget, exact/one below/zero, high bits, and no wrap |
| FRS-D05 | Child present during cleanup; first error preserved, all attempted |
| FRS-D06 | Primary present or absent and close failed or succeeded; four combinations |
| FRS-D07 | Set open/closed; query index 0/last/out of range |

Dedicated suite: EDIT v1/v2 fixtures, declared live-files-only oracle,
ID zero/bit63/max-u64, permuted physical order, reused inputs, and forbidden aliases;
exact enumeration/open/close counters. Saturation of all
eight budgets, missing callbacks, and incomplete EOF. Fault at every position
of open/metadata/identity, single/multiple close, and invalidated parent;
original conditions and cleanup verified. Native files byte for byte,
renamed and replaced parent, rejected symlink, and reusable descriptors.
Four threads with private backends, bounded gates and joins, no global override.
Raw native coverage and compilable decision/budget/cleanup mutants;
no approved exclusion or attribution to dependent modules.

Two author readings with C1 checklist, recorded separately from tests;
do not replace second independent reviewer. Sources frozen and
committed before recorded runs, strict compilation, and `make check`.
Every failure and variant remains in original evidence; preservation
with common collector and closed inventory. Overall C1/MC/DC qualification,
complete recovery, and performance remain open.

REQ-REC-001/002/004, REQ-AFF-001/004/008/017/018, REQ-VAL-001.
INV-A7/A8/A9/A10/A11, INV-P6.
