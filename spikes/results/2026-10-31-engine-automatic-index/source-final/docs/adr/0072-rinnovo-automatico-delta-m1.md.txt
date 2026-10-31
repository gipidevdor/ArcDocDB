# ADR-0072 — Automatic M1 delta renewal before document writes

- **Status:** Accepted in the incremental implementation authorized on 2026-10-31
- **Date:** 2026-10-31
- **References:** ADR-0068, ADR-0069, ADR-0071; REQ-IDX-012, INV-I1, INV-I8, INV-A8, INV-P6

## Decision

An optional immutable renewal configuration can be attached to an already
active M1 paged image with a delta. PUT and DELETE then renew automatically
before committing when either the existing key/byte threshold is reached or
the next key would exceed delta capacity. A key larger than an empty delta
is rejected before building an image. Ordinary input and resident-capacity
validation also precede renewal. There is at most one renewal per request.

Configuration supplies the first image option, threshold policy, maintenance
array-payload budget, page limit, and finite maximum renewal count. Each
engine owns its own ordinal; names use consecutive image IDs, without wrap,
search, overwrite, automatic deletion, or retry. An occupied name or exhausted
configured sequence is an explicit preflight rejection. This bounds generated
image count per configuration; callers must also reserve disk capacity.

Preflight validates the full existing renewal reservation and fresh namespace
before admission. One continuous BUSY scope covers construction, verification,
publication, and the following document commit. The renewal is a derivative of
the state before that document write; it consumes no CSN and acknowledges no
document. Errors or nonlocal exits after admission fault the engine, even if
only the derivative was published. Recovery uses the existing canonical WAL.

Configuration is volatile and explicitly installed per engine; sharing an
immutable configuration does not share an ordinal. Disabling the delta or
retiring the paged view clears automatic renewal. Startup behavior and the
resident path are preserved. No maintenance occurs during GET.

## Boundaries

This automates bounded-delta maintenance, not RAM-based backend selection.
The resident index and existing producer/recovery dependencies remain.
Renewal can block on existing synchronous I/O. The normal no-renewal path
introduces no intentional allocation; image construction and option creation
are maintenance allocations under the existing payload/runtime distinction.
There is no new durable format, commit point, or lock-free claim.

## Verification

The [preregistered method](../implementazione/rinnovo-automatico-m1-metodo.md)
covers both formats, three page sizes, exact thresholds and reservations,
finite naming, independent engines, invalid-write non-effects, continuous
admission, error/exit boundaries, process crashes, and allocation windows.
