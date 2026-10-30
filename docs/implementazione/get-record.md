<a id="percorso-get-candidato-cache-e-record-verificato"></a>

# GET path: candidate, cache, verified record

Module [`arcdocdb.get`](../../src/get/) connects primary index, read
context, cache, read-only I/O. Implements reading current committed
PUT, including when version visible to snapshot. Response
remains private until final snapshot verification and EBR release.

Not yet server endpoint. [CLOSED resolver](get-resolver.md)
connects manifest/file proofs; [CLOSED directory](get-directory.md)
selects candidate segment. [Ordinary ACTIVE resolver](get-active.md)
acquires pages from Serie's published root. Multiseries ACTIVE proofs,
publication of full Serie directory,
retained-version search, seed lifecycle, pool, protocol remain to connect.
Requirements remain **designed**: compilation/static readings do not close
C1 qualification. Module changes neither format, isolation, nor ADR decisions.

References: [ADR-0038](../adr/0038-orizzonte-di-visibilita.md),
[ADR-0044](../adr/0044-cache-acceleratore-puro.md),
[ADR-0045](../adr/0045-modello-di-esecuzione.md),
[ADR-0047](../adr/0047-verifica-csn-dei-record-prepared.md),
[primary index](indice-primario.md), [cache](cache-record.md),
[read tasks](compiti-lettura.md).

<a id="proprietari-e-configurazione"></a>

## Owners and configuration

- `ambito-get` associates EBR domain and snapshot register of same Archivio.
  Controller builds one canonical identity before pools. Views
  and workers share it: `avvia-get` rejects different identity before pin.
- `vista-get-serie` binds index, optional cache, and copy of canonical
  Serie identity. Controller must associate all three correctly;
  module cannot infer from index lacking storage identity.
  `avvia-get` calculates digest through [index-owned seed](hash-chiavi.md),
  accepting no request-supplied digest. Missing seed rejected.
- `segmento-get` binds view to read-only file. Construction reads
  header **from same file**, checks CRC, Serie/segment identity,
  format, retains immutable fields. Runs in I/O pool outside GET.
- `contesto-get` belongs to worker/Archivio. Owns EBR/snapshot
  context, index scratch, five candidate words, snapshot limit,
  record buffer, OUTCOME proof. Does not belong to request or Serie.

Controller keeps files/bindings open until EBR-authorized
reclaim. Lisp capability reference does not replace guarantee.
Construction certifies neither committed prefix nor Serie health.

`crea-contesto-get(ambito, worker-id, :record-bytes B, :budget-payload P)`
checks `1 ≤ B ≤ 16.842.775` and `B + 152 ≤ P` before allocation.
Defaults: 65,536 record bytes, 65,688 payload bytes. The 152 bytes include
index scratch 40, candidate 40, snapshot 8, read context 32, proof 32.
`payload-contesto-get` returns payload, **not RSS**: objects,
headers, EBR, registers, view, cache, response, GC excluded.

Version larger than buffer produces `:buffer-required` before
any record/proof I/O. Driver must assign worker with appropriate
scratch and rerun original request. Not an additional document
limit; driver must also allow format's maximum capacity.

<a id="contratto-del-compito"></a>

## Task contract

Boundary installs `unwind-protect` with `abbandona-get` **before** starting
task. Key/request remain stable/exclusive until end.
No scratch accessor exported. Do not use context on two workers,
nest request on same context, or send network data
inside EBR section.

| Operation | Outcome and responsibility |
|---|---|
| `avvia-get(ctx, vista, chiave, snapshot, generazione, now)` | One EBR attempt, Serie-seeded hash, primary lookup with budget eight. `:candidate`, `:absent`, `:history-required`, `:retry` provisional. `:retry` with `:idle` state means no admission, no pin. |
| `copia-candidato-get(ctx, cinque-u64)` | Copies candidate words within same EBR task for resolver. No location crosses queue. |
| `sonda-cache-get(ctx, segmento, valid-bytes, flags)` | No I/O. `:hit` leaves `:verified`; `:miss`, `:verify-failed`, `:disabled`, `:proof-required`, `:buffer-required` leave `:candidate`. |
| `leggi-record-get(ctx, segmento, valid-bytes, flags, :outcome-offset …)` | I/O pool only after new lookup. Returns source, cache outcome, insertion outcome, eviction, scan. Source `:cache`/`:segment` leaves `:verified`; `:buffer-required` reads nothing, leaves `:candidate`. |
| `copia-valore-get(ctx, risposta, start)` | Copies value into private response, leaves `:copied`, returns output end. Copy not yet deliverable. |
| `concludi-get(ctx, now-fresco)` | After copying and all access: checks snapshot, releases EBR before returning `:found` and length. `:absent`, `:history-required`, `:retry` length zero. |
| `abbandona-get(ctx)` | Idempotent cleanup in `:idle`; discards references, candidate, range. Does not authorize response. `:faulted` terminal. |

Precondition/order error rejected before taking ownership
of operation: must not release any already active task of nested
caller. External cleanup remains mandatory. After admission,
errors/nonlocal exits in operational phases release pin. Cleanup
interruption makes context terminal; controller isolates it.

Record/proof scratch not zeroed every request. Remains private,
previous bytes inaccessible through API: state/valid ranges
cleared. Any error or nonlocal exit also invalidates response
copy; only normal `concludi-get` return authorizes it.

