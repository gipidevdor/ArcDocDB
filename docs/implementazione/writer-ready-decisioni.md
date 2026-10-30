<a id="decisioni-della-lista-dei-writer-pronti"></a>

# Ready writer list decisions

C1 inventory of [`ready-types.lisp`](../../src/execution/ready-types.lisp) and
[`ready.lisp`](../../src/execution/ready.lisp), under the
[preregistered method](writer-ready-metodo.md). References:
REQ-CON-001/002/004/005, REQ-AFF-008; INV-P1/P2/P5/P6, INV-A8, INV-V4;
[ADR-0005](../adr/0005-writer-logico-per-serie.md) and
[ADR-0045 §§6/8](../adr/0045-modello-di-esecuzione.md).

The list transports references and obligations already produced by `:schedule`.
It neither consults nor modifies writer state, deduplicates obligations,
nor implements the pool or wakeups. Publication only once is a caller
precondition. Full/busy retain the obligation with the caller; successful
publication and extraction transfer it to the ring and worker, respectively.
Writer decisions remain in the
[local handoff inventory](writer-handoff-decisioni.md).

<a id="predicati-scalari-default-e-rami"></a>

## Scalar predicates, defaults, and branches

There are no new compound `and`/`or` decisions in `if`, `when`, `unless`, or
`cond` in the two sources. The `or` in the guard slot type and return types
is a type union, not a COD-54 compound decision. Ternary `<=` comparisons
check both endpoints separately in configuration tests and fault injection;
complete MC/DC is not inferred from their inventory.

The following references identify suffixes of `test-REQ-…-ready-…` tests in
[`tests/execution/ready.lisp`](../../tests/execution/ready.lisp). They describe
fixtures read, not execution outcomes. Raw campaigns and the final reading
must attest to actual outcomes without subtracting forms from the denominator.

