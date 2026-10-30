<a id="decisioni-della-consegna-locale-dei-writer"></a>

# Local writer handoff decisions

C1 inventory of [`handoff.lisp`](../../src/execution/handoff.lisp) and new
helper `%accoda-sotto-guard` in [`queue.lisp`](../../src/execution/queue.lisp).
Decisions of delegated primitives remain in the
[queue and lease inventory](code-writer-decisioni.md); this
document adds local handoff checks and makes cleanup explicit.
The [method](writer-handoff-metodo.md) distinguishes public tests, fault injection
on private objects, and real-thread tests.

References: REQ-CON-001/002/004/005, REQ-AFF-008;
INV-P1/P2/P5/P6, INV-A8, INV-V4;
[ADR-0045, items 6 and 8](../adr/0045-modello-di-esecuzione.md).

<a id="predicati-scalari-e-stati"></a>

## Scalar predicates and states

Final source `handoff.lisp` has no new compound decisions using
`and`/`or`: inactive owner and quota checks are separate `unless` forms.
The absence of new compound decisions does not remove scalar decisions,
`case` branches, delegated checks, or error paths from the denominator.
Parameter and slot types are runtime-checked preconditions
with `safety 3`; they are not disabled to construct impossible fixtures.

The table lists fixtures contained in
[`tests/execution/handoff.lisp`](../../tests/execution/handoff.lisp).
Abbreviated names in the third column are suffixes of tests with `REQ-…` IDs.
This correspondence describes test content; campaign success
and actually marked branches must be attested by raw evidence.

| Site | Condition and outcomes | Fixture or limitation |
|---|---|---|
| `writer-programmabile`: `queue` default | Private constructor receives explicit queue; defensive default signals `:writer-scheduling`. | Public factory; defensive default not called by factory, retained in denominator. |
| `%accoda-sotto-guard`: guard | Guard equals current thread or `invariant-violation`, `:writer-guard`. | `helpers-require-current-thread-guard`, without guard and with another thread's guard; no acceptance. |
| `%accoda-sotto-guard`: ring | Bounds and FIFO relationship checked before and after mutation by `%check-queue`. | Delegated inventory; previous queue tests plus wrapper FIFO oracle. |
| `%accoda-sotto-guard`: full | `count = capacity`: `resource-exhausted`, `:writer-queue-full`; otherwise one acceptance. | `full-ready-and-running-retain-state`, minimum/default/maximum configurations, and oracle with wraparound. Rejected payload remains with producer. |
| `%check-writer-inattivo`: guard | Current-thread guard or `:writer-guard`. | `helpers-require-current-thread-guard`, both declared rejections. |
| `%check-writer-inattivo`: owner | Owner NIL or `:writer-scheduling`. | `rejects-inconsistent-scheduling-states`: `idle-owner` and `ready-owner` FI; sacrificed private objects. |
| `%check-writer-inattivo`: quota | `extracted = 0` or `:writer-scheduling`. | Same fixture: `idle-extracted` and `ready-extracted` FI; active quota checked separately by lease protocol. |
| `%check-programmabile`: guard | Current-thread guard or `:writer-guard`. | `helpers-require-current-thread-guard`; API pre/post checks. |
| `%check-programmabile`: ring | `%check-queue` before interpreting state. | Delegated inventory; state FI keeps ring indices consistent. |
| `%check-programmabile`: `case` | `:idle`, `:ready`, `:running`; `otherwise` signals `:writer-scheduling`. | Three states traversed by API. `otherwise` is defensive and not constructed by bypassing slot type; remains in raw denominator. |
| Idle state: count | `count = 0` or `:writer-scheduling`. | Factory and empty completion; `idle-count` FI with consistent ring. |
| Ready state: count | `count > 0` or `:writer-scheduling`. | First enqueue and requeue; `ready-count` FI with consistent ring. |
| Running state: owner | Owner present or `:writer-scheduling`. | Active segments; `running-owner` FI after legal begin. |
| `accoda-lavoro-writer`: `schedule` | State before acceptance equals idle; false for ready and running. | `single-obligation-and-duplicate-begin`, race before/after empty completion, producer on active segment. |
| `accoda-lavoro-writer`: `when schedule` | Only first message from idle sets ready. | Same fixtures; full and busy produce no transition. |
| `accoda-lavoro-writer`: `if schedule` | `:schedule` or `:queued`; both with acceptance count. | Obligation count and FIFO in independent oracle; failed notification retried without repeating enqueue. |
| `inizia-tratto-writer`: ready | Ready acquires lease and becomes running; idle/running signal `:writer-not-ready`. | `single-obligation-and-duplicate-begin`, finite oracle, and foreign-thread test. Not-ready does not authorize blind retries. |
| `inizia-tratto-writer`: acquisition | Busy guard CAS: no change; exhausted generation: cleanup of acquired ownership and ready preserved. | `busy-idle-and-ready-preserve-state`, `generation-exhaustion-preserves-ready`. Generation prepared at max−1 on quiescent object; two subsequent rejections without wraparound. |
| `termina-tratto-writer`: lease | Delegated checks before guard acquisition; valid token or `:writer-lease`. | `lease-validation-and-stale-generation`, `foreign-thread-cannot-use-lease`; double completion rejected. |
| `termina-tratto-writer`: pending | `count > 0` or zero, under same guard as enqueue. | Backlog, early completion, cumulative quota, and empty; both race orders. |
| `termina-tratto-writer`: state `if` | Pending sets ready; no pending sets idle. | `early-release-conserves-entire-backlog`, `cumulative-quantum-and-successive-slices`, `enqueue-before-and-after-empty-release`. |
| `termina-tratto-writer`: result `if` | Pending returns `:schedule`; otherwise `:idle`. | Notification oracle and new wave after idle; different workers on successive segments. |

