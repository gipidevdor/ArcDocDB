<a id="decisioni-del-contesto-worker-dei-writer"></a>

# Writer worker-context decisions

C1 inventory of the four sources
[`worker-types.lisp`](../../src/execution/worker-types.lisp),
[`worker-boundary.lisp`](../../src/execution/worker-boundary.lisp),
[`worker-claim.lisp`](../../src/execution/worker-claim.lisp), and
[`worker-run.lisp`](../../src/execution/worker-run.lisp), according to the
[preregistered method](writer-worker-metodo.md). References:
REQ-CON-001/002/004/005, REQ-AFF-008; INV-P1/P2/P5/P6, INV-A8 and INV-V4;
[ADR-0005](../adr/0005-writer-logico-per-serie.md) and
[ADR-0045 §§6/8](../adr/0045-modello-di-esecuzione.md).

The context belongs to its creating thread and is nonreentrant. Phases
idle, claimed, running, batch, finishing, and reschedule respectively
represent no obligations, ready obligation, active lease, batch
awaiting acknowledgment, completion to finish, and obligation to recycle. The seventh
phase, faulted, is terminal and retains the original condition. The context
does not own payload in the caller's buffer: it retains the count of
messages to acknowledge. Ack attests to caller processing and does not
check external effects.

<a id="decisioni-e-prepostcondizioni"></a>

## Decisions and pre/postconditions

The four new sources read contain no compound `and`/`or` decisions
with multiple conditions in `if`, `when`, `unless`, or `cond`. Type
unions using `or` are not COD-54 decisions. Compound checks delegated to
writer/ready APIs remain in their inventories and raw execution scope.
The absence of new compound predicates does not demonstrate MC/DC.

The table describes decisions in code revised after first-reading
findings. Final fixtures were read and their outcomes are
included in the 89-test execution baseline. The following nominal mapping
distinguishes actual tests, private FI, and proof limitations; it does not
turn uncovered paths into exclusions.

