<a id="decisioni-della-composizione-degli-array-cbor"></a>

# CBOR array composition decisions

Static inventory dated 2026-10-13, before compilation and campaigns:
`src/codec/cbor-array-input.lisp` blob
`d3b3d07fc18bd2a077c1a2d79020a76263b2779e` and
`src/codec/cbor-array-write.lisp` blob
`a410297c29c5d043ad60d3804bd3711e22c2833b`.
References: [method](cbor-array-metodo.md) and
[first C1 reading](cbor-array-revisione.md).

Witnesses are cases present in the frozen corpus or internal properties
to compare with future tests. They are neither execution results nor
an MC/DC demonstration. All sites, including internal guards and error
forms, remain in the denominators of future raw measurements. Declarations,
invariants, or branches unreachable from the public API are not
automatically excluded.

<a id="tutte-le-nuove-decisioni-andor"></a>

## All new AND/OR decisions

Five sites, 14 operands; no nested compound form. The write file
contains no AND/OR. Conditions are listed in evaluation order,
including short-circuiting.

| File/line, function | Form and conditions | Expected witnesses or limit |
|---|---|---|
| input:15, `check-tabella-array-cbor` | AND: COUNT INDEX; COUNT<=LENGTH(ITEM-ENDS); COUNT<=SPAN | `table-type-and-count-domains`: NIL/negative/float/bignum; COUNT2 with table1 and SPAN2; COUNT1 with table1 and SPAN0; valid cases and COUNT0 |
| input:17, `check-tabella-array-cbor` | AND: COUNT zero; SPAN positive | COUNT0/SPAN1 rejected; COUNT0/SPAN0 accepted; valid positive COUNT |
| input:30–32, `check-spazio-array-cbor` | OR: BUFFER EQ SPACE.KINDS; SOURCE EQ SPACE.KINDS; ITEM-ENDS EQ SPACE.REMAINING | `workspace-type-and-all-scratch-aliases-even-empty` separately exercises the three roles; valid case without alias |
| input:67–68, `check-overlap-array-cbor` | AND: BUFFER EQ SOURCE; SOURCE-START<SOURCE-END; START<SOURCE-END; SOURCE-START<NEXT | `overlap-entire-footprint-touching-and-empty`: distinct arrays, empty source, spans before/touching/after, header or payload overlap |
| input:88, `check-fini-array-cbor` | AND: PREVIOUS<STOP; STOP<=SPAN | `strict-entry-order-bounds-last-and-unread-tail`: zero/duplicate/descending; end beyond SPAN; valid growth and ignored tail |

These abbreviated names identify the
`test-REQ-CBR-005-array-*` tests in `tests/codec/cbor-array-write.lisp`,
blob `b13f58264f3cd97e1947ee52936732a7fcebe672`.
The presence of a case per operand does not attest that all
operands have already been independently decisive.

<a id="relazioni-numeriche-concatenate"></a>

## Chained numeric relations

Eight predicates, each with two mathematical comparisons. They are not AND/OR
written in source and are not added to the syntactic path count.
They remain explicitly inventoried for condition-by-condition reading
and interpretation of forms observed by SB-COVER.

| File/line | Relation | Properties checked |
|---|---|---|
| input:63 | START<=NEXT<=LENGTH(BUFFER) | footprint order and physical bound |
| input:65 | SOURCE-START<=SOURCE-END<=LENGTH(SOURCE) | source order and physical bound |
| input:82 | COUNT<=SPAN<=16MiB | table work and clamp before cast/addition |
| write:15 | START<=END<=LENGTH(SOURCE) | individual child range |
| write:28 | 1<=NODES<=REMAINING | at least one node and actual remainder respected |
| write:44 | START<=END<=LENGTH(SOURCE) | overall children range |
| write:60 | 1+COUNT<=NODES<=MAX-NODES | root/children minimum and aggregate limit |
| write:62 | 1<=PEAK<=MAX-DEPTH | root level and aggregate limit |

Errors in these eight relations are internal. The public domain
validates ranges and budgets first; scanning supplies nodes and
peaks that are compared, without assuming internal error branches
are reachable from a valid public call.

<a id="inventario-completo-delle-guardie-e-dei-cicli"></a>

## Complete guard and loop inventory

36 WHEN/UNLESS sites and two LOOPs. IA=INVALID-ARGUMENT,
RE=RESOURCE-EXHAUSTED, IV=INVARIANT-VIOLATION. Preflight-check
and invariant offsets are NIL; the only local RE during scanning,
write:17, uses the absolute start of the next child.

