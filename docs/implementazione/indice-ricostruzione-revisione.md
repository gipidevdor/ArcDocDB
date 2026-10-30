<a id="ricostruzione-dellindice--lettura-c1-indipendente"></a>

# Index reconstruction — independent C1 reading

<a id="ambito-e-stato-delle-evidenze"></a>

## Scope and evidence status

Static reading on 2026-10-09 of `src/index/rebuild-scan.lisp`,
`rebuild-budget.lisp`, `rebuild-copy.lisp`, and `rebuild.lisp`, including existing
v2 slot, writer, arena, and directory primitives. Code is being written
concurrently: this report declares no freeze. Assigned tests
are exclusively in `tests/index/rebuild.lisp`, in the primary support package
written by Noether. The reviewer ran no test, compilation, benchmark, coverage,
or mutation. The parent freezes and runs the records.

References: [ADR-0032](../adr/0032-seqlock-a-64-bit.md),
[ADR-0043](../adr/0043-primary-index-a-frammenti.md),
[ADR-0048](../adr/0048-limiti-documentali-e-formato-v2.md),
[ADR-0050](../adr/0050-pubblicazione-e-costi-della-directory.md),
[standard](../affidabilita/standard-di-codifica.md).
REQ-IDX-001/003/005/006/007, REQ-LIM-001/003, REQ-AFF-004/008;
invariants INV-I1, INV-I3, INV-A8, INV-P6. No C1 qualification or approved waiver.

<a id="contratto-controllato"></a>

## Checked contract

`ricostruisci-frammento-indice` receives HIGH/LOW u32 per **original slot**;
elements for EMPTY/DELETED are not interpreted. It returns five
values: verified plan, source capacity C, copied live-key bytes,
new directory references, and transient payload. C is a size,
not the total number of visits: measure, copy, and verify perform three complete
scans of C slots. Probes of at most C slots per live key are added in
the three phases; with L live entries, probe work is bounded by 3×L×C. Key copying
and comparison and construction of 2^G references remain separate costs.

Preflight checks current identity, owner, published/writable state,
used within arena, digest shape, depth, control/payload consistency,
live count, discoverability, budget, and credits before candidates.
Copy does not change source bank arena, payload, controls, live counters, or
state; it increments index revision through the candidate
writer. Source remains published/writable and root retains its
identity until `pubblica-directory-indice`. Publication freezes and retires
source, increments revision/generation, and applies a single root CAS.

Accounted memory is old root and distinct fragments + new directory
+ 41×C per candidate + each candidate's arena, at least one byte even if
empty. Fixed scratch, caller-supplied digests, other retained roots,
headers, runtime, and garbage are controller reservations; payload is not RSS.
Exact budget is allowed; one byte less is rejected before allocating
candidates, consuming revision, or freezing source.

Hash is not recalculated: already used prefix, H2, and original lookup are
checked, but HIGH bits not discriminated by current depth and LOW bits
that do not change the probe remain a trusted provider contract. The first
split at depth zero cannot independently prove the next HIGH bit.

<a id="riscontri-e-azioni-correttive"></a>

## Findings and corrective actions

**IR-C1-01 — propagation of bank fault during preflight (P2,
to close).** `campiona-ricostruzione` directly calls
`tenta-lettura-slot`. A malformed stable payload word or a sequence
beyond the limit goes through `guasto-slot`, which makes the bank FAULTED and signals
INVARIANT-VIOLATION. This exit does not call `guasto-indice`:
preflight may return the condition with `indice-primario-health` still
`:open`. The next fragment guard propagates the fault; the index
guard alone does not, nor does a call concerning another healthy fragment.
Root and source bytes do not change, but this is not immediate fail-stop of the entire
index domain. Parent action: propagate the bank fault to the domain
before exit, or document and test the mandatory controller
boundary that prevents further operations in the Serie after that condition.
No source correction by the reviewer.

**IR-C1-02 — COD-26, reevaluated on updated main.** Main no longer contains
`unwind-protect`. It acquires no external resources or shared context:
scratch and candidates are local and GC-discardable. Writer primitives
release the busy context and govern fail-stop of their own mutations;
verification of a different copy explicitly calls `guasto-indice`.
Abandonment in a cold phase does not make the index terminal merely because
work is incomplete. The already advanced revision may conservatively invalidate
a previous plan. No new COD-26 violation emerges in the main read.
Temporary C4 replacement of `symbol-function` in tests uses cleanup to
release/restore that harness resource, preserving the condition.

<a id="inventario-delle-decisioni--cod-54"></a>

## Decision inventory — COD-54

The listed pairs are fixture targets, not coverage or MC/DC outcomes.
Existing delegated guards are inventoried in
[primary index](indice-primario.md) and [v2 slots](slot-indice-v2.md).

