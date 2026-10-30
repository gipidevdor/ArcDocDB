<a id="decisioni-della-tabella-multiserie"></a>

# Multiseries table decisions

COD-54 inventory to verify in two C1 readings. Cases in
[`tests/recovery/`](../../tests/recovery/). Table alone certifies neither
MC/DC coverage, durability, nor atomic engine application.
[Radix inventory](decisioni-radix-decisioni.md) complements this document
with both dispatches, histograms, scatter, and adopted-sort guards.

| Check | Conditions and cases |
|---|---|
| Configuration | budgets in range; zero valid; negative or beyond-type values; checked even with empty log |
| Scan before result | complete prefix; final tail; later witnessed corruption; incomplete search; no table on error |
| Record count | zero count; exact limit; one record beyond; duplicates consume budget |
| DECISION payload | at least two participants; exact consumption; count incompatible with bytes and residual prefix bytes with verified frames |
| Short DECISION frame | length below minimum before prefix; tail without witness and corruption with later durable frontier beyond batch start |
| Participant count | per-record limit; exact total; total exceeded across records, including duplicates |
| Participant ordering | distinct IDs including zero; different first/last byte; high bit; full equality |
| TXID coalescing | new TXID; duplicate with same CSN/set; permuted set; CSN or set alone conflicting |
| TXID search | first, middle, last; absent below/between/above; zero/maximum TXID/CSN; shared CSN |
| Membership query | present/absent participant; absent TXID; ID from unaligned slice; invalid range or length other than 16 even with absent TXID |
| Ownership | source unchanged during construction; source overwritten afterward; stable queries; no internal vector exposed |
| Internal progress | frames and counts consistent with verified prefix; sorting/ranges/capacity respected; defensive guards always active |

Sort loops bounded by actual counts; queries use
binary search on sorted data. Definitions and internal guards remain
in raw coverage denominator. Any unreachable forms
justified after measurement without subtracting from published totals.

The [method](decisioni-multiserie-metodo.md) distinguishes frame tests,
semantics, and complete recovery. A semantically invalid decision within
prefix with verified frames and SEAL cannot become absence and
thus presumed abort. Frame damage remains subject to witness
search and scanner's declared limits.


<a id="predicati-composti-dei-sorgenti"></a>

## Source compound predicates

Cited tests in `decisions.lisp` and `decisions-audit.lisp`;
only name prefix `test-REQ-…` omitted. Internal guards
justified in [coverage inventory](../affidabilita/copertura-eccezioni.md).
Distinction between observed cases and internal invariants removes no forms
from denominator and is not MC/DC qualification.

| Function and decision | Clauses and verification |
|---|---|
| `check-decision-budgets`: `and` of two `index` types | both valid; only `max-decisions` invalid; only `max-participants` invalid. `invalid-decision-budgets-even-empty` tests negatives and overflows separately; `physical-duplicate-record-budgets` tests exact limits |
| `decision-frame`: `and` on progress, boundary, empty key, zero flags | all true for every frame scanner allows; negations contradict already verified stable prefix. Internal `decision-control-frame` guard |
| `decision-frame`: `and` on payload range and `count × 16` size | codec-returned ranges and exact consumption; semantic error tested by `sealed-invalid-decision-payload-is-not-tail` and `sealed-trailing-decision-payload`. Internal `decision-payload-range` guard |
| `preflight-decisions`: `and` on final position and decision count | scanner and stable-buffer reread count same frames. Internal `decision-prefix-consumption` guard |
| `decode-decisions`: `and` on final position, produced entries, participants read | counts fixed by scanner/preflight; no buffer mutation. Internal `decision-prefix-consumption` guard |
| `same-decision-p`: `and` on CSN, count, every-byte equality | `conflicting-csn-set-or-count` tests different CSN with fixed set, different set with fixed count, different count with fixed CSN; `seeded-histories-and-permuted-duplicates` checks equality after canonicalization |
| `unique-decision-count`: `and` on predecessor present and decreasing TXID | first and subsequent records observed; decreasing TXID impossible after stable sort. Internal `decision-entry-order` guard |
| `unique-decision-count` and `collapse-decisions`: `and` on predecessor present and equal TXID | first record, new TXID, consistent/conflicting duplicate; `decision-table-ordered-unordered-oracle`, `seeded-histories-and-permuted-duplicates`, `first-physical-decision-conflict-across-txid-groups` |
| `merge-id-runs`: `and` on nonempty vectors, equal size, distinct identity, multiple of 16 | private copies/workspace of verified size; negations contradict construction. Internal `decision-sort-arrays` guard |
| `merge-entry-runs`: `and` on equal size and distinct identity | scratch same length as private vector; internal `decision-sort-arrays` guard |
| Both merges: `or` on exhausted right run and `and` on available left run/comparison | reversed inputs, permutations, duplicates, odd cardinality, maximum u16; `decision-table-ordered-unordered-oracle`, `seeded-histories-and-permuted-duplicates`, `maximum-u16-participant-count` |
| Both merges: `and` on both-run consumption | one advancement per iteration and `right-left` iterations; internal `decision-sort-consumption` guard |
| `partecipante-decisione-p`: `and` on found TXID and present participant | absent TXID, present with absent ID, present with exact ID; `participant-exact-bytes-and-query-ranges`, `participant-every-byte-and-every-bit` |

Byte comparisons in `same-decision-p` loop end at first
inequality and stay bounded by verified size. Tests also change
last byte and each of 128 bits without confusing an ID difference
with TXID presence alone. `public-default-budgets-and-explicit-version`
directly calls API and checks default budgets and required version.
