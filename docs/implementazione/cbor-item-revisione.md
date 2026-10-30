<a id="primo-item-cbor-minimo--prima-revisione-c1"></a>

# First minimal CBOR item — first C1 review

Static reading by the cold-corpus owner on 2026-10-15, after
corpus freeze and subsequent product writing, before first
compilation, load, or campaign. The reviewer is distinct from the product
author and does not consult the second C1 reading. Source examined:
[cbor-item-read.lisp](../../src/codec/cbor-item-read.lisp), blob
`b9099dc8a8c96281063811e686deb4dcb2b1d39b`. Preregistered method
[cbor-item-metodo.md](cbor-item-metodo.md), blob
`a67a79bf4fefe11c4778cd881eb5279a006966ca`.

No functional defect or open static finding identified in the blob.
Product and corpus are not modified by this reading. Strict
compilation, lint, corpus results, heap, parallel intervals,
coverage, and mutations remain pending. This review does not close
C1/MC/DC qualification or qualify the engine.

<a id="checklist-c1"></a>

## C1 checklist

| Point | Static finding and limit |
| --- | --- |
| 1. Requirements and ADRs | REQ-CBR-008, LIM-001/002, AFF-004/008, and INV-A5/A8/P6 describe the bounded structural primitive derived from ADR-0014/0024/0035/0048. Result is first-item boundary and counts, without AST or tail interpretation. Document profile and tag semantics remain open. |
| 2. Invariants | Preflight identical to scanner, before reset. New guards on SPAN, loop exhaustion, START<NEXT progress, and NEXT<=END; existing drain and result check root/counts/state. No dependence on tail validity. |
| 3. Errors | Range/workspace/aliases/byte-node-depth limits/byte-budget order preserved, offset NIL and scratch unchanged. Parsing propagates minimal header, UTF8, nodes/depth with absolute offsets. Empty and truncated inputs reach `[END,END)` reader: `:cbor-truncated` at END. No partial result; buffer unchanged even after error and scratch reusable. |
| 4. Bounds | SPAN<=16MiB before loop, at most SPAN steps with checked progress. Each drain at most102 frames. Tags without frames and depth only arrays/maps. Original END always passed to step; completion check uses cursor. No new recursion, wait, or retry. |
| 5. Heap | Local typed variables and three values, no new array/cons/AST/closure on success. Reset works on two preallocated arrays; wire values stay in words. Keyword calls and dependencies require benchmark with zero baseline and positive control; zero heap not established statically. |
| 6. Verified data | MINIMAL=T in step, entire window for MAX-BYTES, counts for item only. Result called with NEXT=CURSOR, not physical END: returns exactly NODES/PEAK/NEXT. Three values fixed by FTYPE and callee, no u64 reconstruction or buffer copy. |
| 7. Compound decisions | Six explicit predicates, five ERROR sites, one LOOP, zero AND/OR, four binary comparisons, and zero chains. Complete inventory in the [table](cbor-item-decisioni.md), including internal guards and three keyword defaults. No exclusion, static pair, or absence of AND/OR presented as measured MC/DC. |
| 8. Owner | OWNER/SHARED declare stable buffer shareable read-only and space exclusive to call/worker. Preflight rejects BUFFER=KINDS before reset. Simple u8 type excludes displaced/shared backing; REMAINING is distinct simple u32 on SBCL. No buffer writes or global state. |
| 9. Integration | Package export line13; product ASDF line36 after scanners, three corpus files lines171–172, and RUN included in test-system. Exact coverage scope for only new source, one positive/four negatives for selection, direct RUN and aggregate codec. REQ-CBR-008 and already regenerated matrix show implemented with test/diff/fuzz/bench/mut/rev, without :cov. No make check run by this reading. |
| 10. Standard | Safety3, complete FTYPE with arity three, REQ, Pre/Post/error docstring, and restricted types after preflight. One function34 lines/8 syntactic paths, within60/10; at least two meaningful checks. No deviation proposed; warnings/style-warnings/lint still to be observed. |
| 11. Parallelism | No new threads, locks, waits, or shared writes in product. Corpus with two reused real workers, shared read-only buffer and private scratch, two waves, rendezvous after first verified item, sinks, timeouts, and cleanup. Timestamps/overlap still to be observed; no inference about cores or scaling. |
| 12. Durability | Caller memory only, no I/O or atomic/durable publication. Primitive does not change Serie; FAULTED handling for internal invariants remains at owner boundary. |

<a id="finestra-completamento-e-coda"></a>

## Window, completion, and tail

`check-input-struttura-cbor` returns END−START and checks all
arguments before reading bytes or changing scratch. MAX-BYTES concerns
the entire authorized window, even if the first item ends immediately.
A five-byte window `00 FF 1C 18 00` requires budget5; budget1
must fail before reset. The caller can restrict END to1.

