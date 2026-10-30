<a id="prima-lettura-c1-della-composizione-dei-tag-cbor"></a>

# First C1 reading of CBOR tag composition

Static reading on 2026-10-14 **before the first compilation**, performed
by a reviewer distinct from the product author. No LOAD/EVAL, compile,
suite, benchmark, mutation, or campaign run during this reading.
The corpus was frozen before the new sources; cold plan
`71f0cbd4f4b9e2c180c2fe4dde208fa8d88a6787`.

<a id="fonti-e-perimetro"></a>

## Sources and scope

| Source | Blob read |
| --- | --- |
| [cbor-tag-input.lisp](../../src/codec/cbor-tag-input.lisp) | `6dfad07035ac8040b2aec0a455c175ea15dfd9ad` |
| [cbor-tag-write.lisp](../../src/codec/cbor-tag-write.lisp) | `16b91fc27eabafd7ff12bfb0a56ed34208c2bd4b` |
| [Method](cbor-tag-metodo.md) | `3175390e496173398781bf8b39170cb33892125f` |
| `tests/codec/cbor-tag-write-support.lisp` | `15978d05251705387205d6468031a701ad95ec85` |
| `tests/codec/cbor-tag-write.lisp` | `df97950ec8d24157bb6566c7995262f7beea7742` |
| `tests/codec/cbor-tag-write-threads.lisp` | `def870295400af2c84ca00e7a9b5cd5b747ec315` |

REQ-CBR-007 derives from ADR-0014, with ADR-0024/0035/0048 and invariants
INV-A5, INV-A8, INV-P6. The product also references REQ-LIM-001/002 and
REQ-AFF-004/008. It is a minimal structural MT6 composer: it verifies one
complete content item and emits a minimal header with identical payload.
It certifies neither tag semantics, document admission, nor global determinism.

<a id="esito-statico-e-contratto"></a>

## Static outcome and contract

**No blocking defect identified in the two sources read.** Six functions
with complete FTYPEs, safety3, requirements, and docstrings; maximum33 lines and eight
syntactic paths under the convention below. This static
conclusion does not anticipate warning-free compilation or campaign results.

Preflight follows the ten preregistered phases: destination range,
source range/empty source, HIGH then LOW, SPACE/alias, limits, complete bytes,
logical capacity, complete overlap, minimum two nodes, and scanning. Emission
begins only after scanning and all content postconditions.
Public rejections occur before writing data; preflight without reset,
failed parsing with dirty but reusable scratch under the existing scanner contract.

HIGH/LOW remain independent u32 words. `seleziona-header-cbor` calculates
size1/2/3/5/9 without reassembling u64; emission passes major6 and the
same words. Before adding header size,
SPAN<=MAX-BYTES<=16MiB is checked. ITEM-SIZE is then compared with budget and
END-START: NEXT=START+ITEM-SIZE is within already validated END, without using the
physical tail as capacity. Sums are bounded before subsequent casts.

BUFFER/SOURCE equal to SPACE.KINDS are rejected before reset. The other
private array is simple u32 and cannot be one of the already validated simple u8 arrays.
BUFFER=SOURCE requires that source span not intersect [START,NEXT),
header included; touching boundaries are allowed. The existing copy receives
source and destination spans of equal length and disjoint. On success,
only the footprint changes, preserving SOURCE span; on public error,
entire physical arrays are preserved even when identical.

MAX-NODES1 is valid configuration but insufficient: the composer
rejects before the scanner. With minimum2, MAX-NODES-1 is passed, at least1.
The scanner checks exact minimal content, including UTF8 and float
widths, and returns nodes/peak/NEXT checked before emission.
The new tag node is included in budget without modifying scratch:
scratch describes only the content. MAX-DEPTH passes unchanged; tags and
tag chains consume no array/map frames or levels. A scalar at depth0
and container at depth100 remain possible within other budgets.

Callee results are used or serve only verification semantics through
conditions; no error code is ignored. Copying returns RESULT,
compared with NEXT and returned as the single lexical value. Internal
invariants are fail-stop conditions without rollback; the Serie transition
at the runtime boundary remains outside the primitive, which owns no Serie.

<a id="decisioni-composte-e-relazioni-numeriche"></a>

## Compound decisions and numeric relations

**Five AND/OR sites, 11 operands**, no nested AND/OR. Conditions
are listed in short-circuit order. Witnesses exist
in the frozen corpus, not as executed results or MC/DC proof.