| Point | Condition and outcomes | Available fixture or limitation |
|---|---|---|
| `partizione-pronta` defaults | Slots `#()`, capacity 1024, head/tail/count zero, guard NIL. Factory passes explicit slots/capacity; indices start at zero. | `configuration-and-limits`; structural defaults remain in raw denominator. |
| `lista-writer-pronti` defaults | Partitions `#()`; factory passes complete vector. A private object with zero partitions is rejected by checker. | Public factory; `rejects-invalid-private-partition-arrays`: empty vector. |
| `%check-forma-pronta`: capacity | `1 <= capacity <= 65536`, otherwise `:ready-queue-invariant`. | Minimum/default/maximum factory; `rejects-invalid-private-ring-shapes`: FI capacity 0 and 65537. |
| `%check-forma-pronta`: slots | Slots length equals capacity, otherwise `:ready-queue-invariant`. | Valid pre/post; same FI: slots length 1 with capacity 2. |
| `%check-forma-pronta`: head | Head below capacity, otherwise `:ready-queue-invariant`. Type `index` excludes negatives. | FIFO with wrap and capacity 1; same FI: head 2 with capacity 2. |
| `%check-forma-pronta`: tail | Tail below capacity, otherwise `:ready-queue-invariant`. | FIFO with wrap and capacity 1; same FI: tail 2 with capacity 2. |
| `%check-forma-pronta`: count | Count no greater than capacity, otherwise `:ready-queue-invariant`. | Full/empty; same FI: count 3 with capacity 2. |
| `%check-forma-pronta`: relation | `tail = (head + count) mod capacity`, otherwise `:ready-queue-invariant`. | List oracles and wrap; same FI: tail 1, head/count zero, bounds still valid. |
| `%check-pronta`: ownership | Guard equals current thread, otherwise `:ready-queue-guard`; then shape check. | `helpers-reject-missing-and-foreign-guard`: absent guard and guard owned by another thread; no mutation. |
| `%partizione-verificata`: cardinality | Partition count 1..64, otherwise `:ready-queue-invariant`. | Configurations 1, 3, 4, 64; `rejects-invalid-private-partition-arrays`: vectors of length 0 and 65. |
| `%partizione-verificata`: index type | Shard of type `index`, otherwise `invalid-argument`, `:ready-target`. | `shard-and-writer-preflight`: negative, NIL, float, and beyond-fixnum value, for publish and take. |
| `%partizione-verificata`: index bound | Shard below length, otherwise `:ready-target`. | Same fixture: index equal to cardinality; ring preserved. |
| `%partizione-verificata`: reference | List slot of type `partizione-pronta`, otherwise `:ready-queue-invariant`. | Factory; same FI: length-1 vector with NIL slot. |
| Factory: shards type | `index`, otherwise `:ready-configuration`; checked before comparison. | `configuration-and-limits`: negative, NIL, and float. |
| Factory: shards range | 1..64, otherwise `:ready-configuration`. | Zero, 65, 1, and 64; default 4. |
| Factory: capacity type | `index`, otherwise `:ready-configuration`; checked before comparison. | Negative, NIL, and float. |
| Factory: capacity range | 1..65536, otherwise `:ready-configuration`. | Zero, 65537, 1, and 65536; default 1024. |
| Factory: keyword defaults | Shards 4, capacity 1024 when arguments absent. | Saturation and drain of partition 3 of default list. |
| Factory: loop | Exactly shards constructions, with shape checked before vector publication; final partition 0 check. | 1..64 iterations; vectors remain private until return. No retry loop. |
| `%prendi-guard-pronta`: CAS | Old value NIL acquires guard; other value returns NIL without mutation. | `skips-busy-home-and-preserves-local-ring`, `busy-observations-and-scan-order-oracle`, foreign guard, and real workers. |
| `%prendi-guard-pronta`: postcondition | Guard equals thread after successful CAS, otherwise `:ready-queue-guard`. | False branch requires private protocol failure; do not alter a shared guard during a concurrent test. |
| `%rilascia-guard-pronta`: ownership | Guard equals expected thread, otherwise `:ready-queue-guard`, before CAS. | Ordinary/full cleanup; `helpers-reject-missing-and-foreign-guard`, without guard and with foreign guard. |
| `%rilascia-guard-pronta`: CAS | Old CAS value equals thread, otherwise `:ready-queue-guard`. | Ordinary release; false branch after precheck requires protocol failure. |
| `%pubblica-pronto`: full | Count equal to capacity rejects with `resource-exhausted`, `:ready-queue-full`, before writes. | `configuration-and-limits`, `full-preserves-scheduling-obligation`, both list oracles. |
| `%pubblica-pronto`: tail slot | Tail slot NIL or `:ready-queue-invariant` before mutation. | Slots reused after drain/wrap; `rejects-inconsistent-occupied-and-free-slots`: zero count, tail slot occupied by writer. |
| `%pubblica-pronto`: pre/post | Guard/shape checked before and after; slot written, circular tail, count incremented by one. | Expected count and FIFO identity from oracles; ring does not query writer. |
| `%preleva-pronto`: empty | Zero count returns NIL/`:empty`; positive count proceeds to extraction. | Empty lists, drain, capacity 1, and unsuccessful scan. |
| `%preleva-pronto`: payload | Reference of type `writer-programmabile` or `:ready-queue-invariant` before writes. | Reference identities; same FI: count 1 with NIL, keyword, or vector head slot. |
| `%preleva-pronto`: pre/post | Guard/shape checked, slot freed, circular head, count decremented by one, then writer/`:writer`. | FIFO, wrap, and subsequent saturation; no writer-state cleanup. |
| `pubblica-writer-pronto`: input | Partition checked before guard; writer of required type or `:ready-writer`. | `shard-and-writer-preflight`: NIL, keyword, vector, and low-level queue rejected; subsequent take/empty proves preservation. |
| `pubblica-writer-pronto`: busy | Verified acquisition or `resource-exhausted`, `:ready-queue-busy`, without insertion. | `busy-publication-retains-obligation-and-payload` and `skips-busy-home-and-preserves-local-ring`: snapshot preserved, only publication retried. |
| `%prova-pronta`: busy | Unavailable guard returns NIL/`:busy`; otherwise delegates extraction and installs cleanup. | `helpers-reject-missing-and-foreign-guard`, guard oracle, and real workers; no condition allocated for ordinary scan busy. |
| `preleva-writer-pronto`: start | `%partizione-verificata` checks index before scan; `(the index start)` does not disable safety. | `shard-and-writer-preflight`; oracle cursors 0..K−1. |
| `preleva-writer-pronto`: loop | At most K acquisition attempts, K <= 64; each successful acquisition also has a release CAS; early exit at first writer. | `cursor-rotates-first-choice-and-empty-scan`, `busy-observations-and-scan-order-oracle`: eight guard configurations for each of three starts. |
| `preleva-writer-pronto`: `case` | `:writer` returns immediately; `:busy` retains fact that a guard was busy; `:empty` continues; `otherwise` signals `:ready-queue-invariant`. | Writer/empty/busy in oracles and `skips-busy-home-and-preserves-local-ring`. `otherwise` is defensive: no type changes or function replacement to make it appear as public input. |
| `preleva-writer-pronto`: cursor | Success: modulo-K successor of served shard; each unsuccessful attempt advances by one modulo K. | Rotation with all partitions full, search from different cursors, wrap, and K=1. |
| `preleva-writer-pronto`: `if busy` | After K failures: `:busy` if at least one guard was contended, otherwise `:empty`; NIL reference and cursor start+1 modulo K. | `busy-observations-and-scan-order-oracle`: free, all busy, and mixed guards, including after drain. Empty represents local observations, without global quiescence. |

