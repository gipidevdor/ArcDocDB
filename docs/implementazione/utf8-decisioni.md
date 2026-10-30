<a id="decisioni-della-validazione-utf-8"></a>

# UTF-8 validation decisions

Inventory of compound decisions in `src/codec/utf8.lisp`. Public-data
oracles are declared before product reading in the
[method](utf8-metodo.md). Internal guards defend the contract between helpers;
public caller cannot falsify them after correct preflight.

| Function and decision | Conditions and independent cases |
|---|---|
| `check-utf8-arguments`: range `and` | Buffer `octets`; start `index`; end `index`; `start <= end <= length`. Generic/adjustable/displaced buffer, negative/noninteger/beyond-fixnum start or end, start > end, end > length. Numeric chain has both boundaries exercised separately. |
| `check-utf8-arguments`: budget `and` | Budget `index`; budget <= 16 MiB. Negative/noninteger/beyond-fixnum and 16 MiB+1, with valid range; valid budget 0 and 16 MiB. Check occurs before bytes. |
| `verifica-carattere-utf8`: progress `and` | cursor < next; next <= end. Internal invariants after width and continuation checks. Public path exercises widths 1/2/3/4, exact and truncated spans; no public input makes these conditions false. |

`<=` chains require both limits: lead C2..DF, E0..EF, and F0..F4;
continuations 80..BF; scalar second byte between prefix minimum and maximum. Manual
fixtures check each boundary, immediately outside bytes,
E0 A0/ED 9F/F0 90/F4 8F, and four excluded prefixes. After valid lead,
truncation precedes content; after verified width, invalid
continuation precedes scalar restriction.

No `or` decision present in product. Final `cond` branch
classifies an expected malformed initial byte; signals `corruption-detected`,
not internal inconsistency. Other internal guards signal
`invariant-violation`; future worker boundary must apply fail-stop.

This table records test scope and limits. It does not declare full MC/DC,
exclude guards from coverage denominator, or constitute
an approved exception to engine C1 criteria.