<a id="primitive-delegate-e-cleanup"></a>

## Delegated primitives and cleanup

| Delegate or path | Checks and effects | Planned evidence or limitation |
|---|---|---|
| `crea-writer-programmabile` → `crea-coda-writer` | Capacity and quantum type/range; preallocated exclusive ring. | `configuration-and-limits`: invalid input, defaults, `(1,65536)` and `(65536,1)`; original compound decisions remain in their inventory. |
| `%acquisisci-guard` / `%rilascia-guard` | One CAS per acquisition, ownership and old value checked; no spinning. | Previous inventory; deterministic busy on idle/ready/running wrapper. Defensive CAS checks are not falsified by corrupting a shared guard with active threads. |
| `inizia-tratto-writer` → `acquisisci-writer` | Owner CAS, initial extracted, monotonic generation, cleanup without wraparound. | Previous inventory; maximum generation also tested through wrapper. Owner busy is not a legal path for ready wrapper with consistent private queue. |
| `preleva-lavori-writer` → `preleva-messaggi` | Lease/thread/generation, target and alias, span, cumulative quota, minimum count/span/quota, FIFO, and `:messages/:empty/:yield`. | `target-preflight-and-private-alias`, stale/foreign leases, quota, and sentinels; all compound decisions remain those of original primitive. |
| `termina-tratto-writer` → `rilascia-writer` | Lease rechecked, zero extracted before owner CAS to NIL; generation preserved. | Lease and busy completion; normal release and subsequent higher lease. Private queue: no low-level API concurrent with wrapper. |
| Factory cleanup | Guard release after checking newly constructed wrapper. | Public construction; no wrapper published on rejected configuration. |
| Acceptance cleanup | After success, full, or internal error with acquired guard, `unwind-protect` releases guard. | Full does not alter snapshot; subsequent enqueue and drain remain possible. Entry busy neither acquires guard nor accepts payload. |
| Begin cleanup | Guard released after success, not-ready, or overflow; running set only after successful acquisition. | Duplicate and overflow preserve work and state; overflow frees temporary owner CAS acquired by primitive. |
| Completion cleanup | Guard released after token transfer and ready/idle decision; entry busy preserves lease, quota, and state. | `busy-release-retains-lease-for-retry`: before/after snapshot, including after processing; only completion is retried. |

