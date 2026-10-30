<a id="lettura-coordinata-dellarchivio"></a>

# Coordinated Archivio reading

`arcdocdb.recovery.bootstrap` connects [semantic Serie recovery](recovery-serie.md)
to the [complete CSN plan](csn-archivio-recovery.md). It is a read-only bootstrap
path: no new format or durable atomicity point.

[Archivio name completion](stabilizzazione-archivio.md) reconfirms the gate
on current results and checks all names before effects. Removals, checkpoints,
indexes, and admission remain open.

<a id="ingressi-e-risultati"></a>

## Inputs and results

```lisp
(arcdocdb.recovery.bootstrap:leggi-archivio-recuperato
 series-set decisions controls source-sets per-series-limits scratch max-total-bytes
 :max-segmenti-totali 1048576 :budget-riferimenti 16777216)
```

`series-set` is the complete canonical set created from the catalog, including
Registri. `decisions` is the complete replay of the **same Archivio object**.
CONTROLS, SOURCE-SETS, and PER-SERIES-LIMITS are simple-vectors in the same
order as the set's views. Each control must refer to the exact view by EQ;
equal UUIDs or cloned scopes do not substitute for this authority. Each Serie
retains its own read-only limit configuration.

The caller keeps all acquired sets, FDs, namespace, and inputs stable throughout
the operation, in exclusive recovery in the I/O pool. The complete catalog
remains a precondition: the API does not discover a Serie omitted from the set
attested by the caller. It does not acquire directories or files or perform
physical reconciliation or name changes.

On success it returns three values:

1. canonical Archivio CSN plan;
2. new simple-vector of recovered ACTIVE results;
3. new simple-vector of recovered CLOSED vectors, one per Serie.

Outputs retain set order. New caller-owned vectors, read-only reader tokens;
no buffer retained. The subsequent `crea-runtime-archivio` call can use the
plan, with its own obligations still open for recovered effects, indexes,
and admission.

<a id="tutti-i-preflight-prima-dei-dati"></a>

## All preflights before data

Before reading the first header, Archivio authority and the shape and lengths
of the three vectors are checked. Minimum budgets cover at least one ACTIVE
per Serie and the two outer vectors. Then each Serie is checked without
reading its data: exact view, cardinality, ID state/order, FDs, backend,
scratch, CLOSED P against EOF, and local limits.

Aggregate capacities are checked before the full scan of the row's sources:
segment and reference counts. The byte sum is checked after row preflight,
still before any header. A configuration error in the last Serie does not
first start reading the other Serie. Binary identities, CRC, and semantics
are instead checked by readers during the subsequent reading phase.

Internal Serie preflight now also returns total bytes. The third value
adds metadata without changing the two public results of
`leggi-serie-recuperata` or performing another data scan.

<a id="budget-globali-e-costo"></a>

## Global budgets and cost

The byte budget is a required, explicit `index`, without a default or
clamping. Zero is allowed and prevents reading any nonempty Archivio.
It measures the sum of ACTIVE EOF plus CLOSED P; not IOPS or time.
`max-segmenti-totali` is a configurable `index`, default 1048576, including
ACTIVE. Zero rejects the nonempty canonical set before scans.

For N Serie and S total segments, new reference arrays have payload
8*(N+S) on 64-bit SBCL: 16*N for the two outer vectors and 8*(S−N)
for CLOSED vectors. Default `budget-riferimenti`: 16 MiB, configurable.
Each local budget remains applied to its Serie. The final plan gate uses
the global budget as an upper limit for a Serie's CLOSED segments;
stricter limits are already checked before data and by local readers.

Borrowed scratch, tokens, gate workspaces and hashes, objects, headers, and
GC are excluded: this is not an RSS limit. The same scratch is reused for
all Serie and must hold the maximum allowed ACTIVE EOF/CLOSED P. Serie
are read sequentially in this bootstrap entry point; no lock or new
serialization on the operational path between Serie. Separate readers
remain available for future parallel startup controlled by the coordinator.

Metadata checks are repeated by readers before use; the final canonical
gate rechecks sets, ACTIVE provenance, and all decisions. No reopening,
directory enumeration, or new data scan for CSN calculation. Performance is
not inferred from this composition; startup cost, memory, GC, and bootstrap
parallelism remain to be measured.

<a id="ritorno-completo-e-lifetime"></a>

## Complete return and lifetime

After all readings, the existing plan is built, including DECISION without
local prepared data. The plan's Serie and segment counts must match preflight.
Only then are the three values returned. If any reading or the final gate
fails, previous results remain private and GC-reclaimable, without published
effects. Scratch may have changed; no buffer rollback.

Capabilities remain owned by the sets' owners: no implicit close on success
or error. Results are not a lease on FDs and do not prevent an illegitimate
caller close. The owner terminates borrowers before cleanup. Original
conditions propagate without masking or retry. The general C1 shutdown
boundary and coordinator cleanup handling remain open.

<a id="decisioni-e-metodo-preregistrato"></a>

## Decisions and preregistered method

| ID | Dedicated cases to verify |
|---|---|
| RBA-D01 | Same Archivio EQ as replay; clone and equal UUID are insufficient |
| RBA-D02 | Three simple-vectors: each incorrect type and length separately |
| RBA-D03 | Minimum ACTIVE/vector budgets, zero and equality/minus one before scans |
| RBA-D04 | CONTROL of the exact view for each row; swap and clone |
| RBA-D05 | Different configurations per Serie; all local preflights before data |
| RBA-D06 | Segment/reference sum: equality/minus one, including last row |
| RBA-D07 | Byte sum: ACTIVE EOF and CLOSED P, exact limit/minus one; invalid last row |
| RBA-D08 | Stable CLOSED count; Serie <= segments <= budget AND reference formula AND bytes within budget |
| RBA-D09 | Canonical v1/v2 readers, OUTCOME/EDIT/DECISION and replay provenance; single scratch |
| RBA-D10 | First/last reader or gate error: no output/close/binding/CSN |
| RBA-D11 | Consistent plan Serie AND segment counts; individual FI; new vectors |

Method: product-only compilation without warnings, style, traceability,
links, disassembly without calling the new APIs, C4 archive checking,
and retention of originals. Two author readings separate from independent
review. No new functional test, FI, MC/DC, coverage, model, or benchmark
is added or run in this increment. RBA-D01…D11, C1 qualification, effect
publication, and traffic gate remain open; general CI and static checks
do not replace them.

The [local records and rereadings](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-17-archive-bootstrap/README.md)
retain compilation, static checks, and disassembly of the frozen revision.
