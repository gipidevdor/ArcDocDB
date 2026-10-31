<a id="seconda-lettura-c1-dellordinamento-radix-integrato"></a>

# Second C1 reading of integrated radix sorting

Independent reading on 2026-10-09 by agent
`/root/scan_audit` of integrated DECISION sorting and the concurrent-reader
test. Inspection outcome: no functional defect
identified in the sources delimited below. This is an automated reading of
verifiable files, not human approval or release qualification.

<a id="versione-e-ambito"></a>

## Version and scope

Hashes are SHA256 of content read, not Git identifiers.

| File | SHA256 |
|---|---|
| [`src/recovery/decisions-radix.lisp`](../../src/recovery/decisions-radix.lisp) | `564becba75721f15317b260b9a949eba716e682a9062c4e009d5463040c21e54` |
| [`src/recovery/decisions-build.lisp`](../../src/recovery/decisions-build.lisp), two integrated calls | `be292ec655087a229a1630179876da9e302a6121985ec3141a5e35226885a115` |
| [`tests/recovery/decisions-radix.lisp`](../../tests/recovery/decisions-radix.lisp), final freeze | `75296b2de5620afd4f67117445197cb227adb4b9f65203e299ef6a4ee79518c0` |
| [`src/recovery/decisions-sort.lisp`](../../src/recovery/decisions-sort.lisp), baseline and delegated checks | `cfb4d0c6e02bb0253cff992b4ab0f9664c18b9054ee334d541e69931ff0876a2` |
| [`src/recovery/decisions-query.lisp`](../../src/recovery/decisions-query.lisp), existing queries reread | `08196938136a920e5e1cc84838726f721d1f43b59f1f677fac10871574171e24` |

Table types, builder, and fixtures were also consulted to
check ownership, offset provenance, and count bounds.
This reading includes the builder connection; it does not requalify
all recovery. The diff from preliminary candidate SHA256
`5093e1dda2876d3b31fd5a6e9196dc76bec04aa8a61ce933c63de59f73f36505`
changes the header and adds two constants and two `if` wrappers at the end
of the file; sorting bodies match exactly. Restoring
only the two builder calls yields the prior SHA256
`1bfedd82822ac47e17dcfa1ccf185bb48125d316daa3423cc501a2e0e624b3fb`.
The preliminary test version was SHA256
`81d22bb4c5ac5375cf0daaa7443011b15a9563007151dd29d91dbfbbdfe9b915`;
the freeze above adds guards and public regressions.

Frozen radix source and tests match by hash the final copy
`arcdocdb-radix-final-pen8ap8t`. That copy starts from baseline
`10576a0` plus radix module additions; the root ASD contains
ongoing runtime work from other chats. Clone evidence
attests neither to that work nor to its integration into root. No
ASD, source, or test is modified by this review.

The [decision and guard inventory](decisioni-radix-decisioni.md)
lists predicate clauses, test cases, and limits of
defensive rationales. The [measurement method](decisioni-radix-metodo.md)
is separate from this reading.

<a id="controlli-sullordinamento"></a>

## Sorting checks

