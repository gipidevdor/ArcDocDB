<a id="scrittura-dei-float-cbor--seconda-lettura-c1"></a>

# Writing CBOR floats — second C1 reading

Static reading by the blind-corpus owner on 2026-10-13, after
corpus freeze and subsequent product writing,
before compilation and campaigns. Base
`07b26a0941bf48e0ec14d3391cb71455d7e8388f`; preregistered method
[float writing](cbor-float-scrittura-metodo.md), blob
`755b13a91ab72f54383d96faee5780da36e750d6`.

| Product examined | Git blob |
|---|---|
| `src/codec/cbor-float-narrow.lisp` | `cd5749edc0a757ee3a5b470eda566a6685d32fd8` |
| `src/codec/cbor-float-write.lisp` | `03c6aed61e2c243d8b1a6c4332ce1837c4e9a77c` |

No functional defects or open static findings emerged in the examined
blobs. Strict compilation, campaigns, observed heap allocation, concurrency,
raw coverage, and mutations remain pending. This reading does not qualify
C1 or the engine, attest MC/DC, or constitute human approval.

<a id="checklist-c1"></a>

## C1 checklist

| Item | Static finding and verification still needed |
|---|---|
| 1. Requirements and ADRs | REQ-CBR-004, AFF-004/008, INV-F1/P6, and ADR-0014/0033/0035/0048 are consistent with a local wire primitive. AI25/26/27 identifies raw IEEE bits, not Common Lisp numbers. Shortenable encodings are accepted, preserving sign, zero, infinity, and NaN significand; application profile and document budgets remain higher-level. |
| 2. Invariants | Functions separate range/AI, word type/consistency, exact selection, capacity, and mutation. Guards check span, shortenable input, significand/alignment, reconstruction of the two words from the quotient, sign, high-word consistency, and progress. The corpus compares every physical byte and NEXT; runtime outcomes are pending. |
| 3. Errors | Order range → AI → HIGH → LOW → words → capacity. Reasons :cbor-range/:cbor-float-ai/:cbor-float-high/:cbor-float-low/:cbor-float-words for invalid-argument; :cbor-float-capacity for resource-exhausted. Offset NIL comes from the condition initform. All public rejections precede the first write; internal invariant-violation requires owner fail-stop and promises no rollback. |
| 4. Limits | At most two reductions, no loop or recursion in new sources. Existing BE helper performs two or four steps per word; total output 3/5/9 bytes. No wait, retry, callback, worker creation, or I/O in the product. Capacity is END−START of the already-selected form. |
| 5. Heap | On the SBCL64 target, fields and shifts produce immediate values: no reassembled u64, float, list, closure, AST, or new destination. Even significand53 remains split HIGH21/LOW32. The reading does not prove zero heap allocation: a serial benchmark, zero baseline, and positive control are needed. Error conditions are outside the success path to measure. |
| 6. Output | Selection may perform 64→32→16, without skipping the second check. F9/FA/FB are E0 OR AI25/26/27; HIGH is emitted only for size9 and LOW in two/four bytes. Guard CURSOR=NEXT precedes `(values next)`, one result. The corpus verifies exact arity, fixnum NEXT, and complete array. |
| 7. Compound decisions | Six AND/OR in new sources, listed below with conditions and roles. CASE/COND, internal guards, declarations, and chained primitive predicates remain explicit in the inventory; no denominator exclusion or inference of dynamic independence. |
| 8. Owner | OWNER/SHARED declare exclusive buffer and local words/cursors. There is no mutable global state, retained scratch, or buffer publication. Nonsimple/displaced/adjustable/fill-pointer destinations are rejected. Exclusivity between callers remains a precondition. |
| 9. Integration | Export present; serial ASDF loads the two new sources after IEEE predicates and BE helper, then the three tests and RUN. Coverage scope selects exactly the two new files, with positive and negative suffix cases. Catalog and matrix contain REQ-CBR-004 without declaring :cov; complete make check is pending. |
| 10. Standard | safety3, complete FTYPEs, Pre/Post/error docstrings, REQ, and active checks present. The seven functions occupy 14–26 lines and 6–9 paths, within 60/10. Guards and absence of side effects are discussed below; no deviation proposed. Absence of warning/style-warning and lint require later execution. |
| 11. Parallelism | No lock, wait, or shared write between Serie on the call path. The corpus plans two reused workers, private buffers, and immutable plans, with separate READY/GO/DONE for each of two waves. Intervals, sinks, joins, and cleanup must be observed without inferring scaling or simultaneous execution on cores. |
| 12. Durability | Only mutation in caller-exclusive memory: no commit point, I/O, deletion, or durable/atomic publication. Composition, fail-stop, and Serie transitions belong to the owner level. |

<a id="riduzioni-e-conservazione-dei-bit"></a>

## Reductions and bit preservation