<a id="cleanup-proprietà-e-integrazione"></a>

## Cleanup, ownership, and integration

| Path | Effect and limitation | Available fixture or limitation |
|---|---|---|
| Publish with verified guard | `unwind-protect` releases guard after success, full, or shape/slot error. Entry busy does not acquire it. | Saturation and retry; shape/slot FI with initial/final snapshot including NIL guard; busy publication. |
| Take with verified guard | `%prova-pronta` releases after writer, empty, or extraction error. Busy retains content and permits scanning other shards. | FIFO oracles, shape/payload FI with snapshot, foreign guard, and `reused-workers-live-producers-and-independent-shards`. |
| Acquisition or release failure | A CAS postcondition error requires owner fail-stop; no rollback or cleanup promised after inconsistent internal ownership. | Defensive branches retained in raw denominator. Engine FAULTED controller remains to be integrated. |
| List ownership | Partition vector written only by factory and remains private. Read-only slots/capacity/partitions identity; no global counter. | Types and factory review. |
| Ring ownership | Head/tail/count and slot contents mutated only under own guard; guard uses CAS. | Verified pre/post; `helpers-reject-missing-and-foreign-guard`, busy oracle, and two real-thread tests. |
| Obligation ownership | Caller → ring only on success; ring → worker on pop. Success is not retried. Intentional duplicates are not detected. | `per-shard-fifo-wrap-and-private-opaque-ring`: public test uses legal obligations; only a private isolated-ring fixture inserts two identical opaque references, explicitly outside handoff protocol. |
| Full publication | No payload reinsertion into writer; retained obligation published when a slot becomes free. | `full-preserves-scheduling-obligation`: payloads `:a/:b` processed only once in subsequent segments. |
| Busy begin after dequeue | Worker retains reference and retries begin; no republication of extracted reference. | `dequeued-reference-survives-begin-busy`; ring empty during retry, payload processed once. |
| Producer before end | During running, enqueue returns `:queued`; end with backlog produces a new `:schedule`. | `handoff-before-after-release-and-next-wave`, four waves. |
| Producer after empty end | End returns `:idle`; new enqueue returns `:schedule` and can be published immediately. No late scheduler cleanup on writer. | Same fixture; `reused-workers-live-producers-and-independent-shards`: four threads reused over six waves, 36 payloads with identity/checksum, live producers while worker terminates segment. |
| Concurrent consumers | One guard permits only one reference pop; other consumer observes empty or busy, without duplication. | `competing-consumers-take-one-reference-per-wave`: two threads reused over eight waves, one winner and completion before reuse. |
| Shard choice and cursor | Stable mapping before hot path, maintained by caller; worker-local cursor. No catalog hashing, wakeup, or membership state introduced. | Preregistered contract; pool still must integrate these responsibilities. |

