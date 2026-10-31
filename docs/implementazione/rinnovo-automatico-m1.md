# Automatic delta renewal in M1

[ADR-0072](../adr/0072-rinnovo-automatico-delta-m1.md), REQ-IDX-012;
INV-I1, INV-I8, INV-A8, INV-P6. C1, one serial M1 owner.

```lisp
(arcdocdb.engine:configura-rinnovo-automatico-motore engine
  (arcdocdb.engine:crea-opzione-rinnovo-automatico
    (arcdocdb.engine:crea-opzione-indice-paginato
      "primary-0000000000000100.idx.tmp")
    :max-renewals 64 :max-maintenance-payload 67108864 :max-pages 65536))
```

The engine must already have an active paged image and positive delta quotas.
The first option supplies the next image ID and page/cache/visit/file budgets.
An immutable `:policy` uses the existing key/byte percentage (default 75).
Configuration is shareable; each engine separately owns its used ordinal.
Installing NIL disables automation. Installing configuration resets the ordinal;
existing names still cannot be reused. Configuration has no I/O or durable effect.

## Write path

PUT/DELETE validate the record and resident capacity first. Automatic preflight
checks that the key fits an empty delta, validates counters and existing exact
membership, then considers both current threshold and next-key capacity. Thus
a long new key can require renewal even below the configured percentage.
An unpublished existing key is an error even when the threshold is reached.

Below threshold with sufficient capacity, preflight returns NIL without I/O,
name creation, ordinal mutation, or intentional allocation. GET performs no
maintenance. Without configuration the previous delta-capacity behavior remains.

When needed, preflight creates one fresh option, checks the complete existing
[renewal reservation](rinnovo-indice-m1.md) including old/new cache and delta
arrays, and rejects an occupied name. One BUSY admission then covers image
construction, full verification, swap/old-FD closure, and the ordinary document
commit. No public request can reenter from any observer. The
`:automatic-index-renewed` observer runs after image publication and before
document WAL effects; its state is checked again before continuing.

The derivative contains the state **before** the pending document. It consumes
no CSN. The normal commit supplies the document's one CSN and ACK. Each request
can renew at most once; there is no automatic retry. The next successful write
uses the new delta with unchanged key/byte quotas. A published image may become
stale immediately after that write; restart verifies candidates against the
canonical replay as before and must not adopt that stale image.

## Bounds and failures

| Boundary | Outcome |
|---|---|
| Invalid document, resident capacity, key too large for empty delta | Original rejection before image creation and CSN assignment |
| Insufficient full renewal payload, occupied name, exhausted sequence | Rejection with READY, old view/delta/FD, ordinal, data and CSN preserved |
| Error/nonlocal exit after BUSY, including derivative-only work | FAULTED, primary condition preserved; no document ACK |
| Complete derivative followed by document commit failure | Existing WAL recovery decides the document; image completion is not evidence of its commit |
| Manual activation/renewal without delta, or paged retirement | Automatic configuration and ordinal cleared with the view change |

The sequence has 1..65,536 renewals (default 64); first ID plus limit minus one
must fit 1..2^60−1. Names advance consecutively, without scanning, wrap,
overwrite or deletion. File/page/visit limits apply to every renewal. Total disk
reservation must include the configured possible image count; old derivatives
are retained. Explicit reconfiguration is required after exhaustion.

The payload quota covers arrays; runtime objects, option strings, Lisp headers,
GC, resident index, and RSS need separate reservation. Option creation and image
production allocate only on the maintenance branch. A capacity crossing may
construct the existing resource condition as part of that branch. The common
successful preflight has bounded probes and no deliberate allocation.

## Review and scope

| Compound C1 decision | Independent cases / positive control |
|---|---|
| Correct first option and policy types | invalid first; invalid policy; valid pair |
| Renewal-count, payload, page domains | each domain independently invalid; minimum and maximum endpoints |
| Configuring requires image and delta | image absent with delta retained; paged without delta; valid overlay |
| Planning requires retained image and delta | independently missing image/delta fault; valid pair |
| Threshold OR next-key saturation | existing-key threshold-only; below-threshold arena crossing; neither |
| Execution requires BUSY, configuration and delta | independent invalid admissions; normal write |
| Post-renewal BUSY, READY and healthy controller | each independently falsified before pending WAL; valid write |

Two C1 readings cover preflight non-effects, publication/commit ordering and
fresh names, then bounds, ownership, cleanup, accounting, and primary errors.
The [preregistered method](rinnovo-automatico-m1-metodo.md) separates crash,
allocation, and whole-suite verification.

This is automatic delta maintenance. RAM-based backend selection, releasing
the resident index, bounded beyond-RAM recovery, snapshots, concurrent readers,
and formal lock-free progress remain open. No OS-memory heuristic, timer,
background task, commit protocol, or durable catalog is introduced.
