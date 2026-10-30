<a id="decisioni-degli-header-cbor"></a>

# CBOR header decisions

Static inventory of `src/codec/cbor-header.lisp`, read after freezing
independent tests. Every check remains in the coverage denominator;
this table constitutes neither MC/DC nor an approved exception.

| Decision | Oracle or invariant |
|---|---|
| `check-header-cbor-range`: AND buffer/start/end type and numeric chain | Generic, adjustable, fill-pointer, displaced, multidimensional arrays; noninteger, negative, beyond-fixnum, reversed, and beyond-length indices, all rejected before lead. |
| `check-header-cbor-range`: start=end | Valid empty spans at 0, 1, and 3 with end offset; empty invalid buffer preserves range priority. |
| `leggi-argomento-header-cbor`: start<=end<=length | Internal contract guard: the public helper checked span and lead. No valid public input falsifies this guard. |
| `leggi-argomento-header-cbor`: width>end-start | All 152 truncated prefixes of lead+widths 1/2/4/8 for eight major types; missing bytes are physically present but outside end. |
| `leggi-argomento-header-cbor`: i<high-bytes | Widths 1/2/4 have zero high; width 8 has asymmetric, maximum, and zero high and low. All 65536 two-byte arguments verified. |
| `leggi-argomento-header-cbor`: AND start<next and next<=end | Positive width and previous fit guarantee progress and index addition; no simulation of an inconsistent helper. |
| `leggi-indefinito-header-cbor`: AND start<end and end<=length | Internal guard after present lead, no public falsification. |
| `leggi-indefinito-header-cbor`: AI=31 | Helper invoked only from public AI31 branch; internal guard retained. |
| `leggi-indefinito-header-cbor`: CASE major | 0/1/6 rejected; 2/3/4/5 indefinite; 7 break. Otherwise impossible for unsigned-byte3 type, remains in report. |
| `leggi-header-cbor`: 28<=AI<=30 and AI=31 | All 256 leads on full and one-byte spans, rejections with exact reason/offset and priority. |
| `leggi-header-cbor`: AI<24 and width=0 | All 192 immediate values, then four widths. Nonminimal arguments allowed, including lengths/tags without payload. |
| `leggi-header-cbor`: AND major=7, AI=24, low<32 | All 256 F8 second bytes (32 rejected, 224 accepted), same low in other major types and raw floats; truncated F8 precedes simple. |
| `leggi-header-cbor`: AND cursor<next and next<=limit | Immediate and marker consume one; arguments consume the entire guarded width. Internal contract always true for public input, except helper error. |

Short-circuit composition of range guards and F8 rejection
has tests isolating external boundaries. Postconditions between helpers and
defensive guards are not made false by public inputs; a reading and
branch coverage do not prove full MC/DC.
