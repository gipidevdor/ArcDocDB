<a id="prima-lettura-c1-della-composizione-delle-mappe-cbor"></a>

# First C1 reading of CBOR map composition

Static reading on 2026-10-14 **before the first compilation**, performed by
a reviewer distinct from the product author. No LOAD/compile of product,
corpus, or driver; no suite or campaign run during this reading.
The corpus was frozen before the product was written, under blind plan
`def50d1650ada2447dffedf13895ac85a40ee84a`.

<a id="fonti-e-perimetro"></a>

## Sources and scope

| Source | Frozen blob |
|---|---|
| [cbor-map-input.lisp](../../src/codec/cbor-map-input.lisp) | `d7a593badeb6e6b71f28dc4e80c641b07189d0b8` |
| [cbor-map-write.lisp](../../src/codec/cbor-map-write.lisp) | `22e814ea68e606c5bc58033c2a31e945303a9d65` |
| [Method](cbor-map-metodo.md) | `636dd2706c2903542978606cf029e7198bf4dbb3` |
| `tests/codec/cbor-map-write-support.lisp` | `a389e51f2416437d608c4f7745b9680eca27bc60` |
| `tests/codec/cbor-map-write.lisp` | `6ad0e9b5a48ba9c32c46d720f2f7f1821368d6c8` |
| `tests/codec/cbor-map-write-threads.lisp` | `6a65b58ce236b92b33772e1861dbd8c1257bee13` |

The increment implements REQ-CBR-006, derived from ADR-0014, with REQ-LIM-001/002,
REQ-AFF-004/008, and invariants INV-F1, INV-P6, INV-A8. It is a structural
MT5 primitive: it preserves minimal children's order and bytes; it does not certify
key order, uniqueness/equivalence, application tag semantics, or the deterministic
document profile.

<a id="esito-e-rilievo-risolto"></a>

## Outcome and resolved finding

**No remaining blocking defect identified in the two sources.** The ten
functions have complete FTYPEs, safety3, requirements/docstrings/ownership; maximums
38 lines and nine syntactic paths under the convention stated
in the [complete inventory](cbor-map-decisioni.md).

A C4 integration gap was found before any compilation:
the aggregate `codec` scope of `tools/foundation-coverage.lisp` ended with
array RUN and omitted map RUN, while direct map scope and ASDF were correct.
The coordinator added map RUN after array; only the delta was reread,
final tool **`e273f103df929f6c00ab504641e9e38ab04857ce`**. Product and corpus
retain all pins above. The reviewer changed neither product, corpus, nor tool.

<a id="contratto-domini-e-invarianti"></a>

## Contract, domains, and invariants

COUNT counts pairs, ITEMS=2*COUNT. input:14/16/19 validates simple U32 type and
COUNT INDEX against **two separate comparisons** with half the table and half SPAN,
before doubling at input:21. Thus ITEMS<=SPAN INDEX without overflow; COUNT0
requires SPAN0. Inactive tails, including odd ones, are neither bounded by SPAN nor read.
input:50 clamps SPAN against the already validated budget <=16MiB before COUNT's
u32 cast, addition, and loop; subsequent ITEMS casts are within16MiB.

The public sequence reproduces all eleven method phases: destination/source
ranges, table/COUNT, SPACE/alias, configuration, complete bytes,
logical capacity, footprint overlap, ends, minimum nodes/root level,
full scan, and finally emission. Ranges and capacity are half-open;
NEXT calculation is already within END, not in the physical tail. Last end=SPAN
and strict growth guarantee a partition into 2*COUNT nonempty items.

BUFFER/SOURCE eq SPACE.KINDS and ITEM-ENDS eq SPACE.REMAINING are rejected
before reset, even for an empty map. BUFFER=SOURCE is allowed only with
source span disjoint from the entire [START,NEXT), header included; END may
be wider than the footprint. On success when EQ, the source
span is unchanged, while the same physical array changes in the destination footprint.
The `cmw-accept` corpus explicitly distinguishes this case; every public
rejection instead preserves entire physical arrays.

