<a id="lettura-del-control-log-e-transizione-di-recovery"></a>

# Reading the control log and recovery transition

Path connects [manifest](manifest-control-log.md) to
[checkpoint publication](pubblicazione-control.md), under
[ADR-0040](../adr/0040-manifest-a-record-unico.md#3-riconciliazione-al-riavvio).
Old file read through same read-only capability later handed
to rename. New checkpoint preserves previous state and closes
old ACTIVE before opening a new one.

## API

| API | Contract |
|---|---|
| `leggi-control-recuperato(view, input, size, scratch, …)` | read through attested EOF, verified header and prefix replay; owned result without buffer |
| `frontiere-control-recuperato(result)` | attested EOF, absolute prefix end, `:complete`/`:tail`, version 1/2 |
| `manifest-control-recuperato(result)` | immutable manifest queryable through existing scalar queries |
| `verifica-transizione-recovery(previous, current)` | pure verification of conservative ACTIVE closing; no I/O |
| `pubblica-control-validato(prepared, recovered)` | verifies canonical view and transition, then delegates to publisher with exact old file |

`control-recuperato` has private constructor and no copier. Retains
canonical view, read-only capability, owned manifest, and four scalars.
Does not retain scratch, log bytes, or second FD. Manifest has no
aliases to read bytes; scratch reusable after return.

<a id="autorità-e-stabilità"></a>

## Authority and stability

Controller maintains recovery **exclusive to Serie**, in I/O pool.
Catalog supplies canonical view and old `control.log`
authority. Caller attests `size` as stable physical EOF: this
API does not measure file size. Caller-chosen limit or
buffer length cannot replace attestation.

File, FD, and namespace remain frozen from reading until publication
completion. Read-only describes capability; does not prevent external writing
to same inode. Result is neither certificate against external
changes nor independent permission to replace catalog or start traffic.
Existing rename still checks both leaves against capabilities.

Publication requires **same view by object identity**, in addition
to Serie identity checked in header. Different view with same UUID
rejected: index and Archivio scope not implicitly rebound.

<a id="lettura-e-budget"></a>

## Reading and budgets

1. Verify open input, scratch distinct from view identity,
   size and budgets before reading or modifying scratch.
2. Read exactly `size` bytes from same FD in bounded transfers.
3. Verify magic, CRC, reserved fields, Serie identity, and header version.
4. Pass **entire file through EOF** to existing scanner and replay.
   Tail allowed only after full durable-witness search.
5. Verify frontiers and still-open capability, then deliver result.

Scratch contains full file and must hold at least `size` bytes. Default
is opening budget **64 MiB**, configurable with `:max-bytes`; not
a new persistent database limit. `:chunk-bytes` is 64 KiB; input's
maximum transfer must allow `min(size, chunk-bytes)`.
Iteration count is `ceiling(size/chunk-bytes)`; short reads have
finite bound already defined by I/O module.

`:max-batches`, `:max-batch-records`, `:max-edits`, `:max-segmenti`, and
`:max-esiti` initially 65,536. Segments/outcomes bound both cumulative
and per-EDIT occurrences, including repetitions.
Byte budget also bounds batch and witness search. Payload-codec
limits unchanged. Exhausted budget is an error;
not converted into usable tail.

Missing/invalid header, incomplete EOF, durable corruption, inapplicable
EDIT, or exhausted budget produces no partial result. Original
conditions propagate to controller for quarantine/fail-stop.
Reading does not open, close, write, synchronize, or truncate file.

<a id="transizione-conservativa"></a>

## Conservative transition

Comparison dedicated to closing after crash, before CLEAN, MERGE,
or reclamation. Requires:

- new ACTIVE ID at least old high-water; exhausted ID space
  produces `resource-exhausted`;
- old ACTIVE present as CLOSED in new manifest;
- all previous CLOSED entries with identical IDs, valid lengths, and outcomes;
- all previous REMOVED entries preserved, even if files already absent;
- exactly one added CLOSED and no added or omitted REMOVED.

Outcome presence checked separately from CSN: zero does not mean
absence. Comparisons use full u64 integers. Cardinality and inclusion
together exclude silent addition or replacement of other segments.
Removed entries may be omitted by later authoritative control-log
compaction; this entry deliberately retains all read entries.
Comparison is not generic guard for online rotation or compaction.

**Preconditions remain:** inventory validation, old ACTIVE scan,
and correct length/outcomes used to close it.
Comparing two manifests cannot prove bytes of an unread segment.
Does not resolve multiseries transactions or authorize deletion.

The [old ACTIVE reader](active-recuperato.md) now connects that
precondition to read-only scanner and decision table. Its publication
entry requires exactly equal P and derived outcomes
in closing before delegating to conservative transition described here.

<a id="pubblicazione-ed-errori"></a>

## Publication and errors

`pubblica-control-validato` rejects different view, closed capability, and invalid
transition before claiming token or performing I/O. Then delegates to
`pubblica-control-recuperato`: same CAS, same rename atomicity
point, same directory fsync before acknowledgment, same terminal
errors after claim. No second state machine or retry logic.

Existing entry remains available to callers directly attesting
old-log authority and validation. Initial Serie creation,
index adoption, and Recovery Manager gate remain
to integrate.

<a id="decisioni-e-costi"></a>

## Decisions and costs

| ID | Decision | Cases to qualify |
|---|---|---|
| CRV-D01 | positive chunk, EOF and budget at least one header | each false, all true, exact EOF |
| CRV-D02 | prefix within range and COMPLETE equivalent to EOF | wrong frontiers, consistent/inconsistent COMPLETE/TAIL |
| CRV-D03 | CLOSED preserves state, length, and outcome count | each condition false separately, all true |
| CRV-D04 | outcome present and identical CSN | absent, different CSN, present zero, u64 with high part |
| CRV-D05 | previous CLOSED cardinality plus one and unchanged REMOVED | each false, both true, replacement with same count |
| CRV-D06 | new ACTIVE beyond high-water and old ACTIVE closed | reuse, exhausted space, omitted/removed old ACTIVE, valid transition |
| CRV-D07 | same canonical view and old input still open | another view with equal/different UUID, CLOSED/FAULTED, valid |

Sequential O(bytes) read plus existing scanner/replay cost.
Comparison visits O(CLOSED + REMOVED + outcomes) with average O(1) lookup; exposes
no hash table. No lock between Serie, clock, wait, or shared counter.
Opening paths with allocations: caller scratch, decoder workspace and
manifest, result wrapper. No new full-file or full-table
copies in publication bridge.

Static costs, not benchmarks. Compilation, lint, traceability, links,
and evidence preservation recorded in
[campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-control-recovery/README.md).
Later [module campaign](https://github.com/gpicchiarelli/ArcDocDB/blob/13c2eec90a7a80f97f3bd9ded6b62abd75b7cf78/spikes/results/2026-10-14-control-transizione/report.md)
preserves 84 new passing tests, independent review, four-file
coverage, and 216 measurement windows. Limits and unreached forms remain
explicit; these outcomes close neither C1 gate nor Phase 0. The
[measurement method](control-transizione-metodo.md) distinguishes pure
comparison from decoding and disk publication. Outcomes and limits
preserved with producers; full Recovery Manager qualification
remains open.
