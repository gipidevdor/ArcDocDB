<a id="cache-dei-record-per-serie"></a>

# Per-Serie record cache

<a id="contratto"></a>

## Contract

`arcdocdb.cache` implements the in-memory partition planned by
[ADR-0025](../adr/0025-cache-per-location.md) and
[ADR-0044](../adr/0044-cache-acceleratore-puro.md): size classes,
eight-way sets, CLOCK replacement, lookup without locks, and opportunistic
insertion. The key is the physical location, not `_id`.

Requirements: REQ-CCH-001, REQ-CCH-002, REQ-CCH-004, REQ-AFF-002,
REQ-AFF-008, REQ-OBS-002. Invariants: INV-A2, INV-A8, INV-A12, INV-M3,
INV-P5, INV-P6. CLOCK policy is C3; copy and verification are C1.
Implementation is available; concurrent qualification remains open.

The cache does not determine visibility or commit. The caller first resolves
the committed version in the index, under the
[read context](compiti-lettura.md); it passes location, length,
key, CSN, flags, and format version. After the result, it completes
the snapshot check. The cache retains no files, epochs, snapshots,
index roots, or references to other Serie.

## API

```lisp
;; Controller configuration, outside the request path.
(crea-cache-serie sizes counts budget-payload :stripes 16)
(payload-cache-serie cache)

;; Location: segment-high/segment-low u32, offset u32; CSN: two u32s.
(cerca-record-cache cache segment-high segment-low offset record-length
                    key csn-high csn-low flags destination start
                    :version 2 :proof-buffer proof
                    :proof-start ps :proof-end pe)
;; => :hit | :miss | :verify-failed, value-start, value-end

(inserisci-record-cache cache segment-high segment-low offset record-length
                       key csn-high csn-low flags source start
                       :version 2 :proof-buffer proof
                       :proof-start ps :proof-end pe :scan-p nil)
;; => :inserted | :present | :busy | :unavailable | :bypassed,
;;    evicted-p, scan-without-reread-p
```

`sizes` and `counts` are simple u32 arrays, stable during construction,
not retained by the result. At most sixteen classes in ascending order;
sizes are powers of two between 1 KiB and 32 MiB. Sets per class
are zero or a power of two up to 65,536; zero omits that class.
The selected class is the first active one large enough for **the entire
record**, including header and key. A record beyond all classes bypasses
the cache. Cache configuration lowers no document
limit: a 16 KiB class can coexist with 16 MiB documents.

All-zero counts and zero budget produce an empty partition.
Stripe count is a power of two between 1 and 256, reduced to the number
of sets in each class. The controller checks every class
and the entire budget before the first arena allocation.

No public invalidation, relabeling, clearing,
or resizing operation. Nonreused segment-ids prevent confusing an
old location with a new file. Compaction warms new locations
through ordinary reads. Reclamation does not consult the cache.

<a id="layout-e-budget"></a>

## Layout and budget

Each way contains, in separate specialized arrays:

| Field | Payload |
|---|---:|
| Record | Class size |
| Tag: segment-high, segment-low, offset, length | 16 bytes |
| Seqlock sequence | 8 bytes |
| CLOCK, scan origin, reread, rejected, disabled | 5 bytes |

For a class with `S` sets and size `B`, payload is:
`8 × S × (B + 29) + S + 8 × min(S, strisce)`.
It includes CLOCK hands and the mutex-reference vector. Add
eight bytes per reference in the active-class vector.
The value returned by `payload-cache-serie` is immutable.

Lisp headers, mutex objects, alignment, worker buffers, previous
partitions, and pending garbage are excluded. The budget is payload,
not RSS or global budget: the scheduler must also reserve these costs.
Capacity is fixed; replacing a partition requires a controller
operation with publication and accounting for old references.
This scheduler connection is not yet implemented.

<a id="ricerca"></a>

## Lookup

1. Checks physical and format arguments, selects a class and set.
   Deterministic mixing includes 64-bit segment and 32-bit offset.
2. Examines at most eight tags. A provisional match starts **one** seqlock
   read: even counter, acquire barrier, tag and state, copy to private
   buffer, barrier, recheck counter and state.
3. Odd counter, counter beyond limit, change, or rejected/disabled way
   becomes `:miss`. It does not retry or read outside the set.
4. Verifies the private copy with `arcdocdb.record:verifica-put-parole`:
   header/body CRC, frame and exact length, PUT, flags, complete key,
   CSN or TXID and authoritative OUTCOME proof for a prepared record.
5. Only after verification returns `:hit` and the value range. Updates
   CLOCK and reread bytes: their values do not determine consistency or visibility.

`destination` is worker-exclusive scratch. It must hold the complete
record starting at `start` and must not alias arena, key, or proof.
A negative outcome may have copied provisional bytes: ranges are zero and
the caller must discard scratch. A condition or nonlocal
exit also makes the result unusable.

The same two-word verification is available to segment reads.
`verifica-put` retains its previous signature and delegates to the common
verifier; the v1/v2 frame does not change. The cache stores only PUT;
prepared proof is resolved by the caller and remains authoritative. A hit on a
prepared record requires proof already stable in the current task: the cache
does not certify multiseries commit by itself.

<a id="scarto-inserimento-e-clock"></a>

## Rejection, insertion, and CLOCK

A `corruption-detected` during verification of the **cached copy**:

