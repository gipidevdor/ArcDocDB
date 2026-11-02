# Scoped response envelopes — two C1 readings

REQ-IPC-002, REQ-LIM-003, REQ-AFF-004/008, REQ-WAL-006. ADR-0055/0056 and the
negotiated operation ADRs remain: internal representation/lifetime changes no
requirement, wire format, capability, durable state or atomicity point.

## First reading: immutable data and one validator

All envelope slots remain read-only. The private constructor keeps its original
keywords and explicitly checks the complete u64 ID before splitting it into two
u32 fields. Both fit fixnums on the supported 64-bit targets; `envelope-id`
reconstructs the full u64 value, including the fixnum and u64 boundaries. No type
is widened or check disabled to enable stack allocation. The constructor is
declared inline before DEFSTRUCT so the compiler can honor its bounded lifetime.

`%wire-envelope-values` is the original complete validator with only construction
removed: API ranges/options/scratch, frame/hello limits, minimal complete CBOR,
ordered maps, shape/version/kind/status, direction/IDs and exact capabilities.
It returns scalar fields, with no result list. The public decoder constructs one
fresh persistent immutable envelope after this validator. Server queues still
own persistent envelopes of the same public type, and no server path calls the
private scoped consumer.

`call-with-local-response-envelope` uses the same validator and constructor. Its
one fixed-size view exists only during its internal consumer call. No caller may
retain or return that object. Its immutable buffer is already owned elsewhere,
and does not become a stack-owned otherwise-inaccessible part. Numeric fields
and independent result/document copies may escape. The only product caller is
the synchronous client wrapper; no application callback receives the view.

## Second reading: frame acquisition and all exits

`receive-local-client-frame` contains the original acquisition steps and returns
only the complete end offset. Full-grant compaction, prefix/body bounds, opaque
coalesced suffix, absolute deadline and I/O/EOF behavior are unchanged. The cold
handshake wrapper still constructs a persistent envelope. Hot response handling
finishes I/O before creating the scoped view.

The existing result dispatcher becomes `finish-decoded-local-client-response`:
its fresh deadline, kind/ID correlation, operation-specific complete validation,
copying and post-copy deadline are unchanged. It neither stores nor returns its
envelope. The small wrapper has one explicitly scoped local consumer capturing
existing arguments; it returns only the dispatcher's results. Normal return,
error and throw unwind both fixed stack objects. No pool, mutable global, lock,
pin, retry, shared write or cross-Serie coordination is introduced.

Exchange state/credit and cleanup remain in the original owner boundary. Known
rejections preserve READY; incomplete reads close and incomplete writes retain
OUTCOME-UNKNOWN with their original cause. Caller output remains authorized only
on successful return, including late failures after copying. Private group spans
are still cleared by the existing outer API cleanup. Large numeric conversions,
allocating legacy APIs and errors have no general nonallocation promise.

## Decisions and detection

| Boundary | Detection |
| --- | --- |
| Original full validator decisions | existing independent wire options, bounds, direction, ID, capacities and malformed-frame cases; shared helper has no bypass |
| Constructor ID before splitting | negative, oversized, nonnumeric IDs rejected through an opaque constructor call; full u32/fixnum/u64 numeric boundaries |
| Immutable public and queued representation | distinct persistent objects, no SETF readers, complete numeric/capability fields after scoped calls/GC; existing actor/write-queue cases |
| Scoped success before external return | independent copied GET survives nested scope, stack reuse, buffer overwrite and full GC |
| Invalid frame before consumer | 14 malformed shapes/versions/kinds/IDs/statuses/CBOR/order/depth cases; zero consumer calls and subsequent valid scratch reuse |
| Fixed view live during nested/GC use | separate nested scratch, both views' IDs verified, GC while outer view is active |
| Error/nonlocal exit | exact original condition and throw value, scratch reused after unwind; existing public late-error/throw/cleanup tests |
| Client ID and buffered authority | consecutive responses across u32/fixnum/u64 boundaries; old copies after 128 further coalesced PINGs |
| Client ownership/reentry | GC in injected clock and rejected BUSY reentry, one send/receive and one consumed credit |
| No envelope managed allocation | 10,000-call product test with allocating persistent negative control; isolated and public Unix C4 campaigns |

Functions have complete FTypes, ownership/pre/post/error contracts and REQ tags,
with safety 3/speed 2/debug 2. New work is constant per envelope and bounded by the
existing frame/CBOR limits; normal client scope depth is one. These readings do
not qualify production SLOs, power loss, background compaction or concurrent
engine readers. Actual qualification and byte-retention receipts are in the
[report](report.md).

## Native readiness boundary and compiler refinement

The existing `poll` alien entry is declared inline before definition. The function
body, ABI, pollfd layout, trusted callback/owner checks, exact count/errno handling,
timeout and one-syscall pin extent are unchanged. The inline call avoids boxing
its SAP argument. A native disabled-FD allocation test covers capacities one/nine;
all existing real-pipe/HUP, timeout, EINTR, error, reentry and domain checks remain
in the I/O suite. The C4 fixture retains an out-of-line allocating negative control.

Inlining the three private client helpers changes compilation only: one shared
validator definition and one dispatcher remain. It removes call/closure overhead
without weakening safety 3 or the no-escape contract. Only scalars and independent
copies leave the consumer; protocol/rejection conditions retain numeric reason,
status or offset, never the envelope. Exact source copies bind the first variant;
the final nine-suite qualification and full repository check cover the refinement.
