<a id="creazione-del-temporaneo-dalla-directory-posseduta"></a>

# Creating a temporary file from the owned directory

> **API proposal** — completes ADR-0017's relative I/O boundary,
> without changing formats, decisive records, or ADR-0040 reconciliation.

`io:crea-temporaneo-nella-directory(directory, nome, …)` creates a new
empty regular `.tmp` file and returns an owned append capability.
The parent remains borrowed and reusable. Creation uses its FD,
even if the directory's original path is renamed.

The printable ASCII leaf name is copied before I/O.
Separators, NUL, and dot paths are excluded; limit 255 bytes and suffix
must be `.tmp`. The name `.tmp` itself is allowed, as in the
existing API. An already occupied name is rejected without modifying it.

| Option | Contract |
|---|---|
| `max-transfer` | 1…256 MiB, default 256 MiB |
| `max-file-bytes` | 1…`most-positive-fixnum`, default 4 GiB−1 |

The native path uses `openat` with exclusive creation, append,
`NOFOLLOW`, `CLOEXEC`, and mode 0600 filtered by process umask.
The fourth variadic argument receives mode promoted to `int`, per
the ABI including Darwin ARM64. Before publication, `fstat` must
establish an empty regular file and device/inode must match the nofollow
entry in the same parent. The controller owns namespace and
prevents concurrent changes or closes during the call.

Backend is inherited from parent. Required: `create-relative`,
`file-metadata`, and `entry-identity`; a missing callback rejects
the operation before I/O, without fallback. Creation callback
receives `(fd-parent, foglia-privata, :append)` and must implement the same
exclusive creation. Read-only API and its callback remain distinct.

New-file written/durable frontiers are zero. No
flush or rename occurs. A fault after creation closes the unpublished
child once, preserving primary cause and cleanup
failure. The created name may remain present: it is not deleted
implicitly. The controller must reconcile it according to the source of
truth; this API neither reserves a segment ID nor decides an EDIT.

The [vertical test](prova-verticale.md) uses the primitive for its
outputs. Naming, bootstrap, and fixture orchestration
remain C4. The [preregistered method](io-creazione-relativa-metodo.md)
defines decisions, errors, and test limits.
The [C1 readings](io-creazione-relativa-revisione.md) record sources
and static checks preceding execution.

[Preserved tests](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-22-io-creazione-relativa/README.md)
distinguish full R1 on freeze S1 from R2 integration check.
The [collection report](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-22-io-creazione-relativa-collection/collection.lisp)
and [independent checker](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-22-io-creazione-relativa-collection/closed-check.log)
establish closed-inventory preservation.
The [integration supplement](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-22-io-creazione-relativa-raccordo/README.md)
preserves R4, the first CI run failed in the report consumer,
regression before/after correction, and C4 checks on integrations.
