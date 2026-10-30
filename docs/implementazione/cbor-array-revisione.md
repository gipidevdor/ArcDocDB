<a id="composizione-degli-array-cbor--prima-lettura-c1"></a>

# Composing CBOR arrays — first C1 reading

Static reading of 2026-10-13, before compiling the new sources
and running campaigns. The corpus was frozen before writing the
product. References: [preregistered method](cbor-array-metodo.md),
[contract](cbor-array.md), [decision inventory](cbor-array-decisioni.md),
[coding standard](../affidabilita/standard-di-codifica.md), and
ADR-0014/0024/0033/0035/0048. This reading does not measure allocations,
coverage, performance, or MC/DC and does not close the C1 gate.

<a id="versioni-lette"></a>

## Versions read

| File | Git blob |
|---|---|
| `src/codec/cbor-array-input.lisp` | `d3b3d07fc18bd2a077c1a2d79020a76263b2779e` |
| `src/codec/cbor-array-write.lisp` | `a410297c29c5d043ad60d3804bd3711e22c2833b` |
| `docs/implementazione/cbor-array-metodo.md` | `2f257c9e8a56a5182142934dada3f3b38b5bef65` |
| `tests/codec/cbor-array-write-support.lisp` | `eb1fccadb205e375b4a2324a6b6725a860bb546f` |
| `tests/codec/cbor-array-write.lisp` | `b13f58264f3cd97e1947ee52936732a7fcebe672` |
| `tests/codec/cbor-array-write-threads.lisp` | `5720110265b67019937f08cbd949b4469a04b867` |

Existing span/copy, header, scratch, preflight, and minimal-scanner helpers
were also read, along with exports, ASDF order, coverage scope, requirement,
and matrix. Relevant dependency hashes are:

| File in `src/codec/` | Git blob |
|---|---|
| `cbor-string-write.lisp` | `a2c5c77dd51bff760bff4508e998d94370921eda` |
| `cbor-write.lisp` | `61f0d6e2783e4790ed7e19a45bba6407d6e5b3de` |
| `cbor-space.lisp` | `a8330e50a77b52a6b9044ebbb48f62bb4b3222a3` |
| `cbor-scan-input.lisp` | `57ffc48cc688a4de8ebec5cb14c1e69c4209704a` |
| `cbor-scan.lisp` | `e3d7d77407046338d23e26eb0b8a2e8fdc3d699d` |
| `cbor-scan-minimal.lisp` | `f1afe79c7a4d49abd6a6e5f6975dec830ef7b1f6` |

The product author had already corrected, before campaigns, guard
`COUNT <= LENGTH(ITEM-ENDS) <= 16MiB`: it incorrectly also limited the
table's ignored tail. Lines 46–49 of `cbor-array-write.lisp`
check COUNT separately against length and limit;
no new limit is imposed on the tail. The original, blob
`b3135c8768199c23d58721ba528154461fdbda1e`, and finding note remain
in preparatory evidence `spikes/out/cbor-array-write-20261013/precompile/`.
This reading concerns the corrected version identified above.

<a id="dimensioni-percorsi-e-guardie"></a>

## Sizes, paths, and guards

Lines from DEFUN through closing form inclusive, with docstrings and declarations.
Path count: base one; one increment per WHEN/UNLESS and LOOP;
one increment per AND/OR operand after the first. Chained numeric
comparisons are Lisp predicates and inventoried
separately. The count is not an SB-COVER coverage measurement.

| Function | File | Lines | Paths |
|---|---|---:|---:|
| `check-tabella-array-cbor` | input | 9–19: 11 | 7 |
| `check-spazio-array-cbor` | input | 24–34: 11 | 5 |
| `dimensioni-array-cbor` | input | 39–54: 16 | 4 |
| `check-overlap-array-cbor` | input | 59–70: 12 | 7 |
| `check-fini-array-cbor` | input | 75–93: 19 | 7 |
| `check-radice-array-cbor` | input | 97–105: 9 | 3 |
| `check-input-array-cbor` | input | 110–131: 22 | 3 |
| `verifica-figlio-array-cbor` | write | 10–32: 23 | 7 |
| `verifica-figli-array-cbor` | write | 38–64: 27 | 8 |
| `scrivi-array-cbor-minimo` | write | 70–105: 36 | 6 |

All functions remain within COD-12/COD-13, have complete FTYPEs,
pre/post/error docstrings, and REQ references. Both files declare
`safety 3`. There are no new COND/CASE forms to which COD-15 applies.
The inventory contains 36 WHEN/UNLESS sites, two LOOPs, five AND/OR forms
with 14 operands, and eight chained comparisons; no AND/OR is nested.

