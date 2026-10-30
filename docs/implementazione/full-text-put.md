<a id="legame-full-text-tra-put-e-lotto-wal"></a>

# Full-text binding between PUT and WAL batch

`arcdocdb.fulltext.put` connects [CBOR preparation](full-text-documenti.md),
[writer reservations](full-text-riserve.md), and existing WAL batch. First
use remains a Usenet NNTP server written in Common Lisp, with opaque Message-ID
as key and indexed subject/body fields. Transport and MIME decoding remain
with daemon; database receives CBOR document.

<a id="una-sola-sorgente-posseduta"></a>

## One owned source

`crea-preparazione-put-full-text(configs, ...)` preallocates a private record frame
and one task per ordered canonical configuration, up to sixteen generations.
Cumulative memory check precedes allocation. Includes frames, analysis
spaces, runs, and local metadata; shared configurations, reservation pool,
other contexts, and RSS require separate runtime accounting.

Defaults are document 16 MiB, key 65535 bytes, 65536 scalars,
4096 tokens, 262144 term bytes, and cumulative memory 64 MiB. Frame
size includes 24 header bytes; format limit can reject a document
smaller than application limit. Constructor supports v1/v2;
respective physical limits checked again at start.

`inizia-put-full-text(request, key, value, row, ...)` uses existing record codec
to copy key and value into frame, calculate CRCs, and return a generation
without wrapping. After return, original buffers may be reused. Message-ID
key and original document remain exact bytes without normalization.
All tasks analyze only value span in the same frame.
Identity derives from buffer ownership, without relying on a hash to compare
two external copies. Frame, tasks, and reservation handles remain private until append.

API produces ordinary PUTs, flag zero and stamp zero before closing, or
prepared PUTs, flag one and positive TXID passed as `txid-high`/`txid-low` u32.
No contract-versioned PUT or new format introduced. Later WAL closing
restamps only ordinary records with CSN; preserves prepared TXIDs.

<a id="analisi-consegna-e-ammissione"></a>

## Analysis, delivery, and admission

`passo-put-full-text(request, generation, quantum)` advances to `:prepared`
only when all tasks are DONE and worker has checked frame CRC and span.
Private attestation includes current generation and is cleared at start,
failure, or cancellation. Frame remains immutable until append:
no public entry allows modification or replacement after attestation.
Work is cumulative across all generations: three times frame
size (encoding and attestation), control steps, and document work,
with default limit 268435456 units. Quantum 1..65536 limits steps;
copy and CRC may traverse an entire record and give no realtime guarantees.
CBOR error or budget exhaustion invalidates result before admission.
Start rejections instead preserve a previous still-valid result.

Worker owns request through PREPARED, then hands it off with synchronization
to Serie writer. Only after analysis does runtime acquire canonical
queue lease. No schedulers, threads, or concurrent queues added inside bridge.

`prenota-put-full-text(pool, lease, request, generation)` adopts tasks together;
`passo-riserva-put-full-text(..., quantum)` copies their owned runs, going from
`:reserving` to `:reserved`. Until append, request cannot restart. Budget
verification precedes effects; rejection retains PREPARED and permits retry with
appropriate capacity. Runtime obligations for pool canonicality,
configurations, and accounting for all retained views remain.

<a id="append-e-riferimenti-stabili"></a>

## Append and stable references

`aggiungi-put-full-text(pool, lease, request, generation, batch)` requires ready
reservation, current worker attestation, open segment batch of same format
and segment, room for one record, and final space for SEAL. Writer checks only
metadata, capacity, and lifetime; body CRC calculated outside lease,
as [ADR-0039](../adr/0039-cornice-unica-dei-record.md) requires.
These preflights precede
irreversible reservation transfer. Writer then copies exactly the
private frame into WAL buffer, retains delta/file/slot, returns staging, and
records binding in stable slot. Returns slot, token, start, and end.
Request becomes `:appended` and may return to worker with symmetric handoff.
Later [physical-reference capture](full-text-riferimenti.md) connects
slot to sealed-batch record and survives WAL-buffer reuse.

`leggi-legame-put-full-text(pool, lease, slot, token)` returns six values:
batch, incarnation, record number, start, end, and proposed row. Binding survives
request reuse. Batch reuse increments incarnation without wrapping;
old references rejected even when new record occupies same bytes.
Incarnation saturation also checked by public reuse preflight
before Serie controller effects. Consumer must capture required
data before allowing buffer reuse.

Proposed u32 row is not batch record number, physical offset,
hint ordinal, CSN, or commit proof. Bridge does not assign those identities.
`wal:verifica-append-cornice` and `wal:aggiungi-cornice` are generic complete-verification
primitives for untrusted frames: alone they check format/CRC and capacity,
not analysis or document contract. They scan and are not used by
bridge writer path, which receives only attested private frame.

<a id="cancellazione-e-guasti"></a>

## Cancellation and faults

`annulla-put-full-text` interrupts analysis before reservation;
`annulla-riserva-put-full-text` returns costs and sources before append.
Neither aborts an already prepared transaction. Transferred handles
cannot be canceled or recycled through this API.

If exit during transfer/append is incomplete, request, pool, and batch become
FAULTED; references, costs, and any copied bytes remain preserved.
Worker boundary must stop Serie and require recovery. No rollback
of uncertain effects attempted and no ACK produced. No bridge function performs I/O.

<a id="verifica-e-limiti"></a>

## Verification and limits

First 18 bridge tests now joined by nine physical-reference tests:
27 bridge tests, 102 full-text tests total. Frozen CBOR fixture, independent
bitwise record encoder, overwritten original inputs, and full byte
comparison verify ownership. Covered: v1/v2, ordinary/prepared, maximum TXID,
sixteen generations, cumulative limits, truncations/CRC, errors without effects,
64 cancellation points, obsolete references, and interrupts before/after WAL copy.
Four independent contexts share only immutable configurations.
A CRC probe catches any scan beyond 20 header bytes while writer
holds lease: verifies old-path rejection as negative control
and correct append with 0/32768-byte padding. Also checks worker CRC
calculations and full-record comparison. Header or key corruption before
attestation fails in worker; absent/stale attestations do not permit append.

The [method and decision table](full-text-put-metodo.md) report both
readings by same author. [Original records](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-17-fulltext-put-dev-targeted/README.md)
distinguish failed attempts, targeted tests, full verification, and diagnostic coverage.

Still to integrate: general validation and Serie-catalog authority,
runtime-log canonicality, durable pipeline with document/posting publication
before H/ACK, authoritative 2PC outcomes, physical delta map, MVCC, and retirement after
quiescence. Engine readiness for NNTP traffic, application benchmarks,
C1 qualification, MC/DC, or complete fault injection not claimed. Overall requirements remain
`:progettato`; no ADR or disk format changed.