| Site | Decision or obligation | Fixture read and limitation |
|---|---|---|
| `%check-owner-worker` | Identity with current thread; otherwise `invalid-argument :worker-owner`, before writes. | Calls from another thread in every phase with context, writer, and ready snapshot. Getter-returned reference does not transfer ownership. |
| `%check-libero-worker` | Three scalar checks: writer NIL, lease zero, pending zero. | Independent FI of all three fields in idle; no deletion to repair inconsistency. |
| `%check-obbligo-worker` | Writer of expected type, lease zero, pending zero in claimed/reschedule. | Reference, lease, and debt FI; adoption/transfer and recycling legally without lease. |
| `%check-lease-worker` | Writer type, then lease/owner/generation/quota delegated to `%check-lease`. | Private reference and lease FI; delegated conditions must not all be classified as contention. |
| `%check-attivo-worker` | Current lease and pending zero in running/finishing. | Positive-pending FI; first completion contention and subsequent retries preserve lease/ref. |
| `%check-batch-worker` | Current lease, positive pending ≤extracted, positive batch-generation. | Independent zero/excessive pending and zero generation FI; extracted≤quantum checked by lease delegate. Debt preserved during out-of-phase operations. |
| `%check-worker` | Owner, fault NIL, cursor/home<size checked as private invariants, then ready validation; `case` over six operational phases with explicit unexpected-state error. | Separate out-of-range cursor/home and non-NIL fault FI in operational phase; malformed private index not classified as recoverable adoption input. Transitive validators remain in scope. |
| `%richiedi-worker` | Phase equals requested phase; otherwise `resource-exhausted :worker-state`. | Every API in prohibited phases: no mutation. This reason does not identify a busy guard. |
| Factory | Start validated before construction; idle postconditions checked. | Shard bounds, creating owner, read-only ready reference, and no new threads. Allocation permitted at startup. |
| Getter | Owner preflight only; local state or reference without checking writer under guard. | Diagnostics even on inconsistent context; no implicit adoption, deduplication, or revocation. |
| Classifier: resource type | Only `resource-exhausted` proceeds to comparison with step's resources list. | Different type with same reason is not recoverable; unexpected resource reason is permanent fault. |
| Classifier: resource reason | `member` in step's literal allowlist ends without writes. | Expected busy and worker-state, local overflow only on pop; not-ready and writer-generation become faulted. Lists of at most three elements, no retry. |
| Classifier: invalid type | Only `invalid-argument` proceeds to comparison with step's arguments list. | Wrong typed input with expected reason preserves context; private invalid-argument :writer-lease becomes faulted. |
| Classifier: invalid reason | `member` in step's literal allowlist ends without writes. | Invalid target/ack/adoption; matching reasons in wrong class and unexpected reasons become faulted. Lists of at most two elements. |
| Classifier: fault | Original condition stored and phase faulted; condition identity and terminal state checked separately after writes. | Internal and runtime errors: same condition propagated, ref/lease/debt/generation preserved; no repair or reset. |
| Macro: preflight | Context evaluated once; owner checked before handler; faulted gate rejects before body and does not replace diagnosis. | Expansion and behavior test: single evaluation, wrong-thread, terminal gate, multiple-value and condition-identity preservation. |
| Macro: handler | `handler-bind (error …)` at worker boundary, `dynamic-extent` handler; records/transitions and lets error propagate. | COD-21 exception with defined state/diagnosis; strict compile and heap measured. No application callback or hidden error. |
| `%assegna-worker` | Valid writer; idle/reschedule only; ref/home/claimed commit and final check. | Successful take and full recycle with identity/home; internal post-transfer error is fail-stop, without promised rollback. |
| Take: outcomes | `:writer` transfers to context; `:empty/:busy` preserve idle; unexpected outcome is invariant. Cursor updated for all outcomes. | Rotated scan, busy shard and independent shard, ready sentinel; empty is a local observation. |
| Take: home | Home is `(next−1) mod K`, derived from ready outcome without writer lookup. | K=1 and K>1, candidate beyond starting shard, cursor wraparound. |
| Begin | Claimed only; handoff returns lease, then running commit and postcheck. | Busy preserves all fields; not-ready/writer-generation cause local faulted and prevent consuming a future wave. Begin extracts no message. |
| Recycle: full | Old head validated by ready APIs becomes claimed at same home; outgoing writer belongs to ring. | Capacity 1, wraparound, and multiple consumers with obligations and full ring; exact obligation count preserved. |
| Recycle: room | NIL writer result checked, ref cleared and idle; `otherwise` is invariant. | Room, count/status/identity, busy without repeating end, no writer cleanup after publication. |
| Adoption | Idle only; writer type and home validated before writes. | Invalid input even with busy guard; unique obligation outside ring is caller precondition, without membership search. |
| Transfer out | Claimed/reschedule only; valid writer; idle commit and writer/home return. | No transfer from running/batch/finishing; persistent generation, explicit transfer to fresh context after exhaustion. |
| Pop: preflight | Running without debt; target/span/alias checked before generation overflow. | Malformed type/range/buffer alias and condition ordering; no extraction or buffer change on rejection. |
| Pop: overflow | Generation equal to `most-positive-fixnum` rejects with `:worker-generation` before pop. | No wraparound or increment, even if pop would be empty/yield; end and subsequent transfer remain available. |
| Pop: messages | Positive count checked; single generation increment; pending=count and batch. | Increasing token across slices and writers, cumulative quota, sentinel buffer; no global token across contexts. |
| Pop: empty/yield | Count must be zero; running, pending, and generation preserved; returned token zero. | Both outcomes and exhausted quota after ack; unexpected outcome/count are invariants. |
| Ack | Token of type index, positive and equal to current generation, three scalar checks before writes. | Zero, negative, wrong type, stale from previous batch, and different token; correct ack clears only pending and returns running. |
| `%concludi-worker` | After end: owner, finishing, pending zero; lease cleared and explicit `:idle/:schedule`. | Idle frees ref; schedule retains obligation in reschedule. Old lease already released by handoff is not rechecked. |
| End | Running/finishing only; finishing latch before handoff, then local completion. | First busy changes only phase; retry preserves everything; new pop/ack and transfer prohibited. End not repeated after reschedule. |
| New wave | No writer write after end to correct membership or scheduling. | Enqueue before release and new wave after idle; new producer's obligation preserved. |

