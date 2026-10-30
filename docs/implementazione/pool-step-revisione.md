<a id="revisione-indipendente-del-passo-poolserie"></a>

# Independent review of the pool/Serie step

Static reading on 2026-10-15, base
`5be241d8f295e3c82df06e75c9b12e0bf75eb202`, performed by an agent other than
the author. Outcome: **positive for the C3 scope read**, with no open findings
on the product. The reviewer modified only this document and ran no
campaigns: the reading does not attest to compilation, tests, coverage,
or allocations.

The applied framework includes [ADR-0031](../adr/0031-software-critico-criteri-e-priorita.md),
[ADR-0034](../adr/0034-policy-di-compilazione-e-standard-di-codifica.md),
[ADR-0045](../adr/0045-modello-di-esecuzione.md), and the
[coding standard](../affidabilita/standard-di-codifica.md).
The [contract](pool-step.md),
[preregistered method](pool-step-metodo.md), all seven dispatch sources,
ASDF order, sixteen new tests, and C4 sensor were read. Delegated barriers
remain distinct from the new C3 policy; this reading does not replace
review or qualification of C1 components.

<a id="identità-dello-scope"></a>

## Scope identity

The qualification denominator includes all seven dispatch files,
without manual exclusions or restriction to new lines. Per-file counts
and all missing forms in the new entry point must also be published.
C1 delegates are outside the C3 denominator; no coverage or
MC/DC equivalence is deduced from types or source.

| Source read | SHA-256 |
|---|---|
| `src/dispatch/package.lisp` | `98f56140a06f18597e125c13dfa9593f9594daf129bde17c26f75bf1f4252669` |
| `src/dispatch/types.lisp` | `cc44882c565a89de08f5add79333868ebfca4fc3f97bf9104d36375d014d4720` |
| `src/dispatch/build.lisp` | `c78d31a753db78baea520e9ea0cccf6e88cad9cca8bc75261a6ff26c2ac01fe5` |
| `src/dispatch/claim.lisp` | `224e4114b8b91affced874bea9c23cae5c79526e8ddae62e31a0cafcbb763682` |
| `src/dispatch/recycle.lisp` | `9fa3294cd28d1904cfb8db5153f93188b02f1bfbaf1800dad788731007c29ad0` |
| `src/dispatch/begin.lisp` | `4ae4bf8f6b7afe53af099a4b37ad75d253c05077f0cc7fbe39f4f1cab9f89a8d` |
| `src/dispatch/step.lisp` | `0d7653e6cbc0d93295f2ee1f84d142602af795933bf3147de9fc462c476212de` |
| `arcdocdb.asd` | `35df1308676510bde78858c31c756b3f976f8ee0aeb17d8e520d51f7f8506fd0` |
| `tests/scheduler/pool-step.lisp` | `d3e71761c6c27e3f90fb445eb1994e3c567812ea5e512acf10e36232ef26fc31` |
| `tools/measure-pool-step.lisp` | `91cc73d2d1550312c60b9ff5b3e74561ce38dbcd3960ff013613ff811b86862c` |
| `docs/implementazione/pool-step.md` | `d01df081f65cd39a2bbff0377bfc737a76e3e098aae4f99702d1575df3a5775c` |
| `docs/implementazione/pool-step-metodo.md` | `a4eca30aab6b238a4367cbacadee9a88e9b7c517315c29ead4a178ae25f232d2` |

Delegated sources determining selection and transport are unchanged:

| Delegated source | SHA-256 |
|---|---|
| `src/scheduler/pool-claim.lisp` | `e384f6091a5fcb506e718e12e77b06ab8dd4233a41024bc57ca3b14425e10b14` |
| `src/execution/worker-types.lisp` | `62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317` |
| `src/execution/worker-claim.lisp` | `62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e` |
| `src/execution/worker-boundary.lisp` | `4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a` |
| `src/execution/ready-recycle.lisp` | `2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b` |
| `src/series/routing-select.lisp` | `796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a` |

Fingerprints identify the bytes read. Subsequent qualification must
compare them with frozen bytes, without deducing a PASS from the table.

