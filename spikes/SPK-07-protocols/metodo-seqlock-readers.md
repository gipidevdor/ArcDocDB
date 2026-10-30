<a id="metodo-preregistrato-due-reader-seqlock-due-slot-memoria-sc"></a>

# Preregistered method: two seqlock readers, two slots, SC memory

Registered on 2026-10-08 before this module's compilations and checks.
Phase 0, Common Lisp/SBCL, `safety 3`; warnings and style-warnings are errors.
Existing requirements: REQ-IDX-003 (consistent tuples, bounded attempts and
fallback), REQ-CON-001 (single writer), REQ-VAL-001 (reproducible experiments).
References: SPK-07 plan and ADR-0032; the experimental limit is **two** attempts,
whereas ADR-0032 proposes eight. No production code or benchmark.

<a id="dominio-e-scheduling"></a>

## Domain and scheduling

One writer, two readers identified as 0 and 1, two slots identified as 0 and 1.
Each reader executes a single operation on a single slot, invoked in the
initial state. Assignments are `(0 0)`, `(1 1)`, `(0 1)`, `(1 0)`.
The writer updates each slot once, in orders `(0 1)` and `(1 0)`:
eight distinct correct graphs, without symmetry reduction.

Each update consists of four actions: odd seq, version, location, even seq
and publication of the event in logical history.
`location` is a complete atomic abstract register (segment, offset, length,
key). The three seq/version/location registers are separate. Initial and
final tuples use distinct explicit data, rather than a checksum.
Seq belongs to `{0,1,2}`; generation to `{0,1}`; no wraparound or ABA.
Logical event identifiers are distinct from physical registers.

A reader attempt reads initial seq; if odd, it rejects immediately.
Otherwise it reads version, location, final seq, then validates equality and
parity. The first rejection starts the second attempt; the second forwards
the request to the writer. Fallback service is a writer action enabled only
between complete updates (pc 0, 4, 8): it copies a whole tuple, responds, and
completes the operation. The writer explicitly chooses between the next update
and pending requests, one per action.

Each edge chooses an enabled action of the writer or one of the two readers.
Actions are SC and indivisible. All interleavings of these actions are
enumerated; suspensions are represented by choosing other actors, without
stuttering edges. Readers are not combined.

Hit/miss: for each accepted tuple, three queries per slot are checked: initial
key, replacement key, and always-absent key. This factorization is exact in the
model: the query participates only in response decoding, without changing
registers, steps, or scheduling. Hit and miss witnesses for both variable keys,
plus the permanent miss, are required for each reader in each graph.
Hash table probing, the directory, and an atomic snapshot across slots are
not modeled: each response concerns only one slot.

<a id="oracolo-mutanti-e-criteri-preregistrati"></a>

## Oracle, mutants, and preregistered criteria

The core's `ARCDOCDB.SPK07::EXPLORE` and `::REQUIRE-OUTCOME` are reused.
The core is compiled and loaded before the module.
The oracle is called for every state dequeued by BFS, even when neither reader
has responded. It reconstructs expected tuples from logical history using
data declared separately from model writes; it checks the event prefix,
stable slot registers, domains, attempts, and every response retained in state.

Every response carries a generation, version, location, and the logical prefix
at its linearization point: final seq read for the optimistic path, writer
copy for fallback. All fields are compared with the oracle at that prefix,
and the prefix is checked against current history. Independent hit/miss
response calculation uses logical records. An old response may remain valid
after a later publication: the oracle uses the recorded point, without
incorrectly requiring the current version at response time.

For each of the eight scenarios, targeted mutants are explored: writer
omitting odd in each read slot; reader 0 or 1 omitting final validation.
There are 28 negative graphs: three per shared-slot scenario, four per
distinct-slot scenario. A mutation on a slot never read could not produce an
incorrect accepted tuple: it is not counted as a detectable mutant.
Each mutant must produce an `:accepted-tuple-mismatch`, with slot or reader
matching the target, observed/expected tuples, and a path. A generic violation
or merely absent validation is insufficient.

