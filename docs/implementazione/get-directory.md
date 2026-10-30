<a id="directory-get-dei-segmenti-closed"></a>

# GET directory for CLOSED segments

`arcdocdb.get.directory` connects primary candidate to
[CLOSED resolver](get-resolver.md) map without linear segment scanning.
Each directory belongs to canonical view of one Serie. Does not modify
format, commit order, isolation, or publication protocols.

<a id="preparazione-e-memoria"></a>

## Preparation and memory

`crea-directory-get-serie(view, maps, :max-segments M, :budget-payload B)`
accepts a simple-vector of already-verified CLOSED maps, in strictly increasing
positive u32 ID order. Rejects foreign view, storage ID with
nonzero high word, zero ID, duplicates, reverse order, non-read-only
or closed FD. Caller keeps input exclusive and stable until return.

Shape, cardinality, and payload checked before scanning maps or
allocating two arrays. Then every map checked, references copied,
and IDs copied into u32 array. Result exposes no mutable array.
Input vector reusable; maps and capabilities remain immutable.
Maps neither rebuilt nor files reread during preparation.

| Limit/data | Value |
|---|---|
| Segments per directory | 0–65,536; configured positive maximum ≤ 65,536 |
| Own payload | `12 × N` bytes on 64-bit SBCL |
| Default payload | 786,432 bytes |
| Segment search | At most 17 steps, each with ≤ 2 ID comparisons; no retry |
| Construction | Two bounded scans and one reference copy |

Twelve-byte budget per segment includes one u32 and one reference.
Excludes Lisp objects/headers, caller input, maps, FDs, GET scratch,
retained old directories, and GC: **not RSS** or process budget.
`conta-segmenti-directory-get` and `payload-directory-get-serie` observe
completed view only. Saturation implies backpressure or controller
configuration revision, without implicit growth.

<a id="lettura-sotto-ebr"></a>

## Reading under EBR

1. Start GET with worker context and original request.
2. If outcome is `:candidate`, acquire immutable directory published
   by controller **after EBR admission**, in same epoch as candidate.
3. `trova-mappa-directory-get` selects segment ID from location
   word. Empty directory or missing ID causes `FAULTED`:
   already-published index cannot reference nonexistent source.
4. `risolvi-candidato-directory-get` delegates offset,
   length, both CSN words, frontier, flags, proof, and FD checks to CLOSED resolver.
   Directory alone does not authorize value delivery.
5. `sonda-cache-directory-get` performs no I/O. I/O pool uses
   `leggi-record-directory-get`, returning GET's five outcomes.
   Prepared retains authoritative OUTCOME proof and file reread.
6. Copy value into private response; finish with fresh time.
   Snapshot and pin checked/released before authorizing value.

External cleanup remains mandatory, installed before starting
GET. Incorrect ordering preconditions rejected before assuming
cleanup ownership; errors or nonlocal exits after admission release pin.
No FD, candidate, directory, or pin crosses a queue: I/O worker
restarts GET and reacquires directory after new lookup.

<a id="pubblicazione-e-lifetime"></a>

## Publication and lifetime

Controller publishes directory/maps before corresponding locations
are observable from primary. A root acquired before pin is not
protected by later EBR entry. Lisp references and array immutability
do not authorize closing FDs.

Rotation/relocation must leave all sources reachable for a
candidate an already-admitted reader may still use. FDs remain
open until authorized reclamation. CLOSED map validity derives
from manifest and bytes verified by constructor; directory does not
use EOF, H, hints, or cache to invent a frontier.

[Source bridge](get-fonti-serie.md) associates directory with contents
of ACTIVE root published by existing controller, or initial CLOSED
root. Selection uses one acquire read after lookup.
Rotation, complete relocation/reclamation, and historical lookup remain open.
Independent Serie have independent
directories; selection touches no state shared between Serie.

<a id="errori-e-decisioni-c1"></a>

## Errors and C1 decisions

Input/configuration errors have type `invalid-argument`; saturation
`resource-exhausted`. Foreign view during GET releases pin and propagates
error. Impossible internal geometry or missing ID makes context
`FAULTED` and propagates `invariant-violation`; coordinator must isolate
Serie. Selection does not translate these cases into `:absent` or `:retry`.
Resolver/GET conditions remain those of delegated modules.

| ID | Decision | Required verification |
|---|---|---|
| GDR-D01 | Maximum index type, positive, and ≤ 65,536; index budget | Each condition separately, zero/endpoints/types |
| GDR-D02 | Map with zero high ID and positive low | Each word and maximum ID |
| GDR-D03 | Read-only and open FD | Each condition separately |
| GDR-D04 | Arrays of equal cardinality within maximum | Corrupted geometry and maximum cardinality |

Selected-entry type is also an always-checked invariant:
a private NIL entry from fault injection produces `FAULTED` before return,
without classification as ordinary configuration error.

References: [ADR-0044](../adr/0044-cache-acceleratore-puro.md),
[ADR-0045](../adr/0045-modello-di-esecuzione.md),
[GET tasks](get-record.md), [campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-get-directory/README.md).
Requirements remain designed until full C1 qualification; no
engine qualification inferred from this directory's presence.