| Subject | Second reading observation |
|---|---|
| Unsigned order | u64 TXID sorted with eight digits from least to most significant. No sign-bit rotation; zero, high bit, and maximum are ordinary values. ID16 sorted lexicographically with sixteen passes from byte 15 to byte 0. |
| Histogram and sums | Each pass counts the entire current source. u64 cells; total `index`. Guard `frequency <= N - total` precedes increment and final sum must be N. Exclusive prefixes computed only after this check. |
| Uniformity | Zero or one occupied bucket returns false. Caller performs neither scatter nor swap; no uninitialized scratch is read as source. Uniformity is not deduced from samples. |
| Stability | Scatter in increasing source order with increasing bucket cursor. Equal TXIDs preserve physical order; the initial group reference is not replaced by CSN or other keys. |
| Array bounds | Exact ID16 size, scratch of same length and distinct identity before writes. Digit bounded to 16/8 and position below cardinality before cast to `index`. |
| Cursors after scatter | Monotonicity, bound N, and final endpoint exactly N. Each bucket's exact frequency follows from validated prefix and increment for every element; it is not compared with a separate frequency copy after scatter. |
| Result and corruption | Returns current buffer, including after an odd number of effective passes. Final TXID order check; final ID16 check retains typed duplicate error and record offset. Builder preserves all-or-nothing coalescing after sorting and returns no table on error. |
| Ownership | Initial source and scratch private to construction; sorter may reorder initial copy. Scatter does not modify the individual pass's source. Entries are references to private structures, without field writes. No original buffer is exported. |
| Resources and control flow | No recursion. Digit loops bounded to 8/16; histogram and cursors to 256; scan/scatter to actual cardinality. Workspace sized to actual size plus 256 cells, not unused budget capacity. |
| Effects | No I/O, wait, publication, lock, or mutable global state. File declares OWNER/SHARED; allocations permitted on opening path. `safety 3`, `ftype`, docstrings, and REQ references present. |
| Selection | `count < 1024` selects merge for ID16; `length(entries) < 256` selects merge for TXID. At and above threshold, radix selected. Simple IFs, without sampling or new error handling paths. |
| Builder sequence | `decode-decisions` passes private copies to ID16 wrapper; builder sorts entries with TXID wrapper before collapse. Scanner, budgets, and preflights remain before copies. TXID threshold concerns physical duplicates before coalescing. |

