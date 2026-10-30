<a id="decisioni-della-composizione-dei-tag-cbor"></a>

# CBOR tag composition decisions

Static inventory dated 2026-10-14, before first compilation and
campaigns. Input blob `6dfad07035ac8040b2aec0a455c175ea15dfd9ad`,
write blob `16b91fc27eabafd7ff12bfb0a56ed34208c2bd4b`:
[input](../../src/codec/cbor-tag-input.lisp),
[write](../../src/codec/cbor-tag-write.lisp),
[method](cbor-tag-metodo.md), [second reading](cbor-tag-lettura.md).

Abbreviated names below identify `test-REQ-CBR-007-tag-*` in frozen
corpus `tests/codec/cbor-tag-write.lisp`, blob
`df97950ec8d24157bb6566c7995262f7beea7742`. Witnesses are planned
cases, not execution results. T/F are logical condition
values, even when short-circuiting prevents evaluation.
Static pairs indicate changing one condition while retaining other
truth values; they do not attest dynamic MC/DC.

All sites, including declarations, internal guards, ERROR forms, and
relations prevented by the valid public API, remain in future raw
observation denominators. No exclusion or C1 qualification.

<a id="cinque-decisioni-andor-undici-operandi"></a>

## Five AND/OR decisions, eleven operands

| ID/site | Operator and ordered conditions | Pairs and witnesses |
|---|---|---|
| D1 input:15, check-spazio-tag-cbor | OR A=BUFFER EQ SPACE.KINDS; B=SOURCE EQ SPACE.KINDS | `(T,F)` and `(F,F)` make A decisive; `(F,T)` and `(F,F)` make B decisive. `workspace-type-and-both-kinds-aliases` roles0/1 and separate buffer/source in `configured-limits-and-root-two-node-minimum`. |
| D2 input:49, check-overlap-tag-cbor | AND A=START<NEXT; B=NEXT<=LENGTH(BUFFER) | `(START,NEXT,LENGTH)=(3,5,12)` gives TT; `(5,5,12)` FT for A; `(3,13,12)` TF for B. These two false internal guards are prevented by nonempty content and capacity preflight. `capacity-active-end-and-complete-byte-budget` and `destination-type-and-range-precedes-everything` protect public domains; do not execute the two internal false outcomes. |
| D3 input:51, check-overlap-tag-cbor | AND A=SOURCE-START<SOURCE-END; B=SOURCE-END<=LENGTH(SOURCE) | `(SS,SE,LENGTH)=(7,8,13)` TT; `(8,8,13)` FT; `(7,14,13)` TF. Internal false outcomes already prevented by source range/empty validators. `source-type-range-empty-and-backing-array-intact` verifies public rejections without attesting false internal guards. |
| D4 input:53, check-overlap-tag-cbor | AND A=BUFFER EQ SOURCE; B=START<SOURCE-END; C=SOURCE-START<NEXT | TTT: same array, SS16/SE17, START8/NEXT18. FTT: distinct arrays, SS7/SE8, START7/NEXT9 in tag0 probe. TFT: same array, SS16/SE17, START17/NEXT27. TTF: same array, SS16/SE17, START6/NEXT16. Three pairs against TTT make A/B/C separately decisive; `overlap-including-only-header-and-touching-boundaries` and `u32-word-width-boundaries-and-all-wire-sentinels`. |
| D5 write:15, verifica-contenuto-tag-cbor | AND A=START<END; B=END<=LENGTH(SOURCE) | `(START,END,LENGTH)=(7,8,13)` TT; `(8,8,13)` FT; `(7,14,13)` TF. Internal false outcomes prevented by preflight and results passed. Source type/range/empty corpus verifies public rejections before scanner; internal errors remain to be observed, without exclusion. |

No nested AND/OR, no new LOOP. For D2/D3/D5 numeric
pairs are meaningful static obligations, not existing helper invocations
with violated preconditions. A campaign only on valid API
may leave those false outcomes uncovered: complete raw data will be retained.

<a id="relazioni-numeriche-concatenate"></a>

## Chained numeric relations

Two predicates with two relations each: four relations. They are not
AND/OR written in source; inventory separate from syntactic paths.

| Site | Ordered relations | Static pairs and witness limits |
|---|---|---|
| write:19 | A=2<=MAX-NODES; B=MAX-NODES<=16MiB | MAX-NODES2 gives TT;1 gives FT;16777217 gives TF. `configured-limits-and-root-two-node-minimum` and `all-preflight-phase-precedences` cover public rejections for1 and over maximum. Helper is not reached on those false outcomes; its ERROR form remains in coverage. |
| write:26 | A=1<=NODES; B=NODES<=MAX-NODES−1 | Remainder1/NODES1 gives TT (`configured-limits-and-root-two-node-minimum`, scalar with budget2). Remainder1/NODES0 would give FT; remainder1/NODES2 would give TF. These two results would violate scanner contract and require an internal scanner fault to reach ERROR. `root-and-content-node-residue-long-tag-chains-no-frame` verifies remainder1 and insufficiency, but scanner error precedes postcondition on false B. |

The other twenty-one relational predicates are binary: input:27/31/36/38,
49x2/51x2/53x2,77/79/81; write:15x2/17/24/28/61/63/66.
Total23 `<`/`<=`/`=`/`>` forms with25 elementary relations including
both chains. `PLUSP SPAN` input:29 and `ZEROP SPAN` input:69 are
two other numeric predicates, inventoried in guards below.

