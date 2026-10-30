<a id="primo-item-cbor-minimo--decisioni-del-nuovo-sorgente"></a>

# First minimal CBOR item — new source decisions

Static inventory on 2026-10-15 before the first product
compilation. Source [cbor-item-read.lisp](../../src/codec/cbor-item-read.lisp),
blob `b9099dc8a8c96281063811e686deb4dcb2b1d39b`.
The [method](cbor-item-metodo.md) and [review](cbor-item-revisione.md)
distinguish inventory, static obligations, and measurements still to be run.

<a id="denominatore-completo-del-sorgente"></a>

## Complete source denominator

One function, lines10–43 inclusive: **34 lines**. Syntactic paths:
base1 +5UNLESS +1WHEN +1LOOP = **8**. Internal predicates
prevented by preflight or correct callees are included; no site is excluded.
The count is neither the SB-COVER instrumented denominator nor MC/DC.

**Six explicit control predicates**, one bounded loop, five
ERROR sites; **zero AND/OR**, zero AND/OR operands, four binary numeric
comparisons, and zero numeric chains. The three default keyword
initializations for MAX-BYTES/MAX-NODES/MAX-DEPTH, lines11–12, are declared
and not excluded from any instrumented coverage.

| ID | Line | Predicate | Static outcome or planned nominal pair |
| --- | ---: | --- | --- |
| D1 |22| `SPAN <= +CBOR-SCAN-MAX-BYTES+` | True after preflight. False implies a callee contract violation: no public pair claimed. |
| D2 |30| drain at current cursor, inside LOOP | False before first item; true after a complete item if another iteration exists, e.g., `00 FF`. This is the point that terminates without reading FF. |
| D3 |32| drain at current cursor, after LOOP | True on success, including `00` with one step; false for an empty window and truncated tag-only chain. |
| D4 |33| `CURSOR = LIMIT` | True in an empty window and after a tag chain exhausts bytes. False prevented by step progress and loop limit: internal static obligation, not an executed pair. |
| D5 |39| `BEGIN < NEXT` | True on success. False prevented by consuming at least one byte and a completed root: internal static obligation. |
| D6 |41| `NEXT <= LIMIT` | True on success. False prevented by step guards and bounded readers: internal static obligation. |

Sites D2 and D3 call the same drain but remain separate sites in the
denominator. There is no new compound decision for which to claim
condition independence; this does not close dependency MC/DC
or C1 qualification.

<a id="errori-espliciti-e-ciclo"></a>

## Explicit errors and loop

| Site | Line | INVARIANT-VIOLATION reason | Condition and nominal reachability |
| --- | ---: | --- | --- |
| E1 |23| `:cbor-item-loop-span` | D1 false, blocked by correct preflight. |
| E2 |34| `:cbor-item-loop-bound` | D3 false and D4 false, blocked by correct progress/limits. |
| E3 |36| `:cbor-item-empty-header` | Only if the existing reader returned normally on span `[LIMIT,LIMIT)`. The reader must instead raise `:cbor-truncated` at LIMIT. |
| E4 |40| `:cbor-item-read-progress` | D5 false, blocked by correct step/root. |
| E5 |42| `:cbor-item-read-range` | D6 false, blocked by step limits. |

`LOOP REPEAT SPAN`, line29, allows zero iterations for an empty window,
one for a scalar without a tail, and up to SPAN steps advancing at least one
byte. D2 may stop before the next step. Each drain has the existing
limit102; the step receives the original END and MINIMAL=T.
The corpus includes span0/1, chained tags, large payloads, and an unread
tail, without inferring that the theoretical maximum iteration count was
executed by a fixture whose payload advances in a single step.

Public range/workspace/alias/limits/byte-budget rejections and
header/UTF8/nodes/depth rejections propagate from existing functions, without
new predicates in this file. They remain in the contract and corpus;
local coverage of the new file does not measure their dependency sites.

<a id="lettura-meccanica-e-stato"></a>

## Mechanical reading and status

The C4 reader `review/read-product-decisions-v2.lisp`, preserved in the
increment's ignored support area, reads four DATA forms with
READ-EVAL NIL to EOF and confirms the counts above; stdout preserved,
stderr empty, exit0. It does not load, evaluate, or compile product forms.
The first variant had a missing parenthesis in the reader itself:
source and stdout/stderr are preserved separately and do not count
as product tests. Line measurement is a manual count.

Runtime results, all raw denominators, any missing instrumented
forms, heap, and eight mutations remain to be measured.
No exclusion and no C1/MC/DC certification follows from this table.
