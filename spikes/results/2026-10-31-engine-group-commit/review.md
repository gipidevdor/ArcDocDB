# Integration review and decision inventory

Two static readings cover the final implementation. The first follows admission,
capacity and ownership from both public entry points; the second follows every
durable batch through FIFO publication, error unwinding, fresh recovery and
response delivery. These are two readings by the same author, not independent
external review or whole-engine C1 certification.

- ADR-0080 connects the existing SPK-03/07 decisions and production WAL/Serie
  contracts. No prototype is copied into the product. Each ordinary operation
  retains its own CSN and SEAL (INV-A2/A11); publication and response follow the
  covering strong flush. A sealed prefix after uncertainty is explicitly allowed.
- The single M1 actor owns descriptors, projection, buffers and queue (INV-V4/P6).
  Borrowed request bytes stay stable through completion. No new global lock,
  cross-Serie write or CSN family is introduced. The new CSN capacity check is
  nonmutating under the existing try-lock, not a multiwriter reservation.
- Exact byte equality resolves repeated keys. Cumulative membership controls
  live peaks, append-only arena demand and revision increments. The finite model
  independently checks possible mutation targets at reduced geometry and rejects
  the naive scheme that checks the same initial insertion slot twice.
- Slot credit is conservative: initial exact-key slots and complete free-prefix
  probe groups receive N credits. At most N-1 earlier operations can consume
  the initial candidates. Earlier deleted slots are covered by exact-key probes;
  checking a complete final group preserves the writer's DELETED preference.
- Automatic growth invalidates and restarts the projection (256-step ceiling).
  Paging reserves N worst-case appends before any data CSN. Legacy delta
  reserves each distinct touched key once; at most one renewal covers the group.
  Existing canonical checks remain in all actual mutators.
- Bounds are explicit: eight descriptors/batches/events/connections, finite
  fragment scans, group byte/record limits, u64 CSNs, event generations, batch
  incarnations, index revisions and seqlock credits. Rotation creates fresh
  file-bound buffers; no group straddles ACTIVE files.
- Output is copied only after all publications, I/O retirement and reuse.
  Every admitted error or incomplete nonlocal exit faults the engine. The
  original cause survives; no rollback, retry or partial output is invented.
- Unix grouping admits only complete current-turn frames. GET/PING/rejections
  are barriers. Fresh absolute deadlines remove expired writes before admission.
  No pin, lease or engine borrow crosses a peer send. Encoding is outside the
  group-refusal handler, so a successful write cannot repeat on response failure.
  A resource refusal can split only while the engine is still READY.
- Queue references are cleared on success and failure; engine planning references
  are cleared on every request exit. Uncertain tokens/buffers remain under the
  existing faulted controller until close. No canonical deletion is added.
- Product safety remains 3/speed 2, with complete new engine/local function types,
  condition hierarchy, docstrings and requirement tags. Traceability is regenerated.
  M1 allocation remains a measured residual (the existing M1 qualification scope),
  rather than a zero-allocation or RSS claim.

## New decisions and exercised alternatives

| Decision family | Conditions and alternatives | Verification |
|---|---|---|
| Descriptor/input shape | PUT/value vs DELETE/no value; simple vector/output; count 1..8, prefix/output lengths, valid elements | input/budget case; explicit focused API and mixed-operation cases |
| Segment limits | cumulative ordinary bytes + N SEALs + header; count vs segment quota; rotation/current ACTIVE | input refusal; rotation/model; Unix split case |
| Writer cleanliness | empty FIFO/active I/O, BUILDING group, clean OPEN/free batches | ordinary/group alternation; all fault/reentry and full existing writer tests |
| Finite counters | cumulative event generation, incarnation, CSN capacity/u64, resolved frontier; revision and per-slot credits | CSN exhaustion, revision/credit injection, ordinary registry/Serie suite; invariant branches retain existing fail-stop scope |
| Duplicate projection | exact earlier key vs initial root; earlier PUT vs DELETE | eight-operation mixed duplicate case; deterministic multi-session reference model |
| Fragment demand | PUT new/existing; DELETE present/absent; peak live, accumulated arena, mutation count | load refusal, repeated-key arena and delete/reinsert refusal; reference model |
| Possible new slots | control validity, free vs occupied; whole-group prefix vs full scan, credits sufficient/insufficient | finite model and two negative controls; injected credit refusal; primary suite |
| Legacy delta | absent/present, unique/repeated key; published state; old vs empty delta quota; renewal enabled/disabled/requested | unique reservations, single renewal, old/full and empty/full refusal |
| Automatic backend | RAM vs paged; growth/load/arena/slot reason; retry vs bounded failure; append quota/compaction pressure | model growth/page/return, ordinary automatic budget/compaction suite, all-mode recovery |
| Admission errors | known invalid/resource refusal vs invariant/I/O; READY vs BUSY/FAULTED; complete vs error/nonlocal exit | six injected phases, original-cause identity, no-output/reentry checks; existing unwind suite |
| FIFO publication | independent expected CSN/size, resolved identity, controller state, complete group recycle | exact eight CSNs, following single write, 36-scenario crash matrix |
| Unix eligibility | pending frame, deadline, successful decode, write opcode and READY engine | queued writes, GET barriers, expiry, protocol/server suite |
| Unix queue | count zero/one/many; configured limit 1..8; expired survivors compacted in order | focused queue tests; invalid configuration before clock; native eight-write barrier and paired limit benchmark |
| Refusal/response | unadmitted resource + READY can split; admitted fault propagates; encode/send outside retry handler | segment quota splitting; after-flush fault gives no retry/response; native crash after ACK |

This inventory is not a claim of complete MC/DC. Tests and reduced finite
enumeration support the stated serial integration scope; broader concurrency,
loaded tail and physical power loss remain separate gates.

The C4 observable server is a thin wrapper around the production service and
records group sizes to stderr. The native test uses an explicit SIGSTOP/CONT
barrier on its own child to queue eight complete frames deterministically;
benchmarks use ordinary independently scheduled clients without that barrier.

## Evidence handling

Raw diagnostics, failed development attempts and exact source inventories are
retained losslessly. Documentation rendering retains upstream reference-link
and dependency warnings; product builds treat every warning/style warning as
an error. Benchmarks retain driver hashes, full API/round-trip sample vectors,
exact CSNs, counted canonical flushes, value oracles, negative controls and fresh
recovery. Self-test timing is excluded from final aggregates. Final measurement
campaigns run serially after functional qualification, with all product sources
frozen; results-directory artifacts do not enter the source snapshot.

The final merge includes the independently published offline verifier and its
recovery-source observer extension. Both full product campaigns were restarted
on that combined implementation. All five qualification/measurement inventories
match exactly (1,630 entries). Two pre-merge interrupted campaigns are excluded,
including one SBCL SIGTERM exit reported as zero; the identity self-test rejects
it using the missing build-completion marker.

The summarizer's first negative fixture used lowercase text against its explicit
uppercase output selector and therefore failed to exercise the unsafe reader.
The fixture was corrected, its original helper and failing record retained, and
the negative reader control then passed. The initial archive map also included
a recorder-self-test fixture root without `report.lisp`; the failed copy attempt
and original map are retained, and final copying verifies all existing partial
copies byte-for-byte. Neither correction changed product code or measurements.
