<a id="lettura-delle-stringhe-cbor--decisioni"></a>

# Reading CBOR strings — decisions

Static inventory before the first compilation, 2026-10-15.
Source [cbor-string-read.lisp](../../src/codec/cbor-string-read.lisp),
blob `d4a4f774c2264c46349e7eda61ee4a2a3118d742`.
The [method](cbor-stringa-lettura-metodo.md) keeps C1 qualification open.

Two functions: helper lines9–22, 14 lines and five syntactic paths
(base, three guards, one additional AND); entry lines27–61, 35 lines and
ten paths (base and nine guards). No new loops or recursion.
Full denominator: twelve control sites, one two-operand AND,
eleven ERRORs, nine binary numeric comparisons, zero chains. One keyword
default at line27, included in any instrumented coverage.

| ID | Line | Predicate | Outcomes and obligation |
|---|---:|---|---|
| D1 |16| A=`TYPEP MAX-BYTES INDEX` AND B=`MAX-BYTES<=16MiB` | A true/B true: budget0 or16MiB. A false/B unevaluated: NIL, negative, float, bignum. A true/B false:16777217. Both operands remain distinct; corpus pairs are not an MC/DC measurement. |
| D2 |18| `SPAN>MAX-BYTES` | True: window `40 FF`, budget1. False: same window, budget2. Includes tail. |
| D3 |20| `SPAN<=16MiB` | True after D1/D2; false would imply a preflight violation. No public pair claimed. |
| D4 |41| `FORM=:ARGUMENT` | True by minimal-reader contract. False is an internal callee failure. |
| D5 |43| `MAJOR` of type integer2..3 | True for strings; false for all other majors, after header verification. |
| D6 |45| `HIGH=0` | False for minimal u64 length above u32, truncation at END without addition. |
| D7 |47| `LOW>LIMIT−PAYLOAD-START` | True for incomplete payload, before UTF-8; false for complete payload, including empty. |
| D8 |51| `MAJOR=3` | True for text to verify, false for opaque bytes; tail unvalidated in both. |
| D9 |53| `COUNT<=LOW` | True for a correct UTF-8 validator; false detects an impossible internal count. |
| D10 |55| `BEGIN<PAYLOAD-START` | True after a complete header. False is an internal progress failure. |
| D11 |57| `PAYLOAD-START<=NEXT` | True from nonnegative LOW and addition after fit. False is an internal failure. |
| D12 |59| `NEXT<=LIMIT` | True after fit. False is an internal frontier failure. |

Unreached internal guards and ERRORs remain in the raw
denominator. They are not subtracted to improve percentages. Dependent
range, minimal-header, and UTF-8 checks are in the contract and
tests, but outside the new file's local scope.

The C4 reader `review/read-decisions.lisp`, preserved in the campaign,
reads six forms with READ-EVAL NIL to EOF and confirms the counts.
It does not load, compile, or evaluate the product. Stdout preserved, stderr
empty, exit0. Line and path counts are static; SB-COVER and
MC/DC qualification have distinct obligations.
