<a id="slot-compatti-dellindice-formato-v2"></a>

# Compact index slots, v2 format

<a id="ambito--2026-10-09"></a>

## Scope — 2026-10-09

`arcdocdb.index.slots` implements a fragment's word bank and its
single-writer/multi-reader protocol: five u64 words per primary slot,
six for retained versions, according to
[ADR-0048](../adr/0048-limiti-documentali-e-formato-v2.md).
With separate Swiss control, expected cost is 41/49 bytes per slot,
excluding keys, array headers, and runtime.

The component implements payload and seqlock, according to
[ADR-0032](../adr/0032-seqlock-a-64-bit.md),
[ADR-0043](../adr/0043-primary-index-a-frammenti.md), and
[ADR-0050](../adr/0050-pubblicazione-e-costi-della-directory.md).
The [index manager](indice-primario.md) adds probing, Swiss
control, arena, and directory publication. Searchable retained versions
and complete GET remain; this bank remains the payload primitive.

Class C1: REQ-IDX-001, REQ-IDX-003, REQ-IDX-004, REQ-IDX-005,
REQ-IDX-006, REQ-IDX-007, REQ-LIM-001, REQ-LIM-003, REQ-CON-004,
REQ-AFF-004, and REQ-AFF-008. Invariants: INV-I1, INV-I3, INV-V3, INV-A8,
INV-P6. Requirements remain designed; architectural decisions unchanged.

<a id="proprietà-memoria-e-layout"></a>

## Ownership, memory, and layout

A bank belongs to a Serie fragment. The controller allocates it
before publication; the writer with the exclusive token is the only one that
publishes, removes, relocates, or freezes. No permanent thread,
mutex, queue, callback, or I/O; no counter shared between Serie.

Capacity 1..65,536 slots, default 8,192: this is a bank limit, not a
Serie limit. Budget checks `capacità × parole × 8` before allocation.
It concerns payload only, not RSS, directory, or transient memory.
The future fragment manager adds the costs of other arrays.
No array grows in this component.

| Word | v2 layout |
|---|---|
| 0 | CSN u64 |
| 1 | segment-id in high 32 bits, offset in low 32 bits |
| 2 | key-off(32), key-len(16), flag(8), reserved(8), from low bit |
| 3 | seqlock u64 |
| 4 | record-len(32), reserved(32) |
| 5, retained only | Exclusive validity end CSN |

Live flag 1; empty slot with all fields zero except seqlock. These are not
Swiss control, the PREPARED flag, or a storage tombstone.
Checked: reserved fields, keys 1..65,535, representability of the key
range, record/document length, record end within the segment's
4 GiB − 1. In primary, end is zero; in retained, it is greater than CSN.
Arena, segment, manifest, commit decision, and byte integrity are
verified by the upper layer.

The worker's private preallocated buffer has **five u64s** in order
`[CSN, location, key-meta, record-len, end-CSN]`. It contains no seqlock,
references, or descriptors. No other worker modifies input/output
during the call. No payload u64 is returned as a Lisp value
by the read path; absence of allocations still requires measurement.

<a id="api-e-protocollo"></a>

## API and protocol

| API | Contract |
|---|---|
| `crea-banco-slot` | Preallocation with capacity, primary/retained type, and budget. |
| `leggi-slot-v2(bank, slot, buffer)` | `:live` copies consistent data; `:empty`/`:retry-limit` leave the buffer intact. Does not authorize a GET on its own. |
| `credito-scrittura-slot(bank, slot)` | Preflight: double increments still allowed; does not reserve them. |
| `pubblica-slot-v2(bank, slot, source)` | Publishes a live payload; conflicts, retention, key/arena, and budget already resolved by the writer. |
| `rimuovi-slot-v2(bank, slot)` | Zeros under seqlock; already completed removal idempotent; Swiss DELETED control afterward. |
| `riloca-slot-v2(bank, slot, expected, replacement)` | Changes only location if all current fields match the originals; otherwise `NIL`, without changes. |
| `congela-banco-slot(bank)` | Permanently nonwritable, readable; does not publish a directory. |
| `invalida-banco-slot(bank)` | Terminal health `FAULTED`, repeatable without mutex; the Serie boundary must isolate the domain. |

Writer: original contents and credit checked, odd sequence,
write barrier, fields, write barrier, even sequence.
Return attests in-memory publication, without durability or commit.
Reader: first sequence, rejection if odd, read barrier, fields,
read barrier, second sequence. Only a stable sample is checked
and copied. Stable inconsistency leads to `FAULTED` and `invariant-violation`;
transient fields are not interpreted as corruption. Health acquired
before/after the read and after copy. On error or nonlocal exit, the
caller discards the private result.

