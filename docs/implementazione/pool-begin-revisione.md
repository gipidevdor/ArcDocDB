<a id="revisione-indipendente-dellavvio-poolserie"></a>

# Independent review of pool/Serie startup

Static reading on 2026-10-14, base
`ad829a40f6ce72837b59982d2e4f83e8c9ca9f3e`, by an agent other
than the author. Outcome: **positive for the C3 scope read**, without open product
findings. Reviewer changed only this document and ran no
campaigns: the reading certifies neither compilation, tests, coverage,
nor allocations.

Applied framework includes [ADR-0031](../adr/0031-software-critico-criteri-e-priorita.md),
[ADR-0034](../adr/0034-policy-di-compilazione-e-standard-di-codifica.md),
[ADR-0045](../adr/0045-modello-di-esecuzione.md), and the
[coding standard](../affidabilita/standard-di-codifica.md).
Read: [contract](pool-begin.md),
[preregistered method](pool-begin-metodo.md), all six dispatch sources,
ASDF order, fourteen new tests, and C4 sensor. Reading
C1 routing, worker, and bridge barriers complements C3 component reading;
it does not replace their reviews or class verification.

<a id="identità-dello-scope"></a>

## Scope identity

Qualification denominator includes all six dispatch files,
without manual exclusions or limiting it to new lines. Results
must retain per-file counts and missing entries in the new entry point too.
C1 delegate probes are outside the C3 denominator; no coverage
or MC/DC equivalence is inferred from types or reading.

| Source read | SHA-256 |
|---|---|
| `src/dispatch/package.lisp` | `34ecf62cd625f8af0a884d713563338c88635afd88fd0eaa0ab8ba43d5f19486` |
| `src/dispatch/types.lisp` | `cc44882c565a89de08f5add79333868ebfca4fc3f97bf9104d36375d014d4720` |
| `src/dispatch/build.lisp` | `c78d31a753db78baea520e9ea0cccf6e88cad9cca8bc75261a6ff26c2ac01fe5` |
| `src/dispatch/claim.lisp` | `224e4114b8b91affced874bea9c23cae5c79526e8ddae62e31a0cafcbb763682` |
| `src/dispatch/recycle.lisp` | `9fa3294cd28d1904cfb8db5153f93188b02f1bfbaf1800dad788731007c29ad0` |
| `src/dispatch/begin.lisp` | `4ae4bf8f6b7afe53af099a4b37ad75d253c05077f0cc7fbe39f4f1cab9f89a8d` |
| `arcdocdb.asd` | `c9f2d60f0e73f1d951504da145b192584300a161cfd4df90984536fa9a34ec53` |
| `tests/scheduler/pool-begin.lisp` | `ecb295cc76e3308f6e12e7a28b0fb46d517043709bffdac565ef8cbfd866b044` |
| `tools/measure-pool-begin.lisp` | `f572b29c9566c9ab282ef804c8136367beb574c7b57bee4a570bae961cb5c732` |
| `docs/implementazione/pool-begin.md` | `c3ca973e76cea42038adc378fcedb61c7688d50228eaac38821c245b7ed60b5e` |
| `docs/implementazione/pool-begin-metodo.md` | `70308477c656e8fa44334e14aac68458f9345c38feb988be939e5d61c042b7ac` |

Delegated barriers central to the new entry point are unchanged:

| C1 source | SHA-256 |
|---|---|
| `src/series/routing-select.lisp` | `796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a` |
| `src/series/worker-run.lisp` | `f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f` |
| `src/series/worker-boundary.lisp` | `793d401d1b9acc7b67923d815560f277f3d390ca050740f735f07d88dbacfe73` |
| `src/series/worker-types.lisp` | `a366799fd9b938bfaa48b0ffda228ff8369ab9acb5b5ead7f081dfc66ab2c81a` |
| `src/execution/worker-claim.lisp` | `62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e` |
| `src/execution/worker-boundary.lisp` | `4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a` |

These fingerprints identify bytes read. Campaign records must
check their identity against the frozen copy; the table is not an execution
result.

<a id="avvio-e-conservazione-delle-capacità"></a>

## Startup and capability retention

`inizia-obbligo-pool` accepts no caller link. First it checks
immutable port/table binding with the same checks as other entry points:
port type, owner, table type, and context EQ identity.
Subsequent routing requires full CLAIMED and selects the current writer's
IDLE link by ordinal and identity. After full exchange or
adoption it therefore cannot select the previous slice's link.

Code calls `inizia-worker-serie` only once and forwards link, token,
phase, and reason. It introduces no decisions, checks, or handlers after begin:
no new C3 rejection can separate normal successful acquisition
from token delivery. The bridge's three results retain their
C1 contract; caller handles ACTIVE and CLOSING through explicit APIs.
Negative sensor oracles verify the sensor without attributing new
validation of out-of-contract C1 returns to product.

Writer busy preserves CLAIMED and IDLE link without consuming bridge
generation. Serie busy and exhausted Serie lease return
CLOSING with current token: caller ends explicitly without pop or
new acquisition. Bridge-token limit is distinct and rejected
before writer lease. No permanent reason authorizes infinite
retry, generation reset, or wrap.

Invalid routing precedes begin. Subsequent errors retain
same condition and capabilities under C1 barriers without rollback
or new C3 fault marking. An unexpected error after acquisition does not
return four values: context and preallocated link retain diagnosis
and any references/leases for Archivio coordination.
Caller retains already obtained links; after adoption it may select them first
with `collega-obbligo-pool`. No fault closure is introduced.

