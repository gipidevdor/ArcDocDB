<a id="composizione-dei-tag-cbor--seconda-lettura-c1"></a>

# Composing CBOR tags — second C1 reading

Static reading by the blind-corpus owner on 2026-10-14, after
test freeze and subsequent product writing, before first
compilation, load, or campaign. The author is distinct from the product author
and did not consult the new first C1 reading. The
[preregistered method](cbor-tag-metodo.md) has blob
`3175390e496173398781bf8b39170cb33892125f`, branch `codex/cbor-tag-write`.
Frozen product and corpus were not modified by this reading.

| Product examined | Git blob |
|---|---|
| src/codec/cbor-tag-input.lisp | 6dfad07035ac8040b2aec0a455c175ea15dfd9ad |
| src/codec/cbor-tag-write.lisp | 16b91fc27eabafd7ff12bfb0a56ed34208c2bd4b |

No functional defect or open static finding identified in either blob.
Strict compilation, lint, corpus results, heap, parallel intervals,
coverage, and mutations remain pending. This reading does not close a C1 gate,
establish MC/DC, or qualify the engine. The updated requirements catalog
was read; matrix regeneration remains coordinator integration work
before `trace`.

<a id="checklist-c1"></a>

## C1 checklist

| Point | Static finding and limit |
|---|---|
| 1. Requirements and ADRs | REQ-CBR-007, LIM-001/002, AFF-004/008, INV-A5/A8/P6, and ADR-0014/0024/0033/0035/0048 are consistent with a local minimal structural MT6 primitive. All two-word u64 wire numbers allowed; application tags, document sentinels, and semantic determinism remain with the higher profile. |
| 2. Invariants | Preflight protects types, ranges, nonempty contents, words, scratch/aliases, limits, complete size, capacity, overlap, and minimum two nodes. Full scan before header; active guards compare actual sizes, nodes, peak, and progress. |
| 3. Errors | The method's ten phases retain order. Preflight IA/RE have offset NIL; scanner propagates typed errors and absolute SOURCE offsets. Every public error precedes writing and preserves full arrays. Preflight preserves scratch; parser can dirty it, then it is reusable. Internal invariants fail-stop without rollback. |
| 4. Bounds | No new loops, recursion, waits, or retries. SPAN<=16MiB before addition; scanner receives SPAN, MAX-NODES−1, and unchanged MAX-DEPTH. Existing stack/reset/drain102; tags without frames, copy<=SPAN, and header<=9bytes. |
| 5. Heap | Local variables and multiple values, without AST, closures, or temporary arrays in the new success path. SBCL64 limits keep sums fixnum; no reconstructed u64. Keyword calls and dependencies require benchmark with zero baseline and positive control; zero heap not established statically. |
| 6. Verified data | MT6 and original HIGH/LOW words, existing minimal selection, and bytes of one complete minimal item. Only [START,NEXT) changes. Header progress, payload span, and final NEXT checked; final result is a variable, one value. |
| 7. Compound decisions | Five AND/OR forms with11 operands, two chained numeric comparisons with4 relations and23 guards/error forms. Full inventory and pairs below and in the [table](cbor-tag-decisioni.md). No site excluded, including internal sites or declarations; dynamic independence not established. |
| 8. Owner | OWNER/SHARED declare exclusive BUFFER/SPACE and stable SOURCE shareable read-only. Simple u8 excludes displaced/shared backing. BUFFER/SOURCE EQ KINDS rejected; REMAINING is simple u32 and cannot be a valid simple u8 argument. BUFFER=SOURCE allowed only if disjoint from complete footprint, including header. |
| 9. Integration | Export cbor-package:12; product ASDF:35 after scanner/header/copy, three corpus files:164–165 after existing support, RUN:234. Dedicated coverage selects exactly two sources and tag RUN; aggregate codec:295 includes tag RUN. Self-test contains two positives and four scope negatives. REQ-CBR-007 catalog without :cov; matrix to regenerate. No make check run by this reading. |
| 10. Standard | Safety3, complete FTYPEs with exact arity, REQ, Pre/Post/error docstrings, specialized types, and at least two meaningful checks per function. Six functions of9–33 lines and4–8 paths under the stated convention: within60/10. No deviation proposed; warnings/style-warnings/lint still to be observed. |
| 11. Parallelism | No new waits, threads, locks, or shared writes in product. Corpus with two reused workers, read-only SOURCE, private buffers/scratch, two waves, sinks, timeouts, and cleanup. Durations and overlap must be observed; no inference of scaling or simultaneous execution on cores. |
| 12. Durability | Caller memory only, no I/O or durable/atomic publication. Codec does not change Serie: FAULTED for internal invariants remains the owner boundary's responsibility. |

