<a id="composizione-degli-array-cbor--contratto-e-metodo"></a>

# CBOR array composition — contract and method

C1 increment preregistered on 2026-10-13, before the new corpus,
product, and campaigns. REQ-CBR-005 derives from ADR-0014;
REQ-LIM-001/002 and ADR-0048 govern complete-result budgets.

<a id="contratto-locale"></a>

## Local contract

```lisp
(scrivi-array-cbor-minimo
 buffer start end source source-start source-end item-ends count space
 :max-bytes 16777216 :max-nodes 16777216 :max-depth 100)
;; => exactly NEXT
```

BUFFER and SOURCE are simple u8 arrays; START/END and SOURCE-START/SOURCE-END
are index values delimiting valid half-open spans. Destination and SPACE
are exclusive until return; source and table are stable and may be shared
for reading. ITEM-ENDS is simple u32: only the first COUNT cells are read.
They contain ends relative to SOURCE-START, strictly increasing, no
greater than SPAN, with the last equal to SPAN. Each segment contains one exact
minimal item. COUNT is an index not exceeding table length or SPAN;
COUNT0 requires SPAN0 and reads no entry.

Emit a minimal MT4 header for COUNT, followed by the source's exact
bytes. NEXT=START+HEADER-SIZE+SPAN; only [START,NEXT) changes.
All public errors precede the first write and preserve
the entire physical destination, source, and table. Internal invariant
failures are fail-stop, without rollback. No durable publication,
AST, map sorting/deduplication, or NaN normalization: the
[minimal scanner's](cbor-minimo-struttura.md) local preference applies.

BUFFER or SOURCE eq SPACE.KINDS, or ITEM-ENDS eq SPACE.REMAINING, is rejected,
even for an empty array: scanner reset modifies the whole scratch area.
BUFFER=SOURCE is allowed only if the source is disjoint from the complete
footprint, including header. Touching boundaries and an empty source are allowed.

MAX-BYTES is an index 0..16MiB including header and payload; MAX-NODES is an index
1..16MiB including the root and all child nodes, including tags;
MAX-DEPTH is an index 0..100 counting only array/map, root at level1.
An empty array requires one byte, one node, and one level. Scalar/tag children
are allowed at depth1. Peak=1+max(child peaks), nodes=1+sum.
Each child uses the minimal scanner with byte budget equal to its span,
remaining nodes, and depth MAX-DEPTH-1. A remaining node budget of 1 is valid; 0
before the next reset raises RESOURCE-EXHAUSTED :cbor-array-node-budget,
absolute offset at the next child's start. Scanner errors
propagate unchanged, with absolute SOURCE offsets.

<a id="precedenza-congelata"></a>

## Frozen precedence

All following phases precede parsing/reset:

1. Destination range: INVALID-ARGUMENT :cbor-range, offset NIL.
2. Source range: INVALID-ARGUMENT :cbor-array-source-range, NIL.
3. Table type: :cbor-array-item-ends; COUNT type/range or COUNT0/SPAN0:
   :cbor-array-count, both INVALID-ARGUMENT, NIL.
4. SPACE type: :cbor-workspace; scratch alias:
   :cbor-array-workspace-alias, INVALID-ARGUMENT, NIL.
5. Configured limits: existing reasons :cbor-byte-limit,
   :cbor-node-limit, :cbor-depth-limit, INVALID-ARGUMENT, NIL.
6. SPAN, then complete size against MAX-BYTES:
   RESOURCE-EXHAUSTED :cbor-array-byte-budget, NIL.
7. Complete size against END-START:
   RESOURCE-EXHAUSTED :cbor-array-capacity, NIL.
8. Overlap: INVALID-ARGUMENT :cbor-array-overlap, NIL.
9. Monotonicity/bounds/final end: INVALID-ARGUMENT :cbor-array-item-ends, NIL.
10. Minimum nodes 1+COUNT, then root level1:
    RESOURCE-EXHAUSTED :cbor-array-node-budget / :cbor-array-depth-budget, NIL.
11. Full scan of children in order; then writing.

Checking SPAN against MAX-BYTES precedes the size addition and table loop:
COUNT<=SPAN<=16MiB bounds work and u32 conversion.
Capacity/overlap take precedence over malformed entries. Preflight leaves
scratch intact; failed parsing may dirty it, and the next reset reuses
it. With COUNT0 it stays intact. On success scratch describes the last
child, without promising aggregate statistics.

<a id="corpus-e-parallelismo"></a>

## Corpus and parallelism

A separate author prepares and freezes the corpus without reading the new
sources; the product is written after freeze. Cold oracle for literal
header and payload; scanner used only as an additional check.
Fixtures: 80; 81 00; five children 00/3818/6141/F5/F93E00 with ends
1/3/5/6/9; COUNT23/24/255/256; tag/map/array children, UTF8 and minimal floats;
trailing item 0000, nonminimal1800, truncation, and invalid UTF8.
Child depth99 accepted at limit100, child100 rejected;
byte string payload16777210 produces exactly16MiB with root,
payload+1 rejected. Remaining nodes with 810000 and ends2/3: budget3
rejects the second child, budget4 accepts. Types, ranges, all precedence
phases, alias even empty, header overlap, touching boundaries,
exact/-1 capacity, arity, physical sentinels, and reuse after error.
Fuzz1024 seed41525235 on valid cases and rejections, plan and counts frozen.

Two reused real workers, two waves of2048 calls per worker:
8192 compositions. Shared immutable source/table, private destinations
and scratch, READY/GO/DONE per wave, sink and complete buffers,
bounded timeout/join/cleanup. Intervals observed without inferring
scaling, simultaneous core execution, or engine performance.

<a id="campagne-e-conservazione"></a>

## Campaigns and preservation

Separate serial benchmark: six cold fixtures frozen before the
product (empty, scalar, five types,24 scalars,256 scalars,
array/tag/text). Five replicates x1024 calls, warmup64; NEXT and bytes
in the sink, cold arity. Null baseline and positive control16x1MiB;
local observed-zero-heap criterion, without a speed threshold.

Eight unique compilable mutations, cataloged before the campaign:
physical capacity; wrong major; wrong COUNT; omitted scan;
overlap without header; unchecked table; root excluded from nodes;
extra arity. Private copies/caches, full baseline, exact smoke/final runs.
Compilation errors, signals, or worker failures do not count as detection.

Two C1 readings with a12-point checklist before the first compilation;
raw coverage of new sources and inventory of all compound decisions,
without exclusions or MC/DC certification. Driver self-tests,
separate data readings, integrated make check before push.
Common Lisp tools (INV-X3), READ-EVAL NIL/EOF; sources/index/HEAD
stable in recorded commands. Preservation with fingerprints, copies, and
closed-inventory verification; failures retained. Local tests do not close
the C1 gate or qualify the entire engine.
