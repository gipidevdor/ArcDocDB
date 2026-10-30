<a id="adozione-dellactive-nel-runtime"></a>

# Adopting ACTIVE into runtime

Method preregistered before runs. [Archivio bootstrap](runtime-archivio.md)
supplies CSN/snapshot/EBR family. Increment connects new
prepared ACTIVE to real controller, makes previously declared
one-controller-per-log obligation verifiable.

<a id="contratto-e-proprietà"></a>

## Contract and ownership

`crea-controllore-serie` retains configurable root/offset/capacity.
Before publication checks budgets, healthy segment log, preallocated
ring. CAS moves log's private slot NIL → controller.
Second constructor, even with different register, signals
`invalid-argument :serie-log-bound`. No reset. No lease or
CSN allocation acquired by factory. Pre-CAS errors do not
publish candidate; concurrent attempt may publish its own.

`trova-controllore-serie(log)` loads once, acquires, returns
NIL/canonical reference. Checks type/reverse binding to same
log; foreign slot or another log's controller signals
`invariant-violation :serie-log-binding`. Getter samples neither health,
ring, nor lease. Recovers binding even after interrupted return;
latter remains static argument without product hook.

Binding invariant requires failed opening, stopped bootstrap/
adoption, no admission. Coordinator isolates through authoritative
references: getter cannot mutate foreign controller held in
corrupt slot. Before CAS, postchecks/ring make private
candidate FAULTED through `%serie-invariant`, without changing log or
concurrent winner. Overall COD-24 conformance remains open
until general stop boundary implemented/verified;
no exception inferred from existing recovery APIs.

Binding concerns **canonical log object**, not every possible
wrapper/opening of same file. Physical exclusion/wrapper uniqueness
remain owner responsibilities. Rotation creates new log/controller; old
stays alive until borrowers retire. Opaque `t` slot avoids
WAL/Serie ASDF cycle; one productive CAS writer, no per-document/
batch/GET access. Reverse reference GC-managed; no automatic
FD closes. Private layout changes: rebuild without old instances.

<a id="adozione-verificata"></a>

## Verified adoption

`runtime:adotta-controllore-active(runtime, prepared, :capacity 64)` requires:

- prepared view in **same EQ scope** as runtime; scope clone
  reusing same snapshot/CSN register rejected;
- healthy segment log, full ID/version matching GET capability,
  writer origin;
- association proof of exact, still-open read-only/append
  capabilities;
- append written/durable frontiers both 64.

All before binding. Real factory receives runtime CSN,
NIL root, next-offset 64; returns empty ring without lease.
Scope/start rejections `invalid-argument :runtime-active-scope/started`;
inconsistent identity `invariant-violation :runtime-active-identity`.
Budgets/log/capabilities propagate canonical conditions. No I/O,
clock, changed CSN register, new lock protocol.

Prepared result proves physical preparation; **does not prove catalog
EDIT decision**. Caller completes decision before initializing/
publishing sources or using controller. Lease, prepared GET source,
root follow existing APIs. Binding volatile publication, without
new durable atomicity point. Recovery Manager/admission
gate open, as is owned collection of old sources.

<a id="decisioni-e-prove-previste"></a>

## Decisions and planned tests

| ID | Obligation |
|---|---|
| RCA-D01 | Capacity/offset budgets, healthy log before construction/publication |
| RCA-D02 | NIL binding or exact-log controller; type/binding FI |
| RCA-D03 | First binding, double startup, losing CAS; 2/4 workers with bounded joins |
| RCA-D04 | EQ scope, including clone with same CSN; no binding on rejection |
| RCA-D05 | Consistent ID AND version AND origin; separate FI |
| RCA-D06 | Exact association/open capabilities; written AND durable frontiers 64 |
| RCA-D07 | One CSN for writer/snapshot; first new batch M+1, u32 carry |
| RCA-D08 | Consistent root/GET after publication; previous files/bootstrap registers intact |
| RCA-D09 | Candidate: EQ register AND EQ log before CAS; both defensive conditions |
| RCA-D10 | Candidate: EQ slot vector AND exact offset before CAS; both defensive conditions |

Generic binding tests `tests/series/log-binding.lisp`; runtime
integration `tests/runtime/adoption.lisp`. Positives build plans/
ACTIVE through public APIs, v1/v2/native FDs. Declared serial FI,
without changing CL primitives; no admission inferred from success.
Old default fixture built directly without explicit capacity:
recreating two controllers on same log would violate contract.

Agents with disjoint write sets; closed before runs, committed revision,
frozen sources. Every diagnostic/check uses recorder even
on error. `runtime-active` coverage: three exact files (new
`runtime/active`, `series/types`, `wal/types`), counters reset after load,
runtime/Serie suites. Historical scopes unchanged. Self-test
checks inclusion/exclusion/missing branch. Raw denominators/generated
code visible; SBCL forms/branches not MC/DC.

Two static readings independent of runtime-module author
recorded separately from coordinator rereading. Common collector
collection, hashes, independent closed-inventory check. Excluded:
reconstructible caches/C4 negative-case inputs; structured
results remain in original reports. No new benchmark: no
new hot path, bootstrap/GC costs/reference platform
unmeasured. C1/MC/DC qualification, engine obligations open.

<a id="revisione-statica-prima-dei-run"></a>

## Static review before runs

Two readings by Hume, reviewer distinct from authors; author/
coordinator rereadings separate. Reviewer executed/modified nothing.

| C1 checklist | Outcome of both readings |
|---|---|
| 1–3: requirements, invariants, errors | Contracts/typed reasons inventoried; local FI planned |
| 4: bounds | Factory capacity-bounded; adoption without loops/waits |
| 5: allocations | Bootstrap construction; no GC/RSS-cost measurement |
| 6: boundaries | Checks before binding; only return after successful CAS |
| 7: decisions | RCA-D01…D10; defensive postchecks in denominator |
| 8: ownership | One CAS per log, no reset; foreign objects not mutated |
| 9: traceability | Regeneration/full check planned after freeze |
| 10: standard | Overall COD-24/C1 qualification open; no declared exception |
| 11: parallelism | Per-log slot; no added per-operation coordination between Serie |
| 12: durability | No new durable point; explicit external catalog decision |

Findings incorporated before freeze: inventory of both compound
postchecks; `%serie-invariant` on private candidate with early `ftype`;
coordinator obligation to stop bootstrap/adoption on corrupt
binding. Final rereading of all three changes: no new finding.
Binding tests eight; adoption eleven, with 26 parameterized cases
declared by author. Counts inventory,
not run outcomes.

<a id="risultati"></a>

## Results

[Campaign of 2026-10-16](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-16-runtime-active/report.md)
preserves 19 new tests, 147 runtime/Serie tests, raw coverage, full
local check. Also preserves two initial failures/three variants;
general COD-24 boundary, admission, C1/MC/DC open.
