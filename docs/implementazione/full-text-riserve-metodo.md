<a id="riserve-full-text--metodo-e-decisioni"></a>

# Full-text reservations — method and decisions

Increment dated October 17, 2026 for ADR-0054, REQ-SEC-003/006/010, and REQ-CON-002.
Before execution: manual 25-byte NNTP document fixture, two configurations,
73 payload bytes, and U=145 for each. Independent model over 128 operations;
comparisons of copied runs and subject/body searches. Cumulative boundaries, rejected last
configuration, rotation, cancellation during every small-copy unit,
stale generation/lease, sixteen generations, and four independent writers.

Heap allocation: 100 warmups, full GC, 1000 reservations/copies/queries/cancellations; IDs 1 and
UINT64_MAX. No latency, RSS, or realtime-duration assertion. Measurement separate
from diagnostic coverage, which excludes allocation tests. Preserve original
outputs and failures; `make check` also verifies integration, tools, and spikes.

| Compound decision | Conditions to verify |
|---|---|
| Construction | queue, 1..16 configurations, ID/generation order, eight indexes and two generations, capacities and costs before allocations |
| Lease | canonical pool, queue thread and generation, healthy state, no pending effect |
| Slot | canonical pool object, positive captured generation without wrap |
| Sources | all DONE, current canonical configurations, no borrower, same row, SEALED run, and consistent cost |
| Admission | all physical capacities, cumulative delta/staging, all file bounds, row not already retained |
| File | fixed cost once; request larger than empty file distinct from rotation before append |
| Copy | loan still owned; one byte/word or transition per step; result only after every index |
| Cancellation | only before transfer, exact idempotent release until reuse; stale/transferred rejected |
| Transfer | only READY, staging returned, delta/file/slot preserved without reclamation by absence |
| Interruption | incomplete effect or lost source => pool FAULTED, references retained, Serie fail-stop at caller boundary |

Full C1 qualification and MC/DC remain open. Both final readings must distinguish
this local reservation from general document validation and binding to exact
PUT bytes. Pool performs no append, SEAL, PREPARE, DECISION, H/ACK, or MVCC query.
It is neither catalog allocator nor durable inventory of an existing ACTIVE.

<a id="due-letture-del-17-ottobre-2026"></a>

## Two readings dated October 17, 2026

Reading 1, data and budgets: reread every preflight before effect, fixed cost
once per file, sums over all generations, and request-too-large/rotation
distinction. Added a test with first configuration admitted and second rejected
by tokens or bound. Copy widths use existing-run constants.

Reading 2, ownership and faults: reread borrowers, single-task release on copy
completion, captured generation and lease, cancellation before transfer, and permanent
costs afterward. Incomplete exits preserve partial effects and require fail-stop.
Not independent review: PUT binding, WAL pipeline, prepared, publication, and
quiescence remain to connect. Factory requires authoritative pool and new ACTIVE;
it does not prove canonical identity or erase costs of other pools or frozen views.
