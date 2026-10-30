<a id="decisioni-composte-della-scrittura-cbor"></a>

# Compound decisions in CBOR writing

Inventory of file `src/codec/cbor-write.lisp`, blob
`61f0d6e2783e4790ed7e19a45bba6407d6e5b3de`, before the campaigns.
Lines refer to this frozen file. Four compound forms,
including the nested OR; none removed from the coverage denominator.

| Form | Conditions | Evidence and limit |
|---|---|---|
| AND, line35 | space for WIDTH; word representable at the width | Successful paths for WIDTH1/2/4. Public-function preflight prevents reaching the internal guard's failure; condition coverage is not claimed. |
| OR, line36 | WIDTH=4; WORD below 2^(8×WIDTH) | WIDTH1/2 and WIDTH4 successful. In the u32 domain, for WIDTH4 the second term would also be true: the first has no independently decisive witness. No MC/DC attestation. |
| AND, line42 | positive progress; NEXT within END | All widths and exact capacity; internal false outcomes cannot be reached through the valid API. |
| AND, line53 | simple u8 buffer; START index; END index; ordered range within physical bounds | Independent tests for non-simple input, invalid START with the rest valid, invalid END with the rest valid, reversed/out-of-buffer range with valid types, success. The final check is a multi-operand relation, not an attestation of independence for every expanded comparison. |

Range/major/high/low/capacity priorities have competing and individual tests.
The chained relations `START≤END≤length` (line33) and
`BEGIN≤CURSOR≤NEXT≤LIMIT` (line84) are also internal multi-operand
guards; they remain in the denominator without attestation of independence
for each comparison. The preflight relation is included in line53.
Internal guards are always active: a mutant passing preflight
can be detected by the invariant. This local evidence does not close the
C1 100%-coverage gate required by ADR-0035.