An `invariant-violation` requires owner fail-stop: rollback of mutation
followed by internal fault is not promised. Normal full/busy
conditions and lease/target errors instead precede their respective mutation.
The wrapper produces no callback, thread, ready list, wakeup, or durable
change. Retaining and executing the `:schedule` obligation exactly once belongs
to the caller; abandoning or duplicating it violates the contract.

<a id="prima-lettura-indipendente-e-correzioni"></a>

## First independent reading and corrections

The first reading examined `handoff.lisp` SHA-256
`256367a3acc48fffdd4c48db6b2f7a12583971b7cbe307d81906442ee939234b`
without finding a functional race. It recorded two findings, both closed
in final source SHA-256
`ee90c809ef51134efa21e08b819e5530304efaf9f9e26b63c7e4afbf6d48e607`:

- The begin docstring grouped busy, not-ready, and generation with an instruction
  to retry. It now distinguishes transient busy, ineligible or duplicate
  assignment, and permanently exhausted generation; no new API path.
- `%check-programmabile` exceeded COD-13 when counting both `and`
  short circuits. Extracting `%check-writer-inattivo` leaves eight paths in
  the first helper and four in the second; owner and extracted have separate
  scalar checks. Rejections are individually exercised by private FI.

Compared `queue.lisp` source:
`244259780ecaf905d21a641417abf58a4368bdf3cc24a09fc0d34c4284684f90`.
Compared tests:
`7f6403baba22b175d3047cfd0ba92d7f5ca8313668242a884e5954627f3d5e6e`.
The [final review](writer-handoff-revisione.md) links these sources to frozen results;
this first reading and inventory alone attest neither to `make check`,
universal absence of allocation, complete MC/DC, nor engine qualification.

<a id="copertura-raw-osservata"></a>

## Observed raw coverage

The campaign in frozen copy `arcdocdb-handoff-verify-0795g4qt`
produced `spikes/out/handoff-coverage/coverage-state.lisp` and HTML index.
Independent recalculation reads path vectors and raw bits:
a path beginning with `:then` or `:else` is a branch outcome; others
are expressions. The result matches the HTML index; no element
is subtracted from the denominator.

| Execution file | Marked / total expressions | Marked / total outcomes |
|---|---|---|
| `package.lisp` | 0 / 1 | 0 / 0 |
| `queue.lisp` | 142 / 184 | 24 / 34 |
| `writer.lisp` | 190 / 218 | 36 / 44 |
| `handoff.lisp` | 173 / 190 | 16 / 16 |
| Total | 505 / 593 | 76 / 94 |

The 17 unmarked handoff expressions are nine top-level forms
(`in-package`, optimizations, and `ftype`), two structure slot/default
forms, two factory keyword-default forms, and four defensive
`otherwise` error forms. No instrumented handoff branch outcome
is uncovered; `otherwise` remains among raw expressions.
Complete MC/DC coverage is not deduced from 16/16.

New helper `%accoda-sotto-guard` has no uncovered instrumented outcomes.
The 42 unmarked queue expressions include 22 definition
or default forms and 20 forms in five defensive errors. Ten unmarked outcomes
are two alternatives in the DEFSTRUCT slot-type `or`, five ring
bounds/relationship outcomes, and three guard post-acquisition/ownership/CAS
checks. Compared with the previous campaign, one additional expression remains
unmarked, the helper's new `ftype`; prior operational gaps
are not declared closed by this refactoring.

The 28 unmarked writer expressions are eight definition forms and
20 forms in five defensive errors. Eight unmarked outcomes are two
lease-quota checks, two owner-release checks, two acquisition
postconditions, and two extraction postconditions.
The unmarked package form also remains in the total.
No C1 exclusion is approved; these data do not qualify
wakeups, adaptive pool, engine fault path, or engine latency.
