<a id="lettura-delle-stringhe-cbor--seconda-revisione-c1"></a>

# Reading CBOR strings — second C1 review

2026-10-15. Independent static reading preceding first compilation
of the new product. Local outcome: **static PASS, no concrete defect
detected**. The reviewer proposed the contract but wrote neither kernel,
corpus, nor driver; did not consult first C1 review. No product LOAD,
compilation, or execution during this reading.
Dynamic verification, heap measurement, and C1/MC/DC qualification remain open.

<a id="fonti-osservate"></a>

## Observed sources

HEAD `b83a0bdaa597d1cb53c7ae4a5ebadc11ae2511ff`; kernel was
delivered after corpus and driver freeze. Pins were read
directly from worktree, without changing sources, corpus, index, or HEAD.

| File | Git blob |
|---|---|
| `src/codec/cbor-string-read.lisp` | `d4a4f774c2264c46349e7eda61ee4a2a3118d742` |
| `arcdocdb.asd` | `79f28d84f3b05bbbac6a0c2ce3aa9a3951f8e1ee` |
| `src/codec/cbor-package.lisp` | `3e31d60234585442baa5664be96a83915e034397` |
| `tools/foundation-coverage.lisp` | `1b40e4e6433e4ca38b68adca93ff39fa523053a7` |
| `tests/codec/cbor-string-read-support.lisp` | `cfd55cd47d782673113e67af625c1360195a345c` |
| `tests/codec/cbor-string-read.lisp` | `8437bdcaa4cf308dbf4614e748cdab4be2ae6d62` |
| `tests/codec/cbor-string-read-threads.lisp` | `8fc4ae5d9214108a6ae6bf26e644db1a42733cdd` |
| `docs/implementazione/cbor-stringa-lettura-metodo.md` | `0b0fe8acea7677d34334d347d949901b3ae9698d` |
| `docs/tracciabilita/requisiti.lisp` | `a5739604a02fe494a57fda61e7f95c8a7d20adcd` |
| `docs/tracciabilita/matrice.md` | `4ee14ed1c657e1f419cfcc1b0418c28653125dcf` |

Dependencies read: `cbor-string-write.lisp:10–21`
(`a2c5c77dd51bff760bff4508e998d94370921eda`), `cbor-header.lisp`
(`db635a50678f2712ec9516be335717ea254d4d09`), `cbor-minimal.lisp:48–66`
(`761302dad1073c841397f6c88d595b114af8d9ef`), `utf8.lisp`
(`26726c45555ae8490e0dff31f61f70735183acc7`), and byte constant in
`cbor-space.lisp:8` (`a8330e50a77b52a6b9044ebbb48f62bb4b3222a3`).
Types `octets/index` are defined in `src/foundation/binary.lisp:4–5`.
Benchmark/audit/mutation drivers and runtime results were not read.

<a id="contratto-precedenze-e-limiti"></a>

## Contract, precedence, and limits

Preflight `check-input-string-cbor-read`, lines9–22, calls the
existing span check before reading bytes. Invalid range precedes
invalid budget, which precedes exhaustion of the whole END−START window.
Empty span then reaches the header reader, which signals truncation at END.
Case `40 FF` with budget1 is rejected before reading header.

`leggi-stringa-cbor-minima`, lines27–61, calls the minimal reader before
MT2/3 checking. Reserved values, indefinite forms, truncated or nonminimal headers
therefore retain precedence over `:cbor-string-type` at START.
FORM is explicitly checked at line41; the callee returns
only `:argument` or signals a condition. AI, ignored at line40,
is width metadata, not an overlooked error indicator.

Nonzero HIGH is rejected before comparing LOW with END−PAYLOAD-START.
Addition at line49 occurs only after these tests: no u64
integer is reconstructed and NEXT cannot exceed END. A minimal length
of at least 2^32 does not fit the maximum 16 MiB window and produces
`:cbor-truncated` at END. Complete payload precedes every UTF-8 read.

MT2 does not read payload bytes. MT3 passes only
`[PAYLOAD-START,NEXT)` to validator, with budget LOW; returned
count is checked. A byte beyond NEXT does not complete a truncated
UTF-8 sequence. No tail reading, copy, Lisp-string conversion,
normalization, or tag semantics introduced. The caller
keeps the buffer stable while using the returned range too.
Return at line61 contains exactly three fixnum values.

