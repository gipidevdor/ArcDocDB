<a id="revisione-statica-del-piano-csn-di-archivio"></a>

# Static review of the Archivio CSN plan

2026-10-16; worktree `archivio-csn-verifica/ArcDocDB`.
Two readings by the same reviewer, who did not author the increment:
P1 from structures to sources; P2 from outputs to prerequisites and markers.
These are not two independent reviewers. The first substantive batch was saved before
the delegated work was complete; locations refer to the sources read.
No tests, compilation, diagnostics, benchmarks, or security scans were run;
no other party's runtime results were used. No C1 qualification is inferred.

Rules read: CONTRIBUTING, repository guide, engineering principles,
coding standard, and deviation register. C1 checklist: standard, lines 89–108.
Scope: all six files in `src/recovery-archive-csn/`; markers in
`src/recovery/decisions-types.lisp`, `src/recovery-active/types.lisp`/`build.lisp`;
relevant DECISION/ACTIVE/CLOSED source queries, CLOSED gates, resolution, and replay.
Contracts: `docs/implementazione/csn-archivio-recovery.md`, `recovery-csn.md`;
ADR-0020/0038/0041/0046. Requirements and product ASDF registration were read;
REQ-* names and cases in tests under development are static material, with no attested outcome.

Coverage planned by the coordinator, not measured: nine files, namely the module's five
`types/series/preflight/build/query` files, `recovery/decisions-types.lisp`,
`recovery-active/types.lisp`, `recovery-active/build.lisp` and, after the R1 patch,
`recovery/decisions-query.lisp` as the explicit ninth file. `package.lisp` was read
for imports/exports; other delegates read do not expand this denominator.

<a id="rilievo-per-il-coordinatore"></a>

## Finding for the coordinator

**R1 — COD-24 in the existing delegated DECISION source query.**
Original observation before the patch; the addendum updates its status.
`src/recovery/decisions-query.lisp:14`–`:22`, `massimo-csn-decisioni`,
visits all entries and computes the maximum without explicit assertions
about shape/consumption and without calling validators. The plan reaches it through
`src/recovery-archive/query.lisp:13`–`:14` and its own `build.lisp:19`.
Canonical replay and types support the data precondition; they do not constitute
the two meaningful assertions required by COD-24 for a nontrivial C1 function.
`docs/affidabilita/deviazioni.md:18` lists no approved exceptions.

> **Proposal** — during the fold, call `check-entry-shape` on entries
> (`src/recovery/decisions-types.lisp:36`, count/participant checks),
> save the initial cardinality, and check the number visited before returning.
> Scalar counters only, no container; use `invariant-violation` for inconsistent consumption.

R1 is a standards deviation in the delegate: no incorrect maximum was demonstrated
for canonical inputs. No correctness counterexample was identified in the six new files
or the marker connection under the declared preconditions.
This conclusion does not attest to FAULTED handling, tests, coverage, or qualification.

<a id="passaggio-1--checklist-c1-strutture-e-fonti"></a>

## Pass 1 — C1 checklist, structures and sources

“Open” means evidence has not been acquired, not a positive outcome.

| # | C1 item | Static evidence / limitation |
|---|---|---|
| 1 | REQ and ADR | REQ-REC-001/002, MVC-006, TXM-005/007, AFF-008 annotated; base and recovery consistent with ADR-0020/0038/0041/0046. |
| 2 | Invariants/tests | INV-M5/T2/S7/A8/P6 relevant; REQ-* names visible in tests; effectiveness and completeness open. |
| 3 | Errors | Typed conditions and propagation without handlers; no partial plan delivered. Controller handling open. |
| 4 | Loops/waits | Loops over views, segments, and DECISION are budgeted; no recursion or waiting introduced. |
| 5 | Allocations | Vector copy and UUID hash table at opening; boxing/GC/RSS not measured. |
| 6 | Validated data | Scope/UUID/Registri, EQ Archivio/view/marker, CLOSED gates; canonical sources are prerequisites. |
| 7 | Decisions | ACR-D01…11 listed in the contract; MC/DC not demonstrated. |
| 8 | Ownership | OWNER/SHARED declared; vector copied, views and sources immutable by protocol. |
| 9 | Traceability/checks | REQ and ASDF ordering read; matrix regeneration and `make check` not run. |
| 10 | Standards/deviations | Safety 3, ftype and typed/read-only slots; R1 in the existing source fold, no recorded exception. |
| 11 | Parallelism | Local bootstrap aggregation; no new lock or CSN update across Serie. |
| 12 | Durability | No durable change, rename, deletion, or new atomicity in the plan. |

