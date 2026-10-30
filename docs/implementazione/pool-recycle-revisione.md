<a id="revisione-indipendente-del-ricircolo-poolserie"></a>

# Independent pool/Serie recycling review

Static reading on 2026-10-14 at base
`a5715a1aa0b2571d650d1b794e9bb7b7324e951e`, performed by an agent other
than the code author. Outcome: **positive for the C3 scope read**, with
no open product findings. The reviewer modified only this
document; they did not run campaigns and do not attest compilation, test
results, coverage, or allocations.

The applied framework includes [ADR-0031](../adr/0031-software-critico-criteri-e-priorita.md),
[ADR-0034](../adr/0034-policy-di-compilazione-e-standard-di-codifica.md),
[ADR-0045](../adr/0045-modello-di-esecuzione.md), and the
[coding standard](../affidabilita/standard-di-codifica.md).
Read: the [contract](pool-recycle.md),
[preregistered method](pool-recycle-metodo.md), five dispatch sources,
ASDF order, thirteen new tests, existing dispatch fixtures, and
C1 barriers for recycling, execution context, routing, and Serie bridge.

<a id="identità-e-denominatore"></a>

## Identity and denominator

Qualification scope is the entire extended dispatch component: five
files, without manual exclusions or restriction to new lines. Counts
must also be published per file, including `recycle.lisp`;
an aggregate threshold does not replace reporting its missing paths.
C1 delegates do not enter the C3 denominator and are not reclassified.

| Source read | SHA-256 |
|---|---|
| `src/dispatch/package.lisp` | `7f1eea26b8d8fd34186a85cff9aebae5842dc731de45b361058e0af4788090e8` |
| `src/dispatch/types.lisp` | `cc44882c565a89de08f5add79333868ebfca4fc3f97bf9104d36375d014d4720` |
| `src/dispatch/build.lisp` | `c78d31a753db78baea520e9ea0cccf6e88cad9cca8bc75261a6ff26c2ac01fe5` |
| `src/dispatch/claim.lisp` | `224e4114b8b91affced874bea9c23cae5c79526e8ddae62e31a0cafcbb763682` |
| `src/dispatch/recycle.lisp` | `9fa3294cd28d1904cfb8db5153f93188b02f1bfbaf1800dad788731007c29ad0` |
| `arcdocdb.asd` | `ef5423225107a6b33e1eb71d4713dfd77ad441e5af6e07cdb2c95bf0bbb0ffb6` |
| `tests/scheduler/dispatch.lisp` | `600eb0b5fdf9a52d020e2f4c638f0f3dba43d9d9711be73eaffff208578821eb` |
| `tests/scheduler/pool-recycle.lisp` | `079a58b0c8850df0be62c71229e25d052fb716f36f1996e9e8ab2c4c2a38fa86` |
| `tools/measure-pool-recycle.lisp` | `f9f33a86334719cf22a0c6d9f27ccae426895c247c67044ddf52b70200b05c7a` |
| `docs/implementazione/pool-recycle.md` | `65da387e05a4179fc930e440f4068a6025c9afc5f22d7917ac5bc748457b44ff` |
| `docs/implementazione/pool-recycle-metodo.md` | `a3abb270ad16b8eb2262411faba5091dbe4fbaea54c6b30bf376f1339d56babb` |

Delegated sources decisive for the new step remained unchanged:

| Barrier | SHA-256 |
|---|---|
| `src/execution/worker-claim.lisp` | `62804d27d1c5f734f16a0b498a7870afd8b9654c0140ce75bb98209f3834cb7e` |
| `src/execution/worker-types.lisp` | `62412828a90415bfef28c42f3e839c436c53652f86ffbf9a970d52682c769317` |
| `src/execution/worker-boundary.lisp` | `4a01d44c33c4019f8d6e98e26d37d2b36c96f63370951859f8c3adfb5eddb39a` |
| `src/execution/ready-recycle.lisp` | `2873a5f4bb34a5e0119af41bdc1220c4c02767b985ade16c7437e4e7d13e525b` |
| `src/series/routing-select.lisp` | `796e3ace762dd6c3d86119981a37c1904a637e664551ca0f5289544f0806714a` |
| `src/series/worker-run.lisp` | `f448442c5f9233f492bb8642206ec4913f7b2f5f3c9a1fdf05896a439f1d429f` |