<a id="scelta-esclusiva-e-metadati"></a>

## Exclusive selection and metadata

The new entry point coordinates selection among three existing operations,
without adding mutable state for obligations, leases, or tokens. It checks port
type, owner, table type, and EQ context identity before
reading phase through the public execution getter. Closure of the previous bridge
and absence of reentrancy remain caller preconditions:
no scan of all links or proof of quiescence is introduced.

IDLE delegates the new governed claim and returns its original link/status,
`:claim` origin, cursor, and action. CLAIMED delegates only
connection of the current obligation: `:claimed/:current` describes the writer
already owned without asserting a new claim. Detail and action are NIL.
RESCHEDULE delegates one recycle and returns `:recycle` origin, partition
count, and NIL action. This last NIL means the pool was not
consulted, without inventing an `:unchanged` observation.

Each branch invokes one operational entry point and at most one ready transfer.
Room ends the IDLE step without falling through to another claim; full
returns the new CLAIMED link without beginning it. A subsequent step
can therefore select current, while the caller explicitly begins and closes
the bridge. Repeating current does not advance work by itself.

The step does not read lifecycle during CLAIMED/RESCHEDULE obligations or
revoke obligations already assumed. Pending retirement applies only in
a subsequent IDLE step. Perpetual full exchanges do not guarantee a return
to IDLE; EMPTY and BUSY remain local observations without authority over parking
or shutdown. Count and cursor are neither interchangeable nor global snapshots.

<a id="rifiuti-barriere-e-compilatore"></a>

## Rejections, barriers, and compiler

RUNNING, BATCH, FINISHING, and FAULTED are rejected before any
operational entry with `resource-exhausted :worker-state`. The getter
checks owner and reads phase without checking lease or debt: the new
C3 rejection does not replace the first cause or revalidate active/terminal
context fields. Shapes of accepted phases are instead checked
by original delegates, with their C1 boundaries.

`%passo-dispatcher-fase` is NOTINLINE and accepts phase as T. The four
known disallowed phases are distinct from the final branch signaling
`invariant-violation :pool-dispatcher-state`. An FI beyond the getter's
ftype thus exercises an operational defense without attributing it to the
nominal C1 contract or promoting the compiler to a qualified runtime.

Claim BUSY is a return with a cursor; guard busy during recycle
remains a condition with RESCHEDULE and obligation preserved. There are
no new handlers, success conversions, retries, cleanup, or rollback.
Failed routing after full preserves the already successful exchange; after a claim
with activation it preserves the previous ACK. Reference, home, and cause
remain in the context according to original barriers. C3 does not write faults,
writer fields, ring, or controller, and applies no further result
checks after transfer.

<a id="lista-di-controllo"></a>

## Checklist

The twelve C1 items are used as an additional check in the single
C3 pass required by ADR-0031.

| Item | Static assessment and limitation |
|---|---|
| 1. Requirements and ADRs | REQ-THR-001, REQ-CON-001/002/004/005, and REQ-AFF-008 traced; bounded task selection and per-segment transport consistent with ADR-0045 §6/8. The complete engine remains open. |
| 2. Invariants | Binding before phase; one exclusive entry; no new admission with a current obligation; published ends the step. Previous bridge closure is a precondition, without new global proof. |
| 3. Errors | Owner/binding and delegated conditions retain reasons and order; known and unexpected phases have distinct rejections. No new fault marking or replacement of the C1 cause. |
| 4. Bounds | No new loop, recursion, retry, callback, or wait. Selection O(1), current/recycle O(1); only claim can scan up to 64 shards. |
| 5. Allocation | No new structure, list, closure, hash, or state in the hot path. Zero heap requires separate measurement and does not follow from reading the wrapper. |
| 6. Results | Five values with explicit origin: cursor/count/NIL and lifecycle/NIL retain distinct meanings. No error result ignored, no new token or capability. |
| 7. Decisions | New helper: 17 defun lines, complexity 5; public entry: 11 lines, complexity 1. Other functions remain within 60 lines and 10 paths; no new C1 compound decision. |
| 8. Ownership | Dispatcher and context belong only to the creating thread, with immutable references; no duplication of execution state or new sharing. Execution owner rechecked by getter/delegates. |
| 9. Traceability | REQ on both definitions and sixteen tests; export and ASDF order after original entries correct. Strict build, lint, trace, and full check are separate process attestations. |
| 10. Standard | Safety 3, ftype, docstring, OWNER/SHARED, and typed case default; NOTINLINE preserves domain T at the boundary. No generic handler, new macro, removed C1 check, or deviation identified. |
| 11. Parallelism | No new lock, global counter, or shared write per message; ready access delegated per segment. Owner-only selection does not demonstrate overlap, fairness, or scalability. |
| 12. Durability | No payload, CSN, file, or durable protocol changed by new code. No new persistent atomicity or deletion to qualify. |