<a id="passaggio-2--checklist-c1-output-e-prerequisiti"></a>

## Pass 2 — C1 checklist, outputs and prerequisites

| # | C1 item | Static evidence / limitation |
|---|---|---|
| 1 | REQ and ADR | Base M, first assignment M+1 external; ADR-0046 retains rejection on exhaustion without wraparound. |
| 2 | Invariants/tests | Provenance, duplicates, and maximum sources reread; no violation proof or effective test run. |
| 3 | Errors | Budget causes explicit rejection; wrong owner/view/marker precede the respective Serie's gate; lifetime delegated. |
| 4 | Loops/waits | N+SUM(CLOSED) preflight before gates; consumption rechecked; exact inclusive limits, zero CLOSED allowed. |
| 5 | Allocations | Plan: Archivio and four scalars; marker has no entries/FDs; plan retains no heavy source. No measurements. |
| 6 | Validated data | Marker from the actual resolving table, even with empty ACTIVE; complete CLOSED set for the same CONTROL. |
| 7 | Decisions | Count AND, budget OR, and consumption AND (presence OR zero) reread; correspondence to ACR-D01/02/04/05/10. |
| 8 | Ownership | Stable FDs/vectors/files/namespace throughout the plan are preconditions, not an atomic snapshot produced by gates. |
| 9 | Traceability/checks | REQ-* test names read, sources still under development; no build/lint/trace/coverage/check evidence produced. |
| 10 | Standards/deviations | R1 confirmed: the folding query lacks assertions; types/replay do not replace COD-24. |
| 11 | Parallelism | No new thread, callback, timer, or I/O; runtime registers and GET not updated. |
| 12 | Durability | Derived scalar results; publication/recovery and admission obligations remain with the coordinator. |

<a id="evidenze-e-limiti-dei-controlli"></a>

## Evidence and limitations of checks

- **Serie list.** `series.lisp:40`–`:44` rejects empty input and budget violations before
  copying/creating the hash table; `:13` rechecks count/range, `:18` EQ scope, `:22` UUIDs
  distinct by content, `:25`/`:26` EQ presence of Registri, `:27` cardinality.
  The copy preserves order and isolates the caller's vector; views are not copied.
  Catalog completeness and the actual role of Registri are controller attestations
  (`csn-archivio-recovery.md:21`): a Serie omitted initially cannot be detected here.
- **Origin.** `src/recovery/decisions-types.lisp:8` defines a marker with no
  slots; `:32` creates one for each new table. `src/recovery-active/build.lisp:55`
  resolves using `decisions`, then `:63` retains that table's actual `%table-origin`
  in the read-only slot in `types.lisp:31`, even without prepared records.
  `preflight.lisp:13` requires EQ Archivio; `:38` EQ view; `:41` EQ marker.
  Separate replays of equal bytes remain distinct. The marker does not attest to the catalog
  or protect against Lisp access to private internals: no further guarantee is assumed.
