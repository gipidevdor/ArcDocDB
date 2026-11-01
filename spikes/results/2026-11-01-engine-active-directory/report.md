# Preallocated ACTIVE metadata in serial M1

M1 now uses a preallocated append-only ACTIVE directory. The managed-heap
allocation counter falls from **750.74 to 79.98 bytes/write (−89.35%)** in all six
4,096-write comparisons. Reads remain comparable in the measured cases.
Durable-write throughput varies in both directions; this increment does not
demonstrate a stable write-speed improvement. Strong durability is unchanged.

## Implementation and ownership

[ADR-0081](../../../docs/adr/0081-active-append-metadata.md) adds an explicit
`:directory-mode :append-only`; generic source factories retain `:persistent`
as their default. M1 selects the new mode with page and PUT capacities equal to
its record limit. Three specialized u32 arrays hold page ends, cumulative PUT
limits and PUT rows. The full array payload is charged before construction:
`8*max-pages + 4 + 24*max-puts` bytes, or `32*max-records + 4` in M1
(2,097,156 bytes at its default 65,536-record bound). Headers and root objects
are outside this payload budget, so it is not an RSS limit.

The sole source writer initializes each new suffix once. Each fresh immutable
root captures its own page/PUT/end bounds; GET never reads the mutable writer
count and cannot authorize an unpublished tail. Existing acquire publication,
FIFO commit processing and EBR/FD lifetime remain in force. Page lookup takes
at most 17 comparisons with a final convergence check. Geometry, captured
bounds, local page neighbors and row spans precede array routing; canonical
source/CSN/size/flags/target/proof verification is shared with the persistent
and CLOSED resolver.

OPEN preflight refuses exhausted capacity before CSN allocation. A known
sealed CSN-order refusal precedes tail mutation and remains healthy. Every
incomplete preparation/adoption exit faults the controller at Archivio scope,
preserves the original error/control transfer, and forbids tail reuse. Each
operation keeps its own CSN/frame/SEAL, with the existing shared group flush
and publication order. RAM/paged transitions retain the same arena; rotation,
compaction and reopen create a fresh source/arena.

The [author review](review.md) records two readings, decision coverage and
residual scope. No disk/wire format, new dependency, read-side shared write,
lock, timer or product syscall was introduced.

## Qualification and identity

The following completed before serial performance measurement:

- Full [SBCL 2.6.9 check-core](full-check-2.6.9/report.lisp) and
  [SBCL 2.6.10 strict product build/tests](strict-2.6.10/report.lisp), with product
  warnings treated as errors. All 177 engine methods pass on each runtime.
- Twelve new focused methods: exact startup quota and invalid mode; OPEN
  refusals without CSN effects; mixed PUT/tombstone/multi-PUT in both formats;
  CSN carry and flags; old roots/future tails; damaged bounds/rows; reused
  tails; healthy sealed-order refusal; error/nonlocal exit/after-adoption
  failure; 65,536-page search extremes; engine backend changes and compaction.
- The existing real group crash matrix passes on the new arena on each
  runtime: 36 scenarios, 108 children and 72 SIGKILLs per runtime, including
  recovery, independent seals and final frontiers.
- [All eleven spikes](spikes-check/report.lisp), evidence/CI self-tests and
  [complete documentation](documentation/report.lisp). Documentation inspects
  556 documents, 1,127 HTML pages and 85,894 links, plus 1,888 docstrings,
  54 packages, 688 bindings and 625 contracts. Original dependency diagnostics
  remain in the raw record. Traceability has 141 requirements, 71 invariants,
  13 FI and 81 ADR with zero errors.

The independent [prefix model](prefix-model.lisp) enumerates **224,213**
three-phase reader schedules, 832 captured roots and 468 incomplete cuts over
eight PUT/tombstone patterns and widths 1/2/3. Its three controls detect early
publication, prefix mutation and missing fault admission. It models SC with
explicit publication, not arbitrary weak memory or physical power loss.

The [identity validator](validate.lisp) verifies that all three baseline
campaigns have the same 1,630 source blobs as the prior qualified group-commit
state, and that all eight final campaigns have identical **1,636** source blobs.
This inventory includes tracked and untracked product, tests, tools and docs;
only result artifacts are excluded. Driver SHA-256 values are checked against
the recorded command output. See [source identity](source-identity.lisp).
The base commit is `418693979c03a5065454aca4b9dc86d71337bbc8`.

## Allocation and performance

The [method](method.md) retains preregistration, the larger-window refinement,
same-code reader comparison and explicitly post-result CPU/flush diagnostic.
Historical before/after engine and Unix drivers are byte-identical to each
other and to the prior group drivers. Timed campaigns ran serially after
functional qualification. Setup, seed writes, full GC and correctness checks
are outside timing; exact CSNs, values and canonical flush counts are checked.
Host external load, thermals and device state are not controlled.