The API attempts at most eight times. Future probing uses the internal
attempt within the **same overall budget**, without multiplying it by slots
or root changes. At the limit it discards location and passes the original request
to the Serie writer. Even a miss requires ADR-0050's final
root/generation recheck; a valid seqlock does not replace it.

<a id="crediti-rilocazione-e-interruzioni"></a>

## Credits, relocation, and interruptions

Sequence does not reach 2^62 and does not wrap. Before commit the writer
compares credit with **all** mutations already reserved by pending
batches for the slot, or prepares a rebuild. Batch accounting
remains external; the returned number is not a reservation. Mutation
rechecks credit before the first store. Checks, already completed
removals, and inapplicable relocations require no additional credit.

Relocation: CSN, key-meta, length, and end remain identical; comparison
and application serialized by the writer. A newer version or already
replaced location is not overwritten. The compaction message is looked up
by key in the current root: it retains no slot or arena offset across
split/rebuild. `expected` is associated with that current lookup before the
primitive. Durable copy, manifest, retention, and reclaim are external.

Nonlocal exit during mutation => `FAULTED`, even after even sequence.
No rollback, reset, or reopening of a frozen bank. The future manager
publishes root, Swiss control, and arena with its own checks and cleanup.

<a id="decisioni-da-coprire--cod-54"></a>

## Decisions to cover — COD-54

| ID | Compound decision | Independent conditions |
|---|---|---|
| SLOT-D01 | Configuration | Capacity in range; positive budget; payload within budget. |
| SLOT-D02 | Live payload | Positive CSN; flag 1; zero key reserved field; positive key-len; representable key range. |
| SLOT-D03 | Record/location | Zero length reserved field; minimum header+key; maximum record; document limit; record end within segment. |
| SLOT-D04 | MVCC interval | Primary with zero end; retained with end greater than CSN. |
| SLOT-D05 | Writer sequence | Odd; above threshold; available credit separate from checking. |
| SLOT-D06 | Expected identity | Separate equality of CSN, location, key-meta, length, and end. |
| SLOT-D07 | Copy to relocate | CSN, key-meta, length, and end unchanged; location different or equal. |

Other transitions to exercise: eight odd/changed sequences; only transient
inconsistency; empty and reuse; CSN beyond fixnum/up to maximum u64; maximum
keys; zero credit; concurrent fault; interruption before/during/after
publication; freeze and retirement. No coverage claimed.

<a id="metodo-delle-evidenze-e-qualifica"></a>

## Evidence method and qualification

Method established before checks: compile only `arcdocdb` with
warnings as errors; lint, traceability, links, and catalogs. Original records
and ARM64 disassembly of read/publication retained for static
inspection, without calling the new module's functions. Rejections retained.

The two local readings separately checked payload and protocol:
validation only after a stable sample, reserved field rejection, seqlock
credit distinct from checks/no-effect relocations, buffer ownership,
terminal freeze and health. Key and record predicates are
separate and inline to contain complexity without adding u64 returns.
ARM64 disassembly retains native word loads/stores and
`DMB ISHLD`/`DMB ISHST` barriers; this inspection is not a concurrent test.

The first catalog check rejected subdirectory references.
Initial catalog and rejection are retained; original reports and metadata
were moved without re-encoding to files in the campaign
directory, as the existing verifier requires. The initial collector
source and the correction's source are retained as data.

The [dedicated campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-index-slots/README.md)
has this scope. No functional, concurrent, fault injection,
model, benchmark, or tool self-test added/executed
locally. SPK-01's v1 code and measurements do not qualify v2 layout.

C1 qualification, interleavings and x86-64 disassembly, allocation/P99,
probing/arena/directory with shared budget, retention, recovery, and
integrated writer remain. Whole-engine gate open. The two local
code readings are not independent reviews.

<a id="prove-successive--slot-v2"></a>

## Subsequent tests — v2 slots

The [reconstruction campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-index-rebuild/risultati.md)
adds 64 v2 slot tests, including beyond-fixnum payloads, rejections,
updates, relocation, reuse, and writer/reader concurrency.
Slots are also exercised by 55 primary index and rebuild tests.
The preceding note describes the initial campaign's scope. The new
report retains results, coverage, reviews, and limits: deterministic FI
in the seqlock sample, internal interruptions, fault during copy, and x86-64
remain to be qualified.