Binary32→16: the existing predicate admits only zero when
the exponent is zero. For exponent255, the thirteen low fraction bits
must be zero and payload narrows without losing quiet/signaling.
For exponent113..142, exponent16 is E−112 and fraction is F/2^13.
For exponent103..112, significand24 becomes subnormal16 through
exact division by 2^(126−E). Sign fields are placed at bit15.

Binary64→32: zero and special cases follow the same pattern;
payload/fraction23 is HIGH-fraction×8 plus LOW/2^29, with alignment
already verified. For exponent897..1150, exponent32 is E−896.
For exponent874..896, dividing significand53 requires
SHIFT=926−E, therefore 30..52. Below32, the quotient combines
HIGH×2^(32−SHIFT) and LOW/2^SHIFT; from32 onward, HIGH/2^(SHIFT−32) suffices,
because the alignment predicate requires LOW=0. SHIFT32
falls in the second branch and retains HIGH without shifting. No operation
reassembles significand53 or the entire word64.

Selection updates LOW, zeroes HIGH, and sets AI to26 after reduction64.
The following WHEN therefore also considers this new binary32 and can
reduce it to16. Valid input16 retains original bits; input32/64
that cannot be reduced retains all words. The corpus oracle
derives class and rational value, then seeks a general exact encoding;
it does not reuse these shift formulas or product predicates.

<a id="preflight-footprint-e-cod-24"></a>

## Preflight, footprint, and COD-24

The range AND protects LENGTH and arithmetic from incorrect buffer/index types.
HIGH is checked before LOW; only then does CASE check HIGH=0 for
AI25/26 and LOW≤65535 for AI25. The u32 type admits values up to 2^32−1,
so LOW=65536 in AI25 produces :cbor-float-words, not :cbor-float-low.
Capacity is checked after selection: even input64
reduced to16 succeeds with only three bytes available.

SIZE≤SPAN and START≤END imply NEXT=START+SIZE≤END, without
index overflow. CURSOR=START+1 is within NEXT. For size3/5, the only BE write
covers [START+1,NEXT); for size9, the first covers four HIGH bytes and the
second four LOW bytes. The BE helper receives NEXT as its bound and checks
range, word width, and progress. Prefix, span remainder,
and physical tail stay outside all writes.

Input and output checks have distinct roles: range/AI and
span reconstruction; HIGH/LOW types and consistency of returned form;
HIGH consistency before/after selection; shortenability and sign
preservation in reducers; width/alignment and word reconstruction in the
significand reducer; capacity/footprint and progress in the writer.
They are not constant-return guards or TRUE assertions. Sign
and reconstruction guards may be unreachable with valid public inputs
and correct local formulas: this does not exclude them from
coverage or prove they protect against every arithmetic defect.
Complete bit exactness also relies on the cold oracle and
mutations. Guard conditions do not modify the buffer;
the C1 transition to FAULTED remains at the owner boundary, not in the codec.

During readings, before any compilation, the first reviewer
reported that the significand reducer's `RESULT≤#x7fffff` guard
merely repeated the declared u23 type. The coordinator replaced it
with two postconditions: HIGH must equal RESULT×2^(SHIFT−32),
and LOW the low RESULT bits restored to their original position
when SHIFT<32, or zero otherwise. For SHIFT30/31 the first
comparison removes two/one low bits respectively; for SHIFT32 it retains
RESULT; for SHIFT33..52 it reconstructs HIGH by left shift.
The second comparison uses a two/one-bit mask without reassembling u64.
These checks verify the quotient against original words,
not only against its type. The final second reading concerns this
revision `cd5749ed...`; original `31a61d565...`, revision, and note are
preserved in `spikes/out/cbor-float-write-20261013/precompile-quotient-guard/`.
The corpus was not changed and no campaign ran on the original
blob.

<a id="dimensione-e-decisioni"></a>

## Size and decisions

Syntactic count: one initial path, one increment per IF/WHEN/
UNLESS, per nonfinal COND/CASE branch, and per additional AND/OR
argument. It excludes compiler expansions of TYPEP or
primitive comparisons. Inclusive DEFUN lines, with docstrings and declarations.

| Function | Source, lines | Lines | Paths |
|---|---|---:|---:|
| `riduci-binary32-cbor` | narrow, 10–31 | 22 | 7 |
| `riduci-significando64-cbor` | narrow, 37–55 | 19 | 7 |
| `riduci-binary64-cbor` | narrow, 59–81 | 23 | 7 |
| `check-float-cbor-range` | write, 9–22 | 14 | 7 |
| `check-float-cbor-words` | write, 27–41 | 15 | 8 |
| `seleziona-float-cbor` | write, 47–61 | 15 | 9 |
| `scrivi-float-cbor-minimo` | write, 65–90 | 26 | 6 |

