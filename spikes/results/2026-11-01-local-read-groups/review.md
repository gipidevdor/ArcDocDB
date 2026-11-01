# Read-group author review

Two local readings cover wire/budget bounds and serial ownership/error handling.
This is author review, not independent review or formal MC/DC qualification.

- Optional opcodes are exact sorted subsets of [4,5], with mandatory [0,1,2,3]
  in WELCOME. Default/write-only bytes and public two-value decoders are retained.
  READY requires exact requested flags and a fresh deadline. Handshake and request
  unwind guards consume socket ownership on every incomplete exit.
- Every key is checked before any copy or GET, bounded by eight members and the
  existing 1..1,024-byte key limits. Client type/alias/prefix/frame/ID checks occur
  before send or ID credit consumption. No implicit splitting or downgrade.
- Read groups drain earlier writes and complete in one actor turn. Fresh checks
  follow draining/validation, surround each GET and precede response completion.
  Legacy read barriers now also recheck after draining. Trusted callbacks remain
  nonreentrant; concurrent or historical views are outside this serial contract.
- GET always receives the full existing 60,000-byte value target. The service
  calculates actual response-member capacity before copying into private output.
  An aggregate overflow returns one error/null frame and leaves the engine READY.
  Engine/canonical faults propagate rather than becoming absence or capacity refusals.
- One central prefix writer checks bounds and writes u32 big endian for legacy
  and grouped frames. The first real group probe caught a little-endian prefix;
  that rejected implementation and diagnostics are retained. Independent full
  frame literals and exact/one-over capacity tests cover the corrected boundary.
- Each GET releases its context/pin before the next member; no lease/pin reaches
  peer send. The existing fixed group workspace is exclusive to either command
  and is cleared on every dispatch exit. There is no new server payload arena.
- Client span scratch is eight u64 slots (64 payload bytes). It checks every
  result and embedded document before any copy, then correlation/deadline before
  exposing the new vector. NIL absence differs from a copied CBOR null document.
  Duplicate results have independent storage. No result is authorized on error.
- New helpers have complete FTypes, REQ tags, safety 3/speed 2/debug 2, bounded
  loops and pre/postcondition docstrings. No product dependency, syscall, format
  change or engine flush is added. Bounded copies remain allocations.

| Decision | Targeted alternatives |
|---|---|
| Capabilities | All four flag combinations, legacy bytes, malformed/duplicate/reversed lists, unsolicited/missing flags, invalid option types |
| Request | Counts 0/1/8/9, empty/oversized/invalid last key, prefix/alias guards, exact/one-over frame |
| Result | Found/absent/CBOR null/duplicates, u64 IDs, bad last document/boolean/count/end, all rejection statuses, no early copy |
| Capacity | Small negotiated frame, exact full result and one over, multi-member overflow, usable engine/client afterward |
| Serial order | Earlier PUT, grouped read, DELETE, grouped absence; independent write limit; unchanged CSNs and zero flush |
| Deadlines | After draining/validation, before/after each GET, final completion, final client byte/decode and HELLO completion |
| Lifetime | Short I/O, EINTR/EAGAIN/EOF, wrong owner, ID refusal, nonlocal exits, handshake close and existing cleanup-cause tests |
| Integration | Both formats, all primary profiles, cache rejection/fallback, rotation/compaction/reopen; real SIGKILL, response loss, partial peer and coalesced frames |

Functional runs do not establish latency, heap/RSS ceilings, arbitrary concurrency
or physical-power-loss qualification. Performance is a separate serial campaign.
