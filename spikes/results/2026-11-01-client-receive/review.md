# Bounded client receive — two C1 readings

REQ-IPC-002, REQ-LIM-003, REQ-AFF-004/008; existing ADR-0055/0056 framing and
admission. This refines private client buffering; no requirement, format, actor,
wire capability or durable operation changes, so no replacement ADR is needed.

## First reading: grant, spans and authority

Each client adds two owner-local indices to its already reserved input buffer.
Before receiving, check simple octets and 0 ≤ consumed ≤ received ≤ limit+4 ≤
capacity. Compact only a nonempty unread suffix after the previous response
view's lifetime ends. Self-overlapping REPLACE preserves exactly the unread
span; no storage is allocated, grown or borrowed to another owner.

An incomplete prefix may fill only the trusted negotiated grant, already
reserved before any peer byte. Prefix completeness is independent of a positive
recv result: examine it only after four bytes. Invalid zero/oversized bodies fail
before any body decode. Remaining body reads use the existing exact-span
transfer. Decode exactly the first frame's body; retain the remainder as opaque
bytes. Read-ahead does not validate or authorize another response. This changes
the client's physical read boundary, not the server's prefix-first admission.

The first decoded envelope remains immutable and bound to the same private
buffer. The existing complete direction/kind/ID/status/CBOR/document paths still
run once per owned exchange. The next request must finish sending before a
retained response is inspected. Invalid outgoing preflight does not consume
retained bytes or the request ID. Authoritative rejection consumes one response
and restores READY; it does not discard the following opaque suffix.

## Second reading: deadlines, cleanup and bounded work

A fresh absolute-deadline check precedes any retained-byte reuse, including fully buffered completion.
With no unread suffix, the existing prefix-attempt clock supplies that check without duplicating it. Each
prefix I/O attempt also checks the same deadline. At most four positive steps
complete a prefix; EINTR/EAGAIN park through the existing finite waiter without
renewal. Partial bodies retain the existing transfer loop and deadline. Final
pre/post document-copy deadline checks remain unchanged. No response can be
returned successfully after expiry because it was read ahead earlier.

EOF, I/O faults, malformed/uncorrelated data and incomplete nonlocal exits use
the existing close boundary. Mutating requests retain OUTCOME-UNKNOWN after a
send attempt; reads do not become mutation uncertainty. Close clears both
indices before FD handoff, including when close itself fails, and remains
idempotent. It consumes buffer authority rather than promising to wipe bytes.

No syscall, pin, lock, thread, wait primitive, durable publication or cross-Serie
write is introduced. Native transfers retain their existing span verification
and injection. Prefix work, self-copy and every stored span are bounded by the
fixed negotiated capacity; waits retain the original deadline. Envelope/protocol
allocation remains and is measured separately. Functions have complete FTypes,
REQ tags and ownership/pre/post/error contracts, safety 3/speed 2/debug 2, and
stay below 60 lines. Unchanged engine/I/O/WAL/index sources inherit the immutable
base qualification; all affected local and CBOR paths are qualified again.

## Compound decisions and detection

| Boundary | Detection |
| --- | --- |
| Valid simple input and ordered offsets within grant/capacity | bad type, consumed > received, received > grant and short reservation independently rejected before input I/O |
| Compact only consumed > 0 and remaining > 0 | first call, empty suffix, complete coalesced frames and every partial next-frame cut |
| Retained suffix / no suffix, entry clock before deadline | complete retained GET and mutation expire before decoding; read error versus unknown mutation |
| Prefix attempt clock before deadline | clock expires between receive entry and first input attempt; no input syscall |
| Prefix incomplete / complete | every byte split and whole-frame one-recv test, including 60,000-byte document |
| Progress / wait / EOF / unexpected step | fragmented progress, EINTR/EAGAIN with poll, EOF before/after prefix, injected impossible status |
| Prefix within negotiated limit | zero/4,097 under a 4,096-byte body grant; canaries beyond 4,100 unchanged |
| Body complete / incomplete | entire frame, partial prefix and every partial body cut |
| One response authority despite read-ahead | three distinct IDs/results in one recv; sends precede each result; malformed next response fails only on its own exchange |
| Rejection and preflight leave next response intact | all five rejections followed by valid GET; insufficient output leaves indices/ID/send count unchanged |
| Failure and nonlocal cleanup | EOF/I/O/error/throw close with cleared offsets, retained cause and no retry; mutating ambiguity remains |

The first new fixture variants failed strict compilation due to an incorrect
accessor name and parentheses; their exact sources and terminal diagnostics are
retained. The successful focused run includes the unchanged regression suites.
This review is not a claim that later performance and qualification runs passed.
