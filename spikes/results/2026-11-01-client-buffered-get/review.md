# Caller-buffer GET — two C1 readings

REQ-IPC-002, REQ-IDX-001, REQ-LIM-003, REQ-AFF-004/008; existing ADR-0055/0056
framing/admission and ADR-0088 actor scheduling remain applicable. This adds a
client output API without changing a requirement, wire format, server scheduling
or durable operation. No new architecture ADR is required for the buffer variant.

## First reading: input, ranges and verified values

`client-get-into` accepts external terms and first applies the existing exact
client owner/READY check. TARGET must be a simple octet vector; START must be a
valid index no greater than its length. Reject EQ aliases with the key and both
client wire arrays. Displaced/adjustable vectors are excluded by the type, so
EQ covers possible array-storage aliases. The caller owns key/target exclusively
through the exchange and does not mutate/reenter through trusted clock callbacks.
A full 60,000-byte remaining grant is checked before encoding, clock/I/O or ID
consumption. No allocation/growth or size negotiation is hidden in the API.
The existing outgoing key/frame/ID preflight and exchange state machine follow.

One shared response-input checker retains bound envelope identity, scratch/type,
RESPONSE kind, exact error NULL and authoritative rejection semantics. One shared
GET span parser retains the original boolean, absent NULL, byte-string extent,
trailing-data, maximum document and complete minimal CBOR checks. The old API
copies its independent vector from these spans; the new private consumer copies
into the supplied prefix. Spans stay private to immutable input, never escape or
survive a receive. Check target alias and exact range before REPLACE. Surrounding
bytes and absence remain unchanged. No verified document vector is allocated by
the new copy path; existing per-frame envelope/protocol allocation remains.

## Second reading: lifecycle, deadlines and failure authorization

The shared exchange retains one request credit, ID correlation and original
absolute deadline. Optional target/start arguments are call-local and never
stored in the client. Existing calls default to NIL/0. No lock, thread, wait,
shared mutation or transport syscall is added; the new bounded work is one
validated document copy. There is no effect on strong publication or recovery.

READY/input/ID/frame refusals leave the ID and connection unchanged. An
authoritative rejection consumes the request ID and restores READY. Malformed,
uncorrelated, EOF, I/O and expired responses close once through the existing
read-only boundary, with no mutation outcome-unknown conversion or retry.
Fresh deadline checks remain before decoding and after copying. Post-copy
expiry/error/nonlocal exit can leave bytes in caller storage, but no successful
return authorizes them. Document this explicitly instead of promising rollback.
The old API still returns an independent copy. Every incomplete nonlocal exit
retains cleanup ownership through the existing UNWIND-PROTECT.

All added C1 functions have requirement tags, full FTypes, pre/post/ownership
contracts and safety 3/speed 2/debug 2. There is no new mutable global/slot,
durable atomicity point, file deletion, cross-Serie dependency or dynamic wait.
The underlying frame/document sizes already bound parsing and copying.

## Compound decisions and detection

| Decision / boundary | Detection |
|---|---|
| Correct owner and READY state | wrong type/state/foreign thread; zero transfer and unchanged ID |
| Simple octet TARGET and index START in range | scalar/general/adjustable/displaced arrays; NIL/negative/float/oversized starts |
| Distinct key/input/output storage | each EQ alias independently rejected before transfer |
| Remaining full output grant | zero, one, 59,999; exact 60,000 at zero/nonzero offsets; no growth |
| Valid key and available u64 ID | invalid/empty/oversized key, exhausted ID, last valid ID exactly once |
| Correlated RESPONSE | wrong ID/kind/status, fragmented/short/EOF frames; output unchanged |
| Authoritative rejection with NULL | all five statuses preserve buffer and restore READY; malformed error closes |
| Complete shared GET grammar | invalid flag/absence/item count, empty/nonminimal/multiple-item documents, maximum payload |
| FOUND / ABSENT | byte count, exact copy, prefix/tail canaries, absence unchanged, API reuse with legacy copy and PING |
| Deadline before / after copy | no pre-copy mutation; post-copy bytes unconfirmed and client closed |
| Error/nonlocal exit before / after copying | same cause or original throw, close once, no retry or unknown write outcome |
| Real service/recovery | both formats and primary modes, maximum document, frame rejection/reuse, SIGKILL/reopen and next CSN |

The immutable driver comparison records allocation, API latency, checked-window
throughput and aggregate GC CPU separately. Correctness, source identities,
strict two-runtime affected suites, static/spike and documentation results are
recorded separately; this reading alone does not certify a completed campaign.