The root starts at nodes1/peak1. Minimum1+ITEMS and MAX-DEPTH>=1 are checked
before subtracting the root level. Each key/value is scanned
separately with its own span, remaining MAX-NODES-NODES, and MAX-DEPTH-1.
Remaining1 is valid; remaining0 produces `:cbor-map-node-budget` at the next
item's absolute start before reset. Exhaustion inside a value retains
the scanner's `:cbor-node-budget`, without converting it to the composer's reason.
Tags are nodes without container levels; peak=1+maximum child peak.

Active postconditions check exact consumption and actual nodes/peak,
ITEMS=2*COUNT, header size, payload span, and copy progress. These are
meaningful relationships between results and inputs, not checks only of
already declared types. Public checks with T parameters validate genuinely
external domains. Every nontrivial function has at least two active guards; the
inventory also retains all IV guards and internal error branches. An IV failure
remains fail-stop without rollback, to be handled at the Serie boundary under
ADR-0033; this API owns neither a Serie nor a commit point.

Emission begins with the call at write:100 after all scans
and aggregate checks finish. The major passed is 5,
the header argument is COUNT pairs, and the loop uses ITEMS: no confusion with MT4
or item count. The shared MT2/3 copy is reused under its
preconditions of equal, stable, disjoint spans; RESULT is returned as
a single lexical NEXT value.

<a id="lista-di-controllo-c1--dodici-punti"></a>

## C1 checklist — twelve points

1. **Requirements/ADRs:** REQ-CBR-006 and limit/reliability requirements are on every
   DEFUN; ADR-0014/0033/0035/0048 and matrix are consistent with local scope.
2. **Invariants/witnesses:** integrity, ownership, and budgets are referenced; the
   corpus contains literal pairs, sentinels, overflow, aliases, depth,
   remaining nodes, error/reuse. Execution remains to be observed.
3. **Errors:** local IA/RE/IV and propagated scanner errors are typed; reasons,
   precedence, and offsets are in the inventory. No string ERROR in the product.
4. **Limits:** two LOOPs with ITEMS<=SPAN<=16MiB, bounded iterative scanner with
   scratch 102; no new recursion, waits, or I/O.
5. **Hot heap:** no AST, u64 object, buffer, or structure created in the new
   code; index/u32 calculations after clamps. Allocation is not measured here:
   the campaign must preserve data, baseline, and positive control.
6. **Verified data:** all exact/minimal keys and values are scanned
   before emission; UTF8 and floats follow the existing scanner. No
   ordering/deduplication or tag semantics implicitly added.
7. **Decisions:** five AND/OR forms, 14 operands; nine chained comparisons with 18
   relations; 40 guards and two LOOPs, all inventoried without exclusions.
   Condition coverage and MC/DC are not certified by static reading.
8. **State ownership:** exclusive destination/scratch, stable source/table;
   scratch fields not shared across workers. Aliases forbidden before reset.
9. **Integration:** public export present; product ASDF loads input then
   write after dependencies; corpus support/serial/thread and global RUN
   are present. Exact coverage scope, dispatch, positive/fake/child fixtures,
   and corrected aggregate RUN. REQ-CBR-006 is implemented, not verified;
   matrix contains the new entry. Build/lint/trace/link/make check not run here.
10. **Rules:** FTYPE 10/10, docstrings/requirements, safety3, <=60 lines and <=10
    syntactic paths; no new CASE/COND, macro, mutable global state,
    LOAD/EVAL/COMPILE/INTERN, or system call in the product. No deviation
    introduced or coverage exclusion approved by this reading.
11. **Parallelism:** no lock, shared write, or wait across Serie;
    the product creates no threads. The corpus plans two private workers,
    without inferring scaling or simultaneity from future intervals.
12. **Durability:** no durable publication or deletion, thus
    no new storage atomicity point. Before emission, public errors
    preserve data; internal invariants are fail-stop without rollback.

<a id="prove-ancora-da-raccogliere"></a>

## Evidence still to collect

The frozen corpus plans 20 nominal tests and 9499 calls to the new API,
including 1024 fuzz and 8192 parallel calls; these are preregistered counts, not results.
Executions, heap measurements, raw coverage, condition witnesses, mutations,
DATA readings, and integrated checks must be recorded after the two required
C1 readings. This first reading closes no engine C1 gate
and certifies neither qualification, evidence authenticity, nor full coverage.
