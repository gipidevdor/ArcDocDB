<a id="orizzonte-dei-commit-integrazione-del-registro-unico"></a>

# Commit horizon: single-registry integration

Active CSN-registry implementation is
[`arcdocdb.csn`](../../src/csn/registry.lisp), described in the
[canonical contract](csn.md). The [snapshot connection](snapshot-csn.md)
uses that single Archivio registry. Snapshots and writers cannot
assign versions through two independent sequences.

This branch's first implementation in `arcdocdb.mvcc` was removed
before release. MVCC module now contains only snapshots, their budgets,
and connection to public CSN API. No format or ADR changes.

<a id="adeguamento-delle-chiamate"></a>

## Updating calls

| First branch implementation | Active interface |
|---|---|
| `mvcc:crea-registro-csn` with capacity/base | `csn:crea-registro-csn :capacity :initial-high :initial-low`; recovery-validated base. |
| Reservation and `mvcc:riserva-csn` | `csn:prendi-csn` returns slot/high/low; commit context retains these values together with registry. |
| `mvcc:concludi-csn` | `csn:risolvi-csn` receives original token after correct publication or cancellation. |
| `mvcc:leggi-orizzonte` | `csn:leggi-frontiere-csn`: ultimo-high/low and H-high/low in same sample. |
| `mvcc:orizzonte-raggiunto-p` | Snapshots use connection to canonical sample, without accessing private CSN fields. |
| Old registry health | Archivio boundary handles CSN fault, invalidates snapshots, and isolates domain. |

No aliases permit constructing old registry.
Numeric high/low APIs are not capabilities for external input; token
remains bound to Archivio registry. A current GET does not consult CSN.

<a id="conservazione-delle-evidenze"></a>

## Evidence preservation

Initial compilation-only and static-check campaign remains intact
in the [historical catalog](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-csn-origine/catalogo.lisp).
Reports were moved without changing bytes, distinguishing them from the
[canonical-registry campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-csn/catalogo.lisp).
Previous implementations remain in Git history. Preservation
does not promote old static checks to concurrent qualification.
