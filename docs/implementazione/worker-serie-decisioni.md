<a id="decisioni-del-collegamento-workerserie"></a>

# Worker–Serie link decisions

C1 inventory prepared on 2026-10-11 from reading the three sources with
function bodies in namespace `arcdocdb.execution.series`, initially on
`2a0011f9d2bef104b22f7ad1eb86d7e5d60d5e11` and reintegrated without changes
to the four sources on `8101eb856cbe9d7540682babb53afb00fde30f70`.
Line numbers identify this reading, after corrections WS-REV-01/02/03/04;
the function name and form remain the reference if layout changes.
The fourth source contains only the package definition. ASDF loads it,
together with the three bodies, after `series/retirement`, when execution,
WAL, and the Serie controller are already available; no loading cycle.

| Source read | SHA-256 |
|---|---|
| [`worker-package.lisp`](../../src/series/worker-package.lisp) | `881a2958ddb8f5781954d4c59d7467e34c03c01fbb2fea43dc06e9e2050a1f37` |
| [`worker-types.lisp`](../../src/series/worker-types.lisp) | `a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a` |
| [`worker-boundary.lisp`](../../src/series/worker-boundary.lisp) | `793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73` |
| [`worker-run.lisp`](../../src/series/worker-run.lisp) | `f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f` |

REQ-CON-001/002/004/005 and REQ-AFF-001/004/008; INV-P1/P2/P5/P6, INV-A4,
and INV-V4; [ADR-0005](../adr/0005-writer-logico-per-serie.md),
[ADR-0033](../adr/0033-fail-stop-e-integrita-end-to-end.md), and
[ADR-0045](../adr/0045-modello-di-esecuzione.md).
[C1 standards](../affidabilita/standard-di-codifica.md) apply, particularly
COD-10/13/21/24/40/45/46/53/54.

This is a static reading and preregistration of required tests.
It assigns no outcomes to the tests read, benchmarks, or coverage; those
outcomes must be linked to raw reports on the actual freeze.
It does not attest to human review, MC/DC, or universal absence of allocation.

<a id="identità-precondizioni-e-stati"></a>

## Identity, preconditions, and states

The link retains three immutable references: worker context,
programmable writer, and Serie controller. At startup, the caller establishes
the only valid association between that logical writer and that Serie and
preallocates links needed by workers. The factory does not check membership
or global uniqueness and does not create a pool. Each link belongs to its
context's creator thread, without reentrancy. Raw worker/Serie APIs are not
used to change the capabilities of an active segment; captured lease checks
detect the bypasses described in fixtures without turning them into an
authorized transfer.

| Link phase | Local obligation | Allowed worker phase |
|---|---|---|
| `:idle` | Writer and Serie leases zero; generation retained. | Begin separately requires `:claimed` of the associated writer. |
| `:active` | Positive generation, current captured writer lease, current Serie lease; batch remains in worker. | `:running` or `:batch`. |
| `:closing` | Current generation and writer lease; no new acquire/pop/ack. Serie lease can be zero after rejection or already completed release. | `:running` or `:finishing`. |
| `:faulted` | Terminal state and bridge condition retained; no implicit repair, handoff, or release. | Terminal worker; any preexisting terminal diagnosis is retained. |

The token identifies only the link/segment pair. The controller lease
identifies the controller/generation pair and thread; the batch token
identifies the worker context/batch pair. These are three distinct
capabilities, even when their integers match.

Begin acquires the writer before the Serie and extracts no messages.
Busy Serie or exhausted generation return token, `:closing`, and the
distinct reason; the caller must complete explicit termination before
recycling. Termination rejects batch debt before any release, sets
`:closing`, releases Serie, zeroes its lease only after success, then
terminates the worker. Busy end retains `:closing` and the writer lease:
the next attempt completes only end and does not repeat release.

<a id="inventario-completo-delle-decisioni"></a>

## Complete decision inventory

`types:N`, `boundary:N`, and `run:N` refer to the respective sources above.
Every row distinguishes true and false branches; delegated functions are
not flattened into local decisions. Point T01 records the delegated owner
check; the other 32 points record explicit control forms in the three
new sources. Type `or` unions are not COD-54 decisions.

