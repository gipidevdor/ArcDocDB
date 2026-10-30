<a id="costruzione-delle-immagini-dal-motore-m1"></a>

# Building images from the M1 engine

> **Decided (2026-10-29 → [ADR-0065](../adr/0065-costruzione-immagini-dal-motore.md))** —
> M1 producer prepares a derived object from its canonical source and verifies
> it fully before success. Resident index remains present.

```lisp
(let ((option (arcdocdb.engine:crea-opzione-indice-paginato
                "primary-0000000000000001.idx.tmp" :page-size 4096 :frames 2)))
  (arcdocdb.engine:costruisci-indice-paginato-motore engine option
    :max-build-payload 67108864 :max-pages 65536))
```

Engine must be READY, called by its own actor, with no requests
in flight. Option specifies a new name in already exclusive directory;
its hexadecimal ID must be in 1..2^60-1. Return is same `option`
object: can pass it to `apri-motore :index-image` after closing
current handle, or to later [hot activator](attivazione-indice-m1.md)
on same handle with a distinct request. Success does not change current backend or
retain image FDs. Subsequent write makes file obsolete;
startup will continue rejecting it if it no longer matches source.

<a id="piano-e-costruzione"></a>

## Plan and construction

Plan acquires canonical fragment, source token,
revision, and live count from depth=0 M1 root. Before arrays it checks
maximum load; then visits at most C slots, checking controls,
seqlock payload, and arena ranges. Every LIVE must contribute exactly
once; fingerprints must match recalculated digest.

Two C-sized u32 arrays retain high/low digests; two N-sized u32 arrays retain slot
IDs and scratch. Eight stable eight-bit radix passes sort only
IDs. The 256 counters are reused. Keys are neither sorted nor duplicated in
plan and source index is not modified.

Producer chooses bit count from required bucket count,
limited to seven per directory. For a sorted span, first and last
digests identify common prefix: that prefix is skipped.
Child's remaining bit field is strictly smaller; recursion has at
most 65 calls. All identical digests end in overflow bounded
by count N. A bucket holds at most 28, 112, or 448 entries at
three sizes; a directory at most 128 references. References
checked and written postorder, root last.

`crea-entry-costruzione` now accepts `:start` and `:end`: checks range,
key-len and metadata, computes digest on span, and makes one owned
copy. Previous calls without keywords retain contract.

<a id="limiti-risorse-e-guasti"></a>

## Limits, resources, and faults

`:max-build-payload` accepts 0..512 MiB, default 64 MiB. Conservative
reservation calculated by `payload-costruzione-immagine` before
arrays/files: 16*C for digests/IDs, counters and words, stack of 65*128
references, maximum key batch, builder and verifier buffers,
plus 256 KiB for small identity/proof/cache arrays. Does not measure
Lisp headers, objects, garbage, GC, or RSS; total controller reservation
not qualified by this test. N and C limits still those
of M1 resident, at most C=65536 and N=57344.

`:max-pages` accepts 1..65536. Maximum file bytes, size, cache
frames, and verification visits come from existing option. Every batch checks
quota before writing: entire image is not reserved upfront.
A late failure leaves prepared file and makes engine FAULTED.
Canonical inventory neither selects nor deletes that prepared file.

Occupied name and invalid initial configurations/quotas are ordinary
rejections before admission. Namespace errors make FAULTED.
During work API prevents reentry with BUSY, without changing existing GET
root. Allowed errors/nonlocal exits close admission; cleanup
attempts both FDs and preserves primary cause. Does not accumulate FDs
in engine list, even on failure. Does not delete file or
reuse a name or incomplete builder.

Observable phases are `:image-build-planned`, `:image-build-created`,
`:image-build-pages`, `:image-build-before-footer`, `:image-build-after-footer`,
`:image-build-after-flush`, and `:image-build-verified`. Trusted observer
returns NIL; does not modify private data, retain buffers, or reenter.

Completion seals/flushes file, fsyncs directory, closes
append, and opens read-only with exact EOF. Existing verifier rereads
all pages, uniqueness, routing, and candidates against resident. Source
and revision rechecked before footer and after verification.
No new data commit point or catalog publication.

<a id="verifica-e-decisioni-c1"></a>

## Verification and C1 decisions

[Engine tests](../../tests/engine/image-build.lisp) and
[span tests](../../tests/index/page-build.lisp): v1/v2, all sizes,
600 keys, skewed prefixes, maximum key, empty/tombstone source,
GET comparison after restart, initial rejections, late exhaustion, reentry,
nonlocal exits, preserved IO cause, both closes attempted. Six
SIGKILL and independent-restart cases cover creation, pages without footer, and
completion after flush. Local process tests, not power loss.

Overflow branch with complete collision exercised by forcing only
digests in private C4 plan: builder recalculates actual key digests.
No real XXH64 collision claimed. Sorting comparison uses
separate u64 oracle and also checks slot permutation.

| Compound decision (COD-54) | Coverage |
|---|---|
| Payload and page budgets in domain | Invalid lower/upper bounds, exact reservation and minus one |
| Nonempty, contained arena span | Normal source and direct invalid-range tests |
| BUSY state, revision and source unchanged | Normal path, rejected reentry, altered revision |
| Depth, remaining bits, and plan span | Normal construction and separate guard rejections |
| Close after success with new cleanup faults | Two fake FDs, each close fails, complete T/NIL |
| Metadata/span in entry factory | Previous tests and new ranges/copy ownership |

First C1 reading: canonical source, unique slots, unsigned ordering and routing,
loop bounds, and decreasing depth. Second: capacity before
effects, at most two local FDs, cleanup on every exit, no ACK or
data mutation, stable source/revision, full final verification.
No new shared state or locks between Serie. Reproducible tests in
[spikes/results/2026-10-29-engine-image-build/](../../spikes/results/2026-10-29-engine-image-build/).

Automatic selection, writer delta, snapshots, durable catalog,
and total-quota qualification beyond RAM remain open. API builds a derived object
from M1 resident without increasing write capacity.