The LSD principle with stable passes and bucket counting is described
in the [primary Princeton reference](https://www.cs.princeton.edu/courses/archive/fall07/cos226/lectures/18RadixSort.pdf).
Application to unsigned u64, skipping uniform passes, and the buffer
argument are checks of the local adaptation, not performance
guarantees drawn from the reference.

<a id="controlli-sui-test"></a>

## Test checks

The ID16 oracle converts all 128 bits to big-endian integers, sorts with
`CL:STABLE-SORT`, and reconstructs every octet. The entry oracle
sorts a copy only by TXID and compares every reference with
`eq`; stability is not deduced from numeric order alone. Both
sorters receive separate fixture copies.

The test version identified above includes cardinality 0/1 for
private functions, odd cardinalities and maximum u16 for ID16, three
deterministic patterns, each of the 128 ID bits and 64 TXID bits
in both orders, size errors, and duplicate participant
offsets. The 65,536-entry case, uniform and with a dominant bucket plus
outlier, fills the gap identified in first inspection: frequency or
cursor beyond u16 becomes observable. These private
cases do not establish validity of a public DECISION with fewer than two
participants.

The final freeze contains 18 tests: nine initial, six private-guard
tests, and three public regressions. Guards are deliberately negated
for sums and consumption, entry type, out-of-range digit,
every clause of both array guards, out-of-bound cursors, and
final decreasing/incomplete cursors. Typed rejections before
writes where required, unchanged sources, and postscatter
checks for overlapping prefixes are verified. The u64 cardinality
bound and sorter's final order postcondition remain distinct.

Public regressions test ID16 1,023/1,024/1,025 and entries
255/256/257, in versions 1/2 with an independent oracle. The same
entry counts are tested both with distinct TXIDs and consistent physical
duplicates that become one TXID. Global conflict uses
258 records in three batches: the maximum TXID group has the first
physical conflict, the zero group the next. The API must report
the former's offset, not that of the first numerically visited group.
Two attempts and unchanged buffer are checked.

The concurrent test constructs a complete table and overwrites the
original log before creating six real threads. Closures share
the table and unchanged declarative probes; every thread owns distinct
ID buffers, positions, and output. Results explicitly include
found, CSN, count, and membership, so CSN zero is not confused with
absence. Zero/maximum TXID, gaps, and cardinalities 3/5/17 are present.

Ready and release coordinate the fixture with timeouts; the worker returns
a condition on error. Joins have timeouts and failure
defaults; the test accepts only `t` returns, checks terminated
threads, and compares all outputs with the oracle. Cleanup
releases and waits for created threads without suppressing the setup
error. Waits belong to the harness and do not enter the query or
an engine compute worker. Queries remain scalar, without
shared per-operation writes.

The isolated strict baseline from agent `/root/review_changes`
reported exit 0 and no warnings, with 43 selected DECISION tests
(25 existing plus the 18 above). The end of log
`arcdocdb-radix-test-corrected-kbi2xy7r/baseline/test.log` was read; it contains
`decision-tests-complete 43`. This reading does not repeat the build.

<a id="selezione-misurata-riletta"></a>

## Rereading measured selection

Records
`spikes/results/2026-10-09-radix/benchmark-100ms-dati.lisp` and
`spikes/results/2026-10-09-radix/selezione-100ms.lisp` were read as data
in the final copy, without running the driver. The [method](decisioni-radix-metodo.md)
retains the first matrix and amendment before repetition: calibration target
100 ms, minimum per sample 50 ms, same median-ratio criterion
of at most 0.9, and the same complete matrix.

| Scope | Adopted threshold | Scenarios measured at and above threshold | Worst radix/merge median ratio among these scenarios |
|---|---|---|---|
| ID16 | 1,024 participants | 16, all usable and meeting criterion | `0.857956293237167` |
| TXID | 256 physical entries | 25, all usable and meeting criterion | `0.759877353704754` |

The record retains 63 scenarios, 58 usable. The five unusable
scenarios are entries of cardinality 16 in ordered, reverse,
mixed, duplicates, and uniform patterns: calibration does not reach target
before the limit and these scenarios do not enter the criterion. It is not
claimed that all 63 scenarios are qualified. All 41 scenarios
at and above adopted thresholds are usable and pass the criterion.

Selection is local to the measured environment and tested
distributions. The all-variable-byte ID16 pattern has correlated
halves; it does not represent uniform sampling of all 128 bits.
Measurement includes sorting scratch and GC, retains heap
data, and does not demonstrate zero heap. It is not extrapolated to unmeasured
cardinalities, Linux/x86-64, engine throughput, or P99.

<a id="copertura-grezza-e-guardie-residue"></a>

## Raw coverage and remaining guards

Raw coverage state
`spikes/out/decisions-radix-coverage-final/` in the final copy was read as data.
Counts recalculated and compared with inventory are:

| Scope | Observed/total expressions | Observed/total branch alternatives |
|---|---|---|
| Six DECISION sources | 1,332 / 1,530 | 138 / 176 |
| Only `decisions-radix.lisp` | 384 / 409 | 53 / 54 |

The 25 missing radix expressions are 16 top-level forms
(package, optimize policy, constants, deftype, and declaim), one histogram
type subform, and eight error forms at two sites: four for
non-u64 cardinality and four for incorrect final entry order.
The only missing alternative is negation of
`typep(length(source), u64)`, RAD-G06. The fixnum `index` bound and
array bounds of the SBCL runtime used are tighter than u64:
length cannot violate this check. RAD-G17 remains a
defensive postcondition against an algorithm defect; its error
forms are absent in measurement, without an additional
missing branch alternative associated with `loop`.

Private tests instead exercise prefix, digit, array,
entry-type, and cursor negations, as recorded in inventory. Remaining forms
stay in the raw denominator. No approved exclusion
or MC/DC attestation follows from these numbers. This inventory concerns
the new radix source. Rationales for residual gaps in the other five
sources are in the [existing inventory](../affidabilita/copertura-eccezioni.md),
to compare against new measurement: tests now cover count and size
in `check-entry-shape` and size in `sort-participants`, three
previously unobserved alternatives. The previous 40 missing alternatives
become 37; with the new radix alternative there are 38 of 176.

Root communicated a final campaign with 14 detected mutants,
zero survivors, and zero compilation or pre-test faults.
This reading neither executes the campaign nor individually reexamines
all its logs: the mutation report is separate evidence.

<a id="lista-di-controllo-c1-e-limiti"></a>

## C1 checklist and limitations

The reading uses the [coding standard](../affidabilita/standard-di-codifica.md)
and [verification plan](../affidabilita/piano-di-verifica.md). Requirements
referenced by source are local contributions to REQ-TXM-005,
REQ-TXM-001, and REQ-AFF-008; REQ-VAL-001 identifies test traceability;
both constants also reference REQ-BEN-001 for measured
selection. The concurrent test contributes to REQ-CON-005 without completing
parallel runtime implementation.

| C1 checklist item | Bounded status |
|---|---|
| Requirements and ADRs | Local consistency with table sorting and resource bounds; ADR-0035 verification strategy and ADR-0034 standard. No persistent format or 2PC protocol change. |
| Invariants and tests | Sums/prefixes, stability, unsigned order, private copy, and sizes analyzed; independent oracles, beyond-u16 case, guard negations, and public boundaries present. Raw coverage distinct from condition coverage. |
| Errors | Local guards signal `invariant-violation`; delegated check retains `corruption-detected` with duplicate-ID offset. Type errors remain those of the safety 3 contract. FAULTED transition belongs to recovery caller and is not implemented by sorter. |
| Loops and waits | Explicit bounds checked for all sorting loops. Finite test waits; no wait in product. |
| Hot-path allocation | Sorting occurs at opening and allocates scratch/histogram. Benchmark read records heap without claiming zero heap; no extension to queries on target runtime. |
| Validated data | Private contract requires validated copies and entries; shape and final-order checks retained. Wrappers do not replace scanner/preflight or decide presumed abort. |
| Compound decisions | Two new array guards inventoried clause by clause; existing query decision and fixture checks made explicit separately. No MC/DC attestation. |
| Owner and sharing | Construction-exclusive scratch; complete read-only table; exclusive reader buffers/outputs. Publication through future runtime not proved by test. |
| Trace, compilation, lint, and checks | References and diff inspected; end of isolated baseline read. This reading does not execute commands or extend that outcome to root ASD being modified. Final outcomes remain in dedicated records. |
| Deviations | No exception requested by inspection; no coverage exclusion approved here. |
| Parallelism across Serie | No new lock, wait, or shared store per query; no per-request pool. Test does not demonstrate engine isolation or scalability under INV-P6. |
| Atomicity and removals | No persistent write, flush, removal, or new atomicity point in sorting or wrappers. Existing durability contracts not requalified. |

This second reading does not run the suite; it distinguishes executable
records from the inspection conclusion. Adopted merge/radix
selection was compared against second-matrix data.
Uniform passes save
scatter but retain histogram scanning and checking; even private radix
0/1 input allocates workspace and traverses digits. The
wrapper uses merge below threshold; neither algorithm is selected solely
on asymptotic complexity.

Real threads do not constitute exhaustive interleaving
exploration, a deterministic simulator, or a scalability measurement. The test
does not qualify the runtime's reusable pool, publication through
catalog, P99, Linux/x86-64, durability, or application of prepared records.

Integration and frozen tests are reread in this addendum.
Final coverage, mutants, compilation, lint, and overall check
must link to their respective records on the same hashes.
Any further changes require a new diff reading;
the present conclusion remains tied only to hashes above.

<a id="prima-lettura-c1-dellautore-sul-candidato-preliminare"></a>

## Author's first C1 reading of the preliminary candidate

The following historical reading precedes wrapper integration.
The [author's final reading](decisioni-radix-lettura-autore.md)
identifies integrated hashes; the independent addendum above uses those
same sources and frozen tests.

Reading on 2026-10-09 by agent `/root/segment_header_code`, candidate
author. It is distinct from the independent second reading preserved
above. Reread source has SHA256
`5093e1dda2876d3b31fd5a6e9196dc76bec04aa8a61ce933c63de59f73f36505`;
reread tests have SHA256
`81d22bb4c5ac5375cf0daaa7443011b15a9563007151dd29d91dbfbbdfe9b915`.
Both hashes were rechecked on preliminary-version files. Outcome:
no functional defect identified within the private candidate's scope.

The list follows the twelve items in the
[coding standard](../affidabilita/standard-di-codifica.md).
Test names in the table are those of the
[independent tests](../../tests/recovery/decisions-radix.lisp).
Inspection does not run verification processes during the measurement
campaign or anticipate its outcome or threshold selection.

| C1 item | Author's concrete observation and limitation |
|---|---|
| 1. Requirements and ADRs | All eight functions list REQ-TXM-005, REQ-AFF-008, and REQ-VAL-001; entry operations also reference REQ-TXM-001. Stability preserves physical identity for equal TXIDs without introducing CSN, positivity, or monotonicity constraints. Local consistency with ADR-0034/0035 and table contract; no format or 2PC change. |
| 2. Invariants and tests | `radix-prefix-starts` checks sum within N and exactly N; scatters check ranges and capacities before stores; `radix-check-cursors` checks monotonicity and endpoint N. `radix-entry-cardinalities-patterns-and-stability` compares every reference with oracle and equal-TXID offsets; `radix-entry-65536-bucket-counts` makes counts beyond u16 observable. Public regression for first physical conflict remains necessary on integrated builder. |
| 3. Errors and handling | Local guards signal `invariant-violation`; `check-participant-order` retains `corruption-detected :decision-duplicate-participant` and record offset. Tests `radix-participant-shape-before-sort`, `radix-entry-shape-before-sort`, and `radix-duplicate-participant-offset` check sizes, count, and offset, including maximum u64. Types and allocations also retain runtime conditions; sorter does not handle Serie FAULTED lifecycle. Coverage of every defensive guard is not claimed. |
| 4. Loops and waits | No recursion or waiting in candidate: 16/8 digits, 256 buckets, and N actual elements for counting and scatter. Uniform skip follows full counting and does not rotate buffers. Tests for each bit, odd cardinalities, and uniform patterns exercise boundaries; six-reader timeouts belong only to harness. |
| 5. Allocations and hot path | Scratch of actual length and 256 u64 cells allocated at construction/opening, even for private 0/1 input. u64 operations can also allocate in runtime. Candidate is not a hot path and does not prove zero heap; concurrent-reading tests do not measure allocations or collector pauses. |
| 6. Validated data | Participant size precedes scratch; entries checked for type, count, and length before reading TXID. Order and, for ID16, distinctness checked before return. Contract requires private copies already decoded by builder: scanner, CRC, payload preflight, and budgets are not replaced. Count 0/1 in private tests does not make public DECISION records with fewer than two participants valid. |
| 7. Compound decisions | Both array guards listed clause by clause as RAD-D01 and RAD-D02 in the [inventory](decisioni-radix-decisioni.md), with 17 local error sites and delegated checks. Unexercised private negations remain in subsequent measurement denominators; this reading neither certifies MC/DC nor approves exclusions. |
| 8. Owner and sharing | OWNER/SHARED declare one construction. Initial source and scratch are private and may be reordered; scatter leaves the individual pass's source unchanged and does not write read-only entry fields. `concurrent-immutable-table-queries` overwrites log before threads, uses separate buffers and outputs, and rechecks table after joins. It does not prove publication through future runtime. |
| 9. Trace, compilation, lint, and checks | Before campaign, author compiled candidate in isolated copy without warnings/style-warnings, obtained lint on 8 files with no violations, and passed 1,290 comparisons with merge, plus duplicate with maximum offset. This test uses baseline; independent oracles are in tests reread here. `ftype`, array types, `safety 3`, docstrings, REQ, and functions within 60 lines present. `make check`, trace, coverage, and mutants for adopted diff require final evidence. |
| 10. Deviations | No exception identified in scope read. Allocations explicitly permitted at opening and are not an exception to hot-path requirements. Guards and bounds checks remain active; no performance promise or coverage exclusion granted by review. |
| 11. Parallelism across Serie | Candidate adds no lock, wait, pool, or shared store per Serie operation: it changes only workspace owned during recovery. Existing queries read immutable table; six workers own their outputs. Test does not demonstrate scalability, Serie isolation, scheduler, or full engine compliance with INV-P6. |
| 12. Atomicity and removals | No I/O, flush, publication, prepared application, deletion, or durable change in candidate. No new atomicity point to declare; scanner durability and recovery contracts remain external to this change and are not requalified. |

This first reading concerns the frozen candidate, not yet
reached by the public builder. Final review must identify
selected algorithms and thresholds, reread the actual integrated diff, and
link public regressions to the same verified content.
It does not qualify parallel runtime, complete engine,
P99, zero heap, durability, or Linux/x86-64.
