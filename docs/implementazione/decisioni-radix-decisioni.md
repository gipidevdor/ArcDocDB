<a id="decisioni-e-guardie-dellordinamento-radix"></a>

# Radix sorting decisions and guards

Inventory for COD-54 and the second C1 reading of
[`decisions-radix.lisp`](../../src/recovery/decisions-radix.lisp) sorting, with
[`test radix e concorrenti`](../../tests/recovery/decisions-radix.lisp).
The examined version is identified in the [review](decisioni-radix-revisione.md).
The public builder uses both selection wrappers: merge for fewer than
1,024 participants and fewer than 256 entries, radix at and above thresholds.
Selection uses actual cardinalities, before duplicate record
coalescing; it uses no sampling and changes no recovery budgets.

The [coding standard](../affidabilita/standard-di-codifica.md)
and [verification plan](../affidabilita/piano-di-verifica.md) apply. This table
describes predicates, cases, and review arguments; it does not attest MC/DC
coverage or achievement of C1 criteria. It contains no approved exclusions.
Raw counts are distinct from condition coverage; guards
remain active and in the denominator.

<a id="invarianti-di-conteggio-e-dei-prefissi"></a>

## Count and prefix invariants

For one pass, `N` is the actual element count and `F[k]` is
the frequency of digit `k`, for `0 <= k < 256`. Histogram is zeroed
and counts all current source elements, without sampling.
Cells have type u64; total, positions, and cardinality use `index`.
Entry cardinality is not limited to the participants' u16 count.

During verification, `total` is the sum of frequencies already read and satisfies
`0 <= total <= N`. Before every increment,
`F[k] <= N - total` is checked: the next sum cannot exceed `N`. At the end,
`sum(F) = N` is required. If distribution is needed, the second loop
produces exclusive prefix `P[k] = sum(F[j], j < k)`. Every prefix is
within `0..N`; cursor may reach `N` after the last write.

With zero or one occupied class, distribution is unnecessary. For `N > 0`, a
single occupied class contains all elements, because the sum has already
been checked. The pass is therefore the stable identity. Caller
skips both scatter and `rotatef`; possibly unwritten scratch
does not become source. If all passes are uniform, result is
the initial source. Sampling cannot justify this skip.

<a id="decisioni-composte"></a>

## Compound decisions

Radix source has two explicit compound Boolean predicates.
Chained comparisons and simple decisions are inventoried below.
Test names are abbreviated by omitting the `test-REQ-…` prefix.
Cited cases are present in the examined version; they do not constitute
MC/DC certification of private guards.

| ID and site | Clauses | Cases and verification status |
|---|---|---|
| RAD-D01, `radix-scatter-ids`, lines 95–97 | `and`: source length = `16 × count`; target length = source length; source and target distinct by `eq` | All true for sorter-built scratch. `radix-scatter-invalid-arrays` separately negates source size through wrong count, target size, and distinct identity; checks source, target, and histogram before/after rejection. Deliberate private calls. `radix-participant-shape-before-sort` also tests incompatible sizes at sorter entry. |
| RAD-D02, `radix-scatter-entries`, lines 116–117 | `and`: equal lengths; source and target distinct by `eq` | All true for private scratch. `radix-scatter-invalid-arrays` tests shorter/longer target with distinct identity and same target with equal size, checking no change. |
| RAD-D03, existing query `partecipante-decisione-p`, lines 76–78 of `decisions-query.lisp` | `and`: TXID found; ID16 present in found entry | Test `concurrent-immutable-table-queries` declares absent TXID, present TXID with absent ID, and present TXID with exact ID. Second operand is not evaluated if TXID is absent. Range and 16-span check still precedes search, as described in the [table inventory](decisioni-multiserie-decisioni.md). |

<a id="guardie-locali-del-radix"></a>

## Local radix guards

The 17 local sites signaling `invariant-violation` are listed.
`index`, u16, u64, and array types are also preconditions
checked by the runtime with `safety 3`. Checks delegated to
`check-entry-shape`, `copy-id16`, and `check-participant-order` retain
the existing module contract and are not recounted as new sites.