COD-24: table, space, size, and root validators have at least
two meaningful domain checks; normal exit establishes those
properties without producing unverified derived data. These checks
signal public errors and are not all `invariant-violation`.
Overlap and ends add internal guards on physical bounds and budgets;
preflight compares spans and capacities returned by helpers. Scanning
checks actual ranges, progress, nodes, and depth;
the writer compares aggregate results, cursor after header,
copy length, and final cursor. These are relations among values and
boundaries beyond INDEX/U32 types alone. Guards are
always active and do not modify data; internal errors must reach
the Serie owner's fail-stop boundary.

<a id="ragionamento-sul-contratto"></a>

## Contract reasoning

The preflight sequence at input lines 116–126 follows all eleven
preregistered phases. Only the first COUNT entries are read, at phase 9;
no payload byte is parsed and scratch remains intact until
scanning. SPAN is checked against MAX-BYTES before addition and
U32 cast; COUNT is already bounded by SPAN. Capacity uses END-START,
not physical destination length. Overlap uses the complete
`[START,NEXT)`, including header, before reading entries.

The table forms a strictly increasing partition ending at
SPAN. Thus `SOURCE-START + ITEM-ENDS[i]` does not exceed SOURCE-END and every
segment is nonempty. Minimum `1+COUNT` precedes parsing. Nodes and peak
start at one for the root; remaining nodes are checked before the
next reset. Remainder one is passed to the scanner; remainder zero generates
`:cbor-array-node-budget` at the next child's absolute start.
MAX-DEPTH is at least one before subtraction; the scanner counts only
arrays/maps and the writer adds the root level. Tags add
nodes without adding container levels.

All children are verified before first emission, write line 96.
MT4 header and shared copy preserve exact wire bytes:
they add no map ordering, deduplication, tag semantics, or
NaN policies. Existing forward copy is usable because
preflight proved disjointness including the header; its internal
`:cbor-string-copy-*` reasons remain applicable. With zero COUNT both
LOOPs are skipped, the scanner is not called, and all scratch
remains intact. On nonempty success, scratch describes the last child,
while aggregate sums remain local.

<a id="checklist-c1-a-dodici-punti"></a>

## Twelve-point C1 checklist

1. **Requirements and ADRs.** REQ-CBR-005, REQ-LIM-001/002, and REQ-AFF-004/008
   are listed and consistent with ADR-0014/0033/0035/0048. The minimal local
   profile remains distinct from higher document rules.
2. **Invariants and planned tests.** INV-F1: cold header, literal payload,
   one NEXT, full arrays, and sentinels. INV-A8: exact byte limits,
   root/nodes/tags, and child depth 99/100. INV-P6: stable source/table
   and private destinations/scratch in two reused workers. Rejection
   tests compare all arrays; preflight also compares
   already dirty scratch. Test presence does not equal PASS.
3. **Errors.** Public types and reasons are distinct and propagated without
   catches: INVALID-ARGUMENT, RESOURCE-EXHAUSTED, and scanner
   CORRUPTION-DETECTED. Corpus contains precedence, NIL/absolute offsets,
   trailing data, nonminimal forms, truncation, UTF-8, and reuse after error. Internal
   reasons are inventoried; no negative runtime test is assumed
   for every guard made unreachable by the public domain.
4. **Loops and waits.** Two new LOOPs bounded by COUNT<=SPAN<=16MiB;
   copy bounded by SPAN, scanner and scratch fixed at 102 frames. No
   recursion, waits, I/O, or new threads. Declared cost
   `O(SPAN + COUNT*102)`, without an exact operation count.
5. **Allocations.** COD-30 measurement remains to be run with the six fixtures,
   zero baseline, and preregistered positive control. Reading
   forms and types does not demonstrate zero heap, even at boundaries.
6. **Verified data.** External values are validated before casts,
   table access, reset, and writing. No AST or
   buffer reference leaves the module: the public result is NEXT.
7. **Compound decisions.** The inventory connects all conditions to
   planned witnesses and includes guards and chained relations. Raw coverage
   and condition-by-condition verification remain to be produced;
   no denominator exclusion or MC/DC attestation.
8. **Ownership.** OWNER/SHARED declare exclusive destination and scratch,
   stable source and table. All three scratch aliases are rejected
   even for an empty array. No new mutable global state.
9. **Traceability and checks.** Export, product/corpus ASDF order, RUN,
   requirement, and updated matrix are statically consistent. Coverage
   scope identifies exactly the two new files and the codec group
   includes array RUN. `make check` and self-tests remain to be run.
10. **Rules and deviations.** No further static deviation required
    for the blobs read; the COUNT guard was corrected before
    campaigns. Compilation, measurements, and coverage are not anticipated.
11. **Parallelism.** Product introduces no locks, waits, or shared
    per-operation writes. Preregistered tests use two real
    workers, two waves, and 8192 compositions on private resources; future
    results will not demonstrate scaling or simultaneous execution on cores.
12. **Durability.** No publication, durable change, or deletion.
    Public errors precede writing; internal faults after
    emission are fail-stop without rollback, as declared.

First-reading outcome: no further static defect detected in the
two identified blobs. A distinct second reading,
preregistered campaigns, and checks required by the C1 gate remain necessary.
