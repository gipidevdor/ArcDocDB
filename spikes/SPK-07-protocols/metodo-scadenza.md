<a id="spk-07--metodo-preregistrato-scadenza-reader-ed-epoche"></a>

# SPK-07 — Preregistered method: expiration, readers, and epochs

Method registered on 2026-10-08 before implementation and execution.
Scope: only `scadenza.lisp`, this method, and new exclusive artifacts in
`spikes/SPK-07-protocols/out/`. Common Lisp/SBCL, `safety 3`, no engine,
benchmark, decision changes, or Git operations.

<a id="fonti-e-interpretazione"></a>

## Sources and interpretation

References read: ADR-0033 §§8–9 (defined errors, controlled limits), ADR-0038
§§3–4 (registration, threshold, waiting for `H >= s`, checking after lookup),
ADR-0020 (maximum duration and `snapshot-too-old`), ADR-0016 (EBR), architecture
§§Reclamation/Snapshots and MVCC, `06-mvcc-e-snapshot.md`, INV-M1/M2/M4, and INV-R1.
Only the meaning of H is used: the old ring in ADR-0038 §2 has already been
superseded by ADR-0046, as the architecture and ADR-0038 header indicate.

The snapshot pin represents CSN registration, rather than a direct segment
pointer. Expiration, pin removal, pruning, retirement, and deletion are separate
steps. A reader that has entered publishes its epoch and retains it until exit,
even if the snapshot expires in the meantime. The response is validated after
lookup: a read already in progress may access protected bytes, but returns
`snapshot-too-old` if the snapshot has expired at validation.
Validation and fixing the response are a single abstract step.

<a id="modelli-finiti-e-oracoli"></a>

## Finite models and oracles

1. **Registration:** one document, immutable versions 0/1, a writer with separate
   CSN assignment, threshold read, publication, and H advancement; a snapshot
   with a conservative `min(soglia,H)` announcement, separate acquisition of s
   and creation; two reads. Interleavings include the threshold sampled before
   the announcement. The expected value follows from the snapshot CSN and the
   fixed logical history, independently of retained locations. Creation and
   the first read require H >= s; both reads must return the expected value.
2. **Lifetime:** a reachable initial state with snapshot S0 at s=0, S1 at s=1,
   H=1, current version 1, and retained version 0. One further atomic publication
   advances to CSN/H=2. Two immutable external resources (versions 0/1), three
   read attempts (two by S0, one by S1), two samples per read, global epoch 0..2,
   at most two retirements and two reclamations. Each read separates admission/
   epoch publication, location lookup, two accesses, response validation, and
   epoch release. A lookup after pruning may fail only for a snapshot that has
   already expired, returning `snapshot-too-old`.

Global ticks 0..2; S0 is eligible for expiration at tick 1 and S1 at tick 2.
These provide only an abstract ordering for enumerating races: they model
neither a clock, actual lease duration, nor a guarantee in seconds. The
expiration event is the abstract invalidation point. No timing guarantee is
inferred from a tick.

Oracles: unchanged view for every admitted access; no access to deleted bytes;
no admission on an expired snapshot; a positive response only when active at
the validation point; threshold recomputed as the minimum remaining pin after
every removal; reclamation only without logical references and after all epochs
<= the retirement epoch. Epoch comparison is strict (`reader > r`).

The check requires a path from **every** reachable lifetime state to the
terminal state (publication, final ticks, expirations, pin releases, completion
or rejection of all readers, pruning, retirement, and reclamation). It uses
reverse reachability over the complete graph; observing a single terminal
state is insufficient. This proves only drainability under abstract scheduling
that executes enabled steps, with no progress guarantee for a scheduler that
does not execute them.

<a id="controlli-negativi-e-witness"></a>

## Negative checks and witnesses

Required mutants: `:expiry-ignores-readers` deletes a resource after expiration
while ignoring active epochs; `:admit-after-expiry` admits new readers;
`:no-threshold-recount` leaves the old threshold after removing the minimum pin.
The last is a recount and over-retention error, rather than byte loss: its
witness must show remaining pins, expected threshold, and actual threshold.
Additional checks: omitted threshold announcement during registration and early
creation before H. Each mutant must produce the specific expected violation
and a nonempty path, replayed with before/after states; a generic counterexample
is insufficient.

Positive results also require coverage witnesses: writer sampling the threshold
before/after announcement, repeated reads of the same snapshot, an active
snapshot preventing pruning, access in progress after expiration and pin release,
rejection of new access, an expired response after lookup, reclamation of an old
resource while a newer reader remains active, and a terminal state. Counts are
measured from the graph.

<a id="esecuzione-e-registrazione"></a>

## Execution and recording

`CHECK`, exported by `arcdocdb.spk07.scadenza`, returns a plist with
`:status :ok`, positive reports, negative checks, witnesses, counts, and
assumptions. It uses the existing core's explorer and `require-outcome`, loaded
before the module, adding an exact comparison with the expected violation.
Initial limit: 500,000 states per exploration; exhausting the limit is a failure.
During integration the limit is reduced to 200,000; the observed graph remains
67,507 states. The new blob is verified in the integrated campaign.