Writer work occurs after releasing the ready list guard. Serialization concerns
only the short update of one ring per segment. A contended guard blocks neither
caller nor other shards; lock-freedom, absence of starvation, global balancing,
or progress if an obligation is abandoned are not promised. There are no
durable changes, I/O, callbacks, product threads, or file deletions in these sources.

<a id="complessità-e-limiti"></a>

## Complexity and bounds

Local counting uses base 1, +1 per scalar predicate, +1 per loop, and number
of alternatives minus 1 for `case`. Callee decisions are inventoried separately,
without hiding them in caller counts. `unwind-protect` is listed as cleanup,
not a conditional decision.

| Function | Local decisions | Independent paths |
|---|---|---|
| `%check-forma-pronta` | 6 `unless` | 7 |
| `%check-pronta` | 1 `unless`, delegated shape check | 2 |
| `%partizione-verificata` | 4 `unless` | 5 |
| `crea-lista-writer-pronti` | 4 `unless`, 1 bounded loop | 6 |
| `%prendi-guard-pronta` | 2 `unless` | 3 |
| `%rilascia-guard-pronta` | 2 `unless` | 3 |
| `%pubblica-pronto` | 1 `when`, 1 `unless` | 3 |
| `%preleva-pronto` | 1 `when`, 1 `unless` | 3 |
| `pubblica-writer-pronto` | 2 `unless`, explicit cleanup and delegates | 3 |
| `%prova-pronta` | 1 `unless`, explicit cleanup and delegate | 2 |
| `preleva-writer-pronto` | 1 loop, `case` with 4 alternatives, 1 `if` | 6 |

No function exceeds COD-13's 10 paths or COD-12's 60 lines.
Factory executes <=64 iterations; a scan executes <=64 acquisition CAS
attempts and one release CAS per successful acquisition: maximum 2K,
therefore 128 CAS operations total. Publication uses one acquisition CAS
and, if successful, one release CAS. Every ring holds <=65536 references;
the overall limit is 4194304 references, beyond preallocated structures.
Head+count is <=131071 after bounds verification; index arithmetic stays
within fixnum. Construction and error-condition allocations are not a
normal-path measurement. The frozen composed campaign records ten zero-heap
samples; limits of that measurement are reported later.

<a id="prima-lettura-indipendente"></a>

## First independent reading

Sources read without modification after the checker's Italian rename:

- `ready-types.lisp`: SHA-256 `75f153547af5b33e024d5f35e19fd15603c890f1f1616a62d02aa50e3309e4b0`.
- `ready.lisp`: SHA-256 `d295574baa35cd540a4176d738d5670b44a741f532c86071d82e7c2361af44b0`.

No functional defect identified in the first reading. Two wording clarifications
were raised: cleanup is installed after verified guard acquisition, not before
its postcondition; absence of allocation concerns the normal path, while
publication full/busy signal conditions. Both were closed only in docstrings;
independent rereading confirms corrected sources:

- `ready-types.lisp`: SHA-256 `0f1ae77ec5fb90ac747e63e82af8dfab19634c05f8876eddce2c1ee874e0dc4f`.
- `ready.lisp`: SHA-256 `a13238ba41ac63575d8ba2beebcfdb3ec4853d9d5ec138b848f2978715fe7327`.

No finding from the first reading remains open. The 17 final tests were
read independently, SHA-256
`4ca29c076e8c7ad6b5f243419bedbfe6f754b5ddb6858a1568cec3e0474f476e`.
Public oracles produce `:schedule` before publication, complete the writer
before reuse, and retain pending after full. The only opaque duplicate
case belongs to the declared private isolated-ring fixture. Threads belong
to the harness: timed semaphores, finite reuse, checked joins, and rethrown
worker errors. The first reading did not attest to coverage, mutants,
allocations, or `make check`; reading frozen evidence is recorded below.

The matrix retains designed requirements: this component does not qualify
the pool, FAULTED controller, park/wakeup protocol, or throughput/P99 targets.
The complete raw denominator, unmarked forms, and defensive branches must
be reported in the final reading; this inventory approves no exclusion.

<a id="copertura-raw-osservata-e-mappatura-delle-lacune"></a>

