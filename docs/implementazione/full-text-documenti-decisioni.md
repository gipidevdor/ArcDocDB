<a id="preparazione-documentale-full-text--decisioni-e-due-letture"></a>

# Full-text document preparation — decisions and two readings

Scope: [document preparation](full-text-documenti.md), ADR-0054,
REQ-SEC-003/006/007/010; no format or durable-decision change.
Two readings by same author on October 16, 2026, separate from independent review,
full MC/DC, and engine C1 qualification.

| Compound decision | Conditions and tests |
|---|---|
| Configuration | Simple vectors, 1…16 fields, positive u64 IDs, and ordered u16 field-ids; shape/order/duplicates/zero and tokens beyond u32 rejected |
| Aliases and paths | UTF-8, 1…64-byte aliases, paths 1…100 with even empty keys; owned copy and source-mutation tests |
| Cold memory | Measurements before copies, META bound <=64KiB and overall scratch; minimum budget and zero capacity rejected |
| u64 limits | Declared values retained, IDs cold-encoded and hot limits fixnum; measurement with UINT64_MAX without repeated raw u64 slot extraction |
| Start | Free task, simple u8, span and u32 row, positive budgets; errors/aliases/busy do not invalidate previous DONE |
| Scanner | Minimal headers and UTF-8 from common kernel; map root, exact span, frames and nodes within limits; truncations, tail, indefinite forms, and hostile payloads rejected |
| Masks | Only simple untagged keys, bit per field and path level; complex/foreign keys and frame reuse do not select false fields |
| Duplicates | Each map's seen-mask; second traversal of selected key rejected even for shared ancestors |
| Values | MT3 leaf and MT5 ancestor, both untagged; null, array, bytes, tags, and numbers do not become absences |
| Present field | Input summed before retaining span; present empty fields have LENGTHS, absent fields do not |
| Analysis/copy | Token counter summed and staging within limit before copy; analysis/run under-budget and global charge without underflow |
| Sort and bound | SEALED before measurement, field/term distinction, repetitions counted only in positions; manual expectations and 128 file comparisons |
| Result | File bound admitted and all stages complete before DONE; partial/failed/canceled inaccessible |
| Cleanup | Input and analysis loans released, run invalidated; idempotent cancellation in seven phases and reuse after rejection |
| Parallelism | Shared read-only configuration, task per worker; four tasks with private binding and bounded rendezvous |

<a id="lettura-1-dati-e-costi"></a>

## Reading 1: data and costs

Scanner and selector reread against CBOR-kernel transitions: child-count
parity distinguishes key/value, tags do not consume pair prematurely,
new frame zeroes all masks. Spans relative to document start,
within 16 MiB, even when buffer has prefix. Only verified text-leaf
spans enter analyzer. Duplicates and incompatible types are rejections.
Module certifies neither ordering/deduplication of unrelated maps nor general contract.

All budgets reread: memory before copies, five declared limits and effective
limits without hot boxing, cumulative tokens and staging across fields, work including
byte comparisons and sorting. Bound uses one dictionary/posting entry per
field/term pair in document and one position per occurrence. META uses a
conservative bound admitting maximum future physical metadata without knowing it.

<a id="lettura-2-ownership-e-integrazione"></a>

## Reading 2: ownership and integration

Borrowed immutable input, copied configuration, and task run reread.
No public partial data; reuse invalidates previous-result loan.
Completion releases input, but writer must still bind preparation
to exact PUT bytes and copy/transfer run into its own reservations before
releasing worker scratch. No authorized commit path exists here.

No lock, I/O, scheduler, or global counter per operation. CBOR kernel
can verify a whole string in one step: quantum and counters are not realtime
deadlines. Task expiry, worker-boundary fault injection, reservations before
decision, publication before H/ACK, and MVCC remain to integrate/qualify.
Heap measurements separate from coverage; two mutants do not demonstrate an
exhaustive campaign or full MC/DC. INV-I4/INV-I6 remain open overall.
