<a id="id-del-nuovo-segmento-dopo-il-recovery"></a>

# New segment ID after recovery

> **C1 increment, method preregistered on 2026-10-15.**
> Part of open planning, not complete Recovery Manager.

`arcdocdb.recovery.manifest:scegli-id-segmento-recovery(manifest, files, …)`
returns three values: proposed ID, next high-water, and reconciliation
plan. Uses one canonical-planner call with same
`max-files` and `max-segmenti` budgets; no file or manifest modified.

<a id="contratto"></a>

## Contract

Since 2026-10-16, [directory entry point](id-directory-recovery.md)
composes native inventory and ID selection with one enumeration.
Both APIs reuse private selection helper from canonical plan.
2026-10-15 measurements below remain attributed to then-verified version;
composition and refactoring have separate method and results.

Manifest complete and authoritative; inventory contains all physical
`.seg`/`.seg.tmp` names, stable and owned by exclusive controller.
Planner validates descriptors, duplicates, and budgets, and owns plan.
Maximum ID read from last plan entry, unsigned-u64 ordered;
includes unknown names, temporary files, removed entries, and missing live references.
Manifest high-water also protects historical IDs no longer present.

Proposal minimum ID at least high-water and greater than every
plan ID. Next high-water must also be representable
as u64: no wrap, gap reuse, or new on-disk sentinel.
`resource-exhausted :recovery-segment-id-exhausted` returns no partial
values. Planner errors propagated without reinterpretation;
private inconsistencies signal `invariant-violation`.

Selection does not reserve ID. Namespace and inventory remain exclusive until
new temporary created; EDIT published by canonical
protocol. Repeating same inputs may return same proposal.
Plan state explicit: proposed ID does not authorize traffic,
attest header/CRC, resolve anomalies, or delete files.

Costs: existing planner's, then O(1) selection from ordered plan.
Open path with allocations, outside hot paths; no
new thread, lock, or shared write access between Serie.

<a id="verifica-prevista-prima-dellimplementazione"></a>

## Planned verification before implementation

- Independent finite-search oracle: minimum candidate exceeding all
  declared IDs; 1,024 inventories, three orders, v1/v2 formats.
- High-water with gaps and removed IDs, unpublished temporary and unknown
  final files; ready/degraded/faulted availability retained in plan.
- Zero ID, bit 63, u64 endpoints, unrepresentable ID/next-high-water;
  input and manifest unchanged after success or rejection.
- Exact/insufficient budgets, duplicates, types, and original conditions;
  four concurrent Serie with private plans and bounded test waits.
- Private guards and condition-independence pairs; native
  coverage of new file without attributing result to whole planner.
- Isolated selection-operator, frontier, and guard mutations:
  goal all nonequivalent mutants detected, with successful baseline.
- Two C1 checklist readings; independence and limits declared.
- Existing vertical test connected to new API, then `make check`.

| Decision | Conditions / outcomes to cover |
|---|---|
| RID-D01 | positive high-water, candidate at least high-water, candidate beyond maximum: each condition false alone |
| RID-D02 | next high-water = candidate + 1: equal / mismatched |
| RID-G01 | available / exhausted high-water |
| RID-G02 | canonical plan with entries / empty through fault injection |
| RID-G03 | next high-water u64 / out of range |

Requirements: REQ-REC-001/002, REQ-FOR-003, REQ-AFF-008/018.
Invariants: INV-A7/A8/A9/A10/A11, INV-P6.
ADR-0053 full-text scope remains phase 8: function constructs
no indexes or attests their coverage.

<a id="esiti-locali-del-2026-10-15"></a>

## Local outcomes dated 2026-10-15

[Evidence collection](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-recovery-segment-id/README.md)
preserves original registers, sources, variants, logs, and native data.
Eight new recovery-suite tests: 125 tests passed, including 6,144
independent-oracle comparisons and 64 calls on four private Serie.
High-water with gaps, historical removals, orphan temporaries, unknown names,
types, and budgets verified without modifying manifest or inventory.

