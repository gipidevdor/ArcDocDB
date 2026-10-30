<a id="decisioni-della-scrittura-dei-valori-semplici-cbor"></a>

# Decisions in writing CBOR simple values

Static inventory before compilation and campaigns; existing
dependencies are not rewritten. No exclusion from the coverage
denominator, MC/DC attestation, or full coverage.

| Function / form | Conditions, from left | Planned witnesses |
|---|---|---|
| `check-input-simple-cbor-write` / `unless and` | BUFFER octets; START index; END index; ordered range within length | wrong array/START type/END type, START>END, END>length; valid and empty |
| `scrivi-semplice-cbor-minimo` / `unless and` | BEGIN<NEXT; NEXT≤LIMIT | positive, bounded footprint on success; internal guard retained |

The chained relation `START≤END≤length(BUFFER)` contains two comparisons:
span order and physical bound. VALUE's TYPEP uses the union
`(or (integer 0 23) (integer 32 255))`: both ranges, endpoints,
gap 24..31, -1 and 256, large integers, and other types are in the corpus.
This OR belongs to the type descriptor, without short-circuiting written
as a control form; it is not omitted from the semantic inventory.

Simple decisions include coherent span, selection at 23/32,
END−START capacity, lead choice, second byte, and final cursor.
All insufficient capacities and physical space beyond END are
challenged in the corpus. Internal guards remain in raw reports.

Syntactic path count: 7 for preflight, 8 for the public
function, including control AND/OR but not TYPEP expansions or
primitive comparisons. The footprint condition pair and span
guard require separate verification; passing tests does not prove their
independence. The ADR-0035 C1 gate remains open.
