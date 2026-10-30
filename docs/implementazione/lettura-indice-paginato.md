<a id="lettura-seriale-dellindice-primario-paginato"></a>

# Serial reading of the paged primary index

Integration increment authorized on 2026-10-24: ADR-0057, ADR-0058,
REQ-IDX-001, REQ-IDX-009, REQ-LIM-003; INV-I8, INV-A2, INV-A8, INV-P6.
Connects [cache and I/O](cache-pagine.md) to traversal of radix directories,
flat buckets, overflow, and key chains. M1 engine still uses resident
primary: [incremental page construction](costruzione-indice-paginato.md)
now uses this reader in tests. Publication, PUT/DELETE, recovery, and automatic
selector not yet connected to paged backend.

<a id="api-e-ownership"></a>

## API and ownership

`arcdocdb.index.page:crea-lettore-indice-pagine(cache, root, :max-pages 1024,
:max-key-bytes 1048576)` copies root and prepares two scratch buffers of cache
size, plus a private identity cursor. Cache and reader share same
owning I/O actor; no concurrent or reentrant use. Immutable file
remains borrowed under cache contract. Image and references
stay stable for reader lifetime.

`leggi-indice-pagine(reader, key, start, end, high, low, destination)` accepts
a key span and Serie's trusted XXH64 digest, like resident advanced
interface. Controller must know authoritative seed.
Reader uses no implicit seed or digest as equality
proof. Root comes from controller; local page verification
alone certifies neither global coverage, correct dataset digests,
key uniqueness, nor entry visibility. These are image builder/verifier
obligations before publication.

Result is `:live` with five u64 words in DESTINATION or `:absent` without
modifying it. Layout compatible with resident primary candidate:
CSN, location (segment/offset), key length and live flags, record length,
END zero. Backend arena offset is zero: not a borrowed
key reference. Result does not authorize a document value: future
GET must apply MVCC, segment pin, CRC checks, and record-key
verification through existing protocols.

Caller identities remain immutable by contract. Representation
allows only cache and reader to update private cursors;
no setters or accessors exported. Cache preallocates an owned identity
per frame and copies cursor fields after verification, before making
slot valid. No longer retains caller cursor: reader advancement
does not change cached-page key. Frame-owned cursor
changes only after slot invalidation. Contract remains serial,
without frame leases or new shared writes between Serie.

<a id="attraversamento-e-limiti"></a>

## Traversal and bounds

Directories select a field of the 64-bit digest, including across
both u32 words. Fields at subsequent levels must lie below parent's
field without overlap. Directory after bucket and key page
in directory/overflow path are corruption. References decreasing
in offset and generation checked by codec on every load.

Bucket uses groups of 16: examines all group candidates before
stopping at EMPTY. Even after local miss follows any overflow.
Fingerprint and full digest filter candidates; inline or external key
bytes decide equality. External chains checked
through end even after mismatch: type, total, position, final
fragment, and references must agree with entry.

Every visit consumes a page credit, including cache hits and external
fragments; configurable limit 1..65536. Comparisons consume required
length before reading bytes, even if first byte differs;
cumulative limit 1..16777216. Credits reset for each lookup.
Exhaustion => `resource-exhausted`, never false absence. Different-length
comparisons read no bytes; external chains continue consuming pages.
Loops have explicit page, bucket-capacity, or key-byte bounds.

I/O miss remains blocking within its actor. Product memory is
O(frame-count * page-size) for cache, plus two scratch pages and
O(frame-count) metadata; no resident vector of all image PageRefs.
Cache payload limit is not total engine RSS quota.
No lock-free promise or beyond-RAM qualification derives from API.

<a id="errori-e-verifica"></a>

## Errors and verification

Preflight without I/O for owner, reentry, range, length, and scratch aliases.
I/O/CRC/identity/topology/limit failures occur before candidate copy;
DESTINATION intact. Every exit, including nonlocal loader
exits, releases BUSY. Errors publish no root and modify no
logs: FAULTED transition remains at future engine boundary.
No new durable atomicity point; rollback without data migration.

Method: manual fixtures independent of writer codec, three sizes, complete
collisions, EMPTY before candidate in same group, multilevel
directories, overflow, maximum key with one-frame cache, exact and
insufficient budgets, locally consistent but cross-page inconsistent corruption,
nonlocal exits, and reentry. Differential comparison with resident for
candidates and absence; its arena offset normalized. Six collisions
in differential respect resident's eight samples: with twenty
collisions that reader may return `:retry-limit`, not an absence
oracle. Paged reader checked separately with twenty collisions.
Allocation measurement separate from SB-COVER: inline hit, directory
with one frame, and maximum external key with one frame, CSN/location
high bits set. Does not measure RSS, latency, or concurrency.

| Compound C1 decision | Conditions and cases |
|---|---|
| Factory budget | integer pages 1..65536, integer bytes 1..16777216; minima/maxima, zero, negative, fractional, maximum+1 |
| Radix domain | bits 1..11, shift 0..63, sum <=64; codec geometry; independent numeric comparison at every valid shift |
| Bucket candidate | fingerprint, low, high, key bytes; complete collisions, different fingerprint/digest and different byte |
| Inline equality | same length and bytes; different length, same length with mismatch, hit |
| External chain | key type, total, and position; wrong type, wrong position, wrong total; maximum chain and last-byte mismatch |
| Next directory | bucket already seen or field beyond limit; wrong-type overflow and directory with overlapping bits |
| Input alias | bucket scratch or key scratch; preflight excludes both private sources |
| Positive codec CSN | positive low word or positive high word; maximum-CSN fixture, zero rejected, low-only/high-only CSNs |

Two C1 readings by same author: first, contracts/layout/budgets/topology;
second, cursor ownership, frame invalidation/publication,
error propagation, copying only after complete outcome, and u64-value
allocations. Neither independent review nor whole-engine MC/DC qualification.