## Observed raw coverage and gap mapping

Frozen clone `arcdocdb-ready-verify-_dtdm24z` retains native
`spikes/out/ready-coverage/coverage-state.lisp`, HTML, and export
`spikes/out/ready-coverage-export.lisp`. Independent reading with
`*read-eval*` NIL counts native path vectors and bits: paths starting with
`:then` or `:else` are branch outcomes, others expressions. Comparison
with independently recalculated HTML cells matches for all six files.
No form is subtracted from the denominator.

| Execution file | Marked / total expressions | Marked / total outcomes |
|---|---|---|
| `package.lisp` | 0 / 1 | 0 / 0 |
| `queue.lisp` | 142 / 184 | 24 / 34 |
| `writer.lisp` | 190 / 218 | 36 / 44 |
| `handoff.lisp` | 173 / 190 | 16 / 16 |
| `ready-types.lisp` | 170 / 187 | 30 / 30 |
| `ready.lisp` | 173 / 194 | 20 / 22 |
| Total | 848 / 974 | 126 / 146 |

Native paths have reversed indices: the last index identifies the top-level
form; reading indices from right to left descends into subelements.
The following mapping uses source forms without expanding or removing
defaults. Each listed `error` condition occupies four raw expressions:
call, condition designator, `:reason` keyword, and reason.

| New file | All unmarked forms/outcomes | Mapping and limitation |
|---|---|---|
| `ready-types.lisp`, 17 expressions | 8 top-level forms `(0) (1) (2) (3) (6) (8) (10) (12)`; 7 slot forms `(3 4)`..`(8 4)` and `(3 5)`; 2 keyword defaults `(1 2 13) (2 2 13)`. | `in-package`, optimization, two constants, and four `ftype`; slots/capacity/head/tail/count/guard and partitions; shards/capacity defaults. No uncovered operational error or instrumented branch outcome; 30/30 does not mean complete MC/DC. |
| `ready.lisp`, 21 expressions | 9 top-level forms `(0) (1) (2) (4) (6) (8) (10) (12) (14)`; 4 expressions in root error `(2 3 4 3)`; 4 in error `(2 5 5)`; 4 in `otherwise` `(1 5 3 2 2 5 15)`. | `in-package`, optimization, and seven `ftype`; ownership error after acquisition; old CAS value error at release; unexpected defensive scan status. |
| `ready.lisp`, 2 outcomes | `(:else 1 3 4 3)` and `(:else 1 5 5)`. | Guard differs from thread after successful CAS in `%prendi-guard-pronta`; old CAS value differs from thread after precheck in `%rilascia-guard-pronta`. Require ownership protocol failure; not induced by altering a shared guard during concurrent testing. No exclusion approved. |

New FI covers shape and payload rejections, absent/foreign ownership before
release, and cleanup with acquired guard. This does not automatically close
previous primitive gaps: unchanged queue/writer/handoff sources, unchanged
raw counts.