<a id="visibilità-e-ricerca-storica"></a>

## Visibility and historical search

Current GET does not wait for H: index must publish only visible commits
under controller contract. With snapshot, `avvia-lettura` checks
identity, generation, activation, deadline, captures `s` under EBR.

- Current candidate with `CSN ≤ s`: readable in snapshot.
- Candidate with `CSN > s`: `:history-required`.
- Primary miss with snapshot: `:history-required`, because deletion
  after `s` may have removed version requiring retention.
- Primary miss without snapshot: `:absent`, to confirm with `concludi-get`.

Driver finishes task even for valueless outcomes. Cannot
convert `:history-required` into miss. Future history resolver must
prove absence and repeat snapshot checks. Not implemented here.

<a id="fonte-autorevole-cache-e-prepared"></a>

## Authoritative source, cache, prepared records

Resolver supplies segment capability, committed `valid-bytes`
frontier, **record flags** under same epoch. Index-slot LIVE
flag is not PREPARED. File size, hints, cache do not determine frontier.
Module checks canonical view, segment identity, offset after header,
end within prefix, actual format limits, allowed PUT flags.

v2 slots represent segment ID in 32 bits: capability must have
zero high word and low word matching candidate. Storage u64 ID
not truncated to force match. Representation limit already
documented in [v2 payload](slot-indice-v2.md).

In compute pool, prepared record returns `:proof-required`. In I/O pool,
authoritative table must supply OUTCOME offset in same segment
and committed prefix. Valid OUTCOME CRC or presence in file
insufficient: resolver must certify membership in published batch.
Module reads proof from same FD, checks frame, type, CSN
before cache probe. Common verifier then compares PUT TXID
with proof TXID, CSN with candidate CSN. Prepared record in
compaction-origin segment violates invariant.

Ordinary cache hit performs no I/O. Prepared I/O-pool hit requires
proof reading; cache retains no commit certificate.
Copy `:verify-failed` requires alarm/metric and PUT read
from segment. Proof/file-byte corruption propagates as source
fault, not hidden as cache miss.
Variant resolving proof from manifest EDIT outcomes remains open.

Read PUT verified before opportunistic insertion. Contention,
bypass, unavailable cache do not wait. Insertion rechecks input
through public cache API: additional CRC cost to measure.
Enums/booleans allow worker-local metrics; aggregation/alarm
belong to driver without per-operation global counters.

<a id="migrazione-e-costi"></a>

## Migration and costs

On miss/proof required/insufficient buffer, compute worker abandons
context and queues only original request. I/O worker restarts at
`avvia-get`, reruns resolver, rechecks cache. No FD, location,
proof, pin migrates. Blocking read exists only in I/O pool.

Work bounded by maximum 65,535-byte key, existing index budgets, eight cache slots,
one PUT within format limit, fixed proof. No new queue,
infinite retry, Archivio mutex on GET, per-entry object, or write between
Serie. Copies record → scratch → response with explicit CRC checks.
Current-core measurements in [GET performance campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-get-performance/README.md),
with [preregistered method](get-performance-metodo.md). Report distinguishes global
heap, serial windows, parallel groups; does not measure server latency.
[Cost-isolation campaign](get-costi-risultati.md) distinguishes CRC,
copying, oracle, measures lookup through 4.19 million keys; changes neither
product path nor declared progress guarantees.

<a id="decisioni-c1-e-qualifica-aperta"></a>

## C1 decisions and open qualification

| ID | Compound decision | Required coverage |
|---|---|---|
| GET-D01 | Configuration, payload capacity, view identity | Every limit, insufficient budget before allocation, identity copies |
| GET-D02 | Initial state, canonical Archivio, key aliases, worker residue | Reentry, other Archivio, faulted contexts, residue, interrupted cleanup |
| GET-D03 | Snapshot present, candidate CSN relative to s, miss | CSN limits, deletion after snapshot, H, expiry |
| GET-D04 | Target owner/ID/offset/frontier/format/flags | Every mismatching field, ID high word, v1/v2, extreme limits |
| GET-D05 | Insufficient buffer or required proof | No compute syscall; no I/O with insufficient scratch |
| GET-D06 | Mandatory prepared proof, range, nonoverlap | Missing/unexpected, outside prefix, overlap, proof in another segment/batch |
| GET-D07 | OUTCOME: frame/type/flags/CSN, TXID against PUT | Every mismatch/high bit; persistent corruption distinct from cache |
| GET-D08 | Cache hit/miss/error, opportunistic insertion | Disabled cache, contention, corrupt input, fallback, metrics |
| GET-D09 | Output range/alias, final acknowledgment | Interrupted copy, expiry after copy, miss error, no data after unwind |

Static evidence in [GET campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-get-record/README.md).
[First functional verification](get-verifica.md) records distinct campaign
with its own outcomes/scope; does not replace previous static evidence.
Remaining: condition-by-condition C1 qualification, concurrent stress, fault
injection, allocation/performance measurements; resolver,
retention, scheduler, metrics, protocol integrations. Static campaign's two readings
by author; first functional campaign also records independent review.
[Independent review](get-performance-revisione.md) and
[performance/stress tests](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-11-get-performance/README.md)
have explicit scopes and do not close full C1 qualification.