The new entry point does not read request/ack/active or call gate, claim, or
recycling. Inactive port, pending retirement, or inconsistent pool words do not
revoke an existing obligation. Retirement still applies only from
explicit acquisition on IDLE context after all obligations have ended.

<a id="lista-di-controllo"></a>

## Checklist

The twelve C1 points serve as an additional check in the single
C3 pass required by ADR-0031.

| Point | Static assessment and limit |
|---|---|
| 1. Requirements and ADRs | REQ-THR-001, REQ-CON-001/002/004/005 and REQ-AFF-008 identified; starting one task per Serie without dedicated thread or wait, consistent with ADR-0045 §6/8. Complete pool remains open. |
| 2. Invariants | Binding before routing/acquisition; current CLAIMED and IDLE link checked by C1; one begin, all four results forwarded. Capabilities neither duplicated nor abandoned by implicit cleanup. |
| 3. Errors | Binding/owner reasons reused; phase, busy and generations delegated without reclassification. Original condition crosses C3 without handler or first-cause replacement. |
| 4. Limits | No new loop, recursion, retry or wait. EQ checks, routing and dual-lease attempt are O(1); no ready/Serie/callback scan. |
| 5. Allocation | No constructor, list, closure, hash or new hot-path state. Zero heap requires separate measurement and does not follow from wrapper syntax. |
| 6. Results | Token, phase and reason forwarded fully with selected link; CLOSING does not lose token. No error result ignored or converted to success. |
| 7. Decisions | New function: 14 defun lines, complexity 1. Binding 5, factory 2, claim 5, lookup 1 and recycling 5 with guard 2 remain within limits; no new compound C1 decision. |
| 8. Ownership | Dispatcher, context, table and link belong to creating thread, non-reentrant; dispatcher references read-only. No new shared structure or mutable global variable. |
| 9. Traceability | REQs on definition and fourteen tests; correct export and ASDF loading after recycle/routing. Strict build, lint, trace and full regression remain separate process checks. |
| 10. Standard | Explicit safety 3, ftype, docstrings, OWNER and SHARED. No generic handler, ignore-errors, new macro, removed C1 check or product deviation identified. |
| 11. Parallelism | Acquires only writer and its Serie per slice, without lock or cross-Serie global write per message. Reading does not demonstrate scalability or absence of starvation. |
| 12. Durability | New code changes no payload, CSN, file or durable protocol. Leases are in-memory capabilities; no new persistent atomicity or deletion. |

<a id="lettura-delle-prove"></a>

## Test reading

Fourteen new tests were read without execution. Contention
cases use actual primitives; FI is quiescent, declared, and
restored, distinct from concurrent interleavings.

| Group | Planned fixture evidence and limit |
|---|---|
| Real ACTIVE | Four values, one begin call and dual leases; payload still queued, no implicit pop/end. Caller performs pop, ACK and end and demonstrates Serie release. |
| Full A→B | Actual C1 exchange, B startup, A in ring and its link/controller intact; A and B then explicitly ended. |
| Adoption and pool | Adopted obligation with inactive port, corrupted words or pending retirement; sentinels on gate, ACK, claim, recycling, pop and end. Retirement acknowledged only at next IDLE acquisition. |
| Writer busy | Actual held guard: identical complete images, CLAIMED/IDLE link and generation retained; later caller retry. Not random contention stress. |
| Serie busy | Actually owned controller, one attempt, CLOSING/token without pop; end does not release another's lease. Recycling/new startup only after explicit closure. |
| Generations | Injected Serie-lease limit produces CLOSING/token; injected bridge-token limit rejects before acquisitions. Resets restore only fixture FI. |
| Binding and owner | Different contexts and actual different owner thread rejected before routing/begin; images/sentinels check order. Invalid dispatcher type has separate test. |
| Phases and cause | IDLE, RUNNING, BATCH, FINISHING and RESCHEDULE reached through real steps; diagnostic FAULTED injected separately. Capabilities, debt and first cause EQ retained. |
| Routing and not-ready | Foreign writer rejected before begin; deliberate public bypass makes another writer not-ready and tests EQ propagation in C1 faults. Bypass is not permitted nominal use. |
| Error after writer lease | FI at second acquire before Serie acquisition: original error, writer lease and reference retained, bridge/worker FAULTED and controllers intact. C4 cleanup of actual lease neither restores contexts nor qualifies product recovery. |

<a id="sensore-e-limiti-della-qualifica"></a>

## Sensor and qualification limits

The sensor read specifies one ACTIVE campaign and five replicates,
each with a fresh fixture, 4096 cycles, and 128 warmup. One actual symbolic payload stays
queued: clock excludes pop, ACK, or payload application. Every
cycle includes new startup with four-value and dual-lease oracle,
bridge end, C1 room recycling, and explicit C1 acquisition. Expected monotonic
token, identities, and states checked without private resets.

Factory, API lookup, GC, and final drain stay outside clock. Public
drain consumes/acknowledges the single payload and completes IDLE before
backend close. Neither isolated wrapper cost, CLOSING,
busy, concurrent coordinator, nor engine throughput is measured.

Self-tests specify four differing results, a CLOSING oracle with
token, deliberate positive heap, wrong sink, below-resolution clock,
rejected CLI/destinations, and preserved partial raw data. Reading these
checks does not certify execution. Separate records are needed for C3 gate,
native/HTML comparison, per-file counts, heap, replicates, and originals.
Payload application, admission, real sensors,
park/wake, dead workers, physical startup/shutdown, and Archivio coordination are not qualified;
this review closes no complete-engine requirement.
