<a id="decisioni-del-ricircolo-dei-writer-pronti"></a>

# Ready writer recycling decisions

C1 inventory of [`ready-recycle.lisp`](../../src/execution/ready-recycle.lisp),
under the [preregistered method](writer-recycle-metodo.md). References:
REQ-CON-001/002/004/005, REQ-AFF-008; INV-P1/P2/P5/P6, INV-A8, INV-V4;
[ADR-0005](../adr/0005-writer-logico-per-serie.md) and
[ADR-0045 §§6/8](../adr/0045-modello-di-esecuzione.md).

Recycling receives a unique caller-owned `:schedule` obligation and transfers
it to the ring. With space, it returns NIL/`:published`; with a full ring,
it simultaneously transfers the old head to the caller and the new reference
to the ring, returning head/`:writer`. Busy retains the original obligation.
The component does not read writer state and adds no membership, threads,
waits, callbacks, I/O, or global state.

<a id="decisioni-scalari-e-prepostcondizioni"></a>

## Scalar decisions and pre/postconditions

The new source has no compound `and`/`or` decisions in `if`, `when`,
`unless`, or `cond`. The `or` in return types is a type union, not a
COD-54 compound decision. The inventory does not infer MC/DC from branch
coverage or mere absence of new compound predicates.

The following suffixes refer to `test-REQ-…-recycle-…` tests in
[`tests/execution/ready-recycle.lisp`](../../tests/execution/ready-recycle.lisp).
They describe fixtures read; they do not yet attest to execution.

| Point | Condition or obligation | Fixture read and limitation |
|---|---|---|
| `%scambia-pronto`: pre/post | `%check-pronta` checks guard ownership and ring shape before and after writes. | `helper-rejects-missing-and-foreign-guard`; shape FI; FIFO and wrap oracles. Checker branches belong to previous ready inventory. |
| `%scambia-pronto`: full | Count equal to capacity; otherwise `invariant-violation :ready-recycle-full` before writes. | `malformed-full-head-and-free-tail-pre-mutation`: full helper called on empty ring with owned guard; snapshot preserved. |
| `%scambia-pronto`: head type | Head reference must be `writer-programmabile`; otherwise `:ready-queue-invariant`, before writes. | Same fixture: full with NIL or keyword head; ring and incoming writer preserved. No scan of untouched payloads. |
| `%scambia-pronto`: FIFO | In full, verified relation `tail = (head + count) mod capacity` implies head=tail. That slot is replaced and both indices advance by one; count unchanged. | `capacity-one-transfers-old-and-keeps-new`, `full-wrap-preserves-independent-list-order`, seeded oracle. `[C,B,…,Z]` becomes `[B,…,Z,A]`; capacity 1 is `[C]`→`[A]`. |
| `%scambia-pronto`: returns | Verified old head, `:writer`, capacity. A belongs to ring; C to caller. | Identity/count/status in oracles; `returned-obligation-survives-begin-busy` retains C without republishing A. |
| `%ricircola-pronto`: choice | Count equal to capacity selects exchange; lower count selects `%pubblica-pronto`. Verified shape excludes higher count. | Full and room, capacity 1/2/3/9, exact boundary and wrap. |
| `%ricircola-pronto`: post | Postconditions checked by `%scambia-pronto` or `%pubblica-pronto`; room returns NIL/`:published` and new count. | `room-publishes-and-preserves-fifo`; for room, free tail checked by previous helper. |
| API: partition | `%partizione-verificata` precedes guard and writes; checks index, cardinality, and private reference. | `shard-writer-preflight-before-held-guard`, `private-ring-and-partition-shapes-pre-mutation`; invalid inputs rejected even with busy guard. |
| API: incoming type | Writer of type `writer-programmabile`; otherwise `invalid-argument :ready-writer` before guard. | Preflight: NIL, keyword, vector, and low-level queue; snapshot preserved. Object not queried for eligibility. |
| API: busy CAS | NIL acquisition causes `resource-exhausted :ready-queue-busy`, before mutation; no retry. | `busy-retains-obligation-and-both-ring-shapes`: full and room, same obligation retained and subsequent unique transfer. |
| API: cleanup | `unwind-protect` releases only guard after verified acquisition; errors not hidden. | Successes, rejections, and FI; subsequent republication/drain verify free guard. Defensive CAS branches remain in previous ready coverage. |
| Unique obligations | A is caller-owned obligation; C belongs to ring before exchange. Under legal protocol C≠A. | Public oracles with `:schedule`, completion before reuse; `private-opaque-duplicate-is-outside-handoff-protocol` is private FI only, without deduplication qualification. |
| Full consumers | All consumers may hold an obligation while ring is full. Recycling delivers a head without preliminary external dequeue. | `all-consumers-reschedule-after-producer-refills-full` retains counterexample to publication alone; then two rotations and drain of remaining payloads. |
| Handoff/new wave | No scheduler cleanup on writer after end; new wave obligation is not canceled. | `handoff-before-release-and-new-wave-without-cleanup`: enqueue before end and new wave after idle. |
| Concurrency | Producer, consumer, and recycling access ring under same guard; no guard between shards. | Two consumers and one producer reused; `other-shard-progresses-while-first-guard-is-held`. Fixtures read, outcomes still to record. |

