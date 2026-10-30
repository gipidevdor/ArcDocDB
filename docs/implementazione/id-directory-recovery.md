<a id="id-del-nuovo-segmento-dallinventario-della-directory"></a>

# New-segment ID from directory inventory

> Method preregistered on 2026-10-16 before implementation.
> C1 composition increment; no Recovery Manager closure.

<a id="contratto"></a>

## Contract

`scegli-id-segmento-recovery-directory(manifest, directory, …)` returns
three values: proposed u64 ID, next u64 high-water, owned plan.
One `pianifica-riconciliazione-directory` call collects all
names through EOF, checks canonical names/identities, builds plan.
Choice reuses plan; neither reenumerates namespace nor
reconstructs physical descriptors from reconciliation actions.

Plan selection extracted into private helper also shared
with logical-inventory API. High-water, exclusion of
every observed ID, u64 checks, conditions documented in
[ID-proposal contract](id-segmento-recovery.md) unchanged.

Five budgets retain adapter names/defaults/semantics:
`max-files`, `max-segmenti`, `max-names`, `max-total-name-bytes`,
`max-name-bytes`. Even ignored names consume I/O budget. Configuration,
capabilities, inventory, names, identities checked before choice;
original error propagates without partial ID/plan.

Controller owns exclusive/stable manifest/namespace until
exclusive new-temporary creation. Directory borrowed:
no parent close, write, rename, removal, segment read,
or reservation. `:ready` remains name availability, not traffic
admission/header/CRC verification. Same inputs may propose
same ID. No new locks/threads/shared state between Serie.

Cost: one enumeration/existing planner, then O(1) selection
from final sorted entry. Cold opening-path allocation;
no RSS/throughput/scaling measurement planned.

<a id="verifica-preregistrata"></a>

## Preregistered verification

- 1,024 small inventories, three orders/v1/v2, compared with independent
  finite-search oracle: 6,144 proposals, one enumeration per call.
- High-water gaps, orphan temporary files, unknown finals, zero ID,
  bit 63/u64 frontiers; plan/health identical to canonical model.
- Five exact/insufficient budgets; wrong arguments before I/O,
  incomplete EOF, malformed names, aliases, original errors, closed parent.
- Name/plan ownership, directory reuse, four concurrent private Serie
  with gates/finite test waits.
- Native files bytewise unchanged after success/rejection; open directory
  reusable, FD anchoring even after parent rename.
- Native helper/new-API coverage, raw denominator preserved;
  no exclusion or result extension to planner/dependencies.
- Isolated mutations: eleven existing selection operators,
  loss of each of five budgets, second enumeration. Threshold:
  all compilable mutants detected; compilation errors not kills.
- Two author C1-checklist readings, independence declared; strict
  compilation, vertical test, `make check` recorded with every attempt.

<a id="decisioni-e-prova-verticale"></a>

## Decisions and vertical test

RID-D01/D02, RID-G01/G02/G03 retain ID-contract
independence pairs. New API delegates IND-D01…IND-D10 decisions to
[directory-inventory contract](inventario-directory-metodo.md), without
new compound predicates/error reinterpretation.

Vertical fixture adopts canonical sixteen-hex-digit names,
`.seg`/`.seg.tmp`, uses new API directly. Eight-ID limit
remains fixture budget; name collection moves into product.
Preserve 16 positive scenarios, two negatives, 71 processes, 26 SIGKILLs,
fixed data/CSN expected values, original-segment comparison.
Prepared-checkpoint case retains orphan temporary file to
skip. Fixture index replay, recovery order, CSN base
remain C4; inventory connection does not qualify them.

Requirements: REQ-REC-001/002, REQ-FOR-003, REQ-AFF-001/004/008/018,
REQ-VAL-001. Invariants: INV-A7/A8/A9/A10/A11, INV-P6.

<a id="due-letture-c1-prima-delle-esecuzioni"></a>

## Two C1 readings before execution

