<a id="adr-0066--attivazione-e-ritiro-seriali-delle-immagini-primarie-m1"></a>

# ADR-0066 — Serial activation and retirement of M1 primary images

- **Status:** Accepted in the incremental integration authorized by the author on 2026-10-29
- **Date:** 2026-10-29
- **References:** ADR-0063, ADR-0064, ADR-0065; REQ-IDX-010, INV-I8, INV-I1, INV-A8, INV-P6
- **Relationship to the specification:** no new authoritative format; updates paged-FD lifetime from ADR-0064

<a id="decisione"></a>

## Decision

The M1 actor can activate an existing private image on the READY engine,
without restarting, through `attiva-indice-paginato-motore`. The producer from
ADR-0065 remains separate: construction and activation are two requests,
each with its own budget and verification. If a write intervenes,
the stale candidate is rejected against the new source.

Activation excludes GET and writes through BUSY and again verifies
the entire image read-only against the canonical resident. Before
publication it rechecks revision and source. GETs continue using the
selector already installed in the immutable view; no result is
produced from a partial candidate or an error fallback.

The engine separately owns a single active paged capability,
its verified view, and the option used to construct cache and reader.
The new capability stays local during verification: at most two image
FDs at once. Preflight includes payload of retained previous
reader/cache and the new verification. Objects, headers, and GC remain
in the controller reservation; total/RSS quota is not qualified here.

The publication point is private and in memory only: ownership of the
new FD, option, and view transfers within the same serial section,
without callbacks or borrowers. The previous FD is then closed. No GET
runs concurrently and no physical reference leaves the handle, so
no new EBR protocol is needed. A close error after the swap makes the engine
FAULTED and does not restore an already consumed/closed capability.

This decision supersedes retention until handle close
specified by ADR-0064: the active FD is now closed when its image
is replaced or retired. The first admitted write retires view, option,
and ownership before close and before any CSN or WAL effect. A
failed close prevents commit, closes admission, and is not retried.
Inputs/capacity rejected before admission preserve the image.
Final cleanup attempts retirement before other resources and also closes
the file opened by incomplete startup.

<a id="errori-e-limiti"></a>

## Errors and limits

Insufficient initial configuration or quota preserves READY and the root.
As with other admitted M1 requests, any later error or nonlocal
exit makes the engine FAULTED, preserving primary cause and cleanup faults.
Before the swap, the old root and its FD remain intact, while the
local candidate is closed; continued service is not promised
after rejecting a corrupt candidate. After the swap, the new FD belongs
to engine cleanup, even if an observer interrupts the request.

Publication does not change CSN, WAL, CONTROL, or derivative files and is not
a durable catalog decision. On restart, selection remains explicit
through `:index-image`; without the option, M1 restarts resident. Automatic selection,
writer delta, snapshots, durable catalog, and release of the resident remain
to be implemented. Contract and tests in
[M1 activation](../implementazione/attivazione-indice-m1.md).