<a id="preflight-parole-e-dimensioni"></a>

## Preflight, words, and sizes

`check-input-tag-cbor` performs BUFFER range, SOURCE range, empty span,
HIGH/LOW words, SPACE and aliases, byte/node/depth limits, SPAN byte
budget then complete size, capacity, complete overlap, and minimum two
nodes before reset or content reading. The existing header validator
rechecks the already valid range and constant MT6 before
HIGH and LOW; it does not check capacity, which remains in its planned phase.
Omitted offset is NIL through the condition's existing constructor.

`dimensioni-tag-cbor` checks SPAN>0 and SPAN<=MAX-BYTES<=16MiB before
MT6 selection and addition. `seleziona-header-cbor` uses separate HIGH/LOW:
1/2/3/5bytes if HIGH0,9bytes if HIGH nonzero. Maximum ITEM-SIZE
before byte checking is16MiB+9, within fixnum/index on SBCL64.
Capacity is compared with END−START before NEXT=START+ITEM-SIZE:
NEXT<=END makes addition safe in the index domain even with high START.
Corpus checks declared capacity against physical length with
sentinels and complete16MiB budget for both1/9byte headers.

SPACE slot access follows its type check. Aliases
BUFFER/SOURCE EQ KINDS are rejected before limits or reset.
Specialized u32 `REMAINING` is not valid simple u8; displaced arrays
are already excluded by the range validator. Nonempty SOURCE is checked
before aliases, as the method's precedence requires.

Overlap compares SOURCE with [START,NEXT), not all [START,END).
Strict inequalities allow both touching boundaries. With a9byte MT6,
SOURCE=[16,17), START8/NEXT18 intersects only the header: it must be
rejected even though payload copy [17,18) would be disjoint. Corpus
contains this case, and accepted START6/NEXT16 and START17/NEXT27. On
success BUFFER=SOURCE preserves the disjoint source span and modifies
only the footprint; public errors preserve the entire physical array.

<a id="scansione-residuo-nodi-e-statistiche"></a>

## Scanning, remaining nodes, and statistics

MAX-NODES must be at least2 before entering scanner: one root tag
node plus at least one content node. Exact remainder is MAX-NODES−1;
there are no aggregates or multi-item loops. MAX-DEPTH passes unchanged,
because MT6 is not an array/map container. Scanning requires one exact
minimal item; trailing data, tags without content, UTF8, and nonminimal
representations retain parser reasons and absolute offsets.

Tag on scalar or tag chain allowed at depth0. Fixture1024 source
tags plus scalar has1025 nodes and peak0; minimum complete budget is1026.
With1025, scanning fails at scalar SOURCE-START+1024. No frame
is consumed for each tag. Contents with100 nested arrays pass
MAX-DEPTH100 and102 total nodes; with101 they fail at SOURCE-START+100.

NEXT=END,1<=NODES<=MAX-NODES−1, and PEAK<=MAX-DEPTH are checked before
writing. Scratch remains scanner scratch: counts contents,
not emitted tag, and on success cursor=SOURCE-END, top/depth0,
pending-tag NIL. Failed parsing may have modified it; every new
scan resets it. Preflight rejections do not reset it.

First write is inside `scrivi-header-cbor-minimo`, after all
scanning. Then guards on header progress and payload span,
existing copy with already proven preconditions, and final NEXT.
Guards after first write signal internal invariants without
rollback; they are not new public rejections allowed by the contract.
Bounded work O(SPAN*102); no AST or tag interpretation.

<a id="righe-percorsi-e-inventario"></a>

## Lines, paths, and inventory

DEFUN count from first through final parenthesis inclusive, including
docstrings/declarations. Paths: base1 plus WHEN/UNLESS and each
AND/OR operand after the first. No new LOOP/IF/COND/CASE.
Chained relations have a distinct inventory and are not
added to syntactic path counts. This is neither MC/DC nor the count
of instrumented branches.

