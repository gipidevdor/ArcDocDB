<a id="riferimenti-fisici-full-text--metodo-preregistrato"></a>

# Full-text physical references — preregistered method

October 17, 2026. REQ-SEC-004/006/010, REQ-WAL-005, and REQ-CON-002;
ADR-0037/0039/0047/0054, INV-I5/I6, and INV-P6. The next delta-map element
is a preallocated reservation reference, captured from the sealed
batch with an authoritative CSN token before handoff to I/O.

Capture does not publish, prove durability, or resolve a prepared record. It retains
row, segment, absolute offset, length, version, and two-word stamp;
stamp is CSN for an ordinary record, TXID for a prepared one. The getter remains valid
after buffer reuse; no reuse of transferred reservations is introduced.

| Decision | Planned verification |
|---|---|
| Ownership | canonical lease and token; only reservation transferred by PUT bridge |
| Lifetime | same incarnation/range; SEALED batch not handed to I/O group |
| Authority | exact registry and log of pending WAL token; healthy segment log |
| Header | CRC over only 20 bytes, consistent span/type/flag and stamp; no body scan |
| Ordinary | stamp equals CSN captured at closure, never an unbound manual stamp |
| Prepared | TXID equals value captured at append; never replaced by batch CSN |
| Capture | fields already preallocated, offset sum checked before effects; no ordinary budget failure after SEAL |
| Failure | inconsistent header or interrupted capture => pool/batch FAULTED, data and costs retained |
| Getter | only fully captured reference; no dependence on reused buffer |

Oracles: independent bitwise v1/v2 record, position calculated from file
prefix and previous records, stamp at u32/u64 boundaries; real batch reuse after
write/flush and token resolution in the fixture. Conservative rejections before
effects; corrupted headers even with recalculated CRC. Native test on a complete file,
reopened read-only, comparing bytes reached by the reference.

Heap: extend the PUT measurement already excluded from instrumented coverage with WAL
closure, one thousand captures/getters on preallocated slots, and ID 1/UINT64_MAX. CRC probe
shows capture reads only the header; negative control on the old full scanner.
Preserve all attempts and actual sources. Two readings by the same author;
C1 qualification, MC/DC, and overall independent verification remain open.

<a id="due-letture-dello-stesso-autore"></a>

## Two readings by the same author

First reading: traced lease, reservation generation, and batch incarnation;
token authority required before reading stamp. Original flags and TXID
captured at private-frame append; ordinary CSNs checked only after closure.
Offset and shape before effects, no release or ordinary capacity failure
after SEAL. Getter without buffer references, without visibility or durability claims.

Second reading: traced header errors, incomplete capture, and real batch reuse.
Effect protected from its start, SEALED state set last, invariants
before/after internal setter; fault retains costs and CSN. The pool's
metadata quota remains conservative and the CI catalog's six allocation exclusions
are unchanged. Two readings by the same author are not independent review
and do not close C1 or MC/DC.
