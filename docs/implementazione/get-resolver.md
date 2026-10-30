<a id="resolver-get-dei-segmenti-closed"></a>

# GET resolver for CLOSED segments

The [`arcdocdb.get.resolver`](../../src/get-resolver/) module connects
[GET core](get-record.md) to CLOSED segments named by
[manifest](manifest-control-log.md). Resolves position, storage flags, CSN, and
OUTCOME-proof offset through a verified immutable map.

A read-path component, with **C1 qualification open**.
The [ordinary ACTIVE path](get-active.md) has a dedicated bridge to controller
root. ACTIVE multiseries proofs, capability directory, EDIT proofs, and server
remain to integrate. Does not change architecture decisions or formats.
References: [ADR-0037](../adr/0037-lotto-sigillato.md),
[ADR-0041](../adr/0041-multiserie-segmenti-autosufficienti.md),
[ADR-0044](../adr/0044-cache-acceleratore-puro.md),
[ADR-0047](../adr/0047-verifica-csn-dei-record-prepared.md).

<a id="costruzione-e-autorità"></a>

## Construction and authority

`crea-mappa-segmento-get(view, file, manifest, id, buffer, …)` runs in
I/O pool outside GETs. Controller associates manifest and view of same
Serie; current manifest carries no Serie identity verifiable by
resolver. File is read-only and segment remains immutable.

1. Checks budgets, positive u32 ID, and CLOSED state in manifest. ACTIVE,
   REMOVED, and UNKNOWN rejected. A u64 ID beyond u32 requires future
   index layout: it is not truncated.
2. Takes `valid-bytes` from manifest closure. Impossible limit is
   corruption; insufficient buffer or budget is `resource-exhausted`.
   Physical file size does not replace this frontier.
3. Builds GET capability by reading and verifying header from supplied file.
   Reads remainder **from same FD**, only through `valid-bytes`.
4. For writer origin, verifies all batches, SEALs, file-id, boundaries,
   batch checksum, and record CRCs. Frontier must end
   exactly after a complete batch. For compaction origin, reuses CLOSED
   verifier: ordinary PUT/TOMBSTONE only.
5. Counts PUTs and OUTCOMEs, authorizes payload peak, copies proofs into
   u32 arrays, and stably sorts by TXID through eight bounded radix passes.
   Duplicates with same CSN allowed; mismatched CSNs produce corruption.
6. Builds a compact row for each PUT in physical order. A resolved prepared
   retains CSN and offset of OUTCOME following PUT. A prepared record
   without outcome retains zero proof; cannot be returned by GET.

Buffer must stay exclusive and stable from I/O until return. Full
body verification occurs in step 4. Later traversals
recheck header CRCs and shape without rescanning bodies;
OUTCOME copying reverifies their bodies too. Internal
passes are not standalone parsers and are not exported.
Without OUTCOME, dedicated proof-copy traversal is avoided.

TAIL classifier not used: a manifest-fixed prefix is verified here,
without claiming it matches physical EOF. Any bytes beyond
frontier remain intact and unread.

Closure containing additional outcomes in EDIT is rejected with
`invalid-argument / :resolver-edit-proof-unsupported` before I/O. A
valid format case still to implement, without approximate
interpretation of metadata as durable proof.

<a id="memoria-e-lavoro-limitato"></a>

## Memory and bounded work

| Structure | Payload |
|---|---|
| Permanent map | `24 × P` bytes, P = PUT count in prefix |
| Temporary proofs | `20 × O` bytes, O = OUTCOME count, including duplicates |
| Radix scratch, if O ≥ 2 | additional `20 × O + 1024` bytes |
| Source buffer | caller's, capacity at least `valid-bytes` |

Created-array peak is therefore `24P + 20O`, or
`24P + 40O + 1024` for O ≥ 2. `budget-payload` checks it **before**
arrays. `payload-mappa-segmento-get` reports only `24P` after construction.
Values exclude Lisp objects/headers, FDs, caller buffer, and GC;
not an RSS bound. Garbage collector may retain scratch
after return too. No Lisp object created per row.

Defaults are 256 MiB prefix, 1,048,576 non-SEAL records, 65,536 batches,
65,536 records per batch, 64 MiB per batch, and 64 MiB allocated payload.
Construction budgets configurable within existing formats;
do not restrict document limits. Caller must already own source
buffer, and controller must account for concurrent constructors too.

Each traversal bounded by available bytes; counts and budgets
checked. Sorting `O(8 × (O + 256))`, prepared-row resolution
`O(P × log(O + 1))`, GET lookup `O(log(P + 1))`, at most 33 steps.
Construction is cold path: I/O, full scanning, and allocations
permitted; costs still to measure.

