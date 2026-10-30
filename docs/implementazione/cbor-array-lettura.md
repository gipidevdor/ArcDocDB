<a id="composizione-degli-array-cbor--seconda-lettura-c1"></a>

# CBOR array composition — second C1 reading

Static reading by the blind-corpus owner on 2026-10-13,
after test freeze and subsequent product writing, before
compilation, load, or campaigns. The [preregistered method](cbor-array-metodo.md)
has blob `2f257c9e8a56a5182142934dada3f3b38b5bef65`; communicated base
`13983d3`, branch `codex/cbor-array-write`. This reading is independent
of the product author and did not consult the first reading or new
inventory. It changes neither product nor frozen corpus.

| Product examined | Git blob |
| --- | --- |
| `src/codec/cbor-array-input.lisp` | `d3b3d07fc18bd2a077c1a2d79020a76263b2779e` |
| `src/codec/cbor-array-write.lisp` | `a410297c29c5d043ad60d3804bd3711e22c2833b` |

No functional defect or open static finding identified in the examined
blobs. Strict build, lint, corpus results, heap allocation, parallel
intervals, coverage, and mutations remain pending. This reading does not
close a C1 gate, attest MC/DC, or qualify the engine.

<a id="checklist-c1"></a>

## C1 checklist

| Item | Static finding and reading limit |
| --- | --- |
| 1. Requirements and ADRs | REQ-CBR-005 from ADR-0014, LIM-001/002, AFF-004/008, INV-F1/P6/A8, and ADR-0033/0035/0048 are consistent with a local composer of minimal wire items. It introduces no tag semantics, map ordering/deduplication, or NaN normalization. |
| 2. Invariants | Types and spans, relative partition, full budgets, scratch separation, and disjoint footprint precede scanning. All children are verified before the header. Guards also check endpoints, progress, remainders, statistics, and final copy; the corpus compares complete physical arrays. |
| 3. Errors | Method steps are respected in order. Preflight produces INVALID-ARGUMENT or RESOURCE-EXHAUSTED with offset NIL; initform in conditions:8. Remaining nodes0 produces :cbor-array-node-budget at the next child's absolute start; other scanner errors propagate untranslated. All public rejections precede the first write. Internal INVARIANT-VIOLATION requires owner fail-stop, without rollback. |
| 4. Limits | The two new LOOPs read at most COUNT entries, with COUNT<=SPAN<=16MiB verified. Every scanner receives its span as byte budget and remaining nodes; reset/drain are bounded to 102 frames. Existing copy bounded to SPAN, header at most 5 bytes. No recursion, wait, retry, or worker creation in the product. |
| 5. Heap | New success path with multiple values, cursors, and direct calls, without constructors, closures, AST, or temporary arrays. On SBCL64, index/u32 values and bounded sums remain immediate. Keyword calls, scanner, and copy nevertheless require a serial benchmark with zero baseline and positive sensor; zero heap allocation is not statically attested. |
| 6. Verified data | The result is minimal MT4, COUNT in HIGH0/LOW, followed by the already-verified, exactly copied payload. Only [START,NEXT) is written. Header progress, length equality, and final NEXT are checked; the final variable returns one value. |
| 7. Compound decisions | Five AND/OR and two LOOPs in the new files, listed below. Chained relations, internal guards, and error branches remain explicit: no denominator exclusion, no attestation of dynamic condition independence. |
| 8. Owner | OWNER/SHARED declare destination and scratch exclusive, SOURCE and ITEM-ENDS stable and shareable for reading. Simple arrays rule out displaced backing. Scratch aliases are rejected even when empty; BUFFER=SOURCE is allowed only with a source span disjoint from the complete footprint, including header. |
| 9. Integration | Export cbor-package:12; serial ASDF loads the two new files after scanner/header/copy, the three tests after previous support, and RUN:208. Coverage selects exactly the two sources, with positive/negative suffix cases and dedicated dispatch. Catalog and matrix include REQ-CBR-005 without :cov; make check was not run in this reading. |
| 10. Standard | Safety3, complete FTYPEs, array types, Pre/Post/error docstrings, REQ, and active guards present. Ten functions of 9–36 lines and 3–8 paths by the count below, within 60/10. No deviation proposed. Absence of warning/style-warning and lint must be observed later. |
| 11. Parallelism | No lock, wait, or shared write between Serie on the product path. The corpus reuses two workers, private destinations and scratch, and shared immutable inputs, with separate semaphores for each of the two waves. Sink, timeout, join, cleanup, and overlap must be observed; they do not demonstrate scaling or simultaneous execution on cores. |
| 12. Durability | Only mutation of caller-exclusive memory; no I/O, commit, deletion, or durable/atomic publication. The codec does not perform Serie transitions: FAULTED and fail-stop on internal errors remain at the owner boundary. |