| Function / lines | Guards, error outcome, and limit |
|---|---|
| `check-tabella-array-cbor`, input:13/15/17 | simple U32 type → IA `:cbor-array-item-ends`; AND on COUNT → IA `:cbor-array-count`; COUNT0 with positive SPAN → same reason |
| `check-spazio-array-cbor`, input:28/30 | SPACE type → IA `:cbor-workspace`; OR of three aliases → IA `:cbor-array-workspace-alias` |
| `dimensioni-array-cbor`, input:44/50/52 | SPAN>MAX-BYTES, then ITEM-SIZE>MAX-BYTES → RE `:cbor-array-byte-budget`; ITEM-SIZE>END-START → RE `:cbor-array-capacity` |
| `check-overlap-array-cbor`, input:63/65/67 | target/source range → IV `:cbor-array-target-span` / `:cbor-array-source-span`; full overlap AND → IA `:cbor-array-overlap` |
| `check-fini-array-cbor`, input:80/82/86/88/91 | COUNT<=length → IV `:cbor-array-table-bound`; COUNT<=SPAN<=16MiB → IV `:cbor-array-table-budget`; LOOP COUNT; growth/bound and last end=SPAN → IA `:cbor-array-item-ends` |
| `check-radice-array-cbor`, input:101/103 | COUNT>MAX-NODES-1 → RE `:cbor-array-node-budget`; MAX-DEPTH0 → RE `:cbor-array-depth-budget`, in this order |
| `check-input-array-cbor`, input:127/129 | SPAN=SOURCE-END-SOURCE-START → IV `:cbor-array-input-span`; ITEM-SIZE<=END-START → IV `:cbor-array-input-capacity` |
| `verifica-figlio-array-cbor`, write:15/17/21/26/28/30 | range → IV `:cbor-array-child-range`; REMAINING0 → RE `:cbor-array-node-budget` with offset START; positive SPAN → IV `:cbor-array-child-empty`; NEXT=END → IV `:cbor-array-child-progress`; 1<=NODES<=REMAINING → IV `:cbor-array-child-nodes`; PEAK<=CHILD-DEPTH → IV `:cbor-array-child-depth` |
| `verifica-figli-array-cbor`, write:44/46/48/52/58/60/62 | range → IV `:cbor-array-children-range`; COUNT<=length → IV `:cbor-array-children-bound`; COUNT<=16MiB → IV `:cbor-array-children-budget`; LOOP COUNT; CURSOR=END → IV `:cbor-array-children-progress`; aggregate nodes → IV `:cbor-array-children-nodes`; aggregate peak → IV `:cbor-array-children-depth` |
| `scrivi-array-cbor-minimo`, write:92/94/98/100/103 | NODES<=MAX-NODES / PEAK<=MAX-DEPTH → IV `:cbor-array-result-nodes` / `:cbor-array-result-depth`; PAYLOAD-START=BEGIN+HEADER-SIZE → IV `:cbor-array-header-progress`; NEXT-PAYLOAD-START=SPAN → IV `:cbor-array-payload-span`; RESULT=NEXT → IV `:cbor-array-write-progress` |

LOOPs have COUNT verified before the first entry: COUNT<=SPAN,
SPAN<=MAX-BYTES<=16MiB. The second LOOP derives every absolute end from a
relative end already verified within SOURCE-END; it passes remaining nodes and
MAX-DEPTH-1 to the scanner. No path writes the destination before
scanning completes. COUNT0 neither calls nor resets the scanner.

Syntactic paths for the seven input functions are
7/5/4/7/7/3/3; for the three write functions, 7/8/6. The maximum is
eight, including short circuits and LOOPs. The future raw report
retains all internal branches, independently of these counts.

<a id="decisioni-riusate-e-precedenza"></a>

## Reused decisions and precedence

`check-span-string-cbor-write` is called for destination and source;
`check-limiti-struttura-cbor` retains byte/node/depth order.
Header selection/emission, minimal scanner, and copy are not duplicated:
their existing checks, conditions, and error reasons apply. For
reused forms, consult the
[string](cbor-stringhe-decisioni.md) and
[minimal-scanner](cbor-minimo-struttura-decisioni.md) inventories.
The two new files' raw scope does not measure all dependencies.

Precedence is destination range, source range, table/COUNT,
workspace/alias, configured limits, bytes, capacity, overlap, entries,
minimum nodes, root depth, child scanner in order. Scanner errors
propagate with reason and absolute SOURCE offset. Writer guards
after first emission are fail-stop without rollback.
