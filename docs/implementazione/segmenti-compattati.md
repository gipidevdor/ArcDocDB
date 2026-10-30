<a id="verifica-dei-segmenti-compattati"></a>

# Compacted-segment verification

`arcdocdb.storage.format:verifica-segmento-compattato` verifies format
of compaction-origin CLOSED segments already defined by
[ADR-0041](../adr/0041-multiserie-segmenti-autosufficienti.md) and
[on-disk formats](../formati-su-disco.md#contenuto).
Module neither selects records to retain nor performs CLEAN/MERGE.

<a id="contratto"></a>

## Contract

Arguments: `buffer`, `valid-bytes`, `id-serie`, `segment-id`;
keyword budgets `max-bytes` (default 64 MiB), `max-records` (default 65,536).
Specialized byte buffer starts at file offset zero, remains stable
during call, contains complete valid prefix. Identity/valid
length supplied by closed segment's authoritative source.

Header checked against Serie/segment-id, actual version 1/2
selected, compaction origin required. From offset 64 to valid limit,
contiguous frames, CRCs, ordinary PUT/TOMBSTONE only verified. PUT with
contract-versioned flag allowed; prepared, OUTCOME, SEAL, EDIT, DECISION
rejected. CSNs opaque: no order/positivity imposed.

Only at completion five values returned: prefix end, version,
record count, PUTs, TOMBSTONEs. Counts describe physical records;
establish neither distinct-key count, visibility, nor retention policy.
Empty header-only segment valid for codec; manifest
must decide whether empty output recorded or removed.

Physical tail after `valid-bytes` unread. Logical CLOSED limit
not passed off as physical EOF: API does not use batch scanning
or return TAIL. Incomplete record in declared valid prefix
is corruption, without usable partial counts.

| Negative outcome | Condition |
|---|---|
| Incomplete prefix input, invalid caller identity/budgets | `invalid-argument` |
| Valid writer segment supplied to compaction verifier | `invalid-argument`, `:compaction-origin` |
| Invalid header, CRC, frame, types, or prepared records | `corruption-detected` |
| Unknown version with intact header | `unsupported-format` |
| Byte/record budget exceeded | `resource-exhausted` |
| No progress or inconsistent internal counts | `invariant-violation` |

<a id="lavoro-e-proprietà"></a>

## Work and ownership

Byte budget precedes CRC scan; record budget precedes
next record. Loop bound derives from prefix bytes and
minimum frame; every step must advance within valid limit.
No file-length-dependent allocation, record copies, materialized u64
reads, waits, shared state. Caller keeps buffers
stable; verifier neither modifies them nor opens/truncates/deletes files.

> **Proposal** — Initial budgets operational/configurable, distinct
> from persistent segment limit (4 GiB minus one byte). First API
> requires in-memory prefix; streaming scan remains to integrate.

<a id="verifica"></a>

## Verification

[Method registered before campaigns](segmenti-compattati-metodo.md).

| Decision | Conditions and tests |
|---|---|
| Valid configuration (`and`) | Valid index, limit 64..4 GiB−1 within buffer, byte budget same range, index record budget, 16-byte identity. Every invalid limit rejected before CRC; empty/exact fixtures exercise success. |
| Byte budget (`>`) | Exact limit allowed; one byte below prefix exhausts budget. |
| Origin (`=`) | Compaction allowed; intact writer rejected; malformed origin remains header error. |
| Progress (`and`) | `pos < next <= end`, guaranteed by verified codec. Truncations exercise codec; defensive rejection remains coverage denominator. |
| Ordinary type (`or`) | PUT/TOMBSTONE separately allowed; intact SEAL/OUTCOME/EDIT/DECISION rejected. |
| Prepared (`logtest`) | PUT flags 0/4 and ordinary TOMBSTONE; PUT flags 1/5 and prepared TOMBSTONE rejected. |
| End and record budget | Exact end before budget, including empty with budget 0; exact record limit allowed, insufficient 0/1 rejected. |
| Counts (`and`, `if`) | PUT/TOMBSTONE increment separate counters; total equal sum, compatible with minimum frames. Internal inconsistency remains defensive branch. |
| Result (`and`) | End equal authoritative limit, total equal sum. Fixture-declared counts for empty/mixed/boundary prefixes; defensive rejection without simulating helper errors. |
| Loop bound | Derived from maximum prefix frames; exhaustion without return internal defense, not reachable input condition. |

[Preserved evidence](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-09-compaction/catalogo.lisp)
includes two C1 readings, 15 independent-fixture tests, tool
self-tests, commands, environment, hashes before/after, raw output. Eight compilable
mutants detected after successful unchanged baseline. Integrated
check recorded separately in catalog.

Serial benchmark observes zero heap bytes in all 20 replicates:
versions 1/2, empty header or 256 alternating records, five replicates of 4,096
calls per case. All five returned values feed observable
result compared with explicit expected value. Self-test observes zero
baseline heap, at least 16 MiB in positive control. Measurement concerns
these in-memory fixtures, proves neither absolute nonallocation nor
whole-engine performance.

<a id="inventario-della-copertura-locale"></a>

### Local coverage inventory

Raw module coverage 202/234 expressions, 30/36 branches. Six
missing alternatives are false outcomes of three defensive `and` forms listed
here; rejections unreachable through public API with stable
buffer/correct codec.

| Guard, function, line | Reason and alternative verification |
|---|---|
| `:compaction-progress`, `verifica-record-compattato`, 35–36 | Codec returns end of complete frame within range. Two readings and truncation at every position; no inconsistent-decoder simulation. |
| `:compaction-count`, `scansiona-compattato`, 61–63 | One total increment and one type increment per frame of at least 24 bytes. Physical-count oracles, mutant swapping PUT/TOMBSTONE. |
| `:compaction-loop-bound`, `scansiona-compattato`, 65 | Every step consumes at least minimum frame; end check precedes budget/next record. Loop-bound inspection, empty fixtures/exact boundaries. |
| `:compaction-result`, `verifica-segmento-compattato`, 87–88 | Scanner returns only at exact end, preserves counter sum. Two readings, five values checked per fixture, physical tail ignored. |

32 unmarked expressions: six declarative forms, 24 forms in
four defensive signals, two keyword initializers. Defaults
exercised by empty/mixed-fixture calls without keywords,
though unmarked by `sb-cover`; not classified as
unreachable code. Every public argument/origin/type/prepared/
budget branch has both outcomes observed.

Denominator complete: inventory local justification,
not approved exclusion, MC/DC qualification, or C1-gate closure.

Related requirements: REQ-CMP-009, REQ-FOR-001/002/003, REQ-AFF-008.
Invariants: INV-C1, INV-S7, INV-F1/F2, INV-A8/A9, INV-P6.
Format check part of those requirements: verifies neither record
selection, manifest, atomic compaction publication, database
health, nor full recovery. No requirement status promoted.
