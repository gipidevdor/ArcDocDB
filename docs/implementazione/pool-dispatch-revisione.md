<a id="revisione-indipendente-del-dispatcher-poolserie"></a>

# Independent review of the pool/Serie dispatcher

Static reading on 2026-10-13 against base
`14fd7738c216e3a0bd3ce9612576b9b57d648f74`, by an agent other
than the author. Outcome on code read: **positive for C3 scope**. Reviewer
modified neither product code nor tests. The reading is not human
review and certifies neither build, test execution, coverage, nor allocations.

Applied framework includes
[ADR-0031](../adr/0031-software-critico-criteri-e-priorita.md),
[ADR-0034](../adr/0034-policy-di-compilazione-e-standard-di-codifica.md),
[ADR-0045](../adr/0045-modello-di-esecuzione.md), and the
[coding standard](../affidabilita/standard-di-codifica.md).
Read: [contract](pool-dispatch.md),
[preregistered method](pool-dispatch-metodo.md), four new sources,
ASDF order, fourteen new tests, and existing claim,
routing, worker execution, and Serie bridge barriers.

<a id="identità-del-codice-letto"></a>

## Identity of code read

| File | SHA-256 |
|---|---|
| `src/dispatch/package.lisp` | `acb5fd19599e89e821a89bcca8f94064f33cdc71cdfcf204aadcd4fb52dd795f` |
| `src/dispatch/types.lisp` | `cc44882c565a89de08f5add79333868ebfca4fc3f97bf9104d36375d014d4720` |
| `src/dispatch/build.lisp` | `c78d31a753db78baea520e9ea0cccf6e88cad9cca8bc75261a6ff26c2ac01fe5` |
| `src/dispatch/claim.lisp` | `224e4114b8b91affced874bea9c23cae5c79526e8ddae62e31a0cafcbb763682` |
| `arcdocdb.asd` | `0128c4955e2682cf22400c2995e0769072a57530c6d289aa258c8bac9a96cd4c` |
| `tests/scheduler/dispatch.lisp` | `600eb0b5fdf9a52d020e2f4c638f0f3dba43d9d9711be73eaffff208578821eb` |
| `docs/implementazione/pool-dispatch.md` | `1e8ae257234afd483f46d5ce3e9f13e904721981270741abe6576899c694e433` |
| `docs/implementazione/pool-dispatch-metodo.md` | `c00510ab85c22fe7c542d37a0efc6fd7094885d3ec48a5a9478ae00f07455bb4` |

Delegated barriers checked against these sources without modifying them:

| Source | SHA-256 |
|---|---|
| `src/scheduler/pool-claim.lisp` | `e384f6091a5fcb506e718e12e77b06ab8dd4233a41024bc57ca3b14425e10b14` |
| `src/scheduler/lifecycle-worker.lisp` | `ec8b462ff3f5f7a6435f0f0c01b62034d8de2a784a9e354d469a0adfec9cf837` |
| `src/series/routing-select.lisp` | `796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a` |
| `src/series/worker-run.lisp` | `f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f` |
| `src/execution/worker-boundary.lisp` | `4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a` |
| `src/execution/worker-types.lisp` | `62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317` |
| `src/execution/worker-claim.lisp` | `62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e` |

Subsequent campaigns must state whether they use the same bytes. This document
separates identity from qualification performed by other tools.

<a id="confine-e-conservazione-degli-obblighi"></a>

## Boundary and obligation retention

The dispatcher contains only two typed read-only references: pool
port and local routing table. Factory checks port type,
port owner, table type, and EQ identity of both contexts in
that order. Then it verifies IDLE phase and complete C1 shape read-only,
before its own allocation. It neither applies a command nor assumes an obligation.

Both hot APIs repeat binding checks before delegation. Their
helper reads neither execution state, request/ack words, ring, lease, nor live
Serie state. Execution owner is rechecked by delegated APIs.
Ready-list equality is not a substitute for context identity.

`prendi-collegamento-pool` delegates exactly one new acquisition to gate
`prendi-writer-pool`. Only `:claimed` selects the preallocated link on the bound
context; other three outcomes retain NIL, cursor, and gate action.
No begin, pop, bridge token, or second lease introduced. If
routing fails after actual claim, execution retains its fault boundary,
writer, home, and obligation. An already successful ACK remains valid. New
code neither clears diagnosis nor rolls back, hands off, or publishes.

`collega-obbligo-pool` repeats binding and directly delegates routing of
an already owned CLAIMED. It does not read request, ack, or active: busy at slice
start, full recycling, and adoption depend on no new pool consent.
Lookup is repeatable while link stays IDLE. After full recycling it selects
current writer, which may differ from the previous slice's writer.
Non-CLAIMED and FAULTED phases retain rejections and first cause of existing
C1 APIs; they are not adapted to dispatcher with implicit cleanup.

Caller still starts and completes bridge, acknowledges batches,
and recycles obligations through existing APIs. Retirement request
neither revokes CLAIMED, prevents drain, nor guarantees return to
IDLE with a perpetually full ring. Direct C1 APIs remain available:
this integration does not make gate bypass impossible for a caller.

<a id="lista-di-controllo"></a>

## Checklist

Twelve C1 checklist points serve as additional checking. The
reading remains ADR-0031's single C3 pass without reclassifying
C1 delegates or replacing their reviews and verification.

