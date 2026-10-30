<a id="revisione-del-ricircolo-dei-writer-pronti"></a>

# Ready writer recycling review

C1 scope: new `ready-recycle.lisp`, exports/ASDF, and composition with handoff
and ready list. Both independent readings, initial and final, are retained
in the [inventory](writer-recycle-decisioni.md) and
[catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-recycle/catalogo.lisp).

<a id="lettura-dellautore"></a>

## Author reading

| C1 point | Outcome and scope |
|---|---|
| 1. Requirements/ADRs | REQ-CON-001/002/004/005 and REQ-AFF-008; ADR-0005 and ADR-0045 §§6/8. Shared-list recycling per segment, without common per-message queue. |
| 2. Invariants | Unique obligation, local FIFO, count and capacity unchanged in full, exclusive guard, single lease. 8,000-step oracle, saturation regression, and real threads; eleven mutants detected. |
| 3. Errors | Input and busy before mutation; typed/fail-stop invariants, without rollback after internal failure. Busy retains obligation, including begin of returned reference; FAULTED controller still to integrate. |
| 4. Bounds | No loop, retry, recursion, or wait in new source. One acquisition CAS plus release, O(1); ring and shards retain existing bounds. Harness/threads with timeout and finite attempts. |
| 5. Allocations | No explicit allocation in normal recycling; preallocated composition with observed zero heap in 20 local samples. Positive control successful; startup/errors outside measurement, no universal promise. |
| 6. Data | New reference and old head types checked; indices/shape under guard. Ring transports opaque references without interpreting payloads or persistent data. |
| 7. Decisions | Five scalar predicates; no new compound decision. Coverage 81/86 expressions, 8/8 outcomes; top-level and legacy gaps remain in denominator 929/1060 and 134/154. No exclusion or inferred MC/DC. |
| 8. Ownership | Local guard/ring; success transfers A→ring and C→caller together. Caller able to assume C, unique obligation as precondition, no new membership or deduplication. |
| 9. Check | 309 tests plus smoke, lint53/zero violations, trace/links/evidence, and ten spikes. Process4000528494-command-77199-0 OK/STABLE/exit0; editorial closures checked separately. |
| 10. Standards | Safety3, complete ftypes, docstrings, maximum20 lines per function, and local complexity≤3. Pre/post through %check-pronta and delegated helpers; unwind-protect only releases. Two C4 tools fully compiled with fatal warnings and FASL self-tests. |
| 11. Parallelism | No new global lock or common per-message write. Guard serializes only short operation on own ring, once per segment. Other-shard progress verified; no fairness or lock-freedom promised. |
| 12. Atomicity | No durable change, I/O, or deletion. Full replaces head=tail slot and advances indices under guard; count unchanged. No cleanup can cancel a subsequent writer wave. |

Helper `%ricircola-pronto` checks the precondition and delegates the
postcondition to both branches `%scambia-pronto` and `%pubblica-pronto`,
both with meaningful checks before and after mutation. Guard ownership
is checked at public API acquisition and release.

The first independent reading found no functional defects; only comment
`publica` is corrected to `pubblica` before campaigns. The second reading
considers frozen sources and raw build, coverage, mutation, and allocation
outputs. No approved exclusion or engine gate closure.

Full capacity does not prevent exchange in the modeled protocol. This does
not prove liveness with perpetually busy guards, invalid obligations, or an
absent controller. Full chains on the same shard can starve other activities.
Pool, global quotas, wakeups, parking, admission, and shutdown require
integration; empty remains a local observation.
