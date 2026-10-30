<a id="decisioni-della-scrittura-delle-stringhe-cbor"></a>

# CBOR string writing decisions

Initial inventory of blob `a2c5c77dd51bff760bff4508e998d94370921eda`,
before campaigns. Existing dependency decisions are not
rewritten. The new file's raw reports retain every guard;
no exclusion or MC/DC/100% certification is implied.

| Function / form | Conditions, from left | Planned witnesses |
|---|---|---|
| `check-span-string-cbor-write` / `unless and` | octet array; START index; END index; ordered range within length | wrong array type, wrong START, wrong END, START>END/END>length; valid and empty cases for both spans |
| `check-input-string-cbor-write` / `unless and` | budget index; budget≤16 MiB | NIL/float/negative/bignum, 16 MiB+1, zero and valid extremes |
| `check-overlap-string-cbor-write` / `when and` | array identity; nonempty source; START<SOURCE-END; SOURCE-START<NEXT | distinct arrays, empty, source before/touching/after, header-only and payload overlap |
| `copia-stringa-cbor-write` / `unless and` | span≤16 MiB; span=target-end | internal guards; valid API guarantees both before entry |
| `copia-stringa-cbor-write` / `unless and` | cursor=END; read-cursor=STOP | normal completion, including empty; internal progress invariants |

Relations with multiple operands also represent multiple comparisons:

| Function | Relation | Comparisons |
|---|---|---|
| `check-span-string-cbor-write` | `START≤END≤length(BUFFER)` | span order and physical limit |
| `check-input-string-cbor-write` | `1≤header-size≤item-size` | positive size contained within item |
| `check-overlap-string-cbor-write` | `START≤NEXT≤length(BUFFER)` | ordered footprint and physical limit |
| `check-overlap-string-cbor-write` | `SOURCE-START≤SOURCE-END≤length(SOURCE)` | source order and limit |
| `copia-stringa-cbor-write` | `TARGET≤END≤length(BUFFER)` | ordered copy and physical limit |
| `copia-stringa-cbor-write` | `START≤STOP≤length(SOURCE)` | source order and limit |

Syntactic path count, including AND/OR and loops: 6/8/7/8/5
respectively for span, input, overlap, copy, and public wrapper. Unreached
internal guards remain in the coverage denominator;
the number of green outcomes does not close ADR-0035's C1 gate. The second
reading will compare this inventory with code and frozen tests.
