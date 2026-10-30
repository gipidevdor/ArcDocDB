<a id="scrittura-dei-valori-semplici-cbor--seconda-lettura-c1"></a>

# CBOR simple-value writing — second C1 reading

Static reading by the blind-corpus owner on 2026-10-11, after
test and product freeze, before campaigns. Base
`d155db3f977677fa95280f59c23fbe46a5e116d2`; product examined
`src/codec/cbor-simple-write.lisp`, Git blob
`58c7a3a040ec814fae2dfe636f569b5623cba8f0`.
The [preregistered method](cbor-semplici-metodo.md) retains blob
`e8864f7c0124f86cebdcdbcb2449800e078e1cc8`.
The [decision inventory](cbor-semplici-decisioni.md) is separate from
this reading; another reviewer handles the first reading.

No functional defects or open static findings emerged in the examined
blobs. Compilation, corpus results, heap sensors, observed
concurrency, coverage, and mutations remain pending. The reading does not
close C1 gates, attest MC/DC or full coverage, or qualify
the engine.

<a id="checklist-c1"></a>

## C1 checklist

| Item | Static finding and verification still needed |
|---|---|
| 1. Requirements and ADRs | REQ-CBR-003 from ADR-0014, AFF-004/008, and INV-F1/P6 correspond to a local MT7 wire code. Domain is integer 0..23 or 32..255; 24..31 rejected. No T/NIL conversion, semantics for unassigned codes, floats, or document composition. Document budget remains higher-level under ADR-0048. |
| 2. Invariants | Preflight establishes simple u8, START/END index, order and physical bound, permitted code, and sufficient capacity before write. Three internal guards check span, footprint, and progress. Whole-array corpus comparisons falsify prefix, remainder, and physical-tail changes; runtime outcomes remain to be recorded. |
| 3. Errors | Compliant order: destination/range → value → capacity. Reasons are :cbor-range and :cbor-simple-value for invalid-argument, :cbor-simple-capacity for resource-exhausted. Offset NIL comes from condition initform. All public rejections precede any destination AREF/SETF; internal guards promise no rollback and fail-stop belongs to owner. |
| 4. Limits | Success writes exactly one or two bytes. Product contains no loop, recursion, wait, retry, worker creation, or callback. Capacity uses END−START; physical space after END is unavailable. No global budget applied to local primitive. |
| 5. Heap | Success uses immediate scalars, constant type descriptor, bounded arithmetic, LOGIOR, and VALUES; no constructor, list, buffer, closure, or AST. A static reading does not attest zero heap allocation: benchmark with zero baseline and positive sensor still needed. Error conditions are outside success path to measure. |
| 6. Output | For VALUE<24, E0 has five zero low bits: LOGIOR E0 VALUE equals 224+VALUE. For VALUE≥32 it writes F8 and octet VALUE. Cursor starts at START+1, advances only for second byte, and is compared with NEXT before `(values next)`, which returns one value. Corpus verifies exact arity and fixnum NEXT. |
| 7. Compound decisions | Two checking AND forms: range with four conditions, footprint with two. Relation START≤END≤length(BUFFER) is internal to first AND; TYPEP OR descriptor belongs to domain semantics and is not an executable short-circuit form written in product. Inventory also includes this union. Internal guards and negative branches remain in denominator; no exclusion or MC/DC proof. |
| 8. Owner | OWNER/SHARED declare exclusive destination until return and no state shared between Serie. Product uses only received array, neither retains nor publishes it. Displaced, adjustable, fill-pointer, or non-u8-element arrays are out of domain and rejected. Exclusivity between callers is a precondition, not codec-verifiable property. |
| 9. Integration | Public export present. Serial ASDF loads product after header/string writer and three corpus files after CBOR helpers, then invokes new package RUN. Other CBOR, MVCC, worker, and index suites remain in runner. REQ-CBR-003 is in catalog. Strict build, matrix, lint, and full MAKE CHECK pending. |
| 10. Standard | safety3, complete FTYPEs, Pre/Post/error docstrings, REQ references, and active guards present. Two functions of 14/26 lines and 7/8 paths by count below, within 60/10 limits. No exception proposed. This reading runs no compilation or lint and does not attest absence of warning/style-warning. |
| 11. Parallelism | Product introduces no lock, counter, wait, or shared write. New corpus plans two reused workers with private destinations, immutable cold plans, and separate semaphores per wave; waits, joins, and cleanup bounded. Interval overlap must be observed, without inferring simultaneous execution on cores or scaling. |
| 12. Durability | Mutation only in caller-exclusive memory: no I/O, commit point, deletion, or durable publication. Primitive promises neither atomicity nor rollback of internal guards. Fail-stop transition remains at owner level. |