| ID / location | Function and form | Branches, condition, and effect |
|---|---|---|
| T01 / types:22,25 | `%check-owner-worker-serie` → `execution::%check-owner-worker` | Thread `eq` owner: continues; foreign: `invalid-argument :worker-owner`, before handler and without writes. No new local predicate. |
| T02 / types:33 | `%check-writer-worker-serie`, `unless (plusp generation)` | True: valid generation; false: `invariant-violation :worker-serie-generation`, never a simple token rejection. WS-REV-02. |
| T03 / types:35 | Same helper, `unless (eq worker-writer bound-writer)` | Exact identity: continues; other/NIL: binding invariant. |
| T04 / types:37 | Same helper, `unless (plusp writer-lease)` | Positive token: continues; zero: lease invariant. |
| T05 / types:39 | Same helper, `unless (= context-lease captured-lease)` | Identical lease: delegated complete worker check; different: lease invariant before pop/end. |
| T06 / types:51 | `%check-worker-serie`, `unless (null fault)` | No diagnosis in operational phase: continues; non-NIL diagnosis: state invariant. |
| T07 / types:53 | Same helper, `case state` | Three operational clauses `:idle`, `:active`, `:closing`; `otherwise` signals invariant. `:faulted` enters only getters or the macro's terminal gate. |
| T08 / types:55 | Idle clause, `unless (zerop writer-lease)` | Zero: continues; positive: lease invariant, without clearing field. |
| T09 / types:57 | Idle clause, `unless (zerop series-lease)` | Zero: continues; positive: lease invariant, without corrective release. |
| T10 / types:61 | Active clause, `unless (member worker-state '(:running :batch))` | Both phases allowed; any other phase is invariant before Serie check. Followed by `series::%check-owner` of captured lease. |
| T11 / types:67 | Closing clause, `unless (member worker-state '(:running :finishing))` | Both allowed; any other phase is invariant. No controller read, even after its migration. |
| T12 / types:78 | `%require-worker-serie`, `unless (member link-state states)` | State in literal list: shape/capability checks; outside list: `resource-exhausted :worker-serie-state`, before reading Serie. |
| T13 / types:87 | `%check-token-worker-serie`, `unless (typep token 'index)` | Index: continues; wrong type/range: `invalid-argument :worker-serie-token`. |
| T14 / types:88 | Same helper, `unless (plusp token)` | Positive: continues; zero: same ordinary rejection, no mutation. |
| T15 / types:89 | Same helper, `unless (= token generation)` | Current: continues; stale/different: same ordinary rejection before mutation. |
| B01 / boundary:15–17 | `%fault-serie-posseduta`, `when (and A B C)` | Only new compound decision: marks `:archive` only if all three conditions are true; otherwise no controller write. Pairs in separate table. |
| B10 / boundary:27 | `%fault-worker-serie`, first `unless (eq worker-state :faulted)` | Operational worker: may examine allowlists B02–B05; already terminal worker: skips all and makes bridge terminal too. A fault already classified by a substep does not become benign again through a coincident reason in the outer step. WS-REV-04. |
| B02 / boundary:28 | Same helper, `when (typep condition 'resource-exhausted)` | Resource class: checks B03; other class: passes to B04. Reason alone does not authorize recovery. |
| B03 / boundary:29 | Same helper, `when (member reason resources)` | Reason expected for this step: returns NIL without mutation; unexpected: continues toward fault. |
| B04 / boundary:30 | Same helper, `when (typep condition 'invalid-argument)` | Invalid class: checks B05; other class: fault, unless B03 already returned. |
| B05 / boundary:31 | Same helper, `when (member reason arguments)` | Expected invalid reason: returns without mutation; unexpected: fault. No recovery of invariants or runtime errors with the same reason. |
| B06 / boundary:35 | Same helper, second `unless (eq worker-state :faulted)` | Still operational worker: classifier with empty lists makes it terminal; already terminal: does not overwrite first diagnosis. WS-REV-01. |
| B07 / boundary:38 | Same helper, `unless (eq saved-fault condition)` | Condition identity retained: continues; recording error: state invariant. |
| B08 / boundary:40 | Same helper, `unless (eq link-state :faulted)` | Terminal: returns; otherwise state invariant. |
| B09 / boundary:52 | `%passo-worker-serie`, `when (eq link-state :faulted)` in expansion | Terminal: `resource-exhausted :worker-serie-state` before installing handler; operational: executes body under boundary. First diagnosis is not replaced by gate. |
| R01 / run:15 | `%acquire-worker-serie`, `unless (eq state :closing)` | Closing: continues; other phase: state invariant before acquisition. |
| R02 / run:17 | Same helper, `unless (zerop series-lease)` | Zero: may acquire; positive: lease invariant, no duplicate acquire. |
| R03 / run:20,25 | Same helper, `handler-case` with only `resource-exhausted` clause, inside `%passo-worker-serie (link () ())` at run:14 | Success: retains Serie lease and becomes active; resource: R04; other conditions: first local boundary without recoverable reasons, then outer begin boundary. |
| R04 / run:26 | Resource clause, `unless (member reason '(:serie-busy :serie-lease-generation))` | Two exact reasons: returns reason in closing; any other resource is rethrown EQ within nil/nil boundary, becoming terminal even if the reason would be ordinary in a different begin substep. WS-REV-03. |
| R05 / run:46 | `inizia-worker-serie`, `unless (eq claimed-writer bound-writer)` | Identity: continues; other: `invalid-argument :worker-serie-binding` before writer begin. |
| R06 / run:48 | Same API, `when (= generation most-positive-fixnum)` | At limit: `resource-exhausted :worker-serie-generation` before begin; below limit: new writer lease, closing, and monotonic increment. |
| R07 / run:103 | `termina-worker-serie`, `unless (member worker-state '(:running :finishing))` | Running/finishing: can close; batch or other: `resource-exhausted :worker-state` before Serie release. Shape check may first detect an invariant. |
| R08 / run:106 | Same API, `when (plusp series-lease)` | Positive: one release protected by nil/nil boundary at run:107, then zeroing; zero: no release and no Serie read. Worker end follows both branches. No unexpected release reason is recoverable through outer end allowlist. WS-REV-04. |

