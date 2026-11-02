# C1 integration review

Two author readings completed before the first execution, 2026-11-02. These are
sequential readings by the implementing author, not independent approval.

First reading follows data from public preflight through encoding, BUSY exchange,
scoped envelope, complete shared grammar, exact copy, final deadline and scalar
return. Second reading compares the extracted validator with base
`059e91b1`: validation branches, order, condition reasons, error/null handling and
mutation return arity are retained. Only successful results change internal
representation to private scalar spans; persistent GET copies them afterward.
The fixed output grant is the exact ordinary GET predicate, now called by both
APIs. ASDF loads this helper before the new public function.

Requirements: REQ-IPC-002, REQ-TXS-002/003, REQ-IDX-001/010, REQ-LIM-003,
REQ-AFF-004/008. Existing ADR-0085 and caller-buffer contracts apply; no requirement,
durable format or admission change requires a new ADR.

Invariants checked: owner and READY before effects; BUSY prevents callback reentry;
one request/ID/absolute deadline; full response correlation; CSN belongs to the
verified document; no copy of malformed/rejected/absent data; no borrowed
envelope/span or caller target escapes; failure closes reads without mutation
uncertainty; conditional writes preserve independent strong CSNs and stale-token
conflicts. No lock, shared state, reader concurrency or durable operation is added.

## Decision table

| Decision | Conditions and planned witnesses |
|---|---|
| Shared output preflight | Simple octets; START is a bounded index; offset fits; target distinct from key, input, output. Each false case is refused before sends/ID/copy. Existing ordinary GET tests still apply. |
| Remaining output grant | Below/exactly/above 60,000 bytes, offsets 0/4, max document and unchanged canaries. |
| Admission | Wrong handle, thread, state, BUSY callback reentry, missing version capability; all precede send. |
| ID bound | u32/fixnum boundaries, max u64 success and following refusal. |
| Version dispatch | Opcode 6 + operation 0 + target selects into; operation 0 without target preserves persistent copy; operations 1/3 stay on mutation adapter. Legacy/version/group tests cover other arms. Zero is true in Common Lisp. |
| Response header | RESPONSE kind, exact pending ID, error code with exact null. Each invalid arm closes; valid status 1..5 rejects and restores READY. |
| Result boolean/token | Exact array/boolean, positive success u64, absent zero + null, minimal unsigned token; present/null document remains distinct from absent. Full u64 tokens are validated. |
| Found document | Exact end AND valid bounded minimal CBOR before copy. Wrong shape, trailing document, invalid/nonminimal/truncated/oversized document are refused. |
| Scalar adapter | Operation zero returns exactly three GET values; mutation returns exactly two values. No extra span values escape. |
| Into target | Private input alias rejected; range checked before parser and exact span checked before copy; copy only for FOUND. Public full grant dominates internal range needs. |
| Completion | Final deadline before/after copy; error/throw before send or after copy; cleanup consumes ownership, copied bytes remain unauthorized. |

All added product functions have complete FTypes, pre/post/error contracts and REQ
tags, safety 3/speed 2/debug 2, and at most 60 lines. No new loop is added to the
product. Existing bounded parser/transfer work and copy primitives remain in use.
Allocation is to be measured with an allocating persistent control; no universal
COD-30, MC/DC, Linux, power-loss or production-performance claim follows.

The process fixture uses actual product clients and the existing C4 server that
checks resident/paged mode before READY. It never opens/replays storage itself.
Both formats and modes exercise competing current tokens, a maximum-sized
document, delete/reinsert, insufficient negotiated frame, SIGKILL and subsequent
conditional write with fresh CSN. The runnable public example covers clean reopen.
