# ADR-0073 — Operational automatic primary index in M1

- **Status:** Accepted for the completion requested on 2026-10-31
- **References:** ADR-0057, ADR-0058, ADR-0063, ADR-0071, ADR-0072;
  REQ-IDX-008, REQ-IDX-013; INV-I1, INV-I7, INV-I8, INV-A2, INV-A8, INV-A10, INV-P6

## Decision

Complete automatic selection for the serial M1 engine, including writes,
recovery and return to RAM. Resident mode uses the existing flat primary
fragments and their verified rebuild/split operations. Paged mode retains no
complete resident index. It uses a hash-ordered persistent AVL tree in an
append-only derived file, with fixed cache, lookup scratch and bounded paths.
The GET descriptor remains the existing five normalized words. Exact key
bytes distinguish hash collisions. Maximum tree height is 128; configured
file and work bounds reject before admitting an unreservable mutation.

This is a distinct derived format, `ARCAIX01`. ARCIRF01 images and their
explicit APIs remain supported by the legacy M1 profile. Their producer
requires cardinality-sized sorting arrays and their reader requires a sealed
whole-image rewrite. A bounded disk update backend is needed to remove both
dependencies. An external-sort producer was considered; path copying permits
incremental updates and streaming compaction without maintaining sort runs.
The additional disk footprint and logarithmic lookup/write amplification
are explicit costs; resident mode remains preferred when its peak fits.

One owner serializes operations. Nodes and external keys are immutable,
checksummed and bound to file generation/offset. New nodes are prepared in a
fixed batch and appended before the new root becomes usable. The canonical
WAL/SEAL remains the sole data commit. A failed index publication after SEAL
faults the engine without ACK; recovery replays the committed document.
No derived root or file name authorizes data recovery. Startup always rebuilds
from verified canonical records using bounded index memory.

The controller reserves the retained source, destination, cache, paths,
metadata allowance and maintenance peak before switching. It anticipates
resident growth and uses the existing low-water percentage for returning.
Disk compaction copies only the current tree with bounded traversal memory.
Per-record CLOSED resolver tables become a bounded per-engine map cache;
otherwise they would retain a second cardinality-sized RAM structure.

Unpublished automatic-index `.tmp` files have a reserved, disjoint namespace.
Removal requires a typed proof binding directory, name and physical file;
the protocol establishes derived ownership before requesting it. Canonical
logs/segments cannot satisfy that name grammar. No canonical file is deleted
or truncated. In-process cache generations do not wrap or reuse a live
capability. Startup removes only positively identified private derivatives.

## Progress and limits

This completes backend selection in the existing single-owner M1 profile.
It does not qualify snapshots, multiseries concurrency or a complete
lock-free GET. The resident kernel is unchanged; M1 admission remains serial.
Cache acquisition is private and bounded, while misses and maintenance may
block on I/O. GC/runtime pauses are not assumed away. Charged index allocations
and cache metadata are explicit; process heap/RSS, OS cache and the other
engine components retain separate reservations and qualification limits.

The [preregistered completion method](../implementazione/indice-automatico-completamento-metodo.md)
requires differential transitions, bounded-memory replay, collision/deletion
cases, fault injection, process crashes, allocation observations and complete
repository checks. Implementation does not close whole-engine phase gates.
