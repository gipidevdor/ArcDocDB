<a id="decisioni-dei-metadati-storage"></a>

# Storage metadata decisions

COD-54 inventory; names are test suffixes in
[`tests/storage/`](../../tests/storage/), all with REQ. This is not MC/DC certification.

| Function and compound predicate | Conditions and tests |
|---|---|
| `spazio-ripetuto`: positive width, start ≤ end | success, zero width, reversed range: `REQ-AFF-008-internal-range-guards`; count beyond space: `REQ-AFF-008-edit-cumulative-budget-and-corrupt-huge-counts` |
| `scrivi-header-segmento`: writer/compaction origin | 1/2 and invalid values: `REQ-FOR-002-segment-header-independent-oracle`, `REQ-FOR-002-segment-header-preflight-preserves-buffer` |
| `verifica-header-segmento`: magic both words | valid and separate alteration of every word with valid CRC: `REQ-FOR-002-segment-header-crc-valid-invalid-fields` |
| `verifica-header-segmento`: origin 1 or 2 | both valid, 0/3 invalid: same oracle/invalid-field tests |
| `verifica-riservati`: three zero areas | all zero; one nonzero byte in every area: `REQ-FOR-002-segment-header-crc-valid-invalid-fields` |
| `verifica-header-segmento`: Serie and segment identity | each Serie byte different, different low/high segment-id word: `REQ-AFF-002-segment-header-identity` |
| `verifica-lunghezza-chiusa`: high u32 zero, low at least 64 and within u32 | 64, 4 GiB−1 valid; 0/63, 2^32 and maximum u64 invalid: `REQ-FOR-003-edit-truncation-counts-and-lengths`, `REQ-AFF-008-edit-cumulative-budget-and-corrupt-huge-counts`. Maximum already imposed by low's u32 type. |
| `valida-valore-edit`: flags 0 or complete | both valid and 1/2/9/255 invalid: `REQ-FOR-003-edit-encoding-layout`, `REQ-FOR-003-edit-truncation-counts-and-lengths` |
| `valida-valore-edit`: ordinary and nonzero next-id | ordinary zero/nonzero; complete maximum u64: same layout/invalid-field tests |
| `cornice-di-controllo`: exact end and expected type | both valid; extra final byte; different type: `REQ-FOR-003-control-record-integrity-before-counts`, `REQ-FOR-003-decision-record-all-truncations-and-bit-flips` |
| `preflight-edit`: closed or removed alias | no alias, each input alias: `REQ-AFF-008-encoder-preflight-no-partial-write` |
| `preflight-edit`: complete or zero next-id | ordinary valid/invalidated; complete maximum u64: layout and preflight |

<a id="decisioni-semplici-significative"></a>

## Significant simple decisions

Byte budget before CRC: `REQ-AFF-008-byte-budget-before-crc-scan`. Counts,
cumulative outcomes, and capacity: budget/corrupt-count tests. Exact consumption:
truncations and extra bytes. Preflight: destination unchanged on every rejection.
DECISION: counts 2/3/65,535 valid, 0/1 invalid, encoder 65,536 rejected.

<a id="ramo-interno-e-copertura"></a>

## Internal branch and coverage

`scandisci-chiusi` starts at start and every advance is returned by
`spazio-ripetuto`, which requires start ≤ end, checks count before
multiplication, and returns an offset ≤ end. Final `closed-range` check
is defensive against an internal defect; external data cannot take its error
branch after these checks. The branch is not forced with a mock to present
complete coverage. Definition/proclamation forms remain in the report.

This explanation supports data interpretation; coverage exceptions and
independent review remain criteria to close for C1 release.
