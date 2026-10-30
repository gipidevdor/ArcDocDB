<a id="metodo-della-consegna-locale-dei-writer"></a>

# Local writer handoff method

Registered on 2026-10-09, before tests. Base `85a4e05`. C1 component:
`src/execution/handoff.lisp` and acceptance helper extracted from `queue.lisp`.
Contract from [ADR-0045, points 6 and 8](../adr/0045-modello-di-esecuzione.md),
REQ-CON-001/002/004/005 and REQ-AFF-008; invariants INV-P1/P2/P5/P6, INV-A8, INV-V4.

<a id="meccanismo-e-ambito"></a>

## Mechanism and scope

A wrapper owns a private queue and `idle/ready/running` state. Ring and
state use the same existing local guard; each acquisition attempts only
one CAS. No new guard, global state, per-message allocation, callback,
wait, I/O, or thread. The internal queue is not exposed and low-level
APIs are not mixed with wrapper APIs.

Acceptance from idle returns `:schedule`; further messages return
`:queued`. Begin acquires the lease and moves from ready to running.
Termination observes count, releases the lease, and moves to ready if
work remains, idle if empty, holding the guard through the entire transition.
Quota is cumulative per segment. Termination may be early: remaining
messages still require another segment.

`:schedule` transfers an obligation to the caller to execute only once.
A failed notification requires retaining and retrying that obligation;
payload acceptance is not repeated. Busy termination retains the lease:
only termination is retried. The ready list, worker wakeup, or worker
shutdown handling are not implemented here. Local ownership does not
guarantee progress if the caller abandons the task or lease.

Mailbox queue/state coordination is an established pattern
([Akka Mailbox](https://github.com/akka/akka/blob/main/akka-actor/src/main/scala/akka/dispatch/Mailbox.scala));
this protocol is a distinct implementation under a guard and requires
its own tests. CAS and ordering are those of
[SBCL](https://www.sbcl.org/manual/#Atomic-Operations) and
[barriers](https://www.sbcl.org/manual/#Barriers).

<a id="prove-di-correttezza"></a>

## Correctness tests

- Forced compilation without warning/style-warning and previous execution suite.
- Independent oracle with FIFO lists, notification count, and logical states;
  finite sequences over different capacities/quantum, wrap, NIL, cumulative quota,
  early conclusion, new wave after idle, and intact target outside span.
- Both race orders after last pop: acceptance before termination produces
  `:queued` followed by `:schedule`; termination before acceptance produces
  `:idle` followed by `:schedule`. No duplicated or lost payload.
- Full/busy without mutation or acceptance; busy termination retains lease,
  quota, and work. Duplicate begin, old/other-thread lease, exhausted generation
  without wrap and ready retained. Internal guards tested with private FI.
- Real threads reused over multiple waves; producers open during consumption,
  writer handoff to different threads, and one Serie progressing while another
  retains its guard. Semaphores and joins have timeouts; worker errors rethrown.
  This harness is neither the product adaptive pool nor a scalability measurement.

<a id="verifica-c1-e-strumenti"></a>

## C1 verification and tools

Two readings, author and separate reviewer, with the standard's twelve points.
Decision and defensive-branch inventory; raw `sb-cover` for all four execution
files, without subtracting declarations or unmarked branches. Raw data, counts,
denominators, and limits retained; no implicit waiver or complete MC/DC.

Mutation testing on isolated copies, compiled and successful baseline;
semantic mutants for notification, state transition, quota, and count.
Each mutant must compile before tests detect it. Compilation failure,
before-tests failure, survival, and detection remain distinct outcomes.
The set is fixed before execution in tool source. Runner self-tests for
missing/ambiguous targets and result markers.

Serial allocations: preallocated inputs, wrapper, and target, warmup outside
the counter, five samples of 4096 cycles per path (idle→ready→running→idle,
backlog/quantum/reenqueue). Sink and notifications compared with oracle.
Counter with positive allocation control; a zero sample is not universal
proof. No throughput/P99 measurement or algorithm selection from this
campaign. Uncontrolled external load, local macOS ARM64/SBCL platform.

All tests go through the structured recorder, with stable sources,
argv/environment, complete stdout/stderr, and failures. Evidence published
in `spikes/results/2026-10-09-writer-handoff/`; final check `make check`.
Engine gates and integrated targets remain open.
