<a id="adozione-dellactive-nel-runtime"></a>

# Adopting ACTIVE into runtime

The method was preregistered before runs. [Archivio bootstrap](runtime-archivio.md)
supplies the CSN/snapshot/EBR family. This increment connects the new
prepared ACTIVE to a real controller and makes the previously declared
one-controller-per-log obligation verifiable.

<a id="contratto-e-proprietà"></a>

## Contract and ownership

`crea-controllore-serie` retains configurable root/offset/capacity.
Before publication it checks budgets, a healthy segment log, and a preallocated
ring. CAS changes the log's private slot from NIL to controller.
A second constructor, even with a different registry, signals
`invalid-argument :serie-log-bound`. No reset. The factory acquires no lease or
CSN allocation. Pre-CAS errors do not
publish the candidate; a concurrent attempt may publish its own.

`trova-controllore-serie(log)` performs one acquire load and returns
NIL or the canonical reference. It checks type and reverse binding to the same
log; a foreign slot or another log's controller signals
`invariant-violation :serie-log-binding`. The getter samples neither health,
ring, nor lease. It recovers the binding even after an interrupted return;
the latter remains a static argument without a product hook.

A binding invariant violation requires opening to fail, bootstrap/
adoption to stop, and admission to remain closed. The coordinator isolates the fault through authoritative
references: the getter cannot mutate a foreign controller held in
a corrupt slot. Before CAS, postchecks and ring checks make the private
candidate FAULTED through `%serie-invariant`, without changing the log or
a concurrent winner. Overall COD-24 conformance remains open
until the general stop boundary is implemented and verified;
no exception inferred from existing recovery APIs.

Binding concerns the **canonical log object**, not every possible
wrapper or opening of the same file. Physical exclusion and wrapper uniqueness
remain the owner's responsibilities. Rotation creates a new log/controller; the old one
stays alive until borrowers retire. An opaque `t` slot avoids
a WAL/Serie ASDF cycle; there is one successful CAS writer, with no per-document,
per-batch, or GET access. The reverse reference is GC-managed; FDs are not
closed automatically. The private layout changes: rebuild without old instances.

<a id="adozione-verificata"></a>

## Verified adoption

`runtime:adotta-controllore-active(runtime, prepared, :capacity 64)` requires:

- a prepared view in the **same EQ scope** as the runtime; a scope clone
  reusing the same snapshot/CSN registry is rejected;
- healthy segment log, full ID/version matching GET capability,
  writer origin;
- association proof of exact, still-open read-only/append
  capabilities;
- append written/durable frontiers both 64.

All checks precede binding. The real factory receives the runtime CSN,
a NIL root, and next-offset 64; it returns an empty ring without a lease.
Scope/start rejections `invalid-argument :runtime-active-scope/started`;
inconsistent identity `invariant-violation :runtime-active-identity`.
Budget, log, and capability checks propagate canonical conditions. There is no I/O,
clock access, CSN registry change, or new lock protocol.

The prepared result proves physical preparation; it **does not prove the catalog
EDIT decision**. The caller completes that decision before initializing or
publishing sources or using the controller. Lease, prepared GET source,
and root follow existing APIs. The binding is a volatile publication, without
a new durable atomicity point. The Recovery Manager/admission
gate remains open, as does the owned collection of old sources.

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

Generic binding tests are in `tests/series/log-binding.lisp`; runtime
integration tests are in `tests/runtime/adoption.lisp`. Positive cases build plans
and ACTIVE through public APIs, using v1/v2 formats and native FDs. Serial FI is declared,
without changing CL primitives; no admission is inferred from success.
The old default fixture was built directly without explicit capacity:
recreating two controllers on the same log would violate the contract.

Agents have disjoint write sets and finish before runs; the revision is committed
and sources are frozen. Every diagnostic/check uses the recorder, including
on error. `runtime-active` coverage: three exact files (new
`runtime/active`, `series/types`, `wal/types`), counters reset after load,
runtime/Serie suites. Historical scopes unchanged. The self-test
checks inclusion, exclusion, and a missing branch. Raw denominators and generated
code are visible; SBCL forms/branches are not MC/DC.

Two static readings independent of the runtime-module author
are recorded separately from the coordinator's rereading. Collection uses the common collector,
hashes, and an independent closed-inventory check. Reconstructible caches and C4 negative-case
inputs are excluded; structured
results remain in original reports. There is no new benchmark because there is no
new hot path; bootstrap/GC costs and the reference platform
remain unmeasured. C1/MC/DC qualification and engine obligations remain open.

<a id="revisione-statica-prima-dei-run"></a>

## Static review before runs

Hume performed two readings as a reviewer distinct from the authors; author
and coordinator rereadings remain separate. The reviewer executed or modified nothing.

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
binding. The final rereading of all three changes found no new issue.
The author declared eight binding tests and eleven adoption tests, with 26 parameterized cases.
These counts are an inventory,
not run outcomes.

<a id="risultati"></a>

## Results

The [campaign of 2026-10-16](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-16-runtime-active/report.md)
preserves 19 new tests, 147 runtime/Serie tests, raw coverage, and a full
local check. It also preserves two initial failures and three variants;
the general COD-24 boundary, admission, and C1/MC/DC remain open.
