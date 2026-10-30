<a id="riferimenti-fisici-dei-put-full-text"></a>

# Physical references for full-text PUTs

The [PUT/WAL bridge](full-text-put.md) now retains a stable physical reference for
every transferred reservation. The [private row directory](full-text-righe.md)
resolves it under lease; it serves the future published delta map and connects
an NNTP article's postings to the same-version record, even after
writer reuses WAL buffer. It is not yet a published view.

<a id="cattura-prima-dellio"></a>

## Capture before I/O

`cattura-riferimento-put-full-text(pool, lease, slot, generation, registry, log)`
requires append-returned token, canonical queue lease, and batch
sealed with `wal:sigilla-lotto-con-csn`. Batch must still be SEALED and
not owned by an I/O group; CSN token must be pending and bound
to exact register/log objects. Simple `sigilla-lotto` with caller stamp
does not supply this authority and is rejected.

Function checks original binding's incarnation, ordinal, and range,
header-only CRC (20 bytes), format, span, PUT type, and flags. On append, bridge
retained worker-private frame flags and stamp; on capture verifies
that prepared record retains same TXID while ordinary record carries batch CSN.
It neither recalculates body CRC nor reanalyzes document under lease.

Reference fixed in reservation's already preallocated fields; constructor's
conservative 1024-byte per-slot allowance includes this metadata.
No allocation, key lookup, I/O, or H consultation added.
Offset and length must remain representable before mutation.
Budget pressure continues to be checked before append; an internal
inconsistency after SEAL requires fail-stop, without converting a decision to abort.

Result `:sealed` indicates complete in-memory capture. SEAL is not yet
necessarily written or synchronized and document is not published. Caller
must capture all required references before delivering batch to I/O.
Pool, catalog, physical-log, and initial-position canonicality remain with runtime
and Segment Manager, as in WAL bridge. Segment headers,
inventories, Serie contracts, or an existing file are not verified here.

<a id="lettura-dopo-il-riuso-del-buffer"></a>

## Reading after buffer reuse

`leggi-riferimento-put-full-text(pool, lease, slot, generation)` returns:

| Value | Meaning |
|---|---|
| row | Proposed run row; not a hint ordinal |
| segment | u32 ID of ACTIVE bound to reservation |
| offset | Record position in file: batch start plus relative start |
| size | Exact record length, without SEAL |
| format | v1 or v2 |
| stamp-kind | `:csn` for ordinary, `:txid` for prepared |
| high, low | Two u32 words of verified stamp |

Getter reads slot only, without accessing WAL buffer. Reservation generation
remains valid because transferred-slot reuse is not introduced. Old
`leggi-legame-put-full-text`, in contrast, continues rejecting obsolete buffer
incarnation. Physical reference neither extends that loan nor establishes commit.

Preserving `:txid` is essential for NNTP cross-posts: CSN of a batch containing
a prepared record is not its effective CSN. The latter requires authoritative
2PC/OUTCOME result, not produced by this increment. Getter does not convert TXID to CSN.
Even a `:csn` stamp alone certifies neither visibility nor durability.

<a id="errori-e-ownership"></a>

## Errors and ownership

Wrong token or authority, open batch, manual seal, late or repeated capture
rejected before effects. Inconsistent headers, internal overflow, or incomplete
exit during capture make pool and batch FAULTED, retaining bytes, costs,
and CSN obligation. Writer boundary must stop Serie; no rollback or ACK.
Missing or partially captured reference is not returned.

Captured fields do not change and preparation context remains reusable.
Slots, runs, file budget, or batch references are not released: safe retirement
still requires publication and quiescence protocols. Getter retains
writer lease; it is not an entry for concurrent readers or NNTP daemon.
Other Serie share no counters or locks of this mechanism.

<a id="verifica-e-limiti"></a>

## Verification and limits

Nine new tests bring full-text total to 102, including 27 PUT/WAL-bridge tests.
Cover v1/v2, ordinary/prepared records, stamps through UINT64_MAX, ordinal different
from row, record offsets after preceding records, real batch reuse, corruption
even with recalculated header-CRC, wrong authority, and interrupts before/after
capture. CRC probe checks one 20-byte read and none in getter.
Four independent writers complete references with bounded waits.

Native test writes segment header and batch, synchronizes, closes, and reopens
read-only: bytes reached through reference match independent
bitwise encoder. Fixture models publication needed to resolve
batch token and reuse it; this is not product primary/delta publication
and does not decide a prepared transaction.

Existing PUT measurement now includes WAL closing and one thousand captures/getters,
remaining one of six measurements excluded from instrumented coverage. Fourteenth
mutant checks that header verification cannot be omitted.
The [preregistered method and readings](full-text-riferimenti-metodo.md) and
[original records](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-17-fulltext-physical-dev-targeted/README.md)
distinguish local tests from overall qualification.

Remaining: row uniqueness and delta-map composition, prepared outcomes,
atomic document/posting publication before H/ACK, MVCC/EBR acquisition,
Query Engine, and safe retirement. No overall requirement declared
qualified, no format or ADR changes, no full-database benchmark.
