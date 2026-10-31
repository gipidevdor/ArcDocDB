<a id="adr-0067--delta-seriale-limitato-per-limmagine-primaria-m1"></a>

# ADR-0067 — Bounded serial delta for the M1 primary image

- **Status:** Accepted in the incremental integration authorized by the author on 2026-10-29; membership-only representation and touched-key resident lookup superseded by [ADR-0071](0071-delta-location-indice-m1.md)
- **Date:** 2026-10-29
- **References:** ADR-0064, ADR-0065, ADR-0066; REQ-IDX-010, INV-I8, INV-I1, INV-P6
- **Relationship to the specification:** no new durable format; extends ADR-0066's retirement before writing with an explicit delta

<a id="decisione"></a>

## Decision

Serial activation can reserve an exact set of touched keys
with `:delta-keys` and `:delta-key-bytes`. Both zero retain the previous
contract: the first admitted write retires the image. Both positive
enable the delta, without changing startup or adding automatic selection.

The delta retains membership only: digest, range, and key copy.
For every touched key, GET consults the current canonical resident index, including
absence due to a tombstone. For other keys it consults the verified image.
Deleting an absent key is still recorded: a touched key
never falls back to the previous derived object. Digest collisions
require full-byte comparison. No fallback on I/O error.

An open-addressing table at most half full, linear probing bounded by
capacity, an append-only arena, and arrays are reserved at activation.
Preflight accounts for old and new deltas as well as readers/cache.
Exhausting keys or bytes is an ordinary rejection before CSN and WAL:
READY, image, and file remain unchanged. Updating a key already
registered consumes no additional space, even after DELETE and resurrection.
No entry deletion or reuse until the next publication.

After preflight and BUSY admission, membership is copied before commit;
SEAL remains the sole data atomicity point. Any incomplete exit
makes the state FAULTED and prevents reads of partial state. A verified swap
onto the new source replaces the view and empty delta together. Retirement and close
clear both. Ownership, callback exclusion, and cleanup remain
as in ADR-0066; no resources shared between Serie.

<a id="limiti-e-verifica"></a>

## Limits and verification

The full resident index remains present, along with its capacity limits;
this increment does not enable an index larger than RAM. The delta is not
persisted and does not authorize recovery of an obsolete image: restart
always rebuilds the canonical index, and the explicit candidate must match
the entire current source. Delta compaction, durable catalog,
a fully paged writer, snapshots, and automatic selection remain open.

[Contract, decisions, and evidence](../implementazione/delta-indice-m1.md).
