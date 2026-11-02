# C1 review and decision table

Two sequential author readings completed before execution. First follows the
new public call through READY/owner admission, complete shared validation,
conditional projection, the existing writer and both result copies/cleanup.
Second compares every changed flag decision with the original explicit-vector
path and rereads the actual Unix call site. These are author readings, not an
independent reviewer approval.

REQ-TXS-002/003, REQ-WAL-002/006, REQ-IDX-013, REQ-LIM-003 and REQ-AFF-004/008
remain governed by ADR-0086/0087. No format, requirement, CSN source, capability,
durability or isolation decision changes. One new exported function has a full
FType and pre/post/error/ownership contract. Product policy remains safety 3,
speed 2, debug 2; functions remain within 60 lines. No product loop or wait is
added, and existing count/key loops are bounded by eight and prior validated
array lengths. No new object, array, lock or global mutable state is introduced.

| Decision | Condition witnesses and oracle |
|---|---|
| Condition domain/grant | NIL is complete all-conditional; valid explicit flags preserve old semantics; a dedicated integration regression rejects wrong vector type, short vector and invalid byte before any probe. Public arrays/count refusals precede probes and effects. |
| Operation validation | Descriptor type AND (NIL OR flag 0/1). New invalid-last and old malformed-flag cases preserve all outputs before any lookup. Selected prefix excludes an invalid unselected tail. |
| Independence | NIL OR explicit flag 1 requires a key different from every earlier key. Equal byte keys in separate arrays refuse; old later ordinary same-key operations still work. Count-one loop has no predecessor. |
| Probe | NIL OR explicit flag 1 probes; explicit zero retains ordinary behavior. Public all-conflict at full ACTIVE proves NIL cannot become ordinary writes. Real lookup and fault/throw tests apply. |
| Admission projection | Explicit array AND flag zero admits ordinary entries; otherwise only equality of complete u64 expected/current tokens admits. Mixed, all-match/all-conflict, absence, delete/reinsert and maximum expected-u64 witnesses use an independent model. |
| Output ownership | Existing simple-array/count/alias checks, private scratch guards, key/value output alias, separate expected/tokens and unchanged tails. Selected buffers remain exclusive through completion. |
| Writer entry | Kept zero skips preflight/maintenance/CSN/append/flush; positive count uses the same cumulative writer and strong flush. Counts 1..8, capacity refusal and mixed cohorts verify no splitting. |
| Reentry/lifetime | READY and owner precede cleanup scope. Foreign owner, BUSY callback with full GC and closed engine refuse; outer projection remains intact. Every exit clears borrowed operations and scalar results. |
| Durable failure | Each SEAL is its record's atomicity point. Covering strong flush/FIFO publication precede output. Probe failure has no commit; error/throw after flush faults, authorizes no output and recovers canonical committed values. |
| Unix bridge | Explicit request invokes the exported engine boundary once; mixed same-turn collector retains its explicit-flag internal entry. Existing protocol/deadline/lost-response/SIGKILL fixtures and the runnable example check the full path. |

The public wrapper adds no effect beyond forwarding NIL and the selected count.
Meaningful pre/post assertions and all failure handling remain in the existing
shared validator, guarded probe and writer boundary; no checks are bypassed.
The unchanged 208-byte projection payload is independent of ACTIVE adoption.
Allocation evidence is limited to actual all-conflict legacy/resident calls with
fixnum tokens and preallocated outputs. Mutation allocation, paged I/O, complete
MC/DC/C1 qualification, Linux, power loss, historical MVCC and multiseries remain
outside this campaign. The selected driver uses original suite runners with
explicit exclusions and exact observed IDs; it does not claim full-suite totals.
