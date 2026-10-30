<a id="adr-0063--completamento-e-verifica-readonly-delle-immagini-primarie"></a>

# ADR-0063 — Completion and read-only verification of primary images

- **Status:** Accepted in the incremental integration authorized by the author on 2026-10-28
- **Date:** 2026-10-28
- **References:** ADR-0057, ADR-0058; REQ-IDX-010, INV-I8, INV-A2, INV-A8, INV-P6
- **Relationship to the specification:** makes a derived container concrete; no amendment to WAL, SEAL, EDIT, DECISION, or catalog

<a id="decisione"></a>

## Decision

A private image uses an initial zero page, contiguous ARCIPG01 pages
from the same domain/generation, and a final ARCIRF01 page. The final
page describes root, page/entry counts, seed, and binding to the canonical source:
Archivio, Serie, CSN, and a 32-byte token supplied by authoritative recovery.
The token is a trusted identity of the canonical plan, not a hash calculated by
this codec or a cryptographic guarantee. The controller prevents its
reuse for different plans, including compactions at the same CSN.

ARCIRF01 version 1 has a CRC32C checksum over the entire page except its final
four bytes. Geometry, offsets, and fields are specified in the
[contract](../implementazione/immagini-indice-paginato.md). The root is
the last data page: an old proof or incomplete batch is not sealed.
Preparation binds exactly the append file to the builder, writes
the footer, and completes a durable flush before returning. A sealed
builder cannot add more pages; an incomplete effect is FAULTED.

Restart reads exclusively through a retained read-only capability,
with exact EOF observed by the controller. Footer, source, seed,
prefix, all pages, digests, and keys are verified. Every entry must be found
from the root in the same physical slot: two copies of the same key cannot
both pass the check, even with identical payload.
A trusted validator attests every candidate against the already recovered
source, whose exact count must match. Uniqueness, membership,
and exact cardinality establish entry coverage. Structurally valid
pages without reachable entries may remain unused;
reachability of every physical page is not certified.

Verification has bounded working memory, without a resident bitmap of all
pages or keys, and a cumulative visit budget. Exhaustion and failure
are not key absence. No partial image is returned as
ready. A serial view adopts only verified read-only proofs of the same
source; a source change invalidates the previous view.

<a id="autorita-rollback-e-limiti"></a>

## Authority, rollback, and limits

The footer is a derived object's completion indicator, **not a data commit**
or a new source of truth. A complete image surviving
even without flush acknowledgment can be revalidated read-only: validity
depends on bytes and the committed source, not its ACK history.
An incompatible/corrupt image does not change the source: the future
controller will explicitly choose rebuilding or an error.

This increment does not authorize renaming through an API requiring an
absent catalog decision. Canonical name, inventory, reuse of derived objects
in M1 startup, writer delta, MVCC, and automatic migration remain to be
integrated. Publication here is only the private serial view's
root; no concurrent swap or durable catalog swap is claimed.
Rollback removes a derived container, rebuildable from sources: no
migration or deletion of user data and no new lock between Serie.