Correct graphs require witnesses for both readers of: retry, success on the
second attempt, fallback request, and completed service; also both completing
through fallback, generations 0 and 1, and the declared hits/misses. The BFS
path to each is retained. A strictly increasing rank is checked on every edge;
the maximum is 36. Reverse edges are reconstructed, and **every state** must
reach a terminal state with writer and readers complete. Blocked incomplete
terminal states or states without a completion path are errors.

Hard ceiling of **200000 states per graph**, a parameter that may be reduced
but never increased. Reaching the ceiling is an error, even before attempting
to insert the next state. Exhaustion is not converted into a positive result.
A separate attempt with ceiling 32 must fail and retain the failure record.
No random search or seed.

Safety means tuple consistency in every reachable state. Positive witnesses
prove reachability. Universal completability concerns the finite graph without
stuttering; real progress requires enabled actors to be scheduled eventually.
Two attempts and rank 36 bound abstract work, rather than elapsed time during
external suspension. This is not a proof of hardware, SBCL barriers, or weak
memory, nor a proof for infinite writers, multiple operations, or counter wraparound.

<a id="registrazione-e-consegna"></a>

## Recording and delivery

Only `seqlock-readers.lisp`, this method, and new ignored files in
`spikes/SPK-07-protocols/out/` and `spikes/out/`. No commit/push.
The local runner and data reports are new artifacts under `out/`;
no integration or changes to existing core, suite, runner, or tools.

Every compile/check attempt uses wrapper `tools/record-command.lisp` with
explicit argv and empty stdin. The runner also saves a schema 1 record with
argv/stdin, environment, before/after source contents, decoded results, full
stdout/stderr, limits, and compilation phases. Failures and corrective attempts
must also be retained. Module reports include per-graph and cumulative counts,
oracle calls, witnesses, counterexamples, and the completability check.
The delivery will list all attempts, paths, counts, and limits.

<a id="risultati"></a>

## Results

Executions in isolated checkout
`/Users/gpicchiarelli/.codex/worktrees/valutazione-avanzata/ArcDocDB`.
SBCL 2.6.9, Darwin 27.0.0 ARM64, Apple M4, 16 GiB, 10 logical CPUs;
external load uncontrolled. No seed. These are logical checks, without
performance measurements or benchmarks.

| Writer order | Reader slots 0 / 1 | States and oracle calls | Edges | Terminal states |
|---|---|---:|---:|---:|
| 0, 1 | 0 / 0 | 5961 | 14385 | 49 |
| 0, 1 | 1 / 1 | 1938 | 4057 | 25 |
| 0, 1 | 0 / 1 | 3159 | 7053 | 35 |
| 0, 1 | 1 / 0 | 3159 | 7053 | 35 |
| 1, 0 | 0 / 0 | 1938 | 4057 | 25 |
| 1, 0 | 1 / 1 | 5961 | 14385 | 49 |
| 1, 0 | 0 / 1 | 3159 | 7053 | 35 |
| 1, 0 | 1 / 0 | 3159 | 7053 | 35 |

Correct total: **28434 states**, **65096 edges**, **28434 oracle calls**,
288 terminal states. Every state reaches a complete terminal state; zero
deadlocks and violations. There are 24 retained witnesses per graph, **192**
in total, including retries, successful second attempts, fallback request/
service for both readers, hits/misses, and generations.
8240 accepted-tuple checks and 24720 query-response checks; these are counts
of checks within states, rather than distinct operations.

All **28 mutants** are detected with `:accepted-tuple-mismatch`:
14994 states discovered, 28238 edges, 10222 states actually visited by the
oracle before the counterexamples; 1080 tuple checks and 3156 query checks
actually executed. Negative BFSs stop at the first violation and are not
exhaustive explorations of the mutant graph. The maximum across all graphs
is **5961 states**, below the 200000 ceiling. In the final version, response
check counters advance inside the oracle up to the actual interruption point.

Specific example: skipping odd in slot 0 causes the reader to accept
`(0 47 (:seg-a 13 9 :alpha))`, whereas history requires
`(0 11 (:seg-a 13 9 :alpha))`: new version, old location and generation.
Skipping final validation for reader 0 or 1 yields the same kind of mixed
tuple, with a distinct target and reproducible path. Witnesses explicitly
annotate `:odd-skipped` or `:validation-skipped`.

