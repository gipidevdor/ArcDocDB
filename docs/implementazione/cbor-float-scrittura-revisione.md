<a id="scrittura-dei-float-cbor--prima-lettura-c1"></a>

# Writing CBOR floats — first C1 reading

Static reading on 2026-10-13, before compiling the new sources
and running campaigns. The corpus was frozen before they were written.
References: [preregistered method](cbor-float-scrittura-metodo.md),
[contract](cbor-float-scrittura.md),
[coding standard](../affidabilita/standard-di-codifica.md),
ADR-0014/0024/0033/0035/0048. This reading is not a runtime,
allocation, coverage, or MC/DC test.

<a id="sorgenti-letti-e-rilievo-risolto"></a>

## Sources read and resolved finding

| Source | Git blob read |
|---|---|
| `src/codec/cbor-float-narrow.lisp` | `cd5749edc0a757ee3a5b470eda566a6685d32fd8` |
| `src/codec/cbor-float-write.lisp` | `03c6aed61e2c243d8b1a6c4332ce1837c4e9a77c` |
| Method | `755b13a91ab72f54383d96faee5780da36e750d6` |

Also read: existing helpers `cbor-float-minimal.lisp` and
`scrivi-parola-header-cbor`, exports, ASDF order, coverage driver
scope, requirement and matrix, as well as the cold corpus and workers.

The first version of `riduci-significando64-cbor`, blob
`31a61d565e17607fd9498b0a423923a28b6e0159`, had a post-guard
`RESULT <= #x7fffff` after declaring `RESULT u23`: it did not check
a property distinct from the type. The COD-24 finding was corrected before
compilation or measurement. Lines 49–54 of the version read verify
separate reconstruction of the two input words, without combining them into
u64. The original and revision remain preserved in preparatory evidence.

<a id="dimensioni-e-percorsi"></a>

## Sizes and paths

Counted from `defun` to its end, including docstring and declarations.
Conservative paths: base one, one increment per choice, guard, and
additional short-circuit branch of AND/OR; a four-outcome `case` counts as three choices.
Chained comparisons are Lisp predicates, not loops added by the module.

| Function | File | Lines | Paths |
|---|---|---:|---:|
| `riduci-binary32-cbor` | narrow | 10–31: 22 | 7 |
| `riduci-significando64-cbor` | narrow | 37–55: 19 | 7 |
| `riduci-binary64-cbor` | narrow | 59–81: 23 | 7 |
| `check-float-cbor-range` | write | 9–22: 14 | 7 |
| `check-float-cbor-words` | write | 27–41: 15 | 8 |
| `seleziona-float-cbor` | write | 47–61: 15 | 9 |
| `scrivi-float-cbor-minimo` | write | 65–90: 26 | 6 |

All remain within COD-12/COD-13. Every function has a complete FTYPE,
a docstring with preconditions/postconditions/errors, and REQ references. `safety 3` is explicit.
The two numeric `cond` forms end in `t` with `invariant-violation`;
the word `case` ends in `otherwise` with the same condition.

<a id="inventario-delle-decisioni-composte"></a>

## Compound decision inventory

There are six new AND/OR forms. Corrected quotient post-guards use two
separate comparisons and an IF, adding no AND/OR. The table lists
the conditions; it does not claim that each has already been shown independently
decisive. Internal guard branches remain in the denominator of
future coverage.

| Position in write file | Form and conditions | Verification to perform |
|---|---|---|
| 13–14, range | AND: octet buffer; START index; END index; `START <= END <= LENGTH` | Non-simple/displaced destinations, types/ranges and precedence; separate internal guards |
| 36, AI25 words | AND: HIGH zero; LOW <= u16 maximum | Inconsistent words and LOW/consistency/capacity precedence |
| 51, input selection | OR: AI27; HIGH zero | Validated public inputs; internal guard inventoried |
| 55, reduction64 | AND: AI27; exactly narrowable to32 | 64 retained/reduced, thresholds and NaN payloads |
| 57, reduction32 | AND: AI26; exactly narrowable to16 | 32 retained/reduced, half expansions and subnormals |
| 59, output selection | OR: AI27 selected; HIGH zero | Selected forms and internal guard inventoried |

<a id="controlli-e-ragionamento-aritmetico"></a>