<a id="aritmetica-preflight-e-footprint"></a>

## Arithmetic, preflight, and footprint

Range AND precedes LENGTH and subtraction: an incorrectly typed buffer or
non-index START/END are not used as destination or indices.
Subtracting ordered indices produces nonnegative SPAN; guard
START+SPAN=END confirms span. VALUE validation also excludes
floats, rationals, complex numbers, symbols, and out-of-domain integers before
u8 cast. Domain contains 24 direct codes and 224 extended codes.

SIZE≤SPAN implies START+SIZE≤END. NEXT is calculated only after this
check, therefore remains index and cannot exceed the already-validated
physical endpoint. CURSOR=START+1 is within NEXT; if SIZE=2, the second write is
at index NEXT−1. Only START and optionally START+1 are
written. Final guard checks CURSOR=NEXT before the single return.
For an empty span, SIZE≥1 produces capacity rejection, after any
VALUE rejection. F8 with code below 32, float, or break is not emitted.

<a id="dimensione-e-inventario"></a>

## Size and inventory

Syntactic count: one initial, one increment per flow check
and per additional control AND/OR condition. It excludes
TYPEP expansions or primitive comparisons. Comparison with source
confirms the coordinator's inventory.

| Function | Inclusive DEFUN lines | Paths |
|---|---:|---:|
| `check-input-simple-cbor-write` (10–23) | 14 | 7 |
| `scrivi-semplice-cbor-minimo` (28–53) | 26 | 8 |

The two AND decisions are at lines 14–15 and 45. The chained comparison
at line 15 is already within the first AND, so it is not a third
independent logical decision. The interval union at line 17 retains both
regions, gap, and endpoints in corpus without counting it as a written control
OR. Inventory remains syntactic/semantic and is not
a dynamic measurement of condition independence.

<a id="provenienza-del-corpus-cieco"></a>

## Blind-corpus provenance

The following three files were written from the method and existing
dependencies, without reading new product. They were frozen and
communicated to the coordinator before the product was written. An
independent read-only review checked fixtures, contract,
visible syntax, counts, and sinks; no reader,
compiler, or test was run. This product reading began only after freeze.
Rechecked hashes remain equal to those communicated.

| Blind file | Git blob | SHA-256 |
|---|---|---|
| `tests/codec/cbor-simple-write-support.lisp` | `10979b4a89af0b00d48abbc7bf6760afc3b5aa9b` | `53ceafc72a027a2ff1f787900558ff26f2ff70bbb212f1b37926a6d520fbe86e` |
| `tests/codec/cbor-simple-write.lisp` | `efaa31b8ea2d74af162fd00a3b4e923ae5f60cdd` | `958bdd3901cfc41032c09d6c9023b192799981884e09ce3573256ff45bc5329a` |
| `tests/codec/cbor-simple-write-threads.lisp` | `a7bee65793fc3a3e0c89c9c73871d7c183669a3e` | `77074033e75a224fd02e890f98dffa8e97d3a1f8bedd510b00ea55d8ff8687b2` |

The oracle calculates 224+VALUE or pair 248/VALUE, also compared with
eight literal vectors 0/19/20/21/22/23/32/255. No expectation comes
from product encoder, reader, or scanner. Every success compares
the entire destination and one fixnum NEXT; every rejection checks type,
reason, NIL offset, and unchanged physical array, including the displaced
destination's entire backing and space beyond fill-pointer.

The fifteen serial tests plan:

- 248 codes × 8 offsets × 3 exact/remaining-capacity and physical-tail
  configurations: 5,952 success comparisons.
- Every capacity from zero to SIZE−1 for all codes and eight offsets:
  3,776 rejections, with physical suffix available but excluded by END.