| Site | Operator and conditions | Planned witness |
| --- | --- | --- |
| input:15, `check-spazio-tag-cbor` | OR: BUFFER EQ SPACE.KINDS; SOURCE EQ SPACE.KINDS | `workspace-type-and-both-kinds-aliases`: two distinct roles and no-alias case |
| input:49, `check-overlap-tag-cbor` | AND: START<NEXT; NEXT<=LENGTH(BUFFER) | internal footprint preconditions; nonpublic outcomes remain in denominator |
| input:51, `check-overlap-tag-cbor` | AND: SOURCE-START<SOURCE-END; SOURCE-END<=LENGTH(SOURCE) | internal nonempty-content preconditions; no exclusion |
| input:53, `check-overlap-tag-cbor` | AND: BUFFER EQ SOURCE; START<SOURCE-END; SOURCE-START<NEXT | `overlap-including-only-header-and-touching-boundaries`: distinct arrays, disjoint left/right, touching and header/payload overlap |
| write:15, `verifica-contenuto-tag-cbor` | AND: START<END; END<=LENGTH(SOURCE) | internal content preconditions; public range/empty checks as distinct external witnesses |

Abbreviated names refer to `test-REQ-CBR-007-tag-*`. Testing a
public rejection is not equated with reaching the internal IV branch it
protects. These branches must remain visible in raw coverage.

**Two chained numeric predicates, four relations**:

| Site | Ordered relations | Property |
| --- | --- | --- |
| write:19 | 2<=MAX-NODES; MAX-NODES<=16MiB | remainder at least1 before subtracting tag node |
| write:26 | 1<=NODES; NODES<=MAX-NODES-1 | at least one item and actual budget returned by scanner |

Chained relations are not source-written AND/OR forms and are not
added to syntactic paths; they remain semantic decisions to read
condition by condition and compare with SB-COVER.

<a id="inventario-di-tutte-le-guardie"></a>

## Inventory of all guards

**23 WHEN/UNLESS sites: input14 and write9. No new LOOP, IF, COND, or CASE.**
IA=INVALID-ARGUMENT, RE=RESOURCE-EXHAUSTED, IV=INVARIANT-VIOLATION.
All local errors have NIL offsets. Scanner and UTF8 errors
retain their own type, reason, and absolute SOURCE offset.

| Function | Sites and conditions → rejection |
| --- | --- |
| `check-spazio-tag-cbor` | input:13 SPACE correct type → IA `:cbor-workspace`; input:15 OR alias → IA `:cbor-tag-workspace-alias` |
| `dimensioni-tag-cbor` | input:27 START<=END → IV `:cbor-tag-dimension-range`; input:29 positive SPAN → IV `:cbor-tag-dimension-empty`; input:31 SPAN>MAX-BYTES and input:36 ITEM-SIZE>MAX-BYTES → RE `:cbor-tag-byte-budget`; input:38 ITEM-SIZE>END-START → RE `:cbor-tag-capacity` |
| `check-overlap-tag-cbor` | input:49 ordered/nonempty footprint within array → IV `:cbor-tag-target-span`; input:51 ordered/nonempty content within array → IV `:cbor-tag-source-span`; input:53 complete overlap → IA `:cbor-tag-overlap` |
| `check-input-tag-cbor` | input:69 SPAN zero → IA `:cbor-tag-source-empty`; input:77 MAX-NODES<2 → RE `:cbor-tag-node-budget`; input:79 SPAN=SOURCE-END-SOURCE-START → IV `:cbor-tag-input-span`; input:81 ITEM-SIZE<=END-START → IV `:cbor-tag-input-capacity` |
| `verifica-contenuto-tag-cbor` | write:15 nonempty range within SOURCE → IV `:cbor-tag-child-range`; write:17 SPAN=END-START → IV `:cbor-tag-child-span`; write:19 MAX-NODES domain → IV `:cbor-tag-child-budget`; write:24 NEXT=END → IV `:cbor-tag-child-progress`; write:26 nodes1..MAX-NODES-1 → IV `:cbor-tag-child-nodes`; write:28 PEAK<=MAX-DEPTH → IV `:cbor-tag-child-depth` |
| `scrivi-tag-cbor-minimo` | write:61 PAYLOAD-START=BEGIN+HEADER-SIZE → IV `:cbor-tag-header-progress`; write:63 NEXT-PAYLOAD-START=SPAN → IV `:cbor-tag-payload-span`; write:66 RESULT=NEXT → IV `:cbor-tag-write-progress` |

