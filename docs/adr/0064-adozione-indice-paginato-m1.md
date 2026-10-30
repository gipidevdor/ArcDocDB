<a id="adr-0064--adozione-seriale-delle-immagini-primarie-nello-startup-m1"></a>

# ADR-0064 — Serial adoption of primary images at M1 startup

- **Status:** Accepted in the incremental integration authorized by the author on 2026-10-29
- **Date:** 2026-10-29
- **References:** ADR-0057, ADR-0058, ADR-0063; REQ-IDX-010, INV-I8, INV-A2, INV-A8, INV-P6
- **Relationship to the specification:** implements the M1 connection; no amendment to authoritative formats

<a id="decisione"></a>

## Decision

M1 may receive an explicit private candidate `primary-<16 hex>.idx.tmp`
in the engine's already exclusive directory. Selecting the name is not a
durable decision, does not enable rename or deletion, and does not replace
CONTROL/WAL. The segment inventory continues to ignore this unrelated name.
No new catalog document is introduced. Selection is incompatible
with CREATE, which requires an empty directory: the combination is rejected before I/O.

Recovery completes the canonical gates and checkpoint and rebuilds the
resident index. Only then does it verify the derivative against a source derived from
replay: Archivio/Serie UUID, last CSN, exact live cardinality, and a
32-byte token. Only in the M1 append-only profile, the token encodes four
little-endian u64s: data version, segment ID, offset, and length of the last
committed record, PUT or tombstone. Before the first record it contains
the version and three zeros. CSN zero is not used as an absence marker.

The validity of the prefix identity follows from immutable segments,
never-reused IDs, and M1's rejection of compaction, prepared records, and removals.
Checkpoints and new empty ACTIVE segments do not change the source. It is not a dataset
hash: extending M1 to rewrites/compaction requires a new
canonical binding; this rule cannot be reused for those plans.

Every candidate is compared with the rebuilt resident index, normalizing
only the arena offset, which is outside the paged format. Cardinality,
membership, and uniqueness already verified by ADR-0063 establish complete coverage.
The engine owns the same read-only FD until close, even after retirement.
A missing, incompatible, corrupt, or over-budget explicit candidate
refuses startup without admission or fallback. The data checkpoint
may already be complete: refusal does not roll back canonical recovery.

M1 GET uses a trusted serial controller selector, immutable in the
GET view. A single lookup produces the candidate; segment resolution,
record checks, and value copying remain in the existing resolver.
No paged-index error is reinterpreted as absence or fallback.

Ordinary input and capacity checks precede retirement. On entry to an
admitted write, before commit, the engine retires the private image
reference and returns to the resident index. Commit updates the resident index and
source before ACK; subsequent errors close admission according to the
existing M1 protocol. Retirement allocates nothing and does not modify/close the derivative.

<a id="limiti-e-seguito"></a>

## Limits and follow-up

The resident index remains present and is still the writer's capacity limit:
this integration does not demonstrate datasets beyond RAM and does not implement
ADR-0057's automatic selection. Complete engine-driven construction, writer delta,
durable catalog, reclamation, snapshots, and concurrent swaps remain separate.
Explicit selection is a controller integration entry point rather than
the final automatic product configuration contract.

Removing the selection option makes the next startup use the resident index;
the derived file remains intact. No data migration or new lock
across Serie. Contract, decisions, and tests in the
[M1 connection](../implementazione/indice-paginato-m1.md).