<a id="lettura-lifetime-e-risposta"></a>

## Reading, lifetime, and response

Controller publishes map **before** a reader can observe an
index location requiring it. Retains capabilities and FDs until EBR-authorized
reclamation. Map neither publishes roots, manages manifest, nor
closes files. A Lisp capability does not replace EBR authorization.

Driver installs GET cleanup before `avvia-get`. After `:candidate`,
acquires map from controller directory in same epoch:

| API | Outcome and responsibility |
|---|---|
| `risolvi-candidato-get(context, map)` | capability, frontier, storage flags, and OUTCOME offset/NIL |
| `sonda-cache-risolta-get(context, map)` | GET probe outcomes, without I/O; prepared → `:proof-required` |
| `leggi-record-risolto-get(context, map)` | GET read outcomes, only in I/O pool |

Resolution checks view, segment-id, still-open FD, exact offset,
candidate length and CSN, flags, and proof position. Map miss
for an already-published location is an integrity fault: does **not**
become an absent document. Index LIVE flag is not PREPARED.
Resolver modifies no arrays, index, cache, registries, or shared counters.

For prepared records, map is a derived accelerator: GET core rereads
OUTCOME from same FD, verifies CRC, TXID, and CSN even before
cache hit. GET CRC, key, and version checks remain for every value.
Map alone does not authorize response.

`copia-valore-get` produces provisional output; `concludi-get`, with fresh time
after copy/last access, checks snapshot and releases EBR before
authorizing value. Error or nonlocal exit discards result.
Resolver invariants make context FAULTED; worker boundary
must isolate Serie/Archivio according to cause. Source errors propagate.
Incorrect API order rejected before assuming new cleanup.

Before migration, abandon GET and discard map, capability,
location, and proof. New worker restarts from request and index under
new epoch. Module retains `:history-required` semantics: does not search
historical versions or invent absence for a snapshot.

<a id="decisioni-composte-e-qualifica"></a>

## Compound decisions and qualification

Affected requirements remain **designed**: REQ-IDX-001, REQ-FOR-001/003/004,
REQ-STO-006, REQ-CCH-002, REQ-CMP-007, REQ-CON-004, REQ-AFF-002/008.
Affected invariants: INV-A2, INV-F2, INV-S7, and EBR reclamation protection.

| ID | Compound decision | Required coverage |
|---|---|---|
| RSG-D01 | configuration: bytes, count, batches, and payload | every limit/zero, before effects |
| RSG-D02 | source capacity: byte budget or buffer | each insufficient, both sufficient |
| RSG-D03 | batch result: progress, end, stamp, frontier | each impossible result separately |
| RSG-D04 | compaction: end/version/count/budget | each mismatch separately |
| RSG-D05 | proof copy: end/type/flags/key/value | each mismatch separately |
| RSG-D06 | radix: source/target/alias/histogram | each violation before distribution |
| RSG-D07 | TXID order: increasing high or equal high and increasing low | u32 boundaries and inversions |
| RSG-D08 | duplicate TXID and CSN high/low equality | both words diverging, identical duplicates |
| RSG-D09 | first proof: present index and TXID high/low | boundary misses and different high/low |
| RSG-D10 | binary TXID: lower high or equal high and lower low | both directions, duplicates |
| RSG-D11 | row: progress and remaining capacity | each boundary |
| RSG-D12 | candidate: size, reserved word, CSN low/high | each mismatched word, high u64 |
| RSG-D13 | flags: u8 and PUT mask | excess word and prohibited bits |
| RSG-D14 | segment identity: zero high and equal low | nonzero high and different segment |
| RSG-D15 | FD lifetime: read-only and open | wrong mode and early close |

Simple branches also remain to verify: empty segment, tombstone,
frontier mid-batch, tail beyond frontier, aborted prepared,
preceding OUTCOME, mismatched duplicates, saturation, construction interruption,
cleanup/reentry/migration, and source/map corruption.
GET core API/EBR/copy checks remain in its contract.

The [preserved campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-get-resolver/README.md)
contains compilation, static checks, and two local author readings.
Adds and locally runs no tests, models, fault injection, or benchmarks.
Actual GET allocations, latency, construction cost, and concurrency remain
to measure; independent review and C1 qualification not declared complete.

The [functional suite dedicated to OUTCOME proofs](get-resolver-verifica.md)
adds 42 construction, sorting/lookup, and reading tests, with v1/v2 read-only
files and independent wire oracles. Preserves
[preregistered method](get-resolver-metodo.md) and results attributed to local
freeze. Independent reading and diagnostic coverage of this suite
close neither C1 qualification nor whole-component MC/DC.