| Previous file | All unmarked forms | All unmarked outcomes |
|---|---|---|
| `package.lisp` | One form `(0)`, `defpackage` with exports. | No instrumented outcome. |
| `queue.lisp`, 42 expressions | 22 definitions/defaults: top-level `(0) (1) (2) (3) (5) (7) (9) (11) (13) (15)`, ten slots `(3 4)`..`(12 4)`, keywords `(1 2 12) (2 2 12)`. Twenty expressions in five errors: shape and FIFO relation, post-acquisition ownership, ownership before release, and release CAS; roots `(2 2 4 6) (2 3 4 6) (2 3 4 8) (2 4 10) (2 5 10)`. New handoff helper `%accoda-sotto-guard` has no missing outcomes. | Ten: both guard type-union outcomes `(:then 3 9 4)`/`(:else 3 9 4)`; false for capacity `(:else 1 1 2 4 6)`, length `(:else 2 1 2 4 6)`, head `(:else 3 1 2 4 6)`, compound shape predicate `(:else 1 2 4 6)` and relation `(:else 1 3 4 6)`; post-acquisition ownership `(:else 1 3 4 8)`, ownership before release `(:else 1 4 10)`, old CAS value `(:else 1 5 10)`. |
| `writer.lisp`, 28 expressions | Eight definitions `(0) (1) (2) (4) (6) (8) (10) (12)`; twenty expressions in five errors: lease quota, owner release ownership and CAS, acquisition and extraction postconditions; roots `(2 5 3) (2 4 5) (2 5 5) (2 1 1 3 4 7) (2 6 2 1 2 4 3 5 11)`. | Eight: quantum range `(:else 1 1 5 3)` and compound quota `(:else 1 5 3)`; owner ownership `(:else 1 4 5)` and owner CAS `(:else 1 5 5)`; acquired ownership `(:else 1 1 1 1 3 4 7)` and compound postcondition `(:else 1 1 1 3 4 7)`; taken <= remaining `(:else 1 1 6 2 1 2 4 3 5 11)` and compound extraction postcondition `(:else 1 6 2 1 2 4 3 5 11)`. |
| `handoff.lisp`, 17 expressions | Nine top-level forms `(0) (1) (3) (5) (7) (9) (11) (13) (15)`, two slots `(3 2) (4 2)`, two keyword defaults `(1 2 8) (2 2 8)`, four expressions in state `otherwise` error, root `(1 5 4 4 6)`. | No uncovered instrumented outcome: 16/16. Defaults and `otherwise` remain in raw expressions; no inference of complete MC/DC. |

<a id="evidenze-congelate-iniziali-lette-base-92d8b0e"></a>

## Initial frozen evidence read, base 92d8b0e

Command reports were read through `arcdocdb.evidence:read-evidence`, even
when the outer file is a compressed descriptor. The reader verifies the
payload and keeps `*read-eval*` NIL; no report is executed as code.

- Build/test `4000520747-command-93257-0`: `:ok`, `:stable` sources, exit 0,
  empty stderr; 237 tests in seven modules, beyond smoke, with 51 execution.
  Compilation without warning/style-warning under strict runner.
- Coverage `4000520828-command-97914-0` and export
  `4000520903-command-1709-0`: `:ok/:stable`, exit 0; export self-test passed.
  Independent counts and HTML match as above.
- Strict C4 self-tests `4000520791-command-94820-0` (mutations) and
  `4000520791-command-94821-0` (bench): `:ok/:stable`, exit 0; complete
  COMPILE-FILE and FASL self-test, not only source loading.
- Mutations `4000520822-command-96904-0` and data `ready-mutations/report.lisp`:
  complete baseline with 51 start/ok events and `execution-tests-complete 51`;
  12/12 mutants detected, zero survivors, compilation-failures, and before-tests.
  All 13 logs read: each mutant started a ready test before failure, without
  compiler diagnostics. Twelve targets remain FIFO, head/tail wrap, full,
  count, freed reference, released guard, busy memory, busy skip, last shard,
  and both cursor advances.
- Bench `4000520933-command-3549-0` and data `ready-allocations/report.lisp`:
  `:ok/:stable`, exit 0; two serial composed handoff/list scenarios, K=1 and
  K=4, capacity 3 and two writers per shard. Five 4096-cycle samples per scenario,
  warmup 128 and GC before counter, zero heap in all ten samples. Exact sinks
  9246720 and 12797952, independent tokens 210 and 1077. Positive control
  16777472 bytes; wrong sink rejected, zero clock distinguished, partial report
  and preexisting destination retained. No universal proof of nonallocation,
  contention, scalability, throughput, P99, or adaptive pool.

This initial evidence belongs to base `92d8b0e`, ASDF SHA-256
`53a8a44f493e341b30da22abcb6e201f48c129142c44287af7fb67f323ba51a3`,
ready mutation runner SHA-256
`e22f1e32f1c4dd98ebe84af818145c22fb8b4c386f3bf04bc235edc7a7257829`.
It is retained as targeted component tests, without retroactive attribution
to subsequent integration.

At initial reading, final integrated `make check` verification was still
pending. Independent reading probes and their corrections are retained in
the clone in `spikes/out/ready-review-probes.lisp`: initial reader lacked
ASDF/UIOP preload; an incorrect baseline path and initial event selection
were corrected. These probes are not campaigns and are not attributed to
the product or C4 tools. Their commands and tool outputs are retained
without inferring absent metadata.