| Campaign | Cases and repetitions | Observation |
|---|---|---|
| Allocation | legacy/resident/paged × width 1/8; 4,096 writes each, before and after | 3,075,024 → 327,600 counter bytes in every case; 16,384 → 0 persistent-builder calls |
| Engine writes | 48 cases × 5 × 128 writes per revision; both formats, 2,048/60,000-byte values, widths 1/2/4/8, three primary profiles | width 1 throughput ratios 0.9317–1.0551; width 8 0.9661–1.0628 |
| Unix writes | 8 cases × 5 × 128 writes per revision; eight clients, both formats, resident/paged, limit 1/8 | throughput ratios 0.9322–1.0559 |
| Same-code reads | 24 cases × ACTIVE/CLOSED × 5 × 2,048 reads = 491,520 reads | ACTIVE ratios 0.9871–1.0160; CLOSED controls 0.9932–1.0072; all 240 allocation counters zero |
| Same-code CPU/flush diagnostic | 16 cells × 5 × 128 strong writes = 10,240 writes | canonical flush accounts for 88.53–98.38% of median sample wall time |

Ratios are append/after divided by persistent/before, from medians of five
repetitions. Full engine/Unix/read tables and raw counts are in
[comparison.lisp](comparison.lisp), derived from
[baseline metrics](baseline-metrics.lisp) and [final metrics](metrics.lisp).
[print-results.lisp](print-results.lisp) reproduces human tables.

The allocation result retains roughly one 80-byte immutable root per write;
it is not zero allocation. The earlier group report's roughly 512-byte values
used 128-operation TLAB counter windows. This larger-window comparison refines
that interpretation without altering earlier samples. It measures managed
allocation, not live heap, RSS or GC-pause distribution.

Reader comparisons select layout only at cold source construction on the same
final product code. ACTIVE contains 128 seeded pages over eight keys, prepared
in sixteen strong groups; 32 warmups precede each read cell. Full bytes are
checked outside timing and status/length/end bytes plus a predicted sink inside.
CLOSED is the compacted control: all requested keys resolve from CLOSED; the
new empty ACTIVE created by compaction uses M1's default arena. At 2,048 bytes,
measured ACTIVE rates are about 460–468k GET/s for legacy/resident and
249–253k for paged (P99 about 3/5 µs); at 60,000 bytes about 59.4k/53.3k
(P99 about 17–18/20 µs). These warm eight-key cases do not qualify a loaded
large-keyspace tail or prove general read equivalence.

The uninstrumented write comparison has both decreases and increases. The
separate [sync diagnostic](sync-diagnostic/report.lisp), aggregated in
[sync-metrics.lisp](sync-metrics.lisp), preserves ordinary strong writes and
measures process CPU plus canonical flush wall time. CPU medians range from
25.30–245.65 µs/write for persistent and 30.64–245.80 for append-only; paired
changes range from −20.71 to +22.55 µs/write. Two resident cases rise by about
21.1% (small-value groups) and 12.0% (large single writes), so no CPU speedup
is claimed. Instrumentation, microsecond timers and host scheduling limit
causal inference. Flush dominance supports prioritizing durability amortization
for throughput; these samples do not establish statistical non-regression or
license weaker durability.

## Retained diagnostics and scope

Original development failures and test variants are retained losslessly:
extra closing parentheses, then two test-oracle corrections for public health
and forbidden root queries after terminal fault. See the
[development review](review.md#development-diagnostics) and explicit
[initial](initial-archive-map.lisp), [final](final-archive-map.lisp) and
[late](late-archive-map.lisp) archive maps. Failed experiments are not substituted
for qualification or removed from the evidence.

The first final lightweight check command selected an unqualified `sbcl` from
the inherited PATH and stopped before lint with a runtime/core identity
mismatch. Its raw diagnostic is retained separately. The final command selects
the same absolute Homebrew 2.6.9 executable and PATH as qualification; no
product change or relaxed check is involved.

The archive utilities copy raw files byte-for-byte, retain SHA-256 receipts and
verify gzip round trips. The final self-recording closure verifies retained
copies against stored bytes or their lossless expansion. Cleanup removes only
this worktree's regenerable builds, spike outputs and exact per-worktree SBCL
cache paths; shared Git storage and other chat/primary checkout paths are
outside its scope. `closure.lisp` and `cleanup.lisp` record those final actions.

This increment qualifies the bounded serial M1 integration and measured local
cases. It does not claim zero allocation, whole-engine C1/MC/DC certification,
independent external review, arbitrary writer concurrency, RSS limits,
GC-pause improvement or physical-power-loss testing.