<a id="limiti-del-protocollo"></a>

## Protocol limits

Every mutating step uses the worker boundary. Allowlists are specific to type and
operation, without generic resource-exhausted recovery:

| API | Recoverable resource reasons | Recoverable invalid reasons |
|---|---|---|
| Take | worker-state | None |
| Begin | worker-state, writer-queue-busy | None |
| Recycle | worker-state, ready-queue-busy | None |
| Adoption | worker-state | worker-writer, ready-target for home parameter |
| Transfer out | worker-state | None |
| Pop | worker-state, worker-generation, writer-queue-busy | writer-target |
| Ack | worker-state | worker-batch |
| End | worker-state, writer-queue-busy | None |

Factory and getters have no handler. Wrong-thread precedes the boundary and cannot
poison another owner's context. The faulted gate
returns resource-exhausted :worker-state; the original diagnosis remains
available through errore-worker-writer and is not overwritten.

Obligation uniqueness is a precondition of the caller and handoff
protocol. Adoption, transfer, and getters do not check global membership.
The buffer must be private to the caller and processed before
ack. The context/token pair identifies a local batch; the same
integer can appear in different contexts and is not a global capability.

Begin/pop/recycle busy preserves local fields. Take can rotate cursor
even on empty/busy. End sets finishing before the call, so
busy does not permit extracting or reprocessing other messages. Other
resource-exhausted reasons, including phase, not-ready, and generation, are not
automatically contention retries.

The revised version implements persistent local fault and also prevents
transfer/adoption after permanent errors; it does not implement the
Serie FAULTED controller. The boundary handler applies the
transition and records the original condition according to COD-21; the
controller must apply Serie fail-stop according to COD-24.
No rollback is promised after a mutation or already successful
transfer; preserved fields are diagnostic and do not authorize replay.

Full recycle avoids blocking caused solely by capacity in the modeled
protocol. Full chains can remain on the same shard: global fairness,
admission, wake/park, shutdown, and pool adaptation remain to integrate.
Empty does not authorize parking or shutdown. There are no new loops, waits,
callbacks, I/O, or global per-message writes; ready scanning and bounded
copying are delegated. No durable change is introduced.

<a id="prima-lettura-indipendente-c1"></a>

## First independent C1 reading

Base `cf6091367853ec311fed7b05961a2812fd05a8f1`. Exact SHA-256 hashes
from first reading with adoption/transfer APIs:

| Source | SHA-256 read |
|---|---|
| `worker-types.lisp` | `db42690ceabe1c2ed0dd28c2aeaa99244ed745565197cf52fb127c1356194e3b` |
| `worker-claim.lisp` | `b8e35a594f8b225ca69ca06310efb3ae7683460c2480781acebd2f68197553ab` |
| `worker-run.lisp` | `feedbeb14815d546d234bf9eed69002aa6bf0d1a82daad81d3f154b41410c379` |

The following conclusions are independent code reading, not
test, compilation, mutation, or measurement outcomes.

1. REQ and ADRs are listed and consistent with the local segment component;
   no qualification of the whole pool.
2. Owner, phase, lease, obligation, and debt invariants are explicit; the
   upper batch-debt bound needs strengthening and final fixtures need reading.
3. Typed conditions; invalid input precedes mutation, contention
   preserves obligations. Fail-stop is caller responsibility: no local poison
   protects against retries after permanent fault.
4. No new loop or wait; ready and writer delegates are bounded.
5. Heap campaign not yet read; startup construction and scalar local
   path do not replace measurement.
6. Outcomes/count/token checked with complete types. Getters are
   owner-only diagnostics, without implicit transfer.
7. No new compound decision; scalar/case checks inventoried
   above, no MC/DC inference.
8. Immutable local owner, read-only ready; ring access through their
   protocols. Work/ack outside shared guards.