Fingerprints identify this reading's bytes. Subsequent qualification
must compare them with frozen bytes, without inferring a PASS from this table.

<a id="un-trasferimento-e-obblighi-conservati"></a>

## One transfer and retained obligations

The new API reuses immutable binding between pool gate and local
table. `%check-dispatcher-binding` checks gate type, owner, table
type, and EQ context identity before calling execution.
It reads only gate references and owner; it does not read request, ack, or
active and does not call the lifecycle gate.

`ricircola-collegamento-pool` invokes a single `ricircola-worker`, which requires
RESCHEDULE and unique obligation without lease or batch. C1 operates only on the
home partition. With room, the old writer passes to the ring and the context
returns to IDLE: the new entry point returns NIL, `:published`, and count, without
routing, polling, or a second claim. Retirement may be applied only
by the next explicit claim on the free context.

With a full ring, C1 publishes the old obligation and hands the head to the
worker within the same protected section. The new entry point resolves the link
of the now CLAIMED writer through checked ordinal and identity. The link
remains IDLE: no begin, token, or Serie lease is introduced. Home and
cursor remain those of execution; count describes the local transfer,
without being a cursor or a snapshot at return time.

Pending retirement or an inactive gate does not revoke the obligation. A chain of
full swaps may continue assigning CLAIMED and does not guarantee return
to IDLE under perpetual saturation. The dispatcher acquires no authority over
park, wake, shutdown, or Archivio coordination.

Guard busy retains RESCHEDULE, writer, and home; every retry is explicit.
Invalid routing after swap instead retains the already successful
transfer: old writer in ring, new reference and home in the worker
FAULTED through the C1 barrier. There is no rollback, yield, cleanup,
or new C3 handler. No unchanged preimage is promised after such partial
success; routing acquires no controller or Serie lease.

<a id="guardia-del-risultato-e-compilatore"></a>

## Result guard and compiler

The C1 outcome is nominally restricted by its ftype to `:claimed/:published`.
A `case` applied directly to that result is insufficient to demonstrate
operational rejection of values violating the contract: the compiler
may eliminate the branch it considers impossible.

The version read introduces `%check-recycle-status`, with argument T and
NOTINLINE, before result dispatch. The guard checks the domain
within its body and signals `invariant-violation :pool-dispatcher-state`
without writing fault or state. Its restricted return then allows
specialization of the second `case`, which still retains an explicit final branch.
The two writer/NIL guards separately check the relationship among values
that ftype alone does not express.

Foreign-status FI exercises this C3 barrier, not a nominal
C1 return. The FAULTED variant deliberately replaces the delegate:
it does not show that real C1 permits recycling from FAULTED. All
substitutions are quiescent and restored. Native denominators must
remain those produced by SB-COVER, even if a later defensive branch
generates no probes; MC/DC or coverage is not inferred from source alone.

<a id="lista-di-controllo"></a>

## Checklist

The twelve C1 points are used as an additional check for the single
C3 pass required by ADR-0031. This reading does not replace the two
reviews or other checks of C1 delegates.