| Function | File/inclusive lines | Lines | Paths | Guards |
|---|---|---:|---:|---:|
| check-spazio-tag-cbor | input:9–17 |9|4|2|
| dimensioni-tag-cbor | input:22–40 |19|6|5|
| check-overlap-tag-cbor | input:45–55 |11|8|3|
| check-input-tag-cbor | input:60–83 |24|5|4|
| verifica-contenuto-tag-cbor | write:10–30 |21|8|6|
| scrivi-tag-cbor-minimo | write:36–68 |33|4|3|

`input` is [cbor-tag-input.lisp](../../src/codec/cbor-tag-input.lisp),
`write` is [cbor-tag-write.lisp](../../src/codec/cbor-tag-write.lisp).
AND/OR input:15/49/51/53 and write:15. Chained comparisons write:19/26.
Guards input14+write9=23, each with one ERROR form. These are active
checks among data, sizes, results, and limits, not TRUE constants.
Every function has at least two meaningful checks beyond FTYPEs alone.
False internal guards prevented by preflight or correct callees remain
in the denominator; static pairs do not claim their execution.

C4 reader `review/read-product-decisions.lisp`, preserved in the increment's
ignored support, reads forms as DATA with READ-EVAL NIL and EOF,
without product LOAD/EVAL/COMPILE. Confirms6 functions,23guards/ERRORs,
5AND/OR11operands,2chains/4relations,0loops and paths4/6/8/5/8/4;
stdout preserved, stderr empty. Line sizes are manual counts.

<a id="corpus-congelato-e-integrazione"></a>

## Frozen corpus and integration

| Blind file | Git blob |
|---|---|
| tests/codec/cbor-tag-write-support.lisp |15978d05251705387205d6468031a701ad95ec85|
| tests/codec/cbor-tag-write.lisp |df97950ec8d24157bb6566c7995262f7beea7742|
| tests/codec/cbor-tag-write-threads.lisp |def870295400af2c84ca00e7a9b5cd5b747ec315|

Pins unchanged. Cold plan blob `71f0cbd4f4b9e2c180c2fe4dde208fa8d88a6787`:
20 nominal tests,442 non-fuzz calls (144 accepted/298 rejected), fuzz1024
(512/512), two reused workers8192. Total9658 calls to new API,
8848 expected successes/810 rejections, plus116 secondary scanner calls with distinct
scratch. Seed54414737, finalF8004B37 separately recalculated; these are
not PASS results. Word/header boundaries, precedence, types, empty source,
aliases, capacity/complete budget, overlap, parser, nodes, depth,
stats, arity, sentinels, and reuse are consistent with the contract read.

Parallel: two waves x2048 calls for each of two real workers,
common read-only SOURCE and private scratch/destinations. NEXT13/17,
tokens32601/47515, sinks66766848/97310720 per worker/wave, full physical-byte
checks and content statistics6/2. Wait15s, join20s, bounded cleanup
with verified termination. Expected positive overlap is measured;
no scaling conclusion. Individual timestamps not printed.

Integration read: package `f20d93e9a0cd5cc5387a12d1668968e07cf30d89`,
ASDF `805550e9053aef5671d28a6fdda62c8eee0ab2e2`, coverage
`8e32ee2ba7b758eb5b0cea349ab8b3d53bd9f2c8`. Exact tag input/write scope,
two positives/four negatives in self-test, dedicated RUN and aggregate codec.

Dependencies read: header writer `61f0d6e2783e4790ed7e19a45bba6407d6e5b3de`,
range/copy `a2c5c77dd51bff760bff4508e998d94370921eda`, limits
`57ffc48cc688a4de8ebec5cb14c1e69c4209704a`, scanner
`e3d7d77407046338d23e26eb0b8a2e8fdc3d699d`, minimal wrapper
`f1afe79c7a4d49abd6a6e5f6975dec830ef7b1f6`, space
`a8330e50a77b52a6b9044ebbb48f62bb4b3222a3`.

Remaining: compilation without warnings/style-warnings, lint, self-tests/campaigns
with sources/index/HEAD stable, heap, full coverage without exclusions,
mutations, distinct data readings, and integrated make check. None of
these activities was performed by this static reading.
