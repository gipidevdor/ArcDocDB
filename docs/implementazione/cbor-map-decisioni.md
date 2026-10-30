<a id="decisioni-della-composizione-delle-mappe-cbor"></a>

# CBOR map composition decisions

Static inventory dated 2026-10-14, before first compilation and campaigns.
Frozen sources: `src/codec/cbor-map-input.lisp`, blob
`d7a593badeb6e6b71f28dc4e80c641b07189d0b8`, and
`src/codec/cbor-map-write.lisp`, blob
`22e814ea68e606c5bc58033c2a31e945303a9d65`.
[Method](cbor-map-metodo.md) and [first C1 reading](cbor-map-revisione.md).

The indicated witnesses are cases present in the frozen corpus or internal properties
to compare with future tests: they are not execution results or MC/DC
attestations. All sites, including declarations, internal guards, error forms, and
relations unreachable from the valid public API, remain in the denominators
of future raw observations. No exclusion is approved here.

<a id="decisioni-andor"></a>

## AND/OR decisions

**Five sites, 14 operands**, no nested AND/OR form. The new write file
contains no AND/OR. Conditions are listed in short-circuit order.

| File/line and function | Operator and conditions | Expected witnesses |
|---|---|---|
| input:16, `check-tabella-mappa-cbor` | AND: COUNT INDEX; COUNT<=FLOOR(LENGTH(ITEM-ENDS)/2); COUNT<=FLOOR(SPAN/2) | `table-type-count-domains-and-half-length-before-multiplication`: NIL/negative/float/symbol/bignum; table too short; SPAN too short with sufficient table; valid values |
| input:19, `check-tabella-mappa-cbor` | AND: COUNT zero; SPAN positive | COUNT0/SPAN>0 rejected; valid empty; valid positive COUNT |
| input:32–34, `check-spazio-mappa-cbor` | OR: BUFFER EQ SPACE.KINDS; SOURCE EQ SPACE.KINDS; ITEM-ENDS EQ SPACE.REMAINING | `workspace-type-and-all-scratch-aliases-even-empty`: three separate roles, empty/nonempty, and no-alias case |
| input:73–74, `check-overlap-mappa-cbor` | AND: BUFFER EQ SOURCE; SOURCE-START<SOURCE-END; START<SOURCE-END; SOURCE-START<NEXT | `overlap-entire-footprint-touching-and-empty`: distinct arrays, empty span, disjoint/touching left/right, header/payload overlap; broad END with disjoint footprint |
| input:94, `check-fini-mappa-cbor` | AND: PREVIOUS<STOP; STOP<=SPAN | `strict-active-ends-last-and-unread-even-or-odd-tail`: zero/duplicate/descending, end beyond SPAN, valid growth, and even/odd inactive tails |

Abbreviated names identify `test-REQ-CBR-006-map-*` in
`tests/codec/cbor-map-write.lisp`, blob
`6ad0e9b5a48ba9c32c46d720f2f7f1821368d6c8`.
The presence of witnesses for operands does not certify that every condition has
already been observed independently decisive.

<a id="relazioni-numeriche-concatenate"></a>

## Chained numeric relations

**Nine predicates with two relations each: 18 relations.** As in previous
codec inventories, they are not AND/OR written in source and are not added
to the syntactic path count. They remain separately inventoried for
condition-by-condition reading and interpretation of SB-COVER forms.

| File/line | Ordered relations | Properties |
|---|---|---|
| input:69 | START<=NEXT; NEXT<=LENGTH(BUFFER) | footprint order and physical bound |
| input:71 | SOURCE-START<=SOURCE-END; SOURCE-END<=LENGTH(SOURCE) | source order and physical bound |
| input:88 | ITEMS<=SPAN; SPAN<=16MiB | clamp of end-position loop and conversion |
| write:15 | START<=END; END<=LENGTH(SOURCE) | individual item span |
| write:28 | 1<=NODES; NODES<=REMAINING | at least one node, actual remaining budget |
| write:44 | START<=END; END<=LENGTH(SOURCE) | overall key/value span |
| write:50 | 1<=MAX-DEPTH; MAX-DEPTH<=100 | root domain before MAX-DEPTH-1 |
| write:62 | 1+ITEMS<=NODES; NODES<=MAX-NODES | root and all items within aggregate budget |
| write:64 | 1<=PEAK; PEAK<=MAX-DEPTH | root level and aggregate peak |

Rejections are internal invariants, without exclusion from measurements. Public
domains are checked before entering typed functions;
postconditions compare nodes/peak/progress actually returned by callees.

<a id="tutte-le-guardie-e-i-cicli"></a>

## All guards and loops

**40 WHEN/UNLESS sites and two LOOPs.** IA=INVALID-ARGUMENT,
RE=RESOURCE-EXHAUSTED, IV=INVARIANT-VIOLATION. All local offsets are NIL,
except RE at write:17, which uses the next item's absolute START. Errors
propagated by the scanner retain type, reason, and absolute SOURCE offset.

