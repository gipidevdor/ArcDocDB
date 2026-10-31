# ADR-0071 — Self-contained committed locations in the M1 delta

- **Status:** Accepted in the incremental implementation authorized by the author on 2026-10-31
- **Date:** 2026-10-31
- **References:** ADR-0067, ADR-0068, ADR-0069; REQ-IDX-011, INV-I1, INV-I8, INV-V5, INV-A8, INV-P6
- **Relationship to earlier decisions:** supersedes ADR-0067's membership-only representation and resident lookup for touched keys; preserves its admission, durability, ownership, and recovery contracts

## Decision

The optional M1 delta retains an exact private key, an explicit entry state,
and five normalized location words. Its immutable hash seed is copied from
the canonical index at activation. A touched-key lookup uses these arrays
directly, without consulting the resident index or the old image. An explicit
tombstone returns absence. An untouched key uses the verified image; a missing
or malformed committed delta entry is an error, never permission to fall back.

Membership and key bytes are reserved before CSN assignment and WAL changes.
New membership initially has an unpublished state. After the existing durable
SEAL and canonical publication, the writer stores CSN, location, normalized
key length, record length, and auxiliary word, then publishes LIVE or TOMBSTONE.
Updating an existing key reuses its slot. The serial BUSY gate excludes every
public reader throughout; interrupted publication makes the engine FAULTED.
There is no new durable decision or concurrent publication protocol.

For C, the smallest power of two at least twice the key quota, the payload is
`57*C + key-byte-quota`: 16 bytes of hash/key metadata, 40 bytes of location,
and one state byte per slot. Activation and renewal reserve both old and new
deltas, including every array, without assuming intervening GC. Runtime
objects, headers, and RSS remain outside this payload measure.

## Consequences and boundaries

This removes the resident lookup dependency from the paged GET path. The
resident index remains necessary for write preflight, canonical publication,
image construction, and recovery verification. Its memory is not released by
this increment. RAM-based automatic selection, a bounded startup rebuild,
independent paged writes, and beyond-RAM qualification remain subsequent work.

The delta is volatile. Restart uses canonical WAL replay, including DELETE;
it does not accept a stale image because a previous process had a delta.
Renewal publishes a verified current image and a new empty delta together.
Snapshots, multiple actors, and concurrent reclamation are outside M1.
The serial lookup is bounded in its own steps; the complete GET may block on
I/O and carries no new formal lock-free claim.

## Verification

The [preregistered method](../implementazione/delta-location-m1-metodo.md)
covers exact payloads, complete locations, tombstones and resurrection,
collisions, inaccessible resident lookup, malformed states, admission,
allocation windows, renewal, and v1/v2 SIGKILL recovery. It distinguishes
local verification from platform and whole-engine qualification.