All attempts have empty stdin and are listed below; `record.lisp` contains
before/after contents/hashes, argv, environment, decoded data, and full
stdout/stderr. `data.lisp` contains compile/check phases, counts, witnesses,
limits, and any child process failure.

| Attempt | Ceiling | Outcome and reason |
|---|---:|---|
| [001](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-avanzamento/seqlock-readers-campaign-portable.lisp) | 200000 | Core compiled; module failed because of a missing parenthesis in form `run-graph`; CHECK not started. |
| [002](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-avanzamento/seqlock-readers-campaign-portable.lisp) | 200000 | Strict compilation and CHECK `:ok`, 8 correct graphs and 28 counterexamples. |
| [003](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-avanzamento/seqlock-readers-campaign-portable.lisp) | 32 | Compilations succeeded; expected error upon reaching 32 states. The diagnostic predates structured budget counters. |
| [004](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-avanzamento/seqlock-readers-campaign-portable.lisp) | 200000 | Compile/CHECK `:ok` after adding the condition with budget data and mutant-step annotations. |
| [005](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-avanzamento/seqlock-readers-campaign-portable.lisp) | 32 | Expected error: 32 states, 13 oracle calls, 39 enumerated edges. Additional recorder error decoding the condition's qualified symbol: the parent process did not know the package. Raw data and output retained; supplementary decoding in the catalog. |
| [006](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-avanzamento/seqlock-readers-campaign-portable.lisp) | 32 | Compilations succeeded; expected error at 32 states, 13 oracle calls, 39 enumerated edges; complete decoding after serializing the condition type as a string. |
| [007 final](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-avanzamento/seqlock-readers-campaign-portable.lisp) | 200000 | Strict compilation and CHECK `:ok` on final sources: counts confirmed, no warnings or style-warnings. |

Reproducible command, to run in the isolated checkout with a new attempt name
(the recorder refuses to overwrite):

```sh
sbcl --noinform --no-userinit --no-sysinit --script tools/record-command.lisp -- \
  sbcl --noinform --no-userinit --no-sysinit --script \
  spikes/SPK-07-protocols/out/seqlock-readers-20261008/record.lisp NOME-NUOVO 200000 < /dev/null
```

The [campaign catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-avanzamento/seqlock-readers-campaign-portable.lisp)
collects module records, data reports, and generic wrapper records, also
preserving the decoding error from attempt 005. To read old data report 005,
the cataloger creates only the package needed by the Lisp reader: it does not
load or execute module code. The new format uses a string for the condition type.

The catalog retained in the repository is a portable record: `:raw-original`
keeps the entire original catalog, `:decoded-record` converts experimental
package symbols into qualified strings. The normalizer is included as source
and does not execute data. The first standalone read of the original catalog
failed; the [failure record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-avanzamento/evidence-read-failure.lisp)
and [corrected read](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-08-avanzamento/evidence-read-success.lisp)
are retained. New module results already use a string for the condition;
the intervention concerns old recovered data from attempt 005.

The campaign contains seven compile/check attempts: 14 compilations
(13 successful and one initial syntax error), six CHECK invocations
(three successful and three expected budget errors). Attempt 005 also includes
the parent's decoding failure, repaired without discarding the original
record. Successful compilations return `:warnings nil :failure nil`;
the final CHECK returns `:status :ok`.
Cataloging is a subsequent data read/aggregation, itself recorded by the
wrapper; it neither compiles nor executes the module.

Concurrent changes to other spikes and runner/suite files were observed in
the checkout. The wrapper for attempt 003 reports global sources as
`:changed`; module-specific inputs and the core are stable in their respective
before/after snapshots. The catalog distinguishes the two provenances and
preserves the original records in full. This activity writes only the two
requested files and the new ignored artifacts identified above.

Preregistered limits remain: one read per reader, one update per slot, two
attempts, SC with atomic location, maximum rank 36. Completability concerns
finite work with enabled actors being scheduled; no real-time bound, cross-slot
snapshot, proof of hardware barriers, or weak memory. No suite integration,
production code, requirement or decision changes, commit/push.