| Compound decision in write | Conditions | Corpus evidence |
|---|---|---|
| 13–14, range AND | octets; START index; END index; START≤END≤length | destination types, index types/limits, reversed and past-tail ranges, valid/exact/empty |
| 36, words16 AND | HIGH=0; LOW≤65535 | nonzero HIGH, LOW65536/2^32−1, valid half values, invalid LOW before consistency |
| 51, selection-input OR | AI27; HIGH=0 | consistent input16/32 and input64 with zero/nonzero HIGH; internal guard false outcome pending |
| 55, reduction64 AND | AI27; shortenable64 | all half values expanded64, zero/inf/NaN, only32/only64, input16/32 |
| 57, reduction32 AND | AI26; shortenable32 | half values expanded32, reduction64→32→16, retained 64→32, retained input16 and64 |
| 59, selection-output OR | AI27; HIGH=0 | forms16/32 with zero HIGH and retained64; internal guard false outcome pending |

AI `(member 25 26 27)` is a type descriptor, not executable AND/OR.
The chained comparison at line14 expresses two relations, the one at
line81 three; they are explicit primitive predicates and remain to be compared
with raw coverage. Reducer CONDs retain the final
invariant-violation branch; word CASE retains AI25/26/27 and internal OTHERWISE.
This table neither demonstrates MC/DC nor permits guard exclusions.

<a id="provenienza-e-riesame-del-corpus"></a>

## Provenance and corpus reexamination

The method precedes the corpus; the three files were written without reading
the new sources and frozen before the coordinator wrote the
product. Preparation read test forms to EOF and
checked fixture and sink arithmetic in an isolated Common Lisp
process, without calling or compiling the product. This second reading
rechecked blobs without changing the corpus.

| Blind file | Git blob | SHA-256 |
|---|---|---|
| `tests/codec/cbor-float-write-support.lisp` | `6ba7c20701b60789d92ff232fc02b0f476334911` | `158f18dcf4b2d7e5562713caa3625aeba16dd1eba21f4413345e8a10b616c748` |
| `tests/codec/cbor-float-write.lisp` | `747cd8a72445a3ea638cd1910bc9faa63f4cdc33` | `2d163a64bff4b9d9b9de576c4a4df05f4d8853f1c3d039e790cbb827be98c8b6` |
| `tests/codec/cbor-float-write-threads.lisp` | `f95bf450148fa2aab9bb28c178b986dee049de6e` | `96a1b205c01f75e271684132ff3e48b4da5cf8a01210257b591ec4951f097043` |

The 17 serial tests plan all 65,536 half values and expansions32/64,
196,608 successes; every half value tests capacity 0/1/2, rotating input
25/26/27, for 196,608 rejections. Eight offsets and three exact/
remaining/tail capacity configurations are rotated in exhaustive testing, not fully
crossed. The 278 literal/boundary fixtures instead exercise all
eight offsets, three configurations, and every capacity below SIZE, including
retained forms32/64. There are rational oracle checks, aligned/
unaligned NaNs, signs, thresholds and adjacencies, word crossing in
subnormals64, multi-invalid precedence, arity, displaced/fill-pointer
backing, reuse, and 38-byte concatenation.

The 2,048-case fuzz uses seed `464C5434` and fixed categories: 768 successes,
256 capacity, 128 AI, 128 HIGH, 128 LOW, 256 words, and 384 ranges/destinations.
Expected bytes and conditions are not derived from decoder or writer.
Reader/scanner are supplementary checks after cold comparison.

The 18th test plans two workers, two waves per worker of 8,192 calls,
32,768 total. Each plan has eight input16/32/64 cases with reductions and retained
forms, repeated 1,024 times per wave. Before every call,
the private buffer is restored from sentinels; one NEXT,
all bytes, and sink 2,115,584/2,148,352 per wave are verified.
Nested snapshots of plans and sentinels are compared by the parent,
alongside final buffers. READY/GO/DONE are separate between waves, so
a fast worker cannot consume the other wave's GO permit.
Waits within 15 seconds, joins within 20, bounded cleanup with verified
termination. Intervals include restoration and test comparisons;
they measure neither only the primitive nor simultaneous execution on cores.

<a id="altri-riscontri-e-verifiche-pendenti"></a>

## Other findings and pending verification

Blobs examined: package `bc701cf1f21d4fc218e7ab1d44a5f68240cba24a`,
ASDF `fac53c00bd4c8809437ec86dae3bff35d25f23ac`, coverage
`6262967597ab1c0c142ce1a988ec2ecf49543865`, requirements catalog
`145d43eb1a68e851de602dc87a60d77c8703c100`, and matrix
`70c15b290ccd686e550392fff60ba8ef9796e47d`.
IEEE dependencies `ca6215b30010d3d2eb90eaa6fd09dd5a9ac7778f`,
BE helper `61f0d6e2783e4790ed7e19a45bba6407d6e5b3de`, and conditions
`edbe5eaa88c50dc13af8e367b73f7f41fd7bd724` retain the limits of their
previous qualifications.

This reading performed no compilation, product load, tests,
benchmark, coverage, or mutations. Recorded campaigns
with stable sources/index/HEAD, driver self-tests, data readings,
full coverage without exclusions, and global regressions remain necessary before push.
