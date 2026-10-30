<a id="seconda-lettura-del-controllore-del-pool"></a>

# Second reading of the pool controller

Reading on 2026-10-13 by an agent distinct from the product author, covering
`src/scheduler/{package,types,build,read,policy,update}.lisp`, tests, and
tool `tools/pool-controller-bench.lisp`. The component is C3; this
reading also uses the twelve C1 points as an additional check. I read the final 23-test suite, including the EQUALP fixture with
five individual differences tested in both orders. This is neither human
review nor certification. The [contract](controllore-pool.md),
[method](controllore-pool-metodo.md), [inventory](controllore-pool-decisioni.md),
and [preserved results](controllore-pool-risultati.md) bound the conclusions.

| Point | Reading outcome |
|---|---|
| 1. Requirements and ADRs | REQ-THR-001, REQ-CON-005, and REQ-AFF-008/013 identified in definitions. ADR-0011 permits an initial policy with few signals; ADR-0031 classifies it C3 and ADR-0045 bounds nonblocking execution. The change implements target calculation without claiming an operational pool. |
| 2. Invariants | Target within minimum..maximum and since≤last checked before and after updates. Fault-injection tests of private representation and unexpected direction; domains, clamps, and owner have dedicated regressions. Typed slots protect representation shape. |
| 3. Errors | INVALID-ARGUMENT distinguishes configuration, samples, period, and owner; INVARIANT-VIOLATION reports private state. The entire sample is validated before the first write. Tests compare the preimage after rejections, including initialized/pending state. Caller error is not transformed into an applied command. |
| 4. Limits | Product without loops, recursion, callbacks, waits, new threads, or I/O. Core≤65536, worker≤131072, time<2^40, and bounded signals; EWMA uses fixed-size integers without growing denominators. |
| 5. Hot heap | Factory and trace are startup work. Update and getter return scalar values and modify preallocated slots. The tool preregisters five replicates of 4096 cycles with 128 warmup, checking all seven values and grow/shrink/hold/pending outcomes. Qualified evidence and counter limits are in results; reading alone does not prove zero heap. |
| 6. Output data | The getter checks owner and invariants. The two update results follow final checking; seven getter results without mutable state references. Policy proposes a target: the caller confirms actual and applies changes through a future protocol. |
| 7. Decisions | Decision table for ranges, thresholds, and resets. Tests exercise decisive operands, inclusive/exclusive thresholds, shrink precedence, interrupted hysteresis, pending, gaps, and limits. Coverage includes generated package, factory, helpers, accessors, and EQUALP comparison; the five numeric-slot comparisons are checked with equality and individual differences. This is not MC/DC. |
| 8. Owner | Immutable owner is the creating thread. Getter and update check the same thread; two controllers share no state. OWNER/SHARED comments place control in the scheduler/metrics entry of the architecture's closed list. |
| 9. Traceability and checks | Definitions and tests name existing IDs; global requirement states remain designed. Warning-free build, full C3 coverage, lint, trace, links, and general check must be evidenced in the frozen snapshot described in results. Edit-time dry runs do not replace these gates. |
| 10. Deviations | Safety3, slot types, read-only configuration, complete ftypes, short functions, docstrings, and REQs present. No new deviation requested or identified in the reading. C4 tools have positive/negative self-tests and nonzero diagnostics. |
| 11. Parallelism | The controller serializes only its own periodic administration on its owner. No lock or shared per-operation write across Serie, no access to the ready list, and no EMPTY=quiescence inference. Real metrics, actuator, park/wake, and scaling remain out of scope. |
| 12. Durability | No durable change, syscall, deletion, segment, log, or lease crosses this policy. It introduces no new atomicity point or removal authorization. |

I checked two details that limit policy interpretation.
After initialization, the getter returns a `since` tick even when
the candidate is `:hold`; NIL is reserved for the state before the first
sample. If actual differs from target, the policy keeps updating
sensors and retains `:pending` even if P99 worsens. Tests make
this behavior explicit; diagnosis, revocation, and command expiration
belong to the future actuator, without safety claims about
real feedback.

The review identifies no blocking defects in the limited contract.
Publication outcome depends on gates and frozen-snapshot artifacts,
not this reading or dry runs. RSK-12 and development of the
live pool remain open.
