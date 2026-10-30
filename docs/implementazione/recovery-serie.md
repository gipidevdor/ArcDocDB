<a id="recovery-semantico-dellinsieme-serie"></a>

# Semantic recovery of the Serie set

`arcdocdb.recovery.series` connects [owned read-only sources](fonti-recovery.md)
to [ACTIVE](active-recuperato.md) and [CLOSED](closed-recuperato.md) readers.
Uses authoritative CONTROL and same complete Archivio decision replay.
Adds no formats, logs, or durable atomicity points.

## API

```lisp
(let ((limits (arcdocdb.recovery.series:crea-limiti-recovery-serie)))
  (arcdocdb.recovery.series:leggi-serie-recuperata
   control sources decisions scratch limits))
```

Two values on success: `active-recuperato` and new simple-vector of
`closed-recuperato`, complete and ordered by u64 ID. Caller owns
vector and keeps it stable when passing to subsequent gates. Tokens
immutable and bound to same CONTROL; ACTIVE retains marker
of replay actually used. No internal table or buffer exposed.

Set owner keeps capabilities open throughout call
and every result use. Sources, CONTROL, decisions, namespace, and
scratch must remain stable under exclusive recovery in I/O pool.
Catalog authority and decision-log completeness remain those of
existing readers; name acquisition alone does not demonstrate them.

<a id="preflight-prima-dei-dati"></a>

## Preflight before data

Before first header, checks:

1. set count equals manifest CLOSED count plus one ACTIVE;
2. overall segment limit and new-vector budget;
3. exact CONTROL/decision scope, no UUID aliases, open decision FD;
4. strictly increasing IDs and each source state equal manifest;
5. unique ACTIVE equal CONTROL's;
6. canonical preflight of every reader: read-only FD, backend, scratch, and limits;
7. each CLOSED P no greater than attested EOF of its FD;
8. ACTIVE EOF + CLOSED P sum within cumulative read budget.

Membership, strict order, and cardinality prove completeness without
allocating another duplicate table. Zero ID valid previous value:
NIL indicates no previous value. ACTIVE position zero also
valid. CLOSED retains reader's u64 IDs; ACTIVE retains
existing GET constructor's positive-ID limit. No truncation.

Name final/temporary form remains planner fact. API
applies no rename or deletion. Set may be acquired with
another manifest: count, ID, or state disagreements
rejected; headers and prefixes then verified against supplied CONTROL.
Physical provenance and namespace stability remain coordinator
obligations, without inference from equal UUIDs or similar names.

<a id="esecuzione-e-fallimenti"></a>

## Execution and failures

ACTIVE read first, with complete EOF and canonical multiseries
decisions. Then all CLOSED sequentially, with same
scratch and manifest P. No bytes beyond P read for CLOSED;
any ACTIVE tail follows canonical scanner through attested EOF.
Readers retain no scratch and may use it serially.

Before return, checks consumed count, canonical CLOSED
set, ACTIVE capability, and still-open decision log. Two values
emerge together only after checks. Error in any
segment delivers no partial result. Scratch may have been
modified; no rollback promise for private buffers.

Set borrowed, not transferred. Not closed on success or
failure, and no child closed individually. Original conditions
propagate without retry or masking: owner then performs
set cleanup after all borrowers. No new generic
error handler or concurrent-cleanup protocol introduced.

Result lets coordinator feed existing gates:
Serie maximum CSN, complete Archivio CSN plan, and old
ACTIVE checkpoint. Does not rebuild primary/secondary indexes, publish
sources or roots, complete physical reconciliation or traffic
gate. General C1 invariant-stop boundary remains open.

<a id="limiti-e-costi"></a>

## Limits and costs

Read-only configuration created before reads. Incorrect scalar
types/ranges signal TYPE-ERROR; invalid geometry INVALID-ARGUMENT.
CLOSED-reader decisions reused in factory without I/O.

| Option | Default | Scope |
|---|---:|---|
| `max-segmenti` | 65536 | All sources, ACTIVE included; configurable positive `index` |
| `budget-riferimenti` | 524288 | 8*N CLOSED on 64-bit SBCL, before vector |
| `max-byte-totali` | 4 GiB−1 | ACTIVE EOF + CLOSED P sum; zero allowed |
| `chunk-bytes` | 65536 | Each reader's transfer, positive |
| `max-bytes` | 268435456 | Existing reader per-segment limit |
| `max-batches` | 65536 | Per segment, positive |
| `max-records` | 1048576 | Per segment, zero allowed |
| `max-batch-records` | 65536 | Per batch, positive u32 |
| `max-batch-bytes` | 67108864 | Per batch; at least SEAL frame |
| `max-prepared`, `max-outcomes`, `max-esiti-chiusura` | 65536 each | Per segment, u32; zero allowed |

Borrowed scratch must hold maximum of ACTIVE EOF and CLOSED P;
chunking bounds transfer, not total memory required by current
readers. Cumulative limit checks logical source bytes,
not IOPS, latency, or in-memory rereads. Reference budget excludes
scratch, tokens, reader workspace, final-gate hash, headers, and GC:
not RSS. No additional per-document objects introduced.

Source verification uses scans bounded by segment count and
manifest queries; does not reenumerate directory or reopen files. Final
gate retains its private bounded table. No allocation or
verification added to existing request path. Actual
memory, GC, and recovery performance remain to measure.

<a id="decisioni-e-metodo-prima-delle-esecuzioni"></a>

## Decisions and method before runs

| ID | Dedicated cases to verify |
|---|---|
| SRS-D01 | Factory: segment range and canonical geometry; zero limits allowed/not allowed |
| SRS-D02 | Complete count; missing, extra, empty, ACTIVE only |
| SRS-D03 | Segment and reference budgets: equality and minus one, before vector/data |
| SRS-D04 | Exact scope, clone, closed decision FD, scratch/Serie UUID and Archivio UUID aliases |
| SRS-D05 | u64 order, duplicate, first zero ID, ID above u32; membership and state |
| SRS-D06 | Unique, missing, duplicate ACTIVE, different ID; position zero valid |
| SRS-D07 | P <= EOF, P != EOF valid; backend/FD/scratch range and individual budgets |
| SRS-D08 | Exact/minus-one byte sum; no partial read before rejection |
| SRS-D09 | v1/v2, writer/compaction, OUTCOME/EDIT/DECISION, abort, and ACTIVE TAIL |
| SRS-D10 | First/last CLOSED fault after ACTIVE; no result or close, original cause |
| SRS-D11 | Final set, FDs and decisions open; reusable scratch and independent new vector |

Warning-free product-only compilation, style,
traceability, links, disassembly reading, and C4 archive checking
planned. Two static author rereadings separate from independent
review. No new functional test, FI, coverage, model, or
benchmark added or run in increment. SRS-D01…D11,
MC/DC, C1 qualification, general stop, and complete integration remain open;
general CI does not replace missing dedicated tests.

[Registers of three revisions and two rereadings](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-17-serie-semantic/README.md)
preserve compilation and static checks, including C4 worker logs.
