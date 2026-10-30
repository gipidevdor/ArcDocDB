<a id="composizione-dei-tag-cbor--contratto-e-metodo"></a>

# Composing CBOR tags — contract and method

C1 increment preregistered on 2026-10-14, before the new corpus,
product, and campaigns. REQ-CBR-007 derives from ADR-0014.
An MT6 tag contains one item; its wire number is unsigned64,
represented in two u32 words. Reference:
[RFC 8949 §3.4](https://www.rfc-editor.org/rfc/rfc8949.html#section-3.4).

<a id="contratto-locale"></a>

## Local contract

```lisp
(scrivi-tag-cbor-minimo
 buffer start end source source-start source-end high low space
 :max-bytes 16777216 :max-nodes 16777216 :max-depth 100)
;; => exactly NEXT
```

BUFFER and SOURCE are simple u8 arrays with valid half-open spans. SOURCE
contains exactly one complete minimal structural item and is nonempty.
HIGH and LOW are u32 words: no u64 integer is reconstructed.
The minimal MT6 header (1/2/3/5/9 bytes) is emitted, then the exact content
bytes. Example: HIGH0, LOW55799, SOURCE=A0 produces D9 D9 F7 A0.

The primitive checks only the scanner's minimal structural profile,
without interpreting application tags, dates, bignums, the IANA registry, key
order, or value equivalence. All wire numbers are allowed,
including those reserved for sentinels: semantic admission remains with the
document profile. Deterministic document encoding is not promised.

BUFFER and SPACE are exclusive to the caller; SOURCE remains stable and
can be shared for reading among workers with private destinations and scratch.
BUFFER/SOURCE eq SPACE.KINDS are rejected. BUFFER=SOURCE is allowed
only if the source span is disjoint from the complete footprint [START,NEXT),
including the header; touching boundaries are allowed.

MAX-BYTES index 0..16 MiB includes header and contents; MAX-NODES index
1..16 MiB includes the root tag and all content nodes. The minimum
is two nodes. MAX-DEPTH index 0..100 counts only arrays/maps: a tag
adds no level. MAX-DEPTH is passed unchanged to the scanner, and
MAX-NODES-1 as the remainder. A tag on a scalar is allowed at depth0;
a tag on an empty array requires depth1. Final peak matches
the contents' peak. Scanner tags do not add frames.

Every public error precedes the first write and preserves the entire
physical destination and SOURCE. Preflight preserves scratch;
failed parsing can dirty it, and it is reusable at the next call.
After success, SPACE describes the contents, without including the emitted
tag in its statistics. Only [START,NEXT) changes; physical capacity
beyond END is unusable. Internal invariant: fail-stop without rollback.
No AST, threads, waits, I/O, durable publication, or global state.

<a id="precedenza-congelata"></a>

## Frozen precedence

Before parsing and reset:

1. Destination: INVALID-ARGUMENT :cbor-range, offset NIL.
2. Source: INVALID-ARGUMENT :cbor-tag-source-range, NIL;
   empty span: INVALID-ARGUMENT :cbor-tag-source-empty, NIL.
3. HIGH, then LOW: INVALID-ARGUMENT :cbor-write-high / :cbor-write-low, NIL,
   reusing MT6 header-writer word verification.
4. SPACE: INVALID-ARGUMENT :cbor-workspace, then alias
   INVALID-ARGUMENT :cbor-tag-workspace-alias, NIL.
5. Limits: INVALID-ARGUMENT :cbor-byte-limit, :cbor-node-limit,
   :cbor-depth-limit, NIL.
6. SPAN, then complete size against MAX-BYTES:
   RESOURCE-EXHAUSTED :cbor-tag-byte-budget, NIL.
7. Complete size against END-START:
   RESOURCE-EXHAUSTED :cbor-tag-capacity, NIL.
8. Overlap: INVALID-ARGUMENT :cbor-tag-overlap, NIL.
9. Minimum two nodes: RESOURCE-EXHAUSTED :cbor-tag-node-budget, NIL.
10. Complete minimal scan of contents: errors propagated unchanged,
    with absolute SOURCE offsets. Then header and copy.

SPAN<=MAX-BYTES<=16 MiB is checked before addition or scanning.
Work is bounded by SPAN, nodes, and the scanner's fixed102 stack.
Two C1 readings with a 12-point checklist and an inventory of all decisions
precede first compilation. No coverage exclusion.

<a id="corpus-indipendente"></a>

## Independent corpus

A separate author freezes fixtures and tests before new sources.
Cold oracles for MT6 header, contents, and full buffers; scanner
only as an additional check. Word/tag boundaries0/1/23/24/255/256/
65535/65536/FFFFFFFF/100000000/FFFFFFFFFFFFFFFF and sentinels,
header1/2/3/5/9, nonzero source offset, minimal raw floats, UTF8, and containers.

Types/ranges, empty span, u32 words, SPACE and aliases, all limits and
precedence, exact/-1 capacity, header-only overlap and touching
boundaries, arity, and scratch statistics. Truncations, trailing data, UTF8,
nonminimal headers/floats, tags without content; tag chains and remaining
nodes. Depth0 on scalar/tag, array depth100/101 without
charging the tag. Complete16 MiB limit and overruns.
Fuzz1024 with seed54414737, cold plan fixed by the corpus.

Two real workers reused for two waves of2048 calls each:
8192 compositions, shared read-only SOURCE, private destinations/scratch,
READY/GO/DONE, sink, bounded timeouts and cleanup.
No inference of scaling or simultaneous execution on cores.

<a id="campagne-e-conservazione"></a>

## Campaigns and preservation

Six cold benchmark fixtures: scalar/short tag, tag24+text, tag55799+
empty map, tag65536+array, nonzero HIGH word+bytes, tag chain+
container/text. Five replicates x1024 calls, warmup64,
NEXT/full buffers in sink. Zero baseline and positive control16x1MiB;
local criterion of zero observed heap, without a speed threshold.

Eight unique compilable mutants: physical capacity, MT5, swapped words,
omitted scan, overlap without header, root excluded from nodes,
tag charged to depth, extra arity. Catalog before execution,
private copies/caches, full baseline, detection only with exact smoke
and the frozen corpus's nominal function in the trace, exit1
and signal NIL. Warnings, failed builds, helper faults, signals,
and failures after completion do not count as detection.

Drivers and fixtures frozen with self-tests; raw coverage of only
new sources and compound decisions, without MC/DC attestation.
Independent data readings and integrated make check before push.
Common Lisp tools (INV-X3), READ-EVAL NIL/EOF, sources/index/HEAD
stable in recorded commands. Originals and preparatory attempts
preserved; collection with four workers and verified closed inventory.
REQ-LIM-001/002 and C1/MC/DC qualification remain open.