Factory and two getters contain no other decisions: they delegate T01;
the factory also delegates T06–T09 before returning the link. Lease/pop/ack
APIs add only boundary B09, T12, and T13–T15, then delegate to controller or
worker. Begin returning state and reason adds no `case`: it is checked by
`%acquire-worker-serie` postconditions. End's `:idle/:schedule` value comes
from the worker, which distinguishes these outcomes and retains the
recycling obligation.

<a id="decisione-composta-e-coppie-indipendenti"></a>

## Compound decision and independent pairs

In `%fault-serie-posseduta`:

- A = `(plusp captured-series-lease)`;
- B = `(eq controller-owner sb-thread:*current-thread*)`;
- C = `(= controller-lease-generation captured-series-lease)`.

The written test `TEST-REQ-AFF-004-WORKER-SERIE-OWNED-FAULT-THREE-INDEPENDENT-TRUTH-PAIRS`,
in [`worker-bridge.lisp`](../../tests/series/worker-bridge.lisp), declares
four independent scenarios. The table is a manual reading of assignments
and the required result, not an instrumental result.

| Fixture scenario | A | B | C | Required decision | Contrast |
|---|---|---|---|---|---|
| `:all-true` | T | T | T | Marks Archivio; only health may change. | Common base. |
| `:lease-zero` | F | T | T | No controller write. | Only A changes from base. |
| `:owner-other` | T | F | T | No controller write. | Only B changes from base. |
| `:generation-stale` | T | T | F | No controller write. | Only C changes from base. |

For false A, the fixture sets both captured lease and controller generation
to zero, keeping owner equal to the thread: C remains true. This state is
private quiescent FI; it is not a production lease and no owner API is
invoked before restoring FI fields. For false B, owner becomes NIL with
lease/generation intact; for false C, generation becomes lease+1 with owner
and lease intact. Each scenario uses a distinct healthy controller and
compares before/after images, except health in the all-true case.
FI cleanup does not reset health.

`and` short-circuits: with false A, B/C are not evaluated; with false B,
C is not evaluated. Table values are those of assignments; their dynamic
evaluation is not inferred from sb-cover. Manual pairs and the branch
report do not attest to module MC/DC.

<a id="allowlist-per-passo-e-classe-di-errore"></a>

## Allowlists by step and error class

The boundary does not catch non-`error` conditions. It catches `error`
only to record the worker transition, with a local `dynamic-extent` handler:
it neither suppresses nor rethrows the original condition. Lists are
literal and finite; a reason is allowed only in its declared class and
in the step listed below. Allowlists are examined only if the worker is
not already terminal, as established by B10; a substep fault prevents
any subsequent conversion into ordinary rejection.