- **Coverage and budgets.** `preflight.lisp:17` compares both counts with N;
  `:19` includes N ACTIVE, `:23` checks each CLOSED against the Serie limit and remaining
  global budget before addition. The `8*N` reference budget excludes hashes/objects/GC.
  `build.lisp:24` checks origin before the Serie gate; `:26` uses
  `massimo-csn-serie-recuperata`, which in `src/recovery-closed/csn-serie.lisp:17`
  checks complete CLOSED coverage: same EQ CONTROL, unique IDs, CLOSED state, and exact P.
  The per-Serie limit applies to CLOSED; the global limit includes ACTIVE.
- **Lifetime.** The `src/recovery-archive/query.lisp:13` query checks the
  decisions FD; `build.lisp:31` rechecks it after aggregation. The Serie query
  checks ACTIVE before/after and CONTROL; the gate checks CLOSED FDs.
  These are local observations, without atomic pinning of all FDs: opening and stability
  of files, manifests, vectors, and namespace throughout the call are the coordinator's responsibility.
  Plan getters describe the completed computation and work without rereading sources.
- **Maximum and output.** `build.lisp:19` includes all DECISION records, even without
  local prepared records; `:26`–`:29` combines all Serie and checks consumption/absence-zero.
  Delegates include ordinary stamps, writer SEAL, OUTCOME payloads, and EDIT;
  prepared/TXID stamps, frontiers, and excluded tails do not contribute.
  Presence is distinct from zero; `query.lisp:33`–`:34` separates high/low u32
  without incrementing or losing high bits, including maximum u64.
  `types.lisp:21`–`:25` retains Archivio and four scalars, without sets, ACTIVE,
  CLOSED, decisions table, scratch, or FDs; no result is delivered before all gates pass.
- **Bootstrap and admission.** The plan does not update the bootstrap GET scope;
  catalog, indexes/roots, publications, and pending multiseries work remain to be completed.
  Register creation receives M (`src/csn/registry.lisp:76`–`:88`);
  exhaustion is checked before increment (`:117`). Two plans do not authorize
  two allocators. The observed maximum is neither horizon H nor proof that traffic can be admitted.

<a id="sintassi-e-consegna"></a>

## Syntax and handoff

Package/import/export, ftype signatures, constructors, and the new
`decision-origin` argument were manually reread: the only ACTIVE construction site found in
the product passes the marker; ASDF ordering loads decisions before ACTIVE and the plan
after CLOSED. No syntax error was identified by reading; compilability
is not attested. Instances with the previous layout are not reused, as required by the contract.

The original R1 and proposal are preserved; the coordinator's correction is reread below.
The reviewer applied no product correction. Distinct origins, closed FDs,
exact budget, zero/high bits/maximum u64, and base M still require verification after freeze.
FAULTED at the boundary, MC/DC, regression, and measurements remain unattested.

<a id="addendum--seconda-lettura-della-patch-r1-2026-10-16"></a>

## Addendum — second reading of the R1 patch, 2026-10-16

`src/recovery/decisions-query.lisp:14`–`:27` was reread after the change.
`:22` calls `check-entry-shape` before taking the maximum: participant
count >=2 and exact ID16 length are checked, with the existing reasons
`:decision-entry-count` / `:decision-entry-size`. `:24` increments `used`.
`:25`–`:27` checks `(= used count) AND ((plusp count) OR (zerop maximum))`,
signals `:decision-csn-result`, and returns presence derived from count.
Exact consumption ties presence to traversal; on empty input the maximum
must be zero, while CSN zero in a nonempty table remains present.
These are meaningful shape and postcondition checks for COD-24. No new
container/I/O or second traversal; it remains O(N), without allocation measurements.
R1 is addressed with respect to the standards finding; no numeric bug was reproduced
or demonstrated on canonical inputs, and no new issue was identified in the patch.
For COD-54, record the query's compound decision separately from
the ACR-D10 plan check. Specific FI cases in `guards.lisp` remain the coordinator's responsibility;
no related outcome is assumed here. The frozen-source precondition is retained.
Second reading completed for freeze; no execution, commit, or C1 qualification.
