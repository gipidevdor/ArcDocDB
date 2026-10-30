# ADR-0070 — Read-only discovery of M1 images at startup

- **Status:** Accepted in the incremental integration authorized by the author on 2026-10-30
- **Date:** 2026-10-30
- **References:** ADR-0063, ADR-0064, ADR-0068, ADR-0069; REQ-IDX-010, REQ-REC-001, INV-I8, INV-A8, INV-P6
- **Relationship to the specification:** extends ADR-0064's explicit selection; no new authoritative format or durable decision

## Decision

M1 startup may receive `:index-discovery`, an immutable configuration
with a page/cache/verification profile and inventory, candidate, and payload limits.
It is an alternative to `:index-image` and incompatible with `:create`. With neither
option, previous resident behavior remains.

After canonical recovery and checkpoint, still in RECOVERING and with an exclusive
namespace, the full inventory is enumerated within quota. Only
names `primary-<16 hex minuscoli>.idx.tmp` are considered; too many candidates cause
RESOURCE-EXHAUSTED before opening them, without choosing a subset.
Each candidate is opened read-only, probed at its footer, and closed. Only one
page buffer and one local FD at a time; no modification or deletion.

Impossible/incomplete geometry, incorrect footer CRC, a different profile, or a
nonmatching source are ineligible. A footer suitable for the profile is decoded
with the existing codec: unknown format and other structural errors with a valid CRC
propagate, as does every I/O, namespace, close, or budget failure.
Discovery is not an audit of abandoned derived files: an incorrect CRC may
also indicate bit rot in an old derivative, without authorizing its use.

Among eligible footers, the lexicographically greatest name is selected, i.e.,
the greatest hex label. This is only deterministic priority, not chronology,
CSN, or proof of commit. Source and revision are rechecked after all
callbacks. The selected name is then reopened and verified fully
against the canonical source using the ADR-0064 path, before READY.
Corruption or quota exhaustion during this verification refuses startup:
no fallback to the second candidate. A footer alone cannot be adopted.

With no eligible footers, the already rebuilt canonical resident index remains available.
Explicit selection retains its strict contract: an invalid explicit
candidate is not ignored. Discovery neither precedes nor bypasses
canonical recovery; an error in recovery precedes any search for derivatives.

## Limits and consequences

The quota covers two name inventories (characters up to four bytes),
candidate transient data, footers, and selected-image verification. The controller
separately reserves the resident index, objects, headers, and GC/RSS. The canonical
M1 inventory limits also remain; the new configuration does not increase them.

Selection and ownership remain volatile: no durable catalog, rename,
selection record, CSN, or new atomicity point. Automatic RAM-based
resident/paged selection is not implemented. The resident index remains complete;
the delta is not configured implicitly, and the first admitted write
retires the image, as in explicit startup. Delta, renewal, and maintenance
remain separate requests. [Contract and tests](../implementazione/scoperta-indice-m1.md).

Confirmation of source/revision, RECOVERING state, and a healthy controller is
also performed before publication, after the image-ready callback,
and after `:before-admission`, including explicit and resident paths.
Detected mutations prevent returning a READY handle.