- returns `:verify-failed`, without a value range;
- marks the way rejected without waiting;
- requires the caller to record metric/alarm `cache-verify-failed` and reread
  from the segment; only the latter can implicate persistent data.

The rejection bit is conservative: a concurrent replacement may receive
rejection intended for a previous copy. This causes an additional miss;
it does not validate an incorrect record. A subsequent insertion under mutex
can reuse the rejected way. Argument, resource, or invariant errors
are not absorbed by the corruption handler.

Insertion verifies **its own input** with the same verifier
before acquiring the stripe mutex, with `wait-p nil`:

- absent class: `:bypassed`; the caller remains responsible for
  verifying the segment record even when the cache is disabled;
- contention: `:busy`, no waiting or copying;
- same location already readable: `:present`, no copy;
- no victim with credit within two CLOCK passes: `:unavailable`;
- otherwise: odd sequence, barrier, record/tag/state, barrier,
  new even sequence, and `:inserted`.

Corruption of the buffer **inserted from the segment** propagates to the segment
caller, distinct from `:verify-failed`: it is not hidden as a cache
defect. The inserted copy is an additional verification; its CRC
cost relative to an already-verified read must be measured.
PUT and OUTCOME proof may occupy ranges of the same stable input
buffer: insertion only reads it. The proof-alias prohibition
concerns the destination modified by lookup.

CLOCK visits at most sixteen ways, clearing set reference bits.
Scans enter with reference zero; point requests with one.
The hand is masked to three bits, so it cannot leave the set.
A reread can set all references during both
passes: insertion gives up rather than waiting for a victim.

64-bit sequences bounded below `2^62`, no wraparound. A way with an unexpected
odd sequence, exhausted credit, or interrupted mutation is disabled
for the partition's entire lifetime. Cleanup disables it before releasing
the mutex and propagates the original error. Remaining availability may fall
to zero; the segment path remains available. There is no counter rollback
or reopening of a disabled way.

<a id="metriche-e-costi"></a>

## Metrics and costs

Enums distinguish hit, miss, verification error, contention, bypass, and
unavailability; the two insertion booleans describe eviction and scan
origin without observed reread. The caller counts them in worker
counters, aggregated outside the request path. No
central counter or write between Serie.

Heat and reread observation are approximate: a conservative write
by an earlier reader can affect the next victim.
Exposed scan pollution is a diagnostic metric, not a linearizable
count. Scheduler, aggregation, alarm, and a decision on 2Q remain
later integrations; policy does not change without measurements and an ADR.

The [publication and replacement suite](../../tests/cache/README.md)
adds deterministic way-state cases and tests with four
workers on the same set. The method distinguishes observed interleavings
from coverage of internal windows and full C1 qualification.

Lookup: at most sixteen classes, eight tags, one copy and one verification
proportional to record and any proof length. Insertion:
input verification, one mutex attempt, eight tags, at most sixteen
CLOCK visits, and one copy. No I/O or unbounded work in the module.
Specialized arrays, no per-entry object, CSN in two u32s. Allocations
and actual efficiency of success paths remain to be measured, as
do P95/P99 and scan pollution; they are not declared zero.

<a id="decisioni-c1-e-qualifica"></a>

## C1 decisions and qualification

| ID | Compound decision | Coverage still required |
|---|---|---|
| CCH-D01 | Configuration: sizes/counts, ordered classes, powers, and budget | Every limit, omitted class, zero budget, and allocation-free preflight |
| CCH-D02 | Nonzero location/CSN, key, record, range, and flags | Zero fields, u32/u64 endpoints, v1/v2, document limits |
| CCH-D03 | Destructive alias in reads, stable input in insertion, space, and prepared proof | Every alias, PUT/OUTCOME in same input, final start, missing proof, and incorrect ranges |
| CCH-D04 | Compound tag and even/stable seqlock with readable way | Every mismatched field, concurrent write, and mixed read |
| CCH-D05 | CRC/type/flags/key/CSN or TXID+OUTCOME | Every mismatch, two high words, proof from another batch |
| CCH-D06 | Credit, parity, and terminal way state | Last credit, odd counter, and interruptions before/after even |
| CCH-D07 | Empty/rejected/cold victim or exhausted double pass | Every branch, all hot, and contention with concurrent heat |
| CCH-D08 | Eviction of a scan without observed reread | Origin/reread and conservative metric races |
| CCH-D10 | Availability before tag: disabled/rejected way or readable candidate | Old rejected/disabled tag followed by valid copy; second check within copy and conservative races |
| CCH-D09 | Copy corruption versus input corruption | Cache rejected without quarantine; input propagated to storage caller |

Method and static evidence in the
[campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-cache-record/README.md).
Compilation and static checks do not close C1 qualification.
The cache suite documents an initial limited concurrent campaign;
differential tests with cache enabled/zero budget, prolonged stress,
complete fault injection, allocation measurements, GET/EBR/snapshot integration,
OUTCOME resolver, I/O, scheduler, and metrics remain. Requirements retain
designed status until the qualification required by traceability.

<a id="riparazione-opportunistica-del-percorso-get"></a>

## Opportunistic GET-path repair

The reader skips already-rejected or disabled ways before comparing the tag.
A valid copy reinserted in another way remains reachable; copy guards
under seqlock are rechecked. The first CRC error remains
`:verify-failed` and requires segment fallback. Scanning retains the
eight-way budget and does not retry an unconfirmed concurrent copy.
Regression and measurements: [GET campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-get-performance/README.md).