<a id="preflight-budget-e-preservazione"></a>

## Preflight, budgets, and preservation

`check-input-array-cbor` (input:116–126) composes destination range,
source range, table type/COUNT, workspace type/alias, configured limits,
SPAN and full size against bytes, capacity, overlap, entries,
minimum nodes, and root level. LENGTH and arithmetic on external data are
protected by type checks. No reset or write occurs.

SPAN is checked before addition and the COUNT-to-u32 cast (input:44–48):
COUNT<=SPAN and MAX-BYTES<=16MiB make the cast and 1/2/3/5-byte header safe.
ITEM-SIZE includes the header; END−START capacity is checked before
NEXT=START+ITEM-SIZE. NEXT<=END prevents index overflow. Nonempty,
increasing relative ends, <=SPAN with last=SPAN, bound every absolute STOP
to SOURCE-END; only the first COUNT cells are read (input:86–92).

Overlap uses [START,NEXT), not the whole range up to END
(input:67–69). Strict inequalities allow touching boundaries;
the SOURCE-START<SOURCE-END test allows emptiness. With BUFFER=SOURCE,
success changes only the destination footprint and preserves the disjoint source
span. On public errors, all physical arrays remain
intact. Intact scratch during preflight is also guaranteed by KINDS and
REMAINING aliases rejected before any scanner.

The root requires 1 node and 1 level (input:101–104). The child loop
starts with NODES=1, PEAK=1, CHILD-DEPTH=MAX-DEPTH−1 (write:50). Each child
uses MAX-NODES−NODES and then adds its nodes, including tags; peak
is MAX(PEAK,1+CHILD-PEAK). Remainder1 is passed to the scanner, remainder0
is rejected before its reset (write:17–25). For 8100/00, budget3
exhausts the remainder at the second child, budget4 accepts. A child with 99
containers adds the root and reaches 100; a child with 100 is
rejected with child limit99. COUNT0 calls no scanner.
Scratch therefore describes the last child, not local aggregates.

Only after complete scanning and statistic guards does the writer
call the existing MT4 header and copy (write:90–104). The first write
is in the header writer, after all parsing; copy has only
internal errors. Post-write guards promise no rollback.
No unverified byte is exposed as a successful result.

<a id="guardie-significative-e-dimensione"></a>

## Meaningful guards and size

Guards do more than repeat declared domains: table type and
COUNT/partition; workspace type and physical separation; bytes and capacity;
internal ranges and disjointness; loop bounds/budgets and ends; minimum nodes
and root depth; spans/capacity returned by preflight; nonempty child,
progress, and statistics; aggregate convergence; header,
payload, and final copy. Progress and balance comparisons verify
relationships between inputs and results, not TRUE constants. Every nontrivial
function retains at least two active checks; internal errors
propagate invariant-violation to the owner.

The version read separates `COUNT<=LENGTH(ITEM-ENDS)` from `COUNT<=16MiB`
(write:46–49): the active prefix is bounded, and the ignored table tail
may exceed the budget. It does not require the entire physical
table length to be <=16MiB. The coordinator declared the correction
and preservation of the original before any compilation;
this reading concerns only the final blob above. The two bounds
are not implied by u32 type alone. Guards that cannot be falsified through
the public contract remain to be inventoried and measured, without exclusions.

Syntactic count: 1 initial, 1 per IF/WHEN/UNLESS or LOOP, plus 1 for
each AND/OR operand after the first. It does not count chained
relations as extra branches; they are still reported for coverage.
Checked on READ-EVAL NIL/EOF forms, without evaluating them (chunk c4e979).

