# Committed location delta for M1

[ADR-0071](../adr/0071-delta-location-indice-m1.md), REQ-IDX-011;
INV-I1, INV-I8, INV-V5, INV-A8, INV-P6. C1, one serial M1 actor.
The existing activation and renewal APIs enable it through positive
`:delta-keys` and `:delta-key-bytes`; both zero preserve retirement on writing.

## Lookup and publication

The paged lookup first probes exact private keys using a copied canonical
XXH64 seed. LIVE copies five normalized words to the caller's preallocated
output. TOMBSTONE returns absence without modifying output. Only an untracked
key consults the verified base image. Errors never trigger resident fallback.
The resident index is not accessed for hashing or lookup on this path.

Each occupied slot has an explicit state and descriptor. State zero is reserved
but unpublished; one is LIVE; two is TOMBSTONE. A descriptor stores CSN,
`segment<<32 | offset`, key length in bits 32..47 and LIVE in bit 48 for PUT,
u32 record length, and a zero auxiliary word. Tombstones retain their committed
CSN/location with the LIVE bit clear. Invalid states, uncommitted CSNs,
missing segment IDs, or malformed fields are invariant failures.

Preflight checks quotas without effects. BUSY admission copies new membership
before CSN assignment. The existing write path makes SEAL durable and publishes
the canonical record before storing the delta descriptor and publishing its state.
All public reentry is rejected throughout. Failure or nonlocal exit closes
admission as FAULTED; no partial result is acknowledged. The observer phases
`:before-delta-publication` and `:after-delta-publication` expose both boundaries
for fault injection, without adding a durable point.

DELETE of an absent key still consumes membership and publishes a tombstone;
DELETE/PUT cycles reuse that slot. Renewal publishes a verified current image
and an empty delta together. Restart discards the overlay and replays canonical
WALs; it cannot authorize adoption of a stale image.

## Memory and progress

For C, the smallest power of two at least twice the key quota, the exact array
payload is `57*C + delta-key-bytes`: four u32 metadata words, five u64 descriptor
words, one state byte per slot, and the key arena. Both old and new deltas enter
activation and renewal reservations. Objects, headers, GC, and RSS are separate.
No arrays or key copies are allocated by normal lookups or committed updates.

Probing takes at most C slots, each comparing at most 65,535 bytes; descriptor
copies take five words. These are bounds on serial algorithm work, not elapsed
time. Base-page misses and document reads may perform blocking I/O. This adds
no formal lock-free guarantee or concurrent reclamation protocol.

The resident index remains complete for write preflight/publication, source
counts, recovery verification, and image construction. This increment does not
release its RAM or implement automatic resident/paged selection.

## C1 decisions and verification

| Compound decision | Independent negative cases / positive control |
|---|---|
| Array geometry: positive capacity, four metadata words, five descriptor words | zero capacity; only metadata length wrong; only descriptor length wrong; normal factory |
| Descriptor slot: aligned and within table | unaligned slot; slot at exclusive end; exact found slot |
| Publication: BUSY and active image | BUSY false; image absent with BUSY true; normal committed write |
| Publication fields: state, increasing CSN, segment range, offset and length | invalid state; equal/zero CSN; segment 0/above u32; offset above u32; length 0/above u32; full-width values |
| Committed read: state in 1..2, positive CSN and segment | state 0/3; CSN zero; segment zero; LIVE and TOMBSTONE |
| Normalized fields, bounded record length, zero auxiliary word | wrong key/flag word; zero/over-u32 length; auxiliary nonzero; valid descriptor |
| Existing membership must already be committed | state 0/3 rejected before WAL; updates and resurrection at quota |
| Delta without active image | invalid pair faults; resident without delta and active paged delta work |

The [preregistered method](delta-location-m1-metodo.md) defines differential,
allocation, crash, and full-suite checks. Two C1 readings cover publication
ordering and exact keys, then bounds, resource ownership, accounting, and errors.
Results and limitations are recorded with the campaign evidence.
