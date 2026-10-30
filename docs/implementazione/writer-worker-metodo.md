<a id="metodo-del-contesto-worker-dei-writer"></a>

# Writer worker context method

Preregistration on 2026-10-09 at base `cf60913`, before the frozen
correctness, mutation, and allocation campaigns. The first development probe,
`4000545928-command-51771-0`, compiles the first three sources, before the
adopt/yield APIs were added: it is not attributed to the final code.
REQ-CON-001/002/004/005 and REQ-AFF-008; INV-P1/P2/P5/P6, INV-A8 and INV-V4;
ADR-0005 and ADR-0045 §§6/8. C1 code, C4 tools.

<a id="contratto-e-stati"></a>

## Contract and states

Context preallocated once on the worker thread that remains its owner,
non-reentrant. Ready/owner read-only; cursor/home/ref/lease/pending and
batch-generation local, no global counter. Six operational phases and one terminal phase:

- idle: no reference, lease, or batch; bounded take updates cursor even
  after empty/busy. A returned head becomes claimed, home is the predecessor
  modulo K of the cursor returned by ready, without searching for the writer.
- claimed: owned reference; separate begin acquires lease and enters running.
  Busy retains the reference. Not-ready and exhausted generation are not blind retries.
- running: pop with target/span/alias checked before local overflow.
  Messages create batch with positive count and new local token; empty/yield
  keep running with token 0 and do not increment generation. Busy does not mutate the context.
- batch: explicit debt; new pop and end prohibited. Valid ack attests that
  the caller processed the whole batch, clears pending, and returns to running.
  Monotonic token tied to the context/token pair, not unique across contexts.
- finishing: end is latched before calling handoff; busy retains
  lease and reference and allows only retrying end. No reprocessing.
- reschedule: end has already released lease; reference retains an obligation.
  Recycle room publishes and releases to idle; full transfers the head to the
  claimed context, retaining home and count. Busy retains the obligation without repeating end.

Adopts from idle a unique obligation not in the ring; yields from claimed/reschedule
the writer/home pair to the caller and releases to idle, without resetting batch-generation.
No yielding active leases/batches. Allows explicit return of
obligations before context retirement or exhaustion, without promising a pool.
On batch-generation overflow, pop rejects even if it would be empty/yield; end
remains available, followed by yield and adoption in another context.

<a id="confini"></a>

## Boundaries

Wrong phase is resource-exhausted :worker-state, invalid owner/ack/adoption
are invalid-argument; overflow is resource-exhausted :worker-generation.
Begin/pop/recycle busy retains all fields. The first end busy changes
only running→finishing, an intentional latch; subsequent retries retain everything.
Each step's boundary records the original condition and enters faulted
on unexpected/permanent errors (not-ready, writer generation, private lease,
invariants, or runtime errors); it propagates the same condition, retains fields, and
blocks all subsequent steps, including yield. Only explicit recoverable reasons
by type/operation preserve the phase. Wrong-thread and an already faulted context
are rejected outside the handler, without altering the original diagnosis.
No reset or rollback after mutation; internal dynamic-extent handler.
Owner-only getters allow diagnosis of the reference and condition even on fault; they do not
transfer ownership or authorize double publication.

There are no threads, callbacks, I/O, timers, retries, or waits in the product.
Take uses the existing scan of ≤64 shards/128 CAS; the other steps are
O(1), in addition to the batch copy already bounded by the writer. Work and ack outside
ready guards. Empty does not authorize park/shutdown. Local full chains, quotas,
admission, wake/park, FAULTED controller, pool adaptation, and WAL application
remain to be integrated. Ack does not verify the caller's external effects.

<a id="verifiche-preregistrate"></a>

## Preregistered checks

- Independent list oracle: 8 configurations K1/4, ready capacity 1/2,
  quantum 1/2, 13 writers, and 1000 steps each, unique payloads and final drain.
- All phases, cumulative quantum, private buffers/sentinels, alias/span,
  stale ack in the next batch, preflight order, overflow without wrap,
  yield/adopt, and inability to yield an active batch/lease.
- Begin/pop/finish/recycle busy with snapshots; correct home on rotated
  scans, ring full regression for all consumers, new wave without cleanup.
- Reused real threads and live producers, independent shard progressing
  while a guard is occupied, wrong-thread rejected before mutation.
- Two C1 readings with twelve points, inventory of every decision and raw coverage
  of all eleven execution files, without exclusions or MC/DC inferred from sb-cover.
- Twelve semantic mutants of only the new worker files, unique substitutions
  preregistered in the driver before the campaigns. Full execution baseline;
  OS signals/late failures are worker-error, not detection. Raw baseline+12 logs.
- Handoff/ready/worker composition: K1/4 × C1/3, five samples ×4096 cycles,
  warmup 128 and GC outside measurement. Full backlog→recycle→new head and room→publish;
  idle, batch ack, identity/count/status/cursor, lease, and increasing tokens checked.
  C+1 distinct writers per shard; initial role rotated; real generations not
  reset to make the sink constant. Independent derivation in the appendix.
- Positive heap, wrong sink, distinct clockzero, partial reporters, and preexisting
  directory, full strict COMPILE-FILE, and FASL self-test of C4 tools with fatal warnings.
- Full Make check once on final code; other chats integrated before
  freezing. Repeated only if relevant code/base changes or a gate fails.

Every attempt is recorded with record-command; raw data/output/argv/environment
retained, stable source snapshots before/after. Separate caches/processes on a
frozen copy; large data compressed losslessly. Observed results do not
qualify universal zero heap, throughput, P99, fairness, or the whole engine.

<a id="oracolo-composto-e-mutanti-esatti"></a>

## Composed oracle and exact mutants

The driver fixes twelve unique substitutions: owner-check-ignored, claim-cursor-stays,
claim-home-is-next, start-keeps-claimed, batch-generation-stays,
ack-stale-token-accepted, ack-keeps-pending, end-skips-finishing-latch,
end-keeps-lease, schedule-goes-idle, recycle-room-keeps-writer,
recycle-full-keeps-old-writer. The before/after targets are literals in
[`writer-worker-mutation.lisp`](../../tools/writer-worker-mutation.lisp),
checked before each copy; queue, writer, handoff, and ready are not mutated.
Both malformed defects and defects whose form remains valid are included.

Benchmark: in each shard A has two payloads and produces backlog; C other writers
fill the ring before full recycling; the caller completes the head, the
remaining references, and A. A second room cycle on the same A recycles
into the empty ring and completes the remainder. A's role rotates among C+1 identities.
The score excludes absolute lease/batch counters, which are checked
separately and persist across warmup, cycles, and replicates.

For M=K(C+1), token derivation fixed before execution:
`T=K[416+115C+3C(C+1)/2]+7(C+3)K(K−1)/2+5M(M+1)/2+29+7(1 mod K)`.
For (K,C)=(1,1)/(1,3)/(4,1)/(4,3): 578/858/2520/4084.
Calls per cycle are `K(7C+27)+1`: 35/49/137/193.
Sink for the 4096 cycles, including indices i: 10754048/11900928/18708480/25114624.
The author's recalculation and the independent reading will check the
formula against the actual operations before the frozen measurement.
