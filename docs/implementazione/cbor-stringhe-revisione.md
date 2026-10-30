<a id="prima-lettura-c1-della-scrittura-di-stringhe-cbor"></a>

# First C1 reading of CBOR string writing

Static reading of 2026-10-11, **before campaigns and compilation**.
The reviewer read the contract and new product without writing the
product or new tests and without reading the blind corpus under construction.
No builds, tests, benchmarks, coverage, or mutations were run.

Base: `2a0011f9d2bef104b22f7ad1eb86d7e5d60d5e11`.
Source read: `src/codec/cbor-string-write.lisp`, Git blob
`a2c5c77dd51bff760bff4508e998d94370921eda`.
Contract: [method](cbor-stringhe-metodo.md), blob
`56342dae95caf8705e0b28b3c0ea7ac86fdd8fa0`.

<a id="esito-statico"></a>

## Static outcome

No functional defect or mandatory correction identified in the
read blob. The source can be frozen for preregistered tests; this
outcome does not establish warning-free compilation, zero heap, corpus success,
coverage, MC/DC, or gate completion.

Preflight checks destination, major, source, and budget before casting
the payload to u32. Preliminary rejection `span > budget` prevents a
physically large source from reaching the typed selector. The header is
included in the budget; destination-span capacity is then checked.
Only afterward is NEXT calculated: checked capacity implies NEXT <= END and
therefore NEXT remains an index. Physical space after END is not used.

Overlap concerns `[START,NEXT)`, including the header, and is checked
before UTF-8 and every write. With simple u8 arrays, the shared-memory case
allowed by the contract is the same array object: EQ comparison
suffices in the declared domain. Strict inequalities allow
touching ranges; the source-length check also allows
a zero-length span, wherever it lies in the array.

MT3 verifies the entire source span before writing the header and checks
the count returned by UTF-8. MT2 does not interpret contents. Length
and header always use bytes, not scalar count. UTF-8 errors
retain class, reason, and source offset; preflight errors
have offset NIL. After the first write, only internal guards remain
on already verified data, with external fail-stop and no rollback.

<a id="lunghezza-e-complessita"></a>

## Length and complexity

Syntactic count of independent paths: one initially, one increment
for each flow control, each additional AND/OR, and the LOOP.
It does not include expansion of type checks or primitive comparisons.
The decision inventory is a separate artifact maintained by the author.

| Function | Lines including DEFUN | Paths |
|---|---:|---:|
| `check-span-string-cbor-write` (10-21) | 12 | 6 |
| `check-input-string-cbor-write` (27-53) | 27 | 8 |
| `check-overlap-string-cbor-write` (58-70) | 13 | 7 |
| `copia-stringa-cbor-write` (75-93) | 19 | 8 |
| `scrivi-stringa-cbor-minima` (98-129) | 32 | 5 |

All comply with COD-12 and COD-13. Copying performs exactly SPAN steps,
with SPAN checked within 16 MiB and equal to destination length.
Pre-loop guards check both ranges; subsequent guards
check read and write completion. An empty span neither reads nor writes
payload. The public path also checks header completion and the
final cursor returned by copying.

<a id="checklist-c1"></a>

## C1 checklist

| Item | First reading |
|---|---|
| 1. Requirements and ADRs | REQ-CBR-002, ADR-0014/0048, and AFF-004/008 consistent with MT2/3, item budget, and preflight. The local limit does not qualify the composite document or Serie contract. |
| 2. Invariants | Budget including header, half-open capacity, stable source, exclusive destination, and no overlap checked before mutation. Falsification tests still pending. |
| 3. Errors | Order follows the method: destination range, major, source range, budget type/limit, payload/item budget, capacity, overlap, UTF-8. All public rejections precede the first write. Internal invariants remain without rollback. |
| 4. Bounds | One copy loop with explicit bound; UTF-8 already bounded and called with budget SPAN. No recursion, waiting, or thread creation. |
| 5. Heap | No constructor, closure, or u64/float/AST materialization in the new success path. Arithmetic on index/u32 within already checked ranges; the UTF-8 keyword call and NTH-VALUE still require local measurement. Zero heap not established. |
| 6. Verified data | MT3 validates all UTF-8 before the header; MT2 preserves arbitrary bytes by contract. Header and copy receive already checked spans and lengths; UTF-8 count is checked. |
| 7. Compound decisions | Range, budget, overlap, and copy-guard ANDs present; static count within limit. Inventory and independence pairs remain to be checked separately. No MC/DC attestation. |
| 8. Owner | Explicit OWNER/SHARED comments. The caller owns the destination; source bytes remain stable. Same array allowed only with disjoint footprint. |
| 9. Integration | Export added and serial ASDF after UTF-8, limits, and header writer. REQ-CBR-002 inserted; generated matrix, strict build, and MAKE CHECK still pending. |
| 10. Rules | Complete FTYPEs, docstrings with pre/post/errors, safety 3, entry and exit guards without side effects. No static deviation found; warning-free compilation not run. |
| 11. Parallelism | Local state only, no lock or shared counter per operation. Immutable sources can be shared among workers with private destinations; actual concurrency and scaling are not demonstrated by this reading. |
| 12. Durability | No I/O, publication, or durable change. The destination remains the caller's; an internal guard can fail after a write and requires the fail-stop boundary specified by the contract. |

<a id="confini-e-verifiche-ancora-necessarie"></a>

## Boundaries and checks still needed

No differences found in already integrated kernels `cbor-write.lisp`,
`utf8.lisp`, and `cbor-scan-input.lisp` against the base. The first reading
does not renew full qualification of those dependencies. Their coverage
limits and historical gates remain those preserved in their campaigns.

The second reading must assess blind-corpus data, including error
order, maximum and maximum+1, aliasing in both orders, header-only
overlap, malformed UTF-8 with source offset, sentinels, and exact arity.
Measurements must preserve full contents and check sensors;
coverage and mutations must preserve denominators, copies, logs, and failed
attempts under the preregistered method.

Other blobs read: package `12d573ec29468f1fdae3e674a494d786a390c33e`,
ASDF `0f3902e2459e9bda66a27046d640e35e0feadc1a`, requirements
`52300ff2ab7310e14b02fce2dc414b56a08c8f6c`.
