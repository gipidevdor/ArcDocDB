<a id="piano-csn-dellarchivio-recuperato"></a>

# CSN plan of the recovered Archivio

`arcdocdb.recovery.archive.csn` aggregates [recovered maximums](recovery-csn.md)
from a complete set of Serie and the Archivio decision log. It implements
one step in the [recovery](../architettura.md#recovery) sequence without
changing ADR-0020, ADR-0038, ADR-0041, or ADR-0046.

The plan prepares the future CSN registry's base. It does not create the registry,
rebuild indexes, or authorize traffic admission.
[Runtime bootstrap](runtime-archivio.md) now connects this base to the
single registry family; admission remains the controller's responsibility.

<a id="insieme-delle-serie"></a>

## Serie set

The controller supplies the canonical `archivio-recovery` object, canonical
Registri view, and complete vector of catalog views.
`crea-insieme-serie-recovery` copies the vector and checks the same GET
scope, distinct UUIDs, and Registri presence by `EQ` identity. Two different
views with the same UUID are rejected. View UUIDs are
already owned copies, immutable by protocol; they are not duplicated.
Later modification of the caller vector does not modify the set.

**Completeness against the persistent catalog and Registri's role are
controller preconditions.** The API does not read the catalog, infer
roles from names, or detect a Serie omitted from the initial list.
The product catalog remains to be connected.

<a id="provenienza-delle-decisioni"></a>

## Decision provenance

Every DECISION replay table receives a private identity marker
without fields or references to entries, buffers, or FDs. ACTIVE retains
the marker of the table actually used to resolve prepared records.
The marker does not retain the decision table.

The plan requires the same Archivio object for set and decision log,
the same `EQ` view for every ACTIVE, the same replay marker, and the
canonical gate for all CLOSED segments of the respective CONTROL. A separate replay
of the same bytes receives a different marker: it is not interchangeable with the
source used for presumed aborts, even for ACTIVE without prepared records.

The low-level ACTIVE API remains available: the plan accepts its
result only if it used exactly the supplied decision log's table.
The marker is an internal check, not a signature or security boundary
against Lisp code accessing private internals. No on-disk format
or shared registry across Serie changes.

Private table and ACTIVE-result layouts change: the system must be
recompiled and reloaded without reusing old instances.

<a id="api-pubbliche"></a>

## Public APIs

| API | Result |
|---|---|
| `crea-insieme-serie-recovery(archive, registri, views :max-series 65536 :budget-riferimenti 524288)` | Owned set, catalog order |
| `numero-serie-recovery(set)` | Number of copied views |
| `crea-piano-csn-archivio(set, decisions, active, closed :max-segmenti-serie 65536 :max-segmenti-totali 1048576)` | Plan after all checks |
| `massimo-csn-archivio(plan)` | Presence and maximum u64; `NIL/0` distinct from `T/0` |
| `statistiche-piano-csn-archivio(plan)` | Serie count and ACTIVE+CLOSED segment count |
| `parole-base-csn-archivio(plan)` | Last CSN's high/low u32, without increment |

`active` is a simple-vector of ACTIVE results. `closed` is a
simple-vector of corresponding CLOSED simple-vectors. Count and order are
those of the owned set. Registri may occupy any position.
Caller vectors stay frozen until return; they are not retained.

The maximum includes all DECISIONs, even without prepared records in Serie,
and all sources already described for each Serie. TXIDs, control-log
orders, frontiers, and tail bytes do not contribute.
The plan retains only the Archivio object and four scalars. It does not retain
view set, Serie results, tables, decision log, or FDs.
Source health is checked during construction, not certified
for the future. An error prevents a result; no partial maximum
is published and no runtime registry is modified.

<a id="budget-e-costi"></a>

## Budgets and costs

Serie count and `8*N` reference bytes are checked before copying and
UUID table allocation. This is the logical budget on 64-bit SBCL: it excludes hash tables,
Lisp headers, existing views, and GC; it is not an RSS ceiling.
The plan checks cardinality and sum `N + SUM(CLOSED_i)` before gates
allocating duplicate tables. The global ceiling includes ACTIVE segments.
Scans are bounded to already verified views, CLOSED segments, and DECISION entries;
CLOSED gates retain their budgets. No new I/O, thread, timer,
callback, or lock; no GET or commit change. One marker per table and
one reference per ACTIVE; object, boxing, and GC costs remain to be measured.

<a id="base-e-apertura-del-runtime"></a>

## Base and runtime opening

The base is **M**, last observed CSN, not M+1. The existing registry
assigns M+1 on the first request. Maximum u64 remains representable;
subsequent assignments are rejected with `:csn-exhausted`, without wrap.

Recovery GET scope may be a bootstrap scope. The plan does not
rewrite its snapshot registry or already associated CSN registry.
Runtime bootstrap builds the single registry family with the validated
base. The controller must still bind writes/snapshots/views and
complete publication obligations. Two plans do not authorize two
allocators for the same canonical Archivio.

Before admission, remaining work includes authoritative catalog/inventories, physical
reconciliation, consistent indexes and roots, old ACTIVE closure/publication,
completed multiseries obligations, and the same registry used by all controllers.

<a id="decisioni-e-qualifica"></a>

## Decisions and qualification

Requirements REQ-REC-001/002, REQ-MVC-006, REQ-TXM-005/007, and REQ-AFF-008;
invariants INV-M5, INV-T2, INV-S7, INV-A8, and INV-P6.

| Case | Decision and dedicated obligation |
|---|---|
| ACR-D01 | Same N, positive N, `8*N <= budget` before copy; every condition |
| ACR-D02 | Empty, max Serie or reference budget exceeded before allocation |
| ACR-D03 | Different scope, duplicate UUIDs with EQ/different views, Registri absent/clone |
| ACR-D04 | Same Archivio object, ACTIVE count AND CLOSED count both exact |
| ACR-D05 | Per-Serie budget OR global sum, ACTIVE included, zero CLOSED valid |
| ACR-D06 | Exact ACTIVE view and exact marker, even with equal CSNs |
| ACR-D07 | CLOSED gate: different CONTROL/P, duplicates, count and lifetime |
| ACR-D08 | DECISION maximum greater/less/equal to Serie, different TXID order |
| ACR-D09 | No CSN, present zero, high bits, maximum u64; no increment |
| ACR-D10 | Exact consumption AND (presence OR maximum zero); every condition |
| ACR-D11 | Owned vector copy; no list or heavy source retained in plan |
| ACR-D12 | DECISION query: exact consumption AND (positive count OR maximum zero); entry shape checked before maximum |

The [initial evidence](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-16-archive-csn-plan/README.md)
separated build, static analysis, and two author readings from qualification.
The [dedicated campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-16-archivio-csn-verifica/report.md)
preserves 54 compound tests, native/FI tests, independent review, and a full
local check. C1/MC/DC, allocations/performance, and controller integration
remain open; that campaign checked the bridge to the existing registry
only in tests. Product bootstrap has a dedicated method.
The [dedicated verification method](archivio-csn-verifica.md) defines
public fixtures, test bridge to the registry, and run preservation.
The DECISION source query rechecks entry shape and consumption/normalization
before return; no new container or second traversal.
