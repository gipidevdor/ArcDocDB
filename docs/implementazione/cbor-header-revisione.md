<a id="seconda-lettura-degli-header-cbor"></a>

# Second reading of CBOR headers

Independent static reading on 2026-10-09, after test freeze.
No functional defect found against the contract recorded in the
[method](cbor-header-metodo.md). Compilation, execution, coverage,
mutations, and allocations are **still to be acquired** as of this reading;
the reviewer ran no campaigns.

<a id="provenienza-e-indipendenza"></a>

## Provenance and independence

The three test files were written without reading `src/codec/cbor-*`
or spike CBOR implementations. Expected values come from the syntax
of [RFC 8949, §3 and §3.3](https://www.rfc-editor.org/rfc/rfc8949#section-3),
the frozen public contract, and a local arithmetic model.
The model uses division, remainder, and big-endian accumulation; it may create bignums
in cold code. It does not call the product to derive expected results.

Before reading the sources, test Git blobs were communicated
and lexical balance was checked statically. No test was
modified after that freeze. The two product blobs were
acquired only during the second reading.

| File | Git blob read |
|---|---|
| [cbor-package.lisp](../../src/codec/cbor-package.lisp) | `d5f72309f3eca0a719507d257a635e5dd680013a` |
| [cbor-header.lisp](../../src/codec/cbor-header.lisp) | `db635a50678f2712ec9516be335717ea254d4d09` |
| [cbor-support.lisp](../../tests/codec/cbor-support.lisp) | `172c4a335b2d504f785b2036532346a24ccf1378` |
| [cbor-header.lisp, test](../../tests/codec/cbor-header.lisp) | `a1541916590304adccc2092c226ef3be9c644168` |
| [cbor-threads.lisp](../../tests/codec/cbor-threads.lisp) | `720d80c6dd5a962dc724835c1421635ba289b7ef` |

<a id="riscontro-sul-contratto"></a>

## Contract findings

Preflight checks the simple u8 type and indices before the lead.
A valid empty span reports truncation at offset `end`; an invalid range
remains an argument error without an offset. AI 28..30 and AI31 are handled
before width calculation. For AI 24..27 the entire argument must
fit within the span before its bytes are read. The F8 check below
32 follows availability of the second byte, with offset `start+1`.

Accumulation reads at most four bytes per word: even both
`FFFFFFFF` words remain u32. It does not assemble a u64 value or convert
bits into a float object. The width check precedes the sum
`start+width`, which remains within `end`; the immediate path and markers
consume one byte. The result always contains the six public values
in the order major, AI, high, low, next, form.

Nonminimal arguments are preserved. The `:indefinite` and `:break` forms
receive no structural context validation. Strings, containers,
and tags may have a complete head without the body or child:
the outcome concerns only the head. The deterministic profile, text
UTF-8, map keys, document budget, and depth remain
the future parser's responsibility.

<a id="lista-di-controllo-c1"></a>

## C1 checklist

| Point | Finding and limit |
|---|---|
| 1. Requirements and ADRs | REQ-AFF-004/008 and initial support for REQ-LIM-002, consistent with ADR-0014/0048. Does not certify the complete CBOR decoder. |
| 2. Invariants and tests | Ranges, rejection order, words, progress, and immutability have independent oracles. Internal guards remain active; conforming public inputs do not make their postconditions false. Coverage and mutations pending. |
| 3. Typed errors | `invalid-argument`, `corruption-detected`, and `invariant-violation`; reasons and offsets are declared. No product handler hides an error. The kernel owns no Serie: the `FAULTED` transition belongs to the future owner. |
| 4. Bounded work | One lead and at most eight additional bytes; no recursion, waits, or loop dependent on declared payload length. Tests have iteration ceilings, semaphore waits within 15 seconds, joins within 20, and termination checks in cleanup. |
| 5. Allocations | No constructor on the success path in source; index/u8/u32 locals and no u64/float materialization. Zero heap requires the registered campaign with a positive sensor: result pending. |
| 6. Verified output | The six values exit after local syntax and head-boundary verification. No decoded document, payload, or implicit full-item validation exits. |
| 7. Compound decisions | The [table](cbor-header-decisioni.md) includes the five `and` forms: public range, argument progress, marker range, F8 rejection, and public progress. There are no `or` forms in the product. Guards and the `otherwise` branch remain in the denominator; no MC/DC qualification claimed. |
| 8. Data ownership | OWNER/SHARED comments declare caller-owned immutable buffer and local cursors/words. No global mutable state or buffer writes. |
| 9. Integration and checks | ASDF registers package/header after foundations, the three test files, and `arcdocdb.cbor.tests:run`. Build, lint, traceability, and `make check` are pending at the reading. |
| 10. Coding rules | Safety 3, speed 2, complete FTYPEs, public arguments T with runtime checks, and function contracts. No static violation found; no deviation or gate approval granted. |
| 11. Parallelism | No lock, wait, shared write, or global queue per operation. The planned test uses two private buffers and measures computation outside barriers; overlap remains to be observed, without claims about the engine pool or scaling. |
| 12. Durable atomicity | Not applicable: no durable writes, I/O, publication, or deletion. |

<a id="corpus-registrato"></a>

## Registered corpus

There are 17 nominal tests, one using two real threads. The following counts
are oracle expectations, not campaign results:

| Corpus | Expected |
|---|---|
| All 256 leads, argument physically available | 224 `:argument`, 4 `:indefinite`, 1 `:break`; 24 reserved and 3 illegal indefinite |
| All 256 leads on a one-byte span | 192 `:argument`, 5 markers; 32 truncated, 24 reserved and 3 illegal indefinite |
| All 256 F8 second bytes | 224 accepted, 32 malformed |
| Two-byte big-endian arguments | All 65,536 values, including nonminimal representations |
| Prefixes of the four widths for eight majors | 152 truncations, with missing bytes physically present outside `end` |
| Differential fuzz | 4,096 spans of 1..9 bytes, offsets 1..7; seed `8949A11F`, u32 LCG with multiplier 1664525 and increment 1013904223 |
| Planned concurrent computation | 2 × 65,536 headers × 16 passes; 2,097,152 headers, 18,874,368 bytes; sinks 2,401,919,800,705,024 and 2,231,683,637,051,392 |

Additional fixtures cover asymmetric and maximum high/low values, float bits for
zero, sign, infinity, and NaN, missing payload/child, ignored malformed
tails, unaligned offsets, invalid input, and rejection priority.

This reading removes no guards from coverage, approves no exceptions, and
does not close MC/DC, runtime fail-stop, or the engine release gate.
