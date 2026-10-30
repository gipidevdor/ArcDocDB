<a id="composizione-delle-mappe-cbor--seconda-lettura-c1"></a>

# CBOR map composition — second C1 reading

Static reading by the blind-corpus owner on 2026-10-14, after
test freeze and subsequent product writing, before first
compilation, load, or campaign. The [preregistered method](cbor-map-metodo.md)
has blob `636dd2706c2903542978606cf029e7198bf4dbb3`, communicated base `2968cdc`,
branch `codex/cbor-map-write`. The author is distinct from the product author
and did not consult the new first reading or its decision inventory.
Frozen product and corpus were not changed by this reading.

| Product examined | Git blob |
|---|---|
| src/codec/cbor-map-input.lisp | d7a593badeb6e6b71f28dc4e80c641b07189d0b8 |
| src/codec/cbor-map-write.lisp | 22e814ea68e606c5bc58033c2a31e945303a9d65 |

No functional defect or open static finding identified in the examined
blobs. Strict compilation, lint, corpus results, heap allocation,
parallel intervals, coverage, and mutations remain pending. This
reading does not close a C1 gate, attest MC/DC, or qualify the engine.

<a id="checklist-c1"></a>

## C1 checklist

| Item | Static finding and limit |
|---|---|
| 1. Requirements and ADRs | REQ-CBR-006, LIM-001/002, AFF-004/008, INV-F1/P6/A8, and ADR-0014/0033/0035/0048 are consistent with a local primitive for minimal structural wire maps. COUNT counts pairs; order and duplicates are preserved. No application semantics or key normalization. |
| 2. Invariants | Preflight protects types, spans, COUNT, aliases, limits, partition, and root; complete key/value scanning before header. Meaningful guards check balances, progress, statistics, and final copy, not just FTYPE domains. |
| 3. Errors | The method's eleven phases respect order. Preflight INVALID-ARGUMENT/RESOURCE-EXHAUSTED with offset NIL; remainder0 gives :cbor-map-node-budget at the next absolute START before reset. Scanner errors propagate unchanged. All public rejections precede first write and preserve all three physical arrays. INVARIANT-VIOLATION requires owner fail-stop, without rollback. |
| 4. Limits | Two new LOOPs, each bounded to ITEMS=2COUNT<=SPAN<=16MiB before reading the table. Every scanner receives segment span, remaining nodes, and MAX-DEPTH−1. Existing reset/drain have 102 frames; copy bounded to SPAN and header to 5 bytes. No recursion, wait, or retry in the product. |
| 5. Heap | Cursors and multiple values, without AST, closures, constructors, or temporary arrays in the new success path. On SBCL64 bounded sums remain fixnums. Keyword calls and dependencies nevertheless require benchmark with zero baseline and positive sensor; zero heap allocation is not statically attested. |
| 6. Verified data | Minimal MT5 with HIGH0/LOW=COUNT pairs; payload is copied after verifying all 2COUNT segments. Only [START,NEXT) changes. Header progress, payload span, and final NEXT checked; final result is a variable, therefore one value. |
| 7. Compound decisions | Five AND/OR with 14 operands, two LOOPs, nine chained numeric relations, and 40 WHEN/UNLESS guards, inventoried below. Internal error branches remain in scope: no exclusion or attestation of dynamic independence. |
| 8. Owner | OWNER/SHARED declare BUFFER and SPACE exclusive, SOURCE and ITEM-ENDS stable and shareable for reading. Simple arrays rule out displaced backing. Scratch aliases rejected even when empty; BUFFER=SOURCE allowed only when source span does not intersect the complete footprint, including header. |
| 9. Integration | Export cbor-package:12; ASDF loads product after scanner/header/copy, the three corpus files after previous support, and RUN:225. Dedicated scope selects exactly two sources and invokes corpus; final aggregate codec dispatch also invokes map RUN. Catalog/matrix contain REQ-CBR-006 without :cov. No make check performed by this reading. |
| 10. Standard | Safety3, complete FTYPEs, specialized types, REQ, Pre/Post/error docstrings, and at least two meaningful checks per nontrivial function. Ten functions of 9–38 lines, 3–9 paths in the stated count: within 60/10. Warning/style-warning and lint remain to be observed; no deviation proposed. |
| 11. Parallelism | No wait, thread, lock, or shared write in the new product. Corpus with two reused workers, private buffers and scratch, read-only source/table, separate semaphores for two waves, sinks, bounded timeout, joins, and cleanup. Durations and overlap must be observed; they do not demonstrate scaling or simultaneous execution on cores. |
| 12. Durability | Only caller-exclusive memory, no I/O or durable/atomic publication. The codec does not transition the Serie: FAULTED remains the owner boundary's responsibility for internal invariants. |

