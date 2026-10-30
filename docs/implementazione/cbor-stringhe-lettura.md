<a id="scrittura-delle-stringhe-cbor--seconda-lettura-c1"></a>

# Writing CBOR strings — second C1 reading

The subsequent [data reading](cbor-stringhe-dati.md) compares this
static reading with runtime records, without changing product or tests.

Static reading by the blind-corpus lead, on 2026-10-11, after
test freeze and before campaigns. Base
`2a0011f9d2bef104b22f7ad1eb86d7e5d60d5e11`; product examined
`src/codec/cbor-string-write.lisp`, Git blob
`a2c5c77dd51bff760bff4508e998d94370921eda`.
The [preregistered contract](cbor-stringhe-metodo.md) retains blob
`56342dae95caf8705e0b28b3c0ea7ac86fdd8fa0`.
The [first reading](cbor-stringhe-revisione.md) and [inventory](cbor-stringhe-decisioni.md)
are separate artifacts; this reading changes neither product nor tests.

No functional defect or open static finding identified in the examined
blobs. Build, corpus results, heap, observed concurrency,
coverage, and mutations are still pending. This outcome does not close
C1 gates, certify MC/DC or full coverage, or qualify the engine.

<a id="checklist-c1"></a>

## C1 checklist

| Point | Static finding and verification still needed |
|---|---|
| 1. Requirements and ADRs | REQ-CBR-002 from ADR-0014/0048, AFF-004/008, and local limit LIM-002 are consistent with one minimal definite-length MT2/3 item. The budget includes header and payload; it does not implement document composition, Serie configuration, or text normalization. |
| 2. Invariants | Exclusive simple u8 destination, stable source, half-open ranges, complete budget, and disjoint footprint precede every mutation. Guards check span, selection, copy boundaries, and final cursors. Frozen tests falsify public violations through whole arrays and sentinels; runtime outcomes remain to be recorded. |
| 3. Errors | Conforming order: destination → major → source → budget type/limit → payload budget → item budget → capacity → overlap → UTF-8. Reasons match the method; preflight offsets are NIL via condition initform. UTF-8 propagates class, reason, and absolute source offset. Every public rejection precedes the header; internal guards after write remain without rollback, with owner fail-stop. |
| 4. Limits | The copy repeats exactly SPAN steps, with SPAN≤16 MiB checked and equal to destination length. MT3 calls the validator with budget SPAN; that loop is bounded too. No recursion, waits, retries, or worker creation in the product. |
| 5. Heap | New success path uses cursors, multiple values, and direct calls, without constructors, closures, ASTs, or u64 objects. Values are index/u32, bounded before use. NTH-VALUE, the UTF-8 keyword call, and arithmetic must still be measured with null baseline and positive sensor: zero heap is not certified by reading. |
| 6. Verified data | MT2 copies arbitrary bytes; MT3 verifies all UTF-8 before the first write, without recounting length in scalars. Header and copy receive already checked ranges and sizes. The wrapper checks UTF-8 count, header end, and final NEXT; it returns one value. |
| 7. Compound decisions | The inventory includes all five AND forms and six chained relations; no OR forms. Internal guards remain in the coverage denominator even when the public contract cannot falsify them. Inventory witnesses are plans, without dynamic certification of condition independence or MC/DC. |
| 8. Owner | Explicit OWNER/SHARED: caller destination, source bytes stable until return, local variables. Simple arrays do not share backing storage through displacement in the allowed domain: EQ identifies the intended alias. The same array is allowed only disjoint from the actual footprint; empty and touching boundaries are allowed. |
| 9. Integration | Public export present; serial ASDF loads the product after UTF-8, limits, and header writer, then the three corpus files and their RUN. Existing CBOR suites, MVCC, workers, and index remain in the runner. REQ-CBR-002 is in the catalog; strict build, matrix regeneration/verification, and full MAKE CHECK remain pending. |
| 10. Standard | Complete FTYPEs, safety3, Pre/Post/error docstrings, REQs, and active guards present. Five functions within 60 lines and ten paths under the count stated below. No static exception proposed; lint and warning/style-warning-free compilation not run during this reading. |
| 11. Parallelism | The product introduces no locks, waits, counters, or shared writes across Serie. The corpus uses two private destinations and one shared immutable source, with reused workers and bounded waits/joins/cleanup. Temporal overlap must be observed in the campaign; it does not demonstrate simultaneous core execution or scaling. |
| 12. Durability | Mutation concerns caller-exclusive memory; no I/O, commit point, deletion, or durable publication. It is not an atomic operation and promises no rollback of invariant-violation. The fail-stop boundary remains outside the codec. |

<a id="preflight-aritmetica-e-copia"></a>

## Preflight, arithmetic, and copying

The `SPAN > BUDGET` rejection occurs before casting payload to u32 and
before header selection: the already validated budget bounds SPAN to
16,777,216. The header is selected based on source bytes, with HIGH
zero; the item check prevents payload and header from exceeding the
budget. The maximum acceptable payload with the default is therefore
16,777,211 bytes, followed by a five-byte header.

Capacity uses END−START, not physical buffer length. Only
after the check is NEXT calculated: ITEM-SIZE≤END−START implies NEXT≤END,
and NEXT remains an index. PAYLOAD-START is compared with
START+HEADER-SIZE; copying checks ranges, equal lengths,
and progress, then ends exactly at NEXT. The public result is
the single final numeric value.

Overlap uses strict inequalities on source ranges and `[START,NEXT)`,
header included. The remainder `[NEXT,END)` does not extend the footprint. An
empty source intersects no byte; touching intervals
remain disjoint. In the allowed same-array case, UTF-8 verification
precedes the header and copying stays disjoint from the stable source.
With an empty source, only the header is written, without reading source
bytes. On public rejection no array has yet been modified.