<a id="lettura-delle-sedici-prove"></a>

## Reading the sixteen tests

Tests were read without execution. Call counters forward
to the actual selected APIs; sentinels and FIs are quiescent and
restored. The distinct-owner case is a negative test, claiming no
new positive concurrent work or overlap from a start barrier.

| Group | Fixture evidence planned and limitation |
|---|---|
| Active IDLE | Activation/ACK precede the real claim; five values, home distinct from cursor, IDLE link without lease. EMPTY and actual busy guard check one call and original rotation. |
| Inactive IDLE/retirement | Real work in the ring, scan sentinel, and preserved cursor; retirement acknowledged before ready. No global quiescence deduced. |
| CURRENT | Adoption with inactive port, corrupt words, or pending retirement; equal images, one lookup, NIL metadata, and no gate/begin. Completion and ACK remain explicit. |
| Room | Capacity 2 and three shards distinguish count 2 from cursor 0; one recycle, FIFO B then A, and pending ACK preserved. Only the subsequent IDLE step acknowledges retirement. |
| Full | Real A→B exchange and B IDLE link, then current step without new mutations; old A remains in the ring and is completed by the caller. |
| Recycle busy | CAS guard actually held, original condition, and complete images equal; distinct from the claim's BUSY return, without internal retry. |
| Phases and check priority | Real RUNNING/BATCH/FINISHING and diagnostic FAULTED rejected with zero entries; binding and foreign owner precede getter and operations. First cause EQ and capabilities preserved. |
| Fault after transfer | Full with foreign writer preserves old A in ring and new reference/home in FAULTED; claim with activation preserves ACK and cause. Controller and lease remain intact. |
| Getter and type boundary | Six out-of-ftype values rejected with invariant and zero entries, including with preexisting FAULTED cause; getter FI distinct from nominal state. Invalid-type dispatcher has a separate test. |

<a id="sensore-e-limiti-della-qualifica"></a>

## Sensor and qualification limitations

The sensor read plans two campaigns, each with five replicas using
a fresh fixture, 4096 cycles, and 128 warmup cycles. Each EMPTY cycle performs four
steps on four empty shards and checks cursors 1/2/3/0. CURRENT-INACTIVE
holds a real CLAIMED with an inactive port and checks four lookups,
five values, identity, cursor 1, and IDLE link without new leases.

Factory, API resolution, initial claim, GC, and cleanup remain outside the clock.
CURRENT's final public drain consumes and acknowledges the payload and finishes
the IDLE writer; it is not presented as engine shutdown. The clock
includes delegates and scalar oracles, without isolated wrapper measurement.
INACTIVE IDLE appears only in self-tests; RECYCLE has a synthetic sensor
oracle and product tests, without measured latency. Begin, CLOSING, payload,
contention, and concurrent coordinator are not measured by the campaigns.

Self-tests plan five mismatched returns, deliberate heap allocation, wrong sink,
below-resolution clock, rejected CLI/destinations, and preserved partial raw output.
The reading does not attest to their execution. Separate records are required for
native/HTML coverage, per-file counts, C3 gate, heap, replicas, and copies
of originals. No new guarantee about message admission, sensors,
park/wake, physical startup/shutdown, dead workers, or Archivio coordination;
no complete-engine requirement is closed by this review.
