<a id="prima-lettura-del-controllore-di-calcolo"></a>

# First reading of the compute controller

Static reading on 2026-10-13 against base
`4344d9e1f2ceb45e5fa3d5076b57d09505e69ac3`, by an agent other
than the code author. All six package files,
ASDF integration, scheduler fixtures, [contract](controllore-pool.md),
[method](controllore-pool-metodo.md), ADR-0011/0031/0035/0045, and the
[standard](../affidabilita/standard-di-codifica.md) were read.

The component is C3. The twelve C1 points are used as an additional checklist:
this reading neither assigns class C1 to the policy nor replaces build,
coverage, measurement, or general checks. The reviewer ran no tests.
Campaign results must be linked separately.

| File read | SHA-256 |
|---|---|
| `src/scheduler/package.lisp` | `1ae4001c0349d4e9f7d282e9c05129573149d50418880073789a46fa18b1968b` |
| `src/scheduler/types.lisp` | `3b174be0919f8b27312ada4071d831c3753d62bb12be99d7e9394c48dcab474a` |
| `src/scheduler/build.lisp` | `58baf595f221826c64e3fb38344242c3bdf403d65904193bf1a8e06e09d7c336` |
| `src/scheduler/read.lisp` | `5cdc1e5b7ba97c9aab66a5acaf74336b0df33144e24104e0242b7fc2552a1ae2` |
| `src/scheduler/policy.lisp` | `92b3ca3a81ae0b3ac342a63e5fe5c5d7524091a63065b0232c14c57ee80c4aac` |
| `src/scheduler/update.lisp` | `e35a704ee0b9445c559a768de048169a8e39837a6df21843d8df58215c482472` |
| `tests/scheduler/support.lisp` | `d8aeec53062cccf036c693ff709baf1086e331f8a247a5693b82c0ff1c7a4401` |
| `tests/scheduler/controller.lisp` | `04a223429449e26eae1a651e74b7b736e5952a08f1cee6aacf066c53c7ab0c7d` |
| `arcdocdb.asd` | `3593d876c5096f55a472f742f1de5f74eb4518f561953e75518d2e6efe93a23e` |

<a id="dodici-punti"></a>

## Twelve points

1. **Requirements and ADRs:** REQ-THR-001, REQ-CON-005, and REQ-AFF-008/013
   identify policy, separation from the hot path, limits, and injected
   inputs. ADR-0011 requires EWMA/AIMD/hysteresis; ADR-0031 limits C3 to
   resource choices. The policy writes no C1/C2 data and claims neither a
   complete pool nor REQ-OBS-001/002 sensors.
2. **Invariants:** current owner, target minimum..maximum, since≤last;
   bounded samples and arithmetic intermediates, no tick wrap. The factory
   validates ordering and slot types preserve domains. Fixtures
   read the public getter to compare sensors, candidate, and clock;
   quiescent target and clock injections check both invariant
   branches. The AIMD helper is tested with a foreign symbol.
3. **Errors:** all input reasons are explicit; owner and state are
   checked before sample validation. Full validation precedes
   the first setf. Configuration and sample rejections have statically
   present fixtures, including invariant-branch and unexpected private
   direction injections. The helper's symbol type makes
   its explicit rejection reachable. Conditions are not hidden and there are
   no handlers or rollback in the product.
4. **Limits:** no loops, recursion, locks, waits, or retries in the six
   sources. EWMA arithmetic has maximum intermediate 2^31; ticks are integers
   bounded to 2^40−1. The two time comparisons use only validated inputs
   and consistent local fields. Pending is the outcome of a short call, not
   a thread waiting for an actuator.
5. **Allocation:** separate factory; no list, closure, copy, hash,
   explicit allocation, or growing rational in steps or getter.
   `%pool-range` uses fixnum type and scalar comparison without constructing a
   runtime type specifier. Absence of observed heap remains to be measured
   with a verified C4 sensor; it is not inferred from reading alone.
6. **Verified data:** the getter exposes seven scalar values after owner and
   invariants, without publishing mutable representation or capability.
   Update exposes a bounded target and four closed outcomes. No request,
   Serie, or storage data enter or leave the package.
7. **Decisions:** complete inventory of explicit and delegated predicates
   below. Compound thresholds have fixtures making every
   operand decisive. C3 does not prescribe MC/DC; that property is not inferred
   from test counts or sb-cover.
8. **Ownership:** immutable owner created on the scheduler thread, owner-only
   getter and update, non-reentrant APIs without callbacks. No
   mutable global state. The foreign-owner fixture retains the owner's snapshot;
   eight threads each construct a private controller,
   after a harness-only barrier with 15-second timeout.
9. **Traceability and verification:** definitions and tests name requirements;
   ASDF loads the package after execution and scheduler tests in the general
   check. Build, heap, coverage, and `make check` were not run
   by the reviewer; C3 minimum is 95% statements and branches, not a percentage
   already reached by test presence. Campaigns and their gaps must be
   read in the [results](controllore-pool-risultati.md).
