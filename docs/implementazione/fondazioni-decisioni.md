<a id="decisioni-delle-fondazioni-binarie"></a>

# Binary-foundation decisions

Inventory of compound predicates and regression cases under COD-54. Listed names
are test suffixes in [`tests/foundation/`](../../tests/foundation/); all include the
REQ in their name. This table alone does not certify MC/DC coverage.

| Function and decision | Conditions and cases |
|---|---|
| `encoding-size`: alias | no alias, key alias, value alias: `REQ-LIM-001-preflight-no-partial-write` |
| `encoding-size`: key and record within format | key 1/255/256/65,535/65,536; maximum document, v1 rejected: `REQ-LIM-003-key-boundaries`, `REQ-LIM-001-document-boundaries` |
| `encoding-size`: PUT over budget | PUT below/over budget; non-PUT control with value: `REQ-LIM-001-document-boundaries`, `REQ-FOR-003-control-record-shapes` |
| `checked-header`: v1 and nonzero reserved byte | short v1, long v2, v1 reinterpretation rejected: `REQ-LIM-003-key-boundaries`, `REQ-LIM-001-roundtrip-versions` |
| `checked-header`: record limits and availability | valid length, maximum `u32`, truncations; key already bounded by u16 field and v1 guard: `REQ-FOR-003-valid-crc-invalid-fields`, `REQ-FOR-003-every-truncation` |
| `checked-header`: PUT over budget | valid record with full/reduced budget; control types allowed: `REQ-LIM-001-document-boundaries`, `REQ-FOR-003-control-record-shapes` |
| `u64-equal-p`: low and high word | both equal, only low word different, only high word different: `REQ-FOR-004-u64-both-words` |
| `key-equal-p`: length and contents | both equal, different length, single different byte: `REQ-AFF-002-index-identity` |
| `check-outcome`: end, type, low/high TXID, CSN | valid test; end beyond record; PUT type; separate changes to each TXID and CSN word with repaired CRCs: `REQ-FOR-004-prepared-outcome`, `REQ-FOR-004-outcome-provenance-fields`, `REQ-FOR-004-u64-both-words` |
| `verifica-put`: end, type, flags, key | valid case and individual mismatches: `REQ-AFF-002-index-identity`, `REQ-LIM-001-semantic-boundaries` |
| `check-seal`: file, start, frontier, count, checksum | each field mutated, with valid header/body CRCs: `REQ-FOR-003-batch-seal-semantic-corruption` |
| `verifica-lotto`: record count, bytes, u64 offset, file-id per log | each guard rejected separately; segment with ID, control/multiserie with zero: `REQ-LIM-003-batch-budgets`, `REQ-FOR-003-sealed-batches` |
| `verifica-lotto`: known and different stamp, at end and in batch | uniform stamp; disagreeing record; TXID different from SEAL CSN: `REQ-FOR-003-batch-stamp-and-type`, `REQ-FOR-004-batch-txid-independent-of-seal-csn` |
| `verifica-lotto`: ordinary PUT/TOMBSTONE/EDIT | every type allowed; prepared PUT/TOMBSTONE excluded from comparison; OUTCOME and DECISION excluded: `REQ-FOR-003-sealed-batches`, `REQ-FOR-004-batch-txid-independent-of-seal-csn` |

<a id="rami-interni-e-lettura-della-copertura"></a>

## Internal branches and coverage reading

- `verifica-cornice`: consistency checking between length and value range is a
  defensive postcondition. External bytes cannot reach the error branch after
  `checked-header`; an internal defect produces `invariant-violation`.
- `verifica-lotto`: after `max-records + 1` iterations, every normal path has already returned
  SEAL or rejected budget. Loop tail signals `invariant-violation`.
- `check-value-shape`: unexpected default is internal; unknown types are rejected
  earlier by `allowed-flags`.
- Unexecuted definitions, proclamations, and inline copies appear in
  SBCL reports. No exclusion is automatically applied to the report.

These observations motivate analysis; they do not replace recording and review
of coverage exceptions required for C1 release.