9. REQ comments present; frozen trace/check and final tests still to read.
10. Safety 3, ftype and typed slots, delegated pre/post checks, short functions. No
    generic handler added. FAULTED boundary not implemented here.
11. Ready touched per segment, no global per-message queue and no
    new waiting. Fairness and scalability not measured by this reading.
12. No durable operation, removal, or persistent atomicity point.

The first reading and two initial findings are preserved in full in
`spikes/out/worker-c1-initial.lisp`. Before campaigns, terminal
boundary and pending≤extracted were added. Boundary rereading
reported a third risk: adoption's :ready-target
also included corrupt private cursor/home. The responsible agent
separated these errors with private checks signaling invariant-violation
:worker-state before delegated validation. All three corrections are
present in reread sources; FI outcomes remain to read.

Exact hashes from preliminary rereading with corrected boundary:

| Source | SHA-256 read |
|---|---|
| `worker-types.lisp` | `6f3209f1ba390e4fb38d9bd6250dc1f1a5d34daa0510e65f7b8ef85310777754` |
| `worker-boundary.lisp` | `4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a` |
| `worker-claim.lisp` | `62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e` |
| `worker-run.lisp` | `60b71475e7f765cc305e034e07fa2a3b3683e9b8b60090c56b8f97e99d2d3847` |

The new reading closes findings for items 2/3/10 in code, without
attributing outcomes not yet measured. Boundary fixtures,
macro expansion, crossed classes/reasons, permanent fault, and
corrupt private indices are required. The twelve items will be completed on final data.

<a id="denominatori-execution-da-conservare"></a>

## Execution denominators to preserve

The latest recycle campaign preserves the seven previous files. Following
counts are historical and not attributed to the new worker; the new campaign
must reread all eleven files without subtracting forms or branches.

| Previous execution file | Historical marked / total expressions | Historical marked / total outcomes |
|---|---|---|
| `package.lisp` | 0 / 1 | 0 / 0 |
| `queue.lisp` | 142 / 184 | 24 / 34 |
| `writer.lisp` | 190 / 218 | 36 / 44 |
| `handoff.lisp` | 173 / 190 | 16 / 16 |
| `ready-types.lisp` | 170 / 187 | 30 / 30 |
| `ready.lisp` | 173 / 194 | 20 / 22 |
| `ready-recycle.lisp` | 81 / 86 | 8 / 8 |
| Previous total | 929 / 1060 | 134 / 154 |