10. **Standard:** safety 3, complete function types, typed/read-only slots
    and copier NIL, docstrings and OWNER/SHARED. Bodies within 60 lines and bounded
    complexity; no new macro, syscall, `ignore-errors`, or compilation
    exception. No deviation requiring registration was identified;
    lint and build remain executable checks distinct from reading.
11. **Parallelism:** no common per-request write or dependency
    across Serie; policy operates in the scheduler/metrics entry of the closed
    list. Parallel tests verify local isolation and EWMA determinism
    without measuring engine scalability, fairness, or isolation.
12. **Durability:** no persistent change, file, lease, batch,
    Serie controller, or CSN touched. There is no on-disk atomicity point
    to declare for this component.

<a id="inventario-dei-predicati"></a>

## Predicate inventory

The inventory is a source reading, not a coverage report.
Slot types, package/ASDF forms, and code generated by definition forms
remain within the complete-file scope of the sb-cover denominator.

| ID / function | Explicit predicate or branch | Effect |
|---|---|---|
| B01 / `%pool-range` | `and` of fixnum type and range lower..upper | Both true return the value; otherwise typed invalid before mutation. |
| B02 / factory | Maximum present | Uses maximum, or default 2×cores. Explicit NIL uses default. |
| B03 / factory | Initial present | Uses initial, or minimum. Explicit NIL uses default. |
| C01 / `%check-pool` | Owner EQ current thread | Foreign owner invalid before every public state read or write. |
| C02 / `%check-pool` | Minimum≤target≤maximum | Inconsistent invariant `:pool-state`. |
| C03 / `%check-pool` | Since≤last | Inconsistent invariant `:pool-state`. |
| G01, G02 / getter | Initialized, two occurrences | Numeric last/since after sample, NIL before. |
| E01 / `%pool-ewma` | Reset | Sample×256, or floor of 1/8 average. |
| D01 / `%pool-direction` | `or` of P99≥1200×256 and `and` queue<256/CPU≤300×256 | Shrink takes precedence. |
| D02 / `%pool-direction` | `and` queue≥queue-high×256, CPU<700×256, P99≤1000×256 | Grow only if shrink false and all true. |
| D03 / `%pool-direction` | Fallback cond | Explicit hold. |
| A01 / `%pool-apply` | Case grow/shrink/hold/otherwise | Bounded next target; foreign private direction invariant. |
| A02 / `%pool-apply` | Next target equals current | Hold and reset, including when direction meets a limit. |
| A03 / `%pool-apply` | Direction differs from candidate | Starts new dwell; no action. |
| A04 / `%pool-apply` | Elapsed<dwell | Hold; inclusive threshold acts in fallback. |
| A05 / `%pool-apply` | Fallback cond | Applies target and resets candidate hold/since=tick. |
| S01 / `%pool-sample` | Initialized | First call without delta; afterward validates at least period. |
| S02 / `%pool-sample` | Delta≥period | Too short/regressive invalid before writes. |
| U01 / update | `or` non-initialized/gap>2×period | Resets sensors and dwell; gap exactly 2 periods continues. |
| U02 / update | Reset | Candidate :hold and since=tick, then evaluates current sample. |
| U03 / update | Actual differs from target | Sensors updated, pending with identical target and dwell reset. |

Update delegates: `%check-pool` before and after, complete `%pool-sample`
before setf, three `%pool-ewma`, `%pool-direction`, and `%pool-apply`.
The getter delegates one `%check-pool`. `%pool-range` calls have literal
limits or limits derived from validated configuration; they are not loops or retries.

<a id="lacune-e-rischi-dichiarati"></a>

## Declared gaps and risks

No functional bug identified in reading the described version.
Final rereading includes both invariant verifiers,
rejection of a foreign direction symbol, and the eight-thread barrier;
the SHAs above identify these sources. No branch should be removed from the
denominator before assessing 95%.

The suite's parallel oracle compares EWMA sensors; policy outcomes
on P99 reversals are checked with manual expected vectors.
C4 `tools/pool-controller-bench.lisp` adds a startup oracle for the
grow/shrink trace with constant CPU/P99, comparing all seven outputs
at every step, plus pending and hold. This is a specific finite trace, not an
exhaustive demonstration of policy or real feedback.

The policy does not detect every arbitrary alteration of private fields. A
pending growth remains the target even if P99 worsens; no actuator revocation or
expiration is implemented. Gap resets dwell evidence
and may defer a command indefinitely with overly sporadic
samples; this is a conservative choice, not a progress guarantee.

Actual is a caller-certified number, not counted by the component.
Wrong acknowledgments or metrics may produce wrong resource
choices, but policy cannot modify C1/C2 data. Actuator,
stale-command protocol, wake/park, and shutdown are missing; RSK-12 remains open for
real feedback and calibration. Final product and C4 verification and
evidence bytes belong to separate campaigns.
