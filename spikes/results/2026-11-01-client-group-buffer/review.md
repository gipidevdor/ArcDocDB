# Grouped caller output — two C1 readings

REQ-IPC-002, REQ-IDX-001, REQ-LIM-003, REQ-AFF-004/008. ADR-0055/0056 framing
and ADR-0084 grouped-read semantics remain. This additive client representation
changes no requirement, format, capability, server schedule, durable operation or
atomicity point, so no replacement ADR is required.

## First reading: bytes, validation and ownership

The caller owns a stable selected simple-vector prefix of 1..8 binary keys, one
simple UB8 arena and one simple UB64 lengths array. Check output types, START,
count capacity and the full 65,536-byte grant before ID/I/O. This bounds aggregate
output by the whole M1 frame rather than reserving count × maximum-document
bytes. Reject both wire-buffer aliases and both private UB64 scratch aliases,
then every selected key/arena alias. Displaced, adjustable and fill-pointer
arrays are excluded by the simple array types. Unselected input tails are not
inspected. The existing encoder validates every selected key and complete
outgoing frame before send or ID consumption.

One shared response helper preserves the original envelope/buffer binding,
RESPONSE kind, exact count/end, authoritative error/null and every minimal
CBOR/document check. Its only new result is aggregate document bytes; no vector
is allocated. Packed private spans remain opaque until the whole group validates.
The legacy consumer still creates independent vectors, including duplicate
keys. The new consumer checks both direct aliases and output capacities before
parsing/copying; after parsing it checks the exact target range before any copy.
Present documents are packed in order, zero-length absence does not advance the
cursor, and lengths are stored only after all document copies. A CBOR null
document occupies one byte. Caller prefix/tail bytes and unselected lengths stay
unchanged. No wire span, buffer reference or new result/document vector escapes.

## Second reading: exchange, deadlines and failure boundaries

The new API reuses opcode 5 and the same one-credit owned exchange. The existing
numeric RESULTS parameter carries lengths on this path, with the same UB64
representation as the other numeric outputs. No client slot, mutable global,
thread, pin, lock, syscall or cross-Serie coordination is added. The small group
finisher is extracted without changing the legacy post-decode deadline check.
Only successful return authorizes arena and lengths. Late clock/error/nonlocal
exit can leave unconfirmed caller bytes; no rollback or partial-success promise
is made. Preflight, malformed frames and authoritative rejections precede all
caller writes. Rejection keeps READY; other incomplete reads close, retain the
primary cause and do not become mutation OUTCOME-UNKNOWN or retry.

All encoded-exchange exits clear fixed private spans. Alias refusals happen
before this cleanup scope, so a refused caller output alias is itself not
mutated by clearing scratch. Existing owner/READY, negotiated capability and
last-u64-ID rules remain. Parsing and copying are bounded by eight members and
one fixed frame; waiting remains in the existing absolute-deadline I/O boundary.
Functions have complete FTypes, pre/post/error/ownership contracts, REQ tags and
safety 3/speed 2/debug 2. The shared finisher is forward declared before use and
keeps the common dispatcher small. No new durable state or deletion is involved.

## Decisions and detection

| Boundary | Detection |
| --- | --- |
| Owner / READY / negotiated READ-GROUPS | bad handle/state, foreign thread with bounded join, unnegotiated handle; no ID or transfer |
| Selected key vector/count in range | empty/type/count negatives; selected prefix ignores invalid and aliased tails |
| Simple arena/lengths and valid START/capacity | wrong element types, adjustable/displaced arrays, empty metadata, invalid/out-of-range starts |
| Complete output grant | short or shifted 65,535-byte grant rejected; exact grant at zero/nonzero START; aggregate 65,472 bytes |
| Private/selected aliases | input/output, span/CSN arrays and selected key independently refused without writes or cleanup mutation |
| Valid key/frame/ID | bad/empty/oversized key, small negotiated request budget, last u64 ID once |
| All response members before copying | valid first member and corrupt final member, count/trailing errors, wrong ID/kind/status, EOF/fragmentation |
| FOUND / ABSENT / null / duplicates | packed ranges, positive lengths, absent zero, all-absent arena unchanged, exact canaries and independent legacy copies |
| Known rejection / reuse | all five statuses preserve outputs and READY, followed by valid buffered response |
| Deadline before / after copy | untouched early output; complete but unconfirmed late output, closed client and cleared spans |
| Error / throw before send and after copy | original cause/control retained, no read mutation uncertainty, no retry, private spans cleared |
| Real engine/recovery | formats 1/2, resident/paged, >60 KB aggregate, absence/null/duplicates, overflow/reuse and SIGKILL/reopen with next CSN |

Allocation and performance, two-runtime affected qualification, static/spike/docs
checks and exact source identities are recorded separately. These readings do not
close full-engine, platform, MC/DC, power-loss or production-performance gates.