<a id="preflight-count-e-aritmetica"></a>

## Preflight, COUNT, and arithmetic

`check-input-mappa-cbor` (input:122–132) composes in order: BUFFER range,
SOURCE range, ITEM-ENDS type and COUNT, SPACE/alias, configured limits,
SPAN and complete size against bytes, capacity, overlap, active ends,
minimum nodes, and root. No reset or byte written on this path.
Omitted offsets remain NIL through the `arcdocdb-error` initform
(conditions:8). Workspace type precedes every slot access.

COUNT is index and must be <=FLOOR(LENGTH(ITEM-ENDS)/2) and <=FLOOR(SPAN/2)
before `(* 2 count)` (input:16–21). The result ITEMS is <=SPAN, therefore
index without overflow even before document budget. COUNT0/SPAN>0
is rejected separately; empty reads no entries, even with dirty tail.

`dimensioni-mappa-cbor` checks SPAN<=MAX-BYTES<=16MiB before header
selection, COUNT-to-u32 cast, and addition (input:50–54). COUNT<=8MiB, ITEMS<=16MiB;
pair header1/2/3/5 bytes and complete size remain fixnums.
The same bound holds before ITEMS-to-u32 cast and loop.
Capacity against END−START precedes NEXT=START+ITEM-SIZE (input:58–59,
130): NEXT<=END makes index addition safe. Every relative end is
increasing and <=SPAN, last=SPAN (input:92–98); absolute STOP <=SOURCE-END
and every segment is nonempty. Only the first ITEMS cells are read.

The physical table tail need not fit the 16MiB budget: it is inactive.
Guards check active prefix and SPAN, not the whole physical
length (input:86–89; write:46–49). Comparisons are not implied by u32
type alone. BUFFER/SOURCE eq KINDS or ITEM-ENDS eq REMAINING are rejected
before limits, scanner, and reset (input:30–35).

Overlap compares SOURCE with [START,NEXT), not all of [START,END)
(input:69–75). Strict inequalities allow touching boundaries; empty
source is allowed. On success BUFFER=SOURCE changes only the destination
footprint and preserves the disjoint source span. On public errors,
complete physical destination, source, and table remain unchanged.
Parsing may dirty SPACE; a subsequent scanner resets it.

<a id="scansione-nodi-e-scrittura"></a>

## Scanning, nodes, and writing

Minimum is one root node plus ITEMS and root level1, in that order
(input:107–110). The loop starts NODES=1, PEAK=1, CURSOR=START, and
CHILD-DEPTH=MAX-DEPTH−1 (write:52). Every key/value receives remainder
MAX-NODES−NODES; segment nodes include tags and are added,
while PEAK becomes MAX(PEAK,1+CHILD-PEAK). Statistics returned
by the scanner are checked before use (write:26–31).

Remainder1 is passed to the scanner; remainder0 is rejected at the next
segment's absolute start, before reset (write:17–25).
Key8100 or C000 plus value00: with budget3, value starts at SS+2
when remainder is0; budget4 accepts. A child with 99 containers plus
root reaches100; with100 it is rejected by child limit99.
Scalars and tags add no container level. ITEMS0 skips the entire
LOOP: SPACE remains intact, aggregate nodes/peak are1/1. Nonempty
leaves the last value in scratch, not local aggregates.

No BUFFER byte changes before complete scanning and aggregate
checks (write:94–99). Then MT5/PAIRS header (write:100),
its progress and payload check, existing copy, and final NEXT
(write:102–109). The first write occurs inside the header writer.
Copy has only internal faults within the prevalidated contract;
guards after first write promise no rollback.
Keys are neither sorted nor deduplicated, and no AST is decoded.

<a id="guardie-dimensione-e-percorsi"></a>

## Guards, size, and paths

Manual count on read text: 1 initial, 1 per WHEN/UNLESS or LOOP,
plus 1 for every AND/OR operand beyond the first. Chained relations
add no paths to the count, but remain decisions to cover.
This is neither a count of instrumented branches nor an MC/DC measurement.

| Function | File and inclusive lines | Lines | Paths |
|---|---|---:|---:|
| check-tabella-mappa-cbor | input:9–21 | 13 | 7 |
| check-spazio-mappa-cbor | input:26–36 | 11 | 5 |
| dimensioni-mappa-cbor | input:41–60 | 20 | 6 |
| check-overlap-mappa-cbor | input:65–76 | 12 | 7 |
| check-fini-mappa-cbor | input:81–99 | 19 | 7 |
| check-radice-mappa-cbor | input:103–111 | 9 | 3 |
| check-input-mappa-cbor | input:116–139 | 24 | 4 |
| verifica-figlio-mappa-cbor | write:10–32 | 23 | 7 |
| verifica-figli-mappa-cbor | write:38–66 | 29 | 9 |
| scrivi-mappa-cbor-minima | write:72–109 | 38 | 6 |

