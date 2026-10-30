<a id="rinnovo-seriale-dellimmagine-m1"></a>

# Serial M1 image renewal

> **Decided (authorized incremental integration → ADR-0068)** — C1;
> REQ-IDX-009, REQ-IDX-010, INV-I8, INV-I1, INV-A8, INV-P6.

```lisp
(arcdocdb.engine:rinnova-indice-paginato-motore engine fresh-option
  :max-maintenance-payload 67108864 :max-pages 65536
  :delta-keys 1024 :delta-key-bytes 65536)
```

The function returns the same option after building, verification, and
activation. The name must be new and valid for the M1 producer; no name
is generated or reused automatically. It works from the resident index
or with an already active image/delta. Delta defaults are zero/zero:
the first subsequent write retires the image, as with simple activation.
With delta enabled, PUT/DELETE retain the image under
[ADR-0067](../adr/0067-delta-seriale-indice-m1.md).

The old delta may be full. Maintenance is not a write and does not use
its quota: it builds from the canonical resident index, which also contains
the updates represented by delta. After the swap, the new delta is empty.
The same quota can therefore admit more keys. An old image or one missing
a deletion is not reactivated.

<a id="admission-e-memoria"></a>

## Admission and memory

1. READY owner: validates total quota (0..512 MiB), page limit (1..65536),
   pair of delta quotas, and fresh name.
2. BUSY: allocates new delta and plan, builds/seals the derivative, and closes
   local build files. Reentrant GET, PUT, DELETE, and maintenance are rejected
   from all callbacks.
3. `:image-renewal-built`: rechecks plan source and revision after the callback.
4. Reopens read-only, verifies completely, and publishes through existing
   activation, with a recheck before swap. Closes the old FD.
5. Checks BUSY/READY/healthy controller, completes, and releases BUSY.

Reserved payload:
`payload-costruzione + payload-attivazione + payload-nuovo-delta`.
Activation already includes the old reader/cache and old delta. The plan
and build buffers may remain retained during activation: the sum avoids
assuming GC reclamation. The quota excludes headers, objects, GC/RSS,
and resident runtime resources, which the controller must reserve separately.
Insufficient budget is rejected before file creation, even if building alone
would fit the quota.

Renewal is a serial maintenance request, with synchronous M1 I/O;
it is not called from the hot PUT/GET path. Only one Serie remains excluded;
no shared write, lock, or wait between Serie. Loop and depth bounds are
those of the producer and checker already qualified locally.

<a id="guasti-e-restart"></a>

## Failures and restart

Ordinary preflight preserves READY, the old image, delta, frontiers, and files.
After admission, errors and nonlocal exits produce FAULTED while retaining
the primary cause and attempting cleanup. Before swap, previous references
remain owned; after swap, the new file remains owned and the old one is
not restored. No automatic retry, truncation, or deletion.

The data atomicity point remains SEAL: renewal writes no new canonical data
and acquires no CSN. It does not update CONTROL/catalog. SIGKILL leaves an
incomplete candidate or a complete verifiable image; segment replay is always
authoritative, regardless of whether the volatile swap occurred. Startup
without an option remains resident; explicit selection of a complete file
requires a match with the entire current source.

<a id="decisioni-e-revisione-c1"></a>

## Decisions and C1 review

| Decision | Test |
|---|---|
| Valid total quota and pages | Negatives, nonintegers, endpoint+1; rejection before creation |
| Entire payload fits quota | Exact value and one byte insufficient; build-only quota insufficient |
| BUSY, READY, healthy controller postconditions | Each condition falsified separately after publication |
| Plan source and revision intact | Each mutated at the callback between building and activation; no activation opening |
| Complete exit or primary cause | Normal, admitted page quota error, nonlocal exit at four frontiers |
| Ownership before/after swap | Old FD/delta retained before, old FD closed and new delta empty after |

Two readings: source/revision, membership, and phase order; then reservation
without implicit GC, FD ownership, cleanup, and failure boundary. Reused internal
decisions retain their modules' C1 tables. Ten targeted cases include v1/v2
with 4/16/64 KiB pages, quota cycles, twelve callbacks without reentry, long
keys with a common prefix, original cause, and six SIGKILLs. [Record and limits](../../spikes/results/2026-10-30-engine-image-renewal/report.md).

The resident index remains complete, without reducing its memory. Renewal
does not yet implement automatic policy, a durable catalog, concurrent snapshots,
or an autonomous paged writer. Old derivative files remain on disk; removal
requires the proof protocol specified by storage rules.
