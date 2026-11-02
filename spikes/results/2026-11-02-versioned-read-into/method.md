# Versioned caller-buffer reads — preregistered integration method

Base: `059e91b1f17609c14ddf597853ec54799d41c37d`, macOS ARM64,
2026-11-02. Integrate the existing current-version read and caller-owned output
paths as `client-get-version-into`. Return exactly status, copied byte count and
the verified current CSN. Keep opcode 6, capability negotiation, engine lookup,
durability, conditional writes and all existing APIs unchanged. This is an API
composition under ADR-0085, not a new format, requirement or MVCC implementation.

Extract the existing complete version-response grammar into one private span
validator used by persistent and caller-buffer results, including conditional
mutation responses. Never copy before complete token, shape, embedded document
and end checks. Share the ordinary GET output preflight: exclusive simple octets,
distinct from key/input/output and a full 60,000-byte grant after START. Only a
successful return authorizes the copied bytes; a post-copy deadline or nonlocal
exit can leave unconfirmed output. No target reference is retained.

Before execution, complete two author source readings and a decision table.
Exercise independent malformed frames and full u64 token/ID boundaries; compare
old/new decoder errors and persistent ownership. Cover pre-send refusal, complete
fragmented/coalesced reads, rejection, expiry, errors, nonlocal exit, GC and BUSY
reentry. Demonstrate a public read/token/conditional-write workflow using two
real clients, both storage formats and resident/paged primary modes, followed by
SIGKILL, recovery and fresh CSNs. No client reconstructs engine state.

Measure managed allocation with prebuilt replies and injected nonallocating I/O,
using the persistent public API as a positive control. Run five alternating
10,000-call windows for each API, after warmup and full GC outside each window.
Validate status, bytes, token and guards without allocating inside the windows.
This diagnostic excludes real kernel I/O, large numeric conversion and error
paths; it is not a throughput benchmark or a universal nonallocation claim.
The bounded fixture reuses one reply arena and stamps its current ID with the
existing product encoder on each mock send; that fixture work is included in
allocation counters. It preallocates documents, outputs and all I/O closures.

The first allocation diagnostic completed the absence/null-document cases, then
correctly rejected the fixture's own 1,024-byte document: its initial C4 builder
used a little-endian storage helper for a CBOR length. Preserve that failed
command and exact builder under `variants/initial-allocation/`. The corrected
fixture uses the canonical wire header writer; no product source changed.

Qualify exact planned/started/passed cases in affected suites on SBCL 2.6.9 and
2.6.10. Run the full repository check (including eleven registered spikes),
traceability and documentation checks. Freeze source identities for each command;
retain failures, raw receipts and child logs with lossless compression and hashes.
Clean only this worktree's regenerable outputs/cache after retaining the evidence.
Publish to main without force, remove only our temporary branch, and preserve
all other chats' worktrees, branches, processes and shared Git metadata.