<a id="limiti-della-prova"></a>

## Test limits

Exchange removes blocking caused by capacity alone in the modeled protocol.
It does not guarantee progress if the guard remains contended, the caller
abandons the obligation, or the writer is faulted. A full chain can keep
serving the same shard and leave new producers pending: global fairness
and admission require a controller. `:empty` remains a sequence of local
observations, without authorizing parking or shutdown.

There are no loops in the new source: O(1) cost, one acquisition and one
release CAS. Transitive list/shape checks are bounded and do not scan the
entire ring. Invariants are signaled to the owner, who must apply fail-stop;
the module does not yet implement Serie FAULTED. No persistent change or
durable atomicity point.

<a id="prima-lettura-indipendente-c1"></a>

## First independent C1 reading

Base `673987ad819dd48741a7c0a4ff259137a1ed0bef`. Initial source read
SHA-256 `51ddbf06d1639427317ac25d00140ec2020be14b315ed364fd1ae425ebed145c`;
test read SHA-256
`c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae`.
The first source line contained typo `publica`, which the change owner
will correct. No functional defect found in the first reading; this is
not a compilation, test, or coverage outcome. The complete twelve-point
report is retained as UTF-8 data in `spikes/out/recycle-c1-initial.lisp`,
without changing product sources.

Requirements and ADRs are consistent with the three functions. Head type,
guard/shape, FIFO exchange, and obligation retention have dedicated fixtures.
Complete ftypes, safety 3, functions below 60 lines, owners, and per-segment
access are declared. Conditions remain typed and cleanup does not hide
failures. Allocation measurement, test execution, raw coverage, mutants,
traceability, and `make check` are still pending.

<a id="denominatori-execution-precedenti-e-campagna-da-leggere"></a>

## Previous execution denominators and campaign to read

The six previous files remain in the scope of future raw coverage,
together with `ready-recycle.lisp`. The previous ready campaign reported
the following denominators; these are historical data, not results attributed
to the new campaign. Future export must retain native data, HTML, and all
missing paths, verifying counts again.

| Previous execution file | Historical marked / total expressions | Historical marked / total outcomes |
|---|---|---|
| `package.lisp` | 0 / 1 | 0 / 0 |
| `queue.lisp` | 142 / 184 | 24 / 34 |
| `writer.lisp` | 190 / 218 | 36 / 44 |
| `handoff.lisp` | 173 / 190 | 16 / 16 |
| `ready-types.lisp` | 170 / 187 | 30 / 30 |
| `ready.lisp` | 173 / 194 | 20 / 22 |
| Previous total | 848 / 974 | 126 / 146 |

