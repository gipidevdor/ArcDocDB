<a id="metodo-del-ricircolo-dei-writer-pronti"></a>

# Ready-writer recycling method

Registered on 2026-10-09 before campaigns, base `673987a`.
C1 component integrates [ready list](writer-ready.md) with
[writer](writer-handoff.md) obligation transfer without creating
threads or pool. REQ-CON-001/002/004/005, REQ-AFF-008;
INV-P1/P2/P5/P6, INV-A8, INV-V4; ADR-0005 and ADR-0045 §§6/8.

<a id="contratto"></a>

## Contract

`ricircola-writer-pronto(ready, shard, writer)` receives caller-owned unique
`:schedule` obligation. Requires caller able to take
another writer. Reads no writer state, detects neither duplicates
nor eligibility: existing preconditions apply.
One local-guard CAS acquisition, no wait or retry.

- If ring has room, publishes reference FIFO and returns
  NIL, `:published`, new count: obligation passes to ring.
- If full, transfers head reference to caller and
  inserts new reference at tail in same section: returns extracted
  writer, `:writer`, capacity. Head/tail advance one modulo capacity;
  count unchanged. In full head=tail, so replacing one slot suffices.
- Busy is `resource-exhausted :ready-queue-busy` before mutation;
  original obligation stays caller's. Wrong index/reference
  `invalid-argument`; shape/ownership/payload faults are fail-stop
  invariants without promised rollback after internal fault.

Full `[C,B,...,Z]` becomes `[B,...,Z,A]`: A passes to ring, C to caller
together. Capacity 1: `[C]`→`[A]`. `:writer` return does not authorize
publishing A again. Caller keeps C during start busy.
Guard makes exchange atomic relative to ring producers/consumers.
Separate pop/publication does not implement contract.

<a id="problema-e-confini"></a>

## Problem and boundaries

With publication alone, every consumer may finish slice
with backlog while rings already full and keep retrying:
nobody consumes ready references. Model preserves
counterexample. Recycling instead directly hands new head
to consumer without second queue or variable capacity.

Resolves ring-capacity-only blocking in modeled
protocol. Does not qualify general pool liveness: perpetually contended
guards, abandoned/duplicate obligations, Serie faults, admission require
controller. Full chain stays same shard; proves neither partition
fairness nor no starvation for new producers. Caller must
control quotas/other tasks. Empty remains local observation,
never parking, shutdown, worker-retirement proof. No writer cleanup
after end: new wave may already be published.

Cost O(1), one acquire/release CAS, no new global state
or shared per-message write. Factory, ready, handoff unchanged.

<a id="prove-preregistrate"></a>

## Preregistered tests

- Independent seeded FIFO oracle, 8 configurations (capacity 1/2/3/9,
  1/4 shards), distinct writers, legal obligations, wrap/reuse after completion.
- Model/fixture with rings filled during active slices: counterexample
  to publication alone and bounded progress with recycling; unique
  obligation ownership, single lease, exactly-once payload processing.
- Full/room, invalid inputs, busy rejection without effects, private FI on shape,
  reference type/ownership; two reused consumers, live producer,
  progress on another partition while one guard occupied.
- Two C1 readings, full decision inventory, execution-file raw coverage.
  No subtracted forms/approved exclusions; sb-cover
  does not prove MC/DC. Compilation without warnings/style-warnings, make check.
- Eleven mutants of new source: fifo-next-slot, head-wrap-two,
  tail-wrap-two, full-count-decrement, full-keeps-old-slot, full-boundary,
  full-returns-new-writer, room-returns-writer, full-status-published,
  release-skipped, full-no-rotation. Full baseline mandatory;
  compilation failure, before-tests, worker-error (OS signals or failures after
  authentic completion) do not count as detection.
- Composite handoff/ready/recycling measurement: shards 1/4 × capacity 1/3,
  five samples of 4096 cycles, warmup 128, GC outside counter.
  C+1 distinct writers per shard, initial role rotated each cycle;
  room publication, full exchange, drain C remaining references.
  Identity, count, status, payload, generation checked; exact sink
  independently recalculated, positive heap control, wrong sink
  rejected, zero clock distinct, partial reports preserved.
  Samples prove neither universal zero allocation, speedup, pool
  throughput, nor P99. Startup/error conditions outside window.

Every verification attempt uses record-command with argv, environment, stable
sources, full outputs. C4 tools fully compiled, FASLs run
self-tests in separate processes/caches. Campaigns on frozen copy; large data
losslessly compressed, validated by evidence reader.

<a id="oracoli-e-modifiche-esatte-preregistrati"></a>

## Preregistered oracles and exact changes

Eleven unique replacements fixed in
[`tools/writer-recycle-mutation.lisp`](../../tools/writer-recycle-mutation.lisp)
before execution. FIFO reads next slot; head/tail separately advance
by two; full count decrements; slot retains OLD using
`(if (eq writer old) writer old)` to avoid unrelated warnings; full
threshold uses `>`; returned reference becomes WRITER; room returns
WRITER instead of NIL; full status becomes `:published`, also in ftype;
cleanup becomes NIL; NEXT becomes HEAD retaining full shape but
violating FIFO rotation. Each mutant changes new source only.

Independent benchmark derivation: M=K(C+1), enqueue contributes 12M,
consume 45M+5Σid, identity transfer 17M+5Σid, IDs 1 through M.
Room adds K(31C+3C(C+1)/2), full K(13+3C); drain cursors add
7CK(K−1)/2, empty 29. Fixed token thus
`74M+5M(M+1)+K(31C+3C(C+1)/2+13+3C)+7CK(K−1)/2+29`.
For (K,C)=(1,1)/(1,3)/(4,1)/(4,3): 257/558/1223/3231.
4096-cycle sink includes Σi: 9439232/10672128/13395968/21620736.
Calls per cycle `K(6C+5)+1`: 12/24/45/93.