- All eight reserved values at eight offsets and four capacities: 256 rejections;
  VALUE types/limits, nonsimple destinations, invalid ranges, empty
  spans even at physical endpoint, arity, sentinels, multi-invalid priority.
- Reuse after errors and successes, concatenation of 248 codes in 472 bytes,
  and fixture with START zero/END equal to physical length.
- Fuzz 2,048 cases seed `53494D43`, with deterministic offsets, capacities, and
  physical sentinels: 768 successes, 512 invalid values, 256 insufficient
  capacities, and 512 expected invalid destinations/ranges.
- Minimal reader and scanner on all codes only after cold-byte
  comparison, also checking their six/three values and unchanged
  buffer. These checks are supplementary.

The sixteenth test plans two real reused workers, two waves of 8,192
items per worker, 32,768 calls. Every plan has eight codes, repeated
1,024 times per wave; NEXT, tokens, and all expected bytes are prepared
before startup. Each private destination is restored from
cold sentinels before call, so an omitted write cannot
pass through already-correct bytes. Worker verifies arity, NEXT, and
complete array; sink uses NEXT, first, and last byte actually
observed. Cold sinks are 3,804,160 and 3,836,928 for each wave.
Parent checks unchanged plans and sentinels, final buffer, sink,
intervals, and joins. Waits within 15 seconds, joins within 20 seconds,
bounded cleanup with verified termination. Intervals include
restoration and fixture comparisons; they do not measure only the primitive.

<a id="correzione-separata-del-precedente-harness-parallelo"></a>

## Separate correction to the previous parallel harness

Review of the new corpus found that the preceding string
harness reused GO/DONE across both waves. A fast worker could
consume two permits in different waves before the other entered,
mixing completions observed by the parent. This could produce
false failures or scheduling-dependent timeouts.

After new-test freeze, the coordinator authorized a
minimal semaphore-only correction: distinct READY/GO/DONE per wave,
WAVE-indexed access, and release of both GOs in cleanup. Fixtures,
comparisons, sinks, and quantities in the previous corpus
remained equal. This is not a product change. Previous campaigns
and archives were not rewritten; the corrected protocol must
be verified in new campaigns.

| Previous file | Before blob | After blob |
|---|---|---|
| `tests/codec/cbor-string-write-support.lisp` | `e45437a508fc7893c4df06f3129ab064d3a4dbdd` | `5a7f38de22be659787305441b65c689de4bd6dba` |
| `tests/codec/cbor-string-write-threads.lisp` | `33c7e6a9a0d6bbd551d4171ece6681b66bf87657` | `43c4b1ffe8c3dee1a37e9f7b07f655ec3959896b` |

Exact originals, final copies, diff, and explanation are preserved in
`spikes/out/cbor-simple-write-20261011/worker-protocol-fix/`; README blob
`b15175416d37980ed9dd280a39952b4ecc3aed09`, SHA-256
`0c85c9e8d4a0a76cbbbe7ceb90b376df3aecf126c64f90cebbbd4abaeef7647d`.
The parallel header test has only one wave and remains identical,
blob `878f0fa10825ae3d49e9cac2f94d9992c06f2d20`. The three new blind blobs
did not change during the fix.

<a id="riscontri-e-verifiche-pendenti"></a>

## Findings and pending verification

Other blobs examined: package
`0a75ef778c3d5ea490ec0a61f11bf6c65a3183ee`, ASDF
`2a4f3cf6dd800e5e9c3d624c23971bec352d7988`, requirements catalog
`19223d1767a6b7eebb9636d99cea7d898560cbd2`, inventory
`3ec66f8edebd79a128969e0b398e7700a2b1c5cd`, foundation types
`2d514f6fe2e81eecb29fa53de611fa5e28696904`, and conditions
`edbe5eaa88c50dc13af8e367b73f7f41fd7bd724`. Types, conditions, and shared
CBOR helpers show no changes from base.

No compilation, product/test call, heap measurement, coverage,
or mutation was performed by the owner of this reading. Recorded
campaigns with stable sources, sensor checks,
baseline and eight mutations, raw coverage without exclusions, and
full regressions remain necessary. Dependency qualifications retain their
historical limits; this reading is not human approval.