| Function | Sites and conditions → rejection |
|---|---|
| `check-tabella-mappa-cbor` | input:14 simple U32 type → IA `:cbor-map-item-ends`; input:16 COUNT domain and two separate comparisons against half table/SPAN → IA `:cbor-map-count`; input:19 COUNT0/positive SPAN → same reason |
| `check-spazio-mappa-cbor` | input:30 correct SPACE → IA `:cbor-workspace`; input:32 OR of three aliases → IA `:cbor-map-workspace-alias` |
| `dimensioni-mappa-cbor` | input:46 START<=END → IV `:cbor-map-dimension-range`; input:48 COUNT<=FLOOR(SPAN/2) → IV `:cbor-map-dimension-pairs`; input:50 SPAN>MAX-BYTES and input:56 ITEM-SIZE>MAX-BYTES → RE `:cbor-map-byte-budget`; input:58 ITEM-SIZE>END-START → RE `:cbor-map-capacity` |
| `check-overlap-mappa-cbor` | input:69/71 range → IV `:cbor-map-target-span` / `:cbor-map-source-span`; input:73 complete footprint overlap → IA `:cbor-map-overlap` |
| `check-fini-mappa-cbor` | input:86 ITEMS<=LENGTH(ITEM-ENDS) → IV `:cbor-map-table-bound`; input:88 ITEMS<=SPAN<=16MiB → IV `:cbor-map-table-budget`; input:94 monotonicity/bound → IA `:cbor-map-item-ends`; input:97 last end=SPAN → same reason |
| `check-radice-mappa-cbor` | input:107 ITEMS>MAX-NODES-1 → RE `:cbor-map-node-budget`; input:109 MAX-DEPTH0 → RE `:cbor-map-depth-budget`, in that order |
| `check-input-mappa-cbor` | input:133 SPAN=SOURCE-END-SOURCE-START → IV `:cbor-map-input-span`; input:135 ITEM-SIZE<=END-START → IV `:cbor-map-input-capacity`; input:137 ITEMS=2*COUNT → IV `:cbor-map-input-pairs` |
| `verifica-figlio-mappa-cbor` | write:15 range → IV `:cbor-map-child-range`; write:17 REMAINING0 → RE `:cbor-map-node-budget` with offset START; write:21 positive SPAN → IV `:cbor-map-child-empty`; write:26 NEXT=END → IV `:cbor-map-child-progress`; write:28 1<=NODES<=REMAINING → IV `:cbor-map-child-nodes`; write:30 PEAK<=CHILD-DEPTH → IV `:cbor-map-child-depth` |
| `verifica-figli-mappa-cbor` | write:44 range → IV `:cbor-map-children-range`; write:46 ITEMS<=LENGTH(ITEM-ENDS) → IV `:cbor-map-children-bound`; write:48 ITEMS<=16MiB → IV `:cbor-map-children-budget`; write:50 root-depth domain → IV `:cbor-map-children-root-depth`; write:60 CURSOR=END → IV `:cbor-map-children-progress`; write:62 aggregate nodes → IV `:cbor-map-children-nodes`; write:64 aggregate peak → IV `:cbor-map-children-depth` |
| `scrivi-mappa-cbor-minima` | write:96 NODES<=MAX-NODES → IV `:cbor-map-result-nodes`; write:98 PEAK<=MAX-DEPTH → IV `:cbor-map-result-depth`; write:102 PAYLOAD-START=BEGIN+HEADER-SIZE → IV `:cbor-map-header-progress`; write:104 NEXT-PAYLOAD-START=SPAN → IV `:cbor-map-payload-span`; write:107 RESULT=NEXT → IV `:cbor-map-write-progress` |

| Loop | Bound and progress |
|---|---|
| input:92, `check-fini-mappa-cbor` | POSITION<ITEMS, ITEMS=2*COUNT<=SPAN<=16MiB; first entry after byte/capacity/overlap preflight; STOP increasing within SPAN |
| write:54, `verifica-figli-mappa-cbor` | POSITION<ITEMS<=16MiB; ends already validated, absolute STOP increasing within SOURCE-END; bounded scanner per item, reset/drain102, remaining nodes and MAX-DEPTH-1 |

COUNT is compared with FLOOR of the two lengths before doubling.
SPAN is checked against MAX-BYTES<=16MiB before u32 cast/addition and
loops. The inactive table tail is not limited to SPAN. Items
alternate key and value: the header receives COUNT, the loop receives 2*COUNT.
The destination is written only after complete scanning. ITEMS0 neither
calls nor resets the scanner and returns nodes 1/peak 1.

<a id="righe-e-percorsi-sintattici"></a>

## Lines and syntactic paths

Count from DEFUN through its final parenthesis inclusive, including docstrings and
declarations. Paths: base1 plus WHEN/UNLESS, extra AND/OR short circuits,
and LOOP. No new IF/COND/CASE. Chained relations above have their own
separate semantic inventory; this count does not replace raw coverage.

| File/function | Lines | Line count | Paths |
|---|---|---:|---:|
| input, `check-tabella-mappa-cbor` | 9–21 | 13 | 7 |
| input, `check-spazio-mappa-cbor` | 26–36 | 11 | 5 |
| input, `dimensioni-mappa-cbor` | 41–60 | 20 | 6 |
| input, `check-overlap-mappa-cbor` | 65–76 | 12 | 7 |
| input, `check-fini-mappa-cbor` | 81–99 | 19 | 7 |
| input, `check-radice-mappa-cbor` | 103–111 | 9 | 3 |
| input, `check-input-mappa-cbor` | 116–139 | 24 | 4 |
| write, `verifica-figlio-mappa-cbor` | 10–32 | 23 | 7 |
| write, `verifica-figli-mappa-cbor` | 38–66 | 29 | 9 |
| write, `scrivi-mappa-cbor-minima` | 72–109 | 38 | 6 |

Maximums: **38 lines, nine paths**, within COD-12/13 under the stated convention.
Guards: input 22 + write 18 = 40; LOOP 1+1; AND/OR 5 with 14 operands;
chained comparisons 9 with 18 relations. No site is removed because it is internal,
redundant with the public path, or associated with an error form.