## Checks and arithmetic reasoning

For binary32, exponents 113–142 produce normal half values with bias
reduced by 112; exponents 103–112 produce subnormals through the implicit
significand and shift `126 - exponent`. The existing predicate requires
exact alignment before reduction. Zero and special values have separate
branches; the NaN fraction shifts by 13 bits, and the sign is
compared with the input sign.

For binary64, exponents 897–1150 produce normal binary32 values with bias
reduced by 896 and fraction derived from separate words; exponents
874–896 produce subnormals with shift `926 - exponent`, including 32.
The quotient uses at most HIGH21 and LOW32. Reconstruction verifies
HIGH via `ASH RESULT (SHIFT - 32)`; below 32 it derives LOW from only
the bottom one/two bits, otherwise requiring LOW zero. Intermediate shifts
reconstruct u32 words without materializing the entire binary64.
Infinities and NaNs retain sign and zero-padded significand, including the
signaling/quiet bit. Selection attempts 64→32 and then 32→16.

The writer checks range/AI, HIGH/LOW types, and consistency before selection;
then it verifies capacity for the selected form, using END. Only then
does it construct NEXT and write the lead. The nine-byte path writes HIGH4
and LOW4; the other forms write LOW2 or LOW4. The final guard compares
the cursor with NEXT; return is `(values next)`.

COD-24: reductions32/64 check input narrowability and output sign;
the quotient checks width/alignment and word reconstruction;
the range checks input and span identity; words check
external types and returned-form consistency; selection checks
the AI/HIGH relationship before and after; the writer checks span and progress.
Guards do not modify data. Internal errors are `invariant-violation`
and must reach the owner's fail-stop boundary.

<a id="checklist-c1-a-dodici-punti"></a>

## Twelve-point C1 checklist

1. **Requirements and ADRs.** REQ-CBR-004 implements local minimal raw writing;
   REQ-AFF-004/008 cover invariants and limits. ADR-0014 is consistent;
   the ADR-0048 document budget remains at a higher level.
2. **Invariants.** INV-F1 concerns bytes/format verified before returning
   NEXT; INV-P6 concerns exclusive buffers and no shared writes.
   The corpus contains cold comparisons of the entire array, errors without
   mutation, arity, sentinels, and workers on private destinations.
3. **Errors.** INVALID-ARGUMENT distinguishes range, AI, HIGH, LOW, and words;
   RESOURCE-EXHAUSTED distinguishes capacity. The corpus checks order, NIL offsets,
   and intact arrays. Internal guards have distinct reasons
   for input/fields, exponent, sign, alignment, reconstruction,
   AI, selection, span, and progress; the writer does not intercept errors.
4. **Limits.** No new loop or recursion. The existing BE helper takes
   at most four steps; at most two words and nine bytes per call.
   No waits in the product; test workers have timeouts and cleanup.
5. **Allocations.** No measurement performed yet: COD-30 remains to be
   verified with preregistered benchmark, baseline, and positive control.
   Static form alone is not proof of zero heap.
6. **Module boundary.** External words are validated before restrictive
   declarations and writing. The public result is
   NEXT; no native floats, ASTs, or shared references escape.
7. **Compound decisions.** Complete inventory above; raw coverage and
   demonstrations condition by condition remain to be produced. No
   MC/DC certification or automatic exclusion of guards.
8. **Ownership.** OWNER/SHARED declare exclusive destination and local
   words. No mutable global, arena, lock, or new scratch area in the product.
9. **Traceability and checks.** Requirement and matrix are statically updated;
   exports, ASDF, and exact two-file scope in the coverage driver are consistent.
   `make check` and tool self-tests remain to be run.
10. **Rules and deviations.** No static deviation requested for the
    version read; the earlier COD-24 finding is resolved. Warning-free
    compilation, measurements, and coverage are not anticipated by this reading.
11. **Parallelism.** No call on a private buffer touches another Serie's
    state or introduces a lock/wait/shared write. The product
    allows independent calls; future tests do not imply scaling.
12. **Durability.** No durable change, publication point,
    removal, or rollback introduced. Docstrings and contract explicitly
    declare this boundary and fail-stop on internal errors.

Outcome: no further static defect found in the identified version.
The second independent reading, campaigns, and C1 gate remain necessary.
