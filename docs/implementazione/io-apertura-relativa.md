<a id="apertura-readonly-dalla-directory-posseduta"></a>

# Read-only opening from an owned directory

> **API proposal** — Application contract implementing COD-37 read-only
> opening on ADR-0017 platforms without changing
> ADR-0040 formats or decisions.

`io:apri-lettura-nella-directory` receives an open directory capability
and ASCII leaf name and returns two values: a new read-only
capability and size observed through its own FD. Name
is copied before I/O. Parent and existing capabilities remain
caller-owned; only acquired child is closed if the call
fails before publication.

Opening is relative to parent FD, with `NOFOLLOW`, `CLOEXEC`, and
`NONBLOCK`. Only regular files are allowed. Exact device/inode
comparison with relative entry precedes return. The controller
owns namespace and prevents concurrent mutation: checking
does not replace that precondition and is not an atomic snapshot.

| Option | Contract |
|---|---|
| `max-transfer` | 1…256 MiB, default 256 MiB |
| `max-file-bytes` | 0…`most-positive-fixnum`, default 4 GiB−1; zero only for empty file |

Parent backend is inherited. Optional callbacks
`open-relative`, `file-metadata`, and `entry-identity` described
in the [preregistered method](io-apertura-relativa-metodo.md) are required;
absence causes rejection before opening without native fallback.
Existing APIs and callback `identity` retain their contract.

Size is an `fstat` snapshot and does not modify written/durable
frontiers, which remain zero. It certifies neither header, CRC, valid
prefix, commit, nor durability. Use in [vertical proof](prova-verticale.md)
readers passes capability and size from the same
open; remaining bootstrap and coordination
stay C4.

The [method](io-apertura-relativa-metodo.md) specifies budgets, errors,
ownership, and decisions; [two C1 readings](io-apertura-relativa-revisione.md)
precede executions. This API performs no rename, deletion, creation,
or writable reopening. [Owned source collection](fonti-recovery.md)
now acquires ACTIVE/CLOSED set with budgets and cleanup; recovery
coordination remains a subsequent increment.

[Preserved local tests](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-16-io-apertura-relativa/README.md)
distinguish full checking on the frozen commit from later
integration. The [collection report](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-16-io-apertura-relativa-collection/collection.lisp)
and independent checker certify closed-archive preservation.
The [integration supplement](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-16-io-apertura-relativa-integrazione/README.md)
separately preserves first CI and local verification of composition
with directory-based ID selection and canonical names; I/O code remains unchanged.