| Point | Static assessment and limit |
|---|---|
| 1. Requirements and ADR | REQ-THR-001, REQ-CON-001/002/004/005, and REQ-AFF-008 traced; one ready access per slice and nonsuspending tasks consistent with ADR-0045 §6/8. Complete pool remains open. |
| 2. Invariants | Binding checked before transfer; one C1 call; routing only for non-NIL CLAIMED; published ends IDLE without new claim. Unique obligation and previous closed bridge remain caller preconditions. |
| 3. Errors | Binding/owner reasons reused; phase, busy, and fault delegated without hiding. State and writer/status relation have typed C3 rejection without mutation or replacement of first cause. |
| 4. Bounds | No new loop, recursion, retry, callback, or wait. O(1) home recycling, single-attempt guard, and O(1) routing; no Serie or partition scan. |
| 5. Allocation | No constructor, list, closure, hash, or new state on the hot path. Zero heap requires the measured campaign: it does not follow from static reading. |
| 6. Results | All three results used; status validated with T/NOTINLINE argument, writer checked against outcome, original count forwarded without inventing a new meaning. |
| 7. Decisions | New helper: complexity 2, 7 defun lines; new API: complexity 5, 22 lines. Binding 5, factory 2, claim 5, and lookup 1; no function exceeds 60 lines or 10 paths. No new C1 compound decision. |
| 8. Ownership | Dispatcher, context, table, and link remain with the creating thread; owner and EQ context checked before delegation. No new migration, reentrancy, or global mutable structure. |
| 9. Traceability | REQ on new definitions and thirteen tests; export and ASDF after claim correct. Strict build, lint, trace, and full check must be attested by separate processes. |
| 10. Standards | Safety 3, explicit ftypes, docstrings, and OWNER/SHARED; typed case endings. No ignore-errors, generic handler, cleanup, or removal of C1 checks. No deviation identified in the product read. |
| 11. Parallelism | One guard of its own shard per slice; no common lock, global counter, or shared write between Serie per message. This reading does not prove fairness, starvation freedom, or scalability. |
| 12. Durability | No payload, controller, CSN, or file modified by new code. No durable change or deletion; no new persistent atomicity to qualify. |

<a id="lettura-delle-prove-e-del-sensore"></a>

## Test and sensor reading

The thirteen new tests were read without running them. Fixtures use
real C1 primitives and bridges where stated; protocol and function
FI remain distinct from concurrent interleavings.

| Group | Expected fixture evidence and limit |
|---|---|
| Room | Three shards and capacity 2 separate home/count/cursor; FIFO B then A, one recycling call, and routing/gate/ACK sentinels. Controllers intact and final links IDLE. |
| Full | Real A→B swap on home different from cursor, unchanged count, B link IDLE without begin; other shards and writer/controller states compared. Subsequent bridge is explicit. |
| Ready busy | Real guard held through CAS; comparison of ring, context, writer, link, controller, and pool words. Retry only after rejection. Not random contention stress. |
| Phases and first cause | IDLE, CLAIMED, RUNNING, BATCH, and FINISHING obtained through real operations; FAULTED injected separately. Rejections retain debt, leases, and EQ cause. |
| Pool independence | Quiescent inactive gate, corrupted words, and pending retirement, with gate sentinels; completion of new CLAIMED and ACK only on next IDLE claim. Separate room test for no implicit ACK. |
| Binding and owner | Different contexts and owner on a distinct real thread rejected before transfer; snapshot and recycling sentinel. Not a test of permitted migration. |
| Fault after full | Writer foreign to routing: real swap already successful, reference/home and cause retained, old A observed in ring. Controller and Serie lease intact; no rollback inferred from error. |
| Results and type | Contradictory writer/status within types, invalid dispatcher, and six statuses outside ftype. Rejection before routing, one interposed call, and equal images; first FAULTED cause retained in separate FI. |
| Ready invariant | Invalid head within INDEX type, checked under real guard: original C1 cause, writer, and diagnostic data retained; subsequent rejection without replacing cause. |

The C4 sensor read uses new fixtures per replicate, preallocated payloads,
quantum one, and one recycle per cycle. ROOM adds an explicit claim;
FULL alternates the two writers. Timed begin, pop, ack, and end are
execution operations: the bridge remains IDLE and no Serie lease is acquired.
Scalar oracles, C1 protocol, and routing are part of timing;
the adapter alone is not measured. Factory, API resolution, GC, and bounded public
drain remain outside timing. Nominal drain does not qualify Archivio
shutdown after fault.

Sensor self-tests include deliberate positive heap, wrong sink,
sub-resolution clock, three mismatched results, rejected CLI/destinations,
and retained partial raw data. Reading these checks does not attest
their execution. C3 threshold, SB-COVER/HTML comparison, per-file counts,
replicates, and original retention require separate records.
Engine payloads, real sensors, admission, park/wake,
dead workers, physical startup/shutdown, or a concurrent coordinator are not qualified.
