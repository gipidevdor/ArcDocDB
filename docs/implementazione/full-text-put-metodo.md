<a id="put-full-text--metodo-di-verifica-e-decisioni"></a>

# Full-text PUT — verification method and decisions

Method dated October 17, 2026, before tests: ADR-0054, REQ-SEC-003/006/010,
REQ-WAL-005, and REQ-CON-002. A private owned frame, created by existing codec,
supplies value to all tasks and the same bytes to batch append.

Fixture: NNTP Message-ID as opaque key, frozen 25-byte subject/body CBOR,
complete-record comparison with independent encoder, sentinel prefixes/suffixes.
Mutating caller key/value after start must leave run and WAL unchanged.
Versions v1/v2, ordinary/prepared, and maximum u64 TXID in two words; later SEAL
must restamp only ordinary records. Memory/work/format/batch-capacity boundaries,
rejections without transferred costs, cancellation before append, stale tokens, and incarnations.

Heap allocation: 100 warmups with preparation/reservation/copy/cancellation, full GC,
then 1000 preparations/reservations/copies/appends/queries on preallocated batches;
measurements separate from instrumented coverage.
Four private contexts may share only read-only configurations; finite waits.
Preserve commands, actual sources, original output, and every failure.

| Compound decision | Conditions |
|---|---|
| Construction | Ordered canonical configurations, all capacities and cumulative cost before allocations |
| Start | Token/state, nonalias u8 input, u32 row, consistent prepared and TXID, generation without wrap |
| Frame | v1/v2 limits, key/value copy and CRC before analysis; no retained external source |
| Analysis | Same private span for all, cumulative work, all DONE and current worker CRC/span attestation |
| Reservation | Canonical lease, private tasks, current configurations; handles not exported during copy/cancellation |
| Append | Current owned attestation, format/segment and open batch, SEAL space; only metadata and copy under lease |
| Binding | Transferred slot, captured batch/incarnation/ordinal/range; old reused batches rejected |
| Fault | Interruption after transfer => request, pool, and batch FAULTED; reservation preserved, no rollback or ACK |

This method closes neither C1 qualification nor MC/DC. General document contract,
runtime/pool/log canonical identity, publication before H/ACK, prepared outcomes, delta
map, MVCC, and retirement after quiescence remain. Proposed row is not hint ordinal.
Contract-versioned PUTs not introduced: API produces only already-supported flags 0 or prepared.

<a id="due-letture-dello-stesso-autore"></a>

## Two readings by the same author

First reading: followed frame, CBOR span, and every generation through WAL copy;
no retained external input or reservation handle exposed before append.
Checked limits and rejections before effects, token saturation, two TXID words,
distinction between proposed row, batch record, and future physical identities.

Second reading, after targeted tests: followed cancellation and nonlocal exit,
retained costs, request return to worker, and batch reuse. Incarnation-saturation
check moved into public `verifica-riuso-lotto` preflight,
so Serie controller sees it before its own mutation. Captured-range
limits strengthened and new group included in central CI catalog.
These readings are not independent review.

Integration rereading identified body-CRC calculation in writer preflight,
contrary to ADR-0039. Complete attestation moved into worker after
analysis; private generation, state, and frame ownership guarantee lifetime.
Writer checks current attestation, format/segment, state, and capacity without
body scans. Two new tests cover corruption before attestation and
a CRC probe with negative control of old path, over two sizes.
A thirteenth mutant verifies attestation cannot be ignored.
Legacy `aggiungi-record` path remains outside this increment.

The [evidence](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-17-fulltext-put-dev-targeted/README.md)
also preserves both compilation stops and separates final verification.