| Point | Static assessment and limit |
|---|---|
| 1. Requirements and ADRs | REQ-THR-001, REQ-CON-001/002/004/005 and REQ-AFF-008 identified on APIs; admission occurs between tasks under ADR-0045. Complete-pool requirement remains open. |
| 2. Invariants | Owner before table, identical context before gate, complete C1 IDLE at factory; link only for claim, obligation routing without lifecycle. Fourteen read fixtures check identities and complete images on rejection; execution results are not attributed to reading. |
| 3. Errors | Factory/binding have typed reasons; phase/invariants delegated without concealment. No handler or new C3 fault marking. Inconsistent returned writer/outcome has distinct reason `:pool-dispatcher-state`. |
| 4. Limits | No new loop, recursion, wait, callback, syscall or retry. Binding/routing O(1); gate may delegate bounded ready scan over at most 64 partitions. |
| 5. Allocation | One structure created only at startup; no constructor, list, closure or hash on hot path. Heap absence must be measured and is not inferred from syntax. |
| 6. Results | Gate outcome, cursor and action forwarded; writer replaced by verified link only after `:claimed`. Writer/NIL consistency checked and unexpected branch explicit; no error-indicating value ignored. |
| 7. Decisions | Simple predicates, no new compound decision. Complexity: binding helper 5, factory 2, claim 5, obligation lookup 1; no function exceeds 60 lines or 10 paths. MC/DC not required for C3. |
| 8. Ownership | Dispatcher/table belong to creating thread; port/context and registry already owned under their contracts. Read-only references, no new global state or synchronization protocol. |
| 9. Traceability | REQs on definitions, package and fourteen test names; ASDF loads dispatch after series/routing and scheduler fixtures after pool-claim. Build, lint, trace and full check execution remain distinct from reading. |
| 10. Standard | Safety 3, ftype and typed slots, docstrings and OWNER/SHARED; case with typed otherwise, no ignore-errors, cleanup or removed checks. No deviation identified. |
| 11. Parallelism | No new global lock or counter. Per-wave ACK and partitioned ready remain delegated; mapping indexed/preallocated per worker. Reading does not demonstrate fairness or scalability. |
| 12. Durability | No payload, controller, CSN or file writes; no durable change or deletion. Persistent atomicity not applicable. |

<a id="lettura-delle-prove-nuove"></a>

## Reading the new tests

Reviewer read fourteen named tests in the version identified
above without running them. Tests distinguish actual API execution,
contention on actual guard, and deliberate protocol/shape FI.

| Group | Planned code evidence and limit |
|---|---|
| Factory and binding | Invalid types, different contexts, actual CLAIMED and inconsistent IDLE FI; rejections compared with port, context, ready, writer, link and controller images. Factory applies no commands. |
| Foreign owner | Port created on actual separate worker; owner rejected before invalid table, phase and corrupted-word FI. Both hot APIs preserve images. |
| No routing without claim | Quiescent restored routing sentinel, INACTIVE with actual queued work, EMPTY and BUSY on actually acquired ready guard. Four values/cursors compared with expected. |
| Two real writers | Distinct ordinals, link still IDLE and controller acquirable after selection; explicit begin, pop, ACK and end through bridge. No implicit acquisition attributed to dispatcher. |
| Pool-independent obligation | Repeated lookup on CLAIMED with corrupted lifecycle words FI and gate sentinel; identical images, then actual slice completion. |
| Retirement after drain | Pending command published through quiescent FI, new acquisition rejected during CLAIMED, actual ending and retirement ACK only at new IDLE acquisition. Not a concurrent coordinator-publication test. |
| Full recycling | Actual full ring/transfer; new CLAIMED selects second link, both Serie stay independent, pending ACK retained. First ring obligation then explicitly completed. |
| Writer-busy begin | FI contention on actual guard with CAS/release; actual begin preserves CLAIMED/IDLE link. Repeated lookup without gate, explicit begin retry, drain and retirement ACK after IDLE. Not random contention stress. |
| Phases and diagnosis | All non-IDLE phases rejected by gate before inconsistent lease/debt FI; obligation lookup rejected on consistent states reached by actual begin/batch/end. First cause EQ preserved terminally. |
| Fault after activation | Legacy writer, foreign identity and out-of-range ordinal: actual activation/ACK and claim precede routing fault. Writer/home and cause EQ retained; no controller mutation or Serie acquisition. Request publication is quiescent FI. |
| Corrupt binding and link | Dispatcher FI with different context rejected before pending ACK 3/0 and claim, including during current obligation; NIL link slot causes C1 fault after claim, retaining reference and leaving ready without false republication. |
| Inconsistent outputs | Temporarily replaced gate returns, with inconsistent writer/status combinations within declared types; routing sentinel and identical images. Neither real interleavings nor authorization for new diagnosis on C1 context. |

Initial fixture reading found no dedicated test for
writer-busy begin or inconsistent binding with pending activation.
Final version adds both; product code remains
identical. Tests do not simulate Serie-busy through the new
dispatcher: begin remains explicit and its C1 contract remains that of
existing bridge.

<a id="limite-dei-rami-difensivi"></a>

## Defensive branch limit

A delegate respecting its ftype always returns one of four
known outcomes; `otherwise` is not nominal. Writer/outcome guards
protect consistency not expressed by multiple-value
declaration alone: FI may produce NIL with `:claimed` or writer with a nonclaim
outcome while staying in declared types. A foreign status instead violates
the delegate's ftype contract.

Function-replacement FI must be quiescent and
restore original. Coverage campaign must retain native
denominator, declare which defensive branches compiler preserves, and
distinguish these tests from nominal results. Reading excludes no branches
from denominator, certifies no C3 threshold, and infers no PASS merely because
unexpected return is impossible for a correct function.

<a id="limiti-di-qualificazione"></a>

## Qualification limits

Integration executes no payloads and does not decide handling of a FAULTED
Archivio. Physical startup/shutdown, park/wake, dead workers, sensors, message
admission, and complete server dispatcher remain outside scope. Phase
gates, complete engine, and REQ-THR-001 are not closed by this review.