Author reading 1: contract, dependency responsibilities, u64
frontiers, propagation of five budgets. Author reading 2: diff, oracles,
FI/callbacks, wait bounds, ownership. Not independent readings;
independent review/overall qualification remain open.

| C1 checklist | Source-reading outcome |
|---|---|
| 1. Requirements and ADRs | Traced comments, ADR-0040; method in preregistered commit |
| 2. Invariants | Identical selection, private plans, no reservation/mutation |
| 3. Errors | Delegated original conditions; no translation/partial result |
| 4. Bounds | Inventory bounded by five budgets; choice without extra loop |
| 5. Allocations | Cold path; no new hot path/performance claim |
| 6. Output | Three values; shared high-water/freshness/successor guards |
| 7. Decisions | RID/IND reused; no new compound decision |
| 8. Ownership | Borrowed parent/exclusive controller; private plans/fixtures |
| 9. Traceability/checks | Existing requirements; full check/integrations in results below |
| 10. Deviations | No exclusion planned; native denominator preserved |
| 11. Between Serie | No new shared lock/thread/counter/coordination |
| 12. Atomicity | No new durable effect; exclusive creation/EDIT caller's responsibility |

<a id="risultati-del-2026-10-16"></a>

## Results of 2026-10-16

[Original collection](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-16-recovery-directory-id/README.md)
preserves preregistered method, variants, nine command records, coverage,
mutant logs, original spikes. First attempt failed compilation
from extra parenthesis in new high-water test, corrected
in next commit; produced no valid coverage measurement.

Recovery suite passes **154 tests**, ten new. Independent
oracle compares 6,144 proposals/all plans, counts one
enumeration per call. Exercises u64, five budgets, wrong inputs,
original errors, ownership, 64 calls across four private injected backends.
Native tests preserve bytes/capabilities, reuse directory, distinguish
original FD from replacement namespace after parent rename.

Mutation campaign successful baseline, **17/17 mutants detected**,
no compilation errors, survivors, worker faults. Final six
mutants change each of five budgets or add enumeration;
fail dedicated budget tests/single-enumeration model.
At most four isolated processes, private copies/caches.

Native coverage: `inventory-id.lisp` **74/81 forms, 10/10 branches**;
`inventory-directory-id.lisp` **18/26 forms, 0/0 branches**. Total **92/107
forms, 10/10 alternatives**, no exclusions. Eight package/declaim forms
and seven keyword initializers unmarked even when defaults
exercised by optionless calls. C4 reader with self-test
compares native data/HTML; raw denominator preserved.
Measurement not extended to planner/I/O dependencies.

Canonical-name vertical test passes: 16 positive scenarios, two negatives,
71 processes, 26 SIGKILLs. Prepared checkpoint retains orphan
temporary, new API skips its ID; original segments unchanged.

`make check` passes commit `4ebde6fc9ad1395b94e614049593ad4821079319`:
1,780 named tests, two smoke tests, static/documentation checks, preservation,
ten spikes. After Archivio CSN-plan integration, entire suite/
source/documentation checks pass again on `4031944b`, 1,780
tests, 260 violation-free product files; updated-archive
check also successful. Selection files/tests
identical to measured version.

Further CI-clock correction in CBOR fixture changes no product
code: strict compilation, affected CBOR suite, documentation
checks repeated on `4c7a0ca7`. Records distinct, all
STABLE; final result updates change no code/tests.
Tests do not close independent qualification, Recovery Manager,
or dedicated Archivio CSN-calculation verification.

Later push found new CLOSED changes on `main`, integrated
in `94e2abd6`. [Additional verification](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-16-recovery-directory-id-closed/README.md)
records full suite/source/documentation checks again:
**1,849 named tests**, 260 violation-free product files, successful traceability/
links. Updated CLOSED coverage-tool self-test also passes.
ID-selection files/tests remain those measured at
`4ebde6fc`; result transfers no coverage to new
CLOSED paths.
