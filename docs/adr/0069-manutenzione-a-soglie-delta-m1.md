<a id="adr-0069--manutenzione-a-soglie-del-delta-m1"></a>

# ADR-0069 — Threshold-based maintenance of the M1 delta

- **Status:** Accepted in the incremental integration authorized by the author on 2026-10-30
- **Date:** 2026-10-30
- **References:** ADR-0067, ADR-0068; REQ-IDX-010, REQ-LIM-003, INV-I8, INV-I1, INV-A8, INV-P6
- **Relationship to the specification:** no new format or durable point; local policy for requesting serial renewal

<a id="decisione"></a>

## Decision

The controller can configure an immutable policy with an integer threshold
of 1..100 percent, default 75. Renewal is requested when either
touched-key count or occupied delta bytes reaches its respective
threshold. Comparison is inclusive and exact, with integer products that
remain SBCL64 fixnums, without floating-point rounding.

`rinnovo-indice-richiesto-p` returns the decision on the READY engine with
an active delta; it does not intentionally allocate, access files, or reserve
space. Out-of-quota or inconsistent counters, or a delta without a view,
make the engine FAULTED; a request in a legitimate mode without a delta is invalid.
The decision does not authorize admission of a future write.

`mantieni-indice-paginato-motore` returns `:mantieni` below threshold,
without creating files or consuming the candidate name. At threshold it requests
one ADR-0068 renewal, with a controller-supplied name and the same
key/byte quotas as the current delta; it returns `:rinnovato` only after success.
Total payload capacity and name freshness are checked
only if renewal is needed. Option domains are always validated.

There is no callback between reading counters and starting renewal: the serial
owner keeps the choice stable. Renewal excludes reentry through BUSY,
rechecks the source, and preserves ownership/errors under ADR-0068. Ordinary
preflight preserves READY and the previous delta; an error after
admission makes the engine FAULTED. No retry, timer, or new scheduler.

<a id="limiti"></a>

## Limits

The policy can be shared read-only among engines; counters and actuation
remain private to each Serie. The call is requested by the controller,
not inserted in the PUT/GET path. It does not generate names, release old files,
choose resident/paged mode, or reduce the resident in RAM.
A new key may still exhaust quota before the next check.
Durable catalog, autonomous paged writer, and automatic mode selection
remain open. [Contract and tests](../implementazione/manutenzione-indice-m1.md).
