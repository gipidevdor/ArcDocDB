# Explicit Unix groups — author review

Two local readings cover bounds/negotiation and ownership/error transitions.
This is author review, not independent review or MC/DC qualification.

- Default handshake encoding is byte-identical. New capability syntax is exact,
  bounded and ordered. A client validates requested versus returned capabilities;
  capability state is connection-local and reset at close/accept.
- Every member is scanned before any copies. Span arrays have eight fixed slots;
  key/document limits and minimal CBOR validation reuse existing single-command
  validators. Total frame preflight precedes client encoding. No untrusted Lisp reader.
- Explicit groups drain earlier writes and bypass the opportunistic collector.
  The per-connection administrator limit is retained. Capacity rejection has no
  individual fallback. Fresh deadline checks follow draining and complete decode.
- The engine owns all durable preparation, independent SEALs, strong flush and
  FIFO publication. An engine fault propagates, and response encoding never
  causes an admitted group to be retried. Workspace cleanup runs on every exit.
- Client results first enter internal u64 scratch. Exact count, positive increasing
  CSNs, correlation and absolute deadline precede caller output. Known rejection
  leaves READY; other mutating failures close with an unknown outcome. Nonlocal
  control is preserved through close, including secondary close failure.
- Legacy requests share the exchange cleanup and final-deadline guard. A legacy
  internal unknown opcode uses count zero and retains normal rejection decoding.
- New helpers have complete FTypes, REQ tags, safety 3/speed 2/debug 2, bounded
  loops and pre/postcondition docstrings. No new syscall or dependency. Bounded
  argument copies remain allocations, as in the existing Unix boundary.

| Decision | Executed alternatives in targeted tests |
|---|---|
| Negotiation | Exact old/new bytes, two decoder values, missing/unsolicited, invalid lists and booleans |
| Input/admission | Mixed/repeated keys, empty/nine/administrator count, bad last member, exact key/document/frame budgets, insufficient engine capacity |
| Publication | One flush, distinct CSNs, both formats and legacy/resident/paged primary profiles, reopen/new CSN |
| Barriers/deadlines | Earlier write, later GET, expiration after draining/validation/final receive/response decode |
| Response | u32 carry/u64 maximum, count/order/last-CSN/correlation errors, every rejection status, unchanged caller output |
| Ownership | Fragmented transfers, EINTR/EAGAIN/EOF, ID and output preflight, nonlocal transfer, secondary cleanup error |
| Real processes | Negotiated one-client group, SIGKILL after acknowledgment, response lost after strong completion, recovery and next CSN |

The existing full engine suite separately covers cumulative admission,
rotation/compaction/migration and the sealed-prefix byte-cut/SIGKILL matrix.
No performance conclusion follows from functional checks.