| ID | New compound decision | Conditions to isolate |
|---|---|---|
| IR-D01 | `esigi-ricostruzione`: configuration `and` | length HIGH=C; length LOW=C; 1≤budget≤most-positive-fixnum. Separate short HIGH, short LOW, zero/above-maximum budget, and valid configuration. |
| IR-D02 | `esigi-ricostruzione`: split depth `and` | split requested; source depth≥max-depth. At limit depth, rebuild allowed and split rejected; split below limit allowed. |
| IR-D03 | `verifica-digest-ricostruzione`: original lookup `and` | found; found-slot=original slot. LOW changing group with EMPTY gives miss; physical key duplicate gives hit on another slot. |
| IR-D04 | `misura-ricostruzione`: destination `and` | split; odd prefix parity at new depth. HIGH on both sides and rebuild with high HIGH. |
| IR-D05 | `budget-ricostruzione`: fragment `or`/`and` | first payload over budget; split; second payload over budget. Both within threshold, first over, second over only in split; second irrelevant in rebuild. |
| IR-D06 | `copia-ricostruzione-uguale-p`: five-comparison `and` | CSN; location; key-meta without low offset; record-length; end-CSN. Change only one field at a time; different arena offset allowed. Predicate used in IR-D07. |
| IR-D07 | `verifica-ricostruzione`: copy `and` | found; found-slot≥0; five IR-D06 comparisons. Miss and different payload must make index FAULTED. A hit with negative slot is excluded by the sonda-writer contract: any explicit C4 FI, no approved coverage exclusion. |

Other simple decisions to cover: valid/live/free control, writer retry
state, key range within used, used within arena, live count,
fingerprint, directory/transient thresholds, generation and revision credit,
split with empty child, child selection, absent second candidate.

<a id="checklist-c1"></a>

## C1 checklist

| Point | Finding and limit |
|---|---|
| 1. Requirements/ADR | REQ annotations and contracts consistent with v2 slots and ADR-0050; no new persistent format. |
| 2. Invariants | Fixtures for unchanged root/source, compact arena, faithful payload, freeze only at publication, revision/generation without wrap. Runtime outcomes delegated to parent. |
| 3. Errors | INVALID-ARGUMENT for input/digest/stale; RESOURCE-EXHAUSTED for budget/depth/credit; INVARIANT-VIOLATION for corruption/different copy. IR-C1-01 open. |
| 4. Bounds | Three scans of C≤65536; probe≤C; key≤65535; directory≤2^max-depth with max-depth≤30 and budget before allocation. No wait or recursion. |
| 5. Allocations | Writer maintenance path, explicitly allocated candidates/scratch; reader lookup unchanged. No heap/GC/P99 measurement performed. |
| 6. Verified results | Source lookup before copy, byte/per-payload check after copy, and plan after verification; residual hash trust declared above. |
| 7. Decisions | IR-D01…07 includes dependent payload comparisons; contract-excluded conditions to distinguish from runtime proof. |
| 8. Ownership | One writer retains the token throughout the call; private digests/scratch; immutable root and local CAS. C4 symbol-function only in isolated serial runner. |
| 9. Traceability | Tests with REQ in name; no `make check` run. ASDF loading and records belong to parent. |
| 10. Standards | Safety 3, ftypes, and specialized types; COD-26 on main reevaluated. COD-24 pre/post of small helpers to assess with delegated guards; no invented waiver. |
| 11. Serie | No mutex, wait, state, or counter shared between Serie; construction serial only in owning writer. |
| 12. Durability | No I/O, deletion, or commit; in-memory atomic point remains the pubblica-directory-indice CAS. |

<a id="test-consegnati-e-mutanti"></a>

## Delivered tests and mutants

Final inventory of cases and names of the four runtime targets to complete
with the test file. All cases are serial, deterministic, and bounded;
no positive outcome attributed before the parent's recorded run.

<a id="chiusura-del-parent-dopo-il-freeze"></a>

## Parent closure after freeze

Section IR-C1-01 above retains the reviewer's initial finding. The
parent closed it with specific INVARIANT-VIOLATION guards in both
`campiona-ricostruzione` and `sonda-ricostruzione`: index FAULTED before
propagating the same bank condition. Tests for a corrupted bank
during scan and a corrupted candidate encountered by probe
before its own scan turn are in the final suite.

Noether's index reading identified ambiguity in the slot/root-change
count. The contract is clarified as eight sampling and restart
credits: failed final confirmation at zero credit ends without a
new probe or output. The dedicated test injects a root change after
the eighth sample and checks exactly one probe. No protocol or
restart-limit change; confirmation remains mandatory even on miss.

The parent reread types, budgets, prefix routing, copy fidelity,
cleanup, and new helper complexity, separating credits into a function
to contain paths. Existing primitive limits remain:
deterministic FI on a changed sequence during sampling, internal
mutation interruptions, fault during copy, x86-64, and whole-engine
qualification. No complete MC/DC coverage claimed.

<a id="seconda-lettura-indipendente--averroes"></a>

## Second independent reading — Averroes

HEAD examined: `6796eb3931af81d4f82479c416cd9deae4b2f261`, hashes reread
stable by reviewer. No blocking functional defect found; IR-C1-01
closed statically. Requirements/ADR, bounds, ownership,
preflight, digest/payload fidelity, credits, integration, and CAS were checked.
The reviewer ran no tests and does not attest the parent's runtime outcomes.

P2 finding on IR-D06: the fixture isolated only location. The parent
added independent variations of CSN, high key-meta, and record-length, as well
as validity end, keeping all other fields identical. Different local
arena offset remains allowed. The end-CSN variation is predicate FI:
on the valid primary path both values are zero, and bank validation
rejects a nonzero end. It does not qualify retention or snapshots;
no MC/DC exclusion or standards waiver is declared approved.
