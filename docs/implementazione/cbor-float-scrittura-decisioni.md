<a id="float-cbor--decisioni-composte"></a>

# CBOR floats — compound decisions

Syntactic inventory of the two new C1 files, after the static correction
to the quotient postcondition. It excludes no expressions or branches and
does not establish MC/DC, full coverage, or guard unreachability.

| Function | Decision | Conditions and priority |
|---|---|---|
| check-float-cbor-range | range AND | BUFFER octets; START index; END index; START≤END≤length |
| check-float-cbor-words | AI25-case AND | HIGH zero; LOW≤65535, after both u32 checks |
| seleziona-float-cbor | entry OR | AI27 or HIGH zero |
| seleziona-float-cbor | reduction64 AND | AI27 and bit64 can be shortened exactly |
| seleziona-float-cbor | reduction32 AND | AI26 and bit32 can be shortened exactly, including after reduction64 |
| seleziona-float-cbor | exit OR | selected AI27 or selected HIGH zero |

Chained numeric relations also retain their components:
START≤END and END≤length in the range; lower bound/exponent/upper
bound in the reducers' four normal/subnormal windows;
BEGIN≤CURSOR, CURSOR≤NEXT, and NEXT≤LIMIT in the destination guard.

The significand64 postcondition separately compares the original
words with the reconstructed words. The second guard uses IF: SHIFT<32
reconstructs LOW from the quotient's low bits; otherwise LOW must be
zero. It does not reconstruct a u64. The corpus includes transitions between SHIFT30,
31, 32, and larger shifts, as well as unaligned neighbors.

Cold checks cover arguments, forms, and the full result, including
selection64→32→16, shorten-able/non-shorten-able NaNs, and the physical tail beyond
END. Internal guards and unexpected defaults remain in the coverage
denominator even when unreachable from the valid public domain.
The [preregistration](cbor-float-scrittura-metodo.md) defines the method;
outcomes will be distinguished from the inventory after the campaigns.
