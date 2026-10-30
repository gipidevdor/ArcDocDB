<a id="decisioni-delle-testate-cbor-minime"></a>

# Decisions for minimal CBOR headers

Author's inventory, against the method fixed before campaigns. Ten new
compound decisions are listed below; the unchanged syntactic reader
retains its own inventory. The author did not read the new tests
before product delivery. Listed fixtures are those of the
[method](cbor-minimo-metodo.md), not observed outcomes. No guard or declarative
form is excluded from the denominator; no MC/DC qualification.

| ID | File, function, and line | Conditions | Planned verification / limit |
|---|---|---|---|
| D01 | `cbor-float-minimal.lisp`, `binary32-accorciabile-cbor-p`, 15 | exponent <= 255; fraction <= 0x7fffff | Fields extracted from u32 word; wrong outcome is an internal defense, retained in raw coverage. |
| D02 | same function, 25 | shorter; fraction with at least one of the low 13 bits set | Alignment postcondition: every value that can be shortened has its low 13 bits zero. Normal/subnormal values and adjacent NaNs; internal violation. |
| D03 | `binary64-allineato-cbor-p`, 43 | low zero; low high bits below shift-32 zero | Subnormal values with shift 33..52: either word can make the significand unaligned. Shift boundaries 32/33 and 52. |
| D04 | same function, 45 | aligned; low with at least one of its low 29 bits set | Alignment postcondition 30..52; wrong outcome is an internal defense. |
| D05 | `binary64-accorciabile-cbor-p`, 57 | exponent <= 2047; fraction-high <= 0xfffff | Fields extracted from high u32 word; wrong outcome is an internal defense. |
| D06 | same function, 60 | fraction-high zero; low zero, when exponent zero | Zero with both signs and nonzero binary64 subnormals: no binary64 subnormal fits binary32. |
| D07 | same function, 67 | shorter; low with at least one of its low 29 bits set | Postcondition for every binary64 that can be shortened; internal guard, corpus of normal/subnormal/NaN values and neighbors. |
| D08 | `cbor-minimal.lisp`, `argomento-minimo-cbor-p`, 16 | AI 27; or HIGH zero | Nonzero first word allowed only with eight-byte width; defense of the header contract, distinct from minimal width. |
| D09 | `float-accorciabile-header-cbor-p`, 35 | AI 27; or HIGH zero | Float bits in one word up to binary32, two for binary64; header-contract defense. |
| D10 | `leggi-header-cbor-minimo`, 56 | START < NEXT; NEXT <= END | Progress after complete header, before filtering; syntactic rejections propagated first. Wrong outcome is an internal defense. |

<a id="selezioni-e-soglie"></a>

## Selections and thresholds

| Field | Local decision |
|---|---|
| Syntactic header | `leggi-header-cbor` is called first: range, reserved, truncated, illegal indefinite, and simple F8<32 precede any `:cbor-nonminimal`. No body or payload read. |
| Form | Syntactically allowed `:indefinite` and `:break` rejected at the lead. This is the contract's chosen local boundary, not verification of the full document profile. |
| Major 0..6 | AI0..23 minimal; AI24 low >=24; AI25 low >=256; AI26 low >=65536; AI27 high nonzero. u64 argument never reconstructed. |
| Major 7 | Simple and binary16 accepted; binary32/64 rejected only if they can be shortened. Integers and floats remain distinct. |
| binary32 exponent 0 | Zero fraction represents ±0, which can be shortened; every other fraction is too small for binary16. |
| binary32 exponent 113..142 | binary16 normal range: fraction must have low 13 bits zero. |
| binary32 exponent 103..112 | binary16 subnormal range: significand24 with implicit bit, alignment `126-exponent`, namely 14..23. |
| binary32 exponent 255 | ±infinity and NaNs can be shortened when the low 13 fraction bits are zero; sign and high payload preserved. |
| binary32 other exponents | Cannot be shortened: outside binary16's value range. `t nil` is the expected outcome, not an unexpected state. |
| binary64 exponent 0 | Zero fraction-high and low represent ±0; any other value is too small for binary32. |
| binary64 exponent 897..1150 | binary32 normal range: low 29 bits of low zero. |
| binary64 exponent 874..896 | binary32 subnormal range: significand53 HIGH21/LOW32 and shift `926-exponent`, namely 30..52. No u64 combination. |
| Shift <=32 | Mask only LOW's low bits; shift32 checks the entire low word. |
| Shift >32 | LOW zero and mask on only the low `shift-32` HIGH bits. |
| binary64 exponent 2047 | ±infinity and NaNs: 29 low padding bits zero; sign, payload, and quiet/signaling position preserved. |
| binary64 other exponents | Cannot be shortened; `t nil` expected. |

The formulas derive from the destination subnormal unit position:
binary16 uses 2^-24, so the binary32 significand must be divisible
by 2^(126-exponent); binary32 uses 2^-149, so the binary64 significand
must be divisible by 2^(926-exponent). For NaNs, only bits are compared
using right zero-padding, without floating-point conversions.
The check does not impose a single NaN, key ordering or uniqueness,
tag semantics, or a document root type.

<a id="lettura-statica-dellautore"></a>

## Author's static reading

Delivery includes five helpers and the public reader. All have FTYPEs,
docstrings with pre/post/conditions, safety3, and at least two meaningful invariant
guards for their fields, alignments, widths, or progress. No
function exceeds 60 lines; separating float dispatch keeps the public
reader's path count low. No loops,
recursion, constructors, handlers, mutable global state, copies, I/O, or waits.
Words remain u32; the largest mask produced by a shift is 2^32-1,
immediate on the method's 64-bit SBCL target. This does not replace heap
measurement on the target actually used.

| C1 item | Author's finding and test still required |
|---|---|
| 1 | LIM-002, AFF-004/008, and ADR-0014/0048 local contract; full profile not established. |
| 2 | Field, word, alignment, and progress invariants listed; independent oracles and campaigns pending. |
| 3 | Syntax propagated first; `corruption-detected :cbor-nonminimal` at lead; `invariant-violation` defenses. No Serie/FAULTED owner in this kernel. |
| 4 | Constant work after reading at most nine bytes; no waits or recursion. |
| 5 | No constructor on success, only masks/words; heap **pending**, not established by reading. |
| 6 | Exactly six values after complete header and filter; no decoded body exits. |
| 7 | Ten compound decisions inventoried; full denominator, coverage and MC/DC not established. |
| 8 | Caller's immutable input and local variables only; no scratch or shared state written. |
| 9 | Export added; coordinator's ASDF integration, trace, and `make check` pending. |
| 10 | FTYPE/safety/docstring/guards present; build/lint and independent readings pending. No approved exception. |
| 11 | No lock, wait, or per-operation write between Serie; independent concurrent test pending. |
| 12 | No durable change, delete, or publication: not applicable. |

This is the author's reading, not an independent C1 reading or
human approval. The author ran or read no test, build, benchmark, or new oracle
suite before this delivery.
