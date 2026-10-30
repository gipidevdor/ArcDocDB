<a id="revisione-del-contesto-worker-dei-writer"></a>

# Writer worker context review

C1 scope: four new worker sources, exports/ASDF, and composition with
writer, handoff, ready, and recycle. First independent reading and finding
closure retained; second reading on frozen code and campaigns.
[Decision inventory](writer-worker-decisioni.md),
[results](writer-worker-risultati.md), and
[catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-worker/catalogo.lisp)
retain denominators and original data, without approved exclusions.

<a id="lettura-dellautore"></a>

## Author reading

| C1 point | Outcome and scope |
|---|---|
| 1. Requirements/ADRs | REQ-CON-001/002/004/005 and REQ-AFF-008; ADR-0005 and ADR-0045 §§6/8. Local per-segment context, without global per-message queue. |
| 2. Invariants | Unique obligation, immutable owner, single lease, positive batch debt≤extracted, and current ack; states checked before/after. 8000-step oracle, parallel fixtures, and 12 detected mutants. |
| 3. Errors | Recoverable only by explicit API type/reason; owner and faulted before handler. Unexpected/permanent errors retain original condition and fields in terminal faulted; no blind retry or reset. |
| 4. Bounds | New APIs without loops, recursion, retries, or waits. Delegated take≤64 shards/128 CAS; other steps O(1), beyond bounded batch copy. Bounded fixtures and timed threads. |
| 5. Allocations | Preallocated context and buffers, internal dynamic-extent handler. Twenty local composed heap0 samples and 16777472-byte positive control; startup/errors excluded from measurement, no universal promise. |
| 6. Data | Opaque typed references; target/span/alias checked before overflow and pop. Token local to context/token pair, monotonic generations without wrap; payload and buffer remain caller-owned. |
| 7. Decisions | Four-file inventory, new scalar predicates; macro with expansion/values/original-error fixture. Raw 11 files: 1427/1660 expressions and 199/230 outcomes, new 498/600 and 65/76; all gaps in denominator, no inferred MC/DC. |
| 8. Ownership | Read-only owner equal to creator thread, nonreentrant. Claim/recycle assume obligation; handoff/adopt transfer it only without lease/batch. Diagnostic getters do not transfer ownership; unique obligation is caller precondition. |
| 9. Check | Process 4000547204-command-93189-0 OK/STABLE/exit0: 387 tests plus smoke, lint 63/zero, trace/links/evidence, and 10 spikes. Separate integration4000548048-command-40192-0 on e2f7a75: 400 tests plus smoke, lint66/zero. C4 strict compile/FASL self-tests and 12/12 mutants; coverage and benchmark in separate caches. |
| 10. Standards | Safety3, function ftypes, typed slots, pre/post/condition docstrings; bodies≤60 lines and complexity ≤10. Boundary macro retains multiple values/single evaluation and catches errors only for defined state/diagnosis (COD-21). |
| 11. Parallelism | No global per-message write, new lock, or product thread. Local contexts; ready guard once per segment. Reused threads/live producers and independent-shard progress; pool fairness and scalability unqualified. |
| 12. Atomicity | No I/O or durable change. Finishing latched before end; busy retains lease. After end only local fields change: no writer cleanup can cancel a new wave. Delegated atomic full recycling; internal fault fail-stop without promised rollback. |

The first reading closed three findings before freezing: permanent fault
must prevent retry on a new wave, batch debt beyond extracted, and malformed
private indices must not be classified as recoverable adoption input.
Regressions use declared FI, retain the original condition, and check terminal
gates. A macro fixture correction to allowlist keywords occurs in draft,
before any execution or freeze.

Postcondition after end does not consult an already released lease: the
local helper checks finishing/debt, removes the local lease, and becomes
idle or reschedule. Busy on first end changes only phase to finishing;
subsequent retries permit neither pop/ack nor handoff. Exhausted batch
generation prevents pop but leaves end and leaseless handoff available,
followed by adoption in a fresh context.

Faulted is this context's boundary, not the Serie controller. The caller
must process the entire batch before ack and not abandon handed-off
obligations. Wake/park, admission, global quotas, fairness, pool retirement,
shutdown, fault cleanup, and WAL application remain to be integrated.
No exclusion, engine gate, or global qualification is closed.