<a id="inventario-completo-del-nuovo-controllo-di-flusso"></a>

## Complete inventory of new control flow

Two DEFUNs: helper 9–22, **14 lines**; reader 27–61, **35 lines**, including
docstrings and declarations. Helper: base 1 + 3 guards = 4 flows; adding
short-circuiting of the sole AND, **5 paths** under the conservative
convention. Reader: base 1 + 9 guards = **10 paths**. Both within
COD-12/13. Callee branches are not expanded in the new-file count.
No new LOOP, DOTIMES, DOLIST, IF, COND, CASE, or recursion.

| Decision | Line | Predicate and reachability of both outcomes |
|---|---:|---|
| D1 |16| MAX-BYTES is index and does not exceed cap: valid or `:cbor-byte-limit`; types and cap in corpus. |
| D2 |18| SPAN>MAX-BYTES: rejection or header; whole window, lower budget, and exact boundary tested. |
| D3 |20| SPAN≤internal cap: true after D1/D2; false violates preflight contract. |
| D4 |41| FORM=`:argument`: true from minimal reader; false requires inconsistent callee. |
| D5 |43| MAJOR in 2..3: bytes/text allowed, other six major types rejected after header. |
| D6 |45| HIGH=0: usable LOW or truncation; minimal u64 vectors with positive HIGH. |
| D7 |47| LOW>END−PAYLOAD-START: truncation or complete payload; includes empty and restricted END. |
| D8 |51| MAJOR=3: UTF-8 on payload only or opaque MT2. |
| D9 |53| COUNT≤LOW: true from correct UTF-8; false requires violation of its contract. |
| D10 |55| START<PAYLOAD-START: true from successful header; false is internal error. |
| D11 |57| PAYLOAD-START≤NEXT: true for u32 LOW, including 0; false is internal error. |
| D12 |59| NEXT≤END: true from fit before addition; false is internal error. |

One two-operand AND, only in D1; zero OR. First operand is
`typep max-bytes 'index`, second `max-bytes≤tetto`. If the first is
false, the second is not evaluated: no observed value
is attributed to it. Corpus includes invalid types, over-cap budgets, and valid budgets;
these are not yet runtime pairs closing MC/DC.

Nine binary numeric comparisons: helper `<=`16, `>`18, `<=`20; reader
`>`47, `=`51, `<=`53, `<`55, `<=`57, `<=`59. Also ZEROP(HIGH)45.
Zero comparisons with at least three operands. Interval types and FORM
EQ comparison remain separate from numeric comparisons. MAX-BYTES default
at line27 remains in instrumented denominator, along with
declarations and all error arms.

A mechanical Common Lisp reading of the source's six forms, with
READ-EVAL NIL to EOF, without evaluation, confirmed: helper with 3
decisions, 1 AND, 2 operands, 3 ERRORs, and 3 comparisons; reader with 9 decisions,
zero AND/OR, 8 ERRORs, 6 comparisons, and 1 ZEROP. Lines derived from numbered text.
Short-circuiting is added separately in conservative path count.

<a id="tutti-gli-errori-diretti"></a>

## All direct errors

| ERROR line | Class / reason | Offset | Nature |
|---:|---|---|---|
|17| INVALID-ARGUMENT `:cbor-byte-limit` | NIL | Budget outside type or range. |
|19| RESOURCE-EXHAUSTED `:cbor-byte-budget` | NIL | Whole window over budget, even if first item is short. |
|21| INVARIANT-VIOLATION `:cbor-string-read-span` | NIL | Internal cap defended after preflight. |
|42| INVARIANT-VIOLATION `:cbor-string-read-form` | START | Impossible form after correct minimal header. |
|44| CORRUPTION-DETECTED `:cbor-string-type` | START | Valid minimal header of another major type. |
|46| CORRUPTION-DETECTED `:cbor-truncated` | END | Nonzero HIGH. |
|48| CORRUPTION-DETECTED `:cbor-truncated` | END | LOW exceeds available authorized bytes. |
|54| INVARIANT-VIOLATION `:cbor-string-read-count` | PAYLOAD-START | Inconsistent UTF-8 count. |
|56| INVARIANT-VIOLATION `:cbor-string-read-progress` | START | Header without progress. |
|58| INVARIANT-VIOLATION `:cbor-string-read-payload` | PAYLOAD-START | Reversed payload frontier. |
|60| INVARIANT-VIOLATION `:cbor-string-read-range` | NEXT | Frontier beyond END. |

