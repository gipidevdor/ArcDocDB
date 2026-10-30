<a id="decisioni-dei-lotti-wal"></a>

# WAL batch decisions

COD-54 inventory; [tests](../../tests/wal/), REQ IDs in names. Does not certify MC/DC.

| Compound decision | Cases |
|---|---|
| kind/file-id/version configuration | segment, zero control/multiserie id, nonzero control id, v1/v2 |
| Batch budget | minimum SEAL, exact last record+SEAL, insufficient bytes, full count, budget 0/over cap |
| Ordinary and non-prepared record | restamped PUT/tombstone/EDIT; prepared PUT, OUTCOME, and DECISION preserved |
| durable ≤ start and end within fixnum | zero/nonzero offset, historical frontier, false future frontier, overflow |
| Group identity and contiguity | incorrect file-id/log/version, first batch, second contiguous and out of order |
| Batch or byte budget | exact group, full slot, full bytes; file too small for whole group |
| async on data log | written/durable covered; sealed/faulted excluded, async control/multiserie rejected |
| Batch/log/group ownership | double group, already-owned batch, premature reuse, canceled ready, concurrent flushes |

Internal safeguards and private-structure corruption paths remain in
sb-cover denominator, alongside definitions and proclamations. Concurrent CAS
operations are not qualified by a coverage percentage: tests use explicit events
to force an ongoing flush and test rejection of others. Timeouts bound
fixtures; they are not correctness arguments. Independent C1 review is still required.
