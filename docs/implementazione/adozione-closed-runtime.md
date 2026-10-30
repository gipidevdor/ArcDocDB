<a id="adozione-dei-closed-nel-runtime"></a>

# Adopting CLOSED segments in the runtime

`runtime:adotta-directory-closed` connects the already built GET maps and
[CLOSED results](closed-recuperato.md) to the new scope of the
[Archivio runtime](runtime-archivio.md). Cost depends on the number of
segments, without recopying PUT rows or rereading headers and data.
It implements existing recovery, identity, and EBR lifetime contracts;
it introduces no persistent formats or per-document critical sections.

<a id="contratto"></a>

## Contract

```lisp
(arcdocdb.runtime:adotta-directory-closed
 archive target-view control recovered-closed maps
 :max-segmenti 65536 :budget-payload 1310720)
```

`archive` is the canonical object already bound to the runtime. `control` is the
Serie's authoritative result in that Archivio's bootstrap scope.
`target-view` belongs by EQ to the new runtime scope and has the same sixteen-byte
UUID. A clone of the scope with the same registries is not allowed.
Verification does not rebuild the catalog or certify the Archivio object's physical
uniqueness or the CSN plan's temporal validity.

The two simple-vectors are parallel, stable throughout the call, and
sorted by increasing ID. They must contain all and only the CLOSED segments of
the same CONTROL. The canonical gate checks count, unique IDs, membership,
prefixes, and open capabilities. Each pair is then compared for:

- the map's exact bootstrap view;
- the same `file-io` capability by EQ as the CLOSED result, not merely name or inode;
- ID, frontier P, version, and writer/compaction origin;
- strict order, open read-only FD, and ID compatible with the GET directory.

The empty set is valid only if the manifest contains no CLOSED segments. A partial
set, a map from another FD, or a different frontier is rejected
before constructing wrappers. Existing resolver limits remain:
ID 1..2^32-1, no new support for EDIT outcomes in the GET map.
Storage recovery still accepts u64 IDs, including zero; here unrepresentable
values are rejected, never truncated.

<a id="proprietà-lifetime-e-pubblicazione"></a>

## Ownership, lifetime, and publication

Each map receives new `segmento-get`/`mappa-segmento-get` wrappers.
It retains the FD, ID, version, origin, frontier, and the same read-only
row array. The canonical directory copies the reference vector and
builds sorted IDs. Caller vectors may be reused
after return; CONTROL, CLOSED results, old maps,
and bootstrap views are not retained. No internal array is exported.

Sharing covers only immutable rows and read-only capabilities.
It does not transfer physical FD ownership: the existing owner
must keep them open until all bootstrap and runtime borrowers finish,
then until EBR-authorized reclamation. No new open or close,
no implicit double cleanup. An error leaves private candidates to GC and
propagates the original condition; it does not close caller resources.

The coordinator freezes files, namespace, and inputs for the entire operation.
Lifetime checks are not a lease or a certification of future validity.
Lisp access to private internals is outside the public contract.

The returned directory is unpublished. The target view must receive
a consistent primary index, and sources must be published before locations.
The recovered ACTIVE is not implicitly closed or included: if CONTROL
still considers it ACTIVE, it stays outside this directory. Checkpoint,
new CONTROL, and new CLOSED set must be explicitly coordinated;
different CONTROL tokens are not accepted to avoid a new read.
Adoption implies no traffic authorization.

<a id="budget-e-costo"></a>

## Budget and cost

`max-segmenti` is an integer 1..65536; `budget-payload` a nonnegative `index`.
Shape, count, and budget are checked before the gate that allocates the duplicate
table and before new wrappers. On 64-bit SBCL the new array
peak is 20*N: temporary vector 8*N, directory references 8*N, and
u32 IDs 4*N. Final new payload is 12*N; existing rows are not copied.
The default configuration covers 65536 segments. Gate hashes,
wrappers, headers, capabilities, shared rows, and GC are excluded: this is not an RSS limit.

Scans are bounded by N. The gate uses a private hash table for
completeness; the directory does not implicitly sort inputs.
No allocations or checks are introduced into the existing GET path.
Bootstrap cost, GC, memory, and throughput remain to be measured.

<a id="decisioni-e-qualifica-aperta"></a>

## Decisions and open qualification

| ID | Cases to verify |
|---|---|
| RCL-D01 | Both simple-vectors; both wrong types separately |
| RCL-D02 | Max type and bounds; budget type; zero and exact 20*N/minus one |
| RCL-D03 | Parallel counts; complete/empty/missing/duplicate; canonical CONTROL gate |
| RCL-D04 | Runtime present; source and destination scope EQ; clone with the same registries |
| RCL-D05 | Same/different Serie UUID, including defensive check during transfer |
| RCL-D06 | Maps of the exact view; FD EQ, including against a second open of the same file |
| RCL-D07 | ID AND P AND version AND origin: each mismatch separately |
| RCL-D08 | Order, duplicates, zero/out-of-range u64 ID, closed/faulted/append capability |
| RCL-D09 | New owner AND rows EQ AND FD EQ; FI of every defensive postcondition |
| RCL-D10 | Complete final directory, reusable inputs, old views not retained |

This increment provides for warning-free compilation of the product only,
static checks, traceability, links, and preservation of original records.
It does not add or run functional tests, FI, coverage, models, or benchmarks.
Two author rereadings do not constitute independent review.
RCL-D01…D10, MC/DC, the general COD-24 boundary, measurements, and C1 qualification remain
open. General CI also does not replace a dedicated adapter suite.

The [local records and two author rereadings](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-17-runtime-closed/README.md)
preserve compilation, static checks, and disassembly of the frozen
revision, without promoting them to functional qualification.