| Function | File and inclusive lines | Lines | Paths |
| --- | --- | ---: | ---: |
| check-tabella-array-cbor | input:9–19 | 11 | 7 |
| check-spazio-array-cbor | input:24–34 | 11 | 5 |
| dimensioni-array-cbor | input:39–54 | 16 | 4 |
| check-overlap-array-cbor | input:59–70 | 12 | 7 |
| check-fini-array-cbor | input:75–93 | 19 | 7 |
| check-radice-array-cbor | input:97–105 | 9 | 3 |
| check-input-array-cbor | input:110–131 | 22 | 3 |
| verifica-figlio-array-cbor | write:10–32 | 23 | 7 |
| verifica-figli-array-cbor | write:38–64 | 27 | 8 |
| scrivi-array-cbor-minimo | write:70–105 | 36 | 6 |

`input` is [cbor-array-input.lisp](../../src/codec/cbor-array-input.lisp),
`write` is [cbor-array-write.lisp](../../src/codec/cbor-array-write.lisp).
AND/OR: input:15 (COUNT index, table length, SPAN),17 (COUNT0 and SPAN>0),
30–32 (three scratch aliases),67–68 (EQ, nonempty source and strict
intersection),88 (growth and STOP bound). LOOP input:86 and write:52.
Chained relations: input:63/65/82; write:15/28/44/60/62. All
guards, including internal postconditions, are part of the reading.

<a id="riesame-del-corpus-congelato"></a>

## Reexamination of the frozen corpus

| Blind file | Git blob |
| --- | --- |
| tests/codec/cbor-array-write-support.lisp | eb1fccadb205e375b4a2324a6b6725a860bb546f |
| tests/codec/cbor-array-write.lisp | b13f58264f3cd97e1947ee52936732a7fcebe672 |
| tests/codec/cbor-array-write-threads.lisp | 5720110265b67019937f08cbd949b4469a04b867 |

Fingerprints rechecked and unchanged. The corpus remains independent of the
new product's formulas: arithmetic header and literal children, scanner
verification only supplementary. 19 serial tests cover types,
ranges, precedence, complete and root budgets, partition, overlap,
exact/minus1 capacity, absolute errors, arity, sentinels, and reuse.
258 non-fuzz calls planned; fuzz1024 seed41525235 with 512 successes
and 64 for each of eight rejection classes. These are static counts,
not runtime results. Unread tails are tested with FFFFFFFF
sentinels; no runtime test with a table beyond 16Mi cells is claimed.

The 20th test reuses 2 workers for 2 waves of 2048 calls each:
8192 compositions. Separate READY/GO/DONE per wave, private buffers and scratch,
shared immutable SOURCE/ITEM-ENDS. Cold tokens25478/36728,
sink per worker/wave52178944/75218944; entire arrays and arity verified
on every call. Wait15s, join20s, bounded cleanup with verified
termination. Expected serial+parallel total9474 calls. Intervals
include corpus comparisons, not just primitive work.

<a id="integrazione-e-verifiche-pendenti"></a>

## Integration and pending verification

Blobs read: package `aa15f62ba6e27f46922cbbb9f48d565168e40f49`, ASDF
`266cad8de58c60925a4d4f7078128d6d72406bc5`, coverage
`00700ae049d451a0d8371fba26099c2513e47895`, catalog
`807b9193ede9191b4dfbeb5e1ea0b81507acb90d`, matrix
`5eadbdeb6b02ce57c8862c3aae0ecc8402b251e6`.
Existing dependencies read: copy/string `a2c5c77dd51bff760bff4508e998d94370921eda`,
scanner limits `57ffc48cc688a4de8ebec5cb14c1e69c4209704a`, scanner core
`e3d7d77407046338d23e26eb0b8a2e8fdc3d699d`, minimal wrapper
`f1afe79c7a4d49abd6a6e5f6975dec830ef7b1f6`, workspace
`a8330e50a77b52a6b9044ebbb48f62bb4b3222a3`, header writer
`61f0d6e2783e4790ed7e19a45bba6407d6e5b3de`, conditions
`edbe5eaa88c50dc13af8e367b73f7f41fd7bd724`.

Compilation without warning/style-warning, lint,
recorded campaigns with stable sources/index/HEAD, driver self-tests,
heap benchmarks, coverage without exclusions, mutations, separate
data readings, and integrated make check remain necessary. None of these activities
was performed by this static reading.