<a id="dimensione-e-inventario"></a>

## Size and inventory

Syntactic count: initial one, one increment per flow-control construct,
per additional AND/OR condition, and per LOOP; excludes
expansion of type checks or primitive comparisons. Comparison
with source confirms the numbers in the first reading and inventory.

| Function | Inclusive DEFUN lines | Paths |
|---|---:|---:|
| `check-span-string-cbor-write` (10–21) | 12 | 6 |
| `check-input-string-cbor-write` (27–53) | 27 | 8 |
| `check-overlap-string-cbor-write` (58–70) | 13 | 7 |
| `copia-stringa-cbor-write` (75–93) | 19 | 8 |
| `scrivi-stringa-cbor-minima` (98–129) | 32 | 5 |

The five logical AND decisions are range, budget, overlap, copy limit,
and copy progress. The six three-operand `<=` relations are
public range, selection, two overlap ranges, and two copy ranges.
The public range relation is already inside its AND decision:
counting it once gives five logical decisions and five independent
chained relations. This syntactic inventory is neither a
coverage measurement nor proof of MC/DC.

<a id="provenienza-e-corpus-congelato"></a>

## Provenance and frozen corpus

The following three files were written from the method and existing
dependencies/oracles, without reading `cbor-string-write.lisp`. This product
reading began only after they were frozen. Hashes were
rechecked and match those communicated to the coordinator.

| Blind file | Git blob | SHA-256 |
|---|---|---|
| `tests/codec/cbor-string-write-support.lisp` | `e45437a508fc7893c4df06f3129ab064d3a4dbdd` | `611ec1d825855d9df27988821ee45f0ecf81fbd3128a38df6ee5c727551cd9f2` |
| `tests/codec/cbor-string-write.lisp` | `ed0f6a67c46498bdc9c721480cb76bc727fc5b4f` | `ea9cc94d8e810942da019aade862711cbdf33216161433fef6953f75472a2115` |
| `tests/codec/cbor-string-write-threads.lisp` | `33c7e6a9a0d6bbd551d4171ece6681b66bf87657` | `d45b4dda658a96b9af9051b152df2b17859aecdbb9131505d1a2689b27ffb88a` |

Expected header uses division/modulo and powers of 256, also compared
with independent literal vectors. Expected payload derives from source
before the call; success compares the entire destination, a single
NEXT fixnum, and preservation of the disjoint source. Errors
compare both physical arrays, even for non-simple arguments.
No product encoder or scanner generates expected values.

The twenty serial tests plan:

- 8,194 comparisons of all lengths 0..4096 for MT2/3; thresholds and
  adjacent values through 65,537 bytes, misalignment, and exact capacity up to
  the array's physical end.
- 2,048 cases with seed `53574342`, arbitrary payloads or scalars encoded
  by the existing cold oracle, and UTF-8 classification from the
  manual `cs-ref-utf8` model, separate from the product validator.
- 1,138 insufficient capacities, with physical suffix available but excluded
  by END; budget including header, empty item, maximum 16 MiB,
  maximum item+1 and maximum payload+1, with multi-invalid precedence.
- MT2 bytes 0..255, NUL/BOM/noncharacters and multibyte scalars for MT3,
  composed/decomposed text preserved, aliases in both orders, empty/touching cases,
  actual footprint, and header-only overlap.
- Twenty malformed UTF-8 sequences at three source offsets: class, reason,
  absolute offset, and truncation/continuation/scalar precedence;
  each also accepted as MT2. Reuse after errors and concatenation.

The minimal-scanner check is supplementary: for each major,
it occurs only after complete comparison with cold expected bytes,
also checking all three scanner return values.

The twenty-first test plans two reused workers for two waves of 8,192
items each, 32,768 items overall. The shared source has 1,024 bytes
with NUL and multibyte scalars; each worker owns a separate
destination. Expected values and sink tokens are prepared before startup;
every call checks arity, NEXT, and the entire destination. The sink sums
NEXT, header bytes, and last payload byte actually observed.
The parent checks intact source, sink, intervals, and joins; semaphores
within 15 seconds, joins within 20 seconds, and cleanup with termination
verification. Worker or item count is not a scaling
result; all outcomes remain to be observed.

<a id="lettura-sintattica-e-verifiche-pendenti"></a>

## Syntactic reading and pending verification

An isolated repetition of only syntactic reading is preserved:
[helper](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-cbor-string-write/raw/setup/cbor-string-write-static-reader.lisp) and
[log](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-cbor-string-write/raw/setup/cbor-string-write-static-reader.log). It uses placeholder
packages and `*read-eval* NIL`; it evaluates, compiles, or loads no product
or corpus form. Helper fixtures check valid syntax,
a missing parenthesis, and blocked read-eval. The reader records PASS
with 12 product forms and 14/21/2 forms in the three blind files. This is a
syntax check, distinct from preregistered runtime campaigns.

Dependencies `cbor-write.lisp`, `utf8.lisp`, `cbor-scan-input.lisp`, and the
oracles used are unchanged from the base. Other blobs read:
package `12d573ec29468f1fdae3e674a494d786a390c33e`, ASDF
`e3a98df96d9e7be83e41bfef21a2bf08a59017e8`, inventory
`2df0a214fc5cfe64ceb239aab4f7d2a2d1827305`, first reading
`90bac509af0aff7b7085a2239de6e9dfddfc70ba`.

No build, test call, heap measurement, coverage, or mutation was
performed by the lead for this reading. Recorded campaigns
with stable sources, sensor checks, baseline and eight mutations,
raw coverage without exclusions, and full regressions remain necessary.
Historical dependency qualifications and limits remain those of their
campaigns; this reading does not renew them and is not human approval.