| API | Recoverable resource reasons | Recoverable invalid reasons | Allowed phases |
|---|---|---|---|
| `inizia-worker-serie` | `:worker-serie-state`, `:worker-state`, `:worker-serie-generation`, `:writer-queue-busy` | `:worker-serie-binding` | Idle link; claimed worker. |
| `%acquire-worker-serie`, inner boundary | None | None | Closing; writer acquired. R03/R04, also inside this boundary, converts only the two declared Serie resource reasons. |
| `lease-worker-serie` | `:worker-serie-state` | `:worker-serie-token` | Active; running/batch worker. |
| `preleva-worker-serie` | `:worker-serie-state`, `:worker-state`, `:worker-generation`, `:writer-queue-busy` | `:worker-serie-token`, `:writer-target` | Active; worker pop requires running. |
| `conferma-worker-serie` | `:worker-serie-state`, `:worker-state` | `:worker-serie-token`, `:worker-batch` | Active; worker ack requires batch. |
| `termina-worker-serie` | `:worker-serie-state`, `:worker-state`, `:writer-queue-busy` | `:worker-serie-token` | Active or closing; running/finishing worker. |
| Serie release, termination's inner boundary | None | None | Closing; positive Serie lease, before zeroing it. |

Resource reasons `:serie-busy` and `:serie-lease-generation` are converted
to `:closing` only by handler R03/R04, after writer begin, with the reason
as the third value. They are not in the outer allowlist. Local exhaustion
and controller exhaustion are not blind retries: the former retains idle
without a new lease, the latter requires closing the acquired writer lease.

Begin has two dynamic boundary instances: the first boundary allows
precondition and writer rejections, the second encloses only
`%acquire-worker-serie` with both lists empty. The Serie `handler-case`
is further inside and consumes the two expected rejections before boundaries.
If it rethrows an unknown resource or another error propagates, the inner
boundary makes contexts terminal before the outer one can recognize a reason
valid only for a different step. The outer boundary does not reset the
already recorded fault: B10 skips its allowlists because the worker is already
terminal, the same condition keeps propagating, and state remains terminal.
This substep separation is WS-REV-03; it requires neither retry nor cleanup.

Termination likewise contains two dynamic boundaries while it must still
release Serie: the inner one, with empty lists, protects only release;
the outer one allows phase/token rejections and writer termination busy.
A `:writer-queue-busy` or `:worker-serie-token` reason injected into release
does not authorize recovery: the inner boundary marks the fault before the
outer one. If release fails, its token is not zeroed and the writer is not
terminated. After successful release, end retry with zero Serie token does
not reinstall the release boundary.

A correct reason in the wrong class, unexpected resource/invalid,
`invariant-violation`, `io-fault`, and other runtime errors require a terminal
fault. The bridge condition remains the same EQ object; if the worker was
already terminal, it retains its first condition, even when different from
the bridge's. Wrong-thread and faulted gate are before the handler.
Factory and getters install no handlers.

<a id="controlli-delegati-e-coupling-privato"></a>

## Delegated checks and private coupling

| Delegate read | Obligation and boundary |
|---|---|
| `execution::%check-owner-worker` | Context owner; does not read Serie or writer under guard. |
| `execution::contesto-worker-writer-lease` | Scalar comparison with captured writer lease; does not reconstruct a token from a migrated role. |
| `execution::%check-worker` | Worker shape, references/lease/debt/quotas, cursors, and ready; its decisions remain in the [worker inventory](writer-worker-decisioni.md). |
| `execution::%richiedi-worker` | Claimed checked before begin; no implicit adoption or handoff. |
| `execution::%classifica-guasto-worker` | Only on a not-yet-terminal worker, empty lists: original error recorded without resetting references or debt. |
| `series::%check-owner` | Thread, positive lease, generation, and current ring before using Serie. Ring invariants mark Archivio; stale lease remains a propagated condition. |
| `series::controllore-serie-owner` and `...-lease-generation` | Only scalar reads in fault gate B01; no check-ring that could replace original error. |
| `series::%mark-fault :archive` | One terminal word, without reconstructed lease, callback, or ring check; invoked only when A/B/C true. Does not coordinate other Serie. |
| Public worker and Serie APIs | Their pre/postconditions remain active; pop/ack/end and controller order are not reimplemented by bridge. |

This coupling is intentional between the two foundations of the same ASDF
system: every owner/generation/lease/check/classifier change requires
integration review. The bridge does not read Serie in closing after release,
even if another worker has already acquired it. A fault after release can
make only bridge and worker terminal; the caller must stop the Archivio
when the outcome requires it. Marking a controller from a subsequent segment
using a stale lease is unsafe.

<a id="limiti-asserzioni-e-macro"></a>

## Bounds, assertions, and macro