The old drain requires EOF relative to its own END parameter.
Passing current CURSOR makes that requirement equal to the cursor
already reached, without reading the tail: a complete root ends, an incomplete
root returns NIL. At both points in the new wrapper, drain
receives CURSOR; step instead receives LIMIT=original END. The latter
must be able to read the item's complete header/payload within the window
and retain absolute error offsets.

Example `C0 81 00 FF`: tag consumes one node without a frame, array one node
and one level, scalar one node. After the scalar, drain closes array
and root at NEXT3; FF is not read. `risultato-struttura-cbor` receives3
and checks cursor=3, nodes3, peak1, and empty state before the three values.
Existing exact scanners still pass END4 to drain and
reject FF with `:cbor-trailing` at3. They were not modified.

Every step advances at least one byte and does not exceed END. If the loop ends
by SPAN exhaustion without a complete root, cursor must be END;
header reader `[END,END)` produces public truncation. The following
ERROR guard would detect an impossible reader return.
For SPAN0, the same path produces truncation, without accepting
an empty item or returning partial values. No byte beyond NEXT is
read after root completion; internal reads needed to determine
a partially complete item's length remain bounded by END.

Completed root, the single progressive step, and explicit guards
imply START<NEXT<=END. Tag1024+scalar uses1025 nodes, depth0, and
no tag frames; one hundred arrays allow peak100, the101st fails
at its lead. Nodes/depth exclude tail items.

<a id="corpus-congelato-e-lettura-data"></a>

## Frozen corpus and DATA reading

| Cold-corpus file | Git blob |
| --- | --- |
| tests/codec/cbor-item-read-support.lisp |0326100362a1c4b24d2c7e511e45357f09a56d33|
| tests/codec/cbor-item-read.lisp |b2cbdcb4255c51d9da4fe73b28939c1cb923fefe|
| tests/codec/cbor-item-read-threads.lisp |a0da65545ed80ede0a967cadbb337731f6fe1ce9|

Cold plan `review/blind-plan.md` in ignored support, blob
`63a749b0e8737f49d400f40b0a98c454c2dc3cfc`:17 nominal tests,
**9901 calls** expected to new API:685 non-fuzz (551 successes/134
rejections),1024 fuzz (512/512),8192 parallel. Total9255/646.
These are static corpus counts, not PASS results. Separate secondary
exact scanners:520 on prefix,390 trailing, and two on concatenation.

LCG32 seed49544538 and final6CB25938 recalculated without product.
The wrong provisional final value is corrected before freeze, preserving
the original serial file. All34 corpus forms were read as DATA,
READ-EVAL NIL through EOF;17 unique DEFTEST names and empty stderr.
Corpus includes MT0..7, raw floats, UTF8, words/lengths, invalid
and physical buffers, all precedence, aliases, limits16MiB/0/100/101,
long tags, every composite truncation, arity, and reuse after error.

Parallel: two waves of2048 reads for each of two workers,
fixture `C0 A1 61 61 82 F4 F5` and tail `FF 1C 18 00`, START7/END18,
expected6/2/NEXT14, token36196, sink74129408 per worker/wave.
START/FIRST/END, sink, and overlap printed before assertions.
Rendezvous after first verified read includes checks and
waiting in WALL; no conclusion about pure decoder time or scaling.
Wait15s, join20s, and cleanup with verified termination.

Mechanical reader `review/read-product-decisions-v2.lisp` reads
four product forms as DATA with READ-EVAL NIL through EOF;
confirms1 function,5UNLESS/1WHEN,1LOOP,5ERROR,0AND/OR,
4 binary comparisons and0 chains. Stdout preserved, stderr empty, exit0.
First reader-only variant with missing parenthesis preserved
with stdout/stderr; no product LOAD/EVAL/COMPILE.

<a id="integrazione-e-dipendenze-lette"></a>

## Integration and dependencies read

Package `64b3a838f6d5b432148e64604d5e1dfa4a3c32d4`, ASDF
`8e36893806e499946cbffcc2c8475690ea40cba0`, coverage
`19369e3ea8f944a420efa1918383c7ac28544c6d`.
The matrix read contains REQ-CBR-008 implemented; subsequent
trace checking remains integration's responsibility.

Dependencies: preflight `57ffc48cc688a4de8ebec5cb14c1e69c4209704a`,
space/reset `a8330e50a77b52a6b9044ebbb48f62bb4b3222a3`,
stack/drain `c574e87af5e195ddf3f596a4ae527e69c7a3c6a6`,
step/items `70272936e323b3e0cb05173c9fb68cb2b614c355`,
scanner/result `e3d7d77407046338d23e26eb0b8a2e8fdc3d699d`,
exact minimal wrapper `f1afe79c7a4d49abd6a6e5f6975dec830ef7b1f6`.

Remaining: compilation without warnings/style-warnings, lint, self-tests and
campaigns with sources/index/HEAD stable, heap, complete coverage
without exclusions, eight mutations, distinct data readings, and integrated
make check. None of these measurements is established by this reading.