<a id="integrazione-successiva-e-classificatore-c4"></a>

## Subsequent integration and C4 classifier

Main `fd96fb3145f593f31552de26a8fd93478b69fc8f` integrates recovery manifest
and a handoff mutation runner correction. Independent worktree and clone
verification confirms the same hashes for execution package, queue, writer,
handoff, ready-types, ready, ready test, and bench. Only ASDF among these
files changes, SHA-256
`4fc264ec2638b5d3b778890405942fadb3857180ab7c3818d8377e6a2f50e458`:
execution and ready registrations retained alongside new manifest components.
This is not a new C1 reading of manifest code.

The new ready runner had inherited the previous classifier: a process
signaled by the OS or a nonzero exit after the completion event must not
be counted as a detected mutant. A separate `:worker-error` outcome is
required, with signal and counter retained. Initial classification remains
historical: its thirteen logs were read and twelve failures occur after
ready test start and before completion, but signal metadata were not
recorded and are not inferred as NIL.

At the first integration reading, ready classifier correction, strict
self-test, and the new campaign on the integrated base were pending.
The initial independent report remains retained in the clone in
`spikes/out/ready-independent-review.lisp`; subsequent closure must be a
separate appendix, without rewriting historical reading or results.
C4 closure and both subsequent integrated checks are attested below,
without rewriting previous reports.

<a id="chiusura-del-classificatore-e-dellintegrazione"></a>

## Classifier and integration closure

Independent reading of final runner SHA-256
`06c326c4211e4a691d817a031db35795c68291fa639e0304fa542aad689b58bb`
confirms OS signal precedence, rejection of nonzero exit after authentic
completion, and distinct exit/signal retention. Markers quoted or prefixed
in a backtrace are not authentic events. Baseline and mutants report
signals; `worker-errors` counter is separate from detection and the final
gate requires all twelve `detected`.

Final strict run `4000521809-command-41045-0` is `:ok/:stable`, exit 0,
empty stderr: contrib preload, whole COMPILE-FILE without warning/failure,
and FASL self-test with explicit argv. Original fixture data read from
`4000521810-ready-signal-self-test-41080`: runner emits start and flush,
then SIGKILL; corresponding log; report `:passed/:stable`, exit 137, signal 9,
`:worker-error`, zero detected and one worker-error. Pending baseline belongs
only to the signal fixture and does not represent a failed campaign.

Final campaign `4000521918-command-45102-0`, base `fd96fb3`, is
`:ok/:stable`, exit 0. Data `ready-mutations-final/report.lisp` SHA-256
`c1db98e2b8538444381254f0fc79cf3ebc1fdfa4ffc2445f101d6ccb49ac6d87`:
baseline completed with 51 tests, exit 0/signal NIL; twelve detected mutants,
each exit 1/signal NIL; zero survivors, compilation-failures, before-tests,
and worker-errors. All thirteen logs independently read: baseline with
51 start/ok and completion 51; mutant failures after a ready test start
and before completion, without compiler failure. Recorded probe
`4000522063-command-47453-0` confirms thirteen-log integrity and counts,
`:ok/:stable`, exit 0. Inherited C4 finding is closed; initial tests remain
attributed to their runner version.

First integrated check, base `fd96fb3`, is
`4000521907-command-44843-0`, `:ok/:stable`, exit 0, wall 96.821713 s:
257 tests in seven modules beyond smoke, lint 48 files/zero violations,
trace 114 REQ/65 INV/13 FI/52 ADR/zero errors, links 187 files/1880 links/zero
broken. Master `4000521968-check-46180-0` contains ten runs and ten artifacts:
SPK-01..10 all exit 0 and `:stable` sources; nine `:ok`, SPK-07 `:pass`, with
matching normalized internal statuses. It is retained as first local
integration, without attribution to subsequent main.