There are no loops, recursion, waits, threads, callbacks, global lookup,
I/O, or retries in the three sources. `member` lists have maximum lengths
of four for resource, two for invalid, and two for phases: bounded scans.
Every step is O(1), beyond the existing bounded batch copy; begin does not
touch ready, end returns to the worker the obligation the caller recycles.
The factory allocates only during preallocation. Absence of heap on the
normal path requires separately recorded measurement.

Local syntactic counts from the reading: one base plus each `when`/`unless`,
two additional Boolean entries for three-condition `and`, three nondefault
`case` clauses, and the `handler-case` clause; delegated decisions remain
in their functions. Gate B09 introduced by expansion is counted separately
for each instance, without flattening the classifier into the caller.
Maximum is 9: `%check-worker-serie` and `%fault-worker-serie`;
`%fault-serie-posseduta` is 4, `%check-writer-worker-serie` is 5.
`%acquire-worker-serie` is 6 including macro gate, begin is 4, lease/pop/ack
are 2, termination is 5 including its two macro gates. Other functions are
at most 4. No body exceeds 60 lines. These counts are not coverage measurements
or numbers of concurrent interleavings.

Pre/postconditions are composed through helpers and checkers: begin checks
idle/claimed/identity/limit before acquisition and checks phase after acquire;
pop/ack check phase, token, and capabilities before worker checks, which
also perform postchecks; termination checks both capabilities and debt before
release, and after end checks only the idle link with zeroed leases. Fault
separately checks diagnosis identity and terminal state. Getters have only
the owner precondition because they also serve diagnosis.

`%passo-worker-serie` evaluates link only once with a lexical binding,
checks owner and terminal state outside the handler, then returns all body
values unchanged. The written test
`TEST-REQ-AFF-008-WORKER-SERIE-BOUNDARY-ONCE-VALUES-AND-EXACT-CONDITION`
reads the expansion, counts the single input reference, and checks single
evaluation, three values, condition EQ, and rejection images. The test
does not authorize inferring zero heap from expansion alone. The same macro
has seven product sites: five public APIs, the Serie acquire substep, and
the Serie release substep. The two simultaneous begin handlers and, when
release is needed, termination handlers are local `dynamic-extent`; their
absence of heap still requires measurement on source after WS-REV-03/04.

A nonlocal exit that signals no `error` is not caught: there is no automatic
cleanup releasing, canceling, or reusing capabilities. Integration does not
permit nonlocal abandonment of a segment and requires a coordinator boundary
for uncertain outcomes. The bridge does not apply payloads, acknowledge
clients, prove I/O END from `:written`, reuse buffers, or implement pool
shutdown or fairness.

<a id="obblighi-delle-prove-e-rapporto-grezzo"></a>

## Test obligations and raw report

Written fixtures inventory double lease and FIFO, quotas and generations,
first and second contention, busy end after Serie release, batch debt,
stale/type/zero token, target/span/alias, binding identity, both exhaustions,
foreign owner in all four phases, release fault and error between releases,
stale Serie owner/generation, B01 pairs, macro, and I/O END after fault.
Two real-thread fixtures distinguish exclusion on the same controller from
two controllers active before any release. This reading attributes no
throughput, P99, scalability, or universal correctness to their finite
interleaving.

The WS-REV-01 regression must preserve the already faulted worker's EQ
condition when link begin causes a new error. WS-REV-02 must make zero
link generation terminal in active and closing, without treating it as
an incorrect caller token. Assertion branches, unexpected reasons, and
wrong error classes must remain in the inventory even if a finite campaign
does not reach them. The WS-REV-03 regression must inject reasons ordinary
only elsewhere (`:writer-queue-busy`, `:worker-serie-binding`) and a runtime
error into Serie acquisition, retaining EQ condition, writer/token, and
unmodified controller if its lease was not acquired. WS-REV-04 requires
two further regressions: three error classes in Serie release with reasons
allowed only by the outer step; an error in raw pop already classified
as terminal by the worker but with a bridge-allowed reason
(`:worker-serie-token`). They must retain EQ condition, tokens, and terminal
fault, without duplicate end or pop.

The `series` coverage report must retain all twelve `src/series/` files
(eight controller plus four bridge), with raw denominators, missing branches,
and no exclusion of packages/helpers/delegates within the directory.
Transitive execution decisions have their own inventory and report: a
Series scope does not measure them. Raw reports and manual decisions do
not prove MC/DC, every interruption path, or the engine's entire error hierarchy.
