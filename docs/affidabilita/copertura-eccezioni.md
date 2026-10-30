<a id="eccezioni-alla-copertura"></a>

# Coverage exceptions

List of C1/C2 code lines the suite **cannot** reach, with rationale and substitute
verification ([verification plan](piano-di-verifica.md#copertura)). An unreachable line
without justification is a test defect or dead code: cover or remove it.

| Field | Contents |
|---|---|
| ID | `COV-nnn`, stable |
| Where | module, function, line |
| Why unreachable | e.g., defensive branch on an invariant already guaranteed by type |
| Substitute verification | inspection, assertion, model test |
| Approval | date |

<a id="eccezioni-approvate"></a>

## Approved exceptions

No exceptions are approved. The local measurements below retain the raw denominator.

<a id="id-dalla-directory--2026-10-16"></a>

## IDs from directory — 2026-10-16

[Inventory/selection composition](../implementazione/id-directory-recovery.md)
measures two files: `inventory-id.lisp`, 74/81 forms and 10/10 branches, and
`inventory-directory-id.lisp`, 18/26 forms and no new application branch.
Raw total is 92/107 forms and 10/10 branches. The 15 unmarked forms are eight
package/declaim forms and seven keyword initializers. These are exercised by
option-free API calls but remain unmarked by the contrib.
The report retains all missing native paths and HTML agreement.
No exclusions or artificial reloads; the measurement qualifies neither complete
inventory, I/O, nor Recovery Manager. Independence and overall qualification remain open.

<a id="proposta-id-dopo-recovery--2026-10-15"></a>

## Post-recovery ID proposal — 2026-10-15

New [`inventory-id.lisp`](../../src/recovery/inventory-id.lisp) observes
71/77 forms and 10/10 branch alternatives. The six unmarked forms are
`in-package`, three `declaim`s, and keyword initializers `max-files` and
`max-segmenti`. The latter are exercised by option-free public calls but remain
unmarked by instrumentation; they are not declared unreachable.
Missing native paths are `(0)`, `(1)`, `(2)`, `(4)`, `(3 2 5)`, and `(4 2 5)`.
No form is excluded or marked through reloads.
The [decision table](../implementazione/id-segmento-recovery.md) documents independence
pairs and fault injection on the empty plan. This result concerns only the new file,
qualifying neither the existing planner nor Recovery Manager; overall qualification remains open.

<a id="recovery-control--approfondimento-del-2026-10-15"></a>

## CONTROL recovery — follow-up of 2026-10-15

Unmarked forms in the [previous campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-control-transizione/report.md)
include `in-package`, `declaim`, keyword initializers, and BOA constructor slot
specifications, plus private rejection of zero chunks.
`tests/control/recovery-guards.lisp` exercises that rejection without I/O and
dynamically checks each invalid constructor argument, together with both formats
and both valid states. Private instances are not passed to the publisher;
tests are deliberately outside the public contract.

The [follow-up](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-15-active-verifica/report.md)
retains a new raw report and the distinction between declarative forms and executed
paths. Sources are not reloaded to mark declarations artificially, and no form is
subtracted from the denominator. No exception is approved; MC/DC qualification remains open.


<a id="inventario-locale-delle-decisioni-multiserie"></a>

## Local multiseries-decision inventory

Initial measurement of 2026-10-09: 935/1121 expressions and 82/122 branches across
five `decisions-*` files, with every form in the denominator. The 40 missing branch
alternatives belong to 30 defensive signaling sites: one compound condition may
record multiple alternatives. Author and independent-reviewer readings are retained
in the [catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-decisions-verifica/catalogo.lisp).

The later [radix variant](../implementazione/decisioni-radix-decisioni.md)
observes 1,332/1,530 expressions and 138/176 alternatives across six files.
Private shape tests also cover the previously missing negations of COV-020,
COV-029, and COV-030: missing alternatives in the five existing files drop
from 40 to 37. The radix file adds one unobserved alternative, making 38 total.
The check requires an array length not representable in u64, impossible on the
examined runtime with a narrower fixnum `index`. The initial inventory below is
retained as measurement history; the radix inventory describes guards, declarative
forms, and postconditions still missing. No exception is approved.

These are observed rationales and local substitute checks, not approved exclusions,
MC/DC coverage, or C1 gate closure. The contract requires stable input and the public
API; a bypass constructing inconsistent private objects is outside that contract.

| ID | Source, function, and line | Check | Rationale / substitute verification |
|---|---|---|---|
| COV-001 | [`decisions-build.lisp`](../../src/recovery/decisions-build.lisp), `decision-frame`, line 26 | position before end | Scanner counts whole frames in the prefix. Inspection by both readers; oracles on arbitrary inputs, odd cardinalities, and extreme values. |
| COV-002 | [`decisions-build.lisp`](../../src/recovery/decisions-build.lisp), `decision-frame`, line 30 | advancement, boundary, key, and flags | Control frame already validated; stable buffer. Inspection by both readers; oracles on arbitrary inputs, odd cardinalities, and extreme values. |
| COV-003 | [`decisions-build.lisp`](../../src/recovery/decisions-build.lisp), `decision-frame`, line 37 | payload span and size | Codec guarantees ordered spans and exact consumption. Inspection by both readers; oracles on arbitrary inputs, odd cardinalities, and extreme values. |
| COV-004 | [`decisions-build.lisp`](../../src/recovery/decisions-build.lisp), `decision-frame`, line 41 | DECISION or SEAL type | Verified multiseries log permits only these types. Inspection by both readers; oracles on arbitrary inputs, odd cardinalities, and extreme values. |
| COV-005 | [`decisions-build.lisp`](../../src/recovery/decisions-build.lisp), `preflight-decisions`, line 53 | frame-count capacity | Scanner-produced counters; each frame occupies at least a header. Inspection by both readers; oracles on arbitrary inputs, odd cardinalities, and extreme values. |
| COV-006 | [`decisions-build.lisp`](../../src/recovery/decisions-build.lisp), `preflight-decisions`, line 60 | participant size | Codec verified count and ID16 span. Inspection by both readers; oracles on arbitrary inputs, odd cardinalities, and extreme values. |
| COV-007 | [`decisions-build.lisp`](../../src/recovery/decisions-build.lisp), `preflight-decisions`, line 68 | prefix consumption and decision count | Stable reread of the same frames counted by scanner. Inspection by both readers; oracles on arbitrary inputs, odd cardinalities, and extreme values. |
| COV-008 | [`decisions-build.lisp`](../../src/recovery/decisions-build.lisp), `decode-decisions`, line 80 | count, frames, and capacity | Scanner and preflight fixed the counts. Inspection by both readers; oracles on arbitrary inputs, odd cardinalities, and extreme values. |
| COV-009 | [`decisions-build.lisp`](../../src/recovery/decisions-build.lisp), `decode-decisions`, line 87 | entry-vector capacity | One entry per DECISION counted by preflight. Inspection by both readers; oracles on arbitrary inputs, odd cardinalities, and extreme values. |
| COV-010 | [`decisions-build.lisp`](../../src/recovery/decisions-build.lisp), `decode-decisions`, line 99 | consumption, entries, and participants | Copies do not modify buffer and repeat preflight. Inspection by both readers; oracles on arbitrary inputs, odd cardinalities, and extreme values. |
| COV-011 | [`decisions-build.lisp`](../../src/recovery/decisions-build.lisp), `unique-decision-count`, line 124 | TXID order | Stable merge precedes coalescing. Inspection by both readers; oracles on arbitrary inputs, odd cardinalities, and extreme values. |
| COV-012 | [`decisions-build.lisp`](../../src/recovery/decisions-build.lisp), `unique-decision-count`, line 133 | unique count within entry count | Each iteration increments at most once. Inspection by both readers; oracles on arbitrary inputs, odd cardinalities, and extreme values. |
| COV-013 | [`decisions-build.lisp`](../../src/recovery/decisions-build.lisp), `collapse-decisions`, line 147 | result capacity | Unique-count pass read the same private vector. Inspection by both readers; oracles on arbitrary inputs, odd cardinalities, and extreme values. |
| COV-014 | [`decisions-build.lisp`](../../src/recovery/decisions-build.lisp), `collapse-decisions`, line 151 | result consumption | Each new TXID produces exactly one entry. Inspection by both readers; oracles on arbitrary inputs, odd cardinalities, and extreme values. |
| COV-015 | [`decisions-sort.lisp`](../../src/recovery/decisions-sort.lisp), `merge-id-runs`, line 35 | size, identity, and multiple of 16 | Separate workspace matching private ID16 copy size. Inspection by both readers; oracles on arbitrary inputs, odd cardinalities, and extreme values. |
| COV-016 | [`decisions-sort.lisp`](../../src/recovery/decisions-sort.lisp), `merge-id-runs`, line 38 | run ranges | Boundaries computed with min over verified count. Inspection by both readers; oracles on arbitrary inputs, odd cardinalities, and extreme values. |
| COV-017 | [`decisions-sort.lisp`](../../src/recovery/decisions-sort.lisp), `merge-id-runs`, line 48 | consumption of both runs | One copy and advancement per right-left steps. Inspection by both readers; oracles on arbitrary inputs, odd cardinalities, and extreme values. |
| COV-018 | [`decisions-sort.lisp`](../../src/recovery/decisions-sort.lisp), `check-participant-order`, line 58 | participant shape | Count and copy come from the same verified payload. Inspection by both readers; oracles on arbitrary inputs, odd cardinalities, and extreme values. |
| COV-019 | [`decisions-sort.lisp`](../../src/recovery/decisions-sort.lisp), `check-participant-order`, line 66 | increasing order | Merge sorts all 16 bytes; duplicates are a covered public error. Inspection by both readers; oracles on arbitrary inputs, odd cardinalities, and extreme values. |
| COV-020 | [`decisions-sort.lisp`](../../src/recovery/decisions-sort.lisp), `sort-participants`, line 75 | copy shape | Builder copies exactly the verified span. Inspection by both readers; oracles on arbitrary inputs, odd cardinalities, and extreme values. |
| COV-021 | [`decisions-sort.lisp`](../../src/recovery/decisions-sort.lisp), `merge-entry-runs`, line 95 | vector size and identity | Separate workspace of the same length as entry vector. Inspection by both readers; oracles on arbitrary inputs, odd cardinalities, and extreme values. |
| COV-022 | [`decisions-sort.lisp`](../../src/recovery/decisions-sort.lisp), `merge-entry-runs`, line 97 | run ranges | Boundaries limited by entry count. Inspection by both readers; oracles on arbitrary inputs, odd cardinalities, and extreme values. |
| COV-023 | [`decisions-sort.lisp`](../../src/recovery/decisions-sort.lisp), `merge-entry-runs`, line 108 | run consumption | One entry and advancement per right-left steps. Inspection by both readers; oracles on arbitrary inputs, odd cardinalities, and extreme values. |
| COV-024 | [`decisions-sort.lisp`](../../src/recovery/decisions-sort.lisp), `sort-entries`, line 131 | TXID order | Stable merge on all passes through total length. Inspection by both readers; oracles on arbitrary inputs, odd cardinalities, and extreme values. |
| COV-025 | [`decisions-query.lisp`](../../src/recovery/decisions-query.lisp), `find-decision-index`, line 22 | search range | Middle computed inside nonempty half-open range. Inspection by both readers; oracles on arbitrary inputs, odd cardinalities, and extreme values. |
| COV-026 | [`decisions-query.lisp`](../../src/recovery/decisions-query.lisp), `find-decision-index`, line 29 | step bound | Range halves; integer-length(N) covers search. Inspection by both readers; oracles on arbitrary inputs, odd cardinalities, and extreme values. |
| COV-027 | [`decisions-query.lisp`](../../src/recovery/decisions-query.lisp), `participant-present-p`, line 61 | comparison result | compare-id16 returns only -1,0,1 by contract and implementation. Inspection by both readers; oracles on arbitrary inputs, odd cardinalities, and extreme values. |
| COV-028 | [`decisions-query.lisp`](../../src/recovery/decisions-query.lisp), `participant-present-p`, line 62 | step bound | Range halves; integer-length(count) covers search. Inspection by both readers; oracles on arbitrary inputs, odd cardinalities, and extreme values. |
| COV-029 | [`decisions-types.lisp`](../../src/recovery/decisions-types.lisp), `check-entry-shape`, line 32 | at least two participants | Codec verified cardinality before construction. Inspection by both readers; oracles on arbitrary inputs, odd cardinalities, and extreme values. |
| COV-030 | [`decisions-types.lisp`](../../src/recovery/decisions-types.lisp), `check-entry-shape`, line 34 | ID16 vector size | Count and copy derive from the same verified span. Inspection by both readers; oracles on arbitrary inputs, odd cardinalities, and extreme values. |

The other 46 unmarked forms are 30 declarative package, `in-package`, and `declaim`
forms, six `defstruct` slot forms, and ten `&key` initializers. The latter are
reachable and verified by the public test `public-default-budgets-and-explicit-version`:
they remain unmarked by `sb-cover` and are not presented as unreachable invariants.
The other 140 missing expressions belong to defensive signaling and its operands.
No form is subtracted from the published 1121 expressions or 122 branches.

The [compound-predicate table](../implementazione/decisioni-multiserie-decisioni.md)
connects public clauses to tests and internal guards to this inventory.
Other modules' exceptions are not inventoried by this measurement.

<a id="inventario-locale-del-manifest"></a>

## Local manifest inventory

Measurement of 2026-10-09 across six `manifest-*` files: 888/1067 expressions and
114/146 branches, with 20 dedicated tests in the initial 64-test recovery suite.
The 32 unobserved branches include 28 internal-guard alternatives and four unmarked
alternatives in the two `defstruct`s' `NEXT-ID` type specifications.
Original state and HTML are in the
[catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-manifest/catalogo.lisp).
Both C1 readings verify the inventory alongside
[compound predicates](../implementazione/manifest-control-log-decisioni.md).

| ID | Source, function, and line | Unobserved alternatives | Rationale / substitute verification |
|---|---|---|---|
| COV-031 | `manifest-build.lisp`, `manifest-frame`, 28 | 1: position before end | Scanner counts only whole frames; truncation at every byte and inspection of passes |
| COV-032 | `manifest-build.lisp`, `manifest-frame`, 32 | 3: advancement, boundary, and compound predicate | Control frame already verified in stable prefix; scanner and v1/v2 oracles |
| COV-033 | `manifest-build.lisp`, `manifest-frame`, 36 | 1: nonzero SEAL flags | Scanner rejects disallowed flags before reread |
| COV-034 | `manifest-build.lisp`, `manifest-frame`, 39 | 1: fallback outside EDIT/SEAL | Control-log scanner allows only these records |
| COV-035 | `manifest-build.lisp`, `manifest-frame`, 45 | 1: unordered payload spans | Codec attests spans; corrupted lengths and consumption checked by API |
| COV-036 | `manifest-build.lisp`, `preflight-manifest`, 61 | 1: counts inconsistent with bytes | Authoritative scanner counts, with at least one header per frame |
| COV-037 | `manifest-build.lisp`, `preflight-manifest`, 80 | 2: final position and compound predicate | Reread of same frames on stable input; physical count checked before coalescing |
| COV-038 | `manifest-build.lisp`, `decode-manifest`, 92 | 1: counts inconsistent with bytes | Scanner and preflight already fixed these values |
| COV-039 | `manifest-build.lisp`, `decode-manifest`, 107 | 3: position, EDIT count, and compound predicate | Fold and preflight consume same spans; owned copy and unchanged input |
| COV-040 | `manifest-decode.lisp`, `check-closed-shape`, 12 | 1: out-of-format length | Codec already verified; public tests on 0, 63, 64, u32 maximum, and greater values |
| COV-041 | `manifest-decode.lisp`, `check-closed-shape`, 14 | 1: non-EQL map | Every private map created with EQL; construction inspection |
| COV-042 | `manifest-decode.lisp`, `decode-closure-outcomes`, 39 | 1: pairs beyond available bytes | Spans and count already verified by codec; budget and corrupt-payload tests |
| COV-043 | `manifest-decode.lisp`, `decode-closure-outcomes`, 50 | 2: consumption and compound predicate | One pair read per step; coalescing can only reduce cardinality |
| COV-044 | `manifest-decode.lisp`, `decode-edit-closed`, 67 | 1: fixed entry beyond boundary | Codec and CLOSED spans already verified |
| COV-045 | `manifest-decode.lisp`, `decode-edit-closed`, 80 | 2: consumption and compound predicate | One step per physical CLOSED; consistent/conflicting duplicates tested |
| COV-046 | `manifest-decode.lisp`, `decode-edit-removed`, 92 | 1: span differs from count × 8 | Size already checked by codec; final and duplicate removals tested |
| COV-047 | `manifest-decode.lisp`, `decode-edit-removed`, 97 | 1: cardinality beyond count | One insertion per physical mention, with coalesced duplicates |
| COV-048 | `manifest-fold.lisp`, `apply-manifest-delta`, 81 | 1: map alias | Decoding creates fresh maps per EDIT; ownership and four-worker tests |
| COV-049 | `manifest-fold.lisp`, `apply-manifest-delta`, 91 | 3: zero ACTIVE, its negation, and compound predicate | Nonzero snapshot, zero OPEN preserves ACTIVE, bound updated with MAX; histories and exhausted u64 |
| COV-050 | `manifest-types.lisp`, `manifest-state`, 52 | 2: unmarked NEXT-ID type specification | Raw data on `(integer 1 18446744073709551616)`, not an application branch; types and exhausted bound tested |
| COV-051 | `manifest-types.lisp`, `manifest`, 62 | 2: unmarked NEXT-ID type specification | Same specification as workspace; no subtraction from denominator |

`sb-cover` counters do not equate to one branch per Lisp operand.
The 179 unmarked expressions include defensive signaling and declarative forms,
slots, and keyword initializers. Defaults are reachable and verified by the direct
test `direct-api-defaults-and-required-options`; instrumentation failing to mark
them does not turn them into unreachable invariants. No form or alternative is
excluded from the published 1067 expressions and 146 branches.
No exception is approved; the engine's C1 gate remains open.

<a id="consegna-locale-dei-writer--2026-10-09"></a>

## Local writer handoff — 2026-10-09

The [handoff campaign](../implementazione/writer-handoff-decisioni.md#copertura-raw-osservata)
retains the complete denominator for four execution files: 505/593 expressions
and 76/94 outcomes. New handoff has 173/190 expressions and 16/16 instrumented
outcomes; its 17 unmarked forms (declarations, defaults, defensive otherwise)
are inventoried in the document. The new acceptance helper has no uncovered
instrumented outcomes. Legacy gaps remain: 42 expressions and ten outcomes in
queue, 28 and eight in writer, one package form.
No approved exclusion, full MC/DC, or C1 gate closure is implied.


<a id="lista-dei-writer-pronti--2026-10-09"></a>

## Ready-writer list — 2026-10-09

The [ready campaign](../implementazione/writer-ready-decisioni.md) retains
848/974 expressions and 126/146 outcomes across six execution files.
The two new files observe 343/381 expressions and 50/52 outcomes: 17 unmarked
definition/default forms in ready-types; 21 forms in ready (nine definitions,
eight in two defensive CAS conditions, four in otherwise). The two missing
outcomes are the acquired-ownership postcondition and release CAS's old value;
they are not provoked by violating ownership with active threads.
Gaps in the four previous files remain in the denominator.
No approved exclusion, full MC/DC, or C1 gate closure is implied.


<a id="ricircolo-dei-writer-pronti--2026-10-09"></a>

## Ready-writer recycling — 2026-10-09

The [recycle campaign](../implementazione/writer-recycle-decisioni.md) retains
929/1060 expressions and 134/154 outcomes across seven execution files.
The new file has 81/86 expressions and 8/8 outcomes; five unmarked forms are
package, declaim optimize, and three top-level ftypes. Prior gaps remain in
the complete denominator, including the ready list's two defensive CAS outcomes.
No approved exclusion, full MC/DC, or C1 gate closure is implied.


<a id="contesto-worker-dei-writer--2026-10-09"></a>

## Writer worker context — 2026-10-09

The [worker campaign](../implementazione/writer-worker-decisioni.md) retains
1427/1660 expressions and 199/230 outcomes across all eleven execution files.
The four new files have 498/600 expressions and 65/76 outcomes; 102 unmarked
forms and eleven new alternatives are mapped in the inventory alongside 131
forms and twenty alternatives from seven previous files. Native, HTML, and
export also agree on each missing path. No top-level form, defensive branch,
or postcondition is subtracted from the denominator. FI fixtures are declared
and do not authorize violating ownership with active threads.
No approved exclusion, full MC/DC, or engine C1 gate closure is implied.

<a id="fonti-possedute-recovery--2026-10-17"></a>

## Owned recovery sources — 2026-10-17

The [source campaign](../implementazione/fonti-recovery.md#esiti-conservati--2026-10-17)
retains the raw total of 293/327 forms and 22/26 branches across four new files.
The three operational files have 22/22 branches marked; the types file retains
four alternatives associated with state and shape MEMBER declarations.
The remaining 34 forms include 18 top-level declarations, eight slot initializers,
and eight unmarked keyword defaults. Native and HTML agree; all missing paths
are retained. No exclusion is approved, no bit is modified, and no artificial
reload changes the counts. MC/DC, independent review, and C1 qualification remain open.

<a id="misure-delle-allocazioni-nel-catalogo-ci"></a>

## Allocation measurements in the CI catalog

The CI catalog distinguishes six tests measuring uninstrumented-code allocations.
Full-text reservation integration adds
`ARCDOCDB.FULLTEXT.ADMISSION.TESTS::REQ-SEC-010-RESERVATION-HOT-ALLOCATION`
to the four already explicit cases; PUT/WAL integration adds
`ARCDOCDB.FULLTEXT.PUT.TESTS::REQ-SEC-010-PUT-HOT-ALLOCATION`.
Only execution during `sb-cover`, which changes allocations, is omitted;
all must pass in the normal run of the same revision before accepting the CI
coverage measurement. Tests remain in the catalog with visible reasons.
No forms or branches are subtracted from the product denominator, and C1
qualification is not promoted.
