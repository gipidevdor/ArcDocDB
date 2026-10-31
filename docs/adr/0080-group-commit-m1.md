# ADR-0080 — Bounded strong group commit in serial M1

- **Status:** Accepted for incremental integration under the author's instruction.
- **Date:** 2026-10-31
- **References:** [ADR-0019](0019-durability-e-group-commit-pipelined.md),
  [ADR-0037](0037-lotto-sigillato.md), [M1](../implementazione/production-engine-bootstrap.md),
  REQ-WAL-002/005/006, REQ-MVC-008, REQ-IDX-005/011/012/013, INV-A2 and INV-P6.

## Decision

Connect the existing multi-batch WAL group and Serie planned-root FIFO to one
serial M1 admission. Up to eight independent operations keep separate ordinary
frames, CSNs and SEALs. Exactly one strong flush covers their contiguous bytes;
roots, token resolutions and current locations are published in FIFO order only
after that flush. Each SEAL remains its operation's durable atomicity point.
The group introduces no all-or-nothing transaction or weaker acknowledgment.

`crea-operazione-scrittura` constructs a borrowed immutable PUT/DELETE descriptor.
`scrivi-gruppo-documenti` takes a stable simple vector, exclusive u64 output and
an optional prefix count. Output CSNs are copied after all publications and
reuse succeed. A failure after admission faults the engine without output or
retry; recovery may preserve a sealed prefix. No caller bytes or retired
resident root are retained after the request exits.

Before the first data CSN, reserve aggregate ACTIVE bytes/count, FIFO/token/
counter headroom, resident live peaks/append-only arena/revision/slot credits,
legacy distinct-key delta membership, and worst-case paged mutation appends.
Repeated PUTs reuse membership until DELETE makes a subsequent PUT new.
Automatic growth/split restarts the complete bounded projection; quota pressure
selects the paged backend before sealing. At most one legacy renewal covers all
distinct group keys. The same logical API serves both backends.

For potential new resident slots, inspect complete probe groups until at least
N initial EMPTY/DELETED candidates have been checked, or the entire fragment.
At most N−1 earlier operations can consume those candidates. Slots introduced
by earlier deletions are among separately checked initial key slots. Checking
the whole last probe group also covers DELETED preference over EMPTY. Every
possible target retains N writes of seqlock credit; publication still uses the
original checked mutators. Cumulative counts/arena needs are exact; slot credit
reservation is deliberately conservative. No projection mutates the live index.

The Unix actor collects only complete already-ready validated writes from its
current bounded pass, preserving slot order. Reads, PING and rejections drain
prior writes. Expired requests are removed before admission; no batching timer
or implicit wire batch is added. A single ready write uses the existing API.
The library's `:max-write-group` defaults to 8 (domain 1..8); 1 provides the same
service with individual admissions. Only a known pre-admission group capacity
refusal may split into individual requests. Post-admission failures and response
encoding failures never trigger repetition.

## Resources and verification

Each ACTIVE owns eight fixed one-record batches and bounded scratch/event
arrays, in addition to existing engine buffers; seven extra batch payloads cost
`7 * (max-record-bytes + seal-bytes)`. They are separate from the primary-index
and optional record-cache grants, not an RSS claim. Rotation creates new
file-bound batch identities. Existing v1/v2 disk formats and wire opcodes remain.

[Method and evidence](../../spikes/results/2026-10-31-engine-group-commit/report.md)
cover cumulative refusal without data effects, repeated keys, DELETE/PUT mixtures,
legacy renewal, growth/paging/return, rotation/compaction/recovery, deadlines,
read barriers and no retry after uncertainty. A reduced finite slot model
supplements SPK-07. Real SIGKILL covers prepared tokens, complete append prefixes,
partial SEAL, strong flush and partial/full memory publication for both formats
and every primary profile. Broader concurrency, loaded tail and physical power
loss qualification remain separate; no spike implementation becomes product code.