Complete mapping of uncovered forms and outcomes is preserved
in the [recycle inventory](writer-recycle-decisioni.md#copertura-raw-della-copia-congelata).
Denominators for the four worker files, new raw paths, native/HTML/export
comparison, and second reading await frozen data.
No approved exclusion, requirement promotion, or deduced MC/DC.

<a id="seconda-lettura-indipendente-c1"></a>

## Second independent C1 reading

Copy `arcdocdb-worker-verify-hzghjzb6` preserves frozen code
on base `cf60913`. The four final SHAs match preliminary
rereading above except `worker-types.lisp`, now
`62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317`:
the subsequent correction changes only the private-index docstring.
Final test SHA
`ccb4c6d8f8f588fe57ba3f9bab3a018f8eb1e9f9f27dd47a99ef444b43d7ad06`.
Complete twelve-item report: `spikes/out/worker-c1-final.lisp`.
No open functional finding; engine C1 qualification still open.

The 23 new fixtures in
[`tests/execution/worker.lisp`](../../tests/execution/worker.lisp) are
identified here by suffix after `test-REQ-…-worker-`:

| Checks | Fixtures read and nature of proof |
|---|---|
| Factory/idle/cursor | `factory-preflight-and-empty-cursor-rotation`, `claim-batch-ack-and-idle-release`; start/bounds, idle without obligations, rotation even on empty. |
| Lease/quota/batch | `quantum-yield-reschedule-and-monotone-tokens`, `batch-debt-blocks-more-pop-finish-and-transfer`; cumulative quota and prohibition on abandoning debt. |
| Ack and target | `current-token-required-and-stale-ack-keeps-debt`, `buffer-range-and-private-alias-preflight`; current token, invalid input, and sentinels. |
| Contention | `begin-busy-retains-claimed-reference`, `pop-busy-retains-lease-buffer-and-generation`, `end-busy-is-finishing-and-blocks-new-pop`; snapshot, initial latch, and retry without reprocessing. |
| Home/full/room/new wave | `scanned-home-and-full-recycle-retained-on-busy`, `two-contexts-full-refill-preserves-all-obligations`, `empty-observation-and-new-wave-after-idle`; full capacity, FIFO transfers, and preserved obligations. |
| Owner and transfers | `foreign-thread-refuses-all-six-phases`, `cede-adopt-validates-home-and-single-caller-obligation`; wrong-thread before mutation, no lease/batch transfer. |
| Exhaustion | `local-generation-limit-can-cede-into-fresh-context`, `generation-overflow-precedes-empty-and-yield-pop`; scalar FI without resetting generation during benchmarks, completion and lease-free transfer still available. |
| Oracle | `seeded-independent-obligations-payloads-and-batch-debt`: 13 writers, 8 configurations, 8000 steps, and drain against independent lists. Seeded oracle, not exhaustive pool exploration. |
| Internal FI | `private-shapes-and-pending-count-invariants`: 14 corrupt private shapes, checker without boundary, and quiescent restoration of FI alone. `private-index-corruption-poisons-before-adopt`: inconsistent cursor/home/fault through public API, without transferring caller obligation. |
| Macro/classifier | `boundary-expansion-values-once-and-error-identity`: expansion, single evaluation, multiple values, synthetic recoverable and permanent errors, runtime error, condition identity, and all terminal gates. |
| Fault/new wave | `stale-not-ready-reference-cannot-steal-new-wave`: declared stale-reference FI; old context remains faulted before/after new-wave enqueue and wrong-thread, while fresh context consumes it. No qualified public deduplication. |
| Concurrency | `reused-owner-contexts-live-producers-and-independent-shards`: four reused threads, six waves, 36 CRC payloads, and independent-shard progress. `competing-owner-contexts-claim-one-obligation-per-wave`: two reused consumers, eight waves, one winner per obligation. |

<a id="copertura-raw-e-tutte-le-lacune"></a>

## Raw coverage and all gaps

Probe `4000547296-command-98426-0`, OK/STABLE/exit0, recalculates native data
and compares HTML and export, including every missing path. Data:
`worker-review-coverage-data.lisp`; adapters `worker-review-coverage.lisp`
and `worker-review-html.py`. Native SHA
`2a9d546c77fc1a43690497bf7b46ff261a3ea8cde77766de5f91b8074e2b42d6`,
export SHA
`787b1ad0604b98c46690dd4655638d7ff7de4d4cf5f71864235fdc4c5244f09b`.
Coverage `4000547204-command-93188-0` and export with denominator
fixture `4000547249-command-95826-0`: OK/STABLE/exit0.

| Execution file | Marked / total expressions | Marked / total outcomes |
|---|---|---|
| `package.lisp` | 0 / 1 | 0 / 0 |
| `queue.lisp` | 142 / 184 | 24 / 34 |
| `writer.lisp` | 190 / 218 | 36 / 44 |
| `handoff.lisp` | 173 / 190 | 16 / 16 |
| `ready-types.lisp` | 170 / 187 | 30 / 30 |
| `ready.lisp` | 173 / 194 | 20 / 22 |
| `ready-recycle.lisp` | 81 / 86 | 8 / 8 |
| `worker-types.lisp` | 195 / 224 | 36 / 38 |
| `worker-boundary.lisp` | 40 / 51 | 10 / 12 |
| `worker-claim.lisp` | 143 / 175 | 5 / 8 |
| `worker-run.lisp` | 120 / 150 | 14 / 18 |
| Four new files | 498 / 600 | 65 / 76 |
| Total | 1427 / 1660 | 199 / 230 |

Indices are reversed: the last identifies the top-level form, then
traversal proceeds right to left. Probe `4000547596-command-16195-0`,
OK/STABLE/exit0, reads the four sources with read-eval NIL without
evaluating them, and enumerates every top-level and uncovered form in
`worker-review-forms-data.lisp`. Claim/run paths traverse source
node `%passo-worker` before the body; the reader does not execute the
macro. sb-cover counts do not separately certify each
instruction generated by the macro's gate/handler. The expansion
and behavior fixture checks that protocol without inferring MC/DC.

Each error root below contains four raw expressions:
call, designator, :reason keyword, and reason. Following rows
map all 233 unmarked expressions, including the previous 131:

| File | All unmarked forms |
|---|---|
| `package.lisp`, 1 | Top-level `(0)`, defpackage with new exports. |
| `queue.lisp`, 42 | 22 definitions/defaults: top-level `(0) (1) (2) (3) (5) (7) (9) (11) (13) (15)`; ten slots `(3 4)`..`(12 4)`; keywords `(1 2 12) (2 2 12)`. Twenty forms in five error roots `(2 2 4 6) (2 3 4 6) (2 3 4 8) (2 4 10) (2 5 10)`: shape/FIFO, ownership after acquisition, release ownership/CAS. |
| `writer.lisp`, 28 | Eight top-level `(0) (1) (2) (4) (6) (8) (10) (12)`. Twenty forms in error roots `(2 5 3) (2 4 5) (2 5 5) (2 1 1 3 4 7) (2 6 2 1 2 4 3 5 11)`: quota, owner ownership/CAS, acquisition, and extraction postcondition. |
| `handoff.lisp`, 17 | Nine top-level `(0) (1) (3) (5) (7) (9) (11) (13) (15)`; two slots `(3 2) (4 2)`; two defaults `(1 2 8) (2 2 8)`. Four forms in state otherwise, root `(1 5 4 4 6)`. |
| `ready-types.lisp`, 17 | Eight top-level `(0) (1) (2) (3) (6) (8) (10) (12)`; seven slots `(3 4)`..`(8 4)` and `(3 5)`; two factory defaults `(1 2 13) (2 2 13)`. |
| `ready.lisp`, 21 | Nine top-level `(0) (1) (2) (4) (6) (8) (10) (12) (14)`. Twelve forms in three error roots `(2 3 4 3) (2 5 5) (1 5 3 2 2 5 15)`: ownership after acquisition, release CAS, unexpected scan result. |
| `ready-recycle.lisp`, 5 | Only top-level `(0) (1) (2) (4) (6)`: in-package, optimization, three ftypes. |
| `worker-types.lisp`, 29 | Fourteen top-level: `(0) (1)` and odd `(3)`..`(25)`; ten slots `(3 2)`..`(12 2)`; start default `(2 2 20)`. Four forms in `%check-worker` otherwise, root `(1 6 9 16)`: state outside six operational phases, not reached through public faulted gate. |
| `worker-boundary.lisp`, 11 | Three top-level `(0) (1) (2)`. Eight forms in two error roots `(2 7 3) (2 8 3)`: postconditions of just-recorded condition identity and just-set phase. Not induced by corrupting context during handler. |
| `worker-claim.lisp`, 32 | Eight top-level `(0) (1) (2) (4) (6) (8) (10) (12)`. Twenty-four forms in six error roots: `(2 5 3)` and `(1 3 6 3)` type/phase in `%assegna-worker`; `(1 4 4 2 3 4 5)` unexpected take outcome; `(2 1 3 3 3 4 9)` non-NIL writer on published; `(1 4 3 3 4 9)` unexpected recycle outcome; `(2 2 4 4 13)` transfer-out writer type after precheck. |
| `worker-run.lisp`, 30 | Six top-level `(0) (1) (2) (4) (6) (8)`. Twenty-four forms in six error roots: `(2 1 2 3 5 4 3)` nonpositive messages count; `(2 1 3 3 5 4 3)` nonzero empty/yield count; `(1 4 3 5 4 3)` unexpected pop outcome; `(2 5 7)` and `(2 6 7)` inconsistent phase/debt in `%concludi-worker`; `(1 4 8 7)` unexpected end outcome. These are defenses after delegate validators/outcomes, not new exclusions. |

All 31 unmarked instrumented outcomes are made explicit below:

| File | All paths of unmarked outcomes |
|---|---|
| `queue.lisp`, 10 | `(:then 3 9 4)`, `(:else 3 9 4)`, `(:else 3 1 2 4 6)`, `(:else 2 1 2 4 6)`, `(:else 1 1 2 4 6)`, `(:else 1 2 4 6)`, `(:else 1 3 4 6)`, `(:else 1 3 4 8)`, `(:else 1 4 10)`, `(:else 1 5 10)`: guard type, bounds/shape/FIFO, ownership/CAS. |
| `writer.lisp`, 8 | `(:else 1 1 5 3)`, `(:else 1 5 3)`, `(:else 1 4 5)`, `(:else 1 5 5)`, `(:else 1 1 1 1 3 4 7)`, `(:else 1 1 1 3 4 7)`, `(:else 1 1 6 2 1 2 4 3 5 11)`, `(:else 1 6 2 1 2 4 3 5 11)`: quota, ownership/CAS, and extraction pre/post. |
| `ready.lisp`, 2 | `(:else 1 3 4 3)`, `(:else 1 5 5)`: ownership after acquisition and old CAS value at release. |
| `worker-types.lisp`, 2 | `(:then 3 7 2)`, `(:else 3 7 2)`: writer slot type union `(or null writer-programmabile)`, not COD-54 operational predicate. Remain in denominator. |
| `worker-boundary.lisp`, 2 | `(:else 1 7 3)`, `(:else 1 8 3)`: failure of two postconditions after fault registration. |
| `worker-claim.lisp`, 3 | `(:else 1 5 3)`, `(:else 1 1 3 3 3 4 9)`, `(:else 1 2 4 4 13)`: assigned type, NIL published result, transferred type after precheck. |
| `worker-run.lisp`, 4 | `(:else 1 1 2 3 5 4 3)`, `(:else 1 1 3 3 5 4 3)`, `(:else 1 5 7)`, `(:else 1 6 7)`: messages/empty-yield count and completion phase/debt after end. |
| Other four files | No unmarked instrumented outcome; no MC/DC inference. |

<a id="campagne-lette-e-dodici-punti-finali"></a>

## Campaigns read and twelve final items

Probe `4000547689-command-21967-0`, OK/STABLE/exit0, reads records
with evidence:read-evidence and all thirteen logs. Baseline 89 start/ok and
completion 89, exit0/signal NIL; 12/12 detected, each exit1/signal NIL,
authentic worker-test start and no completion. Zero survived,
compilation-failures, before-tests, and worker-errors. Campaign
`4000547268-command-97067-0`, data `worker-mutations/report.lisp`.

Benchmark `4000547268-command-97066-0`, data
`worker-allocations/report.lisp`: four configurations, five complete
samples of 4096 cycles each, all heap0. Independent derivation
from cycle gives full `189+115C+3C(C+1)/2+5Σpayload+7(C+1)next`, room
`227+14next`; overall payload 1..M, M=K(C+1), and cursor sum
K(K−1)/2. Token follows the method, calls
`1+K(27+7C)` and batches `K(C+4)`. Token/sink:
578/10754048, 858/11900928, 2520/18708480, 4084/25114624;
calls 35/49/137/193. Real generations persist through warmup and
replicas; they are not zeroed to obtain the sink. Positive control
16777472 bytes, wrong sink rejected; clockzero, partial report, and
previous destination remain distinct checks.

Strict C4 `4000547221-command-94073-0` and `94074-0`: complete COMPILE-FILE
and FASL self-test, OK/STABLE/exit0. Inherited marker contains
RECYCLE, but argv and tool identify worker; original data preserved.
Actual SIGKILL fixture `4000547222-worker-signal-self-test-94121`:
signal9/exit137, one worker-error, zero detected. This is not detection.

Check `4000547204-command-93189-0`, OK/STABLE/exit0, wall112.229559s:
387 tests from ten modules plus smoke, with counts
28/17/17/24/20/89/44/18/82/48. Lint63/zero; trace114 REQ/65 INV/13 FI/52 ADR
without errors; links221 documents/2007 links/zero broken. No actual
warning/style-warning line in read records. Master `4000547284-check-97964-0`:
complete, ten run/artifact, all exit0/stable; nine ok and SPK-07 pass.
These document snapshots precede final conclusions;
they are not described as verification of the subsequent editorial version.

| C1 item | Independent second reading and limitation |
|---|---|
| 1 | REQ/ADRs consistent with local segment context; frozen scope cf60913. |
| 2 | Invariants and three findings closed in code and fixtures; oracle, contention, new wave, and transfer preserve obligations/debt. No exhaustive pool proof. |
| 3 | COD-21 boundary records original condition and terminal transition; recoverable reasons per API, owner/gate before handler, fault cannot be cleared. Serie controller still absent. |
| 4 | No new explicit loop/wait/recursion; member over bounded literal lists, delegated bounded scan/copy. Fixture-only threads with timeouts. |
| 5 | Twenty composite heap0 measurements, positive control detected, and independent sink; preallocated success only, no universal proof. |
| 6 | Ftype/outcomes/count/token/buffer checked; ack attests to caller. Diagnostic getters do not transfer obligations or authorize replay. |
| 7 | Decisions inventoried, macro expansion/behavior test; native=HTML=export on eleven files. 233 uncovered forms/31 outcomes retained, no exclusion or deduced MC/DC. |
| 8 | Immutable owner and ready, nonreentrant local fields; transfers only without lease/debt. Four live threads/producers and two competing consumers verified. |
| 9 | Frozen check 387 tests+smoke, lint/trace/link and ten green spikes; execution89 baseline, strict C4, and 12/12 mutants. New base integration separate, below. |
| 10 | Safety3, ftype/slots/docstrings, pre/post, short functions; error handler limited to boundary with diagnosis/transition. No global C1 or Serie FAULTED qualification. |
| 11 | Ready per segment, no new global per-message write/wait. Independent fixture progress; no speedup, fairness, or P99 measurement. |
| 12 | No durable change. Finishing before end; only local state after end, no cleanup can erase a new wave. No rollback after internal fault. |

The first results audit also preserves complete master runs and is
large; it was not deleted. Compact projection
`worker-review-summary-data.lisp` points to its original bytes.
The first projection adapter fails in probe
`4000547809-command-24892-0` because it applies getf to a tagged entry that
is not a plist; adapter and failure preserved. Corrected version
`4000547879-command-29495-0` is OK/STABLE/exit0, also checks outcomes
of ten runs, and preserves all twenty samples. This is a probe error,
not a product or frozen-campaign error.

<a id="integrazione-della-base-successiva"></a>

## Subsequent base integration

After scoped campaigns, primary advances to `e2f7a75` with independent
recovery components. Execution/worker-test bytes and both worker tools
remain unchanged: this second reading and scoped campaigns remain
tied to copy cf60913. Full check of new integration
is distinct: `4000548048-command-40192-0`, OK/STABLE/exit0, wall116.613258s,
400 tests plus smoke, execution89/recovery95, lint66/zero,
trace114 REQ/65 INV/13 FI/52 ADR without errors, and links224 files/2017 links/zero
broken. Ten-spike master: `4000548134-check-44515-0`.

Scope record `4000548017-command-37007-0`, OK/STABLE/exit0,
compares bytes of twenty execution/test/tool files with previous copy
and preserves upstream recovery components. Independent addendum
`worker-c1-integration-addendum.lisp`, read/generated by probe
`4000548534-command-60644-0` OK/STABLE/exit0, preserves SHAs of both records
and four worker sources, all identical to second reading.
Original C1 report retains its temporal freeze; addendum
does not rename scoped campaigns or attribute subsequent document
editorial versions to checks. No product gate or campaign
rerun by review, no new C1/MC/DC qualification,
requirement promotion, or subtraction of coverage gaps.