Previous uncovered forms and branches are fully mapped in the
[ready inventory](writer-ready-decisioni.md#copertura-raw-osservata-e-mappatura-delle-lacune).
They are not subtracted from the recycling denominator. New counts and
mapping await frozen data. No approved exclusion, requirement promotion,
or inference of complete MC/DC.

<a id="copertura-raw-della-copia-congelata"></a>

## Raw coverage of the frozen copy

Copy `arcdocdb-recycle-verify-7meus4m5`, base `673987a`, retains native data,
HTML, and export. Independent probe `4000528971-command-81260-0` recalculates
native path vectors and bits with `*read-eval*` NIL and separately compares
HTML cells through `HTMLParser`: all seven files match. No form is
subtracted. Process is `:ok/:stable`, exit 0.

| Execution file | Marked / total expressions | Marked / total outcomes |
|---|---|---|
| `package.lisp` | 0 / 1 | 0 / 0 |
| `queue.lisp` | 142 / 184 | 24 / 34 |
| `writer.lisp` | 190 / 218 | 36 / 44 |
| `handoff.lisp` | 173 / 190 | 16 / 16 |
| `ready-types.lisp` | 170 / 187 | 30 / 30 |
| `ready.lisp` | 173 / 194 | 20 / 22 |
| `ready-recycle.lisp` | 81 / 86 | 8 / 8 |
| Total | 929 / 1060 | 134 / 154 |

Native data retains all paths. Indices are reversed: the last identifies
the top-level form; reading right to left descends into subelements.
Every root error listed below contains four raw forms: call, designator,
`:reason` keyword, and reason. Following roots and definition/default forms
map all 131 unmarked expressions.

| File | All unmarked forms and mapping |
|---|---|
| `package.lisp`, 1 | `(0)`: `defpackage`, including new export. |
| `queue.lisp`, 42 | 22 definitions/defaults: top-level `(0) (1) (2) (3) (5) (7) (9) (11) (13) (15)`; ten slots `(3 4)`..`(12 4)`; keywords `(1 2 12) (2 2 12)`. Twenty forms in five root errors `(2 2 4 6) (2 3 4 6) (2 3 4 8) (2 4 10) (2 5 10)`: shape/FIFO, ownership after acquisition, release ownership and CAS. |
| `writer.lisp`, 28 | Eight top-level `(0) (1) (2) (4) (6) (8) (10) (12)`. Twenty forms in root errors `(2 5 3) (2 4 5) (2 5 5) (2 1 1 3 4 7) (2 6 2 1 2 4 3 5 11)`: lease quota, owner ownership/CAS, acquisition ownership, and extraction postcondition. |
| `handoff.lisp`, 17 | Nine top-level `(0) (1) (3) (5) (7) (9) (11) (13) (15)`; two slots `(3 2) (4 2)`; two defaults `(1 2 8) (2 2 8)`. Four forms in state `otherwise` error, root `(1 5 4 4 6)`. |
| `ready-types.lisp`, 17 | Eight top-level `(0) (1) (2) (3) (6) (8) (10) (12)`; seven slots `(3 4)`..`(8 4)` and `(3 5)`; two factory defaults `(1 2 13) (2 2 13)`: definitions, slots/capacity/head/tail/count/guard/partitions, shards/capacity defaults. |
| `ready.lisp`, 21 | Nine top-level `(0) (1) (2) (4) (6) (8) (10) (12) (14)`. Twelve forms in three root errors `(2 3 4 3) (2 5 5) (1 5 3 2 2 5 15)`: ownership after acquisition, old release CAS value, unexpected defensive scan state. |
| `ready-recycle.lisp`, 5 | Only top-level `(0) (1) (2) (4) (6)`: `in-package`, optimization, and three `ftype`. No missing operational form in native data; definitions remain in denominator. |

All twenty unmarked instrumented outcomes belong to previous files:

| File | All unmarked outcome paths |
|---|---|
| `queue.lisp`, 10 | `(:then 3 9 4)`, `(:else 3 9 4)`, `(:else 3 1 2 4 6)`, `(:else 2 1 2 4 6)`, `(:else 1 1 2 4 6)`, `(:else 1 2 4 6)`, `(:else 1 3 4 6)`, `(:else 1 3 4 8)`, `(:else 1 4 10)`, `(:else 1 5 10)`: guard type union, bounds/shape/FIFO, ownership, and CAS. |
| `writer.lisp`, 8 | `(:else 1 1 5 3)`, `(:else 1 5 3)`, `(:else 1 4 5)`, `(:else 1 5 5)`, `(:else 1 1 1 1 3 4 7)`, `(:else 1 1 1 3 4 7)`, `(:else 1 1 6 2 1 2 4 3 5 11)`, `(:else 1 6 2 1 2 4 3 5 11)`: quota, owner ownership/CAS, acquisition and extraction pre/post. |
| `ready.lisp`, 2 | `(:else 1 3 4 3)` and `(:else 1 5 5)`: ownership after successful CAS and old release CAS value after precheck. Not induced by altering shared guard during concurrent tests. |
| Other four files | No unmarked instrumented outcome. This does not qualify MC/DC or all source checks. |

Coverage `4000528494-command-77200-0` and export with self-test
`4000528526-command-77598-0` are `:ok/:stable`, exit 0. First independent
probe `4000528942-command-81018-0` failed because native data, which is
not a plist, had been passed to the evidence reader. The first adapter
version and failure are retained; corrected probe reads native data
directly with `*read-eval*` NIL. This is not a product, export, or C4
failure and does not replace the coverage campaign.

<a id="seconda-lettura-indipendente-c1"></a>

## Second independent C1 reading

Final source SHA-256
`2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b`;
unchanged test `c1ec12ce11df80b7679f00eed72a2a6ae3b97999eef5b20f08627a949549fbae`.
The only correction from first reading is `publica`→`pubblica` in the
initial comment. Complete independent twelve-point report:
`spikes/out/recycle-c1-final.lisp`. No open functional finding.

Records read through `evidence:read-evidence`, with compressed payloads
validated. Strict C4 runs `4000528528-command-77652-0` and
`4000528528-command-77653-0` are `:ok/:stable`, exit 0: whole COMPILE-FILE
and FASL self-tests. SIGKILL fixture
`4000528529-recycle-signal-self-test-77690` reports exit 137, signal 9,
one worker-error and zero detected; pending baseline concerns only fixture.

Mutations `4000528603-command-78553-0`, data `recycle-mutations/report.lisp`:
complete baseline with 66 start/ok and completion 66; 11/11 detected,
zero survived/compilation-failures/before-tests/worker-errors. All twelve
logs read: failures occur after a recycle test start and before completion,
each exit 1/signal NIL; baseline exit 0/signal NIL.

Benchmark `4000528603-command-78552-0`, data
`recycle-allocations/report.lisp`: four configurations K=1/4 and C=1/3,
five 4096-cycle samples each; all twenty report zero heap. Tokens and
sinks independently recalculated: 257/9439232, 558/10672128, 1223/13395968,
3231/21620736, in order (1,1)/(1,3)/(4,1)/(4,3). Positive control 16777472
bytes, wrong sink rejected; zero clock, partial report, and preexisting
destination remain distinct controls. No universal proof of nonallocation,
speedup, throughput, or P99.

Check `4000528494-command-77199-0`, `:ok/:stable`, exit 0,
wall 107.748252 s, reports 309 tests in nine modules beyond smoke:
26+17 UTF-8+17 CBOR+20 CSN+66 execution+44 storage+18 I/O+82 recovery+19 WAL.
Lint 53 files/zero violations; trace 114 REQ/65 INV/13 FI/52 ADR/zero errors;
links 199 files/1921 links/zero broken. No actual warning/style-warning
line detected. Master `4000528568-check-78100-0` is complete with ten runs
and ten artifacts: all exit 0/stable, nine `:ok` and SPK-07 `:pass`.
Expected repository self-test failures remain expected data.

This closure concerns local recycling on the frozen base. It does not
qualify other components read only for integration, the complete pool,
wake/park, shutdown, admission, or FAULTED controller. All denominators
and raw gaps remain visible, without approved exclusions, requirement
promotions, or inferred MC/DC.