<a id="tutte-le-guardie-e-le-forme-di-errore"></a>

## All guards and error forms

23 WHEN/UNLESS sites,23 ERROR forms: input14, write9. IA=INVALID-ARGUMENT,
RE=RESOURCE-EXHAUSTED, IV=INVARIANT-VIOLATION. All new local
errors omit OFFSET, therefore NIL; scanner errors retain absolute
SOURCE offset. API does not intercept parser conditions.

| Function | Site: condition and reason | Witness/property |
|---|---|---|
| check-spazio-tag-cbor | input:13 SPACE type → IA `:cbor-workspace`;15 alias OR → IA `:cbor-tag-workspace-alias` | workspace-type-and-both-kinds-aliases, invalid and two roles; before invalid limits |
| dimensioni-tag-cbor | input:27 START<=END → IV `:cbor-tag-dimension-range`;29 positive SPAN → IV `:cbor-tag-dimension-empty` | Public range/empty-source checks precede helper; internal false outcomes remain in scope |
| dimensioni-tag-cbor | input:31 SPAN>MAX-BYTES;36 ITEM-SIZE>MAX-BYTES → RE `:cbor-tag-byte-budget`;38 ITEM-SIZE>END-START → RE `:cbor-tag-capacity` | full-16MiB-with-one-and-nine-byte-header-and-over includes SPAN over maximum; capacity-active-end-and-complete-byte-budget distinguishes payload and complete tag, physical capacity ignored beyond END |
| check-overlap-tag-cbor | input:49 target span → IV `:cbor-tag-target-span`;51 source span → IV `:cbor-tag-source-span`;53 complete intersection → IA `:cbor-tag-overlap` | D2/D3 internal; D4 distinct/disjoint/touching arrays/header-only and payload overlap |
| check-input-tag-cbor | input:69 SPAN0 → IA `:cbor-tag-source-empty`;77 MAX-NODES<2 → RE `:cbor-tag-node-budget` | Empty source before words; minimum2 before parsing, but after bytes/capacity/overlap |
| check-input-tag-cbor | input:79 SPAN=SOURCE-END−SOURCE-START → IV `:cbor-tag-input-span`;81 ITEM-SIZE<=END−START → IV `:cbor-tag-input-capacity` | Validator/dimension result balances; active progress guards, not false public calls |
| verifica-contenuto-tag-cbor | write:15 range → IV `:cbor-tag-child-range`;17 SPAN=END−START → IV `:cbor-tag-child-span`;19 2<=MAX-NODES<=16MiB → IV `:cbor-tag-child-budget` | Proven preflight range/budget, D5 and first chain; all ERRORs retained |
| verifica-contenuto-tag-cbor | write:24 NEXT=END → IV `:cbor-tag-child-progress`;26 1<=NODES<=MAX-NODES−1 → IV `:cbor-tag-child-nodes`;28 PEAK<=MAX-DEPTH → IV `:cbor-tag-child-depth` | Actual scanner statistics, second chain; scratch-content-only-statistics-after-success, root-and-content-node-residue-long-tag-chains-no-frame, depth-unchanged-zero-scalars-and-100-101-containers; internal false outcomes not declared executed |
| scrivi-tag-cbor-minimo | write:61 PAYLOAD-START=BEGIN+HEADER-SIZE → IV `:cbor-tag-header-progress`;63 NEXT−PAYLOAD-START=SPAN → IV `:cbor-tag-payload-span`;66 RESULT=NEXT → IV `:cbor-tag-write-progress` | Cold headers, whole buffer, concatenation, arity, and immutable source compare results; internal ERRORs after first write, without rollback |

Preflight phases and parser errors are witnessed separately:
`all-preflight-phase-precedences`, `parser-failures-absolute-offset-and-complete-single-item`,
`every-truncation-nonzero-source-start-and-exact-end`,
`scratch-reuse-after-parser-and-preflight-errors`, and
`fixed-seed-1024-fuzz-and-frozen-class-counts`. Content scratch
does not include emitted root tag. Every success checks one NEXT.

<a id="righe-e-percorsi-sintattici"></a>

## Lines and syntactic paths

DEFUN through final parenthesis inclusive, with docstrings/declarations.
Paths=1+WHEN/UNLESS+AND/OR operands beyond first. Numeric chains
separately inventoried; no new IF/COND/CASE/LOOP.

| Function | File/lines | Lines | Guards | Paths |
|---|---|---:|---:|---:|
| check-spazio-tag-cbor | input:9–17 |9|2|4|
| dimensioni-tag-cbor | input:22–40 |19|5|6|
| check-overlap-tag-cbor | input:45–55 |11|3|8|
| check-input-tag-cbor | input:60–83 |24|4|5|
| verifica-contenuto-tag-cbor | write:10–30 |21|6|8|
| scrivi-tag-cbor-minimo | write:36–68 |33|3|4|

Maximum33 lines and8 paths, within COD-12/13 under stated convention.
Six functions,23 guards/ERRORs,5 AND/OR11 operands,2 chains4 relations, and0 loops
also confirmed by reading forms as DATA, READ-EVAL NIL
and EOF, without compiling or executing product. No guard removed
because internal, redundant with public path, or linked to ERROR.