`input` is [cbor-map-input.lisp](../../src/codec/cbor-map-input.lisp),
`write` is [cbor-map-write.lisp](../../src/codec/cbor-map-write.lisp).
AND/OR input:16–17 (three COUNT conditions),19 (empty),32–34 (three aliases),
73–74 (EQ, nonempty, and intersection),94 (end growth/bound).
LOOP input:92 and write:54. Chained relations: input:69/71/88;
write:15/28/44/50/62/64. WHEN/UNLESS guards:22 in input and18 in write.

Guards check relationships between input, results, and limits:
COUNT/partition, scratch separation, bytes/capacity, internal ranges,
preflight balance, nonempty segment, remainders/progress/statistics,
loop convergence, header/payload/copy. Every function has at least
two meaningful active checks, falsifiable beyond only the declared
domain; they are not TRUE constants. Internal guards without a direct
public case remain in the denominator and must
be inventoried by coverage, without inferring unreachability.

<a id="corpus-congelato-e-integrazione"></a>

## Frozen corpus and integration

| Blind file | Git blob |
|---|---|
| tests/codec/cbor-map-write-support.lisp | a389e51f2416437d608c4f7745b9680eca27bc60 |
| tests/codec/cbor-map-write.lisp | 6ad0e9b5a48ba9c32c46d720f2f7f1821368d6c8 |
| tests/codec/cbor-map-write-threads.lisp | 6a65b58ce236b92b33772e1861dbd8c1257bee13 |

Fingerprints rechecked and unchanged. 19 serial tests and one parallel:
283 non-fuzz calls planned,84 successes/199 rejections; fuzz1024
seed4D415035, final0D123435,512 valid and 8 classes of 64 rejections.
The 65 scanner round trips supplement the cold byte/NEXT oracle.
Precedence, COUNT pairs/2COUNT ends, empty/nonempty aliases, ignored tail,
malformed key/value, complete budget, remainders, arity, sentinels, and reuse
are statically consistent with the contract. This is not a PASS campaign;
a physical table with more than 16Mi cells is not tested.

Two reused workers,2 waves×2048 calls each=8192 compositions.
Separate READY/GO/DONE per wave, shared read-only inputs, private destinations
and scratch; every call compares arity and complete physical arrays.
NEXT12/16, token26698/37860, sink per worker/wave54677504/77537280.
Wait15s, join20s, and bounded cleanup with termination verification.
Expected total9499 calls,8788 successes/711 rejections; durations and overlap
also include corpus checks. No conclusion about scaling.

Integration read: package `f0174a51357730193aac5485afc993711d291e53`,
ASDF `1ec8da1a9c5b824c365454ec452b04cd5c414f54`, final coverage
`e273f103df929f6c00ab504641e9e38ab04857ce`, requirements catalog
`b2642bb6608c96f8e8ccb9383f679eb921b0c457`, matrix
`6bceaf12d28c993e3d0cdf87460a2da217e67442`.
The coordinator communicated a C4 correction of map RUN in
aggregate codec scope before compiling: the final tool was
rechecked, dedicated scope:58–59/234 and aggregate:262–272.
Previously read tool `520ef727ff5bc22e9b0b3899b06728570015e990`
is not the final version. Product and corpus remain at the blobs above.

Existing dependencies read: binary `2d514f6fe2e81eecb29fa53de611fa5e28696904`,
conditions `edbe5eaa88c50dc13af8e367b73f7f41fd7bd724`, copy/range
`a2c5c77dd51bff760bff4508e998d94370921eda`, limits
`57ffc48cc688a4de8ebec5cb14c1e69c4209704a`, scanner
`e3d7d77407046338d23e26eb0b8a2e8fdc3d699d`, minimal wrapper
`f1afe79c7a4d49abd6a6e5f6975dec830ef7b1f6`, workspace
`a8330e50a77b52a6b9044ebbb48f62bb4b3222a3`, header writer
`61f0d6e2783e4790ed7e19a45bba6407d6e5b3de`.

Compilation without warning/style-warning, lint, campaigns with
stable sources/index/HEAD, driver self-tests, heap allocation, coverage without
exclusions, mutations, separate data readings, and integrated make check remain.
None of these activities was performed by this static reading.