| ID, function, and line | Predicate and consequence | Invariant and relevant cases |
|---|---|---|
| RAD-G01, `radix-prefix-starts`, 23 | `frequency <= count - total`; otherwise `decision-radix-count` | Prevents exceeding N during summation. `radix-prefix-invalid-total` tests excess in first class and after partial sum. `radix-entry-65536-bucket-counts` includes a class with 65,536 elements and a dominant class with outlier. |
| RAD-G02, `radix-prefix-starts`, 27 | `total = count`; otherwise `decision-radix-consumption` | Checks sum before using prefixes or skipping pass. `radix-prefix-invalid-total` tests insufficient frequency and unchanged histogram on rejection. |
| RAD-G03, `radix-id-starts`, 45 | `length(source) = 16 × count`; otherwise `decision-participant-size` | `radix-scatter-invalid-arrays` also calls this function with incompatible count. Wrong sizes also tested at sorter entry; cardinalities 0/1 are private cases, not valid public DECISIONs. |
| RAD-G04, `radix-id-starts`, 47 | `digit < 16`; otherwise `decision-radix-digit` | `digit` nonnegative by `index` type; sorter generates it as `15 - pass`. `radix-invalid-digit-before-access` tests 16, 17, and maximum fixnum, retaining unchanged histogram. Every byte and bit compared with oracle. |
| RAD-G05, `radix-entry-starts`, 61 | `digit < 8`; otherwise `decision-radix-digit` | Sorter uses `dotimes` with limit 8. `radix-invalid-digit-before-access` tests 8, 9, and maximum fixnum; all 64 TXID bits tested in both input orders. |
| RAD-G06, `radix-entry-starts`, 63 | source length of type u64; otherwise `decision-radix-count` | Prevents cardinalities unrepresentable in u64 cells. On runtime with fixnum `index` narrower than u64, opposite case already excluded by array limits. |
| RAD-G07, `radix-check-cursors`, 81 | `previous <= cursor <= count`; otherwise `decision-radix-position` | Two separate bounds: monotonic class endpoints and upper limit N. `radix-invalid-final-cursors` separately negates monotonicity and upper limit. Cursors nonnegative by u64 type. |
| RAD-G08, `radix-check-cursors`, 84 | last cursor = N; otherwise `decision-radix-consumption` | `radix-invalid-final-cursors` tests monotonic endpoints within N ending before N. `radix-scatter-invalid-cursors` also tests deliberately overlapping prefixes in both scatters. Not an exact check of frequencies consumed per class. |
| RAD-G09, `radix-scatter-ids`, 95 | RAD-D01; otherwise `decision-radix-arrays` | Size, equal capacities, and no alias before writes. |
| RAD-G10, `radix-scatter-ids`, 98 | `digit < 16`; otherwise `decision-radix-digit` | `radix-invalid-digit-before-access` checks rejection before changing target and histogram. Scatter uses same digit as prefixes. |
| RAD-G11, `radix-scatter-ids`, 103 | `position < count`; otherwise `decision-radix-position` | Nonnegative cursor; cast to `index` only after bound. `radix-scatter-invalid-cursors` sets first cursor to N and checks rejection before writing. |
| RAD-G12, `radix-scatter-entries`, 116 | RAD-D02; otherwise `decision-radix-arrays` | Distinct same-size private vectors, without altering entry fields. |
| RAD-G13, `radix-scatter-entries`, 118 | `digit < 8`; otherwise `decision-radix-digit` | `radix-invalid-digit-before-access` tests digits beyond u64 TXID before changing target and histogram. |
| RAD-G14, `radix-scatter-entries`, 124 | `position < length(source)`; otherwise `decision-radix-position` | `radix-scatter-invalid-cursors` checks rejection of cursor N before store. The 65,536-element test also checks a final cursor beyond u16. |
| RAD-G15, `radix-sort-participants`, 138 | `length(participants) = 16 × count`; otherwise `decision-participant-size` | Check before scratch allocation and first per-digit read. Negative cases in `radix-participant-shape-before-sort`. |
| RAD-G16, `radix-sort-entries`, 161 | every element is `decision-entry`; otherwise `decision-entry-shape` | `radix-entry-invalid-object-before-slot-access` tests NIL, integer, and vector. `check-entry-shape` then checks minimum count and size, negated in `radix-entry-shape-before-sort`. |
| RAD-G17, `radix-sort-entries`, 171–174 | nondecreasing adjacent TXIDs; otherwise `decision-entry-order` | Ordering postcondition. Identity and stability compared separately with `CL:STABLE-SORT`, including repeated TXIDs. |

Negations of histogram, digit, alias, and cursor guards are not
public builder inputs: sorter produces those structures after
preflight and private copies. Tests deliberately call them through
private boundaries without weakening product types. RAD-G06 depends
on runtime representable limits; RAD-G17 remains a postcondition
catching algorithm defects. Any unobserved branches must be
justified with final measurement, retaining raw totals.

<a id="selezione-e-collegamento-al-builder"></a>

## Selection and builder binding

Wrappers add only two simple `if` decisions; no new
compound predicate, budget, or error handler.

| ID and site | Decision | Public cases |
|---|---|---|
| RAD-S01, `sort-recovery-participants`, 192 | `count < 1024`: merge if true, otherwise radix | `public-participant-sort-threshold-boundaries`: 1,023, 1,024, and 1,025 ID16s, three patterns, versions 1/2, duplicate records with permuted set, unchanged log, and table compared with oracle. |
| RAD-S02, `sort-recovery-entries`, 204 | `length(entries) < 256`: merge if true, otherwise radix | `public-entry-sort-threshold-boundaries`: 255, 256, and 257 entries, reverse and permuted order, versions 1/2, zero/maximum TXID, and queries against oracle. Same physical counts tested with consistent duplicates producing only one TXID after coalescing. |

