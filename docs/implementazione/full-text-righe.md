<a id="directory-delle-righe-full-text"></a>

# Full-text row directory

The private directory connects posting row u32 to the pool's canonical reservation
and the [physical PUT reference](full-text-riferimenti.md). For the first NNTP
use, it traces a full-text result back to the article record without
depending on the WAL buffer's reusable incarnation. Row is not a newsgroup
article number, a Message-ID, or a hint ordinal.

<a id="proprietario-e-limiti"></a>

## Owner and limits

Every pool for a new ACTIVE owns two preallocated u32 arrays sorted by row:
keys and slot positions. The same row is allowed in separate pools; all index
generations of a document instead share a single local entry.
`0` and `UINT32_MAX` are valid keys: occupancy is determined by count.

Binary search performs at most 11 key comparisons with capacity 1..1024.
Insertion and removal move at most 1024 metadata pairs under writer
lease without reading the document. This is not engine-latency measurement.
The conservative C0 [reservation](full-text-riserve.md) limit grows by 8 bytes
per slot; the base also covers both array headers. Capacity belongs to the pool,
not an overall limit on articles storable by the future database.

The directory replaces linear duplicate scanning and changes only after
existing preflights. Pre-append cancellation removes the entry before
releasing sources and costs; idempotence and stale-token protection remain valid.
A transfer retains entry, slot, run, and costs. Retirement still requires a
dedicated protocol with authoritative outcome and quiescence.

<a id="ricerca-sotto-lease"></a>

## Lookup under lease

`admission:trova-riga-trasferita-full-text(pool, lease, row)` returns:

| State | Slot and generation |
|---|---|
| `:absent` | `nil`, `0`: no entry in current pool |
| `:pending` | `nil`, `0`: COPYING/READY, without exposing private PUT bridge handles |
| `:transferred` | Canonical slot and its generation, without commit certification |

`put:leggi-riferimento-riga-full-text(pool, lease, row)` returns eight values:
state, segment, offset, size, format, stamp-kind, high, and low.

| State | Other values |
|---|---|
| `:absent` | `0 0 0 0 :none 0 0` |
| `:pending` | `0 0 0 0 :none 0 0`: private reservation or reference not yet captured |
| `:sealed` | Verified stable position, v1/v2, ordinary `:csn` or prepared `:txid` |

Even a generic transfer without PUT stays `:pending`. Sealed reading
uses only reservation metadata and survives batch reuse; it consults
neither WAL, H, filesystem, nor 2PC outcome. Foreign leases or non-u32 rows are rejected
without effects. Inconsistent counters, canonical mapping, or physical phase cause
FAULTED; interrupted mutation retains slots, sources, and costs without rollback.

These APIs belong to the writer. Arrays are shifted and cannot
be shared with concurrent readers. The immutable delta-view map,
publication, snapshots/MVCC, prepared-record resolution, directory recovery,
and connection to the complete query remain to be implemented. No full-text
requirement is closed across its overall scope.

<a id="verifica"></a>

## Verification

The [preregistered method](full-text-righe-metodo.md) uses an independent associative
model, 64 insertion/cancellation/transfer sequences, u32 extremes,
capacity 1/1024, memory limits, rejections without effects, and injected failures. Existing
reservation and PUT measurements include lookup; four private contexts use the
same rows. A mutant that always returns absent must be detected.
Instrumented coverage remains diagnostic and separate from heap measurements;
independent review, MC/DC, and C1 qualification remain open.
