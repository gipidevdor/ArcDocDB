<a id="decisioni-del-percorso-hash"></a>

# Hash-path decisions

Inventory for COD-54. Corpus outcomes and SB-Cover coverage
are not an MC/DC declaration.

| ID | Function / decision | Independent conditions |
|---|---|---|
| HASH-D01 | xxh64 / arguments | simple u8; start index; end index; seed-high u32; seed-low u32 |
| HASH-D02 | shared check-range | 0 <= start <= end <= length |
| HASH-D03 | xxh64 / limit | length <= max-key-bytes; zero and maximum included |
| HASH-D04 | blocks / tail | below 32 or blocks; 0..31 remaining; lane 8, lane 4, byte |
| HASH-D05 | crea-indice-primario / seed | both NIL; both u32; each incomplete/nonconforming half |
| HASH-D06 | esigi-seme-hash / configuration | health; absent pair; absent high with low; absent low with high |
| HASH-D07 | esigi-mappe-hash / arrays | highs simple u32; lows simple u32; high and low lengths; distinct identity |
| HASH-D08 | esigi-mappe-hash / seed | seed-high u32; seed-low u32 |
| HASH-D09 | calcola-digests-frammento / binding | high equality; low equality; configured; current/writable |
| HASH-D10 | scanning / invariants | used within arena; sample/control; key range; original lookup; live count |
| HASH-D11 | hash-blocks / span | size >= 32; start + size <= length; exact progress floor(size/32)*32 |
| HASH-D12 | hash-tail / span | start <= end; end <= length; remainder <= 31; final cursor = end |

Original directory/bank/payload guards remain in their respective
tables. Seed cannot change after construction; private memory/arrays
and exclusive writer are controller preconditions.