Subsequent main `201562dffd8c48e5d2047f73ef905f64b447e663` integrates
CBOR headers. Final ASDF SHA-256
`3bc16fe72222b2adfcad7d7fe862a3f8a05d3ae8fa395f0deeabc6e22290edde`;
ready-types, ready, test, benchmark, and runner remain byte-identical,
and execution/ready registrations are retained alongside codec and manifest.
Initial targeted campaigns and the new mutation campaign are not retroactively
attributed to the new environment; identical sources and subsequent integrated
check retain their respective provenance. This is not a new C1 reading of
CBOR or manifest sources.

Final check `4000522514-command-56618-0` is `:ok/:stable`, exit 0,
wall 102.063356 s. Makefile records `make check` through internal command
`check-core`. Counts read in report: 274 tests in eight modules
(26+17 UTF-8+17 CBOR+51 execution+44 storage+18 I/O+82 recovery+19 WAL), beyond
smoke; lint 50 files/zero violations; trace 114 REQ/65 INV/13 FI/52 ADR,
zero errors; links 193 files/1899 links, zero broken. Stderr contains
compiler notes and spike progress; no actual warning/style-warning.
Expected synthetic failures in evidence self-tests remain expected data.

Final master `4000522582-check-59441-0`, read through the evidence reader,
is `:complete`, mode `--check`, ten runs and ten artifacts. All SPK-01..10
are exit 0/`:stable`; nine `:ok` statuses, SPK-07 `:pass`, and normalized
internal result statuses match. Raw metadata: SBCL 2.6.9, Darwin 27.0.0,
ARM64 Apple M4, 17179869184 bytes RAM, ten logical CPUs, dynamic-space
4096 MiB, external load `:uncontrolled`, load-average `{ 3.89 3.37 3.63 }`,
commit `201562dffd8c48e5d2047f73ef905f64b447e663`, date-universal-time
4000522586. Check time and environment are not throughput/P99 or scalability
results.

Independent reading of the twelve points is closed for this component,
without open functional findings: both initial wording findings and the
C4 finding are closed. Historical verbatim report and subsequent appendices
are retained in the clone in `spikes/out/ready-main-independent-review.lisp`;
new read-only probes in `spikes/out/ready-main-review-probes.lisp`.
All denominators and raw gaps mapped above remain, without approved
exclusions or inferred MC/DC. Pool, park/wakeups, shutdown, FAULTED
controller, and integrated engine targets are not qualified by these data.

Definitive local closure follows main
`33aa2244ca8e1920fcb0d72bbdf8651f9a3c0691`, which also registers the CSN module.
ASDF SHA-256 `6589f8ca1eea521c5bb57f9ee42a44fbedbe70fe6ef5524199eab67216a6b3cc`;
execution/ready sources, tests, and both ready tools remain byte-identical
to previous readings. Ready ASDF registrations are retained. The fd96 and
201562 checks above remain historical evidence of their integrations;
targeted campaigns retain their provenance.

Read with `evidence:read-evidence`, new record
`4000522904-command-41347-0` is `:ok/:stable`, exit 0, wall 109.725672 s:
294 tests in nine modules (26+17 UTF-8+17 CBOR+20 CSN+51 execution+44 storage+
18 I/O+82 recovery+19 WAL), beyond smoke; lint 52 files/zero violations;
trace 114 REQ/65 INV/13 FI/52 ADR/zero errors; links 198 files/1918 links/zero
broken. No actual warning or style-warning line in stderr.

Master `4000522979-check-41982-0` is `:complete`, mode `--check`, ten runs
and ten artifacts; SPK-01..10 exit 0/`:stable`, nine `:ok` and SPK-07 `:pass`,
with matching internal statuses. Raw metadata: SBCL 2.6.9, Darwin 27.0.0,
ARM64 Apple M4, RAM 17179869184 bytes, ten logical CPUs, dynamic-space
4096 MiB, external load `:uncontrolled`, load-average `{ 2.10 2.88 3.34 }`,
commit `33aa2244ca8e1920fcb0d72bbdf8651f9a3c0691`, date-universal-time
4000522983. Local C1 closure without open ready findings is confirmed;
the reading qualifies neither CSN sources nor pool or integrated engine.
Original report and fd96/201562/33 appendices remain retained verbatim;
no raw denominator reduction or MC/DC exclusion is approved.
