<a id="revisione-del-collegamento-workerserie"></a>

# Worker–Serie link review

Two C1 readings on 2026-10-11 under the
[checklist](../affidabilita/standard-di-codifica.md#lista-di-controllo-di-revisione-c1).
The first examined contract, sources, and fixtures during corrections;
the second reread final sources and compared tests, native coverage,
HTML, and measurements from the v3 freeze. These are agent readings,
not an attestation of human review. No source was modified during the
second reading.

The initial base was `2a0011f9d2bef104b22f7ad1eb86d7e5d60d5e11`;
v3 incorporates `8101eb856cbe9d7540682babb53afb00fde30f70`.
Delivery then integrates `96c0f4f4d6d1f1882723da1b631e78f89e613059`,
which adds the GET core without changing execution/Series: dedicated bridge
qualification remains v3 on `8101eb8`, while `make check` is planned on the
integrated package on `96c0f4f`. Subsequent [reader integration](worker-serie-integrazione.md)
on `65972a4` changes no product source; raw outputs on `96c0f4f` remain the
first general check, followed by a new check of added suites. This check
passes on `65972a4`: [final record](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-worker-series/full-check-reader-integration.lisp)
`4000710249-command-34111-0`, `:OK/:STABLE`, exit0, 796 named tests and two
smoke tests, all gates and ten spikes. Root inserts this outcome after
both readings; it changes no sources, bridge tests, or C4.
The four SHA-256 hashes of the final worktree and frozen copy equal those
in the [decision inventory](worker-serie-decisioni.md):
`worker-package`, `worker-types`, `worker-boundary`, `worker-run`.
ASDF loads the four files after `series/retirement`; namespace
`arcdocdb.execution.series` depends on execution and Series without reversing
load dependencies. Test `tests/series/worker-bridge.lisp`, C4
`tools/worker-series-bench.lisp`, the [contract](worker-serie.md), and
[method](worker-serie-metodo.md) were also read.

The four product findings are closed on v3 source and have passed regressions.
After delivery of both readings, root read the general `make check` gate:
`4000709286-command-15279-0`, **PASS**, `:OK`, `:STABLE`, exit 0 on the
integrated `96c0f4f` freeze. The preliminary coverage audit runner diagnosis
is retained; the new warning-free runner closes that gate, as described below.

<a id="le-due-letture-sui-dodici-punti-c1"></a>

## Both readings on the twelve C1 points

| Point | First reading: contract and source | Second reading: final source and evidence |
|---|---|---|
| 1. Consistent REQ and ADRs | REQ-CON-001/002/004/005, REQ-AFF-001/004/008 headers; ADR-0005/0033/0045. The bridge composes two existing capabilities, retains the logical writer, and creates no scheduler. | Composition confirmed: writer before Serie, no pop before both leases, Serie released before worker end. Logical writer/Serie uniqueness remains a caller precondition declared in factory and contract. |
| 2. Invariants and violation-sensitive tests | Identified owner, immutable binding, positive and monotonic generations, batch debt, release order, unique schedule obligation, fault without rollback. WS-REV-02 required a positive local generation check. | The 26 final fixtures check FIFO/identity/sentinels, quantum and tokens, busy for both acquisitions, closing/busy end, debt and stale ack, wrong-thread, generation limits, lease bypasses, four fault-gate scenarios, and real-thread competition. Rejections and FI compare states; verification is not limited to signaling. Still unexecuted branches remain in the full audit. |
| 3. Error type, handling, and tests | Literal allowlists by class, reason, and step; expected `resource-exhausted` distinct from `invalid-argument`. WS-REV-01/03/04 identified overwritten causes or substep errors incorrectly recoverable. | All five API allowlists and two acquire/release nil/nil boundaries reread. The three error classes injected in substeps remain fatal and propagate the same EQ condition. An already faulted worker retains its first cause; the bridge records the current one. A lower fault cannot reenter the outer allowlist. Specific regressions pass; exhaustive proof for all arbitrary private checker failures is not claimed. |
| 4. Bounded loops, waits, and recursion | No loops, recursion, retries, threads, callbacks, or waits in the three new bodies. `member` lists are literal and bounded. Batch copy, pop, and recycling remain in the already bounded worker. | Confirmed on final source. Closing requires an explicit termination call; it does not reacquire Serie. Semaphores and five-second deadlines are only in the concurrent harness. Benchmark executes a fixed iteration count. No pool fairness property is inferred. |
| 5. Measured hot allocation | Binding, context, controller, and target are preallocated; local handler is `dynamic-extent`. Static reading alone did not close this point. | Five 4096-cycle samples after warmup128 detect `[0,0,0,0,0]` heap bytes, sink `8800256` in each. Sensor detects the `16777472`-byte positive control and rejects a wrong sink. Evidence for the preallocated serial success path on this build, with limits below. |
| 6. Data checked on exit | Ftypes and typed slots, owner before reads; token, phase, captured leases, and binding checked. Meaningful pre/postconditions include delegated execution/Series checks; payload and debt are not duplicated by bridge. | Lease exposed only ACTIVE/current token; pop and ack pass bridge checks then worker checks. Target/span/alias and stale batch are rejected before pop or ack. Begin exposes the three declared values; macro evaluated once and multiple values checked. Caller must apply batch before ack: bridge does not certify external effects. |
| 7. Compound decisions inventoried | Inventory of `case`/default, token/pre/post, boundary, and allowlist forms; only one new compound decision in fault marking: positive lease, owner EQ current, equal generation. | Final inventory: 32 local checks plus delegated owner check, seven macro instances, and all allowlists. Four fixtures make each of the three conditions false with the others true, plus all true. Short-circuit is explicit; fixture values do not automatically attest to each operand's execution. MC/DC is not inferred from sb-cover, nor total coverage from passed tests. |
| 8. Shared-state owners | Three immutable references and fields local to context thread. Controller owner detected only through its capability. Private execution/Series coupling listed, without global registries or counters. | Wrong-thread rejected before handler and does not poison objects. Fault marker writes Serie only when all three conditions are true; after release or stale lease it does not modify the subsequent controller. Scalar check avoids check-ring that could replace cause. Archivio coordination after handoff remains caller obligation. |
| 9. Traceability and `make check` | REQs and invariants associated with source headers and test names; global requirement statuses remain `progettato`. No promotion of the entire execution model. | Targeted tests, Series suite, and C4 have final PASS raw outputs. Root completed `make check` on integrated freeze: 732 named tests and two smoke tests, traceability, links, retention/evidence, and ten spikes PASS; record `4000709286-command-15279-0`, `:OK/:STABLE`, exit0. Documentation insertion of this outcome and new catalogs require the subsequent documents/evidence gate. |
| 10. Rules and deviations | Safety3, complete function ftypes, typed slots, pre/post docstrings, REQ and OWNER/SHARED. Single classification boundary, no introduced syscall. Corrections required before closure. | Final sources within 60 lines per function; maximum inventoried local complexity 9, no new deviation identified. C4 fully compiled and loaded from FASL with fatal warnings; ASDF loading applies only runtime exception `sb-kernel:redefinition-warning` already provided by `tools/build.lisp`. That exception is not extended to coverage audit runner warnings. Coverage gaps retained, without approved exclusions. |
| 11. Serialization and INV-P6 | No lock, wait, or global write between Serie per operation. The individual worker context, its writer, and the controller owned during the segment are serial; scheduling/ready remain in existing APIs. | Two controllers kept ACTIVE simultaneously by real threads before releases. Two writers competing on one controller have only one ACTIVE lease, the other closes without pop. Correctness of these fixtures is not a throughput or scalability measurement. Benchmark has only one worker, one Serie, and capacity1. |
| 12. Durable atomicity and discard | Bridge changes ownership and in-memory diagnosis; it writes no durable records, changes neither WAL, retirement, nor reuse rules. No new durable atomicity point. | No rollback or automatic cleanup after fault. References and tokens remain for diagnosis; batch prefix is not repeated. The I/O END drain fixture on a FAULTED controller applies and cancels the event before ack/end. Real durability, recovery, and Archivio coordination are not qualified by this module. |

<a id="osservazioni-sul-prodotto-chiuse"></a>

## Closed product findings

| ID / priority | Defect identified | Reread correction and final regression |
|---|---|---|
| WS-REV-01 / P1 | Bridge classification could replace an already faulted worker's first terminal cause with the invariant from subsequent raw use. | `%fault-worker-serie` does not reclassify an already FAULTED worker. `preserves-earlier-worker-fault-on-raw-begin` checks EQ of first worker cause and current bridge diagnosis; PASS in 26 tests. |
| WS-REV-02 / P2 | Zero local generation in ACTIVE/CLOSING was not a checked invariant: token was merely rejected as an argument, leaving capabilities without terminal diagnosis. | `%check-writer-worker-serie` checks `plusp generation` before capabilities. `zero-active-generation-faults-only-owned-controller` covers ACTIVE and CLOSING, including an already handed-off Serie; PASS. |
| WS-REV-03 / P1 | An unexpected Serie acquire error with a reason allowed by writer begin could be considered ordinary by the outer boundary. | Nil/nil boundary inside `%acquire-worker-serie`; only inner handler-case converts the two expected Serie reasons. `acquire-boundary-unknown-reasons-never-remain-recoverable` injects resource/invalid/io-fault, retains EQ condition, writer lease and token, without acquiring Serie or extracting payload; PASS. |
| WS-REV-04 / P1 | Same masking was possible in Serie release; a lower fault with reason `:worker-serie-token` could also match benign bridge pop rejection. | Nil/nil boundary in release; allowlists applied only if worker is not already FAULTED. `release-boundary-unknown-reasons-retain-both-leases` covers three classes and retains both leases; `lower-worker-fault-cannot-match-benign-outer-token-reason` retains terminal state and EQ cause; both PASS. |

Abbreviated table names have prefix `test-REQ-AFF-008-worker-serie-`
in the final test file. WS-REV-01/02 come from the first review;
WS-REV-03 from the author's reading; WS-REV-04 from rereading the release
substep and lower fault. The second reading verified all four corrections
in frozen code. No product finding remains open.

<a id="gate-locali-e-rapporti-grezzi"></a>

## Local gates and raw reports

Identifiers are those of `tools/record-command.lisp`, not names assigned
afterward. Every outcome below was read in its raw output, with
`:STATUS :OK`, `:SOURCE-CONSISTENCY :STABLE`, and exit0. Published copies
are in the
[catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-worker-series/catalogo.lisp);
preliminary attempts remain separate from v3 results.

| Gate | v3 record / published raw | Outcome and scope |
|---|---|---|
| Targeted tests | `4000708313-command-79577-0`; [target-final.lisp](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-worker-series/target-final.lisp) | 26 bridge tests PASS. Driver also checks selected count is exactly 26. |
| Series suite and sb-cover | `4000708333-command-80909-0`; [coverage-process.lisp](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-worker-series/coverage-process.lisp) and [bundle](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-worker-series/coverage-bundle.lisp) | 70 tests PASS, including 44 controller and 26 new tests; native raw and twelve HTML pages retained. |
| Native versus HTML audit | `4000708823-command-7776-0`; [coverage-audit-final.lisp](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-worker-series/coverage-audit-final.lisp) and [final process](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-worker-series/coverage-audit-final-process.lisp) | COMPILE-FILE, FASL loading, reader self-tests, and inventory of all missing items PASS with fatal warnings; empty stderr. Counts equal previous audit, retained as probe. |
| C4 strictcompile and FASL self-test | `4000708361-command-83427-0`; [c4-final.lisp](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-worker-series/c4-final.lisp) | Complete COMPILE-FILE with fatal warning/style-warning; FASL self-tests PASS, including sensors, composed cycle, invalid CLI, existing destination, and partial raw. |
| Local heap | `4000708391-command-85710-0`; [benchmark-data.lisp](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-worker-series/benchmark-data.lisp) and [process](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-worker-series/benchmark-process.lisp) | Five complete samples, heap0 and expected sink in each; positive control and wrong-sink diagnosis working. |
| Integrated general check | `4000709286-command-15279-0`; [full-check.lisp](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-worker-series/full-check.lisp) and [spike master](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-worker-series-spikes-check/report.lisp) | **PASS**, `:OK/:STABLE`, exit0; 732 named tests and two smoke tests, all ordinary gates and ten spikes with outcomes verified in individual raw outputs. Root update after both readings, without changing code/tests/C4. |

Audit probe `4000708506-command-97108-0` retains two `STYLE-WARNING`s
from the `-eval` runner for forward references to `coverage-reader-main`
and `coverage-reader-self-test`. Exit0 does not remove them and that
command is not promoted to a warning-free gate. Subsequent
`4000708823-command-7776-0` uses separate evals and `funcall/fdefinition`
after loading: fatal warning handler on compile, FASL, self-test, and main;
raw read with stdout PASS, empty stderr, OK/STABLE status, and exit0.
Reader02 source is retained in
[orchestration-final.lisp](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-worker-series/orchestration-final.lisp).
The publisher wrapper separately retains a forward-reference warning for
`compact-finished-directory`: it reuses an existing copy/compaction helper,
not the new benchmark C4 or qualified reader. Its retention outcomes are
not presented as warning-free C4 compilation.

<a id="copertura-conservata-senza-esclusioni"></a>

## Coverage retained without exclusions

The following values were read from the HTML index and match the native
format audit. The denominator includes all twelve Series module files,
including packages and four late files. Coverage of delegated execution
implementations is not attributed to Series scope.

| File | Hit/total expressions | Hit/total branches |
|---|---:|---:|
| events.lisp | 288/335 | 38/46 |
| io-events.lisp | 185/220 | 23/32 |
| ownership.lisp | 223/279 | 42/52 |
| package.lisp | 0/1 | 0/0 |
| publication.lisp | 156/203 | 16/22 |
| query.lisp | 65/79 | 5/6 |
| retirement.lisp | 166/182 | 14/18 |
| types.lisp | 75/84 | 4/10 |
| worker-boundary.lisp | 74/86 | 18/20 |
| worker-package.lisp | 0/1 | 0/0 |
| worker-run.lisp | 145/161 | 12/14 |
| worker-types.lisp | 124/168 | 19/30 |
| All Series | **1501/1799** | **191/250** |
| Four new files | **343/416** | **49/64** |

**298 expressions and 59 branches** remain unexecuted in all Series;
in the four new files, **73 expressions and 15 branches** remain.
The audit retains file, kind, and native path for each: they are neither
excluded nor aggregated into one generic note. Missing branches in the
new files are 2 in boundary, 2 in run, and 11 in types, including generated
forms and internal checks. Reading the source does not promote them to
impossible and does not replace their execution. The static inventory and
manual cases of the three-condition decision complete the description,
without claiming MC/DC or complete coverage.

<a id="limiti-della-misura-e-del-protocollo"></a>

## Measurement and protocol limits

Measurement uses SBCL 2.6.9 ARM64/Darwin, safety3, one worker, one Serie,
writer/ready/Serie capacity1, and payload5. Each cycle observes enqueue,
adoption, begin, lease, pop, payload identity, ack, and idle end;
the independent formula is `N*101+N*(N-1)/2`.
GC, fixture setup, and printing are outside the window.
A zero timer has distinct diagnosis `:BELOW-RESOLUTION` and NIL seconds;
a wrong sink remains a rejection even with clockzero. External load
is `:UNCONTROLLED`.

Heap0 is a local counter observation, not universal proof of allocation
absence. Windows do not measure busy, closing, fault, contention, quantum
greater than 1, parallel pool, real device, durability, or recovery.
Concurrent tests verify the protocol in finite fixtures; they do not
measure scalability, throughput, P99, or fairness. No time threshold is
used to qualify the product.

The caller must maintain unique logical mapping, nonreentrancy, and exclusive
use of segment capabilities. It must process the batch before ack, close
CLOSING before recycling, distinguish exhausted Serie generation from busy,
and not reschedule it indefinitely. After a fault outside the current Serie
lease, it must stop/coordinate the Archivio: the bridge cannot write the
new owner's controller. The boundary records errors; it does not promise
quiescence, rollback, or cleanup for arbitrary nonlocal exits. Payload
application, routing, admission, pool, and coordinator remain outside
qualified scope.