No string ERRORs, generic handlers, side-effecting guards,
or IV-branch exclusions are added. Relations compare inputs,
capacity, and callee results, not merely already declared types.
Every nontrivial function retains at least two active checks.
Errors inherited from range checks, words, limits, scanner,
header writer, and copy continue to propagate: the local inventory neither
reclassifies them nor removes their points from respective measurements.

<a id="righe-e-percorsi"></a>

## Lines and paths

Count from DEFUN to final parenthesis inclusive, including docstrings and
declarations. Paths: base1 + WHEN/UNLESS + one short circuit for every
AND/OR operand after the first. No new loop or other branching construct.
This convention does not replace raw coverage or MC/DC.

| File/function | Lines | Line count | Paths |
| --- | --- | ---: | ---: |
| input, `check-spazio-tag-cbor` | 9–17 | 9 | 4 |
| input, `dimensioni-tag-cbor` | 22–40 | 19 | 6 |
| input, `check-overlap-tag-cbor` | 45–55 | 11 | 8 |
| input, `check-input-tag-cbor` | 60–83 | 24 | 5 |
| write, `verifica-contenuto-tag-cbor` | 10–30 | 21 | 8 |
| write, `scrivi-tag-cbor-minimo` | 36–68 | 33 | 4 |

<a id="lista-di-controllo-c1--dodici-punti"></a>

## C1 checklist — twelve points

1. **Requirements/ADRs:** REQ-CBR-007 and limit/reliability requirements are on
   every DEFUN. Method, ADR-0014/0024/0035/0048, and structural scope consistent.
2. **Invariants/witnesses:** INV-A5/A8/P6 identified; corpus with cold
   oracles, sentinels, limits, aliases, nodes/depth, error/reuse, and private workers.
   Witness execution remains future work.
3. **Errors:** typed IA/RE/IV, declared precedence and offsets; scanner
   propagated unchanged. Public rejections and array preservation
   have witnesses; IV guards and their qualification contribution remain open.
4. **Limits:** no new loop/recursion/wait; dependencies bounded by
   SPAN<=16MiB, nodes, and fixed stack102. Header at most9 bytes and linear copying.
5. **Hot heap:** no AST, u64 object, buffer, or structure created in
   new code; no measurement performed here. Benchmark, null baseline,
   and positive control must still produce COD-30 data.
6. **Verified data:** complete/minimal item checked before first
   emission; payload preserved, no application semantics implicitly added.
7. **Decisions:** all5 AND/OR forms,11 operands,2 chains/4 relations, and23 guards
   inventoried above. No exclusion or full coverage inferred from static reading.
8. **Ownership:** exclusive destination/scratch, stable SOURCE; aliases
   rejected before reset. Scratch retains no source ownership.
9. **Integration:** ASDF loads input then write after dependencies, support/
   serial/thread and global RUN present, export present. Exact direct coverage
   on two files, dispatch, CLI, and aggregate codec RUN present; self-test
   adds2 positive and4 negative cases (test, fake, child, map source).
   REQ-CBR-007 is implemented, without :cov or promotion to verified.
   On first pass the matrix still said designed: reported to the
   coordinator for regeneration before freeze. Trace/make check not run here.
10. **Rules:** FTYPE6/6, safety3, docstrings/requirements, maximum33 lines/8 paths;
    no new macro, mutable global state, syscall, or prohibited construct.
    Warning-free compilation and lint remain subsequent checks.
11. **Parallelism:** no lock, wait, thread, or shared write across
    Serie in the product. The corpus plans two workers with read-only SOURCE
    and private destinations/scratch; reading certifies no scaling.
12. **Durability:** no durable publication/deletion or new storage
    atomicity point. Public errors before effects; IV fail-stop
    without rollback, to be handled at the Serie boundary under ADR-0033.

Integration read: ASDF `805550e9053aef5671d28a6fdda62c8eee0ab2e2`,
export `f20d93e9a0cd5cc5387a12d1668968e07cf30d89`,
C4 coverage `8e32ee2ba7b758eb5b0cea349ab8b3d53bd9f2c8`.
Coverage delta is limited to tag selection/dispatch/CLI/fixtures and
addition of tag RUN to aggregate codec; previous scopes preserved.

The cold plan reports20 nominal tests,9658 API calls,1024 fuzz, and8192
parallel compositions, plus116 verification scans: static counts,
not observed outcomes. Second C1 reading, actual freeze, compilation,
campaigns, DATA readings, and integrated make check still need to occur.
**REQ-LIM-001/002, C1 qualification, and MC/DC remain open.**