New-file-only coverage **71/77 forms, 10/10 branch alternatives**.
Six unmarked forms: four declarations and two keyword defaults
exercised by calls without options: no exclusion, no reload
to change bits. Native data and HTML agree through self-tested C4
reader. [Unmarked-form inventory](../affidabilita/copertura-eccezioni.md#proposta-id-dopo-recovery--2026-10-15)
retains raw denominator; result does not extend to other files.

RID-D01 uses tuples `(minimum maximum candidate next)`:
`(10 9 10 11)` passes; `(0 9 10 11)`, `(10 8 9 10)`, and `(10 10 10 11)`
each make one of three conditions false alone. RID-D02 compares
first tuple with `(10 9 10 12)`. RID-G01/G03 use real u64 manifests
and inventories; RID-G02 injects private empty plan, always restoring planner.

Final campaign successful baseline and **11/11 mutants detected by tests**,
four isolated processes at a time, no survivors, compilation
errors, or worker faults. First attempt discovered obsolete tool
copier: now derives sources from both ASDF systems and self-test
checks completeness and omissions. Intermediate campaign
had 10 detections and one compiler-rejected mutant: latter not
counted as kill. Target replaced with incorrect checking
of candidate instead of successor, which compiles and is detected at u64 limits.
All attempts and respective variants preserved.

Vertical fixture uses API with all own names and verifies 16 positive
and two negative scenarios, 71 processes, and 26 intentional SIGKILLs. Preexisting
segment bytes unchanged after both crashes; new function performs
no removal action.

[Full integrated-version verification](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-recovery-segment-id-verifica/README.md)
`OK / exit 0 / STABLE`, 484.751351 s over 1,012 sources, at commit
`c8a1adab7da1adf171e1beaf41cc71ac2e801601`, also including meanwhile-published
CSN recovery. Passes 1,734 named tests, two smoke tests,
249 product files without violations, traceability, links, evidence
checks, and ten spikes. Previous attempt interrupted to integrate
CSN recovery remains preserved as `FAILED / exit 143`, not successful
test. Final collection retains both registers and spike
originals; later result updates change no verified code,
tests, or tools. No engine C1-qualification promotion.

<a id="due-letture-con-lista-c1"></a>

## Two C1 checklist readings

Two author readings address contract/algorithm first, then diff,
oracles, logs, mutants, and raw coverage. **Not independent review**:
that check and overall C1 qualification remain open.

| C1 checklist item | First reading | Second reading |
|---|---|---|
| 1. Requirements and ADRs | Above REQs and ADR-0040 consistent with high-water and nonreuse | Both-function comments and traceability checked |
| 2. Invariants | Proposal idempotence, no mutation/destruction | Model, ownership, and vertical tests |
| 3. Typed errors | Original conditions, exhaustion, private inconsistency | Budgets, duplicates, types, u64, and fault injection |
| 4. Loops/waits | Only bounded planner; loop-free selection | Test workers with deadlines and cleanup |
| 5. Allocations | Cold path, private plan; no new hot path | No nonallocation or performance claim |
| 6. Output data | Two u64s and validated plan | Three exact values, frontier and successor checked |
| 7. Compound decisions | Explicit RID-D01/D02 | Independence pairs and operator mutations |
| 8. Ownership | Stable manifest/inventory, exclusive controller | Separate plans, reusable inputs, four private Serie |
| 9. Traceability/check | Existing requirements, no state promotion | Final full check recorded separately |
| 10. Deviations | No coverage exclusion | Six unmarked forms and open independence declared |
| 11. Across Serie | No new lock, thread, or shared counter | Concurrent private calls, no scalability measurement |
| 12. Atomicity | No durable effect or reservation | EDIT and exclusive creation remain canonical protocol's |