Every compilation/check attempt has a new schema 1 record readable as data with
`*read-eval* nil`, in `out/scadenza-attempt-NNN.sexp`.
The record preserves argv, cwd, and exact stdin; SBCL/OS/machine environment;
complete source contents (blobs without Git); `compile-file` results;
warning/style-warning counts; recorded result or condition; limits; and raw
stdout/stderr. A Common Lisp-only harness, supplied through stdin and retained
in the record, compiles core and module into new FASLs in `out/`, checks all
values from `compile-file`, loads the core before the module, and invokes one
CHECK. Warnings and style-warnings are fatal during loading/checking as well.
The harness boundary records conditions and failure status, then exits nonzero.

<a id="tentativi-locali"></a>

## Local attempts

Attempt 001 failed compilation because of an extra closing parenthesis in
`run-model`; the core was compiled/loaded, CHECK was not run, and there were
zero warnings and style-warnings. Record `out/scadenza-attempt-001.sexp`
preserves the error and blobs preceding the fix. Before the next attempt, the
parenthesis is fixed and race coverage is tied to the actual transition: an
access after expiration and pin removal, and reclamation while the newer reader
is already active. Every reclamation in the positive graph is also checked
against references and epochs independently of the transition guard.

Attempt 002 compiled both files without warnings/style-warnings and completed
CHECK with `:status :ok`: registration 51 states/69 edges; lifetime 67,507
states/256,902 edges, 128 terminal states, and every state drainable; the five
mutants produced the specific expected violations. Record 002 contains all
witnesses, but the coverage counter is wrong (2 instead of 12), because it was
computed after an `nreverse` without retaining the new head. Before attempt 003,
the counter is fixed and two further witnesses are required: rejection of a
new read after reclamation has already occurred, and a read admitted before
expiration that finds a pruned location and returns `snapshot-too-old`.
These changes do not extend the state graph.

<a id="esito-finale--tentativo-003"></a>

### Final outcome — attempt 003

Strict compilation and loading of core and module succeeded, `warnings-p` and
`failure-p` both NIL, warning/style-warning counts both zero. One CHECK call,
`:status :ok`. Final record `out/scadenza-attempt-003.sexp`, reread as data with
`*read-eval* nil` and compared in full with the saved plist; raw stderr empty.

| Correct model | Distinct states | Edges | Coverage witnesses |
| --- | ---: | ---: | ---: |
| Registration | 51 | 69 | 3 |
| Lifetime | 67,507 | 256,902 | 11 |
| Total | 67,558 | 256,971 | 14 |

Lifetime: 128 terminal states; all 67,507 reachable states have a path to a
terminal state. Independently checked 3,430 reclamation edges; in 29,440 states,
at least one retirement remains blocked by a reader epoch <= the retirement
epoch. All 14 positive and 5 negative witnesses are replayed from pure
transitions; the record preserves actions and complete before/after states.

| Mutant | States discovered up to the counterexample | Edges generated | Specific violation |
| --- | ---: | ---: | --- |
| expiration ignores readers | 5,291 | 16,154 | access after reclamation |
| admission after expiration | 108 | 192 | admission on an expired snapshot |
| recount omitted | 104 | 186 | actual threshold 0, remaining minimum 1 |
| threshold announcement omitted | 35 | 49 | s=0 expects value 100, location absent |
| creation before H | 28 | 33 | s=1 created with H=0 |

Negative counts are BFS prefixes stopped at the first violation, rather than
exhaustive mutant graphs. The first mutant's witness shows reader 0 with epoch
0, expiration of S0, pin release, pruning of version 0, retirement at epoch 0,
reclamation ignoring that slot, and access to the deleted data. The third shows
that, after S0 is removed, S1 retains a pin at 1 but the threshold stays at 0:
a recount/over-retention error, without claiming byte loss.

Delivered files: `scadenza.lisp` and `metodo-scadenza.md`. New local files in
`out/`: records `scadenza-attempt-001.sexp`, `-002.sexp`, `-003.sexp`; FASLs
`scadenza-attempt-001-core.fasl`, `-002-core.fasl`, `-002-scadenza.fasl`,
`-003-core.fasl`, `-003-scadenza.fasl`. Failed attempt 001 and the incorrect
counter in attempt 002 remain in the evidence, without overwriting.
The method blob in record 003 precedes this results annotation; the module blob
is the final compiled version. The gate remains open: this result covers
expiration/reclamation in the declared finite domain, without closing weak
memory or the other excluded areas. No benchmark or commit.

Records [001](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk07-scadenza-001-failed.lisp),
[002](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk07-scadenza-002.lisp), and
[003](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08/spk07-scadenza-003.lisp) are preserved
in the repository without changing original data. The reduced limit and REQ
marker added during integration are verified separately.

<a id="limiti-e-conflitti"></a>

## Limits and conflicts

Atomic steps and sequentially consistent memory are assumed; barriers, weak
memory, ARM64/SBCL machine execution, filesystem, CRC, crashes, I/O, cache,
concrete relocation/compaction, CSN/epoch wraparound, transactions,
Serie/Archivio health, and arbitrary workloads are out of scope. Resources
represent external bytes/descriptors; directory and heap fragments remain
under GC. Lifetime starts from an already completed registration; the creation
race is exhausted separately, rather than in the product of the two models.
The coupling between the activity check and epoch publication is one assumed
atomic step.

No decision changed. ADR-0016 states a maximum delay of “milliseconds–seconds,
never longer” while also allowing a blocked worker to delay reclamation: the
model cannot support that real bound without an assumption about reader
completion. This tension is reported, and only terminal progress under abstract
scheduling is checked.
