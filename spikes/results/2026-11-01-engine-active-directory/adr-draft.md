# ADR-0081 — Bounded append-only ACTIVE metadata

- **Status:** Accepted for incremental integration under the author's instruction.
- **Date:** 2026-11-01
- **References:** ADR-0024, ADR-0080, REQ-IDX-001, REQ-WAL-005/006,
  REQ-AFF-002/004/008, INV-A2/A11/P6.

## Decision

Add an explicit `:directory-mode :append-only` option to the existing ACTIVE
source factories; keep `:persistent` as their default. Serial M1 selects the
append-only representation with page and PUT bounds equal to its ACTIVE record
limit. This changes only derived memory metadata, without a disk/wire format,
data-CSN family, durability level or cross-Serie coordination change.

Before admission, allocate and charge three specialized u32 arrays: one end
offset per page, cumulative PUT counts for N+1 page boundaries, and six words
per maximum PUT. Payload is `8 * max-pages + 4 + 24 * max-puts` bytes. There is
no per-page map, row array or four-node path copy on the write path. One new
immutable root descriptor per commit remains; zero managed-heap allocation and
complete COD-30 qualification remain open.

Each source has a single writer and an initialized-tail count. Every page's
end, next cumulative row boundary and row span are written once, in a private
unpublished suffix. A root captures exact count, PUT count and end; its prefix
is immutable for its complete EBR lifetime. Later tail writes are inaccessible
through that root's bounds. Readers acquire the root through the existing
controller publication and perform no lookup of a mutable writer frontier.

Preparation verifies identity, contiguity, counts, full budgets and a free
tail before data CSN assignment through the existing OPEN preflight. After the
sealed preparation starts writing a tail, every incomplete exit faults the
controller without unsafe tail reuse, rollback, response or retry. Existing
WAL/event/token checks and publication-after-flush remain authoritative.

The append-only reader searches only the captured page prefix and selected row
span. It checks geometry, cumulative limits and neighboring page ends, then
uses the same source identity/lifetime, candidate CSN/size/flags, target bounds,
proof and canonical record verification as the existing resolver. A missing,
stale, malformed or out-of-prefix row faults the read, never implies absence.

## Consequences and verification

Large ACTIVE metadata becomes pointer-free and bounded at startup. It remains
separate from primary-index and record-cache grants; the budget is a payload
bound, not RSS. Full arrays are charged even for an empty root. Source/FD lifetime
continues to follow the existing EBR contract, and rotation creates a new arena.

The original persistent representation remains available and its tests run
unchanged. New tests cover old-prefix immutability, unpublished tails, row/page
budgets, tombstone pages, canonical corruption, cumulative groups, paging,
rotation, compaction and real crashes. An independent finite schedule model
includes publication and incomplete exits, with controls detecting prefix
mutation and premature visibility. Local model/test success does not close a
general weak-memory, physical-power-loss or whole-engine assurance gate.
