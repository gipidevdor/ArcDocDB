<a id="attivazione-delle-immagini-sul-motore-aperto"></a>

# Activating images on the open engine

> **Decided (2026-10-29 → [ADR-0066](../adr/0066-attivazione-seriale-immagini-m1.md))** —
> Private serial publication after full verification and file closure on retirement.

```lisp
(let ((option (arcdocdb.engine:crea-opzione-indice-paginato
                "primary-0000000000000001.idx.tmp" :page-size 4096 :frames 2)))
  (arcdocdb.engine:costruisci-indice-paginato-motore engine option)
  (arcdocdb.engine:attiva-indice-paginato-motore engine option
    :max-activation-payload 16777216))
```

Both APIs require the READY owner with no other request in flight.
Construction retains the previous contract, with local FDs closed and
no implicit activation. Activation rereads the candidate and returns
NIL only after publication and close of its predecessor. Subsequent GETs
use the new root without restart. A write between the two calls
makes the file stale and is detected by source verification.

<a id="verifica-e-ownership"></a>

## Verification and ownership

During BUSY the engine captures the canonical index's source and revision,
opens the name read-only with exact EOF, and uses the same verifier as
startup: source/seed, CRC, all pages, routing, uniqueness, count,
and five-word comparison against the resident index. The controller rereads
source/revision before the swap. There are no concurrent GETs or mutations.

The open candidate is local. After verification, engine, view, and file
must be bound exactly; the same file object cannot
be installed in place of itself. Ownership of the new FD,
option, and view transfers, then the predecessor is closed. No files are added
to the engine's segment list: one active image and one
local candidate only. Even reactivating the same name rereads through a
new capability and closes the old one.

Retirement clears view, option, and ownership before close. It is used
by the first admitted write and final cleanup, including failed
startup. It intentionally allocates nothing and creates no retired-file lists.
A closed file remains unusable even if the old reader retains
warm frames: capability verification precedes every lookup.

`:max-activation-payload` accepts 0..512 MiB, default 16 MiB. The reservation is:
65536 + 65535 + 80 bytes, plus `(frame-nuovi + 5) * taglia-nuova`, plus
`(frame-vecchi + 2) * taglia-vecchia` if an active root exists. This is a
conservative array-payload reservation, including the retained old cache;
it does not measure Lisp headers, objects, GC, or RSS. Total controller
reservation and migration beyond RAM remain to be qualified.

<a id="errori-e-confini"></a>

## Errors and boundaries

Initially rejected budgets/configurations open no files and preserve READY.
From BUSY onward, all errors and nonlocal exits cause FAULTED,
according to the existing M1 boundary. Before publication, the local candidate
is closed and the old root/file remain intact; rejection does not
authorize further GETs on the FAULTED handle. Corruption or
budget exhaustion is not turned into absence or fallback.

After publication, the new file belongs to the engine and is closed
by final cleanup. A failed close of the predecessor or a later error
does not restore a root that might reference an already closed file. The
I/O module consumes state before the single close, without retries even for
an ambiguous outcome; its documented limits apply.

Before PUT/DELETE, retirement precedes CSN consumption and any WAL
effect. If close fails, commit does not start. Ordinary write
preflights instead precede retirement and leave the image intact.
Final cleanup still attempts all other resources and preserves every
secondary failure. No derived file is deleted or rewritten.

Observer phases: `:before-image-activation`, `:image-activation-verified`,
`:before-image-publication`, `:image-published`. It returns NIL, retains no
capabilities, and does not reenter the engine. Ownership/root changes occur
without an intermediate callback.

<a id="verifica-c1"></a>

## C1 verification

[tests/engine/image-activation.lisp](../../tests/engine/image-activation.lisp)
covers v1/v2, three sizes, repeated replacements with native FD counts,
GET after activation, old readers with warm caches, closure on retirement,
transient quota including the old backend, owner and non-reentrancy,
missing/corrupt/stale candidates, errors and nonlocal exits before/after swap.
Close tests use dummy capabilities only for ownership and injection;
end-to-end images are produced and verified by the product API.
A wrapper around real close simulates a negative outcome and verifies that the first
PUT does not consume a CSN or modify WAL. Six SIGKILL cases with independent processes
cover before/after swap and after the first write's flush in v1/v2. They
are not power-loss tests.

| Compound C1 decision (COD-54) | Coverage |
|---|---|
| Startup state and separate absence of view/file/option | Isolated guards and normal startup |
| BUSY, revision and source at final gate | Isolated guards and mutation before swap |
| BUSY, proof present, new file and exact binding | Dummy FDs with every rejection before mutation |
| Candidate present and ownership not transferred at cleanup | No open, pre-swap, post-swap |
| BUSY, READY and healthy controller at request end | Normal path and isolated guards after swap |

First C1 reading: fully verified candidate, intact source/revision,
old and new payload quota, serial publication without borrowers.
Second reading: at most two image FDs, ownership before closes,
primary cause preserved, retirement before WAL, and cleanup on every exit.
No new shared state/lock across Serie; the single M1 actor serializes
these operations. Evidence in
[spikes/results/2026-10-29-engine-image-activation/](../../spikes/results/2026-10-29-engine-image-activation/).

Activation is volatile: at restart `:index-image` remains explicit.
The resident index is still present and limits writes. No automatic
selection, writer delta, snapshots, or durable catalog is claimed.

<a id="estensione-del-delta"></a>

## Delta extension

[ADR-0067](../adr/0067-delta-seriale-indice-m1.md) adds the
`:delta-keys` and `:delta-key-bytes` options: both zero retain the retirement described
here; both positive preserve the image through PUT/DELETE with
[exact membership and separate quotas](delta-indice-m1.md). The previous
and new deltas are added to the payload formula above.
