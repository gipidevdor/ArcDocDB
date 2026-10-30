<a id="adr-0068--rinnovo-seriale-delle-immagini-e-del-delta-m1"></a>

# ADR-0068 — Serial renewal of M1 images and delta

- **Status:** Accepted in the incremental integration authorized by the author on 2026-10-30
- **Date:** 2026-10-30
- **References:** ADR-0065, ADR-0066, ADR-0067; REQ-IDX-009, REQ-IDX-010, INV-I8, INV-I1, INV-A8, INV-P6
- **Relationship to the specification:** no new authoritative format or durable point; serial composition of previous APIs

<a id="decisione"></a>

## Decision

`rinnova-indice-paginato-motore` builds a new image from the current canonical
source, verifies it, and activates it with an optional empty delta.
A single BUSY admission prevents GET, writes, and callback reentry until
completion. There is no READY interval between production and activation.
The separate ADR-0065 and ADR-0066 APIs retain their respective contracts.

Preflight verifies quotas, new name, and memory for the entire request
before creating the file. Reservation adds construction payload, activation
payload including old cache and old delta, plus
the new delta. It does not assume the GC reclaims arrays between phases.
Objects, headers, GC, and RSS remain in the separate controller reservation.

The plan's source and revision are rechecked after construction,
including after the `:image-renewal-built` callback, before opening for
activation. Activation rechecks the entire file against the same
current source and rechecks the source before the swap. Until then, the
old view and delta remain owned. The private swap replaces
view, file, and delta together; it closes the old FD under ADR-0066.

Data, CSN, and WAL do not change. There is no catalog decision:
publication is volatile and selection remains explicit on restart.
A complete new image, even if unpublished before the crash, can
be used only after normal verification against the current source.
An incomplete image is rejected; no file is overwritten or deleted.

<a id="errori-e-limiti"></a>

## Errors and limits

Invalid quotas, insufficient quota, or an existing name preserve READY
and the old view without consuming a CSN or creating a new file. Namespace
errors follow producer preflight. After admission, every error
or nonlocal exit makes the engine FAULTED, preserving cause and cleanup: no
rollback to a consumed FD. Late page-quota exhaustion may leave
an incomplete derivative. After the swap, the new FD belongs to the engine even
if the callback prevents normal return.

Renewal releases the delta's logical quota for subsequent writes;
the caller chooses when to request it and supplies a fresh name. It is not
an automatic attempt in PUT, does not exceed resident capacity, and
does not promise RSS quota, automatic selection, snapshots, or a durable catalog.
[Contract and verification](../implementazione/rinnovo-indice-m1.md).