`decode-decisions`, line 95 of `decisions-build.lisp`, passes the participant
copy and physical offset to the first wrapper. `ricostruisci-decisioni`,
line 190, passes entries to the second wrapper before `collapse-decisions`.
The rest of the builder retains complete scanner, physical budgets including
duplicates, preflight, and copy before sorting. No error
is reclassified as absence, tail, or presumed abort.

`public-radix-first-physical-conflict-across-groups` constructs more than
256 records and places the first physical conflict in the maximum TXID group,
before the conflict in the zero TXID group. The API must signal the global minimum
physical offset, in both versions and two reconstructions,
with unchanged source. The radix branch is reached without changing
the threshold for the test.

<a id="distribuzione-stabile-e-controlli-delegati"></a>

## Stable distribution and delegated checks

Scatter visits `i = 0..N-1` in increasing order. For digit `k`, the
cursor starts at `P[k]` and increases by one per element in that class:
elements with equal digit retain source order. After N
iterations, each class has cursor `P[k] + F[k]`. This property follows
from full counting, validated prefixes, and one increment per
element; `radix-check-cursors` checks monotonicity and total endpoint without
retaining a second frequency copy for end-of-pass
comparison. Final checking is not presented as standalone proof against
every possible future scatter defect.

TXID uses digits from least to most significant, with `ldb` on u64 and no
sign reordering. ID16 uses bytes from position 15 to 0. Each stable
pass retains previous results; equal TXIDs retain
original physical order. No comparison uses CSN, participants, or
offset as a secondary key. Coalescing may therefore continue to
use the group's first physical record. The oracle compares entry
identity as well as sorted TXIDs.

`check-participant-order` retains size check, strictly
increasing order, and typed corruption for repeated ID with
record offset. Tests change each of 128 bits, test
cardinalities up to 65,535, and check duplicate offsets, including
maximum u64. Scanner treatment of persistent damage is
unchanged.

<a id="decisioni-della-fixture-concorrente"></a>

## Concurrent fixture decisions

These checks belong to the harness; they introduce no waits or
per-request threads in the product. The existing query reads only
fields and vectors owned by the complete table.

| Check | Cases and detection |
|---|---|
| Stability oracle: `and` on `i > 0` and equal adjacent TXIDs | First element, new TXID, and repeated TXID; only the last requires increasing physical offset. Main oracle still compares every reference with `eq`. |
| Presence and scalar values | Probes declare found, CSN, count, and membership. CSN zero present with found true; absence returns found false and zero values. Zero/maximum TXID and gaps included. |
| Membership `if` | Present and absent participant for every present TXID; absent TXIDs with false response. Each worker copies ID into its own buffer and queries unaligned span `[3,19)`. |
| Coordinated startup | Six threads signal ready and wait for release with 10-second timeout. Main thread waits for every ready with same bound; cleanup releases threads even if preparation fails. |
| Worker error | Handler returns condition to join caller; does not convert error to `t`. |
| Join | `join-thread` has 10-second timeout and default `:join-failed`; test requires all returns precisely `t` and no live thread. Timeout, condition, or abnormal termination does not satisfy check. |
| Output and ownership | Outputs distinct by identity, full oracle comparison, table rechecked after joins. Source log overwritten before thread creation and compared after queries. |

Each worker runs 64 rounds over a finite probe list. Semaphores and
joins are fixture barriers: they are not engine tasks
and do not demonstrate a new parking protocol. Real threads
exercise concurrent readers; they do not exhaustively explore
interleavings or qualify scalability, zero heap, or deterministic
scheduling. Table is built before `make-thread` and passed
in closures; the test does not prove publication through a future
global runtime catalog.

<a id="residui-della-copertura-radix"></a>

## Remaining radix coverage gaps

Measurement on the frozen clone reports radix 384/409 expressions and
53/54 branch alternatives; the six DECISION sources overall
report 1,332/1,530 and 138/176. This inventory details only
new radix gaps. Tests also cover three previously unobserved
guards in existing sources: count and size in
`check-entry-shape` and size in `sort-participants`. The 25 missing
radix expressions are 16
top-level/package/declarative forms, one histogram type subform, and
eight error forms split between RAD-G06 and RAD-G17.

The only missing alternative is RAD-G06 negation: a non-u64 array
length is unrepresentable within the narrower fixnum/array limit
of the runtime used. RAD-G17 rejects incorrect final
order, possible with an internal sorter defect;
its four error forms remain absent, without an additional
missing alternative in `sb-cover` counts. Negations of other
listed private checks are now tested, so they are not
justified as cases absent from tests.

Raw totals do not subtract these forms or the alternative. No
approved exception or MC/DC coverage is claimed. Reading source:
raw state `spikes/out/decisions-radix-coverage-final/coverage-state.lisp`
in final copy; hashes and boundaries are in review.

<a id="evidenze-finali-da-collegare"></a>

## Final evidence to connect

The diff and measured selection are described in review. Public
boundary and global conflict tests are present, together with the
existing budget and duplicate matrix. Raw coverage, mutants,
compilation, lint, and overall check must refer to the same
frozen hashes. This table inventories cases and raw gaps;
final executable outcomes remain in their respective records, without
transforming them into MC/DC coverage or approvals.