Total 11 ERRORs: 6 invariant, 3 corruption, 1 invalid-argument, 1 resource.
Range, header/minimality, and UTF-8 additionally propagate their own typed
conditions without handler or reclassification. All six internal guards
remain active; arms impossible with correct callees are static
obligations, not coverage exclusions or invented named-test outcomes. The
external owner applies planned invariant fail-stop;
this primitive does not own Serie state.

<a id="checklist-delle-due-letture-c1-seconda-lettura"></a>

## Checklist for the two C1 readings: second reading

| Standard item | Finding and limit |
|---|---|
|1. REQ and ADRs| REQ-CBR-009, LIM-001/002, AFF-004/008 on both DEFUNs; ADR-0014/0024/0035/0048 and method consistent. Local requirement does not qualify deterministic document. |
|2. Invariants| INV-A5: only complete outcome or condition; INV-A8: budget before bytes and fit before addition; INV-P6: read-only buffer, local variables. Named/rejection/immutability corpus and shared workers available, not yet executed. |
|3. Errors| All 11 explicit sites inventoried above; competing precedence covered by cold corpus, including type, HIGH, fit, and UTF-8. No ignored error return. |
|4. Bounded work| No new loop. Header up to 9 bytes; UTF-8 uses LOOP REPEAT SPAN, at most 16 MiB; no wait, I/O, or recursion. |
|5. Heap| No constructor, closure, AST, or new scratch. u32 words, indices, and multiple values; arithmetic and UTF-8 keyword call remain to be measured with zero baseline and positive sensor. Zero heap allocation not attested. |
|6. Verified data| Simple u8 buffer and indices checked before THE; minimal header, major, HIGH/LOW, and fit before NEXT; UTF-8 before MT3 return; final frontiers checked, three exact values. |
|7. Compound decisions| One AND with 2 operands, zero OR/chains; table and all sites above. No inference of dependency or module MC/DC. |
|8. Ownership| OWNER/SHARED at lines2–3; no buffer mutation or global state. View alone does not extend memory stability: caller obligation. |
|9. Integration| Export `cbor-package:13`; ASDF product line 36 after dependencies, corpus 182–183 and RUN 270. Coverage: exact scope 82–83, positive/four negatives 134–138, RUN 304, aggregate 351, CLI 2/363–364. Matrix regenerated with 127 requirements and 66 invariants; REQ-CBR-009 remains designed. Build/check and campaigns still to run. |
|10. Rules| Complete FTYPEs at lines 8/25–26, safety 3; 14/35 lines, 5/10 conservative paths. External checks and preflight postcondition, reader form/count/frontiers active. No deviation requested by static reading. |
|11. Parallelism| No lock, thread, wait, or write between Serie in product. Two real corpus workers share read-only buffer, with two waves of 2048 calls each: 8192 reads planned, bounded rendezvous and cleanup. No scaling measurement. |
|12. Durability| No durable change, deletion, publication, or new atomicity point. Return is only a view into caller buffer. |

<a id="corpus-e-stato-della-verifica"></a>

## Corpus and verification status

Sixteen serial tests and one with two workers, frozen before kernel.
Literal oracle and arithmetically constructed headers without product
writer: empty cases, all MT2 bytes, UTF-8 and absolute offsets, thresholds
23/24–255/256–65535/65536, u64 HIGH, all selected truncations,
16 MiB/+1 windows, ignored invalid tails, and whole-window budget.
MULTIPLE-VALUE-LIST checks arity 3 outside heap measurement. Frozen
fuzz uses seed 53545239 and 1024 cases: 512 successes and 64 for each of
eight rejection classes, with expected final state f8417639.
These are static corpus expectations, not runtime results of this review.

The second document does not promote REQ-CBR-009 to implemented/verified.
Completion requires warning-free compilation, tests,
heap measurements, mutations and C4 self-tests, independent reading of full
coverage and results, make check, and evidence preservation. All
missed entries, including internal guards, remain in raw denominators.
REQ-LIM-001/002, document profile, and C1/MC/DC qualification remain open.
