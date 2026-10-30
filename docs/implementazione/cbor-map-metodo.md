<a id="composizione-delle-mappe-cbor--contratto-e-metodo"></a>

# CBOR map composition — contract and method

C1 increment preregistered on 2026-10-14, before the new corpus,
product, and campaigns. REQ-CBR-006 derives from ADR-0014;
REQ-LIM-001/002 and ADR-0048 govern the complete result.

<a id="contratto-locale"></a>

## Local contract

```lisp
(scrivi-mappa-cbor-minima
 buffer start end source source-start source-end item-ends count space
 :max-bytes 16777216 :max-nodes 16777216 :max-depth 100)
;; => exactly NEXT
```

COUNT is the number of pairs, not items. SOURCE contains
consecutive, already-encoded key, value, key, value. BUFFER and
SOURCE are simple u8 with valid half-open spans. ITEM-ENDS is simple u32:
only the first 2*COUNT cells are active, with ends relative to SOURCE-START,
strictly increasing, last equal to SPAN. Subsequent cells are
ignored. COUNT is index and does not exceed FLOOR(LENGTH(ITEM-ENDS)/2) or
FLOOR(SPAN/2): these comparisons precede multiplication. COUNT0
requires SPAN0 and reads no entries.

The minimal MT5 header for COUNT is emitted, then the exact payload.
For two pairs SOURCE=`61 61 01 61 62 82 F4 F5`, ends `#(2 3 5 8)`,
the result is `A2 61 61 01 61 62 82 F4 F5`.
Each segment must contain exactly one minimal structural item;
the [scanner's](cbor-minimo-struttura.md) local preferences apply.
Pair order is preserved. Key ordering,
uniqueness, application types, and deterministic document profile remain
higher-level: this primitive neither attests nor normalizes them.

Destination and SPACE exclusive, source and table stable until
return and shareable for reading among workers with separate scratch.
BUFFER/SOURCE eq SPACE.KINDS or ITEM-ENDS eq SPACE.REMAINING are rejected,
even for an empty map. BUFFER=SOURCE is allowed only with source span
disjoint from the complete footprint [START,NEXT), including header;
touching boundaries and empty source are allowed.

MAX-BYTES index 0..16MiB includes header and payload. MAX-NODES index
1..16MiB includes root, keys, values, and tags. MAX-DEPTH index 0..100
counts array/map, root at level1, without adding a level for
scalars or tags. An empty map requires one byte, one node, and one level.
Nodes=1+sum of children, peak=1+max(child peaks). Each child uses
the scanner with bytes equal to its span, remaining nodes, and MAX-DEPTH-1.
Remainder0 before the next child gives RESOURCE-EXHAUSTED
:cbor-map-node-budget at its absolute offset, before reset.

All public errors precede the first write and preserve
the entire physical destination, source, and table. Preflight leaves
scratch intact; failed parsing may dirty it, reusable after
reset on the next call. With COUNT0 it remains intact. After success,
it describes the last value, without promising aggregate statistics.
Internal invariant faults are fail-stop, without rollback. Only
[START,NEXT) changes; no capacity in the physical tail beyond END.

<a id="precedenza-congelata"></a>

## Frozen precedence

Before parsing and reset:

1. Destination range: INVALID-ARGUMENT :cbor-range, offset NIL.
2. Source range: INVALID-ARGUMENT :cbor-map-source-range, NIL.
3. Table type: :cbor-map-item-ends; COUNT outside type/range or
   COUNT0/SPAN>0: :cbor-map-count, INVALID-ARGUMENT, NIL.
4. SPACE: :cbor-workspace; alias: :cbor-map-workspace-alias,
   INVALID-ARGUMENT, NIL.
5. Configured limits: :cbor-byte-limit, :cbor-node-limit,
   :cbor-depth-limit, INVALID-ARGUMENT, NIL.
6. SPAN, then complete size against MAX-BYTES:
   RESOURCE-EXHAUSTED :cbor-map-byte-budget, NIL.
7. Complete size against END-START:
   RESOURCE-EXHAUSTED :cbor-map-capacity, NIL.
8. Overlap: INVALID-ARGUMENT :cbor-map-overlap, NIL.
9. Ends of 2*COUNT entries: INVALID-ARGUMENT :cbor-map-item-ends, NIL.
10. Minimum nodes 1+2*COUNT, then root level1:
    RESOURCE-EXHAUSTED :cbor-map-node-budget / :cbor-map-depth-budget, NIL.
11. Complete scanning of every item in order. Scanner errors
    propagate unchanged, with absolute SOURCE offsets. Then writing.

SPAN<=MAX-BYTES<=16MiB is checked before addition and the table
loop, also bounding COUNT, u32 conversions, and work.
Cost is O(SPAN+2*COUNT*102), without AST, intentional allocations,
waits, threads, I/O, or durable publication in the product.

<a id="corpus-e-parallelismo"></a>

## Corpus and parallelism

A separate author freezes the corpus without reading new sources;
the product is written after freeze. Cold oracles for MT5
header and payload, scanner only as an additional check. Boundaries
COUNT23/24/255/256, scalar and structured pairs, malformed keys and values,
nonminimal UTF8/floats, trailing items, and truncations; unordered pairs
and repeated keys confirm structural-only scope.
Types/ranges, COUNT against half table/span, ignored table tail,
precedence, aliases even when empty, header overlap, physical sentinels,
exact/-1 capacity, arity, and reuse after error. Child depth99/100
with root; complete16MiB limit with scalar key and byte string
with payload16777209, then +1. Remaining budget exhausted between key and value.
Fuzz1024 with seed4D415035: valid cases and rejections, plan frozen by corpus.

Two real workers reused for two waves of 2048 calls each:
8192 compositions. Shared read-only source and table, private destinations
and scratch, READY/GO/DONE, sink, bounded timeout and cleanup.
Intervals observed without inferring scaling or simultaneous execution on cores.

<a id="campagne-e-conservazione"></a>

## Campaigns and preservation

Six cold benchmark fixtures: empty, one scalar pair, two mixed
pairs,24 pairs,256 pairs, and pair with array/tag/text. Five replicates
x1024 calls, warmup64; NEXT and bytes in sink. Zero baseline and
positive control16x1MiB, local zero-observed-heap-allocation criterion, no
speed threshold. Driver, fixtures, and data reading frozen.

Eight unique compilable mutations: physical capacity, MT4, header with
item count instead of pairs, omitted scanning, overlap excluding header,
unchecked ends, root excluded from nodes, extra arity. Catalog
before execution, private copies/caches, full baseline, and
strict classification. Failed compilations, signals, and faults after
completion do not count as detection.

Two C1 readings with 12-point checklist before first compilation;
raw coverage of new sources and compound-decision inventory,
without exclusions or MC/DC attestation. Driver self-tests,
separate data readings, and integrated make check before push.
Common Lisp tools (INV-X3), READ-EVAL NIL/EOF; sources, index, and
HEAD stable in recorded commands. Fingerprints, copies, and sealed
inventory preserve tests and failures without closing the C1 gate.
