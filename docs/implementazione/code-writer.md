<a id="code-locali-e-gettone-dei-writer"></a>

# Local queues and writer token

`arcdocdb.execution` provides Serie's preallocated MPSC queue and logical
writer token. Implements primitives from
[ADR-0045, item 6](../adr/0045-modello-di-esecuzione.md): reusable workers,
one writer per Serie, bounded slices. Every Serie gets distinct object
with own ring/metadata; no common guard across Serie.

<a id="interfaccia-e-proprietà"></a>

## Interface and ownership

| Operation | Result and conditions |
|---|---|
| `crea-coda-writer :capacity :quantum` | Private ring; default 1024 slots, 64 messages per slice. Both limits independent integers 1..65536. |
| `accoda-messaggio queue message` | Count after acceptance. FIFO by acceptance order; `NIL` valid payload. |
| `acquisisci-writer queue` | Positive token generation, also bound to current thread. |
| `preleva-messaggi queue lease target start end` | Count and `:messages`, `:empty`, or `:yield`; fills span of caller-private `simple-vector`. |
| `rilascia-writer queue lease` | Releases token, retains generation, clears slice's consumed quota. |

Token number queue-local: complete identity
`(queue, lease)`, with owning-thread check. Distinct queues
may have same generation number.

Acceptance transfers reference producer → queue; extraction
queue → consumer. Payload already prepared internal context:
queue neither copies, interprets, nor validates document. Nobody modifies in-flight
context. Consumer uses returned count only, keeps
token until processing extracted messages completes. Other workers
may produce messages during slice.

Guard protects ring/indices even while worker owns token.
Token instead protects writer exclusivity: two distinct CASes.
Every acquisition tries once without wait/spin. Ordering properties
those of
[SBCL CAS/barriers](https://www.sbcl.org/manual/#Barriers).
No promise of nonblocking progress: worker not releasing
ownership prevents accesses requiring it to its Serie.

| Rejection | Condition and preserved ownership |
|---|---|
| Invalid configuration | `invalid-argument`, `:writer-configuration`; no published queue. |
| Busy ring guard | `resource-exhausted`, `:writer-queue-busy`; no accepted/extracted message. |
| Full ring | `resource-exhausted`, `:writer-queue-full`; producer still owns message. |
| Busy writer | `resource-exhausted`, `:writer-busy`; no second ownership acquired. |
| Exhausted generation | `resource-exhausted`, `:writer-generation`; no wrapping, temporarily acquired token released. |
| Old/wrong/other-thread token | `invalid-argument`, `:writer-lease`; current ownership/quota preserved. |
| Invalid target/span, ring alias | `invalid-argument`, `:writer-target`; no extraction/target change. |
| Internal inconsistency | `invariant-violation`; future controller must apply Serie fail-stop. |

Extraction bounded by available messages, target span, remaining slice
quota. Quota charged cumulatively to token: repeated calls
cannot bypass it. After exhaustion returns `0, :yield`; empty
with remaining quota returns `0, :empty`. Target elements outside
actually filled span untouched. Consumed ring slots
cleared, avoiding queue-retained references.

> **Proposal** — Initial limits configurable operational budgets, not
> persistent parameters/scheduler thresholds. Generation uses positive
> fixnum range, rejects exhaustion without recycling.

<a id="integrazione-e-verifica"></a>

## Integration and verification

Primitives create no threads, execute callbacks, call I/O.
[Local slice handoff](writer-handoff.md) adds wrapper with private
queue, coordinates next task under same guard. Pool could use
primitives to assign slices to different workers. Ready-Serie list,
wakeups, retries, deadlines, adaptive pool growth, publication, acknowledgments
remain later-component responsibilities. Acceptance does not automatically
notify worker: primitives neither close lost-wakeup protocol
nor establish database fairness/latency.

[Method registered before campaigns](code-writer-metodo.md) includes
independent oracles, overlapping producers/consumers on real threads,
two-Serie isolation, two C1 readings, full-denominator coverage,
mutations, allocation measurements.
[Decision table](code-writer-decisioni.md) distinguishes rejected
inputs from defensive protocol checks.

Local campaign of October 9, 2026 passed 17 nominal tests, including
9 × 1200 actions compared with independent FIFO lists, three waves of 144
messages on three producers/two reused consumers, CRC computation on
two-Serie buffers with overlapping intervals. First run observed 34,065
 overlap ticks, timer 1,000,000 ticks/s, outside semaphores; not
scaling or in-engine message-application measurement.

Raw SBCL coverage 321/391 expressions, 58/76 branch outcomes:
package 0/1, 0/0; queue 131/172, 22/32; writer 190/218, 36/44.
Denominator includes unmarked declarations/defaults/defensive
guards. No complete MC/DC claim/approved C1 exception.
Unmarked inventory retains 1 package form; queue:
21 definition/default forms, 20 forms in five defensive errors,
two DEFSTRUCT `or` type outcomes/eight defensive outcomes; writer:
eight definition forms, 20 forms in five defensive errors/eight
defensive outcomes. Factory defaults exercised by API but
unmarked in report. No instrumented input/operational branch
uncovered; defensive conditions not all tested false.
Mutations have compiled/successful baseline; all eight mutants
compile/detected after smoke, full logs preserved.

Two allocation fixtures (capacity/quantum 1 or 32), five
replicates each of 4096 complete cycles: zero observed heap bytes in
all ten samples/exact sinks. Counter self-test records zero
baseline, positive control 16,777,472 bytes. Serial measurements on
preallocated input, uncontrolled external load; neither absolute
nonallocation proof nor pool performance.

Local readings find no residual defects in primitive contracts.
Harness-only cleanup after error uses terminate/join with one-second
bound without establishing thread-dead postcondition. Successful runs:
all workers return `:ok` through join; error-path limit
explicit. No requirement status promoted.

[Isolated integrated verification](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-queue/verifica-integrata.lisp)
passed 168 module tests/ten spikes with stable sources.
[Artifact catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-writer-queue/catalogo.lisp)
also preserves first integrated check: successful commands, but
`SOURCE-CHANGED` record due to concurrent radix-sort edits unrelated
to execution module. Isolated copy contains base `10576a0` plus
component files; catalog/link verification follows preservation.

Requirements: REQ-CON-001/002/004/005, REQ-AFF-008. Invariants: INV-P1/P2/P5/P6,
INV-A8, INV-V4. Part of runtime, distinct from adaptive pool
REQ-THR-001 and integrated performance REQ-CON-003.
